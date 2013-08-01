/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: interrupt_SPU_interrupt.s
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

#define H_HT0_Control_Word_Queue_Interrupt_0x3c
#define My_HT0_Control_Word_Queue_Interrupt_0x3c \
        call    my_CWQ_Interrupt_trap; \
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
	! Switch to Hypervisor mode.

	ta	T_CHANGE_HPRIV
	nop
	
	! This code was modified from isa3_spu_cwq_tcp.s diag

        wr	%g0, 0x40, %asi		! setup ASI register to point to SPU
	
	! Make sure CWQ is currently disabled, not busy,
	! not terminated, no protocol error; else fail
checkCWQ:
	ldxa	[%g0 + ASI_SPU_CWQ_CSR] %asi, %l1
	and	%l1, 0xf, %l2
	cmp	%g0, %l2
	bne,pn	%xcc, test_failed
	nop
	
	! Allocate control word queue
	! (e.g., setup head/tail/first/last registers)
allowcateCWQ:
	setx CWQ_BASE, %g1, %l6

	! First pointer
firstPtr:
	stxa	%l6, [%g0 + ASI_SPU_CWQ_FIRST] %asi 
        ldxa	[%g0 + ASI_SPU_CWQ_FIRST] %asi, %l1
	setx	0x0000ffffffffffff, %l5, %l0	! Mask off upper 16 bits
	and	%l0, %l6, %l2
	cmp	%l1, %l2
	bne,pn	%xcc, test_failed
	nop
headPtr:	
	! Head Pointer

	stxa	%l6, [%g0 + ASI_SPU_CWQ_HEAD] %asi 
        ldxa	[%g0 + ASI_SPU_CWQ_HEAD] %asi, %l1
	cmp	%l1, %l2
	bne,pn	%xcc, test_failed
	nop
	
	! Tail pointer
tailPtr:	
	stxa	%l6, [%g0 + ASI_SPU_CWQ_TAIL] %asi 
        ldxa	[%g0 + ASI_SPU_CWQ_TAIL] %asi, %l1
	cmp	%l1, %l2
	bne,pn	%xcc, test_failed
	nop
	
	! Last pointer
lastPtr:	
	setx	CWQ_LAST, %g1, %l5
	stxa	%l5, [%g0 + ASI_SPU_CWQ_LAST] %asi 
        ldxa	[%g0 + ASI_SPU_CWQ_LAST] %asi, %l1
	and	%l0, %l5, %l2		!# Mask off upper 16 bits
	cmp	%l1, %l2
	bne,pn	%xcc, test_failed
	nop
	
	! Build the initial control word, for the first RC4 vector.
	! First build up word 0
	! For RC4, set op = 65, Enc=1, SOB=EOB=1, SFAS=0,
	! AuthType=8, EncType=00, status=0, Len=30
	! For interrupt, set Int = 1 and Strand ID = thread ID.
buildControlWord:	
	setx	0xc1E101080000001D, %l1, %l2
        ta      T_RD_THID		! Get thread # within this core
	and	%o1, 7, %o1
	sllx	%o1, 37, %o1
	or	%l2, %o1, %l2		! Set this thread to get interrupt

	! %l6 points to CWQ_BASE
	! Note:	All CWQ entry addresses must be physical!

	stx	%l2, [%l6 + 0x0]
	
	! Write source address to next CW field
sourceAddr:
	setx	cleartext_1, %g1, %l2
	stx	%l2, [%l6+0x8]

	! Write 0's to the next 5 CW fields as they are not used
zeroFiveEntries:
	stx	%g0, [%l6+0x10]

	setx	crc_iv_2, %g1, %l2
	stx	%l2, [%l6+0x18]

	stx	%g0, [%l6+0x20]
	stx	%g0, [%l6+0x28] 
	stx	%g0, [%l6+0x30]

	! Finally write destination address to last CW field
destinationAddr:
	setx result_1, %g1, %o3
	stx	%o3, [%l6 + 0x38] 
	
	! Make sure all these stores get to memory before we start

	membar #Sync

	! Now add 1 (actually 8*8B) to tail pointer 
incrementTail:
        ldxa	[%g0 + ASI_SPU_CWQ_TAIL] %asi, %l2
	add	%l2, 0x40, %l2
	stxa	%l2, [%g0 + ASI_SPU_CWQ_TAIL] %asi 
        ldxa	[%g0 + ASI_SPU_CWQ_TAIL] %asi, %l1
	cmp	%l1, %l2
	bne,pn	%xcc, test_failed
	nop
	
	! Kick off the CWQ operation by writing to the CWQ_CSR
	! Set the enabled bit and reset the other bits 
startOp:
	or	%g0, 0x1, %g1
	stxa	%g1,	[%g0 + ASI_SPU_CWQ_CSR] %asi	

	! set maximum wait loop count, setup mask for busy bit
	! This timeout may need adjustment
initWait:
	setx	SPU_TIMEOUT, %o3, %l3
	or	%g0, 0x2, %l2		! mask out all but the busy bit

	! loop on busy to fall through when done or loop count exceeded
waitLoop:
	ldxa	[%g0 + ASI_SPU_CWQ_CSR] %asi,	%l1
	andcc	%l1, %l2, %l1
	be	checkData
	addcc	%l3, -1, %l3
	bgt	waitLoop
	nop
	ba	test_failed
	nop

	! check the results...first check the data
checkData:
	or	%g0, 0x1, %i0
	setx	result_1, %g1, %l5
	setx	ciphertext_1, %g1, %l6
	or	%g0, %g0, %g3
dataLoop:
	ldx	[%l5 + %g3], %l1
	ldx	[%l6 + %g3], %l2
	cmp	%l1, %l2
	bne,pn	%xcc, test_failed
	add	%g3, 0x8, %g3	!# i++
	addcc	%i0, -1, %i0
	bgt	dataLoop
	nop

	! Check to make sure an interrupt occured.
checkIntr:
	setx	cwq_intr_count, %l7, %l6
	ld	[%l6], %l5
	cmp	%l5, 1
	bne,pn	%icc, test_failed
	nop

	! Done
done:	
	ba	test_passed
	nop

test_passed:
	EXIT_GOOD

test_failed:
	EXIT_BAD


/**********************************************************************
   Trap handlers.
**********************************************************************/

.global my_CWQ_Interrupt_trap

my_CWQ_Interrupt_trap:
        ! Increment the count

        setx    cwq_intr_count, %g6, %g7
        ld      [%g7], %g5
        add     %g5, 1, %g5
        st      %g5, [%g7]
        membar  #Sync

        jmpl    %o7+0x8, %g0
        nop



/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:

cwq_intr_count:
	.word	0x0

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

crc_iv_2:	
	.xword	0x0000BEEFDEADBEEF
	
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
CWQ_LAST:	.xword 0x0

user_data_end:
.end

					
