/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_err_NcuPcxData.s
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
#define H_HT0_Sw_Recoverable_Error_0x40  My_Recoverable_Sw_error_trap

    
/* #define MAIN_PAGE_NUCLEUS_ALSO */ /* Access main in priviledge mode */
#define MAIN_PAGE_HV_ALSO


#define SOC_ESR_REG      0x8000003000
#define SOC_ELE_REG      0x8000003008
#define SOC_EIE_REG      0x8000003010
#define SOC_EJR_REG      0x8000003018
#define SOC_FEE_REG      0x8000003020
#define SOC_PER_REG      0x8000003028
#define SOC_SII_SYN_REG  0x8000003030
#define SOC_NCU_SYN_REG  0x8000003038

#define	NcuPcxData 18 
#define	TT_Sw_Correctable_ECC	0x40

//#include "defines.h"
//#include "nmacros.h"
#include "hboot.s"
#include "asi_s.h"
#include "err_defines.h"

/************************************************************************
   Test case code start
 ************************************************************************/
.text
.global main
.global  My_Recoverable_Sw_error_trap

main:
        ta T_CHANGE_HPRIV
        nop

        setx    0x8000000000000000, %l7, %g7    !valid bit

soc_err_stat_reg:
  	set	0x1, %g1		
	sllx	%g1, NcuPcxData, %g2	! %g2 has NcuPcxData ON
  	setx  	SOC_EJR_REG, %l7, %g3

set_ejr:
  	stx   	%g2, [%g3]
        membar 0x40

read_esr:
        setx    SOC_ESR_REG, %l7, %g5
        ldx     [%g5], %i1
	nop

/*
        or      %g7, %g2, %i3           ! %g7->Valid bit; %g2->NcuPcxData bit
        sub     %i1, %i3, %i4
        brnz    %i4, test_fail
        nop

read_synd:
        setx    SOC_NCU_SYN_REG, %l7, %g6
        ldx     [%g5], %i1
        brz     %i1, test_fail
        nop
*/


/* To be enabled
        set     0x10, %g4
loop_wait0:
        nop; nop; nop
        nop; nop; nop
        dec     %g4
        brnz    %g4, loop_wait0

read_synd1:
        ldx     [%g6], %i1

set_eie:
	setx    SOC_EIE_REG, %l7, %g1
	stx     %g2, [%g1]
	membar 0x40

read_synd2:
        ldx     [%g6], %i1

	set	0x20, %g4
loop_wait:
	nop; nop; nop
        nop; nop; nop
        dec     %g4
        brnz    %g4, loop_wait 
        nop


check_error_trap:
	setx  EXECUTED, %l1, %l0
	cmp   %o0, %l0
	bne   test_fail
	nop

	mov   TT_Sw_Correctable_ECC, %l0
	cmp   %o1, %l0
	bne   test_fail
	nop
*/

	ba    test_pass
	nop


/***********
  Done
 ***********/
test_pass:
	EXIT_GOOD

test_fail:
	EXIT_BAD

/****************
   Trap Handler
 ****************/
My_Recoverable_Sw_error_trap:
        setx  	EXECUTED, %l0, %o0    	! Signal trap taken 
        rdpr  	%tt, %o1      		! save trap type value 

chk_per:
        setx    0x8000000000000000, %g5, %g7    !valid bit
        set     0x1, %g1
        sllx    %g1, NcuPcxData, %g2    ! %g2 has NcuPcxData ON
        or      %g7, %g2, %i3           ! %g7->Valid bit; %g2->NcuPcxData bit

        setx  	SOC_PER_REG, %l7, %g6  
        ldx   	[%g6], %i1     

        sub     %i1, %i3, %i4
        brnz    %i4, test_fail
        nop

/*
chk_esr:
        setx    SOC_ESR_REG, %l7, %g5
        ldx     [%g5], %i1
        brnz    %i1, test_fail
        nop
*/

chk_synd:
        setx    SOC_NCU_SYN_REG, %l7, %g5
        ldx     [%g5], %i1
        brz    	%i1, test_fail
        nop

  	retry
	nop

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
	.xword 0x0000000000000000
	.xword 0xffffffffffffffff
	.xword 0xa55a5aa5a55a5aa5
	.xword 0x5aa5a55a5aa5a55a
.end




