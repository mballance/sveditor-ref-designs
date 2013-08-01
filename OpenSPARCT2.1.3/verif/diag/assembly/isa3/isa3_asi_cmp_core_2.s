/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_asi_cmp_core_2.s
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
#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO
!#include "nmacros.h"
    
#include "hboot.s"

! can set this to 1 to stop test after thread 0 & 1 have 
! parked/unparked all threads.
! #define STOP_AFTER

#define THREAD_COUNT %l1
! a threads unique addr for incrementing a counter.
#define MY_ADDR %l7
! addr that stores which thread is the master thread.    
#define COMN_ADDR %l6
#define COMN_ADDR2 %l5
#define MY_ID %o1
#define MASK_OUT_SELF %l4
! holds user_data_start addr    
#define USER_DATA %o3
! what threads are expected to be active    
#define EXPECT_ACTIVE %o4
#define LAST_THREAD %o5

#define ALL1S  0xffffffffffffffff
        
/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:

 	!# Input registers
    set	0,	%i0
  	set	0,	%i1
  	set	0,	%i2
  	set	0,	%i3
  	set	0,	%i4
  	set	0,	%i5
  	set	0,	%i6
  	set	0,	%i7
	!# Local registers
  	set	0,	%l0
  	set	0,	%l1
  	set	0,	%l2
  	set	0,	%l3
 	set	0,	%l4
 	set	0,	%l5
 	set	0,	%l6
    set	0,	%l7
 	!# Output registers
  	set	0,	%o0
  	set	0,  %o1
  	set	0,	%o2
  	set	0,	%o3
  	set	0,	%o4
  	set	0,  %o5
  	set	0,	%o6
  	set	0,  %o7
    
 	ta	T_CHANGE_HPRIV  ! run in Hpriv mode
 	nop

 	rdth_id ! get thread ID in %o1
	
    ! 9 64 bit memory locations. last is shared, init all to 0.
    ! offset 0 = thread 0 counter area
    ! ...
    ! offset 8 = common area that stores which thread is the master thread.
    
 	!umul	MY_ID,  8, MY_ADDR       ! per thread offset
    sllx    MY_ID, 6, MY_ADDR       ! per thread offset, ID selects bank
 	setx	user_data_start, %g1, USER_DATA ! data area base
 	add 	MY_ADDR,  USER_DATA ,  MY_ADDR   ! per thread address ('my' address)

    add     %g2,    0x40,   COMN_ADDR ! common address
    add     COMN_ADDR, 0x8, COMN_ADDR2  ! common address 2

    ! what threads are expected to be active
    wr      %g0,    0x41,   %asi
    ldxa    [%g0 + ASI_CMP_CORE_ENABLED] %asi,    EXPECT_ACTIVE

    ! what thread will be the last thread
    mov     0,  LAST_THREAD  ! init
    mov     EXPECT_ACTIVE,  %g1 ! thread enabled mask
calc_last_thread:   
    srlx    %g1,    1,  %g1
    cmp     %g1,    %g0
    bne,a   calc_last_thread
    inc     LAST_THREAD

    mov     LAST_THREAD,    THREAD_COUNT
    inc     THREAD_COUNT
    
    ba      thread_x ! all threads do the same
    nop
    
        
	EXIT_BAD

	
    
!
! Thread Start
!
thread_x:
	
    wr      %g0,    ASI_CMP_CORE,   %asi

    
    ! signal that thread has gotten here (started).
    mov     0xff,   %g2
    stb     %g2,    [COMN_ADDR2 + MY_ID]    

    ! am I the master thread?
    ldx     [COMN_ADDR],  %g2
    cmp     %g2,    MY_ID
    bne     not_master
    nop

    ! master waits for other threads to have started.
master_waiting: 
    ldx     [COMN_ADDR2], %g2
    cmp     %g2,    ALL1S
    bne     master_waiting
    nop
    
    ! yes, skip first loop and control the parking instead
    call    park_control
    nop
    nop
    ! If we were just master, goto pass_control
    ba      pass_control   !call will ret here
    nop

not_master:    
    ! not master, then loop doing visible busy work, 
    ! waiting to become master on return
    call    counter1  ! %o7
    nop
	nop
    
    ! now we are master. next, pass control
    call    park_control
    nop
	nop

pass_control:   
    ! pass control to next thread
    add     MY_ID,  1,  %g2
    stx     %g2,    [COMN_ADDR]
	
    ! now we do second loop,
    ! waiting to exit
    call    counter2  ! %o7
    nop
    nop
    
test_passed:
	EXIT_GOOD

thread_not_parked:
    nop
thread_not_running:
    nop
bad_reg_value:
    nop
test_failed:
    nop
    
    EXIT_BAD



    
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!  subroutines
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    
    
! make sure all other threads are spinning counters.
! park all other threads.
! make sure all other threads are NOT spinning counters.
! UN park all other threads.
! make sure all other threads are spinning counters.
! return.
! CHECK FOR ERRORS!
park_control:
    ! save return address, nested calls
    mov     %o7,    %i0

    ! make a mask, the only 0 is for self
    sub     %g0,    1,      %g1
    mov     1,      MASK_OUT_SELF 
    sllx    MASK_OUT_SELF,    MY_ID,  MASK_OUT_SELF
    xor     MASK_OUT_SELF,    %g1,    MASK_OUT_SELF ! the only 0 is for me

    ! make sure all other threads are spinning counters
    call    run_check ! changes %o7
    nop
    nop
        	
return_from_run_check:         
    ! park all other threads except self
    stxa    MASK_OUT_SELF,    [%g0 + ASI_CMP_CORE_RUNNING_W1C] %asi
    ! check reg
    ldxa    [%g0 + ASI_CMP_CORE_RUNNING_RW] %asi,    %l0
    xor     %l0,    ALL1S,    %l0
    cmp     %l0,    MASK_OUT_SELF
    bne     bad_reg_value
    mov     %g0,  %l0
    
  
    ! make sure all other threads are NOT spinning counters
    call    park_check ! changes %o7
    nop
    nop
	
return_from_park_check:     
    ! UN park all other threads
    stxa    MASK_OUT_SELF,    [%g0 + ASI_CMP_CORE_RUNNING_W1S] %asi
    ! checks reg
    ldxa    [%g0 + ASI_CMP_CORE_RUNNING_RW] %asi,    %l0
    cmp     %l0,    EXPECT_ACTIVE
    bne     bad_reg_value
    mov     %g0,  %l0
    
    ! make sure all other threads are spinning counters
    call    run_check ! changes %o7
    nop
    
    ! restore original return address
    mov     %i0,    %o7    
    retl ! to %o7
    nop
! ---

    
! confirm all threads are running/counting. (except for myself)
! loop for each thread.
run_check:
    ! save return address, nested calls
    mov     %o7,    %i1
    mov     LAST_THREAD,      %g4

loop_rc: 
	! skip self
    cmp     MY_ID,  %g4
    beq     next_rc
    nop    

    !umul	%g4,    0x8,  %g5               ! g4=tid, offset
    sllx    %g4, 6, %g5           ! move tid up to bank select position
    
    !read counter location
    ldx     [USER_DATA + %g5],   %g6

    call    delay
    nop
delay_rtn1: 
    !read counter location
    ldx     [USER_DATA + %g5],   %g7
    
    !has it incremented?
    cmp     %g6,    %g7
    beq     thread_not_running
    nop
    
next_rc:   
    deccc   %g4
    bpos    loop_rc
    nop

    ! check ASI_CORE_RUNNING_STATUS, all active
    ldxa    [%g0 + ASI_CMP_CORE_RUNNING_STATUS] %asi,    %g6
    cmp     %g6,    EXPECT_ACTIVE ! what threads are expected to be active
    bne     bad_reg_value
    nop

    ! restore original return address
    mov     %i1,    %o7    
    retl ! to %o7
    nop
! ---

    
! confirm, all threads are parked, except self.
! loop for each thread and insure counter does not inc
park_check:
    ! save return address, nested calls
    mov     %o7,    %i2

    mov     LAST_THREAD,      %g4

loop_pc: 
	! skip self
    cmp     MY_ID,  %g4
    beq     next_pc
    nop    

    !umul	%g4,    0x8,  %g5               ! g4=tid, offset
    sllx    %g4, 6, %g5           ! move tid up to bank select position
    !read counter location
    ldx     [USER_DATA + %g5],   %g6

    call    delay
    nop
delay_rtn2:     
    !read counter location
    ldx     [USER_DATA + %g5],   %g7
    
    !has it incremented?
    cmp     %g6,    %g7
    bne     thread_not_parked
    nop
    
next_pc:   
    deccc   %g4
    bpos    loop_pc
    nop
	
    ! check ASI_CORE_RUNNING_STATUS, all active
    ldxa    [%g0 + ASI_CMP_CORE_RUNNING_STATUS] %asi,    %g6
    xor     MASK_OUT_SELF,    ALL1S,    %g7 ! only self is set
    cmp     %g6,    %g7
    bne     bad_reg_value
    nop

    ! restore original return address
    mov     %i2,    %o7    
    retl ! %o7
    nop
! ---

    
    
! spin incrementing a mem location.
! look at the master address to see when I become master.
counter1:
    mov     1,      %g1
loop_1: 
    stx     %g1,    [MY_ADDR]
    ldx     [COMN_ADDR],  %g2
    cmp     %g2,    MY_ID ! thread id
    bne,a   loop_1
    inc     %g1
    retl    ! %o7
    nop
! ---


    
! spin incrementing a mem location.
! look at the master address to see when I need to exit
counter2:
    mov     1,      %g3
loop_2: 
    stx     %g3,    [MY_ADDR]
    ldx     [COMN_ADDR],  %g2
    cmp     %g2,    THREAD_COUNT ! final thread is done
    bne,a   loop_2
    inc     %g3
    retl    ! %o7
    nop
! ---

    
    
! kill time, do a few divides
delay:
    !do a divide a few times
    ldd     [COMN_ADDR + 0x10],  %f0
    ldd     [COMN_ADDR + 0x18],  %f2
    fdivd   %f0,    %f2,    %f4
    fdivd   %f4,    %f6,    %f0
!     fdivd   %f0,    %f2,    %f4
!     fdivd   %f4,    %f6,    %f0
!     fmuld   %f0,    %f2,    %f4
!     fmuld   %f4,    %f6,    %f0    
!     fdivd   %f0,    %f2,    %f4
!     fdivd   %f4,    %f6,    %f0
!     fdivd   %f0,    %f2,    %f4
!     fdivd   %f4,    %f6,    %f0
!     fmuld   %f0,    %f2,    %f4
!     fmuld   %f4,    %f6,    %f0
!     fmuld   %f0,    %f2,    %f4
!     fmuld   %f4,    %f6,    %f0    
    fdivd   %f0,    %f2,    %f4
    fdivd   %f4,    %f6,    %f0
    fdivd   %f0,    %f2,    %f4
    fdivd   %f4,    %f6,    %f0
    fmuld   %f0,    %f2,    %f4
    fmuld   %f4,    %f6,    %f0    
    fdivd   %f0,    %f2,    %f4
    fdivd   %f4,    %f6,    %f0
    fdivd   %f0,    %f2,    %f4
    fdivd   %f4,    %f6,    %f0
    fmuld   %f0,    %f2,    %f4
!     fmuld   %f4,    %f6,    %f0
!     fmuld   %f0,    %f2,    %f4
!     fmuld   %f4,    %f6,    %f0    
!     fdivd   %f0,    %f2,    %f4
!     fdivd   %f4,    %f6,    %f0
    fdivd   %f0,    %f2,    %f4
      
    retl ! %o7
    nop
! ---


    
    
/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
.xword 0x0
.xword 0x0
.xword 0x0	
.xword 0x0
.xword 0x0	
.xword 0x0
.xword 0x0
.xword 0x0
.xword 0x0
.xword 0x5555555555555555
.xword 0xaaaaaaaaaaaaaaaa
.xword 0x5555555555555555
.xword 0xaaaaaaaaaaaaaaaa
.xword 0x5555555555555555
.xword 0xaaaaaaaaaaaaaaaa
.xword 0x5555555555555555
.xword 0xaaaaaaaaaaaaaaaa
.xword 0x5555555555555555
.xword 0xaaaaaaaaaaaaaaaa
.xword 0x5555555555555555
.xword 0xaaaaaaaaaaaaaaaa
.xword 0x5555555555555555
.xword 0xaaaaaaaaaaaaaaaa
.xword 0x5555555555555555
.xword 0xaaaaaaaaaaaaaaaa
.end

