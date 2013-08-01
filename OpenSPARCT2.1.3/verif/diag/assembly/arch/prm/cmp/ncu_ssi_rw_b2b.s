/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ncu_ssi_rw_b2b.s
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

#ifdef SSI_CLK_8_3
#define CLK_RATIO_VAL 0x03
#else 
#ifdef SSI_CLK_8_2
#define CLK_RATIO_VAL 0x02
#else 
#ifdef SSI_CLK_4
#define CLK_RATIO_VAL 0x01
#else 
#define CLK_RATIO_VAL 0x00
#endif
#endif
#endif

.text
.global	 main

main:
    ta   T_CHANGE_HPRIV

get_th_id:
    ta   T_RD_THID

    cmp  %o1,0x0
    bne  test_fail
    nop

!Verify clock ratio counter value 
    wr   %g0,ASI_CMP_CORE,%asi
    setx 0x8000003040,%g7,%g1
    ldx  [%g1],%g2
    setx CLK_RATIO_VAL,%g7,%g1
    cmp  %g2,%g1
    bne  test_fail
    nop

!Read words from the SSI interface
    setx 0x000000fff0000000,%g7,%g1
    set  0x10,%g2
loop1:
    lduw [%g1],%g3
    add  %g1,4,%g1
    sub  %g2,1,%g2
    cmp  %g2,%g0
    bne  loop1
    nop

!Read same word multiple times
    setx 0x000000fff0000000,%g7,%g1
    set  0x10,%g3
loop2:
    lduw [%g1],%g7
    lduw [%g1],%g2
    cmp  %g7,%g2
    bne  %xcc,test_fail
    nop
    add  %g1,4,%g1
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop2
    nop

!RAW hazards
    setx 0x000000ffffff0000,%g7,%g1
    setx data_raw,%g7,%g2
    set  0x10,%g3
loop3:
    lduw [%g2],%g4
    stw  %g4,[%g1]
    lduw [%g1],%g5
    cmp  %g4,%g5
    bne  %xcc,test_fail
    nop
    add  %g1,4,%g1
    add  %g2,4,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop3
    nop

!WAR hazards
    setx 0x000000ffffff0100,%g7,%g1
    setx data_war,%g7,%g2
    set  0x10,%g3
loop4:
    lduw [%g1],%g4
    stw  %g0,[%g1]
    lduw [%g1],%g5
    cmp  %g5,%g0
    bne  %xcc,test_fail
    nop
    add  %g1,4,%g1
    add  %g2,4,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop4
    nop

!WAR hazards
    setx 0x000000ffffff0200,%g7,%g1
    setx data_waw,%g7,%g2
    add  %g2,0x10,%g3
    set  0x10,%g4
loop5:
    lduw [%g2],%g5
    lduw [%g3],%g6
    stw  %g5,[%g1]
    stw  %g6,[%g1]
    lduw [%g1],%g7
    cmp  %g7,%g6
    bne  %xcc,test_fail
    nop
    add  %g1,4,%g1
    add  %g2,4,%g2
    add  %g3,4,%g3
    sub  %g4,1,%g4
    cmp  %g4,%g0
    bne  loop5
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
data_raw:
    .word 0x239232ab
    .word 0x3923badf
    .word 0x482ba83a
    .word 0xa62ed082
    .word 0xab667bdc
    .word 0xc3923bef
    .word 0x8faa9832
    .word 0xdea02003
    .word 0xb202023b
    .word 0x2035723b
    .word 0x9923ced7
    .word 0x8a29823b
    .word 0x33eeee9e
    .word 0x5beaf092
    .word 0xbfabfe22
    .word 0xa0aaccde
    .word 0x10a0a993
    .word 0x02fccbef
    .word 0xbcc553f3
    .word 0xad20833f
    .word 0xae29083a
    .word 0x92298235
    .word 0x447034b5
    .word 0x3c3b24fd
    .word 0xffce09df
    .word 0xf198122f
    .word 0x9fa32782
    .word 0x6d329263
    .word 0xeb887611
    .word 0xda340823
    .word 0xd3219bd7
    .word 0xa8293200

.align 0x100
data_war:
    .word 0x34adde52
    .word 0xfbacbbab
    .word 0xd82c54cc
    .word 0xa8d3bc23
    .word 0xffffb298
    .word 0xf2389023
    .word 0x934dbaee
    .word 0x92ab9934
    .word 0x4a87a542
    .word 0x000aee01
    .word 0x100fc52d
    .word 0x02aad3c4
    .word 0xb3ccb66a
    .word 0xc992bbce
    .word 0xef033388
    .word 0xad222734
    .word 0x0330822b
    .word 0x22030b43
    .word 0x2ffd00aa
    .word 0xeddc9dc5
    .word 0xbbbb2b85
    .word 0xa002bbaa
    .word 0x4332becc
    .word 0x98f2114a
    .word 0x77619992
    .word 0x92cb9bdd
    .word 0xa00b33fe
    .word 0xdd81900c
    .word 0x977a2122
    .word 0x0001bac5
    .word 0x33b4237f
    .word 0x7d82293d

.align 0x100
data_waw:
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

.end
