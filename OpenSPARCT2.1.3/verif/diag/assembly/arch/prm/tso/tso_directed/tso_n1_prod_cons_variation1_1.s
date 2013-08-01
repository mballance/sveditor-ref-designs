/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tso_n1_prod_cons_variation1_1.s
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
#define addrA_reg  		%l0
#define addrB_reg		%l1
#define result0_reg	  	%l2
#define result1_reg	  	%l3
#define ready0_reg	  	%l4
#define ready1_reg	  	%l5
#define finish_reg	  	%l6

#define global_cnt_reg	  	%i0

#define tmp0	  		%o2
#define tmp1	  		%o3
#define test_reg		%o4
#define test2_reg		%o5

#define tmp1			%i1
#define tmp2			%i2
#define tmp3			%i3

#define ITERATIONS 	  	0x2

#include "hboot.s"

.global main

main:

	setx    addrA,		tmp0, addrA_reg
	setx    addrB, 		tmp0, addrB_reg
	setx    result0, 	tmp0, result0_reg
	setx    result1, 	tmp0, result1_reg
	setx    ready0, 	tmp0, ready0_reg
	setx    ready1, 	tmp0, ready1_reg
	setx    finish_area,	tmp0, finish_reg

        set     ITERATIONS,	global_cnt_reg 			! 

th_fork(th_main,tmp1)

!=====================================================
th_main_0:
	mov	0x1,	tmp3
loop00:
	st	tmp3, [addrA_reg]		! store non-zero to A

loop01:						! wait for A to be zero again.
        ld    	[finish_reg], test_reg		! check for end
	sub	test_reg, 0x55, tmp2
	brz	tmp2, good_end
	nop

        ld    	[addrA_reg], test_reg
	brnz	test_reg, loop01
	nop

	nop; nop; nop; nop;
	nop; nop; nop; nop;
	nop; nop; nop; nop;
	nop; nop; nop; nop;

	ba	loop00				! loop
	nop

!=========================================================
th_main_1:

	mov	0x2,	tmp3
loop10:
	st	tmp3, [addrB_reg]		! store non-zero to B
loop11:						! wait for B to be zero again
        ld    	[finish_reg], test_reg		! check for an end
	sub	test_reg, 0x55, tmp2
	brz	tmp2, good_end
	nop

        ld    	[addrB_reg], test_reg
	brnz	test_reg, loop11
	nop

	ba	loop10				! loop
	nop

!=========================================================
th_main_2:

	ba	good_end			! noise
	nop

!=========================================================
th_main_3:

loop30:

loop31:
        ld    	[finish_reg], test_reg		! check for an end
	sub	test_reg, 0x55, tmp2
	brz	tmp2, good_end
	nop

        ld    	[addrB_reg], test_reg		! load B until set
	brz	test_reg, loop31
	nop

        ld    	[addrA_reg], test_reg		! read A and store it
	st	test_reg,    [result0_reg]	! to result place.

	mov	0x1, test_reg
	st	test_reg,    [ready0_reg]	! flag ready

loop32:
        ld    	[finish_reg], test_reg		! check for an end
	sub	test_reg, 0x55, tmp2
	brz	tmp2, good_end
	nop

        ld    	[ready0_reg], test_reg		! wait for ready to be cleared
	brnz	test_reg, loop32
	nop

	ba	loop30				! loop
	nop

!=========================================================
th_main_4:

loop40:

loop41:
        ld    	[finish_reg], test_reg		! check for an end
	sub	test_reg, 0x55, tmp2
	brz	tmp2, good_end
	nop

        ld    	[addrA_reg], test_reg		! load A until set
	brz	test_reg, loop41
	nop

        ld    	[addrB_reg], test_reg		! load B and store it
	st	test_reg,    [result1_reg]	! to result place

	mov	0x1, test_reg
	st	test_reg,    [ready1_reg]	! flag ready

loop42:
        ld    	[finish_reg], test_reg		! check for an end
	sub	test_reg, 0x55, tmp2
	brz	tmp2, good_end
	nop

        ld    	[ready1_reg], test_reg		! wait for ready to be cleared
	brnz	test_reg, loop42
	nop

	ba	loop40				! loop
	nop


!=========================================================
th_main_5:

loop50:
        ld    	[ready0_reg], test_reg		! wait for ready0
	brz	test_reg, loop50
	nop

loop51:
        ld    	[ready1_reg], test_reg		! wait for ready1
	brz	test_reg, loop51
	nop

	ld	[result0_reg], test_reg		! load the 2 results
	ld	[result1_reg], test2_reg
	brnz	test_reg, loop5_cont		! if non-zero-> new-> OK
	nop
	brz	test2_reg, bad_end		! if both 0 -> BAD!!!
	nop

loop5_cont:

	st	%g0,   	[result0_reg]		! clear results
	st	%g0,   	[result1_reg]
	st	%g0,   	[addrA_reg]		! clear A and B
	st	%g0,   	[addrB_reg]
	st	%g0,    [ready0_reg]		! clear the ready
	st	%g0,    [ready1_reg]

	mov	0x0, tmp3			! check for end of test
	deccc	global_cnt_reg		
        move	%icc, 0x55, tmp3
	st	tmp3,    [finish_reg]		! and flag it
	brz	global_cnt_reg, good_end
	nop

	ba	loop50
	nop

!=========================================================

th_main_6:
	ba	good_end
	nop

th_main_7:
	ba	good_end
	nop

!====================================================================================
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

.global addrA
addrA:
	.word 0x0
	.skip 0x100
.global result0
result0:
	.word	0x0
.global ready0
ready0:
	.word	0x0

SECTION .MY_DATA1  TEXT_VA=0xf1110000, DATA_VA=0xd1110000
attr_data {
        Name = .MY_DATA1,
        VA= 0x0d1110000,
        RA= 0x1d1110000,
        PA= ra2pa(0x1d1110000,0),
part_0_ctx_nonzero_tsb_config_1,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
        }

attr_text {
        Name = .MY_DATA1,
        VA= 0x0f1110000,
        RA= 0x1f1110000,
        PA= ra2pa(0x1f1110000,0),
part_0_ctx_nonzero_tsb_config_1,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
        }

	.data
.global addrB
addrB:
	.word	0x0
	.skip 0x100
.global result1
result1:
	.word	0x0
.global ready1
ready1:
	.word	0x0
	
.global finish_area
finish_area:
	.word	0x0
.end
