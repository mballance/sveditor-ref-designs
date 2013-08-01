/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: allcores_allbanks.s
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
#define MAIN_PAGE_HV_ALSO


#define  TEST_DATA1         0x5555555555555555
#define  L2_ENTRY_PA0       0x2020000008
#define L2_ES_W1C_VALUE     0xc03ffff800000000
#define  SPARC_ES_W1C_VALUE 0xefffffff
#define  TT_SW_Error        0x40

#include "hboot.s"
#include "asi_s.h"
#include "err_defines.h"


    
#define MAIN_PAGE_NUCLEUS_ALSO

	
/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:
	ta	T_CHANGE_HPRIV

	! Initialize the global registers.
	mov	%g0, %g1	
	mov	%g0, %g2
	mov	%g0, %g3
	mov	%g0, %g4
	mov	%g0, %g5
	mov	%g0, %g6
	mov	%g0, %g7

	! Set up seperate result data area for each core.
	ta	T_RD_THID
	mov	%o1, %l6
	umul	%l6, 64, %l7
	setx	result_area, %g1, %g3
	add	%l7, %g3, %l7

	! All threads use the same code.

disable_l1_DCache:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  ! Remove bit 2
  andn  %l0, 0x2, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL


clear_l2_ESR:
  setx  L2_ES_W1C_VALUE, %l0, %l1
  setx  L2ES_PA0, %l6, %g1
  stx   %l1, [%g1]


set_L2_Directly_Mapped_Mode:
  setx  L2CS_PA0, %l6, %g1      ! Bit 1 in L2 Control Status Register
  mov   0x2, %l0
  stx   %l0, [%g1]

store_to_L2:
  setx  TEST_DATA1, %l0, %g5

store_to_L2_Bank0:
  setx	0x20000000, %l0, %g2  ! bits [8:6] select Bank
  stx %g5, [%g2] 
  stx %g5, [%g2+8]
  membar #Sync
  ldx [%g2], %g3
  ldx [%g2+8], %g4
  membar #Sync
  cmp %g4,%g5
  bne test_fail
  nop

store_to_L2_Bank1:
  setx  0x20000040, %l0, %g2  ! bits [8:6] select Bank
  stx %g5, [%g2]
  stx %g5, [%g2+8]
  membar #Sync
  ldx [%g2], %g3
  ldx [%g2+8], %g4
  membar #Sync
  cmp %g4,%g5
  bne test_fail
  nop

store_to_L2_Bank2:
  setx  0x20000080, %l0, %g2  ! bits [8:6] select Bank
  stx %g5, [%g2]
  stx %g5, [%g2+8]
  membar #Sync
  ldx [%g2], %g3
  ldx [%g2+8], %g4
  membar #Sync
  cmp %g4,%g5
  bne test_fail
  nop

store_to_L2_Bank3:
  setx  0x200000c0, %l0, %g2  ! bits [8:6] select Bank
  stx %g5, [%g2]
  stx %g5, [%g2+8]
  membar #Sync
  ldx [%g2], %g3
  ldx [%g2+8], %g4
  membar #Sync
  cmp %g4,%g5
  bne test_fail
  nop

store_to_L2_Bank4:
  setx  0x20000100, %l0, %g2  ! bits [8:6] select Bank
  stx %g5, [%g2]
  stx %g5, [%g2+8]
  membar #Sync
  ldx [%g2], %g3
  ldx [%g2+8], %g4
  membar #Sync
  cmp %g4,%g5
  bne test_fail
  nop

store_to_L2_Bank5:
  setx  0x20000140, %l0, %g2  ! bits [8:6] select Bank
  stx %g5, [%g2]
  stx %g5, [%g2+8]
  membar #Sync
  ldx [%g2], %g3
  ldx [%g2+8], %g4
  membar #Sync
  cmp %g4,%g5
  bne test_fail
  nop

store_to_L2_Bank6:
  setx  0x20000180, %l0, %g2  ! bits [8:6] select Bank
  stx %g5, [%g2]
  stx %g5, [%g2+8]
  membar #Sync
  ldx [%g2], %g3
  ldx [%g2+8], %g4
  membar #Sync
  cmp %g4,%g5
  bne test_fail
  nop

store_to_L2_Bank7:
  setx  0x200001c0, %l0, %g2  ! bits [8:6] select Bank
  stx %g5, [%g2]
  stx %g5, [%g2+8]
  membar #Sync
  ldx [%g2], %g3
  ldx [%g2+8], %g4
  membar #Sync
  cmp %g4,%g5
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
nop


user_text_end:


/************************************************************************
 *  Test case data start
 ************************************************************************/

SECTION       .DATA DATA_VA=0x70000000
attr_data {
      Name = .DATA,
      hypervisor,
      compressimage
}

.data
.global	result_area
.global	alias1
.global	alias2
.global	alias3
.global	alias4
.global	alias5
.global	alias6
.global	alias7
.global	alias8
.global	alias9
.global	alias10
.global	alias11
.global	alias12
.global	alias13
.global	alias14
.global	alias15
.global	alias16

user_data_start:
result_area:
	.skip	512		! 64 bytes per core

	.align	0x40000		! each 246kb, 0x40000, aliases to same L2$ line
alias1:
	.skip	1024
	.align	0x40000
alias2:
	.skip	1024
	.align	0x40000
alias3:
	.skip	1024
	.align	0x40000
alias4:
	.skip	1024
	.align	0x40000
alias5:
	.skip	1024
	.align	0x40000
alias6:
	.skip	1024
	.align	0x40000
alias7:
	.skip	1024
	.align	0x40000
alias8:
	.skip	1024
	.align	0x40000
alias9:
	.skip	1024
	.align	0x40000
alias10:
	.skip	1024
	.align	0x40000
alias11:
	.skip	1024
	.align	0x40000
alias12:	
	.skip	1024
	.align	0x40000
alias13:
	.skip	1024
	.align	0x40000
alias14:
	.skip	1024
	.align	0x40000
alias15:
	.skip	1024
	.align	0x40000
alias16:
	.skip	1024

user_data_end:
.end
