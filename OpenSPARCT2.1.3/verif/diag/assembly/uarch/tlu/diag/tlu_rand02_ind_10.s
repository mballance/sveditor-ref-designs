/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand02_ind_10.s
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
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d902000  ! 2: WRPR_PSTATE_I	wrpr	%r0, 0x0000, %pstate
	.word 0x85494000  ! 3: RDHPR_HTBA	rdhpr	%htba, %r2
	.word 0x8198279e  ! 4: WRHPR_HPSTATE_I	wrhpr	%r0, 0x079e, %hpstate
DS_0:
	.word 0x20800001  ! 6: BN	bn,a	<label_0x1>
	illtrap
	.word 0x8db14309  ! 5: ALLIGNADDRESS	alignaddr	%r5, %r9, %r6
	.word 0xcc3fe001  ! 6: STD_I	std	%r6, [%r31 + 0x0001]
	.word 0x81982d1c  ! 7: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d1c, %hpstate
	.word 0x9a696001  ! 8: UDIVX_I	udivx 	%r5, 0x0001, %r13
	.word 0x87802010  ! 9: WRASI_I	wr	%r0, 0x0010, %asi
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x83480000  ! 11: RDHPR_HPSTATE	rdhpr	%hpstate, %r1
	.word 0x8d802000  ! 12: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc2c004a0  ! 13: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r1
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d902cdc  ! 15: WRPR_PSTATE_I	wrpr	%r0, 0x0cdc, %pstate
	.word 0xc33fe001  ! 16: STDF_I	std	%f1, [0x0001, %r31]
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8b50c000  ! 19: RDPR_TT	rdpr	%tt, %r5
	.word 0x8ba000c4  ! 20: FNEGd	fnegd	%f4, %f36
	.word 0x8a4a0008  ! 21: MULX_R	mulx 	%r8, %r8, %r5
	.word 0xcad004a0  ! 22: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r5
	.word 0x81982a0a  ! 23: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a0a, %hpstate
	.word 0x81982617  ! 24: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0617, %hpstate
	.word 0xcb3fc008  ! 25: STDF_R	std	%f5, [%r8, %r31]
	.word 0x81982f89  ! 26: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f89, %hpstate
	.word 0x99d02030  ! 27: Tcc_I	tgu	icc_or_xcc, %r0 + 48
	.word 0xcb37c008  ! 28: STQF_R	-	%f5, [%r8, %r31]
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902c04  ! 31: WRPR_PSTATE_I	wrpr	%r0, 0x0c04, %pstate
	.word 0x87802080  ! 32: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x81982990  ! 33: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0990, %hpstate
	.word 0x8d902649  ! 34: WRPR_PSTATE_I	wrpr	%r0, 0x0649, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97d02030  ! 36: Tcc_I	tge	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01a6f  ! 38: FqTOi	fqtoi	
	.word 0xdb3fe001  ! 39: STDF_I	std	%f13, [0x0001, %r31]
	.word 0xda7fe001  ! 40: SWAP_I	swap	%r13, [%r31 + 0x0001]
	.word 0x92c12001  ! 41: ADDCcc_I	addccc 	%r4, 0x0001, %r9
	.word 0x8d902214  ! 42: WRPR_PSTATE_I	wrpr	%r0, 0x0214, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xd28008a0  ! 44: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x81a00544  ! 45: FSQRTd	fsqrt	
	.word 0x95480000  ! 46: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd4ffc024  ! 48: SWAPA_R	swapa	%r10, [%r31 + %r4] 0x01
	.word 0x886a8007  ! 49: UDIVX_R	udivx 	%r10, %r7, %r4
	.word 0x90682001  ! 50: UDIVX_I	udivx 	%r0, 0x0001, %r8
	.word 0x8f514000  ! 51: RDPR_TBA	rdpr	%tba, %r7
	.word 0xce800c80  ! 52: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r7
	.word 0x936be001  ! 53: SDIVX_I	sdivx	%r15, 0x0001, %r9
	.word 0x8d902c54  ! 54: WRPR_PSTATE_I	wrpr	%r0, 0x0c54, %pstate
	.word 0x8d802000  ! 55: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd3e7c027  ! 56: CASA_I	casa	[%r31] 0x 1, %r7, %r9
	.word 0x87a0054f  ! 57: FSQRTd	fsqrt	
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8a6b000c  ! 59: UDIVX_R	udivx 	%r12, %r12, %r5
	.word 0xca3fc00c  ! 60: STD_R	std	%r5, [%r31 + %r12]
	.word 0x89d02034  ! 61: Tcc_I	tleu	icc_or_xcc, %r0 + 52
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_TO_TL0	! macro
	mov 0x31, %r30
	.word 0x9fd0001e  ! 64: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x81982b96  ! 65: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b96, %hpstate
	.word 0xcb97e001  ! 66: LDQFA_I	-	[%r31, 0x0001], %f5
	.word 0xca5fe001  ! 67: LDX_I	ldx	[%r31 + 0x0001], %r5
DS_1:
	.word 0x32800001  ! 69: BNE	bne,a	<label_0x1>
	.word 0xd332c000  ! 69: STQF_R	-	%f9, [%r0, %r11]
	.word 0x97458000  ! 68: RD_SOFTINT_REG	rd	%softint, %r11
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8198201a  ! 70: WRHPR_HPSTATE_I	wrhpr	%r0, 0x001a, %hpstate
	.word 0x36700001  ! 71: BPGE	<illegal instruction>
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd64fe001  ! 73: LDSB_I	ldsb	[%r31 + 0x0001], %r11
	.word 0x8d802000  ! 74: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d902287  ! 75: WRPR_PSTATE_I	wrpr	%r0, 0x0287, %pstate
	.word 0x8da30dc7  ! 76: FdMULq	fdmulq	
DS_2:
	.word 0x22800001  ! 78: BE	be,a	<label_0x1>
	illtrap
	.word 0x9bb34300  ! 77: ALLIGNADDRESS	alignaddr	%r13, %r0, %r13
	.word 0x95508000  ! 78: RDPR_TSTATE	rdpr	%tstate, %r10
	.word 0x8d90288c  ! 79: WRPR_PSTATE_I	wrpr	%r0, 0x088c, %pstate
	.word 0xd4c00e80  ! 80: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r10
	.word 0x87802088  ! 81: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x87d02030  ! 82: Tcc_I	tl	icc_or_xcc, %r0 + 48
DS_3:
	.word 0x34800001  ! 84: BG	bg,a	<label_0x1>
	.word 0xdf336001  ! 84: STQF_I	-	%f15, [0x0001, %r13]
	.word 0x89458000  ! 83: RD_SOFTINT_REG	rd	%softint, %r4
	.word 0x81982899  ! 84: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0899, %hpstate
	.word 0xc927c000  ! 85: STF_R	st	%f4, [%r0, %r31]
	mov 0x34, %r30
	.word 0x81d0001e  ! 86: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x85504000  ! 87: RDPR_TNPC	rdpr	%tnpc, %r2
	.word 0x87802088  ! 88: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8198234b  ! 89: WRHPR_HPSTATE_I	wrhpr	%r0, 0x034b, %hpstate
	.word 0x8d802000  ! 90: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc4d004a0  ! 91: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r2
	.word 0x26800001  ! 92: BL	bl,a	<label_0x1>
	.word 0xc49fe001  ! 93: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r2
	.word 0xc4c7e030  ! 94: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r2
	.word 0x8d802000  ! 95: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d902e5e  ! 96: WRPR_PSTATE_I	wrpr	%r0, 0x0e5e, %pstate
	.word 0x95d02035  ! 97: Tcc_I	tg	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d802000  ! 99: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d802004  ! 100: WRFPRS_I	wr	%r0, 0x0004, %fprs
DS_4:
	.word 0x22800001  ! 102: BE	be,a	<label_0x1>
	illtrap
	.word 0x97b1430e  ! 101: ALLIGNADDRESS	alignaddr	%r5, %r14, %r11
	.word 0xd6800b20  ! 102: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r11
	.word 0x8248e001  ! 103: MULX_I	mulx 	%r3, 0x0001, %r1
	.word 0x8a682001  ! 104: UDIVX_I	udivx 	%r0, 0x0001, %r5
	ta	T_CHANGE_TO_TL0	! macro
	mov 0x30, %r30
	.word 0x8fd0001e  ! 106: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0xcaffc02e  ! 107: SWAPA_R	swapa	%r5, [%r31 + %r14] 0x01
	.word 0x9d504000  ! 108: RDPR_TNPC	rdpr	%tnpc, %r14
	.word 0x81982102  ! 109: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0102, %hpstate
	.word 0x93d02031  ! 110: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0xdcc804a0  ! 111: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r14
	.word 0x81982adf  ! 112: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0adf, %hpstate
	.word 0xdc8008a0  ! 113: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r14
	.word 0x9c016001  ! 114: ADD_I	add 	%r5, 0x0001, %r14
	.word 0x8dd02030  ! 115: Tcc_I	tneg	icc_or_xcc, %r0 + 48
	.word 0x9f504000  ! 116: RDPR_TNPC	rdpr	%tnpc, %r15
	.word 0xde8008a0  ! 117: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r15
	.word 0xde97e000  ! 118: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r15
	.word 0x95a38d25  ! 119: FsMULd	fsmuld	%f14, %f36, %f10
	.word 0x81982dd1  ! 120: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dd1, %hpstate
	.word 0xd537c005  ! 121: STQF_R	-	%f10, [%r5, %r31]
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d802000  ! 123: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87802088  ! 124: WRASI_I	wr	%r0, 0x0088, %asi
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9f50c000  ! 126: RDPR_TT	rdpr	%tt, %r15
DS_5:
	.word 0x22800001  ! 128: BE	be,a	<label_0x1>
	illtrap
	.word 0x81b34308  ! 127: ALLIGNADDRESS	alignaddr	%r13, %r8, %r0
	.word 0x2a700001  ! 128: BPCS	<illegal instruction>
	.word 0x8198275f  ! 129: WRHPR_HPSTATE_I	wrhpr	%r0, 0x075f, %hpstate
	.word 0x8d902a1d  ! 130: WRPR_PSTATE_I	wrpr	%r0, 0x0a1d, %pstate
	.word 0xc137e001  ! 131: STQF_I	-	%f0, [0x0001, %r31]
DS_6:
	.word 0x32800001  ! 133: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x89b24305  ! 132: ALLIGNADDRESS	alignaddr	%r9, %r5, %r4
	.word 0x8d902808  ! 133: WRPR_PSTATE_I	wrpr	%r0, 0x0808, %pstate
	.word 0x8d802004  ! 134: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8a80c002  ! 135: ADDcc_R	addcc 	%r3, %r2, %r5
	.word 0x89d02031  ! 136: Tcc_I	tleu	icc_or_xcc, %r0 + 49
	.word 0xca8008a0  ! 137: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0x8d902a51  ! 138: WRPR_PSTATE_I	wrpr	%r0, 0x0a51, %pstate
	.word 0xca8804a0  ! 139: LDUBA_R	lduba	[%r0, %r0] 0x25, %r5
	.word 0x8cd3000a  ! 140: UMULcc_R	umulcc 	%r12, %r10, %r6
	.word 0x9b480000  ! 141: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
	mov 0x35, %r30
	.word 0x91d0001e  ! 142: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x86d1000e  ! 143: UMULcc_R	umulcc 	%r4, %r14, %r3
	.word 0x927a000b  ! 144: SDIV_R	sdiv 	%r8, %r11, %r9
	.word 0x8d902cc9  ! 145: WRPR_PSTATE_I	wrpr	%r0, 0x0cc9, %pstate
	.word 0xd247c000  ! 146: LDSW_R	ldsw	[%r31 + %r0], %r9
	.word 0xd2800b40  ! 147: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r9
DS_7:
	.word 0x22800001  ! 149: BE	be,a	<label_0x1>
	illtrap
	.word 0x87b3430f  ! 148: ALLIGNADDRESS	alignaddr	%r13, %r15, %r3
	.word 0x9c4b2001  ! 149: MULX_I	mulx 	%r12, 0x0001, %r14
	.word 0x8d90284d  ! 150: WRPR_PSTATE_I	wrpr	%r0, 0x084d, %pstate
	mov 0x31, %r30
	.word 0x9fd0001e  ! 151: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x8da149c1  ! 152: FDIVd	fdivd	%f36, %f32, %f6
	.word 0xcc17c000  ! 153: LDUH_R	lduh	[%r31 + %r0], %r6
	.word 0x8d802004  ! 154: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xcd3fe001  ! 155: STDF_I	std	%f6, [0x0001, %r31]
	mov 0x34, %r30
	.word 0x8bd0001e  ! 156: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0xcd97e001  ! 157: LDQFA_I	-	[%r31, 0x0001], %f6
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xcc4fc000  ! 159: LDSB_R	ldsb	[%r31 + %r0], %r6
	.word 0x91480000  ! 160: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
	.word 0x81982780  ! 161: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0780, %hpstate
	.word 0x84800008  ! 162: ADDcc_R	addcc 	%r0, %r8, %r2
	.word 0xc45fe001  ! 163: LDX_I	ldx	[%r31 + 0x0001], %r2
	.word 0x87802016  ! 164: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xc41fc000  ! 165: LDD_R	ldd	[%r31 + %r0], %r2
	.word 0x864b000c  ! 166: MULX_R	mulx 	%r12, %r12, %r3
	.word 0x81982707  ! 167: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0707, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x90db0005  ! 169: SMULcc_R	smulcc 	%r12, %r5, %r8
	ta	T_CHANGE_PRIV	! macro
	.word 0xd137c005  ! 171: STQF_R	-	%f8, [%r5, %r31]
	.word 0x36800001  ! 172: BGE	bge,a	<label_0x1>
	.word 0xd057c000  ! 173: LDSH_R	ldsh	[%r31 + %r0], %r8
	.word 0x95a1cd25  ! 174: FsMULd	fsmuld	%f7, %f36, %f10
	.word 0xd4d80e80  ! 175: LDXA_R	ldxa	[%r0, %r0] 0x74, %r10
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xd48008a0  ! 177: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x926a2001  ! 178: UDIVX_I	udivx 	%r8, 0x0001, %r9
DS_8:
	.word 0x34800001  ! 180: BG	bg,a	<label_0x1>
	.word 0xd5316001  ! 180: STQF_I	-	%f10, [0x0001, %r5]
	.word 0x93458000  ! 179: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x8cd8400b  ! 180: SMULcc_R	smulcc 	%r1, %r11, %r6
	.word 0x8d902458  ! 181: WRPR_PSTATE_I	wrpr	%r0, 0x0458, %pstate
	.word 0xcc9004a0  ! 182: LDUHA_R	lduha	[%r0, %r0] 0x25, %r6
	.word 0xccd80e40  ! 183: LDXA_R	ldxa	[%r0, %r0] 0x72, %r6
	.word 0x88d88001  ! 184: SMULcc_R	smulcc 	%r2, %r1, %r4
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d902e4f  ! 186: WRPR_PSTATE_I	wrpr	%r0, 0x0e4f, %pstate
	.word 0xc857e001  ! 187: LDSH_I	ldsh	[%r31 + 0x0001], %r4
DS_9:
	.word 0x22800001  ! 189: BE	be,a	<label_0x1>
	.word 0xdf306001  ! 189: STQF_I	-	%f15, [0x0001, %r1]
	.word 0x89458000  ! 188: RD_SOFTINT_REG	rd	%softint, %r4
	.word 0x8d902654  ! 189: WRPR_PSTATE_I	wrpr	%r0, 0x0654, %pstate
	.word 0x87802010  ! 190: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xc8800bc0  ! 191: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r4
	.word 0x83504000  ! 192: RDPR_TNPC	rdpr	%tnpc, %r1
	.word 0x87508000  ! 193: RDPR_TSTATE	rdpr	%tstate, %r3
	.word 0x9ba1cd20  ! 194: FsMULd	fsmuld	%f7, %f0, %f44
	.word 0x81982fcf  ! 195: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fcf, %hpstate
	.word 0x88684009  ! 196: UDIVX_R	udivx 	%r1, %r9, %r4
	.word 0x9ba00562  ! 197: FSQRTq	fsqrt	
	.word 0x8d802004  ! 198: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xdad7e020  ! 199: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r13
	.word 0x9a022001  ! 200: ADD_I	add 	%r8, 0x0001, %r13
	.word 0x8d802000  ! 201: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8fa0056f  ! 202: FSQRTq	fsqrt	
	.word 0x28800001  ! 203: BLEU	bleu,a	<label_0x1>
	.word 0x9ed10009  ! 204: UMULcc_R	umulcc 	%r4, %r9, %r15
	.word 0xded7e000  ! 205: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r15
	.word 0xde8008a0  ! 206: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r15
	.word 0xdec7e000  ! 207: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r15
DS_10:
	.word 0x34800001  ! 209: BG	bg,a	<label_0x1>
	.word 0xdd32e001  ! 209: STQF_I	-	%f14, [0x0001, %r11]
	.word 0x95458000  ! 208: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0xd41fc000  ! 209: LDD_R	ldd	[%r31 + %r0], %r10
	.word 0x8d902215  ! 210: WRPR_PSTATE_I	wrpr	%r0, 0x0215, %pstate
	.word 0x97d02034  ! 211: Tcc_I	tge	icc_or_xcc, %r0 + 52
	.word 0x26800001  ! 212: BL	bl,a	<label_0x1>
	.word 0x85a189a2  ! 213: FDIVs	fdivs	%f6, %f2, %f2
	ta	T_CHANGE_PRIV	! macro
	.word 0x94d26001  ! 215: UMULcc_I	umulcc 	%r9, 0x0001, %r10
	.word 0x87802004  ! 216: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x924b800a  ! 217: MULX_R	mulx 	%r14, %r10, %r9
	.word 0xd2cfe000  ! 218: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r9
	.word 0x8d902881  ! 219: WRPR_PSTATE_I	wrpr	%r0, 0x0881, %pstate
	mov 0x33, %r30
	.word 0x93d0001e  ! 220: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d902c8b  ! 221: WRPR_PSTATE_I	wrpr	%r0, 0x0c8b, %pstate
	.word 0x87d02032  ! 222: Tcc_I	tl	icc_or_xcc, %r0 + 50
	.word 0x87802004  ! 223: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8da189ed  ! 224: FDIVq	dis not found

	.word 0x8d90285c  ! 225: WRPR_PSTATE_I	wrpr	%r0, 0x085c, %pstate
	.word 0x8d902a51  ! 226: WRPR_PSTATE_I	wrpr	%r0, 0x0a51, %pstate
	.word 0x91494000  ! 227: RDHPR_HTBA	rdhpr	%htba, %r8
DS_11:
	.word 0x22800001  ! 229: BE	be,a	<label_0x1>
	.word 0xdd336001  ! 229: STQF_I	-	%f14, [0x0001, %r13]
	.word 0x95458000  ! 228: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0x91508000  ! 229: RDPR_TSTATE	rdpr	%tstate, %r8
	mov 0x32, %r30
	.word 0x9bd0001e  ! 230: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x9668e001  ! 231: UDIVX_I	udivx 	%r3, 0x0001, %r11
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9d51c000  ! 233: RDPR_TL	rdpr	%tl, %r14
	.word 0x9801a001  ! 234: ADD_I	add 	%r6, 0x0001, %r12
	ta	T_CHANGE_HPRIV	! macro
	.word 0x91d02031  ! 236: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xd88fe000  ! 237: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r12
	.word 0xd88fe030  ! 238: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r12
	.word 0x81982291  ! 239: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0291, %hpstate
	.word 0xd817e001  ! 240: LDUH_I	lduh	[%r31 + 0x0001], %r12
	.word 0x8d902010  ! 241: WRPR_PSTATE_I	wrpr	%r0, 0x0010, %pstate
	.word 0x85a08dc5  ! 242: FdMULq	fdmulq	
	.word 0x81982e14  ! 243: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e14, %hpstate
	.word 0xc48008a0  ! 244: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x91d02033  ! 245: Tcc_I	ta	icc_or_xcc, %r0 + 51
	mov 0x30, %r30
	.word 0x81d0001e  ! 246: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x82798001  ! 248: SDIV_R	sdiv 	%r6, %r1, %r1
	.word 0x8d802000  ! 249: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87a00541  ! 250: FSQRTd	fsqrt	
	.word 0xc6900e60  ! 251: LDUHA_R	lduha	[%r0, %r0] 0x73, %r3
	.word 0x819820d9  ! 252: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00d9, %hpstate
	.word 0x8e82c008  ! 253: ADDcc_R	addcc 	%r11, %r8, %r7
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d9020df  ! 255: WRPR_PSTATE_I	wrpr	%r0, 0x00df, %pstate
	.word 0x8198220a  ! 256: WRHPR_HPSTATE_I	wrhpr	%r0, 0x020a, %hpstate
	.word 0x8d802004  ! 257: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xce800c00  ! 258: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r7
	.word 0x2a700001  ! 259: BPCS	<illegal instruction>
	.word 0xce8008a0  ! 260: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x9fa00546  ! 261: FSQRTd	fsqrt	
	.word 0x82c0e001  ! 262: ADDCcc_I	addccc 	%r3, 0x0001, %r1
DS_12:
	.word 0x22800001  ! 264: BE	be,a	<label_0x1>
	illtrap
	.word 0x9db2830b  ! 263: ALLIGNADDRESS	alignaddr	%r10, %r11, %r14
	.word 0x8d902ec1  ! 264: WRPR_PSTATE_I	wrpr	%r0, 0x0ec1, %pstate
	.word 0x8d902614  ! 265: WRPR_PSTATE_I	wrpr	%r0, 0x0614, %pstate
	.word 0x83a01a64  ! 266: FqTOi	fqtoi	
	.word 0x966a2001  ! 267: UDIVX_I	udivx 	%r8, 0x0001, %r11
	.word 0xd6ffc024  ! 268: SWAPA_R	swapa	%r11, [%r31 + %r4] 0x01
	.word 0x97d02034  ! 269: Tcc_I	tge	icc_or_xcc, %r0 + 52
	.word 0xd617c000  ! 270: LDUH_R	lduh	[%r31 + %r0], %r11
	.word 0x87802010  ! 271: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xd68008a0  ! 272: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x8d902c90  ! 273: WRPR_PSTATE_I	wrpr	%r0, 0x0c90, %pstate
	.word 0xd61fc000  ! 274: LDD_R	ldd	[%r31 + %r0], %r11
	.word 0x81982142  ! 275: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0142, %hpstate
	.word 0xd67fe001  ! 276: SWAP_I	swap	%r11, [%r31 + 0x0001]
	.word 0xd6d7e030  ! 277: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r11
	.word 0xd617e001  ! 278: LDUH_I	lduh	[%r31 + 0x0001], %r11
	.word 0x9e490008  ! 279: MULX_R	mulx 	%r4, %r8, %r15
	.word 0xdecfe020  ! 280: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r15
	.word 0x8d802000  ! 281: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8b51c000  ! 282: RDPR_TL	rdpr	%tl, %r5
	.word 0xcbe7c028  ! 283: CASA_I	casa	[%r31] 0x 1, %r8, %r5
	.word 0xca1fe001  ! 284: LDD_I	ldd	[%r31 + 0x0001], %r5
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87802014  ! 286: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xcaffc028  ! 287: SWAPA_R	swapa	%r5, [%r31 + %r8] 0x01
	.word 0x8ed8c000  ! 288: SMULcc_R	smulcc 	%r3, %r0, %r7
	.word 0x8b494000  ! 289: RDHPR_HTBA	rdhpr	%htba, %r5
	.word 0x8a68a001  ! 290: UDIVX_I	udivx 	%r2, 0x0001, %r5
	.word 0x80d8c000  ! 291: SMULcc_R	smulcc 	%r3, %r0, %r0
	.word 0xc0d804a0  ! 292: LDXA_R	ldxa	[%r0, %r0] 0x25, %r0
	.word 0x8198241d  ! 293: WRHPR_HPSTATE_I	wrhpr	%r0, 0x041d, %hpstate
	.word 0x91d02033  ! 294: Tcc_I	ta	icc_or_xcc, %r0 + 51
DS_13:
	.word 0x20800001  ! 296: BN	bn,a	<label_0x1>
	.word 0xd533a001  ! 296: STQF_I	-	%f10, [0x0001, %r14]
	.word 0x85458000  ! 295: RD_SOFTINT_REG	rd	%softint, %r2
	.word 0xc4d804a0  ! 296: LDXA_R	ldxa	[%r0, %r0] 0x25, %r2
	.word 0x9fa01a68  ! 297: FqTOi	fqtoi	
	.word 0x94d80008  ! 298: SMULcc_R	smulcc 	%r0, %r8, %r10
	.word 0x8d902c09  ! 299: WRPR_PSTATE_I	wrpr	%r0, 0x0c09, %pstate
	.word 0x91480000  ! 300: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
	.word 0x90c16001  ! 301: ADDCcc_I	addccc 	%r5, 0x0001, %r8
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x99696001  ! 303: SDIVX_I	sdivx	%r5, 0x0001, %r12
	.word 0x8d902213  ! 304: WRPR_PSTATE_I	wrpr	%r0, 0x0213, %pstate
	.word 0xd8d80e80  ! 305: LDXA_R	ldxa	[%r0, %r0] 0x74, %r12
	.word 0x82838004  ! 306: ADDcc_R	addcc 	%r14, %r4, %r1
	.word 0xc2dfe000  ! 307: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r1
	.word 0x8d802000  ! 308: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8198255c  ! 309: WRHPR_HPSTATE_I	wrhpr	%r0, 0x055c, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xc2d80e40  ! 311: LDXA_R	ldxa	[%r0, %r0] 0x72, %r1
	.word 0xc337e001  ! 312: STQF_I	-	%f1, [0x0001, %r31]
	.word 0x8ac0e001  ! 313: ADDCcc_I	addccc 	%r3, 0x0001, %r5
	.word 0x8c4ac00c  ! 314: MULX_R	mulx 	%r11, %r12, %r6
DS_14:
	.word 0x22800001  ! 316: BE	be,a	<label_0x1>
	.word 0xcd31000e  ! 316: STQF_R	-	%f6, [%r14, %r4]
	.word 0x9d458000  ! 315: RD_SOFTINT_REG	rd	%softint, %r14
	.word 0xdccfe030  ! 316: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r14
	.word 0x83686001  ! 317: SDIVX_I	sdivx	%r1, 0x0001, %r1
	.word 0xc23fe001  ! 318: STD_I	std	%r1, [%r31 + 0x0001]
	.word 0xc2c004a0  ! 319: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r1
DS_15:
	.word 0x32800001  ! 321: BNE	bne,a	<label_0x1>
	.word 0xd9314000  ! 321: STQF_R	-	%f12, [%r0, %r5]
	.word 0x85458000  ! 320: RD_SOFTINT_REG	rd	%softint, %r2
	.word 0x81982f95  ! 321: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f95, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc42fc000  ! 323: STB_R	stb	%r2, [%r31 + %r0]
	mov 0x30, %r30
	.word 0x99d0001e  ! 324: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x30800001  ! 326: BA	ba,a	<label_0x1>
DS_16:
	.word 0x32800001  ! 328: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x9bb1c30b  ! 327: ALLIGNADDRESS	alignaddr	%r7, %r11, %r13
	.word 0x86496001  ! 328: MULX_I	mulx 	%r5, 0x0001, %r3
	.word 0x87d02034  ! 329: Tcc_I	tl	icc_or_xcc, %r0 + 52
	.word 0x81982787  ! 330: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0787, %hpstate
	.word 0x8d802004  ! 331: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d802004  ! 332: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x9fa0056e  ! 333: FSQRTq	fsqrt	
	.word 0xdebfc02e  ! 334: STDA_R	stda	%r15, [%r31 + %r14] 0x01
	.word 0x8d802000  ! 335: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8198214a  ! 336: WRHPR_HPSTATE_I	wrhpr	%r0, 0x014a, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d902e16  ! 338: WRPR_PSTATE_I	wrpr	%r0, 0x0e16, %pstate
	.word 0x8ba089cd  ! 339: FDIVd	fdivd	%f2, %f44, %f36
	.word 0xcbe7c02d  ! 340: CASA_I	casa	[%r31] 0x 1, %r13, %r5
	.word 0x9dd02033  ! 341: Tcc_I	tpos	icc_or_xcc, %r0 + 51
DS_17:
	.word 0x22800001  ! 343: BE	be,a	<label_0x1>
	illtrap
	.word 0x9db34303  ! 342: ALLIGNADDRESS	alignaddr	%r13, %r3, %r14
	.word 0x8d802000  ! 343: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8a4b8001  ! 344: MULX_R	mulx 	%r14, %r1, %r5
	.word 0x87802016  ! 345: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x81982b1e  ! 346: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b1e, %hpstate
	mov 0x33, %r30
	.word 0x8bd0001e  ! 347: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
DS_18:
	.word 0x22800001  ! 349: BE	be,a	<label_0x1>
	.word 0xd333e001  ! 349: STQF_I	-	%f9, [0x0001, %r15]
	.word 0x8f458000  ! 348: RD_SOFTINT_REG	rd	%softint, %r7
	ta	T_CHANGE_PRIV	! macro
	.word 0x8848a001  ! 350: MULX_I	mulx 	%r2, 0x0001, %r4
	.word 0x8683e001  ! 351: ADDcc_I	addcc 	%r15, 0x0001, %r3
	.word 0x81982c1c  ! 352: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c1c, %hpstate
	.word 0x87802014  ! 353: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x8198215d  ! 354: WRHPR_HPSTATE_I	wrhpr	%r0, 0x015d, %hpstate
	.word 0x8d90221a  ! 355: WRPR_PSTATE_I	wrpr	%r0, 0x021a, %pstate
	.word 0xc68008a0  ! 356: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x8fd02031  ! 357: Tcc_I	tvs	icc_or_xcc, %r0 + 49
	.word 0xc69004a0  ! 358: LDUHA_R	lduha	[%r0, %r0] 0x25, %r3
	.word 0x84022001  ! 359: ADD_I	add 	%r8, 0x0001, %r2
DS_19:
	.word 0x32800001  ! 361: BNE	bne,a	<label_0x1>
	.word 0xc533a001  ! 361: STQF_I	-	%f2, [0x0001, %r14]
	.word 0x8d458000  ! 360: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0x8da01a63  ! 361: FqTOi	fqtoi	
	.word 0x8d9026db  ! 362: WRPR_PSTATE_I	wrpr	%r0, 0x06db, %pstate
	mov 0x30, %r30
	.word 0x9bd0001e  ! 363: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x8d9022c4  ! 364: WRPR_PSTATE_I	wrpr	%r0, 0x02c4, %pstate
	.word 0x819824d4  ! 365: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04d4, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d902ac2  ! 367: WRPR_PSTATE_I	wrpr	%r0, 0x0ac2, %pstate
	.word 0x8d9028d5  ! 368: WRPR_PSTATE_I	wrpr	%r0, 0x08d5, %pstate
	.word 0x8b69a001  ! 369: SDIVX_I	sdivx	%r6, 0x0001, %r5
	.word 0x8d902a08  ! 370: WRPR_PSTATE_I	wrpr	%r0, 0x0a08, %pstate
	.word 0x8d902813  ! 371: WRPR_PSTATE_I	wrpr	%r0, 0x0813, %pstate
	.word 0x9483c005  ! 372: ADDcc_R	addcc 	%r15, %r5, %r10
	mov 0x30, %r30
	.word 0x81d0001e  ! 373: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0xd4ffc025  ! 374: SWAPA_R	swapa	%r10, [%r31 + %r5] 0x01
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd4900e80  ! 376: LDUHA_R	lduha	[%r0, %r0] 0x74, %r10
	.word 0x99a389a6  ! 377: FDIVs	fdivs	%f14, %f6, %f12
	.word 0x9d504000  ! 378: RDPR_TNPC	rdpr	%tnpc, %r14
	.word 0x9b514000  ! 379: RDPR_TBA	rdpr	%tba, %r13
	.word 0xda8008a0  ! 380: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x32700001  ! 381: BPNE	<illegal instruction>
	.word 0x8d802000  ! 382: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8c82e001  ! 383: ADDcc_I	addcc 	%r11, 0x0001, %r6
	.word 0x9cc02001  ! 384: ADDCcc_I	addccc 	%r0, 0x0001, %r14
	.word 0x81982697  ! 385: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0697, %hpstate
	.word 0x9bd02034  ! 386: Tcc_I	tcc	icc_or_xcc, %r0 + 52
	.word 0xdcd80e40  ! 387: LDXA_R	ldxa	[%r0, %r0] 0x72, %r14
	.word 0x83d02031  ! 388: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0x87802004  ! 389: WRASI_I	wr	%r0, 0x0004, %asi
DS_20:
	.word 0x20800001  ! 391: BN	bn,a	<label_0x1>
	illtrap
	.word 0x95b1430d  ! 390: ALLIGNADDRESS	alignaddr	%r5, %r13, %r10
	.word 0x90da0002  ! 391: SMULcc_R	smulcc 	%r8, %r2, %r8
	.word 0xd0c804a0  ! 392: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r8
	.word 0x8198281d  ! 393: WRHPR_HPSTATE_I	wrhpr	%r0, 0x081d, %hpstate
	.word 0xd077c002  ! 394: STX_R	stx	%r8, [%r31 + %r2]
DS_21:
	.word 0x34800001  ! 396: BG	bg,a	<label_0x1>
	illtrap
	.word 0x87b2030c  ! 395: ALLIGNADDRESS	alignaddr	%r8, %r12, %r3
	.word 0xc6c004a0  ! 396: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r3
	.word 0x97a01a6e  ! 397: FqTOi	fqtoi	
	.word 0x8a7ac00b  ! 398: SDIV_R	sdiv 	%r11, %r11, %r5
	.word 0xca9004a0  ! 399: LDUHA_R	lduha	[%r0, %r0] 0x25, %r5
	.word 0x9a500009  ! 400: UMUL_R	umul 	%r0, %r9, %r13
	.word 0xda9004a0  ! 401: LDUHA_R	lduha	[%r0, %r0] 0x25, %r13
	.word 0x81d02032  ! 402: Tcc_I	tn	icc_or_xcc, %r0 + 50
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8da289a7  ! 404: FDIVs	fdivs	%f10, %f7, %f6
	.word 0x26800001  ! 405: BL	bl,a	<label_0x1>
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x81d02032  ! 407: Tcc_I	tn	icc_or_xcc, %r0 + 50
	.word 0x95d02035  ! 408: Tcc_I	tg	icc_or_xcc, %r0 + 53
	.word 0x81982c5b  ! 409: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c5b, %hpstate
	.word 0x8da0054b  ! 410: FSQRTd	fsqrt	
	.word 0x2c800001  ! 411: BNEG	bneg,a	<label_0x1>
	.word 0x8198221d  ! 412: WRHPR_HPSTATE_I	wrhpr	%r0, 0x021d, %hpstate
	.word 0xcc8008a0  ! 413: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0xcc8008a0  ! 414: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8fa01a6a  ! 416: FqTOi	fqtoi	
	.word 0x87d02033  ! 417: Tcc_I	tl	icc_or_xcc, %r0 + 51
DS_22:
	.word 0x32800001  ! 419: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x9bb3430d  ! 418: ALLIGNADDRESS	alignaddr	%r13, %r13, %r13
	.word 0x8d90244b  ! 419: WRPR_PSTATE_I	wrpr	%r0, 0x044b, %pstate
DS_23:
	.word 0x22800001  ! 421: BE	be,a	<label_0x1>
	.word 0xd3338003  ! 421: STQF_R	-	%f9, [%r3, %r14]
	.word 0x91458000  ! 420: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0xd03fe001  ! 421: STD_I	std	%r8, [%r31 + 0x0001]
	.word 0x807a0002  ! 422: SDIV_R	sdiv 	%r8, %r2, %r0
	.word 0x80828002  ! 423: ADDcc_R	addcc 	%r10, %r2, %r0
	.word 0xc017e001  ! 424: LDUH_I	lduh	[%r31 + 0x0001], %r0
	.word 0x24800001  ! 425: BLE	ble,a	<label_0x1>
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x22700001  ! 427: BPE	<illegal instruction>
	.word 0xc13fe001  ! 428: STDF_I	std	%f0, [0x0001, %r31]
	.word 0x3a800001  ! 429: BCC	bcc,a	<label_0x1>
	.word 0x81982614  ! 430: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0614, %hpstate
	.word 0x8c6aa001  ! 431: UDIVX_I	udivx 	%r10, 0x0001, %r6
	.word 0x95514000  ! 432: RDPR_TBA	rdpr	%tba, %r10
	.word 0xd48008a0  ! 433: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x8fa0056e  ! 434: FSQRTq	fsqrt	
DS_24:
	.word 0x32800001  ! 436: BNE	bne,a	<label_0x1>
	.word 0xc1328001  ! 436: STQF_R	-	%f0, [%r1, %r10]
	.word 0x9b458000  ! 435: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x9ba1c9cb  ! 436: FDIVd	fdivd	%f38, %f42, %f44
	.word 0x88d8c007  ! 437: SMULcc_R	smulcc 	%r3, %r7, %r4
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81982a1d  ! 439: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a1d, %hpstate
	mov 0x31, %r30
	.word 0x87d0001e  ! 440: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x81982ed2  ! 441: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed2, %hpstate
	.word 0xc8d004a0  ! 442: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r4
	.word 0x8d902ed7  ! 443: WRPR_PSTATE_I	wrpr	%r0, 0x0ed7, %pstate
	.word 0x81982818  ! 444: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0818, %hpstate
	.word 0x96d32001  ! 445: UMULcc_I	umulcc 	%r12, 0x0001, %r11
	.word 0x89a0054a  ! 446: FSQRTd	fsqrt	
	mov 0x33, %r30
	.word 0x91d0001e  ! 447: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8da000cb  ! 448: FNEGd	fnegd	%f42, %f6
	.word 0x819823d6  ! 449: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03d6, %hpstate
	.word 0x8a81e001  ! 450: ADDcc_I	addcc 	%r7, 0x0001, %r5
	.word 0x85494000  ! 451: RDHPR_HTBA	rdhpr	%htba, %r2
	.word 0x8bd02032  ! 452: Tcc_I	tcs	icc_or_xcc, %r0 + 50
	.word 0x819828c4  ! 453: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c4, %hpstate
	.word 0x8d902251  ! 454: WRPR_PSTATE_I	wrpr	%r0, 0x0251, %pstate
	.word 0x87a209c9  ! 455: FDIVd	fdivd	%f8, %f40, %f34
	.word 0x98d02001  ! 456: UMULcc_I	umulcc 	%r0, 0x0001, %r12
	.word 0x81982b51  ! 457: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b51, %hpstate
	.word 0xd89fe001  ! 458: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r12
	.word 0xd9e7c029  ! 459: CASA_I	casa	[%r31] 0x 1, %r9, %r12
DS_25:
	.word 0x20800001  ! 461: BN	bn,a	<label_0x1>
	.word 0xd730000d  ! 461: STQF_R	-	%f11, [%r13, %r0]
	.word 0x8d458000  ! 460: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0x9bd02033  ! 461: Tcc_I	tcc	icc_or_xcc, %r0 + 51
	.word 0xccd00e40  ! 462: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r6
	.word 0x8d9020c7  ! 463: WRPR_PSTATE_I	wrpr	%r0, 0x00c7, %pstate
	.word 0xcc800b20  ! 464: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r6
	.word 0xcc8008a0  ! 465: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	ta	T_CHANGE_HPRIV	! macro
	.word 0xccc804a0  ! 467: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r6
	.word 0x8d802000  ! 468: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d9026d1  ! 469: WRPR_PSTATE_I	wrpr	%r0, 0x06d1, %pstate
	.word 0xccffc02d  ! 470: SWAPA_R	swapa	%r6, [%r31 + %r13] 0x01
	.word 0x8fd02034  ! 471: Tcc_I	tvs	icc_or_xcc, %r0 + 52
	.word 0xcd27c00d  ! 472: STF_R	st	%f6, [%r13, %r31]
DS_26:
	.word 0x22800001  ! 474: BE	be,a	<label_0x1>
	.word 0xc331e001  ! 474: STQF_I	-	%f1, [0x0001, %r7]
	.word 0x81458000  ! 473: RD_SOFTINT_REG	stbar
	.word 0x89d02035  ! 474: Tcc_I	tleu	icc_or_xcc, %r0 + 53
	.word 0x38700001  ! 475: BPGU	<illegal instruction>
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xc0c004a0  ! 477: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r0
	.word 0xc1e7c02d  ! 478: CASA_I	casa	[%r31] 0x 1, %r13, %r0
	ta	T_CHANGE_PRIV	! macro
	.word 0xc08008a0  ! 480: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d802000  ! 482: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc0d7e010  ! 483: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r0
	.word 0x26800001  ! 484: BL	bl,a	<label_0x1>
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x92022001  ! 486: ADD_I	add 	%r8, 0x0001, %r9
	.word 0x8d902c48  ! 487: WRPR_PSTATE_I	wrpr	%r0, 0x0c48, %pstate
	.word 0xd33fe001  ! 488: STDF_I	std	%f9, [0x0001, %r31]
	.word 0x819825cd  ! 489: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05cd, %hpstate
	.word 0x8c50c00d  ! 490: UMUL_R	umul 	%r3, %r13, %r6
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x81982eca  ! 492: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0eca, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
DS_27:
	.word 0x34800001  ! 497: BG	bg,a	<label_0x1>
	.word 0xc1336001  ! 497: STQF_I	-	%f0, [0x0001, %r13]
	.word 0x93458000  ! 496: RD_SOFTINT_REG	rd	%softint, %r9
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd2800a80  ! 498: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r9
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902602  ! 501: WRPR_PSTATE_I	wrpr	%r0, 0x0602, %pstate
	.word 0x99d02035  ! 502: Tcc_I	tgu	icc_or_xcc, %r0 + 53
	.word 0x81982507  ! 503: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0507, %hpstate
	.word 0x8069000a  ! 504: UDIVX_R	udivx 	%r4, %r10, %r0
	.word 0xc01fe001  ! 505: LDD_I	ldd	[%r31 + 0x0001], %r0
	.word 0x8283a001  ! 506: ADDcc_I	addcc 	%r14, 0x0001, %r1
	.word 0x88d36001  ! 507: UMULcc_I	umulcc 	%r13, 0x0001, %r4
	.word 0x3a700001  ! 508: BPCC	<illegal instruction>
	.word 0x38700001  ! 509: BPGU	<illegal instruction>
	.word 0x85a3c9e1  ! 510: FDIVq	dis not found

	.word 0x8d90200a  ! 511: WRPR_PSTATE_I	wrpr	%r0, 0x000a, %pstate
	.word 0x81982b19  ! 512: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b19, %hpstate
	.word 0x8d802004  ! 513: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xc48008a0  ! 514: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0xc457e001  ! 515: LDSH_I	ldsh	[%r31 + 0x0001], %r2
	.word 0x98d18008  ! 516: UMULcc_R	umulcc 	%r6, %r8, %r12
	.word 0x9ec06001  ! 517: ADDCcc_I	addccc 	%r1, 0x0001, %r15
	.word 0x81982dd8  ! 518: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dd8, %hpstate
	.word 0xde8008a0  ! 519: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r15
	.word 0x8d90200d  ! 520: WRPR_PSTATE_I	wrpr	%r0, 0x000d, %pstate
	.word 0x81982c82  ! 521: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c82, %hpstate
	.word 0x8648a001  ! 522: MULX_I	mulx 	%r2, 0x0001, %r3
	.word 0x8d514000  ! 523: RDPR_TBA	rdpr	%tba, %r6
	.word 0x9951c000  ! 524: RDPR_TL	rdpr	%tl, %r12
	.word 0x81982b80  ! 525: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b80, %hpstate
	.word 0x92826001  ! 526: ADDcc_I	addcc 	%r9, 0x0001, %r9
	.word 0x819828d4  ! 527: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d4, %hpstate
	.word 0x96c2e001  ! 528: ADDCcc_I	addccc 	%r11, 0x0001, %r11
	.word 0xd617c000  ! 529: LDUH_R	lduh	[%r31 + %r0], %r11
	.word 0x9b508000  ! 530: RDPR_TSTATE	rdpr	%tstate, %r13
	.word 0x99d02030  ! 531: Tcc_I	tgu	icc_or_xcc, %r0 + 48
	.word 0x82514007  ! 532: UMUL_R	umul 	%r5, %r7, %r1
	.word 0xc3e7c027  ! 533: CASA_I	casa	[%r31] 0x 1, %r7, %r1
	.word 0xc2d00e60  ! 534: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r1
	ta	T_CHANGE_HPRIV	! macro
	.word 0x30700001  ! 536: BPA	<illegal instruction>
	mov 0x35, %r30
	.word 0x8fd0001e  ! 537: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc2d804a0  ! 539: LDXA_R	ldxa	[%r0, %r0] 0x25, %r1
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8b6b0003  ! 541: SDIVX_R	sdivx	%r12, %r3, %r5
	.word 0x8d802000  ! 542: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982842  ! 543: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0842, %hpstate
	.word 0x87802080  ! 544: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x8d902ec5  ! 545: WRPR_PSTATE_I	wrpr	%r0, 0x0ec5, %pstate
	.word 0x819824cf  ! 546: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04cf, %hpstate
	.word 0xcb37e001  ! 547: STQF_I	-	%f5, [0x0001, %r31]
	.word 0x81982d12  ! 548: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d12, %hpstate
	.word 0xca7fe001  ! 549: SWAP_I	swap	%r5, [%r31 + 0x0001]
DS_28:
	.word 0x32800001  ! 551: BNE	bne,a	<label_0x1>
	.word 0xcd30e001  ! 551: STQF_I	-	%f6, [0x0001, %r3]
	.word 0x9f458000  ! 550: RD_SOFTINT_REG	rd	%softint, %r15
	.word 0x95480000  ! 551: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
	.word 0x81982282  ! 552: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0282, %hpstate
	.word 0x9ac02001  ! 553: ADDCcc_I	addccc 	%r0, 0x0001, %r13
	.word 0x81982653  ! 554: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0653, %hpstate
	.word 0x8ba309c1  ! 555: FDIVd	fdivd	%f12, %f32, %f36
	.word 0x8d90201b  ! 556: WRPR_PSTATE_I	wrpr	%r0, 0x001b, %pstate
	.word 0xca8008a0  ! 557: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0xcacfe000  ! 558: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r5
	.word 0x8f51c000  ! 559: RDPR_TL	rdpr	%tl, %r7
	.word 0xcec7e000  ! 560: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r7
	.word 0x8198288d  ! 561: WRHPR_HPSTATE_I	wrhpr	%r0, 0x088d, %hpstate
	.word 0xced7e030  ! 562: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r7
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d802000  ! 564: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_29:
	.word 0x32800001  ! 566: BNE	bne,a	<label_0x1>
	.word 0xd330400e  ! 566: STQF_R	-	%f9, [%r14, %r1]
	.word 0x8b458000  ! 565: RD_SOFTINT_REG	rd	%softint, %r5
DS_30:
	.word 0x22800001  ! 567: BE	be,a	<label_0x1>
	illtrap
	.word 0x95b14306  ! 566: ALLIGNADDRESS	alignaddr	%r5, %r6, %r10
	.word 0x81982b5f  ! 567: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b5f, %hpstate
	.word 0x87a000c0  ! 568: FNEGd	fnegd	%f0, %f34
DS_31:
	.word 0x20800001  ! 570: BN	bn,a	<label_0x1>
	.word 0xcd30000e  ! 570: STQF_R	-	%f6, [%r14, %r0]
	.word 0x8b458000  ! 569: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0x2c800001  ! 570: BNEG	bneg,a	<label_0x1>
	.word 0x87a049a5  ! 571: FDIVs	fdivs	%f1, %f5, %f3
	.word 0x87802080  ! 572: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x26800001  ! 573: BL	bl,a	<label_0x1>
	.word 0x956b6001  ! 574: SDIVX_I	sdivx	%r13, 0x0001, %r10
	.word 0x80d38002  ! 575: UMULcc_R	umulcc 	%r14, %r2, %r0
	.word 0xc08fe010  ! 576: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r0
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x9d692001  ! 578: SDIVX_I	sdivx	%r4, 0x0001, %r14
	.word 0x947a4009  ! 579: SDIV_R	sdiv 	%r9, %r9, %r10
	.word 0x8d802004  ! 580: WRFPRS_I	wr	%r0, 0x0004, %fprs
	mov 0x33, %r30
	.word 0x89d0001e  ! 581: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0xd48008a0  ! 582: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x2e800001  ! 583: BVS	bvs,a	<label_0x1>
	.word 0x8d902c92  ! 584: WRPR_PSTATE_I	wrpr	%r0, 0x0c92, %pstate
	.word 0x8053400b  ! 585: UMUL_R	umul 	%r13, %r11, %r0
DS_32:
	.word 0x32800001  ! 587: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x83b38300  ! 586: ALLIGNADDRESS	alignaddr	%r14, %r0, %r1
	.word 0x8d802000  ! 587: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x32700001  ! 588: BPNE	<illegal instruction>
	.word 0x81982ec0  ! 589: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ec0, %hpstate
	.word 0x8d802004  ! 590: WRFPRS_I	wr	%r0, 0x0004, %fprs
	mov 0x33, %r30
	.word 0x8dd0001e  ! 591: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x2c700001  ! 592: BPNEG	<illegal instruction>
	.word 0x8ed0a001  ! 593: UMULcc_I	umulcc 	%r2, 0x0001, %r7
	.word 0xce5fe001  ! 594: LDX_I	ldx	[%r31 + 0x0001], %r7
	.word 0xce1fc000  ! 595: LDD_R	ldd	[%r31 + %r0], %r7
	.word 0xce4fe001  ! 596: LDSB_I	ldsb	[%r31 + 0x0001], %r7
	.word 0x9d504000  ! 597: RDPR_TNPC	rdpr	%tnpc, %r14
	.word 0x87802016  ! 598: WRASI_I	wr	%r0, 0x0016, %asi
	mov 0x35, %r30
	.word 0x87d0001e  ! 599: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d902ad3  ! 601: WRPR_PSTATE_I	wrpr	%r0, 0x0ad3, %pstate
	.word 0x95d02031  ! 602: Tcc_I	tg	icc_or_xcc, %r0 + 49
	.word 0xdc8008a0  ! 603: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r14
	.word 0x8198248b  ! 604: WRHPR_HPSTATE_I	wrhpr	%r0, 0x048b, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99504000  ! 606: RDPR_TNPC	rdpr	%tnpc, %r12
	.word 0x8679a001  ! 607: SDIV_I	sdiv 	%r6, 0x0001, %r3
	.word 0x8fd02030  ! 608: Tcc_I	tvs	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d902e14  ! 611: WRPR_PSTATE_I	wrpr	%r0, 0x0e14, %pstate
	.word 0xc727e001  ! 612: STF_I	st	%f3, [0x0001, %r31]
	.word 0x87802080  ! 613: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x9a01e001  ! 614: ADD_I	add 	%r7, 0x0001, %r13
	.word 0x94510006  ! 615: UMUL_R	umul 	%r4, %r6, %r10
	.word 0x89a01a61  ! 616: FqTOi	fqtoi	
	.word 0xc9e7c021  ! 617: CASA_I	casa	[%r31] 0x 1, %r1, %r4
	.word 0xc8800a60  ! 618: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r4
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d902e09  ! 621: WRPR_PSTATE_I	wrpr	%r0, 0x0e09, %pstate
	.word 0x81982599  ! 622: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0599, %hpstate
	.word 0x8d802000  ! 623: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_33:
	.word 0x32800001  ! 625: BNE	bne,a	<label_0x1>
	.word 0xcf332001  ! 625: STQF_I	-	%f7, [0x0001, %r12]
	.word 0x95458000  ! 624: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0x81982cc3  ! 625: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc3, %hpstate
	.word 0xd4bfe001  ! 626: STDA_I	stda	%r10, [%r31 + 0x0001] %asi
	mov 0x31, %r30
	.word 0x87d0001e  ! 627: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x87802004  ! 628: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xd4800ac0  ! 629: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r10
DS_34:
	.word 0x22800001  ! 631: BE	be,a	<label_0x1>
	illtrap
	.word 0x95b0830f  ! 630: ALLIGNADDRESS	alignaddr	%r2, %r15, %r10
	.word 0x28800001  ! 631: BLEU	bleu,a	<label_0x1>
	.word 0xd4c004a0  ! 632: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
	.word 0x9da30dc9  ! 633: FdMULq	fdmulq	
DS_35:
	.word 0x34800001  ! 635: BG	bg,a	<label_0x1>
	illtrap
	.word 0x91b08301  ! 634: ALLIGNADDRESS	alignaddr	%r2, %r1, %r8
	.word 0x92d98009  ! 635: SMULcc_R	smulcc 	%r6, %r9, %r9
	ta	T_CHANGE_HPRIV	! macro
	mov 0x33, %r30
	.word 0x8bd0001e  ! 637: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0xd297e000  ! 638: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r9
	.word 0x8a7ac007  ! 639: SDIV_R	sdiv 	%r11, %r7, %r5
	.word 0x91500000  ! 640: RDPR_TPC	rdpr	%tpc, %r8
DS_36:
	.word 0x34800001  ! 642: BG	bg,a	<label_0x1>
	illtrap
	.word 0x95b2c308  ! 641: ALLIGNADDRESS	alignaddr	%r11, %r8, %r10
	.word 0x8d802000  ! 642: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d90269e  ! 643: WRPR_PSTATE_I	wrpr	%r0, 0x069e, %pstate
	.word 0x8d902e40  ! 644: WRPR_PSTATE_I	wrpr	%r0, 0x0e40, %pstate
	.word 0xd48008a0  ! 645: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x8d90201c  ! 646: WRPR_PSTATE_I	wrpr	%r0, 0x001c, %pstate
	.word 0x8c498004  ! 647: MULX_R	mulx 	%r6, %r4, %r6
DS_37:
	.word 0x20800001  ! 649: BN	bn,a	<label_0x1>
	illtrap
	.word 0x99b04306  ! 648: ALLIGNADDRESS	alignaddr	%r1, %r6, %r12
	.word 0x87802010  ! 649: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x99d02034  ! 650: Tcc_I	tgu	icc_or_xcc, %r0 + 52
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8048e001  ! 652: MULX_I	mulx 	%r3, 0x0001, %r0
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x84d2a001  ! 654: UMULcc_I	umulcc 	%r10, 0x0001, %r2
	.word 0x22800001  ! 655: BE	be,a	<label_0x1>
	.word 0x84d0400c  ! 656: UMULcc_R	umulcc 	%r1, %r12, %r2
	.word 0xc48008a0  ! 657: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x88c0e001  ! 658: ADDCcc_I	addccc 	%r3, 0x0001, %r4
	.word 0xc81fc000  ! 659: LDD_R	ldd	[%r31 + %r0], %r4
	.word 0xc88008a0  ! 660: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x9d698006  ! 663: SDIVX_R	sdivx	%r6, %r6, %r14
	.word 0x8d902e05  ! 664: WRPR_PSTATE_I	wrpr	%r0, 0x0e05, %pstate
	.word 0x89d02032  ! 665: Tcc_I	tleu	icc_or_xcc, %r0 + 50
	.word 0x8d802004  ! 666: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x97a01a68  ! 667: FqTOi	fqtoi	
	.word 0xd737e001  ! 668: STQF_I	-	%f11, [0x0001, %r31]
	.word 0x9fa00569  ! 669: FSQRTq	fsqrt	
	.word 0x9668a001  ! 670: UDIVX_I	udivx 	%r2, 0x0001, %r11
DS_38:
	.word 0x34800001  ! 672: BG	bg,a	<label_0x1>
	.word 0xcb318000  ! 672: STQF_R	-	%f5, [%r0, %r6]
	.word 0x99458000  ! 671: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x2e800001  ! 672: BVS	bvs,a	<label_0x1>
	.word 0x9da00568  ! 673: FSQRTq	fsqrt	
	.word 0xdcffc028  ! 674: SWAPA_R	swapa	%r14, [%r31 + %r8] 0x01
	.word 0xdcffc028  ! 675: SWAPA_R	swapa	%r14, [%r31 + %r8] 0x01
	ta	T_CHANGE_PRIV	! macro
	.word 0x83d02032  ! 677: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x38800001  ! 678: BGU	bgu,a	<label_0x1>
	.word 0xdc9004a0  ! 679: LDUHA_R	lduha	[%r0, %r0] 0x25, %r14
	.word 0xdcd004a0  ! 680: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r14
	.word 0x8d902087  ! 681: WRPR_PSTATE_I	wrpr	%r0, 0x0087, %pstate
	.word 0x83a049cc  ! 682: FDIVd	fdivd	%f32, %f12, %f32
	mov 0x35, %r30
	.word 0x8fd0001e  ! 683: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x8d802004  ! 684: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d802000  ! 685: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc2800ae0  ! 686: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r1
	.word 0xc28804a0  ! 687: LDUBA_R	lduba	[%r0, %r0] 0x25, %r1
	.word 0x8d902c8d  ! 688: WRPR_PSTATE_I	wrpr	%r0, 0x0c8d, %pstate
	.word 0x87802010  ! 689: WRASI_I	wr	%r0, 0x0010, %asi
DS_39:
	.word 0x32800001  ! 691: BNE	bne,a	<label_0x1>
	.word 0xc7314009  ! 691: STQF_R	-	%f3, [%r9, %r5]
	.word 0x83458000  ! 690: RD_SOFTINT_REG	rd	%softint, %r1
	.word 0x9648a001  ! 691: MULX_I	mulx 	%r2, 0x0001, %r11
	.word 0x84808005  ! 692: ADDcc_R	addcc 	%r2, %r5, %r2
	.word 0xc48fe010  ! 693: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r2
DS_40:
	.word 0x34800001  ! 695: BG	bg,a	<label_0x1>
	illtrap
	.word 0x99b0830d  ! 694: ALLIGNADDRESS	alignaddr	%r2, %r13, %r12
	.word 0x81982494  ! 695: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0494, %hpstate
DS_41:
	.word 0x20800001  ! 697: BN	bn,a	<label_0x1>
	.word 0xcf306001  ! 697: STQF_I	-	%f7, [0x0001, %r1]
	.word 0x85458000  ! 696: RD_SOFTINT_REG	rd	%softint, %r2
	.word 0x9e7a0002  ! 697: SDIV_R	sdiv 	%r8, %r2, %r15
	.word 0x9fd02035  ! 698: Tcc_I	tvc	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_PRIV	! macro
	.word 0xde7fe001  ! 700: SWAP_I	swap	%r15, [%r31 + 0x0001]
	.word 0xdeffc022  ! 701: SWAPA_R	swapa	%r15, [%r31 + %r2] 0x01
	.word 0x9ba0054a  ! 702: FSQRTd	fsqrt	
	ta	T_CHANGE_HPRIV	! macro
	.word 0xda37e001  ! 704: STH_I	sth	%r13, [%r31 + 0x0001]
	.word 0xdacfe030  ! 705: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r13
	.word 0x36800001  ! 706: BGE	bge,a	<label_0x1>
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81982399  ! 708: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0399, %hpstate
DS_42:
	.word 0x22800001  ! 710: BE	be,a	<label_0x1>
	.word 0xc131e001  ! 710: STQF_I	-	%f0, [0x0001, %r7]
	.word 0x8d458000  ! 709: RD_SOFTINT_REG	rd	%softint, %r6
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902691  ! 711: WRPR_PSTATE_I	wrpr	%r0, 0x0691, %pstate
	.word 0x8001e001  ! 712: ADD_I	add 	%r7, 0x0001, %r0
	.word 0x3e700001  ! 713: BPVC	<illegal instruction>
	.word 0x8e7ae001  ! 714: SDIV_I	sdiv 	%r11, 0x0001, %r7
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81982799  ! 716: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0799, %hpstate
	.word 0xced00e80  ! 717: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r7
	.word 0x8d902889  ! 718: WRPR_PSTATE_I	wrpr	%r0, 0x0889, %pstate
	.word 0x819820ce  ! 719: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00ce, %hpstate
	.word 0x8d802000  ! 720: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xce9004a0  ! 723: LDUHA_R	lduha	[%r0, %r0] 0x25, %r7
	.word 0x9ba1c9c4  ! 724: FDIVd	fdivd	%f38, %f4, %f44
DS_43:
	.word 0x20800001  ! 726: BN	bn,a	<label_0x1>
	.word 0xdb320005  ! 726: STQF_R	-	%f13, [%r5, %r8]
	.word 0x99458000  ! 725: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x87802004  ! 726: WRASI_I	wr	%r0, 0x0004, %asi
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xd8c00e60  ! 728: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r12
DS_44:
	.word 0x32800001  ! 730: BNE	bne,a	<label_0x1>
	.word 0xc331a001  ! 730: STQF_I	-	%f1, [0x0001, %r6]
	.word 0x81458000  ! 729: RD_SOFTINT_REG	stbar
	ta	T_CHANGE_HPRIV	! macro
	.word 0x32800001  ! 731: BNE	bne,a	<label_0x1>
	.word 0x87a01a65  ! 732: FqTOi	fqtoi	
	mov 0x31, %r30
	.word 0x89d0001e  ! 733: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x8d9024da  ! 734: WRPR_PSTATE_I	wrpr	%r0, 0x04da, %pstate
	.word 0xc6d00e40  ! 735: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r3
	.word 0x819828c0  ! 736: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c0, %hpstate
	.word 0xc647e001  ! 737: LDSW_I	ldsw	[%r31 + 0x0001], %r3
	.word 0x8d802000  ! 738: WRFPRS_I	wr	%r0, 0x0000, %fprs
	mov 0x35, %r30
	.word 0x93d0001e  ! 739: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc63fc005  ! 741: STD_R	std	%r3, [%r31 + %r5]
	.word 0xc6ffc025  ! 742: SWAPA_R	swapa	%r3, [%r31 + %r5] 0x01
	.word 0x81982013  ! 743: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0013, %hpstate
	.word 0xc6cfe010  ! 744: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r3
	.word 0xc68008a0  ! 745: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x24800001  ! 746: BLE	ble,a	<label_0x1>
	.word 0x824b4006  ! 747: MULX_R	mulx 	%r13, %r6, %r1
	.word 0x8d902697  ! 748: WRPR_PSTATE_I	wrpr	%r0, 0x0697, %pstate
	.word 0x819825cd  ! 749: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05cd, %hpstate
DS_45:
	.word 0x22800001  ! 751: BE	be,a	<label_0x1>
	.word 0xd930a001  ! 751: STQF_I	-	%f12, [0x0001, %r2]
	.word 0x93458000  ! 750: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0xd337e001  ! 751: STQF_I	-	%f9, [0x0001, %r31]
	.word 0x8198294e  ! 752: WRHPR_HPSTATE_I	wrhpr	%r0, 0x094e, %hpstate
	.word 0xd327c006  ! 753: STF_R	st	%f9, [%r6, %r31]
	.word 0x99a389c9  ! 754: FDIVd	fdivd	%f14, %f40, %f12
	.word 0xd84fc000  ! 755: LDSB_R	ldsb	[%r31 + %r0], %r12
	.word 0x81982ed7  ! 756: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed7, %hpstate
	.word 0x8d902c00  ! 757: WRPR_PSTATE_I	wrpr	%r0, 0x0c00, %pstate
	.word 0x81d02035  ! 758: Tcc_I	tn	icc_or_xcc, %r0 + 53
	.word 0x8d802000  ! 759: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd88008a0  ! 760: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d802000  ! 762: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x85a10d2d  ! 763: FsMULd	fsmuld	%f4, %f44, %f2
	ta	T_CHANGE_PRIV	! macro
	.word 0x81982696  ! 765: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0696, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc48008a0  ! 767: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x87802010  ! 768: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x9dd02032  ! 769: Tcc_I	tpos	icc_or_xcc, %r0 + 50
	.word 0xc42fe001  ! 770: STB_I	stb	%r2, [%r31 + 0x0001]
	.word 0xc45fe001  ! 771: LDX_I	ldx	[%r31 + 0x0001], %r2
	.word 0xc48fe010  ! 772: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r2
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d902459  ! 774: WRPR_PSTATE_I	wrpr	%r0, 0x0459, %pstate
	.word 0xc5e7c02d  ! 775: CASA_I	casa	[%r31] 0x 1, %r13, %r2
	.word 0xc4d7e000  ! 776: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r2
DS_46:
	.word 0x32800001  ! 778: BNE	bne,a	<label_0x1>
	.word 0xd9334008  ! 778: STQF_R	-	%f12, [%r8, %r13]
	.word 0x85458000  ! 777: RD_SOFTINT_REG	rd	%softint, %r2
	.word 0x8d902013  ! 778: WRPR_PSTATE_I	wrpr	%r0, 0x0013, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f508000  ! 780: RDPR_TSTATE	rdpr	%tstate, %r7
	.word 0x81982844  ! 781: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0844, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x30700001  ! 783: BPA	<illegal instruction>
	.word 0x81982306  ! 784: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0306, %hpstate
	.word 0x8dd02030  ! 785: Tcc_I	tneg	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d902c54  ! 787: WRPR_PSTATE_I	wrpr	%r0, 0x0c54, %pstate
	.word 0x819825d5  ! 788: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05d5, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xce8fe000  ! 790: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r7
	.word 0x30800001  ! 791: BA	ba,a	<label_0x1>
	.word 0x9f508000  ! 792: RDPR_TSTATE	rdpr	%tstate, %r15
DS_47:
	.word 0x20800001  ! 794: BN	bn,a	<label_0x1>
	.word 0xcd32800a  ! 794: STQF_R	-	%f6, [%r10, %r10]
	.word 0x89458000  ! 793: RD_SOFTINT_REG	rd	%softint, %r4
DS_48:
	.word 0x22800001  ! 795: BE	be,a	<label_0x1>
	.word 0xcf312001  ! 795: STQF_I	-	%f7, [0x0001, %r4]
	.word 0x8b458000  ! 794: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0x80d1c001  ! 795: UMULcc_R	umulcc 	%r7, %r1, %r0
	.word 0x87802080  ! 796: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x34800001  ! 797: BG	bg,a	<label_0x1>
	.word 0x8198218b  ! 798: WRHPR_HPSTATE_I	wrhpr	%r0, 0x018b, %hpstate
	.word 0x81982485  ! 799: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0485, %hpstate
DS_49:
	.word 0x22800001  ! 801: BE	be,a	<label_0x1>
	.word 0xdb33c00c  ! 801: STQF_R	-	%f13, [%r12, %r15]
	.word 0x91458000  ! 800: RD_SOFTINT_REG	rd	%softint, %r8
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91d02031  ! 802: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x8c6b8003  ! 803: UDIVX_R	udivx 	%r14, %r3, %r6
	.word 0x87802089  ! 804: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8198230f  ! 805: WRHPR_HPSTATE_I	wrhpr	%r0, 0x030f, %hpstate
	.word 0x91500000  ! 806: RDPR_TPC	rdpr	%tpc, %r8
DS_50:
	.word 0x32800001  ! 808: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x97b24300  ! 807: ALLIGNADDRESS	alignaddr	%r9, %r0, %r11
	.word 0xd68008a0  ! 808: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x81982b94  ! 809: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b94, %hpstate
	.word 0x8d902610  ! 810: WRPR_PSTATE_I	wrpr	%r0, 0x0610, %pstate
	.word 0x81982dd3  ! 811: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dd3, %hpstate
	.word 0xd68804a0  ! 812: LDUBA_R	lduba	[%r0, %r0] 0x25, %r11
	.word 0xd607c000  ! 813: LDUW_R	lduw	[%r31 + %r0], %r11
	.word 0x97a28dc1  ! 814: FdMULq	fdmulq	
	.word 0x8d902c49  ! 815: WRPR_PSTATE_I	wrpr	%r0, 0x0c49, %pstate
	.word 0x8ed8c009  ! 816: SMULcc_R	smulcc 	%r3, %r9, %r7
	.word 0xcedfe020  ! 817: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r7
	ta	T_CHANGE_PRIV	! macro
	.word 0xce1fc000  ! 819: LDD_R	ldd	[%r31 + %r0], %r7
	.word 0x81982611  ! 820: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0611, %hpstate
	.word 0x9c496001  ! 821: MULX_I	mulx 	%r5, 0x0001, %r14
	.word 0x87802089  ! 822: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x81982357  ! 823: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0357, %hpstate
	.word 0x9e69800b  ! 824: UDIVX_R	udivx 	%r6, %r11, %r15
	.word 0x8da3c9e6  ! 825: FDIVq	dis not found

	.word 0x8198268f  ! 826: WRHPR_HPSTATE_I	wrhpr	%r0, 0x068f, %hpstate
	.word 0x28800001  ! 827: BLEU	bleu,a	<label_0x1>
	.word 0xccc7e000  ! 828: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r6
	.word 0x20700001  ! 829: BPN	<illegal instruction>
	.word 0x81982b8a  ! 830: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b8a, %hpstate
	.word 0x8d9022cc  ! 831: WRPR_PSTATE_I	wrpr	%r0, 0x02cc, %pstate
	.word 0x9b514000  ! 832: RDPR_TBA	rdpr	%tba, %r13
	.word 0x81982099  ! 833: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0099, %hpstate
	mov 0x35, %r30
	.word 0x85d0001e  ! 834: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0xdabfe001  ! 835: STDA_I	stda	%r13, [%r31 + 0x0001] %asi
	.word 0x819822ca  ! 836: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02ca, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xdaffc026  ! 838: SWAPA_R	swapa	%r13, [%r31 + %r6] 0x01
	.word 0x86d2c007  ! 839: UMULcc_R	umulcc 	%r11, %r7, %r3
	.word 0x81982049  ! 840: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0049, %hpstate
DS_51:
	.word 0x34800001  ! 842: BG	bg,a	<label_0x1>
	.word 0xcf336001  ! 842: STQF_I	-	%f7, [0x0001, %r13]
	.word 0x9b458000  ! 841: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0xda1fc000  ! 842: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0x95a000c5  ! 843: FNEGd	fnegd	%f36, %f10
	.word 0x85d02033  ! 844: Tcc_I	tle	icc_or_xcc, %r0 + 51
	.word 0x819821dc  ! 845: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01dc, %hpstate
DS_52:
	.word 0x34800001  ! 847: BG	bg,a	<label_0x1>
	.word 0xd931e001  ! 847: STQF_I	-	%f12, [0x0001, %r7]
	.word 0x91458000  ! 846: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x24800001  ! 847: BLE	ble,a	<label_0x1>
	.word 0xd0d004a0  ! 848: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
	.word 0x8d90264f  ! 849: WRPR_PSTATE_I	wrpr	%r0, 0x064f, %pstate
	.word 0x8d9022c3  ! 850: WRPR_PSTATE_I	wrpr	%r0, 0x02c3, %pstate
	.word 0x84d3800a  ! 851: UMULcc_R	umulcc 	%r14, %r10, %r2
	.word 0x8d902817  ! 852: WRPR_PSTATE_I	wrpr	%r0, 0x0817, %pstate
	.word 0x81982411  ! 853: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0411, %hpstate
	.word 0x99a3cd22  ! 854: FsMULd	fsmuld	%f15, %f2, %f12
	.word 0x8d902648  ! 855: WRPR_PSTATE_I	wrpr	%r0, 0x0648, %pstate
	.word 0x91a00548  ! 856: FSQRTd	fsqrt	
	.word 0xd0bfe001  ! 857: STDA_I	stda	%r8, [%r31 + 0x0001] %asi
	.word 0x2e800001  ! 858: BVS	bvs,a	<label_0x1>
	.word 0x9ad08000  ! 859: UMULcc_R	umulcc 	%r2, %r0, %r13
	.word 0x93696001  ! 860: SDIVX_I	sdivx	%r5, 0x0001, %r9
	.word 0x8d902e8d  ! 861: WRPR_PSTATE_I	wrpr	%r0, 0x0e8d, %pstate
	.word 0x8d9022d3  ! 862: WRPR_PSTATE_I	wrpr	%r0, 0x02d3, %pstate
DS_53:
	.word 0x34800001  ! 864: BG	bg,a	<label_0x1>
	.word 0xc1338005  ! 864: STQF_R	-	%f0, [%r5, %r14]
	.word 0x83458000  ! 863: RD_SOFTINT_REG	rd	%softint, %r1
	mov 0x31, %r30
	.word 0x8dd0001e  ! 864: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0xc2d7e000  ! 865: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r1
	.word 0x81982c8e  ! 866: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c8e, %hpstate
	.word 0x8769e001  ! 867: SDIVX_I	sdivx	%r7, 0x0001, %r3
	.word 0x906b0001  ! 868: UDIVX_R	udivx 	%r12, %r1, %r8
	.word 0x87802014  ! 869: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x95d02032  ! 870: Tcc_I	tg	icc_or_xcc, %r0 + 50
	.word 0x87d02035  ! 871: Tcc_I	tl	icc_or_xcc, %r0 + 53
	.word 0x34800001  ! 872: BG	bg,a	<label_0x1>
	.word 0x81982f46  ! 873: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f46, %hpstate
	.word 0x82800004  ! 874: ADDcc_R	addcc 	%r0, %r4, %r1
	.word 0xc3e7c024  ! 875: CASA_I	casa	[%r31] 0x 1, %r4, %r1
	.word 0xc2880e40  ! 876: LDUBA_R	lduba	[%r0, %r0] 0x72, %r1
	.word 0x8d902e51  ! 877: WRPR_PSTATE_I	wrpr	%r0, 0x0e51, %pstate
	.word 0x8d90265a  ! 878: WRPR_PSTATE_I	wrpr	%r0, 0x065a, %pstate
	.word 0x8d902ad7  ! 879: WRPR_PSTATE_I	wrpr	%r0, 0x0ad7, %pstate
	.word 0x81982f15  ! 880: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f15, %hpstate
	.word 0x9fd02035  ! 881: Tcc_I	tvc	icc_or_xcc, %r0 + 53
	.word 0x83508000  ! 882: RDPR_TSTATE	rdpr	%tstate, %r1
DS_54:
	.word 0x32800001  ! 884: BNE	bne,a	<label_0x1>
	.word 0xc1332001  ! 884: STQF_I	-	%f0, [0x0001, %r12]
	.word 0x9d458000  ! 883: RD_SOFTINT_REG	rd	%softint, %r14
	mov 0x34, %r30
	.word 0x99d0001e  ! 884: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x32800001  ! 885: BNE	bne,a	<label_0x1>
	.word 0x9fa289ad  ! 886: FDIVs	fdivs	%f10, %f13, %f15
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8ba00569  ! 888: FSQRTq	fsqrt	
	.word 0xcad804a0  ! 889: LDXA_R	ldxa	[%r0, %r0] 0x25, %r5
	.word 0xcad004a0  ! 890: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r5
	.word 0x8d902680  ! 891: WRPR_PSTATE_I	wrpr	%r0, 0x0680, %pstate
	.word 0x89a00563  ! 892: FSQRTq	fsqrt	
	.word 0x3c800001  ! 893: BPOS	bpos,a	<label_0x1>
	.word 0xc87fe001  ! 894: SWAP_I	swap	%r4, [%r31 + 0x0001]
DS_55:
	.word 0x20800001  ! 896: BN	bn,a	<label_0x1>
	.word 0xdb318000  ! 896: STQF_R	-	%f13, [%r0, %r6]
	.word 0x85458000  ! 895: RD_SOFTINT_REG	rd	%softint, %r2
	.word 0xc40fc000  ! 896: LDUB_R	ldub	[%r31 + %r0], %r2
	.word 0xc4bfe001  ! 897: STDA_I	stda	%r2, [%r31 + 0x0001] %asi
	.word 0x9b514000  ! 898: RDPR_TBA	rdpr	%tba, %r13
	.word 0x26800001  ! 899: BL	bl,a	<label_0x1>
	.word 0x907b800a  ! 900: SDIV_R	sdiv 	%r14, %r10, %r8
	.word 0x87a109cf  ! 901: FDIVd	fdivd	%f4, %f46, %f34
	.word 0x9ba109a8  ! 902: FDIVs	fdivs	%f4, %f8, %f13
	.word 0xdb37e001  ! 903: STQF_I	-	%f13, [0x0001, %r31]
	.word 0xda8fe000  ! 904: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r13
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902809  ! 906: WRPR_PSTATE_I	wrpr	%r0, 0x0809, %pstate
	.word 0x87802016  ! 907: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xda3fe001  ! 908: STD_I	std	%r13, [%r31 + 0x0001]
	.word 0xda97e020  ! 909: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r13
	.word 0x26700001  ! 910: BPL	<illegal instruction>
	mov 0x32, %r30
	.word 0x81d0001e  ! 911: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0xda57c000  ! 912: LDSH_R	ldsh	[%r31 + %r0], %r13
	.word 0xda800aa0  ! 913: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r13
	.word 0x82816001  ! 914: ADDcc_I	addcc 	%r5, 0x0001, %r1
	.word 0x81982398  ! 915: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0398, %hpstate
	.word 0x8d802004  ! 916: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x81982bd1  ! 917: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bd1, %hpstate
	.word 0x8b504000  ! 918: RDPR_TNPC	rdpr	%tnpc, %r5
	.word 0x81982a07  ! 919: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a07, %hpstate
	.word 0x819820d1  ! 920: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00d1, %hpstate
	.word 0x81982894  ! 921: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0894, %hpstate
	.word 0x8d902e18  ! 922: WRPR_PSTATE_I	wrpr	%r0, 0x0e18, %pstate
	.word 0x81982edd  ! 923: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0edd, %hpstate
	.word 0x81982c0f  ! 924: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c0f, %hpstate
	.word 0x8198200a  ! 925: WRHPR_HPSTATE_I	wrhpr	%r0, 0x000a, %hpstate
	.word 0x99d02035  ! 926: Tcc_I	tgu	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_HPRIV	! macro
	.word 0xca8fe000  ! 928: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r5
	.word 0xcaffc028  ! 929: SWAPA_R	swapa	%r5, [%r31 + %r8] 0x01
	.word 0x87802016  ! 930: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8198290a  ! 931: WRHPR_HPSTATE_I	wrhpr	%r0, 0x090a, %hpstate
	.word 0x8fd02033  ! 932: Tcc_I	tvs	icc_or_xcc, %r0 + 51
	.word 0x9ad1a001  ! 933: UMULcc_I	umulcc 	%r6, 0x0001, %r13
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81982c48  ! 935: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c48, %hpstate
	.word 0xda8008a0  ! 936: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x81982b13  ! 937: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b13, %hpstate
	.word 0x8fa109ca  ! 938: FDIVd	fdivd	%f4, %f10, %f38
	.word 0x85d02033  ! 939: Tcc_I	tle	icc_or_xcc, %r0 + 51
	.word 0xce8008a0  ! 940: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0xced7e030  ! 941: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r7
	.word 0xcf37c00a  ! 942: STQF_R	-	%f7, [%r10, %r31]
	.word 0x8969e001  ! 943: SDIVX_I	sdivx	%r7, 0x0001, %r4
	.word 0x8198244a  ! 944: WRHPR_HPSTATE_I	wrhpr	%r0, 0x044a, %hpstate
	.word 0x81514000  ! 945: RDPR_TBA	rdpr	%tba, %r0
	.word 0x8d902cdf  ! 946: WRPR_PSTATE_I	wrpr	%r0, 0x0cdf, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xc0d00e60  ! 948: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r0
	.word 0x88c1e001  ! 949: ADDCcc_I	addccc 	%r7, 0x0001, %r4
	mov 0x35, %r30
	.word 0x85d0001e  ! 950: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xc8880e80  ! 953: LDUBA_R	lduba	[%r0, %r0] 0x74, %r4
	.word 0x81982555  ! 954: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0555, %hpstate
	.word 0xc88008a0  ! 955: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
	.word 0x87802089  ! 956: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8da3c9a7  ! 957: FDIVs	fdivs	%f15, %f7, %f6
	.word 0xcde7c027  ! 958: CASA_I	casa	[%r31] 0x 1, %r7, %r6
	.word 0xcc1fe001  ! 959: LDD_I	ldd	[%r31 + 0x0001], %r6
	.word 0xcc77c007  ! 960: STX_R	stx	%r6, [%r31 + %r7]
	.word 0x9da0cd29  ! 961: FsMULd	fsmuld	%f3, %f40, %f14
	.word 0x8d902a07  ! 962: WRPR_PSTATE_I	wrpr	%r0, 0x0a07, %pstate
	.word 0x81982003  ! 963: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0003, %hpstate
	.word 0x8da009a8  ! 964: FDIVs	fdivs	%f0, %f8, %f6
	.word 0x8198278e  ! 965: WRHPR_HPSTATE_I	wrhpr	%r0, 0x078e, %hpstate
	mov 0x33, %r30
	.word 0x8dd0001e  ! 966: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x8198235f  ! 967: WRHPR_HPSTATE_I	wrhpr	%r0, 0x035f, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d802004  ! 969: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8a816001  ! 970: ADDcc_I	addcc 	%r5, 0x0001, %r5
	mov 0x31, %r30
	.word 0x8dd0001e  ! 971: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x81982f04  ! 972: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f04, %hpstate
	.word 0x95a01a65  ! 973: FqTOi	fqtoi	
	.word 0xd4d804a0  ! 974: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
	.word 0x81982652  ! 975: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0652, %hpstate
	.word 0x8d902e0a  ! 976: WRPR_PSTATE_I	wrpr	%r0, 0x0e0a, %pstate
	.word 0x8848c001  ! 977: MULX_R	mulx 	%r3, %r1, %r4
	.word 0x8e6a6001  ! 978: UDIVX_I	udivx 	%r9, 0x0001, %r7
	.word 0x85a3cdce  ! 979: FdMULq	fdmulq	
	.word 0x81982086  ! 980: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0086, %hpstate
	.word 0xc5e7c02e  ! 981: CASA_I	casa	[%r31] 0x 1, %r14, %r2
	.word 0x8d802004  ! 982: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x9468400a  ! 983: UDIVX_R	udivx 	%r1, %r10, %r10
	.word 0x9049a001  ! 984: MULX_I	mulx 	%r6, 0x0001, %r8
	.word 0xd07fe001  ! 985: SWAP_I	swap	%r8, [%r31 + 0x0001]
	.word 0x88c22001  ! 986: ADDCcc_I	addccc 	%r8, 0x0001, %r4
	.word 0x81982498  ! 987: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0498, %hpstate
	.word 0x26700001  ! 988: BPL	<illegal instruction>
DS_56:
	.word 0x32800001  ! 990: BNE	bne,a	<label_0x1>
	.word 0xc5338004  ! 990: STQF_R	-	%f2, [%r4, %r14]
	.word 0x9b458000  ! 989: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x8c500007  ! 990: UMUL_R	umul 	%r0, %r7, %r6
	.word 0xccd7e020  ! 991: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r6
	.word 0x8fa2cdce  ! 992: FdMULq	fdmulq	
	.word 0x8d802004  ! 993: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xce8fe030  ! 994: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r7
	.word 0x8eda800f  ! 995: SMULcc_R	smulcc 	%r10, %r15, %r7
	.word 0xce8008a0  ! 996: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x3c800001  ! 997: BPOS	bpos,a	<label_0x1>
	.word 0x8198254e  ! 998: WRHPR_HPSTATE_I	wrhpr	%r0, 0x054e, %hpstate
	.word 0x8d90221c  ! 999: WRPR_PSTATE_I	wrpr	%r0, 0x021c, %pstate
	.word 0x84812001  ! 1000: ADDcc_I	addcc 	%r4, 0x0001, %r2
	.word 0x8d902a1b  ! 1001: WRPR_PSTATE_I	wrpr	%r0, 0x0a1b, %pstate
	.word 0x97500000  ! 1002: RDPR_TPC	rdpr	%tpc, %r11
	.word 0x87802016  ! 1003: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8d902018  ! 1004: WRPR_PSTATE_I	wrpr	%r0, 0x0018, %pstate
	.word 0x8d802004  ! 1005: WRFPRS_I	wr	%r0, 0x0004, %fprs
DS_57:
	.word 0x20800001  ! 1007: BN	bn,a	<label_0x1>
	.word 0xd7316001  ! 1007: STQF_I	-	%f11, [0x0001, %r5]
	.word 0x83458000  ! 1006: RD_SOFTINT_REG	rd	%softint, %r1
DS_58:
	.word 0x20800001  ! 1008: BN	bn,a	<label_0x1>
	.word 0xcb33a001  ! 1008: STQF_I	-	%f5, [0x0001, %r14]
	.word 0x9b458000  ! 1007: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0xda77e001  ! 1008: STX_I	stx	%r13, [%r31 + 0x0001]
	.word 0xdaffc02f  ! 1009: SWAPA_R	swapa	%r13, [%r31 + %r15] 0x01
DS_59:
	.word 0x20800001  ! 1011: BN	bn,a	<label_0x1>
	.word 0xc3332001  ! 1011: STQF_I	-	%f1, [0x0001, %r12]
	.word 0x81458000  ! 1010: RD_SOFTINT_REG	stbar
	.word 0x81982a99  ! 1011: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a99, %hpstate
	.word 0x87802004  ! 1012: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8d802004  ! 1013: WRFPRS_I	wr	%r0, 0x0004, %fprs
	mov 0x30, %r30
	.word 0x89d0001e  ! 1014: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0xc097e010  ! 1015: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r0
	.word 0x8e78e001  ! 1016: SDIV_I	sdiv 	%r3, 0x0001, %r7
	.word 0xcec804a0  ! 1017: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r7
	.word 0x24700001  ! 1018: BPLE	<illegal instruction>
DS_60:
	.word 0x22800001  ! 1020: BE	be,a	<label_0x1>
	illtrap
	.word 0x83b1430a  ! 1019: ALLIGNADDRESS	alignaddr	%r5, %r10, %r1
	.word 0x36700001  ! 1020: BPGE	<illegal instruction>
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x87802004  ! 1022: WRASI_I	wr	%r0, 0x0004, %asi
DS_61:
	.word 0x20800001  ! 1024: BN	bn,a	<label_0x1>
	.word 0xc9308007  ! 1024: STQF_R	-	%f4, [%r7, %r2]
	.word 0x91458000  ! 1023: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x8d902495  ! 1024: WRPR_PSTATE_I	wrpr	%r0, 0x0495, %pstate
	.word 0x8dd02033  ! 1025: Tcc_I	tneg	icc_or_xcc, %r0 + 51
DS_62:
	.word 0x22800001  ! 1027: BE	be,a	<label_0x1>
	.word 0xc1322001  ! 1027: STQF_I	-	%f0, [0x0001, %r8]
	.word 0x89458000  ! 1026: RD_SOFTINT_REG	rd	%softint, %r4
	.word 0x38700001  ! 1027: BPGU	<illegal instruction>
	.word 0x99a30dcf  ! 1028: FdMULq	fdmulq	
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81982f07  ! 1030: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f07, %hpstate
	.word 0x81a089c5  ! 1031: FDIVd	fdivd	%f2, %f36, %f0
	.word 0x9f480000  ! 1032: RDHPR_HPSTATE	rdhpr	%hpstate, %r15
	.word 0xdec004a0  ! 1033: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r15
	.word 0x8d902012  ! 1034: WRPR_PSTATE_I	wrpr	%r0, 0x0012, %pstate
	mov 0x34, %r30
	.word 0x89d0001e  ! 1035: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0xdf27e001  ! 1036: STF_I	st	%f15, [0x0001, %r31]
	.word 0x84d1e001  ! 1037: UMULcc_I	umulcc 	%r7, 0x0001, %r2
	.word 0xc537e001  ! 1038: STQF_I	-	%f2, [0x0001, %r31]
	.word 0x91a049ed  ! 1039: FDIVq	dis not found

	.word 0xd02fc00d  ! 1040: STB_R	stb	%r8, [%r31 + %r13]
DS_63:
	.word 0x22800001  ! 1042: BE	be,a	<label_0x1>
	.word 0xcf332001  ! 1042: STQF_I	-	%f7, [0x0001, %r12]
	.word 0x9d458000  ! 1041: RD_SOFTINT_REG	rd	%softint, %r14
	.word 0x93d02033  ! 1042: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x81a00562  ! 1043: FSQRTq	fsqrt	
	.word 0xc0cfe030  ! 1044: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r0
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xc08804a0  ! 1046: LDUBA_R	lduba	[%r0, %r0] 0x25, %r0
	.word 0x28700001  ! 1047: BPLEU	<illegal instruction>
	.word 0xc00fe001  ! 1048: LDUB_I	ldub	[%r31 + 0x0001], %r0
	.word 0xc08008a0  ! 1049: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0x8d902ade  ! 1050: WRPR_PSTATE_I	wrpr	%r0, 0x0ade, %pstate
	.word 0x8198260b  ! 1051: WRHPR_HPSTATE_I	wrhpr	%r0, 0x060b, %hpstate
	.word 0xc1e7c022  ! 1052: CASA_I	casa	[%r31] 0x 1, %r2, %r0
DS_64:
	.word 0x20800001  ! 1054: BN	bn,a	<label_0x1>
	.word 0xcf33c002  ! 1054: STQF_R	-	%f7, [%r2, %r15]
	.word 0x8f458000  ! 1053: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0x3a800001  ! 1054: BCC	bcc,a	<label_0x1>
	mov 0x34, %r30
	.word 0x83d0001e  ! 1055: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d902a54  ! 1056: WRPR_PSTATE_I	wrpr	%r0, 0x0a54, %pstate
	.word 0x30800001  ! 1057: BA	ba,a	<label_0x1>
	.word 0x9150c000  ! 1058: RDPR_TT	rdpr	%tt, %r8
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xd0c80e80  ! 1060: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r8
	.word 0x8d90260a  ! 1061: WRPR_PSTATE_I	wrpr	%r0, 0x060a, %pstate
	mov 0x34, %r30
	.word 0x8dd0001e  ! 1062: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x8cd9c00a  ! 1063: SMULcc_R	smulcc 	%r7, %r10, %r6
	.word 0x85d02035  ! 1064: Tcc_I	tle	icc_or_xcc, %r0 + 53
	.word 0x81982b13  ! 1065: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b13, %hpstate
DS_65:
	.word 0x22800001  ! 1067: BE	be,a	<label_0x1>
	.word 0xd1318004  ! 1067: STQF_R	-	%f8, [%r4, %r6]
	.word 0x89458000  ! 1066: RD_SOFTINT_REG	rd	%softint, %r4
	.word 0x86d0c007  ! 1067: UMULcc_R	umulcc 	%r3, %r7, %r3
	.word 0xc61fe001  ! 1068: LDD_I	ldd	[%r31 + 0x0001], %r3
	.word 0x87480000  ! 1069: RDHPR_HPSTATE	rdhpr	%hpstate, %r3
	.word 0x89a20d25  ! 1070: FsMULd	fsmuld	%f8, %f36, %f4
	.word 0xc8800ac0  ! 1071: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r4
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x2a700001  ! 1073: BPCS	<illegal instruction>
	.word 0x8d902606  ! 1074: WRPR_PSTATE_I	wrpr	%r0, 0x0606, %pstate
	.word 0x9048400a  ! 1075: MULX_R	mulx 	%r1, %r10, %r8
DS_66:
	.word 0x20800001  ! 1077: BN	bn,a	<label_0x1>
	.word 0xc9302001  ! 1077: STQF_I	-	%f4, [0x0001, %r0]
	.word 0x97458000  ! 1076: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0xd6d004a0  ! 1077: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r11
	.word 0x91d02031  ! 1078: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xd797e001  ! 1079: LDQFA_I	-	[%r31, 0x0001], %f11
	.word 0x81982007  ! 1080: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0007, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8551c000  ! 1082: RDPR_TL	rdpr	%tl, %r2
DS_67:
	.word 0x32800001  ! 1084: BNE	bne,a	<label_0x1>
	.word 0xc530a001  ! 1084: STQF_I	-	%f2, [0x0001, %r2]
	.word 0x8b458000  ! 1083: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0x8d802000  ! 1084: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d802004  ! 1085: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x81982212  ! 1086: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0212, %hpstate
	mov 0x33, %r30
	.word 0x9fd0001e  ! 1087: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0xca8008a0  ! 1088: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0x99d02035  ! 1089: Tcc_I	tgu	icc_or_xcc, %r0 + 53
	.word 0x8d902682  ! 1090: WRPR_PSTATE_I	wrpr	%r0, 0x0682, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81982a54  ! 1092: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a54, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d802000  ! 1094: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x819828d2  ! 1095: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d2, %hpstate
	.word 0x9cc0a001  ! 1096: ADDCcc_I	addccc 	%r2, 0x0001, %r14
	.word 0x81d02033  ! 1097: Tcc_I	tn	icc_or_xcc, %r0 + 51
	.word 0x81982f86  ! 1098: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f86, %hpstate
	.word 0x98d2e001  ! 1099: UMULcc_I	umulcc 	%r11, 0x0001, %r12
	.word 0x8f514000  ! 1100: RDPR_TBA	rdpr	%tba, %r7
DS_68:
	.word 0x32800001  ! 1102: BNE	bne,a	<label_0x1>
	.word 0xc533000b  ! 1102: STQF_R	-	%f2, [%r11, %r12]
	.word 0x93458000  ! 1101: RD_SOFTINT_REG	rd	%softint, %r9
	mov 0x30, %r30
	.word 0x8dd0001e  ! 1102: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x2e800001  ! 1104: BVS	bvs,a	<label_0x1>
DS_69:
	.word 0x34800001  ! 1106: BG	bg,a	<label_0x1>
	illtrap
	.word 0x9bb0430d  ! 1105: ALLIGNADDRESS	alignaddr	%r1, %r13, %r13
	.word 0x92792001  ! 1106: SDIV_I	sdiv 	%r4, 0x0001, %r9
	.word 0x8d902610  ! 1107: WRPR_PSTATE_I	wrpr	%r0, 0x0610, %pstate
	.word 0x9e83400c  ! 1108: ADDcc_R	addcc 	%r13, %r12, %r15
	.word 0x9880c005  ! 1109: ADDcc_R	addcc 	%r3, %r5, %r12
	.word 0xd8800aa0  ! 1110: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r12
	.word 0x81982997  ! 1111: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0997, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8f504000  ! 1113: RDPR_TNPC	rdpr	%tnpc, %r7
	.word 0x28700001  ! 1114: BPLEU	<illegal instruction>
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902680  ! 1116: WRPR_PSTATE_I	wrpr	%r0, 0x0680, %pstate
	.word 0x81982b8b  ! 1117: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b8b, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0xce8008a0  ! 1119: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x967a2001  ! 1120: SDIV_I	sdiv 	%r8, 0x0001, %r11
	.word 0x9950c000  ! 1121: RDPR_TT	rdpr	%tt, %r12
	ta	T_CHANGE_HPRIV	! macro
	.word 0x83d02031  ! 1123: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0x8d902213  ! 1124: WRPR_PSTATE_I	wrpr	%r0, 0x0213, %pstate
	.word 0x85d02030  ! 1125: Tcc_I	tle	icc_or_xcc, %r0 + 48
	.word 0x32700001  ! 1126: BPNE	<illegal instruction>
	.word 0xd827e001  ! 1127: STW_I	stw	%r12, [%r31 + 0x0001]
DS_70:
	.word 0x22800001  ! 1129: BE	be,a	<label_0x1>
	.word 0xdf32c008  ! 1129: STQF_R	-	%f15, [%r8, %r11]
	.word 0x99458000  ! 1128: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x8d802004  ! 1129: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d902ed5  ! 1130: WRPR_PSTATE_I	wrpr	%r0, 0x0ed5, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xd9e7c028  ! 1132: CASA_I	casa	[%r31] 0x 1, %r8, %r12
	.word 0x85d02034  ! 1133: Tcc_I	tle	icc_or_xcc, %r0 + 52
	.word 0x946a8002  ! 1134: UDIVX_R	udivx 	%r10, %r2, %r10
	.word 0x81982b84  ! 1135: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b84, %hpstate
	.word 0x89a10d21  ! 1136: FsMULd	fsmuld	%f4, %f32, %f4
	.word 0x9ed3c003  ! 1137: UMULcc_R	umulcc 	%r15, %r3, %r15
	.word 0x8d902652  ! 1138: WRPR_PSTATE_I	wrpr	%r0, 0x0652, %pstate
	.word 0x924b000c  ! 1139: MULX_R	mulx 	%r12, %r12, %r9
	.word 0xd257c000  ! 1140: LDSH_R	ldsh	[%r31 + %r0], %r9
	.word 0x83d02032  ! 1141: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x81982056  ! 1142: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0056, %hpstate
	.word 0x8d802000  ! 1143: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd227c00c  ! 1144: STW_R	stw	%r9, [%r31 + %r12]
	.word 0x8d9022ca  ! 1145: WRPR_PSTATE_I	wrpr	%r0, 0x02ca, %pstate
	.word 0x90c3e001  ! 1146: ADDCcc_I	addccc 	%r15, 0x0001, %r8
	.word 0x83a0056d  ! 1147: FSQRTq	fsqrt	
	.word 0x8d802004  ! 1148: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x836a0001  ! 1149: SDIVX_R	sdivx	%r8, %r1, %r1
	mov 0x32, %r30
	.word 0x95d0001e  ! 1150: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x87a01a6f  ! 1151: FqTOi	fqtoi	
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d90221f  ! 1154: WRPR_PSTATE_I	wrpr	%r0, 0x021f, %pstate
	.word 0xc68008a0  ! 1155: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0xc717c000  ! 1156: LDQF_R	-	[%r31, %r0], %f3
DS_71:
	.word 0x22800001  ! 1158: BE	be,a	<label_0x1>
	illtrap
	.word 0x8fb38309  ! 1157: ALLIGNADDRESS	alignaddr	%r14, %r9, %r7
	.word 0xce8008a0  ! 1158: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0xce07e001  ! 1159: LDUW_I	lduw	[%r31 + 0x0001], %r7
	.word 0x81982687  ! 1160: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0687, %hpstate
	.word 0x2c700001  ! 1161: BPNEG	<illegal instruction>
	.word 0x81982d1d  ! 1162: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d1d, %hpstate
	.word 0xcfe7c029  ! 1163: CASA_I	casa	[%r31] 0x 1, %r9, %r7
	.word 0x93a249c9  ! 1164: FDIVd	fdivd	%f40, %f40, %f40
	.word 0xd2c804a0  ! 1165: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r9
	.word 0x8198210a  ! 1166: WRHPR_HPSTATE_I	wrhpr	%r0, 0x010a, %hpstate
	mov 0x34, %r30
	.word 0x91d0001e  ! 1167: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	mov 0x35, %r30
	.word 0x87d0001e  ! 1168: Tcc_R	tl	icc_or_xcc, %r0 + %r30
DS_72:
	.word 0x34800001  ! 1170: BG	bg,a	<label_0x1>
	illtrap
	.word 0x81b1c307  ! 1169: ALLIGNADDRESS	alignaddr	%r7, %r7, %r0
DS_73:
	.word 0x32800001  ! 1171: BNE	bne,a	<label_0x1>
	.word 0xdf324004  ! 1171: STQF_R	-	%f15, [%r4, %r9]
	.word 0x81458000  ! 1170: RD_SOFTINT_REG	stbar
	.word 0x8198215c  ! 1171: WRHPR_HPSTATE_I	wrhpr	%r0, 0x015c, %hpstate
	.word 0x81982e0f  ! 1172: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e0f, %hpstate
	.word 0xc08008a0  ! 1173: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0x8d802000  ! 1174: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982e45  ! 1175: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e45, %hpstate
DS_74:
	.word 0x22800001  ! 1177: BE	be,a	<label_0x1>
	.word 0xd5324007  ! 1177: STQF_R	-	%f10, [%r7, %r9]
	.word 0x9d458000  ! 1176: RD_SOFTINT_REG	rd	%softint, %r14
	.word 0x8d902ad8  ! 1177: WRPR_PSTATE_I	wrpr	%r0, 0x0ad8, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9f6a6001  ! 1179: SDIVX_I	sdivx	%r9, 0x0001, %r15
	.word 0x8d902acc  ! 1180: WRPR_PSTATE_I	wrpr	%r0, 0x0acc, %pstate
	.word 0x87802088  ! 1181: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x24700001  ! 1182: BPLE	<illegal instruction>
	.word 0x89d02032  ! 1183: Tcc_I	tleu	icc_or_xcc, %r0 + 50
	.word 0xde7fe001  ! 1184: SWAP_I	swap	%r15, [%r31 + 0x0001]
	ta	T_CHANGE_HPRIV	! macro
	.word 0x93d02034  ! 1186: Tcc_I	tne	icc_or_xcc, %r0 + 52
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x9fd02035  ! 1188: Tcc_I	tvc	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_NONPRIV	! macro
	mov 0x31, %r30
	.word 0x9bd0001e  ! 1190: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x87802080  ! 1191: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x97690008  ! 1192: SDIVX_R	sdivx	%r4, %r8, %r11
	.word 0x8d902853  ! 1193: WRPR_PSTATE_I	wrpr	%r0, 0x0853, %pstate
	.word 0x81982bd8  ! 1194: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bd8, %hpstate
	.word 0x82798001  ! 1195: SDIV_R	sdiv 	%r6, %r1, %r1
	.word 0x819821c9  ! 1196: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01c9, %hpstate
	.word 0xc2d004a0  ! 1197: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r1
	.word 0x8d90284f  ! 1198: WRPR_PSTATE_I	wrpr	%r0, 0x084f, %pstate
	.word 0x87802010  ! 1199: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x8d90204f  ! 1200: WRPR_PSTATE_I	wrpr	%r0, 0x004f, %pstate
	.word 0x81982b55  ! 1201: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b55, %hpstate
	mov 0x34, %r30
	.word 0x8fd0001e  ! 1202: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x8d902a02  ! 1203: WRPR_PSTATE_I	wrpr	%r0, 0x0a02, %pstate
	.word 0x81494000  ! 1204: RDHPR_HTBA	rdhpr	%htba, %r0
	.word 0xc0dfe000  ! 1205: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r0
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x87802089  ! 1207: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x94816001  ! 1208: ADDcc_I	addcc 	%r5, 0x0001, %r10
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d902484  ! 1210: WRPR_PSTATE_I	wrpr	%r0, 0x0484, %pstate
DS_75:
	.word 0x20800001  ! 1212: BN	bn,a	<label_0x1>
	.word 0xc7316001  ! 1212: STQF_I	-	%f3, [0x0001, %r5]
	.word 0x9f458000  ! 1211: RD_SOFTINT_REG	rd	%softint, %r15
	.word 0x8d802000  ! 1212: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xde97e020  ! 1213: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r15
	ta	T_CHANGE_PRIV	! macro
	.word 0x81982892  ! 1215: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0892, %hpstate
	.word 0x8d902298  ! 1216: WRPR_PSTATE_I	wrpr	%r0, 0x0298, %pstate
	.word 0x8c810003  ! 1217: ADDcc_R	addcc 	%r4, %r3, %r6
	.word 0x87d02030  ! 1218: Tcc_I	tl	icc_or_xcc, %r0 + 48
	.word 0xcc880e40  ! 1219: LDUBA_R	lduba	[%r0, %r0] 0x72, %r6
	mov 0x35, %r30
	.word 0x91d0001e  ! 1220: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802088  ! 1221: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8d802000  ! 1222: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xccd804a0  ! 1223: LDXA_R	ldxa	[%r0, %r0] 0x25, %r6
	.word 0x8d902a04  ! 1224: WRPR_PSTATE_I	wrpr	%r0, 0x0a04, %pstate
	.word 0x81982410  ! 1225: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0410, %hpstate
	.word 0x8bd02032  ! 1226: Tcc_I	tcs	icc_or_xcc, %r0 + 50
	.word 0x94d0c007  ! 1227: UMULcc_R	umulcc 	%r3, %r7, %r10
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8e52000e  ! 1229: UMUL_R	umul 	%r8, %r14, %r7
	.word 0xce8008a0  ! 1230: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x8d90240c  ! 1231: WRPR_PSTATE_I	wrpr	%r0, 0x040c, %pstate
	.word 0xce800b60  ! 1232: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r7
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xcf37e001  ! 1234: STQF_I	-	%f7, [0x0001, %r31]
	.word 0x856ac00f  ! 1235: SDIVX_R	sdivx	%r11, %r15, %r2
	.word 0x8048400a  ! 1236: MULX_R	mulx 	%r1, %r10, %r0
	.word 0x8d9024d0  ! 1237: WRPR_PSTATE_I	wrpr	%r0, 0x04d0, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x22800001  ! 1239: BE	be,a	<label_0x1>
	mov 0x33, %r30
	.word 0x8fd0001e  ! 1240: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x8d902e4a  ! 1241: WRPR_PSTATE_I	wrpr	%r0, 0x0e4a, %pstate
	.word 0x819827c9  ! 1242: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07c9, %hpstate
	.word 0xc08008a0  ! 1243: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xc0cfe010  ! 1245: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r0
	.word 0xc0800ae0  ! 1246: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r0
	.word 0x9869c009  ! 1247: UDIVX_R	udivx 	%r7, %r9, %r12
	.word 0x816ac006  ! 1248: SDIVX_R	sdivx	%r11, %r6, %r0
	.word 0xc197e001  ! 1249: LDQFA_I	-	[%r31, 0x0001], %f0
	ta	T_CHANGE_NONPRIV	! macro
DS_76:
	.word 0x32800001  ! 1252: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x91b00300  ! 1251: ALLIGNADDRESS	alignaddr	%r0, %r0, %r8
	.word 0xd057c000  ! 1252: LDSH_R	ldsh	[%r31 + %r0], %r8
	.word 0x8f504000  ! 1253: RDPR_TNPC	rdpr	%tnpc, %r7
	.word 0x9b6be001  ! 1254: SDIVX_I	sdivx	%r15, 0x0001, %r13
	.word 0x32700001  ! 1255: BPNE	<illegal instruction>
	.word 0x8d9020c2  ! 1256: WRPR_PSTATE_I	wrpr	%r0, 0x00c2, %pstate
	.word 0x8d902255  ! 1257: WRPR_PSTATE_I	wrpr	%r0, 0x0255, %pstate
DS_77:
	.word 0x22800001  ! 1259: BE	be,a	<label_0x1>
	illtrap
	.word 0x93b34303  ! 1258: ALLIGNADDRESS	alignaddr	%r13, %r3, %r9
	.word 0x8550c000  ! 1259: RDPR_TT	rdpr	%tt, %r2
	.word 0x9da000c5  ! 1260: FNEGd	fnegd	%f36, %f14
	.word 0x8d902609  ! 1261: WRPR_PSTATE_I	wrpr	%r0, 0x0609, %pstate
	.word 0x2e800001  ! 1262: BVS	bvs,a	<label_0x1>
	.word 0x8198271c  ! 1263: WRHPR_HPSTATE_I	wrhpr	%r0, 0x071c, %hpstate
	.word 0x8d902241  ! 1264: WRPR_PSTATE_I	wrpr	%r0, 0x0241, %pstate
	.word 0x81982652  ! 1265: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0652, %hpstate
	mov 0x32, %r30
	.word 0x93d0001e  ! 1266: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xdc1fe001  ! 1267: LDD_I	ldd	[%r31 + 0x0001], %r14
	ta	T_CHANGE_PRIV	! macro
DS_78:
	.word 0x32800001  ! 1270: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x8fb1030f  ! 1269: ALLIGNADDRESS	alignaddr	%r4, %r15, %r7
	.word 0x8fa000c5  ! 1270: FNEGd	fnegd	%f36, %f38
	.word 0xce9004a0  ! 1271: LDUHA_R	lduha	[%r0, %r0] 0x25, %r7
	.word 0x9ba00565  ! 1272: FSQRTq	fsqrt	
	.word 0x8d902456  ! 1273: WRPR_PSTATE_I	wrpr	%r0, 0x0456, %pstate
	.word 0xda880e60  ! 1274: LDUBA_R	lduba	[%r0, %r0] 0x73, %r13
	.word 0x24700001  ! 1275: BPLE	<illegal instruction>
	.word 0x9ac0a001  ! 1276: ADDCcc_I	addccc 	%r2, 0x0001, %r13
	.word 0x836b800e  ! 1277: SDIVX_R	sdivx	%r14, %r14, %r1
	.word 0x87802004  ! 1278: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xc29004a0  ! 1279: LDUHA_R	lduha	[%r0, %r0] 0x25, %r1
	.word 0x8d902604  ! 1280: WRPR_PSTATE_I	wrpr	%r0, 0x0604, %pstate
	.word 0x8d902283  ! 1281: WRPR_PSTATE_I	wrpr	%r0, 0x0283, %pstate
	.word 0x967b0009  ! 1282: SDIV_R	sdiv 	%r12, %r9, %r11
	.word 0xd657e001  ! 1283: LDSH_I	ldsh	[%r31 + 0x0001], %r11
	.word 0x83a0056e  ! 1284: FSQRTq	fsqrt	
	.word 0x9fd02034  ! 1285: Tcc_I	tvc	icc_or_xcc, %r0 + 52
	.word 0x8d902c8b  ! 1286: WRPR_PSTATE_I	wrpr	%r0, 0x0c8b, %pstate
	.word 0x8d802004  ! 1287: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x9bd02035  ! 1288: Tcc_I	tcc	icc_or_xcc, %r0 + 53
	.word 0x8d90200f  ! 1289: WRPR_PSTATE_I	wrpr	%r0, 0x000f, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc29fe001  ! 1291: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r1
	.word 0x2e700001  ! 1292: BPVS	<illegal instruction>
	.word 0x8950c000  ! 1293: RDPR_TT	rdpr	%tt, %r4
DS_79:
	.word 0x34800001  ! 1295: BG	bg,a	<label_0x1>
	illtrap
	.word 0x97b3c306  ! 1294: ALLIGNADDRESS	alignaddr	%r15, %r6, %r11
	.word 0x88830000  ! 1295: ADDcc_R	addcc 	%r12, %r0, %r4
	.word 0x8803a001  ! 1296: ADD_I	add 	%r14, 0x0001, %r4
	.word 0x87802089  ! 1297: WRASI_I	wr	%r0, 0x0089, %asi
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x94832001  ! 1299: ADDcc_I	addcc 	%r12, 0x0001, %r10
DS_80:
	.word 0x34800001  ! 1301: BG	bg,a	<label_0x1>
	illtrap
	.word 0x93b0830a  ! 1300: ALLIGNADDRESS	alignaddr	%r2, %r10, %r9
	.word 0x82696001  ! 1301: UDIVX_I	udivx 	%r5, 0x0001, %r1
	.word 0x8ed30000  ! 1302: UMULcc_R	umulcc 	%r12, %r0, %r7
	.word 0x8d902a96  ! 1303: WRPR_PSTATE_I	wrpr	%r0, 0x0a96, %pstate
DS_81:
	.word 0x20800001  ! 1305: BN	bn,a	<label_0x1>
	illtrap
	.word 0x81b30306  ! 1304: ALLIGNADDRESS	alignaddr	%r12, %r6, %r0
DS_82:
	.word 0x32800001  ! 1306: BNE	bne,a	<label_0x1>
	.word 0xdd318004  ! 1306: STQF_R	-	%f14, [%r4, %r6]
	.word 0x8b458000  ! 1305: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0xca1fc000  ! 1306: LDD_R	ldd	[%r31 + %r0], %r5
	.word 0x96d36001  ! 1307: UMULcc_I	umulcc 	%r13, 0x0001, %r11
	.word 0x99508000  ! 1308: RDPR_TSTATE	rdpr	%tstate, %r12
	.word 0xd837c004  ! 1309: STH_R	sth	%r12, [%r31 + %r4]
	.word 0x81982c97  ! 1310: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c97, %hpstate
	.word 0x8d902c82  ! 1311: WRPR_PSTATE_I	wrpr	%r0, 0x0c82, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81982001  ! 1313: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0001, %hpstate
DS_83:
	.word 0x22800001  ! 1315: BE	be,a	<label_0x1>
	illtrap
	.word 0x95b0c30d  ! 1314: ALLIGNADDRESS	alignaddr	%r3, %r13, %r10
	ta	T_CHANGE_PRIV	! macro
	.word 0x8bd02033  ! 1316: Tcc_I	tcs	icc_or_xcc, %r0 + 51
	.word 0x90d36001  ! 1317: UMULcc_I	umulcc 	%r13, 0x0001, %r8
	.word 0xd047e001  ! 1318: LDSW_I	ldsw	[%r31 + 0x0001], %r8
	.word 0x81982c1e  ! 1319: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c1e, %hpstate
	.word 0x9e68a001  ! 1320: UDIVX_I	udivx 	%r2, 0x0001, %r15
	.word 0x99d02031  ! 1321: Tcc_I	tgu	icc_or_xcc, %r0 + 49
	mov 0x33, %r30
	.word 0x9fd0001e  ! 1322: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0xde2fe001  ! 1323: STB_I	stb	%r15, [%r31 + 0x0001]
	.word 0xdebfe001  ! 1324: STDA_I	stda	%r15, [%r31 + 0x0001] %asi
	.word 0x38800001  ! 1325: BGU	bgu,a	<label_0x1>
	.word 0x9fa04d25  ! 1326: FsMULd	fsmuld	%f1, %f36, %f46
	.word 0x8d902645  ! 1327: WRPR_PSTATE_I	wrpr	%r0, 0x0645, %pstate
	.word 0x87802010  ! 1328: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x946ba001  ! 1329: UDIVX_I	udivx 	%r14, 0x0001, %r10
	.word 0x8d902a4c  ! 1330: WRPR_PSTATE_I	wrpr	%r0, 0x0a4c, %pstate
	.word 0x8d902088  ! 1331: WRPR_PSTATE_I	wrpr	%r0, 0x0088, %pstate
	.word 0x8fa00548  ! 1332: FSQRTd	fsqrt	
	.word 0x9478400d  ! 1333: SDIV_R	sdiv 	%r1, %r13, %r10
	.word 0x91d02033  ! 1334: Tcc_I	ta	icc_or_xcc, %r0 + 51
	mov 0x35, %r30
	.word 0x83d0001e  ! 1335: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8198260e  ! 1336: WRHPR_HPSTATE_I	wrhpr	%r0, 0x060e, %hpstate
	.word 0x8203a001  ! 1337: ADD_I	add 	%r14, 0x0001, %r1
	.word 0x85d02034  ! 1338: Tcc_I	tle	icc_or_xcc, %r0 + 52
DS_84:
	.word 0x22800001  ! 1340: BE	be,a	<label_0x1>
	.word 0xd931e001  ! 1340: STQF_I	-	%f12, [0x0001, %r7]
	.word 0x99458000  ! 1339: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0xd88fe020  ! 1340: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r12
	.word 0x85a00568  ! 1341: FSQRTq	fsqrt	
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902805  ! 1343: WRPR_PSTATE_I	wrpr	%r0, 0x0805, %pstate
	.word 0x9e012001  ! 1344: ADD_I	add 	%r4, 0x0001, %r15
	.word 0x85d02033  ! 1345: Tcc_I	tle	icc_or_xcc, %r0 + 51
DS_85:
	.word 0x32800001  ! 1347: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x87b24309  ! 1346: ALLIGNADDRESS	alignaddr	%r9, %r9, %r3
	.word 0x8d902051  ! 1347: WRPR_PSTATE_I	wrpr	%r0, 0x0051, %pstate
	.word 0x81982e8e  ! 1348: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e8e, %hpstate
DS_86:
	.word 0x32800001  ! 1350: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x95b24308  ! 1349: ALLIGNADDRESS	alignaddr	%r9, %r8, %r10
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x32800001  ! 1352: BNE	bne,a	<label_0x1>
	.word 0x97d02033  ! 1353: Tcc_I	tge	icc_or_xcc, %r0 + 51
	.word 0x86d2800f  ! 1354: UMULcc_R	umulcc 	%r10, %r15, %r3
	.word 0x9bd02034  ! 1355: Tcc_I	tcc	icc_or_xcc, %r0 + 52
	.word 0xc737e001  ! 1356: STQF_I	-	%f3, [0x0001, %r31]
	.word 0x9ada0008  ! 1357: SMULcc_R	smulcc 	%r8, %r8, %r13
	.word 0x8468a001  ! 1358: UDIVX_I	udivx 	%r2, 0x0001, %r2
	.word 0x8ad3a001  ! 1359: UMULcc_I	umulcc 	%r14, 0x0001, %r5
	.word 0x8198225e  ! 1360: WRHPR_HPSTATE_I	wrhpr	%r0, 0x025e, %hpstate
	.word 0x95d02034  ! 1361: Tcc_I	tg	icc_or_xcc, %r0 + 52
	mov 0x33, %r30
	.word 0x8bd0001e  ! 1362: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	mov 0x32, %r30
	.word 0x87d0001e  ! 1363: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x946a000a  ! 1364: UDIVX_R	udivx 	%r8, %r10, %r10
	.word 0x3a700001  ! 1365: BPCC	<illegal instruction>
	.word 0x8d802000  ! 1366: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8ba01a65  ! 1367: FqTOi	fqtoi	
	.word 0x85a000c3  ! 1368: FNEGd	fnegd	%f34, %f2
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc48008a0  ! 1371: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0xc4c00e80  ! 1372: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r2
	.word 0x8c480003  ! 1373: MULX_R	mulx 	%r0, %r3, %r6
DS_87:
	.word 0x22800001  ! 1375: BE	be,a	<label_0x1>
	.word 0xcf31c000  ! 1375: STQF_R	-	%f7, [%r0, %r7]
	.word 0x8f458000  ! 1374: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0x8bd02035  ! 1375: Tcc_I	tcs	icc_or_xcc, %r0 + 53
	.word 0x819825d8  ! 1376: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05d8, %hpstate
	.word 0x36700001  ! 1377: BPGE	<illegal instruction>
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87802089  ! 1380: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x81982899  ! 1381: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0899, %hpstate
	.word 0xcecfe010  ! 1382: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r7
	.word 0x9f50c000  ! 1383: RDPR_TT	rdpr	%tt, %r15
	.word 0xde1fe001  ! 1384: LDD_I	ldd	[%r31 + 0x0001], %r15
	.word 0x93a0054c  ! 1385: FSQRTd	fsqrt	
DS_88:
	.word 0x34800001  ! 1387: BG	bg,a	<label_0x1>
	.word 0xc133a001  ! 1387: STQF_I	-	%f0, [0x0001, %r14]
	.word 0x9b458000  ! 1386: RD_SOFTINT_REG	rd	%softint, %r13
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x98496001  ! 1388: MULX_I	mulx 	%r5, 0x0001, %r12
	.word 0xd8c004a0  ! 1389: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r12
	.word 0x8d9028dc  ! 1390: WRPR_PSTATE_I	wrpr	%r0, 0x08dc, %pstate
	.word 0x8d902657  ! 1391: WRPR_PSTATE_I	wrpr	%r0, 0x0657, %pstate
	.word 0xd88008a0  ! 1392: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0xd937c00c  ! 1393: STQF_R	-	%f12, [%r12, %r31]
	.word 0x9678a001  ! 1394: SDIV_I	sdiv 	%r2, 0x0001, %r11
	.word 0xd73fc00c  ! 1395: STDF_R	std	%f11, [%r12, %r31]
	.word 0xd6ffc02c  ! 1396: SWAPA_R	swapa	%r11, [%r31 + %r12] 0x01
	.word 0x98db8004  ! 1397: SMULcc_R	smulcc 	%r14, %r4, %r12
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd8880e40  ! 1399: LDUBA_R	lduba	[%r0, %r0] 0x72, %r12
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f504000  ! 1401: RDPR_TNPC	rdpr	%tnpc, %r7
	.word 0x8198221b  ! 1402: WRHPR_HPSTATE_I	wrhpr	%r0, 0x021b, %hpstate
	.word 0x819827c2  ! 1403: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07c2, %hpstate
	.word 0x8d902e0e  ! 1404: WRPR_PSTATE_I	wrpr	%r0, 0x0e0e, %pstate
	.word 0xce8fe020  ! 1405: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r7
	.word 0x86d3e001  ! 1406: UMULcc_I	umulcc 	%r15, 0x0001, %r3
	.word 0x8d902601  ! 1407: WRPR_PSTATE_I	wrpr	%r0, 0x0601, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x89a01a69  ! 1409: FqTOi	fqtoi	
	.word 0x32700001  ! 1410: BPNE	<illegal instruction>
	mov 0x31, %r30
	.word 0x8dd0001e  ! 1411: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x8a782001  ! 1412: SDIV_I	sdiv 	%r0, 0x0001, %r5
	.word 0x81982a4e  ! 1413: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a4e, %hpstate
	.word 0x94786001  ! 1414: SDIV_I	sdiv 	%r1, 0x0001, %r10
	.word 0xd537c009  ! 1415: STQF_R	-	%f10, [%r9, %r31]
DS_89:
	.word 0x20800001  ! 1417: BN	bn,a	<label_0x1>
	illtrap
	.word 0x87b14300  ! 1416: ALLIGNADDRESS	alignaddr	%r5, %r0, %r3
	.word 0x9c828006  ! 1417: ADDcc_R	addcc 	%r10, %r6, %r14
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d902048  ! 1419: WRPR_PSTATE_I	wrpr	%r0, 0x0048, %pstate
	.word 0x944b800a  ! 1420: MULX_R	mulx 	%r14, %r10, %r10
	.word 0x8c02e001  ! 1421: ADD_I	add 	%r11, 0x0001, %r6
	.word 0x86d34006  ! 1422: UMULcc_R	umulcc 	%r13, %r6, %r3
DS_90:
	.word 0x32800001  ! 1424: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x99b1c30c  ! 1423: ALLIGNADDRESS	alignaddr	%r7, %r12, %r12
	.word 0xd88008a0  ! 1424: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0xd937e001  ! 1425: STQF_I	-	%f12, [0x0001, %r31]
	.word 0xd8c804a0  ! 1426: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
	.word 0x81982150  ! 1427: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0150, %hpstate
	.word 0x9da1c9eb  ! 1428: FDIVq	dis not found

	.word 0xdc5fe001  ! 1429: LDX_I	ldx	[%r31 + 0x0001], %r14
	.word 0x81982b5b  ! 1430: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b5b, %hpstate
	.word 0x81982503  ! 1431: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0503, %hpstate
	.word 0x819826de  ! 1432: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06de, %hpstate
	.word 0x89514000  ! 1433: RDPR_TBA	rdpr	%tba, %r4
	.word 0xc937e001  ! 1434: STQF_I	-	%f4, [0x0001, %r31]
	.word 0xc88008a0  ! 1435: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
	.word 0x8d902484  ! 1436: WRPR_PSTATE_I	wrpr	%r0, 0x0484, %pstate
	.word 0x95500000  ! 1437: RDPR_TPC	rdpr	%tpc, %r10
	.word 0x32700001  ! 1438: BPNE	<illegal instruction>
	.word 0x8d902c1c  ! 1439: WRPR_PSTATE_I	wrpr	%r0, 0x0c1c, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x826aa001  ! 1441: UDIVX_I	udivx 	%r10, 0x0001, %r1
	.word 0x3a800001  ! 1442: BCC	bcc,a	<label_0x1>
	ta	T_CHANGE_PRIV	! macro
	.word 0x81982714  ! 1444: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0714, %hpstate
	.word 0xc327c00b  ! 1445: STF_R	st	%f1, [%r11, %r31]
	.word 0x8fa209a6  ! 1446: FDIVs	fdivs	%f8, %f6, %f7
	mov 0x35, %r30
	.word 0x97d0001e  ! 1447: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x81982191  ! 1448: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0191, %hpstate
	mov 0x34, %r30
	.word 0x9dd0001e  ! 1449: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x91500000  ! 1450: RDPR_TPC	rdpr	%tpc, %r8
DS_91:
	.word 0x20800001  ! 1452: BN	bn,a	<label_0x1>
	.word 0xd9312001  ! 1452: STQF_I	-	%f12, [0x0001, %r4]
	.word 0x83458000  ! 1451: RD_SOFTINT_REG	rd	%softint, %r1
	.word 0x8ec2a001  ! 1452: ADDCcc_I	addccc 	%r10, 0x0001, %r7
	ta	T_CHANGE_PRIV	! macro
	.word 0xcf27c006  ! 1454: STF_R	st	%f7, [%r6, %r31]
	.word 0x87802089  ! 1455: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x81982640  ! 1456: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0640, %hpstate
	.word 0x95d02034  ! 1457: Tcc_I	tg	icc_or_xcc, %r0 + 52
	.word 0x87d02031  ! 1458: Tcc_I	tl	icc_or_xcc, %r0 + 49
	.word 0xce2fc006  ! 1459: STB_R	stb	%r7, [%r31 + %r6]
	.word 0xce8008a0  ! 1460: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x81982853  ! 1461: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0853, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xce8008a0  ! 1463: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x8d902cd3  ! 1464: WRPR_PSTATE_I	wrpr	%r0, 0x0cd3, %pstate
DS_92:
	.word 0x32800001  ! 1466: BNE	bne,a	<label_0x1>
	.word 0xd3332001  ! 1466: STQF_I	-	%f9, [0x0001, %r12]
	.word 0x95458000  ! 1465: RD_SOFTINT_REG	rd	%softint, %r10
	ta	T_CHANGE_PRIV	! macro
	.word 0x22700001  ! 1467: BPE	<illegal instruction>
	.word 0x8d902491  ! 1468: WRPR_PSTATE_I	wrpr	%r0, 0x0491, %pstate
	.word 0x9f514000  ! 1469: RDPR_TBA	rdpr	%tba, %r15
	.word 0x8480000e  ! 1470: ADDcc_R	addcc 	%r0, %r14, %r2
	.word 0x9f6ba001  ! 1471: SDIVX_I	sdivx	%r14, 0x0001, %r15
	.word 0x9a818008  ! 1472: ADDcc_R	addcc 	%r6, %r8, %r13
	.word 0x9e81c00b  ! 1473: ADDcc_R	addcc 	%r7, %r11, %r15
	.word 0x84d2c00a  ! 1474: UMULcc_R	umulcc 	%r11, %r10, %r2
	.word 0x93500000  ! 1475: RDPR_TPC	rdpr	%tpc, %r9
	.word 0x91d02031  ! 1476: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xd28008a0  ! 1477: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x81a349af  ! 1478: FDIVs	fdivs	%f13, %f15, %f0
	.word 0x81982ac9  ! 1479: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ac9, %hpstate
	.word 0x32700001  ! 1480: BPNE	<illegal instruction>
	.word 0x81982c8b  ! 1481: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c8b, %hpstate
	.word 0x8a796001  ! 1482: SDIV_I	sdiv 	%r5, 0x0001, %r5
	.word 0xcac7e000  ! 1483: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r5
	.word 0x8d9022d5  ! 1484: WRPR_PSTATE_I	wrpr	%r0, 0x02d5, %pstate
	.word 0x8d902842  ! 1485: WRPR_PSTATE_I	wrpr	%r0, 0x0842, %pstate
	.word 0x2a700001  ! 1486: BPCS	<illegal instruction>
	mov 0x33, %r30
	.word 0x83d0001e  ! 1487: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x81982982  ! 1488: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0982, %hpstate
	.word 0x9482400d  ! 1489: ADDcc_R	addcc 	%r9, %r13, %r10
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d802004  ! 1491: WRFPRS_I	wr	%r0, 0x0004, %fprs
	ta	T_CHANGE_PRIV	! macro
	.word 0x34700001  ! 1493: BPG	<illegal instruction>
	.word 0x819823da  ! 1494: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03da, %hpstate
DS_93:
	.word 0x20800001  ! 1496: BN	bn,a	<label_0x1>
	illtrap
	.word 0x8db1030a  ! 1495: ALLIGNADDRESS	alignaddr	%r4, %r10, %r6
	.word 0xcccfe000  ! 1496: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r6
	.word 0x896ac00c  ! 1497: SDIVX_R	sdivx	%r11, %r12, %r4
	.word 0x8d902203  ! 1498: WRPR_PSTATE_I	wrpr	%r0, 0x0203, %pstate
	.word 0xc85fc000  ! 1499: LDX_R	ldx	[%r31 + %r0], %r4
	.word 0xc8d004a0  ! 1500: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r4
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d9024ce  ! 1502: WRPR_PSTATE_I	wrpr	%r0, 0x04ce, %pstate
	.word 0xc897e010  ! 1503: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r4
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc9e7c02c  ! 1505: CASA_I	casa	[%r31] 0x 1, %r12, %r4
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d802004  ! 1507: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xc8cfe010  ! 1508: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r4
	.word 0x8d802004  ! 1509: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x87802004  ! 1510: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87514000  ! 1511: RDPR_TBA	rdpr	%tba, %r3
	.word 0x8ba00561  ! 1512: FSQRTq	fsqrt	
	.word 0x81982792  ! 1513: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0792, %hpstate
	.word 0x8d902e96  ! 1514: WRPR_PSTATE_I	wrpr	%r0, 0x0e96, %pstate
	.word 0x8551c000  ! 1515: RDPR_TL	rdpr	%tl, %r2
	.word 0x819820c1  ! 1516: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00c1, %hpstate
	.word 0xc437c001  ! 1517: STH_R	sth	%r2, [%r31 + %r1]
	.word 0x956b0001  ! 1518: SDIVX_R	sdivx	%r12, %r1, %r10
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d802004  ! 1520: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x87802014  ! 1521: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x87d02035  ! 1522: Tcc_I	tl	icc_or_xcc, %r0 + 53
	.word 0x87d02031  ! 1523: Tcc_I	tl	icc_or_xcc, %r0 + 49
	.word 0x3c800001  ! 1524: BPOS	bpos,a	<label_0x1>
	.word 0xd48008a0  ! 1525: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xd48804a0  ! 1526: LDUBA_R	lduba	[%r0, %r0] 0x25, %r10
	.word 0x81982097  ! 1527: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0097, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9669e001  ! 1530: UDIVX_I	udivx 	%r7, 0x0001, %r11
	.word 0xd65fe001  ! 1531: LDX_I	ldx	[%r31 + 0x0001], %r11
	.word 0xd6d004a0  ! 1532: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r11
	.word 0x93d02030  ! 1533: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0xd68008a0  ! 1534: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
DS_94:
	.word 0x32800001  ! 1536: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x97b0030c  ! 1535: ALLIGNADDRESS	alignaddr	%r0, %r12, %r11
	.word 0x9a796001  ! 1536: SDIV_I	sdiv 	%r5, 0x0001, %r13
	.word 0x87802016  ! 1537: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xda8008a0  ! 1538: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x81982c19  ! 1539: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c19, %hpstate
	.word 0x81982318  ! 1540: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0318, %hpstate
	.word 0xda3fe001  ! 1541: STD_I	std	%r13, [%r31 + 0x0001]
	.word 0x8d902c49  ! 1542: WRPR_PSTATE_I	wrpr	%r0, 0x0c49, %pstate
	mov 0x30, %r30
	.word 0x8bd0001e  ! 1543: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	mov 0x35, %r30
	.word 0x99d0001e  ! 1544: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0xdbe7c02c  ! 1546: CASA_I	casa	[%r31] 0x 1, %r12, %r13
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x87802089  ! 1548: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xda27c00c  ! 1549: STW_R	stw	%r13, [%r31 + %r12]
	.word 0x96534007  ! 1550: UMUL_R	umul 	%r13, %r7, %r11
	.word 0x97d02030  ! 1551: Tcc_I	tge	icc_or_xcc, %r0 + 48
	.word 0xd65fc000  ! 1552: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xd6800aa0  ! 1553: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r11
	ta	T_CHANGE_HPRIV	! macro
	mov 0x30, %r30
	.word 0x85d0001e  ! 1555: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x87802016  ! 1556: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8fd02031  ! 1557: Tcc_I	tvs	icc_or_xcc, %r0 + 49
	.word 0x24700001  ! 1558: BPLE	<illegal instruction>
	.word 0x9269000a  ! 1559: UDIVX_R	udivx 	%r4, %r10, %r9
	.word 0x8d902e41  ! 1560: WRPR_PSTATE_I	wrpr	%r0, 0x0e41, %pstate
	.word 0x81982b45  ! 1561: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b45, %hpstate
	.word 0xd2d004a0  ! 1562: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r9
	.word 0xd277c00a  ! 1563: STX_R	stx	%r9, [%r31 + %r10]
	.word 0x20700001  ! 1564: BPN	<illegal instruction>
	mov 0x30, %r30
	.word 0x87d0001e  ! 1565: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x9c832001  ! 1566: ADDcc_I	addcc 	%r12, 0x0001, %r14
	.word 0x9e828002  ! 1567: ADDcc_R	addcc 	%r10, %r2, %r15
	.word 0x8fa3cd24  ! 1568: FsMULd	fsmuld	%f15, %f4, %f38
	.word 0x8ac2a001  ! 1569: ADDCcc_I	addccc 	%r10, 0x0001, %r5
	.word 0x82d06001  ! 1570: UMULcc_I	umulcc 	%r1, 0x0001, %r1
	.word 0x8ba0054d  ! 1571: FSQRTd	fsqrt	
	.word 0x9ba00560  ! 1572: FSQRTq	fsqrt	
	.word 0x8d902edf  ! 1573: WRPR_PSTATE_I	wrpr	%r0, 0x0edf, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9dd02033  ! 1575: Tcc_I	tpos	icc_or_xcc, %r0 + 51
	.word 0x8198284c  ! 1576: WRHPR_HPSTATE_I	wrhpr	%r0, 0x084c, %hpstate
	.word 0xdbe7c020  ! 1577: CASA_I	casa	[%r31] 0x 1, %r0, %r13
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9e82a001  ! 1579: ADDcc_I	addcc 	%r10, 0x0001, %r15
DS_95:
	.word 0x34800001  ! 1581: BG	bg,a	<label_0x1>
	.word 0xd5306001  ! 1581: STQF_I	-	%f10, [0x0001, %r1]
	.word 0x95458000  ! 1580: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0xd47fe001  ! 1581: SWAP_I	swap	%r10, [%r31 + 0x0001]
	.word 0xd5e7c020  ! 1582: CASA_I	casa	[%r31] 0x 1, %r0, %r10
	.word 0xd437e001  ! 1583: STH_I	sth	%r10, [%r31 + 0x0001]
	.word 0x83a209a2  ! 1584: FDIVs	fdivs	%f8, %f2, %f1
	.word 0x81982751  ! 1585: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0751, %hpstate
	.word 0x85d02035  ! 1586: Tcc_I	tle	icc_or_xcc, %r0 + 53
	.word 0x81982400  ! 1587: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0400, %hpstate
DS_96:
	.word 0x20800001  ! 1589: BN	bn,a	<label_0x1>
	.word 0xd7330005  ! 1589: STQF_R	-	%f11, [%r5, %r12]
	.word 0x8f458000  ! 1588: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0x8d9028c7  ! 1589: WRPR_PSTATE_I	wrpr	%r0, 0x08c7, %pstate
	.word 0x8d802000  ! 1590: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8a692001  ! 1591: UDIVX_I	udivx 	%r4, 0x0001, %r5
DS_97:
	.word 0x22800001  ! 1593: BE	be,a	<label_0x1>
	illtrap
	.word 0x87b34301  ! 1592: ALLIGNADDRESS	alignaddr	%r13, %r1, %r3
	.word 0x9bd02033  ! 1593: Tcc_I	tcc	icc_or_xcc, %r0 + 51
	.word 0x8ba389cb  ! 1594: FDIVd	fdivd	%f14, %f42, %f36
	.word 0x8d9022cc  ! 1595: WRPR_PSTATE_I	wrpr	%r0, 0x02cc, %pstate
	.word 0x81982496  ! 1596: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0496, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	mov 0x35, %r30
	.word 0x93d0001e  ! 1598: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x81982a5f  ! 1599: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a5f, %hpstate
	.word 0x8d9022dd  ! 1600: WRPR_PSTATE_I	wrpr	%r0, 0x02dd, %pstate
	.word 0x8d802000  ! 1601: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_98:
	.word 0x22800001  ! 1603: BE	be,a	<label_0x1>
	.word 0xd3308005  ! 1603: STQF_R	-	%f9, [%r5, %r2]
	.word 0x87458000  ! 1602: RD_SOFTINT_REG	rd	%softint, %r3
	.word 0xc6c804a0  ! 1603: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r3
	.word 0x38700001  ! 1604: BPGU	<illegal instruction>
	.word 0x8edb8003  ! 1605: SMULcc_R	smulcc 	%r14, %r3, %r7
	.word 0x28800001  ! 1606: BLEU	bleu,a	<label_0x1>
	mov 0x32, %r30
	.word 0x85d0001e  ! 1607: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xcf37e001  ! 1609: STQF_I	-	%f7, [0x0001, %r31]
	.word 0x83a1cdcf  ! 1610: FdMULq	fdmulq	
	.word 0x8d902a9e  ! 1611: WRPR_PSTATE_I	wrpr	%r0, 0x0a9e, %pstate
	.word 0x87508000  ! 1612: RDPR_TSTATE	rdpr	%tstate, %r3
	.word 0x94d84006  ! 1613: SMULcc_R	smulcc 	%r1, %r6, %r10
	.word 0x8d902ad5  ! 1614: WRPR_PSTATE_I	wrpr	%r0, 0x0ad5, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0xd4800ae0  ! 1618: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r10
	.word 0xd537c006  ! 1619: STQF_R	-	%f10, [%r6, %r31]
	.word 0x82c36001  ! 1620: ADDCcc_I	addccc 	%r13, 0x0001, %r1
	.word 0x8d9028d3  ! 1621: WRPR_PSTATE_I	wrpr	%r0, 0x08d3, %pstate
	.word 0xc29fc020  ! 1622: LDDA_R	ldda	[%r31, %r0] 0x01, %r1
	.word 0x81982e98  ! 1623: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e98, %hpstate
	.word 0x26700001  ! 1624: BPL	<illegal instruction>
	.word 0xc21fc000  ! 1625: LDD_R	ldd	[%r31 + %r0], %r1
	.word 0xc207e001  ! 1626: LDUW_I	lduw	[%r31 + 0x0001], %r1
	.word 0x87500000  ! 1627: RDPR_TPC	rdpr	%tpc, %r3
	.word 0x22700001  ! 1628: BPE	<illegal instruction>
	.word 0x8f504000  ! 1629: RDPR_TNPC	rdpr	%tnpc, %r7
	.word 0x80528000  ! 1630: UMUL_R	umul 	%r10, %r0, %r0
	.word 0x85a2c9ac  ! 1631: FDIVs	fdivs	%f11, %f12, %f2
	.word 0xc437c00c  ! 1632: STH_R	sth	%r2, [%r31 + %r12]
	.word 0x8ba0c9aa  ! 1633: FDIVs	fdivs	%f3, %f10, %f5
	ta	T_CHANGE_HPRIV	! macro
	.word 0xca9004a0  ! 1635: LDUHA_R	lduha	[%r0, %r0] 0x25, %r5
	.word 0xca7fe001  ! 1636: SWAP_I	swap	%r5, [%r31 + 0x0001]
	.word 0x8d802000  ! 1637: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x98832001  ! 1638: ADDcc_I	addcc 	%r12, 0x0001, %r12
	.word 0xd927e001  ! 1639: STF_I	st	%f12, [0x0001, %r31]
	.word 0x8d902c15  ! 1640: WRPR_PSTATE_I	wrpr	%r0, 0x0c15, %pstate
	.word 0xd927c00a  ! 1641: STF_R	st	%f12, [%r10, %r31]
	ta	T_CHANGE_PRIV	! macro
	.word 0x819825dc  ! 1643: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05dc, %hpstate
	.word 0x8d902893  ! 1644: WRPR_PSTATE_I	wrpr	%r0, 0x0893, %pstate
	.word 0x8d902c53  ! 1645: WRPR_PSTATE_I	wrpr	%r0, 0x0c53, %pstate
	.word 0x9751c000  ! 1646: RDPR_TL	rdpr	%tl, %r11
	.word 0x9081400e  ! 1647: ADDcc_R	addcc 	%r5, %r14, %r8
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x9fa34dce  ! 1649: FdMULq	fdmulq	
	.word 0x87802089  ! 1650: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8d802000  ! 1651: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d902287  ! 1652: WRPR_PSTATE_I	wrpr	%r0, 0x0287, %pstate
	.word 0x99514000  ! 1653: RDPR_TBA	rdpr	%tba, %r12
	.word 0xd937e001  ! 1654: STQF_I	-	%f12, [0x0001, %r31]
	.word 0x8d902cd8  ! 1655: WRPR_PSTATE_I	wrpr	%r0, 0x0cd8, %pstate
	.word 0xd857c000  ! 1656: LDSH_R	ldsh	[%r31 + %r0], %r12
	.word 0x8d9028c3  ! 1657: WRPR_PSTATE_I	wrpr	%r0, 0x08c3, %pstate
	.word 0xd93fe001  ! 1658: STDF_I	std	%f12, [0x0001, %r31]
	.word 0x81982442  ! 1659: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0442, %hpstate
	.word 0x966b0004  ! 1660: UDIVX_R	udivx 	%r12, %r4, %r11
	.word 0x85d02031  ! 1661: Tcc_I	tle	icc_or_xcc, %r0 + 49
	mov 0x32, %r30
	.word 0x87d0001e  ! 1662: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x26700001  ! 1664: BPL	<illegal instruction>
	.word 0x81982245  ! 1665: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0245, %hpstate
	.word 0xd69004a0  ! 1666: LDUHA_R	lduha	[%r0, %r0] 0x25, %r11
	.word 0x9c488002  ! 1667: MULX_R	mulx 	%r2, %r2, %r14
	.word 0x8d902a42  ! 1668: WRPR_PSTATE_I	wrpr	%r0, 0x0a42, %pstate
	.word 0x8d902418  ! 1669: WRPR_PSTATE_I	wrpr	%r0, 0x0418, %pstate
	.word 0xdcc80e60  ! 1670: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r14
	.word 0xdc47e001  ! 1671: LDSW_I	ldsw	[%r31 + 0x0001], %r14
	.word 0x91d02030  ! 1672: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x8d90268d  ! 1673: WRPR_PSTATE_I	wrpr	%r0, 0x068d, %pstate
	.word 0x8e822001  ! 1674: ADDcc_I	addcc 	%r8, 0x0001, %r7
	.word 0x819821cb  ! 1675: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01cb, %hpstate
	.word 0x94c36001  ! 1676: ADDCcc_I	addccc 	%r13, 0x0001, %r10
	.word 0x9dd02031  ! 1677: Tcc_I	tpos	icc_or_xcc, %r0 + 49
DS_99:
	.word 0x22800001  ! 1679: BE	be,a	<label_0x1>
	illtrap
	.word 0x8fb3830e  ! 1678: ALLIGNADDRESS	alignaddr	%r14, %r14, %r7
	.word 0x9e6b400d  ! 1679: UDIVX_R	udivx 	%r13, %r13, %r15
	.word 0x92804001  ! 1680: ADDcc_R	addcc 	%r1, %r1, %r9
	mov 0x33, %r30
	.word 0x85d0001e  ! 1681: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x8d802004  ! 1682: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8f6b8008  ! 1683: SDIVX_R	sdivx	%r14, %r8, %r7
DS_100:
	.word 0x22800001  ! 1685: BE	be,a	<label_0x1>
	illtrap
	.word 0x95b1c30f  ! 1684: ALLIGNADDRESS	alignaddr	%r7, %r15, %r10
	.word 0x986aa001  ! 1685: UDIVX_I	udivx 	%r10, 0x0001, %r12
	.word 0x8a51800e  ! 1686: UMUL_R	umul 	%r6, %r14, %r5
	.word 0xca800a80  ! 1687: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r5
	.word 0x819829c6  ! 1688: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c6, %hpstate
	.word 0x8d90228b  ! 1689: WRPR_PSTATE_I	wrpr	%r0, 0x028b, %pstate
	.word 0xcbe7c02e  ! 1690: CASA_I	casa	[%r31] 0x 1, %r14, %r5
	.word 0x81982dca  ! 1691: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dca, %hpstate
	.word 0xca800ba0  ! 1692: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r5
	.word 0xcacfe010  ! 1693: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r5
	ta	T_CHANGE_PRIV	! macro
	.word 0xcad00e40  ! 1695: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r5
	.word 0x91a349a6  ! 1696: FDIVs	fdivs	%f13, %f6, %f8
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x96d32001  ! 1698: UMULcc_I	umulcc 	%r12, 0x0001, %r11
	.word 0x94d16001  ! 1699: UMULcc_I	umulcc 	%r5, 0x0001, %r10
	.word 0x38700001  ! 1700: BPGU	<illegal instruction>
	.word 0x94690005  ! 1701: UDIVX_R	udivx 	%r4, %r5, %r10
	.word 0xd457c000  ! 1702: LDSH_R	ldsh	[%r31 + %r0], %r10
	.word 0xd47fe001  ! 1703: SWAP_I	swap	%r10, [%r31 + 0x0001]
	.word 0x87802088  ! 1704: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8b688004  ! 1705: SDIVX_R	sdivx	%r2, %r4, %r5
	.word 0x81982589  ! 1706: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0589, %hpstate
	.word 0x81508000  ! 1707: RDPR_TSTATE	rdpr	%tstate, %r0
	mov 0x31, %r30
	.word 0x9dd0001e  ! 1708: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x8e016001  ! 1709: ADD_I	add 	%r5, 0x0001, %r7
	.word 0xce2fe001  ! 1710: STB_I	stb	%r7, [%r31 + 0x0001]
	.word 0x97a01a68  ! 1711: FqTOi	fqtoi	
DS_101:
	.word 0x34800001  ! 1713: BG	bg,a	<label_0x1>
	illtrap
	.word 0x83b00305  ! 1712: ALLIGNADDRESS	alignaddr	%r0, %r5, %r1
	.word 0xc28008a0  ! 1713: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0xc2800c00  ! 1714: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r1
	.word 0x8d902a1a  ! 1715: WRPR_PSTATE_I	wrpr	%r0, 0x0a1a, %pstate
	.word 0x87802004  ! 1716: WRASI_I	wr	%r0, 0x0004, %asi
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81982911  ! 1718: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0911, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x819827c5  ! 1720: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07c5, %hpstate
	.word 0x81982551  ! 1721: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0551, %hpstate
	.word 0xc28008a0  ! 1722: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	ta	T_CHANGE_PRIV	! macro
	.word 0x81982594  ! 1724: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0594, %hpstate
	.word 0x886b8001  ! 1725: UDIVX_R	udivx 	%r14, %r1, %r4
	.word 0x81982814  ! 1726: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0814, %hpstate
	.word 0xc9e7c021  ! 1727: CASA_I	casa	[%r31] 0x 1, %r1, %r4
	.word 0xc83fc001  ! 1728: STD_R	std	%r4, [%r31 + %r1]
	.word 0x8ac1e001  ! 1729: ADDCcc_I	addccc 	%r7, 0x0001, %r5
	.word 0x95d02034  ! 1730: Tcc_I	tg	icc_or_xcc, %r0 + 52
	.word 0xcac7e000  ! 1731: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r5
	.word 0xca8fe020  ! 1732: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r5
	.word 0x8dd02032  ! 1733: Tcc_I	tneg	icc_or_xcc, %r0 + 50
	.word 0x81982f05  ! 1734: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f05, %hpstate
	.word 0xcb37c001  ! 1735: STQF_R	-	%f5, [%r1, %r31]
	.word 0x8801e001  ! 1736: ADD_I	add 	%r7, 0x0001, %r4
	.word 0x9851800d  ! 1737: UMUL_R	umul 	%r6, %r13, %r12
	mov 0x32, %r30
	.word 0x85d0001e  ! 1738: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x8d802004  ! 1739: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd897e010  ! 1740: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r12
	mov 0x31, %r30
	.word 0x9bd0001e  ! 1741: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x8d802004  ! 1742: WRFPRS_I	wr	%r0, 0x0004, %fprs
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81982a5d  ! 1744: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a5d, %hpstate
	.word 0x89694004  ! 1745: SDIVX_R	sdivx	%r5, %r4, %r4
	.word 0x8fa00540  ! 1746: FSQRTd	fsqrt	
	.word 0x8d902e4f  ! 1747: WRPR_PSTATE_I	wrpr	%r0, 0x0e4f, %pstate
	.word 0x22800001  ! 1748: BE	be,a	<label_0x1>
	mov 0x34, %r30
	.word 0x8fd0001e  ! 1749: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0xce1fe001  ! 1750: LDD_I	ldd	[%r31 + 0x0001], %r7
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87802088  ! 1752: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x9ba14d2f  ! 1753: FsMULd	fsmuld	%f5, %f46, %f44
	.word 0xdaffc02f  ! 1754: SWAPA_R	swapa	%r13, [%r31 + %r15] 0x01
	.word 0x8d902ed2  ! 1755: WRPR_PSTATE_I	wrpr	%r0, 0x0ed2, %pstate
	.word 0x94d0e001  ! 1756: UMULcc_I	umulcc 	%r3, 0x0001, %r10
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9da289e6  ! 1758: FDIVq	dis not found

	.word 0x8d9022db  ! 1759: WRPR_PSTATE_I	wrpr	%r0, 0x02db, %pstate
	mov 0x30, %r30
	.word 0x99d0001e  ! 1760: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x8d902816  ! 1761: WRPR_PSTATE_I	wrpr	%r0, 0x0816, %pstate
	.word 0x89d02031  ! 1762: Tcc_I	tleu	icc_or_xcc, %r0 + 49
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x90d1400a  ! 1764: UMULcc_R	umulcc 	%r5, %r10, %r8
	.word 0x83d02030  ! 1765: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x8d902edc  ! 1766: WRPR_PSTATE_I	wrpr	%r0, 0x0edc, %pstate
DS_102:
	.word 0x32800001  ! 1768: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x81b38300  ! 1767: ALLIGNADDRESS	alignaddr	%r14, %r0, %r0
	.word 0x86480006  ! 1768: MULX_R	mulx 	%r0, %r6, %r3
	.word 0xc68008a0  ! 1769: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0xc6cfe010  ! 1770: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r3
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9e4a800d  ! 1772: MULX_R	mulx 	%r10, %r13, %r15
	.word 0x81982008  ! 1773: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0008, %hpstate
	.word 0x80810003  ! 1774: ADDcc_R	addcc 	%r4, %r3, %r0
	.word 0x81982192  ! 1775: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0192, %hpstate
	.word 0x8d902c99  ! 1776: WRPR_PSTATE_I	wrpr	%r0, 0x0c99, %pstate
	.word 0xc07fe001  ! 1777: SWAP_I	swap	%r0, [%r31 + 0x0001]
	.word 0x8dd02035  ! 1778: Tcc_I	tneg	icc_or_xcc, %r0 + 53
	.word 0x8d902c15  ! 1779: WRPR_PSTATE_I	wrpr	%r0, 0x0c15, %pstate
	.word 0xc077c003  ! 1780: STX_R	stx	%r0, [%r31 + %r3]
	mov 0x34, %r30
	.word 0x87d0001e  ! 1781: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc07fe001  ! 1783: SWAP_I	swap	%r0, [%r31 + 0x0001]
	.word 0x8d902e53  ! 1784: WRPR_PSTATE_I	wrpr	%r0, 0x0e53, %pstate
	.word 0x97a00541  ! 1785: FSQRTd	fsqrt	
	mov 0x31, %r30
	.word 0x8dd0001e  ! 1786: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x8d902c47  ! 1787: WRPR_PSTATE_I	wrpr	%r0, 0x0c47, %pstate
	.word 0x98786001  ! 1788: SDIV_I	sdiv 	%r1, 0x0001, %r12
	.word 0xd88804a0  ! 1789: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
	.word 0x8600e001  ! 1790: ADD_I	add 	%r3, 0x0001, %r3
	.word 0xc6cfe020  ! 1791: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r3
	.word 0x34700001  ! 1792: BPG	<illegal instruction>
	.word 0xc6cfe020  ! 1793: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r3
	.word 0xc6c804a0  ! 1794: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r3
	.word 0x9d500000  ! 1795: RDPR_TPC	rdpr	%tpc, %r14
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902ad6  ! 1797: WRPR_PSTATE_I	wrpr	%r0, 0x0ad6, %pstate
	.word 0x826a2001  ! 1798: UDIVX_I	udivx 	%r8, 0x0001, %r1
	.word 0xc2d004a0  ! 1799: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r1
	.word 0xc337e001  ! 1800: STQF_I	-	%f1, [0x0001, %r31]
	.word 0x87802004  ! 1801: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x81982b5d  ! 1802: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b5d, %hpstate
	.word 0xc2c7e000  ! 1803: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r1
	mov 0x31, %r30
	.word 0x83d0001e  ! 1804: Tcc_R	te	icc_or_xcc, %r0 + %r30
	mov 0x33, %r30
	.word 0x9bd0001e  ! 1805: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x8d9024d8  ! 1806: WRPR_PSTATE_I	wrpr	%r0, 0x04d8, %pstate
	.word 0xc2c804a0  ! 1807: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r1
	.word 0x87d02034  ! 1808: Tcc_I	tl	icc_or_xcc, %r0 + 52
	.word 0xc2c004a0  ! 1809: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r1
	.word 0x8d902454  ! 1810: WRPR_PSTATE_I	wrpr	%r0, 0x0454, %pstate
	.word 0x8198295d  ! 1811: WRHPR_HPSTATE_I	wrhpr	%r0, 0x095d, %hpstate
	.word 0x81982b4c  ! 1812: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b4c, %hpstate
DS_103:
	.word 0x20800001  ! 1814: BN	bn,a	<label_0x1>
	.word 0xc933a001  ! 1814: STQF_I	-	%f4, [0x0001, %r14]
	.word 0x99458000  ! 1813: RD_SOFTINT_REG	rd	%softint, %r12
	ta	T_CHANGE_PRIV	! macro
	.word 0x81982c1a  ! 1815: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c1a, %hpstate
	.word 0xd8900e80  ! 1816: LDUHA_R	lduha	[%r0, %r0] 0x74, %r12
	.word 0xd82fc001  ! 1817: STB_R	stb	%r12, [%r31 + %r1]
	.word 0xd8cfe030  ! 1818: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r12
	.word 0x8d902c8f  ! 1819: WRPR_PSTATE_I	wrpr	%r0, 0x0c8f, %pstate
DS_104:
	.word 0x32800001  ! 1821: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x8bb3030d  ! 1820: ALLIGNADDRESS	alignaddr	%r12, %r13, %r5
	.word 0xca07e001  ! 1821: LDUW_I	lduw	[%r31 + 0x0001], %r5
	.word 0x88692001  ! 1822: UDIVX_I	udivx 	%r4, 0x0001, %r4
	.word 0x8d902283  ! 1823: WRPR_PSTATE_I	wrpr	%r0, 0x0283, %pstate
	.word 0x819829ca  ! 1824: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09ca, %hpstate
	.word 0x8dd02033  ! 1825: Tcc_I	tneg	icc_or_xcc, %r0 + 51
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81982f89  ! 1827: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f89, %hpstate
DS_105:
	.word 0x20800001  ! 1829: BN	bn,a	<label_0x1>
	illtrap
	.word 0x81b34301  ! 1828: ALLIGNADDRESS	alignaddr	%r13, %r1, %r0
	.word 0x8d902a0e  ! 1829: WRPR_PSTATE_I	wrpr	%r0, 0x0a0e, %pstate
	.word 0x8d802004  ! 1830: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x81982ad1  ! 1831: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad1, %hpstate
	.word 0x8e484004  ! 1832: MULX_R	mulx 	%r1, %r4, %r7
	.word 0x819828c3  ! 1833: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c3, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8198265f  ! 1835: WRHPR_HPSTATE_I	wrhpr	%r0, 0x065f, %hpstate
	.word 0x81982189  ! 1836: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0189, %hpstate
	.word 0x3c700001  ! 1837: BPPOS	<illegal instruction>
	.word 0x8d802004  ! 1838: WRFPRS_I	wr	%r0, 0x0004, %fprs
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x81a0054c  ! 1840: FSQRTd	fsqrt	
	ta	T_CHANGE_PRIV	! macro
	.word 0x9f6a8005  ! 1842: SDIVX_R	sdivx	%r10, %r5, %r15
	.word 0x93514000  ! 1843: RDPR_TBA	rdpr	%tba, %r9
	.word 0xd28804a0  ! 1844: LDUBA_R	lduba	[%r0, %r0] 0x25, %r9
	.word 0x819829d1  ! 1845: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d1, %hpstate
	.word 0x8d902c16  ! 1846: WRPR_PSTATE_I	wrpr	%r0, 0x0c16, %pstate
	.word 0xd2800b00  ! 1847: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r9
	.word 0x9da0c9e6  ! 1848: FDIVq	dis not found

	.word 0x81982257  ! 1849: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0257, %hpstate
	mov 0x33, %r30
	.word 0x9fd0001e  ! 1850: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0xdc8008a0  ! 1851: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r14
	mov 0x31, %r30
	.word 0x83d0001e  ! 1852: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x34800001  ! 1853: BG	bg,a	<label_0x1>
	.word 0x936b800d  ! 1854: SDIVX_R	sdivx	%r14, %r13, %r9
	.word 0x81982c10  ! 1855: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c10, %hpstate
	.word 0x87802088  ! 1856: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8d902ac8  ! 1857: WRPR_PSTATE_I	wrpr	%r0, 0x0ac8, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0xd28008a0  ! 1859: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x93d02034  ! 1860: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x38700001  ! 1861: BPGU	<illegal instruction>
	.word 0x90c0a001  ! 1862: ADDCcc_I	addccc 	%r2, 0x0001, %r8
	.word 0x8198299c  ! 1863: WRHPR_HPSTATE_I	wrhpr	%r0, 0x099c, %hpstate
	.word 0x8d902047  ! 1864: WRPR_PSTATE_I	wrpr	%r0, 0x0047, %pstate
	.word 0xd0d804a0  ! 1865: LDXA_R	ldxa	[%r0, %r0] 0x25, %r8
	.word 0x8d90241a  ! 1866: WRPR_PSTATE_I	wrpr	%r0, 0x041a, %pstate
	.word 0xd08008a0  ! 1867: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	ta	T_CHANGE_TO_TL0	! macro
	mov 0x30, %r30
	.word 0x81d0001e  ! 1869: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x81982c87  ! 1870: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c87, %hpstate
DS_106:
	.word 0x20800001  ! 1872: BN	bn,a	<label_0x1>
	illtrap
	.word 0x93b1c30b  ! 1871: ALLIGNADDRESS	alignaddr	%r7, %r11, %r9
	.word 0x3a800001  ! 1872: BCC	bcc,a	<label_0x1>
	.word 0x22800001  ! 1873: BE	be,a	<label_0x1>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x819823cb  ! 1875: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03cb, %hpstate
	.word 0x3a800001  ! 1876: BCC	bcc,a	<label_0x1>
	.word 0xd2cfe010  ! 1877: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r9
	.word 0x87802014  ! 1878: WRASI_I	wr	%r0, 0x0014, %asi
	mov 0x30, %r30
	.word 0x99d0001e  ! 1879: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81982c96  ! 1881: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c96, %hpstate
	.word 0x8fd02032  ! 1882: Tcc_I	tvs	icc_or_xcc, %r0 + 50
	.word 0x87802016  ! 1883: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x81d02035  ! 1884: Tcc_I	tn	icc_or_xcc, %r0 + 53
	.word 0x8e696001  ! 1885: UDIVX_I	udivx 	%r5, 0x0001, %r7
	.word 0x8b480000  ! 1886: RDHPR_HPSTATE	rdhpr	%hpstate, %r5
	.word 0xcadfe020  ! 1887: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r5
	.word 0x98d9000d  ! 1888: SMULcc_R	smulcc 	%r4, %r13, %r12
	ta	T_CHANGE_HPRIV	! macro
DS_107:
	.word 0x32800001  ! 1891: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x9bb34307  ! 1890: ALLIGNADDRESS	alignaddr	%r13, %r7, %r13
	.word 0x83d02035  ! 1891: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x81982284  ! 1892: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0284, %hpstate
	.word 0x87802004  ! 1893: WRASI_I	wr	%r0, 0x0004, %asi
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a38d27  ! 1895: FsMULd	fsmuld	%f14, %f38, %f8
	.word 0xd01fe001  ! 1896: LDD_I	ldd	[%r31 + 0x0001], %r8
	.word 0x87802010  ! 1897: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xd0c7e010  ! 1898: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r8
	mov 0x33, %r30
	.word 0x9fd0001e  ! 1899: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x8d902416  ! 1900: WRPR_PSTATE_I	wrpr	%r0, 0x0416, %pstate
	.word 0xd0bfe001  ! 1901: STDA_I	stda	%r8, [%r31 + 0x0001] %asi
	.word 0x947b6001  ! 1902: SDIV_I	sdiv 	%r13, 0x0001, %r10
	.word 0xd53fc007  ! 1903: STDF_R	std	%f10, [%r7, %r31]
	.word 0x89a1c9cd  ! 1904: FDIVd	fdivd	%f38, %f44, %f4
	.word 0x947b800a  ! 1905: SDIV_R	sdiv 	%r14, %r10, %r10
	.word 0x8d802000  ! 1906: WRFPRS_I	wr	%r0, 0x0000, %fprs
	mov 0x31, %r30
	.word 0x83d0001e  ! 1907: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x9e012001  ! 1908: ADD_I	add 	%r4, 0x0001, %r15
	.word 0x82836001  ! 1909: ADDcc_I	addcc 	%r13, 0x0001, %r1
DS_108:
	.word 0x22800001  ! 1911: BE	be,a	<label_0x1>
	.word 0xdb312001  ! 1911: STQF_I	-	%f13, [0x0001, %r4]
	.word 0x99458000  ! 1910: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x95d02033  ! 1911: Tcc_I	tg	icc_or_xcc, %r0 + 51
	mov 0x34, %r30
	.word 0x8bd0001e  ! 1912: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 1913: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9403e001  ! 1914: ADD_I	add 	%r15, 0x0001, %r10
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x24800001  ! 1916: BLE	ble,a	<label_0x1>
	.word 0xd45fc000  ! 1917: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x9b494000  ! 1918: RDHPR_HTBA	rdhpr	%htba, %r13
	.word 0x8ba0054a  ! 1919: FSQRTd	fsqrt	
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8198214f  ! 1921: WRHPR_HPSTATE_I	wrhpr	%r0, 0x014f, %hpstate
	mov 0x35, %r30
	.word 0x89d0001e  ! 1922: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81982159  ! 1924: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0159, %hpstate
	.word 0x8d902642  ! 1925: WRPR_PSTATE_I	wrpr	%r0, 0x0642, %pstate
	.word 0x8d902643  ! 1926: WRPR_PSTATE_I	wrpr	%r0, 0x0643, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x2a800001  ! 1928: BCS	bcs,a	<label_0x1>
	.word 0x8b508000  ! 1929: RDPR_TSTATE	rdpr	%tstate, %r5
	.word 0x8d802004  ! 1930: WRFPRS_I	wr	%r0, 0x0004, %fprs
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_TO_TL0	! macro
DS_109:
	.word 0x32800001  ! 1934: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x97b1030f  ! 1933: ALLIGNADDRESS	alignaddr	%r4, %r15, %r11
	mov 0x31, %r30
	.word 0x99d0001e  ! 1934: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x9ba14dc2  ! 1935: FdMULq	fdmulq	
	.word 0x81982e91  ! 1936: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e91, %hpstate
	.word 0x8d902ccd  ! 1937: WRPR_PSTATE_I	wrpr	%r0, 0x0ccd, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xdb37e001  ! 1939: STQF_I	-	%f13, [0x0001, %r31]
	.word 0x8a49a001  ! 1940: MULX_I	mulx 	%r6, 0x0001, %r5
	.word 0x87802010  ! 1941: WRASI_I	wr	%r0, 0x0010, %asi
	ta	T_CHANGE_PRIV	! macro
	.word 0x81982458  ! 1943: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0458, %hpstate
DS_110:
	.word 0x20800001  ! 1945: BN	bn,a	<label_0x1>
	illtrap
	.word 0x85b2c30a  ! 1944: ALLIGNADDRESS	alignaddr	%r11, %r10, %r2
	.word 0x8d902452  ! 1945: WRPR_PSTATE_I	wrpr	%r0, 0x0452, %pstate
	.word 0x8d802000  ! 1946: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_111:
	.word 0x32800001  ! 1948: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x81b34307  ! 1947: ALLIGNADDRESS	alignaddr	%r13, %r7, %r0
	.word 0xc0ffc027  ! 1948: SWAPA_R	swapa	%r0, [%r31 + %r7] 0x01
	.word 0xc0cfe000  ! 1949: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r0
	.word 0x32800001  ! 1950: BNE	bne,a	<label_0x1>
	.word 0x819829c2  ! 1951: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c2, %hpstate
	.word 0xc0bfc027  ! 1952: STDA_R	stda	%r0, [%r31 + %r7] 0x01
	.word 0x9da0054f  ! 1953: FSQRTd	fsqrt	
	.word 0xdc8008a0  ! 1954: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r14
	.word 0xdd27c00f  ! 1955: STF_R	st	%f14, [%r15, %r31]
	.word 0x864b6001  ! 1956: MULX_I	mulx 	%r13, 0x0001, %r3
	ta	T_CHANGE_PRIV	! macro
	.word 0x8c49e001  ! 1958: MULX_I	mulx 	%r7, 0x0001, %r6
	.word 0x81982390  ! 1959: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0390, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8a7be001  ! 1961: SDIV_I	sdiv 	%r15, 0x0001, %r5
	.word 0x8198214a  ! 1962: WRHPR_HPSTATE_I	wrhpr	%r0, 0x014a, %hpstate
DS_112:
	.word 0x32800001  ! 1964: BNE	bne,a	<label_0x1>
	.word 0xcf326001  ! 1964: STQF_I	-	%f7, [0x0001, %r9]
	.word 0x83458000  ! 1963: RD_SOFTINT_REG	rd	%softint, %r1
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d802004  ! 1965: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xc227e001  ! 1966: STW_I	stw	%r1, [%r31 + 0x0001]
	.word 0x84d2c004  ! 1967: UMULcc_R	umulcc 	%r11, %r4, %r2
	.word 0xc45fc000  ! 1968: LDX_R	ldx	[%r31 + %r0], %r2
	.word 0x8198235c  ! 1969: WRHPR_HPSTATE_I	wrhpr	%r0, 0x035c, %hpstate
	.word 0x9ba000c4  ! 1970: FNEGd	fnegd	%f4, %f44
DS_113:
	.word 0x22800001  ! 1972: BE	be,a	<label_0x1>
	illtrap
	.word 0x8fb00309  ! 1971: ALLIGNADDRESS	alignaddr	%r0, %r9, %r7
	.word 0x8d902c9f  ! 1972: WRPR_PSTATE_I	wrpr	%r0, 0x0c9f, %pstate
	.word 0xcec80e40  ! 1973: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r7
	.word 0xcf27e001  ! 1974: STF_I	st	%f7, [0x0001, %r31]
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0xce4fe001  ! 1977: LDSB_I	ldsb	[%r31 + 0x0001], %r7
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x81982b81  ! 1979: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b81, %hpstate
	.word 0xce800c60  ! 1980: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r7
	.word 0x99d02032  ! 1981: Tcc_I	tgu	icc_or_xcc, %r0 + 50
	.word 0xce27c009  ! 1982: STW_R	stw	%r7, [%r31 + %r9]
	.word 0x8d802000  ! 1983: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xce8008a0  ! 1984: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x87802014  ! 1985: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x9a48400f  ! 1986: MULX_R	mulx 	%r1, %r15, %r13
	.word 0xda7fe001  ! 1987: SWAP_I	swap	%r13, [%r31 + 0x0001]
	.word 0x26800001  ! 1988: BL	bl,a	<label_0x1>
	.word 0xda8008a0  ! 1989: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x83a01a69  ! 1990: FqTOi	fqtoi	
	.word 0xc27fe001  ! 1991: SWAP_I	swap	%r1, [%r31 + 0x0001]
	.word 0xc297e030  ! 1992: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r1
	.word 0x87802016  ! 1993: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xc2cfe030  ! 1994: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r1
	.word 0x81982e07  ! 1995: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e07, %hpstate
	.word 0x819828d6  ! 1996: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d6, %hpstate
	mov 0x30, %r30
	.word 0x81d0001e  ! 1997: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x91a1cdc5  ! 1998: FdMULq	fdmulq	
	.word 0x93494000  ! 1999: RDHPR_HTBA	rdhpr	%htba, %r9
	.word 0x93a01a62  ! 2000: FqTOi	fqtoi	
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x98d90001  ! 2002: SMULcc_R	smulcc 	%r4, %r1, %r12
	.word 0x87802004  ! 2003: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x2c700001  ! 2004: BPNEG	<illegal instruction>
	.word 0x8d802004  ! 2005: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x2e700001  ! 2006: BPVS	<illegal instruction>
	mov 0x31, %r30
	.word 0x8dd0001e  ! 2007: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x24700001  ! 2008: BPLE	<illegal instruction>
	ta	T_CHANGE_PRIV	! macro
	.word 0x8550c000  ! 2010: RDPR_TT	rdpr	%tt, %r2
	.word 0x81982a88  ! 2011: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a88, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_TO_TL0	! macro
	mov 0x34, %r30
	.word 0x95d0001e  ! 2014: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x82496001  ! 2015: MULX_I	mulx 	%r5, 0x0001, %r1
	.word 0x89a00549  ! 2016: FSQRTd	fsqrt	
	.word 0x81982f92  ! 2017: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f92, %hpstate
	.word 0x81982586  ! 2018: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0586, %hpstate
	.word 0xc8dfe010  ! 2019: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r4
	ta	T_CHANGE_PRIV	! macro
	.word 0xc88804a0  ! 2021: LDUBA_R	lduba	[%r0, %r0] 0x25, %r4
	ta	T_CHANGE_HPRIV	! macro
	.word 0x97a289a5  ! 2023: FDIVs	fdivs	%f10, %f5, %f11
	.word 0xd7e7c025  ! 2024: CASA_I	casa	[%r31] 0x 1, %r5, %r11
	.word 0x81982fc1  ! 2025: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fc1, %hpstate
	.word 0x8d90241e  ! 2026: WRPR_PSTATE_I	wrpr	%r0, 0x041e, %pstate
DS_114:
	.word 0x20800001  ! 2028: BN	bn,a	<label_0x1>
	illtrap
	.word 0x89b3830f  ! 2027: ALLIGNADDRESS	alignaddr	%r14, %r15, %r4
	.word 0x9da149e8  ! 2028: FDIVq	dis not found

	.word 0xdd97e001  ! 2029: LDQFA_I	-	[%r31, 0x0001], %f14
	.word 0xdcffc028  ! 2030: SWAPA_R	swapa	%r14, [%r31 + %r8] 0x01
	.word 0x8d802000  ! 2031: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81684009  ! 2033: SDIVX_R	sdivx	%r1, %r9, %r0
	mov 0x33, %r30
	.word 0x81d0001e  ! 2034: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0xc08008a0  ! 2035: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0x87802004  ! 2036: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x97a04dce  ! 2037: FdMULq	fdmulq	
	mov 0x30, %r30
	.word 0x85d0001e  ! 2038: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x8198245b  ! 2039: WRHPR_HPSTATE_I	wrhpr	%r0, 0x045b, %hpstate
	mov 0x34, %r30
	.word 0x87d0001e  ! 2040: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0xd6cfe030  ! 2041: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r11
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902c53  ! 2043: WRPR_PSTATE_I	wrpr	%r0, 0x0c53, %pstate
	.word 0xd657c000  ! 2044: LDSH_R	ldsh	[%r31 + %r0], %r11
	.word 0x8283400c  ! 2045: ADDcc_R	addcc 	%r13, %r12, %r1
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8dd02031  ! 2047: Tcc_I	tneg	icc_or_xcc, %r0 + 49
	mov 0x30, %r30
	.word 0x85d0001e  ! 2048: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x8d90269a  ! 2049: WRPR_PSTATE_I	wrpr	%r0, 0x069a, %pstate
	.word 0x2a700001  ! 2050: BPCS	<illegal instruction>
	.word 0xc33fe001  ! 2051: STDF_I	std	%f1, [0x0001, %r31]
	.word 0xc3e7c02c  ! 2052: CASA_I	casa	[%r31] 0x 1, %r12, %r1
	mov 0x35, %r30
	.word 0x9dd0001e  ! 2053: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc28804a0  ! 2055: LDUBA_R	lduba	[%r0, %r0] 0x25, %r1
	mov 0x35, %r30
	.word 0x93d0001e  ! 2056: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8a81e001  ! 2057: ADDcc_I	addcc 	%r7, 0x0001, %r5
	.word 0xca07e001  ! 2058: LDUW_I	lduw	[%r31 + 0x0001], %r5
	.word 0x8d9026da  ! 2059: WRPR_PSTATE_I	wrpr	%r0, 0x06da, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d90260a  ! 2061: WRPR_PSTATE_I	wrpr	%r0, 0x060a, %pstate
	.word 0xcb37c00c  ! 2062: STQF_R	-	%f5, [%r12, %r31]
DS_115:
	.word 0x22800001  ! 2064: BE	be,a	<label_0x1>
	illtrap
	.word 0x99b10309  ! 2063: ALLIGNADDRESS	alignaddr	%r4, %r9, %r12
	.word 0xd9e7c029  ! 2064: CASA_I	casa	[%r31] 0x 1, %r9, %r12
	.word 0x32700001  ! 2065: BPNE	<illegal instruction>
	.word 0x8d902c9d  ! 2066: WRPR_PSTATE_I	wrpr	%r0, 0x0c9d, %pstate
	mov 0x35, %r30
	.word 0x8fd0001e  ! 2067: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x8ba009c1  ! 2068: FDIVd	fdivd	%f0, %f32, %f36
	.word 0xcb3fc001  ! 2069: STDF_R	std	%f5, [%r1, %r31]
	ta	T_CHANGE_TO_TL0	! macro
	mov 0x33, %r30
	.word 0x81d0001e  ! 2071: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 2072: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xcadfe010  ! 2073: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r5
	.word 0x81982adc  ! 2074: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0adc, %hpstate
	.word 0xcb97e001  ! 2075: LDQFA_I	-	[%r31, 0x0001], %f5
	.word 0x8d902cd8  ! 2076: WRPR_PSTATE_I	wrpr	%r0, 0x0cd8, %pstate
	.word 0x9950c000  ! 2077: RDPR_TT	rdpr	%tt, %r12
	.word 0x87d02034  ! 2078: Tcc_I	tl	icc_or_xcc, %r0 + 52
	.word 0x81982c91  ! 2079: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c91, %hpstate
	.word 0x81982c84  ! 2080: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c84, %hpstate
	.word 0x81982a80  ! 2081: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a80, %hpstate
	.word 0x24700001  ! 2082: BPLE	<illegal instruction>
	.word 0x9c4aa001  ! 2083: MULX_I	mulx 	%r10, 0x0001, %r14
	.word 0x87d02034  ! 2084: Tcc_I	tl	icc_or_xcc, %r0 + 52
	.word 0x81982c5d  ! 2085: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c5d, %hpstate
	.word 0x9c4aa001  ! 2086: MULX_I	mulx 	%r10, 0x0001, %r14
	.word 0x91504000  ! 2087: RDPR_TNPC	rdpr	%tnpc, %r8
	.word 0x3a700001  ! 2088: BPCC	<illegal instruction>
	.word 0x8d902801  ! 2089: WRPR_PSTATE_I	wrpr	%r0, 0x0801, %pstate
	.word 0xd0dfe020  ! 2090: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r8
	.word 0x9b504000  ! 2091: RDPR_TNPC	rdpr	%tnpc, %r13
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d902e10  ! 2093: WRPR_PSTATE_I	wrpr	%r0, 0x0e10, %pstate
	.word 0x8d902e46  ! 2094: WRPR_PSTATE_I	wrpr	%r0, 0x0e46, %pstate
	.word 0x8198261a  ! 2095: WRHPR_HPSTATE_I	wrhpr	%r0, 0x061a, %hpstate
	.word 0x8fa009a5  ! 2096: FDIVs	fdivs	%f0, %f5, %f7
	.word 0xce97e020  ! 2097: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r7
	.word 0x91a00545  ! 2098: FSQRTd	fsqrt	
	.word 0x38800001  ! 2099: BGU	bgu,a	<label_0x1>
	.word 0x8d9020dd  ! 2100: WRPR_PSTATE_I	wrpr	%r0, 0x00dd, %pstate
	mov 0x30, %r30
	.word 0x85d0001e  ! 2101: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x81982b9f  ! 2102: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b9f, %hpstate
	.word 0x8d90260c  ! 2103: WRPR_PSTATE_I	wrpr	%r0, 0x060c, %pstate
	.word 0x81d02031  ! 2104: Tcc_I	tn	icc_or_xcc, %r0 + 49
	mov 0x32, %r30
	.word 0x91d0001e  ! 2105: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd08008a0  ! 2106: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	mov 0x34, %r30
	.word 0x89d0001e  ! 2107: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x89a309c0  ! 2108: FDIVd	fdivd	%f12, %f0, %f4
	.word 0x9a02e001  ! 2109: ADD_I	add 	%r11, 0x0001, %r13
	.word 0x38700001  ! 2110: BPGU	<illegal instruction>
	mov 0x30, %r30
	.word 0x97d0001e  ! 2111: Tcc_R	tge	icc_or_xcc, %r0 + %r30
DS_116:
	.word 0x34800001  ! 2113: BG	bg,a	<label_0x1>
	illtrap
	.word 0x93b1430e  ! 2112: ALLIGNADDRESS	alignaddr	%r5, %r14, %r9
	.word 0xd3e7c02e  ! 2113: CASA_I	casa	[%r31] 0x 1, %r14, %r9
	.word 0xd28008a0  ! 2114: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x8d90208b  ! 2115: WRPR_PSTATE_I	wrpr	%r0, 0x008b, %pstate
	.word 0xd28008a0  ! 2116: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xd337c00e  ! 2117: STQF_R	-	%f9, [%r14, %r31]
	ta	T_CHANGE_HPRIV	! macro
	mov 0x30, %r30
	.word 0x9fd0001e  ! 2119: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x8d902640  ! 2120: WRPR_PSTATE_I	wrpr	%r0, 0x0640, %pstate
	.word 0x9da149c8  ! 2121: FDIVd	fdivd	%f36, %f8, %f14
	.word 0xdc8008a0  ! 2122: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r14
	.word 0x87802014  ! 2123: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x964a6001  ! 2124: MULX_I	mulx 	%r9, 0x0001, %r11
DS_117:
	.word 0x34800001  ! 2126: BG	bg,a	<label_0x1>
	illtrap
	.word 0x8bb00309  ! 2125: ALLIGNADDRESS	alignaddr	%r0, %r9, %r5
	.word 0x9a53800f  ! 2126: UMUL_R	umul 	%r14, %r15, %r13
	mov 0x35, %r30
	.word 0x9dd0001e  ! 2127: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0xdac804a0  ! 2128: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r13
	.word 0x97d02033  ! 2129: Tcc_I	tge	icc_or_xcc, %r0 + 51
	.word 0x8d902e1b  ! 2130: WRPR_PSTATE_I	wrpr	%r0, 0x0e1b, %pstate
	.word 0x87a0056d  ! 2131: FSQRTq	fsqrt	
	.word 0x9950c000  ! 2132: RDPR_TT	rdpr	%tt, %r12
	ta	T_CHANGE_NONHPRIV	! macro
DS_118:
	.word 0x34800001  ! 2135: BG	bg,a	<label_0x1>
	illtrap
	.word 0x8bb3830f  ! 2134: ALLIGNADDRESS	alignaddr	%r14, %r15, %r5
	.word 0x8653000f  ! 2135: UMUL_R	umul 	%r12, %r15, %r3
	mov 0x32, %r30
	.word 0x8fd0001e  ! 2136: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x99a000ca  ! 2137: FNEGd	fnegd	%f10, %f12
DS_119:
	.word 0x22800001  ! 2139: BE	be,a	<label_0x1>
	.word 0xd3308004  ! 2139: STQF_R	-	%f9, [%r4, %r2]
	.word 0x8d458000  ! 2138: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0x8f6b2001  ! 2139: SDIVX_I	sdivx	%r12, 0x0001, %r7
	.word 0x8198235d  ! 2140: WRHPR_HPSTATE_I	wrhpr	%r0, 0x035d, %hpstate
	.word 0xce880e60  ! 2141: LDUBA_R	lduba	[%r0, %r0] 0x73, %r7
	.word 0x8198224f  ! 2142: WRHPR_HPSTATE_I	wrhpr	%r0, 0x024f, %hpstate
	.word 0x9da2c9aa  ! 2143: FDIVs	fdivs	%f11, %f10, %f14
	.word 0x8750c000  ! 2144: RDPR_TT	rdpr	%tt, %r3
	.word 0x2a800001  ! 2145: BCS	bcs,a	<label_0x1>
	.word 0x81982186  ! 2146: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0186, %hpstate
	.word 0xc6ffc02a  ! 2147: SWAPA_R	swapa	%r3, [%r31 + %r10] 0x01
	mov 0x30, %r30
	.word 0x89d0001e  ! 2148: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x9fa00569  ! 2149: FSQRTq	fsqrt	
	.word 0x81982dc8  ! 2150: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dc8, %hpstate
	.word 0x9da24dc8  ! 2151: FdMULq	fdmulq	
	.word 0xdc77e001  ! 2152: STX_I	stx	%r14, [%r31 + 0x0001]
	.word 0x96d36001  ! 2153: UMULcc_I	umulcc 	%r13, 0x0001, %r11
	.word 0x81982245  ! 2154: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0245, %hpstate
DS_120:
	.word 0x34800001  ! 2156: BG	bg,a	<label_0x1>
	.word 0xcf302001  ! 2156: STQF_I	-	%f7, [0x0001, %r0]
	.word 0x93458000  ! 2155: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x20700001  ! 2156: BPN	<illegal instruction>
	.word 0x81982352  ! 2157: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0352, %hpstate
	.word 0x85480000  ! 2158: RDHPR_HPSTATE	rdhpr	%hpstate, %r2
	.word 0xc4800ba0  ! 2159: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r2
	.word 0x8d90225e  ! 2160: WRPR_PSTATE_I	wrpr	%r0, 0x025e, %pstate
	.word 0xc527e001  ! 2161: STF_I	st	%f2, [0x0001, %r31]
	.word 0x8e7bc00a  ! 2162: SDIV_R	sdiv 	%r15, %r10, %r7
	ta	T_CHANGE_NONPRIV	! macro
	mov 0x35, %r30
	.word 0x93d0001e  ! 2164: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	mov 0x31, %r30
	.word 0x8fd0001e  ! 2165: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x8d902e8f  ! 2166: WRPR_PSTATE_I	wrpr	%r0, 0x0e8f, %pstate
	.word 0x8d90285c  ! 2167: WRPR_PSTATE_I	wrpr	%r0, 0x085c, %pstate
	.word 0x8fa249cc  ! 2168: FDIVd	fdivd	%f40, %f12, %f38
	.word 0x82836001  ! 2169: ADDcc_I	addcc 	%r13, 0x0001, %r1
	.word 0xc2800a60  ! 2170: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r1
	.word 0xc28fe010  ! 2171: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r1
	ta	T_CHANGE_NONHPRIV	! macro
DS_121:
	.word 0x20800001  ! 2174: BN	bn,a	<label_0x1>
	.word 0xc931c007  ! 2174: STQF_R	-	%f4, [%r7, %r7]
	.word 0x97458000  ! 2173: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0xd6dfe000  ! 2174: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r11
	.word 0x9049a001  ! 2175: MULX_I	mulx 	%r6, 0x0001, %r8
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8b514000  ! 2177: RDPR_TBA	rdpr	%tba, %r5
	.word 0xca47c000  ! 2178: LDSW_R	ldsw	[%r31 + %r0], %r5
	.word 0xca1fe001  ! 2179: LDD_I	ldd	[%r31 + 0x0001], %r5
	.word 0x8d802000  ! 2180: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8568800b  ! 2181: SDIVX_R	sdivx	%r2, %r11, %r2
	.word 0xc407c000  ! 2182: LDUW_R	lduw	[%r31 + %r0], %r2
	.word 0x9ed9800d  ! 2183: SMULcc_R	smulcc 	%r6, %r13, %r15
	.word 0x8d802000  ! 2184: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9dd02035  ! 2185: Tcc_I	tpos	icc_or_xcc, %r0 + 53
	.word 0x95a349ea  ! 2186: FDIVq	dis not found

	.word 0xd4d7e010  ! 2187: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r10
	.word 0x87802016  ! 2188: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x81982e1e  ! 2189: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e1e, %hpstate
	.word 0x8d9024c2  ! 2190: WRPR_PSTATE_I	wrpr	%r0, 0x04c2, %pstate
	.word 0x8d90285e  ! 2191: WRPR_PSTATE_I	wrpr	%r0, 0x085e, %pstate
	.word 0xd48804a0  ! 2192: LDUBA_R	lduba	[%r0, %r0] 0x25, %r10
	.word 0x2a700001  ! 2193: BPCS	<illegal instruction>
	mov 0x31, %r30
	.word 0x8dd0001e  ! 2194: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0xd48804a0  ! 2195: LDUBA_R	lduba	[%r0, %r0] 0x25, %r10
	.word 0x81982351  ! 2196: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0351, %hpstate
	.word 0x9e83a001  ! 2197: ADDcc_I	addcc 	%r14, 0x0001, %r15
	.word 0x827b2001  ! 2198: SDIV_I	sdiv 	%r12, 0x0001, %r1
	.word 0x9c6ae001  ! 2199: UDIVX_I	udivx 	%r11, 0x0001, %r14
	.word 0x95d02030  ! 2200: Tcc_I	tg	icc_or_xcc, %r0 + 48
	.word 0xdc800ac0  ! 2201: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r14
	.word 0x8d902ec8  ! 2202: WRPR_PSTATE_I	wrpr	%r0, 0x0ec8, %pstate
	.word 0x8d90229c  ! 2203: WRPR_PSTATE_I	wrpr	%r0, 0x029c, %pstate
	.word 0x8d9028da  ! 2204: WRPR_PSTATE_I	wrpr	%r0, 0x08da, %pstate
	.word 0x824a8005  ! 2205: MULX_R	mulx 	%r10, %r5, %r1
	.word 0xc21fe001  ! 2206: LDD_I	ldd	[%r31 + 0x0001], %r1
	.word 0xc327e001  ! 2207: STF_I	st	%f1, [0x0001, %r31]
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xc25fc000  ! 2209: LDX_R	ldx	[%r31 + %r0], %r1
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x2e700001  ! 2211: BPVS	<illegal instruction>
	ta	T_CHANGE_NONHPRIV	! macro
	mov 0x34, %r30
	.word 0x95d0001e  ! 2213: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x819821d5  ! 2214: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01d5, %hpstate
	mov 0x34, %r30
	.word 0x97d0001e  ! 2215: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x91a0c9ca  ! 2216: FDIVd	fdivd	%f34, %f10, %f8
	.word 0xd127c00a  ! 2217: STF_R	st	%f8, [%r10, %r31]
	.word 0x8d902091  ! 2218: WRPR_PSTATE_I	wrpr	%r0, 0x0091, %pstate
	.word 0x81982c07  ! 2219: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c07, %hpstate
	.word 0xd127c00a  ! 2220: STF_R	st	%f8, [%r10, %r31]
	.word 0x38700001  ! 2221: BPGU	<illegal instruction>
	.word 0xd0900e80  ! 2222: LDUHA_R	lduha	[%r0, %r0] 0x74, %r8
	.word 0xd017e001  ! 2223: LDUH_I	lduh	[%r31 + 0x0001], %r8
	.word 0x28800001  ! 2224: BLEU	bleu,a	<label_0x1>
	.word 0x81982193  ! 2225: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0193, %hpstate
	.word 0x8fd02031  ! 2226: Tcc_I	tvs	icc_or_xcc, %r0 + 49
	.word 0xd0c7e020  ! 2227: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r8
	.word 0x32700001  ! 2228: BPNE	<illegal instruction>
	.word 0xd0800c20  ! 2229: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r8
	mov 0x31, %r30
	.word 0x89d0001e  ! 2230: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x8d902c93  ! 2231: WRPR_PSTATE_I	wrpr	%r0, 0x0c93, %pstate
	.word 0x87d02031  ! 2232: Tcc_I	tl	icc_or_xcc, %r0 + 49
	.word 0x81d02031  ! 2233: Tcc_I	tn	icc_or_xcc, %r0 + 49
	.word 0x8d90221d  ! 2234: WRPR_PSTATE_I	wrpr	%r0, 0x021d, %pstate
	.word 0x9a79400f  ! 2235: SDIV_R	sdiv 	%r5, %r15, %r13
	.word 0xda0fe001  ! 2236: LDUB_I	ldub	[%r31 + 0x0001], %r13
	.word 0x9ba18dc2  ! 2237: FdMULq	fdmulq	
	.word 0x8d902a14  ! 2238: WRPR_PSTATE_I	wrpr	%r0, 0x0a14, %pstate
	.word 0xda8008a0  ! 2239: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x8d90224b  ! 2240: WRPR_PSTATE_I	wrpr	%r0, 0x024b, %pstate
	.word 0x8d902c51  ! 2241: WRPR_PSTATE_I	wrpr	%r0, 0x0c51, %pstate
	mov 0x33, %r30
	.word 0x95d0001e  ! 2242: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x9468400d  ! 2243: UDIVX_R	udivx 	%r1, %r13, %r10
	.word 0x24700001  ! 2244: BPLE	<illegal instruction>
	.word 0x99d02031  ! 2245: Tcc_I	tgu	icc_or_xcc, %r0 + 49
	.word 0x8d802000  ! 2246: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8bd02035  ! 2247: Tcc_I	tcs	icc_or_xcc, %r0 + 53
	.word 0x81982ec2  ! 2248: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ec2, %hpstate
	.word 0xd49fe001  ! 2249: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r10
	.word 0x9250400d  ! 2250: UMUL_R	umul 	%r1, %r13, %r9
	.word 0x93d02033  ! 2251: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0xd337c00d  ! 2252: STQF_R	-	%f9, [%r13, %r31]
	.word 0x87802004  ! 2253: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x2c800001  ! 2254: BNEG	bneg,a	<label_0x1>
	.word 0x8d90244c  ! 2255: WRPR_PSTATE_I	wrpr	%r0, 0x044c, %pstate
	.word 0x94022001  ! 2256: ADD_I	add 	%r8, 0x0001, %r10
	.word 0xd47fe001  ! 2257: SWAP_I	swap	%r10, [%r31 + 0x0001]
	.word 0x9dd02032  ! 2258: Tcc_I	tpos	icc_or_xcc, %r0 + 50
DS_122:
	.word 0x20800001  ! 2260: BN	bn,a	<label_0x1>
	illtrap
	.word 0x8fb28305  ! 2259: ALLIGNADDRESS	alignaddr	%r10, %r5, %r7
	.word 0x85a089e4  ! 2260: FDIVq	dis not found

	.word 0x87802089  ! 2261: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xc407c000  ! 2262: LDUW_R	lduw	[%r31 + %r0], %r2
	.word 0x87802088  ! 2263: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x82022001  ! 2264: ADD_I	add 	%r8, 0x0001, %r1
	ta	T_CHANGE_TO_TL0	! macro
	mov 0x30, %r30
	.word 0x9fd0001e  ! 2266: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0xc2c004a0  ! 2267: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r1
	.word 0xc2800c00  ! 2268: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r1
	.word 0x81982949  ! 2269: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0949, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x2e800001  ! 2271: BVS	bvs,a	<label_0x1>
	.word 0xc2d7e000  ! 2272: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r1
	.word 0x90d3a001  ! 2273: UMULcc_I	umulcc 	%r14, 0x0001, %r8
	.word 0xd0d004a0  ! 2274: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
	.word 0x8d9024c5  ! 2275: WRPR_PSTATE_I	wrpr	%r0, 0x04c5, %pstate
	.word 0x8351c000  ! 2276: RDPR_TL	rdpr	%tl, %r1
	.word 0x9fa1c9a0  ! 2277: FDIVs	fdivs	%f7, %f0, %f15
	.word 0x85d02033  ! 2278: Tcc_I	tle	icc_or_xcc, %r0 + 51
	.word 0xdf27e001  ! 2279: STF_I	st	%f15, [0x0001, %r31]
	.word 0x8d902046  ! 2280: WRPR_PSTATE_I	wrpr	%r0, 0x0046, %pstate
	.word 0x87802016  ! 2281: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8d902807  ! 2282: WRPR_PSTATE_I	wrpr	%r0, 0x0807, %pstate
	.word 0x84d0c007  ! 2283: UMULcc_R	umulcc 	%r3, %r7, %r2
	.word 0x8d902098  ! 2284: WRPR_PSTATE_I	wrpr	%r0, 0x0098, %pstate
	.word 0xc407c000  ! 2285: LDUW_R	lduw	[%r31 + %r0], %r2
	.word 0x88d12001  ! 2286: UMULcc_I	umulcc 	%r4, 0x0001, %r4
	mov 0x33, %r30
	.word 0x81d0001e  ! 2287: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x8bd02033  ! 2288: Tcc_I	tcs	icc_or_xcc, %r0 + 51
	.word 0x876be001  ! 2289: SDIVX_I	sdivx	%r15, 0x0001, %r3
	.word 0x99a0cd2a  ! 2290: FsMULd	fsmuld	%f3, %f10, %f12
	.word 0x97a00549  ! 2291: FSQRTd	fsqrt	
	.word 0x9e50c00f  ! 2292: UMUL_R	umul 	%r3, %r15, %r15
	.word 0xde97e020  ! 2293: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r15
	ta	T_CHANGE_PRIV	! macro
	.word 0xde8008a0  ! 2295: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r15
	.word 0x8d802000  ! 2296: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d802004  ! 2297: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d902480  ! 2298: WRPR_PSTATE_I	wrpr	%r0, 0x0480, %pstate
	.word 0xdecfe010  ! 2299: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r15
	.word 0xde9fc020  ! 2300: LDDA_R	ldda	[%r31, %r0] 0x01, %r15
	.word 0x85d02035  ! 2301: Tcc_I	tle	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8e822001  ! 2303: ADDcc_I	addcc 	%r8, 0x0001, %r7
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9fd02031  ! 2305: Tcc_I	tvc	icc_or_xcc, %r0 + 49
	.word 0x8c012001  ! 2306: ADD_I	add 	%r4, 0x0001, %r6
	.word 0x81982bd1  ! 2307: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bd1, %hpstate
	.word 0x896a0002  ! 2308: SDIVX_R	sdivx	%r8, %r2, %r4
	.word 0x89d02030  ! 2309: Tcc_I	tleu	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9969e001  ! 2311: SDIVX_I	sdivx	%r7, 0x0001, %r12
	.word 0x81982bc0  ! 2312: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc0, %hpstate
	.word 0x86684002  ! 2313: UDIVX_R	udivx 	%r1, %r2, %r3
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81982e12  ! 2315: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e12, %hpstate
	.word 0x8fd02033  ! 2316: Tcc_I	tvs	icc_or_xcc, %r0 + 51
	.word 0x819820d8  ! 2317: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00d8, %hpstate
DS_123:
	.word 0x22800001  ! 2319: BE	be,a	<label_0x1>
	.word 0xd933a001  ! 2319: STQF_I	-	%f12, [0x0001, %r14]
	.word 0x97458000  ! 2318: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0x92d26001  ! 2319: UMULcc_I	umulcc 	%r9, 0x0001, %r9
	.word 0x87d02030  ! 2320: Tcc_I	tl	icc_or_xcc, %r0 + 48
	.word 0x93d02035  ! 2321: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x20800001  ! 2322: BN	bn,a	<label_0x1>
	.word 0x81982ec0  ! 2323: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ec0, %hpstate
	.word 0x81982f47  ! 2324: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f47, %hpstate
	.word 0x8d9022d2  ! 2325: WRPR_PSTATE_I	wrpr	%r0, 0x02d2, %pstate
DS_124:
	.word 0x32800001  ! 2327: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x87b2830a  ! 2326: ALLIGNADDRESS	alignaddr	%r10, %r10, %r3
	.word 0x3c700001  ! 2327: BPPOS	<illegal instruction>
	.word 0xc6d804a0  ! 2328: LDXA_R	ldxa	[%r0, %r0] 0x25, %r3
	.word 0x8d802000  ! 2329: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc67fe001  ! 2330: SWAP_I	swap	%r3, [%r31 + 0x0001]
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d902681  ! 2332: WRPR_PSTATE_I	wrpr	%r0, 0x0681, %pstate
	.word 0x8d902e49  ! 2333: WRPR_PSTATE_I	wrpr	%r0, 0x0e49, %pstate
	mov 0x33, %r30
	.word 0x8dd0001e  ! 2334: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x91a2cd2c  ! 2335: FsMULd	fsmuld	%f11, %f12, %f8
	.word 0x8d902e51  ! 2336: WRPR_PSTATE_I	wrpr	%r0, 0x0e51, %pstate
	.word 0x93a01a61  ! 2337: FqTOi	fqtoi	
	.word 0x99d02030  ! 2338: Tcc_I	tgu	icc_or_xcc, %r0 + 48
	.word 0xd29004a0  ! 2339: LDUHA_R	lduha	[%r0, %r0] 0x25, %r9
	.word 0x8d902219  ! 2340: WRPR_PSTATE_I	wrpr	%r0, 0x0219, %pstate
	.word 0x819828c9  ! 2341: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c9, %hpstate
	.word 0x8eda0006  ! 2342: SMULcc_R	smulcc 	%r8, %r6, %r7
	.word 0xce0fe001  ! 2343: LDUB_I	ldub	[%r31 + 0x0001], %r7
	.word 0x8d902402  ! 2344: WRPR_PSTATE_I	wrpr	%r0, 0x0402, %pstate
	.word 0x8d9028cf  ! 2345: WRPR_PSTATE_I	wrpr	%r0, 0x08cf, %pstate
	.word 0x81982ed2  ! 2346: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed2, %hpstate
	.word 0x8a824003  ! 2347: ADDcc_R	addcc 	%r9, %r3, %r5
	.word 0x8f68a001  ! 2348: SDIVX_I	sdivx	%r2, 0x0001, %r7
	.word 0xcf3fe001  ! 2349: STDF_I	std	%f7, [0x0001, %r31]
	.word 0x81982bd5  ! 2350: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bd5, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xcecfe000  ! 2352: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r7
	ta	T_CHANGE_NONHPRIV	! macro
DS_125:
	.word 0x22800001  ! 2355: BE	be,a	<label_0x1>
	.word 0xc330e001  ! 2355: STQF_I	-	%f1, [0x0001, %r3]
	.word 0x93458000  ! 2354: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x90d32001  ! 2355: UMULcc_I	umulcc 	%r12, 0x0001, %r8
	.word 0xd0d80e40  ! 2356: LDXA_R	ldxa	[%r0, %r0] 0x72, %r8
	.word 0x36700001  ! 2357: BPGE	<illegal instruction>
	.word 0x32800001  ! 2358: BNE	bne,a	<label_0x1>
	.word 0x86530008  ! 2359: UMUL_R	umul 	%r12, %r8, %r3
	.word 0x8d902ec2  ! 2360: WRPR_PSTATE_I	wrpr	%r0, 0x0ec2, %pstate
	.word 0x804b0000  ! 2361: MULX_R	mulx 	%r12, %r0, %r0
	.word 0x81982a99  ! 2362: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a99, %hpstate
	.word 0xc007c000  ! 2363: LDUW_R	lduw	[%r31 + %r0], %r0
	.word 0xc07fe001  ! 2364: SWAP_I	swap	%r0, [%r31 + 0x0001]
	.word 0x8da000c1  ! 2365: FNEGd	fnegd	%f32, %f6
DS_126:
	.word 0x32800001  ! 2367: BNE	bne,a	<label_0x1>
	.word 0xc731400c  ! 2367: STQF_R	-	%f3, [%r12, %r5]
	.word 0x99458000  ! 2366: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x8d90221b  ! 2367: WRPR_PSTATE_I	wrpr	%r0, 0x021b, %pstate
	.word 0xd8dfe020  ! 2368: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r12
	.word 0x93d02031  ! 2369: Tcc_I	tne	icc_or_xcc, %r0 + 49
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d902cd9  ! 2371: WRPR_PSTATE_I	wrpr	%r0, 0x0cd9, %pstate
	.word 0x81982005  ! 2372: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0005, %hpstate
	.word 0x806a800e  ! 2373: UDIVX_R	udivx 	%r10, %r14, %r0
	.word 0x99a109c2  ! 2374: FDIVd	fdivd	%f4, %f2, %f12
DS_127:
	.word 0x22800001  ! 2376: BE	be,a	<label_0x1>
	illtrap
	.word 0x91b3430d  ! 2375: ALLIGNADDRESS	alignaddr	%r13, %r13, %r8
	.word 0xd097e000  ! 2376: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r8
	.word 0x93a0054c  ! 2377: FSQRTd	fsqrt	
	.word 0x8198241d  ! 2378: WRHPR_HPSTATE_I	wrhpr	%r0, 0x041d, %hpstate
	.word 0x8d902687  ! 2379: WRPR_PSTATE_I	wrpr	%r0, 0x0687, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x32800001  ! 2381: BNE	bne,a	<label_0x1>
	.word 0x8d802000  ! 2382: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd337c00c  ! 2383: STQF_R	-	%f9, [%r12, %r31]
	.word 0x81982b1d  ! 2384: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b1d, %hpstate
	.word 0xd327c00c  ! 2385: STF_R	st	%f9, [%r12, %r31]
	mov 0x35, %r30
	.word 0x97d0001e  ! 2386: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	mov 0x35, %r30
	.word 0x93d0001e  ! 2387: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x32700001  ! 2388: BPNE	<illegal instruction>
	mov 0x34, %r30
	.word 0x91d0001e  ! 2389: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_128:
	.word 0x20800001  ! 2391: BN	bn,a	<label_0x1>
	.word 0xd330800a  ! 2391: STQF_R	-	%f9, [%r10, %r2]
	.word 0x91458000  ! 2390: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x86c26001  ! 2391: ADDCcc_I	addccc 	%r9, 0x0001, %r3
	.word 0xc6c7e030  ! 2392: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r3
	.word 0x83d02032  ! 2393: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x86d2c005  ! 2394: UMULcc_R	umulcc 	%r11, %r5, %r3
	.word 0x81d02032  ! 2395: Tcc_I	tn	icc_or_xcc, %r0 + 50
	.word 0xc60fe001  ! 2396: LDUB_I	ldub	[%r31 + 0x0001], %r3
	.word 0x8d902e0a  ! 2397: WRPR_PSTATE_I	wrpr	%r0, 0x0e0a, %pstate
	.word 0x8d802000  ! 2398: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x98786001  ! 2399: SDIV_I	sdiv 	%r1, 0x0001, %r12
	.word 0x87802088  ! 2400: WRASI_I	wr	%r0, 0x0088, %asi
DS_129:
	.word 0x20800001  ! 2402: BN	bn,a	<label_0x1>
	illtrap
	.word 0x83b00309  ! 2401: ALLIGNADDRESS	alignaddr	%r0, %r9, %r1
	.word 0x81982b55  ! 2402: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b55, %hpstate
	.word 0x8198279f  ! 2403: WRHPR_HPSTATE_I	wrhpr	%r0, 0x079f, %hpstate
	.word 0xc2800c60  ! 2404: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r1
	.word 0x81982789  ! 2405: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0789, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0xc28fe030  ! 2407: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r1
	.word 0x9dd02032  ! 2408: Tcc_I	tpos	icc_or_xcc, %r0 + 50
DS_130:
	.word 0x22800001  ! 2410: BE	be,a	<label_0x1>
	.word 0xdf32800f  ! 2410: STQF_R	-	%f15, [%r15, %r10]
	.word 0x89458000  ! 2409: RD_SOFTINT_REG	rd	%softint, %r4
	.word 0x8bd02034  ! 2410: Tcc_I	tcs	icc_or_xcc, %r0 + 52
	.word 0xc88008a0  ! 2411: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
	.word 0x85508000  ! 2412: RDPR_TSTATE	rdpr	%tstate, %r2
	.word 0x9879c002  ! 2413: SDIV_R	sdiv 	%r7, %r2, %r12
	.word 0x87802014  ! 2414: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x8d902089  ! 2415: WRPR_PSTATE_I	wrpr	%r0, 0x0089, %pstate
	.word 0xd8cfe000  ! 2416: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r12
	.word 0x81982dc7  ! 2417: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dc7, %hpstate
	.word 0x8d9026c7  ! 2418: WRPR_PSTATE_I	wrpr	%r0, 0x06c7, %pstate
	.word 0xd9e7c022  ! 2419: CASA_I	casa	[%r31] 0x 1, %r2, %r12
	.word 0x9b508000  ! 2420: RDPR_TSTATE	rdpr	%tstate, %r13
	.word 0x8d902812  ! 2421: WRPR_PSTATE_I	wrpr	%r0, 0x0812, %pstate
	.word 0x8d802004  ! 2422: WRFPRS_I	wr	%r0, 0x0004, %fprs
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81982402  ! 2424: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0402, %hpstate
	.word 0x81982cde  ! 2425: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cde, %hpstate
	.word 0x91a00563  ! 2426: FSQRTq	fsqrt	
	.word 0x95504000  ! 2427: RDPR_TNPC	rdpr	%tnpc, %r10
	.word 0x9469e001  ! 2428: UDIVX_I	udivx 	%r7, 0x0001, %r10
	.word 0xd4800c60  ! 2429: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r10
	.word 0x8fa000c3  ! 2430: FNEGd	fnegd	%f34, %f38
	.word 0x99a20d2e  ! 2431: FsMULd	fsmuld	%f8, %f14, %f12
	.word 0xd8c804a0  ! 2432: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
	.word 0x8d802000  ! 2433: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982a5c  ! 2434: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a5c, %hpstate
	.word 0xd8c804a0  ! 2435: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
	.word 0x8d802000  ! 2436: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd88fe010  ! 2437: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r12
	mov 0x32, %r30
	.word 0x8dd0001e  ! 2438: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x8cd88003  ! 2439: SMULcc_R	smulcc 	%r2, %r3, %r6
	mov 0x35, %r30
	.word 0x83d0001e  ! 2440: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xcc880e60  ! 2441: LDUBA_R	lduba	[%r0, %r0] 0x73, %r6
DS_131:
	.word 0x34800001  ! 2443: BG	bg,a	<label_0x1>
	illtrap
	.word 0x8db3c30d  ! 2442: ALLIGNADDRESS	alignaddr	%r15, %r13, %r6
	.word 0x2c800001  ! 2443: BNEG	bneg,a	<label_0x1>
	.word 0x819824cb  ! 2444: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04cb, %hpstate
	.word 0x90484009  ! 2445: MULX_R	mulx 	%r1, %r9, %r8
	.word 0xd08008a0  ! 2446: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0x81982d91  ! 2447: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d91, %hpstate
	.word 0x80838004  ! 2448: ADDcc_R	addcc 	%r14, %r4, %r0
DS_132:
	.word 0x32800001  ! 2450: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x81b2c309  ! 2449: ALLIGNADDRESS	alignaddr	%r11, %r9, %r0
	.word 0x8d802000  ! 2450: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc037c009  ! 2451: STH_R	sth	%r0, [%r31 + %r9]
	.word 0x9351c000  ! 2452: RDPR_TL	rdpr	%tl, %r9
	.word 0x81982848  ! 2453: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0848, %hpstate
	.word 0x9268800b  ! 2454: UDIVX_R	udivx 	%r2, %r11, %r9
	.word 0x9679000a  ! 2455: SDIV_R	sdiv 	%r4, %r10, %r11
	.word 0x9800a001  ! 2456: ADD_I	add 	%r2, 0x0001, %r12
	.word 0x8d902e58  ! 2457: WRPR_PSTATE_I	wrpr	%r0, 0x0e58, %pstate
	.word 0x95508000  ! 2458: RDPR_TSTATE	rdpr	%tstate, %r10
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd437c00a  ! 2460: STH_R	sth	%r10, [%r31 + %r10]
	.word 0x81982902  ! 2461: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0902, %hpstate
	.word 0x844aa001  ! 2462: MULX_I	mulx 	%r10, 0x0001, %r2
	.word 0xc517c000  ! 2463: LDQF_R	-	[%r31, %r0], %f2
	.word 0x8d902e9b  ! 2464: WRPR_PSTATE_I	wrpr	%r0, 0x0e9b, %pstate
	.word 0xc407e001  ! 2465: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0x8c51c000  ! 2466: UMUL_R	umul 	%r7, %r0, %r6
	.word 0x99a2cd27  ! 2467: FsMULd	fsmuld	%f11, %f38, %f12
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x8e7b2001  ! 2470: SDIV_I	sdiv 	%r12, 0x0001, %r7
	.word 0xcfe7c027  ! 2471: CASA_I	casa	[%r31] 0x 1, %r7, %r7
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d802000  ! 2473: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87500000  ! 2474: RDPR_TPC	rdpr	%tpc, %r3
	.word 0xc6dfe030  ! 2475: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r3
	.word 0x8da089cd  ! 2476: FDIVd	fdivd	%f2, %f44, %f6
	.word 0x8a82000c  ! 2477: ADDcc_R	addcc 	%r8, %r12, %r5
	mov 0x34, %r30
	.word 0x9dd0001e  ! 2478: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x8198238b  ! 2479: WRHPR_HPSTATE_I	wrhpr	%r0, 0x038b, %hpstate
	.word 0xcaffc02c  ! 2480: SWAPA_R	swapa	%r5, [%r31 + %r12] 0x01
	.word 0xcb27e001  ! 2481: STF_I	st	%f5, [0x0001, %r31]
	.word 0x8d802004  ! 2482: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x904a400e  ! 2483: MULX_R	mulx 	%r9, %r14, %r8
	.word 0x8d902a49  ! 2484: WRPR_PSTATE_I	wrpr	%r0, 0x0a49, %pstate
	.word 0x81982e83  ! 2485: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e83, %hpstate
	.word 0x9e696001  ! 2486: UDIVX_I	udivx 	%r5, 0x0001, %r15
	.word 0x24700001  ! 2487: BPLE	<illegal instruction>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8ba1c9ef  ! 2489: FDIVq	dis not found

	.word 0x8d802000  ! 2490: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xca9fe001  ! 2491: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r5
	mov 0x32, %r30
	.word 0x91d0001e  ! 2492: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d9020d7  ! 2493: WRPR_PSTATE_I	wrpr	%r0, 0x00d7, %pstate
	.word 0xca8008a0  ! 2494: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0xcb3fe001  ! 2495: STDF_I	std	%f5, [0x0001, %r31]
	.word 0x8bd02031  ! 2496: Tcc_I	tcs	icc_or_xcc, %r0 + 49
	mov 0x34, %r30
	.word 0x93d0001e  ! 2497: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x99d02030  ! 2498: Tcc_I	tgu	icc_or_xcc, %r0 + 48
	.word 0xca7fe001  ! 2499: SWAP_I	swap	%r5, [%r31 + 0x0001]
	.word 0x9d500000  ! 2500: RDPR_TPC	rdpr	%tpc, %r14
	.word 0x8d802004  ! 2501: WRFPRS_I	wr	%r0, 0x0004, %fprs
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
DS_133:
	.word 0x32800001  ! 2505: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x9fb1c300  ! 2504: ALLIGNADDRESS	alignaddr	%r7, %r0, %r15
	.word 0x8d902448  ! 2505: WRPR_PSTATE_I	wrpr	%r0, 0x0448, %pstate
	.word 0x8198245f  ! 2506: WRHPR_HPSTATE_I	wrhpr	%r0, 0x045f, %hpstate
	.word 0x87802016  ! 2507: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8d902e17  ! 2508: WRPR_PSTATE_I	wrpr	%r0, 0x0e17, %pstate
	.word 0x9c794009  ! 2509: SDIV_R	sdiv 	%r5, %r9, %r14
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8a78e001  ! 2511: SDIV_I	sdiv 	%r3, 0x0001, %r5
DS_134:
	.word 0x22800001  ! 2513: BE	be,a	<label_0x1>
	.word 0xcb332001  ! 2513: STQF_I	-	%f5, [0x0001, %r12]
	.word 0x9d458000  ! 2512: RD_SOFTINT_REG	rd	%softint, %r14
	ta	T_CHANGE_PRIV	! macro
	.word 0x36700001  ! 2514: BPGE	<illegal instruction>
DS_135:
	.word 0x32800001  ! 2516: BNE	bne,a	<label_0x1>
	.word 0xd731c005  ! 2516: STQF_R	-	%f11, [%r5, %r7]
	.word 0x81458000  ! 2515: RD_SOFTINT_REG	stbar
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d902208  ! 2517: WRPR_PSTATE_I	wrpr	%r0, 0x0208, %pstate
	.word 0x34700001  ! 2518: BPG	<illegal instruction>
	.word 0x81982e89  ! 2519: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e89, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x93a000c6  ! 2521: FNEGd	fnegd	%f6, %f40
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d802004  ! 2525: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd2d804a0  ! 2526: LDXA_R	ldxa	[%r0, %r0] 0x25, %r9
	.word 0x844be001  ! 2527: MULX_I	mulx 	%r15, 0x0001, %r2
DS_136:
	.word 0x34800001  ! 2529: BG	bg,a	<label_0x1>
	illtrap
	.word 0x8db1c309  ! 2528: ALLIGNADDRESS	alignaddr	%r7, %r9, %r6
	.word 0x8d902003  ! 2529: WRPR_PSTATE_I	wrpr	%r0, 0x0003, %pstate
	.word 0x9469a001  ! 2530: UDIVX_I	udivx 	%r6, 0x0001, %r10
	.word 0xd53fc009  ! 2531: STDF_R	std	%f10, [%r9, %r31]
	.word 0x8d902e90  ! 2532: WRPR_PSTATE_I	wrpr	%r0, 0x0e90, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xd48804a0  ! 2534: LDUBA_R	lduba	[%r0, %r0] 0x25, %r10
	.word 0x81982b5c  ! 2535: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b5c, %hpstate
	.word 0xd44fc000  ! 2536: LDSB_R	ldsb	[%r31 + %r0], %r10
	.word 0x32800001  ! 2537: BNE	bne,a	<label_0x1>
	.word 0x8d902eca  ! 2538: WRPR_PSTATE_I	wrpr	%r0, 0x0eca, %pstate
	mov 0x35, %r30
	.word 0x85d0001e  ! 2539: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d9020df  ! 2541: WRPR_PSTATE_I	wrpr	%r0, 0x00df, %pstate
	.word 0x8d802004  ! 2542: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x82db8003  ! 2543: SMULcc_R	smulcc 	%r14, %r3, %r1
	.word 0x8dd02031  ! 2544: Tcc_I	tneg	icc_or_xcc, %r0 + 49
	.word 0x8d90248f  ! 2545: WRPR_PSTATE_I	wrpr	%r0, 0x048f, %pstate
	.word 0x9bd02030  ! 2546: Tcc_I	tcc	icc_or_xcc, %r0 + 48
	.word 0x87802014  ! 2547: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xc3e7c023  ! 2548: CASA_I	casa	[%r31] 0x 1, %r3, %r1
	.word 0x8d9022c2  ! 2549: WRPR_PSTATE_I	wrpr	%r0, 0x02c2, %pstate
	.word 0x81982c47  ! 2550: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c47, %hpstate
	.word 0xc207e001  ! 2551: LDUW_I	lduw	[%r31 + 0x0001], %r1
	.word 0x8d902090  ! 2552: WRPR_PSTATE_I	wrpr	%r0, 0x0090, %pstate
	.word 0xc25fe001  ! 2553: LDX_I	ldx	[%r31 + 0x0001], %r1
	.word 0x8d90281d  ! 2554: WRPR_PSTATE_I	wrpr	%r0, 0x081d, %pstate
	.word 0x95508000  ! 2555: RDPR_TSTATE	rdpr	%tstate, %r10
	.word 0x8b51c000  ! 2556: RDPR_TL	rdpr	%tl, %r5
	.word 0x87802010  ! 2557: WRASI_I	wr	%r0, 0x0010, %asi
DS_137:
	.word 0x20800001  ! 2559: BN	bn,a	<label_0x1>
	.word 0xd131400a  ! 2559: STQF_R	-	%f8, [%r10, %r5]
	.word 0x99458000  ! 2558: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x864b8003  ! 2559: MULX_R	mulx 	%r14, %r3, %r3
	.word 0x8d902e07  ! 2560: WRPR_PSTATE_I	wrpr	%r0, 0x0e07, %pstate
	.word 0x91d02032  ! 2561: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xc68008a0  ! 2562: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x95504000  ! 2563: RDPR_TNPC	rdpr	%tnpc, %r10
	ta	T_CHANGE_PRIV	! macro
	.word 0x8ed30001  ! 2565: UMULcc_R	umulcc 	%r12, %r1, %r7
	.word 0x81d02033  ! 2566: Tcc_I	tn	icc_or_xcc, %r0 + 51
	.word 0x81a01a6c  ! 2567: FqTOi	fqtoi	
	.word 0x87802080  ! 2568: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x8e7bc004  ! 2569: SDIV_R	sdiv 	%r15, %r4, %r7
	.word 0x36800001  ! 2570: BGE	bge,a	<label_0x1>
	mov 0x35, %r30
	.word 0x9bd0001e  ! 2571: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x87802014  ! 2573: WRASI_I	wr	%r0, 0x0014, %asi
	mov 0x30, %r30
	.word 0x89d0001e  ! 2574: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x9ba00563  ! 2575: FSQRTq	fsqrt	
	.word 0x30700001  ! 2576: BPA	<illegal instruction>
	.word 0xdaffc023  ! 2577: SWAPA_R	swapa	%r13, [%r31 + %r3] 0x01
	.word 0x8d902400  ! 2578: WRPR_PSTATE_I	wrpr	%r0, 0x0400, %pstate
	.word 0x8198235c  ! 2579: WRHPR_HPSTATE_I	wrhpr	%r0, 0x035c, %hpstate
	.word 0x8e49c00d  ! 2580: MULX_R	mulx 	%r7, %r13, %r7
	.word 0x8569e001  ! 2581: SDIVX_I	sdivx	%r7, 0x0001, %r2
	.word 0x996ba001  ! 2582: SDIVX_I	sdivx	%r14, 0x0001, %r12
	.word 0x22700001  ! 2583: BPE	<illegal instruction>
	.word 0xd8d004a0  ! 2584: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r12
	.word 0xd89fe001  ! 2585: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r12
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8253c004  ! 2587: UMUL_R	umul 	%r15, %r4, %r1
	.word 0x8d902c8a  ! 2588: WRPR_PSTATE_I	wrpr	%r0, 0x0c8a, %pstate
	.word 0xc28fe000  ! 2589: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r1
	mov 0x31, %r30
	.word 0x95d0001e  ! 2590: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x9a81000f  ! 2591: ADDcc_R	addcc 	%r4, %r15, %r13
	.word 0x8d902603  ! 2592: WRPR_PSTATE_I	wrpr	%r0, 0x0603, %pstate
	.word 0x9b51c000  ! 2593: RDPR_TL	rdpr	%tl, %r13
	.word 0x8080000b  ! 2594: ADDcc_R	addcc 	%r0, %r11, %r0
	.word 0x9d480000  ! 2595: RDHPR_HPSTATE	rdhpr	%hpstate, %r14
	.word 0xdd37c00b  ! 2596: STQF_R	-	%f14, [%r11, %r31]
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x99500000  ! 2598: RDPR_TPC	rdpr	%tpc, %r12
	.word 0x8d902810  ! 2599: WRPR_PSTATE_I	wrpr	%r0, 0x0810, %pstate
	.word 0x8198255b  ! 2600: WRHPR_HPSTATE_I	wrhpr	%r0, 0x055b, %hpstate
	.word 0x8d9026c4  ! 2601: WRPR_PSTATE_I	wrpr	%r0, 0x06c4, %pstate
	.word 0xd89004a0  ! 2602: LDUHA_R	lduha	[%r0, %r0] 0x25, %r12
	.word 0x984a400b  ! 2603: MULX_R	mulx 	%r9, %r11, %r12
	.word 0x8d902c17  ! 2604: WRPR_PSTATE_I	wrpr	%r0, 0x0c17, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd8ffc02b  ! 2606: SWAPA_R	swapa	%r12, [%r31 + %r11] 0x01
	.word 0x819824d1  ! 2607: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04d1, %hpstate
	.word 0x8d9026c5  ! 2608: WRPR_PSTATE_I	wrpr	%r0, 0x06c5, %pstate
	.word 0xd937e001  ! 2609: STQF_I	-	%f12, [0x0001, %r31]
	.word 0x8d902c43  ! 2610: WRPR_PSTATE_I	wrpr	%r0, 0x0c43, %pstate
	.word 0x87802088  ! 2611: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8d802000  ! 2612: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d802000  ! 2613: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd8d004a0  ! 2614: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r12
	.word 0x9e520007  ! 2615: UMUL_R	umul 	%r8, %r7, %r15
	.word 0xdf27e001  ! 2616: STF_I	st	%f15, [0x0001, %r31]
	.word 0x83d02032  ! 2617: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x8d514000  ! 2618: RDPR_TBA	rdpr	%tba, %r6
	.word 0x87688001  ! 2619: SDIVX_R	sdivx	%r2, %r1, %r3
	.word 0x8b480000  ! 2620: RDHPR_HPSTATE	rdhpr	%hpstate, %r5
	.word 0x87d02032  ! 2621: Tcc_I	tl	icc_or_xcc, %r0 + 50
	.word 0x8d902098  ! 2622: WRPR_PSTATE_I	wrpr	%r0, 0x0098, %pstate
	.word 0x81982341  ! 2623: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0341, %hpstate
	.word 0x8d802000  ! 2624: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87802089  ! 2625: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xca8fe010  ! 2626: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r5
	.word 0x8c6a800c  ! 2627: UDIVX_R	udivx 	%r10, %r12, %r6
	.word 0x88c2a001  ! 2628: ADDCcc_I	addccc 	%r10, 0x0001, %r4
	.word 0x81982cda  ! 2629: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cda, %hpstate
	.word 0x8d902cdc  ! 2630: WRPR_PSTATE_I	wrpr	%r0, 0x0cdc, %pstate
	.word 0x87802004  ! 2631: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8dd02034  ! 2632: Tcc_I	tneg	icc_or_xcc, %r0 + 52
	.word 0x8d802000  ! 2633: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87a000c7  ! 2634: FNEGd	fnegd	%f38, %f34
	mov 0x30, %r30
	.word 0x95d0001e  ! 2635: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0xc647e001  ! 2636: LDSW_I	ldsw	[%r31 + 0x0001], %r3
	.word 0x94798004  ! 2637: SDIV_R	sdiv 	%r6, %r4, %r10
	.word 0xd43fc004  ! 2638: STD_R	std	%r10, [%r31 + %r4]
	.word 0xd4c804a0  ! 2639: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	.word 0x8d9028c5  ! 2640: WRPR_PSTATE_I	wrpr	%r0, 0x08c5, %pstate
	.word 0xd407c000  ! 2641: LDUW_R	lduw	[%r31 + %r0], %r10
	.word 0x38800001  ! 2642: BGU	bgu,a	<label_0x1>
	.word 0x9c500007  ! 2643: UMUL_R	umul 	%r0, %r7, %r14
	.word 0xdcdfe000  ! 2644: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r14
	.word 0xdc1fc000  ! 2645: LDD_R	ldd	[%r31 + %r0], %r14
	.word 0x97504000  ! 2646: RDPR_TNPC	rdpr	%tnpc, %r11
	.word 0x87802004  ! 2647: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x93684007  ! 2648: SDIVX_R	sdivx	%r1, %r7, %r9
	.word 0x8d902a01  ! 2649: WRPR_PSTATE_I	wrpr	%r0, 0x0a01, %pstate
DS_138:
	.word 0x20800001  ! 2651: BN	bn,a	<label_0x1>
	.word 0xd733e001  ! 2651: STQF_I	-	%f11, [0x0001, %r15]
	.word 0x83458000  ! 2650: RD_SOFTINT_REG	rd	%softint, %r1
	.word 0x81982f48  ! 2651: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f48, %hpstate
	mov 0x32, %r30
	.word 0x95d0001e  ! 2652: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	mov 0x33, %r30
	.word 0x93d0001e  ! 2653: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x9d504000  ! 2654: RDPR_TNPC	rdpr	%tnpc, %r14
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x3c700001  ! 2656: BPPOS	<illegal instruction>
	.word 0x92c1a001  ! 2657: ADDCcc_I	addccc 	%r6, 0x0001, %r9
	.word 0x87684001  ! 2658: SDIVX_R	sdivx	%r1, %r1, %r3
	.word 0x81982480  ! 2659: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0480, %hpstate
	.word 0x8d902890  ! 2660: WRPR_PSTATE_I	wrpr	%r0, 0x0890, %pstate
	mov 0x35, %r30
	.word 0x87d0001e  ! 2661: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	mov 0x32, %r30
	.word 0x99d0001e  ! 2663: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x8d9026da  ! 2664: WRPR_PSTATE_I	wrpr	%r0, 0x06da, %pstate
	.word 0xc6bfc021  ! 2665: STDA_R	stda	%r3, [%r31 + %r1] 0x01
	mov 0x35, %r30
	.word 0x89d0001e  ! 2666: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	mov 0x32, %r30
	.word 0x8bd0001e  ! 2667: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x8d802004  ! 2668: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xc68008a0  ! 2669: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xc68804a0  ! 2671: LDUBA_R	lduba	[%r0, %r0] 0x25, %r3
	.word 0xc68008a0  ! 2672: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x22800001  ! 2673: BE	be,a	<label_0x1>
	.word 0x96d1a001  ! 2674: UMULcc_I	umulcc 	%r6, 0x0001, %r11
	.word 0x9cd3a001  ! 2675: UMULcc_I	umulcc 	%r14, 0x0001, %r14
DS_139:
	.word 0x20800001  ! 2677: BN	bn,a	<label_0x1>
	illtrap
	.word 0x81b1830c  ! 2676: ALLIGNADDRESS	alignaddr	%r6, %r12, %r0
	.word 0x8cd26001  ! 2677: UMULcc_I	umulcc 	%r9, 0x0001, %r6
	.word 0x89a01a64  ! 2678: FqTOi	fqtoi	
	.word 0x85508000  ! 2679: RDPR_TSTATE	rdpr	%tstate, %r2
	.word 0x8d802004  ! 2680: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x28700001  ! 2681: BPLEU	<illegal instruction>
	.word 0x8d902c08  ! 2682: WRPR_PSTATE_I	wrpr	%r0, 0x0c08, %pstate
	.word 0x8d802004  ! 2683: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x81982908  ! 2684: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0908, %hpstate
	.word 0x81982ed2  ! 2685: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed2, %hpstate
	.word 0x8d90265d  ! 2686: WRPR_PSTATE_I	wrpr	%r0, 0x065d, %pstate
	.word 0x9ad9400b  ! 2687: SMULcc_R	smulcc 	%r5, %r11, %r13
	.word 0x8d902410  ! 2688: WRPR_PSTATE_I	wrpr	%r0, 0x0410, %pstate
	.word 0xdaffc02b  ! 2689: SWAPA_R	swapa	%r13, [%r31 + %r11] 0x01
	.word 0xda7fe001  ! 2690: SWAP_I	swap	%r13, [%r31 + 0x0001]
	ta	T_CHANGE_PRIV	! macro
	.word 0x95a000cb  ! 2692: FNEGd	fnegd	%f42, %f10
DS_140:
	.word 0x22800001  ! 2694: BE	be,a	<label_0x1>
	illtrap
	.word 0x8db3c309  ! 2693: ALLIGNADDRESS	alignaddr	%r15, %r9, %r6
	.word 0xccd00e80  ! 2694: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r6
	.word 0x87802004  ! 2695: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xcc8804a0  ! 2696: LDUBA_R	lduba	[%r0, %r0] 0x25, %r6
	.word 0x91d02030  ! 2697: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x924ba001  ! 2698: MULX_I	mulx 	%r14, 0x0001, %r9
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x819828c1  ! 2700: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c1, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd3e7c029  ! 2702: CASA_I	casa	[%r31] 0x 1, %r9, %r9
	.word 0x99a000cb  ! 2703: FNEGd	fnegd	%f42, %f12
	.word 0x87802004  ! 2704: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xd837e001  ! 2705: STH_I	sth	%r12, [%r31 + 0x0001]
	.word 0x93d02031  ! 2706: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x819829dc  ! 2707: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09dc, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xd8d004a0  ! 2709: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r12
	.word 0x9fa389a4  ! 2710: FDIVs	fdivs	%f14, %f4, %f15
	.word 0x8d902a57  ! 2711: WRPR_PSTATE_I	wrpr	%r0, 0x0a57, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xdeffc024  ! 2713: SWAPA_R	swapa	%r15, [%r31 + %r4] 0x01
	.word 0x81982408  ! 2714: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0408, %hpstate
	.word 0x8d9026d3  ! 2715: WRPR_PSTATE_I	wrpr	%r0, 0x06d3, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x8198299a  ! 2717: WRHPR_HPSTATE_I	wrhpr	%r0, 0x099a, %hpstate
	.word 0x85d02030  ! 2718: Tcc_I	tle	icc_or_xcc, %r0 + 48
	.word 0x8fa009a8  ! 2719: FDIVs	fdivs	%f0, %f8, %f7
	.word 0x8198281d  ! 2720: WRHPR_HPSTATE_I	wrhpr	%r0, 0x081d, %hpstate
	.word 0x8d9022d5  ! 2721: WRPR_PSTATE_I	wrpr	%r0, 0x02d5, %pstate
	.word 0x8d902696  ! 2722: WRPR_PSTATE_I	wrpr	%r0, 0x0696, %pstate
	.word 0x8283400f  ! 2723: ADDcc_R	addcc 	%r13, %r15, %r1
	.word 0xc3e7c02f  ! 2724: CASA_I	casa	[%r31] 0x 1, %r15, %r1
	.word 0xc28fe030  ! 2725: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r1
	.word 0x8d902289  ! 2726: WRPR_PSTATE_I	wrpr	%r0, 0x0289, %pstate
	.word 0x83d02034  ! 2727: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x2c700001  ! 2728: BPNEG	<illegal instruction>
	mov 0x32, %r30
	.word 0x8bd0001e  ! 2729: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	mov 0x33, %r30
	.word 0x8dd0001e  ! 2730: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x81982f47  ! 2731: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f47, %hpstate
	.word 0x8b690007  ! 2732: SDIVX_R	sdivx	%r4, %r7, %r5
	.word 0xca1fc000  ! 2733: LDD_R	ldd	[%r31 + %r0], %r5
DS_141:
	.word 0x32800001  ! 2735: BNE	bne,a	<label_0x1>
	.word 0xd7304004  ! 2735: STQF_R	-	%f11, [%r4, %r1]
	.word 0x9b458000  ! 2734: RD_SOFTINT_REG	rd	%softint, %r13
DS_142:
	.word 0x20800001  ! 2736: BN	bn,a	<label_0x1>
	illtrap
	.word 0x95b10304  ! 2735: ALLIGNADDRESS	alignaddr	%r4, %r4, %r10
	.word 0x87d02035  ! 2736: Tcc_I	tl	icc_or_xcc, %r0 + 53
	.word 0x8750c000  ! 2737: RDPR_TT	rdpr	%tt, %r3
	.word 0xc6d00e80  ! 2738: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r3
	mov 0x32, %r30
	.word 0x87d0001e  ! 2739: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x8d902042  ! 2740: WRPR_PSTATE_I	wrpr	%r0, 0x0042, %pstate
	.word 0x81982a92  ! 2741: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a92, %hpstate
	.word 0x987b400c  ! 2742: SDIV_R	sdiv 	%r13, %r12, %r12
DS_143:
	.word 0x22800001  ! 2744: BE	be,a	<label_0x1>
	.word 0xdf30e001  ! 2744: STQF_I	-	%f15, [0x0001, %r3]
	.word 0x83458000  ! 2743: RD_SOFTINT_REG	rd	%softint, %r1
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9da309c9  ! 2745: FDIVd	fdivd	%f12, %f40, %f14
	.word 0x81982192  ! 2746: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0192, %hpstate
	.word 0x8d902c57  ! 2747: WRPR_PSTATE_I	wrpr	%r0, 0x0c57, %pstate
	.word 0x806a800e  ! 2748: UDIVX_R	udivx 	%r10, %r14, %r0
	.word 0x8d902847  ! 2749: WRPR_PSTATE_I	wrpr	%r0, 0x0847, %pstate
	.word 0x81982b16  ! 2750: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b16, %hpstate
	.word 0x8d9020ca  ! 2751: WRPR_PSTATE_I	wrpr	%r0, 0x00ca, %pstate
	.word 0x9ac1a001  ! 2752: ADDCcc_I	addccc 	%r6, 0x0001, %r13
	.word 0x9550c000  ! 2753: RDPR_TT	rdpr	%tt, %r10
	.word 0x81982191  ! 2754: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0191, %hpstate
	.word 0xd47fe001  ! 2755: SWAP_I	swap	%r10, [%r31 + 0x0001]
	.word 0x806a4005  ! 2756: UDIVX_R	udivx 	%r9, %r5, %r0
	.word 0x81982e06  ! 2757: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e06, %hpstate
	.word 0x926a400a  ! 2758: UDIVX_R	udivx 	%r9, %r10, %r9
	.word 0x8d802000  ! 2759: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982444  ! 2760: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0444, %hpstate
	.word 0x8d802000  ! 2761: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87802014  ! 2762: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x81982f42  ! 2763: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f42, %hpstate
	.word 0x93a289c2  ! 2764: FDIVd	fdivd	%f10, %f2, %f40
	.word 0xd29004a0  ! 2765: LDUHA_R	lduha	[%r0, %r0] 0x25, %r9
	.word 0xd3e7c022  ! 2766: CASA_I	casa	[%r31] 0x 1, %r2, %r9
	.word 0x9a832001  ! 2767: ADDcc_I	addcc 	%r12, 0x0001, %r13
	mov 0x30, %r30
	.word 0x8dd0001e  ! 2768: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x85a20d2e  ! 2769: FsMULd	fsmuld	%f8, %f14, %f2
	.word 0x90d14009  ! 2770: UMULcc_R	umulcc 	%r5, %r9, %r8
	.word 0x81982298  ! 2771: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0298, %hpstate
	.word 0xd0bfe001  ! 2772: STDA_I	stda	%r8, [%r31 + 0x0001] %asi
	.word 0xd007c000  ! 2773: LDUW_R	lduw	[%r31 + %r0], %r8
	.word 0x81982b17  ! 2774: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b17, %hpstate
	.word 0x986bc00e  ! 2775: UDIVX_R	udivx 	%r15, %r14, %r12
	.word 0xd88008a0  ! 2776: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0xd88008a0  ! 2777: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
DS_144:
	.word 0x22800001  ! 2779: BE	be,a	<label_0x1>
	illtrap
	.word 0x8bb18300  ! 2778: ALLIGNADDRESS	alignaddr	%r6, %r0, %r5
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x81982a16  ! 2780: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a16, %hpstate
	.word 0x38700001  ! 2781: BPGU	<illegal instruction>
	.word 0xca800bc0  ! 2782: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r5
	.word 0x34800001  ! 2783: BG	bg,a	<label_0x1>
	.word 0x28700001  ! 2784: BPLEU	<illegal instruction>
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x2e800001  ! 2786: BVS	bvs,a	<label_0x1>
	.word 0x9049a001  ! 2787: MULX_I	mulx 	%r6, 0x0001, %r8
	.word 0xd0c804a0  ! 2788: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r8
DS_145:
	.word 0x32800001  ! 2790: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x85b0030c  ! 2789: ALLIGNADDRESS	alignaddr	%r0, %r12, %r2
	.word 0x9f51c000  ! 2790: RDPR_TL	rdpr	%tl, %r15
	.word 0x819823d1  ! 2791: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03d1, %hpstate
	.word 0x20700001  ! 2792: BPN	<illegal instruction>
	.word 0x8d802000  ! 2793: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x846aa001  ! 2794: UDIVX_I	udivx 	%r10, 0x0001, %r2
	.word 0xc4ffc02c  ! 2795: SWAPA_R	swapa	%r2, [%r31 + %r12] 0x01
	.word 0x8d692001  ! 2796: SDIVX_I	sdivx	%r4, 0x0001, %r6
	.word 0xcccfe030  ! 2797: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r6
	.word 0x30800001  ! 2798: BA	ba,a	<label_0x1>
	.word 0x87802004  ! 2799: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xccffc02c  ! 2800: SWAPA_R	swapa	%r6, [%r31 + %r12] 0x01
	mov 0x34, %r30
	.word 0x93d0001e  ! 2801: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xcc5fc000  ! 2802: LDX_R	ldx	[%r31 + %r0], %r6
	.word 0xccd7e030  ! 2803: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r6
	.word 0x87802004  ! 2804: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87d02030  ! 2805: Tcc_I	tl	icc_or_xcc, %r0 + 48
	.word 0x8d902a07  ! 2806: WRPR_PSTATE_I	wrpr	%r0, 0x0a07, %pstate
	.word 0xcc7fe001  ! 2807: SWAP_I	swap	%r6, [%r31 + 0x0001]
	.word 0x81982cd6  ! 2808: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd6, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x9cda400e  ! 2810: SMULcc_R	smulcc 	%r9, %r14, %r14
	.word 0x8d802004  ! 2811: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d902859  ! 2812: WRPR_PSTATE_I	wrpr	%r0, 0x0859, %pstate
	.word 0x8069c001  ! 2813: UDIVX_R	udivx 	%r7, %r1, %r0
	.word 0x8d802000  ! 2814: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d90220e  ! 2815: WRPR_PSTATE_I	wrpr	%r0, 0x020e, %pstate
	.word 0x98c1a001  ! 2816: ADDCcc_I	addccc 	%r6, 0x0001, %r12
	.word 0x8d902648  ! 2817: WRPR_PSTATE_I	wrpr	%r0, 0x0648, %pstate
	.word 0x8d902c8a  ! 2818: WRPR_PSTATE_I	wrpr	%r0, 0x0c8a, %pstate
	.word 0x81982647  ! 2819: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0647, %hpstate
	.word 0xd87fe001  ! 2820: SWAP_I	swap	%r12, [%r31 + 0x0001]
	.word 0xd88008a0  ! 2821: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0xd8dfe020  ! 2822: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r12
	.word 0x3e800001  ! 2823: BVC	bvc,a	<label_0x1>
DS_146:
	.word 0x20800001  ! 2825: BN	bn,a	<label_0x1>
	illtrap
	.word 0x83b0030d  ! 2824: ALLIGNADDRESS	alignaddr	%r0, %r13, %r1
	.word 0x819823d5  ! 2825: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03d5, %hpstate
	.word 0x81982614  ! 2826: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0614, %hpstate
	.word 0x81982c1a  ! 2827: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c1a, %hpstate
	mov 0x34, %r30
	.word 0x91d0001e  ! 2828: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	mov 0x34, %r30
	.word 0x99d0001e  ! 2829: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0xc247c000  ! 2830: LDSW_R	ldsw	[%r31 + %r0], %r1
	.word 0x8198251c  ! 2831: WRHPR_HPSTATE_I	wrhpr	%r0, 0x051c, %hpstate
	mov 0x30, %r30
	.word 0x9fd0001e  ! 2832: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x9e69e001  ! 2833: UDIVX_I	udivx 	%r7, 0x0001, %r15
	.word 0xded804a0  ! 2834: LDXA_R	ldxa	[%r0, %r0] 0x25, %r15
	.word 0x90012001  ! 2835: ADD_I	add 	%r4, 0x0001, %r8
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9803a001  ! 2838: ADD_I	add 	%r14, 0x0001, %r12
	.word 0x91d02034  ! 2839: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xd88fe000  ! 2840: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r12
	.word 0xd88008a0  ! 2841: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x81982716  ! 2842: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0716, %hpstate
	.word 0xd88008a0  ! 2843: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0xd877e001  ! 2844: STX_I	stx	%r12, [%r31 + 0x0001]
	ta	T_CHANGE_PRIV	! macro
	.word 0xd8d804a0  ! 2846: LDXA_R	ldxa	[%r0, %r0] 0x25, %r12
	.word 0x8d902a45  ! 2847: WRPR_PSTATE_I	wrpr	%r0, 0x0a45, %pstate
	.word 0xd81fe001  ! 2848: LDD_I	ldd	[%r31 + 0x0001], %r12
	.word 0x82d2a001  ! 2849: UMULcc_I	umulcc 	%r10, 0x0001, %r1
	.word 0x907a8001  ! 2850: SDIV_R	sdiv 	%r10, %r1, %r8
	ta	T_CHANGE_PRIV	! macro
	.word 0xd0800c80  ! 2852: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r8
	.word 0x9cda4004  ! 2853: SMULcc_R	smulcc 	%r9, %r4, %r14
	.word 0x81982a15  ! 2854: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a15, %hpstate
	.word 0x85a0054b  ! 2855: FSQRTd	fsqrt	
	.word 0x95a00568  ! 2856: FSQRTq	fsqrt	
	.word 0xd597e001  ! 2857: LDQFA_I	-	[%r31, 0x0001], %f10
	.word 0x99494000  ! 2858: RDHPR_HTBA	rdhpr	%htba, %r12
	.word 0x8d902e19  ! 2859: WRPR_PSTATE_I	wrpr	%r0, 0x0e19, %pstate
	.word 0x87802010  ! 2860: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x9c784004  ! 2861: SDIV_R	sdiv 	%r1, %r4, %r14
	.word 0x8d9022da  ! 2862: WRPR_PSTATE_I	wrpr	%r0, 0x02da, %pstate
	.word 0x8d902881  ! 2863: WRPR_PSTATE_I	wrpr	%r0, 0x0881, %pstate
	.word 0xdd37c004  ! 2864: STQF_R	-	%f14, [%r4, %r31]
	.word 0x88db4002  ! 2865: SMULcc_R	smulcc 	%r13, %r2, %r4
	.word 0x8b508000  ! 2866: RDPR_TSTATE	rdpr	%tstate, %r5
	.word 0x8d902a86  ! 2867: WRPR_PSTATE_I	wrpr	%r0, 0x0a86, %pstate
	.word 0xca8fe010  ! 2868: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r5
	.word 0x81982adc  ! 2869: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0adc, %hpstate
	.word 0x81982dc1  ! 2870: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dc1, %hpstate
	.word 0x81d02033  ! 2871: Tcc_I	tn	icc_or_xcc, %r0 + 51
	.word 0x8d902242  ! 2872: WRPR_PSTATE_I	wrpr	%r0, 0x0242, %pstate
	.word 0x96488005  ! 2873: MULX_R	mulx 	%r2, %r5, %r11
	.word 0x99a01a6e  ! 2874: FqTOi	fqtoi	
	.word 0x81982494  ! 2875: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0494, %hpstate
	.word 0xd8c80e60  ! 2876: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r12
	.word 0x81982a44  ! 2877: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a44, %hpstate
	.word 0x87a0054e  ! 2878: FSQRTd	fsqrt	
	.word 0xc6c7e020  ! 2879: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r3
	.word 0x966a2001  ! 2880: UDIVX_I	udivx 	%r8, 0x0001, %r11
	.word 0x96da8003  ! 2881: SMULcc_R	smulcc 	%r10, %r3, %r11
	.word 0xd6ffc023  ! 2882: SWAPA_R	swapa	%r11, [%r31 + %r3] 0x01
	.word 0xd617c000  ! 2883: LDUH_R	lduh	[%r31 + %r0], %r11
	mov 0x30, %r30
	.word 0x93d0001e  ! 2884: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x819824cd  ! 2885: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04cd, %hpstate
DS_147:
	.word 0x20800001  ! 2887: BN	bn,a	<label_0x1>
	illtrap
	.word 0x99b1430c  ! 2886: ALLIGNADDRESS	alignaddr	%r5, %r12, %r12
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8450c008  ! 2888: UMUL_R	umul 	%r3, %r8, %r2
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d90280e  ! 2890: WRPR_PSTATE_I	wrpr	%r0, 0x080e, %pstate
	.word 0x8880000a  ! 2891: ADDcc_R	addcc 	%r0, %r10, %r4
	.word 0xc88fe000  ! 2892: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r4
	.word 0x8d902ed9  ! 2893: WRPR_PSTATE_I	wrpr	%r0, 0x0ed9, %pstate
	.word 0x90806001  ! 2894: ADDcc_I	addcc 	%r1, 0x0001, %r8
	.word 0x8d90244d  ! 2895: WRPR_PSTATE_I	wrpr	%r0, 0x044d, %pstate
	.word 0x8dd02030  ! 2896: Tcc_I	tneg	icc_or_xcc, %r0 + 48
	.word 0xd0800c80  ! 2897: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r8
	.word 0x8d802000  ! 2898: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd0cfe010  ! 2899: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r8
	.word 0x81982797  ! 2900: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0797, %hpstate
	.word 0x9068c009  ! 2901: UDIVX_R	udivx 	%r3, %r9, %r8
	.word 0xd08008a0  ! 2902: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0x95a01a60  ! 2903: FqTOi	fqtoi	
	.word 0x8d802000  ! 2904: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd48fe030  ! 2905: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r10
	.word 0x81982692  ! 2906: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0692, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0xd4ffc020  ! 2908: SWAPA_R	swapa	%r10, [%r31 + %r0] 0x01
	.word 0x8d902483  ! 2909: WRPR_PSTATE_I	wrpr	%r0, 0x0483, %pstate
	.word 0x3a800001  ! 2910: BCC	bcc,a	<label_0x1>
	.word 0x87a00549  ! 2911: FSQRTd	fsqrt	
	.word 0xc6d80e60  ! 2912: LDXA_R	ldxa	[%r0, %r0] 0x73, %r3
	.word 0x99a0056f  ! 2913: FSQRTq	fsqrt	
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8750c000  ! 2915: RDPR_TT	rdpr	%tt, %r3
	.word 0x81a04dc1  ! 2916: FdMULq	fdmulq	
	ta	T_CHANGE_TO_TL0	! macro
DS_148:
	.word 0x34800001  ! 2919: BG	bg,a	<label_0x1>
	.word 0xdb332001  ! 2919: STQF_I	-	%f13, [0x0001, %r12]
	.word 0x8f458000  ! 2918: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0x81a249a5  ! 2919: FDIVs	fdivs	%f9, %f5, %f0
	.word 0x806a2001  ! 2920: UDIVX_I	udivx 	%r8, 0x0001, %r0
	.word 0x8681e001  ! 2921: ADDcc_I	addcc 	%r7, 0x0001, %r3
	.word 0x8d9022c6  ! 2922: WRPR_PSTATE_I	wrpr	%r0, 0x02c6, %pstate
	.word 0x85514000  ! 2923: RDPR_TBA	rdpr	%tba, %r2
	.word 0xc4800b80  ! 2924: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r2
	.word 0x81982a9d  ! 2925: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a9d, %hpstate
	.word 0x8d902e46  ! 2926: WRPR_PSTATE_I	wrpr	%r0, 0x0e46, %pstate
	.word 0x9c814002  ! 2927: ADDcc_R	addcc 	%r5, %r2, %r14
	.word 0x3e700001  ! 2928: BPVC	<illegal instruction>
	.word 0x3e800001  ! 2929: BVC	bvc,a	<label_0x1>
	.word 0x81982453  ! 2930: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0453, %hpstate
	.word 0x87802016  ! 2931: WRASI_I	wr	%r0, 0x0016, %asi
	mov 0x35, %r30
	.word 0x93d0001e  ! 2932: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d902843  ! 2933: WRPR_PSTATE_I	wrpr	%r0, 0x0843, %pstate
	.word 0xdc800b00  ! 2934: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r14
	.word 0xdc8008a0  ! 2935: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r14
	.word 0x90032001  ! 2936: ADD_I	add 	%r12, 0x0001, %r8
	.word 0x81982494  ! 2937: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0494, %hpstate
	.word 0xd0c7e020  ! 2938: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r8
	.word 0x8478e001  ! 2939: SDIV_I	sdiv 	%r3, 0x0001, %r2
	.word 0x86d36001  ! 2940: UMULcc_I	umulcc 	%r13, 0x0001, %r3
	.word 0x9ed16001  ! 2941: UMULcc_I	umulcc 	%r5, 0x0001, %r15
	mov 0x35, %r30
	.word 0x81d0001e  ! 2942: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9fa00569  ! 2945: FSQRTq	fsqrt	
	.word 0x8d9022d3  ! 2946: WRPR_PSTATE_I	wrpr	%r0, 0x02d3, %pstate
	.word 0x8d9022d9  ! 2947: WRPR_PSTATE_I	wrpr	%r0, 0x02d9, %pstate
	.word 0x8c82e001  ! 2948: ADDcc_I	addcc 	%r11, 0x0001, %r6
	.word 0x26800001  ! 2949: BL	bl,a	<label_0x1>
	.word 0xcc800c60  ! 2950: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r6
	.word 0x8d902a51  ! 2951: WRPR_PSTATE_I	wrpr	%r0, 0x0a51, %pstate
	.word 0x91514000  ! 2952: RDPR_TBA	rdpr	%tba, %r8
	.word 0x87802016  ! 2953: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8198224b  ! 2954: WRHPR_HPSTATE_I	wrhpr	%r0, 0x024b, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d802004  ! 2956: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x83a3c9e4  ! 2957: FDIVq	dis not found

	.word 0x8d802000  ! 2958: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8b50c000  ! 2959: RDPR_TT	rdpr	%tt, %r5
	.word 0x9fd02030  ! 2960: Tcc_I	tvc	icc_or_xcc, %r0 + 48
	.word 0x81982b8d  ! 2961: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b8d, %hpstate
	.word 0xca07c000  ! 2962: LDUW_R	lduw	[%r31 + %r0], %r5
	.word 0xca8804a0  ! 2963: LDUBA_R	lduba	[%r0, %r0] 0x25, %r5
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x85508000  ! 2965: RDPR_TSTATE	rdpr	%tstate, %r2
	.word 0xc43fe001  ! 2966: STD_I	std	%r2, [%r31 + 0x0001]
DS_149:
	.word 0x20800001  ! 2968: BN	bn,a	<label_0x1>
	illtrap
	.word 0x83b30301  ! 2967: ALLIGNADDRESS	alignaddr	%r12, %r1, %r1
DS_150:
	.word 0x20800001  ! 2969: BN	bn,a	<label_0x1>
	illtrap
	.word 0x81b04303  ! 2968: ALLIGNADDRESS	alignaddr	%r1, %r3, %r0
	.word 0x8d902609  ! 2969: WRPR_PSTATE_I	wrpr	%r0, 0x0609, %pstate
	.word 0xc04fc000  ! 2970: LDSB_R	ldsb	[%r31 + %r0], %r0
	.word 0x8dd02030  ! 2971: Tcc_I	tneg	icc_or_xcc, %r0 + 48
	.word 0xc0c7e020  ! 2972: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r0
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9253000d  ! 2975: UMUL_R	umul 	%r12, %r13, %r9
	.word 0x28700001  ! 2976: BPLEU	<illegal instruction>
	.word 0xd2800c00  ! 2977: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r9
	.word 0xd25fc000  ! 2978: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x28800001  ! 2979: BLEU	bleu,a	<label_0x1>
	.word 0x81982086  ! 2980: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0086, %hpstate
	.word 0x81982391  ! 2981: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0391, %hpstate
	.word 0x9fd02031  ! 2982: Tcc_I	tvc	icc_or_xcc, %r0 + 49
	mov 0x33, %r30
	.word 0x9bd0001e  ! 2983: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0xd327e001  ! 2984: STF_I	st	%f9, [0x0001, %r31]
	.word 0x81982e13  ! 2985: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e13, %hpstate
	.word 0x87802004  ! 2986: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x81982394  ! 2987: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0394, %hpstate
	.word 0x87802014  ! 2988: WRASI_I	wr	%r0, 0x0014, %asi
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xd28008a0  ! 2990: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x8d902a9d  ! 2991: WRPR_PSTATE_I	wrpr	%r0, 0x0a9d, %pstate
	.word 0x87802016  ! 2992: WRASI_I	wr	%r0, 0x0016, %asi
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d802004  ! 2995: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd33fc00d  ! 2996: STDF_R	std	%f9, [%r13, %r31]
	.word 0x8d90284c  ! 2997: WRPR_PSTATE_I	wrpr	%r0, 0x084c, %pstate
	mov 0x30, %r30
	.word 0x81d0001e  ! 2998: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 2999: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982f45  ! 3000: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f45, %hpstate
	.word 0x81982808  ! 3001: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0808, %hpstate
	.word 0x896ba001  ! 3002: SDIVX_I	sdivx	%r14, 0x0001, %r4
	mov 0x32, %r30
	.word 0x83d0001e  ! 3003: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xc81fc000  ! 3004: LDD_R	ldd	[%r31 + %r0], %r4
	.word 0x81982899  ! 3005: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0899, %hpstate
	.word 0x81982016  ! 3006: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0016, %hpstate
	.word 0x81982f12  ! 3007: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f12, %hpstate
DS_151:
	.word 0x32800001  ! 3009: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x95b08308  ! 3008: ALLIGNADDRESS	alignaddr	%r2, %r8, %r10
	.word 0x904ba001  ! 3009: MULX_I	mulx 	%r14, 0x0001, %r8
	.word 0x9b504000  ! 3010: RDPR_TNPC	rdpr	%tnpc, %r13
	.word 0x8cd8000a  ! 3011: SMULcc_R	smulcc 	%r0, %r10, %r6
	.word 0xcc9fe001  ! 3012: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r6
	mov 0x30, %r30
	.word 0x95d0001e  ! 3013: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x8fd02031  ! 3014: Tcc_I	tvs	icc_or_xcc, %r0 + 49
	.word 0x87802014  ! 3015: WRASI_I	wr	%r0, 0x0014, %asi
	mov 0x32, %r30
	.word 0x8bd0001e  ! 3016: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x26800001  ! 3017: BL	bl,a	<label_0x1>
	ta	T_CHANGE_PRIV	! macro
	.word 0xcde7c02a  ! 3019: CASA_I	casa	[%r31] 0x 1, %r10, %r6
	.word 0xcc8008a0  ! 3020: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x8d802004  ! 3021: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x81982801  ! 3022: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0801, %hpstate
	.word 0x824b2001  ! 3023: MULX_I	mulx 	%r12, 0x0001, %r1
	.word 0xc3e7c02a  ! 3024: CASA_I	casa	[%r31] 0x 1, %r10, %r1
	.word 0xc2ffc02a  ! 3025: SWAPA_R	swapa	%r1, [%r31 + %r10] 0x01
	.word 0x8d902cdd  ! 3026: WRPR_PSTATE_I	wrpr	%r0, 0x0cdd, %pstate
	.word 0x9d6a8009  ! 3027: SDIVX_R	sdivx	%r10, %r9, %r14
	.word 0xdcc7e020  ! 3028: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r14
	.word 0x81982714  ! 3029: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0714, %hpstate
	.word 0x8d90289d  ! 3030: WRPR_PSTATE_I	wrpr	%r0, 0x089d, %pstate
	.word 0x8d9026d4  ! 3031: WRPR_PSTATE_I	wrpr	%r0, 0x06d4, %pstate
	mov 0x33, %r30
	.word 0x85d0001e  ! 3032: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	mov 0x31, %r30
	.word 0x85d0001e  ! 3033: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x9c4a4003  ! 3035: MULX_R	mulx 	%r9, %r3, %r14
	.word 0x8d90268c  ! 3036: WRPR_PSTATE_I	wrpr	%r0, 0x068c, %pstate
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x34700001  ! 3039: BPG	<illegal instruction>
	.word 0x8d90265e  ! 3040: WRPR_PSTATE_I	wrpr	%r0, 0x065e, %pstate
	.word 0x3c800001  ! 3041: BPOS	bpos,a	<label_0x1>
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81982fd3  ! 3043: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd3, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x846a000d  ! 3045: UDIVX_R	udivx 	%r8, %r13, %r2
	mov 0x32, %r30
	.word 0x9bd0001e  ! 3046: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x32700001  ! 3047: BPNE	<illegal instruction>
	.word 0xc4ffc02d  ! 3048: SWAPA_R	swapa	%r2, [%r31 + %r13] 0x01
	.word 0x81982415  ! 3049: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0415, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x9668800a  ! 3051: UDIVX_R	udivx 	%r2, %r10, %r11
	.word 0x81982d49  ! 3052: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d49, %hpstate
	.word 0x9bd02032  ! 3053: Tcc_I	tcc	icc_or_xcc, %r0 + 50
	.word 0xd69004a0  ! 3054: LDUHA_R	lduha	[%r0, %r0] 0x25, %r11
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902e9f  ! 3056: WRPR_PSTATE_I	wrpr	%r0, 0x0e9f, %pstate
	.word 0x8d90265f  ! 3057: WRPR_PSTATE_I	wrpr	%r0, 0x065f, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9fd02035  ! 3059: Tcc_I	tvc	icc_or_xcc, %r0 + 53
	.word 0x856a6001  ! 3060: SDIVX_I	sdivx	%r9, 0x0001, %r2
	.word 0x81982d45  ! 3061: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d45, %hpstate
	.word 0x87802010  ! 3062: WRASI_I	wr	%r0, 0x0010, %asi
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xc4c7e020  ! 3064: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r2
	.word 0x8d802000  ! 3065: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d6ac001  ! 3066: SDIVX_R	sdivx	%r11, %r1, %r6
	.word 0x8b6b6001  ! 3067: SDIVX_I	sdivx	%r13, 0x0001, %r5
	.word 0x8d802000  ! 3068: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_NONHPRIV	! macro
	mov 0x31, %r30
	.word 0x83d0001e  ! 3070: Tcc_R	te	icc_or_xcc, %r0 + %r30
	mov 0x31, %r30
	.word 0x87d0001e  ! 3071: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xcaffc021  ! 3073: SWAPA_R	swapa	%r5, [%r31 + %r1] 0x01
	.word 0x81982b92  ! 3074: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b92, %hpstate
	.word 0x9ba00545  ! 3075: FSQRTd	fsqrt	
	.word 0x81982ec9  ! 3076: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ec9, %hpstate
	.word 0xdadfe030  ! 3077: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r13
	.word 0x89d02033  ! 3078: Tcc_I	tleu	icc_or_xcc, %r0 + 51
	.word 0x82d94005  ! 3079: SMULcc_R	smulcc 	%r5, %r5, %r1
	.word 0x8f504000  ! 3080: RDPR_TNPC	rdpr	%tnpc, %r7
	.word 0xcec004a0  ! 3081: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r7
	.word 0x8048800d  ! 3082: MULX_R	mulx 	%r2, %r13, %r0
	.word 0x81982d90  ! 3083: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d90, %hpstate
	.word 0x8d90280d  ! 3084: WRPR_PSTATE_I	wrpr	%r0, 0x080d, %pstate
	mov 0x34, %r30
	.word 0x91d0001e  ! 3085: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	mov 0x30, %r30
	.word 0x97d0001e  ! 3086: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x8cc1a001  ! 3087: ADDCcc_I	addccc 	%r6, 0x0001, %r6
	.word 0x81982453  ! 3088: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0453, %hpstate
	.word 0x8d902acf  ! 3089: WRPR_PSTATE_I	wrpr	%r0, 0x0acf, %pstate
	.word 0x81982c0a  ! 3090: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c0a, %hpstate
	.word 0x2a800001  ! 3091: BCS	bcs,a	<label_0x1>
	.word 0x83d02032  ! 3092: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x87802016  ! 3093: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8d902081  ! 3094: WRPR_PSTATE_I	wrpr	%r0, 0x0081, %pstate
	ta	T_CHANGE_PRIV	! macro
DS_152:
	.word 0x20800001  ! 3097: BN	bn,a	<label_0x1>
	.word 0xc3306001  ! 3097: STQF_I	-	%f1, [0x0001, %r1]
	.word 0x8d458000  ! 3096: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0x87802010  ! 3097: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xcde7c02d  ! 3098: CASA_I	casa	[%r31] 0x 1, %r13, %r6
	.word 0x86482001  ! 3099: MULX_I	mulx 	%r0, 0x0001, %r3
	.word 0xc68008a0  ! 3100: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x85d02031  ! 3101: Tcc_I	tle	icc_or_xcc, %r0 + 49
	.word 0x87802014  ! 3102: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x93a3c9af  ! 3103: FDIVs	fdivs	%f15, %f15, %f9
	.word 0x8d902e4f  ! 3104: WRPR_PSTATE_I	wrpr	%r0, 0x0e4f, %pstate
	.word 0xd28008a0  ! 3105: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x844a8005  ! 3106: MULX_R	mulx 	%r10, %r5, %r2
	.word 0x87802089  ! 3107: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x81a34dcb  ! 3108: FdMULq	fdmulq	
	.word 0x26800001  ! 3109: BL	bl,a	<label_0x1>
	.word 0x2e800001  ! 3110: BVS	bvs,a	<label_0x1>
	.word 0x8dd02030  ! 3111: Tcc_I	tneg	icc_or_xcc, %r0 + 48
DS_153:
	.word 0x32800001  ! 3113: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x97b3830f  ! 3112: ALLIGNADDRESS	alignaddr	%r14, %r15, %r11
	.word 0x8083a001  ! 3113: ADDcc_I	addcc 	%r14, 0x0001, %r0
	.word 0x93514000  ! 3114: RDPR_TBA	rdpr	%tba, %r9
	.word 0x996b000d  ! 3115: SDIVX_R	sdivx	%r12, %r13, %r12
	.word 0xd8cfe000  ! 3116: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r12
DS_154:
	.word 0x34800001  ! 3118: BG	bg,a	<label_0x1>
	illtrap
	.word 0x85b1c302  ! 3117: ALLIGNADDRESS	alignaddr	%r7, %r2, %r2
	.word 0x8d9028d9  ! 3118: WRPR_PSTATE_I	wrpr	%r0, 0x08d9, %pstate
	.word 0xc47fe001  ! 3119: SWAP_I	swap	%r2, [%r31 + 0x0001]
	.word 0xc437c002  ! 3120: STH_R	sth	%r2, [%r31 + %r2]
	.word 0x99d02034  ! 3121: Tcc_I	tgu	icc_or_xcc, %r0 + 52
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xc537c002  ! 3123: STQF_R	-	%f2, [%r2, %r31]
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc4d7e010  ! 3125: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r2
	.word 0x8d9024d5  ! 3126: WRPR_PSTATE_I	wrpr	%r0, 0x04d5, %pstate
	.word 0x91a089ce  ! 3127: FDIVd	fdivd	%f2, %f14, %f8
	.word 0x8d802000  ! 3128: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d802000  ! 3129: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x2c700001  ! 3130: BPNEG	<illegal instruction>
	.word 0xd0ffc02e  ! 3131: SWAPA_R	swapa	%r8, [%r31 + %r14] 0x01
	ta	T_CHANGE_PRIV	! macro
	.word 0x81982f4d  ! 3133: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f4d, %hpstate
	.word 0x95d02030  ! 3134: Tcc_I	tg	icc_or_xcc, %r0 + 48
	.word 0x95a000cc  ! 3135: FNEGd	fnegd	%f12, %f10
	.word 0x99a00562  ! 3136: FSQRTq	fsqrt	
	.word 0x81982598  ! 3137: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0598, %hpstate
	.word 0xd88fe010  ! 3138: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r12
	.word 0x8c026001  ! 3139: ADD_I	add 	%r9, 0x0001, %r6
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x9ba2c9af  ! 3141: FDIVs	fdivs	%f11, %f15, %f13
	.word 0x8d9028ce  ! 3142: WRPR_PSTATE_I	wrpr	%r0, 0x08ce, %pstate
	.word 0x2e700001  ! 3143: BPVS	<illegal instruction>
	.word 0xda9004a0  ! 3144: LDUHA_R	lduha	[%r0, %r0] 0x25, %r13
	.word 0x9ba049e9  ! 3145: FDIVq	dis not found

	.word 0x8b51c000  ! 3146: RDPR_TL	rdpr	%tl, %r5
	.word 0x87802080  ! 3147: WRASI_I	wr	%r0, 0x0080, %asi
	ta	T_CHANGE_HPRIV	! macro
	.word 0xca9fe001  ! 3149: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r5
	.word 0xca800b60  ! 3150: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r5
	.word 0x856b0001  ! 3151: SDIVX_R	sdivx	%r12, %r1, %r2
DS_155:
	.word 0x32800001  ! 3153: BNE	bne,a	<label_0x1>
	.word 0xd330800e  ! 3153: STQF_R	-	%f9, [%r14, %r2]
	.word 0x8b458000  ! 3152: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0x8d9026dc  ! 3153: WRPR_PSTATE_I	wrpr	%r0, 0x06dc, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x36700001  ! 3155: BPGE	<illegal instruction>
	.word 0x8f69c000  ! 3156: SDIVX_R	sdivx	%r7, %r0, %r7
	.word 0x99514000  ! 3157: RDPR_TBA	rdpr	%tba, %r12
	ta	T_CHANGE_PRIV	! macro
	mov 0x30, %r30
	.word 0x89d0001e  ! 3159: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902c8e  ! 3161: WRPR_PSTATE_I	wrpr	%r0, 0x0c8e, %pstate
	.word 0x8d902040  ! 3162: WRPR_PSTATE_I	wrpr	%r0, 0x0040, %pstate
	.word 0x8da24dc5  ! 3163: FdMULq	fdmulq	
	.word 0xcc800c80  ! 3164: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r6
	.word 0x3e700001  ! 3165: BPVC	<illegal instruction>
DS_156:
	.word 0x22800001  ! 3167: BE	be,a	<label_0x1>
	.word 0xcd308005  ! 3167: STQF_R	-	%f6, [%r5, %r2]
	.word 0x9f458000  ! 3166: RD_SOFTINT_REG	rd	%softint, %r15
	.word 0x9cd1000c  ! 3167: UMULcc_R	umulcc 	%r4, %r12, %r14
	.word 0x87d02035  ! 3168: Tcc_I	tl	icc_or_xcc, %r0 + 53
	.word 0x819820c1  ! 3169: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00c1, %hpstate
	.word 0x91d02031  ! 3170: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xdcc004a0  ! 3171: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r14
DS_157:
	.word 0x22800001  ! 3173: BE	be,a	<label_0x1>
	illtrap
	.word 0x9db00307  ! 3172: ALLIGNADDRESS	alignaddr	%r0, %r7, %r14
	.word 0x964aa001  ! 3173: MULX_I	mulx 	%r10, 0x0001, %r11
	.word 0x8d902258  ! 3174: WRPR_PSTATE_I	wrpr	%r0, 0x0258, %pstate
DS_158:
	.word 0x20800001  ! 3176: BN	bn,a	<label_0x1>
	illtrap
	.word 0x81b24307  ! 3175: ALLIGNADDRESS	alignaddr	%r9, %r7, %r0
	.word 0x9c7a0009  ! 3176: SDIV_R	sdiv 	%r8, %r9, %r14
	mov 0x31, %r30
	.word 0x8dd0001e  ! 3177: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x8d902452  ! 3178: WRPR_PSTATE_I	wrpr	%r0, 0x0452, %pstate
	.word 0xdc57c000  ! 3179: LDSH_R	ldsh	[%r31 + %r0], %r14
	.word 0x87802014  ! 3180: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x8c7bc004  ! 3181: SDIV_R	sdiv 	%r15, %r4, %r6
	.word 0x8d902a46  ! 3182: WRPR_PSTATE_I	wrpr	%r0, 0x0a46, %pstate
DS_159:
	.word 0x20800001  ! 3184: BN	bn,a	<label_0x1>
	illtrap
	.word 0x95b00300  ! 3183: ALLIGNADDRESS	alignaddr	%r0, %r0, %r10
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d508000  ! 3185: RDPR_TSTATE	rdpr	%tstate, %r6
	.word 0x81982fc7  ! 3186: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fc7, %hpstate
	.word 0x34700001  ! 3187: BPG	<illegal instruction>
	.word 0x884b0001  ! 3188: MULX_R	mulx 	%r12, %r1, %r4
	.word 0x81982d5f  ! 3189: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d5f, %hpstate
	.word 0x8d902c5d  ! 3190: WRPR_PSTATE_I	wrpr	%r0, 0x0c5d, %pstate
	.word 0x8d902406  ! 3191: WRPR_PSTATE_I	wrpr	%r0, 0x0406, %pstate
	.word 0x8d902898  ! 3192: WRPR_PSTATE_I	wrpr	%r0, 0x0898, %pstate
DS_160:
	.word 0x34800001  ! 3194: BG	bg,a	<label_0x1>
	.word 0xc3310007  ! 3194: STQF_R	-	%f1, [%r7, %r4]
	.word 0x8f458000  ! 3193: RD_SOFTINT_REG	rd	%softint, %r7
	mov 0x30, %r30
	.word 0x85d0001e  ! 3194: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0x976ba001  ! 3196: SDIVX_I	sdivx	%r14, 0x0001, %r11
	.word 0x8d802004  ! 3197: WRFPRS_I	wr	%r0, 0x0004, %fprs
	ta	T_CHANGE_PRIV	! macro
	.word 0x87802004  ! 3199: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87802088  ! 3200: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xd727c007  ! 3201: STF_R	st	%f11, [%r7, %r31]
	.word 0x8d902ade  ! 3202: WRPR_PSTATE_I	wrpr	%r0, 0x0ade, %pstate
	.word 0x8d902691  ! 3203: WRPR_PSTATE_I	wrpr	%r0, 0x0691, %pstate
	.word 0xd727e001  ! 3204: STF_I	st	%f11, [0x0001, %r31]
	.word 0x936bc00d  ! 3205: SDIVX_R	sdivx	%r15, %r13, %r9
	.word 0x916b2001  ! 3206: SDIVX_I	sdivx	%r12, 0x0001, %r8
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x28800001  ! 3209: BLEU	bleu,a	<label_0x1>
	.word 0x8d802000  ! 3210: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982814  ! 3211: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0814, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x91d02032  ! 3213: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x87802088  ! 3214: WRASI_I	wr	%r0, 0x0088, %asi
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d902ac4  ! 3216: WRPR_PSTATE_I	wrpr	%r0, 0x0ac4, %pstate
	.word 0x90d08000  ! 3217: UMULcc_R	umulcc 	%r2, %r0, %r8
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0x20700001  ! 3220: BPN	<illegal instruction>
	.word 0x80c16001  ! 3221: ADDCcc_I	addccc 	%r5, 0x0001, %r0
	.word 0x819825c3  ! 3222: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05c3, %hpstate
	.word 0xc037c000  ! 3223: STH_R	sth	%r0, [%r31 + %r0]
	.word 0xc0dfe030  ! 3224: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r0
	.word 0x8d902089  ! 3225: WRPR_PSTATE_I	wrpr	%r0, 0x0089, %pstate
	.word 0x87802016  ! 3226: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x9ba289cb  ! 3227: FDIVd	fdivd	%f10, %f42, %f44
	.word 0x8bd02035  ! 3228: Tcc_I	tcs	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_PRIV	! macro
	.word 0xda800bc0  ! 3230: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r13
	.word 0x9b480000  ! 3231: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
	.word 0x84818005  ! 3232: ADDcc_R	addcc 	%r6, %r5, %r2
	.word 0x83d02035  ! 3233: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x91500000  ! 3234: RDPR_TPC	rdpr	%tpc, %r8
	.word 0xd0d004a0  ! 3235: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
DS_161:
	.word 0x34800001  ! 3237: BG	bg,a	<label_0x1>
	illtrap
	.word 0x83b04309  ! 3236: ALLIGNADDRESS	alignaddr	%r1, %r9, %r1
	.word 0xc2ffc029  ! 3237: SWAPA_R	swapa	%r1, [%r31 + %r9] 0x01
	.word 0x90d16001  ! 3238: UMULcc_I	umulcc 	%r5, 0x0001, %r8
	.word 0x806b8002  ! 3239: UDIVX_R	udivx 	%r14, %r2, %r0
	.word 0x87802004  ! 3240: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xc07fe001  ! 3241: SWAP_I	swap	%r0, [%r31 + 0x0001]
	.word 0xc037e001  ! 3242: STH_I	sth	%r0, [%r31 + 0x0001]
	.word 0x90d1800f  ! 3243: UMULcc_R	umulcc 	%r6, %r15, %r8
	.word 0x8880e001  ! 3244: ADDcc_I	addcc 	%r3, 0x0001, %r4
	.word 0x8d9026d0  ! 3245: WRPR_PSTATE_I	wrpr	%r0, 0x06d0, %pstate
	.word 0xc927e001  ! 3246: STF_I	st	%f4, [0x0001, %r31]
	.word 0x9ba00560  ! 3247: FSQRTq	fsqrt	
	.word 0x8ec0e001  ! 3248: ADDCcc_I	addccc 	%r3, 0x0001, %r7
	.word 0xced80e80  ! 3249: LDXA_R	ldxa	[%r0, %r0] 0x74, %r7
	.word 0xcec7e030  ! 3250: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r7
	.word 0x8fa00540  ! 3251: FSQRTd	fsqrt	
	.word 0x83a18d2e  ! 3252: FsMULd	fsmuld	%f6, %f14, %f32
	.word 0x85a1c9c0  ! 3253: FDIVd	fdivd	%f38, %f0, %f2
	.word 0x87802014  ! 3254: WRASI_I	wr	%r0, 0x0014, %asi
DS_162:
	.word 0x22800001  ! 3256: BE	be,a	<label_0x1>
	illtrap
	.word 0x9db3c308  ! 3255: ALLIGNADDRESS	alignaddr	%r15, %r8, %r14
DS_163:
	.word 0x34800001  ! 3257: BG	bg,a	<label_0x1>
	illtrap
	.word 0x87b0c30a  ! 3256: ALLIGNADDRESS	alignaddr	%r3, %r10, %r3
	.word 0x8d802000  ! 3257: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982dd7  ! 3258: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dd7, %hpstate
	mov 0x35, %r30
	.word 0x81d0001e  ! 3259: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x87802089  ! 3260: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x85a0054d  ! 3261: FSQRTd	fsqrt	
	.word 0xc48008a0  ! 3262: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0xc49fc020  ! 3263: LDDA_R	ldda	[%r31, %r0] 0x01, %r2
	.word 0x9668400a  ! 3264: UDIVX_R	udivx 	%r1, %r10, %r11
	.word 0x8198268a  ! 3265: WRHPR_HPSTATE_I	wrhpr	%r0, 0x068a, %hpstate
	.word 0xd68008a0  ! 3266: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81d02030  ! 3268: Tcc_I	tn	icc_or_xcc, %r0 + 48
	.word 0x83a01a66  ! 3269: FqTOi	fqtoi	
	ta	T_CHANGE_PRIV	! macro
	.word 0xc27fe001  ! 3271: SWAP_I	swap	%r1, [%r31 + 0x0001]
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9bd02033  ! 3273: Tcc_I	tcc	icc_or_xcc, %r0 + 51
	.word 0x81982288  ! 3274: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0288, %hpstate
	.word 0x91d02031  ! 3275: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x9ba349cc  ! 3276: FDIVd	fdivd	%f44, %f12, %f44
	.word 0x8268a001  ! 3277: UDIVX_I	udivx 	%r2, 0x0001, %r1
	.word 0x8d802004  ! 3278: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x87d02033  ! 3279: Tcc_I	tl	icc_or_xcc, %r0 + 51
DS_164:
	.word 0x20800001  ! 3281: BN	bn,a	<label_0x1>
	illtrap
	.word 0x9db1c30d  ! 3280: ALLIGNADDRESS	alignaddr	%r7, %r13, %r14
	.word 0x8d9026d5  ! 3281: WRPR_PSTATE_I	wrpr	%r0, 0x06d5, %pstate
	mov 0x32, %r30
	.word 0x9dd0001e  ! 3282: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x8d902289  ! 3283: WRPR_PSTATE_I	wrpr	%r0, 0x0289, %pstate
	.word 0x8d902a8b  ! 3284: WRPR_PSTATE_I	wrpr	%r0, 0x0a8b, %pstate
	.word 0xdde7c02d  ! 3285: CASA_I	casa	[%r31] 0x 1, %r13, %r14
	.word 0x81982d15  ! 3286: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d15, %hpstate
	.word 0x9ed10006  ! 3287: UMULcc_R	umulcc 	%r4, %r6, %r15
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81982f41  ! 3289: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f41, %hpstate
	.word 0xde8804a0  ! 3290: LDUBA_R	lduba	[%r0, %r0] 0x25, %r15
	.word 0x8198241d  ! 3291: WRHPR_HPSTATE_I	wrhpr	%r0, 0x041d, %hpstate
	.word 0xde97e030  ! 3292: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r15
	.word 0x8d802000  ! 3293: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_165:
	.word 0x20800001  ! 3295: BN	bn,a	<label_0x1>
	.word 0xdb332001  ! 3295: STQF_I	-	%f13, [0x0001, %r12]
	.word 0x85458000  ! 3294: RD_SOFTINT_REG	rd	%softint, %r2
	.word 0xc4c00e60  ! 3295: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r2
	.word 0x81698006  ! 3296: SDIVX_R	sdivx	%r6, %r6, %r0
	.word 0x8d902e8c  ! 3297: WRPR_PSTATE_I	wrpr	%r0, 0x0e8c, %pstate
	.word 0x86d8c00e  ! 3298: SMULcc_R	smulcc 	%r3, %r14, %r3
	.word 0xc68008a0  ! 3299: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x8d9024cc  ! 3300: WRPR_PSTATE_I	wrpr	%r0, 0x04cc, %pstate
	.word 0xc6dfe010  ! 3301: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r3
DS_166:
	.word 0x32800001  ! 3303: BNE	bne,a	<label_0x1>
	.word 0xcf31800b  ! 3303: STQF_R	-	%f7, [%r11, %r6]
	.word 0x9b458000  ! 3302: RD_SOFTINT_REG	rd	%softint, %r13
DS_167:
	.word 0x20800001  ! 3304: BN	bn,a	<label_0x1>
	illtrap
	.word 0x99b08302  ! 3303: ALLIGNADDRESS	alignaddr	%r2, %r2, %r12
	mov 0x33, %r30
	.word 0x85d0001e  ! 3304: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x8ba189cd  ! 3305: FDIVd	fdivd	%f6, %f44, %f36
	.word 0xca9004a0  ! 3306: LDUHA_R	lduha	[%r0, %r0] 0x25, %r5
	ta	T_CHANGE_PRIV	! macro
	.word 0x81982b5b  ! 3308: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b5b, %hpstate
	.word 0x93d02030  ! 3309: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0xcaffc02d  ! 3310: SWAPA_R	swapa	%r5, [%r31 + %r13] 0x01
	.word 0x87d02035  ! 3311: Tcc_I	tl	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8198258b  ! 3313: WRHPR_HPSTATE_I	wrhpr	%r0, 0x058b, %hpstate
	.word 0x81982d06  ! 3314: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d06, %hpstate
	.word 0x81982000  ! 3315: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0000, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xca8008a0  ! 3317: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0x8f508000  ! 3318: RDPR_TSTATE	rdpr	%tstate, %r7
	.word 0x86016001  ! 3319: ADD_I	add 	%r5, 0x0001, %r3
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x24700001  ! 3321: BPLE	<illegal instruction>
	.word 0x9da149ac  ! 3322: FDIVs	fdivs	%f5, %f12, %f14
	.word 0xdc0fe001  ! 3323: LDUB_I	ldub	[%r31 + 0x0001], %r14
	.word 0xdcc804a0  ! 3324: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r14
	.word 0x26700001  ! 3325: BPL	<illegal instruction>
	.word 0x9bd02033  ! 3326: Tcc_I	tcc	icc_or_xcc, %r0 + 51
	.word 0x8d902c48  ! 3327: WRPR_PSTATE_I	wrpr	%r0, 0x0c48, %pstate
	mov 0x35, %r30
	.word 0x9fd0001e  ! 3328: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x3e700001  ! 3329: BPVC	<illegal instruction>
	.word 0x99a049cb  ! 3330: FDIVd	fdivd	%f32, %f42, %f12
	.word 0x8d902a9c  ! 3331: WRPR_PSTATE_I	wrpr	%r0, 0x0a9c, %pstate
	.word 0x8d902408  ! 3332: WRPR_PSTATE_I	wrpr	%r0, 0x0408, %pstate
	.word 0x9da01a64  ! 3333: FqTOi	fqtoi	
	.word 0x81982fde  ! 3334: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fde, %hpstate
DS_168:
	.word 0x34800001  ! 3336: BG	bg,a	<label_0x1>
	illtrap
	.word 0x93b2830e  ! 3335: ALLIGNADDRESS	alignaddr	%r10, %r14, %r9
	.word 0x9fa109e6  ! 3336: FDIVq	dis not found

	.word 0xde3fe001  ! 3337: STD_I	std	%r15, [%r31 + 0x0001]
	.word 0x8d802000  ! 3338: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_169:
	.word 0x34800001  ! 3340: BG	bg,a	<label_0x1>
	illtrap
	.word 0x9fb28304  ! 3339: ALLIGNADDRESS	alignaddr	%r10, %r4, %r15
	.word 0xde900e40  ! 3340: LDUHA_R	lduha	[%r0, %r0] 0x72, %r15
	.word 0x8d902607  ! 3341: WRPR_PSTATE_I	wrpr	%r0, 0x0607, %pstate
DS_170:
	.word 0x32800001  ! 3343: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x87b14306  ! 3342: ALLIGNADDRESS	alignaddr	%r5, %r6, %r3
	.word 0x85684007  ! 3343: SDIVX_R	sdivx	%r1, %r7, %r2
	.word 0xc537c007  ! 3344: STQF_R	-	%f2, [%r7, %r31]
	.word 0x81d02034  ! 3345: Tcc_I	tn	icc_or_xcc, %r0 + 52
	ta	T_CHANGE_PRIV	! macro
	.word 0x824ae001  ! 3347: MULX_I	mulx 	%r11, 0x0001, %r1
DS_171:
	.word 0x34800001  ! 3349: BG	bg,a	<label_0x1>
	.word 0xcb336001  ! 3349: STQF_I	-	%f5, [0x0001, %r13]
	.word 0x9d458000  ! 3348: RD_SOFTINT_REG	rd	%softint, %r14
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902ec5  ! 3350: WRPR_PSTATE_I	wrpr	%r0, 0x0ec5, %pstate
	.word 0x8198249f  ! 3351: WRHPR_HPSTATE_I	wrhpr	%r0, 0x049f, %hpstate
	mov 0x30, %r30
	.word 0x89d0001e  ! 3352: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0xdd3fc007  ! 3353: STDF_R	std	%f14, [%r7, %r31]
	.word 0xdd27c007  ! 3354: STF_R	st	%f14, [%r7, %r31]
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x90db000f  ! 3356: SMULcc_R	smulcc 	%r12, %r15, %r8
	.word 0x8d902299  ! 3357: WRPR_PSTATE_I	wrpr	%r0, 0x0299, %pstate
	.word 0x3a700001  ! 3358: BPCC	<illegal instruction>
	.word 0x8d802000  ! 3359: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d802000  ! 3360: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87a089a4  ! 3361: FDIVs	fdivs	%f2, %f4, %f3
	.word 0xc60fe001  ! 3362: LDUB_I	ldub	[%r31 + 0x0001], %r3
	.word 0x8d902888  ! 3363: WRPR_PSTATE_I	wrpr	%r0, 0x0888, %pstate
	.word 0xc6c80e40  ! 3364: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r3
	.word 0x8d902cd1  ! 3365: WRPR_PSTATE_I	wrpr	%r0, 0x0cd1, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8c78e001  ! 3367: SDIV_I	sdiv 	%r3, 0x0001, %r6
DS_172:
	.word 0x20800001  ! 3369: BN	bn,a	<label_0x1>
	illtrap
	.word 0x81b10301  ! 3368: ALLIGNADDRESS	alignaddr	%r4, %r1, %r0
	.word 0xc08fe030  ! 3369: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r0
	mov 0x35, %r30
	.word 0x9dd0001e  ! 3370: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81982396  ! 3372: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0396, %hpstate
	.word 0x8d902cdf  ! 3373: WRPR_PSTATE_I	wrpr	%r0, 0x0cdf, %pstate
	.word 0x81982d1b  ! 3374: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d1b, %hpstate
	.word 0x81982f5b  ! 3375: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f5b, %hpstate
	.word 0x99d02032  ! 3376: Tcc_I	tgu	icc_or_xcc, %r0 + 50
	.word 0xc097e030  ! 3377: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r0
	.word 0x3a700001  ! 3378: BPCC	<illegal instruction>
	.word 0x8d902cd1  ! 3379: WRPR_PSTATE_I	wrpr	%r0, 0x0cd1, %pstate
	.word 0xc057e001  ! 3380: LDSH_I	ldsh	[%r31 + 0x0001], %r0
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8e6be001  ! 3382: UDIVX_I	udivx 	%r15, 0x0001, %r7
	.word 0x9650c00b  ! 3383: UMUL_R	umul 	%r3, %r11, %r11
	.word 0x8d90281c  ! 3384: WRPR_PSTATE_I	wrpr	%r0, 0x081c, %pstate
	.word 0xd6c00e60  ! 3385: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r11
	.word 0xd7e7c02b  ! 3386: CASA_I	casa	[%r31] 0x 1, %r11, %r11
	.word 0x8d902893  ! 3387: WRPR_PSTATE_I	wrpr	%r0, 0x0893, %pstate
	.word 0xd68804a0  ! 3388: LDUBA_R	lduba	[%r0, %r0] 0x25, %r11
	.word 0xd6dfe030  ! 3389: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r11
	.word 0x9ec1e001  ! 3390: ADDCcc_I	addccc 	%r7, 0x0001, %r15
	.word 0x986b6001  ! 3391: UDIVX_I	udivx 	%r13, 0x0001, %r12
DS_173:
	.word 0x32800001  ! 3393: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x9db3c308  ! 3392: ALLIGNADDRESS	alignaddr	%r15, %r8, %r14
	.word 0x89a000c5  ! 3393: FNEGd	fnegd	%f36, %f4
	.word 0x87802014  ! 3394: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x8dd02032  ! 3395: Tcc_I	tneg	icc_or_xcc, %r0 + 50
	.word 0x9e81e001  ! 3396: ADDcc_I	addcc 	%r7, 0x0001, %r15
	.word 0x819828df  ! 3397: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08df, %hpstate
	.word 0x8550c000  ! 3398: RDPR_TT	rdpr	%tt, %r2
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x819820d0  ! 3400: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00d0, %hpstate
	.word 0x32700001  ! 3401: BPNE	<illegal instruction>
	.word 0x867ae001  ! 3402: SDIV_I	sdiv 	%r11, 0x0001, %r3
	.word 0x95d02035  ! 3403: Tcc_I	tg	icc_or_xcc, %r0 + 53
	.word 0x8d902c95  ! 3404: WRPR_PSTATE_I	wrpr	%r0, 0x0c95, %pstate
	.word 0xc67fe001  ! 3405: SWAP_I	swap	%r3, [%r31 + 0x0001]
	.word 0x8dd02034  ! 3406: Tcc_I	tneg	icc_or_xcc, %r0 + 52
	.word 0x9fa00563  ! 3407: FSQRTq	fsqrt	
	.word 0x87802016  ! 3408: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xde97e030  ! 3409: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r15
	.word 0x86492001  ! 3410: MULX_I	mulx 	%r4, 0x0001, %r3
	.word 0x91a349e1  ! 3411: FDIVq	dis not found

	.word 0x87802004  ! 3412: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x24700001  ! 3413: BPLE	<illegal instruction>
	.word 0xd02fe001  ! 3414: STB_I	stb	%r8, [%r31 + 0x0001]
	.word 0x8b6b2001  ! 3415: SDIVX_I	sdivx	%r12, 0x0001, %r5
	.word 0x81982d80  ! 3416: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d80, %hpstate
	.word 0x8d90288f  ! 3417: WRPR_PSTATE_I	wrpr	%r0, 0x088f, %pstate
	.word 0xca3fc001  ! 3418: STD_R	std	%r5, [%r31 + %r1]
	.word 0x84792001  ! 3419: SDIV_I	sdiv 	%r4, 0x0001, %r2
	.word 0x8649e001  ! 3420: MULX_I	mulx 	%r7, 0x0001, %r3
	.word 0x8d802000  ! 3421: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xc6800b80  ! 3423: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r3
	ta	T_CHANGE_PRIV	! macro
	.word 0xc697e010  ! 3425: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r3
	.word 0x9278a001  ! 3426: SDIV_I	sdiv 	%r2, 0x0001, %r9
	.word 0x876a000f  ! 3427: SDIVX_R	sdivx	%r8, %r15, %r3
	.word 0x9b514000  ! 3428: RDPR_TBA	rdpr	%tba, %r13
	.word 0xdbe7c02f  ! 3429: CASA_I	casa	[%r31] 0x 1, %r15, %r13
	mov 0x33, %r30
	.word 0x87d0001e  ! 3430: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x956a0004  ! 3431: SDIVX_R	sdivx	%r8, %r4, %r10
	.word 0x80da000c  ! 3432: SMULcc_R	smulcc 	%r8, %r12, %r0
DS_174:
	.word 0x22800001  ! 3434: BE	be,a	<label_0x1>
	illtrap
	.word 0x9fb2c304  ! 3433: ALLIGNADDRESS	alignaddr	%r11, %r4, %r15
	.word 0x8d902c15  ! 3434: WRPR_PSTATE_I	wrpr	%r0, 0x0c15, %pstate
	.word 0x24800001  ! 3435: BLE	ble,a	<label_0x1>
	.word 0x9680a001  ! 3436: ADDcc_I	addcc 	%r2, 0x0001, %r11
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8198229b  ! 3438: WRHPR_HPSTATE_I	wrhpr	%r0, 0x029b, %hpstate
	.word 0xd61fe001  ! 3439: LDD_I	ldd	[%r31 + 0x0001], %r11
	.word 0x84786001  ! 3440: SDIV_I	sdiv 	%r1, 0x0001, %r2
DS_175:
	.word 0x20800001  ! 3442: BN	bn,a	<label_0x1>
	illtrap
	.word 0x8fb30306  ! 3441: ALLIGNADDRESS	alignaddr	%r12, %r6, %r7
	.word 0x93a00548  ! 3442: FSQRTd	fsqrt	
	.word 0x92498002  ! 3443: MULX_R	mulx 	%r6, %r2, %r9
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x28700001  ! 3445: BPLEU	<illegal instruction>
	.word 0x82da4009  ! 3446: SMULcc_R	smulcc 	%r9, %r9, %r1
DS_176:
	.word 0x32800001  ! 3448: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x87b1430b  ! 3447: ALLIGNADDRESS	alignaddr	%r5, %r11, %r3
	.word 0x8d90284b  ! 3448: WRPR_PSTATE_I	wrpr	%r0, 0x084b, %pstate
	.word 0x8d902a89  ! 3449: WRPR_PSTATE_I	wrpr	%r0, 0x0a89, %pstate
	.word 0x8d802000  ! 3450: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d90264c  ! 3451: WRPR_PSTATE_I	wrpr	%r0, 0x064c, %pstate
	.word 0x32700001  ! 3452: BPNE	<illegal instruction>
	.word 0x9f508000  ! 3453: RDPR_TSTATE	rdpr	%tstate, %r15
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d802004  ! 3455: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x87802080  ! 3456: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x81982d98  ! 3457: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d98, %hpstate
	.word 0x81982817  ! 3458: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0817, %hpstate
	.word 0xde9fe001  ! 3459: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r15
	ta	T_CHANGE_HPRIV	! macro
	.word 0xdf37e001  ! 3461: STQF_I	-	%f15, [0x0001, %r31]
	.word 0x91a389ea  ! 3462: FDIVq	dis not found

	.word 0x8d90245f  ! 3463: WRPR_PSTATE_I	wrpr	%r0, 0x045f, %pstate
	.word 0xd1e7c02a  ! 3464: CASA_I	casa	[%r31] 0x 1, %r10, %r8
	.word 0x9ba28dce  ! 3465: FdMULq	fdmulq	
	.word 0x8d90249a  ! 3466: WRPR_PSTATE_I	wrpr	%r0, 0x049a, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01a6f  ! 3468: FqTOi	fqtoi	
	.word 0xda7fe001  ! 3469: SWAP_I	swap	%r13, [%r31 + 0x0001]
	mov 0x31, %r30
	.word 0x89d0001e  ! 3470: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x9ba209c9  ! 3471: FDIVd	fdivd	%f8, %f40, %f44
	.word 0x9e834004  ! 3472: ADDcc_R	addcc 	%r13, %r4, %r15
	.word 0x81982695  ! 3473: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0695, %hpstate
	mov 0x35, %r30
	.word 0x91d0001e  ! 3474: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9cc36001  ! 3475: ADDCcc_I	addccc 	%r13, 0x0001, %r14
	.word 0x9569e001  ! 3476: SDIVX_I	sdivx	%r7, 0x0001, %r10
	.word 0x9f508000  ! 3477: RDPR_TSTATE	rdpr	%tstate, %r15
	.word 0x8d902248  ! 3478: WRPR_PSTATE_I	wrpr	%r0, 0x0248, %pstate
	.word 0x81982e0e  ! 3479: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e0e, %hpstate
	.word 0xde0fe001  ! 3480: LDUB_I	ldub	[%r31 + 0x0001], %r15
	.word 0x9c6ac00b  ! 3481: UDIVX_R	udivx 	%r11, %r11, %r14
	.word 0x8d902c51  ! 3482: WRPR_PSTATE_I	wrpr	%r0, 0x0c51, %pstate
	.word 0x22700001  ! 3483: BPE	<illegal instruction>
	.word 0xdc47c000  ! 3484: LDSW_R	ldsw	[%r31 + %r0], %r14
	.word 0x8d902a07  ! 3485: WRPR_PSTATE_I	wrpr	%r0, 0x0a07, %pstate
	.word 0x8dd02035  ! 3486: Tcc_I	tneg	icc_or_xcc, %r0 + 53
DS_177:
	.word 0x32800001  ! 3488: BNE	bne,a	<label_0x1>
	.word 0xcb32400f  ! 3488: STQF_R	-	%f5, [%r15, %r9]
	.word 0x89458000  ! 3487: RD_SOFTINT_REG	rd	%softint, %r4
	.word 0x819820d9  ! 3488: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00d9, %hpstate
	.word 0xc857c000  ! 3489: LDSH_R	ldsh	[%r31 + %r0], %r4
	.word 0x81982a5f  ! 3490: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a5f, %hpstate
	.word 0x9c4ac00f  ! 3491: MULX_R	mulx 	%r11, %r15, %r14
	.word 0xdcc004a0  ! 3492: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r14
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x28700001  ! 3494: BPLEU	<illegal instruction>
	.word 0x8f500000  ! 3495: RDPR_TPC	rdpr	%tpc, %r7
	.word 0x8d902e53  ! 3496: WRPR_PSTATE_I	wrpr	%r0, 0x0e53, %pstate
	.word 0x8a7ac008  ! 3497: SDIV_R	sdiv 	%r11, %r8, %r5
	.word 0xca900e80  ! 3498: LDUHA_R	lduha	[%r0, %r0] 0x74, %r5
	.word 0x95d02031  ! 3499: Tcc_I	tg	icc_or_xcc, %r0 + 49
	.word 0x8c78a001  ! 3500: SDIV_I	sdiv 	%r2, 0x0001, %r6
	mov 0x32, %r30
	.word 0x9fd0001e  ! 3501: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0xccc80e60  ! 3502: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r6
	mov 0x30, %r30
	.word 0x9bd0001e  ! 3503: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x8d902e0a  ! 3504: WRPR_PSTATE_I	wrpr	%r0, 0x0e0a, %pstate
	mov 0x31, %r30
	.word 0x87d0001e  ! 3505: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x8d902c56  ! 3506: WRPR_PSTATE_I	wrpr	%r0, 0x0c56, %pstate
	.word 0xcc800c40  ! 3507: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r6
	.word 0xcc7fe001  ! 3508: SWAP_I	swap	%r6, [%r31 + 0x0001]
	.word 0x8b694006  ! 3509: SDIVX_R	sdivx	%r5, %r6, %r5
	.word 0xcac7e010  ! 3510: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r5
	.word 0x81982a4b  ! 3511: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a4b, %hpstate
	mov 0x32, %r30
	.word 0x9dd0001e  ! 3512: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
DS_178:
	.word 0x32800001  ! 3515: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x8bb2030b  ! 3514: ALLIGNADDRESS	alignaddr	%r8, %r11, %r5
	.word 0xca57e001  ! 3515: LDSH_I	ldsh	[%r31 + 0x0001], %r5
	.word 0xcac804a0  ! 3516: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r5
	.word 0x8d902a83  ! 3517: WRPR_PSTATE_I	wrpr	%r0, 0x0a83, %pstate
	.word 0xcac7e030  ! 3518: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r5
	.word 0xcaffc02b  ! 3519: SWAPA_R	swapa	%r5, [%r31 + %r11] 0x01
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	mov 0x32, %r30
	.word 0x9fd0001e  ! 3522: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0xca880e40  ! 3523: LDUBA_R	lduba	[%r0, %r0] 0x72, %r5
	.word 0x26700001  ! 3524: BPL	<illegal instruction>
	.word 0x87802080  ! 3525: WRASI_I	wr	%r0, 0x0080, %asi
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d902c1b  ! 3527: WRPR_PSTATE_I	wrpr	%r0, 0x0c1b, %pstate
	.word 0xcbe7c02b  ! 3528: CASA_I	casa	[%r31] 0x 1, %r11, %r5
	.word 0xcb3fc00b  ! 3529: STDF_R	std	%f5, [%r11, %r31]
	.word 0x819828ca  ! 3530: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08ca, %hpstate
	.word 0x81500000  ! 3531: RDPR_TPC	rdpr	%tpc, %r0
	.word 0xc0c004a0  ! 3532: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r0
	mov 0x33, %r30
	.word 0x9dd0001e  ! 3533: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x95d02031  ! 3534: Tcc_I	tg	icc_or_xcc, %r0 + 49
	.word 0x8ec2e001  ! 3535: ADDCcc_I	addccc 	%r11, 0x0001, %r7
	.word 0xce17e001  ! 3536: LDUH_I	lduh	[%r31 + 0x0001], %r7
	.word 0xce8804a0  ! 3537: LDUBA_R	lduba	[%r0, %r0] 0x25, %r7
	.word 0x81982f8e  ! 3538: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f8e, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x8682e001  ! 3540: ADDcc_I	addcc 	%r11, 0x0001, %r3
	.word 0xc697e030  ! 3541: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r3
	.word 0x8e49c008  ! 3542: MULX_R	mulx 	%r7, %r8, %r7
	.word 0x8d802000  ! 3543: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982c9c  ! 3544: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c9c, %hpstate
	.word 0x87d02035  ! 3545: Tcc_I	tl	icc_or_xcc, %r0 + 53
	.word 0xcedfe010  ! 3546: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r7
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x87a000c9  ! 3548: FNEGd	fnegd	%f40, %f34
	.word 0x87802080  ! 3549: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x24800001  ! 3550: BLE	ble,a	<label_0x1>
	.word 0x9fa00542  ! 3551: FSQRTd	fsqrt	
	.word 0x97a01a6b  ! 3552: FqTOi	fqtoi	
	.word 0x8d90204f  ! 3553: WRPR_PSTATE_I	wrpr	%r0, 0x004f, %pstate
	.word 0x996ba001  ! 3554: SDIVX_I	sdivx	%r14, 0x0001, %r12
	.word 0xd8dfe030  ! 3555: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r12
	ta	T_CHANGE_PRIV	! macro
	.word 0x81982741  ! 3557: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0741, %hpstate
	.word 0xd897e020  ! 3558: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r12
	.word 0x81982e82  ! 3559: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e82, %hpstate
DS_179:
	.word 0x34800001  ! 3561: BG	bg,a	<label_0x1>
	.word 0xcd31c00f  ! 3561: STQF_R	-	%f6, [%r15, %r7]
	.word 0x9d458000  ! 3560: RD_SOFTINT_REG	rd	%softint, %r14
	.word 0x9d500000  ! 3561: RDPR_TPC	rdpr	%tpc, %r14
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x83500000  ! 3563: RDPR_TPC	rdpr	%tpc, %r1
	.word 0x8d9028de  ! 3564: WRPR_PSTATE_I	wrpr	%r0, 0x08de, %pstate
DS_180:
	.word 0x20800001  ! 3566: BN	bn,a	<label_0x1>
	illtrap
	.word 0x8fb08305  ! 3565: ALLIGNADDRESS	alignaddr	%r2, %r5, %r7
	.word 0x81982d48  ! 3566: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d48, %hpstate
	mov 0x35, %r30
	.word 0x8bd0001e  ! 3567: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0xcf37e001  ! 3568: STQF_I	-	%f7, [0x0001, %r31]
	.word 0xcec00e80  ! 3569: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r7
	.word 0x81982e43  ! 3570: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e43, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8c4b2001  ! 3572: MULX_I	mulx 	%r12, 0x0001, %r6
	.word 0x8d902415  ! 3573: WRPR_PSTATE_I	wrpr	%r0, 0x0415, %pstate
	.word 0x8d902813  ! 3574: WRPR_PSTATE_I	wrpr	%r0, 0x0813, %pstate
	.word 0x8f494000  ! 3575: RDHPR_HTBA	rdhpr	%htba, %r7
	.word 0x38800001  ! 3576: BGU	bgu,a	<label_0x1>
	.word 0x88d8c000  ! 3577: SMULcc_R	smulcc 	%r3, %r0, %r4
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc9e7c020  ! 3579: CASA_I	casa	[%r31] 0x 1, %r0, %r4
	.word 0x30700001  ! 3580: BPA	<illegal instruction>
	.word 0xc88008a0  ! 3581: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
	.word 0x8a4b8004  ! 3582: MULX_R	mulx 	%r14, %r4, %r5
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x2a800001  ! 3584: BCS	bcs,a	<label_0x1>
	.word 0x83494000  ! 3585: RDHPR_HTBA	rdhpr	%htba, %r1
	.word 0x8d802000  ! 3586: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8dd02035  ! 3587: Tcc_I	tneg	icc_or_xcc, %r0 + 53
	.word 0x85d02032  ! 3588: Tcc_I	tle	icc_or_xcc, %r0 + 50
	.word 0x9c488008  ! 3589: MULX_R	mulx 	%r2, %r8, %r14
	.word 0x97504000  ! 3590: RDPR_TNPC	rdpr	%tnpc, %r11
	mov 0x34, %r30
	.word 0x89d0001e  ! 3591: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	mov 0x34, %r30
	.word 0x87d0001e  ! 3592: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x87698002  ! 3593: SDIVX_R	sdivx	%r6, %r2, %r3
	.word 0x93d02032  ! 3594: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x8d90264e  ! 3595: WRPR_PSTATE_I	wrpr	%r0, 0x064e, %pstate
	.word 0xc6c00e80  ! 3596: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r3
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x87a00561  ! 3598: FSQRTq	fsqrt	
	.word 0x3e700001  ! 3599: BPVC	<illegal instruction>
	.word 0xc68008a0  ! 3600: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x88802001  ! 3601: ADDcc_I	addcc 	%r0, 0x0001, %r4
	.word 0x9ba000c4  ! 3602: FNEGd	fnegd	%f4, %f44
	.word 0xdad7e010  ! 3603: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r13
	.word 0x9ec2a001  ! 3604: ADDCcc_I	addccc 	%r10, 0x0001, %r15
	.word 0xdec804a0  ! 3605: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r15
	.word 0x87508000  ! 3606: RDPR_TSTATE	rdpr	%tstate, %r3
	.word 0x93d02031  ! 3607: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x8d802000  ! 3608: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc69fe001  ! 3609: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r3
	.word 0x9e02a001  ! 3610: ADD_I	add 	%r10, 0x0001, %r15
	.word 0x32700001  ! 3611: BPNE	<illegal instruction>
	.word 0x8d902881  ! 3612: WRPR_PSTATE_I	wrpr	%r0, 0x0881, %pstate
	.word 0x3e700001  ! 3613: BPVC	<illegal instruction>
	.word 0x8d9022c7  ! 3614: WRPR_PSTATE_I	wrpr	%r0, 0x02c7, %pstate
	.word 0x28800001  ! 3615: BLEU	bleu,a	<label_0x1>
	.word 0x8d9022dc  ! 3616: WRPR_PSTATE_I	wrpr	%r0, 0x02dc, %pstate
	.word 0x97a01a6f  ! 3617: FqTOi	fqtoi	
DS_181:
	.word 0x22800001  ! 3619: BE	be,a	<label_0x1>
	.word 0xcf33a001  ! 3619: STQF_I	-	%f7, [0x0001, %r14]
	.word 0x81458000  ! 3618: RD_SOFTINT_REG	stbar
	.word 0x8d902017  ! 3619: WRPR_PSTATE_I	wrpr	%r0, 0x0017, %pstate
	.word 0x83a00569  ! 3620: FSQRTq	fsqrt	
	.word 0x81982706  ! 3621: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0706, %hpstate
	.word 0x87802080  ! 3622: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x8d802004  ! 3623: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x26700001  ! 3624: BPL	<illegal instruction>
	.word 0x81d02030  ! 3625: Tcc_I	tn	icc_or_xcc, %r0 + 48
	.word 0xc2d00e40  ! 3626: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r1
	.word 0x81982c47  ! 3627: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c47, %hpstate
	.word 0xc28008a0  ! 3628: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0x8a022001  ! 3629: ADD_I	add 	%r8, 0x0001, %r5
	.word 0x8a80a001  ! 3630: ADDcc_I	addcc 	%r2, 0x0001, %r5
	.word 0x81982008  ! 3631: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0008, %hpstate
	.word 0x8d902c86  ! 3632: WRPR_PSTATE_I	wrpr	%r0, 0x0c86, %pstate
	.word 0x93494000  ! 3633: RDHPR_HTBA	rdhpr	%htba, %r9
	.word 0x8d9024d4  ! 3634: WRPR_PSTATE_I	wrpr	%r0, 0x04d4, %pstate
	.word 0x8198294e  ! 3635: WRHPR_HPSTATE_I	wrhpr	%r0, 0x094e, %hpstate
	.word 0x3e800001  ! 3636: BVC	bvc,a	<label_0x1>
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8fa00566  ! 3638: FSQRTq	fsqrt	
	.word 0x87d02030  ! 3639: Tcc_I	tl	icc_or_xcc, %r0 + 48
	mov 0x30, %r30
	.word 0x85d0001e  ! 3640: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x8198220b  ! 3641: WRHPR_HPSTATE_I	wrhpr	%r0, 0x020b, %hpstate
	.word 0x8d902496  ! 3642: WRPR_PSTATE_I	wrpr	%r0, 0x0496, %pstate
	.word 0xcec7e020  ! 3643: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r7
	mov 0x30, %r30
	.word 0x8bd0001e  ! 3644: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0xce9fe001  ! 3645: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r7
	.word 0x88836001  ! 3646: ADDcc_I	addcc 	%r13, 0x0001, %r4
	.word 0x8c68c002  ! 3647: UDIVX_R	udivx 	%r3, %r2, %r6
	.word 0x8d802000  ! 3648: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x836a2001  ! 3649: SDIVX_I	sdivx	%r8, 0x0001, %r1
	.word 0x87d02032  ! 3650: Tcc_I	tl	icc_or_xcc, %r0 + 50
DS_182:
	.word 0x34800001  ! 3652: BG	bg,a	<label_0x1>
	.word 0xc532e001  ! 3652: STQF_I	-	%f2, [0x0001, %r11]
	.word 0x9b458000  ! 3651: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x8d9028d8  ! 3652: WRPR_PSTATE_I	wrpr	%r0, 0x08d8, %pstate
	.word 0x89694009  ! 3653: SDIVX_R	sdivx	%r5, %r9, %r4
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xc847e001  ! 3655: LDSW_I	ldsw	[%r31 + 0x0001], %r4
	.word 0xc937e001  ! 3656: STQF_I	-	%f4, [0x0001, %r31]
	.word 0x8a4a0000  ! 3657: MULX_R	mulx 	%r8, %r0, %r5
	.word 0x84da0004  ! 3658: SMULcc_R	smulcc 	%r8, %r4, %r2
	.word 0x32700001  ! 3659: BPNE	<illegal instruction>
	.word 0x8da20d2b  ! 3660: FsMULd	fsmuld	%f8, %f42, %f6
	.word 0x97500000  ! 3661: RDPR_TPC	rdpr	%tpc, %r11
	.word 0x81982192  ! 3662: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0192, %hpstate
	.word 0x9c4ac00d  ! 3663: MULX_R	mulx 	%r11, %r13, %r14
	.word 0x95a189e6  ! 3664: FDIVq	dis not found

	.word 0x87802080  ! 3665: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xd527e001  ! 3666: STF_I	st	%f10, [0x0001, %r31]
	.word 0x8bd02031  ! 3667: Tcc_I	tcs	icc_or_xcc, %r0 + 49
	.word 0xd4d804a0  ! 3668: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
	.word 0x8ed88001  ! 3669: SMULcc_R	smulcc 	%r2, %r1, %r7
	.word 0x8d90280a  ! 3670: WRPR_PSTATE_I	wrpr	%r0, 0x080a, %pstate
	.word 0x8d90220b  ! 3671: WRPR_PSTATE_I	wrpr	%r0, 0x020b, %pstate
	.word 0x8d902041  ! 3672: WRPR_PSTATE_I	wrpr	%r0, 0x0041, %pstate
	.word 0x8ed84007  ! 3673: SMULcc_R	smulcc 	%r1, %r7, %r7
	.word 0x87802004  ! 3674: WRASI_I	wr	%r0, 0x0004, %asi
	mov 0x34, %r30
	.word 0x9fd0001e  ! 3675: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x87802088  ! 3676: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x83d02033  ! 3677: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x8d902600  ! 3678: WRPR_PSTATE_I	wrpr	%r0, 0x0600, %pstate
	.word 0x8d902609  ! 3679: WRPR_PSTATE_I	wrpr	%r0, 0x0609, %pstate
	.word 0xcfe7c027  ! 3680: CASA_I	casa	[%r31] 0x 1, %r7, %r7
	.word 0x87d02031  ! 3681: Tcc_I	tl	icc_or_xcc, %r0 + 49
	.word 0x30800001  ! 3682: BA	ba,a	<label_0x1>
	.word 0x81982b8d  ! 3683: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b8d, %hpstate
	.word 0x8d902019  ! 3684: WRPR_PSTATE_I	wrpr	%r0, 0x0019, %pstate
	.word 0x8d902215  ! 3685: WRPR_PSTATE_I	wrpr	%r0, 0x0215, %pstate
	.word 0x87514000  ! 3686: RDPR_TBA	rdpr	%tba, %r3
	.word 0x8d9022da  ! 3687: WRPR_PSTATE_I	wrpr	%r0, 0x02da, %pstate
DS_183:
	.word 0x22800001  ! 3689: BE	be,a	<label_0x1>
	illtrap
	.word 0x93b04305  ! 3688: ALLIGNADDRESS	alignaddr	%r1, %r5, %r9
	.word 0xd2c004a0  ! 3689: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r9
	.word 0x8d902a4c  ! 3690: WRPR_PSTATE_I	wrpr	%r0, 0x0a4c, %pstate
	.word 0x81982c03  ! 3691: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c03, %hpstate
	.word 0x8d902c1e  ! 3692: WRPR_PSTATE_I	wrpr	%r0, 0x0c1e, %pstate
DS_184:
	.word 0x20800001  ! 3694: BN	bn,a	<label_0x1>
	.word 0xdb328003  ! 3694: STQF_R	-	%f13, [%r3, %r10]
	.word 0x81458000  ! 3693: RD_SOFTINT_REG	stbar
	.word 0xc0dfe020  ! 3694: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r0
	.word 0x97a0054f  ! 3695: FSQRTd	fsqrt	
	.word 0xd68008a0  ! 3696: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x82d2800c  ! 3697: UMULcc_R	umulcc 	%r10, %r12, %r1
	.word 0x8d802000  ! 3698: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982a40  ! 3699: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a40, %hpstate
	.word 0xc2c00e60  ! 3700: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r1
	.word 0x9b480000  ! 3701: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
	.word 0x8d802000  ! 3702: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xdbe7c02c  ! 3703: CASA_I	casa	[%r31] 0x 1, %r12, %r13
	.word 0x8e49c008  ! 3704: MULX_R	mulx 	%r7, %r8, %r7
	.word 0x8d90281d  ! 3705: WRPR_PSTATE_I	wrpr	%r0, 0x081d, %pstate
	.word 0x81982f58  ! 3706: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f58, %hpstate
	mov 0x31, %r30
	.word 0x93d0001e  ! 3707: Tcc_R	tne	icc_or_xcc, %r0 + %r30
DS_185:
	.word 0x22800001  ! 3709: BE	be,a	<label_0x1>
	.word 0xd331000c  ! 3709: STQF_R	-	%f9, [%r12, %r4]
	.word 0x91458000  ! 3708: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0xd047c000  ! 3709: LDSW_R	ldsw	[%r31 + %r0], %r8
	mov 0x31, %r30
	.word 0x93d0001e  ! 3710: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x2c800001  ! 3711: BNEG	bneg,a	<label_0x1>
	.word 0x87802010  ! 3712: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x26800001  ! 3713: BL	bl,a	<label_0x1>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8ba2cd21  ! 3715: FsMULd	fsmuld	%f11, %f32, %f36
	.word 0x91504000  ! 3716: RDPR_TNPC	rdpr	%tnpc, %r8
	.word 0x81982b06  ! 3717: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b06, %hpstate
	.word 0xd08804a0  ! 3718: LDUBA_R	lduba	[%r0, %r0] 0x25, %r8
	.word 0xd0c004a0  ! 3719: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r8
	.word 0x3a700001  ! 3720: BPCC	<illegal instruction>
	mov 0x32, %r30
	.word 0x99d0001e  ! 3721: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x9c68e001  ! 3722: UDIVX_I	udivx 	%r3, 0x0001, %r14
DS_186:
	.word 0x34800001  ! 3724: BG	bg,a	<label_0x1>
	illtrap
	.word 0x8fb0c306  ! 3723: ALLIGNADDRESS	alignaddr	%r3, %r6, %r7
	.word 0xce9fc020  ! 3724: LDDA_R	ldda	[%r31, %r0] 0x01, %r7
	.word 0x38700001  ! 3725: BPGU	<illegal instruction>
	.word 0x8c022001  ! 3726: ADD_I	add 	%r8, 0x0001, %r6
DS_187:
	.word 0x32800001  ! 3728: BNE	bne,a	<label_0x1>
	.word 0xc333a001  ! 3728: STQF_I	-	%f1, [0x0001, %r14]
	.word 0x9b458000  ! 3727: RD_SOFTINT_REG	rd	%softint, %r13
	mov 0x33, %r30
	.word 0x9dd0001e  ! 3728: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	mov 0x32, %r30
	.word 0x9bd0001e  ! 3729: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x99d02033  ! 3730: Tcc_I	tgu	icc_or_xcc, %r0 + 51
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xdaffc026  ! 3732: SWAPA_R	swapa	%r13, [%r31 + %r6] 0x01
	.word 0x81982ac1  ! 3733: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ac1, %hpstate
	.word 0x8d902cde  ! 3734: WRPR_PSTATE_I	wrpr	%r0, 0x0cde, %pstate
	.word 0xdac7e030  ! 3735: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r13
	.word 0x85a00545  ! 3736: FSQRTd	fsqrt	
	.word 0x8d90265e  ! 3737: WRPR_PSTATE_I	wrpr	%r0, 0x065e, %pstate
	.word 0x85a34dc5  ! 3738: FdMULq	fdmulq	
	.word 0x95a01a6d  ! 3739: FqTOi	fqtoi	
	.word 0xd527e001  ! 3740: STF_I	st	%f10, [0x0001, %r31]
	.word 0x81982b82  ! 3741: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b82, %hpstate
	.word 0x8d90284d  ! 3742: WRPR_PSTATE_I	wrpr	%r0, 0x084d, %pstate
	.word 0xd527e001  ! 3743: STF_I	st	%f10, [0x0001, %r31]
	.word 0x8d902285  ! 3744: WRPR_PSTATE_I	wrpr	%r0, 0x0285, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd48008a0  ! 3746: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x8d90264b  ! 3747: WRPR_PSTATE_I	wrpr	%r0, 0x064b, %pstate
	.word 0x8d902099  ! 3748: WRPR_PSTATE_I	wrpr	%r0, 0x0099, %pstate
	.word 0x887be001  ! 3749: SDIV_I	sdiv 	%r15, 0x0001, %r4
	ta	T_CHANGE_PRIV	! macro
	.word 0xc9e7c02d  ! 3751: CASA_I	casa	[%r31] 0x 1, %r13, %r4
	.word 0x9079c006  ! 3752: SDIV_R	sdiv 	%r7, %r6, %r8
	.word 0xd0ffc026  ! 3753: SWAPA_R	swapa	%r8, [%r31 + %r6] 0x01
	.word 0x8d902a08  ! 3754: WRPR_PSTATE_I	wrpr	%r0, 0x0a08, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x8ba00542  ! 3756: FSQRTd	fsqrt	
	.word 0x24800001  ! 3757: BLE	ble,a	<label_0x1>
	.word 0x8b514000  ! 3758: RDPR_TBA	rdpr	%tba, %r5
	.word 0x81982794  ! 3759: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0794, %hpstate
	.word 0x8468c00f  ! 3760: UDIVX_R	udivx 	%r3, %r15, %r2
	.word 0xc4800c60  ! 3761: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r2
	.word 0x8d902458  ! 3762: WRPR_PSTATE_I	wrpr	%r0, 0x0458, %pstate
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
DS_188:
	.word 0x32800001  ! 3766: BNE	bne,a	<label_0x1>
	.word 0xc3312001  ! 3766: STQF_I	-	%f1, [0x0001, %r4]
	.word 0x9b458000  ! 3765: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0xda8008a0  ! 3766: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x8d902648  ! 3767: WRPR_PSTATE_I	wrpr	%r0, 0x0648, %pstate
	.word 0x8d902657  ! 3768: WRPR_PSTATE_I	wrpr	%r0, 0x0657, %pstate
	.word 0x97d02033  ! 3769: Tcc_I	tge	icc_or_xcc, %r0 + 51
	mov 0x32, %r30
	.word 0x9fd0001e  ! 3770: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0x8fa3c9a2  ! 3772: FDIVs	fdivs	%f15, %f2, %f7
	.word 0xce900e60  ! 3773: LDUHA_R	lduha	[%r0, %r0] 0x73, %r7
	.word 0x844ac009  ! 3774: MULX_R	mulx 	%r11, %r9, %r2
	.word 0x8d90220f  ! 3775: WRPR_PSTATE_I	wrpr	%r0, 0x020f, %pstate
	.word 0x88d36001  ! 3776: UMULcc_I	umulcc 	%r13, 0x0001, %r4
	.word 0xc8800aa0  ! 3777: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r4
	.word 0x22700001  ! 3778: BPE	<illegal instruction>
	.word 0x819826d1  ! 3779: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06d1, %hpstate
	.word 0xc8d804a0  ! 3780: LDXA_R	ldxa	[%r0, %r0] 0x25, %r4
	.word 0x81982cdc  ! 3781: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cdc, %hpstate
	.word 0x8fa2cdc7  ! 3782: FdMULq	fdmulq	
	.word 0x8ad1800e  ! 3783: UMULcc_R	umulcc 	%r6, %r14, %r5
	.word 0x80780007  ! 3784: SDIV_R	sdiv 	%r0, %r7, %r0
	.word 0x96d9c005  ! 3785: SMULcc_R	smulcc 	%r7, %r5, %r11
	.word 0x8d902e91  ! 3786: WRPR_PSTATE_I	wrpr	%r0, 0x0e91, %pstate
	.word 0x88538006  ! 3787: UMUL_R	umul 	%r14, %r6, %r4
	.word 0x8d802000  ! 3788: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d902413  ! 3789: WRPR_PSTATE_I	wrpr	%r0, 0x0413, %pstate
	.word 0x99500000  ! 3790: RDPR_TPC	rdpr	%tpc, %r12
	.word 0x87802088  ! 3791: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x87802016  ! 3792: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xd89fe001  ! 3793: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r12
DS_189:
	.word 0x20800001  ! 3795: BN	bn,a	<label_0x1>
	illtrap
	.word 0x87b24305  ! 3794: ALLIGNADDRESS	alignaddr	%r9, %r5, %r3
	.word 0x92796001  ! 3795: SDIV_I	sdiv 	%r5, 0x0001, %r9
	.word 0x3c800001  ! 3796: BPOS	bpos,a	<label_0x1>
	.word 0x8d802000  ! 3797: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd2bfc025  ! 3798: STDA_R	stda	%r9, [%r31 + %r5] 0x01
	.word 0x9fa24dc6  ! 3799: FdMULq	fdmulq	
	.word 0x81982eda  ! 3800: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0eda, %hpstate
	.word 0x9150c000  ! 3801: RDPR_TT	rdpr	%tt, %r8
	.word 0x9da2c9e0  ! 3802: FDIVq	dis not found

	ta	T_CHANGE_PRIV	! macro
	.word 0x8551c000  ! 3804: RDPR_TL	rdpr	%tl, %r2
	.word 0xc527e001  ! 3805: STF_I	st	%f2, [0x0001, %r31]
	.word 0x9ed26001  ! 3806: UMULcc_I	umulcc 	%r9, 0x0001, %r15
	.word 0xdebfe001  ! 3807: STDA_I	stda	%r15, [%r31 + 0x0001] %asi
	.word 0xdeffc020  ! 3808: SWAPA_R	swapa	%r15, [%r31 + %r0] 0x01
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xde800b20  ! 3810: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r15
	.word 0x8d802000  ! 3811: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982a56  ! 3812: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a56, %hpstate
	.word 0x3a800001  ! 3813: BCC	bcc,a	<label_0x1>
	.word 0x9468e001  ! 3814: UDIVX_I	udivx 	%r3, 0x0001, %r10
	.word 0xd527e001  ! 3815: STF_I	st	%f10, [0x0001, %r31]
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd4d80e40  ! 3817: LDXA_R	ldxa	[%r0, %r0] 0x72, %r10
	.word 0x81504000  ! 3818: RDPR_TNPC	rdpr	%tnpc, %r0
	.word 0x81982cd7  ! 3819: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd7, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d9028d3  ! 3821: WRPR_PSTATE_I	wrpr	%r0, 0x08d3, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc09fc020  ! 3823: LDDA_R	ldda	[%r31, %r0] 0x01, %r0
	.word 0x8a83c00e  ! 3824: ADDcc_R	addcc 	%r15, %r14, %r5
	.word 0x8d802000  ! 3825: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xca97e000  ! 3826: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r5
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d9028c6  ! 3828: WRPR_PSTATE_I	wrpr	%r0, 0x08c6, %pstate
	.word 0x87802014  ! 3829: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x9bd02030  ! 3830: Tcc_I	tcc	icc_or_xcc, %r0 + 48
	.word 0x8d902c86  ! 3831: WRPR_PSTATE_I	wrpr	%r0, 0x0c86, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81982343  ! 3833: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0343, %hpstate
	.word 0x8d902e58  ! 3834: WRPR_PSTATE_I	wrpr	%r0, 0x0e58, %pstate
	.word 0xca8008a0  ! 3835: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0x8d802000  ! 3836: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d90200d  ! 3837: WRPR_PSTATE_I	wrpr	%r0, 0x000d, %pstate
DS_190:
	.word 0x34800001  ! 3839: BG	bg,a	<label_0x1>
	.word 0xc932a001  ! 3839: STQF_I	-	%f4, [0x0001, %r10]
	.word 0x8d458000  ! 3838: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0x9da3cdc6  ! 3839: FdMULq	fdmulq	
	.word 0x9b504000  ! 3840: RDPR_TNPC	rdpr	%tnpc, %r13
	.word 0x20800001  ! 3841: BN	bn,a	<label_0x1>
	mov 0x34, %r30
	.word 0x87d0001e  ! 3842: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x81982c89  ! 3844: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c89, %hpstate
	.word 0x9da3cd2f  ! 3845: FsMULd	fsmuld	%f15, %f46, %f14
	.word 0x8d90224c  ! 3846: WRPR_PSTATE_I	wrpr	%r0, 0x024c, %pstate
	.word 0xdd27c00f  ! 3847: STF_R	st	%f14, [%r15, %r31]
	.word 0xdcd7e010  ! 3848: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r14
	.word 0xdd27e001  ! 3849: STF_I	st	%f14, [0x0001, %r31]
	.word 0x8198224e  ! 3850: WRHPR_HPSTATE_I	wrhpr	%r0, 0x024e, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8cd8000d  ! 3853: SMULcc_R	smulcc 	%r0, %r13, %r6
	mov 0x35, %r30
	.word 0x95d0001e  ! 3854: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 3855: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x94484002  ! 3856: MULX_R	mulx 	%r1, %r2, %r10
	.word 0x8d902c09  ! 3857: WRPR_PSTATE_I	wrpr	%r0, 0x0c09, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9e7bc003  ! 3859: SDIV_R	sdiv 	%r15, %r3, %r15
	.word 0xded7e030  ! 3860: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r15
	mov 0x30, %r30
	.word 0x8fd0001e  ! 3861: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0xde800c00  ! 3862: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r15
	.word 0xde8fe030  ! 3863: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r15
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d902687  ! 3865: WRPR_PSTATE_I	wrpr	%r0, 0x0687, %pstate
	.word 0x83508000  ! 3866: RDPR_TSTATE	rdpr	%tstate, %r1
	.word 0x8d9022de  ! 3867: WRPR_PSTATE_I	wrpr	%r0, 0x02de, %pstate
	.word 0x81982892  ! 3868: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0892, %hpstate
	.word 0x92d36001  ! 3869: UMULcc_I	umulcc 	%r13, 0x0001, %r9
	.word 0x8d902c08  ! 3870: WRPR_PSTATE_I	wrpr	%r0, 0x0c08, %pstate
	.word 0x32700001  ! 3871: BPNE	<illegal instruction>
	.word 0xd337c003  ! 3872: STQF_R	-	%f9, [%r3, %r31]
	.word 0xd247e001  ! 3873: LDSW_I	ldsw	[%r31 + 0x0001], %r9
	.word 0x81a149c7  ! 3874: FDIVd	fdivd	%f36, %f38, %f0
	.word 0x8d902a99  ! 3875: WRPR_PSTATE_I	wrpr	%r0, 0x0a99, %pstate
	.word 0xc00fc000  ! 3876: LDUB_R	ldub	[%r31 + %r0], %r0
	.word 0x80c3e001  ! 3877: ADDCcc_I	addccc 	%r15, 0x0001, %r0
	.word 0xc037e001  ! 3878: STH_I	sth	%r0, [%r31 + 0x0001]
	.word 0xc097e010  ! 3879: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r0
	.word 0xc08804a0  ! 3880: LDUBA_R	lduba	[%r0, %r0] 0x25, %r0
	.word 0x8d902a15  ! 3881: WRPR_PSTATE_I	wrpr	%r0, 0x0a15, %pstate
	.word 0xc097e000  ! 3882: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r0
	.word 0x8f6b6001  ! 3883: SDIVX_I	sdivx	%r13, 0x0001, %r7
	.word 0x8d902205  ! 3884: WRPR_PSTATE_I	wrpr	%r0, 0x0205, %pstate
	.word 0x8d90228c  ! 3885: WRPR_PSTATE_I	wrpr	%r0, 0x028c, %pstate
	.word 0x8d902e42  ! 3886: WRPR_PSTATE_I	wrpr	%r0, 0x0e42, %pstate
	.word 0x8198208a  ! 3887: WRHPR_HPSTATE_I	wrhpr	%r0, 0x008a, %hpstate
	.word 0xce27e001  ! 3888: STW_I	stw	%r7, [%r31 + 0x0001]
	.word 0x8d9024da  ! 3889: WRPR_PSTATE_I	wrpr	%r0, 0x04da, %pstate
	.word 0x81982a87  ! 3890: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a87, %hpstate
	mov 0x30, %r30
	.word 0x9bd0001e  ! 3891: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x8d902c1d  ! 3892: WRPR_PSTATE_I	wrpr	%r0, 0x0c1d, %pstate
	.word 0x8d902685  ! 3893: WRPR_PSTATE_I	wrpr	%r0, 0x0685, %pstate
	.word 0xce9fe001  ! 3894: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r7
	.word 0x99a20dc0  ! 3895: FdMULq	fdmulq	
DS_191:
	.word 0x20800001  ! 3897: BN	bn,a	<label_0x1>
	illtrap
	.word 0x9bb3830d  ! 3896: ALLIGNADDRESS	alignaddr	%r14, %r13, %r13
	.word 0x9a806001  ! 3897: ADDcc_I	addcc 	%r1, 0x0001, %r13
	.word 0xda47c000  ! 3898: LDSW_R	ldsw	[%r31 + %r0], %r13
	mov 0x32, %r30
	.word 0x9dd0001e  ! 3899: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x8d902080  ! 3900: WRPR_PSTATE_I	wrpr	%r0, 0x0080, %pstate
DS_192:
	.word 0x22800001  ! 3902: BE	be,a	<label_0x1>
	.word 0xdd30c009  ! 3902: STQF_R	-	%f14, [%r9, %r3]
	.word 0x8d458000  ! 3901: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0x9b514000  ! 3902: RDPR_TBA	rdpr	%tba, %r13
	.word 0x8198221d  ! 3903: WRHPR_HPSTATE_I	wrhpr	%r0, 0x021d, %hpstate
DS_193:
	.word 0x34800001  ! 3905: BG	bg,a	<label_0x1>
	.word 0xdf322001  ! 3905: STQF_I	-	%f15, [0x0001, %r8]
	.word 0x81458000  ! 3904: RD_SOFTINT_REG	stbar
	.word 0x95500000  ! 3905: RDPR_TPC	rdpr	%tpc, %r10
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87d02031  ! 3907: Tcc_I	tl	icc_or_xcc, %r0 + 49
	.word 0xd527e001  ! 3908: STF_I	st	%f10, [0x0001, %r31]
	.word 0x8750c000  ! 3909: RDPR_TT	rdpr	%tt, %r3
	.word 0x3e800001  ! 3910: BVC	bvc,a	<label_0x1>
	ta	T_CHANGE_NONPRIV	! macro
	mov 0x34, %r30
	.word 0x85d0001e  ! 3912: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x91a0056b  ! 3913: FSQRTq	fsqrt	
	mov 0x34, %r30
	.word 0x8bd0001e  ! 3914: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
DS_194:
	.word 0x20800001  ! 3916: BN	bn,a	<label_0x1>
	illtrap
	.word 0x89b3c30a  ! 3915: ALLIGNADDRESS	alignaddr	%r15, %r10, %r4
DS_195:
	.word 0x20800001  ! 3917: BN	bn,a	<label_0x1>
	illtrap
	.word 0x8fb30307  ! 3916: ALLIGNADDRESS	alignaddr	%r12, %r7, %r7
DS_196:
	.word 0x32800001  ! 3918: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x95b3c301  ! 3917: ALLIGNADDRESS	alignaddr	%r15, %r1, %r10
	.word 0x3a700001  ! 3918: BPCC	<illegal instruction>
	.word 0x81982a55  ! 3919: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a55, %hpstate
	.word 0x84d9c002  ! 3920: SMULcc_R	smulcc 	%r7, %r2, %r2
	.word 0x8d802000  ! 3921: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x32800001  ! 3922: BNE	bne,a	<label_0x1>
	.word 0x24700001  ! 3923: BPLE	<illegal instruction>
	.word 0xc527c002  ! 3924: STF_R	st	%f2, [%r2, %r31]
	.word 0xc48008a0  ! 3925: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0xc4d00e80  ! 3926: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r2
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0x3a700001  ! 3931: BPCC	<illegal instruction>
	.word 0x9dd02034  ! 3932: Tcc_I	tpos	icc_or_xcc, %r0 + 52
	.word 0x99a000c1  ! 3933: FNEGd	fnegd	%f32, %f12
	.word 0x8198290f  ! 3934: WRHPR_HPSTATE_I	wrhpr	%r0, 0x090f, %hpstate
	.word 0x8851c004  ! 3935: UMUL_R	umul 	%r7, %r4, %r4
	.word 0x3a800001  ! 3936: BCC	bcc,a	<label_0x1>
	.word 0x2c800001  ! 3937: BNEG	bneg,a	<label_0x1>
DS_197:
	.word 0x20800001  ! 3939: BN	bn,a	<label_0x1>
	illtrap
	.word 0x89b04308  ! 3938: ALLIGNADDRESS	alignaddr	%r1, %r8, %r4
	.word 0x81982e18  ! 3939: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e18, %hpstate
	.word 0x8049000f  ! 3940: MULX_R	mulx 	%r4, %r15, %r0
	mov 0x30, %r30
	.word 0x85d0001e  ! 3941: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0xc08008a0  ! 3942: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0xc07fe001  ! 3943: SWAP_I	swap	%r0, [%r31 + 0x0001]
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902a06  ! 3945: WRPR_PSTATE_I	wrpr	%r0, 0x0a06, %pstate
	.word 0xc08008a0  ! 3946: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0x8198234b  ! 3947: WRHPR_HPSTATE_I	wrhpr	%r0, 0x034b, %hpstate
	.word 0x95514000  ! 3948: RDPR_TBA	rdpr	%tba, %r10
	.word 0xd427c00f  ! 3949: STW_R	stw	%r10, [%r31 + %r15]
	.word 0xd48008a0  ! 3950: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x87802080  ! 3951: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xd477c00f  ! 3952: STX_R	stx	%r10, [%r31 + %r15]
	.word 0x8b514000  ! 3953: RDPR_TBA	rdpr	%tba, %r5
	.word 0x9ba009c9  ! 3954: FDIVd	fdivd	%f0, %f40, %f44
	.word 0xdad00e40  ! 3955: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r13
	.word 0x81982443  ! 3956: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0443, %hpstate
	.word 0x9bd02035  ! 3957: Tcc_I	tcc	icc_or_xcc, %r0 + 53
	.word 0x95d02031  ! 3958: Tcc_I	tg	icc_or_xcc, %r0 + 49
	.word 0x8d902c87  ! 3959: WRPR_PSTATE_I	wrpr	%r0, 0x0c87, %pstate
	.word 0x81982bc6  ! 3960: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc6, %hpstate
	.word 0x8868c00d  ! 3961: UDIVX_R	udivx 	%r3, %r13, %r4
	.word 0x87802004  ! 3962: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x95d02033  ! 3963: Tcc_I	tg	icc_or_xcc, %r0 + 51
	.word 0xc897e030  ! 3964: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r4
	.word 0x81982e1b  ! 3965: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e1b, %hpstate
	.word 0xc937e001  ! 3966: STQF_I	-	%f4, [0x0001, %r31]
	.word 0x819824c5  ! 3967: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04c5, %hpstate
	.word 0xc89fe001  ! 3968: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r4
	.word 0x81982c45  ! 3969: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c45, %hpstate
	.word 0x38800001  ! 3970: BGU	bgu,a	<label_0x1>
	.word 0x94d10006  ! 3971: UMULcc_R	umulcc 	%r4, %r6, %r10
	.word 0x2a700001  ! 3972: BPCS	<illegal instruction>
	.word 0xd4d004a0  ! 3973: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
	.word 0x89d02033  ! 3974: Tcc_I	tleu	icc_or_xcc, %r0 + 51
	.word 0x844a0004  ! 3975: MULX_R	mulx 	%r8, %r4, %r2
	.word 0x20800001  ! 3976: BN	bn,a	<label_0x1>
	.word 0x8198281b  ! 3977: WRHPR_HPSTATE_I	wrhpr	%r0, 0x081b, %hpstate
	.word 0xc427c004  ! 3978: STW_R	stw	%r2, [%r31 + %r4]
DS_198:
	.word 0x22800001  ! 3980: BE	be,a	<label_0x1>
	illtrap
	.word 0x8fb2c30f  ! 3979: ALLIGNADDRESS	alignaddr	%r11, %r15, %r7
	.word 0x8350c000  ! 3980: RDPR_TT	rdpr	%tt, %r1
	mov 0x34, %r30
	.word 0x9bd0001e  ! 3981: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x99494000  ! 3982: RDHPR_HTBA	rdhpr	%htba, %r12
	.word 0x81a18dc2  ! 3983: FdMULq	fdmulq	
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902013  ! 3985: WRPR_PSTATE_I	wrpr	%r0, 0x0013, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc0880e40  ! 3987: LDUBA_R	lduba	[%r0, %r0] 0x72, %r0
	.word 0x8d902807  ! 3988: WRPR_PSTATE_I	wrpr	%r0, 0x0807, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x93d02034  ! 3990: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x8dd02035  ! 3991: Tcc_I	tneg	icc_or_xcc, %r0 + 53
DS_199:
	.word 0x32800001  ! 3993: BNE	bne,a	<label_0x1>
	.word 0xc5326001  ! 3993: STQF_I	-	%f2, [0x0001, %r9]
	.word 0x93458000  ! 3992: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x8d90265f  ! 3993: WRPR_PSTATE_I	wrpr	%r0, 0x065f, %pstate
	.word 0xd20fe001  ! 3994: LDUB_I	ldub	[%r31 + 0x0001], %r9
	.word 0x8d902edc  ! 3995: WRPR_PSTATE_I	wrpr	%r0, 0x0edc, %pstate
	.word 0xd24fc000  ! 3996: LDSB_R	ldsb	[%r31 + %r0], %r9
	.word 0xd28fe000  ! 3997: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r9
	.word 0x9dd02030  ! 3998: Tcc_I	tpos	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_PRIV	! macro
	.word 0xd2dfe000  ! 4000: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r9
	.word 0x80c0a001  ! 4001: ADDCcc_I	addccc 	%r2, 0x0001, %r0
	.word 0xc08008a0  ! 4002: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0xc05fe001  ! 4003: LDX_I	ldx	[%r31 + 0x0001], %r0
	.word 0x8d802000  ! 4004: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87802089  ! 4005: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x99a00562  ! 4006: FSQRTq	fsqrt	
	.word 0xd88008a0  ! 4007: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	mov 0x34, %r30
	.word 0x91d0001e  ! 4008: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982e50  ! 4009: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e50, %hpstate
	.word 0x81982c43  ! 4010: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c43, %hpstate
	.word 0x84d36001  ! 4011: UMULcc_I	umulcc 	%r13, 0x0001, %r2
	.word 0x8d902412  ! 4012: WRPR_PSTATE_I	wrpr	%r0, 0x0412, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0xc49004a0  ! 4014: LDUHA_R	lduha	[%r0, %r0] 0x25, %r2
	.word 0x36700001  ! 4015: BPGE	<illegal instruction>
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902e92  ! 4017: WRPR_PSTATE_I	wrpr	%r0, 0x0e92, %pstate
DS_200:
	.word 0x22800001  ! 4019: BE	be,a	<label_0x1>
	illtrap
	.word 0x8bb2430d  ! 4018: ALLIGNADDRESS	alignaddr	%r9, %r13, %r5
	.word 0xcb27c00d  ! 4019: STF_R	st	%f5, [%r13, %r31]
	.word 0x32800001  ! 4020: BNE	bne,a	<label_0x1>
	.word 0x20800001  ! 4021: BN	bn,a	<label_0x1>
	.word 0x8d902691  ! 4022: WRPR_PSTATE_I	wrpr	%r0, 0x0691, %pstate
	.word 0xca8008a0  ! 4023: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0x8a698000  ! 4024: UDIVX_R	udivx 	%r6, %r0, %r5
	.word 0xca27e001  ! 4025: STW_I	stw	%r5, [%r31 + 0x0001]
	.word 0x8f686001  ! 4026: SDIVX_I	sdivx	%r1, 0x0001, %r7
	.word 0xce17c000  ! 4027: LDUH_R	lduh	[%r31 + %r0], %r7
	.word 0x87802004  ! 4028: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xcf37e001  ! 4029: STQF_I	-	%f7, [0x0001, %r31]
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d802000  ! 4031: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_201:
	.word 0x34800001  ! 4033: BG	bg,a	<label_0x1>
	illtrap
	.word 0x95b3c30b  ! 4032: ALLIGNADDRESS	alignaddr	%r15, %r11, %r10
	.word 0x81982dd3  ! 4033: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dd3, %hpstate
	.word 0x96d1800d  ! 4034: UMULcc_R	umulcc 	%r6, %r13, %r11
	.word 0xd6ffc02d  ! 4035: SWAPA_R	swapa	%r11, [%r31 + %r13] 0x01
	mov 0x31, %r30
	.word 0x8dd0001e  ! 4036: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x9451000b  ! 4038: UMUL_R	umul 	%r4, %r11, %r10
	.word 0xd457c000  ! 4039: LDSH_R	ldsh	[%r31 + %r0], %r10
	.word 0x83a20dcc  ! 4040: FdMULq	fdmulq	
	.word 0xc33fe001  ! 4041: STDF_I	std	%f1, [0x0001, %r31]
	.word 0xc28008a0  ! 4042: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81982ed1  ! 4045: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed1, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x916ac007  ! 4047: SDIVX_R	sdivx	%r11, %r7, %r8
	.word 0x20700001  ! 4048: BPN	<illegal instruction>
	mov 0x35, %r30
	.word 0x93d0001e  ! 4049: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x904ac008  ! 4051: MULX_R	mulx 	%r11, %r8, %r8
	.word 0x89514000  ! 4052: RDPR_TBA	rdpr	%tba, %r4
	mov 0x33, %r30
	.word 0x9fd0001e  ! 4053: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x83d02034  ! 4054: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x8d802000  ! 4055: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc88fe010  ! 4056: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r4
	.word 0x8d902050  ! 4057: WRPR_PSTATE_I	wrpr	%r0, 0x0050, %pstate
	.word 0x804a800e  ! 4058: MULX_R	mulx 	%r10, %r14, %r0
	.word 0x81982a09  ! 4059: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a09, %hpstate
	.word 0xc097e020  ! 4060: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r0
	.word 0xc08008a0  ! 4061: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0xc08008a0  ! 4062: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0xc09004a0  ! 4063: LDUHA_R	lduha	[%r0, %r0] 0x25, %r0
	.word 0x87802004  ! 4064: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8ba00546  ! 4065: FSQRTd	fsqrt	
	.word 0xca8fe010  ! 4066: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r5
	.word 0xca800a80  ! 4067: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r5
	mov 0x34, %r30
	.word 0x95d0001e  ! 4068: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x81982bd8  ! 4069: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bd8, %hpstate
	.word 0xcad004a0  ! 4070: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r5
	.word 0x8198284c  ! 4071: WRHPR_HPSTATE_I	wrhpr	%r0, 0x084c, %hpstate
	.word 0x28800001  ! 4072: BLEU	bleu,a	<label_0x1>
	.word 0xca8fe000  ! 4073: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r5
	.word 0xcb27e001  ! 4074: STF_I	st	%f5, [0x0001, %r31]
	.word 0x38800001  ! 4075: BGU	bgu,a	<label_0x1>
	.word 0x92822001  ! 4076: ADDcc_I	addcc 	%r8, 0x0001, %r9
	.word 0x816b2001  ! 4077: SDIVX_I	sdivx	%r12, 0x0001, %r0
	.word 0x81982c49  ! 4078: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c49, %hpstate
	.word 0x99514000  ! 4079: RDPR_TBA	rdpr	%tba, %r12
	.word 0xd847c000  ! 4080: LDSW_R	ldsw	[%r31 + %r0], %r12
	.word 0x8ec0a001  ! 4081: ADDCcc_I	addccc 	%r2, 0x0001, %r7
	.word 0x90006001  ! 4082: ADD_I	add 	%r1, 0x0001, %r8
	.word 0xd137e001  ! 4083: STQF_I	-	%f8, [0x0001, %r31]
	.word 0xd0dfe020  ! 4084: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r8
	.word 0x8198259e  ! 4085: WRHPR_HPSTATE_I	wrhpr	%r0, 0x059e, %hpstate
	.word 0xd127c006  ! 4086: STF_R	st	%f8, [%r6, %r31]
	.word 0xd0c804a0  ! 4087: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r8
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d9028cc  ! 4089: WRPR_PSTATE_I	wrpr	%r0, 0x08cc, %pstate
	.word 0x81982a8a  ! 4090: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a8a, %hpstate
	.word 0x984b0002  ! 4091: MULX_R	mulx 	%r12, %r2, %r12
	.word 0x95d02033  ! 4092: Tcc_I	tg	icc_or_xcc, %r0 + 51
	.word 0x92524004  ! 4093: UMUL_R	umul 	%r9, %r4, %r9
	.word 0x8b494000  ! 4094: RDHPR_HTBA	rdhpr	%htba, %r5
	.word 0x81982595  ! 4095: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0595, %hpstate
	.word 0x8d902409  ! 4096: WRPR_PSTATE_I	wrpr	%r0, 0x0409, %pstate
	.word 0x89a28dc0  ! 4097: FdMULq	fdmulq	
	.word 0x87802080  ! 4098: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x81982441  ! 4099: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0441, %hpstate
	.word 0xc87fe001  ! 4100: SWAP_I	swap	%r4, [%r31 + 0x0001]
	.word 0x87802088  ! 4101: WRASI_I	wr	%r0, 0x0088, %asi
	mov 0x34, %r30
	.word 0x97d0001e  ! 4102: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x9f6a0004  ! 4103: SDIVX_R	sdivx	%r8, %r4, %r15
	.word 0x8b692001  ! 4104: SDIVX_I	sdivx	%r4, 0x0001, %r5
	.word 0xcb3fe001  ! 4105: STDF_I	std	%f5, [0x0001, %r31]
	.word 0x3a700001  ! 4106: BPCC	<illegal instruction>
	.word 0xcb27c004  ! 4107: STF_R	st	%f5, [%r4, %r31]
	.word 0x99d02033  ! 4108: Tcc_I	tgu	icc_or_xcc, %r0 + 51
	.word 0x8198255e  ! 4109: WRHPR_HPSTATE_I	wrhpr	%r0, 0x055e, %hpstate
	.word 0xcb3fe001  ! 4110: STDF_I	std	%f5, [0x0001, %r31]
	.word 0x87802016  ! 4111: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x2a700001  ! 4112: BPCS	<illegal instruction>
	.word 0xca0fe001  ! 4113: LDUB_I	ldub	[%r31 + 0x0001], %r5
	mov 0x31, %r30
	.word 0x99d0001e  ! 4114: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x81982f93  ! 4115: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f93, %hpstate
	.word 0x81982a0b  ! 4116: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a0b, %hpstate
	.word 0x8d802000  ! 4117: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8fa00563  ! 4118: FSQRTq	fsqrt	
	.word 0x84680008  ! 4119: UDIVX_R	udivx 	%r0, %r8, %r2
	.word 0x88688006  ! 4120: UDIVX_R	udivx 	%r2, %r6, %r4
	.word 0x9c80a001  ! 4121: ADDcc_I	addcc 	%r2, 0x0001, %r14
	ta	T_CHANGE_PRIV	! macro
	.word 0xdc900e60  ! 4123: LDUHA_R	lduha	[%r0, %r0] 0x73, %r14
	.word 0x8d802004  ! 4124: WRFPRS_I	wr	%r0, 0x0004, %fprs
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d802004  ! 4126: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x81982b46  ! 4127: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b46, %hpstate
	mov 0x34, %r30
	.word 0x81d0001e  ! 4128: Tcc_R	tn	icc_or_xcc, %r0 + %r30
DS_202:
	.word 0x34800001  ! 4130: BG	bg,a	<label_0x1>
	illtrap
	.word 0x9fb18309  ! 4129: ALLIGNADDRESS	alignaddr	%r6, %r9, %r15
	.word 0x8b68000d  ! 4130: SDIVX_R	sdivx	%r0, %r13, %r5
	.word 0x91680003  ! 4131: SDIVX_R	sdivx	%r0, %r3, %r8
	.word 0x38700001  ! 4132: BPGU	<illegal instruction>
	mov 0x35, %r30
	.word 0x83d0001e  ! 4133: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8168a001  ! 4134: SDIVX_I	sdivx	%r2, 0x0001, %r0
	.word 0x83a289e9  ! 4135: FDIVq	dis not found

	.word 0x81982b51  ! 4136: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b51, %hpstate
	.word 0xc21fe001  ! 4137: LDD_I	ldd	[%r31 + 0x0001], %r1
	.word 0x83d02031  ! 4138: Tcc_I	te	icc_or_xcc, %r0 + 49
	mov 0x33, %r30
	.word 0x81d0001e  ! 4139: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x87802004  ! 4140: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x20800001  ! 4141: BN	bn,a	<label_0x1>
	.word 0x8dd02031  ! 4142: Tcc_I	tneg	icc_or_xcc, %r0 + 49
	.word 0xc2ffc029  ! 4143: SWAPA_R	swapa	%r1, [%r31 + %r9] 0x01
	.word 0x30700001  ! 4144: BPA	<illegal instruction>
	.word 0x8d802000  ! 4145: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc2c7e030  ! 4146: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r1
DS_203:
	.word 0x20800001  ! 4148: BN	bn,a	<label_0x1>
	illtrap
	.word 0x9db0830f  ! 4147: ALLIGNADDRESS	alignaddr	%r2, %r15, %r14
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9fd02030  ! 4149: Tcc_I	tvc	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8da01a6b  ! 4151: FqTOi	fqtoi	
	.word 0x8c7a6001  ! 4152: SDIV_I	sdiv 	%r9, 0x0001, %r6
	.word 0xccc004a0  ! 4153: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r6
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x20800001  ! 4155: BN	bn,a	<label_0x1>
	.word 0xcc3fc00b  ! 4156: STD_R	std	%r6, [%r31 + %r11]
	.word 0x81500000  ! 4157: RDPR_TPC	rdpr	%tpc, %r0
	.word 0x34700001  ! 4158: BPG	<illegal instruction>
	.word 0x8d90284d  ! 4159: WRPR_PSTATE_I	wrpr	%r0, 0x084d, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8b504000  ! 4161: RDPR_TNPC	rdpr	%tnpc, %r5
	.word 0x9683000b  ! 4162: ADDcc_R	addcc 	%r12, %r11, %r11
	.word 0x87802010  ! 4163: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x9b504000  ! 4164: RDPR_TNPC	rdpr	%tnpc, %r13
	.word 0x22800001  ! 4165: BE	be,a	<label_0x1>
	.word 0xdad80e80  ! 4166: LDXA_R	ldxa	[%r0, %r0] 0x74, %r13
	.word 0xdaffc02b  ! 4167: SWAPA_R	swapa	%r13, [%r31 + %r11] 0x01
	.word 0xda8008a0  ! 4168: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x9fa01a67  ! 4169: FqTOi	fqtoi	
	mov 0x30, %r30
	.word 0x8fd0001e  ! 4170: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x93d02033  ! 4171: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x8d902200  ! 4172: WRPR_PSTATE_I	wrpr	%r0, 0x0200, %pstate
	.word 0x8d902a8a  ! 4173: WRPR_PSTATE_I	wrpr	%r0, 0x0a8a, %pstate
	mov 0x33, %r30
	.word 0x9bd0001e  ! 4174: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	mov 0x31, %r30
	.word 0x99d0001e  ! 4175: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x87d02033  ! 4176: Tcc_I	tl	icc_or_xcc, %r0 + 51
	.word 0x819829de  ! 4177: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09de, %hpstate
	.word 0x88002001  ! 4178: ADD_I	add 	%r0, 0x0001, %r4
	mov 0x32, %r30
	.word 0x83d0001e  ! 4179: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x93a389cc  ! 4180: FDIVd	fdivd	%f14, %f12, %f40
	.word 0x87802016  ! 4181: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xd2d80e60  ! 4182: LDXA_R	ldxa	[%r0, %r0] 0x73, %r9
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x819829c9  ! 4184: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c9, %hpstate
	.word 0xd20fc000  ! 4185: LDUB_R	ldub	[%r31 + %r0], %r9
	.word 0x81982950  ! 4186: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0950, %hpstate
DS_204:
	.word 0x34800001  ! 4188: BG	bg,a	<label_0x1>
	.word 0xc3322001  ! 4188: STQF_I	-	%f1, [0x0001, %r8]
	.word 0x8d458000  ! 4187: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0x8d902846  ! 4188: WRPR_PSTATE_I	wrpr	%r0, 0x0846, %pstate
	.word 0x8fa01a6f  ! 4189: FqTOi	fqtoi	
	ta	T_CHANGE_NONHPRIV	! macro
	mov 0x33, %r30
	.word 0x9bd0001e  ! 4191: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x86d30000  ! 4192: UMULcc_R	umulcc 	%r12, %r0, %r3
	.word 0x91494000  ! 4193: RDHPR_HTBA	rdhpr	%htba, %r8
	.word 0x81982e51  ! 4194: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e51, %hpstate
	.word 0xd0800b60  ! 4195: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r8
	.word 0xd0c7e030  ! 4196: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r8
	mov 0x33, %r30
	.word 0x8fd0001e  ! 4197: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x8da01a60  ! 4198: FqTOi	fqtoi	
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b480000  ! 4200: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
	.word 0x98d12001  ! 4201: UMULcc_I	umulcc 	%r4, 0x0001, %r12
	mov 0x33, %r30
	.word 0x8dd0001e  ! 4202: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0xd8800c00  ! 4203: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r12
	.word 0x9051000f  ! 4204: UMUL_R	umul 	%r4, %r15, %r8
	.word 0x8198241e  ! 4205: WRHPR_HPSTATE_I	wrhpr	%r0, 0x041e, %hpstate
	.word 0x87802004  ! 4206: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8d802000  ! 4207: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd0800c60  ! 4208: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r8
	.word 0xd13fc00f  ! 4209: STDF_R	std	%f8, [%r15, %r31]
	mov 0x34, %r30
	.word 0x85d0001e  ! 4210: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x85d02034  ! 4211: Tcc_I	tle	icc_or_xcc, %r0 + 52
	.word 0x8d802000  ! 4212: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d902adc  ! 4213: WRPR_PSTATE_I	wrpr	%r0, 0x0adc, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d90225d  ! 4215: WRPR_PSTATE_I	wrpr	%r0, 0x025d, %pstate
	.word 0x9bd02034  ! 4216: Tcc_I	tcc	icc_or_xcc, %r0 + 52
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9480c007  ! 4218: ADDcc_R	addcc 	%r3, %r7, %r10
	.word 0x87802004  ! 4219: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8198265c  ! 4220: WRHPR_HPSTATE_I	wrhpr	%r0, 0x065c, %hpstate
	.word 0x819829c4  ! 4221: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c4, %hpstate
	mov 0x32, %r30
	.word 0x85d0001e  ! 4222: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0x8d902453  ! 4223: WRPR_PSTATE_I	wrpr	%r0, 0x0453, %pstate
	.word 0x85d02030  ! 4224: Tcc_I	tle	icc_or_xcc, %r0 + 48
	.word 0xd4c7e030  ! 4225: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r10
	.word 0xd48804a0  ! 4226: LDUBA_R	lduba	[%r0, %r0] 0x25, %r10
	.word 0xd4800b60  ! 4227: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r10
	.word 0x9c49000b  ! 4228: MULX_R	mulx 	%r4, %r11, %r14
	ta	T_CHANGE_NONPRIV	! macro
	mov 0x35, %r30
	.word 0x8bd0001e  ! 4230: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x97d02032  ! 4231: Tcc_I	tge	icc_or_xcc, %r0 + 50
	.word 0x81982302  ! 4232: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0302, %hpstate
	.word 0x8d902a4f  ! 4233: WRPR_PSTATE_I	wrpr	%r0, 0x0a4f, %pstate
	.word 0x9550c000  ! 4234: RDPR_TT	rdpr	%tt, %r10
	.word 0x99494000  ! 4235: RDHPR_HTBA	rdhpr	%htba, %r12
	.word 0x87d02031  ! 4236: Tcc_I	tl	icc_or_xcc, %r0 + 49
	.word 0x9401a001  ! 4237: ADD_I	add 	%r6, 0x0001, %r10
	mov 0x30, %r30
	.word 0x99d0001e  ! 4238: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x9bd02032  ! 4239: Tcc_I	tcc	icc_or_xcc, %r0 + 50
	.word 0x81982342  ! 4240: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0342, %hpstate
	.word 0x8d9022d1  ! 4241: WRPR_PSTATE_I	wrpr	%r0, 0x02d1, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xd48008a0  ! 4243: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x24700001  ! 4244: BPLE	<illegal instruction>
	.word 0xd48fe010  ! 4245: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r10
	.word 0xd53fe001  ! 4246: STDF_I	std	%f10, [0x0001, %r31]
	.word 0xd527c00b  ! 4247: STF_R	st	%f10, [%r11, %r31]
	.word 0x8d69c005  ! 4248: SDIVX_R	sdivx	%r7, %r5, %r6
	ta	T_CHANGE_PRIV	! macro
DS_205:
	.word 0x34800001  ! 4251: BG	bg,a	<label_0x1>
	illtrap
	.word 0x85b3830b  ! 4250: ALLIGNADDRESS	alignaddr	%r14, %r11, %r2
	.word 0xc537e001  ! 4251: STQF_I	-	%f2, [0x0001, %r31]
	.word 0x8d802000  ! 4252: WRFPRS_I	wr	%r0, 0x0000, %fprs
	mov 0x30, %r30
	.word 0x81d0001e  ! 4253: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x3a800001  ! 4254: BCC	bcc,a	<label_0x1>
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc4dfe020  ! 4256: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r2
	.word 0xc537c00b  ! 4257: STQF_R	-	%f2, [%r11, %r31]
	.word 0x8d802004  ! 4258: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8e022001  ! 4259: ADD_I	add 	%r8, 0x0001, %r7
	.word 0x82498002  ! 4260: MULX_R	mulx 	%r6, %r2, %r1
	.word 0x9ac1a001  ! 4261: ADDCcc_I	addccc 	%r6, 0x0001, %r13
	.word 0x9c788000  ! 4262: SDIV_R	sdiv 	%r2, %r0, %r14
	.word 0xdd27c000  ! 4263: STF_R	st	%f14, [%r0, %r31]
	.word 0x24700001  ! 4264: BPLE	<illegal instruction>
	.word 0x9f504000  ! 4265: RDPR_TNPC	rdpr	%tnpc, %r15
	.word 0x8ed0000a  ! 4266: UMULcc_R	umulcc 	%r0, %r10, %r7
	.word 0xce1fe001  ! 4267: LDD_I	ldd	[%r31 + 0x0001], %r7
DS_206:
	.word 0x34800001  ! 4269: BG	bg,a	<label_0x1>
	illtrap
	.word 0x87b20305  ! 4268: ALLIGNADDRESS	alignaddr	%r8, %r5, %r3
	.word 0x8d802004  ! 4269: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x80836001  ! 4270: ADDcc_I	addcc 	%r13, 0x0001, %r0
	.word 0xc08008a0  ! 4271: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0x819827d8  ! 4272: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07d8, %hpstate
	.word 0x8d90289c  ! 4273: WRPR_PSTATE_I	wrpr	%r0, 0x089c, %pstate
	.word 0xc117c000  ! 4274: LDQF_R	-	[%r31, %r0], %f0
	.word 0x8d802000  ! 4275: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8cd88005  ! 4276: SMULcc_R	smulcc 	%r2, %r5, %r6
	.word 0xccc7e010  ! 4277: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r6
	.word 0x92d02001  ! 4278: UMULcc_I	umulcc 	%r0, 0x0001, %r9
	.word 0xd24fc000  ! 4279: LDSB_R	ldsb	[%r31 + %r0], %r9
	.word 0x8198231a  ! 4280: WRHPR_HPSTATE_I	wrhpr	%r0, 0x031a, %hpstate
	.word 0x87a189a3  ! 4281: FDIVs	fdivs	%f6, %f3, %f3
	.word 0x87802014  ! 4282: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x95a309ec  ! 4283: FDIVq	dis not found

	.word 0x819825da  ! 4284: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05da, %hpstate
	.word 0x8da14dc7  ! 4285: FdMULq	fdmulq	
	.word 0x9881c003  ! 4286: ADDcc_R	addcc 	%r7, %r3, %r12
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89d02032  ! 4288: Tcc_I	tleu	icc_or_xcc, %r0 + 50
	.word 0x83a00548  ! 4289: FSQRTd	fsqrt	
	.word 0x9cc0a001  ! 4290: ADDCcc_I	addccc 	%r2, 0x0001, %r14
	.word 0x8d902288  ! 4291: WRPR_PSTATE_I	wrpr	%r0, 0x0288, %pstate
	.word 0x8d90244a  ! 4292: WRPR_PSTATE_I	wrpr	%r0, 0x044a, %pstate
	.word 0x8d902e03  ! 4293: WRPR_PSTATE_I	wrpr	%r0, 0x0e03, %pstate
	.word 0x96482001  ! 4294: MULX_I	mulx 	%r0, 0x0001, %r11
	.word 0x819825c3  ! 4295: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05c3, %hpstate
DS_207:
	.word 0x32800001  ! 4297: BNE	bne,a	<label_0x1>
	.word 0xc7304009  ! 4297: STQF_R	-	%f3, [%r9, %r1]
	.word 0x97458000  ! 4296: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0xd6d7e000  ! 4297: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r11
	.word 0x8fa00546  ! 4298: FSQRTd	fsqrt	
	.word 0xce8008a0  ! 4299: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x8d9026d1  ! 4300: WRPR_PSTATE_I	wrpr	%r0, 0x06d1, %pstate
	.word 0xcecfe000  ! 4301: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r7
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x24700001  ! 4303: BPLE	<illegal instruction>
	.word 0x87802080  ! 4304: WRASI_I	wr	%r0, 0x0080, %asi
	mov 0x32, %r30
	.word 0x83d0001e  ! 4305: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x87802010  ! 4306: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x8f508000  ! 4307: RDPR_TSTATE	rdpr	%tstate, %r7
	.word 0x32800001  ! 4308: BNE	bne,a	<label_0x1>
	.word 0x87802088  ! 4309: WRASI_I	wr	%r0, 0x0088, %asi
DS_208:
	.word 0x20800001  ! 4311: BN	bn,a	<label_0x1>
	illtrap
	.word 0x9bb04301  ! 4310: ALLIGNADDRESS	alignaddr	%r1, %r1, %r13
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x91504000  ! 4312: RDPR_TNPC	rdpr	%tnpc, %r8
	.word 0x904a6001  ! 4313: MULX_I	mulx 	%r9, 0x0001, %r8
	.word 0x9d508000  ! 4314: RDPR_TSTATE	rdpr	%tstate, %r14
	mov 0x32, %r30
	.word 0x8dd0001e  ! 4315: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x86816001  ! 4316: ADDcc_I	addcc 	%r5, 0x0001, %r3
	.word 0x8d90209d  ! 4317: WRPR_PSTATE_I	wrpr	%r0, 0x009d, %pstate
	.word 0x81982c45  ! 4318: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c45, %hpstate
	.word 0xc6800bc0  ! 4319: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r3
	.word 0x2a700001  ! 4320: BPCS	<illegal instruction>
	.word 0x9083a001  ! 4321: ADDcc_I	addcc 	%r14, 0x0001, %r8
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d90208e  ! 4323: WRPR_PSTATE_I	wrpr	%r0, 0x008e, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d902ed1  ! 4325: WRPR_PSTATE_I	wrpr	%r0, 0x0ed1, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d902c0a  ! 4327: WRPR_PSTATE_I	wrpr	%r0, 0x0c0a, %pstate
	mov 0x34, %r30
	.word 0x85d0001e  ! 4328: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	.word 0xd097e000  ! 4329: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r8
	.word 0x91494000  ! 4330: RDHPR_HTBA	rdhpr	%htba, %r8
	.word 0xd0d7e030  ! 4331: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r8
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8b508000  ! 4335: RDPR_TSTATE	rdpr	%tstate, %r5
DS_209:
	.word 0x34800001  ! 4337: BG	bg,a	<label_0x1>
	illtrap
	.word 0x8fb1030e  ! 4336: ALLIGNADDRESS	alignaddr	%r4, %r14, %r7
	mov 0x31, %r30
	.word 0x95d0001e  ! 4337: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0xce7fe001  ! 4338: SWAP_I	swap	%r7, [%r31 + 0x0001]
	.word 0x8d90220a  ! 4339: WRPR_PSTATE_I	wrpr	%r0, 0x020a, %pstate
	.word 0xce8008a0  ! 4340: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x85d02033  ! 4342: Tcc_I	tle	icc_or_xcc, %r0 + 51
	.word 0x94804007  ! 4343: ADDcc_R	addcc 	%r1, %r7, %r10
	.word 0x92d02001  ! 4344: UMULcc_I	umulcc 	%r0, 0x0001, %r9
	.word 0xd21fe001  ! 4345: LDD_I	ldd	[%r31 + 0x0001], %r9
DS_210:
	.word 0x22800001  ! 4347: BE	be,a	<label_0x1>
	illtrap
	.word 0x8db18305  ! 4346: ALLIGNADDRESS	alignaddr	%r6, %r5, %r6
	.word 0x8d90265f  ! 4347: WRPR_PSTATE_I	wrpr	%r0, 0x065f, %pstate
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x9cd9c00a  ! 4350: SMULcc_R	smulcc 	%r7, %r10, %r14
DS_211:
	.word 0x34800001  ! 4352: BG	bg,a	<label_0x1>
	illtrap
	.word 0x91b1430a  ! 4351: ALLIGNADDRESS	alignaddr	%r5, %r10, %r8
	ta	T_CHANGE_PRIV	! macro
	.word 0x8a53800b  ! 4353: UMUL_R	umul 	%r14, %r11, %r5
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81982398  ! 4355: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0398, %hpstate
	.word 0xcadfe020  ! 4356: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r5
	.word 0xcaffc02b  ! 4357: SWAPA_R	swapa	%r5, [%r31 + %r11] 0x01
	.word 0x8d9020d9  ! 4358: WRPR_PSTATE_I	wrpr	%r0, 0x00d9, %pstate
	.word 0x83a0056f  ! 4359: FSQRTq	fsqrt	
	.word 0x81982a4d  ! 4360: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a4d, %hpstate
	.word 0x3e800001  ! 4361: BVC	bvc,a	<label_0x1>
	.word 0xc25fe001  ! 4362: LDX_I	ldx	[%r31 + 0x0001], %r1
DS_212:
	.word 0x20800001  ! 4364: BN	bn,a	<label_0x1>
	illtrap
	.word 0x8db1c309  ! 4363: ALLIGNADDRESS	alignaddr	%r7, %r9, %r6
	.word 0x819823d4  ! 4364: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03d4, %hpstate
	.word 0xcc9fc020  ! 4365: LDDA_R	ldda	[%r31, %r0] 0x01, %r6
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x30800001  ! 4367: BA	ba,a	<label_0x1>
	.word 0xcc8008a0  ! 4368: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xcc8008a0  ! 4370: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x8d90264b  ! 4371: WRPR_PSTATE_I	wrpr	%r0, 0x064b, %pstate
	mov 0x32, %r30
	.word 0x8dd0001e  ! 4372: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x8d902018  ! 4373: WRPR_PSTATE_I	wrpr	%r0, 0x0018, %pstate
	.word 0x84496001  ! 4374: MULX_I	mulx 	%r5, 0x0001, %r2
	.word 0x82832001  ! 4375: ADDcc_I	addcc 	%r12, 0x0001, %r1
	.word 0x95d02032  ! 4376: Tcc_I	tg	icc_or_xcc, %r0 + 50
	.word 0x8bd02033  ! 4377: Tcc_I	tcs	icc_or_xcc, %r0 + 51
	.word 0xc28fe010  ! 4378: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r1
	.word 0x8d902ec1  ! 4379: WRPR_PSTATE_I	wrpr	%r0, 0x0ec1, %pstate
	.word 0x85d02034  ! 4380: Tcc_I	tle	icc_or_xcc, %r0 + 52
	.word 0xc28008a0  ! 4381: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0x87802010  ! 4382: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x9da0054f  ! 4383: FSQRTd	fsqrt	
	.word 0xdc9fc020  ! 4384: LDDA_R	ldda	[%r31, %r0] 0x01, %r14
DS_213:
	.word 0x32800001  ! 4386: BNE	bne,a	<label_0x1>
	.word 0xd1306001  ! 4386: STQF_I	-	%f8, [0x0001, %r1]
	.word 0x93458000  ! 4385: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0xd3e7c02f  ! 4386: CASA_I	casa	[%r31] 0x 1, %r15, %r9
	.word 0x81982f9d  ! 4387: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f9d, %hpstate
	.word 0x91508000  ! 4388: RDPR_TSTATE	rdpr	%tstate, %r8
	mov 0x34, %r30
	.word 0x95d0001e  ! 4389: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0xd08008a0  ! 4390: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0x90d0a001  ! 4391: UMULcc_I	umulcc 	%r2, 0x0001, %r8
	.word 0x32700001  ! 4392: BPNE	<illegal instruction>
	.word 0x80db4004  ! 4393: SMULcc_R	smulcc 	%r13, %r4, %r0
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x83d02034  ! 4395: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0xc0ffc024  ! 4396: SWAPA_R	swapa	%r0, [%r31 + %r4] 0x01
	.word 0x8d902e0a  ! 4397: WRPR_PSTATE_I	wrpr	%r0, 0x0e0a, %pstate
DS_214:
	.word 0x20800001  ! 4399: BN	bn,a	<label_0x1>
	illtrap
	.word 0x9bb1c30e  ! 4398: ALLIGNADDRESS	alignaddr	%r7, %r14, %r13
	.word 0xda0fc000  ! 4399: LDUB_R	ldub	[%r31 + %r0], %r13
	.word 0x8bd02034  ! 4400: Tcc_I	tcs	icc_or_xcc, %r0 + 52
	.word 0x8b6be001  ! 4401: SDIVX_I	sdivx	%r15, 0x0001, %r5
	.word 0x81982687  ! 4402: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0687, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d9022c8  ! 4404: WRPR_PSTATE_I	wrpr	%r0, 0x02c8, %pstate
	.word 0x32700001  ! 4405: BPNE	<illegal instruction>
	.word 0x8880000b  ! 4406: ADDcc_R	addcc 	%r0, %r11, %r4
	.word 0x8d902e86  ! 4407: WRPR_PSTATE_I	wrpr	%r0, 0x0e86, %pstate
	mov 0x35, %r30
	.word 0x83d0001e  ! 4408: Tcc_R	te	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc8d7e010  ! 4410: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r4
DS_215:
	.word 0x34800001  ! 4412: BG	bg,a	<label_0x1>
	.word 0xc533000e  ! 4412: STQF_R	-	%f2, [%r14, %r12]
	.word 0x91458000  ! 4411: RD_SOFTINT_REG	rd	%softint, %r8
DS_216:
	.word 0x22800001  ! 4413: BE	be,a	<label_0x1>
	illtrap
	.word 0x81b0030f  ! 4412: ALLIGNADDRESS	alignaddr	%r0, %r15, %r0
	.word 0x8d902a19  ! 4413: WRPR_PSTATE_I	wrpr	%r0, 0x0a19, %pstate
	.word 0x87802088  ! 4414: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x87802080  ! 4415: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x8d902281  ! 4416: WRPR_PSTATE_I	wrpr	%r0, 0x0281, %pstate
	.word 0x9a7bc004  ! 4417: SDIV_R	sdiv 	%r15, %r4, %r13
	ta	T_CHANGE_PRIV	! macro
	.word 0x9f682001  ! 4419: SDIVX_I	sdivx	%r0, 0x0001, %r15
	.word 0x8d902c5c  ! 4420: WRPR_PSTATE_I	wrpr	%r0, 0x0c5c, %pstate
	.word 0xde8008a0  ! 4421: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r15
	.word 0x8d9024db  ! 4422: WRPR_PSTATE_I	wrpr	%r0, 0x04db, %pstate
	.word 0x34800001  ! 4423: BG	bg,a	<label_0x1>
DS_217:
	.word 0x20800001  ! 4425: BN	bn,a	<label_0x1>
	illtrap
	.word 0x95b38309  ! 4424: ALLIGNADDRESS	alignaddr	%r14, %r9, %r10
	.word 0xd477e001  ! 4425: STX_I	stx	%r10, [%r31 + 0x0001]
	.word 0x9083c004  ! 4426: ADDcc_R	addcc 	%r15, %r4, %r8
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xd097e020  ! 4428: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r8
DS_218:
	.word 0x32800001  ! 4430: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x8bb1030f  ! 4429: ALLIGNADDRESS	alignaddr	%r4, %r15, %r5
	.word 0x26700001  ! 4430: BPL	<illegal instruction>
	.word 0x8da0056d  ! 4431: FSQRTq	fsqrt	
DS_219:
	.word 0x22800001  ! 4433: BE	be,a	<label_0x1>
	.word 0xc733e001  ! 4433: STQF_I	-	%f3, [0x0001, %r15]
	.word 0x9d458000  ! 4432: RD_SOFTINT_REG	rd	%softint, %r14
	mov 0x35, %r30
	.word 0x8bd0001e  ! 4433: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x81982857  ! 4434: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0857, %hpstate
	.word 0x88812001  ! 4435: ADDcc_I	addcc 	%r4, 0x0001, %r4
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc88fe030  ! 4437: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r4
	.word 0x8d902e10  ! 4438: WRPR_PSTATE_I	wrpr	%r0, 0x0e10, %pstate
	.word 0xc8dfe030  ! 4439: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r4
	.word 0x8d902498  ! 4440: WRPR_PSTATE_I	wrpr	%r0, 0x0498, %pstate
	.word 0xc837e001  ! 4441: STH_I	sth	%r4, [%r31 + 0x0001]
	.word 0x886a000b  ! 4442: UDIVX_R	udivx 	%r8, %r11, %r4
	.word 0x9e48000e  ! 4443: MULX_R	mulx 	%r0, %r14, %r15
DS_220:
	.word 0x32800001  ! 4445: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x93b20306  ! 4444: ALLIGNADDRESS	alignaddr	%r8, %r6, %r9
	.word 0x8d9024de  ! 4445: WRPR_PSTATE_I	wrpr	%r0, 0x04de, %pstate
	.word 0xd217c000  ! 4446: LDUH_R	lduh	[%r31 + %r0], %r9
	.word 0x8d902492  ! 4447: WRPR_PSTATE_I	wrpr	%r0, 0x0492, %pstate
	.word 0x9a50800c  ! 4448: UMUL_R	umul 	%r2, %r12, %r13
	mov 0x34, %r30
	.word 0x8dd0001e  ! 4449: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x8d902046  ! 4450: WRPR_PSTATE_I	wrpr	%r0, 0x0046, %pstate
	.word 0xda2fc00c  ! 4451: STB_R	stb	%r13, [%r31 + %r12]
	ta	T_CHANGE_NONHPRIV	! macro
	mov 0x32, %r30
	.word 0x8dd0001e  ! 4453: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0x8d902e98  ! 4454: WRPR_PSTATE_I	wrpr	%r0, 0x0e98, %pstate
	.word 0x22800001  ! 4455: BE	be,a	<label_0x1>
	.word 0x8d90289b  ! 4456: WRPR_PSTATE_I	wrpr	%r0, 0x089b, %pstate
DS_221:
	.word 0x34800001  ! 4458: BG	bg,a	<label_0x1>
	illtrap
	.word 0x91b1830c  ! 4457: ALLIGNADDRESS	alignaddr	%r6, %r12, %r8
	.word 0x8d9020d5  ! 4458: WRPR_PSTATE_I	wrpr	%r0, 0x00d5, %pstate
	.word 0x87802089  ! 4459: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x97a00562  ! 4460: FSQRTq	fsqrt	
DS_222:
	.word 0x20800001  ! 4462: BN	bn,a	<label_0x1>
	.word 0xd532400d  ! 4462: STQF_R	-	%f10, [%r13, %r9]
	.word 0x97458000  ! 4461: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0x9ad02001  ! 4462: UMULcc_I	umulcc 	%r0, 0x0001, %r13
	.word 0x22800001  ! 4463: BE	be,a	<label_0x1>
DS_223:
	.word 0x20800001  ! 4465: BN	bn,a	<label_0x1>
	.word 0xd9334009  ! 4465: STQF_R	-	%f12, [%r9, %r13]
	.word 0x8b458000  ! 4464: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0xcaffc029  ! 4465: SWAPA_R	swapa	%r5, [%r31 + %r9] 0x01
	.word 0x8d902e9b  ! 4466: WRPR_PSTATE_I	wrpr	%r0, 0x0e9b, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8801e001  ! 4468: ADD_I	add 	%r7, 0x0001, %r4
	.word 0x9da00565  ! 4469: FSQRTq	fsqrt	
	.word 0x8fd02030  ! 4470: Tcc_I	tvs	icc_or_xcc, %r0 + 48
	.word 0x81982890  ! 4471: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0890, %hpstate
	.word 0x9da24d2d  ! 4472: FsMULd	fsmuld	%f9, %f44, %f14
	.word 0x8d802000  ! 4473: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87802014  ! 4474: WRASI_I	wr	%r0, 0x0014, %asi
	mov 0x33, %r30
	.word 0x95d0001e  ! 4475: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	mov 0x33, %r30
	.word 0x93d0001e  ! 4476: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xdcd80e80  ! 4477: LDXA_R	ldxa	[%r0, %r0] 0x74, %r14
	.word 0xdc07c000  ! 4478: LDUW_R	lduw	[%r31 + %r0], %r14
	.word 0x2e700001  ! 4479: BPVS	<illegal instruction>
DS_224:
	.word 0x34800001  ! 4481: BG	bg,a	<label_0x1>
	.word 0xdb338000  ! 4481: STQF_R	-	%f13, [%r0, %r14]
	.word 0x9b458000  ! 4480: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x9e4a6001  ! 4481: MULX_I	mulx 	%r9, 0x0001, %r15
	.word 0x8d802000  ! 4482: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_225:
	.word 0x34800001  ! 4484: BG	bg,a	<label_0x1>
	.word 0xd531e001  ! 4484: STQF_I	-	%f10, [0x0001, %r7]
	.word 0x8d458000  ! 4483: RD_SOFTINT_REG	rd	%softint, %r6
	ta	T_CHANGE_PRIV	! macro
DS_226:
	.word 0x22800001  ! 4486: BE	be,a	<label_0x1>
	.word 0xc931000e  ! 4486: STQF_R	-	%f4, [%r14, %r4]
	.word 0x9b458000  ! 4485: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x99a189e6  ! 4486: FDIVq	dis not found

	.word 0x8d90280e  ! 4487: WRPR_PSTATE_I	wrpr	%r0, 0x080e, %pstate
	.word 0x99d02035  ! 4488: Tcc_I	tgu	icc_or_xcc, %r0 + 53
	.word 0x8da289a3  ! 4489: FDIVs	fdivs	%f10, %f3, %f6
	ta	T_CHANGE_HPRIV	! macro
	.word 0x99d02031  ! 4491: Tcc_I	tgu	icc_or_xcc, %r0 + 49
	.word 0x8d902805  ! 4492: WRPR_PSTATE_I	wrpr	%r0, 0x0805, %pstate
	.word 0x8cc26001  ! 4493: ADDCcc_I	addccc 	%r9, 0x0001, %r6
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8fd02030  ! 4495: Tcc_I	tvs	icc_or_xcc, %r0 + 48
	.word 0xcc9004a0  ! 4496: LDUHA_R	lduha	[%r0, %r0] 0x25, %r6
	.word 0x99a0054f  ! 4497: FSQRTd	fsqrt	
	.word 0x2c800001  ! 4498: BNEG	bneg,a	<label_0x1>
	.word 0x9ba04d2e  ! 4499: FsMULd	fsmuld	%f1, %f14, %f44
	.word 0xdad80e80  ! 4500: LDXA_R	ldxa	[%r0, %r0] 0x74, %r13
	.word 0x8d802004  ! 4501: WRFPRS_I	wr	%r0, 0x0004, %fprs
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8bd02033  ! 4503: Tcc_I	tcs	icc_or_xcc, %r0 + 51
	.word 0x9a80c008  ! 4504: ADDcc_R	addcc 	%r3, %r8, %r13
	.word 0xda8008a0  ! 4505: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x91a089e5  ! 4506: FDIVq	dis not found

	.word 0xd08804a0  ! 4507: LDUBA_R	lduba	[%r0, %r0] 0x25, %r8
	.word 0x819824d5  ! 4508: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04d5, %hpstate
	.word 0x94d02001  ! 4509: UMULcc_I	umulcc 	%r0, 0x0001, %r10
DS_227:
	.word 0x32800001  ! 4511: BNE	bne,a	<label_0x1>
	.word 0xc7308003  ! 4511: STQF_R	-	%f3, [%r3, %r2]
	.word 0x9f458000  ! 4510: RD_SOFTINT_REG	rd	%softint, %r15
	.word 0x8350c000  ! 4511: RDPR_TT	rdpr	%tt, %r1
	.word 0x81a0cd21  ! 4512: FsMULd	fsmuld	%f3, %f32, %f0
	.word 0x81982048  ! 4513: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0048, %hpstate
	.word 0xc0c7e000  ! 4514: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r0
	.word 0x8d802004  ! 4515: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x24700001  ! 4516: BPLE	<illegal instruction>
	.word 0x86838003  ! 4517: ADDcc_R	addcc 	%r14, %r3, %r3
	.word 0x93504000  ! 4518: RDPR_TNPC	rdpr	%tnpc, %r9
	.word 0x9750c000  ! 4519: RDPR_TT	rdpr	%tt, %r11
	.word 0xd68008a0  ! 4520: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x8d90208a  ! 4521: WRPR_PSTATE_I	wrpr	%r0, 0x008a, %pstate
DS_228:
	.word 0x20800001  ! 4523: BN	bn,a	<label_0x1>
	.word 0xcf30800f  ! 4523: STQF_R	-	%f7, [%r15, %r2]
	.word 0x9f458000  ! 4522: RD_SOFTINT_REG	rd	%softint, %r15
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x9ad0e001  ! 4524: UMULcc_I	umulcc 	%r3, 0x0001, %r13
DS_229:
	.word 0x32800001  ! 4526: BNE	bne,a	<label_0x1>
	.word 0xdd32a001  ! 4526: STQF_I	-	%f14, [0x0001, %r10]
	.word 0x99458000  ! 4525: RD_SOFTINT_REG	rd	%softint, %r12
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x81982890  ! 4527: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0890, %hpstate
DS_230:
	.word 0x22800001  ! 4529: BE	be,a	<label_0x1>
	illtrap
	.word 0x99b04308  ! 4528: ALLIGNADDRESS	alignaddr	%r1, %r8, %r12
	.word 0x8a78c002  ! 4529: SDIV_R	sdiv 	%r3, %r2, %r5
DS_231:
	.word 0x34800001  ! 4531: BG	bg,a	<label_0x1>
	illtrap
	.word 0x8db0830a  ! 4530: ALLIGNADDRESS	alignaddr	%r2, %r10, %r6
	.word 0x8d902096  ! 4531: WRPR_PSTATE_I	wrpr	%r0, 0x0096, %pstate
	.word 0x9d68c009  ! 4532: SDIVX_R	sdivx	%r3, %r9, %r14
	.word 0x81514000  ! 4533: RDPR_TBA	rdpr	%tba, %r0
	.word 0x8d90281a  ! 4534: WRPR_PSTATE_I	wrpr	%r0, 0x081a, %pstate
	.word 0xc0d804a0  ! 4535: LDXA_R	ldxa	[%r0, %r0] 0x25, %r0
	ta	T_CHANGE_PRIV	! macro
DS_232:
	.word 0x32800001  ! 4538: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x9fb3c301  ! 4537: ALLIGNADDRESS	alignaddr	%r15, %r1, %r15
	mov 0x35, %r30
	.word 0x91d0001e  ! 4538: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x89a01a68  ! 4539: FqTOi	fqtoi	
	.word 0x8d902c13  ! 4540: WRPR_PSTATE_I	wrpr	%r0, 0x0c13, %pstate
	.word 0x81982fd5  ! 4541: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd5, %hpstate
	.word 0xc93fc008  ! 4542: STDF_R	std	%f4, [%r8, %r31]
	.word 0x8d902e0d  ! 4543: WRPR_PSTATE_I	wrpr	%r0, 0x0e0d, %pstate
	.word 0x9c78a001  ! 4544: SDIV_I	sdiv 	%r2, 0x0001, %r14
	.word 0x8d90281c  ! 4545: WRPR_PSTATE_I	wrpr	%r0, 0x081c, %pstate
	.word 0x83a009c9  ! 4546: FDIVd	fdivd	%f0, %f40, %f32
	.word 0x8d802004  ! 4547: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d902857  ! 4548: WRPR_PSTATE_I	wrpr	%r0, 0x0857, %pstate
	.word 0x97a01a6e  ! 4549: FqTOi	fqtoi	
	.word 0x8d902a45  ! 4550: WRPR_PSTATE_I	wrpr	%r0, 0x0a45, %pstate
	mov 0x33, %r30
	.word 0x8bd0001e  ! 4551: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x9681e001  ! 4552: ADDcc_I	addcc 	%r7, 0x0001, %r11
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd6c7e000  ! 4555: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r11
	.word 0x34700001  ! 4556: BPG	<illegal instruction>
	.word 0x8d902ecb  ! 4557: WRPR_PSTATE_I	wrpr	%r0, 0x0ecb, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xd6c7e030  ! 4559: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r11
	.word 0xd6ffc02e  ! 4560: SWAPA_R	swapa	%r11, [%r31 + %r14] 0x01
	.word 0x83a309e9  ! 4561: FDIVq	dis not found

	mov 0x31, %r30
	.word 0x89d0001e  ! 4562: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x8198234a  ! 4563: WRHPR_HPSTATE_I	wrhpr	%r0, 0x034a, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9a782001  ! 4565: SDIV_I	sdiv 	%r0, 0x0001, %r13
DS_233:
	.word 0x22800001  ! 4567: BE	be,a	<label_0x1>
	.word 0xcf336001  ! 4567: STQF_I	-	%f7, [0x0001, %r13]
	.word 0x9f458000  ! 4566: RD_SOFTINT_REG	rd	%softint, %r15
	.word 0x819823d0  ! 4567: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03d0, %hpstate
	.word 0x8a01a001  ! 4568: ADD_I	add 	%r6, 0x0001, %r5
	ta	T_CHANGE_NONPRIV	! macro
DS_234:
	.word 0x22800001  ! 4571: BE	be,a	<label_0x1>
	.word 0xdd30000e  ! 4571: STQF_R	-	%f14, [%r14, %r0]
	.word 0x8b458000  ! 4570: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0x8198228b  ! 4571: WRHPR_HPSTATE_I	wrhpr	%r0, 0x028b, %hpstate
	.word 0xcb27e001  ! 4572: STF_I	st	%f5, [0x0001, %r31]
	.word 0x8c03e001  ! 4573: ADD_I	add 	%r15, 0x0001, %r6
	.word 0x83a0054b  ! 4574: FSQRTd	fsqrt	
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc2d804a0  ! 4577: LDXA_R	ldxa	[%r0, %r0] 0x25, %r1
	.word 0xc2c7e010  ! 4578: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r1
	.word 0x8c6b8000  ! 4579: UDIVX_R	udivx 	%r14, %r0, %r6
	.word 0x8d902e0a  ! 4580: WRPR_PSTATE_I	wrpr	%r0, 0x0e0a, %pstate
	.word 0x9a822001  ! 4581: ADDcc_I	addcc 	%r8, 0x0001, %r13
	.word 0xdad80e80  ! 4582: LDXA_R	ldxa	[%r0, %r0] 0x74, %r13
	.word 0x8c50c00d  ! 4583: UMUL_R	umul 	%r3, %r13, %r6
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x944b2001  ! 4585: MULX_I	mulx 	%r12, 0x0001, %r10
	.word 0x8478a001  ! 4586: SDIV_I	sdiv 	%r2, 0x0001, %r2
	.word 0xc597e001  ! 4587: LDQFA_I	-	[%r31, 0x0001], %f2
	.word 0x8d902a0a  ! 4588: WRPR_PSTATE_I	wrpr	%r0, 0x0a0a, %pstate
	.word 0x81982a82  ! 4589: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a82, %hpstate
	.word 0x81982159  ! 4590: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0159, %hpstate
	.word 0x8d902452  ! 4591: WRPR_PSTATE_I	wrpr	%r0, 0x0452, %pstate
	.word 0xc48008a0  ! 4592: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0xc457c000  ! 4593: LDSH_R	ldsh	[%r31 + %r0], %r2
	.word 0x81982642  ! 4594: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0642, %hpstate
	.word 0x83692001  ! 4595: SDIVX_I	sdivx	%r4, 0x0001, %r1
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d90265d  ! 4597: WRPR_PSTATE_I	wrpr	%r0, 0x065d, %pstate
	.word 0x8d902a1f  ! 4598: WRPR_PSTATE_I	wrpr	%r0, 0x0a1f, %pstate
	.word 0x85a10d29  ! 4599: FsMULd	fsmuld	%f4, %f40, %f2
	.word 0x8853000a  ! 4600: UMUL_R	umul 	%r12, %r10, %r4
	.word 0x9052c003  ! 4601: UMUL_R	umul 	%r11, %r3, %r8
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x819827de  ! 4603: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07de, %hpstate
	.word 0x26800001  ! 4604: BL	bl,a	<label_0x1>
	.word 0x87504000  ! 4605: RDPR_TNPC	rdpr	%tnpc, %r3
	mov 0x33, %r30
	.word 0x87d0001e  ! 4606: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	.word 0x9b514000  ! 4607: RDPR_TBA	rdpr	%tba, %r13
	.word 0x8d902a1f  ! 4608: WRPR_PSTATE_I	wrpr	%r0, 0x0a1f, %pstate
	.word 0xda5fe001  ! 4609: LDX_I	ldx	[%r31 + 0x0001], %r13
	.word 0x81982f5a  ! 4610: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f5a, %hpstate
	.word 0xdb37e001  ! 4611: STQF_I	-	%f13, [0x0001, %r31]
	.word 0x81982f93  ! 4612: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f93, %hpstate
	.word 0x87d02035  ! 4613: Tcc_I	tl	icc_or_xcc, %r0 + 53
DS_235:
	.word 0x22800001  ! 4615: BE	be,a	<label_0x1>
	illtrap
	.word 0x95b2030d  ! 4614: ALLIGNADDRESS	alignaddr	%r8, %r13, %r10
	.word 0x85a1cdc5  ! 4615: FdMULq	fdmulq	
	.word 0x9fd02032  ! 4616: Tcc_I	tvc	icc_or_xcc, %r0 + 50
	.word 0x9da14dc2  ! 4617: FdMULq	fdmulq	
	.word 0xdcffc022  ! 4618: SWAPA_R	swapa	%r14, [%r31 + %r2] 0x01
	.word 0x95d02034  ! 4619: Tcc_I	tg	icc_or_xcc, %r0 + 52
	.word 0x95688009  ! 4620: SDIVX_R	sdivx	%r2, %r9, %r10
	.word 0xd43fc009  ! 4621: STD_R	std	%r10, [%r31 + %r9]
	.word 0xd4c7e010  ! 4622: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r10
	.word 0xd537e001  ! 4623: STQF_I	-	%f10, [0x0001, %r31]
	.word 0x8d9024d9  ! 4624: WRPR_PSTATE_I	wrpr	%r0, 0x04d9, %pstate
	.word 0x87802014  ! 4625: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x3a700001  ! 4626: BPCC	<illegal instruction>
	.word 0xd4880e60  ! 4627: LDUBA_R	lduba	[%r0, %r0] 0x73, %r10
	.word 0x94d0e001  ! 4628: UMULcc_I	umulcc 	%r3, 0x0001, %r10
	.word 0x8951c000  ! 4629: RDPR_TL	rdpr	%tl, %r4
	.word 0x3c700001  ! 4630: BPPOS	<illegal instruction>
	.word 0xc83fe001  ! 4631: STD_I	std	%r4, [%r31 + 0x0001]
	.word 0x8d902816  ! 4632: WRPR_PSTATE_I	wrpr	%r0, 0x0816, %pstate
	.word 0x28700001  ! 4633: BPLEU	<illegal instruction>
	.word 0x8d90265a  ! 4634: WRPR_PSTATE_I	wrpr	%r0, 0x065a, %pstate
	.word 0x8d902046  ! 4635: WRPR_PSTATE_I	wrpr	%r0, 0x0046, %pstate
	.word 0x924aa001  ! 4636: MULX_I	mulx 	%r10, 0x0001, %r9
	.word 0xd28008a0  ! 4637: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d902608  ! 4639: WRPR_PSTATE_I	wrpr	%r0, 0x0608, %pstate
	.word 0xd327e001  ! 4640: STF_I	st	%f9, [0x0001, %r31]
	.word 0x8d90260e  ! 4641: WRPR_PSTATE_I	wrpr	%r0, 0x060e, %pstate
	.word 0x8d90264b  ! 4642: WRPR_PSTATE_I	wrpr	%r0, 0x064b, %pstate
	.word 0xd2c80e40  ! 4643: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r9
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81982c1e  ! 4647: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c1e, %hpstate
	.word 0x87802004  ! 4648: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8d902651  ! 4649: WRPR_PSTATE_I	wrpr	%r0, 0x0651, %pstate
	.word 0xd2ffc029  ! 4650: SWAPA_R	swapa	%r9, [%r31 + %r9] 0x01
	.word 0x38800001  ! 4651: BGU	bgu,a	<label_0x1>
	.word 0x9fa209c7  ! 4652: FDIVd	fdivd	%f8, %f38, %f46
	.word 0x8f50c000  ! 4653: RDPR_TT	rdpr	%tt, %r7
	.word 0x886a400d  ! 4654: UDIVX_R	udivx 	%r9, %r13, %r4
	.word 0xc8d7e010  ! 4655: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r4
	.word 0x8d902689  ! 4656: WRPR_PSTATE_I	wrpr	%r0, 0x0689, %pstate
	.word 0x8d902e4c  ! 4657: WRPR_PSTATE_I	wrpr	%r0, 0x0e4c, %pstate
	.word 0x81a009ab  ! 4658: FDIVs	fdivs	%f0, %f11, %f0
	.word 0x97a189e5  ! 4659: FDIVq	dis not found

	.word 0x927aa001  ! 4660: SDIV_I	sdiv 	%r10, 0x0001, %r9
	.word 0x81982642  ! 4661: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0642, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x3e800001  ! 4663: BVC	bvc,a	<label_0x1>
	.word 0x896b6001  ! 4664: SDIVX_I	sdivx	%r13, 0x0001, %r4
	.word 0x99a289ce  ! 4665: FDIVd	fdivd	%f10, %f14, %f12
	.word 0xd8800b60  ! 4666: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r12
	.word 0x38700001  ! 4667: BPGU	<illegal instruction>
	.word 0xd81fe001  ! 4668: LDD_I	ldd	[%r31 + 0x0001], %r12
	.word 0x8d902454  ! 4669: WRPR_PSTATE_I	wrpr	%r0, 0x0454, %pstate
	.word 0x8d902ed1  ! 4670: WRPR_PSTATE_I	wrpr	%r0, 0x0ed1, %pstate
	.word 0x81a000c3  ! 4671: FNEGd	fnegd	%f34, %f0
	.word 0xc0800b60  ! 4672: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r0
	.word 0x24800001  ! 4673: BLE	ble,a	<label_0x1>
	.word 0x99480000  ! 4674: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
DS_236:
	.word 0x34800001  ! 4676: BG	bg,a	<label_0x1>
	illtrap
	.word 0x93b3c30c  ! 4675: ALLIGNADDRESS	alignaddr	%r15, %r12, %r9
	.word 0x8c6ae001  ! 4676: UDIVX_I	udivx 	%r11, 0x0001, %r6
	.word 0x87802014  ! 4677: WRASI_I	wr	%r0, 0x0014, %asi
	mov 0x35, %r30
	.word 0x81d0001e  ! 4678: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x81982b4c  ! 4679: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b4c, %hpstate
	.word 0x8d902c46  ! 4680: WRPR_PSTATE_I	wrpr	%r0, 0x0c46, %pstate
	.word 0xcd17c000  ! 4681: LDQF_R	-	[%r31, %r0], %f6
	.word 0x89a009a1  ! 4682: FDIVs	fdivs	%f0, %f1, %f4
	.word 0x81982fca  ! 4683: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fca, %hpstate
	.word 0x8568000a  ! 4684: SDIVX_R	sdivx	%r0, %r10, %r2
	.word 0x94d8c002  ! 4685: SMULcc_R	smulcc 	%r3, %r2, %r10
	.word 0xd49fc020  ! 4686: LDDA_R	ldda	[%r31, %r0] 0x01, %r10
	mov 0x33, %r30
	.word 0x89d0001e  ! 4687: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
DS_237:
	.word 0x34800001  ! 4689: BG	bg,a	<label_0x1>
	.word 0xcb334007  ! 4689: STQF_R	-	%f5, [%r7, %r13]
	.word 0x81458000  ! 4688: RD_SOFTINT_REG	stbar
	.word 0xc137c007  ! 4689: STQF_R	-	%f0, [%r7, %r31]
	.word 0x8d902490  ! 4690: WRPR_PSTATE_I	wrpr	%r0, 0x0490, %pstate
	.word 0x819825db  ! 4691: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05db, %hpstate
	.word 0x8d802000  ! 4692: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc0800c40  ! 4693: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r0
DS_238:
	.word 0x34800001  ! 4695: BG	bg,a	<label_0x1>
	.word 0xd533e001  ! 4695: STQF_I	-	%f10, [0x0001, %r15]
	.word 0x9b458000  ! 4694: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x8d902695  ! 4695: WRPR_PSTATE_I	wrpr	%r0, 0x0695, %pstate
	.word 0xda8008a0  ! 4696: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x87802004  ! 4697: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x85514000  ! 4698: RDPR_TBA	rdpr	%tba, %r2
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xc4800a80  ! 4700: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r2
DS_239:
	.word 0x20800001  ! 4702: BN	bn,a	<label_0x1>
	illtrap
	.word 0x81b3830d  ! 4701: ALLIGNADDRESS	alignaddr	%r14, %r13, %r0
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8ba00566  ! 4703: FSQRTq	fsqrt	
	ta	T_CHANGE_HPRIV	! macro
	.word 0x36700001  ! 4705: BPGE	<illegal instruction>
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8fa01a66  ! 4707: FqTOi	fqtoi	
	.word 0x8d9024d4  ! 4708: WRPR_PSTATE_I	wrpr	%r0, 0x04d4, %pstate
	.word 0x8e6a6001  ! 4709: UDIVX_I	udivx 	%r9, 0x0001, %r7
	.word 0xce800ba0  ! 4710: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r7
	.word 0xceffc026  ! 4711: SWAPA_R	swapa	%r7, [%r31 + %r6] 0x01
	.word 0x91d02033  ! 4712: Tcc_I	ta	icc_or_xcc, %r0 + 51
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x81982252  ! 4714: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0252, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xce8008a0  ! 4717: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x81982753  ! 4718: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0753, %hpstate
	.word 0x95d02031  ! 4719: Tcc_I	tg	icc_or_xcc, %r0 + 49
	mov 0x30, %r30
	.word 0x8dd0001e  ! 4720: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	mov 0x31, %r30
	.word 0x91d0001e  ! 4721: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8198270a  ! 4722: WRHPR_HPSTATE_I	wrhpr	%r0, 0x070a, %hpstate
	.word 0xce7fe001  ! 4723: SWAP_I	swap	%r7, [%r31 + 0x0001]
	.word 0x32800001  ! 4724: BNE	bne,a	<label_0x1>
	.word 0x87802010  ! 4725: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x8d902ec3  ! 4726: WRPR_PSTATE_I	wrpr	%r0, 0x0ec3, %pstate
	.word 0x9082e001  ! 4727: ADDcc_I	addcc 	%r11, 0x0001, %r8
	.word 0xd007e001  ! 4728: LDUW_I	lduw	[%r31 + 0x0001], %r8
	.word 0x8ba2c9c5  ! 4729: FDIVd	fdivd	%f42, %f36, %f36
	.word 0x8d902e0b  ! 4730: WRPR_PSTATE_I	wrpr	%r0, 0x0e0b, %pstate
	.word 0x8da089ca  ! 4731: FDIVd	fdivd	%f2, %f10, %f6
	.word 0x81982057  ! 4732: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0057, %hpstate
	.word 0x8d902ace  ! 4733: WRPR_PSTATE_I	wrpr	%r0, 0x0ace, %pstate
	.word 0xcc8008a0  ! 4734: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0xcc9fe001  ! 4735: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r6
	.word 0x819826ce  ! 4736: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06ce, %hpstate
	.word 0x8bd02032  ! 4737: Tcc_I	tcs	icc_or_xcc, %r0 + 50
	.word 0x8d902853  ! 4738: WRPR_PSTATE_I	wrpr	%r0, 0x0853, %pstate
	mov 0x35, %r30
	.word 0x87d0001e  ! 4739: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	mov 0x32, %r30
	.word 0x9bd0001e  ! 4740: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0x83a01a66  ! 4741: FqTOi	fqtoi	
	.word 0x8d9020c8  ! 4742: WRPR_PSTATE_I	wrpr	%r0, 0x00c8, %pstate
	.word 0x86820003  ! 4743: ADDcc_R	addcc 	%r8, %r3, %r3
	.word 0x38700001  ! 4744: BPGU	<illegal instruction>
	.word 0x91a00548  ! 4745: FSQRTd	fsqrt	
	.word 0x8ed28009  ! 4746: UMULcc_R	umulcc 	%r10, %r9, %r7
	.word 0x8d902083  ! 4747: WRPR_PSTATE_I	wrpr	%r0, 0x0083, %pstate
	mov 0x33, %r30
	.word 0x97d0001e  ! 4748: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x8080a001  ! 4749: ADDcc_I	addcc 	%r2, 0x0001, %r0
	.word 0x8198271e  ! 4750: WRHPR_HPSTATE_I	wrhpr	%r0, 0x071e, %hpstate
DS_240:
	.word 0x34800001  ! 4752: BG	bg,a	<label_0x1>
	illtrap
	.word 0x99b3c302  ! 4751: ALLIGNADDRESS	alignaddr	%r15, %r2, %r12
	.word 0x819826cd  ! 4752: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06cd, %hpstate
	.word 0x8d802000  ! 4753: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8198210d  ! 4754: WRHPR_HPSTATE_I	wrhpr	%r0, 0x010d, %hpstate
	.word 0x30700001  ! 4755: BPA	<illegal instruction>
	.word 0x97a0056f  ! 4756: FSQRTq	fsqrt	
	.word 0x8d802000  ! 4757: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8198259a  ! 4758: WRHPR_HPSTATE_I	wrhpr	%r0, 0x059a, %hpstate
	.word 0x81a089c8  ! 4759: FDIVd	fdivd	%f2, %f8, %f0
	.word 0x8ba18dc8  ! 4760: FdMULq	fdmulq	
DS_241:
	.word 0x22800001  ! 4762: BE	be,a	<label_0x1>
	.word 0xd931800b  ! 4762: STQF_R	-	%f12, [%r11, %r6]
	.word 0x93458000  ! 4761: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x8fa18dc7  ! 4762: FdMULq	fdmulq	
	mov 0x35, %r30
	.word 0x89d0001e  ! 4763: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x9a68a001  ! 4764: UDIVX_I	udivx 	%r2, 0x0001, %r13
	.word 0x8d802004  ! 4765: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x81982c5e  ! 4766: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c5e, %hpstate
	.word 0x20800001  ! 4767: BN	bn,a	<label_0x1>
	.word 0x81982c4c  ! 4768: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c4c, %hpstate
	.word 0x2c700001  ! 4769: BPNEG	<illegal instruction>
	.word 0x34700001  ! 4770: BPG	<illegal instruction>
	.word 0x94032001  ! 4771: ADD_I	add 	%r12, 0x0001, %r10
DS_242:
	.word 0x20800001  ! 4773: BN	bn,a	<label_0x1>
	.word 0xd131a001  ! 4773: STQF_I	-	%f8, [0x0001, %r6]
	.word 0x83458000  ! 4772: RD_SOFTINT_REG	rd	%softint, %r1
	.word 0x8d90220d  ! 4773: WRPR_PSTATE_I	wrpr	%r0, 0x020d, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0xc21fe001  ! 4775: LDD_I	ldd	[%r31 + 0x0001], %r1
	.word 0xc237e001  ! 4776: STH_I	sth	%r1, [%r31 + 0x0001]
	.word 0x95d02035  ! 4777: Tcc_I	tg	icc_or_xcc, %r0 + 53
	.word 0x8e78000c  ! 4778: SDIV_R	sdiv 	%r0, %r12, %r7
DS_243:
	.word 0x20800001  ! 4780: BN	bn,a	<label_0x1>
	.word 0xd130000c  ! 4780: STQF_R	-	%f8, [%r12, %r0]
	.word 0x93458000  ! 4779: RD_SOFTINT_REG	rd	%softint, %r9
	mov 0x32, %r30
	.word 0x9fd0001e  ! 4780: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x81a0056f  ! 4781: FSQRTq	fsqrt	
	.word 0x8d90200a  ! 4782: WRPR_PSTATE_I	wrpr	%r0, 0x000a, %pstate
	.word 0x8d90220d  ! 4783: WRPR_PSTATE_I	wrpr	%r0, 0x020d, %pstate
	.word 0x93d02030  ! 4784: Tcc_I	tne	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d902c1b  ! 4786: WRPR_PSTATE_I	wrpr	%r0, 0x0c1b, %pstate
	.word 0xc0c004a0  ! 4787: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r0
	.word 0x8d902c04  ! 4788: WRPR_PSTATE_I	wrpr	%r0, 0x0c04, %pstate
	.word 0xc01fc000  ! 4789: LDD_R	ldd	[%r31 + %r0], %r0
	.word 0x8bd02031  ! 4790: Tcc_I	tcs	icc_or_xcc, %r0 + 49
	.word 0xc0cfe030  ! 4791: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r0
	.word 0x9ad1000f  ! 4792: UMULcc_R	umulcc 	%r4, %r15, %r13
	.word 0x8483a001  ! 4793: ADDcc_I	addcc 	%r14, 0x0001, %r2
	.word 0x81982f55  ! 4794: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f55, %hpstate
	.word 0xc4d804a0  ! 4795: LDXA_R	ldxa	[%r0, %r0] 0x25, %r2
	.word 0x22800001  ! 4796: BE	be,a	<label_0x1>
	.word 0x81982980  ! 4797: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0980, %hpstate
DS_244:
	.word 0x32800001  ! 4799: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x81b1030a  ! 4798: ALLIGNADDRESS	alignaddr	%r4, %r10, %r0
	.word 0x8d802004  ! 4799: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d802004  ! 4800: WRFPRS_I	wr	%r0, 0x0004, %fprs
	ta	T_CHANGE_NONHPRIV	! macro
	mov 0x30, %r30
	.word 0x97d0001e  ! 4802: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x94d9000f  ! 4803: SMULcc_R	smulcc 	%r4, %r15, %r10
	.word 0xd417e001  ! 4804: LDUH_I	lduh	[%r31 + 0x0001], %r10
	.word 0x8d902e9a  ! 4805: WRPR_PSTATE_I	wrpr	%r0, 0x0e9a, %pstate
	mov 0x31, %r30
	.word 0x83d0001e  ! 4806: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd4dfe000  ! 4807: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r10
	.word 0x82798002  ! 4808: SDIV_R	sdiv 	%r6, %r2, %r1
	.word 0xc2ffc022  ! 4809: SWAPA_R	swapa	%r1, [%r31 + %r2] 0x01
	.word 0x95d02032  ! 4810: Tcc_I	tg	icc_or_xcc, %r0 + 50
	.word 0xc2c004a0  ! 4811: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r1
	.word 0x87802010  ! 4812: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x8e6b800f  ! 4813: UDIVX_R	udivx 	%r14, %r15, %r7
	.word 0x9c69c006  ! 4814: UDIVX_R	udivx 	%r7, %r6, %r14
DS_245:
	.word 0x34800001  ! 4816: BG	bg,a	<label_0x1>
	illtrap
	.word 0x8fb28308  ! 4815: ALLIGNADDRESS	alignaddr	%r10, %r8, %r7
	.word 0x8080e001  ! 4816: ADDcc_I	addcc 	%r3, 0x0001, %r0
	.word 0x81d02030  ! 4817: Tcc_I	tn	icc_or_xcc, %r0 + 48
	.word 0x8d902edd  ! 4818: WRPR_PSTATE_I	wrpr	%r0, 0x0edd, %pstate
	.word 0xc08804a0  ! 4819: LDUBA_R	lduba	[%r0, %r0] 0x25, %r0
	.word 0x8d902c9b  ! 4820: WRPR_PSTATE_I	wrpr	%r0, 0x0c9b, %pstate
	mov 0x33, %r30
	.word 0x9dd0001e  ! 4821: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x8ba00541  ! 4822: FSQRTd	fsqrt	
	.word 0xcad804a0  ! 4823: LDXA_R	ldxa	[%r0, %r0] 0x25, %r5
	.word 0x36800001  ! 4824: BGE	bge,a	<label_0x1>
	.word 0x9cc32001  ! 4825: ADDCcc_I	addccc 	%r12, 0x0001, %r14
	.word 0x844a2001  ! 4826: MULX_I	mulx 	%r8, 0x0001, %r2
	.word 0x9951c000  ! 4827: RDPR_TL	rdpr	%tl, %r12
	.word 0x2a800001  ! 4828: BCS	bcs,a	<label_0x1>
	.word 0x81d02030  ! 4829: Tcc_I	tn	icc_or_xcc, %r0 + 48
	.word 0xd8800be0  ! 4830: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r12
	.word 0x8d902098  ! 4831: WRPR_PSTATE_I	wrpr	%r0, 0x0098, %pstate
	.word 0x8e682001  ! 4832: UDIVX_I	udivx 	%r0, 0x0001, %r7
	.word 0xce9fc020  ! 4833: LDDA_R	ldda	[%r31, %r0] 0x01, %r7
	.word 0x81982d47  ! 4834: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d47, %hpstate
	.word 0x9683e001  ! 4835: ADDcc_I	addcc 	%r15, 0x0001, %r11
	.word 0x8d802000  ! 4836: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d902889  ! 4837: WRPR_PSTATE_I	wrpr	%r0, 0x0889, %pstate
	.word 0x81982689  ! 4838: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0689, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d90284f  ! 4840: WRPR_PSTATE_I	wrpr	%r0, 0x084f, %pstate
	.word 0x9ac02001  ! 4841: ADDCcc_I	addccc 	%r0, 0x0001, %r13
	.word 0xda1fc000  ! 4842: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0xdb3fc001  ! 4843: STDF_R	std	%f13, [%r1, %r31]
	mov 0x34, %r30
	.word 0x93d0001e  ! 4844: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d9020d9  ! 4845: WRPR_PSTATE_I	wrpr	%r0, 0x00d9, %pstate
	.word 0x8cd8800d  ! 4846: SMULcc_R	smulcc 	%r2, %r13, %r6
	.word 0x8d90248c  ! 4847: WRPR_PSTATE_I	wrpr	%r0, 0x048c, %pstate
	.word 0x95d02031  ! 4848: Tcc_I	tg	icc_or_xcc, %r0 + 49
	.word 0x9bd02034  ! 4849: Tcc_I	tcc	icc_or_xcc, %r0 + 52
	.word 0x9c4ae001  ! 4850: MULX_I	mulx 	%r11, 0x0001, %r14
	.word 0x8d802000  ! 4851: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x3e700001  ! 4852: BPVC	<illegal instruction>
	.word 0x87802088  ! 4853: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x92792001  ! 4854: SDIV_I	sdiv 	%r4, 0x0001, %r9
	.word 0x81982f99  ! 4855: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f99, %hpstate
	.word 0xd2cfe000  ! 4856: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r9
	.word 0x87802080  ! 4857: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xd2c7e000  ! 4858: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r9
DS_246:
	.word 0x34800001  ! 4860: BG	bg,a	<label_0x1>
	illtrap
	.word 0x89b2c301  ! 4859: ALLIGNADDRESS	alignaddr	%r11, %r1, %r4
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc8c7e020  ! 4861: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r4
	.word 0xc8dfe000  ! 4862: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r4
	.word 0x8d802004  ! 4863: WRFPRS_I	wr	%r0, 0x0004, %fprs
DS_247:
	.word 0x34800001  ! 4865: BG	bg,a	<label_0x1>
	illtrap
	.word 0x8db1830d  ! 4864: ALLIGNADDRESS	alignaddr	%r6, %r13, %r6
	.word 0x2e700001  ! 4865: BPVS	<illegal instruction>
	.word 0x8d90288a  ! 4866: WRPR_PSTATE_I	wrpr	%r0, 0x088a, %pstate
	.word 0x8d802004  ! 4867: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x95480000  ! 4868: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
	.word 0x90d0000c  ! 4869: UMULcc_R	umulcc 	%r0, %r12, %r8
	.word 0x24700001  ! 4870: BPLE	<illegal instruction>
	.word 0x8d802004  ! 4871: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x97d02031  ! 4872: Tcc_I	tge	icc_or_xcc, %r0 + 49
	.word 0x9251c001  ! 4873: UMUL_R	umul 	%r7, %r1, %r9
	.word 0x8d9024c5  ! 4874: WRPR_PSTATE_I	wrpr	%r0, 0x04c5, %pstate
	.word 0xd28804a0  ! 4875: LDUBA_R	lduba	[%r0, %r0] 0x25, %r9
	.word 0x99a0054c  ! 4876: FSQRTd	fsqrt	
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d9024c2  ! 4878: WRPR_PSTATE_I	wrpr	%r0, 0x04c2, %pstate
	.word 0x81982341  ! 4879: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0341, %hpstate
	.word 0xd807c000  ! 4880: LDUW_R	lduw	[%r31 + %r0], %r12
	.word 0xd8d80e40  ! 4881: LDXA_R	ldxa	[%r0, %r0] 0x72, %r12
	.word 0x87802004  ! 4882: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8d902a50  ! 4883: WRPR_PSTATE_I	wrpr	%r0, 0x0a50, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x81d02035  ! 4885: Tcc_I	tn	icc_or_xcc, %r0 + 53
	.word 0x22700001  ! 4886: BPE	<illegal instruction>
	.word 0x87802089  ! 4887: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8681000b  ! 4888: ADDcc_R	addcc 	%r4, %r11, %r3
	.word 0x8d902cc9  ! 4889: WRPR_PSTATE_I	wrpr	%r0, 0x0cc9, %pstate
	.word 0x95508000  ! 4890: RDPR_TSTATE	rdpr	%tstate, %r10
	.word 0x9e824004  ! 4891: ADDcc_R	addcc 	%r9, %r4, %r15
	.word 0xde7fe001  ! 4892: SWAP_I	swap	%r15, [%r31 + 0x0001]
	.word 0x34700001  ! 4893: BPG	<illegal instruction>
	.word 0x819827cd  ! 4894: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07cd, %hpstate
	.word 0xdec004a0  ! 4895: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r15
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d9022d3  ! 4897: WRPR_PSTATE_I	wrpr	%r0, 0x02d3, %pstate
	.word 0xded004a0  ! 4898: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r15
	.word 0x8d902a0e  ! 4899: WRPR_PSTATE_I	wrpr	%r0, 0x0a0e, %pstate
	.word 0x8d902c96  ! 4900: WRPR_PSTATE_I	wrpr	%r0, 0x0c96, %pstate
	mov 0x32, %r30
	.word 0x9fd0001e  ! 4901: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x91a01a65  ! 4902: FqTOi	fqtoi	
	ta	T_CHANGE_PRIV	! macro
	.word 0xd0bfe001  ! 4904: STDA_I	stda	%r8, [%r31 + 0x0001] %asi
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9b494000  ! 4906: RDHPR_HTBA	rdhpr	%htba, %r13
	.word 0x9a814008  ! 4907: ADDcc_R	addcc 	%r5, %r8, %r13
DS_248:
	.word 0x20800001  ! 4909: BN	bn,a	<label_0x1>
	illtrap
	.word 0x97b1c304  ! 4908: ALLIGNADDRESS	alignaddr	%r7, %r4, %r11
	.word 0x94db4002  ! 4909: SMULcc_R	smulcc 	%r13, %r2, %r10
	.word 0x95d02034  ! 4910: Tcc_I	tg	icc_or_xcc, %r0 + 52
	.word 0x93a01a69  ! 4911: FqTOi	fqtoi	
	.word 0x81982357  ! 4912: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0357, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xd217e001  ! 4914: LDUH_I	lduh	[%r31 + 0x0001], %r9
	.word 0x93a01a66  ! 4915: FqTOi	fqtoi	
	.word 0x8d902e4b  ! 4916: WRPR_PSTATE_I	wrpr	%r0, 0x0e4b, %pstate
	.word 0x8bd02030  ! 4917: Tcc_I	tcs	icc_or_xcc, %r0 + 48
	.word 0x9bd02034  ! 4918: Tcc_I	tcc	icc_or_xcc, %r0 + 52
	.word 0x87802010  ! 4919: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x8e69000b  ! 4920: UDIVX_R	udivx 	%r4, %r11, %r7
	.word 0xce7fe001  ! 4921: SWAP_I	swap	%r7, [%r31 + 0x0001]
	.word 0x819828d8  ! 4922: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d8, %hpstate
	.word 0x97a149ca  ! 4923: FDIVd	fdivd	%f36, %f10, %f42
	.word 0xd647e001  ! 4924: LDSW_I	ldsw	[%r31 + 0x0001], %r11
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d9026de  ! 4927: WRPR_PSTATE_I	wrpr	%r0, 0x06de, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xd647e001  ! 4929: LDSW_I	ldsw	[%r31 + 0x0001], %r11
	.word 0x987a2001  ! 4930: SDIV_I	sdiv 	%r8, 0x0001, %r12
	.word 0xd8d004a0  ! 4931: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r12
	.word 0xd88804a0  ! 4932: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
	.word 0x99508000  ! 4933: RDPR_TSTATE	rdpr	%tstate, %r12
	.word 0x8dd02030  ! 4934: Tcc_I	tneg	icc_or_xcc, %r0 + 48
	mov 0x31, %r30
	.word 0x97d0001e  ! 4935: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x8d902a50  ! 4936: WRPR_PSTATE_I	wrpr	%r0, 0x0a50, %pstate
	.word 0xd87fe001  ! 4937: SWAP_I	swap	%r12, [%r31 + 0x0001]
	.word 0x91a01a65  ! 4938: FqTOi	fqtoi	
	.word 0x8d514000  ! 4939: RDPR_TBA	rdpr	%tba, %r6
	.word 0x86786001  ! 4940: SDIV_I	sdiv 	%r1, 0x0001, %r3
	.word 0x926a2001  ! 4941: UDIVX_I	udivx 	%r8, 0x0001, %r9
	.word 0x8d802000  ! 4942: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_PRIV	! macro
	.word 0xd2dfe010  ! 4944: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r9
	.word 0x95d02035  ! 4945: Tcc_I	tg	icc_or_xcc, %r0 + 53
	.word 0x9c6ac006  ! 4946: UDIVX_R	udivx 	%r11, %r6, %r14
	.word 0x98006001  ! 4947: ADD_I	add 	%r1, 0x0001, %r12
	.word 0x81982511  ! 4948: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0511, %hpstate
	mov 0x31, %r30
	.word 0x8dd0001e  ! 4949: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0xd8d004a0  ! 4950: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r12
	.word 0xd84fe001  ! 4951: LDSB_I	ldsb	[%r31 + 0x0001], %r12
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81982a80  ! 4953: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a80, %hpstate
DS_249:
	.word 0x20800001  ! 4955: BN	bn,a	<label_0x1>
	.word 0xdf316001  ! 4955: STQF_I	-	%f15, [0x0001, %r5]
	.word 0x95458000  ! 4954: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0x8198234b  ! 4955: WRHPR_HPSTATE_I	wrhpr	%r0, 0x034b, %hpstate
	.word 0x81982845  ! 4956: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0845, %hpstate
	mov 0x35, %r30
	.word 0x85d0001e  ! 4957: Tcc_R	tle	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	mov 0x34, %r30
	.word 0x93d0001e  ! 4959: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd4ffc026  ! 4960: SWAPA_R	swapa	%r10, [%r31 + %r6] 0x01
	.word 0x87802088  ! 4961: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x92012001  ! 4962: ADD_I	add 	%r4, 0x0001, %r9
	.word 0xd2c804a0  ! 4963: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r9
	.word 0x97d02033  ! 4964: Tcc_I	tge	icc_or_xcc, %r0 + 51
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd28008a0  ! 4966: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x81982c52  ! 4967: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c52, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd2d804a0  ! 4969: LDXA_R	ldxa	[%r0, %r0] 0x25, %r9
	.word 0x8d902c00  ! 4970: WRPR_PSTATE_I	wrpr	%r0, 0x0c00, %pstate
	.word 0x30700001  ! 4971: BPA	<illegal instruction>
	.word 0x8d90265b  ! 4972: WRPR_PSTATE_I	wrpr	%r0, 0x065b, %pstate
	.word 0x81982816  ! 4973: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0816, %hpstate
	.word 0xd25fe001  ! 4974: LDX_I	ldx	[%r31 + 0x0001], %r9
	.word 0x9ad3a001  ! 4975: UMULcc_I	umulcc 	%r14, 0x0001, %r13
	.word 0x8d90205f  ! 4976: WRPR_PSTATE_I	wrpr	%r0, 0x005f, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ec32001  ! 4978: ADDCcc_I	addccc 	%r12, 0x0001, %r15
	.word 0x9ec0a001  ! 4979: ADDCcc_I	addccc 	%r2, 0x0001, %r15
	.word 0x9ba089af  ! 4980: FDIVs	fdivs	%f2, %f15, %f13
	.word 0x8dd02035  ! 4981: Tcc_I	tneg	icc_or_xcc, %r0 + 53
	mov 0x32, %r30
	.word 0x9dd0001e  ! 4982: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0xda8fe010  ! 4983: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r13
	.word 0xdac00e80  ! 4984: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r13
	.word 0x8cc22001  ! 4985: ADDCcc_I	addccc 	%r8, 0x0001, %r6
DS_250:
	.word 0x32800001  ! 4987: BNE	bne,a	<label_0x1>
	.word 0xd3324004  ! 4987: STQF_R	-	%f9, [%r4, %r9]
	.word 0x8b458000  ! 4986: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0x9c48a001  ! 4987: MULX_I	mulx 	%r2, 0x0001, %r14
	.word 0x81d02034  ! 4988: Tcc_I	tn	icc_or_xcc, %r0 + 52
	.word 0x987b800d  ! 4989: SDIV_R	sdiv 	%r14, %r13, %r12
	ta	T_CHANGE_TO_TL0	! macro
	mov 0x30, %r30
	.word 0x93d0001e  ! 4991: Tcc_R	tne	icc_or_xcc, %r0 + %r30
DS_251:
	.word 0x34800001  ! 4993: BG	bg,a	<label_0x1>
	.word 0xd531e001  ! 4993: STQF_I	-	%f10, [0x0001, %r7]
	.word 0x93458000  ! 4992: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x8e4a400d  ! 4993: MULX_R	mulx 	%r9, %r13, %r7
	.word 0x819825d4  ! 4994: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05d4, %hpstate
	.word 0x8d9020d8  ! 4995: WRPR_PSTATE_I	wrpr	%r0, 0x00d8, %pstate
	.word 0x9cd90007  ! 4996: SMULcc_R	smulcc 	%r4, %r7, %r14
	.word 0x8d902a8c  ! 4997: WRPR_PSTATE_I	wrpr	%r0, 0x0a8c, %pstate
	.word 0x8fa08d29  ! 4998: FsMULd	fsmuld	%f2, %f40, %f38


.data
user_data_start:
	.xword	0xf6cf076f006d0cfe
	.xword	0xafe360d6e4142927
	.xword	0x4d474bf1b3a656cf
	.xword	0xad069477101a41b5
	.xword	0x36e52149e4f71253
	.xword	0x7ddb4e7a13a3d7ab
	.xword	0xb1cfc74bf3413bf7
	.xword	0x7c11957e2d639119
	.xword	0xc11118cce1c2c958
	.xword	0xecc67cf038f0a117
	.xword	0x8f88c2e2ff2b4cef
	.xword	0xb60af9778de9adf9
	.xword	0xac45b1154b649055
	.xword	0x33bf83d7896d9538
	.xword	0x9318c485c4ea278a
	.xword	0x4acdc94d0172153c
	.xword	0xfb6910954d78f630
	.xword	0xeae8c70517412de3
	.xword	0x1f8fbb3d4c4651cb
	.xword	0x4bb8951148845df3
	.xword	0xc2f41101f191a2b3
	.xword	0xe521a8375e6a1208
	.xword	0xd9bc78f2e7f33ae7
	.xword	0x444b703e3bd9ae41
	.xword	0x681b1a795234fc67
	.xword	0x282f4a07840afaba
	.xword	0x827fbb34be51a498
	.xword	0xd6d4ff2186545f7e
	.xword	0x8c8c1ff1b1068baa
	.xword	0x52fdbc1c73528daf
	.xword	0x6a3740755f901c8d
	.xword	0x4ee0f0ae623c3e80
	.xword	0xc9a9d09778680c8b
	.xword	0xe8e837cc99bf4210
	.xword	0x417d416a9698197f
	.xword	0x8340846fe55d2ee7
	.xword	0x74df3e80011bec50
	.xword	0x098b5245949ba1b7
	.xword	0x68e887e84f4683f4
	.xword	0xd312d9bc4dc364b3
	.xword	0x8ce130e349daa32a
	.xword	0x531ac18cbd6e4634
	.xword	0x040e19277c1ba161
	.xword	0x45f0b45c5ac0b4ed
	.xword	0xb2f89a6d89608d4c
	.xword	0xed01edecf5e32058
	.xword	0x5855626ff6afdcac
	.xword	0x4392f58bc8add027
	.xword	0x3bb5456dd6df2521
	.xword	0x980bade9fbf5b750
	.xword	0x3c7a4c99ce75ac85
	.xword	0xa6781f4c8e141da1
	.xword	0x5e8edb47cd0d2539
	.xword	0xf03175be51996d73
	.xword	0xf9488faa039fceb7
	.xword	0x60d3a4db95bdb1b5
	.xword	0x159159e565ed367e
	.xword	0xcf48bc90bb076df9
	.xword	0xe73d1c32819f6ac4
	.xword	0x80d128346bf0a7d9
	.xword	0x3cd72fcbb5ca514d
	.xword	0x58c649e2949126b9
	.xword	0x0fc2d74e1e1d2eda
	.xword	0x01ca30b75cba512d
	.xword	0x124b952d3a1fa4d8
	.xword	0x74e019cef6f311fc
	.xword	0x211c11e1d7d54df2
	.xword	0x2c4974c005672c0a
	.xword	0xaf3197a7657ccaf7
	.xword	0xdbb5b962f5392a75
	.xword	0x297ef938c18dfcb8
	.xword	0xb1b663b14b0ed6f9
	.xword	0x659c149143b7324d
	.xword	0xba882e8a23e1b625
	.xword	0x904b78a58a34938a
	.xword	0x9eed98fb696a20e8
	.xword	0x55737623e87f6d1c
	.xword	0xe4640fa0992475f6
	.xword	0xb44fedab0411e31d
	.xword	0x0f04c289bc63d3b7
	.xword	0xe4568da5474bef41
	.xword	0x43413b27636b511d
	.xword	0x962ec97cccbd6001
	.xword	0xf0206a611f841846
	.xword	0x0d7082ff3731c1ef
	.xword	0x7c97275e4581bbed
	.xword	0xc06cee4e55822171
	.xword	0x3c8af21969fece42
	.xword	0xa7805f4999401639
	.xword	0x7e797e7f2a490295
	.xword	0xb2ad33972bfc73a8
	.xword	0x2f2d606a1e310002
	.xword	0x1dd6f6353463f505
	.xword	0x987d58bf27b79d6a
	.xword	0xf5228be35c0e6d4c
	.xword	0xb08484ac45e46c6a
	.xword	0x383bcf3eebd82923
	.xword	0x7e3a941d64f99fa9
	.xword	0xe7f084c1f3625297
	.xword	0xe5cf9d1f3b1a913d
	.xword	0x66a00d87a5175de6
	.xword	0xfe7db1f9f8dbc539
	.xword	0x3d6169e5069fea05
	.xword	0x3f281ee34a1cac14
	.xword	0xebe471656b0fc097
	.xword	0x0d7d70b09d6bd89b
	.xword	0xd0dcb99813d4c802
	.xword	0xef987c5e0254d004
	.xword	0x6bfecfd860ef4feb
	.xword	0xdee87d59d90359a9
	.xword	0x3b62150c9dbbf904
	.xword	0x05c242b653391243
	.xword	0x8b6147bd4d84bda9
	.xword	0x295925c8af22b3d5
	.xword	0x14b29ffe1ea3762e
	.xword	0xbf2e871a5c1ab2e0
	.xword	0xf3e87486744e7196
	.xword	0x3f9c7ec555495928
	.xword	0xba4df243c7538e17
	.xword	0x352de6470dbca5a3
	.xword	0x9ee5fe04e5746136
	.xword	0xb93fa1ab00ccade9
	.xword	0x396b783aa50057f1
	.xword	0x9397c7bd0fff8802
	.xword	0xdd170c7571918e90
	.xword	0x0bcd95af6d932704
	.xword	0xe3c12aa1e3a38535
	.xword	0xe90fbffa377ab014
	.xword	0x0f49fda169b8f0a7
	.xword	0x110032c53de6e707
	.xword	0x8783735aadf3073d
	.xword	0x7cbe2fff3a37798d
	.xword	0x5a78d246943abb26
	.xword	0xae03087e1c8df97a
	.xword	0x8d5d6f39db22e3ac
	.xword	0xd1a2c7205ed599d3
	.xword	0xd3eca03dedae1374
	.xword	0x3c88a1a70a5f4917
	.xword	0x51c007defb5e96cc
	.xword	0x619c278108b8fe0d
	.xword	0x1897d6559df565b7
	.xword	0x5360ed2bdc633187
	.xword	0x5175e2a1c4999265
	.xword	0x73d612126089f0be
	.xword	0x06d765a1bb071f8a
	.xword	0x73fceb1c67aa3512
	.xword	0x9049e163f0db7e93
	.xword	0x5ed79b9db9d27cbe
	.xword	0xb2c95dc51c3cffb9
	.xword	0x04201802c73b98b5
	.xword	0x7f2ff5c3dacee3f4
	.xword	0xc1737a419b7f5c14
	.xword	0x597d183a822d02c1
	.xword	0x2442ededd71422c2
	.xword	0xbdd986dce5f35073
	.xword	0x4d9b2964c433df2e
	.xword	0xf902bcb6d12ff64f
	.xword	0xb31794a524a862d4
	.xword	0x96c41c58baf87430
	.xword	0xa4d9df1d22a62bfa
	.xword	0x95ae65b3b004e003
	.xword	0xcd260aaf74ffe5aa
	.xword	0x5eb6895ae96d3fe5
	.xword	0x9192ee7fbe3f1bd8
	.xword	0xf14e6063dc2d14c0
	.xword	0x136c02cab0ec7e3d
	.xword	0x5398941bf090ff35
	.xword	0x9a14fb30ae29264e
	.xword	0x3767c72d4f4d4fc3
	.xword	0xf67d85e36e6754d2
	.xword	0x5b5d99a8b18257f3
	.xword	0x89fb7ac41ad103fa
	.xword	0x3c23a25098a8b8ca
	.xword	0x96ad759ba1e9cc81
	.xword	0xba1771230c8fb9f9
	.xword	0xd62e6f27e05f258b
	.xword	0x0d409cd13ae2f84d
	.xword	0x6c53d028a189cd06
	.xword	0xa0ae5f48893f2af6
	.xword	0xb1eb4445d499cfe0
	.xword	0x67d28df3b5b3a1ad
	.xword	0xe2310bcd04ebf5b2
	.xword	0xf667570c571c138d
	.xword	0x50466113d75fb210
	.xword	0x97bc3d6b7c037871
	.xword	0xe88b779e7cf10988
	.xword	0x76d613599fb0d3bb
	.xword	0xc0d6585a2b2bfdae
	.xword	0xc3044330ea502448
	.xword	0xbadbc418c2226c12
	.xword	0x140b438a2ca1ad81
	.xword	0x4a64da9be117b2ce
	.xword	0xb1c51afeb98bf98a
	.xword	0x17b80c44c94f42db
	.xword	0x7cbfb78ebbb3218d
	.xword	0x280ed9e0d1c7b0e2
	.xword	0x5f1288f3f4bccbc5
	.xword	0x9085cec82d72e941
	.xword	0x2e182273c8258a68
	.xword	0x6ccdd36c7ccd9df9
	.xword	0xdfe0bf827bc5038e
	.xword	0x99d1166b60dbc8ec
	.xword	0x250f3e3eec7434bf
	.xword	0xf1c7ea8cb3bba42f
	.xword	0x5359e0995c350f2a
	.xword	0x11a7ef78c78162a4
	.xword	0x7371e2fe8b25e7d7
	.xword	0xfc2b3830dba6d8e9
	.xword	0x34e1b2f507e15f6a
	.xword	0x0eb1016a95b9ad26
	.xword	0x01943343003e5c26
	.xword	0xcbc376f4207580bc
	.xword	0x1d80082f8f69809e
	.xword	0xdafe8f48eeeea45a
	.xword	0xd3a78f6402612c55
	.xword	0x2717accfc6b9ff36
	.xword	0x50a5e411d33f37ea
	.xword	0xec60f3bb6ec31460
	.xword	0x07309227889ced9d
	.xword	0xb60899ad1c098e83
	.xword	0x0039a934d954c431
	.xword	0x78b5e86b8e7bc296
	.xword	0xded1b952d440c904
	.xword	0xfb4b1ca70da0a319
	.xword	0x254d43ef182f3cee
	.xword	0xdb6cfd5325f1b0fb
	.xword	0xb1b9108d4dc4fb54
	.xword	0xc0e2f3c1d4b03615
	.xword	0xba6fa467b96d5cfb
	.xword	0xe47ed2627f8a58db
	.xword	0xc9dcb9d5404e49d2
	.xword	0x298c79f8f5abcf1f
	.xword	0xe15b9d9b9a59f094
	.xword	0x6ae9b0c53d4d7989
	.xword	0x8b7343c540286cdc
	.xword	0x0507f1e4946f9346
	.xword	0xcd50fbd2e7887859
	.xword	0x8796fad9c15f6a11
	.xword	0x0f7f98c14faad5db
	.xword	0xaa64e7ee10216e20
	.xword	0xb2dcff4349d3fd1c
	.xword	0xc44ce58253328f06
	.xword	0xd523e6a8181cf96d
	.xword	0x6e74035322c7b485
	.xword	0x22b8d4ec86fbe698
	.xword	0x4e5e9c80eea60d04
	.xword	0x597a56d286e32085
	.xword	0x8d222dfd6a3ef5f4
	.xword	0xfbe53140ed6d6d79
	.xword	0x5225bb59ed06f475
	.xword	0x826f393d8cd3c1c8
	.xword	0xb7bc98164aeebf63
	.xword	0x432d6d835a83f880
	.xword	0xb46573f517e1a31b
	.xword	0x0d89155f399a7633
	.xword	0x8531bff9226f0410


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

