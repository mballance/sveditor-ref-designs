/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: sput8.s
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
#define MAX_SPU_TRAP_CNT 1
#define NO_TRAPCHECK
#define H_HT0_Control_Word_Queue_Interrupt_0x3c
#define My_HT0_Control_Word_Queue_Interrupt_0x3c \
  sub %i6, 1, %i6; \
  retry;
# 588 "diag.j"
#include "hboot.s"

#define MAX_TIMEOUT 0x002
#define WAIT_LOOP 0x100
# 597 "diag.j"
.text
.global main

main:       

	ta	%icc, T_RD_THID
! fork: source strm = 0xffffffffffffffff; target strm = 0x1               
	cmp	%o1, 0
	setx	fork_lbl_0_1, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x2               
	cmp	%o1, 1
	setx	fork_lbl_0_2, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x4               
	cmp	%o1, 2
	setx	fork_lbl_0_3, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x8               
	cmp	%o1, 3
	setx	fork_lbl_0_4, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x10              
	cmp	%o1, 4
	setx	fork_lbl_0_5, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x20              
	cmp	%o1, 5
	setx	fork_lbl_0_6, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x40              
	cmp	%o1, 6
	setx	fork_lbl_0_7, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x80              
	cmp	%o1, 7
	setx	fork_lbl_0_8, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x100             
	cmp	%o1, 8
	setx	fork_lbl_0_9, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x200             
	cmp	%o1, 9
	setx	fork_lbl_0_10, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x400             
	cmp	%o1, 10
	setx	fork_lbl_0_11, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x800             
	cmp	%o1, 11
	setx	fork_lbl_0_12, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x1000            
	cmp	%o1, 12
	setx	fork_lbl_0_13, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x2000            
	cmp	%o1, 13
	setx	fork_lbl_0_14, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x4000            
	cmp	%o1, 14
	setx	fork_lbl_0_15, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x8000            
	cmp	%o1, 15
	setx	fork_lbl_0_16, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x10000           
	cmp	%o1, 16
	setx	fork_lbl_0_17, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x20000           
	cmp	%o1, 17
	setx	fork_lbl_0_18, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x40000           
	cmp	%o1, 18
	setx	fork_lbl_0_19, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x80000           
	cmp	%o1, 19
	setx	fork_lbl_0_20, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x100000          
	cmp	%o1, 20
	setx	fork_lbl_0_21, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x200000          
	cmp	%o1, 21
	setx	fork_lbl_0_22, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x400000          
	cmp	%o1, 22
	setx	fork_lbl_0_23, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x800000          
	cmp	%o1, 23
	setx	fork_lbl_0_24, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x1000000         
	cmp	%o1, 24
	setx	fork_lbl_0_25, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x2000000         
	cmp	%o1, 25
	setx	fork_lbl_0_26, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x4000000         
	cmp	%o1, 26
	setx	fork_lbl_0_27, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x8000000         
	cmp	%o1, 27
	setx	fork_lbl_0_28, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x10000000        
	cmp	%o1, 28
	setx	fork_lbl_0_29, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x20000000        
	cmp	%o1, 29
	setx	fork_lbl_0_30, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x40000000        
	cmp	%o1, 30
	setx	fork_lbl_0_31, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x80000000        
	cmp	%o1, 31
	setx	fork_lbl_0_32, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop

fail:
    	EXIT_BAD

.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_32:
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_31:
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_30:
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_29:
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_28:
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_27:
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_26:
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_25:
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_24:
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_23:
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_22:
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_21:
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_20:
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_19:
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_18:
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_17:
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_16:
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_15:
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_14:
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_13:
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_12:
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_11:
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_10:
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_9:
! Code for Template instance: _spu_
# 307 "/import/_spu_n2-_spu_aus-_spu_localdir1/_spu_somePerson/_spu_n2cdmspp/_spu_verif/_spu_diag/_spu_assembly/_spu_uarch/_spu_lsu/_spu_src/_spu_template/_spu_spu_random_complete_CW_rand5.t"
.text
.global _spu_main

_spu_main:       
	!# Switch to hpriv mode
    	ta 	T_CHANGE_HPRIV

        !# trap counter
        mov 0, %i6

        ! Set up for PMU 
        set 0x30419631, %g2
        wr %g2, %g0, %pcr
        setx 0xffffffb5ffffffab, %g2, %g7
        wr %g7, %g0, %pic

    	!# setup ASI register to point to SPU
    	wr 	%g0, 0x40, %asi

    	!# Make sure CWQ is currently disabled, not busy, not terminated, no protocol error; else fail
    	ldxa 	[%g0 + ASI_SPU_CWQ_CSR] %asi, %l1
    	and 	%l1, 0xf, %l2
    	cmp 	%g0, %l2
    	bne,pn 	%xcc, _spu_fail
    	nop

    	!# allocate control word queue (e.g., setup head/tail/first/last registers)
    	setx 	_spu_cwq_base, %g1, %l6

    	!# write base addr to first, head, and tail ptr
    	!# first store to first
    	stxa    %l6, [%g0 + ASI_SPU_CWQ_FIRST] %asi
    	ldxa    [%g0 + ASI_SPU_CWQ_FIRST] %asi, %l1
    	!# Mask off upper 16 bits
    	setx 	0x0000ffffffffffff, %l5, %l0
    	and 	%l0, %l6, %l2
    	cmp 	%l1, %l2
    	bne,pn 	%xcc,    _spu_fail
    	nop

    	!# then to head
    	stxa    %l6, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    	ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l1
    	cmp 	%l1, %l2
    	bne,pn 	%xcc,    _spu_fail
    	nop

    	!# then to tail
    	stxa    %l6, [%g0 + ASI_SPU_CWQ_TAIL] %asi
    	ldxa    [%g0 + ASI_SPU_CWQ_TAIL] %asi, %l1
    	cmp 	%l1, %l2
    	bne,pn 	%xcc,    _spu_fail
    	nop

    	!# then end of CWQ region to LAST
    	setx _spu_cwq_last, %g1, %l5
    	stxa    %l5, [%g0 + ASI_SPU_CWQ_LAST] %asi
    	ldxa    [%g0 + ASI_SPU_CWQ_LAST] %asi, %l1
    	!# Mask off upper 16 bits
    	and 	%l0, %l5, %l2
    	cmp 	%l1, %l2
    	bne,pn 	%xcc,    _spu_fail
    	nop

    	or      %g0, 0x0, %i4			!# _spu_counter : Increment _spu_by 1 _spu_to _spu_step _spu_over CWs
    	or      %g0, 0x0, %i5			!# _spu_offset  : Increment _spu_by 8 _spu_to _spu_step _spu_over CWs

_spu_main_loop:
	setx 	_spu_spu_op_array, %l1, %l2
	ldx 	[%l2 + %i5], %i1 
	cmp	%i1, 7
	bne	_spu_not_ssl
	mov	%i5, %g5		!# Save _spu_real _spu_offset - _spu_if _spu_sslkey _spu_it _spu_has _spu_to _spu_be 0x10 _spu_aligned
	btst	8, %i5
	bz	_spu_not_ssl
	nop	
	add	%i5, 8, %i5

_spu_not_ssl:
	cmp	%i1, 8
	bg	_spu_fail
	mulx 	%i1, 8, %i1		!# Calc _spu_index _spu_into _spu_toc

	setx 	_spu_table_of_context, %l1, %l2
	ldx 	[%l2 + %i1], %l3	!# l3 = _spu_toc _spu_of _spu_current _spu_operation
	ldx 	[%l3 + 0x40], %l4   	!# l4 = alignment array

    	!# set  CWQ data
	ldx	[%l3], %l2		
	ldx 	[%l2 + %i5], %l2	!# Get Control Word _spu_from _spu_array
	mov 	%l2, %i7		!# Save _spu_it _spu_for _spu_later
        srlx 	%i7, 48,  %l1
        and 	%l1, 1, %l1
        cmp 	%l1, 1
        bne,pn %xcc, _spu_write_cwq
	nop
	inc	%i6			!# increase _spu_interrupt _spu_counter

_spu_write_cwq:
    	!# write CWQ entry (%l6 points to CWQ)
    	stx  	%l2, [%l6 + 0x0]

    	!# source address
	ldx 	[%l3 + 0x8], %l2
	ldx	[%l4 + 0x8], %l1
	add	%l2, %i5, %l2
        add 	%l2, %l1, %l2		!# _spu_WARNING : Misaligned _spu_address
    	stx 	%l2, [%l6 + 0x8]

    	!# Authentication Key  Address (40-bit)
	ldx	[%l3 + 0x10], %l2
	ldx	[%l4 + 0x10], %l1
	add	%l2, %i5, %l2
        add 	%l2, %l1, %l2		!# _spu_WARNING : Misaligned _spu_address
    	stx 	%l2, [%l6 + 0x10]

    	!# Authentication IV   Address (40-bit)
	ldx	[%l3 + 0x18], %l2
	ldx	[%l4 + 0x18], %l1
	add	%l2, %i5, %l2
        add 	%l2, %l1, %l2		!# _spu_WARNING : Misaligned _spu_address
    	stx 	%l2, [%l6 + 0x18]

    	!# Authentication FSAS Address (40-bit)
	ldx	[%l3 + 0x20], %l2
	ldx	[%l4 + 0x20], %l1
	add	%l2, %i5, %l2
        add 	%l2, %l1, %l2		!# _spu_WARNING : Misaligned _spu_address
    	stx 	%l2, [%l6 + 0x20]

    	!# Encryption Key Address (40-bit)
	ldx 	[%l3 + 0x28], %l2
	ldx	[%l4 + 0x28], %l1
	add	%l2, %i5, %l2
        add 	%l2, %l1, %l2		!# _spu_WARNING : Misaligned _spu_address
    	stx 	%l2, [%l6 + 0x28]

    	!# Encryption Initialization Vector Address (40-bit)
	ldx 	[%l3 + 0x30], %l2
	ldx	[%l4 + 0x30], %l1
	add	%l2, %i5, %l2
        add 	%l2, %l1, %l2		!# _spu_WARNING : Misaligned _spu_address
    	stx 	%l2, [%l6 + 0x30]

    	!# Destination Address (40-bit)
    	ldx 	[%l3 + 0x38], %l2
	ldx	[%l4 + 0x38], %l1
	add	%l2, %i5, %l2
        add 	%l2, %l1, %l2		!# _spu_WARNING : Misaligned _spu_address
    	stx 	%l2, [%l6 + 0x38]

    	!# Make sure all these stores get to memory before we start
    	membar 	#Sync

    	!# Set the enabled bit and reset the other bits
    	or      %g0, 0x1, %g1
    	stxa    %g1,    [%g0 + ASI_SPU_CWQ_CSR] %asi

    	!# Kick off the CWQ operation by writing to the CWQ_TAIL
    	!# Now add 1 (actually 8*8B) to tail pointer
    	ldxa    [%g0 + ASI_SPU_CWQ_TAIL] %asi, %l2
    	add 	%l2, 0x40, %l2
    	stxa    %l2, [%g0 + ASI_SPU_CWQ_TAIL] %asi
    	ldxa    [%g0 + ASI_SPU_CWQ_TAIL] %asi, %l1
    	cmp 	%l1, %l2
    	bne,pn 	%xcc,    _spu_fail
    	nop

    	!# CWQ_SYNC operation...
    	ldxa    [%g0 + 0x30] %asi, %l1
# 479 "/import/_spu_n2-_spu_aus-_spu_localdir1/_spu_somePerson/_spu_n2cdmspp/_spu_verif/_spu_diag/_spu_assembly/_spu_uarch/_spu_lsu/_spu_src/_spu_template/_spu_spu_random_complete_CW_rand5.t"
	addcc	%l1, -1, %i0
	bne	_spu_fail			!# test for unexpected protocal error
	nop
# 484 "/import/_spu_n2-_spu_aus-_spu_localdir1/_spu_somePerson/_spu_n2cdmspp/_spu_verif/_spu_diag/_spu_assembly/_spu_uarch/_spu_lsu/_spu_src/_spu_template/_spu_spu_random_complete_CW_rand5.t"
    	ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l1
    	ldxa    [%g0 + ASI_SPU_CWQ_TAIL] %asi, %l1
# 488 "/import/_spu_n2-_spu_aus-_spu_localdir1/_spu_somePerson/_spu_n2cdmspp/_spu_verif/_spu_diag/_spu_assembly/_spu_uarch/_spu_lsu/_spu_src/_spu_template/_spu_spu_random_complete_CW_rand5.t"
    !# I want to check all the data
	or %g0, 260, %i0    
	or %g0, %g0, %g3   
_spu_check_msg:
	ldx 	[%l3 + 0x8], %l5	!# Needed _spu_for Inplace
	add	%l5, %i5, %l5
	ldx     [%l5 + %g3], %l1
	add     %g3, 0x8, %g3   !# i++
	addcc   %i0, -1, %i0
	bgt     _spu_check_msg
	nop
# 501 "/import/_spu_n2-_spu_aus-_spu_localdir1/_spu_somePerson/_spu_n2cdmspp/_spu_verif/_spu_diag/_spu_assembly/_spu_uarch/_spu_lsu/_spu_src/_spu_template/_spu_spu_random_complete_CW_rand5.t"
    !# I want to check all the data
	or %g0, 260, %i0    
	or %g0, %g0, %g3   
_spu_check_results:
	ldx	[%l3 + 0x38], %l5	!# Needed _spu_for Copy
	add	%l5, %i5, %l5
	ldx     [%l5 + %g3], %l1
	add     %g3, 0x8, %g3   !# i++
	addcc   %i0, -1, %i0
	bgt     _spu_check_results
	nop

	or %g0, 0x8, %i0    
	or %g0, %g0, %g3   
_spu_check_sfas:
	ldx	[%l3 + 0x20], %l5
	ldx     [%l5 + %g3], %l1
	add     %g3, 0x8, %g3   !# i++
	addcc   %i0, -1, %i0
	bgt     _spu_check_sfas 
	nop

    !# I want to check all the State 32 words + 2 bytes XY
	or %g0, 0x23, %i0    
	or %g0, %g0, %g3   
_spu_check_state:
	ldx	[%l3 + 0x28], %l5		!# Needed _spu_for Streamout
	ldx     [%l5 + %g3], %l1
	add     %g3, 0x8, %g3   !# i++
	addcc   %i0, -1, %i0
	bgt     _spu_check_state
	nop

	mov	%g5, %i5
	add	%l6, 0x40, %l6  	!# next CWQ address
	add	%i5, 8, %i5		!# next _spu_offset 
	add	%i4, 1, %i4		!# loop _spu_counter
	cmp 	%i4, 16
	bl	_spu_main_loop
	nop	

	!call 	check_int_cnt		!# Check #ints (assuming all have happened at this time!)
	nop

    	EXIT_GOOD

_spu_fail:
    	EXIT_BAD

_spu_check_int_cnt:
 	cmp %g0, %i6
        bne,pn %xcc, _spu_fail
	nop
        retl
	nop


! diag source

.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_8:
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_7:
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_6:
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_5:
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_4:
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
    	setx 0x0000deadbeefbad0, %l5, %l4

	!# Switch to hpriv mode
    	ta T_CHANGE_HPRIV

	or	%g0, 0x0, %g2		!# Operation Step
	or	%g0, 0x0, %g4		!# Operand   Step

	set	0x313, %g3
	stxa	%g3, [%g0] ASI_SPARC_PWR_MGMT
	wr	%g3, 0x4, %fprs

	mov 	%l7, 	%g1
	wrpr 	%g0, 	0x0, 	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x580, 	%hsys_tick_cmpr
	wr 	%l0, 	0x580, 	%sys_tick_cmpr
	wr 	%l0, 	0x580, 	%tick_cmpr
# 633 "diag.j"
	!# Execute Main Diag ..
        !# Write address of data region to load from in MA_PA reg, and check
	setx	MA_OPERANDS, %g6, %l7
          add	%l7, 3, %l7			!# WARNING : Misaligned address
          add	%l7, %g4, %l7
        wr %g0, 0x40, %asi
	stxa	%l7, [%g0 + 0x88] %asi 

ma_load:
	!# Write MAMEM address, start at 0
	or	%g0, 0x0, %l2
	stxa	%l2,	[%g0 + 0x90] %asi

	!# write MA_CTL
	setx    1, %g7, %l1
	stxa	%l1,	[%g0 + 0x80] %asi		!# LOAD

	!# setup mask to check for INVOP
	or	%g0, 0x1, %l2
	sllx	%l2, 21, %l2

	#! Try MA_SYNC operation...
wait:
	ldxa	[%g0 + 0xA0] %asi, %l1
	ldxa	[%g0 + 0x80] %asi, %l1
	andcc	%l1, %l2, %l1
	bne,pn %xcc,	fail
	nop


loop_0:
	!# write NPRIME
	setx	 0xd4e90cb55ea094be, %g7, %l2
	stxa	%l2,	[%g0 + 0x98] %asi

	setx	MA_OPERATIONS, %g6, %l7
	or	%g0, 3, %i0			!# OPSELECT
	umul	%i0, 16, %i0
	add	%i0, %g2, %i0

	!# write MA_ADDR
	ldx [%l7 + %i0], %l1
	stxa	%l1,	[%g0 + 0x90] %asi

	!# write MA_CTL
	add %i0, 8, %i0
	ldx [%l7 + %i0], %l1
	stxa	%l1,	[%g0 + 0x80] %asi		!# OPERATION

	!# setup mask to check for INVOP
	or	%g0, 0x1, %l2
	sllx	%l2, 21, %l2

	#! Try MA_SYNC operation...
wait2_0:	
	ldxa	[%g0 + 0xA0] %asi, %l1
	ldxa	[%g0 + 0x98] %asi, %l1		!# MA PA
	ldxa	[%g0 + 0x90] %asi, %l1		!# MA Addr
	ldxa	[%g0 + 0x88] %asi, %l1		!# MA PA
	ldxa	[%g0 + 0x80] %asi, %l1		!# MA CTL
	andcc	%l1, %l2, %l1
	bne,pn %xcc,	fail
	nop
# 703 "diag.j"
	add	%g2, 288, %g2			!# Operation Step  (16 * # of operations in queue)
	add	%g4, 164, %g4			!# Operand   Step  (always 164)
# 707 "diag.j"

loop_1:
	!# write NPRIME
	setx	 0x142dcaed1281c342, %g7, %l2
	stxa	%l2,	[%g0 + 0x98] %asi

	setx	MA_OPERATIONS, %g6, %l7
	or	%g0, 10, %i0			!# OPSELECT
	umul	%i0, 16, %i0
	add	%i0, %g2, %i0

	!# write MA_ADDR
	ldx [%l7 + %i0], %l1
	stxa	%l1,	[%g0 + 0x90] %asi

	!# write MA_CTL
	add %i0, 8, %i0
	ldx [%l7 + %i0], %l1
	stxa	%l1,	[%g0 + 0x80] %asi		!# OPERATION

	!# setup mask to check for INVOP
	or	%g0, 0x1, %l2
	sllx	%l2, 21, %l2

	#! Try MA_SYNC operation...
wait2_1:	
	ldxa	[%g0 + 0xA0] %asi, %l1
	ldxa	[%g0 + 0x98] %asi, %l1		!# MA PA
	ldxa	[%g0 + 0x90] %asi, %l1		!# MA Addr
	ldxa	[%g0 + 0x88] %asi, %l1		!# MA PA
	ldxa	[%g0 + 0x80] %asi, %l1		!# MA CTL
	andcc	%l1, %l2, %l1
	bne,pn %xcc,	fail
	nop
# 703 "diag.j"
	add	%g2, 288, %g2			!# Operation Step  (16 * # of operations in queue)
	add	%g4, 164, %g4			!# Operand   Step  (always 164)
# 707 "diag.j"

loop_2:
	!# write NPRIME
	setx	 0xa6e1970b03bd8d5a, %g7, %l2
	stxa	%l2,	[%g0 + 0x98] %asi

	setx	MA_OPERATIONS, %g6, %l7
	or	%g0, 13, %i0			!# OPSELECT
	umul	%i0, 16, %i0
	add	%i0, %g2, %i0

	!# write MA_ADDR
	ldx [%l7 + %i0], %l1
	stxa	%l1,	[%g0 + 0x90] %asi

	!# write MA_CTL
	add %i0, 8, %i0
	ldx [%l7 + %i0], %l1
	stxa	%l1,	[%g0 + 0x80] %asi		!# OPERATION

	!# setup mask to check for INVOP
	or	%g0, 0x1, %l2
	sllx	%l2, 21, %l2

	#! Try MA_SYNC operation...
wait2_2:	
	ldxa	[%g0 + 0xA0] %asi, %l1
	ldxa	[%g0 + 0x98] %asi, %l1		!# MA PA
	ldxa	[%g0 + 0x90] %asi, %l1		!# MA Addr
	ldxa	[%g0 + 0x88] %asi, %l1		!# MA PA
	ldxa	[%g0 + 0x80] %asi, %l1		!# MA CTL
	andcc	%l1, %l2, %l1
	bne,pn %xcc,	fail
	nop
# 703 "diag.j"
	add	%g2, 288, %g2			!# Operation Step  (16 * # of operations in queue)
	add	%g4, 164, %g4			!# Operand   Step  (always 164)
# 707 "diag.j"

loop_3:
	!# write NPRIME
	setx	 0x2e44c892ce43f103, %g7, %l2
	stxa	%l2,	[%g0 + 0x98] %asi

	setx	MA_OPERATIONS, %g6, %l7
	or	%g0, 11, %i0			!# OPSELECT
	umul	%i0, 16, %i0
	add	%i0, %g2, %i0

	!# write MA_ADDR
	ldx [%l7 + %i0], %l1
	stxa	%l1,	[%g0 + 0x90] %asi

	!# write MA_CTL
	add %i0, 8, %i0
	ldx [%l7 + %i0], %l1
	stxa	%l1,	[%g0 + 0x80] %asi		!# OPERATION

	!# setup mask to check for INVOP
	or	%g0, 0x1, %l2
	sllx	%l2, 21, %l2

	#! Try MA_SYNC operation...
wait2_3:	
	ldxa	[%g0 + 0xA0] %asi, %l1
	ldxa	[%g0 + 0x98] %asi, %l1		!# MA PA
	ldxa	[%g0 + 0x90] %asi, %l1		!# MA Addr
	ldxa	[%g0 + 0x88] %asi, %l1		!# MA PA
	ldxa	[%g0 + 0x80] %asi, %l1		!# MA CTL
	andcc	%l1, %l2, %l1
	bne,pn %xcc,	fail
	nop
# 703 "diag.j"
	add	%g2, 288, %g2			!# Operation Step  (16 * # of operations in queue)
	add	%g4, 164, %g4			!# Operand   Step  (always 164)
# 707 "diag.j"

loop_4:
	!# write NPRIME
	setx	 0x9118d10fc15e15a4, %g7, %l2
	stxa	%l2,	[%g0 + 0x98] %asi

	setx	MA_OPERATIONS, %g6, %l7
	or	%g0, 10, %i0			!# OPSELECT
	umul	%i0, 16, %i0
	add	%i0, %g2, %i0

	!# write MA_ADDR
	ldx [%l7 + %i0], %l1
	stxa	%l1,	[%g0 + 0x90] %asi

	!# write MA_CTL
	add %i0, 8, %i0
	ldx [%l7 + %i0], %l1
	stxa	%l1,	[%g0 + 0x80] %asi		!# OPERATION

	!# setup mask to check for INVOP
	or	%g0, 0x1, %l2
	sllx	%l2, 21, %l2

	#! Try MA_SYNC operation...
wait2_4:	
	ldxa	[%g0 + 0xA0] %asi, %l1
	ldxa	[%g0 + 0x98] %asi, %l1		!# MA PA
	ldxa	[%g0 + 0x90] %asi, %l1		!# MA Addr
	ldxa	[%g0 + 0x88] %asi, %l1		!# MA PA
	ldxa	[%g0 + 0x80] %asi, %l1		!# MA CTL
	andcc	%l1, %l2, %l1
	bne,pn %xcc,	fail
	nop
# 703 "diag.j"
	add	%g2, 288, %g2			!# Operation Step  (16 * # of operations in queue)
	add	%g4, 164, %g4			!# Operand   Step  (always 164)
# 707 "diag.j"

ma_store:	

        !# write MA_ADDR
	or %g0, 0x00, %l2
	stxa	%l2,	[%g0 + 0x90] %asi
# 719 "diag.j"
        !# Write result address into MA_PA reg

        setx	MA_RESULTS, %g7, %l6
          add %l6, 1, %l6			!# WARNING : Misaligned address
	stxa	%l6, [%g0 + 0x88] %asi 

	!# write MA_CTL
	setx    0x19f, %g7, %l1
	stxa	%l1,	[%g0 + 0x80] %asi		!# STORE

	!# setup mask to check for INVOP
	or	%g0, 0x1, %l2
	sllx	%l2, 21, %l2

	#! Try MA_SYNC operation...
wait3:	
	ldxa	[%g0 + 0xA0] %asi, %l1
	ldxa	[%g0 + 0x80] %asi, %l1
	andcc	%l1, %l2, %l1
	bne,pn	%xcc,	fail
	nop

idle3:

	!# do dummy loads into %g1

	setx	MA_RESULTS, %g7, %l7
	or	%g0, %g0, %l3
	!# setup loop count
	or	%g0, 164, %i0
more:	
  	ldx	[%l7+%l3], %l0	!# a[i]
	addcc	%i0, -1, %i0
	bgt	more
	add	%l3, 0x8, %l3	!# i++


join_lbl_0_0:

.text
    nop
    nop
    nop 
    ta T_GOOD_TRAP
    nop 
    nop 
    nop 
# 784 "diag.j"
.data
user_data_start:
scratch_area:

.align 8
MA_OPERANDS:
.xword 0xaa742ba263709bce
.xword 0x05feee8770b0178f
.xword 0x75694e23868997cb
.xword 0x63757f1eb87735ae
.xword 0x2de97df7c90d4143
.xword 0xef3b191e8dd694c1
.xword 0x35818d6f7a029430
.xword 0x02dd1b8eeacfca6f
.xword 0x5ec3b05aca1df6e8
.xword 0x40f640b345a683b6
.xword 0xd8fa3b87ab00d594
.xword 0xca2183e40c003e58
.xword 0x3e4907c33549beea
.xword 0x1012d25a0b716e6c
.xword 0x5fdcb4f0fae0ff77
.xword 0x3ffa9faf6693284f
.xword 0x7a95491892b9008e
.xword 0xd337e00034b77f11
.xword 0xbbfeadbef00538e3
.xword 0x664bb2df9f39f6c9
.xword 0xead424a4b0a8884b
.xword 0xa7ff0d87814f4578
.xword 0x78983960a8664494
.xword 0xb75b424dcc70cad9
.xword 0x5677ceb23f31a720
.xword 0xd919101fc55c81b5
.xword 0x425009e878b44fc6
.xword 0x5e1592e8c4305339
.xword 0xac4627f182142b78
.xword 0x7ffcee5d1c4e92c0
.xword 0x877cfc3a8fb0bc26
.xword 0x3bbc514bd2e72fd8
.xword 0x09616c858de1f8e8
.xword 0x0b5067444efcfdb0
.xword 0xdb44d63c6aa9f709
.xword 0xc9fb4b031af0c3e2
.xword 0x39d0d571625fa2b2
.xword 0xab3983696adc53e5
.xword 0x5d60133a9ab15f79
.xword 0x8d6f51a7d937f232
.xword 0x2b16e3c280900b37
.xword 0x308aa9921a4ccf9e
.xword 0x426217220cb6f6fa
.xword 0x81f396ff83d87cb6
.xword 0x5e8b2a47e3e1c884
.xword 0xcff05a5fad8995d7
.xword 0x5be5aedfd74e8b8f
.xword 0x18c4de231cae108e
.xword 0xea4bd913a6a795d1
.xword 0xbad51ccc480ba4cb
.xword 0x39a94ddbc9246d98
.xword 0x3dc3e9730f41d2b1
.xword 0xb86a1396a2e57c69
.xword 0x6ea5fe2ba942ab8e
.xword 0xb5c89e21634474fa
.xword 0xbc5d1365e3bf3e1b
.xword 0x4f219b4b1e9d283b
.xword 0x1db121dd73403689
.xword 0xdd5ec3a717f1c5a6
.xword 0x583a86193033ca84
.xword 0x4a1e6cc0e18ef0b7
.xword 0x36bc350d5b58afd2
.xword 0x9687507a6bd54880
.xword 0x0d1a7d85faf293d1
.xword 0x92261e67446ff8f6
.xword 0xa65191baf855006d
.xword 0xcad9bbf98bac8211
.xword 0xa7b5e86fa6763346
.xword 0xdb71390cef98de94
.xword 0xbc748e70e888e259
.xword 0xcc402159c7991295
.xword 0xfe43798331253062
.xword 0xbfa1ab70b6fdb324
.xword 0x850c8d8d21f30fba
.xword 0xb462c4dbe8c19639
.xword 0xe46c91ece2185ca5
.xword 0x7ae3fce442cd05ae
.xword 0x759ad673377c5220
.xword 0xe0b80beffd86517e
.xword 0xc40a81d75cf3c323
.xword 0x91f24ae0f16fcf82
.xword 0x21192bb5baba22fd
.xword 0x2d869924c237f734
.xword 0x9e2f661a3781c8ac
.xword 0x129cea2b7e8d7afc
.xword 0x356e7a14d5b4b084
.xword 0xef789b60432a2859
.xword 0x5d884ed38d3e6ef3
.xword 0x06faa019ee062b4f
.xword 0xd6ee1733bec6f674
.xword 0xe0e1f4de3a5b0e99
.xword 0x63a3cb448c25f029
.xword 0x64fb3c5f8958916c
.xword 0xcb8131391fe7ae49
.xword 0x0dd99ce47e648646
.xword 0xdaeec48c441ae5d2
.xword 0xdf4d66e019bfcd00
.xword 0x0d33826049ff55f2
.xword 0x25d6be653bd8100f
.xword 0x6102268ad56e8fa9
.xword 0x29d611ffab58dcf7
.xword 0x0fec043fe361d34b
.xword 0x3cc854d688791d70
.xword 0xbe53ac574fbeaab1
.xword 0xba9154a5677b2080
.xword 0x16c743020c87bf00
.xword 0x9e2531cbefdb1b32
.xword 0x5a3afa973e4b882d
.xword 0x6f8286e223bbce3e
.xword 0xa63b37ecc0121d7f
.xword 0x2f12de4ee460be85
.xword 0x1f7e20148ede43c7
.xword 0xf09b8c8a78736be9
.xword 0xeab7700f75de5f83
.xword 0xef0076cdce0a61e6
.xword 0x2162756f147ed648
.xword 0xa2b0b462682ba7fc
.xword 0x35644b422cb576ad
.xword 0x79997dc83a997f15
.xword 0x7a22ff39a4ac7d91
.xword 0x7e6a65b33f1cc092
.xword 0x63fbd728fe27d786
.xword 0x439d6f48e4933adb
.xword 0xb6844f3de58d47bc
.xword 0x6a0cca483829c840
.xword 0x528ab3b8d4fa9c22
.xword 0x2c2306d9abc47847
.xword 0x50a7ce65f15ce1a6
.xword 0xa10a7d2645836616
.xword 0x51b674556a57984a
.xword 0x143a64b216f51154
.xword 0x0b457c515f41b654
.xword 0x3e7ac275396dff3c
.xword 0xa688a37b979c77f0
.xword 0xd2ac59dc9359dec9
.xword 0x405ad31365d8a0e6
.xword 0xa9a4fce1d2bb4c83
.xword 0xdf4d5ac43ae20fe8
.xword 0xfb7cd330fa774504
.xword 0x441abcbbced3f490
.xword 0xdd8c162a7f2459f2
.xword 0x6b2f2f9e92974b7c
.xword 0xd7f9de7b14c59c53
.xword 0x722171810658d602
.xword 0x85b9602118fcd184
.xword 0x9b1bac26d58b33e3
.xword 0x51dc62af140bb80e
.xword 0xaea266e66c065bdd
.xword 0x421884f48efb3149
.xword 0xc0cd190123912aae
.xword 0xf99f20ebe16733b1
.xword 0x1c2ab27fc3375b41
.xword 0xffbc9661aa3b3afb
.xword 0x19e9041489b82d78
.xword 0xde751fcda85b6c42
.xword 0x14e7c2d7a5ef6f7b
.xword 0xe7daaa8bb04e0fc2
.xword 0xe58e5e5d9d1f7b92
.xword 0x45803fb5daa4c693
.xword 0xee1d068013c1775b
.xword 0x8bf1485dff2942a7
.xword 0xcce04bdeea22aca9
.xword 0x082aacd18773e1a6
.xword 0x090dac80a8bf9314

.align 8
MA_OPERATIONS:
.xword 0
.xword 0x61

.xword 0
.xword 0x179

.xword 0x80604020
.xword 0x214

.xword 0x356a
.xword 0x305

.xword 0x00000f6000408020
.xword 0x406

.xword 0x6a35
.xword 0x518

.xword 0x78285050
.xword 0x615

.xword 0x80604020
.xword 0x718

.xword 0x00287850
.xword 0x818

.xword 0x00287850
.xword 0x927

.xword 0x78285050
.xword 0xa17

.xword 0x64500000003c0000
.xword 0xb09

.xword 0x7766000000554422
.xword 0xc08

.xword 0x706200000054462a
.xword 0xd0b

.xword 0x784d015800423721
.xword 0xe01

.xword 0x804d096000504020
.xword 0xf00

.xword 0x0000056000408020
.xword 0x1006

.xword 0
.xword 0x117a

.xword 0
.xword 36

.xword 0
.xword 0x119

.xword 0x80604020
.xword 0x211

.xword 0x356a
.xword 0x317

.xword 0x0000016000408020
.xword 0x404

.xword 0x6a35
.xword 0x503

.xword 0x78285050
.xword 0x613

.xword 0x80604020
.xword 0x70c

.xword 0x00287850
.xword 0x809

.xword 0x00287850
.xword 0x927

.xword 0x78285050
.xword 0xa11

.xword 0x64500000003c0000
.xword 0xb0d

.xword 0x7766000000554422
.xword 0xc00

.xword 0x706200000054462a
.xword 0xd0b

.xword 0x784d075800423721
.xword 0xe03

.xword 0x804d056000504020
.xword 0xf02

.xword 0x0000046000408020
.xword 0x1003

.xword 0
.xword 0x1145

.xword 0
.xword 20

.xword 0
.xword 0x114

.xword 0x80604020
.xword 0x201

.xword 0x356a
.xword 0x31e

.xword 0x0000036000408020
.xword 0x402

.xword 0x6a35
.xword 0x518

.xword 0x78285050
.xword 0x610

.xword 0x80604020
.xword 0x70d

.xword 0x00287850
.xword 0x802

.xword 0x00287850
.xword 0x927

.xword 0x78285050
.xword 0xa10

.xword 0x64500000003c0000
.xword 0xb05

.xword 0x7766000000554422
.xword 0xc0a

.xword 0x706200000054462a
.xword 0xd00

.xword 0x784d085800423721
.xword 0xe00

.xword 0x804d086000504020
.xword 0xf02

.xword 0x0000036000408020
.xword 0x1005

.xword 0
.xword 0x1135

.xword 0
.xword 0x78

.xword 0
.xword 0x16e

.xword 0x80604020
.xword 0x20e

.xword 0x356a
.xword 0x313

.xword 0x0000046000408020
.xword 0x400

.xword 0x6a35
.xword 0x51c

.xword 0x78285050
.xword 0x623

.xword 0x80604020
.xword 0x717

.xword 0x00287850
.xword 0x80a

.xword 0x00287850
.xword 0x927

.xword 0x78285050
.xword 0xa07

.xword 0x64500000003c0000
.xword 0xb0f

.xword 0x7766000000554422
.xword 0xc0a

.xword 0x706200000054462a
.xword 0xd03

.xword 0x784d0f5800423721
.xword 0xe02

.xword 0x804d066000504020
.xword 0xf03

.xword 0x0000076000408020
.xword 0x1006

.xword 0
.xword 0x1129

.xword 0
.xword 0x6e

.xword 0
.xword 0x147

.xword 0x80604020
.xword 0x201

.xword 0x356a
.xword 0x312

.xword 0x0000026000408020
.xword 0x406

.xword 0x6a35
.xword 0x51f

.xword 0x78285050
.xword 0x60a

.xword 0x80604020
.xword 0x71c

.xword 0x00287850
.xword 0x816

.xword 0x00287850
.xword 0x927

.xword 0x78285050
.xword 0xa07

.xword 0x64500000003c0000
.xword 0xb06

.xword 0x7766000000554422
.xword 0xc09

.xword 0x706200000054462a
.xword 0xd04

.xword 0x784d0e5800423721
.xword 0xe02

.xword 0x804d026000504020
.xword 0xf00

.xword 0x0000006000408020
.xword 0x1006

.xword 0
.xword 0x1121


.align 8
MA_RESULTS:
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
SECTION .T_CWQ_DATA DATA_VA=0x10000
attr_data {
    Name = .T_CWQ_DATA
    hypervisor
}
	.data
.global _spu_user_data_start
_spu_user_data_start:
.global _spu_scratch_area
_spu_scratch_area:

	.align 16
.global _spu_spu_op_array
_spu_spu_op_array:
	.xword 7
	.xword 2
	.xword 2
	.xword 6
	.xword 5
	.xword 5
	.xword 2
	.xword 0
	.xword 3
	.xword 2
	.xword 1
	.xword 4
	.xword 4
	.xword 6
	.xword 0
	.xword 2
	.xword 2
	.xword 4
	.xword 6
	.xword 4
.global _spu_aes_cwd_array
_spu_aes_cwd_array:
	.xword 0xc06000601000003f
	.xword 0x406000001500000f
	.xword 0xc0e000e01800001f
	.xword 0xc0e000e01300003f
	.xword 0xc06000001800000f
	.xword 0x40e000001900003f
	.xword 0x406000a01800001f
	.xword 0x406100801b00003f
	.xword 0x40e000801800002f
	.xword 0x406000801000003f
	.xword 0x40e000601400000f
	.xword 0x40e100801500002f
	.xword 0xc06100e01900003f
	.xword 0xc0e100c01500000f
	.xword 0xc06000601500001f
	.xword 0xc06100a01300002f
	.xword 0x406000801500002f
	.xword 0x406100a01800000f
	.xword 0xc06000c01b00000f
	.xword 0xc06000c01900002f
.global _spu_des_cwd_array
_spu_des_cwd_array:
	.xword 0x40e000a00800001f
	.xword 0xc0e000800d000007
	.xword 0x406000600900000f
	.xword 0xc06100c00e00001f
	.xword 0x406000600c00001f
	.xword 0xc06100200c00001f
	.xword 0x40e000c00c00001f
	.xword 0x40e1000009000017
	.xword 0x406100e00d00000f
	.xword 0x40e100000800001f
	.xword 0x40e100200900001f
	.xword 0x406000a008000007
	.xword 0xc0e1002008000007
	.xword 0xc06100e00d000017
	.xword 0xc06100e00e00000f
	.xword 0xc06000200900000f
	.xword 0x406100200c00001f
	.xword 0x406000e009000017
	.xword 0x40e1000008000007
	.xword 0x40e0008008000007
.global _spu_copy_cwd_array
_spu_copy_cwd_array:
	.xword 0xa06100400000000a
	.xword 0x2060008000000004
	.xword 0x206000a00000000b
	.xword 0xa06100c000000008
	.xword 0x2060000000000008
	.xword 0x2061004000000000
	.xword 0xa06000e00000000f
	.xword 0x2060004000000009
	.xword 0x2061008000000003
	.xword 0xa060004000000006
	.xword 0x206100a00000000d
	.xword 0xa061008000000009
	.xword 0xa06100400000000a
	.xword 0xa06000e000000006
	.xword 0x206100c000000009
	.xword 0xa06100200000000f
	.xword 0x206000c000000003
	.xword 0x206000000000000e
	.xword 0x2060006000000009
	.xword 0x2061008000000005
.global _spu_crc_cwd_array
_spu_crc_cwd_array:
	.xword 0xc16003e40000000c
	.xword 0x416201480000000f
	.xword 0xc161030400000005
	.xword 0x4160010800000004
	.xword 0xc16003e400000007
	.xword 0x4162012800000000
	.xword 0x4160030400000007
	.xword 0x416301c80000000f
	.xword 0xc16103e400000009
	.xword 0xc163016800000002
	.xword 0xc16003c400000002
	.xword 0xc16001e800000003
	.xword 0x416303c400000005
	.xword 0xc16301e80000000f
	.xword 0xc16003440000000c
	.xword 0xc161010800000001
	.xword 0xc161030400000005
	.xword 0xc163012800000002
	.xword 0xc160038400000001
	.xword 0xc16001c800000000
.global _spu_hash_cwd_array
_spu_hash_cwd_array:
    .xword 0x41620f0100000008
    .xword 0x4160002100000023
    .xword 0xc160008100000036
    .xword 0xc16105c200000037
    .xword 0x416311220000000d
    .xword 0xc16301010000000e
    .xword 0xc1620a6100000029
    .xword 0xc1610f6100000037
    .xword 0x41600ee100000033
    .xword 0xc1631ac300000035
    .xword 0xc1600d2100000032
    .xword 0xc16204e10000001b
    .xword 0x4163018100000002
    .xword 0x4163028100000005
    .xword 0xc1620b2100000026
    .xword 0x416108a100000022
    .xword 0xc1600c2100000029
    .xword 0xc16108c100000039
    .xword 0xc163022100000006
    .xword 0x416000010000003c
.global _spu_hmac_cwd_array
_spu_hmac_cwd_array:
    .xword 0xc16201c5000f001b
    .xword 0x416205a5000f0018
    .xword 0x41620169000f0012
    .xword 0xc16307a9000f0035
    .xword 0x4162134a0013003d
    .xword 0xc1611c8b001f003f
    .xword 0x41620847001f0034
    .xword 0xc1630705000f0023
    .xword 0xc1610265000f0036
    .xword 0x41600d45000f0016
    .xword 0xc1600345000f000a
    .xword 0xc161000a00130034
    .xword 0xc1600225000f0004
    .xword 0x41630409000f001a
    .xword 0x41600949000f0040
    .xword 0xc1630689000f0017
    .xword 0x4160192b001f003a
    .xword 0x41600e65000f002e
    .xword 0xc1630c49000f002c
    .xword 0x41620709000f0035
.global _spu_rc4_cwd_array
_spu_rc4_cwd_array:
	.xword 0xc0e000600400000a
	.xword 0x40e100000000000d
	.xword 0xc0e0002004000000
	.xword 0x40e1004000000008
	.xword 0xc0e0004004000006
	.xword 0xc0e1004004000002
	.xword 0xc0e000c00000000d
	.xword 0xc0e000600000000b
	.xword 0x40e000c000000009
	.xword 0xc0e1002004000009
	.xword 0x40e100600400000b
	.xword 0x40e100e004000009
	.xword 0xc0e100c00000000c
	.xword 0xc0e100a00400000c
	.xword 0x40e000800000000b
	.xword 0xc0e1004000000009
	.xword 0x40e100c000000002
	.xword 0x40e100a00000000d
	.xword 0xc0e0006000000000
	.xword 0x40e0006000000007
.global _spu_sslkey_cwd_array
_spu_sslkey_cwd_array:
	.xword 0x1060096000000000, 0
	.xword 0x9060368000000000, 0
	.xword 0x906021c000000000, 0
	.xword 0x906033a000000000, 0
	.xword 0x10603d4000000000, 0
	.xword 0x10602f0000000000, 0
	.xword 0x106024e000000000, 0
	.xword 0x10601e4000000000, 0
	.xword 0x9060190000000000, 0
	.xword 0x906015a000000000, 0
	.xword 0x10602d6000000000, 0
	.xword 0x9060118000000000, 0
	.xword 0x9060218000000000, 0
	.xword 0x90602c2000000000, 0
	.xword 0x10600d4000000000, 0
	.xword 0x106036c000000000, 0
	.xword 0x906035a000000000, 0
	.xword 0x90602f6000000000, 0
	.xword 0x9060212000000000, 0
	.xword 0x90601d6000000000, 0
_spu_aes_key_array:
	.xword 0xc72affab8448708e
	.xword 0x7599fb8fb260e602
	.xword 0xf5e8bdb08ad0b3b8
	.xword 0x027d629bdb2b1977
	.xword 0xfa24407bf3c84eed
	.xword 0xfb1dc0bdf138b567
	.xword 0x2da6830d7ab592f0
	.xword 0xaabc49b27205ef10
	.xword 0x0ee06ae0900b0153
	.xword 0x1e3cedfe6e53e0a9
	.xword 0x63aff3874ebdcb6d
	.xword 0x1147538950784d6c
	.xword 0xad6d4f55d443a5c2
	.xword 0x3b9a434bce6344de
	.xword 0xcc8f322e5d883240
	.xword 0x6e1ff4fd2b2b06b2
	.xword 0x1f8b5eb57fba7ab4
	.xword 0x7dc4b1f83937905d
	.xword 0x824cc1f01520d19b
	.xword 0x651949d9f683144b
	.xword 0xd1cc152eac922b94
	.xword 0x4b062c168c2b7192
	.xword 0xbac9de7bf696072b
	.xword 0x036e3931de1894a3
	.xword 0xd77199dd08178828
	.xword 0x7f9828e960de7be8
	.xword 0x8f445e902bfad11a
	.xword 0x07204e26ccb40d12
	.xword 0x84d470cc3dcb8485
	.xword 0xed2d628253243b7e
	.xword 0xb0fa4f89caec2968
	.xword 0x1ae93dd382a024a2
	.xword 0xf3eee87d01589aea
	.xword 0x46a545c983b1f239
	.xword 0xcf6ea5fba28602cc
	.xword 0x82cd086f0ea77595
	.xword 0x4c8c8f8960e6e403
	.xword 0x76bd1d49bbca756a
	.xword 0x7cbe6c5c029fa211
	.xword 0x238de6b6ead19c18
	.xword 0x215ee838071bc4b5
	.xword 0xcde7f477d9f2a0ba
	.xword 0x715efeaa18c64e55
	.xword 0x89db552bddc9b4e1
	.xword 0x0286b59c04e74227
	.xword 0x7c5557334c591408
	.xword 0xb0ef6e57c9872776
	.xword 0xe7bbcfe15c34bc99
	.xword 0x1470761cf55fefbf
	.xword 0xe6f4a6af41bf2208
	.xword 0x46b5618e7c5a52d8
	.xword 0x33570d9518ce41e0
	.xword 0xd679ba810425f602
	.xword 0xc76cac1888132a0b
	.xword 0x6be24d282c81bf10
	.xword 0xf477f428546fa94d
_spu_aes_iv_array:
	.xword 0x0bc49a1647e59d80
	.xword 0xd9aa3a85c0a1fed3
	.xword 0x57e95b2bd53869a7
	.xword 0xb5e1039abadfad59
	.xword 0x5671a5e19b567963
	.xword 0xdd90354e53d35855
	.xword 0x43e14bf646f99179
	.xword 0x47946da57bb29322
	.xword 0x0386e6391480216c
	.xword 0x34e2e64308bfc54c
	.xword 0x195ef9d44ddea31b
	.xword 0x8d0a8247d427db0c
	.xword 0xb034220040bcf1e1
	.xword 0x5447caa8dda2c5a1
	.xword 0x8d5c68465767cf2f
	.xword 0x32cc243f353a73d3
	.xword 0x45a148f0dbdd9a10
	.xword 0xa6e85cf77a7572e6
	.xword 0x6f5869d1b892c52d
	.xword 0x679b9cdc5711ab3b
	.xword 0x1ae9740c754d4dfa
	.xword 0x5517920e8c4fd4c2
	.xword 0x94e4aa1dc29f51f3
	.xword 0x38f4551573f25b84
	.xword 0x8dde9b1a6b35c118
	.xword 0xbcbe80e79e89d15e
	.xword 0xd41d35c5191a53b0
	.xword 0x29ffd0bedcec6d91
	.xword 0x78bc87baf238e0f5
	.xword 0xd8c8c49a47ca175b
	.xword 0xe208fe3218f43423
	.xword 0x458f5d4058ef6a1b
	.xword 0xb9e760e897d4fe5d
	.xword 0x0797b04aa79cbdf4
	.xword 0x75fa154e10dd3eb4
	.xword 0xa6b7db2cd24201d4
	.xword 0xe376e7c47908704a
	.xword 0x697728f1010dd6d8
	.xword 0xdea66a7226da8b33
	.xword 0x46ad0cf5ad72480e
	.xword 0xa90c609c0d128d07
	.xword 0xc9c4d63c46288234
	.xword 0xb5442fa84aa90524
	.xword 0x6e6115e18d5831cd
	.xword 0x621e1498ab1ad55d
	.xword 0xfeccb3a64041cecd
	.xword 0x2ec1b7951a2ed97d
	.xword 0x99b34dea7d8b31a7
	.xword 0x39c509550cb9091d
	.xword 0xdabd106a72bcc0d6
	.xword 0x4533e9ceef60eb1e
	.xword 0xcdb0783bd849c5a2
	.xword 0xce98c3da16e8f109
	.xword 0xb1f43185ab9b4542
	.xword 0xbc0a3cef28607f2e
	.xword 0x23d7cb4faed33781
	.xword 0x04d6ddda4bc82d7b
	.xword 0x038e3c560d3a8dc8
	.xword 0x9b7d0b129a7604f7
	.xword 0x2226eaa2a24134f4
_spu_aes_alignment_array:
	.xword 6
	.xword 4
	.xword 2
	.xword 11
	.xword 15
	.xword 8
	.xword 0
	.xword 4
	.xword 0
	.xword 0
	.xword 12
	.xword 11
	.xword 11
	.xword 14
	.xword 8
	.xword 2
	.xword 1
	.xword 8
	.xword 0
	.xword 1
	.xword 9
	.xword 13
	.xword 5
	.xword 8
	.xword 14
	.xword 8
	.xword 10
	.xword 5
	.xword 3
	.xword 8
	.xword 1
	.xword 1
	.xword 12
	.xword 7
	.xword 6
	.xword 1
	.xword 8
	.xword 10
	.xword 2
	.xword 2
	.xword 1
	.xword 12
	.xword 3
	.xword 13
	.xword 11
	.xword 12
	.xword 10
	.xword 3
	.xword 15
	.xword 12
	.xword 11
	.xword 0
	.xword 9
	.xword 7
	.xword 8
	.xword 4
	.xword 9
	.xword 4
	.xword 5
	.xword 2
	.xword 10
	.xword 0
	.xword 2
	.xword 11
	.xword 8
	.xword 0
	.xword 0
	.xword 3
	.xword 9
	.xword 14
	.xword 0
	.xword 14
	.xword 10
	.xword 5
	.xword 1
	.xword 14
	.xword 8
	.xword 14
	.xword 3
	.xword 3
	.xword 11
	.xword 8
	.xword 2
	.xword 12
	.xword 9
	.xword 13
	.xword 9
	.xword 2
	.xword 11
	.xword 4
	.xword 13
	.xword 7
	.xword 0
	.xword 2
	.xword 12
	.xword 5
	.xword 8
	.xword 14
	.xword 1
	.xword 5
	.xword 15
	.xword 10
	.xword 5
	.xword 2
	.xword 5
	.xword 12
	.xword 8
	.xword 3
	.xword 5
	.xword 11
	.xword 6
	.xword 1
	.xword 15
	.xword 1
	.xword 5
	.xword 8
	.xword 12
	.xword 6
	.xword 0
	.xword 15
	.xword 14
	.xword 2
	.xword 5
	.xword 4
	.xword 1
	.xword 1
	.xword 15
	.xword 2
	.xword 12
	.xword 5
	.xword 4
	.xword 12
	.xword 0
	.xword 5
	.xword 14
	.xword 0
	.xword 2
	.xword 7
	.xword 15
	.xword 3
_spu_aes_src:
	.xword 0x87b2c17c6db02d69
	.xword 0x4defc4b71738fe4b
	.xword 0x4cdd86269e9d6757
	.xword 0xf97592db03634cd6
	.xword 0xc8d5a3cd03eaf9a3
	.xword 0xfa448d1a57cf48c4
	.xword 0x8d290a124a1750ed
	.xword 0xa9ba41890bda2a11
	.xword 0xd2b91a6c226f2a4d
	.xword 0x5b5152cadb3b704d
	.xword 0x50526c459814d1c2
	.xword 0xd5e28c93de266994
	.xword 0x5ff5e3a3192282a7
	.xword 0xcc4ec8c59a7a34e0
	.xword 0xb251e92128406a96
	.xword 0xc2e726d0d40eda16
	.xword 0xb6ced1a7f2fcac50
	.xword 0xa099702064ca822b
	.xword 0x2121426220ef5083
	.xword 0x6df6a39982a27b32
	.xword 0x7ad5719d1f4bc98b
	.xword 0x27e853c967d29f32
	.xword 0x887d5655187f0511
	.xword 0xb838d24e1d9d0608
	.xword 0x8c1507f319adc615
	.xword 0x6516ebb6e6a37164
	.xword 0xedc1b6e405249675
	.xword 0x6896225051f1bca9
	.xword 0x47c7ef721b204e17
	.xword 0xaa8c63663cb161e6
	.xword 0x0ca9f4cad1a59929
	.xword 0xb83a2d974e76803e
	.xword 0x1a2d3a3d9cc7038e
	.xword 0xac865b4f28313ddd
	.xword 0x66e79e0967a6d92f
	.xword 0x7b4064b6b0c21686
	.xword 0x6467c9936a6b6077
	.xword 0xd0601730ef51c9cd
	.xword 0xc26c48f7ecff0023
	.xword 0x883d1ef86203b897
	.xword 0x6db58b4dd6acb3ce
	.xword 0x28d364e8f2b59fc1
	.xword 0x8903d4bb6be59e13
	.xword 0xb1341cf3b0fa3cdb
	.xword 0xad09f5f75aa750c7
	.xword 0xd9e45c1e025d8ba6
	.xword 0x4d694d4fe2b68775
	.xword 0xc180eb37558fb21f
	.xword 0xdd77df83e11df367
	.xword 0x23195e8198cc0747
	.xword 0x2aa9275f9c154dbd
	.xword 0x4616e1ba4c159797
	.xword 0x7e854105c31be864
	.xword 0x45482f957f1694be
	.xword 0x3e1f6a9366762500
	.xword 0x8db3716bcc492c58
	.xword 0xa3e4958ea51be038
	.xword 0x97a3bf629cfebffa
	.xword 0x161f161887c9361c
	.xword 0x89ed4a8406d0a674
	.xword 0x218f0088067817e4
	.xword 0x508f47e577cb4018
	.xword 0x24d9d9e2720cb7ea
	.xword 0xcea5d25f3afc42d2
	.xword 0xec855931ddedea46
	.xword 0x9295d1fadac2062a
	.xword 0xc6dbb48739e14b9a
	.xword 0xc6a57fb8b985060a
	.xword 0x6f2bffc2f59fdf3d
	.xword 0x370c8adc3cd96b75
	.xword 0x700e6e3c8fa8a732
	.xword 0x494939070715c4c0
	.xword 0xc8adb80bc98bd052
	.xword 0xe478e3a38c62645f
	.xword 0x60392a968b520436
	.xword 0xef8c8627797cccca
	.xword 0x0ab69940fbd8cdaa
	.xword 0x7b06ae87165feb59
	.xword 0xa0dfdaf77954d0d9
	.xword 0x09ebd82d3d84393a
	.xword 0xfd24b237590b1aab
	.xword 0xa2d3135651b42344
	.xword 0xd2af1a79400e14fd
	.xword 0x7edea7607c8901ba
	.xword 0xa78ec95ffd78ae96
	.xword 0x8f7d2cab5ac1c61d
	.xword 0xa081a8a9f2603c46
	.xword 0x4a8bf5c8cb3bcdae
	.xword 0xba4a64936d6e2af4
	.xword 0x4b13e22d288760e9
	.xword 0x9431e819e82759d1
	.xword 0x3e7f8df5e1220c60
	.xword 0x665f86f6bb1354f1
	.xword 0xbe75184dc4123390
	.xword 0x67fb4a4f41055d75
	.xword 0x862f3f896d833641
	.xword 0x85ffeacf21820e85
	.xword 0x0606f041ddffb8a6
	.xword 0x578308cfda86a669
	.xword 0xd0c86ab519d4649d
	.xword 0xfdaea3863300c786
	.xword 0xab0a37bdd7a663d5
	.xword 0x4b854f23357342cb
	.xword 0x6333033112430da3
	.xword 0x383d3c687dd90815
	.xword 0x04bc8a9ba3ac27a2
	.xword 0xfc259bdc68dba23a
	.xword 0x0dd57cd1a909f716
	.xword 0x1380db3615317054
	.xword 0x51e1b18c891b0ac0
	.xword 0x27ae1519bd776ba6
	.xword 0xc4b7349a7e3b076b
	.xword 0xb8c0b05613ecb3af
	.xword 0xf250e8cbb12ea5ad
	.xword 0xf14aa4d2123d6ce0
	.xword 0xfa3c0a19f2693c8b
	.xword 0x3e6e69f104e4d323
	.xword 0xf44b56b24dc6e3db
	.xword 0xd998f96a5f8edef6
	.xword 0x8b172ae3ad9d0962
	.xword 0xce8efbd094ead6cd
	.xword 0x13441b3b2ab3b404
	.xword 0x1a52df6030f851a0
	.xword 0x29dea3990d3bc806
	.xword 0x987588a90cfce3a6
	.xword 0x770f8c88f893a1c5
	.xword 0xf1d07128ae4b871a
	.xword 0x87f4c0c7ee68f90e
	.xword 0x0f76265f964f48a4
	.xword 0x4fd8444ebe75c534
	.xword 0x551a788f0a50769a
	.xword 0x05de842c1288c803
	.xword 0xd716726a0ef18c18
	.xword 0xd6b30e61afd1d852
	.xword 0x78cb98cb82a469c8
	.xword 0xabab8532fded38f3
	.xword 0x5ebbf8d440f9ca16
	.xword 0x1941853fccbbeff4
	.xword 0x4a0e09bcb3eedc37
	.xword 0x06c6e2b8908ca18f
	.xword 0xeb6be981d5c646fe
	.xword 0xfdacea17cc66d52b
	.xword 0x5d2a11ceed840934
	.xword 0x559cf57945f9438a
	.xword 0x602e94645c7bdfd9
	.xword 0x0c01448c4ae5d567
	.xword 0xde6e05404c8ee16e
	.xword 0x33d9ebe87a386b14
	.xword 0xe8b10c5fa5c7acf0
	.xword 0x19165ed950a810cd
	.xword 0x7525b989ba482a2b
	.xword 0xd02f3a5fd609858c
	.xword 0x6647baa6899dcfc3
	.xword 0x602693f9c0e1072b
	.xword 0x74077438f60b72c3
	.xword 0x582870e74c21fb0d
	.xword 0x782c9fbfbf9e0304
	.xword 0x8a04621f3f36a4d8
	.xword 0xe3f1fa511075d96b
	.xword 0x921cfdb9a2ceb12f
	.xword 0x481c0f53cdcb3c36
	.xword 0xa90b7beec88c3db9
	.xword 0x878cbb3c09d032d3
	.xword 0x00a124ce7aa73827
	.xword 0x2e7f7c7f2c30a9b3
	.xword 0xa0b28357301dd68e
	.xword 0x7b0f0971d2f2361d
	.xword 0xe7eaf741eed2130f
	.xword 0xfbb31190c206da1a
	.xword 0x8f5b52d35e4afb8b
	.xword 0x419d1d28480adda8
	.xword 0x0ee5beafa96ee2b9
	.xword 0xa9d00dd3adacd9d9
	.xword 0x63776a71702d50f3
	.xword 0xb9cde6ebe06764c2
	.xword 0x587652862dd8a02c
	.xword 0xc6fae9b11f1b8984
	.xword 0x0ff5fdf44b816ca0
	.xword 0xf98e166d7b00b980
	.xword 0x72032cead5228e97
	.xword 0x8bbdb60637aacebb
	.xword 0xf9fff669e8acb9bc
	.xword 0x58bd16aaf2f7f911
	.xword 0x5e6267ee368b84a7
	.xword 0x38642919472e259f
	.xword 0x80c61f42eb71938a
	.xword 0x11f01af896dac8a0
	.xword 0x393aaa1ef68ae7ac
	.xword 0x9b7ef14f3e4090b6
	.xword 0x2e706d584448d3f2
	.xword 0xae6447568121e209
	.xword 0x0d36e42de945e5c6
	.xword 0x6af6a36165d38454
	.xword 0x5410fcf13749d9fd
	.xword 0xf29197103867fd2a
	.xword 0x23379fcb6baf60a8
	.xword 0xeb07eb3904f94625
	.xword 0xd09b1bdf6119fd0b
	.xword 0x8581901e8ccb0072
	.xword 0xed1641fa17b13f06
	.xword 0x0f86d1abc98c113a
	.xword 0x497a5a34f170a1e1
	.xword 0x7263b2c83d57412f
	.xword 0x21ceaf991331f8c2
	.xword 0x2b09381e22e20787
	.xword 0xc5a8e32ec5e20d16
	.xword 0x4746152576d8be4f
	.xword 0x8523976b67a21bd4
	.xword 0x3df001701151f6d4
	.xword 0x33c1169d88f40c2b
	.xword 0xf8513e441f651f48
	.xword 0xbc8f8f2cf51af0d2
	.xword 0x9d3520c056da8ea1
	.xword 0x7d0cd58b874dfac7
	.xword 0x88756be565979fcb
	.xword 0x508a9c3d97538654
	.xword 0x4104c7252717da0e
	.xword 0x630b5d71fa22d4ae
	.xword 0x82d738c3097e590f
	.xword 0x3f655763ab24c865
	.xword 0x8f2bb0baf19b43a9
	.xword 0x248a0f0a3c2dfd75
	.xword 0x80c7c3bfe49a17db
	.xword 0xe8905d743c56e8f6
	.xword 0x28670b668f93bced
	.xword 0x6ae4e2dbbc5192bd
	.xword 0xc50660edbe87293b
	.xword 0xb7bed4ac16908971
	.xword 0xb009c78359446f20
	.xword 0xfbd97b065cba41cb
	.xword 0x766247974cf329cb
	.xword 0x1029c031cfe995ac
	.xword 0x2d3dda134a9a2345
	.xword 0x80cc1e406bdf12aa
	.xword 0x30cad7da03c081c3
	.xword 0x4d314bfa39f5acaa
	.xword 0x34bbe68cab59ac14
	.xword 0x16be8dd0cc26f83c
	.xword 0x3bb76da3a207fe6d
	.xword 0xc2c3c266bcb933b3
	.xword 0x1029ec63e3e55f59
	.xword 0x9021312921c32119
	.xword 0xd677b396a6e128a9
	.xword 0x43d3dddd32ead287
	.xword 0x218846cf2a0659b5
	.xword 0xa0ce1966146a9a7c
	.xword 0x01f2175803ab46ce
	.xword 0xec05d361513808da
	.xword 0xf15461dcdb4835cd
	.xword 0x2f5ecf9982b18525
	.xword 0xdfcd91dd51862431
	.xword 0x85934e45898b002c
	.xword 0x28913ed10eb0780a
	.xword 0x420e125212be2be1
	.xword 0xffcdb35f1f01745a
	.xword 0x1d40323143e554d3
	.xword 0xc98989eaf98dc986
	.xword 0xad50303070bdaba2
	.xword 0xb5db7186262c2046
	.xword 0x394ab4d7c4035047
	.xword 0x6569e9dfad694474
	.xword 0xb90cbe681606848e
	.xword 0xe846cc0987281139
	.xword 0x2ce40e128897b0af
	.xword 0xecadc87b930d0207
	.xword 0x02b49f6f07a53aa3
	.xword 0x69bc2a59af027eeb
	.xword 0xce3dcff8bbb30238
	.xword 0xc53c6e9b8af96a7a
	.xword 0x08d1d5276deabc8b
	.xword 0xa053f6d3845ca943
	.xword 0x4545a12d5dc29c33
	.xword 0xf5b72ce16a7e048a
	.xword 0x018cd9e36ebcbf7f
	.xword 0x2a53f3a51dac49ac
	.xword 0x0c299515e1976b8d
	.xword 0x63bfde1b939ab9ff
	.xword 0x6d540409b05cf509
	.xword 0x9908cb1d782dcf5a
	.xword 0x1b05ac4464016454
_spu_aes_dest:
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
_spu_aes_auth_key:
	.xword 0x989bd4016558693b
	.xword 0x2f1a65cb286ac507
	.xword 0xf589b56aca6edd04
	.xword 0x769ea6d868be071f
	.xword 0xb51f2620099bd73a
	.xword 0x6a8f271b0e69a443
	.xword 0xc853b98a3b38dadc
	.xword 0xd11b0376a3f436d9
	.xword 0x986af67050761f0f
	.xword 0xfd1842cf2bfcaf64
	.xword 0x25f2656428f6159d
	.xword 0x7b2116044e0c1d89
	.xword 0x30bbe7017459eb17
	.xword 0x38ccd04a8d7459b9
	.xword 0x3b3b607117e829bf
	.xword 0xc794a1b029ce0513
	.xword 0x5752ee45ffa1350c
	.xword 0xa9c45d6bbae961f5
	.xword 0x88ba1c76b6b50ce0
	.xword 0x414fe5a4e9f3fdb9
	.xword 0x099d0d3478f9bc69
	.xword 0x36724136396d5658
	.xword 0x108d3c6a1a7141af
	.xword 0x4bc360f52a45a794
	.xword 0x932c4788d96d48f1
	.xword 0x5bc3d3b9c88e96e0
	.xword 0x85b7b6b7b051bb06
	.xword 0x91238b6af6fddf91
_spu_aes_auth_iv:
	.xword 0x90f6f4b475ecd320
	.xword 0x52913ae7459f38bc
	.xword 0xee865899acae4c51
	.xword 0xff9da02085ab0215
	.xword 0x2be57f4a26ee1e09
	.xword 0xf2ea806b635f9cf4
	.xword 0x8ec1285a7463a73f
	.xword 0x2d9d7919d1181e09
	.xword 0x54698c36dde53f9c
	.xword 0x3eb593074be3068f
	.xword 0x1a396c6b9a81f5a8
	.xword 0x28cb947471c8e92b
	.xword 0x2e4a8345eb0ff59d
	.xword 0x302eae1efd248302
	.xword 0x1bf6cd2efd874fc4
	.xword 0xb81896daf9ff4e97
	.xword 0x23d1b32f11043f94
	.xword 0x389afb7a3c14ed26
	.xword 0xcaee0321d719a8d8
	.xword 0xeacb7df7bb505a3c
	.xword 0xce8fb97783e8647d
	.xword 0xdf75efc7fe63b79c
	.xword 0xcf85de7ddbe1d800
	.xword 0x05552592a434c731
	.xword 0x197850feac178528
	.xword 0x8be9d78ef227cee9
	.xword 0x45041b810a395d58
	.xword 0xe73a1cc313c0980a
_spu_aes_fas_result:
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
_spu_des_key_array:
	.xword 0x36166cb9bc86d4fc
	.xword 0xd22e48907d719073
	.xword 0xf3c6e2cc967d2cdc
	.xword 0x7a563746d72ff635
	.xword 0xcdf16e236e75ec6e
	.xword 0x2c04a018e0751f80
	.xword 0x50521dcf880567d2
	.xword 0x237dc7cf392135a4
	.xword 0xa8bf87ff3968fb1a
	.xword 0x05797c42e5c53be5
	.xword 0x492ad378d5f62f44
	.xword 0x9f02521c32e4954b
	.xword 0xc4f3826712641184
	.xword 0xfbe430f93a8692b7
	.xword 0x54e4a2ddb0c17e6d
	.xword 0x1f4ec041a2c778d9
	.xword 0xe27c5025caddb10a
	.xword 0x2f6b44ab214294ca
	.xword 0xf054706b48811570
	.xword 0x8ce6d569f12bf0d9
	.xword 0xaca40c8dfdd57cd9
	.xword 0x5c5fc3b9f32b68b3
	.xword 0x2af13e7622b0f983
	.xword 0x4ad3d6037ed0e623
	.xword 0x615e52d920b4721a
	.xword 0xd24d6c031a3b5a90
	.xword 0xfbbf3d1d6f732fe0
	.xword 0x5ccfdc5553ca7b33
	.xword 0x65c4c99b5afa22c9
	.xword 0x9ed8b2e799ab6dda
	.xword 0x0ab3ae37382a7b9f
	.xword 0x0663f31584fe8174
	.xword 0xed371bee10c9d456
	.xword 0x5c4c0ebac920487b
	.xword 0x61fef0e0eca4491e
	.xword 0xb2f344527152e14c
	.xword 0x30fc5a44c29e1179
	.xword 0x596a61587c8bc39e
	.xword 0x63f3e5e867cfc14e
	.xword 0xd274ebc5debc2cf5
	.xword 0xa8bb2cbd6f35fd35
	.xword 0x2071d71af80c0a76
	.xword 0x5ebe5fc93bc2061b
	.xword 0x58af3296e35025c6
	.xword 0x3868f020761e224b
	.xword 0x7fbe2150aa88c635
	.xword 0x99940bdaf868b2af
	.xword 0x9477c61eceaf6252
	.xword 0x0b1cce7444ea2ba1
	.xword 0x8dd270c6ae91177a
	.xword 0xb106489b85f3fec6
	.xword 0x656ae743fffa4f66
	.xword 0xbb08f9d135c08618
	.xword 0xa64ca9bbfaa8e981
	.xword 0x3b993f1715a512e0
	.xword 0x2de684f4ee0f5766
_spu_des_iv_array:
	.xword 0xbdff28b0d87389d3
	.xword 0x493c87136e36ed80
	.xword 0xf813de077370f2e3
	.xword 0x24e945adc7084ecd
	.xword 0x414cd91e5f4a1767
	.xword 0xc708d4f9a927184b
	.xword 0x5ba0626425ae7544
	.xword 0xfd0ae5a1c6ea59aa
	.xword 0x5247a9d4b1d97e37
	.xword 0xa0d109c02e9d13d6
	.xword 0x20ce0074b8250f28
	.xword 0x9a45df982b0bcd52
	.xword 0x60d09bfef6d306c8
	.xword 0x4759cf7d6b6f52f8
	.xword 0xd19bce77d2e3eafd
	.xword 0x3b96452c8a26f035
	.xword 0x165a1b1e787a0917
	.xword 0xe890cbdac3277ffe
	.xword 0x1d4ce338d166b958
	.xword 0x7eb4a999a48f5638
	.xword 0x63bf5c2489da9aa9
	.xword 0xcb4bba4a5e53a204
	.xword 0xb48afc94b95a6fc7
	.xword 0x2573c6bc6d0a3bc6
	.xword 0x7cd531861bc73889
	.xword 0xfa480b849f1ca5dc
	.xword 0x4791dc3fa3fae54c
	.xword 0xa22b10aca096108f
	.xword 0x1f650f9b531034f1
	.xword 0x805c8a09937029a9
	.xword 0xcb73177b1a64e391
	.xword 0x55dd3d455f2c0df7
	.xword 0x2f37a7f51d5cd634
	.xword 0x22f33d7054e9eadb
	.xword 0x1ae02d4df73ad1c2
	.xword 0x47cbcc859e4cc594
	.xword 0xa87492cefe9986eb
	.xword 0xef2143ed69b80bd1
	.xword 0x56fccd988dcad804
	.xword 0x264f3b78fc21b02a
	.xword 0x58aefa43f0b05ec4
	.xword 0x0109c2af861ff5a8
	.xword 0x119087cf8a156d27
	.xword 0x50086bf69fb7e309
	.xword 0x948fcaa5450237f9
	.xword 0xfad75099db9faec6
	.xword 0x4aeda63c08f590f9
	.xword 0x1ac47a922f671f23
	.xword 0x095f761101905638
	.xword 0x8b440d4694ada7fb
	.xword 0x89b67ba128909b9c
	.xword 0xe1d689dc3bae8f0d
	.xword 0x0b3d214a456e52de
	.xword 0xdb94440c5f7d0b35
	.xword 0x0fb176e46cfe9de5
	.xword 0x83be83b0c239937b
	.xword 0xc84cc81d52683e9b
	.xword 0x606ffd1adac87e4f
	.xword 0x86ab1ddfcd498d75
	.xword 0x7df99333247ff36e
_spu_des_alignment_array:
	.xword 9
	.xword 0
	.xword 6
	.xword 11
	.xword 10
	.xword 10
	.xword 6
	.xword 6
	.xword 15
	.xword 2
	.xword 8
	.xword 0
	.xword 14
	.xword 7
	.xword 10
	.xword 2
	.xword 6
	.xword 13
	.xword 12
	.xword 4
	.xword 6
	.xword 7
	.xword 14
	.xword 15
	.xword 6
	.xword 6
	.xword 12
	.xword 14
	.xword 14
	.xword 5
	.xword 15
	.xword 5
	.xword 8
	.xword 2
	.xword 15
	.xword 0
	.xword 3
	.xword 0
	.xword 4
	.xword 3
	.xword 7
	.xword 9
	.xword 15
	.xword 11
	.xword 5
	.xword 5
	.xword 15
	.xword 7
	.xword 5
	.xword 7
	.xword 0
	.xword 0
	.xword 6
	.xword 10
	.xword 2
	.xword 2
	.xword 0
	.xword 12
	.xword 6
	.xword 6
	.xword 8
	.xword 4
	.xword 2
	.xword 11
	.xword 15
	.xword 11
	.xword 6
	.xword 9
	.xword 15
	.xword 2
	.xword 12
	.xword 4
	.xword 10
	.xword 14
	.xword 7
	.xword 11
	.xword 2
	.xword 5
	.xword 11
	.xword 11
	.xword 12
	.xword 12
	.xword 4
	.xword 9
	.xword 12
	.xword 14
	.xword 1
	.xword 2
	.xword 9
	.xword 8
	.xword 7
	.xword 7
	.xword 5
	.xword 14
	.xword 5
	.xword 2
	.xword 15
	.xword 5
	.xword 3
	.xword 15
	.xword 0
	.xword 14
	.xword 5
	.xword 9
	.xword 1
	.xword 2
	.xword 4
	.xword 15
	.xword 13
	.xword 0
	.xword 11
	.xword 7
	.xword 0
	.xword 14
	.xword 15
	.xword 4
	.xword 14
	.xword 2
	.xword 9
	.xword 11
	.xword 6
	.xword 2
	.xword 13
	.xword 1
	.xword 15
	.xword 3
	.xword 4
	.xword 1
	.xword 5
	.xword 3
	.xword 7
	.xword 13
	.xword 14
	.xword 6
	.xword 9
	.xword 14
	.xword 15
	.xword 15
	.xword 9
	.xword 15
_spu_des_src:
	.xword 0x8da3a10a45b15ba1
	.xword 0x4b81228fef5831f5
	.xword 0x0d24b0b07ce731e3
	.xword 0xb31d68e4d54a2b75
	.xword 0x97ab50bef629803d
	.xword 0xbe4baec9de7a32a1
	.xword 0xa900f82124101b95
	.xword 0xeeb83dec481eddde
	.xword 0x49aa52f3cededb7e
	.xword 0xb03e330e5cb1912f
	.xword 0x764d04e2607495ba
	.xword 0x18cc29fca761a923
	.xword 0xbb68c96cc8319463
	.xword 0xd4ce4e9d0c416735
	.xword 0x3a9ef26fa818f086
	.xword 0x8e75fd3e5e2edf0f
	.xword 0xc32806b1e2ff019b
	.xword 0x6d23d2434c97c3dd
	.xword 0xe356b0a3bd13b8f0
	.xword 0x866105c8481bec83
	.xword 0xdcc4cdf2e43981de
	.xword 0x9f24271cf3ed1827
	.xword 0x616f209abf2ad9f1
	.xword 0x58344b39b1ab8b2a
	.xword 0x412d17ab68ee9d29
	.xword 0x50536b8cb2b99b9d
	.xword 0x2e6f084fe5e4c67f
	.xword 0x3413480a73390b6d
	.xword 0xf4776ff3bbbfda72
	.xword 0x5749c61bf756107e
	.xword 0xa2e7abfc353284fb
	.xword 0x1da394b8f422e9e6
	.xword 0x12e05b8e9ea175de
	.xword 0xdb49e47c6590839d
	.xword 0x39205ff51b62764d
	.xword 0x1aa4fa79402eb4a4
	.xword 0x9647262df5375590
	.xword 0x9501bbe29056fcc1
	.xword 0xd05673283bcce788
	.xword 0x11454021b9f51b7a
	.xword 0x9b9b7f489f535ee3
	.xword 0xb48307aa1e8edf38
	.xword 0xe5a106364476e87e
	.xword 0xf5b78f6be40374de
	.xword 0xe0cbe672740f217b
	.xword 0x01023c060afbec62
	.xword 0x898a3aacae7bf469
	.xword 0x645b6487939555ce
	.xword 0xf4c93e9801f6b605
	.xword 0xcf424a689d5285da
	.xword 0xce1c2825fff76567
	.xword 0xbfbf94f1ba7a2c3d
	.xword 0xf90456b37a081851
	.xword 0x31d8bcf4ddc8269b
	.xword 0xa8d0133af5771eb8
	.xword 0xb04d700158b850ae
	.xword 0x963c989013a4a4c0
	.xword 0xf861570a8e4a659c
	.xword 0x9a42da925cdb524d
	.xword 0x67ba06b30a2d7ecf
	.xword 0x16b9d4e6713bd791
	.xword 0x83c6d0a0454550b8
	.xword 0x3ad2663df3830cef
	.xword 0x1dbef870278ca957
	.xword 0xa05fd38e1cbe3cf6
	.xword 0xab833cd2f4253c4b
	.xword 0xecb89aee9f1c2f8d
	.xword 0xb3b2f59751f3c389
	.xword 0x48679f9e8cab2f08
	.xword 0x39645e01ccdae4e5
	.xword 0x02248d767f4ed47e
	.xword 0x10ae8f205f6274ce
	.xword 0x67fb9b75edae8ba0
	.xword 0xa74f181ab3df620c
	.xword 0x2105f898ef8dbabd
	.xword 0xb1327c19ab9799ef
	.xword 0xe3c0dd4fcf72d4e0
	.xword 0x4223823abbb8c548
	.xword 0x75e3773651380638
	.xword 0xf86251b0eea78573
	.xword 0xc72cd4c20bcccdc8
	.xword 0x0a40105288732051
	.xword 0x9eea9b63524eff9f
	.xword 0x10587045c496c85c
	.xword 0xced2e0d1a012bed8
	.xword 0x1808078829d7cb1a
	.xword 0x533f376ba8a535b1
	.xword 0xae72439d074811fd
	.xword 0x7acb27c396710f13
	.xword 0x980331b80e72c637
	.xword 0x30b7117b16cc73a1
	.xword 0x951463979906e4f5
	.xword 0x012ca82edc33efa5
	.xword 0xf1d8535e692bd2e9
	.xword 0x4916c0a8b7767dd9
	.xword 0xa8eb071bea7e413d
	.xword 0x62b52e7844e27b8a
	.xword 0x2692f778b84f5faa
	.xword 0xc2b35bcab32ab95c
	.xword 0x1c4364e814593638
	.xword 0x9b96a771044e98e6
	.xword 0xfc388f53c827b518
	.xword 0xeb5fda7f6462ee3f
	.xword 0x6d47097a27015a43
	.xword 0xf8bc69391109fb0f
	.xword 0x8244cd9534bffc4d
	.xword 0x934566726c07f622
	.xword 0xe84420f01f14b427
	.xword 0xd161c6d6eeab62af
	.xword 0xc497d177d96744c3
	.xword 0xaf37b6a2593a76e7
	.xword 0xb40d6906067c82a1
	.xword 0xa9a00b388cffd878
	.xword 0x8d66cae84f2d8990
	.xword 0x4a3a1c60deace470
	.xword 0x4e9effe8ba9aff42
	.xword 0x51b5cdb7768628ec
	.xword 0x6b863877d30ea0b9
	.xword 0x29e4232cdd571ca8
	.xword 0x6ac51d9a8a5c2a70
	.xword 0xc4785b7ca1db7d94
	.xword 0xb1d4700cdf5bbdcb
	.xword 0x35dfe78571ff4202
	.xword 0x1382a5d9f668b7f3
	.xword 0x925ad8570202e844
	.xword 0x6f5622c267b8aade
	.xword 0x8609f15aee7612a6
	.xword 0x0d73669b929a89a3
	.xword 0x5a415099c4e44fda
	.xword 0x4e3096c48fdfdea2
	.xword 0x2c367867eddf986c
	.xword 0xad7f6385f884d907
	.xword 0x67042171bd521b76
	.xword 0xaee062e3481f2a82
	.xword 0x6e1bb51b48d70198
	.xword 0x22723c62d28f2622
	.xword 0xc1aebd861e942bd5
	.xword 0x11310d0c29dd1c68
	.xword 0x9918831b71cf3d3c
	.xword 0xf00e0c2daf7cddf3
	.xword 0xf7e652dc52284a08
	.xword 0x735fa6e859eac2b1
	.xword 0x1681f5dc21fee9ca
	.xword 0x6e7bc57e484b1c9b
	.xword 0xc5887fbac81ead2b
	.xword 0x6c565a85d41dfff1
	.xword 0x09b677d66429e9ef
	.xword 0x4dca7eae090e8fd5
	.xword 0x561966d54e2d00f4
	.xword 0xcc36031c7330c13f
	.xword 0x4040c34543d9ab56
	.xword 0xc0e7ded570077f44
	.xword 0xa98e0882efb0f116
	.xword 0xc50f0a675a5a191e
	.xword 0xfcc20c72ad6f5c61
	.xword 0xd66f71c500d5b972
	.xword 0x50712a01b83552d5
	.xword 0x652e6781f85c4fc5
	.xword 0x09d17bb81d4e2e0b
	.xword 0x825c7a9467be2d59
	.xword 0x7a4aaa61c827186b
	.xword 0xa1e630a788a19dcb
	.xword 0x061ecbf5a7a20f19
	.xword 0x608b45313e7992d1
	.xword 0x1717752f20e19d12
	.xword 0x0bf72a5770a268a2
	.xword 0xae75930fa923aa4b
	.xword 0xc314377fc1da2183
	.xword 0x851b44c0f87acfc2
	.xword 0xb6f2b7329c866b36
	.xword 0x37a56635bf878db6
	.xword 0x3f6ca76fc8b31786
	.xword 0x690aa6529c2f93a4
	.xword 0xbab2bf78fbf67e37
	.xword 0x9fea5dfa6dd25694
	.xword 0x1833af11e3658cac
	.xword 0x3315b897a09a3dea
	.xword 0xefda3d4214cd073e
	.xword 0x6d134da251632a15
	.xword 0xba0229c04f0a3c5a
	.xword 0x83f3beb0f97930b6
	.xword 0x10e3ab15c0958b64
	.xword 0xad4f1f8e61fbb97a
	.xword 0xf25543676581596c
	.xword 0x0b0cb7b24f6eb2d0
	.xword 0xdcabd40575862382
	.xword 0xed8f9a8a5954a17b
	.xword 0x51b15ade624cf006
	.xword 0xcd93e2b6b93c3e98
	.xword 0xf6bef80b43949cc6
	.xword 0x64102297bc5aa322
	.xword 0xc29d36544db0369f
	.xword 0x46436f9dccc410a8
	.xword 0x933aaa5f00e78a58
	.xword 0x3167cdf1e08f91d4
	.xword 0x8cb5e19affbe041d
	.xword 0xff6b638da3f4cb73
	.xword 0x0eea1d333a186c97
	.xword 0x741557b3b2d8083b
	.xword 0x17c7069ec8964296
	.xword 0x929de289418097a9
	.xword 0xd2a5e7bbdb933718
	.xword 0xdcfd1eb2675c8861
	.xword 0xb7f868efc8827f34
	.xword 0x457e09a9208e9cb6
	.xword 0xffabea68880567b3
	.xword 0xff4082da26d2b7e6
	.xword 0xb02da4a55f3e9710
	.xword 0xbfbc16fcde3fd185
	.xword 0x5476d500119dcbce
	.xword 0xcfc556f8fe469b7d
	.xword 0xd16ed54030c42f17
	.xword 0x665873b4c4b51d2f
	.xword 0x7135650d42c0d7f7
	.xword 0x33e320bf686ba7f0
	.xword 0x5c7207d55732ef5a
	.xword 0x66dd23118d04ed82
	.xword 0x0d5de11439776b7f
	.xword 0x7787f34768fccd72
	.xword 0x6c201c752c8c7582
	.xword 0x55e8b5e8ff725aa4
	.xword 0x9c3476a94989b506
	.xword 0x352fb0ee0050a749
	.xword 0xe092f0f089f98c12
	.xword 0xc5d1f7996b0b2aaa
	.xword 0x2160d49ee7bcd4d8
	.xword 0x5552dd67dbf67c0e
	.xword 0x630650cfa1540fd3
	.xword 0x8eb2013e3506ee3c
	.xword 0xe7999100551a18ac
	.xword 0x9589d0cc398a88d3
	.xword 0x3aa8344d05a5c3f7
	.xword 0x0739af560cbe3824
	.xword 0x33eb1f38c2da34b0
	.xword 0x05c7162a2fc805d4
	.xword 0x6842edb7cc9bad62
	.xword 0xdf65e2b570698273
	.xword 0x5ce0f6cea176461e
	.xword 0x366bf739f083e46e
	.xword 0x7336073cbb56c255
	.xword 0x71e43de8f61acf6e
	.xword 0xe6f3c9439eae9ea1
	.xword 0xc6b059ecc7e72273
	.xword 0x7d045523d1f09d6a
	.xword 0x3fc98a493d26f5cf
	.xword 0x76b5dd993e1cee95
	.xword 0xff904087e0a48b82
	.xword 0xaf10f52d6b66869f
	.xword 0xc2de800a24a511f3
	.xword 0x0df8fe70d51a02b2
	.xword 0x559489bdfe1a9b04
	.xword 0x3b8369fadca66fc4
	.xword 0x21844ad83c9cd066
	.xword 0xfba02bc2a431e49d
	.xword 0x3f8183964e21c81a
	.xword 0x40173a81b97b7a34
	.xword 0x51b988f3eb4abe0a
	.xword 0x87e5ea7f35dcaf7f
	.xword 0xf579c0de98de6882
	.xword 0x86c3bd64c6dfc2b6
	.xword 0x6e06ad23ef579c42
	.xword 0xcedd88a92fee42e0
	.xword 0xfad19461d0dbdc95
	.xword 0x36af3337ea1d2a5d
	.xword 0xc4498cd893c46e58
	.xword 0xb9f75590564363f1
	.xword 0xfdf36d35c6bb4826
	.xword 0x662a46121e156b16
	.xword 0x22194e7926be5fbd
	.xword 0xe6ea9e26b1878520
	.xword 0xac00ee79069b476e
	.xword 0x0df2909d1619d219
	.xword 0xe092474f671b72f3
	.xword 0x2d42b960d54449fe
	.xword 0x8c8bc643e88cf4f2
	.xword 0xa06d3b5b15e20a13
	.xword 0xbc80f3319315bcb0
	.xword 0x79bdf5f3cec9627a
	.xword 0xa96097782e98f51c
	.xword 0xb379c088f380a74c
_spu_des_dest:
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
_spu_des_auth_key:
	.xword 0x8299fc96a39d24b1
	.xword 0x4a14ec8a100f07ee
	.xword 0x79713521cd0ae044
	.xword 0x241510dfdc62696a
	.xword 0x6aac177622d9437a
	.xword 0x6502caba2b0d994a
	.xword 0x1a9fb6f0c05ba5fa
	.xword 0x9241ec5b8c8cdbf8
	.xword 0x18a2f43ef106e1dd
	.xword 0x5f6860fb838e48e3
	.xword 0xeeffb2d3955d976b
	.xword 0xc2d7cadf28eed6cd
	.xword 0xfa0f5b67de9449b3
	.xword 0x437dec8aeed8f574
	.xword 0xcd980fe7afb6dd22
	.xword 0x38795168198ae6b0
	.xword 0xbc21def7ae5ed221
	.xword 0x03ff58c7ffc3dc2c
	.xword 0xbefd62226ad59b53
	.xword 0x3e6838e51191faea
	.xword 0x7b1f1ff24a1c7f1a
	.xword 0xa86cfef44980c68b
	.xword 0xbd4b99ea47978f10
	.xword 0x1416a29b67767ee0
	.xword 0x300623ec47114321
	.xword 0x0b162efa3798aaf2
	.xword 0xa85556a6f5d89a92
	.xword 0x4e57d45590ceeec4
_spu_des_auth_iv:
	.xword 0x221e223672a6e5ba
	.xword 0x7bea687d7b84ee8b
	.xword 0xb51831332d5cf42f
	.xword 0x3963791db9fced97
	.xword 0x4cce03bc5f3bedf7
	.xword 0x4cd1dd46568fba41
	.xword 0xb86a68057fb1344f
	.xword 0xff13277cf94ffe2b
	.xword 0x74c4221be6add697
	.xword 0x2af12e7bc66050a5
	.xword 0x22ca232cedcb1135
	.xword 0x5e3467cd559b5955
	.xword 0xa12d8be72a7a22e8
	.xword 0x92fc3c40e194a322
	.xword 0x21ae86ed628de5b2
	.xword 0x22355070e1bd79b6
	.xword 0xc3e8968f034c4002
	.xword 0x74717c55700e9bfe
	.xword 0xb51e417b9696aa8b
	.xword 0xd5eb7024139f2acf
	.xword 0x52911994fed23c26
	.xword 0xa5bcd1f99fc6b339
	.xword 0x41c68cd4ac830158
	.xword 0xe0eac46d2a60036f
	.xword 0x6bc0db4a85cd5ba8
	.xword 0xee248c19e1d2be20
	.xword 0x6cacf88ae5368d75
	.xword 0xe021fccb15d7464e
_spu_des_fas_result:
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
_spu_copy_key_array:
	.xword 0x595f9671b33d1998
	.xword 0xb0313bb48b1eca30
	.xword 0x1ac05b5ed114865b
	.xword 0xed2e118247965df7
	.xword 0x2f3286bdab21819b
	.xword 0x94701b362873d04d
	.xword 0x78e6726e621d418a
	.xword 0x66f2fc2ff86aa496
	.xword 0xd36dbdb8f3f91866
	.xword 0xf73c3a41903afb32
	.xword 0x08ada58485adcd16
	.xword 0x35017d803944bad5
	.xword 0x0f6d672f9a22cd97
	.xword 0x5afec5fc34e968ab
	.xword 0x3d71295eab1ac39c
	.xword 0x336584b63581f4d6
	.xword 0xaa266123adcbfd7c
	.xword 0x6e889291683f1318
	.xword 0xda95292ddddf92b0
	.xword 0x07d0b913b2c1989e
	.xword 0x124129f03e601402
	.xword 0xfc5edb8a2b7f60a0
	.xword 0xf9638dc7a2216e66
	.xword 0x2f774004a4358ecb
	.xword 0x9d4f3562c5760975
	.xword 0x5a0537855fc6e740
	.xword 0x04a7b6912abda537
	.xword 0x800aa0f369a95969
	.xword 0x683a4dfe3360c8df
	.xword 0xcccc175ad8d506d9
	.xword 0x6e7ce90fb08ee39a
	.xword 0xfc5301700ffa0d00
	.xword 0x86d2075a2f944d31
	.xword 0xe55da5eddf392e37
	.xword 0x28cbf3c5817f06a4
	.xword 0x00528ae80d1d64a4
	.xword 0xf5d9939c3713bb4f
	.xword 0x72ed30eb29b2c919
	.xword 0x4023a466fec7f070
	.xword 0xa74657accefbb7ea
	.xword 0x05ac6118bb313481
	.xword 0xd10ce363a52a2696
	.xword 0x653eb618259503b3
	.xword 0xc64879b3400f41c2
	.xword 0x97cfa481ad779b2e
	.xword 0x5283a3512996dca4
	.xword 0x02042cdcb592df7a
	.xword 0x3249211fb3867817
	.xword 0x21c55fcdd2bba220
	.xword 0xe3f368d0ddae6800
	.xword 0x69e19e2f15063a93
	.xword 0x66c7a9959b217a14
	.xword 0x5122844c5b647b7f
	.xword 0x10f7063fe295f83d
	.xword 0x8f7a4cb607c04fc9
	.xword 0x5a9e77d97db6fbba
_spu_copy_iv_array:
	.xword 0xbfeaf083ac81acb9
	.xword 0x56dea672107784d2
	.xword 0x0797ecfc87ef998d
	.xword 0x3ca23211cf87da4c
	.xword 0xa9891fbf42733f59
	.xword 0x862cd41d8faa269e
	.xword 0xab079ccab8b68a6d
	.xword 0x33090322fa09530c
	.xword 0xf195fc714911fc4d
	.xword 0x5450bad07eb33144
	.xword 0x6a81c9fc86e83f61
	.xword 0x18be497e24a2ff8a
	.xword 0x9369370f22194075
	.xword 0xe0596cdfa49e0e4b
	.xword 0x8459cd214fb95090
	.xword 0xc5df0c1940402103
	.xword 0x1c0d6e7cd60d8518
	.xword 0x8f398d2dc6ab663c
	.xword 0xb7c5bc929be3573b
	.xword 0x789eebdfb4af762f
	.xword 0x74f76760875767ed
	.xword 0x94efd6dcddae9047
	.xword 0x5393ed535cd36d62
	.xword 0xb0cc358e4271c803
	.xword 0x5ec64f67248ab059
	.xword 0x3f30af408d9acbb8
	.xword 0x1ba7349293b765f0
	.xword 0xe5de2ea1386882f9
	.xword 0xa3764f8d44b755c7
	.xword 0x193bcb11a934d421
	.xword 0x29d595344050c265
	.xword 0xdf1adb8911b43d49
	.xword 0xaa65636ef32e491b
	.xword 0xf91d748ec9fc0986
	.xword 0xf34dcf6fd8357ad7
	.xword 0x57620e374db5a1d8
	.xword 0x89794fa5edd555e6
	.xword 0x28d289918d192054
	.xword 0xeecab89b5c421987
	.xword 0xa216529d56331de6
	.xword 0x0c6d98b555941808
	.xword 0xa2c659957aa555c9
	.xword 0x932c5b9cb7df3094
	.xword 0xd9eee3fe6315bec1
	.xword 0x51c7f5ee4f95020a
	.xword 0x49b99caa3824a507
	.xword 0x24f4e9bdd2c0b3d2
	.xword 0x57a9476f8f8b9fa1
	.xword 0xd8ed8f7903dca49d
	.xword 0x11e6e25faae13468
	.xword 0x3621cca2dd56dd7c
	.xword 0x5e831235ff3cdad9
	.xword 0x370569282d448d7b
	.xword 0x75d7d6245d214b38
	.xword 0x59521841a7a24a8e
	.xword 0x36abe9404b61a3a3
	.xword 0xb5010ff6df434f0a
	.xword 0xf198365f97d16a6f
	.xword 0xffc4197571dc163c
	.xword 0x596483066f1b591c
_spu_copy_alignment_array:
	.xword 4
	.xword 3
	.xword 8
	.xword 11
	.xword 2
	.xword 5
	.xword 13
	.xword 5
	.xword 6
	.xword 9
	.xword 10
	.xword 12
	.xword 5
	.xword 12
	.xword 10
	.xword 7
	.xword 0
	.xword 8
	.xword 7
	.xword 7
	.xword 3
	.xword 12
	.xword 9
	.xword 12
	.xword 1
	.xword 7
	.xword 0
	.xword 1
	.xword 13
	.xword 10
	.xword 9
	.xword 6
	.xword 13
	.xword 10
	.xword 15
	.xword 14
	.xword 12
	.xword 6
	.xword 3
	.xword 7
	.xword 7
	.xword 2
	.xword 2
	.xword 11
	.xword 1
	.xword 10
	.xword 7
	.xword 14
	.xword 15
	.xword 15
	.xword 9
	.xword 15
	.xword 3
	.xword 7
	.xword 7
	.xword 3
	.xword 6
	.xword 9
	.xword 11
	.xword 3
	.xword 9
	.xword 6
	.xword 11
	.xword 0
	.xword 4
	.xword 10
	.xword 0
	.xword 6
	.xword 8
	.xword 2
	.xword 4
	.xword 13
	.xword 4
	.xword 10
	.xword 14
	.xword 5
	.xword 2
	.xword 3
	.xword 14
	.xword 3
	.xword 2
	.xword 10
	.xword 15
	.xword 5
	.xword 10
	.xword 10
	.xword 2
	.xword 4
	.xword 2
	.xword 14
	.xword 8
	.xword 2
	.xword 11
	.xword 15
	.xword 15
	.xword 5
	.xword 7
	.xword 9
	.xword 5
	.xword 4
	.xword 4
	.xword 5
	.xword 4
	.xword 13
	.xword 1
	.xword 10
	.xword 8
	.xword 6
	.xword 1
	.xword 8
	.xword 10
	.xword 8
	.xword 14
	.xword 10
	.xword 14
	.xword 3
	.xword 2
	.xword 9
	.xword 0
	.xword 10
	.xword 0
	.xword 13
	.xword 8
	.xword 9
	.xword 11
	.xword 12
	.xword 8
	.xword 12
	.xword 15
	.xword 15
	.xword 10
	.xword 0
	.xword 14
	.xword 8
	.xword 11
	.xword 5
	.xword 5
	.xword 0
	.xword 10
	.xword 2
_spu_copy_src:
	.xword 0xaf696d548f8605ef
	.xword 0x48544559bea4b5bb
	.xword 0xe0136cee5f4dae82
	.xword 0xb23c147ac93f1432
	.xword 0x6609f0567b233ddd
	.xword 0x743cd5cbf8a294a9
	.xword 0x2cbb2897057d86a3
	.xword 0x408370874271a778
	.xword 0x087f1e7814b0d381
	.xword 0x6ce8b807233aa364
	.xword 0x5636c257d73d0c1a
	.xword 0xc41db90c74040711
	.xword 0x93a7126a382bf6d0
	.xword 0x40f86a5e6424b8d4
	.xword 0x45e5a462cbc58f75
	.xword 0xaaa878b3cc359e9d
	.xword 0x8d0ae227dd33f3b4
	.xword 0x29db7f650669bdb9
	.xword 0x8e752a7107537fb1
	.xword 0x25b2fb3c2acec326
	.xword 0xe0bbf7599fc2db12
	.xword 0xef1483e25e7740eb
	.xword 0xdac1065886b4d2ac
	.xword 0xc4a239f29d8f4c5d
	.xword 0x1b9c425147e589f7
	.xword 0x72296929a9b53d60
	.xword 0xda1e6a5499ec343e
	.xword 0xf8c9bdb0ae7d507e
	.xword 0xa16e95241618cd85
	.xword 0xb979054f497c3dea
	.xword 0x07412bba8846ba25
	.xword 0xab8b57e2d3ecc055
	.xword 0xcbed58ee9e053ee2
	.xword 0x5592738018cb40ce
	.xword 0x5609b0148d0fc234
	.xword 0xd15f8f969dbc8239
	.xword 0x5346823e2c91dc58
	.xword 0xc60ea73cbd403c22
	.xword 0x0aa673c8340cf968
	.xword 0x3730fc45db7cc0ab
	.xword 0x3bd6ab774d345b13
	.xword 0x67f10e6bba884ef7
	.xword 0xa8558441050382d4
	.xword 0xc6566c26603774c3
	.xword 0x8b39ad78cdb3d927
	.xword 0x89a9fa6bda56d119
	.xword 0xcd6214063bdf56d8
	.xword 0x3dccc9aa5be16f33
	.xword 0xc1c86016f25b51d4
	.xword 0x62842088470df011
	.xword 0xb671bc0db87513ba
	.xword 0xf36a92fcc2e9743f
	.xword 0x36d8e4b8e8638579
	.xword 0xa2c9800a09006b71
	.xword 0xb5ba106895d8f0d6
	.xword 0x8c85e1c010d9b6f1
	.xword 0x6ecc1e370ae9c90e
	.xword 0x7a8801f10dc86c27
	.xword 0xd7d83c6c437fc866
	.xword 0x3111af931e9f6ea3
	.xword 0x76aaae3b284f79b3
	.xword 0xa7492566e5943cc9
	.xword 0x88dd851c50fe6c6e
	.xword 0xde99fa7cddc49373
	.xword 0xfbd70494a3b6403a
	.xword 0x9e63e9f253943da6
	.xword 0xb12df1965948bc55
	.xword 0xe5442242e76f907d
	.xword 0x4f9b096cc0937f9d
	.xword 0x6a610714a7503fa2
	.xword 0x6c17abddf3daaa63
	.xword 0x9e53b7ea5f28d4d2
	.xword 0x1d666a66ffe30015
	.xword 0x7f95d270cc6b33e7
	.xword 0xfe800af1a6988369
	.xword 0x807eae71bf55bef4
	.xword 0xcc310aa87160a3e3
	.xword 0xfe3c8f6a3d4d51fc
	.xword 0x522a9a4f81f904cd
	.xword 0xe885bd6711080354
	.xword 0xc90abc60815d031d
	.xword 0xf883ae1df4f57381
	.xword 0x680d1fd7582e8ac8
	.xword 0xa3815cb32f91cdf3
	.xword 0xbe0b2e1899913617
	.xword 0x88375017e39aef9e
	.xword 0x088b18677f9deb0d
	.xword 0xa26c10e02458a3a8
	.xword 0x649238e7772d38cf
	.xword 0xeeb0d3013d72f616
	.xword 0x10003e3cf227e565
	.xword 0x4a209c7675f77afd
	.xword 0x6a3409f3222cb001
	.xword 0x60ae62d683fb4eca
	.xword 0x09a40853a9d2a3f2
	.xword 0x40432e6e8b09272c
	.xword 0xcf9fcb5efa2214cd
	.xword 0x704f0267ba741635
	.xword 0xe1989faf1e81b077
	.xword 0x7aa01a2263230ab9
	.xword 0x987fd32e68742eff
	.xword 0xe471e8a481ea71b2
	.xword 0xad9de4c91707933a
	.xword 0x1618ecaba64148da
	.xword 0x22dfb2687c2d1df3
	.xword 0x2e95ebbe57b2bc22
	.xword 0x9a827496d472c74a
	.xword 0xb200f6a28a945297
	.xword 0xfebbd93deb551996
	.xword 0xb73c8e3932ae2916
	.xword 0x78ab0cf637850910
	.xword 0xd5c12c88a96d1c91
	.xword 0x5c4093845ed29c08
	.xword 0x244e13823102bf46
	.xword 0x678f82e554c2f989
	.xword 0x28a8f2ccaeac563a
	.xword 0xd810b96dc50cb757
	.xword 0x07c9a8d8e0a63027
	.xword 0xa942b33ccd85aad9
	.xword 0xc6a5ed1651381ea4
	.xword 0x2fef32059184d271
	.xword 0x1b3dbc64c0cc0cb8
	.xword 0xbcee026e38052454
	.xword 0x276814439e56f9d5
	.xword 0x4f1a3f1aec34eb73
	.xword 0x0e1e2ef7936e7aa2
	.xword 0x406389b01645d55f
	.xword 0x777129ed27588dc7
	.xword 0x3179cd54edd15d6e
	.xword 0x01b8dbbe55de2dbb
	.xword 0x25aa4fa571f90cce
	.xword 0x049ed94910a78642
	.xword 0x738790b2fd1e2d44
	.xword 0x60858e4f866319bb
	.xword 0xca548a415b59d10b
	.xword 0x1b34fb1730345b9b
	.xword 0xaf1d0c50f7b10576
	.xword 0x5756fa4491517e13
	.xword 0xdc8192aa42000fed
	.xword 0xdb19bb1058e4f690
	.xword 0x51bc90fd8cde9486
	.xword 0x486e4a46c094a8f4
	.xword 0x1f2d091797304277
	.xword 0x18bee5e2209d07b4
	.xword 0xe76a88a834584f5a
	.xword 0x0bf974ce2436ac9b
	.xword 0x8c1543f258676651
	.xword 0x545a864ed1926539
	.xword 0xd00ea3ec9b5ef925
	.xword 0x9077a8c103bb8cff
	.xword 0x9b0d23d66e45ef66
	.xword 0x13353df971606107
	.xword 0x288c721222a943ae
	.xword 0x24fffda49b4e2d15
	.xword 0xeb2b5ad8f5e21684
	.xword 0x14a9f53f8f018578
	.xword 0xa15714a3356e8303
	.xword 0x8c9f04099ce2a8f7
	.xword 0x62fcad201488468f
	.xword 0x994ad20715aa47d4
	.xword 0x8d560c49c8bdbfe9
	.xword 0x23475d6ec70def27
	.xword 0x1d1ebb072f994aad
	.xword 0x16eea76da2017436
	.xword 0xbc4095a5eb874bb9
	.xword 0x56339840f0b78dbf
	.xword 0x66ef2e6e410e54ae
	.xword 0x96f60d764f70d73a
	.xword 0xa4c79ef6a7008c0f
	.xword 0xc27fc39c0526731f
	.xword 0x9f33129f17653820
	.xword 0x717693772d586f1a
	.xword 0xdec5c8641f77f455
	.xword 0xbc3b3f8a710c3fe1
	.xword 0xd14d61e72a455885
	.xword 0x6b7cc736fd27a01b
	.xword 0x241433e5ab80ebc5
	.xword 0x2719fbeaa6831288
	.xword 0x6a90833340fa6d87
	.xword 0xbd8fa0d350a80632
	.xword 0x04a063941f0cc01c
	.xword 0xe74b0534f6b09420
	.xword 0x24d63961aa9a1e06
	.xword 0x728024995dc82eed
	.xword 0x956f12bf0af5019a
	.xword 0x6e78ebaa01800c8c
	.xword 0x224a49671cf10f3b
	.xword 0x9acb0183ee0a0d1a
	.xword 0x4a143c2ff52c8b46
	.xword 0xdf28b1d1bb0d6eaf
	.xword 0x891a8f0b26559b56
	.xword 0x24f263e266b2b547
	.xword 0x2f9a7cecdea1b154
	.xword 0xe64a492c61333aa5
	.xword 0xbb1c2c46f19d0e43
	.xword 0x309e470b5c384d00
	.xword 0x81c34840ef4d3695
	.xword 0xdd94bf03964631f4
	.xword 0xc6ef40a34cfe1b4b
	.xword 0xd81ba165b463f936
	.xword 0xbd931640122092b4
	.xword 0x10c7e66b4672a847
	.xword 0x761fa9645e8688ec
	.xword 0xae814e0497c399b2
	.xword 0x77ff82a67edcc80d
	.xword 0x52071796caf4c557
	.xword 0x1b8ea5c8fef8ea48
	.xword 0x3b6f79eac271bd3d
	.xword 0xb30084887dd2871f
	.xword 0xe7c09d130c2e51cf
	.xword 0x3c5eb56b5f87c874
	.xword 0x2ca127896b7acf9b
	.xword 0xda222f91aa6799a1
	.xword 0x8a1df889a2841acb
	.xword 0x6aa3bb3b72b5a8ef
	.xword 0xddc5752a440a6bfe
	.xword 0xc79fe44049ce75de
	.xword 0xe9db9ff250b7f66d
	.xword 0x3016775df6b4527b
	.xword 0xe006ebd38eca6c50
	.xword 0xae8ba1036a12208b
	.xword 0xe429993237f50487
	.xword 0x69090081b4f0993e
	.xword 0x0d96e0f05949df6f
	.xword 0x06d4d57205080295
	.xword 0xe16297d135c6d2f9
	.xword 0x96f082702241aef9
	.xword 0x909878f3220af3f3
	.xword 0x0615d939e976ebec
	.xword 0x613f30fbf4d7de89
	.xword 0xb307cbb403bb2abb
	.xword 0x008e8bcd7be81ce5
	.xword 0x41f753a2bbac9867
	.xword 0x54bea56fefe0b694
	.xword 0x816f5b94263752d7
	.xword 0xb4ae8a2514b1d7c5
	.xword 0x50d3dd3336004253
	.xword 0xc994b61b0ae8329d
	.xword 0x7d1d1f16ff508083
	.xword 0x11b60b0c9eebae97
	.xword 0x4cdf961eb4430224
	.xword 0x23772731714f3aa8
	.xword 0xcafb2e61757c807b
	.xword 0x20c3cbfdf2f08df1
	.xword 0xca7521ec58f8b601
	.xword 0xdf5dc5f16926b29d
	.xword 0x2194a220c64c6471
	.xword 0x3f44d8ee962eefd6
	.xword 0x5c2d0065ce9d125c
	.xword 0x82d2d33531ce28bf
	.xword 0xa0ce0ba4eba4d98e
	.xword 0x08df1a82f52861d4
	.xword 0x1db303ac76becec3
	.xword 0xf72914247348f5bf
	.xword 0x20492535ae63304d
	.xword 0x8f22ddf5d114461d
	.xword 0x85fb008012101f1f
	.xword 0xcaedca179c525ef9
	.xword 0xdec3d403cbe0f334
	.xword 0x101a4bd2e1f5cf7a
	.xword 0xf1e14de6c696e41a
	.xword 0x3c065b357af067dd
	.xword 0xa01d22d05354993e
	.xword 0x98b80d5c91cf027a
	.xword 0x39c8e5ec01a365c5
	.xword 0x2271df53c3d9d4fd
	.xword 0x56746742721ca756
	.xword 0x69f9965ee69d24f9
	.xword 0x31265b659583f318
	.xword 0x9f57bba3b580073d
	.xword 0xe5fbd67b6182fa9d
	.xword 0x1525d88f20fcf7b9
	.xword 0xc6f6c81981526656
	.xword 0x1bde76f3f05340cb
	.xword 0x01bea991d8ac3e93
	.xword 0xd598895242bba60f
	.xword 0xa84882fb6e23794e
	.xword 0x3508776ba7441e35
	.xword 0x9f7123d28324499e
	.xword 0x09639b969ae59951
_spu_copy_dest:
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
_spu_copy_auth_key:
	.xword 0x618e096f22537620
	.xword 0x19fbb9e30f4d0e64
	.xword 0x41685442d5660967
	.xword 0x2ce326491aa08dee
	.xword 0xaf24a0bf9450d61b
	.xword 0x45fbe52d58436775
	.xword 0x2f809fa5c150befb
	.xword 0x47b382a210db9087
	.xword 0x2616aed15b019061
	.xword 0x334e61ae7a9ee20d
	.xword 0xbcff10958221b9d4
	.xword 0x3b3867b01beb355b
	.xword 0xb5c52b6ccefce90d
	.xword 0xdccee2cf3c8c152a
	.xword 0x71a5640340403901
	.xword 0xa826c87d71b1b439
	.xword 0xfa8dd72e9772756a
	.xword 0x8bb607b259f5c4ad
	.xword 0x606039ec4b31c691
	.xword 0x1a1a1c7b5536c4c5
	.xword 0x8d445c4315a72957
	.xword 0x3fac6a79f94921fd
	.xword 0xe9ec6c18bedc4150
	.xword 0x2468dc5510d27ab1
	.xword 0x55fce0ac25fac0c2
	.xword 0x9e482533bc607218
	.xword 0xbcb68b53c169d118
	.xword 0xfa7a5cb01798e156
_spu_copy_auth_iv:
	.xword 0x4ee687c4979372cc
	.xword 0x52bdc12785fe0db6
	.xword 0xb778a13960e2c5a7
	.xword 0x5c56f0909ca56f17
	.xword 0xa8b50dcb9305df94
	.xword 0xd1ea213a73d1512d
	.xword 0x2b030c755e5820b8
	.xword 0x00f5bd89f6d22399
	.xword 0x70b1d2795c86e2b3
	.xword 0x56b56cc89d30b6bf
	.xword 0x339a0ffa4d69d94f
	.xword 0x62360225d50f68d5
	.xword 0x6d9146cc3358ad31
	.xword 0x5b4ea604596049a6
	.xword 0xb0b303d2ff3fb6fa
	.xword 0x15d160e86ec5aac1
	.xword 0xed3e5cbedee1f633
	.xword 0xfac1cab2f5fc37a9
	.xword 0xbe786c25eb6a2a9a
	.xword 0x85ce40187c4b0450
	.xword 0xe34894b6fcc68cdc
	.xword 0x9a44d179f18575da
	.xword 0x307eb7a00d2f8868
	.xword 0x148d085b1b4f5905
	.xword 0xfe7751b927068b69
	.xword 0xa2fc976787c80f7f
	.xword 0x9a833e8b7c200518
	.xword 0xe665a8d69a6ce1a5
_spu_copy_fas_result:
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
_spu_crc_key_array:
	.xword 0xc5b58616caa9b746
	.xword 0xab3bab802c3ad00b
	.xword 0x2f9c22548c51bee9
	.xword 0xadf321c9ace4b13c
	.xword 0x0463983d3fe8c617
	.xword 0x23a58d7a112f774a
	.xword 0x5832ce3acf4ef050
	.xword 0x657d9f03ecf2c7c0
	.xword 0x3625633c6e9b71a9
	.xword 0xc8fc51c853f2c55e
	.xword 0xec91af2f0d6f084a
	.xword 0xec0169db51979df2
	.xword 0x142681daed976a40
	.xword 0x3280fd1ec3a0585d
	.xword 0xfa404935a09df5e7
	.xword 0x180ca6e233949924
	.xword 0x458196c9a61cbafc
	.xword 0xb41df8e1b3c973e8
	.xword 0xd71021fee3d77bdc
	.xword 0x753e2a00c04e7585
	.xword 0x6dada3ef8f4e8546
	.xword 0xcb2edd34b6e12d98
	.xword 0xcb8e3c2f5ae361d6
	.xword 0xb8c03b50281718af
	.xword 0x0c88c1e6ffe6dc77
	.xword 0x0588d12d48ccc3b2
	.xword 0x25813a78ad958b70
	.xword 0xb4d093906f7b1a80
	.xword 0x1810d389ba9fbe43
	.xword 0x9824cc8428ffa328
	.xword 0x695ceb9d0b4dc4a0
	.xword 0xe84cd0248a30c7e3
	.xword 0xd0f159ede4a1070c
	.xword 0xd501f93bacbb08b1
	.xword 0x525b38ab7d4fac6c
	.xword 0xe7d6127bafb058da
	.xword 0x9625999397c45f44
	.xword 0x26e5b269fa57c46b
	.xword 0xe30fd7a830796d6e
	.xword 0xeccfb148353b35cd
	.xword 0xf76e12c2665728b4
	.xword 0xea07098561cf3811
	.xword 0xd24098cbb79393b8
	.xword 0xbff8a71485d8b77e
	.xword 0x50c9444a4cc442d1
	.xword 0x4709e0daef135397
	.xword 0x6fc183f1ff85e7f3
	.xword 0xff7a950e6ebe472a
	.xword 0x0ae5890a8c5042a1
	.xword 0x04a22d3cb5ed47a2
	.xword 0x3c21a00b3a87ef6e
	.xword 0xf7f578cf297435ee
	.xword 0x30dec14d5742157b
	.xword 0x349a75396a0b847f
	.xword 0x2b3adaf9496c8d25
	.xword 0x72595bb483fcf5dd
_spu_crc_iv_array:
	.xword 0x2aa5176879126f22
	.xword 0xc7cb9f77908f5013
	.xword 0x6cd5a1aa6aab11d0
	.xword 0x8329975921a9375c
	.xword 0xbb6820324464a35e
	.xword 0x5cfff1f7a0df7454
	.xword 0xd9c2b3ad95320574
	.xword 0x75c137fc2f67ca12
	.xword 0x963bcf3220916401
	.xword 0x56c596536f5f2c0f
	.xword 0x5cad9779e9f71bf0
	.xword 0x789bfcaafa8c3dd7
	.xword 0x31236886b3eccdb2
	.xword 0xa73753042e6c1710
	.xword 0x71df8e6e88b9f85a
	.xword 0x3a18678eb25778b2
	.xword 0xed3bfff840e29d38
	.xword 0xc43f17af48266a94
	.xword 0x7cd83bc076c70917
	.xword 0x066f0804f69a7969
	.xword 0xc58bb3d373068d23
	.xword 0x3d08d732cf6dc56b
	.xword 0x4b60985ec90edbac
	.xword 0xeade2e22cffc191f
	.xword 0x63647088f5f731cc
	.xword 0xe406872b45662d58
	.xword 0x3e8db3e3715913c6
	.xword 0xb1eecb65df6c0dcb
	.xword 0xfb93143e780d7044
	.xword 0xc6f8e1a91b9fb765
	.xword 0x7355dd6523ac186d
	.xword 0x733595244b2376b1
	.xword 0xcf56cd2fe79a3744
	.xword 0x7a439705fa29fb66
	.xword 0x3da090c308a80875
	.xword 0x378412184a4ce2b3
	.xword 0x1dc6a8cd45a0e090
	.xword 0x5575927af7855789
	.xword 0xdd50fbb58d3ca28a
	.xword 0xf0522515b99600bd
	.xword 0x75afefd518c166c9
	.xword 0x651fc3ea0f578b1b
	.xword 0x58f38a2642cfc356
	.xword 0x0cbc107d840bdb89
	.xword 0x865633ca92e4eb8a
	.xword 0x0a224fd7371e01f1
	.xword 0x69df1a080f4911aa
	.xword 0x03da25673a42e00d
	.xword 0x85cf1e9893d014c1
	.xword 0xe12c8eea7e59fa85
	.xword 0x9b1fccd06b8d8634
	.xword 0xcd7827056b403f1f
	.xword 0x6a4082d4e8787de2
	.xword 0xf7962fa998df55c7
	.xword 0x0d0f4f5e0760a608
	.xword 0xeee9301330faa7f2
	.xword 0x7462bd37bfb45ca6
	.xword 0x3e83afaa07c0c4cc
	.xword 0x3ce469dbc81e862a
	.xword 0x3f7a1ebb0cebc257
_spu_crc_alignment_array:
	.xword 0
	.xword 8
	.xword 0
	.xword 5
	.xword 8
	.xword 11
	.xword 10
	.xword 14
	.xword 3
	.xword 10
	.xword 6
	.xword 15
	.xword 10
	.xword 6
	.xword 9
	.xword 4
	.xword 2
	.xword 6
	.xword 6
	.xword 9
	.xword 1
	.xword 12
	.xword 12
	.xword 4
	.xword 0
	.xword 11
	.xword 0
	.xword 11
	.xword 3
	.xword 1
	.xword 12
	.xword 7
	.xword 1
	.xword 2
	.xword 1
	.xword 4
	.xword 12
	.xword 13
	.xword 2
	.xword 1
	.xword 13
	.xword 7
	.xword 6
	.xword 10
	.xword 1
	.xword 0
	.xword 8
	.xword 4
	.xword 8
	.xword 3
	.xword 11
	.xword 5
	.xword 13
	.xword 10
	.xword 8
	.xword 5
	.xword 15
	.xword 11
	.xword 0
	.xword 0
	.xword 6
	.xword 0
	.xword 9
	.xword 13
	.xword 2
	.xword 11
	.xword 9
	.xword 1
	.xword 1
	.xword 6
	.xword 2
	.xword 9
	.xword 9
	.xword 4
	.xword 0
	.xword 0
	.xword 9
	.xword 15
	.xword 13
	.xword 7
	.xword 6
	.xword 4
	.xword 3
	.xword 12
	.xword 7
	.xword 8
	.xword 0
	.xword 3
	.xword 14
	.xword 14
	.xword 0
	.xword 7
	.xword 1
	.xword 7
	.xword 11
	.xword 4
	.xword 8
	.xword 0
	.xword 13
	.xword 7
	.xword 9
	.xword 8
	.xword 7
	.xword 9
	.xword 11
	.xword 4
	.xword 6
	.xword 9
	.xword 0
	.xword 0
	.xword 12
	.xword 4
	.xword 14
	.xword 5
	.xword 13
	.xword 12
	.xword 13
	.xword 2
	.xword 9
	.xword 7
	.xword 4
	.xword 0
	.xword 12
	.xword 1
	.xword 11
	.xword 6
	.xword 12
	.xword 7
	.xword 7
	.xword 13
	.xword 4
	.xword 11
	.xword 1
	.xword 1
	.xword 1
	.xword 15
	.xword 0
	.xword 1
	.xword 5
	.xword 10
_spu_crc_src:
	.xword 0x955669abc92fa41f
	.xword 0x83a9785eee3da1bd
	.xword 0xa8a1b443a57dc1f7
	.xword 0xaebfc5f8ed01949e
	.xword 0x362a7e49b5a33c22
	.xword 0xb104e3329cf4d31e
	.xword 0xc8ec073a8673969c
	.xword 0x4d55b24ecf16b827
	.xword 0x9b67faaf8b12d191
	.xword 0x9b53af636542377f
	.xword 0xed3262e115904bbd
	.xword 0xe74db63889dadf20
	.xword 0x33e104cd57d9d17f
	.xword 0xa163c167080911a6
	.xword 0x7fb18eea8e34413b
	.xword 0xf7617218f3125bd4
	.xword 0x4da9db25c51d54cb
	.xword 0xf80176956981c9c1
	.xword 0x16e5ec953f0cecf4
	.xword 0x09e8b7deaf239c10
	.xword 0xa055db850ed25aad
	.xword 0xb3fc8b8195ddea61
	.xword 0x1d7c9afa9f09a69e
	.xword 0x4823d00f2d9a2be8
	.xword 0x7e1b72bce19760b6
	.xword 0x1315768006acb9e0
	.xword 0x61d27d8c371cdcc2
	.xword 0xc0a41245d11a9568
	.xword 0x5fdb23c7c0833a06
	.xword 0x03b48ac70a5d48b9
	.xword 0x173edc25d8193486
	.xword 0x037b068c5a33575b
	.xword 0x62a50901693fc244
	.xword 0x8cc5d154bf2fd04e
	.xword 0xf8ca5acf61d6b03c
	.xword 0x5576a8212b3a30c5
	.xword 0xb46a32253a057379
	.xword 0xe939247fd0854276
	.xword 0x2bd7bb6721dcfcbe
	.xword 0xb5e904007134beeb
	.xword 0x0a351fe72cbf6d16
	.xword 0x611b3abb98d85508
	.xword 0xdc6e32f5b3341597
	.xword 0x58063c4c81a96a16
	.xword 0x912cd24d2cac1022
	.xword 0x06bd25e2a21119dd
	.xword 0x0c1e77a984112e36
	.xword 0x3b7496c2a50690cf
	.xword 0x60881c4a8c8406e3
	.xword 0x261130ce2322c05d
	.xword 0xacc5239ee89c82d2
	.xword 0x65dc517cd82b4d0b
	.xword 0x99fdeab5a91ee00c
	.xword 0x5c5ee35d3e07748d
	.xword 0x9e1c89439ff54cfd
	.xword 0x930c56fcdfdbc723
	.xword 0x5752600702a8ecd0
	.xword 0x1cd5461db8e77fd0
	.xword 0x4e2064baf8ed922d
	.xword 0xcc5766e6c95e7fcf
	.xword 0x5084db260b3a24a1
	.xword 0xdc4d642d962fb3a9
	.xword 0x3565510c002a86fe
	.xword 0x6dde482748d2f754
	.xword 0x44b498718b651062
	.xword 0x29d221c76040e4f5
	.xword 0x967be7438310c1be
	.xword 0x0206cc9765590606
	.xword 0x0baf6e982dcdbdea
	.xword 0x226c99462544709c
	.xword 0x28fc7b62003849cd
	.xword 0x2876969616e3977f
	.xword 0xc4f6bb675bbbd418
	.xword 0x689c94f6ceddc9b0
	.xword 0xd28472b9d838df96
	.xword 0xf4e2693cdee87f48
	.xword 0x963fc8bdf5edeb5d
	.xword 0x717364c676a430ca
	.xword 0x579327b1c7f5d4e6
	.xword 0x2424c8c01aa085cc
	.xword 0xd52c850f01cfaed8
	.xword 0x6417e2e22fc25aaa
	.xword 0x8b88e94339ddcdd9
	.xword 0x0f73074bfed591b4
	.xword 0xd81ce9e6792368db
	.xword 0x19fc8ed5c1c3a824
	.xword 0x8b1ab49de238b0d0
	.xword 0x481b58f43a189d57
	.xword 0x7ee8728f9c251c6a
	.xword 0xd3ee462a2bfecfdd
	.xword 0x1284da9b2319d3e5
	.xword 0xad5f754e5cbedbc4
	.xword 0x05a9d0c722a90d49
	.xword 0x88b5789538beee56
	.xword 0x0c4d2667972987c7
	.xword 0x5849168b52baa4d5
	.xword 0xeeeb59f39bb5a0fb
	.xword 0xe244cdbad0ad1107
	.xword 0x9f8bbf71f2ec017c
	.xword 0x567da5834361c505
	.xword 0x427c76143ee0ff7e
	.xword 0xd74b8670a9e1c082
	.xword 0x1b7a01d94e3f42e6
	.xword 0x6e3f622e025d8c4b
	.xword 0xbb5bbbf9d62cfee5
	.xword 0xe14498428991684e
	.xword 0xa0e6e9dd04eec7b4
	.xword 0x67c89ac2fa9e5468
	.xword 0x6573a058959b7288
	.xword 0x7eb53876153e004f
	.xword 0xa5e43841c6b5f452
	.xword 0x4800fca2fa906b19
	.xword 0xb3565422f3207c5a
	.xword 0xb3620c21e6e4a027
	.xword 0xcf6abf7e971d8299
	.xword 0x9b6f6931c867561e
	.xword 0x753edabbd0603286
	.xword 0x921f4d2b0edfbbd9
	.xword 0x760c4ac08d2662b7
	.xword 0xf9b85be9ba3d8552
	.xword 0xca74e89b07ba1167
	.xword 0x1650f9d5d8c3dc30
	.xword 0x7d3cb50cc39c4db3
	.xword 0x7b7a16da60356f56
	.xword 0x40d1efb55bbd010a
	.xword 0x6a0107345a629ed3
	.xword 0x69e220519b5b3ed3
	.xword 0x7dd87f1e212efd79
	.xword 0xa78300ed97161db4
	.xword 0x1130deadf4b914a2
	.xword 0xbeec09705c7f08c3
	.xword 0x137578d01f36b8be
	.xword 0x7eafba2c5fa4449b
	.xword 0xb21debdadb74ac16
	.xword 0x664b340e356c114a
	.xword 0x9d5bb8924a897296
	.xword 0x954185cad27ab480
	.xword 0xcbc44b44474363ad
	.xword 0x19e92addc6eaf72c
	.xword 0xbd60b4089a7796db
	.xword 0xfe49b4a056489094
	.xword 0xecc5c642f218f219
	.xword 0x489bc20389e191d1
	.xword 0x5dcec2aed8d651f2
	.xword 0x04dfea87b69ba45e
	.xword 0xbeba6a8c5ca413f1
	.xword 0x3fee1557d8615bc7
	.xword 0x7cd9300e0ae7545a
	.xword 0x4865532ed2a8fba7
	.xword 0xafd816c470a5b1af
	.xword 0x37a6b761142bf319
	.xword 0x4f808bd983ee0d8c
	.xword 0x0c0debc8e76c8cc1
	.xword 0x18a7766853609a51
	.xword 0x36bff09254807a87
	.xword 0xcda03342d2892606
	.xword 0x9299479963f4ea63
	.xword 0x0a0a2a0f87fbcdcf
	.xword 0x2b7c19f43c56ec12
	.xword 0x37cfa803731228c8
	.xword 0x980f2162fc28763e
	.xword 0xa8187ce4ce6f5eb5
	.xword 0x7ad6a326b5e14ba9
	.xword 0x7a46875ffbbacf79
	.xword 0xc17ba4c7269bde51
	.xword 0xe886e4ad01a8539d
	.xword 0x6527dff97cd3235a
	.xword 0x7c6219678b1ec774
	.xword 0xbf48045d8135c07b
	.xword 0x173e78be696f68a5
	.xword 0x13a5b31ef15edc26
	.xword 0xd5ad60e2a51e9382
	.xword 0x083e5ddf29a8c328
	.xword 0x98a401fb84c57cb8
	.xword 0xcec28312c9bcbd64
	.xword 0xbcb519bc42ee7062
	.xword 0xa0c2d24fa66f54eb
	.xword 0xb530058360360a9d
	.xword 0x3005baa5aece7810
	.xword 0xcba14553791a1dd7
	.xword 0x372d9c1cdce26f48
	.xword 0xeab2d567ed631043
	.xword 0xbe8fd2b6a00b3c2b
	.xword 0xb14979f86bf2e82d
	.xword 0xe570c024e6cbcb93
	.xword 0xa461d09da4de9a08
	.xword 0x959353897885cf28
	.xword 0x49ac7886c53fcd49
	.xword 0x2453e570778b91b8
	.xword 0x92c1f6ae7e79ab3c
	.xword 0xbaed9b772b543239
	.xword 0xc02470535de9da0c
	.xword 0xc8cbcfbeb431ffa0
	.xword 0x09577eeefb94da57
	.xword 0xfd2bca43c9943b59
	.xword 0x350ddd38ae99dc10
	.xword 0x1e5745ec4b306916
	.xword 0x56d8088e8017cbde
	.xword 0x713fe2479b25b659
	.xword 0xf9b6280e08a4d969
	.xword 0x95ccf29aef5603b0
	.xword 0x115f6eaec6148dd3
	.xword 0xcd6a0966062bdf00
	.xword 0x40a971129759d3f5
	.xword 0x64094593d4226e3f
	.xword 0x8a95790bec7323d3
	.xword 0x6688d55cf50bedb1
	.xword 0xdb369fce178e2027
	.xword 0xecf0f01e3af2ac78
	.xword 0xd293babf7b7ebb86
	.xword 0xc44f241f64f071ac
	.xword 0x4e56d1ceacb1b756
	.xword 0x236b50e18e10821a
	.xword 0x845101b8261a4d0e
	.xword 0x85e4a9264c7860e2
	.xword 0x832eadfce99f0128
	.xword 0x5dfb4bdb2d3f8c6f
	.xword 0xe4fd1c3ecc93f10f
	.xword 0xf788682e892da6d2
	.xword 0x7fc4531d27674679
	.xword 0x74f8a38bf0085385
	.xword 0x100635421db6ccda
	.xword 0x6c81bf6da1d5d50e
	.xword 0x89f20317d3b67b4b
	.xword 0x2090c1a682788e67
	.xword 0x6075140be5077ed3
	.xword 0xce5f0c96623e27a4
	.xword 0x9f7c700d0b69c25e
	.xword 0x7e14371a7632a47c
	.xword 0x3df123fe006acad5
	.xword 0x3221f681af45ed87
	.xword 0x2522ff62b0b5e5ee
	.xword 0x655e8629599a3129
	.xword 0x05d781a1f509cff9
	.xword 0xe86e0597b8517b50
	.xword 0x327e2184fe731ae3
	.xword 0x253d19a1d27a7753
	.xword 0x8a1ae33f7c96e3fc
	.xword 0x31421e88da7a9b6b
	.xword 0x385e0aab89daffb9
	.xword 0x83e63bcba00046be
	.xword 0x88331a304e49cea9
	.xword 0x671d948438f1c8c4
	.xword 0xd659ede0d763a060
	.xword 0xff111d0e11490a33
	.xword 0xeef712e1fc6f476a
	.xword 0xcf3f6cd33a7f28e7
	.xword 0xbc4a384d91c4bc7d
	.xword 0xdfecb4ace4591bd0
	.xword 0x9b63da07507cd67b
	.xword 0xcbf72092da95ac9f
	.xword 0x22ba05007b3ad26f
	.xword 0x952335fcca4b4da9
	.xword 0x6eb530983705951c
	.xword 0xb31f6134d8224c18
	.xword 0x50422ac63f2ff907
	.xword 0x9147cb091c55b99f
	.xword 0xc1f2af2452e518ae
	.xword 0xbad5aeef0d53ff76
	.xword 0xfa6511887ea709b3
	.xword 0x2daeacafd40cb2b1
	.xword 0xfad9a446e3299be9
	.xword 0xdb6d1252efefb9d6
	.xword 0xc2d0f4d1f1b75e11
	.xword 0x9e361423ce3541fd
	.xword 0x202d9954398fa242
	.xword 0x0f4de8b4b1f1e772
	.xword 0xf677676e97c8088f
	.xword 0x4ae23faaab6f44d5
	.xword 0x37632afbc979a003
	.xword 0xe983986f6cfc5958
	.xword 0x12df0cf8d86cb977
	.xword 0x3a713592ecb051ca
	.xword 0xe52cb5a2c05525dc
	.xword 0x6bd9a65b204a113d
	.xword 0xc50631a913c0feb4
	.xword 0x8d2b116a4f32a9b3
	.xword 0x2385d911e40476ed
	.xword 0x97da5a1483001cd2
	.xword 0xec76c0d4bd68ae09
_spu_crc_dest:
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
_spu_crc_auth_key:
	.xword 0x89ad70eeea4e8142
	.xword 0x39e91f3f10d2d4c1
	.xword 0xf511fd7b892db774
	.xword 0x190bee3685a30f6a
	.xword 0xf9e2ab6694fa2f83
	.xword 0x227ec3b73e30001e
	.xword 0x6d66e584442e7982
	.xword 0x8fc0a73875371f50
	.xword 0x87355fc643694a87
	.xword 0xe6b8d442a4716235
	.xword 0xe0dfc39caf827c15
	.xword 0x7450045270f75c34
	.xword 0x59522efdf615110c
	.xword 0xf5d52674b33601fc
	.xword 0x4ec113cf71a852c7
	.xword 0xc06f621367c98879
	.xword 0xda40bc66489643f9
	.xword 0x532e2024a267367b
	.xword 0x073b79e425b6b111
	.xword 0x4eacf7f10d1a011e
	.xword 0xaf4c5f1bb8d7ab2d
	.xword 0xd163eaffa7a916a8
	.xword 0xd80c2c276c4dcdc7
	.xword 0x995f5767a1acd097
	.xword 0xbc85505a27121550
	.xword 0x04351054e84dc734
	.xword 0x365884e3a1535266
	.xword 0x928f878728345e01
_spu_crc_auth_iv:
	.xword 0x14a36b8496b99cce
	.xword 0x0f28edc530c564fa
	.xword 0x1f59572f5fcc1675
	.xword 0xc8dd316fc4d357ed
	.xword 0x7a88b411050b8c1f
	.xword 0xd09bb0233bdb2b35
	.xword 0xf44b27297aac5c87
	.xword 0xc9f91e5f4a7ee6a5
	.xword 0xbbbb476e0577daec
	.xword 0x6756866e4267b837
	.xword 0xf3f6453a52615b8d
	.xword 0x0916f063780754ea
	.xword 0x542acaebbf1454ab
	.xword 0x54d59142024fbfe9
	.xword 0xd59495325a3f71d1
	.xword 0x383605c29b48e3d2
	.xword 0xcb1436cc593db3e6
	.xword 0x84f026ef5e0cd2a7
	.xword 0x4a7c0093ebcc3669
	.xword 0xadb4b22b4d26598a
	.xword 0x9c3e5030da9bb1fa
	.xword 0xd2de596a8cb7627e
	.xword 0xb16ce8a8d3cc664a
	.xword 0x45e6fd91a3c700f0
	.xword 0xceaa5f924dab7fb3
	.xword 0x9db98ad5d6690f35
	.xword 0x6ffa9fd78c1b9e03
	.xword 0x17c425f2e6bf33b6
_spu_crc_fas_result:
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
_spu_hash_key_array:
	.xword 0x9919818cd53a41d8
	.xword 0x27465f34dfd694b6
	.xword 0xd4f098b6dbf48959
	.xword 0x18d2473153728b75
	.xword 0x1abb01e79c12260e
	.xword 0x9b7fd75bc46758e7
	.xword 0x87c615fea88c4de0
	.xword 0xec91ab43410df7df
	.xword 0xad20d5806e4a0d78
	.xword 0x6d550d76dd6b5664
	.xword 0x1b44027d6e5cd175
	.xword 0xbc21bc8e28d8527a
	.xword 0xcb628e745a6a1a70
	.xword 0x839182ebc8c7644e
	.xword 0xf32d613937b404cd
	.xword 0x34cd401d0b3d7e8f
	.xword 0x6ae918398f06d03a
	.xword 0xaef5877476efffe2
	.xword 0xd947e96c188d33bc
	.xword 0x9f74c07673a3b809
	.xword 0x7531a05b080025b4
	.xword 0x50db738043bbfa36
	.xword 0x6743866fc625c435
	.xword 0x081492352f10a9a3
	.xword 0x27bfc8160bd280b9
	.xword 0x17824d7632f5a7a4
	.xword 0xfb8afd319db66038
	.xword 0xf4d54a33a1ad664f
	.xword 0x6ed61d271d67f60f
	.xword 0x96b5619551f5fd19
	.xword 0x9c4860a4340752aa
	.xword 0x02f75bb2fa6edbdb
	.xword 0x8181b03a7ebe4c36
	.xword 0xf9daec50ca2a21f1
	.xword 0x03fb3c325cc82af0
	.xword 0xf0c990b2bfa56a35
	.xword 0x370eea24ecda646b
	.xword 0x0ace686ae9435b49
	.xword 0xcb1c0d0c16926d12
	.xword 0xe7490593af1ffcfe
	.xword 0x653061cf9d9a061f
	.xword 0xc3fb8b43aa19b0b6
	.xword 0xd746af7d2d093ef6
	.xword 0x1d3f66d8d355173c
	.xword 0xf22bc1763c19beec
	.xword 0x191d15e41aa137e8
	.xword 0x22f755ca3d72c206
	.xword 0xa7688cb3a8eca47e
	.xword 0x6518429ea42fc218
	.xword 0x2bf59a37dc27a9c2
	.xword 0xc1cc85ad8aefa616
	.xword 0x4cf2306d67dd0c6c
	.xword 0xe0e4855c815ac8f0
	.xword 0x4923138f25866c99
	.xword 0xd7a600d8b70d6018
	.xword 0xd18c7838d32c5a73
_spu_hash_iv_array:
	.xword 0x78ba14cf3a6d1a00
	.xword 0x28fd96ce2d209e90
	.xword 0xe69c2b3ffdd80e32
	.xword 0x3cf46f1c99bb5aff
	.xword 0xf2a0402273a8de83
	.xword 0x77235063d48f5ad6
	.xword 0xf031ab6da86186d7
	.xword 0x9acb588965e5ad75
	.xword 0x78b3ae9a50845f97
	.xword 0xd4157bb1eff1a8c3
	.xword 0x909eb46a49cd151a
	.xword 0x48b01bfd81667fe8
	.xword 0x1b65c8e869fb8e0b
	.xword 0x91f5114a725842da
	.xword 0xf5d556cd38993be9
	.xword 0x6738d926c96e4d2e
	.xword 0x540489e389fa8eaa
	.xword 0x8b9b86ab10a85860
	.xword 0x0fcc713351f6bed6
	.xword 0xe773e01417453156
	.xword 0x8ce417f41ed24ebc
	.xword 0xa30c1627af60061d
	.xword 0x69ad5176e854879b
	.xword 0xd59b1c64f6921aa9
	.xword 0x05fa6016432fc0f0
	.xword 0x49645d4ba5c1e4ad
	.xword 0x7f4dbd113ef72cfb
	.xword 0x67a4f981458935e9
	.xword 0xe880cccca09cabb1
	.xword 0xf3518ae7890d5865
	.xword 0xb945a04d8e0940ab
	.xword 0x7dccab585b1ccd9d
	.xword 0x29558d2ffa724771
	.xword 0xc7f97b1defce4af1
	.xword 0xa326e7e5c6d8c6cd
	.xword 0x10bb62f723cef553
	.xword 0x66e64908a3b25a97
	.xword 0xe67c26949e78fc3d
	.xword 0x159667cec45043c9
	.xword 0x3c9be5941e2be63c
	.xword 0x0f326f4415e2cb95
	.xword 0xe843c2c852fdba82
	.xword 0x58e094d1cf0536dc
	.xword 0x38a56d0cd6e39e42
	.xword 0x4755b3606e1035de
	.xword 0x2c1bd4b832d3c069
	.xword 0xbbfe4a4808076c8c
	.xword 0x6b3a35824a9c2e06
	.xword 0x6ce45d4145f8bac7
	.xword 0x262d157205c5b5ed
	.xword 0xb8a15f68b0bebcf2
	.xword 0xf482371fef511918
	.xword 0x56ade3ddd255d6fa
	.xword 0x0f60afc645f2a679
	.xword 0x167a33e6ca3079f4
	.xword 0x039b7a1dd50cb572
	.xword 0xf4bd78ade2ec25a4
	.xword 0x509e222a93e84962
	.xword 0xd7ee82312ac457fd
	.xword 0x27327829608827a8
_spu_hash_alignment_array:
	.xword 8
	.xword 14
	.xword 8
	.xword 13
	.xword 8
	.xword 7
	.xword 9
	.xword 8
	.xword 2
	.xword 15
	.xword 10
	.xword 8
	.xword 2
	.xword 7
	.xword 15
	.xword 7
	.xword 14
	.xword 7
	.xword 13
	.xword 1
	.xword 4
	.xword 3
	.xword 1
	.xword 8
	.xword 14
	.xword 1
	.xword 14
	.xword 6
	.xword 3
	.xword 12
	.xword 13
	.xword 1
	.xword 1
	.xword 7
	.xword 7
	.xword 15
	.xword 4
	.xword 7
	.xword 13
	.xword 10
	.xword 15
	.xword 3
	.xword 5
	.xword 11
	.xword 15
	.xword 0
	.xword 1
	.xword 10
	.xword 6
	.xword 4
	.xword 13
	.xword 2
	.xword 7
	.xword 1
	.xword 12
	.xword 0
	.xword 11
	.xword 1
	.xword 8
	.xword 8
	.xword 10
	.xword 11
	.xword 6
	.xword 3
	.xword 0
	.xword 15
	.xword 3
	.xword 11
	.xword 1
	.xword 14
	.xword 9
	.xword 5
	.xword 10
	.xword 13
	.xword 7
	.xword 13
	.xword 6
	.xword 4
	.xword 9
	.xword 11
	.xword 5
	.xword 1
	.xword 4
	.xword 7
	.xword 7
	.xword 0
	.xword 5
	.xword 2
	.xword 13
	.xword 11
	.xword 2
	.xword 10
	.xword 0
	.xword 4
	.xword 14
	.xword 11
	.xword 12
	.xword 12
	.xword 10
	.xword 13
	.xword 0
	.xword 0
	.xword 8
	.xword 13
	.xword 4
	.xword 15
	.xword 14
	.xword 1
	.xword 12
	.xword 6
	.xword 6
	.xword 12
	.xword 0
	.xword 12
	.xword 12
	.xword 0
	.xword 6
	.xword 2
	.xword 8
	.xword 7
	.xword 14
	.xword 13
	.xword 10
	.xword 6
	.xword 10
	.xword 1
	.xword 9
	.xword 10
	.xword 15
	.xword 15
	.xword 15
	.xword 8
	.xword 4
	.xword 1
	.xword 12
	.xword 5
	.xword 14
	.xword 12
	.xword 1
	.xword 5
_spu_hash_src:
	.xword 0xb2b367ec480ac909
	.xword 0xcd5ea03966c52311
	.xword 0x359e7f0d5ec31c6a
	.xword 0xd913449700a00c0c
	.xword 0x0e8b19360ffda313
	.xword 0xf806c30215c3ffac
	.xword 0xdd0a2bfef9268752
	.xword 0xf6463ee66fb3fd46
	.xword 0x0bb18ef3952ad1d0
	.xword 0x08bc64c381b2bd44
	.xword 0x15211b03def483e8
	.xword 0x4c7240aee226e3fe
	.xword 0x27014b344732fb48
	.xword 0xee595a5e2c2e0e1b
	.xword 0xbc8ad939d609bb45
	.xword 0x217280589770fac8
	.xword 0x8bdc95290c971482
	.xword 0xec16e32b5719ef86
	.xword 0xbfda65c80cdd130e
	.xword 0x94ae351ebc29de94
	.xword 0x52771e47241b59af
	.xword 0x4a30682a7c6f4e9a
	.xword 0x1b0b9cd74068b077
	.xword 0x42165269e3775bb3
	.xword 0x44ea00d8c2581373
	.xword 0x82cab1f016c1b937
	.xword 0xc0fb052ec39775e3
	.xword 0x18e6dcd01a6c4c54
	.xword 0x7a481fe469e64d0f
	.xword 0x49a3bbd19c4c4d66
	.xword 0x992816b011607325
	.xword 0x0b05dda2806ffe5a
	.xword 0xd7f3da7d06f380f9
	.xword 0x5349f2d6f9cb2b69
	.xword 0x17b21bb7d15c0382
	.xword 0xa2612c592e055492
	.xword 0xa852d762905017d1
	.xword 0xdf1659d4d9615c2e
	.xword 0x3cedfe39d428a21c
	.xword 0xbc8aec3e21f551fa
	.xword 0x09b293e521cfc3d3
	.xword 0xfde1120756863377
	.xword 0x2a3956a01444ddff
	.xword 0x1e13d69a5ec0d8dc
	.xword 0xfa09ef7636c1f8e3
	.xword 0x58eb8e9dab1d8c41
	.xword 0xbad6300e503fe718
	.xword 0x222b3294128f1055
	.xword 0x9d1db62a5e5aca53
	.xword 0x9bf467017345130d
	.xword 0x34cc0554fa75dd30
	.xword 0x09d0317bd03bc411
	.xword 0x662f378a03d721d3
	.xword 0x9e7a95cb298da627
	.xword 0xf382f060f454089e
	.xword 0x79612a9429bb57a0
	.xword 0x86ad1da6d9f6d29e
	.xword 0x0b7d384644835f8d
	.xword 0xb0e3581792974a93
	.xword 0xf5086aea52c48a61
	.xword 0xfc80c3604ca4080d
	.xword 0x651781a6aef40bc1
	.xword 0x5ff1d364ab6461a2
	.xword 0xd6340771fd2c6645
	.xword 0xfaf8d00cccbbbf42
	.xword 0x5a9ced4c75331b4a
	.xword 0x918b778f2a1ee1ae
	.xword 0x274e4454151c1c79
	.xword 0x443830d336f0d4e7
	.xword 0x72be783627f31a95
	.xword 0x4581be3fc2ad6139
	.xword 0x78d4e9179877d1c2
	.xword 0x68bc60e98ce49ff2
	.xword 0xc52fd833b0e4730c
	.xword 0x1ceecb9c0abb439c
	.xword 0x8f3c78073c4a3729
	.xword 0xbfc86de212a3a2d1
	.xword 0x6f61fdd51f7c7192
	.xword 0xda488892cf00671d
	.xword 0xbf7159d71c3361b6
	.xword 0x461c926252b55700
	.xword 0x2b9dda08765fafc0
	.xword 0xa9f7b24a1c3d37dd
	.xword 0x81c85cb47c8eef11
	.xword 0x0d0b8cf1953a7f87
	.xword 0x42cf645380113ee0
	.xword 0x1386202a48dd5d29
	.xword 0xf28156c8f4ef8333
	.xword 0x2050179b0f669226
	.xword 0x35bc8b81907d25df
	.xword 0xa9ef65ad5ba6637a
	.xword 0x565bccb0af0f5b0b
	.xword 0x6e1326d7ede15ca7
	.xword 0x0bbba14249c66be8
	.xword 0xd377dc01effc7744
	.xword 0xfe92e15599ab2796
	.xword 0xf4f6087c2acba5c7
	.xword 0xc2b9939425e3aca9
	.xword 0x5810674a2d9b092f
	.xword 0x9da7e79639977da9
	.xword 0x37d03cfc02e5d243
	.xword 0x49a96694c1aedee9
	.xword 0x5bef81c545a18de5
	.xword 0x4581a3aa3d24d44b
	.xword 0x3c9c40018995bcf3
	.xword 0xab7e5e6f557e3325
	.xword 0x72945084a30b7450
	.xword 0xead0824cfaa29086
	.xword 0x7dc7d8a02d6c84b8
	.xword 0x25d83cffcb25725a
	.xword 0xbf719253ee380db2
	.xword 0x906cd727751f4fd2
	.xword 0x71b9aa4a5fcf9932
	.xword 0x6a6a6efd39c9cc16
	.xword 0xe78759ac432224c9
	.xword 0xdcae6239950c8f34
	.xword 0x21c44eecc2f3f0e3
	.xword 0xa4de7910eb9add26
	.xword 0xeca7d5e8fa64b50a
	.xword 0xc80ef40f4c305475
	.xword 0xc5658da72b8245a8
	.xword 0x15d97d9f0223c1c8
	.xword 0xd782e08570514e11
	.xword 0x9356f0edd6cebb5b
	.xword 0x61cac4ff27c32efd
	.xword 0x6ebfa98e926010b4
	.xword 0x38998e82912d9207
	.xword 0x6cc50acf74d35e39
	.xword 0xe63d709d0b639e84
	.xword 0xe25b03ed1c1b64fd
	.xword 0xd788f7b03c42a0c7
	.xword 0x263e964f2a566b0d
	.xword 0x7d60896e1b0ed113
	.xword 0x56d2116ddbaa81f3
	.xword 0x2811d98360947018
	.xword 0x8e7b469142153ba3
	.xword 0x4545ad59b27b51ed
	.xword 0x70accd06bed1ca05
	.xword 0x1397f592492ad8d4
	.xword 0x391f6edc40d8ed1e
	.xword 0x5d3842fb66612263
	.xword 0xbe083fc0a920b29f
	.xword 0x342efb07244c82bb
	.xword 0xccf3a67f026eeb79
	.xword 0x2f34df0d2e9ef70d
	.xword 0xb7c337caaf8a2189
	.xword 0x3067dfd4669a7425
	.xword 0x64e204356dfb4c1a
	.xword 0x6565367dd16495ae
	.xword 0xf01d8947aac981b3
	.xword 0xbe1429c267cc2d4b
	.xword 0x5202c41bdd2ae07a
	.xword 0x683d94a9f6f5d4f4
	.xword 0xe55fa9a1e94f771b
	.xword 0x16d702e736aa5500
	.xword 0x7c15abca28e63d82
	.xword 0xe9110d1dd387a1a3
	.xword 0x51f6b122287d9db1
	.xword 0x027cdf42fb01f2a6
	.xword 0xb3a9f7bd107b93b5
	.xword 0x621a23fd78268607
	.xword 0x1e4d399e3493b08c
	.xword 0xaf60e306b92c7c16
	.xword 0xe450b5f528ccb8e3
	.xword 0xd2c45eb04af27fbb
	.xword 0x82434994110e8cea
	.xword 0xdb40a19eeeeb998f
	.xword 0xf53b15886c7ebf15
	.xword 0x9c41ca083c43eee5
	.xword 0xb7171656089c8545
	.xword 0xd1684dfebe5dba48
	.xword 0x14605cdb5364f508
	.xword 0x934176b6c320bdff
	.xword 0xc8c17e74a389559a
	.xword 0x17cd52879048603a
	.xword 0xb25e527e7f022086
	.xword 0xf482a749d70a42d1
	.xword 0xddbf7b21c8bf8d61
	.xword 0xed95fe4108cb4891
	.xword 0x9e0e01c163223fed
	.xword 0x9bad8ca34512b875
	.xword 0x1bb6b2363b620a5f
	.xword 0x7f689793a408d1bd
	.xword 0xa2fe67bc926e0834
	.xword 0x16ddd680b7c9f425
	.xword 0x7be499fb53ab820e
	.xword 0xbd918ff9acd54f93
	.xword 0x160fe912d9b90cda
	.xword 0x533f5b4d30f8cf25
	.xword 0x0e6179766d783b74
	.xword 0x2be70b21ae205e6f
	.xword 0xd7ef5c6dc0cf861f
	.xword 0x50e3fd4589c28f02
	.xword 0x4ab2bbb9aed253b0
	.xword 0xd506c7c5ee226f86
	.xword 0x11b05c297d234673
	.xword 0x37aa2e1cec8ff92f
	.xword 0xf636749dc2e18d19
	.xword 0x0407f85f3955831a
	.xword 0x8fd8aed269b2d07e
	.xword 0x65f15dd3cdca0cdb
	.xword 0x4f2e37fc2b3b3ec3
	.xword 0x4d61575eb6e411d4
	.xword 0x4251925c0906093b
	.xword 0x37590f058c734366
	.xword 0x3b4ed379c65c3186
	.xword 0xb0eabe708611138d
	.xword 0xec1f41df59c3dfa0
	.xword 0x8f261c16a2766bda
	.xword 0x9e6df09b508c040b
	.xword 0x9b946afcc6a24d93
	.xword 0xfbd1cf89a2f1ac34
	.xword 0xf594a9603e4b8e31
	.xword 0x1e20ff1ec5aa47ba
	.xword 0xd84fc4c0877401ee
	.xword 0x465ee2235a8766c8
	.xword 0xd9af861434aa6ec4
	.xword 0x77c456fbf2b142be
	.xword 0xde03d3428768a721
	.xword 0x8d9ad8ff794033a5
	.xword 0x848c89cbf49630e2
	.xword 0x9c116be7927f5cb1
	.xword 0x2c4265791766ca29
	.xword 0x837c5d31a904bb75
	.xword 0x22ce6b577fcaffaf
	.xword 0xeee8a8d28a6d7734
	.xword 0x75b68d89d2aba3d5
	.xword 0x96e4ba8ffb69e51e
	.xword 0x6740508dfdc76c56
	.xword 0xd85f4696706fc2ea
	.xword 0xc3a7013551076e2d
	.xword 0x451b1b83173c3011
	.xword 0x681512bc7e38accd
	.xword 0xe85672383db3aabf
	.xword 0xeb1b15a3a7b8dfa0
	.xword 0x063ea283a3c413c2
	.xword 0x599f2d1b23d67ee9
	.xword 0x022d60106b36432c
	.xword 0x9299300532a78544
	.xword 0xdac68e484244dd2f
	.xword 0xf13ae0abec3eb53c
	.xword 0x5e3f716b5adf9003
	.xword 0x5ff72e2bdb9188f3
	.xword 0x0b3a6d8d37da2183
	.xword 0x28d5762b0ecb67d7
	.xword 0xe57b16876f2bc958
	.xword 0xf62ca65ff7052b34
	.xword 0xb5e521abe662cf81
	.xword 0xd9d2e3daef685532
	.xword 0x61a896b0d83b8284
	.xword 0xfdb6fbfb132ec6e1
	.xword 0xba592f66a9962ef6
	.xword 0xec06c27b37f5b767
	.xword 0xb8ffb6fbab00f27c
	.xword 0xe1a63bc8686dc121
	.xword 0xcd0f76d4f27e446a
	.xword 0x53ac8278700181bb
	.xword 0x536837fab720ccb3
	.xword 0x5db4820d1a0dc2ae
	.xword 0x5b0132e97930cc2f
	.xword 0xf374e9508842f82a
	.xword 0xffd9bb79211eb60f
	.xword 0x8200cb6a91931b3f
	.xword 0x618ffdb076c16060
	.xword 0xb54c51b0dfb46282
	.xword 0x331557b09a5369eb
	.xword 0x012b1a7f26c4e1c7
	.xword 0x5f2c0fc65ce265ab
	.xword 0xb10c10ea743250a7
	.xword 0x173aa5bd83773a20
	.xword 0xac49f328dd598b21
	.xword 0x4c71f26996561cf3
	.xword 0xf8e6f64a8b2b3179
	.xword 0x78b9210c7e3e03d9
	.xword 0x11f094e72ed6bc5e
	.xword 0x7ce4417d205db790
	.xword 0xc44bc39f087994ae
	.xword 0x015ac5af1af2f95c
	.xword 0x8a4107fd13d85b21
	.xword 0x4b7762c1cd13d5cc
_spu_hash_dest:
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
_spu_hash_auth_key:
	.xword 0x0d432d8ff0dfc34f
	.xword 0x02b6972f8103e6f7
	.xword 0xf598e3760295af93
	.xword 0x65af352f1985b115
	.xword 0xd00c4d71a9e973c3
	.xword 0xdb332c823549f07f
	.xword 0x6c1f5812ca7c0644
	.xword 0x1b9bc8fa0feb8b9f
	.xword 0x7528747f35cae0f7
	.xword 0x69708067d5e5cecd
	.xword 0x648140b3bdb14ebd
	.xword 0xb93c2abf173de6f3
	.xword 0x4812998751130d15
	.xword 0xaf8ae382de48ea04
	.xword 0xc6595562dc685337
	.xword 0x5e95e554b4811d0d
	.xword 0xa77fe46e17c3c187
	.xword 0xb579a59020482ac5
	.xword 0x9349952ba8bfc6e6
	.xword 0x44b4dd34516a603c
	.xword 0xc0d8e30dd2a93381
	.xword 0x533839ed85d468aa
	.xword 0xb62b9068e6be2185
	.xword 0x369efed40c5ce5c9
	.xword 0x618a34f671120254
	.xword 0xbe85a2b1593a1742
	.xword 0x36c513f02ab48977
	.xword 0xd7c91d83331658e5
_spu_hash_auth_iv:
	.xword 0xe5065fff878f5a5e
	.xword 0x53a6e6fb04dd000d
	.xword 0x69fcf67e8f8543c7
	.xword 0x35bbce15eacadadb
	.xword 0x73438007baaacbfa
	.xword 0xe9d2b961fb3fce14
	.xword 0xe0c43b1536a6d4cd
	.xword 0xcb6174b8dc7912c7
	.xword 0x56ca84b04c803361
	.xword 0xfc391d33996c1d46
	.xword 0x6588b16b752a7785
	.xword 0x0ee083c73674cb14
	.xword 0xebae89ae36d60c96
	.xword 0x4169efb3f5260f1d
	.xword 0xe693c05859a0ede0
	.xword 0x6a9b84446b9a8814
	.xword 0x41fcab78635de34b
	.xword 0xf5e15f5baa39bcfb
	.xword 0x8c5ae0351a609f5c
	.xword 0xc815bc237e92eb2e
	.xword 0x60390079f66bdc32
	.xword 0xd2a15cb4e2a98e6b
	.xword 0x964c76eb65c795c7
	.xword 0xea1ce84f30586e46
	.xword 0x5a7979e30b13256d
	.xword 0x998601453fd3c20f
	.xword 0x56ba1ba5ae9374f3
	.xword 0x22d81a1380774348
_spu_hash_fas_result:
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
_spu_hmac_key_array:
	.xword 0xd5543441b7b30339
	.xword 0xcce7604cb39d6a2a
	.xword 0x6c7d266f6234c7fa
	.xword 0x5d4e3e4f8b82153c
	.xword 0xc720ae068e16dc84
	.xword 0xa6a58c534a0a9cad
	.xword 0xcb81c3c81eb719cc
	.xword 0xe93c4186b77528e9
	.xword 0x725e460c420d2e90
	.xword 0x5a9c678b35f0bba0
	.xword 0xf90bc2fa717aa6bb
	.xword 0x5c0818f09411a9a8
	.xword 0x5e75c513c5d6ced4
	.xword 0x4d7e83eb8359ec0a
	.xword 0xa77566ab19786b9a
	.xword 0xaf3f4c70785ce5e3
	.xword 0xd0fcf45a23277bd8
	.xword 0x45edd36e51af834e
	.xword 0x71f0e0e367c9845b
	.xword 0xefe0fa8b66ac187c
	.xword 0x87bf06e532214060
	.xword 0x95c2834e742a2eb9
	.xword 0x7d4f8639edcc2361
	.xword 0x47ac8107f237a839
	.xword 0xc9263a5d8b729dac
	.xword 0x2e74001488534847
	.xword 0x97cb15fcd18b903e
	.xword 0xcbe338c91999f194
	.xword 0xf7e94a5ecbe1ef7c
	.xword 0xe78a60019830d1d1
	.xword 0xa1d5635e382a9179
	.xword 0xc65784f55c88c26a
	.xword 0x9074a5826e451d1d
	.xword 0xfc9354669aa55ecf
	.xword 0xe06495138c6bb0f9
	.xword 0xe3fb65bb21176bfe
	.xword 0xe5e67f042ca92d68
	.xword 0x43daab7c5c699339
	.xword 0x457f01ccd8e67f1a
	.xword 0xc32ac36020628f3a
	.xword 0x428a6f7ab73baf90
	.xword 0x6cfa49d09e78359a
	.xword 0xad42791ce2ef556f
	.xword 0x6c6d0c24a5a9da86
	.xword 0xb5f518363c1f7914
	.xword 0x82771664f897d2a7
	.xword 0x5d1f6bc08f33f355
	.xword 0x95c3ea3ac27f74d9
	.xword 0xac59daab07d562c3
	.xword 0x7ffe45ab031dd4db
	.xword 0x5a1adb312d1aea56
	.xword 0x4f5d5c25da750115
	.xword 0x359dd0ef5b6258c2
	.xword 0x1cf0212de2876bec
	.xword 0x1262792aac93b98f
	.xword 0x98a51c67868a0ea7
_spu_hmac_iv_array:
	.xword 0x683b8364ff67e2b2
	.xword 0x14b7190bd43f7b64
	.xword 0x3821ff140a7dd5c5
	.xword 0xc39f4634427b75ff
	.xword 0x0bc6069f62e5e4a4
	.xword 0x6045e799d640959f
	.xword 0xaec1b30b0262b728
	.xword 0x2bc39f5d54be4679
	.xword 0x1252f53157200f27
	.xword 0x32c3a7c7e16853fa
	.xword 0x7ea0adebf10ad3c5
	.xword 0xb2cd1864efdc2472
	.xword 0x9695240bd971c726
	.xword 0xaed30be51df76ff9
	.xword 0xbe89c13a7b93811c
	.xword 0x29e0dce8392c8540
	.xword 0x475461e89134e8a6
	.xword 0xd94895a663b0552d
	.xword 0x9a658bf1ed0e36b5
	.xword 0xd3addbcaf205d66b
	.xword 0xcac165918715f18d
	.xword 0x05af63ee4c4ad904
	.xword 0x14b3b656577a250b
	.xword 0xa67a5be371d1d478
	.xword 0x72e4b3db519f2564
	.xword 0x2044862a1e85c00e
	.xword 0xa3282476c210b61d
	.xword 0xe71ddeb70b9f7aeb
	.xword 0x83774396f7c3f7aa
	.xword 0xaf164738329990b3
	.xword 0xef9cbddb16573354
	.xword 0x5745cc405de07f2c
	.xword 0x44fd73a07f3df7fb
	.xword 0x19c0a46cb41abb2f
	.xword 0xab1fcdf7d886be89
	.xword 0x61d3a83a4518ab92
	.xword 0x1f18f6bd52ce5d71
	.xword 0x974b0760454d507c
	.xword 0x2a6359803d261d54
	.xword 0x950b210f1c49873a
	.xword 0xcc693a9c2ed871db
	.xword 0x7df21a911f791d08
	.xword 0x17fb7eda7469ed97
	.xword 0x0817df1a46847381
	.xword 0xd0504b37597d47f1
	.xword 0xacf2b257a56fdba2
	.xword 0x1204d1a224624c5b
	.xword 0x1ae54b6ddaf50eb9
	.xword 0xea121b284adc6371
	.xword 0xb4255cfdbe1023b7
	.xword 0xba8fdb7721462e72
	.xword 0x4da362308a0ff1b9
	.xword 0xcdacdea045ddaabd
	.xword 0x3913d7db0c63f236
	.xword 0x9024ff15fc51fa1d
	.xword 0x4fedae5664d26f45
	.xword 0x18484b8906b73f4f
	.xword 0x369367ddbbf28efa
	.xword 0x3859bdfe3764cf7d
	.xword 0x92875db081e78e1f
_spu_hmac_alignment_array:
	.xword 14
	.xword 9
	.xword 6
	.xword 4
	.xword 12
	.xword 3
	.xword 2
	.xword 13
	.xword 15
	.xword 9
	.xword 9
	.xword 1
	.xword 9
	.xword 13
	.xword 14
	.xword 2
	.xword 11
	.xword 9
	.xword 6
	.xword 9
	.xword 11
	.xword 5
	.xword 9
	.xword 0
	.xword 12
	.xword 6
	.xword 9
	.xword 13
	.xword 11
	.xword 10
	.xword 0
	.xword 15
	.xword 2
	.xword 0
	.xword 0
	.xword 3
	.xword 14
	.xword 2
	.xword 15
	.xword 6
	.xword 14
	.xword 15
	.xword 11
	.xword 4
	.xword 11
	.xword 4
	.xword 10
	.xword 12
	.xword 11
	.xword 7
	.xword 10
	.xword 3
	.xword 15
	.xword 2
	.xword 9
	.xword 8
	.xword 13
	.xword 9
	.xword 11
	.xword 0
	.xword 2
	.xword 5
	.xword 5
	.xword 1
	.xword 4
	.xword 12
	.xword 10
	.xword 15
	.xword 1
	.xword 2
	.xword 6
	.xword 2
	.xword 8
	.xword 3
	.xword 13
	.xword 0
	.xword 6
	.xword 10
	.xword 9
	.xword 11
	.xword 3
	.xword 9
	.xword 1
	.xword 7
	.xword 15
	.xword 8
	.xword 14
	.xword 4
	.xword 15
	.xword 7
	.xword 0
	.xword 8
	.xword 4
	.xword 13
	.xword 6
	.xword 2
	.xword 10
	.xword 13
	.xword 6
	.xword 9
	.xword 8
	.xword 2
	.xword 3
	.xword 1
	.xword 2
	.xword 13
	.xword 7
	.xword 2
	.xword 3
	.xword 10
	.xword 0
	.xword 12
	.xword 5
	.xword 2
	.xword 10
	.xword 9
	.xword 3
	.xword 10
	.xword 8
	.xword 13
	.xword 5
	.xword 5
	.xword 1
	.xword 2
	.xword 10
	.xword 9
	.xword 9
	.xword 6
	.xword 8
	.xword 8
	.xword 5
	.xword 4
	.xword 8
	.xword 8
	.xword 2
	.xword 3
	.xword 5
	.xword 4
	.xword 14
	.xword 10
_spu_hmac_src:
	.xword 0xf0df351b67b2ed6b
	.xword 0x2fa1b93fba2a3e56
	.xword 0xe928312f92e66c92
	.xword 0x1e1e6fcdbfb3bc12
	.xword 0xcd8d661568dec4fc
	.xword 0xbe39746d15ca934b
	.xword 0xfd3b3d522b939a29
	.xword 0x785c1cfad474146d
	.xword 0x607f5e1e48ba64fc
	.xword 0x8d692f8198436261
	.xword 0x393475f1e6e45240
	.xword 0xff3ce29afa6b1fcb
	.xword 0xd8233b2750e730f6
	.xword 0x7d225321dee5b856
	.xword 0x6b09d468ae7b98e1
	.xword 0xe9eb857071f3b91b
	.xword 0x588826c712e61ead
	.xword 0xaee3c1821e3b539f
	.xword 0x80022c7d74ad084c
	.xword 0xbacc586e3dd590c5
	.xword 0x560d2cefbac2b5fe
	.xword 0xbdca1912e834a76f
	.xword 0x7f4fe28637281049
	.xword 0xedd87db1e12e1db9
	.xword 0x9ed2f460555570c1
	.xword 0xbd5abf859a70ed57
	.xword 0x7d0d1c2df2cc3132
	.xword 0x04afc687b5951e2f
	.xword 0x8c8a27cc345a153d
	.xword 0x9e2ed30c0b099e14
	.xword 0xc7189cf6c178b27b
	.xword 0x938e5ef3aec5f6c1
	.xword 0xf5ab663b500ce82c
	.xword 0xc30c75e783732799
	.xword 0x03755a02fcfe0ea2
	.xword 0x7491ad7915ef27af
	.xword 0x5da64e7c9d2fe2e0
	.xword 0x96addbe287186d09
	.xword 0x9d42d65535c7eede
	.xword 0x61f7f885cb4ecd10
	.xword 0x746c878451854748
	.xword 0x5e17117c08685cad
	.xword 0x51a6c4829364c51d
	.xword 0x66a4b2d8cd7422b5
	.xword 0xb13f52a9cc9aed6e
	.xword 0x5e803b9568dd9495
	.xword 0x36730d605c556b53
	.xword 0xa05ad69961a9d314
	.xword 0xe18a132cf004bac0
	.xword 0xd62a71ce4730292a
	.xword 0x90a0f02553f49ffd
	.xword 0xcd875dfec94ad5ce
	.xword 0xf39f3f9c118fd50a
	.xword 0x9b8daedd3c6eaa0d
	.xword 0x7c2395003d63057a
	.xword 0x404d1b7a120d0e85
	.xword 0xc14e119ca46a3d73
	.xword 0xd57bc9fac12c8af9
	.xword 0xf19aff5abd832fe4
	.xword 0xcd4280efd6f2269e
	.xword 0x3c23e41f58a9b2fa
	.xword 0xb04b5ed376ed7d51
	.xword 0xc6076ab3d9767273
	.xword 0x3f32039e36c87eaf
	.xword 0xb807de9fe18027a7
	.xword 0x37dbad0754226efa
	.xword 0xe58d96385733dbe5
	.xword 0xc185dbd3a49b5f41
	.xword 0xd96edcd2a02e4db6
	.xword 0xedd63ea937875300
	.xword 0x2285c81562fb07ff
	.xword 0x73660d6aa523890d
	.xword 0xa5b6054b5fbcbf9d
	.xword 0xd7681ad0d6e2ab04
	.xword 0xfa53466a6e2ca21d
	.xword 0xe784f394f82d4755
	.xword 0x045f8224a6f9fabc
	.xword 0xeec2fb2a6039228d
	.xword 0xa3e250bb18dfb1a9
	.xword 0x32e389438e2f547b
	.xword 0xca3fe6ef88fa4ccc
	.xword 0xebbcb2a897ae5e00
	.xword 0xd83b4ecf6537c412
	.xword 0xcfb04b5c84514f36
	.xword 0xb8709cd289a7c306
	.xword 0x1ba809773a208f16
	.xword 0xcb7049d2c0fa0285
	.xword 0x1dc4cb4fa9fbc349
	.xword 0x168cc7338fa4267b
	.xword 0x324f6919520b7e45
	.xword 0x977bc4d47932f099
	.xword 0x2d18c4eb5da51702
	.xword 0x30f5a10c652c9fa3
	.xword 0x4b9d2621634fb9f0
	.xword 0xc1c51d3c38f95630
	.xword 0x8d904286505a22a8
	.xword 0x1995931ba14a8e6d
	.xword 0x57f0065a3a71d97f
	.xword 0xe34c12189b939569
	.xword 0xad6e89b95cb73c27
	.xword 0x20d3344e9c6bebdc
	.xword 0xfa10b433c5365f5d
	.xword 0x82c37feb6133ec20
	.xword 0x14b08be85ae8aa5f
	.xword 0xd261831a83a6ad01
	.xword 0xaebc79876635cd14
	.xword 0xf4c7f599b7b48db1
	.xword 0x7fe30215b58f9ac0
	.xword 0xdefb9d4e38324f0f
	.xword 0xc854d18bfc2c9c25
	.xword 0xeef7771278a9cb40
	.xword 0x52588aea1a8c1a20
	.xword 0xbdbbb0273edc8653
	.xword 0x44b461fcc7fc908c
	.xword 0x743a5ac94869a572
	.xword 0xdc041b8ea8682fb7
	.xword 0xd571293db29da269
	.xword 0x25cf429a7987a5c0
	.xword 0x19ddcb49ef3f0a10
	.xword 0xf364a38534a41e2a
	.xword 0x996667c127874297
	.xword 0x2db5461ff52d1b1a
	.xword 0x1133c8082f1fe8c4
	.xword 0x88146c46b7e464b9
	.xword 0x22bc8a1094e0f939
	.xword 0x082835ddb841e462
	.xword 0x68372f9939131d60
	.xword 0x0ee9cf78a4d0e3f6
	.xword 0x11357a9ce3f11a5d
	.xword 0x1d1d6334b466cd05
	.xword 0x95c8d127f6dfc027
	.xword 0xe7ee7de3dbfa520f
	.xword 0x3bd6b21489d100f4
	.xword 0xc1b0eb18ba692688
	.xword 0x94d9a4f51eb0b6e3
	.xword 0x38c9a288fb4b6166
	.xword 0x81369873e6ff8e3c
	.xword 0x3692bc7a4444b643
	.xword 0xdc2fcefcaf78759f
	.xword 0xfcfa74e64345da70
	.xword 0x9e035e68ca48b327
	.xword 0x2ff240041456dbff
	.xword 0x3cf44feb02c9c53f
	.xword 0x44f593c8b29dc593
	.xword 0x51cafa804ec6666a
	.xword 0x087adee7ce698f82
	.xword 0x36e7f3c4308829db
	.xword 0x67d66ea8dc1e2e05
	.xword 0x567ebb4ec2bb8fbc
	.xword 0xa6cd1b906a508034
	.xword 0x698cb346f6ad2599
	.xword 0x78703de121991ed3
	.xword 0x31b433c31e620de4
	.xword 0x5f2ade25ee75b5ea
	.xword 0x9a16ed5d81a5c8d4
	.xword 0x899da8506b4fde08
	.xword 0x0007f96562ae2eec
	.xword 0x2bfc1319e2e872f1
	.xword 0x2ef85f9d8a3ccb6a
	.xword 0xff65f00f34509e73
	.xword 0xfc6206bfce7059a6
	.xword 0x77cc51fb17856daf
	.xword 0xbc9a39df8068ac3d
	.xword 0x060b398b6eb21db9
	.xword 0xba2c554980a6efb1
	.xword 0x57f0f5e5216f97c0
	.xword 0xde32ac17e91457c1
	.xword 0x2ba8170722779665
	.xword 0x646e7a1d33b29360
	.xword 0x38c13103e0bb0fe0
	.xword 0x5850543b430ec1d9
	.xword 0x6df62c85bc29d663
	.xword 0xbdc42e97b43d7016
	.xword 0x1bf8d97363ec106a
	.xword 0xe3442769ac916d1b
	.xword 0x6cb5db7dceffe217
	.xword 0x1d16531d9dc26c9e
	.xword 0x88b92fc5683262b8
	.xword 0xa988358da6a14e77
	.xword 0x88917853bed93885
	.xword 0xdb5db65fb5fd7080
	.xword 0x10189007243c9cc7
	.xword 0x791a05c652b20b1f
	.xword 0x2045a53e58487c0c
	.xword 0x8e3f5ac7e850bcfc
	.xword 0x735576abfaa15a25
	.xword 0xe8cb225eb93e1220
	.xword 0xbe93e7b448eaf997
	.xword 0xd6a9bc95f88c71d7
	.xword 0xad3f7d84c45b20e5
	.xword 0xe354c50e6187744e
	.xword 0x7794dd8a8015d57a
	.xword 0x9daab669fb873878
	.xword 0xf5fc0a8e56b4c2e8
	.xword 0x06fb23ddde1e644c
	.xword 0xdb53cb7963cba879
	.xword 0xeb0e4b4f6dc1a380
	.xword 0x8f664172dd8cdca8
	.xword 0xb5b1dd69fe3b7d57
	.xword 0x8cfb147d5e38a346
	.xword 0xdf18e11c921edf89
	.xword 0x8825903d831eaf7f
	.xword 0xd47da8a3006f3386
	.xword 0xbca6e35cfe7ef003
	.xword 0x1197231f1eb3347b
	.xword 0xbc3245fcc19cad4e
	.xword 0x37f6a867e8e595a9
	.xword 0x2d946ba9c6bd5927
	.xword 0x8238d8ebd031fdae
	.xword 0xc656d1a0f1fb94f8
	.xword 0xee96537673b25947
	.xword 0xa1d816f49826ade7
	.xword 0xcb42faf63ca29f96
	.xword 0x1b15c6cbfa2704a8
	.xword 0x61309f2b19e8cbbe
	.xword 0xa6ec7aeb269016c1
	.xword 0x56664e8c45e6882f
	.xword 0x14f345aee4597134
	.xword 0xc08d9c12a96375b3
	.xword 0xbf3422117f2a3b32
	.xword 0x5cc33405b47ab644
	.xword 0x0e5821b9866143af
	.xword 0x9248a514968fa10e
	.xword 0x5616a7f4d7fa2706
	.xword 0x1b4fb1cbcda23092
	.xword 0x495ed3f69015197d
	.xword 0x1935384557e842a3
	.xword 0x67f279d8e2914936
	.xword 0xb9e038233fe16f6b
	.xword 0x8c926e2b5f3fb21c
	.xword 0x51cc6786aea0aacf
	.xword 0x96bb5a45fdfd3c25
	.xword 0x3721ec45a2038f46
	.xword 0x138a7b8cb93a2248
	.xword 0x95708a392d2d186f
	.xword 0x4cd249769e976187
	.xword 0xfc18a4a0039cea54
	.xword 0x8956b1f04bd03914
	.xword 0x34e5e94c24a8f5ca
	.xword 0x17e6b154a9a7a98b
	.xword 0xf7cba5bda0f2852c
	.xword 0x1c4f6a6ad107e2e0
	.xword 0x0759e4958ec91d2d
	.xword 0x6d3521df63d0ef38
	.xword 0x1dfd32e6b1593087
	.xword 0xd7d3e0d4d5f8550f
	.xword 0xddab8b2e2a715695
	.xword 0x6d5ccd1f5e2ba5a0
	.xword 0x12604d1ce7aa8340
	.xword 0x36a727a3fbdd197f
	.xword 0x902263d508b49355
	.xword 0x807d8143dda5a80f
	.xword 0x59a2f7ebaa9e4c4a
	.xword 0x22914a88f8530e41
	.xword 0x8ed8ebca654e256e
	.xword 0x8eed59fe4f3585aa
	.xword 0x50f71ae22716a201
	.xword 0x56d7a58e5862effd
	.xword 0xcb6a28e90cdeaab3
	.xword 0xc1684c8a273c05a4
	.xword 0xa0a0eb7d52ae4ebe
	.xword 0xa3ec8e34af03ee1d
	.xword 0x3445bcef0d716b6b
	.xword 0xf930842ba2adbb78
	.xword 0xf52940ca2df3d177
	.xword 0xb8934e0e2930deaf
	.xword 0x91603c7c1b4913da
	.xword 0x213b6969ba955ea4
	.xword 0xfd500aec9c86a945
	.xword 0xbda270d8d54ff390
	.xword 0x8ae38fad40050799
	.xword 0x53a2f8adac9200dc
	.xword 0x98f515a7b34c1c92
	.xword 0x147baface41568ed
	.xword 0x03008d4d37870161
	.xword 0x6023fb7acd456f51
	.xword 0x28bc8ebf91c3ac8b
	.xword 0xaaf8c77f8576ed04
	.xword 0x321f15b36c1c8a15
	.xword 0x56c9ee0510023732
_spu_hmac_dest:
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
_spu_hmac_auth_key:
	.xword 0x4d9cbd4088bb9f14
	.xword 0x56e53f87e33aa1ce
	.xword 0xe1a4aeb254465002
	.xword 0xf36b68348424e30a
	.xword 0x9daa9280f2d3849b
	.xword 0x661af9c8a0159ad9
	.xword 0xd108cfa6993825a9
	.xword 0x840ab85d6247d15b
	.xword 0x91a66a67ce97575c
	.xword 0x6c959178b94e1cbe
	.xword 0x969c730c52784d6e
	.xword 0xefea9b0e28f9a505
	.xword 0x894be73af88f603b
	.xword 0x748ba506e226f027
	.xword 0xfe6da0a4bd66b49b
	.xword 0xfea7574340834a4f
	.xword 0x3a4326ca022b0f28
	.xword 0x9208375fa95518a4
	.xword 0xd71e06091ffae886
	.xword 0x0de77c3dcbaf852f
	.xword 0xd9bb9ba964af2efa
	.xword 0x9c4aa23bcf087275
	.xword 0x8bc7d82f9a2196b1
	.xword 0x4349579fc2ede96a
	.xword 0xf0b92262f674d45c
	.xword 0x84c8e29957503486
	.xword 0x1ce81edb03567609
	.xword 0xc0f3332ac7027313
_spu_hmac_auth_iv:
	.xword 0x89628734f3dcb62e
	.xword 0x3ba0e4afb04fc8a0
	.xword 0xc80dc211fbd4f4a6
	.xword 0x30e00d2887467d14
	.xword 0xfdddeb30deae290f
	.xword 0x3cd6cad987dedebb
	.xword 0x7d5fa6999b5d1f9a
	.xword 0xc8a022db90fe3945
	.xword 0xf6b405b5b4e86c2b
	.xword 0x0378ce6813bfdfe7
	.xword 0x49e59ed382b1afcb
	.xword 0x80630c1c4f50cee7
	.xword 0x3cb3fb46ae763372
	.xword 0x417a5c56fe43d30c
	.xword 0x43f21a0835c13de2
	.xword 0x91a9089fd132c1fc
	.xword 0x61bf5422c5836508
	.xword 0xc5035611e66c8daa
	.xword 0x8dc67f260e1bddc6
	.xword 0x1e3824e015ec665e
	.xword 0xfb1d755880df700c
	.xword 0xfd4e7d27edcfdf42
	.xword 0xf7be45daaadd5fa7
	.xword 0xfcd5ddf2767838a7
	.xword 0x54db25fb421f45ac
	.xword 0x0d3c031332ba63c2
	.xword 0x34d6642329b7c17f
	.xword 0x9689a96152d2dffc
_spu_hmac_fas_result:
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
_spu_rc4_key_array:
	.xword 0x17e113b4db35a83a
	.xword 0x451274de255fce6b
	.xword 0x72073b37e6194c2d
	.xword 0xa77b417ced9b3a3e
	.xword 0x612373032cfa69d6
	.xword 0xe5426d3a78a91310
	.xword 0xcdf7da5b07a2d4b0
	.xword 0x48087590c81602d8
	.xword 0xb8a6ee05be82e43c
	.xword 0xbe9e3b043ef78928
	.xword 0xa424f4b827276885
	.xword 0x1b22c020e6a8c731
	.xword 0x0af2ea2eca54076d
	.xword 0x4963c10c0ad83f6a
	.xword 0x7f6d659468257577
	.xword 0x14a335fb6fca2bb5
	.xword 0xb8cb1dad47814d75
	.xword 0xbc64394ccb30f6c0
	.xword 0xc374ef734d93c6ff
	.xword 0x6058b26cc967c4f5
	.xword 0xbc9fdc5d9ee6509c
	.xword 0xed97127c066b9d9b
	.xword 0x55c105b3ca41f7a7
	.xword 0xc0cd742afd926e78
	.xword 0x2165a84841c8c114
	.xword 0xf1c7a11ff434a30d
	.xword 0xee6a142a7fb469a9
	.xword 0x31a3e6466570804d
	.xword 0x408e8b704fcd7018
	.xword 0xfcefcd7a9dcc14b5
	.xword 0x8dea8271eace60ef
	.xword 0xcaa8ade2e3fc4055
	.xword 0x17e1627daf4a17d8
	.xword 0x0628b9ca784199dc
	.xword 0x12be25f7ea6d2243
	.xword 0x8fd08a9811b737f2
	.xword 0x25f6051390f08739
	.xword 0x9e2c9e7708cf5f5d
	.xword 0x435ba86cb8277290
	.xword 0xef9daa16ee32d731
	.xword 0x0bed1bec9767246a
	.xword 0xf4334395b3c982e8
	.xword 0x8952be60ccc2f23d
	.xword 0xeedb669326fa6c1f
	.xword 0x5b6435d40fd270bf
	.xword 0xa68008fa4b2d5068
	.xword 0xfac413fbd4198bc9
	.xword 0xd6fdf7b8d9190f12
	.xword 0x39410db798d90091
	.xword 0x8bf9d7176c69b7c5
	.xword 0x0bf92e82cc94d8f0
	.xword 0xe87681818b54c1e0
	.xword 0xfd2fd2d0d9907b1f
	.xword 0xd347243089348fe4
	.xword 0xbf7d80c297f08a00
	.xword 0x348520d4b8d1cc28
_spu_rc4_iv_array:
	.xword 0x4bd828930322620f
	.xword 0xe3de50f928682bc8
	.xword 0x19f5aeed1a09feee
	.xword 0x17bee44a3555980a
	.xword 0xfc177d10a82a9080
	.xword 0x8e1dce6b02bc7549
	.xword 0xdac999f7940638d7
	.xword 0x5dcab0f493acc00a
	.xword 0x6ae4c9dd0973fd0a
	.xword 0xcc8848b8dab779b4
	.xword 0x49e4b51c972ac378
	.xword 0xd3565a3c64528c07
	.xword 0x0fb666e796d11c56
	.xword 0x1acc12eefc789ecc
	.xword 0xdc74f721fa8a8b24
	.xword 0xb6ebb7ae2dbd8fb5
	.xword 0x4874ae7869c26162
	.xword 0x84a365982d58e2b0
	.xword 0xf9b2fcb9d02bccb5
	.xword 0xe6f525727bd82b8e
	.xword 0x24815bfcc24cdad8
	.xword 0xe6abd8429a0c2fea
	.xword 0xc2ea2390ff9ef2bb
	.xword 0x05ef94673daf3e43
	.xword 0x63a0f651009c5bd1
	.xword 0xb51800f69f45bd0c
	.xword 0x998b992fc59351b5
	.xword 0xbfde235df1e64bd5
	.xword 0x4991696eb74d2b16
	.xword 0x0b7631187206f213
	.xword 0xaa4f8974ce81c49a
	.xword 0x58f39e558e86819b
	.xword 0x904008c30c083cef
	.xword 0x7da68e248c28e621
	.xword 0x046e995058810027
	.xword 0x7d7cd42dd0a5679b
	.xword 0xe3527d6cabe5804b
	.xword 0x844d79c4906b0f84
	.xword 0x12551a18d479606b
	.xword 0xef2ef81b597da128
	.xword 0xfb54e1c40a264470
	.xword 0x17f88e0a7abb1d03
	.xword 0x8eb9b975d375b109
	.xword 0x9e297f967906be14
	.xword 0x3edbbf10f4cf8a01
	.xword 0x6a6702b0fcaab616
	.xword 0xfc0aa57cd25c73f4
	.xword 0xdd5dae221fb9aa5c
	.xword 0x908230e1cbeb511e
	.xword 0xfc05de0da78b6bdb
	.xword 0x1b599c1897b56f16
	.xword 0x3b67dde273190371
	.xword 0x9a45b64b6f16dee0
	.xword 0x400c2f7613f6fd23
	.xword 0x7f3341645479eedd
	.xword 0x44234eaf7cf776da
	.xword 0xff2f8e4616a5c73d
	.xword 0x61d4a60b3433eb55
	.xword 0x752cdb5dac5ab4c8
	.xword 0x2cd3ed6fb16400b2
_spu_rc4_alignment_array:
	.xword 7
	.xword 12
	.xword 0
	.xword 3
	.xword 11
	.xword 0
	.xword 14
	.xword 7
	.xword 5
	.xword 14
	.xword 11
	.xword 6
	.xword 5
	.xword 11
	.xword 15
	.xword 14
	.xword 10
	.xword 11
	.xword 14
	.xword 1
	.xword 15
	.xword 4
	.xword 10
	.xword 8
	.xword 5
	.xword 0
	.xword 9
	.xword 10
	.xword 14
	.xword 11
	.xword 0
	.xword 5
	.xword 14
	.xword 8
	.xword 9
	.xword 10
	.xword 8
	.xword 12
	.xword 2
	.xword 15
	.xword 3
	.xword 8
	.xword 4
	.xword 12
	.xword 0
	.xword 10
	.xword 1
	.xword 11
	.xword 15
	.xword 1
	.xword 9
	.xword 15
	.xword 6
	.xword 0
	.xword 1
	.xword 5
	.xword 14
	.xword 13
	.xword 13
	.xword 7
	.xword 8
	.xword 10
	.xword 11
	.xword 11
	.xword 4
	.xword 9
	.xword 12
	.xword 6
	.xword 6
	.xword 6
	.xword 12
	.xword 4
	.xword 13
	.xword 6
	.xword 9
	.xword 9
	.xword 5
	.xword 10
	.xword 2
	.xword 6
	.xword 2
	.xword 11
	.xword 11
	.xword 8
	.xword 3
	.xword 12
	.xword 10
	.xword 11
	.xword 10
	.xword 3
	.xword 14
	.xword 9
	.xword 8
	.xword 12
	.xword 6
	.xword 6
	.xword 3
	.xword 7
	.xword 11
	.xword 15
	.xword 4
	.xword 5
	.xword 5
	.xword 6
	.xword 8
	.xword 2
	.xword 5
	.xword 0
	.xword 2
	.xword 9
	.xword 14
	.xword 8
	.xword 11
	.xword 10
	.xword 7
	.xword 0
	.xword 6
	.xword 9
	.xword 12
	.xword 5
	.xword 14
	.xword 11
	.xword 8
	.xword 12
	.xword 9
	.xword 4
	.xword 12
	.xword 6
	.xword 7
	.xword 7
	.xword 7
	.xword 14
	.xword 9
	.xword 10
	.xword 9
	.xword 14
	.xword 8
	.xword 14
	.xword 5
	.xword 10
_spu_rc4_src:
	.xword 0x40e58ba23d47b4ca
	.xword 0x43ca53dc9d4e66fb
	.xword 0xb6dfbca17af89642
	.xword 0x30b8e3731277fab2
	.xword 0x45c556f6e82ffd4e
	.xword 0xe8b5ff385b0a5321
	.xword 0xb26428e0797265b3
	.xword 0x37b4ae4e3d3a7187
	.xword 0x4b463fa3b7ace537
	.xword 0x9ad5abce0bdd8ba6
	.xword 0x6865bb397f427166
	.xword 0xa402ae7defce9f32
	.xword 0x548c9fd9a2663064
	.xword 0xf41bc6cf7be78d6b
	.xword 0xe7ccdd869fd13fa8
	.xword 0x9954e89bc35a79db
	.xword 0x757e956872c484aa
	.xword 0x9905ec7f7f0b2d0a
	.xword 0xb0be89c05ee77e50
	.xword 0x202b6e4ddaa6f8f2
	.xword 0xef84791b6a093a17
	.xword 0xa9c2614956f2f6cb
	.xword 0xa4ee0db835aada12
	.xword 0x9ad80030d65bf6fa
	.xword 0x3e17449b0d46388b
	.xword 0xb7e451316cd59d69
	.xword 0x0db02280f6c1a324
	.xword 0x681be78c42713131
	.xword 0xb1615d014b35e936
	.xword 0x0b447bffa39786c9
	.xword 0xbd16ab235f849759
	.xword 0x33be7bdc8a51222e
	.xword 0xa76bc39d84f05966
	.xword 0x8d89b29a597a3016
	.xword 0xb6698e5c0e5ad935
	.xword 0x8ed44764f2c0a87a
	.xword 0x4b6220c1d67842d0
	.xword 0x2f493205b9e289cf
	.xword 0x8f78cb1885f4d941
	.xword 0x7a6b02022e851ff3
	.xword 0x8e8cd2c604d83a9a
	.xword 0xebdb0f00440c92e2
	.xword 0x1e059ab4b59194db
	.xword 0x312f323761bd6bf6
	.xword 0x488ccd22d335f522
	.xword 0xd6941047acdad999
	.xword 0xe38e2d9b53f40faf
	.xword 0x9108bbae8ffab1b8
	.xword 0x2f874a0f3c602920
	.xword 0x42fd77dcbab81b56
	.xword 0x1f9ae74d7623eeae
	.xword 0x1e35b885465763ae
	.xword 0x99860d89fb1e0741
	.xword 0x3de61242b54a4cb9
	.xword 0x9df84c1e14159170
	.xword 0xb31807209452fc2c
	.xword 0xfe2b4d58d448a0c3
	.xword 0xfa47aa930fa282d1
	.xword 0xae56e6197804252c
	.xword 0xb599670e6a73ffc1
	.xword 0x53b0b29f5168f6f6
	.xword 0x64fab3d78d961f0d
	.xword 0xddf567d4beded827
	.xword 0xeb271d61434bfbfd
	.xword 0xff5f160b915631a2
	.xword 0xbad326968a9a5f2c
	.xword 0xadf90b1262de83d3
	.xword 0x6c66dde4fe9a68e2
	.xword 0x74203ee4dabf47cf
	.xword 0x50179b25ef2738ff
	.xword 0x24c53dfcfa0c4938
	.xword 0x177a93adc6d6d1f6
	.xword 0xfb2521974554d9e0
	.xword 0x9e0bb612cf31f922
	.xword 0x2940f8ddf62dccad
	.xword 0x1d09458cb3b61b4e
	.xword 0x2dfa0dbd46369530
	.xword 0x90104267f6643f22
	.xword 0x42590103bcfdad1c
	.xword 0x3facb568a41251b4
	.xword 0x99ecec88a1a32fb8
	.xword 0xd23a6edab463d3ed
	.xword 0x07735bcdd8a3a85e
	.xword 0xaad671e899a60e30
	.xword 0x796e423fcb559c70
	.xword 0x86e394eb34292a96
	.xword 0xb77a2d2d33820a70
	.xword 0x7cc0f8eb952b3740
	.xword 0x0c1f0961df0e4b1d
	.xword 0x6a44f9c5f8f5bb96
	.xword 0x2bd55684685402ef
	.xword 0x8f722cf48e723ae4
	.xword 0x5ed34f6ce240733e
	.xword 0x735d236598d8748d
	.xword 0xd69c2bb3ad91929b
	.xword 0x49555730a58c3530
	.xword 0x893aef5c517b97a8
	.xword 0xff2cbbf8151367ba
	.xword 0xeb36a8cc51064243
	.xword 0xca45967ac1cc60f3
	.xword 0x9dbc0246c38bfada
	.xword 0xa4bd5e480eaa2112
	.xword 0x08fda92cc4872ab0
	.xword 0xfa023a2c416d154a
	.xword 0xad73e9358a0df740
	.xword 0x3486f20ef2cd21fb
	.xword 0xb989212cb6cc366c
	.xword 0xaa9959b726197f2f
	.xword 0x44c45b28d7a37440
	.xword 0xfba6fd5a34f4c0df
	.xword 0x0270837259aa48a3
	.xword 0xe50387781c06eb41
	.xword 0x68694260f2a15729
	.xword 0x06e1d40a4868c83a
	.xword 0x168fc2f17c806b89
	.xword 0x3e15a38049e6c116
	.xword 0xc802c1a634d7b5cc
	.xword 0x8e92127e8f951091
	.xword 0x09fbe0d0d86401f6
	.xword 0x17f1024f92271137
	.xword 0x2f2455813730232c
	.xword 0x8d2098c0c41add35
	.xword 0xffb6790231d72724
	.xword 0x63d01eee0a820d00
	.xword 0x76ad61541e77ef4d
	.xword 0x79e185d55e4b5175
	.xword 0x9799ac182aa98775
	.xword 0xaa29f657b3d6dd91
	.xword 0x9b9ce4fd5892607d
	.xword 0x554f5cf42ffd17d4
	.xword 0x4c901aba7f41988c
	.xword 0x9e23a3ca08d6459a
	.xword 0xd8148ae9e1de0ad3
	.xword 0x80e4a3a9b993e2dc
	.xword 0xd2f1e33ee9f4f768
	.xword 0x0b294e3bef5c7379
	.xword 0x41a0cbfd4d19dc6b
	.xword 0x499b60d2d250e8aa
	.xword 0x268f4798021f010f
	.xword 0x8d4a467b6c071b8a
	.xword 0x71d2c922db822bd3
	.xword 0x2981a96bda9fe4db
	.xword 0xf8a248ff3a85ea3d
	.xword 0x9d177ce591ddc2f3
	.xword 0x392b036d7e031ab8
	.xword 0x3a9bfc43f29fbaf8
	.xword 0x20320eaa8c0e6426
	.xword 0x0aa3671de0295a35
	.xword 0x695ab65018f863d0
	.xword 0xddd0e7ba7343bb7a
	.xword 0x70165ca54123fe92
	.xword 0x08de1c3a21325289
	.xword 0x3d610eb84d19668e
	.xword 0x3312f2927cf397a1
	.xword 0xfcecdfe228ab5d90
	.xword 0x1b21f92cd9e54a41
	.xword 0x98d612bfe3f11bce
	.xword 0x77757aaef2699b21
	.xword 0xbf26f300f8e84db0
	.xword 0xf245724394258009
	.xword 0xded05efcbacfa87b
	.xword 0x751db3d646499463
	.xword 0xbc7ee03e8675e472
	.xword 0x1336dbc72024a95b
	.xword 0xf3a4972d09277fb3
	.xword 0x0de2201c5e48bb0f
	.xword 0x34dcb4bee4e437f0
	.xword 0x5f2032001dff6ec6
	.xword 0x11932e14cde59629
	.xword 0x327e09659eb6d72a
	.xword 0xd041953c03fe0c3c
	.xword 0x94efcf0910765892
	.xword 0x9dbec71e6ed841bf
	.xword 0x7cfad80535df0fb1
	.xword 0xd8bf00e02ef5579c
	.xword 0x1aca8c490734b949
	.xword 0x250ce0069c894cb5
	.xword 0x2a681c24699ba720
	.xword 0x48078ae785335143
	.xword 0x9788c70cc3676dc2
	.xword 0x396d422385891295
	.xword 0x1e7b4a55959f7998
	.xword 0x60a3759c47a7dd06
	.xword 0x31c40a5c9bbb0fc7
	.xword 0x98921e310cd2097a
	.xword 0x6de81087be1a120b
	.xword 0x83b3969dcde41fa9
	.xword 0xd12c1bd0a4a85480
	.xword 0xce376af21f4d340f
	.xword 0x06ab33cb3becbbcb
	.xword 0x249f967958f1ca37
	.xword 0x79ee35770ee68f13
	.xword 0x2527105d8175b1f1
	.xword 0x8db15d46e9ca5531
	.xword 0x04f71173925fbaa0
	.xword 0xceced1d6b7513f58
	.xword 0xd02147d144670f93
	.xword 0x48c618046884c204
	.xword 0x941a9b4ef82a9cad
	.xword 0xda164ca6898f7544
	.xword 0x3acedcb32cfc35be
	.xword 0x3b0e78d935d907e3
	.xword 0x5e17372732205353
	.xword 0xf10c3c9fdbdf972b
	.xword 0xfbf9a6ae66671d6e
	.xword 0x49b193325a2791b2
	.xword 0x593a80eda124f281
	.xword 0x56a06b82a4d15f6d
	.xword 0x44b319564f2e4698
	.xword 0x079c858b8c5e038a
	.xword 0x20006922efa19d69
	.xword 0x551b5e76a0c6d85f
	.xword 0x7830968a164c54fe
	.xword 0x172da3c40075adae
	.xword 0x4e55762a4caec31c
	.xword 0x88bfd8c90df9ac80
	.xword 0xcd5b7f0bca5c421a
	.xword 0xd9d081a9332158a2
	.xword 0xa254039bc3c3f504
	.xword 0xdf2d46260c0849e0
	.xword 0xa0973c23f0b0dcf8
	.xword 0xaeb800b8d36492a7
	.xword 0x9fe9f9f1202114a6
	.xword 0x9d90d5d40032c330
	.xword 0x0a73daf6089b9c33
	.xword 0xa7e1f27f6112042f
	.xword 0x5de215169a20997f
	.xword 0x938f2dcbc64533f7
	.xword 0x6438f9ccc7ecd02c
	.xword 0xf76fb93dff4940cb
	.xword 0x0bc262f65efe1ccb
	.xword 0xa1ee39bcaa892153
	.xword 0xbe33b09a2261ad9a
	.xword 0x64b9bdf2ece8f2cb
	.xword 0xfc08738bc5ba2062
	.xword 0x24a3a0f7bf60fdde
	.xword 0xc69cc31bfa8daa4f
	.xword 0xe6beb7017d36fa18
	.xword 0xc73c4d35bccef4fc
	.xword 0xa4702493fcc2ea93
	.xword 0x0f09569590fadbac
	.xword 0xdfea4d0a508dabf4
	.xword 0xf41b565e4fede7e3
	.xword 0x6fcf08af5f33b90c
	.xword 0xf917247b4d921e41
	.xword 0x901d1fd261e81194
	.xword 0xce3b4e537d8c3847
	.xword 0x4a78d0b87b5f9de5
	.xword 0x3c18f49093346a8a
	.xword 0x6ad901c07c263f21
	.xword 0x34e5154e562b7f4d
	.xword 0x1dd6427ddcc00ec7
	.xword 0x9f4af572086c179c
	.xword 0xdab02e34558cd746
	.xword 0x50873d07cc788a17
	.xword 0xa6e4f9483861de39
	.xword 0xfc2ac6a8ca421bb7
	.xword 0x4760fe92e1549ae0
	.xword 0x804f5cef3976be56
	.xword 0xf25480616d131a35
	.xword 0x89a65564309c3786
	.xword 0xebd8ba07a4a9dbc5
	.xword 0x32440272b350b1dc
	.xword 0x08375f3b88b7afc2
	.xword 0x65f2e141ffef993f
	.xword 0xa31664602eb5caf3
	.xword 0x8de08ba5095a12ae
	.xword 0x5c7a1c5abcf8fcdc
	.xword 0x30c0c5caaaa11257
	.xword 0x1014b83b2c665821
	.xword 0x76bc9c505802c8f7
	.xword 0xc4886ab03b6b2400
	.xword 0x59b68a95d06b35f1
	.xword 0x812ba62a2507fd3c
	.xword 0x73eeaaeee7ef8ee7
	.xword 0xca5b1f13c467722d
	.xword 0x7233c2bdce72dbfe
	.xword 0xa387ee6fad0062b2
	.xword 0x235a2010a687541a
	.xword 0xbd54ce6864c75dae
_spu_rc4_dest:
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
_spu_rc4_auth_key:
	.xword 0x94d248d91b311812
	.xword 0x73fc4733684b8c7c
	.xword 0xa54b42898e4cb1cf
	.xword 0x00e2257050a589d4
	.xword 0x3cb815635f99bce5
	.xword 0xcd9fcb2e3a897ea8
	.xword 0xa0a76779244d67c2
	.xword 0x3d61ef6e22d6bdef
	.xword 0xc2be43635e7225a2
	.xword 0xc9d37dfd067e53cd
	.xword 0x5587c2a4695bca30
	.xword 0x86bcae3daecc984f
	.xword 0x61fdb6e09c3a124f
	.xword 0xee9f4c4a0e820bd0
	.xword 0xf6210a7ddf8dde4c
	.xword 0x875de2b03f295da8
	.xword 0xdcd8dc0d1b9d7409
	.xword 0xf7c9c4d08bff1e32
	.xword 0xe5eac060750dc462
	.xword 0x398d9de3bf65a859
	.xword 0xf5473a5a8506d75f
	.xword 0xc295dc1ace3c92a5
	.xword 0xc038db8f8783377f
	.xword 0x1add3e3863a266b6
	.xword 0xc1846dcddaee05cd
	.xword 0x4ab2340388061c41
	.xword 0x61a5389c1486416b
	.xword 0x9b4f25624e153894
_spu_rc4_auth_iv:
	.xword 0xaf8db2b47a75eefa
	.xword 0x0a962341648547ae
	.xword 0xe9c837bfe3157370
	.xword 0x2aca3e7c875f4eee
	.xword 0xd2d31a792b18713a
	.xword 0x795a25a79bf9c05d
	.xword 0xcccfb0d33b2e5ad7
	.xword 0xe4fe5f88d8d0bb6f
	.xword 0x6614fb8aea97fa1d
	.xword 0x0a227667a62cf823
	.xword 0x91153a304caa0b8b
	.xword 0xff1d226ea1f8eb9d
	.xword 0x236f2537b4735b22
	.xword 0x02ee6c45ed3d70c9
	.xword 0x8afc378ff72c465b
	.xword 0x734d8f96d9b88e92
	.xword 0x4ed19dcf604665d9
	.xword 0x18e9e2a8e81b39d8
	.xword 0xe0e7c580ffaff2d0
	.xword 0x11b11f8db66f68f4
	.xword 0x04ce3bc4a78cc48c
	.xword 0x2c6793e558000097
	.xword 0x9c92aa8c3ef3ea0c
	.xword 0x8a929d5533f7f462
	.xword 0x6960265efaadee87
	.xword 0x6c17d64a84e69988
	.xword 0x2af2fcd103e51b01
	.xword 0x6bdeef7d0ca414d7
_spu_rc4_fas_result:
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
_spu_sslkey_key_array:
	.xword 0xb7c6cc75bca5cc9b
	.xword 0x1a9287d7e2c5a96d
	.xword 0xcd4aedbd989b8b92
	.xword 0x84ba139fe64160a9
	.xword 0xc4b1a7baf8c8867e
	.xword 0x76fa16bcb7bc3e92
	.xword 0xa110ee3f1a241544
	.xword 0x64aa125673f959a8
	.xword 0xbc069928bea0f73a
	.xword 0xc731016b28dfc490
	.xword 0x9122cf3273464f82
	.xword 0x99808c3f694d6195
	.xword 0x1a7c652d7764750e
	.xword 0x94fd257cbe02fe1c
	.xword 0xce3786961150f330
	.xword 0xd780a4963da2ed9c
	.xword 0x14f723c31992db2c
	.xword 0x262563dd2d1a53e3
	.xword 0xaf9ec9c76708feae
	.xword 0x31010149d1dfc2d7
	.xword 0x62244d20c773b7ba
	.xword 0xfa3a13b580573090
	.xword 0xa81b7bb713a7348b
	.xword 0xf11048d2391b7aef
	.xword 0x66aaad040fe80f87
	.xword 0x427fa19bac188886
	.xword 0xeb6b461fd0df91c6
	.xword 0xc532360a9c297329
	.xword 0x6d51213ade4258af
	.xword 0xee9123a2f0aafe8a
	.xword 0x284f83306b05f755
	.xword 0x09fe2303c83ee215
	.xword 0x0fc5c5d4344b669f
	.xword 0xfd357ccc192e6f15
	.xword 0x9c71a0cdc4d26dc3
	.xword 0x485f445cc129437a
	.xword 0x7ce8afa9edb6bc9a
	.xword 0x28dc65f4419b0eec
	.xword 0xce5dfd920b58fc7b
	.xword 0x0e247c959e5ddb45
	.xword 0xaa478f6edcc7604f
	.xword 0x0abeda0683956c30
	.xword 0x4896121b734580a9
	.xword 0xf86a6fc3419c9f61
	.xword 0xd317dfbe2cbc9da9
	.xword 0xdd10b9e796cbf016
	.xword 0xf9692909f0b160cc
	.xword 0x579443b6c3775ed3
	.xword 0x63d9cdd312d54bd1
	.xword 0x4f341728c3bacc32
	.xword 0x04d2060f5f0db3ea
	.xword 0xb9bd5e525d350909
	.xword 0xd9b989a97e5b7b80
	.xword 0xa65ea9c28f8606c8
	.xword 0xedb1458e0e44bc4f
	.xword 0xfd9f4ee87a807759
_spu_sslkey_iv_array:
	.xword 0xb43df910938d747d
	.xword 0x3f1d54a00d987367
	.xword 0x52f9fb3efc8ed3ab
	.xword 0x5dc682c705165f94
	.xword 0xd9e8acaac22d3826
	.xword 0x7370948b17f7f89e
	.xword 0xe3a958f68e553dcb
	.xword 0xa3862b81f4dd50ae
	.xword 0x84edfd25b2996eed
	.xword 0x01a3919e61978072
	.xword 0x1ce0fd913c8e6ae3
	.xword 0xeafed796128725d0
	.xword 0x78da89d5956222aa
	.xword 0xb8617ddd1d12a756
	.xword 0x5a27abaa30b9da97
	.xword 0x7a6ef11e85ae8d1a
	.xword 0x60f1d710ae23cd2e
	.xword 0x1b253e727205fef5
	.xword 0xc81c879b34555383
	.xword 0x81d69265f11d861b
	.xword 0x7ce4b679bd46cd91
	.xword 0x95b5cea5cd8e5903
	.xword 0xc30bc01225bb79e9
	.xword 0x7525cb1c49318bf1
	.xword 0x9a0c15ef603b0acd
	.xword 0x43a1c3d2e02bf93f
	.xword 0x75fcddb263beab5c
	.xword 0x9dfcd6d7a006aade
	.xword 0xdb87bf8582076077
	.xword 0xc0a364962d375dc5
	.xword 0xbe63ec595753268e
	.xword 0xb371282ce891fac9
	.xword 0xf0ecb8a3036ea968
	.xword 0xfac25d993e8d9e53
	.xword 0x0c346b93198646b6
	.xword 0x32ccf3b610136ec2
	.xword 0x5d505a3fef270d38
	.xword 0x2a5ac9c513e5d702
	.xword 0x236b48616c3ad264
	.xword 0xa473f322e9f47810
	.xword 0x00896c0ebb29cb24
	.xword 0xf8041871f3df3f77
	.xword 0x5367f3c96d2ffd56
	.xword 0xbbef17a8bb27fdde
	.xword 0xe7dcc5e84feca0b8
	.xword 0x432dbdce26b08051
	.xword 0x0127fd02a98f43f4
	.xword 0x8cd47be761c975d4
	.xword 0x098d2a14abc034e6
	.xword 0xfdc0c56879fb9a24
	.xword 0x2c51af06c8f39685
	.xword 0x6f6076083428fce3
	.xword 0x698b57d0d4a69d8f
	.xword 0x6e87a05c4b624434
	.xword 0xe36658092d378d22
	.xword 0x350f892b6ccc105d
	.xword 0x609251d33644dc60
	.xword 0xe10d79ab8c2432e2
	.xword 0x9805f3e988c53041
	.xword 0x245612a774c900d6
_spu_sslkey_alignment_array:
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
	.xword 0
_spu_sslkey_src:
	.xword 0x59952ec9c2858502
	.xword 0xe185dc8a74549641
	.xword 0x6482dfca24546f58
	.xword 0xf540ea066d3ff537
	.xword 0xbd65af3c4dc9efe9
	.xword 0x6650d424f9f06ead
	.xword 0xe6c814b849de12f4
	.xword 0x4a783dab97121e3a
	.xword 0xcd1de269ca7d55ae
	.xword 0xc2ca517510cc8fa0
	.xword 0xff9c7243dce37044
	.xword 0x4525cf5d8add52ac
	.xword 0x1e3ecb83a3ef0af2
	.xword 0xccb69f577b6df178
	.xword 0x8807e51ada813178
	.xword 0x5a0256c87210e038
	.xword 0x0b7ed29849567830
	.xword 0xd895a693e6dfa853
	.xword 0x930cc6cf533f56d6
	.xword 0x441105abeee1c74d
	.xword 0xfa4bd45d3f61c98b
	.xword 0x7ad856fac23acd39
	.xword 0x43443af317f1ca8e
	.xword 0x90e958d278d66116
	.xword 0x0b39147347011ec8
	.xword 0x6baf3229a4cc1b64
	.xword 0x21cfca41c8dfee91
	.xword 0xb15b798389608b3c
	.xword 0xaa28200406238e35
	.xword 0x63a3aacd92776f83
	.xword 0x8774bca341f907f4
	.xword 0x38979b87f3e3c6a8
	.xword 0xcae8b8ad61293960
	.xword 0x49e3a8750c4836c1
	.xword 0x767f645d8fd9e489
	.xword 0xaf1ce35d992899fd
	.xword 0x2ca15307eb341277
	.xword 0x9cd54aab1622fc00
	.xword 0x862fd86bcee64a5f
	.xword 0xa4fbf674e6e32113
	.xword 0xa0858fa3cb8c2ff4
	.xword 0x203f71bf99aa29f9
	.xword 0xa1a638f286b5deb5
	.xword 0xbf16767e81f73381
	.xword 0xc86cb33b5555ab83
	.xword 0x9f4399b85e74f2a7
	.xword 0x97903244bd7a0a12
	.xword 0xdfe2d3eb0c2237a3
	.xword 0xd37c22c5e805d536
	.xword 0x8add7e361fc97f58
	.xword 0xa58c01ea1ce4767d
	.xword 0x91d7ff026eaf3061
	.xword 0x5a1775ca543d5f6a
	.xword 0x17b15931ffab1212
	.xword 0x6496549fc83bfdcd
	.xword 0xd35ed57a9910e976
	.xword 0x61578334aa8245da
	.xword 0x38a915bfd18daffa
	.xword 0x3f0b6750b907cbae
	.xword 0x64be35dedcff7d78
	.xword 0x6dc9394337ccd076
	.xword 0x9eae743f060f0302
	.xword 0xfb1c65f5186c26ea
	.xword 0xe8d5a65b6976b2bd
	.xword 0xd393eb01c01d6f1c
	.xword 0xf255c30190981f05
	.xword 0x23d9919cfe0ec430
	.xword 0x2296f7d900e9a2ec
	.xword 0xa505c1199a278eaa
	.xword 0xa0595022773cc229
	.xword 0x263da0eee016ea4e
	.xword 0x004dec5935b876bf
	.xword 0xbd14e7a14f418edf
	.xword 0xc3adf49d36a9b71d
	.xword 0x87a5e2c019fa9a41
	.xword 0xe6f2c82023602d70
	.xword 0xedfeed0a648763ad
	.xword 0xa4a1663f06e86719
	.xword 0xf5ec02fe818eda9b
	.xword 0xd1f4bb7b965fbda8
	.xword 0xb4df4a014a395cf6
	.xword 0x0a9f7350a337937c
	.xword 0xc5e7bba70a0018b2
	.xword 0xa4ecc9b289713b0f
	.xword 0x2cd06372e0ce5334
	.xword 0x68a19f309b37e424
	.xword 0x3f16d66125be7479
	.xword 0x0ef18a28c2985cd3
	.xword 0xcc80f03f0cfa64a0
	.xword 0xb398935df78be27f
	.xword 0x8ad201d98b0e7dbf
	.xword 0xb4a072a27551bacd
	.xword 0xc0d7124080c6bc56
	.xword 0xffa813e0d4bcce81
	.xword 0xe4e5c0fa30b1adc3
	.xword 0x8158c936d53141a7
	.xword 0x932eafbee27fd22c
	.xword 0x0b665ed9210b5dbe
	.xword 0x64ca8ee62d96c3fd
	.xword 0x17e858bbac17d93a
	.xword 0x9917618429185ff9
	.xword 0x6470c5d81a30b9c2
	.xword 0xdcb0b6e3b54b5811
	.xword 0xb33a9c80e0fe9724
	.xword 0x6be6b4efa36bc819
	.xword 0xd66ca6024380671f
	.xword 0xd3ffd48e9de58b5d
	.xword 0x532077abe4272005
	.xword 0xa9c5e0b645248022
	.xword 0xa3e1ed705572eec4
	.xword 0x0d6cee92d0f9482a
	.xword 0xea475676622c0f83
	.xword 0x68fb3d7e9e81ec12
	.xword 0xab3f8f0c74bbe732
	.xword 0xc2fdc9e836ec92e0
	.xword 0xf5d697ca85465245
	.xword 0xacf8d81e831881c4
	.xword 0x0f21e8d2cabb5391
	.xword 0x77c1b91909f2d964
	.xword 0xe33c7cab91fef470
	.xword 0xa82c1bcbf8e5a432
	.xword 0x5c366e2e089bed11
	.xword 0x66ffaf398b38ad6e
	.xword 0xfec167968df4bcb7
	.xword 0x889b399747c214f0
	.xword 0xd81efacb3230d857
	.xword 0xe17a7aa115049662
	.xword 0x762fc3d9f9c0d9ea
	.xword 0xdb2b6294a0eb7954
	.xword 0xcb9cb0da2271b22c
	.xword 0x5784ac344eed5b13
	.xword 0x3ae7de2ba8f08121
	.xword 0x90ab68263df17e3b
	.xword 0xa0efd5c170cc1dc5
	.xword 0xdf8300332d265fdf
	.xword 0x24cd903eb88727af
	.xword 0x8a5c409807f25e17
	.xword 0x3fe38eabf728595b
	.xword 0xed168dc4f129504f
	.xword 0x01161e223a3809c1
	.xword 0x6764b870481abbf8
	.xword 0xb3ca5cbf78f2495e
	.xword 0x6327cc67e7b27763
	.xword 0x9ae7cf04f4ebf5df
	.xword 0x5340de31dfc15e5f
	.xword 0x60f0684788cc8ec7
	.xword 0xb8fc0352a5b52dae
	.xword 0x1659c3b2f1b339be
	.xword 0xbe7dea164510043a
	.xword 0xd2f243025a64f629
	.xword 0x2c37c176b2db306f
	.xword 0x97caee3b9d960ab6
	.xword 0xae25095a11a4f6de
	.xword 0x13663142a559c4c6
	.xword 0x5fe377af479bcd73
	.xword 0x550f7ff07e55d418
	.xword 0x36a2077c28e496ae
	.xword 0xd30b66b83cb1bdd1
	.xword 0x8978afc575cd0aff
	.xword 0x1b39262ca088e6da
	.xword 0xc68b25dc92820a67
	.xword 0x1f5291b429b733bf
	.xword 0xf8f6a4374b72c729
	.xword 0x86f127b1c7bb46cf
	.xword 0xebb552e9c3b84212
	.xword 0x9fbc14482a884a3c
	.xword 0x3bdc0e0990e2e8ea
	.xword 0x746fa7e51ea1b3fb
	.xword 0x0feddefce7a9df42
	.xword 0x987625cae589ebaf
	.xword 0x6a9502c91e410218
	.xword 0xfd311f70f9648f6c
	.xword 0x4a8261b2fdf4972a
	.xword 0xdd243a2665f9fe5d
	.xword 0x258dd4e22d96a8ec
	.xword 0xa6d18f24d5ff14aa
	.xword 0x5f610ad5db626c5d
	.xword 0xb09ccd64c064f280
	.xword 0x11b96949bd45043d
	.xword 0x5ba740c42da85e7e
	.xword 0xc81acadce3c1bee6
	.xword 0x1f45119fb50d3bfe
	.xword 0xdad3af3bc912eff4
	.xword 0xadc5b69e6a7040c3
	.xword 0xe51b2f15a0c1801c
	.xword 0x584b8dfedcc8e2b6
	.xword 0xe481ac48c68d1d71
	.xword 0x9cdf28496e4661ed
	.xword 0x98cbb3bea172b303
	.xword 0x2aec1167ac3f4990
	.xword 0x224994ce453597a9
	.xword 0x97a70fff467814c8
	.xword 0x519e9c0449da4aff
	.xword 0x5b73bb14a0222f3f
	.xword 0xcb5dcd8d282b584d
	.xword 0x62e6c2ac410a6e43
	.xword 0x384a9e92cc71bda7
	.xword 0xd315d8167b7a54d1
	.xword 0x5c5a93e32abf5d0f
	.xword 0xf4f082426ceb286b
	.xword 0x334a7401837f8bbc
	.xword 0x0a20c425214ae9ac
	.xword 0x73f9a063ae3332b8
	.xword 0x36edb61669767483
	.xword 0xfa4a8e0d94ff3fba
	.xword 0x5803fc856fb55565
	.xword 0xef14331ce4c305ae
	.xword 0x0330896a9d57635f
	.xword 0x25f3ea2a9883becd
	.xword 0xb4c93c6e486d2973
	.xword 0x3f0559313316df10
	.xword 0x27313e37532d5f56
	.xword 0xfb489bb4d5c47771
	.xword 0x2d7386acf43aadac
	.xword 0xecb982e37e395c0f
	.xword 0x834647e1e01d134a
	.xword 0x062077ae9b61dc6a
	.xword 0x10d2525f2c8fd7ad
	.xword 0x9ac143c8ebde6973
	.xword 0x3bc95ada927272ac
	.xword 0x90a6fcc29d2525af
	.xword 0xcd2820aff8e4c4ca
	.xword 0x095e243190f76ae7
	.xword 0x06b457219e31696f
	.xword 0xddaffb2ee53b9089
	.xword 0xc29261e68b23a279
	.xword 0x35574189688cb15f
	.xword 0x79f1d0957eeb2e04
	.xword 0x047024424790971e
	.xword 0x170c0e0109dd01ac
	.xword 0x251d6eeb4654490b
	.xword 0x90636d8df223256d
	.xword 0x91f9aa24fcb73831
	.xword 0xfd8aa17467b1706d
	.xword 0x79f61b6b78f3aa51
	.xword 0x5313d78e8ffc3ace
	.xword 0x5f8b66f2e61ac84f
	.xword 0x835bf90baee9ddbb
	.xword 0xcafe0c0f74e54aa5
	.xword 0xbbfcb0f6a36b5e69
	.xword 0xda6c9c72e8b4ba98
	.xword 0x345fd6e9c5f2c2c4
	.xword 0x7c634db5f41499e0
	.xword 0xd1ed477a9dc28a17
	.xword 0x4f4dcda6244a280f
	.xword 0x8412ef0d38656e0c
	.xword 0x334e996136fd2320
	.xword 0x8aff171feec63777
	.xword 0x3a65cd859aeb8588
	.xword 0xa65d58f4f6d8741b
	.xword 0xe965f7151eacaf4a
	.xword 0xffb9eac522e0c86e
	.xword 0x0b0867e5d0dc7a31
	.xword 0x79bd37a2eb5c1b80
	.xword 0xaaee9738f731392f
	.xword 0x76515a15f0637a89
	.xword 0xefa427a4a756e697
	.xword 0x9a1471a489bad88b
	.xword 0x9ee646e2e6267f5a
	.xword 0x2ad5b58fda2bca0e
	.xword 0x52d420eb388960ab
	.xword 0x51ab2b122dfa5bf1
	.xword 0x33dd424dd9dde494
	.xword 0x2d278f65c96395fa
	.xword 0xfa721bb7f185bb49
	.xword 0x4d602d029d213e3b
	.xword 0xff6f12081f08f737
	.xword 0x9c5363e8f46d1850
	.xword 0xa6275e82b98518b9
	.xword 0xf48dbb1476d43341
	.xword 0x99aead5d2bcf83f6
	.xword 0x49b4d555b686b814
	.xword 0x1b31433ad54e9eed
	.xword 0x5c6c2845587162c9
	.xword 0xc3f9830efa7bffc2
	.xword 0xecc2ec8af40cb968
	.xword 0x809677978ba0f7b1
	.xword 0xf497caa87c8c286d
	.xword 0xba4fbb0b99e77942
	.xword 0xea0be8bd91805379
_spu_sslkey_dest:
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
_spu_sslkey_auth_key:
	.xword 0xffbb5f65df1a3ca9
	.xword 0xd3317f96b0a25040
	.xword 0x8656ab9dde533ba8
	.xword 0xe3df0629b396253f
	.xword 0xa5632df354272a28
	.xword 0xadfefecfe96a4568
	.xword 0xb65fbf3e945458e9
	.xword 0x736263d3b7a3f5bd
	.xword 0x14512961d8e3cc4f
	.xword 0x25b8dd1d80f96af1
	.xword 0x06e096e9101b5314
	.xword 0x23640eb4d34499e5
	.xword 0x3b52756c3611175b
	.xword 0x2f842e5b6066bb94
	.xword 0xfd49c294d8407ddc
	.xword 0x24315446c15335b4
	.xword 0x62b54c04f9717c54
	.xword 0x1b2983fe865ae509
	.xword 0x5278fdb33e5575d3
	.xword 0xb50a2164e3b48505
	.xword 0xc73c3ab23842947f
	.xword 0x0a3e9669356e24f2
	.xword 0x879d03ac3721ddc4
	.xword 0x9503b64b719643f7
	.xword 0x6c79647dde26159b
	.xword 0x0a6a03f67b564391
	.xword 0x97113d168c66d291
	.xword 0x04521967961e8c54
_spu_sslkey_auth_iv:
	.xword 0x89464252b62826b0
	.xword 0x725dae784d3ffdee
	.xword 0x029e7eabd89fbf72
	.xword 0x7ce2e00dedbba0b5
	.xword 0x5be0d2d9a04dfe43
	.xword 0x2c5c9b290951ecdc
	.xword 0x243c8181d8ec0322
	.xword 0x0c6c6d6743a2e71a
	.xword 0x58c173b9cc229797
	.xword 0xe95205695679ede8
	.xword 0xd7772a3252343958
	.xword 0x88dcc4d4954a3956
	.xword 0x8e4c8bd78f8b7d12
	.xword 0xa61064d66556023c
	.xword 0xa86aeaa13151bce0
	.xword 0x7b6fbbdec0cd60a7
	.xword 0x310fbf7018c168b3
	.xword 0x96d7640ea1ff3fa6
	.xword 0xbeebaed705bda62e
	.xword 0x6ef692acd44232cf
	.xword 0x014b76d85cb0ea8a
	.xword 0x54f6ae31320e1928
	.xword 0xc3b71bde979aa270
	.xword 0xe35c946a238d0190
	.xword 0xcaa06a23a087fbe6
	.xword 0xddfeb337fb361e72
	.xword 0x734bae19f5353410
	.xword 0x1d87eca8fade9c04
_spu_sslkey_fas_result:
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
	.xword 0xDEADBEEFDEADBEEF
_spu_aes_toc:
	.xword _spu_aes_cwd_array
	.xword _spu_aes_src
	.xword _spu_aes_auth_key
	.xword _spu_aes_auth_iv
	.xword _spu_aes_fas_result
	.xword _spu_aes_key_array
	.xword _spu_aes_iv_array
	.xword _spu_aes_dest
	.xword _spu_aes_alignment_array
_spu_des_toc:
	.xword _spu_des_cwd_array
	.xword _spu_des_src
	.xword _spu_des_auth_key
	.xword _spu_des_auth_iv
	.xword _spu_des_fas_result
	.xword _spu_des_key_array
	.xword _spu_des_iv_array
	.xword _spu_des_dest
	.xword _spu_des_alignment_array
_spu_copy_toc:
	.xword _spu_copy_cwd_array
	.xword _spu_copy_src
	.xword _spu_copy_auth_key
	.xword _spu_copy_auth_iv
	.xword _spu_copy_fas_result
	.xword _spu_copy_key_array
	.xword _spu_copy_iv_array
	.xword _spu_copy_dest
	.xword _spu_copy_alignment_array
_spu_crc_toc:
	.xword _spu_crc_cwd_array
	.xword _spu_crc_src
	.xword _spu_crc_auth_key
	.xword _spu_crc_auth_iv
	.xword _spu_crc_fas_result
	.xword _spu_crc_key_array
	.xword _spu_crc_iv_array
	.xword _spu_crc_dest
	.xword _spu_crc_alignment_array
_spu_hash_toc:
	.xword _spu_hash_cwd_array
	.xword _spu_hash_src
	.xword _spu_hash_auth_key
	.xword _spu_hash_auth_iv
	.xword _spu_hash_fas_result
	.xword _spu_hash_key_array
	.xword _spu_hash_iv_array
	.xword _spu_hash_dest
	.xword _spu_hash_alignment_array
_spu_hmac_toc:
	.xword _spu_hmac_cwd_array
	.xword _spu_hmac_src
	.xword _spu_hmac_auth_key
	.xword _spu_hmac_auth_iv
	.xword _spu_hmac_fas_result
	.xword _spu_hmac_key_array
	.xword _spu_hmac_iv_array
	.xword _spu_hmac_dest
	.xword _spu_hmac_alignment_array
_spu_rc4_toc:
	.xword _spu_rc4_cwd_array
	.xword _spu_rc4_src
	.xword _spu_rc4_auth_key
	.xword _spu_rc4_auth_iv
	.xword _spu_rc4_fas_result
	.xword _spu_rc4_key_array
	.xword _spu_rc4_iv_array
	.xword _spu_rc4_dest
	.xword _spu_rc4_alignment_array
_spu_sslkey_toc:
	.xword _spu_sslkey_cwd_array
	.xword _spu_sslkey_src
	.xword _spu_sslkey_auth_key
	.xword _spu_sslkey_auth_iv
	.xword _spu_sslkey_fas_result
	.xword _spu_sslkey_key_array
	.xword _spu_sslkey_iv_array
	.xword _spu_sslkey_dest
	.xword _spu_sslkey_alignment_array
.global _spu_table_of_context
_spu_table_of_context:
	.xword _spu_aes_toc
	.xword _spu_des_toc
	.xword _spu_copy_toc
	.xword _spu_crc_toc
	.xword _spu_hash_toc
	.xword _spu_hmac_toc
	.xword _spu_rc4_toc
	.xword _spu_sslkey_toc

!# CWQ data area, set aside 512 CW's worth
!# 512*8*8 = 32KB
.align 32*1024
.global _spu_cwq_base
_spu_cwq_base:
	.xword 0xAAAAAAAAAAAAAAA
	.xword 0xAAAAAAAAAAAAAAA
	.xword 0xAAAAAAAAAAAAAAA
	.xword 0xAAAAAAAAAAAAAAA
	.xword 0xAAAAAAAAAAAAAAA
	.xword 0xAAAAAAAAAAAAAAA
	.xword 0xAAAAAAAAAAAAAAA
	.xword 0xAAAAAAAAAAAAAAA
.align 32*1024
.global _spu_cwq_last
_spu_cwq_last:

.end


#if 0
#endif
