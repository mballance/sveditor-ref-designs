/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_ras_vec_mcu_dbu1.s
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
#define ENABLE_PCIE_LINK_TRAINING

#include "peu_defines.h"

#define MAIN_PAGE_HV_ALSO
#define  L2_ENTRY_PA        0xa000000000
#define  TEST_DATA1         0x5555555555555555
#define	 L2_ENTRY_PA0       0x2020000008
#define  L2_ES_W1C_VALUE    0xc03ffffc00000000
#define  TT_SW_Error        0x40
#define  DRAM_ERR_STAT_REG  0x8400000280
#define  L2_BANK_ADDR       0x00
#define  DRAM_ES_W1C_VALUE  0xfe00000000000000

#ifdef MCU0
#define  OOB_ADDR1      0x1123456000
#define  OOB_ADDR2      0x2022000000        
#define  OOB_ADDR3      0x4022000000        
#define  OOB_ADDR4      0x8022000000
#define  L2_BANK_ADDR   0x0
#define  DRAM_ERR_STAT_REG  0x8400000280
#define  L2_ERR_STAT_REG    0xAB00000000
#define  DMA_DATA_BYP_ADDR1 0xfffc001123456000
#endif

#ifdef MCU1
#define  OOB_ADDR1      0x1123456080
#define  OOB_ADDR2      0x2022000080
#define  OOB_ADDR3      0x4022000080
#define  OOB_ADDR4      0x8022000080
#define  L2_BANK_ADDR    0x80
#define  DRAM_ERR_STAT_REG  0x8400001280
#define  L2_ERR_STAT_REG    0xAB00000080
#define  DMA_DATA_BYP_ADDR1 0xfffc001123456080
#endif

#ifdef MCU2
#define  OOB_ADDR1      0x1123456100
#define  OOB_ADDR2      0x2022000100        
#define  OOB_ADDR3      0x4022000100        
#define  OOB_ADDR4      0x8022000100        
#define  L2_BANK_ADDR    0x100
#define  DRAM_ERR_STAT_REG  0x8400002280
#define  L2_ERR_STAT_REG    0xAB00000100
#define  DMA_DATA_BYP_ADDR1 0xfffc001123456100
#endif

#ifdef MCU3
#define  OOB_ADDR1      0x1123456180
#define  OOB_ADDR2      0x2022000180        
#define  OOB_ADDR3      0x4022000180        
#define  OOB_ADDR4      0x8022000180        
#define  L2_BANK_ADDR    0x180
#define  DRAM_ERR_STAT_REG  0x8400003280
#define  L2_ERR_STAT_REG    0xAB00000180
#define  DMA_DATA_BYP_ADDR1 0xfffc001123456180
#endif

#include "hboot.s"
#include "asi_s.h"
#include "err_defines.h"
#include "peu_defines.h"

.text
.global	 main
.global  My_Recoverable_Sw_error_trap


main:
  ! Boot code does not provide TLB translation for IO address space
	ta    T_CHANGE_HPRIV
	nop

disable_err_reporting:
	setx 	L2EE_PA0, %l0, %l1
        add 	%l1, L2_BANK_ADDR, %l1
	ldx   	[%l1], %l2
	setx	0xfffffffffffffffc, %l7, %l0
	and	%l2, %l0, %l2
	stx   	%l2, [%l1]
	membar 	#Sync

/*************************************************
	OOB Write
**************************************************/
pio:
        ! enable bypass in IOMMU
        setx    FIRE_DLC_MMU_CSR_A_CTL_ADDR, %g1, %g2
        setx    FIRE_DLC_MMU_CSR_A_CTL__BYPASS_EN, %g1, %g3
        stx     %g3, [%g2]
        ldx     [%g2], %g3
XmtUsrEvnt1: nop;
        ! $EV trig_pc_d(1, @VA(.MAIN.XmtUsrEvnt1)) -> EnablePCIeIgCmd ("DMAWR", DMA_DATA_BYP_ADDR1, DMA_DATA_BYP_ADDR1, "64'h40", 1)
        ldx     [%g2], %g3
        ldx     [%g2], %g3
        ldx     [%g2], %g3

        setx    FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_CTL_ADDR, %g1, %g2
        setx    0x020, %g1, %g4
delay_loop:
        ldx     [%g2], %g5
        nop
        nop
        nop
        nop
        dec     %g4
        brnz    %g4, delay_loop
        nop

        setx    SOC_ESR_REG, %l7, %i0
        ldx     [%i0], %i1
        nop

check_L2_ESR_wr:
        setx    L2ES_PA0, %l6, %g1
        add     %g1, L2_BANK_ADDR, %g1
        ldx     [%g1], %g2
        cmp     %g2, %g0
        bne     %xcc, test_fail
        nop


check_DRAM_ESR_wr:
        setx    DRAM_ERR_STAT_REG, %l3, %g5
        ldx     [%g5], %g2
        cmp     %g2, %g0
        bne     %xcc, test_fail
        nop


/***************************************************************
	OOB Read	
***************************************************************/
access_OOB_ADDR_rd:
	setx	OOB_ADDR1, %l0, %g6
	ldx	[%g6], %i1
	nop
	nop
	nop

check_L2_ESR_rd:
        setx    L2ES_PA0, %l6, %g1
        add     %g1, L2_BANK_ADDR, %g1
        ldx     [%g1], %g2
	setx  	0xf1fffffff0000000, %l3, %l0    ! MSA; ignore CoreID -> <59:57>; TH_ID <56:54> should be OK
	andcc 	%l0, %g2, %l5               	! %g2 has the ESR content 
	mov   	0x1, %l1
	sllx  	%l1, L2ES_DAU, %l0
	mov   	0x1, %l1
	sllx  	%l1, L2ES_VEU, %l2
	or    	%l0, %l2, %l3
	mov	0x1, %l1
	sllx	%l1, L2ES_MEU, %l2		! MEU
	or	%l3, %l2, %l3
	cmp   	%l5, %l3
	bne   	%xcc, test_fail
	nop

clear_L2_esr_rd:
	setx	L2_ES_W1C_VALUE, %g7, %g1
	stx	%g1, [%l6]

check_l2_EAR_rd:
	setx  	L2EA_PA0, %l6, %l3
	add   	%l3,L2_BANK_ADDR,%l3
	ldx   	[%l3], %l4
	cmp	%l4, %g6	!%g6 has the OOB_ADDR
	bne	test_fail
	nop
	membar 	#Sync

clear_L2_EAR_rd:
	stx	%g0, [%l3]

check_DRAM_ESR_rd:
	setx  	DRAM_ERR_STAT_REG, %l3, %g5
	ldx   	[%g5], %l6
	setx  	0xffc000000000ffff, %l0,%o2
	and  	%l6,%o2,%l6
	mov   	0x1, %l1
	sllx  	%l1, DRAM_ES_DBU, %l0            ! %l0 has expected value
	cmp   	%l0, %l6
	bne   	%xcc, test_fail
	nop

clear_mcu_esr_1:
	setx	DRAM_ES_W1C_VALUE, %g7, %g1
	stx	%g1, [%l6]
 


/*******************************************************
 * Exit code
 *******************************************************/

test_pass:
ta  T_GOOD_TRAP

test_fail:
ta  T_BAD_TRAP


