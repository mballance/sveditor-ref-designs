/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand02_ind_05.s
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
    save; \
    2: done; \
    nop; \
    1: ba 2b; \
    restore
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
	.word 0x87682001  ! 1: SDIVX_I	sdivx	%r0, 0x0001, %r3
	.word 0x9bd02035  ! 2: Tcc_I	tcc	icc_or_xcc, %r0 + 53
	.word 0xc68004a0  ! 3: LDUWA_R	lduwa	[%r0, %r0] 0x25, %r3
	.word 0x80d0000b  ! 4: UMULcc_R	umulcc 	%r0, %r11, %r0
	.word 0xc0cfe030  ! 5: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r0
	.word 0xc08fe000  ! 6: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r0
	.word 0x2c700001  ! 7: BPNEG	<illegal instruction>
	.word 0x89a28d2f  ! 8: FsMULd	fsmuld	%f10, %f46, %f4
	.word 0xc88804a0  ! 9: LDUBA_R	lduba	[%r0, %r0] 0x25, %r4
	.word 0xc927e001  ! 10: STF_I	st	%f4, [0x0001, %r31]
	.word 0xc8dfe020  ! 11: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r4
	.word 0x93a01a62  ! 12: FqTOi	fqtoi	
	.word 0x91500000  ! 13: RDPR_TPC	rdpr	%tpc, %r8
	.word 0x99494000  ! 14: RDHPR_HTBA	rdhpr	%htba, %r12
	.word 0xd847c000  ! 15: LDSW_R	ldsw	[%r31 + %r0], %r12
	.word 0x8d90284c  ! 16: WRPR_PSTATE_I	wrpr	%r0, 0x084c, %pstate
	.word 0x85a109c7  ! 17: FDIVd	fdivd	%f4, %f38, %f2
	.word 0x8d902a83  ! 18: WRPR_PSTATE_I	wrpr	%r0, 0x0a83, %pstate
	.word 0x87480000  ! 19: RDHPR_HPSTATE	rdhpr	%hpstate, %r3
	.word 0xc727c007  ! 20: STF_R	st	%f3, [%r7, %r31]
	ta	T_CHANGE_PRIV	! macro
	.word 0xc6d804a0  ! 22: LDXA_R	ldxa	[%r0, %r0] 0x25, %r3
	.word 0x83d02031  ! 23: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0x87802045  ! 24: WRASI_I	wr	%r0, 0x0045, %asi
	.word 0x9ba01a65  ! 25: FqTOi	fqtoi	
	.word 0xda8004a0  ! 26: LDUWA_R	lduwa	[%r0, %r0] 0x25, %r13
!	.word 0x8db24fe6  ! 27: FONES	fones	%f6
	ta	T_CHANGE_NONHPRIV	! macro
DS_0:
	.word 0x32800001  ! 30: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x93b0c303  ! 29: ALLIGNADDRESS	alignaddr	%r3, %r3, %r9
	.word 0x8b6aa001  ! 30: SDIVX_I	sdivx	%r10, 0x0001, %r5
	.word 0x99a34d28  ! 31: FsMULd	fsmuld	%f13, %f8, %f12
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xd937c008  ! 33: STQF_R	-	%f12, [%r8, %r31]
	.word 0x8d9026c8  ! 34: WRPR_PSTATE_I	wrpr	%r0, 0x06c8, %pstate
	.word 0x9c82c009  ! 35: ADDcc_R	addcc 	%r11, %r9, %r14
	.word 0x24700001  ! 36: BPLE	<illegal instruction>
	.word 0xdde7c029  ! 37: CASA_I	casa	[%r31] 0x 1, %r9, %r14
	.word 0x83d02030  ! 38: Tcc_I	te	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d802004  ! 40: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x91a109a1  ! 41: FDIVs	fdivs	%f4, %f1, %f8
DS_1:
	.word 0x20800001  ! 43: BN	bn,a	<label_0x1>
	illtrap
	.word 0x93b0030e  ! 42: ALLIGNADDRESS	alignaddr	%r0, %r14, %r9
	ta	T_CHANGE_PRIV	! macro
	.word 0x3a700001  ! 44: BPCC	<illegal instruction>
	.word 0x9fa089a5  ! 45: FDIVs	fdivs	%f2, %f5, %f15
	.word 0x24700001  ! 46: BPLE	<illegal instruction>
	mov 0x32, %r30
	.word 0x95d0001e  ! 47: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x8dd02033  ! 48: Tcc_I	tneg	icc_or_xcc, %r0 + 51
	.word 0xdf3fc005  ! 49: STDF_R	std	%f15, [%r5, %r31]
	.word 0x8fa049a7  ! 50: FDIVs	fdivs	%f1, %f7, %f7
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xcf3fc007  ! 52: STDF_R	std	%f7, [%r7, %r31]
	.word 0x956a8005  ! 53: SDIVX_R	sdivx	%r10, %r5, %r10
	.word 0x8d802000  ! 54: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9fa000c6  ! 55: FNEGd	fnegd	%f6, %f46
DS_2:
	.word 0x20800001  ! 57: BN	bn,a	<label_0x1>
	.word 0xd7334008  ! 57: STQF_R	-	%f11, [%r8, %r13]
	.word 0x83458000  ! 56: RD_SOFTINT_REG	rd	%softint, %r1
	.word 0x8d9020d6  ! 57: WRPR_PSTATE_I	wrpr	%r0, 0x00d6, %pstate
	.word 0x8d802000  ! 58: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_3:
	.word 0x20800001  ! 60: BN	bn,a	<label_0x1>
	.word 0xd1308008  ! 60: STQF_R	-	%f8, [%r8, %r2]
	.word 0x97458000  ! 59: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0x8d802000  ! 60: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d90244f  ! 61: WRPR_PSTATE_I	wrpr	%r0, 0x044f, %pstate
DS_4:
	.word 0x32800001  ! 63: BNE	bne,a	<label_0x1>
	.word 0xd330c00e  ! 63: STQF_R	-	%f9, [%r14, %r3]
	.word 0x8f458000  ! 62: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0x92c0a001  ! 63: ADDCcc_I	addccc 	%r2, 0x0001, %r9
	.word 0x24800001  ! 64: BLE	ble,a	<label_0x1>
	.word 0x90d88004  ! 65: SMULcc_R	smulcc 	%r2, %r4, %r8
	.word 0x9a6a8004  ! 66: UDIVX_R	udivx 	%r10, %r4, %r13
	.word 0x97a149a8  ! 67: FDIVs	fdivs	%f5, %f8, %f11
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8d802000  ! 69: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x83a00568  ! 70: FSQRTq	fsqrt	
	.word 0x8679a001  ! 71: SDIV_I	sdiv 	%r6, 0x0001, %r3
DS_5:
	.word 0x32800001  ! 73: BNE	bne,a	<label_0x1>
	.word 0xd330e001  ! 73: STQF_I	-	%f9, [0x0001, %r3]
	.word 0x8d458000  ! 72: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0xcc57e001  ! 73: LDSH_I	ldsh	[%r31 + 0x0001], %r6
	.word 0x96790009  ! 74: SDIV_R	sdiv 	%r4, %r9, %r11
	.word 0x8d902446  ! 75: WRPR_PSTATE_I	wrpr	%r0, 0x0446, %pstate
DS_6:
	.word 0x34800001  ! 77: BG	bg,a	<label_0x1>
	illtrap
	.word 0x93b30304  ! 76: ALLIGNADDRESS	alignaddr	%r12, %r4, %r9
	.word 0x8d902ecb  ! 77: WRPR_PSTATE_I	wrpr	%r0, 0x0ecb, %pstate
	.word 0xd2ffc024  ! 78: SWAPA_R	swapa	%r9, [%r31 + %r4] 0x01
	.word 0x8a69e001  ! 79: UDIVX_I	udivx 	%r7, 0x0001, %r5
	.word 0x8281e001  ! 80: ADDcc_I	addcc 	%r7, 0x0001, %r1
	.word 0x8d802000  ! 81: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d90245c  ! 83: WRPR_PSTATE_I	wrpr	%r0, 0x045c, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8350c000  ! 85: RDPR_TT	rdpr	%tt, %r1
	.word 0x8d90245a  ! 86: WRPR_PSTATE_I	wrpr	%r0, 0x045a, %pstate
	.word 0x8d902c4b  ! 87: WRPR_PSTATE_I	wrpr	%r0, 0x0c4b, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x887ae001  ! 89: SDIV_I	sdiv 	%r11, 0x0001, %r4
	.word 0xc8c80e40  ! 90: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r4
	.word 0x9550c000  ! 91: RDPR_TT	rdpr	%tt, %r10
	.word 0xd5e7c024  ! 92: CASA_I	casa	[%r31] 0x 1, %r4, %r10
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_TO_TL0	! macro
	mov 0x33, %r30
	.word 0x9dd0001e  ! 97: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 98: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x22700001  ! 99: BPE	<illegal instruction>
	.word 0x87a00561  ! 100: FSQRTq	fsqrt	
	.word 0x8fa3c9a3  ! 101: FDIVs	fdivs	%f15, %f3, %f7
	.word 0xcec004a0  ! 102: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r7
	.word 0x3c800001  ! 103: BPOS	bpos,a	<label_0x1>
DS_7:
	.word 0x20800001  ! 105: BN	bn,a	<label_0x1>
	.word 0xd5326001  ! 105: STQF_I	-	%f10, [0x0001, %r9]
	.word 0x83458000  ! 104: RD_SOFTINT_REG	rd	%softint, %r1
	.word 0xc28804a0  ! 105: LDUBA_R	lduba	[%r0, %r0] 0x25, %r1
	.word 0xc27fe001  ! 106: SWAP_I	swap	%r1, [%r31 + 0x0001]
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8d902058  ! 108: WRPR_PSTATE_I	wrpr	%r0, 0x0058, %pstate
	.word 0x8d902647  ! 109: WRPR_PSTATE_I	wrpr	%r0, 0x0647, %pstate
	.word 0xc23fc003  ! 110: STD_R	std	%r1, [%r31 + %r3]
	.word 0x8d802000  ! 111: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91d02030  ! 112: Tcc_I	ta	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d902201  ! 114: WRPR_PSTATE_I	wrpr	%r0, 0x0201, %pstate
	.word 0x9ad9c006  ! 115: SMULcc_R	smulcc 	%r7, %r6, %r13
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d90225d  ! 118: WRPR_PSTATE_I	wrpr	%r0, 0x025d, %pstate
	.word 0x85a10d24  ! 119: FsMULd	fsmuld	%f4, %f4, %f2
	ta	T_CHANGE_HPRIV	! macro
	.word 0x906b000e  ! 121: UDIVX_R	udivx 	%r12, %r14, %r8
	.word 0x3a800001  ! 122: BCC	bcc,a	<label_0x1>
	.word 0xd0d80e40  ! 123: LDXA_R	ldxa	[%r0, %r0] 0x72, %r8
	.word 0x9e4b4003  ! 124: MULX_R	mulx 	%r13, %r3, %r15
	.word 0x9da0056a  ! 125: FSQRTq	fsqrt	
	.word 0x87802088  ! 126: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8cd0a001  ! 127: UMULcc_I	umulcc 	%r2, 0x0001, %r6
	.word 0xccc004a0  ! 128: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r6
	.word 0x34800001  ! 129: BG	bg,a	<label_0x1>
	mov 0x35, %r30
	.word 0x9dd0001e  ! 130: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0xcc1fc000  ! 131: LDD_R	ldd	[%r31 + %r0], %r6
	.word 0x8d902c08  ! 132: WRPR_PSTATE_I	wrpr	%r0, 0x0c08, %pstate
	.word 0x8ad3e001  ! 133: UMULcc_I	umulcc 	%r15, 0x0001, %r5
	.word 0xca1fc000  ! 134: LDD_R	ldd	[%r31 + %r0], %r5
	.word 0xcb17c000  ! 135: LDQF_R	-	[%r31, %r0], %f5
	mov 0x30, %r30
	.word 0x9fd0001e  ! 136: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x9bd02030  ! 137: Tcc_I	tcc	icc_or_xcc, %r0 + 48
	.word 0x9f514000  ! 138: RDPR_TBA	rdpr	%tba, %r15
	.word 0x8d802000  ! 139: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d802000  ! 140: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x95494000  ! 141: RDHPR_HTBA	rdhpr	%htba, %r10
	mov 0x30, %r30
	.word 0x83d0001e  ! 142: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8ba28dc4  ! 143: FdMULq	fdmulq	
	.word 0x32700001  ! 144: BPNE	<illegal instruction>
	.word 0xca1fc000  ! 145: LDD_R	ldd	[%r31 + %r0], %r5
	mov 0x30, %r30
	.word 0x91d0001e  ! 146: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xca87e030  ! 147: LDUWA_I	lduwa	[%r31, + 0x0030] %asi, %r5
	.word 0x8d9020ce  ! 148: WRPR_PSTATE_I	wrpr	%r0, 0x00ce, %pstate
	.word 0x9d500000  ! 149: RDPR_TPC	rdpr	%tpc, %r14
	.word 0x87a3cd29  ! 150: FsMULd	fsmuld	%f15, %f40, %f34
	ta	T_CHANGE_PRIV	! macro
	.word 0x93d02030  ! 152: Tcc_I	tne	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_HPRIV	! macro
	.word 0x80d28009  ! 154: UMULcc_R	umulcc 	%r10, %r9, %r0
	.word 0x8d902c04  ! 155: WRPR_PSTATE_I	wrpr	%r0, 0x0c04, %pstate
DS_8:
	.word 0x20800001  ! 157: BN	bn,a	<label_0x1>
	illtrap
	.word 0x89b1c304  ! 156: ALLIGNADDRESS	alignaddr	%r7, %r4, %r4
	.word 0xc937c004  ! 157: STQF_R	-	%f4, [%r4, %r31]
	.word 0xc897e000  ! 158: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r4
	.word 0x8ba00543  ! 159: FSQRTd	fsqrt	
	.word 0x34800001  ! 160: BG	bg,a	<label_0x1>
	.word 0x8d802004  ! 161: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8dd02031  ! 162: Tcc_I	tneg	icc_or_xcc, %r0 + 49
	.word 0x8dd02032  ! 163: Tcc_I	tneg	icc_or_xcc, %r0 + 50
	.word 0x92484007  ! 164: MULX_R	mulx 	%r1, %r7, %r9
	.word 0x26800001  ! 165: BL	bl,a	<label_0x1>
	.word 0x8d90280a  ! 166: WRPR_PSTATE_I	wrpr	%r0, 0x080a, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0xd21fe001  ! 169: LDD_I	ldd	[%r31 + 0x0001], %r9
	.word 0x9cd3e001  ! 170: UMULcc_I	umulcc 	%r15, 0x0001, %r14
	.word 0x95d02031  ! 171: Tcc_I	tg	icc_or_xcc, %r0 + 49
	.word 0x8ad98003  ! 172: SMULcc_R	smulcc 	%r6, %r3, %r5
	.word 0x8f494000  ! 173: RDHPR_HTBA	rdhpr	%htba, %r7
	mov 0x35, %r30
	.word 0x9bd0001e  ! 174: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0xcf97e001  ! 175: LDQFA_I	-	[%r31, 0x0001], %f7
	.word 0xcedfe030  ! 176: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r7
	.word 0x89a209ee  ! 177: FDIVq	dis not found

DS_9:
	.word 0x32800001  ! 179: BNE	bne,a	<label_0x1>
	.word 0xd132a001  ! 179: STQF_I	-	%f8, [0x0001, %r10]
	.word 0x97458000  ! 178: RD_SOFTINT_REG	rd	%softint, %r11
	ta	T_CHANGE_TO_TL1	! macro
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xd73fe001  ! 181: STDF_I	std	%f11, [0x0001, %r31]
	.word 0x99d02033  ! 182: Tcc_I	tgu	icc_or_xcc, %r0 + 51
	.word 0xd73fc00e  ! 183: STDF_R	std	%f11, [%r14, %r31]
	.word 0xd67fe001  ! 184: SWAP_I	swap	%r11, [%r31 + 0x0001]
	.word 0xd727e001  ! 185: STF_I	st	%f11, [0x0001, %r31]
	.word 0x87802016  ! 186: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8d802000  ! 187: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8803e001  ! 188: ADD_I	add 	%r15, 0x0001, %r4
	.word 0x81a00562  ! 189: FSQRTq	fsqrt	
	.word 0x9a486001  ! 190: MULX_I	mulx 	%r1, 0x0001, %r13
DS_10:
	.word 0x22800001  ! 192: BE	be,a	<label_0x1>
	illtrap
	.word 0x9db0c30c  ! 191: ALLIGNADDRESS	alignaddr	%r3, %r12, %r14
	.word 0x87802016  ! 192: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x89a3cdc3  ! 193: FdMULq	fdmulq	
!	.word 0x8bb34fe6  ! 194: FONES	fones	%f5
	.word 0xca07e001  ! 195: LDUW_I	lduw	[%r31 + 0x0001], %r5
DS_11:
	.word 0x20800001  ! 197: BN	bn,a	<label_0x1>
	.word 0xcb32a001  ! 197: STQF_I	-	%f5, [0x0001, %r10]
	.word 0x97458000  ! 196: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0x95d02031  ! 197: Tcc_I	tg	icc_or_xcc, %r0 + 49
	.word 0x8d902097  ! 198: WRPR_PSTATE_I	wrpr	%r0, 0x0097, %pstate
	ta	T_CHANGE_TO_TL1	! macro
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b480000  ! 202: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
	mov 0x33, %r30
	.word 0x97d0001e  ! 203: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	mov 0x30, %r30
	.word 0x81d0001e  ! 204: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	mov 0x31, %r30
	.word 0x9fd0001e  ! 205: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x8d902695  ! 206: WRPR_PSTATE_I	wrpr	%r0, 0x0695, %pstate
	.word 0x85d02031  ! 207: Tcc_I	tle	icc_or_xcc, %r0 + 49
	.word 0x83a01a65  ! 208: FqTOi	fqtoi	
	.word 0xc2dfe010  ! 209: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r1
	.word 0x8d902410  ! 210: WRPR_PSTATE_I	wrpr	%r0, 0x0410, %pstate
	mov 0x32, %r30
	.word 0x95d0001e  ! 211: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x87a0054d  ! 212: FSQRTd	fsqrt	
	.word 0x984ac00b  ! 213: MULX_R	mulx 	%r11, %r11, %r12
	mov 0x34, %r30
	.word 0x81d0001e  ! 214: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x8d902692  ! 215: WRPR_PSTATE_I	wrpr	%r0, 0x0692, %pstate
	.word 0x8351c000  ! 216: RDPR_TL	rdpr	%tl, %r1
	.word 0x36700001  ! 217: BPGE	<illegal instruction>
	.word 0x87d02031  ! 218: Tcc_I	tl	icc_or_xcc, %r0 + 49
	.word 0x88d88003  ! 219: SMULcc_R	smulcc 	%r2, %r3, %r4
	.word 0x8d9024d7  ! 220: WRPR_PSTATE_I	wrpr	%r0, 0x04d7, %pstate
	.word 0xc9e7c023  ! 221: CASA_I	casa	[%r31] 0x 1, %r3, %r4
	.word 0x8d902656  ! 222: WRPR_PSTATE_I	wrpr	%r0, 0x0656, %pstate
	.word 0x8d90265b  ! 223: WRPR_PSTATE_I	wrpr	%r0, 0x065b, %pstate
	.word 0x86c26001  ! 224: ADDCcc_I	addccc 	%r9, 0x0001, %r3
	.word 0x9fa01a66  ! 225: FqTOi	fqtoi	
DS_12:
	.word 0x32800001  ! 227: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x8fb18300  ! 226: ALLIGNADDRESS	alignaddr	%r6, %r0, %r7
	.word 0xcec80e60  ! 227: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r7
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d902a58  ! 229: WRPR_PSTATE_I	wrpr	%r0, 0x0a58, %pstate
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xce57c000  ! 232: LDSH_R	ldsh	[%r31 + %r0], %r7
	mov 0x31, %r30
	.word 0x97d0001e  ! 233: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x97a309e4  ! 234: FDIVq	dis not found

	.word 0x864aa001  ! 235: MULX_I	mulx 	%r10, 0x0001, %r3
	.word 0x8d90241d  ! 236: WRPR_PSTATE_I	wrpr	%r0, 0x041d, %pstate
	.word 0x846a000a  ! 237: UDIVX_R	udivx 	%r8, %r10, %r2
	.word 0x8bd02034  ! 238: Tcc_I	tcs	icc_or_xcc, %r0 + 52
	.word 0x8d802000  ! 239: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87802014  ! 240: WRASI_I	wr	%r0, 0x0014, %asi
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9ac36001  ! 242: ADDCcc_I	addccc 	%r13, 0x0001, %r13
	.word 0x87802045  ! 243: WRASI_I	wr	%r0, 0x0045, %asi
	mov 0x34, %r30
	.word 0x9bd0001e  ! 244: Tcc_R	tcc	icc_or_xcc, %r0 + %r30
	.word 0xdac804a0  ! 245: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r13
	.word 0x24800001  ! 246: BLE	ble,a	<label_0x1>
	.word 0x97a389a2  ! 247: FDIVs	fdivs	%f14, %f2, %f11
	.word 0x8d902695  ! 248: WRPR_PSTATE_I	wrpr	%r0, 0x0695, %pstate
DS_13:
	.word 0x20800001  ! 250: BN	bn,a	<label_0x1>
	.word 0xdd30e001  ! 250: STQF_I	-	%f14, [0x0001, %r3]
	.word 0x97458000  ! 249: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0x87802080  ! 250: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x81a309ce  ! 251: FDIVd	fdivd	%f12, %f14, %f0
DS_14:
	.word 0x32800001  ! 253: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x99b2c301  ! 252: ALLIGNADDRESS	alignaddr	%r11, %r1, %r12
	.word 0x8d902419  ! 253: WRPR_PSTATE_I	wrpr	%r0, 0x0419, %pstate
	.word 0x97504000  ! 254: RDPR_TNPC	rdpr	%tnpc, %r11
	.word 0x8c482001  ! 255: MULX_I	mulx 	%r0, 0x0001, %r6
	.word 0x984a400c  ! 256: MULX_R	mulx 	%r9, %r12, %r12
	.word 0x944a0003  ! 257: MULX_R	mulx 	%r8, %r3, %r10
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87a00547  ! 259: FSQRTd	fsqrt	
	.word 0xc6d004a0  ! 260: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r3
	.word 0x95a289ee  ! 261: FDIVq	dis not found

	.word 0x82c3a001  ! 262: ADDCcc_I	addccc 	%r14, 0x0001, %r1
	.word 0x38700001  ! 263: BPGU	<illegal instruction>
	.word 0xc237c00e  ! 264: STH_R	sth	%r1, [%r31 + %r14]
	.word 0x8d902a50  ! 265: WRPR_PSTATE_I	wrpr	%r0, 0x0a50, %pstate
	.word 0x896a400f  ! 266: SDIVX_R	sdivx	%r9, %r15, %r4
!	.word 0x91b10fe7  ! 267: FONES	fones	%f8
	.word 0x8649400c  ! 268: MULX_R	mulx 	%r5, %r12, %r3
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x34800001  ! 271: BG	bg,a	<label_0x1>
	mov 0x30, %r30
	.word 0x91d0001e  ! 272: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_15:
	.word 0x20800001  ! 274: BN	bn,a	<label_0x1>
	.word 0xd530e001  ! 274: STQF_I	-	%f10, [0x0001, %r3]
	.word 0x91458000  ! 273: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x8d902a49  ! 274: WRPR_PSTATE_I	wrpr	%r0, 0x0a49, %pstate
	.word 0x9a802001  ! 275: ADDcc_I	addcc 	%r0, 0x0001, %r13
	.word 0x84496001  ! 276: MULX_I	mulx 	%r5, 0x0001, %r2
	.word 0x8d802004  ! 277: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x926b2001  ! 278: UDIVX_I	udivx 	%r12, 0x0001, %r9
	.word 0x8d90205b  ! 279: WRPR_PSTATE_I	wrpr	%r0, 0x005b, %pstate
	.word 0xd28fe020  ! 280: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r9
	.word 0x83a1c9c1  ! 281: FDIVd	fdivd	%f38, %f32, %f32
	.word 0xc247e001  ! 282: LDSW_I	ldsw	[%r31 + 0x0001], %r1
	.word 0xc317c000  ! 283: LDQF_R	-	[%r31, %r0], %f1
	.word 0x8d802000  ! 284: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_PRIV	! macro
	.word 0x91a189c5  ! 286: FDIVd	fdivd	%f6, %f36, %f8
	.word 0x996b8005  ! 287: SDIVX_R	sdivx	%r14, %r5, %r12
	.word 0xd81fc000  ! 288: LDD_R	ldd	[%r31 + %r0], %r12
	.word 0xd8d004a0  ! 289: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r12
DS_16:
	.word 0x32800001  ! 291: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x8fb04302  ! 290: ALLIGNADDRESS	alignaddr	%r1, %r2, %r7
	.word 0x8d802004  ! 291: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x9a03a001  ! 292: ADD_I	add 	%r14, 0x0001, %r13
	.word 0x8d90225d  ! 293: WRPR_PSTATE_I	wrpr	%r0, 0x025d, %pstate
	.word 0x8d9022c7  ! 294: WRPR_PSTATE_I	wrpr	%r0, 0x02c7, %pstate
	.word 0xda7fe001  ! 295: SWAP_I	swap	%r13, [%r31 + 0x0001]
	.word 0x8d90204e  ! 296: WRPR_PSTATE_I	wrpr	%r0, 0x004e, %pstate
	.word 0xda97e030  ! 297: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r13
	.word 0x8d902c14  ! 298: WRPR_PSTATE_I	wrpr	%r0, 0x0c14, %pstate
	.word 0x95a28dc1  ! 299: FdMULq	fdmulq	
	.word 0x9069e001  ! 300: UDIVX_I	udivx 	%r7, 0x0001, %r8
	.word 0x93a01a65  ! 301: FqTOi	fqtoi	
	.word 0x8d902619  ! 302: WRPR_PSTATE_I	wrpr	%r0, 0x0619, %pstate
	.word 0x83a000c2  ! 303: FNEGd	fnegd	%f2, %f32
	.word 0x8d9022d8  ! 304: WRPR_PSTATE_I	wrpr	%r0, 0x02d8, %pstate
	.word 0x8d902c5a  ! 305: WRPR_PSTATE_I	wrpr	%r0, 0x0c5a, %pstate
	.word 0xc337e001  ! 306: STQF_I	-	%f1, [0x0001, %r31]
	.word 0x9b6be001  ! 307: SDIVX_I	sdivx	%r15, 0x0001, %r13
DS_17:
	.word 0x34800001  ! 309: BG	bg,a	<label_0x1>
	.word 0xd333e001  ! 309: STQF_I	-	%f9, [0x0001, %r15]
	.word 0x95458000  ! 308: RD_SOFTINT_REG	rd	%softint, %r10
	mov 0x34, %r30
	.word 0x93d0001e  ! 309: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8da2c9c9  ! 310: FDIVd	fdivd	%f42, %f40, %f6
	.word 0xccd004a0  ! 311: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r6
	.word 0x91480000  ! 312: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
DS_18:
	.word 0x34800001  ! 314: BG	bg,a	<label_0x1>
	.word 0xc333a001  ! 314: STQF_I	-	%f1, [0x0001, %r14]
	.word 0x87458000  ! 313: RD_SOFTINT_REG	rd	%softint, %r3
	.word 0xc7e7c029  ! 314: CASA_I	casa	[%r31] 0x 1, %r9, %r3
	.word 0x98c16001  ! 315: ADDCcc_I	addccc 	%r5, 0x0001, %r12
	.word 0x99a000c7  ! 316: FNEGd	fnegd	%f38, %f12
	.word 0x8ed3800e  ! 317: UMULcc_R	umulcc 	%r14, %r14, %r7
	.word 0xce0fc000  ! 318: LDUB_R	ldub	[%r31 + %r0], %r7
	.word 0x9fa109ec  ! 319: FDIVq	dis not found

	.word 0x91d02030  ! 320: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xde47c000  ! 321: LDSW_R	ldsw	[%r31 + %r0], %r15
	.word 0xde47e001  ! 322: LDSW_I	ldsw	[%r31 + 0x0001], %r15
	.word 0x9882e001  ! 323: ADDcc_I	addcc 	%r11, 0x0001, %r12
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8d902883  ! 325: WRPR_PSTATE_I	wrpr	%r0, 0x0883, %pstate
	.word 0x986ae001  ! 326: UDIVX_I	udivx 	%r11, 0x0001, %r12
	.word 0x90496001  ! 327: MULX_I	mulx 	%r5, 0x0001, %r8
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd0ffc02c  ! 329: SWAPA_R	swapa	%r8, [%r31 + %r12] 0x01
	.word 0xd0c004a0  ! 330: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r8
	.word 0x94d0000e  ! 331: UMULcc_R	umulcc 	%r0, %r14, %r10
	.word 0x95a049c3  ! 332: FDIVd	fdivd	%f32, %f34, %f10
	.word 0x91d02035  ! 333: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xd48fe030  ! 334: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r10
	.word 0x93a0056d  ! 335: FSQRTq	fsqrt	
	.word 0xd327e001  ! 336: STF_I	st	%f9, [0x0001, %r31]
	.word 0xd22fe001  ! 337: STB_I	stb	%r9, [%r31 + 0x0001]
	.word 0x9bd02034  ! 338: Tcc_I	tcc	icc_or_xcc, %r0 + 52
	.word 0xd27fe001  ! 339: SWAP_I	swap	%r9, [%r31 + 0x0001]
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x81508000  ! 341: RDPR_TSTATE	rdpr	%tstate, %r0
	.word 0x97500000  ! 342: RDPR_TPC	rdpr	%tpc, %r11
	.word 0x87a000c7  ! 343: FNEGd	fnegd	%f38, %f34
	.word 0x81a289cf  ! 344: FDIVd	fdivd	%f10, %f46, %f0
	.word 0x88c22001  ! 345: ADDCcc_I	addccc 	%r8, 0x0001, %r4
	.word 0x8a486001  ! 346: MULX_I	mulx 	%r1, 0x0001, %r5
	mov 0x33, %r30
	.word 0x93d0001e  ! 347: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8da109e5  ! 348: FDIVq	dis not found

	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d902441  ! 350: WRPR_PSTATE_I	wrpr	%r0, 0x0441, %pstate
	.word 0x8fa0cd2c  ! 351: FsMULd	fsmuld	%f3, %f12, %f38
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8d9024dd  ! 353: WRPR_PSTATE_I	wrpr	%r0, 0x04dd, %pstate
	mov 0x33, %r30
	.word 0x97d0001e  ! 354: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x8fd02033  ! 355: Tcc_I	tvs	icc_or_xcc, %r0 + 51
	ta	T_CHANGE_PRIV	! macro
	.word 0xce9fe001  ! 357: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r7
	.word 0xcec004a0  ! 358: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r7
	.word 0xcf27c00c  ! 359: STF_R	st	%f7, [%r12, %r31]
	.word 0x8d902895  ! 360: WRPR_PSTATE_I	wrpr	%r0, 0x0895, %pstate
DS_19:
	.word 0x32800001  ! 362: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x81b34300  ! 361: ALLIGNADDRESS	alignaddr	%r13, %r0, %r0
	.word 0x9f508000  ! 362: RDPR_TSTATE	rdpr	%tstate, %r15
	.word 0x87802010  ! 363: WRASI_I	wr	%r0, 0x0010, %asi
	mov 0x31, %r30
	.word 0x97d0001e  ! 364: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x87802080  ! 365: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x8d902858  ! 366: WRPR_PSTATE_I	wrpr	%r0, 0x0858, %pstate
	.word 0x86496001  ! 367: MULX_I	mulx 	%r5, 0x0001, %r3
	.word 0x2c700001  ! 368: BPNEG	<illegal instruction>
	.word 0x95a109a8  ! 369: FDIVs	fdivs	%f4, %f8, %f10
	.word 0xd527c008  ! 370: STF_R	st	%f10, [%r8, %r31]
	.word 0x26800001  ! 371: BL	bl,a	<label_0x1>
	.word 0x8bd02032  ! 372: Tcc_I	tcs	icc_or_xcc, %r0 + 50
	.word 0x9350c000  ! 373: RDPR_TT	rdpr	%tt, %r9
DS_20:
	.word 0x20800001  ! 375: BN	bn,a	<label_0x1>
	.word 0xc330a001  ! 375: STQF_I	-	%f1, [0x0001, %r2]
	.word 0x8d458000  ! 374: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0x9c4a8001  ! 375: MULX_R	mulx 	%r10, %r1, %r14
DS_21:
	.word 0x20800001  ! 377: BN	bn,a	<label_0x1>
	.word 0xdb330008  ! 377: STQF_R	-	%f13, [%r8, %r12]
	.word 0x97458000  ! 376: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0xd62fc008  ! 377: STB_R	stb	%r11, [%r31 + %r8]
DS_22:
	.word 0x32800001  ! 379: BNE	bne,a	<label_0x1>
	.word 0xdd300001  ! 379: STQF_R	-	%f14, [%r1, %r0]
	.word 0x9b458000  ! 378: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x8d9024d1  ! 379: WRPR_PSTATE_I	wrpr	%r0, 0x04d1, %pstate
	.word 0x84db4005  ! 380: SMULcc_R	smulcc 	%r13, %r5, %r2
	mov 0x32, %r30
	.word 0x8fd0001e  ! 381: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x88c2a001  ! 382: ADDCcc_I	addccc 	%r10, 0x0001, %r4
!	.word 0x85b30fef  ! 383: FONES	fones	%f2
	.word 0xc5e7c02f  ! 384: CASA_I	casa	[%r31] 0x 1, %r15, %r2
	.word 0x8d902a1e  ! 385: WRPR_PSTATE_I	wrpr	%r0, 0x0a1e, %pstate
	.word 0x87802054  ! 386: WRASI_I	wr	%r0, 0x0054, %asi
	.word 0x8d902e5f  ! 387: WRPR_PSTATE_I	wrpr	%r0, 0x0e5f, %pstate
	.word 0x8d902ac0  ! 388: WRPR_PSTATE_I	wrpr	%r0, 0x0ac0, %pstate
	.word 0x8d902aca  ! 389: WRPR_PSTATE_I	wrpr	%r0, 0x0aca, %pstate
	.word 0x924ac00c  ! 390: MULX_R	mulx 	%r11, %r12, %r9
	.word 0x8ba000cc  ! 391: FNEGd	fnegd	%f12, %f36
	.word 0x91a000cb  ! 392: FNEGd	fnegd	%f42, %f8
	.word 0x89d02032  ! 393: Tcc_I	tleu	icc_or_xcc, %r0 + 50
	.word 0x93d02035  ! 394: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x8569c004  ! 395: SDIVX_R	sdivx	%r7, %r4, %r2
	.word 0xc4900e80  ! 396: LDUHA_R	lduha	[%r0, %r0] 0x74, %r2
	.word 0x8d902cd0  ! 397: WRPR_PSTATE_I	wrpr	%r0, 0x0cd0, %pstate
DS_23:
	.word 0x32800001  ! 399: BNE	bne,a	<label_0x1>
	.word 0xcb30e001  ! 399: STQF_I	-	%f5, [0x0001, %r3]
	.word 0x99458000  ! 398: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0xd81fc000  ! 399: LDD_R	ldd	[%r31 + %r0], %r12
	.word 0xd927c004  ! 400: STF_R	st	%f12, [%r4, %r31]
DS_24:
	.word 0x34800001  ! 402: BG	bg,a	<label_0x1>
	illtrap
	.word 0x9db1030b  ! 401: ALLIGNADDRESS	alignaddr	%r4, %r11, %r14
	.word 0x87802054  ! 402: WRASI_I	wr	%r0, 0x0054, %asi
	.word 0x3a700001  ! 403: BPCC	<illegal instruction>
DS_25:
	.word 0x20800001  ! 405: BN	bn,a	<label_0x1>
	.word 0xdd33c000  ! 405: STQF_R	-	%f14, [%r0, %r15]
	.word 0x9f458000  ! 404: RD_SOFTINT_REG	rd	%softint, %r15
	ta	T_CHANGE_PRIV	! macro
	.word 0x38700001  ! 406: BPGU	<illegal instruction>
	.word 0x9d6b0001  ! 407: SDIVX_R	sdivx	%r12, %r1, %r14
DS_26:
	.word 0x22800001  ! 409: BE	be,a	<label_0x1>
	illtrap
	.word 0x87b2c30f  ! 408: ALLIGNADDRESS	alignaddr	%r11, %r15, %r3
DS_27:
	.word 0x22800001  ! 410: BE	be,a	<label_0x1>
	illtrap
	.word 0x95b20305  ! 409: ALLIGNADDRESS	alignaddr	%r8, %r5, %r10
	.word 0x9a69c000  ! 410: UDIVX_R	udivx 	%r7, %r0, %r13
!	.word 0x9bb2cfef  ! 411: FONES	fones	%f13
	mov 0x30, %r30
	.word 0x89d0001e  ! 412: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x8ba309a2  ! 413: FDIVs	fdivs	%f12, %f2, %f5
	.word 0xcabfe001  ! 414: STDA_I	stda	%r5, [%r31 + 0x0001] %asi
DS_28:
	.word 0x22800001  ! 416: BE	be,a	<label_0x1>
	.word 0xdb33e001  ! 416: STQF_I	-	%f13, [0x0001, %r15]
	.word 0x97458000  ! 415: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0x8f686001  ! 416: SDIVX_I	sdivx	%r1, 0x0001, %r7
	.word 0xced004a0  ! 417: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r7
	.word 0xce7fe001  ! 418: SWAP_I	swap	%r7, [%r31 + 0x0001]
	mov 0x33, %r30
	.word 0x91d0001e  ! 419: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x85d02032  ! 420: Tcc_I	tle	icc_or_xcc, %r0 + 50
	.word 0x8b696001  ! 421: SDIVX_I	sdivx	%r5, 0x0001, %r5
	.word 0xca27c002  ! 422: STW_R	stw	%r5, [%r31 + %r2]
	.word 0x8400e001  ! 423: ADD_I	add 	%r3, 0x0001, %r2
	.word 0x30800001  ! 424: BA	ba,a	<label_0x1>
	.word 0x91d02033  ! 425: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x99d02033  ! 426: Tcc_I	tgu	icc_or_xcc, %r0 + 51
	.word 0xc4cfe000  ! 427: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r2
	.word 0xc4bfc022  ! 428: STDA_R	stda	%r2, [%r31 + %r2] 0x01
DS_29:
	.word 0x22800001  ! 430: BE	be,a	<label_0x1>
	.word 0xc5316001  ! 430: STQF_I	-	%f2, [0x0001, %r5]
	.word 0x91458000  ! 429: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x8d902699  ! 430: WRPR_PSTATE_I	wrpr	%r0, 0x0699, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d802000  ! 432: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d90245d  ! 433: WRPR_PSTATE_I	wrpr	%r0, 0x045d, %pstate
	.word 0x8d902242  ! 434: WRPR_PSTATE_I	wrpr	%r0, 0x0242, %pstate
	.word 0x8d802000  ! 435: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d90284f  ! 436: WRPR_PSTATE_I	wrpr	%r0, 0x084f, %pstate
	.word 0x9fa00569  ! 437: FSQRTq	fsqrt	
DS_30:
	.word 0x32800001  ! 439: BNE	bne,a	<label_0x1>
	.word 0xcb33a001  ! 439: STQF_I	-	%f5, [0x0001, %r14]
	.word 0x8f458000  ! 438: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0x884a6001  ! 439: MULX_I	mulx 	%r9, 0x0001, %r4
	.word 0x83a1cdce  ! 440: FdMULq	fdmulq	
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	mov 0x30, %r30
	.word 0x81d0001e  ! 443: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x91d02035  ! 444: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8d902a91  ! 445: WRPR_PSTATE_I	wrpr	%r0, 0x0a91, %pstate
	.word 0x98830005  ! 446: ADDcc_R	addcc 	%r12, %r5, %r12
	.word 0x91d02032  ! 447: Tcc_I	ta	icc_or_xcc, %r0 + 50
DS_31:
	.word 0x22800001  ! 449: BE	be,a	<label_0x1>
	.word 0xdb33e001  ! 449: STQF_I	-	%f13, [0x0001, %r15]
	.word 0x97458000  ! 448: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0x8fa009cf  ! 449: FDIVd	fdivd	%f0, %f46, %f38
DS_32:
	.word 0x32800001  ! 451: BNE	bne,a	<label_0x1>
	.word 0xc532c00e  ! 451: STQF_R	-	%f2, [%r14, %r11]
	.word 0x91458000  ! 450: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0xd127e001  ! 451: STF_I	st	%f8, [0x0001, %r31]
	.word 0xd057c000  ! 452: LDSH_R	ldsh	[%r31 + %r0], %r8
	.word 0x87802080  ! 453: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xd137c00e  ! 454: STQF_R	-	%f8, [%r14, %r31]
	.word 0x8c682001  ! 455: UDIVX_I	udivx 	%r0, 0x0001, %r6
	.word 0x8d90225f  ! 456: WRPR_PSTATE_I	wrpr	%r0, 0x025f, %pstate
	.word 0xcd37e001  ! 457: STQF_I	-	%f6, [0x0001, %r31]
	.word 0xcc8004a0  ! 458: LDUWA_R	lduwa	[%r0, %r0] 0x25, %r6
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a289a3  ! 461: FDIVs	fdivs	%f10, %f3, %f11
	.word 0xd6ffc023  ! 462: SWAPA_R	swapa	%r11, [%r31 + %r3] 0x01
	.word 0x87802088  ! 463: WRASI_I	wr	%r0, 0x0088, %asi
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d802004  ! 465: WRFPRS_I	wr	%r0, 0x0004, %fprs
DS_33:
	.word 0x34800001  ! 467: BG	bg,a	<label_0x1>
	.word 0xcd30c001  ! 467: STQF_R	-	%f6, [%r1, %r3]
	.word 0x81458000  ! 466: RD_SOFTINT_REG	stbar
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8bd02030  ! 468: Tcc_I	tcs	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_NONHPRIV	! macro
DS_34:
	.word 0x34800001  ! 471: BG	bg,a	<label_0x1>
	illtrap
	.word 0x89b30302  ! 470: ALLIGNADDRESS	alignaddr	%r12, %r2, %r4
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d9020ce  ! 472: WRPR_PSTATE_I	wrpr	%r0, 0x00ce, %pstate
	.word 0x9fa0056f  ! 473: FSQRTq	fsqrt	
	.word 0x87802088  ! 474: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x88818008  ! 475: ADDcc_R	addcc 	%r6, %r8, %r4
	.word 0x26800001  ! 476: BL	bl,a	<label_0x1>
	.word 0x9da109a1  ! 477: FDIVs	fdivs	%f4, %f1, %f14
	.word 0x81a00541  ! 478: FSQRTd	fsqrt	
DS_35:
	.word 0x32800001  ! 480: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x83b0030f  ! 479: ALLIGNADDRESS	alignaddr	%r0, %r15, %r1
	.word 0x87802004  ! 480: WRASI_I	wr	%r0, 0x0004, %asi
	mov 0x35, %r30
	.word 0x97d0001e  ! 481: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x32800001  ! 483: BNE	bne,a	<label_0x1>
	.word 0xc33fe001  ! 484: STDF_I	std	%f1, [0x0001, %r31]
	.word 0x9f480000  ! 485: RDHPR_HPSTATE	rdhpr	%hpstate, %r15
	.word 0x87802088  ! 486: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x95a3cd21  ! 487: FsMULd	fsmuld	%f15, %f32, %f10
	.word 0x87802080  ! 488: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xd45fc000  ! 489: LDX_R	ldx	[%r31 + %r0], %r10
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd4ffc021  ! 491: SWAPA_R	swapa	%r10, [%r31 + %r1] 0x01
	.word 0x8d90289c  ! 492: WRPR_PSTATE_I	wrpr	%r0, 0x089c, %pstate
	.word 0xd48804a0  ! 493: LDUBA_R	lduba	[%r0, %r0] 0x25, %r10
	.word 0xd5e7c021  ! 494: CASA_I	casa	[%r31] 0x 1, %r1, %r10
	ta	T_CHANGE_TO_TL1	! macro
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xd42fe001  ! 497: STB_I	stb	%r10, [%r31 + 0x0001]
	.word 0x9e03e001  ! 498: ADD_I	add 	%r15, 0x0001, %r15
	.word 0x926a2001  ! 499: UDIVX_I	udivx 	%r8, 0x0001, %r9
	mov 0x30, %r30
	.word 0x93d0001e  ! 500: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8dd02030  ! 501: Tcc_I	tneg	icc_or_xcc, %r0 + 48
	.word 0x8351c000  ! 502: RDPR_TL	rdpr	%tl, %r1
	.word 0xc2cfe020  ! 503: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r1
	.word 0x8d902c95  ! 504: WRPR_PSTATE_I	wrpr	%r0, 0x0c95, %pstate
DS_36:
	.word 0x20800001  ! 506: BN	bn,a	<label_0x1>
	.word 0xd9330001  ! 506: STQF_R	-	%f12, [%r1, %r12]
	.word 0x8b458000  ! 505: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0x8d902087  ! 506: WRPR_PSTATE_I	wrpr	%r0, 0x0087, %pstate
	.word 0x2a800001  ! 507: BCS	bcs,a	<label_0x1>
	.word 0xcad7e030  ! 508: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r5
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d902240  ! 510: WRPR_PSTATE_I	wrpr	%r0, 0x0240, %pstate
	.word 0xca5fc000  ! 511: LDX_R	ldx	[%r31 + %r0], %r5
	.word 0x95a00560  ! 512: FSQRTq	fsqrt	
	.word 0x8d802004  ! 513: WRFPRS_I	wr	%r0, 0x0004, %fprs
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd47fe001  ! 515: SWAP_I	swap	%r10, [%r31 + 0x0001]
	.word 0x8d802000  ! 516: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x38700001  ! 517: BPGU	<illegal instruction>
	.word 0x2a700001  ! 518: BPCS	<illegal instruction>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x26800001  ! 520: BL	bl,a	<label_0x1>
	.word 0x28800001  ! 521: BLEU	bleu,a	<label_0x1>
	.word 0x8a7a8001  ! 522: SDIV_R	sdiv 	%r10, %r1, %r5
	.word 0x98488004  ! 523: MULX_R	mulx 	%r2, %r4, %r12
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d802000  ! 525: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d9020cf  ! 526: WRPR_PSTATE_I	wrpr	%r0, 0x00cf, %pstate
	.word 0x8d9028d4  ! 527: WRPR_PSTATE_I	wrpr	%r0, 0x08d4, %pstate
	.word 0x3a800001  ! 528: BCC	bcc,a	<label_0x1>
	.word 0xd8bfe001  ! 529: STDA_I	stda	%r12, [%r31 + 0x0001] %asi
	.word 0x8d9020ca  ! 530: WRPR_PSTATE_I	wrpr	%r0, 0x00ca, %pstate
	.word 0x9d480000  ! 531: RDHPR_HPSTATE	rdhpr	%hpstate, %r14
	.word 0x8e826001  ! 532: ADDcc_I	addcc 	%r9, 0x0001, %r7
	.word 0x9bd02034  ! 533: Tcc_I	tcc	icc_or_xcc, %r0 + 52
	.word 0x8d802004  ! 534: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x3e700001  ! 535: BPVC	<illegal instruction>
	ta	T_CHANGE_TO_TL0	! macro
	mov 0x34, %r30
	.word 0x97d0001e  ! 537: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x9edbc005  ! 538: SMULcc_R	smulcc 	%r15, %r5, %r15
DS_37:
	.word 0x22800001  ! 540: BE	be,a	<label_0x1>
	.word 0xd931a001  ! 540: STQF_I	-	%f12, [0x0001, %r6]
	.word 0x8b458000  ! 539: RD_SOFTINT_REG	rd	%softint, %r5
	mov 0x33, %r30
	.word 0x99d0001e  ! 540: Tcc_R	tgu	icc_or_xcc, %r0 + %r30
	.word 0x8d902618  ! 541: WRPR_PSTATE_I	wrpr	%r0, 0x0618, %pstate
	.word 0x30700001  ! 542: BPA	<illegal instruction>
DS_38:
	.word 0x34800001  ! 544: BG	bg,a	<label_0x1>
	.word 0xd333a001  ! 544: STQF_I	-	%f9, [0x0001, %r14]
	.word 0x9d458000  ! 543: RD_SOFTINT_REG	rd	%softint, %r14
	.word 0xdcd00e60  ! 544: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r14
	.word 0x8e82a001  ! 545: ADDcc_I	addcc 	%r10, 0x0001, %r7
	.word 0x8d802000  ! 546: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d902810  ! 547: WRPR_PSTATE_I	wrpr	%r0, 0x0810, %pstate
	mov 0x31, %r30
	.word 0x81d0001e  ! 548: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x99508000  ! 549: RDPR_TSTATE	rdpr	%tstate, %r12
	.word 0x8a482001  ! 550: MULX_I	mulx 	%r0, 0x0001, %r5
	.word 0x9dd02035  ! 551: Tcc_I	tpos	icc_or_xcc, %r0 + 53
	.word 0x99a00dc1  ! 552: FdMULq	fdmulq	
	.word 0x81494000  ! 553: RDHPR_HTBA	rdhpr	%htba, %r0
	.word 0x8d9026d9  ! 554: WRPR_PSTATE_I	wrpr	%r0, 0x06d9, %pstate
	mov 0x32, %r30
	.word 0x9dd0001e  ! 555: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x8d902a52  ! 556: WRPR_PSTATE_I	wrpr	%r0, 0x0a52, %pstate
	.word 0x91a20dc7  ! 557: FdMULq	fdmulq	
	.word 0x8d902a93  ! 558: WRPR_PSTATE_I	wrpr	%r0, 0x0a93, %pstate
	.word 0x8fa000c4  ! 559: FNEGd	fnegd	%f4, %f38
	mov 0x33, %r30
	.word 0x9fd0001e  ! 560: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x8a80e001  ! 561: ADDcc_I	addcc 	%r3, 0x0001, %r5
	ta	T_CHANGE_TO_TL1	! macro
DS_39:
	.word 0x22800001  ! 564: BE	be,a	<label_0x1>
	illtrap
	.word 0x95b38301  ! 563: ALLIGNADDRESS	alignaddr	%r14, %r1, %r10
	.word 0x22700001  ! 564: BPE	<illegal instruction>
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87a01a67  ! 567: FqTOi	fqtoi	
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x89686001  ! 569: SDIVX_I	sdivx	%r1, 0x0001, %r4
	mov 0x30, %r30
	.word 0x9fd0001e  ! 570: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0xc88004a0  ! 571: LDUWA_R	lduwa	[%r0, %r0] 0x25, %r4
	.word 0x8d9022d2  ! 572: WRPR_PSTATE_I	wrpr	%r0, 0x02d2, %pstate
	.word 0x86d90008  ! 573: SMULcc_R	smulcc 	%r4, %r8, %r3
	.word 0x8481a001  ! 574: ADDcc_I	addcc 	%r6, 0x0001, %r2
	.word 0x91d02034  ! 575: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x9068e001  ! 576: UDIVX_I	udivx 	%r3, 0x0001, %r8
	.word 0xd037c008  ! 577: STH_R	sth	%r8, [%r31 + %r8]
	.word 0x8950c000  ! 578: RDPR_TT	rdpr	%tt, %r4
	.word 0x8d802004  ! 579: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d802000  ! 580: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d902e4e  ! 581: WRPR_PSTATE_I	wrpr	%r0, 0x0e4e, %pstate
	.word 0x9dd02034  ! 582: Tcc_I	tpos	icc_or_xcc, %r0 + 52
	.word 0x93a00566  ! 583: FSQRTq	fsqrt	
	.word 0x85d02030  ! 584: Tcc_I	tle	icc_or_xcc, %r0 + 48
	.word 0x976ae001  ! 585: SDIVX_I	sdivx	%r11, 0x0001, %r11
	.word 0x98d36001  ! 586: UMULcc_I	umulcc 	%r13, 0x0001, %r12
	.word 0x8d902edd  ! 587: WRPR_PSTATE_I	wrpr	%r0, 0x0edd, %pstate
	.word 0x8d902c80  ! 588: WRPR_PSTATE_I	wrpr	%r0, 0x0c80, %pstate
	mov 0x35, %r30
	.word 0x91d0001e  ! 589: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802004  ! 590: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x91a049c6  ! 591: FDIVd	fdivd	%f32, %f6, %f8
	.word 0x9fd02032  ! 592: Tcc_I	tvc	icc_or_xcc, %r0 + 50
	.word 0x9ba000cc  ! 593: FNEGd	fnegd	%f12, %f44
	.word 0x91d02030  ! 594: Tcc_I	ta	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_NONPRIV	! macro
	mov 0x34, %r30
	.word 0x81d0001e  ! 596: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
DS_40:
	.word 0x32800001  ! 599: BNE	bne,a	<label_0x1>
	.word 0xd1332001  ! 599: STQF_I	-	%f8, [0x0001, %r12]
	.word 0x89458000  ! 598: RD_SOFTINT_REG	rd	%softint, %r4
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc817c000  ! 600: LDUH_R	lduh	[%r31 + %r0], %r4
	.word 0x864a2001  ! 601: MULX_I	mulx 	%r8, 0x0001, %r3
	.word 0x2e800001  ! 602: BVS	bvs,a	<label_0x1>
	.word 0x856ba001  ! 603: SDIVX_I	sdivx	%r14, 0x0001, %r2
	.word 0x9dd02031  ! 604: Tcc_I	tpos	icc_or_xcc, %r0 + 49
	.word 0xc4cfe020  ! 605: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r2
	.word 0xc437c00c  ! 606: STH_R	sth	%r2, [%r31 + %r12]
	.word 0x8d90249d  ! 607: WRPR_PSTATE_I	wrpr	%r0, 0x049d, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d902cd0  ! 609: WRPR_PSTATE_I	wrpr	%r0, 0x0cd0, %pstate
	.word 0xc487e010  ! 610: LDUWA_I	lduwa	[%r31, + 0x0010] %asi, %r2
	.word 0xc49fe001  ! 611: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r2
!	.word 0x85b14fe6  ! 612: FONES	fones	%f2
	.word 0x8d902287  ! 613: WRPR_PSTATE_I	wrpr	%r0, 0x0287, %pstate
	.word 0x24800001  ! 614: BLE	ble,a	<label_0x1>
	.word 0x8d902450  ! 615: WRPR_PSTATE_I	wrpr	%r0, 0x0450, %pstate
	.word 0xc597e001  ! 616: LDQFA_I	-	[%r31, 0x0001], %f2
	.word 0xc4ffc026  ! 617: SWAPA_R	swapa	%r2, [%r31 + %r6] 0x01
	.word 0x8600e001  ! 618: ADD_I	add 	%r3, 0x0001, %r3
	ta	T_CHANGE_PRIV	! macro
	.word 0xc6c7e010  ! 620: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r3
	.word 0xc69004a0  ! 621: LDUHA_R	lduha	[%r0, %r0] 0x25, %r3
	.word 0xc737e001  ! 622: STQF_I	-	%f3, [0x0001, %r31]
	.word 0x91a0056b  ! 623: FSQRTq	fsqrt	
	.word 0x83a01a69  ! 624: FqTOi	fqtoi	
	.word 0x9fa00540  ! 625: FSQRTd	fsqrt	
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d9026d9  ! 627: WRPR_PSTATE_I	wrpr	%r0, 0x06d9, %pstate
	.word 0xdec7e020  ! 628: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r15
	.word 0x8d90204c  ! 629: WRPR_PSTATE_I	wrpr	%r0, 0x004c, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x87802088  ! 631: WRASI_I	wr	%r0, 0x0088, %asi
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8f500000  ! 633: RDPR_TPC	rdpr	%tpc, %r7
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902ac3  ! 635: WRPR_PSTATE_I	wrpr	%r0, 0x0ac3, %pstate
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0x20700001  ! 639: BPN	<illegal instruction>
	.word 0xce9fe001  ! 640: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r7
DS_41:
	.word 0x20800001  ! 642: BN	bn,a	<label_0x1>
	.word 0xd932400d  ! 642: STQF_R	-	%f12, [%r13, %r9]
	.word 0x9f458000  ! 641: RD_SOFTINT_REG	rd	%softint, %r15
	.word 0x8d902045  ! 642: WRPR_PSTATE_I	wrpr	%r0, 0x0045, %pstate
	.word 0x8d68400f  ! 643: SDIVX_R	sdivx	%r1, %r15, %r6
DS_42:
	.word 0x32800001  ! 645: BNE	bne,a	<label_0x1>
	.word 0xd132a001  ! 645: STQF_I	-	%f8, [0x0001, %r10]
	.word 0x95458000  ! 644: RD_SOFTINT_REG	rd	%softint, %r10
	ta	T_CHANGE_HPRIV	! macro
	.word 0x986ac002  ! 646: UDIVX_R	udivx 	%r11, %r2, %r12
	.word 0x8150c000  ! 647: RDPR_TT	rdpr	%tt, %r0
	.word 0xc13fc002  ! 648: STDF_R	std	%f0, [%r2, %r31]
	.word 0x8d902497  ! 649: WRPR_PSTATE_I	wrpr	%r0, 0x0497, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x84696001  ! 651: UDIVX_I	udivx 	%r5, 0x0001, %r2
DS_43:
	.word 0x22800001  ! 653: BE	be,a	<label_0x1>
	illtrap
	.word 0x81b20309  ! 652: ALLIGNADDRESS	alignaddr	%r8, %r9, %r0
	mov 0x35, %r30
	.word 0x95d0001e  ! 653: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0xc09fc020  ! 654: LDDA_R	ldda	[%r31, %r0] 0x01, %r0
	.word 0x8d802004  ! 655: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x92db4001  ! 656: SMULcc_R	smulcc 	%r13, %r1, %r9
	.word 0x84524003  ! 657: UMUL_R	umul 	%r9, %r3, %r2
	mov 0x30, %r30
	.word 0x8bd0001e  ! 658: Tcc_R	tcs	icc_or_xcc, %r0 + %r30
	.word 0x89d02034  ! 659: Tcc_I	tleu	icc_or_xcc, %r0 + 52
	.word 0x8d902e15  ! 660: WRPR_PSTATE_I	wrpr	%r0, 0x0e15, %pstate
	.word 0x8d902696  ! 661: WRPR_PSTATE_I	wrpr	%r0, 0x0696, %pstate
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc4c004a0  ! 664: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r2
DS_44:
	.word 0x22800001  ! 666: BE	be,a	<label_0x1>
	illtrap
	.word 0x99b3c30d  ! 665: ALLIGNADDRESS	alignaddr	%r15, %r13, %r12
	.word 0x9bd02033  ! 666: Tcc_I	tcc	icc_or_xcc, %r0 + 51
	.word 0x83d02032  ! 667: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0xd887e020  ! 668: LDUWA_I	lduwa	[%r31, + 0x0020] %asi, %r12
	.word 0x87d02030  ! 669: Tcc_I	tl	icc_or_xcc, %r0 + 48
	.word 0x99a24d29  ! 670: FsMULd	fsmuld	%f9, %f40, %f12
	.word 0x8d9022d6  ! 671: WRPR_PSTATE_I	wrpr	%r0, 0x02d6, %pstate
	.word 0x9849400b  ! 672: MULX_R	mulx 	%r5, %r11, %r12
	.word 0xd8d804a0  ! 673: LDXA_R	ldxa	[%r0, %r0] 0x25, %r12
	.word 0xd8cfe000  ! 674: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r12
	.word 0x9fd02033  ! 675: Tcc_I	tvc	icc_or_xcc, %r0 + 51
	.word 0x87a18dc0  ! 676: FdMULq	fdmulq	
	.word 0x20800001  ! 677: BN	bn,a	<label_0x1>
	ta	T_CHANGE_TO_TL1	! macro
DS_45:
	.word 0x32800001  ! 680: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x93b1c306  ! 679: ALLIGNADDRESS	alignaddr	%r7, %r6, %r9
	mov 0x32, %r30
	.word 0x8fd0001e  ! 680: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x34700001  ! 681: BPG	<illegal instruction>
	.word 0xd337c006  ! 682: STQF_R	-	%f9, [%r6, %r31]
	.word 0x9dd02033  ! 683: Tcc_I	tpos	icc_or_xcc, %r0 + 51
	.word 0x81d02034  ! 684: Tcc_I	tn	icc_or_xcc, %r0 + 52
DS_46:
	.word 0x34800001  ! 686: BG	bg,a	<label_0x1>
	.word 0xc532000b  ! 686: STQF_R	-	%f2, [%r11, %r8]
	.word 0x87458000  ! 685: RD_SOFTINT_REG	rd	%softint, %r3
	.word 0x9068800d  ! 686: UDIVX_R	udivx 	%r2, %r13, %r8
	mov 0x31, %r30
	.word 0x87d0001e  ! 687: Tcc_R	tl	icc_or_xcc, %r0 + %r30
	mov 0x31, %r30
	.word 0x9fd0001e  ! 688: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0xd057c000  ! 690: LDSH_R	ldsh	[%r31 + %r0], %r8
	.word 0x8a792001  ! 691: SDIV_I	sdiv 	%r4, 0x0001, %r5
!	.word 0x9db34fed  ! 692: FONES	fones	%f14
	.word 0xdd37e001  ! 693: STQF_I	-	%f14, [0x0001, %r31]
	.word 0xdc800e40  ! 694: LDUWA_R	lduwa	[%r0, %r0] 0x72, %r14
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xdc97e030  ! 696: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r14
	.word 0x8fa01a68  ! 697: FqTOi	fqtoi	
	.word 0x87a00542  ! 698: FSQRTd	fsqrt	
	.word 0x3a700001  ! 699: BPCC	<illegal instruction>
	.word 0xc6c7e000  ! 700: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r3
	.word 0x8d802000  ! 701: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc69fc020  ! 702: LDDA_R	ldda	[%r31, %r0] 0x01, %r3
	mov 0x33, %r30
	.word 0x91d0001e  ! 703: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc6ffc022  ! 704: SWAPA_R	swapa	%r3, [%r31 + %r2] 0x01
	.word 0x9b69e001  ! 705: SDIVX_I	sdivx	%r7, 0x0001, %r13
	.word 0x8d902e03  ! 706: WRPR_PSTATE_I	wrpr	%r0, 0x0e03, %pstate
	.word 0x9a828004  ! 707: ADDcc_R	addcc 	%r10, %r4, %r13
	.word 0xda7fe001  ! 708: SWAP_I	swap	%r13, [%r31 + 0x0001]
	mov 0x35, %r30
	.word 0x97d0001e  ! 709: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8d902208  ! 711: WRPR_PSTATE_I	wrpr	%r0, 0x0208, %pstate
	.word 0xda8fe030  ! 712: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r13
	.word 0x9da0054b  ! 713: FSQRTd	fsqrt	
	mov 0x32, %r30
	.word 0x91d0001e  ! 714: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x98d24009  ! 715: UMULcc_R	umulcc 	%r9, %r9, %r12
	.word 0x9351c000  ! 716: RDPR_TL	rdpr	%tl, %r9
	.word 0x9da049ad  ! 717: FDIVs	fdivs	%f1, %f13, %f14
	.word 0x9da000cd  ! 718: FNEGd	fnegd	%f44, %f14
	.word 0x87802016  ! 719: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x88c1a001  ! 720: ADDCcc_I	addccc 	%r6, 0x0001, %r4
	.word 0x80530003  ! 721: UMUL_R	umul 	%r12, %r3, %r0
	ta	T_CHANGE_NONPRIV	! macro
DS_47:
	.word 0x22800001  ! 724: BE	be,a	<label_0x1>
	.word 0xd533800d  ! 724: STQF_R	-	%f10, [%r13, %r14]
	.word 0x83458000  ! 723: RD_SOFTINT_REG	rd	%softint, %r1
DS_48:
	.word 0x32800001  ! 725: BNE	bne,a	<label_0x1>
	.word 0xdd306001  ! 725: STQF_I	-	%f14, [0x0001, %r1]
	.word 0x87458000  ! 724: RD_SOFTINT_REG	rd	%softint, %r3
DS_49:
	.word 0x22800001  ! 726: BE	be,a	<label_0x1>
	illtrap
	.word 0x8bb0c306  ! 725: ALLIGNADDRESS	alignaddr	%r3, %r6, %r5
	.word 0x8d802000  ! 726: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87504000  ! 727: RDPR_TNPC	rdpr	%tnpc, %r3
	.word 0x9a488001  ! 728: MULX_R	mulx 	%r2, %r1, %r13
	.word 0x8a68a001  ! 729: UDIVX_I	udivx 	%r2, 0x0001, %r5
	mov 0x34, %r30
	.word 0x97d0001e  ! 730: Tcc_R	tge	icc_or_xcc, %r0 + %r30
	.word 0x87d02030  ! 731: Tcc_I	tl	icc_or_xcc, %r0 + 48
	.word 0x8d902058  ! 732: WRPR_PSTATE_I	wrpr	%r0, 0x0058, %pstate
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xcb27e001  ! 736: STF_I	st	%f5, [0x0001, %r31]
	.word 0x9068000f  ! 737: UDIVX_R	udivx 	%r0, %r15, %r8
DS_50:
	.word 0x34800001  ! 739: BG	bg,a	<label_0x1>
	.word 0xdb338000  ! 739: STQF_R	-	%f13, [%r0, %r14]
	.word 0x89458000  ! 738: RD_SOFTINT_REG	rd	%softint, %r4
	.word 0x9ada0007  ! 739: SMULcc_R	smulcc 	%r8, %r7, %r13
	.word 0x8d90228d  ! 740: WRPR_PSTATE_I	wrpr	%r0, 0x028d, %pstate
	.word 0x8d9028d1  ! 741: WRPR_PSTATE_I	wrpr	%r0, 0x08d1, %pstate
	.word 0x9478a001  ! 742: SDIV_I	sdiv 	%r2, 0x0001, %r10
	mov 0x32, %r30
	.word 0x9dd0001e  ! 743: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0x8bd02034  ! 744: Tcc_I	tcs	icc_or_xcc, %r0 + 52
	.word 0x85d02032  ! 745: Tcc_I	tle	icc_or_xcc, %r0 + 50
	mov 0x31, %r30
	.word 0x89d0001e  ! 746: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x9653c002  ! 747: UMUL_R	umul 	%r15, %r2, %r11
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8fa01a6c  ! 749: FqTOi	fqtoi	
	.word 0xcec804a0  ! 750: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r7
	.word 0x36800001  ! 751: BGE	bge,a	<label_0x1>
	.word 0xce800e40  ! 752: LDUWA_R	lduwa	[%r0, %r0] 0x72, %r7
	.word 0xcf3fe001  ! 753: STDF_I	std	%f7, [0x0001, %r31]
	mov 0x34, %r30
	.word 0x81d0001e  ! 754: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x8d902296  ! 755: WRPR_PSTATE_I	wrpr	%r0, 0x0296, %pstate
	.word 0x8d802000  ! 756: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xce17e001  ! 757: LDUH_I	lduh	[%r31 + 0x0001], %r7
	.word 0xcf27c00c  ! 758: STF_R	st	%f7, [%r12, %r31]
	ta	T_CHANGE_TO_TL1	! macro
	mov 0x30, %r30
	.word 0x9fd0001e  ! 760: Tcc_R	tvc	icc_or_xcc, %r0 + %r30
	.word 0x9bd02030  ! 761: Tcc_I	tcc	icc_or_xcc, %r0 + 48
	.word 0x88690007  ! 762: UDIVX_R	udivx 	%r4, %r7, %r4
	.word 0x8d902657  ! 763: WRPR_PSTATE_I	wrpr	%r0, 0x0657, %pstate
	.word 0xc8ffc027  ! 764: SWAPA_R	swapa	%r4, [%r31 + %r7] 0x01
	.word 0x8d9026c2  ! 765: WRPR_PSTATE_I	wrpr	%r0, 0x06c2, %pstate
	.word 0xc8bfe001  ! 766: STDA_I	stda	%r4, [%r31 + 0x0001] %asi
	.word 0x8c6a000d  ! 767: UDIVX_R	udivx 	%r8, %r13, %r6
	.word 0xcc3fe001  ! 768: STD_I	std	%r6, [%r31 + 0x0001]
	ta	T_CHANGE_HPRIV	! macro
DS_51:
	.word 0x32800001  ! 771: BNE	bne,a	<label_0x1>
	.word 0xcd302001  ! 771: STQF_I	-	%f6, [0x0001, %r0]
	.word 0x91458000  ! 770: RD_SOFTINT_REG	rd	%softint, %r8
DS_52:
	.word 0x22800001  ! 772: BE	be,a	<label_0x1>
	.word 0xd1338000  ! 772: STQF_R	-	%f8, [%r0, %r14]
	.word 0x89458000  ! 771: RD_SOFTINT_REG	rd	%softint, %r4
	.word 0xc88804a0  ! 772: LDUBA_R	lduba	[%r0, %r0] 0x25, %r4
	.word 0x9c53c00e  ! 773: UMUL_R	umul 	%r15, %r14, %r14
	.word 0x87802088  ! 774: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x87802080  ! 775: WRASI_I	wr	%r0, 0x0080, %asi
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x9350c000  ! 777: RDPR_TT	rdpr	%tt, %r9
	.word 0x896a4007  ! 778: SDIVX_R	sdivx	%r9, %r7, %r4
	.word 0x8d902000  ! 779: WRPR_PSTATE_I	wrpr	%r0, 0x0000, %pstate
	.word 0x8bd02032  ! 780: Tcc_I	tcs	icc_or_xcc, %r0 + 50
	mov 0x34, %r30
	.word 0x8fd0001e  ! 781: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x8d902412  ! 782: WRPR_PSTATE_I	wrpr	%r0, 0x0412, %pstate
!	.word 0x91b14fe7  ! 783: FONES	fones	%f8
	.word 0x8d802004  ! 784: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x30800001  ! 785: BA	ba,a	<label_0x1>
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d90208f  ! 787: WRPR_PSTATE_I	wrpr	%r0, 0x008f, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x9da0cd28  ! 789: FsMULd	fsmuld	%f3, %f8, %f14
	.word 0x96d84007  ! 790: SMULcc_R	smulcc 	%r1, %r7, %r11
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89d02031  ! 792: Tcc_I	tleu	icc_or_xcc, %r0 + 49
	.word 0xd69004a0  ! 793: LDUHA_R	lduha	[%r0, %r0] 0x25, %r11
	.word 0xd67fe001  ! 794: SWAP_I	swap	%r11, [%r31 + 0x0001]
	.word 0x91d02032  ! 795: Tcc_I	ta	icc_or_xcc, %r0 + 50
DS_53:
	.word 0x34800001  ! 797: BG	bg,a	<label_0x1>
	.word 0xc3310007  ! 797: STQF_R	-	%f1, [%r7, %r4]
	.word 0x81458000  ! 796: RD_SOFTINT_REG	stbar
	.word 0x8d802000  ! 797: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x96482001  ! 799: MULX_I	mulx 	%r0, 0x0001, %r11
DS_54:
	.word 0x34800001  ! 801: BG	bg,a	<label_0x1>
	.word 0xd7334007  ! 801: STQF_R	-	%f11, [%r7, %r13]
	.word 0x89458000  ! 800: RD_SOFTINT_REG	rd	%softint, %r4
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d902c48  ! 802: WRPR_PSTATE_I	wrpr	%r0, 0x0c48, %pstate
	.word 0x8d802004  ! 803: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d802000  ! 804: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x90780000  ! 805: SDIV_R	sdiv 	%r0, %r0, %r8
	.word 0x8d902099  ! 806: WRPR_PSTATE_I	wrpr	%r0, 0x0099, %pstate
	.word 0x8c4ac009  ! 807: MULX_R	mulx 	%r11, %r9, %r6
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xccc7e010  ! 809: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r6
	ta	T_CHANGE_HPRIV	! macro
	.word 0xcc4fe001  ! 811: LDSB_I	ldsb	[%r31 + 0x0001], %r6
	.word 0x2a700001  ! 812: BPCS	<illegal instruction>
DS_55:
	.word 0x20800001  ! 814: BN	bn,a	<label_0x1>
	illtrap
	.word 0x8bb1c30c  ! 813: ALLIGNADDRESS	alignaddr	%r7, %r12, %r5
	.word 0xcbe7c02c  ! 814: CASA_I	casa	[%r31] 0x 1, %r12, %r5
	.word 0x90d80004  ! 815: SMULcc_R	smulcc 	%r0, %r4, %r8
	.word 0xd13fe001  ! 816: STDF_I	std	%f8, [0x0001, %r31]
	.word 0x95a009e2  ! 817: FDIVq	dis not found

	.word 0x8d802004  ! 818: WRFPRS_I	wr	%r0, 0x0004, %fprs
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9da04dc4  ! 820: FdMULq	fdmulq	
	.word 0x81d02032  ! 821: Tcc_I	tn	icc_or_xcc, %r0 + 50
	.word 0xdcc004a0  ! 822: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r14
	.word 0x99500000  ! 823: RDPR_TPC	rdpr	%tpc, %r12
	.word 0x9e6a0009  ! 824: UDIVX_R	udivx 	%r8, %r9, %r15
	.word 0xdedfe010  ! 825: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r15
	.word 0x87802045  ! 826: WRASI_I	wr	%r0, 0x0045, %asi
	.word 0x38800001  ! 827: BGU	bgu,a	<label_0x1>
	.word 0xde9fe001  ! 828: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r15
	mov 0x35, %r30
	.word 0x93d0001e  ! 829: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	mov 0x30, %r30
	.word 0x8fd0001e  ! 831: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x89d02033  ! 832: Tcc_I	tleu	icc_or_xcc, %r0 + 51
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xdec00e80  ! 834: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r15
	ta	T_CHANGE_TO_TL0	! macro
	mov 0x32, %r30
	.word 0x91d0001e  ! 836: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xde3fc009  ! 837: STD_R	std	%r15, [%r31 + %r9]
	.word 0x8d9020cc  ! 838: WRPR_PSTATE_I	wrpr	%r0, 0x00cc, %pstate
	.word 0x806a6001  ! 839: UDIVX_I	udivx 	%r9, 0x0001, %r0
	.word 0x8d902a0c  ! 840: WRPR_PSTATE_I	wrpr	%r0, 0x0a0c, %pstate
	.word 0xc017e001  ! 841: LDUH_I	lduh	[%r31 + 0x0001], %r0
	.word 0x8d902a1c  ! 842: WRPR_PSTATE_I	wrpr	%r0, 0x0a1c, %pstate
	.word 0xc137c009  ! 843: STQF_R	-	%f0, [%r9, %r31]
	.word 0x9a03a001  ! 844: ADD_I	add 	%r14, 0x0001, %r13
	.word 0xdb27e001  ! 845: STF_I	st	%f13, [0x0001, %r31]
	.word 0x95508000  ! 846: RDPR_TSTATE	rdpr	%tstate, %r10
	.word 0x8bd02032  ! 847: Tcc_I	tcs	icc_or_xcc, %r0 + 50
	.word 0xd49fe001  ! 848: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r10
	.word 0x9003e001  ! 849: ADD_I	add 	%r15, 0x0001, %r8
	.word 0xd03fc009  ! 850: STD_R	std	%r8, [%r31 + %r9]
	ta	T_CHANGE_PRIV	! macro
	.word 0x88808001  ! 852: ADDcc_R	addcc 	%r2, %r1, %r4
	.word 0x9da08d26  ! 853: FsMULd	fsmuld	%f2, %f6, %f14
	.word 0xdcd004a0  ! 854: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r14
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x83514000  ! 856: RDPR_TBA	rdpr	%tba, %r1
	.word 0x9c7ae001  ! 857: SDIV_I	sdiv 	%r11, 0x0001, %r14
	.word 0x8bd02032  ! 858: Tcc_I	tcs	icc_or_xcc, %r0 + 50
	.word 0x8d90220e  ! 859: WRPR_PSTATE_I	wrpr	%r0, 0x020e, %pstate
!	.word 0x81b0cfe1  ! 860: FONES	fones	%f0
	.word 0x836ac001  ! 861: SDIVX_R	sdivx	%r11, %r1, %r1
DS_56:
	.word 0x32800001  ! 863: BNE	bne,a	<label_0x1>
	.word 0xdf31e001  ! 863: STQF_I	-	%f15, [0x0001, %r7]
	.word 0x87458000  ! 862: RD_SOFTINT_REG	rd	%softint, %r3
	.word 0x97d02034  ! 863: Tcc_I	tge	icc_or_xcc, %r0 + 52
	mov 0x30, %r30
	.word 0x81d0001e  ! 864: Tcc_R	tn	icc_or_xcc, %r0 + %r30
	.word 0x99694006  ! 865: SDIVX_R	sdivx	%r5, %r6, %r12
	.word 0x93a0cdcd  ! 866: FdMULq	fdmulq	
	.word 0x8d9020db  ! 867: WRPR_PSTATE_I	wrpr	%r0, 0x00db, %pstate
	.word 0x93d02030  ! 868: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0x8d802000  ! 869: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d9022cb  ! 870: WRPR_PSTATE_I	wrpr	%r0, 0x02cb, %pstate
	.word 0x8d50c000  ! 871: RDPR_TT	rdpr	%tt, %r6
!	.word 0x89b30fe8  ! 872: FONES	fones	%f4
	.word 0x8d9026cf  ! 873: WRPR_PSTATE_I	wrpr	%r0, 0x06cf, %pstate
	.word 0x90486001  ! 874: MULX_I	mulx 	%r1, 0x0001, %r8
	.word 0x8cd28006  ! 875: UMULcc_R	umulcc 	%r10, %r6, %r6
	ta	T_CHANGE_TO_TL1	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x93a00564  ! 878: FSQRTq	fsqrt	
	.word 0x8c788005  ! 879: SDIV_R	sdiv 	%r2, %r5, %r6
	.word 0x8d90201f  ! 880: WRPR_PSTATE_I	wrpr	%r0, 0x001f, %pstate
	.word 0xcc8804a0  ! 881: LDUBA_R	lduba	[%r0, %r0] 0x25, %r6
DS_57:
	.word 0x22800001  ! 883: BE	be,a	<label_0x1>
	illtrap
	.word 0x8bb14308  ! 882: ALLIGNADDRESS	alignaddr	%r5, %r8, %r5
	.word 0x9b500000  ! 883: RDPR_TPC	rdpr	%tpc, %r13
	.word 0x89a00545  ! 884: FSQRTd	fsqrt	
	.word 0xc81fc000  ! 885: LDD_R	ldd	[%r31 + %r0], %r4
	.word 0xc887e010  ! 886: LDUWA_I	lduwa	[%r31, + 0x0010] %asi, %r4
	ta	T_CHANGE_TO_TL1	! macro
	mov 0x30, %r30
	.word 0x8dd0001e  ! 888: Tcc_R	tneg	icc_or_xcc, %r0 + %r30
	.word 0xc8d00e80  ! 889: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r4
	.word 0x3a800001  ! 890: BCC	bcc,a	<label_0x1>
	.word 0x9cc3e001  ! 891: ADDCcc_I	addccc 	%r15, 0x0001, %r14
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x95a0056e  ! 893: FSQRTq	fsqrt	
DS_58:
	.word 0x34800001  ! 895: BG	bg,a	<label_0x1>
	illtrap
	.word 0x87b3030d  ! 894: ALLIGNADDRESS	alignaddr	%r12, %r13, %r3
	.word 0x8d902044  ! 895: WRPR_PSTATE_I	wrpr	%r0, 0x0044, %pstate
	.word 0xc737e001  ! 896: STQF_I	-	%f3, [0x0001, %r31]
	.word 0xc717c000  ! 897: LDQF_R	-	[%r31, %r0], %f3
	.word 0x8d802000  ! 898: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d9022c9  ! 899: WRPR_PSTATE_I	wrpr	%r0, 0x02c9, %pstate
	.word 0xc7e7c02d  ! 900: CASA_I	casa	[%r31] 0x 1, %r13, %r3
	.word 0x82788001  ! 901: SDIV_R	sdiv 	%r2, %r1, %r1
	.word 0x9ad1000a  ! 902: UMULcc_R	umulcc 	%r4, %r10, %r13
	.word 0x9801a001  ! 903: ADD_I	add 	%r6, 0x0001, %r12
	mov 0x34, %r30
	.word 0x9dd0001e  ! 904: Tcc_R	tpos	icc_or_xcc, %r0 + %r30
	.word 0xd927c00a  ! 905: STF_R	st	%f12, [%r10, %r31]
	.word 0x8d802004  ! 906: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd9e7c02a  ! 907: CASA_I	casa	[%r31] 0x 1, %r10, %r12
DS_59:
	.word 0x32800001  ! 909: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x9fb2c300  ! 908: ALLIGNADDRESS	alignaddr	%r11, %r0, %r15
	.word 0x9d514000  ! 909: RDPR_TBA	rdpr	%tba, %r14
	.word 0x89a000ca  ! 910: FNEGd	fnegd	%f10, %f4
	.word 0x81a349a8  ! 911: FDIVs	fdivs	%f13, %f8, %f0
	.word 0xc08804a0  ! 912: LDUBA_R	lduba	[%r0, %r0] 0x25, %r0
	.word 0x8d802000  ! 913: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d902485  ! 915: WRPR_PSTATE_I	wrpr	%r0, 0x0485, %pstate
	.word 0xc09fc020  ! 916: LDDA_R	ldda	[%r31, %r0] 0x01, %r0
	ta	T_CHANGE_TO_TL0	! macro
	mov 0x31, %r30
	.word 0x91d0001e  ! 918: Tcc_R	ta	icc_or_xcc, %r0 + %r30
!	.word 0x89b14fe2  ! 919: FONES	fones	%f4
	.word 0x8d902cc9  ! 920: WRPR_PSTATE_I	wrpr	%r0, 0x0cc9, %pstate
	.word 0xc8c7e020  ! 921: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r4
	.word 0x8d902283  ! 922: WRPR_PSTATE_I	wrpr	%r0, 0x0283, %pstate
	mov 0x30, %r30
	.word 0x89d0001e  ! 923: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x8478000f  ! 924: SDIV_R	sdiv 	%r0, %r15, %r2
	.word 0x8d802000  ! 925: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9a82a001  ! 926: ADDcc_I	addcc 	%r10, 0x0001, %r13
!	.word 0x91b14fe5  ! 927: FONES	fones	%f8
	.word 0x93494000  ! 928: RDHPR_HTBA	rdhpr	%htba, %r9
	.word 0x8d902657  ! 929: WRPR_PSTATE_I	wrpr	%r0, 0x0657, %pstate
DS_60:
	.word 0x22800001  ! 931: BE	be,a	<label_0x1>
	illtrap
	.word 0x91b08303  ! 930: ALLIGNADDRESS	alignaddr	%r2, %r3, %r8
	.word 0x9cd0c00a  ! 931: UMULcc_R	umulcc 	%r3, %r10, %r14
	.word 0x8d90264e  ! 932: WRPR_PSTATE_I	wrpr	%r0, 0x064e, %pstate
	.word 0x8d902698  ! 933: WRPR_PSTATE_I	wrpr	%r0, 0x0698, %pstate
	.word 0x93a389a5  ! 934: FDIVs	fdivs	%f14, %f5, %f9
	.word 0x9878e001  ! 935: SDIV_I	sdiv 	%r3, 0x0001, %r12
	ta	T_CHANGE_PRIV	! macro
DS_61:
	.word 0x34800001  ! 938: BG	bg,a	<label_0x1>
	.word 0xcd338007  ! 938: STQF_R	-	%f6, [%r7, %r14]
	.word 0x9b458000  ! 937: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x9f68e001  ! 938: SDIVX_I	sdivx	%r3, 0x0001, %r15
	.word 0x8e7b000a  ! 939: SDIV_R	sdiv 	%r12, %r10, %r7
	.word 0x8d902c92  ! 940: WRPR_PSTATE_I	wrpr	%r0, 0x0c92, %pstate
	.word 0x87802088  ! 941: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xcf27c00a  ! 942: STF_R	st	%f7, [%r10, %r31]
	.word 0x8d9028c4  ! 943: WRPR_PSTATE_I	wrpr	%r0, 0x08c4, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d902082  ! 945: WRPR_PSTATE_I	wrpr	%r0, 0x0082, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d9024c7  ! 947: WRPR_PSTATE_I	wrpr	%r0, 0x04c7, %pstate
	.word 0x87802014  ! 948: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x8d90221e  ! 949: WRPR_PSTATE_I	wrpr	%r0, 0x021e, %pstate
	.word 0x8fa109a7  ! 950: FDIVs	fdivs	%f4, %f7, %f7
	.word 0x8d802000  ! 951: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_62:
	.word 0x22800001  ! 953: BE	be,a	<label_0x1>
	illtrap
	.word 0x8bb0430a  ! 952: ALLIGNADDRESS	alignaddr	%r1, %r10, %r5
	ta	T_CHANGE_HPRIV	! macro
	.word 0x91a14d2d  ! 954: FsMULd	fsmuld	%f5, %f44, %f8
	.word 0x9769c00e  ! 955: SDIVX_R	sdivx	%r7, %r14, %r11
	.word 0x876aa001  ! 956: SDIVX_I	sdivx	%r10, 0x0001, %r3
	.word 0xc65fc000  ! 957: LDX_R	ldx	[%r31 + %r0], %r3
	.word 0x97494000  ! 958: RDHPR_HTBA	rdhpr	%htba, %r11
	.word 0xd6d004a0  ! 959: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r11
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd6cfe020  ! 961: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r11
DS_63:
	.word 0x20800001  ! 963: BN	bn,a	<label_0x1>
	illtrap
	.word 0x87b0c30f  ! 962: ALLIGNADDRESS	alignaddr	%r3, %r15, %r3
	ta	T_CHANGE_NONHPRIV	! macro
	mov 0x33, %r30
	.word 0x95d0001e  ! 964: Tcc_R	tg	icc_or_xcc, %r0 + %r30
	.word 0x87802010  ! 965: WRASI_I	wr	%r0, 0x0010, %asi
DS_64:
	.word 0x22800001  ! 967: BE	be,a	<label_0x1>
	.word 0xd1332001  ! 967: STQF_I	-	%f8, [0x0001, %r12]
	.word 0x8d458000  ! 966: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0xcd27c00f  ! 967: STF_R	st	%f6, [%r15, %r31]
	.word 0xcd37e001  ! 968: STQF_I	-	%f6, [0x0001, %r31]
	.word 0xcc8fe020  ! 969: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r6
	.word 0x9b6a6001  ! 970: SDIVX_I	sdivx	%r9, 0x0001, %r13
	.word 0x8d902e0a  ! 971: WRPR_PSTATE_I	wrpr	%r0, 0x0e0a, %pstate
	.word 0x26800001  ! 972: BL	bl,a	<label_0x1>
	ta	T_CHANGE_HPRIV	! macro
DS_65:
	.word 0x32800001  ! 975: BNE	bne,a	<label_0x1>
	.word 0xc733a001  ! 975: STQF_I	-	%f3, [0x0001, %r14]
	.word 0x9b458000  ! 974: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0xda17c000  ! 975: LDUH_R	lduh	[%r31 + %r0], %r13
	.word 0x8d90244d  ! 976: WRPR_PSTATE_I	wrpr	%r0, 0x044d, %pstate
	.word 0xda37c00f  ! 977: STH_R	sth	%r13, [%r31 + %r15]
	.word 0x8d802000  ! 978: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x946b2001  ! 979: UDIVX_I	udivx 	%r12, 0x0001, %r10
	.word 0x99d02031  ! 980: Tcc_I	tgu	icc_or_xcc, %r0 + 49
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902c1d  ! 982: WRPR_PSTATE_I	wrpr	%r0, 0x0c1d, %pstate
	.word 0x8d902893  ! 983: WRPR_PSTATE_I	wrpr	%r0, 0x0893, %pstate
!	.word 0x9bb20fe3  ! 984: FONES	fones	%f13
DS_66:
	.word 0x32800001  ! 986: BNE	bne,a	<label_0x1>
	.word 0xd5320008  ! 986: STQF_R	-	%f10, [%r8, %r8]
	.word 0x83458000  ! 985: RD_SOFTINT_REG	rd	%softint, %r1
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x87802004  ! 987: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x9a680008  ! 988: UDIVX_R	udivx 	%r0, %r8, %r13
	.word 0xdac804a0  ! 989: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r13
	.word 0xdacfe030  ! 990: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r13
	.word 0xda27c008  ! 991: STW_R	stw	%r13, [%r31 + %r8]
	mov 0x32, %r30
	.word 0x89d0001e  ! 992: Tcc_R	tleu	icc_or_xcc, %r0 + %r30
	.word 0x26800001  ! 993: BL	bl,a	<label_0x1>
	.word 0x83d02030  ! 994: Tcc_I	te	icc_or_xcc, %r0 + 48
	mov 0x33, %r30
	.word 0x8fd0001e  ! 995: Tcc_R	tvs	icc_or_xcc, %r0 + %r30
	.word 0x89a000c8  ! 996: FNEGd	fnegd	%f8, %f4
	.word 0x8d902cc4  ! 997: WRPR_PSTATE_I	wrpr	%r0, 0x0cc4, %pstate
	.word 0x24700001  ! 998: BPLE	<illegal instruction>


.data
user_data_start:
	.xword	0x74d033ff2ec6235f
	.xword	0xf6676cc58296739d
	.xword	0x5bf2044cdf446c91
	.xword	0xbd2c45df629e6a6c
	.xword	0x89e86d4fd98849c7
	.xword	0x5d099560ddb743bf
	.xword	0xa9ab679942c386e9
	.xword	0xe42e7d7f7c793e51
	.xword	0xe637047ee028d7fb
	.xword	0xb919c5c695d8b401
	.xword	0x6d3b872455afe24f
	.xword	0x4fba3852dae94f37
	.xword	0xa8ec32ce36ab4b78
	.xword	0x24f63e0b836d95aa
	.xword	0xa2146425296ebce8
	.xword	0x359f8d7ac67f6c97
	.xword	0x147cbb397394c03e
	.xword	0x6e0e8d1a93aca01a
	.xword	0xaa3cdf83b8cde554
	.xword	0x9f9996cf37fb4316
	.xword	0x853374af6285bc8d
	.xword	0x60c39bac18b1d4b2
	.xword	0x6853f1a65dd15f4d
	.xword	0xfea57128022d313f
	.xword	0x9965044693d05acf
	.xword	0xf8a9d52c9794d29c
	.xword	0x1a122c0815df25ae
	.xword	0xbb15c3ec95dde035
	.xword	0xd2ea36d253fd6a8e
	.xword	0xd6b7baaebec60414
	.xword	0xadf5b4c6d86530f7
	.xword	0x74ae34fab42e23d1
	.xword	0x6b6610fe656d9741
	.xword	0x969b101bc56c4b12
	.xword	0x478836cb2220cd9a
	.xword	0xeeef08bdefc6866e
	.xword	0x8574ff9ae2921a6a
	.xword	0x2155a0e1cf1abeb0
	.xword	0x96704e30fb5bb477
	.xword	0xfe87a9f5435e2494
	.xword	0x9faa0e1e6510f660
	.xword	0xfb50c9f44260a070
	.xword	0xf164338586ac74cb
	.xword	0xdcd45668a2c057b7
	.xword	0x66e3992eb404934c
	.xword	0x861cb2b95002a587
	.xword	0xc880bee429f62ef1
	.xword	0xb95e6cb3709f3dac
	.xword	0x57ff09ca34f3a79d
	.xword	0xb0df5bcd843bdac7
	.xword	0x1e89bf347a225283
	.xword	0xf8df6c12cf30d12a
	.xword	0x26c79799a9534b79
	.xword	0xfd1f0cea16987590
	.xword	0x6527a0fe3f1ea46c
	.xword	0x899c2fcb4bb78eb3
	.xword	0x9081dfdbf92caea9
	.xword	0xa2d2044c3fac91ff
	.xword	0x308b1f464bf49102
	.xword	0xaa1f2825f444bc5f
	.xword	0xec663ffc70285042
	.xword	0x270c8de319c768f2
	.xword	0x38d55f5e1885faa6
	.xword	0x00a0342917c3a248
	.xword	0x5f04e2654cca3490
	.xword	0xcfb3a6a3fc532d8e
	.xword	0x61ac3ec6af9d81cf
	.xword	0x4fe074705f2dadb2
	.xword	0x26c84bd0c5cc3223
	.xword	0x706fb9650f212bbb
	.xword	0x8f02150febacff56
	.xword	0x8fc86e4eed45bd4e
	.xword	0x015cf8f07e8de210
	.xword	0x87b67e4a49c19245
	.xword	0x432975037ac9a361
	.xword	0x47729a913895182f
	.xword	0xaad070513e1b65f3
	.xword	0xceef1caf2f9edf5f
	.xword	0x5db3faad0ad3631a
	.xword	0xf091e7dbeb23d06b
	.xword	0x4b37994b12c177ae
	.xword	0xf420ad6042361199
	.xword	0xfaf0c66ca8faeaae
	.xword	0x35e824082a4d1663
	.xword	0x38abb132fd0f1321
	.xword	0x5848b48bb41f5cb0
	.xword	0xa02c1c35c22139d2
	.xword	0x10c9cc63d1b2a114
	.xword	0xe0353e1dbd40c4f1
	.xword	0x75828438123c725e
	.xword	0xc9dd0711c33444da
	.xword	0xf94ea1b339c75756
	.xword	0xfc3911d95f939bc7
	.xword	0xc396c1e12754c344
	.xword	0xd6fd8534f554cce2
	.xword	0xe8e37a7978d4ca49
	.xword	0x1d4dc89b08c0cdb2
	.xword	0xf2c5d26a2bcde2b2
	.xword	0xd5cf2a52967ac455
	.xword	0xea8f791169317b1e
	.xword	0x46893c0b8bdb6843
	.xword	0xc2ce12d747df8741
	.xword	0x40a51c3a856f4356
	.xword	0x218e6c62058bf41f
	.xword	0x0fba13dd2f02a7a3
	.xword	0xb176a64b03cecb79
	.xword	0x6c1691289bfad129
	.xword	0xc9df47292b22de71
	.xword	0x30d16f7aa2273cf7
	.xword	0x672ba170af78fe5f
	.xword	0x4a9d7db5f753a2f9
	.xword	0xfba9f87117a1232d
	.xword	0x6948181a1806ebc6
	.xword	0x18f1359e0c8a90a5
	.xword	0x276719591060e635
	.xword	0xde081357ff10bf94
	.xword	0x5849ace93bcbf865
	.xword	0x60f24723a94c230a
	.xword	0x461cee055b7fd311
	.xword	0x2c61cc3176cf0766
	.xword	0xa9c24c4509728797
	.xword	0xc5fc73131d21a39a
	.xword	0x11c74bd42b9f883f
	.xword	0x74ca8d97a6a6e053
	.xword	0x1a4d657c2091637b
	.xword	0x2ab0cccef971c1c5
	.xword	0xf9672e75758dd1a1
	.xword	0x8be9e81f3d4d91e6
	.xword	0x1bef71b81bb7e245
	.xword	0x9d14b2ef61322532
	.xword	0x988916e76beb3922
	.xword	0xcdb8456adce0d4df
	.xword	0x3ef2fbd502bd8344
	.xword	0x67eaf5867f019342
	.xword	0xc5f3d8b7f5336815
	.xword	0x6c59620854fc4a19
	.xword	0x39a464aa0258f9ab
	.xword	0xd7120482de838c63
	.xword	0x82f1dba6ce312bcf
	.xword	0xb3680c2558d9134b
	.xword	0x1257036ba7e22022
	.xword	0x7b7413bb60b75593
	.xword	0x5ef785c6cdefab3a
	.xword	0xb5d811ee9f79a375
	.xword	0xd0a817e4e4156ac5
	.xword	0xed40474b1d87a986
	.xword	0xd9fb5ab3fa20cd01
	.xword	0x0840fff239411c2c
	.xword	0x16262b011cc094bc
	.xword	0xf6963ed7d2b77437
	.xword	0xf803790e203a1779
	.xword	0x4918d09b59e220da
	.xword	0xf826f8b12940de7a
	.xword	0xa208a406019a6583
	.xword	0xfb534d195e792e5a
	.xword	0xc88469b47a7ed3ff
	.xword	0x91caf0b18268ff4d
	.xword	0xafc86b82c0d7962c
	.xword	0x4be09ed465a3ce37
	.xword	0xaaf23ae498387766
	.xword	0xd8a15a354d0152a4
	.xword	0x4a46e318cac08d24
	.xword	0x1db0c4b10f2470c9
	.xword	0x7998f4c6cffde0b0
	.xword	0xf545863898a2307d
	.xword	0x616f6e1de36d3b59
	.xword	0x2a01d360edc9c2f5
	.xword	0xec6c80eb83258dfd
	.xword	0x537ca78dfbbb2355
	.xword	0x0f3a00c8dd873935
	.xword	0xf3a05976cd70059a
	.xword	0x219c841d38327f15
	.xword	0xcc7469eb56fcc7f4
	.xword	0x045c99a7c75f3374
	.xword	0xd8b15cc0e183525c
	.xword	0x7982db5b76f3bd16
	.xword	0x7e64bf19bfb0e5d0
	.xword	0x52140c4aee3ac100
	.xword	0xc3cba167a49ca5b1
	.xword	0x5367f4279faec5d3
	.xword	0xb572ee0ddeef406d
	.xword	0x4d4cef86b21f3048
	.xword	0x9d94937ab3e31e72
	.xword	0x5bd9b06c9d445ffe
	.xword	0xd2b3c70bffab53ca
	.xword	0xa36ad7ab4ecbbedc
	.xword	0xe6094bd4fcf728fd
	.xword	0x882a3735b0a566ed
	.xword	0x6c84057cec1ad27a
	.xword	0xa5f4a2ff94aa2f4b
	.xword	0x8ef0199002eab737
	.xword	0x669879e5233be4fd
	.xword	0x646541a3cbe44102
	.xword	0x180f0ee9d57f1613
	.xword	0x6e44e5bb6ec11116
	.xword	0x55892f094124651e
	.xword	0xbfa03c6f2eb591a6
	.xword	0xfe4616bf4c9f29e2
	.xword	0x40a2860e5583310f
	.xword	0xa6605518c9b7b71d
	.xword	0x99faa4d369c98e7f
	.xword	0x6771a63189ee78bf
	.xword	0x6ab537022ffee29c
	.xword	0x5d7a4737110c8286
	.xword	0x1259026c8d9ea4fb
	.xword	0xb2850ad8fa8a7c31
	.xword	0xe7ca45e5ec0a97cf
	.xword	0x9c2df07918614905
	.xword	0xf46be2aace9f17ac
	.xword	0x5687ef6ca4c32d9e
	.xword	0xc040bf5ac6f00469
	.xword	0xf4fb917c90ff5e6d
	.xword	0xe303bfe6a8dc3da4
	.xword	0xa70d02edd8530fbd
	.xword	0xfc5e04527cd15245
	.xword	0xbc4f26220167b357
	.xword	0x201cde4e321071c6
	.xword	0xd9672a4b546921ac
	.xword	0x33b1baec84a24ea0
	.xword	0xedccd75cc9eb6dbe
	.xword	0x802aa63316035112
	.xword	0xbcfcf49e4d076a43
	.xword	0x48363241e66786d0
	.xword	0x822b948e1e7d9727
	.xword	0x0c4e2defe18f6950
	.xword	0xef92add00d3de1e0
	.xword	0xeb29ce3f89000238
	.xword	0xedffb839d503c361
	.xword	0x7e6b802e6071246f
	.xword	0x7ddfebd7f821f567
	.xword	0x5bfe5dc7d968f272
	.xword	0xac9bcdd4a4739073
	.xword	0x7c19058c6cb6618d
	.xword	0x0a297a90d9fe6860
	.xword	0x7e531e25ab4e5bde
	.xword	0x2d8172d76a498dc6
	.xword	0xdc0e2d4d8ddc3523
	.xword	0xf12215b8a0c00bed
	.xword	0xcafafe66ad5b27e0
	.xword	0xe917b4f6b50677f3
	.xword	0xe9c4329ef88caad4
	.xword	0xde99daaa1270f94e
	.xword	0x1e1a2f11f115c791
	.xword	0x805c17dfd80d1a1b
	.xword	0x659399c5e8675569
	.xword	0x57699160f686c39c
	.xword	0xe275a09b701761e7
	.xword	0x5e76911b20bef8c9
	.xword	0x85a5ce7a97d83305
	.xword	0x0e844cfc042672da
	.xword	0xd6d1777c8e61676b
	.xword	0xaa831094c648accd
	.xword	0xf9bad780a077b625
	.xword	0x95c603dd8eb9da3c
	.xword	0x1b80598e27715aa7
	.xword	0x351a24448c0b77a8


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
!!#  output of /import/bw/tools/local/indra-release/indra,1.4.11/bin/ijpp (indrajal preprocessor) - Mon Apr  5 11:34:21 2004
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
!!#     IJ_bind_thread_group("diag.j", 28, th0, 0x01);
!!# 
!!#     // Random 64 bits //
!!#     IJ_set_rvar("diag.j", 31, Rv_rand_64,"64'hrrrrrrrr_rrrrrrrr");
!!# 
!!#     // Register usage - use 0-27 //
!!#     // R31 is memory pointer
!!#     // R30 is trap number register
!!#     //
!!#     IJ_set_ropr_fld("diag.j", 37, ijdefault, Ft_Rs1, "5'b0rrrr");
!!#     IJ_set_ropr_fld("diag.j", 38, ijdefault, Ft_Rs2, "5'b0rrrr");
!!#     IJ_set_ropr_fld("diag.j", 39, ijdefault, Ft_Rd, "5'b0rrrr");
!!# 
!!#     // Load/Store pointer = r31
!!#     IJ_set_ropr_fld("diag.j", 42, Ro_ldst_ptr, Ft_Rs1, "{31}");
!!# 
!!#     // ASI register values 
!!#     IJ_set_ropr_fld("diag.j", 45, Ro_wrasi_i, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 46, Ro_wrasi_i, Ft_Simm13, "{0x4, 0x10, 0x14, 0x16, 0x45, 0x54, 0x80, 0x88, }");
!!# 
!!#     // General Ldst ASIs to use .. 50% should be illegal ..
!!#     IJ_set_ropr_fld("diag.j", 49, Ro_nontrap_ldasi, Ft_Imm_Asi, "{0x12,0x14, 0x53..0x64}");
!!#     IJ_set_ropr_fld("diag.j", 50, Ro_nontrap_ldasi, Ft_Rs1, "{31}");
!!#     IJ_set_ropr_fld("diag.j", 51, Ro_nontrap_ldasi, Ft_Rs2, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 52, Ro_nontrap_ldasi, Ft_Simm13, "{0x0}, 6'brr0000");
!!# 
!!#     // General Ldst alignment to use .. 50% should be illegal ..
!!#     IJ_set_ropr_fld("diag.j", 55, Ro_nontrap_ld, Fm_align_Simm13, "{0x0, 0x7}");
!!#     IJ_set_ropr_fld("diag.j", 56, Ro_nontrap_ld, Ft_Rs1, "{31}");
!!#     IJ_set_ropr_fld("diag.j", 57, Ro_nontrap_ld, Ft_Rs2, "{0}");
!!# 
!!#     // Trap ASI operands
!!#     IJ_set_ropr_fld("diag.j", 60, Ro_traps_asi, Ft_Imm_Asi, "{0x25, 0x72..0x74}");
!!#     IJ_set_ropr_fld("diag.j", 61, Ro_traps_asi, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 62, Ro_traps_asi, Ft_Rs2, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 63, Ro_traps_asi, Ft_Simm13, "{0x25, 0x72..0x74}");
!!# 
!!#     // Trap #s to use
!!#     IJ_set_ropr_fld("diag.j", 66, Ro_traps_i, Ft_Sw_Trap, "{0x30..0x35 }");
!!#     IJ_set_ropr_fld("diag.j", 67, Ro_traps_i, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 68, Ro_traps_i, Ft_Cond_f2, "{0x0 .. 0xf}");
!!#     IJ_set_ropr_fld("diag.j", 69, Ro_traps_r, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 70, Ro_traps_r, Ft_Rs2, "{30}");
!!#     IJ_set_ropr_fld("diag.j", 71, Ro_traps_r, Ft_Cond_f2, "{0x0 .. 0xf}");
!!#     IJ_set_ropr_fld("diag.j", 72, Ro_traps_r, Ft_Simm13, "{0x30..0x35}");
!!#     IJ_set_rvar("diag.j", 73, Rv_init_trap, "{0x30..0x35}");
!!# 
!!#     // FPRS splash
!!#     IJ_set_ropr_fld("diag.j", 76, Ro_wrfprs, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 77, Ro_wrfprs, Ft_Simm13, "{0, 4}");
!!# 
!!#     // Pstate splash
!!#     IJ_set_ropr_fld("diag.j", 80, Ro_wrpstate, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 81, Ro_wrpstate, Ft_Simm13, "12'b0rrr0rr0rrrrr");
!!# 
!!#     // Weights
!!#     IJ_set_default_rule_wt_rvar ("diag.j", 84,"{10}");
!!#     IJ_set_rvar("diag.j", 85, wt_high, "{60}");
!!#     IJ_set_rvar("diag.j", 86, wt_med,  "{30}");
!!#     IJ_set_rvar("diag.j", 87, wt_low,  "{10}");
!!# 
!!#     // Initialize registers ..
!!#     int i, j, k;
!!#     IJ_printf  ("diag.j", 91, th0,"!Initializing integer registers\n");
!!#     for (k=0; k<3; k++) {
!!#         for (i = 0; i < 31; i++) {
!!#             j=i*8;
!!#             IJ_printf  ("diag.j", 95, th0,"\tldx [%%r31+%d], %%r%d\n", j,i);
!!#         }
!!#         IJ_printf  ("diag.j", 97, th0,"\tsave %%r31, %%r0, %%r31\n");
!!#     }
!!#     for (k=0; k<3; k++) {
!!#         IJ_printf  ("diag.j", 100, th0,"\trestore\n");
!!#     }
!!# 
!!#     IJ_printf  ("diag.j", 103, th0,"!Initializing float registers\n");
!!#     for (i = 0; i < 31; i=i+2) {
!!#         j=i*8;
!!#         IJ_printf  ("diag.j", 106, th0,"\tldd [%%r31+%d], %%f%d\n", j,i);
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
!!#     IJ_printf  ("diag.j", 112, th0,"\n\n.data\nuser_data_start:\n");
!!#     for (i = 0; i < 256; i++) {
!!#         IJ_printf  ("diag.j", 114, th0,"\t.xword\t0x%016llrx\n", Rv_rand_64);
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
!!#         IJ_generate ("diag.j", 537, th0, $2);
!!#     };
!!# 
!!# inst:      trap_asr     %rvar  wt_low
!!#         |  trap_asi     %rvar  wt_low
!!#         |  tcc          %rvar  wt_med
!!#         | ldst_excp     %rvar  wt_low
!!#         | ldstasi_excp  %rvar  wt_low
!!#         | change_mode   %rvar  wt_med
!!#         | alu           %rvar  wt_high
!!#         | branches      %rvar  wt_med
!!#         | wrasi         %rvar  wt_low
!!#         | splash_fprs   %rvar  wt_low
!!#         | splash_pstate %rvar  wt_med
!!#         | stores        %rvar  wt_low
!!# ;
!!# 
!!# change_mode :   
!!#       tCHANGE_NONPRIV 
!!#     | tCHANGE_PRIV 
!!#     | tCHANGE_NONHPRIV
!!#     | tCHANGE_HPRIV 
!!#     | tCHANGE_TO_TL1 
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
!!# trap_asi : 
!!#     asi_load_r %ropr  Ro_traps_asi
!!# ;
!!# 
!!# wrasi : tWRASI_I %ropr  Ro_wrasi_i
!!# ;
!!# reg_tcc : tTcc_R %ropr  Ro_traps_r
!!#      { 
!!#      IJ_printf("diag.j", 592, th0, "\tmov 0x%rx, %%r30\n", Rv_init_trap);
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
!!# asi_load_i: tLDSBA_I | tLDSHA_I | tLDSWA_I | tLDUBA_I | tLDUHA_I | tLDUWA_I
!!#             | tLDXA_I
!!# ;
!!# 
!!# asi_load_r:tLDSBA_R | tLDSHA_R | tLDSWA_R | tLDUBA_R | tLDUHA_R | tLDUWA_R
!!#             | tLDXA_R 
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
!!!#      tFSQRTq | tFSQRTd | tFsMULd | tFdMULq | tFqTOi | tFNEGd | tFONES
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
!!#         IJ_printf("diag.j", 675, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 676,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         IJ_generate_from_token("diag.j", 677,1, th0, ijdefault, tSTQF_I, tSTQF_R, -1);;
!!#     } | tALLIGNADDRESS
!!#     {
!!#         IJ_printf("diag.j", 680, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 681,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         IJ_printf("diag.j", 682, th0, "\tilltrap\n");
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
