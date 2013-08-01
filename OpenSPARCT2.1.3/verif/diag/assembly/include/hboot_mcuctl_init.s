/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: hboot_mcuctl_init.s
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
.global mcuctl_init
mcuctl_init:

#ifdef NEC_AMB
#ifndef DTM_ENABLED
#include  "mcu_fbdimm_training.s"
#endif
#endif

        setx    0x8400000000, %l7, %l6
        sethi   %hi(0x00001000), %g1
        sethi   %hi(0x00002000), %g2
        sethi   %hi(0x00003000), %g3
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! For non slam vectors much of this code has been
!! moved to b4 warm
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#ifndef DTM_ENABLED
dimm_init_reg_to_3:
        add     %l6, 0x1a0, %l0		! DRAM_DIMM_INIT_REG
	mov	3, %l3			! Set CKE enable to 1 to assert CKE high to the DIMMs
        stx     %l3, [%l0+%g0]		! (per conversation with Rashid)
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]

! Memory Density Type : 256 Mb, 512 Mb, 1 Gb, 2 Gb
#if defined(DIMM_SIZE_1G)
        add     %l6, 0x008, %l0		! DRAM_RAS_ADDR_WIDTH_REG
        mov     0xe, %l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]
#else
#if defined(DIMM_SIZE_512)
        add     %l6, 0x008, %l0
        mov     0xe, %l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]

        add     %l6, 0x128, %l0		! 8_BANK_REG
        mov     0x0, %l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]
#else
#if defined(DIMM_SIZE_256)
        add     %l6, 0x008, %l0
        mov     0xd, %l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]

        add     %l6, 0x128, %l0
        mov     0x0, %l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]
#else
!! use default  = 2G b
#endif
#endif
#endif
 
! MEMORY CONFIGURATION SETUP

!! Default !!!
#define CHNL_TYPE 0
#define RANK_ADDR 0
#define RANK 	  0			
#define NUM_DIMMS 1
#define AMB_ID    0
#define CAS_LATENCY 3
!!

#ifdef SNG_CHANNEL
#define CHNL_TYPE 1		
#endif
#ifdef DUAL_CHANNEL
#define CHNL_TYPE 0		
#endif

#ifdef RANK_LOW
#define RANK_ADDR 1 		
#endif

#ifdef FBDIMMS_1 
#define NUM_DIMMS 1			
#define AMB_ID    0			
#endif
#ifdef FBDIMMS_2 
#define NUM_DIMMS 2			
#define AMB_ID    8			
#endif
#ifdef FBDIMMS_4 
#define NUM_DIMMS 4			
#define AMB_ID    24			
#endif
#ifdef FBDIMMS_6 
#define NUM_DIMMS 6			
#define AMB_ID    40			
#endif
#ifdef FBDIMMS_8 
#define NUM_DIMMS 0			
#define AMB_ID    56			
#endif

#ifdef STACK_DIMM
#define RANK 1			
#endif

#ifdef VARY_CAS_LATENCY
#define CAS_LATENCY VARY_CAS_LATENCY
#endif

#if defined(SNG_CHANNEL)
        add     %l6, 0x148, %l0 	! SINGLE_CHANNEL_MODE_REG
 	mov  	CHNL_TYPE, %l3
        stx 	%l3, [%l0+%g0]	
        stx 	%l3, [%l0+%g1]	
        stx 	%l3, [%l0+%g2]	
        stx 	%l3, [%l0+%g3]	
#endif

!! HIGH ADDR / SINGLE RANK
#if !defined(RANK_LOW) && !defined(STACK_DIMM)
        add     %l6, 0x140, %l0		! DRAM_SEL_LO_ADDR_BITS_REG
        mov     RANK_ADDR, %l3	
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]

        add     %l6, 0x108, %l0		! DRAM_DIMM_STACK_REG
        mov     RANK, %l3		
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]   
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]

#if defined(FBDIMMS_1) || defined(FBDIMMS_2) || defined(FBDIMMS_4) || defined(FBDIMMS_8)
        add     %l6, 0x218, %l0		! DRAM_DIMM_PRESENT_REG
        mov     NUM_DIMMS, %l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]

        add     %l6, 0x800, %l0		! FBD_CHANNEL_STATE_REG
        mov     AMB_ID, %l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]
#endif
#endif

!! HIGH ADDR / DUAL RANK
#if !defined(RANK_LOW) && defined(STACK_DIMM)
        add     %l6, 0x140, %l0		! DRAM_SEL_LO_ADDR_BITS_REG
        mov     RANK_ADDR, %l3	
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]

        add     %l6, 0x108, %l0		! DRAM_DIMM_STACK_REG
        mov     RANK, %l3		
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]   
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]

#if defined(FBDIMMS_1) || defined(FBDIMMS_2) || defined(FBDIMMS_4) || defined(FBDIMMS_8)
        add     %l6, 0x218, %l0		! DRAM_DIMM_PRESENT_REG
        mov     NUM_DIMMS, %l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]

        add     %l6, 0x800, %l0		! FBD_CHANNEL_STATE_REG
        mov     AMB_ID, %l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]
#endif
#endif

!! LOW ADDR / SINGLE RANK
#if defined(RANK_LOW) && !defined(STACK_DIMM)
        add     %l6, 0x140, %l0		! DRAM_SEL_LO_ADDR_BITS_REG
        mov     RANK_ADDR, %l3	
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]

        add     %l6, 0x108, %l0		! DRAM_DIMM_STACK_REG
        mov     RANK, %l3		
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]   
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]

#if defined(FBDIMMS_1) || defined(FBDIMMS_2) || defined(FBDIMMS_4) || defined(FBDIMMS_6) || defined(FBDIMMS_8)
        add     %l6, 0x218, %l0		! DRAM_DIMM_PRESENT_REG
        mov     NUM_DIMMS, %l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]

        add     %l6, 0x800, %l0		! FBD_CHANNEL_STATE_REG
        mov     AMB_ID, %l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]

#endif
#endif

!! LOW ADDR / DUAL RANK
#if defined(RANK_LOW) && defined(STACK_DIMM)
        add     %l6, 0x140, %l0		! DRAM_SEL_LO_ADDR_BITS_REG
        mov     RANK_ADDR, %l3	
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]

        add     %l6, 0x108, %l0		! DRAM_DIMM_STACK_REG
        mov     RANK, %l3		
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]   
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]

#if defined(FBDIMMS_1) || defined(FBDIMMS_2) || defined(FBDIMMS_4) || defined(FBDIMMS_6) || defined(FBDIMMS_8)
        add     %l6, 0x218, %l0		! DRAM_DIMM_PRESENT_REG
        mov     NUM_DIMMS, %l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]

        add     %l6, 0x800, %l0		! FBD_CHANNEL_STATE_REG
        mov     AMB_ID, %l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]

#endif
#endif

#ifdef DRAM_SCRUB
! DRAM_SCRUB_ENABLE
        add     %l6, 0x040, %l0
        mov     0x1, %l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]

! DRAM_SCRUB_FREQ_REG
        add     %l6, 0x018, %l0
        mov     0x10, %l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]
#endif

!!! Program same values as in mcu_mem_config.v

#ifdef DDR2_533
ddr2_533_ras_reg_init:
        add     %l6, 0x0b0, %l0		! DRAM_TRAS_REG
        mov     0x0c,%l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]
	
!ddr2_533_rp_reg_init:
!        add     %l6, 0x0b8, %l0	! DRAM_TRP_REG - same as POR value
!        mov     0x03,%l3
!        stx     %l3, [%l0+%g0]
!        stx     %l3, [%l0+%g1]
!        stx     %l3, [%l0+%g2]
!        stx     %l3, [%l0+%g3]
	
!ddr2_533_rtp_reg_init:
!        add     %l6, 0x0a8, %l0	! DRAM_TRTP_REG - same as POR value
!        mov     0x02,%l3
!        stx     %l3, [%l0+%g0]
!        stx     %l3, [%l0+%g1]
!        stx     %l3, [%l0+%g2]
!        stx     %l3, [%l0+%g3]
	
ddr2_533_rc_reg_init:
        add     %l6, 0x088, %l0		! DRAM_TRC_REG
#if defined(SNG_CHANNEL)
        mov     0x011,%l3
#else
        mov     0x00f,%l3
#endif
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]
	
!ddr2_533_rcd_reg_init:
!        add     %l6, 0x090, %l0	! DRAM_TRCD_REG - same as POR value
!        mov     0x03,%l3
!        stx     %l3, [%l0+%g0]
!        stx     %l3, [%l0+%g1]
!        stx     %l3, [%l0+%g2]
!        stx     %l3, [%l0+%g3]
	
ddr2_533_rfc_reg_init:
        add     %l6, 0x0c8, %l0		! DRAM_TRFC_REG
        mov     0x014,%l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]
	
ddr2_533_wr_reg_init:
        add     %l6, 0x0c0, %l0		! DRAM_TWR_REG
        mov     0x04,%l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]
	
ddr2_533_iwtr_reg_init:
        add     %l6, 0x0e0, %l0		! DRAM_TIWTR_REG
        mov     0x03,%l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]
	
ddr2_533_rtw_reg_init:
        add     %l6, 0x0a0, %l0		! DRAM_TRTW_REG
#if defined(SNG_CHANNEL)
        mov     0x0,%l3
#else
        mov     0x0,%l3
#endif
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]
	
ddr2_533_rrd_reg_init:
        add     %l6, 0x080, %l0		! DRAM_TRRD_REG
#if defined(SNG_CHANNEL)
        mov     5,%l3
#else
        mov     3,%l3
#endif
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]
	
ddr2_533_faw_reg_init:
        add     %l6, 0x0d8, %l0		! missing from mcu_defines.h
        mov     0x0a,%l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]

#else 	// end of #ifdef DDR2_533

ddr2_667_ras_reg_init:
        add     %l6, 0x0b0, %l0		! DRAM_TRAS_REG
        mov     0x0f,%l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]
	
ddr2_667_rp_reg_init:
        add     %l6, 0x0b8, %l0		! DRAM_TRP_REG
        mov     0x04,%l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]
	
ddr2_667_rtp_reg_init:
        add     %l6, 0x0a8, %l0		! DRAM_TRTP_REG
        mov     0x03,%l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]
	
ddr2_667_ref_reg_init:
        add     %l6, 0x020, %l0		! DRAM_REFRESH_FREQ_REG
        mov     0xa28,%l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]
	
ddr2_667_rc_reg_init:
        add     %l6, 0x088, %l0		! DRAM_TRC_REG
#if defined(SNG_CHANNEL)
        mov     0x015,%l3
#else
        mov     0x013,%l3
#endif
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]
	
ddr2_667_rcd_reg_init:
        add     %l6, 0x090, %l0		! DRAM_TRCD_REG
        mov     0x04,%l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]
	
ddr2_667_rfc_reg_init:
        add     %l6, 0x0c8, %l0		! DRAM_TRFC_REG
        mov     0x019,%l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]
	
ddr2_667_wr_reg_init:
        add     %l6, 0x0c0, %l0		! DRAM_TWR_REG
        mov     0x05,%l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]
	
ddr2_667_iwtr_reg_init:
        add     %l6, 0x0e0, %l0		! DRAM_TIWTR_REG
        mov     0x03,%l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]
	
ddr2_667_rtw_reg_init:
        add     %l6, 0x0a0, %l0		! DRAM_TRTW_REG
#if defined(SNG_CHANNEL)
        mov     0x0,%l3
#else
        mov     0x0,%l3
#endif
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]
	
ddr2_667_rrd_reg_init:
        add     %l6, 0x080, %l0		! DRAM_TRRD_REG
#if defined(SNG_CHANNEL)
        mov     5,%l3
#else
        mov     3,%l3
#endif
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]
	
ddr2_667_faw_reg_init:
        add     %l6, 0x0d8, %l0		! missing from mcu_defines.h
        mov     0x0d,%l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]
	
#endif 	// end of !#ifdef DDR2_533

! DRAM_CAS_LAT_REG
#ifdef VARY_CAS_LATENCY
        add     %l6, 0x010, %l0
        mov     CAS_LATENCY,%l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]
#endif

	
! AT 04/12/06: Do not reset FBDIMM channel in DTM mode
#ifndef DTM_ENABLED
channel_reset_reg_init:	
        add     %l6, 0x810, %l0		! CHANNEL_RESET_REG
        mov     0x1, %l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]

#ifdef POLL_MCU_CHAN_RESET_REG
mcu0_init_poll:
        ldx     [%l0+%g0], %g4
        andcc   %g4, 1, %i5
        bz      mcu1_init_poll
        andcc   %g4, 2, %i5
        bz      mcu0_init_poll
	nop
	EXIT_BAD
	
mcu1_init_poll:
        ldx     [%l0+%g1], %g4
        andcc   %g4, 1, %i5
        bz      mcu2_init_poll
        andcc   %g4, 2, %i5
        bz      mcu1_init_poll
	nop
	EXIT_BAD

mcu2_init_poll:
        ldx     [%l0+%g2], %g4
        andcc   %g4, 1, %i5
        bz      mcu3_init_poll
        andcc   %g4, 2, %i5
        bz      mcu1_init_poll
	nop
	EXIT_BAD

mcu3_init_poll:
        ldx     [%l0+%g3], %g4
        andcc   %g4, 1, %i5
        bz      mcu_init_poll_done
        andcc   %g4, 2, %i5
        bz      mcu3_init_poll
	nop
	EXIT_BAD
#endif	// ifdef POLL_MCU_CHAN_RESET_REG
#endif	// ifndef DTM_ENABLED

#endif  // ifndef NON_SLAM_VECTORS

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! programm drif_init
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#ifdef DTM_ENABLED


!  04/12/06
#define DIMM_INIT_DATA	0x0000000000000002	
mcu_init_poll_done:
        add     %l6, 0x1a0, %l0		! DRAM_DIMM_INIT_REG
!  04/12/06:  need to program DIMM INIT REG to 2.
	mov	DIMM_INIT_DATA, %l3
#ifdef BANK23
        stx     %l3, [%l0+%g1]
#endif
#ifdef BANK45
        stx     %l3, [%l0+%g2]
#endif
#ifdef BANK67
        stx     %l3, [%l0+%g3]
#endif
! 04/12/06: Enable MCU0 last, which kicks off counters in Sun AMB model
#ifdef BANK01
        stx     %l3, [%l0+%g0]
#endif

#endif
done_mcuctl_init:

