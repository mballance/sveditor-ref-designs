/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tso_n1_prod_cons5.s
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
#define spinlock_addr_reg  		%o0
#define database_addr_reg  		%i0
#define aliased_base_reg  		%o2
#define my_id_reg	  		%o3
#define test_reg	  		%o4
#define global_cnt_reg	  		%o5
#define tmp1	  			%l1
#define tmp2	  			%i1
#define tmp3	  			%i2

#define ITERATIONS 	  		0x10

#include "boot.s"

.global main
main:

	setx    database_address,   	tmp1, 	database_addr_reg
	add 	database_addr_reg,  	0x40, 	spinlock_addr_reg
	setx 	aliased_area, 		tmp1, 	aliased_base_reg
        set     ITERATIONS,		global_cnt_reg

th_fork(th_main,%l0)

! Some of the threads are producers, some are consumers
! A pair of producer and consumer has the same ID.
!=====================================================
th_main_0:
        add     %g0, 0x8, my_id_reg		! this is my ID address
	mov 	my_id_reg, tmp2 
	ba	producer
	nop

th_main_1:
	ta T_GOOD_TRAP

th_main_2:
	ta T_GOOD_TRAP

th_main_3:
	ta T_GOOD_TRAP

th_main_4:
        add     %g0, 0x8, my_id_reg
	mov 	my_id_reg, tmp2 
	ba	consumer
	nop

th_main_5:
	ta T_GOOD_TRAP

th_main_6:
	ta T_GOOD_TRAP

th_main_7:
	ta T_GOOD_TRAP

!======================================================
producer:
        ld [spinlock_addr_reg + my_id_reg], test_reg ! try to acquire lock
        tst test_reg                       	     ! did we get it?
        be  producer_gotlock
        nop
	ba producer
	nop

!======================================================
consumer:
        ld [spinlock_addr_reg + my_id_reg], test_reg	! try to acquire lock
	ld [database_addr_reg + my_id_reg], tmp3  	! load data
	sub test_reg, 0x55, tmp1			! code to end the test
	tst	tmp1	
	be	good_end				! end the test
	nop
	sub	test_reg, 0x1, tmp1			! check for new data
	brz	tmp1, consumer_gotlock
	nop
	ba	consumer
	nop

!=======================================================
producer_gotlock:

! kick out the line from L2 (if L2 and L1 direct mapped)
	ld	[aliased_base_reg], tmp1
	mov	0x1, tmp1				! prepare flag ready
	st 	tmp2, [database_addr_reg + my_id_reg] 	! store data
        st      tmp1, [spinlock_addr_reg + my_id_reg]   ! store flag ready
	inc	tmp2
	deccc	global_cnt_reg
        be	cleanup_and_finish
	nop
	ba	producer
	nop

cleanup_and_finish:
	add	%g0, 0x55 , tmp1
        st      tmp1, [spinlock_addr_reg + my_id_reg]    ! finish the test
	ba good_end
	nop

!========================================================
consumer_gotlock:

	subcc 	tmp3, tmp2, tmp3
	bne	bad_end
	nop
	inc	tmp2

	st 	%g0, [database_addr_reg + my_id_reg]	! clean data
        st      %g0, [spinlock_addr_reg + my_id_reg]	! consumer ready
	ba	consumer
	nop

good_end:
        ta      T_GOOD_TRAP
bad_end:
        ta      T_BAD_TRAP

!==========================

SECTION .MY_DATA0  DATA_VA=0xd0100000
attr_data {
        Name = .MY_DATA0,
        VA= 0x0d0100000
        RA= 0x1d0100000
        PA= ra2pa(0x1d0100000,0),
        part_0_ctx_nonzero_tsb_config_0,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

	.data

.global database_address
.align 0x100
database_address:
	.skip 0x40
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.skip 1000


SECTION .MY_DATA1  DATA_VA=0xd1110000
attr_data {
        Name = .MY_DATA1,
        VA= 0x0d1110000,
        RA= 0x1d1110000,
        PA= ra2pa(0x1d1110000,0),
        part_0_ctx_nonzero_tsb_config_1,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

	.data
.global aliased_area
.align 0x100
aliased_area:
	.word	0xbeef
	.skip 0x1000
	.word	0xbeef
	
.end
