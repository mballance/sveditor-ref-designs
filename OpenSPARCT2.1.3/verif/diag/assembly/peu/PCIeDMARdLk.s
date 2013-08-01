/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: PCIeDMARdLk.s
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
#ifndef DTM_ENABLED
#define ENABLE_PCIE_LINK_TRAINING
#define SKIP_PCIE_LINK_WAIT
#endif
	
#define MAIN_PAGE_HV_ALSO

#define H_HT0_Interrupt_0x60
#define My_HT0_Interrupt_0x60 \
        call    piu_trap_code; \
        nop; \
        retry; \
        nop; 

#include "hboot.s"
#include "peu_defines.h"
#include "ncu_defines.h"
#include "cmp_macros.h"

#define MEM32_RD_ADDR 		mpeval(N2_PCIE_BASE_ADDR + MEM32_OFFSET_BASE_REG_DATA)

#define DMA_DATA_ADDR   	0x0000000123456600
#define DMA_DATA_BYP_SADDR      0xfffc000123456600
#define DMA_DATA_BYP_EADDR      0xfffc000123456800

#define DMA_DATA_ADDR32   	0x00000000007f0000

#define IOMMU_TTE_ADDR		0x0000000040000000

! Bit 8 = Page Size: 0=8KB, 1=64KB;  Bits 3:0 = TSB Table size:	6=64k entries 
#define MMU_TSB_CNTRL_REG_DATA	   mpeval(IOMMU_TTE_ADDR | 0x100 | 6)

#define MEM_RD_ADDR mpeval(N2_PCIE_BASE_ADDR + MEM32_OFFSET_BASE_REG_DATA)

/************************************************************************
   Test case code start
 ************************************************************************/
.text
.global main

main:
        ta T_CHANGE_HPRIV
        nop

th_fork(th_main, %l0)

/*************************************************************************
 Thread 0 will test mem 64 pios
 *************************************************************************/
th_main_0:	

! enable SUN4U translation in the IOMMU
	
	setx	FIRE_DLC_MMU_CSR_A_CTL_ADDR, %g1, %g2
	setx	0x00303, %g1, %g3	! 9:8 11 = Cache enabled, 0: 1 = translation enabled
	stx	%g3, [%g2]
	ldx	[%g2], %g3
	
! load address of the TSB table, and the page size (64KB)
	
	setx	FIRE_DLC_MMU_CSR_A_TSB_ADDR, %g1, %g2
	setx	MMU_TSB_CNTRL_REG_DATA, %g1, %g3
	stx	%g3, [%g2]
	ldx	[%g2], %g3

#ifndef DTM_ENABLED
! wait here until pcie link training is done, then start other threads
        setx    FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_ERR_RW1C_ALIAS_ADDR, %g1, %g2
        mov     FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_EN_ERR__LUP_P, %g1
	mov     100, %g3

PcieLinkTrainingLoop:
        ldx     [%g2], %g4
        andcc   %g1, %g4, %g4
        bne     LinkTrainingDone
        
	dec	%g3
	brnz	%g3, PcieLinkTrainingLoop
	nop

LinkTrainingTimeout:
        ta     T_BAD_TRAP
	nop

LinkTrainingDone:
#endif
! enable interrupts & provide basic handler
#include "piu_rupt_enable.s"

	!setx	PCI_E_IMU_INT_ENB_ADDR, %g1, %g2
	!setx	0x0000003e0000003e, %g1, %g3
	!ldx	[%g2], %g4
	!andn	%g4, %g3, %g4
	!stx	%g4, [%g2]		! turn off interupts for error messages

        /* Sync up all the treads. */

#ifndef PORTABLE_CORE
sync_t0:
        SYNC_THREAD_MAIN( test_failed, %g1, %g2, %g3 )
#else
	cmp_sync_threads
#endif


DMARD1: nop;nop;nop;nop;
	nop;nop;nop;nop;
! $EV trig_pc_d(1,@VA(.MAIN.DMARD1)) -> EnablePCIeIgCmd("DMARD", DMA_DATA_BYP_SADDR, DMA_DATA_BYP_SADDR, "64'h100",1)

DMARDLK:nop;nop;nop;nop;
	nop;nop;nop;nop;
! $EV trig_pc_d(1,@VA(.MAIN.DMARDLK)) -> EnablePCIeIgCmd("DMARDLK", DMA_DATA_BYP_SADDR, DMA_DATA_BYP_EADDR, "64'h80",1)

	
ERR_COR: nop;nop;nop;nop;
! $EV trig_pc_d(1,@VA(.MAIN.ERR_COR)) -> EnablePCIeIgCmd("ERR_COR", 0, 0, "64'h10",1)
	setx	err_cor_int_cnt,%g1,%o0
	best_set_reg(100, %g1, %o2)
	setx	FIRE_DLC_IMU_ICS_CSR_A_IMU_ERROR_LOG_EN_REG_ADDR, %g1, %o3 ! 631000
	
err_cor_delay:
	ldx	[%o3+0x10], %l3				! 631010 - IMU Interrupt Status Reg
	ldx	[%o0], %o1
	cmp	%o1, 0
	bne	ERR_NONFATAL
	nop
	dec	%o2
	cmp	%o2, 0
	bne	err_cor_delay
	nop
	!ba	test_failed
	nop
	
ERR_NONFATAL: nop;nop;nop;nop;
! $EV trig_pc_d(1,@VA(.MAIN.ERR_NONFATAL)) -> EnablePCIeIgCmd("ERR_NONFATAL", 0, 0, "64'h10",1)
	setx	err_nonfatal_int_cnt,%g1,%o0
	best_set_reg(100, %g1, %o2)
	
err_nonfatal_delay:
	ldx	[%o3+0x10], %l3				! 631010 - IMU Interrupt Status Reg
	ldx	[%o0], %o1
	cmp	%o1, 0
	bne	ERR_FATAL
	nop
	dec	%o2
	cmp	%o2, 0
	bne	err_nonfatal_delay
	nop
	!ba	test_failed
	nop

	
ERR_FATAL: nop;nop;nop;nop;
! $EV trig_pc_d(1,@VA(.MAIN.ERR_FATAL)) -> EnablePCIeIgCmd("ERR_FATAL", 0, 0, "64'h10",1)
	setx	err_fatal_int_cnt,%g1,%o0
	best_set_reg(100, %g1, %o2)
	
err_fatal_delay:
	ldx	[%o3+0x10], %l3				! 631010 - IMU Interrupt Status Reg
	ldx	[%o0], %o1
	cmp	%o1, 0
	bne	ATTN
	nop
	dec	%o2
	cmp	%o2, 0
	bne	err_fatal_delay
	nop
	!ba	test_failed
	nop

	
ATTN: nop;nop;nop;nop;
	nop;nop;nop;nop;
! $EV trig_pc_d(1,@VA(.MAIN.ATTN)) -> EnablePCIeIgCmd("ATTN", 0, 0, "64'h10",1)

VENDOR_TYPE_0: nop;nop;nop;nop;
	nop;nop;nop;nop;
! $EV trig_pc_d(1,@VA(.MAIN.VENDOR_TYPE_0)) -> EnablePCIeIgCmd("VENDOR_TYPE_0", 0, 0, "64'h10",1)

VENDOR_TYPE_1: nop;nop;nop;nop;
	nop;nop;nop;nop;
! $EV trig_pc_d(1,@VA(.MAIN.VENDOR_TYPE_1)) -> EnablePCIeIgCmd("VENDOR_TYPE_1", 0, 0, "64'h10",1)

DMARDLK2:nop;nop;nop;nop;
	nop;nop;nop;nop;
! $EV trig_pc_d(1,@VA(.MAIN.DMARDLK2)) -> EnablePCIeIgCmd("DMARDLK", DMA_DATA_ADDR32, DMA_DATA_ADDR32, "64'h44",1)

 	
DMARD2: nop;nop;nop;nop;
	nop;nop;nop;nop;
! $EV trig_pc_d(1,@VA(.MAIN.DMARD2)) -> EnablePCIeIgCmd("DMARD_INTA", DMA_DATA_ADDR32, DMA_DATA_ADDR32, "64'h40",1)

			
	!!! Wait for the INTA following the last DMA Read completion
	setx	FIRE_DLC_IMU_RDS_INTX_CSR_A_INTX_STATUS_REG_ADDR, %g1, %g2
	mov	100, %g3		! loop count
	mov	8, %g4			! INTA asserted bit
	
delay_loop1:
	ldx	[%g2], %g5
	cmp     %g4,%g5
	be	test_passed
	
	dec	%g3
	cmp	%g3, 0
	bne	delay_loop1
	nop
	
test_failed:
	EXIT_BAD


	
th_main_1:	
th_main_2:	
th_main_3:	
th_main_6:	
th_main_7:	


#ifndef PORTABLE_CORE
        SYNC_THREAD_OTHER( %o1,%g1,%g2 )
#else
	cmp_sync_threads
#endif

test_passed:
	EXIT_GOOD

	

	.align 64
/*************************************************************************
 Thread 4 will cycle thru the imu perf cntr a selects
 *************************************************************************/
th_main_4:

#ifndef PORTABLE_CORE
        SYNC_THREAD_OTHER( %o1,%g1,%g2 )
#else
	cmp_sync_threads
#endif


	setx	FIRE_DLC_IMU_ICS_CSR_A_IMU_PERF_CNTRL_ADDR, %g1, %g2
	best_set_reg(0xff00, %g1, %g3)      ! Mask to zero cntr 0 select
	setx	imu_cntr_values, %g1, %g4   ! valid cntr 0 select values
	ldub	[%g4], %l0		    ! get new cntr 0 select value

	setx	MEM_RD_ADDR, %g1, %l1
	setx	imu_cntr_select_lock, %g1, %l2

imu_cntr0_loop:
	! get the counter lock
	ldstub	[%l2], %l3
	cmp	%l3, 0
	bne	imu_cntr0_loop
	
	! store the new cntr 0 select value
	ldx	[%g2], %g5
	and	%g5, %g3, %g5
	or	%g5, %l0, %g5
	stx	%g5, [%g2]

	! free the counter lock
	st	%g0, [%l2]
	
	! wait a bit, then load the cntr and write to pio location
	setx	FIRE_DLC_IMU_ICS_CSR_A_IMU_PERF_CNT0_ADDR, %g1, %g7
	nop; nop; nop; nop; nop; nop; nop; nop; nop; nop; nop; nop; 
	ldx	[%g7], %g5
	nop; nop; nop; nop; nop; nop; nop; nop; nop; nop; nop; nop; 
	ldx	[%g7], %g5
	stx	%g5, [%l1]	! write perf cntr 0 value onto pcie bus
	
	! incr cntr 0 select value & exit if done
	inc	%g4
	ldub	[%g4], %l0		! get new cntr 0 select value
	cmp	%l0, 0xff
	be	test_passed
	nop
	
	ba	imu_cntr0_loop
	nop

	.align 64
imu_cntr_values:
	.xword	0x0102030405060102
	.xword	0x03040506ffffffff
	
imu_cntr_select_lock:
	.xword	0x0000000000000000

/************************************************************************
   Cycle thru the IMU performance counter 1 selects
 ************************************************************************/
	.align 64
th_main_5:

#ifndef PORTABLE_CORE
        SYNC_THREAD_OTHER( %o1,%g1,%g2 )
#else
	cmp_sync_threads
#endif

	setx	FIRE_DLC_IMU_ICS_CSR_A_IMU_PERF_CNTRL_ADDR, %g1, %g2
	best_set_reg(0x00ff, %g1, %g3)	    ! Mask to zero cntr 1 select
	setx	imu_cntr_values, %g1, %g4   ! valid cntr 1 select values
	ldub	[%g4], %l0		    ! get new cntr 1 select value
	sll	%l0, 8, %l0
	
	setx	MEM_RD_ADDR, %g1, %l1
	setx	imu_cntr_select_lock, %g1, %l2

imu_cntr1_loop:
	! get the counter lock
	ldstub	[%l2], %l3
	cmp	%l3, 0
	bne	imu_cntr1_loop
	
	! store the new cntr 1 select value
	ldx	[%g2], %g5
	and	%g5, %g3, %g5
	or	%g5, %l0, %g5
	stx	%g5, [%g2]

	! free the counter lock
	st	%g0, [%l2]
	
	! wait a bit, then load the cntr and write to pio location
	setx	FIRE_DLC_IMU_ICS_CSR_A_IMU_PERF_CNT1_ADDR, %g1, %g7
	nop; nop; nop; nop; nop; nop; nop; nop; nop; nop; nop; nop; 
	ldx	[%g7], %g5
	nop; nop; nop; nop; nop; nop; nop; nop; nop; nop; nop; nop; 
	ldx	[%g7], %g5
	stx	%g5, [%l1 + 16]	! write perf cntr 1 value onto pcie bus
	
	! incr cntr 1 select value & exit if done
	inc	%g4
	ldub	[%g4], %l0		! get new cntr 1 select value
	cmp	%l0, 0xff
	be	test_passed
	sll	%l0, 8, %l0
	
	ba	imu_cntr1_loop
	nop

/************************************************************************
   Interrupt Handler
 ************************************************************************/
	.align 64
.global piu_trap_code
piu_trap_code:
	best_set_reg(MONDO_INT_ADATA0, %g4, %g3)
	ldx	[%g3], %g3
	and	%g3, 0x3f, %g3  /* WIP: Mask to get INO */

	cmp	%g3, 62
	be	mondo_62_handler
	nop

	cmp	%g3, 63
	be	mondo_63_handler
	nop
	
	ba	test_failed			! if neither, must be an error

	! read DMU error status registers
mondo_62_handler:
	setx	FIRE_DLC_IMU_ICS_CSR_A_IMU_ERROR_LOG_EN_REG_ADDR, %g1, %g3 ! 631000
	ldx	[%g3+0x808], %l7		! 631808 - DMU Core and Block Error Status Reg
	cmp     %l7, 1				! test if the IMU has an interrupt
	be	rd_imu_error_regs
	
	cmp     %l7, 2				! test if the MMU has an interrupt
	be      rd_mmu_error_regs
	nop
	
	ba	test_failed			! if 0, must be an error
	
	
rd_imu_error_regs:
	ldx	[%g3+0x10], %l3			! 631010 - IMU Interrupt Status Reg
	cmp	%l3, 2				! check for Correctable Err Message
	bne	not_err_cor
	nop
	setx	err_cor_int_cnt,%g1,%l4
	ldx	[%l4], %l5
	inc	%l5
	stx	%l5, [%l4]
	stx	%l3, [%g3+0x18]			! clear error bit
	ldx	[%g3+0x10], %l3			! 631010 - IMU Interrupt Status Reg
	cmp	%l3, 0				! check that error bit is cleared
	be	trap_done
	nop
	ba	test_failed
	nop

not_err_cor:
	cmp	%l3, 4				! check for Nonfatal Err Message
	bne	not_err_nonfatal
	nop
	setx	err_nonfatal_int_cnt,%g1,%l4
	ldx	[%l4], %l5
	inc	%l5
	stx	%l5, [%l4]
	stx	%l3, [%g3+0x18]			! clear error bit
	ldx	[%g3+0x10], %l3			! 631010 - IMU Interrupt Status Reg
	cmp	%l3, 0				! check that error bit is cleared
	be	trap_done
	nop
	ba	test_failed
	nop

not_err_nonfatal:
	cmp	%l3, 8				! check for Fatal Err Message
	bne	test_failed
	nop
	setx	err_fatal_int_cnt,%g1,%l4
	ldx	[%l4], %l5
	inc	%l5
	stx	%l5, [%l4]
	stx	%l3, [%g3+0x18]			! clear error bit
	ldx	[%g3+0x10], %l3			! 631010 - IMU Interrupt Status Reg
	cmp	%l3, 0				! check that error bit is cleared
	be	trap_done
	nop
	ba	test_failed
	nop


	
rd_mmu_error_regs:
	setx	FIRE_DLC_MMU_CSR_A_LOG_ADDR, %g1, %g2	! 641000
	ldx	[%g2+0x10], %l0				! 641010 - MMU Interrupt Status Reg
	ldx	[%g2+0x28], %l1				! 641028 - MMU Translation Fault Address Reg
	ldx	[%g2+0x30], %l2				! 641030 - MMU Translation Fault Status Reg
	b	test_failed				! No errors expected - go to bad trap
	nop
	
	! read PEU error status registers
mondo_63_handler:
	setx	FIRE_DLC_ILU_CIB_CSR_A_ILU_LOG_EN_ADDR, %g1, %g3	! 651000
	ldx	[%g3+0x808], %l7			! 651808 - PEU Core and Block Interrupt Status Reg
	cmp     %l7, 0
	bz	test_failed				! one of the bits should have been set
	
	and	%l7, 0x8, %g4				! test if the ILU has an interrupt
	cmp     %g4, 0
	bnz     rd_ilu_error_regs
	
	and	%l7, 0x4, %g4				! test if its an Uncorrectable error from PEU
	cmp     %g4, 0
	bnz     rd_ue_error_regs
	
	and	%l7, 0x2, %g4				! test if its a Correctable error from PEU
	cmp     %g4, 0
	bnz     rd_ce_error_regs
	nop

rd_oe_error_regs:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_OE_LOG_ADDR, %g1, %g3	! 681000
	ldx	[%g3+0x10], %l0				! 681010 - PEU OE Status Reg
	and	%l0, 0x800, %l1				! test if its a Correctable error from PEU
	cmp     %l1, 0
	bnz     rd_dlpl_error_regs
	nop
	ldx	[%g2+0x28], %l1				! 681028 - PEU OE Rx Hdr1 Log Reg
	ldx	[%g2+0x30], %l2				! 681030 - PEU OE Rx Hdr2 Log Reg
	ldx	[%g2+0x38], %l3				! 681038 - PEU OE Tx Hdr1 Log Reg
	ldx	[%g2+0x40], %l4				! 681040 - PEU OE Tx Hdr2 Log Reg
	b	test_failed				! No errors expected - go to bad trap
	nop

rd_ue_error_regs:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_UE_LOG_ADDR, %g1, %g3	! 691000
	ldx	[%g3+0x10], %l0				! 691010 - PEU UE Status Reg
	ldx	[%g2+0x28], %l1				! 691028 - PEU UE Rx Hdr1 Log Reg
	ldx	[%g2+0x30], %l2				! 691030 - PEU UE Rx Hdr2 Log Reg
	ldx	[%g2+0x38], %l3				! 691038 - PEU UE Tx Hdr1 Log Reg
	ldx	[%g2+0x40], %l4				! 691040 - PEU UE Tx Hdr2 Log Reg
	b	test_failed				! No errors expected - go to bad trap
	nop

rd_ce_error_regs:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_CE_LOG_ADDR, %g1, %g3	! 6a1000
	ldx	[%g3+0x10], %l0				! 6a1010 - PEU CE Status Reg
	b	test_failed				! No errors expected - go to bad trap
	nop

rd_dlpl_error_regs:
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_CORE_STATUS_ADDR, %g1, %g3	! 6e2100
	ldx	[%g3+0x18], %l1				! 6e2118 - PEU DLPL Status Reg
	b	test_failed				! No errors expected - go to bad trap
	nop

rd_ilu_error_regs:
	ldx	[%g3+0x10], %l0				! 651010 - ILU Interrupt Status Reg
	b	test_failed				! No errors expected - go to bad trap
	nop

	! Done.

trap_done:
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_62_ADDR, %g1, %g4)
	stx	%g0, [%g4]
	ldx	[%g4], %l0
	
	best_set_reg(FIRE_DLC_IMU_ISS_CSR_A_CLR_INT_REG_63_ADDR, %g1, %g4)
	stx	%g0, [%g4]
	ldx	[%g4], %l0
	
	best_set_reg(MONDO_INT_ABUSY, %g1, %g4)
	stx	%g0, [%g4]
	ldx	[%g4], %l0
	
	ldxa	[%g0]ASI_SWVR_INTR_R, %l5

	jmpl    %o7+0x8, %g0
	nop

	.align 64
err_cor_int_cnt:      .xword 0
err_fatal_int_cnt:    .xword 0
err_nonfatal_int_cnt: .xword 0
	
/************************************************************************
   Test case data start
 ************************************************************************/

SECTION       .DATA DATA_VA=DMA_DATA_ADDR
attr_data {     
      Name = .DATA,
      hypervisor,
      compressimage
}

.data
	.xword 0x0001020304050607
	.xword 0x08090a0b0c0d0e0f
	.xword 0x1011121314151617
	.xword 0x18191a1b1c1d1e1f
	.xword 0x2021222324252627
	.xword 0x28292a2b2c2d2e2f
	.xword 0x3031323334353637
	.xword 0x38393a3b3c3d3e3f
	
	.xword 0x4041424344454647
	.xword 0x48494a4b4c4d4e4f
	.xword 0x5051525354555657
	.xword 0x58595a5b5c5d5e5f
	.xword 0x6061626364656667
	.xword 0x68696a6b6c6d6e6f
	.xword 0x7071727374757677
	.xword 0x78797a7b7c7d7e7f
	
	.xword 0x8081828384858687
	.xword 0x88898a8b8c8d8e8f
	.xword 0x9091929394959697
	.xword 0x98999a9b9c9d9e9f
	.xword 0xa0a1a2a3a4a5a6a7
	.xword 0xa8a9aaabacadaeaf
	.xword 0xb0b1b2b3b4b5b6b7
	.xword 0xb8b9babbbcbdbebf
	
	.xword 0xc0c1c2c3c4c5c6c7
	.xword 0xc8c9cacbcccdcecf
	.xword 0xd0d1d2d3d4d5d6d7
	.xword 0xd8d9dadbdcdddedf
	.xword 0xe0e1e2e3e4e5e6e7
	.xword 0xe8e9eaebecedeeef
	.xword 0xf0f1f2f3f4f5f6f7
	.xword 0xf8f9fafbfcfdfeff

	.xword 0x0001020304050607
	.xword 0x08090a0b0c0d0e0f
	.xword 0x1011121314151617
	.xword 0x18191a1b1c1d1e1f
	.xword 0x2021222324252627
	.xword 0x28292a2b2c2d2e2f
	.xword 0x3031323334353637
	.xword 0x38393a3b3c3d3e3f
	
	.xword 0x4041424344454647
	.xword 0x48494a4b4c4d4e4f
	.xword 0x5051525354555657
	.xword 0x58595a5b5c5d5e5f
	.xword 0x6061626364656667
	.xword 0x68696a6b6c6d6e6f
	.xword 0x7071727374757677
	.xword 0x78797a7b7c7d7e7f
	
	.xword 0x8081828384858687
	.xword 0x88898a8b8c8d8e8f
	.xword 0x9091929394959697
	.xword 0x98999a9b9c9d9e9f
	.xword 0xa0a1a2a3a4a5a6a7
	.xword 0xa8a9aaabacadaeaf
	.xword 0xb0b1b2b3b4b5b6b7
	.xword 0xb8b9babbbcbdbebf
	
	.xword 0xc0c1c2c3c4c5c6c7
	.xword 0xc8c9cacbcccdcecf
	.xword 0xd0d1d2d3d4d5d6d7
	.xword 0xd8d9dadbdcdddedf
	.xword 0xe0e1e2e3e4e5e6e7
	.xword 0xe8e9eaebecedeeef
	.xword 0xf0f1f2f3f4f5f6f7
	.xword 0xf8f9fafbfcfdfeff
	
/************************************************************************/


/************************************************************************
   IOMMU TTE start
	TTE Format:
63:	48 DEV KEY	- set to 0
47:	39 reserved	- set to 0
38:	13 DATA PA	- set to VA for VA=RA
12:	7  DATA_SOFT	- set to 0
6:	5  reserved	- set to 0
5:	3  FNM MASK	- set to 0
2:	2  KEY VALID	- set to 0
1:	1  DATA_W	- set to 1
0:	0  DATA_V	- set to 1
************************************************************************/

SECTION       .DATA2 DATA_VA=IOMMU_TTE_ADDR
attr_data {     
      Name = .DATA2,
      hypervisor,
      compressimage
}

.data
	init_mem(0x0000000000000003, 256, 8, +, 0, +, 0x0000000000010000)
	
/************************************************************************/
