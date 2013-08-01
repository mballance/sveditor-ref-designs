/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_ras_vec_l2_lvc_trap.s
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

#define	 L2_ENTRY_PA	  0x517590000
#define  TEST_DATA        0x555555555555555
#define  L2_ES_W1C_VALUE  0xc03ffffc00000000
#define  L2ES_LVC         34


#define		L2_ESR_MASK	0xf03ffffff0000000
#define		L2_VEC		36
#define		L2_LDWC		51
#define		L2_LDAC		53
#define		L2_LVC		34

#include "hboot.s"
#include "asi_s.h"
#include "err_defines.h"

.text
.global	 main
.global	 My_Corrected_ECC_error_trap


main:


  ! Boot code does not provide TLB translation for IO address space
  ta    T_CHANGE_HPRIV
  clr	%i2


  ! Now access L2 control and status registers
disable_l1:
	ldxa  	[%g0] ASI_LSU_CONTROL, %l0
	! Remove the lower 2 bits (I-Cache and D-Cache enables)
	andn  	%l0, 0x3, %l0
	stxa  	%l0, [%g0] ASI_LSU_CONTROL
	membar	0x40


	! Not in Direct map
set_L2_errorsteer:
	setx	L2CS_PA0, %l6, %g1
	ldx	[%g1], %o6

!	 mov	 0x2, %o5		 ! L2_CSR_REG<1>=1 => DM mode

	ldxa	[%g0]ASI_INTR_ID, %o4	! get the thread id; for core-portable
	sllx	%o4, 15, %o4		! L2_CSR_REG<21:15> = ERROR_STEER

!	 or	 %o5, %o4, %o5

	or	%o6, %o4, %o6

	stx	%o6, [%g1]
	membar	0x40


enable_err_reporting:
	setx L2EE_PA0, %l0, %l1
	ldx  [%l1], %l2
	mov  0x3, %l0
	or   %l2, %l0, %l2
	stx  %l2, [%l1]


st_data:
	setx	0x44400000, %l0, %g1
        setx    0x3ffc0, %l0, %g2       ! Mask for extracting [17:6]
	clr	%i3

err_inj_loop:
        setx    0x5555555555555555, %g7, %g4
	stx	%g4, [%g1]	
	!to confirm fill done
	ld	[%g1], %l1

  	! Generate L2 VD Diag read address
  	! Addressing: [39:32] See PRM, [22] 1 for V/D, [17:8] set, [8:6] bank, [2:0] = 0

  	and   %g1, %g2, %g5

  	mov   0xb6, %g4
  	sllx  %g4, 32, %g6            ! Bits [39:32]
  	or    %g5, %g6, %g7

  	mov   UA_VD, %g4
  	sllx  %g4, 22, %g5            ! Bit [22]
  	or    %g7, %g5, %g6

	ldx	[%g6], %g4

	mov	0x1, %g5
	sllx	%g5, %i3, %g7		! %i3=1,2,3,....16

	xor	%g4, %g7, %g5		! inject single bit error

inject_err:
	stx	%g5,[%g6]

ld_st_2:
	setx	0xaaaaaaaa, %g4, %g5
	sllx	%i3, 24, %g6		! %i3=1,2,3,....16
					! to have different tag; same index
					! to cause L2 miss	
	or	%g1, %g6, %g3		! %g1 had the PA
	ldx	[%g3], %o5
	stx	%g5, [%g3]
        nop; nop; nop; nop; nop; nop; nop; nop; nop; nop;
        nop; nop; nop; nop; nop; nop; nop; nop; nop; nop;
        nop; nop; nop; nop; nop; nop; nop; nop; nop; nop;
        nop; nop; nop; nop; nop; nop; nop; nop; nop; nop;
        nop; nop; nop; nop; nop; nop; nop; nop; nop; nop;
        nop; nop; nop; nop; nop; nop; nop; nop; nop; nop;
        nop; nop; nop; nop; nop; nop; nop; nop; nop; nop;
        nop; nop; nop; nop; nop; nop; nop; nop; nop; nop;

	! wait for the trap
	set	0x100, %l1
loop:
	nop
	nop
	dec	%l1
	cmp	%l1, %g0
	be	test_failed
	nop

	add	%i3, 0x1, %g6
        cmp	%i2, %g6
	bne     %xcc, loop 
	nop
	nop
	nop


	set	0x200, %g4
        add     %g1, %g4, %g1   ! to go to the next Set; <17:9>

	inc	%i3
	set	INJ_LOOP, %l2
	cmp	%i3, %l2
        bne   	%xcc, err_inj_loop 
        nop
	nop
	nop

check_err_trap_taken:
	cmp	%i2, INJ_LOOP 
	bne	test_failed
	nop


/*******************************************************
 * Exit code
 *******************************************************/

test_passed:
ta  T_GOOD_TRAP

test_failed:
ta  T_BAD_TRAP


My_Corrected_ECC_error_trap:
	inc 	%i2

l2_esr_ch_63:
	setx	L2ES_PA0, %g7, %g2
	ldx	[%g2], %g1
	setx	L2_ESR_MASK, %g7, %g3
	and	%g1, %g3, %g5

	mov	0x1, %g6
	sllx	%g6, L2_VEC, %g2
        sllx    %g6, L2_LVC, %g3
	or	%g2, %g3, %g4

	cmp	%g4, %g5
	bne	%xcc, test_failed
	nop

synd_chk:
        setx	LVC_MASK_ZERO, %g7, %g2
	and	%g1, %g2, %g2			! %g1 has esr value
	cmp	%g2, %g0			! makes sure <27:14>, <6:0> are 0 for VD		
						! makes sure <27:14>, <13:7> are 0 for UA 
	bne	test_failed
	nop

	setx    LVC_MASK_NONZERO, %g7, %g2
        and     %g1, %g2, %g2                   ! %g1 has esr value
	cmp     %g2, %g0			! makes sure <13:7> nonzero for VD
						! makes sure <6:0> nonzero for UA
	be	%xcc, test_failed
	nop


clear_l2esr:
	setx 	0xc03ffffc00000000, %g7, %g2
	setx	L2ES_PA0, %g7, %g3
	stx	%g2, [%g3] 

load_DESR_L2C:
	ldxa	[%g0] 0x4c, %g1
	setx	0xff00000000000000, %g7, %g2
	and	%g1, %g2, %g3	
	setx	0x8900000000000000, %g7, %g4
	cmp	%g3, %g4
	bne	%xcc, test_failed
	nop

	retry	
	nop


