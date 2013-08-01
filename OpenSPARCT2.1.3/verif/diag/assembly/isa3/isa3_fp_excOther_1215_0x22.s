/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_fp_excOther_1215_0x22.s
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

#define H_HT0_Illegal_instruction_0x10
#define My_HT0_Illegal_instruction_0x10 EXIT_GOOD

#include "hboot.s"

.text
.global main  

main:

	fmovrqne  %r0, %f0, %f0          ! unimplemented

        nop

	
/*******************************************************
 * Exit code
 *******************************************************/

test_fail:
	ta		T_BAD_TRAP

/*******************************************************
 * Data section 
 *******************************************************/
	
.data

.align 256

newdata:
	.xword          0x0211000000abcd01      ! f18 
	.xword          0x0000000000000000      ! f20
	.xword          0x3ff0000000000001      ! was f18 

.align 256

fsr_tem_en:
	.word		0x0f800000	! TEM - all enabled - rd 0
	.word		0x4f800000	! TEM - all enabled - rd 1
	.word		0x8f800000	! TEM - all enabled - rd 2
	.word		0xcf800000	! TEM - all enabled - rd 3
        .word           0x00000000      ! TEM - walk through all values
        .word           0x0f800000
	.word           0x01000000      ! DZM set (+0x30)
        .word           0x01800000
	.word           0x02000000      ! UFM set (+0x40)
        .word           0x02800000
        .word           0x03000000      ! OFM set (+0x50)
	.word           0x03800000
	.word           0x04000000      ! NVM set (+0x60)
	.word           0x04800000
	.word           0x05000000
	.word           0x05800000
	.word           0x06000000
	.word           0x06800000
	.word           0x07000000
	.word           0x07800000
	.word           0x08000000      ! NXM set (+0xa0)
	.word           0x08800000
	.word           0x09000000
	.word           0x09800000
	.word           0x0a000000
	.word           0x0a800000
	.word           0x0b000000
	.word           0x0b800000
	.word           0x0c000000
	.word           0x0c800000
	.word           0x0d000000
	.word           0x0d800000
	.word           0x0e000000
	.word           0x0e800000
	.word           0x0f000000
	.word           0x0f800000
	.word           0x01800000
	.word           0x02800000
	.word           0x03800000
	.word           0x04800000
