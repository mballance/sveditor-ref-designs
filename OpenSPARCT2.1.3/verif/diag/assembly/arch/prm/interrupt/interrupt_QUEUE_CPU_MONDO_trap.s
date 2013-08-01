/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: interrupt_QUEUE_CPU_MONDO_trap.s
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

#define H_T0_Cpu_Mondo_Trap_0x7c
#define My_T0_Cpu_Mondo_Trap_0x7c \
	call	my_Cpu_Mondo_trap; \
	nop; \
	done; \
	nop;

#define H_HT0_DAE_invalid_asi_0x14 my_H_T0_DAE_invalid_asi_0x14


#include "hboot.s"
#include "asi_s.h"

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:

	! Switch to Hypervisor mode.
go_hyper1:	
	ta	T_CHANGE_HPRIV
	nop

	! Enable interrupts in the Pstate reg.
	rdpr	%pstate, %g5
	wrpr	%g5, 1, %pstate

	! Initialize the queue head and tail pointers to same location.
init_cpu_queue:
	set	ASI_QUEUE, %g1
	wr	%g1, %g0, %asi
	setx	queue_start, %g1, %g2
	stxa	%g2, [%g0 + ASI_CPU_MONDO_QUEUE_HEAD]%asi
	stxa	%g2, [%g0 + ASI_CPU_MONDO_QUEUE_TAIL]%asi

	! Switch to supervisor mode.
go_super:	
	ta	T_CHANGE_PRIV
	nop
	ta      T_CHANGE_NONHPRIV
	nop

	! Change the queue head != queue tail to generate trap
gen_mondo_trap:
	setx	queue_end, %g1, %g2
	stxa	%g2, [%g0 + ASI_CPU_MONDO_QUEUE_HEAD]%asi
	membar	#Sync

	! Wait for mondo trap
mondo_wait:
	setx	400, %g1, %g7	! g7 = timeout count
	setx	cpu_mondo_trap_count, %g1, %g3
mondo_loop:
	brz	%g7, test_failed
	nop
	ld	[%g3], %g4
	brz	%g4, mondo_loop
	sub	%g7, 1, %g7

	! Change queue head == queue tail, no trap expected
no_mondo_trap:	
	setx	queue_start, %g1, %g2
	stxa	%g2, [%g0 + ASI_CPU_MONDO_QUEUE_HEAD]%asi
	membar	#Sync

	! Try to write queue tail register, expect a
	! DAE_invalid trap
dae_inv_trap:
	setx	queue_end, %g1, %g2
	stxa	%g2, [%g0 + ASI_CPU_MONDO_QUEUE_TAIL]%asi
	membar	#Sync

	! Switch to Hypervisor mode.
go_hyper2:	
	ta	T_CHANGE_HPRIV
	nop

	! Change queue tail != queue head, no trap expected.
hyper_no_trap:
	setx	queue_end, %g1, %g2
	stxa	%g2, [%g0 + ASI_CPU_MONDO_QUEUE_TAIL]%asi
	membar	#Sync

	! Wait a bit
wait:	
	setx	100, %g1, %g7	! Loop count
loop:
	brz	%g7, go_super2
	sub	%g7, 1, %g7

	! Go back to privileged mode, trap should occur now.
go_super2:
	ta      T_CHANGE_NONHPRIV
	nop

	! Wait a bit more
wait_more:	
	setx	400, %g1, %g7	! Loop count
loop_more:
	brz	%g7, check_trap_counts
	sub	%g7, 1, %g7

	! Check for expected number of traps.

check_trap_counts:
	setx	cpu_mondo_trap_count, %g1, %g3
	ld	[%g3], %g4
	cmp	%g4, 2
	bne	test_failed
	nop

	ta      T_CHANGE_HPRIV
	nop
 
	setx	dae_invalid_trap_count, %g1, %g3
	ld	[%g3], %g4
	cmp	%g4, 1
	bne	test_failed
	nop

	! Done

	ba	test_passed
	nop


test_passed:
	EXIT_GOOD

test_failed:
	EXIT_BAD


/**********************************************************************
   Trap handlers.
**********************************************************************/

.global	my_Cpu_Mondo_trap
.global	my_H_T0_DAE_invalid_asi_0x14

my_Cpu_Mondo_trap:
	! Increment the count
	
	setx	cpu_mondo_trap_count, %g6, %g7
	ld	[%g7], %g5
	add	%g5, 1, %g5
	st	%g5, [%g7]
	membar	#Sync

	! Clear the interrupt

	ldxa	[%g0 + ASI_CPU_MONDO_QUEUE_TAIL]%asi, %g2
	stxa	%g2, [%g0 + ASI_CPU_MONDO_QUEUE_HEAD]%asi
	membar	#Sync

	jmpl	%o7+0x8, %g0
	nop

	
my_H_T0_DAE_invalid_asi_0x14:
	! Increment the count
	
	setx	dae_invalid_trap_count, %g6, %g7
	ld	[%g7], %g5
	add	%g5, 1, %g5
	st	%g5, [%g7]
	membar	#Sync

	done
	nop
	

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
cpu_mondo_trap_count:
	.word	0x0
	.word	0x0
dae_invalid_trap_count:
	.word	0x0
	.word	0x0
queue_start:
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
queue_end:
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
.end



