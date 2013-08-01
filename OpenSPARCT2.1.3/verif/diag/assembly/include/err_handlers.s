/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: err_handlers.s
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
#ifndef __HTRAPS_HAS_ERR_HANDLERS__
.global INST_ACCESS_MMU_ERROR_HANDLER
.global INST_ACCESS_ERROR_HANDLER
.global INT_PROC_ERR_HANDLER
.global DATA_ACCESS_MMU_ERROR_HANDLER
.global DATA_ACCESS_ERROR_HANDLER
.global HW_CORRECTED_ERROR_HANDLER
.global SW_RECOVERABLE_ERROR_HANDLER
.global STORE_ERROR_HANDLER

SECTION .HTRAPS
.text
! For ITTM, ITTP, ITDP errors, err_type is < 4. Issue demap all to the VA in TPC[TL].
! (Demap pg requires context knowledge - too much work)
! For ITMU (err_type = 4), rd sfar to chk MRA index.
! For ITL2U and ITL2ND errors issue retry.

INST_ACCESS_MMU_ERROR_HANDLER:
read_isfsr:
	add     %g0, SFSR_VA, %g1          
	ldxa  [%g1]ASI_ISFSR, %g2
	cmp %g2, ISFSR_ITMU
	be,a chk_sfar	!! sfar stores the MRA index
	bg,a clear_isfsr
demap_all:
	rdpr    %tpc, %g3
	mov 0x80, %g3
	ba clear_isfsr
	stxa    %g0, [%g3]ASI_IMMU_DEMAP
chk_sfar:
	add     %g0, SFAR_VA, %g3
	ldxa  [%g3]ASI_SFAR, %g4
clear_isfsr:
	stxa %g0, [%g1]ASI_ISFSR
	retry

INST_ACCESS_ERROR_HANDLER:
	add     %g0, SFSR_VA, %g1          
	ldxa  [%g1]ASI_ISFSR, %g2
	rdpr    %tpc, %g3
	stxa %g0, [%g1]ASI_ISFSR
	retry

INT_PROC_ERR_HANDLER:
read_ipe_dsfsr:
	add     %g0, SFSR_VA, %g1          
	ldxa  [%g1]ASI_DSFSR, %g2
read_ipe_dsfar:
	add     %g0, SFAR_VA, %g1
	ldxa  [%g1]ASI_SFAR, %g3

	cmp %g2, DSFSR_FRFU
	bl irf_error
	cmp %g2, DSFSR_SBDLC
	bl frf_error
	cmp %g2, DSFSR_MRAU
	bl stb_error
	be mra_error
	cmp %g2, DSFSR_SCAC
	bl tsa_error
	cmp %g2, DSFSR_TCCP
	bl,a sca_error
ipe_tcc_error:
	and %g3, 0x3, %g3	!! get the tca index
	sllx %g3, 3, %g3
	mov %g3, %g4
	ldxa [%g3]ASI_TICK_ACCESS, %g5  !! read ecc
	or %g3, 0x20, %g3	!!set NP bit to read data
	ldxa [%g3]ASI_TICK_ACCESS, %g5  !! read data
	setx ipe_clr_tcc_err, %g1, %g3
	jmp %g3+%g4
	nop
ipe_clr_tcc_err:
	wr %g0, %g5, %tick_cmpr
	ba,a  ipe_clear_dsfsr
ipe_clr_stick_err:
	wr  %g0, %g5, %sys_tick_cmpr
	ba,a  ipe_clear_dsfsr
ipe_clr_hstick_err:
	wrhpr  %g0, %g5, %hsys_tick_cmpr
	ba,a  ipe_clear_dsfsr

stb_error:
	and %g3, 0x7, %g3	!! get stb_index	
	sllx %g3, 3, %g3
ipe_rd_stb_entry_data:
    	ldxa [%g3]ASI_STB_ACCESS, %g2
ipe_rd_stb_entry_ecc:
	or %g3, 0x40, %g3
    	ldxa [%g3]ASI_STB_ACCESS, %g2
ipe_rd_stb_entry_addr:
	or %g3, 0x80, %g3
    	ldxa [%g3]ASI_STB_ACCESS, %g2
ipe_rd_stb_entry_par:
	and %g3, 0xbf, %g3
    	ldxa [%g3]ASI_STB_ACCESS, %g2
ipe_rd_stb_ptr:
  	add %g0, 0x100, %g1   !! read the stb ptr
    	ldxa [%g1]ASI_STB_ACCESS, %g2
	ba,a  ipe_clear_dsfsr

mra_error:
	and %g3, 0x7, %g3       !! get mra_index
	sllx %g3, 4, %g3
	setx ipe_rd_mra, %g1, %g4
	jmp %g3+%g4
	nop
ipe_rd_mra:
ipe_rd_mra_0:
	add %g0, ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_0, %g1
	ldxa [%g1]ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g2
	ba  ipe_clear_dsfsr
	nop
ipe_rd_mra_1:
	add %g0, ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_2, %g1
	ldxa [%g1]ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g2
	ba  ipe_clear_dsfsr
	nop
ipe_rd_mra_2:
	add %g0, ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_0, %g1
	ldxa [%g1]ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG, %g2
	ba  ipe_clear_dsfsr
	nop
ipe_rd_mra_3:
	add %g0, ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_2, %g1
	ldxa [%g1]ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG, %g2
	ba  ipe_clear_dsfsr
	nop
ipe_rd_mra_4:
	add %g0, ASI_MMU_PHYSICAL_OFFSET_0, %g1
	ldxa [%g1]ASI_MMU_PHYSICAL_OFFSET, %g2
	ba  ipe_clear_dsfsr
	nop
ipe_rd_mra_5:
	add %g0, ASI_MMU_PHYSICAL_OFFSET_1, %g1
	ldxa [%g1]ASI_MMU_PHYSICAL_OFFSET, %g2
	ba  ipe_clear_dsfsr
	nop
ipe_rd_mra_6:
	add %g0, ASI_MMU_PHYSICAL_OFFSET_2, %g1
	ldxa [%g1]ASI_MMU_PHYSICAL_OFFSET, %g2
	ba  ipe_clear_dsfsr
	nop
ipe_rd_mra_7:
	add %g0, ASI_MMU_PHYSICAL_OFFSET_3, %g1
	ldxa [%g1]ASI_MMU_PHYSICAL_OFFSET, %g2
	ba  ipe_clear_dsfsr
	nop

sca_error:
	and %g3, 0x7, %g3	!! get sca_index	
	sllx %g3, 3, %g3
	mov %g3, %g4
	ldxa [%g3]ASI_SCRATCHPAD_ACCESS, %g5  !! read ecc
	or %g3, 0x40, %g3	!!set NP bit to read data
	ldxa [%g3]ASI_SCRATCHPAD_ACCESS, %g5  !! read data
ipe_clr_sca_err:
	stxa %g5, [%g4]ASI_HYP_SCRATCHPAD
	ba  ipe_clear_dsfsr
	nop
	
tsa_error:
	and %g3, 0x7, %g3	!! get tsa_index	
	rdpr %tl, %g1		!! store the current tl
	cmp %g3, 6
	bl ipe_priv_reg_err
	be ipe_mondo_reg_err
	bg FAIL

ipe_priv_reg_err:
	inc %g3
	wrpr %g0, %g3, %tl
	rdpr %tstate, %g2
	wrpr %g0, %g2, %tstate	!! shd clear the error
	wrpr %g0, %g1, %tl
	ba  ipe_clear_dsfsr
	nop

ipe_mondo_reg_err:
	add %g0, ASI_CPU_MONDO_QUEUE_HEAD, %g1
	ldxa [%g1]ASI_QUEUE, %g2
	stxa %g2, [%g1]ASI_QUEUE
	ba  ipe_clear_dsfsr
	nop

irf_error:
ipe_get_reg_no:
	and %g3, 0x1f, %g1	
ipe_rd_irf_ecc:
	sllx %g1, 3, %g2
	ldxa [%g2]ASI_IRF_ECC_REG, %g4
ipe_get_syndrome:
	srlx %g3, 7, %g2
	and %g2, 0xff, %g2
ipe_get_gl:
	srlx %g3, 5, %g2
	and %g2, 0x3, %g2

	rdpr  %gl, %g7	!! read the current gl
	cmp %g1, 0x7
	bg ipe_rd_array	!! err not in global
	cmp %g2, 0x3	!! If gl of err reg is less then max gl then clr the err
	be,a ipe_rd_array 
	wrpr %g0, %g2, %gl  !! restore the gl to error gl

ipe_rd_array:
	setx ipe_rd_err_reg, %g4, %g5
	sllx %g1, 3, %g6
	jmp %g5+%g6
	nop
ipe_rd_err_reg:
ipe_rd_g0:
	stxa %r0, [%g0]ASI_SCRATCHPAD
	ba,a ipe_wr_err_rg
ipe_rd_g1:
	stxa %r1, [%g0]ASI_SCRATCHPAD
	ba,a ipe_wr_err_rg
ipe_rd_g2:
	stxa %r2, [%g0]ASI_SCRATCHPAD
	ba,a ipe_wr_err_rg
ipe_rd_g3:
	stxa %r3, [%g0]ASI_SCRATCHPAD
	ba,a ipe_wr_err_rg
ipe_rd_g4:
	stxa %r4, [%g0]ASI_SCRATCHPAD
	ba,a ipe_wr_err_rg
ipe_rd_g5:
	stxa %r5, [%g0]ASI_SCRATCHPAD
	ba,a ipe_wr_err_rg
ipe_rd_g6:
	stxa %r6, [%g0]ASI_SCRATCHPAD
	ba,a ipe_wr_err_rg
ipe_rd_g7:
	stxa %r7, [%g0]ASI_SCRATCHPAD
	ba,a ipe_wr_err_rg
ipe_rd_r8:
	stxa %r8, [%g0]ASI_SCRATCHPAD
	ba,a ipe_wr_err_rg
ipe_rd_r9:
	stxa %r9, [%g0]ASI_SCRATCHPAD
	ba,a ipe_wr_err_rg
ipe_rd_r10:
	stxa %r10, [%g0]ASI_SCRATCHPAD
	ba,a ipe_wr_err_rg
ipe_rd_r11:
	stxa %r11, [%g0]ASI_SCRATCHPAD
	ba,a ipe_wr_err_rg
ipe_rd_r12:
	stxa %r12, [%g0]ASI_SCRATCHPAD
	ba,a ipe_wr_err_rg
ipe_rd_r13:
	stxa %r13, [%g0]ASI_SCRATCHPAD
	ba,a ipe_wr_err_rg
ipe_rd_r14:
	stxa %r14, [%g0]ASI_SCRATCHPAD
	ba,a ipe_wr_err_rg
ipe_rd_r15:
	stxa %r15, [%g0]ASI_SCRATCHPAD
	ba,a ipe_wr_err_rg
ipe_rd_r16:
	stxa %r16, [%g0]ASI_SCRATCHPAD
	ba,a ipe_wr_err_rg
ipe_rd_r17:
	stxa %r17, [%g0]ASI_SCRATCHPAD
	ba,a ipe_wr_err_rg
ipe_rd_r18:
	stxa %r18, [%g0]ASI_SCRATCHPAD
	ba,a ipe_wr_err_rg
ipe_rd_r19:
	stxa %r19, [%g0]ASI_SCRATCHPAD
	ba,a ipe_wr_err_rg
ipe_rd_r20:
	stxa %r20, [%g0]ASI_SCRATCHPAD
	ba,a ipe_wr_err_rg
ipe_rd_r21:
	stxa %r21, [%g0]ASI_SCRATCHPAD
	ba,a ipe_wr_err_rg
ipe_rd_r22:
	stxa %r22, [%g0]ASI_SCRATCHPAD
	ba,a ipe_wr_err_rg
ipe_rd_r23:
	stxa %r23, [%g0]ASI_SCRATCHPAD
	ba,a ipe_wr_err_rg
ipe_rd_r24:
	stxa %r24, [%g0]ASI_SCRATCHPAD
	ba,a ipe_wr_err_rg
ipe_rd_r25:
	stxa %r25, [%g0]ASI_SCRATCHPAD
	ba,a ipe_wr_err_rg
ipe_rd_r26:
	stxa %r26, [%g0]ASI_SCRATCHPAD
	ba,a ipe_wr_err_rg
ipe_rd_r27:
	stxa %r27, [%g0]ASI_SCRATCHPAD
	ba,a ipe_wr_err_rg
ipe_rd_r28:
	stxa %r28, [%g0]ASI_SCRATCHPAD
	ba,a ipe_wr_err_rg
ipe_rd_r29:
	stxa %r29, [%g0]ASI_SCRATCHPAD
	ba,a ipe_wr_err_rg
ipe_rd_r30:
	stxa %r30, [%g0]ASI_SCRATCHPAD
	ba,a ipe_wr_err_rg
ipe_rd_r31:
	stxa %r31, [%g0]ASI_SCRATCHPAD
ipe_wr_err_rg:
	setx ipe_wr_g0, %g4, %g5
	jmp %g5+%g6
	nop

ipe_wr_g0:
	ldxa [%g0]ASI_SCRATCHPAD, %r0
	ba,a ipe_restore_gl
ipe_wr_g1:
	ldxa [%g0]ASI_SCRATCHPAD, %r1
	ba,a ipe_restore_gl
ipe_wr_g2:
	ldxa [%g0]ASI_SCRATCHPAD, %r2
	ba,a ipe_restore_gl
ipe_wr_g3:
	ldxa [%g0]ASI_SCRATCHPAD, %r3
	ba,a ipe_restore_gl
ipe_wr_g4:
	ldxa [%g0]ASI_SCRATCHPAD, %r4
	ba,a ipe_restore_gl
ipe_wr_g5:
	ldxa [%g0]ASI_SCRATCHPAD, %r5
	ba,a ipe_restore_gl
ipe_wr_g6:
	ldxa [%g0]ASI_SCRATCHPAD, %r6
	ba,a ipe_restore_gl
ipe_wr_g7:
	ldxa [%g0]ASI_SCRATCHPAD, %r7
	ba,a ipe_restore_gl
ipe_wr_r8:
	ldxa [%g0]ASI_SCRATCHPAD, %r8
	ba,a ipe_restore_gl
ipe_wr_r9:
	ldxa [%g0]ASI_SCRATCHPAD, %r9
	ba,a ipe_restore_gl
ipe_wr_r10:
	ldxa [%g0]ASI_SCRATCHPAD, %r10
	ba,a ipe_restore_gl
ipe_wr_r11:
	ldxa [%g0]ASI_SCRATCHPAD, %r11
	ba,a ipe_restore_gl
ipe_wr_r12:
	ldxa [%g0]ASI_SCRATCHPAD, %r12
	ba,a ipe_restore_gl
ipe_wr_r13:
	ldxa [%g0]ASI_SCRATCHPAD, %r13
	ba,a ipe_restore_gl
ipe_wr_r14:
	ldxa [%g0]ASI_SCRATCHPAD, %r14
	ba,a ipe_restore_gl
ipe_wr_r15:
	ldxa [%g0]ASI_SCRATCHPAD, %r15
	ba,a ipe_restore_gl
ipe_wr_r16:
	ldxa [%g0]ASI_SCRATCHPAD, %r16
	ba,a ipe_restore_gl
ipe_wr_r17:
	ldxa [%g0]ASI_SCRATCHPAD, %r17
	ba,a ipe_restore_gl
ipe_wr_r18:
	ldxa [%g0]ASI_SCRATCHPAD, %r18
	ba,a ipe_restore_gl
ipe_wr_r19:
	ldxa [%g0]ASI_SCRATCHPAD, %r19
	ba,a ipe_restore_gl
ipe_wr_r20:
	ldxa [%g0]ASI_SCRATCHPAD, %r20
	ba,a ipe_restore_gl
ipe_wr_r21:
	ldxa [%g0]ASI_SCRATCHPAD, %r21
	ba,a ipe_restore_gl
ipe_wr_r22:
	ldxa [%g0]ASI_SCRATCHPAD, %r22
	ba,a ipe_restore_gl
ipe_wr_r23:
	ldxa [%g0]ASI_SCRATCHPAD, %r23
	ba,a ipe_restore_gl
ipe_wr_r24:
	ldxa [%g0]ASI_SCRATCHPAD, %r24
	ba,a ipe_restore_gl
ipe_wr_r25:
	ldxa [%g0]ASI_SCRATCHPAD, %r25
	ba,a ipe_restore_gl
ipe_wr_r26:
	ldxa [%g0]ASI_SCRATCHPAD, %r26
	ba,a ipe_restore_gl
ipe_wr_r27:
	ldxa [%g0]ASI_SCRATCHPAD, %r27
	ba,a ipe_restore_gl
ipe_wr_r28:
	ldxa [%g0]ASI_SCRATCHPAD, %r28
	ba,a ipe_restore_gl
ipe_wr_r29:
	ldxa [%g0]ASI_SCRATCHPAD, %r29
	ba,a ipe_restore_gl
ipe_wr_r30:
	ldxa [%g0]ASI_SCRATCHPAD, %r30
	ba,a ipe_restore_gl
ipe_wr_r31:
	ldxa [%g0]ASI_SCRATCHPAD, %r31
ipe_restore_gl:
	wrpr %g0, %g7, %gl	
	ba ipe_clear_dsfsr
	nop

frf_error:
ipe_get_frf_reg_no:
	and %g3, 0x3f, %g1	
ipe_get_frf_even_syndrome:
	srlx %g3, 6, %g2
	and %g2, 0x7f, %g2
ipe_get_frf_odd_syndrome:
	srlx %g3, 13, %g2
	and %g2, 0x7f, %g2
ipe_rd_frf_ecc:
	sllx %g1, 3, %g1
	ldxa [%g1]ASI_FRF_ECC_REG, %g3

ipe_clear_dsfsr:
	add     %g0, SFSR_VA, %g1          
	stxa %g0, [%g1]ASI_DSFSR
	retry

DATA_ACCESS_MMU_ERROR_HANDLER:
dme_read_dsfsr:
	add     %g0, SFSR_VA, %g1          
	ldxa  [%g1]ASI_DSFSR, %g2
dme_read_dsfar:
	add     %g0, SFAR_VA, %g4
	ldxa  [%g4]ASI_SFAR, %g3
	cmp %g2, DSFSR_DTMU
	bge,a dme_clear_dsfsr
dme_demap_all:
    mov 0x80, %g3
	stxa    %g0, [%g3]ASI_DMMU_DEMAP
dme_clear_dsfsr:
	stxa %g0, [%g1]ASI_DSFSR
	retry

DATA_ACCESS_ERROR_HANDLER:
	add     %g0, SFSR_VA, %g1          
	ldxa  [%g1]ASI_DSFSR, %g2
	stxa %g0, [%g1]ASI_DSFSR
	retry

HW_CORRECTED_ERROR_HANDLER:
hce_read_desr:
  	ldxa [%g0]ASI_DESR, %g1  !! Also clears desr
hce_chk_errt:
  	srlx %g1, 56, %g2    
    	and %g2, 0x1F, %g2
        cmp %g2, DESR_ICDP
	ble hce_ic_error
        cmp %g2, DESR_DCDP
	ble hce_dc_error
	cmp %g2, DESR_SBDPC
	be,a hce_sbdpc_error
	retry	!! Can't do much for l2c errors

hce_dc_error:
	and %g1, 0x1ff, %g2
	sllx %g2, 4, %g2	!! index is in bits 10:4 of addr
  	add %g0, 0x800, %g1	
	sllx %g1, 2, %g1	!! for reading data, bit 13 of index shd be 1
hce_dc_rd_tag:
  	ldxa [%g2]ASI_DC_TAG, %g3
    /*
hce_dc_rd_data:
  	ldxa [%g2+%g1]ASI_DC_DATA, %g4
	or %g2, 0x8, %g2	  !! read MSB 8 bytes from cache line
  	ldxa [%g2+%g1]ASI_DC_DATA, %g4
    */
	retry

hce_ic_error:
	and %g1, 0x1ff, %g2
	sllx %g2, 5, %g2	!! index is in bits 10:5 of addr for tag read
	sllx %g2, 1, %g1	!! index is in bits 11:6 of addr for data read
hce_ic_rd_tag:
  	ldxa [%g0+%g2]ASI_IC_TAG, %g3
	mov %g0, %g2
hce_ic_rd_instr:
  	ldxa [%g1]ASI_IC_INSTR, %g4
	add %g1, 8, %g1
	cmp %g2, 7
	bl hce_ic_rd_instr
	inc %g2
	retry
	
hce_sbdpc_error:
	and %g1, 0x7, %g3	!! get stb_index	
	sllx %g3, 3, %g3
hce_rd_stb_entry_data:
    	ldxa [%g3]ASI_STB_ACCESS, %g2
hce_rd_stb_entry_ecc:
	or %g3, 0x40, %g3
    	ldxa [%g3]ASI_STB_ACCESS, %g2
hce_rd_stb_entry_addr:
	or %g3, 0x80, %g3
    	ldxa [%g3]ASI_STB_ACCESS, %g2
hce_rd_stb_entry_par:
	and %g3, 0xbf, %g3
    	ldxa [%g3]ASI_STB_ACCESS, %g2
	retry

!! The sw_recoverable_err trap is taken mostly for uncorrectable errors.
!! Most of these are due to errors on L2c returns. Can't chk much in the
!! trap handler for these.

SW_RECOVERABLE_ERROR_HANDLER:
swe_read_desr:
  	ldxa [%g0]ASI_DESR, %g1  !! Also clears desr
	retry 

STORE_ERROR_HANDLER:
ste_read_dfesr:
  	add %g0, DFESR_VA, %g1
        ldxa [%g1]ASI_DFESR, %g2   !! read the DFESR
	retry

FAIL: EXIT_BAD
	nop
#endif
