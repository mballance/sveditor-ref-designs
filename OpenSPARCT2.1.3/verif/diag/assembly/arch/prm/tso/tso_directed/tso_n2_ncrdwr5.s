/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tso_n2_ncrdwr5.s
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
#define JBI_CONFIG
#define ASI_SWVR_INTR_RECEIVE		0x72
#define ASI_SWVR_UDB_INTR_W		0x73
#define ASI_SWVR_UDB_INTR_R		0x74
#define ENABLE_PCIE_LINK_TRAINING    

#define H_T0_Trap_Instruction_0	
#define My_T0_Trap_Instruction_0	\
	ta	0x90;			\
	done;

!!!#define H_HT0_Data_Access_Exception_0x30 data_access_exception_custom_trap
#define H_HT0_DAE_nc_page_0x16
#define SUN_H_HT0_DAE_nc_page_0x16 \
        inc     %l4;\
        done; nop

#include "hboot.s"

.text
.global main

main:
ta T_CHANGE_HPRIV
nop
	
wr      %g0, 0x4, %fprs         /* make sure fef is 1 */
mov	%g0, %l4
setx 0xdeadbeefdeadbeef, %g1, %g2
setx 0xc100beef00, %g1, %g3          ! MEM32 address space
stx %g2, [%g3]
!=====================
setx 0xdeadbeefdeadbeef, %g1, %g2
setx 0xc900beef00, %g1, %g3          ! MEM64 address space
stx %g2, [%g3]
!=====================


!=====================
! Now some NC writes and reads
!=====================
mov %g0, %g4
set 0x1, %g2
set 0x10, %g5

cas 	 [%g3], %g0, %g2
ldstub 	 [%g3], %g2
swap 	 [%g3], %g2
prefetch [%g3], #n_writes

ba	normal_end
nop

normal_end:
        ta      T_GOOD_TRAP
bad_end:
        ta      T_BAD_TRAP

user_text_end:

/***********************************************************************
   Test case data start
 ***********************************************************************/
.data
user_data_start:
	.skip 1000
user_data_end:

SECTION .MY_HYP_SEC TEXT_VA = 0x1100150000, DATA_VA = 0x1100160000
attr_text {
        Name=.MY_HYP_SEC,
        hypervisor
	}

attr_data {
        Name=.MY_HYP_SEC,
        hypervisor
	}

.global my_hyp_data
.align 0x40
my_hyp_data:
	.skip 0x200

.end

/*******
   Custom trap handlers
 *******/
.global data_access_exception_custom_trap
data_access_exception_custom_trap:
        inc     %l4
        done

