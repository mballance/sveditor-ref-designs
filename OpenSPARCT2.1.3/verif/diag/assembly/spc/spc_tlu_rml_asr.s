/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: spc_tlu_rml_asr.s
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
#define PORTABLE_CORE
		
!#include "bw_default_defines.h"
#include "defines.h"
#include "old_boot.s"

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:		/* test begin */

	ta	T_RD_THID
	mov	%o1, %l7
	umul	%l7, 256, %l7


	!# Initialize registers ..

	!# Global registers
	set	0xB,	%g1
	set	0x5,	%g2
	set	0x7,	%g3
	set	0xE,	%g4
	set	0x7,	%g5
	set	0xB,	%g6
	set	0x3,	%g7
	!# Input registers
	set	-0x4,	%i0
	set	-0xC,	%i1
	set	-0x8,	%i2
	set	-0xF,	%i3
	set	-0x1,	%i4
	set	-0xB,	%i5
	set	-0x4,	%i6
	set	-0x0,	%i7
	!# Local registers
	set	0x08538AD0,	%l0
	set	0x07398F35,	%l1
	set	0x4B289E70,	%l2
	set	0x0004A8EF,	%l3
	set	0x7750ABA7,	%l4
	set	0x0E460AC4,	%l5
	set	0x7AA8D017,	%l6
	!# Output registers
	set	0x170F,	%o0
	set	0x14E1,	%o1
	set	0x1B1D,	%o2
	set	-0x0859,	%o3
	set	0x0DF7,	%o4
	set	-0x112E,	%o5
	set	0x1988,	%o6
	set	-0x0D3D,	%o7

	!# Execute some ALU ops ..

	!# set up operands for testing asi instructions    
    ta  T_RD_THID
    mov %o1, %l0
    srl %l0, 0x4, %l1
	
	!# test PIL
	wrpr %g0, %l0, %pil
	rdpr %pil, %l7
	cmp %l0, %l7
	bne bad
 	wrpr %l0, 0x8, %pil
 	rdpr %pil, %l7
 	xor %l0, 0x8, %l6
 	cmp %l6, %l7
 	bne bad
	
	!# test TICK
 	wrpr %l0, 0x1, %tick
	!# in reality, can't be the same value - e.g., some clocks have passed
	!# but simics thinks they are the same, so can't test yet
! 	rdpr %tick, %l1
!	cmp %l0, %l1
!	beq bad
	or %g0, 0xff, %l2
	wrpr %l2, %g0, %tick
! 	rdpr %tick, %l1
! 	cmp %l2, %l1
! 	beq bad

	!# test TICK using RD
 	wrpr %l0, 0x1, %tick
	!# in reality, can't be the same value - e.g., some clocks have passed
	!# but simics thinks they are the same, so can't test yet
! 	rd %tick, %l1
!	cmp %l0, %l1
!	beq bad
	or %g0, 0xff, %l2
	wrpr %l2, %g0, %tick
! 	rd %tick, %l1
! 	cmp %l2, %l1
! 	beq bad
	
	!# test STICK
 	wr %l0, 0x1, %sys_tick
	!# in reality, can't be the same value - e.g., some clocks have passed
	!# but simics thinks they are the same, so can't test yet
! 	rd %sys_tick, %l1
!	cmp %l0, %l1
!	beq bad
	or %g0, 0xff, %l2
	wr %l2, %g0, %sys_tick
! 	rd %sys_tick, %l1
! 	cmp %l2, %l1
! 	beq bad

	!# test TL
 	wrpr %g0, 0x1,%tl
 	rdpr %tl, %l2
 	cmp %l2, 0x1	
 	bne bad
	or %g0, 0x5, %l2
	wrpr %l2, %g0, %tl
 	rdpr %tl, %l7
 	cmp %l7, 0x5
 	bne bad

	!# test CWP
	mov %l0, %g2 ! save tid in g2
	wrpr %l0, 0x0, %cwp
	rdpr %cwp, %l1
	cmp %g2, %l1
	bne bad
	wrpr %g2, %g0, %cwp
	rdpr %cwp, %l1
	cmp %g2, %l1
	bne bad
	
	!# test CLEANWIN
	wrpr %l0, 0x0, %cleanwin
	rdpr %cleanwin, %l1
	cmp %l0, %l1
	bne bad
	wrpr %l0, %g0, %cleanwin
	rdpr %cleanwin, %l1
	cmp %l0, %l1
	bne bad
	
	!# test CANSAVE
	wrpr %l0, 0x0, %cansave
	rdpr %cansave, %l1
	cmp %l0, %l1
	bne bad
	wrpr %l0, %g0, %cansave
	rdpr %cansave, %l1
	cmp %l0, %l1
	bne bad
	
	!# test CANRESTORE
	wrpr %l0, 0x0, %canrestore
	rdpr %canrestore, %l1
	cmp %l0, %l1
	bne bad
	wrpr %l0, %g0, %canrestore
	rdpr %canrestore, %l1
	cmp %l0, %l1
	bne bad
	
	!# test OTHERWIN
	wrpr %l0, 0x0, %otherwin
	rdpr %otherwin, %l1
	cmp %l0, %l1
	bne bad
	wrpr %l0, %g0, %otherwin
	rdpr %otherwin, %l1
	cmp %l0, %l1
	bne bad
	
	!# test WSTATE
	wrpr %l0, 0x0, %wstate
	rdpr %wstate, %l1
	cmp %l0, %l1
	bne bad
	wrpr %l0, %g0, %wstate
	rdpr %wstate, %l1
	cmp %l0, %l1
	bne bad
	
	!# now reset TL to 1

	wrpr %g0, 0x1, %tl
	rd %pc, %l1
	add %l1, 0x4, %l2

	!# test tpc, tnpc
	wrpr %l1, 0x0, %tpc
	wrpr %l2, 0x0, %tnpc
	rdpr %tpc, %l3
	cmp %l3, %l1
	bne bad
	rdpr %tnpc, %l4
	cmp %l2, %l4
	bne bad

	rd %pc, %l1
	add %l1, 0x4, %l2
	wrpr %l1, %g0, %tpc
	wrpr %l2, %g0, %tnpc
	rdpr %tpc, %l3
	cmp %l3, %l1
	bne bad
	rdpr %tnpc, %l4
	cmp %l2, %l4
	bne bad

	!# test TT
	wrpr %l0, 0x0, %tt
	rdpr %tt, %l3
	cmp %l0, %l3
	bne bad
	wrpr %l0, %g0, %tt
	rdpr %tt, %l3
	cmp %l0, %l3
	bne bad
	
	!# test tstate == {ccr, asi, pstate, cwp}
	setx 0xf0feedf00d, %g3, %l6
	wrpr %l6, 0x0, %tstate
	rdpr %tstate, %l2
	!# use mask, which is AND of defined TSTATE bits accounting for 0 <= CWP <= 7, MM=0, RED=0, PEF=1
	setx 0xffff031f17, %g3, %l1
	and %l6, %l1, %l4
	cmp %l2, %l4
	bne bad
	wrpr %l6, %g0, %tstate
	rdpr %tstate, %l2
	cmp %l2, %l4
	bne bad

	!# check TBA
	rdpr %tba, %l7
	srl %l0, 0xe, %l2
	wrpr %l2, 0xf, %tba
	rdpr %tba, %l1
	cmp %l1, %l2
	bne bad
	wrpr %l2, %g0, %tba
	rdpr %tba, %l1
	cmp %l1, %l2
	bne bad
	wrpr %l7, %g0, %tba

	!# check GL
	xor %l0, 0x3, %l3
	and %l3, 0x3, %l3
	wrpr %l0, 0xf, %gl
	rdpr %gl, %l2
	cmp %l3, %l2
	bne bad
	wrpr %l0, %g0, %gl
	rdpr %gl, %l2
	cmp %l0, %l2
	bne bad

	!# check the wrhpr/rdhpr ops...
	!# start with hpstate
	or %l0, 0x4, %l2 !stay in hpriv state, not critical if tlz is set/reset, keep ibe and red off
	wrhpr %l2, 0x0, %hpstate
	rdhpr %hpstate, %l3
	cmp %l3, %l2
	bne bad 
	wrhpr %l2, %g0, %hpstate
	rdhpr %hpstate, %l3
	cmp %l3, %l2
	bne bad 

	!# HTSTATE
	wrhpr %l2, 0x0, %htstate
	rdhpr %htstate, %l3
	cmp %l3, %l2
	bne bad 
	wrhpr %l2, %g0, %htstate
	rdhpr %htstate, %l3
	cmp %l3, %l2
	bne bad 

	!# HINTP (only bit 0 is defined)
	and %l0, 0x1, %l2
	wrhpr %l2, 0x0, %hintp
	rdhpr %hintp, %l3
	cmp %l3, %l2
	bne bad 
	wrhpr %l2, %g0, %hintp
	rdhpr %hintp, %l3
	cmp %l3, %l2
	bne bad 

	!# HTBA
	rdhpr %htba, %l7
	srl %l0, 0xe, %l2
	wrhpr %l2, 0xf, %htba
	rdhpr %htba, %l1
	cmp %l1, %l2
	bne bad
	wrhpr %l2, %g0, %htba
	rdhpr %htba, %l1
	cmp %l1, %l2
	bne bad
	wrhpr %l7, %g0, %htba

	!# HVER (read-only)
	! expect N1 values for now
	setx 0x003e002401006607, %o2, %l4
!	rdhpr %ver, %l1
!	cmp %l1, %l4
!	bne bad

	!# Make sure INT_DIS bits are set...
	!# TICK_CMPR
	setx 0x1000000000000000, %g0, %l4
	srl %l0, 0xe, %l2
	or %l2, %l4, %l2
	xor %l2, 0xf, %l3
	wr %l2, 0xf, %tick_cmpr
	rd %tick_cmpr, %l1
	cmp %l1, %l3
	bne bad
	wr %l2, %g0, %tick_cmpr
	rd %tick_cmpr, %l1
	cmp %l1, %l2
	bne bad
	
	!# STICK_CMPR
	setx 0x1000000000000000, %g0, %l4
	srl %l0, 0xe, %l2
	or %l2, %l4, %l2
	xor %l2, 0xf, %l3
	wr %l2, 0xf, %sys_tick_cmpr
	rd %sys_tick_cmpr, %l1
	cmp %l1, %l3
	bne bad
	wr %l2, %g0, %sys_tick_cmpr
	rd %sys_tick_cmpr, %l1
	cmp %l1, %l2
	bne bad
		
	!# HSTICK_COMPARE
	setx 0x1000000000000000, %g0, %l4
	srl %l0, 0xe, %l2
	or %l2, %l4, %l2
	xor %l2, 0xf, %l3
	wrhpr %l2, 0xf, %hsys_tick_cmpr
	rdhpr %hsys_tick_cmpr, %l1
	cmp %l1, %l3
	bne bad
	wrhpr %l2, %g0, %hsys_tick_cmpr
	rdhpr %hsys_tick_cmpr, %l1
	cmp %l1, %l2
	bne bad
		
	!# SOFTINT
	setx 0x1ffff, %g3, %l2 ! bits 16..0 are defined
	xor %l2, %l0, %l2
	wr %l2, 0x0, %softint
	rd %softint, %l3
	cmp %l2, %l3
	bne bad	
	wr %l2, %g0, %softint
	rd %softint, %l3
	cmp %l2, %l3
	bne bad	

	!# SET_SOFTINT
	! clear all bits first
	setx 0x1ffff, %g3, %l2
	wr %l3, 0x0, %clear_softint
	rd %softint, %l3
	cmp %l3, %g0
	bne bad
	setx 0x1f0f0, %g3, %l2 ! bits 16..0 are defined
	xor %l2, %l0, %l2
	wr %l2, 0x0, %set_softint
	rd %softint, %l3
	cmp %l2, %l3
	bne bad
	
	!# CLEAR_SOFTINT
	setx 0x1ffff, %g3, %l2	
	wr %l2, %g0, %clear_softint
	rd %softint, %l3
	cmp %l3, %g0
	bne bad
	setx 0x10f0f, %g3, %l2 ! bits 16..0 are defined
	xor %l2, %l0, %l2
	wr %l2, %g0, %set_softint
	rd %softint, %l3
	cmp %l2, %l3
	bne bad
				
	nop
	
	EXIT_GOOD	/* test finish  */


bad:	
	EXIT_BAD
		
/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
.word 0x3C2D3A79
.word 0xA4FF68F0
.word 0x13C701A5
.word 0xC99B6312
.word 0xA4F4C560
.word 0x5BABF289
.word 0xFCE126DE
.word 0x192FB03E
.word 0x6E8EE4BD
.word 0x2B2C2E3E
.word 0xB6DED02A
.word 0xC01083B1
.word 0x44988A1F
.word 0x9DE7EB5A
.word 0xB74AA760
.word 0xE4BEBA23
.word 0x91772362
.word 0x0EFD27D4
.word 0x0A6D28DF
.word 0x1E6E6B20
.word 0x37CF0203
.word 0x08A35333
.word 0x37D2B902
.word 0x40B11BA1
.word 0x753FB53E
.word 0x915CE10C
.word 0xEA67753F
.word 0xAF5B00C5
.word 0xBDB94A52
.word 0x1D0FD9E3
.word 0x9EA12949
.word 0xF6D465AC
.word 0x3D702202
.word 0x3142FEAE
.word 0x1C59D52C
.word 0xCFA86D05
.word 0xE2CCEFBC
.word 0xB384E260
.word 0x9479CC2D
.word 0x9F49FC0A
.word 0xFA0AFE12
.word 0x9BADD844
.word 0x7ABF68B6
.word 0xD79B2787
.word 0x2DABAA5B
.word 0x2A7D2369
.word 0xEBC7D953
.word 0xC91A563E
.word 0x21899566
.word 0x5545E80A
.word 0xD551D8ED
.word 0xECBD2D1B
.word 0x5F55E84B
.word 0x51D80E1A
.word 0x8D1CE3BC
.word 0xD126CC9F
.word 0x3939976F
.word 0xD0E0B2D5
.word 0xD7524BD8
.word 0x86F9D052
.word 0x005953F7
.word 0xB834B88A
.word 0x0B2A90E3
.word 0x0F749E26
.end
