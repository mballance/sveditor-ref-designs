/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ncu_ucb_8c8t_1.s
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
#define PSTATE_CLE_MASK 0x200
#define PSTATE_TLE_MASK 0x100
#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO
#define MAIN_PAGE_VA_IS_RA_ALSO
#define PART0_NZ_RANOTPA_1 500000000
#define PART0_Z_RANOTPA_1 500000000
#define DISABLE_PART_LIMIT_CHECK
#define SKIP_TRAPCHECK

# include "hboot.s"
.text
.global main

main:

main_text_start:
#define TCAM_KEY_2  0x8100380000+0x200A0
#define TCAM_KEY_3  0x8100380000+0x200A8
#define PCI_IMU_PERF0 0x8800632008
# 200 "diag.j.pp"
#define PCI_PIO_ad1 0xc100000000
#define PCI_PIO_ad2 0xc100000010
#define PCI_EVENT_Q 0x8800610000
#define SSI 0xfff0000000 
#define MCU0_SCRUB_FREQ 0x8400000018

#define MCU1_SCRUB_FREQ 0x8400001018
#define MCU2_SCRUB_FREQ 0x8400002018
#define MCU3_SCRUB_FREQ 0x8400003018
#define PLL_CTL 0x8300000000

#define RST_PROP_TIME 0x8900000880
#define DEBUG_CONTROL 0x8600000000
#define TCAM_KEY_1  0x8100380000+0x20098
#define TCU_DEBUG_EVENT_COUNTER 0x85000000f8
# 217 "diag.j.pp"
#define CORE_AVAIL 0x8000001010
# 237 "diag.j.pp"
    setx PCI_PIO_ad1, %r4, %r14
    setx PCI_PIO_ad2, %r4, %r15
    setx TCU_DEBUG_EVENT_COUNTER, %r4, %r17
    setx TCAM_KEY_1, %r4, %r18
    setx TCAM_KEY_2, %r4, %r19
    setx TCAM_KEY_3, %r4, %r20
    setx PCI_EVENT_Q, %r4, %r21
    setx PCI_IMU_PERF0, %r4, %r22
    setx SSI, %r4, %r23
    setx CORE_AVAIL, %r4, %r24
    setx MCU0_SCRUB_FREQ, %r4, %r25
    setx MCU1_SCRUB_FREQ, %r4, %r26
    setx MCU2_SCRUB_FREQ, %r4, %r27
    setx MCU3_SCRUB_FREQ, %r4, %r28
    setx DEBUG_CONTROL, %r4, %r29
    setx PLL_CTL, %r4, %r30
    setx RST_PROP_TIME, %r4, %r31

    setx 0x0, %g1, %r16  

    mov 0x80, %g1
    wr %g1, %g0, %asi
# 261 "diag.j.pp"
    ta T_CHANGE_HPRIV

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
	.word 0xc2760010  ! 1: STX_R	stx	%r1, [%r24 + %r16]
	.word 0xc25bc010  ! 2: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2776000  ! 3: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25f6000  ! 4: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25b8010  ! 5: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273e000  ! 6: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25b8010  ! 7: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25b8010  ! 8: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25e2000  ! 9: LDX_I	ldx	[%r24 + 0x0000], %r1
	.word 0xc25ba000  ! 10: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273a000  ! 11: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc2754010  ! 12: STX_R	stx	%r1, [%r21 + %r16]
	.word 0xc273a000  ! 13: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273e000  ! 14: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25bc010  ! 15: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25fa000  ! 16: LDX_I	ldx	[%r30 + 0x0000], %r1
	.word 0xc273e000  ! 17: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25b8010  ! 18: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2758010  ! 19: STX_R	stx	%r1, [%r22 + %r16]
	.word 0xc25bc010  ! 20: LDX_R	ldx	[%r15 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_63:
	.word 0xc2738010  ! 1: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25bc010  ! 2: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2768010  ! 3: STX_R	stx	%r1, [%r26 + %r16]
	.word 0xc25be000  ! 4: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25b8010  ! 5: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2760010  ! 6: STX_R	stx	%r1, [%r24 + %r16]
	.word 0xc25bc010  ! 7: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25bc010  ! 8: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25de000  ! 9: LDX_I	ldx	[%r23 + 0x0000], %r1
	.word 0xc25d6000  ! 10: LDX_I	ldx	[%r21 + 0x0000], %r1
	.word 0xc2774010  ! 11: STX_R	stx	%r1, [%r29 + %r16]
	.word 0xc2738010  ! 12: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273c010  ! 13: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc277e000  ! 14: STX_I	stx	%r1, [%r31 + 0x0000]
	.word 0xc25bc010  ! 15: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25ba000  ! 16: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2772000  ! 17: STX_I	stx	%r1, [%r28 + 0x0000]
	.word 0xc25fc010  ! 18: LDX_R	ldx	[%r31 + %r16], %r1
	.word 0xc273a000  ! 19: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25b8010  ! 20: LDX_R	ldx	[%r14 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_62:
	.word 0xc2778010  ! 1: STX_R	stx	%r1, [%r30 + %r16]
	.word 0xc25b8010  ! 2: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273a000  ! 3: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25be000  ! 4: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25bc010  ! 5: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273a000  ! 6: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25bc010  ! 7: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25b8010  ! 8: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25be000  ! 9: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25de000  ! 10: LDX_I	ldx	[%r23 + 0x0000], %r1
	.word 0xc273e000  ! 11: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc273a000  ! 12: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273c010  ! 13: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc277c010  ! 14: STX_R	stx	%r1, [%r31 + %r16]
	.word 0xc25cc010  ! 15: LDX_R	ldx	[%r19 + %r16], %r1
	.word 0xc25ea000  ! 16: LDX_I	ldx	[%r26 + 0x0000], %r1
	.word 0xc273c010  ! 17: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25bc010  ! 18: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2768010  ! 19: STX_R	stx	%r1, [%r26 + %r16]
	.word 0xc25b8010  ! 20: LDX_R	ldx	[%r14 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_61:
	.word 0xc2738010  ! 1: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25d0010  ! 2: LDX_R	ldx	[%r20 + %r16], %r1
	.word 0xc273c010  ! 3: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25be000  ! 4: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25b8010  ! 5: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2738010  ! 6: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25ec010  ! 7: LDX_R	ldx	[%r27 + %r16], %r1
	.word 0xc25b8010  ! 8: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25de000  ! 9: LDX_I	ldx	[%r23 + 0x0000], %r1
	.word 0xc25be000  ! 10: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2758010  ! 11: STX_R	stx	%r1, [%r22 + %r16]
	.word 0xc273e000  ! 12: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc2738010  ! 13: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc275a000  ! 14: STX_I	stx	%r1, [%r22 + 0x0000]
	.word 0xc25bc010  ! 15: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25ba000  ! 16: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2776000  ! 17: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25e8010  ! 18: LDX_R	ldx	[%r26 + %r16], %r1
	.word 0xc274e000  ! 19: STX_I	stx	%r1, [%r19 + 0x0000]
	.word 0xc25b8010  ! 20: LDX_R	ldx	[%r14 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_60:
	.word 0xc2738010  ! 1: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25bc010  ! 2: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc274c010  ! 3: STX_R	stx	%r1, [%r19 + %r16]
	.word 0xc25ba000  ! 4: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25e0010  ! 5: LDX_R	ldx	[%r24 + %r16], %r1
	.word 0xc2774010  ! 6: STX_R	stx	%r1, [%r29 + %r16]
	.word 0xc25bc010  ! 7: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25d4010  ! 8: LDX_R	ldx	[%r21 + %r16], %r1
	.word 0xc25ea000  ! 9: LDX_I	ldx	[%r26 + 0x0000], %r1
	.word 0xc25be000  ! 10: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2738010  ! 11: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc2746000  ! 12: STX_I	stx	%r1, [%r17 + 0x0000]
	.word 0xc2738010  ! 13: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc276c010  ! 14: STX_R	stx	%r1, [%r27 + %r16]
	.word 0xc25b8010  ! 15: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25ba000  ! 16: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273a000  ! 17: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25bc010  ! 18: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273c010  ! 19: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25b8010  ! 20: LDX_R	ldx	[%r14 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_59:
	.word 0xc2738010  ! 1: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25f4010  ! 2: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc273c010  ! 3: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25ba000  ! 4: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25b8010  ! 5: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273a000  ! 6: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25b8010  ! 7: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25b8010  ! 8: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25be000  ! 9: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25ce000  ! 10: LDX_I	ldx	[%r19 + 0x0000], %r1
	.word 0xc273a000  ! 11: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273c010  ! 12: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc2756000  ! 13: STX_I	stx	%r1, [%r21 + 0x0000]
	.word 0xc273c010  ! 14: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25c8010  ! 15: LDX_R	ldx	[%r18 + %r16], %r1
	.word 0xc25d6000  ! 16: LDX_I	ldx	[%r21 + 0x0000], %r1
	.word 0xc273a000  ! 17: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25bc010  ! 18: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2738010  ! 19: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25bc010  ! 20: LDX_R	ldx	[%r15 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_58:
	.word 0xc277c010  ! 1: STX_R	stx	%r1, [%r31 + %r16]
	.word 0xc25b8010  ! 2: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273a000  ! 3: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25fe000  ! 4: LDX_I	ldx	[%r31 + 0x0000], %r1
	.word 0xc25b8010  ! 5: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2764010  ! 6: STX_R	stx	%r1, [%r25 + %r16]
	.word 0xc25b8010  ! 7: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25b8010  ! 8: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25ee000  ! 9: LDX_I	ldx	[%r27 + 0x0000], %r1
	.word 0xc25ba000  ! 10: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273a000  ! 11: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273e000  ! 12: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc273e000  ! 13: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc2754010  ! 14: STX_R	stx	%r1, [%r21 + %r16]
	.word 0xc25b8010  ! 15: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25f2000  ! 16: LDX_I	ldx	[%r28 + 0x0000], %r1
	.word 0xc2738010  ! 17: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25dc010  ! 18: LDX_R	ldx	[%r23 + %r16], %r1
	.word 0xc2738010  ! 19: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25f0010  ! 20: LDX_R	ldx	[%r28 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_57:
	.word 0xc273e000  ! 1: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25c8010  ! 2: LDX_R	ldx	[%r18 + %r16], %r1
	.word 0xc2778010  ! 3: STX_R	stx	%r1, [%r30 + %r16]
	.word 0xc25da000  ! 4: LDX_I	ldx	[%r22 + 0x0000], %r1
	.word 0xc25e8010  ! 5: LDX_R	ldx	[%r26 + %r16], %r1
	.word 0xc2738010  ! 6: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25b8010  ! 7: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25b8010  ! 8: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25f6000  ! 9: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25be000  ! 10: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc275a000  ! 11: STX_I	stx	%r1, [%r22 + 0x0000]
	.word 0xc2778010  ! 12: STX_R	stx	%r1, [%r30 + %r16]
	.word 0xc276c010  ! 13: STX_R	stx	%r1, [%r27 + %r16]
	.word 0xc273e000  ! 14: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25dc010  ! 15: LDX_R	ldx	[%r23 + %r16], %r1
	.word 0xc25ba000  ! 16: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273e000  ! 17: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25b8010  ! 18: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2778010  ! 19: STX_R	stx	%r1, [%r30 + %r16]
	.word 0xc25bc010  ! 20: LDX_R	ldx	[%r15 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_56:
	.word 0xc275a000  ! 1: STX_I	stx	%r1, [%r22 + 0x0000]
	.word 0xc25b8010  ! 2: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc277c010  ! 3: STX_R	stx	%r1, [%r31 + %r16]
	.word 0xc25be000  ! 4: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25bc010  ! 5: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc277e000  ! 6: STX_I	stx	%r1, [%r31 + 0x0000]
	.word 0xc25c4010  ! 7: LDX_R	ldx	[%r17 + %r16], %r1
	.word 0xc25ec010  ! 8: LDX_R	ldx	[%r27 + %r16], %r1
	.word 0xc25ca000  ! 9: LDX_I	ldx	[%r18 + 0x0000], %r1
	.word 0xc25ba000  ! 10: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273c010  ! 11: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273a000  ! 12: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273a000  ! 13: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc2768010  ! 14: STX_R	stx	%r1, [%r26 + %r16]
	.word 0xc25b8010  ! 15: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25be000  ! 16: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273e000  ! 17: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25e4010  ! 18: LDX_R	ldx	[%r25 + %r16], %r1
	.word 0xc277a000  ! 19: STX_I	stx	%r1, [%r30 + 0x0000]
	.word 0xc25bc010  ! 20: LDX_R	ldx	[%r15 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_55:
	.word 0xc273a000  ! 1: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25f4010  ! 2: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc2738010  ! 3: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25ba000  ! 4: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25b8010  ! 5: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273e000  ! 6: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25bc010  ! 7: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25bc010  ! 8: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25ba000  ! 9: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25ba000  ! 10: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273a000  ! 11: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc2738010  ! 12: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc276c010  ! 13: STX_R	stx	%r1, [%r27 + %r16]
	.word 0xc2738010  ! 14: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25b8010  ! 15: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25ba000  ! 16: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2768010  ! 17: STX_R	stx	%r1, [%r26 + %r16]
	.word 0xc25b8010  ! 18: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273e000  ! 19: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25bc010  ! 20: LDX_R	ldx	[%r15 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_54:
	.word 0xc273a000  ! 1: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25bc010  ! 2: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273c010  ! 3: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25ba000  ! 4: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25bc010  ! 5: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2762000  ! 6: STX_I	stx	%r1, [%r24 + 0x0000]
	.word 0xc25b8010  ! 7: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25bc010  ! 8: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25be000  ! 9: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25be000  ! 10: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273c010  ! 11: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc2752000  ! 12: STX_I	stx	%r1, [%r20 + 0x0000]
	.word 0xc2762000  ! 13: STX_I	stx	%r1, [%r24 + 0x0000]
	.word 0xc273c010  ! 14: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25e8010  ! 15: LDX_R	ldx	[%r26 + %r16], %r1
	.word 0xc25ba000  ! 16: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2738010  ! 17: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25c4010  ! 18: LDX_R	ldx	[%r17 + %r16], %r1
	.word 0xc273e000  ! 19: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25e8010  ! 20: LDX_R	ldx	[%r26 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_53:
	.word 0xc273e000  ! 1: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25bc010  ! 2: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273c010  ! 3: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25ba000  ! 4: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25c8010  ! 5: LDX_R	ldx	[%r18 + %r16], %r1
	.word 0xc276c010  ! 6: STX_R	stx	%r1, [%r27 + %r16]
	.word 0xc25bc010  ! 7: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25b8010  ! 8: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25ee000  ! 9: LDX_I	ldx	[%r27 + 0x0000], %r1
	.word 0xc25ba000  ! 10: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc274c010  ! 11: STX_R	stx	%r1, [%r19 + %r16]
	.word 0xc273c010  ! 12: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273e000  ! 13: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc2738010  ! 14: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25bc010  ! 15: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25be000  ! 16: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2738010  ! 17: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25f4010  ! 18: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc2746000  ! 19: STX_I	stx	%r1, [%r17 + 0x0000]
	.word 0xc25f8010  ! 20: LDX_R	ldx	[%r30 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_52:
	.word 0xc2738010  ! 1: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25b8010  ! 2: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2738010  ! 3: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25d2000  ! 4: LDX_I	ldx	[%r20 + 0x0000], %r1
	.word 0xc25bc010  ! 5: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273a000  ! 6: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25bc010  ! 7: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25bc010  ! 8: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25be000  ! 9: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25ba000  ! 10: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273e000  ! 11: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc2738010  ! 12: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc2756000  ! 13: STX_I	stx	%r1, [%r21 + 0x0000]
	.word 0xc273a000  ! 14: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25bc010  ! 15: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25ba000  ! 16: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2770010  ! 17: STX_R	stx	%r1, [%r28 + %r16]
	.word 0xc25bc010  ! 18: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273e000  ! 19: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25b8010  ! 20: LDX_R	ldx	[%r14 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_51:
	.word 0xc2746000  ! 1: STX_I	stx	%r1, [%r17 + 0x0000]
	.word 0xc25b8010  ! 2: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273e000  ! 3: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25be000  ! 4: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25ec010  ! 5: LDX_R	ldx	[%r27 + %r16], %r1
	.word 0xc273e000  ! 6: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25b8010  ! 7: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25bc010  ! 8: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25be000  ! 9: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25be000  ! 10: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273a000  ! 11: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273e000  ! 12: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc273e000  ! 13: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc2738010  ! 14: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25b8010  ! 15: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25ba000  ! 16: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273c010  ! 17: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25b8010  ! 18: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273a000  ! 19: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25b8010  ! 20: LDX_R	ldx	[%r14 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_50:
	.word 0xc273a000  ! 1: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25bc010  ! 2: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc277e000  ! 3: STX_I	stx	%r1, [%r31 + 0x0000]
	.word 0xc25ba000  ! 4: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25b8010  ! 5: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2738010  ! 6: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25e0010  ! 7: LDX_R	ldx	[%r24 + %r16], %r1
	.word 0xc25bc010  ! 8: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25e6000  ! 9: LDX_I	ldx	[%r25 + 0x0000], %r1
	.word 0xc25fa000  ! 10: LDX_I	ldx	[%r30 + 0x0000], %r1
	.word 0xc273c010  ! 11: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc2750010  ! 12: STX_R	stx	%r1, [%r20 + %r16]
	.word 0xc273c010  ! 13: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc274c010  ! 14: STX_R	stx	%r1, [%r19 + %r16]
	.word 0xc25e8010  ! 15: LDX_R	ldx	[%r26 + %r16], %r1
	.word 0xc25be000  ! 16: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2738010  ! 17: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25bc010  ! 18: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2738010  ! 19: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25bc010  ! 20: LDX_R	ldx	[%r15 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_49:
	.word 0xc273a000  ! 1: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25bc010  ! 2: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273e000  ! 3: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25ba000  ! 4: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25d8010  ! 5: LDX_R	ldx	[%r22 + %r16], %r1
	.word 0xc273e000  ! 6: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25bc010  ! 7: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25bc010  ! 8: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25ba000  ! 9: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25be000  ! 10: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273e000  ! 11: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc274e000  ! 12: STX_I	stx	%r1, [%r19 + 0x0000]
	.word 0xc2738010  ! 13: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc275e000  ! 14: STX_I	stx	%r1, [%r23 + 0x0000]
	.word 0xc25b8010  ! 15: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25be000  ! 16: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2758010  ! 17: STX_R	stx	%r1, [%r22 + %r16]
	.word 0xc25cc010  ! 18: LDX_R	ldx	[%r19 + %r16], %r1
	.word 0xc2738010  ! 19: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25c4010  ! 20: LDX_R	ldx	[%r17 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_48:
	.word 0xc273a000  ! 1: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25b8010  ! 2: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273a000  ! 3: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25ba000  ! 4: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25dc010  ! 5: LDX_R	ldx	[%r23 + %r16], %r1
	.word 0xc273e000  ! 6: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25e0010  ! 7: LDX_R	ldx	[%r24 + %r16], %r1
	.word 0xc25b8010  ! 8: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25f6000  ! 9: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25ba000  ! 10: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273c010  ! 11: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc2752000  ! 12: STX_I	stx	%r1, [%r20 + 0x0000]
	.word 0xc2768010  ! 13: STX_R	stx	%r1, [%r26 + %r16]
	.word 0xc2758010  ! 14: STX_R	stx	%r1, [%r22 + %r16]
	.word 0xc25bc010  ! 15: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25fe000  ! 16: LDX_I	ldx	[%r31 + 0x0000], %r1
	.word 0xc273c010  ! 17: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25b8010  ! 18: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2738010  ! 19: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25b8010  ! 20: LDX_R	ldx	[%r14 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_47:
	.word 0xc2776000  ! 1: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25fc010  ! 2: LDX_R	ldx	[%r31 + %r16], %r1
	.word 0xc2756000  ! 3: STX_I	stx	%r1, [%r21 + 0x0000]
	.word 0xc25ce000  ! 4: LDX_I	ldx	[%r19 + 0x0000], %r1
	.word 0xc25e0010  ! 5: LDX_R	ldx	[%r24 + %r16], %r1
	.word 0xc273e000  ! 6: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25c8010  ! 7: LDX_R	ldx	[%r18 + %r16], %r1
	.word 0xc25b8010  ! 8: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25be000  ! 9: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25d2000  ! 10: LDX_I	ldx	[%r20 + 0x0000], %r1
	.word 0xc2756000  ! 11: STX_I	stx	%r1, [%r21 + 0x0000]
	.word 0xc2738010  ! 12: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc2738010  ! 13: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc2748010  ! 14: STX_R	stx	%r1, [%r18 + %r16]
	.word 0xc25c4010  ! 15: LDX_R	ldx	[%r17 + %r16], %r1
	.word 0xc25ba000  ! 16: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc274a000  ! 17: STX_I	stx	%r1, [%r18 + 0x0000]
	.word 0xc25bc010  ! 18: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2738010  ! 19: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25b8010  ! 20: LDX_R	ldx	[%r14 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_46:
	.word 0xc273a000  ! 1: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25b8010  ! 2: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc275a000  ! 3: STX_I	stx	%r1, [%r22 + 0x0000]
	.word 0xc25be000  ! 4: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25b8010  ! 5: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2738010  ! 6: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25d0010  ! 7: LDX_R	ldx	[%r20 + %r16], %r1
	.word 0xc25bc010  ! 8: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25ba000  ! 9: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25ba000  ! 10: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc275c010  ! 11: STX_R	stx	%r1, [%r23 + %r16]
	.word 0xc273e000  ! 12: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc274a000  ! 13: STX_I	stx	%r1, [%r18 + 0x0000]
	.word 0xc273e000  ! 14: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25b8010  ! 15: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25ba000  ! 16: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273e000  ! 17: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25b8010  ! 18: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2760010  ! 19: STX_R	stx	%r1, [%r24 + %r16]
	.word 0xc25b8010  ! 20: LDX_R	ldx	[%r14 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_45:
	.word 0xc273c010  ! 1: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25bc010  ! 2: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2738010  ! 3: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25ba000  ! 4: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25b8010  ! 5: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2738010  ! 6: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25d4010  ! 7: LDX_R	ldx	[%r21 + %r16], %r1
	.word 0xc25bc010  ! 8: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25be000  ! 9: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25ba000  ! 10: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2738010  ! 11: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc2758010  ! 12: STX_R	stx	%r1, [%r22 + %r16]
	.word 0xc273c010  ! 13: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc274a000  ! 14: STX_I	stx	%r1, [%r18 + 0x0000]
	.word 0xc25e4010  ! 15: LDX_R	ldx	[%r25 + %r16], %r1
	.word 0xc25e6000  ! 16: LDX_I	ldx	[%r25 + 0x0000], %r1
	.word 0xc2744010  ! 17: STX_R	stx	%r1, [%r17 + %r16]
	.word 0xc25bc010  ! 18: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273a000  ! 19: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25bc010  ! 20: LDX_R	ldx	[%r15 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_44:
	.word 0xc273e000  ! 1: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25b8010  ! 2: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273a000  ! 3: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25ce000  ! 4: LDX_I	ldx	[%r19 + 0x0000], %r1
	.word 0xc25bc010  ! 5: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273c010  ! 6: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25bc010  ! 7: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25bc010  ! 8: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25be000  ! 9: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25ba000  ! 10: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2766000  ! 11: STX_I	stx	%r1, [%r25 + 0x0000]
	.word 0xc2776000  ! 12: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc277e000  ! 13: STX_I	stx	%r1, [%r31 + 0x0000]
	.word 0xc277a000  ! 14: STX_I	stx	%r1, [%r30 + 0x0000]
	.word 0xc25bc010  ! 15: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25da000  ! 16: LDX_I	ldx	[%r22 + 0x0000], %r1
	.word 0xc273a000  ! 17: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25ec010  ! 18: LDX_R	ldx	[%r27 + %r16], %r1
	.word 0xc273a000  ! 19: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25f0010  ! 20: LDX_R	ldx	[%r28 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_43:
	.word 0xc2738010  ! 1: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25bc010  ! 2: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2748010  ! 3: STX_R	stx	%r1, [%r18 + %r16]
	.word 0xc25be000  ! 4: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25b8010  ! 5: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273a000  ! 6: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25fc010  ! 7: LDX_R	ldx	[%r31 + %r16], %r1
	.word 0xc25d8010  ! 8: LDX_R	ldx	[%r22 + %r16], %r1
	.word 0xc25da000  ! 9: LDX_I	ldx	[%r22 + 0x0000], %r1
	.word 0xc25f2000  ! 10: LDX_I	ldx	[%r28 + 0x0000], %r1
	.word 0xc275e000  ! 11: STX_I	stx	%r1, [%r23 + 0x0000]
	.word 0xc2738010  ! 12: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273c010  ! 13: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273c010  ! 14: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25b8010  ! 15: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25ee000  ! 16: LDX_I	ldx	[%r27 + 0x0000], %r1
	.word 0xc277c010  ! 17: STX_R	stx	%r1, [%r31 + %r16]
	.word 0xc25b8010  ! 18: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2762000  ! 19: STX_I	stx	%r1, [%r24 + 0x0000]
	.word 0xc25b8010  ! 20: LDX_R	ldx	[%r14 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_42:
	.word 0xc273e000  ! 1: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25e8010  ! 2: LDX_R	ldx	[%r26 + %r16], %r1
	.word 0xc273e000  ! 3: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25ba000  ! 4: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25f8010  ! 5: LDX_R	ldx	[%r30 + %r16], %r1
	.word 0xc273a000  ! 6: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25f0010  ! 7: LDX_R	ldx	[%r28 + %r16], %r1
	.word 0xc25b8010  ! 8: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25ba000  ! 9: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25c6000  ! 10: LDX_I	ldx	[%r17 + 0x0000], %r1
	.word 0xc273a000  ! 11: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273a000  ! 12: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273c010  ! 13: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc2738010  ! 14: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25bc010  ! 15: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25fa000  ! 16: LDX_I	ldx	[%r30 + 0x0000], %r1
	.word 0xc2738010  ! 17: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25bc010  ! 18: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2738010  ! 19: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25dc010  ! 20: LDX_R	ldx	[%r23 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_41:
	.word 0xc2758010  ! 1: STX_R	stx	%r1, [%r22 + %r16]
	.word 0xc25b8010  ! 2: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273c010  ! 3: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25ea000  ! 4: LDX_I	ldx	[%r26 + 0x0000], %r1
	.word 0xc25b8010  ! 5: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273a000  ! 6: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25b8010  ! 7: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25bc010  ! 8: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25ba000  ! 9: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25f2000  ! 10: LDX_I	ldx	[%r28 + 0x0000], %r1
	.word 0xc277a000  ! 11: STX_I	stx	%r1, [%r30 + 0x0000]
	.word 0xc2762000  ! 12: STX_I	stx	%r1, [%r24 + 0x0000]
	.word 0xc273c010  ! 13: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273e000  ! 14: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25bc010  ! 15: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25be000  ! 16: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2738010  ! 17: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25dc010  ! 18: LDX_R	ldx	[%r23 + %r16], %r1
	.word 0xc273a000  ! 19: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25bc010  ! 20: LDX_R	ldx	[%r15 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_40:
	.word 0xc2738010  ! 1: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25b8010  ! 2: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2738010  ! 3: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25c6000  ! 4: LDX_I	ldx	[%r17 + 0x0000], %r1
	.word 0xc25bc010  ! 5: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273c010  ! 6: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25cc010  ! 7: LDX_R	ldx	[%r19 + %r16], %r1
	.word 0xc25b8010  ! 8: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25ea000  ! 9: LDX_I	ldx	[%r26 + 0x0000], %r1
	.word 0xc25be000  ! 10: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273a000  ! 11: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc2738010  ! 12: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc2766000  ! 13: STX_I	stx	%r1, [%r25 + 0x0000]
	.word 0xc274e000  ! 14: STX_I	stx	%r1, [%r19 + 0x0000]
	.word 0xc25dc010  ! 15: LDX_R	ldx	[%r23 + %r16], %r1
	.word 0xc25ea000  ! 16: LDX_I	ldx	[%r26 + 0x0000], %r1
	.word 0xc2766000  ! 17: STX_I	stx	%r1, [%r25 + 0x0000]
	.word 0xc25bc010  ! 18: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2738010  ! 19: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25b8010  ! 20: LDX_R	ldx	[%r14 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_39:
	.word 0xc276e000  ! 1: STX_I	stx	%r1, [%r27 + 0x0000]
	.word 0xc25bc010  ! 2: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2738010  ! 3: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25be000  ! 4: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25b8010  ! 5: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2748010  ! 6: STX_R	stx	%r1, [%r18 + %r16]
	.word 0xc25bc010  ! 7: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25bc010  ! 8: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25f2000  ! 9: LDX_I	ldx	[%r28 + 0x0000], %r1
	.word 0xc25e6000  ! 10: LDX_I	ldx	[%r25 + 0x0000], %r1
	.word 0xc2738010  ! 11: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273a000  ! 12: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc2738010  ! 13: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273a000  ! 14: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25b8010  ! 15: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25be000  ! 16: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273e000  ! 17: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25bc010  ! 18: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273c010  ! 19: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25bc010  ! 20: LDX_R	ldx	[%r15 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_38:
	.word 0xc273a000  ! 1: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25d0010  ! 2: LDX_R	ldx	[%r20 + %r16], %r1
	.word 0xc273a000  ! 3: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25c6000  ! 4: LDX_I	ldx	[%r17 + 0x0000], %r1
	.word 0xc25c4010  ! 5: LDX_R	ldx	[%r17 + %r16], %r1
	.word 0xc273e000  ! 6: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25b8010  ! 7: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25b8010  ! 8: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25ca000  ! 9: LDX_I	ldx	[%r18 + 0x0000], %r1
	.word 0xc25fa000  ! 10: LDX_I	ldx	[%r30 + 0x0000], %r1
	.word 0xc2778010  ! 11: STX_R	stx	%r1, [%r30 + %r16]
	.word 0xc273e000  ! 12: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc273a000  ! 13: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc2764010  ! 14: STX_R	stx	%r1, [%r25 + %r16]
	.word 0xc25c8010  ! 15: LDX_R	ldx	[%r18 + %r16], %r1
	.word 0xc25be000  ! 16: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273e000  ! 17: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25b8010  ! 18: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2758010  ! 19: STX_R	stx	%r1, [%r22 + %r16]
	.word 0xc25dc010  ! 20: LDX_R	ldx	[%r23 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_37:
	.word 0xc277c010  ! 1: STX_R	stx	%r1, [%r31 + %r16]
	.word 0xc25bc010  ! 2: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273a000  ! 3: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25ba000  ! 4: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25dc010  ! 5: LDX_R	ldx	[%r23 + %r16], %r1
	.word 0xc2738010  ! 6: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25e0010  ! 7: LDX_R	ldx	[%r24 + %r16], %r1
	.word 0xc25e4010  ! 8: LDX_R	ldx	[%r25 + %r16], %r1
	.word 0xc25be000  ! 9: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25f2000  ! 10: LDX_I	ldx	[%r28 + 0x0000], %r1
	.word 0xc2754010  ! 11: STX_R	stx	%r1, [%r21 + %r16]
	.word 0xc2772000  ! 12: STX_I	stx	%r1, [%r28 + 0x0000]
	.word 0xc273c010  ! 13: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273e000  ! 14: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25f4010  ! 15: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc25ee000  ! 16: LDX_I	ldx	[%r27 + 0x0000], %r1
	.word 0xc2770010  ! 17: STX_R	stx	%r1, [%r28 + %r16]
	.word 0xc25b8010  ! 18: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2746000  ! 19: STX_I	stx	%r1, [%r17 + 0x0000]
	.word 0xc25b8010  ! 20: LDX_R	ldx	[%r14 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_36:
	.word 0xc273a000  ! 1: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25b8010  ! 2: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273e000  ! 3: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25be000  ! 4: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25bc010  ! 5: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2738010  ! 6: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25bc010  ! 7: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25bc010  ! 8: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25ba000  ! 9: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25ba000  ! 10: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2738010  ! 11: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273a000  ! 12: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273a000  ! 13: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc2746000  ! 14: STX_I	stx	%r1, [%r17 + 0x0000]
	.word 0xc25c8010  ! 15: LDX_R	ldx	[%r18 + %r16], %r1
	.word 0xc25be000  ! 16: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273a000  ! 17: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25b8010  ! 18: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2738010  ! 19: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25bc010  ! 20: LDX_R	ldx	[%r15 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_35:
	.word 0xc2774010  ! 1: STX_R	stx	%r1, [%r29 + %r16]
	.word 0xc25bc010  ! 2: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2750010  ! 3: STX_R	stx	%r1, [%r20 + %r16]
	.word 0xc25e6000  ! 4: LDX_I	ldx	[%r25 + 0x0000], %r1
	.word 0xc25bc010  ! 5: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273c010  ! 6: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25b8010  ! 7: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25bc010  ! 8: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25ba000  ! 9: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25c6000  ! 10: LDX_I	ldx	[%r17 + 0x0000], %r1
	.word 0xc2738010  ! 11: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc276c010  ! 12: STX_R	stx	%r1, [%r27 + %r16]
	.word 0xc2738010  ! 13: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc2744010  ! 14: STX_R	stx	%r1, [%r17 + %r16]
	.word 0xc25f8010  ! 15: LDX_R	ldx	[%r30 + %r16], %r1
	.word 0xc25be000  ! 16: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273a000  ! 17: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25b8010  ! 18: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2738010  ! 19: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25b8010  ! 20: LDX_R	ldx	[%r14 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_34:
	.word 0xc2744010  ! 1: STX_R	stx	%r1, [%r17 + %r16]
	.word 0xc25bc010  ! 2: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273a000  ! 3: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25fa000  ! 4: LDX_I	ldx	[%r30 + 0x0000], %r1
	.word 0xc25b8010  ! 5: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2760010  ! 6: STX_R	stx	%r1, [%r24 + %r16]
	.word 0xc25b8010  ! 7: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25b8010  ! 8: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25ea000  ! 9: LDX_I	ldx	[%r26 + 0x0000], %r1
	.word 0xc25ba000  ! 10: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273e000  ! 11: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc2738010  ! 12: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc2760010  ! 13: STX_R	stx	%r1, [%r24 + %r16]
	.word 0xc273a000  ! 14: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25b8010  ! 15: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25ba000  ! 16: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273e000  ! 17: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25bc010  ! 18: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2738010  ! 19: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25bc010  ! 20: LDX_R	ldx	[%r15 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_33:
	.word 0xc273e000  ! 1: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25b8010  ! 2: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc274a000  ! 3: STX_I	stx	%r1, [%r18 + 0x0000]
	.word 0xc25be000  ! 4: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25bc010  ! 5: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc276a000  ! 6: STX_I	stx	%r1, [%r26 + 0x0000]
	.word 0xc25bc010  ! 7: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25d8010  ! 8: LDX_R	ldx	[%r22 + %r16], %r1
	.word 0xc25be000  ! 9: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25ba000  ! 10: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273e000  ! 11: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc273a000  ! 12: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc2750010  ! 13: STX_R	stx	%r1, [%r20 + %r16]
	.word 0xc273c010  ! 14: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25bc010  ! 15: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25ba000  ! 16: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273a000  ! 17: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25cc010  ! 18: LDX_R	ldx	[%r19 + %r16], %r1
	.word 0xc277e000  ! 19: STX_I	stx	%r1, [%r31 + 0x0000]
	.word 0xc25b8010  ! 20: LDX_R	ldx	[%r14 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_32:
	.word 0xc273c010  ! 1: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25c4010  ! 2: LDX_R	ldx	[%r17 + %r16], %r1
	.word 0xc273e000  ! 3: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25e2000  ! 4: LDX_I	ldx	[%r24 + 0x0000], %r1
	.word 0xc25b8010  ! 5: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2768010  ! 6: STX_R	stx	%r1, [%r26 + %r16]
	.word 0xc25b8010  ! 7: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25b8010  ! 8: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25be000  ! 9: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25ba000  ! 10: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2748010  ! 11: STX_R	stx	%r1, [%r18 + %r16]
	.word 0xc273c010  ! 12: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273a000  ! 13: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc274c010  ! 14: STX_R	stx	%r1, [%r19 + %r16]
	.word 0xc25ec010  ! 15: LDX_R	ldx	[%r27 + %r16], %r1
	.word 0xc25ca000  ! 16: LDX_I	ldx	[%r18 + 0x0000], %r1
	.word 0xc2738010  ! 17: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25b8010  ! 18: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2778010  ! 19: STX_R	stx	%r1, [%r30 + %r16]
	.word 0xc25cc010  ! 20: LDX_R	ldx	[%r19 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_31:
	.word 0xc273a000  ! 1: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25b8010  ! 2: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2738010  ! 3: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25e6000  ! 4: LDX_I	ldx	[%r25 + 0x0000], %r1
	.word 0xc25b8010  ! 5: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273c010  ! 6: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25dc010  ! 7: LDX_R	ldx	[%r23 + %r16], %r1
	.word 0xc25b8010  ! 8: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25ba000  ! 9: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25ba000  ! 10: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2768010  ! 11: STX_R	stx	%r1, [%r26 + %r16]
	.word 0xc274e000  ! 12: STX_I	stx	%r1, [%r19 + 0x0000]
	.word 0xc274e000  ! 13: STX_I	stx	%r1, [%r19 + 0x0000]
	.word 0xc2738010  ! 14: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25fc010  ! 15: LDX_R	ldx	[%r31 + %r16], %r1
	.word 0xc25fa000  ! 16: LDX_I	ldx	[%r30 + 0x0000], %r1
	.word 0xc2738010  ! 17: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25b8010  ! 18: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2762000  ! 19: STX_I	stx	%r1, [%r24 + 0x0000]
	.word 0xc25fc010  ! 20: LDX_R	ldx	[%r31 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_30:
	.word 0xc273e000  ! 1: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25e8010  ! 2: LDX_R	ldx	[%r26 + %r16], %r1
	.word 0xc273e000  ! 3: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25be000  ! 4: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25b8010  ! 5: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2756000  ! 6: STX_I	stx	%r1, [%r21 + 0x0000]
	.word 0xc25b8010  ! 7: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25bc010  ! 8: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25be000  ! 9: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25be000  ! 10: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273c010  ! 11: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc2738010  ! 12: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc277e000  ! 13: STX_I	stx	%r1, [%r31 + 0x0000]
	.word 0xc2776000  ! 14: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25b8010  ! 15: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25e2000  ! 16: LDX_I	ldx	[%r24 + 0x0000], %r1
	.word 0xc2738010  ! 17: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25bc010  ! 18: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2738010  ! 19: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25b8010  ! 20: LDX_R	ldx	[%r14 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_29:
	.word 0xc2738010  ! 1: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25bc010  ! 2: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273c010  ! 3: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25ea000  ! 4: LDX_I	ldx	[%r26 + 0x0000], %r1
	.word 0xc25b8010  ! 5: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2738010  ! 6: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25b8010  ! 7: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25b8010  ! 8: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25ba000  ! 9: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25de000  ! 10: LDX_I	ldx	[%r23 + 0x0000], %r1
	.word 0xc2738010  ! 11: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc2752000  ! 12: STX_I	stx	%r1, [%r20 + 0x0000]
	.word 0xc273e000  ! 13: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc273a000  ! 14: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25dc010  ! 15: LDX_R	ldx	[%r23 + %r16], %r1
	.word 0xc25be000  ! 16: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2754010  ! 17: STX_R	stx	%r1, [%r21 + %r16]
	.word 0xc25b8010  ! 18: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273a000  ! 19: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25e8010  ! 20: LDX_R	ldx	[%r26 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_28:
	.word 0xc273e000  ! 1: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25bc010  ! 2: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2768010  ! 3: STX_R	stx	%r1, [%r26 + %r16]
	.word 0xc25be000  ! 4: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25bc010  ! 5: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273a000  ! 6: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25b8010  ! 7: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25e8010  ! 8: LDX_R	ldx	[%r26 + %r16], %r1
	.word 0xc25ee000  ! 9: LDX_I	ldx	[%r27 + 0x0000], %r1
	.word 0xc25e6000  ! 10: LDX_I	ldx	[%r25 + 0x0000], %r1
	.word 0xc273a000  ! 11: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc2760010  ! 12: STX_R	stx	%r1, [%r24 + %r16]
	.word 0xc2760010  ! 13: STX_R	stx	%r1, [%r24 + %r16]
	.word 0xc273a000  ! 14: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25c8010  ! 15: LDX_R	ldx	[%r18 + %r16], %r1
	.word 0xc25be000  ! 16: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273a000  ! 17: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25b8010  ! 18: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2738010  ! 19: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25fc010  ! 20: LDX_R	ldx	[%r31 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_27:
	.word 0xc273e000  ! 1: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25b8010  ! 2: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc276a000  ! 3: STX_I	stx	%r1, [%r26 + 0x0000]
	.word 0xc25be000  ! 4: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25bc010  ! 5: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273e000  ! 6: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25bc010  ! 7: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25f4010  ! 8: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc25ba000  ! 9: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25be000  ! 10: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc275e000  ! 11: STX_I	stx	%r1, [%r23 + 0x0000]
	.word 0xc2748010  ! 12: STX_R	stx	%r1, [%r18 + %r16]
	.word 0xc273a000  ! 13: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc2738010  ! 14: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25b8010  ! 15: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25d2000  ! 16: LDX_I	ldx	[%r20 + 0x0000], %r1
	.word 0xc273c010  ! 17: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25dc010  ! 18: LDX_R	ldx	[%r23 + %r16], %r1
	.word 0xc2738010  ! 19: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25e0010  ! 20: LDX_R	ldx	[%r24 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_26:
	.word 0xc277a000  ! 1: STX_I	stx	%r1, [%r30 + 0x0000]
	.word 0xc25b8010  ! 2: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273e000  ! 3: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25d6000  ! 4: LDX_I	ldx	[%r21 + 0x0000], %r1
	.word 0xc25bc010  ! 5: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc277a000  ! 6: STX_I	stx	%r1, [%r30 + 0x0000]
	.word 0xc25bc010  ! 7: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25bc010  ! 8: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25de000  ! 9: LDX_I	ldx	[%r23 + 0x0000], %r1
	.word 0xc25ba000  ! 10: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2738010  ! 11: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc2738010  ! 12: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc2738010  ! 13: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273e000  ! 14: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25ec010  ! 15: LDX_R	ldx	[%r27 + %r16], %r1
	.word 0xc25ce000  ! 16: LDX_I	ldx	[%r19 + 0x0000], %r1
	.word 0xc273e000  ! 17: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25bc010  ! 18: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273c010  ! 19: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25bc010  ! 20: LDX_R	ldx	[%r15 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_25:
	.word 0xc273e000  ! 1: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25b8010  ! 2: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2738010  ! 3: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25ba000  ! 4: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25f8010  ! 5: LDX_R	ldx	[%r30 + %r16], %r1
	.word 0xc273a000  ! 6: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25bc010  ! 7: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25d4010  ! 8: LDX_R	ldx	[%r21 + %r16], %r1
	.word 0xc25ba000  ! 9: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25be000  ! 10: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2774010  ! 11: STX_R	stx	%r1, [%r29 + %r16]
	.word 0xc273e000  ! 12: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc273e000  ! 13: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc273c010  ! 14: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25dc010  ! 15: LDX_R	ldx	[%r23 + %r16], %r1
	.word 0xc25f6000  ! 16: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc2760010  ! 17: STX_R	stx	%r1, [%r24 + %r16]
	.word 0xc25e8010  ! 18: LDX_R	ldx	[%r26 + %r16], %r1
	.word 0xc273e000  ! 19: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25b8010  ! 20: LDX_R	ldx	[%r14 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_24:
	.word 0xc2762000  ! 1: STX_I	stx	%r1, [%r24 + 0x0000]
	.word 0xc25bc010  ! 2: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273e000  ! 3: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25be000  ! 4: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25bc010  ! 5: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc274e000  ! 6: STX_I	stx	%r1, [%r19 + 0x0000]
	.word 0xc25bc010  ! 7: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25bc010  ! 8: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25ba000  ! 9: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25ba000  ! 10: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273c010  ! 11: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc2750010  ! 12: STX_R	stx	%r1, [%r20 + %r16]
	.word 0xc273e000  ! 13: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc2738010  ! 14: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25b8010  ! 15: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25de000  ! 16: LDX_I	ldx	[%r23 + 0x0000], %r1
	.word 0xc273e000  ! 17: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25b8010  ! 18: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273a000  ! 19: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25b8010  ! 20: LDX_R	ldx	[%r14 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_23:
	.word 0xc273e000  ! 1: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25cc010  ! 2: LDX_R	ldx	[%r19 + %r16], %r1
	.word 0xc277a000  ! 3: STX_I	stx	%r1, [%r30 + 0x0000]
	.word 0xc25be000  ! 4: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25b8010  ! 5: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2770010  ! 6: STX_R	stx	%r1, [%r28 + %r16]
	.word 0xc25b8010  ! 7: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25bc010  ! 8: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25c6000  ! 9: LDX_I	ldx	[%r17 + 0x0000], %r1
	.word 0xc25da000  ! 10: LDX_I	ldx	[%r22 + 0x0000], %r1
	.word 0xc273e000  ! 11: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc273a000  ! 12: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc2738010  ! 13: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc2744010  ! 14: STX_R	stx	%r1, [%r17 + %r16]
	.word 0xc25bc010  ! 15: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25f6000  ! 16: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc2738010  ! 17: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25b8010  ! 18: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273e000  ! 19: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25b8010  ! 20: LDX_R	ldx	[%r14 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_22:
	.word 0xc276a000  ! 1: STX_I	stx	%r1, [%r26 + 0x0000]
	.word 0xc25fc010  ! 2: LDX_R	ldx	[%r31 + %r16], %r1
	.word 0xc2744010  ! 3: STX_R	stx	%r1, [%r17 + %r16]
	.word 0xc25ba000  ! 4: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25f4010  ! 5: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc277e000  ! 6: STX_I	stx	%r1, [%r31 + 0x0000]
	.word 0xc25bc010  ! 7: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25c8010  ! 8: LDX_R	ldx	[%r18 + %r16], %r1
	.word 0xc25ba000  ! 9: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25be000  ! 10: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc275e000  ! 11: STX_I	stx	%r1, [%r23 + 0x0000]
	.word 0xc274c010  ! 12: STX_R	stx	%r1, [%r19 + %r16]
	.word 0xc2768010  ! 13: STX_R	stx	%r1, [%r26 + %r16]
	.word 0xc275e000  ! 14: STX_I	stx	%r1, [%r23 + 0x0000]
	.word 0xc25bc010  ! 15: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25be000  ! 16: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273c010  ! 17: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25e8010  ! 18: LDX_R	ldx	[%r26 + %r16], %r1
	.word 0xc276a000  ! 19: STX_I	stx	%r1, [%r26 + 0x0000]
	.word 0xc25f4010  ! 20: LDX_R	ldx	[%r29 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_21:
	.word 0xc2764010  ! 1: STX_R	stx	%r1, [%r25 + %r16]
	.word 0xc25b8010  ! 2: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc275c010  ! 3: STX_R	stx	%r1, [%r23 + %r16]
	.word 0xc25be000  ! 4: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25b8010  ! 5: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2738010  ! 6: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25bc010  ! 7: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25b8010  ! 8: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25ba000  ! 9: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25ba000  ! 10: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2774010  ! 11: STX_R	stx	%r1, [%r29 + %r16]
	.word 0xc273a000  ! 12: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273c010  ! 13: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273a000  ! 14: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25bc010  ! 15: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25ba000  ! 16: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2744010  ! 17: STX_R	stx	%r1, [%r17 + %r16]
	.word 0xc25bc010  ! 18: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273c010  ! 19: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25bc010  ! 20: LDX_R	ldx	[%r15 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_20:
	.word 0xc2738010  ! 1: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25f4010  ! 2: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc273e000  ! 3: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25ba000  ! 4: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25bc010  ! 5: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273a000  ! 6: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25b8010  ! 7: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25bc010  ! 8: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25ba000  ! 9: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25be000  ! 10: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273a000  ! 11: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc274e000  ! 12: STX_I	stx	%r1, [%r19 + 0x0000]
	.word 0xc2766000  ! 13: STX_I	stx	%r1, [%r25 + 0x0000]
	.word 0xc273e000  ! 14: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25bc010  ! 15: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25be000  ! 16: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2738010  ! 17: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25e0010  ! 18: LDX_R	ldx	[%r24 + %r16], %r1
	.word 0xc2738010  ! 19: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25b8010  ! 20: LDX_R	ldx	[%r14 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_19:
	.word 0xc2758010  ! 1: STX_R	stx	%r1, [%r22 + %r16]
	.word 0xc25bc010  ! 2: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273a000  ! 3: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25ba000  ! 4: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25bc010  ! 5: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2758010  ! 6: STX_R	stx	%r1, [%r22 + %r16]
	.word 0xc25bc010  ! 7: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25d8010  ! 8: LDX_R	ldx	[%r22 + %r16], %r1
	.word 0xc25be000  ! 9: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25ba000  ! 10: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273a000  ! 11: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc276c010  ! 12: STX_R	stx	%r1, [%r27 + %r16]
	.word 0xc273c010  ! 13: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273e000  ! 14: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25b8010  ! 15: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25e2000  ! 16: LDX_I	ldx	[%r24 + 0x0000], %r1
	.word 0xc273e000  ! 17: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25e8010  ! 18: LDX_R	ldx	[%r26 + %r16], %r1
	.word 0xc275e000  ! 19: STX_I	stx	%r1, [%r23 + 0x0000]
	.word 0xc25bc010  ! 20: LDX_R	ldx	[%r15 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_18:
	.word 0xc273e000  ! 1: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25ec010  ! 2: LDX_R	ldx	[%r27 + %r16], %r1
	.word 0xc2762000  ! 3: STX_I	stx	%r1, [%r24 + 0x0000]
	.word 0xc25ba000  ! 4: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25bc010  ! 5: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273a000  ! 6: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25e0010  ! 7: LDX_R	ldx	[%r24 + %r16], %r1
	.word 0xc25bc010  ! 8: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25f2000  ! 9: LDX_I	ldx	[%r28 + 0x0000], %r1
	.word 0xc25ee000  ! 10: LDX_I	ldx	[%r27 + 0x0000], %r1
	.word 0xc2752000  ! 11: STX_I	stx	%r1, [%r20 + 0x0000]
	.word 0xc273e000  ! 12: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc2772000  ! 13: STX_I	stx	%r1, [%r28 + 0x0000]
	.word 0xc273c010  ! 14: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25b8010  ! 15: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25ba000  ! 16: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2750010  ! 17: STX_R	stx	%r1, [%r20 + %r16]
	.word 0xc25ec010  ! 18: LDX_R	ldx	[%r27 + %r16], %r1
	.word 0xc273a000  ! 19: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25d0010  ! 20: LDX_R	ldx	[%r20 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_17:
	.word 0xc273e000  ! 1: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25b8010  ! 2: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2754010  ! 3: STX_R	stx	%r1, [%r21 + %r16]
	.word 0xc25ba000  ! 4: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25bc010  ! 5: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc276a000  ! 6: STX_I	stx	%r1, [%r26 + 0x0000]
	.word 0xc25b8010  ! 7: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25b8010  ! 8: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25be000  ! 9: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25de000  ! 10: LDX_I	ldx	[%r23 + 0x0000], %r1
	.word 0xc273a000  ! 11: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273e000  ! 12: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc2762000  ! 13: STX_I	stx	%r1, [%r24 + 0x0000]
	.word 0xc273a000  ! 14: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25f8010  ! 15: LDX_R	ldx	[%r30 + %r16], %r1
	.word 0xc25e6000  ! 16: LDX_I	ldx	[%r25 + 0x0000], %r1
	.word 0xc2772000  ! 17: STX_I	stx	%r1, [%r28 + 0x0000]
	.word 0xc25d4010  ! 18: LDX_R	ldx	[%r21 + %r16], %r1
	.word 0xc273e000  ! 19: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25b8010  ! 20: LDX_R	ldx	[%r14 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_16:
	.word 0xc273c010  ! 1: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25bc010  ! 2: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2738010  ! 3: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25be000  ! 4: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25b8010  ! 5: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273e000  ! 6: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25b8010  ! 7: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25b8010  ! 8: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25be000  ! 9: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25be000  ! 10: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2738010  ! 11: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc2762000  ! 12: STX_I	stx	%r1, [%r24 + 0x0000]
	.word 0xc275e000  ! 13: STX_I	stx	%r1, [%r23 + 0x0000]
	.word 0xc273a000  ! 14: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25bc010  ! 15: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25be000  ! 16: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2774010  ! 17: STX_R	stx	%r1, [%r29 + %r16]
	.word 0xc25b8010  ! 18: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273c010  ! 19: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25d4010  ! 20: LDX_R	ldx	[%r21 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_15:
	.word 0xc277a000  ! 1: STX_I	stx	%r1, [%r30 + 0x0000]
	.word 0xc25c4010  ! 2: LDX_R	ldx	[%r17 + %r16], %r1
	.word 0xc273e000  ! 3: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25fe000  ! 4: LDX_I	ldx	[%r31 + 0x0000], %r1
	.word 0xc25bc010  ! 5: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2764010  ! 6: STX_R	stx	%r1, [%r25 + %r16]
	.word 0xc25bc010  ! 7: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25b8010  ! 8: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25ba000  ! 9: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25be000  ! 10: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273c010  ! 11: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273a000  ! 12: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc2738010  ! 13: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273c010  ! 14: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25bc010  ! 15: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25be000  ! 16: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273e000  ! 17: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25b8010  ! 18: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2738010  ! 19: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25e8010  ! 20: LDX_R	ldx	[%r26 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_14:
	.word 0xc273c010  ! 1: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25d0010  ! 2: LDX_R	ldx	[%r20 + %r16], %r1
	.word 0xc273a000  ! 3: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25ba000  ! 4: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25f8010  ! 5: LDX_R	ldx	[%r30 + %r16], %r1
	.word 0xc273e000  ! 6: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25e8010  ! 7: LDX_R	ldx	[%r26 + %r16], %r1
	.word 0xc25b8010  ! 8: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25ba000  ! 9: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25be000  ! 10: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2738010  ! 11: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc2738010  ! 12: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273e000  ! 13: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc273c010  ! 14: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25ec010  ! 15: LDX_R	ldx	[%r27 + %r16], %r1
	.word 0xc25be000  ! 16: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2756000  ! 17: STX_I	stx	%r1, [%r21 + 0x0000]
	.word 0xc25b8010  ! 18: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2770010  ! 19: STX_R	stx	%r1, [%r28 + %r16]
	.word 0xc25b8010  ! 20: LDX_R	ldx	[%r14 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_13:
	.word 0xc2750010  ! 1: STX_R	stx	%r1, [%r20 + %r16]
	.word 0xc25bc010  ! 2: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2738010  ! 3: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25c6000  ! 4: LDX_I	ldx	[%r17 + 0x0000], %r1
	.word 0xc25b8010  ! 5: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273c010  ! 6: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25bc010  ! 7: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25b8010  ! 8: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25d6000  ! 9: LDX_I	ldx	[%r21 + 0x0000], %r1
	.word 0xc25fe000  ! 10: LDX_I	ldx	[%r31 + 0x0000], %r1
	.word 0xc273a000  ! 11: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273a000  ! 12: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc2760010  ! 13: STX_R	stx	%r1, [%r24 + %r16]
	.word 0xc2738010  ! 14: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25b8010  ! 15: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25ba000  ! 16: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273e000  ! 17: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25bc010  ! 18: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc277a000  ! 19: STX_I	stx	%r1, [%r30 + 0x0000]
	.word 0xc25bc010  ! 20: LDX_R	ldx	[%r15 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_12:
	.word 0xc2738010  ! 1: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25bc010  ! 2: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273c010  ! 3: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25ba000  ! 4: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25c4010  ! 5: LDX_R	ldx	[%r17 + %r16], %r1
	.word 0xc273a000  ! 6: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25f4010  ! 7: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc25bc010  ! 8: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25f6000  ! 9: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25ba000  ! 10: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273a000  ! 11: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc2738010  ! 12: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc2738010  ! 13: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273a000  ! 14: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25b8010  ! 15: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25f6000  ! 16: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc273c010  ! 17: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25b8010  ! 18: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273c010  ! 19: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25dc010  ! 20: LDX_R	ldx	[%r23 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_11:
	.word 0xc273c010  ! 1: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25e0010  ! 2: LDX_R	ldx	[%r24 + %r16], %r1
	.word 0xc273e000  ! 3: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25ba000  ! 4: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25b8010  ! 5: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273e000  ! 6: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25dc010  ! 7: LDX_R	ldx	[%r23 + %r16], %r1
	.word 0xc25b8010  ! 8: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25e6000  ! 9: LDX_I	ldx	[%r25 + 0x0000], %r1
	.word 0xc25f6000  ! 10: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc275a000  ! 11: STX_I	stx	%r1, [%r22 + 0x0000]
	.word 0xc2750010  ! 12: STX_R	stx	%r1, [%r20 + %r16]
	.word 0xc274e000  ! 13: STX_I	stx	%r1, [%r19 + 0x0000]
	.word 0xc2776000  ! 14: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25bc010  ! 15: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25ba000  ! 16: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273a000  ! 17: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25f0010  ! 18: LDX_R	ldx	[%r28 + %r16], %r1
	.word 0xc2738010  ! 19: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25b8010  ! 20: LDX_R	ldx	[%r14 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_10:
	.word 0xc2738010  ! 1: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25b8010  ! 2: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273e000  ! 3: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25e6000  ! 4: LDX_I	ldx	[%r25 + 0x0000], %r1
	.word 0xc25bc010  ! 5: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2776000  ! 6: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25bc010  ! 7: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25f4010  ! 8: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc25be000  ! 9: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25ba000  ! 10: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273c010  ! 11: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc276c010  ! 12: STX_R	stx	%r1, [%r27 + %r16]
	.word 0xc2738010  ! 13: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273e000  ! 14: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25b8010  ! 15: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25ba000  ! 16: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273e000  ! 17: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25bc010  ! 18: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273a000  ! 19: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25bc010  ! 20: LDX_R	ldx	[%r15 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_9:
	.word 0xc2738010  ! 1: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25bc010  ! 2: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2738010  ! 3: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25ba000  ! 4: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25b8010  ! 5: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc275e000  ! 6: STX_I	stx	%r1, [%r23 + 0x0000]
	.word 0xc25f0010  ! 7: LDX_R	ldx	[%r28 + %r16], %r1
	.word 0xc25b8010  ! 8: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25ba000  ! 9: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25be000  ! 10: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273e000  ! 11: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc273a000  ! 12: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273e000  ! 13: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc273c010  ! 14: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25b8010  ! 15: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25e6000  ! 16: LDX_I	ldx	[%r25 + 0x0000], %r1
	.word 0xc2738010  ! 17: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25bc010  ! 18: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2738010  ! 19: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25bc010  ! 20: LDX_R	ldx	[%r15 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_8:
	.word 0xc2778010  ! 1: STX_R	stx	%r1, [%r30 + %r16]
	.word 0xc25bc010  ! 2: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc277a000  ! 3: STX_I	stx	%r1, [%r30 + 0x0000]
	.word 0xc25ce000  ! 4: LDX_I	ldx	[%r19 + 0x0000], %r1
	.word 0xc25b8010  ! 5: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273c010  ! 6: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25bc010  ! 7: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25e0010  ! 8: LDX_R	ldx	[%r24 + %r16], %r1
	.word 0xc25c6000  ! 9: LDX_I	ldx	[%r17 + 0x0000], %r1
	.word 0xc25fe000  ! 10: LDX_I	ldx	[%r31 + 0x0000], %r1
	.word 0xc273c010  ! 11: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273e000  ! 12: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc273a000  ! 13: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273e000  ! 14: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25b8010  ! 15: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25ba000  ! 16: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2738010  ! 17: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25bc010  ! 18: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc275a000  ! 19: STX_I	stx	%r1, [%r22 + 0x0000]
	.word 0xc25b8010  ! 20: LDX_R	ldx	[%r14 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_7:
	.word 0xc2738010  ! 1: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25b8010  ! 2: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273a000  ! 3: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25be000  ! 4: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25bc010  ! 5: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc274e000  ! 6: STX_I	stx	%r1, [%r19 + 0x0000]
	.word 0xc25b8010  ! 7: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25b8010  ! 8: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25ba000  ! 9: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25be000  ! 10: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc277a000  ! 11: STX_I	stx	%r1, [%r30 + 0x0000]
	.word 0xc273a000  ! 12: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273a000  ! 13: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273a000  ! 14: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25fc010  ! 15: LDX_R	ldx	[%r31 + %r16], %r1
	.word 0xc25be000  ! 16: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc275a000  ! 17: STX_I	stx	%r1, [%r22 + 0x0000]
	.word 0xc25b8010  ! 18: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc276e000  ! 19: STX_I	stx	%r1, [%r27 + 0x0000]
	.word 0xc25bc010  ! 20: LDX_R	ldx	[%r15 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_6:
	.word 0xc273a000  ! 1: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25c8010  ! 2: LDX_R	ldx	[%r18 + %r16], %r1
	.word 0xc273e000  ! 3: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25ba000  ! 4: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25bc010  ! 5: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2752000  ! 6: STX_I	stx	%r1, [%r20 + 0x0000]
	.word 0xc25fc010  ! 7: LDX_R	ldx	[%r31 + %r16], %r1
	.word 0xc25bc010  ! 8: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25de000  ! 9: LDX_I	ldx	[%r23 + 0x0000], %r1
	.word 0xc25f6000  ! 10: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc273e000  ! 11: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc2738010  ! 12: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273c010  ! 13: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc2764010  ! 14: STX_R	stx	%r1, [%r25 + %r16]
	.word 0xc25b8010  ! 15: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25ba000  ! 16: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273a000  ! 17: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25d8010  ! 18: LDX_R	ldx	[%r22 + %r16], %r1
	.word 0xc273e000  ! 19: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25bc010  ! 20: LDX_R	ldx	[%r15 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_5:
	.word 0xc2760010  ! 1: STX_R	stx	%r1, [%r24 + %r16]
	.word 0xc25f8010  ! 2: LDX_R	ldx	[%r30 + %r16], %r1
	.word 0xc2764010  ! 3: STX_R	stx	%r1, [%r25 + %r16]
	.word 0xc25ba000  ! 4: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25b8010  ! 5: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2738010  ! 6: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25d4010  ! 7: LDX_R	ldx	[%r21 + %r16], %r1
	.word 0xc25b8010  ! 8: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25ba000  ! 9: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25d6000  ! 10: LDX_I	ldx	[%r21 + 0x0000], %r1
	.word 0xc276c010  ! 11: STX_R	stx	%r1, [%r27 + %r16]
	.word 0xc2774010  ! 12: STX_R	stx	%r1, [%r29 + %r16]
	.word 0xc273e000  ! 13: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc273e000  ! 14: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25f4010  ! 15: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc25be000  ! 16: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2738010  ! 17: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25b8010  ! 18: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2738010  ! 19: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25bc010  ! 20: LDX_R	ldx	[%r15 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_4:
	.word 0xc273e000  ! 1: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25b8010  ! 2: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc274a000  ! 3: STX_I	stx	%r1, [%r18 + 0x0000]
	.word 0xc25be000  ! 4: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25bc010  ! 5: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273a000  ! 6: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25bc010  ! 7: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25b8010  ! 8: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25da000  ! 9: LDX_I	ldx	[%r22 + 0x0000], %r1
	.word 0xc25ba000  ! 10: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2738010  ! 11: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273a000  ! 12: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc2762000  ! 13: STX_I	stx	%r1, [%r24 + 0x0000]
	.word 0xc273a000  ! 14: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25bc010  ! 15: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25e2000  ! 16: LDX_I	ldx	[%r24 + 0x0000], %r1
	.word 0xc273c010  ! 17: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25b8010  ! 18: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc274c010  ! 19: STX_R	stx	%r1, [%r19 + %r16]
	.word 0xc25b8010  ! 20: LDX_R	ldx	[%r14 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	.word 0xc273c010  ! 1: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25b8010  ! 2: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2738010  ! 3: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25ce000  ! 4: LDX_I	ldx	[%r19 + 0x0000], %r1
	.word 0xc25bc010  ! 5: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273e000  ! 6: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25c8010  ! 7: LDX_R	ldx	[%r18 + %r16], %r1
	.word 0xc25b8010  ! 8: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25be000  ! 9: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25ba000  ! 10: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2754010  ! 11: STX_R	stx	%r1, [%r21 + %r16]
	.word 0xc2772000  ! 12: STX_I	stx	%r1, [%r28 + 0x0000]
	.word 0xc2738010  ! 13: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc274e000  ! 14: STX_I	stx	%r1, [%r19 + 0x0000]
	.word 0xc25e4010  ! 15: LDX_R	ldx	[%r25 + %r16], %r1
	.word 0xc25be000  ! 16: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc275a000  ! 17: STX_I	stx	%r1, [%r22 + 0x0000]
	.word 0xc25bc010  ! 18: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2764010  ! 19: STX_R	stx	%r1, [%r25 + %r16]
	.word 0xc25dc010  ! 20: LDX_R	ldx	[%r23 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	.word 0xc2738010  ! 1: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25bc010  ! 2: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273e000  ! 3: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25be000  ! 4: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25dc010  ! 5: LDX_R	ldx	[%r23 + %r16], %r1
	.word 0xc2738010  ! 6: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25bc010  ! 7: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25bc010  ! 8: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25e6000  ! 9: LDX_I	ldx	[%r25 + 0x0000], %r1
	.word 0xc25be000  ! 10: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc275a000  ! 11: STX_I	stx	%r1, [%r22 + 0x0000]
	.word 0xc2738010  ! 12: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc276e000  ! 13: STX_I	stx	%r1, [%r27 + 0x0000]
	.word 0xc2764010  ! 14: STX_R	stx	%r1, [%r25 + %r16]
	.word 0xc25bc010  ! 15: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25be000  ! 16: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2772000  ! 17: STX_I	stx	%r1, [%r28 + 0x0000]
	.word 0xc25b8010  ! 18: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273e000  ! 19: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25c4010  ! 20: LDX_R	ldx	[%r17 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xc273c010  ! 1: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25bc010  ! 2: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc276a000  ! 3: STX_I	stx	%r1, [%r26 + 0x0000]
	.word 0xc25ce000  ! 4: LDX_I	ldx	[%r19 + 0x0000], %r1
	.word 0xc25d4010  ! 5: LDX_R	ldx	[%r21 + %r16], %r1
	.word 0xc273c010  ! 6: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25bc010  ! 7: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25bc010  ! 8: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25ba000  ! 9: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25be000  ! 10: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2776000  ! 11: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc273a000  ! 12: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273a000  ! 13: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273e000  ! 14: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25d4010  ! 15: LDX_R	ldx	[%r21 + %r16], %r1
	.word 0xc25ba000  ! 16: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273a000  ! 17: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25c4010  ! 18: LDX_R	ldx	[%r17 + %r16], %r1
	.word 0xc273a000  ! 19: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25bc010  ! 20: LDX_R	ldx	[%r15 + %r16], %r1

join_lbl_0_0:
main_text_end:
	ta %icc, T_GOOD_TRAP
	nop
	nop
	nop

main_data_start:
.xword 0xff23a2265134b6e1
.xword 0x492026aafc0d4397
.xword 0xe333d56a0e3ffceb
.xword 0x5e20be1a0fc74e95
.xword 0xdae2f84f3aebefec
.xword 0x4bda82d24f7cda5a
.xword 0xe1664ccfe1b2bf60
.xword 0xa6a88797a9b757e5
.xword 0xc8355977b3ddf2f9
.xword 0x1702e251e422402e
.xword 0x9a149838bca176dc
.xword 0x330bca719dbce04c
.xword 0x9c5bec4d8c0d1fcb
.xword 0xdceafb496cdc4e15
.xword 0xac07c7a70e4c8040
.xword 0x0a7494ed7d74e0d9
.xword 0x18f5e4328104c32c
.xword 0x4804b1093fd7117b
.xword 0x5e9992d350daaafb
.xword 0xef74667edc4f5959
.xword 0x87c6c1a7c0c910d8
.xword 0xf44de814516e8bc3
.xword 0x553302063d2cf77e
.xword 0x646c0586c3312cda
.xword 0xc087fc1dac35f9a3
.xword 0x3f23cfd21bcab36e
.xword 0x37008f3e2337392c
.xword 0xc4433fa5623011c6
.xword 0x3231428d1e45315e
.xword 0xb9bd5363eb1c9efb
.xword 0x11eda5946374d902
.xword 0x028b017519e14224

#if 0
#endif

