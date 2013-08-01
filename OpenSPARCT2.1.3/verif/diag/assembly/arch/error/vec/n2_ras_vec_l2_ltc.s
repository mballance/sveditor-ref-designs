/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_ras_vec_l2_ltc.s
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


#define MAIN_PAGE_HV_ALSO


#define  L2_ENTRY_PA        0xa400000000
#define  TEST_DATA1         0x5555555555555555
#define  L2_ES_W1C_VALUE    0xc03ffffc00000000

#include "hboot.s"
#include "asi_s.h"
#include "err_defines.h"

.text
.global	 main
.global  My_Corrected_ECC_error_trap


main:

  ! Boot code does not provide TLB translation for IO address space
  ta    T_CHANGE_HPRIV

/*
disable_l1_DCache:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  ! Remove bit 2
  andn  %l0, 0x2, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL
*/

enable_err_reporting:
  setx L2EE_PA0, %l0, %l1
  ldx  [%l1], %l2
  mov  0x3, %l0
  or   %l2, %l0, %l2
  stx  %l2, [%l1]


/*
set_L2_Directly_Mapped_Mode:
  setx  L2CS_PA0, %l6, %g1      ! Bit 1 in L2 Control Status Register
  mov   0x2, %l0
  stx   %l0, [%g1]
*/

init_zero:
	clr	%i0

Tag_init:
	setx	0x2000aa00, %g7, %g1
	ldx	[%g1], %g2

        setx    0x2100aa00, %g7, %g1
        ldx     [%g1], %g2

        setx    0x2200aa00, %g7, %g1
        ldx     [%g1], %g2

        setx    0x2300aa00, %g7, %g1
        ldx     [%g1], %g2

        setx    0x2400aa00, %g7, %g1
        ldx     [%g1], %g2

        setx    0x2500aa00, %g7, %g1
        ldx     [%g1], %g2

        setx    0x2600aa00, %g7, %g1
        ldx     [%g1], %g2

        setx    0x2700aa00, %g7, %g1
        ldx     [%g1], %g2

        setx    0x2800aa00, %g7, %g1
        ldx     [%g1], %g2

        setx    0x2900aa00, %g7, %g1
        ldx     [%g1], %g2

        setx    0x2a00aa00, %g7, %g1
        ldx     [%g1], %g2

        setx    0x2b00aa00, %g7, %g1
        ldx     [%g1], %g2

        setx    0x2c00aa00, %g7, %g1
        ldx     [%g1], %g2

        setx    0x2d00aa00, %g7, %g1
        ldx     [%g1], %g2

        setx    0x2e00aa00, %g7, %g1
        ldx     [%g1], %g2

        setx    0x2f00aa00, %g7, %g1
        ldx     [%g1], %g2
	membar	#Sync

nops:
	nop; nop; nop; nop
	nop; nop; nop; nop
	nop; nop; nop; nop
	nop; nop; nop; nop
	nop; nop; nop; nop
	nop; nop; nop; nop
	nop; nop; nop; nop


	! Try with way 0, 1 in 2 loop count
	! First all 16 ways for the same Index was loaded to L2
	! Now inject error to way 0;
	! Do a ld with the same index different tag and make sure it is a miss in L2
	! Error should be reported and corrected;
	! Then try in the second pass of the loop for way 1
	! Used the %i5 register to have the way count as loop count and use it to getnerate different tag

set_way:
	clr	%i5			! for 16 error
/************************LOOP*****************************/
L2_diag_load:
	setx	0x2000aa00, %l0, %g2  	! 1st addr; way: 0
	setx  	0x3ffff8, %l0, %l2      ! Mask for extracting [21:3]
	and     %g2, %l2, %g5		! g2 has L2 PA,
	setx	L2_ENTRY_PA, %l0, %g4
	or	%g5, %g4, %g5           !g5 now has Diagnostic Data Array address 

flip:
	sllx	%i5, 18, %g6		! %i5 has the way
	or	%g5, %g6, %g5
	ldx	[%g5], %g6
	membar 	#Sync

! Flip one bits to inject error
	xor	%g6, 0x200, %g6
	stx	%g6, [%g5]
	membar  #Sync
	ldx	[%g5], %g7
	cmp	%g7, %g6
	bne	test_fail
	nop
        membar  #Sync

nops_1:
	nop; nop; nop; nop; nop; nop; nop; nop; nop; nop; nop; nop; nop; nop; nop; nop; nop; nop; nop; nop; nop

	! error should be detected and reported to CCX
reading_to_cause_err:                 			! New Tag; same Index; and a miss; 											! so error should be detected and reported to CCX
	setx  	0x3000aa00, %l0, %g2
	sllx	%i5, 24, %i6				! %i5 = 0,1,2,3,..
	or	%g2, %i6, %g2				! to get a new address; with new tag; same index	
	ldx   	[%g2], %l6

	! wait for the trap
	set	0x100, %i1
loop_1:
	dec	%i1
	cmp	%i1, %g0
	be	test_fail			! timeout
	nop

	add	%i5, 0x1, %i7
	cmp	%i0, %i7 
	bne	loop_1	
	nop

	!To make sure that the error is not logged/reported again
	!that means the error is corrected
read_more_same_index_different_set:		
	setx	0x4000aa00, %l0, %g2			! another new tag; same index
        sllx    %i5, 24, %i6                            ! %i5 = 0,1,2,3,..    
        or      %g2, %i6, %g2                           ! to get a new address; with new tag; same index   
	ldx	[%g2], %l6
        setx    0x5000aa00, %l0, %g2    		! another new tag; same index
        sllx    %i5, 24, %i6                            ! %i5 = 0,1,2,3,..    
        or      %g2, %i6, %g2                           ! to get a new address; with new tag; same index   
        ldx	[%g2], %l6
        membar  #Sync

	inc	%i5
	cmp	%i5, LOOP_COUNT
	bne	L2_diag_load
	nop	
/*********************************************************/

trap_count:
	cmp	%i0,  LOOP_COUNT
	bne	test_fail	
	nop

good:
	ba	test_pass
	nop



My_Corrected_ECC_error_trap:
	inc	%i0

l2_esr_ch_63:
	setx	L2ES_PA0, %g7, %g1
	ldx   	[%g1], %g4
	setx	0xfffffffc00000000, %g7, %g3
	and	%g4, %g3, %g6
	setx	0x0000201000000000, %g7, %g3
	cmp	%g6, %g3
	bne	%xcc, test_fail
	nop		

clear_l2esr_63:
	setx	0xc03ffffc00000000, %g7, %g2
	stx	%g2, [%g1]
	ldx	[%g1], %g2

load_DESR_L2C_63:
	ldxa	[%g0] 0x4c, %g2
	setx 	0xff00000000000000, %g7, %g1
	and  	%g2, %g1, %g3
 	setx 	0x8900000000000000, %g7, %g4	
        cmp     %g4, %g3           
        bne     %xcc, test_fail
        nop      	

load_DSFSR_L2C_63:
	set	0x18, %g1
	ldxa	[%g1] 0x58, %g2
	cmp	%g2, %g0
        bne     %xcc, test_fail
        nop             

done_63:
#ifdef DONE
 	done	
#endif
	retry
	nop



/*******************************************************
 * Exit code
 *******************************************************/

test_pass:
ta  T_GOOD_TRAP

test_fail:
ta  T_BAD_TRAP
