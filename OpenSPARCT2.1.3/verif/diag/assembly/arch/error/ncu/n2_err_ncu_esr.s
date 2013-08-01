/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_err_ncu_esr.s
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


#define	SOC_ESR_REG	 0x8000003000
#define SOC_ELE_REG      0x8000003008
#define SOC_EIE_REG      0x8000003010
#define SOC_EJR_REG      0x8000003018
#define SOC_FEE_REG      0x8000003020
#define SOC_PER_REG      0x8000003028
#define SOC_SII_SYN_REG  0x8000003030
#define SOC_NCU_SYN_REG  0x8000003038


#include "hboot.s"
#include "asi_s.h"
#include "err_defines.h"


.text
.global	 main


main:
  ta	  T_CHANGE_HPRIV

soc_err_stat_reg:
  setx	0xffffffffffffffff, %l7, %g7
  setx	SOC_ESR_REG, %l7, %g5

soc_err_stat_reg_por:
  ldx   [%g5], %i1

  cmp   %i1, %g0
  bne   %xcc, test_fail
  nop

soc_err_stat_reg_ones:
  stx	%g7, [%g5]
  ldx	[%g5], %i0

  setx  0x8000076dbeffffff, %l7, %i2   ! <39, 36, 33, 30, 24> => Reserved

  cmp	%i0, %i2
  bne	%xcc, test_fail
  nop

soc_err_stat_reg_zeros:
  stx   %g0, [%g5]
  ldx   [%g5], %i0

  cmp   %i0, %g0
  bne   %xcc, test_fail
  nop



/******************************************************
 * Exit code
 *******************************************************/

test_pass:
EXIT_GOOD

test_fail:
EXIT_BAD

