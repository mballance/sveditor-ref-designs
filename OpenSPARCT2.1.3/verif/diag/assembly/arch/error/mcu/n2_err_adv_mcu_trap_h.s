/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_err_adv_mcu_trap_h.s
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
#include "mcu_init.s"


    setx 0xf49329e47f5709d5, %g5, %r17 !64 bit data
    setx 0x70a9ffe2826e1f25, %g5, %r19 !64 bit data
    setx 0xc697226b5ac86d81, %g5, %r24 !64 bit data

    setx 0x80900000, %g5, %r18 !40 bit addr
    setx 0x80f00000, %g5, %r16 !40 bit addr

    mov 1, %g2

1:
            wr %g0, 4, %asi

	!before IJ_generate

myinst_1:
!note: quad word is 16 bytes, double word is 8 bytes, word is 4 bytes, half word is 2 bytes
myinst_2:
	.word 0xe2348000  ! 1: STH_R	sth	%r17, [%r18 + %r0]
    setx    0x0000400000, %l0, %l1
    add	    %r18, %l1, %r18
    add	    %r16, %l1, %r16
!note: the 2nd store will evict the 1st store to memory
	.word 0xe2b48080  ! 1: STHA_R	stha	%r17, [%r18 + %r0] 0x04
myinst_4:
	.word 0xe86c8000  ! 1: LDSTUB_R	ldstub	%r20, [%r18 + %r0]
myinst_5:
	.word 0xc36c8000  ! 1: PREFETCH_R	prefetch	[%r18 + %r0], #one_read
myinst_6:
	.word 0xe3e4a013  ! 1: CASA_R	casa	[%r18] %asi, %r19, %r17

            wr %g0, 4, %asi

myinst_7:
	.word 0xd0dc0080  ! 1: LDXA_R	ldxa	[%r16, %r0] 0x04, %r8
myinst_8:
	.word 0xe2f40080  ! 1: STXA_R	stxa	%r17, [%r16 + %r0] 0x04
myinst_9:
	.word 0xe3f42018  ! 1: CASXA_R	casxa	[%r16]%asi, %r24, %r17

	!after IJ_generate

	add %r18, 48, %r18
	add %r16, 48, %r16

	dec %g2
	brnz %g2, 1b
	nop


    setx 0xcea373f097c33f29, %g5, %r17 !64 bit data
    setx 0xba2183541cc0a478, %g5, %r19 !64 bit data
    setx 0x958213587001c0ce, %g5, %r24 !64 bit data

    setx 0x80300000, %g5, %r18 !40 bit addr
    setx 0x80300000, %g5, %r16 !40 bit addr

    mov 3, %g2

1:
            wr %g0, 4, %asi

	!before IJ_generate

myinst_10:
!note: quad word is 16 bytes, double word is 8 bytes, word is 4 bytes, half word is 2 bytes
	.word 0xe8948080  ! 1: LDUHA_R	lduha	[%r18, %r0] 0x04, %r20
myinst_11:
	.word 0xe22c8000  ! 1: STB_R	stb	%r17, [%r18 + %r0]
    setx    0x0000400000, %l0, %l1
    add	    %r18, %l1, %r18
    add	    %r16, %l1, %r16
!note: the 2nd store will evict the 1st store to memory
	.word 0xe22c8000  ! 1: STB_R	stb	%r17, [%r18 + %r0]
myinst_13:
	.word 0xe86c8000  ! 1: LDSTUB_R	ldstub	%r20, [%r18 + %r0]
myinst_14:
	.word 0xc36c8000  ! 1: PREFETCH_R	prefetch	[%r18 + %r0], #one_read
myinst_15:
	.word 0xe3e4a013  ! 1: CASA_R	casa	[%r18] %asi, %r19, %r17

            wr %g0, 4, %asi

myinst_16:
	.word 0xd05c0000  ! 1: LDX_R	ldx	[%r16 + %r0], %r8
myinst_17:
	.word 0xe2f40080  ! 1: STXA_R	stxa	%r17, [%r16 + %r0] 0x04
myinst_18:
	.word 0xe3f42018  ! 1: CASXA_R	casxa	[%r16]%asi, %r24, %r17

	!after IJ_generate

	add %r18, 48, %r18
	add %r16, 32, %r16

	dec %g2
	brnz %g2, 1b
	nop


    setx 0xb0bf1ee97861c614, %g5, %r17 !64 bit data
    setx 0x5112225340e249b2, %g5, %r19 !64 bit data
    setx 0xc651adb586f5cc7c, %g5, %r24 !64 bit data

    setx 0x80c00000, %g5, %r18 !40 bit addr
    setx 0x80000000, %g5, %r16 !40 bit addr

    mov 1, %g2

1:
            wr %g0, 4, %asi

	!before IJ_generate

myinst_19:
!note: quad word is 16 bytes, double word is 8 bytes, word is 4 bytes, half word is 2 bytes
	.word 0xe8048000  ! 2: LDUW_R	lduw	[%r18 + %r0], %r20
myinst_20:
	.word 0xe2348000  ! 1: STH_R	sth	%r17, [%r18 + %r0]
    setx    0x0000400000, %l0, %l1
    add	    %r18, %l1, %r18
    add	    %r16, %l1, %r16
!note: the 2nd store will evict the 1st store to memory
	.word 0xe22c8000  ! 1: STB_R	stb	%r17, [%r18 + %r0]
myinst_22:
	.word 0xe86c8000  ! 1: LDSTUB_R	ldstub	%r20, [%r18 + %r0]
myinst_23:
	.word 0xc3ec8080  ! 1: PREFETCHA_R	prefetcha	[%r18, %r0] 0x04, #one_read
myinst_24:
	.word 0xe3e4a013  ! 1: CASA_R	casa	[%r18] %asi, %r19, %r17

            wr %g0, 4, %asi

myinst_25:
	.word 0xd05c0000  ! 1: LDX_R	ldx	[%r16 + %r0], %r8
myinst_26:
	.word 0xe2f40080  ! 1: STXA_R	stxa	%r17, [%r16 + %r0] 0x04
myinst_27:
	.word 0xe3f42018  ! 1: CASXA_R	casxa	[%r16]%asi, %r24, %r17

	!after IJ_generate

	add %r18, 16, %r18
	add %r16, 0, %r16

	dec %g2
	brnz %g2, 1b
	nop


    setx 0x7cd98ee6d6309320, %g5, %r17 !64 bit data
    setx 0xec91f5828cd4df90, %g5, %r19 !64 bit data
    setx 0x8144a761ed49a47f, %g5, %r24 !64 bit data

    setx 0x80900000, %g5, %r18 !40 bit addr
    setx 0x80400000, %g5, %r16 !40 bit addr

    mov 3, %g2

1:
            wr %g0, 4, %asi

	!before IJ_generate

myinst_28:
!note: quad word is 16 bytes, double word is 8 bytes, word is 4 bytes, half word is 2 bytes
	.word 0xe8148000  ! 3: LDUH_R	lduh	[%r18 + %r0], %r20
myinst_29:
	.word 0xe2a48080  ! 1: STWA_R	stwa	%r17, [%r18 + %r0] 0x04
    setx    0x0000400000, %l0, %l1
    add	    %r18, %l1, %r18
    add	    %r16, %l1, %r16
!note: the 2nd store will evict the 1st store to memory
	.word 0xe2248000  ! 1: STW_R	stw	%r17, [%r18 + %r0]
myinst_31:
	.word 0xe86c8000  ! 1: LDSTUB_R	ldstub	%r20, [%r18 + %r0]
myinst_32:
	.word 0xc3ec8080  ! 1: PREFETCHA_R	prefetcha	[%r18, %r0] 0x04, #one_read
myinst_33:
	.word 0xe3e4a013  ! 1: CASA_R	casa	[%r18] %asi, %r19, %r17

            wr %g0, 4, %asi

myinst_34:
	.word 0xd0dc0080  ! 1: LDXA_R	ldxa	[%r16, %r0] 0x04, %r8
myinst_35:
	.word 0xe2f40080  ! 1: STXA_R	stxa	%r17, [%r16 + %r0] 0x04
myinst_36:
	.word 0xe3f42018  ! 1: CASXA_R	casxa	[%r16]%asi, %r24, %r17

	!after IJ_generate

	add %r18, 32, %r18
	add %r16, 0, %r16

	dec %g2
	brnz %g2, 1b
	nop


    setx 0xae49a2c8121fd64d, %g5, %r17 !64 bit data
    setx 0xa47036f8425976e1, %g5, %r19 !64 bit data
    setx 0xfc690373087a20d0, %g5, %r24 !64 bit data

    setx 0x80500000, %g5, %r18 !40 bit addr
    setx 0x80f00000, %g5, %r16 !40 bit addr

    mov 1, %g2

1:
            wr %g0, 4, %asi

	!before IJ_generate

myinst_37:
!note: quad word is 16 bytes, double word is 8 bytes, word is 4 bytes, half word is 2 bytes
	.word 0xe8548000  ! 4: LDSH_R	ldsh	[%r18 + %r0], %r20
myinst_38:
	.word 0xe2b48080  ! 1: STHA_R	stha	%r17, [%r18 + %r0] 0x04
    setx    0x0000400000, %l0, %l1
    add	    %r18, %l1, %r18
    add	    %r16, %l1, %r16
!note: the 2nd store will evict the 1st store to memory
	.word 0xe22c8000  ! 1: STB_R	stb	%r17, [%r18 + %r0]
myinst_40:
	.word 0xe8ec8080  ! 1: LDSTUBA_R	ldstuba	%r20, [%r18 + %r0] 0x04
myinst_41:
	.word 0xc3ec8080  ! 1: PREFETCHA_R	prefetcha	[%r18, %r0] 0x04, #one_read
myinst_42:
	.word 0xe3e4a013  ! 1: CASA_R	casa	[%r18] %asi, %r19, %r17

            wr %g0, 4, %asi

myinst_43:
	.word 0xd05c0000  ! 1: LDX_R	ldx	[%r16 + %r0], %r8
myinst_44:
	.word 0xe2f40080  ! 1: STXA_R	stxa	%r17, [%r16 + %r0] 0x04
myinst_45:
	.word 0xe3f42018  ! 1: CASXA_R	casxa	[%r16]%asi, %r24, %r17

	!after IJ_generate

	add %r18, 0, %r18
	add %r16, 48, %r16

	dec %g2
	brnz %g2, 1b
	nop


    setx 0x603441645d6ba07d, %g5, %r17 !64 bit data
    setx 0xa95f108b842819d1, %g5, %r19 !64 bit data
    setx 0x3bb55f3682135956, %g5, %r24 !64 bit data

    setx 0x80700000, %g5, %r18 !40 bit addr
    setx 0x80600000, %g5, %r16 !40 bit addr

    mov 3, %g2

1:
            wr %g0, 4, %asi

	!before IJ_generate

myinst_46:
!note: quad word is 16 bytes, double word is 8 bytes, word is 4 bytes, half word is 2 bytes
	.word 0xe8448000  ! 5: LDSW_R	ldsw	[%r18 + %r0], %r20
myinst_47:
	.word 0xe2b48080  ! 1: STHA_R	stha	%r17, [%r18 + %r0] 0x04
    setx    0x0000400000, %l0, %l1
    add	    %r18, %l1, %r18
    add	    %r16, %l1, %r16
!note: the 2nd store will evict the 1st store to memory
	.word 0xe2a48080  ! 1: STWA_R	stwa	%r17, [%r18 + %r0] 0x04
myinst_49:
	.word 0xe8ec8080  ! 1: LDSTUBA_R	ldstuba	%r20, [%r18 + %r0] 0x04
myinst_50:
	.word 0xc36c8000  ! 1: PREFETCH_R	prefetch	[%r18 + %r0], #one_read
myinst_51:
	.word 0xe3e4a013  ! 1: CASA_R	casa	[%r18] %asi, %r19, %r17

            wr %g0, 4, %asi

myinst_52:
	.word 0xd0dc0080  ! 1: LDXA_R	ldxa	[%r16, %r0] 0x04, %r8
myinst_53:
	.word 0xe2740000  ! 1: STX_R	stx	%r17, [%r16 + %r0]
myinst_54:
	.word 0xe3f42018  ! 1: CASXA_R	casxa	[%r16]%asi, %r24, %r17

	!after IJ_generate

	add %r18, 32, %r18
	add %r16, 32, %r16

	dec %g2
	brnz %g2, 1b
	nop


    setx 0x4116ca14109f00ff, %g5, %r17 !64 bit data
    setx 0xc11f0b13023f93a2, %g5, %r19 !64 bit data
    setx 0xd10bc3646b9a545e, %g5, %r24 !64 bit data

    setx 0x80600000, %g5, %r18 !40 bit addr
    setx 0x80f00000, %g5, %r16 !40 bit addr

    mov 3, %g2

1:
            wr %g0, 4, %asi

	!before IJ_generate

myinst_55:
!note: quad word is 16 bytes, double word is 8 bytes, word is 4 bytes, half word is 2 bytes
	.word 0xe8048000  ! 6: LDUW_R	lduw	[%r18 + %r0], %r20
myinst_56:
	.word 0xe2348000  ! 1: STH_R	sth	%r17, [%r18 + %r0]
    setx    0x0000400000, %l0, %l1
    add	    %r18, %l1, %r18
    add	    %r16, %l1, %r16
!note: the 2nd store will evict the 1st store to memory
	.word 0xe2ac8080  ! 1: STBA_R	stba	%r17, [%r18 + %r0] 0x04
myinst_58:
	.word 0xe86c8000  ! 1: LDSTUB_R	ldstub	%r20, [%r18 + %r0]
myinst_59:
	.word 0xc3ec8080  ! 1: PREFETCHA_R	prefetcha	[%r18, %r0] 0x04, #one_read
myinst_60:
	.word 0xe3e4a013  ! 1: CASA_R	casa	[%r18] %asi, %r19, %r17

            wr %g0, 4, %asi

myinst_61:
	.word 0xd05c0000  ! 1: LDX_R	ldx	[%r16 + %r0], %r8
myinst_62:
	.word 0xe2740000  ! 1: STX_R	stx	%r17, [%r16 + %r0]
myinst_63:
	.word 0xe3f42018  ! 1: CASXA_R	casxa	[%r16]%asi, %r24, %r17

	!after IJ_generate

	add %r18, 32, %r18
	add %r16, 48, %r16

	dec %g2
	brnz %g2, 1b
	nop


    setx 0x19bd772f309e0767, %g5, %r17 !64 bit data
    setx 0x2310aeb16e6e1826, %g5, %r19 !64 bit data
    setx 0xced2c81555ad88b2, %g5, %r24 !64 bit data

    setx 0x80700000, %g5, %r18 !40 bit addr
    setx 0x80600000, %g5, %r16 !40 bit addr

    mov 3, %g2

1:
            wr %g0, 4, %asi

	!before IJ_generate

myinst_64:
!note: quad word is 16 bytes, double word is 8 bytes, word is 4 bytes, half word is 2 bytes
	.word 0xe84c8000  ! 7: LDSB_R	ldsb	[%r18 + %r0], %r20
myinst_65:
	.word 0xe2b48080  ! 1: STHA_R	stha	%r17, [%r18 + %r0] 0x04
    setx    0x0000400000, %l0, %l1
    add	    %r18, %l1, %r18
    add	    %r16, %l1, %r16
!note: the 2nd store will evict the 1st store to memory
	.word 0xe2a48080  ! 1: STWA_R	stwa	%r17, [%r18 + %r0] 0x04
myinst_67:
	.word 0xe86c8000  ! 1: LDSTUB_R	ldstub	%r20, [%r18 + %r0]
myinst_68:
	.word 0xc36c8000  ! 1: PREFETCH_R	prefetch	[%r18 + %r0], #one_read
myinst_69:
	.word 0xe3e4a013  ! 1: CASA_R	casa	[%r18] %asi, %r19, %r17

            wr %g0, 4, %asi

myinst_70:
	.word 0xd05c0000  ! 1: LDX_R	ldx	[%r16 + %r0], %r8
myinst_71:
	.word 0xe2740000  ! 1: STX_R	stx	%r17, [%r16 + %r0]
myinst_72:
	.word 0xe3f42018  ! 1: CASXA_R	casxa	[%r16]%asi, %r24, %r17

	!after IJ_generate

	add %r18, 0, %r18
	add %r16, 48, %r16

	dec %g2
	brnz %g2, 1b
	nop


    setx 0x7966720ec0aa3014, %g5, %r17 !64 bit data
    setx 0xb7055810cd15872e, %g5, %r19 !64 bit data
    setx 0x926b2cf52d6b06d6, %g5, %r24 !64 bit data

    setx 0x80700000, %g5, %r18 !40 bit addr
    setx 0x80d00000, %g5, %r16 !40 bit addr

    mov 1, %g2

1:
            wr %g0, 4, %asi

	!before IJ_generate

myinst_73:
!note: quad word is 16 bytes, double word is 8 bytes, word is 4 bytes, half word is 2 bytes
	.word 0xe88c8080  ! 8: LDUBA_R	lduba	[%r18, %r0] 0x04, %r20
myinst_74:
	.word 0xe2ac8080  ! 1: STBA_R	stba	%r17, [%r18 + %r0] 0x04
    setx    0x0000400000, %l0, %l1
    add	    %r18, %l1, %r18
    add	    %r16, %l1, %r16
!note: the 2nd store will evict the 1st store to memory
	.word 0xe2348000  ! 1: STH_R	sth	%r17, [%r18 + %r0]
myinst_76:
	.word 0xe8ec8080  ! 1: LDSTUBA_R	ldstuba	%r20, [%r18 + %r0] 0x04
myinst_77:
	.word 0xc3ec8080  ! 1: PREFETCHA_R	prefetcha	[%r18, %r0] 0x04, #one_read
myinst_78:
	.word 0xe3e4a013  ! 1: CASA_R	casa	[%r18] %asi, %r19, %r17

            wr %g0, 4, %asi

myinst_79:
	.word 0xd0dc0080  ! 1: LDXA_R	ldxa	[%r16, %r0] 0x04, %r8
myinst_80:
	.word 0xe2740000  ! 1: STX_R	stx	%r17, [%r16 + %r0]
myinst_81:
	.word 0xe3f42018  ! 1: CASXA_R	casxa	[%r16]%asi, %r24, %r17

	!after IJ_generate

	add %r18, 0, %r18
	add %r16, 16, %r16

	dec %g2
	brnz %g2, 1b
	nop


    setx 0x5d56071a3bb174b9, %g5, %r17 !64 bit data
    setx 0x4e71628e93bd08dc, %g5, %r19 !64 bit data
    setx 0x44a6781217861218, %g5, %r24 !64 bit data

    setx 0x80a00000, %g5, %r18 !40 bit addr
    setx 0x80a00000, %g5, %r16 !40 bit addr

    mov 3, %g2

1:
            wr %g0, 4, %asi

	!before IJ_generate

myinst_82:
!note: quad word is 16 bytes, double word is 8 bytes, word is 4 bytes, half word is 2 bytes
	.word 0xe8448000  ! 9: LDSW_R	ldsw	[%r18 + %r0], %r20
myinst_83:
	.word 0xe22c8000  ! 1: STB_R	stb	%r17, [%r18 + %r0]
    setx    0x0000400000, %l0, %l1
    add	    %r18, %l1, %r18
    add	    %r16, %l1, %r16
!note: the 2nd store will evict the 1st store to memory
	.word 0xe2248000  ! 1: STW_R	stw	%r17, [%r18 + %r0]
myinst_85:
	.word 0xe8ec8080  ! 1: LDSTUBA_R	ldstuba	%r20, [%r18 + %r0] 0x04
myinst_86:
	.word 0xc3ec8080  ! 1: PREFETCHA_R	prefetcha	[%r18, %r0] 0x04, #one_read
myinst_87:
	.word 0xe3e4a013  ! 1: CASA_R	casa	[%r18] %asi, %r19, %r17

            wr %g0, 4, %asi

myinst_88:
	.word 0xd05c0000  ! 1: LDX_R	ldx	[%r16 + %r0], %r8
myinst_89:
	.word 0xe2740000  ! 1: STX_R	stx	%r17, [%r16 + %r0]
myinst_90:
	.word 0xe3f42018  ! 1: CASXA_R	casxa	[%r16]%asi, %r24, %r17

	!after IJ_generate

	add %r18, 32, %r18
	add %r16, 48, %r16

	dec %g2
	brnz %g2, 1b
	nop


    setx 0xb8c3e9ac9ce27908, %g5, %r17 !64 bit data
    setx 0x3750908c8b201bfd, %g5, %r19 !64 bit data
    setx 0x748f25f714a57e2d, %g5, %r24 !64 bit data

    setx 0x80100000, %g5, %r18 !40 bit addr
    setx 0x80500000, %g5, %r16 !40 bit addr

    mov 1, %g2

1:
            wr %g0, 4, %asi

	!before IJ_generate

myinst_91:
!note: quad word is 16 bytes, double word is 8 bytes, word is 4 bytes, half word is 2 bytes
	.word 0xe8148000  ! 10: LDUH_R	lduh	[%r18 + %r0], %r20
myinst_92:
	.word 0xe2ac8080  ! 1: STBA_R	stba	%r17, [%r18 + %r0] 0x04
    setx    0x0000400000, %l0, %l1
    add	    %r18, %l1, %r18
    add	    %r16, %l1, %r16
!note: the 2nd store will evict the 1st store to memory
	.word 0xe2248000  ! 1: STW_R	stw	%r17, [%r18 + %r0]
myinst_94:
	.word 0xe86c8000  ! 1: LDSTUB_R	ldstub	%r20, [%r18 + %r0]
myinst_95:
	.word 0xc36c8000  ! 1: PREFETCH_R	prefetch	[%r18 + %r0], #one_read
myinst_96:
	.word 0xe3e4a013  ! 1: CASA_R	casa	[%r18] %asi, %r19, %r17

            wr %g0, 4, %asi

myinst_97:
	.word 0xd0dc0080  ! 1: LDXA_R	ldxa	[%r16, %r0] 0x04, %r8
myinst_98:
	.word 0xe2740000  ! 1: STX_R	stx	%r17, [%r16 + %r0]
myinst_99:
	.word 0xe3f42018  ! 1: CASXA_R	casxa	[%r16]%asi, %r24, %r17

	!after IJ_generate

	add %r18, 16, %r18
	add %r16, 0, %r16

	dec %g2
	brnz %g2, 1b
	nop


    setx 0x8f4949d0b46eee71, %g5, %r17 !64 bit data
    setx 0x5eef141bd9ee5c9c, %g5, %r19 !64 bit data
    setx 0xb542d02b02b11e5c, %g5, %r24 !64 bit data

    setx 0x80300000, %g5, %r18 !40 bit addr
    setx 0x80e00000, %g5, %r16 !40 bit addr

    mov 1, %g2

1:
            wr %g0, 4, %asi

	!before IJ_generate

myinst_100:
!note: quad word is 16 bytes, double word is 8 bytes, word is 4 bytes, half word is 2 bytes
	.word 0xe8cc8080  ! 11: LDSBA_R	ldsba	[%r18, %r0] 0x04, %r20
myinst_101:
	.word 0xe2ac8080  ! 1: STBA_R	stba	%r17, [%r18 + %r0] 0x04
    setx    0x0000400000, %l0, %l1
    add	    %r18, %l1, %r18
    add	    %r16, %l1, %r16
!note: the 2nd store will evict the 1st store to memory
	.word 0xe2348000  ! 1: STH_R	sth	%r17, [%r18 + %r0]
myinst_103:
	.word 0xe86c8000  ! 1: LDSTUB_R	ldstub	%r20, [%r18 + %r0]
myinst_104:
	.word 0xc36c8000  ! 1: PREFETCH_R	prefetch	[%r18 + %r0], #one_read
myinst_105:
	.word 0xe3e4a013  ! 1: CASA_R	casa	[%r18] %asi, %r19, %r17

            wr %g0, 4, %asi

myinst_106:
	.word 0xd05c0000  ! 1: LDX_R	ldx	[%r16 + %r0], %r8
myinst_107:
	.word 0xe2f40080  ! 1: STXA_R	stxa	%r17, [%r16 + %r0] 0x04
myinst_108:
	.word 0xe3f42018  ! 1: CASXA_R	casxa	[%r16]%asi, %r24, %r17

	!after IJ_generate

	add %r18, 48, %r18
	add %r16, 32, %r16

	dec %g2
	brnz %g2, 1b
	nop


    setx 0x0db59ad26afb5e20, %g5, %r17 !64 bit data
    setx 0x9a2d08ed9f02194a, %g5, %r19 !64 bit data
    setx 0xdc11604530e5e0ee, %g5, %r24 !64 bit data

    setx 0x80f00000, %g5, %r18 !40 bit addr
    setx 0x80400000, %g5, %r16 !40 bit addr

    mov 1, %g2

1:
            wr %g0, 4, %asi

	!before IJ_generate

myinst_109:
!note: quad word is 16 bytes, double word is 8 bytes, word is 4 bytes, half word is 2 bytes
	.word 0xe8548000  ! 12: LDSH_R	ldsh	[%r18 + %r0], %r20
myinst_110:
	.word 0xe2a48080  ! 1: STWA_R	stwa	%r17, [%r18 + %r0] 0x04
    setx    0x0000400000, %l0, %l1
    add	    %r18, %l1, %r18
    add	    %r16, %l1, %r16
!note: the 2nd store will evict the 1st store to memory
	.word 0xe2348000  ! 1: STH_R	sth	%r17, [%r18 + %r0]
myinst_112:
	.word 0xe86c8000  ! 1: LDSTUB_R	ldstub	%r20, [%r18 + %r0]
myinst_113:
	.word 0xc36c8000  ! 1: PREFETCH_R	prefetch	[%r18 + %r0], #one_read
myinst_114:
	.word 0xe3e4a013  ! 1: CASA_R	casa	[%r18] %asi, %r19, %r17

            wr %g0, 4, %asi

myinst_115:
	.word 0xd05c0000  ! 1: LDX_R	ldx	[%r16 + %r0], %r8
myinst_116:
	.word 0xe2f40080  ! 1: STXA_R	stxa	%r17, [%r16 + %r0] 0x04
myinst_117:
	.word 0xe3f42018  ! 1: CASXA_R	casxa	[%r16]%asi, %r24, %r17

	!after IJ_generate

	add %r18, 0, %r18
	add %r16, 0, %r16

	dec %g2
	brnz %g2, 1b
	nop


    setx 0x21bd18a0bd596047, %g5, %r17 !64 bit data
    setx 0x427e151b179c15fa, %g5, %r19 !64 bit data
    setx 0xee6e25cbcc45ccd3, %g5, %r24 !64 bit data

    setx 0x80900000, %g5, %r18 !40 bit addr
    setx 0x80900000, %g5, %r16 !40 bit addr

    mov 3, %g2

1:
            wr %g0, 4, %asi

	!before IJ_generate

myinst_118:
!note: quad word is 16 bytes, double word is 8 bytes, word is 4 bytes, half word is 2 bytes
	.word 0xe8948080  ! 13: LDUHA_R	lduha	[%r18, %r0] 0x04, %r20
myinst_119:
	.word 0xe2b48080  ! 1: STHA_R	stha	%r17, [%r18 + %r0] 0x04
    setx    0x0000400000, %l0, %l1
    add	    %r18, %l1, %r18
    add	    %r16, %l1, %r16
!note: the 2nd store will evict the 1st store to memory
	.word 0xe2b48080  ! 1: STHA_R	stha	%r17, [%r18 + %r0] 0x04
myinst_121:
	.word 0xe8ec8080  ! 1: LDSTUBA_R	ldstuba	%r20, [%r18 + %r0] 0x04
myinst_122:
	.word 0xc3ec8080  ! 1: PREFETCHA_R	prefetcha	[%r18, %r0] 0x04, #one_read
myinst_123:
	.word 0xe3e4a013  ! 1: CASA_R	casa	[%r18] %asi, %r19, %r17

            wr %g0, 4, %asi

myinst_124:
	.word 0xd05c0000  ! 1: LDX_R	ldx	[%r16 + %r0], %r8
myinst_125:
	.word 0xe2f40080  ! 1: STXA_R	stxa	%r17, [%r16 + %r0] 0x04
myinst_126:
	.word 0xe3f42018  ! 1: CASXA_R	casxa	[%r16]%asi, %r24, %r17

	!after IJ_generate

	add %r18, 32, %r18
	add %r16, 16, %r16

	dec %g2
	brnz %g2, 1b
	nop


    setx 0x0db228bd2ce01b3a, %g5, %r17 !64 bit data
    setx 0x239a4acf0dc723cc, %g5, %r19 !64 bit data
    setx 0x7dc5b656b82e437c, %g5, %r24 !64 bit data

    setx 0x80f00000, %g5, %r18 !40 bit addr
    setx 0x80600000, %g5, %r16 !40 bit addr

    mov 1, %g2

1:
            wr %g0, 4, %asi

	!before IJ_generate

myinst_127:
!note: quad word is 16 bytes, double word is 8 bytes, word is 4 bytes, half word is 2 bytes
	.word 0xe8048000  ! 14: LDUW_R	lduw	[%r18 + %r0], %r20
myinst_128:
	.word 0xe2b48080  ! 1: STHA_R	stha	%r17, [%r18 + %r0] 0x04
    setx    0x0000400000, %l0, %l1
    add	    %r18, %l1, %r18
    add	    %r16, %l1, %r16
!note: the 2nd store will evict the 1st store to memory
	.word 0xe2ac8080  ! 1: STBA_R	stba	%r17, [%r18 + %r0] 0x04
myinst_130:
	.word 0xe86c8000  ! 1: LDSTUB_R	ldstub	%r20, [%r18 + %r0]
myinst_131:
	.word 0xc36c8000  ! 1: PREFETCH_R	prefetch	[%r18 + %r0], #one_read
myinst_132:
	.word 0xe3e4a013  ! 1: CASA_R	casa	[%r18] %asi, %r19, %r17

            wr %g0, 4, %asi

myinst_133:
	.word 0xd05c0000  ! 1: LDX_R	ldx	[%r16 + %r0], %r8
myinst_134:
	.word 0xe2f40080  ! 1: STXA_R	stxa	%r17, [%r16 + %r0] 0x04
myinst_135:
	.word 0xe3f42018  ! 1: CASXA_R	casxa	[%r16]%asi, %r24, %r17

	!after IJ_generate

	add %r18, 16, %r18
	add %r16, 0, %r16

	dec %g2
	brnz %g2, 1b
	nop


    setx 0x0ccd780a0ab0272c, %g5, %r17 !64 bit data
    setx 0x082387be63b6c69c, %g5, %r19 !64 bit data
    setx 0x3b29d22752cd1a0c, %g5, %r24 !64 bit data

    setx 0x80200000, %g5, %r18 !40 bit addr
    setx 0x80f00000, %g5, %r16 !40 bit addr

    mov 3, %g2

1:
            wr %g0, 4, %asi

	!before IJ_generate

myinst_136:
!note: quad word is 16 bytes, double word is 8 bytes, word is 4 bytes, half word is 2 bytes
	.word 0xe8548000  ! 15: LDSH_R	ldsh	[%r18 + %r0], %r20
myinst_137:
	.word 0xe2a48080  ! 1: STWA_R	stwa	%r17, [%r18 + %r0] 0x04
    setx    0x0000400000, %l0, %l1
    add	    %r18, %l1, %r18
    add	    %r16, %l1, %r16
!note: the 2nd store will evict the 1st store to memory
	.word 0xe2ac8080  ! 1: STBA_R	stba	%r17, [%r18 + %r0] 0x04
myinst_139:
	.word 0xe8ec8080  ! 1: LDSTUBA_R	ldstuba	%r20, [%r18 + %r0] 0x04
myinst_140:
	.word 0xc36c8000  ! 1: PREFETCH_R	prefetch	[%r18 + %r0], #one_read
myinst_141:
	.word 0xe3e4a013  ! 1: CASA_R	casa	[%r18] %asi, %r19, %r17

            wr %g0, 4, %asi

myinst_142:
	.word 0xd0dc0080  ! 1: LDXA_R	ldxa	[%r16, %r0] 0x04, %r8
myinst_143:
	.word 0xe2740000  ! 1: STX_R	stx	%r17, [%r16 + %r0]
myinst_144:
	.word 0xe3f42018  ! 1: CASXA_R	casxa	[%r16]%asi, %r24, %r17

	!after IJ_generate

	add %r18, 0, %r18
	add %r16, 32, %r16

	dec %g2
	brnz %g2, 1b
	nop


    setx 0x735a567d214a2280, %g5, %r17 !64 bit data
    setx 0x13ede71d58999234, %g5, %r19 !64 bit data
    setx 0x11630a17dc799b86, %g5, %r24 !64 bit data

    setx 0x80f00000, %g5, %r18 !40 bit addr
    setx 0x80a00000, %g5, %r16 !40 bit addr

    mov 3, %g2

1:
            wr %g0, 4, %asi

	!before IJ_generate

myinst_145:
!note: quad word is 16 bytes, double word is 8 bytes, word is 4 bytes, half word is 2 bytes
	.word 0xe8048000  ! 16: LDUW_R	lduw	[%r18 + %r0], %r20
myinst_146:
	.word 0xe2a48080  ! 1: STWA_R	stwa	%r17, [%r18 + %r0] 0x04
    setx    0x0000400000, %l0, %l1
    add	    %r18, %l1, %r18
    add	    %r16, %l1, %r16
!note: the 2nd store will evict the 1st store to memory
	.word 0xe2b48080  ! 1: STHA_R	stha	%r17, [%r18 + %r0] 0x04
myinst_148:
	.word 0xe8ec8080  ! 1: LDSTUBA_R	ldstuba	%r20, [%r18 + %r0] 0x04
myinst_149:
	.word 0xc3ec8080  ! 1: PREFETCHA_R	prefetcha	[%r18, %r0] 0x04, #one_read
myinst_150:
	.word 0xe3e4a013  ! 1: CASA_R	casa	[%r18] %asi, %r19, %r17

            wr %g0, 4, %asi

myinst_151:
	.word 0xd05c0000  ! 1: LDX_R	ldx	[%r16 + %r0], %r8
myinst_152:
	.word 0xe2740000  ! 1: STX_R	stx	%r17, [%r16 + %r0]
myinst_153:
	.word 0xe3f42018  ! 1: CASXA_R	casxa	[%r16]%asi, %r24, %r17

	!after IJ_generate

	add %r18, 48, %r18
	add %r16, 48, %r16

	dec %g2
	brnz %g2, 1b
	nop


    setx 0x9d2c263f62193395, %g5, %r17 !64 bit data
    setx 0xd5783014eff03f6c, %g5, %r19 !64 bit data
    setx 0xe56de09b8d030648, %g5, %r24 !64 bit data

    setx 0x80900000, %g5, %r18 !40 bit addr
    setx 0x80d00000, %g5, %r16 !40 bit addr

    mov 1, %g2

1:
            wr %g0, 4, %asi

	!before IJ_generate

myinst_154:
!note: quad word is 16 bytes, double word is 8 bytes, word is 4 bytes, half word is 2 bytes
	.word 0xe80c8000  ! 17: LDUB_R	ldub	[%r18 + %r0], %r20
myinst_155:
	.word 0xe2248000  ! 1: STW_R	stw	%r17, [%r18 + %r0]
    setx    0x0000400000, %l0, %l1
    add	    %r18, %l1, %r18
    add	    %r16, %l1, %r16
!note: the 2nd store will evict the 1st store to memory
	.word 0xe2b48080  ! 1: STHA_R	stha	%r17, [%r18 + %r0] 0x04
myinst_157:
	.word 0xe8ec8080  ! 1: LDSTUBA_R	ldstuba	%r20, [%r18 + %r0] 0x04
myinst_158:
	.word 0xc36c8000  ! 1: PREFETCH_R	prefetch	[%r18 + %r0], #one_read
myinst_159:
	.word 0xe3e4a013  ! 1: CASA_R	casa	[%r18] %asi, %r19, %r17

            wr %g0, 4, %asi

myinst_160:
	.word 0xd05c0000  ! 1: LDX_R	ldx	[%r16 + %r0], %r8
myinst_161:
	.word 0xe2740000  ! 1: STX_R	stx	%r17, [%r16 + %r0]
myinst_162:
	.word 0xe3f42018  ! 1: CASXA_R	casxa	[%r16]%asi, %r24, %r17

	!after IJ_generate

	add %r18, 16, %r18
	add %r16, 32, %r16

	dec %g2
	brnz %g2, 1b
	nop


    setx 0x8a72f7309749ef5b, %g5, %r17 !64 bit data
    setx 0x6c126d4552d06c66, %g5, %r19 !64 bit data
    setx 0x642698f6a63d09f4, %g5, %r24 !64 bit data

    setx 0x80200000, %g5, %r18 !40 bit addr
    setx 0x80e00000, %g5, %r16 !40 bit addr

    mov 3, %g2

1:
            wr %g0, 4, %asi

	!before IJ_generate

myinst_163:
!note: quad word is 16 bytes, double word is 8 bytes, word is 4 bytes, half word is 2 bytes
	.word 0xe80c8000  ! 18: LDUB_R	ldub	[%r18 + %r0], %r20
myinst_164:
	.word 0xe2348000  ! 1: STH_R	sth	%r17, [%r18 + %r0]
    setx    0x0000400000, %l0, %l1
    add	    %r18, %l1, %r18
    add	    %r16, %l1, %r16
!note: the 2nd store will evict the 1st store to memory
	.word 0xe2348000  ! 1: STH_R	sth	%r17, [%r18 + %r0]
myinst_166:
	.word 0xe86c8000  ! 1: LDSTUB_R	ldstub	%r20, [%r18 + %r0]
myinst_167:
	.word 0xc3ec8080  ! 1: PREFETCHA_R	prefetcha	[%r18, %r0] 0x04, #one_read
myinst_168:
	.word 0xe3e4a013  ! 1: CASA_R	casa	[%r18] %asi, %r19, %r17

            wr %g0, 4, %asi

myinst_169:
	.word 0xd05c0000  ! 1: LDX_R	ldx	[%r16 + %r0], %r8
myinst_170:
	.word 0xe2740000  ! 1: STX_R	stx	%r17, [%r16 + %r0]
myinst_171:
	.word 0xe3f42018  ! 1: CASXA_R	casxa	[%r16]%asi, %r24, %r17

	!after IJ_generate

	add %r18, 32, %r18
	add %r16, 0, %r16

	dec %g2
	brnz %g2, 1b
	nop


    setx 0x4ccf64e712e8bd76, %g5, %r17 !64 bit data
    setx 0x9fd6b27fb1b10f01, %g5, %r19 !64 bit data
    setx 0x88e1648da3bb9a43, %g5, %r24 !64 bit data

    setx 0x80f00000, %g5, %r18 !40 bit addr
    setx 0x80600000, %g5, %r16 !40 bit addr

    mov 3, %g2

1:
            wr %g0, 4, %asi

	!before IJ_generate

myinst_172:
!note: quad word is 16 bytes, double word is 8 bytes, word is 4 bytes, half word is 2 bytes
	.word 0xe8c48080  ! 19: LDSWA_R	ldswa	[%r18, %r0] 0x04, %r20
myinst_173:
	.word 0xe2348000  ! 1: STH_R	sth	%r17, [%r18 + %r0]
    setx    0x0000400000, %l0, %l1
    add	    %r18, %l1, %r18
    add	    %r16, %l1, %r16
!note: the 2nd store will evict the 1st store to memory
	.word 0xe2348000  ! 1: STH_R	sth	%r17, [%r18 + %r0]
myinst_175:
	.word 0xe8ec8080  ! 1: LDSTUBA_R	ldstuba	%r20, [%r18 + %r0] 0x04
myinst_176:
	.word 0xc36c8000  ! 1: PREFETCH_R	prefetch	[%r18 + %r0], #one_read
myinst_177:
	.word 0xe3e4a013  ! 1: CASA_R	casa	[%r18] %asi, %r19, %r17

            wr %g0, 4, %asi

myinst_178:
	.word 0xd0dc0080  ! 1: LDXA_R	ldxa	[%r16, %r0] 0x04, %r8
myinst_179:
	.word 0xe2740000  ! 1: STX_R	stx	%r17, [%r16 + %r0]
myinst_180:
	.word 0xe3f42018  ! 1: CASXA_R	casxa	[%r16]%asi, %r24, %r17

	!after IJ_generate

	add %r18, 16, %r18
	add %r16, 32, %r16

	dec %g2
	brnz %g2, 1b
	nop


    setx 0x193b90abdcb4e9c4, %g5, %r17 !64 bit data
    setx 0xb38cd8daa8fd2e7d, %g5, %r19 !64 bit data
    setx 0xc231c8837827b37a, %g5, %r24 !64 bit data

    setx 0x80700000, %g5, %r18 !40 bit addr
    setx 0x80f00000, %g5, %r16 !40 bit addr

    mov 1, %g2

1:
            wr %g0, 4, %asi

	!before IJ_generate

myinst_181:
!note: quad word is 16 bytes, double word is 8 bytes, word is 4 bytes, half word is 2 bytes
	.word 0xe8048000  ! 20: LDUW_R	lduw	[%r18 + %r0], %r20
myinst_182:
	.word 0xe2248000  ! 1: STW_R	stw	%r17, [%r18 + %r0]
    setx    0x0000400000, %l0, %l1
    add	    %r18, %l1, %r18
    add	    %r16, %l1, %r16
!note: the 2nd store will evict the 1st store to memory
	.word 0xe2248000  ! 1: STW_R	stw	%r17, [%r18 + %r0]
myinst_184:
	.word 0xe8ec8080  ! 1: LDSTUBA_R	ldstuba	%r20, [%r18 + %r0] 0x04
myinst_185:
	.word 0xc36c8000  ! 1: PREFETCH_R	prefetch	[%r18 + %r0], #one_read
myinst_186:
	.word 0xe3e4a013  ! 1: CASA_R	casa	[%r18] %asi, %r19, %r17

            wr %g0, 4, %asi

myinst_187:
	.word 0xd05c0000  ! 1: LDX_R	ldx	[%r16 + %r0], %r8
myinst_188:
	.word 0xe2740000  ! 1: STX_R	stx	%r17, [%r16 + %r0]
myinst_189:
	.word 0xe3f42018  ! 1: CASXA_R	casxa	[%r16]%asi, %r24, %r17

	!after IJ_generate

	add %r18, 48, %r18
	add %r16, 32, %r16

	dec %g2
	brnz %g2, 1b
	nop


#include "mcu_finish.s"




SECTION .MyDATA_0 DATA_VA = 0x0000000080000000
attr_data {
	Name	 = .MyDATA_0,
	RA	 = 0x0000000080000000,
	PA	 = ra2pa(0x0000000080000000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G	 = 1,
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
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}




SECTION .MyDATA_1 DATA_VA = 0x0000000080100000
attr_data {
	Name	 = .MyDATA_1,
	RA	 = 0x0000000080100000,
	PA	 = ra2pa(0x0000000080100000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G	 = 1,
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
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}




SECTION .MyDATA_2 DATA_VA = 0x0000000080200000
attr_data {
	Name	 = .MyDATA_2,
	RA	 = 0x0000000080200000,
	PA	 = ra2pa(0x0000000080200000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G	 = 1,
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
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}




SECTION .MyDATA_3 DATA_VA = 0x0000000080300000
attr_data {
	Name	 = .MyDATA_3,
	RA	 = 0x0000000080300000,
	PA	 = ra2pa(0x0000000080300000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G	 = 1,
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
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}




SECTION .MyDATA_4 DATA_VA = 0x0000000080400000
attr_data {
	Name	 = .MyDATA_4,
	RA	 = 0x0000000080400000,
	PA	 = ra2pa(0x0000000080400000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G	 = 1,
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
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}




SECTION .MyDATA_5 DATA_VA = 0x0000000080500000
attr_data {
	Name	 = .MyDATA_5,
	RA	 = 0x0000000080500000,
	PA	 = ra2pa(0x0000000080500000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G	 = 1,
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
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}




SECTION .MyDATA_6 DATA_VA = 0x0000000080600000
attr_data {
	Name	 = .MyDATA_6,
	RA	 = 0x0000000080600000,
	PA	 = ra2pa(0x0000000080600000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G	 = 1,
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
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}




SECTION .MyDATA_7 DATA_VA = 0x0000000080700000
attr_data {
	Name	 = .MyDATA_7,
	RA	 = 0x0000000080700000,
	PA	 = ra2pa(0x0000000080700000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G	 = 1,
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
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}




SECTION .MyDATA_8 DATA_VA = 0x0000000080800000
attr_data {
	Name	 = .MyDATA_8,
	RA	 = 0x0000000080800000,
	PA	 = ra2pa(0x0000000080800000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G	 = 1,
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
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}




SECTION .MyDATA_9 DATA_VA = 0x0000000080900000
attr_data {
	Name	 = .MyDATA_9,
	RA	 = 0x0000000080900000,
	PA	 = ra2pa(0x0000000080900000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G	 = 1,
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
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}




SECTION .MyDATA_10 DATA_VA = 0x0000000080a00000
attr_data {
	Name	 = .MyDATA_10,
	RA	 = 0x0000000080a00000,
	PA	 = ra2pa(0x0000000080a00000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G	 = 1,
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
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}




SECTION .MyDATA_11 DATA_VA = 0x0000000080b00000
attr_data {
	Name	 = .MyDATA_11,
	RA	 = 0x0000000080b00000,
	PA	 = ra2pa(0x0000000080b00000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G	 = 1,
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
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}




SECTION .MyDATA_12 DATA_VA = 0x0000000080c00000
attr_data {
	Name	 = .MyDATA_12,
	RA	 = 0x0000000080c00000,
	PA	 = ra2pa(0x0000000080c00000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G	 = 1,
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
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}




SECTION .MyDATA_13 DATA_VA = 0x0000000080d00000
attr_data {
	Name	 = .MyDATA_13,
	RA	 = 0x0000000080d00000,
	PA	 = ra2pa(0x0000000080d00000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G	 = 1,
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
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}




SECTION .MyDATA_14 DATA_VA = 0x0000000080e00000
attr_data {
	Name	 = .MyDATA_14,
	RA	 = 0x0000000080e00000,
	PA	 = ra2pa(0x0000000080e00000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G	 = 1,
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
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}




SECTION .MyDATA_15 DATA_VA = 0x0000000080f00000
attr_data {
	Name	 = .MyDATA_15,
	RA	 = 0x0000000080f00000,
	PA	 = ra2pa(0x0000000080f00000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G	 = 1,
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
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}




#if 0
#endif
