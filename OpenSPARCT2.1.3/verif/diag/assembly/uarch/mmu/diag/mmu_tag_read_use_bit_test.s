/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mmu_tag_read_use_bit_test.s
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

#include "hboot.s"

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:		/* test begin */

	ta T_CHANGE_HPRIV
	or %g0, ASI_DMMU_TAG_ACCESS_VAL, %g5
	setx 0xFFFFFFFFFFFFFFF0, %o2, %o1
	! Updating DTLB Entry 0
	setx    0x1847C09BDFDB956A, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x0, %g3, %g4
	setx    0x1DF2E673901B3ACF, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 0
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 1
	setx    0xCCB9247F00DEF1DD, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x8, %g3, %g4
	setx    0x2FA079B32ADCB398, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 1
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 2
	setx    0xA62C3AEC27386D77, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x10, %g3, %g4
	setx    0xAAA213F16793C43F, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 2
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 3
	setx    0xB9DB9A7C0AA64305, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x18, %g3, %g4
	setx    0x5DB74F16E0275C0C, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 3
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 4
	setx    0xECAED9648ED12D8D, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x20, %g3, %g4
	setx    0x3B0A57EAB6D74A34, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 5
	setx    0x7F68C97C3D98738C, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x28, %g3, %g4
	setx    0xD2C68B47384A2440, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 5
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 6
	setx    0x484C54DF3ABB0842, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x30, %g3, %g4
	setx    0x07DAE3DA06CE3BD4, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 6
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 7
	setx    0xCBB0C1A3279FA7B8, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x38, %g3, %g4
	setx    0xC6E1A67021B75C24, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 7
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 8
	setx    0x317E228D285EA76D, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x40, %g3, %g4
	setx    0x6F141B38D7FD5590, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 8
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 9
	setx    0x1EEEE7FF21CD32D8, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x48, %g3, %g4
	setx    0xF28D4DF9931383C5, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 9
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 10
	setx    0x2D2868BC1AA0162D, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x50, %g3, %g4
	setx    0x338A09AD92A78113, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 10
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 11
	setx    0x9F49F55AAC59B18E, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x58, %g3, %g4
	setx    0x48DF8F13054214B7, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 11
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 12
	setx    0x84BA4607BC52A292, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x60, %g3, %g4
	setx    0x1646D668BD972887, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 12
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 13
	setx    0x8397CBA24F1BFD3C, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x68, %g3, %g4
	setx    0x0BDCC12F58646792, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 13
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 14
	setx    0x1818DAC34E0F52BB, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x70, %g3, %g4
	setx    0x69B904E81988B348, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 14
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 15
	setx    0xEAE3E153CEB67057, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x78, %g3, %g4
	setx    0xF907ADD89D71DCB6, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 15
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 16
	setx    0xC2DC6BBB435CF7FA, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x80, %g3, %g4
	setx    0xC79E32005F6675F4, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 16
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 17
	setx    0xC84A554DBC0AE043, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x88, %g3, %g4
	setx    0x4D0A86B74CCC531D, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 17
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 18
	setx    0x36F1FF868EB46D57, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x90, %g3, %g4
	setx    0xCA40CBD12DCEB918, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 18
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 19
	setx    0xAD4B24DDDBD51CE8, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x98, %g3, %g4
	setx    0xD0888048E403CAD5, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 19
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 20
	setx    0x22857DA59FB2DB00, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0xA0, %g3, %g4
	setx    0xC0B233A8C8FCA304, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 20
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 21
	setx    0x6D297BE0485DFB4F, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0xA8, %g3, %g4
	setx    0xF6A2F2C1774F416E, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 21
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 22
	setx    0xAD0B42F6132BE12E, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0xB0, %g3, %g4
	setx    0x330470190B3C9F00, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 22
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 23
	setx    0x13C39FA8409C2982, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0xB8, %g3, %g4
	setx    0xD39ECECFC1AAFF5D, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 23
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 24
	setx    0xE14CF10A898A47F5, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0xC0, %g3, %g4
	setx    0x168D8D962D84F4AC, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 24
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 25
	setx    0x8A31772D29A16702, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0xC8, %g3, %g4
	setx    0xF1050D7640C6D0AB, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 25
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 26
	setx    0xDA5B977C6E3432B9, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0xD0, %g3, %g4
	setx    0x6EAC584B7E2A0569, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 26
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 27
	setx    0x585084738A706FCC, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0xD8, %g3, %g4
	setx    0x6F5079D9D09D0077, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 27
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 28
	setx    0x8032D5A2693EBBE9, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0xE0, %g3, %g4
	setx    0x7DF6049091BBDB64, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 28
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 29
	setx    0x1A1C760E3C3F1628, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0xE8, %g3, %g4
	setx    0xFFE4405F3CD0FE0C, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 29
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 30
	setx    0x2AD9C39E0B459A51, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0xF0, %g3, %g4
	setx    0xB761FAE49586E4B3, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 30
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 31
	setx    0xDA0E80C1CF00BCF7, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0xF8, %g3, %g4
	setx    0xAA82DEC3404D6725, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 31
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 32
	setx    0x4F8F7AE1462E23E5, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x100, %g3, %g4
	setx    0x574A158CF637BEBD, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 32
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 33
	setx    0x2480D38D70AEDE4C, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x108, %g3, %g4
	setx    0x17296253D7540B34, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 33
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 34
	setx    0xF76A1D6AB7B6B31E, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x110, %g3, %g4
	setx    0xF6B8CAC6E723448C, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 34
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 35
	setx    0x85C9686331D8C92D, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x118, %g3, %g4
	setx    0x4BE530A2CFFCEDA9, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 35
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 36
	setx    0x7C6566DFB33CCB6F, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x120, %g3, %g4
	setx    0x7F4E0BB00614FD0C, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 36
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 37
	setx    0x5F52A2704E600826, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x128, %g3, %g4
	setx    0xE171BF08E30D8A0E, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 37
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 38
	setx    0x4719416F04C50759, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x130, %g3, %g4
	setx    0x59BD28B418BD42E8, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 38
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 39
	setx    0x9CC8E61090D06F74, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x138, %g3, %g4
	setx    0x5966F6879688F84D, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 39
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 40
	setx    0x0B40796DB7D13317, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x140, %g3, %g4
	setx    0x0744BC3434038400, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 40
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 41
	setx    0x6692D0CC1F74D9BF, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x148, %g3, %g4
	setx    0x73E08EC2B44F5A31, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 41
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 42
	setx    0x074E9B14AEB54B4A, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x150, %g3, %g4
	setx    0x960A464FFB362F3D, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 42
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 43
	setx    0x7C84033F513008D9, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x158, %g3, %g4
	setx    0x26F2668C47D3352F, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 43
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 44
	setx    0xC9F5A1C5912A052D, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x160, %g3, %g4
	setx    0x958599C4567F71BE, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 44
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 45
	setx    0x69E0FA768C18A279, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x168, %g3, %g4
	setx    0xEAAD63F8BCB50A09, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 45
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 46
	setx    0xC8C6867FED4EA9CB, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x170, %g3, %g4
	setx    0x707C10544BB8EAC7, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 46
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 47
	setx    0x912F5B8A65BCEBD9, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x178, %g3, %g4
	setx    0x6E44850C97CAB896, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 47
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 48
	setx    0xD2F3CE2CEC0B077A, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x180, %g3, %g4
	setx    0xDD266809E0AC19A5, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 48
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 49
	setx    0x6C4953210777A94C, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x188, %g3, %g4
	setx    0xCD8AD3EDE8D389D1, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 49
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 50
	setx    0x7B21A101BD6183E6, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x190, %g3, %g4
	setx    0x1B951BDFDAE68274, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 50
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 51
	setx    0x9A6E8FCF14F6B827, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x198, %g3, %g4
	setx    0xD0556BDA6D9F73EC, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 51
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 52
	setx    0x2146B94B626FD4E9, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x1A0, %g3, %g4
	setx    0x9F6850E5C5D35AEA, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 52
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 53
	setx    0x5CADA3D01F2CE90A, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x1A8, %g3, %g4
	setx    0x950F7E5ACDD552ED, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 53
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 54
	setx    0xAB93F60FC0C197BB, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x1B0, %g3, %g4
	setx    0x84578D5C4CFD7C79, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 54
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 55
	setx    0xEEB3DA4120411437, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x1B8, %g3, %g4
	setx    0x3CFF3C79EFB0CA14, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 55
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 56
	setx    0xDDF5065EE5783AF0, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x1C0, %g3, %g4
	setx    0xB3B7B7460D69A39F, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 56
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 57
	setx    0x34D62266DF301A4C, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x1C8, %g3, %g4
	setx    0xE9396C4592C1FADD, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 57
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 58
	setx    0x3F601D8444CE54C6, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x1D0, %g3, %g4
	setx    0xEEDBD2C6F3D025BE, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 58
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 59
	setx    0xEFC437A66B2D8806, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x1D8, %g3, %g4
	setx    0x43CB49D7EB53CA98, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 59
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 60
	setx    0x72F249321D7F4597, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x1E0, %g3, %g4
	setx    0xF8294CA7F73CB59B, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 60
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 61
	setx    0xA29337482C3BB3C5, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x1E8, %g3, %g4
	setx    0x0E61F669E016558B, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 61
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 62
	setx    0x44D4F1C2B58D9EDD, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x1F0, %g3, %g4
	setx    0x10CCFCF8CF7F37C6, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 62
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 63
	setx    0x8130F56B050C47B2, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x1F8, %g3, %g4
	setx    0xAB82E4446539988D, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 63
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 64
	setx    0xA28B3CB8956430D1, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x200, %g3, %g4
	setx    0x0D235BFD06855A05, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 64
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 65
	setx    0x0A12923C7E89935E, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x208, %g3, %g4
	setx    0x51D7BAF19C4E40A0, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 65
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 66
	setx    0x279F12E4077AB294, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x210, %g3, %g4
	setx    0xE08CFF7D66B3F285, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 66
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 67
	setx    0xADF01BB1FDFFA502, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x218, %g3, %g4
	setx    0xA62F17AB07FDF9DB, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 67
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 68
	setx    0x5F2F8286C4C39975, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x220, %g3, %g4
	setx    0x2DD7CC0B9735EA29, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 68
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 69
	setx    0x6EB12AF8D3714E6F, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x228, %g3, %g4
	setx    0xB4031F5CD45EB031, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 69
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 70
	setx    0x2385CDB9431C2F26, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x230, %g3, %g4
	setx    0xB1404CF2D1D0E979, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 70
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 71
	setx    0x66869CEF7659476F, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x238, %g3, %g4
	setx    0x46EFB748273498C9, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 71
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 72
	setx    0x66D51A93B0ED9986, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x240, %g3, %g4
	setx    0x6174B032141B3C04, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 72
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 73
	setx    0x4C71C7C893514996, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x248, %g3, %g4
	setx    0xB90AA99CDDE47761, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 73
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 74
	setx    0xA231F01FB323E3E0, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x250, %g3, %g4
	setx    0x9D1530547E57EED6, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 74
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 75
	setx    0x7BFD2D434A3E7C4D, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x258, %g3, %g4
	setx    0x3E7F49D5AAE17654, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 75
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 76
	setx    0xA046583E03EFB20C, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x260, %g3, %g4
	setx    0x36289C4EBDB0ADC9, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 76
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 77
	setx    0x79F6450572B5C98E, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x268, %g3, %g4
	setx    0x7358DF681D4D2D3E, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 77
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 78
	setx    0x01154D16BF19B428, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x270, %g3, %g4
	setx    0xF53D3ED40462DFFC, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 78
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 79
	setx    0x11FB28A43485FEC3, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x278, %g3, %g4
	setx    0x7D50068F0D116336, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 79
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 80
	setx    0xBAD9B5F8FC20DCCD, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x280, %g3, %g4
	setx    0xAE3D25DE59FAE7CC, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 80
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 81
	setx    0x52B476134C9BBB5C, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x288, %g3, %g4
	setx    0x7C66DE49B9D11FE8, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 81
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 82
	setx    0x24289EFD69008784, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x290, %g3, %g4
	setx    0xEC227E2357A9D2FC, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 82
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 83
	setx    0x7263632C8C150B85, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x298, %g3, %g4
	setx    0x8AB66F103F7E6F7F, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 83
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 84
	setx    0xF402175CFD42F2E4, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x2A0, %g3, %g4
	setx    0x1B6FF42A7ADCFEFC, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 84
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 85
	setx    0x34459AF310878884, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x2A8, %g3, %g4
	setx    0xA8376CC1F2C3360C, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 85
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 86
	setx    0xDFBA5B87EAC91CE7, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x2B0, %g3, %g4
	setx    0x90D417B950D2D589, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 86
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 87
	setx    0x350061A342CBD238, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x2B8, %g3, %g4
	setx    0x13D88538465FE3C0, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 87
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 88
	setx    0x9C581247F2306C68, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x2C0, %g3, %g4
	setx    0x1AE9E4BF33E4FC85, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 88
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 89
	setx    0xC93502CE0EAD2661, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x2C8, %g3, %g4
	setx    0x1C3A23A2C0A70CA9, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 89
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 90
	setx    0x83300F390F4C3DF2, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x2D0, %g3, %g4
	setx    0x7DEDBDAC1C9ED168, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 90
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 91
	setx    0xFEEAB993C0F42F30, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x2D8, %g3, %g4
	setx    0x37F29882B0B98FA1, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 91
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 92
	setx    0x2EAEBF0FF282200C, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x2E0, %g3, %g4
	setx    0x81A66ED43D3014D0, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 92
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 93
	setx    0xA68453501216E3C0, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x2E8, %g3, %g4
	setx    0x01BBFDC9C15A6F58, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 93
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 94
	setx    0xF94C8B0C54711BE5, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x2F0, %g3, %g4
	setx    0x358CBE3C57BE542D, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 94
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 95
	setx    0x4C6798A5E1458D36, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x2F8, %g3, %g4
	setx    0xE2C21EF2FB9E13A9, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 95
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 96
	setx    0xB92A51A02B7DA7BC, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x300, %g3, %g4
	setx    0x3E501966499BA397, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 96
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 97
	setx    0x59B9CE4D12CF73C7, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x308, %g3, %g4
	setx    0xD7A13FD5215C88BA, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 97
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 98
	setx    0x8253AC3AE2A8E5F1, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x310, %g3, %g4
	setx    0x6CFCFBB7C740D2E3, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 98
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 99
	setx    0xA1991A48C0E4A721, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x318, %g3, %g4
	setx    0x3C4EAB59C931544A, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 99
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 100
	setx    0xC6B4B69FBB31A381, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x320, %g3, %g4
	setx    0x0DA4D0AD99AF9600, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 100
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 101
	setx    0x50CDC12BA92A7760, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x328, %g3, %g4
	setx    0xDC4189B08CBA0B0A, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 101
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 102
	setx    0xD2395CD33BA11C24, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x330, %g3, %g4
	setx    0xB960CBD7CEE238B4, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 102
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 103
	setx    0x801F8A77B3EE138B, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x338, %g3, %g4
	setx    0x253FFF707FD01F84, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 103
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 104
	setx    0x2AD3A1A6E2FB03E2, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x340, %g3, %g4
	setx    0xDC7198988F550143, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 104
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 105
	setx    0xDB917D8B039E040B, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x348, %g3, %g4
	setx    0x11A0EE78067D61EB, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 105
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 106
	setx    0xBAA83C6A55E9D902, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x350, %g3, %g4
	setx    0x6E4580767FD00591, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 106
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 107
	setx    0xCC7629542934301F, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x358, %g3, %g4
	setx    0x7FF55F4F946CEC85, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 107
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 108
	setx    0xAA12284F8AF715CE, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x360, %g3, %g4
	setx    0x02D681A3667662E3, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 108
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 109
	setx    0x96EB9B3E1E38D45F, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x368, %g3, %g4
	setx    0x98AD46C50A84781B, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 109
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 110
	setx    0x2866F49969695028, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x370, %g3, %g4
	setx    0xD5824B773207F9DB, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 110
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 111
	setx    0x124940E378BFFFC1, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x378, %g3, %g4
	setx    0xDDC869E62B343468, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 111
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 112
	setx    0x64ED4E73751EE0E5, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x380, %g3, %g4
	setx    0x0C666EAFB26A04EB, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 112
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 113
	setx    0x1898907501AAFBEC, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x388, %g3, %g4
	setx    0xE40AD6B52509CBC0, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 113
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 114
	setx    0x3263CAECEF5B64CC, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x390, %g3, %g4
	setx    0xB16ACF211B8550EC, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 114
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 115
	setx    0xA644B97B24AC3721, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x398, %g3, %g4
	setx    0x402516F7EF7AF7A7, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 115
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 116
	setx    0x6D14B57EFA78C274, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x3A0, %g3, %g4
	setx    0xAF48250FAB1C941E, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 116
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 117
	setx    0x39DC7201AB6FBD96, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x3A8, %g3, %g4
	setx    0x53C56E43155AE3A0, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 117
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 118
	setx    0xD2BA853959D5ADC1, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x3B0, %g3, %g4
	setx    0x750B2BE5695770F0, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 118
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 119
	setx    0x11706E974271F6F9, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x3B8, %g3, %g4
	setx    0x90A1438B521DE0EE, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 119
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 120
	setx    0x9BBC6300020CAA27, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x3C0, %g3, %g4
	setx    0x4C743AE95B0648E8, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 120
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 121
	setx    0x36147A50DFE6C39F, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x3C8, %g3, %g4
	setx    0x874E063E83641F57, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 121
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 122
	setx    0xF3E492A94F4F2DCF, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x3D0, %g3, %g4
	setx    0x013E370AB1CD019A, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 122
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 123
	setx    0x3A788398EF5A0A03, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x3D8, %g3, %g4
	setx    0xFC3900AE2722F4A2, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 123
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 124
	setx    0xA76AA598F3607865, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x3E0, %g3, %g4
	setx    0xB3C8DE67868381E1, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 124
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 125
	setx    0xAB836CC7B289EBCB, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x3E8, %g3, %g4
	setx    0x9B2309952FA77510, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 125
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 126
	setx    0x3043EAF0207EA170, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x3F0, %g3, %g4
	setx    0x94E9CD4FBD885240, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 126
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	! Updating DTLB Entry 127
	setx    0x5655043271EC33E2, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_DMMU_TAG_REG


	setx    0x3F8, %g3, %g4
	setx    0xD66359F6A1FDC1E0, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_DTLB_DATA_ACCESS_REG

	! Checking Use Bit for DTLB entry 127
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! All Entries Used so used bit should now be 0

	! Checking Use Bit for DTLB entry 0
	setx    0x0, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 1
	setx    0x8, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 2
	setx    0x10, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 3
	setx    0x18, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 4
	setx    0x20, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 5
	setx    0x28, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 6
	setx    0x30, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 7
	setx    0x38, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 8
	setx    0x40, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 9
	setx    0x48, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 10
	setx    0x50, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 11
	setx    0x58, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 12
	setx    0x60, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 13
	setx    0x68, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 14
	setx    0x70, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 15
	setx    0x78, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 16
	setx    0x80, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 17
	setx    0x88, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 18
	setx    0x90, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 19
	setx    0x98, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 20
	setx    0xA0, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 21
	setx    0xA8, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 22
	setx    0xB0, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 23
	setx    0xB8, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 24
	setx    0xC0, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 25
	setx    0xC8, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 26
	setx    0xD0, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 27
	setx    0xD8, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 28
	setx    0xE0, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 29
	setx    0xE8, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 30
	setx    0xF0, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 31
	setx    0xF8, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 32
	setx    0x100, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 33
	setx    0x108, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 34
	setx    0x110, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 35
	setx    0x118, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 36
	setx    0x120, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 37
	setx    0x128, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 38
	setx    0x130, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 39
	setx    0x138, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 40
	setx    0x140, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 41
	setx    0x148, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 42
	setx    0x150, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 43
	setx    0x158, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 44
	setx    0x160, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 45
	setx    0x168, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 46
	setx    0x170, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 47
	setx    0x178, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 48
	setx    0x180, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 49
	setx    0x188, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 50
	setx    0x190, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 51
	setx    0x198, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 52
	setx    0x1A0, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 53
	setx    0x1A8, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 54
	setx    0x1B0, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 55
	setx    0x1B8, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 56
	setx    0x1C0, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 57
	setx    0x1C8, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 58
	setx    0x1D0, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 59
	setx    0x1D8, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 60
	setx    0x1E0, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 61
	setx    0x1E8, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 62
	setx    0x1F0, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 63
	setx    0x1F8, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 64
	setx    0x200, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 65
	setx    0x208, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 66
	setx    0x210, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 67
	setx    0x218, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 68
	setx    0x220, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 69
	setx    0x228, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 70
	setx    0x230, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 71
	setx    0x238, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 72
	setx    0x240, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 73
	setx    0x248, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 74
	setx    0x250, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 75
	setx    0x258, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 76
	setx    0x260, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 77
	setx    0x268, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 78
	setx    0x270, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 79
	setx    0x278, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 80
	setx    0x280, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 81
	setx    0x288, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 82
	setx    0x290, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 83
	setx    0x298, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 84
	setx    0x2A0, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 85
	setx    0x2A8, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 86
	setx    0x2B0, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 87
	setx    0x2B8, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 88
	setx    0x2C0, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 89
	setx    0x2C8, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 90
	setx    0x2D0, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 91
	setx    0x2D8, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 92
	setx    0x2E0, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 93
	setx    0x2E8, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 94
	setx    0x2F0, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 95
	setx    0x2F8, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 96
	setx    0x300, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 97
	setx    0x308, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 98
	setx    0x310, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 99
	setx    0x318, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 100
	setx    0x320, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 101
	setx    0x328, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 102
	setx    0x330, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 103
	setx    0x338, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 104
	setx    0x340, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 105
	setx    0x348, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 106
	setx    0x350, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 107
	setx    0x358, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 108
	setx    0x360, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 109
	setx    0x368, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 110
	setx    0x370, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 111
	setx    0x378, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 112
	setx    0x380, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 113
	setx    0x388, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 114
	setx    0x390, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 115
	setx    0x398, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 116
	setx    0x3A0, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 117
	setx    0x3A8, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 118
	setx    0x3B0, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 119
	setx    0x3B8, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 120
	setx    0x3C0, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 121
	setx    0x3C8, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 122
	setx    0x3D0, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 123
	setx    0x3D8, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 124
	setx    0x3E0, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 125
	setx    0x3E8, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 126
	setx    0x3F0, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! Checking Use Bit for DTLB entry 127
	setx    0x3F8, %g3, %g4
	ldxa    [%g4] ASI_DTLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Writing to ITLB entry 0
	setx    0x216C969BAB3C952A, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x0, %g3, %g4
	setx    0x3E27A698AC042FB7, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 0
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 1
	setx    0x4DE6FB969438D49F, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x8, %g3, %g4
	setx    0xF6C5E44C60856A71, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 1
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 2
	setx    0xCAB8716438AA09A3, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x10, %g3, %g4
	setx    0xB20E6E9A25EB2C85, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 2
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 3
	setx    0xA333114130D4C74C, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x18, %g3, %g4
	setx    0x1E7D287C4C14089F, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 3
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 4
	setx    0x26F3A330F357369C, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x20, %g3, %g4
	setx    0x2CC9FEEE8308F948, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 5
	setx    0xFAE47A53910E4B83, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x28, %g3, %g4
	setx    0x305640F59D1324FE, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 5
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 6
	setx    0x9B11D56883EBBD37, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x30, %g3, %g4
	setx    0x220E449ECFFEA7EC, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 6
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 7
	setx    0xA5EF8D53B5A809DF, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x38, %g3, %g4
	setx    0xAE6FEA03ACB4B8BD, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 7
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 8
	setx    0x44241D1532D8F0D7, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x40, %g3, %g4
	setx    0x0E393FE28444FEDA, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 8
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 9
	setx    0x934BC4C4FBCBD3DF, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x48, %g3, %g4
	setx    0x27C7907A8ACAF0A8, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 9
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 10
	setx    0xF05A56E3B4290EC5, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x50, %g3, %g4
	setx    0xA0A71873499B0D14, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 10
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 11
	setx    0x82871462D5188CDD, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x58, %g3, %g4
	setx    0x7A5B0543BB89D064, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 11
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 12
	setx    0x8C4E20F8B32ADF61, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x60, %g3, %g4
	setx    0x657C53E14510F98F, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 12
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 13
	setx    0xE9E50154A5FEEB3F, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x68, %g3, %g4
	setx    0x814E4DB7A705E4EE, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 13
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 14
	setx    0xB6ADC46AF550CC56, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x70, %g3, %g4
	setx    0x2156456FF8AFF271, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 14
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 15
	setx    0x9F5CE08BEF3C65C2, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x78, %g3, %g4
	setx    0x997F4BEF11469516, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 15
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 16
	setx    0x5EE29922AB780507, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x80, %g3, %g4
	setx    0xDD7A4AB19B68BBD6, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 16
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 17
	setx    0x8C0816CE53EC5083, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x88, %g3, %g4
	setx    0x0634811EDBF4A70B, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 17
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 18
	setx    0xC5827077E16C7CCC, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x90, %g3, %g4
	setx    0x4634316EF15DD6C4, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 18
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 19
	setx    0xCC13FD75267A0640, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x98, %g3, %g4
	setx    0xE3513DBE9571C5E2, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 19
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 20
	setx    0x621C057B58924555, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0xA0, %g3, %g4
	setx    0xD8B63D3B80CDA89B, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 20
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 21
	setx    0xC472AE065308D23F, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0xA8, %g3, %g4
	setx    0x3E5449435D0D94DF, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 21
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 22
	setx    0x7D121F3075EECBBD, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0xB0, %g3, %g4
	setx    0xB48E1AEDE81C59B2, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 22
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 23
	setx    0xBF137F5C2F0F5A23, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0xB8, %g3, %g4
	setx    0x1E0444F7B5E67C4E, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 23
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 24
	setx    0x798D8BC9AC4A255A, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0xC0, %g3, %g4
	setx    0x70F7130324D52147, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 24
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 25
	setx    0x8E8FFF9D6EFC4749, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0xC8, %g3, %g4
	setx    0x6AFBD9D2B969AE62, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 25
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 26
	setx    0x26149265F6BAE317, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0xD0, %g3, %g4
	setx    0x956ED15FFDE8D19C, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 26
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 27
	setx    0xA65723484FC622DA, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0xD8, %g3, %g4
	setx    0x8808C024A99607D2, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 27
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 28
	setx    0x6590CD806D535037, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0xE0, %g3, %g4
	setx    0x9CFE18126A3AC6F1, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 28
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 29
	setx    0x6B770961EEB246AF, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0xE8, %g3, %g4
	setx    0x861F60FA825803B3, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 29
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 30
	setx    0x1520F672B25610CC, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0xF0, %g3, %g4
	setx    0xF16ECCE5B5649E0D, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 30
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 31
	setx    0x5BDFF818E4757446, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0xF8, %g3, %g4
	setx    0x36E8D2CE5907CEDB, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 31
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 32
	setx    0x1AA6AF94EEE86DF2, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x100, %g3, %g4
	setx    0xB5F4DD8B3FEFDDCC, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 32
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 33
	setx    0x3B7E2F6F72AF5102, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x108, %g3, %g4
	setx    0x10A61FF4B8F2743A, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 33
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 34
	setx    0xA2008ECB4C1E023A, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x110, %g3, %g4
	setx    0x2C4AFB3DFB1A6E9C, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 34
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 35
	setx    0xDA802F1636104059, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x118, %g3, %g4
	setx    0xA2FCDCB52B5840FA, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 35
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 36
	setx    0x283C7BE8FB57F601, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x120, %g3, %g4
	setx    0xA98B0F282C2C01BE, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 36
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 37
	setx    0x59D51C2DF302838A, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x128, %g3, %g4
	setx    0x096ECC1DFE82C9B7, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 37
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 38
	setx    0xED5D53F617620543, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x130, %g3, %g4
	setx    0x1190CAE3FA68D286, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 38
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 39
	setx    0xA594C454FFC596B5, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x138, %g3, %g4
	setx    0xB1BB0847F35DDFC7, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 39
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 40
	setx    0x26E692F0E99305E4, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x140, %g3, %g4
	setx    0xDFF08EF093C14F09, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 40
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 41
	setx    0x573BE5A659ACB115, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x148, %g3, %g4
	setx    0xBF9A362CF9BD22B6, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 41
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 42
	setx    0xBC549A9E7589C494, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x150, %g3, %g4
	setx    0xF15E0B5DCAD7C44A, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 42
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 43
	setx    0x669B3EA1A902FB33, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x158, %g3, %g4
	setx    0xB8D9FB6BEBC2D1CB, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 43
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 44
	setx    0x41E4A6914054B2FA, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x160, %g3, %g4
	setx    0xC1394D4D45649151, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 44
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 45
	setx    0xDE8EFEBDCD970CA9, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x168, %g3, %g4
	setx    0xB9839A2D1EC08F49, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 45
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 46
	setx    0x8BA309F38E3E8C90, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x170, %g3, %g4
	setx    0x4EA67302BC44C84D, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 46
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 47
	setx    0xDA8C78453D03ED0B, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x178, %g3, %g4
	setx    0x01787CA7849C358B, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 47
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 48
	setx    0x3BCF2AAF09193EDB, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x180, %g3, %g4
	setx    0x687617DBA5757AC7, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 48
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 49
	setx    0xA5896FEA51EE3821, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x188, %g3, %g4
	setx    0xE519D8C7A97E23A0, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 49
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 50
	setx    0x756C5C8A258362B8, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x190, %g3, %g4
	setx    0xB68B47D7F7187377, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 50
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 51
	setx    0xAB2391461D90538A, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x198, %g3, %g4
	setx    0x4E59A4CA6DD7D8DE, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 51
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 52
	setx    0x50EDAB922748AF71, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x1A0, %g3, %g4
	setx    0x89A388EB615CF8F2, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 52
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 53
	setx    0x8278DA21E1EB32C1, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x1A8, %g3, %g4
	setx    0x15E306665275C9E4, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 53
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 54
	setx    0xE19296EEBE303A72, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x1B0, %g3, %g4
	setx    0xE4358A008504CF06, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 54
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 55
	setx    0xB1173542FF63FBE2, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x1B8, %g3, %g4
	setx    0x2EDFC8553508C607, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 55
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 56
	setx    0x388C3F03BBAC1253, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x1C0, %g3, %g4
	setx    0x30483D9D93BA76A4, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 56
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 57
	setx    0x25A56B194B645236, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x1C8, %g3, %g4
	setx    0x2930F686826B479B, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 57
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 58
	setx    0xB05FBB213BA646E4, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x1D0, %g3, %g4
	setx    0x9841534F2FE0C01D, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 58
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 59
	setx    0x6CC4AC79CE1395D9, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x1D8, %g3, %g4
	setx    0x32481A52A410F7AA, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 59
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 60
	setx    0xE5EB0EDFB50A3C56, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x1E0, %g3, %g4
	setx    0x402809CA7599C446, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 60
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 61
	setx    0xE47C5337D1D3B087, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x1E8, %g3, %g4
	setx    0xFE675C65E3E1D743, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 61
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 62
	setx    0x199E9FBCEB2D7E39, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x1F0, %g3, %g4
	setx    0x54BD834857219655, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 62
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp     %g1, 0x1
	tne     T_BAD_TRAP

	!Writing to ITLB entry 63
	setx    0x2FFF96A2B2B8AE38, %g3, %g2
	stxa    %g2, [ %g5 ] ASI_IMMU_TAG_REG


	setx    0x1F8, %g3, %g4
	setx    0xE3F8FD0C39C6696A, %g3, %g2
	and     %o1, %g2, %g2
	stxa    %g2, [%g4] ASI_ITLB_DATA_ACCESS_REG

	!Checking Use Bit for ITLB entry 63
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	! All Entries Used-- Used should be set to 0

	!Checking Use Bit for ITLB entry 0
	setx    0x0, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 1
	setx    0x8, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 2
	setx    0x10, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 3
	setx    0x18, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 4
	setx    0x20, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 5
	setx    0x28, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 6
	setx    0x30, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 7
	setx    0x38, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 8
	setx    0x40, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 9
	setx    0x48, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 10
	setx    0x50, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 11
	setx    0x58, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 12
	setx    0x60, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 13
	setx    0x68, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 14
	setx    0x70, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 15
	setx    0x78, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 16
	setx    0x80, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 17
	setx    0x88, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 18
	setx    0x90, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 19
	setx    0x98, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 20
	setx    0xA0, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 21
	setx    0xA8, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 22
	setx    0xB0, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 23
	setx    0xB8, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 24
	setx    0xC0, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 25
	setx    0xC8, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 26
	setx    0xD0, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 27
	setx    0xD8, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 28
	setx    0xE0, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 29
	setx    0xE8, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 30
	setx    0xF0, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 31
	setx    0xF8, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 32
	setx    0x100, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 33
	setx    0x108, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 34
	setx    0x110, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 35
	setx    0x118, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 36
	setx    0x120, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 37
	setx    0x128, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 38
	setx    0x130, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 39
	setx    0x138, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 40
	setx    0x140, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 41
	setx    0x148, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 42
	setx    0x150, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 43
	setx    0x158, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 44
	setx    0x160, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 45
	setx    0x168, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 46
	setx    0x170, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 47
	setx    0x178, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 48
	setx    0x180, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 49
	setx    0x188, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 50
	setx    0x190, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 51
	setx    0x198, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 52
	setx    0x1A0, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 53
	setx    0x1A8, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 54
	setx    0x1B0, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 55
	setx    0x1B8, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 56
	setx    0x1C0, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 57
	setx    0x1C8, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 58
	setx    0x1D0, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 59
	setx    0x1D8, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 60
	setx    0x1E0, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 61
	setx    0x1E8, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 62
	setx    0x1F0, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	!Checking Use Bit for ITLB entry 63
	setx    0x1F8, %g3, %g4
	ldxa    [%g4] ASI_ITLB_TAG_READ_REG, %g1
	srlx    %g1, 58, %g2
	and     %g2, 0x1, %g1
	cmp %g1, %g0
	tne     T_BAD_TRAP

	
	nop
	nop
	nop
	nop
	EXIT_GOOD

/************************************************************************
   Test case data start
 ************************************************************************/
.data

user_data_start:
.xword 0xFFFF7FFFFFFFFFFF
.xword 0x08090a0b0c0d0e0f
.xword 0x1011121314151617
.xword 0x18191a1b1c1d1e1f
.xword 0x2021222324252627
.xword 0x28292a2b2c2d2e2f
.xword 0x3031323334353637
.xword 0x38393a3b3c3d3e3f
.xword 0x4041424344454647
.xword 0x48494a4b4c4d4e4f
.xword 0x5051525354555657
.xword 0x58595a5b5c5d5e5f
.xword 0x6061626364656667
.xword 0x68696a6b6c6d6e6f
.xword 0x7071727374757677
.xword 0x78797a7b7c7d7e7f
.xword 0x8081828384858687
.xword 0x88898a8b8c8d8e8f
.xword 0x9091929394959697
.xword 0x98999a9b9c9d9e9f
.xword 0xa0a1a2a3a4a5a6a7
.xword 0xa8a9aaabacadaeaf
.xword 0xb0b1b2b3b4b5b6b7
.xword 0xb8b9babbbcbdbebf
.xword 0xc0c1c2c3c4c5c6c7
.xword 0xc8c9cacbcccdcecf
.xword 0xd0d1d2d3d4d5d6d7
.xword 0xd8d9dadbdcdddedf
.xword 0xe0e1e2e3e4e5e6e7
.xword 0xe8e9eaebecedeeef
.xword 0xf0f1f2f3f4f5f6f7
.xword 0xf8f9fafbfcfdfeff
.end
