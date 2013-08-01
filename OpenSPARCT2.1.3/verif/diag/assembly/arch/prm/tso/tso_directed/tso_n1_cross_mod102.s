/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tso_n1_cross_mod102.s
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
#define MAIN_BASE_DATA_ADDR     0x160000
#define MAIN_BASE_TEXT_ADDR     0x150000
#define MAIN_BASE_DATA_ADDR_RA   0x100160000
#define MAIN_BASE_TEXT_ADDR_RA   0x100150000

#define ASI_BLK_P  0xf0

#define USER_PAGE_CUSTOM_MAP
#include "hboot.s"

SECTION .MAIN  TEXT_VA=0x150000, DATA_VA=0x160000

attr_text {
        Name = .MAIN,
        VA=MAIN_BASE_TEXT_ADDR,
        RA=MAIN_BASE_TEXT_ADDR_RA,
        PA=ra2pa(MAIN_BASE_TEXT_ADDR_RA,0),
        part_0_ctx_nonzero_tsb_config_0,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_EP=1, TTE_P=0, TTE_W=1
        }
attr_data {
        Name = .MAIN,
        VA=MAIN_BASE_DATA_ADDR,
        RA=MAIN_BASE_DATA_ADDR_RA,
        PA=ra2pa(MAIN_BASE_DATA_ADDR_RA,0),
        part_0_ctx_nonzero_tsb_config_0,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
        }

.text
.global main
main:	
	clr	%l0
	wr      %g0, 0x4, %fprs         /* make sure fef is 1 */

	th_fork(th_main,%l0)


! this thread modfifies the code
!===============================
th_main_0:

	set	0x40, %i7		! loop counting

	setx 	ready, 	  %l0, %l1	! pointers...
	setx 	noop, 	  %l0, %l2
	ldda    [%l2]ASI_BLK_P, %d0	! in d0 and d16
	setx 	modified, %l0, %l3	!

deliver_loop:
	ldda	[%l3]ASI_BLK_P, %d16	! block load to the line
        prefetch [%l3], #n_reads 	! try a prefetch also.
					! this is the added value of the diag.
        ld      [%l1], %o0    		! read ready.
	tst	%o0			! should be 0.
	bne	deliver_loop
	nop

	stda	%d0, [%l3]ASI_BLK_P	! store good data to label0
	flush	%l3

	deccc	%i7			! count
	bne	goon
	nop
	ba	final_stuff		! go to end if finished
	nop

goon:
	set	1, %i0			! set ready
	st	%i0, [%l1]		! 
	ba	deliver_loop		! repeat
	nop
	
final_stuff:
	set	0x55, %i0		! 55 means we are done.
	st	%i0, [%l1]
	ba	good_end
	nop

! these are the receivers
!------------------------
th_main_1:
th_main_4:

	setx 	ready, %l0, %l1		! pointers to ready label
	setx 	bad_end, %l0, %l2	! put the content of bad_end label
	ldda    [%l2]ASI_BLK_P, %d0	! in d0-d15
	setx 	modified, %l0, %l3	! pointer to modified label.

wait_loop:				! wait for ready flag
        ld      [%l3], %o0    		! bring the line
        ld      [%l1], %o0    
        sub     %o0, 0x55, %i1      	! check for end of test flag.
        tst     %i1     
        be      good_end   		! end the test
        nop
        sub     %o0, 0x1, %i1        	! code for available data
        tst     %i1     
        be	modified
        nop
        ba      wait_loop
        nop

.align 0x40
modified:
	ta	T_BAD_TRAP		! this data is overwritten...
	ta	T_BAD_TRAP
	ta	T_BAD_TRAP
	ta	T_BAD_TRAP

	ta	T_BAD_TRAP
	ta	T_BAD_TRAP
	ta	T_BAD_TRAP
	ta	T_BAD_TRAP

	ta	T_BAD_TRAP
	ta	T_BAD_TRAP
	ta	T_BAD_TRAP
	ta	T_BAD_TRAP

	ta	T_BAD_TRAP
	ta	T_BAD_TRAP
	ta	T_BAD_TRAP
	ta	T_BAD_TRAP		! so the test should go on.

	stda	%d0, [%l3]ASI_BLK_P	! store bad data again
	membar	0x40

	set	0, %o0			! reset the ready flag
	st	%o0, [%l1]

        ba      wait_loop		! do it again
        nop
 
good_end:
        ta      T_GOOD_TRAP

.align 0x40
bad_end:
	ta	T_BAD_TRAP
	ta	T_BAD_TRAP
	ta	T_BAD_TRAP
	ta	T_BAD_TRAP

	ta	T_BAD_TRAP
	ta	T_BAD_TRAP
	ta	T_BAD_TRAP
	ta	T_BAD_TRAP

	ta	T_BAD_TRAP
	ta	T_BAD_TRAP
	ta	T_BAD_TRAP
	ta	T_BAD_TRAP

	ta	T_BAD_TRAP
	ta	T_BAD_TRAP
	ta	T_BAD_TRAP
	ta	T_BAD_TRAP


.align 0x40
noop:
	nop;nop; nop;nop;
	nop;nop; nop;nop;
	nop;nop; nop;nop;
	nop;nop; nop;nop;

!-------------------------------------------------------------------
.data
.global ready
ready:
        .word   0x0
        
.end

