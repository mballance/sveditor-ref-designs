/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mcu_fbdimm_training.s
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
mcu_fbdimm_training:
mcuctl_init:

        setx    0x8400000000, %l7, %l6
        sethi   %hi(0x00001000), %g1
        sethi   %hi(0x00002000), %g2
        sethi   %hi(0x00003000), %g3

/***
!DRAM_DIMM_INIT_REG
        add     %l6, 0x1a0, %l0
        mov     0x0, %l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]

/***added from SAT (NEW) ***/
        add     %l6, 0x800, %l5
        stx     %g0, [%l5+%g0]
        stx     %g0, [%l5+%g1]
        stx     %g0, [%l5+%g2]
        stx     %g0, [%l5+%g3]

        add     %l6, 0x808, %l5
        mov     0x9, %l3
        stx     %l3, [%l5+%g0]
        stx     %l3, [%l5+%g1]
        stx     %l3, [%l5+%g2]
        stx     %l3, [%l5+%g3]

/***End from SAT (NEW) ***/

! CHANNEL_RESET_REG
        add     %l6, 0x810, %l5
        mov     0x1, %l3
        stx     %l3, [%l5+%g0]
        stx     %l3, [%l5+%g1]
        stx     %l3, [%l5+%g2]
        stx     %l3, [%l5+%g3]
***/

load_fbd_chnl_state_reg:
        add     %l6, 0x800, %l4
	mov     0x6,%l1

Poll_for1st_link_training:
mcu0:
	ldx     [%l4+%g0], %g4
	andcc   %g4,0xf,%l3
	cmp     %l1,%l3
	bne     mcu0
mcu1:
	ldx     [%l4+%g1], %g4
	andcc   %g4,0xf,%l3
        cmp     %l1,%l3
        bne     mcu1
mcu2:
	ldx     [%l4+%g2], %g4
	andcc   %g4,0xf,%l3
        cmp     %l1,%l3
        bne     mcu2
mcu3:
	ldx     [%l4+%g3], %g4
	andcc   %g4,0xf,%l3
        cmp     %l1,%l3
        bne     mcu3

/***!#ifdef FBDIMMS_1***/
one_fbdimm:
        mov     0x1,%g4
/***!#endif ***/
#ifdef FBDIMMS_2
        mov     0x2,%g4
        mov     0x2,%i5
#endif
#ifdef FBDIMMS_4
        mov     0x4,%g4
        mov     0x4,%i5
#endif
#ifdef FBDIMMS_6
        mov     0x6,%g4
        mov     0x6,%i5
#endif
#ifdef FBDIMMS_8
        mov     0x8,%g4
        mov     0x8,%i5
#endif

        set     0x8000,%i5
amb_drc_reg_init:
step_1st:
        set     0x900,%g4
        add     %l6, %g4, %l0
        set     0x37c, %l3
        or      %l3, %g4, %l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]

amb_drc_2nd_step:
        add     %l6, 0x908, %l1
        set     0x633, %l4
        stx     %l4, [%l1+%g0]
        stx     %l4, [%l1+%g1]
        stx     %l4, [%l1+%g2]
        stx     %l4, [%l1+%g3]

amb_drc_3rd_step:
	or      %l3, %i5, %l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]

amb_drc_4th_step:
        !set     0x733, %l3
        stx     %l4, [%l1+%g0]
        stx     %l4, [%l1+%g1]
        stx     %l4, [%l1+%g2]
        stx     %l4, [%l1+%g3]


amb_cmd2data_reg_init:
step_5th:
        set     0x1e8, %l3
	or      %l3, %g4, %l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]

amb_cmd2data_6th_step:
        set     0x20, %l4
        stx     %l4, [%l1+%g0]
        stx     %l4, [%l1+%g1]
        stx     %l4, [%l1+%g2]
        stx     %l4, [%l1+%g3]


amb_cmd2data_7th_step:
	or      %l3, %i5, %l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]

amb_cmd2data_8th_step:
!       set     0x20, %l4
        stx     %l4, [%l1+%g0]
        stx     %l4, [%l1+%g1]
        stx     %l4, [%l1+%g2]
        stx     %l4, [%l1+%g3]


amb_dsreftc_reg_init:
step_9th:
        set     0x374, %l3
	or      %l3, %g4, %l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]
amb_dsreftc_10th_step:
	set     0x56f7,%l4
#ifdef STACK_DIMM
	set     0x20000000,%g4
	or      %l4, %g4, %l4
#endif
        stx     %l4, [%l1+%g0]
        stx     %l4, [%l1+%g1]
        stx     %l4, [%l1+%g2]
        stx     %l4, [%l1+%g3]

amb_dsreftc_11th_step:
	or      %l3, %i5, %l3
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]
amb_dsreftc_12th_step:
        stx     %l4, [%l1+%g0]
        stx     %l4, [%l1+%g1]
        stx     %l4, [%l1+%g2]
        stx     %l4, [%l1+%g3]

set_chnl_reg_2nd_link_train:
! CHANNEL_RESET_REG
        !add     %l6, 0x810, %l5
        mov     0x1, %l3
        stx     %l3, [%l5+%g0]
        stx     %l3, [%l5+%g1]
        stx     %l3, [%l5+%g2]
        stx     %l3, [%l5+%g3]

set_808:
        add     %l6, 0x808, %l4
        !mov     0x1, %l3
        stx     %l3, [%l4+%g0]
        stx     %l3, [%l4+%g1]
        stx     %l3, [%l4+%g2]
        stx     %l3, [%l4+%g3]

        mov     0x6,%l2
load_fbd_chnl_state_reg_2nd_link_train:
        add     %l6, 0x800, %l4



Poll_for2nd_link_training_complete:
mcu0_2:
        ldx     [%l4+%g0], %g4
        andcc   %g4,0xf,%i5
        cmp     %l2,%i5
        bne     mcu0_2
        nop
mcu1_2:
        ldx     [%l4+%g1], %g4
        andcc   %g4,0xf,%i5
        cmp     %l2,%i5
        bne     mcu1_2
        nop
mcu2_2:
        ldx     [%l4+%g2], %g4
        andcc   %g4,0xf,%i5
        cmp     %l2,%i5
        bne     mcu2_2
        nop
mcu3_2:
        ldx     [%l4+%g3], %g5
        andcc   %g5,0xf,%i5
        cmp     %l2,%i5
        bne     mcu3_2
        nop
Polling_complete:
nop

init_1a0_done_0:
!DRAM_DIMM_INIT_REG
        add     %l6, 0x1a0, %l2
        !mov     0x1, %l3
        stx     %l3, [%l2+%g0]
        stx     %l3, [%l2+%g1]
        stx     %l3, [%l2+%g2]
        stx     %l3, [%l0+%g3]

/***!#ifdef FBDIMMS_1***/
one_fbdimm_1:
	mov     0x1,%g4
	mov     0x1,%i5
/***!#endif ***/
#ifdef FBDIMMS_2
	mov     0x2,%g4
	mov     0x2,%i5
#endif
#ifdef FBDIMMS_4
	mov     0x4,%g4
	mov     0x4,%i5
#endif
#ifdef FBDIMMS_6
	mov     0x6,%g4
	mov     0x6,%i5
#endif
#ifdef FBDIMMS_8
	mov     0x8,%g4
	mov     0x8,%i5
#endif



done_mcu_fbdimm_2nd_link_training:
	sllx    %g4,11,%l2
	set     0x440,%g5
	or      %g5,%l2,%l3  ! l3 has DCALCSR_REG_ADDR_data 64'h440
	set     0x444,%g6
	or      %g6,%l2,%l6  ! l6 has DCALADDR_REG_ADDR_data 64'h444
	set     0x8000,%l2   ! l1 has channel b
	or      %l2,%l3,%g4  ! g4 has DCALCSR_REG_ADDR_data channel b 64'h8440
	or      %l2,%l6,%g5  ! g5 has DCALADDR_REG_ADDR_data channel b 64'8h444
	
	
send_nop_fromMCU:
!       add     %l6, 0x900, %l0
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]
send_nop_2nd_step:
!       add     %l6, 0x908, %l1
	set    0x80600000,%g6
        stx     %g6, [%l1+%g0]
        stx     %g6, [%l1+%g1]
        stx     %g6, [%l1+%g2]
        stx     %g6, [%l1+%g3]
send_nop_3rd_step:
!       add     %l6, 0x900, %l0
        stx     %g4, [%l0+%g0]
        stx     %g4, [%l0+%g1]
        stx     %g4, [%l0+%g2]
        stx     %g4, [%l0+%g3]
send_nop_4th_step:
!       add     %l6, 0x908, %l1
!       setx    0x80600000,%i2,%g6
        stx     %g6, [%l1+%g0]
        stx     %g6, [%l1+%g1]
        stx     %g6, [%l1+%g2]
        stx     %g6, [%l1+%g3]
send_nop_5th_step:
!       add     %l6, 0x900, %l0
        sllx    %i5,11,%g7
        set     0x37c, %i4
        or      %i4,%g7,%g6  ! l3 has DCALCSR_REG_ADDR_data 64'h440
        stx     %g6, [%l0+%g0]
        stx     %g6, [%l0+%g1]
        stx     %g6, [%l0+%g2]
        stx     %g6, [%l0+%g3]
send_nop_6th_step:
!       add     %l6, 0x908, %l1
        set     0x633,%g7
        stx     %g7, [%l1+%g0]
        stx     %g7, [%l1+%g1]
        stx     %g7, [%l1+%g2]
        stx     %g7, [%l1+%g3]
send_nop_7th_step:
	set     0x8000, %i4
        or      %i4,%g6,%g6  ! l3 has DCALCSR_REG_ADDR_data 64'h440
        stx     %g6, [%l0+%g0]
        stx     %g6, [%l0+%g1]
        stx     %g6, [%l0+%g2]
        stx     %g6, [%l0+%g3]
send_nop_8th_step:
!       add     %l6, 0x908, %l1
        stx     %g7, [%l1+%g0]
        stx     %g7, [%l1+%g1]
        stx     %g7, [%l1+%g2]
        stx     %g7, [%l1+%g3]



send_precharge:
!       add     %l6, 0x900, %l0
        stx     %l6, [%l0+%g0]
        stx     %l6, [%l0+%g1]
        stx     %l6, [%l0+%g2]
        stx     %l6, [%l0+%g3]
send_precharge_2nd_step:
!       add     %l6, 0x908, %l1
        set     0x1c000000,%g6
        stx     %g6, [%l1+%g0]
        stx     %g6, [%l1+%g1]
        stx     %g6, [%l1+%g2]
        stx     %g6, [%l1+%g3]
send_precharge_3rd_step:
!       add     %l6, 0x900, %l0
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]
send_precharge_4th_step:
!       add     %l6, 0x908, %l1
        set     0x80600002,%g6
        stx     %g6, [%l1+%g0]
        stx     %g6, [%l1+%g1]
        stx     %g6, [%l1+%g2]
        stx     %g6, [%l1+%g3]

send_precharge_5th_step:
!       add     %l6, 0x900, %l0
        stx     %g5, [%l0+%g0]
        stx     %g5, [%l0+%g1]
        stx     %g5, [%l0+%g2]
        stx     %g5, [%l0+%g3]
send_precharge_6th_step:
!       add     %l6, 0x908, %l1
        set     0x1c000000, %g6
        stx     %g6, [%l1+%g0]
        stx     %g6, [%l1+%g1]
        stx     %g6, [%l1+%g2]
        stx     %g6, [%l1+%g3]
send_precharge_7th_step:
!       add     %l6, 0x900, %l0
        stx     %g4, [%l0+%g0]
        stx     %g4, [%l0+%g1]
        stx     %g4, [%l0+%g2]
        stx     %g4, [%l0+%g3]
send_precharge_8th_step:
!       add     %l6, 0x908, %l1
        set     0x80600002, %g6
        stx     %g6, [%l1+%g0]
        stx     %g6, [%l1+%g1]
        stx     %g6, [%l1+%g2]
        stx     %g6, [%l1+%g3]

send_emrs:
!       add     %l6, 0x900, %l0
        stx     %l6, [%l0+%g0]
        stx     %l6, [%l0+%g1]
        stx     %l6, [%l0+%g2]
        stx     %l6, [%l0+%g3]
send_emrs_2nd_step:
!       add     %l6, 0x908, %l1
        mov     0x2, %g7
        stx     %g7, [%l1+%g0]
        stx     %g7, [%l1+%g1]
        stx     %g7, [%l1+%g2]
        stx     %g7, [%l1+%g3]
send_emrs_3rd_step:
!       add     %l6, 0x900, %l0
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]
send_emrs_4th_step:
!       add     %l6, 0x908, %l1
        set     0x80600003,%g6
        stx     %g6, [%l1+%g0]
        stx     %g6, [%l1+%g1]
        stx     %g6, [%l1+%g2]
        stx     %g6, [%l1+%g3]

send_emrs_5th_step:
!       add     %l6, 0x900, %l0
        stx     %g5, [%l0+%g0]
        stx     %g5, [%l0+%g1]
        stx     %g5, [%l0+%g2]
        stx     %g5, [%l0+%g3]
send_emrs_6th_step:
!       add     %l6, 0x908, %l1
        stx     %g7, [%l1+%g0]
        stx     %g7, [%l1+%g1]
        stx     %g7, [%l1+%g2]
        stx     %g7, [%l1+%g3]

send_emrs_7th_step:
!       add     %l6, 0x900, %l0
        stx     %g4, [%l0+%g0]
        stx     %g4, [%l0+%g1]
        stx     %g4, [%l0+%g2]
        stx     %g4, [%l0+%g3]
send_emrs_8th_step:
!       add     %l6, 0x908, %l1
        stx     %g6, [%l1+%g0]
        stx     %g6, [%l1+%g1]
        stx     %g6, [%l1+%g2]
        stx     %g6, [%l1+%g3]

send_emrs_3:
!       add     %l6, 0x900, %l0
        stx     %l6, [%l0+%g0]
        stx     %l6, [%l0+%g1]
        stx     %l6, [%l0+%g2]
        stx     %l6, [%l0+%g3]
send_emrs_3_2nd_step:
!       add     %l6, 0x908, %l1
        mov     0x3, %g7
        stx     %g7, [%l1+%g0]
        stx     %g7, [%l1+%g1]
        stx     %g7, [%l1+%g2]
        stx     %g7, [%l1+%g3]
send_emrs_3_3rd_step:
!       add     %l6, 0x900, %l0
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]
send_emrs_3_4th_step:
!       add     %l6, 0x908, %l1
!       set     0x80600003,%g6
        stx     %g6, [%l1+%g0]
        stx     %g6, [%l1+%g1]
        stx     %g6, [%l1+%g2]
        stx     %g6, [%l1+%g3]

send_emrs_3_5th_step:
!       add     %l6, 0x900, %l0
        stx     %g5, [%l0+%g0]
        stx     %g5, [%l0+%g1]
        stx     %g5, [%l0+%g2]
        stx     %g5, [%l0+%g3]
send_emrs_3_6th_step:
!       add     %l6, 0x908, %l1
        stx     %g7, [%l1+%g0]
        stx     %g7, [%l1+%g1]
        stx     %g7, [%l1+%g2]
        stx     %g7, [%l1+%g3]

send_emrs_3_7th_step:
!       add     %l6, 0x900, %l0
        stx     %g4, [%l0+%g0]
        stx     %g4, [%l0+%g1]
        stx     %g4, [%l0+%g2]
        stx     %g4, [%l0+%g3]
send_emrs_3_8th_step:
!       add     %l6, 0x908, %l1
        stx     %g6, [%l1+%g0]
        stx     %g6, [%l1+%g1]
        stx     %g6, [%l1+%g2]
        stx     %g6, [%l1+%g3]

send_emrs_1:
!       add     %l6, 0x900, %l0
        stx     %l6, [%l0+%g0]
        stx     %l6, [%l0+%g1]
        stx     %l6, [%l0+%g2]
        stx     %l6, [%l0+%g3]
send_emrs_1_2nd_step:
!       add     %l6, 0x908, %l1
        set     0x000001, %g7
        stx     %g7, [%l1+%g0]
        stx     %g7, [%l1+%g1]
        stx     %g7, [%l1+%g2]
        stx     %g7, [%l1+%g3]
send_emrs_1_3rd_step:
!       add     %l6, 0x900, %l0
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]
send_emrs_1_4th_step:
!       add     %l6, 0x908, %l1
!       set    0x80600003,%g6
        stx     %g6, [%l1+%g0]
        stx     %g6, [%l1+%g1]
        stx     %g6, [%l1+%g2]
        stx     %g6, [%l1+%g3]

send_emrs_1_5th_step:
!       add     %l6, 0x900, %l0
        stx     %g5, [%l0+%g0]
        stx     %g5, [%l0+%g1]
        stx     %g5, [%l0+%g2]
        stx     %g5, [%l0+%g3]
send_emrs_1_6th_step:
!       add     %l6, 0x908, %l1
        stx     %g7, [%l1+%g0]
        stx     %g7, [%l1+%g1]
        stx     %g7, [%l1+%g2]
        stx     %g7, [%l1+%g3]

send_emrs_1_7th_step:
!       add     %l6, 0x900, %l0
        stx     %g4, [%l0+%g0]
        stx     %g4, [%l0+%g1]
        stx     %g4, [%l0+%g2]
        stx     %g4, [%l0+%g3]
send_emrs_1_8th_step:
!       add     %l6, 0x908, %l1
        stx     %g6, [%l1+%g0]
        stx     %g6, [%l1+%g1]
        stx     %g6, [%l1+%g2]
        stx     %g6, [%l1+%g3]


#ifdef SNG_CHANNEL
	set    0x30000,%g6
#endif
/***#ifdef DUAL_CHANNEL ***/
dual_channel_1:
	set    0x20000,%g6
/***#endif ***/


send_mrs:
!       add     %l6, 0x900, %l0
        stx     %l6, [%l0+%g0]
        stx     %l6, [%l0+%g1]
        stx     %l6, [%l0+%g2]
        stx     %l6, [%l0+%g3]
send_mrs_2nd_step:
!       add     %l6, 0x908, %l1
        set     0x5300000, %g7
	or      %g7, %g6, %g7
        stx     %g7, [%l1+%g0]
        stx     %g7, [%l1+%g1]
        stx     %g7, [%l1+%g2]
        stx     %g7, [%l1+%g3]
send_mrs_3rd_step:
!       add     %l6, 0x900, %l0
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]
send_mrs_4th_step:
!       add     %l6, 0x908, %l1
        set     0x80600003,%g6
        stx     %g6, [%l1+%g0]
        stx     %g6, [%l1+%g1]
        stx     %g6, [%l1+%g2]
        stx     %g6, [%l1+%g3]

send_mrs_5th_step:
!       add     %l6, 0x900, %l0
        stx     %g5, [%l0+%g0]
        stx     %g5, [%l0+%g1]
        stx     %g5, [%l0+%g2]
        stx     %g5, [%l0+%g3]
send_mrs_6th_step:
!       add     %l6, 0x908, %l1
        stx     %g7, [%l1+%g0]
        stx     %g7, [%l1+%g1]
        stx     %g7, [%l1+%g2]
        stx     %g7, [%l1+%g3]

send_mrs_7th_step:
!       add     %l6, 0x900, %l0
        stx     %g4, [%l0+%g0]
        stx     %g4, [%l0+%g1]
        stx     %g4, [%l0+%g2]
        stx     %g4, [%l0+%g3]
send_mrs_8th_step:
!       add     %l6, 0x908, %l1
        stx     %g6, [%l1+%g0]
        stx     %g6, [%l1+%g1]
        stx     %g6, [%l1+%g2]
        stx     %g6, [%l1+%g3]


send_all_precharge:
!       add     %l6, 0x900, %l0
        stx     %l6, [%l0+%g0]
        stx     %l6, [%l0+%g1]
        stx     %l6, [%l0+%g2]
        stx     %l6, [%l0+%g3]
send_all_precharge_2nd_step:
!       add     %l6, 0x908, %l1
        set     0x1c000000,%g7
        stx     %g7, [%l1+%g0]
        stx     %g7, [%l1+%g1]
        stx     %g7, [%l1+%g2]
        stx     %g7, [%l1+%g3]
send_all_precharge_3rd_step:
!       add     %l6, 0x900, %l0
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]
send_all_precharge_4th_step:
!       add     %l6, 0x908, %l1
        set     0x80600002,%g6
        stx     %g6, [%l1+%g0]
        stx     %g6, [%l1+%g1]
        stx     %g6, [%l1+%g2]
        stx     %g6, [%l1+%g3]

send_all_precharge_5th_step:
!       add     %l6, 0x900, %l0
        stx     %g5, [%l0+%g0]
        stx     %g5, [%l0+%g1]
        stx     %g5, [%l0+%g2]
        stx     %g5, [%l0+%g3]
send_all_precharge_6th_step:
!       add     %l6, 0x908, %l1
!       set     0x1c000000, %g7
        stx     %g7, [%l1+%g0]
        stx     %g7, [%l1+%g1]
        stx     %g7, [%l1+%g2]
        stx     %g7, [%l1+%g3]
send_all_precharge_7th_step:
!       add     %l6, 0x900, %l0
        stx     %g4, [%l0+%g0]
        stx     %g4, [%l0+%g1]
        stx     %g4, [%l0+%g2]
        stx     %g4, [%l0+%g3]
send_all_precharge_8th_step:
!       add     %l6, 0x908, %l1
!       set     0x80600002, %g6
        stx     %g6, [%l1+%g0]
        stx     %g6, [%l1+%g1]
        stx     %g6, [%l1+%g2]
        stx     %g6, [%l1+%g3]


send_auto_refresh1st_step:
!       add     %l6, 0x900, %l0
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]
send_auto_refresh2nd_step:
!       add     %l6, 0x908, %l1
        set     0x80600001,%g6
        stx     %g6, [%l1+%g0]
        stx     %g6, [%l1+%g1]
        stx     %g6, [%l1+%g2]
        stx     %g6, [%l1+%g3]
send_auto_refresh3rd_step:
!       add     %l6, 0x900, %l0
        stx     %g4, [%l0+%g0]
        stx     %g4, [%l0+%g1]
        stx     %g4, [%l0+%g2]
        stx     %g4, [%l0+%g3]
send_auto_refresh4th_step:
!       add     %l6, 0x908, %l1
!       set     0x80600001, %g6
        stx     %g6, [%l1+%g0]
        stx     %g6, [%l1+%g1]
        stx     %g6, [%l1+%g2]
        stx     %g6, [%l1+%g3]


Wait_state:
	nop;
	nop;
	nop;
	nop;
	nop;
	nop;
	nop;
	nop;
	nop;
	nop;
	nop;
	nop;
	nop;
	nop;
	nop;
	nop;
	nop;
	nop;
	nop;
	nop;
	nop;
send_auto_refresh_again_1st_step:
!       add     %l6, 0x900, %l0
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]
send_auto_refresh_again_2nd_step:
!       add     %l6, 0x908, %l1
!       set     0x80600001,%g6
        stx     %g6, [%l1+%g0]
        stx     %g6, [%l1+%g1]
        stx     %g6, [%l1+%g2]
        stx     %g6, [%l1+%g3]
send_auto_refresh_again_3rd_step:
!       add     %l6, 0x900, %l0
        stx     %g4, [%l0+%g0]
        stx     %g4, [%l0+%g1]
        stx     %g4, [%l0+%g2]
        stx     %g4, [%l0+%g3]
send_auto_refresh_again_4th_step:
!       add     %l6, 0x908, %l1
!       set     0x80600001, %g6
        stx     %g6, [%l1+%g0]
        stx     %g6, [%l1+%g1]
        stx     %g6, [%l1+%g2]
        stx     %g6, [%l1+%g3]


#ifdef SNG_CHANNEL
        set    0x30000,%g6
#endif
/***#ifdef DUAL_CHANNEL***/
dual_channel_0:
        set    0x20000,%g6
/**#endif***/


issue_mrs:
!       add     %l6, 0x900, %l0
        stx     %l6, [%l0+%g0]
        stx     %l6, [%l0+%g1]
        stx     %l6, [%l0+%g2]
        stx     %l6, [%l0+%g3]
issue_mrs_2nd_step:
!       add     %l6, 0x908, %l1
        set     0x4300000, %g7
        or      %g7, %g6, %g7
        stx     %g7, [%l1+%g0]
        stx     %g7, [%l1+%g1]
        stx     %g7, [%l1+%g2]
        stx     %g7, [%l1+%g3]
issue_mrs_3rd_step:
!       add     %l6, 0x900, %l0
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]
issue_mrs_4th_step:
!       add     %l6, 0x908, %l1
        set     0x80600003,%g6
        stx     %g6, [%l1+%g0]
        stx     %g6, [%l1+%g1]
        stx     %g6, [%l1+%g2]
        stx     %g6, [%l1+%g3]

issue_mrs_5th_step:
!       add     %l6, 0x900, %l0
        stx     %g5, [%l0+%g0]
        stx     %g5, [%l0+%g1]
        stx     %g5, [%l0+%g2]
        stx     %g5, [%l0+%g3]
issue_mrs_6th_step:
!       add     %l6, 0x908, %l1
        stx     %g7, [%l1+%g0]
        stx     %g7, [%l1+%g1]
        stx     %g7, [%l1+%g2]
        stx     %g7, [%l1+%g3]

issue_mrs_7th_step:
!       add     %l6, 0x900, %l0
        stx     %g4, [%l0+%g0]
        stx     %g4, [%l0+%g1]
        stx     %g4, [%l0+%g2]
        stx     %g4, [%l0+%g3]
issue_mrs_8th_step:
!       add     %l6, 0x908, %l1
        stx     %g6, [%l1+%g0]
        stx     %g6, [%l1+%g1]
        stx     %g6, [%l1+%g2]
        stx     %g6, [%l1+%g3]


issue_emrs_1:
!       add     %l6, 0x900, %l0
        stx     %l6, [%l0+%g0]
        stx     %l6, [%l0+%g1]
        stx     %l6, [%l0+%g2]
        stx     %l6, [%l0+%g3]
issue_emrs_1_2nd_step:
!       add     %l6, 0x908, %l1
        set     0x3800001, %g7
        stx     %g7, [%l1+%g0]
        stx     %g7, [%l1+%g1]
        stx     %g7, [%l1+%g2]
        stx     %g7, [%l1+%g3]
issue_emrs_1_3rd_step:
!       add     %l6, 0x900, %l0
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]
issue_emrs_1_4th_step:
!       add     %l6, 0x908, %l1
!       set     0x80600003,%g6
        stx     %g6, [%l1+%g0]
        stx     %g6, [%l1+%g1]
        stx     %g6, [%l1+%g2]
        stx     %g6, [%l1+%g3]

issue_emrs_1_5th_step:
!       add     %l6, 0x900, %l0
        stx     %g5, [%l0+%g0]
        stx     %g5, [%l0+%g1]
        stx     %g5, [%l0+%g2]
        stx     %g5, [%l0+%g3]
issue_emrs_1_6th_step:
!       add     %l6, 0x908, %l1
        stx     %g7, [%l1+%g0]
        stx     %g7, [%l1+%g1]
        stx     %g7, [%l1+%g2]
        stx     %g7, [%l1+%g3]

issue_emrs_1_7th_step:
!       add     %l6, 0x900, %l0
        stx     %g4, [%l0+%g0]
        stx     %g4, [%l0+%g1]
        stx     %g4, [%l0+%g2]
        stx     %g4, [%l0+%g3]
issue_emrs_1_8th_step:
!       add     %l6, 0x908, %l1
        stx     %g6, [%l1+%g0]
        stx     %g6, [%l1+%g1]
        stx     %g6, [%l1+%g2]
        stx     %g6, [%l1+%g3]

issue_emrs_2:
!       add     %l6, 0x900, %l0
        stx     %l6, [%l0+%g0]
        stx     %l6, [%l0+%g1]
        stx     %l6, [%l0+%g2]
        stx     %l6, [%l0+%g3]
issue_emrs_2_2nd_step:
!       add     %l6, 0x908, %l1
        set     0x1800001, %g7
        stx     %g7, [%l1+%g0]
        stx     %g7, [%l1+%g1]
        stx     %g7, [%l1+%g2]
        stx     %g7, [%l1+%g3]
issue_emrs_2_3rd_step:
!       add     %l6, 0x900, %l0
        stx     %l3, [%l0+%g0]
        stx     %l3, [%l0+%g1]
        stx     %l3, [%l0+%g2]
        stx     %l3, [%l0+%g3]
issue_emrs_2_4th_step:
!       add     %l6, 0x908, %l1
!       set     0x80600003,%g6
        stx     %g6, [%l1+%g0]
        stx     %g6, [%l1+%g1]
        stx     %g6, [%l1+%g2]
        stx     %g6, [%l1+%g3]

issue_emrs_2_5th_step:
!       add     %l6, 0x900, %l0
        stx     %g5, [%l0+%g0]
        stx     %g5, [%l0+%g1]
        stx     %g5, [%l0+%g2]
        stx     %g5, [%l0+%g3]
issue_emrs_2_6th_step:
!       add     %l6, 0x908, %l1
        stx     %g7, [%l1+%g0]
        stx     %g7, [%l1+%g1]
        stx     %g7, [%l1+%g2]
        stx     %g7, [%l1+%g3]

issue_emrs_2_7th_step:
!       add     %l6, 0x900, %l0
        stx     %g4, [%l0+%g0]
        stx     %g4, [%l0+%g1]
        stx     %g4, [%l0+%g2]
        stx     %g4, [%l0+%g3]
issue_emrs_2_8th_step:
!       add     %l6, 0x908, %l1
        stx     %g6, [%l1+%g0]
        stx     %g6, [%l1+%g1]
        stx     %g6, [%l1+%g2]
        stx     %g6, [%l1+%g3]

dram_init_done:
	clr %g4
	clr %g5
	clr %g6
	clr %l0
	clr %l1
	clr %l2
	clr %l3
	clr %l3
	clr %l4
	clr %l5
	clr %i5
	clr %g1
	clr %g2
	clr %g3
