/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tso_n1_self_mod10.s
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
#define MAIN_BASE_DATA_ADDR     0x160000
#define MAIN_BASE_TEXT_ADDR     0x150000
#define MAIN_BASE_DATA_ADDR_RA   0x100160000
#define MAIN_BASE_TEXT_ADDR_RA   0x100150000

#define USER_PAGE_CUSTOM_MAP
#include "hboot.s"

SECTION .MAIN  TEXT_VA=0x150000, DATA_VA=0x160000

attr_text {
        Name = .MAIN,
        VA=MAIN_BASE_TEXT_ADDR,
        RA=MAIN_BASE_TEXT_ADDR_RA,
        PA=ra2pa(MAIN_BASE_TEXT_ADDR_RA,0),
        part_0_ctx_nonzero_tsb_config_0,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_EP=1, TTE_P=0, TTE_W=1
        }
attr_data {
        Name = .MAIN,
        VA=MAIN_BASE_DATA_ADDR,
        RA=MAIN_BASE_DATA_ADDR_RA,
        PA=ra2pa(MAIN_BASE_DATA_ADDR_RA,0),
        part_0_ctx_nonzero_tsb_config_0,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
        }

.text
.global main
main:

	wr      %g0, 0x4, %fprs         /* make sure fef is 1 */
	setx 	good_data, %l0,%o0	! prepare good and bad data
	setx 	bad_data, %l0,%o1	!
	ldda    [%o0]ASI_BLK_P, %d0	! in d0 and d16
	ldda    [%o1]ASI_BLK_P, %d16                   
        membar  0x40

	setx 	label0, %l0,%o0		! prepare address registers
	setx 	label1, %l0,%o1
	setx 	label2, %l0,%o2
	setx 	label3, %l0,%o3
	setx 	label4, %l0,%o4
	setx 	label5, %l0,%o5
	setx 	label6, %l0,%o6
	setx 	label7, %l0,%o7
	setx 	0x20, %l0, %l2

label0a:
	stda	%d0, [%o0]ASI_BLK_P	! store good data to label0
        membar  0x40
	flush 	%o0
	ba	label0
	nop

.align	0x40
label0:
	ta	T_BAD_TRAP		! this is overwritten by good data
	ta	T_BAD_TRAP		! BEFORE any execution
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 

	stda	%d0, [%o1]ASI_BLK_P	! store good data to label1
        membar  0x40
	flush 	%o0			! 
	ba	label1
	nop

.align	0x40
label1:
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	stda	%d0, [%o2]ASI_BLK_P  ! store good data to label2
        membar  0x40
	flush 	%o0
	ba	label2
	nop

.align	0x40
label2:
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	stda	%d0, [%o3]ASI_BLK_P	! store good data to label3
        membar  0x40
	flush 	%o0			!
	ba	label3
	nop

.align	0x40
label3:
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	stda	%d0, [%o4]ASI_BLK_P
        membar  0x40
	flush 	%o0			!
	ba	label4
	nop

.align	0x40
label4:
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	stda	%d0, [%o5]ASI_BLK_P
        membar  0x40
	flush 	%o0			!
	ba	label5
	nop

.align	0x40
label5:
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	stda	%d0, [%o6]ASI_BLK_P
        membar  0x40
	flush 	%o0			!
	ba	label6
	nop

.align	0x40
label6:
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	stda	%d0, [%o7]ASI_BLK_P
        membar  0x40
	flush 	%o0			!
	ba	label7
	nop

.align	0x40
label7:
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	ta	T_BAD_TRAP		! 
	stda	%d0, [%o0]ASI_BLK_P
        membar  0x40
	flush 	%o0	

	stda	%d16, [%o0]ASI_BLK_P	! store bad data to all labels
	stda	%d16, [%o1]ASI_BLK_P
	stda	%d16, [%o2]ASI_BLK_P
	stda	%d16, [%o3]ASI_BLK_P
	stda	%d16, [%o4]ASI_BLK_P
	stda	%d16, [%o5]ASI_BLK_P
	stda	%d16, [%o6]ASI_BLK_P
	stda	%d16, [%o7]ASI_BLK_P
        membar  0x40

	dec     %l2                                       
        brnz,pt %l2, label0a		! and loop again
        nop

normal_end:
        ta      T_GOOD_TRAP
bad_end:
        ta      T_BAD_TRAP


user_text_end:

/***********************************************************************
   Test case data start
 ***********************************************************************/
.data
.align 0x100
good_data:

	.word 0x01000000
	.word 0x01000000
	.word 0x01000000
	.word 0x01000000
	.word 0x01000000
	.word 0x01000000
	.word 0x01000000
	.word 0x01000000
	.word 0x01000000
	.word 0x01000000
	.word 0x01000000
	.word 0x01000000
	.word 0x01000000
	.word 0x01000000
	.word 0x01000000
	.word 0x01000000

bad_data:
	.word 0xdeadbeef
	.word 0xdeadbeef
	.word 0xdeadbeef
	.word 0xdeadbeef
	.word 0xdeadbeef
	.word 0xdeadbeef
	.word 0xdeadbeef
	.word 0xdeadbeef
	.word 0xdeadbeef
	.word 0xdeadbeef
	.word 0xdeadbeef
	.word 0xdeadbeef
	.word 0xdeadbeef
	.word 0xdeadbeef
	.word 0xdeadbeef
	.word 0xdeadbeef

user_data_end:
