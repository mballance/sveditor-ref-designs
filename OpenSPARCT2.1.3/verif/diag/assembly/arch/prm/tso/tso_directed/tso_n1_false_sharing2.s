/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tso_n1_false_sharing2.s
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
#define sh_area1_reg	  		%o1
#define to_reg	  			%o2
#define my_id_reg	  		%o3
#define test_reg	  		%o4
#define global_cnt_reg	  		%o5
#define sh_area0_reg	  		%o6

#define ITERATIONS 	  		0x10

#include "hboot.s"

.global main

main:

	wr      %g0, 0x4, %fprs        		! make sure fef is 1  for FP
        set     ITERATIONS, global_cnt_reg  

th_fork(th_main,%l0)

th_main_0:
        add     %g0, 0x00, my_id_reg		! this is my ID address
	ba	go
	nop

th_main_1:
        add     %g0, 0x04, my_id_reg
	ba	go
	nop


th_main_2:
        add     %g0, 0x08, my_id_reg
	ba	go
	nop

th_main_3:
        add     %g0, 0x0c, my_id_reg
	ba	go
	nop

th_main_4:
        add     %g0, 0x10, my_id_reg
	ba	go
	nop

th_main_5:
        add     %g0, 0x14, my_id_reg
	ba	go
	nop

th_main_6:
        add     %g0, 0x18, my_id_reg
	ba	go
	nop

th_main_7:
        add     %g0, 0x1c, my_id_reg
	ba	go
	nop

go:
	setx    sh_area1,	%l0, sh_area1_reg	! shared area1
	setx    sh_area0,	%l0, sh_area0_reg	! shared area0
	add	my_id_reg, global_cnt_reg, %g1
	st 	%g1, 	   [sh_area0_reg]		! store 1
	add	my_id_reg, %g1, %g1
	st 	%g1, 	   [sh_area0_reg  +8]		! store 2
	ld 	[sh_area0_reg], %f14			! read 1
	ld 	[sh_area0_reg+8], %f16			! read 2

	set 	0x40, %l0
loop1:
	st 	%f14, [sh_area1_reg+my_id_reg]		! store 
	add	sh_area1_reg, 0x20, sh_area1_reg 	! increment the address
	st 	%f16, [sh_area1_reg+my_id_reg]		! store 
	add	sh_area1_reg, 0x20, sh_area1_reg 	! increment the address
	deccc	%l0
	bne 	loop1					! repeat
	nop

	set 	0x40, %l0
loop2:	
	sub	sh_area1_reg, 0x20, sh_area1_reg 
	ld 	[my_id_reg+sh_area1_reg], %f0		! read the ID
	fcmps 	%fcc0, %f0, %f16 			! should be my ID
	fbne	%fcc0, bad_end
	nop
	sub	sh_area1_reg, 0x20, sh_area1_reg 
	ld 	[my_id_reg+sh_area1_reg], %f0		! read the ID
	fcmps 	%fcc0, %f0, %f14 			! should be my ID
	fbne	%fcc0, bad_end
	nop
	deccc	%l0					! repeat
	bne 	loop2
	nop

check_done:
	deccc	global_cnt_reg
        be	good_end
	nop
	ba	go
	nop

good_end:
        ta      T_GOOD_TRAP
bad_end:
        ta      T_BAD_TRAP

!==========================


SECTION .MY_DATA0  TEXT_VA=0xf0100000, DATA_VA=0xd0100000
attr_data {
        Name = .MY_DATA0,
        VA= 0x0d0100000
        RA= 0x1d0100000
        PA= ra2pa(0x1d0100000,0),
        part_0_ctx_nonzero_tsb_config_0,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
        }

attr_text {
        Name = .MY_DATA0,
        VA= 0x0f0100000
        RA= 0x1f0100000
        PA= ra2pa(0x1f0100000,0),
        part_0_ctx_nonzero_tsb_config_0,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
        }

	.data
.global sh_area1
.global sh_area0
sh_area0:
	.word  0x0
	.align 0x40
sh_area1:
	.word	0x1
	.skip 0x1000
	.word	0xbeef
	
.end
