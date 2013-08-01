/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_ras_vec_l2_da_ce_trap.s
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

#define MAIN_PAGE_HV_ALSO


#define  L2_ENTRY_PA        0xa000000000
#define  TEST_DATA1         0x5555555555555555
#define	 L2_ENTRY_PA0       0x30000008
#define  L2_ES_W1C_VALUE    0xc03ffffc00000000
#define	 SPARC_ES_W1C_VALUE 0xefffffff
#define  TT_SW_Error        0x40

#define  	L2_ESR_MASK	0xf03ffffff0000000 
#define 	L2_VEC		36
#define		L2_LDWC		51
#define         L2_LDAC         53
 
#include "hboot.s"
#include "asi_s.h"
#include "err_defines.h"

.text
.global	 main
.global  My_Corrected_ECC_error_trap
.global  My_Recoverable_Sw_error_trap

main:


  ! Boot code does not provide TLB translation for IO address space
	ta    T_CHANGE_HPRIV
	clr	%i0
	clr	%o0
th_id:
	ldxa    [%g0]ASI_INTR_ID, %o6
	

disable_l1_DCache:
	ldxa  [%g0] ASI_LSU_CONTROL, %l0
	! Remove bit 2
	andn  %l0, 0x2, %l0
	stxa  %l0, [%g0] ASI_LSU_CONTROL

enable_err_reporting:
	setx L2EE_PA0, %l0, %l1
	ldx  [%l1], %l2
	mov  0x3, %l0
	or   %l2, %l0, %l2
	stx  %l2, [%l1]


set_L2_Directly_Mapped_Mode_errorsteer:
	setx  	L2CS_PA0, %l6, %g1
	ldx	[%g1], %o6

	mov   	0x2, %o5		! L2_CSR_REG<1>=1 => DM mode

        ldxa    [%g0]ASI_INTR_ID, %o4	! get the thread id; for core-portable
	sllx	%o4, 15, %o4		! L2_CSR_REG<21:15> = ERROR_STEER

	or	%o5, %o4, %o5

	or	%o6, %o5, %o6

	stx   	%o6, [%g1]
	membar	0x40

store_to_L2:
	setx  TEST_DATA1, %l0, %g5

store_to_L2_way0:
	setx	0x3000aa00, %l0, %g2  ! bits [21:18] select way
	stx %g5, [%g2] 
	stx %g5, [%g2+8]

        nop; nop; nop; nop; nop
        nop; nop; nop; nop; nop
        nop; nop; nop; nop; nop


	membar #Sync

L2_diag_load:
	setx  0x3ffff8, %l0, %l2      ! Mask for extracting [21:3]
	setx	L2_ENTRY_PA, %l0, %g4
	and   %g2, %l2, %g5           !g2 has L2 PA, 
	or	%g5, %g4, %g5           !g5 now has Diagnostic Data Array address 
	ldx	[%g5], %g6
	membar #Sync

! Flip one bits to inject error
	xor	 %g6, 0x200, %g6
	stx	%g6, [%g5]
	membar #Sync

reading_back_0:                 !Load to L2 again to get the error
	setx  0x3000aa00, %l0, %g2
	ldx   [%g2], %l6
	membar #Sync  


	! Loop until gets first  trap	
	set	0x100, %o1
loop_1:
	dec	%o1
	cmp	%o1, %g0
	be	test_fail
	nop

	nop
	cmp	%i0, 0x1
	bne	loop_1
	nop



/**********************************************
        LDWC
***********************************************/
write_back:        
        setx  0x1000aa00, %l0, %g2
        ldx   [%g2], %l6
        add     %g2, 0x200, %g2
        ldx   [%g2], %l6
        membar #Sync

        setx  0x2000aa00, %l0, %g2
        ldx   [%g2], %l6


        ! Loop until gets first  trap
        set     0x100, %o1
loop_2:
        dec     %o1
        cmp     %o1, %g0
        be      test_fail
        nop

        nop
        cmp     %o0, 0x1
        bne     loop_2
        nop

	nop; nop; nop; nop

        membar #Sync

/*******************************************************
 * Exit code
 *******************************************************/

test_pass:
	ta  T_GOOD_TRAP

test_fail:
	ta  T_BAD_TRAP




My_Corrected_ECC_error_trap:
	inc	%o0

check_l2_ESR_0x63:
        setx  L2ES_PA0, %l6, %g1
        ldx   [%g1], %g2

        setx    L2_ESR_MASK, %g7, %g3
        and     %g2, %g3, %g4

check_LDWC_0x63:
        mov     0x1, %i1
        sllx    %i1, L2_VEC, %i2
        sllx    %i1, L2_LDWC, %i3
        or      %i2, %i3, %i4

        cmp     %g4, %i4
        bne     %xcc, test_fail
        nop


clear_l2_ESR_0x63:
	setx	L2_ES_W1C_VALUE, %g7, %g2
	stx	%g2, [%g1]
	membar	#Sync


check_l2_EAR_0x63:
        setx    L2EA_PA0, %g7, %g1
        ldx     [%g1], %g2
        setx    0x3000aa00, %g7, %g3
        cmp     %g3, %g2
        bne     test_fail
        nop


check_DESR_L2C_0x63:
        ldxa    [%g0] 0x4c, %g1
        setx    0xff00000000000000, %g7, %g2
        and     %g1, %g2, %g3
        setx    0xa900000000000000, %g7, %g4
        cmp     %g3, %g4
!        bne     %xcc, test_failed
        nop

	done
	nop




My_Recoverable_Sw_error_trap:
	inc	%i0

check_l2_ESR_0x40:
        setx  L2ES_PA0, %l6, %g1
        ldx   [%g1], %g2

        setx    L2_ESR_MASK, %g7, %g3
        and     %g2, %g3, %g4

check_LDAC_0x40:
        mov     0x1, %i1
        sllx    %i1, L2_VEC, %i2
        sllx    %i1, L2_LDAC, %i3
        or      %i2, %i3, %i4

        cmp     %g4, %i4
        bne     %xcc, test_fail
        nop

clear_l2_ESR_0x40:
	setx	L2_ES_W1C_VALUE, %g7, %g2
	stx	%g2, [%g1]
	membar	#Sync

check_l2_EAR_0x40:
        setx    L2EA_PA0, %g7, %g1
        ldx     [%g1], %g2
        setx    0x3000aa00, %g7, %g3
        cmp     %g3, %g2
        bne     test_fail
        nop

check_DESR_L2C_0x40:
        ldxa    [%g0] 0x4c, %g1
        setx    0xff00000000000000, %g7, %g2
        and     %g1, %g2, %g3
        setx    0xb500000000000000, %g7, %g4
        cmp     %g3, %g4
!        bne     %xcc, test_failed
        nop

        done
        nop



