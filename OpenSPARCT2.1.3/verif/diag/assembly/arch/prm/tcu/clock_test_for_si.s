/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: clock_test_for_si.s
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
#define PLL_CTL__PA                     0x8300000000
#define PLL_CTL__PLL_CHAR_IN__POS       33
#define DBG_CONFIG__PA                  0x8600000000
#define DBG_CONFIG__PEU_DBG_CLK         0x800000000000000b
#define DBG_CONFIG__NIU_DBG_CLK__TXC    0x8000000000000229
#define DBG_CONFIG__NIU_DBG_CLK__TDMC   0x8000000000000249
#define DBG_CONFIG__NIU_DBG_CLK__RDMC   0x8000000000000269
#define DBG_CONFIG__NIU_DBG_CLK__ZCP    0x8000000000000289
#define DBG_CONFIG__NIU_DBG_CLK__IPP    0x80000000000002a9
#define DBG_CONFIG__NIU_DBG_CLK__FFLP   0x80000000000002c9
#define DBG_CONFIG__NIU_DBG_CLK__PIO    0x80000000000002e9
#define DBG_CONFIG__NIU_DBG_CLK__MAC    0x8000000000000309
#define DBG_CONFIG__NIU_DBG_CLK__META   0x8000000000000349
#define DBG_CONFIG__NIU_DBG_CLK__SMX    0x8000000000000369
#-------------

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#include "hboot.s"
#include "asi_s.h"

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:
	ta      T_CHANGE_HPRIV

test_pll_char_out:        !!! pulse PLL_CTL.PLL_CHAR_IN bit
	setx PLL_CTL__PA, %g1, %g2
	ldx [%g2], %g3
	setx 1, %g1, %g4
	sllx %g4, PLL_CTL__PLL_CHAR_IN__POS, %g4
	or %g3, %g4, %g5
	stx %g5, [%g2]      !!! PLL_CTL.set PLL_CHAR_IN bit to 1
	membar #Sync
	setx 5, %g1, %g6    !!! run some cycles
1:
	add %g0, %g0, %g0
	dec %g6
	brnz %g6, 1b
	nop
	stx %g3, [%g2]      !!! set PLL_CTL.PLL_CHAR_IN bit to 0
	membar #Sync

test_peu_debug_clk:    !!! test PEU debug clock which is pkg pin DBG_DQ[91]
	setx DBG_CONFIG__PA, %g1, %g2
	setx DBG_CONFIG__PEU_DBG_CLK, %g3, %g4
	stx %g4,[%g2]
	membar #Sync
	setx 100, %g1, %g2  !!! run some cycles
1:
	add %g0, %g0, %g3
	dec  %g2
	brnz %g2, 1b
	nop

test_niu_debug_clk_TXC:    !!! test NIU debug clocks which are DBG_DQ[125:124 pkg pins
	setx DBG_CONFIG__PA, %g1, %g2
	setx DBG_CONFIG__NIU_DBG_CLK__TXC, %g3, %g4
	stx %g4,[%g2]
	membar #Sync
	setx 100, %g1, %g2  !!! run some cycles
1:
	add %g0, %g0, %g3
	dec  %g2
	brnz %g2, 1b
	nop

test_niu_debug_clk_TDMC:    !!! test NIU debug clocks which are DBG_DQ[125:124 pkg pins
	setx DBG_CONFIG__PA, %g1, %g2
	setx DBG_CONFIG__NIU_DBG_CLK__TDMC, %g3, %g4
	stx %g4,[%g2]
	membar #Sync
	setx 100, %g1, %g2  !!! run some cycles
1:
	add %g0, %g0, %g3
	dec  %g2
	brnz %g2, 1b
	nop

test_niu_debug_clk_RDMC:    !!! test NIU debug clocks which are DBG_DQ[125:124 pkg pins
	setx DBG_CONFIG__PA, %g1, %g2
	setx DBG_CONFIG__NIU_DBG_CLK__RDMC, %g3, %g4
	stx %g4,[%g2]
	membar #Sync
	setx 100, %g1, %g2  !!! run some cycles
1:
	add %g0, %g0, %g3
	dec  %g2
	brnz %g2, 1b
	nop

test_niu_debug_clk_ZCP:    !!! test NIU debug clocks which are DBG_DQ[125:124 pkg pins
	setx DBG_CONFIG__PA, %g1, %g2
	setx DBG_CONFIG__NIU_DBG_CLK__ZCP, %g3, %g4
	stx %g4,[%g2]
	membar #Sync
	setx 100, %g1, %g2  !!! run some cycles
1:
	add %g0, %g0, %g3
	dec  %g2
	brnz %g2, 1b
	nop

test_niu_debug_clk_IPP:    !!! test NIU debug clocks which are DBG_DQ[125:124 pkg pins
	setx DBG_CONFIG__PA, %g1, %g2
	setx DBG_CONFIG__NIU_DBG_CLK__IPP, %g3, %g4
	stx %g4,[%g2]
	membar #Sync
	setx 100, %g1, %g2  !!! run some cycles
1:
	add %g0, %g0, %g3
	dec  %g2
	brnz %g2, 1b
	nop

test_niu_debug_clk_FFLP:    !!! test NIU debug clocks which are DBG_DQ[125:124 pkg pins
	setx DBG_CONFIG__PA, %g1, %g2
	setx DBG_CONFIG__NIU_DBG_CLK__FFLP, %g3, %g4
	stx %g4,[%g2]
	membar #Sync
	setx 100, %g1, %g2  !!! run some cycles
1:
	add %g0, %g0, %g3
	dec  %g2
	brnz %g2, 1b
	nop

test_niu_debug_clk_PIO:    !!! test NIU debug clocks which are DBG_DQ[125:124 pkg pins
	setx DBG_CONFIG__PA, %g1, %g2
	setx DBG_CONFIG__NIU_DBG_CLK__PIO, %g3, %g4
	stx %g4,[%g2]
	membar #Sync
	setx 100, %g1, %g2  !!! run some cycles
1:
	add %g0, %g0, %g3
	dec  %g2
	brnz %g2, 1b
	nop

test_niu_debug_clk_MAC:    !!! test NIU debug clocks which are DBG_DQ[125:124 pkg pins
	setx DBG_CONFIG__PA, %g1, %g2
	setx DBG_CONFIG__NIU_DBG_CLK__MAC, %g3, %g4
	stx %g4,[%g2]
	membar #Sync
	setx 100, %g1, %g2  !!! run some cycles
1:
	add %g0, %g0, %g3
	dec  %g2
	brnz %g2, 1b
	nop

test_niu_debug_clk_META:    !!! test NIU debug clocks which are DBG_DQ[125:124 pkg pins
	setx DBG_CONFIG__PA, %g1, %g2
	setx DBG_CONFIG__NIU_DBG_CLK__META, %g3, %g4
	stx %g4,[%g2]
	membar #Sync
	setx 100, %g1, %g2  !!! run some cycles
1:
	add %g0, %g0, %g3
	dec  %g2
	brnz %g2, 1b
	nop

test_niu_debug_clk_SMX:    !!! test NIU debug clocks which are DBG_DQ[125:124 pkg pins
	setx DBG_CONFIG__PA, %g1, %g2
	setx DBG_CONFIG__NIU_DBG_CLK__SMX, %g3, %g4
	stx %g4,[%g2]
	membar #Sync
	setx 100, %g1, %g2  !!! run some cycles
1:
	add %g0, %g0, %g3
	dec  %g2
	brnz %g2, 1b
	nop

diag_dummy_code:
	nop
	nop
	nop
	nop

test_passed:
	EXIT_GOOD

test_failed:
	EXIT_BAD


/************************************************************************
   Test case data start
 ************************************************************************/
.data
.end



