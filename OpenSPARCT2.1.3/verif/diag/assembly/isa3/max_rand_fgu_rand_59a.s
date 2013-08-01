/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: max_rand_fgu_rand_59a.s
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
#define MAIN_PAGE_HV_ALSO
#define MAX_SPU_TRAP_CNT 1
#define NO_TRAPCHECK
#define H_HT0_Control_Word_Queue_Interrupt_0x3c
#define My_HT0_Control_Word_Queue_Interrupt_0x3c \
  sub %i6, 1, %i6; \
  retry;

! next is for fgu part vvvvvvvvvvvvvvvvvv
# 1 "/import/n2-aus-localdir1/co132877/n2cdmspp/verif/diag/assembly/uarch/spu/include/fguSpuDefines.h"
#define FP_IEEE_754_ENABLE 0x1
!! previous causes define of
!! ENABLE_T0_Fp_exception_ieee_754_0x21
!! ENABLE_HT0_Fp_exception_ieee_754_0x21
#
#define FP_EXCP_OTHER_ENABLE 0x1
!! previous causes define of
!! ENABLE_T0_Fp_exception_other_0x22
!! ENABLE_HT0_Fp_exception_other_0x22
#
#define DIV_ZERO_ENABLE 0x1
!! previous causes define of
!! ENABLE_T0_Division_By_Zero_0x28 and
!! ENABLE_HT0_Division_By_Zero_0x28
#
#define ILLEGAL_ENABLE 0x1
!! previous causes define of
!! ENABLE_T0_Illegal_instruction_0x10
!! ENABLE_HT0_Illegal_instruction_0x10
#define ENABLE_T1_Illegal_instruction_0x10
#define ENABLE_HT1_Illegal_instruction_0x10
#
!!!!!!#define PRIVILEGED_ACTION_ENABLE 0x1
!! previous causes define of
!! ENABLE_T0_Privileged_Action_0x37
!! ENABLE_HT0_Privileged_Action_0x37
#
!!!!!!#define PRIVILEGED_OPCODE_ENABLE 0x1
!! previous causes define of
!! ENABLE_T0_Privileged_opcode_0x11
!! ENABLE_HT0_Privileged_opcode_0x11
#
!!!!!!#define INSTRUCTION_ACCESS_EXCEPTION_ENABLE 0x1
!! previous causes define of
!! ENABLE_T0_Instruction_access_exception_0x08
!! ENABLE_HT0_Instruction_access_exception_0x08
#
!!!!!!#define DATA_ACCESS_EXCEPTION_ENABLE 0x1
!! previous causes define of
!! ENABLE_T0_Data_Access_Exception_0x30
!! ENABLE_HT0_Data_Access_Exception_0x30
#
#define MAIN_PAGE_NUCLEUS_ALSO

!----------------------------------------------------------
!!!!!!#define NOSPEC_EN

!!!!!!
#define  MAIN_PAGE_HV_ALSO 
#define SKIP_TRAPCHECK

#define ENABLE_T0_Mem_Address_Not_Aligned_0x34
#define ENABLE_T0_Lddf_Mem_Address_Not_Aligned_0x35
#define ENABLE_T0_Stdf_Mem_Address_Not_Aligned_0x36
#define ENABLE_HT0_Mem_Address_Not_Aligned_0x34
#define ENABLE_HT0_Lddf_Mem_Address_Not_Aligned_0x35
#define ENABLE_HT0_Stdf_Mem_Address_Not_Aligned_0x36
#define ENABLE_T0_Window_Fill_0_Normal_0xc0
#define ENABLE_T0_Window_Fill_1_Normal_0xc4
#define ENABLE_T0_Window_Fill_2_Normal_0xc8
#define ENABLE_T0_Window_Fill_3_Normal_0xcc
#define ENABLE_T0_Window_Fill_4_Normal_0xd0
#define ENABLE_T0_Window_Fill_5_Normal_0xd4
#define ENABLE_T0_Window_Fill_6_Normal_0xd8
#define ENABLE_T0_Window_Fill_7_Normal_0xdc
#define ENABLE_HT0_Window_Fill_0_Normal_0xc0
#define ENABLE_HT0_Window_Fill_1_Normal_0xc4
#define ENABLE_HT0_Window_Fill_2_Normal_0xc8
#define ENABLE_HT0_Window_Fill_3_Normal_0xcc
#define ENABLE_HT0_Window_Fill_4_Normal_0xd0
#define ENABLE_HT0_Window_Fill_5_Normal_0xd4
#define ENABLE_HT0_Window_Fill_6_Normal_0xd8
#define ENABLE_HT0_Window_Fill_7_Normal_0xdc
#define ENABLE_T0_Window_Spill_0_Normal_0x80
#define ENABLE_T0_Window_Spill_1_Normal_0x84
#define ENABLE_T0_Window_Spill_2_Normal_0x88
#define ENABLE_T0_Window_Spill_3_Normal_0x8c
#define ENABLE_T0_Window_Spill_4_Normal_0x90
#define ENABLE_T0_Window_Spill_5_Normal_0x94
#define ENABLE_T0_Window_Spill_6_Normal_0x98
#define ENABLE_T0_Window_Spill_7_Normal_0x9c
#define ENABLE_T0_Window_Spill_0_Other_0xa0
#define ENABLE_T0_Window_Spill_1_Other_0xa4
#define ENABLE_T0_Window_Spill_2_Other_0xa8
#define ENABLE_T0_Window_Spill_3_Other_0xac
#define ENABLE_T0_Window_Spill_4_Other_0xb0
#define ENABLE_T0_Window_Spill_5_Other_0xb4
#define ENABLE_T0_Window_Spill_6_Other_0xb8
#define ENABLE_T0_Window_Spill_7_Other_0xbc
#define ENABLE_HT0_Window_Spill_0_Normal_0x80
#define ENABLE_HT0_Window_Spill_1_Normal_0x84
#define ENABLE_HT0_Window_Spill_2_Normal_0x88
#define ENABLE_HT0_Window_Spill_3_Normal_0x8c
#define ENABLE_HT0_Window_Spill_4_Normal_0x90
#define ENABLE_HT0_Window_Spill_5_Normal_0x94
#define ENABLE_HT0_Window_Spill_6_Normal_0x98
#define ENABLE_HT0_Window_Spill_7_Normal_0x9c
#define ENABLE_HT0_Window_Spill_0_Other_0xa0
#define ENABLE_HT0_Window_Spill_1_Other_0xa4
#define ENABLE_HT0_Window_Spill_2_Other_0xa8
#define ENABLE_HT0_Window_Spill_3_Other_0xac
#define ENABLE_HT0_Window_Spill_4_Other_0xb0
#define ENABLE_HT0_Window_Spill_5_Other_0xb4
#define ENABLE_HT0_Window_Spill_6_Other_0xb8
#define ENABLE_HT0_Window_Spill_7_Other_0xbc
# 509 "diag.j"
! next is for fgu part ^^^^^^^^^^^^^^^^^^

#include "hboot.s"

#define MAX_TIMEOUT 0x002
#define WAIT_LOOP 0x100
# 520 "diag.j"
.text
.global main

main:       

	ta	%icc, T_RD_THID
! fork: source strm = 0xffffffff; target strm = 0x1
	cmp	%o1, 0
	setx	fork_lbl_0_1, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x2
	cmp	%o1, 1
	setx	fork_lbl_0_2, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x4
	cmp	%o1, 2
	setx	fork_lbl_0_3, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x8
	cmp	%o1, 3
	setx	fork_lbl_0_4, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x10
	cmp	%o1, 4
	setx	fork_lbl_0_5, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x20
	cmp	%o1, 5
	setx	fork_lbl_0_6, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x40
	cmp	%o1, 6
	setx	fork_lbl_0_7, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x80
	cmp	%o1, 7
	setx	fork_lbl_0_8, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 8, 16, 16)) -> intp(1, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 16, 16, 16)) -> intp(2, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 24, 16, 16)) -> intp(3, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 32, 16, 16)) -> intp(4, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 40, 16, 16)) -> intp(5, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 48, 16, 16)) -> intp(6, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 56, 16, 16)) -> intp(7, 1, 1)

fail:
    	EXIT_BAD

	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_8:
	.word 0x99b4cd15  ! 2: FANDNOT1	fnot1	%d50, %d52, %d12
	.word 0x01000000  ! 3: NOP	nop
	.word 0x93a0005c  ! 4: FMOVd	fmovd	%f28, %f40
	.word 0x99b6c6cb  ! 5: FMUL8SUx16	fmul8ulx16	%d58, %d42, %d12
	.word 0x95b00767  ! 6: FPACK16	fucmpeq8	%d0, %d38, %d10
	.word 0x93a44d38  ! 7: FsMULd	fsmuld	%f17, %f24, %f40
	.word 0x97a01a5c  ! 8: FdTOi	dis not found

	.word 0x98b64013  ! 9: ORNcc_R	orncc 	%r25, %r19, %r12
	.word 0x91b6041a  ! 10: FCMPLE16	fcmple16	%d24, %d26, %r8
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_7:
	.word 0x95b40d1c  ! 2: FANDNOT1	fnot1	%d16, %d28, %d10
	.word 0x01000000  ! 3: NOP	nop
	.word 0x93a0004c  ! 4: FMOVd	fmovd	%f12, %f40
	.word 0x91b646d3  ! 5: FMUL8SUx16	fmul8ulx16	%d56, %d50, %d8
	.word 0x95b00765  ! 6: FPACK16	fucmpeq8	%d0, %d36, %d10
	.word 0x95a3cd36  ! 7: FsMULd	fsmuld	%f15, %f22, %f10
	.word 0x97a01a54  ! 8: FdTOi	dis not found

	.word 0x92b2000c  ! 9: ORNcc_R	orncc 	%r8, %r12, %r9
	.word 0x97b58414  ! 10: FCMPLE16	fcmple16	%d22, %d20, %r11
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_6:
	.word 0x97b5cd07  ! 2: FANDNOT1	fnot1	%d54, %d38, %d42
	.word 0x01000000  ! 3: NOP	nop
	.word 0x91a00049  ! 4: FMOVd	fmovd	%f40, %f8
	.word 0x97b686d7  ! 5: FMUL8SUx16	fmul8ulx16	%d26, %d54, %d42
	.word 0x93b00767  ! 6: FPACK16	fucmpeq8	%d0, %d38, %d40
	.word 0x93a28d28  ! 7: FsMULd	fsmuld	%f10, %f8, %f40
	.word 0x99a01a59  ! 8: FdTOi	dis not found

	.word 0x92b1800e  ! 9: ORNcc_R	orncc 	%r6, %r14, %r9
	.word 0x91b24412  ! 10: FCMPLE16	fcmple16	%d40, %d18, %r8
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_5:
	.word 0x97b28d0f  ! 2: FANDNOT1	fnot1	%d10, %d46, %d42
	.word 0x01000000  ! 3: NOP	nop
	.word 0x99a0005d  ! 4: FMOVd	fmovd	%f60, %f12
	.word 0x93b686d3  ! 5: FMUL8SUx16	fmul8ulx16	%d26, %d50, %d40
	.word 0x95b0077c  ! 6: FPACK16	fucmpeq8	%d0, %d28, %d10
	.word 0x99a2cd3c  ! 7: FsMULd	fsmuld	%f11, %f28, %f12
	.word 0x97a01a4f  ! 8: FdTOi	dis not found

	.word 0x94b24012  ! 9: ORNcc_R	orncc 	%r9, %r18, %r10
	.word 0x95b74418  ! 10: FCMPLE16	fcmple16	%d60, %d24, %r10
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_4:
	.word 0x91b3cd19  ! 2: FANDNOT1	fnot1	%d46, %d56, %d8
	.word 0x01000000  ! 3: NOP	nop
	.word 0x97a00046  ! 4: FMOVd	fmovd	%f6, %f42
	.word 0x93b4c6dd  ! 5: FMUL8SUx16	fmul8ulx16	%d50, %d60, %d40
	.word 0x93b00778  ! 6: FPACK16	fucmpeq8	%d0, %d24, %d40
	.word 0x91a38d3c  ! 7: FsMULd	fsmuld	%f14, %f28, %f8
	.word 0x97a01a4e  ! 8: FdTOi	dis not found

	.word 0x90b38013  ! 9: ORNcc_R	orncc 	%r14, %r19, %r8
	.word 0x95b74408  ! 10: FCMPLE16	fcmple16	%d60, %d8, %r10
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	.word 0x91b54d0f  ! 2: FANDNOT1	fnot1	%d52, %d46, %d8
	.word 0x01000000  ! 3: NOP	nop
	.word 0x95a0005d  ! 4: FMOVd	fmovd	%f60, %f10
	.word 0x97b586dc  ! 5: FMUL8SUx16	fmul8ulx16	%d22, %d28, %d42
	.word 0x95b00765  ! 6: FPACK16	fucmpeq8	%d0, %d36, %d10
	.word 0x93a20d2d  ! 7: FsMULd	fsmuld	%f8, %f44, %f40
	.word 0x95a01a45  ! 8: FdTOi	dis not found

	.word 0x94b3c01c  ! 9: ORNcc_R	orncc 	%r15, %r28, %r10
	.word 0x93b6440a  ! 10: FCMPLE16	fcmple16	%d56, %d10, %r9
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	.word 0x99b48d08  ! 2: FANDNOT1	fnot1	%d18, %d8, %d12
	.word 0x01000000  ! 3: NOP	nop
	.word 0x91a0004f  ! 4: FMOVd	fmovd	%f46, %f8
	.word 0x97b6c6d6  ! 5: FMUL8SUx16	fmul8ulx16	%d58, %d22, %d42
	.word 0x95b0076c  ! 6: FPACK16	fucmpeq8	%d0, %d12, %d10
	.word 0x97a1cd3a  ! 7: FsMULd	fsmuld	%f7, %f26, %f42
	.word 0x99a01a4c  ! 8: FdTOi	dis not found

	.word 0x98b5801a  ! 9: ORNcc_R	orncc 	%r22, %r26, %r12
	.word 0x97b20416  ! 10: FCMPLE16	fcmple16	%d8, %d22, %r11
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
    	setx 0x0000deadbeefbad0, %l5, %l4

	!# Switch to hpriv mode
    	ta T_CHANGE_HPRIV

	or	%g0, 0x0, %g2		!# Operation Step
	or	%g0, 0x0, %g4		!# Operand   Step

	set	0x2d84, %g3
	stxa	%g3, [%g0] ASI_SPARC_PWR_MGMT
	wr	%g3, 0x4, %fprs

	mov 	%l7, 	%g1
	wrpr 	%g0, 	0x0, 	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x580, 	%hsys_tick_cmpr
	wr 	%l0, 	0x580, 	%sys_tick_cmpr
	wr 	%l0, 	0x580, 	%tick_cmpr
# 556 "diag.j"
	!# Execute Main Diag ..
        !# Write address of data region to load from in MA_PA reg, and check
	setx	MA_OPERANDS, %g6, %l7
          add	%l7, 12, %l7			!# WARNING : Misaligned address
          add	%l7, %g4, %l7
        wr %g0, 0x40, %asi
	stxa	%l7, [%g0 + 0x88] %asi 

ma_load:
	!# Write MAMEM address, start at 0
	or	%g0, 0x0, %l2
	stxa	%l2,	[%g0 + 0x90] %asi

	!# write MA_CTL
	setx    0x9f, %g7, %l1
	stxa	%l1,	[%g0 + 0x80] %asi		!# LOAD

	!# setup mask to check for INVOP
	or	%g0, 0x1, %l2
	sllx	%l2, 21, %l2

	#! Try MA_SYNC operation...
wait:
	ldxa	[%g0 + 0xA0] %asi, %l1
	ldxa	[%g0 + 0x80] %asi, %l1
	andcc	%l1, %l2, %l1
	bne,pn %xcc,	fail
	nop


loop_0:
	!# write NPRIME
	setx	 0x1aec2aaf44ca7551, %g7, %l2
	stxa	%l2,	[%g0 + 0x98] %asi

	setx	MA_OPERATIONS, %g6, %l7
	or	%g0, 8, %i0			!# OPSELECT
	umul	%i0, 16, %i0
	add	%i0, %g2, %i0

	!# write MA_ADDR
	ldx [%l7 + %i0], %l1
	stxa	%l1,	[%g0 + 0x90] %asi

	!# write MA_CTL
	add %i0, 8, %i0
	ldx [%l7 + %i0], %l1
	stxa	%l1,	[%g0 + 0x80] %asi		!# OPERATION

	!# setup mask to check for INVOP
	or	%g0, 0x1, %l2
	sllx	%l2, 21, %l2

	#! Try MA_SYNC operation...
wait2_0:	
	ldxa	[%g0 + 0xA0] %asi, %l1
	ldxa	[%g0 + 0x98] %asi, %l1		!# MA PA
	ldxa	[%g0 + 0x90] %asi, %l1		!# MA Addr
	ldxa	[%g0 + 0x88] %asi, %l1		!# MA PA
	ldxa	[%g0 + 0x80] %asi, %l1		!# MA CTL
	andcc	%l1, %l2, %l1
	bne,pn %xcc,	fail
	nop
# 626 "diag.j"
	add	%g2,  64, %g2			!# Operation Step  (16 * # of operations in queue)
	add	%g4, 164, %g4			!# Operand   Step  (always 164)
# 630 "diag.j"

loop_1:
	!# write NPRIME
	setx	 0x1b10ff007812ea4b, %g7, %l2
	stxa	%l2,	[%g0 + 0x98] %asi

	setx	MA_OPERATIONS, %g6, %l7
	or	%g0, 11, %i0			!# OPSELECT
	umul	%i0, 16, %i0
	add	%i0, %g2, %i0

	!# write MA_ADDR
	ldx [%l7 + %i0], %l1
	stxa	%l1,	[%g0 + 0x90] %asi

	!# write MA_CTL
	add %i0, 8, %i0
	ldx [%l7 + %i0], %l1
	stxa	%l1,	[%g0 + 0x80] %asi		!# OPERATION

	!# setup mask to check for INVOP
	or	%g0, 0x1, %l2
	sllx	%l2, 21, %l2

	#! Try MA_SYNC operation...
wait2_1:	
	ldxa	[%g0 + 0xA0] %asi, %l1
	ldxa	[%g0 + 0x98] %asi, %l1		!# MA PA
	ldxa	[%g0 + 0x90] %asi, %l1		!# MA Addr
	ldxa	[%g0 + 0x88] %asi, %l1		!# MA PA
	ldxa	[%g0 + 0x80] %asi, %l1		!# MA CTL
	andcc	%l1, %l2, %l1
	bne,pn %xcc,	fail
	nop
# 626 "diag.j"
	add	%g2,  64, %g2			!# Operation Step  (16 * # of operations in queue)
	add	%g4, 164, %g4			!# Operand   Step  (always 164)
# 630 "diag.j"

loop_2:
	!# write NPRIME
	setx	 0x94dc8547c4c7c603, %g7, %l2
	stxa	%l2,	[%g0 + 0x98] %asi

	setx	MA_OPERATIONS, %g6, %l7
	or	%g0, 2, %i0			!# OPSELECT
	umul	%i0, 16, %i0
	add	%i0, %g2, %i0

	!# write MA_ADDR
	ldx [%l7 + %i0], %l1
	stxa	%l1,	[%g0 + 0x90] %asi

	!# write MA_CTL
	add %i0, 8, %i0
	ldx [%l7 + %i0], %l1
	stxa	%l1,	[%g0 + 0x80] %asi		!# OPERATION

	!# setup mask to check for INVOP
	or	%g0, 0x1, %l2
	sllx	%l2, 21, %l2

	#! Try MA_SYNC operation...
wait2_2:	
	ldxa	[%g0 + 0xA0] %asi, %l1
	ldxa	[%g0 + 0x98] %asi, %l1		!# MA PA
	ldxa	[%g0 + 0x90] %asi, %l1		!# MA Addr
	ldxa	[%g0 + 0x88] %asi, %l1		!# MA PA
	ldxa	[%g0 + 0x80] %asi, %l1		!# MA CTL
	andcc	%l1, %l2, %l1
	bne,pn %xcc,	fail
	nop
# 626 "diag.j"
	add	%g2,  64, %g2			!# Operation Step  (16 * # of operations in queue)
	add	%g4, 164, %g4			!# Operand   Step  (always 164)
# 630 "diag.j"

loop_3:
	!# write NPRIME
	setx	 0xf54c251f1394aafe, %g7, %l2
	stxa	%l2,	[%g0 + 0x98] %asi

	setx	MA_OPERATIONS, %g6, %l7
	or	%g0, 0, %i0			!# OPSELECT
	umul	%i0, 16, %i0
	add	%i0, %g2, %i0

	!# write MA_ADDR
	ldx [%l7 + %i0], %l1
	stxa	%l1,	[%g0 + 0x90] %asi

	!# write MA_CTL
	add %i0, 8, %i0
	ldx [%l7 + %i0], %l1
	stxa	%l1,	[%g0 + 0x80] %asi		!# OPERATION

	!# setup mask to check for INVOP
	or	%g0, 0x1, %l2
	sllx	%l2, 21, %l2

	#! Try MA_SYNC operation...
wait2_3:	
	ldxa	[%g0 + 0xA0] %asi, %l1
	ldxa	[%g0 + 0x98] %asi, %l1		!# MA PA
	ldxa	[%g0 + 0x90] %asi, %l1		!# MA Addr
	ldxa	[%g0 + 0x88] %asi, %l1		!# MA PA
	ldxa	[%g0 + 0x80] %asi, %l1		!# MA CTL
	andcc	%l1, %l2, %l1
	bne,pn %xcc,	fail
	nop
# 626 "diag.j"
	add	%g2,  64, %g2			!# Operation Step  (16 * # of operations in queue)
	add	%g4, 164, %g4			!# Operand   Step  (always 164)
# 630 "diag.j"

ma_store:	

        !# write MA_ADDR
	or %g0, 0x00, %l2
	stxa	%l2,	[%g0 + 0x90] %asi
# 642 "diag.j"
        !# Write result address into MA_PA reg

        setx	MA_RESULTS, %g7, %l6
          add %l6, 12, %l6			!# WARNING : Misaligned address
	stxa	%l6, [%g0 + 0x88] %asi 

	!# write MA_CTL
	setx    0x19f, %g7, %l1
	stxa	%l1,	[%g0 + 0x80] %asi		!# STORE

	!# setup mask to check for INVOP
	or	%g0, 0x1, %l2
	sllx	%l2, 21, %l2

	#! Try MA_SYNC operation...
wait3:	
	ldxa	[%g0 + 0xA0] %asi, %l1
	ldxa	[%g0 + 0x80] %asi, %l1
	andcc	%l1, %l2, %l1
	bne,pn	%xcc,	fail
	nop

idle3:

	!# do dummy loads into %g1

	setx	MA_RESULTS, %g7, %l7
	or	%g0, %g0, %l3
	!# setup loop count
	or	%g0, 164, %i0
more:	
  	ldx	[%l7+%l3], %l0	!# a[i]
	addcc	%i0, -1, %i0
	bgt	more
	add	%l3, 0x8, %l3	!# i++


join_lbl_0_0:

.text
    nop
    nop
    nop 
    ta T_GOOD_TRAP
    nop 
    nop 
    nop 
# 707 "diag.j"
.data
user_data_start:
scratch_area:

.align 8
MA_OPERANDS:
.xword 0xad7ae25c366830e7
.xword 0xc11f3a42ad2a71c1
.xword 0xe06548e4aa84296b
.xword 0xfc4ab7981dc36dd3
.xword 0xbd9e5fb8da7140bb
.xword 0x384e9de4be53f74a
.xword 0xe10203b07aa0150d
.xword 0x5e607418bc6f8743
.xword 0x274dad7291a56380
.xword 0x0f41fdf827735f91
.xword 0x03a50b107fe01b7a
.xword 0x2491f5e1ee1ff9b7
.xword 0x7a7268a8a15ae10b
.xword 0x1d6bfd51b0eeb42b
.xword 0xf44a7e9541461a42
.xword 0x0ffd84082eeccb26
.xword 0xa53c8579631208fe
.xword 0x8282c45f8c3eb790
.xword 0xe6204581a9b0eb03
.xword 0xc0f65ed731f0f4fb
.xword 0x7ba8a3836a19a102
.xword 0x00b71303b34a2c91
.xword 0xd3ccdf440370ab66
.xword 0xec292cb5cabc0bab
.xword 0x1b785d531884817a
.xword 0x59eb2d3cab0ff053
.xword 0x3f5ab3d017a78771
.xword 0x31174e42691914ea
.xword 0x3c69fea103333748
.xword 0xa292da7cae0dd1d8
.xword 0xe1082ea131f0a516
.xword 0xa07eb4d1fc37b83d
.xword 0xd816b239c4b439e0
.xword 0x69de57cb86e69b35
.xword 0x1342db891699ebe2
.xword 0xba0efc175d0f334a
.xword 0x29e1642d3472955e
.xword 0x06d8391780560788
.xword 0x915784df632d10f6
.xword 0x1b437b4efee305ea
.xword 0x276379c82a7a6ed9
.xword 0x6fc0901e15964ad3
.xword 0xe289b72e3c0f727d
.xword 0x6d911ffd660056d1
.xword 0xc42866b59f2acb82
.xword 0xcc724f1946829c56
.xword 0x8347ef9064dcf0b8
.xword 0x8324064ea4b6ddf3
.xword 0x1ba8308dcb454212
.xword 0x793c437472342cb6
.xword 0x46c3036710fcb7d0
.xword 0xc332f1176a491886
.xword 0x1d679cf2f3e56d81
.xword 0x9cc52b4183311a35
.xword 0xd62e9e019062cc91
.xword 0xb508fc075afdf58a
.xword 0xf816134b9bb17a41
.xword 0x025e5ad63e3eec6d
.xword 0x7b6c6fdc9842cffb
.xword 0xbc8174cb1af5a8f7
.xword 0x0c52ff1635d7da8b
.xword 0xbae8266e3c97956a
.xword 0xe3adfa789e1ea0f1
.xword 0x22c9fc4263262316
.xword 0x60569bc41a6229b4
.xword 0x2951acb96627eee9
.xword 0x18bcf04c3b578990
.xword 0x04f2b6f3eaad06eb
.xword 0x292dc2d04b3bfee7
.xword 0xed64428c9eb3e29f
.xword 0x94ceb23c9b94f681
.xword 0x946a0f044dd54919
.xword 0x69919c176517b1d7
.xword 0xb4fc7d4d361a1819
.xword 0xacaeafea49c2f4ee
.xword 0x38f7120f62732227
.xword 0x53b94bfff26e0bee
.xword 0xe6193bccb1588c11
.xword 0x48140f72d0930103
.xword 0xe930d1ddff06c3af
.xword 0xd5121331e3348ed4
.xword 0xf3fbd3a4ad0e3944
.xword 0x59e0a67811d71c79
.xword 0xc5d4b9fc7eb36cd6
.xword 0x7eccbbea413d5a34
.xword 0x5db99f3cff23325f
.xword 0xdc9fe59aee88a2bb
.xword 0x96783ff2400bd902
.xword 0xeedc3d0dedf70a1d
.xword 0xa531ee841856819e
.xword 0xcae3a05af38d6553
.xword 0xed8b9167ba2d9f2e
.xword 0x5654b7f4113163da
.xword 0x394c9a3d9d78f9bf
.xword 0xf0221bbac78d5918
.xword 0x49a7ad810aa357aa
.xword 0xb36d17fbe9ce52c3
.xword 0xa2d83011f73c1ad8
.xword 0xd515c8037e018c34
.xword 0x3c9abe99fa4a92ba
.xword 0x4e266de59ecf8c1e
.xword 0xcda7b4308e8b86a7
.xword 0xc69ed5685eae03c1
.xword 0xe24d17a8d4c53749
.xword 0x4e7bcdc224037190
.xword 0x335e8ba404b48e94
.xword 0xd416ee81b34e0070
.xword 0x93adb6aa40cc56bb
.xword 0xba9f5ab286ce4693
.xword 0x22e4de635806333d
.xword 0xbacadd4484ca0d99
.xword 0xea581a65f7b6f258
.xword 0xd25928622dff8d59
.xword 0x84571c6492ec4f6b
.xword 0x5f5c8a8b854d7570
.xword 0xa26524004c8581b4
.xword 0x30ed16f24c8a91b2
.xword 0x5467d2571bc3878e
.xword 0x54868c166f6c90ad
.xword 0xe66be0cdd56c8648
.xword 0x4c3dd40d1253bcb0
.xword 0xa261e63ceae27e75
.xword 0x03a0b2f1c0a2b51c
.xword 0x93c056a40b284f46
.xword 0x6abe74321a5eb42e
.xword 0x45cd630ce59bfcc2
.xword 0xb040b49483c28ceb
.xword 0x2d6a7fd15709d482
.xword 0x0a4af9ddd488cb46
.xword 0x86b86318fce9afff
.xword 0xc5c746970f009e4f
.xword 0x54d4f3c6f013c63b
.xword 0x5187643421cc9c41
.xword 0xcae8c8a703ff800c
.xword 0xa28d66d9450ab34f
.xword 0xa74d7d69dfe5c254
.xword 0x9be454479a64a7c3
.xword 0x1ea5b0f835765b4a
.xword 0x18130756bd35e69a
.xword 0xa26afa50af9f9446
.xword 0x3f4b875b849174a0
.xword 0xd5c7dbb9c377e9fa
.xword 0x19a97d5244ac57c1
.xword 0x343343c8a8526102
.xword 0x7bdc754e612f2e2e
.xword 0x6b6631fcada95720
.xword 0x835d031ff6bdb7a3
.xword 0xa9d3051c67c3f73b
.xword 0xd1b1a9c4d9d03225
.xword 0xd72cb021ef399c5b
.xword 0x2fc00b0a4d58566b
.xword 0xbc1d74e8abeb3cc1
.xword 0xb4bb06c7ee3dd75b
.xword 0x7f4704189e951a09
.xword 0x58c41ae5c5193661
.xword 0x3cf007dd2a154c7d
.xword 0x3918de425998f5fe
.xword 0xe96856e88c91ee8c
.xword 0x61fd6a92c544df47
.xword 0x99078d42fe5d1f14
.xword 0x35016e05fa0be22c
.xword 0x1d1f41b8373fbabd
.xword 0x9267a0d51b3bdaf5
.xword 0xa22aa189a0791ec3

.align 8
MA_OPERATIONS:
.xword 0x80604020
.xword 0x212

.xword 0x356a
.xword 0x308

.xword 0x0000096000408020
.xword 0x402

.xword 0x6a35
.xword 0x50f

.xword 0x78285050
.xword 0x615

.xword 0x80604020
.xword 0x714

.xword 0x00287850
.xword 0x81f

.xword 0x00287850
.xword 0x927

.xword 0x78285050
.xword 0xa04

.xword 0x64500000003c0000
.xword 0xb02

.xword 0x7766000000554422
.xword 0xc05

.xword 0x706200000054462a
.xword 0xd02

.xword 0x784d0d5800423721
.xword 0xe02

.xword 0x804d056000504020
.xword 0xf01

.xword 0x0000066000408020
.xword 0x1004

.xword 0x80604020
.xword 0x21a

.xword 0x356a
.xword 0x307

.xword 0x0000016000408020
.xword 0x403

.xword 0x6a35
.xword 0x509

.xword 0x78285050
.xword 0x606

.xword 0x80604020
.xword 0x707

.xword 0x00287850
.xword 0x815

.xword 0x00287850
.xword 0x927

.xword 0x78285050
.xword 0xa27

.xword 0x64500000003c0000
.xword 0xb03

.xword 0x7766000000554422
.xword 0xc05

.xword 0x706200000054462a
.xword 0xd0d

.xword 0x784d0d5800423721
.xword 0xe02

.xword 0x804d0a6000504020
.xword 0xf01

.xword 0x0000066000408020
.xword 0x1002

.xword 0x80604020
.xword 0x218

.xword 0x356a
.xword 0x314

.xword 0x00000f6000408020
.xword 0x400

.xword 0x6a35
.xword 0x523

.xword 0x78285050
.xword 0x616

.xword 0x80604020
.xword 0x71f

.xword 0x00287850
.xword 0x80f

.xword 0x00287850
.xword 0x927

.xword 0x78285050
.xword 0xa14

.xword 0x64500000003c0000
.xword 0xb0c

.xword 0x7766000000554422
.xword 0xc09

.xword 0x706200000054462a
.xword 0xd06

.xword 0x784d0e5800423721
.xword 0xe01

.xword 0x804d026000504020
.xword 0xf01

.xword 0x0000036000408020
.xword 0x1000

.xword 0x80604020
.xword 0x20d

.xword 0x356a
.xword 0x318

.xword 0x0000046000408020
.xword 0x403

.xword 0x6a35
.xword 0x518

.xword 0x78285050
.xword 0x617

.xword 0x80604020
.xword 0x707

.xword 0x00287850
.xword 0x808

.xword 0x00287850
.xword 0x927

.xword 0x78285050
.xword 0xa13

.xword 0x64500000003c0000
.xword 0xb02

.xword 0x7766000000554422
.xword 0xc0a

.xword 0x706200000054462a
.xword 0xd08

.xword 0x784d005800423721
.xword 0xe03

.xword 0x804d0e6000504020
.xword 0xf00

.xword 0x0000066000408020
.xword 0x1001


.align 8
MA_RESULTS:
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF

#if 0
#endif
