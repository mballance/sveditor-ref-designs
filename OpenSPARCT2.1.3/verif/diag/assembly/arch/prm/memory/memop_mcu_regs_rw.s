/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: memop_mcu_regs_rw.s
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
#include "mcu_defines.h"

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:
	ta	T_CHANGE_HPRIV

	! DRAM_CAS_ADDR_WIDTH_REG
L1:	
	setx	DRAM_CAS_ADDR_WIDTH_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! DRAM_RAS_ADDR_WIDTH_REG
L2:
	setx	DRAM_RAS_ADDR_WIDTH_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! DRAM_CAS_LAT_REG
L3:
	setx	DRAM_CAS_LAT_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! DRAM_SCRUB_FREQ_REG
L4:
	setx	DRAM_SCRUB_FREQ_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! DRAM_REFRESH_FREQ_REG
L5:
	setx	DRAM_REFRESH_FREQ_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! DRAM_OPEN_BANK_MAX_REG
L6:
	setx	DRAM_OPEN_BANK_MAX_REG, %g1, %g2
	setx	8192, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! DRAM_REFRESH_COUNTER_REG
L7:
	setx	DRAM_REFRESH_COUNTER_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! DRAM_SCRUB_ENABLE_REG
L8:
	setx	DRAM_SCRUB_ENABLE_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! DRAM_PROG_TIME_CNTR_REG
L9:
	setx	DRAM_PROG_TIME_CNTR_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! DRAM_TRRD_REG
L10:
	setx	DRAM_TRRD_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! DRAM_TRC_REG
L11:
	setx	DRAM_TRC_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! DRAM_TRCD_REG
L12:
	setx	DRAM_TRCD_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! DRAM_TWTR_REG
L13:
	setx	DRAM_TWTR_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! DRAM_TRTW_REG
L14:
	setx	DRAM_TRTW_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! DRAM_TRTP_REG
L15:
	setx	DRAM_TRTP_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! DRAM_TRAS_REG
L16:
	setx	DRAM_TRAS_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! DRAM_TRP_REG
L17:
	setx	DRAM_TRP_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! DRAM_TWR_REG
L18:
	setx	DRAM_TWR_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! DRAM_TRFC_REG
L19:
	setx	DRAM_TRFC_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! DRAM_TMRD_REG
L20:
	setx	DRAM_TMRD_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! DRAM_TIWTR_REG
L21:
	setx	DRAM_TIWTR_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! DRAM_PRECHARGE_WAIT_REG
L22:
	setx	DRAM_PRECHARGE_WAIT_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! DRAM_DIMM_STACK_REG
L23:
	setx	DRAM_DIMM_STACK_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! DRAM_EXT_WR_MODE2_REG
L24:
	setx	DRAM_EXT_WR_MODE2_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! DRAM_EXT_WR_MODE1_REG
L25:
	setx	DRAM_EXT_WR_MODE1_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! DRAM_EXT_WR_MODE3_REG
L26:
	setx	DRAM_EXT_WR_MODE3_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! DRAM_8_BANK_MODE_REG
L27:
	setx	DRAM_8_BANK_MODE_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! DRAM_CHANNEL_DISABLED_REG
L29:
	setx	DRAM_CHANNEL_DISABLED_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! DRAM_SEL_LO_ADDR_BITS_REG
L30:
	setx	DRAM_SEL_LO_ADDR_BITS_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! DRAM_DIMM_INIT_REG
L31:
	setx	DRAM_DIMM_INIT_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! DRAM_DIMM_PRESENT_REG
L35:
	setx	DRAM_DIMM_PRESENT_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! DRAM_FAILOVER_STATUS_REG
L36:
	setx	DRAM_FAILOVER_STATUS_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! DRAM_FAILOVER_MASK_REG
L37:
	setx	DRAM_FAILOVER_MASK_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! DRAM_DEBUG_TRIG_ENABLE_REG
L38:
	setx	DRAM_DEBUG_TRIG_ENABLE_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! DRAM_ERROR_STATUS_REG
L38b:

	setx	DRAM_ERROR_STATUS_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! DRAM_ERROR_ADDR_REG
L39:
	setx	DRAM_ERROR_ADDR_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! DRAM_ERROR_INJECT_REG
L40:
	setx	DRAM_ERROR_INJECT_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! DRAM_ERROR_COUNTER_REG
L41:
	setx	DRAM_ERROR_COUNTER_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! DRAM_ERROR_LOCATION_REG
L42:
	setx	DRAM_ERROR_LOCATION_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! DRAM_PERF_CTL_REG
L43:
	setx	DRAM_PERF_CTL_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! DRAM_PERF_COUNT_REG
L44:
	setx	DRAM_PERF_COUNT_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! FBD_CHANNEL_STATE_REG
L45:
	setx	FBD_CHANNEL_STATE_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! FAST_RESET_FLAG_REG
L46:
	setx	FAST_RESET_FLAG_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! CHANNEL_RESET_REG
L47:
	setx	CHANNEL_RESET_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! TS1_SB_NB_MAPPING_REG
L48:
	setx	TS1_SB_NB_MAPPING_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! TS1_TEST_PARAMETER_REG
L49:
	setx	TS1_TEST_PARAMETER_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! TS3_FAILOVER_CONFIG_REG
L50:
	setx	TS3_FAILOVER_CONFIG_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! DISABLE_STATE_PERIOD_REG
L52:
	setx	DISABLE_STATE_PERIOD_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! CALIBRATE_STATE_PERIOD_REG
L54:
	setx	CALIBRATE_STATE_PERIOD_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! TRAINING_STATE_MIN_TIME_REG
L56:
	setx	TRAINING_STATE_MIN_TIME_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! TRAINING_STATE_DONE_REG
L57:
	setx	TRAINING_STATE_DONE_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! TRAINING_STATE_TIMEOUT_REG
L58:
	setx	TRAINING_STATE_TIMEOUT_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! TESTING_STATE_DONE_REG
L59:
	setx	TESTING_STATE_DONE_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! TESTING_STATE_TIMEOUT_REG
L60:
	setx	TESTING_STATE_TIMEOUT_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! POLLING_STATE_DONE_REG
L61:
	setx	POLLING_STATE_DONE_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! POLLING_STATE_TIMEOUT_REG
L62:
	setx	POLLING_STATE_TIMEOUT_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! CONFIG_STATE_DONE_REG
L63:
	setx	CONFIG_STATE_DONE_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! CONFIG_STATE_TIMEOUT_PERIOD_REG
L64:
	setx	CONFIG_STATE_TIMEOUT_PERIOD_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! DRAM_PER_RANK_CKE_REG
L65:
	setx	DRAM_PER_RANK_CKE_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! LOS_DURATION_REG
L66:
	setx	LOS_DURATION_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! SYNC_FRAME_FREQ_REG
L67:
	setx	SYNC_FRAME_FREQ_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! CHANNEL_READ_LATENCY_REG
L68:
	setx	CHANNEL_READ_LATENCY_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! LOOPBACK_MODE_CTRL_REG
L70:
	setx	LOOPBACK_MODE_CTRL_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! SERDES_CONFIG_BUS_REG
L71:
	setx	SERDES_CONFIG_BUS_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! SERDES_XMT_RCV_DIFF_INV_REG
L72:
	setx	SERDES_XMT_RCV_DIFF_INV_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! MCU_SYNDROME_REG
L73:
	setx	MCU_SYNDROME_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! INJ_ERR_SOURCE_REG
L74:
	setx	INJ_ERR_SOURCE_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! MCU_FBR_COUNT_REG
L75:
	setx	MCU_FBR_COUNT_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]


test_passed:
	EXIT_GOOD

test_failed:
	EXIT_BAD


/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
.end



