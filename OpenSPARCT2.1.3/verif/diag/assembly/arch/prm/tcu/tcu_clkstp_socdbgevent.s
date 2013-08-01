/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tcu_clkstp_socdbgevent.s
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

#define  Soc_Decr_Pa         0x8600000010


#define  L2_ERR_STAT_REG    0xAB00000000
#define  L2_ERR_ADDR_REG    0xAC00000000

#define  TEST_DATA0         0x1000100081c3e008
#define  TEST_DATA1         0x2000200081c3e008
#define  TEST_DATA2         0x3000300081c3e008
#define  L2_ES_W1C_VALUE    0xc03ffff800000000
#define  DRAM_ES_W1C_VALUE  0xfe00000000000000

#ifdef MCU0
#define L2_BANK_ADDR        0x0       
#define MCU_BANK_ADDR       0x0
#define  DRAM_ERR_INJ_REG   0x8400000290
#define  DRAM_ERR_STAT_REG  0x8400000280
#define	 ERROR_ADDR	    0x20200000
#define DBG_ERR_PA  0xAA00000000
#define DBG_ERR_VAL 0x4
#ifdef SOC_TRIGOUT
#define  Soc_Decr_Val        0x00000000000003
#else
#define  Soc_Decr_Val        0x00000000000002
#endif	
#define  L2_Addr_Mask_Reg    0xAF00000000
#define  L2_Addr_Mask_Val    0x000000002200aa00
#define  L2_Addr_Cmp_Reg     0xBF00000000
#define  L2_Addr_Cmp_Val     0x000000002200aa00	
#endif

#ifdef MCU1
#define L2_BANK_ADDR        0x80
#define MCU_BANK_ADDR       0x80
#define  DRAM_ERR_INJ_REG   0x8400001290
#define  DRAM_ERR_STAT_REG  0x8400001280
#define DBG_ERR_PA  0xAA00000080
#define DBG_ERR_VAL 0x4
#ifdef SOC_TRIGOUT
#define  Soc_Decr_Val        0x00000000000030
#else
#define  Soc_Decr_Val        0x00000000000020
#endif	
#define  L2_Addr_Mask_Reg    0xAF00000080
#define  L2_Addr_Mask_Val    0x000000002200aa00
#define  L2_Addr_Cmp_Reg     0xBF00000080
#define  L2_Addr_Cmp_Val     0x000000002200aa00	
	
#endif

#ifdef MCU2
#define L2_BANK_ADDR        0x100
#define MCU_BANK_ADDR       0x100
#define  DRAM_ERR_INJ_REG   0x8400002290
#define  DRAM_ERR_STAT_REG  0x8400002280
#define  ERROR_ADDR         0x20200100
#define DBG_ERR_PA  0xAA00000100
#define DBG_ERR_VAL 0x4
#ifdef SOC_TRIGOUT
#define  Soc_Decr_Val        0x00000000000300
#else
#define  Soc_Decr_Val        0x00000000000200
#endif	
#define  L2_Addr_Mask_Reg    0xAF00000100
#define  L2_Addr_Mask_Val    0x000000002200aa00
#define  L2_Addr_Cmp_Reg     0xBF00000100
#define  L2_Addr_Cmp_Val     0x000000002200aa00	
#endif

#ifdef MCU3
#define L2_BANK_ADDR        0x180
#define MCU_BANK_ADDR       0x180
#define  DRAM_ERR_INJ_REG   0x8400003290
#define  DRAM_ERR_STAT_REG  0x8400003280
#define DBG_ERR_PA  0xAA00000180
#define DBG_ERR_VAL 0x4
#ifdef SOC_TRIGOUT
#define  Soc_Decr_Val        0x00000000003000
#else
#define  Soc_Decr_Val        0x00000000002000
#endif	
#define  L2_Addr_Mask_Reg    0xAF00000180
#define  L2_Addr_Mask_Val    0x000000002200aa00
#define  L2_Addr_Cmp_Reg     0xBF00000180
#define  L2_Addr_Cmp_Val     0x000000002200aa00	
#endif


#include "hboot.s"
#include "asi_s.h"
#include "err_defines.h"
#include "rst_defines.h"


.text
.global  main
.global  My_Corrected_ECC_error_trap



main:
  ta T_CHANGE_HPRIV
  
   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
   !!!!! Check if this is the first time or after WMR reset
   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

	setx	wmr_flag, %g1, %g2
	ldx	[%g2], %g3
	brnz	%g3, After_Warm_Reset
	nop
	dec	%g3          ! First time thru, Store a non-zero value
	stx	%g3, [%g2]
	membar #Sync

   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
   !!!!!!  before WMR reset: delay loop for Vera programming !!!!!!!	
   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	
#ifdef PREWMR_VERA_PROG_DEL
   setx PREWMR_VERA_PROG_DEL, %g1, %g2
1:
   dec  %g2
   brnz %g2, 1b
   nop
#endif

   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
   !!!! Bring FBD links down and do WMR reset
   !!!! Warning: ensure the code is in the cache before bringing down the links
   !!!!          since cannot fetch from DRAM when the links is down.
   !!!! NOTE: use %g2 and %g3 for WMR. Use %g4, %g5, %g6 and %g7 for MCU0/1/2/3 FBD_CHANNEL_STATE_REG 
   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

   mov          0x84,  %g1        ! upper bits of MCU0's FBD_CHANNEL_STATE_REG address is 0x8400000800
   mov          0x800, %g2        ! lower bits of MCU0's FBD_CHANNEL_STATE_REG address is 0x8400000800
   sllx         %g1, 32, %g3
   or           %g2, %g3, %g4     ! %g4 contains MCU0's FBD_CHANNEL_STATE_REG address or 0x8400000800
   add          %g4, 0x1000, %g5  ! %g5 contains MCU1's FBD_CHANNEL_STATE_REG address which is 0x1000 higher than MCU0
   add          %g5, 0x1000, %g6  ! %g6 contains MCU2's FBD_CHANNEL_STATE_REG address which is 0x1000 higher than MCU1
   add          %g6, 0x1000, %g7  ! %g7 contains MCU3's FBD_CHANNEL_STATE_REG address which is 0x1000 higher than MCU2

   setx RST_RESET_GEN, %g1, %g2		! %g2 is addr of RESET_GEN register
   mov	RST_RESET_GEN__WMR_GEN, %g3	! %g3 is write data for WMR_GEN bit or bit 0 of RESET_GEN reg

   mov 0x1, %g1       ! will set %g1 to 0 at end of branching
   ba  2f             ! need this since can have garbage code between here and next aligned label
   nop

.align 64
2: brnz %g1, 1f
   nop
   clrx         [%g4]             ! set MCU0's FBD_CHANNEL_STATE_REG to 0

1: brnz %g1, 1f
   nop
   clrx         [%g5]             ! set MCU1's FBD_CHANNEL_STATE_REG to 0

1: brnz %g1, 1f
   nop
   clrx         [%g6]             ! set MCU2's FBD_CHANNEL_STATE_REG to 0

1: brnz %g1, 1f
   nop
   clrx         [%g7]             ! set MCU3's FBD_CHANNEL_STATE_REG to 0

1: brnz %g1, 1f
   nop
   stx     %g3, [%g2]             ! Write 0x1 to RESET_GEN to start Warm Reset

1: brz  %g1, 1f
   nop
   mov %g0, %g1
   nop
	
1: brz %g0, 2b
   nop

   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
   !!!!!!  after WMR reset                         !!!!!!!!!!!!!!!
   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

After_Warm_Reset:
	or	%g0, %g0, %g1		! few dummy instructions
	or	%g0, %g0, %g1		! few dummy instructions

   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
   !!!!!!  after WMR reset: delay loop for Vera programming !!!!!!!	
   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

#ifdef POSTWMR_VERA_PROG_DEL
   setx POSTWMR_VERA_PROG_DEL, %l2, %l1
1:
   dec %l1
   brnz %l1, 1b
   nop
#endif
	membar #Sync

   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
   !!!!!! from here down is the original diag 
   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  
  
setup_soc_decr_reg:
	setx L2_Addr_Mask_Reg,%l1,%l4
	add %l4,L2_BANK_ADDR,%l4
	setx L2_Addr_Mask_Val,%l2,%l3
	add  %l3,L2_BANK_ADDR,%l3	
	stx %l3,[%l4]	
	nop
	membar 0x40
	
	setx L2_Addr_Cmp_Reg,%l4,%l5
	add  %l5,L2_BANK_ADDR,%l5
	setx L2_Addr_Cmp_Val,%g5,%g4
	add  %g4,L2_BANK_ADDR,%g4	
	stx  %g4,[%l5]
	nop
	membar 0x40	

	nop
	setx Soc_Decr_Pa,%l1,%g4
	setx Soc_Decr_Val,%l7,%g5
	stx %g5,[%g4]
        nop
	membar 0x40


disable_l1:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  ! Remove the lower 2 bits (I-Cache and D-Cache enables)
  andn  %l0, 0x3, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL


clear_dram_esr_0:
  ! Clear DRAM Error status register (Bit[63:57] write-1-clear)
  setx  DRAM_ES_W1C_VALUE, %l0, %l5
  setx  DRAM_ERR_STAT_REG, %l3, %g5  
!  add   %g5, MCU_BANK_ADDR, %g5
  stx   %l5, [%g5]

set_DRAM_error_inject_ch0:
  mov   0x606, %l1                ! ECC Mask (Multi-bit error)
  mov   0x1, %l2 		
  sllx  %l2, DRAM_EI_SSHOT, %l3
  Or    %l1, %l3, %l1           ! Set single shot ; 
  mov   0x1, %l2
  sllx  %l2, DRAM_EI_ENB, %l3
  or    %l1, %l3, %l1           ! Enable error injection for the next write
  setx  DRAM_ERR_INJ_REG, %l3, %g6 
!  add   %g6, MCU_BANK_ADDR, %g6
  stx   %l1, [%g6]
  membar 0x40

enable_err_reporting:
  setx L2EE_PA0, %l0, %l1
  add   %l1, L2_BANK_ADDR, %l1
  ldx  [%l1], %l2
  mov  0x3, %l0
  or   %l2, %l0, %l2
  stx  %l2, [%l1]


  ! Write 1 to clear L2 Error status registers
clear_l2_ESR:
  setx  L2ES_PA0, %l3, %l4
  add   %l4, L2_BANK_ADDR, %l4
  stx   %l5, [%l4]
  nop

set_L2_Off_Mode:
  setx  L2CS_PA0, %l6, %g1
  add   %g1, L2_BANK_ADDR, %g1
  mov   0x1, %l0
  stx   %l0, [%g1]

  
store_to_L2_way0:
  setx  0x2200aa00, %l0, %g2  ! bits [21:18] select way
  add   %g2, L2_BANK_ADDR, %g2
  stx %g5, [%g2]
  membar #Sync
read_error_address_ch0:
  ldx   [%g2], %l1
  membar #Sync


! Storing to same L2 way0 but different tag,this will write to mcu
write_mcu_channel_0:
  setx  0x2100aa00, %l0, %g3 ! bits [21:18] select way
  add   %g3, L2_BANK_ADDR, %g3
  stx %g5, [%g3]
  membar #Sync

/**
*read_error_address_ch0:
*  ldx   [%g2], %l1
*  membar #Sync
*!  ldx   [%g3], %l2
*!  membar #Sync
**/

   
check_DRAM_ESR_0:
  setx  DRAM_ERR_STAT_REG, %l3, %g5  
!  add   %g5, MCU_BANK_ADDR, %g5
  ldx   [%g5], %l6
  setx  0xffc0000000000000, %l0,%o2
  and  %l6,%o2,%l6


compute_dram_ESR:
  mov   0x1, %l1
  sllx  %l1, DRAM_ES_DAU, %l0


verify_dram_ESR:
  cmp   %l0, %l6
//  bne   %xcc, test_fail
  nop

check_L2_ESR_0:
  setx  L2_ERR_STAT_REG, %l3, %g5  
  add   %g5, L2_BANK_ADDR, %g5
  ldx   [%g5], %l6

compute_L2_ESR:
  setx  0xfffffffff0000000, %l3, %l0
  andcc %l0, %l6, %l0                  ! Donot check L2ESR SYND bits
  mov   0x1, %l1
  sllx  %l1, L2ES_DAU, %l0
  mov   0x1, %l1
  sllx  %l1, L2ES_VEU, %l2
  or    %l0, %l2, %l3

verify_L2_ESR:
  cmp   %l6, %l3
  bne   %xcc, test_fail
  nop


  setx  L2EA_PA0, %l2, %l3
  add   %l3, L2_BANK_ADDR, %l3
check_l2_EAR:
  ldx   [%l3], %l4
  ! Error address is the physical address of the cache line (PA[5:0] 0)
  setx  0x2200aa00, %l0, %g2  ! bits [21:18] select way
  add   %g2, L2_BANK_ADDR, %g2

  setx  0xffffffffc0, %l0,%o2
  and  %l4, %o2, %l4
  cmp   %l4, %g2
//  bne   %xcc, test_fail
  nop

check_Corr_err_trap:
  ! Check if a Corrected ECC Error Trap happened
  set   EXECUTED, %l0
  cmp   %o0, %l0
//  bne   test_fail
  nop
  mov   TT_Data_Access_Error, %l0
  cmp   %o1, %l0
//  bne   test_fail
  nop


  ba    test_pass
  nop

My_Corrected_ECC_error_trap:

!My_Recoverable_Sw_error_trap:
  ! Signal trap taken
  setx  EXECUTED, %l0, %o0
  ! save trap type value
  rdpr  %tt, %o1
  retry
  nop


/*******************************************************
 * Exit code
 *******************************************************/

test_pass:
ta  T_GOOD_TRAP


test_fail:
ta  T_BAD_TRAP

/************************************************************************
 *  Test case data start
 ************************************************************************/
.data
wmr_flag:
        .xword 0x0000000000000000    ! set this to non-zero before start WMR
        .xword 0x0000000000000000
        .xword 0x0000000000000000
        .xword 0x0000000000000000       
.end
