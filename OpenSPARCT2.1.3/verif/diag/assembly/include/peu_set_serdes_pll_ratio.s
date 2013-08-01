/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: peu_set_serdes_pll_ratio.s
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
#include "ccu_defines.h"
#include "peu_defines.h"

#define PEU_SERDES_PLL_MPY__100MHZ	7
#define PEU_SERDES_PLL_MPY__125MHZ	5
#define PEU_SERDES_PLL_MPY__250MHZ	1


#ifdef PCIE_REF_CLK_100
peu_set_target_pcie_ref_clk_100MHz:
	mov	PEU_SERDES_PLL_MPY__100MHZ, %g4
#else
#ifdef PCIE_REF_CLK_125
peu_set_target_pcie_ref_clk_125MHz:
	mov	PEU_SERDES_PLL_MPY__125MHZ, %g4
#else
#ifdef PCIE_REF_CLK_250
peu_set_target_pcie_ref_clk_250MHz:
	mov	PEU_SERDES_PLL_MPY__250MHZ, %g4
#endif /* PCIE_REF_CLK_250 */
#endif /* PCIE_REF_CLK_125 */
#endif /* PCIE_REF_CLK_100 */
#if defined(PCIE_REF_CLK_100) || defined(PCIE_REF_CLK_125) || defined(PCIE_REF_CLK_250)
peu_check_serdes_pll_ratio:
	best_set_reg(FIRE_PLC_TLU_CTB_TLR_CSR_A_SERDES_PLL_ADDR, %g2, %g3)
	ldx	[%g3], %g5
	sub	%g5, %g4, %g5
	brz	%g5, peu_serdes_pll_ratio_already_set
	nop
peu_set_serdes_pll_ratio:
	stx	%g4, [%g3]		! set mpy field for 100Mhz refclk
	! do a warm reset to activate the new value, per PRM 16.6.6
        setx    RESET_GEN, %g2, %g5	! warm reset reg
        add     %g0, 0x1, %g7		! warm reset reg data
peu_kick_wmr_for_serdes_pll_ratio_change:
        stx     %g7, [%g5]		! Warm Reset
        ldx     [%g5], %g7		! Force a delay to wait for WMR

peu_serdes_pll_ratio_already_set:
#endif /*defined(PCIE_REF_CLK_100) || defined(PCIE_REF_CLK_125) || defined(PCIE_REF_CLK_250)*/
