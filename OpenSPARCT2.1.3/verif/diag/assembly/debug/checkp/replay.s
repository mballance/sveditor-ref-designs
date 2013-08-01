/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: replay.s
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
#define ASI_INTR_ID 0x63
#include "checkp.h"
.seg "text"
.register %g2,#scratch
.register %g3,#scratch
.register %g6,#scratch
.register %g7,#scratch
/*{{{  dump memory     (rdaddr,wraddr, tempreg, tempreg1, count)*/
#define dump_memory(rdaddr,wraddr, tempreg, tempreg1, count) \
6:                                                                    ;\
ldda [rdaddr]0xf0, %f0                                              ;\
stda %f0, [wraddr]0xe0                                                ;\
add rdaddr, 0x40, rdaddr                                            ;\
subcc count, 0x40, count                                        ;\
bne 6b                                                                ;\
add wraddr, 0x40, wraddr                                              ;\
membar #Sync                                                          ;\

/*}}}  */
/*{{{  dump pages (rdaddr,wraddr, temppage, tempreg, tempreg1, tempreg2, asi_num, stride, count)*/
#define PA_MASK 0x7ffffffe000
/*
  save
*/
#define dump_pages(rdaddr,wraddr, temppage, tempreg, tempreg1, tempreg2, asi_num, stride, count) \
ldxa [%g0]0x45, tempreg1                                              ;\
mov 3, tempreg2                                                       ;\
sllx tempreg2, 48, tempreg2                                           ;\
xor tempreg1, tempreg2, tempreg1                                             ;\
xor tempreg1, 8, tempreg1                                             ;\
stxa tempreg1, [%g0]0x45                                              ;\
membar #Sync                                                          ;\
ba 8f ;\
nop ;\
0:                                                                    ;\
ldxa [rdaddr]asi_num, tempreg                                         ;\
                                                                      ;\
setx PA_MASK, tempreg2, tempreg1                                      ;\
srlx tempreg, 61, tempreg2                                            ;\
and tempreg, tempreg1, tempreg                                        ;\
                                                                      ;\
mov 1, tempreg1                                                       ;\
subcc tempreg2, 0x4, %g0                                              ;\
be 1f                                                                 ;\
nop                                                                   ;\
subcc tempreg2, 0x5, %g0                                              ;\
be 2f                                                                 ;\
nop                                                                   ;\
subcc tempreg2, 0x6, %g0                                              ;\
be 3f                                                                 ;\
nop                                                                   ;\
subcc tempreg2, 0x7, %g0                                              ;\
be 4f                                                                 ;\
nop                                                                   ;\
ba 7f                                                                 ;\
nop                                                                   ;\
                                                                      ;\
1:                                                                    ;\
sllx tempreg1, 13, tempreg1                                           ;\
ba 5f                                                                 ;\
nop                                                                   ;\
2:                                                                    ;\
sllx tempreg1, 16, tempreg1                                           ;\
ba 5f                                                                 ;\
nop                                                                   ;\
3:                                                                    ;\
sllx tempreg1, 19, tempreg1                                           ;\
ba 5f                                                                 ;\
nop                                                                   ;\
4:                                                                    ;\
sllx tempreg1, 22, tempreg1                                           ;\
5:                                                                    ;\
srlx tempreg, 40, tempreg2                                            ;\
andcc tempreg2, 7, tempreg2                                           ;\
brnz tempreg2,7f                                                      ;\
nop                                                                   ;\
stxa tempreg, [temppage]0x14                                          ;\
setx 0x4000e602100, tempreg, tempreg2 ;\
ldxa [temppage]0x14, tempreg ; \
stxa tempreg, [tempreg2]0x15 ; \
8: ;\
set 1, tempreg1  ;\
sllx tempreg1, 28, tempreg1 ;\
set 0x3, tempreg            ;\
sllx tempreg, 28, tempreg    ;\
6:                                                                    ;\
ldda [tempreg]0xf0, %f0                                              ;\
stda %f0, [wraddr]0xe0                                                ;\
add tempreg, 0x40, tempreg                                            ;\
subcc tempreg1, 0x40, tempreg1                                        ;\
bne 6b                                                                ;\
add wraddr, 0x40, wraddr                                              ;\
membar #Sync                                                          ;\
ba 9f ;\
7:                                                                    ;\
subcc count, 1, count                                                 ;\
bne 0b                                                                ;\
add rdaddr, stride, rdaddr                                            ;\
9:                                                                    ;\
membar #Sync                                                          ;\
ldxa [%g0]0x45, tempreg1                                              ;\
mov 3, tempreg2                                                       ;\
sllx tempreg2, 48, tempreg2                                           ;\
xor tempreg1, 8, tempreg1                                             ;\
xor tempreg1, tempreg2, tempreg1                                      ;\
stxa tempreg1, [%g0]0x45                                              ;\
membar #Sync                                                          ;\



!stxa wraddr, [tempreg2]0x15 ; \
!ba 7f                                                                 ;\
!nop ;\
!ldxa [tempreg]0x14, %f0                                               ;\

/*}}}  */
/*{{{  64bit asi x8 dump (rdaddr,wraddr, tempaddr, tempreg, asi, stride, count)*/

#define asi_dump(rdaddr,wraddr, tempaddr, tempreg, asi_num, stride, count) \
srlx count, 3, count                                                  ;\
1:                                                                     \
ldxa [rdaddr]asi_num, tempreg                                          ;\
add rdaddr, stride, rdaddr                                             ;\
stx tempreg,[tempaddr]                                            ;\
ldd [tempaddr], %f0                                               ;\
                                                                       ;\
ldxa [rdaddr]asi_num, tempreg                                          ;\
add rdaddr, stride, rdaddr                                             ;\
stx tempreg,[tempaddr+0x8]                                        ;\
ldd [tempaddr+0x8], %f2                                           ;\
                                                                       ;\
ldxa [rdaddr]asi_num, tempreg                                          ;\
add rdaddr, stride, rdaddr                                             ;\
stx tempreg,[tempaddr+0x10]                                       ;\
ldd [tempaddr+0x10], %f4                                          ;\
                                                                       ;\
ldxa [rdaddr]asi_num, tempreg                                          ;\
add rdaddr, stride, rdaddr                                             ;\
stx tempreg,[tempaddr+0x18]                                       ;\
ldd [tempaddr+0x18], %f6                                          ;\
                                                                       ;\
ldxa [rdaddr]asi_num, tempreg                                          ;\
add rdaddr, stride, rdaddr                                             ;\
stx tempreg,[tempaddr+0x20]                                       ;\
ldd [tempaddr+0x20], %f8                                          ;\
                                                                       ;\
ldxa [rdaddr]asi_num, tempreg                                          ;\
add rdaddr, stride, rdaddr                                             ;\
stx tempreg,[tempaddr+0x28]                                       ;\
ldd [tempaddr+0x28], %f10                                         ;\
                                                                       ;\
ldxa [rdaddr]asi_num, tempreg                                          ;\
add rdaddr, stride, rdaddr                                             ;\
stx tempreg,[tempaddr+0x30]                                       ;\
ldd [tempaddr+0x30], %f12                                         ;\
                                                                       ;\
ldxa [rdaddr]asi_num, tempreg                                          ;\
add rdaddr, stride, rdaddr                                             ;\
stx tempreg,[tempaddr+0x38]                                       ;\
ldd [tempaddr+0x38], %f14                                         ;\
                                                                       ;\
membar #Sync                                                           ;\
stda %f0, [wraddr]0xf0                                                 ;\
add wraddr, 0x40, wraddr                                               ;\
subcc count, 1, count                                                   ;\
bne 1b                                                                 ;\
nop

!copy data out to memory                                               ;\
!  ldda [tempaddr]0xf0,%f0                                             ;\

/*}}}  */
/*{{{  dmmu off*/
#define dmmu_off(tempreg1, tempreg2) \
set 3, tempreg2                 ;\
sllx tempreg2, 48, tempreg2     ;\
ldxa [%g0]0x45, tempreg1        ;\
or tempreg1, tempreg2, tempreg1 ;\
andn tempreg1, 8, tempreg1      ;\
stxa tempreg1, [%g0]0x45        ;\
membar #Sync                    ;\
/*}}}  */
/*{{{  dmmu on*/
#define dmmu_on(tempreg1, tempreg2) \
set 3, tempreg2                 ;\
sllx tempreg2, 48, tempreg2     ;\
ldxa [%g0]0x45, tempreg1        ;\
andn tempreg1, tempreg2, tempreg1 ;\
or tempreg1, 8, tempreg1      ;\
stxa tempreg1, [%g0]0x45        ;\
membar #Sync                    ;\
/*}}}  */

setx DUMP_BASE_ADDR, %g3, %g1
        ldxa    [%g0]ASI_INTR_ID, %g3
and     %g3, 0x3f, %g3
sllx    %g3, 16 , %g3
add %g1, %g3, %g3
add %g3, 0x800, %g2
!xxx fprs should be part of checkpoint
wr  %g0, 7, %fprs
!wr  %g0, 0, %fprs
/*{{{  dump sparc registers*/
mov %g3, %g1
mov %g2, %g5
!get gl correct here, and copy %g5 into correct gl level
ldx [%g5+8], %g3
mov %g5, %l5
wrpr %g3, %gl
mov %l5, %g5


#include "dump_regs.h"

mov %g5, %g2
mov %g1, %g3

! add %g2, 0x40, %g2
! andn %g2, 0x3f, %g2

/*}}}  */
add %g2, 0x3f, %g2
andn %g2, 0x3f, %g2
/*{{{  load scratchpad*/
mov 0, %g5
1:
ldx [%g2], %g1
stxa %g1, [%g5]0x4f
add %g5, 8, %g5
subcc %g5, 0x40, %g0
bne 1b
add %g2, 0x8, %g2

/*}}}  */
/*{{{  load interrupt*/
mov 0, %g5
mov 0x3c0, %g6
1:
ldx [%g2+%g5], %g1
stxa %g1, [%g6]0x25
add %g5, 8, %g5
subcc %g5, 0x40, %g0
bne 1b
add %g6, 8, %g6
add %g2, 0x40, %g2

!interrupt pending
ldx [%g2], %g1
add %g2, 8, %g2

!mondo data
ldx [%g2], %g1
add %g2, 8, %g2

!mondo data
ldx [%g2], %g1
add %g2, 8, %g2

!mondo busy
ldx [%g2], %g1
add %g2, 8, %g2

/*}}}  */
add %g2, 0x3f, %g2
andn %g2, 0x3f, %g2

        ldxa    [%g0]ASI_INTR_ID, %g1
andcc %g1, 0x7, %g0
bne not_thr_0_of_core
nop
mov 0x80, %g5
stxa %g0, [%g5]0x5f
!blow away TLB contents in case they upset new stuff
stxa %g0, [%g5]0x57
#if 0
/*{{{  load itlb*/
setx 0x00ffffffffffe000, %g1, %g7

mov 0, %g5
1:
mov 0x30, %g6
add %g2, 0x200, %g4
ldx [%g4+%g5], %g1
stxa %g1, [%g6]0x50

ldx [%g2+%g5], %g6
srlx %g6, 63, %g4
!don't write entry into TLB if not valid (might evict an earlier valid entry with same VA/ctx)
brz %g4, 3f
xor %g1, %g6, %g1
andcc %g1, %g7, %g0
bne 2f
nop
or %g5, 0x200, %g5
2:
stxa %g6, [%g5]0x55
3:
andcc %g5, 0x1ff, %g5
add %g5, 8, %g5
subcc %g5, 0x200, %g0
bne 1b
nop
/*}}}  */
!add %g2, 0x400, %g2
/*{{{  load itlb again - only entries with used bit*/
setx 0x00ffffffffffe000, %g1, %g7

mov 0, %g5
1:
mov 0x30, %g6
add %g2, 0x200, %g4
ldx [%g4+%g5], %g1
stxa %g1, [%g6]0x50

ldx [%g2+%g5], %g6
srlx %g6, 63, %g4
!don't write entry into TLB if not valid (might evict an earlier valid entry with same VA/ctx)
brz %g4, 3f
xor %g1, %g6, %g1
andcc %g1, %g7, %g0
bne 2f
nop
or %g5, 0x200, %g5
2:
!don't write entry a second time if we don't want to set used bit
mov 1, %g1
sllx %g1, 47, %g1
andcc %g1, %g6, %g1
brz %g1, 3f
nop
stxa %g6, [%g5]0x55
3:
andcc %g5, 0x1ff, %g5
add %g5, 8, %g5
subcc %g5, 0x200, %g0
bne 1b
nop
/*}}}  */
add %g2, 0x400, %g2
/*{{{  load dtlb*/
setx 0x00ffffffffffe000, %g1, %g7
mov 0, %g5
1:
mov 0x30, %g6
add %g2, 0x200, %g4
ldx [%g4+%g5], %g1
stxa %g1, [%g6]0x58
ldx [%g2+%g5], %g6
srlx %g6, 63, %g4
!don't write entry into TLB if not valid (might evict an earlier valid entry with same VA/ctx)
brz %g4, 3f
xor %g1, %g6, %g1
andcc %g1, %g7, %g0
bne 2f
nop
or %g5, 0x200, %g5
2:
stxa %g6, [%g5]0x5d
3:
andcc %g5, 0x1ff, %g5
add %g5, 8, %g5
subcc %g5, 0x200, %g0
bne 1b
nop



/*}}}  */
!add %g2, 0x400, %g2
/*{{{  load dtlb again - only entries with used bit*/
setx 0x00ffffffffffe000, %g1, %g7
mov 0, %g5
1:
mov 0x30, %g6
add %g2, 0x200, %g4
ldx [%g4+%g5], %g1
stxa %g1, [%g6]0x58
ldx [%g2+%g5], %g6
srlx %g6, 63, %g4
!don't write entry into TLB if not valid (might evict an earlier valid entry with same VA/ctx)
brz %g4, 3f
xor %g1, %g6, %g1
andcc %g1, %g7, %g0
bne 2f
nop
or %g5, 0x200, %g5
2:

!don't write entry a second time if we don't want to set used bit
mov 1, %g1
sllx %g1, 47, %g1
andcc %g1, %g6, %g1
brz %g1, 3f
nop
stxa %g6, [%g5]0x5d
3:
andcc %g5, 0x1ff, %g5
add %g5, 8, %g5
subcc %g5, 0x200, %g0
bne 1b
nop



/*}}}  */
add %g2, 0x400, %g2
#endif
not_thr_0_of_core:

#if 0
setx DUMP_BASE_ADDR, %g3, %g1
/*{{{  align threads*/
!sync up all the stick regs
!setx 0x80000010, %g1, %g3
!ldx [%g3], %g6

setx DUMP_BASE_ADDR, %g3, %g1
        ldxa    [%g0]ASI_INTR_ID, %g3
and     %g3, 0x3f, %g3


/*{{{  spin waiting for all threads to arrive...*/
#ifndef THREAD_COUNT
#define NUM_THREADS 8
#else
#define NUM_THREADS THREAD_COUNT
#endif
mov 1, %g2
stb %g2, [%g1+%g3]

!wait for all threads to set sync byte
2:
mov 0, %g2
mov 0, %g5
1:
ldub [%g1+%g2], %g4
add %g4, %g5, %g5
subcc %g2, (NUM_THREADS-1), %g0
bne 1b
add %g2, 1, %g2
subcc %g5, NUM_THREADS, %g0
bne 2b
nop


add %g1, 0x40, %g1
mov 1, %g2
stb %g2, [%g1+%g3]

!wait for all threads to set sync byte
2:
mov 0, %g2
mov 0, %g5
1:
ldub [%g1+%g2], %g4
add %g4, %g5, %g5
subcc %g2, (NUM_THREADS-1), %g0
bne 1b
add %g2, 1, %g2
subcc %g5, NUM_THREADS, %g0
bne 2b
nop

sub %g1, 0x40, %g1

stb %g0, [%g1+%g3]
!wait for all threads to clear sync byte
2:
mov 0, %g2
mov 0, %g5
1:
ldub [%g1+%g2], %g4
add %g4, %g5, %g5
subcc %g2, (NUM_THREADS-1), %g0
bne 1b
add %g2, 1, %g2
subcc %g5, 0, %g0
bne 2b
nop

add %g1, 0x40, %g1
stb %g0, [%g1+%g3]
!wait for all threads to clear sync byte
2:
mov 0, %g2
mov 0, %g5
1:
ldub [%g1+%g2], %g4
add %g4, %g5, %g5
subcc %g2, (NUM_THREADS-1), %g0
bne 1b
add %g2, 1, %g2
subcc %g5, 0, %g0
bne 2b
nop
sub %g1, 0x40, %g1
/*}}}  */
! addcc %g3, %g0, %g0
! bne dont_dump
sllx    %g3, 16 , %g3
or %g1, %g3, %g3

!add %g3, 0x80, %g3
!mov %fprs, %g1
!mov 4, %fprs
!stx %g1 ,[%g3]
!add %g3, 0x800, %g2

!sync up all the stick regs
!setx 0x80000010, %g1, %g3
!addcc %g6, %g0, %g0
!bne 1f
!nop
!add   %g6, 1, %g1
! wr %g0,  %asr24
!stx %g1, [%g3]
!1:
/*}}}  */
!poke interrupt units to deliver anything pending
        ldxa    [%g0]ASI_INTR_ID, %g3
andcc     %g3, 0x3f, %g0
bne no_poke
/*{{{   poke interrupts*/
        !cpuids:  0x2 0x5 0x8 0x9 0xa 0xb 0xd 0xf 0x11 0x14 0x15 0x18 0x1a 0x1b 0x1d 0x1e 0x1f
        mov 0x03f, %g1
        stxa %g1,  [%g0]0x73
#if 0
        add %g1, 0x100, %g1
        add %g1, 0x100, %g1
        add %g1, 0x100, %g1
        stxa %g1,  [%g0]0x73 !5
        add %g1, 0x100, %g1
        add %g1, 0x100, %g1
        add %g1, 0x100, %g1
        stxa %g1,  [%g0]0x73 !8
        add %g1, 0x100, %g1
        stxa %g1,  [%g0]0x73
        add %g1, 0x100, %g1
        stxa %g1,  [%g0]0x73
        add %g1, 0x100, %g1
        stxa %g1,  [%g0]0x73
        add %g1, 0x100, %g1
        add %g1, 0x100, %g1
        stxa %g1,  [%g0]0x73 !d
        add %g1, 0x100, %g1
        add %g1, 0x100, %g1
        stxa %g1,  [%g0]0x73 !f
        add %g1, 0x100, %g1
        add %g1, 0x100, %g1
        stxa %g1,  [%g0]0x73 !11
        !cpuids:  0x2 0x5 0x8 0x9 0xa 0xb 0xd 0xf 0x11 0x14 0x15 0x18 0x1a 0x1b 0x1d 0x1e 0x1f
        add %g1, 0x100, %g1
        add %g1, 0x100, %g1
        add %g1, 0x100, %g1
        stxa %g1,  [%g0]0x73 !14
        add %g1, 0x100, %g1
        stxa %g1,  [%g0]0x73 !15
        add %g1, 0x100, %g1
        add %g1, 0x100, %g1
        add %g1, 0x100, %g1
        stxa %g1,  [%g0]0x73 !18
        add %g1, 0x100, %g1
        add %g1, 0x100, %g1
        stxa %g1,  [%g0]0x73 !1a
        add %g1, 0x100, %g1
        stxa %g1,  [%g0]0x73 !1b
        add %g1, 0x100, %g1
        add %g1, 0x100, %g1
        stxa %g1,  [%g0]0x73 !1d
        add %g1, 0x100, %g1
        stxa %g1,  [%g0]0x73 !1e
        add %g1, 0x100, %g1
        stxa %g1,  [%g0]0x73 !1f
#endif
/*}}}  */
/*{{{  old*/
        mov 0x43f, %g1
        stxa %g1, [%g0]0x73
        add %g1, 0x100, %g1
        stxa %g1, [%g0]0x73
        add %g1, 0x100, %g1
        stxa %g1, [%g0]0x73
        add %g1, 0x100, %g1
        stxa %g1, [%g0]0x73
/*}}}  */
#endif
no_poke:
#if 1
#else
mov %asr24, %g2
mov 1, %g1
sllx %g1, 24, %g1
add %g2, %g1, %g2
#endif
retl
nop
#if 0
sub %g0, 1, %g2
!wrhpr   %g2, %g0, %asr31
.word 0xbf988000
!wrhpr   %g0, 0, %hintp
.word 0x87982000
retry
#endif
