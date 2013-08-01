/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: memop_random_noatomic_multithrd.s
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
#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO
#define  L2_ES_W1C_VALUE  0xc03ffff800000000

#define My_External_Reset done;

#include "hboot.s"
.global user_data_start
.text
.global main
.global  My_Corrected_ECC_error_trap
.global  My_Recoverable_Sw_error_trap
main:
 ta    T_CHANGE_HPRIV
 ! Set up ld/st area per thread
 ta      T_RD_THID
 umul    %r9, 256, %r31
 setx    user_data_start, %r1, %r3
 add     %r31, %r3, %r31
disable_l1_DCache:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  ! Remove bit 2
  andn  %l0, 0x2, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL
enable_err_reporting:
  setx L2EE_PA0, %l0, %l1
  ldx  [%l1], %l2
  mov  0x1, %l0
  or   %l2, %l0, %l2
  stx  %l2, [%l1]
clear_l2_ESR:
  setx  L2_ES_W1C_VALUE, %l0, %l1
  setx  L2ES_PA0, %l6, %g1
  stx   %l1, [%g1]
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
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_8:
!Initializing integer registers
Init_integer_reg7:
	setx 0x000000000000003f, %r30, %r28
	ldx [%r31+0], %r0
	andn %r0, %r28, %r0
	ldx [%r31+8], %r1
	andn %r1, %r28, %r1
	ldx [%r31+16], %r2
	andn %r2, %r28, %r2
	ldx [%r31+24], %r3
	andn %r3, %r28, %r3
	ldx [%r31+32], %r4
	andn %r4, %r28, %r4
	ldx [%r31+40], %r5
	andn %r5, %r28, %r5
	ldx [%r31+48], %r6
	andn %r6, %r28, %r6
	ldx [%r31+56], %r7
	andn %r7, %r28, %r7
	ldx [%r31+64], %r8
	andn %r8, %r28, %r8
	ldx [%r31+72], %r9
	andn %r9, %r28, %r9
	ldx [%r31+80], %r10
	andn %r10, %r28, %r10
	ldx [%r31+88], %r11
	andn %r11, %r28, %r11
	ldx [%r31+96], %r12
	andn %r12, %r28, %r12
	ldx [%r31+104], %r13
	andn %r13, %r28, %r13
	ldx [%r31+120], %r15
	andn %r15, %r28, %r15
	ldx [%r31+128], %r16
	andn %r16, %r28, %r16
	ldx [%r31+136], %r17
	andn %r17, %r28, %r17
	ldx [%r31+144], %r18
	andn %r18, %r28, %r18
	ldx [%r31+152], %r19
	andn %r19, %r28, %r19
	ldx [%r31+160], %r20
	andn %r20, %r28, %r20
	ldx [%r31+168], %r21
	andn %r21, %r28, %r21
	ldx [%r31+176], %r22
	andn %r22, %r28, %r22
	ldx [%r31+184], %r23
	andn %r23, %r28, %r23
	ldx [%r31+192], %r24
	andn %r24, %r28, %r24
	ldx [%r31+200], %r25
	andn %r25, %r28, %r25
	ldx [%r31+208], %r26
	andn %r26, %r28, %r26
	ldx [%r31+216], %r27
	andn %r27, %r28, %r27
	ldx [%r31+224], %r28
	andn %r28, %r28, %r28
	ldx [%r31+232], %r29
	andn %r29, %r28, %r29
	.word 0xca77c000  ! 1: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 2: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 3: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 4: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xd2434000  ! 5: LDSW_R	ldsw	[%r13 + %r0], %r9
	.word 0xc2594000  ! 6: LDX_R	ldx	[%r5 + %r0], %r1
	.word 0xfe414000  ! 7: LDSW_R	ldsw	[%r5 + %r0], %r31
	.word 0xfe424000  ! 8: LDSW_R	ldsw	[%r9 + %r0], %r31
	.word 0xca77c000  ! 9: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 10: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 11: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 12: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xe6484000  ! 13: LDSB_R	ldsb	[%r1 + %r0], %r19
	.word 0xc2494000  ! 14: LDSB_R	ldsb	[%r5 + %r0], %r1
	.word 0xca27c000  ! 15: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 16: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xe652c000  ! 17: LDSH_R	ldsh	[%r11 + %r0], %r19
	.word 0xc659c000  ! 18: LDX_R	ldx	[%r7 + %r0], %r3
	.word 0xca37c000  ! 19: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xf252c000  ! 20: LDSH_R	ldsh	[%r11 + %r0], %r25
	.word 0xca77c000  ! 21: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xd6594000  ! 22: LDX_R	ldx	[%r5 + %r0], %r11
	.word 0xfe534000  ! 23: LDSH_R	ldsh	[%r13 + %r0], %r31
	.word 0xde424000  ! 24: LDSW_R	ldsw	[%r9 + %r0], %r15
	.word 0xee13c000  ! 25: LDUH_R	lduh	[%r15 + %r0], %r23
	.word 0xca37c000  ! 26: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xe211c000  ! 27: LDUH_R	lduh	[%r7 + %r0], %r17
	.word 0xda41c000  ! 28: LDSW_R	ldsw	[%r7 + %r0], %r13
	.word 0xf20a4000  ! 29: LDUB_R	ldub	[%r9 + %r0], %r25
	.word 0xde134000  ! 30: LDUH_R	lduh	[%r13 + %r0], %r15
	.word 0xca77c000  ! 31: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xee11c000  ! 32: LDUH_R	lduh	[%r7 + %r0], %r23
	.word 0xde49c000  ! 33: LDSB_R	ldsb	[%r7 + %r0], %r15
	.word 0xca37c000  ! 34: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 35: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 36: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 37: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xe6534000  ! 38: LDSH_R	ldsh	[%r13 + %r0], %r19
	.word 0xca27c000  ! 39: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 40: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xf259c000  ! 41: LDX_R	ldx	[%r7 + %r0], %r25
	.word 0xca27c000  ! 42: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 43: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 44: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 45: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 46: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xd240c000  ! 47: LDSW_R	ldsw	[%r3 + %r0], %r9
	.word 0xc240c000  ! 48: LDSW_R	ldsw	[%r3 + %r0], %r1
	.word 0xca27c000  ! 49: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 50: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 51: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xc612c000  ! 52: LDUH_R	lduh	[%r11 + %r0], %r3
	.word 0xca37c000  ! 53: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 54: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 55: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 56: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 57: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 58: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 59: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 60: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 61: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 62: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 63: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 64: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xd253c000  ! 65: LDSH_R	ldsh	[%r15 + %r0], %r9
	.word 0xca77c000  ! 66: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xe259c000  ! 67: LDX_R	ldx	[%r7 + %r0], %r17
	.word 0xca2fc000  ! 68: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 69: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xc2534000  ! 70: LDSH_R	ldsh	[%r13 + %r0], %r1
	.word 0xca27c000  ! 71: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 72: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xd6024000  ! 73: LDUW_R	lduw	[%r9 + %r0], %r11
	.word 0xe6004000  ! 74: LDUW_R	lduw	[%r1 + %r0], %r19
	.word 0xca27c000  ! 75: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xc6414000  ! 76: LDSW_R	ldsw	[%r5 + %r0], %r3
	.word 0xee48c000  ! 77: LDSB_R	ldsb	[%r3 + %r0], %r23
	.word 0xe6004000  ! 78: LDUW_R	lduw	[%r1 + %r0], %r19
	.word 0xda404000  ! 79: LDSW_R	ldsw	[%r1 + %r0], %r13
	.word 0xca4a4000  ! 80: LDSB_R	ldsb	[%r9 + %r0], %r5
	.word 0xca27c000  ! 81: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xf65b4000  ! 82: LDX_R	ldx	[%r13 + %r0], %r27
	.word 0xe2594000  ! 83: LDX_R	ldx	[%r5 + %r0], %r17
	.word 0xd2504000  ! 84: LDSH_R	ldsh	[%r1 + %r0], %r9
	.word 0xd258c000  ! 85: LDX_R	ldx	[%r3 + %r0], %r9
	.word 0xee5ac000  ! 86: LDX_R	ldx	[%r11 + %r0], %r23
	.word 0xca2fc000  ! 87: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 88: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xde4ac000  ! 89: LDSB_R	ldsb	[%r11 + %r0], %r15
	.word 0xca77c000  ! 90: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xee594000  ! 91: LDX_R	ldx	[%r5 + %r0], %r23
	.word 0xca2fc000  ! 92: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 93: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 94: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xf2484000  ! 95: LDSB_R	ldsb	[%r1 + %r0], %r25
	.word 0xfa0ac000  ! 96: LDUB_R	ldub	[%r11 + %r0], %r29
	.word 0xca77c000  ! 97: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 98: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xd65b4000  ! 99: LDX_R	ldx	[%r13 + %r0], %r11
	.word 0xea4a4000  ! 100: LDSB_R	ldsb	[%r9 + %r0], %r21
	.word 0xca2fc000  ! 101: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 102: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 103: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 104: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 105: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xfa4a4000  ! 106: LDSB_R	ldsb	[%r9 + %r0], %r29
	.word 0xe20b4000  ! 107: LDUB_R	ldub	[%r13 + %r0], %r17
	.word 0xca37c000  ! 108: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 109: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 110: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xd210c000  ! 111: LDUH_R	lduh	[%r3 + %r0], %r9
	.word 0xca27c000  ! 112: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xde08c000  ! 113: LDUB_R	ldub	[%r3 + %r0], %r15
	.word 0xca2fc000  ! 114: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xde484000  ! 115: LDSB_R	ldsb	[%r1 + %r0], %r15
	.word 0xca27c000  ! 116: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 117: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xf6104000  ! 118: LDUH_R	lduh	[%r1 + %r0], %r27
	.word 0xc212c000  ! 119: LDUH_R	lduh	[%r11 + %r0], %r1
	.word 0xca2fc000  ! 120: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xd20ac000  ! 121: LDUB_R	ldub	[%r11 + %r0], %r9
	.word 0xee59c000  ! 122: LDX_R	ldx	[%r7 + %r0], %r23
	.word 0xca37c000  ! 123: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xe650c000  ! 124: LDSH_R	ldsh	[%r3 + %r0], %r19
	.word 0xde10c000  ! 125: LDUH_R	lduh	[%r3 + %r0], %r15
	.word 0xca27c000  ! 126: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xd6434000  ! 127: LDSW_R	ldsw	[%r13 + %r0], %r11
	.word 0xca37c000  ! 128: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 129: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 130: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xf2104000  ! 131: LDUH_R	lduh	[%r1 + %r0], %r25
	.word 0xc2024000  ! 132: LDUW_R	lduw	[%r9 + %r0], %r1
	.word 0xca2fc000  ! 133: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xce10c000  ! 134: LDUH_R	lduh	[%r3 + %r0], %r7
	.word 0xca2fc000  ! 135: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xce584000  ! 136: LDX_R	ldx	[%r1 + %r0], %r7
	.word 0xca0ac000  ! 137: LDUB_R	ldub	[%r11 + %r0], %r5
	.word 0xde4ac000  ! 138: LDSB_R	ldsb	[%r11 + %r0], %r15
	.word 0xe203c000  ! 139: LDUW_R	lduw	[%r15 + %r0], %r17
	.word 0xca77c000  ! 140: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xe65bc000  ! 141: LDX_R	ldx	[%r15 + %r0], %r19
	.word 0xca27c000  ! 142: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 143: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 144: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca4a4000  ! 145: LDSB_R	ldsb	[%r9 + %r0], %r5
	.word 0xf64a4000  ! 146: LDSB_R	ldsb	[%r9 + %r0], %r27
	.word 0xca77c000  ! 147: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca08c000  ! 148: LDUB_R	ldub	[%r3 + %r0], %r5
	.word 0xc2524000  ! 149: LDSH_R	ldsh	[%r9 + %r0], %r1
	.word 0xd209c000  ! 150: LDUB_R	ldub	[%r7 + %r0], %r9
	.word 0xca2fc000  ! 151: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xde53c000  ! 152: LDSH_R	ldsh	[%r15 + %r0], %r15
	.word 0xf602c000  ! 153: LDUW_R	lduw	[%r11 + %r0], %r27
	.word 0xce51c000  ! 154: LDSH_R	ldsh	[%r7 + %r0], %r7
	.word 0xca77c000  ! 155: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 156: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xc648c000  ! 157: LDSB_R	ldsb	[%r3 + %r0], %r3
	.word 0xda01c000  ! 158: LDUW_R	lduw	[%r7 + %r0], %r13
	.word 0xca37c000  ! 159: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 160: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xc65a4000  ! 161: LDX_R	ldx	[%r9 + %r0], %r3
	.word 0xde48c000  ! 162: LDSB_R	ldsb	[%r3 + %r0], %r15
	.word 0xca77c000  ! 163: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xd6504000  ! 164: LDSH_R	ldsh	[%r1 + %r0], %r11
	.word 0xca27c000  ! 165: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xfa00c000  ! 166: LDUW_R	lduw	[%r3 + %r0], %r29
	.word 0xd2514000  ! 167: LDSH_R	ldsh	[%r5 + %r0], %r9
	.word 0xc213c000  ! 168: LDUH_R	lduh	[%r15 + %r0], %r1
	.word 0xca2fc000  ! 169: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xce4b4000  ! 170: LDSB_R	ldsb	[%r13 + %r0], %r7
	.word 0xca2fc000  ! 171: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xc64a4000  ! 172: LDSB_R	ldsb	[%r9 + %r0], %r3
	.word 0xc6124000  ! 173: LDUH_R	lduh	[%r9 + %r0], %r3
	.word 0xd2004000  ! 174: LDUW_R	lduw	[%r1 + %r0], %r9
	.word 0xe2084000  ! 175: LDUB_R	ldub	[%r1 + %r0], %r17
	.word 0xca77c000  ! 176: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xd25ac000  ! 177: LDX_R	ldx	[%r11 + %r0], %r9
	.word 0xee03c000  ! 178: LDUW_R	lduw	[%r15 + %r0], %r23
	.word 0xd2584000  ! 179: LDX_R	ldx	[%r1 + %r0], %r9
	.word 0xde43c000  ! 180: LDSW_R	ldsw	[%r15 + %r0], %r15
	.word 0xca37c000  ! 181: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 182: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xee114000  ! 183: LDUH_R	lduh	[%r5 + %r0], %r23
	.word 0xf2484000  ! 184: LDSB_R	ldsb	[%r1 + %r0], %r25
	.word 0xca77c000  ! 185: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xfe5b4000  ! 186: LDX_R	ldx	[%r13 + %r0], %r31
	.word 0xca77c000  ! 187: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xea41c000  ! 188: LDSW_R	ldsw	[%r7 + %r0], %r21
	.word 0xfe59c000  ! 189: LDX_R	ldx	[%r7 + %r0], %r31
	.word 0xca2fc000  ! 190: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 191: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 192: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 193: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xde5bc000  ! 194: LDX_R	ldx	[%r15 + %r0], %r15
	.word 0xca2fc000  ! 195: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xd252c000  ! 196: LDSH_R	ldsh	[%r11 + %r0], %r9
	.word 0xda43c000  ! 197: LDSW_R	ldsw	[%r15 + %r0], %r13
	.word 0xfe504000  ! 198: LDSH_R	ldsh	[%r1 + %r0], %r31
	.word 0xca27c000  ! 199: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xf252c000  ! 200: LDSH_R	ldsh	[%r11 + %r0], %r25
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_7:
!Initializing integer registers
Init_integer_reg6:
	setx 0x000000000000003f, %r30, %r28
	ldx [%r31+0], %r0
	andn %r0, %r28, %r0
	ldx [%r31+8], %r1
	andn %r1, %r28, %r1
	ldx [%r31+16], %r2
	andn %r2, %r28, %r2
	ldx [%r31+24], %r3
	andn %r3, %r28, %r3
	ldx [%r31+32], %r4
	andn %r4, %r28, %r4
	ldx [%r31+40], %r5
	andn %r5, %r28, %r5
	ldx [%r31+48], %r6
	andn %r6, %r28, %r6
	ldx [%r31+56], %r7
	andn %r7, %r28, %r7
	ldx [%r31+64], %r8
	andn %r8, %r28, %r8
	ldx [%r31+72], %r9
	andn %r9, %r28, %r9
	ldx [%r31+80], %r10
	andn %r10, %r28, %r10
	ldx [%r31+88], %r11
	andn %r11, %r28, %r11
	ldx [%r31+96], %r12
	andn %r12, %r28, %r12
	ldx [%r31+104], %r13
	andn %r13, %r28, %r13
	ldx [%r31+120], %r15
	andn %r15, %r28, %r15
	ldx [%r31+128], %r16
	andn %r16, %r28, %r16
	ldx [%r31+136], %r17
	andn %r17, %r28, %r17
	ldx [%r31+144], %r18
	andn %r18, %r28, %r18
	ldx [%r31+152], %r19
	andn %r19, %r28, %r19
	ldx [%r31+160], %r20
	andn %r20, %r28, %r20
	ldx [%r31+168], %r21
	andn %r21, %r28, %r21
	ldx [%r31+176], %r22
	andn %r22, %r28, %r22
	ldx [%r31+184], %r23
	andn %r23, %r28, %r23
	ldx [%r31+192], %r24
	andn %r24, %r28, %r24
	ldx [%r31+200], %r25
	andn %r25, %r28, %r25
	ldx [%r31+208], %r26
	andn %r26, %r28, %r26
	ldx [%r31+216], %r27
	andn %r27, %r28, %r27
	ldx [%r31+224], %r28
	andn %r28, %r28, %r28
	ldx [%r31+232], %r29
	andn %r29, %r28, %r29
	.word 0xca77c000  ! 1: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 2: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 3: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 4: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xda42c000  ! 5: LDSW_R	ldsw	[%r11 + %r0], %r13
	.word 0xce59c000  ! 6: LDX_R	ldx	[%r7 + %r0], %r7
	.word 0xf643c000  ! 7: LDSW_R	ldsw	[%r15 + %r0], %r27
	.word 0xe242c000  ! 8: LDSW_R	ldsw	[%r11 + %r0], %r17
	.word 0xca77c000  ! 9: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 10: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 11: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 12: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xc24a4000  ! 13: LDSB_R	ldsb	[%r9 + %r0], %r1
	.word 0xe6484000  ! 14: LDSB_R	ldsb	[%r1 + %r0], %r19
	.word 0xca27c000  ! 15: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 16: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xfa514000  ! 17: LDSH_R	ldsh	[%r5 + %r0], %r29
	.word 0xc25b4000  ! 18: LDX_R	ldx	[%r13 + %r0], %r1
	.word 0xca37c000  ! 19: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xd2514000  ! 20: LDSH_R	ldsh	[%r5 + %r0], %r9
	.word 0xca77c000  ! 21: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xce59c000  ! 22: LDX_R	ldx	[%r7 + %r0], %r7
	.word 0xf252c000  ! 23: LDSH_R	ldsh	[%r11 + %r0], %r25
	.word 0xfa41c000  ! 24: LDSW_R	ldsw	[%r7 + %r0], %r29
	.word 0xde124000  ! 25: LDUH_R	lduh	[%r9 + %r0], %r15
	.word 0xca37c000  ! 26: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xda124000  ! 27: LDUH_R	lduh	[%r9 + %r0], %r13
	.word 0xe242c000  ! 28: LDSW_R	ldsw	[%r11 + %r0], %r17
	.word 0xf609c000  ! 29: LDUB_R	ldub	[%r7 + %r0], %r27
	.word 0xca114000  ! 30: LDUH_R	lduh	[%r5 + %r0], %r5
	.word 0xca77c000  ! 31: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xe6124000  ! 32: LDUH_R	lduh	[%r9 + %r0], %r19
	.word 0xfe494000  ! 33: LDSB_R	ldsb	[%r5 + %r0], %r31
	.word 0xca37c000  ! 34: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 35: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 36: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 37: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xd2524000  ! 38: LDSH_R	ldsh	[%r9 + %r0], %r9
	.word 0xca27c000  ! 39: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 40: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xe65ac000  ! 41: LDX_R	ldx	[%r11 + %r0], %r19
	.word 0xca27c000  ! 42: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 43: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 44: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 45: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 46: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xda404000  ! 47: LDSW_R	ldsw	[%r1 + %r0], %r13
	.word 0xfe424000  ! 48: LDSW_R	ldsw	[%r9 + %r0], %r31
	.word 0xca27c000  ! 49: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 50: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 51: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xe610c000  ! 52: LDUH_R	lduh	[%r3 + %r0], %r19
	.word 0xca37c000  ! 53: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 54: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 55: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 56: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 57: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 58: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 59: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 60: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 61: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 62: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 63: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 64: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xfa524000  ! 65: LDSH_R	ldsh	[%r9 + %r0], %r29
	.word 0xca77c000  ! 66: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xfe584000  ! 67: LDX_R	ldx	[%r1 + %r0], %r31
	.word 0xca2fc000  ! 68: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 69: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xde504000  ! 70: LDSH_R	ldsh	[%r1 + %r0], %r15
	.word 0xca27c000  ! 71: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 72: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xe603c000  ! 73: LDUW_R	lduw	[%r15 + %r0], %r19
	.word 0xf200c000  ! 74: LDUW_R	lduw	[%r3 + %r0], %r25
	.word 0xca27c000  ! 75: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xf240c000  ! 76: LDSW_R	ldsw	[%r3 + %r0], %r25
	.word 0xfa4ac000  ! 77: LDSB_R	ldsb	[%r11 + %r0], %r29
	.word 0xd201c000  ! 78: LDUW_R	lduw	[%r7 + %r0], %r9
	.word 0xfe414000  ! 79: LDSW_R	ldsw	[%r5 + %r0], %r31
	.word 0xd2494000  ! 80: LDSB_R	ldsb	[%r5 + %r0], %r9
	.word 0xca27c000  ! 81: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xd6594000  ! 82: LDX_R	ldx	[%r5 + %r0], %r11
	.word 0xe65a4000  ! 83: LDX_R	ldx	[%r9 + %r0], %r19
	.word 0xee524000  ! 84: LDSH_R	ldsh	[%r9 + %r0], %r23
	.word 0xfa5a4000  ! 85: LDX_R	ldx	[%r9 + %r0], %r29
	.word 0xfe5bc000  ! 86: LDX_R	ldx	[%r15 + %r0], %r31
	.word 0xca2fc000  ! 87: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 88: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xfe494000  ! 89: LDSB_R	ldsb	[%r5 + %r0], %r31
	.word 0xca77c000  ! 90: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xce584000  ! 91: LDX_R	ldx	[%r1 + %r0], %r7
	.word 0xca2fc000  ! 92: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 93: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 94: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xc2494000  ! 95: LDSB_R	ldsb	[%r5 + %r0], %r1
	.word 0xc20bc000  ! 96: LDUB_R	ldub	[%r15 + %r0], %r1
	.word 0xca77c000  ! 97: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 98: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xee59c000  ! 99: LDX_R	ldx	[%r7 + %r0], %r23
	.word 0xea4bc000  ! 100: LDSB_R	ldsb	[%r15 + %r0], %r21
	.word 0xca2fc000  ! 101: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 102: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 103: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 104: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 105: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xf24bc000  ! 106: LDSB_R	ldsb	[%r15 + %r0], %r25
	.word 0xd20b4000  ! 107: LDUB_R	ldub	[%r13 + %r0], %r9
	.word 0xca37c000  ! 108: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 109: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 110: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xce11c000  ! 111: LDUH_R	lduh	[%r7 + %r0], %r7
	.word 0xca27c000  ! 112: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xda0ac000  ! 113: LDUB_R	ldub	[%r11 + %r0], %r13
	.word 0xca2fc000  ! 114: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xce4bc000  ! 115: LDSB_R	ldsb	[%r15 + %r0], %r7
	.word 0xca27c000  ! 116: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 117: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xee10c000  ! 118: LDUH_R	lduh	[%r3 + %r0], %r23
	.word 0xe2114000  ! 119: LDUH_R	lduh	[%r5 + %r0], %r17
	.word 0xca2fc000  ! 120: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xc20ac000  ! 121: LDUB_R	ldub	[%r11 + %r0], %r1
	.word 0xca58c000  ! 122: LDX_R	ldx	[%r3 + %r0], %r5
	.word 0xca37c000  ! 123: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xd251c000  ! 124: LDSH_R	ldsh	[%r7 + %r0], %r9
	.word 0xfa134000  ! 125: LDUH_R	lduh	[%r13 + %r0], %r29
	.word 0xca27c000  ! 126: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xf240c000  ! 127: LDSW_R	ldsw	[%r3 + %r0], %r25
	.word 0xca37c000  ! 128: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 129: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 130: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xc213c000  ! 131: LDUH_R	lduh	[%r15 + %r0], %r1
	.word 0xf2014000  ! 132: LDUW_R	lduw	[%r5 + %r0], %r25
	.word 0xca2fc000  ! 133: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xfa10c000  ! 134: LDUH_R	lduh	[%r3 + %r0], %r29
	.word 0xca2fc000  ! 135: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xfe58c000  ! 136: LDX_R	ldx	[%r3 + %r0], %r31
	.word 0xfa0b4000  ! 137: LDUB_R	ldub	[%r13 + %r0], %r29
	.word 0xde4bc000  ! 138: LDSB_R	ldsb	[%r15 + %r0], %r15
	.word 0xf602c000  ! 139: LDUW_R	lduw	[%r11 + %r0], %r27
	.word 0xca77c000  ! 140: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xe658c000  ! 141: LDX_R	ldx	[%r3 + %r0], %r19
	.word 0xca27c000  ! 142: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 143: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 144: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xfa48c000  ! 145: LDSB_R	ldsb	[%r3 + %r0], %r29
	.word 0xde48c000  ! 146: LDSB_R	ldsb	[%r3 + %r0], %r15
	.word 0xca77c000  ! 147: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xfe084000  ! 148: LDUB_R	ldub	[%r1 + %r0], %r31
	.word 0xca514000  ! 149: LDSH_R	ldsh	[%r5 + %r0], %r5
	.word 0xda094000  ! 150: LDUB_R	ldub	[%r5 + %r0], %r13
	.word 0xca2fc000  ! 151: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xde514000  ! 152: LDSH_R	ldsh	[%r5 + %r0], %r15
	.word 0xfe024000  ! 153: LDUW_R	lduw	[%r9 + %r0], %r31
	.word 0xea53c000  ! 154: LDSH_R	ldsh	[%r15 + %r0], %r21
	.word 0xca77c000  ! 155: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 156: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xf64b4000  ! 157: LDSB_R	ldsb	[%r13 + %r0], %r27
	.word 0xfa02c000  ! 158: LDUW_R	lduw	[%r11 + %r0], %r29
	.word 0xca37c000  ! 159: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 160: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xfe584000  ! 161: LDX_R	ldx	[%r1 + %r0], %r31
	.word 0xee484000  ! 162: LDSB_R	ldsb	[%r1 + %r0], %r23
	.word 0xca77c000  ! 163: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xc2504000  ! 164: LDSH_R	ldsh	[%r1 + %r0], %r1
	.word 0xca27c000  ! 165: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xfa024000  ! 166: LDUW_R	lduw	[%r9 + %r0], %r29
	.word 0xee524000  ! 167: LDSH_R	ldsh	[%r9 + %r0], %r23
	.word 0xc6104000  ! 168: LDUH_R	lduh	[%r1 + %r0], %r3
	.word 0xca2fc000  ! 169: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xee48c000  ! 170: LDSB_R	ldsb	[%r3 + %r0], %r23
	.word 0xca2fc000  ! 171: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca4a4000  ! 172: LDSB_R	ldsb	[%r9 + %r0], %r5
	.word 0xd211c000  ! 173: LDUH_R	lduh	[%r7 + %r0], %r9
	.word 0xf2014000  ! 174: LDUW_R	lduw	[%r5 + %r0], %r25
	.word 0xea09c000  ! 175: LDUB_R	ldub	[%r7 + %r0], %r21
	.word 0xca77c000  ! 176: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xde584000  ! 177: LDX_R	ldx	[%r1 + %r0], %r15
	.word 0xd600c000  ! 178: LDUW_R	lduw	[%r3 + %r0], %r11
	.word 0xca59c000  ! 179: LDX_R	ldx	[%r7 + %r0], %r5
	.word 0xf2404000  ! 180: LDSW_R	ldsw	[%r1 + %r0], %r25
	.word 0xca37c000  ! 181: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 182: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xd210c000  ! 183: LDUH_R	lduh	[%r3 + %r0], %r9
	.word 0xca48c000  ! 184: LDSB_R	ldsb	[%r3 + %r0], %r5
	.word 0xca77c000  ! 185: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xfe58c000  ! 186: LDX_R	ldx	[%r3 + %r0], %r31
	.word 0xca77c000  ! 187: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xc643c000  ! 188: LDSW_R	ldsw	[%r15 + %r0], %r3
	.word 0xee5b4000  ! 189: LDX_R	ldx	[%r13 + %r0], %r23
	.word 0xca2fc000  ! 190: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 191: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 192: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 193: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xea5a4000  ! 194: LDX_R	ldx	[%r9 + %r0], %r21
	.word 0xca2fc000  ! 195: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xe2534000  ! 196: LDSH_R	ldsh	[%r13 + %r0], %r17
	.word 0xda404000  ! 197: LDSW_R	ldsw	[%r1 + %r0], %r13
	.word 0xee50c000  ! 198: LDSH_R	ldsh	[%r3 + %r0], %r23
	.word 0xca27c000  ! 199: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xe651c000  ! 200: LDSH_R	ldsh	[%r7 + %r0], %r19
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_6:
!Initializing integer registers
Init_integer_reg5:
	setx 0x000000000000003f, %r30, %r28
	ldx [%r31+0], %r0
	andn %r0, %r28, %r0
	ldx [%r31+8], %r1
	andn %r1, %r28, %r1
	ldx [%r31+16], %r2
	andn %r2, %r28, %r2
	ldx [%r31+24], %r3
	andn %r3, %r28, %r3
	ldx [%r31+32], %r4
	andn %r4, %r28, %r4
	ldx [%r31+40], %r5
	andn %r5, %r28, %r5
	ldx [%r31+48], %r6
	andn %r6, %r28, %r6
	ldx [%r31+56], %r7
	andn %r7, %r28, %r7
	ldx [%r31+64], %r8
	andn %r8, %r28, %r8
	ldx [%r31+72], %r9
	andn %r9, %r28, %r9
	ldx [%r31+80], %r10
	andn %r10, %r28, %r10
	ldx [%r31+88], %r11
	andn %r11, %r28, %r11
	ldx [%r31+96], %r12
	andn %r12, %r28, %r12
	ldx [%r31+104], %r13
	andn %r13, %r28, %r13
	ldx [%r31+120], %r15
	andn %r15, %r28, %r15
	ldx [%r31+128], %r16
	andn %r16, %r28, %r16
	ldx [%r31+136], %r17
	andn %r17, %r28, %r17
	ldx [%r31+144], %r18
	andn %r18, %r28, %r18
	ldx [%r31+152], %r19
	andn %r19, %r28, %r19
	ldx [%r31+160], %r20
	andn %r20, %r28, %r20
	ldx [%r31+168], %r21
	andn %r21, %r28, %r21
	ldx [%r31+176], %r22
	andn %r22, %r28, %r22
	ldx [%r31+184], %r23
	andn %r23, %r28, %r23
	ldx [%r31+192], %r24
	andn %r24, %r28, %r24
	ldx [%r31+200], %r25
	andn %r25, %r28, %r25
	ldx [%r31+208], %r26
	andn %r26, %r28, %r26
	ldx [%r31+216], %r27
	andn %r27, %r28, %r27
	ldx [%r31+224], %r28
	andn %r28, %r28, %r28
	ldx [%r31+232], %r29
	andn %r29, %r28, %r29
	.word 0xca77c000  ! 1: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 2: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 3: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 4: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xe240c000  ! 5: LDSW_R	ldsw	[%r3 + %r0], %r17
	.word 0xf65bc000  ! 6: LDX_R	ldx	[%r15 + %r0], %r27
	.word 0xe642c000  ! 7: LDSW_R	ldsw	[%r11 + %r0], %r19
	.word 0xda434000  ! 8: LDSW_R	ldsw	[%r13 + %r0], %r13
	.word 0xca77c000  ! 9: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 10: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 11: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 12: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xe64bc000  ! 13: LDSB_R	ldsb	[%r15 + %r0], %r19
	.word 0xe64bc000  ! 14: LDSB_R	ldsb	[%r15 + %r0], %r19
	.word 0xca27c000  ! 15: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 16: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xfe524000  ! 17: LDSH_R	ldsh	[%r9 + %r0], %r31
	.word 0xea5ac000  ! 18: LDX_R	ldx	[%r11 + %r0], %r21
	.word 0xca37c000  ! 19: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xea53c000  ! 20: LDSH_R	ldsh	[%r15 + %r0], %r21
	.word 0xca77c000  ! 21: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xf659c000  ! 22: LDX_R	ldx	[%r7 + %r0], %r27
	.word 0xe6504000  ! 23: LDSH_R	ldsh	[%r1 + %r0], %r19
	.word 0xfe40c000  ! 24: LDSW_R	ldsw	[%r3 + %r0], %r31
	.word 0xce12c000  ! 25: LDUH_R	lduh	[%r11 + %r0], %r7
	.word 0xca37c000  ! 26: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xc611c000  ! 27: LDUH_R	lduh	[%r7 + %r0], %r3
	.word 0xc641c000  ! 28: LDSW_R	ldsw	[%r7 + %r0], %r3
	.word 0xf608c000  ! 29: LDUB_R	ldub	[%r3 + %r0], %r27
	.word 0xfa114000  ! 30: LDUH_R	lduh	[%r5 + %r0], %r29
	.word 0xca77c000  ! 31: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xc6104000  ! 32: LDUH_R	lduh	[%r1 + %r0], %r3
	.word 0xee484000  ! 33: LDSB_R	ldsb	[%r1 + %r0], %r23
	.word 0xca37c000  ! 34: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 35: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 36: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 37: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xfe514000  ! 38: LDSH_R	ldsh	[%r5 + %r0], %r31
	.word 0xca27c000  ! 39: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 40: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xde5bc000  ! 41: LDX_R	ldx	[%r15 + %r0], %r15
	.word 0xca27c000  ! 42: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 43: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 44: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 45: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 46: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xc641c000  ! 47: LDSW_R	ldsw	[%r7 + %r0], %r3
	.word 0xea424000  ! 48: LDSW_R	ldsw	[%r9 + %r0], %r21
	.word 0xca27c000  ! 49: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 50: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 51: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xe6134000  ! 52: LDUH_R	lduh	[%r13 + %r0], %r19
	.word 0xca37c000  ! 53: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 54: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 55: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 56: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 57: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 58: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 59: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 60: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 61: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 62: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 63: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 64: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xda514000  ! 65: LDSH_R	ldsh	[%r5 + %r0], %r13
	.word 0xca77c000  ! 66: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xd25b4000  ! 67: LDX_R	ldx	[%r13 + %r0], %r9
	.word 0xca2fc000  ! 68: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 69: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xd253c000  ! 70: LDSH_R	ldsh	[%r15 + %r0], %r9
	.word 0xca27c000  ! 71: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 72: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xe601c000  ! 73: LDUW_R	lduw	[%r7 + %r0], %r19
	.word 0xf6004000  ! 74: LDUW_R	lduw	[%r1 + %r0], %r27
	.word 0xca27c000  ! 75: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca404000  ! 76: LDSW_R	ldsw	[%r1 + %r0], %r5
	.word 0xee4bc000  ! 77: LDSB_R	ldsb	[%r15 + %r0], %r23
	.word 0xc603c000  ! 78: LDUW_R	lduw	[%r15 + %r0], %r3
	.word 0xd6414000  ! 79: LDSW_R	ldsw	[%r5 + %r0], %r11
	.word 0xc64a4000  ! 80: LDSB_R	ldsb	[%r9 + %r0], %r3
	.word 0xca27c000  ! 81: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xde5a4000  ! 82: LDX_R	ldx	[%r9 + %r0], %r15
	.word 0xca5ac000  ! 83: LDX_R	ldx	[%r11 + %r0], %r5
	.word 0xd6514000  ! 84: LDSH_R	ldsh	[%r5 + %r0], %r11
	.word 0xfe58c000  ! 85: LDX_R	ldx	[%r3 + %r0], %r31
	.word 0xf65a4000  ! 86: LDX_R	ldx	[%r9 + %r0], %r27
	.word 0xca2fc000  ! 87: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 88: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xde49c000  ! 89: LDSB_R	ldsb	[%r7 + %r0], %r15
	.word 0xca77c000  ! 90: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xee5a4000  ! 91: LDX_R	ldx	[%r9 + %r0], %r23
	.word 0xca2fc000  ! 92: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 93: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 94: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xf6484000  ! 95: LDSB_R	ldsb	[%r1 + %r0], %r27
	.word 0xde0b4000  ! 96: LDUB_R	ldub	[%r13 + %r0], %r15
	.word 0xca77c000  ! 97: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 98: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xd259c000  ! 99: LDX_R	ldx	[%r7 + %r0], %r9
	.word 0xca4bc000  ! 100: LDSB_R	ldsb	[%r15 + %r0], %r5
	.word 0xca2fc000  ! 101: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 102: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 103: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 104: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 105: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xf64ac000  ! 106: LDSB_R	ldsb	[%r11 + %r0], %r27
	.word 0xf209c000  ! 107: LDUB_R	ldub	[%r7 + %r0], %r25
	.word 0xca37c000  ! 108: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 109: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 110: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xfe10c000  ! 111: LDUH_R	lduh	[%r3 + %r0], %r31
	.word 0xca27c000  ! 112: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xee094000  ! 113: LDUB_R	ldub	[%r5 + %r0], %r23
	.word 0xca2fc000  ! 114: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xee494000  ! 115: LDSB_R	ldsb	[%r5 + %r0], %r23
	.word 0xca27c000  ! 116: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 117: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xf6134000  ! 118: LDUH_R	lduh	[%r13 + %r0], %r27
	.word 0xf213c000  ! 119: LDUH_R	lduh	[%r15 + %r0], %r25
	.word 0xca2fc000  ! 120: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xde08c000  ! 121: LDUB_R	ldub	[%r3 + %r0], %r15
	.word 0xe65b4000  ! 122: LDX_R	ldx	[%r13 + %r0], %r19
	.word 0xca37c000  ! 123: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xf2524000  ! 124: LDSH_R	ldsh	[%r9 + %r0], %r25
	.word 0xca114000  ! 125: LDUH_R	lduh	[%r5 + %r0], %r5
	.word 0xca27c000  ! 126: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xc242c000  ! 127: LDSW_R	ldsw	[%r11 + %r0], %r1
	.word 0xca37c000  ! 128: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 129: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 130: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xda114000  ! 131: LDUH_R	lduh	[%r5 + %r0], %r13
	.word 0xda01c000  ! 132: LDUW_R	lduw	[%r7 + %r0], %r13
	.word 0xca2fc000  ! 133: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xc611c000  ! 134: LDUH_R	lduh	[%r7 + %r0], %r3
	.word 0xca2fc000  ! 135: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xce58c000  ! 136: LDX_R	ldx	[%r3 + %r0], %r7
	.word 0xc209c000  ! 137: LDUB_R	ldub	[%r7 + %r0], %r1
	.word 0xde48c000  ! 138: LDSB_R	ldsb	[%r3 + %r0], %r15
	.word 0xce02c000  ! 139: LDUW_R	lduw	[%r11 + %r0], %r7
	.word 0xca77c000  ! 140: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xf65ac000  ! 141: LDX_R	ldx	[%r11 + %r0], %r27
	.word 0xca27c000  ! 142: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 143: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 144: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xe64bc000  ! 145: LDSB_R	ldsb	[%r15 + %r0], %r19
	.word 0xee484000  ! 146: LDSB_R	ldsb	[%r1 + %r0], %r23
	.word 0xca77c000  ! 147: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xc2094000  ! 148: LDUB_R	ldub	[%r5 + %r0], %r1
	.word 0xde52c000  ! 149: LDSH_R	ldsh	[%r11 + %r0], %r15
	.word 0xc20b4000  ! 150: LDUB_R	ldub	[%r13 + %r0], %r1
	.word 0xca2fc000  ! 151: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xd2534000  ! 152: LDSH_R	ldsh	[%r13 + %r0], %r9
	.word 0xc6014000  ! 153: LDUW_R	lduw	[%r5 + %r0], %r3
	.word 0xfa53c000  ! 154: LDSH_R	ldsh	[%r15 + %r0], %r29
	.word 0xca77c000  ! 155: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 156: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xee494000  ! 157: LDSB_R	ldsb	[%r5 + %r0], %r23
	.word 0xee004000  ! 158: LDUW_R	lduw	[%r1 + %r0], %r23
	.word 0xca37c000  ! 159: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 160: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xfe5bc000  ! 161: LDX_R	ldx	[%r15 + %r0], %r31
	.word 0xda4bc000  ! 162: LDSB_R	ldsb	[%r15 + %r0], %r13
	.word 0xca77c000  ! 163: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xde504000  ! 164: LDSH_R	ldsh	[%r1 + %r0], %r15
	.word 0xca27c000  ! 165: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xe6034000  ! 166: LDUW_R	lduw	[%r13 + %r0], %r19
	.word 0xea524000  ! 167: LDSH_R	ldsh	[%r9 + %r0], %r21
	.word 0xfe104000  ! 168: LDUH_R	lduh	[%r1 + %r0], %r31
	.word 0xca2fc000  ! 169: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xc6494000  ! 170: LDSB_R	ldsb	[%r5 + %r0], %r3
	.word 0xca2fc000  ! 171: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xd64ac000  ! 172: LDSB_R	ldsb	[%r11 + %r0], %r11
	.word 0xe612c000  ! 173: LDUH_R	lduh	[%r11 + %r0], %r19
	.word 0xd601c000  ! 174: LDUW_R	lduw	[%r7 + %r0], %r11
	.word 0xda0b4000  ! 175: LDUB_R	ldub	[%r13 + %r0], %r13
	.word 0xca77c000  ! 176: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xd6594000  ! 177: LDX_R	ldx	[%r5 + %r0], %r11
	.word 0xfa03c000  ! 178: LDUW_R	lduw	[%r15 + %r0], %r29
	.word 0xe25bc000  ! 179: LDX_R	ldx	[%r15 + %r0], %r17
	.word 0xc6424000  ! 180: LDSW_R	ldsw	[%r9 + %r0], %r3
	.word 0xca37c000  ! 181: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 182: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xde134000  ! 183: LDUH_R	lduh	[%r13 + %r0], %r15
	.word 0xd24bc000  ! 184: LDSB_R	ldsb	[%r15 + %r0], %r9
	.word 0xca77c000  ! 185: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xd258c000  ! 186: LDX_R	ldx	[%r3 + %r0], %r9
	.word 0xca77c000  ! 187: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xfe41c000  ! 188: LDSW_R	ldsw	[%r7 + %r0], %r31
	.word 0xfe58c000  ! 189: LDX_R	ldx	[%r3 + %r0], %r31
	.word 0xca2fc000  ! 190: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 191: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 192: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 193: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xde59c000  ! 194: LDX_R	ldx	[%r7 + %r0], %r15
	.word 0xca2fc000  ! 195: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xd252c000  ! 196: LDSH_R	ldsh	[%r11 + %r0], %r9
	.word 0xd240c000  ! 197: LDSW_R	ldsw	[%r3 + %r0], %r9
	.word 0xd253c000  ! 198: LDSH_R	ldsh	[%r15 + %r0], %r9
	.word 0xca27c000  ! 199: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xc251c000  ! 200: LDSH_R	ldsh	[%r7 + %r0], %r1
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_5:
!Initializing integer registers
Init_integer_reg4:
	setx 0x000000000000003f, %r30, %r28
	ldx [%r31+0], %r0
	andn %r0, %r28, %r0
	ldx [%r31+8], %r1
	andn %r1, %r28, %r1
	ldx [%r31+16], %r2
	andn %r2, %r28, %r2
	ldx [%r31+24], %r3
	andn %r3, %r28, %r3
	ldx [%r31+32], %r4
	andn %r4, %r28, %r4
	ldx [%r31+40], %r5
	andn %r5, %r28, %r5
	ldx [%r31+48], %r6
	andn %r6, %r28, %r6
	ldx [%r31+56], %r7
	andn %r7, %r28, %r7
	ldx [%r31+64], %r8
	andn %r8, %r28, %r8
	ldx [%r31+72], %r9
	andn %r9, %r28, %r9
	ldx [%r31+80], %r10
	andn %r10, %r28, %r10
	ldx [%r31+88], %r11
	andn %r11, %r28, %r11
	ldx [%r31+96], %r12
	andn %r12, %r28, %r12
	ldx [%r31+104], %r13
	andn %r13, %r28, %r13
	ldx [%r31+120], %r15
	andn %r15, %r28, %r15
	ldx [%r31+128], %r16
	andn %r16, %r28, %r16
	ldx [%r31+136], %r17
	andn %r17, %r28, %r17
	ldx [%r31+144], %r18
	andn %r18, %r28, %r18
	ldx [%r31+152], %r19
	andn %r19, %r28, %r19
	ldx [%r31+160], %r20
	andn %r20, %r28, %r20
	ldx [%r31+168], %r21
	andn %r21, %r28, %r21
	ldx [%r31+176], %r22
	andn %r22, %r28, %r22
	ldx [%r31+184], %r23
	andn %r23, %r28, %r23
	ldx [%r31+192], %r24
	andn %r24, %r28, %r24
	ldx [%r31+200], %r25
	andn %r25, %r28, %r25
	ldx [%r31+208], %r26
	andn %r26, %r28, %r26
	ldx [%r31+216], %r27
	andn %r27, %r28, %r27
	ldx [%r31+224], %r28
	andn %r28, %r28, %r28
	ldx [%r31+232], %r29
	andn %r29, %r28, %r29
	.word 0xca77c000  ! 1: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 2: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 3: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 4: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca40c000  ! 5: LDSW_R	ldsw	[%r3 + %r0], %r5
	.word 0xc6584000  ! 6: LDX_R	ldx	[%r1 + %r0], %r3
	.word 0xce424000  ! 7: LDSW_R	ldsw	[%r9 + %r0], %r7
	.word 0xc6414000  ! 8: LDSW_R	ldsw	[%r5 + %r0], %r3
	.word 0xca77c000  ! 9: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 10: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 11: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 12: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xd2484000  ! 13: LDSB_R	ldsb	[%r1 + %r0], %r9
	.word 0xfa484000  ! 14: LDSB_R	ldsb	[%r1 + %r0], %r29
	.word 0xca27c000  ! 15: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 16: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xda504000  ! 17: LDSH_R	ldsh	[%r1 + %r0], %r13
	.word 0xde58c000  ! 18: LDX_R	ldx	[%r3 + %r0], %r15
	.word 0xca37c000  ! 19: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xda53c000  ! 20: LDSH_R	ldsh	[%r15 + %r0], %r13
	.word 0xca77c000  ! 21: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xe658c000  ! 22: LDX_R	ldx	[%r3 + %r0], %r19
	.word 0xfa504000  ! 23: LDSH_R	ldsh	[%r1 + %r0], %r29
	.word 0xd6424000  ! 24: LDSW_R	ldsw	[%r9 + %r0], %r11
	.word 0xf2124000  ! 25: LDUH_R	lduh	[%r9 + %r0], %r25
	.word 0xca37c000  ! 26: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xc6114000  ! 27: LDUH_R	lduh	[%r5 + %r0], %r3
	.word 0xe640c000  ! 28: LDSW_R	ldsw	[%r3 + %r0], %r19
	.word 0xea0ac000  ! 29: LDUB_R	ldub	[%r11 + %r0], %r21
	.word 0xce11c000  ! 30: LDUH_R	lduh	[%r7 + %r0], %r7
	.word 0xca77c000  ! 31: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xee12c000  ! 32: LDUH_R	lduh	[%r11 + %r0], %r23
	.word 0xf2494000  ! 33: LDSB_R	ldsb	[%r5 + %r0], %r25
	.word 0xca37c000  ! 34: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 35: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 36: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 37: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xde50c000  ! 38: LDSH_R	ldsh	[%r3 + %r0], %r15
	.word 0xca27c000  ! 39: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 40: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xfa5ac000  ! 41: LDX_R	ldx	[%r11 + %r0], %r29
	.word 0xca27c000  ! 42: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 43: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 44: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 45: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 46: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xee43c000  ! 47: LDSW_R	ldsw	[%r15 + %r0], %r23
	.word 0xde404000  ! 48: LDSW_R	ldsw	[%r1 + %r0], %r15
	.word 0xca27c000  ! 49: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 50: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 51: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xee124000  ! 52: LDUH_R	lduh	[%r9 + %r0], %r23
	.word 0xca37c000  ! 53: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 54: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 55: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 56: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 57: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 58: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 59: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 60: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 61: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 62: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 63: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 64: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xe651c000  ! 65: LDSH_R	ldsh	[%r7 + %r0], %r19
	.word 0xca77c000  ! 66: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xf259c000  ! 67: LDX_R	ldx	[%r7 + %r0], %r25
	.word 0xca2fc000  ! 68: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 69: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xea52c000  ! 70: LDSH_R	ldsh	[%r11 + %r0], %r21
	.word 0xca27c000  ! 71: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 72: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca02c000  ! 73: LDUW_R	lduw	[%r11 + %r0], %r5
	.word 0xc6014000  ! 74: LDUW_R	lduw	[%r5 + %r0], %r3
	.word 0xca27c000  ! 75: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xd241c000  ! 76: LDSW_R	ldsw	[%r7 + %r0], %r9
	.word 0xc24ac000  ! 77: LDSB_R	ldsb	[%r11 + %r0], %r1
	.word 0xc2014000  ! 78: LDUW_R	lduw	[%r5 + %r0], %r1
	.word 0xe2404000  ! 79: LDSW_R	ldsw	[%r1 + %r0], %r17
	.word 0xf2484000  ! 80: LDSB_R	ldsb	[%r1 + %r0], %r25
	.word 0xca27c000  ! 81: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xf65ac000  ! 82: LDX_R	ldx	[%r11 + %r0], %r27
	.word 0xfe5a4000  ! 83: LDX_R	ldx	[%r9 + %r0], %r31
	.word 0xea514000  ! 84: LDSH_R	ldsh	[%r5 + %r0], %r21
	.word 0xd6584000  ! 85: LDX_R	ldx	[%r1 + %r0], %r11
	.word 0xda5ac000  ! 86: LDX_R	ldx	[%r11 + %r0], %r13
	.word 0xca2fc000  ! 87: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 88: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xea4b4000  ! 89: LDSB_R	ldsb	[%r13 + %r0], %r21
	.word 0xca77c000  ! 90: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca584000  ! 91: LDX_R	ldx	[%r1 + %r0], %r5
	.word 0xca2fc000  ! 92: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 93: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 94: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xd64b4000  ! 95: LDSB_R	ldsb	[%r13 + %r0], %r11
	.word 0xe60a4000  ! 96: LDUB_R	ldub	[%r9 + %r0], %r19
	.word 0xca77c000  ! 97: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 98: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xce5ac000  ! 99: LDX_R	ldx	[%r11 + %r0], %r7
	.word 0xee4bc000  ! 100: LDSB_R	ldsb	[%r15 + %r0], %r23
	.word 0xca2fc000  ! 101: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 102: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 103: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 104: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 105: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xda4b4000  ! 106: LDSB_R	ldsb	[%r13 + %r0], %r13
	.word 0xc60ac000  ! 107: LDUB_R	ldub	[%r11 + %r0], %r3
	.word 0xca37c000  ! 108: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 109: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 110: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xfa124000  ! 111: LDUH_R	lduh	[%r9 + %r0], %r29
	.word 0xca27c000  ! 112: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xe6084000  ! 113: LDUB_R	ldub	[%r1 + %r0], %r19
	.word 0xca2fc000  ! 114: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xfe4ac000  ! 115: LDSB_R	ldsb	[%r11 + %r0], %r31
	.word 0xca27c000  ! 116: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 117: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca11c000  ! 118: LDUH_R	lduh	[%r7 + %r0], %r5
	.word 0xe613c000  ! 119: LDUH_R	lduh	[%r15 + %r0], %r19
	.word 0xca2fc000  ! 120: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xe6084000  ! 121: LDUB_R	ldub	[%r1 + %r0], %r19
	.word 0xfa584000  ! 122: LDX_R	ldx	[%r1 + %r0], %r29
	.word 0xca37c000  ! 123: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xf6534000  ! 124: LDSH_R	ldsh	[%r13 + %r0], %r27
	.word 0xea10c000  ! 125: LDUH_R	lduh	[%r3 + %r0], %r21
	.word 0xca27c000  ! 126: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xf2414000  ! 127: LDSW_R	ldsw	[%r5 + %r0], %r25
	.word 0xca37c000  ! 128: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 129: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 130: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xf210c000  ! 131: LDUH_R	lduh	[%r3 + %r0], %r25
	.word 0xea00c000  ! 132: LDUW_R	lduw	[%r3 + %r0], %r21
	.word 0xca2fc000  ! 133: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xc2114000  ! 134: LDUH_R	lduh	[%r5 + %r0], %r1
	.word 0xca2fc000  ! 135: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xc6594000  ! 136: LDX_R	ldx	[%r5 + %r0], %r3
	.word 0xda0bc000  ! 137: LDUB_R	ldub	[%r15 + %r0], %r13
	.word 0xfa484000  ! 138: LDSB_R	ldsb	[%r1 + %r0], %r29
	.word 0xf203c000  ! 139: LDUW_R	lduw	[%r15 + %r0], %r25
	.word 0xca77c000  ! 140: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xd25a4000  ! 141: LDX_R	ldx	[%r9 + %r0], %r9
	.word 0xca27c000  ! 142: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 143: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 144: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xe24bc000  ! 145: LDSB_R	ldsb	[%r15 + %r0], %r17
	.word 0xfa4b4000  ! 146: LDSB_R	ldsb	[%r13 + %r0], %r29
	.word 0xca77c000  ! 147: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xea0bc000  ! 148: LDUB_R	ldub	[%r15 + %r0], %r21
	.word 0xc2504000  ! 149: LDSH_R	ldsh	[%r1 + %r0], %r1
	.word 0xd2084000  ! 150: LDUB_R	ldub	[%r1 + %r0], %r9
	.word 0xca2fc000  ! 151: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xe6504000  ! 152: LDSH_R	ldsh	[%r1 + %r0], %r19
	.word 0xc6024000  ! 153: LDUW_R	lduw	[%r9 + %r0], %r3
	.word 0xde53c000  ! 154: LDSH_R	ldsh	[%r15 + %r0], %r15
	.word 0xca77c000  ! 155: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 156: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xda48c000  ! 157: LDSB_R	ldsb	[%r3 + %r0], %r13
	.word 0xfa014000  ! 158: LDUW_R	lduw	[%r5 + %r0], %r29
	.word 0xca37c000  ! 159: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 160: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xe6594000  ! 161: LDX_R	ldx	[%r5 + %r0], %r19
	.word 0xfa49c000  ! 162: LDSB_R	ldsb	[%r7 + %r0], %r29
	.word 0xca77c000  ! 163: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xc251c000  ! 164: LDSH_R	ldsh	[%r7 + %r0], %r1
	.word 0xca27c000  ! 165: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xfa014000  ! 166: LDUW_R	lduw	[%r5 + %r0], %r29
	.word 0xc2514000  ! 167: LDSH_R	ldsh	[%r5 + %r0], %r1
	.word 0xfe12c000  ! 168: LDUH_R	lduh	[%r11 + %r0], %r31
	.word 0xca2fc000  ! 169: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xc24ac000  ! 170: LDSB_R	ldsb	[%r11 + %r0], %r1
	.word 0xca2fc000  ! 171: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xde484000  ! 172: LDSB_R	ldsb	[%r1 + %r0], %r15
	.word 0xe6104000  ! 173: LDUH_R	lduh	[%r1 + %r0], %r19
	.word 0xc6024000  ! 174: LDUW_R	lduw	[%r9 + %r0], %r3
	.word 0xda084000  ! 175: LDUB_R	ldub	[%r1 + %r0], %r13
	.word 0xca77c000  ! 176: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xea594000  ! 177: LDX_R	ldx	[%r5 + %r0], %r21
	.word 0xe6014000  ! 178: LDUW_R	lduw	[%r5 + %r0], %r19
	.word 0xc259c000  ! 179: LDX_R	ldx	[%r7 + %r0], %r1
	.word 0xf2414000  ! 180: LDSW_R	ldsw	[%r5 + %r0], %r25
	.word 0xca37c000  ! 181: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 182: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xee104000  ! 183: LDUH_R	lduh	[%r1 + %r0], %r23
	.word 0xea4b4000  ! 184: LDSB_R	ldsb	[%r13 + %r0], %r21
	.word 0xca77c000  ! 185: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xf65a4000  ! 186: LDX_R	ldx	[%r9 + %r0], %r27
	.word 0xca77c000  ! 187: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xf242c000  ! 188: LDSW_R	ldsw	[%r11 + %r0], %r25
	.word 0xd25b4000  ! 189: LDX_R	ldx	[%r13 + %r0], %r9
	.word 0xca2fc000  ! 190: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 191: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 192: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 193: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xda5bc000  ! 194: LDX_R	ldx	[%r15 + %r0], %r13
	.word 0xca2fc000  ! 195: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xfa53c000  ! 196: LDSH_R	ldsh	[%r15 + %r0], %r29
	.word 0xf643c000  ! 197: LDSW_R	ldsw	[%r15 + %r0], %r27
	.word 0xda504000  ! 198: LDSH_R	ldsh	[%r1 + %r0], %r13
	.word 0xca27c000  ! 199: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xce504000  ! 200: LDSH_R	ldsh	[%r1 + %r0], %r7
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_4:
!Initializing integer registers
Init_integer_reg3:
	setx 0x000000000000003f, %r30, %r28
	ldx [%r31+0], %r0
	andn %r0, %r28, %r0
	ldx [%r31+8], %r1
	andn %r1, %r28, %r1
	ldx [%r31+16], %r2
	andn %r2, %r28, %r2
	ldx [%r31+24], %r3
	andn %r3, %r28, %r3
	ldx [%r31+32], %r4
	andn %r4, %r28, %r4
	ldx [%r31+40], %r5
	andn %r5, %r28, %r5
	ldx [%r31+48], %r6
	andn %r6, %r28, %r6
	ldx [%r31+56], %r7
	andn %r7, %r28, %r7
	ldx [%r31+64], %r8
	andn %r8, %r28, %r8
	ldx [%r31+72], %r9
	andn %r9, %r28, %r9
	ldx [%r31+80], %r10
	andn %r10, %r28, %r10
	ldx [%r31+88], %r11
	andn %r11, %r28, %r11
	ldx [%r31+96], %r12
	andn %r12, %r28, %r12
	ldx [%r31+104], %r13
	andn %r13, %r28, %r13
	ldx [%r31+120], %r15
	andn %r15, %r28, %r15
	ldx [%r31+128], %r16
	andn %r16, %r28, %r16
	ldx [%r31+136], %r17
	andn %r17, %r28, %r17
	ldx [%r31+144], %r18
	andn %r18, %r28, %r18
	ldx [%r31+152], %r19
	andn %r19, %r28, %r19
	ldx [%r31+160], %r20
	andn %r20, %r28, %r20
	ldx [%r31+168], %r21
	andn %r21, %r28, %r21
	ldx [%r31+176], %r22
	andn %r22, %r28, %r22
	ldx [%r31+184], %r23
	andn %r23, %r28, %r23
	ldx [%r31+192], %r24
	andn %r24, %r28, %r24
	ldx [%r31+200], %r25
	andn %r25, %r28, %r25
	ldx [%r31+208], %r26
	andn %r26, %r28, %r26
	ldx [%r31+216], %r27
	andn %r27, %r28, %r27
	ldx [%r31+224], %r28
	andn %r28, %r28, %r28
	ldx [%r31+232], %r29
	andn %r29, %r28, %r29
	.word 0xca77c000  ! 1: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 2: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 3: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 4: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xfa41c000  ! 5: LDSW_R	ldsw	[%r7 + %r0], %r29
	.word 0xe25b4000  ! 6: LDX_R	ldx	[%r13 + %r0], %r17
	.word 0xee434000  ! 7: LDSW_R	ldsw	[%r13 + %r0], %r23
	.word 0xca43c000  ! 8: LDSW_R	ldsw	[%r15 + %r0], %r5
	.word 0xca77c000  ! 9: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 10: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 11: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 12: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xfe4ac000  ! 13: LDSB_R	ldsb	[%r11 + %r0], %r31
	.word 0xc649c000  ! 14: LDSB_R	ldsb	[%r7 + %r0], %r3
	.word 0xca27c000  ! 15: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 16: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xc250c000  ! 17: LDSH_R	ldsh	[%r3 + %r0], %r1
	.word 0xd2584000  ! 18: LDX_R	ldx	[%r1 + %r0], %r9
	.word 0xca37c000  ! 19: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xfe52c000  ! 20: LDSH_R	ldsh	[%r11 + %r0], %r31
	.word 0xca77c000  ! 21: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xd2584000  ! 22: LDX_R	ldx	[%r1 + %r0], %r9
	.word 0xca52c000  ! 23: LDSH_R	ldsh	[%r11 + %r0], %r5
	.word 0xd242c000  ! 24: LDSW_R	ldsw	[%r11 + %r0], %r9
	.word 0xca114000  ! 25: LDUH_R	lduh	[%r5 + %r0], %r5
	.word 0xca37c000  ! 26: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xf2134000  ! 27: LDUH_R	lduh	[%r13 + %r0], %r25
	.word 0xee41c000  ! 28: LDSW_R	ldsw	[%r7 + %r0], %r23
	.word 0xee0a4000  ! 29: LDUB_R	ldub	[%r9 + %r0], %r23
	.word 0xe610c000  ! 30: LDUH_R	lduh	[%r3 + %r0], %r19
	.word 0xca77c000  ! 31: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xce124000  ! 32: LDUH_R	lduh	[%r9 + %r0], %r7
	.word 0xfe4bc000  ! 33: LDSB_R	ldsb	[%r15 + %r0], %r31
	.word 0xca37c000  ! 34: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 35: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 36: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 37: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xfa534000  ! 38: LDSH_R	ldsh	[%r13 + %r0], %r29
	.word 0xca27c000  ! 39: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 40: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xc25ac000  ! 41: LDX_R	ldx	[%r11 + %r0], %r1
	.word 0xca27c000  ! 42: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 43: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 44: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 45: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 46: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xce414000  ! 47: LDSW_R	ldsw	[%r5 + %r0], %r7
	.word 0xce434000  ! 48: LDSW_R	ldsw	[%r13 + %r0], %r7
	.word 0xca27c000  ! 49: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 50: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 51: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xfa114000  ! 52: LDUH_R	lduh	[%r5 + %r0], %r29
	.word 0xca37c000  ! 53: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 54: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 55: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 56: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 57: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 58: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 59: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 60: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 61: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 62: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 63: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 64: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xd652c000  ! 65: LDSH_R	ldsh	[%r11 + %r0], %r11
	.word 0xca77c000  ! 66: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xe659c000  ! 67: LDX_R	ldx	[%r7 + %r0], %r19
	.word 0xca2fc000  ! 68: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 69: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xde514000  ! 70: LDSH_R	ldsh	[%r5 + %r0], %r15
	.word 0xca27c000  ! 71: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 72: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xf6024000  ! 73: LDUW_R	lduw	[%r9 + %r0], %r27
	.word 0xc201c000  ! 74: LDUW_R	lduw	[%r7 + %r0], %r1
	.word 0xca27c000  ! 75: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xc641c000  ! 76: LDSW_R	ldsw	[%r7 + %r0], %r3
	.word 0xda4ac000  ! 77: LDSB_R	ldsb	[%r11 + %r0], %r13
	.word 0xda01c000  ! 78: LDUW_R	lduw	[%r7 + %r0], %r13
	.word 0xe6404000  ! 79: LDSW_R	ldsw	[%r1 + %r0], %r19
	.word 0xce48c000  ! 80: LDSB_R	ldsb	[%r3 + %r0], %r7
	.word 0xca27c000  ! 81: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xce594000  ! 82: LDX_R	ldx	[%r5 + %r0], %r7
	.word 0xe65a4000  ! 83: LDX_R	ldx	[%r9 + %r0], %r19
	.word 0xfa52c000  ! 84: LDSH_R	ldsh	[%r11 + %r0], %r29
	.word 0xde5bc000  ! 85: LDX_R	ldx	[%r15 + %r0], %r15
	.word 0xf2584000  ! 86: LDX_R	ldx	[%r1 + %r0], %r25
	.word 0xca2fc000  ! 87: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 88: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xd24b4000  ! 89: LDSB_R	ldsb	[%r13 + %r0], %r9
	.word 0xca77c000  ! 90: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xc658c000  ! 91: LDX_R	ldx	[%r3 + %r0], %r3
	.word 0xca2fc000  ! 92: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 93: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 94: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xda49c000  ! 95: LDSB_R	ldsb	[%r7 + %r0], %r13
	.word 0xf60bc000  ! 96: LDUB_R	ldub	[%r15 + %r0], %r27
	.word 0xca77c000  ! 97: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 98: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xe258c000  ! 99: LDX_R	ldx	[%r3 + %r0], %r17
	.word 0xe24b4000  ! 100: LDSB_R	ldsb	[%r13 + %r0], %r17
	.word 0xca2fc000  ! 101: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 102: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 103: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 104: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 105: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xfa48c000  ! 106: LDSB_R	ldsb	[%r3 + %r0], %r29
	.word 0xf20bc000  ! 107: LDUB_R	ldub	[%r15 + %r0], %r25
	.word 0xca37c000  ! 108: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 109: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 110: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xc611c000  ! 111: LDUH_R	lduh	[%r7 + %r0], %r3
	.word 0xca27c000  ! 112: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xe2084000  ! 113: LDUB_R	ldub	[%r1 + %r0], %r17
	.word 0xca2fc000  ! 114: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xee4a4000  ! 115: LDSB_R	ldsb	[%r9 + %r0], %r23
	.word 0xca27c000  ! 116: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 117: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xde114000  ! 118: LDUH_R	lduh	[%r5 + %r0], %r15
	.word 0xfa13c000  ! 119: LDUH_R	lduh	[%r15 + %r0], %r29
	.word 0xca2fc000  ! 120: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xfa0b4000  ! 121: LDUB_R	ldub	[%r13 + %r0], %r29
	.word 0xca5ac000  ! 122: LDX_R	ldx	[%r11 + %r0], %r5
	.word 0xca37c000  ! 123: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xde51c000  ! 124: LDSH_R	ldsh	[%r7 + %r0], %r15
	.word 0xe2114000  ! 125: LDUH_R	lduh	[%r5 + %r0], %r17
	.word 0xca27c000  ! 126: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca414000  ! 127: LDSW_R	ldsw	[%r5 + %r0], %r5
	.word 0xca37c000  ! 128: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 129: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 130: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xf6104000  ! 131: LDUH_R	lduh	[%r1 + %r0], %r27
	.word 0xe6014000  ! 132: LDUW_R	lduw	[%r5 + %r0], %r19
	.word 0xca2fc000  ! 133: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xfa13c000  ! 134: LDUH_R	lduh	[%r15 + %r0], %r29
	.word 0xca2fc000  ! 135: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xee5ac000  ! 136: LDX_R	ldx	[%r11 + %r0], %r23
	.word 0xf2094000  ! 137: LDUB_R	ldub	[%r5 + %r0], %r25
	.word 0xda494000  ! 138: LDSB_R	ldsb	[%r5 + %r0], %r13
	.word 0xe2004000  ! 139: LDUW_R	lduw	[%r1 + %r0], %r17
	.word 0xca77c000  ! 140: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xce5b4000  ! 141: LDX_R	ldx	[%r13 + %r0], %r7
	.word 0xca27c000  ! 142: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 143: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 144: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xf24b4000  ! 145: LDSB_R	ldsb	[%r13 + %r0], %r25
	.word 0xfa4ac000  ! 146: LDSB_R	ldsb	[%r11 + %r0], %r29
	.word 0xca77c000  ! 147: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xfa0ac000  ! 148: LDUB_R	ldub	[%r11 + %r0], %r29
	.word 0xd6514000  ! 149: LDSH_R	ldsh	[%r5 + %r0], %r11
	.word 0xde09c000  ! 150: LDUB_R	ldub	[%r7 + %r0], %r15
	.word 0xca2fc000  ! 151: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xe250c000  ! 152: LDSH_R	ldsh	[%r3 + %r0], %r17
	.word 0xfe01c000  ! 153: LDUW_R	lduw	[%r7 + %r0], %r31
	.word 0xf6534000  ! 154: LDSH_R	ldsh	[%r13 + %r0], %r27
	.word 0xca77c000  ! 155: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 156: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xce4b4000  ! 157: LDSB_R	ldsb	[%r13 + %r0], %r7
	.word 0xd6014000  ! 158: LDUW_R	lduw	[%r5 + %r0], %r11
	.word 0xca37c000  ! 159: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 160: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xe258c000  ! 161: LDX_R	ldx	[%r3 + %r0], %r17
	.word 0xfe4a4000  ! 162: LDSB_R	ldsb	[%r9 + %r0], %r31
	.word 0xca77c000  ! 163: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xe2534000  ! 164: LDSH_R	ldsh	[%r13 + %r0], %r17
	.word 0xca27c000  ! 165: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xc6014000  ! 166: LDUW_R	lduw	[%r5 + %r0], %r3
	.word 0xf2504000  ! 167: LDSH_R	ldsh	[%r1 + %r0], %r25
	.word 0xd213c000  ! 168: LDUH_R	lduh	[%r15 + %r0], %r9
	.word 0xca2fc000  ! 169: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xfe484000  ! 170: LDSB_R	ldsb	[%r1 + %r0], %r31
	.word 0xca2fc000  ! 171: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xf24ac000  ! 172: LDSB_R	ldsb	[%r11 + %r0], %r25
	.word 0xde12c000  ! 173: LDUH_R	lduh	[%r11 + %r0], %r15
	.word 0xde03c000  ! 174: LDUW_R	lduw	[%r15 + %r0], %r15
	.word 0xde094000  ! 175: LDUB_R	ldub	[%r5 + %r0], %r15
	.word 0xca77c000  ! 176: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xe258c000  ! 177: LDX_R	ldx	[%r3 + %r0], %r17
	.word 0xfa03c000  ! 178: LDUW_R	lduw	[%r15 + %r0], %r29
	.word 0xe6594000  ! 179: LDX_R	ldx	[%r5 + %r0], %r19
	.word 0xee434000  ! 180: LDSW_R	ldsw	[%r13 + %r0], %r23
	.word 0xca37c000  ! 181: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 182: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xfa114000  ! 183: LDUH_R	lduh	[%r5 + %r0], %r29
	.word 0xfa484000  ! 184: LDSB_R	ldsb	[%r1 + %r0], %r29
	.word 0xca77c000  ! 185: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xd2594000  ! 186: LDX_R	ldx	[%r5 + %r0], %r9
	.word 0xca77c000  ! 187: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xea43c000  ! 188: LDSW_R	ldsw	[%r15 + %r0], %r21
	.word 0xce5a4000  ! 189: LDX_R	ldx	[%r9 + %r0], %r7
	.word 0xca2fc000  ! 190: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 191: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 192: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 193: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xc25b4000  ! 194: LDX_R	ldx	[%r13 + %r0], %r1
	.word 0xca2fc000  ! 195: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xea514000  ! 196: LDSH_R	ldsh	[%r5 + %r0], %r21
	.word 0xee40c000  ! 197: LDSW_R	ldsw	[%r3 + %r0], %r23
	.word 0xce534000  ! 198: LDSH_R	ldsh	[%r13 + %r0], %r7
	.word 0xca27c000  ! 199: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xda50c000  ! 200: LDSH_R	ldsh	[%r3 + %r0], %r13
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
!Initializing integer registers
Init_integer_reg2:
	setx 0x000000000000003f, %r30, %r28
	ldx [%r31+0], %r0
	andn %r0, %r28, %r0
	ldx [%r31+8], %r1
	andn %r1, %r28, %r1
	ldx [%r31+16], %r2
	andn %r2, %r28, %r2
	ldx [%r31+24], %r3
	andn %r3, %r28, %r3
	ldx [%r31+32], %r4
	andn %r4, %r28, %r4
	ldx [%r31+40], %r5
	andn %r5, %r28, %r5
	ldx [%r31+48], %r6
	andn %r6, %r28, %r6
	ldx [%r31+56], %r7
	andn %r7, %r28, %r7
	ldx [%r31+64], %r8
	andn %r8, %r28, %r8
	ldx [%r31+72], %r9
	andn %r9, %r28, %r9
	ldx [%r31+80], %r10
	andn %r10, %r28, %r10
	ldx [%r31+88], %r11
	andn %r11, %r28, %r11
	ldx [%r31+96], %r12
	andn %r12, %r28, %r12
	ldx [%r31+104], %r13
	andn %r13, %r28, %r13
	ldx [%r31+120], %r15
	andn %r15, %r28, %r15
	ldx [%r31+128], %r16
	andn %r16, %r28, %r16
	ldx [%r31+136], %r17
	andn %r17, %r28, %r17
	ldx [%r31+144], %r18
	andn %r18, %r28, %r18
	ldx [%r31+152], %r19
	andn %r19, %r28, %r19
	ldx [%r31+160], %r20
	andn %r20, %r28, %r20
	ldx [%r31+168], %r21
	andn %r21, %r28, %r21
	ldx [%r31+176], %r22
	andn %r22, %r28, %r22
	ldx [%r31+184], %r23
	andn %r23, %r28, %r23
	ldx [%r31+192], %r24
	andn %r24, %r28, %r24
	ldx [%r31+200], %r25
	andn %r25, %r28, %r25
	ldx [%r31+208], %r26
	andn %r26, %r28, %r26
	ldx [%r31+216], %r27
	andn %r27, %r28, %r27
	ldx [%r31+224], %r28
	andn %r28, %r28, %r28
	ldx [%r31+232], %r29
	andn %r29, %r28, %r29
	.word 0xca77c000  ! 1: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 2: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 3: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 4: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xf2414000  ! 5: LDSW_R	ldsw	[%r5 + %r0], %r25
	.word 0xea58c000  ! 6: LDX_R	ldx	[%r3 + %r0], %r21
	.word 0xde41c000  ! 7: LDSW_R	ldsw	[%r7 + %r0], %r15
	.word 0xd243c000  ! 8: LDSW_R	ldsw	[%r15 + %r0], %r9
	.word 0xca77c000  ! 9: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 10: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 11: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 12: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xce4bc000  ! 13: LDSB_R	ldsb	[%r15 + %r0], %r7
	.word 0xc64bc000  ! 14: LDSB_R	ldsb	[%r15 + %r0], %r3
	.word 0xca27c000  ! 15: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 16: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xda504000  ! 17: LDSH_R	ldsh	[%r1 + %r0], %r13
	.word 0xda59c000  ! 18: LDX_R	ldx	[%r7 + %r0], %r13
	.word 0xca37c000  ! 19: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xe651c000  ! 20: LDSH_R	ldsh	[%r7 + %r0], %r19
	.word 0xca77c000  ! 21: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xc658c000  ! 22: LDX_R	ldx	[%r3 + %r0], %r3
	.word 0xf250c000  ! 23: LDSH_R	ldsh	[%r3 + %r0], %r25
	.word 0xde434000  ! 24: LDSW_R	ldsw	[%r13 + %r0], %r15
	.word 0xca11c000  ! 25: LDUH_R	lduh	[%r7 + %r0], %r5
	.word 0xca37c000  ! 26: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xc2134000  ! 27: LDUH_R	lduh	[%r13 + %r0], %r1
	.word 0xee404000  ! 28: LDSW_R	ldsw	[%r1 + %r0], %r23
	.word 0xee08c000  ! 29: LDUB_R	ldub	[%r3 + %r0], %r23
	.word 0xda124000  ! 30: LDUH_R	lduh	[%r9 + %r0], %r13
	.word 0xca77c000  ! 31: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xc211c000  ! 32: LDUH_R	lduh	[%r7 + %r0], %r1
	.word 0xee4ac000  ! 33: LDSB_R	ldsb	[%r11 + %r0], %r23
	.word 0xca37c000  ! 34: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 35: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 36: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 37: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca534000  ! 38: LDSH_R	ldsh	[%r13 + %r0], %r5
	.word 0xca27c000  ! 39: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 40: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xee5a4000  ! 41: LDX_R	ldx	[%r9 + %r0], %r23
	.word 0xca27c000  ! 42: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 43: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 44: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 45: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 46: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xe242c000  ! 47: LDSW_R	ldsw	[%r11 + %r0], %r17
	.word 0xc241c000  ! 48: LDSW_R	ldsw	[%r7 + %r0], %r1
	.word 0xca27c000  ! 49: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 50: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 51: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xce104000  ! 52: LDUH_R	lduh	[%r1 + %r0], %r7
	.word 0xca37c000  ! 53: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 54: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 55: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 56: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 57: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 58: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 59: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 60: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 61: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 62: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 63: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 64: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xfe51c000  ! 65: LDSH_R	ldsh	[%r7 + %r0], %r31
	.word 0xca77c000  ! 66: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xce584000  ! 67: LDX_R	ldx	[%r1 + %r0], %r7
	.word 0xca2fc000  ! 68: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 69: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xce504000  ! 70: LDSH_R	ldsh	[%r1 + %r0], %r7
	.word 0xca27c000  ! 71: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 72: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xce02c000  ! 73: LDUW_R	lduw	[%r11 + %r0], %r7
	.word 0xf6024000  ! 74: LDUW_R	lduw	[%r9 + %r0], %r27
	.word 0xca27c000  ! 75: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xd240c000  ! 76: LDSW_R	ldsw	[%r3 + %r0], %r9
	.word 0xd649c000  ! 77: LDSB_R	ldsb	[%r7 + %r0], %r11
	.word 0xea014000  ! 78: LDUW_R	lduw	[%r5 + %r0], %r21
	.word 0xc642c000  ! 79: LDSW_R	ldsw	[%r11 + %r0], %r3
	.word 0xda4bc000  ! 80: LDSB_R	ldsb	[%r15 + %r0], %r13
	.word 0xca27c000  ! 81: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xf6584000  ! 82: LDX_R	ldx	[%r1 + %r0], %r27
	.word 0xe25ac000  ! 83: LDX_R	ldx	[%r11 + %r0], %r17
	.word 0xd6514000  ! 84: LDSH_R	ldsh	[%r5 + %r0], %r11
	.word 0xf65a4000  ! 85: LDX_R	ldx	[%r9 + %r0], %r27
	.word 0xda584000  ! 86: LDX_R	ldx	[%r1 + %r0], %r13
	.word 0xca2fc000  ! 87: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 88: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xf648c000  ! 89: LDSB_R	ldsb	[%r3 + %r0], %r27
	.word 0xca77c000  ! 90: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xd25bc000  ! 91: LDX_R	ldx	[%r15 + %r0], %r9
	.word 0xca2fc000  ! 92: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 93: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 94: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xda484000  ! 95: LDSB_R	ldsb	[%r1 + %r0], %r13
	.word 0xde0a4000  ! 96: LDUB_R	ldub	[%r9 + %r0], %r15
	.word 0xca77c000  ! 97: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 98: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xde5b4000  ! 99: LDX_R	ldx	[%r13 + %r0], %r15
	.word 0xfe49c000  ! 100: LDSB_R	ldsb	[%r7 + %r0], %r31
	.word 0xca2fc000  ! 101: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 102: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 103: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 104: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 105: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xee4b4000  ! 106: LDSB_R	ldsb	[%r13 + %r0], %r23
	.word 0xce0b4000  ! 107: LDUB_R	ldub	[%r13 + %r0], %r7
	.word 0xca37c000  ! 108: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 109: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 110: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xee134000  ! 111: LDUH_R	lduh	[%r13 + %r0], %r23
	.word 0xca27c000  ! 112: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xf20bc000  ! 113: LDUB_R	ldub	[%r15 + %r0], %r25
	.word 0xca2fc000  ! 114: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xe649c000  ! 115: LDSB_R	ldsb	[%r7 + %r0], %r19
	.word 0xca27c000  ! 116: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 117: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xfe12c000  ! 118: LDUH_R	lduh	[%r11 + %r0], %r31
	.word 0xe211c000  ! 119: LDUH_R	lduh	[%r7 + %r0], %r17
	.word 0xca2fc000  ! 120: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xfa0b4000  ! 121: LDUB_R	ldub	[%r13 + %r0], %r29
	.word 0xe6584000  ! 122: LDX_R	ldx	[%r1 + %r0], %r19
	.word 0xca37c000  ! 123: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xda524000  ! 124: LDSH_R	ldsh	[%r9 + %r0], %r13
	.word 0xc2104000  ! 125: LDUH_R	lduh	[%r1 + %r0], %r1
	.word 0xca27c000  ! 126: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xee424000  ! 127: LDSW_R	ldsw	[%r9 + %r0], %r23
	.word 0xca37c000  ! 128: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 129: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 130: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xda10c000  ! 131: LDUH_R	lduh	[%r3 + %r0], %r13
	.word 0xda02c000  ! 132: LDUW_R	lduw	[%r11 + %r0], %r13
	.word 0xca2fc000  ! 133: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xda13c000  ! 134: LDUH_R	lduh	[%r15 + %r0], %r13
	.word 0xca2fc000  ! 135: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xf659c000  ! 136: LDX_R	ldx	[%r7 + %r0], %r27
	.word 0xfa084000  ! 137: LDUB_R	ldub	[%r1 + %r0], %r29
	.word 0xd24bc000  ! 138: LDSB_R	ldsb	[%r15 + %r0], %r9
	.word 0xfa014000  ! 139: LDUW_R	lduw	[%r5 + %r0], %r29
	.word 0xca77c000  ! 140: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xda5bc000  ! 141: LDX_R	ldx	[%r15 + %r0], %r13
	.word 0xca27c000  ! 142: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 143: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 144: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xfe4bc000  ! 145: LDSB_R	ldsb	[%r15 + %r0], %r31
	.word 0xde48c000  ! 146: LDSB_R	ldsb	[%r3 + %r0], %r15
	.word 0xca77c000  ! 147: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xda0b4000  ! 148: LDUB_R	ldub	[%r13 + %r0], %r13
	.word 0xea534000  ! 149: LDSH_R	ldsh	[%r13 + %r0], %r21
	.word 0xd60bc000  ! 150: LDUB_R	ldub	[%r15 + %r0], %r11
	.word 0xca2fc000  ! 151: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xc2534000  ! 152: LDSH_R	ldsh	[%r13 + %r0], %r1
	.word 0xd602c000  ! 153: LDUW_R	lduw	[%r11 + %r0], %r11
	.word 0xee504000  ! 154: LDSH_R	ldsh	[%r1 + %r0], %r23
	.word 0xca77c000  ! 155: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 156: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xea494000  ! 157: LDSB_R	ldsb	[%r5 + %r0], %r21
	.word 0xe2004000  ! 158: LDUW_R	lduw	[%r1 + %r0], %r17
	.word 0xca37c000  ! 159: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 160: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xf25a4000  ! 161: LDX_R	ldx	[%r9 + %r0], %r25
	.word 0xea49c000  ! 162: LDSB_R	ldsb	[%r7 + %r0], %r21
	.word 0xca77c000  ! 163: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xda504000  ! 164: LDSH_R	ldsh	[%r1 + %r0], %r13
	.word 0xca27c000  ! 165: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xf6004000  ! 166: LDUW_R	lduw	[%r1 + %r0], %r27
	.word 0xd250c000  ! 167: LDSH_R	ldsh	[%r3 + %r0], %r9
	.word 0xea114000  ! 168: LDUH_R	lduh	[%r5 + %r0], %r21
	.word 0xca2fc000  ! 169: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xd2494000  ! 170: LDSB_R	ldsb	[%r5 + %r0], %r9
	.word 0xca2fc000  ! 171: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xf649c000  ! 172: LDSB_R	ldsb	[%r7 + %r0], %r27
	.word 0xda134000  ! 173: LDUH_R	lduh	[%r13 + %r0], %r13
	.word 0xda03c000  ! 174: LDUW_R	lduw	[%r15 + %r0], %r13
	.word 0xda09c000  ! 175: LDUB_R	ldub	[%r7 + %r0], %r13
	.word 0xca77c000  ! 176: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xf25bc000  ! 177: LDX_R	ldx	[%r15 + %r0], %r25
	.word 0xd203c000  ! 178: LDUW_R	lduw	[%r15 + %r0], %r9
	.word 0xca5bc000  ! 179: LDX_R	ldx	[%r15 + %r0], %r5
	.word 0xfe424000  ! 180: LDSW_R	ldsw	[%r9 + %r0], %r31
	.word 0xca37c000  ! 181: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 182: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xc212c000  ! 183: LDUH_R	lduh	[%r11 + %r0], %r1
	.word 0xfe494000  ! 184: LDSB_R	ldsb	[%r5 + %r0], %r31
	.word 0xca77c000  ! 185: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xfa594000  ! 186: LDX_R	ldx	[%r5 + %r0], %r29
	.word 0xca77c000  ! 187: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xe240c000  ! 188: LDSW_R	ldsw	[%r3 + %r0], %r17
	.word 0xf25b4000  ! 189: LDX_R	ldx	[%r13 + %r0], %r25
	.word 0xca2fc000  ! 190: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 191: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 192: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 193: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xd259c000  ! 194: LDX_R	ldx	[%r7 + %r0], %r9
	.word 0xca2fc000  ! 195: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xd6524000  ! 196: LDSH_R	ldsh	[%r9 + %r0], %r11
	.word 0xfa424000  ! 197: LDSW_R	ldsw	[%r9 + %r0], %r29
	.word 0xca50c000  ! 198: LDSH_R	ldsh	[%r3 + %r0], %r5
	.word 0xca27c000  ! 199: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xf253c000  ! 200: LDSH_R	ldsh	[%r15 + %r0], %r25
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
!Initializing integer registers
Init_integer_reg1:
	setx 0x000000000000003f, %r30, %r28
	ldx [%r31+0], %r0
	andn %r0, %r28, %r0
	ldx [%r31+8], %r1
	andn %r1, %r28, %r1
	ldx [%r31+16], %r2
	andn %r2, %r28, %r2
	ldx [%r31+24], %r3
	andn %r3, %r28, %r3
	ldx [%r31+32], %r4
	andn %r4, %r28, %r4
	ldx [%r31+40], %r5
	andn %r5, %r28, %r5
	ldx [%r31+48], %r6
	andn %r6, %r28, %r6
	ldx [%r31+56], %r7
	andn %r7, %r28, %r7
	ldx [%r31+64], %r8
	andn %r8, %r28, %r8
	ldx [%r31+72], %r9
	andn %r9, %r28, %r9
	ldx [%r31+80], %r10
	andn %r10, %r28, %r10
	ldx [%r31+88], %r11
	andn %r11, %r28, %r11
	ldx [%r31+96], %r12
	andn %r12, %r28, %r12
	ldx [%r31+104], %r13
	andn %r13, %r28, %r13
	ldx [%r31+120], %r15
	andn %r15, %r28, %r15
	ldx [%r31+128], %r16
	andn %r16, %r28, %r16
	ldx [%r31+136], %r17
	andn %r17, %r28, %r17
	ldx [%r31+144], %r18
	andn %r18, %r28, %r18
	ldx [%r31+152], %r19
	andn %r19, %r28, %r19
	ldx [%r31+160], %r20
	andn %r20, %r28, %r20
	ldx [%r31+168], %r21
	andn %r21, %r28, %r21
	ldx [%r31+176], %r22
	andn %r22, %r28, %r22
	ldx [%r31+184], %r23
	andn %r23, %r28, %r23
	ldx [%r31+192], %r24
	andn %r24, %r28, %r24
	ldx [%r31+200], %r25
	andn %r25, %r28, %r25
	ldx [%r31+208], %r26
	andn %r26, %r28, %r26
	ldx [%r31+216], %r27
	andn %r27, %r28, %r27
	ldx [%r31+224], %r28
	andn %r28, %r28, %r28
	ldx [%r31+232], %r29
	andn %r29, %r28, %r29
	.word 0xca77c000  ! 1: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 2: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 3: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 4: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xde434000  ! 5: LDSW_R	ldsw	[%r13 + %r0], %r15
	.word 0xce5bc000  ! 6: LDX_R	ldx	[%r15 + %r0], %r7
	.word 0xce43c000  ! 7: LDSW_R	ldsw	[%r15 + %r0], %r7
	.word 0xe6434000  ! 8: LDSW_R	ldsw	[%r13 + %r0], %r19
	.word 0xca77c000  ! 9: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 10: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 11: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 12: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xce4a4000  ! 13: LDSB_R	ldsb	[%r9 + %r0], %r7
	.word 0xda4ac000  ! 14: LDSB_R	ldsb	[%r11 + %r0], %r13
	.word 0xca27c000  ! 15: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 16: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xc6514000  ! 17: LDSH_R	ldsh	[%r5 + %r0], %r3
	.word 0xca5a4000  ! 18: LDX_R	ldx	[%r9 + %r0], %r5
	.word 0xca37c000  ! 19: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xe6504000  ! 20: LDSH_R	ldsh	[%r1 + %r0], %r19
	.word 0xca77c000  ! 21: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xda5bc000  ! 22: LDX_R	ldx	[%r15 + %r0], %r13
	.word 0xe251c000  ! 23: LDSH_R	ldsh	[%r7 + %r0], %r17
	.word 0xc640c000  ! 24: LDSW_R	ldsw	[%r3 + %r0], %r3
	.word 0xda104000  ! 25: LDUH_R	lduh	[%r1 + %r0], %r13
	.word 0xca37c000  ! 26: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xe612c000  ! 27: LDUH_R	lduh	[%r11 + %r0], %r19
	.word 0xce414000  ! 28: LDSW_R	ldsw	[%r5 + %r0], %r7
	.word 0xca0bc000  ! 29: LDUB_R	ldub	[%r15 + %r0], %r5
	.word 0xc212c000  ! 30: LDUH_R	lduh	[%r11 + %r0], %r1
	.word 0xca77c000  ! 31: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xfa12c000  ! 32: LDUH_R	lduh	[%r11 + %r0], %r29
	.word 0xf6484000  ! 33: LDSB_R	ldsb	[%r1 + %r0], %r27
	.word 0xca37c000  ! 34: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 35: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 36: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 37: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xfa504000  ! 38: LDSH_R	ldsh	[%r1 + %r0], %r29
	.word 0xca27c000  ! 39: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 40: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xfe594000  ! 41: LDX_R	ldx	[%r5 + %r0], %r31
	.word 0xca27c000  ! 42: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 43: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 44: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 45: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 46: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xce41c000  ! 47: LDSW_R	ldsw	[%r7 + %r0], %r7
	.word 0xe243c000  ! 48: LDSW_R	ldsw	[%r15 + %r0], %r17
	.word 0xca27c000  ! 49: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 50: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 51: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xe6114000  ! 52: LDUH_R	lduh	[%r5 + %r0], %r19
	.word 0xca37c000  ! 53: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 54: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 55: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 56: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 57: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 58: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 59: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 60: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 61: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 62: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 63: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 64: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xfa524000  ! 65: LDSH_R	ldsh	[%r9 + %r0], %r29
	.word 0xca77c000  ! 66: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xee59c000  ! 67: LDX_R	ldx	[%r7 + %r0], %r23
	.word 0xca2fc000  ! 68: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 69: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xee524000  ! 70: LDSH_R	ldsh	[%r9 + %r0], %r23
	.word 0xca27c000  ! 71: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 72: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xc2004000  ! 73: LDUW_R	lduw	[%r1 + %r0], %r1
	.word 0xee014000  ! 74: LDUW_R	lduw	[%r5 + %r0], %r23
	.word 0xca27c000  ! 75: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xea41c000  ! 76: LDSW_R	ldsw	[%r7 + %r0], %r21
	.word 0xd64bc000  ! 77: LDSB_R	ldsb	[%r15 + %r0], %r11
	.word 0xce00c000  ! 78: LDUW_R	lduw	[%r3 + %r0], %r7
	.word 0xe6414000  ! 79: LDSW_R	ldsw	[%r5 + %r0], %r19
	.word 0xd24a4000  ! 80: LDSB_R	ldsb	[%r9 + %r0], %r9
	.word 0xca27c000  ! 81: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xea584000  ! 82: LDX_R	ldx	[%r1 + %r0], %r21
	.word 0xee5a4000  ! 83: LDX_R	ldx	[%r9 + %r0], %r23
	.word 0xe2514000  ! 84: LDSH_R	ldsh	[%r5 + %r0], %r17
	.word 0xde594000  ! 85: LDX_R	ldx	[%r5 + %r0], %r15
	.word 0xce5b4000  ! 86: LDX_R	ldx	[%r13 + %r0], %r7
	.word 0xca2fc000  ! 87: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 88: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xea4a4000  ! 89: LDSB_R	ldsb	[%r9 + %r0], %r21
	.word 0xca77c000  ! 90: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca5bc000  ! 91: LDX_R	ldx	[%r15 + %r0], %r5
	.word 0xca2fc000  ! 92: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 93: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 94: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xee494000  ! 95: LDSB_R	ldsb	[%r5 + %r0], %r23
	.word 0xe6084000  ! 96: LDUB_R	ldub	[%r1 + %r0], %r19
	.word 0xca77c000  ! 97: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 98: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xee5ac000  ! 99: LDX_R	ldx	[%r11 + %r0], %r23
	.word 0xce4b4000  ! 100: LDSB_R	ldsb	[%r13 + %r0], %r7
	.word 0xca2fc000  ! 101: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 102: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 103: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 104: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 105: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xe24ac000  ! 106: LDSB_R	ldsb	[%r11 + %r0], %r17
	.word 0xf208c000  ! 107: LDUB_R	ldub	[%r3 + %r0], %r25
	.word 0xca37c000  ! 108: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 109: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 110: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xee134000  ! 111: LDUH_R	lduh	[%r13 + %r0], %r23
	.word 0xca27c000  ! 112: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xfe0a4000  ! 113: LDUB_R	ldub	[%r9 + %r0], %r31
	.word 0xca2fc000  ! 114: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xe64ac000  ! 115: LDSB_R	ldsb	[%r11 + %r0], %r19
	.word 0xca27c000  ! 116: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 117: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca11c000  ! 118: LDUH_R	lduh	[%r7 + %r0], %r5
	.word 0xd211c000  ! 119: LDUH_R	lduh	[%r7 + %r0], %r9
	.word 0xca2fc000  ! 120: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xc60a4000  ! 121: LDUB_R	ldub	[%r9 + %r0], %r3
	.word 0xce594000  ! 122: LDX_R	ldx	[%r5 + %r0], %r7
	.word 0xca37c000  ! 123: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xd2504000  ! 124: LDSH_R	ldsh	[%r1 + %r0], %r9
	.word 0xee104000  ! 125: LDUH_R	lduh	[%r1 + %r0], %r23
	.word 0xca27c000  ! 126: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xe643c000  ! 127: LDSW_R	ldsw	[%r15 + %r0], %r19
	.word 0xca37c000  ! 128: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 129: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 130: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xe611c000  ! 131: LDUH_R	lduh	[%r7 + %r0], %r19
	.word 0xee014000  ! 132: LDUW_R	lduw	[%r5 + %r0], %r23
	.word 0xca2fc000  ! 133: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xde124000  ! 134: LDUH_R	lduh	[%r9 + %r0], %r15
	.word 0xca2fc000  ! 135: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca5a4000  ! 136: LDX_R	ldx	[%r9 + %r0], %r5
	.word 0xca0b4000  ! 137: LDUB_R	ldub	[%r13 + %r0], %r5
	.word 0xf24b4000  ! 138: LDSB_R	ldsb	[%r13 + %r0], %r25
	.word 0xea024000  ! 139: LDUW_R	lduw	[%r9 + %r0], %r21
	.word 0xca77c000  ! 140: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xea5ac000  ! 141: LDX_R	ldx	[%r11 + %r0], %r21
	.word 0xca27c000  ! 142: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 143: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 144: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca49c000  ! 145: LDSB_R	ldsb	[%r7 + %r0], %r5
	.word 0xe64a4000  ! 146: LDSB_R	ldsb	[%r9 + %r0], %r19
	.word 0xca77c000  ! 147: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xf608c000  ! 148: LDUB_R	ldub	[%r3 + %r0], %r27
	.word 0xea524000  ! 149: LDSH_R	ldsh	[%r9 + %r0], %r21
	.word 0xe20a4000  ! 150: LDUB_R	ldub	[%r9 + %r0], %r17
	.word 0xca2fc000  ! 151: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xfe51c000  ! 152: LDSH_R	ldsh	[%r7 + %r0], %r31
	.word 0xfe02c000  ! 153: LDUW_R	lduw	[%r11 + %r0], %r31
	.word 0xe2534000  ! 154: LDSH_R	ldsh	[%r13 + %r0], %r17
	.word 0xca77c000  ! 155: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 156: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xd24a4000  ! 157: LDSB_R	ldsb	[%r9 + %r0], %r9
	.word 0xfa01c000  ! 158: LDUW_R	lduw	[%r7 + %r0], %r29
	.word 0xca37c000  ! 159: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 160: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca5bc000  ! 161: LDX_R	ldx	[%r15 + %r0], %r5
	.word 0xf648c000  ! 162: LDSB_R	ldsb	[%r3 + %r0], %r27
	.word 0xca77c000  ! 163: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xde53c000  ! 164: LDSH_R	ldsh	[%r15 + %r0], %r15
	.word 0xca27c000  ! 165: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xd601c000  ! 166: LDUW_R	lduw	[%r7 + %r0], %r11
	.word 0xca51c000  ! 167: LDSH_R	ldsh	[%r7 + %r0], %r5
	.word 0xca13c000  ! 168: LDUH_R	lduh	[%r15 + %r0], %r5
	.word 0xca2fc000  ! 169: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xda49c000  ! 170: LDSB_R	ldsb	[%r7 + %r0], %r13
	.word 0xca2fc000  ! 171: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xfa48c000  ! 172: LDSB_R	ldsb	[%r3 + %r0], %r29
	.word 0xca11c000  ! 173: LDUH_R	lduh	[%r7 + %r0], %r5
	.word 0xe6014000  ! 174: LDUW_R	lduw	[%r5 + %r0], %r19
	.word 0xee094000  ! 175: LDUB_R	ldub	[%r5 + %r0], %r23
	.word 0xca77c000  ! 176: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xf65ac000  ! 177: LDX_R	ldx	[%r11 + %r0], %r27
	.word 0xe602c000  ! 178: LDUW_R	lduw	[%r11 + %r0], %r19
	.word 0xd658c000  ! 179: LDX_R	ldx	[%r3 + %r0], %r11
	.word 0xd240c000  ! 180: LDSW_R	ldsw	[%r3 + %r0], %r9
	.word 0xca37c000  ! 181: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 182: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xe213c000  ! 183: LDUH_R	lduh	[%r15 + %r0], %r17
	.word 0xda49c000  ! 184: LDSB_R	ldsb	[%r7 + %r0], %r13
	.word 0xca77c000  ! 185: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xd6584000  ! 186: LDX_R	ldx	[%r1 + %r0], %r11
	.word 0xca77c000  ! 187: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xce424000  ! 188: LDSW_R	ldsw	[%r9 + %r0], %r7
	.word 0xde584000  ! 189: LDX_R	ldx	[%r1 + %r0], %r15
	.word 0xca2fc000  ! 190: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 191: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 192: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 193: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca594000  ! 194: LDX_R	ldx	[%r5 + %r0], %r5
	.word 0xca2fc000  ! 195: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xd652c000  ! 196: LDSH_R	ldsh	[%r11 + %r0], %r11
	.word 0xee414000  ! 197: LDSW_R	ldsw	[%r5 + %r0], %r23
	.word 0xca53c000  ! 198: LDSH_R	ldsh	[%r15 + %r0], %r5
	.word 0xca27c000  ! 199: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xc6514000  ! 200: LDSH_R	ldsh	[%r5 + %r0], %r3
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
!Initializing integer registers
Init_integer_reg0:
	setx 0x000000000000003f, %r30, %r28
	ldx [%r31+0], %r0
	andn %r0, %r28, %r0
	ldx [%r31+8], %r1
	andn %r1, %r28, %r1
	ldx [%r31+16], %r2
	andn %r2, %r28, %r2
	ldx [%r31+24], %r3
	andn %r3, %r28, %r3
	ldx [%r31+32], %r4
	andn %r4, %r28, %r4
	ldx [%r31+40], %r5
	andn %r5, %r28, %r5
	ldx [%r31+48], %r6
	andn %r6, %r28, %r6
	ldx [%r31+56], %r7
	andn %r7, %r28, %r7
	ldx [%r31+64], %r8
	andn %r8, %r28, %r8
	ldx [%r31+72], %r9
	andn %r9, %r28, %r9
	ldx [%r31+80], %r10
	andn %r10, %r28, %r10
	ldx [%r31+88], %r11
	andn %r11, %r28, %r11
	ldx [%r31+96], %r12
	andn %r12, %r28, %r12
	ldx [%r31+104], %r13
	andn %r13, %r28, %r13
	ldx [%r31+120], %r15
	andn %r15, %r28, %r15
	ldx [%r31+128], %r16
	andn %r16, %r28, %r16
	ldx [%r31+136], %r17
	andn %r17, %r28, %r17
	ldx [%r31+144], %r18
	andn %r18, %r28, %r18
	ldx [%r31+152], %r19
	andn %r19, %r28, %r19
	ldx [%r31+160], %r20
	andn %r20, %r28, %r20
	ldx [%r31+168], %r21
	andn %r21, %r28, %r21
	ldx [%r31+176], %r22
	andn %r22, %r28, %r22
	ldx [%r31+184], %r23
	andn %r23, %r28, %r23
	ldx [%r31+192], %r24
	andn %r24, %r28, %r24
	ldx [%r31+200], %r25
	andn %r25, %r28, %r25
	ldx [%r31+208], %r26
	andn %r26, %r28, %r26
	ldx [%r31+216], %r27
	andn %r27, %r28, %r27
	ldx [%r31+224], %r28
	andn %r28, %r28, %r28
	ldx [%r31+232], %r29
	andn %r29, %r28, %r29
	.word 0xca77c000  ! 1: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 2: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 3: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 4: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xfa41c000  ! 5: LDSW_R	ldsw	[%r7 + %r0], %r29
	.word 0xde594000  ! 6: LDX_R	ldx	[%r5 + %r0], %r15
	.word 0xf6414000  ! 7: LDSW_R	ldsw	[%r5 + %r0], %r27
	.word 0xc243c000  ! 8: LDSW_R	ldsw	[%r15 + %r0], %r1
	.word 0xca77c000  ! 9: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 10: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 11: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 12: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xce4a4000  ! 13: LDSB_R	ldsb	[%r9 + %r0], %r7
	.word 0xe6494000  ! 14: LDSB_R	ldsb	[%r5 + %r0], %r19
	.word 0xca27c000  ! 15: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 16: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xde52c000  ! 17: LDSH_R	ldsh	[%r11 + %r0], %r15
	.word 0xd25b4000  ! 18: LDX_R	ldx	[%r13 + %r0], %r9
	.word 0xca37c000  ! 19: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xfa52c000  ! 20: LDSH_R	ldsh	[%r11 + %r0], %r29
	.word 0xca77c000  ! 21: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xf658c000  ! 22: LDX_R	ldx	[%r3 + %r0], %r27
	.word 0xd2524000  ! 23: LDSH_R	ldsh	[%r9 + %r0], %r9
	.word 0xee42c000  ! 24: LDSW_R	ldsw	[%r11 + %r0], %r23
	.word 0xf2124000  ! 25: LDUH_R	lduh	[%r9 + %r0], %r25
	.word 0xca37c000  ! 26: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xc210c000  ! 27: LDUH_R	lduh	[%r3 + %r0], %r1
	.word 0xea424000  ! 28: LDSW_R	ldsw	[%r9 + %r0], %r21
	.word 0xca0a4000  ! 29: LDUB_R	ldub	[%r9 + %r0], %r5
	.word 0xfa10c000  ! 30: LDUH_R	lduh	[%r3 + %r0], %r29
	.word 0xca77c000  ! 31: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xc6114000  ! 32: LDUH_R	lduh	[%r5 + %r0], %r3
	.word 0xe24ac000  ! 33: LDSB_R	ldsb	[%r11 + %r0], %r17
	.word 0xca37c000  ! 34: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 35: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 36: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 37: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xd2524000  ! 38: LDSH_R	ldsh	[%r9 + %r0], %r9
	.word 0xca27c000  ! 39: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 40: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xe6584000  ! 41: LDX_R	ldx	[%r1 + %r0], %r19
	.word 0xca27c000  ! 42: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 43: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 44: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 45: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 46: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xee414000  ! 47: LDSW_R	ldsw	[%r5 + %r0], %r23
	.word 0xfa424000  ! 48: LDSW_R	ldsw	[%r9 + %r0], %r29
	.word 0xca27c000  ! 49: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 50: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 51: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xea134000  ! 52: LDUH_R	lduh	[%r13 + %r0], %r21
	.word 0xca37c000  ! 53: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 54: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 55: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 56: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 57: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 58: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 59: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 60: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 61: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 62: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 63: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 64: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xf252c000  ! 65: LDSH_R	ldsh	[%r11 + %r0], %r25
	.word 0xca77c000  ! 66: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xf258c000  ! 67: LDX_R	ldx	[%r3 + %r0], %r25
	.word 0xca2fc000  ! 68: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 69: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xc651c000  ! 70: LDSH_R	ldsh	[%r7 + %r0], %r3
	.word 0xca27c000  ! 71: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 72: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xd600c000  ! 73: LDUW_R	lduw	[%r3 + %r0], %r11
	.word 0xfe004000  ! 74: LDUW_R	lduw	[%r1 + %r0], %r31
	.word 0xca27c000  ! 75: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xfe41c000  ! 76: LDSW_R	ldsw	[%r7 + %r0], %r31
	.word 0xea4bc000  ! 77: LDSB_R	ldsb	[%r15 + %r0], %r21
	.word 0xca014000  ! 78: LDUW_R	lduw	[%r5 + %r0], %r5
	.word 0xf6424000  ! 79: LDSW_R	ldsw	[%r9 + %r0], %r27
	.word 0xf24a4000  ! 80: LDSB_R	ldsb	[%r9 + %r0], %r25
	.word 0xca27c000  ! 81: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca58c000  ! 82: LDX_R	ldx	[%r3 + %r0], %r5
	.word 0xf2584000  ! 83: LDX_R	ldx	[%r1 + %r0], %r25
	.word 0xd2524000  ! 84: LDSH_R	ldsh	[%r9 + %r0], %r9
	.word 0xfa58c000  ! 85: LDX_R	ldx	[%r3 + %r0], %r29
	.word 0xf25ac000  ! 86: LDX_R	ldx	[%r11 + %r0], %r25
	.word 0xca2fc000  ! 87: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 88: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xe2494000  ! 89: LDSB_R	ldsb	[%r5 + %r0], %r17
	.word 0xca77c000  ! 90: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xd2594000  ! 91: LDX_R	ldx	[%r5 + %r0], %r9
	.word 0xca2fc000  ! 92: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 93: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 94: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xe2494000  ! 95: LDSB_R	ldsb	[%r5 + %r0], %r17
	.word 0xca094000  ! 96: LDUB_R	ldub	[%r5 + %r0], %r5
	.word 0xca77c000  ! 97: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 98: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xe259c000  ! 99: LDX_R	ldx	[%r7 + %r0], %r17
	.word 0xda4a4000  ! 100: LDSB_R	ldsb	[%r9 + %r0], %r13
	.word 0xca2fc000  ! 101: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 102: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 103: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 104: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 105: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xde4bc000  ! 106: LDSB_R	ldsb	[%r15 + %r0], %r15
	.word 0xea094000  ! 107: LDUB_R	ldub	[%r5 + %r0], %r21
	.word 0xca37c000  ! 108: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 109: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 110: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xda124000  ! 111: LDUH_R	lduh	[%r9 + %r0], %r13
	.word 0xca27c000  ! 112: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xe208c000  ! 113: LDUB_R	ldub	[%r3 + %r0], %r17
	.word 0xca2fc000  ! 114: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xde494000  ! 115: LDSB_R	ldsb	[%r5 + %r0], %r15
	.word 0xca27c000  ! 116: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 117: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xf2134000  ! 118: LDUH_R	lduh	[%r13 + %r0], %r25
	.word 0xf210c000  ! 119: LDUH_R	lduh	[%r3 + %r0], %r25
	.word 0xca2fc000  ! 120: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xde09c000  ! 121: LDUB_R	ldub	[%r7 + %r0], %r15
	.word 0xfe594000  ! 122: LDX_R	ldx	[%r5 + %r0], %r31
	.word 0xca37c000  ! 123: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xde514000  ! 124: LDSH_R	ldsh	[%r5 + %r0], %r15
	.word 0xea124000  ! 125: LDUH_R	lduh	[%r9 + %r0], %r21
	.word 0xca27c000  ! 126: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xc2434000  ! 127: LDSW_R	ldsw	[%r13 + %r0], %r1
	.word 0xca37c000  ! 128: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 129: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 130: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xd213c000  ! 131: LDUH_R	lduh	[%r15 + %r0], %r9
	.word 0xce03c000  ! 132: LDUW_R	lduw	[%r15 + %r0], %r7
	.word 0xca2fc000  ! 133: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xee114000  ! 134: LDUH_R	lduh	[%r5 + %r0], %r23
	.word 0xca2fc000  ! 135: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xfe5ac000  ! 136: LDX_R	ldx	[%r11 + %r0], %r31
	.word 0xee094000  ! 137: LDUB_R	ldub	[%r5 + %r0], %r23
	.word 0xc6494000  ! 138: LDSB_R	ldsb	[%r5 + %r0], %r3
	.word 0xde004000  ! 139: LDUW_R	lduw	[%r1 + %r0], %r15
	.word 0xca77c000  ! 140: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xce58c000  ! 141: LDX_R	ldx	[%r3 + %r0], %r7
	.word 0xca27c000  ! 142: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 143: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 144: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xf24a4000  ! 145: LDSB_R	ldsb	[%r9 + %r0], %r25
	.word 0xfa4bc000  ! 146: LDSB_R	ldsb	[%r15 + %r0], %r29
	.word 0xca77c000  ! 147: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xf20bc000  ! 148: LDUB_R	ldub	[%r15 + %r0], %r25
	.word 0xea504000  ! 149: LDSH_R	ldsh	[%r1 + %r0], %r21
	.word 0xda0bc000  ! 150: LDUB_R	ldub	[%r15 + %r0], %r13
	.word 0xca2fc000  ! 151: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xde534000  ! 152: LDSH_R	ldsh	[%r13 + %r0], %r15
	.word 0xfe024000  ! 153: LDUW_R	lduw	[%r9 + %r0], %r31
	.word 0xf652c000  ! 154: LDSH_R	ldsh	[%r11 + %r0], %r27
	.word 0xca77c000  ! 155: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 156: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xe24bc000  ! 157: LDSB_R	ldsb	[%r15 + %r0], %r17
	.word 0xca024000  ! 158: LDUW_R	lduw	[%r9 + %r0], %r5
	.word 0xca37c000  ! 159: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca27c000  ! 160: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xda5a4000  ! 161: LDX_R	ldx	[%r9 + %r0], %r13
	.word 0xd24bc000  ! 162: LDSB_R	ldsb	[%r15 + %r0], %r9
	.word 0xca77c000  ! 163: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xd652c000  ! 164: LDSH_R	ldsh	[%r11 + %r0], %r11
	.word 0xca27c000  ! 165: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xd202c000  ! 166: LDUW_R	lduw	[%r11 + %r0], %r9
	.word 0xee53c000  ! 167: LDSH_R	ldsh	[%r15 + %r0], %r23
	.word 0xfe104000  ! 168: LDUH_R	lduh	[%r1 + %r0], %r31
	.word 0xca2fc000  ! 169: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xd64bc000  ! 170: LDSB_R	ldsb	[%r15 + %r0], %r11
	.word 0xca2fc000  ! 171: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xc24ac000  ! 172: LDSB_R	ldsb	[%r11 + %r0], %r1
	.word 0xca12c000  ! 173: LDUH_R	lduh	[%r11 + %r0], %r5
	.word 0xc2014000  ! 174: LDUW_R	lduw	[%r5 + %r0], %r1
	.word 0xca0a4000  ! 175: LDUB_R	ldub	[%r9 + %r0], %r5
	.word 0xca77c000  ! 176: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xfe5ac000  ! 177: LDX_R	ldx	[%r11 + %r0], %r31
	.word 0xfe024000  ! 178: LDUW_R	lduw	[%r9 + %r0], %r31
	.word 0xd6594000  ! 179: LDX_R	ldx	[%r5 + %r0], %r11
	.word 0xd6414000  ! 180: LDSW_R	ldsw	[%r5 + %r0], %r11
	.word 0xca37c000  ! 181: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca2fc000  ! 182: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xde104000  ! 183: LDUH_R	lduh	[%r1 + %r0], %r15
	.word 0xce494000  ! 184: LDSB_R	ldsb	[%r5 + %r0], %r7
	.word 0xca77c000  ! 185: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca59c000  ! 186: LDX_R	ldx	[%r7 + %r0], %r5
	.word 0xca77c000  ! 187: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xde434000  ! 188: LDSW_R	ldsw	[%r13 + %r0], %r15
	.word 0xe6594000  ! 189: LDX_R	ldx	[%r5 + %r0], %r19
	.word 0xca2fc000  ! 190: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 191: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xca77c000  ! 192: STX_R	stx	%r5, [%r31 + %r0]
	.word 0xca37c000  ! 193: STH_R	sth	%r5, [%r31 + %r0]
	.word 0xe259c000  ! 194: LDX_R	ldx	[%r7 + %r0], %r17
	.word 0xca2fc000  ! 195: STB_R	stb	%r5, [%r31 + %r0]
	.word 0xe6514000  ! 196: LDSH_R	ldsh	[%r5 + %r0], %r19
	.word 0xf2404000  ! 197: LDSW_R	ldsw	[%r1 + %r0], %r25
	.word 0xca534000  ! 198: LDSH_R	ldsh	[%r13 + %r0], %r5
	.word 0xca27c000  ! 199: STW_R	stw	%r5, [%r31 + %r0]
	.word 0xca51c000  ! 200: LDSH_R	ldsh	[%r7 + %r0], %r5

join_lbl_0_0:
ba test_pass
nop
test_pass:
    ta T_GOOD_TRAP
    nop
.global user_data_start
.data
user_data_start:    

	.xword	0x302ebc00
	.xword	0x34026200
	.xword	0x37646200
	.xword	0x3f8fa000
	.xword	0x3d7e5600
	.xword	0x3c718c00
	.xword	0x32de8800
	.xword	0x3fcd9000
	.xword	0x31e57400
	.xword	0x3295e800
	.xword	0x3433ac00
	.xword	0x302ab800
	.xword	0x3831f200
	.xword	0x387b9000
	.xword	0x35601a00
	.xword	0x304c6e00
	.xword	0x32698400
	.xword	0x32fb9000
	.xword	0x3244cc00
	.xword	0x3e1d0800
	.xword	0x366bb800
	.xword	0x378a5200
	.xword	0x3eaf9a00
	.xword	0x30ba3600
	.xword	0x3fc95200
	.xword	0x331ecc00
	.xword	0x3e4a0c00
	.xword	0x3bf37e00
	.xword	0x37556e00
	.xword	0x37d89200
	.xword	0x3e27b600
	.xword	0x31b74600
	.xword	0x358dbe00
	.xword	0x3f9af400
	.xword	0x3f914400
	.xword	0x3692ce00
	.xword	0x343bc000
	.xword	0x36a6dc00
	.xword	0x3e1fb200
	.xword	0x35d91c00
	.xword	0x353bae00
	.xword	0x3971e600
	.xword	0x33213800
	.xword	0x385ee800
	.xword	0x3f11a000
	.xword	0x37689a00
	.xword	0x31c67200
	.xword	0x3c276000
	.xword	0x30239400
	.xword	0x39c28e00
	.xword	0x35403400
	.xword	0x34ae0c00
	.xword	0x389fae00
	.xword	0x3cfdec00
	.xword	0x3ba52a00
	.xword	0x37724400
	.xword	0x3b268400
	.xword	0x34e37600
	.xword	0x3c7aa600
	.xword	0x32870200
	.xword	0x32a1ba00
	.xword	0x3ecef400
	.xword	0x3f5b3e00
	.xword	0x368fc000
	.xword	0x34b01e00
	.xword	0x30484c00
	.xword	0x34526c00
	.xword	0x38b58000
	.xword	0x3ec30400
	.xword	0x3a490a00
	.xword	0x37ddaa00
	.xword	0x36202a00
	.xword	0x399f3000
	.xword	0x38d37400
	.xword	0x36a01600
	.xword	0x368dfa00
	.xword	0x3cfe4400
	.xword	0x3c640000
	.xword	0x3339e200
	.xword	0x3ab9de00
	.xword	0x3cb5c600
	.xword	0x3cc2a200
	.xword	0x30cf0000
	.xword	0x39e54600
	.xword	0x331e1c00
	.xword	0x340ffa00
	.xword	0x322efa00
	.xword	0x3aa6c800
	.xword	0x3ac3a400
	.xword	0x35e38a00
	.xword	0x30813600
	.xword	0x34ed8c00
	.xword	0x31cdda00
	.xword	0x33e0f200
	.xword	0x3a497000
	.xword	0x30af1800
	.xword	0x3c488400
	.xword	0x3a8ee400
	.xword	0x3ba55400
	.xword	0x31d4c200
	.xword	0x34e85200
	.xword	0x3d35e000
	.xword	0x3a246200
	.xword	0x3e69a200
	.xword	0x3512e400
	.xword	0x31ceac00
	.xword	0x3b2c9800
	.xword	0x3d5d5600
	.xword	0x3b903e00
	.xword	0x39f7aa00
	.xword	0x32fbc200
	.xword	0x34167800
	.xword	0x3be21e00
	.xword	0x37ee0a00
	.xword	0x33de8e00
	.xword	0x37a35c00
	.xword	0x36ca3400
	.xword	0x367f9a00
	.xword	0x3f98f800
	.xword	0x36393600
	.xword	0x3064fa00
	.xword	0x3da3e200
	.xword	0x3b949c00
	.xword	0x3ab22c00
	.xword	0x3f6bb400
	.xword	0x391f3800
	.xword	0x3bd90800
	.xword	0x344f2c00
	.xword	0x3dc10000
	.xword	0x3b82e400
	.xword	0x309e3000
	.xword	0x3d3d1600
	.xword	0x347aa800
	.xword	0x38690a00
	.xword	0x344e7400
	.xword	0x376d3200
	.xword	0x36978800
	.xword	0x3e3b0000
	.xword	0x35609a00
	.xword	0x3a686a00
	.xword	0x39606200
	.xword	0x39b54400
	.xword	0x389b8000
	.xword	0x3b16b800
	.xword	0x33384400
	.xword	0x3bd1d000
	.xword	0x33676e00
	.xword	0x3fe40e00
	.xword	0x39009200
	.xword	0x38ff1c00
	.xword	0x36f53e00
	.xword	0x3a34fa00
	.xword	0x30209a00
	.xword	0x39747a00
	.xword	0x3e480800
	.xword	0x310a0000
	.xword	0x3640fc00
	.xword	0x35399a00
	.xword	0x30928800
	.xword	0x34de8c00
	.xword	0x3c788000
	.xword	0x3b811800
	.xword	0x3baaea00
	.xword	0x3893d800
	.xword	0x3a8baa00
	.xword	0x34f1a800
	.xword	0x31483000
	.xword	0x332f3600
	.xword	0x3e6b6c00
	.xword	0x31be7400
	.xword	0x3acf5200
	.xword	0x3ccdee00
	.xword	0x37f46e00
	.xword	0x3b8d4a00
	.xword	0x3d440600
	.xword	0x3f5a1a00
	.xword	0x38c59e00
	.xword	0x3abc6e00
	.xword	0x34b95200
	.xword	0x33b87a00
	.xword	0x31ea5c00
	.xword	0x3ac90e00
	.xword	0x377f4200
	.xword	0x357db600
	.xword	0x3d63ea00
	.xword	0x326cb600
	.xword	0x3667be00
	.xword	0x3ac62e00
	.xword	0x35175600
	.xword	0x34dd1600
	.xword	0x345ff400
	.xword	0x3313ae00
	.xword	0x32e57000
	.xword	0x3c7aac00
	.xword	0x38f08400
	.xword	0x3e998200
	.xword	0x38129200
	.xword	0x35dcc600
	.xword	0x391fcc00
	.xword	0x3f3df800
	.xword	0x3f093600
	.xword	0x32f1c600
	.xword	0x34aefe00
	.xword	0x325d2400
	.xword	0x3d911800
	.xword	0x38358a00
	.xword	0x37e6f400
	.xword	0x32c16600
	.xword	0x38371200
	.xword	0x3c5ac400
	.xword	0x36b1ae00
	.xword	0x30dd0c00
	.xword	0x321d1200
	.xword	0x3a168e00
	.xword	0x3feebe00
	.xword	0x3ec83200
	.xword	0x3f5b2a00
	.xword	0x30ee3a00
	.xword	0x30f20200
	.xword	0x3a556a00
	.xword	0x30abda00
	.xword	0x36489c00
	.xword	0x3fca1200
	.xword	0x3d945e00
	.xword	0x37372600
	.xword	0x3ec6b600
	.xword	0x3ebdd600
	.xword	0x30266400
	.xword	0x3830dc00
	.xword	0x3b7b9000
	.xword	0x399a3800
	.xword	0x364ac600
	.xword	0x3092f600
	.xword	0x3963cc00
	.xword	0x30a36c00
	.xword	0x33e06000
	.xword	0x3d69be00
	.xword	0x3b829800
	.xword	0x3bf76a00
	.xword	0x3a97a600
	.xword	0x3881f000
	.xword	0x3162c800
	.xword	0x32229e00
	.xword	0x3f4b2e00
	.xword	0x37871000
	.xword	0x34353000
	.xword	0x3c4bc800
	.xword	0x39a25200
	.xword	0x35534200
	.xword	0x3fe49000
	.xword	0x38d2ec00
	.xword	0x3e06dc00
	.xword	0x33c52c00
	.xword	0x3fda1600
	.xword	0x301e2000
	.xword	0x3e2f3400
	.xword	0x3f13a400
	.xword	0x328b6a00
	.xword	0x3906b000
	.xword	0x3f38bc00
	.xword	0x3f183400
	.xword	0x3defa200
	.xword	0x31b0ce00
	.xword	0x38cb5e00
	.xword	0x3f84fc00
	.xword	0x3d601e00
	.xword	0x3ea8d800
	.xword	0x32694800
	.xword	0x3d503a00
	.xword	0x33a78c00
	.xword	0x31477400
	.xword	0x324ef200
	.xword	0x3e001200
	.xword	0x354efc00
	.xword	0x3d89d000
	.xword	0x3f99a600
	.xword	0x37611600
	.xword	0x3bdc9a00
	.xword	0x38cb0e00
	.xword	0x3b61d200
	.xword	0x3806e800
	.xword	0x326bdc00
	.xword	0x388f3000
	.xword	0x317e3c00
	.xword	0x3b417800
	.xword	0x3a044400
	.xword	0x395c5c00
	.xword	0x3d89ae00
	.xword	0x354cde00
	.xword	0x38cc4e00
	.xword	0x384fde00
	.xword	0x36808e00
	.xword	0x380d2000
	.xword	0x3c5dc800
	.xword	0x33ad2c00
	.xword	0x31e6fe00
	.xword	0x3ba3a200
	.xword	0x35350600
	.xword	0x3e03b800
	.xword	0x3b497800
	.xword	0x3419f200
	.xword	0x3ea9ac00
	.xword	0x36ba8e00
	.xword	0x3168e200
	.xword	0x39dac800
	.xword	0x37527600
	.xword	0x3b142600
	.xword	0x39aa7400
	.xword	0x31aec200
	.xword	0x33cbea00
	.xword	0x31b18000
	.xword	0x32abd800
	.xword	0x3b120200
	.xword	0x3d638200
	.xword	0x3bc10c00
	.xword	0x3983bc00
	.xword	0x3d1bca00
	.xword	0x39457200
	.xword	0x3db88000
	.xword	0x36c1dc00
	.xword	0x3f35ac00
	.xword	0x31457e00
	.xword	0x36834600
	.xword	0x3e036a00
	.xword	0x38d59800
	.xword	0x3e6de000
	.xword	0x3fd18c00
	.xword	0x3bd06400
	.xword	0x3b8e3400
	.xword	0x3be53e00
	.xword	0x340c2800
	.xword	0x33fc1600
	.xword	0x3649c200
	.xword	0x3a093000
	.xword	0x37e38a00
	.xword	0x35e98400
	.xword	0x33ca9800
	.xword	0x3d0f7400
	.xword	0x37c95600
	.xword	0x39030c00
	.xword	0x32ece400
	.xword	0x375a4400
	.xword	0x3a00ce00
	.xword	0x3fbf1800
	.xword	0x37ee0a00
	.xword	0x3562e400
	.xword	0x36996800
	.xword	0x3fb5d200
	.xword	0x3455ca00
	.xword	0x38a44600
	.xword	0x30c42000
	.xword	0x3c4ea600
	.xword	0x3ec3f000
	.xword	0x3c7b8c00
	.xword	0x360e7e00
	.xword	0x32d8dc00
	.xword	0x3c2c4a00
	.xword	0x36558600
	.xword	0x336c5000
	.xword	0x3bba7a00
	.xword	0x3272b200
	.xword	0x3fdb9600
	.xword	0x32910a00
	.xword	0x32305000
	.xword	0x307d4800
	.xword	0x32f2be00
	.xword	0x32620600
	.xword	0x32c13000
	.xword	0x3b970e00
	.xword	0x3bda3a00
	.xword	0x3fe80e00
	.xword	0x39f9c400
	.xword	0x3d93aa00
	.xword	0x34857c00
	.xword	0x3e5e8000
	.xword	0x353d6200
	.xword	0x3b35c400
	.xword	0x398b4200
	.xword	0x3741aa00
	.xword	0x3edb9000
	.xword	0x3b38c400
	.xword	0x37921400
	.xword	0x3e074600
	.xword	0x35cd4400
	.xword	0x3f8e3000
	.xword	0x3b2eb600
	.xword	0x3e4ec600
	.xword	0x305f5200
	.xword	0x30e69200
	.xword	0x30ec6000
	.xword	0x3d088c00
	.xword	0x3cd41000
	.xword	0x30bc4600
	.xword	0x32353a00
	.xword	0x3748f600
	.xword	0x317bea00
	.xword	0x32d9d600
	.xword	0x3741bc00
	.xword	0x3074ee00
	.xword	0x3d46c800
	.xword	0x3714bc00
	.xword	0x31420000
	.xword	0x3bd67600
	.xword	0x39e5b800
	.xword	0x33b8f200
	.xword	0x3296fc00
	.xword	0x349dec00
	.xword	0x3edcb200
	.xword	0x31ca0a00
	.xword	0x3fb05200
	.xword	0x3be9e000
	.xword	0x3129a800
	.xword	0x3d019400
	.xword	0x3b5c0a00
	.xword	0x3f394000
	.xword	0x3b447e00
	.xword	0x39a10c00
	.xword	0x3c0fb400
	.xword	0x32992e00
	.xword	0x3a321600
	.xword	0x3c96b400
	.xword	0x336ac400
	.xword	0x32665400
	.xword	0x33bb9000
	.xword	0x3f2ff800
	.xword	0x38700e00
	.xword	0x30babe00
	.xword	0x3de95c00
	.xword	0x398ec400
	.xword	0x35123200
	.xword	0x32ee5400
	.xword	0x3a236200
	.xword	0x30a35c00
	.xword	0x3b933200
	.xword	0x37df5e00
	.xword	0x3e491c00
	.xword	0x3cc68400
	.xword	0x31741400
	.xword	0x3c3e4a00
	.xword	0x3acf4200
	.xword	0x3ced2800
	.xword	0x321f3200
	.xword	0x3da3f000
	.xword	0x34020000
	.xword	0x3923b200
	.xword	0x3e481800
	.xword	0x3fe01c00
	.xword	0x35400400
	.xword	0x37deb600
	.xword	0x3c66d400
	.xword	0x39d6b800
	.xword	0x31eb8200
	.xword	0x39745400
	.xword	0x3564a800
	.xword	0x38b44a00
	.xword	0x3d3dba00
	.xword	0x33e9c400
	.xword	0x329b4800
	.xword	0x34329e00
	.xword	0x30824000
	.xword	0x36edea00
	.xword	0x33939600
	.xword	0x34847800
	.xword	0x39ff1800
	.xword	0x3f3d4600
	.xword	0x368a7e00
	.xword	0x32037c00
	.xword	0x38573e00
	.xword	0x34757e00
	.xword	0x3d6e2800
	.xword	0x32af6600
	.xword	0x35f52e00
	.xword	0x3f9e8800
	.xword	0x3ab5c600
	.xword	0x33e3a400
	.xword	0x3e8f1400
	.xword	0x3a5e9200
	.xword	0x3f226000
	.xword	0x3eff8200
	.xword	0x3e324600
	.xword	0x3903a800
	.xword	0x3c7bd600
	.xword	0x33071200
	.xword	0x3e56ac00
	.xword	0x333ac000
	.xword	0x3efdcc00
	.xword	0x3e397200
	.xword	0x3e490e00
	.xword	0x3cee4e00
	.xword	0x31bcda00
	.xword	0x37cd1200
	.xword	0x38a5d600
	.xword	0x3eef7400
	.xword	0x33b31e00
	.xword	0x3a5bb200
	.xword	0x30948000
	.xword	0x3b2e0200
	.xword	0x3fbcfe00
	.xword	0x3acc7c00
	.xword	0x377b4400
	.xword	0x386d5600
	.xword	0x30599c00
	.xword	0x3776ee00
	.xword	0x38499200
	.xword	0x38204200
	.xword	0x33b19800
	.xword	0x375cf800
	.xword	0x3f480800
	.xword	0x376f9e00
	.xword	0x332dfc00
	.xword	0x37eb1000
	.xword	0x34845a00
	.xword	0x3d95d800
	.xword	0x3dc33200
	.xword	0x33d07e00
	.xword	0x3e1f8600
	.xword	0x39596800
	.xword	0x3fc4ce00
	.xword	0x39a9bc00
	.xword	0x39f0c400
	.xword	0x335bd800
	.xword	0x31c3fe00
	.xword	0x3dbf1c00
	.xword	0x31366200
	.xword	0x38bfb200
	.xword	0x3f2c6200
	.xword	0x3f6f2a00
	.xword	0x33f32a00
	.xword	0x35e02600
	.xword	0x32922600
	.xword	0x35d92a00
	.xword	0x3310ee00
	.xword	0x33637e00
	.xword	0x34c76c00
	.xword	0x3e0fea00
	.xword	0x3598b800
	.xword	0x36d9b400
	.xword	0x32b85e00
	.xword	0x32fdb000
	.xword	0x30d39600
	.xword	0x3569fc00
	.xword	0x38f1fa00
	.xword	0x33c65000
	.xword	0x303c9a00
	.xword	0x3b915000
	.xword	0x37098200
	.xword	0x36830800
	.xword	0x33de0800
	.xword	0x348bf000
	.xword	0x350a7800
	.xword	0x3388a400
	.xword	0x3ab35400
	.xword	0x3e890400
	.xword	0x37464400
	.xword	0x3eafae00
	.xword	0x3a82da00
	.xword	0x3b32d400
	.xword	0x3d690e00
	.xword	0x30de5000
	.xword	0x3609e600
	.xword	0x3ccf8800
	.xword	0x30ac4e00
	.xword	0x39404000
	.xword	0x3d2ae200
	.xword	0x3114f000
	.xword	0x3434a800
	.xword	0x31a17a00
	.xword	0x3df22c00
	.xword	0x32eeb000
	.xword	0x311e5200
	.xword	0x34974000
	.xword	0x3e3f8400
	.xword	0x39665800
	.xword	0x325ee200
	.xword	0x3fdc3e00
	.xword	0x35bd9a00
	.xword	0x3a737c00
	.xword	0x3d87b200
	.xword	0x3a8dec00
	.xword	0x351a5600
	.xword	0x3e208200
	.xword	0x32bf8000
	.xword	0x357c8400
	.xword	0x3f128800
	.xword	0x3a0b4a00
	.xword	0x3308e800
	.xword	0x3fec5000
	.xword	0x37afe600
	.xword	0x32f51c00
	.xword	0x38a74c00
	.xword	0x3ba4f800
	.xword	0x3632bc00
	.xword	0x3b5ccc00
	.xword	0x3d7bca00
	.xword	0x3276e200
	.xword	0x3b2a1e00
	.xword	0x3cd85e00
	.xword	0x3d316a00
	.xword	0x3247c800
	.xword	0x3cdbe600
	.xword	0x3e8b2600
	.xword	0x34aec200
	.xword	0x382f0000
	.xword	0x32ce0e00
	.xword	0x3b33c600
	.xword	0x364bac00
	.xword	0x33764c00
	.xword	0x3a976a00
	.xword	0x3c5eec00
	.xword	0x3a125a00
	.xword	0x32460200
	.xword	0x3b027600
	.xword	0x38cf4200
	.xword	0x355d8e00
	.xword	0x32002a00
	.xword	0x36ba9600
	.xword	0x3b083000
	.xword	0x30ce2000
	.xword	0x38125600
	.xword	0x3de70400
	.xword	0x37e9be00
	.xword	0x3f341a00
	.xword	0x32516800
	.xword	0x38209400
	.xword	0x3ae28000
	.xword	0x3ed3c600
	.xword	0x39480a00
	.xword	0x3ea42600
	.xword	0x329cd600
	.xword	0x32bfa400
	.xword	0x3d1e7a00
	.xword	0x38a3b000
	.xword	0x3ec66200
	.xword	0x334e2200
	.xword	0x31ea8c00
	.xword	0x3b4c5200
	.xword	0x3e2f6a00
	.xword	0x3e5ac800
	.xword	0x3640e800
	.xword	0x3abe6a00
	.xword	0x38d2f000
	.xword	0x38451e00
	.xword	0x3ca12e00
	.xword	0x3598cc00
	.xword	0x3d5d5400
	.xword	0x3cf1f200
	.xword	0x33904a00
	.xword	0x3bd2fa00
	.xword	0x30b31200
	.xword	0x3ee54000
	.xword	0x36aa0a00
	.xword	0x301d3000
	.xword	0x34bc7000
	.xword	0x33270400
	.xword	0x308a1200
	.xword	0x33794a00
	.xword	0x30808200
	.xword	0x3fc33e00
	.xword	0x3a37be00
	.xword	0x35631800
	.xword	0x37ca4a00
	.xword	0x3bb38600
	.xword	0x3bfcb000
	.xword	0x3a840800
	.xword	0x395b4800
	.xword	0x3cb21c00
	.xword	0x3029bc00
	.xword	0x3c1ffe00
	.xword	0x382b5800
	.xword	0x3d7c6200
	.xword	0x39569e00
	.xword	0x34e0a600
	.xword	0x3e70c000
	.xword	0x3efa2c00
	.xword	0x316b4c00
	.xword	0x3884b200
	.xword	0x3eb4de00
	.xword	0x308aaa00
	.xword	0x35c50e00
	.xword	0x32678a00
	.xword	0x3fd6d200
	.xword	0x302fe200
	.xword	0x334ad800
	.xword	0x300f9800
	.xword	0x3f397600
	.xword	0x3dda6e00
	.xword	0x3a948a00
	.xword	0x3b0cdc00
	.xword	0x3ba3b400
	.xword	0x3a5bb400
	.xword	0x33b44600
	.xword	0x39084000
	.xword	0x3c7b0400
	.xword	0x38bb2000
	.xword	0x3f61fe00
	.xword	0x301c7200
	.xword	0x36044c00
	.xword	0x342aca00
	.xword	0x39ded600
	.xword	0x3e700c00
	.xword	0x35f0f000
	.xword	0x32744c00
	.xword	0x33974800
	.xword	0x35884400
	.xword	0x3cfebe00
	.xword	0x357a6c00
	.xword	0x304a7800
	.xword	0x33547400
	.xword	0x37e23e00
	.xword	0x3d099c00
	.xword	0x3733d200
	.xword	0x38fab400
	.xword	0x36975a00
	.xword	0x3c357200
	.xword	0x36ebbe00
	.xword	0x32d39200
	.xword	0x35a86c00
	.xword	0x32a72200
	.xword	0x3a395200
	.xword	0x35553c00
	.xword	0x346cf200
	.xword	0x381a6e00
	.xword	0x3d472800
	.xword	0x3c782800
	.xword	0x36aeac00
	.xword	0x3029ae00
	.xword	0x34ae6a00
	.xword	0x3d1cac00
	.xword	0x3f2cae00
	.xword	0x30601c00
	.xword	0x3b069200
	.xword	0x3ec28400
	.xword	0x36113000
	.xword	0x3c012400
	.xword	0x303b2800
	.xword	0x3086a800
	.xword	0x3891aa00
	.xword	0x3009e600
	.xword	0x39423000
	.xword	0x34b7ac00
	.xword	0x389d3200
	.xword	0x3275ca00
	.xword	0x32a0b000
	.xword	0x3362bc00
	.xword	0x3e751e00
	.xword	0x395cba00
	.xword	0x39271600
	.xword	0x358fbc00
	.xword	0x3791fa00
	.xword	0x3c03b600
	.xword	0x3678e800
	.xword	0x35d41c00
	.xword	0x33e54200
	.xword	0x3223e600
	.xword	0x32fc0e00
	.xword	0x3c3cf600
	.xword	0x37486400
	.xword	0x39d96e00
	.xword	0x37534a00
	.xword	0x34a35400
	.xword	0x3559a400
	.xword	0x31269800
	.xword	0x3cdc9600
	.xword	0x33a87400
	.xword	0x35fe1200
	.xword	0x3998a800
	.xword	0x32feb600
	.xword	0x39fc2a00
	.xword	0x315e9c00
	.xword	0x383dfa00
	.xword	0x35106400
	.xword	0x3fb10800
	.xword	0x3008f200
	.xword	0x3f636800
	.xword	0x32bff000
	.xword	0x3104f600
	.xword	0x3c04b600
	.xword	0x38a17600
	.xword	0x3ff59a00
	.xword	0x353b2600
	.xword	0x346c8e00
	.xword	0x3d75a000
	.xword	0x361dc800
	.xword	0x3d06c000
	.xword	0x38e0b000
	.xword	0x313e3c00
	.xword	0x350e7200
	.xword	0x3c8f2800
	.xword	0x35a2ae00
	.xword	0x3e378a00
	.xword	0x39879e00
	.xword	0x3297b600
	.xword	0x3bfbf200
	.xword	0x3adf5800
	.xword	0x3ca34e00
	.xword	0x3c008800
	.xword	0x3fe6b200
	.xword	0x3295b600
	.xword	0x3ad89e00
	.xword	0x3f98ba00

#if 0
#endif
