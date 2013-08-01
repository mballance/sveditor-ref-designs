/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: pmu_ccx_sel5_0x10_thAll.s
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
#define PIC_COUNT_th0 0x6
#define PIC_COUNT_th1 0x9
#define PIC_COUNT_th2 0xa
#define PIC_COUNT_th3 0xf
#define PIC_COUNT_th4 0x3
#define PIC_COUNT_th5 0x2
#define PIC_COUNT_th6 0xe
#define PIC_COUNT_th7 0x1

#define MAIN_PAGE_HV_ALSO
#include "hboot.s"

.text
.global main
  
main:       

  ! Get TID
  ta T_RD_THID
  mov %o1, %l6
  nop

  cmp %l6, 0
  be thread_0
  nop

  cmp %l6, 1
  be thread_1
  nop

  cmp %l6, 2
  be thread_2
  nop

  cmp %l6, 3
  be thread_3
  nop

  cmp %l6, 4
  be thread_4
  nop

  cmp %l6, 5
  be thread_5
  nop

  cmp %l6, 6
  be thread_6
  nop

  cmp %l6, 7
  be thread_7
  nop

thread_0:

   setx 0x0000deadbeefbad0, %l5, %l4

   !# Switch to hpriv mode
   ta T_CHANGE_HPRIV
   !# Check to make sure pic is zero
   rd  %pic,   %g4
   cmp %g0,    %g4
   bne,pn  %icc,   fail
   nop

  !# Setup PCR Register
  set 0x0000000020414408, %g2
  wr  %g2, %g0, %pcr

  or %g0, %g0, %g3 
ccx_st_th0:
  umul %g3, 32, %g4
  setx DATA_0x0, %g1, %l5
  stx %g3,  [%l5 + %g4]
  add %g3, 1 , %g3
  cmp %g3, PIC_COUNT_th0
  bne,pn %xcc, ccx_st_th0 
  nop

  membar #Sync

check_pic_th0:
    rd  %pic,   %g4
    mov %g4, %i7
    cmp     %g4, PIC_COUNT_th0
    bne,pn  %icc, fail
    nop

check_pic1_isZero_th0:
    setx 0xffffffff00000000, %l5, %l0
    and %i7, %l0, %i7
    cmp     %i7, 0x0
    bne,pn  %icc, fail
    nop

   EXIT_GOOD

thread_1:

   setx 0x0000deadbeefbad0, %l5, %l4

   !# Switch to hpriv mode
   ta T_CHANGE_HPRIV
   !# Check to make sure pic is zero
   rd  %pic,   %g4
   cmp %g0,    %g4
   bne,pn  %icc,   fail
   nop

  !# Setup PCR Register
  set 0x0000000020414408, %g2
  wr  %g2, %g0, %pcr

  or %g0, %g0, %g3 
ccx_st_th1:
  umul %g3, 32, %g4
  setx DATA_0x0, %g1, %l5
  stx %g3, [%l5 + %g4]
  add %g3, 1 , %g3
  cmp %g3, PIC_COUNT_th1
  bne,pn %xcc, ccx_st_th1 
  nop

  membar #Sync

check_pic_th1:
    rd  %pic,   %g4
    mov %g4, %i7
    cmp     %g4, PIC_COUNT_th1
    bne,pn  %icc, fail
    nop

check_pic1_isZero_th1:
    setx 0xffffffff00000000, %l5, %l0
    and %i7, %l0, %i7
    cmp     %i7, 0x0
    bne,pn  %icc, fail
    nop

   EXIT_GOOD

thread_2:

   setx 0x0000deadbeefbad0, %l5, %l4

   !# Switch to hpriv mode
   ta T_CHANGE_HPRIV
   !# Check to make sure pic is zero
   rd  %pic,   %g4
   cmp %g0,    %g4
   bne,pn  %icc,   fail
   nop

  !# Setup PCR Register
  set 0x0000000020414408, %g2
  wr  %g2, %g0, %pcr

  or %g0, %g0, %g3 
ccx_st_th2:
  umul %g3, 32, %g4
  setx DATA_0x0, %g1, %l5
  stx %g3,  [%l5 + %g4]
  add %g3, 1 , %g3
  cmp %g3, PIC_COUNT_th2
  bne,pn %xcc, ccx_st_th2 
  nop

  membar #Sync

check_pic_th2:
    rd  %pic,   %g4
    mov %g4, %i7
    cmp     %g4, PIC_COUNT_th2
    bne,pn  %icc, fail
    nop

check_pic1_isZero_th2:
    setx 0xffffffff00000000, %l5, %l0
    and %i7, %l0, %i7
    cmp     %i7, 0x0
    bne,pn  %icc, fail
    nop

   EXIT_GOOD

thread_3:

   setx 0x0000deadbeefbad0, %l5, %l4

   !# Switch to hpriv mode
   ta T_CHANGE_HPRIV
   !# Check to make sure pic is zero
   rd  %pic,   %g4
   cmp %g0,    %g4
   bne,pn  %icc,   fail
   nop

  !# Setup PCR Register
  set 0x0000000020414408, %g2
  wr  %g2, %g0, %pcr

  or %g0, %g0, %g3 
ccx_st_th3:
  umul %g3, 32, %g4
  setx DATA_0x0, %g1, %l5
  stx %g3,  [%l5 + %g4]
  add %g3, 1 , %g3
  cmp %g3, PIC_COUNT_th3
  bne,pn %xcc, ccx_st_th3 
  nop

  membar #Sync

check_pic_th3:
    rd  %pic,   %g4
    mov %g4, %i7
    cmp     %g4, PIC_COUNT_th3
    bne,pn  %icc, fail
    nop

check_pic1_isZero_th3:
    setx 0xffffffff00000000, %l5, %l0
    and %i7, %l0, %i7
    cmp     %i7, 0x0
    bne,pn  %icc, fail
    nop

   EXIT_GOOD


thread_4:

   setx 0x0000deadbeefbad0, %l5, %l4

   !# Switch to hpriv mode
   ta T_CHANGE_HPRIV
   !# Check to make sure pic is zero
   rd  %pic,   %g4
   cmp %g0,    %g4
   bne,pn  %icc,   fail
   nop

  !# Setup PCR Register
  set 0x0000000020414408, %g2
  wr  %g2, %g0, %pcr

  or %g0, %g0, %g3 
ccx_st_th4:
  umul %g3, 32, %g4
  setx DATA_0x0, %g1, %l5
  stx %g3, [%l5 + %g4]
  add %g3, 1 , %g3
  cmp %g3, PIC_COUNT_th4
  bne,pn %xcc, ccx_st_th4 
  nop

  membar #Sync

check_pic_th4:
    rd  %pic,   %g4
    mov %g4, %i7
    cmp     %g4, PIC_COUNT_th4
    bne,pn  %icc, fail
    nop

check_pic1_isZero_th4:
    setx 0xffffffff00000000, %l5, %l0
    and %i7, %l0, %i7
    cmp     %i7, 0x0
    bne,pn  %icc, fail
    nop

   EXIT_GOOD

thread_5:

   setx 0x0000deadbeefbad0, %l5, %l4

   !# Switch to hpriv mode
   ta T_CHANGE_HPRIV
   !# Check to make sure pic is zero
   rd  %pic,   %g4
   cmp %g0,    %g4
   bne,pn  %icc,   fail
   nop

  !# Setup PCR Register
  set 0x0000000020414408, %g2
  wr  %g2, %g0, %pcr

  or %g0, %g0, %g3 
ccx_st_th5:
  umul %g3, 32, %g4
  setx DATA_0x0, %g1, %l5
  stx %g3, [%l5 + %g4]
  add %g3, 1 , %g3
  cmp %g3, PIC_COUNT_th5
  bne,pn %xcc, ccx_st_th5 
  nop

  membar #Sync

check_pic_th5:
    rd  %pic,   %g4
    mov %g4, %i7
    cmp     %g4, PIC_COUNT_th5
    bne,pn  %icc, fail
    nop

check_pic1_isZero_th5:
    setx 0xffffffff00000000, %l5, %l0
    and %i7, %l0, %i7
    cmp     %i7, 0x0
    bne,pn  %icc, fail
    nop

   EXIT_GOOD

thread_6:

   setx 0x0000deadbeefbad0, %l5, %l4

   !# Switch to hpriv mode
   ta T_CHANGE_HPRIV
   !# Check to make sure pic is zero
   rd  %pic,   %g4
   cmp %g0,    %g4
   bne,pn  %icc,   fail
   nop

  !# Setup PCR Register
  set 0x0000000020414408, %g2
  wr  %g2, %g0, %pcr

  or %g0, %g0, %g3 
ccx_st_th6:
  umul %g3, 32, %g4
  setx DATA_0x0, %g1, %l5
  stx %g3,  [%l5 + %g4]
  add %g3, 1 , %g3
  cmp %g3, PIC_COUNT_th6
  bne,pn %xcc, ccx_st_th6 
  nop

  membar #Sync

check_pic_th6:
    rd  %pic,   %g4
    mov %g4, %i7
    cmp     %g4, PIC_COUNT_th6
    bne,pn  %icc, fail
    nop

check_pic1_isZero_th6:
    setx 0xffffffff00000000, %l5, %l0
    and %i7, %l0, %i7
    cmp     %i7, 0x0
    bne,pn  %icc, fail
    nop

   EXIT_GOOD

thread_7:

   setx 0x0000deadbeefbad0, %l5, %l4

   !# Switch to hpriv mode
   ta T_CHANGE_HPRIV
   !# Check to make sure pic is zero
   rd  %pic,   %g4
   cmp %g0,    %g4
   bne,pn  %icc,   fail
   nop

  !# Setup PCR Register
  set 0x0000000020414408, %g2
  wr  %g2, %g0, %pcr

  or %g0, %g0, %g3 
ccx_st_th7:
  umul %g3, 32, %g4
  setx DATA_0x0, %g1, %l5
  stx %g3,  [%l5 + %g4]
  add %g3, 1 , %g3
  cmp %g3, PIC_COUNT_th7
  bne,pn %xcc, ccx_st_th7 
  nop

  membar #Sync

check_pic_th7:
    rd  %pic,   %g4
    mov %g4, %i7
    cmp     %g4, PIC_COUNT_th7
    bne,pn  %icc, fail
    nop

check_pic1_isZero_th7:
    setx 0xffffffff00000000, %l5, %l0
    and %i7, %l0, %i7
    cmp     %i7, 0x0
    bne,pn  %icc, fail
    nop

   EXIT_GOOD

fail:
   EXIT_BAD

.data
user_data_start:
scratch_area:

.align 32
DATA_0x0:
.xword 0x0000000000000000

.align 32
DATA_0x1:
.xword 0x1111111111111111

.align 32
DATA_0x2:
.xword 0x2222222222222222

.align 32
DATA_0x3:
.xword 0x3333333333333333

.align 32
DATA_0x4:
.xword 0x4444444444444444

.align 32
DATA_0x5:
.xword 0x5555555555555555

.align 32
DATA_0x6:
.xword 0x6666666666666666

.align 32
DATA_0x7:
.xword 0x7777777777777777

.align 32
DATA_0x8:
.xword 0x8888888888888888

.align 32
DATA_0x9:
.xword 0x9999999999999999

.align 32
DATA_0xa:
.xword 0xaaaaaaaaaaaaaaaa

.align 32
DATA_0xb:
.xword 0xbbbbbbbbbbbbbbbb

.align 32
DATA_0xc:
.xword 0xcccccccccccccccc

.align 32
DATA_0xd:
.xword 0xdddddddddddddddd

.align 32
DATA_0xe:
.xword 0xeeeeeeeeeeeeeeee

.align 32
DATA_0xf:
.xword 0xffffffffffffffff

.end

#if 0
#endif
