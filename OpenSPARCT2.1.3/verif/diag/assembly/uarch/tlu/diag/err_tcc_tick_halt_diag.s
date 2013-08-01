/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: err_tcc_tick_halt_diag.s
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
#define MAIN_PAGE_HV_ALSO
#define MAIN_PAGE_NUCLEUS_ALSO
#define  CETER_DE       0x2000000000000000
#define  ASI_CETER              0x4C
#define  CETER_VA               0x18
#define  ASI_CERER              0x4C
#define  CERER_VA               0x10
#define TCCU_ERR_EN     0x80400000


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

! Interrupt trap handler

#define H_HT0_Interrupt_Level_14_0x4e
#define My_HT0_Interrupt_Level_14_0x4e \
    rd %tick, %l0; \
    add %g0, 1, %i0; \
    retry; \
    nop

#define H_HT0_Sw_Recoverable_Error_0x40
#define SUN_H_HT0_Sw_Recoverable_Error_0x40 \
    rd %tick, %l0; \
    ldxa  [%g0]0x4C, %l7; \
    add %g0, 1, %i1; \
    retry; \
    nop

#include "hboot.s"

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:		/* test begin */

    ta T_CHANGE_HPRIV 
    mov %g0, %i0
    mov %g0, %i1
! Enable tccd errors.
  add %g0, 0x80, %o2   
  add  %g0, CERER_VA, %g3  
  stxa %o2, [%g3]ASI_CERER

! Turn off IE bit so the sw_recoverable err trap is not taken
!again and again
  rdpr %pstate, %l1
  wrpr %l1, 0x2, %pstate


  !! set CETER.DE
  setx CETER_DE, %l0, %o2
  add %g0, CETER_VA, %g3
  stxa %o2, [%g3]ASI_CETER

!! Enable error injection
  setx TCCU_ERR_EN, %l0, %l5
  or %l5, 0x1, %l5   ! set mask bit 0 t
  stxa %l5, [%g0]ASI_ERR_INJ

set_tick:
    setx 0x50000000, %g1, %g2
    wrpr %g2, %tick

set_tick_cmpr:
    add %g2, 0x200, %g2
    wr %g0, %g2, %tick_cmpr		!! err will be injected

    wrhpr %g0, 0x0, %halt

! set the priv bit to read the softint register 
   rdpr %pstate, %l1
   wrpr %l1, 0x4, %pstate

!! get out of hp mode since the int 14 trap won't be taken in hpriv mode
  rdhpr %hpstate, %l1
  wrhpr %l1, 0x4, %hpstate

   add %i2, 10, %i3
   add %i2, 10, %i3
   add %i2, 10, %i3
   add %i2, 10, %i3

    
    brnz %i0, FAIL    ! chk int_14 trap not taken
    brz %i1, FAIL     !chk sw_recoverable trap is taken
    nop

!! Chk TM bit is not set in the softint register
    rd %softint, %l1
    brnz %l1, FAIL
    nop


    EXIT_GOOD
    nop

FAIL:
    EXIT_BAD
    nop

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
.word 0xB52E8698
.end







