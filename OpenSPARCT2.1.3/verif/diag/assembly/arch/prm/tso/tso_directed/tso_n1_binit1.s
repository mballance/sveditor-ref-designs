/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tso_n1_binit1.s
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
#define		srcaddr		%i0
#define		dstaddr		%i1
#define		count		%i2

#include "hboot.s"

.global main
.text
main:
	wr      %g0, 0x4, %fprs         /* make sure fef is 1 */
	ta      T_CHANGE_PRIV

setup_addresses:
	setx in_stream, %g2, srcaddr
	setx out_stream, %g2, dstaddr

	ldda    [srcaddr] 0x22,  %l0
	add	srcaddr, 0x10, srcaddr
	ldda    [srcaddr] 0x22,  %l2
	add	srcaddr, 0x10, srcaddr
	ldda    [srcaddr] 0x22,  %l4
	add	srcaddr, 0x10, srcaddr
	ldda    [srcaddr] 0x22,  %l6
	stxa    %l0,    [dstaddr] 0x22
	add	dstaddr, 0x8, dstaddr
	stxa    %l1,    [dstaddr] 0x22
	add	dstaddr, 0x8, dstaddr
	stxa    %l2,    [dstaddr] 0x22
	add	dstaddr, 0x8, dstaddr
	stxa    %l3,    [dstaddr] 0x22
	add	dstaddr, 0x8, dstaddr
	stxa    %l4,    [dstaddr] 0x22
	add	dstaddr, 0x8, dstaddr
	stxa    %l5,    [dstaddr] 0x22
	add	dstaddr, 0x8, dstaddr
	stxa    %l6,    [dstaddr] 0x22
	add	dstaddr, 0x8, dstaddr
	stxa    %l7,    [dstaddr] 0x22

trap:
	ta GOOD_TRAP
user_text_end:

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

.global in_stream
.global out_stream
.data
.align 0x1000
user_data_start:
in_stream:
	.word 0xb1bababa
	.word 0xb2bababa
	.word 0xb3bababa
	.word 0xb4bababa
	.word 0xb5bababa
	.word 0xb6bababa
	.word 0xb7bababa
	.word 0xb8bababa
	.word 0xb9bababa
	.word 0xbabababa
	.word 0xbbbababa
	.word 0xbcbababa
	.word 0xbdbababa
	.word 0xbebababa
	.word 0xbfbababa
	.skip 512	

! offset the out_stream block
.align 0x1000
out_stream:
	.skip 1024	

user_data_end:
