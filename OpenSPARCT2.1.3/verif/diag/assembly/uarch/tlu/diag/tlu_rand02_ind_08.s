/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand02_ind_08.s
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
	mov 0x32, %r30
	.word 0x83d0001e  ! 1: Tcc_R	te	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9469c00d  ! 3: UDIVX_R	udivx 	%r7, %r13, %r10
DS_0:
	.word 0x34800001  ! 5: BG	bg,a	<label_0x1>
	illtrap
	.word 0x81b0c301  ! 4: ALLIGNADDRESS	alignaddr	%r3, %r1, %r0
	.word 0x86d28001  ! 5: UMULcc_R	umulcc 	%r10, %r1, %r3
	.word 0x89a2c9e6  ! 6: FDIVq	dis not found

DS_1:
	.word 0x34800001  ! 8: BG	bg,a	<label_0x1>
	.word 0xcd320008  ! 8: STQF_R	-	%f6, [%r8, %r8]
	.word 0x87458000  ! 7: RD_SOFTINT_REG	rd	%softint, %r3
	mov 0x32, %r30
	.word 0x8bd0001e  ! 8: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x8ba0054e  ! 9: FSQRTd	fsqrt	
	.word 0xca9fc020  ! 10: LDDA_R	ldda	[%r31, %r0] 0x01, %r5
	.word 0xcabfc02e  ! 11: STDA_R	stda	%r5, [%r31 + %r14] 0x01
	.word 0x3c800001  ! 12: BPOS	bpos,a	<label_0x1>
	.word 0x87802010  ! 13: WRASI_I	wr	%r0, 0x0010, %asi
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xcad80e40  ! 15: LDXA_R	ldxa	[%r0, %r0] 0x72, %r5
	.word 0x84812001  ! 16: ADDcc_I	addcc 	%r4, 0x0001, %r2
	.word 0x8fd02031  ! 17: Tcc_I	tvs	icc_or_xcc, %r0 + 49
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87802004  ! 19: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x827b8002  ! 20: SDIV_R	sdiv 	%r14, %r2, %r1
	.word 0x81982a84  ! 21: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a84, %hpstate
	.word 0x996a4008  ! 22: SDIVX_R	sdivx	%r9, %r8, %r12
DS_2:
	.word 0x34800001  ! 24: BG	bg,a	<label_0x1>
	illtrap
	.word 0x91b3c30c  ! 23: ALLIGNADDRESS	alignaddr	%r15, %r12, %r8
	.word 0x9b480000  ! 24: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
	ta	T_CHANGE_PRIV	! macro
	mov 0x31, %r30
	.word 0x9dd0001e  ! 26: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x99a000cd  ! 27: FNEGd	fnegd	%f44, %f12
	.word 0xd89fc020  ! 28: LDDA_R	ldda	[%r31, %r0] 0x01, %r12
	.word 0x2c800001  ! 29: BNEG	bneg,a	<label_0x1>
	.word 0x80d8c00f  ! 30: SMULcc_R	smulcc 	%r3, %r15, %r0
	.word 0x97d02035  ! 31: Tcc_I	tge	icc_or_xcc, %r0 + 53
	.word 0x8d802000  ! 32: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x20700001  ! 33: BPN	<illegal instruction>
	.word 0xc08008a0  ! 34: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0x8e534005  ! 35: UMUL_R	umul 	%r13, %r5, %r7
	ta	T_CHANGE_PRIV	! macro
	.word 0x94498001  ! 37: MULX_R	mulx 	%r6, %r1, %r10
	.word 0xd48008a0  ! 38: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x8d902816  ! 39: WRPR_PSTATE_I	wrpr	%r0, 0x0816, %pstate
	.word 0x87802016  ! 40: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8d902844  ! 41: WRPR_PSTATE_I	wrpr	%r0, 0x0844, %pstate
	.word 0xd45fe001  ! 42: LDX_I	ldx	[%r31 + 0x0001], %r10
	.word 0xd447e001  ! 43: LDSW_I	ldsw	[%r31 + 0x0001], %r10
	.word 0x8da00568  ! 44: FSQRTq	fsqrt	
	.word 0x9e486001  ! 45: MULX_I	mulx 	%r1, 0x0001, %r15
	.word 0x99a389e9  ! 46: FDIVq	dis not found

	.word 0x8d51c000  ! 47: RDPR_TL	rdpr	%tl, %r6
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d9024d8  ! 49: WRPR_PSTATE_I	wrpr	%r0, 0x04d8, %pstate
	.word 0x9ed38009  ! 50: UMULcc_R	umulcc 	%r14, %r9, %r15
	.word 0x8d802004  ! 51: WRFPRS_I	wr	%r0, 0x0004, %fprs
DS_3:
	.word 0x34800001  ! 53: BG	bg,a	<label_0x1>
	.word 0xc9312001  ! 53: STQF_I	-	%f4, [0x0001, %r4]
	.word 0x8d458000  ! 52: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0xcd27e001  ! 53: STF_I	st	%f6, [0x0001, %r31]
	.word 0xccd004a0  ! 54: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r6
	.word 0xccd004a0  ! 55: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r6
	.word 0x8cd2a001  ! 56: UMULcc_I	umulcc 	%r10, 0x0001, %r6
	.word 0x8d902412  ! 57: WRPR_PSTATE_I	wrpr	%r0, 0x0412, %pstate
	.word 0x81982b44  ! 58: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b44, %hpstate
	.word 0x3c800001  ! 59: BPOS	bpos,a	<label_0x1>
	mov 0x34, %r30
	.word 0x9dd0001e  ! 60: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x8653c00e  ! 61: UMUL_R	umul 	%r15, %r14, %r3
	.word 0xc6d7e010  ! 62: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r3
	.word 0x8d902893  ! 63: WRPR_PSTATE_I	wrpr	%r0, 0x0893, %pstate
	.word 0xc6d7e000  ! 64: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r3
	.word 0x87802014  ! 65: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x8d90265e  ! 66: WRPR_PSTATE_I	wrpr	%r0, 0x065e, %pstate
	.word 0x8198270c  ! 67: WRHPR_HPSTATE_I	wrhpr	%r0, 0x070c, %hpstate
	.word 0x8d9026c4  ! 68: WRPR_PSTATE_I	wrpr	%r0, 0x06c4, %pstate
	.word 0xc6c004a0  ! 69: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r3
	.word 0x8e80400c  ! 70: ADDcc_R	addcc 	%r1, %r12, %r7
	.word 0x996b2001  ! 71: SDIVX_I	sdivx	%r12, 0x0001, %r12
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d90261d  ! 73: WRPR_PSTATE_I	wrpr	%r0, 0x061d, %pstate
	.word 0x8dd02034  ! 74: Tcc_I	tneg	icc_or_xcc, %r0 + 52
	.word 0xd93fe001  ! 75: STDF_I	std	%f12, [0x0001, %r31]
	.word 0xd8c004a0  ! 76: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r12
	.word 0x8d802000  ! 77: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_HPRIV	! macro
	mov 0x34, %r30
	.word 0x91d0001e  ! 79: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x28700001  ! 80: BPLEU	<illegal instruction>
	.word 0x8d902e99  ! 81: WRPR_PSTATE_I	wrpr	%r0, 0x0e99, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x87d02033  ! 83: Tcc_I	tl	icc_or_xcc, %r0 + 51
	.word 0x8d902695  ! 84: WRPR_PSTATE_I	wrpr	%r0, 0x0695, %pstate
	.word 0xd88008a0  ! 85: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x819821cb  ! 86: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01cb, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x819828ca  ! 88: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08ca, %hpstate
	mov 0x30, %r30
	.word 0x93d0001e  ! 89: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d69400a  ! 90: SDIVX_R	sdivx	%r5, %r10, %r6
	.word 0x8d902449  ! 91: WRPR_PSTATE_I	wrpr	%r0, 0x0449, %pstate
	mov 0x31, %r30
	.word 0x9fd0001e  ! 92: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x8d902acd  ! 93: WRPR_PSTATE_I	wrpr	%r0, 0x0acd, %pstate
	.word 0xccd004a0  ! 94: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r6
	.word 0x8d802000  ! 95: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xccd804a0  ! 97: LDXA_R	ldxa	[%r0, %r0] 0x25, %r6
DS_4:
	.word 0x32800001  ! 99: BNE	bne,a	<label_0x1>
	.word 0xd9328003  ! 99: STQF_R	-	%f12, [%r3, %r10]
	.word 0x89458000  ! 98: RD_SOFTINT_REG	rd	%softint, %r4
	.word 0x8198224a  ! 99: WRHPR_HPSTATE_I	wrhpr	%r0, 0x024a, %hpstate
	.word 0xc93fc003  ! 100: STDF_R	std	%f4, [%r3, %r31]
	.word 0x81a249a7  ! 101: FDIVs	fdivs	%f9, %f7, %f0
	.word 0x93d02032  ! 102: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0xc0c7e010  ! 103: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r0
	.word 0x8a7a000f  ! 104: SDIV_R	sdiv 	%r8, %r15, %r5
	.word 0x81982f49  ! 105: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f49, %hpstate
	.word 0x9da20d2b  ! 106: FsMULd	fsmuld	%f8, %f42, %f14
	.word 0x8fa01a62  ! 107: FqTOi	fqtoi	
	.word 0x8198279e  ! 108: WRHPR_HPSTATE_I	wrhpr	%r0, 0x079e, %hpstate
	.word 0x81982418  ! 109: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0418, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x95a2c9a4  ! 111: FDIVs	fdivs	%f11, %f4, %f10
	.word 0x826ba001  ! 112: UDIVX_I	udivx 	%r14, 0x0001, %r1
	.word 0xc2c004a0  ! 113: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r1
	.word 0xc2d804a0  ! 114: LDXA_R	ldxa	[%r0, %r0] 0x25, %r1
	.word 0xc28008a0  ! 115: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0x9fd02034  ! 116: Tcc_I	tvc	icc_or_xcc, %r0 + 52
	.word 0x81d02030  ! 117: Tcc_I	tn	icc_or_xcc, %r0 + 48
	mov 0x35, %r30
	.word 0x85d0001e  ! 118: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0xc29fc020  ! 119: LDDA_R	ldda	[%r31, %r0] 0x01, %r1
DS_5:
	.word 0x20800001  ! 121: BN	bn,a	<label_0x1>
	.word 0xc932c00f  ! 121: STQF_R	-	%f4, [%r15, %r11]
	.word 0x91458000  ! 120: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x9a804006  ! 121: ADDcc_R	addcc 	%r1, %r6, %r13
DS_6:
	.word 0x22800001  ! 123: BE	be,a	<label_0x1>
	.word 0xd330000f  ! 123: STQF_R	-	%f9, [%r15, %r0]
	.word 0x9f458000  ! 122: RD_SOFTINT_REG	rd	%softint, %r15
	ta	T_CHANGE_TO_TL0	! macro
DS_7:
	.word 0x32800001  ! 125: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x8db3830c  ! 124: ALLIGNADDRESS	alignaddr	%r14, %r12, %r6
	.word 0xcc1fe001  ! 125: LDD_I	ldd	[%r31 + 0x0001], %r6
	mov 0x30, %r30
	.word 0x87d0001e  ! 126: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	mov 0x31, %r30
	.word 0x89d0001e  ! 127: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	mov 0x34, %r30
	.word 0x97d0001e  ! 128: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x87802089  ! 129: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xccd7e010  ! 130: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r6
	.word 0xcc8008a0  ! 131: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x807a0003  ! 132: SDIV_R	sdiv 	%r8, %r3, %r0
	.word 0x8d902288  ! 133: WRPR_PSTATE_I	wrpr	%r0, 0x0288, %pstate
	mov 0x30, %r30
	.word 0x8fd0001e  ! 134: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x9a48c005  ! 135: MULX_R	mulx 	%r3, %r5, %r13
	mov 0x35, %r30
	.word 0x97d0001e  ! 136: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0xdbe7c025  ! 137: CASA_I	casa	[%r31] 0x 1, %r5, %r13
	.word 0x81982546  ! 138: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0546, %hpstate
	.word 0xda900e60  ! 139: LDUHA_R	lduha	[%r0, %r0] 0x73, %r13
	mov 0x34, %r30
	.word 0x87d0001e  ! 140: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x87802004  ! 142: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8198209c  ! 143: WRHPR_HPSTATE_I	wrhpr	%r0, 0x009c, %hpstate
	.word 0xdb37e001  ! 144: STQF_I	-	%f13, [0x0001, %r31]
	.word 0x8ba089a7  ! 145: FDIVs	fdivs	%f2, %f7, %f5
	.word 0x81982356  ! 146: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0356, %hpstate
	.word 0xcadfe010  ! 147: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r5
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d902a54  ! 149: WRPR_PSTATE_I	wrpr	%r0, 0x0a54, %pstate
	.word 0x9f480000  ! 150: RDHPR_HPSTATE	rdhpr	%hpstate, %r15
	.word 0x8d9026c3  ! 151: WRPR_PSTATE_I	wrpr	%r0, 0x06c3, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xdeffc027  ! 153: SWAPA_R	swapa	%r15, [%r31 + %r7] 0x01
	ta	T_CHANGE_NONHPRIV	! macro
	mov 0x34, %r30
	.word 0x93d0001e  ! 155: Tcc_R	tne	icc_or_xcc, %r0 + %r30
DS_8:
	.word 0x22800001  ! 157: BE	be,a	<label_0x1>
	.word 0xc9306001  ! 157: STQF_I	-	%f4, [0x0001, %r1]
	.word 0x8d458000  ! 156: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0x884a0000  ! 157: MULX_R	mulx 	%r8, %r0, %r4
	.word 0x8d902e9e  ! 158: WRPR_PSTATE_I	wrpr	%r0, 0x0e9e, %pstate
	.word 0x987bc00f  ! 159: SDIV_R	sdiv 	%r15, %r15, %r12
	ta	T_CHANGE_NONPRIV	! macro
	mov 0x30, %r30
	.word 0x87d0001e  ! 161: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x8198269a  ! 162: WRHPR_HPSTATE_I	wrhpr	%r0, 0x069a, %hpstate
	.word 0xd9e7c02f  ! 163: CASA_I	casa	[%r31] 0x 1, %r15, %r12
	mov 0x31, %r30
	.word 0x9fd0001e  ! 164: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x8d902806  ! 165: WRPR_PSTATE_I	wrpr	%r0, 0x0806, %pstate
	.word 0xd857e001  ! 166: LDSH_I	ldsh	[%r31 + 0x0001], %r12
	mov 0x30, %r30
	.word 0x9dd0001e  ! 167: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x8bd02031  ! 168: Tcc_I	tcs	icc_or_xcc, %r0 + 49
	.word 0x89d02033  ! 169: Tcc_I	tleu	icc_or_xcc, %r0 + 51
	.word 0x87802004  ! 170: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xd88008a0  ! 171: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x8d90244f  ! 172: WRPR_PSTATE_I	wrpr	%r0, 0x044f, %pstate
	.word 0xd88008a0  ! 173: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x97a109c2  ! 174: FDIVd	fdivd	%f4, %f2, %f42
	.word 0x8d9028cd  ! 175: WRPR_PSTATE_I	wrpr	%r0, 0x08cd, %pstate
	.word 0xd69fc020  ! 176: LDDA_R	ldda	[%r31, %r0] 0x01, %r11
	.word 0x81d02032  ! 177: Tcc_I	tn	icc_or_xcc, %r0 + 50
	.word 0x8d902214  ! 178: WRPR_PSTATE_I	wrpr	%r0, 0x0214, %pstate
	.word 0x819825c3  ! 179: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05c3, %hpstate
	.word 0xd67fe001  ! 180: SWAP_I	swap	%r11, [%r31 + 0x0001]
	.word 0xd6c00e80  ! 181: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r11
	.word 0x87802014  ! 182: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x93d02034  ! 183: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0xd6d804a0  ! 184: LDXA_R	ldxa	[%r0, %r0] 0x25, %r11
	.word 0x9b69e001  ! 185: SDIVX_I	sdivx	%r7, 0x0001, %r13
	ta	T_CHANGE_PRIV	! macro
	.word 0xda7fe001  ! 187: SWAP_I	swap	%r13, [%r31 + 0x0001]
	.word 0xda8fe000  ! 188: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r13
	.word 0xda5fe001  ! 189: LDX_I	ldx	[%r31 + 0x0001], %r13
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xdac7e000  ! 191: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r13
	mov 0x32, %r30
	.word 0x87d0001e  ! 192: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x81982142  ! 193: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0142, %hpstate
	mov 0x33, %r30
	.word 0x93d0001e  ! 194: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xda07c000  ! 195: LDUW_R	lduw	[%r31 + %r0], %r13
	.word 0x8dd02032  ! 196: Tcc_I	tneg	icc_or_xcc, %r0 + 50
	.word 0x907aa001  ! 197: SDIV_I	sdiv 	%r10, 0x0001, %r8
	.word 0x91d02034  ! 198: Tcc_I	ta	icc_or_xcc, %r0 + 52
	ta	T_CHANGE_HPRIV	! macro
DS_9:
	.word 0x32800001  ! 201: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x87b1830a  ! 200: ALLIGNADDRESS	alignaddr	%r6, %r10, %r3
	.word 0x81982308  ! 201: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0308, %hpstate
	.word 0xc727e001  ! 202: STF_I	st	%f3, [0x0001, %r31]
	mov 0x32, %r30
	.word 0x85d0001e  ! 203: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x87802004  ! 204: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x81982792  ! 205: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0792, %hpstate
	.word 0x9bd02033  ! 206: Tcc_I	tcc	icc_or_xcc, %r0 + 51
	.word 0x87802016  ! 207: WRASI_I	wr	%r0, 0x0016, %asi
	mov 0x30, %r30
	.word 0x83d0001e  ! 208: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xc637c00a  ! 209: STH_R	sth	%r3, [%r31 + %r10]
	mov 0x35, %r30
	.word 0x97d0001e  ! 210: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x8da049a5  ! 211: FDIVs	fdivs	%f1, %f5, %f6
	.word 0x8d802000  ! 212: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x3e800001  ! 213: BVC	bvc,a	<label_0x1>
	mov 0x33, %r30
	.word 0x9fd0001e  ! 214: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x8d902450  ! 215: WRPR_PSTATE_I	wrpr	%r0, 0x0450, %pstate
DS_10:
	.word 0x32800001  ! 217: BNE	bne,a	<label_0x1>
	.word 0xd333e001  ! 217: STQF_I	-	%f9, [0x0001, %r15]
	.word 0x9b458000  ! 216: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x9048a001  ! 217: MULX_I	mulx 	%r2, 0x0001, %r8
	.word 0x87802004  ! 218: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x9750c000  ! 219: RDPR_TT	rdpr	%tt, %r11
	.word 0x8d802004  ! 220: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x30700001  ! 221: BPA	<illegal instruction>
	.word 0x9fa049ea  ! 222: FDIVq	dis not found

	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902054  ! 224: WRPR_PSTATE_I	wrpr	%r0, 0x0054, %pstate
	.word 0x85a349a7  ! 225: FDIVs	fdivs	%f13, %f7, %f2
	.word 0x83d02034  ! 226: Tcc_I	te	icc_or_xcc, %r0 + 52
	ta	T_CHANGE_PRIV	! macro
	.word 0xc4c004a0  ! 228: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r2
DS_11:
	.word 0x34800001  ! 230: BG	bg,a	<label_0x1>
	illtrap
	.word 0x97b1c303  ! 229: ALLIGNADDRESS	alignaddr	%r7, %r3, %r11
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x81982401  ! 231: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0401, %hpstate
	.word 0xd657e001  ! 232: LDSH_I	ldsh	[%r31 + 0x0001], %r11
DS_12:
	.word 0x22800001  ! 234: BE	be,a	<label_0x1>
	illtrap
	.word 0x9fb3c303  ! 233: ALLIGNADDRESS	alignaddr	%r15, %r3, %r15
	.word 0x99a289e2  ! 234: FDIVq	dis not found

	.word 0x8198264a  ! 235: WRHPR_HPSTATE_I	wrhpr	%r0, 0x064a, %hpstate
	.word 0xd83fe001  ! 236: STD_I	std	%r12, [%r31 + 0x0001]
	.word 0x87802016  ! 237: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x81982295  ! 238: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0295, %hpstate
	.word 0xd807e001  ! 239: LDUW_I	lduw	[%r31 + 0x0001], %r12
	mov 0x31, %r30
	.word 0x83d0001e  ! 240: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd80fc000  ! 241: LDUB_R	ldub	[%r31 + %r0], %r12
	.word 0x8198254c  ! 242: WRHPR_HPSTATE_I	wrhpr	%r0, 0x054c, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d500000  ! 244: RDPR_TPC	rdpr	%tpc, %r6
	.word 0x22700001  ! 245: BPE	<illegal instruction>
	.word 0x97a00d22  ! 246: FsMULd	fsmuld	%f0, %f2, %f42
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x91a01a6d  ! 248: FqTOi	fqtoi	
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0xd08008a0  ! 251: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	mov 0x35, %r30
	.word 0x81d0001e  ! 252: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x8adb8002  ! 253: SMULcc_R	smulcc 	%r14, %r2, %r5
	.word 0x81982bdf  ! 254: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bdf, %hpstate
	.word 0x91d02035  ! 255: Tcc_I	ta	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_PRIV	! macro
	.word 0x95a000c5  ! 257: FNEGd	fnegd	%f36, %f10
	.word 0x987b8005  ! 258: SDIV_R	sdiv 	%r14, %r5, %r12
	.word 0x83a000cc  ! 259: FNEGd	fnegd	%f12, %f32
	.word 0x93a3c9a4  ! 260: FDIVs	fdivs	%f15, %f4, %f9
	.word 0x8b514000  ! 261: RDPR_TBA	rdpr	%tba, %r5
	.word 0x9fd02034  ! 262: Tcc_I	tvc	icc_or_xcc, %r0 + 52
	mov 0x30, %r30
	.word 0x9bd0001e  ! 263: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x8d494000  ! 264: RDHPR_HTBA	rdhpr	%htba, %r6
	.word 0x83d02031  ! 265: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0xcc0fc000  ! 266: LDUB_R	ldub	[%r31 + %r0], %r6
	.word 0x81982796  ! 267: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0796, %hpstate
	.word 0x81982108  ! 268: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0108, %hpstate
	.word 0x8ac2e001  ! 269: ADDCcc_I	addccc 	%r11, 0x0001, %r5
DS_13:
	.word 0x22800001  ! 271: BE	be,a	<label_0x1>
	.word 0xcd326001  ! 271: STQF_I	-	%f6, [0x0001, %r9]
	.word 0x8d458000  ! 270: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0x99a349eb  ! 271: FDIVq	dis not found

	.word 0x94686001  ! 272: UDIVX_I	udivx 	%r1, 0x0001, %r10
	.word 0xd4d7e030  ! 273: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r10
	.word 0xd597e001  ! 274: LDQFA_I	-	[%r31, 0x0001], %f10
	.word 0x819820c1  ! 275: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00c1, %hpstate
	.word 0x8d802000  ! 276: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87802016  ! 277: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x98d18009  ! 278: UMULcc_R	umulcc 	%r6, %r9, %r12
	.word 0xd8dfe030  ! 279: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r12
	.word 0x93d02032  ! 280: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0xd8800b80  ! 281: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r12
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd8d804a0  ! 284: LDXA_R	ldxa	[%r0, %r0] 0x25, %r12
	.word 0x91d02035  ! 285: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x91a1cd21  ! 286: FsMULd	fsmuld	%f7, %f32, %f8
	.word 0x8d802004  ! 287: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x99d02034  ! 288: Tcc_I	tgu	icc_or_xcc, %r0 + 52
	.word 0x8b480000  ! 289: RDHPR_HPSTATE	rdhpr	%hpstate, %r5
	.word 0x8d802000  ! 290: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87802088  ! 291: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8d902859  ! 292: WRPR_PSTATE_I	wrpr	%r0, 0x0859, %pstate
	.word 0xca8008a0  ! 293: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0xca0fc000  ! 294: LDUB_R	ldub	[%r31 + %r0], %r5
	.word 0x8d90261d  ! 295: WRPR_PSTATE_I	wrpr	%r0, 0x061d, %pstate
	.word 0x8ed3000d  ! 296: UMULcc_R	umulcc 	%r12, %r13, %r7
	.word 0x8d802000  ! 297: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xce8fe010  ! 298: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r7
	.word 0xce8fe010  ! 299: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r7
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_NONPRIV	! macro
	mov 0x34, %r30
	.word 0x8bd0001e  ! 302: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x8fd02030  ! 303: Tcc_I	tvs	icc_or_xcc, %r0 + 48
	.word 0x87802014  ! 304: WRASI_I	wr	%r0, 0x0014, %asi
	mov 0x31, %r30
	.word 0x99d0001e  ! 305: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0xce800b00  ! 306: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r7
	.word 0xcedfe000  ! 307: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r7
	.word 0x967aa001  ! 308: SDIV_I	sdiv 	%r10, 0x0001, %r11
	.word 0xd677c00d  ! 309: STX_R	stx	%r11, [%r31 + %r13]
	.word 0xd73fc00d  ! 310: STDF_R	std	%f11, [%r13, %r31]
	.word 0x85508000  ! 311: RDPR_TSTATE	rdpr	%tstate, %r2
	.word 0x8d802004  ! 312: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xc407e001  ! 313: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0xc4800b40  ! 314: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r2
	.word 0xc4bfe001  ! 315: STDA_I	stda	%r2, [%r31 + 0x0001] %asi
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x846bc00a  ! 317: UDIVX_R	udivx 	%r15, %r10, %r2
	.word 0x81982045  ! 318: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0045, %hpstate
	.word 0x24800001  ! 319: BLE	ble,a	<label_0x1>
	.word 0xc4c80e60  ! 320: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r2
	.word 0x94c12001  ! 321: ADDCcc_I	addccc 	%r4, 0x0001, %r10
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81982585  ! 323: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0585, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d90285e  ! 326: WRPR_PSTATE_I	wrpr	%r0, 0x085e, %pstate
	.word 0x8e79c00e  ! 327: SDIV_R	sdiv 	%r7, %r14, %r7
DS_14:
	.word 0x34800001  ! 329: BG	bg,a	<label_0x1>
	illtrap
	.word 0x8bb30306  ! 328: ALLIGNADDRESS	alignaddr	%r12, %r6, %r5
	.word 0xca8008a0  ! 329: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
DS_15:
	.word 0x22800001  ! 331: BE	be,a	<label_0x1>
	.word 0xcd32000b  ! 331: STQF_R	-	%f6, [%r11, %r8]
	.word 0x9d458000  ! 330: RD_SOFTINT_REG	rd	%softint, %r14
	.word 0x8e520003  ! 331: UMUL_R	umul 	%r8, %r3, %r7
	.word 0x8d802000  ! 332: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982744  ! 333: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0744, %hpstate
	.word 0xced804a0  ! 334: LDXA_R	ldxa	[%r0, %r0] 0x25, %r7
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8198288f  ! 336: WRHPR_HPSTATE_I	wrhpr	%r0, 0x088f, %hpstate
	mov 0x32, %r30
	.word 0x87d0001e  ! 337: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x819829de  ! 338: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09de, %hpstate
	.word 0x8b508000  ! 339: RDPR_TSTATE	rdpr	%tstate, %r5
	mov 0x31, %r30
	.word 0x97d0001e  ! 340: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x20800001  ! 341: BN	bn,a	<label_0x1>
	.word 0x9a7a2001  ! 342: SDIV_I	sdiv 	%r8, 0x0001, %r13
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8ada400e  ! 344: SMULcc_R	smulcc 	%r9, %r14, %r5
	.word 0x28800001  ! 345: BLEU	bleu,a	<label_0x1>
	.word 0xca800b60  ! 346: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r5
	.word 0x87802010  ! 347: WRASI_I	wr	%r0, 0x0010, %asi
	mov 0x32, %r30
	.word 0x8dd0001e  ! 348: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x9ad3c00f  ! 349: UMULcc_R	umulcc 	%r15, %r15, %r13
	.word 0x81982318  ! 350: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0318, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xda800c60  ! 352: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r13
DS_16:
	.word 0x22800001  ! 354: BE	be,a	<label_0x1>
	illtrap
	.word 0x83b2830d  ! 353: ALLIGNADDRESS	alignaddr	%r10, %r13, %r1
	.word 0xc23fc00d  ! 354: STD_R	std	%r1, [%r31 + %r13]
	.word 0x8d902094  ! 355: WRPR_PSTATE_I	wrpr	%r0, 0x0094, %pstate
	.word 0x8482e001  ! 356: ADDcc_I	addcc 	%r11, 0x0001, %r2
	.word 0x9bd02030  ! 357: Tcc_I	tcc	icc_or_xcc, %r0 + 48
	.word 0x8bd02034  ! 358: Tcc_I	tcs	icc_or_xcc, %r0 + 52
	.word 0xc49fe001  ! 359: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r2
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xc5e7c02d  ! 361: CASA_I	casa	[%r31] 0x 1, %r13, %r2
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d902217  ! 363: WRPR_PSTATE_I	wrpr	%r0, 0x0217, %pstate
	.word 0x81982114  ! 364: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0114, %hpstate
	.word 0x87802016  ! 365: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8c6b4002  ! 366: UDIVX_R	udivx 	%r13, %r2, %r6
	ta	T_CHANGE_PRIV	! macro
	.word 0xcc900e40  ! 368: LDUHA_R	lduha	[%r0, %r0] 0x72, %r6
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x94d06001  ! 371: UMULcc_I	umulcc 	%r1, 0x0001, %r10
DS_17:
	.word 0x20800001  ! 373: BN	bn,a	<label_0x1>
	illtrap
	.word 0x85b2430e  ! 372: ALLIGNADDRESS	alignaddr	%r9, %r14, %r2
	.word 0x87802080  ! 373: WRASI_I	wr	%r0, 0x0080, %asi
	mov 0x35, %r30
	.word 0x9bd0001e  ! 374: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0xc527e001  ! 375: STF_I	st	%f2, [0x0001, %r31]
	.word 0xc4c804a0  ! 376: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r2
	.word 0x87802004  ! 377: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8d802000  ! 378: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x89d02031  ! 379: Tcc_I	tleu	icc_or_xcc, %r0 + 49
DS_18:
	.word 0x22800001  ! 381: BE	be,a	<label_0x1>
	illtrap
	.word 0x87b1030b  ! 380: ALLIGNADDRESS	alignaddr	%r4, %r11, %r3
	.word 0x9249c001  ! 381: MULX_R	mulx 	%r7, %r1, %r9
	.word 0xd2cfe010  ! 382: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r9
	.word 0x8ba149c5  ! 383: FDIVd	fdivd	%f36, %f36, %f36
	.word 0x8198280e  ! 384: WRHPR_HPSTATE_I	wrhpr	%r0, 0x080e, %hpstate
	.word 0x30800001  ! 385: BA	ba,a	<label_0x1>
	.word 0x93a01a69  ! 386: FqTOi	fqtoi	
	.word 0x91a00542  ! 387: FSQRTd	fsqrt	
	.word 0x8ec1a001  ! 388: ADDCcc_I	addccc 	%r6, 0x0001, %r7
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d90204b  ! 391: WRPR_PSTATE_I	wrpr	%r0, 0x004b, %pstate
	.word 0xcec004a0  ! 392: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r7
	.word 0x81982147  ! 393: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0147, %hpstate
	.word 0x9fd02034  ! 394: Tcc_I	tvc	icc_or_xcc, %r0 + 52
	.word 0x91a089c0  ! 395: FDIVd	fdivd	%f2, %f0, %f8
	.word 0xd057e001  ! 396: LDSH_I	ldsh	[%r31 + 0x0001], %r8
	mov 0x30, %r30
	.word 0x87d0001e  ! 397: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	mov 0x32, %r30
	.word 0x9fd0001e  ! 398: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 399: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982f5e  ! 400: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f5e, %hpstate
	.word 0x8b480000  ! 401: RDHPR_HPSTATE	rdhpr	%hpstate, %r5
	.word 0xcadfe000  ! 402: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r5
	.word 0x8ba00568  ! 403: FSQRTq	fsqrt	
	.word 0x81982001  ! 404: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0001, %hpstate
	.word 0x8d90241d  ! 405: WRPR_PSTATE_I	wrpr	%r0, 0x041d, %pstate
	mov 0x35, %r30
	.word 0x9bd0001e  ! 406: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x8d90249a  ! 407: WRPR_PSTATE_I	wrpr	%r0, 0x049a, %pstate
	.word 0x9cc26001  ! 408: ADDCcc_I	addccc 	%r9, 0x0001, %r14
	.word 0x8879a001  ! 409: SDIV_I	sdiv 	%r6, 0x0001, %r4
	.word 0x8198231c  ! 410: WRHPR_HPSTATE_I	wrhpr	%r0, 0x031c, %hpstate
	.word 0x8d902c42  ! 411: WRPR_PSTATE_I	wrpr	%r0, 0x0c42, %pstate
	.word 0x85d02030  ! 412: Tcc_I	tle	icc_or_xcc, %r0 + 48
	.word 0xc8d7e000  ! 413: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r4
	.word 0xc8c804a0  ! 414: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r4
	.word 0xc9e7c028  ! 415: CASA_I	casa	[%r31] 0x 1, %r8, %r4
	.word 0x99a009a5  ! 416: FDIVs	fdivs	%f0, %f5, %f12
	.word 0x8198244a  ! 417: WRHPR_HPSTATE_I	wrhpr	%r0, 0x044a, %hpstate
	.word 0x98814008  ! 418: ADDcc_R	addcc 	%r5, %r8, %r12
DS_19:
	.word 0x20800001  ! 420: BN	bn,a	<label_0x1>
	.word 0xd5314008  ! 420: STQF_R	-	%f10, [%r8, %r5]
	.word 0x83458000  ! 419: RD_SOFTINT_REG	rd	%softint, %r1
	.word 0x9ba000ca  ! 420: FNEGd	fnegd	%f10, %f44
	.word 0x85a01a67  ! 421: FqTOi	fqtoi	
	.word 0x98d2800c  ! 422: UMULcc_R	umulcc 	%r10, %r12, %r12
	.word 0x97a34dc7  ! 423: FdMULq	fdmulq	
	.word 0x819824dd  ! 424: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04dd, %hpstate
	.word 0x9da2c9cd  ! 425: FDIVd	fdivd	%f42, %f44, %f14
	.word 0x87500000  ! 426: RDPR_TPC	rdpr	%tpc, %r3
	.word 0xc6cfe000  ! 427: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r3
	.word 0x91a04dce  ! 428: FdMULq	fdmulq	
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xd07fe001  ! 430: SWAP_I	swap	%r8, [%r31 + 0x0001]
	.word 0x30800001  ! 431: BA	ba,a	<label_0x1>
	.word 0x87a2c9e4  ! 432: FDIVq	dis not found

	.word 0x92d90001  ! 433: SMULcc_R	smulcc 	%r4, %r1, %r9
	.word 0x83a049c8  ! 434: FDIVd	fdivd	%f32, %f8, %f32
	.word 0x8d902e58  ! 435: WRPR_PSTATE_I	wrpr	%r0, 0x0e58, %pstate
	.word 0x81982a9b  ! 436: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a9b, %hpstate
	.word 0x32800001  ! 437: BNE	bne,a	<label_0x1>
	.word 0x89a1cdc6  ! 438: FdMULq	fdmulq	
	.word 0x88528004  ! 439: UMUL_R	umul 	%r10, %r4, %r4
	.word 0x8d90208e  ! 440: WRPR_PSTATE_I	wrpr	%r0, 0x008e, %pstate
	.word 0x8d90229e  ! 441: WRPR_PSTATE_I	wrpr	%r0, 0x029e, %pstate
	.word 0x819824d1  ! 442: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04d1, %hpstate
	.word 0x87802010  ! 443: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xc8880e80  ! 444: LDUBA_R	lduba	[%r0, %r0] 0x74, %r4
	.word 0x8198258f  ! 445: WRHPR_HPSTATE_I	wrhpr	%r0, 0x058f, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87802016  ! 447: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8ba389e2  ! 448: FDIVq	dis not found

	mov 0x31, %r30
	.word 0x95d0001e  ! 449: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x81982b82  ! 450: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b82, %hpstate
	.word 0x81a00543  ! 451: FSQRTd	fsqrt	
	.word 0x8d802000  ! 452: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x97d02035  ! 453: Tcc_I	tge	icc_or_xcc, %r0 + 53
	mov 0x35, %r30
	.word 0x81d0001e  ! 454: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0xc05fc000  ! 455: LDX_R	ldx	[%r31 + %r0], %r0
	mov 0x33, %r30
	.word 0x97d0001e  ! 456: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x81982a95  ! 457: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a95, %hpstate
	.word 0x8d902404  ! 458: WRPR_PSTATE_I	wrpr	%r0, 0x0404, %pstate
	.word 0xc01fc000  ! 459: LDD_R	ldd	[%r31 + %r0], %r0
	.word 0xc0c80e40  ! 460: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r0
	.word 0xc09fc020  ! 461: LDDA_R	ldda	[%r31, %r0] 0x01, %r0
	.word 0x97a189e2  ! 462: FDIVq	dis not found

	.word 0x97a009ae  ! 463: FDIVs	fdivs	%f0, %f14, %f11
	.word 0xd64fe001  ! 464: LDSB_I	ldsb	[%r31 + 0x0001], %r11
	.word 0x86db800e  ! 465: SMULcc_R	smulcc 	%r14, %r14, %r3
	.word 0x87802080  ! 466: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x80488006  ! 467: MULX_R	mulx 	%r2, %r6, %r0
	.word 0x81982ac7  ! 468: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ac7, %hpstate
	.word 0xc02fc006  ! 469: STB_R	stb	%r0, [%r31 + %r6]
	.word 0x8d902618  ! 470: WRPR_PSTATE_I	wrpr	%r0, 0x0618, %pstate
	.word 0x90534007  ! 471: UMUL_R	umul 	%r13, %r7, %r8
	.word 0xd09004a0  ! 472: LDUHA_R	lduha	[%r0, %r0] 0x25, %r8
	.word 0x9fa0c9a1  ! 473: FDIVs	fdivs	%f3, %f1, %f15
	.word 0x996ae001  ! 474: SDIVX_I	sdivx	%r11, 0x0001, %r12
	.word 0x8e7b6001  ! 475: SDIV_I	sdiv 	%r13, 0x0001, %r7
	.word 0x95d02030  ! 476: Tcc_I	tg	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8bd02033  ! 478: Tcc_I	tcs	icc_or_xcc, %r0 + 51
	.word 0x819825c1  ! 479: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05c1, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9e03a001  ! 481: ADD_I	add 	%r14, 0x0001, %r15
	mov 0x30, %r30
	.word 0x97d0001e  ! 482: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x87a00547  ! 483: FSQRTd	fsqrt	
	.word 0xc607e001  ! 484: LDUW_I	lduw	[%r31 + 0x0001], %r3
	.word 0x956b0000  ! 485: SDIVX_R	sdivx	%r12, %r0, %r10
	.word 0x8bd02033  ! 486: Tcc_I	tcs	icc_or_xcc, %r0 + 51
	.word 0x82da8002  ! 487: SMULcc_R	smulcc 	%r10, %r2, %r1
	.word 0x81982a50  ! 488: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a50, %hpstate
	.word 0xc337c002  ! 489: STQF_R	-	%f1, [%r2, %r31]
	.word 0x93d02033  ! 490: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0xc397e001  ! 491: LDQFA_I	-	[%r31, 0x0001], %f1
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xc22fc002  ! 493: STB_R	stb	%r1, [%r31 + %r2]
	.word 0x866a2001  ! 494: UDIVX_I	udivx 	%r8, 0x0001, %r3
	.word 0x8d902adc  ! 495: WRPR_PSTATE_I	wrpr	%r0, 0x0adc, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8e69a001  ! 497: UDIVX_I	udivx 	%r6, 0x0001, %r7
	.word 0x85d02032  ! 498: Tcc_I	tle	icc_or_xcc, %r0 + 50
	.word 0x81982c0d  ! 499: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c0d, %hpstate
	.word 0x8d902c9a  ! 500: WRPR_PSTATE_I	wrpr	%r0, 0x0c9a, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xcfe7c022  ! 502: CASA_I	casa	[%r31] 0x 1, %r2, %r7
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x92d0000c  ! 504: UMULcc_R	umulcc 	%r0, %r12, %r9
	.word 0x8d802000  ! 505: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_20:
	.word 0x20800001  ! 507: BN	bn,a	<label_0x1>
	.word 0xcb326001  ! 507: STQF_I	-	%f5, [0x0001, %r9]
	.word 0x83458000  ! 506: RD_SOFTINT_REG	rd	%softint, %r1
	.word 0x90c06001  ! 507: ADDCcc_I	addccc 	%r1, 0x0001, %r8
	.word 0x87d02030  ! 508: Tcc_I	tl	icc_or_xcc, %r0 + 48
	.word 0xd07fe001  ! 509: SWAP_I	swap	%r8, [%r31 + 0x0001]
DS_21:
	.word 0x20800001  ! 511: BN	bn,a	<label_0x1>
	illtrap
	.word 0x8bb24300  ! 510: ALLIGNADDRESS	alignaddr	%r9, %r0, %r5
DS_22:
	.word 0x22800001  ! 512: BE	be,a	<label_0x1>
	illtrap
	.word 0x8bb04307  ! 511: ALLIGNADDRESS	alignaddr	%r1, %r7, %r5
	.word 0xca0fc000  ! 512: LDUB_R	ldub	[%r31 + %r0], %r5
	.word 0x9da01a63  ! 513: FqTOi	fqtoi	
	.word 0xdcc804a0  ! 514: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r14
	mov 0x34, %r30
	.word 0x91d0001e  ! 515: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xdc97e010  ! 516: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r14
	.word 0x82524003  ! 517: UMUL_R	umul 	%r9, %r3, %r1
	.word 0x98496001  ! 518: MULX_I	mulx 	%r5, 0x0001, %r12
	ta	T_CHANGE_HPRIV	! macro
	.word 0x94814009  ! 520: ADDcc_R	addcc 	%r5, %r9, %r10
	.word 0x81982185  ! 521: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0185, %hpstate
	mov 0x33, %r30
	.word 0x85d0001e  ! 522: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x91d02035  ! 523: Tcc_I	ta	icc_or_xcc, %r0 + 53
	mov 0x34, %r30
	.word 0x91d0001e  ! 524: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x3c700001  ! 525: BPPOS	<illegal instruction>
	.word 0x81982719  ! 526: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0719, %hpstate
	.word 0x87802004  ! 527: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8fa0056b  ! 528: FSQRTq	fsqrt	
	.word 0xced004a0  ! 529: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r7
	.word 0x8d902a81  ! 530: WRPR_PSTATE_I	wrpr	%r0, 0x0a81, %pstate
	.word 0x8b6b000a  ! 531: SDIVX_R	sdivx	%r12, %r10, %r5
	.word 0xcac7e010  ! 532: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r5
	.word 0x36700001  ! 533: BPGE	<illegal instruction>
	.word 0x36700001  ! 534: BPGE	<illegal instruction>
	.word 0x9569e001  ! 535: SDIVX_I	sdivx	%r7, 0x0001, %r10
	.word 0x9d6aa001  ! 536: SDIVX_I	sdivx	%r10, 0x0001, %r14
	.word 0xdcc004a0  ! 537: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r14
DS_23:
	.word 0x20800001  ! 539: BN	bn,a	<label_0x1>
	illtrap
	.word 0x95b30300  ! 538: ALLIGNADDRESS	alignaddr	%r12, %r0, %r10
	ta	T_CHANGE_PRIV	! macro
	.word 0x9f504000  ! 540: RDPR_TNPC	rdpr	%tnpc, %r15
	.word 0x81982203  ! 541: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0203, %hpstate
	mov 0x34, %r30
	.word 0x9fd0001e  ! 542: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x8d902854  ! 543: WRPR_PSTATE_I	wrpr	%r0, 0x0854, %pstate
	.word 0x81982845  ! 544: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0845, %hpstate
	.word 0x8d9024d8  ! 545: WRPR_PSTATE_I	wrpr	%r0, 0x04d8, %pstate
	.word 0xdf97e001  ! 546: LDQFA_I	-	[%r31, 0x0001], %f15
	mov 0x30, %r30
	.word 0x87d0001e  ! 547: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x9cd18005  ! 548: UMULcc_R	umulcc 	%r6, %r5, %r14
	.word 0x8d902495  ! 549: WRPR_PSTATE_I	wrpr	%r0, 0x0495, %pstate
	.word 0x9a68c00f  ! 550: UDIVX_R	udivx 	%r3, %r15, %r13
	.word 0x8dd02035  ! 551: Tcc_I	tneg	icc_or_xcc, %r0 + 53
	mov 0x34, %r30
	.word 0x87d0001e  ! 552: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8fa289c2  ! 554: FDIVd	fdivd	%f10, %f2, %f38
	.word 0x89a30d29  ! 555: FsMULd	fsmuld	%f12, %f40, %f4
	.word 0x87802004  ! 556: WRASI_I	wr	%r0, 0x0004, %asi
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8800e001  ! 558: ADD_I	add 	%r3, 0x0001, %r4
	.word 0x8d90208b  ! 559: WRPR_PSTATE_I	wrpr	%r0, 0x008b, %pstate
	.word 0x8d902813  ! 560: WRPR_PSTATE_I	wrpr	%r0, 0x0813, %pstate
	.word 0xc8cfe010  ! 561: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r4
	.word 0x81982b9e  ! 562: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b9e, %hpstate
	.word 0xc927e001  ! 563: STF_I	st	%f4, [0x0001, %r31]
	.word 0x9bd02030  ! 564: Tcc_I	tcc	icc_or_xcc, %r0 + 48
	.word 0x88d22001  ! 565: UMULcc_I	umulcc 	%r8, 0x0001, %r4
	.word 0x81982891  ! 566: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0891, %hpstate
DS_24:
	.word 0x20800001  ! 568: BN	bn,a	<label_0x1>
	.word 0xdb332001  ! 568: STQF_I	-	%f13, [0x0001, %r12]
	.word 0x8f458000  ! 567: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0xce8fe010  ! 568: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r7
	.word 0xce8804a0  ! 569: LDUBA_R	lduba	[%r0, %r0] 0x25, %r7
	.word 0x976aa001  ! 570: SDIVX_I	sdivx	%r10, 0x0001, %r11
	mov 0x32, %r30
	.word 0x93d0001e  ! 571: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d902286  ! 572: WRPR_PSTATE_I	wrpr	%r0, 0x0286, %pstate
	.word 0x83a189e7  ! 573: FDIVq	dis not found

	.word 0x8d802000  ! 574: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_25:
	.word 0x34800001  ! 576: BG	bg,a	<label_0x1>
	illtrap
	.word 0x8db38308  ! 575: ALLIGNADDRESS	alignaddr	%r14, %r8, %r6
	.word 0x2e800001  ! 576: BVS	bvs,a	<label_0x1>
	.word 0x86c12001  ! 577: ADDCcc_I	addccc 	%r4, 0x0001, %r3
	.word 0x8d902686  ! 578: WRPR_PSTATE_I	wrpr	%r0, 0x0686, %pstate
	.word 0x9da00563  ! 579: FSQRTq	fsqrt	
	.word 0x8fd02030  ! 580: Tcc_I	tvs	icc_or_xcc, %r0 + 48
	.word 0xdc8008a0  ! 581: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r14
	.word 0x9bd02033  ! 582: Tcc_I	tcc	icc_or_xcc, %r0 + 51
	.word 0xdc3fc003  ! 583: STD_R	std	%r14, [%r31 + %r3]
	.word 0xdccfe000  ! 584: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r14
	.word 0xdcffc023  ! 585: SWAPA_R	swapa	%r14, [%r31 + %r3] 0x01
	.word 0xdde7c023  ! 586: CASA_I	casa	[%r31] 0x 1, %r3, %r14
	.word 0x967ae001  ! 587: SDIV_I	sdiv 	%r11, 0x0001, %r11
	.word 0xd67fe001  ! 588: SWAP_I	swap	%r11, [%r31 + 0x0001]
	.word 0x81982bd2  ! 589: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bd2, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d802000  ! 591: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x819822de  ! 592: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02de, %hpstate
	.word 0x8fa04dc3  ! 593: FdMULq	fdmulq	
	.word 0xced804a0  ! 594: LDXA_R	ldxa	[%r0, %r0] 0x25, %r7
	.word 0x81982bcc  ! 595: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bcc, %hpstate
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97d02031  ! 600: Tcc_I	tge	icc_or_xcc, %r0 + 49
	.word 0x8cd14003  ! 601: UMULcc_R	umulcc 	%r5, %r3, %r6
	.word 0x8198284e  ! 602: WRHPR_HPSTATE_I	wrhpr	%r0, 0x084e, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x34700001  ! 604: BPG	<illegal instruction>
	.word 0x819821d2  ! 605: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01d2, %hpstate
	.word 0xccc004a0  ! 606: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r6
	.word 0x9b6a800e  ! 607: SDIVX_R	sdivx	%r10, %r14, %r13
	.word 0x81982e99  ! 608: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e99, %hpstate
	.word 0x819826df  ! 609: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06df, %hpstate
	.word 0x96032001  ! 610: ADD_I	add 	%r12, 0x0001, %r11
	.word 0x8d9024c6  ! 611: WRPR_PSTATE_I	wrpr	%r0, 0x04c6, %pstate
	.word 0x3a700001  ! 612: BPCC	<illegal instruction>
	.word 0x8d90240f  ! 613: WRPR_PSTATE_I	wrpr	%r0, 0x040f, %pstate
	.word 0x8d902801  ! 614: WRPR_PSTATE_I	wrpr	%r0, 0x0801, %pstate
	.word 0xd6d804a0  ! 615: LDXA_R	ldxa	[%r0, %r0] 0x25, %r11
	.word 0x3a700001  ! 616: BPCC	<illegal instruction>
	.word 0x80d02001  ! 617: UMULcc_I	umulcc 	%r0, 0x0001, %r0
	.word 0x97508000  ! 618: RDPR_TSTATE	rdpr	%tstate, %r11
	.word 0x8d902e80  ! 619: WRPR_PSTATE_I	wrpr	%r0, 0x0e80, %pstate
	.word 0x8683e001  ! 620: ADDcc_I	addcc 	%r15, 0x0001, %r3
	.word 0x26800001  ! 621: BL	bl,a	<label_0x1>
	.word 0xc6800a60  ! 622: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r3
	.word 0x87802004  ! 623: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8d902255  ! 624: WRPR_PSTATE_I	wrpr	%r0, 0x0255, %pstate
	.word 0x99a08dcb  ! 625: FdMULq	fdmulq	
	.word 0x844aa001  ! 626: MULX_I	mulx 	%r10, 0x0001, %r2
DS_26:
	.word 0x34800001  ! 628: BG	bg,a	<label_0x1>
	illtrap
	.word 0x85b3c306  ! 627: ALLIGNADDRESS	alignaddr	%r15, %r6, %r2
	.word 0x99d02034  ! 628: Tcc_I	tgu	icc_or_xcc, %r0 + 52
	.word 0xc4d7e000  ! 629: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r2
	.word 0xc457e001  ! 630: LDSH_I	ldsh	[%r31 + 0x0001], %r2
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x819829cd  ! 632: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09cd, %hpstate
DS_27:
	.word 0x32800001  ! 634: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x8fb28302  ! 633: ALLIGNADDRESS	alignaddr	%r10, %r2, %r7
	.word 0x81982313  ! 634: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0313, %hpstate
	.word 0xce9004a0  ! 635: LDUHA_R	lduha	[%r0, %r0] 0x25, %r7
	.word 0x26700001  ! 636: BPL	<illegal instruction>
	.word 0x8198204f  ! 637: WRHPR_HPSTATE_I	wrhpr	%r0, 0x004f, %hpstate
	.word 0x8e79000f  ! 638: SDIV_R	sdiv 	%r4, %r15, %r7
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a000c6  ! 640: FNEGd	fnegd	%f6, %f8
	.word 0x2e800001  ! 641: BVS	bvs,a	<label_0x1>
	.word 0x85d02031  ! 642: Tcc_I	tle	icc_or_xcc, %r0 + 49
	.word 0x38800001  ! 643: BGU	bgu,a	<label_0x1>
	.word 0x8d902e0f  ! 644: WRPR_PSTATE_I	wrpr	%r0, 0x0e0f, %pstate
	.word 0x8d902a0d  ! 645: WRPR_PSTATE_I	wrpr	%r0, 0x0a0d, %pstate
	mov 0x32, %r30
	.word 0x89d0001e  ! 646: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x8d902450  ! 647: WRPR_PSTATE_I	wrpr	%r0, 0x0450, %pstate
	.word 0xd0cfe010  ! 648: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r8
	.word 0x8d902253  ! 649: WRPR_PSTATE_I	wrpr	%r0, 0x0253, %pstate
	mov 0x30, %r30
	.word 0x87d0001e  ! 650: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	mov 0x32, %r30
	.word 0x87d0001e  ! 651: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd017e001  ! 653: LDUH_I	lduh	[%r31 + 0x0001], %r8
DS_28:
	.word 0x34800001  ! 655: BG	bg,a	<label_0x1>
	.word 0xc131c006  ! 655: STQF_R	-	%f0, [%r6, %r7]
	.word 0x95458000  ! 654: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0x24700001  ! 655: BPLE	<illegal instruction>
	.word 0x8d902201  ! 656: WRPR_PSTATE_I	wrpr	%r0, 0x0201, %pstate
	.word 0xd48008a0  ! 657: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x8d802000  ! 658: WRFPRS_I	wr	%r0, 0x0000, %fprs
	mov 0x30, %r30
	.word 0x9dd0001e  ! 659: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xd4c004a0  ! 661: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
	.word 0x8a69e001  ! 662: UDIVX_I	udivx 	%r7, 0x0001, %r5
	.word 0x95d02030  ! 663: Tcc_I	tg	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902417  ! 665: WRPR_PSTATE_I	wrpr	%r0, 0x0417, %pstate
	.word 0x2a700001  ! 666: BPCS	<illegal instruction>
	.word 0x8198281d  ! 667: WRHPR_HPSTATE_I	wrhpr	%r0, 0x081d, %hpstate
	.word 0x8ba0056f  ! 668: FSQRTq	fsqrt	
	.word 0x81982147  ! 669: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0147, %hpstate
	.word 0x8d802000  ! 670: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8198228b  ! 671: WRHPR_HPSTATE_I	wrhpr	%r0, 0x028b, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x9249c00b  ! 674: MULX_R	mulx 	%r7, %r11, %r9
	.word 0xd2800b60  ! 675: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r9
	.word 0x8d802000  ! 676: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d90284a  ! 677: WRPR_PSTATE_I	wrpr	%r0, 0x084a, %pstate
	.word 0x2c800001  ! 678: BNEG	bneg,a	<label_0x1>
	.word 0x9e802001  ! 679: ADDcc_I	addcc 	%r0, 0x0001, %r15
	.word 0x8d902053  ! 680: WRPR_PSTATE_I	wrpr	%r0, 0x0053, %pstate
	mov 0x33, %r30
	.word 0x95d0001e  ! 681: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0xde37c00b  ! 682: STH_R	sth	%r15, [%r31 + %r11]
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9da24d20  ! 684: FsMULd	fsmuld	%f9, %f0, %f14
	.word 0xdcffc020  ! 685: SWAPA_R	swapa	%r14, [%r31 + %r0] 0x01
	.word 0x8d802000  ! 686: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xdd97e001  ! 687: LDQFA_I	-	[%r31, 0x0001], %f14
	.word 0xdde7c020  ! 688: CASA_I	casa	[%r31] 0x 1, %r0, %r14
	.word 0x81982485  ! 689: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0485, %hpstate
	.word 0xdc800ba0  ! 690: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r14
	mov 0x33, %r30
	.word 0x91d0001e  ! 691: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902a8c  ! 692: WRPR_PSTATE_I	wrpr	%r0, 0x0a8c, %pstate
	.word 0x88c0a001  ! 693: ADDCcc_I	addccc 	%r2, 0x0001, %r4
	.word 0x819824d6  ! 694: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04d6, %hpstate
	.word 0x87d02030  ! 695: Tcc_I	tl	icc_or_xcc, %r0 + 48
	.word 0xc827c000  ! 696: STW_R	stw	%r4, [%r31 + %r0]
	.word 0x81982649  ! 697: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0649, %hpstate
	.word 0x8d802004  ! 698: WRFPRS_I	wr	%r0, 0x0004, %fprs
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d90229c  ! 700: WRPR_PSTATE_I	wrpr	%r0, 0x029c, %pstate
	.word 0x82690002  ! 701: UDIVX_R	udivx 	%r4, %r2, %r1
	.word 0x8da1cdc9  ! 702: FdMULq	fdmulq	
	.word 0x8d802004  ! 703: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x81982919  ! 704: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0919, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xcc1fe001  ! 706: LDD_I	ldd	[%r31 + 0x0001], %r6
	.word 0xcc9fc020  ! 707: LDDA_R	ldda	[%r31, %r0] 0x01, %r6
	.word 0x8a4a6001  ! 708: MULX_I	mulx 	%r9, 0x0001, %r5
	.word 0xca37e001  ! 709: STH_I	sth	%r5, [%r31 + 0x0001]
	.word 0xca0fc000  ! 710: LDUB_R	ldub	[%r31 + %r0], %r5
	.word 0xcad804a0  ! 711: LDXA_R	ldxa	[%r0, %r0] 0x25, %r5
	.word 0x9da01a68  ! 712: FqTOi	fqtoi	
	.word 0x8e49c006  ! 713: MULX_R	mulx 	%r7, %r6, %r7
	.word 0xce8008a0  ! 714: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x8ba00568  ! 715: FSQRTq	fsqrt	
	.word 0xca8008a0  ! 716: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0x8d902e51  ! 717: WRPR_PSTATE_I	wrpr	%r0, 0x0e51, %pstate
	.word 0x8a790007  ! 718: SDIV_R	sdiv 	%r4, %r7, %r5
	.word 0x987ba001  ! 719: SDIV_I	sdiv 	%r14, 0x0001, %r12
	.word 0x8fa189cb  ! 720: FDIVd	fdivd	%f6, %f42, %f38
	.word 0xce8804a0  ! 721: LDUBA_R	lduba	[%r0, %r0] 0x25, %r7
	.word 0x8d802000  ! 722: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d902ac2  ! 723: WRPR_PSTATE_I	wrpr	%r0, 0x0ac2, %pstate
	.word 0x8d902ec7  ! 724: WRPR_PSTATE_I	wrpr	%r0, 0x0ec7, %pstate
DS_29:
	.word 0x22800001  ! 726: BE	be,a	<label_0x1>
	.word 0xc5322001  ! 726: STQF_I	-	%f2, [0x0001, %r8]
	.word 0x97458000  ! 725: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0x8fd02030  ! 726: Tcc_I	tvs	icc_or_xcc, %r0 + 48
	.word 0xd6800ae0  ! 727: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r11
	.word 0x8d802004  ! 728: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x87802080  ! 729: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x89a00560  ! 730: FSQRTq	fsqrt	
	mov 0x33, %r30
	.word 0x99d0001e  ! 731: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xc937c000  ! 733: STQF_R	-	%f4, [%r0, %r31]
DS_30:
	.word 0x20800001  ! 735: BN	bn,a	<label_0x1>
	.word 0xc5318004  ! 735: STQF_R	-	%f2, [%r4, %r6]
	.word 0x85458000  ! 734: RD_SOFTINT_REG	rd	%softint, %r2
	.word 0x85a34d20  ! 735: FsMULd	fsmuld	%f13, %f0, %f2
	.word 0x8fd02033  ! 736: Tcc_I	tvs	icc_or_xcc, %r0 + 51
	.word 0x81982e93  ! 737: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e93, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x36700001  ! 739: BPGE	<illegal instruction>
	.word 0x8b504000  ! 740: RDPR_TNPC	rdpr	%tnpc, %r5
	.word 0x8bd02031  ! 741: Tcc_I	tcs	icc_or_xcc, %r0 + 49
DS_31:
	.word 0x32800001  ! 743: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x83b1030b  ! 742: ALLIGNADDRESS	alignaddr	%r4, %r11, %r1
	.word 0x87802080  ! 743: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x99d02032  ! 744: Tcc_I	tgu	icc_or_xcc, %r0 + 50
	.word 0xc237c00b  ! 745: STH_R	sth	%r1, [%r31 + %r11]
	.word 0xc2800b00  ! 746: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r1
	.word 0x9368e001  ! 747: SDIVX_I	sdivx	%r3, 0x0001, %r9
	.word 0x819826cc  ! 748: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06cc, %hpstate
	.word 0x81982457  ! 749: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0457, %hpstate
	.word 0x8d9020dd  ! 750: WRPR_PSTATE_I	wrpr	%r0, 0x00dd, %pstate
DS_32:
	.word 0x20800001  ! 752: BN	bn,a	<label_0x1>
	.word 0xd3336001  ! 752: STQF_I	-	%f9, [0x0001, %r13]
	.word 0x91458000  ! 751: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x87d02035  ! 752: Tcc_I	tl	icc_or_xcc, %r0 + 53
DS_33:
	.word 0x20800001  ! 754: BN	bn,a	<label_0x1>
	.word 0xc5318004  ! 754: STQF_R	-	%f2, [%r4, %r6]
	.word 0x9b458000  ! 753: RD_SOFTINT_REG	rd	%softint, %r13
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ad1400d  ! 755: UMULcc_R	umulcc 	%r5, %r13, %r13
	.word 0x81982c4f  ! 756: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c4f, %hpstate
	.word 0x8dd02033  ! 757: Tcc_I	tneg	icc_or_xcc, %r0 + 51
DS_34:
	.word 0x34800001  ! 759: BG	bg,a	<label_0x1>
	.word 0xd3332001  ! 759: STQF_I	-	%f9, [0x0001, %r12]
	.word 0x87458000  ! 758: RD_SOFTINT_REG	rd	%softint, %r3
	.word 0xc68fe020  ! 759: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r3
	.word 0x8d90201c  ! 760: WRPR_PSTATE_I	wrpr	%r0, 0x001c, %pstate
	mov 0x32, %r30
	.word 0x9bd0001e  ! 761: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	mov 0x32, %r30
	.word 0x81d0001e  ! 762: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x88d3a001  ! 763: UMULcc_I	umulcc 	%r14, 0x0001, %r4
	mov 0x35, %r30
	.word 0x95d0001e  ! 764: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x8d802004  ! 765: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d902859  ! 766: WRPR_PSTATE_I	wrpr	%r0, 0x0859, %pstate
	.word 0xc927e001  ! 767: STF_I	st	%f4, [0x0001, %r31]
	.word 0x96482001  ! 768: MULX_I	mulx 	%r0, 0x0001, %r11
	.word 0x8d802004  ! 769: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd7e7c02d  ! 770: CASA_I	casa	[%r31] 0x 1, %r13, %r11
	ta	T_CHANGE_PRIV	! macro
	.word 0x2c800001  ! 772: BNEG	bneg,a	<label_0x1>
	.word 0xd68008a0  ! 773: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0xd637e001  ! 774: STH_I	sth	%r11, [%r31 + 0x0001]
	.word 0xd62fc00d  ! 775: STB_R	stb	%r11, [%r31 + %r13]
	.word 0xd6800aa0  ! 776: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r11
	mov 0x35, %r30
	.word 0x95d0001e  ! 777: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0xd6ffc02d  ! 778: SWAPA_R	swapa	%r11, [%r31 + %r13] 0x01
	.word 0x8198295d  ! 779: WRHPR_HPSTATE_I	wrhpr	%r0, 0x095d, %hpstate
	.word 0x89d02035  ! 780: Tcc_I	tleu	icc_or_xcc, %r0 + 53
	.word 0x89508000  ! 781: RDPR_TSTATE	rdpr	%tstate, %r4
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xc87fe001  ! 783: SWAP_I	swap	%r4, [%r31 + 0x0001]
	.word 0xc88008a0  ! 784: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
	.word 0x8d802000  ! 785: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d902ed8  ! 786: WRPR_PSTATE_I	wrpr	%r0, 0x0ed8, %pstate
	.word 0xc917c000  ! 787: LDQF_R	-	[%r31, %r0], %f4
	.word 0x83514000  ! 788: RDPR_TBA	rdpr	%tba, %r1
	.word 0xc2800a80  ! 789: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r1
	.word 0xc2dfe000  ! 790: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r1
DS_35:
	.word 0x32800001  ! 792: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x99b24308  ! 791: ALLIGNADDRESS	alignaddr	%r9, %r8, %r12
	mov 0x32, %r30
	.word 0x83d0001e  ! 792: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x81982c01  ! 793: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c01, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d90249e  ! 795: WRPR_PSTATE_I	wrpr	%r0, 0x049e, %pstate
	.word 0x819824d0  ! 796: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04d0, %hpstate
	.word 0xd8800b80  ! 797: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r12
	.word 0x8d902e5a  ! 798: WRPR_PSTATE_I	wrpr	%r0, 0x0e5a, %pstate
	.word 0x81982b5b  ! 799: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b5b, %hpstate
	mov 0x35, %r30
	.word 0x99d0001e  ! 800: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0xd9e7c028  ! 801: CASA_I	casa	[%r31] 0x 1, %r8, %r12
	.word 0x8d902a00  ! 802: WRPR_PSTATE_I	wrpr	%r0, 0x0a00, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xd82fe001  ! 804: STB_I	stb	%r12, [%r31 + 0x0001]
	.word 0x81982d95  ! 805: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d95, %hpstate
	.word 0xd8800a60  ! 806: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r12
	.word 0xd8bfe001  ! 807: STDA_I	stda	%r12, [%r31 + 0x0001] %asi
	.word 0xd8ffc028  ! 808: SWAPA_R	swapa	%r12, [%r31 + %r8] 0x01
	.word 0x8d902400  ! 809: WRPR_PSTATE_I	wrpr	%r0, 0x0400, %pstate
	.word 0x81982b48  ! 810: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b48, %hpstate
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd927e001  ! 813: STF_I	st	%f12, [0x0001, %r31]
	.word 0x8d90268b  ! 814: WRPR_PSTATE_I	wrpr	%r0, 0x068b, %pstate
	.word 0x83a00548  ! 815: FSQRTd	fsqrt	
DS_36:
	.word 0x34800001  ! 817: BG	bg,a	<label_0x1>
	illtrap
	.word 0x81b3030d  ! 816: ALLIGNADDRESS	alignaddr	%r12, %r13, %r0
	.word 0x87802080  ! 817: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xc08008a0  ! 818: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0xc0dfe010  ! 819: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r0
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81d02033  ! 821: Tcc_I	tn	icc_or_xcc, %r0 + 51
	.word 0xc08008a0  ! 822: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0x9bd02032  ! 823: Tcc_I	tcc	icc_or_xcc, %r0 + 50
	.word 0x8d802000  ! 824: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x99a00566  ! 825: FSQRTq	fsqrt	
	.word 0xd8800c40  ! 826: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r12
	.word 0x9dd02032  ! 827: Tcc_I	tpos	icc_or_xcc, %r0 + 50
	.word 0xd88008a0  ! 828: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x8d90268d  ! 829: WRPR_PSTATE_I	wrpr	%r0, 0x068d, %pstate
	.word 0x2e700001  ! 830: BPVS	<illegal instruction>
	.word 0xd8800c60  ! 831: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r12
	.word 0x81a01a68  ! 832: FqTOi	fqtoi	
	.word 0x99a3c9c1  ! 833: FDIVd	fdivd	%f46, %f32, %f12
	.word 0x9a802001  ! 834: ADDcc_I	addcc 	%r0, 0x0001, %r13
	ta	T_CHANGE_PRIV	! macro
	.word 0xdaffc021  ! 836: SWAPA_R	swapa	%r13, [%r31 + %r1] 0x01
	.word 0x9279000d  ! 837: SDIV_R	sdiv 	%r4, %r13, %r9
	.word 0xd2ffc02d  ! 838: SWAPA_R	swapa	%r9, [%r31 + %r13] 0x01
	.word 0xd2d004a0  ! 839: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r9
	.word 0x36800001  ! 840: BGE	bge,a	<label_0x1>
	.word 0xd2800b00  ! 841: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r9
	.word 0x8d902ad0  ! 842: WRPR_PSTATE_I	wrpr	%r0, 0x0ad0, %pstate
	.word 0x8198284b  ! 843: WRHPR_HPSTATE_I	wrhpr	%r0, 0x084b, %hpstate
	.word 0xd29004a0  ! 844: LDUHA_R	lduha	[%r0, %r0] 0x25, %r9
	.word 0x81982fc6  ! 845: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fc6, %hpstate
	.word 0x8bd02033  ! 846: Tcc_I	tcs	icc_or_xcc, %r0 + 51
	.word 0x87500000  ! 847: RDPR_TPC	rdpr	%tpc, %r3
	.word 0x8d802004  ! 848: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x9750c000  ! 849: RDPR_TT	rdpr	%tt, %r11
	.word 0x81982f99  ! 850: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f99, %hpstate
	.word 0xd68008a0  ! 851: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x3e700001  ! 852: BPVC	<illegal instruction>
	.word 0x8da20d2a  ! 853: FsMULd	fsmuld	%f8, %f10, %f6
	.word 0xcde7c02a  ! 854: CASA_I	casa	[%r31] 0x 1, %r10, %r6
	.word 0x8251000e  ! 855: UMUL_R	umul 	%r4, %r14, %r1
	mov 0x33, %r30
	.word 0x8dd0001e  ! 856: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
DS_37:
	.word 0x20800001  ! 858: BN	bn,a	<label_0x1>
	illtrap
	.word 0x8fb20303  ! 857: ALLIGNADDRESS	alignaddr	%r8, %r3, %r7
	.word 0xce4fe001  ! 858: LDSB_I	ldsb	[%r31 + 0x0001], %r7
	.word 0x8d802000  ! 859: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d902695  ! 860: WRPR_PSTATE_I	wrpr	%r0, 0x0695, %pstate
	.word 0x8d90224a  ! 861: WRPR_PSTATE_I	wrpr	%r0, 0x024a, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x2e700001  ! 863: BPVS	<illegal instruction>
	.word 0x81982d02  ! 864: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d02, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x964aa001  ! 866: MULX_I	mulx 	%r10, 0x0001, %r11
	.word 0x9ba00541  ! 867: FSQRTd	fsqrt	
	.word 0x9d50c000  ! 868: RDPR_TT	rdpr	%tt, %r14
	mov 0x32, %r30
	.word 0x9dd0001e  ! 869: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0xdcffc021  ! 872: SWAPA_R	swapa	%r14, [%r31 + %r1] 0x01
	.word 0x9fd02034  ! 873: Tcc_I	tvc	icc_or_xcc, %r0 + 52
	.word 0x81d02030  ! 874: Tcc_I	tn	icc_or_xcc, %r0 + 48
	.word 0xdc1fc000  ! 875: LDD_R	ldd	[%r31 + %r0], %r14
	.word 0x9dd02034  ! 876: Tcc_I	tpos	icc_or_xcc, %r0 + 52
	.word 0x887b2001  ! 877: SDIV_I	sdiv 	%r12, 0x0001, %r4
	.word 0xc807c000  ! 878: LDUW_R	lduw	[%r31 + %r0], %r4
	.word 0x3e800001  ! 879: BVC	bvc,a	<label_0x1>
	.word 0x20800001  ! 880: BN	bn,a	<label_0x1>
	.word 0xc8d7e020  ! 881: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r4
	.word 0x87802088  ! 882: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xc927c001  ! 883: STF_R	st	%f4, [%r1, %r31]
	.word 0xc807c000  ! 884: LDUW_R	lduw	[%r31 + %r0], %r4
	ta	T_CHANGE_PRIV	! macro
	.word 0x92822001  ! 886: ADDcc_I	addcc 	%r8, 0x0001, %r9
	mov 0x31, %r30
	.word 0x8dd0001e  ! 887: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x8d902c43  ! 888: WRPR_PSTATE_I	wrpr	%r0, 0x0c43, %pstate
	.word 0x34700001  ! 889: BPG	<illegal instruction>
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d802004  ! 891: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8e4b4007  ! 892: MULX_R	mulx 	%r13, %r7, %r7
	.word 0x8d9026c6  ! 893: WRPR_PSTATE_I	wrpr	%r0, 0x06c6, %pstate
	.word 0x81982810  ! 894: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0810, %hpstate
	.word 0xcedfe000  ! 895: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r7
	.word 0x8adb4003  ! 896: SMULcc_R	smulcc 	%r13, %r3, %r5
	.word 0x3a800001  ! 897: BCC	bcc,a	<label_0x1>
	.word 0x8d802000  ! 898: WRFPRS_I	wr	%r0, 0x0000, %fprs
	mov 0x33, %r30
	.word 0x93d0001e  ! 899: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xcacfe010  ! 900: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r5
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xcbe7c023  ! 902: CASA_I	casa	[%r31] 0x 1, %r3, %r5
	.word 0x87802088  ! 903: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8d9022c1  ! 904: WRPR_PSTATE_I	wrpr	%r0, 0x02c1, %pstate
	.word 0xca880e60  ! 905: LDUBA_R	lduba	[%r0, %r0] 0x73, %r5
	.word 0x81982edf  ! 906: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0edf, %hpstate
	.word 0x8d902881  ! 907: WRPR_PSTATE_I	wrpr	%r0, 0x0881, %pstate
	.word 0x87802010  ! 908: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x81982c5f  ! 909: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c5f, %hpstate
	.word 0x8d9026c1  ! 910: WRPR_PSTATE_I	wrpr	%r0, 0x06c1, %pstate
	.word 0x9cc02001  ! 911: ADDCcc_I	addccc 	%r0, 0x0001, %r14
DS_38:
	.word 0x32800001  ! 913: BNE	bne,a	<label_0x1>
	.word 0xd530e001  ! 913: STQF_I	-	%f10, [0x0001, %r3]
	.word 0x8b458000  ! 912: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0x8d902ed0  ! 913: WRPR_PSTATE_I	wrpr	%r0, 0x0ed0, %pstate
	.word 0x8b6b000f  ! 914: SDIVX_R	sdivx	%r12, %r15, %r5
	.word 0x93504000  ! 915: RDPR_TNPC	rdpr	%tnpc, %r9
	.word 0x93480000  ! 916: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
	.word 0x36700001  ! 917: BPGE	<illegal instruction>
	.word 0x81982d8e  ! 918: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d8e, %hpstate
DS_39:
	.word 0x34800001  ! 920: BG	bg,a	<label_0x1>
	.word 0xd932e001  ! 920: STQF_I	-	%f12, [0x0001, %r11]
	.word 0x9d458000  ! 919: RD_SOFTINT_REG	rd	%softint, %r14
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8fa0cd24  ! 921: FsMULd	fsmuld	%f3, %f4, %f38
	.word 0x8da38d27  ! 922: FsMULd	fsmuld	%f14, %f38, %f6
	.word 0x819828d9  ! 923: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d9, %hpstate
	.word 0x9a48400a  ! 924: MULX_R	mulx 	%r1, %r10, %r13
	mov 0x35, %r30
	.word 0x8dd0001e  ! 925: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0xdb37c00a  ! 926: STQF_R	-	%f13, [%r10, %r31]
	ta	T_CHANGE_HPRIV	! macro
	.word 0x819826c2  ! 928: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06c2, %hpstate
	.word 0x8d802000  ! 929: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_PRIV	! macro
	.word 0xda57c000  ! 931: LDSH_R	ldsh	[%r31 + %r0], %r13
	.word 0x8369000b  ! 932: SDIVX_R	sdivx	%r4, %r11, %r1
	.word 0x87802088  ! 933: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x20800001  ! 934: BN	bn,a	<label_0x1>
DS_40:
	.word 0x32800001  ! 936: BNE	bne,a	<label_0x1>
	.word 0xdd324006  ! 936: STQF_R	-	%f14, [%r6, %r9]
	.word 0x99458000  ! 935: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x85d02032  ! 936: Tcc_I	tle	icc_or_xcc, %r0 + 50
	.word 0x3a800001  ! 937: BCC	bcc,a	<label_0x1>
	.word 0x8e6b6001  ! 938: UDIVX_I	udivx 	%r13, 0x0001, %r7
	.word 0x9a6b0009  ! 939: UDIVX_R	udivx 	%r12, %r9, %r13
	.word 0x81982296  ! 940: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0296, %hpstate
	.word 0x8da089c4  ! 941: FDIVd	fdivd	%f2, %f4, %f6
	.word 0x819825cf  ! 942: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05cf, %hpstate
	.word 0x81982102  ! 943: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0102, %hpstate
	.word 0x8d902e98  ! 944: WRPR_PSTATE_I	wrpr	%r0, 0x0e98, %pstate
	.word 0x8d802004  ! 945: WRFPRS_I	wr	%r0, 0x0004, %fprs
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x9883000e  ! 947: ADDcc_R	addcc 	%r12, %r14, %r12
	mov 0x34, %r30
	.word 0x89d0001e  ! 948: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x847a6001  ! 949: SDIV_I	sdiv 	%r9, 0x0001, %r2
	.word 0x8fd02030  ! 950: Tcc_I	tvs	icc_or_xcc, %r0 + 48
	.word 0x2c700001  ! 951: BPNEG	<illegal instruction>
	.word 0x8d902e57  ! 952: WRPR_PSTATE_I	wrpr	%r0, 0x0e57, %pstate
	.word 0xc4800c00  ! 953: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r2
	.word 0x9852000d  ! 954: UMUL_R	umul 	%r8, %r13, %r12
	.word 0x8d902add  ! 955: WRPR_PSTATE_I	wrpr	%r0, 0x0add, %pstate
	.word 0x8c49a001  ! 956: MULX_I	mulx 	%r6, 0x0001, %r6
	.word 0xcc800c60  ! 957: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r6
	.word 0x8d90264d  ! 958: WRPR_PSTATE_I	wrpr	%r0, 0x064d, %pstate
	.word 0xcc4fe001  ! 959: LDSB_I	ldsb	[%r31 + 0x0001], %r6
	.word 0x8d802004  ! 960: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x36700001  ! 961: BPGE	<illegal instruction>
	.word 0x8d504000  ! 962: RDPR_TNPC	rdpr	%tnpc, %r6
	.word 0x34700001  ! 963: BPG	<illegal instruction>
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x9f514000  ! 965: RDPR_TBA	rdpr	%tba, %r15
	.word 0x9a82800c  ! 966: ADDcc_R	addcc 	%r10, %r12, %r13
	.word 0x9dd02035  ! 967: Tcc_I	tpos	icc_or_xcc, %r0 + 53
	.word 0xda57e001  ! 968: LDSH_I	ldsh	[%r31 + 0x0001], %r13
	.word 0xda97e030  ! 969: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r13
	.word 0x87802014  ! 970: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x94c36001  ! 971: ADDCcc_I	addccc 	%r13, 0x0001, %r10
	.word 0x8198284e  ! 972: WRHPR_HPSTATE_I	wrhpr	%r0, 0x084e, %hpstate
	.word 0xd4cfe020  ! 973: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r10
	.word 0x93a249a4  ! 974: FDIVs	fdivs	%f9, %f4, %f9
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d902e84  ! 977: WRPR_PSTATE_I	wrpr	%r0, 0x0e84, %pstate
	.word 0x81982dc3  ! 978: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dc3, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81982a04  ! 980: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a04, %hpstate
	.word 0x8d802004  ! 981: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd2c7e010  ! 982: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r9
	.word 0x9adbc00a  ! 983: SMULcc_R	smulcc 	%r15, %r10, %r13
	.word 0x97d02035  ! 984: Tcc_I	tge	icc_or_xcc, %r0 + 53
	.word 0x8d902a13  ! 985: WRPR_PSTATE_I	wrpr	%r0, 0x0a13, %pstate
	.word 0x8d802000  ! 986: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87802004  ! 987: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xdb37e001  ! 988: STQF_I	-	%f13, [0x0001, %r31]
	.word 0x87d02033  ! 989: Tcc_I	tl	icc_or_xcc, %r0 + 51
	.word 0x92d1c006  ! 990: UMULcc_R	umulcc 	%r7, %r6, %r9
	.word 0x36700001  ! 991: BPGE	<illegal instruction>
	.word 0x91d02034  ! 992: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xd2ffc026  ! 993: SWAPA_R	swapa	%r9, [%r31 + %r6] 0x01
	.word 0x3e800001  ! 994: BVC	bvc,a	<label_0x1>
	.word 0xd21fc000  ! 995: LDD_R	ldd	[%r31 + %r0], %r9
	.word 0xd2c804a0  ! 996: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r9
	.word 0xd337e001  ! 997: STQF_I	-	%f9, [0x0001, %r31]
	.word 0x9da289ee  ! 998: FDIVq	dis not found

	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xdc880e40  ! 1001: LDUBA_R	lduba	[%r0, %r0] 0x72, %r14
DS_41:
	.word 0x20800001  ! 1003: BN	bn,a	<label_0x1>
	illtrap
	.word 0x87b2430d  ! 1002: ALLIGNADDRESS	alignaddr	%r9, %r13, %r3
	mov 0x31, %r30
	.word 0x9dd0001e  ! 1003: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x81982410  ! 1004: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0410, %hpstate
	.word 0x8d802000  ! 1005: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc717c000  ! 1006: LDQF_R	-	[%r31, %r0], %f3
	.word 0xc6c7e020  ! 1007: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r3
	.word 0x9a6b2001  ! 1008: UDIVX_I	udivx 	%r12, 0x0001, %r13
DS_42:
	.word 0x22800001  ! 1010: BE	be,a	<label_0x1>
	illtrap
	.word 0x83b2830b  ! 1009: ALLIGNADDRESS	alignaddr	%r10, %r11, %r1
	.word 0xc28804a0  ! 1010: LDUBA_R	lduba	[%r0, %r0] 0x25, %r1
	.word 0x8d9024d1  ! 1011: WRPR_PSTATE_I	wrpr	%r0, 0x04d1, %pstate
	.word 0x8d90265e  ! 1012: WRPR_PSTATE_I	wrpr	%r0, 0x065e, %pstate
	.word 0x81982293  ! 1013: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0293, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8ada4009  ! 1015: SMULcc_R	smulcc 	%r9, %r9, %r5
	.word 0xcad004a0  ! 1016: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r5
	.word 0xca8008a0  ! 1017: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0x8d902487  ! 1018: WRPR_PSTATE_I	wrpr	%r0, 0x0487, %pstate
	.word 0x28800001  ! 1019: BLEU	bleu,a	<label_0x1>
	.word 0x2e800001  ! 1020: BVS	bvs,a	<label_0x1>
DS_43:
	.word 0x34800001  ! 1022: BG	bg,a	<label_0x1>
	illtrap
	.word 0x95b30305  ! 1021: ALLIGNADDRESS	alignaddr	%r12, %r5, %r10
DS_44:
	.word 0x32800001  ! 1023: BNE	bne,a	<label_0x1>
	.word 0xdd318000  ! 1023: STQF_R	-	%f14, [%r0, %r6]
	.word 0x9d458000  ! 1022: RD_SOFTINT_REG	rd	%softint, %r14
	.word 0x8d902446  ! 1023: WRPR_PSTATE_I	wrpr	%r0, 0x0446, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902a90  ! 1025: WRPR_PSTATE_I	wrpr	%r0, 0x0a90, %pstate
	.word 0x9ad94005  ! 1026: SMULcc_R	smulcc 	%r5, %r5, %r13
	.word 0x84d9000e  ! 1027: SMULcc_R	smulcc 	%r4, %r14, %r2
	.word 0xc48008a0  ! 1028: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x8a6a800c  ! 1029: UDIVX_R	udivx 	%r10, %r12, %r5
	.word 0x87802089  ! 1030: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xca77e001  ! 1031: STX_I	stx	%r5, [%r31 + 0x0001]
	.word 0x81982f0d  ! 1032: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f0d, %hpstate
	.word 0x28800001  ! 1033: BLEU	bleu,a	<label_0x1>
	.word 0x9d51c000  ! 1034: RDPR_TL	rdpr	%tl, %r14
	.word 0x87802014  ! 1035: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x9fa01a65  ! 1036: FqTOi	fqtoi	
	.word 0x8198278c  ! 1037: WRHPR_HPSTATE_I	wrhpr	%r0, 0x078c, %hpstate
	.word 0x9dd02031  ! 1038: Tcc_I	tpos	icc_or_xcc, %r0 + 49
	.word 0xde8fe020  ! 1039: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r15
	.word 0x8da00565  ! 1040: FSQRTq	fsqrt	
	.word 0xcc9fe001  ! 1041: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r6
	mov 0x34, %r30
	.word 0x95d0001e  ! 1042: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x87802080  ! 1043: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x81494000  ! 1044: RDHPR_HTBA	rdhpr	%htba, %r0
	.word 0xc037c005  ! 1045: STH_R	sth	%r0, [%r31 + %r5]
	mov 0x32, %r30
	.word 0x97d0001e  ! 1046: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0xc0dfe020  ! 1047: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r0
	mov 0x34, %r30
	.word 0x81d0001e  ! 1048: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x8198205f  ! 1049: WRHPR_HPSTATE_I	wrhpr	%r0, 0x005f, %hpstate
	.word 0x8d90264d  ! 1050: WRPR_PSTATE_I	wrpr	%r0, 0x064d, %pstate
DS_45:
	.word 0x32800001  ! 1052: BNE	bne,a	<label_0x1>
	.word 0xd1318003  ! 1052: STQF_R	-	%f8, [%r3, %r6]
	.word 0x91458000  ! 1051: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x91508000  ! 1052: RDPR_TSTATE	rdpr	%tstate, %r8
	.word 0x8d9026cc  ! 1053: WRPR_PSTATE_I	wrpr	%r0, 0x06cc, %pstate
	.word 0x9dd02034  ! 1054: Tcc_I	tpos	icc_or_xcc, %r0 + 52
	.word 0x98828000  ! 1055: ADDcc_R	addcc 	%r10, %r0, %r12
	.word 0xd8cfe030  ! 1056: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r12
	ta	T_CHANGE_TO_TL0	! macro
	mov 0x30, %r30
	.word 0x8bd0001e  ! 1058: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0xd8800c80  ! 1059: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r12
	.word 0x87802089  ! 1060: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8e6be001  ! 1061: UDIVX_I	udivx 	%r15, 0x0001, %r7
	.word 0xce0fc000  ! 1062: LDUB_R	ldub	[%r31 + %r0], %r7
	.word 0x93a2cd2e  ! 1063: FsMULd	fsmuld	%f11, %f14, %f40
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81982f9c  ! 1065: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f9c, %hpstate
	.word 0x30800001  ! 1066: BA	ba,a	<label_0x1>
	.word 0xd277e001  ! 1067: STX_I	stx	%r9, [%r31 + 0x0001]
	.word 0x93d02032  ! 1068: Tcc_I	tne	icc_or_xcc, %r0 + 50
DS_46:
	.word 0x32800001  ! 1070: BNE	bne,a	<label_0x1>
	.word 0xdd31000f  ! 1070: STQF_R	-	%f14, [%r15, %r4]
	.word 0x95458000  ! 1069: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0x8d802000  ! 1070: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x3a700001  ! 1071: BPCC	<illegal instruction>
	.word 0x8d802000  ! 1072: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x24700001  ! 1073: BPLE	<illegal instruction>
	.word 0xd48008a0  ! 1074: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x81d02035  ! 1075: Tcc_I	tn	icc_or_xcc, %r0 + 53
DS_47:
	.word 0x20800001  ! 1077: BN	bn,a	<label_0x1>
	.word 0xdb300008  ! 1077: STQF_R	-	%f13, [%r8, %r0]
	.word 0x9f458000  ! 1076: RD_SOFTINT_REG	rd	%softint, %r15
	.word 0x819820d0  ! 1077: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00d0, %hpstate
	mov 0x34, %r30
	.word 0x81d0001e  ! 1078: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x9dd02030  ! 1080: Tcc_I	tpos	icc_or_xcc, %r0 + 48
	.word 0x9c49c00e  ! 1081: MULX_R	mulx 	%r7, %r14, %r14
	.word 0x81982101  ! 1082: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0101, %hpstate
	.word 0x8198250e  ! 1083: WRHPR_HPSTATE_I	wrhpr	%r0, 0x050e, %hpstate
	.word 0x81982645  ! 1084: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0645, %hpstate
	.word 0xdc8008a0  ! 1085: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r14
	.word 0x8d902800  ! 1086: WRPR_PSTATE_I	wrpr	%r0, 0x0800, %pstate
	.word 0x91a00542  ! 1087: FSQRTd	fsqrt	
	.word 0x96792001  ! 1088: SDIV_I	sdiv 	%r4, 0x0001, %r11
	.word 0x8d902419  ! 1089: WRPR_PSTATE_I	wrpr	%r0, 0x0419, %pstate
	.word 0xd6d80e80  ! 1090: LDXA_R	ldxa	[%r0, %r0] 0x74, %r11
	.word 0xd6d7e020  ! 1091: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r11
	.word 0x86d2c000  ! 1092: UMULcc_R	umulcc 	%r11, %r0, %r3
	.word 0x91d02031  ! 1093: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x91a01a6c  ! 1094: FqTOi	fqtoi	
	.word 0x22800001  ! 1095: BE	be,a	<label_0x1>
	.word 0x97d02030  ! 1096: Tcc_I	tge	icc_or_xcc, %r0 + 48
	mov 0x30, %r30
	.word 0x85d0001e  ! 1097: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd0d80e40  ! 1099: LDXA_R	ldxa	[%r0, %r0] 0x72, %r8
	.word 0x87802016  ! 1100: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x94032001  ! 1101: ADD_I	add 	%r12, 0x0001, %r10
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd43fe001  ! 1103: STD_I	std	%r10, [%r31 + 0x0001]
	.word 0xd4800ac0  ! 1104: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r10
	.word 0x8d902ad2  ! 1105: WRPR_PSTATE_I	wrpr	%r0, 0x0ad2, %pstate
	.word 0xd48008a0  ! 1106: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x92806001  ! 1108: ADDcc_I	addcc 	%r1, 0x0001, %r9
	.word 0xd2880e80  ! 1109: LDUBA_R	lduba	[%r0, %r0] 0x74, %r9
DS_48:
	.word 0x22800001  ! 1111: BE	be,a	<label_0x1>
	.word 0xc5322001  ! 1111: STQF_I	-	%f2, [0x0001, %r8]
	.word 0x9b458000  ! 1110: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x8d902048  ! 1111: WRPR_PSTATE_I	wrpr	%r0, 0x0048, %pstate
	.word 0x8e80a001  ! 1112: ADDcc_I	addcc 	%r2, 0x0001, %r7
	ta	T_CHANGE_HPRIV	! macro
	mov 0x32, %r30
	.word 0x9bd0001e  ! 1114: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x22700001  ! 1115: BPE	<illegal instruction>
	.word 0x83a000c3  ! 1116: FNEGd	fnegd	%f34, %f32
	.word 0x9dd02030  ! 1117: Tcc_I	tpos	icc_or_xcc, %r0 + 48
	.word 0x98686001  ! 1118: UDIVX_I	udivx 	%r1, 0x0001, %r12
	.word 0xd8c00e80  ! 1119: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r12
	.word 0x8b480000  ! 1120: RDHPR_HPSTATE	rdhpr	%hpstate, %r5
	.word 0x99514000  ! 1121: RDPR_TBA	rdpr	%tba, %r12
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x81982d95  ! 1123: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d95, %hpstate
	.word 0x81982a8e  ! 1124: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a8e, %hpstate
DS_49:
	.word 0x22800001  ! 1126: BE	be,a	<label_0x1>
	.word 0xc3322001  ! 1126: STQF_I	-	%f1, [0x0001, %r8]
	.word 0x85458000  ! 1125: RD_SOFTINT_REG	rd	%softint, %r2
	.word 0x8d902ac4  ! 1126: WRPR_PSTATE_I	wrpr	%r0, 0x0ac4, %pstate
	mov 0x34, %r30
	.word 0x8dd0001e  ! 1127: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x8069c004  ! 1128: UDIVX_R	udivx 	%r7, %r4, %r0
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9c53800e  ! 1130: UMUL_R	umul 	%r14, %r14, %r14
	.word 0x81d02033  ! 1131: Tcc_I	tn	icc_or_xcc, %r0 + 51
	.word 0x8e4b6001  ! 1132: MULX_I	mulx 	%r13, 0x0001, %r7
	.word 0x9adb8004  ! 1133: SMULcc_R	smulcc 	%r14, %r4, %r13
	.word 0x8d902416  ! 1134: WRPR_PSTATE_I	wrpr	%r0, 0x0416, %pstate
	.word 0x8d902e01  ! 1135: WRPR_PSTATE_I	wrpr	%r0, 0x0e01, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8cd90003  ! 1137: SMULcc_R	smulcc 	%r4, %r3, %r6
	.word 0x886ae001  ! 1138: UDIVX_I	udivx 	%r11, 0x0001, %r4
	.word 0x82820004  ! 1139: ADDcc_R	addcc 	%r8, %r4, %r1
	.word 0x8d902edb  ! 1140: WRPR_PSTATE_I	wrpr	%r0, 0x0edb, %pstate
	.word 0x819823c5  ! 1141: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03c5, %hpstate
	.word 0xc29004a0  ! 1142: LDUHA_R	lduha	[%r0, %r0] 0x25, %r1
	mov 0x35, %r30
	.word 0x83d0001e  ! 1143: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x92698006  ! 1144: UDIVX_R	udivx 	%r6, %r6, %r9
DS_50:
	.word 0x34800001  ! 1146: BG	bg,a	<label_0x1>
	.word 0xc730800b  ! 1146: STQF_R	-	%f3, [%r11, %r2]
	.word 0x8f458000  ! 1145: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0xce9fc020  ! 1146: LDDA_R	ldda	[%r31, %r0] 0x01, %r7
	.word 0x8d802004  ! 1147: WRFPRS_I	wr	%r0, 0x0004, %fprs
	ta	T_CHANGE_PRIV	! macro
	.word 0xce800ac0  ! 1149: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r7
	mov 0x35, %r30
	.word 0x99d0001e  ! 1150: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
DS_51:
	.word 0x32800001  ! 1152: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x87b3430c  ! 1151: ALLIGNADDRESS	alignaddr	%r13, %r12, %r3
	.word 0xc6cfe010  ! 1152: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r3
	mov 0x33, %r30
	.word 0x8bd0001e  ! 1153: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x8d902a84  ! 1154: WRPR_PSTATE_I	wrpr	%r0, 0x0a84, %pstate
	mov 0x33, %r30
	.word 0x89d0001e  ! 1155: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0xc6cfe030  ! 1156: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r3
	.word 0x8d902ed3  ! 1157: WRPR_PSTATE_I	wrpr	%r0, 0x0ed3, %pstate
	.word 0x9950c000  ! 1158: RDPR_TT	rdpr	%tt, %r12
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x87802089  ! 1160: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x81982cc4  ! 1161: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc4, %hpstate
	.word 0x87d02031  ! 1162: Tcc_I	tl	icc_or_xcc, %r0 + 49
	.word 0x99d02030  ! 1163: Tcc_I	tgu	icc_or_xcc, %r0 + 48
	mov 0x35, %r30
	.word 0x8fd0001e  ! 1164: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x89d02034  ! 1165: Tcc_I	tleu	icc_or_xcc, %r0 + 52
	.word 0xd8d804a0  ! 1166: LDXA_R	ldxa	[%r0, %r0] 0x25, %r12
	.word 0x8d902c8d  ! 1167: WRPR_PSTATE_I	wrpr	%r0, 0x0c8d, %pstate
	.word 0x856bc00e  ! 1168: SDIVX_R	sdivx	%r15, %r14, %r2
	.word 0x97d02030  ! 1169: Tcc_I	tge	icc_or_xcc, %r0 + 48
	.word 0x8d802000  ! 1170: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8dd02032  ! 1171: Tcc_I	tneg	icc_or_xcc, %r0 + 50
	.word 0xc4d7e030  ! 1172: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r2
	.word 0xc417e001  ! 1173: LDUH_I	lduh	[%r31 + 0x0001], %r2
	.word 0x2c800001  ! 1174: BNEG	bneg,a	<label_0x1>
	.word 0x8d902248  ! 1175: WRPR_PSTATE_I	wrpr	%r0, 0x0248, %pstate
	.word 0x9fd02032  ! 1176: Tcc_I	tvc	icc_or_xcc, %r0 + 50
	.word 0x87802088  ! 1177: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x24800001  ! 1178: BLE	ble,a	<label_0x1>
	.word 0x93494000  ! 1179: RDHPR_HTBA	rdhpr	%htba, %r9
	.word 0xd28008a0  ! 1180: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x9751c000  ! 1181: RDPR_TL	rdpr	%tl, %r11
DS_52:
	.word 0x22800001  ! 1183: BE	be,a	<label_0x1>
	.word 0xdf30e001  ! 1183: STQF_I	-	%f15, [0x0001, %r3]
	.word 0x93458000  ! 1182: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x81982f4c  ! 1183: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f4c, %hpstate
	.word 0x81982ecb  ! 1184: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ecb, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9da00541  ! 1186: FSQRTd	fsqrt	
DS_53:
	.word 0x32800001  ! 1188: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x83b34304  ! 1187: ALLIGNADDRESS	alignaddr	%r13, %r4, %r1
	.word 0x8d902a05  ! 1188: WRPR_PSTATE_I	wrpr	%r0, 0x0a05, %pstate
	.word 0xc277c004  ! 1189: STX_R	stx	%r1, [%r31 + %r4]
	.word 0x8d90268a  ! 1190: WRPR_PSTATE_I	wrpr	%r0, 0x068a, %pstate
	.word 0x8d802000  ! 1191: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x85a01a6a  ! 1192: FqTOi	fqtoi	
	.word 0x98c2a001  ! 1193: ADDCcc_I	addccc 	%r10, 0x0001, %r12
	.word 0x26700001  ! 1194: BPL	<illegal instruction>
	.word 0xd82fe001  ! 1195: STB_I	stb	%r12, [%r31 + 0x0001]
DS_54:
	.word 0x34800001  ! 1197: BG	bg,a	<label_0x1>
	.word 0xdf332001  ! 1197: STQF_I	-	%f15, [0x0001, %r12]
	.word 0x9b458000  ! 1196: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x86c16001  ! 1197: ADDCcc_I	addccc 	%r5, 0x0001, %r3
	.word 0xc727e001  ! 1198: STF_I	st	%f3, [0x0001, %r31]
	.word 0x8d902e94  ! 1199: WRPR_PSTATE_I	wrpr	%r0, 0x0e94, %pstate
	.word 0x8e4a400b  ! 1200: MULX_R	mulx 	%r9, %r11, %r7
	.word 0x8d902097  ! 1201: WRPR_PSTATE_I	wrpr	%r0, 0x0097, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x32700001  ! 1203: BPNE	<illegal instruction>
	.word 0x9ba109ee  ! 1204: FDIVq	dis not found

	.word 0x8d802000  ! 1205: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9dd02032  ! 1206: Tcc_I	tpos	icc_or_xcc, %r0 + 50
	.word 0x81982bc5  ! 1207: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc5, %hpstate
	.word 0x81982f40  ! 1208: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f40, %hpstate
	.word 0xda8008a0  ! 1209: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0xda900e80  ! 1210: LDUHA_R	lduha	[%r0, %r0] 0x74, %r13
	.word 0x8d902a02  ! 1211: WRPR_PSTATE_I	wrpr	%r0, 0x0a02, %pstate
	.word 0x8d802004  ! 1212: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x93d02033  ! 1213: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0xda880e60  ! 1214: LDUBA_R	lduba	[%r0, %r0] 0x73, %r13
	.word 0x876aa001  ! 1215: SDIVX_I	sdivx	%r10, 0x0001, %r3
	.word 0x9da10dc3  ! 1216: FdMULq	fdmulq	
	.word 0x8d802000  ! 1217: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d902691  ! 1218: WRPR_PSTATE_I	wrpr	%r0, 0x0691, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81982800  ! 1220: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0800, %hpstate
	.word 0x99a0054a  ! 1221: FSQRTd	fsqrt	
DS_55:
	.word 0x20800001  ! 1223: BN	bn,a	<label_0x1>
	illtrap
	.word 0x83b0c30d  ! 1222: ALLIGNADDRESS	alignaddr	%r3, %r13, %r1
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x92d2c001  ! 1225: UMULcc_R	umulcc 	%r11, %r1, %r9
	.word 0x81982214  ! 1226: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0214, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81982209  ! 1228: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0209, %hpstate
	.word 0x936ba001  ! 1229: SDIVX_I	sdivx	%r14, 0x0001, %r9
	.word 0x2c700001  ! 1230: BPNEG	<illegal instruction>
DS_56:
	.word 0x20800001  ! 1232: BN	bn,a	<label_0x1>
	illtrap
	.word 0x8db00309  ! 1231: ALLIGNADDRESS	alignaddr	%r0, %r9, %r6
DS_57:
	.word 0x20800001  ! 1233: BN	bn,a	<label_0x1>
	illtrap
	.word 0x85b24309  ! 1232: ALLIGNADDRESS	alignaddr	%r9, %r9, %r2
	.word 0x8198215c  ! 1233: WRHPR_HPSTATE_I	wrhpr	%r0, 0x015c, %hpstate
	.word 0x99a01a65  ! 1234: FqTOi	fqtoi	
DS_58:
	.word 0x22800001  ! 1236: BE	be,a	<label_0x1>
	illtrap
	.word 0x89b20307  ! 1235: ALLIGNADDRESS	alignaddr	%r8, %r7, %r4
	.word 0x24700001  ! 1236: BPLE	<illegal instruction>
	.word 0x97a249a4  ! 1237: FDIVs	fdivs	%f9, %f4, %f11
	.word 0x8d90220c  ! 1238: WRPR_PSTATE_I	wrpr	%r0, 0x020c, %pstate
	.word 0x87d02034  ! 1239: Tcc_I	tl	icc_or_xcc, %r0 + 52
	.word 0xd7e7c024  ! 1240: CASA_I	casa	[%r31] 0x 1, %r4, %r11
	.word 0xd67fe001  ! 1241: SWAP_I	swap	%r11, [%r31 + 0x0001]
	.word 0xd61fc000  ! 1242: LDD_R	ldd	[%r31 + %r0], %r11
	.word 0x8d902a5f  ! 1243: WRPR_PSTATE_I	wrpr	%r0, 0x0a5f, %pstate
	.word 0x81982359  ! 1244: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0359, %hpstate
	.word 0xd727e001  ! 1245: STF_I	st	%f11, [0x0001, %r31]
	.word 0x99698001  ! 1246: SDIVX_R	sdivx	%r6, %r1, %r12
	.word 0x97d02032  ! 1247: Tcc_I	tge	icc_or_xcc, %r0 + 50
	.word 0xd89fc020  ! 1248: LDDA_R	ldda	[%r31, %r0] 0x01, %r12
	.word 0x819823dd  ! 1249: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03dd, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x816a6001  ! 1251: SDIVX_I	sdivx	%r9, 0x0001, %r0
	.word 0x81982041  ! 1252: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0041, %hpstate
	.word 0x984a2001  ! 1253: MULX_I	mulx 	%r8, 0x0001, %r12
	.word 0xd937e001  ! 1254: STQF_I	-	%f12, [0x0001, %r31]
	.word 0x87a10d2b  ! 1255: FsMULd	fsmuld	%f4, %f42, %f34
	ta	T_CHANGE_TO_TL0	! macro
DS_59:
	.word 0x34800001  ! 1258: BG	bg,a	<label_0x1>
	.word 0xcf302001  ! 1258: STQF_I	-	%f7, [0x0001, %r0]
	.word 0x91458000  ! 1257: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x8e006001  ! 1258: ADD_I	add 	%r1, 0x0001, %r7
	.word 0x8950c000  ! 1259: RDPR_TT	rdpr	%tt, %r4
	.word 0x8d90280f  ! 1260: WRPR_PSTATE_I	wrpr	%r0, 0x080f, %pstate
	.word 0x8d802000  ! 1261: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x99a01a61  ! 1262: FqTOi	fqtoi	
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81982052  ! 1264: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0052, %hpstate
	.word 0x9678000f  ! 1265: SDIV_R	sdiv 	%r0, %r15, %r11
	.word 0x99a389a9  ! 1266: FDIVs	fdivs	%f14, %f9, %f12
	.word 0xd88008a0  ! 1267: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x9a00e001  ! 1268: ADD_I	add 	%r3, 0x0001, %r13
DS_60:
	.word 0x22800001  ! 1270: BE	be,a	<label_0x1>
	.word 0xc930a001  ! 1270: STQF_I	-	%f4, [0x0001, %r2]
	.word 0x91458000  ! 1269: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x819828da  ! 1270: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08da, %hpstate
	.word 0x81982c0d  ! 1271: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c0d, %hpstate
	.word 0x8ad14009  ! 1272: UMULcc_R	umulcc 	%r5, %r9, %r5
	.word 0x9f504000  ! 1273: RDPR_TNPC	rdpr	%tnpc, %r15
	.word 0x8198250d  ! 1274: WRHPR_HPSTATE_I	wrhpr	%r0, 0x050d, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x88db0008  ! 1276: SMULcc_R	smulcc 	%r12, %r8, %r4
	.word 0xc87fe001  ! 1277: SWAP_I	swap	%r4, [%r31 + 0x0001]
	.word 0x8c03a001  ! 1278: ADD_I	add 	%r14, 0x0001, %r6
	.word 0xcd97e001  ! 1279: LDQFA_I	-	[%r31, 0x0001], %f6
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d802000  ! 1281: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8dd02031  ! 1282: Tcc_I	tneg	icc_or_xcc, %r0 + 49
	.word 0x8d902c5a  ! 1283: WRPR_PSTATE_I	wrpr	%r0, 0x0c5a, %pstate
	.word 0x9fa0054d  ! 1284: FSQRTd	fsqrt	
	.word 0x20800001  ! 1285: BN	bn,a	<label_0x1>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87802089  ! 1287: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x97a0c9aa  ! 1288: FDIVs	fdivs	%f3, %f10, %f11
	.word 0x81982fd9  ! 1289: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd9, %hpstate
	.word 0xd68008a0  ! 1290: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
DS_61:
	.word 0x32800001  ! 1292: BNE	bne,a	<label_0x1>
	.word 0xdd33000d  ! 1292: STQF_R	-	%f14, [%r13, %r12]
	.word 0x83458000  ! 1291: RD_SOFTINT_REG	rd	%softint, %r1
	.word 0x81982918  ! 1292: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0918, %hpstate
	.word 0xc28008a0  ! 1293: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0x9bd02032  ! 1294: Tcc_I	tcc	icc_or_xcc, %r0 + 50
	.word 0xc337c00d  ! 1295: STQF_R	-	%f1, [%r13, %r31]
	.word 0x8d802000  ! 1296: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81a289af  ! 1297: FDIVs	fdivs	%f10, %f15, %f0
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d802004  ! 1299: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8e016001  ! 1300: ADD_I	add 	%r5, 0x0001, %r7
	.word 0xcfe7c02f  ! 1301: CASA_I	casa	[%r31] 0x 1, %r15, %r7
	.word 0x81a00543  ! 1302: FSQRTd	fsqrt	
	mov 0x32, %r30
	.word 0x9fd0001e  ! 1303: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x98da8000  ! 1304: SMULcc_R	smulcc 	%r10, %r0, %r12
	.word 0x96d8c006  ! 1305: SMULcc_R	smulcc 	%r3, %r6, %r11
	.word 0x8d9026d0  ! 1306: WRPR_PSTATE_I	wrpr	%r0, 0x06d0, %pstate
	.word 0x9e6a0009  ! 1307: UDIVX_R	udivx 	%r8, %r9, %r15
	.word 0xde3fe001  ! 1308: STD_I	std	%r15, [%r31 + 0x0001]
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xde9fc020  ! 1310: LDDA_R	ldda	[%r31, %r0] 0x01, %r15
	.word 0x806b400e  ! 1311: UDIVX_R	udivx 	%r13, %r14, %r0
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d51c000  ! 1313: RDPR_TL	rdpr	%tl, %r6
	.word 0x83a0056b  ! 1314: FSQRTq	fsqrt	
	.word 0xc2d7e030  ! 1315: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r1
	.word 0xc29fc020  ! 1316: LDDA_R	ldda	[%r31, %r0] 0x01, %r1
	.word 0x26800001  ! 1317: BL	bl,a	<label_0x1>
	.word 0x90d34001  ! 1318: UMULcc_R	umulcc 	%r13, %r1, %r8
	.word 0x87802080  ! 1319: WRASI_I	wr	%r0, 0x0080, %asi
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a00542  ! 1321: FSQRTd	fsqrt	
	.word 0x83d02033  ! 1322: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x8c812001  ! 1323: ADDcc_I	addcc 	%r4, 0x0001, %r6
	.word 0xcccfe020  ! 1324: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r6
	.word 0xcc47c000  ! 1325: LDSW_R	ldsw	[%r31 + %r0], %r6
	.word 0xcc900e80  ! 1326: LDUHA_R	lduha	[%r0, %r0] 0x74, %r6
	.word 0x8b680005  ! 1327: SDIVX_R	sdivx	%r0, %r5, %r5
	.word 0xca8fe030  ! 1328: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r5
	.word 0x87d02033  ! 1329: Tcc_I	tl	icc_or_xcc, %r0 + 51
	.word 0xcac004a0  ! 1330: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r5
DS_62:
	.word 0x34800001  ! 1332: BG	bg,a	<label_0x1>
	illtrap
	.word 0x8bb3030c  ! 1331: ALLIGNADDRESS	alignaddr	%r12, %r12, %r5
	.word 0x94d88005  ! 1332: SMULcc_R	smulcc 	%r2, %r5, %r10
	.word 0xd4c7e030  ! 1333: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r10
	.word 0x83d02032  ! 1334: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x8198271a  ! 1335: WRHPR_HPSTATE_I	wrhpr	%r0, 0x071a, %hpstate
	.word 0x8d902c40  ! 1336: WRPR_PSTATE_I	wrpr	%r0, 0x0c40, %pstate
	.word 0x20700001  ! 1337: BPN	<illegal instruction>
	.word 0x8d902ec1  ! 1338: WRPR_PSTATE_I	wrpr	%r0, 0x0ec1, %pstate
	.word 0x28700001  ! 1339: BPLEU	<illegal instruction>
	.word 0xd48008a0  ! 1340: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x87802010  ! 1341: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x85d02034  ! 1342: Tcc_I	tle	icc_or_xcc, %r0 + 52
	.word 0xd4cfe000  ! 1343: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r10
	mov 0x33, %r30
	.word 0x9bd0001e  ! 1344: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0xd4c004a0  ! 1348: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
	.word 0x8d90285b  ! 1349: WRPR_PSTATE_I	wrpr	%r0, 0x085b, %pstate
	.word 0x819825d7  ! 1350: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05d7, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x91a2cd2d  ! 1352: FsMULd	fsmuld	%f11, %f44, %f8
	.word 0x8c790008  ! 1353: SDIV_R	sdiv 	%r4, %r8, %r6
	mov 0x33, %r30
	.word 0x97d0001e  ! 1354: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x8d902842  ! 1355: WRPR_PSTATE_I	wrpr	%r0, 0x0842, %pstate
	.word 0x34700001  ! 1356: BPG	<illegal instruction>
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x2c800001  ! 1358: BNEG	bneg,a	<label_0x1>
	.word 0x8d902a81  ! 1359: WRPR_PSTATE_I	wrpr	%r0, 0x0a81, %pstate
	.word 0xccd004a0  ! 1360: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r6
	.word 0x87508000  ! 1361: RDPR_TSTATE	rdpr	%tstate, %r3
	ta	T_CHANGE_NONHPRIV	! macro
	mov 0x32, %r30
	.word 0x93d0001e  ! 1363: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xc6900e60  ! 1364: LDUHA_R	lduha	[%r0, %r0] 0x73, %r3
	.word 0x8d902c47  ! 1365: WRPR_PSTATE_I	wrpr	%r0, 0x0c47, %pstate
	mov 0x35, %r30
	.word 0x81d0001e  ! 1366: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0xc61fe001  ! 1367: LDD_I	ldd	[%r31 + 0x0001], %r3
	.word 0x81a01a62  ! 1368: FqTOi	fqtoi	
	mov 0x34, %r30
	.word 0x87d0001e  ! 1369: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x30700001  ! 1370: BPA	<illegal instruction>
	.word 0x8203e001  ! 1371: ADD_I	add 	%r15, 0x0001, %r1
DS_63:
	.word 0x32800001  ! 1373: BNE	bne,a	<label_0x1>
	.word 0xd7306001  ! 1373: STQF_I	-	%f11, [0x0001, %r1]
	.word 0x93458000  ! 1372: RD_SOFTINT_REG	rd	%softint, %r9
DS_64:
	.word 0x32800001  ! 1374: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x83b3c308  ! 1373: ALLIGNADDRESS	alignaddr	%r15, %r8, %r1
	.word 0x3a700001  ! 1374: BPCC	<illegal instruction>
	.word 0x87802004  ! 1375: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xc2d7e000  ! 1376: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r1
	.word 0x8150c000  ! 1377: RDPR_TT	rdpr	%tt, %r0
	.word 0x8d902c9a  ! 1378: WRPR_PSTATE_I	wrpr	%r0, 0x0c9a, %pstate
	.word 0x84786001  ! 1379: SDIV_I	sdiv 	%r1, 0x0001, %r2
	.word 0x8fa3cd20  ! 1380: FsMULd	fsmuld	%f15, %f0, %f38
	.word 0x81982544  ! 1381: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0544, %hpstate
DS_65:
	.word 0x34800001  ! 1383: BG	bg,a	<label_0x1>
	illtrap
	.word 0x83b28308  ! 1382: ALLIGNADDRESS	alignaddr	%r10, %r8, %r1
	.word 0x3a800001  ! 1383: BCC	bcc,a	<label_0x1>
	.word 0xc2800aa0  ! 1384: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r1
	.word 0x8c52800f  ! 1385: UMUL_R	umul 	%r10, %r15, %r6
	.word 0xcc47e001  ! 1386: LDSW_I	ldsw	[%r31 + 0x0001], %r6
	.word 0x8e692001  ! 1387: UDIVX_I	udivx 	%r4, 0x0001, %r7
	mov 0x33, %r30
	.word 0x99d0001e  ! 1388: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x87802016  ! 1389: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x3e800001  ! 1390: BVC	bvc,a	<label_0x1>
	.word 0xcebfe001  ! 1391: STDA_I	stda	%r7, [%r31 + 0x0001] %asi
	.word 0x34800001  ! 1392: BG	bg,a	<label_0x1>
	.word 0x87802089  ! 1393: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x81982d16  ! 1394: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d16, %hpstate
	.word 0xce8008a0  ! 1395: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0xced004a0  ! 1396: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r7
	.word 0x81982d05  ! 1397: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d05, %hpstate
	.word 0x20700001  ! 1398: BPN	<illegal instruction>
	.word 0x8ac02001  ! 1399: ADDCcc_I	addccc 	%r0, 0x0001, %r5
	.word 0x8d90261e  ! 1400: WRPR_PSTATE_I	wrpr	%r0, 0x061e, %pstate
	.word 0x8dd02034  ! 1401: Tcc_I	tneg	icc_or_xcc, %r0 + 52
	.word 0x986bc000  ! 1402: UDIVX_R	udivx 	%r15, %r0, %r12
	.word 0x8d90265d  ! 1403: WRPR_PSTATE_I	wrpr	%r0, 0x065d, %pstate
	.word 0x8198278c  ! 1404: WRHPR_HPSTATE_I	wrhpr	%r0, 0x078c, %hpstate
	.word 0x89504000  ! 1405: RDPR_TNPC	rdpr	%tnpc, %r4
DS_66:
	.word 0x22800001  ! 1407: BE	be,a	<label_0x1>
	illtrap
	.word 0x91b30306  ! 1406: ALLIGNADDRESS	alignaddr	%r12, %r6, %r8
	.word 0x2e700001  ! 1407: BPVS	<illegal instruction>
	.word 0x87802080  ! 1408: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x99508000  ! 1409: RDPR_TSTATE	rdpr	%tstate, %r12
	.word 0x8d902e5b  ! 1410: WRPR_PSTATE_I	wrpr	%r0, 0x0e5b, %pstate
	.word 0x9dd02035  ! 1411: Tcc_I	tpos	icc_or_xcc, %r0 + 53
	.word 0x9f480000  ! 1412: RDHPR_HPSTATE	rdhpr	%hpstate, %r15
	.word 0x38800001  ! 1413: BGU	bgu,a	<label_0x1>
	.word 0x8c6b8008  ! 1414: UDIVX_R	udivx 	%r14, %r8, %r6
	.word 0x9dd02034  ! 1415: Tcc_I	tpos	icc_or_xcc, %r0 + 52
DS_67:
	.word 0x20800001  ! 1417: BN	bn,a	<label_0x1>
	illtrap
	.word 0x81b2c307  ! 1416: ALLIGNADDRESS	alignaddr	%r11, %r7, %r0
	.word 0x8d902c59  ! 1417: WRPR_PSTATE_I	wrpr	%r0, 0x0c59, %pstate
	mov 0x32, %r30
	.word 0x85d0001e  ! 1418: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x8551c000  ! 1419: RDPR_TL	rdpr	%tl, %r2
	.word 0xc48fe020  ! 1420: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r2
	.word 0xc427e001  ! 1421: STW_I	stw	%r2, [%r31 + 0x0001]
	.word 0x99a00544  ! 1422: FSQRTd	fsqrt	
	.word 0x87802004  ! 1423: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xd88008a0  ! 1424: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	ta	T_CHANGE_PRIV	! macro
	.word 0x93a1c9a6  ! 1426: FDIVs	fdivs	%f7, %f6, %f9
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd2cfe020  ! 1428: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r9
	.word 0x8198268d  ! 1429: WRHPR_HPSTATE_I	wrhpr	%r0, 0x068d, %hpstate
	.word 0x9d514000  ! 1430: RDPR_TBA	rdpr	%tba, %r14
	.word 0x846ae001  ! 1431: UDIVX_I	udivx 	%r11, 0x0001, %r2
	.word 0x836a2001  ! 1432: SDIVX_I	sdivx	%r8, 0x0001, %r1
	.word 0xc297e010  ! 1433: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r1
	.word 0x8d902089  ! 1434: WRPR_PSTATE_I	wrpr	%r0, 0x0089, %pstate
	.word 0x819823dc  ! 1435: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03dc, %hpstate
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc28008a0  ! 1438: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0x92818004  ! 1439: ADDcc_R	addcc 	%r6, %r4, %r9
	.word 0x81a3cdca  ! 1440: FdMULq	fdmulq	
	.word 0xc137c00a  ! 1441: STQF_R	-	%f0, [%r10, %r31]
	.word 0x8d802004  ! 1442: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d902cc4  ! 1443: WRPR_PSTATE_I	wrpr	%r0, 0x0cc4, %pstate
	.word 0x81982b12  ! 1444: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b12, %hpstate
	.word 0x8fd02033  ! 1445: Tcc_I	tvs	icc_or_xcc, %r0 + 51
	.word 0xc0800a60  ! 1446: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r0
	.word 0x819824dd  ! 1447: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04dd, %hpstate
	.word 0x8d902880  ! 1448: WRPR_PSTATE_I	wrpr	%r0, 0x0880, %pstate
	.word 0x8c784004  ! 1449: SDIV_R	sdiv 	%r1, %r4, %r6
	.word 0x9f500000  ! 1450: RDPR_TPC	rdpr	%tpc, %r15
	ta	T_CHANGE_HPRIV	! macro
	.word 0x20700001  ! 1452: BPN	<illegal instruction>
	.word 0x8d69c00d  ! 1453: SDIVX_R	sdivx	%r7, %r13, %r6
	.word 0x87802004  ! 1454: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x9d51c000  ! 1455: RDPR_TL	rdpr	%tl, %r14
	.word 0x9c6bc009  ! 1456: UDIVX_R	udivx 	%r15, %r9, %r14
	.word 0x81982d9b  ! 1457: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d9b, %hpstate
	.word 0x8198289e  ! 1458: WRHPR_HPSTATE_I	wrhpr	%r0, 0x089e, %hpstate
	.word 0x8198254f  ! 1459: WRHPR_HPSTATE_I	wrhpr	%r0, 0x054f, %hpstate
	.word 0x9481a001  ! 1460: ADDcc_I	addcc 	%r6, 0x0001, %r10
	.word 0xd49004a0  ! 1461: LDUHA_R	lduha	[%r0, %r0] 0x25, %r10
	.word 0xd4ffc029  ! 1462: SWAPA_R	swapa	%r10, [%r31 + %r9] 0x01
	.word 0x9dd02030  ! 1463: Tcc_I	tpos	icc_or_xcc, %r0 + 48
	.word 0x81982211  ! 1464: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0211, %hpstate
	.word 0x87802016  ! 1465: WRASI_I	wr	%r0, 0x0016, %asi
	mov 0x33, %r30
	.word 0x93d0001e  ! 1466: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd48008a0  ! 1467: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81982540  ! 1469: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0540, %hpstate
	.word 0xd48804a0  ! 1470: LDUBA_R	lduba	[%r0, %r0] 0x25, %r10
	.word 0x8e682001  ! 1471: UDIVX_I	udivx 	%r0, 0x0001, %r7
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87802004  ! 1473: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x827be001  ! 1474: SDIV_I	sdiv 	%r15, 0x0001, %r1
	.word 0x8e52400d  ! 1475: UMUL_R	umul 	%r9, %r13, %r7
DS_68:
	.word 0x34800001  ! 1477: BG	bg,a	<label_0x1>
	illtrap
	.word 0x97b2430c  ! 1476: ALLIGNADDRESS	alignaddr	%r9, %r12, %r11
DS_69:
	.word 0x32800001  ! 1478: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x8db1c306  ! 1477: ALLIGNADDRESS	alignaddr	%r7, %r6, %r6
	.word 0xcc8fe000  ! 1478: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r6
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ec12001  ! 1480: ADDCcc_I	addccc 	%r4, 0x0001, %r15
	.word 0x8bd02032  ! 1481: Tcc_I	tcs	icc_or_xcc, %r0 + 50
	.word 0x8d902c19  ! 1482: WRPR_PSTATE_I	wrpr	%r0, 0x0c19, %pstate
	.word 0x87802010  ! 1483: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xded7e010  ! 1484: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r15
	.word 0xdebfe001  ! 1485: STDA_I	stda	%r15, [%r31 + 0x0001] %asi
	.word 0x83d02034  ! 1486: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x83a309e4  ! 1487: FDIVq	dis not found

	.word 0xc2800ba0  ! 1488: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r1
	.word 0x9f508000  ! 1489: RDPR_TSTATE	rdpr	%tstate, %r15
	.word 0xded004a0  ! 1490: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r15
	.word 0x83a04d20  ! 1491: FsMULd	fsmuld	%f1, %f0, %f32
	.word 0x9c51c00f  ! 1492: UMUL_R	umul 	%r7, %r15, %r14
	.word 0x83480000  ! 1493: RDHPR_HPSTATE	rdhpr	%hpstate, %r1
	.word 0x81982f12  ! 1494: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f12, %hpstate
	.word 0x81982188  ! 1495: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0188, %hpstate
	.word 0x81982288  ! 1496: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0288, %hpstate
	.word 0xc2c7e020  ! 1497: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r1
	.word 0x8d9028c3  ! 1498: WRPR_PSTATE_I	wrpr	%r0, 0x08c3, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xc297e030  ! 1500: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r1
	ta	T_CHANGE_PRIV	! macro
	.word 0x8fd02035  ! 1502: Tcc_I	tvs	icc_or_xcc, %r0 + 53
DS_70:
	.word 0x34800001  ! 1504: BG	bg,a	<label_0x1>
	illtrap
	.word 0x9fb38304  ! 1503: ALLIGNADDRESS	alignaddr	%r14, %r4, %r15
	.word 0x93a2c9c4  ! 1504: FDIVd	fdivd	%f42, %f4, %f40
	.word 0x8d902e4c  ! 1505: WRPR_PSTATE_I	wrpr	%r0, 0x0e4c, %pstate
DS_71:
	.word 0x20800001  ! 1507: BN	bn,a	<label_0x1>
	illtrap
	.word 0x8fb3c30e  ! 1506: ALLIGNADDRESS	alignaddr	%r15, %r14, %r7
	.word 0x81982b12  ! 1507: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b12, %hpstate
	mov 0x30, %r30
	.word 0x91d0001e  ! 1508: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	mov 0x34, %r30
	.word 0x93d0001e  ! 1509: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	mov 0x32, %r30
	.word 0x8fd0001e  ! 1511: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x89d02031  ! 1512: Tcc_I	tleu	icc_or_xcc, %r0 + 49
	.word 0x8198218f  ! 1513: WRHPR_HPSTATE_I	wrhpr	%r0, 0x018f, %hpstate
	.word 0xcfe7c02e  ! 1514: CASA_I	casa	[%r31] 0x 1, %r14, %r7
	.word 0x8d902e95  ! 1515: WRPR_PSTATE_I	wrpr	%r0, 0x0e95, %pstate
	.word 0x9a6b2001  ! 1516: UDIVX_I	udivx 	%r12, 0x0001, %r13
	.word 0x8e50c002  ! 1517: UMUL_R	umul 	%r3, %r2, %r7
	.word 0x95a009c7  ! 1518: FDIVd	fdivd	%f0, %f38, %f10
	.word 0x87d02033  ! 1519: Tcc_I	tl	icc_or_xcc, %r0 + 51
	.word 0x87802014  ! 1520: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xd4d00e40  ! 1521: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r10
	.word 0x98026001  ! 1522: ADD_I	add 	%r9, 0x0001, %r12
	mov 0x31, %r30
	.word 0x95d0001e  ! 1523: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x81982a84  ! 1524: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a84, %hpstate
	.word 0x8d802000  ! 1525: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87d02031  ! 1526: Tcc_I	tl	icc_or_xcc, %r0 + 49
	.word 0x95504000  ! 1527: RDPR_TNPC	rdpr	%tnpc, %r10
	.word 0x9751c000  ! 1528: RDPR_TL	rdpr	%tl, %r11
	.word 0x8881800e  ! 1529: ADDcc_R	addcc 	%r6, %r14, %r4
	.word 0x8198278f  ! 1530: WRHPR_HPSTATE_I	wrhpr	%r0, 0x078f, %hpstate
	.word 0xc81fc000  ! 1531: LDD_R	ldd	[%r31 + %r0], %r4
	.word 0x8d90261a  ! 1532: WRPR_PSTATE_I	wrpr	%r0, 0x061a, %pstate
	.word 0x38800001  ! 1533: BGU	bgu,a	<label_0x1>
	.word 0xc81fc000  ! 1534: LDD_R	ldd	[%r31 + %r0], %r4
	.word 0x8d902ac7  ! 1535: WRPR_PSTATE_I	wrpr	%r0, 0x0ac7, %pstate
	.word 0x9fa04d23  ! 1536: FsMULd	fsmuld	%f1, %f34, %f46
	.word 0x819822c4  ! 1537: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02c4, %hpstate
	.word 0x81982389  ! 1538: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0389, %hpstate
	.word 0xde800b80  ! 1539: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r15
	.word 0x8e79e001  ! 1540: SDIV_I	sdiv 	%r7, 0x0001, %r7
	.word 0x8d802000  ! 1541: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xcfe7c023  ! 1542: CASA_I	casa	[%r31] 0x 1, %r3, %r7
	mov 0x30, %r30
	.word 0x9dd0001e  ! 1543: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x81982802  ! 1544: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0802, %hpstate
	.word 0x87802016  ! 1545: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x9c4a6001  ! 1546: MULX_I	mulx 	%r9, 0x0001, %r14
	.word 0xdcd7e020  ! 1547: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r14
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0x20800001  ! 1551: BN	bn,a	<label_0x1>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xdd37e001  ! 1553: STQF_I	-	%f14, [0x0001, %r31]
	.word 0xdcc00e80  ! 1554: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r14
	.word 0xdc800bc0  ! 1555: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r14
	.word 0x9351c000  ! 1556: RDPR_TL	rdpr	%tl, %r9
	.word 0x81982d44  ! 1557: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d44, %hpstate
	.word 0x9cd1800e  ! 1558: UMULcc_R	umulcc 	%r6, %r14, %r14
	.word 0x906bc003  ! 1559: UDIVX_R	udivx 	%r15, %r3, %r8
	.word 0x81982cd8  ! 1560: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd8, %hpstate
DS_72:
	.word 0x20800001  ! 1562: BN	bn,a	<label_0x1>
	.word 0xc9334002  ! 1562: STQF_R	-	%f4, [%r2, %r13]
	.word 0x8d458000  ! 1561: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0x8d9022dc  ! 1562: WRPR_PSTATE_I	wrpr	%r0, 0x02dc, %pstate
	mov 0x33, %r30
	.word 0x97d0001e  ! 1563: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x8198278c  ! 1564: WRHPR_HPSTATE_I	wrhpr	%r0, 0x078c, %hpstate
	.word 0x87802089  ! 1565: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xcd27c002  ! 1566: STF_R	st	%f6, [%r2, %r31]
	mov 0x33, %r30
	.word 0x9bd0001e  ! 1567: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x9403a001  ! 1568: ADD_I	add 	%r14, 0x0001, %r10
	.word 0xd4c804a0  ! 1569: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	.word 0x846a400b  ! 1570: UDIVX_R	udivx 	%r9, %r11, %r2
	.word 0xc477c00b  ! 1571: STX_R	stx	%r2, [%r31 + %r11]
	ta	T_CHANGE_PRIV	! macro
	.word 0x8fd02032  ! 1573: Tcc_I	tvs	icc_or_xcc, %r0 + 50
	ta	T_CHANGE_HPRIV	! macro
	mov 0x32, %r30
	.word 0x95d0001e  ! 1575: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0x97514000  ! 1577: RDPR_TBA	rdpr	%tba, %r11
	mov 0x33, %r30
	.word 0x81d0001e  ! 1578: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	mov 0x34, %r30
	.word 0x8bd0001e  ! 1579: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x8d902c97  ! 1580: WRPR_PSTATE_I	wrpr	%r0, 0x0c97, %pstate
	.word 0x9e00a001  ! 1581: ADD_I	add 	%r2, 0x0001, %r15
	.word 0x8d902e41  ! 1582: WRPR_PSTATE_I	wrpr	%r0, 0x0e41, %pstate
	.word 0x8d902c14  ! 1583: WRPR_PSTATE_I	wrpr	%r0, 0x0c14, %pstate
	.word 0x93500000  ! 1584: RDPR_TPC	rdpr	%tpc, %r9
DS_73:
	.word 0x20800001  ! 1586: BN	bn,a	<label_0x1>
	.word 0xd3332001  ! 1586: STQF_I	-	%f9, [0x0001, %r12]
	.word 0x8b458000  ! 1585: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0x2c800001  ! 1586: BNEG	bneg,a	<label_0x1>
	.word 0x9351c000  ! 1587: RDPR_TL	rdpr	%tl, %r9
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8c4ba001  ! 1589: MULX_I	mulx 	%r14, 0x0001, %r6
	.word 0xccd804a0  ! 1590: LDXA_R	ldxa	[%r0, %r0] 0x25, %r6
	.word 0x819824d2  ! 1591: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04d2, %hpstate
	.word 0x98d0e001  ! 1592: UMULcc_I	umulcc 	%r3, 0x0001, %r12
	mov 0x35, %r30
	.word 0x93d0001e  ! 1593: Tcc_R	tne	icc_or_xcc, %r0 + %r30
DS_74:
	.word 0x34800001  ! 1595: BG	bg,a	<label_0x1>
	.word 0xc9318005  ! 1595: STQF_R	-	%f4, [%r5, %r6]
	.word 0x99458000  ! 1594: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x92d12001  ! 1595: UMULcc_I	umulcc 	%r4, 0x0001, %r9
	.word 0x8d802004  ! 1596: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd397e001  ! 1597: LDQFA_I	-	[%r31, 0x0001], %f9
	.word 0xd2ffc025  ! 1598: SWAPA_R	swapa	%r9, [%r31 + %r5] 0x01
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89d02032  ! 1600: Tcc_I	tleu	icc_or_xcc, %r0 + 50
DS_75:
	.word 0x20800001  ! 1602: BN	bn,a	<label_0x1>
	illtrap
	.word 0x8db38307  ! 1601: ALLIGNADDRESS	alignaddr	%r14, %r7, %r6
	.word 0xcd27c007  ! 1602: STF_R	st	%f6, [%r7, %r31]
	.word 0xcc8fe030  ! 1603: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r6
	.word 0x8d902a49  ! 1604: WRPR_PSTATE_I	wrpr	%r0, 0x0a49, %pstate
	.word 0x8ba389eb  ! 1605: FDIVq	dis not found

	.word 0x81982e19  ! 1606: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e19, %hpstate
	.word 0xca8fe020  ! 1607: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r5
DS_76:
	.word 0x34800001  ! 1609: BG	bg,a	<label_0x1>
	.word 0xc532e001  ! 1609: STQF_I	-	%f2, [0x0001, %r11]
	.word 0x8b458000  ! 1608: RD_SOFTINT_REG	rd	%softint, %r5
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xcbe7c02b  ! 1610: CASA_I	casa	[%r31] 0x 1, %r11, %r5
	.word 0xca4fc000  ! 1611: LDSB_R	ldsb	[%r31 + %r0], %r5
	.word 0x81982082  ! 1612: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0082, %hpstate
	.word 0x8d9022c1  ! 1613: WRPR_PSTATE_I	wrpr	%r0, 0x02c1, %pstate
	.word 0x8451400c  ! 1614: UMUL_R	umul 	%r5, %r12, %r2
	.word 0x8d802000  ! 1615: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc4800b00  ! 1616: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r2
	.word 0xc41fc000  ! 1617: LDD_R	ldd	[%r31 + %r0], %r2
	.word 0xc4ffc02c  ! 1618: SWAPA_R	swapa	%r2, [%r31 + %r12] 0x01
	.word 0x87802089  ! 1619: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x81a000c0  ! 1620: FNEGd	fnegd	%f0, %f0
	.word 0x81982313  ! 1621: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0313, %hpstate
	.word 0xc0c80e40  ! 1622: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r0
	.word 0xc127e001  ! 1623: STF_I	st	%f0, [0x0001, %r31]
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x83d02032  ! 1625: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x8450400f  ! 1626: UMUL_R	umul 	%r1, %r15, %r2
	.word 0x81a08d26  ! 1627: FsMULd	fsmuld	%f2, %f6, %f0
	.word 0xc0dfe020  ! 1628: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r0
	.word 0x8ba01a63  ! 1629: FqTOi	fqtoi	
	ta	T_CHANGE_HPRIV	! macro
DS_77:
	.word 0x22800001  ! 1632: BE	be,a	<label_0x1>
	.word 0xd1316001  ! 1632: STQF_I	-	%f8, [0x0001, %r5]
	.word 0x8b458000  ! 1631: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0xca9004a0  ! 1632: LDUHA_R	lduha	[%r0, %r0] 0x25, %r5
	.word 0x9ba01a68  ! 1633: FqTOi	fqtoi	
	.word 0x8d802000  ! 1634: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87a00564  ! 1635: FSQRTq	fsqrt	
	.word 0x8d9022dd  ! 1636: WRPR_PSTATE_I	wrpr	%r0, 0x02dd, %pstate
	.word 0xc62fe001  ! 1637: STB_I	stb	%r3, [%r31 + 0x0001]
	mov 0x33, %r30
	.word 0x91d0001e  ! 1638: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc68fe030  ! 1639: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r3
	.word 0x8d902256  ! 1640: WRPR_PSTATE_I	wrpr	%r0, 0x0256, %pstate
	.word 0x87802004  ! 1641: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x81982edd  ! 1642: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0edd, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87802004  ! 1644: WRASI_I	wr	%r0, 0x0004, %asi
DS_78:
	.word 0x34800001  ! 1646: BG	bg,a	<label_0x1>
	illtrap
	.word 0x8fb3430e  ! 1645: ALLIGNADDRESS	alignaddr	%r13, %r14, %r7
	.word 0x22700001  ! 1646: BPE	<illegal instruction>
	.word 0x87802088  ! 1647: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8d9020d9  ! 1648: WRPR_PSTATE_I	wrpr	%r0, 0x00d9, %pstate
DS_79:
	.word 0x22800001  ! 1650: BE	be,a	<label_0x1>
	.word 0xdd328006  ! 1650: STQF_R	-	%f14, [%r6, %r10]
	.word 0x87458000  ! 1649: RD_SOFTINT_REG	rd	%softint, %r3
	mov 0x31, %r30
	.word 0x95d0001e  ! 1650: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x28700001  ! 1651: BPLEU	<illegal instruction>
	ta	T_CHANGE_PRIV	! macro
	.word 0xc61fe001  ! 1653: LDD_I	ldd	[%r31 + 0x0001], %r3
	.word 0x87802088  ! 1654: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xc737e001  ! 1655: STQF_I	-	%f3, [0x0001, %r31]
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x38700001  ! 1657: BPGU	<illegal instruction>
	.word 0x87802080  ! 1658: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x26800001  ! 1659: BL	bl,a	<label_0x1>
	.word 0xc6d804a0  ! 1660: LDXA_R	ldxa	[%r0, %r0] 0x25, %r3
	.word 0x8da209ea  ! 1661: FDIVq	dis not found

	.word 0x9350c000  ! 1662: RDPR_TT	rdpr	%tt, %r9
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd21fc000  ! 1664: LDD_R	ldd	[%r31 + %r0], %r9
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81982816  ! 1666: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0816, %hpstate
	.word 0x8d802004  ! 1667: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x87802014  ! 1668: WRASI_I	wr	%r0, 0x0014, %asi
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d9026da  ! 1670: WRPR_PSTATE_I	wrpr	%r0, 0x06da, %pstate
	.word 0x9fa389cb  ! 1671: FDIVd	fdivd	%f14, %f42, %f46
	.word 0x8d9024db  ! 1672: WRPR_PSTATE_I	wrpr	%r0, 0x04db, %pstate
	.word 0x22800001  ! 1673: BE	be,a	<label_0x1>
	.word 0x8d902c55  ! 1674: WRPR_PSTATE_I	wrpr	%r0, 0x0c55, %pstate
	.word 0x86c0a001  ! 1675: ADDCcc_I	addccc 	%r2, 0x0001, %r3
	.word 0x22700001  ! 1676: BPE	<illegal instruction>
	.word 0xc697e000  ! 1677: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r3
	.word 0xc6d804a0  ! 1678: LDXA_R	ldxa	[%r0, %r0] 0x25, %r3
	.word 0x81982b1c  ! 1679: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b1c, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	mov 0x35, %r30
	.word 0x9dd0001e  ! 1681: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	mov 0x32, %r30
	.word 0x9fd0001e  ! 1682: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x8d902283  ! 1683: WRPR_PSTATE_I	wrpr	%r0, 0x0283, %pstate
	.word 0x856a6001  ! 1684: SDIVX_I	sdivx	%r9, 0x0001, %r2
DS_80:
	.word 0x20800001  ! 1686: BN	bn,a	<label_0x1>
	illtrap
	.word 0x9bb2830d  ! 1685: ALLIGNADDRESS	alignaddr	%r10, %r13, %r13
	.word 0x81982fcd  ! 1686: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fcd, %hpstate
	.word 0x24700001  ! 1687: BPLE	<illegal instruction>
DS_81:
	.word 0x34800001  ! 1689: BG	bg,a	<label_0x1>
	.word 0xcb304009  ! 1689: STQF_R	-	%f5, [%r9, %r1]
	.word 0x91458000  ! 1688: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x8b6ae001  ! 1689: SDIVX_I	sdivx	%r11, 0x0001, %r5
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d902806  ! 1691: WRPR_PSTATE_I	wrpr	%r0, 0x0806, %pstate
	.word 0xcac004a0  ! 1692: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r5
	.word 0xca9fc020  ! 1693: LDDA_R	ldda	[%r31, %r0] 0x01, %r5
	ta	T_CHANGE_PRIV	! macro
	.word 0x9d514000  ! 1695: RDPR_TBA	rdpr	%tba, %r14
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x82d0a001  ! 1697: UMULcc_I	umulcc 	%r2, 0x0001, %r1
	.word 0xc317c000  ! 1698: LDQF_R	-	[%r31, %r0], %f1
	.word 0x85a349c5  ! 1699: FDIVd	fdivd	%f44, %f36, %f2
	.word 0x8248400c  ! 1700: MULX_R	mulx 	%r1, %r12, %r1
	.word 0xc2d7e030  ! 1701: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r1
	.word 0x8d90260a  ! 1702: WRPR_PSTATE_I	wrpr	%r0, 0x060a, %pstate
	ta	T_CHANGE_NONPRIV	! macro
DS_82:
	.word 0x32800001  ! 1705: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x93b24300  ! 1704: ALLIGNADDRESS	alignaddr	%r9, %r0, %r9
	.word 0xd23fe001  ! 1705: STD_I	std	%r9, [%r31 + 0x0001]
DS_83:
	.word 0x22800001  ! 1707: BE	be,a	<label_0x1>
	.word 0xc131e001  ! 1707: STQF_I	-	%f0, [0x0001, %r7]
	.word 0x9b458000  ! 1706: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x8950c000  ! 1707: RDPR_TT	rdpr	%tt, %r4
	.word 0x8d902e5d  ! 1708: WRPR_PSTATE_I	wrpr	%r0, 0x0e5d, %pstate
	.word 0x8d902204  ! 1709: WRPR_PSTATE_I	wrpr	%r0, 0x0204, %pstate
	.word 0x81982251  ! 1710: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0251, %hpstate
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x9c80c000  ! 1713: ADDcc_R	addcc 	%r3, %r0, %r14
	.word 0x98c22001  ! 1714: ADDCcc_I	addccc 	%r8, 0x0001, %r12
	.word 0x8d902257  ! 1715: WRPR_PSTATE_I	wrpr	%r0, 0x0257, %pstate
	.word 0x8d902e91  ! 1716: WRPR_PSTATE_I	wrpr	%r0, 0x0e91, %pstate
	mov 0x35, %r30
	.word 0x95d0001e  ! 1717: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0xd88008a0  ! 1718: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x8d9028d9  ! 1719: WRPR_PSTATE_I	wrpr	%r0, 0x08d9, %pstate
	.word 0x38700001  ! 1720: BPGU	<illegal instruction>
	.word 0xd8d7e030  ! 1721: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r12
	.word 0x98d94008  ! 1722: SMULcc_R	smulcc 	%r5, %r8, %r12
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0x98c36001  ! 1725: ADDCcc_I	addccc 	%r13, 0x0001, %r12
	mov 0x31, %r30
	.word 0x9bd0001e  ! 1726: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 1727: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d802000  ! 1728: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8ba089ee  ! 1729: FDIVq	dis not found

DS_84:
	.word 0x34800001  ! 1731: BG	bg,a	<label_0x1>
	illtrap
	.word 0x93b08307  ! 1730: ALLIGNADDRESS	alignaddr	%r2, %r7, %r9
	.word 0x8d902a96  ! 1731: WRPR_PSTATE_I	wrpr	%r0, 0x0a96, %pstate
	.word 0xd3e7c027  ! 1732: CASA_I	casa	[%r31] 0x 1, %r7, %r9
	.word 0x8d802000  ! 1733: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9251c00d  ! 1734: UMUL_R	umul 	%r7, %r13, %r9
	.word 0x8d902c0f  ! 1735: WRPR_PSTATE_I	wrpr	%r0, 0x0c0f, %pstate
	.word 0x83508000  ! 1736: RDPR_TSTATE	rdpr	%tstate, %r1
	.word 0x8d902acc  ! 1737: WRPR_PSTATE_I	wrpr	%r0, 0x0acc, %pstate
	.word 0x8278c00a  ! 1738: SDIV_R	sdiv 	%r3, %r10, %r1
	.word 0x85a309c3  ! 1739: FDIVd	fdivd	%f12, %f34, %f2
	.word 0x87802004  ! 1740: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xc47fe001  ! 1741: SWAP_I	swap	%r2, [%r31 + 0x0001]
	.word 0x93d02031  ! 1742: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x83a109a3  ! 1743: FDIVs	fdivs	%f4, %f3, %f1
	.word 0x819828de  ! 1744: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08de, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	mov 0x33, %r30
	.word 0x8bd0001e  ! 1746: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	mov 0x31, %r30
	.word 0x89d0001e  ! 1747: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x9bd02032  ! 1748: Tcc_I	tcc	icc_or_xcc, %r0 + 50
	.word 0x8198274a  ! 1749: WRHPR_HPSTATE_I	wrhpr	%r0, 0x074a, %hpstate
	.word 0x8fa30dc4  ! 1750: FdMULq	fdmulq	
	.word 0x99d02031  ! 1751: Tcc_I	tgu	icc_or_xcc, %r0 + 49
	.word 0xce5fe001  ! 1752: LDX_I	ldx	[%r31 + 0x0001], %r7
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x9e7bc003  ! 1754: SDIV_R	sdiv 	%r15, %r3, %r15
	.word 0x8d902294  ! 1755: WRPR_PSTATE_I	wrpr	%r0, 0x0294, %pstate
	.word 0x89494000  ! 1756: RDHPR_HTBA	rdhpr	%htba, %r4
	mov 0x35, %r30
	.word 0x95d0001e  ! 1757: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x8d90260c  ! 1758: WRPR_PSTATE_I	wrpr	%r0, 0x060c, %pstate
	.word 0x9ad9000b  ! 1759: SMULcc_R	smulcc 	%r4, %r11, %r13
	.word 0xda9fc020  ! 1760: LDDA_R	ldda	[%r31, %r0] 0x01, %r13
	.word 0xda1fc000  ! 1761: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0x93d02032  ! 1762: Tcc_I	tne	icc_or_xcc, %r0 + 50
	mov 0x30, %r30
	.word 0x95d0001e  ! 1763: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0xda5fe001  ! 1764: LDX_I	ldx	[%r31 + 0x0001], %r13
	.word 0x8d902a93  ! 1765: WRPR_PSTATE_I	wrpr	%r0, 0x0a93, %pstate
	mov 0x31, %r30
	.word 0x85d0001e  ! 1766: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x38700001  ! 1768: BPGU	<illegal instruction>
	.word 0xda8008a0  ! 1769: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x9fa309a4  ! 1770: FDIVs	fdivs	%f12, %f4, %f15
	.word 0xdf37c004  ! 1771: STQF_R	-	%f15, [%r4, %r31]
	ta	T_CHANGE_PRIV	! macro
	.word 0x9fa0c9e3  ! 1773: FDIVq	dis not found

DS_85:
	.word 0x34800001  ! 1775: BG	bg,a	<label_0x1>
	illtrap
	.word 0x99b14305  ! 1774: ALLIGNADDRESS	alignaddr	%r5, %r5, %r12
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8198298b  ! 1776: WRHPR_HPSTATE_I	wrhpr	%r0, 0x098b, %hpstate
	.word 0x8d802004  ! 1777: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d902ece  ! 1778: WRPR_PSTATE_I	wrpr	%r0, 0x0ece, %pstate
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x81504000  ! 1781: RDPR_TNPC	rdpr	%tnpc, %r0
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81982896  ! 1783: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0896, %hpstate
	.word 0xc0c7e020  ! 1784: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r0
DS_86:
	.word 0x22800001  ! 1786: BE	be,a	<label_0x1>
	.word 0xc3338000  ! 1786: STQF_R	-	%f1, [%r0, %r14]
	.word 0x8b458000  ! 1785: RD_SOFTINT_REG	rd	%softint, %r5
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89d02033  ! 1787: Tcc_I	tleu	icc_or_xcc, %r0 + 51
	.word 0x81982ad4  ! 1788: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad4, %hpstate
	.word 0xcabfe001  ! 1789: STDA_I	stda	%r5, [%r31 + 0x0001] %asi
	.word 0x8d90209c  ! 1790: WRPR_PSTATE_I	wrpr	%r0, 0x009c, %pstate
	.word 0x819826ce  ! 1791: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06ce, %hpstate
	.word 0x36700001  ! 1792: BPGE	<illegal instruction>
	.word 0x8dd02030  ! 1793: Tcc_I	tneg	icc_or_xcc, %r0 + 48
	.word 0xca8fe020  ! 1794: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r5
	.word 0x81982bdd  ! 1795: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bdd, %hpstate
	.word 0xcac00e80  ! 1796: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r5
	.word 0x81982250  ! 1797: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0250, %hpstate
	.word 0x8da01a6b  ! 1798: FqTOi	fqtoi	
	.word 0x24700001  ! 1799: BPLE	<illegal instruction>
	.word 0x93480000  ! 1800: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
	.word 0x8d802000  ! 1801: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x97480000  ! 1802: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
	.word 0x9ba01a69  ! 1803: FqTOi	fqtoi	
	.word 0x9dd02032  ! 1804: Tcc_I	tpos	icc_or_xcc, %r0 + 50
	.word 0x81a000ca  ! 1805: FNEGd	fnegd	%f10, %f0
	.word 0x2a800001  ! 1806: BCS	bcs,a	<label_0x1>
	.word 0x8dd02033  ! 1807: Tcc_I	tneg	icc_or_xcc, %r0 + 51
	.word 0x81982a4f  ! 1808: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a4f, %hpstate
	.word 0xc027c00a  ! 1809: STW_R	stw	%r0, [%r31 + %r10]
	.word 0x22800001  ! 1810: BE	be,a	<label_0x1>
	.word 0x81982391  ! 1811: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0391, %hpstate
	.word 0x8d802000  ! 1812: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d902cd9  ! 1813: WRPR_PSTATE_I	wrpr	%r0, 0x0cd9, %pstate
	.word 0x8d90265b  ! 1814: WRPR_PSTATE_I	wrpr	%r0, 0x065b, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x8198258d  ! 1816: WRHPR_HPSTATE_I	wrhpr	%r0, 0x058d, %hpstate
	.word 0xc08fe010  ! 1817: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r0
	.word 0x9ba000ca  ! 1818: FNEGd	fnegd	%f10, %f44
	.word 0x8d902c0b  ! 1819: WRPR_PSTATE_I	wrpr	%r0, 0x0c0b, %pstate
	.word 0x9bd02034  ! 1820: Tcc_I	tcc	icc_or_xcc, %r0 + 52
	.word 0x8d90240d  ! 1821: WRPR_PSTATE_I	wrpr	%r0, 0x040d, %pstate
	.word 0xda8008a0  ! 1822: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8ad1800e  ! 1824: UMULcc_R	umulcc 	%r6, %r14, %r5
DS_87:
	.word 0x22800001  ! 1826: BE	be,a	<label_0x1>
	.word 0xcf33a001  ! 1826: STQF_I	-	%f7, [0x0001, %r14]
	.word 0x9d458000  ! 1825: RD_SOFTINT_REG	rd	%softint, %r14
	.word 0x8d802000  ! 1826: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87802004  ! 1827: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xdc8008a0  ! 1828: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r14
	.word 0x98d2400b  ! 1829: UMULcc_R	umulcc 	%r9, %r11, %r12
	mov 0x34, %r30
	.word 0x9fd0001e  ! 1830: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x8ba0056f  ! 1831: FSQRTq	fsqrt	
	ta	T_CHANGE_PRIV	! macro
	mov 0x35, %r30
	.word 0x9fd0001e  ! 1833: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x81982d40  ! 1834: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d40, %hpstate
	mov 0x31, %r30
	.word 0x8dd0001e  ! 1835: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x87802089  ! 1836: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x32700001  ! 1837: BPNE	<illegal instruction>
	.word 0x8d902e12  ! 1838: WRPR_PSTATE_I	wrpr	%r0, 0x0e12, %pstate
DS_88:
	.word 0x22800001  ! 1840: BE	be,a	<label_0x1>
	illtrap
	.word 0x91b0430c  ! 1839: ALLIGNADDRESS	alignaddr	%r1, %r12, %r8
	ta	T_CHANGE_HPRIV	! macro
	.word 0x36700001  ! 1841: BPGE	<illegal instruction>
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x81982186  ! 1844: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0186, %hpstate
	.word 0x22800001  ! 1845: BE	be,a	<label_0x1>
	.word 0x887b0006  ! 1846: SDIV_R	sdiv 	%r12, %r6, %r4
	.word 0x81982758  ! 1847: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0758, %hpstate
	.word 0x8198289a  ! 1848: WRHPR_HPSTATE_I	wrhpr	%r0, 0x089a, %hpstate
	.word 0x81982ec3  ! 1849: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ec3, %hpstate
	.word 0x99d02032  ! 1850: Tcc_I	tgu	icc_or_xcc, %r0 + 50
	.word 0x8da089e1  ! 1851: FDIVq	dis not found

	.word 0x8d902a45  ! 1852: WRPR_PSTATE_I	wrpr	%r0, 0x0a45, %pstate
	.word 0xcde7c021  ! 1853: CASA_I	casa	[%r31] 0x 1, %r1, %r6
	.word 0xccd804a0  ! 1854: LDXA_R	ldxa	[%r0, %r0] 0x25, %r6
	.word 0xccc004a0  ! 1855: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r6
	.word 0x8950c000  ! 1856: RDPR_TT	rdpr	%tt, %r4
	.word 0x87802089  ! 1857: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x819821d5  ! 1858: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01d5, %hpstate
	.word 0x8d902ecb  ! 1859: WRPR_PSTATE_I	wrpr	%r0, 0x0ecb, %pstate
	.word 0x3a700001  ! 1860: BPCC	<illegal instruction>
	.word 0x9cc3e001  ! 1861: ADDCcc_I	addccc 	%r15, 0x0001, %r14
	.word 0x9849800e  ! 1862: MULX_R	mulx 	%r6, %r14, %r12
DS_89:
	.word 0x32800001  ! 1864: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x87b1830f  ! 1863: ALLIGNADDRESS	alignaddr	%r6, %r15, %r3
	.word 0x99a000c9  ! 1864: FNEGd	fnegd	%f40, %f12
	.word 0x9fd02031  ! 1865: Tcc_I	tvc	icc_or_xcc, %r0 + 49
	.word 0x3c800001  ! 1866: BPOS	bpos,a	<label_0x1>
	.word 0x87480000  ! 1867: RDHPR_HPSTATE	rdhpr	%hpstate, %r3
	.word 0x97d02035  ! 1868: Tcc_I	tge	icc_or_xcc, %r0 + 53
	.word 0x8d902495  ! 1869: WRPR_PSTATE_I	wrpr	%r0, 0x0495, %pstate
	.word 0x87802004  ! 1870: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x98534008  ! 1871: UMUL_R	umul 	%r13, %r8, %r12
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9f51c000  ! 1873: RDPR_TL	rdpr	%tl, %r15
	.word 0x87802004  ! 1874: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x819820d3  ! 1875: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00d3, %hpstate
	.word 0x8d902a02  ! 1876: WRPR_PSTATE_I	wrpr	%r0, 0x0a02, %pstate
	.word 0xde07c000  ! 1877: LDUW_R	lduw	[%r31 + %r0], %r15
	.word 0x8d902443  ! 1878: WRPR_PSTATE_I	wrpr	%r0, 0x0443, %pstate
	.word 0x8b6a800c  ! 1879: SDIVX_R	sdivx	%r10, %r12, %r5
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xca8008a0  ! 1881: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0x9d500000  ! 1882: RDPR_TPC	rdpr	%tpc, %r14
	.word 0x8d9024db  ! 1883: WRPR_PSTATE_I	wrpr	%r0, 0x04db, %pstate
	.word 0xdcdfe010  ! 1884: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r14
	ta	T_CHANGE_NONHPRIV	! macro
DS_90:
	.word 0x22800001  ! 1887: BE	be,a	<label_0x1>
	.word 0xd132400b  ! 1887: STQF_R	-	%f8, [%r11, %r9]
	.word 0x89458000  ! 1886: RD_SOFTINT_REG	rd	%softint, %r4
	.word 0x8d9028cd  ! 1887: WRPR_PSTATE_I	wrpr	%r0, 0x08cd, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d802004  ! 1889: WRFPRS_I	wr	%r0, 0x0004, %fprs
	ta	T_CHANGE_PRIV	! macro
	.word 0x3a800001  ! 1891: BCC	bcc,a	<label_0x1>
	.word 0x98684006  ! 1892: UDIVX_R	udivx 	%r1, %r6, %r12
	.word 0xd81fe001  ! 1893: LDD_I	ldd	[%r31 + 0x0001], %r12
	.word 0xd8ffc026  ! 1894: SWAPA_R	swapa	%r12, [%r31 + %r6] 0x01
	.word 0x86db0000  ! 1895: SMULcc_R	smulcc 	%r12, %r0, %r3
	.word 0x8d902018  ! 1896: WRPR_PSTATE_I	wrpr	%r0, 0x0018, %pstate
	.word 0x93a149ef  ! 1897: FDIVq	dis not found

	ta	T_CHANGE_NONPRIV	! macro
	.word 0xd277e001  ! 1899: STX_I	stx	%r9, [%r31 + 0x0001]
	.word 0x8d902a8d  ! 1900: WRPR_PSTATE_I	wrpr	%r0, 0x0a8d, %pstate
	.word 0xd24fe001  ! 1901: LDSB_I	ldsb	[%r31 + 0x0001], %r9
DS_91:
	.word 0x20800001  ! 1903: BN	bn,a	<label_0x1>
	.word 0xc533a001  ! 1903: STQF_I	-	%f2, [0x0001, %r14]
	.word 0x97458000  ! 1902: RD_SOFTINT_REG	rd	%softint, %r11
	ta	T_CHANGE_PRIV	! macro
	.word 0x87802080  ! 1904: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x9a68000a  ! 1905: UDIVX_R	udivx 	%r0, %r10, %r13
	.word 0x8d902655  ! 1906: WRPR_PSTATE_I	wrpr	%r0, 0x0655, %pstate
	.word 0xda900e40  ! 1907: LDUHA_R	lduha	[%r0, %r0] 0x72, %r13
	.word 0x9e82400a  ! 1908: ADDcc_R	addcc 	%r9, %r10, %r15
	.word 0x9fa00569  ! 1909: FSQRTq	fsqrt	
	.word 0x8768a001  ! 1910: SDIVX_I	sdivx	%r2, 0x0001, %r3
	.word 0x81982a84  ! 1911: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a84, %hpstate
	.word 0x86524008  ! 1912: UMUL_R	umul 	%r9, %r8, %r3
	.word 0xc61fe001  ! 1913: LDD_I	ldd	[%r31 + 0x0001], %r3
	.word 0x8283a001  ! 1914: ADDcc_I	addcc 	%r14, 0x0001, %r1
	.word 0x819828d7  ! 1915: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d7, %hpstate
	.word 0xc28008a0  ! 1916: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0x81982ccd  ! 1917: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ccd, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8882c002  ! 1919: ADDcc_R	addcc 	%r11, %r2, %r4
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xc837e001  ! 1921: STH_I	sth	%r4, [%r31 + 0x0001]
	.word 0x81982a10  ! 1922: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a10, %hpstate
	.word 0xc8cfe000  ! 1923: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r4
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81982bdc  ! 1925: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bdc, %hpstate
	mov 0x34, %r30
	.word 0x8fd0001e  ! 1926: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0xc937c002  ! 1927: STQF_R	-	%f4, [%r2, %r31]
DS_92:
	.word 0x22800001  ! 1929: BE	be,a	<label_0x1>
	illtrap
	.word 0x99b1430e  ! 1928: ALLIGNADDRESS	alignaddr	%r5, %r14, %r12
	.word 0xd9e7c02e  ! 1929: CASA_I	casa	[%r31] 0x 1, %r14, %r12
	.word 0x9da000c4  ! 1930: FNEGd	fnegd	%f4, %f14
DS_93:
	.word 0x22800001  ! 1932: BE	be,a	<label_0x1>
	illtrap
	.word 0x9bb04300  ! 1931: ALLIGNADDRESS	alignaddr	%r1, %r0, %r13
	.word 0x9151c000  ! 1932: RDPR_TL	rdpr	%tl, %r8
	.word 0xd117c000  ! 1933: LDQF_R	-	[%r31, %r0], %f8
	.word 0xd0d7e000  ! 1934: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r8
	.word 0x8d902c58  ! 1935: WRPR_PSTATE_I	wrpr	%r0, 0x0c58, %pstate
	.word 0x81982018  ! 1936: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0018, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d902c0a  ! 1938: WRPR_PSTATE_I	wrpr	%r0, 0x0c0a, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d90240a  ! 1940: WRPR_PSTATE_I	wrpr	%r0, 0x040a, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x81982f10  ! 1942: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f10, %hpstate
	.word 0x97d02030  ! 1943: Tcc_I	tge	icc_or_xcc, %r0 + 48
	.word 0x8d902099  ! 1944: WRPR_PSTATE_I	wrpr	%r0, 0x0099, %pstate
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87802004  ! 1947: WRASI_I	wr	%r0, 0x0004, %asi
	mov 0x31, %r30
	.word 0x8dd0001e  ! 1948: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x8d902654  ! 1949: WRPR_PSTATE_I	wrpr	%r0, 0x0654, %pstate
	.word 0x81504000  ! 1950: RDPR_TNPC	rdpr	%tnpc, %r0
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d902c0d  ! 1952: WRPR_PSTATE_I	wrpr	%r0, 0x0c0d, %pstate
	.word 0xc0d804a0  ! 1953: LDXA_R	ldxa	[%r0, %r0] 0x25, %r0
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x94836001  ! 1955: ADDcc_I	addcc 	%r13, 0x0001, %r10
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xd4c7e000  ! 1957: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r10
	.word 0x9f6be001  ! 1958: SDIVX_I	sdivx	%r15, 0x0001, %r15
	.word 0x90480006  ! 1959: MULX_R	mulx 	%r0, %r6, %r8
	.word 0x8d902287  ! 1960: WRPR_PSTATE_I	wrpr	%r0, 0x0287, %pstate
DS_94:
	.word 0x20800001  ! 1962: BN	bn,a	<label_0x1>
	.word 0xcb322001  ! 1962: STQF_I	-	%f5, [0x0001, %r8]
	.word 0x97458000  ! 1961: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0x82d1a001  ! 1962: UMULcc_I	umulcc 	%r6, 0x0001, %r1
	.word 0xc2dfe010  ! 1963: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r1
	.word 0x30700001  ! 1964: BPA	<illegal instruction>
	.word 0x8d802000  ! 1965: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982b19  ! 1966: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b19, %hpstate
	.word 0x96520007  ! 1967: UMUL_R	umul 	%r8, %r7, %r11
	.word 0x8d902442  ! 1968: WRPR_PSTATE_I	wrpr	%r0, 0x0442, %pstate
	.word 0x8d902484  ! 1969: WRPR_PSTATE_I	wrpr	%r0, 0x0484, %pstate
DS_95:
	.word 0x32800001  ! 1971: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x97b0030e  ! 1970: ALLIGNADDRESS	alignaddr	%r0, %r14, %r11
	.word 0x87802004  ! 1971: WRASI_I	wr	%r0, 0x0004, %asi
	mov 0x35, %r30
	.word 0x89d0001e  ! 1972: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0xd6ffc02e  ! 1973: SWAPA_R	swapa	%r11, [%r31 + %r14] 0x01
	.word 0x826b2001  ! 1974: UDIVX_I	udivx 	%r12, 0x0001, %r1
	.word 0xc3e7c02e  ! 1975: CASA_I	casa	[%r31] 0x 1, %r14, %r1
	ta	T_CHANGE_PRIV	! macro
	.word 0x9ba01a60  ! 1977: FqTOi	fqtoi	
DS_96:
	.word 0x34800001  ! 1979: BG	bg,a	<label_0x1>
	illtrap
	.word 0x83b30303  ! 1978: ALLIGNADDRESS	alignaddr	%r12, %r3, %r1
	.word 0xc2d7e010  ! 1979: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r1
	.word 0xc2c7e020  ! 1980: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r1
	.word 0xc29fc020  ! 1981: LDDA_R	ldda	[%r31, %r0] 0x01, %r1
	ta	T_CHANGE_PRIV	! macro
	.word 0x87802016  ! 1983: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x9ba00541  ! 1984: FSQRTd	fsqrt	
	.word 0x9fd02035  ! 1985: Tcc_I	tvc	icc_or_xcc, %r0 + 53
DS_97:
	.word 0x20800001  ! 1987: BN	bn,a	<label_0x1>
	illtrap
	.word 0x8fb28305  ! 1986: ALLIGNADDRESS	alignaddr	%r10, %r5, %r7
	.word 0xcf27c005  ! 1987: STF_R	st	%f7, [%r5, %r31]
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8e826001  ! 1989: ADDcc_I	addcc 	%r9, 0x0001, %r7
	.word 0xcecfe020  ! 1990: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r7
	.word 0xce9fe001  ! 1991: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r7
	.word 0x8d802000  ! 1992: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d902292  ! 1993: WRPR_PSTATE_I	wrpr	%r0, 0x0292, %pstate
DS_98:
	.word 0x22800001  ! 1995: BE	be,a	<label_0x1>
	illtrap
	.word 0x9bb3c30f  ! 1994: ALLIGNADDRESS	alignaddr	%r15, %r15, %r13
	.word 0x8d802000  ! 1995: WRFPRS_I	wr	%r0, 0x0000, %fprs
	mov 0x30, %r30
	.word 0x85d0001e  ! 1996: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x947b400d  ! 1997: SDIV_R	sdiv 	%r13, %r13, %r10
	.word 0x8d902883  ! 1998: WRPR_PSTATE_I	wrpr	%r0, 0x0883, %pstate
	.word 0x89500000  ! 1999: RDPR_TPC	rdpr	%tpc, %r4
	.word 0x99508000  ! 2000: RDPR_TSTATE	rdpr	%tstate, %r12
	.word 0xd8d804a0  ! 2001: LDXA_R	ldxa	[%r0, %r0] 0x25, %r12
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xd84fc000  ! 2003: LDSB_R	ldsb	[%r31 + %r0], %r12
	.word 0x896bc00c  ! 2004: SDIVX_R	sdivx	%r15, %r12, %r4
	.word 0xc88008a0  ! 2005: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
	.word 0x81982a5d  ! 2006: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a5d, %hpstate
	.word 0xc927e001  ! 2007: STF_I	st	%f4, [0x0001, %r31]
	mov 0x33, %r30
	.word 0x8dd0001e  ! 2008: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0xc8dfe010  ! 2009: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r4
	.word 0x36700001  ! 2010: BPGE	<illegal instruction>
	.word 0x9e012001  ! 2011: ADD_I	add 	%r4, 0x0001, %r15
	.word 0x85480000  ! 2012: RDHPR_HPSTATE	rdhpr	%hpstate, %r2
	.word 0x8d9028cf  ! 2013: WRPR_PSTATE_I	wrpr	%r0, 0x08cf, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x83508000  ! 2015: RDPR_TSTATE	rdpr	%tstate, %r1
	.word 0x87802010  ! 2016: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x9ba00547  ! 2017: FSQRTd	fsqrt	
	.word 0x87802089  ! 2018: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x9551c000  ! 2019: RDPR_TL	rdpr	%tl, %r10
	.word 0xd49004a0  ! 2020: LDUHA_R	lduha	[%r0, %r0] 0x25, %r10
	ta	T_CHANGE_HPRIV	! macro
	.word 0x91a00544  ! 2022: FSQRTd	fsqrt	
	ta	T_CHANGE_PRIV	! macro
	.word 0x83d02031  ! 2024: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0x8d90221d  ! 2025: WRPR_PSTATE_I	wrpr	%r0, 0x021d, %pstate
	.word 0x8d902606  ! 2026: WRPR_PSTATE_I	wrpr	%r0, 0x0606, %pstate
	.word 0x91a3c9ea  ! 2027: FDIVq	dis not found

	.word 0x8d802000  ! 2028: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8fa1c9e8  ! 2029: FDIVq	dis not found

	.word 0x819828c1  ! 2030: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c1, %hpstate
	.word 0xce1fc000  ! 2031: LDD_R	ldd	[%r31 + %r0], %r7
	mov 0x34, %r30
	.word 0x81d0001e  ! 2032: Tcc_R	tn	icc_or_xcc, %r0 + %r30
DS_99:
	.word 0x34800001  ! 2034: BG	bg,a	<label_0x1>
	illtrap
	.word 0x8db0c30e  ! 2033: ALLIGNADDRESS	alignaddr	%r3, %r14, %r6
	mov 0x30, %r30
	.word 0x83d0001e  ! 2034: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x85d02034  ! 2035: Tcc_I	tle	icc_or_xcc, %r0 + 52
	.word 0xcc800b00  ! 2036: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r6
	.word 0x986ba001  ! 2037: UDIVX_I	udivx 	%r14, 0x0001, %r12
	.word 0xd8dfe000  ! 2038: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r12
	.word 0x8d902a01  ! 2039: WRPR_PSTATE_I	wrpr	%r0, 0x0a01, %pstate
	.word 0xd89fc020  ! 2040: LDDA_R	ldda	[%r31, %r0] 0x01, %r12
	.word 0xd8c004a0  ! 2041: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r12
	.word 0x83480000  ! 2042: RDHPR_HPSTATE	rdhpr	%hpstate, %r1
	.word 0xc2c00e80  ! 2043: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r1
	.word 0xc2c804a0  ! 2044: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r1
	.word 0xc28008a0  ! 2045: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	mov 0x31, %r30
	.word 0x8fd0001e  ! 2046: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x81982703  ! 2047: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0703, %hpstate
	ta	T_CHANGE_PRIV	! macro
DS_100:
	.word 0x22800001  ! 2050: BE	be,a	<label_0x1>
	illtrap
	.word 0x95b38306  ! 2049: ALLIGNADDRESS	alignaddr	%r14, %r6, %r10
	.word 0xd48008a0  ! 2050: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x8f508000  ! 2051: RDPR_TSTATE	rdpr	%tstate, %r7
	.word 0xce27c006  ! 2052: STW_R	stw	%r7, [%r31 + %r6]
	.word 0x9dd02033  ! 2053: Tcc_I	tpos	icc_or_xcc, %r0 + 51
	.word 0x9dd02032  ! 2054: Tcc_I	tpos	icc_or_xcc, %r0 + 50
DS_101:
	.word 0x22800001  ! 2056: BE	be,a	<label_0x1>
	.word 0xd1320000  ! 2056: STQF_R	-	%f8, [%r0, %r8]
	.word 0x9b458000  ! 2055: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x906b6001  ! 2056: UDIVX_I	udivx 	%r13, 0x0001, %r8
	.word 0xd05fe001  ! 2057: LDX_I	ldx	[%r31 + 0x0001], %r8
	.word 0x8d902c8b  ! 2058: WRPR_PSTATE_I	wrpr	%r0, 0x0c8b, %pstate
	.word 0xd09fc020  ! 2059: LDDA_R	ldda	[%r31, %r0] 0x01, %r8
	.word 0xd09004a0  ! 2060: LDUHA_R	lduha	[%r0, %r0] 0x25, %r8
	mov 0x35, %r30
	.word 0x93d0001e  ! 2061: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8fd02035  ! 2062: Tcc_I	tvs	icc_or_xcc, %r0 + 53
	.word 0x8d902a0e  ! 2063: WRPR_PSTATE_I	wrpr	%r0, 0x0a0e, %pstate
	.word 0x8d902ad5  ! 2064: WRPR_PSTATE_I	wrpr	%r0, 0x0ad5, %pstate
	.word 0x91d02030  ! 2065: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x83a08dc7  ! 2066: FdMULq	fdmulq	
	.word 0x986ae001  ! 2067: UDIVX_I	udivx 	%r11, 0x0001, %r12
	.word 0xd927c007  ! 2068: STF_R	st	%f12, [%r7, %r31]
	.word 0x819829da  ! 2069: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09da, %hpstate
DS_102:
	.word 0x22800001  ! 2071: BE	be,a	<label_0x1>
	.word 0xc532800e  ! 2071: STQF_R	-	%f2, [%r14, %r10]
	.word 0x9d458000  ! 2070: RD_SOFTINT_REG	rd	%softint, %r14
	mov 0x31, %r30
	.word 0x85d0001e  ! 2071: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0xdcd004a0  ! 2072: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r14
	.word 0x9fa00563  ! 2073: FSQRTq	fsqrt	
	.word 0x81982a91  ! 2074: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a91, %hpstate
	.word 0x22700001  ! 2075: BPE	<illegal instruction>
	.word 0xde9004a0  ! 2076: LDUHA_R	lduha	[%r0, %r0] 0x25, %r15
	.word 0x8d802004  ! 2077: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d9026da  ! 2078: WRPR_PSTATE_I	wrpr	%r0, 0x06da, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0xde9fe001  ! 2080: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r15
	.word 0x9849a001  ! 2081: MULX_I	mulx 	%r6, 0x0001, %r12
	.word 0xd89fc020  ! 2082: LDDA_R	ldda	[%r31, %r0] 0x01, %r12
	.word 0xd8800be0  ! 2083: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r12
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902a5b  ! 2085: WRPR_PSTATE_I	wrpr	%r0, 0x0a5b, %pstate
	.word 0x8d902c97  ! 2086: WRPR_PSTATE_I	wrpr	%r0, 0x0c97, %pstate
	.word 0xd8c80e40  ! 2087: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r12
DS_103:
	.word 0x34800001  ! 2089: BG	bg,a	<label_0x1>
	.word 0xc731e001  ! 2089: STQF_I	-	%f3, [0x0001, %r7]
	.word 0x95458000  ! 2088: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0xd4d7e020  ! 2089: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r10
	.word 0x92484005  ! 2090: MULX_R	mulx 	%r1, %r5, %r9
	.word 0x8d802004  ! 2091: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d9020db  ! 2092: WRPR_PSTATE_I	wrpr	%r0, 0x00db, %pstate
	.word 0x91d02035  ! 2093: Tcc_I	ta	icc_or_xcc, %r0 + 53
	mov 0x31, %r30
	.word 0x9bd0001e  ! 2094: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0xd327e001  ! 2095: STF_I	st	%f9, [0x0001, %r31]
	.word 0x38700001  ! 2096: BPGU	<illegal instruction>
	.word 0x9da3cd28  ! 2097: FsMULd	fsmuld	%f15, %f8, %f14
	.word 0x81982f1e  ! 2098: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f1e, %hpstate
	.word 0x87802089  ! 2099: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xdd27c008  ! 2100: STF_R	st	%f14, [%r8, %r31]
	.word 0x8d902894  ! 2101: WRPR_PSTATE_I	wrpr	%r0, 0x0894, %pstate
	.word 0x8569400d  ! 2102: SDIVX_R	sdivx	%r5, %r13, %r2
	.word 0x87d02035  ! 2103: Tcc_I	tl	icc_or_xcc, %r0 + 53
	.word 0x81982017  ! 2104: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0017, %hpstate
	.word 0x9dd02031  ! 2105: Tcc_I	tpos	icc_or_xcc, %r0 + 49
	.word 0x8d802004  ! 2106: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d9022d5  ! 2107: WRPR_PSTATE_I	wrpr	%r0, 0x02d5, %pstate
	.word 0x8d802000  ! 2108: WRFPRS_I	wr	%r0, 0x0000, %fprs
	mov 0x33, %r30
	.word 0x85d0001e  ! 2109: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0xc47fe001  ! 2110: SWAP_I	swap	%r2, [%r31 + 0x0001]
	.word 0x8d9020ca  ! 2111: WRPR_PSTATE_I	wrpr	%r0, 0x00ca, %pstate
	.word 0x81982312  ! 2112: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0312, %hpstate
	.word 0x8d9022da  ! 2113: WRPR_PSTATE_I	wrpr	%r0, 0x02da, %pstate
	.word 0x99508000  ! 2114: RDPR_TSTATE	rdpr	%tstate, %r12
	.word 0x8d90244f  ! 2115: WRPR_PSTATE_I	wrpr	%r0, 0x044f, %pstate
	.word 0xd937e001  ! 2116: STQF_I	-	%f12, [0x0001, %r31]
	.word 0x85d02033  ! 2117: Tcc_I	tle	icc_or_xcc, %r0 + 51
	.word 0xd80fe001  ! 2118: LDUB_I	ldub	[%r31 + 0x0001], %r12
	.word 0x8bd02035  ! 2119: Tcc_I	tcs	icc_or_xcc, %r0 + 53
	.word 0x9f494000  ! 2120: RDHPR_HTBA	rdhpr	%htba, %r15
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d902c5b  ! 2122: WRPR_PSTATE_I	wrpr	%r0, 0x0c5b, %pstate
DS_104:
	.word 0x22800001  ! 2124: BE	be,a	<label_0x1>
	illtrap
	.word 0x8db2430a  ! 2123: ALLIGNADDRESS	alignaddr	%r9, %r10, %r6
	.word 0x2e700001  ! 2124: BPVS	<illegal instruction>
	.word 0x867b000a  ! 2125: SDIV_R	sdiv 	%r12, %r10, %r3
	.word 0x91504000  ! 2126: RDPR_TNPC	rdpr	%tnpc, %r8
DS_105:
	.word 0x34800001  ! 2128: BG	bg,a	<label_0x1>
	.word 0xdb33e001  ! 2128: STQF_I	-	%f13, [0x0001, %r15]
	.word 0x93458000  ! 2127: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x8d802000  ! 2128: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982a1c  ! 2129: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a1c, %hpstate
	.word 0x87a349ac  ! 2130: FDIVs	fdivs	%f13, %f12, %f3
	.word 0x819829dc  ! 2131: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09dc, %hpstate
DS_106:
	.word 0x22800001  ! 2133: BE	be,a	<label_0x1>
	illtrap
	.word 0x99b0c30a  ! 2132: ALLIGNADDRESS	alignaddr	%r3, %r10, %r12
	.word 0x2a700001  ! 2133: BPCS	<illegal instruction>
DS_107:
	.word 0x32800001  ! 2135: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x87b2c301  ! 2134: ALLIGNADDRESS	alignaddr	%r11, %r1, %r3
	mov 0x31, %r30
	.word 0x8bd0001e  ! 2135: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x81982082  ! 2136: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0082, %hpstate
	.word 0x8d802000  ! 2137: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x2c800001  ! 2138: BNEG	bneg,a	<label_0x1>
	mov 0x31, %r30
	.word 0x8bd0001e  ! 2139: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x99d02030  ! 2140: Tcc_I	tgu	icc_or_xcc, %r0 + 48
	.word 0x93d02034  ! 2141: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x2e800001  ! 2142: BVS	bvs,a	<label_0x1>
	.word 0x81480000  ! 2143: RDHPR_HPSTATE	rdhpr	%hpstate, %r0
	.word 0x8d902c0e  ! 2144: WRPR_PSTATE_I	wrpr	%r0, 0x0c0e, %pstate
DS_108:
	.word 0x20800001  ! 2146: BN	bn,a	<label_0x1>
	illtrap
	.word 0x8db14309  ! 2145: ALLIGNADDRESS	alignaddr	%r5, %r9, %r6
	.word 0x8d902a5d  ! 2146: WRPR_PSTATE_I	wrpr	%r0, 0x0a5d, %pstate
	.word 0x8d9026c7  ! 2147: WRPR_PSTATE_I	wrpr	%r0, 0x06c7, %pstate
	.word 0x8fa389e8  ! 2148: FDIVq	dis not found

	.word 0x81982c01  ! 2149: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c01, %hpstate
	.word 0x8d902e4d  ! 2150: WRPR_PSTATE_I	wrpr	%r0, 0x0e4d, %pstate
	.word 0xce4fe001  ! 2151: LDSB_I	ldsb	[%r31 + 0x0001], %r7
	.word 0xce8008a0  ! 2152: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	mov 0x35, %r30
	.word 0x8fd0001e  ! 2153: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0xcec804a0  ! 2154: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r7
	.word 0xcf27e001  ! 2155: STF_I	st	%f7, [0x0001, %r31]
DS_109:
	.word 0x22800001  ! 2157: BE	be,a	<label_0x1>
	.word 0xd131c00c  ! 2157: STQF_R	-	%f8, [%r12, %r7]
	.word 0x85458000  ! 2156: RD_SOFTINT_REG	rd	%softint, %r2
	.word 0x924be001  ! 2157: MULX_I	mulx 	%r15, 0x0001, %r9
	.word 0x81a109a9  ! 2158: FDIVs	fdivs	%f4, %f9, %f0
	.word 0x8d90249b  ! 2159: WRPR_PSTATE_I	wrpr	%r0, 0x049b, %pstate
	.word 0x9a78000d  ! 2160: SDIV_R	sdiv 	%r0, %r13, %r13
DS_110:
	.word 0x32800001  ! 2162: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x93b04302  ! 2161: ALLIGNADDRESS	alignaddr	%r1, %r2, %r9
	.word 0x819825de  ! 2162: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05de, %hpstate
	.word 0x8d802004  ! 2163: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x9da00565  ! 2164: FSQRTq	fsqrt	
	.word 0x8198259e  ! 2165: WRHPR_HPSTATE_I	wrhpr	%r0, 0x059e, %hpstate
	.word 0x87802004  ! 2166: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x96694001  ! 2167: UDIVX_R	udivx 	%r5, %r1, %r11
	.word 0xd6c00e80  ! 2168: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r11
	mov 0x30, %r30
	.word 0x8dd0001e  ! 2169: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0xd697e010  ! 2170: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r11
	.word 0x8198270f  ! 2171: WRHPR_HPSTATE_I	wrhpr	%r0, 0x070f, %hpstate
	.word 0x30700001  ! 2172: BPA	<illegal instruction>
	.word 0x8d9026ce  ! 2173: WRPR_PSTATE_I	wrpr	%r0, 0x06ce, %pstate
	.word 0x8d802004  ! 2174: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x906a2001  ! 2175: UDIVX_I	udivx 	%r8, 0x0001, %r8
	.word 0x8d90220c  ! 2176: WRPR_PSTATE_I	wrpr	%r0, 0x020c, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9a81800a  ! 2178: ADDcc_R	addcc 	%r6, %r10, %r13
	.word 0x81480000  ! 2179: RDHPR_HPSTATE	rdhpr	%hpstate, %r0
	.word 0x8d902c5b  ! 2180: WRPR_PSTATE_I	wrpr	%r0, 0x0c5b, %pstate
	.word 0x9c694001  ! 2181: UDIVX_R	udivx 	%r5, %r1, %r14
	mov 0x32, %r30
	.word 0x8bd0001e  ! 2182: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x9fa109e1  ! 2183: FDIVq	dis not found

	.word 0x8d902e05  ! 2184: WRPR_PSTATE_I	wrpr	%r0, 0x0e05, %pstate
	.word 0x2e700001  ! 2185: BPVS	<illegal instruction>
	.word 0x87802004  ! 2186: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xde9fe001  ! 2187: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r15
	.word 0x81982654  ! 2188: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0654, %hpstate
	.word 0xdec80e40  ! 2189: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r15
	.word 0x8d902a4d  ! 2190: WRPR_PSTATE_I	wrpr	%r0, 0x0a4d, %pstate
	.word 0x97d02034  ! 2191: Tcc_I	tge	icc_or_xcc, %r0 + 52
	.word 0x24700001  ! 2192: BPLE	<illegal instruction>
	.word 0x9150c000  ! 2193: RDPR_TT	rdpr	%tt, %r8
	.word 0x9e7ba001  ! 2194: SDIV_I	sdiv 	%r14, 0x0001, %r15
DS_111:
	.word 0x34800001  ! 2196: BG	bg,a	<label_0x1>
	.word 0xcf31800d  ! 2196: STQF_R	-	%f7, [%r13, %r6]
	.word 0x8f458000  ! 2195: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0x8d688001  ! 2196: SDIVX_R	sdivx	%r2, %r1, %r6
	.word 0x81982306  ! 2197: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0306, %hpstate
	.word 0x2e700001  ! 2198: BPVS	<illegal instruction>
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8fa349ee  ! 2201: FDIVq	dis not found

	.word 0x8d802000  ! 2202: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x95d02034  ! 2203: Tcc_I	tg	icc_or_xcc, %r0 + 52
	.word 0x8c69c004  ! 2204: UDIVX_R	udivx 	%r7, %r4, %r6
	.word 0xcc800ba0  ! 2205: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r6
	.word 0x8ba049ef  ! 2206: FDIVq	dis not found

	.word 0x8d90224c  ! 2207: WRPR_PSTATE_I	wrpr	%r0, 0x024c, %pstate
	.word 0xca9004a0  ! 2208: LDUHA_R	lduha	[%r0, %r0] 0x25, %r5
	.word 0x87d02030  ! 2209: Tcc_I	tl	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81982614  ! 2211: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0614, %hpstate
	.word 0x9fa000ce  ! 2212: FNEGd	fnegd	%f14, %f46
	.word 0x8c6ba001  ! 2213: UDIVX_I	udivx 	%r14, 0x0001, %r6
	.word 0x8d902259  ! 2214: WRPR_PSTATE_I	wrpr	%r0, 0x0259, %pstate
	.word 0x2e700001  ! 2215: BPVS	<illegal instruction>
	.word 0xcc9fe001  ! 2216: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r6
	.word 0x8fa00543  ! 2217: FSQRTd	fsqrt	
DS_112:
	.word 0x20800001  ! 2219: BN	bn,a	<label_0x1>
	illtrap
	.word 0x91b1c301  ! 2218: ALLIGNADDRESS	alignaddr	%r7, %r1, %r8
	.word 0x9a82e001  ! 2219: ADDcc_I	addcc 	%r11, 0x0001, %r13
	.word 0xdac804a0  ! 2220: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r13
	ta	T_CHANGE_PRIV	! macro
	.word 0x81982057  ! 2222: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0057, %hpstate
	ta	T_CHANGE_PRIV	! macro
	mov 0x33, %r30
	.word 0x95d0001e  ! 2224: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0xdb3fe001  ! 2225: STDF_I	std	%f13, [0x0001, %r31]
	.word 0x81982583  ! 2226: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0583, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81d02031  ! 2228: Tcc_I	tn	icc_or_xcc, %r0 + 49
	.word 0xda8008a0  ! 2229: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0xda8fe020  ! 2230: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r13
DS_113:
	.word 0x22800001  ! 2232: BE	be,a	<label_0x1>
	.word 0xd531e001  ! 2232: STQF_I	-	%f10, [0x0001, %r7]
	.word 0x8f458000  ! 2231: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0x8fa0cd2a  ! 2232: FsMULd	fsmuld	%f3, %f10, %f38
	.word 0x9e682001  ! 2233: UDIVX_I	udivx 	%r0, 0x0001, %r15
	.word 0x83508000  ! 2234: RDPR_TSTATE	rdpr	%tstate, %r1
	.word 0x8fd02035  ! 2235: Tcc_I	tvs	icc_or_xcc, %r0 + 53
	.word 0xc28008a0  ! 2236: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0x8d902647  ! 2237: WRPR_PSTATE_I	wrpr	%r0, 0x0647, %pstate
	.word 0x83d02033  ! 2238: Tcc_I	te	icc_or_xcc, %r0 + 51
DS_114:
	.word 0x20800001  ! 2240: BN	bn,a	<label_0x1>
	illtrap
	.word 0x95b08308  ! 2239: ALLIGNADDRESS	alignaddr	%r2, %r8, %r10
	.word 0xd41fe001  ! 2240: LDD_I	ldd	[%r31 + 0x0001], %r10
	.word 0x8fd02031  ! 2241: Tcc_I	tvs	icc_or_xcc, %r0 + 49
	mov 0x32, %r30
	.word 0x85d0001e  ! 2242: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x3a700001  ! 2243: BPCC	<illegal instruction>
	.word 0x8d9026de  ! 2244: WRPR_PSTATE_I	wrpr	%r0, 0x06de, %pstate
	.word 0x8d90244b  ! 2245: WRPR_PSTATE_I	wrpr	%r0, 0x044b, %pstate
	.word 0x8d90205e  ! 2246: WRPR_PSTATE_I	wrpr	%r0, 0x005e, %pstate
	.word 0x20700001  ! 2247: BPN	<illegal instruction>
	mov 0x30, %r30
	.word 0x81d0001e  ! 2248: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x8fd02034  ! 2249: Tcc_I	tvs	icc_or_xcc, %r0 + 52
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8da00561  ! 2251: FSQRTq	fsqrt	
	.word 0x3e700001  ! 2252: BPVC	<illegal instruction>
	.word 0x87802016  ! 2253: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xcc5fc000  ! 2254: LDX_R	ldx	[%r31 + %r0], %r6
	.word 0xcc8008a0  ! 2255: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xccd7e030  ! 2257: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r6
	.word 0x8679000a  ! 2258: SDIV_R	sdiv 	%r4, %r10, %r3
	.word 0xc67fe001  ! 2259: SWAP_I	swap	%r3, [%r31 + 0x0001]
	.word 0x8bd02034  ! 2260: Tcc_I	tcs	icc_or_xcc, %r0 + 52
	.word 0x8d902c5e  ! 2261: WRPR_PSTATE_I	wrpr	%r0, 0x0c5e, %pstate
	mov 0x30, %r30
	.word 0x83d0001e  ! 2262: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xc6d7e000  ! 2263: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r3
	.word 0xc617e001  ! 2264: LDUH_I	lduh	[%r31 + 0x0001], %r3
	.word 0xc7e7c02a  ! 2265: CASA_I	casa	[%r31] 0x 1, %r10, %r3
	.word 0x81982fdc  ! 2266: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fdc, %hpstate
	.word 0xc6800c20  ! 2267: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r3
	.word 0x819824c6  ! 2268: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04c6, %hpstate
	.word 0x8d802000  ! 2269: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc64fe001  ! 2270: LDSB_I	ldsb	[%r31 + 0x0001], %r3
	.word 0xc68008a0  ! 2271: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x8803e001  ! 2272: ADD_I	add 	%r15, 0x0001, %r4
	.word 0x8d902409  ! 2273: WRPR_PSTATE_I	wrpr	%r0, 0x0409, %pstate
	.word 0x8d902e9e  ! 2274: WRPR_PSTATE_I	wrpr	%r0, 0x0e9e, %pstate
	.word 0x8da2c9ec  ! 2275: FDIVq	dis not found

	.word 0xcc880e40  ! 2276: LDUBA_R	lduba	[%r0, %r0] 0x72, %r6
	.word 0x8c684005  ! 2277: UDIVX_R	udivx 	%r1, %r5, %r6
	.word 0x8d802004  ! 2278: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xccffc025  ! 2279: SWAPA_R	swapa	%r6, [%r31 + %r5] 0x01
	.word 0xcc8008a0  ! 2280: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x8d90205c  ! 2281: WRPR_PSTATE_I	wrpr	%r0, 0x005c, %pstate
	.word 0x83d02032  ! 2282: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x87a049ae  ! 2283: FDIVs	fdivs	%f1, %f14, %f3
	.word 0x8d802000  ! 2284: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d9026cc  ! 2285: WRPR_PSTATE_I	wrpr	%r0, 0x06cc, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc6c804a0  ! 2287: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r3
	.word 0x8198280d  ! 2288: WRHPR_HPSTATE_I	wrhpr	%r0, 0x080d, %hpstate
	.word 0xc737c00e  ! 2289: STQF_R	-	%f3, [%r14, %r31]
	.word 0x95a10dc6  ! 2290: FdMULq	fdmulq	
	.word 0x81982495  ! 2291: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0495, %hpstate
	.word 0x98d02001  ! 2292: UMULcc_I	umulcc 	%r0, 0x0001, %r12
	.word 0x97508000  ! 2293: RDPR_TSTATE	rdpr	%tstate, %r11
	.word 0x87d02033  ! 2294: Tcc_I	tl	icc_or_xcc, %r0 + 51
	mov 0x33, %r30
	.word 0x91d0001e  ! 2295: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8051c004  ! 2296: UMUL_R	umul 	%r7, %r4, %r0
	.word 0xc08008a0  ! 2297: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	mov 0x32, %r30
	.word 0x9dd0001e  ! 2298: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x8d9028d5  ! 2299: WRPR_PSTATE_I	wrpr	%r0, 0x08d5, %pstate
	.word 0x8d902c4f  ! 2300: WRPR_PSTATE_I	wrpr	%r0, 0x0c4f, %pstate
	.word 0x8d802000  ! 2301: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d90269b  ! 2302: WRPR_PSTATE_I	wrpr	%r0, 0x069b, %pstate
	.word 0xc0d00e80  ! 2303: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r0
	.word 0x98d9c006  ! 2304: SMULcc_R	smulcc 	%r7, %r6, %r12
	.word 0x81982d99  ! 2305: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d99, %hpstate
DS_115:
	.word 0x20800001  ! 2307: BN	bn,a	<label_0x1>
	.word 0xdd312001  ! 2307: STQF_I	-	%f14, [0x0001, %r4]
	.word 0x91458000  ! 2306: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x8b504000  ! 2307: RDPR_TNPC	rdpr	%tnpc, %r5
	.word 0x2c800001  ! 2308: BNEG	bneg,a	<label_0x1>
	mov 0x35, %r30
	.word 0x83d0001e  ! 2309: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xcad7e030  ! 2310: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r5
	.word 0xca8804a0  ! 2311: LDUBA_R	lduba	[%r0, %r0] 0x25, %r5
	.word 0x87802089  ! 2312: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xcad7e030  ! 2313: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r5
	.word 0x8d802000  ! 2314: WRFPRS_I	wr	%r0, 0x0000, %fprs
	mov 0x33, %r30
	.word 0x87d0001e  ! 2315: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xcaffc026  ! 2317: SWAPA_R	swapa	%r5, [%r31 + %r6] 0x01
	.word 0x81982f5c  ! 2318: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f5c, %hpstate
	.word 0x81504000  ! 2319: RDPR_TNPC	rdpr	%tnpc, %r0
	ta	T_CHANGE_PRIV	! macro
	.word 0x987a2001  ! 2321: SDIV_I	sdiv 	%r8, 0x0001, %r12
	.word 0xd847c000  ! 2322: LDSW_R	ldsw	[%r31 + %r0], %r12
	.word 0x81a34dce  ! 2323: FdMULq	fdmulq	
	.word 0x81982c8f  ! 2324: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c8f, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d902291  ! 2326: WRPR_PSTATE_I	wrpr	%r0, 0x0291, %pstate
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_PRIV	! macro
DS_116:
	.word 0x32800001  ! 2330: BNE	bne,a	<label_0x1>
	.word 0xc931000b  ! 2330: STQF_R	-	%f4, [%r11, %r4]
	.word 0x9f458000  ! 2329: RD_SOFTINT_REG	rd	%softint, %r15
	.word 0xde1fe001  ! 2330: LDD_I	ldd	[%r31 + 0x0001], %r15
	.word 0xdec7e000  ! 2331: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r15
	.word 0xded804a0  ! 2332: LDXA_R	ldxa	[%r0, %r0] 0x25, %r15
	.word 0xded7e010  ! 2333: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r15
	.word 0x8c7a800a  ! 2334: SDIV_R	sdiv 	%r10, %r10, %r6
	.word 0x9da000c2  ! 2335: FNEGd	fnegd	%f2, %f14
	.word 0x92510007  ! 2336: UMUL_R	umul 	%r4, %r7, %r9
	.word 0xd28008a0  ! 2337: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
DS_117:
	.word 0x22800001  ! 2339: BE	be,a	<label_0x1>
	illtrap
	.word 0x9fb28301  ! 2338: ALLIGNADDRESS	alignaddr	%r10, %r1, %r15
	.word 0x81982602  ! 2339: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0602, %hpstate
	.word 0x81982f1c  ! 2340: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f1c, %hpstate
	mov 0x31, %r30
	.word 0x83d0001e  ! 2341: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x9600e001  ! 2342: ADD_I	add 	%r3, 0x0001, %r11
	.word 0xd68804a0  ! 2343: LDUBA_R	lduba	[%r0, %r0] 0x25, %r11
	.word 0x8fd02031  ! 2344: Tcc_I	tvs	icc_or_xcc, %r0 + 49
	.word 0x9e7aa001  ! 2345: SDIV_I	sdiv 	%r10, 0x0001, %r15
DS_118:
	.word 0x34800001  ! 2347: BG	bg,a	<label_0x1>
	.word 0xdb33c007  ! 2347: STQF_R	-	%f13, [%r7, %r15]
	.word 0x8b458000  ! 2346: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0x8d902295  ! 2347: WRPR_PSTATE_I	wrpr	%r0, 0x0295, %pstate
	.word 0x87802089  ! 2348: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8ec0a001  ! 2349: ADDCcc_I	addccc 	%r2, 0x0001, %r7
	.word 0xce8804a0  ! 2350: LDUBA_R	lduba	[%r0, %r0] 0x25, %r7
	.word 0x819822c7  ! 2351: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02c7, %hpstate
	.word 0xced7e000  ! 2352: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r7
	.word 0x87802089  ! 2353: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8e82e001  ! 2354: ADDcc_I	addcc 	%r11, 0x0001, %r7
	.word 0x85a04d2b  ! 2355: FsMULd	fsmuld	%f1, %f42, %f2
	.word 0x93d02030  ! 2356: Tcc_I	tne	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba3c9ea  ! 2358: FDIVq	dis not found

	.word 0x9ba20d2a  ! 2359: FsMULd	fsmuld	%f8, %f10, %f44
	.word 0x8d902ed7  ! 2360: WRPR_PSTATE_I	wrpr	%r0, 0x0ed7, %pstate
	.word 0x8b50c000  ! 2361: RDPR_TT	rdpr	%tt, %r5
	.word 0xca17c000  ! 2362: LDUH_R	lduh	[%r31 + %r0], %r5
	mov 0x30, %r30
	.word 0x95d0001e  ! 2363: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0xcadfe030  ! 2364: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r5
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xca1fc000  ! 2366: LDD_R	ldd	[%r31 + %r0], %r5
	ta	T_CHANGE_PRIV	! macro
	.word 0x9fa209ee  ! 2368: FDIVq	dis not found

	.word 0xdf37e001  ! 2369: STQF_I	-	%f15, [0x0001, %r31]
	.word 0x3c700001  ! 2370: BPPOS	<illegal instruction>
	.word 0x819821ce  ! 2371: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01ce, %hpstate
	.word 0xde1fe001  ! 2372: LDD_I	ldd	[%r31 + 0x0001], %r15
	.word 0x93a2cdc8  ! 2373: FdMULq	fdmulq	
	.word 0x22700001  ! 2374: BPE	<illegal instruction>
	.word 0xd28008a0  ! 2375: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
DS_119:
	.word 0x20800001  ! 2377: BN	bn,a	<label_0x1>
	.word 0xcd32a001  ! 2377: STQF_I	-	%f6, [0x0001, %r10]
	.word 0x91458000  ! 2376: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0xd0dfe000  ! 2377: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r8
	.word 0x8d902e8a  ! 2378: WRPR_PSTATE_I	wrpr	%r0, 0x0e8a, %pstate
	.word 0x94dac003  ! 2379: SMULcc_R	smulcc 	%r11, %r3, %r10
	.word 0xd49004a0  ! 2380: LDUHA_R	lduha	[%r0, %r0] 0x25, %r10
	.word 0x80796001  ! 2381: SDIV_I	sdiv 	%r5, 0x0001, %r0
	.word 0x8d902215  ! 2382: WRPR_PSTATE_I	wrpr	%r0, 0x0215, %pstate
	.word 0x87802089  ! 2383: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x93a009e5  ! 2384: FDIVq	dis not found

	.word 0x9cd2e001  ! 2385: UMULcc_I	umulcc 	%r11, 0x0001, %r14
	.word 0x8d9028c7  ! 2386: WRPR_PSTATE_I	wrpr	%r0, 0x08c7, %pstate
	.word 0xdcc804a0  ! 2387: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r14
	mov 0x31, %r30
	.word 0x93d0001e  ! 2388: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d9022d0  ! 2389: WRPR_PSTATE_I	wrpr	%r0, 0x02d0, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81982e12  ! 2391: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e12, %hpstate
	.word 0x9c6b6001  ! 2392: UDIVX_I	udivx 	%r13, 0x0001, %r14
	.word 0x94006001  ! 2393: ADD_I	add 	%r1, 0x0001, %r10
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d9022cd  ! 2395: WRPR_PSTATE_I	wrpr	%r0, 0x02cd, %pstate
	.word 0x8d90220d  ! 2396: WRPR_PSTATE_I	wrpr	%r0, 0x020d, %pstate
	.word 0x81982250  ! 2397: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0250, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
DS_120:
	.word 0x32800001  ! 2400: BNE	bne,a	<label_0x1>
	.word 0xd1332001  ! 2400: STQF_I	-	%f8, [0x0001, %r12]
	.word 0x91458000  ! 2399: RD_SOFTINT_REG	rd	%softint, %r8
	mov 0x33, %r30
	.word 0x87d0001e  ! 2400: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xd08008a0  ! 2402: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	ta	T_CHANGE_PRIV	! macro
	.word 0x93d02032  ! 2404: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x819829c3  ! 2405: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c3, %hpstate
	.word 0x89a3cdc0  ! 2406: FdMULq	fdmulq	
	.word 0x87480000  ! 2407: RDHPR_HPSTATE	rdhpr	%hpstate, %r3
	.word 0x8d90285c  ! 2408: WRPR_PSTATE_I	wrpr	%r0, 0x085c, %pstate
	.word 0x8d6aa001  ! 2409: SDIVX_I	sdivx	%r10, 0x0001, %r6
DS_121:
	.word 0x32800001  ! 2411: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x9fb30305  ! 2410: ALLIGNADDRESS	alignaddr	%r12, %r5, %r15
	.word 0x81982bca  ! 2411: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bca, %hpstate
	.word 0x89a0056c  ! 2412: FSQRTq	fsqrt	
	.word 0x81982fd3  ! 2413: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd3, %hpstate
	.word 0x8dd02034  ! 2414: Tcc_I	tneg	icc_or_xcc, %r0 + 52
	.word 0x9dd02032  ! 2415: Tcc_I	tpos	icc_or_xcc, %r0 + 50
	.word 0x8d802000  ! 2416: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc88008a0  ! 2417: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
	.word 0x81d02035  ! 2418: Tcc_I	tn	icc_or_xcc, %r0 + 53
	.word 0x81982c04  ! 2419: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c04, %hpstate
	.word 0x87802004  ! 2420: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x28700001  ! 2421: BPLEU	<illegal instruction>
	.word 0xc85fe001  ! 2422: LDX_I	ldx	[%r31 + 0x0001], %r4
	.word 0xc89fe001  ! 2423: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r4
	.word 0x99d02034  ! 2424: Tcc_I	tgu	icc_or_xcc, %r0 + 52
	.word 0x9ed28005  ! 2425: UMULcc_R	umulcc 	%r10, %r5, %r15
	.word 0x87a18d28  ! 2426: FsMULd	fsmuld	%f6, %f8, %f34
	.word 0x8d90225b  ! 2427: WRPR_PSTATE_I	wrpr	%r0, 0x025b, %pstate
	.word 0x8479a001  ! 2428: SDIV_I	sdiv 	%r6, 0x0001, %r2
	.word 0x81982d4a  ! 2429: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d4a, %hpstate
	.word 0x81982fc3  ! 2430: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fc3, %hpstate
	.word 0x94d9000c  ! 2431: SMULcc_R	smulcc 	%r4, %r12, %r10
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87802014  ! 2433: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x8d802004  ! 2434: WRFPRS_I	wr	%r0, 0x0004, %fprs
DS_122:
	.word 0x22800001  ! 2436: BE	be,a	<label_0x1>
	illtrap
	.word 0x9db0c30f  ! 2435: ALLIGNADDRESS	alignaddr	%r3, %r15, %r14
	.word 0xdc9fc020  ! 2436: LDDA_R	ldda	[%r31, %r0] 0x01, %r14
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d902e1a  ! 2438: WRPR_PSTATE_I	wrpr	%r0, 0x0e1a, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81982e5e  ! 2440: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e5e, %hpstate
	.word 0x8da0056c  ! 2441: FSQRTq	fsqrt	
	.word 0x82d24004  ! 2442: UMULcc_R	umulcc 	%r9, %r4, %r1
	.word 0x8d902001  ! 2443: WRPR_PSTATE_I	wrpr	%r0, 0x0001, %pstate
	.word 0xc2880e60  ! 2444: LDUBA_R	lduba	[%r0, %r0] 0x73, %r1
	mov 0x31, %r30
	.word 0x85d0001e  ! 2445: Tcc_R	tle	icc_or_xcc, %r0 + %r30
DS_123:
	.word 0x22800001  ! 2447: BE	be,a	<label_0x1>
	illtrap
	.word 0x97b1c30f  ! 2446: ALLIGNADDRESS	alignaddr	%r7, %r15, %r11
	.word 0x8d9028dc  ! 2447: WRPR_PSTATE_I	wrpr	%r0, 0x08dc, %pstate
	.word 0x82802001  ! 2448: ADDcc_I	addcc 	%r0, 0x0001, %r1
	.word 0x8e78800d  ! 2449: SDIV_R	sdiv 	%r2, %r13, %r7
	.word 0x87802004  ! 2450: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xced804a0  ! 2451: LDXA_R	ldxa	[%r0, %r0] 0x25, %r7
	.word 0xcebfe001  ! 2452: STDA_I	stda	%r7, [%r31 + 0x0001] %asi
	.word 0x8198244a  ! 2453: WRHPR_HPSTATE_I	wrhpr	%r0, 0x044a, %hpstate
	.word 0x8d902a09  ! 2454: WRPR_PSTATE_I	wrpr	%r0, 0x0a09, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81982213  ! 2456: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0213, %hpstate
	.word 0xce97e020  ! 2457: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r7
	.word 0xce8008a0  ! 2458: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x8d902ac8  ! 2459: WRPR_PSTATE_I	wrpr	%r0, 0x0ac8, %pstate
	.word 0x8d90245d  ! 2460: WRPR_PSTATE_I	wrpr	%r0, 0x045d, %pstate
	.word 0x84006001  ! 2461: ADD_I	add 	%r1, 0x0001, %r2
	.word 0x8d90284c  ! 2462: WRPR_PSTATE_I	wrpr	%r0, 0x084c, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xc4d004a0  ! 2464: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r2
	.word 0x91a2c9c6  ! 2465: FDIVd	fdivd	%f42, %f6, %f8
	.word 0xd09fe001  ! 2466: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r8
	.word 0x8d802000  ! 2467: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x97a189e3  ! 2468: FDIVq	dis not found

	.word 0x87802004  ! 2469: WRASI_I	wr	%r0, 0x0004, %asi
	mov 0x33, %r30
	.word 0x97d0001e  ! 2470: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd68008a0  ! 2472: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0xd68804a0  ! 2473: LDUBA_R	lduba	[%r0, %r0] 0x25, %r11
	.word 0x9e824008  ! 2474: ADDcc_R	addcc 	%r9, %r8, %r15
	.word 0x8d902a58  ! 2475: WRPR_PSTATE_I	wrpr	%r0, 0x0a58, %pstate
	.word 0x9c81e001  ! 2476: ADDcc_I	addcc 	%r7, 0x0001, %r14
	.word 0x87802004  ! 2477: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x9ba389c6  ! 2478: FDIVd	fdivd	%f14, %f6, %f44
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xda97e010  ! 2480: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r13
	.word 0xdacfe010  ! 2481: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r13
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x85d02030  ! 2483: Tcc_I	tle	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8e032001  ! 2485: ADD_I	add 	%r12, 0x0001, %r7
	.word 0x87802089  ! 2486: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8d902016  ! 2487: WRPR_PSTATE_I	wrpr	%r0, 0x0016, %pstate
	.word 0x9ba2c9e1  ! 2488: FDIVq	dis not found

	.word 0x81982b48  ! 2489: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b48, %hpstate
	.word 0x30700001  ! 2490: BPA	<illegal instruction>
	.word 0xdad804a0  ! 2491: LDXA_R	ldxa	[%r0, %r0] 0x25, %r13
	.word 0xda9004a0  ! 2492: LDUHA_R	lduha	[%r0, %r0] 0x25, %r13
	.word 0x8b51c000  ! 2493: RDPR_TL	rdpr	%tl, %r5
	.word 0x3c700001  ! 2494: BPPOS	<illegal instruction>
	.word 0x81982687  ! 2495: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0687, %hpstate
	.word 0x2c800001  ! 2496: BNEG	bneg,a	<label_0x1>
	.word 0xcb37c001  ! 2497: STQF_R	-	%f5, [%r1, %r31]
	.word 0x81982fd6  ! 2498: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd6, %hpstate
	.word 0x24800001  ! 2499: BLE	ble,a	<label_0x1>
	ta	T_CHANGE_PRIV	! macro
	.word 0x81982e07  ! 2501: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e07, %hpstate
	.word 0x8d902203  ! 2502: WRPR_PSTATE_I	wrpr	%r0, 0x0203, %pstate
	.word 0x8d9022ce  ! 2503: WRPR_PSTATE_I	wrpr	%r0, 0x02ce, %pstate
	.word 0x8d802004  ! 2504: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x81982118  ! 2505: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0118, %hpstate
	.word 0x81982e15  ! 2506: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e15, %hpstate
	mov 0x33, %r30
	.word 0x97d0001e  ! 2507: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x81982f43  ! 2509: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f43, %hpstate
	.word 0x8d90260b  ! 2510: WRPR_PSTATE_I	wrpr	%r0, 0x060b, %pstate
	.word 0x81982952  ! 2511: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0952, %hpstate
	.word 0x89a3c9a9  ! 2512: FDIVs	fdivs	%f15, %f9, %f4
	.word 0xc93fc009  ! 2513: STDF_R	std	%f4, [%r9, %r31]
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902282  ! 2515: WRPR_PSTATE_I	wrpr	%r0, 0x0282, %pstate
	.word 0x87802004  ! 2516: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xc8c7e020  ! 2517: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r4
	.word 0x8d902a12  ! 2518: WRPR_PSTATE_I	wrpr	%r0, 0x0a12, %pstate
	.word 0x8d902c82  ! 2519: WRPR_PSTATE_I	wrpr	%r0, 0x0c82, %pstate
	.word 0x85d02032  ! 2520: Tcc_I	tle	icc_or_xcc, %r0 + 50
	.word 0x8d802000  ! 2521: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc8cfe000  ! 2522: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r4
	.word 0x846b6001  ! 2523: UDIVX_I	udivx 	%r13, 0x0001, %r2
	mov 0x33, %r30
	.word 0x97d0001e  ! 2524: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	mov 0x33, %r30
	.word 0x85d0001e  ! 2525: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x847ba001  ! 2526: SDIV_I	sdiv 	%r14, 0x0001, %r2
	mov 0x32, %r30
	.word 0x85d0001e  ! 2527: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x8d90288c  ! 2528: WRPR_PSTATE_I	wrpr	%r0, 0x088c, %pstate
	.word 0xc4d7e030  ! 2529: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r2
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x82c02001  ! 2531: ADDCcc_I	addccc 	%r0, 0x0001, %r1
	.word 0xc29fe001  ! 2532: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r1
	.word 0x9282e001  ! 2533: ADDcc_I	addcc 	%r11, 0x0001, %r9
	mov 0x33, %r30
	.word 0x85d0001e  ! 2534: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0xd27fe001  ! 2535: SWAP_I	swap	%r9, [%r31 + 0x0001]
	.word 0xd2bfe001  ! 2536: STDA_I	stda	%r9, [%r31 + 0x0001] %asi
	.word 0x38800001  ! 2537: BGU	bgu,a	<label_0x1>
	.word 0x83d02033  ! 2538: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x81982e03  ! 2539: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e03, %hpstate
	.word 0x8fa349a1  ! 2540: FDIVs	fdivs	%f13, %f1, %f7
	.word 0x81982a8d  ! 2541: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a8d, %hpstate
	.word 0x81982d44  ! 2542: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d44, %hpstate
	.word 0xcecfe020  ! 2543: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r7
	.word 0x24800001  ! 2544: BLE	ble,a	<label_0x1>
	.word 0x819825d4  ! 2545: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05d4, %hpstate
	.word 0x8198229d  ! 2546: WRHPR_HPSTATE_I	wrhpr	%r0, 0x029d, %hpstate
	.word 0x867a6001  ! 2547: SDIV_I	sdiv 	%r9, 0x0001, %r3
	.word 0x99514000  ! 2548: RDPR_TBA	rdpr	%tba, %r12
	.word 0x9878a001  ! 2549: SDIV_I	sdiv 	%r2, 0x0001, %r12
	ta	T_CHANGE_NONPRIV	! macro
DS_124:
	.word 0x32800001  ! 2552: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x85b1c308  ! 2551: ALLIGNADDRESS	alignaddr	%r7, %r8, %r2
	ta	T_CHANGE_TO_TL0	! macro
DS_125:
	.word 0x22800001  ! 2554: BE	be,a	<label_0x1>
	illtrap
	.word 0x81b14306  ! 2553: ALLIGNADDRESS	alignaddr	%r5, %r6, %r0
	ta	T_CHANGE_PRIV	! macro
	.word 0x81982f0f  ! 2555: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f0f, %hpstate
	.word 0x8d90205b  ! 2556: WRPR_PSTATE_I	wrpr	%r0, 0x005b, %pstate
	mov 0x32, %r30
	.word 0x89d0001e  ! 2557: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x87802004  ! 2558: WRASI_I	wr	%r0, 0x0004, %asi
DS_126:
	.word 0x20800001  ! 2560: BN	bn,a	<label_0x1>
	.word 0xc9332001  ! 2560: STQF_I	-	%f4, [0x0001, %r12]
	.word 0x8d458000  ! 2559: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0x34800001  ! 2560: BG	bg,a	<label_0x1>
	.word 0x8ba3c9c3  ! 2561: FDIVd	fdivd	%f46, %f34, %f36
	.word 0xcbe7c023  ! 2562: CASA_I	casa	[%r31] 0x 1, %r3, %r5
	.word 0x8ac0a001  ! 2563: ADDCcc_I	addccc 	%r2, 0x0001, %r5
	.word 0xca7fe001  ! 2564: SWAP_I	swap	%r5, [%r31 + 0x0001]
	.word 0x9d480000  ! 2565: RDHPR_HPSTATE	rdhpr	%hpstate, %r14
	.word 0xdc27c003  ! 2566: STW_R	stw	%r14, [%r31 + %r3]
	.word 0xdc5fe001  ! 2567: LDX_I	ldx	[%r31 + 0x0001], %r14
	.word 0x87802004  ! 2568: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xdd3fe001  ! 2569: STDF_I	std	%f14, [0x0001, %r31]
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xdc27c003  ! 2571: STW_R	stw	%r14, [%r31 + %r3]
	.word 0x8198211d  ! 2572: WRHPR_HPSTATE_I	wrhpr	%r0, 0x011d, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0xdc8008a0  ! 2574: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r14
	mov 0x33, %r30
	.word 0x9bd0001e  ! 2575: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x8851c00b  ! 2576: UMUL_R	umul 	%r7, %r11, %r4
	.word 0x91a1c9a6  ! 2577: FDIVs	fdivs	%f7, %f6, %f8
	.word 0x81982155  ! 2578: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0155, %hpstate
	.word 0x9dd02032  ! 2579: Tcc_I	tpos	icc_or_xcc, %r0 + 50
	.word 0x8482800b  ! 2580: ADDcc_R	addcc 	%r10, %r11, %r2
DS_127:
	.word 0x32800001  ! 2582: BNE	bne,a	<label_0x1>
	.word 0xc5322001  ! 2582: STQF_I	-	%f2, [0x0001, %r8]
	.word 0x8d458000  ! 2581: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0x95d02032  ! 2582: Tcc_I	tg	icc_or_xcc, %r0 + 50
	.word 0x8d902a81  ! 2583: WRPR_PSTATE_I	wrpr	%r0, 0x0a81, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x26800001  ! 2585: BL	bl,a	<label_0x1>
	.word 0x8d902a15  ! 2586: WRPR_PSTATE_I	wrpr	%r0, 0x0a15, %pstate
	.word 0x8d902a9b  ! 2587: WRPR_PSTATE_I	wrpr	%r0, 0x0a9b, %pstate
	.word 0x80c1a001  ! 2588: ADDCcc_I	addccc 	%r6, 0x0001, %r0
	mov 0x32, %r30
	.word 0x93d0001e  ! 2589: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x93d02030  ! 2590: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0x8d902e4e  ! 2591: WRPR_PSTATE_I	wrpr	%r0, 0x0e4e, %pstate
DS_128:
	.word 0x34800001  ! 2593: BG	bg,a	<label_0x1>
	.word 0xcb300007  ! 2593: STQF_R	-	%f5, [%r7, %r0]
	.word 0x8f458000  ! 2592: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0x8d902855  ! 2593: WRPR_PSTATE_I	wrpr	%r0, 0x0855, %pstate
	.word 0x89d02035  ! 2594: Tcc_I	tleu	icc_or_xcc, %r0 + 53
	.word 0x8d902c08  ! 2595: WRPR_PSTATE_I	wrpr	%r0, 0x0c08, %pstate
	.word 0x81982dd7  ! 2596: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dd7, %hpstate
	.word 0x9e78c00e  ! 2597: SDIV_R	sdiv 	%r3, %r14, %r15
	.word 0x819827df  ! 2598: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07df, %hpstate
	.word 0x9f500000  ! 2599: RDPR_TPC	rdpr	%tpc, %r15
	.word 0x8198224c  ! 2600: WRHPR_HPSTATE_I	wrhpr	%r0, 0x024c, %hpstate
	.word 0x97d02033  ! 2601: Tcc_I	tge	icc_or_xcc, %r0 + 51
	.word 0x8e7b8003  ! 2602: SDIV_R	sdiv 	%r14, %r3, %r7
	.word 0x85d02033  ! 2603: Tcc_I	tle	icc_or_xcc, %r0 + 51
	.word 0x8d802004  ! 2604: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xcf37c003  ! 2605: STQF_R	-	%f7, [%r3, %r31]
	ta	T_CHANGE_NONPRIV	! macro
	mov 0x30, %r30
	.word 0x8fd0001e  ! 2607: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0xce800ae0  ! 2608: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r7
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d902296  ! 2610: WRPR_PSTATE_I	wrpr	%r0, 0x0296, %pstate
	.word 0x9da01a63  ! 2611: FqTOi	fqtoi	
	.word 0x8d902c92  ! 2612: WRPR_PSTATE_I	wrpr	%r0, 0x0c92, %pstate
	.word 0xdc900e40  ! 2613: LDUHA_R	lduha	[%r0, %r0] 0x72, %r14
	.word 0x81982517  ! 2614: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0517, %hpstate
	.word 0xdc57e001  ! 2615: LDSH_I	ldsh	[%r31 + 0x0001], %r14
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d9022d1  ! 2617: WRPR_PSTATE_I	wrpr	%r0, 0x02d1, %pstate
	.word 0xdc7fe001  ! 2618: SWAP_I	swap	%r14, [%r31 + 0x0001]
	.word 0xdd3fc003  ! 2619: STDF_R	std	%f14, [%r3, %r31]
	.word 0x8d902857  ! 2620: WRPR_PSTATE_I	wrpr	%r0, 0x0857, %pstate
	.word 0x87802016  ! 2621: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x32700001  ! 2622: BPNE	<illegal instruction>
DS_129:
	.word 0x20800001  ! 2624: BN	bn,a	<label_0x1>
	illtrap
	.word 0x83b08309  ! 2623: ALLIGNADDRESS	alignaddr	%r2, %r9, %r1
	.word 0x8c7b2001  ! 2624: SDIV_I	sdiv 	%r12, 0x0001, %r6
	ta	T_CHANGE_PRIV	! macro
	.word 0x22800001  ! 2626: BE	be,a	<label_0x1>
	.word 0x81982555  ! 2627: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0555, %hpstate
	.word 0x81982d5b  ! 2628: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d5b, %hpstate
	.word 0x81982611  ! 2629: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0611, %hpstate
	.word 0x8d902655  ! 2630: WRPR_PSTATE_I	wrpr	%r0, 0x0655, %pstate
	.word 0x87a289cf  ! 2631: FDIVd	fdivd	%f10, %f46, %f34
	.word 0x81982581  ! 2632: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0581, %hpstate
	.word 0x8d90241a  ! 2633: WRPR_PSTATE_I	wrpr	%r0, 0x041a, %pstate
	mov 0x31, %r30
	.word 0x9bd0001e  ! 2634: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x8d9026cb  ! 2635: WRPR_PSTATE_I	wrpr	%r0, 0x06cb, %pstate
	.word 0x9600a001  ! 2636: ADD_I	add 	%r2, 0x0001, %r11
	.word 0xd68008a0  ! 2637: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x8d902cd9  ! 2638: WRPR_PSTATE_I	wrpr	%r0, 0x0cd9, %pstate
	.word 0x9d51c000  ! 2639: RDPR_TL	rdpr	%tl, %r14
	.word 0x8fa0056f  ! 2640: FSQRTq	fsqrt	
	.word 0x8198248d  ! 2641: WRHPR_HPSTATE_I	wrhpr	%r0, 0x048d, %hpstate
	.word 0x9e53400d  ! 2642: UMUL_R	umul 	%r13, %r13, %r15
	.word 0xded004a0  ! 2643: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r15
	mov 0x31, %r30
	.word 0x91d0001e  ! 2644: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8198211d  ! 2645: WRHPR_HPSTATE_I	wrhpr	%r0, 0x011d, %hpstate
	.word 0x8198211f  ! 2646: WRHPR_HPSTATE_I	wrhpr	%r0, 0x011f, %hpstate
	.word 0x84d3a001  ! 2647: UMULcc_I	umulcc 	%r14, 0x0001, %r2
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x36800001  ! 2649: BGE	bge,a	<label_0x1>
DS_130:
	.word 0x34800001  ! 2651: BG	bg,a	<label_0x1>
	.word 0xcb304005  ! 2651: STQF_R	-	%f5, [%r5, %r1]
	.word 0x89458000  ! 2650: RD_SOFTINT_REG	rd	%softint, %r4
	.word 0x9ba00547  ! 2651: FSQRTd	fsqrt	
	.word 0x8fd02034  ! 2652: Tcc_I	tvs	icc_or_xcc, %r0 + 52
	.word 0x8cdb0007  ! 2653: SMULcc_R	smulcc 	%r12, %r7, %r6
	.word 0x99500000  ! 2654: RDPR_TPC	rdpr	%tpc, %r12
	.word 0x8880c00f  ! 2655: ADDcc_R	addcc 	%r3, %r15, %r4
	.word 0x81982e51  ! 2656: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e51, %hpstate
	.word 0x81982f1d  ! 2657: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f1d, %hpstate
	.word 0x81982600  ! 2658: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0600, %hpstate
	.word 0x20700001  ! 2659: BPN	<illegal instruction>
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x30800001  ! 2661: BA	ba,a	<label_0x1>
	.word 0xc93fc00f  ! 2662: STDF_R	std	%f4, [%r15, %r31]
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xc807e001  ! 2664: LDUW_I	lduw	[%r31 + 0x0001], %r4
	.word 0x93a3cd22  ! 2665: FsMULd	fsmuld	%f15, %f2, %f40
	.word 0xd28008a0  ! 2666: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	mov 0x30, %r30
	.word 0x81d0001e  ! 2667: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x20800001  ! 2668: BN	bn,a	<label_0x1>
	.word 0x87802088  ! 2669: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8d902452  ! 2670: WRPR_PSTATE_I	wrpr	%r0, 0x0452, %pstate
	.word 0x8d902897  ! 2671: WRPR_PSTATE_I	wrpr	%r0, 0x0897, %pstate
	.word 0xd2c804a0  ! 2672: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r9
	.word 0x91a00566  ! 2673: FSQRTq	fsqrt	
	.word 0xd097e010  ! 2674: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r8
	.word 0x90d02001  ! 2675: UMULcc_I	umulcc 	%r0, 0x0001, %r8
	.word 0x8d802000  ! 2676: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8469e001  ! 2677: UDIVX_I	udivx 	%r7, 0x0001, %r2
	.word 0xc4c7e030  ! 2678: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r2
	ta	T_CHANGE_PRIV	! macro
	.word 0xc49fc020  ! 2680: LDDA_R	ldda	[%r31, %r0] 0x01, %r2
	.word 0x87802010  ! 2681: WRASI_I	wr	%r0, 0x0010, %asi
	mov 0x30, %r30
	.word 0x91d0001e  ! 2682: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x85504000  ! 2683: RDPR_TNPC	rdpr	%tnpc, %r2
	.word 0x9f508000  ! 2684: RDPR_TSTATE	rdpr	%tstate, %r15
	.word 0x987ac001  ! 2685: SDIV_R	sdiv 	%r11, %r1, %r12
DS_131:
	.word 0x32800001  ! 2687: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x85b0c308  ! 2686: ALLIGNADDRESS	alignaddr	%r3, %r8, %r2
	.word 0x976a2001  ! 2687: SDIVX_I	sdivx	%r8, 0x0001, %r11
	.word 0x8d802000  ! 2688: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d50c000  ! 2689: RDPR_TT	rdpr	%tt, %r6
	.word 0x8d90260d  ! 2690: WRPR_PSTATE_I	wrpr	%r0, 0x060d, %pstate
	.word 0xcd37e001  ! 2691: STQF_I	-	%f6, [0x0001, %r31]
	.word 0x8d802000  ! 2692: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x89500000  ! 2693: RDPR_TPC	rdpr	%tpc, %r4
	.word 0x8d9020c3  ! 2694: WRPR_PSTATE_I	wrpr	%r0, 0x00c3, %pstate
DS_132:
	.word 0x20800001  ! 2696: BN	bn,a	<label_0x1>
	.word 0xcf32c007  ! 2696: STQF_R	-	%f7, [%r7, %r11]
	.word 0x89458000  ! 2695: RD_SOFTINT_REG	rd	%softint, %r4
	.word 0x9e7b0006  ! 2696: SDIV_R	sdiv 	%r12, %r6, %r15
	mov 0x34, %r30
	.word 0x83d0001e  ! 2697: Tcc_R	te	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x36700001  ! 2699: BPGE	<illegal instruction>
	.word 0x93d02033  ! 2700: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0xde800c00  ! 2701: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r15
	.word 0x9b500000  ! 2702: RDPR_TPC	rdpr	%tpc, %r13
	.word 0x97a000cf  ! 2703: FNEGd	fnegd	%f46, %f42
DS_133:
	.word 0x22800001  ! 2705: BE	be,a	<label_0x1>
	illtrap
	.word 0x8fb0430f  ! 2704: ALLIGNADDRESS	alignaddr	%r1, %r15, %r7
	.word 0xce9004a0  ! 2705: LDUHA_R	lduha	[%r0, %r0] 0x25, %r7
	.word 0x819822c1  ! 2706: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02c1, %hpstate
	.word 0x87802089  ! 2707: WRASI_I	wr	%r0, 0x0089, %asi
	ta	T_CHANGE_HPRIV	! macro
	mov 0x35, %r30
	.word 0x87d0001e  ! 2709: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x9c81c000  ! 2710: ADDcc_R	addcc 	%r7, %r0, %r14
	mov 0x33, %r30
	.word 0x97d0001e  ! 2711: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0xdc1fe001  ! 2712: LDD_I	ldd	[%r31 + 0x0001], %r14
	.word 0x8198240c  ! 2713: WRHPR_HPSTATE_I	wrhpr	%r0, 0x040c, %hpstate
	mov 0x34, %r30
	.word 0x87d0001e  ! 2714: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x3a700001  ! 2715: BPCC	<illegal instruction>
	.word 0x9fd02034  ! 2716: Tcc_I	tvc	icc_or_xcc, %r0 + 52
	.word 0xdc8008a0  ! 2717: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r14
	.word 0x93d02032  ! 2718: Tcc_I	tne	icc_or_xcc, %r0 + 50
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9fa00562  ! 2720: FSQRTq	fsqrt	
	.word 0xdeffc022  ! 2721: SWAPA_R	swapa	%r15, [%r31 + %r2] 0x01
DS_134:
	.word 0x32800001  ! 2723: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x8db24300  ! 2722: ALLIGNADDRESS	alignaddr	%r9, %r0, %r6
	.word 0x8d902002  ! 2723: WRPR_PSTATE_I	wrpr	%r0, 0x0002, %pstate
	ta	T_CHANGE_HPRIV	! macro
DS_135:
	.word 0x20800001  ! 2726: BN	bn,a	<label_0x1>
	.word 0xd9334004  ! 2726: STQF_R	-	%f12, [%r4, %r13]
	.word 0x85458000  ! 2725: RD_SOFTINT_REG	rd	%softint, %r2
	ta	T_CHANGE_NONPRIV	! macro
DS_136:
	.word 0x32800001  ! 2728: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x89b28300  ! 2727: ALLIGNADDRESS	alignaddr	%r10, %r0, %r4
	.word 0x85d02030  ! 2728: Tcc_I	tle	icc_or_xcc, %r0 + 48
DS_137:
	.word 0x20800001  ! 2730: BN	bn,a	<label_0x1>
	.word 0xdd308002  ! 2730: STQF_R	-	%f14, [%r2, %r2]
	.word 0x8f458000  ! 2729: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0x36800001  ! 2730: BGE	bge,a	<label_0x1>
	.word 0xced004a0  ! 2731: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r7
	ta	T_CHANGE_HPRIV	! macro
	.word 0xce800a80  ! 2733: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r7
	.word 0x8d902e94  ! 2734: WRPR_PSTATE_I	wrpr	%r0, 0x0e94, %pstate
	.word 0x81982c08  ! 2735: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c08, %hpstate
	.word 0x8fd02030  ! 2736: Tcc_I	tvs	icc_or_xcc, %r0 + 48
	.word 0xcecfe010  ! 2737: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r7
	.word 0xcebfe001  ! 2738: STDA_I	stda	%r7, [%r31 + 0x0001] %asi
	.word 0x93a209c6  ! 2739: FDIVd	fdivd	%f8, %f6, %f40
	.word 0x87802014  ! 2740: WRASI_I	wr	%r0, 0x0014, %asi
	mov 0x32, %r30
	.word 0x83d0001e  ! 2741: Tcc_R	te	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8a4b6001  ! 2743: MULX_I	mulx 	%r13, 0x0001, %r5
	.word 0x28800001  ! 2744: BLEU	bleu,a	<label_0x1>
	.word 0xcadfe000  ! 2745: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r5
	.word 0x8d902ac7  ! 2746: WRPR_PSTATE_I	wrpr	%r0, 0x0ac7, %pstate
	.word 0x8d902add  ! 2747: WRPR_PSTATE_I	wrpr	%r0, 0x0add, %pstate
	.word 0x81982dc7  ! 2748: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dc7, %hpstate
	.word 0x81d02033  ! 2749: Tcc_I	tn	icc_or_xcc, %r0 + 51
	.word 0x9dd02031  ! 2750: Tcc_I	tpos	icc_or_xcc, %r0 + 49
	.word 0x9e686001  ! 2751: UDIVX_I	udivx 	%r1, 0x0001, %r15
	mov 0x32, %r30
	.word 0x91d0001e  ! 2752: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x88026001  ! 2753: ADD_I	add 	%r9, 0x0001, %r4
	.word 0x8d902286  ! 2754: WRPR_PSTATE_I	wrpr	%r0, 0x0286, %pstate
	.word 0x87802014  ! 2755: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x9551c000  ! 2756: RDPR_TL	rdpr	%tl, %r10
	.word 0x8cc0e001  ! 2757: ADDCcc_I	addccc 	%r3, 0x0001, %r6
	.word 0x8da01a61  ! 2758: FqTOi	fqtoi	
	.word 0x81982bdb  ! 2759: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bdb, %hpstate
	.word 0x8d902edb  ! 2760: WRPR_PSTATE_I	wrpr	%r0, 0x0edb, %pstate
	.word 0x2e700001  ! 2761: BPVS	<illegal instruction>
	mov 0x30, %r30
	.word 0x97d0001e  ! 2762: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0xcc800c80  ! 2763: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r6
	.word 0x89a34dcc  ! 2764: FdMULq	fdmulq	
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81982acb  ! 2766: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0acb, %hpstate
	.word 0xc8d804a0  ! 2767: LDXA_R	ldxa	[%r0, %r0] 0x25, %r4
	.word 0x87802004  ! 2768: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x2a700001  ! 2769: BPCS	<illegal instruction>
	.word 0x8d902a54  ! 2770: WRPR_PSTATE_I	wrpr	%r0, 0x0a54, %pstate
	.word 0xc8ffc02c  ! 2771: SWAPA_R	swapa	%r4, [%r31 + %r12] 0x01
	.word 0x38700001  ! 2772: BPGU	<illegal instruction>
DS_138:
	.word 0x20800001  ! 2774: BN	bn,a	<label_0x1>
	.word 0xc3314001  ! 2774: STQF_R	-	%f1, [%r1, %r5]
	.word 0x97458000  ! 2773: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0x9fa1c9c9  ! 2774: FDIVd	fdivd	%f38, %f40, %f46
	.word 0x81982c5b  ! 2775: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c5b, %hpstate
	.word 0x93d02032  ! 2776: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0xde8fe020  ! 2777: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r15
	.word 0xde8fe010  ! 2778: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r15
	.word 0x8fa009c0  ! 2779: FDIVd	fdivd	%f0, %f0, %f38
	.word 0x8198280f  ! 2780: WRHPR_HPSTATE_I	wrhpr	%r0, 0x080f, %hpstate
	.word 0x20800001  ! 2781: BN	bn,a	<label_0x1>
	.word 0x976b2001  ! 2782: SDIVX_I	sdivx	%r12, 0x0001, %r11
	.word 0x38700001  ! 2783: BPGU	<illegal instruction>
	.word 0x81982d51  ! 2784: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d51, %hpstate
	.word 0x9ac1e001  ! 2785: ADDCcc_I	addccc 	%r7, 0x0001, %r13
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xda7fe001  ! 2788: SWAP_I	swap	%r13, [%r31 + 0x0001]
	.word 0xda1fe001  ! 2789: LDD_I	ldd	[%r31 + 0x0001], %r13
DS_139:
	.word 0x20800001  ! 2791: BN	bn,a	<label_0x1>
	.word 0xd531e001  ! 2791: STQF_I	-	%f10, [0x0001, %r7]
	.word 0x8b458000  ! 2790: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0x81982646  ! 2791: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0646, %hpstate
	.word 0x967a0002  ! 2792: SDIV_R	sdiv 	%r8, %r2, %r11
	.word 0x8d902e4a  ! 2793: WRPR_PSTATE_I	wrpr	%r0, 0x0e4a, %pstate
	.word 0x81982a83  ! 2794: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a83, %hpstate
	.word 0x987ae001  ! 2795: SDIV_I	sdiv 	%r11, 0x0001, %r12
	.word 0x99508000  ! 2796: RDPR_TSTATE	rdpr	%tstate, %r12
	.word 0x98492001  ! 2797: MULX_I	mulx 	%r4, 0x0001, %r12
	.word 0x89a0c9a1  ! 2798: FDIVs	fdivs	%f3, %f1, %f4
	.word 0x36800001  ! 2799: BGE	bge,a	<label_0x1>
	.word 0x85d02035  ! 2800: Tcc_I	tle	icc_or_xcc, %r0 + 53
	.word 0x93d02030  ! 2801: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0x8d90260e  ! 2802: WRPR_PSTATE_I	wrpr	%r0, 0x060e, %pstate
	.word 0x8198290c  ! 2803: WRHPR_HPSTATE_I	wrhpr	%r0, 0x090c, %hpstate
	.word 0xc87fe001  ! 2804: SWAP_I	swap	%r4, [%r31 + 0x0001]
	.word 0x8d902ad0  ! 2805: WRPR_PSTATE_I	wrpr	%r0, 0x0ad0, %pstate
	.word 0x87d02031  ! 2806: Tcc_I	tl	icc_or_xcc, %r0 + 49
	.word 0x9ba109a2  ! 2807: FDIVs	fdivs	%f4, %f2, %f13
	.word 0x8e49800c  ! 2808: MULX_R	mulx 	%r6, %r12, %r7
	.word 0x80824003  ! 2809: ADDcc_R	addcc 	%r9, %r3, %r0
	.word 0x87802089  ! 2810: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x81982086  ! 2811: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0086, %hpstate
	.word 0x84804001  ! 2812: ADDcc_R	addcc 	%r1, %r1, %r2
	.word 0x9ba389a3  ! 2813: FDIVs	fdivs	%f14, %f3, %f13
	mov 0x33, %r30
	.word 0x93d0001e  ! 2814: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x9ba089c3  ! 2815: FDIVd	fdivd	%f2, %f34, %f44
	.word 0x87d02033  ! 2816: Tcc_I	tl	icc_or_xcc, %r0 + 51
	.word 0x8d902648  ! 2817: WRPR_PSTATE_I	wrpr	%r0, 0x0648, %pstate
	.word 0x87802016  ! 2818: WRASI_I	wr	%r0, 0x0016, %asi
	mov 0x34, %r30
	.word 0x9dd0001e  ! 2819: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x8ad2a001  ! 2820: UMULcc_I	umulcc 	%r10, 0x0001, %r5
	.word 0xcac7e020  ! 2821: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r5
	ta	T_CHANGE_HPRIV	! macro
	mov 0x32, %r30
	.word 0x83d0001e  ! 2823: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x80d3e001  ! 2824: UMULcc_I	umulcc 	%r15, 0x0001, %r0
	.word 0x83d02035  ! 2825: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x2c800001  ! 2826: BNEG	bneg,a	<label_0x1>
	.word 0x83500000  ! 2827: RDPR_TPC	rdpr	%tpc, %r1
	.word 0x32700001  ! 2828: BPNE	<illegal instruction>
	.word 0x8d480000  ! 2829: RDHPR_HPSTATE	rdhpr	%hpstate, %r6
	mov 0x35, %r30
	.word 0x9bd0001e  ! 2830: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x81982d0a  ! 2831: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d0a, %hpstate
	.word 0xcc7fe001  ! 2832: SWAP_I	swap	%r6, [%r31 + 0x0001]
	.word 0xcc4fe001  ! 2833: LDSB_I	ldsb	[%r31 + 0x0001], %r6
	.word 0x80c0a001  ! 2834: ADDCcc_I	addccc 	%r2, 0x0001, %r0
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87802010  ! 2836: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x93a0056c  ! 2837: FSQRTq	fsqrt	
	.word 0x9bd02031  ! 2838: Tcc_I	tcc	icc_or_xcc, %r0 + 49
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd297e000  ! 2841: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r9
	.word 0xd20fc000  ! 2842: LDUB_R	ldub	[%r31 + %r0], %r9
	.word 0xd2dfe020  ! 2843: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r9
	ta	T_CHANGE_NONHPRIV	! macro
DS_140:
	.word 0x32800001  ! 2846: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x8db28303  ! 2845: ALLIGNADDRESS	alignaddr	%r10, %r3, %r6
	.word 0x8d902453  ! 2846: WRPR_PSTATE_I	wrpr	%r0, 0x0453, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x81982e49  ! 2848: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e49, %hpstate
	.word 0x87802080  ! 2849: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x8da189c0  ! 2850: FDIVd	fdivd	%f6, %f0, %f6
	mov 0x31, %r30
	.word 0x97d0001e  ! 2851: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0xcde7c020  ! 2852: CASA_I	casa	[%r31] 0x 1, %r0, %r6
	.word 0x24800001  ! 2853: BLE	ble,a	<label_0x1>
	.word 0x9e480007  ! 2854: MULX_R	mulx 	%r0, %r7, %r15
	.word 0x81982501  ! 2855: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0501, %hpstate
	.word 0xde97e010  ! 2856: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r15
	.word 0x81982f84  ! 2857: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f84, %hpstate
	.word 0xde9fe001  ! 2858: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r15
	.word 0x8d902cca  ! 2859: WRPR_PSTATE_I	wrpr	%r0, 0x0cca, %pstate
	.word 0xdec7e010  ! 2860: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r15
	ta	T_CHANGE_PRIV	! macro
	.word 0x87802004  ! 2862: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x97508000  ! 2863: RDPR_TSTATE	rdpr	%tstate, %r11
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81d02030  ! 2865: Tcc_I	tn	icc_or_xcc, %r0 + 48
	mov 0x32, %r30
	.word 0x97d0001e  ! 2866: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x81982b52  ! 2867: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b52, %hpstate
	.word 0x8d51c000  ! 2868: RDPR_TL	rdpr	%tl, %r6
	.word 0x8bd02031  ! 2869: Tcc_I	tcs	icc_or_xcc, %r0 + 49
	ta	T_CHANGE_PRIV	! macro
	.word 0x9fa1cdce  ! 2871: FdMULq	fdmulq	
DS_141:
	.word 0x22800001  ! 2873: BE	be,a	<label_0x1>
	.word 0xd731e001  ! 2873: STQF_I	-	%f11, [0x0001, %r7]
	.word 0x8b458000  ! 2872: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0xca2fc00e  ! 2873: STB_R	stb	%r5, [%r31 + %r14]
	.word 0xca4fe001  ! 2874: LDSB_I	ldsb	[%r31 + 0x0001], %r5
	.word 0x8d902451  ! 2875: WRPR_PSTATE_I	wrpr	%r0, 0x0451, %pstate
	.word 0x9849e001  ! 2876: MULX_I	mulx 	%r7, 0x0001, %r12
	.word 0x2e800001  ! 2877: BVS	bvs,a	<label_0x1>
	.word 0xd9e7c02e  ! 2878: CASA_I	casa	[%r31] 0x 1, %r14, %r12
DS_142:
	.word 0x22800001  ! 2880: BE	be,a	<label_0x1>
	.word 0xcf30000b  ! 2880: STQF_R	-	%f7, [%r11, %r0]
	.word 0x83458000  ! 2879: RD_SOFTINT_REG	rd	%softint, %r1
	.word 0xc28008a0  ! 2880: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0x8481a001  ! 2881: ADDcc_I	addcc 	%r6, 0x0001, %r2
	.word 0x99d02032  ! 2882: Tcc_I	tgu	icc_or_xcc, %r0 + 50
DS_143:
	.word 0x22800001  ! 2884: BE	be,a	<label_0x1>
	illtrap
	.word 0x81b14300  ! 2883: ALLIGNADDRESS	alignaddr	%r5, %r0, %r0
	.word 0x8a7a0008  ! 2884: SDIV_R	sdiv 	%r8, %r8, %r5
	.word 0xca1fe001  ! 2885: LDD_I	ldd	[%r31 + 0x0001], %r5
	.word 0x87802016  ! 2886: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8198239a  ! 2887: WRHPR_HPSTATE_I	wrhpr	%r0, 0x039a, %hpstate
	.word 0x82796001  ! 2888: SDIV_I	sdiv 	%r5, 0x0001, %r1
DS_144:
	.word 0x22800001  ! 2890: BE	be,a	<label_0x1>
	.word 0xd731e001  ! 2890: STQF_I	-	%f11, [0x0001, %r7]
	.word 0x8b458000  ! 2889: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0x8d90249f  ! 2890: WRPR_PSTATE_I	wrpr	%r0, 0x049f, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0xca8804a0  ! 2892: LDUBA_R	lduba	[%r0, %r0] 0x25, %r5
	.word 0x8198255c  ! 2893: WRHPR_HPSTATE_I	wrhpr	%r0, 0x055c, %hpstate
	.word 0x866a4008  ! 2894: UDIVX_R	udivx 	%r9, %r8, %r3
	.word 0x8d802000  ! 2895: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc73fc008  ! 2896: STDF_R	std	%f3, [%r8, %r31]
	.word 0x8e7b6001  ! 2897: SDIV_I	sdiv 	%r13, 0x0001, %r7
	.word 0x9f692001  ! 2898: SDIVX_I	sdivx	%r4, 0x0001, %r15
	mov 0x31, %r30
	.word 0x93d0001e  ! 2899: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xde17c000  ! 2900: LDUH_R	lduh	[%r31 + %r0], %r15
	.word 0x9ec02001  ! 2901: ADDCcc_I	addccc 	%r0, 0x0001, %r15
	.word 0x9fa0c9e5  ! 2902: FDIVq	dis not found

	.word 0x81982b0f  ! 2903: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b0f, %hpstate
	.word 0x9249e001  ! 2904: MULX_I	mulx 	%r7, 0x0001, %r9
	.word 0x8a7b2001  ! 2905: SDIV_I	sdiv 	%r12, 0x0001, %r5
	.word 0xcac804a0  ! 2906: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r5
	ta	T_CHANGE_NONHPRIV	! macro
	mov 0x33, %r30
	.word 0x83d0001e  ! 2908: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x819826d7  ! 2909: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06d7, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
DS_145:
	.word 0x20800001  ! 2912: BN	bn,a	<label_0x1>
	illtrap
	.word 0x89b2830d  ! 2911: ALLIGNADDRESS	alignaddr	%r10, %r13, %r4
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87802089  ! 2914: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xc927c00d  ! 2915: STF_R	st	%f4, [%r13, %r31]
	.word 0xc8d004a0  ! 2916: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r4
	.word 0x95500000  ! 2917: RDPR_TPC	rdpr	%tpc, %r10
	.word 0x8d802004  ! 2918: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x96c1e001  ! 2919: ADDCcc_I	addccc 	%r7, 0x0001, %r11
	.word 0xd617e001  ! 2920: LDUH_I	lduh	[%r31 + 0x0001], %r11
	.word 0x8d902a4a  ! 2921: WRPR_PSTATE_I	wrpr	%r0, 0x0a4a, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	mov 0x32, %r30
	.word 0x93d0001e  ! 2923: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x24800001  ! 2924: BLE	ble,a	<label_0x1>
	.word 0x8d9024cb  ! 2925: WRPR_PSTATE_I	wrpr	%r0, 0x04cb, %pstate
	.word 0x9ed1800d  ! 2926: UMULcc_R	umulcc 	%r6, %r13, %r15
	.word 0xdec004a0  ! 2927: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r15
	.word 0x87802004  ! 2928: WRASI_I	wr	%r0, 0x0004, %asi
DS_146:
	.word 0x20800001  ! 2930: BN	bn,a	<label_0x1>
	.word 0xdb320007  ! 2930: STQF_R	-	%f13, [%r7, %r8]
	.word 0x87458000  ! 2929: RD_SOFTINT_REG	rd	%softint, %r3
	.word 0x8d802004  ! 2930: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x34800001  ! 2931: BG	bg,a	<label_0x1>
	.word 0x81982959  ! 2932: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0959, %hpstate
	.word 0x86db0005  ! 2933: SMULcc_R	smulcc 	%r12, %r5, %r3
	.word 0x8a026001  ! 2934: ADD_I	add 	%r9, 0x0001, %r5
DS_147:
	.word 0x32800001  ! 2936: BNE	bne,a	<label_0x1>
	.word 0xdf316001  ! 2936: STQF_I	-	%f15, [0x0001, %r5]
	.word 0x85458000  ! 2935: RD_SOFTINT_REG	rd	%softint, %r2
	.word 0x8878c004  ! 2936: SDIV_R	sdiv 	%r3, %r4, %r4
	.word 0x8bd02030  ! 2937: Tcc_I	tcs	icc_or_xcc, %r0 + 48
	.word 0x81982ed6  ! 2938: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed6, %hpstate
	.word 0x99508000  ! 2939: RDPR_TSTATE	rdpr	%tstate, %r12
	.word 0x876ac00a  ! 2940: SDIVX_R	sdivx	%r11, %r10, %r3
	.word 0xc6d004a0  ! 2941: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r3
	mov 0x31, %r30
	.word 0x87d0001e  ! 2942: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0xc68008a0  ! 2943: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x8cc16001  ! 2944: ADDCcc_I	addccc 	%r5, 0x0001, %r6
DS_148:
	.word 0x20800001  ! 2946: BN	bn,a	<label_0x1>
	illtrap
	.word 0x93b14305  ! 2945: ALLIGNADDRESS	alignaddr	%r5, %r5, %r9
	.word 0x80d0000f  ! 2946: UMULcc_R	umulcc 	%r0, %r15, %r0
DS_149:
	.word 0x32800001  ! 2948: BNE	bne,a	<label_0x1>
	.word 0xc331c007  ! 2948: STQF_R	-	%f1, [%r7, %r7]
	.word 0x8b458000  ! 2947: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0x96680002  ! 2948: UDIVX_R	udivx 	%r0, %r2, %r11
	.word 0x3e700001  ! 2949: BPVC	<illegal instruction>
	mov 0x35, %r30
	.word 0x9fd0001e  ! 2950: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
DS_150:
	.word 0x22800001  ! 2952: BE	be,a	<label_0x1>
	illtrap
	.word 0x8bb08305  ! 2951: ALLIGNADDRESS	alignaddr	%r2, %r5, %r5
	.word 0x8d902841  ! 2952: WRPR_PSTATE_I	wrpr	%r0, 0x0841, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x8fd02034  ! 2955: Tcc_I	tvs	icc_or_xcc, %r0 + 52
	.word 0x87802014  ! 2956: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x819822ca  ! 2957: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02ca, %hpstate
	mov 0x34, %r30
	.word 0x93d0001e  ! 2958: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xcac7e020  ! 2960: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r5
	.word 0x9ad90000  ! 2961: SMULcc_R	smulcc 	%r4, %r0, %r13
DS_151:
	.word 0x20800001  ! 2963: BN	bn,a	<label_0x1>
	illtrap
	.word 0x97b0830b  ! 2962: ALLIGNADDRESS	alignaddr	%r2, %r11, %r11
	.word 0x87802004  ! 2963: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8268e001  ! 2964: UDIVX_I	udivx 	%r3, 0x0001, %r1
	.word 0x8d902048  ! 2965: WRPR_PSTATE_I	wrpr	%r0, 0x0048, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0xc2c804a0  ! 2967: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r1
	.word 0x8d902c16  ! 2968: WRPR_PSTATE_I	wrpr	%r0, 0x0c16, %pstate
	.word 0xc207e001  ! 2969: LDUW_I	lduw	[%r31 + 0x0001], %r1
DS_152:
	.word 0x22800001  ! 2971: BE	be,a	<label_0x1>
	illtrap
	.word 0x9fb04303  ! 2970: ALLIGNADDRESS	alignaddr	%r1, %r3, %r15
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d902644  ! 2972: WRPR_PSTATE_I	wrpr	%r0, 0x0644, %pstate
	.word 0xde800a80  ! 2973: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r15
	.word 0xded7e000  ! 2974: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r15
	.word 0xde8804a0  ! 2975: LDUBA_R	lduba	[%r0, %r0] 0x25, %r15
	.word 0x8d9028d2  ! 2976: WRPR_PSTATE_I	wrpr	%r0, 0x08d2, %pstate
	.word 0x8d9022d8  ! 2977: WRPR_PSTATE_I	wrpr	%r0, 0x02d8, %pstate
	.word 0x81982503  ! 2978: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0503, %hpstate
	.word 0x8d902c44  ! 2979: WRPR_PSTATE_I	wrpr	%r0, 0x0c44, %pstate
	.word 0xde8008a0  ! 2980: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r15
	.word 0x8d902c8f  ! 2981: WRPR_PSTATE_I	wrpr	%r0, 0x0c8f, %pstate
	.word 0x87802010  ! 2982: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x8a032001  ! 2983: ADD_I	add 	%r12, 0x0001, %r5
	.word 0x8a692001  ! 2984: UDIVX_I	udivx 	%r4, 0x0001, %r5
	.word 0x944a2001  ! 2985: MULX_I	mulx 	%r8, 0x0001, %r10
	mov 0x34, %r30
	.word 0x9fd0001e  ! 2986: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x22800001  ! 2987: BE	be,a	<label_0x1>
	.word 0x94d9c003  ! 2988: SMULcc_R	smulcc 	%r7, %r3, %r10
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xd4dfe010  ! 2990: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r10
	.word 0x81982d12  ! 2991: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d12, %hpstate
	.word 0x97504000  ! 2992: RDPR_TNPC	rdpr	%tnpc, %r11
	.word 0x924b4002  ! 2993: MULX_R	mulx 	%r13, %r2, %r9
	.word 0xd28fe000  ! 2994: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r9
	.word 0x81a089a9  ! 2995: FDIVs	fdivs	%f2, %f9, %f0
	.word 0x80d0e001  ! 2996: UMULcc_I	umulcc 	%r3, 0x0001, %r0
	.word 0x87802089  ! 2997: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8d802004  ! 2998: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8da01a61  ! 2999: FqTOi	fqtoi	
DS_153:
	.word 0x34800001  ! 3001: BG	bg,a	<label_0x1>
	.word 0xc733400d  ! 3001: STQF_R	-	%f3, [%r13, %r13]
	.word 0x87458000  ! 3000: RD_SOFTINT_REG	rd	%softint, %r3
DS_154:
	.word 0x32800001  ! 3002: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x83b1030a  ! 3001: ALLIGNADDRESS	alignaddr	%r4, %r10, %r1
	.word 0x8d902a54  ! 3002: WRPR_PSTATE_I	wrpr	%r0, 0x0a54, %pstate
	.word 0x87802004  ! 3003: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x81982859  ! 3004: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0859, %hpstate
	.word 0x8d9024d8  ! 3005: WRPR_PSTATE_I	wrpr	%r0, 0x04d8, %pstate
	.word 0x93508000  ! 3006: RDPR_TSTATE	rdpr	%tstate, %r9
	mov 0x34, %r30
	.word 0x9bd0001e  ! 3007: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
DS_155:
	.word 0x22800001  ! 3009: BE	be,a	<label_0x1>
	illtrap
	.word 0x97b0c308  ! 3008: ALLIGNADDRESS	alignaddr	%r3, %r8, %r11
	.word 0x8880c00f  ! 3009: ADDcc_R	addcc 	%r3, %r15, %r4
	.word 0xc8880e40  ! 3010: LDUBA_R	lduba	[%r0, %r0] 0x72, %r4
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81982198  ! 3012: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0198, %hpstate
	.word 0x34700001  ! 3013: BPG	<illegal instruction>
	.word 0x87802016  ! 3014: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x32700001  ! 3015: BPNE	<illegal instruction>
	.word 0x85a01a6d  ! 3016: FqTOi	fqtoi	
	.word 0x87a01a6c  ! 3017: FqTOi	fqtoi	
	.word 0x8d902800  ! 3018: WRPR_PSTATE_I	wrpr	%r0, 0x0800, %pstate
	.word 0xc68804a0  ! 3019: LDUBA_R	lduba	[%r0, %r0] 0x25, %r3
	.word 0x8ba3c9c6  ! 3020: FDIVd	fdivd	%f46, %f6, %f36
	.word 0xca800c00  ! 3021: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r5
	.word 0x819820d8  ! 3022: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00d8, %hpstate
	.word 0x81982244  ! 3023: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0244, %hpstate
	.word 0x8d902ad7  ! 3024: WRPR_PSTATE_I	wrpr	%r0, 0x0ad7, %pstate
	.word 0x2c800001  ! 3025: BNEG	bneg,a	<label_0x1>
	mov 0x30, %r30
	.word 0x9fd0001e  ! 3026: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x34800001  ! 3027: BG	bg,a	<label_0x1>
	.word 0x30700001  ! 3028: BPA	<illegal instruction>
	.word 0x8a78a001  ! 3029: SDIV_I	sdiv 	%r2, 0x0001, %r5
	.word 0xcacfe000  ! 3030: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r5
	.word 0x32700001  ! 3031: BPNE	<illegal instruction>
	.word 0x32700001  ! 3032: BPNE	<illegal instruction>
DS_156:
	.word 0x34800001  ! 3034: BG	bg,a	<label_0x1>
	.word 0xcd334006  ! 3034: STQF_R	-	%f6, [%r6, %r13]
	.word 0x87458000  ! 3033: RD_SOFTINT_REG	rd	%softint, %r3
	.word 0xc6d7e030  ! 3034: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r3
	.word 0x9da1c9c0  ! 3035: FDIVd	fdivd	%f38, %f0, %f14
	.word 0x89d02030  ! 3036: Tcc_I	tleu	icc_or_xcc, %r0 + 48
	.word 0x8d802004  ! 3037: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d802000  ! 3038: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d802000  ! 3040: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d902c8b  ! 3041: WRPR_PSTATE_I	wrpr	%r0, 0x0c8b, %pstate
	.word 0x92d1c00f  ! 3042: UMULcc_R	umulcc 	%r7, %r15, %r9
	.word 0x2e800001  ! 3043: BVS	bvs,a	<label_0x1>
	.word 0x87d02031  ! 3044: Tcc_I	tl	icc_or_xcc, %r0 + 49
	mov 0x32, %r30
	.word 0x8dd0001e  ! 3045: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x2a800001  ! 3046: BCS	bcs,a	<label_0x1>
DS_157:
	.word 0x34800001  ! 3048: BG	bg,a	<label_0x1>
	.word 0xdb334002  ! 3048: STQF_R	-	%f13, [%r2, %r13]
	.word 0x8b458000  ! 3047: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0xca7fe001  ! 3048: SWAP_I	swap	%r5, [%r31 + 0x0001]
	.word 0x85500000  ! 3049: RDPR_TPC	rdpr	%tpc, %r2
	.word 0x8bd02034  ! 3050: Tcc_I	tcs	icc_or_xcc, %r0 + 52
	.word 0x8d902614  ! 3051: WRPR_PSTATE_I	wrpr	%r0, 0x0614, %pstate
	.word 0x81982396  ! 3052: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0396, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc4d004a0  ! 3055: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r2
	.word 0xc457e001  ! 3056: LDSH_I	ldsh	[%r31 + 0x0001], %r2
	.word 0xc47fe001  ! 3057: SWAP_I	swap	%r2, [%r31 + 0x0001]
	.word 0x87802010  ! 3058: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xc427c002  ! 3059: STW_R	stw	%r2, [%r31 + %r2]
	.word 0x84c2a001  ! 3060: ADDCcc_I	addccc 	%r10, 0x0001, %r2
	mov 0x34, %r30
	.word 0x83d0001e  ! 3061: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xc447e001  ! 3062: LDSW_I	ldsw	[%r31 + 0x0001], %r2
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xc5e7c022  ! 3064: CASA_I	casa	[%r31] 0x 1, %r2, %r2
	.word 0x87802016  ! 3065: WRASI_I	wr	%r0, 0x0016, %asi
	mov 0x34, %r30
	.word 0x83d0001e  ! 3066: Tcc_R	te	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xc4800c40  ! 3068: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r2
	.word 0x819827c9  ! 3069: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07c9, %hpstate
	.word 0x8cd04001  ! 3070: UMULcc_R	umulcc 	%r1, %r1, %r6
	.word 0x8481e001  ! 3071: ADDcc_I	addcc 	%r7, 0x0001, %r2
	.word 0x81982c08  ! 3072: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c08, %hpstate
	.word 0x8d500000  ! 3073: RDPR_TPC	rdpr	%tpc, %r6
	.word 0x8d9024ce  ! 3074: WRPR_PSTATE_I	wrpr	%r0, 0x04ce, %pstate
	.word 0x89d02030  ! 3075: Tcc_I	tleu	icc_or_xcc, %r0 + 48
	.word 0x8198225a  ! 3076: WRHPR_HPSTATE_I	wrhpr	%r0, 0x025a, %hpstate
	.word 0x81982f90  ! 3077: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f90, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x9e68400c  ! 3079: UDIVX_R	udivx 	%r1, %r12, %r15
	.word 0x9cd9c003  ! 3080: SMULcc_R	smulcc 	%r7, %r3, %r14
	.word 0x9d500000  ! 3081: RDPR_TPC	rdpr	%tpc, %r14
	.word 0x81982b00  ! 3082: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b00, %hpstate
	ta	T_CHANGE_HPRIV	! macro
DS_158:
	.word 0x32800001  ! 3085: BNE	bne,a	<label_0x1>
	.word 0xdf30c00b  ! 3085: STQF_R	-	%f15, [%r11, %r3]
	.word 0x9d458000  ! 3084: RD_SOFTINT_REG	rd	%softint, %r14
	.word 0x87802004  ! 3085: WRASI_I	wr	%r0, 0x0004, %asi
	ta	T_CHANGE_PRIV	! macro
	.word 0xdc97e010  ! 3087: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r14
	mov 0x32, %r30
	.word 0x89d0001e  ! 3088: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
DS_159:
	.word 0x20800001  ! 3090: BN	bn,a	<label_0x1>
	.word 0xcd318006  ! 3090: STQF_R	-	%f6, [%r6, %r6]
	.word 0x8b458000  ! 3089: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0x8d902a52  ! 3090: WRPR_PSTATE_I	wrpr	%r0, 0x0a52, %pstate
	.word 0x9083e001  ! 3091: ADDcc_I	addcc 	%r15, 0x0001, %r8
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x26700001  ! 3093: BPL	<illegal instruction>
	.word 0x36800001  ! 3094: BGE	bge,a	<label_0x1>
	.word 0x9469c001  ! 3095: UDIVX_R	udivx 	%r7, %r1, %r10
	.word 0x80814005  ! 3096: ADDcc_R	addcc 	%r5, %r5, %r0
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902adf  ! 3098: WRPR_PSTATE_I	wrpr	%r0, 0x0adf, %pstate
	.word 0xc127c005  ! 3099: STF_R	st	%f0, [%r5, %r31]
	.word 0x94d90003  ! 3100: SMULcc_R	smulcc 	%r4, %r3, %r10
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d902a56  ! 3102: WRPR_PSTATE_I	wrpr	%r0, 0x0a56, %pstate
DS_160:
	.word 0x22800001  ! 3104: BE	be,a	<label_0x1>
	.word 0xdd318001  ! 3104: STQF_R	-	%f14, [%r1, %r6]
	.word 0x87458000  ! 3103: RD_SOFTINT_REG	rd	%softint, %r3
	.word 0x81982b07  ! 3104: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b07, %hpstate
	.word 0x8d9022c7  ! 3105: WRPR_PSTATE_I	wrpr	%r0, 0x02c7, %pstate
	.word 0x8d902c89  ! 3106: WRPR_PSTATE_I	wrpr	%r0, 0x0c89, %pstate
	.word 0x8d902a1b  ! 3107: WRPR_PSTATE_I	wrpr	%r0, 0x0a1b, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x87802089  ! 3109: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8dd02032  ! 3110: Tcc_I	tneg	icc_or_xcc, %r0 + 50
	.word 0x8198218e  ! 3111: WRHPR_HPSTATE_I	wrhpr	%r0, 0x018e, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x89508000  ! 3113: RDPR_TSTATE	rdpr	%tstate, %r4
	.word 0xc8c7e030  ! 3114: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r4
	.word 0xc8bfe001  ! 3115: STDA_I	stda	%r4, [%r31 + 0x0001] %asi
	.word 0x8f508000  ! 3116: RDPR_TSTATE	rdpr	%tstate, %r7
	.word 0xce800ba0  ! 3117: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r7
	mov 0x35, %r30
	.word 0x91d0001e  ! 3118: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xcf27e001  ! 3119: STF_I	st	%f7, [0x0001, %r31]
	.word 0x8198251e  ! 3120: WRHPR_HPSTATE_I	wrhpr	%r0, 0x051e, %hpstate
	.word 0x8d802000  ! 3121: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xcfe7c021  ! 3122: CASA_I	casa	[%r31] 0x 1, %r1, %r7
	.word 0x8f51c000  ! 3123: RDPR_TL	rdpr	%tl, %r7
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8ba000cd  ! 3125: FNEGd	fnegd	%f44, %f36
	.word 0xcb27e001  ! 3126: STF_I	st	%f5, [0x0001, %r31]
	.word 0x8ba149e4  ! 3127: FDIVq	dis not found

	.word 0xcac7e010  ! 3128: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r5
DS_161:
	.word 0x32800001  ! 3130: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x8bb20307  ! 3129: ALLIGNADDRESS	alignaddr	%r8, %r7, %r5
	.word 0x97514000  ! 3130: RDPR_TBA	rdpr	%tba, %r11
	.word 0x8d802000  ! 3131: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8e6ac00f  ! 3132: UDIVX_R	udivx 	%r11, %r15, %r7
	.word 0x8d902c17  ! 3133: WRPR_PSTATE_I	wrpr	%r0, 0x0c17, %pstate
	.word 0xcfe7c02f  ! 3134: CASA_I	casa	[%r31] 0x 1, %r15, %r7
	ta	T_CHANGE_HPRIV	! macro
	.word 0x89a01a68  ! 3136: FqTOi	fqtoi	
	.word 0x83a08dc2  ! 3137: FdMULq	fdmulq	
	.word 0x24700001  ! 3138: BPLE	<illegal instruction>
	ta	T_CHANGE_HPRIV	! macro
	.word 0x964b8006  ! 3140: MULX_R	mulx 	%r14, %r6, %r11
	.word 0x984a0001  ! 3141: MULX_R	mulx 	%r8, %r1, %r12
	.word 0x9da000c1  ! 3142: FNEGd	fnegd	%f32, %f14
	.word 0x8d902616  ! 3143: WRPR_PSTATE_I	wrpr	%r0, 0x0616, %pstate
	.word 0xdc8fe020  ! 3144: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r14
	.word 0x91494000  ! 3145: RDHPR_HTBA	rdhpr	%htba, %r8
	.word 0x96498007  ! 3146: MULX_R	mulx 	%r6, %r7, %r11
	.word 0x93d02032  ! 3147: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x8951c000  ! 3148: RDPR_TL	rdpr	%tl, %r4
	.word 0x819827cd  ! 3149: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07cd, %hpstate
	mov 0x30, %r30
	.word 0x83d0001e  ! 3150: Tcc_R	te	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xc8bfe001  ! 3153: STDA_I	stda	%r4, [%r31 + 0x0001] %asi
	.word 0x8d802000  ! 3154: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9b504000  ! 3155: RDPR_TNPC	rdpr	%tnpc, %r13
	.word 0x81982fc0  ! 3156: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fc0, %hpstate
	.word 0x87802088  ! 3157: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8f6a4007  ! 3158: SDIVX_R	sdivx	%r9, %r7, %r7
	.word 0x8d902a9b  ! 3159: WRPR_PSTATE_I	wrpr	%r0, 0x0a9b, %pstate
	.word 0x8d802004  ! 3160: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xce07c000  ! 3161: LDUW_R	lduw	[%r31 + %r0], %r7
	.word 0xcfe7c027  ! 3162: CASA_I	casa	[%r31] 0x 1, %r7, %r7
	.word 0x89a0cd2b  ! 3163: FsMULd	fsmuld	%f3, %f42, %f4
	.word 0xc88008a0  ! 3164: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
	.word 0x98826001  ! 3165: ADDcc_I	addcc 	%r9, 0x0001, %r12
	.word 0x9601e001  ! 3166: ADD_I	add 	%r7, 0x0001, %r11
	.word 0xd6bfc02b  ! 3167: STDA_R	stda	%r11, [%r31 + %r11] 0x01
	.word 0x8198261a  ! 3168: WRHPR_HPSTATE_I	wrhpr	%r0, 0x061a, %hpstate
	.word 0xd6d80e80  ! 3169: LDXA_R	ldxa	[%r0, %r0] 0x74, %r11
	.word 0x8dd02033  ! 3170: Tcc_I	tneg	icc_or_xcc, %r0 + 51
	.word 0xd717c000  ! 3171: LDQF_R	-	[%r31, %r0], %f11
	.word 0x9a824001  ! 3172: ADDcc_R	addcc 	%r9, %r1, %r13
	.word 0xda1fe001  ! 3173: LDD_I	ldd	[%r31 + 0x0001], %r13
	.word 0x81982b44  ! 3174: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b44, %hpstate
	.word 0x83a249e4  ! 3175: FDIVq	dis not found

	.word 0x91a30dc5  ! 3176: FdMULq	fdmulq	
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d902412  ! 3179: WRPR_PSTATE_I	wrpr	%r0, 0x0412, %pstate
DS_162:
	.word 0x20800001  ! 3181: BN	bn,a	<label_0x1>
	.word 0xdb32000b  ! 3181: STQF_R	-	%f13, [%r11, %r8]
	.word 0x95458000  ! 3180: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0x819823d8  ! 3181: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03d8, %hpstate
	.word 0x80c26001  ! 3182: ADDCcc_I	addccc 	%r9, 0x0001, %r0
	.word 0xc01fc000  ! 3183: LDD_R	ldd	[%r31 + %r0], %r0
	.word 0x84032001  ! 3184: ADD_I	add 	%r12, 0x0001, %r2
	ta	T_CHANGE_NONHPRIV	! macro
	mov 0x32, %r30
	.word 0x83d0001e  ! 3186: Tcc_R	te	icc_or_xcc, %r0 + %r30
DS_163:
	.word 0x34800001  ! 3188: BG	bg,a	<label_0x1>
	.word 0xcf330001  ! 3188: STQF_R	-	%f7, [%r1, %r12]
	.word 0x83458000  ! 3187: RD_SOFTINT_REG	rd	%softint, %r1
	.word 0x3a700001  ! 3188: BPCC	<illegal instruction>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81982780  ! 3190: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0780, %hpstate
	.word 0x93a0056d  ! 3191: FSQRTq	fsqrt	
DS_164:
	.word 0x22800001  ! 3193: BE	be,a	<label_0x1>
	illtrap
	.word 0x8db2c30b  ! 3192: ALLIGNADDRESS	alignaddr	%r11, %r11, %r6
	.word 0x819821db  ! 3193: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01db, %hpstate
	.word 0x8d902050  ! 3194: WRPR_PSTATE_I	wrpr	%r0, 0x0050, %pstate
	.word 0x87802080  ! 3195: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xccdfe000  ! 3196: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r6
	.word 0xcc800b40  ! 3197: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r6
	.word 0xcc8008a0  ! 3198: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x81982490  ! 3199: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0490, %hpstate
	mov 0x34, %r30
	.word 0x9fd0001e  ! 3200: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x9dd02033  ! 3201: Tcc_I	tpos	icc_or_xcc, %r0 + 51
	mov 0x30, %r30
	.word 0x9fd0001e  ! 3202: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x81982914  ! 3203: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0914, %hpstate
	.word 0xccffc02b  ! 3204: SWAPA_R	swapa	%r6, [%r31 + %r11] 0x01
	.word 0x8198299d  ! 3205: WRHPR_HPSTATE_I	wrhpr	%r0, 0x099d, %hpstate
	.word 0xcc27e001  ! 3206: STW_I	stw	%r6, [%r31 + 0x0001]
	.word 0x87802088  ! 3207: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xcc07e001  ! 3208: LDUW_I	lduw	[%r31 + 0x0001], %r6
	ta	T_CHANGE_PRIV	! macro
	mov 0x32, %r30
	.word 0x89d0001e  ! 3210: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x86c3a001  ! 3211: ADDCcc_I	addccc 	%r14, 0x0001, %r3
	.word 0x8198269c  ! 3212: WRHPR_HPSTATE_I	wrhpr	%r0, 0x069c, %hpstate
	.word 0x8fd02032  ! 3213: Tcc_I	tvs	icc_or_xcc, %r0 + 50
	.word 0x8d90269b  ! 3214: WRPR_PSTATE_I	wrpr	%r0, 0x069b, %pstate
	.word 0x87802089  ! 3215: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x87802010  ! 3216: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x93a01a68  ! 3217: FqTOi	fqtoi	
	.word 0x819828d7  ! 3218: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d7, %hpstate
DS_165:
	.word 0x22800001  ! 3220: BE	be,a	<label_0x1>
	illtrap
	.word 0x91b14301  ! 3219: ALLIGNADDRESS	alignaddr	%r5, %r1, %r8
	.word 0x8d9026cb  ! 3220: WRPR_PSTATE_I	wrpr	%r0, 0x06cb, %pstate
	mov 0x33, %r30
	.word 0x99d0001e  ! 3221: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x81982c80  ! 3222: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c80, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d902e44  ! 3224: WRPR_PSTATE_I	wrpr	%r0, 0x0e44, %pstate
	.word 0x93d02035  ! 3225: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x89504000  ! 3226: RDPR_TNPC	rdpr	%tnpc, %r4
	.word 0x8049000d  ! 3227: MULX_R	mulx 	%r4, %r13, %r0
	.word 0xc0c80e60  ! 3228: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r0
	.word 0x8d902c9a  ! 3229: WRPR_PSTATE_I	wrpr	%r0, 0x0c9a, %pstate
	.word 0x9f500000  ! 3230: RDPR_TPC	rdpr	%tpc, %r15
	.word 0xde27e001  ! 3231: STW_I	stw	%r15, [%r31 + 0x0001]
	.word 0x819828d9  ! 3232: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d9, %hpstate
	.word 0xde47c000  ! 3233: LDSW_R	ldsw	[%r31 + %r0], %r15
	.word 0x9248800c  ! 3234: MULX_R	mulx 	%r2, %r12, %r9
	.word 0x8d802000  ! 3235: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd3e7c02c  ! 3236: CASA_I	casa	[%r31] 0x 1, %r12, %r9
	.word 0x83508000  ! 3237: RDPR_TSTATE	rdpr	%tstate, %r1
	.word 0x81982e56  ! 3238: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e56, %hpstate
	.word 0xc28008a0  ! 3239: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0x9c48c00b  ! 3240: MULX_R	mulx 	%r3, %r11, %r14
	.word 0x8d51c000  ! 3241: RDPR_TL	rdpr	%tl, %r6
	.word 0x87504000  ! 3242: RDPR_TNPC	rdpr	%tnpc, %r3
	.word 0x8c6a8003  ! 3243: UDIVX_R	udivx 	%r10, %r3, %r6
	.word 0x8e684007  ! 3244: UDIVX_R	udivx 	%r1, %r7, %r7
	.word 0xce1fe001  ! 3245: LDD_I	ldd	[%r31 + 0x0001], %r7
	.word 0x9c51400b  ! 3246: UMUL_R	umul 	%r5, %r11, %r14
	.word 0x99d02030  ! 3247: Tcc_I	tgu	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xdc0fc000  ! 3249: LDUB_R	ldub	[%r31 + %r0], %r14
DS_166:
	.word 0x34800001  ! 3251: BG	bg,a	<label_0x1>
	illtrap
	.word 0x85b2830a  ! 3250: ALLIGNADDRESS	alignaddr	%r10, %r10, %r2
	.word 0x84692001  ! 3251: UDIVX_I	udivx 	%r4, 0x0001, %r2
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x819820de  ! 3253: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00de, %hpstate
	.word 0x8198240a  ! 3254: WRHPR_HPSTATE_I	wrhpr	%r0, 0x040a, %hpstate
DS_167:
	.word 0x34800001  ! 3256: BG	bg,a	<label_0x1>
	.word 0xd1338005  ! 3256: STQF_R	-	%f8, [%r5, %r14]
	.word 0x91458000  ! 3255: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x85a01a67  ! 3256: FqTOi	fqtoi	
	.word 0xc407c000  ! 3257: LDUW_R	lduw	[%r31 + %r0], %r2
	.word 0x89a18d26  ! 3258: FsMULd	fsmuld	%f6, %f6, %f4
	.word 0x8d902e4e  ! 3259: WRPR_PSTATE_I	wrpr	%r0, 0x0e4e, %pstate
	.word 0x8d902086  ! 3260: WRPR_PSTATE_I	wrpr	%r0, 0x0086, %pstate
	.word 0x819823ce  ! 3261: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03ce, %hpstate
	.word 0x8d902e11  ! 3262: WRPR_PSTATE_I	wrpr	%r0, 0x0e11, %pstate
	.word 0x8d9028c4  ! 3263: WRPR_PSTATE_I	wrpr	%r0, 0x08c4, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x99a2c9c4  ! 3265: FDIVd	fdivd	%f42, %f4, %f12
	.word 0x89d02030  ! 3266: Tcc_I	tleu	icc_or_xcc, %r0 + 48
	.word 0x34700001  ! 3267: BPG	<illegal instruction>
	.word 0x8d902e09  ! 3268: WRPR_PSTATE_I	wrpr	%r0, 0x0e09, %pstate
	.word 0x97d02031  ! 3269: Tcc_I	tge	icc_or_xcc, %r0 + 49
	.word 0x9dd02034  ! 3270: Tcc_I	tpos	icc_or_xcc, %r0 + 52
	.word 0x81982c99  ! 3271: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c99, %hpstate
	.word 0x8d902c0a  ! 3272: WRPR_PSTATE_I	wrpr	%r0, 0x0c0a, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0xd88fe000  ! 3274: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r12
	.word 0x87a08d25  ! 3275: FsMULd	fsmuld	%f2, %f36, %f34
	.word 0x81982216  ! 3276: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0216, %hpstate
	.word 0xc68008a0  ! 3277: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0xc68804a0  ! 3278: LDUBA_R	lduba	[%r0, %r0] 0x25, %r3
	mov 0x31, %r30
	.word 0x9fd0001e  ! 3279: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 3280: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982a0a  ! 3281: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a0a, %hpstate
	.word 0x8d902c57  ! 3282: WRPR_PSTATE_I	wrpr	%r0, 0x0c57, %pstate
	.word 0x984ac008  ! 3283: MULX_R	mulx 	%r11, %r8, %r12
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9c036001  ! 3285: ADD_I	add 	%r13, 0x0001, %r14
	.word 0xdc0fe001  ! 3286: LDUB_I	ldub	[%r31 + 0x0001], %r14
	.word 0xdcdfe000  ! 3287: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r14
DS_168:
	.word 0x22800001  ! 3289: BE	be,a	<label_0x1>
	illtrap
	.word 0x8fb14307  ! 3288: ALLIGNADDRESS	alignaddr	%r5, %r7, %r7
	.word 0x87802004  ! 3289: WRASI_I	wr	%r0, 0x0004, %asi
DS_169:
	.word 0x32800001  ! 3291: BNE	bne,a	<label_0x1>
	.word 0xd3310009  ! 3291: STQF_R	-	%f9, [%r9, %r4]
	.word 0x85458000  ! 3290: RD_SOFTINT_REG	rd	%softint, %r2
	.word 0x87802080  ! 3291: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x86d24003  ! 3292: UMULcc_R	umulcc 	%r9, %r3, %r3
	ta	T_CHANGE_PRIV	! macro
DS_170:
	.word 0x32800001  ! 3295: BNE	bne,a	<label_0x1>
	.word 0xcd32800a  ! 3295: STQF_R	-	%f6, [%r10, %r10]
	.word 0x9d458000  ! 3294: RD_SOFTINT_REG	rd	%softint, %r14
	.word 0x8d902641  ! 3295: WRPR_PSTATE_I	wrpr	%r0, 0x0641, %pstate
	mov 0x30, %r30
	.word 0x9bd0001e  ! 3296: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0xdcffc02a  ! 3297: SWAPA_R	swapa	%r14, [%r31 + %r10] 0x01
	.word 0xdc1fc000  ! 3298: LDD_R	ldd	[%r31 + %r0], %r14
	.word 0xdc8008a0  ! 3299: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r14
	.word 0xdcc7e010  ! 3300: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r14
	.word 0xdc27c00a  ! 3301: STW_R	stw	%r14, [%r31 + %r10]
	.word 0xdc0fe001  ! 3302: LDUB_I	ldub	[%r31 + 0x0001], %r14
DS_171:
	.word 0x22800001  ! 3304: BE	be,a	<label_0x1>
	illtrap
	.word 0x95b2c305  ! 3303: ALLIGNADDRESS	alignaddr	%r11, %r5, %r10
	.word 0xd48008a0  ! 3304: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x81982c56  ! 3305: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c56, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d90280c  ! 3307: WRPR_PSTATE_I	wrpr	%r0, 0x080c, %pstate
	.word 0xd4ffc025  ! 3308: SWAPA_R	swapa	%r10, [%r31 + %r5] 0x01
	.word 0x8a51400f  ! 3309: UMUL_R	umul 	%r5, %r15, %r5
	.word 0x8d902a04  ! 3310: WRPR_PSTATE_I	wrpr	%r0, 0x0a04, %pstate
	.word 0x819825d7  ! 3311: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05d7, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x81982006  ! 3313: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0006, %hpstate
	.word 0x8ba00561  ! 3314: FSQRTq	fsqrt	
	.word 0x9c80e001  ! 3315: ADDcc_I	addcc 	%r3, 0x0001, %r14
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xdd37e001  ! 3317: STQF_I	-	%f14, [0x0001, %r31]
	.word 0x819826cf  ! 3318: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06cf, %hpstate
	.word 0x85a0c9c4  ! 3319: FDIVd	fdivd	%f34, %f4, %f2
	.word 0xc41fc000  ! 3320: LDD_R	ldd	[%r31 + %r0], %r2
	.word 0x984a0008  ! 3321: MULX_R	mulx 	%r8, %r8, %r12
	.word 0x89a000c5  ! 3322: FNEGd	fnegd	%f36, %f4
	.word 0x819826d6  ! 3323: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06d6, %hpstate
	.word 0xc8c804a0  ! 3324: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r4
	.word 0x8d802000  ! 3325: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x87a01a6a  ! 3327: FqTOi	fqtoi	
	.word 0x83a249ed  ! 3328: FDIVq	dis not found

DS_172:
	.word 0x20800001  ! 3330: BN	bn,a	<label_0x1>
	.word 0xdb30c004  ! 3330: STQF_R	-	%f13, [%r4, %r3]
	.word 0x8f458000  ! 3329: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0x87802016  ! 3330: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8ed1a001  ! 3331: UMULcc_I	umulcc 	%r6, 0x0001, %r7
	.word 0xce97e020  ! 3332: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r7
	.word 0x87a1cdc4  ! 3333: FdMULq	fdmulq	
	.word 0x9b50c000  ! 3334: RDPR_TT	rdpr	%tt, %r13
	.word 0x8d902c49  ! 3335: WRPR_PSTATE_I	wrpr	%r0, 0x0c49, %pstate
	.word 0xdac7e000  ! 3336: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r13
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ac36001  ! 3338: ADDCcc_I	addccc 	%r13, 0x0001, %r13
	.word 0xdadfe030  ! 3339: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r13
	.word 0x99a000c2  ! 3340: FNEGd	fnegd	%f2, %f12
	.word 0x8d902c96  ! 3341: WRPR_PSTATE_I	wrpr	%r0, 0x0c96, %pstate
	.word 0x9ba0c9e1  ! 3342: FDIVq	dis not found

	.word 0xdb97e001  ! 3343: LDQFA_I	-	[%r31, 0x0001], %f13
	.word 0x8da38d20  ! 3344: FsMULd	fsmuld	%f14, %f0, %f6
	.word 0xccbfc020  ! 3345: STDA_R	stda	%r6, [%r31 + %r0] 0x01
	.word 0x84da8005  ! 3346: SMULcc_R	smulcc 	%r10, %r5, %r2
	.word 0xc44fc000  ! 3347: LDSB_R	ldsb	[%r31 + %r0], %r2
	.word 0x8ad88000  ! 3348: SMULcc_R	smulcc 	%r2, %r0, %r5
	.word 0x8d902a8d  ! 3349: WRPR_PSTATE_I	wrpr	%r0, 0x0a8d, %pstate
	.word 0x9050c005  ! 3350: UMUL_R	umul 	%r3, %r5, %r8
	.word 0x81982bda  ! 3351: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bda, %hpstate
	.word 0x80d9400f  ! 3352: SMULcc_R	smulcc 	%r5, %r15, %r0
	.word 0xc0800b60  ! 3353: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r0
	.word 0xc0ffc02f  ! 3354: SWAPA_R	swapa	%r0, [%r31 + %r15] 0x01
	.word 0x81982448  ! 3355: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0448, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	mov 0x32, %r30
	.word 0x95d0001e  ! 3357: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x8d694002  ! 3358: SDIVX_R	sdivx	%r5, %r2, %r6
	.word 0x8f480000  ! 3359: RDHPR_HPSTATE	rdhpr	%hpstate, %r7
	.word 0x8d802000  ! 3360: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xcf37c002  ! 3361: STQF_R	-	%f7, [%r2, %r31]
	.word 0x8d9020c9  ! 3362: WRPR_PSTATE_I	wrpr	%r0, 0x00c9, %pstate
	.word 0x24800001  ! 3363: BLE	ble,a	<label_0x1>
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81982a13  ! 3365: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a13, %hpstate
	mov 0x30, %r30
	.word 0x93d0001e  ! 3366: Tcc_R	tne	icc_or_xcc, %r0 + %r30
DS_173:
	.word 0x34800001  ! 3368: BG	bg,a	<label_0x1>
	illtrap
	.word 0x85b0030c  ! 3367: ALLIGNADDRESS	alignaddr	%r0, %r12, %r2
	.word 0xc4800ba0  ! 3368: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r2
	.word 0x8d902c1d  ! 3369: WRPR_PSTATE_I	wrpr	%r0, 0x0c1d, %pstate
	.word 0xc4dfe030  ! 3370: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r2
	mov 0x31, %r30
	.word 0x97d0001e  ! 3371: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x8198215e  ! 3372: WRHPR_HPSTATE_I	wrhpr	%r0, 0x015e, %hpstate
	.word 0x81982e0c  ! 3373: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e0c, %hpstate
	.word 0x8198241a  ! 3374: WRHPR_HPSTATE_I	wrhpr	%r0, 0x041a, %hpstate
	.word 0x9603a001  ! 3375: ADD_I	add 	%r14, 0x0001, %r11
	mov 0x32, %r30
	.word 0x83d0001e  ! 3376: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd6d7e020  ! 3377: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r11
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x819826d9  ! 3381: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06d9, %hpstate
	.word 0xd7e7c02c  ! 3382: CASA_I	casa	[%r31] 0x 1, %r12, %r11
	.word 0x8d802000  ! 3383: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd6c804a0  ! 3384: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r11
	.word 0x8f50c000  ! 3385: RDPR_TT	rdpr	%tt, %r7
	.word 0xce9fe001  ! 3386: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r7
	.word 0x83a389a3  ! 3387: FDIVs	fdivs	%f14, %f3, %f1
	.word 0x87a289c0  ! 3388: FDIVd	fdivd	%f10, %f0, %f34
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87a349e1  ! 3390: FDIVq	dis not found

	.word 0x9fa089cf  ! 3391: FDIVd	fdivd	%f2, %f46, %f46
	.word 0x8c82a001  ! 3392: ADDcc_I	addcc 	%r10, 0x0001, %r6
	mov 0x32, %r30
	.word 0x87d0001e  ! 3393: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x93d02034  ! 3394: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x81a000cb  ! 3395: FNEGd	fnegd	%f42, %f0
DS_174:
	.word 0x34800001  ! 3397: BG	bg,a	<label_0x1>
	.word 0xcd330008  ! 3397: STQF_R	-	%f6, [%r8, %r12]
	.word 0x9b458000  ! 3396: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0xda2fe001  ! 3397: STB_I	stb	%r13, [%r31 + 0x0001]
	.word 0x8d802000  ! 3398: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9950c000  ! 3399: RDPR_TT	rdpr	%tt, %r12
	.word 0xd84fe001  ! 3400: LDSB_I	ldsb	[%r31 + 0x0001], %r12
	.word 0x9fd02032  ! 3401: Tcc_I	tvc	icc_or_xcc, %r0 + 50
DS_175:
	.word 0x22800001  ! 3403: BE	be,a	<label_0x1>
	illtrap
	.word 0x9db34304  ! 3402: ALLIGNADDRESS	alignaddr	%r13, %r4, %r14
	.word 0xdcc80e60  ! 3403: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r14
	.word 0xdc800bc0  ! 3404: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r14
	.word 0x8d902e5b  ! 3405: WRPR_PSTATE_I	wrpr	%r0, 0x0e5b, %pstate
	.word 0x3c700001  ! 3406: BPPOS	<illegal instruction>
	.word 0x34700001  ! 3407: BPG	<illegal instruction>
	.word 0x87802004  ! 3408: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x83480000  ! 3409: RDHPR_HPSTATE	rdhpr	%hpstate, %r1
	.word 0x97692001  ! 3410: SDIVX_I	sdivx	%r4, 0x0001, %r11
	.word 0x966ba001  ! 3411: UDIVX_I	udivx 	%r14, 0x0001, %r11
	.word 0x8d902ac2  ! 3412: WRPR_PSTATE_I	wrpr	%r0, 0x0ac2, %pstate
	.word 0x8ed90002  ! 3413: SMULcc_R	smulcc 	%r4, %r2, %r7
	.word 0xcfe7c022  ! 3414: CASA_I	casa	[%r31] 0x 1, %r2, %r7
	mov 0x33, %r30
	.word 0x8dd0001e  ! 3415: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0xce57e001  ! 3416: LDSH_I	ldsh	[%r31 + 0x0001], %r7
	.word 0x8d902804  ! 3417: WRPR_PSTATE_I	wrpr	%r0, 0x0804, %pstate
	.word 0xcfe7c022  ! 3418: CASA_I	casa	[%r31] 0x 1, %r2, %r7
	.word 0x87802016  ! 3419: WRASI_I	wr	%r0, 0x0016, %asi
DS_176:
	.word 0x22800001  ! 3421: BE	be,a	<label_0x1>
	.word 0xd9326001  ! 3421: STQF_I	-	%f12, [0x0001, %r9]
	.word 0x99458000  ! 3420: RD_SOFTINT_REG	rd	%softint, %r12
DS_177:
	.word 0x34800001  ! 3422: BG	bg,a	<label_0x1>
	illtrap
	.word 0x87b0030e  ! 3421: ALLIGNADDRESS	alignaddr	%r0, %r14, %r3
	.word 0xc6ffc02e  ! 3422: SWAPA_R	swapa	%r3, [%r31 + %r14] 0x01
DS_178:
	.word 0x34800001  ! 3424: BG	bg,a	<label_0x1>
	.word 0xdb31e001  ! 3424: STQF_I	-	%f13, [0x0001, %r7]
	.word 0x8f458000  ! 3423: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0xcec7e010  ! 3424: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r7
	.word 0xcf97e001  ! 3425: LDQFA_I	-	[%r31, 0x0001], %f7
	.word 0x28700001  ! 3426: BPLEU	<illegal instruction>
	.word 0x87802016  ! 3427: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x20700001  ! 3428: BPN	<illegal instruction>
	.word 0x81982080  ! 3429: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0080, %hpstate
	.word 0x91a349e9  ! 3430: FDIVq	dis not found

	.word 0xd027e001  ! 3431: STW_I	stw	%r8, [%r31 + 0x0001]
	.word 0x3e700001  ! 3432: BPVC	<illegal instruction>
	.word 0x8d902203  ! 3433: WRPR_PSTATE_I	wrpr	%r0, 0x0203, %pstate
	.word 0x8ba249a8  ! 3434: FDIVs	fdivs	%f9, %f8, %f5
	.word 0x2c800001  ! 3435: BNEG	bneg,a	<label_0x1>
	.word 0x81982d5e  ! 3436: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d5e, %hpstate
	.word 0x20700001  ! 3437: BPN	<illegal instruction>
	.word 0x819822ce  ! 3438: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02ce, %hpstate
	.word 0xcaffc028  ! 3439: SWAPA_R	swapa	%r5, [%r31 + %r8] 0x01
	.word 0xcad7e030  ! 3440: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r5
	.word 0xcabfe001  ! 3441: STDA_I	stda	%r5, [%r31 + 0x0001] %asi
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8e78c00a  ! 3443: SDIV_R	sdiv 	%r3, %r10, %r7
	.word 0x81982397  ! 3444: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0397, %hpstate
	.word 0x819823db  ! 3445: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03db, %hpstate
	.word 0x9a538004  ! 3446: UMUL_R	umul 	%r14, %r4, %r13
	.word 0x99d02035  ! 3447: Tcc_I	tgu	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_NONPRIV	! macro
DS_179:
	.word 0x22800001  ! 3450: BE	be,a	<label_0x1>
	illtrap
	.word 0x97b2830d  ! 3449: ALLIGNADDRESS	alignaddr	%r10, %r13, %r11
	.word 0x2c700001  ! 3450: BPNEG	<illegal instruction>
	.word 0x8d902ac1  ! 3451: WRPR_PSTATE_I	wrpr	%r0, 0x0ac1, %pstate
	.word 0x8d802000  ! 3452: WRFPRS_I	wr	%r0, 0x0000, %fprs
	mov 0x35, %r30
	.word 0x8fd0001e  ! 3453: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x8cd22001  ! 3454: UMULcc_I	umulcc 	%r8, 0x0001, %r6
	.word 0x8d802000  ! 3455: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d902e9f  ! 3456: WRPR_PSTATE_I	wrpr	%r0, 0x0e9f, %pstate
	mov 0x30, %r30
	.word 0x81d0001e  ! 3457: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x30800001  ! 3458: BA	ba,a	<label_0x1>
	.word 0x85d02031  ! 3459: Tcc_I	tle	icc_or_xcc, %r0 + 49
	.word 0xcc5fe001  ! 3460: LDX_I	ldx	[%r31 + 0x0001], %r6
	.word 0x91d02035  ! 3461: Tcc_I	ta	icc_or_xcc, %r0 + 53
DS_180:
	.word 0x34800001  ! 3463: BG	bg,a	<label_0x1>
	.word 0xc733800e  ! 3463: STQF_R	-	%f3, [%r14, %r14]
	.word 0x93458000  ! 3462: RD_SOFTINT_REG	rd	%softint, %r9
	mov 0x34, %r30
	.word 0x9dd0001e  ! 3463: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x2a800001  ! 3464: BCS	bcs,a	<label_0x1>
	.word 0x9da00564  ! 3465: FSQRTq	fsqrt	
	.word 0xdc9fc020  ! 3466: LDDA_R	ldda	[%r31, %r0] 0x01, %r14
	.word 0x86686001  ! 3467: UDIVX_I	udivx 	%r1, 0x0001, %r3
	.word 0x8d902c18  ! 3468: WRPR_PSTATE_I	wrpr	%r0, 0x0c18, %pstate
	.word 0x3c700001  ! 3469: BPPOS	<illegal instruction>
	.word 0x8079a001  ! 3470: SDIV_I	sdiv 	%r6, 0x0001, %r0
	mov 0x33, %r30
	.word 0x9bd0001e  ! 3471: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x93d02031  ! 3472: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x819825d2  ! 3473: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05d2, %hpstate
	.word 0xc037e001  ! 3474: STH_I	sth	%r0, [%r31 + 0x0001]
DS_181:
	.word 0x34800001  ! 3476: BG	bg,a	<label_0x1>
	illtrap
	.word 0x9db3c303  ! 3475: ALLIGNADDRESS	alignaddr	%r15, %r3, %r14
DS_182:
	.word 0x34800001  ! 3477: BG	bg,a	<label_0x1>
	.word 0xd131800f  ! 3477: STQF_R	-	%f8, [%r15, %r6]
	.word 0x8f458000  ! 3476: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0x99504000  ! 3477: RDPR_TNPC	rdpr	%tnpc, %r12
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d90224a  ! 3479: WRPR_PSTATE_I	wrpr	%r0, 0x024a, %pstate
	.word 0x886ac007  ! 3480: UDIVX_R	udivx 	%r11, %r7, %r4
	.word 0x87802088  ! 3481: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8c496001  ! 3482: MULX_I	mulx 	%r5, 0x0001, %r6
	.word 0x8d802004  ! 3483: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x9ba00567  ! 3484: FSQRTq	fsqrt	
	.word 0x87802080  ! 3485: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x986a0001  ! 3486: UDIVX_R	udivx 	%r8, %r1, %r12
	.word 0x97a01a6d  ! 3487: FqTOi	fqtoi	
	.word 0x88538003  ! 3488: UMUL_R	umul 	%r14, %r3, %r4
	.word 0x8d902297  ! 3489: WRPR_PSTATE_I	wrpr	%r0, 0x0297, %pstate
	.word 0xc8cfe010  ! 3490: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r4
	.word 0x81982557  ! 3491: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0557, %hpstate
	.word 0xc817e001  ! 3492: LDUH_I	lduh	[%r31 + 0x0001], %r4
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d902a44  ! 3494: WRPR_PSTATE_I	wrpr	%r0, 0x0a44, %pstate
	.word 0x8eda400b  ! 3495: SMULcc_R	smulcc 	%r9, %r11, %r7
	.word 0x98690001  ! 3496: UDIVX_R	udivx 	%r4, %r1, %r12
	ta	T_CHANGE_PRIV	! macro
	.word 0x8ba0c9cb  ! 3498: FDIVd	fdivd	%f34, %f42, %f36
	.word 0x8d902acd  ! 3499: WRPR_PSTATE_I	wrpr	%r0, 0x0acd, %pstate
	mov 0x32, %r30
	.word 0x8bd0001e  ! 3500: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0xcad80e40  ! 3502: LDXA_R	ldxa	[%r0, %r0] 0x72, %r5
	.word 0xcb37e001  ! 3503: STQF_I	-	%f5, [0x0001, %r31]
	.word 0xca9fe001  ! 3504: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r5
	.word 0xca17c000  ! 3505: LDUH_R	lduh	[%r31 + %r0], %r5
	mov 0x30, %r30
	.word 0x81d0001e  ! 3506: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x8d902ec3  ! 3507: WRPR_PSTATE_I	wrpr	%r0, 0x0ec3, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0xca1fe001  ! 3509: LDD_I	ldd	[%r31 + 0x0001], %r5
	.word 0x26700001  ! 3510: BPL	<illegal instruction>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xca900e80  ! 3512: LDUHA_R	lduha	[%r0, %r0] 0x74, %r5
	ta	T_CHANGE_PRIV	! macro
	.word 0x987a6001  ! 3514: SDIV_I	sdiv 	%r9, 0x0001, %r12
	.word 0x9c78c007  ! 3515: SDIV_R	sdiv 	%r3, %r7, %r14
	.word 0x9fd02031  ! 3516: Tcc_I	tvc	icc_or_xcc, %r0 + 49
	.word 0x8d90269d  ! 3517: WRPR_PSTATE_I	wrpr	%r0, 0x069d, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
DS_183:
	.word 0x32800001  ! 3520: BNE	bne,a	<label_0x1>
	.word 0xdb304004  ! 3520: STQF_R	-	%f13, [%r4, %r1]
	.word 0x9d458000  ! 3519: RD_SOFTINT_REG	rd	%softint, %r14
	.word 0x8d902690  ! 3520: WRPR_PSTATE_I	wrpr	%r0, 0x0690, %pstate
	.word 0x83508000  ! 3521: RDPR_TSTATE	rdpr	%tstate, %r1
	.word 0x9dd02030  ! 3522: Tcc_I	tpos	icc_or_xcc, %r0 + 48
	.word 0x95480000  ! 3523: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
	.word 0x95a01a6b  ! 3524: FqTOi	fqtoi	
	.word 0x88d8800d  ! 3525: SMULcc_R	smulcc 	%r2, %r13, %r4
	.word 0xc937e001  ! 3526: STQF_I	-	%f4, [0x0001, %r31]
	.word 0x9e68000b  ! 3527: UDIVX_R	udivx 	%r0, %r11, %r15
	.word 0x804be001  ! 3528: MULX_I	mulx 	%r15, 0x0001, %r0
	.word 0x30700001  ! 3529: BPA	<illegal instruction>
	.word 0x9849000b  ! 3530: MULX_R	mulx 	%r4, %r11, %r12
	.word 0x819820c7  ! 3531: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00c7, %hpstate
	mov 0x35, %r30
	.word 0x8fd0001e  ! 3532: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x87802080  ! 3533: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xd80fe001  ! 3534: LDUB_I	ldub	[%r31 + 0x0001], %r12
	.word 0x8d902289  ! 3535: WRPR_PSTATE_I	wrpr	%r0, 0x0289, %pstate
	.word 0x81982fc5  ! 3536: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fc5, %hpstate
	.word 0xd8c7e000  ! 3537: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r12
	.word 0x85480000  ! 3538: RDHPR_HPSTATE	rdhpr	%hpstate, %r2
	.word 0x81514000  ! 3539: RDPR_TBA	rdpr	%tba, %r0
	.word 0xc127c00b  ! 3540: STF_R	st	%f0, [%r11, %r31]
	ta	T_CHANGE_NONHPRIV	! macro
	mov 0x34, %r30
	.word 0x9dd0001e  ! 3542: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x9fa0054f  ! 3543: FSQRTd	fsqrt	
	.word 0x8da0056e  ! 3544: FSQRTq	fsqrt	
	.word 0xcc880e80  ! 3545: LDUBA_R	lduba	[%r0, %r0] 0x74, %r6
	.word 0x86006001  ! 3546: ADD_I	add 	%r1, 0x0001, %r3
	.word 0xc68fe030  ! 3547: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r3
	.word 0x964b2001  ! 3548: MULX_I	mulx 	%r12, 0x0001, %r11
	.word 0xd65fe001  ! 3549: LDX_I	ldx	[%r31 + 0x0001], %r11
	.word 0x8d802004  ! 3550: WRFPRS_I	wr	%r0, 0x0004, %fprs
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902e87  ! 3552: WRPR_PSTATE_I	wrpr	%r0, 0x0e87, %pstate
	.word 0x26700001  ! 3553: BPL	<illegal instruction>
	.word 0xd6cfe020  ! 3554: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r11
	.word 0x9f6b4009  ! 3555: SDIVX_R	sdivx	%r13, %r9, %r15
	.word 0xde900e60  ! 3556: LDUHA_R	lduha	[%r0, %r0] 0x73, %r15
	.word 0x816b6001  ! 3557: SDIVX_I	sdivx	%r13, 0x0001, %r0
	.word 0xc0d004a0  ! 3558: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r0
	.word 0x9369c002  ! 3559: SDIVX_R	sdivx	%r7, %r2, %r9
	.word 0x99d02030  ! 3560: Tcc_I	tgu	icc_or_xcc, %r0 + 48
	.word 0x85d02031  ! 3561: Tcc_I	tle	icc_or_xcc, %r0 + 49
	.word 0x99a01a6b  ! 3562: FqTOi	fqtoi	
	mov 0x30, %r30
	.word 0x8fd0001e  ! 3563: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	mov 0x34, %r30
	.word 0x85d0001e  ! 3564: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x86810004  ! 3565: ADDcc_R	addcc 	%r4, %r4, %r3
	mov 0x30, %r30
	.word 0x97d0001e  ! 3566: Tcc_R	tge	icc_or_xcc, %r0 + %r30
DS_184:
	.word 0x22800001  ! 3568: BE	be,a	<label_0x1>
	.word 0xc733a001  ! 3568: STQF_I	-	%f3, [0x0001, %r14]
	.word 0x81458000  ! 3567: RD_SOFTINT_REG	stbar
DS_185:
	.word 0x22800001  ! 3569: BE	be,a	<label_0x1>
	.word 0xdd316001  ! 3569: STQF_I	-	%f14, [0x0001, %r5]
	.word 0x8f458000  ! 3568: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0x9048e001  ! 3569: MULX_I	mulx 	%r3, 0x0001, %r8
	mov 0x33, %r30
	.word 0x9fd0001e  ! 3570: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x8881000b  ! 3571: ADDcc_R	addcc 	%r4, %r11, %r4
	.word 0x816b2001  ! 3572: SDIVX_I	sdivx	%r12, 0x0001, %r0
	.word 0xc13fe001  ! 3573: STDF_I	std	%f0, [0x0001, %r31]
	.word 0x87802080  ! 3574: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x8fa000ca  ! 3575: FNEGd	fnegd	%f10, %f38
	.word 0xce27c00a  ! 3576: STW_R	stw	%r7, [%r31 + %r10]
	.word 0x81982d4b  ! 3577: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d4b, %hpstate
	.word 0x8d902803  ! 3578: WRPR_PSTATE_I	wrpr	%r0, 0x0803, %pstate
	.word 0x8d9026cf  ! 3579: WRPR_PSTATE_I	wrpr	%r0, 0x06cf, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xce7fe001  ! 3582: SWAP_I	swap	%r7, [%r31 + 0x0001]
	.word 0x8d802000  ! 3583: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982697  ! 3584: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0697, %hpstate
	.word 0x8d902405  ! 3585: WRPR_PSTATE_I	wrpr	%r0, 0x0405, %pstate
	mov 0x30, %r30
	.word 0x95d0001e  ! 3586: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x9401e001  ! 3587: ADD_I	add 	%r7, 0x0001, %r10
	mov 0x32, %r30
	.word 0x89d0001e  ! 3588: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x87802016  ! 3589: WRASI_I	wr	%r0, 0x0016, %asi
DS_186:
	.word 0x20800001  ! 3591: BN	bn,a	<label_0x1>
	illtrap
	.word 0x81b28301  ! 3590: ALLIGNADDRESS	alignaddr	%r10, %r1, %r0
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc07fe001  ! 3592: SWAP_I	swap	%r0, [%r31 + 0x0001]
	.word 0x8d802000  ! 3593: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc0c80e40  ! 3594: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r0
	mov 0x31, %r30
	.word 0x95d0001e  ! 3595: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x28800001  ! 3596: BLEU	bleu,a	<label_0x1>
DS_187:
	.word 0x20800001  ! 3598: BN	bn,a	<label_0x1>
	.word 0xc1324006  ! 3598: STQF_R	-	%f0, [%r6, %r9]
	.word 0x9b458000  ! 3597: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x8d90209b  ! 3598: WRPR_PSTATE_I	wrpr	%r0, 0x009b, %pstate
	.word 0x8d90284a  ! 3599: WRPR_PSTATE_I	wrpr	%r0, 0x084a, %pstate
	.word 0x8d902a8b  ! 3600: WRPR_PSTATE_I	wrpr	%r0, 0x0a8b, %pstate
	.word 0x8d802000  ! 3601: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_PRIV	! macro
	mov 0x31, %r30
	.word 0x93d0001e  ! 3603: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	mov 0x34, %r30
	.word 0x93d0001e  ! 3604: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0x95d02033  ! 3606: Tcc_I	tg	icc_or_xcc, %r0 + 51
	.word 0x81982bc5  ! 3607: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc5, %hpstate
	.word 0x20700001  ! 3608: BPN	<illegal instruction>
	.word 0xda800ac0  ! 3609: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r13
	.word 0x91a109eb  ! 3610: FDIVq	dis not found

DS_188:
	.word 0x32800001  ! 3612: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x87b08309  ! 3611: ALLIGNADDRESS	alignaddr	%r2, %r9, %r3
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xc6c7e030  ! 3613: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r3
	.word 0x8d802004  ! 3614: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x81982c17  ! 3615: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c17, %hpstate
DS_189:
	.word 0x22800001  ! 3617: BE	be,a	<label_0x1>
	illtrap
	.word 0x97b2030d  ! 3616: ALLIGNADDRESS	alignaddr	%r8, %r13, %r11
	.word 0x81982b43  ! 3617: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b43, %hpstate
	.word 0x836a4004  ! 3618: SDIVX_R	sdivx	%r9, %r4, %r1
	.word 0x824b800d  ! 3619: MULX_R	mulx 	%r14, %r13, %r1
	.word 0x3a700001  ! 3620: BPCC	<illegal instruction>
	mov 0x33, %r30
	.word 0x8bd0001e  ! 3621: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x81982951  ! 3622: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0951, %hpstate
	.word 0x8669c00f  ! 3623: UDIVX_R	udivx 	%r7, %r15, %r3
	.word 0x9269c00c  ! 3624: UDIVX_R	udivx 	%r7, %r12, %r9
	.word 0x8f51c000  ! 3625: RDPR_TL	rdpr	%tl, %r7
	.word 0xce800b60  ! 3626: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r7
	mov 0x31, %r30
	.word 0x8dd0001e  ! 3627: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d902616  ! 3630: WRPR_PSTATE_I	wrpr	%r0, 0x0616, %pstate
	.word 0xce8008a0  ! 3631: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x30700001  ! 3632: BPA	<illegal instruction>
	mov 0x34, %r30
	.word 0x93d0001e  ! 3633: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x81982f4e  ! 3634: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f4e, %hpstate
	.word 0x30700001  ! 3635: BPA	<illegal instruction>
	ta	T_CHANGE_NONPRIV	! macro
DS_190:
	.word 0x20800001  ! 3638: BN	bn,a	<label_0x1>
	.word 0xdb31e001  ! 3638: STQF_I	-	%f13, [0x0001, %r7]
	.word 0x89458000  ! 3637: RD_SOFTINT_REG	rd	%softint, %r4
	.word 0x9002e001  ! 3638: ADD_I	add 	%r11, 0x0001, %r8
	.word 0x97d02032  ! 3639: Tcc_I	tge	icc_or_xcc, %r0 + 50
	.word 0xd0d7e000  ! 3640: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r8
	.word 0x87802010  ! 3641: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x8fa209c7  ! 3642: FDIVd	fdivd	%f8, %f38, %f38
	mov 0x31, %r30
	.word 0x95d0001e  ! 3643: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x95a0cd21  ! 3644: FsMULd	fsmuld	%f3, %f32, %f10
	.word 0x866b0005  ! 3645: UDIVX_R	udivx 	%r12, %r5, %r3
	mov 0x32, %r30
	.word 0x9fd0001e  ! 3646: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x8d902a18  ! 3647: WRPR_PSTATE_I	wrpr	%r0, 0x0a18, %pstate
	.word 0x8d902e48  ! 3648: WRPR_PSTATE_I	wrpr	%r0, 0x0e48, %pstate
	.word 0x8d902813  ! 3649: WRPR_PSTATE_I	wrpr	%r0, 0x0813, %pstate
	.word 0xc6dfe000  ! 3650: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r3
	.word 0x98788001  ! 3651: SDIV_R	sdiv 	%r2, %r1, %r12
	.word 0x95514000  ! 3652: RDPR_TBA	rdpr	%tba, %r10
	.word 0xd4c004a0  ! 3653: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
	.word 0xd497e020  ! 3654: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r10
	.word 0xd497e030  ! 3655: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r10
	.word 0x95d02034  ! 3656: Tcc_I	tg	icc_or_xcc, %r0 + 52
	.word 0x8d902c8b  ! 3657: WRPR_PSTATE_I	wrpr	%r0, 0x0c8b, %pstate
	.word 0x87802016  ! 3658: WRASI_I	wr	%r0, 0x0016, %asi
DS_191:
	.word 0x34800001  ! 3660: BG	bg,a	<label_0x1>
	.word 0xdd318002  ! 3660: STQF_R	-	%f14, [%r2, %r6]
	.word 0x85458000  ! 3659: RD_SOFTINT_REG	rd	%softint, %r2
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc4900e40  ! 3661: LDUHA_R	lduha	[%r0, %r0] 0x72, %r2
	ta	T_CHANGE_PRIV	! macro
	.word 0xc4cfe000  ! 3663: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r2
	.word 0x85a00548  ! 3664: FSQRTd	fsqrt	
	mov 0x33, %r30
	.word 0x9fd0001e  ! 3665: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x81982fdb  ! 3666: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fdb, %hpstate
DS_192:
	.word 0x20800001  ! 3668: BN	bn,a	<label_0x1>
	illtrap
	.word 0x99b2c308  ! 3667: ALLIGNADDRESS	alignaddr	%r11, %r8, %r12
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d902097  ! 3669: WRPR_PSTATE_I	wrpr	%r0, 0x0097, %pstate
	.word 0x9cd0a001  ! 3670: UMULcc_I	umulcc 	%r2, 0x0001, %r14
	.word 0x8d902617  ! 3671: WRPR_PSTATE_I	wrpr	%r0, 0x0617, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x9ad06001  ! 3673: UMULcc_I	umulcc 	%r1, 0x0001, %r13
	.word 0x8451400b  ! 3674: UMUL_R	umul 	%r5, %r11, %r2
	.word 0x9c7ba001  ! 3675: SDIV_I	sdiv 	%r14, 0x0001, %r14
	.word 0x93a00d2c  ! 3676: FsMULd	fsmuld	%f0, %f12, %f40
	.word 0xd2c7e010  ! 3677: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r9
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8c828007  ! 3680: ADDcc_R	addcc 	%r10, %r7, %r6
	.word 0xcc5fe001  ! 3681: LDX_I	ldx	[%r31 + 0x0001], %r6
	.word 0x8b500000  ! 3682: RDPR_TPC	rdpr	%tpc, %r5
	.word 0x8f504000  ! 3683: RDPR_TNPC	rdpr	%tnpc, %r7
	.word 0x8d902c9c  ! 3684: WRPR_PSTATE_I	wrpr	%r0, 0x0c9c, %pstate
	.word 0x82da8003  ! 3685: SMULcc_R	smulcc 	%r10, %r3, %r1
	.word 0x81982a16  ! 3686: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a16, %hpstate
	mov 0x33, %r30
	.word 0x85d0001e  ! 3687: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902208  ! 3689: WRPR_PSTATE_I	wrpr	%r0, 0x0208, %pstate
	.word 0x9481000f  ! 3690: ADDcc_R	addcc 	%r4, %r15, %r10
	.word 0x85d02034  ! 3691: Tcc_I	tle	icc_or_xcc, %r0 + 52
	.word 0x87802004  ! 3692: WRASI_I	wr	%r0, 0x0004, %asi
	ta	T_CHANGE_PRIV	! macro
	mov 0x33, %r30
	.word 0x8bd0001e  ! 3694: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x8d902288  ! 3695: WRPR_PSTATE_I	wrpr	%r0, 0x0288, %pstate
	.word 0x9d6b8001  ! 3696: SDIVX_R	sdivx	%r14, %r1, %r14
	mov 0x30, %r30
	.word 0x95d0001e  ! 3697: Tcc_R	tg	icc_or_xcc, %r0 + %r30
DS_193:
	.word 0x34800001  ! 3699: BG	bg,a	<label_0x1>
	.word 0xcd30800c  ! 3699: STQF_R	-	%f6, [%r12, %r2]
	.word 0x89458000  ! 3698: RD_SOFTINT_REG	rd	%softint, %r4
	.word 0xc89004a0  ! 3699: LDUHA_R	lduha	[%r0, %r0] 0x25, %r4
	.word 0x8da00543  ! 3700: FSQRTd	fsqrt	
	.word 0x36700001  ! 3701: BPGE	<illegal instruction>
	.word 0x81982647  ! 3702: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0647, %hpstate
	.word 0x22800001  ! 3703: BE	be,a	<label_0x1>
	.word 0x8d90289e  ! 3704: WRPR_PSTATE_I	wrpr	%r0, 0x089e, %pstate
	.word 0x97480000  ! 3705: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x3a700001  ! 3707: BPCC	<illegal instruction>
	mov 0x32, %r30
	.word 0x9bd0001e  ! 3708: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0xd6d004a0  ! 3709: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r11
	.word 0x98016001  ! 3710: ADD_I	add 	%r5, 0x0001, %r12
	.word 0xd9e7c023  ! 3711: CASA_I	casa	[%r31] 0x 1, %r3, %r12
	.word 0xd8cfe020  ! 3712: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r12
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
DS_194:
	.word 0x22800001  ! 3716: BE	be,a	<label_0x1>
	.word 0xd332c002  ! 3716: STQF_R	-	%f9, [%r2, %r11]
	.word 0x93458000  ! 3715: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x81982c90  ! 3716: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c90, %hpstate
	.word 0xd23fc002  ! 3717: STD_R	std	%r9, [%r31 + %r2]
	.word 0x819826d5  ! 3718: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06d5, %hpstate
	.word 0x8e52800e  ! 3719: UMUL_R	umul 	%r10, %r14, %r7
	mov 0x30, %r30
	.word 0x9dd0001e  ! 3720: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0xcec00e40  ! 3721: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r7
	.word 0xce8008a0  ! 3722: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x8a4bc008  ! 3723: MULX_R	mulx 	%r15, %r8, %r5
	mov 0x30, %r30
	.word 0x99d0001e  ! 3724: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x22700001  ! 3725: BPE	<illegal instruction>
	.word 0xca37e001  ! 3726: STH_I	sth	%r5, [%r31 + 0x0001]
	.word 0x3c700001  ! 3727: BPPOS	<illegal instruction>
	.word 0x8d90209f  ! 3728: WRPR_PSTATE_I	wrpr	%r0, 0x009f, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87802004  ! 3731: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x81982edb  ! 3732: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0edb, %hpstate
	.word 0xca800ba0  ! 3733: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r5
	.word 0x8c83e001  ! 3734: ADDcc_I	addcc 	%r15, 0x0001, %r6
	mov 0x30, %r30
	.word 0x85d0001e  ! 3735: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x8081800f  ! 3736: ADDcc_R	addcc 	%r6, %r15, %r0
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xc137e001  ! 3738: STQF_I	-	%f0, [0x0001, %r31]
	.word 0x856a8004  ! 3739: SDIVX_R	sdivx	%r10, %r4, %r2
DS_195:
	.word 0x20800001  ! 3741: BN	bn,a	<label_0x1>
	illtrap
	.word 0x89b0c303  ! 3740: ALLIGNADDRESS	alignaddr	%r3, %r3, %r4
	.word 0x8dd02035  ! 3741: Tcc_I	tneg	icc_or_xcc, %r0 + 53
	mov 0x34, %r30
	.word 0x95d0001e  ! 3742: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x89504000  ! 3743: RDPR_TNPC	rdpr	%tnpc, %r4
	.word 0x9fa00547  ! 3744: FSQRTd	fsqrt	
	.word 0x8d50c000  ! 3745: RDPR_TT	rdpr	%tt, %r6
	.word 0x3e800001  ! 3746: BVC	bvc,a	<label_0x1>
	mov 0x30, %r30
	.word 0x9dd0001e  ! 3747: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
	mov 0x33, %r30
	.word 0x9bd0001e  ! 3749: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0xcc1fc000  ! 3750: LDD_R	ldd	[%r31 + %r0], %r6
	.word 0x98684002  ! 3751: UDIVX_R	udivx 	%r1, %r2, %r12
	.word 0x81a00562  ! 3752: FSQRTq	fsqrt	
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d50c000  ! 3754: RDPR_TT	rdpr	%tt, %r6
	.word 0x8d802000  ! 3755: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d802000  ! 3756: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x32700001  ! 3757: BPNE	<illegal instruction>
	.word 0x85a00568  ! 3758: FSQRTq	fsqrt	
	.word 0x8d90264b  ! 3759: WRPR_PSTATE_I	wrpr	%r0, 0x064b, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xc4dfe030  ! 3761: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r2
	.word 0x8d9026d3  ! 3762: WRPR_PSTATE_I	wrpr	%r0, 0x06d3, %pstate
	.word 0x8d902e19  ! 3763: WRPR_PSTATE_I	wrpr	%r0, 0x0e19, %pstate
	.word 0x87802004  ! 3764: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87802089  ! 3765: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x9d50c000  ! 3766: RDPR_TT	rdpr	%tt, %r14
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87500000  ! 3768: RDPR_TPC	rdpr	%tpc, %r3
	.word 0x9369c002  ! 3769: SDIVX_R	sdivx	%r7, %r2, %r9
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d802004  ! 3771: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x87802080  ! 3772: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x93a00566  ! 3773: FSQRTq	fsqrt	
	.word 0x81982a0c  ! 3774: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a0c, %hpstate
	.word 0x9c52000c  ! 3775: UMUL_R	umul 	%r8, %r12, %r14
	.word 0x81982bcf  ! 3776: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bcf, %hpstate
	.word 0xdde7c02c  ! 3777: CASA_I	casa	[%r31] 0x 1, %r12, %r14
	.word 0x28800001  ! 3778: BLEU	bleu,a	<label_0x1>
	.word 0x91a10dca  ! 3779: FdMULq	fdmulq	
	.word 0x8d90241d  ! 3780: WRPR_PSTATE_I	wrpr	%r0, 0x041d, %pstate
	.word 0xd197e001  ! 3781: LDQFA_I	-	[%r31, 0x0001], %f8
	.word 0xd0d804a0  ! 3782: LDXA_R	ldxa	[%r0, %r0] 0x25, %r8
	.word 0x99d02033  ! 3783: Tcc_I	tgu	icc_or_xcc, %r0 + 51
	.word 0x8bd02032  ! 3784: Tcc_I	tcs	icc_or_xcc, %r0 + 50
	.word 0xd05fc000  ! 3785: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xd0800ac0  ! 3786: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r8
	.word 0xd09fe001  ! 3787: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r8
DS_196:
	.word 0x34800001  ! 3789: BG	bg,a	<label_0x1>
	illtrap
	.word 0x95b04308  ! 3788: ALLIGNADDRESS	alignaddr	%r1, %r8, %r10
	.word 0xd4c004a0  ! 3789: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
	.word 0x89d02030  ! 3790: Tcc_I	tleu	icc_or_xcc, %r0 + 48
	.word 0x8d902455  ! 3791: WRPR_PSTATE_I	wrpr	%r0, 0x0455, %pstate
	.word 0x8d902e8d  ! 3792: WRPR_PSTATE_I	wrpr	%r0, 0x0e8d, %pstate
	.word 0x88c22001  ! 3793: ADDCcc_I	addccc 	%r8, 0x0001, %r4
	.word 0x8ba0056d  ! 3794: FSQRTq	fsqrt	
	.word 0x8198279b  ! 3795: WRHPR_HPSTATE_I	wrhpr	%r0, 0x079b, %hpstate
	.word 0x8e6a2001  ! 3796: UDIVX_I	udivx 	%r8, 0x0001, %r7
	.word 0x81d02034  ! 3797: Tcc_I	tn	icc_or_xcc, %r0 + 52
	.word 0x84498008  ! 3798: MULX_R	mulx 	%r6, %r8, %r2
	.word 0x81982e9d  ! 3799: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e9d, %hpstate
	.word 0x8d9022d9  ! 3800: WRPR_PSTATE_I	wrpr	%r0, 0x02d9, %pstate
	.word 0x8d802000  ! 3801: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d902612  ! 3802: WRPR_PSTATE_I	wrpr	%r0, 0x0612, %pstate
	.word 0x8d902aca  ! 3803: WRPR_PSTATE_I	wrpr	%r0, 0x0aca, %pstate
	.word 0x97d02031  ! 3804: Tcc_I	tge	icc_or_xcc, %r0 + 49
	.word 0x8d802000  ! 3805: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8e00e001  ! 3806: ADD_I	add 	%r3, 0x0001, %r7
	.word 0x99d02035  ! 3807: Tcc_I	tgu	icc_or_xcc, %r0 + 53
	.word 0x9a482001  ! 3808: MULX_I	mulx 	%r0, 0x0001, %r13
	.word 0x2e700001  ! 3809: BPVS	<illegal instruction>
	.word 0x83a089c2  ! 3810: FDIVd	fdivd	%f2, %f2, %f32
	.word 0xc257c000  ! 3811: LDSH_R	ldsh	[%r31 + %r0], %r1
	.word 0xc2dfe000  ! 3812: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r1
	.word 0x81d02031  ! 3813: Tcc_I	tn	icc_or_xcc, %r0 + 49
	.word 0xc28008a0  ! 3814: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d802000  ! 3816: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982e4e  ! 3817: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e4e, %hpstate
	ta	T_CHANGE_PRIV	! macro
	mov 0x35, %r30
	.word 0x8fd0001e  ! 3819: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d902250  ! 3821: WRPR_PSTATE_I	wrpr	%r0, 0x0250, %pstate
	.word 0x96d88006  ! 3822: SMULcc_R	smulcc 	%r2, %r6, %r11
	.word 0x26700001  ! 3823: BPL	<illegal instruction>
	.word 0x8c80a001  ! 3824: ADDcc_I	addcc 	%r2, 0x0001, %r6
	.word 0x87d02031  ! 3825: Tcc_I	tl	icc_or_xcc, %r0 + 49
	.word 0x8603a001  ! 3826: ADD_I	add 	%r14, 0x0001, %r3
	.word 0x95508000  ! 3827: RDPR_TSTATE	rdpr	%tstate, %r10
	.word 0xd5e7c026  ! 3828: CASA_I	casa	[%r31] 0x 1, %r6, %r10
	.word 0x92d34008  ! 3829: UMULcc_R	umulcc 	%r13, %r8, %r9
	.word 0xd25fe001  ! 3830: LDX_I	ldx	[%r31 + 0x0001], %r9
	mov 0x31, %r30
	.word 0x9fd0001e  ! 3831: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x9881c00d  ! 3832: ADDcc_R	addcc 	%r7, %r13, %r12
	.word 0x8c002001  ! 3833: ADD_I	add 	%r0, 0x0001, %r6
	.word 0x81982444  ! 3834: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0444, %hpstate
	.word 0xcc27c00d  ! 3835: STW_R	stw	%r6, [%r31 + %r13]
	.word 0x3c800001  ! 3836: BPOS	bpos,a	<label_0x1>
	mov 0x34, %r30
	.word 0x89d0001e  ! 3837: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x86682001  ! 3838: UDIVX_I	udivx 	%r0, 0x0001, %r3
	.word 0xc737c00d  ! 3839: STQF_R	-	%f3, [%r13, %r31]
	.word 0x9f50c000  ! 3840: RDPR_TT	rdpr	%tt, %r15
	.word 0x887b8001  ! 3841: SDIV_R	sdiv 	%r14, %r1, %r4
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x87802004  ! 3843: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xc88008a0  ! 3844: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
	.word 0x85a00542  ! 3845: FSQRTd	fsqrt	
DS_197:
	.word 0x22800001  ! 3847: BE	be,a	<label_0x1>
	.word 0xc9302001  ! 3847: STQF_I	-	%f4, [0x0001, %r0]
	.word 0x93458000  ! 3846: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0xd28008a0  ! 3847: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x8f6b2001  ! 3848: SDIVX_I	sdivx	%r12, 0x0001, %r7
	.word 0x97a24d2c  ! 3849: FsMULd	fsmuld	%f9, %f12, %f42
	.word 0xd6900e40  ! 3850: LDUHA_R	lduha	[%r0, %r0] 0x72, %r11
	.word 0x8198269d  ! 3851: WRHPR_HPSTATE_I	wrhpr	%r0, 0x069d, %hpstate
	.word 0x86d14006  ! 3852: UMULcc_R	umulcc 	%r5, %r6, %r3
	.word 0x87802010  ! 3853: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x38700001  ! 3854: BPGU	<illegal instruction>
	.word 0xc657c000  ! 3855: LDSH_R	ldsh	[%r31 + %r0], %r3
	.word 0x8000a001  ! 3856: ADD_I	add 	%r2, 0x0001, %r0
	.word 0x8d902289  ! 3857: WRPR_PSTATE_I	wrpr	%r0, 0x0289, %pstate
	.word 0x94032001  ! 3858: ADD_I	add 	%r12, 0x0001, %r10
	.word 0xd4d80e40  ! 3859: LDXA_R	ldxa	[%r0, %r0] 0x72, %r10
DS_198:
	.word 0x34800001  ! 3861: BG	bg,a	<label_0x1>
	illtrap
	.word 0x8bb0c306  ! 3860: ALLIGNADDRESS	alignaddr	%r3, %r6, %r5
	.word 0x8c528004  ! 3861: UMUL_R	umul 	%r10, %r4, %r6
	.word 0xcc7fe001  ! 3862: SWAP_I	swap	%r6, [%r31 + 0x0001]
	.word 0x9478c001  ! 3863: SDIV_R	sdiv 	%r3, %r1, %r10
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba34dcc  ! 3865: FdMULq	fdmulq	
	.word 0x81982f11  ! 3866: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f11, %hpstate
	.word 0x97a109ad  ! 3867: FDIVs	fdivs	%f4, %f13, %f11
	.word 0x9c82e001  ! 3868: ADDcc_I	addcc 	%r11, 0x0001, %r14
	.word 0xdd27c00d  ! 3869: STF_R	st	%f14, [%r13, %r31]
	.word 0xdcc7e020  ! 3870: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r14
	mov 0x34, %r30
	.word 0x9dd0001e  ! 3871: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0xdcdfe010  ! 3872: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r14
	.word 0x8269c008  ! 3873: UDIVX_R	udivx 	%r7, %r8, %r1
	.word 0x97a3cdc5  ! 3874: FdMULq	fdmulq	
	.word 0x93a00540  ! 3875: FSQRTd	fsqrt	
	.word 0x8c496001  ! 3876: MULX_I	mulx 	%r5, 0x0001, %r6
DS_199:
	.word 0x20800001  ! 3878: BN	bn,a	<label_0x1>
	illtrap
	.word 0x8fb38302  ! 3877: ALLIGNADDRESS	alignaddr	%r14, %r2, %r7
	ta	T_CHANGE_NONHPRIV	! macro
DS_200:
	.word 0x22800001  ! 3880: BE	be,a	<label_0x1>
	illtrap
	.word 0x85b38308  ! 3879: ALLIGNADDRESS	alignaddr	%r14, %r8, %r2
	.word 0x86792001  ! 3880: SDIV_I	sdiv 	%r4, 0x0001, %r3
	mov 0x32, %r30
	.word 0x9dd0001e  ! 3881: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x8b68800b  ! 3882: SDIVX_R	sdivx	%r2, %r11, %r5
	mov 0x33, %r30
	.word 0x99d0001e  ! 3883: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x8d802004  ! 3884: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x81982f55  ! 3885: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f55, %hpstate
	.word 0x92d22001  ! 3886: UMULcc_I	umulcc 	%r8, 0x0001, %r9
	.word 0xd27fe001  ! 3887: SWAP_I	swap	%r9, [%r31 + 0x0001]
	.word 0x8d802000  ! 3888: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982bca  ! 3889: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bca, %hpstate
	.word 0xd28fe010  ! 3890: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r9
DS_201:
	.word 0x22800001  ! 3892: BE	be,a	<label_0x1>
	illtrap
	.word 0x9fb1c304  ! 3891: ALLIGNADDRESS	alignaddr	%r7, %r4, %r15
	.word 0x90d18003  ! 3892: UMULcc_R	umulcc 	%r6, %r3, %r8
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x32700001  ! 3894: BPNE	<illegal instruction>
	.word 0x9fa01a61  ! 3895: FqTOi	fqtoi	
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81982cce  ! 3897: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cce, %hpstate
	.word 0x96820001  ! 3898: ADDcc_R	addcc 	%r8, %r1, %r11
	.word 0x8198254f  ! 3899: WRHPR_HPSTATE_I	wrhpr	%r0, 0x054f, %hpstate
	.word 0xd737c001  ! 3900: STQF_R	-	%f11, [%r1, %r31]
	.word 0xd69004a0  ! 3901: LDUHA_R	lduha	[%r0, %r0] 0x25, %r11
	.word 0x32700001  ! 3902: BPNE	<illegal instruction>
	mov 0x30, %r30
	.word 0x9dd0001e  ! 3903: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0xd6ffc021  ! 3904: SWAPA_R	swapa	%r11, [%r31 + %r1] 0x01
	.word 0xd727e001  ! 3905: STF_I	st	%f11, [0x0001, %r31]
	mov 0x34, %r30
	.word 0x91d0001e  ! 3906: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d90284c  ! 3907: WRPR_PSTATE_I	wrpr	%r0, 0x084c, %pstate
	.word 0x89d02033  ! 3908: Tcc_I	tleu	icc_or_xcc, %r0 + 51
	.word 0x81982a55  ! 3909: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a55, %hpstate
	.word 0x9678a001  ! 3910: SDIV_I	sdiv 	%r2, 0x0001, %r11
	.word 0x81982d09  ! 3911: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d09, %hpstate
	.word 0x819827d1  ! 3912: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07d1, %hpstate
	.word 0x8198219c  ! 3913: WRHPR_HPSTATE_I	wrhpr	%r0, 0x019c, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x81982953  ! 3915: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0953, %hpstate
	.word 0x904a2001  ! 3916: MULX_I	mulx 	%r8, 0x0001, %r8
	.word 0x81982a58  ! 3917: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a58, %hpstate
	.word 0xd017c000  ! 3918: LDUH_R	lduh	[%r31 + %r0], %r8
	.word 0x8198208f  ! 3919: WRHPR_HPSTATE_I	wrhpr	%r0, 0x008f, %hpstate
	mov 0x32, %r30
	.word 0x8dd0001e  ! 3920: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x95d02034  ! 3921: Tcc_I	tg	icc_or_xcc, %r0 + 52
	.word 0x8d902a80  ! 3922: WRPR_PSTATE_I	wrpr	%r0, 0x0a80, %pstate
	.word 0x996bc005  ! 3923: SDIVX_R	sdivx	%r15, %r5, %r12
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9c504009  ! 3925: UMUL_R	umul 	%r1, %r9, %r14
	.word 0x8d902246  ! 3926: WRPR_PSTATE_I	wrpr	%r0, 0x0246, %pstate
	.word 0x28800001  ! 3927: BLEU	bleu,a	<label_0x1>
	.word 0xdcc004a0  ! 3928: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r14
	.word 0x8d802000  ! 3929: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xdcffc029  ! 3930: SWAPA_R	swapa	%r14, [%r31 + %r9] 0x01
	.word 0x8d902a80  ! 3931: WRPR_PSTATE_I	wrpr	%r0, 0x0a80, %pstate
	.word 0x9bd02031  ! 3932: Tcc_I	tcc	icc_or_xcc, %r0 + 49
	.word 0xdcffc029  ! 3933: SWAPA_R	swapa	%r14, [%r31 + %r9] 0x01
	.word 0x8d902000  ! 3934: WRPR_PSTATE_I	wrpr	%r0, 0x0000, %pstate
	.word 0x8198259e  ! 3935: WRHPR_HPSTATE_I	wrhpr	%r0, 0x059e, %hpstate
	.word 0xdc1fc000  ! 3936: LDD_R	ldd	[%r31 + %r0], %r14
	.word 0x81982f41  ! 3937: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f41, %hpstate
	.word 0x92d28003  ! 3938: UMULcc_R	umulcc 	%r10, %r3, %r9
DS_202:
	.word 0x34800001  ! 3940: BG	bg,a	<label_0x1>
	.word 0xdf33a001  ! 3940: STQF_I	-	%f15, [0x0001, %r14]
	.word 0x99458000  ! 3939: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x81982d11  ! 3940: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d11, %hpstate
	.word 0x81982c0c  ! 3941: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c0c, %hpstate
	.word 0x8bd02035  ! 3942: Tcc_I	tcs	icc_or_xcc, %r0 + 53
	.word 0x8198244e  ! 3943: WRHPR_HPSTATE_I	wrhpr	%r0, 0x044e, %hpstate
	.word 0x819826dd  ! 3944: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06dd, %hpstate
	mov 0x35, %r30
	.word 0x85d0001e  ! 3945: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x8d802004  ! 3946: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x91a2cdc7  ! 3947: FdMULq	fdmulq	
	.word 0x9a7a2001  ! 3948: SDIV_I	sdiv 	%r8, 0x0001, %r13
	.word 0x8d902454  ! 3949: WRPR_PSTATE_I	wrpr	%r0, 0x0454, %pstate
	.word 0x8d802000  ! 3950: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xda07c000  ! 3951: LDUW_R	lduw	[%r31 + %r0], %r13
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d802004  ! 3953: WRFPRS_I	wr	%r0, 0x0004, %fprs
	mov 0x33, %r30
	.word 0x89d0001e  ! 3954: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x8d902e84  ! 3955: WRPR_PSTATE_I	wrpr	%r0, 0x0e84, %pstate
	.word 0x8d802004  ! 3956: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xdb37c007  ! 3957: STQF_R	-	%f13, [%r7, %r31]
	.word 0xda27e001  ! 3958: STW_I	stw	%r13, [%r31 + 0x0001]
	.word 0xda8008a0  ! 3959: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0xdb37e001  ! 3960: STQF_I	-	%f13, [0x0001, %r31]
	.word 0x3c800001  ! 3961: BPOS	bpos,a	<label_0x1>
	.word 0xda5fe001  ! 3962: LDX_I	ldx	[%r31 + 0x0001], %r13
	.word 0xda8008a0  ! 3963: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xda8008a0  ! 3965: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	mov 0x34, %r30
	.word 0x99d0001e  ! 3966: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0xdbe7c027  ! 3967: CASA_I	casa	[%r31] 0x 1, %r7, %r13
	mov 0x31, %r30
	.word 0x95d0001e  ! 3968: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0xdaffc027  ! 3969: SWAPA_R	swapa	%r13, [%r31 + %r7] 0x01
	.word 0x97a00567  ! 3970: FSQRTq	fsqrt	
	.word 0x8d902cd2  ! 3971: WRPR_PSTATE_I	wrpr	%r0, 0x0cd2, %pstate
	.word 0x8d802004  ! 3972: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d902496  ! 3973: WRPR_PSTATE_I	wrpr	%r0, 0x0496, %pstate
	.word 0xd68008a0  ! 3974: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0xd6ffc027  ! 3975: SWAPA_R	swapa	%r11, [%r31 + %r7] 0x01
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xd727e001  ! 3977: STF_I	st	%f11, [0x0001, %r31]
	.word 0xd6d804a0  ! 3978: LDXA_R	ldxa	[%r0, %r0] 0x25, %r11
	.word 0x9ba01a6a  ! 3979: FqTOi	fqtoi	
	.word 0x20700001  ! 3980: BPN	<illegal instruction>
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0x22800001  ! 3983: BE	be,a	<label_0x1>
	.word 0x8d802000  ! 3984: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81982b13  ! 3986: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b13, %hpstate
	.word 0x8d802000  ! 3987: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x20800001  ! 3988: BN	bn,a	<label_0x1>
	.word 0x8d90205d  ! 3989: WRPR_PSTATE_I	wrpr	%r0, 0x005d, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81982693  ! 3991: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0693, %hpstate
	.word 0xdbe7c02a  ! 3992: CASA_I	casa	[%r31] 0x 1, %r10, %r13
	.word 0x8d902401  ! 3993: WRPR_PSTATE_I	wrpr	%r0, 0x0401, %pstate
	.word 0x89d02035  ! 3994: Tcc_I	tleu	icc_or_xcc, %r0 + 53
	.word 0x8d802000  ! 3995: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d802000  ! 3996: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d90209d  ! 3998: WRPR_PSTATE_I	wrpr	%r0, 0x009d, %pstate
	.word 0xda07e001  ! 3999: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0x87a1cd2b  ! 4000: FsMULd	fsmuld	%f7, %f42, %f34
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81982e9b  ! 4003: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e9b, %hpstate
	.word 0x8d902807  ! 4004: WRPR_PSTATE_I	wrpr	%r0, 0x0807, %pstate
	.word 0x8c6ae001  ! 4005: UDIVX_I	udivx 	%r11, 0x0001, %r6
	.word 0xccd7e020  ! 4006: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r6
	.word 0x81982393  ! 4007: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0393, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xcd37c00b  ! 4009: STQF_R	-	%f6, [%r11, %r31]
	mov 0x33, %r30
	.word 0x83d0001e  ! 4010: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x9ba349cc  ! 4011: FDIVd	fdivd	%f44, %f12, %f44
	.word 0x8198290d  ! 4012: WRHPR_HPSTATE_I	wrhpr	%r0, 0x090d, %hpstate
	.word 0x8198230a  ! 4013: WRHPR_HPSTATE_I	wrhpr	%r0, 0x030a, %hpstate
	.word 0x81982a9e  ! 4014: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a9e, %hpstate
	ta	T_CHANGE_PRIV	! macro
	mov 0x35, %r30
	.word 0x8fd0001e  ! 4016: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x81982294  ! 4017: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0294, %hpstate
	.word 0x92c0a001  ! 4018: ADDCcc_I	addccc 	%r2, 0x0001, %r9
	.word 0xd2dfe000  ! 4019: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r9
	mov 0x32, %r30
	.word 0x95d0001e  ! 4020: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0xd29fc020  ! 4021: LDDA_R	ldda	[%r31, %r0] 0x01, %r9
	.word 0x97d02032  ! 4022: Tcc_I	tge	icc_or_xcc, %r0 + 50
	.word 0xd24fc000  ! 4023: LDSB_R	ldsb	[%r31 + %r0], %r9
	.word 0x87a189e9  ! 4024: FDIVq	dis not found

	ta	T_CHANGE_HPRIV	! macro
	.word 0x2a800001  ! 4026: BCS	bcs,a	<label_0x1>
	.word 0x8d902001  ! 4027: WRPR_PSTATE_I	wrpr	%r0, 0x0001, %pstate
	.word 0x8d902859  ! 4028: WRPR_PSTATE_I	wrpr	%r0, 0x0859, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d902610  ! 4030: WRPR_PSTATE_I	wrpr	%r0, 0x0610, %pstate
	.word 0x81982054  ! 4031: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0054, %hpstate
	.word 0x8d9020cc  ! 4032: WRPR_PSTATE_I	wrpr	%r0, 0x00cc, %pstate
	.word 0xc6800ba0  ! 4033: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r3
	ta	T_CHANGE_HPRIV	! macro
	.word 0x91a0054e  ! 4035: FSQRTd	fsqrt	
	.word 0x89504000  ! 4036: RDPR_TNPC	rdpr	%tnpc, %r4
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8198228b  ! 4038: WRHPR_HPSTATE_I	wrhpr	%r0, 0x028b, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xc88008a0  ! 4040: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
	.word 0x20800001  ! 4041: BN	bn,a	<label_0x1>
	.word 0x81982e9c  ! 4042: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e9c, %hpstate
	.word 0x81982ac0  ! 4043: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ac0, %hpstate
	.word 0x83d02031  ! 4044: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0xc8cfe010  ! 4045: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r4
	.word 0x8d802004  ! 4046: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xc8d80e80  ! 4047: LDXA_R	ldxa	[%r0, %r0] 0x74, %r4
	.word 0x8d902cda  ! 4048: WRPR_PSTATE_I	wrpr	%r0, 0x0cda, %pstate
	.word 0x8681000d  ! 4049: ADDcc_R	addcc 	%r4, %r13, %r3
	.word 0x95d02033  ! 4050: Tcc_I	tg	icc_or_xcc, %r0 + 51
	.word 0x81982b97  ! 4051: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b97, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xc6c80e80  ! 4053: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r3
	.word 0x8da2c9ca  ! 4054: FDIVd	fdivd	%f42, %f10, %f6
	.word 0x8d902c98  ! 4055: WRPR_PSTATE_I	wrpr	%r0, 0x0c98, %pstate
	.word 0x8a4aa001  ! 4056: MULX_I	mulx 	%r10, 0x0001, %r5
	.word 0x3e800001  ! 4057: BVC	bvc,a	<label_0x1>
	.word 0xca1fc000  ! 4058: LDD_R	ldd	[%r31 + %r0], %r5
DS_203:
	.word 0x20800001  ! 4060: BN	bn,a	<label_0x1>
	illtrap
	.word 0x81b0430c  ! 4059: ALLIGNADDRESS	alignaddr	%r1, %r12, %r0
	.word 0x8e82c009  ! 4060: ADDcc_R	addcc 	%r11, %r9, %r7
	.word 0x9cdb0008  ! 4061: SMULcc_R	smulcc 	%r12, %r8, %r14
	.word 0xdcc00e80  ! 4062: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r14
	.word 0x8d902655  ! 4063: WRPR_PSTATE_I	wrpr	%r0, 0x0655, %pstate
	.word 0x81982946  ! 4064: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0946, %hpstate
	.word 0x9bd02030  ! 4065: Tcc_I	tcc	icc_or_xcc, %r0 + 48
	.word 0x81982793  ! 4066: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0793, %hpstate
	.word 0x94822001  ! 4067: ADDcc_I	addcc 	%r8, 0x0001, %r10
	.word 0xd4800b20  ! 4068: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r10
	.word 0x8c026001  ! 4069: ADD_I	add 	%r9, 0x0001, %r6
	.word 0x81982b52  ! 4070: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b52, %hpstate
	.word 0x8fa089a0  ! 4071: FDIVs	fdivs	%f2, %f0, %f7
	.word 0xce17e001  ! 4072: LDUH_I	lduh	[%r31 + 0x0001], %r7
	.word 0xced7e020  ! 4073: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r7
	.word 0x87802004  ! 4074: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8d9020d9  ! 4075: WRPR_PSTATE_I	wrpr	%r0, 0x00d9, %pstate
	.word 0x8d802000  ! 4076: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d902090  ! 4077: WRPR_PSTATE_I	wrpr	%r0, 0x0090, %pstate
	.word 0xcfe7c020  ! 4078: CASA_I	casa	[%r31] 0x 1, %r0, %r7
	.word 0xcec004a0  ! 4079: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r7
	mov 0x33, %r30
	.word 0x91d0001e  ! 4080: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x99d02032  ! 4081: Tcc_I	tgu	icc_or_xcc, %r0 + 50
	.word 0xce8008a0  ! 4082: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x81982d40  ! 4083: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d40, %hpstate
	.word 0x93a00542  ! 4084: FSQRTd	fsqrt	
	.word 0xd2d7e010  ! 4085: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r9
	.word 0x85d02032  ! 4086: Tcc_I	tle	icc_or_xcc, %r0 + 50
	.word 0x8d902c08  ! 4087: WRPR_PSTATE_I	wrpr	%r0, 0x0c08, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x9da34dce  ! 4089: FdMULq	fdmulq	
	.word 0x81982b4d  ! 4090: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b4d, %hpstate
	.word 0x8ed9800d  ! 4091: SMULcc_R	smulcc 	%r6, %r13, %r7
	.word 0x87802014  ! 4092: WRASI_I	wr	%r0, 0x0014, %asi
	ta	T_CHANGE_PRIV	! macro
DS_204:
	.word 0x20800001  ! 4095: BN	bn,a	<label_0x1>
	.word 0xdf33c005  ! 4095: STQF_R	-	%f15, [%r5, %r15]
	.word 0x9b458000  ! 4094: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x9151c000  ! 4095: RDPR_TL	rdpr	%tl, %r8
DS_205:
	.word 0x34800001  ! 4097: BG	bg,a	<label_0x1>
	illtrap
	.word 0x8fb1c30b  ! 4096: ALLIGNADDRESS	alignaddr	%r7, %r11, %r7
	.word 0x3e700001  ! 4097: BPVC	<illegal instruction>
	.word 0x9951c000  ! 4098: RDPR_TL	rdpr	%tl, %r12
	.word 0xd927c00b  ! 4099: STF_R	st	%f12, [%r11, %r31]
DS_206:
	.word 0x20800001  ! 4101: BN	bn,a	<label_0x1>
	.word 0xc3324007  ! 4101: STQF_R	-	%f1, [%r7, %r9]
	.word 0x8d458000  ! 4100: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0x8d802000  ! 4101: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x819822c7  ! 4102: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02c7, %hpstate
	.word 0xccbfc027  ! 4103: STDA_R	stda	%r6, [%r31 + %r7] 0x01
	.word 0x8b69e001  ! 4104: SDIVX_I	sdivx	%r7, 0x0001, %r5
	.word 0xcbe7c027  ! 4105: CASA_I	casa	[%r31] 0x 1, %r7, %r5
	mov 0x33, %r30
	.word 0x99d0001e  ! 4106: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x8d902c19  ! 4107: WRPR_PSTATE_I	wrpr	%r0, 0x0c19, %pstate
	.word 0x83480000  ! 4108: RDHPR_HPSTATE	rdhpr	%hpstate, %r1
	.word 0x8d9020d8  ! 4109: WRPR_PSTATE_I	wrpr	%r0, 0x00d8, %pstate
	.word 0xc28fe030  ! 4110: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r1
	.word 0xc237c007  ! 4111: STH_R	sth	%r1, [%r31 + %r7]
	.word 0xc217c000  ! 4112: LDUH_R	lduh	[%r31 + %r0], %r1
	mov 0x33, %r30
	.word 0x9bd0001e  ! 4113: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0xc2d004a0  ! 4114: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r1
	.word 0x936ae001  ! 4115: SDIVX_I	sdivx	%r11, 0x0001, %r9
	.word 0x864a2001  ! 4116: MULX_I	mulx 	%r8, 0x0001, %r3
	.word 0x8d802000  ! 4117: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87802088  ! 4118: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xc657e001  ! 4119: LDSH_I	ldsh	[%r31 + 0x0001], %r3
	.word 0x9da00549  ! 4120: FSQRTd	fsqrt	
	.word 0x9ba000c5  ! 4121: FNEGd	fnegd	%f36, %f44
	.word 0x81d02033  ! 4122: Tcc_I	tn	icc_or_xcc, %r0 + 51
	.word 0xda07c000  ! 4123: LDUW_R	lduw	[%r31 + %r0], %r13
	.word 0x9ba2c9ee  ! 4124: FDIVq	dis not found

	.word 0xdacfe030  ! 4125: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r13
	.word 0x8d802000  ! 4126: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xdb37e001  ! 4127: STQF_I	-	%f13, [0x0001, %r31]
	.word 0x24800001  ! 4128: BLE	ble,a	<label_0x1>
	.word 0x87802014  ! 4129: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x95d02032  ! 4130: Tcc_I	tg	icc_or_xcc, %r0 + 50
	.word 0x9c80e001  ! 4131: ADDcc_I	addcc 	%r3, 0x0001, %r14
	.word 0xdcc00e40  ! 4132: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r14
	.word 0x8d902011  ! 4133: WRPR_PSTATE_I	wrpr	%r0, 0x0011, %pstate
	.word 0x8198279b  ! 4134: WRHPR_HPSTATE_I	wrhpr	%r0, 0x079b, %hpstate
	.word 0x81982219  ! 4135: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0219, %hpstate
	.word 0xdc37e001  ! 4136: STH_I	sth	%r14, [%r31 + 0x0001]
	.word 0xdde7c02e  ! 4137: CASA_I	casa	[%r31] 0x 1, %r14, %r14
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x81982b19  ! 4139: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b19, %hpstate
	.word 0x81982055  ! 4140: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0055, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	mov 0x32, %r30
	.word 0x8dd0001e  ! 4142: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x81982c19  ! 4143: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c19, %hpstate
	.word 0x8d90204d  ! 4144: WRPR_PSTATE_I	wrpr	%r0, 0x004d, %pstate
	.word 0x81982d17  ! 4145: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d17, %hpstate
	.word 0x8d90201c  ! 4146: WRPR_PSTATE_I	wrpr	%r0, 0x001c, %pstate
	.word 0x81982b8b  ! 4147: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b8b, %hpstate
	.word 0x87802080  ! 4148: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x87802016  ! 4149: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x93a089a3  ! 4150: FDIVs	fdivs	%f2, %f3, %f9
	.word 0x96d9000c  ! 4151: SMULcc_R	smulcc 	%r4, %r12, %r11
	.word 0xd69fc020  ! 4152: LDDA_R	ldda	[%r31, %r0] 0x01, %r11
	.word 0x8d9024c9  ! 4153: WRPR_PSTATE_I	wrpr	%r0, 0x04c9, %pstate
	.word 0x81982849  ! 4154: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0849, %hpstate
	.word 0xd61fc000  ! 4155: LDD_R	ldd	[%r31 + %r0], %r11
	.word 0xd73fe001  ! 4156: STDF_I	std	%f11, [0x0001, %r31]
	.word 0x8f500000  ! 4157: RDPR_TPC	rdpr	%tpc, %r7
	.word 0x9d500000  ! 4158: RDPR_TPC	rdpr	%tpc, %r14
	.word 0x9a786001  ! 4159: SDIV_I	sdiv 	%r1, 0x0001, %r13
	.word 0x32700001  ! 4160: BPNE	<illegal instruction>
DS_207:
	.word 0x34800001  ! 4162: BG	bg,a	<label_0x1>
	illtrap
	.word 0x87b3c306  ! 4161: ALLIGNADDRESS	alignaddr	%r15, %r6, %r3
	.word 0xc6ffc026  ! 4162: SWAPA_R	swapa	%r3, [%r31 + %r6] 0x01
	.word 0xc67fe001  ! 4163: SWAP_I	swap	%r3, [%r31 + 0x0001]
DS_208:
	.word 0x34800001  ! 4165: BG	bg,a	<label_0x1>
	.word 0xcb310002  ! 4165: STQF_R	-	%f5, [%r2, %r4]
	.word 0x9d458000  ! 4164: RD_SOFTINT_REG	rd	%softint, %r14
	.word 0x81982f10  ! 4165: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f10, %hpstate
	.word 0x93a01a61  ! 4166: FqTOi	fqtoi	
	.word 0x819827dd  ! 4167: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07dd, %hpstate
	.word 0x99d02032  ! 4168: Tcc_I	tgu	icc_or_xcc, %r0 + 50
	.word 0xd2d804a0  ! 4169: LDXA_R	ldxa	[%r0, %r0] 0x25, %r9
	mov 0x30, %r30
	.word 0x95d0001e  ! 4170: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x99686001  ! 4171: SDIVX_I	sdivx	%r1, 0x0001, %r12
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d802004  ! 4173: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x87802080  ! 4174: WRASI_I	wr	%r0, 0x0080, %asi
	mov 0x32, %r30
	.word 0x95d0001e  ! 4175: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x85a109eb  ! 4176: FDIVq	dis not found

	.word 0x8d902ecd  ! 4177: WRPR_PSTATE_I	wrpr	%r0, 0x0ecd, %pstate
	.word 0x8d902210  ! 4178: WRPR_PSTATE_I	wrpr	%r0, 0x0210, %pstate
	.word 0x96c3a001  ! 4179: ADDCcc_I	addccc 	%r14, 0x0001, %r11
	.word 0x36800001  ! 4180: BGE	bge,a	<label_0x1>
	.word 0x81d02033  ! 4181: Tcc_I	tn	icc_or_xcc, %r0 + 51
	.word 0x96690009  ! 4182: UDIVX_R	udivx 	%r4, %r9, %r11
	.word 0x8e80c000  ! 4183: ADDcc_R	addcc 	%r3, %r0, %r7
	.word 0x81982113  ! 4184: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0113, %hpstate
	.word 0x8d902c9a  ! 4185: WRPR_PSTATE_I	wrpr	%r0, 0x0c9a, %pstate
	.word 0x81982182  ! 4186: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0182, %hpstate
	.word 0xcf37e001  ! 4187: STQF_I	-	%f7, [0x0001, %r31]
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x88c1e001  ! 4189: ADDCcc_I	addccc 	%r7, 0x0001, %r4
	.word 0x8198280b  ! 4190: WRHPR_HPSTATE_I	wrhpr	%r0, 0x080b, %hpstate
	.word 0xc88008a0  ! 4191: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
	.word 0x8d802000  ! 4192: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8c00e001  ! 4193: ADD_I	add 	%r3, 0x0001, %r6
	.word 0x8c78e001  ! 4194: SDIV_I	sdiv 	%r3, 0x0001, %r6
	.word 0x81982640  ! 4195: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0640, %hpstate
	.word 0x8f51c000  ! 4196: RDPR_TL	rdpr	%tl, %r7
	.word 0x93a309ea  ! 4197: FDIVq	dis not found

DS_209:
	.word 0x32800001  ! 4199: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x95b1030e  ! 4198: ALLIGNADDRESS	alignaddr	%r4, %r14, %r10
	.word 0x819824ce  ! 4199: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04ce, %hpstate
	.word 0xd4d80e40  ! 4200: LDXA_R	ldxa	[%r0, %r0] 0x72, %r10
	.word 0xd48008a0  ! 4201: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xd457c000  ! 4202: LDSH_R	ldsh	[%r31 + %r0], %r10
	.word 0x8ba000c7  ! 4203: FNEGd	fnegd	%f38, %f36
	ta	T_CHANGE_PRIV	! macro
	.word 0xca8fe020  ! 4205: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r5
	.word 0x976a400f  ! 4206: SDIVX_R	sdivx	%r9, %r15, %r11
	.word 0x9e6be001  ! 4207: UDIVX_I	udivx 	%r15, 0x0001, %r15
	.word 0x8d9020c4  ! 4208: WRPR_PSTATE_I	wrpr	%r0, 0x00c4, %pstate
	.word 0xdf37c00f  ! 4209: STQF_R	-	%f15, [%r15, %r31]
	.word 0x3c800001  ! 4210: BPOS	bpos,a	<label_0x1>
	.word 0x9da01a67  ! 4211: FqTOi	fqtoi	
	.word 0x8d902408  ! 4212: WRPR_PSTATE_I	wrpr	%r0, 0x0408, %pstate
	.word 0x81982b47  ! 4213: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b47, %hpstate
	.word 0x8d90221f  ! 4214: WRPR_PSTATE_I	wrpr	%r0, 0x021f, %pstate
	.word 0x9fa2c9e9  ! 4215: FDIVq	dis not found

	.word 0xdf37e001  ! 4216: STQF_I	-	%f15, [0x0001, %r31]
	.word 0xde9fe001  ! 4217: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r15
	mov 0x30, %r30
	.word 0x99d0001e  ! 4218: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0xdec804a0  ! 4219: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r15
	.word 0x819821c1  ! 4220: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01c1, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x87802004  ! 4222: WRASI_I	wr	%r0, 0x0004, %asi
DS_210:
	.word 0x22800001  ! 4224: BE	be,a	<label_0x1>
	.word 0xc531a001  ! 4224: STQF_I	-	%f2, [0x0001, %r6]
	.word 0x83458000  ! 4223: RD_SOFTINT_REG	rd	%softint, %r1
	.word 0x9b508000  ! 4224: RDPR_TSTATE	rdpr	%tstate, %r13
	.word 0xdb37e001  ! 4225: STQF_I	-	%f13, [0x0001, %r31]
	.word 0x8d802000  ! 4226: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x89a109c0  ! 4227: FDIVd	fdivd	%f4, %f0, %f4
	.word 0x81982188  ! 4228: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0188, %hpstate
	.word 0xc927c000  ! 4229: STF_R	st	%f4, [%r0, %r31]
	.word 0x87802089  ! 4230: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x9283c00d  ! 4231: ADDcc_R	addcc 	%r15, %r13, %r9
	.word 0x8198210c  ! 4232: WRHPR_HPSTATE_I	wrhpr	%r0, 0x010c, %hpstate
	.word 0x8d902651  ! 4233: WRPR_PSTATE_I	wrpr	%r0, 0x0651, %pstate
	.word 0xd2d7e030  ! 4234: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r9
	.word 0xd28fe000  ! 4235: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r9
	.word 0x8d90241a  ! 4236: WRPR_PSTATE_I	wrpr	%r0, 0x041a, %pstate
	.word 0x8d902693  ! 4237: WRPR_PSTATE_I	wrpr	%r0, 0x0693, %pstate
	.word 0x8bd02034  ! 4238: Tcc_I	tcs	icc_or_xcc, %r0 + 52
	.word 0x8d902614  ! 4239: WRPR_PSTATE_I	wrpr	%r0, 0x0614, %pstate
	.word 0x85d02035  ! 4240: Tcc_I	tle	icc_or_xcc, %r0 + 53
	.word 0x81982105  ! 4241: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0105, %hpstate
	.word 0xd297e000  ! 4242: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r9
	mov 0x32, %r30
	.word 0x8bd0001e  ! 4243: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0xd2c7e000  ! 4244: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r9
	.word 0xd2d00e40  ! 4245: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r9
	.word 0x83d02034  ! 4246: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x8bd02034  ! 4247: Tcc_I	tcs	icc_or_xcc, %r0 + 52
	.word 0x9768a001  ! 4248: SDIVX_I	sdivx	%r2, 0x0001, %r11
	.word 0xd697e000  ! 4249: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r11
	.word 0x91d02030  ! 4250: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x99a00545  ! 4251: FSQRTd	fsqrt	
	.word 0xd8c00e60  ! 4252: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r12
DS_211:
	.word 0x32800001  ! 4254: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x9fb3030f  ! 4253: ALLIGNADDRESS	alignaddr	%r12, %r15, %r15
	.word 0x2e800001  ! 4254: BVS	bvs,a	<label_0x1>
	.word 0x97a10dca  ! 4255: FdMULq	fdmulq	
	.word 0x8d802000  ! 4256: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982f1c  ! 4257: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f1c, %hpstate
	.word 0x8d9024c7  ! 4258: WRPR_PSTATE_I	wrpr	%r0, 0x04c7, %pstate
	.word 0x8d902a18  ! 4259: WRPR_PSTATE_I	wrpr	%r0, 0x0a18, %pstate
	.word 0x819824c8  ! 4260: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04c8, %hpstate
	.word 0x92808009  ! 4261: ADDcc_R	addcc 	%r2, %r9, %r9
	.word 0x9002a001  ! 4262: ADD_I	add 	%r10, 0x0001, %r8
	.word 0x8d902415  ! 4263: WRPR_PSTATE_I	wrpr	%r0, 0x0415, %pstate
	.word 0x819829dd  ! 4264: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09dd, %hpstate
	.word 0x99a24dcf  ! 4265: FdMULq	fdmulq	
	.word 0x8d802004  ! 4266: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd8d00e40  ! 4267: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r12
	.word 0x8c7ba001  ! 4268: SDIV_I	sdiv 	%r14, 0x0001, %r6
	.word 0x93a28d2c  ! 4269: FsMULd	fsmuld	%f10, %f12, %f40
	.word 0x81982a5f  ! 4270: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a5f, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xd2cfe010  ! 4272: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r9
	.word 0x8d9024c2  ! 4273: WRPR_PSTATE_I	wrpr	%r0, 0x04c2, %pstate
	.word 0x8d902813  ! 4274: WRPR_PSTATE_I	wrpr	%r0, 0x0813, %pstate
	.word 0xd277e001  ! 4275: STX_I	stx	%r9, [%r31 + 0x0001]
	.word 0x9dd02034  ! 4276: Tcc_I	tpos	icc_or_xcc, %r0 + 52
	.word 0x80792001  ! 4277: SDIV_I	sdiv 	%r4, 0x0001, %r0
	.word 0x28800001  ! 4278: BLEU	bleu,a	<label_0x1>
	.word 0x9680000b  ! 4279: ADDcc_R	addcc 	%r0, %r11, %r11
	.word 0xd68804a0  ! 4280: LDUBA_R	lduba	[%r0, %r0] 0x25, %r11
	.word 0x26700001  ! 4281: BPL	<illegal instruction>
	.word 0x87802004  ! 4282: WRASI_I	wr	%r0, 0x0004, %asi
DS_212:
	.word 0x22800001  ! 4284: BE	be,a	<label_0x1>
	illtrap
	.word 0x83b10303  ! 4283: ALLIGNADDRESS	alignaddr	%r4, %r3, %r1
	.word 0x904a6001  ! 4284: MULX_I	mulx 	%r9, 0x0001, %r8
	.word 0x8d902ecd  ! 4285: WRPR_PSTATE_I	wrpr	%r0, 0x0ecd, %pstate
	.word 0x87802014  ! 4286: WRASI_I	wr	%r0, 0x0014, %asi
DS_213:
	.word 0x22800001  ! 4288: BE	be,a	<label_0x1>
	.word 0xd532a001  ! 4288: STQF_I	-	%f10, [0x0001, %r10]
	.word 0x85458000  ! 4287: RD_SOFTINT_REG	rd	%softint, %r2
	.word 0xc4800c60  ! 4288: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r2
	.word 0x8198275b  ! 4289: WRHPR_HPSTATE_I	wrhpr	%r0, 0x075b, %hpstate
	.word 0x8ba01a6d  ! 4290: FqTOi	fqtoi	
	.word 0x91a01a6c  ! 4291: FqTOi	fqtoi	
	.word 0x8d902cc0  ! 4292: WRPR_PSTATE_I	wrpr	%r0, 0x0cc0, %pstate
	.word 0x8d802000  ! 4293: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_214:
	.word 0x34800001  ! 4295: BG	bg,a	<label_0x1>
	.word 0xc9332001  ! 4295: STQF_I	-	%f4, [0x0001, %r12]
	.word 0x8d458000  ! 4294: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0xcc17c000  ! 4295: LDUH_R	lduh	[%r31 + %r0], %r6
	.word 0x8d902ad2  ! 4296: WRPR_PSTATE_I	wrpr	%r0, 0x0ad2, %pstate
	.word 0x80492001  ! 4297: MULX_I	mulx 	%r4, 0x0001, %r0
	.word 0x8d802000  ! 4298: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d802004  ! 4300: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8198258f  ! 4301: WRHPR_HPSTATE_I	wrhpr	%r0, 0x058f, %hpstate
	.word 0x81982e1c  ! 4302: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e1c, %hpstate
	.word 0x8d9028da  ! 4303: WRPR_PSTATE_I	wrpr	%r0, 0x08da, %pstate
	.word 0xc08008a0  ! 4304: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0x81982085  ! 4305: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0085, %hpstate
	mov 0x32, %r30
	.word 0x93d0001e  ! 4306: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x81982791  ! 4307: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0791, %hpstate
DS_215:
	.word 0x32800001  ! 4309: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x8bb04303  ! 4308: ALLIGNADDRESS	alignaddr	%r1, %r3, %r5
	.word 0x87802016  ! 4309: WRASI_I	wr	%r0, 0x0016, %asi
	ta	T_CHANGE_PRIV	! macro
	.word 0x89514000  ! 4311: RDPR_TBA	rdpr	%tba, %r4
	.word 0x9fd02030  ! 4312: Tcc_I	tvc	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d902a87  ! 4314: WRPR_PSTATE_I	wrpr	%r0, 0x0a87, %pstate
	mov 0x34, %r30
	.word 0x99d0001e  ! 4315: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	mov 0x31, %r30
	.word 0x9bd0001e  ! 4316: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x3c800001  ! 4317: BPOS	bpos,a	<label_0x1>
	.word 0x8d902059  ! 4318: WRPR_PSTATE_I	wrpr	%r0, 0x0059, %pstate
	.word 0x8d902409  ! 4319: WRPR_PSTATE_I	wrpr	%r0, 0x0409, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x93d02030  ! 4321: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0x819827c5  ! 4322: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07c5, %hpstate
	.word 0x9da209a6  ! 4323: FDIVs	fdivs	%f8, %f6, %f14
	.word 0x8d802004  ! 4324: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8fa00546  ! 4325: FSQRTd	fsqrt	
	.word 0x96698005  ! 4326: UDIVX_R	udivx 	%r6, %r5, %r11
	.word 0xd797e001  ! 4327: LDQFA_I	-	[%r31, 0x0001], %f11
	.word 0x8198268e  ! 4328: WRHPR_HPSTATE_I	wrhpr	%r0, 0x068e, %hpstate
	.word 0x81d02035  ! 4329: Tcc_I	tn	icc_or_xcc, %r0 + 53
	.word 0x819827d1  ! 4330: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07d1, %hpstate
DS_216:
	.word 0x20800001  ! 4332: BN	bn,a	<label_0x1>
	illtrap
	.word 0x97b14302  ! 4331: ALLIGNADDRESS	alignaddr	%r5, %r2, %r11
	.word 0x87514000  ! 4332: RDPR_TBA	rdpr	%tba, %r3
	.word 0x826a800a  ! 4333: UDIVX_R	udivx 	%r10, %r10, %r1
	.word 0x81982215  ! 4334: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0215, %hpstate
	.word 0x819821c8  ! 4335: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01c8, %hpstate
	.word 0x9a486001  ! 4336: MULX_I	mulx 	%r1, 0x0001, %r13
	mov 0x35, %r30
	.word 0x8dd0001e  ! 4337: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x8d802004  ! 4338: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d802004  ! 4339: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x81982b19  ! 4340: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b19, %hpstate
	mov 0x33, %r30
	.word 0x81d0001e  ! 4341: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x9a02a001  ! 4342: ADD_I	add 	%r10, 0x0001, %r13
	.word 0x8d90204c  ! 4343: WRPR_PSTATE_I	wrpr	%r0, 0x004c, %pstate
	.word 0x87a01a63  ! 4344: FqTOi	fqtoi	
	.word 0x9a68800f  ! 4345: UDIVX_R	udivx 	%r2, %r15, %r13
	.word 0xdaffc02f  ! 4346: SWAPA_R	swapa	%r13, [%r31 + %r15] 0x01
	.word 0xda57c000  ! 4347: LDSH_R	ldsh	[%r31 + %r0], %r13
	.word 0x9649a001  ! 4348: MULX_I	mulx 	%r6, 0x0001, %r11
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x9fd02030  ! 4350: Tcc_I	tvc	icc_or_xcc, %r0 + 48
	.word 0x8d902e97  ! 4351: WRPR_PSTATE_I	wrpr	%r0, 0x0e97, %pstate
	.word 0x819821c4  ! 4352: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01c4, %hpstate
	.word 0xd67fe001  ! 4353: SWAP_I	swap	%r11, [%r31 + 0x0001]
	.word 0x8d902657  ! 4354: WRPR_PSTATE_I	wrpr	%r0, 0x0657, %pstate
	.word 0x8d902c82  ! 4355: WRPR_PSTATE_I	wrpr	%r0, 0x0c82, %pstate
	mov 0x33, %r30
	.word 0x85d0001e  ! 4356: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x30800001  ! 4357: BA	ba,a	<label_0x1>
	.word 0x8d902e5e  ! 4358: WRPR_PSTATE_I	wrpr	%r0, 0x0e5e, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
DS_217:
	.word 0x34800001  ! 4362: BG	bg,a	<label_0x1>
	illtrap
	.word 0x9fb0830d  ! 4361: ALLIGNADDRESS	alignaddr	%r2, %r13, %r15
	.word 0x88818003  ! 4362: ADDcc_R	addcc 	%r6, %r3, %r4
	.word 0x87802004  ! 4363: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8198231e  ! 4364: WRHPR_HPSTATE_I	wrhpr	%r0, 0x031e, %hpstate
	.word 0x82698000  ! 4365: UDIVX_R	udivx 	%r6, %r0, %r1
	.word 0x80036001  ! 4366: ADD_I	add 	%r13, 0x0001, %r0
	.word 0x8d902613  ! 4367: WRPR_PSTATE_I	wrpr	%r0, 0x0613, %pstate
	.word 0x836b0005  ! 4368: SDIVX_R	sdivx	%r12, %r5, %r1
	.word 0xc2cfe020  ! 4369: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r1
	.word 0x81982749  ! 4370: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0749, %hpstate
	.word 0xc27fe001  ! 4371: SWAP_I	swap	%r1, [%r31 + 0x0001]
DS_218:
	.word 0x20800001  ! 4373: BN	bn,a	<label_0x1>
	illtrap
	.word 0x8fb3030f  ! 4372: ALLIGNADDRESS	alignaddr	%r12, %r15, %r7
	.word 0x81a00545  ! 4373: FSQRTd	fsqrt	
	.word 0xc047c000  ! 4374: LDSW_R	ldsw	[%r31 + %r0], %r0
	.word 0x93a049e3  ! 4375: FDIVq	dis not found

	.word 0x88db8006  ! 4376: SMULcc_R	smulcc 	%r14, %r6, %r4
	.word 0x8d802000  ! 4377: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_219:
	.word 0x32800001  ! 4379: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x9bb3830b  ! 4378: ALLIGNADDRESS	alignaddr	%r14, %r11, %r13
	.word 0x8d9022c0  ! 4379: WRPR_PSTATE_I	wrpr	%r0, 0x02c0, %pstate
	.word 0x9c6b6001  ! 4380: UDIVX_I	udivx 	%r13, 0x0001, %r14
	.word 0x87802089  ! 4381: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xdcc7e030  ! 4382: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r14
	.word 0xdd27c00b  ! 4383: STF_R	st	%f14, [%r11, %r31]
	.word 0x97d02030  ! 4384: Tcc_I	tge	icc_or_xcc, %r0 + 48
	mov 0x31, %r30
	.word 0x93d0001e  ! 4385: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81982c8c  ! 4387: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c8c, %hpstate
	.word 0x8d9024d0  ! 4388: WRPR_PSTATE_I	wrpr	%r0, 0x04d0, %pstate
	.word 0xdc9004a0  ! 4389: LDUHA_R	lduha	[%r0, %r0] 0x25, %r14
	.word 0x8da00561  ! 4390: FSQRTq	fsqrt	
DS_220:
	.word 0x20800001  ! 4392: BN	bn,a	<label_0x1>
	illtrap
	.word 0x99b10306  ! 4391: ALLIGNADDRESS	alignaddr	%r4, %r6, %r12
	.word 0xd83fc006  ! 4392: STD_R	std	%r12, [%r31 + %r6]
	.word 0x8fd02034  ! 4393: Tcc_I	tvs	icc_or_xcc, %r0 + 52
	.word 0x8881a001  ! 4394: ADDcc_I	addcc 	%r6, 0x0001, %r4
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc8c804a0  ! 4396: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r4
	.word 0x81982550  ! 4397: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0550, %hpstate
	.word 0x95a1cdc0  ! 4398: FdMULq	fdmulq	
	.word 0x9c794001  ! 4399: SDIV_R	sdiv 	%r5, %r1, %r14
	.word 0x91d02031  ! 4400: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xdc900e80  ! 4401: LDUHA_R	lduha	[%r0, %r0] 0x74, %r14
	.word 0x81982407  ! 4402: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0407, %hpstate
	.word 0xdcdfe020  ! 4403: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r14
	.word 0x8da01a60  ! 4404: FqTOi	fqtoi	
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81982551  ! 4406: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0551, %hpstate
	.word 0x8568a001  ! 4407: SDIVX_I	sdivx	%r2, 0x0001, %r2
DS_221:
	.word 0x20800001  ! 4409: BN	bn,a	<label_0x1>
	.word 0xdf33e001  ! 4409: STQF_I	-	%f15, [0x0001, %r15]
	.word 0x89458000  ! 4408: RD_SOFTINT_REG	rd	%softint, %r4
	.word 0x8d902810  ! 4409: WRPR_PSTATE_I	wrpr	%r0, 0x0810, %pstate
	.word 0x81982303  ! 4410: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0303, %hpstate
	.word 0x81982610  ! 4411: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0610, %hpstate
	mov 0x33, %r30
	.word 0x95d0001e  ! 4412: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x3a700001  ! 4413: BPCC	<illegal instruction>
	.word 0x87802089  ! 4414: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x864b400c  ! 4415: MULX_R	mulx 	%r13, %r12, %r3
	.word 0x2c700001  ! 4416: BPNEG	<illegal instruction>
	.word 0xc6cfe010  ! 4417: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r3
	.word 0x8d902a4b  ! 4418: WRPR_PSTATE_I	wrpr	%r0, 0x0a4b, %pstate
	.word 0x964ae001  ! 4419: MULX_I	mulx 	%r11, 0x0001, %r11
	.word 0x8c7a400e  ! 4420: SDIV_R	sdiv 	%r9, %r14, %r6
	.word 0x87802088  ! 4421: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8d9020c7  ! 4422: WRPR_PSTATE_I	wrpr	%r0, 0x00c7, %pstate
	.word 0x81982f47  ! 4423: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f47, %hpstate
	.word 0x9a00a001  ! 4424: ADD_I	add 	%r2, 0x0001, %r13
	mov 0x33, %r30
	.word 0x8bd0001e  ! 4425: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x8c7b4008  ! 4426: SDIV_R	sdiv 	%r13, %r8, %r6
	mov 0x32, %r30
	.word 0x95d0001e  ! 4427: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x88d8000b  ! 4428: SMULcc_R	smulcc 	%r0, %r11, %r4
	.word 0x88510008  ! 4429: UMUL_R	umul 	%r4, %r8, %r4
	.word 0x97d02032  ! 4430: Tcc_I	tge	icc_or_xcc, %r0 + 50
	.word 0x8d682001  ! 4431: SDIVX_I	sdivx	%r0, 0x0001, %r6
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d902885  ! 4433: WRPR_PSTATE_I	wrpr	%r0, 0x0885, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0xccbfc028  ! 4435: STDA_R	stda	%r6, [%r31 + %r8] 0x01
	.word 0x87802004  ! 4436: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8198291e  ! 4437: WRHPR_HPSTATE_I	wrhpr	%r0, 0x091e, %hpstate
	.word 0x87802016  ! 4438: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x819823d6  ! 4439: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03d6, %hpstate
	.word 0x87802014  ! 4440: WRASI_I	wr	%r0, 0x0014, %asi
	ta	T_CHANGE_NONHPRIV	! macro
	mov 0x30, %r30
	.word 0x91d0001e  ! 4442: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 4443: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x84838009  ! 4444: ADDcc_R	addcc 	%r14, %r9, %r2
	.word 0xc49fe001  ! 4445: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r2
	.word 0xc48008a0  ! 4446: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x87802089  ! 4447: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x87802004  ! 4448: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x976b400c  ! 4449: SDIVX_R	sdivx	%r13, %r12, %r11
	.word 0xd61fc000  ! 4450: LDD_R	ldd	[%r31 + %r0], %r11
	.word 0x84486001  ! 4451: MULX_I	mulx 	%r1, 0x0001, %r2
	.word 0xc4dfe020  ! 4452: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r2
	.word 0x8d902a93  ! 4453: WRPR_PSTATE_I	wrpr	%r0, 0x0a93, %pstate
	.word 0x8d802000  ! 4454: WRFPRS_I	wr	%r0, 0x0000, %fprs
	mov 0x34, %r30
	.word 0x8dd0001e  ! 4455: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x8d902c06  ! 4456: WRPR_PSTATE_I	wrpr	%r0, 0x0c06, %pstate
DS_222:
	.word 0x32800001  ! 4458: BNE	bne,a	<label_0x1>
	.word 0xc133c007  ! 4458: STQF_R	-	%f0, [%r7, %r15]
	.word 0x9d458000  ! 4457: RD_SOFTINT_REG	rd	%softint, %r14
	.word 0x81982216  ! 4458: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0216, %hpstate
	.word 0x8d90245f  ! 4459: WRPR_PSTATE_I	wrpr	%r0, 0x045f, %pstate
	.word 0x81982718  ! 4460: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0718, %hpstate
	.word 0x8d9028c8  ! 4461: WRPR_PSTATE_I	wrpr	%r0, 0x08c8, %pstate
	.word 0x8d9028ce  ! 4462: WRPR_PSTATE_I	wrpr	%r0, 0x08ce, %pstate
	.word 0x8d9020c3  ! 4463: WRPR_PSTATE_I	wrpr	%r0, 0x00c3, %pstate
	.word 0x8d9020d2  ! 4464: WRPR_PSTATE_I	wrpr	%r0, 0x00d2, %pstate
	.word 0xdcd004a0  ! 4465: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r14
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x83d02034  ! 4468: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x924a6001  ! 4469: MULX_I	mulx 	%r9, 0x0001, %r9
	.word 0x9e4b8008  ! 4470: MULX_R	mulx 	%r14, %r8, %r15
	.word 0x81982883  ! 4471: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0883, %hpstate
DS_223:
	.word 0x22800001  ! 4473: BE	be,a	<label_0x1>
	illtrap
	.word 0x93b14306  ! 4472: ALLIGNADDRESS	alignaddr	%r5, %r6, %r9
	.word 0x8d902242  ! 4473: WRPR_PSTATE_I	wrpr	%r0, 0x0242, %pstate
	.word 0x8200a001  ! 4474: ADD_I	add 	%r2, 0x0001, %r1
	.word 0x87a000c8  ! 4475: FNEGd	fnegd	%f8, %f34
	.word 0x81982fd9  ! 4476: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd9, %hpstate
	.word 0x93a01a63  ! 4477: FqTOi	fqtoi	
	.word 0xd22fc003  ! 4478: STB_R	stb	%r9, [%r31 + %r3]
	mov 0x33, %r30
	.word 0x9bd0001e  ! 4479: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x819826c5  ! 4480: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06c5, %hpstate
	.word 0x8d902046  ! 4481: WRPR_PSTATE_I	wrpr	%r0, 0x0046, %pstate
	mov 0x35, %r30
	.word 0x81d0001e  ! 4482: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x83a0054b  ! 4484: FSQRTd	fsqrt	
	.word 0x81a0054a  ! 4485: FSQRTd	fsqrt	
	.word 0x38800001  ! 4486: BGU	bgu,a	<label_0x1>
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81982502  ! 4488: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0502, %hpstate
	.word 0x9a6b8000  ! 4489: UDIVX_R	udivx 	%r14, %r0, %r13
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8282c008  ! 4491: ADDcc_R	addcc 	%r11, %r8, %r1
	.word 0x9950c000  ! 4492: RDPR_TT	rdpr	%tt, %r12
	.word 0x8d90240b  ! 4493: WRPR_PSTATE_I	wrpr	%r0, 0x040b, %pstate
	.word 0x81982118  ! 4494: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0118, %hpstate
	.word 0x8d9020d4  ! 4495: WRPR_PSTATE_I	wrpr	%r0, 0x00d4, %pstate
	.word 0xd85fc000  ! 4496: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xd8dfe030  ! 4497: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r12
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x97a38dc9  ! 4499: FdMULq	fdmulq	
DS_224:
	.word 0x32800001  ! 4501: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x8db2830e  ! 4500: ALLIGNADDRESS	alignaddr	%r10, %r14, %r6
	.word 0x8d802000  ! 4501: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8fa01a6d  ! 4502: FqTOi	fqtoi	
	.word 0x87802014  ! 4503: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x81982703  ! 4504: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0703, %hpstate
	.word 0x9680c00c  ! 4505: ADDcc_R	addcc 	%r3, %r12, %r11
	.word 0x9a012001  ! 4506: ADD_I	add 	%r4, 0x0001, %r13
	.word 0x8c53c00a  ! 4507: UMUL_R	umul 	%r15, %r10, %r6
	.word 0x81982083  ! 4508: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0083, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x84d16001  ! 4510: UMULcc_I	umulcc 	%r5, 0x0001, %r2
	.word 0x85a249e3  ! 4511: FDIVq	dis not found

	.word 0x87802014  ! 4512: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x8d902c4f  ! 4513: WRPR_PSTATE_I	wrpr	%r0, 0x0c4f, %pstate
	.word 0x8d9026d3  ! 4514: WRPR_PSTATE_I	wrpr	%r0, 0x06d3, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81982841  ! 4516: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0841, %hpstate
	.word 0x82486001  ! 4517: MULX_I	mulx 	%r1, 0x0001, %r1
	.word 0x87494000  ! 4518: RDHPR_HTBA	rdhpr	%htba, %r3
	.word 0xc6dfe020  ! 4519: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r3
	.word 0x8282e001  ! 4520: ADDcc_I	addcc 	%r11, 0x0001, %r1
	mov 0x34, %r30
	.word 0x8dd0001e  ! 4521: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0xc337e001  ! 4522: STQF_I	-	%f1, [0x0001, %r31]
	ta	T_CHANGE_PRIV	! macro
	.word 0xc2ffc023  ! 4524: SWAPA_R	swapa	%r1, [%r31 + %r3] 0x01
	.word 0x81982456  ! 4525: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0456, %hpstate
	mov 0x30, %r30
	.word 0x83d0001e  ! 4526: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x96c1e001  ! 4527: ADDCcc_I	addccc 	%r7, 0x0001, %r11
	.word 0x8d902857  ! 4528: WRPR_PSTATE_I	wrpr	%r0, 0x0857, %pstate
	.word 0x8d9024d6  ! 4529: WRPR_PSTATE_I	wrpr	%r0, 0x04d6, %pstate
	.word 0x91d02030  ! 4530: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x8b508000  ! 4531: RDPR_TSTATE	rdpr	%tstate, %r5
DS_225:
	.word 0x34800001  ! 4533: BG	bg,a	<label_0x1>
	.word 0xcf32e001  ! 4533: STQF_I	-	%f7, [0x0001, %r11]
	.word 0x9d458000  ! 4532: RD_SOFTINT_REG	rd	%softint, %r14
	.word 0x95a349a3  ! 4533: FDIVs	fdivs	%f13, %f3, %f10
	.word 0x9d69a001  ! 4534: SDIVX_I	sdivx	%r6, 0x0001, %r14
	.word 0x8d90265b  ! 4535: WRPR_PSTATE_I	wrpr	%r0, 0x065b, %pstate
	.word 0xdd27c003  ! 4536: STF_R	st	%f14, [%r3, %r31]
	.word 0x96828004  ! 4537: ADDcc_R	addcc 	%r10, %r4, %r11
	.word 0x8ba00560  ! 4538: FSQRTq	fsqrt	
	ta	T_CHANGE_PRIV	! macro
	.word 0xca97e000  ! 4540: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r5
	mov 0x35, %r30
	.word 0x85d0001e  ! 4541: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x8dd02035  ! 4542: Tcc_I	tneg	icc_or_xcc, %r0 + 53
	.word 0x8c810002  ! 4543: ADDcc_R	addcc 	%r4, %r2, %r6
	.word 0xccdfe020  ! 4544: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r6
	.word 0x8198298d  ! 4545: WRHPR_HPSTATE_I	wrhpr	%r0, 0x098d, %hpstate
	.word 0x8d90284e  ! 4546: WRPR_PSTATE_I	wrpr	%r0, 0x084e, %pstate
	.word 0x30700001  ! 4547: BPA	<illegal instruction>
	.word 0x8d902642  ! 4548: WRPR_PSTATE_I	wrpr	%r0, 0x0642, %pstate
	mov 0x31, %r30
	.word 0x93d0001e  ! 4549: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d902ed7  ! 4550: WRPR_PSTATE_I	wrpr	%r0, 0x0ed7, %pstate
	.word 0x3c700001  ! 4551: BPPOS	<illegal instruction>
	.word 0x8dd02031  ! 4552: Tcc_I	tneg	icc_or_xcc, %r0 + 49
	.word 0x83d02034  ! 4553: Tcc_I	te	icc_or_xcc, %r0 + 52
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x81d02032  ! 4556: Tcc_I	tn	icc_or_xcc, %r0 + 50
	.word 0xccc7e030  ! 4557: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r6
	.word 0x87802089  ! 4558: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8ba0056c  ! 4559: FSQRTq	fsqrt	
	.word 0x8198224d  ! 4560: WRHPR_HPSTATE_I	wrhpr	%r0, 0x024d, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x90d0c00a  ! 4562: UMULcc_R	umulcc 	%r3, %r10, %r8
DS_226:
	.word 0x22800001  ! 4564: BE	be,a	<label_0x1>
	.word 0xcd32a001  ! 4564: STQF_I	-	%f6, [0x0001, %r10]
	.word 0x85458000  ! 4563: RD_SOFTINT_REG	rd	%softint, %r2
	.word 0xc4d004a0  ! 4564: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r2
	.word 0xc4800bc0  ! 4565: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r2
DS_227:
	.word 0x32800001  ! 4567: BNE	bne,a	<label_0x1>
	.word 0xcf322001  ! 4567: STQF_I	-	%f7, [0x0001, %r8]
	.word 0x93458000  ! 4566: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0xd3e7c02a  ! 4567: CASA_I	casa	[%r31] 0x 1, %r10, %r9
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x9ba18d22  ! 4569: FsMULd	fsmuld	%f6, %f2, %f44
	ta	T_CHANGE_HPRIV	! macro
DS_228:
	.word 0x22800001  ! 4572: BE	be,a	<label_0x1>
	illtrap
	.word 0x8db0030b  ! 4571: ALLIGNADDRESS	alignaddr	%r0, %r11, %r6
	.word 0x87a0c9c3  ! 4572: FDIVd	fdivd	%f34, %f34, %f34
	.word 0x9401a001  ! 4573: ADD_I	add 	%r6, 0x0001, %r10
	.word 0x97a01a69  ! 4574: FqTOi	fqtoi	
	.word 0x83d02033  ! 4575: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0xd68008a0  ! 4576: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x87802010  ! 4577: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x8d802000  ! 4578: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd6d804a0  ! 4579: LDXA_R	ldxa	[%r0, %r0] 0x25, %r11
	.word 0x8d9028db  ! 4580: WRPR_PSTATE_I	wrpr	%r0, 0x08db, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x80d0e001  ! 4582: UMULcc_I	umulcc 	%r3, 0x0001, %r0
	.word 0x9879c00b  ! 4583: SDIV_R	sdiv 	%r7, %r11, %r12
	.word 0xd9e7c02b  ! 4584: CASA_I	casa	[%r31] 0x 1, %r11, %r12
	.word 0xd81fc000  ! 4585: LDD_R	ldd	[%r31 + %r0], %r12
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x20700001  ! 4587: BPN	<illegal instruction>
	.word 0xd88008a0  ! 4588: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
DS_229:
	.word 0x22800001  ! 4590: BE	be,a	<label_0x1>
	illtrap
	.word 0x93b38309  ! 4589: ALLIGNADDRESS	alignaddr	%r14, %r9, %r9
	.word 0x9ba00d20  ! 4590: FsMULd	fsmuld	%f0, %f0, %f44
	.word 0x81982bdf  ! 4591: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bdf, %hpstate
	.word 0xda9004a0  ! 4592: LDUHA_R	lduha	[%r0, %r0] 0x25, %r13
	.word 0x8249a001  ! 4593: MULX_I	mulx 	%r6, 0x0001, %r1
	.word 0xc21fc000  ! 4594: LDD_R	ldd	[%r31 + %r0], %r1
	.word 0x81982b15  ! 4595: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b15, %hpstate
	.word 0xc2d00e80  ! 4596: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r1
	.word 0xc217e001  ! 4597: LDUH_I	lduh	[%r31 + 0x0001], %r1
	.word 0x819822d4  ! 4598: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02d4, %hpstate
	.word 0x8d902e40  ! 4599: WRPR_PSTATE_I	wrpr	%r0, 0x0e40, %pstate
	.word 0x3a800001  ! 4600: BCC	bcc,a	<label_0x1>
DS_230:
	.word 0x22800001  ! 4602: BE	be,a	<label_0x1>
	illtrap
	.word 0x89b34304  ! 4601: ALLIGNADDRESS	alignaddr	%r13, %r4, %r4
	.word 0x8fa049a0  ! 4602: FDIVs	fdivs	%f1, %f0, %f7
	.word 0x87802004  ! 4603: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xceffc020  ! 4604: SWAPA_R	swapa	%r7, [%r31 + %r0] 0x01
	.word 0x2a800001  ! 4605: BCS	bcs,a	<label_0x1>
	.word 0xce4fc000  ! 4606: LDSB_R	ldsb	[%r31 + %r0], %r7
DS_231:
	.word 0x22800001  ! 4608: BE	be,a	<label_0x1>
	.word 0xd732400d  ! 4608: STQF_R	-	%f11, [%r13, %r9]
	.word 0x93458000  ! 4607: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x87802088  ! 4608: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8d494000  ! 4609: RDHPR_HTBA	rdhpr	%htba, %r6
	mov 0x34, %r30
	.word 0x87d0001e  ! 4610: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x926a0009  ! 4611: UDIVX_R	udivx 	%r8, %r9, %r9
	.word 0xd28008a0  ! 4612: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x24800001  ! 4613: BLE	ble,a	<label_0x1>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9fa000cb  ! 4615: FNEGd	fnegd	%f42, %f46
	.word 0x8d90249a  ! 4616: WRPR_PSTATE_I	wrpr	%r0, 0x049a, %pstate
	.word 0x8d902651  ! 4617: WRPR_PSTATE_I	wrpr	%r0, 0x0651, %pstate
	.word 0xdec7e020  ! 4618: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r15
	.word 0x81982adf  ! 4619: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0adf, %hpstate
	.word 0x9b504000  ! 4620: RDPR_TNPC	rdpr	%tnpc, %r13
	.word 0x8d902e5e  ! 4621: WRPR_PSTATE_I	wrpr	%r0, 0x0e5e, %pstate
	.word 0x87802089  ! 4622: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x81982b1d  ! 4623: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b1d, %hpstate
	.word 0x97a00546  ! 4624: FSQRTd	fsqrt	
	.word 0x8198235b  ! 4625: WRHPR_HPSTATE_I	wrhpr	%r0, 0x035b, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8dd02034  ! 4627: Tcc_I	tneg	icc_or_xcc, %r0 + 52
	.word 0xd6ffc026  ! 4628: SWAPA_R	swapa	%r11, [%r31 + %r6] 0x01
	.word 0x9a51800d  ! 4629: UMUL_R	umul 	%r6, %r13, %r13
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8e002001  ! 4632: ADD_I	add 	%r0, 0x0001, %r7
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87682001  ! 4634: SDIVX_I	sdivx	%r0, 0x0001, %r3
	.word 0x8d902ac5  ! 4635: WRPR_PSTATE_I	wrpr	%r0, 0x0ac5, %pstate
	.word 0xc7e7c02d  ! 4636: CASA_I	casa	[%r31] 0x 1, %r13, %r3
	mov 0x31, %r30
	.word 0x81d0001e  ! 4637: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc69fe001  ! 4639: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r3
	.word 0x926a6001  ! 4640: UDIVX_I	udivx 	%r9, 0x0001, %r9
DS_232:
	.word 0x34800001  ! 4642: BG	bg,a	<label_0x1>
	.word 0xdb336001  ! 4642: STQF_I	-	%f13, [0x0001, %r13]
	.word 0x95458000  ! 4641: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0x99a08dc7  ! 4642: FdMULq	fdmulq	
	mov 0x30, %r30
	.word 0x87d0001e  ! 4643: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0xd88008a0  ! 4644: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x8f494000  ! 4645: RDHPR_HTBA	rdhpr	%htba, %r7
	.word 0xcec80e40  ! 4646: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r7
	.word 0x87802088  ! 4647: WRASI_I	wr	%r0, 0x0088, %asi
DS_233:
	.word 0x34800001  ! 4649: BG	bg,a	<label_0x1>
	illtrap
	.word 0x81b08307  ! 4648: ALLIGNADDRESS	alignaddr	%r2, %r7, %r0
	mov 0x35, %r30
	.word 0x83d0001e  ! 4649: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x20700001  ! 4650: BPN	<illegal instruction>
	.word 0x38800001  ! 4651: BGU	bgu,a	<label_0x1>
	.word 0x8198271c  ! 4652: WRHPR_HPSTATE_I	wrhpr	%r0, 0x071c, %hpstate
	.word 0x81a08dc2  ! 4653: FdMULq	fdmulq	
	.word 0x8d90284a  ! 4654: WRPR_PSTATE_I	wrpr	%r0, 0x084a, %pstate
	.word 0xc1e7c022  ! 4655: CASA_I	casa	[%r31] 0x 1, %r2, %r0
	.word 0x8d802004  ! 4656: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xc0ffc022  ! 4657: SWAPA_R	swapa	%r0, [%r31 + %r2] 0x01
	.word 0x3c800001  ! 4658: BPOS	bpos,a	<label_0x1>
	.word 0x9350c000  ! 4659: RDPR_TT	rdpr	%tt, %r9
	.word 0x91504000  ! 4660: RDPR_TNPC	rdpr	%tnpc, %r8
	.word 0x8d69800d  ! 4661: SDIVX_R	sdivx	%r6, %r13, %r6
	.word 0x34800001  ! 4662: BG	bg,a	<label_0x1>
	.word 0x8d902456  ! 4663: WRPR_PSTATE_I	wrpr	%r0, 0x0456, %pstate
DS_234:
	.word 0x20800001  ! 4665: BN	bn,a	<label_0x1>
	illtrap
	.word 0x93b28301  ! 4664: ALLIGNADDRESS	alignaddr	%r10, %r1, %r9
	.word 0x8d9024c7  ! 4665: WRPR_PSTATE_I	wrpr	%r0, 0x04c7, %pstate
	.word 0x93480000  ! 4666: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
	.word 0x856ba001  ! 4667: SDIVX_I	sdivx	%r14, 0x0001, %r2
	mov 0x32, %r30
	.word 0x8bd0001e  ! 4668: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x81982293  ! 4669: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0293, %hpstate
	.word 0xc497e020  ! 4670: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r2
	.word 0xc417e001  ! 4671: LDUH_I	lduh	[%r31 + 0x0001], %r2
	.word 0x819828de  ! 4672: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08de, %hpstate
	.word 0x9ba28dc2  ! 4673: FdMULq	fdmulq	
DS_235:
	.word 0x32800001  ! 4675: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x85b0030c  ! 4674: ALLIGNADDRESS	alignaddr	%r0, %r12, %r2
	.word 0x9680e001  ! 4675: ADDcc_I	addcc 	%r3, 0x0001, %r11
	ta	T_CHANGE_PRIV	! macro
	.word 0x9d504000  ! 4677: RDPR_TNPC	rdpr	%tnpc, %r14
	.word 0xdc5fe001  ! 4678: LDX_I	ldx	[%r31 + 0x0001], %r14
	.word 0xdc2fc00c  ! 4679: STB_R	stb	%r14, [%r31 + %r12]
	.word 0xdc57c000  ! 4680: LDSH_R	ldsh	[%r31 + %r0], %r14
	.word 0x9fa01a68  ! 4681: FqTOi	fqtoi	
	.word 0x81500000  ! 4682: RDPR_TPC	rdpr	%tpc, %r0
	.word 0x81982608  ! 4683: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0608, %hpstate
	.word 0x81982a0a  ! 4684: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a0a, %hpstate
	.word 0x8198201a  ! 4685: WRHPR_HPSTATE_I	wrhpr	%r0, 0x001a, %hpstate
	.word 0x81982c45  ! 4686: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c45, %hpstate
	.word 0x9e4a000b  ! 4687: MULX_R	mulx 	%r8, %r11, %r15
	.word 0xdec804a0  ! 4688: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r15
	.word 0x8d802000  ! 4689: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x819823c6  ! 4690: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03c6, %hpstate
	.word 0x81982004  ! 4691: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0004, %hpstate
	.word 0x83d02031  ! 4692: Tcc_I	te	icc_or_xcc, %r0 + 49
DS_236:
	.word 0x22800001  ! 4694: BE	be,a	<label_0x1>
	.word 0xc5322001  ! 4694: STQF_I	-	%f2, [0x0001, %r8]
	.word 0x8f458000  ! 4693: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0x81982991  ! 4694: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0991, %hpstate
	.word 0x81982e96  ! 4695: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e96, %hpstate
DS_237:
	.word 0x34800001  ! 4697: BG	bg,a	<label_0x1>
	.word 0xd333000e  ! 4697: STQF_R	-	%f9, [%r14, %r12]
	.word 0x99458000  ! 4696: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x84d3400c  ! 4697: UMULcc_R	umulcc 	%r13, %r12, %r2
	.word 0x81982506  ! 4698: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0506, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x88d90005  ! 4700: SMULcc_R	smulcc 	%r4, %r5, %r4
	.word 0x819828d4  ! 4701: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d4, %hpstate
	.word 0x36800001  ! 4702: BGE	bge,a	<label_0x1>
	.word 0xc937c005  ! 4703: STQF_R	-	%f4, [%r5, %r31]
	.word 0x97514000  ! 4704: RDPR_TBA	rdpr	%tba, %r11
	.word 0x81982c06  ! 4705: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c06, %hpstate
	.word 0x8a834003  ! 4706: ADDcc_R	addcc 	%r13, %r3, %r5
	.word 0x28800001  ! 4707: BLEU	bleu,a	<label_0x1>
	.word 0x8d902652  ! 4708: WRPR_PSTATE_I	wrpr	%r0, 0x0652, %pstate
	.word 0x9ba10dc7  ! 4709: FdMULq	fdmulq	
	ta	T_CHANGE_PRIV	! macro
	.word 0x81982a9b  ! 4711: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a9b, %hpstate
	.word 0xdb37c007  ! 4712: STQF_R	-	%f13, [%r7, %r31]
	ta	T_CHANGE_PRIV	! macro
	.word 0x81982854  ! 4714: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0854, %hpstate
	.word 0x87802080  ! 4715: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x87a10dcb  ! 4716: FdMULq	fdmulq	
	.word 0xc6c7e010  ! 4717: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r3
	.word 0xc797e001  ! 4718: LDQFA_I	-	[%r31, 0x0001], %f3
	.word 0x87802089  ! 4719: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x95480000  ! 4720: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
	.word 0x81a38dc9  ! 4721: FdMULq	fdmulq	
	.word 0xc0d7e020  ! 4722: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r0
	mov 0x32, %r30
	.word 0x83d0001e  ! 4723: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xc0800a80  ! 4724: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r0
	ta	T_CHANGE_HPRIV	! macro
	mov 0x32, %r30
	.word 0x9bd0001e  ! 4726: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x32700001  ! 4727: BPNE	<illegal instruction>
	.word 0x32800001  ! 4728: BNE	bne,a	<label_0x1>
	.word 0x28700001  ! 4729: BPLEU	<illegal instruction>
	.word 0x87802004  ! 4730: WRASI_I	wr	%r0, 0x0004, %asi
DS_238:
	.word 0x20800001  ! 4732: BN	bn,a	<label_0x1>
	.word 0xc3312001  ! 4732: STQF_I	-	%f1, [0x0001, %r4]
	.word 0x93458000  ! 4731: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x91d02034  ! 4732: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8d694003  ! 4733: SDIVX_R	sdivx	%r5, %r3, %r6
	.word 0x93a289e8  ! 4734: FDIVq	dis not found

	ta	T_CHANGE_HPRIV	! macro
	.word 0x819821d7  ! 4736: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01d7, %hpstate
	.word 0x8fa209cb  ! 4737: FDIVd	fdivd	%f8, %f42, %f38
	.word 0x8d902898  ! 4738: WRPR_PSTATE_I	wrpr	%r0, 0x0898, %pstate
	.word 0x81982653  ! 4739: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0653, %hpstate
	.word 0x81982c90  ! 4740: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c90, %hpstate
	.word 0x819822de  ! 4741: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02de, %hpstate
	.word 0x8198270f  ! 4742: WRHPR_HPSTATE_I	wrhpr	%r0, 0x070f, %hpstate
	.word 0x9b494000  ! 4743: RDHPR_HTBA	rdhpr	%htba, %r13
	.word 0xda8804a0  ! 4744: LDUBA_R	lduba	[%r0, %r0] 0x25, %r13
	.word 0x83a01a64  ! 4745: FqTOi	fqtoi	
	.word 0x87a0054a  ! 4746: FSQRTd	fsqrt	
	.word 0x9ad9000e  ! 4747: SMULcc_R	smulcc 	%r4, %r14, %r13
	.word 0xda8008a0  ! 4748: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x8d9024d5  ! 4749: WRPR_PSTATE_I	wrpr	%r0, 0x04d5, %pstate
	.word 0x8d902013  ! 4750: WRPR_PSTATE_I	wrpr	%r0, 0x0013, %pstate
	.word 0xda5fc000  ! 4751: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xda9fe001  ! 4752: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r13
	ta	T_CHANGE_HPRIV	! macro
	.word 0x3c800001  ! 4754: BPOS	bpos,a	<label_0x1>
	.word 0x8d902249  ! 4755: WRPR_PSTATE_I	wrpr	%r0, 0x0249, %pstate
	.word 0x8198221e  ! 4756: WRHPR_HPSTATE_I	wrhpr	%r0, 0x021e, %hpstate
	.word 0x8d902a8b  ! 4757: WRPR_PSTATE_I	wrpr	%r0, 0x0a8b, %pstate
	ta	T_CHANGE_PRIV	! macro
	mov 0x30, %r30
	.word 0x8bd0001e  ! 4759: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0xdad004a0  ! 4760: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r13
	.word 0x87802010  ! 4761: WRASI_I	wr	%r0, 0x0010, %asi
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x34700001  ! 4763: BPG	<illegal instruction>
	.word 0xda8008a0  ! 4764: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x8d902651  ! 4765: WRPR_PSTATE_I	wrpr	%r0, 0x0651, %pstate
	.word 0x9fa000c1  ! 4766: FNEGd	fnegd	%f32, %f46
	.word 0x946a4003  ! 4767: UDIVX_R	udivx 	%r9, %r3, %r10
	.word 0x87802004  ! 4768: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x95a00546  ! 4769: FSQRTd	fsqrt	
	.word 0xd4d7e000  ! 4770: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r10
	.word 0xd48804a0  ! 4771: LDUBA_R	lduba	[%r0, %r0] 0x25, %r10
	.word 0xd48804a0  ! 4772: LDUBA_R	lduba	[%r0, %r0] 0x25, %r10
	.word 0x81982d48  ! 4773: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d48, %hpstate
	.word 0xd4d004a0  ! 4774: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8198298a  ! 4776: WRHPR_HPSTATE_I	wrhpr	%r0, 0x098a, %hpstate
	.word 0x30700001  ! 4777: BPA	<illegal instruction>
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d902cd3  ! 4779: WRPR_PSTATE_I	wrpr	%r0, 0x0cd3, %pstate
	.word 0xd4800a80  ! 4780: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r10
DS_239:
	.word 0x22800001  ! 4782: BE	be,a	<label_0x1>
	illtrap
	.word 0x8fb00303  ! 4781: ALLIGNADDRESS	alignaddr	%r0, %r3, %r7
	.word 0xcecfe010  ! 4782: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r7
DS_240:
	.word 0x32800001  ! 4784: BNE	bne,a	<label_0x1>
	.word 0xc5320003  ! 4784: STQF_R	-	%f2, [%r3, %r8]
	.word 0x89458000  ! 4783: RD_SOFTINT_REG	rd	%softint, %r4
	.word 0xc8ffc023  ! 4784: SWAPA_R	swapa	%r4, [%r31 + %r3] 0x01
	.word 0x8d802000  ! 4785: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9c4a8003  ! 4786: MULX_R	mulx 	%r10, %r3, %r14
	.word 0x83a3c9ca  ! 4787: FDIVd	fdivd	%f46, %f10, %f32
DS_241:
	.word 0x20800001  ! 4789: BN	bn,a	<label_0x1>
	illtrap
	.word 0x8db28307  ! 4788: ALLIGNADDRESS	alignaddr	%r10, %r7, %r6
	mov 0x35, %r30
	.word 0x91d0001e  ! 4789: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xccc004a0  ! 4790: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r6
	.word 0x9951c000  ! 4791: RDPR_TL	rdpr	%tl, %r12
	.word 0x886ac00f  ! 4792: UDIVX_R	udivx 	%r11, %r15, %r4
	.word 0x93a000c1  ! 4793: FNEGd	fnegd	%f32, %f40
	.word 0x8d902a19  ! 4794: WRPR_PSTATE_I	wrpr	%r0, 0x0a19, %pstate
	.word 0x32700001  ! 4795: BPNE	<illegal instruction>
	.word 0x8d902a5d  ! 4796: WRPR_PSTATE_I	wrpr	%r0, 0x0a5d, %pstate
	.word 0x81982284  ! 4797: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0284, %hpstate
	.word 0x8198201b  ! 4798: WRHPR_HPSTATE_I	wrhpr	%r0, 0x001b, %hpstate
	.word 0x81982280  ! 4799: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0280, %hpstate
	.word 0x8fd02035  ! 4800: Tcc_I	tvs	icc_or_xcc, %r0 + 53
	.word 0xd28804a0  ! 4801: LDUBA_R	lduba	[%r0, %r0] 0x25, %r9
	.word 0x819824c2  ! 4802: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04c2, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd2d004a0  ! 4804: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r9
	.word 0x819825cd  ! 4805: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05cd, %hpstate
	.word 0x8d902a46  ! 4806: WRPR_PSTATE_I	wrpr	%r0, 0x0a46, %pstate
	.word 0x87802088  ! 4807: WRASI_I	wr	%r0, 0x0088, %asi
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9d494000  ! 4809: RDHPR_HTBA	rdhpr	%htba, %r14
	.word 0x9d514000  ! 4810: RDPR_TBA	rdpr	%tba, %r14
	.word 0x8048800f  ! 4811: MULX_R	mulx 	%r2, %r15, %r0
	.word 0xc0800ac0  ! 4812: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r0
	.word 0x8d802004  ! 4813: WRFPRS_I	wr	%r0, 0x0004, %fprs
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0xc0800ae0  ! 4817: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r0
	.word 0x20800001  ! 4818: BN	bn,a	<label_0x1>
	.word 0x8d802000  ! 4819: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x2a800001  ! 4820: BCS	bcs,a	<label_0x1>
	.word 0x98c0e001  ! 4821: ADDCcc_I	addccc 	%r3, 0x0001, %r12
	.word 0x2e700001  ! 4822: BPVS	<illegal instruction>
	.word 0x8fa000c6  ! 4823: FNEGd	fnegd	%f6, %f38
DS_242:
	.word 0x34800001  ! 4825: BG	bg,a	<label_0x1>
	.word 0xc133e001  ! 4825: STQF_I	-	%f0, [0x0001, %r15]
	.word 0x95458000  ! 4824: RD_SOFTINT_REG	rd	%softint, %r10
	mov 0x32, %r30
	.word 0x85d0001e  ! 4825: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd4d00e60  ! 4827: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r10
	.word 0x8fa149ab  ! 4828: FDIVs	fdivs	%f5, %f11, %f7
	.word 0x90d28008  ! 4829: UMULcc_R	umulcc 	%r10, %r8, %r8
	.word 0x8fa149c4  ! 4830: FDIVd	fdivd	%f36, %f4, %f38
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9601a001  ! 4832: ADD_I	add 	%r6, 0x0001, %r11
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x85a01a6c  ! 4836: FqTOi	fqtoi	
	.word 0x81982a9d  ! 4837: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a9d, %hpstate
DS_243:
	.word 0x22800001  ! 4839: BE	be,a	<label_0x1>
	illtrap
	.word 0x87b30307  ! 4838: ALLIGNADDRESS	alignaddr	%r12, %r7, %r3
	mov 0x31, %r30
	.word 0x85d0001e  ! 4839: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x9b692001  ! 4840: SDIVX_I	sdivx	%r4, 0x0001, %r13
	.word 0x81982195  ! 4841: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0195, %hpstate
	.word 0xdbe7c027  ! 4842: CASA_I	casa	[%r31] 0x 1, %r7, %r13
	.word 0x8d902407  ! 4843: WRPR_PSTATE_I	wrpr	%r0, 0x0407, %pstate
	mov 0x31, %r30
	.word 0x8dd0001e  ! 4844: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0xda8008a0  ! 4845: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x81982ddf  ! 4846: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ddf, %hpstate
DS_244:
	.word 0x20800001  ! 4848: BN	bn,a	<label_0x1>
	illtrap
	.word 0x81b3c30b  ! 4847: ALLIGNADDRESS	alignaddr	%r15, %r11, %r0
	.word 0x81982996  ! 4848: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0996, %hpstate
	.word 0x8d902483  ! 4849: WRPR_PSTATE_I	wrpr	%r0, 0x0483, %pstate
	.word 0x819825c8  ! 4850: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05c8, %hpstate
	mov 0x33, %r30
	.word 0x9fd0001e  ! 4851: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	mov 0x31, %r30
	.word 0x81d0001e  ! 4852: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x819827da  ! 4853: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07da, %hpstate
DS_245:
	.word 0x34800001  ! 4855: BG	bg,a	<label_0x1>
	illtrap
	.word 0x81b2c305  ! 4854: ALLIGNADDRESS	alignaddr	%r11, %r5, %r0
	.word 0x8bd02031  ! 4855: Tcc_I	tcs	icc_or_xcc, %r0 + 49
	.word 0xc197e001  ! 4856: LDQFA_I	-	[%r31, 0x0001], %f0
	.word 0x8d902259  ! 4857: WRPR_PSTATE_I	wrpr	%r0, 0x0259, %pstate
	.word 0x9da10dc0  ! 4858: FdMULq	fdmulq	
	.word 0xdc47c000  ! 4859: LDSW_R	ldsw	[%r31 + %r0], %r14
	.word 0x819829de  ! 4860: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09de, %hpstate
	.word 0x81982f9e  ! 4861: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f9e, %hpstate
	.word 0xdc0fe001  ! 4862: LDUB_I	ldub	[%r31 + 0x0001], %r14
	.word 0x2c800001  ! 4863: BNEG	bneg,a	<label_0x1>
	.word 0xdc8008a0  ! 4864: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r14
	.word 0x9451c004  ! 4865: UMUL_R	umul 	%r7, %r4, %r10
DS_246:
	.word 0x20800001  ! 4867: BN	bn,a	<label_0x1>
	.word 0xdf326001  ! 4867: STQF_I	-	%f15, [0x0001, %r9]
	.word 0x95458000  ! 4866: RD_SOFTINT_REG	rd	%softint, %r10
	ta	T_CHANGE_TO_TL0	! macro
	mov 0x34, %r30
	.word 0x97d0001e  ! 4868: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x826a6001  ! 4869: UDIVX_I	udivx 	%r9, 0x0001, %r1
	.word 0x807b6001  ! 4870: SDIV_I	sdiv 	%r13, 0x0001, %r0
	.word 0x81a01a6a  ! 4871: FqTOi	fqtoi	
	.word 0x3c700001  ! 4872: BPPOS	<illegal instruction>
	.word 0x97a0054c  ! 4873: FSQRTd	fsqrt	
	.word 0x8d802004  ! 4874: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d902c05  ! 4875: WRPR_PSTATE_I	wrpr	%r0, 0x0c05, %pstate
	.word 0x3e700001  ! 4876: BPVC	<illegal instruction>
	.word 0xd67fe001  ! 4877: SWAP_I	swap	%r11, [%r31 + 0x0001]
	.word 0x8d902e9c  ! 4878: WRPR_PSTATE_I	wrpr	%r0, 0x0e9c, %pstate
	.word 0xd627e001  ! 4879: STW_I	stw	%r11, [%r31 + 0x0001]
	.word 0x87802089  ! 4880: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xd69fc020  ! 4881: LDDA_R	ldda	[%r31, %r0] 0x01, %r11
	.word 0x87802088  ! 4882: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x926be001  ! 4883: UDIVX_I	udivx 	%r15, 0x0001, %r9
	.word 0x81982040  ! 4884: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0040, %hpstate
	.word 0x8198229c  ! 4885: WRHPR_HPSTATE_I	wrhpr	%r0, 0x029c, %hpstate
	.word 0x9cd3a001  ! 4886: UMULcc_I	umulcc 	%r14, 0x0001, %r14
	.word 0xdcffc02c  ! 4887: SWAPA_R	swapa	%r14, [%r31 + %r12] 0x01
	.word 0x81982885  ! 4888: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0885, %hpstate
	.word 0x8d902cde  ! 4889: WRPR_PSTATE_I	wrpr	%r0, 0x0cde, %pstate
	.word 0x85d02030  ! 4890: Tcc_I	tle	icc_or_xcc, %r0 + 48
	.word 0x8d902c94  ! 4891: WRPR_PSTATE_I	wrpr	%r0, 0x0c94, %pstate
	.word 0xdcdfe010  ! 4892: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r14
	.word 0x8e828001  ! 4893: ADDcc_R	addcc 	%r10, %r1, %r7
	.word 0x9fa249e7  ! 4894: FDIVq	dis not found

	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x87802088  ! 4896: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xde7fe001  ! 4897: SWAP_I	swap	%r15, [%r31 + 0x0001]
	mov 0x35, %r30
	.word 0x9bd0001e  ! 4898: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	mov 0x35, %r30
	.word 0x93d0001e  ! 4899: Tcc_R	tne	icc_or_xcc, %r0 + %r30
DS_247:
	.word 0x32800001  ! 4901: BNE	bne,a	<label_0x1>
	.word 0xd1316001  ! 4901: STQF_I	-	%f8, [0x0001, %r5]
	.word 0x8d458000  ! 4900: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0x93a0c9a5  ! 4901: FDIVs	fdivs	%f3, %f5, %f9
	.word 0xd28008a0  ! 4902: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x8d90244e  ! 4903: WRPR_PSTATE_I	wrpr	%r0, 0x044e, %pstate
	.word 0x8a6a800d  ! 4904: UDIVX_R	udivx 	%r10, %r13, %r5
	.word 0xca8008a0  ! 4905: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0x81982d00  ! 4906: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d00, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8551c000  ! 4908: RDPR_TL	rdpr	%tl, %r2
	.word 0x81982f86  ! 4909: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f86, %hpstate
	.word 0x8dd02033  ! 4910: Tcc_I	tneg	icc_or_xcc, %r0 + 51
	.word 0xc48fe000  ! 4911: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r2
	mov 0x35, %r30
	.word 0x85d0001e  ! 4912: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x8c69c003  ! 4913: UDIVX_R	udivx 	%r7, %r3, %r6
DS_248:
	.word 0x34800001  ! 4915: BG	bg,a	<label_0x1>
	illtrap
	.word 0x9fb3c300  ! 4914: ALLIGNADDRESS	alignaddr	%r15, %r0, %r15
	.word 0x8d90265b  ! 4915: WRPR_PSTATE_I	wrpr	%r0, 0x065b, %pstate
	.word 0x8d90288c  ! 4916: WRPR_PSTATE_I	wrpr	%r0, 0x088c, %pstate
	.word 0xdec80e40  ! 4917: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r15
	.word 0x9c7a2001  ! 4918: SDIV_I	sdiv 	%r8, 0x0001, %r14
	.word 0xdd37c000  ! 4919: STQF_R	-	%f14, [%r0, %r31]
	.word 0xdcd7e030  ! 4920: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r14
	.word 0x819825d7  ! 4921: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05d7, %hpstate
	.word 0x8d902a40  ! 4922: WRPR_PSTATE_I	wrpr	%r0, 0x0a40, %pstate
	.word 0x9568c00e  ! 4923: SDIVX_R	sdivx	%r3, %r14, %r10
	mov 0x32, %r30
	.word 0x85d0001e  ! 4924: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	mov 0x30, %r30
	.word 0x9bd0001e  ! 4925: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x81982803  ! 4926: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0803, %hpstate
	.word 0x3c800001  ! 4927: BPOS	bpos,a	<label_0x1>
	.word 0x85a189a4  ! 4928: FDIVs	fdivs	%f6, %f4, %f2
	.word 0x84822001  ! 4929: ADDcc_I	addcc 	%r8, 0x0001, %r2
	.word 0x81982606  ! 4930: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0606, %hpstate
	.word 0x81982b96  ! 4931: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b96, %hpstate
	.word 0xc427c004  ! 4932: STW_R	stw	%r2, [%r31 + %r4]
	.word 0x81a249ee  ! 4933: FDIVq	dis not found

	.word 0x8198248a  ! 4934: WRHPR_HPSTATE_I	wrhpr	%r0, 0x048a, %hpstate
	.word 0xc05fc000  ! 4935: LDX_R	ldx	[%r31 + %r0], %r0
	.word 0x89d02032  ! 4936: Tcc_I	tleu	icc_or_xcc, %r0 + 50
	.word 0x8fa1c9c8  ! 4937: FDIVd	fdivd	%f38, %f8, %f38
	.word 0x8fd02033  ! 4938: Tcc_I	tvs	icc_or_xcc, %r0 + 51
	.word 0x826be001  ! 4939: UDIVX_I	udivx 	%r15, 0x0001, %r1
	.word 0x95504000  ! 4940: RDPR_TNPC	rdpr	%tnpc, %r10
	.word 0x8d802000  ! 4941: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982b1b  ! 4942: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b1b, %hpstate
DS_249:
	.word 0x22800001  ! 4944: BE	be,a	<label_0x1>
	.word 0xd131a001  ! 4944: STQF_I	-	%f8, [0x0001, %r6]
	.word 0x9f458000  ! 4943: RD_SOFTINT_REG	rd	%softint, %r15
	.word 0xde8008a0  ! 4944: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r15
	.word 0x87802080  ! 4945: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xdec804a0  ! 4946: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r15
	.word 0x81982787  ! 4947: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0787, %hpstate
	.word 0x20700001  ! 4948: BPN	<illegal instruction>
	.word 0x8d9022c1  ! 4949: WRPR_PSTATE_I	wrpr	%r0, 0x02c1, %pstate
	.word 0x91d02034  ! 4950: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x846ac00e  ! 4951: UDIVX_R	udivx 	%r11, %r14, %r2
DS_250:
	.word 0x22800001  ! 4953: BE	be,a	<label_0x1>
	illtrap
	.word 0x91b3c308  ! 4952: ALLIGNADDRESS	alignaddr	%r15, %r8, %r8
	.word 0x34800001  ! 4953: BG	bg,a	<label_0x1>
	.word 0x97a000cb  ! 4954: FNEGd	fnegd	%f42, %f42
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d9026c0  ! 4956: WRPR_PSTATE_I	wrpr	%r0, 0x06c0, %pstate
	.word 0x81982fd3  ! 4957: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd3, %hpstate
	.word 0x9002e001  ! 4958: ADD_I	add 	%r11, 0x0001, %r8
	.word 0x98c36001  ! 4959: ADDCcc_I	addccc 	%r13, 0x0001, %r12
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8c6b800f  ! 4961: UDIVX_R	udivx 	%r14, %r15, %r6
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xcc5fe001  ! 4963: LDX_I	ldx	[%r31 + 0x0001], %r6
	mov 0x34, %r30
	.word 0x8fd0001e  ! 4964: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 4965: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87802080  ! 4966: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xcc7fe001  ! 4967: SWAP_I	swap	%r6, [%r31 + 0x0001]
	.word 0x98692001  ! 4968: UDIVX_I	udivx 	%r4, 0x0001, %r12
	.word 0x819826db  ! 4969: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06db, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0xd897e010  ! 4972: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r12
	.word 0x81a049e1  ! 4973: FDIVq	dis not found

	.word 0xc09004a0  ! 4974: LDUHA_R	lduha	[%r0, %r0] 0x25, %r0
	.word 0x8d802000  ! 4975: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x86686001  ! 4976: UDIVX_I	udivx 	%r1, 0x0001, %r3
	.word 0x8d902495  ! 4977: WRPR_PSTATE_I	wrpr	%r0, 0x0495, %pstate
	.word 0x8bd02034  ! 4978: Tcc_I	tcs	icc_or_xcc, %r0 + 52
	.word 0xc68fe030  ! 4979: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r3
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d902e0d  ! 4981: WRPR_PSTATE_I	wrpr	%r0, 0x0e0d, %pstate
	.word 0xc737e001  ! 4982: STQF_I	-	%f3, [0x0001, %r31]
	.word 0x86c1e001  ! 4983: ADDCcc_I	addccc 	%r7, 0x0001, %r3
	.word 0x8d90261b  ! 4984: WRPR_PSTATE_I	wrpr	%r0, 0x061b, %pstate
	.word 0x81982a41  ! 4985: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a41, %hpstate
	mov 0x34, %r30
	.word 0x9fd0001e  ! 4986: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x8d902e9b  ! 4987: WRPR_PSTATE_I	wrpr	%r0, 0x0e9b, %pstate
	.word 0x8d902050  ! 4988: WRPR_PSTATE_I	wrpr	%r0, 0x0050, %pstate
	.word 0x95a00543  ! 4989: FSQRTd	fsqrt	
	.word 0x8d9026cc  ! 4990: WRPR_PSTATE_I	wrpr	%r0, 0x06cc, %pstate
	.word 0xd537c003  ! 4991: STQF_R	-	%f10, [%r3, %r31]
	.word 0xd5e7c023  ! 4992: CASA_I	casa	[%r31] 0x 1, %r3, %r10
DS_251:
	.word 0x22800001  ! 4994: BE	be,a	<label_0x1>
	illtrap
	.word 0x9bb18306  ! 4993: ALLIGNADDRESS	alignaddr	%r6, %r6, %r13
	.word 0xda8fe030  ! 4994: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r13
	.word 0xda1fc000  ! 4995: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0x87802088  ! 4996: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8da3cdc4  ! 4997: FdMULq	fdmulq	
	.word 0x8d902005  ! 4998: WRPR_PSTATE_I	wrpr	%r0, 0x0005, %pstate


.data
user_data_start:
	.xword	0x1d96236185534388
	.xword	0x77c725de56f86591
	.xword	0x4858c6462205fc32
	.xword	0xd858be231dec82ac
	.xword	0xdbfae062f3d02693
	.xword	0xc674fe4dd737d7ab
	.xword	0xe4365d2451cb41bd
	.xword	0x4460809b0399c0ec
	.xword	0x8053e44ce8d2ee7f
	.xword	0xca32ae3f8f83ebe4
	.xword	0xa2549861d60a016d
	.xword	0x52985881da263c27
	.xword	0x656bd27aa174be94
	.xword	0x8e1506490cbd28de
	.xword	0xc7e6bd07672823ab
	.xword	0x63cbe4cbb5eb6be7
	.xword	0xfea3aaec50f74e5a
	.xword	0xc8507ebd5b119687
	.xword	0x5c4347f26d1ef206
	.xword	0x2e2d8eccd10157d0
	.xword	0x3cd306d37e747811
	.xword	0xaa125381a23f41dd
	.xword	0xa02df9fe7b016004
	.xword	0xec929c5d935791dc
	.xword	0xb2fb141ff8b38908
	.xword	0x2ac4b2477f81f14e
	.xword	0xb7ddcf9f9eed215e
	.xword	0xe18de0f0620c711e
	.xword	0x28a2bc4f2e7b4271
	.xword	0xd3205e82315ed483
	.xword	0xcae22ac0932d9355
	.xword	0xdb65680f92e0f8f0
	.xword	0x0fe6a5ad3e1aa870
	.xword	0xa98b4559bf6254b6
	.xword	0x80ea40fed7f8420f
	.xword	0x7607081d96ad9b0d
	.xword	0x427dec9d6a5297d3
	.xword	0x00eab0bf6db91711
	.xword	0x004c6c74da8a18f7
	.xword	0x1d8e0bb52368dc86
	.xword	0xa39e924671e99c5d
	.xword	0xb24c4ea5eaaf57f0
	.xword	0xb4476bbbd2678d2a
	.xword	0x5682c3f1b13475f1
	.xword	0x9f32f3cd50670294
	.xword	0xe38f4c2624db4707
	.xword	0x7a91c1ab897313e9
	.xword	0xc6384dc2e61423b2
	.xword	0x1f2aed9607ef903d
	.xword	0x9524e27a3ff2a465
	.xword	0x745e87664e0f5231
	.xword	0xe3cae688232292d0
	.xword	0x433dc198b896e2b0
	.xword	0xa1668dd8698868e5
	.xword	0x246e260dfe28f268
	.xword	0x38bbf2eaccf7a6f7
	.xword	0x605cc8995359afce
	.xword	0xe9ae869449dcff5a
	.xword	0xa492a0d602061918
	.xword	0x3aa1239bfcf07204
	.xword	0x0d850a68a83d8fa0
	.xword	0x1146c5bd80610486
	.xword	0x3833372715db111f
	.xword	0x43958a0772d4245d
	.xword	0x1c98aa60342ce92d
	.xword	0x3518fc1b4e8b47ca
	.xword	0xf899ed32e6c2fdd1
	.xword	0xaf9c697f4f33d5f9
	.xword	0xce5a8770977c4393
	.xword	0x638bfd0c1d21e454
	.xword	0x954264982c3fcb50
	.xword	0xebadede3296cabd1
	.xword	0x73eccb00bb57df5f
	.xword	0xfc34b7e5146338bd
	.xword	0xb95206cf7b6b93f0
	.xword	0x711094dae97da498
	.xword	0xa3b3f694393f5534
	.xword	0xcd03b0aa20c1d393
	.xword	0x893f1b1547de9bad
	.xword	0xd0851b3131ac91af
	.xword	0x6d3e6f78d6f6fc59
	.xword	0xcf75e5058d3bd8c5
	.xword	0x5668c1e6d18b248e
	.xword	0x0a8999e2dba4ed62
	.xword	0xc7a7365062ffe88c
	.xword	0x76f7e507575b3bd8
	.xword	0x92b559eedcf73e56
	.xword	0x1a594cf42b7a9cbe
	.xword	0x9459c088d31604e9
	.xword	0xd4d828428569f8df
	.xword	0xce778a34ac556044
	.xword	0xf8aa075263a18907
	.xword	0x48e1eea56987ed4b
	.xword	0x585d517c952b867b
	.xword	0x768028f1f660d31e
	.xword	0x8ddab886f090e7e6
	.xword	0xf33016ed115d4674
	.xword	0xd4f0222a88add18b
	.xword	0x86474bcf823c5404
	.xword	0x8aaca4f855ebe60d
	.xword	0xf5c2c5653f990c19
	.xword	0x8cd7075a745508d4
	.xword	0xfba1ff9c618fe3c8
	.xword	0x3994ccf38da6e3e4
	.xword	0x8a319a5fa29801c9
	.xword	0xe2b89c7e532f5176
	.xword	0xd0e48c16348b2d0a
	.xword	0x2a33e0dec75b93af
	.xword	0xbfd64ba64867b1f8
	.xword	0x1edb9ea93c08e7cf
	.xword	0xe21c7c77f87e8921
	.xword	0xdbd843601beaf42a
	.xword	0x4456485228caa6c9
	.xword	0x34d564fd3248d846
	.xword	0x233ffb650a6e7574
	.xword	0x3d39261a808ac19b
	.xword	0x48e0c6046dce3d56
	.xword	0xe25af0fa79051e3a
	.xword	0x9801e791aff47cee
	.xword	0xfb65856cdad76996
	.xword	0xaef64f619ff69b73
	.xword	0xe6a6e65a1552b064
	.xword	0x24c0e8493b55c3cc
	.xword	0x8cc45734a032e4d5
	.xword	0xb4566f27ae90d5bc
	.xword	0x3e3463c6a550d53c
	.xword	0x54991f4654780932
	.xword	0xd626c8e21faca8e3
	.xword	0x48adbac1568cba25
	.xword	0x5dad326454c04c93
	.xword	0x49ee93efc517b220
	.xword	0x98ec8eb1803ad992
	.xword	0x3ff95cc2a27e5ce7
	.xword	0x2ae6e5d1d1afd74f
	.xword	0x0546ca4dba3460f7
	.xword	0xe8685d21b8f66bc7
	.xword	0x064514ae22355bf8
	.xword	0x6382e6a9bb9943d6
	.xword	0x92e8ecaadfad9364
	.xword	0xfe13634156197a55
	.xword	0x981e45fce13daa9a
	.xword	0x977ff2580d1df429
	.xword	0x447d6cc7f5b2d743
	.xword	0x24c32d6355e4af8b
	.xword	0x40005cc2f9332150
	.xword	0xf2212e6760dbe8e3
	.xword	0x2aaf34020636e938
	.xword	0x8b7fc90001713e55
	.xword	0x999721ca4516af06
	.xword	0xcd399ffd9a26c995
	.xword	0x9c726297771f1111
	.xword	0xa1fa82c9ae133d39
	.xword	0x7cba2394a7254422
	.xword	0xe9a0dc53f38271d2
	.xword	0x6e6a21b71a56d646
	.xword	0x9d8cd6822b2c0f41
	.xword	0x0cef53d4816a1589
	.xword	0x3e3160ef55a0f48a
	.xword	0xa70708930473a24d
	.xword	0xfd953191fde16072
	.xword	0x67917f0021f6a256
	.xword	0x89c79f5d87384740
	.xword	0xe4da0aa85097d20b
	.xword	0xa1bd88d9bc0b2f22
	.xword	0x766446a075f846a6
	.xword	0x67c7120c7e5172ac
	.xword	0x7dabc24101d758a0
	.xword	0xabcb902486bebf52
	.xword	0x59d4478d00e562eb
	.xword	0xf516fa0145633c13
	.xword	0x3b4061f02d0543cb
	.xword	0x1724f630d9817214
	.xword	0xb2bdc5ca61e715ef
	.xword	0x3b90361a0920aea0
	.xword	0x335132f4dc04cf7a
	.xword	0x330a612700468146
	.xword	0xf7f73c6cb94297f4
	.xword	0x91b515d5176d3789
	.xword	0xff20920f474a4d01
	.xword	0x7104b2cdff976a37
	.xword	0xb4f492015dccec3d
	.xword	0x8aeda18b0b96bdbc
	.xword	0xcbb354a49b0365a7
	.xword	0xb2ccdbecfc31254f
	.xword	0xe94539905d766341
	.xword	0x58eacfc9150323fe
	.xword	0x06608a7b550cf435
	.xword	0x997eaeac5903956e
	.xword	0x8cb85e5a0222bbc4
	.xword	0x824ad9e883e4f8f7
	.xword	0xe23c2c95ea3b2726
	.xword	0x43e23bb75d27c770
	.xword	0x3a0ea264074e2148
	.xword	0xe5690f4bfb59160b
	.xword	0xc539322fe9feed54
	.xword	0x2a30af7db5632947
	.xword	0xb9582741c3ae859b
	.xword	0xe885cc53327e50f5
	.xword	0x8eea8ea7c3d5545f
	.xword	0xeda3dc399107b58f
	.xword	0xfdf54b97a2da71be
	.xword	0xc08382c93089d8f0
	.xword	0x9bcef9263d9b6838
	.xword	0xb87a5fb930d53db4
	.xword	0xe4713bc3c80e3a8a
	.xword	0x2ecaa07ee2ebbe2c
	.xword	0xbee17dbfd9d77274
	.xword	0x51aeaeda385fa145
	.xword	0x010638abcbb7e8b7
	.xword	0x5db36fdf48fc648d
	.xword	0xa6630c1640f64dd0
	.xword	0x52c376f1fb492a20
	.xword	0x5365a0a156b57e58
	.xword	0xa49f0fc01a1c6b38
	.xword	0x276ebc3da2c7e184
	.xword	0xf745adeefef4e585
	.xword	0x23d8721afc16f29c
	.xword	0x439a2ad3f43a7d4c
	.xword	0xc317fb1fccfb9bf9
	.xword	0x5bdd0dfd4387f9ef
	.xword	0xbf539e9710e4055d
	.xword	0x19c68acef1432946
	.xword	0xa4c2c901cf824bde
	.xword	0x74a79d42280beed4
	.xword	0xabdb4f683261a9a6
	.xword	0x36b1111298f32308
	.xword	0xc547da00cc4da85f
	.xword	0xcfc8e3a801679dd7
	.xword	0xb33c6138675405e8
	.xword	0xe8b5f92ab03d0d56
	.xword	0x8ebfb9881b46433c
	.xword	0xa591b1e7a0d98121
	.xword	0xeb645a0752d27699
	.xword	0xfa72f5663a96e09f
	.xword	0xcb58fa50655951e7
	.xword	0xd29952841b5f77e7
	.xword	0xc08c33b77a24dfc7
	.xword	0x176f9ffd152e3c7d
	.xword	0x44eaa4e149bda651
	.xword	0xf07328900188a78f
	.xword	0xb887c42ef154f4a2
	.xword	0xf9160a5d3ad2b065
	.xword	0xb124cb924ef25822
	.xword	0xf45989623d7c7b2b
	.xword	0x77bd4ccefdd366f8
	.xword	0x80be78228ad342f6
	.xword	0x40227c548058047f
	.xword	0xeea203398cfb7c8e
	.xword	0xd50f6b0f8938f987
	.xword	0xb24e053c8f771512
	.xword	0xaca379e9c17b96ca
	.xword	0x433014c6c06ccc18
	.xword	0x1dd062f65a49b9bf
	.xword	0xee250b27aeaa0169
	.xword	0x42aa4f1bd5f04a8c
	.xword	0x95a4f65d16857d3b


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
