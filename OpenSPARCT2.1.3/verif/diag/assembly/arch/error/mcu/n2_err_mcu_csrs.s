/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_err_mcu_csrs.s
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


#define	 DRAM_ERR_STAT_REG0     0x8400000280
#define	 DRAM_ERR_ADDR_REG0	0x8400000288
#define	 DRAM_ERR_INJ_REG0	0x8400000290
#define	 DRAM_ERR_CNT_REG0	0x8400000298
/**
!#define	 DRAM_ERR_FBD_REG0	0x84000002a8
!changed in PRM v 0.9
**/

#define	 DRAM_ERR_FBD_REG0	0x8400000c00   
#define	 DRAM_ERR_LOC_REG0	0x84000002a0



#include "hboot.s"
#include "asi_s.h"
#include "err_defines.h"


.text
.global	 main


main:
  ta	  T_CHANGE_HPRIV

DRAM_stat_0:
  setx	0xffffffffffffffff, %l0, %g7
  setx	DRAM_ERR_STAT_REG0, %l3, %g5

  stx	%g7, [%g5]
  ldx	[%g5], %i0

  setx	0xffff, %12, %o0    ! <15:0> = Address -> (RW)
  cmp	%i0, %o0
  bne	%xcc, test_fail
  nop



DRAM_err_addr_reg_0:
  setx	DRAM_ERR_ADDR_REG0, %l3, %g5

  ldx	[%g5], %i1

  stx	%g7, [%g5]
  ldx	[%g5], %i2

  stx	%i1, [%g5]			! store back original value

  setx	0xfffffffff0, %l3, %o2	! <39:4> = Address -> (RW)
  cmp	%i2, %o2
  bne	%xcc, test_fail
  nop


DRAM_inj_0:
  setx	DRAM_ERR_INJ_REG0, %l3, %g5

  ldx	[%g5], %i1

  stx	%g7, [%g5]
  ldx	[%g5], %i3

  stx	%i1, [%g5]			! store back original value

  setx	0xc000ffff, %13, %o3	! <15:0> , <31:30> = Address -> (RW)
  cmp	%i3, %o3
  bne	%xcc, test_fail
  nop


DRAM_fbd_0:
  setx	DRAM_ERR_FBD_REG0, %l3, %g5

  ldx	[%g5], %i1

  stx	%g7, [%g5]
  ldx	[%g5], %i4

  stx	%i1, [%g5]			! store back original value

  setx	0x800000003fffffff, %13, %o4	! <2:0> , [63] = Address -> (RW)
  cmp	%i4, %o4
  bne	%xcc, test_fail
  nop


DRAM_cnt_0:
  setx	DRAM_ERR_CNT_REG0, %l3, %g5

  ldx	[%g5], %i1

  stx	%g7, [%g5]
  ldx	[%g5], %i5

  stx	%i1, [%g5]			! store back original value

  setx	0xffff, %13, %o5	! <15:0> = Address -> (RW)
  cmp	%i5, %o5
  bne	%xcc, test_fail
  nop

DRAM_loc_0:
  setx	DRAM_ERR_LOC_REG0, %l3, %g5

  ldx	[%g5], %i1

  stx	%g7, [%g5]
  ldx	[%g5], %i6

  stx	%i1, [%g5]			! store back original value

  setx	0xfffffffff, %13, %o6	! <35:0> = Address -> (RW)
  cmp	%i6, %o6
  bne	%xcc, test_fail
  nop

ba test_pass
nop


/******************************************************
 * Exit code
 *******************************************************/

test_pass:
ta  T_GOOD_TRAP


test_fail:
ta  T_BAD_TRAP


