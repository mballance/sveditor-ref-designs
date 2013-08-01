/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: stackinit_mt.s
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

#define ZERO_OFFSET 48

!---------------------------------------------------
! Number of arguments passed to the diag
! We have a CONVENTION:
!       argv[1] is THREAD ID 
!       argv[2] is number of threads
!       argv[3] is USER DEFINED
!       argv[4] is USER DEFINED
! currently we support up to argv[4]
!---------------------------------------------------
#ifndef C_ARGNUM
#define C_ARGNUM 5
#endif

#ifndef C_ARG3
#define C_ARG3 0
#endif

#ifndef C_ARG4
#define C_ARG4 0
#endif

!---------------------------------------------------
! stack pointer offset per Sparc V9 rules
!---------------------------------------------------
#define SP_OFFSET (STACKSIZE-4095)


!---------------------------------------------------
! some macros
!---------------------------------------------------
#define INIT_LOCAL_REGS                         \
	set 0x0, %l0;                           \
	set 0x0, %l1;                           \
	set 0x0, %l2;                           \
	set 0x0, %l3;                           \
	set 0x0, %l4;                           \
	set 0x0, %l5;                           \
	set 0x0, %l6;                           \
	set 0x0, %l7;                           \
	set 0x0, %i0;                           \
	set 0x0, %i1;                           \
	set 0x0, %i2;                           \
	set 0x0, %i3;                           \
	set 0x0, %i4;                           \
	set 0x0, %i5;                           \
	set 0x0, %i6;                           \
	set 0x0, %i7;

!---------------------------------------------------

!---------------------------------------------------
.section .text

!---------------------------------------------------
! the start of the C program
!---------------------------------------------------
.align 4
.global c_start
c_start:

!---------------------------------------------------
! register init - avoid mismatches in spill/fill traps
!---------------------------------------------------
	ta              T_CHANGE_PRIV
	wrpr            %g0, 0, %cwp
	INIT_LOCAL_REGS
	wrpr            %g0, 1, %cwp
	INIT_LOCAL_REGS
	wrpr            %g0, 2, %cwp
	INIT_LOCAL_REGS
	wrpr            %g0, 3, %cwp
	INIT_LOCAL_REGS
	wrpr            %g0, 4, %cwp
	INIT_LOCAL_REGS
	wrpr            %g0, 5, %cwp
	INIT_LOCAL_REGS
	wrpr            %g0, 6, %cwp
	INIT_LOCAL_REGS
	wrpr            %g0, 7, %cwp
	INIT_LOCAL_REGS
	wrpr            %g0, 0, %cwp
	ta              T_CHANGE_NONPRIV

!---------------------------------------------------
! set up stack per thread for all threads
!---------------------------------------------------
	th_fork(prepare_thread, %l0);

changequote([, ])dnl
forloop([i], 0, eval(THREAD_COUNT-1), [
[prepare_thread_]eval(i*THREAD_STRIDE):
!---------------------------------------------------
! Setting up the C args costs a fair bit, define SKIP_C_ARGS to skip this.
!---------------------------------------------------
#ifndef SKIP_C_ARGS
	setx    [hs]eval(i*THREAD_STRIDE), %l0, %o2     ! pointer to help string per thread

	setx    [arg1t]eval(i*THREAD_STRIDE), %l0, %o0  ! a pointer to arg1tN
	set     eval(i*THREAD_STRIDE), %o1              ! arg1 is the thread ID
	call    itos, 0
	nop
	setx    [arg2t]eval(i*THREAD_STRIDE), %l0, %o0  ! a pointer to arg2tN
	set     THREAD_COUNT, %o1                       ! arg2 is the thread count
	call    itos, 0
	nop
	setx    [arg3t]eval(i*THREAD_STRIDE), %l0, %o0
	set     C_ARG3, %o1                             ! USER defined
	call    itos, 0
	nop
	setx    [arg4t]eval(i*THREAD_STRIDE), %l0, %o0
	set     C_ARG4, %o1                             ! user defined
	call    itos, 0
	nop
#endif
	setx    [stack]eval(i*THREAD_STRIDE), %l5, %sp
	setx    SP_OFFSET, %l0, %l1
	add     %sp, %l1, %sp                           ! set and adjust the stack pointer

#ifndef SKIP_C_ARGS
	set     C_ARGNUM, %o0           ! argc          ! %o0 is argc
	setx    [argvp]eval(i*THREAD_STRIDE), %l0, %o1  ! %o1 is a ponter of array of arrays
#else
        clr     %o0
        clr     %o1
#endif
	ba      call_main                               ! now go to call_main...
	nop
])dnl
changequote(`,')dnl'


!---------------------------------------
call_main:                                              ! call the C program
#ifndef MAIN_INIT
	setx    main, %l0, %l1
#else
	setx    MAIN_INIT, %l0, %l1
#endif
	jmpl    %l1,%o7
	nop

	brnz    %o0, c_fail
	nop
c_pass: 
	ta      T_GOOD_TRAP
	nop

c_fail:
	ta      T_BAD_TRAP
	nop
!--------------------------------------------------------------------------
!--------------------------------------------------------------------------
!--------------------------------------------------------------------------

!--------------------------------------------------------------------------
! the itos - integer to string function below - is implemented in assembly
! based on the C implementation in the comments
!--------------------------------------------------------------------------
!void itos (char *s, int a){
!   if(a ==0){
!     s[0] = '0';
!     s[1] = 0;
!     return;
!   }
!   count  = 0;
!   result = a;
!   while(result >0){
!     hs[count++] = result % 10 + '0';
!     result = result /10;
!   }
!   if(a<0) hs[count] = '-';
!   else    count--;
!   for(iter= count; iter>=0; iter--) s[count-iter] = hs[iter];
!   s[count+1] = 0;
!}
!--------------------------------------------------------------------------
itos:
	mov     %g0, %l7                ! count
	brnz    %o1, itos_proceed       ! o1 is the number
	nop
	mov     ZERO_OFFSET, %l0        ! number is 0 
	stb     %l0, [%o0]              ! return '0', 0
	retl
	stb     %g0, [%o0 +1]

itos_proceed:                           ! check for sign
	brgz    %o1, itos_positive
	nop
	ba      itos_while_entry
	mulx    %o1, -1, %i4
itos_positive:
	mov     %o1, %i4                ! result
itos_while_entry:
	brgz    %i4, itos_while_body
	nop
	ba      itos_while_exit
	nop
itos_while_body:
       sdivx   %i4, 10, %i3             ! divide by 10
       sllx    %i3, 2, %i5              ! multiply result by 4
       add     %i5, %i3, %i5            ! add it once -> multipy by 5 by now.
	add     %i5, %i5, %i5           ! multiply by 10 overall
       sub     %i4, %i5, %l4            ! l4 is the remainder now.
       add     %l4, ZERO_OFFSET, %l4
       stb     %l4, [%o2 + %l7]
       mov     %i3, %i4
       inc     %l7
       ba      itos_while_entry
       nop
itos_while_exit:
       brgz    %o1, itos_positive2
       nop
       set     45, %i2                  ! 45 is the value of the '-' character
       stb     %i2, [%o2 + %l7]
       mov     %g0, %l0
       ba      itos_for_entry
       nop
itos_positive2:
       dec     %l7
       mov     %g0, %l0
itos_for_entry:
       brgez   %l7, itos_for_body
       nop
       ba      itos_for_exit
       nop
itos_for_body:
       ldub    [%o2 + %l7], %l4
       stb     %l4, [%o0 +%l0]
       inc     %l0
       dec     %l7
       ba      itos_for_entry
       nop
itos_for_exit:
       retl
       stb     %g0, [%o0 +%l0]
!--------------------------------------------------------------------------------------------


!--------------------------------------------------------------------------------------------
!--------------------------------------------------------------------------------------------
.section .data

.global shared_memory
shared_memory:
	.skip 0x1000

.global shared_memory_buffers
shared_memory_buffers:
       init_mem(0x0101010101010101, 8192, 8, +, 0, +, 0)
       .skip 0xc000

.global barp
barp:
	.skip 0x100

.global barrier_lock
barrier_lock:
	.skip 0x100

changequote([, ])dnl
forloop([i], 0, eval(THREAD_COUNT-1), [
.global [argvp]eval(i*THREAD_STRIDE)
[argvp]eval(i*THREAD_STRIDE):
	.xword arg0
	.xword [arg1t]eval(i*THREAD_STRIDE)
	.xword [arg2t]eval(i*THREAD_STRIDE)
	.xword [arg3t]eval(i*THREAD_STRIDE)
	.xword [arg4t]eval(i*THREAD_STRIDE)
	.xword [arg5t]eval(i*THREAD_STRIDE)
	.xword [arg6t]eval(i*THREAD_STRIDE)
	.xword [arg7t]eval(i*THREAD_STRIDE)
	.xword 0

.global [arg1t]eval(i*THREAD_STRIDE)
[arg1t]eval(i*THREAD_STRIDE):
	.skip 128

.global [arg2t]eval(i*THREAD_STRIDE)
[arg2t]eval(i*THREAD_STRIDE):
	.skip 128

.global [arg3t]eval(i*THREAD_STRIDE)
[arg3t]eval(i*THREAD_STRIDE):
	.skip 128

.global [arg4t]eval(i*THREAD_STRIDE)
[arg4t]eval(i*THREAD_STRIDE):
	.skip 128

.global [arg5t]eval(i*THREAD_STRIDE)
[arg5t]eval(i*THREAD_STRIDE):
	.skip 128

.global [arg6t]eval(i*THREAD_STRIDE)
[arg6t]eval(i*THREAD_STRIDE):
	.skip 128

.global [arg7t]eval(i*THREAD_STRIDE)
[arg7t]eval(i*THREAD_STRIDE):
	.skip 128

.global [hs]eval(i*THREAD_STRIDE)
[hs]eval(i*THREAD_STRIDE):
	.skip 128
])dnl
changequote(`,')dnl'


.global arg0
arg0:
	.ascii "mycmain"
	.byte 0
.global shm_sync
shm_sync:
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
!----------------------------------------------------------------------------------------------
