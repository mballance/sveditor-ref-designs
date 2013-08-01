/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_ras_vec_dau_nd_8core_6core.s
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
#define H_HT0_Hw_Corrected_Error_0x63 My_Corrected_ECC_error_trap
#define H_HT0_Sw_Recoverable_Error_0x40  My_Recoverable_Sw_error_trap
#define H_HT0_Data_access_error_0x32  My_Precise_data_access_error_trap

#define ENABLE_PCIE_LINK_TRAINING
/* #define MAIN_PAGE_NUCLEUS_ALSO */ /* Access main in priviledge mode */
#define MAIN_PAGE_HV_ALSO

#include "err_defines.h"
#include "hboot.s"
#include "peu_defines.h"

#define TEST_DATA1		0xaaaaaaaaaaaaaaaa

#define L2_ADDR1		0x2000aa00
#define L2_ADDR2		0x1000aa00

#define	DRAM_ERR_INJ_REG	0x8400000290
#define L2_ERR_STAT_REG         0xAB00000000
#define DRAM_ERR_STAT_REG	0x8400000280

#define L2_ND_REG         	0xAE00000000
   
#define SYNC_ADDR		0x5550000


 
/************************************************************************
   Test case code start
 ************************************************************************/
.text
.global main
.global  My_Corrected_ECC_error_trap
.global  My_Recoverable_Sw_error_trap
.global	 My_Precise_data_access_error_trap

main:
        ta T_CHANGE_HPRIV
        nop


disable_l1:
	ldxa  [%g0] ASI_LSU_CONTROL, %l0
	! Remove the lower 2 bits (I-Cache and D-Cache enables)
	andn  %l0, 0x3, %l0
	stxa  %l0, [%g0] ASI_LSU_CONTROL
	ldxa  [%g0] ASI_LSU_CONTROL, %l0

get_th_id_o0:
        ta      T_RD_THID

        cmp     %o1, 0 
        be      main_th_0
        nop

	ba	main_all_other_threads 
	nop

main_th_0:
	clr	%i0
	clr	%i1

set_DRAM_error_inject_ch0:
	mov   0x606, %l1                ! ECC Mask (2-bit error)
	mov   0x1, %l2
	sllx  %l2, DRAM_EI_SSHOT, %l3
	Or    %l1, %l3, %l1           ! Set single shot ;
	mov   0x1, %l2
	sllx  %l2, DRAM_EI_ENB, %l3
	or    %l1, %l3, %l1           ! Enable error injection for the next write
	setx  DRAM_ERR_INJ_REG, %l3, %g6
	stx   %l1, [%g6]
	membar 0x40

L2_err_enable:
        set     0x3, %l1
        mov     0xaa, %g2
        sllx    %g2, 32, %g2
        stx     %l1, [%g2]
        stx     %l1, [%g2 + 0x40]
        stx     %l1, [%g2 + 0x80]
        stx     %l1, [%g2 + 0xc0]
        stx     %l1, [%g2 + 0x100]
        stx     %l1, [%g2 + 0x140]
        stx     %l1, [%g2 + 0x180]
        stx     %l1, [%g2 + 0x1c0]


set_L2_Directly_Mapped_Mode_errorsteer:
        setx    L2CS_PA0, %l6, %g1
        ldx     [%g1], %o6

        mov     0x2, %o5                ! L2_CSR_REG<1>=1 => DM mode
        or      %o6, %o5, %o6

        stx     %o6, [%g1]
        membar  0x40


store_to_L2_way0:
	setx  TEST_DATA1, %l0, %g5
	setx  L2_ADDR1, %l0, %g2  ! bits [21:18] select way
	stx %g5, [%g2]
	membar #Sync

	! Storing to same L2 way0 but different tag,this will write to mcu
write_mcu_channel_0:
	setx  L2_ADDR2, %l0, %g3 ! bits [21:18] select way
	stx %g5, [%g3]
	membar #Sync


cause_err_th0:
	setx	L2_ADDR1, %g7, %g2 
        ldub    [%g2], %g3			
	nop
	nop
	nop

sync_other_threads_th0:
        setx    SYNC_ADDR, %g7, %g1
        setx    0x1111111111111111, %g7, %g2
        stx     %g2, [%g1]


check_trap_taken_th0:
        cmp     %i1, 0x1
!       bne     test_failed                     ! Should take tt=0x32
        nop

        cmp     %i0, %g0 
!       be     test_failed                     ! Should not take tt=0x40
        nop

pass_th_0:
	ba	test_passed
	nop



/************************  TH B ***********************************/
main_all_other_threads:
	clr	%i0
	clr	%i1

	set	0x200, %i6
wait_for_thread0_err:
	dec	%i6
	cmp	%i6, %g0
timeout:
	be	%xcc, test_failed
	nop

	setx	SYNC_ADDR, %g7, %g1
	ldx	[%g1], %g2
        setx    0x1111111111111111, %g7, %g3
	cmp	%g2, %g3
	bne	wait_for_thread0_err	
	nop

access_err_addr:
	setx	L2_ADDR1, %g7, %g2
	ldub	[%g2], %g3
	nop
	nop
	nop

check_trap_taken:
	cmp	%i1, 0x1
!	bne	test_failed			! Should take tt=0x32
	nop

        cmp     %i0, %g0 
!       be     test_failed                     ! Should not take tt=0x40
        nop

/*******************************************************************/
test_passed:
	EXIT_GOOD

test_failed:
	EXIT_BAD


/************************************************************************
	RAS
   	Trap Handlers
 ************************************************************************/

/****************************** TT=0x40 ***********************************/
My_Recoverable_Sw_error_trap:
        inc	%i0

check_desr_NcuTrap_tt40:
        ldxa  [%g0]0x4c, %g2
        nop

check_mcu_esr_tt40:
	setx  DRAM_ERR_STAT_REG, %l3, %g5  
	ldx   [%g5], %l3

check_L2_ESR__tt40:
	setx	L2_ERR_STAT_REG, %l3, %g5  
	ldx	[%g5], %l6

trap_done_tt40:
       	retry
        nop


/****************************** TT=0x63 ***********************************/
My_Corrected_ECC_error_trap:
	ba	test_failed
        nop

/****************************** TT=0x32 ***********************************/
My_Precise_data_access_error_trap:
	inc	%i1
	cmp	%o1, 0				! %o1 value preserved from T_RD_THID 
	bne	other_threads_0x32
	nop

check_DSFSR_th0_0x32:
	set	0x18, %g3
	ldxa	[%g3] 0x58, %g2
	set	0xf, %g3
	and	%g2, %g3, %g2
	cmp	%g2, 0x1			! DCL2U
	be	clear_dsfsr_DCL2U_0x32
	nop
	cmp	%g2, 0x2			! DCL2ND
	bne	test_failed
	nop
check_clear_desr_0x32:
        ldxa  [%g0]0x4c, %g2
        nop
!add code to check the DESR value
	ba	clear_dsfsr_DCL2U_0x32
	nop

	! other threads should get tt=0x32 with DCL2ND only
other_threads_0x32:
	set	0x18, %g3
	ldxa	[%g3] 0x58, %g2
        cmp     %g2, 0x2                        ! DCL2ND
        bne     test_failed
        nop

clear_dsfsr_DCL2U_0x32:
	set	0x18, %g3
	stxa	%g0, [%g3] 0x58			! clear DSFSR
	nop

mcu_esr_0x32:
        mov     0x1, %g1
        sllx    %g1, DRAM_ES_DAU, %g2
        setx  	DRAM_ERR_STAT_REG, %g7, %g5  
        ldx   	[%g5], %g1
        setx  	0xffffffffffff0000, %g7, %g3
        andcc 	%g1, %g3, %g4                   ! Donot check SYND bits
	cmp	%g2, %g4
	bne	%xcc, test_failed
	nop

L2_err_0x32:
	cmp	%o1, 0
	bne	nd_other_threads_0x32
	nop

check_L2_ESR_th0_only_0x32:
        setx    L2_ERR_STAT_REG, %l3, %g5  
        ldx     [%g5], %l6
        setx    0x7ffffffff0000000, %l3, %l0
        andcc   %l0, %l6, %l5                   ! Donot check L2ESR SYND bits and MEU
        mov     0x1, %l1
        sllx    %l1, L2ES_DAU, %l0
        mov     0x1, %l1
        sllx    %l1, L2ES_VEU, %l2
        or      %l0, %l2, %i4
        cmp     %l5, %i4
        bne     %xcc, test_failed
        nop

	ba	done_0x32
	nop

nd_other_threads_0x32:
	setx	L2_ND_REG, %g7, %g1
	ldx	[%g1], %g2
	setx	0x7c0fffffffff0, %g7, %g4		!Mask off VCID <45:40>, amnother diag to check it; MEND;  <3:0>
	and	%g2, %g4, %g2

	setx	0x2000000000000, %g7, %g5		!Expected value: NDSP = <49>
!	sllx	%o1, 40, %g3				!%o1 => VCID = ND_REG<45:40>
!	or	%g5, %g3, %g5				! NDSP, VCID 

	setx	L2_ADDR1, %g7, %g1			!ADDRESS = ND_REG<39:4>
	or	%g1, %g5, %g5				!NDSP, ADDR

	cmp	%g2, %g5
	bne	%xcc, test_failed
	nop 
 

done_0x32:
	done
	nop

/************************************************************************
   Test case data start
************************************************************************/


