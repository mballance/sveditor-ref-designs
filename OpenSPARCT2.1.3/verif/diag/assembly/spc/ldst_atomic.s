/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ldst_atomic.s
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
#include "defines.h"
#include "old_boot.s"
.global main

.text

main:
	setx	bank0_data,  %l0, %l1	
	set	0xff,	%l3
	set	0x55,	%l4
	set	0xbb,	%l5
	set	0xcc,	%l6
	set	0xdd,	%l7

	ld	[%l1],	%l2
	add	%l2,	0xff,	%l2
	st	%l2,	[%l1]
	st	%l3,	[%l1+0x80]
	st	%l4,	[%l1+0x100]
	st	%l5,	[%l1+0x180]

	ld	[%l1],	%l2
	ld	[%l1+0x80],	%l2
	ld	[%l1+0x100],	%l2
	ld	[%l1+0x180],	%l2

tc_0:
	/*
	 *******************************
	 * load miss, atomic, ld again
	 *******************************
 	 */
	/* swap */
	setx	bank1_data, %l0, %l1
	ld	[%l1],	%l2
	swap	[%l1],	%l3
	ld	[%l1],	%l2	

tc_my:
	/* CASA */
	setx	bank2_data, %l0, %l1
	ld	[%l1],	%l2
	casa	[%l1] 0x80, %l4, %l7			
	ld	[%l1],	%l2

	/* CASXA */
	setx	bank3_data, %l0, %l1
	ld	[%l1],	%l2
	casxa	[%l1] 0x80, %l5, %l7			
	ld	[%l1],	%l2

	/* LDSTUB */
	setx	bank4_data, %l0, %l1
	ldub	[%l1],	%l2
	ldstub	[%l1],	%l3 
	ldub	[%l1],	%l2
tc_1:
	/*
	 *************************************
	 * store miss in L1 D$ , atomic, ld 
	 *************************************
 	 */

	/* swap */
	setx	bank1_data, %l0, %l1
	add	%l1,	0x10,	%l1
	set	0xaabbccdd,	%l2
	set	0xaabbccdd,	%l3
	st	%l2,	[%l1]
	swap	[%l1],	%l3
	ld	[%l1],	%l4	

	/* CASA */
	setx	bank2_data, %l0, %l1
	add	%l1,	0x10,	%l1
	set	0xaabbccdd,	%l2
	set	0xaabbccdd,	%l3
	st	%l2,	[%l1]
	casa	[%l1] 0x80, %l3, %l7			
	ld	[%l1],	%l4	

	/* CASXA */
	setx	bank3_data, %l0, %l1
	add	%l1,	0x10,	%l1
	set	0xaabbccdd,	%l2
	set	0xaabbccdd,	%l3
	stx	%l2,	[%l1]
	casxa	[%l1] 0x80, %l5, %l7			
	ldx	[%l1],	%l4

	/* LDSTUB */
	setx	bank4_data, %l0, %l1
	add	%l1,	0x10,	%l1
	set	0xaabbccdd,	%l2
	set	0xaabbccdd,	%l3
	stub	%l2,	[%l1]
	ldstub	[%l1],	%l4
	ldx	[%l1],	%l4

tc_2:
	/*
	 *************************************
	 * store hit in L1 D$ , atomic, ld 
	 *************************************
 	 */
	/* swap */
	setx	bank1_data, %l0, %l1
	add	%l1,	0x10,	%l1
	set	0xaabbccdd,	%l2
	set	0xaabbccdd,	%l3
	ld	[%l1],	%l4
	st	%l2,	[%l1]
	swap	[%l1],	%l3
	ld	[%l1],	%l4	

	/* CASA */
	setx	bank2_data, %l0, %l1
	add	%l1,	0x10,	%l1
	set	0xaabbccdd,	%l2
	set	0xaabbccdd,	%l3
	ld	[%l1],	%l4
	st	%l2,	[%l1]
	casa	[%l1] 0x80, %l3, %l7			
	ld	[%l1],	%l4	

	/* CASXA */
	setx	bank3_data, %l0, %l1
	add	%l1,	0x10,	%l1
	set	0xaabbccdd,	%l2
	set	0xaabbccdd,	%l3
	ldx	[%l1],	%l4
	stx	%l2,	[%l1]
	casxa	[%l1] 0x80, %l5, %l7			
	ldx	[%l1],	%l4

	/* LDSTUB */
	setx	bank4_data, %l0, %l1
	add	%l1,	0x10,	%l1
	set	0xaabbccdd,	%l2
	set	0xaabbccdd,	%l3
	ldub	[%l1],	%l4
	stub	%l2,	[%l1]
	ldstub	[%l1],	%l4
	ld	[%l1],	%l5

tc_3:
	/*
	 *************************************
	 * store hit in L1 D$ , atomic raws 
	 * against the store
	 *************************************
 	 */
	/* swap */
	setx	bank1_data, %l0, %l1
	add	%l1,	0x10,	%l1
	set	0xaabbccdd,	%l2
	set	0xaabbccdd,	%l3
	ld	[%l1],	%l4
	stub	%l2,	[%l1]
	swap	[%l1],	%l3
	ld	[%l1],	%l4	!! ld will by-pass ?

	/* CASA */
	setx	bank2_data, %l0, %l1
	add	%l1,	0x10,	%l1
	set	0xaabbccdd,	%l2
	set	0xaabbccdd,	%l3
	ld	[%l1],	%l4
	stuh	%l2,	[%l1]
	casa	[%l1] 0x80, %l3, %l7			
	ld	[%l1],	%l4	

	setx	bank2_data, %l0, %l1
	add	%l1,	0x20,	%l1
	set	0xaabbccdd,	%l2
	set	0xaabbccdd,	%l3
	ld	[%l1],	%l4
	stuh	%l2,	[%l1]
	casa	[%l1] 0x80, %l3, %l7			
	ldx	[%l1],	%l4	!!! ld will raw check ?	

	/* CASXA */
	setx	bank3_data, %l0, %l1
	add	%l1,	0x10,	%l1
	set	0xaabbccdd,	%l2
	set	0xaabbccdd,	%l3
	ldx	[%l1],	%l4
	st	%l2,	[%l1]
	casxa	[%l1] 0x80, %l5, %l7			
	ldx	[%l1],	%l4	!! ld will by-pass ?

	setx	bank3_data, %l0, %l1
	add	%l1,	0x20,	%l1
	set	0xaabbccdd,	%l2
	set	0xaabbccdd,	%l3
	ldx	[%l1],	%l4
	st	%l2,	[%l1]
	casxa	[%l1] 0x80, %l5, %l7			
	ld	[%l1],	%l4	!! ld will by-pass ?

	/* LDSTUB */
	setx	bank4_data, %l0, %l1
	add	%l1,	0x20,	%l1
	set	0xaabbccdd,	%l2
	set	0xaabbccdd,	%l3
	ldub	[%l1],	%l4
	stub	%l2,	[%l1]
	ldstub	[%l1],	%l4
	ldx	[%l1],	%l4

tc_4:
	/*
	 *****************************************************
	 * atomic page miss on the last word/byte of the pg
	 *****************************************************
	 */
	set	0x0,	%l0
	set	0x55aabb55,	%l3
	set	0x55aabb55,	%l4
	setx	atmpg_1_end,	%l0,	%l1
	add	%l1,	0x1c,	%l1	
	swap 	[%l1],	%l2
	stub	%l3,	[%l1]	
	ld	[%l1],	%l5

	set	0x0,	%l0
	set	0x55aabb55,	%l3
	set	0x55aabb55,	%l4
	setx	atmpg_2_end,	%l0,	%l1
	add	%l1,	0x1c,	%l1	
	casa    [%l1] 0x80, %l4, %l7
	stub	%l3,	[%l1]	
	ld	[%l1],	%l5

/*
 ********************************
 *      Diag PASSED		*
 ********************************
 */
diag_pass:
        set     0xaaddcafe,     %l0
        EXIT_GOOD
        nop

.data

bank0_data:	.word	0xffeebb00
		.word	0xffeebb01
		.word	0x55667788
		.word	0x99aabbcc
                .word 	0xeeedf919
                .word 	0x2d9e6fb3
                .word 	0x73401a3a
                .word 	0xe3aedd4b
.align	128

bank1_data:	.word 0x43c9dc8b
                .word 0xe7fa0cbc
                .word 0x4870ab07
                .word 0x7b4a32f6
                .word 0x4552fe25
                .word 0xbd84b3a7
                .word 0xccb898f3
                .word 0x8ccfc422
.align	128

bank2_data:	.word 0xbdd8cb4b
                .word 0x2d68ac94
                .word 0x3b530bb2
                .word 0x2dba3f10
                .word 0xc1136b8d
                .word 0x5db2e249
                .word 0xc9d34e57
                .word 0x15802f15
.align	128

bank3_data:	.word 0xbdd8cb4b
                .word 0x2d68ac94
                .word 0x3b530bb2
                .word 0x2dba3f10
                .word 0xc1136b8d
                .word 0x5db2e249
                .word 0xc9d34e57
                .word 0x15802f15
.align	128

bank4_data:	.word	0xaa5555aa
		.word	0xeeffbbcc
		.word	0x55667788
		.word	0x99aabbcc
                .word 	0xeeedf919
                .word 	0x2d9e6fb3
                .word 	0x73401a3a
                .word 	0xe3aedd4b
.align	128

bank5_data:	.word 0x43c9dc8b
                .word 0xabd03ae3
                .word 0x8fa4b4a7
                .word 0x89d80b15
                .word 0xd6be7dbf
                .word 0xbe02a58f
                .word 0x3752b2e5
                .word 0x2b447b56
.align	128

bank6_data:	.word 0xbdd8cb4b
                .word 0x863abc4e
                .word 0xba7c225
                .word 0xc9d532ab
                .word 0x384550fa
                .word 0x29f7b86
                .word 0xd0e9f30c
                .word 0x6feb38ef
.align	128

bank7_data:	.word 0xbdd8cb4b
                .word 0x65b5fdc5
                .word 0x8ea9f93e
                .word 0xbac7d47
                .word 0x35426b1b
                .word 0xd03a1fc8
                .word 0x16823e2e
                .word 0x7b8f41d2
.align	8192

atmpg_1:
                .word 0x1334bbed
                .word 0x448801f1
                .word 0x164214e7
                .word 0x79ba6a8d
                .word 0xdfedd60a
                .word 0x946c08d6
                .word 0x70bef44e
                .word 0x4348f63c
                .word 0x9ed8066e
                .word 0x8b3ae9b
                .word 0x50001b96
                .word 0x5924dc5b
                .word 0xe9a19b46
                .word 0xb6bb1463
                .word 0x656ed444
                .word 0xdbb295b2
.align	4096
.align	2048
.align	1024
.align	512
.align	256
.align	128
.align	64
.align	32

atmpg_1_end:
                .word 0x98033575
                .word 0xde88cfe3
                .word 0x2385df14
                .word 0xee38e34e
                .word 0xfb1b1213
                .word 0x70e1fe36
                .word 0x33c7337c
                .word 0xaa928ec1

atmpg_2:
                .word 0xd0abf053
                .word 0xf2618e65
                .word 0xac87049c
                .word 0x7328a59e
                .word 0xdedff1a2
                .word 0x39ced123
                .word 0xb188c1d4
                .word 0x56a89116
                .word 0xa20c49e7
                .word 0x74e02e90
                .word 0x44fa83c5
                .word 0xcbb6970e
                .word 0x20b346b4
                .word 0xdb2b856d
                .word 0x32894c3a
                .word 0xa96c255b

.align	4096
.align	2048
.align	1024
.align	512
.align	256
.align	128
.align	64
.align	32

atmpg_2_end:
                .word 0xa8b5b209
                .word 0x2e2ba001
                .word 0x736d50b3
                .word 0xfc4629f5
                .word 0x71a1baf8
                .word 0x8b80e8e5
                .word 0xeedcf402
                .word 0x2cac0590
	
atmpg_3:
                .word 0xdf483230
                .word 0x7ec0269d
                .word 0xf6ac51cc
                .word 0x4090e7f0
                .word 0xa55687a3
                .word 0x6237afe8
                .word 0x76618a03
                .word 0xc725e21e
                .word 0xdb44be77
                .word 0x99532f3a
                .word 0x2db3746a
                .word 0x6d791b0b
                .word 0x56421d42
                .word 0x8695bed5
                .word 0xb7075ebd
                .word 0x5f6078f7

.align	4096
.align	2048
.align	1024
.align	512
.align	256
.align	128
.align	64
.align	32

atmpg_3_end:
                .word 0x9640dd17
                .word 0xc013728d
                .word 0xd52d71fd
                .word 0x2db3c639
                .word 0xe876766
                .word 0x1d00b0e6
                .word 0xbfb05db3
                .word 0xa1285c1a
	
atmpg_4:
                .word 0xab8d9c9
                .word 0x18310dd5
                .word 0xd8dc1075
                .word 0x30a4da96
                .word 0x4e6a194f
                .word 0x67a7bad6
                .word 0x8b34188a
                .word 0xaf4db662
                .word 0x5d98c33f
                .word 0x4c71dc04
                .word 0x3ea4122f
                .word 0x96e25bdf
                .word 0x7e63881c
                .word 0x9b44c8d1
                .word 0x1555c89f
                .word 0x6b85c0b1

.align	4096
.align	2048
.align	1024
.align	512
.align	256
.align	128
.align	64
.align	32

atmpg_4_end:
                .word 0xa6f8c1c2
                .word 0xc125a4bd
                .word 0x7f492240
                .word 0xba91b175
                .word 0xc4d56423
                .word 0x466a39ef
                .word 0x68eb5120
                .word 0xca217bda
	
.end
