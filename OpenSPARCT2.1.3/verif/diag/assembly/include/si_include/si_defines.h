/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: si_defines.h
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
!
! This file is used to compile the v9 Test Suite from Sparc International.
!
!
#ifndef	NWIN
#define	NWIN            8
#endif

#ifndef	INIT_CWP
#define	INIT_CWP	0
#define CWP_INIT	INIT_CWP
#endif

#ifndef	INIT_CANSAVE
#define	INIT_CANSAVE	6	
#define CANSAVE_INIT	INIT_CANSAVE
#endif

#ifndef	INIT_CANRESTORE
#define	INIT_CANRESTORE	0
#define	CANRESTORE_INIT INIT_CANRESTORE
#endif

#ifndef	INIT_OTHERWIN
#define	INIT_OTHERWIN	0
#define	OTHERWIN_INIT INIT_OTHERWIN
#endif

#ifndef	INIT_CLEANWIN
#define	INIT_CLEANWIN	4
#define	CLEANWIN_INIT INIT_CLEANWIN
#endif

#define EXIT_TRAP_NO		0x6f
#define	USR2SUP_TRAP_NO		0x6e

#ifndef USER_TEXT_START
#define USER_TEXT_START user_text_start
#endif

!#define ENTRY_POINT USER_TEXT_START
#define ENTRY_POINT main

#ifndef RESET_HANDLER
#define RESET_HANDLER RESET_HANDLER_default
#endif

#ifndef WATCHDOG_RESET_HANDLER
#define WATCHDOG_RESET_HANDLER WATCHDOG_RESET_HANDLER_default
#endif

#ifndef EXTERNAL_RESET_HANDLER
#define EXTERNAL_RESET_HANDLER EXTERNAL_RESET_HANDLER_default
#endif

#ifndef SOFTWARE_RESET_HANDLER
#define SOFTWARE_RESET_HANDLER SOFTWARE_RESET_HANDLER_default
#endif

#ifndef REDMODE_HANDLER
#define REDMODE_HANDLER REDMODE_HANDLER_default
#endif


#define	ultra	1
#define not_run		1

#define EXIT_TRAP_NO		0x6f
#define	USR2SUP_TRAP_NO		0x6e

#ifdef SI_DIAG
#define	EXIT\
exit_ldb:\
	ta	EXIT_TRAP_NO;\
        nop

#define EXIT1	call exit_ldb
#else
#define	EXIT	\
	ta	GOOD_TRAP

#define EXIT1	\
	ta	BAD_TRAP
#endif

#define writemem(addr,r_val,r_tmp1) \
        set     addr,r_tmp1;\
        st      r_val,[r_tmp1]

#define readmem(addr,r_tmp,r_dst) \
        set     addr,r_tmp;\
        ld      [r_tmp],r_dst

#define cmpreg(reg1,reg2) \
	cmp	reg1,reg2;\
	bne,a   %xcc,1f;\
	or      %o0,%o1,%o0;\
1:

#define icmpreg(reg1,reg2) \
	cmp     reg1,reg2;\
	bne,a   %icc,1f;\
	or      %o0,%o1,%o0;\
1:\

#define chkreg(reg1,reg2) \
	cmp     reg1,reg2;\
	be      %xcc,1f;\
	nop;\
	rd	%pc,%o0;\
	EXIT1;\
1:\

#define fcmpreg(reg1,reg2) \
	fcmps	%fcc0,reg1,reg2;\
	nop;\
	fbne,a	%fcc0,1f;\
	or	%o0,%o1,%o0;\
1:\

#define getcc(reg) \
	rd	%ccr,reg

#define putcc(val) \
	wr	%g0,val,%ccr

#define setd(val1,val2,reg1,reg2) \
	set	val1,reg1;\
	set	val2,reg2;
 
#define settrp(tbladdr,tmpreg1,tmpreg2) \
        set     tbladdr,tmpreg1;\
        mov     1,tmpreg2;\
        st      tmpreg2,[tmpreg1];

#define dcmp(reg11,reg12,reg21,reg22) \
        cmp     reg11,reg12;\
        bne,a   %xcc,1f;\
        or      %o0,%o1,%o0;\
1:\
        cmp     reg21,reg22;\
        bne,a   %xcc,1f;\
        or      %o0,%o1,%o0;\
1:

#define qcmp(reg11,reg12,reg13,reg14,reg21,reg22,reg23,reg24) \
        cmp     reg11,reg12;\
        bne,a   %xcc,1f;\
        or      %o0,%o1,%o0;\
1:\
        cmp     reg13,reg14;\
        bne,a   %xcc,1f;\
        or      %o0,%o1,%o0;\
1:\
        cmp     reg21,reg22;\
        bne,a   %xcc,1f;\
        or      %o0,%o1,%o0;\
1:\
        cmp     reg23,reg24;\
        bne,a   %xcc,1f;\
        or      %o0,%o1,%o0;\
1:
 
#define fcmpdreg(reg1,reg2) \
        fcmpd   %fcc0,reg1,reg2;\
        nop;\
        fbne,a  %fcc0,1f;\
        or      %o0,%o1,%o0;\
1:\
 
#define fcmpqreg(reg1,reg2) \
        fcmpq   %fcc0,reg1,reg2;\
        nop;\
        fbne,a  %fcc0,1f;\
        or      %o0,%o1,%o0;\
1:\
 
#define disblfp(reg1) \
        rd      %fprs,reg1;\
        and     reg1,0x3,reg1;\
        wr      %g0,reg1,%fprs
 
#define enablfp(reg1) \
        rd      %fprs,reg1;\
        or      reg1,0x4,reg1;\
        wr      %g0,reg1,%fprs;\
        rdpr    %pstate,reg1;\
        or      reg1,0x10,reg1;\
        wrpr    %g0,reg1,%pstate
 
#define getcc(reg) \
        rd      %ccr,reg
 
#define putcc(val) \
        wr      %g0,val,%ccr\
 
#define setgreg(val) \
        mov     val,%g1;\
        mov     val,%g2;\
        mov     val,%g3;\
        mov     val,%g4;\
        mov     val,%g5;\
        mov     val,%g6;\
        mov     val,%g7\
 
#define setireg(val) \
        mov     val,%i0;\
        mov     val,%i1;\
        mov     val,%i2;\
        mov     val,%i3;\
        mov     val,%i4;\
        mov     val,%i5;\
        mov     val,%i6;\
        mov     val,%i7\
        
#define setlreg(val) \
        mov     val,%l0;\
        mov     val,%l1;\
        mov     val,%l2;\
        mov     val,%l3;\
        mov     val,%l4;\
        mov     val,%l5;\
        mov     val,%l6;\
        mov     val,%l7\

#define setoreg(val) \
        mov     val,%o0;\
        mov     val,%o1;\
        mov     val,%o2;\
        mov     val,%o3;\
        mov     val,%o4;\
        mov     val,%o5;\
        mov     val,%o6;\
        mov     val,%o7\
 
 
#define setfcc0(val,tmpreg1,tmpreg2)\
        .seg "data";\
        .align  8;\
1:      .word   0,0;\
        .word   0xffffffff,0xfffff3ff;\
        .seg "text";\
        set     1b,tmpreg1;\
        stx     %fsr,[tmpreg1];\
        ldx     [tmpreg1],tmpreg2;\
        ldx     [tmpreg1+8],tmpreg1;\
        and     tmpreg2,tmpreg1,tmpreg2;\
        set     val,tmpreg1;\
        sllx    tmpreg1,10,tmpreg1;\
        or      tmpreg2,tmpreg1,tmpreg2;\
        set     1b,tmpreg1;\
        stx     tmpreg2,[tmpreg1];\
        ldx     [tmpreg1],%fsr
        
#define setfcc1(val,tmpreg1,tmpreg2)\
        .seg "data";\
        .align  8;\
1:      .word   0,0;\
        .word   0xfffffffc,0xffffffff;\
        .seg "text";\
        set     1b,tmpreg1;\
        stx     %fsr,[tmpreg1];\
        ldx     [tmpreg1],tmpreg2;\
        ldx     [tmpreg1+8],tmpreg1;\
        and     tmpreg2,tmpreg1,tmpreg2;\
        set     val,tmpreg1;\
        sllx    tmpreg1,32,tmpreg1;\
        or      tmpreg2,tmpreg1,tmpreg2;\
        set     1b,tmpreg1;\
        stx     tmpreg2,[tmpreg1];\
        ldx     [tmpreg1],%fsr
        
#define setfcc2(val,tmpreg1,tmpreg2)\
        .seg "data";\
        .align  8;\
1:      .word   0,0;\
        .word   0xfffffff3,0xffffffff;\
        .seg "text";\
        set     1b,tmpreg1;\
        stx     %fsr,[tmpreg1];\
        ldx     [tmpreg1],tmpreg2;\
        ldx     [tmpreg1+8],tmpreg1;\
        and     tmpreg2,tmpreg1,tmpreg2;\
        set     val,tmpreg1;\
        sllx    tmpreg1,34,tmpreg1;\
        or      tmpreg2,tmpreg1,tmpreg2;\
        set     1b,tmpreg1;\
        stx     tmpreg2,[tmpreg1];\
        ldx     [tmpreg1],%fsr
 
#define setfcc3(val,tmpreg1,tmpreg2)\
        .seg "data";\
        .align  8;\
1:      .word   0,0;\
        .word   0xffffffcf,0xffffffff;\
        .seg "text";\
        set     1b,tmpreg1;\
        stx     %fsr,[tmpreg1];\
        ldx     [tmpreg1],tmpreg2;\
        ldx     [tmpreg1+8],tmpreg1;\
        and     tmpreg2,tmpreg1,tmpreg2;\
        set     val,tmpreg1;\
        sllx    tmpreg1,36,tmpreg1;\
        or      tmpreg2,tmpreg1,tmpreg2;\
        set     1b,tmpreg1;\
        stx     tmpreg2,[tmpreg1];\
        ldx     [tmpreg1],%fsr
        
#define getfcc0(reg)\
        .seg "data";\
        .align  8;\
1:      .word   0,0;\
        .seg "text";\
        set     1b,reg;\
        stx     %fsr,[reg];\
        ldx     [reg],reg;\
        srlx    reg,10,reg;\
        and     reg,0x3,reg
 
#define getfcc1(reg)\
        .seg "data";\
        .align  8;\
1:      .word   0,0;\
        .seg "text";\
        set     1b,reg;\
        stx     %fsr,[reg];\
        ldx     [reg],reg;\
        srlx    reg,32,reg;\
        and     reg,0x3,reg
        
#define getfcc2(reg)\
        .seg "data";\
        .align  8;\
1:      .word   0,0;\
        .seg "text";\
        set     1b,reg;\
        stx     %fsr,[reg];\
        ldx     [reg],reg;\
        srlx    reg,34,reg;\
        and     reg,0x3,reg
 
#define getfcc3(reg)\
        .seg "data";\
        .align  8;\
1:      .word   0,0;\
        .seg "text";\
        set     1b,reg;\
        stx     %fsr,[reg];\
        ldx     [reg],reg;\
        srlx    reg,36,reg;\
        and     reg,0x3,reg
        

#define getfcc2(reg)\
        .seg "data";\
        .align  8;\
1:      .word   0,0;\
        .seg "text";\
        set     1b,reg;\
        stx     %fsr,[reg];\
        ldx     [reg],reg;\
        srlx    reg,34,reg;\
        and     reg,0x3,reg
 
#define getfcc3(reg)\
        .seg "data";\
        .align  8;\
1:      .word   0,0;\
        .seg "text";\
        set     1b,reg;\
        stx     %fsr,[reg];\
        ldx     [reg],reg;\
        srlx    reg,36,reg;\
        and     reg,0x3,reg
        


#define NOP4 nop;nop;nop;nop

#define CHECK_VALID(reg,val,err)  cmp %reg,val;\
                                  bne,a mexit;\
                                  mov err,%o0

#ifdef SI_DIAG
#define WSTATE_NORMAL_MAX 0x7
#endif

