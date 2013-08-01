/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_ras_vec_mcu_dac_ErrorCntReg1.s
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

#define  L2_ERR_STAT_REG    0xAB00000000
#define  L2_ERR_ADDR_REG    0xAC00000000

#define  TEST_DATA0         0x1000100081c3e008
#define  TEST_DATA1         0x2000200081c3e008
#define  TEST_DATA2         0x3000300081c3e008
#define  L2_ES_W1C_VALUE    0xc03ffffc00000000
#define  DRAM_ES_W1C_VALUE  0xfe00000000000000

#ifdef MCU0
#define L2_BANK_ADDR        0x0       
#define MCU_BANK_ADDR       0x0
#define  DRAM_ERR_INJ_REG   0x8400000290
#define  DRAM_ERR_STAT_REG  0x8400000280
#define  DRAM_ERR_COUNTER_REG	0x8400000298
#endif

#ifdef MCU1
#define L2_BANK_ADDR        0x80
#define MCU_BANK_ADDR       0x80
#define  DRAM_ERR_INJ_REG   0x8400001290
#define  DRAM_ERR_STAT_REG  0x8400001280
#define  DRAM_ERR_COUNTER_REG	0x8400001298
#endif

#ifdef MCU2
#define L2_BANK_ADDR        0x100
#define MCU_BANK_ADDR       0x100
#define  DRAM_ERR_INJ_REG   0x8400002290
#define  DRAM_ERR_STAT_REG  0x8400002280
#define  ERROR_ADDR         0x20200100
#define  DRAM_ERR_COUNTER_REG   0x8400002298
#endif

#ifdef MCU3
#define L2_BANK_ADDR        0x180
#define MCU_BANK_ADDR       0x180
#define  DRAM_ERR_INJ_REG   0x8400003290
#define  DRAM_ERR_STAT_REG  0x8400003280
#define  DRAM_ERR_COUNTER_REG   0x8400003298
#endif


#define		L2_ESR_MASK	0xf03ffffff0000000
#define		L2_VEC		36
#define		L2_LDWC		51
#define		L2_LDAC		53
#define         L2_DAC 		42

#define		MCU_DAC		61



#include "hboot.s"
#include "asi_s.h"
#include "err_defines.h"


.text
.global  main



main:
  ta T_CHANGE_HPRIV


disable_l1:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  ! Remove the lower 2 bits (I-Cache and D-Cache enables)
  andn  %l0, 0x3, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL


dram_error_count_reg:
	setx	DRAM_ERR_COUNTER_REG, %g7, %g1
	mov	COUNT, %g2
	stx	%g2, [%g1]


! MSA 01/04/07: Set Continuous error Injection
set_DRAM_error_inject_ch0:
  mov   0x2, %l1                ! ECC Mask (1-bit error)
!  mov   0x1, %l2 		
!  sllx  %l2, DRAM_EI_SSHOT, %l3
!  Or    %l1, %l3, %l1           
  mov   0x1, %l2
  sllx  %l2, DRAM_EI_ENB, %l3
  or    %l1, %l3, %l1           ! Enable error injection for the next write
  setx  DRAM_ERR_INJ_REG, %l3, %g6 
  stx   %l1, [%g6]
  membar 0x40


store_to_L2:
  	setx  TEST_DATA1, %l0, %g5

set_L2_Directly_Mapped_Mode_errorsteer:
        setx    L2CS_PA0, %l6, %g1
        add     %g1, L2_BANK_ADDR, %g1

        ldx     [%g1], %o6

        mov     0x2, %o5                ! L2_CSR_REG<1>=1 => DM mode

        ldxa    [%g0]ASI_INTR_ID, %o4   ! get the thread id; for core-portable
        sllx    %o4, 15, %o4            ! L2_CSR_REG<21:15> = ERROR_STEER

        or      %o5, %o4, %o5

        or      %o6, %o5, %o6
        stx     %o6, [%g1]
        membar  0x40


store_to_L2_way0:
  	setx	0x2200a000, %l0, %g2  ! bits [21:18] select way
  	add	%g2, L2_BANK_ADDR, %g2
  	stx 	%g5, [%g2]
  	stx 	%g5, [%g2+8]

  	add	%g2, 0x200, %g2
  	stx 	%g5, [%g2]
  	stx 	%g5, [%g2+8]

  	add   	%g2, 0x200, %g2
  	stx 	%g5, [%g2]
  	stx 	%g5, [%g2+8]

	add	%g2, 0x200, %g2
	stx	%g5, [%g2]
	stx	%g5, [%g2+8]

	add	%g2, 0x200, %g2
	stx	%g5, [%g2]
	stx	%g5, [%g2+8]

	add	%g2, 0x200, %g2
	stx	%g5, [%g2]
	stx	%g5, [%g2+8]

  	membar 	#Sync

	! Inject error to 0x2200a000, 0x2200a200, 0x2200a400
	! Storing to same L2 way0 but different tag,this will write to mcu
write_mcu_wb_0:
  	setx	0x2100a000, %l0, %g3 ! bits [21:18] select way
  	add 	%g3, L2_BANK_ADDR, %g3
  	stx 	%g5, [%g3]
  	stx 	%g5, [%g3+8]

  	add 	%g3, 0x200, %g3
  	stx 	%g5, [%g3]
  	stx 	%g5, [%g3+8]

  	add 	%g3, 0x200, %g3
  	stx 	%g5, [%g3]
  	stx 	%g5, [%g3+8]

	add	%g3, 0x200, %g3
	stx	%g5, [%g3]
	stx	%g5, [%g3+8]

	add	%g3, 0x200, %g3
	stx	%g5, [%g3]
	stx	%g5, [%g3+8]

	add	%g3, 0x200, %g3
	stx	%g5, [%g3]
	stx	%g5, [%g3+8]
  	membar 	#Sync

read_error_address_1:
	setx	0x2200a000, %l0, %g2  ! bits [21:18] select way
        add     %g2, L2_BANK_ADDR, %g2
  	ldx	[%g2], %l1
  	membar 	#Sync

	! Loop until gets MCU ESR logged
	set	0x100, %o2
        setx    DRAM_ERR_STAT_REG, %g7, %g1
loop_1:
        dec	%o2
	cmp	%o2, %g0
	be	test_fail	!Time out
	nop

	ldx	[%g1], %g3
	cmp	%g3, %g0
	be	%xcc, loop_1
	nop

clear_mcuesr1:
	setx	DRAM_ES_W1C_VALUE, %g7, %o3
	stx	%o3, [%g1]
  
soc_esr1:
        setx    SOC_ESR_REG, %g7, %g4
	ldx	[%g4], %i6

read_error_address_2:
	add	%g2, 0x200, %g2
  	ldx	[%g2], %l1
  	membar 	#Sync

	! Loop until gets MCU ESR logged
	set	0x100, %o2
loop_2:
      	dec	%o2
	cmp	%o2, %g0
	be	test_fail	!Time out
	nop

	ldx	[%g1], %g3
        cmp     %g3, %g0
        be      %xcc, loop_2
        nop

clear_mcuesr2:
        stx     %o3, [%g1]

soc_esr2:
        ldx     [%g4], %i6


read_error_address_3:
        add     %g2, 0x200, %g2
	ldx	[%g2], %l1
        membar 	#Sync

        ! Loop until gets MCU ESR logged
        set     0x100, %o2
loop_3:
        dec     %o2
        cmp     %o2, %g0
        be      test_fail       !Time out
        nop

        ldx     [%g1], %g3
        cmp     %g3, %g0
        be      %xcc, loop_3
        nop


	! Check for SOC ESR 
	set	0x20, %o2
trap_loop:
	dec	%o2
	cmp	%o2, %g0
	be	test_fail	!Time out
	nop

soc_esr3:
	ldx	[%g4], %g5
	mov	1, %g3
	sllx	%g3, EXP_ERR, %g3
	setx	0x8000000000000000,  %g7, %g4
	or	%g3, %g4, %g3
	cmp	%g5, %g3
	bne	%xcc, trap_loop
	nop

clear_mcuesr3:
        stx     %o3, [%g1]



test_pass:
ta  T_GOOD_TRAP

test_fail:
ta  T_BAD_TRAP

/************************************
       	Trap Handler 
************************************/
My_Corrected_ECC_error_trap:
	inc	%i0

check_l2_ESR_0x63:
	setx  L2ES_PA0, %l6, %g1
	ldx   [%g1], %g2

	setx	L2_ESR_MASK, %g7, %g3
	and	%g2, %g3, %g4

check_DAC_0x63:
	mov	0x1, %i1
	sllx	%i1, L2_VEC, %i2
	sllx	%i1, L2_DAC, %i3
	or	%i2, %i3, %i4

	cmp	%g4, %i4
	bne	%xcc, test_fail
	nop

clear_l2_ESR_0x63:
	setx	L2_ES_W1C_VALUE, %g7, %g2
	stx	%g2, [%g1]
	membar	#Sync

check_l2_EAR_0x63:
	setx	L2EA_PA0, %g7, %g1
	ldx	[%g1], %g2
	setx	0xffffffffffffffc0, %g7, %g5 
	and	%g2, %g5, %g2
	setx	0x2200aa00, %g7, %g3
	cmp	%g3, %g2
	bne	test_fail
	nop

check_mcu_esr:
	setx	DRAM_ERR_STAT_REG, %g7, %g1
	ldx	[%g1], %g2

	mov	0x1, %g6
	sllx	%g6, MCU_DAC, %g3
	set	0x0002, %g5
	or	%g3, %g5, %g4

	cmp	%g4, %g2
	bne	%xcc, test_fail
	nop

	
check_DESR_L2C_0x63:
	ldxa	[%g0] 0x4c, %g1
	setx	0xff00000000000000, %g7, %g2
	and	%g1, %g2, %g3
	setx	0x8900000000000000, %g7, %g4
	cmp	%g3, %g4
	bne	 %xcc, test_fail
        nop

	retry
        nop



