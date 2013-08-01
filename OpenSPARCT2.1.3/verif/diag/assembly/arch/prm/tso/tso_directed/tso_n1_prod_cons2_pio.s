/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tso_n1_prod_cons2_pio.s
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
#define spinlock_addr_reg  		%o0
#define data_base_reg	  		%o1
#define my_id_reg	  		%o3
#define test_reg	  		%o4
#define global_cnt_reg	  		%o5
#define tmp1	  			%l1

#define ITERATIONS 	  		0x2

#include "hboot.s"

.global main

main:
ta T_CHANGE_HPRIV
nop
	wr      %g0, 0x4, %fprs         /* make sure fef is 1 */
	setx    spinlock_address, %l0, spinlock_addr_reg	! spinlock address
        set     ITERATIONS,	global_cnt_reg 			! 

th_fork(th_main,%l0)

!Some of the threads are producers, some are consumers
! A pair of producer and consumer has the same ID.
!=====================================================
th_main_0:
        add     %g0, 0x8, my_id_reg			! this is my ID address
	ba	producer
	nop

th_main_1:
        add     %g0, 0x10, my_id_reg
	ba	consumer
	nop

th_main_2:
        add     %g0, 0x18, my_id_reg
	ba	consumer
	nop

th_main_3:
        add     %g0, 0x20, my_id_reg
	ba	consumer
	nop

th_main_4:
        add     %g0, 0x28, my_id_reg
	ba	consumer
	nop

th_main_5:
        add     %g0, 0x30, my_id_reg
	ba	consumer
	nop

th_main_6:
        add     %g0, 0x38, my_id_reg
	ba	consumer
	nop

th_main_7:
        add     %g0, 0x40, my_id_reg
	ba	consumer
	nop

!====================================================================================
producer:
wait1:
        ld    	[spinlock_addr_reg + 0x10], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait1
        nop
wait2:
        ld    	[spinlock_addr_reg + 0x18], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait2
        nop
wait3:
        ld    	[spinlock_addr_reg + 0x20], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait3
        nop
wait4:
        ld    	[spinlock_addr_reg + 0x28], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait4
        nop
wait5:
        ld    	[spinlock_addr_reg + 0x30], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait5
        nop
wait6:
        ld    	[spinlock_addr_reg + 0x38], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait6
        nop
wait7:
        ld    	[spinlock_addr_reg + 0x40], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait7
        nop
	ba	producer_gotlock
	nop

!====================================================================================
consumer:
        ld    	[spinlock_addr_reg + my_id_reg], test_reg	! try to acquire lock
	sub	test_reg, 0x55, %i1				! code to end the test
	tst	%i1	
	be	good_end					! end the test
	nop
	sub	test_reg, 0x1, %i1				! code for available data
	tst	%i1	
	be	check_consumer_type
	nop
	ba	consumer
	nop

check_consumer_type:
	andcc	my_id_reg, 0x8, %i1
	bne	consumer_gotlock2
	nop
	ba	consumer_gotlock
	nop


!====================================================================================
producer_gotlock:

	set 	0x60, %l0
	setx 	protected_area, tmp1, data_base_reg
producer_loop0:
	st 	%g0, [data_base_reg + my_id_reg] 	! cleanup
	add	data_base_reg, 0x40, data_base_reg 	! increment the address
	deccc	%l0
	bne 	producer_loop0				! repeat
	nop

	set 	0x60, %l0
	setx 	protected_area, tmp1, data_base_reg
producer_loop1:
	st 	my_id_reg, [data_base_reg + my_id_reg] 	! store my ID in there
	add	data_base_reg, 0x40, data_base_reg 	! increment the address
	deccc	%l0
	bne 	producer_loop1				! repeat
	nop

	deccc	global_cnt_reg
        be	cleanup_and_finish
	nop
	add	%g0, 1 , tmp1
        st      tmp1, [spinlock_addr_reg + 0x10]    ! data ready
        st      tmp1, [spinlock_addr_reg + 0x18]    ! data ready
        st      tmp1, [spinlock_addr_reg + 0x20]    ! data ready
        st      tmp1, [spinlock_addr_reg + 0x28]    ! data ready
        st      tmp1, [spinlock_addr_reg + 0x30]    ! data ready
        st      tmp1, [spinlock_addr_reg + 0x38]    ! data ready
        st      tmp1, [spinlock_addr_reg + 0x40]    ! data ready
	ba	producer
	nop

cleanup_and_finish:
	add	%g0, 0x55 , tmp1
        st      tmp1, [spinlock_addr_reg + 0x10]    ! data ready
        st      tmp1, [spinlock_addr_reg + 0x18]    ! data ready
        st      tmp1, [spinlock_addr_reg + 0x20]    ! data ready
        st      tmp1, [spinlock_addr_reg + 0x28]    ! data ready
        st      tmp1, [spinlock_addr_reg + 0x30]    ! data ready
        st      tmp1, [spinlock_addr_reg + 0x38]    ! data ready
        st      tmp1, [spinlock_addr_reg + 0x40]    ! data ready
	ba good_end
	nop

!====================================================================================
consumer_gotlock:
	set 	0x60, %l0
	setx 	protected_area, tmp1, data_base_reg
	mov 	0x8, %i1 
consumer_loop1:
	ld 	[data_base_reg + 0x8], %i2 		! load producer's ID  in there
	subcc 	%i2, %i1, %g0
	bne	bad_end
	nop
	add	data_base_reg, 0x40, data_base_reg 	! increment the address
	deccc	%l0
	bne 	consumer_loop1				! repeat
	nop

        st      %g0, [spinlock_addr_reg+ my_id_reg]	! consumer ready

	ba	consumer
	nop

consumer_gotlock2:
        set     0x60, %l0
        setx    protected_area, tmp1, data_base_reg
        mov     0x8, %i1
	st 	%i1, [data_base_reg + my_id_reg]  	! store my ID in there
        ld      [data_base_reg + my_id_reg], %f2   	! load producer's ID  in there
consumer_loop2:
        ld      [data_base_reg + 0x8], %f14         	! load producer's ID  in there
	fcmps 	%fcc0, %f2, %f14 			! should be my ID
	fbne	%fcc0, bad_end
	nop
        add     data_base_reg, 0x40, data_base_reg      ! increment the address
        deccc   %l0
        bne     consumer_loop2                          ! repeat
        nop

        st      %g0, [spinlock_addr_reg+ my_id_reg]     ! consumer ready

        ba      consumer
        nop

good_end:
        ta      T_GOOD_TRAP
bad_end:
        ta      T_BAD_TRAP

!==========================


SECTION .MY_DATA0  DATA_VA=0xd0100000
attr_data {
        Name = .MY_DATA0,
        VA= 0x0d0100000,
        RA=0xc000000000,
        PA=0xc000000000,
        part_0_ctx_nonzero_tsb_config_0,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

	.data

.global spinlock_address
spinlock_address:
	.skip 0x1000


SECTION .MY_DATA1  DATA_VA=0xd1110000
attr_data {
        Name = .MY_DATA1,
        VA= 0x0d1110000,
        RA=0xc200bee000,
        PA=0xc200bee000,
        part_0_ctx_nonzero_tsb_config_1,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

	.data
.global protected_area
protected_area:
	.word	0xbeef
	.skip 0x1000
	.word	0xbeef
.end

