/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ncu_mix_regs.s
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
!#include "asi_s.h"

.text
.global	 main


main:
    ta   T_CHANGE_HPRIV

get_th_id:
    ta   T_RD_THID

//    cmp  %o1,0x0
//    bne  test_pass
    nop

!Write then read data of  INT_VEC_REG 
    setx 0x0000008000000a00,%g7,%g1
    setx int_vec_data,%g7,%g2
    set  0x04,%g3

loop1:
    ldx  [%g2],%g4
    stx  %g4,[%g1]

    ldx [%g1], %g5

    cmp %g4, %g5
    
    bne %xcc, test_fail


    add  %g2,8,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop1
    nop



!Write then read data of  PCIE_A_FSH_REG   
 setx 0x0000008000002030,%g7,%g1
    setx data_xword,%g7,%g2
    set  0x04,%g3

loop2:
    ldx  [%g2],%g4
    stx  %g4,[%g1]

    ldx [%g1], %g5

    cmp %g4, %g5
  
    bne %xcc, test_fail


    add  %g2,8,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop2
    nop

!Write then read  data of RAS_ERR_STEERING   
 setx 0x0000009001041000,%g7,%g1
    setx int_vec_data,%g7,%g2
    set  0x04,%g3

loop3:
    ldx  [%g2],%g4
    stx  %g4,[%g1]

    ldx [%g1], %g5

    cmp %g4, %g5
   
    bne %xcc, test_fail


    add  %g2,8,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop3
    nop



!Write data to the NCU_CREG_DBGTRIG_EN
 setx 0x0000008000004000,%g7,%g1
    setx bit_1_data,%g7,%g2
    set  0x04,%g3

loop5:
    ldx  [%g2],%g4
    stx  %g4,[%g1]

    ldx [%g1], %g5

    cmp %g4, %g5
   
    bne %xcc, test_fail


    add  %g2,8,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop5
    nop

!Write data to the MONDO_INT_ABUSY
 setx 0x0000008000040a00,%g7,%g1
    setx busy_data,%g7,%g2
    set  0x04,%g3

loop6:
    ldx  [%g2],%g4
    stx  %g4,[%g1]

    ldx [%g1], %g5

    cmp %g4, %g5
   
    bne %xcc, test_fail


    add  %g2,8,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop6
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
int_vec_data:
    .xword 0x000000000000002a
    .xword 0x000000000000003f
    .xword 0x0000000000000015
    .xword 0x0000000000000001
    .xword 0x0000000000000002
    .xword 0x0000000000000004
    .xword 0x0000000000000008
    .xword 0x0000000000000010
    .xword 0x0000000000000020
.align 0x100

bit_1_data:
    .xword 0x0000000000000001
    .xword 0x0000000000000000
    .xword 0x0000000000000001
    .xword 0x0000000000000000

busy_data:
    .xword 0x0000000000000040
    .xword 0x0000000000000000
    .xword 0x0000000000000040
    .xword 0x0000000000000000

.align 0x100
data_xword:
    .xword 0x000000faaa000000
    .xword 0x000000fcad000000
    .xword 0x000000f555000000
    .xword 0x000000fabc000000

.end

