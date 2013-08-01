/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: memop_all_packet.s
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
#define SPU_TIMEOUT 0x100

#define H_HT0_Interrupt_0x60
#define My_HT0_Interrupt_0x60 \
	call	my_trap_code; \
	nop; \
	retry; \
	nop; 

#include "hboot.s"
#include "asi_s.h"

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:
	ta	T_CHANGE_HPRIV

!
! Thread 0 Start
!
thread_0:

	!  PCX Load, CPX Load Return

	setx	user_data_start, %g1, %g2
load:
	setx	0x1111111111111111, %g1, %g7
	ldx	[%g2 + 0x8], %l6
	cmp	%l6, %g7
	bne	test_failed
	nop


	! PCX Prefetch, CPX Prefetch Return
prefetch:
	prefetch [%g2 + 0x10], 0x0
	membar	#Sync
	setx	0x22222222, %g1, %g3
	ld	[%g2 + 0x10], %l6
	cmp	%l6, %g3
	bne	test_failed
	nop


	! PCX Diagnostic Load, CPX Diagnostic Load Return
diagload:
	setx	0xaa00000000, %g1, %g7		! L2$ Error Enable Reg.
	ldx	[%g7], %g6


	! PCX Diagnostic Store, CPX Diagnostic Store Ack
diagstore:
	stx	%g6, [%g7]			! Store back to same reg.


	! PCX Dcache Invalidate, CPX, Dcache Invalidate Ack
dcache:
	! Not enough infomation available to know how to generate


	! PCX Instruction Fill, CPX IFill Return (1) & (2)
	! These occur all the time as code is fetched.

	
	! PCX Icache Invalidate, CPX Icache Invalidate Ack
icache:
	! Not enough infomation available to know how to generate

	
	! PCX Store, CPX Store Ack
store:	
	setx	0xa5a5a5a5, %g1, %g3
	setx	temp, %g1, %g4
	st	%g3, [%g4]
	ld	[%g4], %g5
	cmp	%g3, %g5
	bne	test_failed
	nop


	! PCX CAS (1) & (2), CPX CAS Return & Ack
cas:
        setx    0xffffffffffffffff, %g1, %l0
        casa    [%g2]ASI_PRIMARY, %g0, %l0
        cmp     %l0, 0
        bne     test_failed
        nop
        setx    0xffffffff, %g1, %g4
        ld      [%g2], %l1
        cmp     %g4, %l1
        bne     test_failed
        nop


	! PCX Swap/Ldstub, CPX Swap/Ldstub Return & Ack
swap:
        setx    0xa5a5a5a5a5a5a5a5, %g1, %g5
        swap    [%g2+0x18], %g5
        setx    0x33333333, %g1, %6
        cmp     %g5, %g6
        bne     test_failed
        nop
        ld      [%g2+0x18], %l6
        setx    0xa5a5a5a5, %g1, %g7
        cmp     %l6, %g7
        bne     test_failed
        nop


	! PCX MMU Load, CPX MMU Load Return
mmuload:
        add     %g2, 0x20, %g7
        ldda    [%g7]ASI_NUCLEUS_QUAD_LDD, %l0
        setx    0x4444444444444444, %g1, %g4
        setx    0x5555555555555555, %g1, %g3
        cmp     %l0, %g4
        bne     test_failed
        nop
        cmp     %l1, %g3
        bne     test_failed
        nop


	! PCX Interrupt, CPX Interrupt Return
interrupt:
	stxa	%g0, [%g0]ASI_SWVR_INTR_RECEIVE		! enable interrupts
	membar	#Sync
	set	0x3f, %g1
	stxa	%g1, [%g0]ASI_SWVR_INTR_W	! Send interrupt to myself
	membar	#Sync

	mov	%g1, %g3			! %g3, timeout count
	setx	my_trap_count, %g1, %g4
intr_loop:
	cmp	%g3, 0
	be	test_failed
	dec	%g3

	ld	[%g4], %g1
	cmp	%g1, 1
	bne	intr_loop
	nop

	! PCX Flush, CPX Flush Return
flush:
	setx	mmuload, %g1, %g3
	flush	%g3


	! CPX Eviction Invalidation
exiction:
	ldx	[%g2], %l1		! Bring data into a D$ line.
	mov	%g2, %o0
	call	flush_l2_line		! Causing the corresponding L2$
					! line to be replaced causes the
					! Dcache line to be invalidated.
	nop


	! CPX Error Indication
error:
	! Currently not able to induce an error on a load,
	! such as an L2$ ECC error.


	! PCX Stream Load, CPX Stream Load Return
	! PCX Stream Store, CPX Stream Store Ack
	! This code was modified from isa3_spu_cwq_tcp.s diag
stream:
        wr	%g0, 0x40, %asi		! setup ASI register to point to SPU
	
	! Make sure CWQ is currently disabled, not busy,
	! not terminated, no protocol error; else fail

	ldxa	[%g0 + ASI_SPU_CWQ_CSR] %asi, %l1
	and	%l1, 0xf, %l2
	cmp	%g0, %l2
	bne,pn	%xcc, test_failed
	nop

	
	! Allocate control word queue
	! (e.g., setup head/tail/first/last registers)

	setx CWQ_BASE, %g1, %l6

	! First pointer

	stxa	%l6, [%g0 + ASI_SPU_CWQ_FIRST] %asi 
        ldxa	[%g0 + ASI_SPU_CWQ_FIRST] %asi, %l1
	setx	0x0000ffffffffffff, %l5, %l0	! Mask off upper 16 bits
	and	%l0, %l6, %l2
	cmp	%l1, %l2
	bne,pn	%xcc, test_failed
	nop

	! Head Pointer

	stxa	%l6, [%g0 + ASI_SPU_CWQ_HEAD] %asi 
        ldxa	[%g0 + ASI_SPU_CWQ_HEAD] %asi, %l1
	cmp	%l1, %l2
	bne,pn	%xcc, test_failed
	nop
	
	! Tail pointer

	stxa	%l6, [%g0 + ASI_SPU_CWQ_TAIL] %asi 
        ldxa	[%g0 + ASI_SPU_CWQ_TAIL] %asi, %l1
	cmp	%l1, %l2
	bne,pn	%xcc, test_failed
	nop
	
	! Last pointer

	setx	CWQ_LAST, %g1, %l5
	stxa	%l5, [%g0 + ASI_SPU_CWQ_LAST] %asi 
        ldxa	[%g0 + ASI_SPU_CWQ_LAST] %asi, %l1
	and	%l0, %l5, %l2		!# Mask off upper 16 bits
	cmp	%l1, %l2
	bne,pn	%xcc, test_failed
	nop
	
	! Build the first control word, for the first RC4 vector.
	! First build up word 0
	! For RC4, set op = 65, Enc=1, SOB=EOB=1, SFAS=0, Int=CoreID=0,
	! AuthType=8, EncType=00, status=0, Len=30

	setx	0xc1E001080000001D, %l1, %l2

	! %l6 points to CWQ_BASE
	! Note:	All CWQ entry addresses must be physical!

	stx	%l2, [%l6 + 0x0]
	
	! Write source address to next CW field

	setx	cleartext_1, %g1, %l2
	stx	%l2, [%l6+0x8]

	! Write 0's to the next 5 CW fields as they are not used

	stx	%g0, [%l6+0x10]
	stx	%g0, [%l6+0x18]
	stx	%g0, [%l6+0x20]
	stx	%g0, [%l6+0x28] 
	stx	%g0, [%l6+0x30]

	! Finally write destination address to last CW field

	setx result_1, %g1, %o3
	stx	%o3, [%l6 + 0x38] 
	
	! Make sure all these stores get to memory before we start

	membar #Sync

	! Now add 1 (actually 8*8B) to tail pointer 

        ldxa	[%g0 + ASI_SPU_CWQ_TAIL] %asi, %l2
	add	%l2, 0x40, %l2
	stxa	%l2, [%g0 + ASI_SPU_CWQ_TAIL] %asi 
        ldxa	[%g0 + ASI_SPU_CWQ_TAIL] %asi, %l1
	cmp	%l1, %l2
	bne,pn	%xcc, test_failed
	nop
	
	! Kick off the CWQ operation by writing to the CWQ_CSR
	! Set the enabled bit and reset the other bits 

	or	%g0, 0x1, %g1
	stxa	%g1,	[%g0 + ASI_SPU_CWQ_CSR] %asi	

	! set maximum wait loop count, setup mask for busy bit
	! This timeout may need adjustment

	setx	SPU_TIMEOUT, %o3, %l3
	or	%g0, 0x4, %l2		! mask out the busy bit

	! loop on busy to fall through when done or loop count exceeded
spu_wait1:
	ldxa	[%g0 + ASI_SPU_CWQ_CSR] %asi,	%l1
	andcc	%l1, %l2, %l1
	be	test_passed
	addcc	%l3, -1, %l3
	bgt	spu_wait1
	nop
	ba	test_failed
	nop


/**********************************************************************
 *  Common code.
 *********************************************************************/

test_passed:
	EXIT_GOOD

test_failed:
	EXIT_BAD

	! Assumes that %o0 contains VA that maps to L2$ line to be flushed,
	! and %o7 contains the return address.  The flush is done by
	! doing 16 loads from different addresses that alias to that line.
	! Note that this will cause a writeback if the L2$ line is dirty.
	! The registers %o1, %o2, %o3, %o4 and %o5 are used.
	
flush_l2_line:
	setx	0x3ffff, %o1, %o2
	and	%o0, %o2, %o3
	setx	0x40000, %o1, %o2
	setx	alias1, %o1, %o4
	ld	[%o3+%o4], %o5
	add	%o4, %o2, %o4
	ld	[%o3+%o4], %o5
	add	%o4, %o2, %o4
	ld	[%o3+%o4], %o5
	add	%o4, %o2, %o4
	ld	[%o3+%o4], %o5
	add	%o4, %o2, %o4
	ld	[%o3+%o4], %o5
	add	%o4, %o2, %o4
	ld	[%o3+%o4], %o5
	add	%o4, %o2, %o4
	ld	[%o3+%o4], %o5
	add	%o4, %o2, %o4
	ld	[%o3+%o4], %o5
	add	%o4, %o2, %o4
	ld	[%o3+%o4], %o5
	add	%o4, %o2, %o4
	ld	[%o3+%o4], %o5
	add	%o4, %o2, %o4
	ld	[%o3+%o4], %o5
	add	%o4, %o2, %o4
	ld	[%o3+%o4], %o5
	add	%o4, %o2, %o4
	ld	[%o3+%o4], %o5
	add	%o4, %o2, %o4
	ld	[%o3+%o4], %o5
	add	%o4, %o2, %o4
	ld	[%o3+%o4], %o5
	add	%o4, %o2, %o4
	ld	[%o3+%o4], %o5
	jmpl	%o7+0x8, %g0
	nop


/**********************************************************************
   Interrupt trap handler.
**********************************************************************/

.global	my_trap_code

my_trap_code:
	! Increment the count
	
	setx	my_trap_count, %g6, %g7
	ld	[%g7], %g5
	add	%g5, 1, %g5
	st	%g5, [%g7]
	membar	#Sync

	! Clear the interrupt

	ldxa	[%g0]ASI_SWVR_INTR_R, %g3

	jmpl	%o7+0x8, %g0
	nop

	
/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
	.xword 0x0000000000000000
	.xword 0x1111111111111111
	.xword 0x2222222222222222
	.xword 0x3333333333333333
	.xword 0x4444444444444444
	.xword 0x5555555555555555
	.xword 0x6666666666666666
	.xword 0x7777777777777777
	.xword 0x8888888888888888
	.xword 0x9999999999999999
	.xword 0xaaaaaaaaaaaaaaaa
	.xword 0xbbbbbbbbbbbbbbbb
	.xword 0xcccccccccccccccc
	.xword 0xdddddddddddddddd
	.xword 0xeeeeeeeeeeeeeeee
	.xword 0xffffffffffffffff
temp:
	.xword 0xffffffffaaaaaaaa
	.xword 0xffffffffaaaaaaaa
	.xword 0xffffffffaaaaaaaa
	.xword 0xffffffffaaaaaaaa

my_trap_count:
	.xword 0x0

	! Data used for steam (SPU) load/store testing

	! input data
	.align 16
cleartext_1:		
	.xword	0xDEECA425C5AF7185
	.xword	0xB128069258CF5271
	.xword	0xF2D9FC0493661FF4
	.xword	0x4C6DC5810067DEAD	
	 
	! expected ciphertext
	.align 16
ciphertext_1:	
	.xword	0x2e2dBEEFDEADBEEF

	.align 16
result_1:	
	.xword	0xDEADBEEFDEADBEEF			
	
	! CWQ data area, set aside 512 CW's worth
	! 512*8*8 = 32K

	.align 32*1024
CWQ_BASE:		
	.xword	0xAAAAAAAAAAAAAAA
	.xword	0xAAAAAAAAAAAAAAA
	.xword	0xAAAAAAAAAAAAAAA
	.xword	0xAAAAAAAAAAAAAAA
	.xword	0xAAAAAAAAAAAAAAA
	.xword	0xAAAAAAAAAAAAAAA
	.xword	0xAAAAAAAAAAAAAAA
	.xword	0xAAAAAAAAAAAAAAA
	.align 32*1024
CWQ_LAST:	
					
user_data_end:



	.align	0x40000		! each 246kb, 0x40000, aliases to same L2$ line
alias1:
	.skip	1024

.end


