/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tso_n2_ncrdwr1_user.s
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
#define PART0_NZ_RANOTPA_2 0
#define ENABLE_PCIE_LINK_TRAINING    
#include "hboot.s"

.text
.global main
main:

/************************************
  set up pointers
*************************************/
setx 0x00d01ee000, %g1, %g3          ! should be translated to 0xc100000000 = MEM32
	
/************************************ 
   Start doing non cacheable access 
   RW's are done to the DMUPIO space 
   starting from 0xC1
*************************************/
!=====================
! Now some NC writes and reads
!=====================
mov  %g0, %g4
setx 0x0102030405060708, %g1, %g2
set  0x10, %g5

stloop1:
 stx %g2, [%g3 + %g4]
 inc %g2
 add 0x8, %g4, %g4
 deccc %g5
bne stloop1
nop

mov 0x78, %g4
dec %g2
set 0x10, %g5

ldloop1:
 ldx [%g3 + %g4], %g1
 subcc	%g2, %g1, %g0
 bne	h_bad_end
 nop
 dec %g2
 sub %g4, 0x8, %g4
 deccc %g5
bne ldloop1
nop

!========================
mov 0x80, %g4
setx 0x0807060504030201, %g1, %g2
set 0x10, %g5

stloop2:
 st %g2, [%g3 + %g4]
 inc %g2
 add 0x4, %g4, %g4
 deccc %g5
bne stloop2
nop

mov 0xbc, %g4
set 0x04030210, %g2
set 0x10, %g5

ldloop2:
 ld [%g3 + %g4], %g1
 subcc	%g2, %g1, %g0
 bne	h_bad_end
 nop
 dec %g2
 sub %g4, 0x4, %g4
 deccc %g5
bne ldloop2
nop

!=============================

mov 0x100, %g4
setx 0x0a0b0c0d0e0f0102, %g1, %g2
set 0x10, %g5

stloop3:
 sth %g2, [%g3 + %g4]
 inc %g2
 add 0x2, %g4, %g4
 deccc %g5
bne stloop3
nop

mov 0x11e, %g4
set 0x0111, %g2
set 0x10, %g5

ldloop3:
 lduh [%g3 + %g4], %g1
 subcc	%g2, %g1, %g0
 bne	h_bad_end
 nop
 dec %g2
 sub %g4, 0x2, %g4
 deccc %g5
bne ldloop3
nop

!=============================
mov 0x180, %g4
!set 0x1, %g2
setx 0x0807060504030201, %g1, %g2
set 0x10, %g5

stloop4:
 stb %g2, [%g3 + %g4]
 inc %g2
 add 0x1, %g4, %g4
 deccc %g5
bne stloop4
nop

mov 0x18f, %g4
set 0x10, %g2
set 0x10, %g5

ldloop4:
 ldub [%g3 + %g4], %g1
 subcc	%g2, %g1, %g0
 bne	h_bad_end
 nop
 dec %g2
 sub %g4, 0x1, %g4
 deccc %g5
bne ldloop4
nop

normal_end:
ta T_GOOD_TRAP
nop

h_bad_end:
ta T_BAD_TRAP
nop
   
/*
* Data section
*/

SECTION .NCDATA  DATA_VA=0x00d01ee000 

attr_data {
        Name = .NCDATA,
        VA=0x00d01ee000,
        RA=0xc100000000,
        PA=0xc100000000,
        part_0_ctx_nonzero_tsb_config_2,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_SIZE_PTR=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
        }

.data
.global ncdata_base
ncdata_base:
        .skip 1000


