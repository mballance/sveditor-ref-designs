/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: Bug107906.s
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
!!! #define ENABLE_PCIE_MPS_256 !! comment out so this can be set from command line
#define MAIN_PAGE_HV_ALSO

#define MEM32_RD_ADDR              mpeval(N2_PCIE_BASE_ADDR + MEM32_OFFSET_BASE_REG_DATA)
#define DMA_DATA_ADDR          0x0000000052340000


#include "hboot.s"
#include "peu_defines.h"
# 108 "diag.j.pp"
.text
.global main

main:
        ta T_CHANGE_HPRIV
        nop

! set the Traffic Class for all the DMA R&W TLPs to 4, so denali doesn't
! send them out of order
settc:	nop ! $EV trig_pc_d(1, @VA(.MAIN.settc)) -> EnablePCIeIgCmd ("SET_TC", 4, 0, 0, 1 )

        setx    FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_ERR_RW1C_ALIAS_ADDR, %g2, %g3
        mov    FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_EN_ERR__LUP_P, %l1

LinkTrainingLoop2:
        ldx     [%g3], %g4
        andcc   %l1, %g4, %g5
        bne     LinkTrainingDone2
        nop

        b       LinkTrainingLoop2
        nop

LinkTrainingDone2:
        nop
        nop

	ta	%icc, T_RD_THID
! fork: source strm = 0xffffffffffffffff; target strm = 0x1               
	cmp	%o1, 0
	setx	fork_lbl_0_1, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x2               
	cmp	%o1, 1
	setx	fork_lbl_0_2, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x4               
	cmp	%o1, 2
	setx	fork_lbl_0_3, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x8               
	cmp	%o1, 3
	setx	fork_lbl_0_4, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x10              
	cmp	%o1, 4
	setx	fork_lbl_0_5, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x20              
	cmp	%o1, 5
	setx	fork_lbl_0_6, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x40              
	cmp	%o1, 6
	setx	fork_lbl_0_7, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x80              
	cmp	%o1, 7
	setx	fork_lbl_0_8, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_8:

th7_DMA_read_0: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th7_DMA_read_0)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'h35d", 1)

th7_DMA_read_1: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th7_DMA_read_1)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'h1f7", 1)

th7_DMA_read_2: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th7_DMA_read_2)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'h2dd", 1)

th7_DMA_read_3: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th7_DMA_read_3)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'he66", 1)

th7_DMA_read_4: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th7_DMA_read_4)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'h7d0", 1)

th7_DMA_read_5: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th7_DMA_read_5)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'h71a", 1)

th7_DMA_read_6: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th7_DMA_read_6)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'h218", 1)

th7_DMA_read_7: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th7_DMA_read_7)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'he69", 1)

th7_DMA_read_8: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th7_DMA_read_8)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'hbc8", 1)
        nop
        nop

        ! select a MEM32 address in PCI address range and transmit the command to NCU

        setx    0x800000c100000c00, %g1, %g2
        setx    0x080, %g1, %g4         ! loop 48 times

delay_loop7:
        stx     %g2, [%g2]              ! MEM32 PIO Write
        ldx     [%g2], %l0              ! MEM32 PIO Read
        add     %g2, 8, %g2             ! increment PIO  address

        dec     %g4                     ! decrement counter
        brnz    %g4, delay_loop7         ! loop if not zero
        nop

.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_7:

th6_DMA_read_0: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th6_DMA_read_0)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'h5c9", 1)

th6_DMA_read_1: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th6_DMA_read_1)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'hfbd", 1)

th6_DMA_read_2: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th6_DMA_read_2)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'ha57", 1)

th6_DMA_read_3: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th6_DMA_read_3)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'ha8f", 1)

th6_DMA_read_4: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th6_DMA_read_4)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'h612", 1)

th6_DMA_read_5: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th6_DMA_read_5)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'h74c", 1)

th6_DMA_read_6: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th6_DMA_read_6)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'he1e", 1)

th6_DMA_read_7: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th6_DMA_read_7)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'ha40", 1)

th6_DMA_read_8: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th6_DMA_read_8)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'hc54", 1)

th6_DMA_read_9: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th6_DMA_read_9)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'h11", 1)

th6_DMA_read_10: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th6_DMA_read_10)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'hcb6", 1)

th6_DMA_read_11: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th6_DMA_read_11)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'haa7", 1)

th6_DMA_read_12: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th6_DMA_read_12)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'h65b", 1)

th6_DMA_read_13: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th6_DMA_read_13)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'hb93", 1)

th6_DMA_read_14: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th6_DMA_read_14)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'hf1f", 1)

th6_DMA_read_15: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th6_DMA_read_15)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'h19c", 1)

th6_DMA_read_16: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th6_DMA_read_16)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'h6fe", 1)

th6_DMA_read_17: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th6_DMA_read_17)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'hf21", 1)

th6_DMA_read_18: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th6_DMA_read_18)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'h6d7", 1)
        nop
        nop

        ! select a MEM32 address in PCI address range and transmit the command to NCU

        setx    0x800000c100000a00, %g1, %g2
        setx    0x080, %g1, %g4         ! loop 48 times

delay_loop6:
        stx     %g2, [%g2]              ! MEM32 PIO Write
        ldx     [%g2], %l0              ! MEM32 PIO Read
        add     %g2, 8, %g2             ! increment PIO  address

        dec     %g4                     ! decrement counter
        brnz    %g4, delay_loop6         ! loop if not zero
        nop

.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_6:

th5_DMA_read_0: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th5_DMA_read_0)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'h7c8", 1)

th5_DMA_read_1: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th5_DMA_read_1)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'hec7", 1)

th5_DMA_read_2: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th5_DMA_read_2)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'hd24", 1)

th5_DMA_read_3: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th5_DMA_read_3)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'he0f", 1)

th5_DMA_read_4: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th5_DMA_read_4)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'h8bc", 1)

th5_DMA_read_5: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th5_DMA_read_5)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'h645", 1)

th5_DMA_read_6: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th5_DMA_read_6)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'h6fc", 1)

th5_DMA_read_7: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th5_DMA_read_7)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'h103", 1)
        nop
        nop

        ! select a MEM32 address in PCI address range and transmit the command to NCU

        setx    0x800000c100000800, %g1, %g2
        setx    0x080, %g1, %g4         ! loop 48 times

delay_loop5:
        stx     %g2, [%g2]              ! MEM32 PIO Write
        ldx     [%g2], %l0              ! MEM32 PIO Read
        add     %g2, 8, %g2             ! increment PIO  address

        dec     %g4                     ! decrement counter
        brnz    %g4, delay_loop5         ! loop if not zero
        nop

.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_5:

th4_DMA_read_0: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th4_DMA_read_0)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'hba3", 1)

th4_DMA_read_1: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th4_DMA_read_1)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'h97b", 1)

th4_DMA_read_2: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th4_DMA_read_2)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'hb4c", 1)

th4_DMA_read_3: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th4_DMA_read_3)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'hb9c", 1)

th4_DMA_read_4: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th4_DMA_read_4)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'h986", 1)

th4_DMA_read_5: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th4_DMA_read_5)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'h904", 1)

th4_DMA_read_6: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th4_DMA_read_6)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'hcc9", 1)

th4_DMA_read_7: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th4_DMA_read_7)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'h204", 1)

th4_DMA_read_8: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th4_DMA_read_8)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'hca9", 1)

th4_DMA_read_9: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th4_DMA_read_9)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'hd9d", 1)

th4_DMA_read_10: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th4_DMA_read_10)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'hfd2", 1)

th4_DMA_read_11: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th4_DMA_read_11)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'h919", 1)

th4_DMA_read_12: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th4_DMA_read_12)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'h764", 1)

th4_DMA_read_13: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th4_DMA_read_13)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'hdcf", 1)

th4_DMA_read_14: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th4_DMA_read_14)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'hae2", 1)

th4_DMA_read_15: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th4_DMA_read_15)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'hbce", 1)
        nop
        nop

        ! select a MEM32 address in PCI address range and transmit the command to NCU

        setx    0x800000c100000600, %g1, %g2
        setx    0x080, %g1, %g4         ! loop 48 times

delay_loop4:
        stx     %g2, [%g2]              ! MEM32 PIO Write
        ldx     [%g2], %l0              ! MEM32 PIO Read
        add     %g2, 8, %g2             ! increment PIO  address

        dec     %g4                     ! decrement counter
        brnz    %g4, delay_loop4         ! loop if not zero
        nop

.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_4:

th3_DMA_read_0: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th3_DMA_read_0)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'h285", 1)

th3_DMA_read_1: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th3_DMA_read_1)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'hfd7", 1)

th3_DMA_read_2: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th3_DMA_read_2)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'hf16", 1)

th3_DMA_read_3: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th3_DMA_read_3)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'hc3f", 1)

th3_DMA_read_4: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th3_DMA_read_4)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'h7aa", 1)

th3_DMA_read_5: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th3_DMA_read_5)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'hd7b", 1)

th3_DMA_read_6: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th3_DMA_read_6)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'haf3", 1)

th3_DMA_read_7: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th3_DMA_read_7)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'h601", 1)

th3_DMA_read_8: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th3_DMA_read_8)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'hb2d", 1)

th3_DMA_read_9: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th3_DMA_read_9)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'h817", 1)
        nop
        nop

        ! select a MEM32 address in PCI address range and transmit the command to NCU

        setx    0x800000c100000400, %g1, %g2
        setx    0x080, %g1, %g4         ! loop 48 times

delay_loop3:
        stx     %g2, [%g2]              ! MEM32 PIO Write
        ldx     [%g2], %l0              ! MEM32 PIO READ
        add     %g2, 8, %g2             ! increment PIO  address
# 206 "diag.j.pp"
        dec     %g4                     ! decrement counter
        brnz    %g4, delay_loop3         ! loop if not zero
        nop

.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:

th2_DMA_read_0: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th2_DMA_read_0)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'h787", 1)

th2_DMA_read_1: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th2_DMA_read_1)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'h2fd", 1)

th2_DMA_read_2: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th2_DMA_read_2)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'hcd8", 1)

th2_DMA_read_3: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th2_DMA_read_3)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'h80f", 1)

th2_DMA_read_4: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th2_DMA_read_4)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'h594", 1)

th2_DMA_read_5: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th2_DMA_read_5)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'hed5", 1)

th2_DMA_read_6: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th2_DMA_read_6)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'h3c3", 1)

th2_DMA_read_7: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th2_DMA_read_7)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'hbfd", 1)

th2_DMA_read_8: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th2_DMA_read_8)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'h802", 1)

th2_DMA_read_9: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th2_DMA_read_9)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'h6b3", 1)

th2_DMA_read_10: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th2_DMA_read_10)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'hd5b", 1)

th2_DMA_read_11: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th2_DMA_read_11)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'h605", 1)

th2_DMA_read_12: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th2_DMA_read_12)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'hfb4", 1)

th2_DMA_read_13: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th2_DMA_read_13)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'h37b", 1)

th2_DMA_read_14: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th2_DMA_read_14)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'hbab", 1)

th2_DMA_read_15: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th2_DMA_read_15)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'h72d", 1)

th2_DMA_read_16: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th2_DMA_read_16)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'h81f", 1)
        nop
        nop

        ! select a MEM32 address in PCI address range and transmit the command to NCU

        setx    0x800000c100000200, %g1, %g6
        setx    0x080, %g1, %g7         ! loop 48 times

delay_loop2:
        stx     %g6, [%g6]              ! MEM32 PIO Write
        ldx     [%g6], %l0              ! MEM32 PIO Read
        add     %g6, 8, %g6             ! increment PIO  address
# 185 "diag.j.pp"
        dec     %g7                     ! decrement counter
        brnz    %g7, delay_loop2         ! loop if not zero
        nop

.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:

th1_DMA_read_0: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th1_DMA_read_0)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'h284", 1)

th1_DMA_read_1: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th1_DMA_read_1)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'hc72", 1)

th1_DMA_read_2: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th1_DMA_read_2)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'he36", 1)

th1_DMA_read_3: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th1_DMA_read_3)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'hd32", 1)

th1_DMA_read_4: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th1_DMA_read_4)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'h20a", 1)

th1_DMA_read_5: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th1_DMA_read_5)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'h10a", 1)

th1_DMA_read_6: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th1_DMA_read_6)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'h918", 1)

th1_DMA_read_7: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th1_DMA_read_7)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'h544", 1)

th1_DMA_read_8: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th1_DMA_read_8)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'hc0e", 1)

th1_DMA_read_9: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th1_DMA_read_9)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'hbc0", 1)

th1_DMA_read_10: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th1_DMA_read_10)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'hdfb", 1)

th1_DMA_read_11: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th1_DMA_read_11)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'h32e", 1)
        nop
        nop

        ! select a MEM32 address in PCI address range and transmit the command to NCU

        setx    MEM32_RD_ADDR, %g1, %g3
        setx    0x080, %g1, %g5         ! loop 48 times

delay_loop1:
        stx     %g3, [%g3]              ! MEM32 PIO Write
        ldx     [%g3], %l0              ! MEM32 PIO Read
        add     %g3, 8, %g3             ! increment PIO  address
# 164 "diag.j.pp"
        dec     %g5                     ! decrement counter
        brnz    %g5, delay_loop1         ! loop if not zero
        nop

.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:

DMA_ldst_0: nop

th0_DMA_read_0: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th0_DMA_read_0)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'hb12", 1)

th0_DMA_read_1: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th0_DMA_read_1)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'h7d8", 1)

th0_DMA_read_2: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th0_DMA_read_2)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'h7f0", 1)

th0_DMA_read_3: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th0_DMA_read_3)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'h97c", 1)

th0_DMA_read_4: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th0_DMA_read_4)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'hb60", 1)

th0_DMA_read_5: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th0_DMA_read_5)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'heb0", 1)

th0_DMA_read_6: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th0_DMA_read_6)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'h1bf", 1)

th0_DMA_read_7: nop

 ! $EV trig_pc_d(1, @VA(.MAIN.th0_DMA_read_7)) -> EnablePCIeIgCmd("DMARD", fffc000052340000,fffc000052350000, "64'he0c", 1)
        nop
        nop

        ! select a MEM32 address in PCI address range and transmit the command to NCU

        setx    0x800000c100000e00, %g1, %g2
        setx    0x080, %g1, %g4         ! loop 128 times

delay_loop:
        stx     %g2, [%g2]              ! MEM32 PIO Write
        ldx     [%g2], %l0              ! MEM32 PIO Read
        add     %g2, 8, %g2             ! increment PIO  address

        dec     %g4                     ! decrement counter
        brnz    %g4, delay_loop         ! loop if not zero
        nop


join_lbl_0_0:

pcie_test_passed:
        EXIT_GOOD

pcie_test_failed:
        EXIT_BAD

SECTION descriptor  data_va=DMA_DATA_ADDR
attr_data {     
      Name = descriptor,
      hypervisor,
      compressimage
}

.data
init_mem(0x0101010201030104, 1024*8, 8, +, 0, +, 0x0004000400040004)
# 416 "diag.j.pp"

#if 0
#endif


