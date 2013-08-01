/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tso_n2_ncrdwr5_user.s
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

#define H_T0_Data_Access_Exception_0x30	
#define SUN_H_T0_Data_Access_Exception_0x30	\
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
 
th_fork(th_main, %l0)

th_main_0:
        wr      %g0, 0x4, %fprs         /* make sure fef is 1 */

!        ta      0x30

        setx    user_data_start, %l0, %l1       ! user data start
        setx    ncdata_base, %l0, %g3           ! nc data base
        setx    0x1000, %l0, %l3                ! nc datawork area
        add     %g3, %l3, %g3

!=====================
! Now some forbidden NC operations
!=====================
        mov %g0, %l4
        set 0x1, %g2

        cas      [%g3], %g0, %g2

        ldstub   [%g3], %g2

        swap     [%g3], %g2

        prefetch [%g3], #n_writes

        sub     %l4, 3, %l4
        brnz    %l4, bad_end
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

SECTION .NCDATA  DATA_VA=0xd01ee000

attr_data {
        Name = .NCDATA,
        VA=0xd01ee000,
        RA=0xcf00bee000,
        PA=0xcf00bee000,
        part_0_ctx_nonzero_tsb_config_0,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_SIZE_PTR=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
        }

.data
.global ncdata_base
ncdata_base:
        .skip 1000


