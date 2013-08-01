/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: traps_save_restore.s
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

#define MY_SPILL_TRAP \
    saved; \
    wrpr    %g0, %cwp; \
    rdpr    %tl, %l6; \
    rdpr    %tt, %l5; \
    rd      %pc, %l4; \
    inc     %l3; \
	done; \
    nop;

#define MY_FILL_TRAP \
    restored; \
    wrpr    %g0, %cwp; \
    rdpr    %tl, %l6; \
    rdpr    %tt, %l5; \
    rd      %pc, %l4; \
    inc     %l3; \
	done; \
    nop;
	
#define MY_GENERIC_TRAP \
    wrpr    %g0, %cwp; \
    rdpr    %tl, %l6; \
    rdpr    %tt, %l5; \
    rd      %pc, %l4; \
    inc     %l3; \
	done; \
    nop;  \
    nop;
    
        
#define H_T0_Window_Spill_0_Normal_Trap
#define My_T0_Window_Spill_0_Normal_Trap MY_SPILL_TRAP
#define H_T0_Window_Spill_1_Normal_Trap
#define My_T0_Window_Spill_1_Normal_Trap MY_SPILL_TRAP
#define H_T0_Window_Spill_2_Normal_Trap
#define My_T0_Window_Spill_2_Normal_Trap MY_SPILL_TRAP
#define H_T0_Window_Spill_3_Normal_Trap
#define My_T0_Window_Spill_3_Normal_Trap MY_SPILL_TRAP
#define H_T0_Window_Spill_4_Normal_Trap
#define My_T0_Window_Spill_4_Normal_Trap MY_SPILL_TRAP
#define H_T0_Window_Spill_5_Normal_Trap
#define My_T0_Window_Spill_5_Normal_Trap MY_SPILL_TRAP
#define H_T0_Window_Spill_6_Normal_Trap
#define My_T0_Window_Spill_6_Normal_Trap MY_SPILL_TRAP
#define H_T0_Window_Spill_7_Normal_Trap
#define My_T0_Window_Spill_7_Normal_Trap MY_SPILL_TRAP

#define H_T0_Window_Spill_0_Other_Trap
#define My_T0_Window_Spill_0_Other_Trap MY_SPILL_TRAP
#define H_T0_Window_Spill_1_Other_Trap
#define My_T0_Window_Spill_1_Other_Trap MY_SPILL_TRAP
#define H_T0_Window_Spill_2_Other_Trap
#define My_T0_Window_Spill_2_Other_Trap MY_SPILL_TRAP
#define H_T0_Window_Spill_3_Other_Trap
#define My_T0_Window_Spill_3_Other_Trap MY_SPILL_TRAP
#define H_T0_Window_Spill_4_Other_Trap
#define My_T0_Window_Spill_4_Other_Trap MY_SPILL_TRAP
#define H_T0_Window_Spill_5_Other_Trap
#define My_T0_Window_Spill_5_Other_Trap MY_SPILL_TRAP
#define H_T0_Window_Spill_6_Other_Trap
#define My_T0_Window_Spill_6_Other_Trap MY_SPILL_TRAP
#define H_T0_Window_Spill_7_Other_Trap
#define My_T0_Window_Spill_7_Other_Trap MY_SPILL_TRAP

! fill	
#define H_T0_Window_Fill_0_Normal_Trap
#define My_T0_Window_Fill_0_Normal_Trap MY_FILL_TRAP
#define H_T0_Window_Fill_1_Normal_Trap
#define My_T0_Window_Fill_1_Normal_Trap MY_FILL_TRAP
#define H_T0_Window_Fill_2_Normal_Trap
#define My_T0_Window_Fill_2_Normal_Trap MY_FILL_TRAP
#define H_T0_Window_Fill_3_Normal_Trap
#define My_T0_Window_Fill_3_Normal_Trap MY_FILL_TRAP
#define H_T0_Window_Fill_4_Normal_Trap
#define My_T0_Window_Fill_4_Normal_Trap MY_FILL_TRAP
#define H_T0_Window_Fill_5_Normal_Trap
#define My_T0_Window_Fill_5_Normal_Trap MY_FILL_TRAP
#define H_T0_Window_Fill_6_Normal_Trap
#define My_T0_Window_Fill_6_Normal_Trap MY_FILL_TRAP
#define H_T0_Window_Fill_7_Normal_Trap
#define My_T0_Window_Fill_7_Normal_Trap MY_FILL_TRAP

#define H_T0_Window_Fill_0_Other_Trap
#define My_T0_Window_Fill_0_Other_Trap MY_FILL_TRAP
#define H_T0_Window_Fill_1_Other_Trap
#define My_T0_Window_Fill_1_Other_Trap MY_FILL_TRAP
#define H_T0_Window_Fill_2_Other_Trap
#define My_T0_Window_Fill_2_Other_Trap MY_FILL_TRAP
#define H_T0_Window_Fill_3_Other_Trap
#define My_T0_Window_Fill_3_Other_Trap MY_FILL_TRAP
#define H_T0_Window_Fill_4_Other_Trap
#define My_T0_Window_Fill_4_Other_Trap MY_FILL_TRAP
#define H_T0_Window_Fill_5_Other_Trap
#define My_T0_Window_Fill_5_Other_Trap MY_FILL_TRAP
#define H_T0_Window_Fill_6_Other_Trap
#define My_T0_Window_Fill_6_Other_Trap MY_FILL_TRAP
#define H_T0_Window_Fill_7_Other_Trap
#define My_T0_Window_Fill_7_Other_Trap MY_FILL_TRAP
    

#define H_T0_Clean_Window
#define My_T0_Clean_Window MY_GENERIC_TRAP


    
#include "hboot.s"

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:

 	ta	T_CHANGE_PRIV  ! run in priv mode
 	nop

! 	rdth_id ! get thread ID in %o1
! 	umul	%o1, 256, %l7
! 	setx	user_data_start, %g1, %g3
! 	add 	%l7, %g3, %l7

single_thread:
    ba thread_0
    
! thread_dispatch:
! 	cmp %o1, 0x0
! 	be thread_0
! 	nop
! 	cmp %o1, 0x1
! 	be thread_1
! 	nop
! 	cmp %o1, 0x2
! 	be thread_2
! 	nop
! 	cmp %o1, 0x3
! 	be thread_3
! 	nop
! 	cmp %o1, 0x4
! 	be thread_4
! 	nop
! 	cmp %o1, 0x5
! 	be thread_5
! 	nop
! 	cmp %o1, 0x6
! 	be thread_6
! 	nop
! 	cmp %o1, 0x7
! 	be thread_7
	
! ! !  	nop
! ! ! 	EXIT_GOOD

	
    
!
! Thread 0 Start
!
thread_0:
	

theRealStuff:        
	!# Execute Main Diag ..

    wrpr    %g0,    %cwp ! default window is zero
    
    ! table address
    setx    HV_TRAP_BASE_PA,    %g1,    %i7
    srlx    %i7,    13,     %i4 ! HV_TRAP_BASE
    setx    TRAP_BASE_VA,   %g1,    %i7
    srlx    %i7,    13,     %i5 ! TRAP_BASE
    
    ! trap count    
    setx    0,  %g1,    %o6

    ! outer loop cnt
    setx    0,  %g1,    %i3

save:   
    
        
! 2 loops
loopNormAndOther:   

    ! no clean traps now
    mov     7,      %g1
    wrpr    %g1,    %cleanwin
    
    !loop cnt
    setx    7,  %g1,    %i6
    setx    8,  %g1,    %i7
    
loop8traps: 
	!spill 8 times
    wrpr    %i3,    %otherwin
    sll     %i6,    3,  %g7
    or      %g7,    %i6,    %g7
    wrpr    %g7,    %wstate  ! what trap we will take
    wrpr    %g0,    %cansave ! can't save
    wrpr    %i6,    %cwp
    save    ! do it

    wrpr    %g0,    %cwp ! default window is zero
    
    cmp     %l6,    1    ! trap level
    bne     test_failed
    mov     0,      %l6
    
    !%o0 = itteration X 4 + 80 + 20 if other = TrapType
    mulx    %i6,    0x04,   %o0
    add     %o0,    0x80,   %o0  
	mulx    %i3,    0x20,   %o1
    add     %o0,    %o1,    %o0
    
    cmp     %l5,    %o0     !type check
    bne     test_failed
    mov     0,      %l5
    srlx    %l4,    13, %g3 ! table address
	cmp     %g3,    %i5     ! correct table used by tlu?
    bne     test_failed
    mov     0,      %l4

    dec     %i6
    subcc   %i7,    1,  %i7
    bne     loop8traps
    nop

    subcc   %i3,    1,  %g1
    bz      clean_win
    nop
    inc     %i3
    ba      loopNormAndOther
    nop
    
clean_win:      

!   If CANSAVE 0, the SAVE instruction checks whether the new window
! 	needs to be cleaned. It causes a clean_windowtrap if the number of
! 	unused clean windows is zero, that is, (CLEANWIN - CANRESTORE)
! 	= 0. The clean_window trap handler is invoked with the CWP set to
! 	point to the window to be cleaned (that is, old CWP + 1).
	
    wrpr    %g0,    %cwp ! default window is zero
    
    mov     7,      %g1    
    wrpr    %g0,    %cleanwin
    wrpr    %g0,    %canrestore
!    wrpr    %g0,    %wstate  ! what trap we will take
    wrpr    %g1,    %cansave ! can save
    wrpr    %g0,    %cwp
    save    %g1,    %g1,    %g1! do it

    wrpr    %g0,    %cwp ! default window is zero
    
    cmp     %l6,    1       !level check
    bne     test_failed
    mov     0,      %l6
    cmp     %l5,    0x24    !type check
    bne     test_failed
    mov     0,      %l5
    srlx    %l4,    13, %g3 ! table address
	cmp     %g3,    %i5     ! correct table used by tlu?
    bne     test_failed
    mov     0,      %l4
    
! sas OK to here    
    
restore:

    wrpr    %g0,    %cwp ! default window is zero    
    
    ! outer loop cnt
    setx    0,  %g1,    %i3
    
! 2 loops
loopNormAndOther_r:   

    ! no clean traps
    mov     7,      %g1
    wrpr    %g1,    %cleanwin
    
    !loop cnt
    setx    7,  %g1,    %i6
    setx    8,  %g1,    %i7
    
loop8traps_r: 
	!fill 8 times
    wrpr    %i3,    %otherwin
    sll     %i6,    3,  %g7
    or      %g7,    %i6,    %g7
    wrpr    %g7,    %wstate  ! what trap we will take
    wrpr    %g0,    %canrestore ! can't restore
    wrpr    %i6,    %cwp
    restore    ! do it

    wrpr    %g0,    %cwp ! default window is zero
    
    cmp     %l6,    1    ! trap level
    bne     test_failed
    mov     0,      %l6
    
    !%o0 = itteration X 4 + C0 + 20 if other = TrapType
    mulx    %i6,    0x04,   %o0
    add     %o0,    0xc0,   %o0  
	mulx    %i3,    0x20,   %o1
    add     %o0,    %o1,    %o0
    
    cmp     %l5,    %o0     !type check
    bne     test_failed
    mov     0,      %l5
    srlx    %l4,    13, %g3 ! table address
	cmp     %g3,    %i5     ! correct table used by tlu?
    bne     test_failed
    mov     0,      %l4

    dec     %i6
    subcc   %i7,    1,  %i7
    bne     loop8traps_r
    nop

    subcc   %i3,    1,  %g1
    bz      test_passed
    nop
    inc     %i3
    ba      loopNormAndOther_r
    nop
    
    
        
    ! check final trap count
    cmp     %o6,    %l3
    bne     test_failed

test_passed:
	EXIT_GOOD

test_failed:
    EXIT_BAD


/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
.xword 0xDEADBEEFDEADBEEF
.xword 0x1111111122222222
.xword 0x3333333344444444
.xword 0x55555555
.end



