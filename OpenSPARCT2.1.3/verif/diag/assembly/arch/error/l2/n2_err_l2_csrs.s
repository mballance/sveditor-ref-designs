/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_err_l2_csrs.s
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

!#ifdef L20 

#define  L2_ERR_ENB_REG0   	0xAA00000000
#define  L2_ERR_ENB_REG1   	0xBA00000000
#define  L2_ERR_STAT_REG0 	0xAB00000000
#define  L2_ERR_STAT_REG1  	0xBB00000000
#define  L2_ERR_ADDR_REG0  	0xAC00000000
#define  L2_ERR_ADDR_REG1  	0xBC00000000
#define  L2_ERR_NDT_REG0  	0xAE00000000
#define  L2_ERR_NDT_REG1  	0xBE00000000
#define  L2_ERR_INJ_REG0   	0xAD00000000
#define  L2_ERR_INJ_REG1   	0xBD00000000

!#endif


#include "hboot.s"
#include "asi_s.h"
#include "err_defines.h"


.text
.global  main


main:
  ta      T_CHANGE_HPRIV

L2_enb_0:
  setx  0xffffffffffffffff, %l0, %g7
  setx  L2_ERR_ENB_REG0, %l3, %g5  

  stx   %g7, [%g5]
  ldx 	[%g5], %i0

  set	0x7, %o0    ! <2:0> = Address -> (RW)
  cmp   %i0, %o0
  bne   %xcc, test_fail
  nop

  stx	%i0, [%g5]

L2_stat_0:
  setx  L2_ERR_STAT_REG0, %l3, %g5  

  stx	%g7, [%g5]
  ldx	[%g5], %i0

  setx	0x3fc000000fffffff, %12, %o0   ! <61:54> , <27:0> = Address -> (RW)
  cmp	%i0, %o0
  bne	%xcc, test_fail
  nop



L2_err_addr_reg_0:
 ! setx	0x00000000ffffffff, %l1, %g6
  setx	L2_ERR_ADDR_REG0, %l3, %g5

  ldx	[%g5], %i1

  stx	%g7, [%g5]
  ldx	[%g5], %i0

  stx	%i1, [%g5]			! store back original value

  setx	0xfffffffff0, %l3, %o0		! <39:4> = Address -> (RW)
  cmp	%i0, %o0
  bne	%xcc, test_fail
  nop


L2_ndt_0:
!  setx	0xffffffffffffffff, %l2, %g8
  setx	L2_ERR_NDT_REG0, %l3, %g5

  stx	%g7, [%g5]
  ldx	[%g5], %i0

  setx	0x43ffffffffff0, %13, %o0	   ! <2:0> = Address -> (RW)
  cmp	%i0, %o0
  bne	%xcc, test_fail
  nop


L2_inj_0:
  setx	L2_ERR_INJ_REG0, %l3, %g5

  ldx	[%g5], %i1

  stx	%g7, [%g5]
  ldx	[%g5], %i0

  set	0x3, %o0    ! <2:0> = Address -> (RW)
  cmp	%i0, %o0
  bne	%xcc, test_fail
  nop

  stx	%i1, [%g5]			! store back original value

ba test_pass
nop


/******************************************************
 * Exit code
 *******************************************************/

test_pass:
EXIT_GOOD

test_fail:
EXIT_BAD


