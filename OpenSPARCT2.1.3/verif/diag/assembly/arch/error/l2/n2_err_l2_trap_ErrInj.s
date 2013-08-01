/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_err_l2_trap_ErrInj.s
* Copyright (C) 1995-2007 Sun Microsystems, Inc. All Rights Reserved
* 4150 Network Circle, Santa Clara, California 95054, U.S.A.
*
* DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER. 
*
* This program is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation; version 2 of the License.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program; if not, write to the Free Software
* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*
* For the avoidance of doubt, and except that if any non-GPL license 
* choice is available it will apply instead, Sun elects to use only 
* the General Public License version 2 (GPLv2) at this time for any 
* software where a choice of GPL license versions is made 
* available with the language indicating that GPLv2 or any later version 
* may be used, or where a choice of which version of the GPL is applied is 
* otherwise unspecified. 
*
* Please contact Sun Microsystems, Inc., 4150 Network Circle, Santa Clara, 
* CA 95054 USA or visit www.sun.com if you need additional information or 
* have any questions. 
*
* 
* ========== Copyright Header End ============================================
*/
#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO


#include "hboot.s"
#include "asi_s.h"

#define L2_ES_W1C_VALUE     0xc03ffff800000000
#define  TT_SW_Error        0x40
#define  TT_HW_Error        0x63
#define  TT_DA_Error        0x32

#define L2_ADDR 0x0020134000

#ifdef L2_0
#define		L2_ADDR		0x22000000
#define         L2_ADDR_2       0x44000000
#endif

#ifdef L2_1
L2_ADDR         22000040
#endif

#ifdef L2_2
L2_ADDR         22000080
#endif

#ifdef L2_3
L2_ADDR         220000c0
#endif

#ifdef L2_4
L2_ADDR         22000100
#endif

#ifdef L2_5
L2_ADDR         22000140
#endif

#ifdef L2_6
L2_ADDR         22000180
#endif

#ifdef L2_7
L2_ADDR         220001c0
#endif


#ifdef L2_OFF
#define L2_ON_OFF_DM	0x1
#else
#define L2_ON_OFF_DM    0x0
#endif
 
.text
.global	 main


main:
	ta	  T_CHANGE_HPRIV

disable_l1_DCache:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  ! Remove bit 2
  andn  %l0, 0x2, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL

enable_err_reporting:
  setx L2EE_PA0, %l0, %l1
  ldx  [%l1], %l2
  mov  0x3, %l0
  or   %l2, %l0, %l2
  stx  %l2, [%l1]

clear_l2_ESR:
  setx  L2_ES_W1C_VALUE, %l0, %l1
  setx  L2ES_PA0, %l6, %g1
  stx   %l1, [%g1]

L2_Init:
	set     0x55555555,%g2
	set	L2_ADDR, %g1
L2_ld:
	stx     %g2,  [%g1]
	stx     %g2,  [%g1+8]
	membar #Sync
        ldx     [%g1], %g5
        ldx     [%g1+8], %g5
	membar #Sync
L2_ld_1:
	add	%g1, 0x200, %g1
        stx     %g2,  [%g1]
        stx     %g2,  [%g1+8]
        membar #Sync
        ldx     [%g1], %g5
        ldx     [%g1+8], %g5
	membar #Sync

nop
nop
nop
nop

check_sw_err_trap:
  ! Check if a Software Recoverable Error Trap happened
  set   EXECUTED, %l0
  cmp   %o0, %l0
  bne   test_fail
  nop
#ifdef LDAC
  mov   TT_SW_Error, %l0
#endif
#ifdef LDAU
  mov   TT_DA_Error, %l0
#endif
#ifdef LVC
  mov   TT_HW_Error, %l0
#endif

  cmp   %o1, %l0
  bne   test_fail
  nop

compute_error:
  mov   0x1, %l1
#ifdef LDAC
  sllx  %l1, L2ES_LDAC, %l7
#endif
#ifdef LDAU
  sllx  %l1, L2ES_LDAU, %l7
#endif
#ifdef LVC
  sllx  %l1, L2ES_LVC, %l7
#endif

  sllx  %l1, L2ES_VEC, %l3
  or    %l7, %l3, %l7
!  sllx  %l1, L2ES_MEC, %l3
!  or    %l7, %l3, %l7
  membar #Sync


check_l2_ESR:
  setx  L2ES_PA0, %l6, %g1
  ldx   [%g1], %l4
  membar #Sync
  setx  0xfffffffc00000000,%l0,%l2
  and   %l2,%l4,%l4

verify_ESR:
  cmp   %l7,  %l4                ! l7 has expected value l4 has actual value
  bne test_fail
  nop

ba test_pass
nop

/*******************************************************
 * Exit code
 *******************************************************/

test_pass:
ta  T_GOOD_TRAP

test_fail:
ta  T_BAD_TRAP

