/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_mmu_htw_3.s
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
#define PART0_Z_HWTEN_0 1
#define PART0_Z_HWTEN_1 1
#define PART0_Z_HWTEN_2 1
#define PART0_Z_HWTEN_3 1
#define PART0_NZ_HWTEN_0 1
#define PART0_NZ_HWTEN_1 1
#define PART0_NZ_HWTEN_2 1
#define PART0_NZ_HWTEN_3 1

!!! RANOTPA = 1, so RA -> PA translation enabled
#define PART0_Z_RANOTPA_0 1
#define PART0_Z_RANOTPA_1 1
#define PART0_Z_RANOTPA_2 1
#define PART0_Z_RANOTPA_3 1
#define PART0_NZ_RANOTPA_0 1
#define PART0_NZ_RANOTPA_1 1
#define PART0_NZ_RANOTPA_2 1
#define PART0_NZ_RANOTPA_3 1
#include "hboot.s"

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:		/* test begin */



	!# Execute Main Diag ..


	! Set translation for miss handler
	!
	 !setx DIAG_DATA_AREA, %l1, %i4
	 !!setx HTBA, %l1, %i4
	 !! Zero out lower 13 bits
	 !srlx %i4, 13, %i0
	 !sllx %i0, 13, %i0
	 !! Write it to dtlb_tag_access register
	 !! ASI 0x58, addr 0x30
	 !setx 0x30, %l1, %i1
	 !stxa	%i0,	[%i1 + %g0] 0x58
	 !! Create tte_data in %i2
	 !! sun4v format
	 !! Field  V   NFO  L   PA     IE  E CP P W Size
	 !! Bit    63  62   61  39:13  12 11 10 8 6 2:0
	 !!
	 !! First set valid and locked bits
	 !setx 0xA000000000000000, %l1, %i2
	 !! Now set up PA
	 !setx 0x000000FFFFFFE000, %l1, %i5
	 !and %i4, %i5, %i5
	 !! Now merge them
	 !or %i2, %i5, %i2
	 !! Write it to dtlb_data_in register
	 !! ASI 0x5C, address with bit 10 set (for sun4v)
	 !setx 0x400, %l1, %i3
	 !stxa    %i2,    [%i3 + %g0] 0x5C
	
	
	!! Create tte_tag in %i0
	!! Field  Context   VA
	!!         60:48   41:0
	!! Assume context of 0 for now
	!!
	!! First get PC
	!rd %pc, %i4
	!! Zero out lower 13 bits
	!srlx %i4, 13, %i0
	!sllx %i0, 13, %i0
	!
	!! Write it to itlb_tag_access register
	!! ASI 0x50, addr 0x30
	!setx 0x30, %l1, %i1
	!stxa	%i0,	[%i1 + %g0] 0x50
	!
	!! Create tte_data in %i2
	!! sun4v format
	!! Field  V   NFO  L   PA     IE  E CP P W Size
	!! Bit    63  62   61  39:13  12 11 10 8 6 2:0
	!!
	!! First set valid bit
	!setx 0x8000000000000000, %l1, %i2
	!! Now set up PA
	!setx 0x000000FFFFFFE000, %l1, %i5
	!and %i4, %i5, %i5
	!! Now merge them
	!or %i2, %i5, %i2
	!
	!
	!! Write it to itlb_data_in register
	!! ASI 0x54, address with bit 10 set (for sun4v)
	!setx 0x400, %l1, %i3
	!stxa    %i2,    [%i3 + %g0] 0x54

	! Now activate translation
	! Reset HPSTATE.ENB (bit 11)
	!rdhpr %hpstate, %i7
	!and %i7, 0x17FF, %i7
	!wrhpr %i7, %hpstate
	!! Set lsu_control_reg.dm (bit 3 in ASI 0x45, VA 0x0)
	!setx 0x8, %l1, %i6
	!stxa %i6, [%g0 + %g0] 0x45

	! Fetch and execute some stuff...

	add %i1, %i2, %o1
	add %i2, %i3, %o2
	add %i3, %i4, %o3
	add %i4, %i5, %o4
	add %i5, %i6, %o5

	setx 1, %l1, %l5
	
	setx MAIN_BASE_DATA_VA, %i1, %l7
	ldx [%l7+0], %l5

	setx 8192, %i1, %l6
	add %l5, 1, %l5
	stx %l5, [%l7 + %l6]
	


	





	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
page0:		
.word 0x04BAEE04
.word 0xA26211E7
.word 0xC46CE935
.word 0xD086C0FA
.word 0x95181468
.word 0xA561DA01
.word 0x66B600B3
.word 0x3DDF304B
.align 8192
page1:		
.word 0xD59B63E9
.word 0x69CD7744
.word 0x93D976FD
.word 0x632A2A09
.word 0xD21BB7C3
.word 0x6D4AA3F7
.word 0x1FB493C2
.word 0xA8132A6B
.word 0x5D211FF0
.word 0x819A5EF5
.word 0x73B3D78A
.word 0x979BCD1A
.word 0x88730AC3
.word 0xBD87189E
.word 0x372CA055
.word 0x87AD6A47
.word 0x1EC56408
.word 0x19156A2C
.word 0x188A924A
.word 0xE21AB83D
.word 0xAC4488B1
.word 0x34AF2861
.word 0x90E27A07
.word 0x7ECBAD34
.word 0x0D0C9AD8
.word 0xCD68A2C2
.word 0x744F3CF8
.word 0x8BF0C9D3
.word 0xB6232F4D
.word 0x16EEB7FF
.word 0x2CE4DC96
.word 0x086BC9ED
.word 0x87757CAE
.word 0xF207ACCA
.word 0xE25E65DB
.word 0x8189486F
.word 0x00156704
.word 0x0E78970C
.word 0x00B22AFF
.word 0x5EA3DBAD
.word 0x091EEE20
.word 0x067AF9AB
.word 0x68CC189A
.word 0xAEE0946E
.word 0x24E3D750
.word 0x704AC16A
.word 0xA3F11926
.word 0xE63276D1
.word 0xDD91CC43
.word 0x87772648
.word 0x2983F7D2
.word 0xD99DB0E4
.word 0x96D7B61B
.word 0x29F098FC
.word 0xCA413B16
.word 0x506B0706
.end
