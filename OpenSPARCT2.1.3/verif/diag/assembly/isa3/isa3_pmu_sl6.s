/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_pmu_sl6.s
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
#include "hboot.s"

#define MA_TIMEOUT 0x100

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:		/* test begin */

        !# Switch to hpriv mode
	ta T_CHANGE_HPRIV

	!# Check to make sure pic is zero
        rd	%pic,	%g4
        cmp	%g0,	%g4
        bne,pn	%icc,	fail

	!# Clear event counter
        clr	%g6

	!# Setup PCR Register to monitor DES operations
        set	0x00018048, %g2
        wr	%g2, %g0, %pcr

	!# Execute Main Diag ..
	!# setup ASI register to point to SPU
        wr %g0, 0x40, %asi
	
	!# Make sure CWQ is currently disabled, not busy, not terminated, no protocol error; else fail
	ldxa [%g0 + ASI_SPU_CWQ_CSR] %asi, %l1
	and %l1, 0xf, %l2
	cmp %g0, %l2
	bne,pn %xcc, fail
	nop 
	
	!# allocate control word queue (e.g., setup head/tail/first/last registers)
	setx CWQ_BASE, %g1, %l6
		
	!# write base addr to first, head, and tail ptr
	!# first store to first
	stxa	%l6, [%g0 + ASI_SPU_CWQ_FIRST] %asi 
        ldxa	[%g0 + ASI_SPU_CWQ_FIRST] %asi, %l1
	!# Mask off upper 16 bits
	setx 0x0000ffffffffffff, %l5, %l0
	and %l0, %l6, %l2
	cmp	%l1, %l2
	bne,pn %xcc,	fail
	nop

	!# then to head
	stxa	%l6, [%g0 + ASI_SPU_CWQ_HEAD] %asi 
        ldxa	[%g0 + ASI_SPU_CWQ_HEAD] %asi, %l1
	cmp	%l1, %l2
	bne,pn %xcc,	fail
	nop
	
	!# then to tail
	stxa	%l6, [%g0 + ASI_SPU_CWQ_TAIL] %asi 
        ldxa	[%g0 + ASI_SPU_CWQ_TAIL] %asi, %l1
	cmp	%l1, %l2
	bne,pn %xcc,	fail
	nop
	
	!# then end of CWQ region to LAST
	setx CWQ_LAST, %g1, %l5
	stxa	%l5, [%g0 + ASI_SPU_CWQ_LAST] %asi 
        ldxa	[%g0 + ASI_SPU_CWQ_LAST] %asi, %l1

	!# Mask off upper 16 bits
	and	%l0, %l5, %l2
	cmp	%l1, %l2
	bne,pn %xcc,	fail
	nop
	
	!# Build the first control word, for the first DES vector.
	!# First build up word 0
	!# For DES, set op = 64, Enc=1, SOB=EOB=1, SFAS=0, Int=CoreID=0, AuthType=0, EncType=09, status=0, Len=24
	setx 0x40E0000009000017, %l1, %l2
	!# %l6 points to CWQ_BASE
	!# Note:	All CWQ entry addresses must be physical!
	stx	%l2, [%l6 + 0x0]
	
	!# Write source address to next CW field
	setx cleartext_1, %g1, %l2
	stx	%l2, [%l6+0x8]

	!# Write 0's to the next 3 CW fields as they are not used
	stx	%g0, [%l6+0x10]
	stx	%g0, [%l6+0x18]
	stx	%g0, [%l6+0x20]

	!# Write address of Encryption key (e.g., initial RC4 state) to next CW field
	setx des_key, %g1, %o2
	stx	%o2, [%l6 + 0x28] 

	!# Encryption IV is not used for RC4
	setx des_iv, %g1, %o2
	stx	%o2, [%l6+0x30]

	!# Finally write destination address to last CW field
	setx result_1, %g1, %o3
	stx	%o3, [%l6 + 0x38] 

	!# Make sure all these stores get to memory before we start
	membar #Sync

	!# Now add 1 (actually 8*8B) to tail pointer 
        ldxa	[%g0 + ASI_SPU_CWQ_TAIL] %asi, %l2
	add	%l2, 0x40, %l2
	stxa	%l2, [%g0 + ASI_SPU_CWQ_TAIL] %asi 
        ldxa	[%g0 + ASI_SPU_CWQ_TAIL] %asi, %l1
	cmp	%l1, %l2
	bne,pn %xcc,	fail
	nop
	
	!# Kick off the CWQ operation by writing to the CWQ_CSR
	!# Set the enabled bit and reset the other bits 
	or	%g0, 0x1, %g1
	stxa	%g1,	[%g0 + ASI_SPU_CWQ_CSR] %asi

        !# increment event counter
        inc	%g6

	!# set maximum wait loop count, setup mask for busy bit
	!# This timeout may need adjustment
	setx MA_TIMEOUT, %o3, %l3
	!# mask out the busy bit
	or	%g0, 0x4, %l2


    ! give SPU time to start before reading ASI_SPU_CWQ_CSR
    setx user_data_start, %g1, %g2
    mov 10, %g1
loop_for_awhile:
    ldx [%g2], %g3
    bnz loop_for_awhile
    dec %g1

    
wait1:	!# loop on busy to fall through when done or loop count exceeded
	ldxa	[%g0 + ASI_SPU_CWQ_CSR] %asi,	%l1
	andcc	%l1, %l2, %l1
	be	idle1
	addcc	%l3, -1, %l3
	bgt	wait1
	nop
	ba	fail
	nop

idle1:
	!# check the results...first check the data
       	!# The first RC4 is only 8B long (divide by 8 anyway)	
	or %g0, 0x1, %i0
	!# set %l5 to be base address of result area, and
	!# %l6 to be base address of known ciphertext area
	setx	result_1, %g1, %l5
	setx	ciphertext_1, %g1, %l6
	or	%g0, %g0, %g3
		
more1:
	ldx	[%l5 + %g3], %l1
	ldx	[%l6 + %g3], %l2
	cmp	%l1, %l2
	bne,pn	%xcc, fail
	add	%l3, 0x8, %l3	!# i++
	addcc	%i0, -1, %i0
	bgt	more1
	nop

        
	!# Check the PIC
        rd	%pic,	%g4
	cmp     %g4,	%g6
        bne,pn	%icc, fail
	nop

	!# Temporarily ignore the RC4 final state until we get the stream-out working
	EXIT_GOOD
			
	!# Now check the RC4 final state
	!# check 32+1 doublewords
			
	setx	des_key, %g1, %l5
	setx	aes_expected_1, %g1, %l6
	or	%g0, %g0, %g3
	or	%g0, 0x21, %i0
		
more2:
	ldx	[%l5 + %g3], %l1
	ldx	[%l6 + %g3], %l2
	cmp	%l1, %l2
	bne,pn	%icc, fail
	add	%l3, 0x8, %l3	!# i++
	addcc	%i0, -1, %i0
	bgt	more2
	nop
		
	EXIT_GOOD


fail:
	EXIT_BAD

	
/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:

!# Subtest 1 start
!# input data
cleartext_1:		
.xword 0x4e6f772069732074
.xword 0x68652074696d6520
.xword 0x666f7220616c6c20
	
!# DES key (also where final state will be written)
.align 16
des_key:		
.xword 0x0123456789abcdef
.xword 0x08090a0b0c0d0e0f

des_iv:
.xword 0x1234567890abcdef

!# expected ciphertext
ciphertext_1:	
.xword 0xe5c7cdde872bf27c
.xword 0x43e934008c389c0f
.xword 0x683788499a7c05f6

!# should also check final rc4 state, skip for now

!# temporary area for storing expected result
result_1:	

.xword 0xDEADBEEFDEADBEEF			

!# Final RC4 state matrix:
aes_expected_1:	
.xword 0x0109ae9663c2d647 
.xword 0x4510e8d16626f9e7 
.xword 0xc9357b0e554a2a4f 
.xword 0xe1944822d2214360 
.xword 0x231514eb686d3382 
.xword 0xf1770cf8ad9380cf 
.xword 0xc5568c92e39f40ce 
.xword 0x38b899c85a5c507d 
.xword 0x13744ca673dd590b 
.xword 0x1c5241c79c19afed 
.xword 0xef8127d5e054d3e4 
.xword 0x079dfcfe91208bf7 
.xword 0x6e0308db6162fbb2 
.xword 0xba9b72391e4670be 
.xword 0xca2517cc1f2d31b6 
.xword 0x28b31d7f3ff5448a 
.xword 0x0d84bdfdb4008f58 
.xword 0x025fcdbfac2e6f36 
.xword 0xa8346c8553c4713a 
.xword 0x05954ea57e30b19e 
.xword 0x865ea46b2cd0cbb5 
.xword 0x5d1ae95b8d659a11 
.xword 0x78c07ad40683b0e2 
.xword 0xe575374b49dcdf8e 
.xword 0x1669291876aa67ea 
.xword 0xa924a3d9982f3bd8 
.xword 0x7912ee1bb9f4e6f6 
.xword 0x3ebcbb3ca088de57 
.xword 0x3d87c104dac6970a 
.xword 0x2b514dd7b77cf3ff 
.xword 0xf0f2abfa6490ecc3 
.xword 0x89a232a142a70f6a 

!# Final expected X, Y values
.xword 0x000000000000085e
	
!# CWQ data area, set aside 512 CW's worth
!# 512*8*8 = 32KB
.align 32*1024
CWQ_BASE:		
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.align 32*1024
CWQ_LAST:	
					
.end
