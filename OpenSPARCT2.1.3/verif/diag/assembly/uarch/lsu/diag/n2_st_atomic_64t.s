/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_st_atomic_64t.s
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
#define PSTATE_CLE_MASK	0x200
#define PSTATE_TLE_MASK	0x100
#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO
#define MAIN_PAGE_VA_IS_RA_ALSO
#define PART0_NZ_RANOTPA_1 500000000
#define PART0_Z_RANOTPA_1 500000000
#define DISABLE_PART_LIMIT_CHECK
#define SKIP_TRAPCHECK
# 440 "diag.j"
# include "hboot.s"
.text
.global main

main:

main_text_start:
    setx MEM_DATA3_START, %r4, %r10
# 461 "diag.j"
    and %r10, 0xfffffffffffff000, %r10
    add %r10, 0x40,  %r19
    add %r10, 0x80,  %r20
    add %r10, 0xc0,  %r21
    add %r10, 0x100, %r22
    add %r10, 0x140, %r25
    add %r10, 0x180, %r27
    add %r10, 0x1c0, %r30

    mov 0x80, %g1
    wr %g1, %g0, %asi
# 513 "diag.j"
	mov %g0, %r29
	not %r29
	xor %r29, 0x3f, %r29  

	mov %g0, %r26

	mov 0x80, %g1
	wr %g1, %g0, %asi
    ta T_CHANGE_PRIV
    ta T_CHANGE_HPRIV
    rdpr %pstate, %g1
    and  %r1, 0xdff, %r1
    wrpr %g0, %r1, %pstate
*/
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
! fork: source strm = 0xffffffffffffffff; target strm = 0x100             
	cmp	%o1, 8
	setx	fork_lbl_0_9, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x200             
	cmp	%o1, 9
	setx	fork_lbl_0_10, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x400             
	cmp	%o1, 10
	setx	fork_lbl_0_11, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x800             
	cmp	%o1, 11
	setx	fork_lbl_0_12, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x1000            
	cmp	%o1, 12
	setx	fork_lbl_0_13, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x2000            
	cmp	%o1, 13
	setx	fork_lbl_0_14, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x4000            
	cmp	%o1, 14
	setx	fork_lbl_0_15, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x8000            
	cmp	%o1, 15
	setx	fork_lbl_0_16, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x10000           
	cmp	%o1, 16
	setx	fork_lbl_0_17, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x20000           
	cmp	%o1, 17
	setx	fork_lbl_0_18, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x40000           
	cmp	%o1, 18
	setx	fork_lbl_0_19, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x80000           
	cmp	%o1, 19
	setx	fork_lbl_0_20, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x100000          
	cmp	%o1, 20
	setx	fork_lbl_0_21, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x200000          
	cmp	%o1, 21
	setx	fork_lbl_0_22, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x400000          
	cmp	%o1, 22
	setx	fork_lbl_0_23, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x800000          
	cmp	%o1, 23
	setx	fork_lbl_0_24, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x1000000         
	cmp	%o1, 24
	setx	fork_lbl_0_25, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x2000000         
	cmp	%o1, 25
	setx	fork_lbl_0_26, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x4000000         
	cmp	%o1, 26
	setx	fork_lbl_0_27, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x8000000         
	cmp	%o1, 27
	setx	fork_lbl_0_28, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x10000000        
	cmp	%o1, 28
	setx	fork_lbl_0_29, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x20000000        
	cmp	%o1, 29
	setx	fork_lbl_0_30, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x40000000        
	cmp	%o1, 30
	setx	fork_lbl_0_31, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x80000000        
	cmp	%o1, 31
	setx	fork_lbl_0_32, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x100000000       
	cmp	%o1, 32
	setx	fork_lbl_0_33, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x200000000       
	cmp	%o1, 33
	setx	fork_lbl_0_34, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x400000000       
	cmp	%o1, 34
	setx	fork_lbl_0_35, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x800000000       
	cmp	%o1, 35
	setx	fork_lbl_0_36, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x1000000000      
	cmp	%o1, 36
	setx	fork_lbl_0_37, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x2000000000      
	cmp	%o1, 37
	setx	fork_lbl_0_38, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x4000000000      
	cmp	%o1, 38
	setx	fork_lbl_0_39, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x8000000000      
	cmp	%o1, 39
	setx	fork_lbl_0_40, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x10000000000     
	cmp	%o1, 40
	setx	fork_lbl_0_41, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x20000000000     
	cmp	%o1, 41
	setx	fork_lbl_0_42, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x40000000000     
	cmp	%o1, 42
	setx	fork_lbl_0_43, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x80000000000     
	cmp	%o1, 43
	setx	fork_lbl_0_44, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x100000000000    
	cmp	%o1, 44
	setx	fork_lbl_0_45, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x200000000000    
	cmp	%o1, 45
	setx	fork_lbl_0_46, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x400000000000    
	cmp	%o1, 46
	setx	fork_lbl_0_47, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x800000000000    
	cmp	%o1, 47
	setx	fork_lbl_0_48, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x1000000000000   
	cmp	%o1, 48
	setx	fork_lbl_0_49, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x2000000000000   
	cmp	%o1, 49
	setx	fork_lbl_0_50, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x4000000000000   
	cmp	%o1, 50
	setx	fork_lbl_0_51, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x8000000000000   
	cmp	%o1, 51
	setx	fork_lbl_0_52, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x10000000000000  
	cmp	%o1, 52
	setx	fork_lbl_0_53, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x20000000000000  
	cmp	%o1, 53
	setx	fork_lbl_0_54, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x40000000000000  
	cmp	%o1, 54
	setx	fork_lbl_0_55, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x80000000000000  
	cmp	%o1, 55
	setx	fork_lbl_0_56, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x100000000000000 
	cmp	%o1, 56
	setx	fork_lbl_0_57, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x200000000000000 
	cmp	%o1, 57
	setx	fork_lbl_0_58, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x400000000000000 
	cmp	%o1, 58
	setx	fork_lbl_0_59, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x800000000000000 
	cmp	%o1, 59
	setx	fork_lbl_0_60, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x1000000000000000
	cmp	%o1, 60
	setx	fork_lbl_0_61, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x2000000000000000
	cmp	%o1, 61
	setx	fork_lbl_0_62, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x4000000000000000
	cmp	%o1, 62
	setx	fork_lbl_0_63, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x8000000000000000
	cmp	%o1, 63
	setx	fork_lbl_0_64, %g2, %g3
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
fork_lbl_0_64:
	.word 0xf4a29c40  ! 63: STWA_R	stwa	%r26, [%r10 + %r0] 0xe2
	.word 0xfaa6dc40  ! 127: STWA_R	stwa	%r29, [%r27 + %r0] 0xe2
	.word 0xfaa69c40  ! 191: STWA_R	stwa	%r29, [%r26 + %r0] 0xe2
	.word 0xf8a59c40  ! 255: STWA_R	stwa	%r28, [%r22 + %r0] 0xe2
	.word 0xb2bba100  ! 319: XNORcc_I	xnorcc 	%r14, 0x0100, %r25
	.word 0xf8a65c40  ! 383: STWA_R	stwa	%r28, [%r25 + %r0] 0xe2
	.word 0xb42e0000  ! 447: ANDN_R	andn 	%r24, %r0, %r26
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_63:
	.word 0xb53e1000  ! 62: SRAX_R	srax	%r24, %r0, %r26
	.word 0xbbb60200  ! 126: ARRAY8	array8	%r24, %r0, %r29
	.word 0xfaa55c40  ! 190: STWA_R	stwa	%r29, [%r21 + %r0] 0xe2
	.word 0xf8a29c40  ! 254: STWA_R	stwa	%r28, [%r10 + %r0] 0xe2
	.word 0xb5361000  ! 318: SRLX_R	srlx	%r24, %r0, %r26
	.word 0xf8a6dc40  ! 382: STWA_R	stwa	%r28, [%r27 + %r0] 0xe2
	.word 0xb70e0000  ! 446: TSUBcc_R	tsubcc 	%r24, %r0, %r27
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_62:
	.word 0xfca65c40  ! 61: STWA_R	stwa	%r30, [%r25 + %r0] 0xe2
	.word 0xb42c20c0  ! 125: ANDN_I	andn 	%r16, 0x00c0, %r26
	.word 0xbaac6040  ! 189: ANDNcc_I	andncc 	%r17, 0x0040, %r29
	.word 0xb8bde000  ! 253: XNORcc_I	xnorcc 	%r23, 0x0000, %r28
	.word 0xbea2e140  ! 317: SUBcc_I	subcc 	%r11, 0x0140, %r31
	.word 0xf8a6dc40  ! 381: STWA_R	stwa	%r28, [%r27 + %r0] 0xe2
	.word 0xbe060000  ! 445: ADD_R	add 	%r24, %r0, %r31
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_61:
	.word 0xbd3dc000  ! 60: SRA_R	sra 	%r23, %r0, %r30
	.word 0xfca51c40  ! 124: STWA_R	stwa	%r30, [%r20 + %r0] 0xe2
	.word 0xf6a29c40  ! 188: STWA_R	stwa	%r27, [%r10 + %r0] 0xe2
	.word 0xfaa65c40  ! 252: STWA_R	stwa	%r29, [%r25 + %r0] 0xe2
	.word 0xfea65c40  ! 316: STWA_R	stwa	%r31, [%r25 + %r0] 0xe2
	.word 0xf8a29c40  ! 380: STWA_R	stwa	%r28, [%r10 + %r0] 0xe2
	.word 0xbbb48000  ! 444: EDGE8	egde8	%r18, %r0, %r29
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_60:
	.word 0xb9b400c0  ! 59: EDGE16L	edge16l	%r16, %r0, %r28
	.word 0xfca29c40  ! 123: STWA_R	stwa	%r30, [%r10 + %r0] 0xe2
	.word 0xf6a29c40  ! 187: STWA_R	stwa	%r27, [%r10 + %r0] 0xe2
	.word 0xbab5c000  ! 251: SUBCcc_R	orncc 	%r23, %r0, %r29
	.word 0xfea29c40  ! 315: STWA_R	stwa	%r31, [%r10 + %r0] 0xe2
	.word 0xb8b60000  ! 379: SUBCcc_R	orncc 	%r24, %r0, %r28
	.word 0xf2a4dc40  ! 443: STWA_R	stwa	%r25, [%r19 + %r0] 0xe2
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_59:
	.word 0xf6a29c40  ! 58: STWA_R	stwa	%r27, [%r10 + %r0] 0xe2
	.word 0xfca4dc40  ! 122: STWA_R	stwa	%r30, [%r19 + %r0] 0xe2
	.word 0xb71e0000  ! 186: TSUBccTV_R	tsubcctv 	%r24, %r0, %r27
	.word 0xfaa59c40  ! 250: STWA_R	stwa	%r29, [%r22 + %r0] 0xe2
	.word 0xbf0e2180  ! 314: TSUBcc_I	tsubcc 	%r24, 0x0180, %r31
	.word 0xb7b5c080  ! 378: EDGE16	 egde16	%r23, %r0, %r27
	.word 0xb2260000  ! 442: SUB_R	sub 	%r24, %r0, %r25
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_58:
	.word 0xb60b4000  ! 57: AND_R	and 	%r13, %r0, %r27
	.word 0xfca55c40  ! 121: STWA_R	stwa	%r30, [%r21 + %r0] 0xe2
	.word 0xb6baa0c0  ! 185: XNORcc_I	xnorcc 	%r10, 0x00c0, %r27
	.word 0xfaa29c40  ! 249: STWA_R	stwa	%r29, [%r10 + %r0] 0xe2
	.word 0xbf35c000  ! 313: SRL_R	srl 	%r23, %r0, %r31
	.word 0xb5b5c040  ! 377: EDGE8L	edge8l	%r23, %r0, %r26
	.word 0xf4a59c40  ! 441: STWA_R	stwa	%r26, [%r22 + %r0] 0xe2
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_57:
	.word 0xbd3dd000  ! 56: SRAX_R	srax	%r23, %r0, %r30
	.word 0xbca2e040  ! 120: SUBcc_I	subcc 	%r11, 0x0040, %r30
	.word 0xf2a29c40  ! 184: STWA_R	stwa	%r25, [%r10 + %r0] 0xe2
	.word 0xbaa5e100  ! 248: SUBcc_I	subcc 	%r23, 0x0100, %r29
	.word 0xbea2c000  ! 312: SUBcc_R	subcc 	%r11, %r0, %r31
	.word 0xf8a65c40  ! 376: STWA_R	stwa	%r28, [%r25 + %r0] 0xe2
	.word 0xb4ae0000  ! 440: ANDNcc_R	andncc 	%r24, %r0, %r26
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_56:
	.word 0xb5b380c0  ! 55: EDGE16L	edge16l	%r14, %r0, %r26
	.word 0xfaa29c40  ! 119: STWA_R	stwa	%r29, [%r10 + %r0] 0xe2
	.word 0xb2260000  ! 183: SUB_R	sub 	%r24, %r0, %r25
	.word 0xf2a4dc40  ! 247: STWA_R	stwa	%r25, [%r19 + %r0] 0xe2
	.word 0xfaa29c40  ! 311: STWA_R	stwa	%r29, [%r10 + %r0] 0xe2
	.word 0xb9b60020  ! 375: EDGE8N	edge8n	%r24, %r0, %r28
	.word 0xba85e140  ! 439: ADDcc_I	addcc 	%r23, 0x0140, %r29
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_55:
	.word 0xfca29c40  ! 54: STWA_R	stwa	%r30, [%r10 + %r0] 0xe2
	.word 0xbb3ba001  ! 118: SRA_I	sra 	%r14, 0x0001, %r29
	.word 0xb8460000  ! 182: ADDC_R	addc 	%r24, %r0, %r28
	.word 0xb2b5e040  ! 246: SUBCcc_I	orncc 	%r23, 0x0040, %r25
	.word 0xbb360000  ! 310: SRL_R	srl 	%r24, %r0, %r29
	.word 0xfca29c40  ! 374: STWA_R	stwa	%r30, [%r10 + %r0] 0xe2
	.word 0xbbb5c240  ! 438: ARRAY16	array16	%r23, %r0, %r29
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_54:
	.word 0xbdb60200  ! 53: ARRAY8	array8	%r24, %r0, %r30
	.word 0xfca51c40  ! 117: STWA_R	stwa	%r30, [%r20 + %r0] 0xe2
	.word 0xfca51c40  ! 181: STWA_R	stwa	%r30, [%r20 + %r0] 0xe2
	.word 0xbdb5c0a0  ! 245: EDGE16N	edge16n	%r23, %r0, %r30
	.word 0xbc362000  ! 309: ORN_I	orn 	%r24, 0x0000, %r30
	.word 0xfca29c40  ! 373: STWA_R	stwa	%r30, [%r10 + %r0] 0xe2
	.word 0xf2a29c40  ! 437: STWA_R	stwa	%r25, [%r10 + %r0] 0xe2
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_53:
	.word 0xb33b8000  ! 52: SRA_R	sra 	%r14, %r0, %r25
	.word 0xbc3dc000  ! 116: XNOR_R	xnor 	%r23, %r0, %r30
	.word 0xfca29c40  ! 180: STWA_R	stwa	%r30, [%r10 + %r0] 0xe2
	.word 0xb71dc000  ! 244: TSUBccTV_R	tsubcctv 	%r23, %r0, %r27
	.word 0xb4a5c000  ! 308: SUBcc_R	subcc 	%r23, %r0, %r26
	.word 0xbd35f001  ! 372: SRLX_I	srlx	%r23, 0x0001, %r30
	.word 0xf2a69c40  ! 436: STWA_R	stwa	%r25, [%r26 + %r0] 0xe2
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_52:
	.word 0xf4a29c40  ! 51: STWA_R	stwa	%r26, [%r10 + %r0] 0xe2
	.word 0xfea69c40  ! 115: STWA_R	stwa	%r31, [%r26 + %r0] 0xe2
	.word 0xbc8e2000  ! 179: ANDcc_I	andcc 	%r24, 0x0000, %r30
	.word 0xbdb2c140  ! 243: EDGE32L	edge32l	%r11, %r0, %r30
	.word 0xfca69c40  ! 307: STWA_R	stwa	%r30, [%r26 + %r0] 0xe2
	.word 0xf2a59c40  ! 371: STWA_R	stwa	%r25, [%r22 + %r0] 0xe2
	.word 0xb205c000  ! 435: ADD_R	add 	%r23, %r0, %r25
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_51:
	.word 0xb43c2100  ! 50: XNOR_I	xnor 	%r16, 0x0100, %r26
	.word 0xfea55c40  ! 114: STWA_R	stwa	%r31, [%r21 + %r0] 0xe2
	.word 0x01000000  ! 178: NOP	nop
	.word 0xb52df001  ! 242: SLLX_I	sllx	%r23, 0x0001, %r26
	.word 0xfca29c40  ! 306: STWA_R	stwa	%r30, [%r10 + %r0] 0xe2
	.word 0xf2a29c40  ! 370: STWA_R	stwa	%r25, [%r10 + %r0] 0xe2
	.word 0xf4a65c40  ! 434: STWA_R	stwa	%r26, [%r25 + %r0] 0xe2
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_50:
	.word 0xf4a6dc40  ! 49: STWA_R	stwa	%r26, [%r27 + %r0] 0xe2
	.word 0xbfb3c080  ! 113: EDGE16	 egde16	%r15, %r0, %r31
	.word 0xfaa6dc40  ! 177: STWA_R	stwa	%r29, [%r27 + %r0] 0xe2
	.word 0xb31e0000  ! 241: TSUBccTV_R	tsubcctv 	%r24, %r0, %r25
	.word 0xbdb60080  ! 305: EDGE16	 egde16	%r24, %r0, %r30
	.word 0xf2a29c40  ! 369: STWA_R	stwa	%r25, [%r10 + %r0] 0xe2
	.word 0xf4a55c40  ! 433: STWA_R	stwa	%r26, [%r21 + %r0] 0xe2
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_49:
	.word 0xb53e3001  ! 48: SRAX_I	srax	%r24, 0x0001, %r26
	.word 0xfea29c40  ! 112: STWA_R	stwa	%r31, [%r10 + %r0] 0xe2
	.word 0xbac42080  ! 176: ADDCcc_I	addccc 	%r16, 0x0080, %r29
	.word 0xfca29c40  ! 240: STWA_R	stwa	%r30, [%r10 + %r0] 0xe2
	.word 0xb22ac000  ! 304: ANDN_R	andn 	%r11, %r0, %r25
	.word 0xf2a29c40  ! 368: STWA_R	stwa	%r25, [%r10 + %r0] 0xe2
	.word 0xf4a4dc40  ! 432: STWA_R	stwa	%r26, [%r19 + %r0] 0xe2
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_48:
	.word 0xfca6dc40  ! 47: STWA_R	stwa	%r30, [%r27 + %r0] 0xe2
	.word 0xfea6dc40  ! 111: STWA_R	stwa	%r31, [%r27 + %r0] 0xe2
	.word 0xfaa4dc40  ! 175: STWA_R	stwa	%r29, [%r19 + %r0] 0xe2
	.word 0xbc0e20c0  ! 239: AND_I	and 	%r24, 0x00c0, %r30
	.word 0xfea59c40  ! 303: STWA_R	stwa	%r31, [%r22 + %r0] 0xe2
	.word 0xb285c000  ! 367: ADDcc_R	addcc 	%r23, %r0, %r25
	.word 0xf4a55c40  ! 431: STWA_R	stwa	%r26, [%r21 + %r0] 0xe2
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_47:
	.word 0xbc862100  ! 46: ADDcc_I	addcc 	%r24, 0x0100, %r30
	.word 0xbe460000  ! 110: ADDC_R	addc 	%r24, %r0, %r31
	.word 0xba35e140  ! 174: ORN_I	orn 	%r23, 0x0140, %r29
	.word 0xf8a29c40  ! 238: STWA_R	stwa	%r28, [%r10 + %r0] 0xe2
	.word 0xbf3e1000  ! 302: SRAX_R	srax	%r24, %r0, %r31
	.word 0xf4a59c40  ! 366: STWA_R	stwa	%r26, [%r22 + %r0] 0xe2
	.word 0xf4a65c40  ! 430: STWA_R	stwa	%r26, [%r25 + %r0] 0xe2
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_46:
	.word 0xb73e0000  ! 45: SRA_R	sra 	%r24, %r0, %r27
	.word 0xf4a59c40  ! 109: STWA_R	stwa	%r26, [%r22 + %r0] 0xe2
	.word 0xf4a6dc40  ! 173: STWA_R	stwa	%r26, [%r27 + %r0] 0xe2
	.word 0xb885e140  ! 237: ADDcc_I	addcc 	%r23, 0x0140, %r28
	.word 0xfca6dc40  ! 301: STWA_R	stwa	%r30, [%r27 + %r0] 0xe2
	.word 0xf4a6dc40  ! 365: STWA_R	stwa	%r26, [%r27 + %r0] 0xe2
	.word 0xb495c000  ! 429: ORcc_R	orcc 	%r23, %r0, %r26
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_45:
	.word 0xfca29c40  ! 44: STWA_R	stwa	%r30, [%r10 + %r0] 0xe2
	.word 0xf4a29c40  ! 108: STWA_R	stwa	%r26, [%r10 + %r0] 0xe2
	.word 0xb52df001  ! 172: SLLX_I	sllx	%r23, 0x0001, %r26
	.word 0xbc948000  ! 236: ORcc_R	orcc 	%r18, %r0, %r30
	.word 0xbc330000  ! 300: ORN_R	orn 	%r12, %r0, %r30
	.word 0xb4be2000  ! 364: XNORcc_I	xnorcc 	%r24, 0x0000, %r26
	.word 0xb2340000  ! 428: SUBC_R	orn 	%r16, %r0, %r25
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_44:
	.word 0xbdb60100  ! 43: EDGE32	egde32	%r24, %r0, %r30
	.word 0xb42c0000  ! 107: ANDN_R	andn 	%r16, %r0, %r26
	.word 0xfca69c40  ! 171: STWA_R	stwa	%r30, [%r26 + %r0] 0xe2
	.word 0xbf15c000  ! 235: TADDccTV_R	taddcctv 	%r23, %r0, %r31
	.word 0xfaa6dc40  ! 299: STWA_R	stwa	%r29, [%r27 + %r0] 0xe2
	.word 0xfaa29c40  ! 363: STWA_R	stwa	%r29, [%r10 + %r0] 0xe2
	.word 0xb7b5c280  ! 427: ARRAY32	array32	%r23, %r0, %r27
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_43:
	.word 0xfca59c40  ! 42: STWA_R	stwa	%r30, [%r22 + %r0] 0xe2
	.word 0xf6a69c40  ! 106: STWA_R	stwa	%r27, [%r26 + %r0] 0xe2
	.word 0xfca29c40  ! 170: STWA_R	stwa	%r30, [%r10 + %r0] 0xe2
	.word 0xfea6dc40  ! 234: STWA_R	stwa	%r31, [%r27 + %r0] 0xe2
	.word 0xbb337001  ! 298: SRLX_I	srlx	%r13, 0x0001, %r29
	.word 0xbbb60000  ! 362: EDGE8	egde8	%r24, %r0, %r29
	.word 0xf6a59c40  ! 426: STWA_R	stwa	%r27, [%r22 + %r0] 0xe2
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_42:
	.word 0xfca29c40  ! 41: STWA_R	stwa	%r30, [%r10 + %r0] 0xe2
	.word 0xb6b5c000  ! 105: SUBCcc_R	orncc 	%r23, %r0, %r27
	.word 0xfca55c40  ! 169: STWA_R	stwa	%r30, [%r21 + %r0] 0xe2
	.word 0xbf3e0000  ! 233: SRA_R	sra 	%r24, %r0, %r31
	.word 0xf4a69c40  ! 297: STWA_R	stwa	%r26, [%r26 + %r0] 0xe2
	.word 0xfca65c40  ! 361: STWA_R	stwa	%r30, [%r25 + %r0] 0xe2
	.word 0xb6a60000  ! 425: SUBcc_R	subcc 	%r24, %r0, %r27
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_41:
	.word 0xfca29c40  ! 40: STWA_R	stwa	%r30, [%r10 + %r0] 0xe2
	.word 0xb72e3001  ! 104: SLLX_I	sllx	%r24, 0x0001, %r27
	.word 0xbdb5c0e0  ! 168: EDGE16LN	edge16ln	%r23, %r0, %r30
	.word 0xbb0dc000  ! 232: TSUBcc_R	tsubcc 	%r23, %r0, %r29
	.word 0x01000000  ! 296: NOP	nop
	.word 0xfca51c40  ! 360: STWA_R	stwa	%r30, [%r20 + %r0] 0xe2
	.word 0xbdb44100  ! 424: EDGE32	egde32	%r17, %r0, %r30
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_40:
	.word 0xfca51c40  ! 39: STWA_R	stwa	%r30, [%r20 + %r0] 0xe2
	.word 0xb61ac000  ! 103: XOR_R	xor 	%r11, %r0, %r27
	.word 0xfea55c40  ! 167: STWA_R	stwa	%r31, [%r21 + %r0] 0xe2
	.word 0x01000000  ! 231: NOP	nop
	.word 0xf4a4dc40  ! 295: STWA_R	stwa	%r26, [%r19 + %r0] 0xe2
	.word 0xfca65c40  ! 359: STWA_R	stwa	%r30, [%r25 + %r0] 0xe2
	.word 0xb645e100  ! 423: ADDC_I	addc 	%r23, 0x0100, %r27
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_39:
	.word 0xfca29c40  ! 38: STWA_R	stwa	%r30, [%r10 + %r0] 0xe2
	.word 0xf6a51c40  ! 102: STWA_R	stwa	%r27, [%r20 + %r0] 0xe2
	.word 0xfea65c40  ! 166: STWA_R	stwa	%r31, [%r25 + %r0] 0xe2
	.word 0xfaa29c40  ! 230: STWA_R	stwa	%r29, [%r10 + %r0] 0xe2
	.word 0xb435c000  ! 294: SUBC_R	orn 	%r23, %r0, %r26
	.word 0xbc9e0000  ! 358: XORcc_R	xorcc 	%r24, %r0, %r30
	.word 0xbcc60000  ! 422: ADDCcc_R	addccc 	%r24, %r0, %r30
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_38:
	.word 0xfca29c40  ! 37: STWA_R	stwa	%r30, [%r10 + %r0] 0xe2
	.word 0xb6b2a180  ! 101: SUBCcc_I	orncc 	%r10, 0x0180, %r27
	.word 0xbf15e0c0  ! 165: TADDccTV_I	taddcctv 	%r23, 0x00c0, %r31
	.word 0xbab62180  ! 229: ORNcc_I	orncc 	%r24, 0x0180, %r29
	.word 0xf2a29c40  ! 293: STWA_R	stwa	%r25, [%r10 + %r0] 0xe2
	.word 0xb3b5c060  ! 357: EDGE8LN	edge8ln	%r23, %r0, %r25
	.word 0xfea59c40  ! 421: STWA_R	stwa	%r31, [%r22 + %r0] 0xe2
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_37:
	.word 0xfca6dc40  ! 36: STWA_R	stwa	%r30, [%r27 + %r0] 0xe2
	.word 0xf4a29c40  ! 100: STWA_R	stwa	%r26, [%r10 + %r0] 0xe2
	.word 0xf4a29c40  ! 164: STWA_R	stwa	%r26, [%r10 + %r0] 0xe2
	.word 0xbbb5c0a0  ! 228: EDGE16N	edge16n	%r23, %r0, %r29
	.word 0xb2840000  ! 292: ADDcc_R	addcc 	%r16, %r0, %r25
	.word 0xf6a29c40  ! 356: STWA_R	stwa	%r27, [%r10 + %r0] 0xe2
	.word 0xfea69c40  ! 420: STWA_R	stwa	%r31, [%r26 + %r0] 0xe2
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_36:
	.word 0xfca55c40  ! 35: STWA_R	stwa	%r30, [%r21 + %r0] 0xe2
	.word 0xf4a4dc40  ! 99: STWA_R	stwa	%r26, [%r19 + %r0] 0xe2
	.word 0xb5362001  ! 163: SRL_I	srl 	%r24, 0x0001, %r26
	.word 0xb8834000  ! 227: ADDcc_R	addcc 	%r13, %r0, %r28
	.word 0xf8a29c40  ! 291: STWA_R	stwa	%r28, [%r10 + %r0] 0xe2
	.word 0xb69de040  ! 355: XORcc_I	xorcc 	%r23, 0x0040, %r27
	.word 0xbe45c000  ! 419: ADDC_R	addc 	%r23, %r0, %r31
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_35:
	.word 0xbdb44200  ! 34: ARRAY8	array8	%r17, %r0, %r30
	.word 0xb5b60100  ! 98: EDGE32	egde32	%r24, %r0, %r26
	.word 0xf4a59c40  ! 162: STWA_R	stwa	%r26, [%r22 + %r0] 0xe2
	.word 0xb9b340e0  ! 226: EDGE16LN	edge16ln	%r13, %r0, %r28
	.word 0xf8a65c40  ! 290: STWA_R	stwa	%r28, [%r25 + %r0] 0xe2
	.word 0xfea6dc40  ! 354: STWA_R	stwa	%r31, [%r27 + %r0] 0xe2
	.word 0xb485c000  ! 418: ADDcc_R	addcc 	%r23, %r0, %r26
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_34:
	.word 0xfaa4dc40  ! 33: STWA_R	stwa	%r29, [%r19 + %r0] 0xe2
	.word 0xf4a55c40  ! 97: STWA_R	stwa	%r26, [%r21 + %r0] 0xe2
	.word 0xf4a69c40  ! 161: STWA_R	stwa	%r26, [%r26 + %r0] 0xe2
	.word 0xfea65c40  ! 225: STWA_R	stwa	%r31, [%r25 + %r0] 0xe2
	.word 0xf8a29c40  ! 289: STWA_R	stwa	%r28, [%r10 + %r0] 0xe2
	.word 0xbfb280a0  ! 353: EDGE16N	edge16n	%r10, %r0, %r31
	.word 0xfaa29c40  ! 417: STWA_R	stwa	%r29, [%r10 + %r0] 0xe2
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_33:
	.word 0xfaa4dc40  ! 32: STWA_R	stwa	%r29, [%r19 + %r0] 0xe2
	.word 0xb4aaa140  ! 96: ANDNcc_I	andncc 	%r10, 0x0140, %r26
	.word 0xb435e080  ! 160: ORN_I	orn 	%r23, 0x0080, %r26
	.word 0xbe1c8000  ! 224: XOR_R	xor 	%r18, %r0, %r31
	.word 0xf8a29c40  ! 288: STWA_R	stwa	%r28, [%r10 + %r0] 0xe2
	.word 0xf4a29c40  ! 352: STWA_R	stwa	%r26, [%r10 + %r0] 0xe2
	.word 0xbb362001  ! 416: SRL_I	srl 	%r24, 0x0001, %r29
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_32:
	.word 0xfaa29c40  ! 31: STWA_R	stwa	%r29, [%r10 + %r0] 0xe2
	.word 0xb70dc000  ! 95: TSUBcc_R	tsubcc 	%r23, %r0, %r27
	.word 0xf4a29c40  ! 159: STWA_R	stwa	%r26, [%r10 + %r0] 0xe2
	.word 0xf2a69c40  ! 223: STWA_R	stwa	%r25, [%r26 + %r0] 0xe2
	.word 0xf8a65c40  ! 287: STWA_R	stwa	%r28, [%r25 + %r0] 0xe2
	.word 0xf4a55c40  ! 351: STWA_R	stwa	%r26, [%r21 + %r0] 0xe2
	.word 0xfea29c40  ! 415: STWA_R	stwa	%r31, [%r10 + %r0] 0xe2
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_31:
	.word 0xfaa29c40  ! 30: STWA_R	stwa	%r29, [%r10 + %r0] 0xe2
	.word 0xbeb48000  ! 94: ORNcc_R	orncc 	%r18, %r0, %r31
	.word 0xb4860000  ! 158: ADDcc_R	addcc 	%r24, %r0, %r26
	.word 0xb3b340c0  ! 222: EDGE16L	edge16l	%r13, %r0, %r25
	.word 0xb934b001  ! 286: SRLX_I	srlx	%r18, 0x0001, %r28
	.word 0xb5b5c0e0  ! 350: EDGE16LN	edge16ln	%r23, %r0, %r26
	.word 0xbf0de140  ! 414: TSUBcc_I	tsubcc 	%r23, 0x0140, %r31
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_30:
	.word 0xfaa6dc40  ! 29: STWA_R	stwa	%r29, [%r27 + %r0] 0xe2
	.word 0xb3062140  ! 93: TADDcc_I	taddcc 	%r24, 0x0140, %r25
	.word 0xfea29c40  ! 157: STWA_R	stwa	%r31, [%r10 + %r0] 0xe2
	.word 0xb635e040  ! 221: SUBC_I	orn 	%r23, 0x0040, %r27
	.word 0xb8960000  ! 285: ORcc_R	orcc 	%r24, %r0, %r28
	.word 0xf6a65c40  ! 349: STWA_R	stwa	%r27, [%r25 + %r0] 0xe2
	.word 0xf2a69c40  ! 413: STWA_R	stwa	%r25, [%r26 + %r0] 0xe2
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_29:
	.word 0xfaa6dc40  ! 28: STWA_R	stwa	%r29, [%r27 + %r0] 0xe2
	.word 0xb8360000  ! 92: ORN_R	orn 	%r24, %r0, %r28
	.word 0xfea6dc40  ! 156: STWA_R	stwa	%r31, [%r27 + %r0] 0xe2
	.word 0xf6a69c40  ! 220: STWA_R	stwa	%r27, [%r26 + %r0] 0xe2
	.word 0xf4a29c40  ! 284: STWA_R	stwa	%r26, [%r10 + %r0] 0xe2
	.word 0xf6a4dc40  ! 348: STWA_R	stwa	%r27, [%r19 + %r0] 0xe2
	.word 0xb335d000  ! 412: SRLX_R	srlx	%r23, %r0, %r25
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_28:
	.word 0xbb0e2140  ! 27: TSUBcc_I	tsubcc 	%r24, 0x0140, %r29
	.word 0xf6a29c40  ! 91: STWA_R	stwa	%r27, [%r10 + %r0] 0xe2
	.word 0xfea69c40  ! 155: STWA_R	stwa	%r31, [%r26 + %r0] 0xe2
	.word 0xf6a59c40  ! 219: STWA_R	stwa	%r27, [%r22 + %r0] 0xe2
	.word 0xb40de000  ! 283: AND_I	and 	%r23, 0x0000, %r26
	.word 0xb62dc000  ! 347: ANDN_R	andn 	%r23, %r0, %r27
	.word 0xbd2b8000  ! 411: SLL_R	sll 	%r14, %r0, %r30
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_27:
	.word 0xf8a69c40  ! 26: STWA_R	stwa	%r28, [%r26 + %r0] 0xe2
	.word 0xf6a65c40  ! 90: STWA_R	stwa	%r27, [%r25 + %r0] 0xe2
	.word 0xfea65c40  ! 154: STWA_R	stwa	%r31, [%r25 + %r0] 0xe2
	.word 0xb6be0000  ! 218: XNORcc_R	xnorcc 	%r24, %r0, %r27
	.word 0xb7b5c000  ! 282: EDGE8	egde8	%r23, %r0, %r27
	.word 0xf8a29c40  ! 346: STWA_R	stwa	%r28, [%r10 + %r0] 0xe2
	.word 0xf2a65c40  ! 410: STWA_R	stwa	%r25, [%r25 + %r0] 0xe2
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_26:
	.word 0xb80e2180  ! 25: AND_I	and 	%r24, 0x0180, %r28
	.word 0xb635c000  ! 89: SUBC_R	orn 	%r23, %r0, %r27
	.word 0xbe1aa080  ! 153: XOR_I	xor 	%r10, 0x0080, %r31
	.word 0xbe144000  ! 217: OR_R	or 	%r17, %r0, %r31
	.word 0xfea6dc40  ! 281: STWA_R	stwa	%r31, [%r27 + %r0] 0xe2
	.word 0xf8a29c40  ! 345: STWA_R	stwa	%r28, [%r10 + %r0] 0xe2
	.word 0xb2246180  ! 409: SUB_I	sub 	%r17, 0x0180, %r25
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_25:
	.word 0xf6a55c40  ! 24: STWA_R	stwa	%r27, [%r21 + %r0] 0xe2
	.word 0xb412c000  ! 88: OR_R	or 	%r11, %r0, %r26
	.word 0xbcbe0000  ! 152: XNORcc_R	xnorcc 	%r24, %r0, %r30
	.word 0xfaa51c40  ! 216: STWA_R	stwa	%r29, [%r20 + %r0] 0xe2
	.word 0xbeb40000  ! 280: ORNcc_R	orncc 	%r16, %r0, %r31
	.word 0xb935e001  ! 344: SRL_I	srl 	%r23, 0x0001, %r28
	.word 0x35000100  ! 408: SETHI	sethi	0x00000100, %r26
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_24:
	.word 0xf6a65c40  ! 23: STWA_R	stwa	%r27, [%r25 + %r0] 0xe2
	.word 0xfaa29c40  ! 87: STWA_R	stwa	%r29, [%r10 + %r0] 0xe2
	.word 0xf8a29c40  ! 151: STWA_R	stwa	%r28, [%r10 + %r0] 0xe2
	.word 0xba45e080  ! 215: ADDC_I	addc 	%r23, 0x0080, %r29
	.word 0xfea29c40  ! 279: STWA_R	stwa	%r31, [%r10 + %r0] 0xe2
	.word 0xfaa29c40  ! 343: STWA_R	stwa	%r29, [%r10 + %r0] 0xe2
	.word 0xb4a5c000  ! 407: SUBcc_R	subcc 	%r23, %r0, %r26
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_23:
	.word 0xb7b40280  ! 22: ARRAY32	array32	%r16, %r0, %r27
	.word 0xfaa69c40  ! 86: STWA_R	stwa	%r29, [%r26 + %r0] 0xe2
	.word 0xf8a29c40  ! 150: STWA_R	stwa	%r28, [%r10 + %r0] 0xe2
	.word 0xfca51c40  ! 214: STWA_R	stwa	%r30, [%r20 + %r0] 0xe2
	.word 0xbfb5c160  ! 278: EDGE32LN	edge32ln	%r23, %r0, %r31
	.word 0xfaa55c40  ! 342: STWA_R	stwa	%r29, [%r21 + %r0] 0xe2
	.word 0xfea29c40  ! 406: STWA_R	stwa	%r31, [%r10 + %r0] 0xe2
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_22:
	.word 0xfca29c40  ! 21: STWA_R	stwa	%r30, [%r10 + %r0] 0xe2
	.word 0xba8e0000  ! 85: ANDcc_R	andcc 	%r24, %r0, %r29
	.word 0xb9b5c0c0  ! 149: EDGE16L	edge16l	%r23, %r0, %r28
	.word 0xbc25e0c0  ! 213: SUB_I	sub 	%r23, 0x00c0, %r30
	.word 0xf2a4dc40  ! 277: STWA_R	stwa	%r25, [%r19 + %r0] 0xe2
	.word 0xfaa29c40  ! 341: STWA_R	stwa	%r29, [%r10 + %r0] 0xe2
	.word 0xfea29c40  ! 405: STWA_R	stwa	%r31, [%r10 + %r0] 0xe2
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_21:
	.word 0xfca4dc40  ! 20: STWA_R	stwa	%r30, [%r19 + %r0] 0xe2
	.word 0xb5160000  ! 84: TADDccTV_R	taddcctv 	%r24, %r0, %r26
	.word 0xf6a69c40  ! 148: STWA_R	stwa	%r27, [%r26 + %r0] 0xe2
	.word 0xba3de140  ! 212: XNOR_I	xnor 	%r23, 0x0140, %r29
	.word 0xf2a51c40  ! 276: STWA_R	stwa	%r25, [%r20 + %r0] 0xe2
	.word 0xba12a000  ! 340: OR_I	or 	%r10, 0x0000, %r29
	.word 0xfea55c40  ! 404: STWA_R	stwa	%r31, [%r21 + %r0] 0xe2
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_20:
	.word 0xbc9be080  ! 19: XORcc_I	xorcc 	%r15, 0x0080, %r30
	.word 0xfaa29c40  ! 83: STWA_R	stwa	%r29, [%r10 + %r0] 0xe2
	.word 0xf6a29c40  ! 147: STWA_R	stwa	%r27, [%r10 + %r0] 0xe2
	.word 0xb6060000  ! 211: ADD_R	add 	%r24, %r0, %r27
	.word 0xb32af001  ! 275: SLLX_I	sllx	%r11, 0x0001, %r25
	.word 0xf8a59c40  ! 339: STWA_R	stwa	%r28, [%r22 + %r0] 0xe2
	.word 0xfea29c40  ! 403: STWA_R	stwa	%r31, [%r10 + %r0] 0xe2
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_19:
	.word 0xfaa29c40  ! 18: STWA_R	stwa	%r29, [%r10 + %r0] 0xe2
	.word 0xbbb340a0  ! 82: EDGE16N	edge16n	%r13, %r0, %r29
	.word 0xb6bc8000  ! 146: XNORcc_R	xnorcc 	%r18, %r0, %r27
	.word 0xbd15c000  ! 210: TADDccTV_R	taddcctv 	%r23, %r0, %r30
	.word 0xfaa29c40  ! 274: STWA_R	stwa	%r29, [%r10 + %r0] 0xe2
	.word 0xf8a29c40  ! 338: STWA_R	stwa	%r28, [%r10 + %r0] 0xe2
	.word 0xbf0c6080  ! 402: TSUBcc_I	tsubcc 	%r17, 0x0080, %r31
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_18:
	.word 0xbac60000  ! 17: ADDCcc_R	addccc 	%r24, %r0, %r29
	.word 0xf4a29c40  ! 81: STWA_R	stwa	%r26, [%r10 + %r0] 0xe2
	.word 0xf4a6dc40  ! 145: STWA_R	stwa	%r26, [%r27 + %r0] 0xe2
	.word 0xbc862080  ! 209: ADDcc_I	addcc 	%r24, 0x0080, %r30
	.word 0xfaa4dc40  ! 273: STWA_R	stwa	%r29, [%r19 + %r0] 0xe2
	.word 0xb83621c0  ! 337: ORN_I	orn 	%r24, 0x01c0, %r28
	.word 0x01000000  ! 401: NOP	nop
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_17:
	.word 0xb8c60000  ! 16: ADDCcc_R	addccc 	%r24, %r0, %r28
	.word 0xf4a55c40  ! 80: STWA_R	stwa	%r26, [%r21 + %r0] 0xe2
	.word 0x350001c0  ! 144: SETHI	sethi	0x000001c0, %r26
	.word 0xf2a29c40  ! 208: STWA_R	stwa	%r25, [%r10 + %r0] 0xe2
	.word 0xba3b0000  ! 272: XNOR_R	xnor 	%r12, %r0, %r29
	.word 0xfca29c40  ! 336: STWA_R	stwa	%r30, [%r10 + %r0] 0xe2
	.word 0xbaa38000  ! 400: SUBcc_R	subcc 	%r14, %r0, %r29
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_16:
	.word 0xb5b5c020  ! 15: EDGE8N	edge8n	%r23, %r0, %r26
	.word 0xf4a29c40  ! 79: STWA_R	stwa	%r26, [%r10 + %r0] 0xe2
	.word 0xfea51c40  ! 143: STWA_R	stwa	%r31, [%r20 + %r0] 0xe2
	.word 0xb2360000  ! 207: SUBC_R	orn 	%r24, %r0, %r25
	.word 0xb53e2001  ! 271: SRA_I	sra 	%r24, 0x0001, %r26
	.word 0xbdb30240  ! 335: ARRAY16	array16	%r12, %r0, %r30
	.word 0xb92ca001  ! 399: SLL_I	sll 	%r18, 0x0001, %r28
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_15:
	.word 0xfaa29c40  ! 14: STWA_R	stwa	%r29, [%r10 + %r0] 0xe2
	.word 0xb505e080  ! 78: TADDcc_I	taddcc 	%r23, 0x0080, %r26
	.word 0xfea29c40  ! 142: STWA_R	stwa	%r31, [%r10 + %r0] 0xe2
	.word 0xfaa29c40  ! 206: STWA_R	stwa	%r29, [%r10 + %r0] 0xe2
	.word 0xbeae20c0  ! 270: ANDNcc_I	andncc 	%r24, 0x00c0, %r31
	.word 0xf2a55c40  ! 334: STWA_R	stwa	%r25, [%r21 + %r0] 0xe2
	.word 0xbd334000  ! 398: SRL_R	srl 	%r13, %r0, %r30
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_14:
	.word 0xbb35c000  ! 13: SRL_R	srl 	%r23, %r0, %r29
	.word 0xf6a59c40  ! 77: STWA_R	stwa	%r27, [%r22 + %r0] 0xe2
	.word 0xfea65c40  ! 141: STWA_R	stwa	%r31, [%r25 + %r0] 0xe2
	.word 0xfaa65c40  ! 205: STWA_R	stwa	%r29, [%r25 + %r0] 0xe2
	.word 0xbdb5c140  ! 269: EDGE32L	edge32l	%r23, %r0, %r30
	.word 0xb235e100  ! 333: ORN_I	orn 	%r23, 0x0100, %r25
	.word 0xfca69c40  ! 397: STWA_R	stwa	%r30, [%r26 + %r0] 0xe2
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_13:
	.word 0xbdb60160  ! 12: EDGE32LN	edge32ln	%r24, %r0, %r30
	.word 0xf6a51c40  ! 76: STWA_R	stwa	%r27, [%r20 + %r0] 0xe2
	.word 0xbf3e1000  ! 140: SRAX_R	srax	%r24, %r0, %r31
	.word 0xbbb60160  ! 204: EDGE32LN	edge32ln	%r24, %r0, %r29
	.word 0xf4a69c40  ! 268: STWA_R	stwa	%r26, [%r26 + %r0] 0xe2
	.word 0xfaa29c40  ! 332: STWA_R	stwa	%r29, [%r10 + %r0] 0xe2
	.word 0xfca6dc40  ! 396: STWA_R	stwa	%r30, [%r27 + %r0] 0xe2
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_12:
	.word 0xbcc60000  ! 11: ADDCcc_R	addccc 	%r24, %r0, %r30
	.word 0xf6a51c40  ! 75: STWA_R	stwa	%r27, [%r20 + %r0] 0xe2
	.word 0xbdb380a0  ! 139: EDGE16N	edge16n	%r14, %r0, %r30
	.word 0xb92dc000  ! 203: SLL_R	sll 	%r23, %r0, %r28
	.word 0xf4a29c40  ! 267: STWA_R	stwa	%r26, [%r10 + %r0] 0xe2
	.word 0xbbb2c060  ! 331: EDGE8LN	edge8ln	%r11, %r0, %r29
	.word 0xbca60000  ! 395: SUBcc_R	subcc 	%r24, %r0, %r30
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_11:
	.word 0xf8a59c40  ! 10: STWA_R	stwa	%r28, [%r22 + %r0] 0xe2
	.word 0xb6360000  ! 74: SUBC_R	orn 	%r24, %r0, %r27
	.word 0xfca65c40  ! 138: STWA_R	stwa	%r30, [%r25 + %r0] 0xe2
	.word 0xfaa29c40  ! 202: STWA_R	stwa	%r29, [%r10 + %r0] 0xe2
	.word 0xf4a69c40  ! 266: STWA_R	stwa	%r26, [%r26 + %r0] 0xe2
	.word 0xb9363001  ! 330: SRLX_I	srlx	%r24, 0x0001, %r28
	.word 0xbfb5c0a0  ! 394: EDGE16N	edge16n	%r23, %r0, %r31
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_10:
	.word 0xf8a51c40  ! 9: STWA_R	stwa	%r28, [%r20 + %r0] 0xe2
	.word 0xb32e0000  ! 73: SLL_R	sll 	%r24, %r0, %r25
	.word 0xfca29c40  ! 137: STWA_R	stwa	%r30, [%r10 + %r0] 0xe2
	.word 0xbbb60020  ! 201: EDGE8N	edge8n	%r24, %r0, %r29
	.word 0xb4060000  ! 265: ADD_R	add 	%r24, %r0, %r26
	.word 0xb5b60020  ! 329: EDGE8N	edge8n	%r24, %r0, %r26
	.word 0xb8b5c000  ! 393: ORNcc_R	orncc 	%r23, %r0, %r28
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_9:
	.word 0xf8a55c40  ! 8: STWA_R	stwa	%r28, [%r21 + %r0] 0xe2
	.word 0xba0e2140  ! 72: AND_I	and 	%r24, 0x0140, %r29
	.word 0xfca59c40  ! 136: STWA_R	stwa	%r30, [%r22 + %r0] 0xe2
	.word 0xfea6dc40  ! 200: STWA_R	stwa	%r31, [%r27 + %r0] 0xe2
	.word 0xbbb60040  ! 264: EDGE8L	edge8l	%r24, %r0, %r29
	.word 0xb7363001  ! 328: SRLX_I	srlx	%r24, 0x0001, %r27
	.word 0xf8a65c40  ! 392: STWA_R	stwa	%r28, [%r25 + %r0] 0xe2
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_8:
	.word 0xf8a29c40  ! 7: STWA_R	stwa	%r28, [%r10 + %r0] 0xe2
	.word 0xf6a4dc40  ! 71: STWA_R	stwa	%r27, [%r19 + %r0] 0xe2
	.word 0xbc0dc000  ! 135: AND_R	and 	%r23, %r0, %r30
	.word 0xfea4dc40  ! 199: STWA_R	stwa	%r31, [%r19 + %r0] 0xe2
	.word 0xfea65c40  ! 263: STWA_R	stwa	%r31, [%r25 + %r0] 0xe2
	.word 0xb4a60000  ! 327: SUBcc_R	subcc 	%r24, %r0, %r26
	.word 0xb8bde040  ! 391: XNORcc_I	xnorcc 	%r23, 0x0040, %r28
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_7:
	.word 0xb9b34240  ! 6: ARRAY16	array16	%r13, %r0, %r28
	.word 0xb7b5c000  ! 70: EDGE8	egde8	%r23, %r0, %r27
	.word 0xfca29c40  ! 134: STWA_R	stwa	%r30, [%r10 + %r0] 0xe2
	.word 0xfea65c40  ! 198: STWA_R	stwa	%r31, [%r25 + %r0] 0xe2
	.word 0xfea6dc40  ! 262: STWA_R	stwa	%r31, [%r27 + %r0] 0xe2
	.word 0xbbb60080  ! 326: EDGE16	 egde16	%r24, %r0, %r29
	.word 0xba9dc000  ! 390: XORcc_R	xorcc 	%r23, %r0, %r29
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_6:
	.word 0xbbb5c020  ! 5: EDGE8N	edge8n	%r23, %r0, %r29
	.word 0xba25e000  ! 69: SUB_I	sub 	%r23, 0x0000, %r29
	.word 0xbc962140  ! 133: ORcc_I	orcc 	%r24, 0x0140, %r30
	.word 0xfea65c40  ! 197: STWA_R	stwa	%r31, [%r25 + %r0] 0xe2
	.word 0xbfb60200  ! 261: ARRAY8	array8	%r24, %r0, %r31
	.word 0xfca29c40  ! 325: STWA_R	stwa	%r30, [%r10 + %r0] 0xe2
	.word 0xfea29c40  ! 389: STWA_R	stwa	%r31, [%r10 + %r0] 0xe2
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_5:
	.word 0xb33bd000  ! 4: SRAX_R	srax	%r15, %r0, %r25
	.word 0xb7b60000  ! 68: EDGE8	egde8	%r24, %r0, %r27
	.word 0xfaa6dc40  ! 132: STWA_R	stwa	%r29, [%r27 + %r0] 0xe2
	.word 0xfea65c40  ! 196: STWA_R	stwa	%r31, [%r25 + %r0] 0xe2
	.word 0xf6a51c40  ! 260: STWA_R	stwa	%r27, [%r20 + %r0] 0xe2
	.word 0xfca69c40  ! 324: STWA_R	stwa	%r30, [%r26 + %r0] 0xe2
	.word 0xbf3b7001  ! 388: SRAX_I	srax	%r13, 0x0001, %r31
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_4:
	.word 0xfca65c40  ! 3: STWA_R	stwa	%r30, [%r25 + %r0] 0xe2
	.word 0xb62c4000  ! 67: ANDN_R	andn 	%r17, %r0, %r27
	.word 0xfaa4dc40  ! 131: STWA_R	stwa	%r29, [%r19 + %r0] 0xe2
	.word 0xbf3e3001  ! 195: SRAX_I	srax	%r24, 0x0001, %r31
	.word 0xf6a29c40  ! 259: STWA_R	stwa	%r27, [%r10 + %r0] 0xe2
	.word 0xbdb3c140  ! 323: EDGE32L	edge32l	%r15, %r0, %r30
	.word 0xfea65c40  ! 387: STWA_R	stwa	%r31, [%r25 + %r0] 0xe2
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	.word 0xfca59c40  ! 2: STWA_R	stwa	%r30, [%r22 + %r0] 0xe2
	.word 0xf2a59c40  ! 66: STWA_R	stwa	%r25, [%r22 + %r0] 0xe2
	.word 0xfaa51c40  ! 130: STWA_R	stwa	%r29, [%r20 + %r0] 0xe2
	.word 0xbdb60120  ! 194: EDGE32N	edge32n	%r24, %r0, %r30
	.word 0xb6bb2000  ! 258: XNORcc_I	xnorcc 	%r12, 0x0000, %r27
	.word 0xf2a29c40  ! 322: STWA_R	stwa	%r25, [%r10 + %r0] 0xe2
	.word 0xfea59c40  ! 386: STWA_R	stwa	%r31, [%r22 + %r0] 0xe2
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	.word 0xbc362040  ! 1: SUBC_I	orn 	%r24, 0x0040, %r30
	.word 0xb212c000  ! 65: OR_R	or 	%r11, %r0, %r25
	.word 0xfaa29c40  ! 129: STWA_R	stwa	%r29, [%r10 + %r0] 0xe2
	.word 0xfaa29c40  ! 193: STWA_R	stwa	%r29, [%r10 + %r0] 0xe2
	.word 0xf8a29c40  ! 257: STWA_R	stwa	%r28, [%r10 + %r0] 0xe2
	.word 0xb2b60000  ! 321: ORNcc_R	orncc 	%r24, %r0, %r25
	.word 0xbf040000  ! 385: TADDcc_R	taddcc 	%r16, %r0, %r31
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xf5e2a000  ! 64: CASA_R	casa	[%r10] %asi, %r0, %r26
	.word 0xfbe52000  ! 128: CASA_R	casa	[%r20] %asi, %r0, %r29
	.word 0xfbe2a000  ! 192: CASA_R	casa	[%r10] %asi, %r0, %r29
	.word 0xf9e56000  ! 256: CASA_R	casa	[%r21] %asi, %r0, %r28
	.word 0xf3f2a000  ! 320: CASXA_R	casxa	[%r10]%asi, %r0, %r25
	.word 0xf9f56000  ! 384: CASXA_R	casxa	[%r21]%asi, %r0, %r28

join_lbl_0_0:
main_text_end:
	ta %icc, T_GOOD_TRAP
	nop
	nop
	nop
# 574 "diag.j"
main_data_start:
.xword 0xcca3e759bc1ce732
.xword 0xe4dde921acafa15b
.xword 0x70d814a195ea06ce
.xword 0xef7c53109b64a9b9
.xword 0xb1ce7924e6caf114
.xword 0xfd09c0836a7c65c5
.xword 0xe207cddda365873a
.xword 0xa2b9fe964098fe9f
.xword 0x658037bff8ce3aba
.xword 0x7883c93c75045a08
.xword 0xe706634082d9fb5c
.xword 0x714311c056ebd2d9
.xword 0x24ae68ff7e08c386
.xword 0x0779e9f1a3fc92b0
.xword 0xa4a2380f61ad7a47
.xword 0x46480001037e6113
.xword 0x41def2f0b9b1ab42
.xword 0xe23b1597df102e6f
.xword 0xcc4769a01824ede9
.xword 0x93e180bbb30ea3fd
.xword 0x87c21b13be4e79a8
.xword 0x4620cda2b111e2fc
.xword 0x052fa7b5003bed72
.xword 0x4733003b83a77224
.xword 0xa1d654560db2066a
.xword 0xf0a24520e1ff92eb
.xword 0xf62e1e3750f7df3a
.xword 0xecc265cf1a7e41ed
.xword 0x8b931231e9b8c003
.xword 0xe17db5628dc99498
.xword 0x61f901ede8c9eb0f
.xword 0x2617bf5eea09ac11
.xword 0x08ad24f5d1351e81
.xword 0x375fac053446f696
.xword 0xc18062e7ed21e5b0
.xword 0x5ae76e3e3d8564f2
.xword 0xf459022b578d57be
.xword 0x0205222faf2c0ae9
.xword 0x5f6e2e2191dc6bc4
.xword 0xaddec63ba0b1f0c0
.xword 0x53e1b0a1a5dc4447
.xword 0xeb8a524787a6d832
.xword 0xd2c7f132a5e8ff47
.xword 0x2828066d419c9fab
.xword 0x34db5cd9936ad2cd
.xword 0x08ea28b1a20fcdd4
.xword 0x4f88e6f5b9e10b48
.xword 0x36375898a6259d46
.xword 0xf3ab4e139bcf8886
.xword 0x7ac72eed8a303348
.xword 0xb613bfb89bae4bbf
.xword 0x36bc5c05d5806181
.xword 0x5a28fd5e3c3b26a5
.xword 0xa5f9a3f334f5f310
.xword 0xde5291588c9d588c
.xword 0xddfd0590d26b4770
.xword 0x1a29fba580b49526
.xword 0x4b156396cf108cf1
.xword 0x2d5e19239dd24a17
.xword 0x89b7c951adea75bb
.xword 0xe36c80d9cdcb75e8
.xword 0xc168fe6a158f0caa
.xword 0x78190b924d08d0f2
.xword 0x65a4a080dee113c0
.xword 0x2983e6ce04fe82e5
.xword 0xf9a10fb4ce925538
.xword 0xdb94fba1b00a6052
.xword 0xc24a33bd5b5d8f03
.xword 0x546ef22b59c76cfd
.xword 0x7574ddaa9f742da3
.xword 0x04845ce68ab11111
.xword 0x5540443b03378740
.xword 0xf7e884c0bc529ae9
.xword 0x19737f033e7a6653
.xword 0x9adf1fb3e8fb89d9
.xword 0x05cc0d4532c44a14
.xword 0xcce10dbbcfc322fb
.xword 0xd2792042cf442718
.xword 0x500aa3ef9e3f72e0
.xword 0x62b37262551538e6
.xword 0xa270350f280f086b
.xword 0xcbd51908096a14f2
.xword 0x15fb987b375122d2
.xword 0x21eae80028618fa5
.xword 0xb20fcc842f21c45c
.xword 0x41ca10dbdb6e5952
.xword 0x772d0effcced3f62
.xword 0x01cb8d937dc8b0cb
.xword 0xae9136c5a48bcd34
.xword 0xdd76b09dd06fba54
.xword 0x9378b4d8b35826ca
.xword 0x8a0e660829d83f8d
.xword 0x9100634dc4ec5c0c
.xword 0x6d8813ddf5cc0726
.xword 0x67a1386f400d12c8
.xword 0x115a05f5f2bb4feb



SECTION .PRIM_SEG_0 DATA_VA = 0x00000000bcc7c000
attr_data {
	Name	 = .PRIM_SEG_0,
	VA	 = 0x00000000bcc7c000,
	RA	 = 0x00000000bcc7c000,
	PA	 = ra2pa(0x00000000bcc7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA0_START
MEM_DATA0_START:
.xword 0xef27ea85bdf68d24

.xword 0x06b7a2c7a195d18a

.xword 0x0d8458bceedb2d8f

.xword 0x5df957d9c5cf6ad6

.xword 0xa09a0acdaed3c401

.xword 0x5e3ce740e2b8acf2

.xword 0xe504b9d84054005b

.xword 0x5fe40ef296f60dff

.xword 0x86de6869f42b057e

.xword 0x03023f3a4a113cd1

.xword 0xdd3fca1716c84a04

.xword 0x65e2744356dcf4f3

.xword 0x945aa3fe1321a220

.xword 0x514601ba08bfe4c6

.xword 0xef87e8bc144696cf

.xword 0x6822560ea332b3d0

.xword 0x3bf7208071fe634f

.xword 0x33861f1332f8e66f

.xword 0x76bf9d2726aaf9d2

.xword 0x83e9b1e5aac36350

.xword 0x6ca21851d9eba66b

.xword 0x592f231ef3b5b36d

.xword 0x960041848f5a2b2f

.xword 0xa3e802c86ea250f1

.xword 0x131adf8e3b7c8610

.xword 0xd557e7ef0867ef25

.xword 0xc87f4c6b1eb6bd5d

.xword 0x3e9503c8420e7cbc

.xword 0x975bbe35b29d3529

.xword 0xea4304f000afee2a

.xword 0xa273ed4cd4d7ccc6

.xword 0xfbbf20812ad6c71c




SECTION .PRIM_SEG_1 DATA_VA = 0x00000001bcc7c000
attr_data {
	Name	 = .PRIM_SEG_1,
	VA	 = 0x00000001bcc7c000,
	RA	 = 0x00000001bcc7c000,
	PA	 = ra2pa(0x00000001bcc7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA1_START
MEM_DATA1_START:
.xword 0xdc9e5bdc9d2a7dd1
.xword 0x584889cd56f39b47
.xword 0x91ac3361df4ac833
.xword 0x8a76259fc053cc29
.xword 0x24d0dd4cb1f67335
.xword 0x1693f479f63aeeb8
.xword 0x8726badd9b231b58
.xword 0xe352bf609d4b8da1
.xword 0xb62a7825f9e728a2




SECTION .PRIM_SEG_2 DATA_VA = 0x00000008bcc7c000
attr_data {
	Name	 = .PRIM_SEG_2,
	VA	 = 0x00000008bcc7c000,
	RA	 = 0x00000008bcc7c000,
	PA	 = ra2pa(0x00000008bcc7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA2_START
MEM_DATA2_START:
.xword 0xe9e0b6ec3bcab7fa
.xword 0xe331b1d7409ebd88
.xword 0x0710fe506691ea53
.xword 0xd31f4c6c38e6e0b9
.xword 0xc9c42dac96a3b201
.xword 0x1a89e1a8baec1eb9
.xword 0x22509159e3d800d9
.xword 0x41df24a26bba8641
.xword 0x637d82b9cd10957b




SECTION .PRIM_SEG_3 DATA_VA = 0x00000009bcc7c000
attr_data {
	Name	 = .PRIM_SEG_3,
	VA	 = 0x00000009bcc7c000,
	RA	 = 0x00000009bcc7c000,
	PA	 = ra2pa(0x00000009bcc7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA3_START
MEM_DATA3_START:
.xword 0x58b3524725d5e1f4
.xword 0x6dbc29f32d1add09
.xword 0x797cd5598bdfacb8
.xword 0xb1e56eea778582d8
.xword 0x98ee823d56e785b3
.xword 0x7a771d6a97bc9d2f
.xword 0x71502c98b47f094e
.xword 0xba2d5bf266451f92
.xword 0x6ef42951c94cca32




SECTION .PRIM_SEG_4 DATA_VA = 0x00000010bcc7c000
attr_data {
	Name	 = .PRIM_SEG_4,
	VA	 = 0x00000010bcc7c000,
	RA	 = 0x00000010bcc7c000,
	PA	 = ra2pa(0x00000010bcc7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA4_START
MEM_DATA4_START:
.xword 0x6a6d8ba6e0392065
.xword 0x239621e71acaead9
.xword 0x6c50a64cfe97eac9
.xword 0xbf639d049454b228
.xword 0xd1c73584638aeb3f
.xword 0x358eca69cb04c133
.xword 0xa9e4e9aad053e56c
.xword 0xa0d3ee8a3f2a60f7
.xword 0x113965f3cc9c45ba




SECTION .PRIM_SEG_5 DATA_VA = 0x00000011bcc7c000
attr_data {
	Name	 = .PRIM_SEG_5,
	VA	 = 0x00000011bcc7c000,
	RA	 = 0x00000011bcc7c000,
	PA	 = ra2pa(0x00000011bcc7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA5_START
MEM_DATA5_START:
.xword 0x9d548eb01872946f
.xword 0x11e702eb6cc5b24a
.xword 0x31b16a886b73e934
.xword 0x5592d6dddbf664f8
.xword 0x6295073bb3d1db9d
.xword 0x385c3d3a08d84a34
.xword 0xf07f31fcb53f0b71
.xword 0xea28e13fb97571c2
.xword 0x4127255067bf8c78




SECTION .PRIM_SEG_6 DATA_VA = 0x00000018bcc7c000
attr_data {
	Name	 = .PRIM_SEG_6,
	VA	 = 0x00000018bcc7c000,
	RA	 = 0x00000018bcc7c000,
	PA	 = ra2pa(0x00000018bcc7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA6_START
MEM_DATA6_START:
.xword 0x264b5d0f0b696b0d
.xword 0x87fc90194845727e
.xword 0xc274004a6ca9750c
.xword 0x7e9a0c3cefbad078
.xword 0x34d0c3b86fd03c53
.xword 0x41a5c0fcafc7d0f5
.xword 0x39437e1b463fdc60
.xword 0xc11c0725380f7da4
.xword 0xe20b3fea8cf94ce7




SECTION .PRIM_SEG_7 DATA_VA = 0x00000019bcc7c000
attr_data {
	Name	 = .PRIM_SEG_7,
	VA	 = 0x00000019bcc7c000,
	RA	 = 0x00000019bcc7c000,
	PA	 = ra2pa(0x00000019bcc7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA7_START
MEM_DATA7_START:
.xword 0xdfa85c8dcffc108c
.xword 0x4df83e5b504a6ecf
.xword 0x099aa83a78b2a426
.xword 0xe521c11960039d58
.xword 0x2f93d53f635f9daa
.xword 0x49dc07263d5e370a
.xword 0x8d2f762aa2b0f2b5
.xword 0x8ccbf5612e6fac8e
.xword 0xac1b8c011bacf150




SECTION .PRIM_SEG_8 DATA_VA = 0x00000020bcc7c000
attr_data {
	Name	 = .PRIM_SEG_8,
	VA	 = 0x00000020bcc7c000,
	RA	 = 0x00000020bcc7c000,
	PA	 = ra2pa(0x00000020bcc7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA8_START
MEM_DATA8_START:
.xword 0xe2bab74d04cb0662
.xword 0x1f5ed76932c12298
.xword 0x24ec0c3420a3ed34
.xword 0x92b4d632a2ff3ced
.xword 0xd07c35a07d4741dc
.xword 0xf5575b0c8ee3ffac
.xword 0x2214af47321dc52d
.xword 0x18886d65dc23cd94
.xword 0xeb875032da5662ea




SECTION .PRIM_SEG_9 DATA_VA = 0x00000021bcc7c000
attr_data {
	Name	 = .PRIM_SEG_9,
	VA	 = 0x00000021bcc7c000,
	RA	 = 0x00000021bcc7c000,
	PA	 = ra2pa(0x00000021bcc7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA9_START
MEM_DATA9_START:
.xword 0x6d16ea0bed2c5377
.xword 0x06e9b287d987af9d
.xword 0x3b3850a5ea065aa6
.xword 0xf1716f9ff4921569
.xword 0xee2a65093e7fdc9c
.xword 0x1328b3816f7fcba5
.xword 0x8119c68b6f4b038f
.xword 0xadf63d9e43ac478b
.xword 0x7fb7c5801f050acb




SECTION .PRIM_SEG_10 DATA_VA = 0x00000028bcc7c000
attr_data {
	Name	 = .PRIM_SEG_10,
	VA	 = 0x00000028bcc7c000,
	RA	 = 0x00000028bcc7c000,
	PA	 = ra2pa(0x00000028bcc7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA10_START
MEM_DATA10_START:
.xword 0x526cf0ff613d5aad
.xword 0xde07007793f797f2
.xword 0x5fe19b6db8c3d0ab
.xword 0x55f1d23812bef24f
.xword 0x025afb910ea0e0de
.xword 0x0335b4fbf86e56ab
.xword 0x7ce521bda9ad57c1
.xword 0x8c5330002fd32894
.xword 0x01ed8a23f17b46fc




SECTION .PRIM_SEG_11 DATA_VA = 0x00000029bcc7c000
attr_data {
	Name	 = .PRIM_SEG_11,
	VA	 = 0x00000029bcc7c000,
	RA	 = 0x00000029bcc7c000,
	PA	 = ra2pa(0x00000029bcc7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA11_START
MEM_DATA11_START:
.xword 0xc139503ce84b391b
.xword 0xb6ce3af7ace78e50
.xword 0x796aab75591b64f2
.xword 0x4216f17b641ba2f7
.xword 0x0fc751658cade9e9
.xword 0x0baefb0964dbe504
.xword 0x904a2d0d040d9bbe
.xword 0x41042d02f9ca2401
.xword 0xdcec75684ac65be0




SECTION .PRIM_SEG_12 DATA_VA = 0x00000030bcc7c000
attr_data {
	Name	 = .PRIM_SEG_12,
	VA	 = 0x00000030bcc7c000,
	RA	 = 0x00000030bcc7c000,
	PA	 = ra2pa(0x00000030bcc7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA12_START
MEM_DATA12_START:
.xword 0x8d0bede0e5c4a0e1
.xword 0x88113fc82d5eef6f
.xword 0x5655785c55b379cf
.xword 0xbe912e7444c97135
.xword 0x1be4881336781cf7
.xword 0x9805a267e58c0039
.xword 0x365cfa75bf2f2baf
.xword 0x283caf4f2b44fd8f
.xword 0x7398d6847fedac2b




SECTION .PRIM_SEG_13 DATA_VA = 0x00000031bcc7c000
attr_data {
	Name	 = .PRIM_SEG_13,
	VA	 = 0x00000031bcc7c000,
	RA	 = 0x00000031bcc7c000,
	PA	 = ra2pa(0x00000031bcc7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA13_START
MEM_DATA13_START:
.xword 0x9687539b47f07f62
.xword 0x1726c1efbb937216
.xword 0x72ab243e072ef54a
.xword 0xe668dd95a6986fa4
.xword 0xfd4e232497737cd4
.xword 0x6da98bba9f61655e
.xword 0x8afc4b01b569ea0d
.xword 0x61baf51dad2a7751
.xword 0x3c94c400167454dd




SECTION .PRIM_SEG_14 DATA_VA = 0x00000038bcc7c000
attr_data {
	Name	 = .PRIM_SEG_14,
	VA	 = 0x00000038bcc7c000,
	RA	 = 0x00000038bcc7c000,
	PA	 = ra2pa(0x00000038bcc7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA14_START
MEM_DATA14_START:
.xword 0x9d99f2c708468a47
.xword 0x4bbdd01d864096ae
.xword 0x2af6c216bb20ed57
.xword 0xf99341f86dfcd946
.xword 0x90ef1db6207a1414
.xword 0x951b16311a9fc13b
.xword 0x4824f40cc72a90cf
.xword 0xa45d4e1219526f3f
.xword 0x6ad77696cf222183




SECTION .PRIM_SEG_15 DATA_VA = 0x00000039bcc7c000
attr_data {
	Name	 = .PRIM_SEG_15,
	VA	 = 0x00000039bcc7c000,
	RA	 = 0x00000039bcc7c000,
	PA	 = ra2pa(0x00000039bcc7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA15_START
MEM_DATA15_START:
.xword 0xdc39cc8cb1e0ebd9
.xword 0x5cdc111e862f804d
.xword 0x0bb04a6994c061d0
.xword 0x8f0b0223f47d58f9
.xword 0x9c2e2901b936e056
.xword 0x544fc7840872a0ad
.xword 0x568e39496a9c601b
.xword 0xc460505fd4684e3c
.xword 0xd8d7888cdd5bc348




SECTION .PRIM_SEG_16 DATA_VA = 0x00000040bcc7c000
attr_data {
	Name	 = .PRIM_SEG_16,
	VA	 = 0x00000040bcc7c000,
	RA	 = 0x00000040bcc7c000,
	PA	 = ra2pa(0x00000040bcc7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA16_START
MEM_DATA16_START:
.xword 0x5b7db0d9aea83967
.xword 0x4b09ec6ef294d126
.xword 0xfca0f5adb312a616
.xword 0xbfea65bb99e666ac
.xword 0x10d0bc1cdfa188bb
.xword 0xf76e6e459748764d
.xword 0xf04588c09d27b59c
.xword 0x4ba2c8efeec6f717
.xword 0x97e682f6b09a7389




SECTION .PRIM_SEG_17 DATA_VA = 0x00000041bcc7c000
attr_data {
	Name	 = .PRIM_SEG_17,
	VA	 = 0x00000041bcc7c000,
	RA	 = 0x00000041bcc7c000,
	PA	 = ra2pa(0x00000041bcc7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA17_START
MEM_DATA17_START:
.xword 0x234155695a09052f
.xword 0x5073d1c70d123553
.xword 0xb86ba85cde3bddc4
.xword 0xa9c661be6f933d67
.xword 0xb115dce3ce57a866
.xword 0xcbefc02af2b5dcee
.xword 0x9dfec869335d1199
.xword 0xe457bf0d9712d153
.xword 0xba272ac7464fbf6c




SECTION .PRIM_SEG_18 DATA_VA = 0x00000048bcc7c000
attr_data {
	Name	 = .PRIM_SEG_18,
	VA	 = 0x00000048bcc7c000,
	RA	 = 0x00000048bcc7c000,
	PA	 = ra2pa(0x00000048bcc7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA18_START
MEM_DATA18_START:
.xword 0x136a520dc3f72428
.xword 0x6afa42df05da99bc
.xword 0xc439fd1fd4fa2076
.xword 0x4bada5aa16c6ef65
.xword 0xdb27cd85f9d43d30
.xword 0x3b3005d5dede8b42
.xword 0x0fddbc8a79f9f2fa
.xword 0x690767b629f3a15d
.xword 0x2fd579dfc0e0a4e1




SECTION .PRIM_SEG_19 DATA_VA = 0x00000049bcc7c000
attr_data {
	Name	 = .PRIM_SEG_19,
	VA	 = 0x00000049bcc7c000,
	RA	 = 0x00000049bcc7c000,
	PA	 = ra2pa(0x00000049bcc7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA19_START
MEM_DATA19_START:
.xword 0xd67e50df8b44a8fc
.xword 0x295aa8aaca8e9ba9
.xword 0xb03808b3ad3387ef
.xword 0x2df5ba8319a6be34
.xword 0xa07e55e11d9983e4
.xword 0x678504aeea88d3e8
.xword 0xbf031e7707d737c5
.xword 0xe2eca649599a58b0
.xword 0x3aa29560d2401b55




SECTION .PRIM_SEG_20 DATA_VA = 0x00000050bcc7c000
attr_data {
	Name	 = .PRIM_SEG_20,
	VA	 = 0x00000050bcc7c000,
	RA	 = 0x00000050bcc7c000,
	PA	 = ra2pa(0x00000050bcc7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA20_START
MEM_DATA20_START:
.xword 0x38a7586b2dc59633
.xword 0xe2f2e677575d42aa
.xword 0x1876bf1badae68ac
.xword 0x9f8feb6c0e5fd798
.xword 0xc28466b8c5672b25
.xword 0xe511b810b2bb8f25
.xword 0x1abd1a7226b9be31
.xword 0xe238ffd50f432346
.xword 0x2624fc725ab29ff4




SECTION .PRIM_SEG_21 DATA_VA = 0x00000051bcc7c000
attr_data {
	Name	 = .PRIM_SEG_21,
	VA	 = 0x00000051bcc7c000,
	RA	 = 0x00000051bcc7c000,
	PA	 = ra2pa(0x00000051bcc7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA21_START
MEM_DATA21_START:
.xword 0xcf7ab01e2f15e1b3
.xword 0x415e4b1d52614ee2
.xword 0x6bb0215c46f1d6c8
.xword 0x2054bf64c944771c
.xword 0x82f51a503c33178a
.xword 0x1d84f9f903999ff6
.xword 0x45ba7afde4d2dedf
.xword 0x5450a7fd20a3a97a
.xword 0x776c7aee590f4085




SECTION .PRIM_SEG_22 DATA_VA = 0x00000058bcc7c000
attr_data {
	Name	 = .PRIM_SEG_22,
	VA	 = 0x00000058bcc7c000,
	RA	 = 0x00000058bcc7c000,
	PA	 = ra2pa(0x00000058bcc7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA22_START
MEM_DATA22_START:
.xword 0xdbae9f593d80b113
.xword 0x9397dfdda4d65606
.xword 0xe68bb87e1bc7f5d1
.xword 0x4215325dfe9d4131
.xword 0xc024d977d0951111
.xword 0x84a1f22a7181fe92
.xword 0x2b7cc0f97682fa6f
.xword 0x93bd0a9ebdf4d6ab
.xword 0x69b2a1a602e4e42b




SECTION .PRIM_SEG_23 DATA_VA = 0x00000059bcc7c000
attr_data {
	Name	 = .PRIM_SEG_23,
	VA	 = 0x00000059bcc7c000,
	RA	 = 0x00000059bcc7c000,
	PA	 = ra2pa(0x00000059bcc7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA23_START
MEM_DATA23_START:
.xword 0x179cda47a6869822
.xword 0x8ef5d3546be058e5
.xword 0x4ba72e25a0381fb8
.xword 0x66aeb07e93a2dbaa
.xword 0xec2d9dd2c1dd7193
.xword 0xb8e794206b432bf1
.xword 0xbcfd869820414595
.xword 0xaa889804d2d4d7cc
.xword 0x258367420ab2b6b1




SECTION .PRIM_SEG_24 DATA_VA = 0x00000060bcc7c000
attr_data {
	Name	 = .PRIM_SEG_24,
	VA	 = 0x00000060bcc7c000,
	RA	 = 0x00000060bcc7c000,
	PA	 = ra2pa(0x00000060bcc7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA24_START
MEM_DATA24_START:
.xword 0xae83a785ca8328fb
.xword 0x186880623cdaa4d9
.xword 0x37dfad6cdeba2fa0
.xword 0x016cd3f5fa73bff7
.xword 0xfab12a764d27c4a0
.xword 0xc1fda2583fd5741c
.xword 0x78f2b0f511ae8d50
.xword 0x29c1b06d9f2293e8
.xword 0x56ca6358346ca779




SECTION .PRIM_SEG_25 DATA_VA = 0x00000061bcc7c000
attr_data {
	Name	 = .PRIM_SEG_25,
	VA	 = 0x00000061bcc7c000,
	RA	 = 0x00000061bcc7c000,
	PA	 = ra2pa(0x00000061bcc7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA25_START
MEM_DATA25_START:
.xword 0x5dc80e0978aaa298
.xword 0xfc60b14938add707
.xword 0xc9dd348f2e319388
.xword 0xa58fd2f74817b6a9
.xword 0xa067b9bda13904eb
.xword 0xf3c38973efd3e950
.xword 0xa09a0fa4b5019d2e
.xword 0xfeb3f9b13eeb4e9a
.xword 0x17d60cd87b4ed54d




SECTION .PRIM_SEG_26 DATA_VA = 0x00000068bcc7c000
attr_data {
	Name	 = .PRIM_SEG_26,
	VA	 = 0x00000068bcc7c000,
	RA	 = 0x00000068bcc7c000,
	PA	 = ra2pa(0x00000068bcc7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA26_START
MEM_DATA26_START:
.xword 0x27d74220e34ecaee
.xword 0x79adf725d1e9d374
.xword 0xa2e1538165ba16d8
.xword 0xa2cca5e222836ca4
.xword 0x9b0b91cb36f2fb78
.xword 0xc6d6b4b37ccd71ae
.xword 0x4f3e6ae74b075742
.xword 0x596d5ae763e47d9c
.xword 0x9ba6866da3ad56a7




SECTION .PRIM_SEG_27 DATA_VA = 0x00000069bcc7c000
attr_data {
	Name	 = .PRIM_SEG_27,
	VA	 = 0x00000069bcc7c000,
	RA	 = 0x00000069bcc7c000,
	PA	 = ra2pa(0x00000069bcc7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA27_START
MEM_DATA27_START:
.xword 0x02c52d7d8d890b48
.xword 0x07b7599c917b2ac6
.xword 0x5ae32625d611012b
.xword 0x831a07a90c74cab7
.xword 0xb3538027715a6e31
.xword 0x1cde8293245632b3
.xword 0x916a58c9c7a5391e
.xword 0x60acc18341091ae3
.xword 0x788bc07e867dc9f4




SECTION .PRIM_SEG_28 DATA_VA = 0x00000070bcc7c000
attr_data {
	Name	 = .PRIM_SEG_28,
	VA	 = 0x00000070bcc7c000,
	RA	 = 0x00000070bcc7c000,
	PA	 = ra2pa(0x00000070bcc7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA28_START
MEM_DATA28_START:
.xword 0x86fbf6fa89316706
.xword 0xd112778d1feba3fd
.xword 0xe0190be4178b1b33
.xword 0x92718aad10d746ef
.xword 0xc3bfa5ef8c7b2145
.xword 0x6f95cf6cb6addfec
.xword 0xaa904de23c7515ea
.xword 0x9e056d114ab7cb9e
.xword 0xe8aaca594e237240




SECTION .PRIM_SEG_29 DATA_VA = 0x00000071bcc7c000
attr_data {
	Name	 = .PRIM_SEG_29,
	VA	 = 0x00000071bcc7c000,
	RA	 = 0x00000071bcc7c000,
	PA	 = ra2pa(0x00000071bcc7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA29_START
MEM_DATA29_START:
.xword 0xb6a9012a88e585bf
.xword 0x12725228cdae2fc0
.xword 0xa92083295745ee0d
.xword 0xcb22d04a92e518b5
.xword 0xb50fd77e36925d3c
.xword 0x317fd97f5996b17f
.xword 0xffa1441e73476f20
.xword 0x391f21746d9c18c1
.xword 0x0bc5ea64c0ee8de1




SECTION .PRIM_SEG_30 DATA_VA = 0x00000078bcc7c000
attr_data {
	Name	 = .PRIM_SEG_30,
	VA	 = 0x00000078bcc7c000,
	RA	 = 0x00000078bcc7c000,
	PA	 = ra2pa(0x00000078bcc7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA30_START
MEM_DATA30_START:
.xword 0xf1d340c8a1e76d80
.xword 0x7078968c69f011be
.xword 0x1e318ef09d4ca0d2
.xword 0x112bda40d4a08b4f
.xword 0x222d2054bdad2158
.xword 0xebccfa3e72854406
.xword 0xa860251fcebe9925
.xword 0x7fe32822a220e908
.xword 0xbe1fbc791ed04dd4




SECTION .PRIM_SEG_31 DATA_VA = 0x00000079bcc7c000
attr_data {
	Name	 = .PRIM_SEG_31,
	VA	 = 0x00000079bcc7c000,
	RA	 = 0x00000079bcc7c000,
	PA	 = ra2pa(0x00000079bcc7c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_DATA31_START
MEM_DATA31_START:
.xword 0x1403d0ef432ee66c
.xword 0xb2f4c993b3432ff8
.xword 0xbe964967b3f7570a
.xword 0xa908795ebd8b6edf
.xword 0xd2aacec9fe0372aa
.xword 0x82f8cca5815bb49c
.xword 0xa2f6f40194c1c87f
.xword 0x2fee78eca225e2da
.xword 0xa34bb178b267a046






SECTION .IOPRI_SEG_0 DATA_VA = 0x00000001ef0fc000
attr_data {
	Name	 = .IOPRI_SEG_0,
	VA	 = 0x00000001ef0fc000,
	RA	 = 0x000000012343c000,
	PA	 = ra2pa(0x000000012343c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0xde623f7c1c6112c8
.xword 0x190308a2a6bd1a93
.xword 0xabbd1ec6fe670bad
.xword 0x26594164c8563eb9
.xword 0x464a68a0dd8092b7
.xword 0x68d7973101fc4c66
.xword 0x786cc977e4e92eb4
.xword 0xf98f96199211ab9c



SECTION .IOPRI_SEG_1 DATA_VA = 0x00000005ef0fc000
attr_data {
	Name	 = .IOPRI_SEG_1,
	VA	 = 0x00000005ef0fc000,
	RA	 = 0x000000052343c000,
	PA	 = ra2pa(0x000000052343c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0x419ed5c31c042cb9
.xword 0x6fc69f9a0b108a68
.xword 0xd01e49bb7afbe01c
.xword 0xe3fbb7d9b181c00e
.xword 0xd5046666365f5bf2
.xword 0xbe3657bc8f286537
.xword 0x12388b979d9b3682
.xword 0x0cee88e605b39f77



SECTION .IOPRI_SEG_2 DATA_VA = 0x00000009ef0fc000
attr_data {
	Name	 = .IOPRI_SEG_2,
	VA	 = 0x00000009ef0fc000,
	RA	 = 0x000000092343c000,
	PA	 = ra2pa(0x000000092343c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0xd4e82cdf98b8d70a
.xword 0xbd15a7b01a7a68a4
.xword 0xa2d14fe482e71fbd
.xword 0x9c0cfec95b5e59a4
.xword 0x55728c847e45e713
.xword 0xcb69cdb96a0f0c08
.xword 0x674c617c02c33730
.xword 0x5d1d3600188abd74



SECTION .IOPRI_SEG_3 DATA_VA = 0x0000000def0fc000
attr_data {
	Name	 = .IOPRI_SEG_3,
	VA	 = 0x0000000def0fc000,
	RA	 = 0x0000000d2343c000,
	PA	 = ra2pa(0x0000000d2343c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0x35d2d727c571a748
.xword 0xe5dfdb4a05efd2cd
.xword 0x63c67141d06c9111
.xword 0xfc90f52c1fe14e55
.xword 0x60c8c3eb33b445d0
.xword 0xfc8f1d67549573c3
.xword 0xcb2c961e5327f211
.xword 0xf4e094460c8560b8



SECTION .IOPRI_SEG_4 DATA_VA = 0x00000011ef0fc000
attr_data {
	Name	 = .IOPRI_SEG_4,
	VA	 = 0x00000011ef0fc000,
	RA	 = 0x000000112343c000,
	PA	 = ra2pa(0x000000112343c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0xf2ee142ddb08efcb
.xword 0xa41b8bfaf1ddad59
.xword 0xe687ae348fea7423
.xword 0xfb86cb81dbc36a05
.xword 0xe2a5399476ecb787
.xword 0x3dcb085f0de03f22
.xword 0x6c60039093d5ba58
.xword 0x1d47eb9366cf4ad3



SECTION .IOPRI_SEG_5 DATA_VA = 0x00000015ef0fc000
attr_data {
	Name	 = .IOPRI_SEG_5,
	VA	 = 0x00000015ef0fc000,
	RA	 = 0x000000152343c000,
	PA	 = ra2pa(0x000000152343c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0x93ad3f67027d5713
.xword 0x363801c61ee35adf
.xword 0xb5fd9020bf8591ed
.xword 0x1cdf429f0319057c
.xword 0xcbd0e789d829eb0a
.xword 0x1abc037ae23a9890
.xword 0xa5a7b15ae0f4a6df
.xword 0x946a6c1fcbbba975



SECTION .IOPRI_SEG_6 DATA_VA = 0x00000019ef0fc000
attr_data {
	Name	 = .IOPRI_SEG_6,
	VA	 = 0x00000019ef0fc000,
	RA	 = 0x000000192343c000,
	PA	 = ra2pa(0x000000192343c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0xdc589de025760c31
.xword 0x809615e9e113fab0
.xword 0x92839c9d3f70fc4e
.xword 0x11d9348097088cb2
.xword 0x5665c965ba250382
.xword 0x3a0efa82033beee5
.xword 0x2046f40e30571aa1
.xword 0x4ba48988ff6d0536



SECTION .IOPRI_SEG_7 DATA_VA = 0x0000001def0fc000
attr_data {
	Name	 = .IOPRI_SEG_7,
	VA	 = 0x0000001def0fc000,
	RA	 = 0x0000001d2343c000,
	PA	 = ra2pa(0x0000001d2343c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0xbe43c70c06fcb31d
.xword 0xfb3e6e5a73caed88
.xword 0xab804f9884517201
.xword 0x439a2ff80c68af11
.xword 0x0bf88ca4cd9f9b99
.xword 0x476c9ca2c5069faa
.xword 0x34fd7f94f2e598db
.xword 0xdaebbbc82efba8fb



SECTION .IOPRI_SEG_8 DATA_VA = 0x00000021ef0fc000
attr_data {
	Name	 = .IOPRI_SEG_8,
	VA	 = 0x00000021ef0fc000,
	RA	 = 0x000000212343c000,
	PA	 = ra2pa(0x000000212343c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0xe3b47340a08c438a
.xword 0x646c5a168a833b2c
.xword 0x9ba96ddbee8e4467
.xword 0xa7c8e36701dfe356
.xword 0x7d5e6ea744c2efcd
.xword 0xf5426a3ce21fad0e
.xword 0xb1264ff3fa4b2c53
.xword 0xb702ed4bf34680f5



SECTION .IOPRI_SEG_9 DATA_VA = 0x00000025ef0fc000
attr_data {
	Name	 = .IOPRI_SEG_9,
	VA	 = 0x00000025ef0fc000,
	RA	 = 0x000000252343c000,
	PA	 = ra2pa(0x000000252343c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0xd0bcb297316b9ed6
.xword 0xf06292d11a0ba072
.xword 0xfe167ca4b994f320
.xword 0x5be31e194ea5a774
.xword 0xeadad503492c977b
.xword 0xb88681c243fc512b
.xword 0xf0b8af93d99300c9
.xword 0xbb03d9a5ebb8ece9



SECTION .IOPRI_SEG_10 DATA_VA = 0x00000029ef0fc000
attr_data {
	Name	 = .IOPRI_SEG_10,
	VA	 = 0x00000029ef0fc000,
	RA	 = 0x000000292343c000,
	PA	 = ra2pa(0x000000292343c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0x25a77dc65bc36d21
.xword 0x2a1747371d224275
.xword 0x9ac09e04103fda32
.xword 0x914fe61905fbf303
.xword 0x8944aadd0e948dce
.xword 0x46342de4c4883c2a
.xword 0xc8b38ce9ae467ff4
.xword 0x6ded529d838414fa



SECTION .IOPRI_SEG_11 DATA_VA = 0x0000002def0fc000
attr_data {
	Name	 = .IOPRI_SEG_11,
	VA	 = 0x0000002def0fc000,
	RA	 = 0x0000002d2343c000,
	PA	 = ra2pa(0x0000002d2343c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0xa39e6de6074d7c4e
.xword 0xa10423fc7be4ef3e
.xword 0x0b3f210dedbe1749
.xword 0x5ed17e724302a828
.xword 0x3a034c48804e9af1
.xword 0xd0595139000f5342
.xword 0x0513a8e861589429
.xword 0x88d519088d8e2578



SECTION .IOPRI_SEG_12 DATA_VA = 0x00000031ef0fc000
attr_data {
	Name	 = .IOPRI_SEG_12,
	VA	 = 0x00000031ef0fc000,
	RA	 = 0x000000312343c000,
	PA	 = ra2pa(0x000000312343c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0xe62aafd02cd04e09
.xword 0x62f28ad42765179d
.xword 0xa077d6a659350b23
.xword 0x923fd7b14521c4d9
.xword 0xe116a821b4ae8ede
.xword 0xe7ba23ae97632f7c
.xword 0x76e90498dafebef3
.xword 0x80f877912021dd44



SECTION .IOPRI_SEG_13 DATA_VA = 0x00000035ef0fc000
attr_data {
	Name	 = .IOPRI_SEG_13,
	VA	 = 0x00000035ef0fc000,
	RA	 = 0x000000352343c000,
	PA	 = ra2pa(0x000000352343c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x5a250d9b15fac876
.xword 0x4475b7c126ffb3cb
.xword 0xb8583ab4278c24e8
.xword 0x2e4f80c26b77708f
.xword 0x4aa010d9b4e6139e
.xword 0x158be1ac7de480b5
.xword 0x5140ff38add447c4
.xword 0x68e9e7bad5a59ed1



SECTION .IOPRI_SEG_14 DATA_VA = 0x00000039ef0fc000
attr_data {
	Name	 = .IOPRI_SEG_14,
	VA	 = 0x00000039ef0fc000,
	RA	 = 0x000000392343c000,
	PA	 = ra2pa(0x000000392343c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0x93e8245a8a0c5690
.xword 0x9571dda4e04d2087
.xword 0x6c0995a5abe3779e
.xword 0x9318cc9a3b72d03f
.xword 0x03cda6b37074fe0b
.xword 0x1003c65514c31aeb
.xword 0xa969d021c1c1c8bb
.xword 0xc17d05bca518080b



SECTION .IOPRI_SEG_15 DATA_VA = 0x0000003def0fc000
attr_data {
	Name	 = .IOPRI_SEG_15,
	VA	 = 0x0000003def0fc000,
	RA	 = 0x0000003d2343c000,
	PA	 = ra2pa(0x0000003d2343c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0xe2e88a905c1d62e4
.xword 0xf8cc86e429556297
.xword 0x26cc149f6b6f1f90
.xword 0xf85b408fdd71d58a
.xword 0x80942e190566e8e2
.xword 0x4df1078e24b711e9
.xword 0x58ce0a88d47af686
.xword 0xc620b18667afed6f



SECTION .IOPRI_SEG_16 DATA_VA = 0x00000041ef0fc000
attr_data {
	Name	 = .IOPRI_SEG_16,
	VA	 = 0x00000041ef0fc000,
	RA	 = 0x000000412343c000,
	PA	 = ra2pa(0x000000412343c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0x3858f2b675178d70
.xword 0x8858adc57a288303
.xword 0xf27b61d72bf569f1
.xword 0xace5a73cf3c835f9
.xword 0x0712262a74749864
.xword 0xaed6593be7a05ae9
.xword 0xe55243a030ebce84
.xword 0xc806c7632de67502



SECTION .IOPRI_SEG_17 DATA_VA = 0x00000045ef0fc000
attr_data {
	Name	 = .IOPRI_SEG_17,
	VA	 = 0x00000045ef0fc000,
	RA	 = 0x000000452343c000,
	PA	 = ra2pa(0x000000452343c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0x921d763a9f07ad24
.xword 0x46330fe4b324ad3e
.xword 0x2c09aeea7dadc4c0
.xword 0x57d0ca99b5e351d4
.xword 0xa852769731861cc6
.xword 0xca3cac9453ea76b9
.xword 0x8948bbdf7fc3fa44
.xword 0x52ab2473450a53f4



SECTION .IOPRI_SEG_18 DATA_VA = 0x00000049ef0fc000
attr_data {
	Name	 = .IOPRI_SEG_18,
	VA	 = 0x00000049ef0fc000,
	RA	 = 0x000000492343c000,
	PA	 = ra2pa(0x000000492343c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x09072044f485a276
.xword 0x96e606b70e41afdc
.xword 0x7399a4e493797c98
.xword 0x973422f7cff9a5bb
.xword 0x8d1bb1f1b3a9c24d
.xword 0xa7846aea010d3e34
.xword 0x3fbfe802a7a54d0e
.xword 0xa2bae0d0d73c4a96



SECTION .IOPRI_SEG_19 DATA_VA = 0x0000004def0fc000
attr_data {
	Name	 = .IOPRI_SEG_19,
	VA	 = 0x0000004def0fc000,
	RA	 = 0x0000004d2343c000,
	PA	 = ra2pa(0x0000004d2343c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0xb2b0ffa876676ae0
.xword 0xd16bb7f865eb325d
.xword 0x227f5b3016f519bc
.xword 0xf02fb2e27cb7f83c
.xword 0x2b686808bbbf9f5e
.xword 0xfc3c90c88a689025
.xword 0xb7f393b9d2fd2e15
.xword 0xb0e1e8e562825f97



SECTION .IOPRI_SEG_20 DATA_VA = 0x00000051ef0fc000
attr_data {
	Name	 = .IOPRI_SEG_20,
	VA	 = 0x00000051ef0fc000,
	RA	 = 0x000000512343c000,
	PA	 = ra2pa(0x000000512343c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0x84e08a196a004d9e
.xword 0xfa5601431d00a08c
.xword 0xc11dae92bab865f7
.xword 0xeb31db613e53f98a
.xword 0x6f1c4bf67ec407ee
.xword 0x25d86ba01ffd2650
.xword 0x4891ad05f98a109a
.xword 0xe4ecfe22496d267c



SECTION .IOPRI_SEG_21 DATA_VA = 0x00000055ef0fc000
attr_data {
	Name	 = .IOPRI_SEG_21,
	VA	 = 0x00000055ef0fc000,
	RA	 = 0x000000552343c000,
	PA	 = ra2pa(0x000000552343c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0x87fb487569b28366
.xword 0xa927679f56d79302
.xword 0xec26d5762efc874a
.xword 0x2230d325465d8360
.xword 0x5fee6e9e1e859b2f
.xword 0xff11b1c13dd1c6bf
.xword 0x522a3c5d9aab7f12
.xword 0x29813c7230566c1f



SECTION .IOPRI_SEG_22 DATA_VA = 0x00000059ef0fc000
attr_data {
	Name	 = .IOPRI_SEG_22,
	VA	 = 0x00000059ef0fc000,
	RA	 = 0x000000592343c000,
	PA	 = ra2pa(0x000000592343c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0xb350be3978cb01d1
.xword 0xcace33c1b7bce81b
.xword 0x7735fa4fdf380338
.xword 0xdb40386378ff6677
.xword 0xe967e842d10fab46
.xword 0x514caa3175b044d9
.xword 0x3b0a11e54c14119c
.xword 0x42542a8de8aa582f



SECTION .IOPRI_SEG_23 DATA_VA = 0x0000005def0fc000
attr_data {
	Name	 = .IOPRI_SEG_23,
	VA	 = 0x0000005def0fc000,
	RA	 = 0x0000005d2343c000,
	PA	 = ra2pa(0x0000005d2343c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0x66b92412bcae23e9
.xword 0x14eaba5063b35d80
.xword 0xc9a45118d9c776e3
.xword 0x8891fba4c69b244c
.xword 0x35c981e1f569c443
.xword 0x70f965a0d0e75cbc
.xword 0x8c0b6085491b55ae
.xword 0x34702c8156aa680f



SECTION .IOPRI_SEG_24 DATA_VA = 0x00000061ef0fc000
attr_data {
	Name	 = .IOPRI_SEG_24,
	VA	 = 0x00000061ef0fc000,
	RA	 = 0x000000612343c000,
	PA	 = ra2pa(0x000000612343c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x65ec33198ad0d29d
.xword 0x3c666d5f4a4753f3
.xword 0x1924e9b90460c3dc
.xword 0xf06de81ad7458dbc
.xword 0x846024eb36fd83ab
.xword 0x44aa109b553de225
.xword 0x13b099fd46ec1075
.xword 0xebfc57eb268d6335



SECTION .IOPRI_SEG_25 DATA_VA = 0x00000065ef0fc000
attr_data {
	Name	 = .IOPRI_SEG_25,
	VA	 = 0x00000065ef0fc000,
	RA	 = 0x000000652343c000,
	PA	 = ra2pa(0x000000652343c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x78c5fe2f3dd61ccc
.xword 0x73d8ff1edf8346e9
.xword 0x663644e1c3c3951b
.xword 0x8328261b7eebacf7
.xword 0x256354f13d05b642
.xword 0xed7dddc9f0769e95
.xword 0xac7dfdf69c65ebb9
.xword 0x9c69a6d06648cf77



SECTION .IOPRI_SEG_26 DATA_VA = 0x00000069ef0fc000
attr_data {
	Name	 = .IOPRI_SEG_26,
	VA	 = 0x00000069ef0fc000,
	RA	 = 0x000000692343c000,
	PA	 = ra2pa(0x000000692343c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0xd2704f0dab5709fb
.xword 0x98f391a37912ad15
.xword 0xeacaba5f7d2b875b
.xword 0x30e9885e39cb160c
.xword 0xc38abd2c6f7da0bf
.xword 0x8c4b75e0b5e80d45
.xword 0x2ea83a467926036f
.xword 0x2452237d960c9151



SECTION .IOPRI_SEG_27 DATA_VA = 0x0000006def0fc000
attr_data {
	Name	 = .IOPRI_SEG_27,
	VA	 = 0x0000006def0fc000,
	RA	 = 0x0000006d2343c000,
	PA	 = ra2pa(0x0000006d2343c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0x42ba79d52007c636
.xword 0x40711f09246627a9
.xword 0x23e3efd417d6e53e
.xword 0xf526450162fb5680
.xword 0xa02b252fb0492e09
.xword 0x86e0b3ca1371b20f
.xword 0x5d926b99778f9960
.xword 0xc9de4fff4d396334



SECTION .IOPRI_SEG_28 DATA_VA = 0x00000071ef0fc000
attr_data {
	Name	 = .IOPRI_SEG_28,
	VA	 = 0x00000071ef0fc000,
	RA	 = 0x000000712343c000,
	PA	 = ra2pa(0x000000712343c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0x01ccdf46a7a46730
.xword 0x82ee25519e45eeb7
.xword 0x9c5d9d723b3fd8e2
.xword 0xeac2cbd953cf9d22
.xword 0x69906495b99bc0fb
.xword 0x840481a3aea8a02b
.xword 0xf924d98899385418
.xword 0xed8a0111db863fdd



SECTION .IOPRI_SEG_29 DATA_VA = 0x00000075ef0fc000
attr_data {
	Name	 = .IOPRI_SEG_29,
	VA	 = 0x00000075ef0fc000,
	RA	 = 0x000000752343c000,
	PA	 = ra2pa(0x000000752343c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0x77b5b71ff56059fd
.xword 0xf95208b02e200d33
.xword 0xba3cf369a61026c2
.xword 0x1f49ad73b498308e
.xword 0x02d51e7580251fe3
.xword 0xceb4cbdbf3a7d606
.xword 0xeb3863b220131889
.xword 0x522d17195a3e6c47



SECTION .IOPRI_SEG_30 DATA_VA = 0x00000079ef0fc000
attr_data {
	Name	 = .IOPRI_SEG_30,
	VA	 = 0x00000079ef0fc000,
	RA	 = 0x000000792343c000,
	PA	 = ra2pa(0x000000792343c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0xa76a3d4167e09f6c
.xword 0x6bed6f0a9c8ef753
.xword 0xff54bbc831673ece
.xword 0x7b3b99d38fc1bc19
.xword 0x09e3c36cbf428806
.xword 0x8069ac0050e7ccfe
.xword 0xe61d73643bbf94d0
.xword 0xa43d9f0108e00fec



SECTION .IOPRI_SEG_31 DATA_VA = 0x0000007def0fc000
attr_data {
	Name	 = .IOPRI_SEG_31,
	VA	 = 0x0000007def0fc000,
	RA	 = 0x0000007d2343c000,
	PA	 = ra2pa(0x0000007d2343c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0xaf9a7dae088af933
.xword 0xa5fce28e86e408e8
.xword 0xb4dd7fc0ad727029
.xword 0xb839751024231aa9
.xword 0x1f7263f6852ab484
.xword 0x4f4c83a8ed8a6e28
.xword 0x9d87b12f0e824d2d
.xword 0x917300507f4b131f





SECTION .CPSEC_SEG_0 DATA_VA = 0x0000007123500000
attr_data {
	Name	 = .CPSEC_SEG_0,
	VA	 = 0x0000007123500000,
	RA	 = 0x0000006789aa0000,
	PA	 = ra2pa(0x0000006789aa0000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_SEC_DATA0_START
MEM_SEC_DATA0_START:
.xword 0x355773390ad7b41f
.xword 0x7d06b68aebd84062
.xword 0x1e625500d940fd74
.xword 0x3e1a8687b79487c6
.xword 0xfcb4a96316ee4eb8
.xword 0x84adee5add543cf6
.xword 0xd72ead932cfd09ec
.xword 0x487a807542c178e9
.xword 0x882d44c05904174b
.xword 0x76c05533c429c277
.xword 0x4c528d06d963c93d
.xword 0x660ecd32c6487be4
.xword 0x8c202b9e67fda40f
.xword 0xe81065aaaf03df8e
.xword 0x66b952f2a9274481
.xword 0x486d087e93922ea1
.xword 0x34ee48fc748d0fdc
.xword 0xb83fc4d5c652cf43
.xword 0xc959207853ec8fe8
.xword 0xc418995d786f104f
.xword 0xe55ee1d0479803fe
.xword 0x6266d13d78b2e585
.xword 0x8b406966acc61f02
.xword 0x633095e425dcd36e
.xword 0x27cd7e7f777042ca
.xword 0x50a6b383a1433f9e
.xword 0xeab8b424114e75b1
.xword 0x228540aefc253494
.xword 0xeb6e350b7e303916
.xword 0xa8c9840bc5a0cc12
.xword 0x3cca75127bd7fed7
.xword 0x6d4a69330052a4ac
.xword 0xc3a22112af3b65e0
.xword 0xb3237c4ecf6383cb
.xword 0xebe025280ad547a3
.xword 0xfe9f80531fab722a
.xword 0xc8e6c8bed327cc8f
.xword 0xfacca40a066b299e
.xword 0x0659e75e9d10023d
.xword 0xba0ebf5f4effa410




SECTION .CPSEC_SEG_1 DATA_VA = 0x0000007123504000
attr_data {
	Name	 = .CPSEC_SEG_1,
	VA	 = 0x0000007123504000,
	RA	 = 0x0000006789aa2000,
	PA	 = ra2pa(0x0000006789aa2000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.data
.global MEM_SEC_DATA1_START
MEM_SEC_DATA1_START:
.xword 0xc4c3839c85798dd6
.xword 0x49af30a3f498c5e9
.xword 0x58872da83bf7375d
.xword 0xaaff3c7bdc0bcf75
.xword 0xfded973a81b9c824
.xword 0x31b9cedf9db6bb2c
.xword 0xea9da73039c711ee
.xword 0x253cdeffb9da9b1f
.xword 0x857a06ca17a608d2
.xword 0x7d47979932774790
.xword 0x3269956bba81f385
.xword 0xab36a1ef1e93816d
.xword 0x3473d335e305cb73
.xword 0xffc82624638dc014
.xword 0xc591eafabf836b77
.xword 0x94edf807541ea18a
.xword 0x7689052ddd481275




SECTION .CPSEC_SEG_2 DATA_VA = 0x0000007123508000
attr_data {
	Name	 = .CPSEC_SEG_2,
	VA	 = 0x0000007123508000,
	RA	 = 0x0000006789aa4000,
	PA	 = ra2pa(0x0000006789aa4000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.data
.global MEM_SEC_DATA2_START
MEM_SEC_DATA2_START:
.xword 0xcaec1f629112a170
.xword 0xd2e61568034c660f
.xword 0x751fa1741b7bb29d
.xword 0x7a1ca7ca39aaf0b8
.xword 0x7dab75d406a9c371
.xword 0xbf8ce4b3b8877e54
.xword 0x9d6893ee3f156027
.xword 0x54d928e063ae59a9
.xword 0xcbc4d96c82e523ac
.xword 0xf5161b8c5d646d6d
.xword 0xa2cf321f6fb9d973
.xword 0x51005b6c9a4aaa23
.xword 0xcbcac1b478346585
.xword 0x8d2052cf73711b92
.xword 0x5e0cec0e2823397e
.xword 0x48d1fbb6fa10bb1b
.xword 0x1febe3a54e682383




SECTION .CPSEC_SEG_3 DATA_VA = 0x000000712350c000
attr_data {
	Name	 = .CPSEC_SEG_3,
	VA	 = 0x000000712350c000,
	RA	 = 0x0000006789aa6000,
	PA	 = ra2pa(0x0000006789aa6000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.data
.global MEM_SEC_DATA3_START
MEM_SEC_DATA3_START:
.xword 0x031d051711199b8c
.xword 0x90115544325943cc
.xword 0x48b6f0f03e988859
.xword 0xa0dd44cf18be5c60
.xword 0x2013aedb25266dd9
.xword 0x6e74d76b178befa8
.xword 0x0e02f79c74df7360
.xword 0xb7dba0384dbf8011
.xword 0xae0285d5dfb3a598
.xword 0x6029494fe7cd834e
.xword 0x9578bde704d43faf
.xword 0xfa8cede1f96c8c82
.xword 0xd51f2c8ce483b71c
.xword 0x2ced268d0ca7c425
.xword 0x25c1efcb964d9494
.xword 0xc843381782df772b
.xword 0x62e19f4cd4d15796




SECTION .CPSEC_SEG_4 DATA_VA = 0x0000007123510000
attr_data {
	Name	 = .CPSEC_SEG_4,
	VA	 = 0x0000007123510000,
	RA	 = 0x0000006789aa8000,
	PA	 = ra2pa(0x0000006789aa8000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.data
.global MEM_SEC_DATA4_START
MEM_SEC_DATA4_START:
.xword 0x4a231f58e95ba8f2
.xword 0x6bf575c455c64a4d
.xword 0x3df4156113281da7
.xword 0xd6c2318a471c1357
.xword 0xb3834f891065c459
.xword 0x0592d9a3de96ee0d
.xword 0x520da8ff9efe69cc
.xword 0x29b7632da2ef85b7
.xword 0x5e6822d2cc4b5cb4
.xword 0x33225e0050ad9e96
.xword 0xf46387b0a6567ccc
.xword 0xa49ef65f14846dce
.xword 0x915c54fb05b08705
.xword 0x683fabcdf1fbe536
.xword 0x5ebfaad28823fce9
.xword 0x4d74e0e4ff032ad9
.xword 0xd1fa91c48a5a1dee




SECTION .CPSEC_SEG_5 DATA_VA = 0x0000007123514000
attr_data {
	Name	 = .CPSEC_SEG_5,
	VA	 = 0x0000007123514000,
	RA	 = 0x0000006789aaa000,
	PA	 = ra2pa(0x0000006789aaa000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.data
.global MEM_SEC_DATA5_START
MEM_SEC_DATA5_START:
.xword 0x283c21251f1c8483
.xword 0x4cb37ae7b3ec7430
.xword 0xa4fc347fddbdf62d
.xword 0xaa24bf8f394ed9ed
.xword 0xb0fffa9b42236967
.xword 0x771a850acccc3a6d
.xword 0xa11175fbcdbb1191
.xword 0x13bd955c235c5a4b
.xword 0xf7b74ea2528538ef
.xword 0x08d0fba10fd0edc5
.xword 0xe34d726a88710c8d
.xword 0x330c429a92ffe8dc
.xword 0x78220a064f265a86
.xword 0x9fced992eeb57f31
.xword 0xd955f3da12d2795c
.xword 0xeb734247f90d1a5b
.xword 0xab4b518724f7feab




SECTION .CPSEC_SEG_6 DATA_VA = 0x0000007123518000
attr_data {
	Name	 = .CPSEC_SEG_6,
	VA	 = 0x0000007123518000,
	RA	 = 0x0000006789aac000,
	PA	 = ra2pa(0x0000006789aac000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.data
.global MEM_SEC_DATA6_START
MEM_SEC_DATA6_START:
.xword 0x56ba52c82e4ed1ef
.xword 0x7a2e641233818315
.xword 0x8246e14158f9db55
.xword 0x5a4d0e767288aba2
.xword 0x94b6834df9962b33
.xword 0xb4887130b774407a
.xword 0xf9e7a85c6d171bc2
.xword 0xefb1becf7844682b
.xword 0x9fd89b219bc9dee7
.xword 0xcaf693fe53ac7bc5
.xword 0x67190c65bf18b05e
.xword 0x227e78b7ff3ddce1
.xword 0x5d0ab0f6b9096aa7
.xword 0xd8ba5e3103fc37b5
.xword 0x1cb5788d256baa33
.xword 0x50cc4e53bb5a924b
.xword 0x9bb180e25ce866b7




SECTION .CPSEC_SEG_7 DATA_VA = 0x000000712351c000
attr_data {
	Name	 = .CPSEC_SEG_7,
	VA	 = 0x000000712351c000,
	RA	 = 0x0000006789aae000,
	PA	 = ra2pa(0x0000006789aae000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.data
.global MEM_SEC_DATA7_START
MEM_SEC_DATA7_START:
.xword 0x04d59da979f25d5e
.xword 0x447add785c594bf3
.xword 0xf931e765e1b8ebf5
.xword 0x5a22780d8ee018e6
.xword 0xe8688b486cb02a7a
.xword 0x5189069711955371
.xword 0x2e153b5dc98f47f9
.xword 0x9278066bea412cfc
.xword 0x0ddaceac68e06a58
.xword 0xa86a3374506fed8d
.xword 0x707f36ca5d364df9
.xword 0x588f70eb2510bc43
.xword 0x6953c135164665ce
.xword 0xb570bd5bac6d8e52
.xword 0x73f02723beac44f6
.xword 0xbbb32663c442f562
.xword 0x9c050134f0fb0435






SECTION .IOSEC_SEG_0 DATA_VA = 0x0000004567980000
attr_data {
	Name	 = .IOSEC_SEG_0,
	VA	 = 0x0000004567980000,
	RA	 = 0x0000004567880000,
	PA	 = ra2pa(0x0000004567880000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0xae74162d3062eb7b
.xword 0x06492a1bc4587444
.xword 0xbf71d7e3e8b565c1
.xword 0xc445b6bbfeb34590
.xword 0xc99c6d0ca06d75a9
.xword 0xdff043f88f33a8be
.xword 0x5a3dd44b3d8f1c37
.xword 0x52fca92dd7c91c95




SECTION .IOSEC_SEG_1 DATA_VA = 0x0000004567984000
attr_data {
	Name	 = .IOSEC_SEG_1,
	VA	 = 0x0000004567984000,
	RA	 = 0x0000004567882000,
	PA	 = ra2pa(0x0000004567882000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0x83484c75efc3f809
.xword 0x2ad5124328c89ea6
.xword 0xf7449f3e012a2ee4
.xword 0xb7e6d60b0bae0d6d
.xword 0xd0172d03e3d26da5
.xword 0x2373b4e7e47aa5db
.xword 0x62e51a1fff0f20db
.xword 0xf971b03a92f5b945




SECTION .IOSEC_SEG_2 DATA_VA = 0x0000004567988000
attr_data {
	Name	 = .IOSEC_SEG_2,
	VA	 = 0x0000004567988000,
	RA	 = 0x0000004567884000,
	PA	 = ra2pa(0x0000004567884000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0xf481fed68f757774
.xword 0xbaebb834b879fd18
.xword 0x53d5053f987f66c1
.xword 0x2432da5062892b3f
.xword 0x4f92ed4cf3f02a59
.xword 0x0901391700d5849d
.xword 0x61e787218e528048
.xword 0xbb24aae27f38dd92




SECTION .IOSEC_SEG_3 DATA_VA = 0x000000456798c000
attr_data {
	Name	 = .IOSEC_SEG_3,
	VA	 = 0x000000456798c000,
	RA	 = 0x0000004567886000,
	PA	 = ra2pa(0x0000004567886000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0x1462cb086ede4b31
.xword 0xe7a7ba4d9b77aeb9
.xword 0x289a73b6c270a4fa
.xword 0x5d8d243174ca8544
.xword 0x34a6363cda0c9fd8
.xword 0x62144cd596df11b2
.xword 0xa80d69f13ddf9e69
.xword 0x226254612fbfe8c2




SECTION .IOSEC_SEG_4 DATA_VA = 0x0000004567990000
attr_data {
	Name	 = .IOSEC_SEG_4,
	VA	 = 0x0000004567990000,
	RA	 = 0x0000004567888000,
	PA	 = ra2pa(0x0000004567888000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0xe862678235cdfc4c
.xword 0x192f8f83e269e1fe
.xword 0xf44816e7306a2ae8
.xword 0x7e614904e891fa1b
.xword 0x727d23bdfa8694fc
.xword 0xca843f07aea5ab92
.xword 0x1f0fdd35342ce2e2
.xword 0x9ef7613ffde7454b




SECTION .IOSEC_SEG_5 DATA_VA = 0x0000004567994000
attr_data {
	Name	 = .IOSEC_SEG_5,
	VA	 = 0x0000004567994000,
	RA	 = 0x000000456788a000,
	PA	 = ra2pa(0x000000456788a000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0xea8d704a97e5b17d
.xword 0xdfa28764beb50b95
.xword 0xbb99d494ff5d6a3b
.xword 0x3f54e10f71facd3f
.xword 0x1a46bca7b4a01a78
.xword 0xd0832786e2871bb3
.xword 0xe9846a424b789cc9
.xword 0x210f9a9285f58819




SECTION .IOSEC_SEG_6 DATA_VA = 0x0000004567998000
attr_data {
	Name	 = .IOSEC_SEG_6,
	VA	 = 0x0000004567998000,
	RA	 = 0x000000456788c000,
	PA	 = ra2pa(0x000000456788c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0x1bdd00c4cd3ac299
.xword 0xc4c2b29eb0896374
.xword 0x8fb87c2be7fe6355
.xword 0xd8c2397d3908e0d6
.xword 0xf100372955b0e0a7
.xword 0x1ad6d1fc7b812508
.xword 0x62f17ec43077989c
.xword 0x9705833d48e186a9




SECTION .IOSEC_SEG_7 DATA_VA = 0x000000456799c000
attr_data {
	Name	 = .IOSEC_SEG_7,
	VA	 = 0x000000456799c000,
	RA	 = 0x000000456788e000,
	PA	 = ra2pa(0x000000456788e000,0),
	part_0_ctx_nonzero_tsb_config_1,
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0x5f414d57f01ed77d
.xword 0x3aa1db4867773693
.xword 0xfb08c7d7d087447d
.xword 0x1280babfbbedaba8
.xword 0xfe719244bb4da686
.xword 0xac830f8c1f97ed62
.xword 0xc13c5ea696069cc6
.xword 0x51087a988887968b






SECTION .CPNUC_SEG_0 DATA_VA = 0x00000019aba00000
attr_data {
	Name	 = .CPNUC_SEG_0,
	VA	 = 0x00000019aba00000,
	RA	 = 0x00000069debc0000,
	PA	 = ra2pa(0x00000069debc0000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0xe659b083ef047ad4
.xword 0xb643a984dd50b29e
.xword 0x16b9b3fc1c77d980
.xword 0xcad5e6b961f009f6
.xword 0x66639f7bf8201b8e
.xword 0x973b9f1f403a76b9
.xword 0xf53b292da5a5d8c5
.xword 0x1d88e5c14911c8ec




SECTION .CPNUC_SEG_1 DATA_VA = 0x00000019aba04000
attr_data {
	Name	 = .CPNUC_SEG_1,
	VA	 = 0x00000019aba04000,
	RA	 = 0x00000069debc2000,
	PA	 = ra2pa(0x00000069debc2000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0xf2cc6d0b8704dc86
.xword 0x82a5e43d0502b194
.xword 0xd152e94c929fff5d
.xword 0x2ffbb828492a2765
.xword 0x56306124654f0560
.xword 0x87af4120fd40667a
.xword 0x50220a9acdff11e2
.xword 0xc9f0d942a5d31e57




SECTION .CPNUC_SEG_2 DATA_VA = 0x00000019aba08000
attr_data {
	Name	 = .CPNUC_SEG_2,
	VA	 = 0x00000019aba08000,
	RA	 = 0x00000069debc4000,
	PA	 = ra2pa(0x00000069debc4000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x218ea1d15d93930d
.xword 0x3428a5c436ac2544
.xword 0x171bbb0d99995668
.xword 0x9d106220a551ee3b
.xword 0x4dd9230b3768c3e4
.xword 0xd91677871ee67fd4
.xword 0x280ff4bb2b3d8d96
.xword 0x9c6936aa79d24feb




SECTION .CPNUC_SEG_3 DATA_VA = 0x00000019aba0c000
attr_data {
	Name	 = .CPNUC_SEG_3,
	VA	 = 0x00000019aba0c000,
	RA	 = 0x00000069debc6000,
	PA	 = ra2pa(0x00000069debc6000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0x137e7638c5e425a6
.xword 0xb7dd4b9aa15d62e6
.xword 0x0374d5b383eb864d
.xword 0x87e4ebd980aed8bc
.xword 0x05073d2d6136154a
.xword 0x049c2f7f39999cd2
.xword 0x211a860c6a6819a6
.xword 0x4091affcbb1409a4




SECTION .CPNUC_SEG_4 DATA_VA = 0x00000019aba10000
attr_data {
	Name	 = .CPNUC_SEG_4,
	VA	 = 0x00000019aba10000,
	RA	 = 0x00000069debc8000,
	PA	 = ra2pa(0x00000069debc8000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0x0e728313c26d44db
.xword 0x33225004a21ebf0e
.xword 0x25e3f17ef320cc6b
.xword 0xa8b049d14e3e3620
.xword 0xaab37939940b3a94
.xword 0x0ecaa09dcf784743
.xword 0xe71ef426ec487364
.xword 0x6c1c1946b33312fe




SECTION .CPNUC_SEG_5 DATA_VA = 0x00000019aba14000
attr_data {
	Name	 = .CPNUC_SEG_5,
	VA	 = 0x00000019aba14000,
	RA	 = 0x00000069debca000,
	PA	 = ra2pa(0x00000069debca000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x462cd961eeb8208a
.xword 0x5771f6b84f21a1f6
.xword 0x56c9c1c4c19d7983
.xword 0x71b794a861f2cff9
.xword 0x9ffcd33b44a0d3b6
.xword 0x8cb1ecdf4510ad16
.xword 0x470a929d83c9ec93
.xword 0xa8ccabc1fcd0de8b




SECTION .CPNUC_SEG_6 DATA_VA = 0x00000019aba18000
attr_data {
	Name	 = .CPNUC_SEG_6,
	VA	 = 0x00000019aba18000,
	RA	 = 0x00000069debcc000,
	PA	 = ra2pa(0x00000069debcc000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0x72b3526fa8ad48d9
.xword 0x3b7af121e8961973
.xword 0x990f5800f408621b
.xword 0x31070b837b2aeab3
.xword 0xfb8f7f7000a372ec
.xword 0x787020a71eb02b8f
.xword 0xec47e56a2bdc805b
.xword 0x691149e2e6f59be0




SECTION .CPNUC_SEG_7 DATA_VA = 0x00000019aba1c000
attr_data {
	Name	 = .CPNUC_SEG_7,
	VA	 = 0x00000019aba1c000,
	RA	 = 0x00000069debce000,
	PA	 = ra2pa(0x00000069debce000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x5aed22a79461156e
.xword 0x14d98fd96080c6de
.xword 0x4c8f156064a56568
.xword 0xbc3d9a96d0bec7ec
.xword 0x1c49d8964e0ce1e5
.xword 0x87643c2de5bcdc0d
.xword 0x7b6dc259f7a5342f
.xword 0x4a91d5d0f1c598d0






SECTION .IONUC_SEG_0 DATA_VA = 0x0000004def280000
attr_data {
	Name	 = .IONUC_SEG_0,
	VA	 = 0x0000004def280000,
	RA	 = 0x00000049abcd0000,
	PA	 = ra2pa(0x00000049abcd0000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0xc0a75f7d5945a67c
.xword 0x4dbaa8904dc34946
.xword 0x2da190fb0304cd82
.xword 0xc08bd21c95e48ffb
.xword 0xef51c03eb28d1a02
.xword 0x9e21a872418bbd57
.xword 0x14b9d118bb8104b5
.xword 0x9d6f490c861741c0




SECTION .IONUC_SEG_1 DATA_VA = 0x0000004def284000
attr_data {
	Name	 = .IONUC_SEG_1,
	VA	 = 0x0000004def284000,
	RA	 = 0x00000049abcd2000,
	PA	 = ra2pa(0x00000049abcd2000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0x893213ccf6f9d487
.xword 0x8be935fcfefdd189
.xword 0x4106087ecbb6040f
.xword 0x41a8ff23ee3e55b2
.xword 0x330eb92f85a5575f
.xword 0x190870d8416f602c
.xword 0x76e463f1cbfdd565
.xword 0x9017d05030459e57




SECTION .IONUC_SEG_2 DATA_VA = 0x0000004def288000
attr_data {
	Name	 = .IONUC_SEG_2,
	VA	 = 0x0000004def288000,
	RA	 = 0x00000049abcd4000,
	PA	 = ra2pa(0x00000049abcd4000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0xd8b5397fdc0a5d5d
.xword 0xa782fa068043ccae
.xword 0x7a06ca7200925d8a
.xword 0xb8df4b33633b8e35
.xword 0xf1d68b11d590ff4e
.xword 0xbdc4f7573f977c2d
.xword 0x0b803f8bd8ea63c5
.xword 0xdc5558facdb1752b




SECTION .IONUC_SEG_3 DATA_VA = 0x0000004def28c000
attr_data {
	Name	 = .IONUC_SEG_3,
	VA	 = 0x0000004def28c000,
	RA	 = 0x00000049abcd6000,
	PA	 = ra2pa(0x00000049abcd6000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0xc871768ae8e7b100
.xword 0x5beb220997e2d9cf
.xword 0x28b8dac530f093da
.xword 0x67639cfa07edad98
.xword 0x5901def05eb33652
.xword 0xd396f46cc05b0ce2
.xword 0x849b20319b79522e
.xword 0xf99e3901573603ff




SECTION .IONUC_SEG_4 DATA_VA = 0x0000004def290000
attr_data {
	Name	 = .IONUC_SEG_4,
	VA	 = 0x0000004def290000,
	RA	 = 0x00000049abcd8000,
	PA	 = ra2pa(0x00000049abcd8000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0x244180f0ea33c4d5
.xword 0x39dd2cf7c43a33a3
.xword 0x5e11e32faecafca9
.xword 0xe0676b36dba0ec94
.xword 0x842055fd42fc4ad3
.xword 0x46d601f1df586854
.xword 0xc91162f75d151003
.xword 0x9bdfd50a25aa4a97




SECTION .IONUC_SEG_5 DATA_VA = 0x0000004def294000
attr_data {
	Name	 = .IONUC_SEG_5,
	VA	 = 0x0000004def294000,
	RA	 = 0x00000049abcda000,
	PA	 = ra2pa(0x00000049abcda000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0xb727db9768252abe
.xword 0x6ac25f16251a6b7f
.xword 0x18cabb7051ef68ea
.xword 0x94508df8b65243ac
.xword 0xfc38b7ab51a6907b
.xword 0xc0d8b729390bea6a
.xword 0xda5c05d2cd75c4e6
.xword 0x8e0cf18065f20305




SECTION .IONUC_SEG_6 DATA_VA = 0x0000004def298000
attr_data {
	Name	 = .IONUC_SEG_6,
	VA	 = 0x0000004def298000,
	RA	 = 0x00000049abcdc000,
	PA	 = ra2pa(0x00000049abcdc000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0xed48a46dc82174e7
.xword 0x677a86093d7d9ce1
.xword 0x272a87bf04d2f1c5
.xword 0xb038d41c56471a2d
.xword 0x29135725812b3956
.xword 0x46c9e2b11e6d0b3b
.xword 0x85e95b64597848fd
.xword 0x5919f503d700cf6f




SECTION .IONUC_SEG_7 DATA_VA = 0x0000004def29c000
attr_data {
	Name	 = .IONUC_SEG_7,
	VA	 = 0x0000004def29c000,
	RA	 = 0x00000049abcde000,
	PA	 = ra2pa(0x00000049abcde000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0x3b7723721c0ec76e
.xword 0xaee345adcefd2c5c
.xword 0xf26e4710c8499175
.xword 0x2a26649273697339
.xword 0x9c13cc735c72f7b1
.xword 0x308a9662e5d7d553
.xword 0x48d132fabedefa07
.xword 0x480a1e8f223aed99






SECTION .CP_REAL_MEM_SEG_0 DATA_VA = 0x00000000ef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_0,
	VA	 = 0x00000000ef300000,
	RA	 = 0x00000000ef300000,
	PA	 = ra2pa(0x00000000ef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.data
.global MEM_REAL_DATA0_START
MEM_REAL_DATA0_START:
.xword 0x1bc0eb4bd77f279e
.xword 0x65e54332824d33b5
.xword 0x1248b16548b3e784
.xword 0x05250d4900c1c8b7
.xword 0x2cdaf2c38d5f2454
.xword 0xa146b4ab844d47c0
.xword 0xcd66029ed5026410
.xword 0x1645f13b6f1896cc
.xword 0x01c7ee655eb058c6
.xword 0x2dedaf6d00b82225
.xword 0x4334ee86f97a221e
.xword 0x892f602ebe7a7c7a
.xword 0x4cfc0c1ffc8b39a1
.xword 0x21f5c0a84cda8dab
.xword 0x6751a9a3e24aa33b
.xword 0xbd9de58613905620
.xword 0x319cf5c84549baec
.xword 0x195c168e7785740c
.xword 0x2839eb521aaaaa7f
.xword 0x7071c96c9abdb88a
.xword 0xd1245d2d4d6dca21
.xword 0x80a6f3399d667d08
.xword 0x12005b6708023267
.xword 0x63c8f6ae92a4fb57
.xword 0x7c9609f5d321faeb
.xword 0x3b317c208d23aeb8
.xword 0x7019e0394788f551
.xword 0xd43dd0865d9d9f83
.xword 0x9f1018221816084c
.xword 0x54a1c582b96601de
.xword 0xcdf85dacf3396ed5
.xword 0xec46ee623cbd993d



SECTION .CP_REAL_MEM_SEG_1 DATA_VA = 0x00000001ef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_1,
	VA	 = 0x00000001ef300000,
	RA	 = 0x00000001ef300000,
	PA	 = ra2pa(0x00000001ef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_REAL_DATA1_START
MEM_REAL_DATA1_START:
.xword 0x0961918314916986
.xword 0x93e94a4ccdaa56ab
.xword 0xf8846272d20cdf9d
.xword 0xd9417fc02dbd9829
.xword 0xf8803649e2ad63ac
.xword 0x97ca90f834f979f7
.xword 0x1fe783852c6f1c23
.xword 0x73398e8a62226736
.xword 0x0211358ffc855299



SECTION .CP_REAL_MEM_SEG_2 DATA_VA = 0x00000002ef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_2,
	VA	 = 0x00000002ef300000,
	RA	 = 0x00000002ef300000,
	PA	 = ra2pa(0x00000002ef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_REAL_DATA2_START
MEM_REAL_DATA2_START:
.xword 0x2e0e75292eba033f
.xword 0x904948b6761514ae
.xword 0x2a5666e11f60ee11
.xword 0x780e242b2b0345bf
.xword 0x5e30ba53639f5efa
.xword 0xdfc5303a92283142
.xword 0x1364b1bdf78ee347
.xword 0xacb39ce5eb05b681
.xword 0x85b332c60f798735



SECTION .CP_REAL_MEM_SEG_3 DATA_VA = 0x00000003ef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_3,
	VA	 = 0x00000003ef300000,
	RA	 = 0x00000003ef300000,
	PA	 = ra2pa(0x00000003ef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.data
.global MEM_REAL_DATA3_START
MEM_REAL_DATA3_START:
.xword 0xc0ef67f5f4c74b25
.xword 0x401d6c8978e4f549
.xword 0x1a1aa974b495dbca
.xword 0x09b3c487009bb2c0
.xword 0x8f73bd3b95059d13
.xword 0x25d7642aedf3c06c
.xword 0x187720dae5574acd
.xword 0x57a81f3b66c53b7a
.xword 0xb890504cf4449e60



SECTION .CP_REAL_MEM_SEG_4 DATA_VA = 0x00000008ef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_4,
	VA	 = 0x00000008ef300000,
	RA	 = 0x00000008ef300000,
	PA	 = ra2pa(0x00000008ef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_REAL_DATA4_START
MEM_REAL_DATA4_START:
.xword 0x9e4ad0e6a493ecfe
.xword 0x2e25d394e9a6138c
.xword 0x2a74df56add48977
.xword 0xd11e9ee44c08b07e
.xword 0x2d028efca7d1e557
.xword 0x96a90dc40c29fb54
.xword 0x161ab82deb0596ad
.xword 0x3f0d342e1c067ba6
.xword 0x9b7030d6c3e21867



SECTION .CP_REAL_MEM_SEG_5 DATA_VA = 0x00000009ef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_5,
	VA	 = 0x00000009ef300000,
	RA	 = 0x00000009ef300000,
	PA	 = ra2pa(0x00000009ef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.data
.global MEM_REAL_DATA5_START
MEM_REAL_DATA5_START:
.xword 0x9954c2f04aaca2ae
.xword 0x9d2d89c8f3e9dcac
.xword 0x78abf1d4469a0cfb
.xword 0x9f7dce3ac8f4be2b
.xword 0x4076bec266336c78
.xword 0x3fe2e34fe334719f
.xword 0xd2c296edd5a64e48
.xword 0x0a64d978f4000de3
.xword 0x64b5b98ec3850714



SECTION .CP_REAL_MEM_SEG_6 DATA_VA = 0x0000000aef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_6,
	VA	 = 0x0000000aef300000,
	RA	 = 0x0000000aef300000,
	PA	 = ra2pa(0x0000000aef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.data
.global MEM_REAL_DATA6_START
MEM_REAL_DATA6_START:
.xword 0x08d7a293089a466b
.xword 0x9fe0d1404fbc3a33
.xword 0x604f637bf7b30e0e
.xword 0x1676e44135b0c2b6
.xword 0xfe2121c917d8f38d
.xword 0xdb70d3a00d20935b
.xword 0xe4ed0574515cfea6
.xword 0xe5ccaab2fd6fdfc2
.xword 0x364ac525999c53c0



SECTION .CP_REAL_MEM_SEG_7 DATA_VA = 0x0000000bef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_7,
	VA	 = 0x0000000bef300000,
	RA	 = 0x0000000bef300000,
	PA	 = ra2pa(0x0000000bef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_REAL_DATA7_START
MEM_REAL_DATA7_START:
.xword 0xf1b6c160aa92270b
.xword 0x9fa6ea6b1ae7d887
.xword 0x3b43c9e0ef9a2aa6
.xword 0xd133afa9cdce2767
.xword 0x9f5632e659de0488
.xword 0x8396a2907212e0f7
.xword 0x2267440fdc623f20
.xword 0x7942f693f8efa06c
.xword 0x92b06093f4818913



SECTION .CP_REAL_MEM_SEG_8 DATA_VA = 0x00000020ef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_8,
	VA	 = 0x00000020ef300000,
	RA	 = 0x00000020ef300000,
	PA	 = ra2pa(0x00000020ef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.data
.global MEM_REAL_DATA8_START
MEM_REAL_DATA8_START:
.xword 0x10d06624ef609a46
.xword 0xf143ad84cb65a461
.xword 0xe18f143021a98535
.xword 0x64ee73f967e76b04
.xword 0xa830f75a457df652
.xword 0x1d3d62e0a31cf2a6
.xword 0x2f2c4ba0c02b1bd3
.xword 0x0f6b5c5fe9012e53
.xword 0xf28ca6d7413ee993



SECTION .CP_REAL_MEM_SEG_9 DATA_VA = 0x00000021ef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_9,
	VA	 = 0x00000021ef300000,
	RA	 = 0x00000021ef300000,
	PA	 = ra2pa(0x00000021ef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.data
.global MEM_REAL_DATA9_START
MEM_REAL_DATA9_START:
.xword 0x930feeacf7fca67b
.xword 0x22076691a5c01a01
.xword 0xc42297017b157b96
.xword 0xaf6918d867550209
.xword 0x80c3f8563e70e52e
.xword 0x61176c206ec7e9f7
.xword 0x005d2ad50ef08cce
.xword 0x3ae0aa601661f6f9
.xword 0x587d45e6f5efccf1



SECTION .CP_REAL_MEM_SEG_10 DATA_VA = 0x00000022ef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_10,
	VA	 = 0x00000022ef300000,
	RA	 = 0x00000022ef300000,
	PA	 = ra2pa(0x00000022ef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.data
.global MEM_REAL_DATA10_START
MEM_REAL_DATA10_START:
.xword 0xe530cc5b57e3f991
.xword 0x242bcfe2b5f8bc42
.xword 0x2099fb1e5b4c607d
.xword 0x828e79fc01b0c2b5
.xword 0xf1e75fe83c712722
.xword 0x400263317c33e4e8
.xword 0xa5eef6f03f830c63
.xword 0x4c0cf05234b2fe28
.xword 0x7681393fbc975ba6



SECTION .CP_REAL_MEM_SEG_11 DATA_VA = 0x00000023ef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_11,
	VA	 = 0x00000023ef300000,
	RA	 = 0x00000023ef300000,
	PA	 = ra2pa(0x00000023ef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_REAL_DATA11_START
MEM_REAL_DATA11_START:
.xword 0x2c3d1bad1878dca1
.xword 0x094ea5f6c6688afa
.xword 0xa33e1783965d0bbe
.xword 0x8fb81ebb607b524a
.xword 0x29c6792d1c64e9ac
.xword 0xa8acbb76445c16bd
.xword 0x40ebedc151e1c669
.xword 0xcfa19273a052a987
.xword 0x225457b4bb4f0b50



SECTION .CP_REAL_MEM_SEG_12 DATA_VA = 0x00000028ef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_12,
	VA	 = 0x00000028ef300000,
	RA	 = 0x00000028ef300000,
	PA	 = ra2pa(0x00000028ef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.data
.global MEM_REAL_DATA12_START
MEM_REAL_DATA12_START:
.xword 0xc2066c131da52dd7
.xword 0x6b7d2667e2efae6d
.xword 0x4fde716824b73b47
.xword 0xd546547c0b2970ee
.xword 0xb5fa877e0bb01c61
.xword 0x4b5a10c62145cf59
.xword 0x6da6d1a3cbea4c4d
.xword 0x05e2399996be5028
.xword 0x85fc005ea6428a68



SECTION .CP_REAL_MEM_SEG_13 DATA_VA = 0x00000029ef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_13,
	VA	 = 0x00000029ef300000,
	RA	 = 0x00000029ef300000,
	PA	 = ra2pa(0x00000029ef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.data
.global MEM_REAL_DATA13_START
MEM_REAL_DATA13_START:
.xword 0x47b6791af888efa5
.xword 0xb6f2b936cb36604f
.xword 0x9f95915bfc4460e9
.xword 0xf6383ca51ae92bd3
.xword 0x13ddc28169e23d58
.xword 0x722212872eb329d0
.xword 0xe49eff1846ec8ed2
.xword 0xa2907a94506ee013
.xword 0x759f2fdc49920885



SECTION .CP_REAL_MEM_SEG_14 DATA_VA = 0x0000002aef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_14,
	VA	 = 0x0000002aef300000,
	RA	 = 0x0000002aef300000,
	PA	 = ra2pa(0x0000002aef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_REAL_DATA14_START
MEM_REAL_DATA14_START:
.xword 0x675a4b65f02d0c55
.xword 0x596b1542e7ee7f3a
.xword 0xd32667b704b08baa
.xword 0x37e59c85570fc991
.xword 0x2668ce78952f7924
.xword 0xfc873c0a3ced8cdb
.xword 0x4c93cd6144145810
.xword 0x499d35e0f3d48eca
.xword 0x8263708dd3563d4e



SECTION .CP_REAL_MEM_SEG_15 DATA_VA = 0x0000002bef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_15,
	VA	 = 0x0000002bef300000,
	RA	 = 0x0000002bef300000,
	PA	 = ra2pa(0x0000002bef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.data
.global MEM_REAL_DATA15_START
MEM_REAL_DATA15_START:
.xword 0xafe67e2a6bf405dd
.xword 0xc10683edeed6a6b8
.xword 0x08fbf35e0bba04db
.xword 0xd2d71d2f22d1a2d3
.xword 0xb838ff491bfef02a
.xword 0x4a4014fd3b730228
.xword 0x5f152c69802a3d0d
.xword 0x5fd8d2f2e5789950
.xword 0x59a24af6c8f6d24e



SECTION .CP_REAL_MEM_SEG_16 DATA_VA = 0x00000040ef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_16,
	VA	 = 0x00000040ef300000,
	RA	 = 0x00000040ef300000,
	PA	 = ra2pa(0x00000040ef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.data
.global MEM_REAL_DATA16_START
MEM_REAL_DATA16_START:
.xword 0xb0a52dba5ce16922
.xword 0xd61d6f2df215a464
.xword 0xd5127d3698a70732
.xword 0x3b0ca570f04e8331
.xword 0xf6a4e3f81e6e3a6c
.xword 0x3ec14940b11f5b0b
.xword 0x0e058203e83a021e
.xword 0x8a1d57514b746f2b
.xword 0xe1510a3198f49b8b



SECTION .CP_REAL_MEM_SEG_17 DATA_VA = 0x00000041ef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_17,
	VA	 = 0x00000041ef300000,
	RA	 = 0x00000041ef300000,
	PA	 = ra2pa(0x00000041ef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.data
.global MEM_REAL_DATA17_START
MEM_REAL_DATA17_START:
.xword 0x09b7ed613444cf49
.xword 0x1258ec482003c6e1
.xword 0x520de7f1ddf5072b
.xword 0xfc18aa791a7070c4
.xword 0x7a2bcc01224a09be
.xword 0xb73d060138b02b2d
.xword 0x4568a09755b0c8ed
.xword 0x564f8cc94da4aa0b
.xword 0x7d4b2717ffff74ba



SECTION .CP_REAL_MEM_SEG_18 DATA_VA = 0x00000042ef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_18,
	VA	 = 0x00000042ef300000,
	RA	 = 0x00000042ef300000,
	PA	 = ra2pa(0x00000042ef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.data
.global MEM_REAL_DATA18_START
MEM_REAL_DATA18_START:
.xword 0xc341a730f8395afb
.xword 0xa6dbf3be05aac9ce
.xword 0x66a5159308a17440
.xword 0xe5d620baacbd03a5
.xword 0xc0fe133b8f52401a
.xword 0x7eb988acd6069582
.xword 0x713b61b892750146
.xword 0x99377da0740cc702
.xword 0x7f7414b7309d29f9



SECTION .CP_REAL_MEM_SEG_19 DATA_VA = 0x00000043ef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_19,
	VA	 = 0x00000043ef300000,
	RA	 = 0x00000043ef300000,
	PA	 = ra2pa(0x00000043ef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_REAL_DATA19_START
MEM_REAL_DATA19_START:
.xword 0x9ed00a532e7dbd25
.xword 0xb021755c9eaccbe1
.xword 0xc02541c7d331d0f5
.xword 0x2a9a09a15116f206
.xword 0x198fbbf915cbc47c
.xword 0x128aa45ed3e631c8
.xword 0x5ce5ce9b1f9a0e33
.xword 0x692073b2a64063f5
.xword 0x51c7facab436d55c



SECTION .CP_REAL_MEM_SEG_20 DATA_VA = 0x00000048ef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_20,
	VA	 = 0x00000048ef300000,
	RA	 = 0x00000048ef300000,
	PA	 = ra2pa(0x00000048ef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_REAL_DATA20_START
MEM_REAL_DATA20_START:
.xword 0x0f43970ecd2d2cb8
.xword 0xa34f74d0a44e2bec
.xword 0xf63c413ffc236f58
.xword 0x8521956e2a64341c
.xword 0x2eee3cae01ec0fa4
.xword 0xd0c01b86a8df90c2
.xword 0xe84f1d23ca36cfeb
.xword 0xf8670ba0811e5a45
.xword 0xda83cdae1dbaaa0c



SECTION .CP_REAL_MEM_SEG_21 DATA_VA = 0x00000049ef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_21,
	VA	 = 0x00000049ef300000,
	RA	 = 0x00000049ef300000,
	PA	 = ra2pa(0x00000049ef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.data
.global MEM_REAL_DATA21_START
MEM_REAL_DATA21_START:
.xword 0x503230451e880ce3
.xword 0xa62725deabe1629a
.xword 0x00a3090726f5ba57
.xword 0x0d3b73fa0875cf25
.xword 0x57156e3ef1751798
.xword 0x7ea5a9a7e2f61228
.xword 0xdd737684d2c37a49
.xword 0xbb755346711d37df
.xword 0x414fb4f2226067ef



SECTION .CP_REAL_MEM_SEG_22 DATA_VA = 0x0000004aef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_22,
	VA	 = 0x0000004aef300000,
	RA	 = 0x0000004aef300000,
	PA	 = ra2pa(0x0000004aef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_REAL_DATA22_START
MEM_REAL_DATA22_START:
.xword 0xca595ae468b902d3
.xword 0x114b9eaf5283ce80
.xword 0xa9181365f9a8cabf
.xword 0x7bfe6908a59732e4
.xword 0x12430c316d98b568
.xword 0x05a3d1ca4440ba86
.xword 0x8bd54e21cdd47554
.xword 0x58c77a5e40c3bebd
.xword 0xa985ba2f8f223708



SECTION .CP_REAL_MEM_SEG_23 DATA_VA = 0x0000004bef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_23,
	VA	 = 0x0000004bef300000,
	RA	 = 0x0000004bef300000,
	PA	 = ra2pa(0x0000004bef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.data
.global MEM_REAL_DATA23_START
MEM_REAL_DATA23_START:
.xword 0xc2a247f20d2e2bb7
.xword 0xa20173ea18658ece
.xword 0x8d265ea7fdba049e
.xword 0xa85199772c238660
.xword 0x42647120df69b28b
.xword 0x1803667f9d722656
.xword 0x0e2332d9fc79c877
.xword 0xd689c9c6cf416201
.xword 0x4bb9bcbfd2006f52



SECTION .CP_REAL_MEM_SEG_24 DATA_VA = 0x00000060ef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_24,
	VA	 = 0x00000060ef300000,
	RA	 = 0x00000060ef300000,
	PA	 = ra2pa(0x00000060ef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.data
.global MEM_REAL_DATA24_START
MEM_REAL_DATA24_START:
.xword 0xe649faefe2406c05
.xword 0x05088294103e059b
.xword 0xa115eaeb7261f61e
.xword 0x66181cb3c79982a5
.xword 0xe756dfecae866ff5
.xword 0xf7086960adf93750
.xword 0xed74652b83d24675
.xword 0x6862b7eff2b5635d
.xword 0x05986ece62c35940



SECTION .CP_REAL_MEM_SEG_25 DATA_VA = 0x00000061ef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_25,
	VA	 = 0x00000061ef300000,
	RA	 = 0x00000061ef300000,
	PA	 = ra2pa(0x00000061ef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_REAL_DATA25_START
MEM_REAL_DATA25_START:
.xword 0x267ba40ef1f23161
.xword 0x145ee84694473397
.xword 0xd72ca468577c1af0
.xword 0x235691c7bbc9f616
.xword 0x590a0e65ddf5870a
.xword 0xffdea211f36ae10b
.xword 0x174e9a28406fa94e
.xword 0x233c38c5c16cac33
.xword 0xa5752b1823ca9d8c



SECTION .CP_REAL_MEM_SEG_26 DATA_VA = 0x00000062ef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_26,
	VA	 = 0x00000062ef300000,
	RA	 = 0x00000062ef300000,
	PA	 = ra2pa(0x00000062ef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.data
.global MEM_REAL_DATA26_START
MEM_REAL_DATA26_START:
.xword 0xc8d318c95aeede3e
.xword 0x18d9b0f44f304891
.xword 0x51e084a2b7849ce7
.xword 0xa1ec818989030d35
.xword 0x503a45416bb4a21d
.xword 0xb5d9f832b040e150
.xword 0xd3eefb1bb3654fdf
.xword 0x62b2edea8225fc26
.xword 0x82cf179119b7230d



SECTION .CP_REAL_MEM_SEG_27 DATA_VA = 0x00000063ef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_27,
	VA	 = 0x00000063ef300000,
	RA	 = 0x00000063ef300000,
	PA	 = ra2pa(0x00000063ef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global MEM_REAL_DATA27_START
MEM_REAL_DATA27_START:
.xword 0xd918bbbdaf6d32b7
.xword 0x116762a69f8ad43b
.xword 0x88e360c2ea1eeeb6
.xword 0xc58090769e8d82ad
.xword 0xaf5491d1dd28b929
.xword 0x9a16245ed01018c5
.xword 0xbdc5f7aee5d6175b
.xword 0x1920fa74b48ce923
.xword 0x69a439bd26dc63c0



SECTION .CP_REAL_MEM_SEG_28 DATA_VA = 0x00000068ef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_28,
	VA	 = 0x00000068ef300000,
	RA	 = 0x00000068ef300000,
	PA	 = ra2pa(0x00000068ef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.data
.global MEM_REAL_DATA28_START
MEM_REAL_DATA28_START:
.xword 0x3cf01b8254543524
.xword 0x8d628686c6deb326
.xword 0x215e72d0232139a9
.xword 0xbdecacc4fa049994
.xword 0xfb3062b411c07e40
.xword 0x4f6d03975948d3fe
.xword 0xcd70c66c1ffc1263
.xword 0xbc3d445ac2ba9fc2
.xword 0x6f84148f0b5bcce3



SECTION .CP_REAL_MEM_SEG_29 DATA_VA = 0x00000069ef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_29,
	VA	 = 0x00000069ef300000,
	RA	 = 0x00000069ef300000,
	PA	 = ra2pa(0x00000069ef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.data
.global MEM_REAL_DATA29_START
MEM_REAL_DATA29_START:
.xword 0x3e3073c3cf7029f0
.xword 0xef65009007d72e3f
.xword 0xd3f72f1162bf91a9
.xword 0xec0ca259c260adae
.xword 0xae1633a91d9987b8
.xword 0xe16937c52e03b792
.xword 0x9e862dcb0e54df64
.xword 0x72cdb8b3040c1310
.xword 0xadc121f006e1aa3e



SECTION .CP_REAL_MEM_SEG_30 DATA_VA = 0x0000006aef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_30,
	VA	 = 0x0000006aef300000,
	RA	 = 0x0000006aef300000,
	PA	 = ra2pa(0x0000006aef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.data
.global MEM_REAL_DATA30_START
MEM_REAL_DATA30_START:
.xword 0xc54968d453044803
.xword 0x0bf6d65aa36faca6
.xword 0x7f91d6e3a561c931
.xword 0x3925399ee2a2da92
.xword 0x234cca6d67b7ef88
.xword 0xc81629d33f74ce56
.xword 0x174fb3ff059af146
.xword 0x5b2805573bfb4c8a
.xword 0x71879dcdc3b15ad9



SECTION .CP_REAL_MEM_SEG_31 DATA_VA = 0x0000006bef300000
attr_data {
	Name	 = .CP_REAL_MEM_SEG_31,
	VA	 = 0x0000006bef300000,
	RA	 = 0x0000006bef300000,
	PA	 = ra2pa(0x0000006bef300000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.data
.global MEM_REAL_DATA31_START
MEM_REAL_DATA31_START:
.xword 0x4eeb9bbca50df4c7
.xword 0x913957205686276a
.xword 0x676d500a1d54ba9f
.xword 0xf3899b4db42a83f1
.xword 0x12ff5d349e48712b
.xword 0x50f20e2d480672ab
.xword 0x321662055ee31914
.xword 0x4607880c1f126e9c
.xword 0x952adb9b5ac346b3





SECTION .IO_REAL_IO_SEG_0 DATA_VA = 0x0000004ef03a0000
attr_data {
	Name	 = .IO_REAL_IO_SEG_0,
	VA	 = 0x0000004ef03a0000,
	RA	 = 0x0000004ef03a0000,
	PA	 = ra2pa(0x0000004ef03a0000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0x6bb6bf0e468188e9
.xword 0x89813b8693fc4eef
.xword 0x1b6723eb38881212
.xword 0x33623cd29161c418
.xword 0x364ceb6fda16eb35
.xword 0xbac61af5b503af23
.xword 0xb65b2ba0f5848c6d
.xword 0xa3f1bc617d4e8b60




SECTION .IO_REAL_IO_SEG_1 DATA_VA = 0x0000004ef03a4000
attr_data {
	Name	 = .IO_REAL_IO_SEG_1,
	VA	 = 0x0000004ef03a4000,
	RA	 = 0x0000004ef03a4000,
	PA	 = ra2pa(0x0000004ef03a4000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0x7da55160a1ec7668
.xword 0x7b6ce12ffd603307
.xword 0xdea9959be167bede
.xword 0x4b07f049c47001ad
.xword 0x1b306c4f804328b4
.xword 0x3b1ea75e902217e4
.xword 0xe1f9d8dcc0628e5e
.xword 0x107ccd3434c835be




SECTION .IO_REAL_IO_SEG_2 DATA_VA = 0x0000004ef03a8000
attr_data {
	Name	 = .IO_REAL_IO_SEG_2,
	VA	 = 0x0000004ef03a8000,
	RA	 = 0x0000004ef03a8000,
	PA	 = ra2pa(0x0000004ef03a8000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0xe44d1d14b3cdf3a0
.xword 0x9ecdb0dd2b5e7b5e
.xword 0x0f471fa306ef48ad
.xword 0x9692b520873423c2
.xword 0x7317c5a89d452887
.xword 0xba779b033888751b
.xword 0x0eb6760edeb14245
.xword 0x4f3a2141302556c4




SECTION .IO_REAL_IO_SEG_3 DATA_VA = 0x0000004ef03ac000
attr_data {
	Name	 = .IO_REAL_IO_SEG_3,
	VA	 = 0x0000004ef03ac000,
	RA	 = 0x0000004ef03ac000,
	PA	 = ra2pa(0x0000004ef03ac000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0x001e09c808ac2509
.xword 0x829747ba638c05fc
.xword 0x7407c2bbed32b1da
.xword 0xb33ae1aa728c1afb
.xword 0xe286e1a893ed8655
.xword 0x1fc5f6af515b4ba5
.xword 0x15d1ee728a956c40
.xword 0xd6086f80a49eb9d6




SECTION .IO_REAL_IO_SEG_4 DATA_VA = 0x0000004ef03b0000
attr_data {
	Name	 = .IO_REAL_IO_SEG_4,
	VA	 = 0x0000004ef03b0000,
	RA	 = 0x0000004ef03b0000,
	PA	 = ra2pa(0x0000004ef03b0000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0xf6b29d5a12f64b38
.xword 0xf7e1e4e6c0762a73
.xword 0x631035de63a06575
.xword 0x8edace5daea7c148
.xword 0xaf4c47f15c80adef
.xword 0x43398ff025a19605
.xword 0xdf0406086f11274a
.xword 0x4b3cf72864e7e78f




SECTION .IO_REAL_IO_SEG_5 DATA_VA = 0x0000004ef03b4000
attr_data {
	Name	 = .IO_REAL_IO_SEG_5,
	VA	 = 0x0000004ef03b4000,
	RA	 = 0x0000004ef03b4000,
	PA	 = ra2pa(0x0000004ef03b4000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0x8a2109f2e304c48b
.xword 0x3b0f70188530b4be
.xword 0x33c0c85a886a7df6
.xword 0xc878aa7ef3fab547
.xword 0x5cbede599dc9ecd9
.xword 0x564502de603cfd64
.xword 0xf146d7835c69dd3a
.xword 0x5032599ebf9ac589




SECTION .IO_REAL_IO_SEG_6 DATA_VA = 0x0000004ef03b8000
attr_data {
	Name	 = .IO_REAL_IO_SEG_6,
	VA	 = 0x0000004ef03b8000,
	RA	 = 0x0000004ef03b8000,
	PA	 = ra2pa(0x0000004ef03b8000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0xcce1969d6fb484bf
.xword 0x96adcb054e5ffc08
.xword 0x86497a4c958b7ac2
.xword 0xb7aa530664fd0e8f
.xword 0xa9c4984f8d790ff8
.xword 0xc79714c895154f4f
.xword 0xe274db1f9b44d65c
.xword 0xc3075476676b6b96




SECTION .IO_REAL_IO_SEG_7 DATA_VA = 0x0000004ef03bc000
attr_data {
	Name	 = .IO_REAL_IO_SEG_7,
	VA	 = 0x0000004ef03bc000,
	RA	 = 0x0000004ef03bc000,
	PA	 = ra2pa(0x0000004ef03bc000,0),
	part_0_ctx_zero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x193bc0f4a542ad27
.xword 0xe715249b1f812ee5
.xword 0x82266df1c9f976f7
.xword 0x7a2f369a076a7d24
.xword 0x5a39198c5f2aab04
.xword 0x4d1b13d5a99a1203
.xword 0x298097ab9698a992
.xword 0x77873eb28bf96fcc






SECTION .CP_AIUP_SEG_0 DATA_VA = 0x0000002123502000
attr_data {
	Name	 = .CP_AIUP_SEG_0,
	VA	 = 0x0000002123502000,
	RA	 = 0x0000004a5a550000,
	PA	 = ra2pa(0x0000004a5a550000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0xfdd2f6433a3db223
.xword 0x13f686c799b54af5
.xword 0x20379a4dad0a23c0
.xword 0xea093bc00c0b49ad
.xword 0x9e4914a75adfae6c
.xword 0x8ae45a7573f5144c
.xword 0xd3870ee9ec886bbd
.xword 0xb21598ad0085a161




SECTION .CP_AIUP_SEG_1 DATA_VA = 0x0000002123506000
attr_data {
	Name	 = .CP_AIUP_SEG_1,
	VA	 = 0x0000002123506000,
	RA	 = 0x0000004a5a552000,
	PA	 = ra2pa(0x0000004a5a552000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0x09c686ff61dd61d4
.xword 0x5e144b0fa4f1e927
.xword 0xbe26bcfa9f7ed3be
.xword 0x359bdd7f180e5023
.xword 0xc69dfd72f23bfa47
.xword 0xb3386455db01cec8
.xword 0xfe106c5cb4282759
.xword 0xf642c1e2a0957e9c




SECTION .CP_AIUP_SEG_2 DATA_VA = 0x000000212350a000
attr_data {
	Name	 = .CP_AIUP_SEG_2,
	VA	 = 0x000000212350a000,
	RA	 = 0x0000004a5a554000,
	PA	 = ra2pa(0x0000004a5a554000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x1b098006190d9c0e
.xword 0x0875ec8a35f84ee0
.xword 0xdb3affaed2143b93
.xword 0x5a389fc57ec9ab8f
.xword 0x314bb9ed7a17d0bd
.xword 0xf5801e7ece8b230a
.xword 0xd5a30cd577a479c0
.xword 0xc868b71b7533806c




SECTION .CP_AIUP_SEG_3 DATA_VA = 0x000000212350e000
attr_data {
	Name	 = .CP_AIUP_SEG_3,
	VA	 = 0x000000212350e000,
	RA	 = 0x0000004a5a556000,
	PA	 = ra2pa(0x0000004a5a556000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0x25e39651905c74b2
.xword 0xdd7004eda5ace0c1
.xword 0xb766965b02a8ccc4
.xword 0xe1dea28a4a67cb05
.xword 0x731c80d09f204831
.xword 0x8665ead2d4aa39ef
.xword 0x9eea7b7201c1b749
.xword 0x1dedfdabb53e412d




SECTION .CP_AIUP_SEG_4 DATA_VA = 0x0000002123512000
attr_data {
	Name	 = .CP_AIUP_SEG_4,
	VA	 = 0x0000002123512000,
	RA	 = 0x0000004a5a558000,
	PA	 = ra2pa(0x0000004a5a558000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0x2898602dc1ba4b8e
.xword 0xc56cb6037ed163bc
.xword 0xc1a2e7f89c66f784
.xword 0x4feb885985ad5a47
.xword 0xef6a44b91622bb86
.xword 0xd9e58886b8c85b50
.xword 0x483b7ab596b29d03
.xword 0xe3496a0b44220df8




SECTION .CP_AIUP_SEG_5 DATA_VA = 0x0000002123516000
attr_data {
	Name	 = .CP_AIUP_SEG_5,
	VA	 = 0x0000002123516000,
	RA	 = 0x0000004a5a55a000,
	PA	 = ra2pa(0x0000004a5a55a000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0xcafe1a52c5a30baf
.xword 0xd9272ec27cad7468
.xword 0x56cc8703731d285e
.xword 0xdb7e372266aaed04
.xword 0xb2bab65e64db3b4b
.xword 0xf7a66075cafd9b25
.xword 0x5d7bf45b46fb715e
.xword 0x068cbbbd15ce3d23




SECTION .CP_AIUP_SEG_6 DATA_VA = 0x000000212351a000
attr_data {
	Name	 = .CP_AIUP_SEG_6,
	VA	 = 0x000000212351a000,
	RA	 = 0x0000004a5a55c000,
	PA	 = ra2pa(0x0000004a5a55c000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0xd450ab312c7a6204
.xword 0x27e05c7a31ccabdf
.xword 0x384c36fd874dfab3
.xword 0x964251681cbd4e50
.xword 0x2312c56a1a7b442a
.xword 0xb7ff0f0616fc8a0d
.xword 0xf9011ab271f878ef
.xword 0x5ca4f60f68acec4e




SECTION .CP_AIUP_SEG_7 DATA_VA = 0x000000212351e000
attr_data {
	Name	 = .CP_AIUP_SEG_7,
	VA	 = 0x000000212351e000,
	RA	 = 0x0000004a5a55e000,
	PA	 = ra2pa(0x0000004a5a55e000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0xf7036159b6027bb5
.xword 0x1f35a1940cd0c44e
.xword 0x4c6dc60673aa7a11
.xword 0x84c42835fe160b90
.xword 0x2d6e4a1328e5c0e2
.xword 0x22d7b664a81ce27d
.xword 0x923a92a6d3b9b777
.xword 0xe406f452d87ff21d






SECTION .IO_AIUP_SEG_0 DATA_VA = 0x00000045254a0000
attr_data {
	Name	 = .IO_AIUP_SEG_0,
	VA	 = 0x00000045254a0000,
	RA	 = 0x00000045256a0000,
	PA	 = ra2pa(0x00000045256a0000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0x6b155aad112c27cb
.xword 0x1d53294b3107660b
.xword 0xa92868a9df5bd93b
.xword 0x184ab998d56ffa8f
.xword 0x9c3dec0e60b8c0fe
.xword 0xc2c6addf90f55666
.xword 0x0429451cf731a0a4
.xword 0x04568b6655713dd2




SECTION .IO_AIUP_SEG_1 DATA_VA = 0x00000045254a2000
attr_data {
	Name	 = .IO_AIUP_SEG_1,
	VA	 = 0x00000045254a2000,
	RA	 = 0x00000045256a2000,
	PA	 = ra2pa(0x00000045256a2000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0x4fb28efa8119974f
.xword 0x1c1eaa405fe5dde6
.xword 0xf39958aff24d706c
.xword 0xd5a8075d9e9ca46e
.xword 0x723f40ee8e2ba421
.xword 0x373d7560776030b5
.xword 0x76e62392f24de8b0
.xword 0x4436a73d69b5b453




SECTION .IO_AIUP_SEG_2 DATA_VA = 0x00000045254a4000
attr_data {
	Name	 = .IO_AIUP_SEG_2,
	VA	 = 0x00000045254a4000,
	RA	 = 0x00000045256a4000,
	PA	 = ra2pa(0x00000045256a4000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0x36c4b63f246f4ef3
.xword 0x9d54e289485c07ea
.xword 0x0888d70440fe0f46
.xword 0x51c68959bb707027
.xword 0x84359837d7e08b5d
.xword 0x37fa19868c421809
.xword 0xdf2ca13e00ca6b89
.xword 0xbc40e99fff7428ff




SECTION .IO_AIUP_SEG_3 DATA_VA = 0x00000045254a6000
attr_data {
	Name	 = .IO_AIUP_SEG_3,
	VA	 = 0x00000045254a6000,
	RA	 = 0x00000045256a6000,
	PA	 = ra2pa(0x00000045256a6000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0x9e99bd30ca7dc18b
.xword 0x333fa2079bced39f
.xword 0x3dc84406cc652918
.xword 0xbb7e06d8aaf9c48d
.xword 0x17a405e34a61ec9b
.xword 0xbd154d082279ecba
.xword 0xfb71a7198a6e8cef
.xword 0x924a8a84d99fa81c




SECTION .IO_AIUP_SEG_4 DATA_VA = 0x00000045254a8000
attr_data {
	Name	 = .IO_AIUP_SEG_4,
	VA	 = 0x00000045254a8000,
	RA	 = 0x00000045256a8000,
	PA	 = ra2pa(0x00000045256a8000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0xabbbc94dccb663e6
.xword 0x9276dc91395eacb1
.xword 0x8be940d9df852430
.xword 0x73061b72936ef6e8
.xword 0x071432047938915f
.xword 0x73e7cf69309a0780
.xword 0xe9668ef36947cd27
.xword 0xbd14cc7f2f7848fb




SECTION .IO_AIUP_SEG_5 DATA_VA = 0x00000045254aa000
attr_data {
	Name	 = .IO_AIUP_SEG_5,
	VA	 = 0x00000045254aa000,
	RA	 = 0x00000045256aa000,
	PA	 = ra2pa(0x00000045256aa000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0xf3a7a6639d1ee468
.xword 0x05acf924b2fc4954
.xword 0x65cb5306a390508b
.xword 0x4226fad07608af29
.xword 0x19d2d28b389071e9
.xword 0x94f3f39fccc64ea5
.xword 0x4b668015ff029d80
.xword 0x546a02d03847573b




SECTION .IO_AIUP_SEG_6 DATA_VA = 0x00000045254ac000
attr_data {
	Name	 = .IO_AIUP_SEG_6,
	VA	 = 0x00000045254ac000,
	RA	 = 0x00000045256ac000,
	PA	 = ra2pa(0x00000045256ac000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0x4a66dc1d2239939c
.xword 0x37e2c4c343afaa86
.xword 0x977356d95236df1b
.xword 0x9f8501e0ca44a4b7
.xword 0x6a97c3f95aa9e060
.xword 0x5707d77063cbd086
.xword 0x1de67e516833babf
.xword 0x87aa67d92e1c7b86




SECTION .IO_AIUP_SEG_7 DATA_VA = 0x00000045254ae000
attr_data {
	Name	 = .IO_AIUP_SEG_7,
	VA	 = 0x00000045254ae000,
	RA	 = 0x00000045256ae000,
	PA	 = ra2pa(0x00000045256ae000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x3a413d3090b5e373
.xword 0x012bf2ebc0f5016e
.xword 0x240d765f355336d2
.xword 0xc647f0c50ad3fb3e
.xword 0x3eca6d3bdbf7d5e0
.xword 0xa716c7feafbcbede
.xword 0xccb5f8bb9c5af240
.xword 0x600da824ed9a84b3






SECTION .CP_AIUS_SEG_0 DATA_VA = 0x00000049abc12000
attr_data {
	Name	 = .CP_AIUS_SEG_0,
	VA	 = 0x00000049abc12000,
	RA	 = 0x00000049abc12000,
	PA	 = ra2pa(0x00000049abc12000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.xword 0x17e8657945020d37
.xword 0x7a9721f4c7a93f10
.xword 0x3d3f553b88e28091
.xword 0xafabb6d4f6504b4e
.xword 0x057833d66f4d95e3
.xword 0x7df2f0617a37a8e8
.xword 0xfea11454f6e406d3
.xword 0xdc0b2cef14233176




SECTION .CP_AIUS_SEG_1 DATA_VA = 0x00000049abc16000
attr_data {
	Name	 = .CP_AIUS_SEG_1,
	VA	 = 0x00000049abc16000,
	RA	 = 0x00000049abc16000,
	PA	 = ra2pa(0x00000049abc16000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0xb7a13408e6145344
.xword 0xb450ac486797233b
.xword 0x0be7bbd0efe1e3cf
.xword 0x4e359ba950b33331
.xword 0x7fed8b482ddab722
.xword 0xa149fcb7ee9b26ec
.xword 0x815d53ed43b63d52
.xword 0x3ec094f9dabeccaa




SECTION .CP_AIUS_SEG_2 DATA_VA = 0x00000049abc1a000
attr_data {
	Name	 = .CP_AIUS_SEG_2,
	VA	 = 0x00000049abc1a000,
	RA	 = 0x00000049abc1a000,
	PA	 = ra2pa(0x00000049abc1a000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0xb469a2350a8e3546
.xword 0x4ff9482a2a843f5e
.xword 0xc4675f2c933fc30a
.xword 0x167f509456f7af9e
.xword 0x90ced192e80e05b1
.xword 0xca37a56be80e17bf
.xword 0x089194637866f17f
.xword 0x180ff041e6af1102




SECTION .CP_AIUS_SEG_3 DATA_VA = 0x00000049abc1e000
attr_data {
	Name	 = .CP_AIUS_SEG_3,
	VA	 = 0x00000049abc1e000,
	RA	 = 0x00000049abc1e000,
	PA	 = ra2pa(0x00000049abc1e000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x0e197dcfc37ac11e
.xword 0xda887c0520b3d818
.xword 0xb94bc66825a8fad3
.xword 0x90c76998489d8dfd
.xword 0xacbc18c0c33b4189
.xword 0x974f5c9d6bbeb0e5
.xword 0xf1cf48487d80147f
.xword 0x18914e9bbb796018






SECTION .IO_AIUS_SEG_0 DATA_VA = 0x0000004def1a2000
attr_data {
	Name	 = .IO_AIUS_SEG_0,
	VA	 = 0x0000004def1a2000,
	RA	 = 0x0000004def1a2000,
	PA	 = ra2pa(0x0000004def1a2000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0xba2674d5bc22f0a9
.xword 0x159ded42cf658f1d
.xword 0xf35e31b69c81972b
.xword 0x6de18e517b233456
.xword 0x099f598a07b6466c
.xword 0x409bd200bd459973
.xword 0x8f7e0ace57df2124
.xword 0x85f5356c91e9612a




SECTION .IO_AIUS_SEG_1 DATA_VA = 0x0000004def1a6000
attr_data {
	Name	 = .IO_AIUS_SEG_1,
	VA	 = 0x0000004def1a6000,
	RA	 = 0x0000004def1a6000,
	PA	 = ra2pa(0x0000004def1a6000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0x269c7b34d7d1488e
.xword 0x0bf38ca7e55907fd
.xword 0x74e1e631f93e7086
.xword 0x3a4fa0c850d813c4
.xword 0x6d13ac3f7e5fe1ea
.xword 0xe81925fe6c59d045
.xword 0x2919604e3d682a83
.xword 0x1f2528ae5f14c7e8




SECTION .IO_AIUS_SEG_2 DATA_VA = 0x0000004def1aa000
attr_data {
	Name	 = .IO_AIUS_SEG_2,
	VA	 = 0x0000004def1aa000,
	RA	 = 0x0000004def1aa000,
	PA	 = ra2pa(0x0000004def1aa000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0x34f69b9cf8dbfe8b
.xword 0x3afc1c75b2c91c11
.xword 0x753d4bb0d44f11ec
.xword 0xdf90c0d0999d0780
.xword 0xf8509f4704d01668
.xword 0x646260ce09bf7ebc
.xword 0xbece90f1c9a58d1e
.xword 0xa03a5c6d123263a0




SECTION .IO_AIUS_SEG_3 DATA_VA = 0x0000004def1ae000
attr_data {
	Name	 = .IO_AIUS_SEG_3,
	VA	 = 0x0000004def1ae000,
	RA	 = 0x0000004def1ae000,
	PA	 = ra2pa(0x0000004def1ae000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0xb3d79e68895413e9
.xword 0x3ebad404c18a8763
.xword 0x2154617a457abc78
.xword 0xb47c56f60577295c
.xword 0x06318f5d891cd525
.xword 0x821b13409a4431e4
.xword 0xf88d544db7c7e7f6
.xword 0x1d125e38ffb2e21c




SECTION .IO_AIUS_SEG_4 DATA_VA = 0x0000004def1b2000
attr_data {
	Name	 = .IO_AIUS_SEG_4,
	VA	 = 0x0000004def1b2000,
	RA	 = 0x0000004def1b2000,
	PA	 = ra2pa(0x0000004def1b2000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.xword 0xa66d057f4983dea7
.xword 0xd2d22bf8ce47032a
.xword 0x0373f752126700a6
.xword 0xb208e25444180707
.xword 0x85ba082593a94767
.xword 0xedd26f66b4858812
.xword 0x0148d161570e0a04
.xword 0xcda53969afb77851




SECTION .IO_AIUS_SEG_5 DATA_VA = 0x0000004def1b6000
attr_data {
	Name	 = .IO_AIUS_SEG_5,
	VA	 = 0x0000004def1b6000,
	RA	 = 0x0000004def1b6000,
	PA	 = ra2pa(0x0000004def1b6000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0xf9f3e3b33c1a3c5e
.xword 0xabc59905c9e84736
.xword 0x67446b2b218c660a
.xword 0x1c4516b68c731eae
.xword 0x624c09da45ef831b
.xword 0x1b77c7b6d62fb8de
.xword 0xfe1a108672659e0d
.xword 0xc22657ebc454a9a9




SECTION .IO_AIUS_SEG_6 DATA_VA = 0x0000004def1ba000
attr_data {
	Name	 = .IO_AIUS_SEG_6,
	VA	 = 0x0000004def1ba000,
	RA	 = 0x0000004def1ba000,
	PA	 = ra2pa(0x0000004def1ba000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.xword 0x78cd43d74d4ef0e8
.xword 0x119cb11d38a20c8f
.xword 0x20d542c6df23b8db
.xword 0xe26e5af529dc2ae4
.xword 0x21646744db242dde
.xword 0x5f95560c76f340c5
.xword 0xad46948dcfba85cc
.xword 0xb6b5c5ba084849f0




SECTION .IO_AIUS_SEG_7 DATA_VA = 0x0000004def1be000
attr_data {
	Name	 = .IO_AIUS_SEG_7,
	VA	 = 0x0000004def1be000,
	RA	 = 0x0000004def1be000,
	PA	 = ra2pa(0x0000004def1be000,0),
	part_0_ctx_nonzero_tsb_config_1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.xword 0x3b8c1ddb0f73918a
.xword 0x4909ae7206b033ea
.xword 0x49f32c3ed4800605
.xword 0x7c0baa95ff485fa1
.xword 0x6a831fbbbf404cc2
.xword 0x482ffd7d91b8fff5
.xword 0x78a9e3e8f16d677e
.xword 0x4e01c162caae1105




#if 0
#endif
