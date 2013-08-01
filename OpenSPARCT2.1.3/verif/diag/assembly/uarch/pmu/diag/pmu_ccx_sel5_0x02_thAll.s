/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: pmu_ccx_sel5_0x02_thAll.s
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
#define PIC_COUNT 1

#define MAX_THREAD_TIMEOUT 0x1fff
#define MAIN_PAGE_HV_ALSO
#define NO_TRAPCHECK
#define H_HT0_Control_Word_Queue_Interrupt_0x3c
#define My_HT0_Control_Word_Queue_Interrupt_0x3c \
        wr %g0, 0x40, %asi; \
        ldxa [%g0 + ASI_SPU_CWQ_CSR]%asi, %i5; \
        stxa %i5, [%g0 + ASI_SPU_CWQ_CSR]%asi; \
        ba CHECK_PIC_COUNT; \
        nop;nop;nop;nop;
#include "hboot.s"

.text
.global main

main:       

   and %g0,0,%i6
   
   setx 0x0000deadbeefbad0, %l5, %l4

   !# Switch to hpriv mode
   ta T_CHANGE_HPRIV
   !# Check to make sure pic is zero
   !#rd  %pic,   %g4
   !#cmp %g0,    %g4
   !#bne,pn  %icc,   fail
   !#nop
   wr  %g0, %g0, %pic !zero out pic

   !# Setup PCR Register
   set 0x0000000038094088, %g2
   wr  %g2, %g0, %pcr
   wr  %g0, %g0, %pic !zero out pic

   !Get TID
   ta T_RD_THID
   mov %o1, %l6
   nop

   cmp %l6, 0
   be thread_0
   nop

   cmp %l6, 1
   be thread_other
   nop

   !all other threads execute the same code
   cmp %l6, 2
   be thread_other
   nop

   cmp %l6, 3
   be thread_other
   nop

   cmp %l6, 4
   be thread_other
   nop

   cmp %l6, 5
   be thread_other
   nop

   cmp %l6, 6
   be thread_other
   nop

   cmp %l6, 7
   be thread_other
   nop

   ba fail

thread_0:
   !# setup ASI register to point to SPU
   wr %g0, 0x40, %asi

InitialCW_0:

   !# Make sure CWQ is currently disabled, not busy, not terminated, no protocol error; else fail
   ldxa [%g0 + ASI_SPU_CWQ_CSR] %asi, %l1
   and %l1, 0xf, %l2
   cmp %g0, %l2
   bne,pn %xcc, fail
   nop

   !# allocate control word queue (e.g., setup head/tail/first/last registers)
   setx CWQ_BASE, %g1, %l6

   !# write base addr to first, head, and tail ptr
   !# first store to first
   stxa    %l6, [%g0 + ASI_SPU_CWQ_FIRST] %asi
   ldxa    [%g0 + ASI_SPU_CWQ_FIRST] %asi, %l1
   !# Mask off upper 16 bits
   setx 0x0000ffffffffffff, %l5, %l0
   and %l0, %l6, %l2
   cmp %l1, %l2
   bne,pn %xcc,    fail
   nop

   !# then to head
   stxa    %l6, [%g0 + ASI_SPU_CWQ_HEAD] %asi
   ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l1
   cmp %l1, %l2
   bne,pn %xcc,    fail
   nop

   !# then to tail
   stxa    %l6, [%g0 + ASI_SPU_CWQ_TAIL] %asi
   ldxa    [%g0 + ASI_SPU_CWQ_TAIL] %asi, %l1
   cmp %l1, %l2
   bne,pn %xcc,    fail
   nop

   !# then end of CWQ region to LAST
   setx CWQ_LAST, %g1, %l5
   stxa    %l5, [%g0 + ASI_SPU_CWQ_LAST] %asi
   ldxa    [%g0 + ASI_SPU_CWQ_LAST] %asi, %l1
   !# Mask off upper 16 bits
   and %l0, %l5, %l2
   cmp %l1, %l2
   bne,pn %xcc,    fail
   nop

   membar #Sync

   ldxa    [%g0 + ASI_SPU_CWQ_TAIL] %asi, %l2
   add %l2, 512, %l2
   stxa    %l2, [%g0 + ASI_SPU_CWQ_TAIL] %asi
   ldxa    [%g0 + ASI_SPU_CWQ_TAIL] %asi, %l1
   cmp %l1, %l2
   bne,pn %xcc,    fail
   nop

   !# Kick off the CWQ operation by writing to the CWQ_CSR
   !# Set the enabled bit and reset the other bits
   or      %g0, 0x1, %g1
   stxa    %g1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
   !# Make sure all these stores get to memory before we start

   !# Try CWQ_SYNC operation...
   ldxa    [%g0 + 0x30] %asi, %l1

   and	%l1, 0x6, %l1
   brnz	%l1, fail			!# test for unexpected protocal error
   nop

   ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l1
   ldxa    [%g0 + ASI_SPU_CWQ_TAIL] %asi, %l1

   setx 10, %g1, %l2
   or %g0, %g0, %g3   

check_results_0:
   setx    results, %g1, %l5
   ldx     [%l5 + %g3], %l1
   add     %g3, 0x8, %g3   !# i++
   addcc   %l2, -1, %l2
   bgt     check_results_0
   nop

   or %g0, 0x8, %i0    
   or %g0, %g0, %g3   

check_sfas_0:
   setx    fas_result, %g1, %l5
   ldx     [%l5 + %g3], %l1
   add     %g3, 0x8, %g3   !# i++
   addcc   %i0, -1, %i0
   bgt     check_sfas_0 
   nop

!disable SPU before next operation
   stxa    %g0,    [%g0 + ASI_SPU_CWQ_CSR] %asi
   nop

   EXIT_GOOD

thread_other:
   !wait for interrupt and then exit

wait_for_int:
   cmp %i6,1
   bne wait_for_int
   nop

   EXIT_GOOD

fail:
   EXIT_BAD

.data
user_data_start:
scratch_area:

! first 8 addresses are for counters, last is for done bit
.align 16
thread_scratch_area:
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000

.align 16
msg1:
.xword 0x0030fdc05d599221
.xword 0x10f3279537ce239f
.xword 0x350192ee57e49864
.xword 0xe6b13af6031ce21d
.xword 0xc04ca56d80506fa8
.xword 0xb3c6d051fbad26e0
.xword 0xb260907945f0428a
.xword 0xa59182341647b4c2
.xword 0xab9b60838da8f032
.xword 0x97149144f33acd56
.align 16
key:
.xword 0x95f1a4e75e3d7de9
.xword 0x54d350ef97fc6332
.xword 0x8bf6a691fb59ffa6
.xword 0xd0a8142e351cffdc
.xword 0xa110d949b459ff24
.xword 0x40e7b7e36e436a93

.align 16
iv:
.xword 0x8afbb3c3013d7e7a
.xword 0x1980dd67b1386a71
.xword 0x4cb849ad9f511439
.xword 0x5af08a49a51e2b9d
.xword 0x879b4a63cc59cd74
.xword 0xb847c25ebf5b1795

.align 16
results:
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF

.align 16
fas_result:
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF

!# CWQ data area, set aside 512 CW's worth
!# 512*8*8 = 32KB
.align 32*1024
CWQ_BASE:
.xword 0xC1610B02000A0000
.xword msg1
.xword key
.xword iv
.xword fas_result
.xword 0
.xword 0
.xword results

.xword 0xC1610B22000A0040
.xword msg1
.xword key
.xword iv
.xword fas_result
.xword 0
.xword 0
.xword results

.xword 0xC1610B42000A0035
.xword msg1
.xword key
.xword iv
.xword fas_result
.xword 0
.xword 0
.xword results

.xword 0xC1610B62000A0005
.xword msg1
.xword key
.xword iv
.xword fas_result
.xword 0
.xword 0
.xword results

.xword 0xC1610B82000A0035
.xword msg1
.xword key
.xword iv
.xword fas_result
.xword 0
.xword 0
.xword results

.xword 0xC1610BA2000A0025
.xword msg1
.xword key
.xword iv
.xword fas_result
.xword 0
.xword 0
.xword results

.xword 0xC1610BC2000A0015
.xword msg1
.xword key
.xword iv
.xword fas_result
.xword 0
.xword 0
.xword results

.xword 0xC1610BE2000A0005
.xword msg1
.xword key
.xword iv
.xword fas_result
.xword 0
.xword 0
.xword results

.xword 0xAAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAAA
CWQ_LAST:
.xword 0xAAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAAA

.end

.global CHECK_PIC_COUNT
SECTION .HTRAPS
.text
CHECK_PIC_COUNT:
  rd  %pic,   %g4
  brz %g4, FAIL 
  mov %g4, %i7
  nop

check_pic1_isZero_0:
  setx 0xffffffff00000000, %l5, %l0
  and %i7, %l0, %i7
  srlx %i7, 32, %i7
  cmp     %i7, 0x0
  bne,pn  %icc, FAIL
  nop

  !increment interrupt counter
  add %i6,1,%i6

  retry
  nop

FAIL: EXIT_BAD
nop

#if 0
#endif
