/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ncu_ssi_mt.s
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

#include "hboot.s"
#include "asi_s.h"

.text
.global	 main


main:
    ta   T_CHANGE_HPRIV

get_th_id:
    ta   T_RD_THID
    wr   %g0,ASI_CMP_CORE,%asi

    cmp  %o1,0x0
    be   thrd_0
    nop
    cmp  %o1,54
    be   thrd_54
    nop
    ba   test_fail
    nop

thrd_0:
!Write double words to the SSI interface
    setx 0x000000ffffff0300,%g7,%g1
    setx data_xword,%g7,%g2
    set  0x10,%g3
loop0:
    ldub [%g2],%g4
    stb  %g4,[%g1]
    add  %g1,8,%g1
    add  %g2,8,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop0
    nop

    setx 0x0040000000000000,%g7,%g1
    stxa %g1,[ASI_CMP_CORE_RUNNING_RW]%asi

halt:
    ba halt
    nop

thrd_54:
!Read back and confirm
    setx 0x000000ffffff0300,%g7,%g1
    setx data_xword,%g7,%g2
    set  0x10,%g3
loop1:
    ldub [%g1],%g4
    ldub [%g2],%g5
    cmp  %g4,%g5
    bne  %xcc,test_fail
    nop
    add  %g1,8,%g1
    add  %g2,8,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop1
    nop

    ba   test_pass
    nop

/******************************************************
 * Exit code
 *******************************************************/

test_pass:
EXIT_GOOD

test_fail:
EXIT_BAD

.data
.align 0x100
data_byte:
    .byte 0x23
    .byte 0x39
    .byte 0x48
    .byte 0xa6
    .byte 0xab
    .byte 0xc3
    .byte 0x8f
    .byte 0xde
    .byte 0xb2
    .byte 0x20
    .byte 0x99
    .byte 0x8a
    .byte 0x33
    .byte 0x5b
    .byte 0xbf
    .byte 0xa0
    .byte 0x10
    .byte 0x02
    .byte 0xbc
    .byte 0xad
    .byte 0xae
    .byte 0x92
    .byte 0x44
    .byte 0x3c
    .byte 0xff
    .byte 0xf1
    .byte 0x9f
    .byte 0x6d
    .byte 0xeb
    .byte 0xda
    .byte 0xd3
    .byte 0xa8

.align 0x100
data_half_word:
    .hword 0x34ad
    .hword 0xfbac
    .hword 0xd82c
    .hword 0xa8d3
    .hword 0xffff
    .hword 0xf238
    .hword 0x934d
    .hword 0x92ab
    .hword 0x4a87
    .hword 0x000a
    .hword 0x100f
    .hword 0x02aa
    .hword 0xb3cc
    .hword 0xc992
    .hword 0xef03
    .hword 0xad22
    .hword 0x0330
    .hword 0x2203
    .hword 0x2ffd
    .hword 0xeddc
    .hword 0xbbbb
    .hword 0xa002
    .hword 0x4332
    .hword 0x98f2
    .hword 0x7761
    .hword 0x92cb
    .hword 0xa00b
    .hword 0xdd81
    .hword 0x977a
    .hword 0x0001
    .hword 0x33b4
    .hword 0x7d82

.align 0x100
data_word:
    .word 0x2876adce
    .word 0x9cb238af
    .word 0xa8820fb7
    .word 0xaf9277cb
    .word 0x32989782
    .word 0x987bdc43
    .word 0xba73c0fe
    .word 0x2399dace
    .word 0x000bed00
    .word 0x833bade2
    .word 0x92235456
    .word 0xbdceefda
    .word 0xcb874bcd
    .word 0x3248cbae
    .word 0x933bcf26
    .word 0x74663bf7
    .word 0x6cb4ed6a
    .word 0x7c7d7e7b
    .word 0x88bd255c
    .word 0x933bb265
    .word 0x8ccba634
    .word 0xaa433ccc
    .word 0x911000bb
    .word 0x4532bbcd
    .word 0x822b3647
    .word 0xba7ce43e
    .word 0x09990909
    .word 0x00000223
    .word 0xb00000a0
    .word 0xbbbc0073
    .word 0x337fe887
    .word 0x23bb3fee

.align 0x100
data_xword:
    .xword 0xca038347023832d0
    .xword 0x9323bfecad638203
    .xword 0xabfec27356804bef
    .xword 0x768fec687937cfea
    .xword 0x823bfe253cdea397
    .xword 0xe2873fe836cd0984
    .xword 0xbf363fecda993bad
    .xword 0xbaceefdefecadbce
    .xword 0x987233b3fdce9723
    .xword 0x0003290432363bde
    .xword 0xabd934793bdefacd
    .xword 0xbfecce982734fed8
    .xword 0xafbeeedc897633de
    .xword 0xaaaa0a0a00078389
    .xword 0x9283792332f23ede
    .xword 0xababafecad5ef537
    .xword 0xabfe6353f3cd6354
    .xword 0xa87329876badfe09
    .xword 0x92733cf353fc0082
    .xword 0x982332cfedac3275
    .xword 0x2765454819238675
    .xword 0x932bf23932af639d
    .xword 0x292364fed043689b
    .xword 0x0650607211073674
    .xword 0xdfce893853cdeaf3
    .xword 0xdd04746852834fe9
    .xword 0x9232dfeaabbabdeb
    .xword 0xababdfefdccceaab
    .xword 0x7cbbe8e53ccefd57
    .xword 0x83b3385232dfec12
    .xword 0x7675373232f32d32
    .xword 0xf363583f35683f21
.end
