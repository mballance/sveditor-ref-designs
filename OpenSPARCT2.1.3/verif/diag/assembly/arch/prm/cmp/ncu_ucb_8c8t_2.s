/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ncu_ucb_8c8t_2.s
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
	.word 0xc25b8010  ! 1: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25fa000  ! 2: LDX_I	ldx	[%r30 + 0x0000], %r1
	.word 0xc2754010  ! 3: STX_R	stx	%r1, [%r21 + %r16]
	.word 0xc25ba000  ! 4: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25cc010  ! 5: LDX_R	ldx	[%r19 + %r16], %r1
	.word 0xc25ba000  ! 6: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273c010  ! 7: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25b8010  ! 8: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273e000  ! 9: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc2746000  ! 10: STX_I	stx	%r1, [%r17 + 0x0000]
	.word 0xc25b8010  ! 11: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25bc010  ! 12: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc275e000  ! 13: STX_I	stx	%r1, [%r23 + 0x0000]
	.word 0xc2766000  ! 14: STX_I	stx	%r1, [%r25 + 0x0000]
	.word 0xc2752000  ! 15: STX_I	stx	%r1, [%r20 + 0x0000]
	.word 0xc273c010  ! 16: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25be000  ! 17: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25ba000  ! 18: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25be000  ! 19: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25be000  ! 20: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2738010  ! 21: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc2752000  ! 22: STX_I	stx	%r1, [%r20 + 0x0000]
	.word 0xc2778010  ! 23: STX_R	stx	%r1, [%r30 + %r16]
	.word 0xc25de000  ! 24: LDX_I	ldx	[%r23 + 0x0000], %r1
	.word 0xc273a000  ! 25: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25bc010  ! 26: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25b8010  ! 27: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273a000  ! 28: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25be000  ! 29: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25b8010  ! 30: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2754010  ! 31: STX_R	stx	%r1, [%r21 + %r16]
	.word 0xc25ea000  ! 32: LDX_I	ldx	[%r26 + 0x0000], %r1
	.word 0xc25be000  ! 33: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc273a000  ! 34: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273a000  ! 35: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25ba000  ! 37: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273c010  ! 38: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25ba000  ! 39: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25cc010  ! 40: LDX_R	ldx	[%r19 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_63:
	.word 0xc25bc010  ! 1: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25be000  ! 2: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273a000  ! 3: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25ba000  ! 4: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25ec010  ! 5: LDX_R	ldx	[%r27 + %r16], %r1
	.word 0xc25be000  ! 6: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2758010  ! 7: STX_R	stx	%r1, [%r22 + %r16]
	.word 0xc25c4010  ! 8: LDX_R	ldx	[%r17 + %r16], %r1
	.word 0xc273e000  ! 9: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc273a000  ! 10: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25c4010  ! 11: LDX_R	ldx	[%r17 + %r16], %r1
	.word 0xc25bc010  ! 12: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2754010  ! 13: STX_R	stx	%r1, [%r21 + %r16]
	.word 0xc2758010  ! 14: STX_R	stx	%r1, [%r22 + %r16]
	.word 0xc2758010  ! 15: STX_R	stx	%r1, [%r22 + %r16]
	.word 0xc273c010  ! 16: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25ba000  ! 17: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25ba000  ! 18: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25be000  ! 19: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25ea000  ! 20: LDX_I	ldx	[%r26 + 0x0000], %r1
	.word 0xc276e000  ! 21: STX_I	stx	%r1, [%r27 + 0x0000]
	.word 0xc2738010  ! 22: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc2738010  ! 23: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25fa000  ! 24: LDX_I	ldx	[%r30 + 0x0000], %r1
	.word 0xc2760010  ! 25: STX_R	stx	%r1, [%r24 + %r16]
	.word 0xc25bc010  ! 26: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25b8010  ! 27: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273a000  ! 28: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25ba000  ! 29: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25bc010  ! 30: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc277c010  ! 31: STX_R	stx	%r1, [%r31 + %r16]
	.word 0xc25be000  ! 32: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25fe000  ! 33: LDX_I	ldx	[%r31 + 0x0000], %r1
	.word 0xc273c010  ! 34: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273a000  ! 35: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc2762000  ! 36: STX_I	stx	%r1, [%r24 + 0x0000]
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc274e000  ! 38: STX_I	stx	%r1, [%r19 + 0x0000]
	.word 0xc25be000  ! 39: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25bc010  ! 40: LDX_R	ldx	[%r15 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_62:
	.word 0xc25b8010  ! 1: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25fa000  ! 2: LDX_I	ldx	[%r30 + 0x0000], %r1
	.word 0xc276c010  ! 3: STX_R	stx	%r1, [%r27 + %r16]
	.word 0xc25fa000  ! 4: LDX_I	ldx	[%r30 + 0x0000], %r1
	.word 0xc25b8010  ! 5: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25f6000  ! 6: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc277e000  ! 7: STX_I	stx	%r1, [%r31 + 0x0000]
	.word 0xc25bc010  ! 8: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273a000  ! 9: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273e000  ! 10: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25b8010  ! 11: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25b8010  ! 12: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273a000  ! 13: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc2738010  ! 14: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc277c010  ! 15: STX_R	stx	%r1, [%r31 + %r16]
	.word 0xc2738010  ! 16: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25be000  ! 17: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25be000  ! 18: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25be000  ! 19: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25be000  ! 20: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273e000  ! 21: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc273a000  ! 22: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273c010  ! 23: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25ba000  ! 24: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2738010  ! 25: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25b8010  ! 26: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25b8010  ! 27: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2738010  ! 28: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25be000  ! 29: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25dc010  ! 30: LDX_R	ldx	[%r23 + %r16], %r1
	.word 0xc2738010  ! 31: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25be000  ! 32: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25ba000  ! 33: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273a000  ! 34: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273a000  ! 35: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273a000  ! 36: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25ba000  ! 37: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2750010  ! 38: STX_R	stx	%r1, [%r20 + %r16]
	.word 0xc25ba000  ! 39: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25b8010  ! 40: LDX_R	ldx	[%r14 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_61:
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25bc010  ! 1: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25e2000  ! 2: LDX_I	ldx	[%r24 + 0x0000], %r1
	.word 0xc276a000  ! 3: STX_I	stx	%r1, [%r26 + 0x0000]
	.word 0xc25d6000  ! 4: LDX_I	ldx	[%r21 + 0x0000], %r1
	.word 0xc25b8010  ! 5: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25be000  ! 6: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc276e000  ! 7: STX_I	stx	%r1, [%r27 + 0x0000]
	.word 0xc25bc010  ! 8: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2764010  ! 9: STX_R	stx	%r1, [%r25 + %r16]
	.word 0xc273e000  ! 10: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25bc010  ! 11: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25bc010  ! 12: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2746000  ! 13: STX_I	stx	%r1, [%r17 + 0x0000]
	.word 0xc276a000  ! 14: STX_I	stx	%r1, [%r26 + 0x0000]
	.word 0xc2778010  ! 15: STX_R	stx	%r1, [%r30 + %r16]
	.word 0xc273c010  ! 16: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25ea000  ! 17: LDX_I	ldx	[%r26 + 0x0000], %r1
	.word 0xc25be000  ! 18: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25fa000  ! 19: LDX_I	ldx	[%r30 + 0x0000], %r1
	.word 0xc25be000  ! 20: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2766000  ! 21: STX_I	stx	%r1, [%r25 + 0x0000]
	.word 0xc2772000  ! 22: STX_I	stx	%r1, [%r28 + 0x0000]
	.word 0xc2738010  ! 23: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25e2000  ! 24: LDX_I	ldx	[%r24 + 0x0000], %r1
	.word 0xc2738010  ! 25: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25e0010  ! 26: LDX_R	ldx	[%r24 + %r16], %r1
	.word 0xc25b8010  ! 27: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273c010  ! 28: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25be000  ! 29: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25b8010  ! 30: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2738010  ! 31: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25be000  ! 32: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25ba000  ! 33: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2766000  ! 34: STX_I	stx	%r1, [%r25 + 0x0000]
	.word 0xc273c010  ! 35: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273c010  ! 36: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25be000  ! 37: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273e000  ! 38: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25ba000  ! 39: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25b8010  ! 40: LDX_R	ldx	[%r14 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_60:
	.word 0xc25bc010  ! 1: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25ba000  ! 2: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc274a000  ! 3: STX_I	stx	%r1, [%r18 + 0x0000]
	.word 0xc25ba000  ! 4: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25f8010  ! 5: LDX_R	ldx	[%r30 + %r16], %r1
	.word 0xc25be000  ! 6: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc275e000  ! 7: STX_I	stx	%r1, [%r23 + 0x0000]
	.word 0xc25bc010  ! 8: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273c010  ! 9: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc273e000  ! 10: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25bc010  ! 11: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25dc010  ! 12: LDX_R	ldx	[%r23 + %r16], %r1
	.word 0xc273e000  ! 13: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc273c010  ! 14: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273c010  ! 15: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc2738010  ! 16: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25be000  ! 17: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25e2000  ! 18: LDX_I	ldx	[%r24 + 0x0000], %r1
	.word 0xc25da000  ! 19: LDX_I	ldx	[%r22 + 0x0000], %r1
	.word 0xc25d2000  ! 20: LDX_I	ldx	[%r20 + 0x0000], %r1
	.word 0xc2738010  ! 21: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc274e000  ! 22: STX_I	stx	%r1, [%r19 + 0x0000]
	.word 0xc276e000  ! 23: STX_I	stx	%r1, [%r27 + 0x0000]
	.word 0xc25ba000  ! 24: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2738010  ! 25: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25c8010  ! 26: LDX_R	ldx	[%r18 + %r16], %r1
	.word 0xc25bc010  ! 27: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273e000  ! 28: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25ba000  ! 29: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25f8010  ! 30: LDX_R	ldx	[%r30 + %r16], %r1
	.word 0xc273a000  ! 31: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25ba000  ! 32: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25ce000  ! 33: LDX_I	ldx	[%r19 + 0x0000], %r1
	.word 0xc273a000  ! 34: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc2778010  ! 35: STX_R	stx	%r1, [%r30 + %r16]
	.word 0xc273c010  ! 36: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25de000  ! 37: LDX_I	ldx	[%r23 + 0x0000], %r1
	.word 0xc2758010  ! 38: STX_R	stx	%r1, [%r22 + %r16]
	.word 0xc25be000  ! 39: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25e0010  ! 40: LDX_R	ldx	[%r24 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_59:
	.word 0xc25b8010  ! 1: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25be000  ! 2: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc275c010  ! 3: STX_R	stx	%r1, [%r23 + %r16]
	.word 0xc25be000  ! 4: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25e4010  ! 5: LDX_R	ldx	[%r25 + %r16], %r1
	.word 0xc25e2000  ! 6: LDX_I	ldx	[%r24 + 0x0000], %r1
	.word 0xc273a000  ! 7: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25b8010  ! 8: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2776000  ! 9: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc273a000  ! 10: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25b8010  ! 11: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25bc010  ! 12: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc274e000  ! 13: STX_I	stx	%r1, [%r19 + 0x0000]
	.word 0xc2738010  ! 14: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc274c010  ! 15: STX_R	stx	%r1, [%r19 + %r16]
	.word 0xc273c010  ! 16: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25d6000  ! 17: LDX_I	ldx	[%r21 + 0x0000], %r1
	.word 0xc25be000  ! 18: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25ba000  ! 19: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25fe000  ! 20: LDX_I	ldx	[%r31 + 0x0000], %r1
	.word 0xc273a000  ! 21: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc276c010  ! 22: STX_R	stx	%r1, [%r27 + %r16]
	.word 0xc2738010  ! 23: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25be000  ! 24: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273e000  ! 25: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc25f4010  ! 27: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc273c010  ! 28: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25be000  ! 29: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25e8010  ! 30: LDX_R	ldx	[%r26 + %r16], %r1
	.word 0xc2738010  ! 31: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25be000  ! 32: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25ea000  ! 33: LDX_I	ldx	[%r26 + 0x0000], %r1
	.word 0xc2754010  ! 34: STX_R	stx	%r1, [%r21 + %r16]
	.word 0xc2750010  ! 35: STX_R	stx	%r1, [%r20 + %r16]
	.word 0xc273c010  ! 36: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25ba000  ! 37: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc277e000  ! 38: STX_I	stx	%r1, [%r31 + 0x0000]
	.word 0xc25be000  ! 39: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25b8010  ! 40: LDX_R	ldx	[%r14 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_58:
	.word 0xc25b8010  ! 1: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25da000  ! 2: LDX_I	ldx	[%r22 + 0x0000], %r1
	.word 0xc273a000  ! 3: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25ba000  ! 4: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25b8010  ! 5: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25e6000  ! 6: LDX_I	ldx	[%r25 + 0x0000], %r1
	.word 0xc2738010  ! 7: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25b8010  ! 8: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc2738010  ! 9: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc276c010  ! 10: STX_R	stx	%r1, [%r27 + %r16]
	.word 0xc25dc010  ! 11: LDX_R	ldx	[%r23 + %r16], %r1
	.word 0xc25bc010  ! 12: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2738010  ! 13: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc2738010  ! 14: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc2738010  ! 15: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273e000  ! 16: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25ba000  ! 17: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25be000  ! 18: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25ce000  ! 19: LDX_I	ldx	[%r19 + 0x0000], %r1
	.word 0xc25be000  ! 20: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273c010  ! 21: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc275e000  ! 22: STX_I	stx	%r1, [%r23 + 0x0000]
	.word 0xc2768010  ! 23: STX_R	stx	%r1, [%r26 + %r16]
	.word 0xc25fa000  ! 24: LDX_I	ldx	[%r30 + 0x0000], %r1
	.word 0xc273e000  ! 25: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25b8010  ! 26: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25e4010  ! 27: LDX_R	ldx	[%r25 + %r16], %r1
	.word 0xc2738010  ! 28: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25ca000  ! 29: LDX_I	ldx	[%r18 + 0x0000], %r1
	.word 0xc25b8010  ! 30: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc277e000  ! 31: STX_I	stx	%r1, [%r31 + 0x0000]
	.word 0xc25f2000  ! 32: LDX_I	ldx	[%r28 + 0x0000], %r1
	.word 0xc25be000  ! 33: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273c010  ! 34: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273e000  ! 35: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc273c010  ! 36: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25da000  ! 37: LDX_I	ldx	[%r22 + 0x0000], %r1
	.word 0xc2768010  ! 38: STX_R	stx	%r1, [%r26 + %r16]
	.word 0xc25ba000  ! 39: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25b8010  ! 40: LDX_R	ldx	[%r14 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_57:
	.word 0xc25fc010  ! 1: LDX_R	ldx	[%r31 + %r16], %r1
	.word 0xc25ea000  ! 2: LDX_I	ldx	[%r26 + 0x0000], %r1
	.word 0xc273c010  ! 3: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25be000  ! 4: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25bc010  ! 5: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25e2000  ! 6: LDX_I	ldx	[%r24 + 0x0000], %r1
	.word 0xc273a000  ! 7: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25f8010  ! 8: LDX_R	ldx	[%r30 + %r16], %r1
	.word 0xc2738010  ! 9: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273e000  ! 10: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25cc010  ! 11: LDX_R	ldx	[%r19 + %r16], %r1
	.word 0xc25d8010  ! 12: LDX_R	ldx	[%r22 + %r16], %r1
	.word 0xc273e000  ! 13: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc277e000  ! 14: STX_I	stx	%r1, [%r31 + 0x0000]
	.word 0xc2738010  ! 15: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273a000  ! 16: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25d6000  ! 17: LDX_I	ldx	[%r21 + 0x0000], %r1
	.word 0xc25ba000  ! 18: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25ca000  ! 19: LDX_I	ldx	[%r18 + 0x0000], %r1
	.word 0xc25ba000  ! 20: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273a000  ! 21: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273c010  ! 22: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273c010  ! 23: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25ba000  ! 24: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273e000  ! 25: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25dc010  ! 26: LDX_R	ldx	[%r23 + %r16], %r1
	.word 0xc25f4010  ! 27: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc2750010  ! 28: STX_R	stx	%r1, [%r20 + %r16]
	.word 0xc25ba000  ! 29: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25cc010  ! 30: LDX_R	ldx	[%r19 + %r16], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc273e000  ! 31: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25c6000  ! 32: LDX_I	ldx	[%r17 + 0x0000], %r1
	.word 0xc25be000  ! 33: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273c010  ! 34: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273e000  ! 35: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc2738010  ! 36: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25be000  ! 37: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273c010  ! 38: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25d2000  ! 39: LDX_I	ldx	[%r20 + 0x0000], %r1
	.word 0xc25bc010  ! 40: LDX_R	ldx	[%r15 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_56:
	.word 0xc25e0010  ! 1: LDX_R	ldx	[%r24 + %r16], %r1
	.word 0xc25ba000  ! 2: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc273c010  ! 3: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25be000  ! 4: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25bc010  ! 5: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25d6000  ! 6: LDX_I	ldx	[%r21 + 0x0000], %r1
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc273e000  ! 7: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25b8010  ! 8: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273e000  ! 9: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc273e000  ! 10: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25b8010  ! 11: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25bc010  ! 12: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273a000  ! 13: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273a000  ! 14: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273a000  ! 15: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273a000  ! 16: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25ea000  ! 17: LDX_I	ldx	[%r26 + 0x0000], %r1
	.word 0xc25d6000  ! 18: LDX_I	ldx	[%r21 + 0x0000], %r1
	.word 0xc25ba000  ! 19: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25ba000  ! 20: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2762000  ! 21: STX_I	stx	%r1, [%r24 + 0x0000]
	.word 0xc273c010  ! 22: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273c010  ! 23: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25ba000  ! 24: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc277c010  ! 25: STX_R	stx	%r1, [%r31 + %r16]
	.word 0xc25bc010  ! 26: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25d4010  ! 27: LDX_R	ldx	[%r21 + %r16], %r1
	.word 0xc2738010  ! 28: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25ba000  ! 29: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25e0010  ! 30: LDX_R	ldx	[%r24 + %r16], %r1
	.word 0xc273a000  ! 31: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25ba000  ! 32: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25be000  ! 33: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273c010  ! 34: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273e000  ! 35: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc273e000  ! 36: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25be000  ! 37: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273c010  ! 38: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25ca000  ! 39: LDX_I	ldx	[%r18 + 0x0000], %r1
	.word 0xc25bc010  ! 40: LDX_R	ldx	[%r15 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_55:
	.word 0xc25d8010  ! 1: LDX_R	ldx	[%r22 + %r16], %r1
	.word 0xc25be000  ! 2: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc275a000  ! 3: STX_I	stx	%r1, [%r22 + 0x0000]
	.word 0xc25d6000  ! 4: LDX_I	ldx	[%r21 + 0x0000], %r1
	.word 0xc25e8010  ! 5: LDX_R	ldx	[%r26 + %r16], %r1
	.word 0xc25ba000  ! 6: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2738010  ! 7: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25b8010  ! 8: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc2738010  ! 9: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273c010  ! 10: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25e4010  ! 11: LDX_R	ldx	[%r25 + %r16], %r1
	.word 0xc25dc010  ! 12: LDX_R	ldx	[%r23 + %r16], %r1
	.word 0xc2778010  ! 13: STX_R	stx	%r1, [%r30 + %r16]
	.word 0xc273c010  ! 14: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273e000  ! 15: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc2770010  ! 16: STX_R	stx	%r1, [%r28 + %r16]
	.word 0xc25ba000  ! 17: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25ba000  ! 18: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25ba000  ! 19: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25f6000  ! 20: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc273c010  ! 21: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc2738010  ! 22: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc2768010  ! 23: STX_R	stx	%r1, [%r26 + %r16]
	.word 0xc25be000  ! 24: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc2738010  ! 25: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25b8010  ! 26: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25fc010  ! 27: LDX_R	ldx	[%r31 + %r16], %r1
	.word 0xc275a000  ! 28: STX_I	stx	%r1, [%r22 + 0x0000]
	.word 0xc25be000  ! 29: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25b8010  ! 30: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273a000  ! 31: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25be000  ! 32: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25be000  ! 33: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2738010  ! 34: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273a000  ! 35: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273a000  ! 36: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25fa000  ! 37: LDX_I	ldx	[%r30 + 0x0000], %r1
	.word 0xc276a000  ! 38: STX_I	stx	%r1, [%r26 + 0x0000]
	.word 0xc25be000  ! 39: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25e8010  ! 40: LDX_R	ldx	[%r26 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_54:
	.word 0xc25bc010  ! 1: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25ca000  ! 2: LDX_I	ldx	[%r18 + 0x0000], %r1
	.word 0xc2756000  ! 3: STX_I	stx	%r1, [%r21 + 0x0000]
	.word 0xc25f6000  ! 4: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25bc010  ! 5: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25d6000  ! 6: LDX_I	ldx	[%r21 + 0x0000], %r1
	.word 0xc273e000  ! 7: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25ec010  ! 8: LDX_R	ldx	[%r27 + %r16], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc273c010  ! 9: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273e000  ! 10: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25b8010  ! 11: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25bc010  ! 12: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273e000  ! 13: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc2738010  ! 14: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc2738010  ! 15: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273c010  ! 16: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25ba000  ! 17: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25be000  ! 18: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25be000  ! 19: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25ba000  ! 20: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2738010  ! 21: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273a000  ! 22: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273a000  ! 23: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25de000  ! 24: LDX_I	ldx	[%r23 + 0x0000], %r1
	.word 0xc273e000  ! 25: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25bc010  ! 26: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25b8010  ! 27: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273c010  ! 28: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25ba000  ! 29: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25ec010  ! 30: LDX_R	ldx	[%r27 + %r16], %r1
	.word 0xc274c010  ! 31: STX_R	stx	%r1, [%r19 + %r16]
	.word 0xc25ce000  ! 32: LDX_I	ldx	[%r19 + 0x0000], %r1
	.word 0xc25ba000  ! 33: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2748010  ! 34: STX_R	stx	%r1, [%r18 + %r16]
	.word 0xc2738010  ! 35: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273a000  ! 36: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25ba000  ! 37: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273e000  ! 38: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25ba000  ! 39: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25b8010  ! 40: LDX_R	ldx	[%r14 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_53:
	.word 0xc25c8010  ! 1: LDX_R	ldx	[%r18 + %r16], %r1
	.word 0xc25be000  ! 2: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc277a000  ! 3: STX_I	stx	%r1, [%r30 + 0x0000]
	.word 0xc25ba000  ! 4: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25b8010  ! 5: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25e6000  ! 6: LDX_I	ldx	[%r25 + 0x0000], %r1
	.word 0xc273e000  ! 7: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25b8010  ! 8: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2738010  ! 9: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273e000  ! 10: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25bc010  ! 11: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25b8010  ! 12: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc2738010  ! 13: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273e000  ! 14: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc2738010  ! 15: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273a000  ! 16: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25be000  ! 17: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25ba000  ! 18: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25ca000  ! 19: LDX_I	ldx	[%r18 + 0x0000], %r1
	.word 0xc25be000  ! 20: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273e000  ! 21: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc273e000  ! 22: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc2776000  ! 23: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25be000  ! 24: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2758010  ! 25: STX_R	stx	%r1, [%r22 + %r16]
	.word 0xc25bc010  ! 26: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25e8010  ! 27: LDX_R	ldx	[%r26 + %r16], %r1
	.word 0xc273a000  ! 28: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25fa000  ! 29: LDX_I	ldx	[%r30 + 0x0000], %r1
	.word 0xc25f4010  ! 30: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc273e000  ! 31: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25fa000  ! 32: LDX_I	ldx	[%r30 + 0x0000], %r1
	.word 0xc25be000  ! 33: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2776000  ! 34: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc274c010  ! 35: STX_R	stx	%r1, [%r19 + %r16]
	.word 0xc273a000  ! 36: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25d6000  ! 37: LDX_I	ldx	[%r21 + 0x0000], %r1
	.word 0xc273a000  ! 38: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25ba000  ! 39: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25b8010  ! 40: LDX_R	ldx	[%r14 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_52:
	.word 0xc25bc010  ! 1: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25ba000  ! 2: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2738010  ! 3: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25be000  ! 4: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25bc010  ! 5: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25f6000  ! 6: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc2750010  ! 7: STX_R	stx	%r1, [%r20 + %r16]
	.word 0xc25d8010  ! 8: LDX_R	ldx	[%r22 + %r16], %r1
	.word 0xc273c010  ! 9: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273a000  ! 10: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25b8010  ! 11: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25e8010  ! 12: LDX_R	ldx	[%r26 + %r16], %r1
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc2738010  ! 13: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273c010  ! 14: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc2738010  ! 15: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273e000  ! 16: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25ba000  ! 17: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25e6000  ! 18: LDX_I	ldx	[%r25 + 0x0000], %r1
	.word 0xc25d6000  ! 19: LDX_I	ldx	[%r21 + 0x0000], %r1
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc25d2000  ! 20: LDX_I	ldx	[%r20 + 0x0000], %r1
	.word 0xc2738010  ! 21: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc275e000  ! 22: STX_I	stx	%r1, [%r23 + 0x0000]
	.word 0xc2778010  ! 23: STX_R	stx	%r1, [%r30 + %r16]
	.word 0xc25be000  ! 24: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2764010  ! 25: STX_R	stx	%r1, [%r25 + %r16]
	.word 0xc25f8010  ! 26: LDX_R	ldx	[%r30 + %r16], %r1
	.word 0xc25b8010  ! 27: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2770010  ! 28: STX_R	stx	%r1, [%r28 + %r16]
	.word 0xc25be000  ! 29: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25b8010  ! 30: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273e000  ! 31: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25ce000  ! 32: LDX_I	ldx	[%r19 + 0x0000], %r1
	.word 0xc25ba000  ! 33: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273c010  ! 34: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273e000  ! 35: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc2778010  ! 36: STX_R	stx	%r1, [%r30 + %r16]
	.word 0xc25ba000  ! 37: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2770010  ! 38: STX_R	stx	%r1, [%r28 + %r16]
	.word 0xc25c6000  ! 39: LDX_I	ldx	[%r17 + 0x0000], %r1
	.word 0xc25bc010  ! 40: LDX_R	ldx	[%r15 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_51:
	.word 0xc25bc010  ! 1: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25be000  ! 2: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273e000  ! 3: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25be000  ! 4: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25b8010  ! 5: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25ba000  ! 6: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc277c010  ! 7: STX_R	stx	%r1, [%r31 + %r16]
	.word 0xc25bc010  ! 8: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc275c010  ! 9: STX_R	stx	%r1, [%r23 + %r16]
	.word 0xc2776000  ! 10: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25f8010  ! 11: LDX_R	ldx	[%r30 + %r16], %r1
	.word 0xc25d8010  ! 12: LDX_R	ldx	[%r22 + %r16], %r1
	.word 0xc273c010  ! 13: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc2760010  ! 14: STX_R	stx	%r1, [%r24 + %r16]
	.word 0xc273e000  ! 15: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc273c010  ! 16: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25de000  ! 17: LDX_I	ldx	[%r23 + 0x0000], %r1
	.word 0xc25fa000  ! 18: LDX_I	ldx	[%r30 + 0x0000], %r1
	.word 0xc25f2000  ! 19: LDX_I	ldx	[%r28 + 0x0000], %r1
	.word 0xc25be000  ! 20: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2738010  ! 21: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc2738010  ! 22: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc2738010  ! 23: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25be000  ! 24: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273c010  ! 25: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25bc010  ! 26: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25e0010  ! 27: LDX_R	ldx	[%r24 + %r16], %r1
	.word 0xc273a000  ! 28: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25da000  ! 29: LDX_I	ldx	[%r22 + 0x0000], %r1
	.word 0xc25bc010  ! 30: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2770010  ! 31: STX_R	stx	%r1, [%r28 + %r16]
	.word 0xc25ba000  ! 32: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25de000  ! 33: LDX_I	ldx	[%r23 + 0x0000], %r1
	.word 0xc2738010  ! 34: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc275c010  ! 35: STX_R	stx	%r1, [%r23 + %r16]
	.word 0xc273c010  ! 36: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25d2000  ! 37: LDX_I	ldx	[%r20 + 0x0000], %r1
	.word 0xc273c010  ! 38: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25d2000  ! 39: LDX_I	ldx	[%r20 + 0x0000], %r1
	.word 0xc25bc010  ! 40: LDX_R	ldx	[%r15 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_50:
	.word 0xc25c8010  ! 1: LDX_R	ldx	[%r18 + %r16], %r1
	.word 0xc25be000  ! 2: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2738010  ! 3: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25ba000  ! 4: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25d8010  ! 5: LDX_R	ldx	[%r22 + %r16], %r1
	.word 0xc25e2000  ! 6: LDX_I	ldx	[%r24 + 0x0000], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc273c010  ! 7: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25bc010  ! 8: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc2738010  ! 9: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273a000  ! 10: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25b8010  ! 11: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25b8010  ! 12: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273a000  ! 13: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc274c010  ! 14: STX_R	stx	%r1, [%r19 + %r16]
	.word 0xc273a000  ! 15: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc274e000  ! 16: STX_I	stx	%r1, [%r19 + 0x0000]
	.word 0xc25ea000  ! 17: LDX_I	ldx	[%r26 + 0x0000], %r1
	.word 0xc25be000  ! 18: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25de000  ! 19: LDX_I	ldx	[%r23 + 0x0000], %r1
	.word 0xc25be000  ! 20: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2746000  ! 21: STX_I	stx	%r1, [%r17 + 0x0000]
	.word 0xc277e000  ! 22: STX_I	stx	%r1, [%r31 + 0x0000]
	.word 0xc2738010  ! 23: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25ba000  ! 24: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc276c010  ! 25: STX_R	stx	%r1, [%r27 + %r16]
	.word 0xc25bc010  ! 26: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25b8010  ! 27: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2738010  ! 28: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25ba000  ! 29: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25f4010  ! 30: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc2764010  ! 31: STX_R	stx	%r1, [%r25 + %r16]
	.word 0xc25ba000  ! 32: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25be000  ! 33: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273c010  ! 34: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc276e000  ! 35: STX_I	stx	%r1, [%r27 + 0x0000]
	.word 0xc277e000  ! 36: STX_I	stx	%r1, [%r31 + 0x0000]
	.word 0xc25be000  ! 37: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273c010  ! 38: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25be000  ! 39: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25f0010  ! 40: LDX_R	ldx	[%r28 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_49:
	.word 0xc25b8010  ! 1: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25fa000  ! 2: LDX_I	ldx	[%r30 + 0x0000], %r1
	.word 0xc2738010  ! 3: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25ee000  ! 4: LDX_I	ldx	[%r27 + 0x0000], %r1
	.word 0xc25c4010  ! 5: LDX_R	ldx	[%r17 + %r16], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25be000  ! 6: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273a000  ! 7: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc25e8010  ! 8: LDX_R	ldx	[%r26 + %r16], %r1
	.word 0xc2770010  ! 9: STX_R	stx	%r1, [%r28 + %r16]
	.word 0xc273c010  ! 10: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25bc010  ! 11: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25b8010  ! 12: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273a000  ! 13: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273a000  ! 14: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273a000  ! 15: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273c010  ! 16: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25be000  ! 17: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25be000  ! 18: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25ba000  ! 19: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25be000  ! 20: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2738010  ! 21: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc2738010  ! 22: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273c010  ! 23: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25ba000  ! 24: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2760010  ! 25: STX_R	stx	%r1, [%r24 + %r16]
	.word 0xc25bc010  ! 26: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25e8010  ! 27: LDX_R	ldx	[%r26 + %r16], %r1
	.word 0xc273c010  ! 28: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25ba000  ! 29: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25b8010  ! 30: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc277c010  ! 31: STX_R	stx	%r1, [%r31 + %r16]
	.word 0xc25ba000  ! 32: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25c6000  ! 33: LDX_I	ldx	[%r17 + 0x0000], %r1
	.word 0xc273e000  ! 34: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc2738010  ! 35: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25be000  ! 37: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273a000  ! 38: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25be000  ! 39: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25bc010  ! 40: LDX_R	ldx	[%r15 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_48:
	.word 0xc25e4010  ! 1: LDX_R	ldx	[%r25 + %r16], %r1
	.word 0xc25be000  ! 2: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc273c010  ! 3: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25e2000  ! 4: LDX_I	ldx	[%r24 + 0x0000], %r1
	.word 0xc25bc010  ! 5: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25e2000  ! 6: LDX_I	ldx	[%r24 + 0x0000], %r1
	.word 0xc273e000  ! 7: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25c4010  ! 8: LDX_R	ldx	[%r17 + %r16], %r1
	.word 0xc273e000  ! 9: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc2738010  ! 10: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25f4010  ! 11: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc25b8010  ! 12: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2772000  ! 13: STX_I	stx	%r1, [%r28 + 0x0000]
	.word 0xc2738010  ! 14: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273a000  ! 15: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc2778010  ! 16: STX_R	stx	%r1, [%r30 + %r16]
	.word 0xc25ba000  ! 17: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25ba000  ! 18: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25be000  ! 19: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25e2000  ! 20: LDX_I	ldx	[%r24 + 0x0000], %r1
	.word 0xc2738010  ! 21: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273e000  ! 22: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc2752000  ! 23: STX_I	stx	%r1, [%r20 + 0x0000]
	.word 0xc25be000  ! 24: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2758010  ! 25: STX_R	stx	%r1, [%r22 + %r16]
	.word 0xc25bc010  ! 26: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25b8010  ! 27: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc274a000  ! 28: STX_I	stx	%r1, [%r18 + 0x0000]
	.word 0xc25be000  ! 29: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25d4010  ! 30: LDX_R	ldx	[%r21 + %r16], %r1
	.word 0xc273c010  ! 31: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25be000  ! 32: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25ba000  ! 33: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273a000  ! 34: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc277a000  ! 35: STX_I	stx	%r1, [%r30 + 0x0000]
	.word 0xc273e000  ! 36: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25e6000  ! 37: LDX_I	ldx	[%r25 + 0x0000], %r1
	.word 0xc273c010  ! 38: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25da000  ! 39: LDX_I	ldx	[%r22 + 0x0000], %r1
	.word 0xc25bc010  ! 40: LDX_R	ldx	[%r15 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_47:
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc25bc010  ! 1: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25d6000  ! 2: LDX_I	ldx	[%r21 + 0x0000], %r1
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc273e000  ! 3: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25be000  ! 4: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25e8010  ! 5: LDX_R	ldx	[%r26 + %r16], %r1
	.word 0xc25ba000  ! 6: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273e000  ! 7: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25c8010  ! 8: LDX_R	ldx	[%r18 + %r16], %r1
	.word 0xc276e000  ! 9: STX_I	stx	%r1, [%r27 + 0x0000]
	.word 0xc2776000  ! 10: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25ec010  ! 11: LDX_R	ldx	[%r27 + %r16], %r1
	.word 0xc25b8010  ! 12: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273e000  ! 13: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc2750010  ! 14: STX_R	stx	%r1, [%r20 + %r16]
	.word 0xc273c010  ! 15: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc2760010  ! 16: STX_R	stx	%r1, [%r24 + %r16]
	.word 0xc25be000  ! 17: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25ba000  ! 18: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25f2000  ! 19: LDX_I	ldx	[%r28 + 0x0000], %r1
	.word 0xc25fe000  ! 20: LDX_I	ldx	[%r31 + 0x0000], %r1
	.word 0xc2762000  ! 21: STX_I	stx	%r1, [%r24 + 0x0000]
	.word 0xc273e000  ! 22: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc273e000  ! 23: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25ba000  ! 24: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273e000  ! 25: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25ec010  ! 26: LDX_R	ldx	[%r27 + %r16], %r1
	.word 0xc25b8010  ! 27: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2738010  ! 28: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25ba000  ! 29: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25b8010  ! 30: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2750010  ! 31: STX_R	stx	%r1, [%r20 + %r16]
	.word 0xc25be000  ! 32: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25ba000  ! 33: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2738010  ! 34: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273c010  ! 35: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc2750010  ! 36: STX_R	stx	%r1, [%r20 + %r16]
	.word 0xc25fa000  ! 37: LDX_I	ldx	[%r30 + 0x0000], %r1
	.word 0xc273c010  ! 38: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25d6000  ! 39: LDX_I	ldx	[%r21 + 0x0000], %r1
	.word 0xc25f4010  ! 40: LDX_R	ldx	[%r29 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_46:
	.word 0xc25b8010  ! 1: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25e6000  ! 2: LDX_I	ldx	[%r25 + 0x0000], %r1
	.word 0xc276e000  ! 3: STX_I	stx	%r1, [%r27 + 0x0000]
	.word 0xc25da000  ! 4: LDX_I	ldx	[%r22 + 0x0000], %r1
	.word 0xc25b8010  ! 5: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25ba000  ! 6: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2746000  ! 7: STX_I	stx	%r1, [%r17 + 0x0000]
	.word 0xc25bc010  ! 8: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc273e000  ! 9: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc2760010  ! 10: STX_R	stx	%r1, [%r24 + %r16]
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc25bc010  ! 11: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25f0010  ! 12: LDX_R	ldx	[%r28 + %r16], %r1
	.word 0xc273e000  ! 13: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc273a000  ! 14: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273c010  ! 15: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273a000  ! 16: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25ba000  ! 17: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25be000  ! 18: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25ce000  ! 19: LDX_I	ldx	[%r19 + 0x0000], %r1
	.word 0xc25be000  ! 20: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2762000  ! 21: STX_I	stx	%r1, [%r24 + 0x0000]
	.word 0xc2774010  ! 22: STX_R	stx	%r1, [%r29 + %r16]
	.word 0xc275e000  ! 23: STX_I	stx	%r1, [%r23 + 0x0000]
	.word 0xc25be000  ! 24: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2738010  ! 25: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25cc010  ! 26: LDX_R	ldx	[%r19 + %r16], %r1
	.word 0xc25b8010  ! 27: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2772000  ! 28: STX_I	stx	%r1, [%r28 + 0x0000]
	.word 0xc25d6000  ! 29: LDX_I	ldx	[%r21 + 0x0000], %r1
	.word 0xc25b8010  ! 30: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2738010  ! 31: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25ba000  ! 32: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25ba000  ! 33: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2738010  ! 34: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273c010  ! 35: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc2738010  ! 36: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25be000  ! 37: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273e000  ! 38: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25da000  ! 39: LDX_I	ldx	[%r22 + 0x0000], %r1
	.word 0xc25bc010  ! 40: LDX_R	ldx	[%r15 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_45:
	.word 0xc25b8010  ! 1: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25ba000  ! 2: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc277c010  ! 3: STX_R	stx	%r1, [%r31 + %r16]
	.word 0xc25ee000  ! 4: LDX_I	ldx	[%r27 + 0x0000], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25bc010  ! 5: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25be000  ! 6: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc273c010  ! 7: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25b8010  ! 8: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc2738010  ! 9: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273c010  ! 10: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25e0010  ! 11: LDX_R	ldx	[%r24 + %r16], %r1
	.word 0xc25bc010  ! 12: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2762000  ! 13: STX_I	stx	%r1, [%r24 + 0x0000]
	.word 0xc273e000  ! 14: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc273a000  ! 15: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc274a000  ! 16: STX_I	stx	%r1, [%r18 + 0x0000]
	.word 0xc25be000  ! 17: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25ce000  ! 18: LDX_I	ldx	[%r19 + 0x0000], %r1
	.word 0xc25f2000  ! 19: LDX_I	ldx	[%r28 + 0x0000], %r1
	.word 0xc25ba000  ! 20: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc277e000  ! 21: STX_I	stx	%r1, [%r31 + 0x0000]
	.word 0xc273c010  ! 22: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc2762000  ! 23: STX_I	stx	%r1, [%r24 + 0x0000]
	.word 0xc25be000  ! 24: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2778010  ! 25: STX_R	stx	%r1, [%r30 + %r16]
	.word 0xc25bc010  ! 26: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25b8010  ! 27: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273a000  ! 28: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25be000  ! 29: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25f8010  ! 30: LDX_R	ldx	[%r30 + %r16], %r1
	.word 0xc273c010  ! 31: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25ba000  ! 32: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25da000  ! 33: LDX_I	ldx	[%r22 + 0x0000], %r1
	.word 0xc273e000  ! 34: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc273c010  ! 35: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc2774010  ! 36: STX_R	stx	%r1, [%r29 + %r16]
	.word 0xc25be000  ! 37: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2738010  ! 38: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25be000  ! 39: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25f4010  ! 40: LDX_R	ldx	[%r29 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_44:
	.word 0xc25c4010  ! 1: LDX_R	ldx	[%r17 + %r16], %r1
	.word 0xc25ba000  ! 2: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc273c010  ! 3: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25e6000  ! 4: LDX_I	ldx	[%r25 + 0x0000], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25bc010  ! 5: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc25ba000  ! 6: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273e000  ! 7: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25b8010  ! 8: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273e000  ! 9: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc2746000  ! 10: STX_I	stx	%r1, [%r17 + 0x0000]
	.word 0xc25e4010  ! 11: LDX_R	ldx	[%r25 + %r16], %r1
	.word 0xc25b8010  ! 12: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273e000  ! 13: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc273c010  ! 14: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273a000  ! 15: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273e000  ! 16: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25be000  ! 17: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25be000  ! 18: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25c6000  ! 19: LDX_I	ldx	[%r17 + 0x0000], %r1
	.word 0xc25be000  ! 20: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273e000  ! 21: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc274e000  ! 22: STX_I	stx	%r1, [%r19 + 0x0000]
	.word 0xc273c010  ! 23: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25ba000  ! 24: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273e000  ! 25: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25bc010  ! 26: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25b8010  ! 27: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273e000  ! 28: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25ba000  ! 29: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25bc010  ! 30: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2738010  ! 31: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25ba000  ! 32: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25be000  ! 33: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2738010  ! 34: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc2774010  ! 35: STX_R	stx	%r1, [%r29 + %r16]
	.word 0xc273a000  ! 36: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25be000  ! 37: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2768010  ! 38: STX_R	stx	%r1, [%r26 + %r16]
	.word 0xc25ba000  ! 39: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25b8010  ! 40: LDX_R	ldx	[%r14 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_43:
	.word 0xc25b8010  ! 1: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25ce000  ! 2: LDX_I	ldx	[%r19 + 0x0000], %r1
	.word 0xc2758010  ! 3: STX_R	stx	%r1, [%r22 + %r16]
	.word 0xc25fe000  ! 4: LDX_I	ldx	[%r31 + 0x0000], %r1
	.word 0xc25cc010  ! 5: LDX_R	ldx	[%r19 + %r16], %r1
	.word 0xc25be000  ! 6: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273a000  ! 7: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25bc010  ! 8: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2738010  ! 9: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273e000  ! 10: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25b8010  ! 11: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25bc010  ! 12: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273c010  ! 13: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc2738010  ! 14: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc2738010  ! 15: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc2738010  ! 16: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25be000  ! 17: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25be000  ! 18: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25e2000  ! 19: LDX_I	ldx	[%r24 + 0x0000], %r1
	.word 0xc25be000  ! 20: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2748010  ! 21: STX_R	stx	%r1, [%r18 + %r16]
	.word 0xc273c010  ! 22: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273e000  ! 23: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25de000  ! 24: LDX_I	ldx	[%r23 + 0x0000], %r1
	.word 0xc2748010  ! 25: STX_R	stx	%r1, [%r18 + %r16]
	.word 0xc25b8010  ! 26: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25d8010  ! 27: LDX_R	ldx	[%r22 + %r16], %r1
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc2738010  ! 28: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25ba000  ! 29: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25bc010  ! 30: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc2738010  ! 31: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25be000  ! 32: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25ee000  ! 33: LDX_I	ldx	[%r27 + 0x0000], %r1
	.word 0xc277c010  ! 34: STX_R	stx	%r1, [%r31 + %r16]
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc2778010  ! 35: STX_R	stx	%r1, [%r30 + %r16]
	.word 0xc2738010  ! 36: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25fa000  ! 37: LDX_I	ldx	[%r30 + 0x0000], %r1
	.word 0xc273c010  ! 38: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25ba000  ! 39: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25bc010  ! 40: LDX_R	ldx	[%r15 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_42:
	.word 0xc25f4010  ! 1: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc25fe000  ! 2: LDX_I	ldx	[%r31 + 0x0000], %r1
	.word 0xc2750010  ! 3: STX_R	stx	%r1, [%r20 + %r16]
	.word 0xc25d2000  ! 4: LDX_I	ldx	[%r20 + 0x0000], %r1
	.word 0xc25b8010  ! 5: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25d6000  ! 6: LDX_I	ldx	[%r21 + 0x0000], %r1
	.word 0xc273c010  ! 7: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25b8010  ! 8: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc276e000  ! 9: STX_I	stx	%r1, [%r27 + 0x0000]
	.word 0xc2738010  ! 10: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25bc010  ! 11: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25cc010  ! 12: LDX_R	ldx	[%r19 + %r16], %r1
	.word 0xc273e000  ! 13: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc273a000  ! 14: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273a000  ! 15: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc2776000  ! 16: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc25f6000  ! 17: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25be000  ! 18: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25ba000  ! 19: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25be000  ! 20: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc273a000  ! 21: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc275a000  ! 22: STX_I	stx	%r1, [%r22 + 0x0000]
	.word 0xc2752000  ! 23: STX_I	stx	%r1, [%r20 + 0x0000]
	.word 0xc25be000  ! 24: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc273c010  ! 25: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25b8010  ! 26: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25fc010  ! 27: LDX_R	ldx	[%r31 + %r16], %r1
	.word 0xc2748010  ! 28: STX_R	stx	%r1, [%r18 + %r16]
	.word 0xc25be000  ! 29: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25bc010  ! 30: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273c010  ! 31: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25be000  ! 32: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25ba000  ! 33: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc274e000  ! 34: STX_I	stx	%r1, [%r19 + 0x0000]
	.word 0xc273e000  ! 35: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc273a000  ! 36: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25fa000  ! 37: LDX_I	ldx	[%r30 + 0x0000], %r1
	.word 0xc2738010  ! 38: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25c6000  ! 39: LDX_I	ldx	[%r17 + 0x0000], %r1
	.word 0xc25b8010  ! 40: LDX_R	ldx	[%r14 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_41:
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25bc010  ! 1: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25ba000  ! 2: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273e000  ! 3: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25ba000  ! 4: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25d8010  ! 5: LDX_R	ldx	[%r22 + %r16], %r1
	.word 0xc25ba000  ! 6: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273c010  ! 7: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25b8010  ! 8: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2776000  ! 9: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc273c010  ! 10: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25bc010  ! 11: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25fc010  ! 12: LDX_R	ldx	[%r31 + %r16], %r1
	.word 0xc275e000  ! 13: STX_I	stx	%r1, [%r23 + 0x0000]
	.word 0xc2772000  ! 14: STX_I	stx	%r1, [%r28 + 0x0000]
	.word 0xc273c010  ! 15: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc2776000  ! 16: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25ba000  ! 17: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25ba000  ! 18: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25be000  ! 19: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25ca000  ! 20: LDX_I	ldx	[%r18 + 0x0000], %r1
	.word 0xc273e000  ! 21: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc2738010  ! 22: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273c010  ! 23: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25fe000  ! 24: LDX_I	ldx	[%r31 + 0x0000], %r1
	.word 0xc2738010  ! 25: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25b8010  ! 26: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25b8010  ! 27: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2754010  ! 28: STX_R	stx	%r1, [%r21 + %r16]
	.word 0xc25fa000  ! 29: LDX_I	ldx	[%r30 + 0x0000], %r1
	.word 0xc25b8010  ! 30: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273a000  ! 31: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25ee000  ! 32: LDX_I	ldx	[%r27 + 0x0000], %r1
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc25be000  ! 33: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273a000  ! 34: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc2776000  ! 35: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc2738010  ! 36: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25da000  ! 37: LDX_I	ldx	[%r22 + 0x0000], %r1
	.word 0xc273e000  ! 38: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25da000  ! 39: LDX_I	ldx	[%r22 + 0x0000], %r1
	.word 0xc25bc010  ! 40: LDX_R	ldx	[%r15 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_40:
	.word 0xc25fc010  ! 1: LDX_R	ldx	[%r31 + %r16], %r1
	.word 0xc25ca000  ! 2: LDX_I	ldx	[%r18 + 0x0000], %r1
	.word 0xc2758010  ! 3: STX_R	stx	%r1, [%r22 + %r16]
	.word 0xc25be000  ! 4: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25d0010  ! 5: LDX_R	ldx	[%r20 + %r16], %r1
	.word 0xc25be000  ! 6: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2738010  ! 7: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25bc010  ! 8: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc2738010  ! 9: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273a000  ! 10: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25bc010  ! 11: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25b8010  ! 12: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273a000  ! 13: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc275a000  ! 14: STX_I	stx	%r1, [%r22 + 0x0000]
	.word 0xc2768010  ! 15: STX_R	stx	%r1, [%r26 + %r16]
	.word 0xc273a000  ! 16: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25ba000  ! 17: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25ba000  ! 18: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25ba000  ! 19: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25ca000  ! 20: LDX_I	ldx	[%r18 + 0x0000], %r1
	.word 0xc273c010  ! 21: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273a000  ! 22: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273c010  ! 23: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25ba000  ! 24: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273c010  ! 25: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25b8010  ! 26: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25bc010  ! 27: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2748010  ! 28: STX_R	stx	%r1, [%r18 + %r16]
	.word 0xc25ba000  ! 29: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25b8010  ! 30: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc275a000  ! 31: STX_I	stx	%r1, [%r22 + 0x0000]
	.word 0xc25ca000  ! 32: LDX_I	ldx	[%r18 + 0x0000], %r1
	.word 0xc25ba000  ! 33: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2738010  ! 34: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc2756000  ! 35: STX_I	stx	%r1, [%r21 + 0x0000]
	.word 0xc273a000  ! 36: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25e2000  ! 37: LDX_I	ldx	[%r24 + 0x0000], %r1
	.word 0xc2738010  ! 38: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25da000  ! 39: LDX_I	ldx	[%r22 + 0x0000], %r1
	.word 0xc25b8010  ! 40: LDX_R	ldx	[%r14 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_39:
	.word 0xc25bc010  ! 1: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25f6000  ! 2: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc2764010  ! 3: STX_R	stx	%r1, [%r25 + %r16]
	.word 0xc25fe000  ! 4: LDX_I	ldx	[%r31 + 0x0000], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25bc010  ! 5: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25ee000  ! 6: LDX_I	ldx	[%r27 + 0x0000], %r1
	.word 0xc2752000  ! 7: STX_I	stx	%r1, [%r20 + 0x0000]
	.word 0xc25b8010  ! 8: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273e000  ! 9: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc273c010  ! 10: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25bc010  ! 11: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25bc010  ! 12: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273a000  ! 13: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc273e000  ! 14: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc273c010  ! 15: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273a000  ! 16: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25ba000  ! 17: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25be000  ! 18: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25de000  ! 19: LDX_I	ldx	[%r23 + 0x0000], %r1
	.word 0xc25be000  ! 20: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273c010  ! 21: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273c010  ! 22: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc275c010  ! 23: STX_R	stx	%r1, [%r23 + %r16]
	.word 0xc25ba000  ! 24: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273e000  ! 25: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25b8010  ! 26: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25bc010  ! 27: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273c010  ! 28: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25be000  ! 29: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25bc010  ! 30: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2738010  ! 31: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25ba000  ! 32: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25ba000  ! 33: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2772000  ! 34: STX_I	stx	%r1, [%r28 + 0x0000]
	.word 0xc273a000  ! 35: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc2766000  ! 36: STX_I	stx	%r1, [%r25 + 0x0000]
	.word 0xc25be000  ! 37: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2738010  ! 38: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25be000  ! 39: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25b8010  ! 40: LDX_R	ldx	[%r14 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_38:
	.word 0xc25e4010  ! 1: LDX_R	ldx	[%r25 + %r16], %r1
	.word 0xc25ce000  ! 2: LDX_I	ldx	[%r19 + 0x0000], %r1
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc273c010  ! 3: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25be000  ! 4: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25bc010  ! 5: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25ba000  ! 6: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273c010  ! 7: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25cc010  ! 8: LDX_R	ldx	[%r19 + %r16], %r1
	.word 0xc273a000  ! 9: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc2738010  ! 10: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc25d8010  ! 11: LDX_R	ldx	[%r22 + %r16], %r1
	.word 0xc25b8010  ! 12: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273e000  ! 13: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc2738010  ! 14: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc274a000  ! 15: STX_I	stx	%r1, [%r18 + 0x0000]
	.word 0xc273c010  ! 16: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25ba000  ! 17: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25e6000  ! 18: LDX_I	ldx	[%r25 + 0x0000], %r1
	.word 0xc25ba000  ! 19: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25ba000  ! 20: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2738010  ! 21: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc2750010  ! 22: STX_R	stx	%r1, [%r20 + %r16]
	.word 0xc273e000  ! 23: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25be000  ! 24: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273e000  ! 25: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25bc010  ! 26: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25bc010  ! 27: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2738010  ! 28: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25ee000  ! 29: LDX_I	ldx	[%r27 + 0x0000], %r1
	.word 0xc25e8010  ! 30: LDX_R	ldx	[%r26 + %r16], %r1
	.word 0xc2746000  ! 31: STX_I	stx	%r1, [%r17 + 0x0000]
	.word 0xc25d6000  ! 32: LDX_I	ldx	[%r21 + 0x0000], %r1
	.word 0xc25be000  ! 33: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273e000  ! 34: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc273c010  ! 35: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273e000  ! 36: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25ba000  ! 37: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273a000  ! 38: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25be000  ! 39: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25f0010  ! 40: LDX_R	ldx	[%r28 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_37:
	.word 0xc25bc010  ! 1: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25be000  ! 2: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273c010  ! 3: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25ca000  ! 4: LDX_I	ldx	[%r18 + 0x0000], %r1
	.word 0xc25bc010  ! 5: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25be000  ! 6: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273c010  ! 7: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25bc010  ! 8: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc2738010  ! 9: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273e000  ! 10: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25d4010  ! 11: LDX_R	ldx	[%r21 + %r16], %r1
	.word 0xc25b8010  ! 12: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273a000  ! 13: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc2770010  ! 14: STX_R	stx	%r1, [%r28 + %r16]
	.word 0xc2754010  ! 15: STX_R	stx	%r1, [%r21 + %r16]
	.word 0xc273c010  ! 16: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25ba000  ! 17: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25be000  ! 18: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc25d6000  ! 19: LDX_I	ldx	[%r21 + 0x0000], %r1
	.word 0xc25ba000  ! 20: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273a000  ! 21: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273a000  ! 22: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273e000  ! 23: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25e6000  ! 24: LDX_I	ldx	[%r25 + 0x0000], %r1
	.word 0xc273e000  ! 25: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25fc010  ! 26: LDX_R	ldx	[%r31 + %r16], %r1
	.word 0xc25b8010  ! 27: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc274c010  ! 28: STX_R	stx	%r1, [%r19 + %r16]
	.word 0xc25ba000  ! 29: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25e0010  ! 30: LDX_R	ldx	[%r24 + %r16], %r1
	.word 0xc273e000  ! 31: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25ba000  ! 32: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25ba000  ! 33: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc276e000  ! 34: STX_I	stx	%r1, [%r27 + 0x0000]
	.word 0xc273e000  ! 35: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc2748010  ! 36: STX_R	stx	%r1, [%r18 + %r16]
	.word 0xc25de000  ! 37: LDX_I	ldx	[%r23 + 0x0000], %r1
	.word 0xc276a000  ! 38: STX_I	stx	%r1, [%r26 + 0x0000]
	.word 0xc25e2000  ! 39: LDX_I	ldx	[%r24 + 0x0000], %r1
	.word 0xc25e0010  ! 40: LDX_R	ldx	[%r24 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_36:
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25b8010  ! 1: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25be000  ! 2: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2738010  ! 3: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25be000  ! 4: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25b8010  ! 5: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25f2000  ! 6: LDX_I	ldx	[%r28 + 0x0000], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc2738010  ! 7: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25d4010  ! 8: LDX_R	ldx	[%r21 + %r16], %r1
	.word 0xc2738010  ! 9: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc277a000  ! 10: STX_I	stx	%r1, [%r30 + 0x0000]
	.word 0xc25b8010  ! 11: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25d0010  ! 12: LDX_R	ldx	[%r20 + %r16], %r1
	.word 0xc2776000  ! 13: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc2776000  ! 14: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc2756000  ! 15: STX_I	stx	%r1, [%r21 + 0x0000]
	.word 0xc2738010  ! 16: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25be000  ! 17: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25ba000  ! 18: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25ba000  ! 19: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25ba000  ! 20: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273e000  ! 21: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc2748010  ! 22: STX_R	stx	%r1, [%r18 + %r16]
	.word 0xc273e000  ! 23: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25be000  ! 24: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2738010  ! 25: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25f8010  ! 26: LDX_R	ldx	[%r30 + %r16], %r1
	.word 0xc25c8010  ! 27: LDX_R	ldx	[%r18 + %r16], %r1
	.word 0xc273a000  ! 28: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25be000  ! 29: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25bc010  ! 30: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273e000  ! 31: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25ba000  ! 32: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25d6000  ! 33: LDX_I	ldx	[%r21 + 0x0000], %r1
	.word 0xc273e000  ! 34: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc273e000  ! 35: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25de000  ! 37: LDX_I	ldx	[%r23 + 0x0000], %r1
	.word 0xc277c010  ! 38: STX_R	stx	%r1, [%r31 + %r16]
	.word 0xc25ba000  ! 39: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25bc010  ! 40: LDX_R	ldx	[%r15 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_35:
	.word 0xc25b8010  ! 1: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25ba000  ! 2: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc274a000  ! 3: STX_I	stx	%r1, [%r18 + 0x0000]
	.word 0xc25ea000  ! 4: LDX_I	ldx	[%r26 + 0x0000], %r1
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25d0010  ! 5: LDX_R	ldx	[%r20 + %r16], %r1
	.word 0xc25ba000  ! 6: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc276a000  ! 7: STX_I	stx	%r1, [%r26 + 0x0000]
	.word 0xc25e0010  ! 8: LDX_R	ldx	[%r24 + %r16], %r1
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc2748010  ! 9: STX_R	stx	%r1, [%r18 + %r16]
	.word 0xc273e000  ! 10: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25bc010  ! 11: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25f8010  ! 12: LDX_R	ldx	[%r30 + %r16], %r1
	.word 0xc2738010  ! 13: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273c010  ! 14: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273c010  ! 15: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273a000  ! 16: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25d2000  ! 17: LDX_I	ldx	[%r20 + 0x0000], %r1
	.word 0xc25be000  ! 18: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25ba000  ! 19: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25ba000  ! 20: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc275e000  ! 21: STX_I	stx	%r1, [%r23 + 0x0000]
	.word 0xc2738010  ! 22: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc276c010  ! 23: STX_R	stx	%r1, [%r27 + %r16]
	.word 0xc25ca000  ! 24: LDX_I	ldx	[%r18 + 0x0000], %r1
	.word 0xc2772000  ! 25: STX_I	stx	%r1, [%r28 + 0x0000]
	.word 0xc25e0010  ! 26: LDX_R	ldx	[%r24 + %r16], %r1
	.word 0xc25b8010  ! 27: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273c010  ! 28: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25c6000  ! 29: LDX_I	ldx	[%r17 + 0x0000], %r1
	.word 0xc25b8010  ! 30: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273a000  ! 31: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25be000  ! 32: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25be000  ! 33: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273c010  ! 34: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273a000  ! 35: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc2738010  ! 36: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25ba000  ! 37: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2746000  ! 38: STX_I	stx	%r1, [%r17 + 0x0000]
	.word 0xc25be000  ! 39: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25b8010  ! 40: LDX_R	ldx	[%r14 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_34:
	.word 0xc25bc010  ! 1: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc25da000  ! 2: LDX_I	ldx	[%r22 + 0x0000], %r1
	.word 0xc273a000  ! 3: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25be000  ! 4: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25c8010  ! 5: LDX_R	ldx	[%r18 + %r16], %r1
	.word 0xc25fa000  ! 6: LDX_I	ldx	[%r30 + 0x0000], %r1
	.word 0xc2738010  ! 7: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25c8010  ! 8: LDX_R	ldx	[%r18 + %r16], %r1
	.word 0xc273e000  ! 9: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc2754010  ! 10: STX_R	stx	%r1, [%r21 + %r16]
	.word 0xc25d8010  ! 11: LDX_R	ldx	[%r22 + %r16], %r1
	.word 0xc25cc010  ! 12: LDX_R	ldx	[%r19 + %r16], %r1
	.word 0xc2738010  ! 13: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc2774010  ! 14: STX_R	stx	%r1, [%r29 + %r16]
	.word 0xc276e000  ! 15: STX_I	stx	%r1, [%r27 + 0x0000]
	.word 0xc273e000  ! 16: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25e2000  ! 17: LDX_I	ldx	[%r24 + 0x0000], %r1
	.word 0xc25ca000  ! 18: LDX_I	ldx	[%r18 + 0x0000], %r1
	.word 0xc25ba000  ! 19: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25ba000  ! 20: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273e000  ! 21: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc277c010  ! 22: STX_R	stx	%r1, [%r31 + %r16]
	.word 0xc277e000  ! 23: STX_I	stx	%r1, [%r31 + 0x0000]
	.word 0xc25be000  ! 24: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273c010  ! 25: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25b8010  ! 26: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25bc010  ! 27: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2766000  ! 28: STX_I	stx	%r1, [%r25 + 0x0000]
	.word 0xc25e6000  ! 29: LDX_I	ldx	[%r25 + 0x0000], %r1
	.word 0xc25fc010  ! 30: LDX_R	ldx	[%r31 + %r16], %r1
	.word 0xc2772000  ! 31: STX_I	stx	%r1, [%r28 + 0x0000]
	.word 0xc25f2000  ! 32: LDX_I	ldx	[%r28 + 0x0000], %r1
	.word 0xc25ba000  ! 33: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2738010  ! 34: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc2738010  ! 35: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc275a000  ! 36: STX_I	stx	%r1, [%r22 + 0x0000]
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25d6000  ! 37: LDX_I	ldx	[%r21 + 0x0000], %r1
	.word 0xc273c010  ! 38: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25be000  ! 39: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25b8010  ! 40: LDX_R	ldx	[%r14 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_33:
	.word 0xc25bc010  ! 1: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25be000  ! 2: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2772000  ! 3: STX_I	stx	%r1, [%r28 + 0x0000]
	.word 0xc25be000  ! 4: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25b8010  ! 5: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25f2000  ! 6: LDX_I	ldx	[%r28 + 0x0000], %r1
	.word 0xc273c010  ! 7: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25bc010  ! 8: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273c010  ! 9: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273e000  ! 10: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25e4010  ! 11: LDX_R	ldx	[%r25 + %r16], %r1
	.word 0xc25b8010  ! 12: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273c010  ! 13: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc275c010  ! 14: STX_R	stx	%r1, [%r23 + %r16]
	.word 0xc273a000  ! 15: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc2738010  ! 16: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25ee000  ! 17: LDX_I	ldx	[%r27 + 0x0000], %r1
	.word 0xc25be000  ! 18: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25be000  ! 19: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25be000  ! 20: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273a000  ! 21: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273e000  ! 22: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc277e000  ! 23: STX_I	stx	%r1, [%r31 + 0x0000]
	.word 0xc25d6000  ! 24: LDX_I	ldx	[%r21 + 0x0000], %r1
	.word 0xc273a000  ! 25: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25b8010  ! 26: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25bc010  ! 27: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273e000  ! 28: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25da000  ! 29: LDX_I	ldx	[%r22 + 0x0000], %r1
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc25cc010  ! 30: LDX_R	ldx	[%r19 + %r16], %r1
	.word 0xc273c010  ! 31: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25be000  ! 32: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25ba000  ! 33: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273c010  ! 34: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc2738010  ! 35: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273e000  ! 36: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25ce000  ! 37: LDX_I	ldx	[%r19 + 0x0000], %r1
	.word 0xc275e000  ! 38: STX_I	stx	%r1, [%r23 + 0x0000]
	.word 0xc25fe000  ! 39: LDX_I	ldx	[%r31 + 0x0000], %r1
	.word 0xc25bc010  ! 40: LDX_R	ldx	[%r15 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_32:
	.word 0xc25b8010  ! 1: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25fe000  ! 2: LDX_I	ldx	[%r31 + 0x0000], %r1
	.word 0xc2738010  ! 3: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25be000  ! 4: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25f0010  ! 5: LDX_R	ldx	[%r28 + %r16], %r1
	.word 0xc25be000  ! 6: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2738010  ! 7: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25bc010  ! 8: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2750010  ! 9: STX_R	stx	%r1, [%r20 + %r16]
	.word 0xc273a000  ! 10: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25bc010  ! 11: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25f4010  ! 12: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc277a000  ! 13: STX_I	stx	%r1, [%r30 + 0x0000]
	.word 0xc276a000  ! 14: STX_I	stx	%r1, [%r26 + 0x0000]
	.word 0xc2776000  ! 15: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc274a000  ! 16: STX_I	stx	%r1, [%r18 + 0x0000]
	.word 0xc25f6000  ! 17: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25f6000  ! 18: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25da000  ! 19: LDX_I	ldx	[%r22 + 0x0000], %r1
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc25fe000  ! 20: LDX_I	ldx	[%r31 + 0x0000], %r1
	.word 0xc273c010  ! 21: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273c010  ! 22: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273e000  ! 23: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25ba000  ! 24: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2748010  ! 25: STX_R	stx	%r1, [%r18 + %r16]
	.word 0xc25b8010  ! 26: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25b8010  ! 27: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273c010  ! 28: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25e2000  ! 29: LDX_I	ldx	[%r24 + 0x0000], %r1
	.word 0xc25bc010  ! 30: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2738010  ! 31: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25be000  ! 32: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25be000  ! 33: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273a000  ! 34: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273c010  ! 35: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc2738010  ! 36: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25ee000  ! 37: LDX_I	ldx	[%r27 + 0x0000], %r1
	.word 0xc2748010  ! 38: STX_R	stx	%r1, [%r18 + %r16]
	.word 0xc25be000  ! 39: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25bc010  ! 40: LDX_R	ldx	[%r15 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_31:
	.word 0xc25bc010  ! 1: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25ce000  ! 2: LDX_I	ldx	[%r19 + 0x0000], %r1
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc273e000  ! 3: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25f6000  ! 4: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25b8010  ! 5: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25f6000  ! 6: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc2778010  ! 7: STX_R	stx	%r1, [%r30 + %r16]
	.word 0xc25b8010  ! 8: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc273c010  ! 9: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273a000  ! 10: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25d0010  ! 11: LDX_R	ldx	[%r20 + %r16], %r1
	.word 0xc25bc010  ! 12: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2778010  ! 13: STX_R	stx	%r1, [%r30 + %r16]
	.word 0xc2776000  ! 14: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc273a000  ! 15: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc2772000  ! 16: STX_I	stx	%r1, [%r28 + 0x0000]
	.word 0xc25ba000  ! 17: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25ba000  ! 18: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25be000  ! 19: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25ba000  ! 20: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2748010  ! 21: STX_R	stx	%r1, [%r18 + %r16]
	.word 0xc275c010  ! 22: STX_R	stx	%r1, [%r23 + %r16]
	.word 0xc2770010  ! 23: STX_R	stx	%r1, [%r28 + %r16]
	.word 0xc25ea000  ! 24: LDX_I	ldx	[%r26 + 0x0000], %r1
	.word 0xc2762000  ! 25: STX_I	stx	%r1, [%r24 + 0x0000]
	.word 0xc25bc010  ! 26: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25f0010  ! 27: LDX_R	ldx	[%r28 + %r16], %r1
	.word 0xc2776000  ! 28: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25be000  ! 29: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25b8010  ! 30: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273a000  ! 31: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25fa000  ! 32: LDX_I	ldx	[%r30 + 0x0000], %r1
	.word 0xc25be000  ! 33: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2738010  ! 34: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc2772000  ! 35: STX_I	stx	%r1, [%r28 + 0x0000]
	.word 0xc273a000  ! 36: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25ee000  ! 37: LDX_I	ldx	[%r27 + 0x0000], %r1
	.word 0xc273e000  ! 38: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25ba000  ! 39: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25bc010  ! 40: LDX_R	ldx	[%r15 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_30:
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25c8010  ! 1: LDX_R	ldx	[%r18 + %r16], %r1
	.word 0xc25be000  ! 2: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc277a000  ! 3: STX_I	stx	%r1, [%r30 + 0x0000]
	.word 0xc25c6000  ! 4: LDX_I	ldx	[%r17 + 0x0000], %r1
	.word 0xc25b8010  ! 5: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25be000  ! 6: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2738010  ! 7: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25bc010  ! 8: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc2738010  ! 9: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc2738010  ! 10: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25cc010  ! 11: LDX_R	ldx	[%r19 + %r16], %r1
	.word 0xc25c4010  ! 12: LDX_R	ldx	[%r17 + %r16], %r1
	.word 0xc273a000  ! 13: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273a000  ! 14: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc2758010  ! 15: STX_R	stx	%r1, [%r22 + %r16]
	.word 0xc2738010  ! 16: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc25be000  ! 17: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25fa000  ! 18: LDX_I	ldx	[%r30 + 0x0000], %r1
	.word 0xc25ba000  ! 19: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25ca000  ! 20: LDX_I	ldx	[%r18 + 0x0000], %r1
	.word 0xc273c010  ! 21: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273c010  ! 22: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc2744010  ! 23: STX_R	stx	%r1, [%r17 + %r16]
	.word 0xc25be000  ! 24: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2752000  ! 25: STX_I	stx	%r1, [%r20 + 0x0000]
	.word 0xc25bc010  ! 26: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25bc010  ! 27: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2744010  ! 28: STX_R	stx	%r1, [%r17 + %r16]
	.word 0xc25be000  ! 29: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25b8010  ! 30: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc276a000  ! 31: STX_I	stx	%r1, [%r26 + 0x0000]
	.word 0xc25ba000  ! 32: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25d6000  ! 33: LDX_I	ldx	[%r21 + 0x0000], %r1
	.word 0xc273c010  ! 34: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273e000  ! 35: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc2772000  ! 36: STX_I	stx	%r1, [%r28 + 0x0000]
	.word 0xc25be000  ! 37: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273e000  ! 38: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25be000  ! 39: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25b8010  ! 40: LDX_R	ldx	[%r14 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_29:
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc25b8010  ! 1: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25c6000  ! 2: LDX_I	ldx	[%r17 + 0x0000], %r1
	.word 0xc273a000  ! 3: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25ba000  ! 4: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25f8010  ! 5: LDX_R	ldx	[%r30 + %r16], %r1
	.word 0xc25ba000  ! 6: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc274e000  ! 7: STX_I	stx	%r1, [%r19 + 0x0000]
	.word 0xc25b8010  ! 8: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273c010  ! 9: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273e000  ! 10: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25b8010  ! 11: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25bc010  ! 12: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273a000  ! 13: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc2738010  ! 14: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273c010  ! 15: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273c010  ! 16: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25ba000  ! 17: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25ba000  ! 18: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25be000  ! 19: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25f2000  ! 20: LDX_I	ldx	[%r28 + 0x0000], %r1
	.word 0xc2738010  ! 21: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273c010  ! 22: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc2738010  ! 23: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25ca000  ! 24: LDX_I	ldx	[%r18 + 0x0000], %r1
	.word 0xc273c010  ! 25: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25bc010  ! 26: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25bc010  ! 27: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc273a000  ! 28: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25e6000  ! 29: LDX_I	ldx	[%r25 + 0x0000], %r1
	.word 0xc25bc010  ! 30: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc277c010  ! 31: STX_R	stx	%r1, [%r31 + %r16]
	.word 0xc25d6000  ! 32: LDX_I	ldx	[%r21 + 0x0000], %r1
	.word 0xc25de000  ! 33: LDX_I	ldx	[%r23 + 0x0000], %r1
	.word 0xc277a000  ! 34: STX_I	stx	%r1, [%r30 + 0x0000]
	.word 0xc273c010  ! 35: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc2774010  ! 36: STX_R	stx	%r1, [%r29 + %r16]
	.word 0xc25ba000  ! 37: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc275a000  ! 38: STX_I	stx	%r1, [%r22 + 0x0000]
	.word 0xc25be000  ! 39: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25b8010  ! 40: LDX_R	ldx	[%r14 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_28:
	.word 0xc25b8010  ! 1: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25fe000  ! 2: LDX_I	ldx	[%r31 + 0x0000], %r1
	.word 0xc273e000  ! 3: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25ba000  ! 4: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25f0010  ! 5: LDX_R	ldx	[%r28 + %r16], %r1
	.word 0xc25be000  ! 6: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273c010  ! 7: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25b8010  ! 8: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273a000  ! 9: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273e000  ! 10: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25bc010  ! 11: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25cc010  ! 12: LDX_R	ldx	[%r19 + %r16], %r1
	.word 0xc273a000  ! 13: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc2744010  ! 14: STX_R	stx	%r1, [%r17 + %r16]
	.word 0xc2738010  ! 15: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273e000  ! 16: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25f6000  ! 17: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25ba000  ! 18: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25ba000  ! 19: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25be000  ! 20: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273e000  ! 21: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc2762000  ! 22: STX_I	stx	%r1, [%r24 + 0x0000]
	.word 0xc273a000  ! 23: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25fa000  ! 24: LDX_I	ldx	[%r30 + 0x0000], %r1
	.word 0xc2738010  ! 25: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25bc010  ! 26: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25bc010  ! 27: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc2770010  ! 28: STX_R	stx	%r1, [%r28 + %r16]
	.word 0xc25ba000  ! 29: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25b8010  ! 30: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273c010  ! 31: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25e2000  ! 32: LDX_I	ldx	[%r24 + 0x0000], %r1
	.word 0xc25e6000  ! 33: LDX_I	ldx	[%r25 + 0x0000], %r1
	.word 0xc273e000  ! 34: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc273a000  ! 35: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273e000  ! 36: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25e2000  ! 37: LDX_I	ldx	[%r24 + 0x0000], %r1
	.word 0xc273e000  ! 38: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25ba000  ! 39: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25bc010  ! 40: LDX_R	ldx	[%r15 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_27:
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc25b8010  ! 1: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25d2000  ! 2: LDX_I	ldx	[%r20 + 0x0000], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc273e000  ! 3: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25ba000  ! 4: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc25bc010  ! 5: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25f2000  ! 6: LDX_I	ldx	[%r28 + 0x0000], %r1
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc273e000  ! 7: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25b8010  ! 8: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2738010  ! 9: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc2754010  ! 10: STX_R	stx	%r1, [%r21 + %r16]
	.word 0xc25b8010  ! 11: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25b8010  ! 12: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273c010  ! 13: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273a000  ! 14: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc2738010  ! 15: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273e000  ! 16: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25ea000  ! 17: LDX_I	ldx	[%r26 + 0x0000], %r1
	.word 0xc25ce000  ! 18: LDX_I	ldx	[%r19 + 0x0000], %r1
	.word 0xc25ee000  ! 19: LDX_I	ldx	[%r27 + 0x0000], %r1
	.word 0xc25be000  ! 20: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2738010  ! 21: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc2762000  ! 22: STX_I	stx	%r1, [%r24 + 0x0000]
	.word 0xc273c010  ! 23: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25d6000  ! 24: LDX_I	ldx	[%r21 + 0x0000], %r1
	.word 0xc273a000  ! 25: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25bc010  ! 26: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25dc010  ! 27: LDX_R	ldx	[%r23 + %r16], %r1
	.word 0xc2738010  ! 28: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25ba000  ! 29: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25bc010  ! 30: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2758010  ! 31: STX_R	stx	%r1, [%r22 + %r16]
	.word 0xc25be000  ! 32: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25ce000  ! 33: LDX_I	ldx	[%r19 + 0x0000], %r1
	.word 0xc2738010  ! 34: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc2738010  ! 35: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273e000  ! 36: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25ba000  ! 37: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc277a000  ! 38: STX_I	stx	%r1, [%r30 + 0x0000]
	.word 0xc25c6000  ! 39: LDX_I	ldx	[%r17 + 0x0000], %r1
	.word 0xc25cc010  ! 40: LDX_R	ldx	[%r19 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_26:
	.word 0xc25fc010  ! 1: LDX_R	ldx	[%r31 + %r16], %r1
	.word 0xc25d2000  ! 2: LDX_I	ldx	[%r20 + 0x0000], %r1
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc273a000  ! 3: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25be000  ! 4: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25b8010  ! 5: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25ba000  ! 6: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273c010  ! 7: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25b8010  ! 8: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2738010  ! 9: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc273a000  ! 10: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25d0010  ! 11: LDX_R	ldx	[%r20 + %r16], %r1
	.word 0xc25f0010  ! 12: LDX_R	ldx	[%r28 + %r16], %r1
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc273c010  ! 13: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc274a000  ! 14: STX_I	stx	%r1, [%r18 + 0x0000]
	.word 0xc2738010  ! 15: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc2738010  ! 16: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25d6000  ! 17: LDX_I	ldx	[%r21 + 0x0000], %r1
	.word 0xc25ba000  ! 18: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25da000  ! 19: LDX_I	ldx	[%r22 + 0x0000], %r1
	.word 0xc25ba000  ! 20: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273e000  ! 21: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc2768010  ! 22: STX_R	stx	%r1, [%r26 + %r16]
	.word 0xc273a000  ! 23: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25ba000  ! 24: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2738010  ! 25: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25bc010  ! 26: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25e0010  ! 27: LDX_R	ldx	[%r24 + %r16], %r1
	.word 0xc2738010  ! 28: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25ba000  ! 29: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25bc010  ! 30: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273e000  ! 31: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25ba000  ! 32: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25c6000  ! 33: LDX_I	ldx	[%r17 + 0x0000], %r1
	.word 0xc273a000  ! 34: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc2770010  ! 35: STX_R	stx	%r1, [%r28 + %r16]
	.word 0xc273c010  ! 36: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25be000  ! 37: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273a000  ! 38: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25ba000  ! 39: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25b8010  ! 40: LDX_R	ldx	[%r14 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_25:
	.word 0xc25bc010  ! 1: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25be000  ! 2: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc275e000  ! 3: STX_I	stx	%r1, [%r23 + 0x0000]
	.word 0xc25e6000  ! 4: LDX_I	ldx	[%r25 + 0x0000], %r1
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25bc010  ! 5: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25fa000  ! 6: LDX_I	ldx	[%r30 + 0x0000], %r1
	.word 0xc273a000  ! 7: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25bc010  ! 8: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273e000  ! 9: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc2738010  ! 10: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25b8010  ! 11: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25b8010  ! 12: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2738010  ! 13: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273c010  ! 14: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc2738010  ! 15: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc2748010  ! 16: STX_R	stx	%r1, [%r18 + %r16]
	.word 0xc25ee000  ! 17: LDX_I	ldx	[%r27 + 0x0000], %r1
	.word 0xc25be000  ! 18: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25be000  ! 19: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25ce000  ! 20: LDX_I	ldx	[%r19 + 0x0000], %r1
	.word 0xc2754010  ! 21: STX_R	stx	%r1, [%r21 + %r16]
	.word 0xc273c010  ! 22: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc2766000  ! 23: STX_I	stx	%r1, [%r25 + 0x0000]
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc25be000  ! 24: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2754010  ! 25: STX_R	stx	%r1, [%r21 + %r16]
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25b8010  ! 26: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25b8010  ! 27: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273e000  ! 28: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25be000  ! 29: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25bc010  ! 30: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273c010  ! 31: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25be000  ! 32: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25be000  ! 33: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273e000  ! 34: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc273a000  ! 35: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc277e000  ! 36: STX_I	stx	%r1, [%r31 + 0x0000]
	.word 0xc25ba000  ! 37: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273e000  ! 38: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25be000  ! 39: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25bc010  ! 40: LDX_R	ldx	[%r15 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_24:
	.word 0xc25b8010  ! 1: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25be000  ! 2: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273a000  ! 3: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25ba000  ! 4: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25b8010  ! 5: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25ba000  ! 6: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273e000  ! 7: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25c4010  ! 8: LDX_R	ldx	[%r17 + %r16], %r1
	.word 0xc273c010  ! 9: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273a000  ! 10: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25b8010  ! 11: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25f8010  ! 12: LDX_R	ldx	[%r30 + %r16], %r1
	.word 0xc2738010  ! 13: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc273e000  ! 14: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc2738010  ! 15: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc274a000  ! 16: STX_I	stx	%r1, [%r18 + 0x0000]
	.word 0xc25ba000  ! 17: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25be000  ! 18: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25d2000  ! 19: LDX_I	ldx	[%r20 + 0x0000], %r1
	.word 0xc25ba000  ! 20: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273c010  ! 21: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273a000  ! 22: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc2770010  ! 23: STX_R	stx	%r1, [%r28 + %r16]
	.word 0xc25be000  ! 24: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273c010  ! 25: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25bc010  ! 26: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25bc010  ! 27: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273c010  ! 28: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25ba000  ! 29: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25bc010  ! 30: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273c010  ! 31: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25ba000  ! 32: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25c6000  ! 33: LDX_I	ldx	[%r17 + 0x0000], %r1
	.word 0xc2738010  ! 34: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273c010  ! 35: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273c010  ! 36: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25d2000  ! 37: LDX_I	ldx	[%r20 + 0x0000], %r1
	.word 0xc2758010  ! 38: STX_R	stx	%r1, [%r22 + %r16]
	.word 0xc25ca000  ! 39: LDX_I	ldx	[%r18 + 0x0000], %r1
	.word 0xc25f8010  ! 40: LDX_R	ldx	[%r30 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_23:
	.word 0xc25bc010  ! 1: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25ce000  ! 2: LDX_I	ldx	[%r19 + 0x0000], %r1
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc2738010  ! 3: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25ba000  ! 4: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25f4010  ! 5: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25e2000  ! 6: LDX_I	ldx	[%r24 + 0x0000], %r1
	.word 0xc2738010  ! 7: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25bc010  ! 8: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc273a000  ! 9: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273a000  ! 10: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25bc010  ! 11: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25b8010  ! 12: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273e000  ! 13: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc2746000  ! 14: STX_I	stx	%r1, [%r17 + 0x0000]
	.word 0xc2738010  ! 15: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc2738010  ! 16: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25d6000  ! 17: LDX_I	ldx	[%r21 + 0x0000], %r1
	.word 0xc25ca000  ! 18: LDX_I	ldx	[%r18 + 0x0000], %r1
	.word 0xc25be000  ! 19: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25ba000  ! 20: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273c010  ! 21: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273e000  ! 22: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc2758010  ! 23: STX_R	stx	%r1, [%r22 + %r16]
	.word 0xc25be000  ! 24: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273a000  ! 25: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25b8010  ! 26: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25bc010  ! 27: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273e000  ! 28: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25be000  ! 29: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25b8010  ! 30: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2744010  ! 31: STX_R	stx	%r1, [%r17 + %r16]
	.word 0xc25ba000  ! 32: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25be000  ! 33: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273e000  ! 34: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc2766000  ! 35: STX_I	stx	%r1, [%r25 + 0x0000]
	.word 0xc273c010  ! 36: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25ba000  ! 37: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2738010  ! 38: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25da000  ! 39: LDX_I	ldx	[%r22 + 0x0000], %r1
	.word 0xc25b8010  ! 40: LDX_R	ldx	[%r14 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_22:
	.word 0xc25fc010  ! 1: LDX_R	ldx	[%r31 + %r16], %r1
	.word 0xc25ca000  ! 2: LDX_I	ldx	[%r18 + 0x0000], %r1
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc273a000  ! 3: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25be000  ! 4: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25b8010  ! 5: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25ea000  ! 6: LDX_I	ldx	[%r26 + 0x0000], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc2772000  ! 7: STX_I	stx	%r1, [%r28 + 0x0000]
	.word 0xc25b8010  ! 8: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273a000  ! 9: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc276c010  ! 10: STX_R	stx	%r1, [%r27 + %r16]
	.word 0xc25bc010  ! 11: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25b8010  ! 12: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2766000  ! 13: STX_I	stx	%r1, [%r25 + 0x0000]
	.word 0xc2758010  ! 14: STX_R	stx	%r1, [%r22 + %r16]
	.word 0xc2758010  ! 15: STX_R	stx	%r1, [%r22 + %r16]
	.word 0xc273c010  ! 16: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25be000  ! 17: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25ba000  ! 18: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25ba000  ! 19: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25be000  ! 20: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2738010  ! 21: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273c010  ! 22: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273c010  ! 23: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25ba000  ! 24: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc275e000  ! 25: STX_I	stx	%r1, [%r23 + 0x0000]
	.word 0xc25e0010  ! 26: LDX_R	ldx	[%r24 + %r16], %r1
	.word 0xc25ec010  ! 27: LDX_R	ldx	[%r27 + %r16], %r1
	.word 0xc2746000  ! 28: STX_I	stx	%r1, [%r17 + 0x0000]
	.word 0xc25be000  ! 29: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25b8010  ! 30: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273c010  ! 31: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25ba000  ! 32: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25ba000  ! 33: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273c010  ! 34: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc2750010  ! 35: STX_R	stx	%r1, [%r20 + %r16]
	.word 0xc2774010  ! 36: STX_R	stx	%r1, [%r29 + %r16]
	.word 0xc25be000  ! 37: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2738010  ! 38: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25d6000  ! 39: LDX_I	ldx	[%r21 + 0x0000], %r1
	.word 0xc25d4010  ! 40: LDX_R	ldx	[%r21 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_21:
	.word 0xc25bc010  ! 1: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25ca000  ! 2: LDX_I	ldx	[%r18 + 0x0000], %r1
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc273c010  ! 3: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25ce000  ! 4: LDX_I	ldx	[%r19 + 0x0000], %r1
	.word 0xc25bc010  ! 5: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25e6000  ! 6: LDX_I	ldx	[%r25 + 0x0000], %r1
	.word 0xc274c010  ! 7: STX_R	stx	%r1, [%r19 + %r16]
	.word 0xc25bc010  ! 8: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc273a000  ! 9: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273a000  ! 10: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25e0010  ! 11: LDX_R	ldx	[%r24 + %r16], %r1
	.word 0xc25b8010  ! 12: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc2738010  ! 13: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273c010  ! 14: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc2738010  ! 15: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc274c010  ! 16: STX_R	stx	%r1, [%r19 + %r16]
	.word 0xc25c6000  ! 17: LDX_I	ldx	[%r17 + 0x0000], %r1
	.word 0xc25ba000  ! 18: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25ba000  ! 19: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25be000  ! 20: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2738010  ! 21: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273a000  ! 22: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc2752000  ! 23: STX_I	stx	%r1, [%r20 + 0x0000]
	.word 0xc25ba000  ! 24: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2746000  ! 25: STX_I	stx	%r1, [%r17 + 0x0000]
	.word 0xc25fc010  ! 26: LDX_R	ldx	[%r31 + %r16], %r1
	.word 0xc25b8010  ! 27: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273c010  ! 28: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25ba000  ! 29: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25b8010  ! 30: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2752000  ! 31: STX_I	stx	%r1, [%r20 + 0x0000]
	.word 0xc25be000  ! 32: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25ba000  ! 33: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273c010  ! 34: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc2752000  ! 35: STX_I	stx	%r1, [%r20 + 0x0000]
	.word 0xc273e000  ! 36: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25be000  ! 37: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273a000  ! 38: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25ce000  ! 39: LDX_I	ldx	[%r19 + 0x0000], %r1
	.word 0xc25e8010  ! 40: LDX_R	ldx	[%r26 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_20:
	.word 0xc25bc010  ! 1: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25ba000  ! 2: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc273a000  ! 3: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25ba000  ! 4: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25b8010  ! 5: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25de000  ! 6: LDX_I	ldx	[%r23 + 0x0000], %r1
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc2762000  ! 7: STX_I	stx	%r1, [%r24 + 0x0000]
	.word 0xc25bc010  ! 8: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc273a000  ! 9: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc277c010  ! 10: STX_R	stx	%r1, [%r31 + %r16]
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc25e8010  ! 11: LDX_R	ldx	[%r26 + %r16], %r1
	.word 0xc25b8010  ! 12: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273e000  ! 13: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc275e000  ! 14: STX_I	stx	%r1, [%r23 + 0x0000]
	.word 0xc273a000  ! 15: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc2738010  ! 16: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25be000  ! 17: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25be000  ! 18: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25be000  ! 19: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25be000  ! 20: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273a000  ! 21: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc2762000  ! 22: STX_I	stx	%r1, [%r24 + 0x0000]
	.word 0xc277c010  ! 23: STX_R	stx	%r1, [%r31 + %r16]
	.word 0xc25d6000  ! 24: LDX_I	ldx	[%r21 + 0x0000], %r1
	.word 0xc273a000  ! 25: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25b8010  ! 26: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25bc010  ! 27: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273c010  ! 28: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25be000  ! 29: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25b8010  ! 30: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2770010  ! 31: STX_R	stx	%r1, [%r28 + %r16]
	.word 0xc25da000  ! 32: LDX_I	ldx	[%r22 + 0x0000], %r1
	.word 0xc25de000  ! 33: LDX_I	ldx	[%r23 + 0x0000], %r1
	.word 0xc2738010  ! 34: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc2768010  ! 35: STX_R	stx	%r1, [%r26 + %r16]
	.word 0xc2768010  ! 36: STX_R	stx	%r1, [%r26 + %r16]
	.word 0xc25ba000  ! 37: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273c010  ! 38: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25fe000  ! 39: LDX_I	ldx	[%r31 + 0x0000], %r1
	.word 0xc25bc010  ! 40: LDX_R	ldx	[%r15 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_19:
	.word 0xc25b8010  ! 1: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25be000  ! 2: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc2738010  ! 3: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25be000  ! 4: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25cc010  ! 5: LDX_R	ldx	[%r19 + %r16], %r1
	.word 0xc25be000  ! 6: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc274c010  ! 7: STX_R	stx	%r1, [%r19 + %r16]
	.word 0xc25e0010  ! 8: LDX_R	ldx	[%r24 + %r16], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc2752000  ! 9: STX_I	stx	%r1, [%r20 + 0x0000]
	.word 0xc273c010  ! 10: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc25b8010  ! 11: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25bc010  ! 12: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273e000  ! 13: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc273c010  ! 14: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273c010  ! 15: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc275c010  ! 16: STX_R	stx	%r1, [%r23 + %r16]
	.word 0xc25ea000  ! 17: LDX_I	ldx	[%r26 + 0x0000], %r1
	.word 0xc25ce000  ! 18: LDX_I	ldx	[%r19 + 0x0000], %r1
	.word 0xc25be000  ! 19: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25ba000  ! 20: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273e000  ! 21: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc2772000  ! 22: STX_I	stx	%r1, [%r28 + 0x0000]
	.word 0xc2752000  ! 23: STX_I	stx	%r1, [%r20 + 0x0000]
	.word 0xc25ba000  ! 24: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2738010  ! 25: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25bc010  ! 26: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25e4010  ! 27: LDX_R	ldx	[%r25 + %r16], %r1
	.word 0xc273e000  ! 28: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25ba000  ! 29: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25e8010  ! 30: LDX_R	ldx	[%r26 + %r16], %r1
	.word 0xc273c010  ! 31: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25e6000  ! 32: LDX_I	ldx	[%r25 + 0x0000], %r1
	.word 0xc25da000  ! 33: LDX_I	ldx	[%r22 + 0x0000], %r1
	.word 0xc273c010  ! 34: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc2750010  ! 35: STX_R	stx	%r1, [%r20 + %r16]
	.word 0xc276a000  ! 36: STX_I	stx	%r1, [%r26 + 0x0000]
	.word 0xc25ba000  ! 37: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273e000  ! 38: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25be000  ! 39: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25b8010  ! 40: LDX_R	ldx	[%r14 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_18:
	.word 0xc25b8010  ! 1: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25ba000  ! 2: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2738010  ! 3: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25ee000  ! 4: LDX_I	ldx	[%r27 + 0x0000], %r1
	.word 0xc25fc010  ! 5: LDX_R	ldx	[%r31 + %r16], %r1
	.word 0xc25ba000  ! 6: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2760010  ! 7: STX_R	stx	%r1, [%r24 + %r16]
	.word 0xc25e4010  ! 8: LDX_R	ldx	[%r25 + %r16], %r1
	.word 0xc2738010  ! 9: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273c010  ! 10: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25b8010  ! 11: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25bc010  ! 12: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273c010  ! 13: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273a000  ! 14: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273e000  ! 15: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc274c010  ! 16: STX_R	stx	%r1, [%r19 + %r16]
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc25be000  ! 17: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25c6000  ! 18: LDX_I	ldx	[%r17 + 0x0000], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25ba000  ! 19: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25be000  ! 20: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc273c010  ! 21: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc2738010  ! 22: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc2738010  ! 23: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25ba000  ! 24: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc273e000  ! 25: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc25ec010  ! 27: LDX_R	ldx	[%r27 + %r16], %r1
	.word 0xc2776000  ! 28: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25f6000  ! 29: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25e8010  ! 30: LDX_R	ldx	[%r26 + %r16], %r1
	.word 0xc277c010  ! 31: STX_R	stx	%r1, [%r31 + %r16]
	.word 0xc25de000  ! 32: LDX_I	ldx	[%r23 + 0x0000], %r1
	.word 0xc25fa000  ! 33: LDX_I	ldx	[%r30 + 0x0000], %r1
	.word 0xc2750010  ! 34: STX_R	stx	%r1, [%r20 + %r16]
	.word 0xc273c010  ! 35: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc275c010  ! 36: STX_R	stx	%r1, [%r23 + %r16]
	.word 0xc25ba000  ! 37: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2744010  ! 38: STX_R	stx	%r1, [%r17 + %r16]
	.word 0xc25ba000  ! 39: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25e4010  ! 40: LDX_R	ldx	[%r25 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_17:
	.word 0xc25dc010  ! 1: LDX_R	ldx	[%r23 + %r16], %r1
	.word 0xc25ba000  ! 2: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc2738010  ! 3: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25ba000  ! 4: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25bc010  ! 5: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25ba000  ! 6: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc275e000  ! 7: STX_I	stx	%r1, [%r23 + 0x0000]
	.word 0xc25f0010  ! 8: LDX_R	ldx	[%r28 + %r16], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc2738010  ! 9: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273c010  ! 10: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25b8010  ! 11: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25bc010  ! 12: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc274a000  ! 13: STX_I	stx	%r1, [%r18 + 0x0000]
	.word 0xc277e000  ! 14: STX_I	stx	%r1, [%r31 + 0x0000]
	.word 0xc273c010  ! 15: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273a000  ! 16: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25be000  ! 17: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25ba000  ! 18: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc25be000  ! 19: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25ee000  ! 20: LDX_I	ldx	[%r27 + 0x0000], %r1
	.word 0xc2748010  ! 21: STX_R	stx	%r1, [%r18 + %r16]
	.word 0xc277a000  ! 22: STX_I	stx	%r1, [%r30 + 0x0000]
	.word 0xc274c010  ! 23: STX_R	stx	%r1, [%r19 + %r16]
	.word 0xc25ba000  ! 24: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2754010  ! 25: STX_R	stx	%r1, [%r21 + %r16]
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc25fc010  ! 27: LDX_R	ldx	[%r31 + %r16], %r1
	.word 0xc273a000  ! 28: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25e6000  ! 29: LDX_I	ldx	[%r25 + 0x0000], %r1
	.word 0xc25bc010  ! 30: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273e000  ! 31: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25f6000  ! 32: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25be000  ! 33: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2760010  ! 34: STX_R	stx	%r1, [%r24 + %r16]
	.word 0xc2762000  ! 35: STX_I	stx	%r1, [%r24 + 0x0000]
	.word 0xc2738010  ! 36: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25be000  ! 37: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273e000  ! 38: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25ba000  ! 39: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25b8010  ! 40: LDX_R	ldx	[%r14 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_16:
	.word 0xc25b8010  ! 1: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25be000  ! 2: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc2758010  ! 3: STX_R	stx	%r1, [%r22 + %r16]
	.word 0xc25ba000  ! 4: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25f4010  ! 5: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc25da000  ! 6: LDX_I	ldx	[%r22 + 0x0000], %r1
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc273a000  ! 7: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25dc010  ! 8: LDX_R	ldx	[%r23 + %r16], %r1
	.word 0xc277a000  ! 9: STX_I	stx	%r1, [%r30 + 0x0000]
	.word 0xc273c010  ! 10: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25dc010  ! 11: LDX_R	ldx	[%r23 + %r16], %r1
	.word 0xc25b8010  ! 12: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc273c010  ! 13: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273e000  ! 14: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc273a000  ! 15: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273a000  ! 16: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25be000  ! 17: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25be000  ! 18: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25be000  ! 19: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25ba000  ! 20: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc274c010  ! 21: STX_R	stx	%r1, [%r19 + %r16]
	.word 0xc2744010  ! 22: STX_R	stx	%r1, [%r17 + %r16]
	.word 0xc2776000  ! 23: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25fe000  ! 24: LDX_I	ldx	[%r31 + 0x0000], %r1
	.word 0xc273e000  ! 25: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25b8010  ! 26: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25bc010  ! 27: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc276c010  ! 28: STX_R	stx	%r1, [%r27 + %r16]
	.word 0xc25e2000  ! 29: LDX_I	ldx	[%r24 + 0x0000], %r1
	.word 0xc25e4010  ! 30: LDX_R	ldx	[%r25 + %r16], %r1
	.word 0xc2738010  ! 31: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25ba000  ! 32: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25fa000  ! 33: LDX_I	ldx	[%r30 + 0x0000], %r1
	.word 0xc277e000  ! 34: STX_I	stx	%r1, [%r31 + 0x0000]
	.word 0xc2778010  ! 35: STX_R	stx	%r1, [%r30 + %r16]
	.word 0xc273c010  ! 36: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25be000  ! 37: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273e000  ! 38: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25ba000  ! 39: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25b8010  ! 40: LDX_R	ldx	[%r14 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_15:
	.word 0xc25b8010  ! 1: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25fe000  ! 2: LDX_I	ldx	[%r31 + 0x0000], %r1
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc273e000  ! 3: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25ba000  ! 4: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25c8010  ! 5: LDX_R	ldx	[%r18 + %r16], %r1
	.word 0xc25ea000  ! 6: LDX_I	ldx	[%r26 + 0x0000], %r1
	.word 0xc273a000  ! 7: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25c8010  ! 8: LDX_R	ldx	[%r18 + %r16], %r1
	.word 0xc273c010  ! 9: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273a000  ! 10: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25bc010  ! 11: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25bc010  ! 12: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc273c010  ! 13: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc2738010  ! 14: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc2772000  ! 15: STX_I	stx	%r1, [%r28 + 0x0000]
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc2738010  ! 16: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25ba000  ! 17: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25be000  ! 18: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc25f6000  ! 19: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25be000  ! 20: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc275c010  ! 21: STX_R	stx	%r1, [%r23 + %r16]
	.word 0xc273a000  ! 22: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc2744010  ! 23: STX_R	stx	%r1, [%r17 + %r16]
	.word 0xc25ba000  ! 24: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2748010  ! 25: STX_R	stx	%r1, [%r18 + %r16]
	.word 0xc25d4010  ! 26: LDX_R	ldx	[%r21 + %r16], %r1
	.word 0xc25d4010  ! 27: LDX_R	ldx	[%r21 + %r16], %r1
	.word 0xc273a000  ! 28: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25be000  ! 29: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25bc010  ! 30: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2738010  ! 31: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25ba000  ! 32: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25ba000  ! 33: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273a000  ! 34: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc275a000  ! 35: STX_I	stx	%r1, [%r22 + 0x0000]
	.word 0xc2738010  ! 36: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25be000  ! 37: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273a000  ! 38: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25ee000  ! 39: LDX_I	ldx	[%r27 + 0x0000], %r1
	.word 0xc25bc010  ! 40: LDX_R	ldx	[%r15 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_14:
	.word 0xc25c8010  ! 1: LDX_R	ldx	[%r18 + %r16], %r1
	.word 0xc25be000  ! 2: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273c010  ! 3: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25ba000  ! 4: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25b8010  ! 5: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25be000  ! 6: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273e000  ! 7: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc25f4010  ! 8: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc2766000  ! 9: STX_I	stx	%r1, [%r25 + 0x0000]
	.word 0xc273e000  ! 10: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25e0010  ! 11: LDX_R	ldx	[%r24 + %r16], %r1
	.word 0xc25f8010  ! 12: LDX_R	ldx	[%r30 + %r16], %r1
	.word 0xc273e000  ! 13: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc2738010  ! 14: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc274a000  ! 15: STX_I	stx	%r1, [%r18 + 0x0000]
	.word 0xc273c010  ! 16: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25d2000  ! 17: LDX_I	ldx	[%r20 + 0x0000], %r1
	.word 0xc25e2000  ! 18: LDX_I	ldx	[%r24 + 0x0000], %r1
	.word 0xc25be000  ! 19: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25ba000  ! 20: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273e000  ! 21: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc273e000  ! 22: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc273e000  ! 23: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25fe000  ! 24: LDX_I	ldx	[%r31 + 0x0000], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc273c010  ! 25: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25b8010  ! 26: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25e8010  ! 27: LDX_R	ldx	[%r26 + %r16], %r1
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc273c010  ! 28: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25be000  ! 29: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25cc010  ! 30: LDX_R	ldx	[%r19 + %r16], %r1
	.word 0xc2738010  ! 31: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25be000  ! 32: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25be000  ! 33: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273a000  ! 34: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc2738010  ! 35: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc2738010  ! 36: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25be000  ! 37: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273c010  ! 38: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25ba000  ! 39: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25bc010  ! 40: LDX_R	ldx	[%r15 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_13:
	.word 0xc25bc010  ! 1: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25ba000  ! 2: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2762000  ! 3: STX_I	stx	%r1, [%r24 + 0x0000]
	.word 0xc25e2000  ! 4: LDX_I	ldx	[%r24 + 0x0000], %r1
	.word 0xc25bc010  ! 5: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25be000  ! 6: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273a000  ! 7: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25ec010  ! 8: LDX_R	ldx	[%r27 + %r16], %r1
	.word 0xc273c010  ! 9: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273e000  ! 10: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25bc010  ! 11: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25bc010  ! 12: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc275a000  ! 13: STX_I	stx	%r1, [%r22 + 0x0000]
	.word 0xc273c010  ! 14: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc2752000  ! 15: STX_I	stx	%r1, [%r20 + 0x0000]
	.word 0xc273e000  ! 16: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25ee000  ! 17: LDX_I	ldx	[%r27 + 0x0000], %r1
	.word 0xc25be000  ! 18: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25be000  ! 19: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25e6000  ! 20: LDX_I	ldx	[%r25 + 0x0000], %r1
	.word 0xc273e000  ! 21: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc275a000  ! 22: STX_I	stx	%r1, [%r22 + 0x0000]
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc2744010  ! 23: STX_R	stx	%r1, [%r17 + %r16]
	.word 0xc25be000  ! 24: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273c010  ! 25: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25bc010  ! 26: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25d8010  ! 27: LDX_R	ldx	[%r22 + %r16], %r1
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc2756000  ! 28: STX_I	stx	%r1, [%r21 + 0x0000]
	.word 0xc25ba000  ! 29: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25bc010  ! 30: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273a000  ! 31: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25be000  ! 32: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25d6000  ! 33: LDX_I	ldx	[%r21 + 0x0000], %r1
	.word 0xc273c010  ! 34: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273e000  ! 35: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc273e000  ! 36: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25be000  ! 37: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273e000  ! 38: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25d6000  ! 39: LDX_I	ldx	[%r21 + 0x0000], %r1
	.word 0xc25bc010  ! 40: LDX_R	ldx	[%r15 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_12:
	.word 0xc25bc010  ! 1: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25ce000  ! 2: LDX_I	ldx	[%r19 + 0x0000], %r1
	.word 0xc2754010  ! 3: STX_R	stx	%r1, [%r21 + %r16]
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc25fa000  ! 4: LDX_I	ldx	[%r30 + 0x0000], %r1
	.word 0xc25b8010  ! 5: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25e6000  ! 6: LDX_I	ldx	[%r25 + 0x0000], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc273e000  ! 7: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25bc010  ! 8: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273e000  ! 9: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc273c010  ! 10: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25e4010  ! 11: LDX_R	ldx	[%r25 + %r16], %r1
	.word 0xc25b8010  ! 12: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273c010  ! 13: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273e000  ! 14: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc273e000  ! 15: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc273a000  ! 16: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25ba000  ! 17: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25ba000  ! 18: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25be000  ! 19: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25ba000  ! 20: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc2754010  ! 21: STX_R	stx	%r1, [%r21 + %r16]
	.word 0xc2762000  ! 22: STX_I	stx	%r1, [%r24 + 0x0000]
	.word 0xc275a000  ! 23: STX_I	stx	%r1, [%r22 + 0x0000]
	.word 0xc25be000  ! 24: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2738010  ! 25: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25bc010  ! 26: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25f8010  ! 27: LDX_R	ldx	[%r30 + %r16], %r1
	.word 0xc2762000  ! 28: STX_I	stx	%r1, [%r24 + 0x0000]
	.word 0xc25ba000  ! 29: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25bc010  ! 30: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273c010  ! 31: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25f6000  ! 32: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25e2000  ! 33: LDX_I	ldx	[%r24 + 0x0000], %r1
	.word 0xc2744010  ! 34: STX_R	stx	%r1, [%r17 + %r16]
	.word 0xc273c010  ! 35: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc2758010  ! 36: STX_R	stx	%r1, [%r22 + %r16]
	.word 0xc25be000  ! 37: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273e000  ! 38: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25be000  ! 39: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25d8010  ! 40: LDX_R	ldx	[%r22 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_11:
	.word 0xc25bc010  ! 1: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25be000  ! 2: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273e000  ! 3: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25be000  ! 4: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25f8010  ! 5: LDX_R	ldx	[%r30 + %r16], %r1
	.word 0xc25be000  ! 6: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2738010  ! 7: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25bc010  ! 8: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273a000  ! 9: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc273e000  ! 10: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25d8010  ! 11: LDX_R	ldx	[%r22 + %r16], %r1
	.word 0xc25bc010  ! 12: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2738010  ! 13: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc2754010  ! 14: STX_R	stx	%r1, [%r21 + %r16]
	.word 0xc273e000  ! 15: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc274e000  ! 16: STX_I	stx	%r1, [%r19 + 0x0000]
	.word 0xc25ba000  ! 17: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25fa000  ! 18: LDX_I	ldx	[%r30 + 0x0000], %r1
	.word 0xc25ba000  ! 19: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25da000  ! 20: LDX_I	ldx	[%r22 + 0x0000], %r1
	.word 0xc273c010  ! 21: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc277c010  ! 22: STX_R	stx	%r1, [%r31 + %r16]
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc273a000  ! 23: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25be000  ! 24: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273c010  ! 25: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25bc010  ! 26: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25b8010  ! 27: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273c010  ! 28: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25ba000  ! 29: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25b8010  ! 30: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2776000  ! 31: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25be000  ! 32: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25ba000  ! 33: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2738010  ! 34: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273a000  ! 35: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273e000  ! 36: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25e2000  ! 37: LDX_I	ldx	[%r24 + 0x0000], %r1
	.word 0xc273e000  ! 38: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25ba000  ! 39: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25b8010  ! 40: LDX_R	ldx	[%r14 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_10:
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25f4010  ! 1: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc25be000  ! 2: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273a000  ! 3: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25be000  ! 4: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25d0010  ! 5: LDX_R	ldx	[%r20 + %r16], %r1
	.word 0xc25d2000  ! 6: LDX_I	ldx	[%r20 + 0x0000], %r1
	.word 0xc273c010  ! 7: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25f4010  ! 8: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc2738010  ! 9: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc273c010  ! 10: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25b8010  ! 11: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25bc010  ! 12: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc273c010  ! 13: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc2746000  ! 14: STX_I	stx	%r1, [%r17 + 0x0000]
	.word 0xc273e000  ! 15: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc273e000  ! 16: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25f6000  ! 17: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25be000  ! 18: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25ce000  ! 19: LDX_I	ldx	[%r19 + 0x0000], %r1
	.word 0xc25be000  ! 20: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273c010  ! 21: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc275e000  ! 22: STX_I	stx	%r1, [%r23 + 0x0000]
	.word 0xc2770010  ! 23: STX_R	stx	%r1, [%r28 + %r16]
	.word 0xc25be000  ! 24: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2744010  ! 25: STX_R	stx	%r1, [%r17 + %r16]
	.word 0xc25bc010  ! 26: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25bc010  ! 27: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2738010  ! 28: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25ba000  ! 29: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25bc010  ! 30: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2738010  ! 31: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25de000  ! 32: LDX_I	ldx	[%r23 + 0x0000], %r1
	.word 0xc25ba000  ! 33: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273e000  ! 34: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc2752000  ! 35: STX_I	stx	%r1, [%r20 + 0x0000]
	.word 0xc273c010  ! 36: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25be000  ! 37: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273a000  ! 38: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25be000  ! 39: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25f0010  ! 40: LDX_R	ldx	[%r28 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_9:
	.word 0xc25b8010  ! 1: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25c6000  ! 2: LDX_I	ldx	[%r17 + 0x0000], %r1
	.word 0xc273a000  ! 3: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25ba000  ! 4: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25bc010  ! 5: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25de000  ! 6: LDX_I	ldx	[%r23 + 0x0000], %r1
	.word 0xc2750010  ! 7: STX_R	stx	%r1, [%r20 + %r16]
	.word 0xc25b8010  ! 8: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273a000  ! 9: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc276a000  ! 10: STX_I	stx	%r1, [%r26 + 0x0000]
	.word 0xc25cc010  ! 11: LDX_R	ldx	[%r19 + %r16], %r1
	.word 0xc25f8010  ! 12: LDX_R	ldx	[%r30 + %r16], %r1
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc273a000  ! 13: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc275a000  ! 14: STX_I	stx	%r1, [%r22 + 0x0000]
	.word 0xc273e000  ! 15: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc273a000  ! 16: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25ba000  ! 17: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25be000  ! 18: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc25be000  ! 19: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25ea000  ! 20: LDX_I	ldx	[%r26 + 0x0000], %r1
	.word 0xc277a000  ! 21: STX_I	stx	%r1, [%r30 + 0x0000]
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc273e000  ! 22: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc273c010  ! 23: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25f2000  ! 24: LDX_I	ldx	[%r28 + 0x0000], %r1
	.word 0xc2772000  ! 25: STX_I	stx	%r1, [%r28 + 0x0000]
	.word 0xc25bc010  ! 26: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25d0010  ! 27: LDX_R	ldx	[%r20 + %r16], %r1
	.word 0xc273c010  ! 28: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25ba000  ! 29: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25b8010  ! 30: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc277c010  ! 31: STX_R	stx	%r1, [%r31 + %r16]
	.word 0xc25be000  ! 32: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25be000  ! 33: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273a000  ! 34: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc2738010  ! 35: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc274c010  ! 36: STX_R	stx	%r1, [%r19 + %r16]
	.word 0xc25da000  ! 37: LDX_I	ldx	[%r22 + 0x0000], %r1
	.word 0xc273a000  ! 38: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25ba000  ! 39: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25e8010  ! 40: LDX_R	ldx	[%r26 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_8:
	.word 0xc25d8010  ! 1: LDX_R	ldx	[%r22 + %r16], %r1
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25be000  ! 2: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273c010  ! 3: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25be000  ! 4: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25e0010  ! 5: LDX_R	ldx	[%r24 + %r16], %r1
	.word 0xc25ba000  ! 6: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc273c010  ! 7: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25bc010  ! 8: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc2758010  ! 9: STX_R	stx	%r1, [%r22 + %r16]
	.word 0xc2776000  ! 10: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25d8010  ! 11: LDX_R	ldx	[%r22 + %r16], %r1
	.word 0xc25e4010  ! 12: LDX_R	ldx	[%r25 + %r16], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc2738010  ! 13: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc2744010  ! 14: STX_R	stx	%r1, [%r17 + %r16]
	.word 0xc273c010  ! 15: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273a000  ! 16: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25be000  ! 17: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25e6000  ! 18: LDX_I	ldx	[%r25 + 0x0000], %r1
	.word 0xc25ba000  ! 19: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25ba000  ! 20: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2750010  ! 21: STX_R	stx	%r1, [%r20 + %r16]
	.word 0xc273e000  ! 22: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc273c010  ! 23: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25be000  ! 24: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273e000  ! 25: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25c4010  ! 26: LDX_R	ldx	[%r17 + %r16], %r1
	.word 0xc25b8010  ! 27: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273e000  ! 28: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25ba000  ! 29: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25ec010  ! 30: LDX_R	ldx	[%r27 + %r16], %r1
	.word 0xc275a000  ! 31: STX_I	stx	%r1, [%r22 + 0x0000]
	.word 0xc25fa000  ! 32: LDX_I	ldx	[%r30 + 0x0000], %r1
	.word 0xc25ba000  ! 33: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2750010  ! 34: STX_R	stx	%r1, [%r20 + %r16]
	.word 0xc273e000  ! 35: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc274c010  ! 36: STX_R	stx	%r1, [%r19 + %r16]
	.word 0xc25c6000  ! 37: LDX_I	ldx	[%r17 + 0x0000], %r1
	.word 0xc276e000  ! 38: STX_I	stx	%r1, [%r27 + 0x0000]
	.word 0xc25f6000  ! 39: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25bc010  ! 40: LDX_R	ldx	[%r15 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_7:
	.word 0xc25b8010  ! 1: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25ba000  ! 2: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273e000  ! 3: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25ba000  ! 4: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc25bc010  ! 5: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25ca000  ! 6: LDX_I	ldx	[%r18 + 0x0000], %r1
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc2738010  ! 7: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25bc010  ! 8: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc2738010  ! 9: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273c010  ! 10: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc25b8010  ! 11: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25c4010  ! 12: LDX_R	ldx	[%r17 + %r16], %r1
	.word 0xc2776000  ! 13: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc2738010  ! 14: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc277a000  ! 15: STX_I	stx	%r1, [%r30 + 0x0000]
	.word 0xc273a000  ! 16: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25ba000  ! 17: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25be000  ! 18: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25be000  ! 19: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25ba000  ! 20: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273e000  ! 21: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc2738010  ! 22: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273c010  ! 23: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25ba000  ! 24: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc277c010  ! 25: STX_R	stx	%r1, [%r31 + %r16]
	.word 0xc25bc010  ! 26: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25b8010  ! 27: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273e000  ! 28: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25ba000  ! 29: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25dc010  ! 30: LDX_R	ldx	[%r23 + %r16], %r1
	.word 0xc274e000  ! 31: STX_I	stx	%r1, [%r19 + 0x0000]
	.word 0xc25be000  ! 32: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25fa000  ! 33: LDX_I	ldx	[%r30 + 0x0000], %r1
	.word 0xc2766000  ! 34: STX_I	stx	%r1, [%r25 + 0x0000]
	.word 0xc273a000  ! 35: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc2762000  ! 36: STX_I	stx	%r1, [%r24 + 0x0000]
	.word 0xc25ba000  ! 37: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273e000  ! 38: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25e2000  ! 39: LDX_I	ldx	[%r24 + 0x0000], %r1
	.word 0xc25dc010  ! 40: LDX_R	ldx	[%r23 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_6:
	.word 0xc25bc010  ! 1: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25be000  ! 2: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc273c010  ! 3: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25ba000  ! 4: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25dc010  ! 5: LDX_R	ldx	[%r23 + %r16], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25d2000  ! 6: LDX_I	ldx	[%r20 + 0x0000], %r1
	.word 0xc273a000  ! 7: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc25d8010  ! 8: LDX_R	ldx	[%r22 + %r16], %r1
	.word 0xc2748010  ! 9: STX_R	stx	%r1, [%r18 + %r16]
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc277e000  ! 10: STX_I	stx	%r1, [%r31 + 0x0000]
	.word 0xc25bc010  ! 11: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25bc010  ! 12: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc274c010  ! 13: STX_R	stx	%r1, [%r19 + %r16]
	.word 0xc273e000  ! 14: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc2770010  ! 15: STX_R	stx	%r1, [%r28 + %r16]
	.word 0xc273a000  ! 16: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25ea000  ! 17: LDX_I	ldx	[%r26 + 0x0000], %r1
	.word 0xc25ce000  ! 18: LDX_I	ldx	[%r19 + 0x0000], %r1
	.word 0xc25d2000  ! 19: LDX_I	ldx	[%r20 + 0x0000], %r1
	.word 0xc25ba000  ! 20: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2758010  ! 21: STX_R	stx	%r1, [%r22 + %r16]
	.word 0xc2778010  ! 22: STX_R	stx	%r1, [%r30 + %r16]
	.word 0xc273c010  ! 23: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25ba000  ! 24: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273e000  ! 25: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25b8010  ! 26: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25b8010  ! 27: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273c010  ! 28: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25be000  ! 29: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25cc010  ! 30: LDX_R	ldx	[%r19 + %r16], %r1
	.word 0xc273e000  ! 31: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25d6000  ! 32: LDX_I	ldx	[%r21 + 0x0000], %r1
	.word 0xc25ba000  ! 33: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273e000  ! 34: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc2738010  ! 35: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc273c010  ! 36: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25ee000  ! 37: LDX_I	ldx	[%r27 + 0x0000], %r1
	.word 0xc273e000  ! 38: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25ba000  ! 39: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25c8010  ! 40: LDX_R	ldx	[%r18 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_5:
	.word 0xc25f0010  ! 1: LDX_R	ldx	[%r28 + %r16], %r1
	.word 0xc25be000  ! 2: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2738010  ! 3: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc25ba000  ! 4: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25e0010  ! 5: LDX_R	ldx	[%r24 + %r16], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25ba000  ! 6: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2758010  ! 7: STX_R	stx	%r1, [%r22 + %r16]
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25b8010  ! 8: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273c010  ! 9: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc273a000  ! 10: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25bc010  ! 11: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25b8010  ! 12: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273e000  ! 13: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc273a000  ! 14: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273e000  ! 15: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc2738010  ! 16: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25be000  ! 17: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25ba000  ! 18: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25be000  ! 19: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25ba000  ! 20: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273e000  ! 21: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc275c010  ! 22: STX_R	stx	%r1, [%r23 + %r16]
	.word 0xc273a000  ! 23: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25be000  ! 24: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273e000  ! 25: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25bc010  ! 26: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25d0010  ! 27: LDX_R	ldx	[%r20 + %r16], %r1
	.word 0xc273c010  ! 28: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25ba000  ! 29: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25fc010  ! 30: LDX_R	ldx	[%r31 + %r16], %r1
	.word 0xc273a000  ! 31: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25c6000  ! 32: LDX_I	ldx	[%r17 + 0x0000], %r1
	.word 0xc25ba000  ! 33: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc2760010  ! 34: STX_R	stx	%r1, [%r24 + %r16]
	.word 0xc273c010  ! 35: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273e000  ! 36: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25ba000  ! 37: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273c010  ! 38: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25be000  ! 39: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25c8010  ! 40: LDX_R	ldx	[%r18 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_4:
	.word 0xc25bc010  ! 1: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25ba000  ! 2: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273c010  ! 3: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25ba000  ! 4: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25b8010  ! 5: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25ba000  ! 6: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc276c010  ! 7: STX_R	stx	%r1, [%r27 + %r16]
	.word 0xc25b8010  ! 8: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc275e000  ! 9: STX_I	stx	%r1, [%r23 + 0x0000]
	.word 0xc273e000  ! 10: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25bc010  ! 11: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25b8010  ! 12: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc2778010  ! 13: STX_R	stx	%r1, [%r30 + %r16]
	.word 0xc273e000  ! 14: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc273a000  ! 15: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273a000  ! 16: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25d2000  ! 17: LDX_I	ldx	[%r20 + 0x0000], %r1
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc25be000  ! 18: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25de000  ! 19: LDX_I	ldx	[%r23 + 0x0000], %r1
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc25ea000  ! 20: LDX_I	ldx	[%r26 + 0x0000], %r1
	.word 0xc273c010  ! 21: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc273c010  ! 22: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273c010  ! 23: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25c6000  ! 24: LDX_I	ldx	[%r17 + 0x0000], %r1
	.word 0xc273c010  ! 25: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25b8010  ! 26: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25d0010  ! 27: LDX_R	ldx	[%r20 + %r16], %r1
	.word 0xc273c010  ! 28: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25ba000  ! 29: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25b8010  ! 30: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2772000  ! 31: STX_I	stx	%r1, [%r28 + 0x0000]
	.word 0xc25ba000  ! 32: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25be000  ! 33: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2754010  ! 34: STX_R	stx	%r1, [%r21 + %r16]
	.word 0xc2738010  ! 35: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc2768010  ! 36: STX_R	stx	%r1, [%r26 + %r16]
	.word 0xc25be000  ! 37: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc276a000  ! 38: STX_I	stx	%r1, [%r26 + 0x0000]
	.word 0xc25ba000  ! 39: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25e4010  ! 40: LDX_R	ldx	[%r25 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	.word 0xc25bc010  ! 1: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25be000  ! 2: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273c010  ! 3: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25be000  ! 4: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25b8010  ! 5: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25ba000  ! 6: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc273c010  ! 7: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25b8010  ! 8: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc273e000  ! 9: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc273a000  ! 10: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc25b8010  ! 11: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25c8010  ! 12: LDX_R	ldx	[%r18 + %r16], %r1
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc273a000  ! 13: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273a000  ! 14: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc273e000  ! 15: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc273c010  ! 16: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25ba000  ! 17: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25ba000  ! 18: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25c6000  ! 19: LDX_I	ldx	[%r17 + 0x0000], %r1
	.word 0xc25be000  ! 20: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2744010  ! 21: STX_R	stx	%r1, [%r17 + %r16]
	.word 0xc2764010  ! 22: STX_R	stx	%r1, [%r25 + %r16]
	.word 0xc273e000  ! 23: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25f2000  ! 24: LDX_I	ldx	[%r28 + 0x0000], %r1
	.word 0xc273e000  ! 25: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25e8010  ! 26: LDX_R	ldx	[%r26 + %r16], %r1
	.word 0xc25bc010  ! 27: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273a000  ! 28: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25be000  ! 29: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25ec010  ! 30: LDX_R	ldx	[%r27 + %r16], %r1
	.word 0xc2738010  ! 31: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25ba000  ! 32: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25be000  ! 33: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273c010  ! 34: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc2744010  ! 35: STX_R	stx	%r1, [%r17 + %r16]
	.word 0xc273c010  ! 36: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25d2000  ! 37: LDX_I	ldx	[%r20 + 0x0000], %r1
	.word 0xc273e000  ! 38: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25ba000  ! 39: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25b8010  ! 40: LDX_R	ldx	[%r14 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	.word 0xc25d0010  ! 1: LDX_R	ldx	[%r20 + %r16], %r1
	.word 0xc25ee000  ! 2: LDX_I	ldx	[%r27 + 0x0000], %r1
	.word 0xc2738010  ! 3: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25ba000  ! 4: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25b8010  ! 5: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25ce000  ! 6: LDX_I	ldx	[%r19 + 0x0000], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc2738010  ! 7: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25b8010  ! 8: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc273e000  ! 9: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc276a000  ! 10: STX_I	stx	%r1, [%r26 + 0x0000]
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc25bc010  ! 11: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25b8010  ! 12: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc273e000  ! 13: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc275c010  ! 14: STX_R	stx	%r1, [%r23 + %r16]
	.word 0xc273e000  ! 15: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc273a000  ! 16: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25ba000  ! 17: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25be000  ! 18: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc25ba000  ! 19: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25ba000  ! 20: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc273e000  ! 21: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc273c010  ! 22: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc273a000  ! 23: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25be000  ! 24: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2738010  ! 25: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25ec010  ! 26: LDX_R	ldx	[%r27 + %r16], %r1
	.word 0xc25b8010  ! 27: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc274a000  ! 28: STX_I	stx	%r1, [%r18 + 0x0000]
	.word 0xc25ca000  ! 29: LDX_I	ldx	[%r18 + 0x0000], %r1
	.word 0xc25cc010  ! 30: LDX_R	ldx	[%r19 + %r16], %r1
	.word 0xc273a000  ! 31: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25fe000  ! 32: LDX_I	ldx	[%r31 + 0x0000], %r1
	.word 0xc25be000  ! 33: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc274e000  ! 34: STX_I	stx	%r1, [%r19 + 0x0000]
	.word 0xc273e000  ! 35: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc273c010  ! 36: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25ca000  ! 37: LDX_I	ldx	[%r18 + 0x0000], %r1
	.word 0xc274e000  ! 38: STX_I	stx	%r1, [%r19 + 0x0000]
	.word 0xc25de000  ! 39: LDX_I	ldx	[%r23 + 0x0000], %r1
	.word 0xc25c4010  ! 40: LDX_R	ldx	[%r17 + %r16], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xc25dc010  ! 1: LDX_R	ldx	[%r23 + %r16], %r1
	.word 0xc25fe000  ! 2: LDX_I	ldx	[%r31 + 0x0000], %r1
	.word 0xc273a000  ! 3: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc25be000  ! 4: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25bc010  ! 5: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25be000  ! 6: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25f4010  ! 26: LDX_R	ldx	[%r29 + %r16], %r1
	.word 0xc2772000  ! 7: STX_I	stx	%r1, [%r28 + 0x0000]
	.word 0xc25bc010  ! 8: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc273a000  ! 9: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc2746000  ! 10: STX_I	stx	%r1, [%r17 + 0x0000]
	.word 0xc25e4010  ! 11: LDX_R	ldx	[%r25 + %r16], %r1
	.word 0xc25cc010  ! 12: LDX_R	ldx	[%r19 + %r16], %r1
	.word 0xc25f6000  ! 37: LDX_I	ldx	[%r29 + 0x0000], %r1
	.word 0xc276e000  ! 13: STX_I	stx	%r1, [%r27 + 0x0000]
	.word 0xc2744010  ! 14: STX_R	stx	%r1, [%r17 + %r16]
	.word 0xc273a000  ! 15: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc273e000  ! 16: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25fa000  ! 17: LDX_I	ldx	[%r30 + 0x0000], %r1
	.word 0xc25be000  ! 18: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc2776000  ! 36: STX_I	stx	%r1, [%r29 + 0x0000]
	.word 0xc25be000  ! 19: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25ba000  ! 20: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc275e000  ! 21: STX_I	stx	%r1, [%r23 + 0x0000]
	.word 0xc273c010  ! 22: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc2738010  ! 23: STX_R	stx	%r1, [%r14 + %r16]
	.word 0xc25ba000  ! 24: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc275e000  ! 25: STX_I	stx	%r1, [%r23 + 0x0000]
	.word 0xc25bc010  ! 26: LDX_R	ldx	[%r15 + %r16], %r1
	.word 0xc25dc010  ! 27: LDX_R	ldx	[%r23 + %r16], %r1
	.word 0xc277a000  ! 28: STX_I	stx	%r1, [%r30 + 0x0000]
	.word 0xc25be000  ! 29: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc25b8010  ! 30: LDX_R	ldx	[%r14 + %r16], %r1
	.word 0xc273e000  ! 31: STX_I	stx	%r1, [%r15 + 0x0000]
	.word 0xc25fe000  ! 32: LDX_I	ldx	[%r31 + 0x0000], %r1
	.word 0xc25ee000  ! 33: LDX_I	ldx	[%r27 + 0x0000], %r1
	.word 0xc276e000  ! 34: STX_I	stx	%r1, [%r27 + 0x0000]
	.word 0xc2754010  ! 35: STX_R	stx	%r1, [%r21 + %r16]
	.word 0xc273c010  ! 36: STX_R	stx	%r1, [%r15 + %r16]
	.word 0xc25be000  ! 37: LDX_I	ldx	[%r15 + 0x0000], %r1
	.word 0xc273a000  ! 38: STX_I	stx	%r1, [%r14 + 0x0000]
	.word 0xc25ba000  ! 39: LDX_I	ldx	[%r14 + 0x0000], %r1
	.word 0xc25bc010  ! 40: LDX_R	ldx	[%r15 + %r16], %r1

join_lbl_0_0:
main_text_end:
	ta %icc, T_GOOD_TRAP
	nop
	nop
	nop

main_data_start:
.xword 0x1afcadfc78e1bd99
.xword 0x1bd4755868244f6b
.xword 0xbcc401e6a8331a35
.xword 0x0d07db163a7ba515
.xword 0xddedd7dcc3294efd
.xword 0xbd694f67ff9fdfd5
.xword 0x39087bc68a999be3
.xword 0xe1e0bbfd9e757a5f
.xword 0x832812642661ba44
.xword 0x418ea48cf433d412
.xword 0xa2c76e23ba96bef3
.xword 0x26ce4b83ec94eb54
.xword 0x2e76ab2d946278fd
.xword 0xcf3909c535f819e3
.xword 0xca813a913c55d9e2
.xword 0xd753835a5a32c3cd
.xword 0xa2abcf2cee513cce
.xword 0x82f1fbbd7aadd38d
.xword 0x036ad551efd0f3c9
.xword 0xa8e24ad620b41c90
.xword 0x1ec3a294b157bd90
.xword 0x064b6603a596fac2
.xword 0x6c44b5dc5cfeb6b6
.xword 0x968b22a98ccdcef1
.xword 0xef611dfc0373c889
.xword 0x16907cc5f3abba46
.xword 0x92f1af14e6c97b2c
.xword 0x780d7ac619d133e8
.xword 0x96a70d61230674f2
.xword 0xfa68242cef30562f
.xword 0x7a98a4442b72284d
.xword 0x9fce41bf1e302584

#if 0
#endif
