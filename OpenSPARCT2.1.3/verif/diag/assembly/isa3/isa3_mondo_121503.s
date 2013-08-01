/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_mondo_121503.s
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
! Enable main section to run in PRIV mode
#define MAIN_PAGE_NUCLEUS_ALSO

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!Override trap handler definitions
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

! Trap should set %l6=TT which is verified in main program

#define H_T0_Cpu_Mondo_Trap_0x7c
#define My_T0_Cpu_Mondo_Trap_0x7c \
	rdpr    %tt, %l6; \
    ldxa    [ASI_CPU_MONDO_QUEUE_TAIL] %asi, %g1 ;\
	stxa	%g1, [ASI_CPU_MONDO_QUEUE_HEAD] %asi; \
	nop; \
	retry; \
	nop;

#define H_T0_Dev_Mondo_Trap_0x7d
#define My_T0_Dev_Mondo_Trap_0x7d \
	rdpr    %tt, %l6; \
    ldxa    [ASI_DEVICE_QUEUE_TAIL] %asi, %g1 ;\
	stxa	%g1, [ASI_DEVICE_QUEUE_HEAD] %asi; \
	nop; \
	retry; \
	nop;
	
#define H_T0_Resumable_Error_0x7e
#define My_T0_Resumable_Error_0x7e \
	rdpr    %tt, %l6; \
    ldxa    [ASI_RES_ERROR_QUEUE_TAIL] %asi, %g1 ;\
	stxa	%g1, [ASI_RES_ERROR_QUEUE_HEAD] %asi; \
	nop; \
	retry; \
	nop;
	
! Set PSTATE.IE=1
#define CREGS_PSTATE_IE 1  

#include "hboot.s"

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:		/* test begin */

	! local reg usage for this diag
	! %l0 = 0x0 always
	! %l1 = expected trap
	! %l2 = tmp register
	! %l3 = tmp register
	! %l4 = tmp register
	! %l5 = tmp register
	! %l6 = TT value
	! %l7 = tmp register

	ta T_CHANGE_HPRIV    ! Change to HPRIV mode
	
init:	
	! Clear local regs for scratch registers
	nop
	mov    0x0,	%l0
	mov    0x0,	%l1
	mov    0x0,	%l2
	mov    0x0,	%l3
	mov    0x0,	%l4
	mov    0x0,	%l5
	mov    0x0,	%l6
	nop

clr_ie:
	! Disable interrupts
	rdpr	%pstate, %l1 
	wrpr	%l1, 0x2, %pstate  ! Set PSTATE.IE=0

rdwr_asi:
	! Rd/Wr head/tail ASIs
	wr	%g0,	ASI_QUEUE,	%asi
	
	ldxa    [ASI_CPU_MONDO_QUEUE_HEAD]  %asi,  %i0
	ldxa    [ASI_CPU_MONDO_QUEUE_TAIL]  %asi,  %i1
	ldxa    [ASI_DEVICE_QUEUE_HEAD]  %asi,  %i2
	ldxa    [ASI_DEVICE_QUEUE_TAIL]  %asi,  %i3
	ldxa    [ASI_RES_ERROR_QUEUE_HEAD]  %asi,  %i4
	ldxa    [ASI_RES_ERROR_QUEUE_TAIL]  %asi,  %i5
	ldxa    [ASI_NONRES_ERROR_QUEUE_HEAD]  %asi,  %i6
	ldxa    [ASI_NONRES_ERROR_QUEUE_TAIL]  %asi,  %i7

	! Set all bits to 1
	setx	0xffff,	%l7,	%g7
	
	stxa    %g7,  [ASI_CPU_MONDO_QUEUE_HEAD]  %asi
	stxa    %g7,  [ASI_CPU_MONDO_QUEUE_TAIL]  %asi
	stxa    %g7,  [ASI_DEVICE_QUEUE_HEAD]  %asi
	stxa    %g7,  [ASI_DEVICE_QUEUE_TAIL]  %asi
	stxa    %g7,  [ASI_RES_ERROR_QUEUE_HEAD]  %asi
	stxa    %g7,  [ASI_RES_ERROR_QUEUE_TAIL]  %asi
	stxa    %g7,  [ASI_NONRES_ERROR_QUEUE_HEAD]  %asi
	stxa    %g7,  [ASI_NONRES_ERROR_QUEUE_TAIL]  %asi

	ldxa    [ASI_CPU_MONDO_QUEUE_HEAD]  %asi,  %i0
	ldxa    [ASI_CPU_MONDO_QUEUE_TAIL]  %asi,  %i1
	ldxa    [ASI_DEVICE_QUEUE_HEAD]  %asi,  %i2
	ldxa    [ASI_DEVICE_QUEUE_TAIL]  %asi,  %i3
	ldxa    [ASI_RES_ERROR_QUEUE_HEAD]  %asi,  %i4
	ldxa    [ASI_RES_ERROR_QUEUE_TAIL]  %asi,  %i5
	ldxa    [ASI_NONRES_ERROR_QUEUE_HEAD]  %asi,  %i6
	ldxa    [ASI_NONRES_ERROR_QUEUE_TAIL]  %asi,  %i7

	! Clear all bits - before beginning trap testing
	clr	%g7

	stxa    %g7,  [ASI_CPU_MONDO_QUEUE_HEAD]  %asi
	stxa    %g7,  [ASI_CPU_MONDO_QUEUE_TAIL]  %asi
	stxa    %g7,  [ASI_DEVICE_QUEUE_HEAD]  %asi
	stxa    %g7,  [ASI_DEVICE_QUEUE_TAIL]  %asi
	stxa    %g7,  [ASI_RES_ERROR_QUEUE_HEAD]  %asi
	stxa    %g7,  [ASI_RES_ERROR_QUEUE_TAIL]  %asi
	stxa    %g7,  [ASI_NONRES_ERROR_QUEUE_HEAD]  %asi
	stxa    %g7,  [ASI_NONRES_ERROR_QUEUE_TAIL]  %asi

	ldxa    [ASI_CPU_MONDO_QUEUE_HEAD]  %asi,  %i0
	ldxa    [ASI_CPU_MONDO_QUEUE_TAIL]  %asi,  %i1
	ldxa    [ASI_DEVICE_QUEUE_HEAD]  %asi,  %i2
	ldxa    [ASI_DEVICE_QUEUE_TAIL]  %asi,  %i3
	ldxa    [ASI_RES_ERROR_QUEUE_HEAD]  %asi,  %i4
	ldxa    [ASI_RES_ERROR_QUEUE_TAIL]  %asi,  %i5
	ldxa    [ASI_NONRES_ERROR_QUEUE_HEAD]  %asi,  %i6
	ldxa    [ASI_NONRES_ERROR_QUEUE_TAIL]  %asi,  %i7

set_ie:
	! Enable interrupts
	rdpr	%pstate, %l1 
	wrpr	%l1, 0x2, %pstate  ! Set PSTATE.IE=1

!! Test CPU MONDO Trap
	
cpu_mondo:
	ta T_CHANGE_HPRIV    ! Change to HPRIV mode

cpu_mondo_setup:	
	wr	%g0,	ASI_QUEUE,	%asi
	clr	%l6
	! %l1 = expected trap
	mov	0x7c,	%l1

	! Write values to setup trap condition
	ldxa    [ASI_CPU_MONDO_QUEUE_HEAD]  %asi,  %l2
	ldxa    [ASI_CPU_MONDO_QUEUE_TAIL]  %asi,  %l3
	! Trap if HEAD!=TAIL and HPRIV mode
	setx	0xffff,	%l7,	%l4
	stxa	%l4,	[ASI_CPU_MONDO_QUEUE_TAIL]  %asi
	ldxa    [ASI_CPU_MONDO_QUEUE_HEAD]  %asi,  %l4
	ldxa    [ASI_CPU_MONDO_QUEUE_TAIL]  %asi,  %l5

cpu_mondo_gotrap:	
	! Change to Priv and trap should happen immediately
	ta T_CHANGE_NONHPRIV
	ta T_CHANGE_PRIV     ! Change to PRIV mode

cpu_mondo_chk_trap:	
	! Verify that trap was taken, %l6=TT=%l1
	cmp	%l6,	%l1
	bne	failed
	nop

!! Test DEVICE MONDO Trap
	
dev_mondo:
	ta T_CHANGE_HPRIV    ! Change to HPRIV mode

dev_mondo_setup:	
	wr	%g0,	ASI_QUEUE,	%asi
	clr	%l6
	! %l1 = expected trap
	mov	0x7d,	%l1

	! Write values to setup trap condition
	ldxa    [ASI_DEVICE_QUEUE_HEAD]  %asi,  %l2
	ldxa    [ASI_DEVICE_QUEUE_TAIL]  %asi,  %l3
	! Trap if HEAD!=TAIL and HPRIV mode
	setx	0xffff,	%l7,	%l4
	stxa	%l4,	[ASI_DEVICE_QUEUE_TAIL]  %asi
	ldxa    [ASI_DEVICE_QUEUE_HEAD]  %asi,  %l4
	ldxa    [ASI_DEVICE_QUEUE_TAIL]  %asi,  %l5

dev_mondo_gotrap:	
	! Change to Priv and trap should happen immediately
	ta T_CHANGE_NONHPRIV
	ta T_CHANGE_PRIV     ! Change to PRIV mode

dev_mondo_chk_trap:	
	! Verify that trap was taken, %l6=TT=%l1
	cmp	%l6,	%l1
	bne	failed
	nop

!! Test RES ERROR Trap
	
res_err:
	ta T_CHANGE_HPRIV    ! Change to HPRIV mode

res_err_setup:	
	wr	%g0,	ASI_QUEUE,	%asi
	clr	%l6
	! %l1 = expected trap
	mov	0x7e,	%l1

	! Write values to setup trap condition
	ldxa    [ASI_RES_ERROR_QUEUE_HEAD]  %asi,  %l2
	ldxa    [ASI_RES_ERROR_QUEUE_TAIL]  %asi,  %l3
	! Trap if HEAD!=TAIL and HPRIV mode
	setx	0xffff,	%l7,	%l4
	stxa	%l4,	[ASI_RES_ERROR_QUEUE_TAIL]  %asi
	ldxa    [ASI_RES_ERROR_QUEUE_HEAD]  %asi,  %l4
	ldxa    [ASI_RES_ERROR_QUEUE_TAIL]  %asi,  %l5

res_err_gotrap:	
	! Change to Priv and trap should happen immediately
	ta T_CHANGE_NONHPRIV
	ta T_CHANGE_PRIV     ! Change to PRIV mode

res_err_chk_trap:	
	! Verify that trap was taken, %l6=TT=%l1
	cmp	%l6,	%l1
	bne	failed
	nop

passed:
	EXIT_GOOD	/* test finish  */

	
failed:
	EXIT_BAD




/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
.word 0xB52E8698
.end

