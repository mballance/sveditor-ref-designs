/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_cmp_upk_pk_upk.s
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


#include "hboot.s"
#include "asi_s.h"

#define L20 0x0000134000
#define L21 0x0000134040

#define L22 0x0000134080
#define L23 0x00001340c0

#define L24 0x0000134100
#define L25 0x0000134140

#define L26 0x0000134180
#define L27 0x00001341c0

.text
.global	 main


main:
        ta      T_CHANGE_HPRIV
	nop

get_th_id_o0:
        ta      T_RD_THID

        cmp     %o1, 0x0
        be      main_t0
        nop

        cmp     %o1, 0x1
        be      main_t1
        nop

	/**************************************
		THREAD 0
	**************************************/

main_t0:
	nop
	nop

unpark_thread1_t0:
	wr 	%g0, ASI_CMP_CORE, %asi
	set	0x2, %g4
	stxa 	%g4, [ASI_CMP_CORE_RUNNING_W1S]%asi     ! Start thread1 
	nop

wait_for_th1_to_be_unparked_t0:
        wr      %g0, ASI_CMP_CORE, %asi
        ldxa    [ASI_CMP_CORE_RUNNING_STATUS]%asi, %l0
        set    	0x3, %g1
	sub   	%l0, %g1, %i4
	brnz    %i4, wait_for_th1_to_be_unparked_t0 
	nop	

wait_for_th1_to_be_parked_t0:
	!TH0 to park itself
        wr      %g0, ASI_CMP_CORE, %asi
        ldxa    [ASI_CMP_CORE_RUNNING_STATUS]%asi, %l0
        set    	0x1, %g1
        sub   	%l0, %g1, %i4
        brnz    %i4, wait_for_th1_to_be_parked_t0 
        nop

unpark_thread1_again_t0:
        wr      %g0, ASI_CMP_CORE, %asi
        set     0x2, %g4
        stxa    %g4, [ASI_CMP_CORE_RUNNING_W1S]%asi     ! Start thread1
        nop

wait_for_th1_to_be_unparked_again_t0:
        wr      %g0, ASI_CMP_CORE, %asi
        ldxa    [ASI_CMP_CORE_RUNNING_STATUS]%asi, %l0
        set    	0x3, %g1
        sub     %l0, %g1, %i4
        brnz    %i4, wait_for_th1_to_be_parked_t0
        nop

	ba	test_pass
	nop


        /**************************************
                THREAD 1
        **************************************/
main_t1:
	nop
	nop
	nop

park_itself_t1:
        wr      %g0, ASI_CMP_CORE, %asi
        set     0x2, %g4
        stxa    %g4, [ASI_CMP_CORE_RUNNING_W1C]%asi 	! TH1 parks itself
!	membar	0x40	

thread1_unparked_t1:
	wr      %g0, ASI_CMP_CORE, %asi
	ldxa    [ASI_CMP_CORE_RUNNING_STATUS]%asi, %l0
	set	0x3, %g1
        subcc   %l0, %g1, %i4
        brnz    %i4, test_fail
        nop
		
	ba	test_pass
	nop


/******************************************************
 * Exit code
 *******************************************************/

test_pass:
EXIT_GOOD

test_fail:
EXIT_BAD

