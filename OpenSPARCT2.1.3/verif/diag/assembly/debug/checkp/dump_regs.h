/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: dump_regs.h
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
#include "checkp_offsets.h"
   /*overwrites %g5, %g4 used as store for %cwp, uses g3 as buffer pointer and increments it to end of data buffer*/
   /*assumes we're using alternate globals */
   /*replay side overwrites scratch regs at VA0, VA8 of asi 4f */
#ifdef DUMP
   rdpr  %tl,%g3
   stx   %g3,[%g5]
   rdpr  %gl,%g3
   stx   %g3,[%g5+8]
#else
   ldx [%g5], %g3
   wrpr %g3, %tl
   ldx [%g5+8], %g3
   wrpr %g3, %gl
#endif
   add %g5, 0x10, %g5
! 5 words
/*{{{  up window state*/
#ifdef DUMP
   rdpr  %cwp,%g4
   stx   %g4,[%g5+0]
   rdpr  %cansave,%g3
   stx   %g3,[%g5+8]
   rdpr  %canrestore,%g3
   stx   %g3,[%g5+0x10]
   rdpr  %otherwin,%g3
   stx   %g3,[%g5+0x18]
   rdpr  %cleanwin,%g3
   stx   %g3,[%g5+0x20]
   rdpr  %wstate,%g3
   stx   %g3,[%g5+0x28]
#else
   ldx   [%g5+0], %g4
   wrpr  %g4,%cwp
   ldx   [%g5+8], %g3
   wrpr  %g3,%cansave
   ldx   [%g5+0x10], %g3
   wrpr  %g3,%canrestore
   ldx   [%g5+0x18], %g3
   wrpr  %g3,%otherwin
   ldx   [%g5+0x20], %g3
   wrpr  %g3,%cleanwin
   ldx   [%g5+0x28], %g3
   wrpr  %g3,%wstate
#endif
   add %g5, 0x30, %g5
/*}}}  */


   mov 8, %g3
arf_loop:
   subcc %g3, 1, %g3
   wrpr %g0, %g3, %cwp
/*{{{  dump arf*/
#ifdef DUMP
   stx   %l0,[%g5+(0*CHECKP_LOCALS_INCR)]
   stx   %l1,[%g5+(1*CHECKP_LOCALS_INCR)]
   stx   %l2,[%g5+(2*CHECKP_LOCALS_INCR)]
   stx   %l3,[%g5+(3*CHECKP_LOCALS_INCR)]
   stx   %l4,[%g5+(4*CHECKP_LOCALS_INCR)]
   stx   %l5,[%g5+(5*CHECKP_LOCALS_INCR)]
   stx   %l6,[%g5+(6*CHECKP_LOCALS_INCR)]
   stx   %l7,[%g5+(7*CHECKP_LOCALS_INCR)]
   add %g5, (CHECKP_LOCALS_INCR*8), %g5
   stx   %i0,[%g5+(0*CHECKP_INS_INCR)]
   stx   %i1,[%g5+(1*CHECKP_INS_INCR)]
   stx   %i2,[%g5+(2*CHECKP_INS_INCR)]
   stx   %i3,[%g5+(3*CHECKP_INS_INCR)]
   stx   %i4,[%g5+(4*CHECKP_INS_INCR)]
   stx   %i5,[%g5+(5*CHECKP_INS_INCR)]
   stx   %i6,[%g5+(6*CHECKP_INS_INCR)]
   stx   %i7,[%g5+(7*CHECKP_INS_INCR)]
   add %g5, (CHECKP_INS_INCR*8), %g5
#else
   ldx   [%g5+(0*CHECKP_LOCALS_INCR)],%l0
   ldx   [%g5+(1*CHECKP_LOCALS_INCR)],%l1
   ldx   [%g5+(2*CHECKP_LOCALS_INCR)],%l2
   ldx   [%g5+(3*CHECKP_LOCALS_INCR)],%l3
   ldx   [%g5+(4*CHECKP_LOCALS_INCR)],%l4
   ldx   [%g5+(5*CHECKP_LOCALS_INCR)],%l5
   ldx   [%g5+(6*CHECKP_LOCALS_INCR)],%l6
   ldx   [%g5+(7*CHECKP_LOCALS_INCR)],%l7
   add %g5, (CHECKP_LOCALS_INCR*8), %g5
   ldx   [%g5+(0*CHECKP_INS_INCR)],%i0
   ldx   [%g5+(1*CHECKP_INS_INCR)],%i1
   ldx   [%g5+(2*CHECKP_INS_INCR)],%i2
   ldx   [%g5+(3*CHECKP_INS_INCR)],%i3
   ldx   [%g5+(4*CHECKP_INS_INCR)],%i4
   ldx   [%g5+(5*CHECKP_INS_INCR)],%i5
   ldx   [%g5+(6*CHECKP_INS_INCR)],%i6
   ldx   [%g5+(7*CHECKP_INS_INCR)],%i7
   add %g5, (CHECKP_INS_INCR*8), %g5
#endif
/*}}}  */
brnz %g3,arf_loop
   add %g5, (CHECKP_INS_INCR*16), %g5
   !restore cwp
   wrpr %g0, %g4, %cwp

   ! 0x32 words x 8 = 256 bytes
#if 0
rdpr %pstate, %g3
andcc %g3, 0x10, %g0
bne 1f
nop
wrpr %g3, 0x10, %pstate
1:
/*{{{  dump fpu regs*/
#ifdef DUMP
   std   %f0, [%g5 + 0]
   std   %f2, [%g5 + (1*CHECKP_FLOATS_INCR)]
   std   %f4, [%g5 + (2*CHECKP_FLOATS_INCR)]
   std   %f6, [%g5 + (3*CHECKP_FLOATS_INCR)]
   std   %f8, [%g5 + (4*CHECKP_FLOATS_INCR)]
   std   %f10, [%g5 + (5*CHECKP_FLOATS_INCR)]
   std   %f12, [%g5 + (6*CHECKP_FLOATS_INCR)]
   std   %f14, [%g5 + (7*CHECKP_FLOATS_INCR)]
   std   %f16, [%g5 + (8*CHECKP_FLOATS_INCR)]
   std   %f18, [%g5 + (9*CHECKP_FLOATS_INCR)]
   std   %f20, [%g5 + (10*CHECKP_FLOATS_INCR)]
   std   %f22, [%g5 + (11*CHECKP_FLOATS_INCR)]
   std   %f24, [%g5 + (12*CHECKP_FLOATS_INCR)]
   std   %f26, [%g5 + (13*CHECKP_FLOATS_INCR)]
   std   %f28, [%g5 + (14*CHECKP_FLOATS_INCR)]
   std   %f30, [%g5 + (15*CHECKP_FLOATS_INCR)]
   std   %f32, [%g5 + (16*CHECKP_FLOATS_INCR)]
   std   %f34, [%g5 + (17*CHECKP_FLOATS_INCR)]
   std   %f36, [%g5 + (18*CHECKP_FLOATS_INCR)]
   std   %f38, [%g5 + (19*CHECKP_FLOATS_INCR)]
   std   %f40, [%g5 + (20*CHECKP_FLOATS_INCR)]
   std   %f42, [%g5 + (21*CHECKP_FLOATS_INCR)]
   std   %f44, [%g5 + (22*CHECKP_FLOATS_INCR)]
   std   %f46, [%g5 + (23*CHECKP_FLOATS_INCR)]
   std   %f48, [%g5 + (24*CHECKP_FLOATS_INCR)]
   std   %f50, [%g5 + (25*CHECKP_FLOATS_INCR)]
   std   %f52, [%g5 + (26*CHECKP_FLOATS_INCR)]
   std   %f54, [%g5 + (27*CHECKP_FLOATS_INCR)]
   std   %f56, [%g5 + (28*CHECKP_FLOATS_INCR)]
   std   %f58, [%g5 + (29*CHECKP_FLOATS_INCR)]
   std   %f60, [%g5 + (30*CHECKP_FLOATS_INCR)]
   std   %f62, [%g5 + (31*CHECKP_FLOATS_INCR)]
#else
   ldd [%g5+0], %f0
   ldd [%g5+(1*CHECKP_FLOATS_INCR)], %f2
   ldd [%g5+(2*CHECKP_FLOATS_INCR)], %f4
   ldd [%g5+(3*CHECKP_FLOATS_INCR)], %f6
   ldd [%g5+(4*CHECKP_FLOATS_INCR)], %f8
   ldd [%g5+(5*CHECKP_FLOATS_INCR)], %f10
   ldd [%g5+(6*CHECKP_FLOATS_INCR)], %f12
   ldd [%g5+(7*CHECKP_FLOATS_INCR)], %f14
   ldd [%g5+(8*CHECKP_FLOATS_INCR)], %f16
   ldd [%g5+(9*CHECKP_FLOATS_INCR)], %f18
   ldd [%g5+(10*CHECKP_FLOATS_INCR)], %f20
   ldd [%g5+(11*CHECKP_FLOATS_INCR)], %f22
   ldd [%g5+(12*CHECKP_FLOATS_INCR)], %f24
   ldd [%g5+(13*CHECKP_FLOATS_INCR)], %f26
   ldd [%g5+(14*CHECKP_FLOATS_INCR)], %f28
   ldd [%g5+(15*CHECKP_FLOATS_INCR)], %f30
   ldd [%g5+(16*CHECKP_FLOATS_INCR)], %f32
   ldd [%g5+(17*CHECKP_FLOATS_INCR)], %f34
   ldd [%g5+(18*CHECKP_FLOATS_INCR)], %f36
   ldd [%g5+(19*CHECKP_FLOATS_INCR)], %f38
   ldd [%g5+(20*CHECKP_FLOATS_INCR)], %f40
   ldd [%g5+(21*CHECKP_FLOATS_INCR)], %f42
   ldd [%g5+(22*CHECKP_FLOATS_INCR)], %f44
   ldd [%g5+(23*CHECKP_FLOATS_INCR)], %f46
   ldd [%g5+(24*CHECKP_FLOATS_INCR)], %f48
   ldd [%g5+(25*CHECKP_FLOATS_INCR)], %f50
   ldd [%g5+(26*CHECKP_FLOATS_INCR)], %f52
   ldd [%g5+(27*CHECKP_FLOATS_INCR)], %f54
   ldd [%g5+(28*CHECKP_FLOATS_INCR)], %f56
   ldd [%g5+(29*CHECKP_FLOATS_INCR)], %f58
   ldd [%g5+(30*CHECKP_FLOATS_INCR)], %f60
   ldd [%g5+(31*CHECKP_FLOATS_INCR)], %f62
#endif
/*}}}  */
wrpr %g3, 0x0, %pstate
#endif
   add %g5, (32*CHECKP_FLOATS_INCR), %g5

/*{{{  dump program state also trap state regs*/
#ifdef DUMP
   ! 0x50 bytes
   rd    %y,%g3
   stx   %g3,[%g5+0]
 !  stx   %fsr,[%g5+8]
   rd    %asi,%g3
   stx   %g3,[%g5+0x10]


   rdpr  %pstate,%g3
   stx   %g3,[%g5+0x20]

   rdpr  %pil,%g3
   stx   %g3,[%g5+0x28]

   rdpr  %tba,%g3
   stx   %g3,[%g5+0x30]
   mov %asr24, %g3 !stick
   stx   %g3,[%g5+0x38]
   mov %asr25, %g3 !stick_cmp
   stx   %g3,[%g5+0x40]
   rdpr %tick, %g3
   stx   %g3,[%g5+0x48]
   rd  %tick_cmpr, %g3
   stx   %g3,[%g5+0x50]

 !  mov %gsr, %g3
   stx   %g3,[%g5+0x58]
   rd   %softint,%g3
   stx   %g3,[%g5+0x60]

   add %g5, 0x68, %g5


/*{{{  dump trap state regs for TL 1 thru 6*/
   rdpr  %tl,%g4

   mov 1, %g3
1:
   wrpr %g3, %tl

   rdpr  %tstate,%g3
   stx   %g3,[%g5+0x0]
   rdpr  %tpc,%g3
   stx   %g3,[%g5+0x8]
   rdpr  %tnpc,%g3
   stx   %g3,[%g5+0x10]
   rdpr  %tt,%g3
   stx   %g3,[%g5+0x18]
   rdhpr  %htstate,%g3
   stx   %g3,[%g5+0x20]
   add   %g5, 0x28, %g5
   rdpr  %tl,%g3
   subcc %g3, 6, %g0
   bne 1b
   add %g3, 1, %g3

   wrpr %g4, %tl
/*}}}  */


   ! 0x68 bytes + 32*num TL bytes
#else

ldx   [%g5+0],%g3
wr %g3, %y
! ldx [%g5+8], %fsr
ldx [%g5+0x10], %g3
wr %g3, %g0, %asi
ldx [%g5+0x20], %g3
wrpr %g3, %pstate
ldx [%g5+0x28], %g3
wrpr %g3, %pil
ldx [%g5+0x30], %g3
wrpr %g3, %tba
ldx   [%g5+0x38], %g3
mov %g3, %asr24
ldx   [%g5+0x40], %g3
mov %g3, %asr25
ldx   [%g5+0x48], %g3
wrpr %g3, %tick
ldx   [%g5+0x50], %g3
wr %g3, %g0, %tick_cmpr
ldx   [%g5+0x58], %g3
!mov %g3,  %gsr
ldx   [%g5+0x60], %g3
wr %g3, %g0,  %set_softint
add %g5, 0x68, %g5

/*{{{  read trap regs*/
rdpr  %tl,%g4
mov 1, %g3
tl_loop:
wrpr %g3, %tl

ldx [%g5+0x0], %g3
wrpr %g3, %tstate
ldx [%g5+0x8], %g3
wrpr %g3, %tpc
ldx [%g5+0x10], %g3
wrpr %g3, %tnpc
ldx [%g5+0x18], %g3
wrpr %g3, %tt
ldx [%g5+0x20], %g3
wrhpr %g3, %htstate
add   %g5, 0x28, %g5

rdpr  %tl,%g3
subcc %g3, 6, %g0
bne tl_loop
add %g3, 1, %g3

wrpr %g4, %tl
/*}}}  */

#endif
/*}}}  */

/*{{{  hpriv*/
#ifdef DUMP
rdhpr  %hpstate,%g3
stx   %g3,[%g5+0x0]
rdhpr  %htstate,%g3
stx   %g3,[%g5+0x8]
rdhpr  %htba,%g3
stx   %g3,[%g5+0x10]
!rd    %asr31,%g3
!.word 0x874fc000
stx   %g3,[%g5+0x18]
add %g5, 0x20, %g5
#else
ldx   [%g5+0x0], %g3
wrhpr  %g3, %hpstate
ldx   [%g5+0x8], %g3
wrhpr  %g3, %htstate
ldx   [%g5+0x10], %g3
wrhpr  %g3, %htba
ldx   [%g5+0x18], %g3
! wrhpr   %g2, %g0, %asr31
add %g5, 0x20, %g5
#endif
/*}}}  */

/*{{{  globals*/
   ! 0x40 bytes  normal
#ifdef DUMP
   !save l1,l2 into globals g3,g5,l2 becomes g5 ptr
   mov %l2, %g3
   mov %g5, %l2
   mov %l1, %g5
#else
   !assume bottom two scratch regs aren't used yet
   wr %g0, 0x4f, %asi
   stxa %l1, [%g0]%asi
   stxa %l2, [%g0+8]%asi
   mov %g5, %l2
#endif
   rdpr %gl, %l1
   wrpr    %g0,    0, %gl
#ifdef DUMP
   stx   %g0, [%l2+(0*CHECKP_GLOBALS_INCR)]
   stx   %g1, [%l2+(1*CHECKP_GLOBALS_INCR)]
   stx   %g2, [%l2+(2*CHECKP_GLOBALS_INCR)]
   stx   %g3, [%l2+(3*CHECKP_GLOBALS_INCR)]
   stx   %g4, [%l2+(4*CHECKP_GLOBALS_INCR)]
   stx   %g5, [%l2+(5*CHECKP_GLOBALS_INCR)]
   stx   %g6, [%l2+(6*CHECKP_GLOBALS_INCR)]
   stx   %g7, [%l2+(7*CHECKP_GLOBALS_INCR)]
#else
   ldx [%l2+(0*CHECKP_GLOBALS_INCR)], %g0
   ldx [%l2+(1*CHECKP_GLOBALS_INCR)], %g1
   ldx [%l2+(2*CHECKP_GLOBALS_INCR)], %g2
   ldx [%l2+(3*CHECKP_GLOBALS_INCR)], %g3
   ldx [%l2+(4*CHECKP_GLOBALS_INCR)], %g4
   ldx [%l2+(5*CHECKP_GLOBALS_INCR)], %g5
   ldx [%l2+(6*CHECKP_GLOBALS_INCR)], %g6
   ldx [%l2+(7*CHECKP_GLOBALS_INCR)], %g7
#endif
   add %l2, (8*CHECKP_GLOBALS_INCR), %l2


   wrpr    %g0,    1, %gl

#ifdef DUMP
   stx   %g0,[%l2+(0*CHECKP_GLOBALS_INCR)]
   stx   %g1,[%l2+(1*CHECKP_GLOBALS_INCR)]
   stx   %g2,[%l2+(2*CHECKP_GLOBALS_INCR)]
   stx   %g3,[%l2+(3*CHECKP_GLOBALS_INCR)]
   stx   %g4,[%l2+(4*CHECKP_GLOBALS_INCR)]
   stx   %g5,[%l2+(5*CHECKP_GLOBALS_INCR)]
   stx   %g6,[%l2+(6*CHECKP_GLOBALS_INCR)]
   stx   %g7,[%l2+(7*CHECKP_GLOBALS_INCR)]
#else
   ldx [%l2+(0*CHECKP_GLOBALS_INCR)], %g0
   ldx [%l2+(1*CHECKP_GLOBALS_INCR)], %g1
   ldx [%l2+(2*CHECKP_GLOBALS_INCR)], %g2
   ldx [%l2+(3*CHECKP_GLOBALS_INCR)], %g3
   ldx [%l2+(4*CHECKP_GLOBALS_INCR)], %g4
   ldx [%l2+(5*CHECKP_GLOBALS_INCR)], %g5
   ldx [%l2+(6*CHECKP_GLOBALS_INCR)], %g6
   ldx [%l2+(7*CHECKP_GLOBALS_INCR)], %g7
#endif
   add %l2, (8*CHECKP_GLOBALS_INCR), %l2

   wrpr    %g0,    2, %gl
#ifdef DUMP
   stx   %g0,[%l2+(0*CHECKP_GLOBALS_INCR)]
   stx   %g1,[%l2+(1*CHECKP_GLOBALS_INCR)]
   stx   %g2,[%l2+(2*CHECKP_GLOBALS_INCR)]
   stx   %g3,[%l2+(3*CHECKP_GLOBALS_INCR)]
   stx   %g4,[%l2+(4*CHECKP_GLOBALS_INCR)]
   stx   %g5,[%l2+(5*CHECKP_GLOBALS_INCR)]
   stx   %g6,[%l2+(6*CHECKP_GLOBALS_INCR)]
   stx   %g7,[%l2+(7*CHECKP_GLOBALS_INCR)]
#else
   ldx [%l2+(0*CHECKP_GLOBALS_INCR)], %g0
   ldx [%l2+(1*CHECKP_GLOBALS_INCR)], %g1
   ldx [%l2+(2*CHECKP_GLOBALS_INCR)], %g2
   ldx [%l2+(3*CHECKP_GLOBALS_INCR)], %g3
   ldx [%l2+(4*CHECKP_GLOBALS_INCR)], %g4
   ldx [%l2+(5*CHECKP_GLOBALS_INCR)], %g5
   ldx [%l2+(6*CHECKP_GLOBALS_INCR)], %g6
   ldx [%l2+(7*CHECKP_GLOBALS_INCR)], %g7
#endif
   add %l2, (8*CHECKP_GLOBALS_INCR), %l2


   wrpr    %g0,    3, %gl
#ifdef DUMP
   stx   %g0,[%l2+(0*CHECKP_GLOBALS_INCR)]
   stx   %g1,[%l2+(1*CHECKP_GLOBALS_INCR)]
   stx   %g2,[%l2+(2*CHECKP_GLOBALS_INCR)]
   stx   %g3,[%l2+(3*CHECKP_GLOBALS_INCR)]
   stx   %g4,[%l2+(4*CHECKP_GLOBALS_INCR)]
   stx   %g5,[%l2+(5*CHECKP_GLOBALS_INCR)]
   stx   %g6,[%l2+(6*CHECKP_GLOBALS_INCR)]
   stx   %g7,[%l2+(7*CHECKP_GLOBALS_INCR)]
#else
   ldx [%l2+(0*CHECKP_GLOBALS_INCR)], %g0
   ldx [%l2+(1*CHECKP_GLOBALS_INCR)], %g1
   ldx [%l2+(2*CHECKP_GLOBALS_INCR)], %g2
   ldx [%l2+(3*CHECKP_GLOBALS_INCR)], %g3
   ldx [%l2+(4*CHECKP_GLOBALS_INCR)], %g4
   ldx [%l2+(5*CHECKP_GLOBALS_INCR)], %g5
   ldx [%l2+(6*CHECKP_GLOBALS_INCR)], %g6
   ldx [%l2+(7*CHECKP_GLOBALS_INCR)], %g7
#endif


   add %l2, (8*CHECKP_GLOBALS_INCR), %l2
   wrpr %l1, %g0, %gl

#ifdef DUMP
   mov %g5, %l1
   mov %l2, %g5
   mov %g3, %l2
#else
   mov %l2, %g5
   wr %g0, 0x4f, %asi
   ldxa [%g0]%asi, %l1
   ldxa [%g0+8]%asi, %l2
#endif


/*}}}  */

#define ASI_IMMU                                0x50
#define ASI_IMMU_TAG_TARGET_REG                 0x50
#define ASI_IMMU_TAG_TARGET_REG_VAL             0x000
#define ASI_IMMU_SFSR                           0x50
#define ASI_IMMU_SFSR_VAL                       0x018
#define ASI_IMMU_TSB_BASE_Z_PS0                 0x35
#define ASI_IMMU_TSB_BASE_Z_PS1                 0x36
#define ASI_IMMU_Z_CONFIG                       0x37
#define ASI_IMMU_TSB_BASE_NZ_PS0                0x3D
#define ASI_IMMU_TSB_BASE_NZ_PS1                0x3E
#define ASI_IMMU_NZ_CONFIG                      0x3F


#define ASI_IMMU_TAG_ACCESS                     0x50
#define ASI_IMMU_TAG_ACCESS_VAL                 0x030

#define ASI_IMMU_TSB_8KB_PTR_REG                0x51
#define ASI_IMMU_TSB_64KB_PTR_REG               0x52

#define ASI_PRIMARY_CONTEXT0_REG                 0x21
#define ASI_PRIMARY_CONTEXT0_REG_VAL             0x008
#define ASI_SECONDARY_CONTEXT0_REG               0x21
#define ASI_SECONDARY_CONTEXT0_REG_VAL           0x010
#define ASI_PRIMARY_CONTEXT1_REG                 0x21
#define ASI_PRIMARY_CONTEXT1_REG_VAL             0x108
#define ASI_SECONDARY_CONTEXT1_REG               0x21
#define ASI_SECONDARY_CONTEXT1_REG_VAL           0x110
#define ASI_DMMU_SFSR                           0x58
#define ASI_DMMU_SFSR_VAL                       0x018
#define ASI_DMMU_SFAR                           0x58
#define ASI_DMMU_SFAR_VAL                       0x020

#define ASI_DMMU_PARTITION_ID                   0x58
#define ASI_DMMU_HWTW_CONFIG                    0x40
#define ASI_DMMU_PARTITION_ID_VAL               0x80
#define ASI_MMU_RANGE_OFFSET                    0x52
#define MMU_REAL_RANGE_BASE                    0x108
#define MMU_PHYS_OFFSET                        0x208
#define ASI_MMU_MISC                            0x54
#define MMU_MISC_MIN_VA                         0x10
#define MMU_MISC_MAX_VA                         0x48



#ifdef DUMP
/*{{{  dump new n2 regs*/
   mov  MMU_MISC_MIN_VA, %g3
1:
   ldxa    [%g3]ASI_MMU_MISC, %g4
   stx     %g4, [%g5]
   add     %g5, 0x8, %g5
   subcc   %g3, MMU_MISC_MAX_VA, %g0
   bne 1b
   add     %g3, 0x8, %g3

   wr      %g0, ASI_MMU_RANGE_OFFSET, %asi
   mov     MMU_REAL_RANGE_BASE, %g3
   ldxa    [%g3]%asi, %g4
   stx    %g4, [%g5]
   ldxa    [%g3+8]%asi, %g4
   stx    %g4, [%g5+8]
   ldxa    [%g3+0x10]%asi, %g4
   stx    %g4, [%g5+0x10]
   ldxa    [%g3+0x18]%asi, %g4
   stx    %g4, [%g5+0x18]
   add     %g5, 0x20, %g5

   mov     MMU_PHYS_OFFSET, %g3
   ldxa    [%g3]%asi, %g4
   stx    %g4, [%g5]
   ldxa    [%g3+8]%asi, %g4
   stx    %g4, [%g5+8]
   ldxa    [%g3+0x10]%asi, %g4
   stx    %g4, [%g5+0x10]
   ldxa    [%g3+0x18]%asi, %g4
   stx    %g4, [%g5+0x18]
   add     %g5, 0x20, %g5
/*}}}  */
/*{{{  */
   ! rdpr %ver, %g4
   stx    %g0, [%g5]
   add     %g5, 0x8, %g5
   ! 0x28 bytes
   mov     ASI_PRIMARY_CONTEXT0_REG_VAL, %g3
   ldxa    [%g3]ASI_PRIMARY_CONTEXT0_REG, %g4
   stx    %g4, [%g5]
   membar #Sync
   mov     ASI_SECONDARY_CONTEXT0_REG_VAL, %g3
   ldxa    [%g3]ASI_SECONDARY_CONTEXT0_REG, %g4
   stx    %g4, [%g5+8]
   membar #Sync
   add     %g5, 0x10, %g5
   mov     ASI_PRIMARY_CONTEXT1_REG_VAL, %g3
   ldxa    [%g3]ASI_PRIMARY_CONTEXT1_REG, %g4
   stx    %g4, [%g5]
   membar #Sync
   mov     ASI_SECONDARY_CONTEXT1_REG_VAL, %g3
   ldxa    [%g3]ASI_SECONDARY_CONTEXT1_REG, %g4
   stx    %g4, [%g5+8]
   membar #Sync
   add     %g5, 0x10, %g5

   mov    ASI_DMMU_PARTITION_ID_VAL, %g3
   ldxa   [%g3]ASI_DMMU_PARTITION_ID, %g4
   stx    %g4, [%g5]
   add     %g5, 0x8, %g5
   mov    ASI_DMMU_HWTW_CONFIG, %g3
   ldxa   [%g3]ASI_DMMU_PARTITION_ID, %g4
   stx    %g4, [%g5]
   add     %g5, 0x8, %g5


   add     %g5, 0x20, %g5
   !rdpr %ver, %g4
   stx    %g0, [%g5]
   add     %g5, 0x8, %g5




/*}}}  */
#else
/*{{{  load new n2 regs*/
   mov  MMU_MISC_MIN_VA, %g3
1:
   ldx     [%g5],%g4
   stxa    %g4,[%g3]ASI_MMU_MISC
   add     %g5, 0x8, %g5
   subcc   %g3, MMU_MISC_MAX_VA, %g0
   bne 1b
   add     %g3, 0x8, %g3

   wr      %g0, ASI_MMU_RANGE_OFFSET, %asi
   ldx     [%g5],%g4
   mov     MMU_REAL_RANGE_BASE, %g3
   stxa    %g4,[%g3]%asi
   ldx     [%g5+8],%g4
   stxa    %g4,[%g3+8]%asi
   ldx     [%g5+0x10],%g4
   stxa    %g4,[%g3+0x10]%asi
   ldx     [%g5+0x18],%g4
   stxa    %g4,[%g3+0x18]%asi
   add     %g5, 0x20, %g5

   mov     MMU_PHYS_OFFSET, %g3
   ldx     [%g5],%g4
   stxa    %g4,[%g3]%asi
   ldx     [%g5+8],%g4
   stxa    %g4,[%g3+8]%asi
   ldx     [%g5+0x10],%g4
   stxa    %g4,[%g3+0x10]%asi
   ldx     [%g5+0x18],%g4
   stxa    %g4,[%g3+0x18]%asi
   add     %g5, 0x20, %g5
/*}}}  */
/*{{{  */
   ! rdpr %ver, %g4
!   stx    %g0, [%g5]
   add     %g5, 0x8, %g5
   ! 0x28 bytes
   mov     ASI_PRIMARY_CONTEXT0_REG_VAL, %g3
   ldx     [%g5],%g4
   stxa    %g4,[%g3]ASI_PRIMARY_CONTEXT0_REG
   membar #Sync
   mov     ASI_SECONDARY_CONTEXT0_REG_VAL, %g3
   ldx     [%g5+8],%g4
   stxa    %g4,[%g3]ASI_SECONDARY_CONTEXT0_REG
   membar #Sync
   add     %g5, 0x10, %g5
   mov     ASI_PRIMARY_CONTEXT1_REG_VAL, %g3
   ldx     [%g5] ,%g4
   stxa    %g4,[%g3]ASI_PRIMARY_CONTEXT1_REG
   membar #Sync
   mov     ASI_SECONDARY_CONTEXT1_REG_VAL, %g3
   ldx     [%g5+8] ,%g4
   stxa    %g4,[%g3]ASI_SECONDARY_CONTEXT1_REG
   membar #Sync
   add     %g5, 0x10, %g5

   mov    ASI_DMMU_PARTITION_ID_VAL, %g3
   ldx    [%g5]  ,%g4
   stxa   %g4,[%g3]ASI_DMMU_PARTITION_ID
   add     %g5, 0x8, %g5
   mov    ASI_DMMU_HWTW_CONFIG, %g3
   ldx    [%g5]  ,%g4
   stxa   %g4,[%g3]ASI_DMMU_PARTITION_ID
   add     %g5, 0x8, %g5


   add     %g5, 0x20, %g5
   !rdpr %ver, %g4
 !  ldx    %g0, [%g5]
   add     %g5, 0x8, %g5




/*}}}  */
#endif

