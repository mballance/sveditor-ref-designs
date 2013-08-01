/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_err_adv_peu_piord_uev.s
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
#define H_HT0_Data_access_error_0x32  My_Precise_data_access_error_trap

#define ENABLE_PCIE_LINK_TRAINING
#define MAIN_PAGE_HV_ALSO

#define  DRAM_ERR_STAT_REG              0x8400000280
#define  L2_ERR_STAT_REG                0xAB00000000

#include "err_defines.h"
#include "hboot.s"
#include "peu_defines.h"


#define IO_RD_ADDR mpeval((N2_PCIE_BASE_ADDR + (IOCFG_OFFSET_BASE_REG_DATA & 0x7fffffffffffffff)) | IO_ACCESS_PA)

/************************************************************************
   Test case code start
 ************************************************************************/
.text
.global main
.global  My_Precise_data_access_error_trap

main:
        ta T_CHANGE_HPRIV
        nop

	clr	%o7
	clr	%i7

inj_err_rdd:
        nop                     !$EV trig_pc_d(0,@VA(.MAIN.inj_err_rdd)) ->IosErrInj(ERR_TYPE, 8000, 0)

pio:
        ! select an IO address in PCI address range and transmit the command to NCU
        setx IO_RD_ADDR, %g1, %g2

        ! load byte - all byte offsets within an octlet
        ldub [%g2 + 1*8 + 0], %l0
	membar	0x40

	setx	0x20, %l1, %g4
delay_loop:
	nop
	nop
	nop
	nop
	dec	%g4
	brnz	%g4, delay_loop
	nop

count_number_traps:
	set	0x1, %i1
	cmp	%i1, %i7
	bne	%xcc, test_failed
	nop
	
check_trap_type:
	setx	0x32, %g7, %i1
        cmp     %i1, %o7
        bne     %xcc, test_failed
        nop

test_passed:
	EXIT_GOOD

test_failed:
	EXIT_BAD


/***********************************************************/
My_Precise_data_access_error_trap:
        rdpr  	%tt, %o7
        inc     %i7


check_DSFSR:
        set  	0x18, %g3
        ldxa  	[%g3] 0x58, %g2

        set 	0xf, %l1
        and  	%g2, %l1, %l3
        mov  	0x4, %l5			! content of D-SFSR Error type field = 0x4 (SOCU)
        cmp  	%l5, %l3
        bne  	%xcc, test_failed
        nop


check_mcu_esr_L2Trap_tt32:
        setx  	DRAM_ERR_STAT_REG, %l3, %g5  
        ldx   	[%g5], %l3
        cmp  	%g0, %l3
        bne  	%xcc, test_failed
        nop

check_L2_4_ESR_L2Trap_tt32:
        setx    L2_ERR_STAT_REG, %l3, %g5  
        ldx     [%g5], %l6

        cmp     %l6, %g0
        bne     %xcc, test_failed
        nop

check_mcu_esr_ncuesr_tt32:
        setx    SOC_ESR_REG, %l3, %g5  
        ldx     [%g5], %l3
        cmp     %g0, %l3
        bne     %xcc, test_failed
        nop


trap_done_tt32:
	done
	nop

/************************************************************************
   Test case data start
************************************************************************/

SECTION       .DATA DATA_VA=IO_RD_ADDR
attr_data {
      Name = .DATA,
      hypervisor,
      compressimage
}

.data
        .xword 0xdeadbeefdeadbeef

        .xword 0x1101010101010101
        .xword 0x0122010101010101
        .xword 0x0101330101010101
        .xword 0x0101014401010101
        .xword 0x0101010155010101
        .xword 0x0101010101660101
        .xword 0x0101010101017701
        .xword 0x0101010101010188

        .xword 0x1122010101010101
        .xword 0x0101334401010101
        .xword 0x0101010155660101
        .xword 0x0101010101017788

        .xword 0x1122334401010101
        .xword 0x0101010155667788

        .xword 0xdeadbeefdeadbeef

/************************************************************************/
