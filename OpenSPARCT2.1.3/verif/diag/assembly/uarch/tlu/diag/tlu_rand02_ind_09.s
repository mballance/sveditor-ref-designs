/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand02_ind_09.s
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
#define TRAP_SECT_HV_ALSO
#define DMMU_SKIP_IF_NO_TTE
#define IMMU_SKIP_IF_NO_TTE

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#define H_T0_Trap_Instruction_0
#define My_T0_Trap_Instruction_0 \
    rdpr %tnpc, %g2; \
    save;  \
    wrpr %g2, %tpc; \
    add %g2, 4, %g2;\
    wrpr %g2, %tnpc; \
    restore; \
    illtrap;\
    retry
#define H_T0_Trap_Instruction_1
#define My_T0_Trap_Instruction_1 \
    umul %o4, 2, %o5;\
    inc %o1;\
    rdpr %tnpc, %g2; \
    wrpr %g2, %tpc; \
    add %g2, 4, %g2;\
    wrpr %g2, %tnpc; \
    illtrap;\
    retry
#define H_T0_Trap_Instruction_2
#define My_T0_Trap_Instruction_2 \
    inc %o3;\
    umul %o3, 2, %o4;\
    ba 1f; \
    save; \
    2: done; \
    nop; \
    1: ba 2b; \
    restore
#define H_T0_Trap_Instruction_3
#define My_T0_Trap_Instruction_3 \
    inc %l3;\
    inc %o3;\
    umul %o3, 2, %o4;\
    inc %i3;\
    save ;\
    restore ;\
    done ;\
    nop; 
#define H_T0_Trap_Instruction_4
#define My_T0_Trap_Instruction_4 \
    umul %i4, 2, %l5;\
    inc %o1;\
    rdpr %tnpc, %g2; \
    wrpr %g2, %tpc; \
    add %g2, 4, %g2;\
    wrpr %g2, %tnpc; \
    retry ;\
    illtrap
#define H_T0_Trap_Instruction_5
#define My_T0_Trap_Instruction_5 \
    umul %i7, 2, %l1;\
    inc %o5;\
    rdpr %tnpc, %g2; \
    wrpr %g2, %tpc; \
    add %g2, 4, %g2;\
    wrpr %g2, %tnpc; \
    sdiv    %r2, %r10, %r0; \
    retry

#define H_T1_Trap_Instruction_0
#define My_T1_Trap_Instruction_0 \
    inc %o4;\
    umul %o4, 2, %o5;\
    ba 1f; \
    save; \
    2: done; \
    nop; \
    1: ba 2b; \
    restore
#define H_T1_Trap_Instruction_1
#define My_T1_Trap_Instruction_1 \
    umul %o4, 2, %o5;\
    inc %o1;\
    rdpr %tnpc, %g2; \
    wrpr %g2, %tpc; \
    add %g2, 4, %g2;\
    wrpr %g2, %tnpc; \
    illtrap;\
    retry
#define H_T1_Trap_Instruction_2
#define My_T1_Trap_Instruction_2 \
    inc %o3;\
    umul %o3, 2, %o4;\
    ba 1f; \
    save; \
    2: done; \
    nop; \
    1: ba 2b; \
    restore
#define H_T1_Trap_Instruction_3
#define My_T1_Trap_Instruction_3 \
    inc %l3;\
    inc %o3;\
    umul %o3, 2, %o4;\
    inc %i3;\
    save ;\
    restore ;\
    done ;\
    nop; 
#define H_T1_Trap_Instruction_4
#define My_T1_Trap_Instruction_4 \
    umul %i4, 2, %l5;\
    inc %o1;\
    rdpr %tnpc, %g2; \
    wrpr %g2, %tpc; \
    add %g2, 4, %g2;\
    wrpr %g2, %tnpc; \
    retry ;\
    illtrap
#define H_T1_Trap_Instruction_5
#define My_T1_Trap_Instruction_5 \
    umul %i7, 2, %l1;\
    inc %o5;\
    rdpr %tnpc, %g2; \
    wrpr %g2, %tpc; \
    add %g2, 4, %g2;\
    wrpr %g2, %tnpc; \
    sdiv    %r2, %r10, %r0; \
    retry

#define H_HT0_Trap_Instruction_0 
#define My_HT0_Trap_Instruction_0 \
    rd %asi, %g2;\
    mov 8, %g3;\
    stxa %g3, [%g0] 0x57;\
    done;\
    nop;nop;nop;nop

#define H_HT0_Trap_Instruction_1
#define My_HT0_Trap_Instruction_1 \
    rd %asi, %g2;\
    mov 8, %g3;\
    stxa %g3, [%g0] 0x5f;\
    done;\
    nop;nop;nop;nop
#define H_HT0_Trap_Instruction_2
#define My_HT0_Trap_Instruction_2 \
    umul %i6, 2, %l4;\
    inc %o4;\
    rdpr %tnpc, %g2; \
    wrpr %g2, %tpc; \
    add %g2, 4, %g2;\
    wrpr %g2, %tnpc; \
    sdiv    %r2, %r0, %r0; \
    retry
#define H_HT0_Trap_Instruction_3
#define My_HT0_Trap_Instruction_3 \
    umul %i5, 3, %l3;\
    inc %o6;\
    rdpr %tnpc, %g2; \
    illtrap ;\
    wrpr %g2, %tpc; \
    add %g2, 4, %g2;\
    wrpr %g2, %tnpc; \
    retry
#define H_HT0_Trap_Instruction_4
#define My_HT0_Trap_Instruction_4 \
    rdpr %tnpc, %g2; \
    save;  \
    wrpr %g2, %tpc; \
    add %g2, 4, %g2;\
    wrpr %g2, %tnpc; \
    restore; \
    illtrap;\
    retry
#define H_HT0_Trap_Instruction_5
#define My_HT0_Trap_Instruction_5 \
    call htrap_5_ext;\
    nop; retry;\
    nop; nop; nop; nop; nop

#define H_HT0_Mem_Address_Not_Aligned_0x34
#define My_HT0_Mem_Address_Not_Aligned_0x34 \
    umul %i7, 4, %g1;\
    inc %o6;\
    umul %i4, 3, %l3;\
    inc %g6;\
    save ;\
    restore ;\
    done ;\
    nop; 
#define H_HT0_Illegal_instruction_0x10
#define My_HT0_Illegal_instruction_0x10 \
    umul %i0, 4, %g1;\
    inc %o6;\
    ba 1f; \
    rdhpr %htstate, %g3;\
    2: done; \
    1: ba 2b;\
    wrhpr %g3, 1, %htstate;nop

#define H_HT0_DAE_so_page_0x30
#define My_HT0_DAE_so_page_0x30 \
    umul %i5, 4, %g5;\
    inc %g6;\
    save; \
    restore;\
    rd %fprs, %g2; \
    wr %g2, 0x4, %fprs ;\
    done; \
    nop;
#define H_HT0_DAE_invalid_asi_0x14
#define SUN_H_HT0_DAE_invalid_asi_0x14 \
    umul %i5, 4, %g5;\
    inc %g6;\
    save; \
    restore;\
    rd %fprs, %g2; \
    wr %g2, 0x4, %fprs ;\
    done; \
    nop;
#define H_HT0_DAE_privilege_violation_0x15
#define SUN_H_HT0_DAE_privilege_violation_0x15 \
    umul %i5, 4, %g5;\
    inc %g6;\
    save; \
    restore;\
    rd %fprs, %g2; \
    wr %g2, 0x4, %fprs ;\
    done; \
    nop;
#define H_HT0_Privileged_Action_0x37
#define My_HT0_Privileged_Action_0x37 \
    inc %l5;\
    dec %g3;\
    umul %i5, 4, %g5;\
    save; \
    restore;\
    done; \
    nop; nop
#define H_HT0_Lddf_Mem_Address_Not_Aligned_0x35
#define My_HT0_Lddf_Mem_Address_Not_Aligned_0x35 \
    inc %l5;\
    dec %g3;\
    rdpr %tpc, %g2; \
    add %g2, 0x4, %g2; \
    wrpr %g2, %tpc; \
    add %g2, 0x4, %g2; \
    wrpr %g2, %tnpc; \
    retry
#define H_HT0_Stdf_Mem_Address_Not_Aligned_0x36
#define My_HT0_Stdf_Mem_Address_Not_Aligned_0x36 \
    inc %l5;\
    dec %g3;\
    rdpr %tpc, %g2; \
    add %g2, 0x4, %g2; \
    wrpr %g2, %tpc; \
    add %g2, 0x4, %g2; \
    wrpr %g2, %tnpc; \
    retry
#define H_HT0_Fp_exception_other_0x22
#define My_HT0_Fp_exception_other_0x22 \
    inc %l6;\
    dec %g5;\
    umul %i5, 4, %g2;\
    save; \
    restore;\
    done; \
    nop; nop
#define H_HT0_Division_By_Zero
#define My_HT0_Division_By_Zero \
    inc %l6;\
    dec %g5;\
    umul %i5, 4, %g2;\
    save; \
    restore;\
    done; \
    nop; nop
#define H_T0_Division_By_Zero
#define My_T0_Division_By_Zero \
    inc %l6;\
    dec %g5;\
    umul %i5, 4, %g2;\
    save; \
    restore;\
    done; \
    nop; nop
#define H_T1_Division_By_Zero_0x28
#define My_H_T1_Division_By_Zero_0x28 \
    inc %l6;\
    dec %g5;\
    umul %i5, 4, %g2;\
    save; \
    restore;\
    done; \
    nop; nop

#define H_T0_Division_By_Zero
#define My_T0_Division_By_Zero\
    inc %l6;\
    dec %g5;\
    umul %i5, 4, %g2;\
    save; \
    restore;\
    done; \
    nop; nop

#define H_T1_Fp_Exception_Other_0x22
#define My_H_T1_Fp_Exception_Other_0x22 \
    inc %l6;\
    dec %g5;\
    umul %i5, 4, %g2;\
    save; \
    restore;\
    done; \
    nop; nop
#define H_T1_Privileged_Opcode_0x11
#define SUN_H_T1_Privileged_Opcode_0x11 \
    inc %l6;\
    dec %g5;\
    umul %i5, 4, %g2;\
    save; \
    restore;\
    done; \
    nop; nop

#define H_HT0_Fp_disabled_0x20
#define My_HT0_Fp_disabled_0x20 \
    mov  0x4, %g2 ;\
    wr %g2, 0x0, %fprs ;\
    sllx %g2, 10, %g3; \
    rdpr %tstate, %g2;\
    or %g2, %g3, %g2 ;\
    wrpr %g2, 0x0, %tstate;\
    retry; nop

#define H_T0_Fp_disabled_0x20
#define My_T0_Fp_disabled_0x20 \
    mov  0x4, %g2 ;\
    wr %g2, 0x0, %fprs ;\
    sllx %g2, 10, %g3; \
    rdpr %tstate, %g2;\
    or %g2, %g3, %g2 ;\
    wrpr %g2, 0x0, %tstate;\
    retry; nop

#define H_T1_Fp_Disabled_0x20
#define My_H_T1_Fp_Disabled_0x20 \
    mov  0x4, %g2 ;\
    wr %g2, 0x0, %fprs ;\
    sllx %g2, 10, %g3; \
    rdpr %tstate, %g2;\
    or %g2, %g3, %g2 ;\
    wrpr %g2, 0x0, %tstate;\
    retry; nop

#define H_HT0_Watchdog_Reset_0x02
#define My_HT0_Watchdog_Reset_0x02 \
    call wdog_2_ext;\
    nop;retry;nop;nop;nop;nop;nop

#define H_T0_Privileged_opcode_0x11
#define My_T0_Privileged_opcode_0x11 \
    umul %i0, 4, %g1;\
    not %g0, %g2; \
    ba 1f; \
    illtrap; \
    2: done; \
    nop; \
    1: ba 2b; \
    ldx [%g2], %g3

#define H_T0_Fp_exception_other_0x22
#define My_T0_Fp_exception_other_0x22 \
    inc %l6;\
    dec %g5;\
    umul %i5, 4, %g2;\
    save; \
    restore;\
    done; \
    nop; nop

#define H_HT0_Trap_Level_Zero_0x5f
#define My_HT0_Trap_Level_Zero_0x5f \
    not %g0, %g2; \
    rdhpr %hpstate, %g3;\
    jmp %g2;\
    rdhpr %htstate, %g3;\
    and %g3, 0xfe, %g3;\
    wrhpr %g3, 0, %htstate;\
    retry;nop


#define H_HT0_Instruction_address_range_0x0d
#define SUN_H_HT0_Instruction_address_range_0x0d \
    done;nop

#define H_HT0_mem_address_range_0x2e
#define SUN_H_HT0_mem_address_range_0x2e \
    done;nop


#include "hboot.s"
.text
.global main
main:

    ! Set up ld/st area per thread
	ta	T_RD_THID   ! Result in %o1 = r9
	umul	%r9, 256, %r31
	setx	user_data_start, %r1, %r3
	add	%r31, %r3, %r31
    wr  %r0, 0x4, %asi

!Initializing integer registers
	ldx [%r31+0], %r0
	ldx [%r31+8], %r1
	ldx [%r31+16], %r2
	ldx [%r31+24], %r3
	ldx [%r31+32], %r4
	ldx [%r31+40], %r5
	ldx [%r31+48], %r6
	ldx [%r31+56], %r7
	ldx [%r31+64], %r8
	ldx [%r31+72], %r9
	ldx [%r31+80], %r10
	ldx [%r31+88], %r11
	ldx [%r31+96], %r12
	ldx [%r31+104], %r13
	ldx [%r31+112], %r14
	ldx [%r31+120], %r15
	ldx [%r31+128], %r16
	ldx [%r31+136], %r17
	ldx [%r31+144], %r18
	ldx [%r31+152], %r19
	ldx [%r31+160], %r20
	ldx [%r31+168], %r21
	ldx [%r31+176], %r22
	ldx [%r31+184], %r23
	ldx [%r31+192], %r24
	ldx [%r31+200], %r25
	ldx [%r31+208], %r26
	ldx [%r31+216], %r27
	ldx [%r31+224], %r28
	ldx [%r31+232], %r29
	ldx [%r31+240], %r30
	save %r31, %r0, %r31
	ldx [%r31+0], %r0
	ldx [%r31+8], %r1
	ldx [%r31+16], %r2
	ldx [%r31+24], %r3
	ldx [%r31+32], %r4
	ldx [%r31+40], %r5
	ldx [%r31+48], %r6
	ldx [%r31+56], %r7
	ldx [%r31+64], %r8
	ldx [%r31+72], %r9
	ldx [%r31+80], %r10
	ldx [%r31+88], %r11
	ldx [%r31+96], %r12
	ldx [%r31+104], %r13
	ldx [%r31+112], %r14
	ldx [%r31+120], %r15
	ldx [%r31+128], %r16
	ldx [%r31+136], %r17
	ldx [%r31+144], %r18
	ldx [%r31+152], %r19
	ldx [%r31+160], %r20
	ldx [%r31+168], %r21
	ldx [%r31+176], %r22
	ldx [%r31+184], %r23
	ldx [%r31+192], %r24
	ldx [%r31+200], %r25
	ldx [%r31+208], %r26
	ldx [%r31+216], %r27
	ldx [%r31+224], %r28
	ldx [%r31+232], %r29
	ldx [%r31+240], %r30
	save %r31, %r0, %r31
	ldx [%r31+0], %r0
	ldx [%r31+8], %r1
	ldx [%r31+16], %r2
	ldx [%r31+24], %r3
	ldx [%r31+32], %r4
	ldx [%r31+40], %r5
	ldx [%r31+48], %r6
	ldx [%r31+56], %r7
	ldx [%r31+64], %r8
	ldx [%r31+72], %r9
	ldx [%r31+80], %r10
	ldx [%r31+88], %r11
	ldx [%r31+96], %r12
	ldx [%r31+104], %r13
	ldx [%r31+112], %r14
	ldx [%r31+120], %r15
	ldx [%r31+128], %r16
	ldx [%r31+136], %r17
	ldx [%r31+144], %r18
	ldx [%r31+152], %r19
	ldx [%r31+160], %r20
	ldx [%r31+168], %r21
	ldx [%r31+176], %r22
	ldx [%r31+184], %r23
	ldx [%r31+192], %r24
	ldx [%r31+200], %r25
	ldx [%r31+208], %r26
	ldx [%r31+216], %r27
	ldx [%r31+224], %r28
	ldx [%r31+232], %r29
	ldx [%r31+240], %r30
	save %r31, %r0, %r31
	restore
	restore
	restore
!Initializing float registers
	ldd [%r31+0], %f0
	ldd [%r31+16], %f2
	ldd [%r31+32], %f4
	ldd [%r31+48], %f6
	ldd [%r31+64], %f8
	ldd [%r31+80], %f10
	ldd [%r31+96], %f12
	ldd [%r31+112], %f14
	ldd [%r31+128], %f16
	ldd [%r31+144], %f18
	ldd [%r31+160], %f20
	ldd [%r31+176], %f22
	ldd [%r31+192], %f24
	ldd [%r31+208], %f26
	ldd [%r31+224], %f28
	ldd [%r31+240], %f30
	.word 0x8d902e51  ! 1: WRPR_PSTATE_I	wrpr	%r0, 0x0e51, %pstate
	.word 0x8868e001  ! 2: UDIVX_I	udivx 	%r3, 0x0001, %r4
	ta	T_CHANGE_PRIV	! macro
	.word 0xc93fc001  ! 4: STDF_R	std	%f4, [%r1, %r31]
	.word 0xc847e001  ! 5: LDSW_I	ldsw	[%r31 + 0x0001], %r4
	.word 0x87a00560  ! 6: FSQRTq	fsqrt	
	.word 0x8d802004  ! 7: WRFPRS_I	wr	%r0, 0x0004, %fprs
	mov 0x32, %r30
	.word 0x81d0001e  ! 8: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x83514000  ! 9: RDPR_TBA	rdpr	%tba, %r1
	.word 0x819823d2  ! 10: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03d2, %hpstate
	.word 0x8d802000  ! 11: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91d02031  ! 12: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x80690004  ! 13: UDIVX_R	udivx 	%r4, %r4, %r0
	.word 0x9da149ac  ! 14: FDIVs	fdivs	%f5, %f12, %f14
	.word 0xdc800ba0  ! 15: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r14
	.word 0x20700001  ! 16: BPN	<illegal instruction>
	.word 0x2c800001  ! 17: BNEG	bneg,a	<label_0x1>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8ba0054d  ! 19: FSQRTd	fsqrt	
	.word 0xcad00e60  ! 20: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r5
	ta	T_CHANGE_NONPRIV	! macro
DS_0:
	.word 0x22800001  ! 23: BE	be,a	<label_0x1>
	.word 0xcb33c007  ! 23: STQF_R	-	%f5, [%r7, %r15]
	.word 0x9f458000  ! 22: RD_SOFTINT_REG	rd	%softint, %r15
	.word 0x8d902e1b  ! 23: WRPR_PSTATE_I	wrpr	%r0, 0x0e1b, %pstate
	.word 0x83d02031  ! 24: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0x81982002  ! 25: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0002, %hpstate
	.word 0x86490005  ! 26: MULX_R	mulx 	%r4, %r5, %r3
	ta	T_CHANGE_PRIV	! macro
	.word 0x9fd02030  ! 28: Tcc_I	tvc	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81982ed4  ! 30: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed4, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc6d7e020  ! 32: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r3
	ta	T_CHANGE_HPRIV	! macro
DS_1:
	.word 0x20800001  ! 35: BN	bn,a	<label_0x1>
	.word 0xc1322001  ! 35: STQF_I	-	%f0, [0x0001, %r8]
	.word 0x9f458000  ! 34: RD_SOFTINT_REG	rd	%softint, %r15
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x85d02031  ! 36: Tcc_I	tle	icc_or_xcc, %r0 + 49
	.word 0x85a0056c  ! 37: FSQRTq	fsqrt	
	.word 0x87802010  ! 38: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xc527e001  ! 39: STF_I	st	%f2, [0x0001, %r31]
	.word 0x8d902806  ! 40: WRPR_PSTATE_I	wrpr	%r0, 0x0806, %pstate
	.word 0x8d90269b  ! 41: WRPR_PSTATE_I	wrpr	%r0, 0x069b, %pstate
	.word 0x9f494000  ! 42: RDHPR_HTBA	rdhpr	%htba, %r15
	.word 0xded7e020  ! 43: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r15
	.word 0x8d902251  ! 44: WRPR_PSTATE_I	wrpr	%r0, 0x0251, %pstate
	.word 0xde8fe020  ! 45: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r15
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d90288e  ! 47: WRPR_PSTATE_I	wrpr	%r0, 0x088e, %pstate
	.word 0x87d02034  ! 48: Tcc_I	tl	icc_or_xcc, %r0 + 52
	.word 0x8198288d  ! 49: WRHPR_HPSTATE_I	wrhpr	%r0, 0x088d, %hpstate
	.word 0x884a6001  ! 50: MULX_I	mulx 	%r9, 0x0001, %r4
	.word 0xc88008a0  ! 51: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
	.word 0x3a800001  ! 52: BCC	bcc,a	<label_0x1>
	.word 0xc89fe001  ! 53: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r4
	.word 0x83d02033  ! 54: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x83a3c9aa  ! 55: FDIVs	fdivs	%f15, %f10, %f1
	.word 0xc2800bc0  ! 56: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r1
	.word 0x97a30d20  ! 57: FsMULd	fsmuld	%f12, %f0, %f42
	.word 0x9d50c000  ! 58: RDPR_TT	rdpr	%tt, %r14
	.word 0x8d802000  ! 59: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x3e800001  ! 60: BVC	bvc,a	<label_0x1>
	.word 0x97d02030  ! 61: Tcc_I	tge	icc_or_xcc, %r0 + 48
	.word 0x8198209a  ! 62: WRHPR_HPSTATE_I	wrhpr	%r0, 0x009a, %hpstate
	.word 0xdcc004a0  ! 63: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r14
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d9028c9  ! 65: WRPR_PSTATE_I	wrpr	%r0, 0x08c9, %pstate
	.word 0x8fd02031  ! 66: Tcc_I	tvs	icc_or_xcc, %r0 + 49
	.word 0xdc8fe020  ! 67: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r14
	.word 0xdcc7e000  ! 68: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r14
	.word 0x32700001  ! 69: BPNE	<illegal instruction>
	.word 0xdcdfe000  ! 70: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r14
	.word 0x95d02033  ! 71: Tcc_I	tg	icc_or_xcc, %r0 + 51
	.word 0x97494000  ! 72: RDHPR_HTBA	rdhpr	%htba, %r11
	.word 0xd62fe001  ! 73: STB_I	stb	%r11, [%r31 + 0x0001]
	.word 0xd727e001  ! 74: STF_I	st	%f11, [0x0001, %r31]
	.word 0x9e4aa001  ! 75: MULX_I	mulx 	%r10, 0x0001, %r15
	.word 0x91d02031  ! 76: Tcc_I	ta	icc_or_xcc, %r0 + 49
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x84012001  ! 78: ADD_I	add 	%r4, 0x0001, %r2
	ta	T_CHANGE_PRIV	! macro
	.word 0xc48008a0  ! 80: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x81982dcd  ! 81: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dcd, %hpstate
	.word 0x8d802000  ! 82: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d902253  ! 83: WRPR_PSTATE_I	wrpr	%r0, 0x0253, %pstate
	.word 0x8d9024d3  ! 84: WRPR_PSTATE_I	wrpr	%r0, 0x04d3, %pstate
	.word 0x20800001  ! 85: BN	bn,a	<label_0x1>
	.word 0x93a10d21  ! 86: FsMULd	fsmuld	%f4, %f32, %f40
	.word 0x807be001  ! 87: SDIV_I	sdiv 	%r15, 0x0001, %r0
	.word 0x90c3e001  ! 88: ADDCcc_I	addccc 	%r15, 0x0001, %r8
	.word 0xd0c004a0  ! 89: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r8
	.word 0x3e800001  ! 90: BVC	bvc,a	<label_0x1>
	.word 0x91a309c7  ! 91: FDIVd	fdivd	%f12, %f38, %f8
	.word 0x91a000c7  ! 92: FNEGd	fnegd	%f38, %f8
	.word 0xd0d7e010  ! 93: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r8
DS_2:
	.word 0x32800001  ! 95: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x93b1430a  ! 94: ALLIGNADDRESS	alignaddr	%r5, %r10, %r9
	.word 0x8d902000  ! 95: WRPR_PSTATE_I	wrpr	%r0, 0x0000, %pstate
	mov 0x31, %r30
	.word 0x8dd0001e  ! 96: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x8d902ccf  ! 97: WRPR_PSTATE_I	wrpr	%r0, 0x0ccf, %pstate
	.word 0x87802016  ! 98: WRASI_I	wr	%r0, 0x0016, %asi
DS_3:
	.word 0x22800001  ! 100: BE	be,a	<label_0x1>
	illtrap
	.word 0x87b1030a  ! 99: ALLIGNADDRESS	alignaddr	%r4, %r10, %r3
	.word 0xc68008a0  ! 100: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x9b690004  ! 101: SDIVX_R	sdivx	%r4, %r4, %r13
	.word 0xda7fe001  ! 102: SWAP_I	swap	%r13, [%r31 + 0x0001]
	.word 0x8001e001  ! 103: ADD_I	add 	%r7, 0x0001, %r0
	.word 0xc0d804a0  ! 104: LDXA_R	ldxa	[%r0, %r0] 0x25, %r0
	.word 0xc02fc004  ! 105: STB_R	stb	%r0, [%r31 + %r4]
	.word 0x8d902444  ! 106: WRPR_PSTATE_I	wrpr	%r0, 0x0444, %pstate
	.word 0xc0d80e80  ! 107: LDXA_R	ldxa	[%r0, %r0] 0x74, %r0
	mov 0x32, %r30
	.word 0x9dd0001e  ! 108: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x81982885  ! 109: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0885, %hpstate
	.word 0x8e7a4008  ! 110: SDIV_R	sdiv 	%r9, %r8, %r7
	.word 0x89d02035  ! 111: Tcc_I	tleu	icc_or_xcc, %r0 + 53
	.word 0x8d902803  ! 112: WRPR_PSTATE_I	wrpr	%r0, 0x0803, %pstate
	.word 0xce47e001  ! 113: LDSW_I	ldsw	[%r31 + 0x0001], %r7
	.word 0x8d902407  ! 114: WRPR_PSTATE_I	wrpr	%r0, 0x0407, %pstate
	.word 0xcec7e010  ! 115: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r7
	.word 0x8d902c5e  ! 116: WRPR_PSTATE_I	wrpr	%r0, 0x0c5e, %pstate
	.word 0x8dd02031  ! 117: Tcc_I	tneg	icc_or_xcc, %r0 + 49
	.word 0xce2fc008  ! 118: STB_R	stb	%r7, [%r31 + %r8]
	.word 0x9c492001  ! 119: MULX_I	mulx 	%r4, 0x0001, %r14
	.word 0x8d902c51  ! 120: WRPR_PSTATE_I	wrpr	%r0, 0x0c51, %pstate
	.word 0xdc800c40  ! 121: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r14
	.word 0x8d902a5d  ! 122: WRPR_PSTATE_I	wrpr	%r0, 0x0a5d, %pstate
	.word 0xdcdfe010  ! 123: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r14
	.word 0x8d902402  ! 124: WRPR_PSTATE_I	wrpr	%r0, 0x0402, %pstate
	.word 0x91a000ce  ! 125: FNEGd	fnegd	%f14, %f8
	.word 0x81982810  ! 126: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0810, %hpstate
	.word 0x83a109aa  ! 127: FDIVs	fdivs	%f4, %f10, %f1
	.word 0xc28008a0  ! 128: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0xc2c7e030  ! 129: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r1
	.word 0xc28008a0  ! 130: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0x30800001  ! 131: BA	ba,a	<label_0x1>
	.word 0x81514000  ! 132: RDPR_TBA	rdpr	%tba, %r0
	.word 0xc0bfe001  ! 133: STDA_I	stda	%r0, [%r31 + 0x0001] %asi
	.word 0x9d51c000  ! 134: RDPR_TL	rdpr	%tl, %r14
	.word 0x85508000  ! 135: RDPR_TSTATE	rdpr	%tstate, %r2
	.word 0x8d90225d  ! 136: WRPR_PSTATE_I	wrpr	%r0, 0x025d, %pstate
	.word 0x8fd02034  ! 137: Tcc_I	tvs	icc_or_xcc, %r0 + 52
	.word 0x8d90244d  ! 138: WRPR_PSTATE_I	wrpr	%r0, 0x044d, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89d02034  ! 140: Tcc_I	tleu	icc_or_xcc, %r0 + 52
	.word 0x8d802000  ! 141: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x98006001  ! 142: ADD_I	add 	%r1, 0x0001, %r12
	.word 0x8198200b  ! 143: WRHPR_HPSTATE_I	wrhpr	%r0, 0x000b, %hpstate
DS_4:
	.word 0x32800001  ! 145: BNE	bne,a	<label_0x1>
	.word 0xd5314002  ! 145: STQF_R	-	%f10, [%r2, %r5]
	.word 0x83458000  ! 144: RD_SOFTINT_REG	rd	%softint, %r1
	ta	T_CHANGE_HPRIV	! macro
	.word 0x83a389e1  ! 146: FDIVq	dis not found

	.word 0x95a389ab  ! 147: FDIVs	fdivs	%f14, %f11, %f10
	.word 0x8480a001  ! 148: ADDcc_I	addcc 	%r2, 0x0001, %r2
	.word 0x9ba000cb  ! 149: FNEGd	fnegd	%f42, %f44
	.word 0x9d500000  ! 150: RDPR_TPC	rdpr	%tpc, %r14
	.word 0x8d802000  ! 151: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91a189a2  ! 152: FDIVs	fdivs	%f6, %f2, %f8
	.word 0x8d51c000  ! 153: RDPR_TL	rdpr	%tl, %r6
	.word 0x9e78e001  ! 154: SDIV_I	sdiv 	%r3, 0x0001, %r15
	.word 0x819820d2  ! 155: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00d2, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a0054a  ! 157: FSQRTd	fsqrt	
	.word 0x81982cd9  ! 158: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd9, %hpstate
	.word 0x97a3cd22  ! 159: FsMULd	fsmuld	%f15, %f2, %f42
	.word 0x9ba3c9ae  ! 160: FDIVs	fdivs	%f15, %f14, %f13
	.word 0x85d02030  ! 161: Tcc_I	tle	icc_or_xcc, %r0 + 48
	.word 0xdadfe000  ! 162: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r13
DS_5:
	.word 0x32800001  ! 164: BNE	bne,a	<label_0x1>
	.word 0xc9304008  ! 164: STQF_R	-	%f4, [%r8, %r1]
	.word 0x99458000  ! 163: RD_SOFTINT_REG	rd	%softint, %r12
DS_6:
	.word 0x34800001  ! 165: BG	bg,a	<label_0x1>
	.word 0xcd338009  ! 165: STQF_R	-	%f6, [%r9, %r14]
	.word 0x9b458000  ! 164: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x8198231e  ! 165: WRHPR_HPSTATE_I	wrhpr	%r0, 0x031e, %hpstate
	.word 0x81982209  ! 166: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0209, %hpstate
DS_7:
	.word 0x34800001  ! 168: BG	bg,a	<label_0x1>
	illtrap
	.word 0x99b0430d  ! 167: ALLIGNADDRESS	alignaddr	%r1, %r13, %r12
	.word 0x9da0054b  ! 168: FSQRTd	fsqrt	
	.word 0x2c800001  ! 169: BNEG	bneg,a	<label_0x1>
	.word 0x81982c99  ! 170: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c99, %hpstate
	.word 0x81982fc8  ! 171: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fc8, %hpstate
	.word 0x8d9020c4  ! 172: WRPR_PSTATE_I	wrpr	%r0, 0x00c4, %pstate
	.word 0xdd37e001  ! 173: STQF_I	-	%f14, [0x0001, %r31]
	.word 0x95d02031  ! 174: Tcc_I	tg	icc_or_xcc, %r0 + 49
	.word 0x819820c5  ! 175: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00c5, %hpstate
	.word 0x8d802004  ! 176: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d802000  ! 177: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xdcc7e010  ! 179: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r14
	.word 0x819826cd  ! 180: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06cd, %hpstate
	.word 0x9278c00a  ! 181: SDIV_R	sdiv 	%r3, %r10, %r9
	.word 0x8b6bc009  ! 182: SDIVX_R	sdivx	%r15, %r9, %r5
	.word 0x9ba00543  ! 183: FSQRTd	fsqrt	
	mov 0x33, %r30
	.word 0x89d0001e  ! 184: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0xda8008a0  ! 185: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x97508000  ! 186: RDPR_TSTATE	rdpr	%tstate, %r11
DS_8:
	.word 0x20800001  ! 188: BN	bn,a	<label_0x1>
	.word 0xcf31c00c  ! 188: STQF_R	-	%f7, [%r12, %r7]
	.word 0x8f458000  ! 187: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0x8c82400b  ! 188: ADDcc_R	addcc 	%r9, %r11, %r6
	.word 0x8d902c1e  ! 189: WRPR_PSTATE_I	wrpr	%r0, 0x0c1e, %pstate
	mov 0x32, %r30
	.word 0x9dd0001e  ! 190: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x20700001  ! 191: BPN	<illegal instruction>
	.word 0x97a01a68  ! 192: FqTOi	fqtoi	
	.word 0x81982784  ! 193: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0784, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d902488  ! 195: WRPR_PSTATE_I	wrpr	%r0, 0x0488, %pstate
	mov 0x33, %r30
	.word 0x9dd0001e  ! 196: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x8d802004  ! 197: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x87802080  ! 198: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x87802004  ! 199: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x81982c46  ! 200: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c46, %hpstate
	.word 0x819822d7  ! 201: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02d7, %hpstate
DS_9:
	.word 0x34800001  ! 203: BG	bg,a	<label_0x1>
	illtrap
	.word 0x9db18302  ! 202: ALLIGNADDRESS	alignaddr	%r6, %r2, %r14
	.word 0x28700001  ! 203: BPLEU	<illegal instruction>
	.word 0x87802089  ! 204: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8d9028cc  ! 205: WRPR_PSTATE_I	wrpr	%r0, 0x08cc, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81982508  ! 207: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0508, %hpstate
	.word 0x20700001  ! 208: BPN	<illegal instruction>
	mov 0x35, %r30
	.word 0x93d0001e  ! 209: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x9c7b000a  ! 210: SDIV_R	sdiv 	%r12, %r10, %r14
	.word 0x8d902658  ! 211: WRPR_PSTATE_I	wrpr	%r0, 0x0658, %pstate
	.word 0x81982848  ! 212: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0848, %hpstate
	.word 0x819828cd  ! 213: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08cd, %hpstate
	.word 0x91a049ef  ! 214: FDIVq	dis not found

	.word 0xd09004a0  ! 215: LDUHA_R	lduha	[%r0, %r0] 0x25, %r8
	.word 0x3a700001  ! 216: BPCC	<illegal instruction>
	.word 0x95a000cc  ! 217: FNEGd	fnegd	%f12, %f10
	.word 0x81982416  ! 218: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0416, %hpstate
	.word 0x8d90285a  ! 219: WRPR_PSTATE_I	wrpr	%r0, 0x085a, %pstate
	.word 0x8d802004  ! 220: WRFPRS_I	wr	%r0, 0x0004, %fprs
DS_10:
	.word 0x34800001  ! 222: BG	bg,a	<label_0x1>
	.word 0xcd32a001  ! 222: STQF_I	-	%f6, [0x0001, %r10]
	.word 0x83458000  ! 221: RD_SOFTINT_REG	rd	%softint, %r1
	.word 0x9b51c000  ! 222: RDPR_TL	rdpr	%tl, %r13
DS_11:
	.word 0x20800001  ! 224: BN	bn,a	<label_0x1>
	.word 0xdd312001  ! 224: STQF_I	-	%f14, [0x0001, %r4]
	.word 0x81458000  ! 223: RD_SOFTINT_REG	stbar
DS_12:
	.word 0x34800001  ! 225: BG	bg,a	<label_0x1>
	.word 0xd5306001  ! 225: STQF_I	-	%f10, [0x0001, %r1]
	.word 0x9f458000  ! 224: RD_SOFTINT_REG	rd	%softint, %r15
	.word 0x87802088  ! 225: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x836b000c  ! 226: SDIVX_R	sdivx	%r12, %r12, %r1
	.word 0x81982c80  ! 227: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c80, %hpstate
	.word 0x9a794003  ! 228: SDIV_R	sdiv 	%r5, %r3, %r13
	.word 0x8d902c9d  ! 229: WRPR_PSTATE_I	wrpr	%r0, 0x0c9d, %pstate
	.word 0x8d802000  ! 230: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d902851  ! 231: WRPR_PSTATE_I	wrpr	%r0, 0x0851, %pstate
	.word 0x8d902000  ! 232: WRPR_PSTATE_I	wrpr	%r0, 0x0000, %pstate
	.word 0x91d02030  ! 233: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x8d902ecb  ! 234: WRPR_PSTATE_I	wrpr	%r0, 0x0ecb, %pstate
	.word 0x91a01a63  ! 235: FqTOi	fqtoi	
	.word 0x81d02033  ! 236: Tcc_I	tn	icc_or_xcc, %r0 + 51
	.word 0x8d902259  ! 237: WRPR_PSTATE_I	wrpr	%r0, 0x0259, %pstate
	.word 0x8069e001  ! 238: UDIVX_I	udivx 	%r7, 0x0001, %r0
	.word 0xc0c80e80  ! 239: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r0
	.word 0x81982c95  ! 240: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c95, %hpstate
	.word 0x89d02033  ! 241: Tcc_I	tleu	icc_or_xcc, %r0 + 51
DS_13:
	.word 0x20800001  ! 243: BN	bn,a	<label_0x1>
	illtrap
	.word 0x8bb2c305  ! 242: ALLIGNADDRESS	alignaddr	%r11, %r5, %r5
	.word 0xca7fe001  ! 243: SWAP_I	swap	%r5, [%r31 + 0x0001]
	.word 0x8081a001  ! 244: ADDcc_I	addcc 	%r6, 0x0001, %r0
	.word 0xc09004a0  ! 245: LDUHA_R	lduha	[%r0, %r0] 0x25, %r0
	.word 0x81982005  ! 246: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0005, %hpstate
	.word 0x8d902687  ! 247: WRPR_PSTATE_I	wrpr	%r0, 0x0687, %pstate
	.word 0x8198210f  ! 248: WRHPR_HPSTATE_I	wrhpr	%r0, 0x010f, %hpstate
	.word 0x91d02035  ! 249: Tcc_I	ta	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_TO_TL0	! macro
DS_14:
	.word 0x34800001  ! 252: BG	bg,a	<label_0x1>
	illtrap
	.word 0x91b2c30a  ! 251: ALLIGNADDRESS	alignaddr	%r11, %r10, %r8
	.word 0x87a00d21  ! 252: FsMULd	fsmuld	%f0, %f32, %f34
	.word 0xc6d7e000  ! 253: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r3
	ta	T_CHANGE_PRIV	! macro
	.word 0x98492001  ! 255: MULX_I	mulx 	%r4, 0x0001, %r12
	ta	T_CHANGE_PRIV	! macro
	.word 0x92482001  ! 257: MULX_I	mulx 	%r0, 0x0001, %r9
	.word 0x81982ddb  ! 258: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ddb, %hpstate
	mov 0x30, %r30
	.word 0x9fd0001e  ! 259: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x81a01a6e  ! 260: FqTOi	fqtoi	
	.word 0x81982253  ! 261: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0253, %hpstate
	.word 0x80012001  ! 262: ADD_I	add 	%r4, 0x0001, %r0
	.word 0xc08008a0  ! 263: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0x8d902e01  ! 264: WRPR_PSTATE_I	wrpr	%r0, 0x0e01, %pstate
	.word 0x8d802004  ! 265: WRFPRS_I	wr	%r0, 0x0004, %fprs
	ta	T_CHANGE_HPRIV	! macro
DS_15:
	.word 0x22800001  ! 268: BE	be,a	<label_0x1>
	.word 0xcb320003  ! 268: STQF_R	-	%f5, [%r3, %r8]
	.word 0x89458000  ! 267: RD_SOFTINT_REG	rd	%softint, %r4
	.word 0x8d802000  ! 268: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x95a000c8  ! 269: FNEGd	fnegd	%f8, %f10
	.word 0x8198269f  ! 270: WRHPR_HPSTATE_I	wrhpr	%r0, 0x069f, %hpstate
	.word 0x844a8009  ! 271: MULX_R	mulx 	%r10, %r9, %r2
	.word 0x87802016  ! 272: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8d902656  ! 273: WRPR_PSTATE_I	wrpr	%r0, 0x0656, %pstate
	.word 0xc447c000  ! 274: LDSW_R	ldsw	[%r31 + %r0], %r2
DS_16:
	.word 0x22800001  ! 276: BE	be,a	<label_0x1>
	.word 0xd331a001  ! 276: STQF_I	-	%f9, [0x0001, %r6]
	.word 0x9f458000  ! 275: RD_SOFTINT_REG	rd	%softint, %r15
	.word 0x36700001  ! 276: BPGE	<illegal instruction>
	.word 0x20800001  ! 277: BN	bn,a	<label_0x1>
	.word 0xdebfe001  ! 278: STDA_I	stda	%r15, [%r31 + 0x0001] %asi
	.word 0xde07e001  ! 279: LDUW_I	lduw	[%r31 + 0x0001], %r15
	.word 0xde800aa0  ! 280: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r15
	.word 0xdfe7c029  ! 281: CASA_I	casa	[%r31] 0x 1, %r9, %r15
DS_17:
	.word 0x22800001  ! 283: BE	be,a	<label_0x1>
	.word 0xd1312001  ! 283: STQF_I	-	%f8, [0x0001, %r4]
	.word 0x97458000  ! 282: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0xd68008a0  ! 283: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x8dd02032  ! 284: Tcc_I	tneg	icc_or_xcc, %r0 + 50
	.word 0x9881e001  ! 285: ADDcc_I	addcc 	%r7, 0x0001, %r12
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9b504000  ! 287: RDPR_TNPC	rdpr	%tnpc, %r13
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xdad804a0  ! 290: LDXA_R	ldxa	[%r0, %r0] 0x25, %r13
	.word 0x81982147  ! 291: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0147, %hpstate
	.word 0x84524008  ! 292: UMUL_R	umul 	%r9, %r8, %r2
	.word 0x904b0005  ! 293: MULX_R	mulx 	%r12, %r5, %r8
	.word 0x8269800c  ! 294: UDIVX_R	udivx 	%r6, %r12, %r1
	.word 0xc28008a0  ! 295: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0xc28804a0  ! 296: LDUBA_R	lduba	[%r0, %r0] 0x25, %r1
	.word 0x8d902857  ! 297: WRPR_PSTATE_I	wrpr	%r0, 0x0857, %pstate
	.word 0xc2d7e010  ! 298: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r1
	.word 0x8d90205f  ! 299: WRPR_PSTATE_I	wrpr	%r0, 0x005f, %pstate
	.word 0x32800001  ! 300: BNE	bne,a	<label_0x1>
	.word 0x97d02032  ! 301: Tcc_I	tge	icc_or_xcc, %r0 + 50
	ta	T_CHANGE_PRIV	! macro
	.word 0x97682001  ! 303: SDIVX_I	sdivx	%r0, 0x0001, %r11
	.word 0x8d902045  ! 304: WRPR_PSTATE_I	wrpr	%r0, 0x0045, %pstate
	.word 0xd60fe001  ! 305: LDUB_I	ldub	[%r31 + 0x0001], %r11
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd6d004a0  ! 307: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r11
	.word 0x8d902807  ! 308: WRPR_PSTATE_I	wrpr	%r0, 0x0807, %pstate
	.word 0x8d902add  ! 309: WRPR_PSTATE_I	wrpr	%r0, 0x0add, %pstate
	.word 0x8d902ec5  ! 310: WRPR_PSTATE_I	wrpr	%r0, 0x0ec5, %pstate
	.word 0xd68008a0  ! 311: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x8d802000  ! 312: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd6cfe000  ! 313: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r11
	.word 0x87802080  ! 314: WRASI_I	wr	%r0, 0x0080, %asi
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8fa389a0  ! 316: FDIVs	fdivs	%f14, %f0, %f7
	.word 0x88012001  ! 317: ADD_I	add 	%r4, 0x0001, %r4
	.word 0x81982b44  ! 318: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b44, %hpstate
	.word 0x91d02032  ! 319: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8c7aa001  ! 320: SDIV_I	sdiv 	%r10, 0x0001, %r6
	.word 0xcd3fe001  ! 321: STDF_I	std	%f6, [0x0001, %r31]
	.word 0xcc8008a0  ! 322: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x9678a001  ! 323: SDIV_I	sdiv 	%r2, 0x0001, %r11
	.word 0x8d90221d  ! 324: WRPR_PSTATE_I	wrpr	%r0, 0x021d, %pstate
	.word 0xd6bfc020  ! 325: STDA_R	stda	%r11, [%r31 + %r0] 0x01
	.word 0x9e4be001  ! 326: MULX_I	mulx 	%r15, 0x0001, %r15
DS_18:
	.word 0x20800001  ! 328: BN	bn,a	<label_0x1>
	illtrap
	.word 0x97b3430f  ! 327: ALLIGNADDRESS	alignaddr	%r13, %r15, %r11
	.word 0xd68fe010  ! 328: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r11
	.word 0x87802089  ! 329: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xd69fc020  ! 330: LDDA_R	ldda	[%r31, %r0] 0x01, %r11
	.word 0x9c836001  ! 331: ADDcc_I	addcc 	%r13, 0x0001, %r14
	.word 0x87802016  ! 332: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x87802014  ! 333: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xdd27e001  ! 334: STF_I	st	%f14, [0x0001, %r31]
	.word 0xdcffc02f  ! 335: SWAPA_R	swapa	%r14, [%r31 + %r15] 0x01
	.word 0x9ba0054f  ! 336: FSQRTd	fsqrt	
	.word 0x22700001  ! 337: BPE	<illegal instruction>
	.word 0x95a249a5  ! 338: FDIVs	fdivs	%f9, %f5, %f10
	.word 0x9f51c000  ! 339: RDPR_TL	rdpr	%tl, %r15
	.word 0x81982e9e  ! 340: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e9e, %hpstate
	.word 0x81982795  ! 341: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0795, %hpstate
	.word 0xde8fe000  ! 342: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r15
DS_19:
	.word 0x32800001  ! 344: BNE	bne,a	<label_0x1>
	.word 0xdd322001  ! 344: STQF_I	-	%f14, [0x0001, %r8]
	.word 0x83458000  ! 343: RD_SOFTINT_REG	rd	%softint, %r1
	.word 0xc28804a0  ! 344: LDUBA_R	lduba	[%r0, %r0] 0x25, %r1
	mov 0x34, %r30
	.word 0x9dd0001e  ! 345: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x81982654  ! 346: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0654, %hpstate
	.word 0x93a0054c  ! 347: FSQRTd	fsqrt	
	.word 0x8c49a001  ! 348: MULX_I	mulx 	%r6, 0x0001, %r6
DS_20:
	.word 0x20800001  ! 350: BN	bn,a	<label_0x1>
	illtrap
	.word 0x8fb1830d  ! 349: ALLIGNADDRESS	alignaddr	%r6, %r13, %r7
	.word 0xce97e020  ! 350: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r7
	.word 0xcec004a0  ! 351: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r7
	.word 0x9b494000  ! 352: RDHPR_HTBA	rdhpr	%htba, %r13
	.word 0x8a786001  ! 353: SDIV_I	sdiv 	%r1, 0x0001, %r5
	ta	T_CHANGE_NONPRIV	! macro
	mov 0x32, %r30
	.word 0x8fd0001e  ! 355: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x8d902cce  ! 356: WRPR_PSTATE_I	wrpr	%r0, 0x0cce, %pstate
	.word 0x80782001  ! 357: SDIV_I	sdiv 	%r0, 0x0001, %r0
	mov 0x30, %r30
	.word 0x8dd0001e  ! 358: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
DS_21:
	.word 0x20800001  ! 360: BN	bn,a	<label_0x1>
	illtrap
	.word 0x95b0c30b  ! 359: ALLIGNADDRESS	alignaddr	%r3, %r11, %r10
	.word 0x8e534003  ! 360: UMUL_R	umul 	%r13, %r3, %r7
	.word 0xce7fe001  ! 361: SWAP_I	swap	%r7, [%r31 + 0x0001]
	.word 0x81982794  ! 362: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0794, %hpstate
	.word 0x93a000ce  ! 363: FNEGd	fnegd	%f14, %f40
	.word 0xd297e000  ! 364: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r9
	.word 0x8d902c04  ! 365: WRPR_PSTATE_I	wrpr	%r0, 0x0c04, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d90265e  ! 367: WRPR_PSTATE_I	wrpr	%r0, 0x065e, %pstate
	.word 0x8d802000  ! 368: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xd2cfe010  ! 371: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r9
	mov 0x35, %r30
	.word 0x97d0001e  ! 372: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x8c4b000c  ! 373: MULX_R	mulx 	%r12, %r12, %r6
	.word 0x8d902256  ! 374: WRPR_PSTATE_I	wrpr	%r0, 0x0256, %pstate
	.word 0x8d9026c7  ! 375: WRPR_PSTATE_I	wrpr	%r0, 0x06c7, %pstate
	.word 0x8c786001  ! 376: SDIV_I	sdiv 	%r1, 0x0001, %r6
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9bd02031  ! 378: Tcc_I	tcc	icc_or_xcc, %r0 + 49
	.word 0x819828d6  ! 379: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d6, %hpstate
	.word 0x8d90240a  ! 380: WRPR_PSTATE_I	wrpr	%r0, 0x040a, %pstate
	.word 0x9fa209a8  ! 381: FDIVs	fdivs	%f8, %f8, %f15
DS_22:
	.word 0x22800001  ! 383: BE	be,a	<label_0x1>
	illtrap
	.word 0x87b18303  ! 382: ALLIGNADDRESS	alignaddr	%r6, %r3, %r3
	.word 0x99d02035  ! 383: Tcc_I	tgu	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_NONPRIV	! macro
	mov 0x34, %r30
	.word 0x8fd0001e  ! 385: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x91480000  ! 386: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
	.word 0x819823d1  ! 387: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03d1, %hpstate
	.word 0xd137c003  ! 388: STQF_R	-	%f8, [%r3, %r31]
	.word 0x8d90244c  ! 389: WRPR_PSTATE_I	wrpr	%r0, 0x044c, %pstate
	.word 0x8198270f  ! 390: WRHPR_HPSTATE_I	wrhpr	%r0, 0x070f, %hpstate
	.word 0x8a002001  ! 391: ADD_I	add 	%r0, 0x0001, %r5
	.word 0x93d02030  ! 392: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0x93d02031  ! 393: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x9ba209ec  ! 394: FDIVq	dis not found

	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d902a1c  ! 396: WRPR_PSTATE_I	wrpr	%r0, 0x0a1c, %pstate
	.word 0x9bd02035  ! 397: Tcc_I	tcc	icc_or_xcc, %r0 + 53
	.word 0xda37e001  ! 398: STH_I	sth	%r13, [%r31 + 0x0001]
	.word 0x9fd02033  ! 399: Tcc_I	tvc	icc_or_xcc, %r0 + 51
	.word 0x24800001  ! 400: BLE	ble,a	<label_0x1>
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8b6b0000  ! 402: SDIVX_R	sdivx	%r12, %r0, %r5
	.word 0x8ad1e001  ! 403: UMULcc_I	umulcc 	%r7, 0x0001, %r5
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x81982456  ! 405: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0456, %hpstate
	mov 0x34, %r30
	.word 0x83d0001e  ! 406: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8fd02034  ! 407: Tcc_I	tvs	icc_or_xcc, %r0 + 52
	.word 0x8d90248b  ! 408: WRPR_PSTATE_I	wrpr	%r0, 0x048b, %pstate
	.word 0x8d90281a  ! 409: WRPR_PSTATE_I	wrpr	%r0, 0x081a, %pstate
	.word 0x91a000c5  ! 410: FNEGd	fnegd	%f36, %f8
	.word 0x8dd02035  ! 411: Tcc_I	tneg	icc_or_xcc, %r0 + 53
	.word 0x81982e40  ! 412: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e40, %hpstate
	.word 0xd0d004a0  ! 413: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
	.word 0xd0800ba0  ! 414: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r8
	ta	T_CHANGE_TO_TL0	! macro
DS_23:
	.word 0x22800001  ! 417: BE	be,a	<label_0x1>
	illtrap
	.word 0x99b0c309  ! 416: ALLIGNADDRESS	alignaddr	%r3, %r9, %r12
DS_24:
	.word 0x32800001  ! 418: BNE	bne,a	<label_0x1>
	.word 0xd7330003  ! 418: STQF_R	-	%f11, [%r3, %r12]
	.word 0x95458000  ! 417: RD_SOFTINT_REG	rd	%softint, %r10
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd45fc000  ! 419: LDX_R	ldx	[%r31 + %r0], %r10
DS_25:
	.word 0x32800001  ! 421: BNE	bne,a	<label_0x1>
	.word 0xdf314002  ! 421: STQF_R	-	%f15, [%r2, %r5]
	.word 0x9f458000  ! 420: RD_SOFTINT_REG	rd	%softint, %r15
	.word 0x8ed1800a  ! 421: UMULcc_R	umulcc 	%r6, %r10, %r7
	.word 0x86d1c005  ! 422: UMULcc_R	umulcc 	%r7, %r5, %r3
	.word 0x22800001  ! 423: BE	be,a	<label_0x1>
	.word 0xc68008a0  ! 424: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x87802010  ! 426: WRASI_I	wr	%r0, 0x0010, %asi
	mov 0x31, %r30
	.word 0x8dd0001e  ! 427: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x99a00564  ! 428: FSQRTq	fsqrt	
	.word 0x996b000f  ! 429: SDIVX_R	sdivx	%r12, %r15, %r12
	.word 0x80d0e001  ! 430: UMULcc_I	umulcc 	%r3, 0x0001, %r0
	.word 0x93a000cc  ! 431: FNEGd	fnegd	%f12, %f40
	.word 0x83d02034  ! 432: Tcc_I	te	icc_or_xcc, %r0 + 52
	ta	T_CHANGE_PRIV	! macro
	.word 0x32700001  ! 434: BPNE	<illegal instruction>
	.word 0xd20fe001  ! 435: LDUB_I	ldub	[%r31 + 0x0001], %r9
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902610  ! 437: WRPR_PSTATE_I	wrpr	%r0, 0x0610, %pstate
	.word 0x81982bc9  ! 438: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc9, %hpstate
	.word 0x84480002  ! 439: MULX_R	mulx 	%r0, %r2, %r2
	.word 0x20700001  ! 440: BPN	<illegal instruction>
	.word 0x8d802004  ! 441: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x3e700001  ! 442: BPVC	<illegal instruction>
	.word 0x83a0cd27  ! 443: FsMULd	fsmuld	%f3, %f38, %f32
DS_26:
	.word 0x34800001  ! 445: BG	bg,a	<label_0x1>
	illtrap
	.word 0x95b1430b  ! 444: ALLIGNADDRESS	alignaddr	%r5, %r11, %r10
	.word 0x9f6ae001  ! 445: SDIVX_I	sdivx	%r11, 0x0001, %r15
	ta	T_CHANGE_HPRIV	! macro
	.word 0xdf37e001  ! 447: STQF_I	-	%f15, [0x0001, %r31]
	.word 0x9468400f  ! 448: UDIVX_R	udivx 	%r1, %r15, %r10
	.word 0x95a38dca  ! 449: FdMULq	fdmulq	
	.word 0x8d802004  ! 450: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x2c800001  ! 451: BNEG	bneg,a	<label_0x1>
	.word 0x90c22001  ! 452: ADDCcc_I	addccc 	%r8, 0x0001, %r8
	.word 0x81982e57  ! 453: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e57, %hpstate
	.word 0xd0900e40  ! 454: LDUHA_R	lduha	[%r0, %r0] 0x72, %r8
	.word 0xd08008a0  ! 455: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0x8198204c  ! 456: WRHPR_HPSTATE_I	wrhpr	%r0, 0x004c, %hpstate
	.word 0x8d9022c1  ! 457: WRPR_PSTATE_I	wrpr	%r0, 0x02c1, %pstate
	.word 0x80682001  ! 458: UDIVX_I	udivx 	%r0, 0x0001, %r0
	.word 0x85a0054b  ! 459: FSQRTd	fsqrt	
	.word 0xc527c00b  ! 460: STF_R	st	%f2, [%r11, %r31]
	.word 0x8d802000  ! 461: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87a009aa  ! 462: FDIVs	fdivs	%f0, %f10, %f3
	.word 0x967a6001  ! 463: SDIV_I	sdiv 	%r9, 0x0001, %r11
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d902454  ! 466: WRPR_PSTATE_I	wrpr	%r0, 0x0454, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93d02033  ! 468: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x81982148  ! 469: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0148, %hpstate
	.word 0x8198231d  ! 470: WRHPR_HPSTATE_I	wrhpr	%r0, 0x031d, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	mov 0x34, %r30
	.word 0x8fd0001e  ! 472: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x83a01a68  ! 473: FqTOi	fqtoi	
	.word 0x8ba0056c  ! 474: FSQRTq	fsqrt	
	.word 0xcac00e60  ! 475: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r5
	.word 0x8d902a9e  ! 476: WRPR_PSTATE_I	wrpr	%r0, 0x0a9e, %pstate
	.word 0x90520009  ! 477: UMUL_R	umul 	%r8, %r9, %r8
	.word 0x81a309e8  ! 478: FDIVq	dis not found

	.word 0x3a700001  ! 479: BPCC	<illegal instruction>
	.word 0x81982513  ! 480: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0513, %hpstate
	.word 0x89508000  ! 481: RDPR_TSTATE	rdpr	%tstate, %r4
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xc83fc008  ! 483: STD_R	std	%r4, [%r31 + %r8]
	.word 0x95688009  ! 484: SDIVX_R	sdivx	%r2, %r9, %r10
	.word 0x9a4a8009  ! 485: MULX_R	mulx 	%r10, %r9, %r13
	.word 0x81982dcc  ! 486: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dcc, %hpstate
	.word 0x8dd02032  ! 487: Tcc_I	tneg	icc_or_xcc, %r0 + 50
	ta	T_CHANGE_HPRIV	! macro
	mov 0x32, %r30
	.word 0x9fd0001e  ! 489: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0xdaffc029  ! 490: SWAPA_R	swapa	%r13, [%r31 + %r9] 0x01
	.word 0x81982f01  ! 491: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f01, %hpstate
DS_27:
	.word 0x20800001  ! 493: BN	bn,a	<label_0x1>
	illtrap
	.word 0x89b0c301  ! 492: ALLIGNADDRESS	alignaddr	%r3, %r1, %r4
	.word 0x81982e43  ! 493: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e43, %hpstate
	.word 0x8d902649  ! 494: WRPR_PSTATE_I	wrpr	%r0, 0x0649, %pstate
	.word 0x8198218d  ! 495: WRHPR_HPSTATE_I	wrhpr	%r0, 0x018d, %hpstate
	.word 0x81982ec3  ! 496: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ec3, %hpstate
	.word 0x87802089  ! 497: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x9fa009ee  ! 498: FDIVq	dis not found

	.word 0x9b480000  ! 499: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
	.word 0xda97e020  ! 500: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r13
	.word 0xdac004a0  ! 501: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
	.word 0x81982915  ! 502: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0915, %hpstate
	.word 0x89d02030  ! 503: Tcc_I	tleu	icc_or_xcc, %r0 + 48
	.word 0x87802080  ! 504: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x9dd02034  ! 505: Tcc_I	tpos	icc_or_xcc, %r0 + 52
	.word 0x99d02032  ! 506: Tcc_I	tgu	icc_or_xcc, %r0 + 50
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9e4b6001  ! 508: MULX_I	mulx 	%r13, 0x0001, %r15
	.word 0x8d90225c  ! 509: WRPR_PSTATE_I	wrpr	%r0, 0x025c, %pstate
	.word 0x8d902adc  ! 510: WRPR_PSTATE_I	wrpr	%r0, 0x0adc, %pstate
	.word 0x8d90220b  ! 511: WRPR_PSTATE_I	wrpr	%r0, 0x020b, %pstate
	.word 0x8d902256  ! 512: WRPR_PSTATE_I	wrpr	%r0, 0x0256, %pstate
	mov 0x30, %r30
	.word 0x87d0001e  ! 513: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x99d02034  ! 514: Tcc_I	tgu	icc_or_xcc, %r0 + 52
	.word 0x2a700001  ! 515: BPCS	<illegal instruction>
	.word 0x8d802000  ! 516: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9c4b2001  ! 517: MULX_I	mulx 	%r12, 0x0001, %r14
	.word 0xdd27c00e  ! 518: STF_R	st	%f14, [%r14, %r31]
	mov 0x34, %r30
	.word 0x97d0001e  ! 519: Tcc_R	tge	icc_or_xcc, %r0 + %r30
DS_28:
	.word 0x20800001  ! 521: BN	bn,a	<label_0x1>
	.word 0xd733e001  ! 521: STQF_I	-	%f11, [0x0001, %r15]
	.word 0x97458000  ! 520: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0x87802080  ! 521: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x8d9020df  ! 522: WRPR_PSTATE_I	wrpr	%r0, 0x00df, %pstate
	.word 0x93d02034  ! 523: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x8d802004  ! 524: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x92688002  ! 525: UDIVX_R	udivx 	%r2, %r2, %r9
	.word 0x8d902e9c  ! 526: WRPR_PSTATE_I	wrpr	%r0, 0x0e9c, %pstate
	.word 0xd337c002  ! 527: STQF_R	-	%f9, [%r2, %r31]
	.word 0xd297e020  ! 528: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r9
	.word 0x81982cd6  ! 529: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd6, %hpstate
DS_29:
	.word 0x20800001  ! 531: BN	bn,a	<label_0x1>
	.word 0xc1332001  ! 531: STQF_I	-	%f0, [0x0001, %r12]
	.word 0x8f458000  ! 530: RD_SOFTINT_REG	rd	%softint, %r7
DS_30:
	.word 0x34800001  ! 532: BG	bg,a	<label_0x1>
	.word 0xcb302001  ! 532: STQF_I	-	%f5, [0x0001, %r0]
	.word 0x9f458000  ! 531: RD_SOFTINT_REG	rd	%softint, %r15
	.word 0xde1fc000  ! 532: LDD_R	ldd	[%r31 + %r0], %r15
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8ba01a65  ! 534: FqTOi	fqtoi	
	.word 0x9fa34d20  ! 535: FsMULd	fsmuld	%f13, %f0, %f46
	.word 0xde97e010  ! 536: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r15
	.word 0x81982295  ! 537: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0295, %hpstate
	.word 0xde8008a0  ! 538: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r15
	.word 0x84824005  ! 539: ADDcc_R	addcc 	%r9, %r5, %r2
	.word 0x8d902eca  ! 540: WRPR_PSTATE_I	wrpr	%r0, 0x0eca, %pstate
	.word 0x97d02031  ! 541: Tcc_I	tge	icc_or_xcc, %r0 + 49
	.word 0x8d90201f  ! 542: WRPR_PSTATE_I	wrpr	%r0, 0x001f, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8fa009e5  ! 544: FDIVq	dis not found

	.word 0x8a78e001  ! 545: SDIV_I	sdiv 	%r3, 0x0001, %r5
	.word 0xca800be0  ! 546: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r5
	.word 0x8d902254  ! 547: WRPR_PSTATE_I	wrpr	%r0, 0x0254, %pstate
	.word 0x8dd02034  ! 548: Tcc_I	tneg	icc_or_xcc, %r0 + 52
	.word 0x8a802001  ! 549: ADDcc_I	addcc 	%r0, 0x0001, %r5
	.word 0x99a01a62  ! 550: FqTOi	fqtoi	
	.word 0x97d02031  ! 551: Tcc_I	tge	icc_or_xcc, %r0 + 49
	.word 0x91d02034  ! 552: Tcc_I	ta	icc_or_xcc, %r0 + 52
	ta	T_CHANGE_PRIV	! macro
	.word 0x93a249a7  ! 554: FDIVs	fdivs	%f9, %f7, %f9
	mov 0x32, %r30
	.word 0x93d0001e  ! 555: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x9248a001  ! 556: MULX_I	mulx 	%r2, 0x0001, %r9
	.word 0xd207e001  ! 557: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0xd2800aa0  ! 558: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r9
	.word 0x96810006  ! 559: ADDcc_R	addcc 	%r4, %r6, %r11
DS_31:
	.word 0x34800001  ! 561: BG	bg,a	<label_0x1>
	.word 0xdb324002  ! 561: STQF_R	-	%f13, [%r2, %r9]
	.word 0x89458000  ! 560: RD_SOFTINT_REG	rd	%softint, %r4
	.word 0x8068800a  ! 561: UDIVX_R	udivx 	%r2, %r10, %r0
	.word 0x8d90260f  ! 562: WRPR_PSTATE_I	wrpr	%r0, 0x060f, %pstate
	mov 0x31, %r30
	.word 0x9fd0001e  ! 563: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x87d02031  ! 564: Tcc_I	tl	icc_or_xcc, %r0 + 49
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8ba0054b  ! 566: FSQRTd	fsqrt	
	.word 0x88d12001  ! 567: UMULcc_I	umulcc 	%r4, 0x0001, %r4
DS_32:
	.word 0x20800001  ! 569: BN	bn,a	<label_0x1>
	.word 0xdd324001  ! 569: STQF_R	-	%f14, [%r1, %r9]
	.word 0x87458000  ! 568: RD_SOFTINT_REG	rd	%softint, %r3
	.word 0xc7e7c021  ! 569: CASA_I	casa	[%r31] 0x 1, %r1, %r3
	.word 0x84d12001  ! 570: UMULcc_I	umulcc 	%r4, 0x0001, %r2
	.word 0x93d02030  ! 571: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0x85a289c6  ! 572: FDIVd	fdivd	%f10, %f6, %f2
DS_33:
	.word 0x34800001  ! 574: BG	bg,a	<label_0x1>
	illtrap
	.word 0x8fb0030c  ! 573: ALLIGNADDRESS	alignaddr	%r0, %r12, %r7
	.word 0xcfe7c02c  ! 574: CASA_I	casa	[%r31] 0x 1, %r12, %r7
	.word 0x916ac002  ! 575: SDIVX_R	sdivx	%r11, %r2, %r8
	.word 0x8d902a09  ! 576: WRPR_PSTATE_I	wrpr	%r0, 0x0a09, %pstate
	mov 0x34, %r30
	.word 0x93d0001e  ! 577: Tcc_R	tne	icc_or_xcc, %r0 + %r30
DS_34:
	.word 0x34800001  ! 579: BG	bg,a	<label_0x1>
	illtrap
	.word 0x87b04306  ! 578: ALLIGNADDRESS	alignaddr	%r1, %r6, %r3
	.word 0x95a000c6  ! 579: FNEGd	fnegd	%f6, %f10
	.word 0xd4c7e030  ! 580: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r10
DS_35:
	.word 0x22800001  ! 582: BE	be,a	<label_0x1>
	.word 0xdb336001  ! 582: STQF_I	-	%f13, [0x0001, %r13]
	.word 0x85458000  ! 581: RD_SOFTINT_REG	rd	%softint, %r2
	.word 0xc48008a0  ! 582: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	ta	T_CHANGE_PRIV	! macro
	.word 0xc44fe001  ! 584: LDSB_I	ldsb	[%r31 + 0x0001], %r2
	.word 0x9ba0054d  ! 585: FSQRTd	fsqrt	
	.word 0x819822d4  ! 586: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02d4, %hpstate
	.word 0x2c800001  ! 587: BNEG	bneg,a	<label_0x1>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91d02035  ! 589: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8d902414  ! 590: WRPR_PSTATE_I	wrpr	%r0, 0x0414, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d90245e  ! 592: WRPR_PSTATE_I	wrpr	%r0, 0x045e, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d90205c  ! 594: WRPR_PSTATE_I	wrpr	%r0, 0x005c, %pstate
	.word 0x87802088  ! 595: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xdaffc02d  ! 596: SWAPA_R	swapa	%r13, [%r31 + %r13] 0x01
	.word 0x9a7bc00b  ! 597: SDIV_R	sdiv 	%r15, %r11, %r13
	.word 0x8ed8c007  ! 598: SMULcc_R	smulcc 	%r3, %r7, %r7
	.word 0x89a209c7  ! 599: FDIVd	fdivd	%f8, %f38, %f4
	.word 0x81982041  ! 600: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0041, %hpstate
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x9448e001  ! 603: MULX_I	mulx 	%r3, 0x0001, %r10
	.word 0x81982f0c  ! 604: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f0c, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd4c004a0  ! 606: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
	.word 0x89d02035  ! 607: Tcc_I	tleu	icc_or_xcc, %r0 + 53
	.word 0xd4dfe030  ! 608: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r10
	.word 0x8d9020cc  ! 609: WRPR_PSTATE_I	wrpr	%r0, 0x00cc, %pstate
	.word 0xd48fe010  ! 610: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r10
	.word 0xd5e7c027  ! 611: CASA_I	casa	[%r31] 0x 1, %r7, %r10
	.word 0x87802088  ! 612: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x81982214  ! 613: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0214, %hpstate
	.word 0x8d9026c7  ! 614: WRPR_PSTATE_I	wrpr	%r0, 0x06c7, %pstate
	.word 0xd4cfe020  ! 615: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r10
	.word 0xd427c007  ! 616: STW_R	stw	%r10, [%r31 + %r7]
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xd527e001  ! 618: STF_I	st	%f10, [0x0001, %r31]
DS_36:
	.word 0x32800001  ! 620: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x89b0c304  ! 619: ALLIGNADDRESS	alignaddr	%r3, %r4, %r4
	mov 0x31, %r30
	.word 0x87d0001e  ! 620: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x8198225e  ! 621: WRHPR_HPSTATE_I	wrhpr	%r0, 0x025e, %hpstate
	.word 0xc8800b40  ! 622: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r4
	.word 0x8198254d  ! 623: WRHPR_HPSTATE_I	wrhpr	%r0, 0x054d, %hpstate
	.word 0xc93fe001  ! 624: STDF_I	std	%f4, [0x0001, %r31]
	.word 0x99a149a2  ! 625: FDIVs	fdivs	%f5, %f2, %f12
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8fd02031  ! 627: Tcc_I	tvs	icc_or_xcc, %r0 + 49
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xd8d7e000  ! 629: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r12
	.word 0x8d802000  ! 630: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9da000c3  ! 631: FNEGd	fnegd	%f34, %f14
	.word 0x8d902406  ! 632: WRPR_PSTATE_I	wrpr	%r0, 0x0406, %pstate
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xdcd7e010  ! 635: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r14
	.word 0x97d02030  ! 636: Tcc_I	tge	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d802000  ! 638: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_37:
	.word 0x22800001  ! 640: BE	be,a	<label_0x1>
	.word 0xd1304004  ! 640: STQF_R	-	%f8, [%r4, %r1]
	.word 0x99458000  ! 639: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x8d802004  ! 640: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd8800ac0  ! 641: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r12
	.word 0x9ed34003  ! 642: UMULcc_R	umulcc 	%r13, %r3, %r15
	.word 0x99a1c9ce  ! 643: FDIVd	fdivd	%f38, %f14, %f12
	.word 0x9cdb8003  ! 644: SMULcc_R	smulcc 	%r14, %r3, %r14
	.word 0x81982650  ! 645: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0650, %hpstate
	.word 0x85d02030  ! 646: Tcc_I	tle	icc_or_xcc, %r0 + 48
	.word 0x81982395  ! 647: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0395, %hpstate
	mov 0x30, %r30
	.word 0x8dd0001e  ! 648: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0xdc9fe001  ! 649: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r14
	.word 0x8198274d  ! 650: WRHPR_HPSTATE_I	wrhpr	%r0, 0x074d, %hpstate
	.word 0xdc800c00  ! 651: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r14
	.word 0xdc8fe000  ! 652: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r14
	.word 0xdcc7e000  ! 653: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r14
	.word 0xdc8804a0  ! 654: LDUBA_R	lduba	[%r0, %r0] 0x25, %r14
	.word 0xdde7c023  ! 655: CASA_I	casa	[%r31] 0x 1, %r3, %r14
	.word 0x8b6a6001  ! 656: SDIVX_I	sdivx	%r9, 0x0001, %r5
	.word 0x8d68c007  ! 657: SDIVX_R	sdivx	%r3, %r7, %r6
	.word 0x8d902a9a  ! 658: WRPR_PSTATE_I	wrpr	%r0, 0x0a9a, %pstate
	.word 0x819825cc  ! 659: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05cc, %hpstate
	.word 0x3c800001  ! 660: BPOS	bpos,a	<label_0x1>
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x92496001  ! 662: MULX_I	mulx 	%r5, 0x0001, %r9
	.word 0x20700001  ! 663: BPN	<illegal instruction>
	.word 0x8d90200a  ! 664: WRPR_PSTATE_I	wrpr	%r0, 0x000a, %pstate
	.word 0xd28008a0  ! 665: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xd28008a0  ! 666: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x819821db  ! 667: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01db, %hpstate
	.word 0x81494000  ! 668: RDHPR_HTBA	rdhpr	%htba, %r0
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81982c08  ! 670: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c08, %hpstate
	.word 0x8ad2e001  ! 671: UMULcc_I	umulcc 	%r11, 0x0001, %r5
	.word 0x36800001  ! 672: BGE	bge,a	<label_0x1>
	.word 0xca1fe001  ! 673: LDD_I	ldd	[%r31 + 0x0001], %r5
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d902edf  ! 676: WRPR_PSTATE_I	wrpr	%r0, 0x0edf, %pstate
	.word 0x9bd02035  ! 677: Tcc_I	tcc	icc_or_xcc, %r0 + 53
	.word 0x87802016  ! 678: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8c7b6001  ! 679: SDIV_I	sdiv 	%r13, 0x0001, %r6
	.word 0x87a00567  ! 680: FSQRTq	fsqrt	
DS_38:
	.word 0x32800001  ! 682: BNE	bne,a	<label_0x1>
	.word 0xd330e001  ! 682: STQF_I	-	%f9, [0x0001, %r3]
	.word 0x9d458000  ! 681: RD_SOFTINT_REG	rd	%softint, %r14
	.word 0x87d02033  ! 682: Tcc_I	tl	icc_or_xcc, %r0 + 51
	.word 0x8d802000  ! 683: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_39:
	.word 0x34800001  ! 685: BG	bg,a	<label_0x1>
	.word 0xdb304003  ! 685: STQF_R	-	%f13, [%r3, %r1]
	.word 0x9d458000  ! 684: RD_SOFTINT_REG	rd	%softint, %r14
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a000cb  ! 686: FNEGd	fnegd	%f42, %f40
	.word 0xd21fe001  ! 687: LDD_I	ldd	[%r31 + 0x0001], %r9
	.word 0x81982645  ! 688: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0645, %hpstate
	.word 0x8d802004  ! 689: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8198248c  ! 690: WRHPR_HPSTATE_I	wrhpr	%r0, 0x048c, %hpstate
	.word 0x81982144  ! 691: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0144, %hpstate
DS_40:
	.word 0x20800001  ! 693: BN	bn,a	<label_0x1>
	.word 0xc1324009  ! 693: STQF_R	-	%f0, [%r9, %r9]
	.word 0x93458000  ! 692: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x8d9022c2  ! 693: WRPR_PSTATE_I	wrpr	%r0, 0x02c2, %pstate
	mov 0x35, %r30
	.word 0x8dd0001e  ! 694: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	mov 0x31, %r30
	.word 0x9dd0001e  ! 695: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x81d02035  ! 696: Tcc_I	tn	icc_or_xcc, %r0 + 53
	.word 0xd207c000  ! 697: LDUW_R	lduw	[%r31 + %r0], %r9
	.word 0x819820c4  ! 698: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00c4, %hpstate
	.word 0x9d51c000  ! 699: RDPR_TL	rdpr	%tl, %r14
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x87d02030  ! 701: Tcc_I	tl	icc_or_xcc, %r0 + 48
	.word 0xdd97e001  ! 702: LDQFA_I	-	[%r31, 0x0001], %f14
	.word 0x8d90245c  ! 703: WRPR_PSTATE_I	wrpr	%r0, 0x045c, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xdc800ba0  ! 707: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r14
	.word 0xdc8fe020  ! 708: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r14
	mov 0x32, %r30
	.word 0x9fd0001e  ! 709: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x819823cf  ! 710: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03cf, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d902cc0  ! 712: WRPR_PSTATE_I	wrpr	%r0, 0x0cc0, %pstate
	.word 0xdde7c029  ! 713: CASA_I	casa	[%r31] 0x 1, %r9, %r14
	.word 0xdc2fc009  ! 714: STB_R	stb	%r14, [%r31 + %r9]
	.word 0x8d902a89  ! 715: WRPR_PSTATE_I	wrpr	%r0, 0x0a89, %pstate
	.word 0x8d902898  ! 716: WRPR_PSTATE_I	wrpr	%r0, 0x0898, %pstate
	.word 0x2c700001  ! 717: BPNEG	<illegal instruction>
	.word 0x97d02033  ! 718: Tcc_I	tge	icc_or_xcc, %r0 + 51
	.word 0x95504000  ! 719: RDPR_TNPC	rdpr	%tnpc, %r10
	.word 0x86486001  ! 720: MULX_I	mulx 	%r1, 0x0001, %r3
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc697e000  ! 722: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r3
	.word 0x87d02034  ! 723: Tcc_I	tl	icc_or_xcc, %r0 + 52
	.word 0x867ba001  ! 724: SDIV_I	sdiv 	%r14, 0x0001, %r3
	.word 0x9dd02031  ! 725: Tcc_I	tpos	icc_or_xcc, %r0 + 49
	.word 0x81982fc6  ! 726: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fc6, %hpstate
	.word 0xc697e000  ! 727: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r3
	.word 0x2e800001  ! 728: BVS	bvs,a	<label_0x1>
	.word 0x8fd02031  ! 729: Tcc_I	tvs	icc_or_xcc, %r0 + 49
DS_41:
	.word 0x32800001  ! 731: BNE	bne,a	<label_0x1>
	.word 0xcf31c006  ! 731: STQF_R	-	%f7, [%r6, %r7]
	.word 0x8f458000  ! 730: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0x8198250e  ! 731: WRHPR_HPSTATE_I	wrhpr	%r0, 0x050e, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x89a0c9a7  ! 733: FDIVs	fdivs	%f3, %f7, %f4
	.word 0x20700001  ! 734: BPN	<illegal instruction>
DS_42:
	.word 0x22800001  ! 736: BE	be,a	<label_0x1>
	.word 0xd1330001  ! 736: STQF_R	-	%f8, [%r1, %r12]
	.word 0x95458000  ! 735: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0x91a0cdc1  ! 736: FdMULq	fdmulq	
	.word 0x8d9020c1  ! 737: WRPR_PSTATE_I	wrpr	%r0, 0x00c1, %pstate
	.word 0x89494000  ! 738: RDHPR_HTBA	rdhpr	%htba, %r4
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x2e800001  ! 740: BVS	bvs,a	<label_0x1>
	.word 0x9002e001  ! 741: ADD_I	add 	%r11, 0x0001, %r8
DS_43:
	.word 0x34800001  ! 743: BG	bg,a	<label_0x1>
	illtrap
	.word 0x91b2c30b  ! 742: ALLIGNADDRESS	alignaddr	%r11, %r11, %r8
	mov 0x34, %r30
	.word 0x8bd0001e  ! 743: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0xd08008a0  ! 744: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0x8d90244e  ! 745: WRPR_PSTATE_I	wrpr	%r0, 0x044e, %pstate
	.word 0x97d02031  ! 746: Tcc_I	tge	icc_or_xcc, %r0 + 49
	.word 0x8d802004  ! 747: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x93d02034  ! 748: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x8198220b  ! 749: WRHPR_HPSTATE_I	wrhpr	%r0, 0x020b, %hpstate
	.word 0x8d802004  ! 750: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x85a10dcc  ! 751: FdMULq	fdmulq	
	.word 0x8fa000c1  ! 752: FNEGd	fnegd	%f32, %f38
DS_44:
	.word 0x32800001  ! 754: BNE	bne,a	<label_0x1>
	.word 0xc532400c  ! 754: STQF_R	-	%f2, [%r12, %r9]
	.word 0x87458000  ! 753: RD_SOFTINT_REG	rd	%softint, %r3
	mov 0x31, %r30
	.word 0x83d0001e  ! 754: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xc69fe001  ! 755: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r3
	.word 0x91a28d2e  ! 756: FsMULd	fsmuld	%f10, %f14, %f8
	.word 0xd0dfe010  ! 757: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r8
	.word 0x81982592  ! 758: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0592, %hpstate
	.word 0x30700001  ! 759: BPA	<illegal instruction>
	.word 0x8d902a45  ! 760: WRPR_PSTATE_I	wrpr	%r0, 0x0a45, %pstate
	.word 0xd08804a0  ! 761: LDUBA_R	lduba	[%r0, %r0] 0x25, %r8
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8a6ba001  ! 763: UDIVX_I	udivx 	%r14, 0x0001, %r5
	.word 0x8d902e45  ! 764: WRPR_PSTATE_I	wrpr	%r0, 0x0e45, %pstate
DS_45:
	.word 0x34800001  ! 766: BG	bg,a	<label_0x1>
	illtrap
	.word 0x87b34307  ! 765: ALLIGNADDRESS	alignaddr	%r13, %r7, %r3
	.word 0x8d902607  ! 766: WRPR_PSTATE_I	wrpr	%r0, 0x0607, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xc607e001  ! 768: LDUW_I	lduw	[%r31 + 0x0001], %r3
	.word 0x9fa00545  ! 769: FSQRTd	fsqrt	
	.word 0x8d9024d3  ! 770: WRPR_PSTATE_I	wrpr	%r0, 0x04d3, %pstate
	.word 0xde1fe001  ! 771: LDD_I	ldd	[%r31 + 0x0001], %r15
	.word 0x97d02030  ! 772: Tcc_I	tge	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902a91  ! 774: WRPR_PSTATE_I	wrpr	%r0, 0x0a91, %pstate
	.word 0x87802089  ! 775: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x81a289ef  ! 776: FDIVq	dis not found

	.word 0x8079e001  ! 777: SDIV_I	sdiv 	%r7, 0x0001, %r0
	.word 0xc08008a0  ! 778: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0xc0c804a0  ! 779: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r0
	mov 0x35, %r30
	.word 0x95d0001e  ! 780: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0xc0ffc02f  ! 781: SWAPA_R	swapa	%r0, [%r31 + %r15] 0x01
	.word 0x81982ec6  ! 782: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ec6, %hpstate
	.word 0x95a30dcb  ! 783: FdMULq	fdmulq	
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x86c1e001  ! 785: ADDCcc_I	addccc 	%r7, 0x0001, %r3
	.word 0x94692001  ! 786: UDIVX_I	udivx 	%r4, 0x0001, %r10
	.word 0x8d9024ce  ! 787: WRPR_PSTATE_I	wrpr	%r0, 0x04ce, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8cd2e001  ! 789: UMULcc_I	umulcc 	%r11, 0x0001, %r6
	.word 0x8282e001  ! 790: ADDcc_I	addcc 	%r11, 0x0001, %r1
	.word 0xc247e001  ! 791: LDSW_I	ldsw	[%r31 + 0x0001], %r1
	.word 0x8198238c  ! 792: WRHPR_HPSTATE_I	wrhpr	%r0, 0x038c, %hpstate
	.word 0x83d02033  ! 793: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0xc2c80e60  ! 794: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r1
	.word 0xc2ffc02b  ! 795: SWAPA_R	swapa	%r1, [%r31 + %r11] 0x01
	.word 0x8a006001  ! 796: ADD_I	add 	%r1, 0x0001, %r5
	.word 0xca77c00b  ! 797: STX_R	stx	%r5, [%r31 + %r11]
	.word 0xcad804a0  ! 798: LDXA_R	ldxa	[%r0, %r0] 0x25, %r5
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x90c3a001  ! 800: ADDCcc_I	addccc 	%r14, 0x0001, %r8
	.word 0x93a2c9e6  ! 801: FDIVq	dis not found

	.word 0x81982793  ! 802: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0793, %hpstate
	.word 0xd2d80e40  ! 803: LDXA_R	ldxa	[%r0, %r0] 0x72, %r9
DS_46:
	.word 0x20800001  ! 805: BN	bn,a	<label_0x1>
	.word 0xd1324003  ! 805: STQF_R	-	%f8, [%r3, %r9]
	.word 0x93458000  ! 804: RD_SOFTINT_REG	rd	%softint, %r9
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x88d1400f  ! 806: UMULcc_R	umulcc 	%r5, %r15, %r4
	.word 0xc8800a80  ! 807: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r4
	.word 0x91480000  ! 808: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
	.word 0x83690004  ! 809: SDIVX_R	sdivx	%r4, %r4, %r1
	.word 0x81982652  ! 810: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0652, %hpstate
	.word 0x2e800001  ! 811: BVS	bvs,a	<label_0x1>
	.word 0x93d02033  ! 812: Tcc_I	tne	icc_or_xcc, %r0 + 51
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc2c7e000  ! 814: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r1
	.word 0xc29004a0  ! 815: LDUHA_R	lduha	[%r0, %r0] 0x25, %r1
	.word 0x81982d1e  ! 816: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d1e, %hpstate
	.word 0xc24fe001  ! 817: LDSB_I	ldsb	[%r31 + 0x0001], %r1
	.word 0x9f480000  ! 818: RDHPR_HPSTATE	rdhpr	%hpstate, %r15
	.word 0x8a7a000c  ! 819: SDIV_R	sdiv 	%r8, %r12, %r5
	.word 0xca9fe001  ! 820: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r5
	.word 0x3e700001  ! 821: BPVC	<illegal instruction>
	.word 0x8d802000  ! 822: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81a01a6e  ! 823: FqTOi	fqtoi	
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9fa01a61  ! 825: FqTOi	fqtoi	
DS_47:
	.word 0x34800001  ! 827: BG	bg,a	<label_0x1>
	illtrap
	.word 0x8fb2030b  ! 826: ALLIGNADDRESS	alignaddr	%r8, %r11, %r7
	.word 0x8d802000  ! 827: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982648  ! 828: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0648, %hpstate
	.word 0xcfe7c02b  ! 829: CASA_I	casa	[%r31] 0x 1, %r11, %r7
	.word 0x819824c6  ! 830: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04c6, %hpstate
	.word 0x96c06001  ! 831: ADDCcc_I	addccc 	%r1, 0x0001, %r11
	.word 0x8d802004  ! 832: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x9d514000  ! 833: RDPR_TBA	rdpr	%tba, %r14
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01a65  ! 835: FqTOi	fqtoi	
	.word 0x95494000  ! 836: RDHPR_HTBA	rdhpr	%htba, %r10
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87802004  ! 838: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8d902a98  ! 839: WRPR_PSTATE_I	wrpr	%r0, 0x0a98, %pstate
	.word 0x8d802000  ! 840: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd4d7e000  ! 841: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r10
	.word 0x8da000c6  ! 842: FNEGd	fnegd	%f6, %f6
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x9ba049c7  ! 844: FDIVd	fdivd	%f32, %f38, %f44
	.word 0x887aa001  ! 845: SDIV_I	sdiv 	%r10, 0x0001, %r4
	.word 0x22800001  ! 846: BE	be,a	<label_0x1>
	mov 0x31, %r30
	.word 0x83d0001e  ! 847: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 848: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81982c4f  ! 851: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c4f, %hpstate
	.word 0xc8c80e80  ! 852: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r4
	mov 0x32, %r30
	.word 0x97d0001e  ! 853: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x81982a5c  ! 854: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a5c, %hpstate
	.word 0xc88fe020  ! 855: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r4
	mov 0x34, %r30
	.word 0x97d0001e  ! 856: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	mov 0x30, %r30
	.word 0x9fd0001e  ! 857: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x81982601  ! 858: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0601, %hpstate
	.word 0x8d902a14  ! 859: WRPR_PSTATE_I	wrpr	%r0, 0x0a14, %pstate
	.word 0x8d90209a  ! 860: WRPR_PSTATE_I	wrpr	%r0, 0x009a, %pstate
	.word 0x85d02032  ! 861: Tcc_I	tle	icc_or_xcc, %r0 + 50
	.word 0x81982e96  ! 862: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e96, %hpstate
	.word 0x8d802004  ! 863: WRFPRS_I	wr	%r0, 0x0004, %fprs
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x91a01a60  ! 865: FqTOi	fqtoi	
	.word 0x8ba3c9cb  ! 866: FDIVd	fdivd	%f46, %f42, %f36
	.word 0x93504000  ! 867: RDPR_TNPC	rdpr	%tnpc, %r9
	.word 0x9fa14dc7  ! 868: FdMULq	fdmulq	
	.word 0x83d02032  ! 869: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x91d02030  ! 870: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x9da3c9ee  ! 871: FDIVq	dis not found

	.word 0x8448a001  ! 872: MULX_I	mulx 	%r2, 0x0001, %r2
	.word 0x819826d8  ! 873: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06d8, %hpstate
	ta	T_CHANGE_PRIV	! macro
DS_48:
	.word 0x32800001  ! 876: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x81b24301  ! 875: ALLIGNADDRESS	alignaddr	%r9, %r1, %r0
	.word 0xc0d7e010  ! 876: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r0
	.word 0x8852c00e  ! 877: UMUL_R	umul 	%r11, %r14, %r4
	.word 0x81d02031  ! 878: Tcc_I	tn	icc_or_xcc, %r0 + 49
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x819825c6  ! 880: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05c6, %hpstate
	.word 0x87802088  ! 881: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xc857e001  ! 882: LDSH_I	ldsh	[%r31 + 0x0001], %r4
	.word 0x87802088  ! 883: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x819821d1  ! 884: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01d1, %hpstate
	.word 0xc8d004a0  ! 885: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r4
	.word 0x886a2001  ! 886: UDIVX_I	udivx 	%r8, 0x0001, %r4
	mov 0x35, %r30
	.word 0x83d0001e  ! 887: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x28700001  ! 888: BPLEU	<illegal instruction>
	.word 0x81982112  ! 889: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0112, %hpstate
	.word 0x819823c4  ! 890: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03c4, %hpstate
	.word 0x90d32001  ! 891: UMULcc_I	umulcc 	%r12, 0x0001, %r8
	.word 0x87802089  ! 892: WRASI_I	wr	%r0, 0x0089, %asi
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d902ac2  ! 894: WRPR_PSTATE_I	wrpr	%r0, 0x0ac2, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x81982e53  ! 896: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e53, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x94d1000f  ! 898: UMULcc_R	umulcc 	%r4, %r15, %r10
	.word 0x8d902087  ! 899: WRPR_PSTATE_I	wrpr	%r0, 0x0087, %pstate
	.word 0x81514000  ! 900: RDPR_TBA	rdpr	%tba, %r0
	.word 0xc0c7e020  ! 901: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r0
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x38700001  ! 903: BPGU	<illegal instruction>
	.word 0x8d902e49  ! 904: WRPR_PSTATE_I	wrpr	%r0, 0x0e49, %pstate
	.word 0xc08008a0  ! 905: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	mov 0x33, %r30
	.word 0x9fd0001e  ! 906: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0xc09004a0  ! 907: LDUHA_R	lduha	[%r0, %r0] 0x25, %r0
	.word 0x93494000  ! 908: RDHPR_HTBA	rdhpr	%htba, %r9
	.word 0x91480000  ! 909: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
	.word 0xd0800c00  ! 910: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r8
	.word 0xd047c000  ! 911: LDSW_R	ldsw	[%r31 + %r0], %r8
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9fa01a6e  ! 913: FqTOi	fqtoi	
	.word 0x8ba00d20  ! 914: FsMULd	fsmuld	%f0, %f0, %f36
	.word 0x87802014  ! 915: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x8d902647  ! 916: WRPR_PSTATE_I	wrpr	%r0, 0x0647, %pstate
	.word 0x36700001  ! 917: BPGE	<illegal instruction>
	.word 0x81982b03  ! 918: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b03, %hpstate
	.word 0x32700001  ! 919: BPNE	<illegal instruction>
	.word 0x8d902888  ! 920: WRPR_PSTATE_I	wrpr	%r0, 0x0888, %pstate
	.word 0xca8008a0  ! 921: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0x87802089  ! 922: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8ada400b  ! 923: SMULcc_R	smulcc 	%r9, %r11, %r5
	.word 0x89a309ce  ! 924: FDIVd	fdivd	%f12, %f14, %f4
	.word 0xc88008a0  ! 925: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
DS_49:
	.word 0x34800001  ! 927: BG	bg,a	<label_0x1>
	.word 0xdb336001  ! 927: STQF_I	-	%f13, [0x0001, %r13]
	.word 0x93458000  ! 926: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x8dd02032  ! 927: Tcc_I	tneg	icc_or_xcc, %r0 + 50
	.word 0x87802016  ! 928: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x30700001  ! 929: BPA	<illegal instruction>
	.word 0x87802016  ! 930: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8680e001  ! 931: ADDcc_I	addcc 	%r3, 0x0001, %r3
DS_50:
	.word 0x32800001  ! 933: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x83b24304  ! 932: ALLIGNADDRESS	alignaddr	%r9, %r4, %r1
	.word 0x87802010  ! 933: WRASI_I	wr	%r0, 0x0010, %asi
	ta	T_CHANGE_PRIV	! macro
	.word 0x90c16001  ! 935: ADDCcc_I	addccc 	%r5, 0x0001, %r8
	.word 0x87802080  ! 936: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x81982cce  ! 937: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cce, %hpstate
	.word 0xd08008a0  ! 938: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0x93480000  ! 939: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
	.word 0x81d02030  ! 940: Tcc_I	tn	icc_or_xcc, %r0 + 48
	.word 0x87802004  ! 941: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87802089  ! 942: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8ba01a64  ! 943: FqTOi	fqtoi	
	.word 0x9a688009  ! 944: UDIVX_R	udivx 	%r2, %r9, %r13
	.word 0x8768000b  ! 945: SDIVX_R	sdivx	%r0, %r11, %r3
	.word 0x92dac00e  ! 946: SMULcc_R	smulcc 	%r11, %r14, %r9
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8e49000c  ! 948: MULX_R	mulx 	%r4, %r12, %r7
DS_51:
	.word 0x32800001  ! 950: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x89b00300  ! 949: ALLIGNADDRESS	alignaddr	%r0, %r0, %r4
	.word 0xc88008a0  ! 950: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
	.word 0xc88fe030  ! 951: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r4
	.word 0x8d902e42  ! 952: WRPR_PSTATE_I	wrpr	%r0, 0x0e42, %pstate
	.word 0xc85fc000  ! 953: LDX_R	ldx	[%r31 + %r0], %r4
	.word 0x8680e001  ! 954: ADDcc_I	addcc 	%r3, 0x0001, %r3
	.word 0x89d02031  ! 955: Tcc_I	tleu	icc_or_xcc, %r0 + 49
	mov 0x32, %r30
	.word 0x87d0001e  ! 956: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 957: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9d508000  ! 958: RDPR_TSTATE	rdpr	%tstate, %r14
	.word 0x3a700001  ! 959: BPCC	<illegal instruction>
	.word 0x99a0056c  ! 960: FSQRTq	fsqrt	
	.word 0xd8800a80  ! 961: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r12
	.word 0x8d902a4d  ! 962: WRPR_PSTATE_I	wrpr	%r0, 0x0a4d, %pstate
	.word 0x8d90284d  ! 963: WRPR_PSTATE_I	wrpr	%r0, 0x084d, %pstate
	.word 0x28700001  ! 964: BPLEU	<illegal instruction>
	.word 0x2a700001  ! 965: BPCS	<illegal instruction>
	.word 0x81982b1b  ! 966: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b1b, %hpstate
	.word 0x81982457  ! 967: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0457, %hpstate
	.word 0xd88008a0  ! 968: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	ta	T_CHANGE_PRIV	! macro
	.word 0x964b8003  ! 970: MULX_R	mulx 	%r14, %r3, %r11
	.word 0x8d802000  ! 971: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd6800be0  ! 972: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r11
	.word 0x2e800001  ! 973: BVS	bvs,a	<label_0x1>
	.word 0x81982b85  ! 974: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b85, %hpstate
	.word 0x95500000  ! 975: RDPR_TPC	rdpr	%tpc, %r10
	.word 0x9dd02033  ! 976: Tcc_I	tpos	icc_or_xcc, %r0 + 51
	.word 0xd45fc000  ! 977: LDX_R	ldx	[%r31 + %r0], %r10
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xd48008a0  ! 980: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	mov 0x33, %r30
	.word 0x8dd0001e  ! 981: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x819824cf  ! 982: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04cf, %hpstate
	.word 0xd4cfe000  ! 983: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r10
	.word 0x8dd02032  ! 984: Tcc_I	tneg	icc_or_xcc, %r0 + 50
	.word 0x906a2001  ! 985: UDIVX_I	udivx 	%r8, 0x0001, %r8
	mov 0x34, %r30
	.word 0x97d0001e  ! 986: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x93480000  ! 987: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
DS_52:
	.word 0x32800001  ! 989: BNE	bne,a	<label_0x1>
	.word 0xc1306001  ! 989: STQF_I	-	%f0, [0x0001, %r1]
	.word 0x8b458000  ! 988: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0xca8fe010  ! 989: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r5
	.word 0x87802014  ! 990: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xca9fc020  ! 991: LDDA_R	ldda	[%r31, %r0] 0x01, %r5
	.word 0xcaffc023  ! 992: SWAPA_R	swapa	%r5, [%r31 + %r3] 0x01
	.word 0xca8008a0  ! 993: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0x81982107  ! 994: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0107, %hpstate
	.word 0xcad804a0  ! 995: LDXA_R	ldxa	[%r0, %r0] 0x25, %r5
	.word 0x81982d5d  ! 996: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d5d, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d902ad7  ! 998: WRPR_PSTATE_I	wrpr	%r0, 0x0ad7, %pstate
	mov 0x33, %r30
	.word 0x81d0001e  ! 999: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0xcacfe000  ! 1000: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r5
	mov 0x33, %r30
	.word 0x8bd0001e  ! 1001: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0xcadfe030  ! 1002: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r5
	.word 0x38800001  ! 1003: BGU	bgu,a	<label_0x1>
	.word 0x8d902a5f  ! 1004: WRPR_PSTATE_I	wrpr	%r0, 0x0a5f, %pstate
	.word 0x99a01a64  ! 1005: FqTOi	fqtoi	
	.word 0xd88fe030  ! 1006: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r12
	.word 0x9e83e001  ! 1007: ADDcc_I	addcc 	%r15, 0x0001, %r15
	.word 0x95d02030  ! 1008: Tcc_I	tg	icc_or_xcc, %r0 + 48
	.word 0x8198259f  ! 1009: WRHPR_HPSTATE_I	wrhpr	%r0, 0x059f, %hpstate
	.word 0xde8008a0  ! 1010: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r15
	.word 0x819825d8  ! 1011: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05d8, %hpstate
	.word 0x8d9028d4  ! 1012: WRPR_PSTATE_I	wrpr	%r0, 0x08d4, %pstate
	.word 0x81982615  ! 1013: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0615, %hpstate
	.word 0x81982d92  ! 1014: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d92, %hpstate
	.word 0x82db000b  ! 1015: SMULcc_R	smulcc 	%r12, %r11, %r1
	.word 0xc20fc000  ! 1016: LDUB_R	ldub	[%r31 + %r0], %r1
	mov 0x30, %r30
	.word 0x85d0001e  ! 1017: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x81982f5e  ! 1018: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f5e, %hpstate
	.word 0xc327e001  ! 1019: STF_I	st	%f1, [0x0001, %r31]
	.word 0x8d90245d  ! 1020: WRPR_PSTATE_I	wrpr	%r0, 0x045d, %pstate
	.word 0x81982a93  ! 1021: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a93, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x95494000  ! 1023: RDHPR_HTBA	rdhpr	%htba, %r10
	.word 0x9da00565  ! 1024: FSQRTq	fsqrt	
	.word 0x24700001  ! 1025: BPLE	<illegal instruction>
	.word 0xdcd7e030  ! 1026: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r14
	mov 0x30, %r30
	.word 0x99d0001e  ! 1027: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0xdd37c005  ! 1028: STQF_R	-	%f14, [%r5, %r31]
	.word 0xdc8fe000  ! 1029: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r14
	.word 0xdc8008a0  ! 1030: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r14
	.word 0xdc2fc005  ! 1031: STB_R	stb	%r14, [%r31 + %r5]
	.word 0xdc07c000  ! 1032: LDUW_R	lduw	[%r31 + %r0], %r14
	.word 0x87802014  ! 1033: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x8d902acb  ! 1034: WRPR_PSTATE_I	wrpr	%r0, 0x0acb, %pstate
	.word 0x81982b80  ! 1035: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b80, %hpstate
	.word 0x8d9028c3  ! 1036: WRPR_PSTATE_I	wrpr	%r0, 0x08c3, %pstate
	.word 0xdc900e60  ! 1037: LDUHA_R	lduha	[%r0, %r0] 0x73, %r14
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d802000  ! 1039: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8dd02032  ! 1041: Tcc_I	tneg	icc_or_xcc, %r0 + 50
	.word 0x9fd02034  ! 1042: Tcc_I	tvc	icc_or_xcc, %r0 + 52
	.word 0x81982fc4  ! 1043: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fc4, %hpstate
	.word 0x8198239f  ! 1044: WRHPR_HPSTATE_I	wrhpr	%r0, 0x039f, %hpstate
	.word 0x8a81e001  ! 1045: ADDcc_I	addcc 	%r7, 0x0001, %r5
	.word 0xcad004a0  ! 1046: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r5
	.word 0x85a000c6  ! 1047: FNEGd	fnegd	%f6, %f2
	.word 0xc447c000  ! 1048: LDSW_R	ldsw	[%r31 + %r0], %r2
	.word 0x8079a001  ! 1049: SDIV_I	sdiv 	%r6, 0x0001, %r0
DS_53:
	.word 0x22800001  ! 1051: BE	be,a	<label_0x1>
	.word 0xc5336001  ! 1051: STQF_I	-	%f2, [0x0001, %r13]
	.word 0x99458000  ! 1050: RD_SOFTINT_REG	rd	%softint, %r12
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81508000  ! 1052: RDPR_TSTATE	rdpr	%tstate, %r0
	.word 0x8d902252  ! 1053: WRPR_PSTATE_I	wrpr	%r0, 0x0252, %pstate
	.word 0x81982b11  ! 1054: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b11, %hpstate
	.word 0x86d0800b  ! 1055: UMULcc_R	umulcc 	%r2, %r11, %r3
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8401e001  ! 1057: ADD_I	add 	%r7, 0x0001, %r2
	.word 0x89a209cd  ! 1058: FDIVd	fdivd	%f8, %f44, %f4
	ta	T_CHANGE_PRIV	! macro
	.word 0x3a700001  ! 1060: BPCC	<illegal instruction>
	.word 0x91514000  ! 1061: RDPR_TBA	rdpr	%tba, %r8
	mov 0x32, %r30
	.word 0x85d0001e  ! 1062: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x94dbc005  ! 1063: SMULcc_R	smulcc 	%r15, %r5, %r10
	ta	T_CHANGE_PRIV	! macro
	.word 0x20700001  ! 1065: BPN	<illegal instruction>
	ta	T_CHANGE_TO_TL0	! macro
DS_54:
	.word 0x32800001  ! 1068: BNE	bne,a	<label_0x1>
	.word 0xcb31e001  ! 1068: STQF_I	-	%f5, [0x0001, %r7]
	.word 0x89458000  ! 1067: RD_SOFTINT_REG	rd	%softint, %r4
	mov 0x30, %r30
	.word 0x83d0001e  ! 1068: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xc88008a0  ! 1069: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
	.word 0x819824c7  ! 1070: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04c7, %hpstate
	.word 0x24800001  ! 1071: BLE	ble,a	<label_0x1>
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8e01a001  ! 1073: ADD_I	add 	%r6, 0x0001, %r7
	.word 0xce1fc000  ! 1074: LDD_R	ldd	[%r31 + %r0], %r7
	.word 0x38700001  ! 1075: BPGU	<illegal instruction>
	.word 0x87802016  ! 1076: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x81982d06  ! 1077: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d06, %hpstate
	.word 0x8d902455  ! 1078: WRPR_PSTATE_I	wrpr	%r0, 0x0455, %pstate
	.word 0xcf27e001  ! 1079: STF_I	st	%f7, [0x0001, %r31]
	.word 0x2e800001  ! 1080: BVS	bvs,a	<label_0x1>
	.word 0x20800001  ! 1081: BN	bn,a	<label_0x1>
	mov 0x35, %r30
	.word 0x95d0001e  ! 1082: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0x81982b40  ! 1084: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b40, %hpstate
DS_55:
	.word 0x34800001  ! 1086: BG	bg,a	<label_0x1>
	illtrap
	.word 0x9fb18306  ! 1085: ALLIGNADDRESS	alignaddr	%r6, %r6, %r15
	.word 0xdfe7c026  ! 1086: CASA_I	casa	[%r31] 0x 1, %r6, %r15
	.word 0xdfe7c026  ! 1087: CASA_I	casa	[%r31] 0x 1, %r6, %r15
	.word 0x97d02034  ! 1088: Tcc_I	tge	icc_or_xcc, %r0 + 52
	.word 0x87802004  ! 1089: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x97a349e3  ! 1090: FDIVq	dis not found

	.word 0x8d802004  ! 1091: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd7e7c023  ! 1092: CASA_I	casa	[%r31] 0x 1, %r3, %r11
	.word 0x8d902216  ! 1093: WRPR_PSTATE_I	wrpr	%r0, 0x0216, %pstate
	.word 0x8d802004  ! 1094: WRFPRS_I	wr	%r0, 0x0004, %fprs
DS_56:
	.word 0x32800001  ! 1096: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x8fb0830e  ! 1095: ALLIGNADDRESS	alignaddr	%r2, %r14, %r7
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x3e700001  ! 1097: BPVC	<illegal instruction>
	.word 0x9950c000  ! 1098: RDPR_TT	rdpr	%tt, %r12
	.word 0xd917c000  ! 1099: LDQF_R	-	[%r31, %r0], %f12
	.word 0x81982f41  ! 1100: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f41, %hpstate
	.word 0x81982017  ! 1101: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0017, %hpstate
	.word 0x8d802000  ! 1102: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd897e010  ! 1103: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r12
	.word 0xd8c804a0  ! 1104: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
	.word 0xd8dfe020  ! 1105: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r12
	.word 0x8d902450  ! 1106: WRPR_PSTATE_I	wrpr	%r0, 0x0450, %pstate
	.word 0x9c51c003  ! 1107: UMUL_R	umul 	%r7, %r3, %r14
	.word 0xdcdfe030  ! 1108: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r14
	mov 0x30, %r30
	.word 0x81d0001e  ! 1109: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0x9402a001  ! 1111: ADD_I	add 	%r10, 0x0001, %r10
	mov 0x35, %r30
	.word 0x8bd0001e  ! 1112: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0xd4bfc023  ! 1113: STDA_R	stda	%r10, [%r31 + %r3] 0x01
	.word 0x8198275e  ! 1114: WRHPR_HPSTATE_I	wrhpr	%r0, 0x075e, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x9a7a4000  ! 1116: SDIV_R	sdiv 	%r9, %r0, %r13
	.word 0x81982440  ! 1117: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0440, %hpstate
	.word 0x89a189aa  ! 1118: FDIVs	fdivs	%f6, %f10, %f4
	.word 0x9278c006  ! 1119: SDIV_R	sdiv 	%r3, %r6, %r9
	.word 0x81982f95  ! 1120: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f95, %hpstate
	mov 0x30, %r30
	.word 0x91d0001e  ! 1121: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93684008  ! 1122: SDIVX_R	sdivx	%r1, %r8, %r9
	.word 0x819827d8  ! 1123: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07d8, %hpstate
	.word 0x81982f55  ! 1124: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f55, %hpstate
	.word 0x81982216  ! 1125: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0216, %hpstate
	.word 0x81982290  ! 1126: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0290, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x819828de  ! 1128: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08de, %hpstate
	.word 0x8d902c4b  ! 1129: WRPR_PSTATE_I	wrpr	%r0, 0x0c4b, %pstate
	.word 0x81a14dcc  ! 1130: FdMULq	fdmulq	
	.word 0xc08008a0  ! 1131: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0x83508000  ! 1132: RDPR_TSTATE	rdpr	%tstate, %r1
	.word 0x819823cb  ! 1133: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03cb, %hpstate
DS_57:
	.word 0x22800001  ! 1135: BE	be,a	<label_0x1>
	illtrap
	.word 0x9bb20309  ! 1134: ALLIGNADDRESS	alignaddr	%r8, %r9, %r13
	.word 0x819820df  ! 1135: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00df, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x2e800001  ! 1139: BVS	bvs,a	<label_0x1>
	.word 0xda5fc000  ! 1140: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xdad004a0  ! 1141: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r13
	.word 0x8d902650  ! 1142: WRPR_PSTATE_I	wrpr	%r0, 0x0650, %pstate
	.word 0x87802088  ! 1143: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x94d1a001  ! 1144: UMULcc_I	umulcc 	%r6, 0x0001, %r10
	.word 0x906b800e  ! 1145: UDIVX_R	udivx 	%r14, %r14, %r8
	.word 0x8ed10007  ! 1146: UMULcc_R	umulcc 	%r4, %r7, %r7
	.word 0x8d90245f  ! 1147: WRPR_PSTATE_I	wrpr	%r0, 0x045f, %pstate
	.word 0x30700001  ! 1148: BPA	<illegal instruction>
	.word 0x81982644  ! 1149: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0644, %hpstate
	mov 0x33, %r30
	.word 0x9bd0001e  ! 1150: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0xce8fe020  ! 1151: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r7
	.word 0x80dbc00f  ! 1152: SMULcc_R	smulcc 	%r15, %r15, %r0
	.word 0x99a000c0  ! 1153: FNEGd	fnegd	%f0, %f12
	.word 0xd8cfe010  ! 1154: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r12
	.word 0xd83fe001  ! 1155: STD_I	std	%r12, [%r31 + 0x0001]
	.word 0xd8ffc020  ! 1156: SWAPA_R	swapa	%r12, [%r31 + %r0] 0x01
	.word 0x8d902e11  ! 1157: WRPR_PSTATE_I	wrpr	%r0, 0x0e11, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a000c1  ! 1159: FNEGd	fnegd	%f32, %f8
	mov 0x35, %r30
	.word 0x99d0001e  ! 1160: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0xd0800ba0  ! 1161: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r8
	.word 0x87802088  ! 1162: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x81982e94  ! 1163: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e94, %hpstate
	.word 0xd08008a0  ! 1164: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0xd09fc020  ! 1165: LDDA_R	ldda	[%r31, %r0] 0x01, %r8
	.word 0x8d902614  ! 1166: WRPR_PSTATE_I	wrpr	%r0, 0x0614, %pstate
	.word 0x8d902402  ! 1167: WRPR_PSTATE_I	wrpr	%r0, 0x0402, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d90269f  ! 1169: WRPR_PSTATE_I	wrpr	%r0, 0x069f, %pstate
	.word 0x8d902200  ! 1170: WRPR_PSTATE_I	wrpr	%r0, 0x0200, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87802014  ! 1172: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x2e700001  ! 1173: BPVS	<illegal instruction>
	.word 0x8d90209a  ! 1174: WRPR_PSTATE_I	wrpr	%r0, 0x009a, %pstate
	.word 0x87802089  ! 1175: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xd037c001  ! 1176: STH_R	sth	%r8, [%r31 + %r1]
	mov 0x33, %r30
	.word 0x89d0001e  ! 1177: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x8a498005  ! 1178: MULX_R	mulx 	%r6, %r5, %r5
	.word 0x819820df  ! 1179: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00df, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0xca27c005  ! 1181: STW_R	stw	%r5, [%r31 + %r5]
	.word 0xcac804a0  ! 1182: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r5
	.word 0x8c692001  ! 1183: UDIVX_I	udivx 	%r4, 0x0001, %r6
DS_58:
	.word 0x22800001  ! 1185: BE	be,a	<label_0x1>
	illtrap
	.word 0x93b2830f  ! 1184: ALLIGNADDRESS	alignaddr	%r10, %r15, %r9
	.word 0x28700001  ! 1185: BPLEU	<illegal instruction>
	ta	T_CHANGE_PRIV	! macro
	.word 0x87802004  ! 1187: WRASI_I	wr	%r0, 0x0004, %asi
	mov 0x30, %r30
	.word 0x9dd0001e  ! 1188: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
DS_59:
	.word 0x32800001  ! 1190: BNE	bne,a	<label_0x1>
	.word 0xcf338002  ! 1190: STQF_R	-	%f7, [%r2, %r14]
	.word 0x97458000  ! 1189: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0x20800001  ! 1190: BN	bn,a	<label_0x1>
	.word 0x83d02032  ! 1191: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0xd647c000  ! 1192: LDSW_R	ldsw	[%r31 + %r0], %r11
	ta	T_CHANGE_PRIV	! macro
	.word 0x99a0c9e9  ! 1194: FDIVq	dis not found

	.word 0x9e79a001  ! 1195: SDIV_I	sdiv 	%r6, 0x0001, %r15
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8198235b  ! 1197: WRHPR_HPSTATE_I	wrhpr	%r0, 0x035b, %hpstate
	.word 0x8d9028c0  ! 1198: WRPR_PSTATE_I	wrpr	%r0, 0x08c0, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x85a30d29  ! 1200: FsMULd	fsmuld	%f12, %f40, %f2
	.word 0x9f50c000  ! 1201: RDPR_TT	rdpr	%tt, %r15
	.word 0x90d0c002  ! 1202: UMULcc_R	umulcc 	%r3, %r2, %r8
	.word 0xd00fc000  ! 1203: LDUB_R	ldub	[%r31 + %r0], %r8
	.word 0x8d902a0c  ! 1204: WRPR_PSTATE_I	wrpr	%r0, 0x0a0c, %pstate
	.word 0x819824ce  ! 1205: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04ce, %hpstate
	.word 0x9c6ba001  ! 1206: UDIVX_I	udivx 	%r14, 0x0001, %r14
	.word 0x99514000  ! 1207: RDPR_TBA	rdpr	%tba, %r12
DS_60:
	.word 0x32800001  ! 1209: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x97b08302  ! 1208: ALLIGNADDRESS	alignaddr	%r2, %r2, %r11
	.word 0x8d902414  ! 1209: WRPR_PSTATE_I	wrpr	%r0, 0x0414, %pstate
	.word 0x81982609  ! 1210: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0609, %hpstate
	.word 0x8d902a57  ! 1211: WRPR_PSTATE_I	wrpr	%r0, 0x0a57, %pstate
	.word 0xd6d7e000  ! 1212: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r11
	.word 0xd647c000  ! 1213: LDSW_R	ldsw	[%r31 + %r0], %r11
	ta	T_CHANGE_NONPRIV	! macro
DS_61:
	.word 0x22800001  ! 1216: BE	be,a	<label_0x1>
	.word 0xcf33c00e  ! 1216: STQF_R	-	%f7, [%r14, %r15]
	.word 0x9f458000  ! 1215: RD_SOFTINT_REG	rd	%softint, %r15
	ta	T_CHANGE_NONPRIV	! macro
	mov 0x34, %r30
	.word 0x9dd0001e  ! 1217: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x8d90281e  ! 1218: WRPR_PSTATE_I	wrpr	%r0, 0x081e, %pstate
	.word 0x806ac004  ! 1219: UDIVX_R	udivx 	%r11, %r4, %r0
	.word 0xc08fe020  ! 1220: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r0
	mov 0x32, %r30
	.word 0x89d0001e  ! 1221: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x87d02031  ! 1222: Tcc_I	tl	icc_or_xcc, %r0 + 49
	.word 0xc08008a0  ! 1223: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	mov 0x33, %r30
	.word 0x8dd0001e  ! 1224: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
DS_62:
	.word 0x22800001  ! 1226: BE	be,a	<label_0x1>
	illtrap
	.word 0x9bb34300  ! 1225: ALLIGNADDRESS	alignaddr	%r13, %r0, %r13
	.word 0x8d802004  ! 1226: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x83d02035  ! 1227: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0xdac00e80  ! 1228: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r13
	.word 0x88538002  ! 1229: UMUL_R	umul 	%r14, %r2, %r4
	.word 0x34700001  ! 1230: BPG	<illegal instruction>
	.word 0x8bd02030  ! 1231: Tcc_I	tcs	icc_or_xcc, %r0 + 48
	.word 0x97d02030  ! 1232: Tcc_I	tge	icc_or_xcc, %r0 + 48
	.word 0xc88008a0  ! 1233: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
	.word 0x8d802000  ! 1234: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91504000  ! 1235: RDPR_TNPC	rdpr	%tnpc, %r8
	.word 0x8fa00565  ! 1236: FSQRTq	fsqrt	
DS_63:
	.word 0x22800001  ! 1238: BE	be,a	<label_0x1>
	.word 0xc133e001  ! 1238: STQF_I	-	%f0, [0x0001, %r15]
	.word 0x8d458000  ! 1237: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0xcd3fe001  ! 1238: STDF_I	std	%f6, [0x0001, %r31]
	.word 0x8d902c8a  ! 1239: WRPR_PSTATE_I	wrpr	%r0, 0x0c8a, %pstate
	.word 0x867a6001  ! 1240: SDIV_I	sdiv 	%r9, 0x0001, %r3
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x94500001  ! 1242: UMUL_R	umul 	%r0, %r1, %r10
	.word 0x8d902c13  ! 1243: WRPR_PSTATE_I	wrpr	%r0, 0x0c13, %pstate
	.word 0x9da01a66  ! 1244: FqTOi	fqtoi	
	.word 0xdcdfe030  ! 1245: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r14
	.word 0xdc97e010  ! 1246: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r14
	.word 0x81982a44  ! 1247: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a44, %hpstate
	.word 0xdcd004a0  ! 1248: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r14
DS_64:
	.word 0x22800001  ! 1250: BE	be,a	<label_0x1>
	.word 0xc9332001  ! 1250: STQF_I	-	%f4, [0x0001, %r12]
	.word 0x9d458000  ! 1249: RD_SOFTINT_REG	rd	%softint, %r14
	.word 0x93a28dc9  ! 1250: FdMULq	fdmulq	
	.word 0x8d902697  ! 1251: WRPR_PSTATE_I	wrpr	%r0, 0x0697, %pstate
	.word 0x9ad36001  ! 1252: UMULcc_I	umulcc 	%r13, 0x0001, %r13
DS_65:
	.word 0x34800001  ! 1254: BG	bg,a	<label_0x1>
	.word 0xd733a001  ! 1254: STQF_I	-	%f11, [0x0001, %r14]
	.word 0x9d458000  ! 1253: RD_SOFTINT_REG	rd	%softint, %r14
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xdccfe020  ! 1255: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r14
	.word 0x8d802000  ! 1256: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d902adb  ! 1257: WRPR_PSTATE_I	wrpr	%r0, 0x0adb, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902418  ! 1259: WRPR_PSTATE_I	wrpr	%r0, 0x0418, %pstate
	.word 0xdcc7e030  ! 1260: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r14
	.word 0x8d902ec6  ! 1261: WRPR_PSTATE_I	wrpr	%r0, 0x0ec6, %pstate
	.word 0x8d802000  ! 1262: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_66:
	.word 0x20800001  ! 1264: BN	bn,a	<label_0x1>
	.word 0xcf31a001  ! 1264: STQF_I	-	%f7, [0x0001, %r6]
	.word 0x97458000  ! 1263: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0x81982c58  ! 1264: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c58, %hpstate
	.word 0x81982490  ! 1265: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0490, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x8da01a60  ! 1267: FqTOi	fqtoi	
	.word 0xcc800ba0  ! 1268: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r6
	mov 0x30, %r30
	.word 0x99d0001e  ! 1269: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0xcc9fe001  ! 1270: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r6
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x20700001  ! 1272: BPN	<illegal instruction>
	mov 0x31, %r30
	.word 0x9fd0001e  ! 1273: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x38800001  ! 1274: BGU	bgu,a	<label_0x1>
	.word 0x81982411  ! 1275: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0411, %hpstate
	.word 0x81982a84  ! 1276: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a84, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d902082  ! 1278: WRPR_PSTATE_I	wrpr	%r0, 0x0082, %pstate
	.word 0x8d802000  ! 1279: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9f68800c  ! 1281: SDIVX_R	sdivx	%r2, %r12, %r15
	.word 0x8250c008  ! 1282: UMUL_R	umul 	%r3, %r8, %r1
	.word 0x8d902049  ! 1283: WRPR_PSTATE_I	wrpr	%r0, 0x0049, %pstate
	.word 0x81982c45  ! 1284: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c45, %hpstate
	.word 0x8d902491  ! 1285: WRPR_PSTATE_I	wrpr	%r0, 0x0491, %pstate
	mov 0x31, %r30
	.word 0x81d0001e  ! 1286: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x87802010  ! 1288: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xc297e000  ! 1289: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r1
	.word 0x8d802000  ! 1290: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x81982f4c  ! 1292: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f4c, %hpstate
	.word 0xc2900e60  ! 1293: LDUHA_R	lduha	[%r0, %r0] 0x73, %r1
	.word 0x9a498000  ! 1294: MULX_R	mulx 	%r6, %r0, %r13
	.word 0x97500000  ! 1295: RDPR_TPC	rdpr	%tpc, %r11
	.word 0x8d90245d  ! 1296: WRPR_PSTATE_I	wrpr	%r0, 0x045d, %pstate
	.word 0x34700001  ! 1297: BPG	<illegal instruction>
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81982c86  ! 1299: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c86, %hpstate
	.word 0xd737c000  ! 1300: STQF_R	-	%f11, [%r0, %r31]
	.word 0x9653c000  ! 1301: UMUL_R	umul 	%r15, %r0, %r11
	.word 0xd727e001  ! 1302: STF_I	st	%f11, [0x0001, %r31]
	.word 0x8d902e0b  ! 1303: WRPR_PSTATE_I	wrpr	%r0, 0x0e0b, %pstate
	.word 0x8da109a7  ! 1304: FDIVs	fdivs	%f4, %f7, %f6
	.word 0x95d02031  ! 1305: Tcc_I	tg	icc_or_xcc, %r0 + 49
	.word 0x87802004  ! 1306: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xcc9fc020  ! 1307: LDDA_R	ldda	[%r31, %r0] 0x01, %r6
	.word 0x8d902a00  ! 1308: WRPR_PSTATE_I	wrpr	%r0, 0x0a00, %pstate
	.word 0x91a0054a  ! 1309: FSQRTd	fsqrt	
	.word 0x8d90201c  ! 1310: WRPR_PSTATE_I	wrpr	%r0, 0x001c, %pstate
	.word 0x81982204  ! 1311: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0204, %hpstate
	.word 0xd07fe001  ! 1312: SWAP_I	swap	%r8, [%r31 + 0x0001]
	.word 0x81982e5a  ! 1313: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e5a, %hpstate
	.word 0xd047e001  ! 1314: LDSW_I	ldsw	[%r31 + 0x0001], %r8
	.word 0x9b50c000  ! 1315: RDPR_TT	rdpr	%tt, %r13
	.word 0x87802088  ! 1316: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8d90265e  ! 1317: WRPR_PSTATE_I	wrpr	%r0, 0x065e, %pstate
	.word 0xda0fc000  ! 1318: LDUB_R	ldub	[%r31 + %r0], %r13
	.word 0xdaffc02a  ! 1319: SWAPA_R	swapa	%r13, [%r31 + %r10] 0x01
	.word 0x8d802000  ! 1320: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xda97e010  ! 1321: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r13
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x83696001  ! 1323: SDIVX_I	sdivx	%r5, 0x0001, %r1
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_TO_TL0	! macro
	mov 0x33, %r30
	.word 0x95d0001e  ! 1326: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x8e6a000f  ! 1327: UDIVX_R	udivx 	%r8, %r15, %r7
	.word 0xce9004a0  ! 1328: LDUHA_R	lduha	[%r0, %r0] 0x25, %r7
	.word 0xce27c00f  ! 1329: STW_R	stw	%r7, [%r31 + %r15]
	.word 0x8d902cc5  ! 1330: WRPR_PSTATE_I	wrpr	%r0, 0x0cc5, %pstate
	.word 0x81982259  ! 1331: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0259, %hpstate
	.word 0xce800a60  ! 1332: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r7
	.word 0x8d90201c  ! 1333: WRPR_PSTATE_I	wrpr	%r0, 0x001c, %pstate
DS_67:
	.word 0x32800001  ! 1335: BNE	bne,a	<label_0x1>
	.word 0xd730c003  ! 1335: STQF_R	-	%f11, [%r3, %r3]
	.word 0x93458000  ! 1334: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x92d34000  ! 1335: UMULcc_R	umulcc 	%r13, %r0, %r9
	.word 0x8d902c9a  ! 1336: WRPR_PSTATE_I	wrpr	%r0, 0x0c9a, %pstate
	.word 0x87802010  ! 1337: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x9da30dc3  ! 1338: FdMULq	fdmulq	
	.word 0x83d02034  ! 1339: Tcc_I	te	icc_or_xcc, %r0 + 52
	ta	T_CHANGE_PRIV	! macro
	.word 0x9f504000  ! 1341: RDPR_TNPC	rdpr	%tnpc, %r15
	.word 0x34800001  ! 1342: BG	bg,a	<label_0x1>
	ta	T_CHANGE_PRIV	! macro
	.word 0x32800001  ! 1344: BNE	bne,a	<label_0x1>
	.word 0xde1fe001  ! 1345: LDD_I	ldd	[%r31 + 0x0001], %r15
DS_68:
	.word 0x20800001  ! 1347: BN	bn,a	<label_0x1>
	illtrap
	.word 0x9db14307  ! 1346: ALLIGNADDRESS	alignaddr	%r5, %r7, %r14
	.word 0x91d02033  ! 1347: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x87802080  ! 1348: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x8bd02034  ! 1349: Tcc_I	tcs	icc_or_xcc, %r0 + 52
	.word 0x81982a41  ! 1350: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a41, %hpstate
	.word 0x8d902c91  ! 1351: WRPR_PSTATE_I	wrpr	%r0, 0x0c91, %pstate
	.word 0x87802004  ! 1352: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x9e51c004  ! 1353: UMUL_R	umul 	%r7, %r4, %r15
	.word 0x2e700001  ! 1354: BPVS	<illegal instruction>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d902e46  ! 1356: WRPR_PSTATE_I	wrpr	%r0, 0x0e46, %pstate
	.word 0x8a016001  ! 1357: ADD_I	add 	%r5, 0x0001, %r5
	.word 0x8198225b  ! 1358: WRHPR_HPSTATE_I	wrhpr	%r0, 0x025b, %hpstate
	.word 0x3a800001  ! 1359: BCC	bcc,a	<label_0x1>
	.word 0xca7fe001  ! 1360: SWAP_I	swap	%r5, [%r31 + 0x0001]
	mov 0x34, %r30
	.word 0x81d0001e  ! 1361: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x8d902e48  ! 1362: WRPR_PSTATE_I	wrpr	%r0, 0x0e48, %pstate
	.word 0x8d802000  ! 1363: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d90221f  ! 1364: WRPR_PSTATE_I	wrpr	%r0, 0x021f, %pstate
	.word 0x8d902603  ! 1365: WRPR_PSTATE_I	wrpr	%r0, 0x0603, %pstate
	.word 0x81982983  ! 1366: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0983, %hpstate
	.word 0x87802080  ! 1367: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x93d02034  ! 1368: Tcc_I	tne	icc_or_xcc, %r0 + 52
	mov 0x34, %r30
	.word 0x9fd0001e  ! 1369: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	mov 0x30, %r30
	.word 0x81d0001e  ! 1370: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x81982bd9  ! 1371: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bd9, %hpstate
	.word 0x80d22001  ! 1372: UMULcc_I	umulcc 	%r8, 0x0001, %r0
	.word 0x926a0005  ! 1373: UDIVX_R	udivx 	%r8, %r5, %r9
	.word 0x987a400c  ! 1374: SDIV_R	sdiv 	%r9, %r12, %r12
DS_69:
	.word 0x34800001  ! 1376: BG	bg,a	<label_0x1>
	illtrap
	.word 0x99b38309  ! 1375: ALLIGNADDRESS	alignaddr	%r14, %r9, %r12
	.word 0x8bd02031  ! 1376: Tcc_I	tcs	icc_or_xcc, %r0 + 49
	.word 0x97494000  ! 1377: RDHPR_HTBA	rdhpr	%htba, %r11
	.word 0xd61fe001  ! 1378: LDD_I	ldd	[%r31 + 0x0001], %r11
	mov 0x34, %r30
	.word 0x8dd0001e  ! 1379: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0xd68008a0  ! 1380: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0xd607e001  ! 1381: LDUW_I	lduw	[%r31 + 0x0001], %r11
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd68008a0  ! 1383: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x8d802000  ! 1384: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d802000  ! 1385: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd7e7c029  ! 1386: CASA_I	casa	[%r31] 0x 1, %r9, %r11
	.word 0x8848400c  ! 1387: MULX_R	mulx 	%r1, %r12, %r4
	.word 0x81982947  ! 1388: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0947, %hpstate
	.word 0x95d02032  ! 1389: Tcc_I	tg	icc_or_xcc, %r0 + 50
DS_70:
	.word 0x20800001  ! 1391: BN	bn,a	<label_0x1>
	illtrap
	.word 0x91b14301  ! 1390: ALLIGNADDRESS	alignaddr	%r5, %r1, %r8
DS_71:
	.word 0x22800001  ! 1392: BE	be,a	<label_0x1>
	.word 0xdb322001  ! 1392: STQF_I	-	%f13, [0x0001, %r8]
	.word 0x93458000  ! 1391: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x88796001  ! 1392: SDIV_I	sdiv 	%r5, 0x0001, %r4
	.word 0x8d9026d2  ! 1393: WRPR_PSTATE_I	wrpr	%r0, 0x06d2, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc8c80e80  ! 1395: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r4
	.word 0x20800001  ! 1396: BN	bn,a	<label_0x1>
	.word 0xc877c001  ! 1397: STX_R	stx	%r4, [%r31 + %r1]
DS_72:
	.word 0x34800001  ! 1399: BG	bg,a	<label_0x1>
	.word 0xc7336001  ! 1399: STQF_I	-	%f3, [0x0001, %r13]
	.word 0x9f458000  ! 1398: RD_SOFTINT_REG	rd	%softint, %r15
	.word 0x8d902414  ! 1399: WRPR_PSTATE_I	wrpr	%r0, 0x0414, %pstate
	.word 0x8198270e  ! 1400: WRHPR_HPSTATE_I	wrhpr	%r0, 0x070e, %hpstate
	.word 0xdec004a0  ! 1401: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r15
	.word 0x87802088  ! 1402: WRASI_I	wr	%r0, 0x0088, %asi
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9c02e001  ! 1404: ADD_I	add 	%r11, 0x0001, %r14
	.word 0x8d902e45  ! 1405: WRPR_PSTATE_I	wrpr	%r0, 0x0e45, %pstate
	.word 0x8198258d  ! 1406: WRHPR_HPSTATE_I	wrhpr	%r0, 0x058d, %hpstate
	.word 0x8d9024c2  ! 1407: WRPR_PSTATE_I	wrpr	%r0, 0x04c2, %pstate
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x96696001  ! 1410: UDIVX_I	udivx 	%r5, 0x0001, %r11
	.word 0x87802088  ! 1411: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8d902644  ! 1412: WRPR_PSTATE_I	wrpr	%r0, 0x0644, %pstate
	.word 0x82d2c002  ! 1413: UMULcc_R	umulcc 	%r11, %r2, %r1
	.word 0x819829d4  ! 1414: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d4, %hpstate
	.word 0x844a2001  ! 1415: MULX_I	mulx 	%r8, 0x0001, %r2
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d902c02  ! 1417: WRPR_PSTATE_I	wrpr	%r0, 0x0c02, %pstate
	.word 0x8d90269e  ! 1418: WRPR_PSTATE_I	wrpr	%r0, 0x069e, %pstate
	.word 0xc48008a0  ! 1419: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x8d802000  ! 1420: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87802089  ! 1421: WRASI_I	wr	%r0, 0x0089, %asi
	mov 0x32, %r30
	.word 0x89d0001e  ! 1422: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0xc447e001  ! 1423: LDSW_I	ldsw	[%r31 + 0x0001], %r2
	.word 0x8568000f  ! 1424: SDIVX_R	sdivx	%r0, %r15, %r2
	.word 0x81982e47  ! 1425: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e47, %hpstate
	.word 0x84534006  ! 1426: UMUL_R	umul 	%r13, %r6, %r2
	.word 0x94c0a001  ! 1427: ADDCcc_I	addccc 	%r2, 0x0001, %r10
	mov 0x31, %r30
	.word 0x8dd0001e  ! 1428: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x87a00540  ! 1429: FSQRTd	fsqrt	
	.word 0x94782001  ! 1430: SDIV_I	sdiv 	%r0, 0x0001, %r10
	.word 0x9a79c003  ! 1431: SDIV_R	sdiv 	%r7, %r3, %r13
	.word 0xdb27c003  ! 1432: STF_R	st	%f13, [%r3, %r31]
	.word 0x8d9028ca  ! 1433: WRPR_PSTATE_I	wrpr	%r0, 0x08ca, %pstate
	.word 0x8d802004  ! 1434: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8e6b000b  ! 1435: UDIVX_R	udivx 	%r12, %r11, %r7
	.word 0x81982499  ! 1436: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0499, %hpstate
	mov 0x35, %r30
	.word 0x87d0001e  ! 1437: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0xce7fe001  ! 1438: SWAP_I	swap	%r7, [%r31 + 0x0001]
	.word 0x80d12001  ! 1439: UMULcc_I	umulcc 	%r4, 0x0001, %r0
	.word 0x96d36001  ! 1440: UMULcc_I	umulcc 	%r13, 0x0001, %r11
	.word 0x819829d4  ! 1441: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d4, %hpstate
	.word 0x8ec1a001  ! 1442: ADDCcc_I	addccc 	%r6, 0x0001, %r7
	.word 0xcfe7c02b  ! 1443: CASA_I	casa	[%r31] 0x 1, %r11, %r7
	.word 0x8d802000  ! 1444: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d902854  ! 1445: WRPR_PSTATE_I	wrpr	%r0, 0x0854, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x34700001  ! 1447: BPG	<illegal instruction>
	.word 0x8d902007  ! 1448: WRPR_PSTATE_I	wrpr	%r0, 0x0007, %pstate
	mov 0x33, %r30
	.word 0x83d0001e  ! 1449: Tcc_R	te	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0x85684002  ! 1451: SDIVX_R	sdivx	%r1, %r2, %r2
	mov 0x33, %r30
	.word 0x8dd0001e  ! 1452: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x81982116  ! 1453: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0116, %hpstate
	.word 0xc497e010  ! 1454: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r2
	.word 0x8d9026c0  ! 1455: WRPR_PSTATE_I	wrpr	%r0, 0x06c0, %pstate
	.word 0x93d02033  ! 1456: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0xc527c002  ! 1457: STF_R	st	%f2, [%r2, %r31]
	.word 0x9f480000  ! 1458: RDHPR_HPSTATE	rdhpr	%hpstate, %r15
	.word 0x87494000  ! 1459: RDHPR_HTBA	rdhpr	%htba, %r3
	mov 0x30, %r30
	.word 0x91d0001e  ! 1460: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	mov 0x30, %r30
	.word 0x91d0001e  ! 1461: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_73:
	.word 0x34800001  ! 1463: BG	bg,a	<label_0x1>
	illtrap
	.word 0x89b2c301  ! 1462: ALLIGNADDRESS	alignaddr	%r11, %r1, %r4
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8198298c  ! 1464: WRHPR_HPSTATE_I	wrhpr	%r0, 0x098c, %hpstate
	.word 0x8d902e5b  ! 1465: WRPR_PSTATE_I	wrpr	%r0, 0x0e5b, %pstate
	.word 0x9dd02034  ! 1466: Tcc_I	tpos	icc_or_xcc, %r0 + 52
	mov 0x31, %r30
	.word 0x81d0001e  ! 1467: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x81982a8e  ! 1468: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a8e, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x87802089  ! 1471: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x9950c000  ! 1472: RDPR_TT	rdpr	%tt, %r12
DS_74:
	.word 0x32800001  ! 1474: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x89b2830f  ! 1473: ALLIGNADDRESS	alignaddr	%r10, %r15, %r4
	.word 0xc8c7e030  ! 1474: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r4
	.word 0x9950c000  ! 1475: RDPR_TT	rdpr	%tt, %r12
	.word 0x847be001  ! 1476: SDIV_I	sdiv 	%r15, 0x0001, %r2
	.word 0x2a700001  ! 1477: BPCS	<illegal instruction>
	.word 0x8cd0a001  ! 1478: UMULcc_I	umulcc 	%r2, 0x0001, %r6
	mov 0x34, %r30
	.word 0x8dd0001e  ! 1479: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8003a001  ! 1481: ADD_I	add 	%r14, 0x0001, %r0
	mov 0x30, %r30
	.word 0x9dd0001e  ! 1482: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0xc0ffc02f  ! 1483: SWAPA_R	swapa	%r0, [%r31 + %r15] 0x01
	.word 0x8da3cdc5  ! 1484: FdMULq	fdmulq	
	.word 0xcc8008a0  ! 1485: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0xcc7fe001  ! 1486: SWAP_I	swap	%r6, [%r31 + 0x0001]
	mov 0x34, %r30
	.word 0x95d0001e  ! 1487: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x95a109af  ! 1488: FDIVs	fdivs	%f4, %f15, %f10
	.word 0x8850c001  ! 1489: UMUL_R	umul 	%r3, %r1, %r4
	.word 0x3a800001  ! 1490: BCC	bcc,a	<label_0x1>
	.word 0x81982edf  ! 1491: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0edf, %hpstate
	.word 0x9b508000  ! 1492: RDPR_TSTATE	rdpr	%tstate, %r13
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d9024ce  ! 1494: WRPR_PSTATE_I	wrpr	%r0, 0x04ce, %pstate
	.word 0x92d3e001  ! 1495: UMULcc_I	umulcc 	%r15, 0x0001, %r9
	.word 0x81a000c7  ! 1496: FNEGd	fnegd	%f38, %f0
	.word 0x81982e98  ! 1497: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e98, %hpstate
	.word 0x9fd02033  ! 1498: Tcc_I	tvc	icc_or_xcc, %r0 + 51
	mov 0x33, %r30
	.word 0x81d0001e  ! 1499: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x8d902a11  ! 1500: WRPR_PSTATE_I	wrpr	%r0, 0x0a11, %pstate
	.word 0x8d902c86  ! 1501: WRPR_PSTATE_I	wrpr	%r0, 0x0c86, %pstate
	.word 0x2e800001  ! 1502: BVS	bvs,a	<label_0x1>
	.word 0x8198270b  ! 1503: WRHPR_HPSTATE_I	wrhpr	%r0, 0x070b, %hpstate
	.word 0x9c01a001  ! 1504: ADD_I	add 	%r6, 0x0001, %r14
	.word 0xdde7c027  ! 1505: CASA_I	casa	[%r31] 0x 1, %r7, %r14
	ta	T_CHANGE_PRIV	! macro
	.word 0x81982986  ! 1507: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0986, %hpstate
	mov 0x33, %r30
	.word 0x81d0001e  ! 1508: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x81982a0a  ! 1509: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a0a, %hpstate
	.word 0x8d902651  ! 1510: WRPR_PSTATE_I	wrpr	%r0, 0x0651, %pstate
	.word 0x89a309ce  ! 1511: FDIVd	fdivd	%f12, %f14, %f4
	.word 0x81a2c9a4  ! 1512: FDIVs	fdivs	%f11, %f4, %f0
DS_75:
	.word 0x32800001  ! 1514: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x89b34306  ! 1513: ALLIGNADDRESS	alignaddr	%r13, %r6, %r4
	.word 0x8b6a8007  ! 1514: SDIVX_R	sdivx	%r10, %r7, %r5
	.word 0x9fa089ea  ! 1515: FDIVq	dis not found

	.word 0x87802010  ! 1516: WRASI_I	wr	%r0, 0x0010, %asi
DS_76:
	.word 0x32800001  ! 1518: BNE	bne,a	<label_0x1>
	.word 0xdd320005  ! 1518: STQF_R	-	%f14, [%r5, %r8]
	.word 0x9d458000  ! 1517: RD_SOFTINT_REG	rd	%softint, %r14
	.word 0x22800001  ! 1518: BE	be,a	<label_0x1>
	mov 0x35, %r30
	.word 0x9bd0001e  ! 1519: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0xdc4fe001  ! 1521: LDSB_I	ldsb	[%r31 + 0x0001], %r14
	.word 0x87d02034  ! 1522: Tcc_I	tl	icc_or_xcc, %r0 + 52
	.word 0xdc8008a0  ! 1523: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r14
	.word 0x81982299  ! 1524: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0299, %hpstate
	.word 0x87d02031  ! 1525: Tcc_I	tl	icc_or_xcc, %r0 + 49
	.word 0x819824ca  ! 1526: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04ca, %hpstate
	.word 0x819820c5  ! 1527: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00c5, %hpstate
	.word 0xdc77e001  ! 1528: STX_I	stx	%r14, [%r31 + 0x0001]
	.word 0x8d802004  ! 1529: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x36700001  ! 1530: BPGE	<illegal instruction>
	.word 0xdd27e001  ! 1531: STF_I	st	%f14, [0x0001, %r31]
	.word 0x85d02035  ! 1532: Tcc_I	tle	icc_or_xcc, %r0 + 53
	.word 0x8d902610  ! 1533: WRPR_PSTATE_I	wrpr	%r0, 0x0610, %pstate
	.word 0xdd27e001  ! 1534: STF_I	st	%f14, [0x0001, %r31]
	.word 0xdcffc025  ! 1535: SWAPA_R	swapa	%r14, [%r31 + %r5] 0x01
	.word 0xdcc804a0  ! 1536: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r14
	.word 0xdc9fe001  ! 1537: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r14
	.word 0x85504000  ! 1538: RDPR_TNPC	rdpr	%tnpc, %r2
	.word 0x99a389a5  ! 1539: FDIVs	fdivs	%f14, %f5, %f12
	.word 0x9e692001  ! 1540: UDIVX_I	udivx 	%r4, 0x0001, %r15
	.word 0xde800bc0  ! 1541: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r15
	.word 0x936b2001  ! 1542: SDIVX_I	sdivx	%r12, 0x0001, %r9
	.word 0x81982e04  ! 1543: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e04, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xd2d7e000  ! 1545: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r9
	.word 0x83d02033  ! 1546: Tcc_I	te	icc_or_xcc, %r0 + 51
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d902282  ! 1548: WRPR_PSTATE_I	wrpr	%r0, 0x0282, %pstate
DS_77:
	.word 0x34800001  ! 1550: BG	bg,a	<label_0x1>
	.word 0xcb320009  ! 1550: STQF_R	-	%f5, [%r9, %r8]
	.word 0x97458000  ! 1549: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0xd65fc000  ! 1550: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x90d0a001  ! 1551: UMULcc_I	umulcc 	%r2, 0x0001, %r8
	.word 0x87802089  ! 1552: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x3c700001  ! 1553: BPPOS	<illegal instruction>
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd04fe001  ! 1555: LDSB_I	ldsb	[%r31 + 0x0001], %r8
	.word 0xd137e001  ! 1556: STQF_I	-	%f8, [0x0001, %r31]
	.word 0x81982b80  ! 1557: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b80, %hpstate
	.word 0x8d802000  ! 1558: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_78:
	.word 0x34800001  ! 1560: BG	bg,a	<label_0x1>
	.word 0xc531c00c  ! 1560: STQF_R	-	%f2, [%r12, %r7]
	.word 0x93458000  ! 1559: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x819824cc  ! 1560: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04cc, %hpstate
	.word 0x819828cb  ! 1561: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08cb, %hpstate
	.word 0x8d9026c0  ! 1562: WRPR_PSTATE_I	wrpr	%r0, 0x06c0, %pstate
	.word 0x81982d98  ! 1563: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d98, %hpstate
	.word 0x8198294a  ! 1564: WRHPR_HPSTATE_I	wrhpr	%r0, 0x094a, %hpstate
	.word 0x8d902e4a  ! 1565: WRPR_PSTATE_I	wrpr	%r0, 0x0e4a, %pstate
DS_79:
	.word 0x22800001  ! 1567: BE	be,a	<label_0x1>
	illtrap
	.word 0x83b1030d  ! 1566: ALLIGNADDRESS	alignaddr	%r4, %r13, %r1
	mov 0x31, %r30
	.word 0x95d0001e  ! 1567: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0xc3e7c02d  ! 1568: CASA_I	casa	[%r31] 0x 1, %r13, %r1
	.word 0xc217c000  ! 1569: LDUH_R	lduh	[%r31 + %r0], %r1
	.word 0x89a3c9cc  ! 1570: FDIVd	fdivd	%f46, %f12, %f4
	mov 0x30, %r30
	.word 0x81d0001e  ! 1571: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	mov 0x30, %r30
	.word 0x91d0001e  ! 1572: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc88008a0  ! 1573: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
	.word 0x9551c000  ! 1574: RDPR_TL	rdpr	%tl, %r10
DS_80:
	.word 0x34800001  ! 1576: BG	bg,a	<label_0x1>
	illtrap
	.word 0x81b00300  ! 1575: ALLIGNADDRESS	alignaddr	%r0, %r0, %r0
	mov 0x34, %r30
	.word 0x8dd0001e  ! 1576: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x8b494000  ! 1577: RDHPR_HTBA	rdhpr	%htba, %r5
	.word 0x94786001  ! 1578: SDIV_I	sdiv 	%r1, 0x0001, %r10
	.word 0x8d802000  ! 1579: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d802000  ! 1580: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9c016001  ! 1581: ADD_I	add 	%r5, 0x0001, %r14
	.word 0xdcdfe030  ! 1582: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r14
	.word 0x22800001  ! 1583: BE	be,a	<label_0x1>
	mov 0x30, %r30
	.word 0x8bd0001e  ! 1584: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d9026df  ! 1586: WRPR_PSTATE_I	wrpr	%r0, 0x06df, %pstate
	.word 0x81982e95  ! 1587: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e95, %hpstate
	.word 0x9e492001  ! 1588: MULX_I	mulx 	%r4, 0x0001, %r15
	mov 0x35, %r30
	.word 0x85d0001e  ! 1589: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0xde2fe001  ! 1590: STB_I	stb	%r15, [%r31 + 0x0001]
	mov 0x35, %r30
	.word 0x8dd0001e  ! 1591: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x89a309ce  ! 1592: FDIVd	fdivd	%f12, %f14, %f4
	.word 0xc88fe000  ! 1593: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r4
	.word 0xc8bfc02e  ! 1594: STDA_R	stda	%r4, [%r31 + %r14] 0x01
	.word 0x20700001  ! 1595: BPN	<illegal instruction>
	.word 0x9b514000  ! 1596: RDPR_TBA	rdpr	%tba, %r13
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xdb3fe001  ! 1599: STDF_I	std	%f13, [0x0001, %r31]
	ta	T_CHANGE_HPRIV	! macro
	.word 0xda8008a0  ! 1601: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x98798007  ! 1602: SDIV_R	sdiv 	%r6, %r7, %r12
	.word 0x8198270d  ! 1603: WRHPR_HPSTATE_I	wrhpr	%r0, 0x070d, %hpstate
	.word 0x8d90284d  ! 1604: WRPR_PSTATE_I	wrpr	%r0, 0x084d, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	mov 0x35, %r30
	.word 0x87d0001e  ! 1606: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99d02030  ! 1608: Tcc_I	tgu	icc_or_xcc, %r0 + 48
	.word 0x9bd02032  ! 1609: Tcc_I	tcc	icc_or_xcc, %r0 + 50
	.word 0xd84fe001  ! 1610: LDSB_I	ldsb	[%r31 + 0x0001], %r12
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xd88fe000  ! 1612: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r12
	.word 0x99d02030  ! 1613: Tcc_I	tgu	icc_or_xcc, %r0 + 48
	.word 0xd89004a0  ! 1614: LDUHA_R	lduha	[%r0, %r0] 0x25, %r12
	.word 0x95d02030  ! 1615: Tcc_I	tg	icc_or_xcc, %r0 + 48
DS_81:
	.word 0x34800001  ! 1617: BG	bg,a	<label_0x1>
	.word 0xcb326001  ! 1617: STQF_I	-	%f5, [0x0001, %r9]
	.word 0x87458000  ! 1616: RD_SOFTINT_REG	rd	%softint, %r3
	.word 0x8d902c9b  ! 1617: WRPR_PSTATE_I	wrpr	%r0, 0x0c9b, %pstate
	.word 0x81982982  ! 1618: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0982, %hpstate
	.word 0x3a700001  ! 1619: BPCC	<illegal instruction>
	mov 0x32, %r30
	.word 0x8bd0001e  ! 1620: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x97d02030  ! 1621: Tcc_I	tge	icc_or_xcc, %r0 + 48
	.word 0x30700001  ! 1622: BPA	<illegal instruction>
	.word 0x2e700001  ! 1623: BPVS	<illegal instruction>
	.word 0x34700001  ! 1624: BPG	<illegal instruction>
	.word 0xc6cfe030  ! 1625: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r3
	ta	T_CHANGE_PRIV	! macro
	.word 0x8fa000cb  ! 1627: FNEGd	fnegd	%f42, %f38
	.word 0x81982cd3  ! 1628: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd3, %hpstate
	.word 0x34700001  ! 1629: BPG	<illegal instruction>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x3a800001  ! 1631: BCC	bcc,a	<label_0x1>
	ta	T_CHANGE_HPRIV	! macro
DS_82:
	.word 0x20800001  ! 1634: BN	bn,a	<label_0x1>
	.word 0xcd33c00f  ! 1634: STQF_R	-	%f6, [%r15, %r15]
	.word 0x9f458000  ! 1633: RD_SOFTINT_REG	rd	%softint, %r15
	ta	T_CHANGE_PRIV	! macro
	.word 0x86830002  ! 1635: ADDcc_R	addcc 	%r12, %r2, %r3
	.word 0x81982a56  ! 1636: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a56, %hpstate
	.word 0x81982644  ! 1637: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0644, %hpstate
	mov 0x34, %r30
	.word 0x9bd0001e  ! 1638: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x87802016  ! 1639: WRASI_I	wr	%r0, 0x0016, %asi
	mov 0x35, %r30
	.word 0x83d0001e  ! 1640: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 1641: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87802089  ! 1642: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8fd02032  ! 1643: Tcc_I	tvs	icc_or_xcc, %r0 + 50
	mov 0x33, %r30
	.word 0x97d0001e  ! 1644: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0xc727c002  ! 1645: STF_R	st	%f3, [%r2, %r31]
	.word 0x87a18d24  ! 1646: FsMULd	fsmuld	%f6, %f4, %f34
	.word 0x81982603  ! 1647: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0603, %hpstate
	.word 0x94c32001  ! 1648: ADDCcc_I	addccc 	%r12, 0x0001, %r10
	.word 0x81982c00  ! 1649: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c00, %hpstate
	mov 0x35, %r30
	.word 0x85d0001e  ! 1650: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0xd4c804a0  ! 1651: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	.word 0x8fd02035  ! 1652: Tcc_I	tvs	icc_or_xcc, %r0 + 53
	.word 0xd48804a0  ! 1653: LDUBA_R	lduba	[%r0, %r0] 0x25, %r10
DS_83:
	.word 0x22800001  ! 1655: BE	be,a	<label_0x1>
	illtrap
	.word 0x9bb04304  ! 1654: ALLIGNADDRESS	alignaddr	%r1, %r4, %r13
DS_84:
	.word 0x20800001  ! 1656: BN	bn,a	<label_0x1>
	illtrap
	.word 0x89b1030c  ! 1655: ALLIGNADDRESS	alignaddr	%r4, %r12, %r4
	.word 0xc8800c00  ! 1656: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r4
	.word 0xc8d804a0  ! 1657: LDXA_R	ldxa	[%r0, %r0] 0x25, %r4
DS_85:
	.word 0x32800001  ! 1659: BNE	bne,a	<label_0x1>
	.word 0xdd318002  ! 1659: STQF_R	-	%f14, [%r2, %r6]
	.word 0x9d458000  ! 1658: RD_SOFTINT_REG	rd	%softint, %r14
	.word 0x8d802000  ! 1659: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xdc2fc002  ! 1660: STB_R	stb	%r14, [%r31 + %r2]
	.word 0x8d902c08  ! 1661: WRPR_PSTATE_I	wrpr	%r0, 0x0c08, %pstate
	.word 0x87802016  ! 1662: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x9dd02033  ! 1663: Tcc_I	tpos	icc_or_xcc, %r0 + 51
	.word 0x9cd1e001  ! 1664: UMULcc_I	umulcc 	%r7, 0x0001, %r14
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_HPRIV	! macro
	mov 0x34, %r30
	.word 0x81d0001e  ! 1667: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0xdc8008a0  ! 1669: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r14
	.word 0x89504000  ! 1670: RDPR_TNPC	rdpr	%tnpc, %r4
	.word 0x87802004  ! 1671: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xc8d7e000  ! 1672: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r4
	.word 0x87a189cf  ! 1673: FDIVd	fdivd	%f6, %f46, %f34
DS_86:
	.word 0x22800001  ! 1675: BE	be,a	<label_0x1>
	illtrap
	.word 0x83b2830c  ! 1674: ALLIGNADDRESS	alignaddr	%r10, %r12, %r1
	.word 0x81982f80  ! 1675: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f80, %hpstate
	.word 0x8d902ed1  ! 1676: WRPR_PSTATE_I	wrpr	%r0, 0x0ed1, %pstate
	.word 0xc24fe001  ! 1677: LDSB_I	ldsb	[%r31 + 0x0001], %r1
	.word 0x87802088  ! 1678: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x84016001  ! 1679: ADD_I	add 	%r5, 0x0001, %r2
	.word 0x81982d59  ! 1680: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d59, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d802000  ! 1682: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc4900e40  ! 1683: LDUHA_R	lduha	[%r0, %r0] 0x72, %r2
	.word 0x81982300  ! 1684: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0300, %hpstate
	.word 0x8d802000  ! 1685: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc48008a0  ! 1686: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x81982256  ! 1687: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0256, %hpstate
	.word 0x8d902a46  ! 1688: WRPR_PSTATE_I	wrpr	%r0, 0x0a46, %pstate
	.word 0x8d902e15  ! 1689: WRPR_PSTATE_I	wrpr	%r0, 0x0e15, %pstate
	.word 0x8d9022cb  ! 1690: WRPR_PSTATE_I	wrpr	%r0, 0x02cb, %pstate
	.word 0x94c3e001  ! 1691: ADDCcc_I	addccc 	%r15, 0x0001, %r10
	ta	T_CHANGE_PRIV	! macro
	.word 0x90800007  ! 1693: ADDcc_R	addcc 	%r0, %r7, %r8
	.word 0x8d902019  ! 1694: WRPR_PSTATE_I	wrpr	%r0, 0x0019, %pstate
	.word 0xd097e010  ! 1695: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r8
	.word 0x947bc00d  ! 1696: SDIV_R	sdiv 	%r15, %r13, %r10
	.word 0x99494000  ! 1697: RDHPR_HTBA	rdhpr	%htba, %r12
	.word 0x87802080  ! 1698: WRASI_I	wr	%r0, 0x0080, %asi
DS_87:
	.word 0x32800001  ! 1700: BNE	bne,a	<label_0x1>
	.word 0xdf32e001  ! 1700: STQF_I	-	%f15, [0x0001, %r11]
	.word 0x85458000  ! 1699: RD_SOFTINT_REG	rd	%softint, %r2
	mov 0x30, %r30
	.word 0x89d0001e  ! 1700: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d902414  ! 1702: WRPR_PSTATE_I	wrpr	%r0, 0x0414, %pstate
	.word 0xc437e001  ! 1703: STH_I	sth	%r2, [%r31 + 0x0001]
	.word 0x819822ce  ! 1704: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02ce, %hpstate
	.word 0x24700001  ! 1705: BPLE	<illegal instruction>
	.word 0x99a01a64  ! 1706: FqTOi	fqtoi	
	.word 0x87802080  ! 1707: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x87802089  ! 1708: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x81982e93  ! 1709: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e93, %hpstate
	.word 0x81982bca  ! 1710: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bca, %hpstate
	.word 0x22800001  ! 1711: BE	be,a	<label_0x1>
DS_88:
	.word 0x32800001  ! 1713: BNE	bne,a	<label_0x1>
	.word 0xc130000c  ! 1713: STQF_R	-	%f0, [%r12, %r0]
	.word 0x8f458000  ! 1712: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0xcec004a0  ! 1713: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r7
	.word 0x81982155  ! 1714: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0155, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8e528008  ! 1716: UMUL_R	umul 	%r10, %r8, %r7
	.word 0xce7fe001  ! 1717: SWAP_I	swap	%r7, [%r31 + 0x0001]
	.word 0x87802014  ! 1718: WRASI_I	wr	%r0, 0x0014, %asi
	mov 0x34, %r30
	.word 0x8dd0001e  ! 1719: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0xcec004a0  ! 1720: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r7
	.word 0xce8008a0  ! 1721: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x8648a001  ! 1722: MULX_I	mulx 	%r2, 0x0001, %r3
	ta	T_CHANGE_NONPRIV	! macro
	mov 0x32, %r30
	.word 0x81d0001e  ! 1724: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 1725: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_89:
	.word 0x22800001  ! 1727: BE	be,a	<label_0x1>
	.word 0xdf332001  ! 1727: STQF_I	-	%f15, [0x0001, %r12]
	.word 0x85458000  ! 1726: RD_SOFTINT_REG	rd	%softint, %r2
	.word 0x87a1c9ee  ! 1727: FDIVq	dis not found

	.word 0xc797e001  ! 1728: LDQFA_I	-	[%r31, 0x0001], %f3
	ta	T_CHANGE_HPRIV	! macro
	.word 0x22700001  ! 1730: BPE	<illegal instruction>
	.word 0x34700001  ! 1731: BPG	<illegal instruction>
DS_90:
	.word 0x34800001  ! 1733: BG	bg,a	<label_0x1>
	illtrap
	.word 0x8db08306  ! 1732: ALLIGNADDRESS	alignaddr	%r2, %r6, %r6
	.word 0x89d02035  ! 1733: Tcc_I	tleu	icc_or_xcc, %r0 + 53
	.word 0x8ba01a69  ! 1734: FqTOi	fqtoi	
	.word 0x81982a5c  ! 1735: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a5c, %hpstate
	.word 0x81982f03  ! 1736: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f03, %hpstate
	.word 0x8198205a  ! 1737: WRHPR_HPSTATE_I	wrhpr	%r0, 0x005a, %hpstate
	.word 0xca5fc000  ! 1738: LDX_R	ldx	[%r31 + %r0], %r5
DS_91:
	.word 0x22800001  ! 1740: BE	be,a	<label_0x1>
	.word 0xd9306001  ! 1740: STQF_I	-	%f12, [0x0001, %r1]
	.word 0x81458000  ! 1739: RD_SOFTINT_REG	stbar
	.word 0x87802080  ! 1740: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x8198241e  ! 1741: WRHPR_HPSTATE_I	wrhpr	%r0, 0x041e, %hpstate
	.word 0x99d02031  ! 1742: Tcc_I	tgu	icc_or_xcc, %r0 + 49
	mov 0x34, %r30
	.word 0x83d0001e  ! 1743: Tcc_R	te	icc_or_xcc, %r0 + %r30
DS_92:
	.word 0x20800001  ! 1745: BN	bn,a	<label_0x1>
	.word 0xcd31a001  ! 1745: STQF_I	-	%f6, [0x0001, %r6]
	.word 0x93458000  ! 1744: RD_SOFTINT_REG	rd	%softint, %r9
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x87802004  ! 1746: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87a10dc7  ! 1747: FdMULq	fdmulq	
	.word 0x80c2e001  ! 1748: ADDCcc_I	addccc 	%r11, 0x0001, %r0
	.word 0x976b4003  ! 1749: SDIVX_R	sdivx	%r13, %r3, %r11
	.word 0x89d02035  ! 1750: Tcc_I	tleu	icc_or_xcc, %r0 + 53
	.word 0x8d902ec9  ! 1751: WRPR_PSTATE_I	wrpr	%r0, 0x0ec9, %pstate
	.word 0x87a009a9  ! 1752: FDIVs	fdivs	%f0, %f9, %f3
	.word 0x8d802000  ! 1753: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8ba249a2  ! 1754: FDIVs	fdivs	%f9, %f2, %f5
	.word 0xcad7e030  ! 1755: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r5
	.word 0x99a1c9ab  ! 1756: FDIVs	fdivs	%f7, %f11, %f12
	.word 0x81a01a62  ! 1757: FqTOi	fqtoi	
	.word 0xc0800ba0  ! 1758: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r0
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d902a47  ! 1762: WRPR_PSTATE_I	wrpr	%r0, 0x0a47, %pstate
	.word 0x8d902e84  ! 1763: WRPR_PSTATE_I	wrpr	%r0, 0x0e84, %pstate
	.word 0x97a00546  ! 1764: FSQRTd	fsqrt	
	.word 0xd6ffc026  ! 1765: SWAPA_R	swapa	%r11, [%r31 + %r6] 0x01
	.word 0x8d9020cb  ! 1766: WRPR_PSTATE_I	wrpr	%r0, 0x00cb, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xd67fe001  ! 1768: SWAP_I	swap	%r11, [%r31 + 0x0001]
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9150c000  ! 1770: RDPR_TT	rdpr	%tt, %r8
	.word 0xd09004a0  ! 1771: LDUHA_R	lduha	[%r0, %r0] 0x25, %r8
	.word 0x8d802004  ! 1772: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x976a0002  ! 1773: SDIVX_R	sdivx	%r8, %r2, %r11
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x884a0004  ! 1775: MULX_R	mulx 	%r8, %r4, %r4
	.word 0xc8800b20  ! 1776: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r4
	.word 0xc93fe001  ! 1777: STDF_I	std	%f4, [0x0001, %r31]
	.word 0x36700001  ! 1778: BPGE	<illegal instruction>
	.word 0x9249c002  ! 1779: MULX_R	mulx 	%r7, %r2, %r9
	.word 0xd2bfe001  ! 1780: STDA_I	stda	%r9, [%r31 + 0x0001] %asi
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0x819829c0  ! 1783: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c0, %hpstate
	mov 0x32, %r30
	.word 0x9bd0001e  ! 1784: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x82794006  ! 1785: SDIV_R	sdiv 	%r5, %r6, %r1
	.word 0xc2dfe030  ! 1786: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r1
DS_93:
	.word 0x20800001  ! 1788: BN	bn,a	<label_0x1>
	illtrap
	.word 0x8bb3030c  ! 1787: ALLIGNADDRESS	alignaddr	%r12, %r12, %r5
	.word 0x8d9022c0  ! 1788: WRPR_PSTATE_I	wrpr	%r0, 0x02c0, %pstate
	.word 0x98694008  ! 1789: UDIVX_R	udivx 	%r5, %r8, %r12
	.word 0x819826c6  ! 1790: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06c6, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x81d02033  ! 1792: Tcc_I	tn	icc_or_xcc, %r0 + 51
	.word 0x96db800e  ! 1793: SMULcc_R	smulcc 	%r14, %r14, %r11
	.word 0x8d902a1f  ! 1794: WRPR_PSTATE_I	wrpr	%r0, 0x0a1f, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d9022c4  ! 1798: WRPR_PSTATE_I	wrpr	%r0, 0x02c4, %pstate
	.word 0x8d9028ca  ! 1799: WRPR_PSTATE_I	wrpr	%r0, 0x08ca, %pstate
DS_94:
	.word 0x20800001  ! 1801: BN	bn,a	<label_0x1>
	.word 0xd932e001  ! 1801: STQF_I	-	%f12, [0x0001, %r11]
	.word 0x95458000  ! 1800: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0xd4d80e60  ! 1801: LDXA_R	ldxa	[%r0, %r0] 0x73, %r10
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8cd3a001  ! 1803: UMULcc_I	umulcc 	%r14, 0x0001, %r6
	.word 0x8d902c8b  ! 1804: WRPR_PSTATE_I	wrpr	%r0, 0x0c8b, %pstate
	.word 0x81982c1d  ! 1805: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c1d, %hpstate
	.word 0x9b6b6001  ! 1806: SDIVX_I	sdivx	%r13, 0x0001, %r13
	.word 0x8d902683  ! 1807: WRPR_PSTATE_I	wrpr	%r0, 0x0683, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0xdb37c00e  ! 1809: STQF_R	-	%f13, [%r14, %r31]
	.word 0x8d90228f  ! 1810: WRPR_PSTATE_I	wrpr	%r0, 0x028f, %pstate
	.word 0xdacfe020  ! 1811: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r13
	.word 0xda1fc000  ! 1812: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0x87802010  ! 1813: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x887a0006  ! 1814: SDIV_R	sdiv 	%r8, %r6, %r4
DS_95:
	.word 0x32800001  ! 1816: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x8bb38301  ! 1815: ALLIGNADDRESS	alignaddr	%r14, %r1, %r5
	.word 0x819829c7  ! 1816: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c7, %hpstate
	.word 0xca4fc000  ! 1817: LDSB_R	ldsb	[%r31 + %r0], %r5
	.word 0xca8008a0  ! 1818: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0x8d802000  ! 1819: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_HPRIV	! macro
	.word 0x97d02032  ! 1821: Tcc_I	tge	icc_or_xcc, %r0 + 50
	.word 0x81982443  ! 1822: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0443, %hpstate
	.word 0x2e800001  ! 1823: BVS	bvs,a	<label_0x1>
	.word 0xcac7e030  ! 1824: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r5
	.word 0x946bc000  ! 1825: UDIVX_R	udivx 	%r15, %r0, %r10
	.word 0x3a700001  ! 1826: BPCC	<illegal instruction>
	.word 0x8050000c  ! 1827: UMUL_R	umul 	%r0, %r12, %r0
	.word 0x91d02031  ! 1828: Tcc_I	ta	icc_or_xcc, %r0 + 49
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xc127e001  ! 1830: STF_I	st	%f0, [0x0001, %r31]
	.word 0x81982b04  ! 1831: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b04, %hpstate
	.word 0x8d802000  ! 1832: WRFPRS_I	wr	%r0, 0x0000, %fprs
	mov 0x33, %r30
	.word 0x99d0001e  ! 1833: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	mov 0x32, %r30
	.word 0x9bd0001e  ! 1834: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x81982aca  ! 1835: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0aca, %hpstate
	.word 0xc127e001  ! 1836: STF_I	st	%f0, [0x0001, %r31]
	.word 0x81982a4a  ! 1837: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a4a, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc0d804a0  ! 1839: LDXA_R	ldxa	[%r0, %r0] 0x25, %r0
	.word 0xc07fe001  ! 1840: SWAP_I	swap	%r0, [%r31 + 0x0001]
	.word 0x8d902a0d  ! 1841: WRPR_PSTATE_I	wrpr	%r0, 0x0a0d, %pstate
	.word 0x8a812001  ! 1842: ADDcc_I	addcc 	%r4, 0x0001, %r5
	.word 0xca2fc00c  ! 1843: STB_R	stb	%r5, [%r31 + %r12]
	.word 0x8d802000  ! 1844: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x97a149a2  ! 1845: FDIVs	fdivs	%f5, %f2, %f11
	.word 0x84690003  ! 1846: UDIVX_R	udivx 	%r4, %r3, %r2
	.word 0x88c16001  ! 1847: ADDCcc_I	addccc 	%r5, 0x0001, %r4
	.word 0x986b000a  ! 1848: UDIVX_R	udivx 	%r12, %r10, %r12
	.word 0x8d802000  ! 1849: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982ecb  ! 1850: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ecb, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x81982cdc  ! 1853: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cdc, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0xd9e7c02a  ! 1855: CASA_I	casa	[%r31] 0x 1, %r10, %r12
	.word 0x81d02030  ! 1856: Tcc_I	tn	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_NONHPRIV	! macro
DS_96:
	.word 0x20800001  ! 1859: BN	bn,a	<label_0x1>
	.word 0xdb312001  ! 1859: STQF_I	-	%f13, [0x0001, %r4]
	.word 0x83458000  ! 1858: RD_SOFTINT_REG	rd	%softint, %r1
DS_97:
	.word 0x22800001  ! 1860: BE	be,a	<label_0x1>
	illtrap
	.word 0x97b18301  ! 1859: ALLIGNADDRESS	alignaddr	%r6, %r1, %r11
	.word 0x8ec12001  ! 1860: ADDCcc_I	addccc 	%r4, 0x0001, %r7
	.word 0xce5fc000  ! 1861: LDX_R	ldx	[%r31 + %r0], %r7
	.word 0x8d802000  ! 1862: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d9022d0  ! 1863: WRPR_PSTATE_I	wrpr	%r0, 0x02d0, %pstate
	.word 0x87802016  ! 1864: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8d9022c8  ! 1865: WRPR_PSTATE_I	wrpr	%r0, 0x02c8, %pstate
	.word 0xce9fc020  ! 1866: LDDA_R	ldda	[%r31, %r0] 0x01, %r7
	.word 0xceffc021  ! 1867: SWAPA_R	swapa	%r7, [%r31 + %r1] 0x01
	.word 0xce47c000  ! 1868: LDSW_R	ldsw	[%r31 + %r0], %r7
	.word 0x8d902c1e  ! 1869: WRPR_PSTATE_I	wrpr	%r0, 0x0c1e, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xcedfe000  ! 1871: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r7
	.word 0x819820ca  ! 1872: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00ca, %hpstate
	.word 0xcfe7c021  ! 1873: CASA_I	casa	[%r31] 0x 1, %r1, %r7
	.word 0x81982f13  ! 1874: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f13, %hpstate
	.word 0x946bc009  ! 1875: UDIVX_R	udivx 	%r15, %r9, %r10
	.word 0x3c800001  ! 1876: BPOS	bpos,a	<label_0x1>
DS_98:
	.word 0x20800001  ! 1878: BN	bn,a	<label_0x1>
	.word 0xcd324002  ! 1878: STQF_R	-	%f6, [%r2, %r9]
	.word 0x9d458000  ! 1877: RD_SOFTINT_REG	rd	%softint, %r14
	.word 0x81d02032  ! 1878: Tcc_I	tn	icc_or_xcc, %r0 + 50
	.word 0x91480000  ! 1879: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
	.word 0x8bd02034  ! 1880: Tcc_I	tcs	icc_or_xcc, %r0 + 52
	.word 0x9dd02034  ! 1881: Tcc_I	tpos	icc_or_xcc, %r0 + 52
	.word 0x91a00547  ! 1882: FSQRTd	fsqrt	
	.word 0x9278c003  ! 1883: SDIV_R	sdiv 	%r3, %r3, %r9
	.word 0xd24fe001  ! 1884: LDSB_I	ldsb	[%r31 + 0x0001], %r9
	.word 0x8d9022cf  ! 1885: WRPR_PSTATE_I	wrpr	%r0, 0x02cf, %pstate
	.word 0x87802004  ! 1886: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x90db0001  ! 1887: SMULcc_R	smulcc 	%r12, %r1, %r8
	.word 0x907ae001  ! 1888: SDIV_I	sdiv 	%r11, 0x0001, %r8
	.word 0x9c51c00c  ! 1889: UMUL_R	umul 	%r7, %r12, %r14
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xdc8fe000  ! 1891: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r14
	.word 0x8d902c90  ! 1892: WRPR_PSTATE_I	wrpr	%r0, 0x0c90, %pstate
	.word 0xdc8fe000  ! 1893: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r14
	.word 0x8d802004  ! 1894: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xdcd7e030  ! 1895: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r14
	.word 0x81982bd8  ! 1896: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bd8, %hpstate
	.word 0x867a400c  ! 1897: SDIV_R	sdiv 	%r9, %r12, %r3
	.word 0x8d902213  ! 1898: WRPR_PSTATE_I	wrpr	%r0, 0x0213, %pstate
	.word 0x81982d13  ! 1899: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d13, %hpstate
	.word 0x819827ca  ! 1900: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07ca, %hpstate
	.word 0xc69004a0  ! 1901: LDUHA_R	lduha	[%r0, %r0] 0x25, %r3
	.word 0x86792001  ! 1902: SDIV_I	sdiv 	%r4, 0x0001, %r3
	.word 0x987be001  ! 1903: SDIV_I	sdiv 	%r15, 0x0001, %r12
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8ba00548  ! 1905: FSQRTd	fsqrt	
	.word 0xcac00e80  ! 1906: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r5
	.word 0x2a800001  ! 1907: BCS	bcs,a	<label_0x1>
	.word 0x819821d6  ! 1908: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01d6, %hpstate
	.word 0x8d902ad1  ! 1909: WRPR_PSTATE_I	wrpr	%r0, 0x0ad1, %pstate
	.word 0x95d02031  ! 1910: Tcc_I	tg	icc_or_xcc, %r0 + 49
DS_99:
	.word 0x22800001  ! 1912: BE	be,a	<label_0x1>
	.word 0xd331c00f  ! 1912: STQF_R	-	%f9, [%r15, %r7]
	.word 0x81458000  ! 1911: RD_SOFTINT_REG	stbar
	.word 0x8d902a0d  ! 1912: WRPR_PSTATE_I	wrpr	%r0, 0x0a0d, %pstate
	.word 0x8d90281a  ! 1913: WRPR_PSTATE_I	wrpr	%r0, 0x081a, %pstate
	.word 0x9678a001  ! 1914: SDIV_I	sdiv 	%r2, 0x0001, %r11
	.word 0x8d902494  ! 1915: WRPR_PSTATE_I	wrpr	%r0, 0x0494, %pstate
DS_100:
	.word 0x20800001  ! 1917: BN	bn,a	<label_0x1>
	.word 0xc731a001  ! 1917: STQF_I	-	%f3, [0x0001, %r6]
	.word 0x8d458000  ! 1916: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0x8da00560  ! 1917: FSQRTq	fsqrt	
	.word 0x9880000d  ! 1918: ADDcc_R	addcc 	%r0, %r13, %r12
	.word 0x8e802001  ! 1919: ADDcc_I	addcc 	%r0, 0x0001, %r7
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xce5fc000  ! 1921: LDX_R	ldx	[%r31 + %r0], %r7
	.word 0xce97e030  ! 1922: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r7
	.word 0xce77c00d  ! 1923: STX_R	stx	%r7, [%r31 + %r13]
	.word 0x9dd02032  ! 1924: Tcc_I	tpos	icc_or_xcc, %r0 + 50
	.word 0x8d902c8a  ! 1925: WRPR_PSTATE_I	wrpr	%r0, 0x0c8a, %pstate
	.word 0xce800a60  ! 1926: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r7
	.word 0x8e79a001  ! 1927: SDIV_I	sdiv 	%r6, 0x0001, %r7
	.word 0x8d802000  ! 1928: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982d8f  ! 1929: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d8f, %hpstate
	.word 0x87802014  ! 1930: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x81d02030  ! 1931: Tcc_I	tn	icc_or_xcc, %r0 + 48
	.word 0x81982a97  ! 1932: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a97, %hpstate
	.word 0x8d9028d7  ! 1933: WRPR_PSTATE_I	wrpr	%r0, 0x08d7, %pstate
DS_101:
	.word 0x32800001  ! 1935: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x87b3830c  ! 1934: ALLIGNADDRESS	alignaddr	%r14, %r12, %r3
	ta	T_CHANGE_TO_TL0	! macro
	mov 0x31, %r30
	.word 0x8dd0001e  ! 1936: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x846b2001  ! 1937: UDIVX_I	udivx 	%r12, 0x0001, %r2
	ta	T_CHANGE_TO_TL0	! macro
DS_102:
	.word 0x20800001  ! 1940: BN	bn,a	<label_0x1>
	.word 0xcb31e001  ! 1940: STQF_I	-	%f5, [0x0001, %r7]
	.word 0x8d458000  ! 1939: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0x8d90249c  ! 1940: WRPR_PSTATE_I	wrpr	%r0, 0x049c, %pstate
	.word 0x8ba14dcd  ! 1941: FdMULq	fdmulq	
	.word 0x95a149ac  ! 1942: FDIVs	fdivs	%f5, %f12, %f10
	.word 0x9b68a001  ! 1943: SDIVX_I	sdivx	%r2, 0x0001, %r13
	.word 0x8d9022c7  ! 1944: WRPR_PSTATE_I	wrpr	%r0, 0x02c7, %pstate
	.word 0x8d802000  ! 1945: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87802014  ! 1946: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x9c48800a  ! 1947: MULX_R	mulx 	%r2, %r10, %r14
	.word 0x8d902cda  ! 1948: WRPR_PSTATE_I	wrpr	%r0, 0x0cda, %pstate
	.word 0x3c800001  ! 1949: BPOS	bpos,a	<label_0x1>
	.word 0x8d902a15  ! 1950: WRPR_PSTATE_I	wrpr	%r0, 0x0a15, %pstate
	.word 0x93d02033  ! 1951: Tcc_I	tne	icc_or_xcc, %r0 + 51
	mov 0x32, %r30
	.word 0x83d0001e  ! 1952: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x9fd02032  ! 1953: Tcc_I	tvc	icc_or_xcc, %r0 + 50
	.word 0x93686001  ! 1954: SDIVX_I	sdivx	%r1, 0x0001, %r9
	.word 0x28700001  ! 1955: BPLEU	<illegal instruction>
	.word 0xd2c804a0  ! 1956: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r9
DS_103:
	.word 0x32800001  ! 1958: BNE	bne,a	<label_0x1>
	.word 0xc9312001  ! 1958: STQF_I	-	%f4, [0x0001, %r4]
	.word 0x89458000  ! 1957: RD_SOFTINT_REG	rd	%softint, %r4
	.word 0xc917c000  ! 1958: LDQF_R	-	[%r31, %r0], %f4
	.word 0x97a000c4  ! 1959: FNEGd	fnegd	%f4, %f42
	.word 0x2c700001  ! 1960: BPNEG	<illegal instruction>
	.word 0xd607e001  ! 1961: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0x81982e5b  ! 1962: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e5b, %hpstate
	.word 0xd69004a0  ! 1963: LDUHA_R	lduha	[%r0, %r0] 0x25, %r11
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9f500000  ! 1965: RDPR_TPC	rdpr	%tpc, %r15
	.word 0x82d2a001  ! 1966: UMULcc_I	umulcc 	%r10, 0x0001, %r1
	.word 0x89a000c0  ! 1967: FNEGd	fnegd	%f0, %f4
	.word 0x85514000  ! 1968: RDPR_TBA	rdpr	%tba, %r2
	.word 0xc48008a0  ! 1969: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x2c700001  ! 1970: BPNEG	<illegal instruction>
	.word 0x93a000cf  ! 1971: FNEGd	fnegd	%f46, %f40
	.word 0x88016001  ! 1972: ADD_I	add 	%r5, 0x0001, %r4
	.word 0x8d9028d8  ! 1973: WRPR_PSTATE_I	wrpr	%r0, 0x08d8, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x92684000  ! 1975: UDIVX_R	udivx 	%r1, %r0, %r9
	.word 0xd28008a0  ! 1976: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xd28008a0  ! 1977: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x8d902e5d  ! 1978: WRPR_PSTATE_I	wrpr	%r0, 0x0e5d, %pstate
	.word 0x34700001  ! 1979: BPG	<illegal instruction>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8bd02033  ! 1981: Tcc_I	tcs	icc_or_xcc, %r0 + 51
DS_104:
	.word 0x20800001  ! 1983: BN	bn,a	<label_0x1>
	.word 0xc532e001  ! 1983: STQF_I	-	%f2, [0x0001, %r11]
	.word 0x8d458000  ! 1982: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0x9ba04dce  ! 1983: FdMULq	fdmulq	
	.word 0x2a700001  ! 1984: BPCS	<illegal instruction>
	.word 0xda17c000  ! 1985: LDUH_R	lduh	[%r31 + %r0], %r13
	.word 0x87802004  ! 1986: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87802004  ! 1987: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x30800001  ! 1988: BA	ba,a	<label_0x1>
	.word 0xda8804a0  ! 1989: LDUBA_R	lduba	[%r0, %r0] 0x25, %r13
	.word 0xda97e020  ! 1990: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r13
	.word 0xda8fe030  ! 1991: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r13
	.word 0xda7fe001  ! 1992: SWAP_I	swap	%r13, [%r31 + 0x0001]
	.word 0x81982e8a  ! 1993: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e8a, %hpstate
	.word 0xdac7e000  ! 1994: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r13
	.word 0xda8008a0  ! 1995: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x8c53c000  ! 1996: UMUL_R	umul 	%r15, %r0, %r6
	.word 0xcc4fc000  ! 1997: LDSB_R	ldsb	[%r31 + %r0], %r6
	.word 0x81d02034  ! 1998: Tcc_I	tn	icc_or_xcc, %r0 + 52
	.word 0x8d90280f  ! 1999: WRPR_PSTATE_I	wrpr	%r0, 0x080f, %pstate
	.word 0x81982287  ! 2000: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0287, %hpstate
	.word 0x20700001  ! 2001: BPN	<illegal instruction>
	mov 0x31, %r30
	.word 0x9bd0001e  ! 2002: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x81508000  ! 2003: RDPR_TSTATE	rdpr	%tstate, %r0
	ta	T_CHANGE_PRIV	! macro
	.word 0xc097e010  ! 2005: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r0
	.word 0x87802089  ! 2006: WRASI_I	wr	%r0, 0x0089, %asi
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x906a4004  ! 2008: UDIVX_R	udivx 	%r9, %r4, %r8
	.word 0x91d02035  ! 2009: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8d90208f  ! 2010: WRPR_PSTATE_I	wrpr	%r0, 0x008f, %pstate
	.word 0x85a38d2e  ! 2011: FsMULd	fsmuld	%f14, %f14, %f2
	.word 0xc48008a0  ! 2012: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x81982a45  ! 2013: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a45, %hpstate
	mov 0x35, %r30
	.word 0x9dd0001e  ! 2014: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xc4ffc02e  ! 2016: SWAPA_R	swapa	%r2, [%r31 + %r14] 0x01
	.word 0x83a00568  ! 2017: FSQRTq	fsqrt	
	.word 0x20800001  ! 2018: BN	bn,a	<label_0x1>
	.word 0x87802004  ! 2019: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xc2c7e000  ! 2020: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r1
	mov 0x31, %r30
	.word 0x89d0001e  ! 2021: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x8d902850  ! 2022: WRPR_PSTATE_I	wrpr	%r0, 0x0850, %pstate
	.word 0x2c800001  ! 2023: BNEG	bneg,a	<label_0x1>
	.word 0x87d02030  ! 2024: Tcc_I	tl	icc_or_xcc, %r0 + 48
	.word 0x8d90269e  ! 2025: WRPR_PSTATE_I	wrpr	%r0, 0x069e, %pstate
DS_105:
	.word 0x32800001  ! 2027: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x89b2c30d  ! 2026: ALLIGNADDRESS	alignaddr	%r11, %r13, %r4
	.word 0x87802089  ! 2027: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8d902049  ! 2028: WRPR_PSTATE_I	wrpr	%r0, 0x0049, %pstate
	.word 0xc8800ac0  ! 2029: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r4
	.word 0x2a700001  ! 2030: BPCS	<illegal instruction>
	.word 0x9482a001  ! 2031: ADDcc_I	addcc 	%r10, 0x0001, %r10
	.word 0xd4800c40  ! 2032: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r10
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81982d54  ! 2034: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d54, %hpstate
	.word 0x8d802004  ! 2035: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d902280  ! 2036: WRPR_PSTATE_I	wrpr	%r0, 0x0280, %pstate
	.word 0x89500000  ! 2037: RDPR_TPC	rdpr	%tpc, %r4
	.word 0x8198239b  ! 2038: WRHPR_HPSTATE_I	wrhpr	%r0, 0x039b, %hpstate
	.word 0x8d802000  ! 2039: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d90280a  ! 2041: WRPR_PSTATE_I	wrpr	%r0, 0x080a, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x844b2001  ! 2043: MULX_I	mulx 	%r12, 0x0001, %r2
	.word 0x967a4002  ! 2044: SDIV_R	sdiv 	%r9, %r2, %r11
	.word 0x81982b9c  ! 2045: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b9c, %hpstate
	.word 0x8d90280f  ! 2046: WRPR_PSTATE_I	wrpr	%r0, 0x080f, %pstate
	.word 0xd6d80e40  ! 2047: LDXA_R	ldxa	[%r0, %r0] 0x72, %r11
	.word 0x8d90261a  ! 2048: WRPR_PSTATE_I	wrpr	%r0, 0x061a, %pstate
	.word 0x9da309ea  ! 2049: FDIVq	dis not found

	.word 0x81982699  ! 2050: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0699, %hpstate
	mov 0x32, %r30
	.word 0x9fd0001e  ! 2051: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
DS_106:
	.word 0x22800001  ! 2053: BE	be,a	<label_0x1>
	.word 0xd531e001  ! 2053: STQF_I	-	%f10, [0x0001, %r7]
	.word 0x8d458000  ! 2052: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0x81982841  ! 2053: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0841, %hpstate
	.word 0x99a209cf  ! 2054: FDIVd	fdivd	%f8, %f46, %f12
	ta	T_CHANGE_NONPRIV	! macro
	mov 0x31, %r30
	.word 0x85d0001e  ! 2056: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x8d902255  ! 2057: WRPR_PSTATE_I	wrpr	%r0, 0x0255, %pstate
	.word 0x8b494000  ! 2058: RDHPR_HTBA	rdhpr	%htba, %r5
	mov 0x32, %r30
	.word 0x89d0001e  ! 2059: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
DS_107:
	.word 0x22800001  ! 2061: BE	be,a	<label_0x1>
	.word 0xcf33c00b  ! 2061: STQF_R	-	%f7, [%r11, %r15]
	.word 0x93458000  ! 2060: RD_SOFTINT_REG	rd	%softint, %r9
	mov 0x34, %r30
	.word 0x85d0001e  ! 2061: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x8d500000  ! 2062: RDPR_TPC	rdpr	%tpc, %r6
	.word 0x8c7aa001  ! 2063: SDIV_I	sdiv 	%r10, 0x0001, %r6
	.word 0xcc800aa0  ! 2064: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r6
	.word 0x82d06001  ! 2065: UMULcc_I	umulcc 	%r1, 0x0001, %r1
	.word 0xc28008a0  ! 2066: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0x81982e85  ! 2067: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e85, %hpstate
	.word 0x87508000  ! 2068: RDPR_TSTATE	rdpr	%tstate, %r3
	ta	T_CHANGE_PRIV	! macro
	.word 0xc6c00e40  ! 2070: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r3
	.word 0x8cd3c009  ! 2071: UMULcc_R	umulcc 	%r15, %r9, %r6
	.word 0x8d90200f  ! 2072: WRPR_PSTATE_I	wrpr	%r0, 0x000f, %pstate
	.word 0x94696001  ! 2073: UDIVX_I	udivx 	%r5, 0x0001, %r10
	.word 0x8d902204  ! 2074: WRPR_PSTATE_I	wrpr	%r0, 0x0204, %pstate
	.word 0x2c700001  ! 2075: BPNEG	<illegal instruction>
	.word 0xd4800c40  ! 2076: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r10
	.word 0x8d902ed5  ! 2077: WRPR_PSTATE_I	wrpr	%r0, 0x0ed5, %pstate
	mov 0x35, %r30
	.word 0x8fd0001e  ! 2078: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x87d02031  ! 2079: Tcc_I	tl	icc_or_xcc, %r0 + 49
	.word 0xd49fe001  ! 2080: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r10
	.word 0x9bd02034  ! 2081: Tcc_I	tcc	icc_or_xcc, %r0 + 52
	.word 0xd45fc000  ! 2082: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x8198240b  ! 2083: WRHPR_HPSTATE_I	wrhpr	%r0, 0x040b, %hpstate
	.word 0x819827d3  ! 2084: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07d3, %hpstate
	.word 0xd407c000  ! 2085: LDUW_R	lduw	[%r31 + %r0], %r10
	.word 0x81982f5c  ! 2086: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f5c, %hpstate
	.word 0x8d90285b  ! 2087: WRPR_PSTATE_I	wrpr	%r0, 0x085b, %pstate
	.word 0x97d02034  ! 2088: Tcc_I	tge	icc_or_xcc, %r0 + 52
	.word 0x26800001  ! 2089: BL	bl,a	<label_0x1>
	.word 0xd4c004a0  ! 2090: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
	.word 0x81982f8f  ! 2091: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f8f, %hpstate
	.word 0x87802089  ! 2092: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x87802004  ! 2093: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xd437e001  ! 2094: STH_I	sth	%r10, [%r31 + 0x0001]
	.word 0xd4800c00  ! 2095: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r10
	.word 0x8d802000  ! 2096: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x99d02030  ! 2097: Tcc_I	tgu	icc_or_xcc, %r0 + 48
	mov 0x33, %r30
	.word 0x8bd0001e  ! 2098: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x81982bdb  ! 2099: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bdb, %hpstate
	.word 0xd4bfe001  ! 2100: STDA_I	stda	%r10, [%r31 + 0x0001] %asi
DS_108:
	.word 0x34800001  ! 2102: BG	bg,a	<label_0x1>
	illtrap
	.word 0x8fb10303  ! 2101: ALLIGNADDRESS	alignaddr	%r4, %r3, %r7
	.word 0x807ae001  ! 2102: SDIV_I	sdiv 	%r11, 0x0001, %r0
DS_109:
	.word 0x20800001  ! 2104: BN	bn,a	<label_0x1>
	.word 0xd332c00d  ! 2104: STQF_R	-	%f9, [%r13, %r11]
	.word 0x97458000  ! 2103: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0x8d902e18  ! 2104: WRPR_PSTATE_I	wrpr	%r0, 0x0e18, %pstate
	.word 0x81982ad8  ! 2105: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad8, %hpstate
DS_110:
	.word 0x32800001  ! 2107: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x89b10304  ! 2106: ALLIGNADDRESS	alignaddr	%r4, %r4, %r4
DS_111:
	.word 0x20800001  ! 2108: BN	bn,a	<label_0x1>
	.word 0xd5304008  ! 2108: STQF_R	-	%f10, [%r8, %r1]
	.word 0x9b458000  ! 2107: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0xdb37c008  ! 2108: STQF_R	-	%f13, [%r8, %r31]
	.word 0xdac7e000  ! 2109: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r13
	.word 0x81a3cd28  ! 2110: FsMULd	fsmuld	%f15, %f8, %f0
	mov 0x32, %r30
	.word 0x8dd0001e  ! 2111: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
DS_112:
	.word 0x34800001  ! 2113: BG	bg,a	<label_0x1>
	.word 0xd9322001  ! 2113: STQF_I	-	%f12, [0x0001, %r8]
	.word 0x8f458000  ! 2112: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0x30800001  ! 2113: BA	ba,a	<label_0x1>
	.word 0xcf27e001  ! 2114: STF_I	st	%f7, [0x0001, %r31]
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x87802089  ! 2116: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x81982acb  ! 2117: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0acb, %hpstate
	.word 0x81982740  ! 2118: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0740, %hpstate
	.word 0x8d9028c6  ! 2119: WRPR_PSTATE_I	wrpr	%r0, 0x08c6, %pstate
	.word 0xcedfe010  ! 2120: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r7
	.word 0x8d802000  ! 2121: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xcf97e001  ! 2122: LDQFA_I	-	[%r31, 0x0001], %f7
	.word 0x8198278b  ! 2123: WRHPR_HPSTATE_I	wrhpr	%r0, 0x078b, %hpstate
	.word 0x8da000cc  ! 2124: FNEGd	fnegd	%f12, %f6
	.word 0x26700001  ! 2125: BPL	<illegal instruction>
	.word 0xccbfc02c  ! 2126: STDA_R	stda	%r6, [%r31 + %r12] 0x01
	.word 0x86690009  ! 2127: UDIVX_R	udivx 	%r4, %r9, %r3
	.word 0xc697e030  ! 2128: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r3
	.word 0x8d902287  ! 2129: WRPR_PSTATE_I	wrpr	%r0, 0x0287, %pstate
	.word 0x20800001  ! 2130: BN	bn,a	<label_0x1>
DS_113:
	.word 0x34800001  ! 2132: BG	bg,a	<label_0x1>
	illtrap
	.word 0x9fb24302  ! 2131: ALLIGNADDRESS	alignaddr	%r9, %r2, %r15
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xde800ba0  ! 2133: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r15
	.word 0x81d02030  ! 2134: Tcc_I	tn	icc_or_xcc, %r0 + 48
	.word 0x9bd02032  ! 2135: Tcc_I	tcc	icc_or_xcc, %r0 + 50
	.word 0x8d902645  ! 2136: WRPR_PSTATE_I	wrpr	%r0, 0x0645, %pstate
	.word 0x8d802000  ! 2137: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d90248e  ! 2138: WRPR_PSTATE_I	wrpr	%r0, 0x048e, %pstate
	.word 0x87802016  ! 2139: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8d902c08  ! 2140: WRPR_PSTATE_I	wrpr	%r0, 0x0c08, %pstate
	.word 0x819826c2  ! 2141: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06c2, %hpstate
	.word 0x87802080  ! 2142: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x8e7b8008  ! 2143: SDIV_R	sdiv 	%r14, %r8, %r7
	.word 0xcec804a0  ! 2144: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r7
	.word 0x85d02030  ! 2145: Tcc_I	tle	icc_or_xcc, %r0 + 48
	.word 0x8dd02030  ! 2146: Tcc_I	tneg	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x84528005  ! 2148: UMUL_R	umul 	%r10, %r5, %r2
	.word 0x8d9024d1  ! 2149: WRPR_PSTATE_I	wrpr	%r0, 0x04d1, %pstate
	.word 0x8d90249a  ! 2150: WRPR_PSTATE_I	wrpr	%r0, 0x049a, %pstate
	.word 0x8d902417  ! 2151: WRPR_PSTATE_I	wrpr	%r0, 0x0417, %pstate
	.word 0xc4dfe020  ! 2152: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r2
	.word 0x8d90205c  ! 2153: WRPR_PSTATE_I	wrpr	%r0, 0x005c, %pstate
	.word 0x84032001  ! 2154: ADD_I	add 	%r12, 0x0001, %r2
	.word 0x81982b95  ! 2155: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b95, %hpstate
	.word 0xc537c005  ! 2156: STQF_R	-	%f2, [%r5, %r31]
	.word 0x8082a001  ! 2157: ADDcc_I	addcc 	%r10, 0x0001, %r0
	.word 0x8ed28006  ! 2158: UMULcc_R	umulcc 	%r10, %r6, %r7
	.word 0x8f500000  ! 2159: RDPR_TPC	rdpr	%tpc, %r7
	.word 0xcfe7c026  ! 2160: CASA_I	casa	[%r31] 0x 1, %r6, %r7
	.word 0x20700001  ! 2161: BPN	<illegal instruction>
	.word 0x91a309c4  ! 2162: FDIVd	fdivd	%f12, %f4, %f8
	.word 0x3a800001  ! 2163: BCC	bcc,a	<label_0x1>
	.word 0x8a79000c  ! 2164: SDIV_R	sdiv 	%r4, %r12, %r5
	.word 0x84798004  ! 2165: SDIV_R	sdiv 	%r6, %r4, %r2
	.word 0x93504000  ! 2166: RDPR_TNPC	rdpr	%tnpc, %r9
	ta	T_CHANGE_NONPRIV	! macro
	mov 0x35, %r30
	.word 0x89d0001e  ! 2168: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x81982247  ! 2169: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0247, %hpstate
	.word 0x8d902c52  ! 2170: WRPR_PSTATE_I	wrpr	%r0, 0x0c52, %pstate
	.word 0x81982f9c  ! 2171: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f9c, %hpstate
	.word 0x8e682001  ! 2172: UDIVX_I	udivx 	%r0, 0x0001, %r7
	.word 0x8cc32001  ! 2173: ADDCcc_I	addccc 	%r12, 0x0001, %r6
	.word 0x87802016  ! 2174: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x91494000  ! 2175: RDHPR_HTBA	rdhpr	%htba, %r8
	.word 0x8ad0000c  ! 2176: UMULcc_R	umulcc 	%r0, %r12, %r5
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d90289a  ! 2178: WRPR_PSTATE_I	wrpr	%r0, 0x089a, %pstate
	.word 0x87802089  ! 2179: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x81a01a65  ! 2180: FqTOi	fqtoi	
	ta	T_CHANGE_PRIV	! macro
DS_114:
	.word 0x32800001  ! 2183: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x9bb00308  ! 2182: ALLIGNADDRESS	alignaddr	%r0, %r8, %r13
	.word 0x81982e80  ! 2183: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e80, %hpstate
	.word 0xdacfe020  ! 2184: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r13
	.word 0x8d802004  ! 2185: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x83a00566  ! 2186: FSQRTq	fsqrt	
	.word 0x9079c002  ! 2187: SDIV_R	sdiv 	%r7, %r2, %r8
	.word 0x83494000  ! 2188: RDHPR_HTBA	rdhpr	%htba, %r1
	.word 0x819829df  ! 2189: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09df, %hpstate
	.word 0x84d2c004  ! 2190: UMULcc_R	umulcc 	%r11, %r4, %r2
	.word 0x9c508004  ! 2191: UMUL_R	umul 	%r2, %r4, %r14
	.word 0xdcd7e000  ! 2192: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r14
	.word 0x8d802000  ! 2193: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87802010  ! 2194: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x85d02034  ! 2195: Tcc_I	tle	icc_or_xcc, %r0 + 52
	.word 0x8d90249d  ! 2196: WRPR_PSTATE_I	wrpr	%r0, 0x049d, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x98796001  ! 2199: SDIV_I	sdiv 	%r5, 0x0001, %r12
	.word 0x9fd02034  ! 2200: Tcc_I	tvc	icc_or_xcc, %r0 + 52
	.word 0x87a28dc4  ! 2201: FdMULq	fdmulq	
	.word 0x3a700001  ! 2202: BPCC	<illegal instruction>
	.word 0x8bd02035  ! 2203: Tcc_I	tcs	icc_or_xcc, %r0 + 53
	.word 0x9fd02032  ! 2204: Tcc_I	tvc	icc_or_xcc, %r0 + 50
	.word 0xc677c004  ! 2205: STX_R	stx	%r3, [%r31 + %r4]
	.word 0x3c800001  ! 2206: BPOS	bpos,a	<label_0x1>
DS_115:
	.word 0x32800001  ! 2208: BNE	bne,a	<label_0x1>
	.word 0xdd322001  ! 2208: STQF_I	-	%f14, [0x0001, %r8]
	.word 0x9d458000  ! 2207: RD_SOFTINT_REG	rd	%softint, %r14
	.word 0xdc8008a0  ! 2208: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r14
	.word 0x8fa000c6  ! 2209: FNEGd	fnegd	%f6, %f38
	.word 0xcec804a0  ! 2210: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r7
	.word 0x3c700001  ! 2211: BPPOS	<illegal instruction>
	.word 0x8082000a  ! 2212: ADDcc_R	addcc 	%r8, %r10, %r0
	.word 0x8d902c51  ! 2213: WRPR_PSTATE_I	wrpr	%r0, 0x0c51, %pstate
	.word 0x81982698  ! 2214: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0698, %hpstate
	.word 0x36700001  ! 2215: BPGE	<illegal instruction>
	.word 0x8198234d  ! 2216: WRHPR_HPSTATE_I	wrhpr	%r0, 0x034d, %hpstate
	.word 0x93a3c9a3  ! 2217: FDIVs	fdivs	%f15, %f3, %f9
	mov 0x34, %r30
	.word 0x87d0001e  ! 2218: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x83d02033  ! 2219: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x81982f42  ! 2220: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f42, %hpstate
DS_116:
	.word 0x32800001  ! 2222: BNE	bne,a	<label_0x1>
	.word 0xc132400b  ! 2222: STQF_R	-	%f0, [%r11, %r9]
	.word 0x93458000  ! 2221: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x8a6a0005  ! 2222: UDIVX_R	udivx 	%r8, %r5, %r5
	.word 0xca4fc000  ! 2223: LDSB_R	ldsb	[%r31 + %r0], %r5
	.word 0x8d90229e  ! 2224: WRPR_PSTATE_I	wrpr	%r0, 0x029e, %pstate
	.word 0x87d02030  ! 2225: Tcc_I	tl	icc_or_xcc, %r0 + 48
	.word 0xca7fe001  ! 2226: SWAP_I	swap	%r5, [%r31 + 0x0001]
	.word 0xcad00e40  ! 2227: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r5
DS_117:
	.word 0x32800001  ! 2229: BNE	bne,a	<label_0x1>
	.word 0xd9328003  ! 2229: STQF_R	-	%f12, [%r3, %r10]
	.word 0x8d458000  ! 2228: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0x81982855  ! 2229: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0855, %hpstate
	.word 0x9b504000  ! 2230: RDPR_TNPC	rdpr	%tnpc, %r13
	.word 0x8d902058  ! 2231: WRPR_PSTATE_I	wrpr	%r0, 0x0058, %pstate
	.word 0xdb37e001  ! 2232: STQF_I	-	%f13, [0x0001, %r31]
	.word 0x8d902c85  ! 2233: WRPR_PSTATE_I	wrpr	%r0, 0x0c85, %pstate
	.word 0x9d50c000  ! 2234: RDPR_TT	rdpr	%tt, %r14
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9cd02001  ! 2236: UMULcc_I	umulcc 	%r0, 0x0001, %r14
	.word 0x93d02035  ! 2237: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x8d9024c2  ! 2238: WRPR_PSTATE_I	wrpr	%r0, 0x04c2, %pstate
	.word 0x81982dcb  ! 2239: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dcb, %hpstate
	.word 0x88530002  ! 2240: UMUL_R	umul 	%r12, %r2, %r4
	.word 0xc8ffc022  ! 2241: SWAPA_R	swapa	%r4, [%r31 + %r2] 0x01
	.word 0x81982a90  ! 2242: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a90, %hpstate
	.word 0x9150c000  ! 2243: RDPR_TT	rdpr	%tt, %r8
	.word 0x819829d3  ! 2244: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d3, %hpstate
	mov 0x31, %r30
	.word 0x97d0001e  ! 2245: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x89d02033  ! 2246: Tcc_I	tleu	icc_or_xcc, %r0 + 51
	.word 0xd01fc000  ! 2247: LDD_R	ldd	[%r31 + %r0], %r8
	.word 0x92826001  ! 2248: ADDcc_I	addcc 	%r9, 0x0001, %r9
	.word 0x99494000  ! 2249: RDHPR_HTBA	rdhpr	%htba, %r12
	mov 0x30, %r30
	.word 0x85d0001e  ! 2250: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d802004  ! 2252: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x90c36001  ! 2253: ADDCcc_I	addccc 	%r13, 0x0001, %r8
	.word 0x2e700001  ! 2254: BPVS	<illegal instruction>
	.word 0x85d02030  ! 2255: Tcc_I	tle	icc_or_xcc, %r0 + 48
	.word 0x9da08dc4  ! 2256: FdMULq	fdmulq	
DS_118:
	.word 0x20800001  ! 2258: BN	bn,a	<label_0x1>
	.word 0xc931000e  ! 2258: STQF_R	-	%f4, [%r14, %r4]
	.word 0x9f458000  ! 2257: RD_SOFTINT_REG	rd	%softint, %r15
	.word 0x9da0056a  ! 2258: FSQRTq	fsqrt	
	ta	T_CHANGE_PRIV	! macro
	.word 0x9451c007  ! 2260: UMUL_R	umul 	%r7, %r7, %r10
	.word 0x91d02031  ! 2261: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x87802089  ! 2262: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x9da18d23  ! 2263: FsMULd	fsmuld	%f6, %f34, %f14
	.word 0x87802010  ! 2264: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xdcd80e60  ! 2265: LDXA_R	ldxa	[%r0, %r0] 0x73, %r14
	.word 0x8d9022c7  ! 2266: WRPR_PSTATE_I	wrpr	%r0, 0x02c7, %pstate
	.word 0xdd97e001  ! 2267: LDQFA_I	-	[%r31, 0x0001], %f14
	.word 0x81982a0b  ! 2268: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a0b, %hpstate
	mov 0x35, %r30
	.word 0x8dd0001e  ! 2269: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0xdde7c023  ! 2270: CASA_I	casa	[%r31] 0x 1, %r3, %r14
	.word 0x89d02032  ! 2271: Tcc_I	tleu	icc_or_xcc, %r0 + 50
	.word 0xdc8008a0  ! 2272: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r14
	.word 0x8d902092  ! 2273: WRPR_PSTATE_I	wrpr	%r0, 0x0092, %pstate
	.word 0x92db000a  ! 2274: SMULcc_R	smulcc 	%r12, %r10, %r9
	.word 0x99a349aa  ! 2275: FDIVs	fdivs	%f13, %f10, %f12
	.word 0x22800001  ! 2276: BE	be,a	<label_0x1>
	.word 0x8bd02030  ! 2277: Tcc_I	tcs	icc_or_xcc, %r0 + 48
	.word 0x8198249f  ! 2278: WRHPR_HPSTATE_I	wrhpr	%r0, 0x049f, %hpstate
	.word 0x90c16001  ! 2279: ADDCcc_I	addccc 	%r5, 0x0001, %r8
	.word 0x8d902e4c  ! 2280: WRPR_PSTATE_I	wrpr	%r0, 0x0e4c, %pstate
	.word 0x9a036001  ! 2281: ADD_I	add 	%r13, 0x0001, %r13
	mov 0x34, %r30
	.word 0x99d0001e  ! 2282: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x91480000  ! 2283: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
	.word 0x9a036001  ! 2284: ADD_I	add 	%r13, 0x0001, %r13
	.word 0x95d02032  ! 2285: Tcc_I	tg	icc_or_xcc, %r0 + 50
	.word 0x94c02001  ! 2286: ADDCcc_I	addccc 	%r0, 0x0001, %r10
	mov 0x32, %r30
	.word 0x85d0001e  ! 2287: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x8b480000  ! 2288: RDHPR_HPSTATE	rdhpr	%hpstate, %r5
	.word 0x2a800001  ! 2289: BCS	bcs,a	<label_0x1>
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x87802010  ! 2292: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x9ba0056b  ! 2293: FSQRTq	fsqrt	
	.word 0x8d902cda  ! 2294: WRPR_PSTATE_I	wrpr	%r0, 0x0cda, %pstate
	.word 0xda77e001  ! 2295: STX_I	stx	%r13, [%r31 + 0x0001]
	.word 0xda8008a0  ! 2296: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x81982d44  ! 2297: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d44, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8198241e  ! 2299: WRHPR_HPSTATE_I	wrhpr	%r0, 0x041e, %hpstate
	.word 0xdac00e40  ! 2300: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r13
	.word 0x81982b59  ! 2301: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b59, %hpstate
DS_119:
	.word 0x22800001  ! 2303: BE	be,a	<label_0x1>
	.word 0xc7326001  ! 2303: STQF_I	-	%f3, [0x0001, %r9]
	.word 0x8f458000  ! 2302: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0x2e700001  ! 2303: BPVS	<illegal instruction>
	.word 0xced00e80  ! 2304: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r7
	.word 0xceffc02b  ! 2305: SWAPA_R	swapa	%r7, [%r31 + %r11] 0x01
	.word 0x83690009  ! 2306: SDIVX_R	sdivx	%r4, %r9, %r1
	.word 0x91a000c4  ! 2307: FNEGd	fnegd	%f4, %f8
	mov 0x30, %r30
	.word 0x8dd0001e  ! 2308: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0xd0d80e60  ! 2309: LDXA_R	ldxa	[%r0, %r0] 0x73, %r8
	.word 0x30700001  ! 2310: BPA	<illegal instruction>
	.word 0x8d902697  ! 2311: WRPR_PSTATE_I	wrpr	%r0, 0x0697, %pstate
	.word 0xd0c7e030  ! 2312: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r8
	.word 0x24800001  ! 2313: BLE	ble,a	<label_0x1>
	.word 0x8d802000  ! 2314: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982552  ! 2315: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0552, %hpstate
	.word 0x81982f93  ! 2316: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f93, %hpstate
	.word 0xd1e7c024  ! 2317: CASA_I	casa	[%r31] 0x 1, %r4, %r8
	.word 0x28800001  ! 2318: BLEU	bleu,a	<label_0x1>
	.word 0x87802004  ! 2319: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8f514000  ! 2320: RDPR_TBA	rdpr	%tba, %r7
	.word 0x9b50c000  ! 2321: RDPR_TT	rdpr	%tt, %r13
	.word 0xda47e001  ! 2322: LDSW_I	ldsw	[%r31 + 0x0001], %r13
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x9e51400d  ! 2325: UMUL_R	umul 	%r5, %r13, %r15
	.word 0x99a149a7  ! 2326: FDIVs	fdivs	%f5, %f7, %f12
	.word 0x85a389c1  ! 2327: FDIVd	fdivd	%f14, %f32, %f2
	.word 0x81982004  ! 2328: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0004, %hpstate
	.word 0x8d802000  ! 2329: WRFPRS_I	wr	%r0, 0x0000, %fprs
	mov 0x30, %r30
	.word 0x81d0001e  ! 2330: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x81982e90  ! 2331: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e90, %hpstate
	.word 0xc4800b40  ! 2332: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r2
	.word 0x81a1cd2b  ! 2333: FsMULd	fsmuld	%f7, %f42, %f0
	mov 0x32, %r30
	.word 0x9fd0001e  ! 2334: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
DS_120:
	.word 0x34800001  ! 2337: BG	bg,a	<label_0x1>
	.word 0xd9332001  ! 2337: STQF_I	-	%f12, [0x0001, %r12]
	.word 0x8b458000  ! 2336: RD_SOFTINT_REG	rd	%softint, %r5
	mov 0x32, %r30
	.word 0x81d0001e  ! 2337: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0x2a800001  ! 2339: BCS	bcs,a	<label_0x1>
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81982b45  ! 2341: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b45, %hpstate
	.word 0x81982c57  ! 2342: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c57, %hpstate
	.word 0xca800b60  ! 2343: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r5
	.word 0x93a000c0  ! 2344: FNEGd	fnegd	%f0, %f40
DS_121:
	.word 0x34800001  ! 2346: BG	bg,a	<label_0x1>
	.word 0xc930e001  ! 2346: STQF_I	-	%f4, [0x0001, %r3]
	.word 0x81458000  ! 2345: RD_SOFTINT_REG	stbar
	.word 0x2c700001  ! 2346: BPNEG	<illegal instruction>
	.word 0xc0800ae0  ! 2347: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r0
	.word 0x8d90280f  ! 2348: WRPR_PSTATE_I	wrpr	%r0, 0x080f, %pstate
	.word 0x8d802000  ! 2349: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_122:
	.word 0x20800001  ! 2351: BN	bn,a	<label_0x1>
	illtrap
	.word 0x89b3430f  ! 2350: ALLIGNADDRESS	alignaddr	%r13, %r15, %r4
	.word 0xc88008a0  ! 2351: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
	.word 0xc8ffc02f  ! 2352: SWAPA_R	swapa	%r4, [%r31 + %r15] 0x01
	.word 0x8a6b2001  ! 2353: UDIVX_I	udivx 	%r12, 0x0001, %r5
	.word 0x93504000  ! 2354: RDPR_TNPC	rdpr	%tnpc, %r9
	.word 0xd2cfe000  ! 2355: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r9
	.word 0xd22fe001  ! 2356: STB_I	stb	%r9, [%r31 + 0x0001]
	.word 0x8198260d  ! 2357: WRHPR_HPSTATE_I	wrhpr	%r0, 0x060d, %hpstate
	.word 0x3a700001  ! 2358: BPCC	<illegal instruction>
	.word 0x87802016  ! 2359: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8e79000f  ! 2360: SDIV_R	sdiv 	%r4, %r15, %r7
	.word 0xce800c60  ! 2361: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r7
	.word 0x81982291  ! 2362: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0291, %hpstate
	.word 0x8d902684  ! 2363: WRPR_PSTATE_I	wrpr	%r0, 0x0684, %pstate
	ta	T_CHANGE_PRIV	! macro
	mov 0x35, %r30
	.word 0x9dd0001e  ! 2365: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0xcfe7c02f  ! 2366: CASA_I	casa	[%r31] 0x 1, %r15, %r7
	.word 0x97a000ce  ! 2367: FNEGd	fnegd	%f14, %f42
	.word 0x8d802004  ! 2368: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd6880e80  ! 2369: LDUBA_R	lduba	[%r0, %r0] 0x74, %r11
	.word 0x9882a001  ! 2370: ADDcc_I	addcc 	%r10, 0x0001, %r12
	.word 0x81982b1d  ! 2371: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b1d, %hpstate
	.word 0xd8900e80  ! 2372: LDUHA_R	lduha	[%r0, %r0] 0x74, %r12
	.word 0x88022001  ! 2373: ADD_I	add 	%r8, 0x0001, %r4
	.word 0x8d902054  ! 2374: WRPR_PSTATE_I	wrpr	%r0, 0x0054, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc8d7e020  ! 2376: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r4
	.word 0x38700001  ! 2377: BPGU	<illegal instruction>
	.word 0xc89004a0  ! 2378: LDUHA_R	lduha	[%r0, %r0] 0x25, %r4
	mov 0x34, %r30
	.word 0x8dd0001e  ! 2379: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc89004a0  ! 2381: LDUHA_R	lduha	[%r0, %r0] 0x25, %r4
	.word 0x3e800001  ! 2382: BVC	bvc,a	<label_0x1>
	mov 0x30, %r30
	.word 0x91d0001e  ! 2383: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x34800001  ! 2384: BG	bg,a	<label_0x1>
	.word 0x8ac32001  ! 2385: ADDCcc_I	addccc 	%r12, 0x0001, %r5
	.word 0x81982251  ! 2386: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0251, %hpstate
	mov 0x34, %r30
	.word 0x97d0001e  ! 2387: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0xca7fe001  ! 2388: SWAP_I	swap	%r5, [%r31 + 0x0001]
	.word 0x9bd02032  ! 2389: Tcc_I	tcc	icc_or_xcc, %r0 + 50
	.word 0x8e4ae001  ! 2390: MULX_I	mulx 	%r11, 0x0001, %r7
	.word 0xce3fe001  ! 2391: STD_I	std	%r7, [%r31 + 0x0001]
	.word 0x81982b56  ! 2392: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b56, %hpstate
	.word 0x87802010  ! 2393: WRASI_I	wr	%r0, 0x0010, %asi
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87802016  ! 2395: WRASI_I	wr	%r0, 0x0016, %asi
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87802088  ! 2397: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x95d02035  ! 2398: Tcc_I	tg	icc_or_xcc, %r0 + 53
DS_123:
	.word 0x32800001  ! 2400: BNE	bne,a	<label_0x1>
	.word 0xd3318006  ! 2400: STQF_R	-	%f9, [%r6, %r6]
	.word 0x9b458000  ! 2399: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0xda8008a0  ! 2400: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0xdacfe030  ! 2401: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r13
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xda9004a0  ! 2403: LDUHA_R	lduha	[%r0, %r0] 0x25, %r13
	.word 0xdb37e001  ! 2404: STQF_I	-	%f13, [0x0001, %r31]
	.word 0x93d02030  ! 2405: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0x87802016  ! 2406: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x81982157  ! 2407: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0157, %hpstate
	.word 0x91d02035  ! 2408: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xda47c000  ! 2409: LDSW_R	ldsw	[%r31 + %r0], %r13
DS_124:
	.word 0x20800001  ! 2411: BN	bn,a	<label_0x1>
	illtrap
	.word 0x9bb2c307  ! 2410: ALLIGNADDRESS	alignaddr	%r11, %r7, %r13
	.word 0x8d802004  ! 2411: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xda800c00  ! 2412: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r13
	.word 0x8d902889  ! 2413: WRPR_PSTATE_I	wrpr	%r0, 0x0889, %pstate
	.word 0xda880e60  ! 2414: LDUBA_R	lduba	[%r0, %r0] 0x73, %r13
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x9ed3c001  ! 2416: UMULcc_R	umulcc 	%r15, %r1, %r15
	.word 0x8878400b  ! 2417: SDIV_R	sdiv 	%r1, %r11, %r4
	.word 0x99d02033  ! 2418: Tcc_I	tgu	icc_or_xcc, %r0 + 51
	.word 0x95a349cd  ! 2419: FDIVd	fdivd	%f44, %f44, %f10
	.word 0x8d902045  ! 2420: WRPR_PSTATE_I	wrpr	%r0, 0x0045, %pstate
	.word 0xd41fc000  ! 2421: LDD_R	ldd	[%r31 + %r0], %r10
	.word 0x8d90209d  ! 2422: WRPR_PSTATE_I	wrpr	%r0, 0x009d, %pstate
	.word 0x8d9024d4  ! 2423: WRPR_PSTATE_I	wrpr	%r0, 0x04d4, %pstate
	.word 0x8d902a42  ! 2424: WRPR_PSTATE_I	wrpr	%r0, 0x0a42, %pstate
	.word 0xd49fc020  ! 2425: LDDA_R	ldda	[%r31, %r0] 0x01, %r10
	.word 0x8fa1c9c7  ! 2426: FDIVd	fdivd	%f38, %f38, %f38
	.word 0x887b400a  ! 2427: SDIV_R	sdiv 	%r13, %r10, %r4
	.word 0x34700001  ! 2428: BPG	<illegal instruction>
	.word 0x9da00dcf  ! 2429: FdMULq	fdmulq	
	.word 0x83d02033  ! 2430: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x95a0056d  ! 2431: FSQRTq	fsqrt	
	.word 0x84d30004  ! 2432: UMULcc_R	umulcc 	%r12, %r4, %r2
	.word 0xc597e001  ! 2433: LDQFA_I	-	[%r31, 0x0001], %f2
	.word 0x8d802000  ! 2434: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x95d02035  ! 2435: Tcc_I	tg	icc_or_xcc, %r0 + 53
	.word 0xc4c7e020  ! 2436: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r2
	.word 0x8d802000  ! 2437: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d508000  ! 2438: RDPR_TSTATE	rdpr	%tstate, %r6
	.word 0xcc8008a0  ! 2439: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0xcc9004a0  ! 2440: LDUHA_R	lduha	[%r0, %r0] 0x25, %r6
	.word 0xccd804a0  ! 2441: LDXA_R	ldxa	[%r0, %r0] 0x25, %r6
	.word 0x81d02032  ! 2442: Tcc_I	tn	icc_or_xcc, %r0 + 50
DS_125:
	.word 0x34800001  ! 2444: BG	bg,a	<label_0x1>
	illtrap
	.word 0x9db28304  ! 2443: ALLIGNADDRESS	alignaddr	%r10, %r4, %r14
	.word 0x9951c000  ! 2444: RDPR_TL	rdpr	%tl, %r12
	.word 0x9a012001  ! 2445: ADD_I	add 	%r4, 0x0001, %r13
	.word 0x8d902c0e  ! 2446: WRPR_PSTATE_I	wrpr	%r0, 0x0c0e, %pstate
	.word 0xda8804a0  ! 2447: LDUBA_R	lduba	[%r0, %r0] 0x25, %r13
	.word 0x96794006  ! 2448: SDIV_R	sdiv 	%r5, %r6, %r11
	.word 0xd60fe001  ! 2449: LDUB_I	ldub	[%r31 + 0x0001], %r11
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d90289c  ! 2451: WRPR_PSTATE_I	wrpr	%r0, 0x089c, %pstate
	.word 0x8d902805  ! 2452: WRPR_PSTATE_I	wrpr	%r0, 0x0805, %pstate
	.word 0x34800001  ! 2453: BG	bg,a	<label_0x1>
	.word 0xd6800c80  ! 2454: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r11
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d902cd9  ! 2456: WRPR_PSTATE_I	wrpr	%r0, 0x0cd9, %pstate
	.word 0x8d90209d  ! 2457: WRPR_PSTATE_I	wrpr	%r0, 0x009d, %pstate
	.word 0x8d90224b  ! 2458: WRPR_PSTATE_I	wrpr	%r0, 0x024b, %pstate
	.word 0x8d802000  ! 2459: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982b04  ! 2460: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b04, %hpstate
	.word 0x87802004  ! 2461: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x81982a99  ! 2462: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a99, %hpstate
	.word 0x9e00e001  ! 2463: ADD_I	add 	%r3, 0x0001, %r15
	.word 0x81982f4f  ! 2464: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f4f, %hpstate
DS_126:
	.word 0x34800001  ! 2466: BG	bg,a	<label_0x1>
	.word 0xd9322001  ! 2466: STQF_I	-	%f12, [0x0001, %r8]
	.word 0x99458000  ! 2465: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0xd83fc006  ! 2466: STD_R	std	%r12, [%r31 + %r6]
	mov 0x33, %r30
	.word 0x91d0001e  ! 2467: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x86dac00f  ! 2468: SMULcc_R	smulcc 	%r11, %r15, %r3
	mov 0x34, %r30
	.word 0x95d0001e  ! 2469: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0xc68008a0  ! 2470: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x8d902a0f  ! 2471: WRPR_PSTATE_I	wrpr	%r0, 0x0a0f, %pstate
	.word 0x81982a05  ! 2472: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a05, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	mov 0x32, %r30
	.word 0x87d0001e  ! 2474: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0xc6800c60  ! 2475: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r3
	.word 0x3c800001  ! 2476: BPOS	bpos,a	<label_0x1>
	.word 0xc6c004a0  ! 2477: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r3
	.word 0xc68804a0  ! 2478: LDUBA_R	lduba	[%r0, %r0] 0x25, %r3
	.word 0xc6c7e000  ! 2479: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r3
	.word 0x92d06001  ! 2480: UMULcc_I	umulcc 	%r1, 0x0001, %r9
	.word 0x81982588  ! 2481: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0588, %hpstate
	.word 0xd2c80e40  ! 2482: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r9
	.word 0x8d902483  ! 2483: WRPR_PSTATE_I	wrpr	%r0, 0x0483, %pstate
	.word 0x99494000  ! 2484: RDHPR_HTBA	rdhpr	%htba, %r12
	.word 0x8d802000  ! 2485: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91d02035  ! 2486: Tcc_I	ta	icc_or_xcc, %r0 + 53
	mov 0x32, %r30
	.word 0x95d0001e  ! 2487: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x8d90289e  ! 2488: WRPR_PSTATE_I	wrpr	%r0, 0x089e, %pstate
	.word 0x87802088  ! 2489: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x96da400d  ! 2490: SMULcc_R	smulcc 	%r9, %r13, %r11
DS_127:
	.word 0x20800001  ! 2492: BN	bn,a	<label_0x1>
	.word 0xc532400b  ! 2492: STQF_R	-	%f2, [%r11, %r9]
	.word 0x99458000  ! 2491: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x967bc002  ! 2492: SDIV_R	sdiv 	%r15, %r2, %r11
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x98508002  ! 2494: UMUL_R	umul 	%r2, %r2, %r12
	.word 0xd88008a0  ! 2495: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x819824d2  ! 2496: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04d2, %hpstate
	.word 0x87802088  ! 2497: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x95a00540  ! 2498: FSQRTd	fsqrt	
DS_128:
	.word 0x32800001  ! 2500: BNE	bne,a	<label_0x1>
	.word 0xdf324003  ! 2500: STQF_R	-	%f15, [%r3, %r9]
	.word 0x83458000  ! 2499: RD_SOFTINT_REG	rd	%softint, %r1
	.word 0x8d902cc7  ! 2500: WRPR_PSTATE_I	wrpr	%r0, 0x0cc7, %pstate
	.word 0x91686001  ! 2501: SDIVX_I	sdivx	%r1, 0x0001, %r8
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8249a001  ! 2503: MULX_I	mulx 	%r6, 0x0001, %r1
	.word 0x83a249cd  ! 2504: FDIVd	fdivd	%f40, %f44, %f32
	.word 0x80798007  ! 2505: SDIV_R	sdiv 	%r6, %r7, %r0
	.word 0x9c6aa001  ! 2506: UDIVX_I	udivx 	%r10, 0x0001, %r14
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d802000  ! 2508: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_129:
	.word 0x22800001  ! 2510: BE	be,a	<label_0x1>
	illtrap
	.word 0x87b30309  ! 2509: ALLIGNADDRESS	alignaddr	%r12, %r9, %r3
DS_130:
	.word 0x22800001  ! 2511: BE	be,a	<label_0x1>
	illtrap
	.word 0x9fb30302  ! 2510: ALLIGNADDRESS	alignaddr	%r12, %r2, %r15
	.word 0x8d90288e  ! 2511: WRPR_PSTATE_I	wrpr	%r0, 0x088e, %pstate
	.word 0x8fd02035  ! 2512: Tcc_I	tvs	icc_or_xcc, %r0 + 53
	.word 0xde9fc020  ! 2513: LDDA_R	ldda	[%r31, %r0] 0x01, %r15
	.word 0xde3fc002  ! 2514: STD_R	std	%r15, [%r31 + %r2]
	.word 0xde57c000  ! 2515: LDSH_R	ldsh	[%r31 + %r0], %r15
	.word 0x8dd02035  ! 2516: Tcc_I	tneg	icc_or_xcc, %r0 + 53
	.word 0xdfe7c022  ! 2517: CASA_I	casa	[%r31] 0x 1, %r2, %r15
	.word 0x8d902854  ! 2518: WRPR_PSTATE_I	wrpr	%r0, 0x0854, %pstate
	.word 0x9448800f  ! 2519: MULX_R	mulx 	%r2, %r15, %r10
	.word 0x81982dca  ! 2520: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dca, %hpstate
	.word 0xd5e7c02f  ! 2521: CASA_I	casa	[%r31] 0x 1, %r15, %r10
	.word 0xd4dfe000  ! 2522: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r10
	.word 0x81982943  ! 2523: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0943, %hpstate
	.word 0x87802089  ! 2524: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xd497e030  ! 2525: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r10
	.word 0x99a000c8  ! 2526: FNEGd	fnegd	%f8, %f12
	.word 0x8d802000  ! 2527: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8198291e  ! 2528: WRHPR_HPSTATE_I	wrhpr	%r0, 0x091e, %hpstate
	.word 0x884a0008  ! 2529: MULX_R	mulx 	%r8, %r8, %r4
	.word 0x87d02034  ! 2530: Tcc_I	tl	icc_or_xcc, %r0 + 52
	.word 0x819821d4  ! 2531: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01d4, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8198271e  ! 2533: WRHPR_HPSTATE_I	wrhpr	%r0, 0x071e, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xc87fe001  ! 2535: SWAP_I	swap	%r4, [%r31 + 0x0001]
	.word 0x8d802004  ! 2536: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xc8800a80  ! 2537: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r4
	.word 0x819823d7  ! 2538: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03d7, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x97d02034  ! 2540: Tcc_I	tge	icc_or_xcc, %r0 + 52
	.word 0x82d0800e  ! 2541: UMULcc_R	umulcc 	%r2, %r14, %r1
	.word 0x98d1a001  ! 2542: UMULcc_I	umulcc 	%r6, 0x0001, %r12
	.word 0xd8800c20  ! 2543: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r12
DS_131:
	.word 0x34800001  ! 2545: BG	bg,a	<label_0x1>
	.word 0xc3334005  ! 2545: STQF_R	-	%f1, [%r5, %r13]
	.word 0x8f458000  ! 2544: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0x8d802000  ! 2545: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982a94  ! 2546: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a94, %hpstate
	.word 0x96db0002  ! 2547: SMULcc_R	smulcc 	%r12, %r2, %r11
	mov 0x33, %r30
	.word 0x85d0001e  ! 2548: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x9d480000  ! 2549: RDHPR_HPSTATE	rdhpr	%hpstate, %r14
DS_132:
	.word 0x34800001  ! 2551: BG	bg,a	<label_0x1>
	illtrap
	.word 0x8db04303  ! 2550: ALLIGNADDRESS	alignaddr	%r1, %r3, %r6
	.word 0x9fd02035  ! 2551: Tcc_I	tvc	icc_or_xcc, %r0 + 53
	.word 0x81982b83  ! 2552: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b83, %hpstate
	.word 0x87802004  ! 2553: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8fd02030  ! 2554: Tcc_I	tvs	icc_or_xcc, %r0 + 48
	.word 0x9680c008  ! 2555: ADDcc_R	addcc 	%r3, %r8, %r11
	.word 0xd727e001  ! 2556: STF_I	st	%f11, [0x0001, %r31]
	.word 0x89a000cb  ! 2557: FNEGd	fnegd	%f42, %f4
	.word 0x90836001  ! 2558: ADDcc_I	addcc 	%r13, 0x0001, %r8
	.word 0x81982f16  ! 2559: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f16, %hpstate
	.word 0x81982c48  ! 2560: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c48, %hpstate
	mov 0x30, %r30
	.word 0x93d0001e  ! 2561: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d802004  ! 2562: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d902a9d  ! 2563: WRPR_PSTATE_I	wrpr	%r0, 0x0a9d, %pstate
DS_133:
	.word 0x20800001  ! 2565: BN	bn,a	<label_0x1>
	.word 0xc3316001  ! 2565: STQF_I	-	%f1, [0x0001, %r5]
	.word 0x8b458000  ! 2564: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0x83a0056b  ! 2565: FSQRTq	fsqrt	
	.word 0x8d902415  ! 2566: WRPR_PSTATE_I	wrpr	%r0, 0x0415, %pstate
	.word 0x3a700001  ! 2567: BPCC	<illegal instruction>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87802004  ! 2569: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8d802004  ! 2570: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xc2800c60  ! 2571: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r1
	.word 0x8d902894  ! 2572: WRPR_PSTATE_I	wrpr	%r0, 0x0894, %pstate
	.word 0x81982057  ! 2573: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0057, %hpstate
	.word 0x83514000  ! 2574: RDPR_TBA	rdpr	%tba, %r1
	.word 0x9fd02031  ! 2575: Tcc_I	tvc	icc_or_xcc, %r0 + 49
	.word 0x819823da  ! 2576: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03da, %hpstate
	.word 0x85a1cdc1  ! 2577: FdMULq	fdmulq	
	.word 0x81982b0e  ! 2578: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b0e, %hpstate
	mov 0x35, %r30
	.word 0x87d0001e  ! 2579: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0xc49004a0  ! 2580: LDUHA_R	lduha	[%r0, %r0] 0x25, %r2
	.word 0x81982f19  ! 2581: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f19, %hpstate
	.word 0x81982602  ! 2582: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0602, %hpstate
	mov 0x35, %r30
	.word 0x8dd0001e  ! 2583: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x8d902a99  ! 2584: WRPR_PSTATE_I	wrpr	%r0, 0x0a99, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x96d10004  ! 2586: UMULcc_R	umulcc 	%r4, %r4, %r11
	.word 0x98c02001  ! 2587: ADDCcc_I	addccc 	%r0, 0x0001, %r12
	.word 0xd8800c00  ! 2588: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r12
	.word 0x9882a001  ! 2589: ADDcc_I	addcc 	%r10, 0x0001, %r12
	.word 0x81982f14  ! 2590: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f14, %hpstate
	.word 0x9fa00548  ! 2591: FSQRTd	fsqrt	
DS_134:
	.word 0x32800001  ! 2593: BNE	bne,a	<label_0x1>
	.word 0xd931000a  ! 2593: STQF_R	-	%f12, [%r10, %r4]
	.word 0x8d458000  ! 2592: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0xcc47e001  ! 2593: LDSW_I	ldsw	[%r31 + 0x0001], %r6
	.word 0x81982a55  ! 2594: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a55, %hpstate
DS_135:
	.word 0x20800001  ! 2596: BN	bn,a	<label_0x1>
	.word 0xc5310008  ! 2596: STQF_R	-	%f2, [%r8, %r4]
	.word 0x91458000  ! 2595: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0xd117c000  ! 2596: LDQF_R	-	[%r31, %r0], %f8
	.word 0x81982b51  ! 2597: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b51, %hpstate
	.word 0xd09fe001  ! 2598: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r8
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x2e800001  ! 2600: BVS	bvs,a	<label_0x1>
	.word 0x8a022001  ! 2601: ADD_I	add 	%r8, 0x0001, %r5
	.word 0xcaffc028  ! 2602: SWAPA_R	swapa	%r5, [%r31 + %r8] 0x01
	.word 0xca8008a0  ! 2603: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0x91d02034  ! 2604: Tcc_I	ta	icc_or_xcc, %r0 + 52
	mov 0x35, %r30
	.word 0x9bd0001e  ! 2605: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x36800001  ! 2606: BGE	bge,a	<label_0x1>
	.word 0x9c68000c  ! 2607: UDIVX_R	udivx 	%r0, %r12, %r14
	.word 0x34800001  ! 2608: BG	bg,a	<label_0x1>
	.word 0x38800001  ! 2609: BGU	bgu,a	<label_0x1>
	.word 0x9a7a6001  ! 2610: SDIV_I	sdiv 	%r9, 0x0001, %r13
	.word 0xda800b60  ! 2611: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r13
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x87802004  ! 2613: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x84788001  ! 2614: SDIV_R	sdiv 	%r2, %r1, %r2
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8fa01a66  ! 2616: FqTOi	fqtoi	
	.word 0x93a00546  ! 2617: FSQRTd	fsqrt	
	.word 0x81982d0c  ! 2618: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d0c, %hpstate
	.word 0x8bd02030  ! 2619: Tcc_I	tcs	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8198249e  ! 2621: WRHPR_HPSTATE_I	wrhpr	%r0, 0x049e, %hpstate
	.word 0x20700001  ! 2622: BPN	<illegal instruction>
	.word 0x81982f12  ! 2623: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f12, %hpstate
	.word 0x22700001  ! 2624: BPE	<illegal instruction>
	.word 0x8c4b8003  ! 2625: MULX_R	mulx 	%r14, %r3, %r6
	.word 0x8d90249f  ! 2626: WRPR_PSTATE_I	wrpr	%r0, 0x049f, %pstate
	.word 0xcc8008a0  ! 2627: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x26800001  ! 2628: BL	bl,a	<label_0x1>
	ta	T_CHANGE_HPRIV	! macro
DS_136:
	.word 0x34800001  ! 2631: BG	bg,a	<label_0x1>
	.word 0xc5320007  ! 2631: STQF_R	-	%f2, [%r7, %r8]
	.word 0x8d458000  ! 2630: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0xcc8008a0  ! 2631: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x8fd02034  ! 2632: Tcc_I	tvs	icc_or_xcc, %r0 + 52
	.word 0x89a01a68  ! 2633: FqTOi	fqtoi	
	.word 0x8d902255  ! 2634: WRPR_PSTATE_I	wrpr	%r0, 0x0255, %pstate
	.word 0x85504000  ! 2635: RDPR_TNPC	rdpr	%tnpc, %r2
	.word 0x83a0056b  ! 2636: FSQRTq	fsqrt	
	.word 0xc2c7e020  ! 2637: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r1
	.word 0x8d802000  ! 2638: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x92d38000  ! 2639: UMULcc_R	umulcc 	%r14, %r0, %r9
	.word 0x38800001  ! 2640: BGU	bgu,a	<label_0x1>
	.word 0xd3e7c020  ! 2641: CASA_I	casa	[%r31] 0x 1, %r0, %r9
	.word 0x8198260e  ! 2642: WRHPR_HPSTATE_I	wrhpr	%r0, 0x060e, %hpstate
DS_137:
	.word 0x32800001  ! 2644: BNE	bne,a	<label_0x1>
	.word 0xd133c006  ! 2644: STQF_R	-	%f8, [%r6, %r15]
	.word 0x83458000  ! 2643: RD_SOFTINT_REG	rd	%softint, %r1
	.word 0xc28008a0  ! 2644: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
DS_138:
	.word 0x34800001  ! 2646: BG	bg,a	<label_0x1>
	illtrap
	.word 0x87b1830b  ! 2645: ALLIGNADDRESS	alignaddr	%r6, %r11, %r3
	.word 0x81982181  ! 2646: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0181, %hpstate
	.word 0x8d802000  ! 2647: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x95d02035  ! 2648: Tcc_I	tg	icc_or_xcc, %r0 + 53
	.word 0xc737c00b  ! 2649: STQF_R	-	%f3, [%r11, %r31]
	.word 0x83514000  ! 2650: RDPR_TBA	rdpr	%tba, %r1
	.word 0x8350c000  ! 2651: RDPR_TT	rdpr	%tt, %r1
	.word 0xc28008a0  ! 2652: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0xc217c000  ! 2653: LDUH_R	lduh	[%r31 + %r0], %r1
	.word 0x8d902ec0  ! 2654: WRPR_PSTATE_I	wrpr	%r0, 0x0ec0, %pstate
	.word 0xc29fe001  ! 2655: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r1
	.word 0x2a700001  ! 2656: BPCS	<illegal instruction>
	.word 0x8d802004  ! 2657: WRFPRS_I	wr	%r0, 0x0004, %fprs
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8751c000  ! 2659: RDPR_TL	rdpr	%tl, %r3
	.word 0x9dd02031  ! 2660: Tcc_I	tpos	icc_or_xcc, %r0 + 49
	.word 0xc6c7e030  ! 2661: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r3
	.word 0x81982d49  ! 2662: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d49, %hpstate
	mov 0x30, %r30
	.word 0x8bd0001e  ! 2663: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x8081a001  ! 2664: ADDcc_I	addcc 	%r6, 0x0001, %r0
	.word 0x95d02034  ! 2665: Tcc_I	tg	icc_or_xcc, %r0 + 52
	.word 0x96d94006  ! 2666: SMULcc_R	smulcc 	%r5, %r6, %r11
	.word 0x20700001  ! 2667: BPN	<illegal instruction>
	.word 0x87802014  ! 2668: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x81982350  ! 2669: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0350, %hpstate
	.word 0xd6ffc026  ! 2670: SWAPA_R	swapa	%r11, [%r31 + %r6] 0x01
	.word 0xd65fe001  ! 2671: LDX_I	ldx	[%r31 + 0x0001], %r11
	.word 0xd73fe001  ! 2672: STDF_I	std	%f11, [0x0001, %r31]
	.word 0xd6d7e020  ! 2673: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r11
	.word 0x8d802000  ! 2674: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_PRIV	! macro
	.word 0x93504000  ! 2676: RDPR_TNPC	rdpr	%tnpc, %r9
	.word 0x8d90225f  ! 2677: WRPR_PSTATE_I	wrpr	%r0, 0x025f, %pstate
	.word 0x20700001  ! 2678: BPN	<illegal instruction>
	.word 0xd28008a0  ! 2679: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xd2cfe010  ! 2680: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r9
	.word 0x26700001  ! 2681: BPL	<illegal instruction>
	.word 0x9cd0c00f  ! 2682: UMULcc_R	umulcc 	%r3, %r15, %r14
	.word 0x9ba1cdc7  ! 2683: FdMULq	fdmulq	
	.word 0xdb3fe001  ! 2684: STDF_I	std	%f13, [0x0001, %r31]
	.word 0x8d9020d3  ! 2685: WRPR_PSTATE_I	wrpr	%r0, 0x00d3, %pstate
	.word 0xda57c000  ! 2686: LDSH_R	ldsh	[%r31 + %r0], %r13
	.word 0x9a826001  ! 2687: ADDcc_I	addcc 	%r9, 0x0001, %r13
	.word 0x8da049a4  ! 2688: FDIVs	fdivs	%f1, %f4, %f6
	.word 0x81982a95  ! 2689: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a95, %hpstate
	.word 0x85a0c9e3  ! 2690: FDIVq	dis not found

	.word 0x8bd02035  ! 2691: Tcc_I	tcs	icc_or_xcc, %r0 + 53
	.word 0xc4d80e40  ! 2692: LDXA_R	ldxa	[%r0, %r0] 0x72, %r2
	.word 0x95d02035  ! 2693: Tcc_I	tg	icc_or_xcc, %r0 + 53
	.word 0xc47fe001  ! 2694: SWAP_I	swap	%r2, [%r31 + 0x0001]
	.word 0x866b000d  ! 2695: UDIVX_R	udivx 	%r12, %r13, %r3
	.word 0x8198241e  ! 2696: WRHPR_HPSTATE_I	wrhpr	%r0, 0x041e, %hpstate
	.word 0xc6d004a0  ! 2697: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r3
	.word 0x8d902408  ! 2698: WRPR_PSTATE_I	wrpr	%r0, 0x0408, %pstate
	.word 0x8198291c  ! 2699: WRHPR_HPSTATE_I	wrhpr	%r0, 0x091c, %hpstate
	.word 0x8198260f  ! 2700: WRHPR_HPSTATE_I	wrhpr	%r0, 0x060f, %hpstate
	.word 0x87802014  ! 2701: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x82c0e001  ! 2702: ADDCcc_I	addccc 	%r3, 0x0001, %r1
	.word 0xc28008a0  ! 2703: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0x8d90209a  ! 2704: WRPR_PSTATE_I	wrpr	%r0, 0x009a, %pstate
	.word 0x3a800001  ! 2705: BCC	bcc,a	<label_0x1>
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8c69c004  ! 2707: UDIVX_R	udivx 	%r7, %r4, %r6
	.word 0x8198289a  ! 2708: WRHPR_HPSTATE_I	wrhpr	%r0, 0x089a, %hpstate
	.word 0x81982ad5  ! 2709: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad5, %hpstate
	.word 0x24700001  ! 2710: BPLE	<illegal instruction>
	.word 0x8d90244f  ! 2711: WRPR_PSTATE_I	wrpr	%r0, 0x044f, %pstate
	.word 0xccffc024  ! 2712: SWAPA_R	swapa	%r6, [%r31 + %r4] 0x01
	mov 0x31, %r30
	.word 0x99d0001e  ! 2713: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x8f51c000  ! 2714: RDPR_TL	rdpr	%tl, %r7
	.word 0x8d902446  ! 2715: WRPR_PSTATE_I	wrpr	%r0, 0x0446, %pstate
	mov 0x32, %r30
	.word 0x9fd0001e  ! 2716: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x93a01a66  ! 2718: FqTOi	fqtoi	
	.word 0x94786001  ! 2719: SDIV_I	sdiv 	%r1, 0x0001, %r10
	.word 0xd48008a0  ! 2720: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	ta	T_CHANGE_TO_TL0	! macro
	mov 0x34, %r30
	.word 0x91d0001e  ! 2722: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802016  ! 2723: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8750c000  ! 2724: RDPR_TT	rdpr	%tt, %r3
	.word 0x2a800001  ! 2725: BCS	bcs,a	<label_0x1>
	mov 0x34, %r30
	.word 0x93d0001e  ! 2726: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x81982c4f  ! 2727: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c4f, %hpstate
	.word 0x95690001  ! 2728: SDIVX_R	sdivx	%r4, %r1, %r10
	.word 0x8882400e  ! 2729: ADDcc_R	addcc 	%r9, %r14, %r4
	.word 0x81982149  ! 2730: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0149, %hpstate
	.word 0x8d802000  ! 2731: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982a10  ! 2732: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a10, %hpstate
	.word 0x8d90249e  ! 2733: WRPR_PSTATE_I	wrpr	%r0, 0x049e, %pstate
	.word 0xc897e010  ! 2734: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r4
	.word 0x81982689  ! 2735: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0689, %hpstate
	.word 0x87802010  ! 2736: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x8fa00549  ! 2737: FSQRTd	fsqrt	
	ta	T_CHANGE_TO_TL0	! macro
	mov 0x31, %r30
	.word 0x9fd0001e  ! 2739: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 2740: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_139:
	.word 0x20800001  ! 2742: BN	bn,a	<label_0x1>
	illtrap
	.word 0x95b2830f  ! 2741: ALLIGNADDRESS	alignaddr	%r10, %r15, %r10
	.word 0x8d802000  ! 2742: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982ccc  ! 2743: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ccc, %hpstate
	.word 0x2a700001  ! 2744: BPCS	<illegal instruction>
	.word 0x8198234e  ! 2745: WRHPR_HPSTATE_I	wrhpr	%r0, 0x034e, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x3a800001  ! 2747: BCC	bcc,a	<label_0x1>
	.word 0xd49004a0  ! 2748: LDUHA_R	lduha	[%r0, %r0] 0x25, %r10
	.word 0x81982ace  ! 2749: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ace, %hpstate
	.word 0x8d9020d9  ! 2750: WRPR_PSTATE_I	wrpr	%r0, 0x00d9, %pstate
	.word 0x8198249b  ! 2751: WRHPR_HPSTATE_I	wrhpr	%r0, 0x049b, %hpstate
	.word 0xd4c004a0  ! 2752: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
	.word 0x81982bce  ! 2753: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bce, %hpstate
	.word 0x9c784006  ! 2754: SDIV_R	sdiv 	%r1, %r6, %r14
	.word 0x97a289c8  ! 2755: FDIVd	fdivd	%f10, %f8, %f42
	ta	T_CHANGE_NONHPRIV	! macro
	mov 0x35, %r30
	.word 0x8fd0001e  ! 2757: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0xd68fe020  ! 2758: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r11
	.word 0x8cc26001  ! 2759: ADDCcc_I	addccc 	%r9, 0x0001, %r6
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x91504000  ! 2762: RDPR_TNPC	rdpr	%tnpc, %r8
	mov 0x32, %r30
	.word 0x87d0001e  ! 2763: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x8d902806  ! 2764: WRPR_PSTATE_I	wrpr	%r0, 0x0806, %pstate
	ta	T_CHANGE_PRIV	! macro
	mov 0x35, %r30
	.word 0x9fd0001e  ! 2766: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	mov 0x31, %r30
	.word 0x97d0001e  ! 2767: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x819823dc  ! 2768: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03dc, %hpstate
	.word 0x8d802004  ! 2769: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd07fe001  ! 2770: SWAP_I	swap	%r8, [%r31 + 0x0001]
	.word 0x8d802000  ! 2771: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x83d02034  ! 2772: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x8a698006  ! 2773: UDIVX_R	udivx 	%r6, %r6, %r5
	.word 0x99a389a5  ! 2774: FDIVs	fdivs	%f14, %f5, %f12
	.word 0x26700001  ! 2775: BPL	<illegal instruction>
	.word 0xd8d7e010  ! 2776: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r12
	.word 0x8d902e0f  ! 2777: WRPR_PSTATE_I	wrpr	%r0, 0x0e0f, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x32800001  ! 2779: BNE	bne,a	<label_0x1>
DS_140:
	.word 0x22800001  ! 2781: BE	be,a	<label_0x1>
	.word 0xdf31a001  ! 2781: STQF_I	-	%f15, [0x0001, %r6]
	.word 0x85458000  ! 2780: RD_SOFTINT_REG	rd	%softint, %r2
	.word 0xc4dfe010  ! 2781: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r2
	.word 0xc4ffc025  ! 2782: SWAPA_R	swapa	%r2, [%r31 + %r5] 0x01
	.word 0x87802080  ! 2783: WRASI_I	wr	%r0, 0x0080, %asi
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d902c13  ! 2785: WRPR_PSTATE_I	wrpr	%r0, 0x0c13, %pstate
	.word 0x8d902e9e  ! 2786: WRPR_PSTATE_I	wrpr	%r0, 0x0e9e, %pstate
	.word 0xc42fc005  ! 2787: STB_R	stb	%r2, [%r31 + %r5]
	.word 0x8bd02030  ! 2788: Tcc_I	tcs	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d90248e  ! 2790: WRPR_PSTATE_I	wrpr	%r0, 0x048e, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0xc527c005  ! 2792: STF_R	st	%f2, [%r5, %r31]
	.word 0x81982cd7  ! 2793: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd7, %hpstate
	.word 0x81982182  ! 2794: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0182, %hpstate
DS_141:
	.word 0x34800001  ! 2796: BG	bg,a	<label_0x1>
	.word 0xcb30a001  ! 2796: STQF_I	-	%f5, [0x0001, %r2]
	.word 0x91458000  ! 2795: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0xd1e7c025  ! 2796: CASA_I	casa	[%r31] 0x 1, %r5, %r8
	.word 0x8d802000  ! 2797: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0x86796001  ! 2800: SDIV_I	sdiv 	%r5, 0x0001, %r3
DS_142:
	.word 0x32800001  ! 2802: BNE	bne,a	<label_0x1>
	.word 0xcf33e001  ! 2802: STQF_I	-	%f7, [0x0001, %r15]
	.word 0x9d458000  ! 2801: RD_SOFTINT_REG	rd	%softint, %r14
	.word 0xdcd7e020  ! 2802: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r14
	.word 0xdcdfe010  ! 2803: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r14
	.word 0xdd37c005  ! 2804: STQF_R	-	%f14, [%r5, %r31]
	.word 0x8d902215  ! 2805: WRPR_PSTATE_I	wrpr	%r0, 0x0215, %pstate
	.word 0xdc8008a0  ! 2806: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r14
	mov 0x35, %r30
	.word 0x97d0001e  ! 2807: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x89d02035  ! 2808: Tcc_I	tleu	icc_or_xcc, %r0 + 53
	.word 0x81a20dcf  ! 2809: FdMULq	fdmulq	
	.word 0xc08804a0  ! 2810: LDUBA_R	lduba	[%r0, %r0] 0x25, %r0
DS_143:
	.word 0x22800001  ! 2812: BE	be,a	<label_0x1>
	.word 0xc9332001  ! 2812: STQF_I	-	%f4, [0x0001, %r12]
	.word 0x91458000  ! 2811: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x9ed0400a  ! 2812: UMULcc_R	umulcc 	%r1, %r10, %r15
	.word 0xde9004a0  ! 2813: LDUHA_R	lduha	[%r0, %r0] 0x25, %r15
	.word 0x9ba000c3  ! 2814: FNEGd	fnegd	%f34, %f44
	.word 0x8d802000  ! 2815: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x85514000  ! 2816: RDPR_TBA	rdpr	%tba, %r2
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ed8800d  ! 2818: SMULcc_R	smulcc 	%r2, %r13, %r15
DS_144:
	.word 0x32800001  ! 2820: BNE	bne,a	<label_0x1>
	.word 0xdf32000d  ! 2820: STQF_R	-	%f15, [%r13, %r8]
	.word 0x8f458000  ! 2819: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0x81982f4d  ! 2820: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f4d, %hpstate
	.word 0xce9fc020  ! 2821: LDDA_R	ldda	[%r31, %r0] 0x01, %r7
	.word 0x9c50800e  ! 2822: UMUL_R	umul 	%r2, %r14, %r14
	ta	T_CHANGE_HPRIV	! macro
DS_145:
	.word 0x20800001  ! 2825: BN	bn,a	<label_0x1>
	illtrap
	.word 0x8db3430e  ! 2824: ALLIGNADDRESS	alignaddr	%r13, %r14, %r6
DS_146:
	.word 0x22800001  ! 2826: BE	be,a	<label_0x1>
	illtrap
	.word 0x91b34306  ! 2825: ALLIGNADDRESS	alignaddr	%r13, %r6, %r8
	.word 0x81a00568  ! 2826: FSQRTq	fsqrt	
	.word 0x8d902ec9  ! 2827: WRPR_PSTATE_I	wrpr	%r0, 0x0ec9, %pstate
	.word 0x87802004  ! 2828: WRASI_I	wr	%r0, 0x0004, %asi
DS_147:
	.word 0x20800001  ! 2830: BN	bn,a	<label_0x1>
	illtrap
	.word 0x9bb10304  ! 2829: ALLIGNADDRESS	alignaddr	%r4, %r4, %r13
	.word 0xdbe7c024  ! 2830: CASA_I	casa	[%r31] 0x 1, %r4, %r13
	.word 0x8fa34dc6  ! 2831: FdMULq	fdmulq	
	.word 0x97d02035  ! 2832: Tcc_I	tge	icc_or_xcc, %r0 + 53
	.word 0x89514000  ! 2833: RDPR_TBA	rdpr	%tba, %r4
	.word 0x8d902283  ! 2834: WRPR_PSTATE_I	wrpr	%r0, 0x0283, %pstate
	.word 0x8d902296  ! 2835: WRPR_PSTATE_I	wrpr	%r0, 0x0296, %pstate
	.word 0x81982e96  ! 2836: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e96, %hpstate
	.word 0x81514000  ! 2837: RDPR_TBA	rdpr	%tba, %r0
	.word 0x87802004  ! 2838: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8f514000  ! 2839: RDPR_TBA	rdpr	%tba, %r7
	mov 0x32, %r30
	.word 0x97d0001e  ! 2840: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	mov 0x31, %r30
	.word 0x81d0001e  ! 2841: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x81982153  ! 2842: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0153, %hpstate
	mov 0x34, %r30
	.word 0x97d0001e  ! 2843: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x87802016  ! 2844: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xcedfe020  ! 2845: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r7
	.word 0x8d90228c  ! 2846: WRPR_PSTATE_I	wrpr	%r0, 0x028c, %pstate
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8bd02033  ! 2849: Tcc_I	tcs	icc_or_xcc, %r0 + 51
	.word 0xce8008a0  ! 2850: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0xce880e40  ! 2851: LDUBA_R	lduba	[%r0, %r0] 0x72, %r7
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8f6a8001  ! 2853: SDIVX_R	sdivx	%r10, %r1, %r7
	.word 0x84036001  ! 2854: ADD_I	add 	%r13, 0x0001, %r2
	.word 0x8da0cdce  ! 2855: FdMULq	fdmulq	
	.word 0xcc9004a0  ! 2856: LDUHA_R	lduha	[%r0, %r0] 0x25, %r6
	.word 0xccffc02e  ! 2857: SWAPA_R	swapa	%r6, [%r31 + %r14] 0x01
DS_148:
	.word 0x34800001  ! 2859: BG	bg,a	<label_0x1>
	.word 0xdf310005  ! 2859: STQF_R	-	%f15, [%r5, %r4]
	.word 0x91458000  ! 2858: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x9dd02030  ! 2859: Tcc_I	tpos	icc_or_xcc, %r0 + 48
	.word 0xd08fe020  ! 2860: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r8
	.word 0x8ac3a001  ! 2861: ADDCcc_I	addccc 	%r14, 0x0001, %r5
	.word 0x9e80000e  ! 2862: ADDcc_R	addcc 	%r0, %r14, %r15
	.word 0xde8008a0  ! 2863: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r15
	.word 0x9c79e001  ! 2864: SDIV_I	sdiv 	%r7, 0x0001, %r14
	.word 0x96d88001  ! 2865: SMULcc_R	smulcc 	%r2, %r1, %r11
	.word 0x81982682  ! 2866: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0682, %hpstate
DS_149:
	.word 0x34800001  ! 2868: BG	bg,a	<label_0x1>
	.word 0xc7306001  ! 2868: STQF_I	-	%f3, [0x0001, %r1]
	.word 0x91458000  ! 2867: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0xd07fe001  ! 2868: SWAP_I	swap	%r8, [%r31 + 0x0001]
	.word 0x89a01a66  ! 2869: FqTOi	fqtoi	
	.word 0x22700001  ! 2870: BPE	<illegal instruction>
	.word 0x8d902496  ! 2871: WRPR_PSTATE_I	wrpr	%r0, 0x0496, %pstate
	.word 0x9c796001  ! 2872: SDIV_I	sdiv 	%r5, 0x0001, %r14
	.word 0x94d26001  ! 2873: UMULcc_I	umulcc 	%r9, 0x0001, %r10
	.word 0x8fd02033  ! 2874: Tcc_I	tvs	icc_or_xcc, %r0 + 51
	.word 0x87802088  ! 2875: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8d9026ce  ! 2876: WRPR_PSTATE_I	wrpr	%r0, 0x06ce, %pstate
DS_150:
	.word 0x20800001  ! 2878: BN	bn,a	<label_0x1>
	.word 0xd1316001  ! 2878: STQF_I	-	%f8, [0x0001, %r5]
	.word 0x85458000  ! 2877: RD_SOFTINT_REG	rd	%softint, %r2
	.word 0x8d90288c  ! 2878: WRPR_PSTATE_I	wrpr	%r0, 0x088c, %pstate
	.word 0xc4ffc026  ! 2879: SWAPA_R	swapa	%r2, [%r31 + %r6] 0x01
DS_151:
	.word 0x20800001  ! 2881: BN	bn,a	<label_0x1>
	illtrap
	.word 0x9bb30308  ! 2880: ALLIGNADDRESS	alignaddr	%r12, %r8, %r13
	.word 0x8198291c  ! 2881: WRHPR_HPSTATE_I	wrhpr	%r0, 0x091c, %hpstate
	.word 0xdb17c000  ! 2882: LDQF_R	-	[%r31, %r0], %f13
	.word 0x8d902684  ! 2883: WRPR_PSTATE_I	wrpr	%r0, 0x0684, %pstate
	.word 0x95a00543  ! 2884: FSQRTd	fsqrt	
	.word 0x8d802000  ! 2885: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x816ae001  ! 2886: SDIVX_I	sdivx	%r11, 0x0001, %r0
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8450c003  ! 2888: UMUL_R	umul 	%r3, %r3, %r2
	.word 0x8d902c90  ! 2889: WRPR_PSTATE_I	wrpr	%r0, 0x0c90, %pstate
	.word 0x87802080  ! 2890: WRASI_I	wr	%r0, 0x0080, %asi
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d802004  ! 2892: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xc537c003  ! 2893: STQF_R	-	%f2, [%r3, %r31]
	.word 0x8d902e94  ! 2894: WRPR_PSTATE_I	wrpr	%r0, 0x0e94, %pstate
	.word 0x8fd02031  ! 2895: Tcc_I	tvs	icc_or_xcc, %r0 + 49
	.word 0xc4c804a0  ! 2896: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r2
	.word 0xc5e7c023  ! 2897: CASA_I	casa	[%r31] 0x 1, %r3, %r2
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x83d02035  ! 2899: Tcc_I	te	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81982c16  ! 2901: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c16, %hpstate
	.word 0x8802e001  ! 2902: ADD_I	add 	%r11, 0x0001, %r4
	.word 0x81982897  ! 2903: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0897, %hpstate
	.word 0x9b694005  ! 2904: SDIVX_R	sdivx	%r5, %r5, %r13
	mov 0x34, %r30
	.word 0x93d0001e  ! 2905: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xda1fc000  ! 2906: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0x8d9028ca  ! 2907: WRPR_PSTATE_I	wrpr	%r0, 0x08ca, %pstate
	.word 0x81982304  ! 2908: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0304, %hpstate
	.word 0xdac7e030  ! 2909: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r13
	.word 0x81982f44  ! 2910: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f44, %hpstate
	.word 0x34800001  ! 2911: BG	bg,a	<label_0x1>
	.word 0x87802004  ! 2912: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xda97e030  ! 2913: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r13
	.word 0x81982480  ! 2914: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0480, %hpstate
	.word 0x8d902681  ! 2915: WRPR_PSTATE_I	wrpr	%r0, 0x0681, %pstate
	mov 0x33, %r30
	.word 0x91d0001e  ! 2916: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9c7b4007  ! 2917: SDIV_R	sdiv 	%r13, %r7, %r14
	.word 0x8d480000  ! 2918: RDHPR_HPSTATE	rdhpr	%hpstate, %r6
	.word 0x87802080  ! 2919: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x93a01a60  ! 2920: FqTOi	fqtoi	
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b500000  ! 2922: RDPR_TPC	rdpr	%tpc, %r13
	.word 0x8f494000  ! 2923: RDHPR_HTBA	rdhpr	%htba, %r7
	.word 0xce800b40  ! 2924: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r7
	.word 0x81982751  ! 2925: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0751, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8fa3c9ee  ! 2927: FDIVq	dis not found

	.word 0x8fa00564  ! 2928: FSQRTq	fsqrt	
	mov 0x33, %r30
	.word 0x83d0001e  ! 2929: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xcedfe020  ! 2930: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r7
	.word 0xcedfe020  ! 2931: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r7
	.word 0x81a01a69  ! 2932: FqTOi	fqtoi	
	.word 0x8d90289d  ! 2933: WRPR_PSTATE_I	wrpr	%r0, 0x089d, %pstate
	.word 0x8ba000c3  ! 2934: FNEGd	fnegd	%f34, %f36
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d902e52  ! 2937: WRPR_PSTATE_I	wrpr	%r0, 0x0e52, %pstate
	.word 0x8c68a001  ! 2938: UDIVX_I	udivx 	%r2, 0x0001, %r6
	.word 0x8d802000  ! 2939: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xcd37e001  ! 2940: STQF_I	-	%f6, [0x0001, %r31]
	.word 0xcc8fe000  ! 2941: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r6
	.word 0x8d902ed3  ! 2942: WRPR_PSTATE_I	wrpr	%r0, 0x0ed3, %pstate
	.word 0xcde7c023  ! 2943: CASA_I	casa	[%r31] 0x 1, %r3, %r6
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x95d02033  ! 2945: Tcc_I	tg	icc_or_xcc, %r0 + 51
	.word 0x8198250e  ! 2946: WRHPR_HPSTATE_I	wrhpr	%r0, 0x050e, %hpstate
	.word 0xccc7e030  ! 2947: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r6
	.word 0xcde7c023  ! 2948: CASA_I	casa	[%r31] 0x 1, %r3, %r6
	.word 0x92d2e001  ! 2949: UMULcc_I	umulcc 	%r11, 0x0001, %r9
	.word 0x8d90261a  ! 2950: WRPR_PSTATE_I	wrpr	%r0, 0x061a, %pstate
	.word 0x9850c003  ! 2951: UMUL_R	umul 	%r3, %r3, %r12
	.word 0x8d90284e  ! 2952: WRPR_PSTATE_I	wrpr	%r0, 0x084e, %pstate
	.word 0x95a01a64  ! 2953: FqTOi	fqtoi	
	mov 0x34, %r30
	.word 0x87d0001e  ! 2954: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x8d802004  ! 2955: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd4d7e000  ! 2956: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r10
DS_152:
	.word 0x32800001  ! 2958: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x99b3c301  ! 2957: ALLIGNADDRESS	alignaddr	%r15, %r1, %r12
	.word 0x8d90220a  ! 2958: WRPR_PSTATE_I	wrpr	%r0, 0x020a, %pstate
	.word 0x81982b47  ! 2959: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b47, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d90225c  ! 2961: WRPR_PSTATE_I	wrpr	%r0, 0x025c, %pstate
	.word 0xd8800b80  ! 2962: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r12
	mov 0x32, %r30
	.word 0x83d0001e  ! 2963: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd9e7c021  ! 2964: CASA_I	casa	[%r31] 0x 1, %r1, %r12
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x85a30d21  ! 2966: FsMULd	fsmuld	%f12, %f32, %f2
	.word 0x8198244f  ! 2967: WRHPR_HPSTATE_I	wrhpr	%r0, 0x044f, %hpstate
	.word 0x86792001  ! 2968: SDIV_I	sdiv 	%r4, 0x0001, %r3
	.word 0x87686001  ! 2969: SDIVX_I	sdivx	%r1, 0x0001, %r3
	.word 0x26700001  ! 2970: BPL	<illegal instruction>
	.word 0x8369800c  ! 2971: SDIVX_R	sdivx	%r6, %r12, %r1
	.word 0x81982a11  ! 2972: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a11, %hpstate
	.word 0x81982d1c  ! 2973: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d1c, %hpstate
	.word 0x99d02033  ! 2974: Tcc_I	tgu	icc_or_xcc, %r0 + 51
	.word 0x38700001  ! 2975: BPGU	<illegal instruction>
DS_153:
	.word 0x20800001  ! 2977: BN	bn,a	<label_0x1>
	.word 0xdb302001  ! 2977: STQF_I	-	%f13, [0x0001, %r0]
	.word 0x99458000  ! 2976: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x87802004  ! 2977: WRASI_I	wr	%r0, 0x0004, %asi
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd88fe000  ! 2979: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r12
	.word 0x38700001  ! 2980: BPGU	<illegal instruction>
	.word 0xd8dfe000  ! 2981: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r12
	.word 0x94780005  ! 2982: SDIV_R	sdiv 	%r0, %r5, %r10
	.word 0x8cd0e001  ! 2983: UMULcc_I	umulcc 	%r3, 0x0001, %r6
	.word 0x804bc00f  ! 2984: MULX_R	mulx 	%r15, %r15, %r0
	.word 0x8f508000  ! 2985: RDPR_TSTATE	rdpr	%tstate, %r7
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87802014  ! 2987: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x81982d81  ! 2988: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d81, %hpstate
	.word 0xcf27e001  ! 2989: STF_I	st	%f7, [0x0001, %r31]
	.word 0xce97e000  ! 2990: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r7
DS_154:
	.word 0x32800001  ! 2992: BNE	bne,a	<label_0x1>
	.word 0xc930e001  ! 2992: STQF_I	-	%f4, [0x0001, %r3]
	.word 0x8f458000  ! 2991: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0xce7fe001  ! 2992: SWAP_I	swap	%r7, [%r31 + 0x0001]
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81504000  ! 2994: RDPR_TNPC	rdpr	%tnpc, %r0
	.word 0x8550c000  ! 2995: RDPR_TT	rdpr	%tt, %r2
	.word 0x82d1a001  ! 2996: UMULcc_I	umulcc 	%r6, 0x0001, %r1
	.word 0x3c800001  ! 2997: BPOS	bpos,a	<label_0x1>
DS_155:
	.word 0x34800001  ! 2999: BG	bg,a	<label_0x1>
	.word 0xdf30400c  ! 2999: STQF_R	-	%f15, [%r12, %r1]
	.word 0x99458000  ! 2998: RD_SOFTINT_REG	rd	%softint, %r12
	mov 0x34, %r30
	.word 0x85d0001e  ! 2999: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x26800001  ! 3000: BL	bl,a	<label_0x1>
	.word 0xd927e001  ! 3001: STF_I	st	%f12, [0x0001, %r31]
	.word 0x87802010  ! 3002: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xd8ffc02c  ! 3003: SWAPA_R	swapa	%r12, [%r31 + %r12] 0x01
	.word 0x9fa289a1  ! 3004: FDIVs	fdivs	%f10, %f1, %f15
	.word 0x89a0056d  ! 3005: FSQRTq	fsqrt	
	mov 0x30, %r30
	.word 0x85d0001e  ! 3006: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x8bd02033  ! 3007: Tcc_I	tcs	icc_or_xcc, %r0 + 51
	.word 0x8d902a92  ! 3008: WRPR_PSTATE_I	wrpr	%r0, 0x0a92, %pstate
	.word 0x8bd02031  ! 3009: Tcc_I	tcs	icc_or_xcc, %r0 + 49
	.word 0xc937c00d  ! 3010: STQF_R	-	%f4, [%r13, %r31]
	.word 0x8d90284c  ! 3011: WRPR_PSTATE_I	wrpr	%r0, 0x084c, %pstate
	.word 0xc8c7e030  ! 3012: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r4
	mov 0x30, %r30
	.word 0x8bd0001e  ! 3013: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x36800001  ! 3014: BGE	bge,a	<label_0x1>
	.word 0x8279a001  ! 3015: SDIV_I	sdiv 	%r6, 0x0001, %r1
	.word 0x807b6001  ! 3016: SDIV_I	sdiv 	%r13, 0x0001, %r0
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x986aa001  ! 3018: UDIVX_I	udivx 	%r10, 0x0001, %r12
	.word 0x87802004  ! 3019: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x92780001  ! 3020: SDIV_R	sdiv 	%r0, %r1, %r9
	.word 0x8d902c4a  ! 3021: WRPR_PSTATE_I	wrpr	%r0, 0x0c4a, %pstate
	.word 0x9c4ae001  ! 3022: MULX_I	mulx 	%r11, 0x0001, %r14
	.word 0xdcc004a0  ! 3023: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r14
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91d02032  ! 3025: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xdc27e001  ! 3026: STW_I	stw	%r14, [%r31 + 0x0001]
	.word 0x8d902201  ! 3027: WRPR_PSTATE_I	wrpr	%r0, 0x0201, %pstate
	.word 0x81982c84  ! 3028: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c84, %hpstate
	.word 0x85a2c9cd  ! 3029: FDIVd	fdivd	%f42, %f44, %f2
	.word 0x85a18d27  ! 3030: FsMULd	fsmuld	%f6, %f38, %f2
	.word 0xc45fc000  ! 3031: LDX_R	ldx	[%r31 + %r0], %r2
	.word 0x9dd02035  ! 3032: Tcc_I	tpos	icc_or_xcc, %r0 + 53
	.word 0x8d90209c  ! 3033: WRPR_PSTATE_I	wrpr	%r0, 0x009c, %pstate
	.word 0x819823dd  ! 3034: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03dd, %hpstate
	.word 0xc5e7c027  ! 3035: CASA_I	casa	[%r31] 0x 1, %r7, %r2
	.word 0x8198274e  ! 3036: WRHPR_HPSTATE_I	wrhpr	%r0, 0x074e, %hpstate
	.word 0x81982993  ! 3037: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0993, %hpstate
	.word 0x87802016  ! 3038: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x85514000  ! 3039: RDPR_TBA	rdpr	%tba, %r2
	.word 0x8d902649  ! 3040: WRPR_PSTATE_I	wrpr	%r0, 0x0649, %pstate
	.word 0xc517c000  ! 3041: LDQF_R	-	[%r31, %r0], %f2
	.word 0xc4c7e020  ! 3042: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r2
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x82d1a001  ! 3044: UMULcc_I	umulcc 	%r6, 0x0001, %r1
	.word 0x36800001  ! 3045: BGE	bge,a	<label_0x1>
	.word 0x87802016  ! 3046: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x32800001  ! 3047: BNE	bne,a	<label_0x1>
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xc28008a0  ! 3049: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0xc2ffc027  ! 3050: SWAPA_R	swapa	%r1, [%r31 + %r7] 0x01
	.word 0x3c700001  ! 3051: BPPOS	<illegal instruction>
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01a6d  ! 3053: FqTOi	fqtoi	
	.word 0x8ba249c8  ! 3054: FDIVd	fdivd	%f40, %f8, %f36
	.word 0x8fa2c9cb  ! 3055: FDIVd	fdivd	%f42, %f42, %f38
	ta	T_CHANGE_PRIV	! macro
	.word 0x95d02031  ! 3057: Tcc_I	tg	icc_or_xcc, %r0 + 49
	.word 0x8d802004  ! 3058: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x9e792001  ! 3059: SDIV_I	sdiv 	%r4, 0x0001, %r15
	.word 0x81982e98  ! 3060: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e98, %hpstate
	.word 0x81982901  ! 3061: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0901, %hpstate
	.word 0xde7fe001  ! 3062: SWAP_I	swap	%r15, [%r31 + 0x0001]
	.word 0x34800001  ! 3063: BG	bg,a	<label_0x1>
	.word 0x8fa38d2f  ! 3064: FsMULd	fsmuld	%f14, %f46, %f38
	.word 0x8d902610  ! 3065: WRPR_PSTATE_I	wrpr	%r0, 0x0610, %pstate
	.word 0x83a18d29  ! 3066: FsMULd	fsmuld	%f6, %f40, %f32
	.word 0x81982b8c  ! 3067: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b8c, %hpstate
	.word 0x32800001  ! 3068: BNE	bne,a	<label_0x1>
	.word 0x819826cf  ! 3069: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06cf, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81982b84  ! 3071: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b84, %hpstate
	.word 0x8d9024db  ! 3072: WRPR_PSTATE_I	wrpr	%r0, 0x04db, %pstate
	.word 0x84d80003  ! 3073: SMULcc_R	smulcc 	%r0, %r3, %r2
	.word 0x2e700001  ! 3074: BPVS	<illegal instruction>
	.word 0x8d802000  ! 3075: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d90261b  ! 3076: WRPR_PSTATE_I	wrpr	%r0, 0x061b, %pstate
	.word 0x8d902887  ! 3077: WRPR_PSTATE_I	wrpr	%r0, 0x0887, %pstate
	.word 0x87a01a68  ! 3078: FqTOi	fqtoi	
	.word 0x8d802004  ! 3079: WRFPRS_I	wr	%r0, 0x0004, %fprs
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d902a10  ! 3081: WRPR_PSTATE_I	wrpr	%r0, 0x0a10, %pstate
	.word 0x8d902c06  ! 3082: WRPR_PSTATE_I	wrpr	%r0, 0x0c06, %pstate
	.word 0xc737c008  ! 3083: STQF_R	-	%f3, [%r8, %r31]
	.word 0x81982690  ! 3084: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0690, %hpstate
	.word 0x8d802000  ! 3085: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d902a8f  ! 3086: WRPR_PSTATE_I	wrpr	%r0, 0x0a8f, %pstate
	.word 0x819828ca  ! 3087: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08ca, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	mov 0x34, %r30
	.word 0x81d0001e  ! 3089: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0xc65fe001  ! 3090: LDX_I	ldx	[%r31 + 0x0001], %r3
	.word 0x8d902c8a  ! 3091: WRPR_PSTATE_I	wrpr	%r0, 0x0c8a, %pstate
	.word 0x3a700001  ! 3092: BPCC	<illegal instruction>
	.word 0xc68fe020  ! 3093: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r3
	.word 0x819822c8  ! 3094: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02c8, %hpstate
	.word 0xc7e7c028  ! 3095: CASA_I	casa	[%r31] 0x 1, %r8, %r3
	.word 0x8e480004  ! 3096: MULX_R	mulx 	%r0, %r4, %r7
	.word 0xce8fe000  ! 3097: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r7
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x996ba001  ! 3099: SDIVX_I	sdivx	%r14, 0x0001, %r12
	.word 0x8198254f  ! 3100: WRHPR_HPSTATE_I	wrhpr	%r0, 0x054f, %hpstate
	.word 0xd93fe001  ! 3101: STDF_I	std	%f12, [0x0001, %r31]
	.word 0x81982f84  ! 3102: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f84, %hpstate
	.word 0xd88008a0  ! 3103: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0xd8c00e40  ! 3104: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r12
	.word 0xd897e020  ! 3105: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r12
	.word 0xd8c80e80  ! 3106: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r12
	.word 0x8d902c5d  ! 3107: WRPR_PSTATE_I	wrpr	%r0, 0x0c5d, %pstate
	.word 0xd81fc000  ! 3108: LDD_R	ldd	[%r31 + %r0], %r12
	.word 0x8fd02032  ! 3109: Tcc_I	tvs	icc_or_xcc, %r0 + 50
	.word 0x9b684005  ! 3110: SDIVX_R	sdivx	%r1, %r5, %r13
	.word 0x3c700001  ! 3111: BPPOS	<illegal instruction>
	.word 0xda57c000  ! 3112: LDSH_R	ldsh	[%r31 + %r0], %r13
	.word 0x8d802000  ! 3113: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x32800001  ! 3114: BNE	bne,a	<label_0x1>
	.word 0x8d902098  ! 3115: WRPR_PSTATE_I	wrpr	%r0, 0x0098, %pstate
DS_156:
	.word 0x32800001  ! 3117: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x87b1430c  ! 3116: ALLIGNADDRESS	alignaddr	%r5, %r12, %r3
	.word 0x8198299a  ! 3117: WRHPR_HPSTATE_I	wrhpr	%r0, 0x099a, %hpstate
	.word 0x9a002001  ! 3118: ADD_I	add 	%r0, 0x0001, %r13
	.word 0x8d902a11  ! 3119: WRPR_PSTATE_I	wrpr	%r0, 0x0a11, %pstate
	.word 0xda9004a0  ! 3120: LDUHA_R	lduha	[%r0, %r0] 0x25, %r13
	.word 0x826a4007  ! 3121: UDIVX_R	udivx 	%r9, %r7, %r1
	.word 0xc3e7c027  ! 3122: CASA_I	casa	[%r31] 0x 1, %r7, %r1
	.word 0xc2d804a0  ! 3123: LDXA_R	ldxa	[%r0, %r0] 0x25, %r1
	.word 0xc28008a0  ! 3124: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	ta	T_CHANGE_PRIV	! macro
	.word 0x9ad1800e  ! 3126: UMULcc_R	umulcc 	%r6, %r14, %r13
	.word 0xdadfe020  ! 3127: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r13
	.word 0x2c800001  ! 3128: BNEG	bneg,a	<label_0x1>
	.word 0x8d90224b  ! 3129: WRPR_PSTATE_I	wrpr	%r0, 0x024b, %pstate
	mov 0x35, %r30
	.word 0x9bd0001e  ! 3130: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	mov 0x33, %r30
	.word 0x83d0001e  ! 3131: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d9022ce  ! 3132: WRPR_PSTATE_I	wrpr	%r0, 0x02ce, %pstate
	.word 0xdbe7c02e  ! 3133: CASA_I	casa	[%r31] 0x 1, %r14, %r13
	.word 0x84da0007  ! 3134: SMULcc_R	smulcc 	%r8, %r7, %r2
	.word 0xc49004a0  ! 3135: LDUHA_R	lduha	[%r0, %r0] 0x25, %r2
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xc527e001  ! 3137: STF_I	st	%f2, [0x0001, %r31]
	.word 0x8d90245c  ! 3138: WRPR_PSTATE_I	wrpr	%r0, 0x045c, %pstate
	.word 0x87802010  ! 3139: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xc5e7c027  ! 3140: CASA_I	casa	[%r31] 0x 1, %r7, %r2
	.word 0x8a82c00d  ! 3141: ADDcc_R	addcc 	%r11, %r13, %r5
DS_157:
	.word 0x20800001  ! 3143: BN	bn,a	<label_0x1>
	illtrap
	.word 0x8bb18302  ! 3142: ALLIGNADDRESS	alignaddr	%r6, %r2, %r5
	.word 0x847ba001  ! 3143: SDIV_I	sdiv 	%r14, 0x0001, %r2
	.word 0x8d902a4d  ! 3144: WRPR_PSTATE_I	wrpr	%r0, 0x0a4d, %pstate
DS_158:
	.word 0x22800001  ! 3146: BE	be,a	<label_0x1>
	illtrap
	.word 0x89b24307  ! 3145: ALLIGNADDRESS	alignaddr	%r9, %r7, %r4
	.word 0xc8c804a0  ! 3146: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r4
DS_159:
	.word 0x20800001  ! 3148: BN	bn,a	<label_0x1>
	illtrap
	.word 0x97b1830a  ! 3147: ALLIGNADDRESS	alignaddr	%r6, %r10, %r11
	.word 0xd6bfc02a  ! 3148: STDA_R	stda	%r11, [%r31 + %r10] 0x01
DS_160:
	.word 0x22800001  ! 3150: BE	be,a	<label_0x1>
	.word 0xd130000d  ! 3150: STQF_R	-	%f8, [%r13, %r0]
	.word 0x87458000  ! 3149: RD_SOFTINT_REG	rd	%softint, %r3
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87a149a9  ! 3151: FDIVs	fdivs	%f5, %f9, %f3
	.word 0xc737e001  ! 3152: STQF_I	-	%f3, [0x0001, %r31]
	.word 0xc68804a0  ! 3153: LDUBA_R	lduba	[%r0, %r0] 0x25, %r3
	.word 0x95a14dce  ! 3154: FdMULq	fdmulq	
	.word 0x9a4a8008  ! 3155: MULX_R	mulx 	%r10, %r8, %r13
	.word 0xda27c008  ! 3156: STW_R	stw	%r13, [%r31 + %r8]
	.word 0xdad00e80  ! 3157: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r13
	.word 0xdbe7c028  ! 3158: CASA_I	casa	[%r31] 0x 1, %r8, %r13
	.word 0x819824ce  ! 3159: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04ce, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0xda900e80  ! 3161: LDUHA_R	lduha	[%r0, %r0] 0x74, %r13
	.word 0x8ba01a62  ! 3162: FqTOi	fqtoi	
	.word 0x8d902048  ! 3163: WRPR_PSTATE_I	wrpr	%r0, 0x0048, %pstate
	mov 0x34, %r30
	.word 0x9dd0001e  ! 3164: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x956b800b  ! 3165: SDIVX_R	sdivx	%r14, %r11, %r10
	.word 0x94d10001  ! 3166: UMULcc_R	umulcc 	%r4, %r1, %r10
	.word 0x81982b5e  ! 3167: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b5e, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x99a08d2f  ! 3169: FsMULd	fsmuld	%f2, %f46, %f12
	.word 0x866a6001  ! 3170: UDIVX_I	udivx 	%r9, 0x0001, %r3
	.word 0x85d02033  ! 3171: Tcc_I	tle	icc_or_xcc, %r0 + 51
	.word 0xc61fc000  ! 3172: LDD_R	ldd	[%r31 + %r0], %r3
DS_161:
	.word 0x20800001  ! 3174: BN	bn,a	<label_0x1>
	illtrap
	.word 0x85b2430d  ! 3173: ALLIGNADDRESS	alignaddr	%r9, %r13, %r2
	.word 0xc497e000  ! 3174: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r2
	.word 0x85d02032  ! 3175: Tcc_I	tle	icc_or_xcc, %r0 + 50
	.word 0x8b514000  ! 3176: RDPR_TBA	rdpr	%tba, %r5
	ta	T_CHANGE_PRIV	! macro
	.word 0x9fa000cc  ! 3178: FNEGd	fnegd	%f12, %f46
	.word 0xde8008a0  ! 3179: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r15
	.word 0x8d802000  ! 3180: WRFPRS_I	wr	%r0, 0x0000, %fprs
	mov 0x31, %r30
	.word 0x95d0001e  ! 3181: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0xde37e001  ! 3182: STH_I	sth	%r15, [%r31 + 0x0001]
	.word 0x20800001  ! 3183: BN	bn,a	<label_0x1>
	.word 0x81982f0e  ! 3184: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f0e, %hpstate
	.word 0x87802004  ! 3185: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xde8008a0  ! 3186: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r15
	.word 0x81982108  ! 3187: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0108, %hpstate
DS_162:
	.word 0x32800001  ! 3189: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x9fb38306  ! 3188: ALLIGNADDRESS	alignaddr	%r14, %r6, %r15
	.word 0x81982451  ! 3189: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0451, %hpstate
	.word 0x2a700001  ! 3190: BPCS	<illegal instruction>
	.word 0x8c81c002  ! 3191: ADDcc_R	addcc 	%r7, %r2, %r6
	ta	T_CHANGE_PRIV	! macro
	.word 0xcc7fe001  ! 3193: SWAP_I	swap	%r6, [%r31 + 0x0001]
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9c7ae001  ! 3195: SDIV_I	sdiv 	%r11, 0x0001, %r14
	.word 0xdd27c002  ! 3196: STF_R	st	%f14, [%r2, %r31]
	.word 0xdc97e010  ! 3197: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r14
	.word 0x946b8002  ! 3198: UDIVX_R	udivx 	%r14, %r2, %r10
	.word 0xd43fe001  ! 3199: STD_I	std	%r10, [%r31 + 0x0001]
	.word 0xd4ffc022  ! 3200: SWAPA_R	swapa	%r10, [%r31 + %r2] 0x01
	.word 0x9cc3a001  ! 3201: ADDCcc_I	addccc 	%r14, 0x0001, %r14
	.word 0x30700001  ! 3202: BPA	<illegal instruction>
	.word 0x92d2a001  ! 3203: UMULcc_I	umulcc 	%r10, 0x0001, %r9
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8da00543  ! 3205: FSQRTd	fsqrt	
	.word 0xcc17e001  ! 3206: LDUH_I	lduh	[%r31 + 0x0001], %r6
	.word 0x8da14d2c  ! 3207: FsMULd	fsmuld	%f5, %f12, %f6
	.word 0x8d802000  ! 3208: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xcd27c00c  ! 3209: STF_R	st	%f6, [%r12, %r31]
	.word 0x8d902ecc  ! 3210: WRPR_PSTATE_I	wrpr	%r0, 0x0ecc, %pstate
	.word 0xcc9fc020  ! 3211: LDDA_R	ldda	[%r31, %r0] 0x01, %r6
	.word 0x87802089  ! 3212: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xcc8008a0  ! 3213: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x20700001  ! 3214: BPN	<illegal instruction>
	.word 0xcc8008a0  ! 3215: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	ta	T_CHANGE_PRIV	! macro
	.word 0xccc7e030  ! 3217: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r6
	.word 0x9d480000  ! 3218: RDHPR_HPSTATE	rdhpr	%hpstate, %r14
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xdcd004a0  ! 3220: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r14
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d9028c0  ! 3222: WRPR_PSTATE_I	wrpr	%r0, 0x08c0, %pstate
	.word 0x8b514000  ! 3223: RDPR_TBA	rdpr	%tba, %r5
	.word 0xca97e020  ! 3224: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r5
	.word 0x887ae001  ! 3225: SDIV_I	sdiv 	%r11, 0x0001, %r4
	.word 0x2c800001  ! 3226: BNEG	bneg,a	<label_0x1>
	.word 0x8bd02031  ! 3227: Tcc_I	tcs	icc_or_xcc, %r0 + 49
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x9da0054b  ! 3229: FSQRTd	fsqrt	
	.word 0x8a698000  ! 3230: UDIVX_R	udivx 	%r6, %r0, %r5
	.word 0x9dd02033  ! 3231: Tcc_I	tpos	icc_or_xcc, %r0 + 51
	.word 0xcac7e020  ! 3232: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r5
	.word 0x8d802000  ! 3233: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x28700001  ! 3234: BPLEU	<illegal instruction>
	.word 0xcad7e020  ! 3235: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r5
	.word 0x9950c000  ! 3236: RDPR_TT	rdpr	%tt, %r12
	.word 0x92c3a001  ! 3237: ADDCcc_I	addccc 	%r14, 0x0001, %r9
	.word 0x8d90248b  ! 3238: WRPR_PSTATE_I	wrpr	%r0, 0x048b, %pstate
	.word 0xd327c000  ! 3239: STF_R	st	%f9, [%r0, %r31]
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x93a109e4  ! 3241: FDIVq	dis not found

	.word 0x8198299b  ! 3242: WRHPR_HPSTATE_I	wrhpr	%r0, 0x099b, %hpstate
	.word 0x81982ade  ! 3243: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ade, %hpstate
	.word 0x8d902e54  ! 3244: WRPR_PSTATE_I	wrpr	%r0, 0x0e54, %pstate
	.word 0xd2bfe001  ! 3245: STDA_I	stda	%r9, [%r31 + 0x0001] %asi
	.word 0x81982c4c  ! 3246: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c4c, %hpstate
	.word 0x8d802004  ! 3247: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d504000  ! 3248: RDPR_TNPC	rdpr	%tnpc, %r6
	.word 0x9fa049a0  ! 3249: FDIVs	fdivs	%f1, %f0, %f15
	.word 0x819828df  ! 3250: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08df, %hpstate
	.word 0xdec7e010  ! 3251: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r15
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d902a8e  ! 3253: WRPR_PSTATE_I	wrpr	%r0, 0x0a8e, %pstate
	.word 0x8080000b  ! 3254: ADDcc_R	addcc 	%r0, %r11, %r0
	ta	T_CHANGE_PRIV	! macro
	mov 0x33, %r30
	.word 0x8fd0001e  ! 3256: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x81982b09  ! 3257: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b09, %hpstate
DS_163:
	.word 0x20800001  ! 3259: BN	bn,a	<label_0x1>
	.word 0xd7332001  ! 3259: STQF_I	-	%f11, [0x0001, %r12]
	.word 0x81458000  ! 3258: RD_SOFTINT_REG	stbar
	.word 0x924a6001  ! 3259: MULX_I	mulx 	%r9, 0x0001, %r9
	.word 0xd2c00e80  ! 3260: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r9
	.word 0x8cdbc00d  ! 3261: SMULcc_R	smulcc 	%r15, %r13, %r6
DS_164:
	.word 0x32800001  ! 3263: BNE	bne,a	<label_0x1>
	.word 0xd133c00d  ! 3263: STQF_R	-	%f8, [%r13, %r15]
	.word 0x81458000  ! 3262: RD_SOFTINT_REG	stbar
	.word 0x8d802000  ! 3263: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91a0cd25  ! 3264: FsMULd	fsmuld	%f3, %f36, %f8
	.word 0x82518008  ! 3265: UMUL_R	umul 	%r6, %r8, %r1
	.word 0x8368a001  ! 3266: SDIVX_I	sdivx	%r2, 0x0001, %r1
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xc21fc000  ! 3268: LDD_R	ldd	[%r31 + %r0], %r1
	.word 0x95d02033  ! 3269: Tcc_I	tg	icc_or_xcc, %r0 + 51
	.word 0x8d902cdd  ! 3270: WRPR_PSTATE_I	wrpr	%r0, 0x0cdd, %pstate
	.word 0x8d902acc  ! 3271: WRPR_PSTATE_I	wrpr	%r0, 0x0acc, %pstate
	.word 0xc33fc008  ! 3272: STDF_R	std	%f1, [%r8, %r31]
	.word 0x28800001  ! 3273: BLEU	bleu,a	<label_0x1>
	.word 0x8d802004  ! 3274: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x9f508000  ! 3275: RDPR_TSTATE	rdpr	%tstate, %r15
	.word 0xde07c000  ! 3276: LDUW_R	lduw	[%r31 + %r0], %r15
	.word 0x8c488008  ! 3277: MULX_R	mulx 	%r2, %r8, %r6
	ta	T_CHANGE_HPRIV	! macro
	.word 0x819825c0  ! 3279: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05c0, %hpstate
	.word 0x87802089  ! 3280: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x82d8c005  ! 3281: SMULcc_R	smulcc 	%r3, %r5, %r1
	.word 0x8e7a8009  ! 3282: SDIV_R	sdiv 	%r10, %r9, %r7
	.word 0xceffc029  ! 3283: SWAPA_R	swapa	%r7, [%r31 + %r9] 0x01
	.word 0x87802014  ! 3284: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x85d02031  ! 3285: Tcc_I	tle	icc_or_xcc, %r0 + 49
	.word 0xcfe7c029  ! 3286: CASA_I	casa	[%r31] 0x 1, %r9, %r7
	.word 0x8d902cdb  ! 3287: WRPR_PSTATE_I	wrpr	%r0, 0x0cdb, %pstate
	.word 0x87802080  ! 3288: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x8d90208b  ! 3289: WRPR_PSTATE_I	wrpr	%r0, 0x008b, %pstate
	.word 0xce17c000  ! 3290: LDUH_R	lduh	[%r31 + %r0], %r7
	.word 0x8d902e5b  ! 3291: WRPR_PSTATE_I	wrpr	%r0, 0x0e5b, %pstate
	.word 0x906a800d  ! 3292: UDIVX_R	udivx 	%r10, %r13, %r8
	.word 0xd0bfe001  ! 3293: STDA_I	stda	%r8, [%r31 + 0x0001] %asi
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81982706  ! 3295: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0706, %hpstate
	.word 0xd0c004a0  ! 3296: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r8
	.word 0x8950c000  ! 3297: RDPR_TT	rdpr	%tt, %r4
	ta	T_CHANGE_HPRIV	! macro
	.word 0x966b2001  ! 3299: UDIVX_I	udivx 	%r12, 0x0001, %r11
	.word 0x26700001  ! 3300: BPL	<illegal instruction>
	.word 0x2e700001  ! 3301: BPVS	<illegal instruction>
	.word 0xd6cfe030  ! 3302: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r11
DS_165:
	.word 0x20800001  ! 3304: BN	bn,a	<label_0x1>
	illtrap
	.word 0x8bb0030f  ! 3303: ALLIGNADDRESS	alignaddr	%r0, %r15, %r5
	.word 0x91a00547  ! 3304: FSQRTd	fsqrt	
	mov 0x35, %r30
	.word 0x99d0001e  ! 3305: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0xd037e001  ! 3306: STH_I	sth	%r8, [%r31 + 0x0001]
	.word 0x819826d0  ! 3307: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06d0, %hpstate
	.word 0xd09fc020  ! 3308: LDDA_R	ldda	[%r31, %r0] 0x01, %r8
	.word 0x91480000  ! 3309: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
	.word 0x8198209a  ! 3310: WRHPR_HPSTATE_I	wrhpr	%r0, 0x009a, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9ad2a001  ! 3312: UMULcc_I	umulcc 	%r10, 0x0001, %r13
	.word 0x819825c6  ! 3313: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05c6, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0xda97e030  ! 3315: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r13
	.word 0x95a18d2c  ! 3316: FsMULd	fsmuld	%f6, %f12, %f10
	.word 0x32700001  ! 3317: BPNE	<illegal instruction>
	.word 0x8d802000  ! 3318: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd537c00c  ! 3319: STQF_R	-	%f10, [%r12, %r31]
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87500000  ! 3321: RDPR_TPC	rdpr	%tpc, %r3
	.word 0x8d902e8c  ! 3322: WRPR_PSTATE_I	wrpr	%r0, 0x0e8c, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93d02035  ! 3324: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x87802014  ! 3325: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x81a000c7  ! 3326: FNEGd	fnegd	%f38, %f0
DS_166:
	.word 0x32800001  ! 3328: BNE	bne,a	<label_0x1>
	.word 0xd9314002  ! 3328: STQF_R	-	%f12, [%r2, %r5]
	.word 0x9f458000  ! 3327: RD_SOFTINT_REG	rd	%softint, %r15
	.word 0x8469a001  ! 3328: UDIVX_I	udivx 	%r6, 0x0001, %r2
	.word 0x90c26001  ! 3329: ADDCcc_I	addccc 	%r9, 0x0001, %r8
	.word 0x81982a82  ! 3330: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a82, %hpstate
	.word 0xd01fc000  ! 3331: LDD_R	ldd	[%r31 + %r0], %r8
	.word 0xd0d804a0  ! 3332: LDXA_R	ldxa	[%r0, %r0] 0x25, %r8
	.word 0x28700001  ! 3333: BPLEU	<illegal instruction>
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd0d80e80  ! 3335: LDXA_R	ldxa	[%r0, %r0] 0x74, %r8
DS_167:
	.word 0x32800001  ! 3337: BNE	bne,a	<label_0x1>
	.word 0xc933800f  ! 3337: STQF_R	-	%f4, [%r15, %r14]
	.word 0x81458000  ! 3336: RD_SOFTINT_REG	stbar
	.word 0x30700001  ! 3337: BPA	<illegal instruction>
	.word 0xc0cfe030  ! 3338: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r0
	.word 0x8d902cc5  ! 3339: WRPR_PSTATE_I	wrpr	%r0, 0x0cc5, %pstate
	.word 0x9bd02035  ! 3340: Tcc_I	tcc	icc_or_xcc, %r0 + 53
	.word 0x87802010  ! 3341: WRASI_I	wr	%r0, 0x0010, %asi
DS_168:
	.word 0x34800001  ! 3343: BG	bg,a	<label_0x1>
	illtrap
	.word 0x99b00304  ! 3342: ALLIGNADDRESS	alignaddr	%r0, %r4, %r12
	.word 0x2a800001  ! 3343: BCS	bcs,a	<label_0x1>
	.word 0x947a6001  ! 3344: SDIV_I	sdiv 	%r9, 0x0001, %r10
	.word 0x8d90205f  ! 3345: WRPR_PSTATE_I	wrpr	%r0, 0x005f, %pstate
	.word 0x89a000c2  ! 3346: FNEGd	fnegd	%f2, %f4
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8da00545  ! 3350: FSQRTd	fsqrt	
DS_169:
	.word 0x34800001  ! 3352: BG	bg,a	<label_0x1>
	.word 0xdb308001  ! 3352: STQF_R	-	%f13, [%r1, %r2]
	.word 0x9d458000  ! 3351: RD_SOFTINT_REG	rd	%softint, %r14
	.word 0xdc8008a0  ! 3352: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r14
	.word 0x8d902815  ! 3353: WRPR_PSTATE_I	wrpr	%r0, 0x0815, %pstate
	.word 0xdc1fe001  ! 3354: LDD_I	ldd	[%r31 + 0x0001], %r14
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xdcd80e80  ! 3356: LDXA_R	ldxa	[%r0, %r0] 0x74, %r14
	.word 0x8d802004  ! 3357: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x97a000c3  ! 3358: FNEGd	fnegd	%f34, %f42
	.word 0x88012001  ! 3359: ADD_I	add 	%r4, 0x0001, %r4
	.word 0xc8ffc023  ! 3360: SWAPA_R	swapa	%r4, [%r31 + %r3] 0x01
	ta	T_CHANGE_HPRIV	! macro
	.word 0x26800001  ! 3362: BL	bl,a	<label_0x1>
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8a026001  ! 3364: ADD_I	add 	%r9, 0x0001, %r5
	.word 0xcac7e030  ! 3365: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r5
DS_170:
	.word 0x22800001  ! 3367: BE	be,a	<label_0x1>
	.word 0xcf334009  ! 3367: STQF_R	-	%f7, [%r9, %r13]
	.word 0x8f458000  ! 3366: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0x87802089  ! 3367: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8d902c83  ! 3368: WRPR_PSTATE_I	wrpr	%r0, 0x0c83, %pstate
	.word 0x9ba309e2  ! 3369: FDIVq	dis not found

	.word 0x99a0cd2e  ! 3370: FsMULd	fsmuld	%f3, %f14, %f12
	.word 0x93a149ac  ! 3371: FDIVs	fdivs	%f5, %f12, %f9
	.word 0x8d902403  ! 3372: WRPR_PSTATE_I	wrpr	%r0, 0x0403, %pstate
	.word 0x8d902c4b  ! 3373: WRPR_PSTATE_I	wrpr	%r0, 0x0c4b, %pstate
	.word 0x8d802004  ! 3374: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd2d004a0  ! 3375: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r9
	.word 0x8d802004  ! 3376: WRFPRS_I	wr	%r0, 0x0004, %fprs
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x88812001  ! 3378: ADDcc_I	addcc 	%r4, 0x0001, %r4
	.word 0x93a1c9e0  ! 3379: FDIVq	dis not found

	mov 0x32, %r30
	.word 0x89d0001e  ! 3380: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x8e78400e  ! 3381: SDIV_R	sdiv 	%r1, %r14, %r7
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81982c11  ! 3384: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c11, %hpstate
	.word 0x32800001  ! 3385: BNE	bne,a	<label_0x1>
	.word 0xce0fc000  ! 3386: LDUB_R	ldub	[%r31 + %r0], %r7
	.word 0xce9004a0  ! 3387: LDUHA_R	lduha	[%r0, %r0] 0x25, %r7
	mov 0x32, %r30
	.word 0x81d0001e  ! 3388: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x8d902a8c  ! 3389: WRPR_PSTATE_I	wrpr	%r0, 0x0a8c, %pstate
	.word 0x93508000  ! 3390: RDPR_TSTATE	rdpr	%tstate, %r9
	.word 0x92db4004  ! 3391: SMULcc_R	smulcc 	%r13, %r4, %r9
	.word 0x81982ec0  ! 3392: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ec0, %hpstate
	.word 0x93a000cd  ! 3393: FNEGd	fnegd	%f44, %f40
	.word 0x8d902688  ! 3394: WRPR_PSTATE_I	wrpr	%r0, 0x0688, %pstate
	mov 0x30, %r30
	.word 0x9dd0001e  ! 3395: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	mov 0x33, %r30
	.word 0x97d0001e  ! 3396: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x81982f92  ! 3397: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f92, %hpstate
	.word 0xd317c000  ! 3398: LDQF_R	-	[%r31, %r0], %f9
	.word 0x98d2e001  ! 3399: UMULcc_I	umulcc 	%r11, 0x0001, %r12
	.word 0x85a28d23  ! 3400: FsMULd	fsmuld	%f10, %f34, %f2
	.word 0x8da289a5  ! 3401: FDIVs	fdivs	%f10, %f5, %f6
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8fd02035  ! 3403: Tcc_I	tvs	icc_or_xcc, %r0 + 53
	.word 0x9fd02034  ! 3404: Tcc_I	tvc	icc_or_xcc, %r0 + 52
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x24800001  ! 3406: BLE	ble,a	<label_0x1>
	.word 0x9448000f  ! 3407: MULX_R	mulx 	%r0, %r15, %r10
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x84804003  ! 3410: ADDcc_R	addcc 	%r1, %r3, %r2
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9051000f  ! 3412: UMUL_R	umul 	%r4, %r15, %r8
	.word 0x927b2001  ! 3413: SDIV_I	sdiv 	%r12, 0x0001, %r9
	.word 0x966a400b  ! 3414: UDIVX_R	udivx 	%r9, %r11, %r11
	.word 0xd737c00b  ! 3415: STQF_R	-	%f11, [%r11, %r31]
	.word 0xd6800b00  ! 3416: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r11
	.word 0x99500000  ! 3417: RDPR_TPC	rdpr	%tpc, %r12
	.word 0xd88008a0  ! 3418: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x81982691  ! 3419: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0691, %hpstate
	.word 0x8d902c9b  ! 3420: WRPR_PSTATE_I	wrpr	%r0, 0x0c9b, %pstate
	.word 0x9da01a66  ! 3421: FqTOi	fqtoi	
	.word 0x81982fd2  ! 3422: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd2, %hpstate
	.word 0x8d90205f  ! 3423: WRPR_PSTATE_I	wrpr	%r0, 0x005f, %pstate
	.word 0x9b6b2001  ! 3424: SDIVX_I	sdivx	%r12, 0x0001, %r13
DS_171:
	.word 0x34800001  ! 3426: BG	bg,a	<label_0x1>
	.word 0xd1312001  ! 3426: STQF_I	-	%f8, [0x0001, %r4]
	.word 0x99458000  ! 3425: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x34700001  ! 3426: BPG	<illegal instruction>
DS_172:
	.word 0x32800001  ! 3428: BNE	bne,a	<label_0x1>
	.word 0xd9332001  ! 3428: STQF_I	-	%f12, [0x0001, %r12]
	.word 0x8d458000  ! 3427: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0xcc5fe001  ! 3428: LDX_I	ldx	[%r31 + 0x0001], %r6
	.word 0xcc8008a0  ! 3429: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0xcd3fc006  ! 3430: STDF_R	std	%f6, [%r6, %r31]
	.word 0x8198229c  ! 3431: WRHPR_HPSTATE_I	wrhpr	%r0, 0x029c, %hpstate
	.word 0x8883e001  ! 3432: ADDcc_I	addcc 	%r15, 0x0001, %r4
	.word 0x87802088  ! 3433: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x81982245  ! 3434: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0245, %hpstate
	.word 0x8d9022c3  ! 3435: WRPR_PSTATE_I	wrpr	%r0, 0x02c3, %pstate
	.word 0xc927e001  ! 3436: STF_I	st	%f4, [0x0001, %r31]
	ta	T_CHANGE_PRIV	! macro
	mov 0x31, %r30
	.word 0x99d0001e  ! 3438: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x81a24d2c  ! 3439: FsMULd	fsmuld	%f9, %f12, %f0
	.word 0x8d802004  ! 3440: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x34800001  ! 3441: BG	bg,a	<label_0x1>
	.word 0xc08008a0  ! 3442: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0x8d9028d3  ! 3443: WRPR_PSTATE_I	wrpr	%r0, 0x08d3, %pstate
	.word 0xc08008a0  ! 3444: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0x81508000  ! 3445: RDPR_TSTATE	rdpr	%tstate, %r0
	.word 0x8d902e0e  ! 3446: WRPR_PSTATE_I	wrpr	%r0, 0x0e0e, %pstate
	.word 0x81982443  ! 3447: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0443, %hpstate
	.word 0xc08008a0  ! 3448: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
DS_173:
	.word 0x34800001  ! 3450: BG	bg,a	<label_0x1>
	.word 0xd530e001  ! 3450: STQF_I	-	%f10, [0x0001, %r3]
	.word 0x83458000  ! 3449: RD_SOFTINT_REG	rd	%softint, %r1
	.word 0x3a800001  ! 3450: BCC	bcc,a	<label_0x1>
	.word 0x8d802000  ! 3451: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982050  ! 3452: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0050, %hpstate
	.word 0x81982099  ! 3453: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0099, %hpstate
	.word 0x8d902e8e  ! 3454: WRPR_PSTATE_I	wrpr	%r0, 0x0e8e, %pstate
	.word 0xc2800b00  ! 3455: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r1
	ta	T_CHANGE_PRIV	! macro
	.word 0x904a800d  ! 3457: MULX_R	mulx 	%r10, %r13, %r8
	.word 0x96d0e001  ! 3458: UMULcc_I	umulcc 	%r3, 0x0001, %r11
	.word 0x81982d57  ! 3459: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d57, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902ec9  ! 3461: WRPR_PSTATE_I	wrpr	%r0, 0x0ec9, %pstate
	.word 0x20800001  ! 3462: BN	bn,a	<label_0x1>
	.word 0xd6800b00  ! 3463: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r11
	.word 0x81982e4e  ! 3464: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e4e, %hpstate
	.word 0x9fa109aa  ! 3465: FDIVs	fdivs	%f4, %f10, %f15
	.word 0x8f504000  ! 3466: RDPR_TNPC	rdpr	%tnpc, %r7
	.word 0x9bd02031  ! 3467: Tcc_I	tcc	icc_or_xcc, %r0 + 49
	.word 0xced804a0  ! 3468: LDXA_R	ldxa	[%r0, %r0] 0x25, %r7
	.word 0x8f514000  ! 3469: RDPR_TBA	rdpr	%tba, %r7
	.word 0x8ad04008  ! 3470: UMULcc_R	umulcc 	%r1, %r8, %r5
	.word 0xcb3fe001  ! 3471: STDF_I	std	%f5, [0x0001, %r31]
	.word 0xca5fe001  ! 3472: LDX_I	ldx	[%r31 + 0x0001], %r5
	.word 0xca8fe020  ! 3473: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r5
	.word 0x9fd02030  ! 3474: Tcc_I	tvc	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99d02033  ! 3476: Tcc_I	tgu	icc_or_xcc, %r0 + 51
DS_174:
	.word 0x22800001  ! 3478: BE	be,a	<label_0x1>
	.word 0xdf32800a  ! 3478: STQF_R	-	%f15, [%r10, %r10]
	.word 0x99458000  ! 3477: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x9fd02030  ! 3478: Tcc_I	tvc	icc_or_xcc, %r0 + 48
	.word 0xd89fe001  ! 3479: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r12
	.word 0xd8900e60  ! 3480: LDUHA_R	lduha	[%r0, %r0] 0x73, %r12
	mov 0x31, %r30
	.word 0x9fd0001e  ! 3481: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x8198211d  ! 3482: WRHPR_HPSTATE_I	wrhpr	%r0, 0x011d, %hpstate
	.word 0x8d902294  ! 3483: WRPR_PSTATE_I	wrpr	%r0, 0x0294, %pstate
DS_175:
	.word 0x34800001  ! 3485: BG	bg,a	<label_0x1>
	.word 0xcf300006  ! 3485: STQF_R	-	%f7, [%r6, %r0]
	.word 0x91458000  ! 3484: RD_SOFTINT_REG	rd	%softint, %r8
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8198248b  ! 3486: WRHPR_HPSTATE_I	wrhpr	%r0, 0x048b, %hpstate
	.word 0x81982a52  ! 3487: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a52, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d902c54  ! 3489: WRPR_PSTATE_I	wrpr	%r0, 0x0c54, %pstate
	.word 0x8d90220d  ! 3490: WRPR_PSTATE_I	wrpr	%r0, 0x020d, %pstate
	.word 0x8d802000  ! 3491: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x38700001  ! 3492: BPGU	<illegal instruction>
	.word 0xd0d00e80  ! 3493: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r8
	.word 0x819820da  ! 3494: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00da, %hpstate
DS_176:
	.word 0x34800001  ! 3496: BG	bg,a	<label_0x1>
	illtrap
	.word 0x95b34300  ! 3495: ALLIGNADDRESS	alignaddr	%r13, %r0, %r10
	.word 0xd537c000  ! 3496: STQF_R	-	%f10, [%r0, %r31]
	.word 0x87802089  ! 3497: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8bd02030  ! 3498: Tcc_I	tcs	icc_or_xcc, %r0 + 48
	.word 0x87802004  ! 3499: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x28700001  ! 3500: BPLEU	<illegal instruction>
	.word 0x95a00560  ! 3501: FSQRTq	fsqrt	
	mov 0x33, %r30
	.word 0x89d0001e  ! 3502: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x93d02030  ! 3503: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0xd4d004a0  ! 3504: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
	.word 0x81982440  ! 3505: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0440, %hpstate
	.word 0x9bd02034  ! 3506: Tcc_I	tcc	icc_or_xcc, %r0 + 52
	.word 0x81982cd4  ! 3507: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd4, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d902aca  ! 3509: WRPR_PSTATE_I	wrpr	%r0, 0x0aca, %pstate
	.word 0x8d902ec8  ! 3510: WRPR_PSTATE_I	wrpr	%r0, 0x0ec8, %pstate
	.word 0x95a24d25  ! 3511: FsMULd	fsmuld	%f9, %f36, %f10
	.word 0x9da0056a  ! 3512: FSQRTq	fsqrt	
	.word 0x9269c00f  ! 3513: UDIVX_R	udivx 	%r7, %r15, %r9
	.word 0x844bc000  ! 3514: MULX_R	mulx 	%r15, %r0, %r2
	.word 0x8d902a52  ! 3515: WRPR_PSTATE_I	wrpr	%r0, 0x0a52, %pstate
	.word 0x8d902e9a  ! 3516: WRPR_PSTATE_I	wrpr	%r0, 0x0e9a, %pstate
	.word 0x81982804  ! 3517: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0804, %hpstate
	.word 0x81982bc0  ! 3518: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc0, %hpstate
	.word 0x8350c000  ! 3519: RDPR_TT	rdpr	%tt, %r1
	.word 0x8c032001  ! 3520: ADD_I	add 	%r12, 0x0001, %r6
	.word 0xcccfe020  ! 3521: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r6
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d802004  ! 3523: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x87d02030  ! 3524: Tcc_I	tl	icc_or_xcc, %r0 + 48
	.word 0x81982a96  ! 3525: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a96, %hpstate
	.word 0x87802010  ! 3526: WRASI_I	wr	%r0, 0x0010, %asi
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9f50c000  ! 3529: RDPR_TT	rdpr	%tt, %r15
	.word 0xdfe7c020  ! 3530: CASA_I	casa	[%r31] 0x 1, %r0, %r15
	.word 0xde8008a0  ! 3531: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r15
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	mov 0x35, %r30
	.word 0x99d0001e  ! 3534: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0x89a249a4  ! 3536: FDIVs	fdivs	%f9, %f4, %f4
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81982e47  ! 3538: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e47, %hpstate
	mov 0x33, %r30
	.word 0x83d0001e  ! 3539: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xc84fe001  ! 3540: LDSB_I	ldsb	[%r31 + 0x0001], %r4
DS_177:
	.word 0x34800001  ! 3542: BG	bg,a	<label_0x1>
	.word 0xdf322001  ! 3542: STQF_I	-	%f15, [0x0001, %r8]
	.word 0x8b458000  ! 3541: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0x9f68a001  ! 3542: SDIVX_I	sdivx	%r2, 0x0001, %r15
	mov 0x32, %r30
	.word 0x95d0001e  ! 3543: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0xde8008a0  ! 3544: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r15
	.word 0x8d802000  ! 3545: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8da249c2  ! 3546: FDIVd	fdivd	%f40, %f2, %f6
	.word 0x34700001  ! 3547: BPG	<illegal instruction>
	.word 0x8d902a97  ! 3548: WRPR_PSTATE_I	wrpr	%r0, 0x0a97, %pstate
	.word 0x8198219f  ! 3549: WRHPR_HPSTATE_I	wrhpr	%r0, 0x019f, %hpstate
	.word 0xcc7fe001  ! 3550: SWAP_I	swap	%r6, [%r31 + 0x0001]
	.word 0x26800001  ! 3551: BL	bl,a	<label_0x1>
	mov 0x35, %r30
	.word 0x89d0001e  ! 3552: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x32800001  ! 3553: BNE	bne,a	<label_0x1>
DS_178:
	.word 0x22800001  ! 3555: BE	be,a	<label_0x1>
	illtrap
	.word 0x9db00300  ! 3554: ALLIGNADDRESS	alignaddr	%r0, %r0, %r14
	.word 0x93d02031  ! 3555: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x9fd02032  ! 3556: Tcc_I	tvc	icc_or_xcc, %r0 + 50
	.word 0x91a3c9cd  ! 3557: FDIVd	fdivd	%f46, %f44, %f8
	.word 0xd0c004a0  ! 3558: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r8
	.word 0x8950c000  ! 3559: RDPR_TT	rdpr	%tt, %r4
	.word 0x28800001  ! 3560: BLEU	bleu,a	<label_0x1>
	.word 0x8c692001  ! 3561: UDIVX_I	udivx 	%r4, 0x0001, %r6
	.word 0xcc8008a0  ! 3562: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x3c800001  ! 3563: BPOS	bpos,a	<label_0x1>
DS_179:
	.word 0x22800001  ! 3565: BE	be,a	<label_0x1>
	.word 0xc3326001  ! 3565: STQF_I	-	%f1, [0x0001, %r9]
	.word 0x99458000  ! 3564: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x81982f4e  ! 3565: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f4e, %hpstate
	.word 0x8d902adc  ! 3566: WRPR_PSTATE_I	wrpr	%r0, 0x0adc, %pstate
	.word 0x99a000c2  ! 3567: FNEGd	fnegd	%f2, %f12
	.word 0x8d902e06  ! 3568: WRPR_PSTATE_I	wrpr	%r0, 0x0e06, %pstate
	.word 0x80484004  ! 3569: MULX_R	mulx 	%r1, %r4, %r0
	.word 0x3c800001  ! 3570: BPOS	bpos,a	<label_0x1>
	.word 0x93d02033  ! 3571: Tcc_I	tne	icc_or_xcc, %r0 + 51
	mov 0x33, %r30
	.word 0x8bd0001e  ! 3572: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0xc0c7e000  ! 3573: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r0
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d802000  ! 3575: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x99d02031  ! 3576: Tcc_I	tgu	icc_or_xcc, %r0 + 49
	mov 0x35, %r30
	.word 0x9bd0001e  ! 3577: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 3578: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_PRIV	! macro
	.word 0x3e800001  ! 3580: BVC	bvc,a	<label_0x1>
	.word 0x8d902a86  ! 3581: WRPR_PSTATE_I	wrpr	%r0, 0x0a86, %pstate
	.word 0x87802010  ! 3582: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x8d902682  ! 3583: WRPR_PSTATE_I	wrpr	%r0, 0x0682, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8fa0c9a8  ! 3585: FDIVs	fdivs	%f3, %f8, %f7
	.word 0x956a2001  ! 3586: SDIVX_I	sdivx	%r8, 0x0001, %r10
	.word 0x8d902c8e  ! 3587: WRPR_PSTATE_I	wrpr	%r0, 0x0c8e, %pstate
	.word 0x3a800001  ! 3588: BCC	bcc,a	<label_0x1>
	.word 0xd4ffc028  ! 3589: SWAPA_R	swapa	%r10, [%r31 + %r8] 0x01
	.word 0x9d494000  ! 3590: RDHPR_HTBA	rdhpr	%htba, %r14
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9dd02032  ! 3592: Tcc_I	tpos	icc_or_xcc, %r0 + 50
	.word 0x85a2c9ca  ! 3593: FDIVd	fdivd	%f42, %f10, %f2
	.word 0x9c78a001  ! 3594: SDIV_I	sdiv 	%r2, 0x0001, %r14
	.word 0xdccfe030  ! 3595: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r14
	.word 0xdcd00e60  ! 3596: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r14
	mov 0x34, %r30
	.word 0x97d0001e  ! 3597: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	mov 0x32, %r30
	.word 0x89d0001e  ! 3598: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0x9603a001  ! 3600: ADD_I	add 	%r14, 0x0001, %r11
	.word 0x9f494000  ! 3601: RDHPR_HTBA	rdhpr	%htba, %r15
	.word 0x81982200  ! 3602: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0200, %hpstate
	.word 0xdeffc02a  ! 3603: SWAPA_R	swapa	%r15, [%r31 + %r10] 0x01
	mov 0x30, %r30
	.word 0x87d0001e  ! 3604: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0x947ae001  ! 3607: SDIV_I	sdiv 	%r11, 0x0001, %r10
	.word 0x81982050  ! 3608: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0050, %hpstate
	.word 0x8d902488  ! 3609: WRPR_PSTATE_I	wrpr	%r0, 0x0488, %pstate
	.word 0xd4dfe000  ! 3610: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r10
	ta	T_CHANGE_TO_TL0	! macro
	mov 0x31, %r30
	.word 0x93d0001e  ! 3612: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8198251e  ! 3613: WRHPR_HPSTATE_I	wrhpr	%r0, 0x051e, %hpstate
	.word 0x81982458  ! 3614: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0458, %hpstate
	.word 0x9751c000  ! 3615: RDPR_TL	rdpr	%tl, %r11
	.word 0x8ba109cf  ! 3616: FDIVd	fdivd	%f4, %f46, %f36
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xca3fc00f  ! 3618: STD_R	std	%r5, [%r31 + %r15]
	.word 0x8d802000  ! 3619: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xcb27e001  ! 3620: STF_I	st	%f5, [0x0001, %r31]
	.word 0x89d02033  ! 3621: Tcc_I	tleu	icc_or_xcc, %r0 + 51
	.word 0x81982d5b  ! 3622: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d5b, %hpstate
	.word 0xcad7e030  ! 3623: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r5
	.word 0xca8008a0  ! 3624: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0xcadfe030  ! 3625: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r5
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x87d02035  ! 3627: Tcc_I	tl	icc_or_xcc, %r0 + 53
	.word 0x81982b09  ! 3628: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b09, %hpstate
	.word 0xca800be0  ! 3629: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r5
	.word 0xcad7e000  ! 3630: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r5
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d802004  ! 3633: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x34800001  ! 3634: BG	bg,a	<label_0x1>
	.word 0x90804001  ! 3635: ADDcc_R	addcc 	%r1, %r1, %r8
	.word 0x2e800001  ! 3636: BVS	bvs,a	<label_0x1>
	.word 0x8b69c002  ! 3637: SDIVX_R	sdivx	%r7, %r2, %r5
	.word 0x81982d9d  ! 3638: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d9d, %hpstate
	.word 0x92482001  ! 3639: MULX_I	mulx 	%r0, 0x0001, %r9
	.word 0xd27fe001  ! 3640: SWAP_I	swap	%r9, [%r31 + 0x0001]
	.word 0xd2d7e010  ! 3641: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r9
	.word 0xd2d004a0  ! 3642: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r9
	.word 0xd20fc000  ! 3643: LDUB_R	ldub	[%r31 + %r0], %r9
DS_180:
	.word 0x22800001  ! 3645: BE	be,a	<label_0x1>
	illtrap
	.word 0x89b1830a  ! 3644: ALLIGNADDRESS	alignaddr	%r6, %r10, %r4
	.word 0x8d90264e  ! 3645: WRPR_PSTATE_I	wrpr	%r0, 0x064e, %pstate
	.word 0x9bd02033  ! 3646: Tcc_I	tcc	icc_or_xcc, %r0 + 51
	.word 0xc88804a0  ! 3647: LDUBA_R	lduba	[%r0, %r0] 0x25, %r4
	.word 0x80c26001  ! 3648: ADDCcc_I	addccc 	%r9, 0x0001, %r0
	.word 0x8451000e  ! 3649: UMUL_R	umul 	%r4, %r14, %r2
	.word 0x8d902a50  ! 3650: WRPR_PSTATE_I	wrpr	%r0, 0x0a50, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8da0c9cb  ! 3652: FDIVd	fdivd	%f34, %f42, %f6
	.word 0x96022001  ! 3653: ADD_I	add 	%r8, 0x0001, %r11
	.word 0xd6d004a0  ! 3654: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r11
	.word 0xd67fe001  ! 3655: SWAP_I	swap	%r11, [%r31 + 0x0001]
	.word 0x8d9026cf  ! 3656: WRPR_PSTATE_I	wrpr	%r0, 0x06cf, %pstate
	.word 0x85d02031  ! 3657: Tcc_I	tle	icc_or_xcc, %r0 + 49
	.word 0xd7e7c02b  ! 3658: CASA_I	casa	[%r31] 0x 1, %r11, %r11
DS_181:
	.word 0x32800001  ! 3660: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x83b28302  ! 3659: ALLIGNADDRESS	alignaddr	%r10, %r2, %r1
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d902486  ! 3662: WRPR_PSTATE_I	wrpr	%r0, 0x0486, %pstate
	.word 0x8d902019  ! 3663: WRPR_PSTATE_I	wrpr	%r0, 0x0019, %pstate
	.word 0x81982558  ! 3664: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0558, %hpstate
	.word 0x8d90269b  ! 3665: WRPR_PSTATE_I	wrpr	%r0, 0x069b, %pstate
	.word 0x8d902012  ! 3666: WRPR_PSTATE_I	wrpr	%r0, 0x0012, %pstate
	.word 0x8d802004  ! 3667: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x93514000  ! 3668: RDPR_TBA	rdpr	%tba, %r9
	mov 0x34, %r30
	.word 0x9fd0001e  ! 3669: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0xd2cfe020  ! 3670: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r9
	.word 0x8c4b6001  ! 3671: MULX_I	mulx 	%r13, 0x0001, %r6
	.word 0xccc7e010  ! 3672: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r6
	.word 0x8ba00543  ! 3673: FSQRTd	fsqrt	
	.word 0x8d902c1d  ! 3674: WRPR_PSTATE_I	wrpr	%r0, 0x0c1d, %pstate
	mov 0x33, %r30
	.word 0x81d0001e  ! 3675: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0xcac00e40  ! 3676: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r5
	.word 0x8fd02033  ! 3677: Tcc_I	tvs	icc_or_xcc, %r0 + 51
DS_182:
	.word 0x20800001  ! 3679: BN	bn,a	<label_0x1>
	illtrap
	.word 0x93b1c30f  ! 3678: ALLIGNADDRESS	alignaddr	%r7, %r15, %r9
	.word 0x8d902650  ! 3679: WRPR_PSTATE_I	wrpr	%r0, 0x0650, %pstate
	.word 0x81982fc2  ! 3680: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fc2, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d902c0a  ! 3682: WRPR_PSTATE_I	wrpr	%r0, 0x0c0a, %pstate
	.word 0x81982a1e  ! 3683: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a1e, %hpstate
	.word 0x8d902892  ! 3684: WRPR_PSTATE_I	wrpr	%r0, 0x0892, %pstate
	.word 0xd28008a0  ! 3685: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x926ae001  ! 3686: UDIVX_I	udivx 	%r11, 0x0001, %r9
	.word 0x24700001  ! 3687: BPLE	<illegal instruction>
	.word 0x8e6be001  ! 3688: UDIVX_I	udivx 	%r15, 0x0001, %r7
	ta	T_CHANGE_HPRIV	! macro
	.word 0xcec80e80  ! 3690: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r7
	ta	T_CHANGE_NONPRIV	! macro
	mov 0x35, %r30
	.word 0x9bd0001e  ! 3692: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0xce9fc020  ! 3693: LDDA_R	ldda	[%r31, %r0] 0x01, %r7
	.word 0x8bd02031  ! 3694: Tcc_I	tcs	icc_or_xcc, %r0 + 49
	.word 0x8d90201f  ! 3695: WRPR_PSTATE_I	wrpr	%r0, 0x001f, %pstate
	.word 0x2e700001  ! 3696: BPVS	<illegal instruction>
DS_183:
	.word 0x22800001  ! 3698: BE	be,a	<label_0x1>
	.word 0xc1336001  ! 3698: STQF_I	-	%f0, [0x0001, %r13]
	.word 0x83458000  ! 3697: RD_SOFTINT_REG	rd	%softint, %r1
	.word 0x3e800001  ! 3698: BVC	bvc,a	<label_0x1>
	.word 0x20800001  ! 3699: BN	bn,a	<label_0x1>
	.word 0xc327c00f  ! 3700: STF_R	st	%f1, [%r15, %r31]
	.word 0x9da000c6  ! 3701: FNEGd	fnegd	%f6, %f14
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	mov 0x32, %r30
	.word 0x91d0001e  ! 3704: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x97a189a1  ! 3705: FDIVs	fdivs	%f6, %f1, %f11
	.word 0xd69004a0  ! 3706: LDUHA_R	lduha	[%r0, %r0] 0x25, %r11
	.word 0x83a000c5  ! 3707: FNEGd	fnegd	%f36, %f32
	.word 0x8fd02035  ! 3708: Tcc_I	tvs	icc_or_xcc, %r0 + 53
	.word 0xc33fe001  ! 3709: STDF_I	std	%f1, [0x0001, %r31]
DS_184:
	.word 0x22800001  ! 3711: BE	be,a	<label_0x1>
	illtrap
	.word 0x83b2830f  ! 3710: ALLIGNADDRESS	alignaddr	%r10, %r15, %r1
	.word 0x8dd02033  ! 3711: Tcc_I	tneg	icc_or_xcc, %r0 + 51
	.word 0x966be001  ! 3712: UDIVX_I	udivx 	%r15, 0x0001, %r11
	.word 0x87802014  ! 3713: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xd6900e80  ! 3714: LDUHA_R	lduha	[%r0, %r0] 0x74, %r11
	.word 0x8d90265b  ! 3715: WRPR_PSTATE_I	wrpr	%r0, 0x065b, %pstate
	.word 0xd73fe001  ! 3716: STDF_I	std	%f11, [0x0001, %r31]
	.word 0xd63fe001  ! 3717: STD_I	std	%r11, [%r31 + 0x0001]
	mov 0x35, %r30
	.word 0x9fd0001e  ! 3718: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x81982447  ! 3719: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0447, %hpstate
	.word 0x9bd02035  ! 3720: Tcc_I	tcc	icc_or_xcc, %r0 + 53
	.word 0xd7e7c02f  ! 3721: CASA_I	casa	[%r31] 0x 1, %r15, %r11
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd6dfe000  ! 3723: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r11
	.word 0x907b4004  ! 3724: SDIV_R	sdiv 	%r13, %r4, %r8
	.word 0x81982d15  ! 3725: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d15, %hpstate
	.word 0x9668c000  ! 3726: UDIVX_R	udivx 	%r3, %r0, %r11
DS_185:
	.word 0x34800001  ! 3728: BG	bg,a	<label_0x1>
	illtrap
	.word 0x8bb2c301  ! 3727: ALLIGNADDRESS	alignaddr	%r11, %r1, %r5
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8ba00541  ! 3729: FSQRTd	fsqrt	
	.word 0x8c482001  ! 3730: MULX_I	mulx 	%r0, 0x0001, %r6
DS_186:
	.word 0x20800001  ! 3732: BN	bn,a	<label_0x1>
	illtrap
	.word 0x9db34302  ! 3731: ALLIGNADDRESS	alignaddr	%r13, %r2, %r14
	.word 0x81982699  ! 3732: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0699, %hpstate
	.word 0x9bd02030  ! 3733: Tcc_I	tcc	icc_or_xcc, %r0 + 48
	.word 0x81982019  ! 3734: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0019, %hpstate
DS_187:
	.word 0x20800001  ! 3736: BN	bn,a	<label_0x1>
	illtrap
	.word 0x8fb2c30d  ! 3735: ALLIGNADDRESS	alignaddr	%r11, %r13, %r7
	.word 0x8d902a13  ! 3736: WRPR_PSTATE_I	wrpr	%r0, 0x0a13, %pstate
	.word 0x9b6b0004  ! 3737: SDIVX_R	sdivx	%r12, %r4, %r13
	mov 0x31, %r30
	.word 0x8fd0001e  ! 3738: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0xdadfe010  ! 3739: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r13
	.word 0x87500000  ! 3740: RDPR_TPC	rdpr	%tpc, %r3
	mov 0x33, %r30
	.word 0x93d0001e  ! 3741: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x93a049ab  ! 3742: FDIVs	fdivs	%f1, %f11, %f9
	.word 0x8d9020d2  ! 3743: WRPR_PSTATE_I	wrpr	%r0, 0x00d2, %pstate
	ta	T_CHANGE_PRIV	! macro
DS_188:
	.word 0x20800001  ! 3746: BN	bn,a	<label_0x1>
	illtrap
	.word 0x8bb24304  ! 3745: ALLIGNADDRESS	alignaddr	%r9, %r4, %r5
	mov 0x31, %r30
	.word 0x89d0001e  ! 3746: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0xca9004a0  ! 3747: LDUHA_R	lduha	[%r0, %r0] 0x25, %r5
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xcac80e60  ! 3749: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r5
	.word 0xca7fe001  ! 3750: SWAP_I	swap	%r5, [%r31 + 0x0001]
	.word 0x2a700001  ! 3751: BPCS	<illegal instruction>
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8369e001  ! 3754: SDIVX_I	sdivx	%r7, 0x0001, %r1
	mov 0x32, %r30
	.word 0x99d0001e  ! 3755: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x8da00560  ! 3756: FSQRTq	fsqrt	
	.word 0x93500000  ! 3757: RDPR_TPC	rdpr	%tpc, %r9
	.word 0x81982680  ! 3758: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0680, %hpstate
	.word 0xd2cfe030  ! 3759: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r9
	.word 0x9dd02030  ! 3760: Tcc_I	tpos	icc_or_xcc, %r0 + 48
	.word 0x83514000  ! 3761: RDPR_TBA	rdpr	%tba, %r1
	.word 0x97d02033  ! 3762: Tcc_I	tge	icc_or_xcc, %r0 + 51
	.word 0xc2900e40  ! 3763: LDUHA_R	lduha	[%r0, %r0] 0x72, %r1
	.word 0x8d902404  ! 3764: WRPR_PSTATE_I	wrpr	%r0, 0x0404, %pstate
	.word 0x3c700001  ! 3765: BPPOS	<illegal instruction>
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba0054c  ! 3767: FSQRTd	fsqrt	
	.word 0xdad004a0  ! 3768: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r13
	mov 0x30, %r30
	.word 0x8fd0001e  ! 3769: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b50c000  ! 3771: RDPR_TT	rdpr	%tt, %r13
	.word 0x8d9022dd  ! 3772: WRPR_PSTATE_I	wrpr	%r0, 0x02dd, %pstate
DS_189:
	.word 0x34800001  ! 3774: BG	bg,a	<label_0x1>
	.word 0xd5322001  ! 3774: STQF_I	-	%f10, [0x0001, %r8]
	.word 0x89458000  ! 3773: RD_SOFTINT_REG	rd	%softint, %r4
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902acb  ! 3776: WRPR_PSTATE_I	wrpr	%r0, 0x0acb, %pstate
	.word 0x87802089  ! 3777: WRASI_I	wr	%r0, 0x0089, %asi
	mov 0x35, %r30
	.word 0x99d0001e  ! 3778: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x9dd02033  ! 3779: Tcc_I	tpos	icc_or_xcc, %r0 + 51
	.word 0x87802089  ! 3780: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xc80fe001  ! 3781: LDUB_I	ldub	[%r31 + 0x0001], %r4
	.word 0x8d902494  ! 3782: WRPR_PSTATE_I	wrpr	%r0, 0x0494, %pstate
	.word 0x24800001  ! 3783: BLE	ble,a	<label_0x1>
	.word 0x8d902e87  ! 3784: WRPR_PSTATE_I	wrpr	%r0, 0x0e87, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x87802088  ! 3786: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x24800001  ! 3787: BLE	ble,a	<label_0x1>
	.word 0x8d802000  ! 3788: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9ed80009  ! 3789: SMULcc_R	smulcc 	%r0, %r9, %r15
	.word 0x9fd02034  ! 3790: Tcc_I	tvc	icc_or_xcc, %r0 + 52
	.word 0x3a800001  ! 3791: BCC	bcc,a	<label_0x1>
	.word 0x884be001  ! 3792: MULX_I	mulx 	%r15, 0x0001, %r4
	.word 0x91500000  ! 3793: RDPR_TPC	rdpr	%tpc, %r8
	.word 0xd02fe001  ! 3794: STB_I	stb	%r8, [%r31 + 0x0001]
	.word 0x97d02034  ! 3795: Tcc_I	tge	icc_or_xcc, %r0 + 52
	mov 0x33, %r30
	.word 0x85d0001e  ! 3796: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x30800001  ! 3797: BA	ba,a	<label_0x1>
	.word 0x81982493  ! 3798: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0493, %hpstate
	.word 0x97500000  ! 3799: RDPR_TPC	rdpr	%tpc, %r11
	.word 0x87802016  ! 3800: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x89d02034  ! 3801: Tcc_I	tleu	icc_or_xcc, %r0 + 52
	.word 0x8d9022ce  ! 3802: WRPR_PSTATE_I	wrpr	%r0, 0x02ce, %pstate
	.word 0xd68008a0  ! 3803: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x8d9028da  ! 3804: WRPR_PSTATE_I	wrpr	%r0, 0x08da, %pstate
	.word 0x87802016  ! 3805: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8d902a4d  ! 3806: WRPR_PSTATE_I	wrpr	%r0, 0x0a4d, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x95d02031  ! 3808: Tcc_I	tg	icc_or_xcc, %r0 + 49
	.word 0x8d902e44  ! 3809: WRPR_PSTATE_I	wrpr	%r0, 0x0e44, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d802000  ! 3811: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd677c009  ! 3812: STX_R	stx	%r11, [%r31 + %r9]
DS_190:
	.word 0x20800001  ! 3814: BN	bn,a	<label_0x1>
	illtrap
	.word 0x83b2430b  ! 3813: ALLIGNADDRESS	alignaddr	%r9, %r11, %r1
	.word 0x9ba00541  ! 3814: FSQRTd	fsqrt	
	.word 0x819825c3  ! 3815: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05c3, %hpstate
	mov 0x32, %r30
	.word 0x83d0001e  ! 3816: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xdac004a0  ! 3817: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
	.word 0x84d2000e  ! 3818: UMULcc_R	umulcc 	%r8, %r14, %r2
	.word 0x96d9800d  ! 3819: SMULcc_R	smulcc 	%r6, %r13, %r11
	mov 0x32, %r30
	.word 0x8bd0001e  ! 3820: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0xd737e001  ! 3821: STQF_I	-	%f11, [0x0001, %r31]
	.word 0x964b2001  ! 3822: MULX_I	mulx 	%r12, 0x0001, %r11
	mov 0x35, %r30
	.word 0x95d0001e  ! 3823: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x81982193  ! 3825: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0193, %hpstate
	.word 0x8d9028d6  ! 3826: WRPR_PSTATE_I	wrpr	%r0, 0x08d6, %pstate
	.word 0x87a000c8  ! 3827: FNEGd	fnegd	%f8, %f34
	.word 0x819825c5  ! 3828: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05c5, %hpstate
	.word 0x83d02031  ! 3829: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0xc69004a0  ! 3830: LDUHA_R	lduha	[%r0, %r0] 0x25, %r3
	.word 0xc607c000  ! 3831: LDUW_R	lduw	[%r31 + %r0], %r3
	.word 0x8d902ad6  ! 3832: WRPR_PSTATE_I	wrpr	%r0, 0x0ad6, %pstate
	.word 0x8d9024db  ! 3833: WRPR_PSTATE_I	wrpr	%r0, 0x04db, %pstate
	.word 0x8d90289f  ! 3834: WRPR_PSTATE_I	wrpr	%r0, 0x089f, %pstate
	.word 0x87802080  ! 3835: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x90528004  ! 3836: UMUL_R	umul 	%r10, %r4, %r8
	.word 0xd04fe001  ! 3837: LDSB_I	ldsb	[%r31 + 0x0001], %r8
	.word 0x9b480000  ! 3838: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
	.word 0x8d902449  ! 3839: WRPR_PSTATE_I	wrpr	%r0, 0x0449, %pstate
	.word 0x95508000  ! 3840: RDPR_TSTATE	rdpr	%tstate, %r10
	.word 0xd4dfe000  ! 3841: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r10
	.word 0x806a0003  ! 3842: UDIVX_R	udivx 	%r8, %r3, %r0
	.word 0xc0d004a0  ! 3843: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r0
	.word 0x81982adf  ! 3844: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0adf, %hpstate
	.word 0xc09004a0  ! 3845: LDUHA_R	lduha	[%r0, %r0] 0x25, %r0
	.word 0x8d480000  ! 3846: RDHPR_HPSTATE	rdhpr	%hpstate, %r6
	.word 0xccc804a0  ! 3847: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r6
	.word 0x8d90200c  ! 3848: WRPR_PSTATE_I	wrpr	%r0, 0x000c, %pstate
	.word 0x8cd18005  ! 3849: UMULcc_R	umulcc 	%r6, %r5, %r6
	.word 0x9dd02034  ! 3850: Tcc_I	tpos	icc_or_xcc, %r0 + 52
	.word 0x9ba38dcb  ! 3851: FdMULq	fdmulq	
	.word 0x8d90244e  ! 3852: WRPR_PSTATE_I	wrpr	%r0, 0x044e, %pstate
	.word 0x8d902492  ! 3853: WRPR_PSTATE_I	wrpr	%r0, 0x0492, %pstate
	.word 0x81982881  ! 3854: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0881, %hpstate
	.word 0x8198239d  ! 3855: WRHPR_HPSTATE_I	wrhpr	%r0, 0x039d, %hpstate
	.word 0x87802089  ! 3856: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xda800c60  ! 3857: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r13
DS_191:
	.word 0x34800001  ! 3859: BG	bg,a	<label_0x1>
	illtrap
	.word 0x97b0c30a  ! 3858: ALLIGNADDRESS	alignaddr	%r3, %r10, %r11
	ta	T_CHANGE_PRIV	! macro
	.word 0x8198284b  ! 3860: WRHPR_HPSTATE_I	wrhpr	%r0, 0x084b, %hpstate
	.word 0x8198268b  ! 3861: WRHPR_HPSTATE_I	wrhpr	%r0, 0x068b, %hpstate
	.word 0x8d802004  ! 3862: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x93d02031  ! 3863: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x8b480000  ! 3864: RDHPR_HPSTATE	rdhpr	%hpstate, %r5
	.word 0xcbe7c02a  ! 3865: CASA_I	casa	[%r31] 0x 1, %r10, %r5
	.word 0x8ba2cdc3  ! 3866: FdMULq	fdmulq	
	.word 0x81982654  ! 3867: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0654, %hpstate
	.word 0x81982a8a  ! 3868: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a8a, %hpstate
	.word 0x98d10009  ! 3869: UMULcc_R	umulcc 	%r4, %r9, %r12
	.word 0x8d902a59  ! 3870: WRPR_PSTATE_I	wrpr	%r0, 0x0a59, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d902e84  ! 3872: WRPR_PSTATE_I	wrpr	%r0, 0x0e84, %pstate
	.word 0x87802080  ! 3873: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x8da01a66  ! 3874: FqTOi	fqtoi	
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xcc9004a0  ! 3876: LDUHA_R	lduha	[%r0, %r0] 0x25, %r6
	.word 0x9fa0056e  ! 3877: FSQRTq	fsqrt	
	.word 0x81982705  ! 3878: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0705, %hpstate
	.word 0xdeffc02e  ! 3879: SWAPA_R	swapa	%r15, [%r31 + %r14] 0x01
	.word 0x8198244c  ! 3880: WRHPR_HPSTATE_I	wrhpr	%r0, 0x044c, %hpstate
	.word 0x8d902895  ! 3881: WRPR_PSTATE_I	wrpr	%r0, 0x0895, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x2e800001  ! 3883: BVS	bvs,a	<label_0x1>
	.word 0x89480000  ! 3884: RDHPR_HPSTATE	rdhpr	%hpstate, %r4
	.word 0x8d902491  ! 3885: WRPR_PSTATE_I	wrpr	%r0, 0x0491, %pstate
DS_192:
	.word 0x22800001  ! 3887: BE	be,a	<label_0x1>
	.word 0xdb31800c  ! 3887: STQF_R	-	%f13, [%r12, %r6]
	.word 0x89458000  ! 3886: RD_SOFTINT_REG	rd	%softint, %r4
	.word 0x81982709  ! 3887: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0709, %hpstate
	.word 0xc87fe001  ! 3888: SWAP_I	swap	%r4, [%r31 + 0x0001]
	.word 0x9f6a8007  ! 3889: SDIVX_R	sdivx	%r10, %r7, %r15
	.word 0x85d02032  ! 3890: Tcc_I	tle	icc_or_xcc, %r0 + 50
	.word 0x84482001  ! 3891: MULX_I	mulx 	%r0, 0x0001, %r2
	.word 0x83d02032  ! 3892: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0xc48008a0  ! 3893: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x81982d48  ! 3894: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d48, %hpstate
DS_193:
	.word 0x34800001  ! 3896: BG	bg,a	<label_0x1>
	illtrap
	.word 0x9fb2c30f  ! 3895: ALLIGNADDRESS	alignaddr	%r11, %r15, %r15
	.word 0x9ba089e2  ! 3896: FDIVq	dis not found

	.word 0x8d902ec7  ! 3897: WRPR_PSTATE_I	wrpr	%r0, 0x0ec7, %pstate
	.word 0xda9004a0  ! 3898: LDUHA_R	lduha	[%r0, %r0] 0x25, %r13
	.word 0x26800001  ! 3899: BL	bl,a	<label_0x1>
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a0056b  ! 3901: FSQRTq	fsqrt	
	.word 0x38700001  ! 3902: BPGU	<illegal instruction>
	.word 0x91d02032  ! 3903: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8dd02032  ! 3904: Tcc_I	tneg	icc_or_xcc, %r0 + 50
	.word 0x8d802000  ! 3905: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982943  ! 3906: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0943, %hpstate
	.word 0x96026001  ! 3907: ADD_I	add 	%r9, 0x0001, %r11
	.word 0x93a0cd2a  ! 3908: FsMULd	fsmuld	%f3, %f10, %f40
	.word 0x87802004  ! 3909: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x91d02030  ! 3910: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x836ae001  ! 3911: SDIVX_I	sdivx	%r11, 0x0001, %r1
	.word 0x98798005  ! 3912: SDIV_R	sdiv 	%r6, %r5, %r12
	.word 0xd8cfe010  ! 3913: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r12
	.word 0x9282e001  ! 3914: ADDcc_I	addcc 	%r11, 0x0001, %r9
	ta	T_CHANGE_HPRIV	! macro
	.word 0x85d02031  ! 3916: Tcc_I	tle	icc_or_xcc, %r0 + 49
	.word 0xd297e000  ! 3917: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r9
	.word 0x8d802000  ! 3918: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x99a00564  ! 3919: FSQRTq	fsqrt	
	.word 0x819826d7  ! 3920: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06d7, %hpstate
	.word 0xd837c004  ! 3921: STH_R	sth	%r12, [%r31 + %r4]
	.word 0x8ba38dc5  ! 3922: FdMULq	fdmulq	
	.word 0xcb3fc005  ! 3923: STDF_R	std	%f5, [%r5, %r31]
	.word 0x93d02033  ! 3924: Tcc_I	tne	icc_or_xcc, %r0 + 51
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9f68000b  ! 3926: SDIVX_R	sdivx	%r0, %r11, %r15
	.word 0x8ba01a62  ! 3927: FqTOi	fqtoi	
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0x95a01a6f  ! 3931: FqTOi	fqtoi	
	.word 0x9278a001  ! 3932: SDIV_I	sdiv 	%r2, 0x0001, %r9
	.word 0x8d802004  ! 3933: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd28fe010  ! 3934: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r9
	.word 0xd29fe001  ! 3935: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r9
	ta	T_CHANGE_PRIV	! macro
	.word 0x81508000  ! 3937: RDPR_TSTATE	rdpr	%tstate, %r0
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d802000  ! 3939: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc047c000  ! 3940: LDSW_R	ldsw	[%r31 + %r0], %r0
	ta	T_CHANGE_HPRIV	! macro
DS_194:
	.word 0x22800001  ! 3943: BE	be,a	<label_0x1>
	.word 0xc3300002  ! 3943: STQF_R	-	%f1, [%r2, %r0]
	.word 0x99458000  ! 3942: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x90520007  ! 3943: UMUL_R	umul 	%r8, %r7, %r8
	.word 0x38800001  ! 3944: BGU	bgu,a	<label_0x1>
	.word 0x8dd02031  ! 3945: Tcc_I	tneg	icc_or_xcc, %r0 + 49
DS_195:
	.word 0x22800001  ! 3947: BE	be,a	<label_0x1>
	illtrap
	.word 0x95b24301  ! 3946: ALLIGNADDRESS	alignaddr	%r9, %r1, %r10
	.word 0x819823c4  ! 3947: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03c4, %hpstate
	.word 0x8d902212  ! 3948: WRPR_PSTATE_I	wrpr	%r0, 0x0212, %pstate
	.word 0x9369e001  ! 3949: SDIVX_I	sdivx	%r7, 0x0001, %r9
	.word 0xd28fe000  ! 3950: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r9
	.word 0x887b6001  ! 3951: SDIV_I	sdiv 	%r13, 0x0001, %r4
	.word 0xc8dfe010  ! 3952: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r4
	.word 0x8d902c5d  ! 3953: WRPR_PSTATE_I	wrpr	%r0, 0x0c5d, %pstate
	.word 0xc81fc000  ! 3954: LDD_R	ldd	[%r31 + %r0], %r4
	.word 0xc837e001  ! 3955: STH_I	sth	%r4, [%r31 + 0x0001]
	.word 0xc8dfe020  ! 3956: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r4
	.word 0x8a69800c  ! 3957: UDIVX_R	udivx 	%r6, %r12, %r5
	.word 0x3e800001  ! 3958: BVC	bvc,a	<label_0x1>
	.word 0xca8804a0  ! 3959: LDUBA_R	lduba	[%r0, %r0] 0x25, %r5
	.word 0x8d802000  ! 3960: WRFPRS_I	wr	%r0, 0x0000, %fprs
	mov 0x33, %r30
	.word 0x93d0001e  ! 3961: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x91514000  ! 3962: RDPR_TBA	rdpr	%tba, %r8
	.word 0x8fa189e2  ! 3963: FDIVq	dis not found

	.word 0x8d902082  ! 3964: WRPR_PSTATE_I	wrpr	%r0, 0x0082, %pstate
	.word 0x9451c00f  ! 3965: UMUL_R	umul 	%r7, %r15, %r10
DS_196:
	.word 0x20800001  ! 3967: BN	bn,a	<label_0x1>
	.word 0xdd326001  ! 3967: STQF_I	-	%f14, [0x0001, %r9]
	.word 0x9b458000  ! 3966: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x8d90221d  ! 3967: WRPR_PSTATE_I	wrpr	%r0, 0x021d, %pstate
	.word 0x8d902c02  ! 3968: WRPR_PSTATE_I	wrpr	%r0, 0x0c02, %pstate
DS_197:
	.word 0x22800001  ! 3970: BE	be,a	<label_0x1>
	.word 0xdf324006  ! 3970: STQF_R	-	%f15, [%r6, %r9]
	.word 0x81458000  ! 3969: RD_SOFTINT_REG	stbar
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc057c000  ! 3971: LDSH_R	ldsh	[%r31 + %r0], %r0
	.word 0xc127c006  ! 3972: STF_R	st	%f0, [%r6, %r31]
	.word 0x81982e0d  ! 3973: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e0d, %hpstate
	.word 0xc09004a0  ! 3974: LDUHA_R	lduha	[%r0, %r0] 0x25, %r0
	.word 0x936ae001  ! 3975: SDIVX_I	sdivx	%r11, 0x0001, %r9
	.word 0x81982a41  ! 3976: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a41, %hpstate
	.word 0xd217e001  ! 3977: LDUH_I	lduh	[%r31 + 0x0001], %r9
	.word 0xd297e010  ! 3978: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r9
	.word 0x81982008  ! 3979: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0008, %hpstate
	.word 0x819829d9  ! 3980: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d9, %hpstate
	.word 0x8ed9800d  ! 3981: SMULcc_R	smulcc 	%r6, %r13, %r7
	.word 0x9ba000ce  ! 3982: FNEGd	fnegd	%f14, %f44
	.word 0x8d802000  ! 3983: WRFPRS_I	wr	%r0, 0x0000, %fprs
	mov 0x30, %r30
	.word 0x91d0001e  ! 3984: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x819821ce  ! 3986: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01ce, %hpstate
	.word 0x866ba001  ! 3987: UDIVX_I	udivx 	%r14, 0x0001, %r3
	.word 0x81982ad9  ! 3988: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad9, %hpstate
	.word 0xc68804a0  ! 3989: LDUBA_R	lduba	[%r0, %r0] 0x25, %r3
	.word 0xc6d004a0  ! 3990: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r3
	.word 0xc6d80e40  ! 3991: LDXA_R	ldxa	[%r0, %r0] 0x72, %r3
	.word 0x8480400c  ! 3992: ADDcc_R	addcc 	%r1, %r12, %r2
	.word 0x8198231d  ! 3993: WRHPR_HPSTATE_I	wrhpr	%r0, 0x031d, %hpstate
	.word 0xc4ffc02c  ! 3994: SWAPA_R	swapa	%r2, [%r31 + %r12] 0x01
	.word 0x9750c000  ! 3995: RDPR_TT	rdpr	%tt, %r11
	.word 0x9da089a5  ! 3996: FDIVs	fdivs	%f2, %f5, %f14
	.word 0xdccfe010  ! 3997: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r14
	.word 0x93d02031  ! 3998: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x81982194  ! 3999: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0194, %hpstate
	.word 0x8d802004  ! 4000: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x81982911  ! 4001: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0911, %hpstate
	.word 0x89d02034  ! 4002: Tcc_I	tleu	icc_or_xcc, %r0 + 52
	.word 0xdde7c025  ! 4003: CASA_I	casa	[%r31] 0x 1, %r5, %r14
	.word 0xdc17c000  ! 4004: LDUH_R	lduh	[%r31 + %r0], %r14
	ta	T_CHANGE_PRIV	! macro
	.word 0x8c6ac000  ! 4006: UDIVX_R	udivx 	%r11, %r0, %r6
DS_198:
	.word 0x32800001  ! 4008: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x85b38300  ! 4007: ALLIGNADDRESS	alignaddr	%r14, %r0, %r2
DS_199:
	.word 0x22800001  ! 4009: BE	be,a	<label_0x1>
	illtrap
	.word 0x8db2c30a  ! 4008: ALLIGNADDRESS	alignaddr	%r11, %r10, %r6
	.word 0xccd80e40  ! 4009: LDXA_R	ldxa	[%r0, %r0] 0x72, %r6
DS_200:
	.word 0x32800001  ! 4011: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x81b2c30c  ! 4010: ALLIGNADDRESS	alignaddr	%r11, %r12, %r0
	.word 0x8c6a2001  ! 4011: UDIVX_I	udivx 	%r8, 0x0001, %r6
	.word 0x8d902249  ! 4012: WRPR_PSTATE_I	wrpr	%r0, 0x0249, %pstate
	.word 0x8d902a43  ! 4013: WRPR_PSTATE_I	wrpr	%r0, 0x0a43, %pstate
DS_201:
	.word 0x22800001  ! 4015: BE	be,a	<label_0x1>
	.word 0xd5320008  ! 4015: STQF_R	-	%f10, [%r8, %r8]
	.word 0x87458000  ! 4014: RD_SOFTINT_REG	rd	%softint, %r3
	.word 0x8d802004  ! 4015: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d9022de  ! 4016: WRPR_PSTATE_I	wrpr	%r0, 0x02de, %pstate
	.word 0xc68008a0  ! 4017: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0xc68008a0  ! 4018: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x8198258d  ! 4019: WRHPR_HPSTATE_I	wrhpr	%r0, 0x058d, %hpstate
	.word 0x81982fdd  ! 4020: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fdd, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d90260b  ! 4022: WRPR_PSTATE_I	wrpr	%r0, 0x060b, %pstate
	.word 0x819828dc  ! 4023: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08dc, %hpstate
	.word 0xc697e030  ! 4024: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r3
DS_202:
	.word 0x32800001  ! 4026: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x8db24303  ! 4025: ALLIGNADDRESS	alignaddr	%r9, %r3, %r6
	.word 0x8d802000  ! 4026: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xcc77e001  ! 4027: STX_I	stx	%r6, [%r31 + 0x0001]
	.word 0x8bd02032  ! 4028: Tcc_I	tcs	icc_or_xcc, %r0 + 50
	.word 0x87d02035  ! 4029: Tcc_I	tl	icc_or_xcc, %r0 + 53
	.word 0x81982d4b  ! 4030: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d4b, %hpstate
	.word 0x867a8002  ! 4031: SDIV_R	sdiv 	%r10, %r2, %r3
DS_203:
	.word 0x34800001  ! 4033: BG	bg,a	<label_0x1>
	.word 0xd9326001  ! 4033: STQF_I	-	%f12, [0x0001, %r9]
	.word 0x8f458000  ! 4032: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0x87802080  ! 4033: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xcfe7c022  ! 4034: CASA_I	casa	[%r31] 0x 1, %r2, %r7
	.word 0x8d902656  ! 4035: WRPR_PSTATE_I	wrpr	%r0, 0x0656, %pstate
	.word 0x89a30d20  ! 4036: FsMULd	fsmuld	%f12, %f0, %f4
	.word 0x24700001  ! 4037: BPLE	<illegal instruction>
	mov 0x35, %r30
	.word 0x87d0001e  ! 4038: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x9fa00543  ! 4039: FSQRTd	fsqrt	
	.word 0x8dd02035  ! 4040: Tcc_I	tneg	icc_or_xcc, %r0 + 53
	.word 0x8fd02031  ! 4041: Tcc_I	tvs	icc_or_xcc, %r0 + 49
	.word 0xded004a0  ! 4042: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r15
	.word 0x96d02001  ! 4043: UMULcc_I	umulcc 	%r0, 0x0001, %r11
	.word 0x3a800001  ! 4044: BCC	bcc,a	<label_0x1>
	.word 0x91494000  ! 4045: RDHPR_HTBA	rdhpr	%htba, %r8
	.word 0x8d902e40  ! 4046: WRPR_PSTATE_I	wrpr	%r0, 0x0e40, %pstate
	.word 0x81a189e4  ! 4047: FDIVq	dis not found

	.word 0x8d9026d6  ! 4048: WRPR_PSTATE_I	wrpr	%r0, 0x06d6, %pstate
	.word 0x81982917  ! 4049: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0917, %hpstate
	.word 0x8d9020d0  ! 4050: WRPR_PSTATE_I	wrpr	%r0, 0x00d0, %pstate
	.word 0xc08008a0  ! 4051: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0x8b684004  ! 4052: SDIVX_R	sdivx	%r1, %r4, %r5
	mov 0x34, %r30
	.word 0x81d0001e  ! 4053: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0xcaffc024  ! 4054: SWAPA_R	swapa	%r5, [%r31 + %r4] 0x01
	.word 0x87802004  ! 4055: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x9849800b  ! 4056: MULX_R	mulx 	%r6, %r11, %r12
	.word 0x8d902098  ! 4057: WRPR_PSTATE_I	wrpr	%r0, 0x0098, %pstate
	.word 0x8d902485  ! 4058: WRPR_PSTATE_I	wrpr	%r0, 0x0485, %pstate
	.word 0x9ba00dc5  ! 4059: FdMULq	fdmulq	
	.word 0x81982680  ! 4060: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0680, %hpstate
	.word 0x81494000  ! 4061: RDHPR_HTBA	rdhpr	%htba, %r0
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9d504000  ! 4063: RDPR_TNPC	rdpr	%tnpc, %r14
	.word 0x87802016  ! 4064: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x81982c45  ! 4065: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c45, %hpstate
	.word 0x8cc2a001  ! 4066: ADDCcc_I	addccc 	%r10, 0x0001, %r6
	.word 0x9fd02032  ! 4067: Tcc_I	tvc	icc_or_xcc, %r0 + 50
	.word 0x30700001  ! 4068: BPA	<illegal instruction>
	.word 0x81982593  ! 4069: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0593, %hpstate
	.word 0x8d902658  ! 4070: WRPR_PSTATE_I	wrpr	%r0, 0x0658, %pstate
	.word 0x8d802000  ! 4071: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982b9c  ! 4072: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b9c, %hpstate
	.word 0x9dd02033  ! 4073: Tcc_I	tpos	icc_or_xcc, %r0 + 51
	.word 0x9b480000  ! 4074: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
	.word 0x22700001  ! 4075: BPE	<illegal instruction>
	.word 0x87802089  ! 4076: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8a53c003  ! 4077: UMUL_R	umul 	%r15, %r3, %r5
	.word 0xca0fe001  ! 4078: LDUB_I	ldub	[%r31 + 0x0001], %r5
	mov 0x33, %r30
	.word 0x9bd0001e  ! 4079: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x98002001  ! 4080: ADD_I	add 	%r0, 0x0001, %r12
	.word 0x8d802000  ! 4081: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93a00561  ! 4082: FSQRTq	fsqrt	
	.word 0xd327e001  ! 4083: STF_I	st	%f9, [0x0001, %r31]
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xd237c001  ! 4085: STH_R	sth	%r9, [%r31 + %r1]
	.word 0x87480000  ! 4086: RDHPR_HPSTATE	rdhpr	%hpstate, %r3
	.word 0xc68008a0  ! 4087: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x85d02031  ! 4088: Tcc_I	tle	icc_or_xcc, %r0 + 49
	.word 0x81982912  ! 4089: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0912, %hpstate
	.word 0xc68008a0  ! 4090: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0xc737c001  ! 4091: STQF_R	-	%f3, [%r1, %r31]
	.word 0x8d902444  ! 4092: WRPR_PSTATE_I	wrpr	%r0, 0x0444, %pstate
	.word 0x87802004  ! 4093: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x97514000  ! 4094: RDPR_TBA	rdpr	%tba, %r11
	.word 0xd6d7e000  ! 4095: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r11
	.word 0x8d902cd2  ! 4096: WRPR_PSTATE_I	wrpr	%r0, 0x0cd2, %pstate
	.word 0xd6c00e80  ! 4097: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r11
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x96814000  ! 4099: ADDcc_R	addcc 	%r5, %r0, %r11
	.word 0x8d90244b  ! 4100: WRPR_PSTATE_I	wrpr	%r0, 0x044b, %pstate
	.word 0x8d90221b  ! 4101: WRPR_PSTATE_I	wrpr	%r0, 0x021b, %pstate
	.word 0xd68804a0  ! 4102: LDUBA_R	lduba	[%r0, %r0] 0x25, %r11
	.word 0xd69004a0  ! 4103: LDUHA_R	lduha	[%r0, %r0] 0x25, %r11
	.word 0x8ba309e6  ! 4104: FDIVq	dis not found

	.word 0x20800001  ! 4105: BN	bn,a	<label_0x1>
	.word 0xca4fc000  ! 4106: LDSB_R	ldsb	[%r31 + %r0], %r5
	.word 0x8d9026c9  ! 4107: WRPR_PSTATE_I	wrpr	%r0, 0x06c9, %pstate
	.word 0xcaffc026  ! 4108: SWAPA_R	swapa	%r5, [%r31 + %r6] 0x01
	.word 0x88c12001  ! 4109: ADDCcc_I	addccc 	%r4, 0x0001, %r4
	mov 0x31, %r30
	.word 0x81d0001e  ! 4110: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0xc8d804a0  ! 4111: LDXA_R	ldxa	[%r0, %r0] 0x25, %r4
	.word 0x8d902219  ! 4112: WRPR_PSTATE_I	wrpr	%r0, 0x0219, %pstate
	.word 0x81982481  ! 4113: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0481, %hpstate
	.word 0xc82fe001  ! 4114: STB_I	stb	%r4, [%r31 + 0x0001]
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x85480000  ! 4116: RDHPR_HPSTATE	rdhpr	%hpstate, %r2
	.word 0x97d02033  ! 4117: Tcc_I	tge	icc_or_xcc, %r0 + 51
DS_204:
	.word 0x32800001  ! 4119: BNE	bne,a	<label_0x1>
	.word 0xdd308002  ! 4119: STQF_R	-	%f14, [%r2, %r2]
	.word 0x9f458000  ! 4118: RD_SOFTINT_REG	rd	%softint, %r15
	.word 0x8d902a51  ! 4119: WRPR_PSTATE_I	wrpr	%r0, 0x0a51, %pstate
	.word 0xdec804a0  ! 4120: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r15
	.word 0x8d902c12  ! 4121: WRPR_PSTATE_I	wrpr	%r0, 0x0c12, %pstate
	.word 0x8d90249e  ! 4122: WRPR_PSTATE_I	wrpr	%r0, 0x049e, %pstate
	.word 0x819823c3  ! 4123: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03c3, %hpstate
DS_205:
	.word 0x34800001  ! 4125: BG	bg,a	<label_0x1>
	.word 0xdb30c007  ! 4125: STQF_R	-	%f13, [%r7, %r3]
	.word 0x83458000  ! 4124: RD_SOFTINT_REG	rd	%softint, %r1
	.word 0x94788004  ! 4125: SDIV_R	sdiv 	%r2, %r4, %r10
	.word 0x81982446  ! 4126: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0446, %hpstate
	.word 0xd42fc004  ! 4127: STB_R	stb	%r10, [%r31 + %r4]
	.word 0x87802089  ! 4128: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8d902217  ! 4129: WRPR_PSTATE_I	wrpr	%r0, 0x0217, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xd47fe001  ! 4131: SWAP_I	swap	%r10, [%r31 + 0x0001]
	.word 0x87802089  ! 4132: WRASI_I	wr	%r0, 0x0089, %asi
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd48008a0  ! 4135: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xd497e020  ! 4136: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r10
	.word 0xd4ffc024  ! 4137: SWAPA_R	swapa	%r10, [%r31 + %r4] 0x01
	.word 0x97a10dcb  ! 4138: FdMULq	fdmulq	
	.word 0x9e4a400b  ! 4139: MULX_R	mulx 	%r9, %r11, %r15
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81982b8a  ! 4141: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b8a, %hpstate
	.word 0x92db4005  ! 4142: SMULcc_R	smulcc 	%r13, %r5, %r9
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xd2ffc025  ! 4145: SWAPA_R	swapa	%r9, [%r31 + %r5] 0x01
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d9020ca  ! 4147: WRPR_PSTATE_I	wrpr	%r0, 0x00ca, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9e83e001  ! 4149: ADDcc_I	addcc 	%r15, 0x0001, %r15
	.word 0x8d902081  ! 4150: WRPR_PSTATE_I	wrpr	%r0, 0x0081, %pstate
DS_206:
	.word 0x32800001  ! 4152: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x93b14302  ! 4151: ALLIGNADDRESS	alignaddr	%r5, %r2, %r9
	.word 0x87802089  ! 4152: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x38800001  ! 4153: BGU	bgu,a	<label_0x1>
	.word 0x8c7be001  ! 4154: SDIV_I	sdiv 	%r15, 0x0001, %r6
	.word 0x9ba00544  ! 4155: FSQRTd	fsqrt	
	.word 0x9051800c  ! 4156: UMUL_R	umul 	%r6, %r12, %r8
DS_207:
	.word 0x34800001  ! 4158: BG	bg,a	<label_0x1>
	.word 0xc5324001  ! 4158: STQF_R	-	%f2, [%r1, %r9]
	.word 0x87458000  ! 4157: RD_SOFTINT_REG	rd	%softint, %r3
	.word 0x95d02034  ! 4158: Tcc_I	tg	icc_or_xcc, %r0 + 52
	.word 0xc64fc000  ! 4159: LDSB_R	ldsb	[%r31 + %r0], %r3
	.word 0x96534007  ! 4160: UMUL_R	umul 	%r13, %r7, %r11
	.word 0x84500007  ! 4161: UMUL_R	umul 	%r0, %r7, %r2
	.word 0xc48008a0  ! 4162: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x81504000  ! 4163: RDPR_TNPC	rdpr	%tnpc, %r0
	mov 0x34, %r30
	.word 0x81d0001e  ! 4164: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x8d902a8e  ! 4165: WRPR_PSTATE_I	wrpr	%r0, 0x0a8e, %pstate
	.word 0x9b504000  ! 4166: RDPR_TNPC	rdpr	%tnpc, %r13
	.word 0x81a289ac  ! 4167: FDIVs	fdivs	%f10, %f12, %f0
	.word 0x9f500000  ! 4168: RDPR_TPC	rdpr	%tpc, %r15
	.word 0x81982009  ! 4169: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0009, %hpstate
	mov 0x32, %r30
	.word 0x9dd0001e  ! 4170: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x886b800e  ! 4171: UDIVX_R	udivx 	%r14, %r14, %r4
DS_208:
	.word 0x32800001  ! 4173: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x89b24305  ! 4172: ALLIGNADDRESS	alignaddr	%r9, %r5, %r4
	mov 0x31, %r30
	.word 0x81d0001e  ! 4173: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x87802016  ! 4174: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8d802004  ! 4175: WRFPRS_I	wr	%r0, 0x0004, %fprs
	mov 0x31, %r30
	.word 0x87d0001e  ! 4176: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x90486001  ! 4177: MULX_I	mulx 	%r1, 0x0001, %r8
	.word 0x81982a4b  ! 4178: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a4b, %hpstate
	.word 0x81982f8f  ! 4179: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f8f, %hpstate
	.word 0x8d902cc6  ! 4180: WRPR_PSTATE_I	wrpr	%r0, 0x0cc6, %pstate
	.word 0x8469c003  ! 4181: UDIVX_R	udivx 	%r7, %r3, %r2
	ta	T_CHANGE_PRIV	! macro
	.word 0xc48008a0  ! 4183: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	mov 0x34, %r30
	.word 0x9dd0001e  ! 4184: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x8d902ccd  ! 4185: WRPR_PSTATE_I	wrpr	%r0, 0x0ccd, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x2c800001  ! 4187: BNEG	bneg,a	<label_0x1>
	.word 0xc4800bc0  ! 4188: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r2
	.word 0x8d902282  ! 4189: WRPR_PSTATE_I	wrpr	%r0, 0x0282, %pstate
	.word 0xc4dfe030  ! 4190: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r2
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc53fe001  ! 4192: STDF_I	std	%f2, [0x0001, %r31]
	.word 0x93d02034  ! 4193: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x9853c000  ! 4194: UMUL_R	umul 	%r15, %r0, %r12
	.word 0x2e800001  ! 4195: BVS	bvs,a	<label_0x1>
	.word 0x8d902285  ! 4196: WRPR_PSTATE_I	wrpr	%r0, 0x0285, %pstate
	.word 0xd877c000  ! 4197: STX_R	stx	%r12, [%r31 + %r0]
	.word 0x81982ede  ! 4198: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ede, %hpstate
	.word 0x86026001  ! 4199: ADD_I	add 	%r9, 0x0001, %r3
	.word 0x87802004  ! 4200: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x88c06001  ! 4201: ADDCcc_I	addccc 	%r1, 0x0001, %r4
	.word 0x8d9020d3  ! 4202: WRPR_PSTATE_I	wrpr	%r0, 0x00d3, %pstate
	.word 0x97d02035  ! 4203: Tcc_I	tge	icc_or_xcc, %r0 + 53
	.word 0xc93fe001  ! 4204: STDF_I	std	%f4, [0x0001, %r31]
	.word 0x819828cd  ! 4205: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08cd, %hpstate
	.word 0xc927e001  ! 4206: STF_I	st	%f4, [0x0001, %r31]
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x819822c8  ! 4208: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02c8, %hpstate
	.word 0x93a0056e  ! 4209: FSQRTq	fsqrt	
	.word 0xd2d804a0  ! 4210: LDXA_R	ldxa	[%r0, %r0] 0x25, %r9
	.word 0x36800001  ! 4211: BGE	bge,a	<label_0x1>
	.word 0xd2d00e60  ! 4212: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r9
	.word 0x8d90249c  ! 4213: WRPR_PSTATE_I	wrpr	%r0, 0x049c, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0xd317c000  ! 4215: LDQF_R	-	[%r31, %r0], %f9
	mov 0x30, %r30
	.word 0x8dd0001e  ! 4216: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd337e001  ! 4218: STQF_I	-	%f9, [0x0001, %r31]
	.word 0x8d902a42  ! 4219: WRPR_PSTATE_I	wrpr	%r0, 0x0a42, %pstate
	.word 0x2a800001  ! 4220: BCS	bcs,a	<label_0x1>
	.word 0x816ac00d  ! 4221: SDIVX_R	sdivx	%r11, %r13, %r0
	.word 0x819821dd  ! 4222: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01dd, %hpstate
	.word 0x91514000  ! 4223: RDPR_TBA	rdpr	%tba, %r8
DS_209:
	.word 0x20800001  ! 4225: BN	bn,a	<label_0x1>
	.word 0xcf334001  ! 4225: STQF_R	-	%f7, [%r1, %r13]
	.word 0x97458000  ! 4224: RD_SOFTINT_REG	rd	%softint, %r11
DS_210:
	.word 0x32800001  ! 4226: BNE	bne,a	<label_0x1>
	.word 0xc1326001  ! 4226: STQF_I	-	%f0, [0x0001, %r9]
	.word 0x8d458000  ! 4225: RD_SOFTINT_REG	rd	%softint, %r6
	ta	T_CHANGE_TO_TL0	! macro
	mov 0x33, %r30
	.word 0x8bd0001e  ! 4227: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	mov 0x34, %r30
	.word 0x95d0001e  ! 4228: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x2a700001  ! 4229: BPCS	<illegal instruction>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81982342  ! 4231: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0342, %hpstate
	.word 0x98794001  ! 4232: SDIV_R	sdiv 	%r5, %r1, %r12
	.word 0x86d16001  ! 4233: UMULcc_I	umulcc 	%r5, 0x0001, %r3
	.word 0x87802016  ! 4234: WRASI_I	wr	%r0, 0x0016, %asi
DS_211:
	.word 0x20800001  ! 4236: BN	bn,a	<label_0x1>
	.word 0xd9322001  ! 4236: STQF_I	-	%f12, [0x0001, %r8]
	.word 0x99458000  ! 4235: RD_SOFTINT_REG	rd	%softint, %r12
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d902042  ! 4237: WRPR_PSTATE_I	wrpr	%r0, 0x0042, %pstate
	mov 0x30, %r30
	.word 0x97d0001e  ! 4238: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x81982e0f  ! 4239: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e0f, %hpstate
	.word 0x81982b50  ! 4240: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b50, %hpstate
	.word 0xd93fc001  ! 4241: STDF_R	std	%f12, [%r1, %r31]
	.word 0xd89fc020  ! 4242: LDDA_R	ldda	[%r31, %r0] 0x01, %r12
	ta	T_CHANGE_PRIV	! macro
	.word 0x819826da  ! 4244: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06da, %hpstate
	.word 0xd81fc000  ! 4245: LDD_R	ldd	[%r31 + %r0], %r12
	.word 0x20800001  ! 4246: BN	bn,a	<label_0x1>
	.word 0x26700001  ! 4247: BPL	<illegal instruction>
	.word 0x81982bc2  ! 4248: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc2, %hpstate
	.word 0x85d02033  ! 4249: Tcc_I	tle	icc_or_xcc, %r0 + 51
	.word 0x8fd02033  ! 4250: Tcc_I	tvs	icc_or_xcc, %r0 + 51
	.word 0x9a7b400a  ! 4251: SDIV_R	sdiv 	%r13, %r10, %r13
	.word 0x34800001  ! 4252: BG	bg,a	<label_0x1>
	.word 0x8d90225d  ! 4253: WRPR_PSTATE_I	wrpr	%r0, 0x025d, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0xdac00e60  ! 4256: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r13
	.word 0x8d902a82  ! 4257: WRPR_PSTATE_I	wrpr	%r0, 0x0a82, %pstate
	.word 0x8d902299  ! 4258: WRPR_PSTATE_I	wrpr	%r0, 0x0299, %pstate
	.word 0x8ba209c1  ! 4259: FDIVd	fdivd	%f8, %f32, %f36
	.word 0x81982b17  ! 4260: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b17, %hpstate
	.word 0x8d902a5a  ! 4261: WRPR_PSTATE_I	wrpr	%r0, 0x0a5a, %pstate
	.word 0x8d9024c0  ! 4262: WRPR_PSTATE_I	wrpr	%r0, 0x04c0, %pstate
	.word 0x81982bc3  ! 4263: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc3, %hpstate
	.word 0x8fa01a6c  ! 4264: FqTOi	fqtoi	
	.word 0x8d902454  ! 4265: WRPR_PSTATE_I	wrpr	%r0, 0x0454, %pstate
	.word 0x824a0008  ! 4266: MULX_R	mulx 	%r8, %r8, %r1
	.word 0x85a20d25  ! 4267: FsMULd	fsmuld	%f8, %f36, %f2
	ta	T_CHANGE_NONPRIV	! macro
	mov 0x33, %r30
	.word 0x89d0001e  ! 4269: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x8080a001  ! 4270: ADDcc_I	addcc 	%r2, 0x0001, %r0
	.word 0xc13fe001  ! 4271: STDF_I	std	%f0, [0x0001, %r31]
DS_212:
	.word 0x22800001  ! 4273: BE	be,a	<label_0x1>
	.word 0xcd31000b  ! 4273: STQF_R	-	%f6, [%r11, %r4]
	.word 0x9d458000  ! 4272: RD_SOFTINT_REG	rd	%softint, %r14
	mov 0x34, %r30
	.word 0x81d0001e  ! 4273: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x9dd02035  ! 4274: Tcc_I	tpos	icc_or_xcc, %r0 + 53
DS_213:
	.word 0x32800001  ! 4276: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x87b18309  ! 4275: ALLIGNADDRESS	alignaddr	%r6, %r9, %r3
	.word 0x9878e001  ! 4276: SDIV_I	sdiv 	%r3, 0x0001, %r12
	.word 0xd87fe001  ! 4277: SWAP_I	swap	%r12, [%r31 + 0x0001]
	.word 0x8883e001  ! 4278: ADDcc_I	addcc 	%r15, 0x0001, %r4
	.word 0x87d02034  ! 4279: Tcc_I	tl	icc_or_xcc, %r0 + 52
	.word 0x26800001  ! 4280: BL	bl,a	<label_0x1>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc88008a0  ! 4282: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
	.word 0xc88804a0  ! 4283: LDUBA_R	lduba	[%r0, %r0] 0x25, %r4
	.word 0x8d902c45  ! 4284: WRPR_PSTATE_I	wrpr	%r0, 0x0c45, %pstate
	.word 0x3c700001  ! 4285: BPPOS	<illegal instruction>
	ta	T_CHANGE_PRIV	! macro
	.word 0x84812001  ! 4287: ADDcc_I	addcc 	%r4, 0x0001, %r2
	mov 0x31, %r30
	.word 0x99d0001e  ! 4288: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x87802004  ! 4289: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x94d1c00e  ! 4290: UMULcc_R	umulcc 	%r7, %r14, %r10
	.word 0xd40fe001  ! 4291: LDUB_I	ldub	[%r31 + 0x0001], %r10
	.word 0xd47fe001  ! 4292: SWAP_I	swap	%r10, [%r31 + 0x0001]
	.word 0x81982491  ! 4293: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0491, %hpstate
	.word 0x819829c8  ! 4294: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c8, %hpstate
	.word 0xd5e7c02e  ! 4295: CASA_I	casa	[%r31] 0x 1, %r14, %r10
	.word 0x8198299e  ! 4296: WRHPR_HPSTATE_I	wrhpr	%r0, 0x099e, %hpstate
	.word 0xd48008a0  ! 4297: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x32700001  ! 4298: BPNE	<illegal instruction>
	mov 0x34, %r30
	.word 0x93d0001e  ! 4299: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x95a000c7  ! 4300: FNEGd	fnegd	%f38, %f10
	.word 0x8ed94009  ! 4301: SMULcc_R	smulcc 	%r5, %r9, %r7
DS_214:
	.word 0x34800001  ! 4303: BG	bg,a	<label_0x1>
	.word 0xc9314003  ! 4303: STQF_R	-	%f4, [%r3, %r5]
	.word 0x83458000  ! 4302: RD_SOFTINT_REG	rd	%softint, %r1
	.word 0x81982e9f  ! 4303: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e9f, %hpstate
	.word 0x8fa01a60  ! 4304: FqTOi	fqtoi	
	.word 0xcec80e40  ! 4305: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r7
	.word 0x8d902290  ! 4306: WRPR_PSTATE_I	wrpr	%r0, 0x0290, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xcec00e40  ! 4308: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r7
	.word 0x87802089  ! 4309: WRASI_I	wr	%r0, 0x0089, %asi
	mov 0x30, %r30
	.word 0x81d0001e  ! 4310: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0xce97e030  ! 4311: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r7
	.word 0xcf27e001  ! 4312: STF_I	st	%f7, [0x0001, %r31]
	.word 0x91a389c0  ! 4313: FDIVd	fdivd	%f14, %f0, %f8
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x90c1e001  ! 4315: ADDCcc_I	addccc 	%r7, 0x0001, %r8
DS_215:
	.word 0x34800001  ! 4317: BG	bg,a	<label_0x1>
	.word 0xd331c004  ! 4317: STQF_R	-	%f9, [%r4, %r7]
	.word 0x91458000  ! 4316: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0xd07fe001  ! 4317: SWAP_I	swap	%r8, [%r31 + 0x0001]
	.word 0xd08fe000  ! 4318: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r8
	.word 0x9a6b4007  ! 4319: UDIVX_R	udivx 	%r13, %r7, %r13
	.word 0x8d9028dc  ! 4320: WRPR_PSTATE_I	wrpr	%r0, 0x08dc, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x8e832001  ! 4322: ADDcc_I	addcc 	%r12, 0x0001, %r7
	.word 0x81982197  ! 4323: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0197, %hpstate
	.word 0x81982ad9  ! 4324: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad9, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x819825d9  ! 4326: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05d9, %hpstate
	mov 0x32, %r30
	.word 0x83d0001e  ! 4327: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x9dd02031  ! 4328: Tcc_I	tpos	icc_or_xcc, %r0 + 49
	.word 0xce0fe001  ! 4329: LDUB_I	ldub	[%r31 + 0x0001], %r7
	.word 0x8d90285a  ! 4330: WRPR_PSTATE_I	wrpr	%r0, 0x085a, %pstate
	.word 0x81982f81  ! 4331: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f81, %hpstate
	.word 0x9da000c3  ! 4332: FNEGd	fnegd	%f34, %f14
	.word 0x8d902a04  ! 4333: WRPR_PSTATE_I	wrpr	%r0, 0x0a04, %pstate
	.word 0x87802004  ! 4334: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xdc2fe001  ! 4335: STB_I	stb	%r14, [%r31 + 0x0001]
	.word 0x83a00567  ! 4336: FSQRTq	fsqrt	
	.word 0x8c7bc00e  ! 4337: SDIV_R	sdiv 	%r15, %r14, %r6
	.word 0x8ba3cdc6  ! 4338: FdMULq	fdmulq	
	.word 0xcb37c006  ! 4339: STQF_R	-	%f5, [%r6, %r31]
	ta	T_CHANGE_PRIV	! macro
	.word 0x85a349e7  ! 4341: FDIVq	dis not found

	.word 0x81982f4a  ! 4342: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f4a, %hpstate
DS_216:
	.word 0x32800001  ! 4344: BNE	bne,a	<label_0x1>
	.word 0xcf30a001  ! 4344: STQF_I	-	%f7, [0x0001, %r2]
	.word 0x8b458000  ! 4343: RD_SOFTINT_REG	rd	%softint, %r5
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	mov 0x32, %r30
	.word 0x9fd0001e  ! 4346: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	mov 0x34, %r30
	.word 0x8dd0001e  ! 4349: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0xcabfc027  ! 4350: STDA_R	stda	%r5, [%r31 + %r7] 0x01
	.word 0x89d02034  ! 4351: Tcc_I	tleu	icc_or_xcc, %r0 + 52
	.word 0x81982ede  ! 4352: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ede, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x81982981  ! 4354: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0981, %hpstate
	ta	T_CHANGE_PRIV	! macro
DS_217:
	.word 0x22800001  ! 4357: BE	be,a	<label_0x1>
	.word 0xc332e001  ! 4357: STQF_I	-	%f1, [0x0001, %r11]
	.word 0x83458000  ! 4356: RD_SOFTINT_REG	rd	%softint, %r1
	.word 0x8d802000  ! 4357: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_218:
	.word 0x20800001  ! 4359: BN	bn,a	<label_0x1>
	illtrap
	.word 0x87b00300  ! 4358: ALLIGNADDRESS	alignaddr	%r0, %r0, %r3
	.word 0x9b514000  ! 4359: RDPR_TBA	rdpr	%tba, %r13
	mov 0x30, %r30
	.word 0x8dd0001e  ! 4360: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
DS_219:
	.word 0x32800001  ! 4362: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x97b1c306  ! 4361: ALLIGNADDRESS	alignaddr	%r7, %r6, %r11
	.word 0x30700001  ! 4362: BPA	<illegal instruction>
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x819829de  ! 4365: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09de, %hpstate
	.word 0xd61fc000  ! 4366: LDD_R	ldd	[%r31 + %r0], %r11
	.word 0x8f480000  ! 4367: RDHPR_HPSTATE	rdhpr	%hpstate, %r7
	.word 0x81a01a6f  ! 4368: FqTOi	fqtoi	
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d902cd6  ! 4370: WRPR_PSTATE_I	wrpr	%r0, 0x0cd6, %pstate
	.word 0x8200a001  ! 4371: ADD_I	add 	%r2, 0x0001, %r1
	.word 0x90d32001  ! 4372: UMULcc_I	umulcc 	%r12, 0x0001, %r8
	.word 0xd127c00f  ! 4373: STF_R	st	%f8, [%r15, %r31]
	.word 0xd0c80e60  ! 4374: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r8
	.word 0x81982708  ! 4375: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0708, %hpstate
	.word 0x819822cc  ! 4376: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02cc, %hpstate
	.word 0xd1e7c02f  ! 4377: CASA_I	casa	[%r31] 0x 1, %r15, %r8
	.word 0x8d902ccc  ! 4378: WRPR_PSTATE_I	wrpr	%r0, 0x0ccc, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a000c5  ! 4380: FNEGd	fnegd	%f36, %f8
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xd0d7e020  ! 4382: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r8
	.word 0xd0d7e030  ! 4383: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r8
	.word 0x87802010  ! 4384: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x24800001  ! 4385: BLE	ble,a	<label_0x1>
	.word 0xd0bfe001  ! 4386: STDA_I	stda	%r8, [%r31 + 0x0001] %asi
	.word 0xd057e001  ! 4387: LDSH_I	ldsh	[%r31 + 0x0001], %r8
	.word 0xd13fc005  ! 4388: STDF_R	std	%f8, [%r5, %r31]
	.word 0x8d902a08  ! 4389: WRPR_PSTATE_I	wrpr	%r0, 0x0a08, %pstate
	mov 0x34, %r30
	.word 0x93d0001e  ! 4390: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd0d804a0  ! 4391: LDXA_R	ldxa	[%r0, %r0] 0x25, %r8
	.word 0xd097e000  ! 4392: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r8
	.word 0xd08008a0  ! 4393: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0xd137e001  ! 4394: STQF_I	-	%f8, [0x0001, %r31]
	.word 0x3a800001  ! 4395: BCC	bcc,a	<label_0x1>
	.word 0x9649a001  ! 4396: MULX_I	mulx 	%r6, 0x0001, %r11
	.word 0x82d0e001  ! 4397: UMULcc_I	umulcc 	%r3, 0x0001, %r1
	.word 0x9ad3a001  ! 4398: UMULcc_I	umulcc 	%r14, 0x0001, %r13
	.word 0xda8008a0  ! 4399: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	mov 0x32, %r30
	.word 0x9dd0001e  ! 4400: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x8d9026c9  ! 4401: WRPR_PSTATE_I	wrpr	%r0, 0x06c9, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d902a53  ! 4403: WRPR_PSTATE_I	wrpr	%r0, 0x0a53, %pstate
DS_220:
	.word 0x20800001  ! 4405: BN	bn,a	<label_0x1>
	.word 0xd330e001  ! 4405: STQF_I	-	%f9, [0x0001, %r3]
	.word 0x8f458000  ! 4404: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0x81982147  ! 4405: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0147, %hpstate
	.word 0x81982b52  ! 4406: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b52, %hpstate
	.word 0x81982814  ! 4407: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0814, %hpstate
	.word 0x87802089  ! 4408: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x81a3c9e2  ! 4409: FDIVq	dis not found

	.word 0x95a089e5  ! 4410: FDIVq	dis not found

	mov 0x35, %r30
	.word 0x97d0001e  ! 4411: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0x85d02035  ! 4413: Tcc_I	tle	icc_or_xcc, %r0 + 53
	.word 0x8b6ae001  ! 4414: SDIVX_I	sdivx	%r11, 0x0001, %r5
	.word 0xca8008a0  ! 4415: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0x9c7be001  ! 4416: SDIV_I	sdiv 	%r15, 0x0001, %r14
	.word 0x89a00541  ! 4417: FSQRTd	fsqrt	
	.word 0x8d902c03  ! 4418: WRPR_PSTATE_I	wrpr	%r0, 0x0c03, %pstate
	mov 0x34, %r30
	.word 0x85d0001e  ! 4419: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0xc8cfe000  ! 4420: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r4
	ta	T_CHANGE_NONPRIV	! macro
	mov 0x35, %r30
	.word 0x95d0001e  ! 4422: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x81982e84  ! 4423: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e84, %hpstate
	mov 0x30, %r30
	.word 0x83d0001e  ! 4424: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d902a82  ! 4425: WRPR_PSTATE_I	wrpr	%r0, 0x0a82, %pstate
	.word 0xc8cfe000  ! 4426: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r4
	.word 0xc88008a0  ! 4427: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
	.word 0x8d802000  ! 4428: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d9028d9  ! 4429: WRPR_PSTATE_I	wrpr	%r0, 0x08d9, %pstate
	.word 0x8d902ecb  ! 4430: WRPR_PSTATE_I	wrpr	%r0, 0x0ecb, %pstate
	.word 0x8d902403  ! 4431: WRPR_PSTATE_I	wrpr	%r0, 0x0403, %pstate
	.word 0x81982ad4  ! 4432: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad4, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x89d02031  ! 4434: Tcc_I	tleu	icc_or_xcc, %r0 + 49
	.word 0x81d02033  ! 4435: Tcc_I	tn	icc_or_xcc, %r0 + 51
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81982350  ! 4437: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0350, %hpstate
	.word 0x8d902817  ! 4438: WRPR_PSTATE_I	wrpr	%r0, 0x0817, %pstate
	.word 0x30800001  ! 4439: BA	ba,a	<label_0x1>
	.word 0x9a80e001  ! 4440: ADDcc_I	addcc 	%r3, 0x0001, %r13
	.word 0x819829d5  ! 4441: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d5, %hpstate
	mov 0x33, %r30
	.word 0x99d0001e  ! 4442: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x81982899  ! 4443: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0899, %hpstate
	.word 0x8d902405  ! 4444: WRPR_PSTATE_I	wrpr	%r0, 0x0405, %pstate
	.word 0x87802088  ! 4445: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xda8008a0  ! 4446: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x8ba0054c  ! 4447: FSQRTd	fsqrt	
	.word 0x89a01a6d  ! 4448: FqTOi	fqtoi	
	.word 0x38700001  ! 4449: BPGU	<illegal instruction>
	mov 0x32, %r30
	.word 0x9fd0001e  ! 4450: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x8d90248f  ! 4451: WRPR_PSTATE_I	wrpr	%r0, 0x048f, %pstate
	.word 0x93514000  ! 4452: RDPR_TBA	rdpr	%tba, %r9
	.word 0x8d902a4f  ! 4453: WRPR_PSTATE_I	wrpr	%r0, 0x0a4f, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd24fc000  ! 4455: LDSB_R	ldsb	[%r31 + %r0], %r9
	.word 0x8d902e85  ! 4456: WRPR_PSTATE_I	wrpr	%r0, 0x0e85, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902009  ! 4458: WRPR_PSTATE_I	wrpr	%r0, 0x0009, %pstate
	.word 0x8d902e42  ! 4459: WRPR_PSTATE_I	wrpr	%r0, 0x0e42, %pstate
	mov 0x31, %r30
	.word 0x97d0001e  ! 4460: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x81982653  ! 4461: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0653, %hpstate
	.word 0x8168e001  ! 4462: SDIVX_I	sdivx	%r3, 0x0001, %r0
	.word 0x91a14d2e  ! 4463: FsMULd	fsmuld	%f5, %f14, %f8
	.word 0x826b6001  ! 4464: UDIVX_I	udivx 	%r13, 0x0001, %r1
	.word 0x81982554  ! 4465: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0554, %hpstate
	.word 0x87802089  ! 4466: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8ba08dcf  ! 4467: FdMULq	fdmulq	
	.word 0xcacfe010  ! 4468: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r5
	.word 0x8198200c  ! 4469: WRHPR_HPSTATE_I	wrhpr	%r0, 0x000c, %hpstate
	.word 0xca9004a0  ! 4470: LDUHA_R	lduha	[%r0, %r0] 0x25, %r5
	.word 0xca1fe001  ! 4471: LDD_I	ldd	[%r31 + 0x0001], %r5
	.word 0x8d90245f  ! 4472: WRPR_PSTATE_I	wrpr	%r0, 0x045f, %pstate
DS_221:
	.word 0x34800001  ! 4474: BG	bg,a	<label_0x1>
	.word 0xd130000b  ! 4474: STQF_R	-	%f8, [%r11, %r0]
	.word 0x9b458000  ! 4473: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x26700001  ! 4474: BPL	<illegal instruction>
	.word 0xda9fe001  ! 4475: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r13
	.word 0x34800001  ! 4476: BG	bg,a	<label_0x1>
	ta	T_CHANGE_NONHPRIV	! macro
DS_222:
	.word 0x34800001  ! 4479: BG	bg,a	<label_0x1>
	illtrap
	.word 0x9db2c305  ! 4478: ALLIGNADDRESS	alignaddr	%r11, %r5, %r14
	.word 0x81982fc2  ! 4479: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fc2, %hpstate
	.word 0x24700001  ! 4480: BPLE	<illegal instruction>
	.word 0x3c800001  ! 4481: BPOS	bpos,a	<label_0x1>
	.word 0x32700001  ! 4482: BPNE	<illegal instruction>
	.word 0xdc8804a0  ! 4483: LDUBA_R	lduba	[%r0, %r0] 0x25, %r14
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d90285c  ! 4485: WRPR_PSTATE_I	wrpr	%r0, 0x085c, %pstate
	.word 0x28700001  ! 4486: BPLEU	<illegal instruction>
	ta	T_CHANGE_PRIV	! macro
	.word 0x87802089  ! 4488: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x87802088  ! 4489: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xdc8fe020  ! 4490: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r14
	.word 0x81982553  ! 4491: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0553, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d902856  ! 4493: WRPR_PSTATE_I	wrpr	%r0, 0x0856, %pstate
	.word 0xdc9004a0  ! 4494: LDUHA_R	lduha	[%r0, %r0] 0x25, %r14
	.word 0x8bd02030  ! 4495: Tcc_I	tcs	icc_or_xcc, %r0 + 48
	.word 0x8d9026c3  ! 4496: WRPR_PSTATE_I	wrpr	%r0, 0x06c3, %pstate
	.word 0x8d9024de  ! 4497: WRPR_PSTATE_I	wrpr	%r0, 0x04de, %pstate
	.word 0xdc8008a0  ! 4498: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r14
	.word 0x8d90244d  ! 4499: WRPR_PSTATE_I	wrpr	%r0, 0x044d, %pstate
	.word 0x81982316  ! 4500: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0316, %hpstate
DS_223:
	.word 0x22800001  ! 4502: BE	be,a	<label_0x1>
	.word 0xcb32800b  ! 4502: STQF_R	-	%f5, [%r11, %r10]
	.word 0x91458000  ! 4501: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x8fa289ea  ! 4502: FDIVq	dis not found

	.word 0x8c4a4009  ! 4503: MULX_R	mulx 	%r9, %r9, %r6
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9049c00c  ! 4505: MULX_R	mulx 	%r7, %r12, %r8
	.word 0xd1e7c02c  ! 4506: CASA_I	casa	[%r31] 0x 1, %r12, %r8
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a000c4  ! 4508: FNEGd	fnegd	%f4, %f42
	.word 0xd61fc000  ! 4509: LDD_R	ldd	[%r31 + %r0], %r11
	.word 0x93a00543  ! 4510: FSQRTd	fsqrt	
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd2c004a0  ! 4512: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r9
	.word 0x87802004  ! 4513: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xd2800ba0  ! 4514: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r9
	.word 0xd28008a0  ! 4515: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xd2900e80  ! 4516: LDUHA_R	lduha	[%r0, %r0] 0x74, %r9
	.word 0x8d90200c  ! 4517: WRPR_PSTATE_I	wrpr	%r0, 0x000c, %pstate
	.word 0x9fa00544  ! 4518: FSQRTd	fsqrt	
	.word 0xdfe7c024  ! 4519: CASA_I	casa	[%r31] 0x 1, %r4, %r15
	.word 0x8cd0a001  ! 4520: UMULcc_I	umulcc 	%r2, 0x0001, %r6
	.word 0x87802014  ! 4521: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x87a000c8  ! 4522: FNEGd	fnegd	%f8, %f34
	.word 0x91504000  ! 4523: RDPR_TNPC	rdpr	%tnpc, %r8
	.word 0x81982910  ! 4524: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0910, %hpstate
	.word 0xd04fe001  ! 4525: LDSB_I	ldsb	[%r31 + 0x0001], %r8
	.word 0x8d802000  ! 4526: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x24800001  ! 4527: BLE	ble,a	<label_0x1>
	.word 0xd08fe020  ! 4528: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r8
	.word 0x81982044  ! 4529: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0044, %hpstate
	.word 0xd08fe020  ! 4530: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r8
	.word 0x9d508000  ! 4531: RDPR_TSTATE	rdpr	%tstate, %r14
	.word 0x9da0056e  ! 4532: FSQRTq	fsqrt	
	.word 0xdc8804a0  ! 4533: LDUBA_R	lduba	[%r0, %r0] 0x25, %r14
DS_224:
	.word 0x20800001  ! 4535: BN	bn,a	<label_0x1>
	.word 0xdf31e001  ! 4535: STQF_I	-	%f15, [0x0001, %r7]
	.word 0x83458000  ! 4534: RD_SOFTINT_REG	rd	%softint, %r1
	.word 0xc2d804a0  ! 4535: LDXA_R	ldxa	[%r0, %r0] 0x25, %r1
	.word 0x8d9024d5  ! 4536: WRPR_PSTATE_I	wrpr	%r0, 0x04d5, %pstate
	.word 0xc29fe001  ! 4537: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r1
	.word 0x9d504000  ! 4538: RDPR_TNPC	rdpr	%tnpc, %r14
	ta	T_CHANGE_HPRIV	! macro
	.word 0x819823d0  ! 4540: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03d0, %hpstate
	.word 0x87a04d22  ! 4541: FsMULd	fsmuld	%f1, %f2, %f34
	.word 0x81982c18  ! 4542: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c18, %hpstate
	mov 0x31, %r30
	.word 0x99d0001e  ! 4543: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x819826d0  ! 4544: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06d0, %hpstate
	.word 0x8d802000  ! 4545: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x28700001  ! 4546: BPLEU	<illegal instruction>
	.word 0x8d802000  ! 4547: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8ba149c4  ! 4548: FDIVd	fdivd	%f36, %f4, %f36
	.word 0x8d802000  ! 4549: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xcbe7c024  ! 4550: CASA_I	casa	[%r31] 0x 1, %r4, %r5
	.word 0x81982b41  ! 4551: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b41, %hpstate
	.word 0x9ba34d2e  ! 4552: FsMULd	fsmuld	%f13, %f14, %f44
	.word 0x819820d1  ! 4553: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00d1, %hpstate
	.word 0x8b494000  ! 4554: RDHPR_HTBA	rdhpr	%htba, %r5
	.word 0x80682001  ! 4555: UDIVX_I	udivx 	%r0, 0x0001, %r0
	.word 0xc0c804a0  ! 4556: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r0
	.word 0xc197e001  ! 4557: LDQFA_I	-	[%r31, 0x0001], %f0
	.word 0x8d802000  ! 4558: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982285  ! 4559: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0285, %hpstate
	.word 0x86d8000e  ! 4560: SMULcc_R	smulcc 	%r0, %r14, %r3
	.word 0x8bd02032  ! 4561: Tcc_I	tcs	icc_or_xcc, %r0 + 50
	mov 0x30, %r30
	.word 0x9bd0001e  ! 4562: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x8d802004  ! 4563: WRFPRS_I	wr	%r0, 0x0004, %fprs
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d90280f  ! 4565: WRPR_PSTATE_I	wrpr	%r0, 0x080f, %pstate
	ta	T_CHANGE_PRIV	! macro
	mov 0x31, %r30
	.word 0x99d0001e  ! 4567: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x8d902ecb  ! 4568: WRPR_PSTATE_I	wrpr	%r0, 0x0ecb, %pstate
	.word 0x22800001  ! 4569: BE	be,a	<label_0x1>
	.word 0x819828d7  ! 4570: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d7, %hpstate
	.word 0x82790006  ! 4571: SDIV_R	sdiv 	%r4, %r6, %r1
	.word 0xc2880e60  ! 4572: LDUBA_R	lduba	[%r0, %r0] 0x73, %r1
	.word 0x8d902c1b  ! 4573: WRPR_PSTATE_I	wrpr	%r0, 0x0c1b, %pstate
	.word 0x8c032001  ! 4574: ADD_I	add 	%r12, 0x0001, %r6
	.word 0x9c49e001  ! 4575: MULX_I	mulx 	%r7, 0x0001, %r14
	.word 0xdcc004a0  ! 4576: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r14
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xdc9004a0  ! 4578: LDUHA_R	lduha	[%r0, %r0] 0x25, %r14
	.word 0x38800001  ! 4579: BGU	bgu,a	<label_0x1>
	.word 0x28800001  ! 4580: BLEU	bleu,a	<label_0x1>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x24700001  ! 4582: BPLE	<illegal instruction>
	.word 0x9951c000  ! 4583: RDPR_TL	rdpr	%tl, %r12
	ta	T_CHANGE_NONHPRIV	! macro
DS_225:
	.word 0x34800001  ! 4586: BG	bg,a	<label_0x1>
	.word 0xc730c009  ! 4586: STQF_R	-	%f3, [%r9, %r3]
	.word 0x81458000  ! 4585: RD_SOFTINT_REG	stbar
	.word 0x8d902ed7  ! 4586: WRPR_PSTATE_I	wrpr	%r0, 0x0ed7, %pstate
	.word 0x8d9024c1  ! 4587: WRPR_PSTATE_I	wrpr	%r0, 0x04c1, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81982c08  ! 4589: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c08, %hpstate
	.word 0xc137e001  ! 4590: STQF_I	-	%f0, [0x0001, %r31]
	.word 0x99a01a6f  ! 4591: FqTOi	fqtoi	
	.word 0x8d902cd2  ! 4592: WRPR_PSTATE_I	wrpr	%r0, 0x0cd2, %pstate
	.word 0x8d9028c3  ! 4593: WRPR_PSTATE_I	wrpr	%r0, 0x08c3, %pstate
	.word 0x8fd02035  ! 4594: Tcc_I	tvs	icc_or_xcc, %r0 + 53
	.word 0xd84fe001  ! 4595: LDSB_I	ldsb	[%r31 + 0x0001], %r12
	.word 0x8d90260c  ! 4596: WRPR_PSTATE_I	wrpr	%r0, 0x060c, %pstate
	.word 0x85a000ce  ! 4597: FNEGd	fnegd	%f14, %f2
	.word 0xc4880e40  ! 4598: LDUBA_R	lduba	[%r0, %r0] 0x72, %r2
	.word 0x91a1cd25  ! 4599: FsMULd	fsmuld	%f7, %f36, %f8
	.word 0x8d902e9f  ! 4600: WRPR_PSTATE_I	wrpr	%r0, 0x0e9f, %pstate
DS_226:
	.word 0x20800001  ! 4602: BN	bn,a	<label_0x1>
	illtrap
	.word 0x8db28304  ! 4601: ALLIGNADDRESS	alignaddr	%r10, %r4, %r6
	.word 0xcc07e001  ! 4602: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0x9b508000  ! 4603: RDPR_TSTATE	rdpr	%tstate, %r13
	.word 0x846a800f  ! 4604: UDIVX_R	udivx 	%r10, %r15, %r2
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xc4dfe030  ! 4606: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r2
	.word 0x8d902282  ! 4607: WRPR_PSTATE_I	wrpr	%r0, 0x0282, %pstate
	.word 0x83d02033  ! 4608: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0xc48008a0  ! 4609: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x8d902e55  ! 4610: WRPR_PSTATE_I	wrpr	%r0, 0x0e55, %pstate
	.word 0x8d9024c0  ! 4611: WRPR_PSTATE_I	wrpr	%r0, 0x04c0, %pstate
	.word 0xc4bfc02f  ! 4612: STDA_R	stda	%r2, [%r31 + %r15] 0x01
	.word 0x8d902a0d  ! 4613: WRPR_PSTATE_I	wrpr	%r0, 0x0a0d, %pstate
	.word 0x3a700001  ! 4614: BPCC	<illegal instruction>
	.word 0x844aa001  ! 4615: MULX_I	mulx 	%r10, 0x0001, %r2
	ta	T_CHANGE_PRIV	! macro
	.word 0x88dbc009  ! 4617: SMULcc_R	smulcc 	%r15, %r9, %r4
	.word 0x8e79e001  ! 4618: SDIV_I	sdiv 	%r7, 0x0001, %r7
	.word 0x8d902659  ! 4619: WRPR_PSTATE_I	wrpr	%r0, 0x0659, %pstate
	.word 0x8d90201d  ! 4620: WRPR_PSTATE_I	wrpr	%r0, 0x001d, %pstate
	.word 0xce57e001  ! 4621: LDSH_I	ldsh	[%r31 + 0x0001], %r7
	.word 0x8d802000  ! 4622: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982a91  ! 4623: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a91, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x81982adb  ! 4625: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0adb, %hpstate
DS_227:
	.word 0x34800001  ! 4627: BG	bg,a	<label_0x1>
	illtrap
	.word 0x99b0c308  ! 4626: ALLIGNADDRESS	alignaddr	%r3, %r8, %r12
	.word 0x8d902c9a  ! 4627: WRPR_PSTATE_I	wrpr	%r0, 0x0c9a, %pstate
	.word 0x87d02032  ! 4628: Tcc_I	tl	icc_or_xcc, %r0 + 50
	mov 0x31, %r30
	.word 0x87d0001e  ! 4629: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x81982383  ! 4630: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0383, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81982517  ! 4633: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0517, %hpstate
	.word 0x85a00548  ! 4634: FSQRTd	fsqrt	
	.word 0x81982304  ! 4635: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0304, %hpstate
	.word 0xc4c7e000  ! 4636: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r2
	.word 0x91d02035  ! 4637: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8d902603  ! 4638: WRPR_PSTATE_I	wrpr	%r0, 0x0603, %pstate
	.word 0x8682a001  ! 4639: ADDcc_I	addcc 	%r10, 0x0001, %r3
	.word 0x81982398  ! 4640: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0398, %hpstate
	.word 0x8d902a96  ! 4641: WRPR_PSTATE_I	wrpr	%r0, 0x0a96, %pstate
	.word 0xc6800b60  ! 4642: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r3
	.word 0x91a000c3  ! 4643: FNEGd	fnegd	%f34, %f8
	.word 0xd0cfe000  ! 4644: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r8
	.word 0xd08008a0  ! 4645: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0x8d902053  ! 4646: WRPR_PSTATE_I	wrpr	%r0, 0x0053, %pstate
	.word 0x81982745  ! 4647: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0745, %hpstate
	.word 0x81982951  ! 4648: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0951, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x20800001  ! 4650: BN	bn,a	<label_0x1>
	.word 0x976ba001  ! 4651: SDIVX_I	sdivx	%r14, 0x0001, %r11
	.word 0x8d802000  ! 4652: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982b9e  ! 4653: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b9e, %hpstate
	.word 0x8198299e  ! 4654: WRHPR_HPSTATE_I	wrhpr	%r0, 0x099e, %hpstate
DS_228:
	.word 0x22800001  ! 4656: BE	be,a	<label_0x1>
	illtrap
	.word 0x93b3430d  ! 4655: ALLIGNADDRESS	alignaddr	%r13, %r13, %r9
	.word 0x8d902c55  ! 4656: WRPR_PSTATE_I	wrpr	%r0, 0x0c55, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x9fd02035  ! 4659: Tcc_I	tvc	icc_or_xcc, %r0 + 53
	.word 0xd2ffc02d  ! 4660: SWAPA_R	swapa	%r9, [%r31 + %r13] 0x01
	.word 0x26800001  ! 4661: BL	bl,a	<label_0x1>
	.word 0xd237e001  ! 4662: STH_I	sth	%r9, [%r31 + 0x0001]
	.word 0xd227c00d  ! 4663: STW_R	stw	%r9, [%r31 + %r13]
	.word 0x93d02035  ! 4664: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x9c51c005  ! 4665: UMUL_R	umul 	%r7, %r5, %r14
	mov 0x35, %r30
	.word 0x9dd0001e  ! 4666: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x97a009a6  ! 4667: FDIVs	fdivs	%f0, %f6, %f11
	.word 0x95a2c9c8  ! 4668: FDIVd	fdivd	%f42, %f8, %f10
	.word 0xd427c008  ! 4669: STW_R	stw	%r10, [%r31 + %r8]
	.word 0x90d2c000  ! 4670: UMULcc_R	umulcc 	%r11, %r0, %r8
	.word 0x8198208c  ! 4671: WRHPR_HPSTATE_I	wrhpr	%r0, 0x008c, %hpstate
	.word 0x87802080  ! 4672: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x8d902e8a  ! 4673: WRPR_PSTATE_I	wrpr	%r0, 0x0e8a, %pstate
	.word 0x97a08d20  ! 4674: FsMULd	fsmuld	%f2, %f0, %f42
	.word 0xd7e7c020  ! 4675: CASA_I	casa	[%r31] 0x 1, %r0, %r11
	.word 0x3a700001  ! 4676: BPCC	<illegal instruction>
	.word 0x91a1cdc5  ! 4677: FdMULq	fdmulq	
	mov 0x31, %r30
	.word 0x8fd0001e  ! 4678: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x81982707  ! 4679: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0707, %hpstate
	mov 0x34, %r30
	.word 0x9fd0001e  ! 4680: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x819825ce  ! 4681: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05ce, %hpstate
DS_229:
	.word 0x22800001  ! 4683: BE	be,a	<label_0x1>
	illtrap
	.word 0x8bb20306  ! 4682: ALLIGNADDRESS	alignaddr	%r8, %r6, %r5
	ta	T_CHANGE_TO_TL0	! macro
	mov 0x34, %r30
	.word 0x85d0001e  ! 4684: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xcaffc026  ! 4686: SWAPA_R	swapa	%r5, [%r31 + %r6] 0x01
	.word 0x91a000c4  ! 4687: FNEGd	fnegd	%f4, %f8
	.word 0xd0d804a0  ! 4688: LDXA_R	ldxa	[%r0, %r0] 0x25, %r8
	.word 0x95a049a5  ! 4689: FDIVs	fdivs	%f1, %f5, %f10
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x9ba149ed  ! 4693: FDIVq	dis not found

	.word 0x81982117  ! 4694: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0117, %hpstate
	.word 0x8dd02033  ! 4695: Tcc_I	tneg	icc_or_xcc, %r0 + 51
	.word 0xdb27e001  ! 4696: STF_I	st	%f13, [0x0001, %r31]
	.word 0xda9fe001  ! 4697: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r13
	.word 0xdac7e010  ! 4698: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r13
	.word 0x2a700001  ! 4699: BPCS	<illegal instruction>
	.word 0xdb37c00d  ! 4700: STQF_R	-	%f13, [%r13, %r31]
	.word 0x8ad1000b  ! 4701: UMULcc_R	umulcc 	%r4, %r11, %r5
	.word 0x87802016  ! 4702: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xca9004a0  ! 4703: LDUHA_R	lduha	[%r0, %r0] 0x25, %r5
	.word 0x8769a001  ! 4704: SDIVX_I	sdivx	%r6, 0x0001, %r3
	.word 0x8d802000  ! 4705: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc797e001  ! 4706: LDQFA_I	-	[%r31, 0x0001], %f3
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81982858  ! 4708: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0858, %hpstate
	.word 0xc68fe010  ! 4709: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r3
	mov 0x33, %r30
	.word 0x91d0001e  ! 4710: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x864b6001  ! 4711: MULX_I	mulx 	%r13, 0x0001, %r3
	mov 0x33, %r30
	.word 0x8fd0001e  ! 4712: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x9dd02032  ! 4713: Tcc_I	tpos	icc_or_xcc, %r0 + 50
	.word 0x8198269b  ! 4714: WRHPR_HPSTATE_I	wrhpr	%r0, 0x069b, %hpstate
	mov 0x32, %r30
	.word 0x93d0001e  ! 4715: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x83d02032  ! 4716: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0xc67fe001  ! 4717: SWAP_I	swap	%r3, [%r31 + 0x0001]
	.word 0x81982cc1  ! 4718: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc1, %hpstate
	mov 0x35, %r30
	.word 0x93d0001e  ! 4719: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x92d2a001  ! 4720: UMULcc_I	umulcc 	%r10, 0x0001, %r9
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x83d02035  ! 4723: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x9f480000  ! 4724: RDHPR_HPSTATE	rdhpr	%hpstate, %r15
	.word 0x8d902055  ! 4725: WRPR_PSTATE_I	wrpr	%r0, 0x0055, %pstate
	.word 0x9403e001  ! 4726: ADD_I	add 	%r15, 0x0001, %r10
	.word 0x3c800001  ! 4727: BPOS	bpos,a	<label_0x1>
	.word 0x8f6b6001  ! 4728: SDIVX_I	sdivx	%r13, 0x0001, %r7
	.word 0x8d90225d  ! 4729: WRPR_PSTATE_I	wrpr	%r0, 0x025d, %pstate
	.word 0x97a0cdc1  ! 4730: FdMULq	fdmulq	
	.word 0x97a000cf  ! 4731: FNEGd	fnegd	%f46, %f42
	.word 0xd68fe000  ! 4732: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r11
	ta	T_CHANGE_PRIV	! macro
	.word 0xd6ffc02f  ! 4734: SWAPA_R	swapa	%r11, [%r31 + %r15] 0x01
	.word 0x819825c1  ! 4735: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05c1, %hpstate
	.word 0x8d802000  ! 4736: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x85a10dc0  ! 4737: FdMULq	fdmulq	
	.word 0x20700001  ! 4738: BPN	<illegal instruction>
	.word 0x81a009c0  ! 4739: FDIVd	fdivd	%f0, %f0, %f0
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d802004  ! 4741: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x81982a0e  ! 4742: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a0e, %hpstate
	mov 0x31, %r30
	.word 0x99d0001e  ! 4743: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	mov 0x31, %r30
	.word 0x85d0001e  ! 4744: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0xc0c7e020  ! 4745: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r0
	.word 0xc0d7e020  ! 4746: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r0
	.word 0xc07fe001  ! 4747: SWAP_I	swap	%r0, [%r31 + 0x0001]
	.word 0x95494000  ! 4748: RDHPR_HTBA	rdhpr	%htba, %r10
	.word 0x8d902858  ! 4749: WRPR_PSTATE_I	wrpr	%r0, 0x0858, %pstate
	.word 0xd4d80e40  ! 4750: LDXA_R	ldxa	[%r0, %r0] 0x72, %r10
	.word 0x81982647  ! 4751: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0647, %hpstate
	.word 0xd4cfe000  ! 4752: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r10
	.word 0x9968e001  ! 4753: SDIVX_I	sdivx	%r3, 0x0001, %r12
	.word 0x8802a001  ! 4754: ADD_I	add 	%r10, 0x0001, %r4
	.word 0xc88008a0  ! 4755: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
	.word 0x81982dd9  ! 4756: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dd9, %hpstate
	.word 0x91d02031  ! 4757: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x24700001  ! 4758: BPLE	<illegal instruction>
	.word 0x8fa009c9  ! 4759: FDIVd	fdivd	%f0, %f40, %f38
DS_230:
	.word 0x32800001  ! 4761: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x8bb2830c  ! 4760: ALLIGNADDRESS	alignaddr	%r10, %r12, %r5
	.word 0x8fd02030  ! 4761: Tcc_I	tvs	icc_or_xcc, %r0 + 48
	.word 0xca27c00c  ! 4762: STW_R	stw	%r5, [%r31 + %r12]
	.word 0x8d902c00  ! 4763: WRPR_PSTATE_I	wrpr	%r0, 0x0c00, %pstate
	.word 0x9cd3800c  ! 4764: UMULcc_R	umulcc 	%r14, %r12, %r14
	.word 0x87802089  ! 4765: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xdc37c00c  ! 4766: STH_R	sth	%r14, [%r31 + %r12]
	.word 0x81982f93  ! 4767: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f93, %hpstate
	.word 0x81982c48  ! 4768: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c48, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x87d02030  ! 4770: Tcc_I	tl	icc_or_xcc, %r0 + 48
	.word 0xdc8008a0  ! 4771: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r14
	.word 0x966ae001  ! 4772: UDIVX_I	udivx 	%r11, 0x0001, %r11
	.word 0xd6d004a0  ! 4773: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r11
	mov 0x30, %r30
	.word 0x9dd0001e  ! 4774: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x89a00545  ! 4775: FSQRTd	fsqrt	
	.word 0x28700001  ! 4776: BPLEU	<illegal instruction>
	.word 0x81982b5c  ! 4777: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b5c, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d90264c  ! 4779: WRPR_PSTATE_I	wrpr	%r0, 0x064c, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x28800001  ! 4781: BLEU	bleu,a	<label_0x1>
	.word 0x9e494005  ! 4782: MULX_R	mulx 	%r5, %r5, %r15
	.word 0x8d802000  ! 4783: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982c50  ! 4784: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c50, %hpstate
DS_231:
	.word 0x22800001  ! 4786: BE	be,a	<label_0x1>
	illtrap
	.word 0x83b14300  ! 4785: ALLIGNADDRESS	alignaddr	%r5, %r0, %r1
	.word 0xc21fe001  ! 4786: LDD_I	ldd	[%r31 + 0x0001], %r1
	.word 0x9a530001  ! 4787: UMUL_R	umul 	%r12, %r1, %r13
	.word 0x8cd18000  ! 4788: UMULcc_R	umulcc 	%r6, %r0, %r6
	.word 0x87802010  ! 4789: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x81982084  ! 4790: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0084, %hpstate
	.word 0x81982b93  ! 4791: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b93, %hpstate
	.word 0x8d802004  ! 4792: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8ed1e001  ! 4793: UMULcc_I	umulcc 	%r7, 0x0001, %r7
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x38800001  ! 4795: BGU	bgu,a	<label_0x1>
	.word 0x81982888  ! 4796: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0888, %hpstate
	.word 0xcfe7c020  ! 4797: CASA_I	casa	[%r31] 0x 1, %r0, %r7
	mov 0x31, %r30
	.word 0x97d0001e  ! 4798: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
DS_232:
	.word 0x22800001  ! 4802: BE	be,a	<label_0x1>
	illtrap
	.word 0x89b14300  ! 4801: ALLIGNADDRESS	alignaddr	%r5, %r0, %r4
	.word 0x81982dde  ! 4802: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dde, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x91d02033  ! 4804: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8d90288c  ! 4805: WRPR_PSTATE_I	wrpr	%r0, 0x088c, %pstate
	.word 0xc9e7c020  ! 4806: CASA_I	casa	[%r31] 0x 1, %r0, %r4
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d902848  ! 4808: WRPR_PSTATE_I	wrpr	%r0, 0x0848, %pstate
	.word 0x9da1c9cd  ! 4809: FDIVd	fdivd	%f38, %f44, %f14
	.word 0x9bd02030  ! 4810: Tcc_I	tcc	icc_or_xcc, %r0 + 48
	.word 0x8d902c46  ! 4811: WRPR_PSTATE_I	wrpr	%r0, 0x0c46, %pstate
	.word 0x81982712  ! 4812: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0712, %hpstate
	.word 0x89d02033  ! 4813: Tcc_I	tleu	icc_or_xcc, %r0 + 51
	.word 0x81982285  ! 4814: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0285, %hpstate
	mov 0x34, %r30
	.word 0x93d0001e  ! 4815: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x9fa3c9ec  ! 4816: FDIVq	dis not found

	.word 0x89a01a6e  ! 4817: FqTOi	fqtoi	
	.word 0x36700001  ! 4818: BPGE	<illegal instruction>
	.word 0x90810009  ! 4819: ADDcc_R	addcc 	%r4, %r9, %r8
	.word 0x87802088  ! 4820: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x80492001  ! 4821: MULX_I	mulx 	%r4, 0x0001, %r0
	.word 0x819827c2  ! 4822: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07c2, %hpstate
	.word 0x8d902e80  ! 4823: WRPR_PSTATE_I	wrpr	%r0, 0x0e80, %pstate
	.word 0x38800001  ! 4824: BGU	bgu,a	<label_0x1>
	.word 0x80db8008  ! 4825: SMULcc_R	smulcc 	%r14, %r8, %r0
	.word 0x8198231f  ! 4826: WRHPR_HPSTATE_I	wrhpr	%r0, 0x031f, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81982787  ! 4828: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0787, %hpstate
	.word 0x81982cdd  ! 4829: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cdd, %hpstate
	mov 0x34, %r30
	.word 0x89d0001e  ! 4830: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x8d902e0f  ! 4831: WRPR_PSTATE_I	wrpr	%r0, 0x0e0f, %pstate
	.word 0x81982504  ! 4832: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0504, %hpstate
	.word 0x9a790008  ! 4833: SDIV_R	sdiv 	%r4, %r8, %r13
	.word 0xda0fe001  ! 4834: LDUB_I	ldub	[%r31 + 0x0001], %r13
	.word 0x9c7a4004  ! 4835: SDIV_R	sdiv 	%r9, %r4, %r14
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902cdd  ! 4838: WRPR_PSTATE_I	wrpr	%r0, 0x0cdd, %pstate
	.word 0x9ad0a001  ! 4839: UMULcc_I	umulcc 	%r2, 0x0001, %r13
	.word 0x81982452  ! 4840: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0452, %hpstate
	.word 0x8d902c58  ! 4841: WRPR_PSTATE_I	wrpr	%r0, 0x0c58, %pstate
	.word 0x8198271b  ! 4842: WRHPR_HPSTATE_I	wrhpr	%r0, 0x071b, %hpstate
	.word 0x8d902842  ! 4843: WRPR_PSTATE_I	wrpr	%r0, 0x0842, %pstate
	.word 0x87802089  ! 4844: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x3e800001  ! 4845: BVC	bvc,a	<label_0x1>
	ta	T_CHANGE_PRIV	! macro
	.word 0x81982690  ! 4847: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0690, %hpstate
	.word 0x80db800c  ! 4848: SMULcc_R	smulcc 	%r14, %r12, %r0
	.word 0x886aa001  ! 4849: UDIVX_I	udivx 	%r10, 0x0001, %r4
	.word 0xc8c004a0  ! 4850: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r4
	.word 0xc87fe001  ! 4851: SWAP_I	swap	%r4, [%r31 + 0x0001]
	.word 0x93d02030  ! 4852: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0x8d902c52  ! 4853: WRPR_PSTATE_I	wrpr	%r0, 0x0c52, %pstate
	.word 0x99a3cdc2  ! 4854: FdMULq	fdmulq	
	ta	T_CHANGE_PRIV	! macro
	mov 0x33, %r30
	.word 0x93d0001e  ! 4856: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 4857: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x24800001  ! 4858: BLE	ble,a	<label_0x1>
	.word 0x81982040  ! 4859: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0040, %hpstate
	.word 0x819824c1  ! 4860: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04c1, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd8cfe010  ! 4862: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r12
	.word 0x81a000cb  ! 4863: FNEGd	fnegd	%f42, %f0
	.word 0x8a7bc008  ! 4864: SDIV_R	sdiv 	%r15, %r8, %r5
	.word 0x8d902047  ! 4865: WRPR_PSTATE_I	wrpr	%r0, 0x0047, %pstate
	.word 0xca8804a0  ! 4866: LDUBA_R	lduba	[%r0, %r0] 0x25, %r5
	.word 0x819824c2  ! 4867: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04c2, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x8c484001  ! 4869: MULX_R	mulx 	%r1, %r1, %r6
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d90289d  ! 4871: WRPR_PSTATE_I	wrpr	%r0, 0x089d, %pstate
	.word 0xcc8008a0  ! 4872: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x81982852  ! 4873: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0852, %hpstate
	.word 0x81982482  ! 4874: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0482, %hpstate
	.word 0x8198291e  ! 4875: WRHPR_HPSTATE_I	wrhpr	%r0, 0x091e, %hpstate
DS_233:
	.word 0x20800001  ! 4877: BN	bn,a	<label_0x1>
	.word 0xd531000b  ! 4877: STQF_R	-	%f10, [%r11, %r4]
	.word 0x89458000  ! 4876: RD_SOFTINT_REG	rd	%softint, %r4
	.word 0x9e792001  ! 4877: SDIV_I	sdiv 	%r4, 0x0001, %r15
	.word 0xde17e001  ! 4878: LDUH_I	lduh	[%r31 + 0x0001], %r15
	.word 0xdf37c00b  ! 4879: STQF_R	-	%f15, [%r11, %r31]
	ta	T_CHANGE_PRIV	! macro
	.word 0x2a700001  ! 4881: BPCS	<illegal instruction>
	.word 0x88c22001  ! 4882: ADDCcc_I	addccc 	%r8, 0x0001, %r4
	.word 0xc88008a0  ! 4883: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
	.word 0xc8c7e000  ! 4884: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r4
	.word 0x8d902650  ! 4885: WRPR_PSTATE_I	wrpr	%r0, 0x0650, %pstate
	.word 0xc857c000  ! 4886: LDSH_R	ldsh	[%r31 + %r0], %r4
	.word 0x8d802000  ! 4887: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8769a001  ! 4888: SDIVX_I	sdivx	%r6, 0x0001, %r3
	.word 0x9ba049e0  ! 4889: FDIVq	dis not found

	.word 0x8d90280b  ! 4890: WRPR_PSTATE_I	wrpr	%r0, 0x080b, %pstate
	.word 0x8d802004  ! 4891: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x96790005  ! 4892: SDIV_R	sdiv 	%r4, %r5, %r11
	.word 0x82d32001  ! 4893: UMULcc_I	umulcc 	%r12, 0x0001, %r1
	.word 0xc2d004a0  ! 4894: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r1
	.word 0x89d02031  ! 4895: Tcc_I	tleu	icc_or_xcc, %r0 + 49
	.word 0xc2cfe030  ! 4896: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r1
	mov 0x35, %r30
	.word 0x97d0001e  ! 4897: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x87802004  ! 4898: WRASI_I	wr	%r0, 0x0004, %asi
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_TO_TL0	! macro
	mov 0x32, %r30
	.word 0x93d0001e  ! 4901: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x85a289ee  ! 4902: FDIVq	dis not found

	.word 0x36700001  ! 4903: BPGE	<illegal instruction>
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81982092  ! 4905: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0092, %hpstate
	.word 0x80d9800e  ! 4906: SMULcc_R	smulcc 	%r6, %r14, %r0
	.word 0xc08008a0  ! 4907: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0xc08804a0  ! 4908: LDUBA_R	lduba	[%r0, %r0] 0x25, %r0
	.word 0x87802004  ! 4909: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8d9022d3  ! 4910: WRPR_PSTATE_I	wrpr	%r0, 0x02d3, %pstate
	.word 0x95a000ce  ! 4911: FNEGd	fnegd	%f14, %f10
	.word 0xd47fe001  ! 4912: SWAP_I	swap	%r10, [%r31 + 0x0001]
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8198271d  ! 4914: WRHPR_HPSTATE_I	wrhpr	%r0, 0x071d, %hpstate
	.word 0x8250000e  ! 4915: UMUL_R	umul 	%r0, %r14, %r1
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81982858  ! 4918: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0858, %hpstate
	.word 0x81982612  ! 4919: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0612, %hpstate
	.word 0x8dd02033  ! 4920: Tcc_I	tneg	icc_or_xcc, %r0 + 51
	.word 0x9f50c000  ! 4921: RDPR_TT	rdpr	%tt, %r15
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87802014  ! 4923: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x984a400c  ! 4924: MULX_R	mulx 	%r9, %r12, %r12
	.word 0x99a00569  ! 4925: FSQRTq	fsqrt	
	.word 0x816be001  ! 4926: SDIVX_I	sdivx	%r15, 0x0001, %r0
	.word 0x81982c51  ! 4927: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c51, %hpstate
	.word 0xc0d004a0  ! 4928: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r0
	.word 0x819822ce  ! 4929: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02ce, %hpstate
	.word 0x3c800001  ! 4930: BPOS	bpos,a	<label_0x1>
	.word 0x8198200c  ! 4931: WRHPR_HPSTATE_I	wrhpr	%r0, 0x000c, %hpstate
	.word 0x8198278f  ! 4932: WRHPR_HPSTATE_I	wrhpr	%r0, 0x078f, %hpstate
DS_234:
	.word 0x34800001  ! 4934: BG	bg,a	<label_0x1>
	.word 0xcf31e001  ! 4934: STQF_I	-	%f7, [0x0001, %r7]
	.word 0x8d458000  ! 4933: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0xcc8008a0  ! 4934: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x81982f13  ! 4936: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f13, %hpstate
	mov 0x33, %r30
	.word 0x8bd0001e  ! 4937: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x8d902046  ! 4938: WRPR_PSTATE_I	wrpr	%r0, 0x0046, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x819826dc  ! 4940: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06dc, %hpstate
	.word 0xcc2fe001  ! 4941: STB_I	stb	%r6, [%r31 + 0x0001]
	.word 0x83d02030  ! 4942: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x8d802000  ! 4943: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8198205b  ! 4944: WRHPR_HPSTATE_I	wrhpr	%r0, 0x005b, %hpstate
	.word 0xcc57e001  ! 4945: LDSH_I	ldsh	[%r31 + 0x0001], %r6
	.word 0x83508000  ! 4946: RDPR_TSTATE	rdpr	%tstate, %r1
	.word 0x956b000c  ! 4947: SDIVX_R	sdivx	%r12, %r12, %r10
	.word 0x8d902a17  ! 4948: WRPR_PSTATE_I	wrpr	%r0, 0x0a17, %pstate
	.word 0x89494000  ! 4949: RDHPR_HTBA	rdhpr	%htba, %r4
	.word 0x87802080  ! 4950: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x8f50c000  ! 4951: RDPR_TT	rdpr	%tt, %r7
	.word 0x93514000  ! 4952: RDPR_TBA	rdpr	%tba, %r9
	.word 0x9b51c000  ! 4953: RDPR_TL	rdpr	%tl, %r13
	.word 0x8d802000  ! 4954: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982a83  ! 4955: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a83, %hpstate
	.word 0x87802010  ! 4956: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xdaffc02c  ! 4957: SWAPA_R	swapa	%r13, [%r31 + %r12] 0x01
	ta	T_CHANGE_PRIV	! macro
	.word 0x81982648  ! 4959: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0648, %hpstate
	.word 0x8d802004  ! 4960: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x81982e97  ! 4961: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e97, %hpstate
	mov 0x35, %r30
	.word 0x8bd0001e  ! 4962: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x81982252  ! 4963: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0252, %hpstate
	.word 0x8d90221a  ! 4964: WRPR_PSTATE_I	wrpr	%r0, 0x021a, %pstate
	.word 0xda8804a0  ! 4965: LDUBA_R	lduba	[%r0, %r0] 0x25, %r13
	.word 0x81982c93  ! 4966: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c93, %hpstate
	.word 0x87802080  ! 4967: WRASI_I	wr	%r0, 0x0080, %asi
DS_235:
	.word 0x20800001  ! 4969: BN	bn,a	<label_0x1>
	.word 0xcb300007  ! 4969: STQF_R	-	%f5, [%r7, %r0]
	.word 0x85458000  ! 4968: RD_SOFTINT_REG	rd	%softint, %r2
	.word 0xc41fe001  ! 4969: LDD_I	ldd	[%r31 + 0x0001], %r2
	.word 0x81982185  ! 4970: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0185, %hpstate
	ta	T_CHANGE_PRIV	! macro
	mov 0x32, %r30
	.word 0x9fd0001e  ! 4972: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0x87802004  ! 4974: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87d02032  ! 4975: Tcc_I	tl	icc_or_xcc, %r0 + 50
	.word 0x8a4b0008  ! 4976: MULX_R	mulx 	%r12, %r8, %r5
	.word 0xca8008a0  ! 4977: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0xca8804a0  ! 4978: LDUBA_R	lduba	[%r0, %r0] 0x25, %r5
	mov 0x35, %r30
	.word 0x9dd0001e  ! 4979: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x2c700001  ! 4981: BPNEG	<illegal instruction>
	.word 0x87802016  ! 4982: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x9c4b2001  ! 4983: MULX_I	mulx 	%r12, 0x0001, %r14
	.word 0x8d90268f  ! 4984: WRPR_PSTATE_I	wrpr	%r0, 0x068f, %pstate
	.word 0xdc3fc008  ! 4985: STD_R	std	%r14, [%r31 + %r8]
	.word 0x87802016  ! 4986: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8d9026ce  ! 4987: WRPR_PSTATE_I	wrpr	%r0, 0x06ce, %pstate
	mov 0x35, %r30
	.word 0x81d0001e  ! 4988: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x30800001  ! 4989: BA	ba,a	<label_0x1>
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xdc9fc020  ! 4991: LDDA_R	ldda	[%r31, %r0] 0x01, %r14
	.word 0x8fa0cdc0  ! 4992: FdMULq	fdmulq	
DS_236:
	.word 0x22800001  ! 4994: BE	be,a	<label_0x1>
	illtrap
	.word 0x85b0c307  ! 4993: ALLIGNADDRESS	alignaddr	%r3, %r7, %r2
	mov 0x33, %r30
	.word 0x83d0001e  ! 4994: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x886b6001  ! 4995: UDIVX_I	udivx 	%r13, 0x0001, %r4
	.word 0x22800001  ! 4996: BE	be,a	<label_0x1>
	.word 0x80c26001  ! 4997: ADDCcc_I	addccc 	%r9, 0x0001, %r0
	ta	T_CHANGE_NONPRIV	! macro


.data
user_data_start:
	.xword	0xec13e94c267306e6
	.xword	0x1c35911ebd0c0d65
	.xword	0xb4e4b143527daf12
	.xword	0x35ab57375acaadf3
	.xword	0x831138ee97b8453c
	.xword	0x94f6b9e2b38be0bd
	.xword	0xc7c4848cfb2682af
	.xword	0x2642172a7d8ab902
	.xword	0x0750ba62642973b1
	.xword	0x524414b8baf34f67
	.xword	0x6c94c4379f70cbcb
	.xword	0x553d17b436a85bcc
	.xword	0xe86456d6f43b58a9
	.xword	0x034f1f762a1dc7f2
	.xword	0xce6ffc3dd22a5cfd
	.xword	0xb5696211557403dc
	.xword	0x84fbf0715168a2ba
	.xword	0x4254a59719a3c8a2
	.xword	0x814b6bf3f3791c31
	.xword	0xbcacd21ede2e57e5
	.xword	0xc206cb80a04b5ea1
	.xword	0xb681dba9b1030743
	.xword	0x6376238c38fab847
	.xword	0x1fbcfba8f2a4a679
	.xword	0x82f158288e4b55bd
	.xword	0x59447a0d02835ba8
	.xword	0xddcb04e648e6a21f
	.xword	0xafd7250b0f921d19
	.xword	0xd33f3dd8d1abf18e
	.xword	0x531d4e16449b46b0
	.xword	0x7112ea7d2b349808
	.xword	0xf50ca9a968546182
	.xword	0x8ed6a222a1287bda
	.xword	0xb8edf6663b8536a4
	.xword	0xc00bae6c91187701
	.xword	0xbaee6720f7dfa4bf
	.xword	0x9bf051b12a9d246e
	.xword	0x3b26035372c50771
	.xword	0x22175680ed5e22af
	.xword	0xd0e1cf83d7ce515f
	.xword	0xbe037056a7c2ba8b
	.xword	0x56719731cf1643b9
	.xword	0x3ecc1f79763893d5
	.xword	0xd97e3cf728c43b90
	.xword	0xb020210ad0b55d67
	.xword	0x8c24ae38dfc0f343
	.xword	0x035a57b0e5d48e82
	.xword	0x6612368869dccb6d
	.xword	0xad229a06396e4776
	.xword	0xeeee95c47343bccc
	.xword	0xbf68aa084e194dd5
	.xword	0xa37eedfe571f5291
	.xword	0x3d2ef106e1d711e8
	.xword	0x671e2e05d9605385
	.xword	0xf8c3401b80392d4f
	.xword	0x8d13c365b117d4ee
	.xword	0xe9e340dd02eb394b
	.xword	0xedce951e80d1ed76
	.xword	0xdf65f451e8ffbcdb
	.xword	0x827f150b8bc6fa47
	.xword	0x2115cd4d6b539645
	.xword	0xaff13f072637bf60
	.xword	0xb88afee78a2b1450
	.xword	0xe64033538fe9c213
	.xword	0x107bc21539c1cf6e
	.xword	0xdc11f89e5a902e19
	.xword	0xdad02fb6fbb90a9c
	.xword	0x867c9f73fa566328
	.xword	0x0f8404fb8b899370
	.xword	0x3198ea5a37f54c03
	.xword	0x29f4a3e1ce78c423
	.xword	0x17e0b28f79a61b8d
	.xword	0x01b30cae8471995d
	.xword	0x9f838e9aa04fb422
	.xword	0x6b505cfe352d603b
	.xword	0x2849952e35f8a23f
	.xword	0x4fa20b25f0e2fb8d
	.xword	0x830963ac73315213
	.xword	0x0fe30ba7a994c9bf
	.xword	0xb2d0dfed2e4d428f
	.xword	0x367bc916e8d9a42a
	.xword	0x0863d498b12fb9ea
	.xword	0x3e13c254fd6f4c2f
	.xword	0xf6749b8340a79ed9
	.xword	0x443274a59c0d5670
	.xword	0xdf5ac9d974063077
	.xword	0xd115c45eee403b54
	.xword	0x35009bde4c6dd6e8
	.xword	0x4fc38a6cba5efea4
	.xword	0x0508d663773e96d7
	.xword	0x5d2cd5983c48b470
	.xword	0xab51824b0c094ee2
	.xword	0x0bd6fe8f25c8d14e
	.xword	0xc0c2a092e1edb260
	.xword	0xdd69360d150add7f
	.xword	0x26bd6d35161f90c5
	.xword	0x565ad78ad9782519
	.xword	0xcd7aa8227db96b5d
	.xword	0x2695f12e00fb6fe6
	.xword	0x615103332a808fea
	.xword	0x2a2eec9fae3ab381
	.xword	0xdc2f5ec4b4e9152b
	.xword	0x7fe0e61a8db7ff1d
	.xword	0x81df727233ec242f
	.xword	0x7a5ffcd07b6f824c
	.xword	0x870fe44cdaa4dbb4
	.xword	0x0ed9d4ed14b21715
	.xword	0x04887bfda01a000b
	.xword	0x9c142107da4a53e3
	.xword	0x847fe74dc7f4b588
	.xword	0x8e730cfe0936e1b4
	.xword	0x2a0bc74af19fa1ec
	.xword	0x8d17114ebc8c809f
	.xword	0xa55433f2a89e50fd
	.xword	0xef4d5b02ab9757af
	.xword	0x6ebcbdc1fda75802
	.xword	0x0f7ea4eb5001e808
	.xword	0xe0a3c73835337d5a
	.xword	0xd2ca819deeaca724
	.xword	0x3f45b0e8f829f2fe
	.xword	0x5a49fba13a9fc166
	.xword	0x5104f6ba218c02db
	.xword	0x555459d544e9d076
	.xword	0x707bdd7c9c9501b4
	.xword	0xfa05cbe307fb2411
	.xword	0x81a0ce15debd9d46
	.xword	0x2f56fbe6a1aa1f51
	.xword	0xd1fdaa6b90f73ffe
	.xword	0xb5f6f69d230e2541
	.xword	0xea477ef261ad6fed
	.xword	0xf65e7d2e5f688dc1
	.xword	0x30db3cba6ace8817
	.xword	0x7958bbef241b5581
	.xword	0x7ffcec1f8a5bc9fd
	.xword	0xe75a01fcf9b8bd5a
	.xword	0x1e4cda907b0652c3
	.xword	0x95cd847016ff3e1d
	.xword	0x73fd82b8a1c5c97c
	.xword	0x5e30d82b2b6a2e95
	.xword	0x0eae7ff32f84f450
	.xword	0x256da129ac0c2c82
	.xword	0x59879e11ba8481f7
	.xword	0xff323ca61da5255c
	.xword	0x832108352e159ada
	.xword	0x905c0694da311914
	.xword	0xc385888e5383dc6d
	.xword	0xcb23c74053316ac8
	.xword	0x9a1d44a17f8826b9
	.xword	0x06997da8b4d1c933
	.xword	0x0fe38d8b4d4d2acd
	.xword	0x27315e48a9ddd0bd
	.xword	0xf29fa537670a954f
	.xword	0x48a771c4198631e5
	.xword	0xf88f573647949e6b
	.xword	0x34c3c2bf5bb19def
	.xword	0x2355f57d6db946dd
	.xword	0xa95617cf74344eba
	.xword	0xb23233b569c9ca26
	.xword	0xe9228bb0d93e00a5
	.xword	0xd72e2786d145dade
	.xword	0x6fc459ecbb125669
	.xword	0x40863bbc48cd15bd
	.xword	0xcc316fcee75918bc
	.xword	0xbb78af85a92a5680
	.xword	0x52afc1d719ee40ec
	.xword	0x1ab675d44692f1ad
	.xword	0xf752f165df3a480e
	.xword	0xcabd2d158b1bf5f2
	.xword	0x4a313b553d844d50
	.xword	0x5b83067c17b5193a
	.xword	0x572a45e6d0caea30
	.xword	0x49d7194920c313e0
	.xword	0x7453209dab8091c8
	.xword	0x5d0e6e98dfe7c40c
	.xword	0x3a91ca3afa9b68f2
	.xword	0x1aa497cbc845489d
	.xword	0x0df84b6d1359027d
	.xword	0x1aa7c31382e9ea7d
	.xword	0x51e2171b04c5deab
	.xword	0x31f32e7bc3058a18
	.xword	0xc85f65420127d358
	.xword	0x116fe62364cf6690
	.xword	0x7165cafb137bc84e
	.xword	0xcc8764290235f012
	.xword	0x1a2cb3b0d2c054f9
	.xword	0xd06c1965005ac8f0
	.xword	0x4dc94b257e0430a6
	.xword	0x42f0af26c95ee2ca
	.xword	0x29eb2fb08b8ec794
	.xword	0x0d0355d3a908d874
	.xword	0x8d5268d3a38295bc
	.xword	0xa8c402e8fbbaacc9
	.xword	0xf6da88453f14ffb5
	.xword	0x7b2825a8c9615755
	.xword	0x0da588a43295d04a
	.xword	0x7bc4c13773cc1d55
	.xword	0x328b425c710b3e68
	.xword	0x5464fa1fd0633cc1
	.xword	0x04b7d25c1bcc5f59
	.xword	0x237707492caf7bba
	.xword	0x39a19f089dc0274b
	.xword	0x7d29bb72d9f4033e
	.xword	0x41cf4debff725eeb
	.xword	0x567fb7d1e5dc8ce3
	.xword	0xb8363bfba049cf72
	.xword	0x498215c7321aad4e
	.xword	0xca9a2bda8c9eab34
	.xword	0x2c2234ba50ee4141
	.xword	0x7d2e72b83dcc1fc2
	.xword	0x98b37d2dfa4d264c
	.xword	0xbc3bc38cbf3fc2c0
	.xword	0x72cabccd62b2816a
	.xword	0x0d2b8d5df1f00a35
	.xword	0x8b38dada57711777
	.xword	0xac4252b6a6f154cb
	.xword	0xd6b13e659d1e7bce
	.xword	0xb8d55e41356f8857
	.xword	0x46c3f00d6dbb6b15
	.xword	0x4b53ccf81deb7262
	.xword	0x93891cd2f06dcc4c
	.xword	0xd7a035176a4565ce
	.xword	0x9421cc1b51669cfd
	.xword	0x29aac3a3aa2e2eb9
	.xword	0x070b20f8f9f82a89
	.xword	0xf75d01fbd44e6ae1
	.xword	0x4a905abec6b5900b
	.xword	0x104ac5ab64f8a595
	.xword	0x323099c448fb2913
	.xword	0xe049e3b19df6321b
	.xword	0x9c0ab1a40e51968c
	.xword	0x07c3c102889b37d2
	.xword	0x9a89161de181f8b8
	.xword	0x1898a1c9f661d191
	.xword	0x9613a8e0ecdfde19
	.xword	0xd489c7ae3d31c2c9
	.xword	0x84a28c3d7df19010
	.xword	0xd21d98975c7685c8
	.xword	0x01ea926a3c9637af
	.xword	0x73ddb19ddb035238
	.xword	0x291e68c11aedd59b
	.xword	0xaa688f78d087ddf1
	.xword	0x4d0bd3d63762da52
	.xword	0xe0bccbb8307958bf
	.xword	0x89c448ea02a24e1e
	.xword	0x79ab426adff1f2c2
	.xword	0x8e980bbbf1574845
	.xword	0xc1dc5667cfb1285e
	.xword	0x36d82c05080423d7
	.xword	0x6b16b7f36f6564c0
	.xword	0xbfe7639a62d67854
	.xword	0x799d9161e56adb66
	.xword	0x20696dbc8b7f8a46
	.xword	0xdeccb1f039426a92
	.xword	0x1573aa0ddcdd35f0
	.xword	0xecca573f4f9d6f37
	.xword	0x4923755428da446e


.text
    nop
    nop
    nop
    ta T_GOOD_TRAP
    nop
    nop
    nop
.data
    .xword 0x0

SECTION .HTRAPS
.text
htrap_5_ext:
    rd %pc, %g2
    inc %g3
    add %g2, htrap_5_ext_done-htrap_5_ext, %g2
    rdpr %tl, %g3
    rdpr %tstate, %g4
    rdhpr %htstate, %g5
    inc %g3
    wrpr %g3, %tl
    wrpr %g2, %tpc
    wrpr %g4, %tstate
    wrhpr %g5, %htstate
    retry
htrap_5_ext_done:
    done

wdog_2_ext:
    mov 0x1f, %g1
    stxa    %g1, [%g0] ASI_LSU_CTL_REG
    stxa    %g0, [%g0] ASI_ERROR_INJECT
    ! Lower the Trap Level
    wrpr    %g0, 1, %tl
    ! Skip the instruction
    done

#if 0
!!# /*
!!#  output of /import/bw/tools/local/indra-release/indra,1.4.11/bin/ijpp (indrajal preprocessor) - Wed Apr  7 18:31:45 2004
!!#  */
!!# 
!!# %%section c_declarations
!!# 
!!#     int label = 0;
!!# 
!!# #define HTRAPS	0
!!# 
!!# %%
!!# %%section control
!!# 
!!# %%
!!# %%section init
!!# {
!!# 
!!# 
!!#     IJ_bind_thread_group("diag.j", 30, th0, 0x01);
!!# 
!!#     // Random 64 bits //
!!#     IJ_set_rvar("diag.j", 33, Rv_rand_64,"64'hrrrrrrrr_rrrrrrrr");
!!# 
!!#     // Register usage - use 0-27 //
!!#     // R31 is memory pointer
!!#     // R30 is trap number register
!!#     //
!!#     IJ_set_ropr_fld("diag.j", 39, ijdefault, Ft_Rs1, "5'b0rrrr");
!!#     IJ_set_ropr_fld("diag.j", 40, ijdefault, Ft_Rs2, "5'b0rrrr");
!!#     IJ_set_ropr_fld("diag.j", 41, ijdefault, Ft_Rd, "5'b0rrrr");
!!# 
!!#     // Load/Store pointer = r31
!!#     IJ_set_ropr_fld("diag.j", 44, Ro_ldst_ptr, Ft_Rs1, "{31}");
!!# 
!!#     // ASI register values 
!!#     IJ_set_ropr_fld("diag.j", 47, Ro_wrasi_i, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 48, Ro_wrasi_i, Ft_Simm13, "{0x4, 0x10, 0x14, 0x16, 0x80, 0x88, 0x89}");
!!# 
!!#     // General Ldst ASIs to use .. 50% should be illegal ..
!!#     IJ_set_ropr_fld("diag.j", 51, Ro_nontrap_ldasi, Ft_Imm_Asi, "{0x12,0x14, 0x16, 0x80, 0x88}");
!!#     IJ_set_ropr_fld("diag.j", 52, Ro_nontrap_ldasi, Ft_Rs1, "{31}");
!!#     IJ_set_ropr_fld("diag.j", 53, Ro_nontrap_ldasi, Ft_Rs2, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 54, Ro_nontrap_ldasi, Ft_Simm13, "{0x0}, 6'brr0000");
!!# 
!!#     IJ_set_ropr_fld("diag.j", 56, Ro_nontrap_ldasi_z, Ft_Imm_Asi, "{0x45, 0x53..0x64}");
!!#     IJ_set_ropr_fld("diag.j", 57, Ro_nontrap_ldasi_z, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 58, Ro_nontrap_ldasi_z, Ft_Rs2, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 59, Ro_nontrap_ldasi_z, Ft_Simm13, "{0x0}, 6'brr0000");
!!# 
!!#     // General Ldst alignment to use .. 50% should be illegal ..
!!#     IJ_set_ropr_fld("diag.j", 62, Ro_nontrap_ld, Fm_align_Simm13, "{0x0..0x7}");
!!#     IJ_set_ropr_fld("diag.j", 63, Ro_nontrap_ld, Ft_Rs1, "{31}");
!!#     IJ_set_ropr_fld("diag.j", 64, Ro_nontrap_ld, Ft_Rs2, "{0}");
!!# 
!!#     // Trap ASI operands
!!#     IJ_set_ropr_fld("diag.j", 67, Ro_traps_asi, Ft_Imm_Asi, "{0x25, 0x72..0x74}");
!!#     IJ_set_ropr_fld("diag.j", 68, Ro_traps_asi, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 69, Ro_traps_asi, Ft_Rs2, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 70, Ro_traps_asi, Ft_Simm13, "{0x25, 0x72..0x74}");
!!# 
!!#     // Trap #s to use
!!#     IJ_set_ropr_fld("diag.j", 73, Ro_traps_i, Ft_Sw_Trap, "{0x30..0x35 }");
!!#     IJ_set_ropr_fld("diag.j", 74, Ro_traps_i, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 75, Ro_traps_i, Ft_Cond_f2, "{0x0 .. 0xf}");
!!#     IJ_set_ropr_fld("diag.j", 76, Ro_traps_r, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 77, Ro_traps_r, Ft_Rs2, "{30}");
!!#     IJ_set_ropr_fld("diag.j", 78, Ro_traps_r, Ft_Cond_f2, "{0x0 .. 0xf}");
!!#     IJ_set_ropr_fld("diag.j", 79, Ro_traps_r, Ft_Simm13, "{0x30..0x35}");
!!#     IJ_set_rvar("diag.j", 80, Rv_init_trap, "{0x30..0x35}");
!!# 
!!#     // FPRS splash
!!#     IJ_set_ropr_fld("diag.j", 83, Ro_wrfprs, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 84, Ro_wrfprs, Ft_Simm13, "{0, 4}");
!!# 
!!#     // Pstate splash
!!#     IJ_set_ropr_fld("diag.j", 87, Ro_wrpstate, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 88, Ro_wrpstate, Ft_Simm13, "12'b0rrr0rr0rrrrr");
!!# 
!!#     // Hpstate splash
!!#     IJ_set_ropr_fld("diag.j", 91, Ro_wrhpstate, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 92, Ro_wrhpstate, Ft_Simm13, "12'brrrrrr0rrrrr");
!!# 
!!#     // Weights
!!#     IJ_set_default_rule_wt_rvar ("diag.j", 95,"{10}");
!!#     IJ_set_rvar("diag.j", 96, wt_high, "{60}");
!!#     IJ_set_rvar("diag.j", 97, wt_med,  "{30}");
!!#     IJ_set_rvar("diag.j", 98, wt_low,  "{10}");
!!# 
!!#     // Initialize registers ..
!!#     int i, j, k;
!!#     IJ_printf  ("diag.j", 102, th0,"!Initializing integer registers\n");
!!#     for (k=0; k<3; k++) {
!!#         for (i = 0; i < 31; i++) {
!!#             j=i*8;
!!#             IJ_printf  ("diag.j", 106, th0,"\tldx [%%r31+%d], %%r%d\n", j,i);
!!#         }
!!#         IJ_printf  ("diag.j", 108, th0,"\tsave %%r31, %%r0, %%r31\n");
!!#     }
!!#     for (k=0; k<3; k++) {
!!#         IJ_printf  ("diag.j", 111, th0,"\trestore\n");
!!#     }
!!# 
!!#     IJ_printf  ("diag.j", 114, th0,"!Initializing float registers\n");
!!#     for (i = 0; i < 31; i=i+2) {
!!#         j=i*8;
!!#         IJ_printf  ("diag.j", 117, th0,"\tldd [%%r31+%d], %%f%d\n", j,i);
!!#     }
!!# 
!!# }
!!# 
!!# %%
!!# %%section finish
!!# {
!!# 
!!# 
!!#     int i;
!!#     IJ_printf  ("diag.j", 123, th0,"\n\n.data\nuser_data_start:\n");
!!#     for (i = 0; i < 256; i++) {
!!#         IJ_printf  ("diag.j", 125, th0,"\t.xword\t0x%016llrx\n", Rv_rand_64);
!!#     }
!!# 
!!# }
!!# 
!!# %%
!!# %%section map
!!# 
!!# %%
!!# %%section grammar
!!# 
!!# 
!!# block: inst | block inst
!!#     {
!!#         IJ_generate ("diag.j", 558, th0, $2);
!!#     };
!!# 
!!# inst:      trap_asr     %rvar  wt_low
!!#         |  trap_asi     %rvar  wt_low
!!#         |  tcc          %rvar  wt_med
!!#         | ldst_excp     %rvar  wt_low
!!#         | ldstasi_excp  %rvar  wt_low
!!#         | ldstasi_excp_z  %rvar  wt_low
!!#         | change_mode   %rvar  wt_med
!!#         | alu           %rvar  wt_high
!!#         | branches      %rvar  wt_med
!!#         | wrasi         %rvar  wt_low
!!#         | splash_fprs   %rvar  wt_low
!!#         | splash_pstate %rvar  wt_med
!!#         | splash_hpstate %rvar  wt_med
!!#         | stores        %rvar  wt_low
!!# ;
!!# 
!!# change_mode :   
!!#       tCHANGE_NONPRIV 
!!#     | tCHANGE_PRIV 
!!#     | tCHANGE_NONHPRIV
!!#     | tCHANGE_HPRIV 
!!#     //| tCHANGE_TO_TL1 
!!#     | tCHANGE_TO_TL0 
!!# ;
!!# 
!!# trap_asr :
!!#       tRDPR_TPC 
!!#     | tRDPR_TSTATE 
!!#     | tRDPR_TT
!!#     | tRDPR_TNPC
!!#     | tRDPR_TBA
!!#     | tRDPR_TL
!!#     | tRDHPR_HTBA
!!#     | tRDHPR_HPSTATE
!!# ;
!!# 
!!# splash_fprs :
!!#     tWRFPRS_I %ropr  Ro_wrfprs
!!# ;
!!# 
!!# splash_pstate :
!!#     tWRPR_PSTATE_I %ropr  Ro_wrpstate
!!# ;
!!# 
!!# splash_hpstate :
!!#     tWRHPR_HPSTATE_I %ropr  Ro_wrhpstate
!!# ;
!!# 
!!# trap_asi : 
!!#     asi_load_r %ropr  Ro_traps_asi
!!# ;
!!# 
!!# wrasi : tWRASI_I %ropr  Ro_wrasi_i
!!# ;
!!# reg_tcc : tTcc_R %ropr  Ro_traps_r
!!#      { 
!!#      IJ_printf("diag.j", 619, th0, "\tmov 0x%rx, %%r30\n", Rv_init_trap);
!!#      }
!!# ;
!!# 
!!# tcc :
!!#      tTcc_I %ropr  Ro_traps_i  
!!#      | reg_tcc
!!# 
!!# ;
!!# 
!!# ldst_excp : 
!!#         ldds %ropr  Ro_nontrap_ld  |
!!#         load_r %ropr  Ro_nontrap_ld  |
!!#         load_i %ropr  Ro_nontrap_ld 
!!# 
!!# ;
!!# 
!!# ldstasi_excp : 
!!#         asi_load_i %ropr  Ro_nontrap_ldasi
!!# ;
!!# ldstasi_excp_z : 
!!#          tLDUWA_R %ropr  Ro_nontrap_ldasi_z
!!# ;
!!# 
!!# ldds: tLDD_R | tLDD_I | tLDDA_I  | tLDDA_R
!!# ;
!!# 
!!# stores:
!!#     stds %ropr  Ro_ldst_ptr |
!!#     stfs %ropr  Ro_ldst_ptr |
!!#     stqfs %ropr  Ro_ldst_ptr |
!!#     sts %ropr  Ro_ldst_ptr 
!!# ;
!!# stds:  tSTDA_R | tSTDA_I | tSTD_R | tSTD_I | tSTDF_R | tSTDF_I
!!# ;
!!# stfs: tSTF_R | tSTF_I
!!# ;
!!# stqfs: tSTQF_R | tSTQF_I
!!# ;
!!# sts:   tSTB_R | tSTB_I | tSTH_R | tSTH_I | tSTW_R | tSTW_I | tSTX_R | tSTX_I
!!# 
!!# ;
!!# 
!!# load_r: tLDSB_R | tLDSH_R | tLDSW_R | tLDUB_R | tLDUH_R | tLDUW_R | tLDX_R 
!!#         | tLDQF_R 
!!# ;
!!# 
!!# load_i: tLDSB_I | tLDSH_I | tLDSW_I | tLDUB_I | tLDUH_I | tLDUW_I | tLDX_I 
!!#         | tLDQFA_I 
!!# ;
!!# 
!!# asi_load_i: tLDSBA_I | tLDSHA_I | tLDSWA_I | tLDUBA_I | tLDUHA_I | tLDXA_I
!!# ;
!!# 
!!# asi_load_r:tLDSBA_R | tLDSHA_R | tLDSWA_R | tLDUBA_R | tLDUHA_R | tLDXA_R 
!!# ;
!!# 
!!# asi_store_i: tSTBA_I | tSTHA_I | tSTWA_I | tSTXA_I
!!# ;
!!# 
!!# asi_store_r: tSTBA_R | tSTHA_R | tSTWA_R | tSTXA_R
!!# ;
!!# 
!!# alu :
!!#      tADD_I | tADDcc_R | tADDcc_I | tADDCcc_I |
!!#      tMULX_R | tMULX_I | tUMUL_R | tUMULcc_R | tUMULcc_I |
!!#      tSMULcc_R | tSDIV_I | tSDIV_R | tSDIVX_R | tSDIVX_I |  tUDIVX_R |
!!#      tUDIVX_I | tFDIVs | tFDIVd | tFDIVq | tSWAP_I %ropr  Ro_ldst_ptr |
!!#      tSWAPA_R %ropr  Ro_ldst_ptr | tCASA_I %ropr  Ro_ldst_ptr |
!!#      tFSQRTq | tFSQRTd | tFsMULd | tFdMULq | tFqTOi | tFNEGd //| tFONES
!!# ;
!!# 
!!# br :     tBA | tBLE | tBGE | tBL | tBGU  | tBLEU | tBN | tBNE | tBE | tBG |
!!#          tBCC | tBCS | tBPOS | tBNEG | tBVC | tBVS | tBPA | tBPN | tBPNE |
!!#          tBPE | tBPG | tBPLE | tBPGE | tBPL | tBPGU | tBPLEU | tBPCC | tBPCS |
!!#          tBPPOS | tBPNEG | tBPVC | tBPVS
!!# ;
!!# 
!!# branches : br | br_badelay ;
!!# 
!!# br_badelay : tRD_SOFTINT_REG 
!!#     {
!!#         IJ_printf("diag.j", 703, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 704,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         IJ_generate_from_token("diag.j", 705,1, th0, ijdefault, tSTQF_I, tSTQF_R, -1);;
!!#     } | tALLIGNADDRESS
!!#     {
!!#         IJ_printf("diag.j", 708, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 709,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         IJ_printf("diag.j", 710, th0, "\tilltrap\n");
!!#     } 
!!# ;
!!# 
!!# 
!!# 
!!# 
!!# %%
!!# %%section cbfunc
!!# 
!!# %%
!!# %%section stat
!!# 
!!# %%
#endif

