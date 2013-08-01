/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: allbanks_allcores.s
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


#define  TEST_DATA1         0x5555555555555555
#define  L2_ENTRY_PA0       0x2020000008
#define L2_ES_W1C_VALUE     0xc03ffff800000000
#define  SPARC_ES_W1C_VALUE 0xefffffff
#define  TT_SW_Error        0x40

#include "hboot.s"
#include "asi_s.h"
#include "err_defines.h"


    
#define MAIN_PAGE_NUCLEUS_ALSO

	
/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:
	ta	T_CHANGE_HPRIV

get_th_id_o0:
        ta      T_RD_THID

        cmp     %o1, 0x0
        be      main_t0
        nop

        cmp     %o1, 0x1
        be      main_t1
        nop

        cmp     %o1, 0x2
        be      main_t2
        nop


        cmp     %o1, 0x3
        be      main_t3
        nop


        cmp     %o1, 0x4
        be      main_t4
        nop

        cmp     %o1, 0x5
        be      main_t5
        nop

        cmp     %o1, 0x6
        be      main_t6
        nop


        cmp     %o1, 0x7
        be      main_t7
        nop

main_t0:
        ba      L20_Init
        nop


main_t1:
        nop
        nop
        nop
        ba      L21_Init
        nop

main_t2:
        nop
        nop
        nop
        ba      L22_Init
        nop
main_t3:
        nop
        nop
        nop
        ba      L23_Init
        nop
main_t4:
        nop
        nop
        nop
        ba      L24_Init
        nop
main_t5:
        nop
        nop
        nop
        ba      L25_Init
        nop
main_t6:
        nop
        nop
        nop
        ba      L26_Init
        nop
main_t7:
        nop
        nop
        nop
        ba      L27_Init
        nop



L20_Init:

disable_l1_DCache:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  ! Remove bit 2
  andn  %l0, 0x2, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL


clear_l2_ESR:
  setx  L2_ES_W1C_VALUE, %l0, %l1
  setx  L2ES_PA0, %l6, %g1
  stx   %l1, [%g1]


set_L2_Directly_Mapped_Mode:
  setx  L2CS_PA0, %l6, %g1      ! Bit 1 in L2 Control Status Register
  mov   0x2, %l0
  stx   %l0, [%g1]

store_to_L2:
  setx  TEST_DATA1, %l0, %g5

store_to_L2_Bank0:
  setx	0xaf000000, %l0, %g2  ! bits [8:6] select Bank
  setx	0x53000000, %l0, %g3 
  setx	0x49000000, %l0, %g4  
  setx	0xaa000000, %l0, %g6  
  setx	0xa3000000, %l0, %g7  
  setx	0xa3000000, %l0, %g1  
  setx	0xa3000000, %l0, %l7  
  setx	0xa3000000, %l0, %l6  
  stx %g5, [%g2] 
  stx %g5, [%g3] 
  stx %g5, [%g4] 
  stx %g5, [%g6] 
  stx %g5, [%g7] 
  stx %g5, [%g1] 
  stx %g5, [%l7] 
  stx %g5, [%l6] 
  ldx [%g2], %l0
  ldx [%g3], %l1
  ldx [%g4], %l2
  ldx [%g6], %l3
  ldx [%g7], %l4
  ldx [%g1], %l5
  ldx [%l7], %i1
  ldx [%l6], %i2

ba test_pass
nop


L21_Init:
  setx  TEST_DATA1, %l0, %g5

  
  



store_to_L2_Bank1:
  setx  0xaf000040, %l0, %i1  ! bits [8:6] select Bank
  setx  0xaa000040, %l0, %i2  
  setx  0x56000040, %l0, %i3  
  setx  0x44000040, %l0, %i4  
  setx  0x33000040, %l0, %i5  
  setx  0x33000040, %l0, %i6  
  setx  0x33000040, %l0, %i7  
  setx  0x33000040, %l0, %l1  
  stx %g5, [%i2]
  stx %g5, [%i3]
  stx %g5, [%i4]
  stx %g5, [%i5]
  stx %g5, [%i1]
  stx %g5, [%i6]
  stx %g5, [%i7]
  stx %g5, [%l1]

  ldx [%i2], %o1
  ldx [%i3], %o2
  ldx [%i4], %o3
  ldx [%i5], %o4
  ldx [%i1], %g6
  ldx [%i6], %g1
  ldx [%i7], %g2
  ldx [%l1], %g3

ba test_pass
nop

L22_Init:
  setx  TEST_DATA1, %l0, %g5

  
  

store_to_L2_Bank2:
  setx  0xaf000080, %l0, %g2  ! bits [8:6] select Bank
  setx  0x53000080, %l0, %g3
  setx  0x49000080, %l0, %g4
  setx  0xaa000080, %l0, %g6
  setx  0xa3000080, %l0, %g7
  setx  0xa3000080, %l0, %g1
  setx  0xa3000080, %l0, %l7
  setx  0xa3000080, %l0, %l6
  stx %g5, [%g2]
  stx %g5, [%g3]
  stx %g5, [%g4]
  stx %g5, [%g6]
  stx %g5, [%g7]
  stx %g5, [%g1]
  stx %g5, [%l7]
  stx %g5, [%l6]
  ldx [%g2], %l0
  ldx [%g3], %l1
  ldx [%g4], %l2
  ldx [%g6], %l3
  ldx [%g7], %l4
  ldx [%g1], %l5
  ldx [%l7], %i1
  ldx [%l6], %i2


ba test_pass
nop

L23_Init:
  setx  TEST_DATA1, %l0, %g5

  
  

store_to_L2_Bank3:
  setx  0xaf0000c0, %l0, %i1  ! bits [8:6] select Bank
  setx  0xaa0000c0, %l0, %i2
  setx  0x560000c0, %l0, %i3
  setx  0x440000c0, %l0, %i4
  setx  0x330000c0, %l0, %i5
  setx  0x330000c0, %l0, %i6
  setx  0x330000c0, %l0, %i7
  setx  0x330000c0, %l0, %l1
  stx %g5, [%i2]
  stx %g5, [%i3]
  stx %g5, [%i4]
  stx %g5, [%i5]
  stx %g5, [%i1]
  stx %g5, [%i6]
  stx %g5, [%i7]
  stx %g5, [%l1]

  ldx [%i2], %o1
  ldx [%i3], %o2
  ldx [%i4], %o3
  ldx [%i5], %o4
  ldx [%i1], %g6
  ldx [%i6], %g1
  ldx [%i7], %g2
  ldx [%l1], %g3

ba test_pass
nop

L24_Init:
  setx  TEST_DATA1, %l0, %g5

  
  


store_to_L2_Bank4:
  setx  0xaf000100, %l0, %g2  ! bits [8:6] select Bank
  setx  0x53000100, %l0, %g3
  setx  0x49000100, %l0, %g4
  setx  0xaa000100, %l0, %g6
  setx  0xa3000100, %l0, %g7
  setx  0xa3000100, %l0, %g1
  setx  0xa3000100, %l0, %l7
  setx  0xa3000100, %l0, %l6
  stx %g5, [%g2]
  stx %g5, [%g3]
  stx %g5, [%g4]
  stx %g5, [%g6]
  stx %g5, [%g7]
  stx %g5, [%g1]
  stx %g5, [%l7]
  stx %g5, [%l6]
  ldx [%g2], %l0
  ldx [%g3], %l1
  ldx [%g4], %l2
  ldx [%g6], %l3
  ldx [%g7], %l4
  ldx [%g1], %l5
  ldx [%l7], %i1
  ldx [%l6], %i2

ba test_pass
nop

L25_Init:
  setx  TEST_DATA1, %l0, %g5

  
  

store_to_L2_Bank5:
  setx  0xaf000140, %l0, %i1  ! bits [8:6] select Bank
  setx  0xaa000140, %l0, %i2
  setx  0x56000140, %l0, %i3
  setx  0x44000140, %l0, %i4
  setx  0x33000140, %l0, %i5
  setx  0x33000140, %l0, %i6
  setx  0x33000140, %l0, %i7
  setx  0x33000140, %l0, %l1
  stx %g5, [%i2]
  stx %g5, [%i3]
  stx %g5, [%i4]
  stx %g5, [%i5]
  stx %g5, [%i1]
  stx %g5, [%i6]
  stx %g5, [%i7]
  stx %g5, [%l1]

  ldx [%i2], %o1
  ldx [%i3], %o2
  ldx [%i4], %o3
  ldx [%i5], %o4
  ldx [%i1], %g6
  ldx [%i6], %g1
  ldx [%i7], %g2
  ldx [%l1], %g3

ba test_pass
nop

L26_Init:
  setx  TEST_DATA1, %l0, %g5

store_to_L2_Bank6:
  setx  0xaf000180, %l0, %i1  ! bits [8:6] select Bank
  setx  0xaa000180, %l0, %i2
  setx  0x56000180, %l0, %i3
  setx  0x44000180, %l0, %i4
  setx  0x33000180, %l0, %i5
  setx  0x33000180, %l0, %i6
  setx  0x33000180, %l0, %i7
  setx  0x33000180, %l0, %l1
  stx %g5, [%i2]
  stx %g5, [%i3]
  stx %g5, [%i4]
  stx %g5, [%i5]
  stx %g5, [%i1]
  stx %g5, [%i6]
  stx %g5, [%i7]
  stx %g5, [%l1]

  ldx [%i2], %o1
  ldx [%i3], %o2
  ldx [%i4], %o3
  ldx [%i5], %o4
  ldx [%i1], %g6
  ldx [%i6], %g1
  ldx [%i7], %g2
  ldx [%l1], %g3

ba test_pass
nop

L27_Init:
  setx  TEST_DATA1, %l0, %g5

  
  

  
store_to_L2_Bank7:
  setx  0xaf0001c0, %l0, %i1  ! bits [8:6] select Bank
  setx  0xaa0001c0, %l0, %i2
  setx  0x560001c0, %l0, %i3
  setx  0x440001c0, %l0, %i4
  setx  0x330001c0, %l0, %i5
  setx  0x330001c0, %l0, %i6
  setx  0x330001c0, %l0, %i7
  setx  0x330001c0, %l0, %l1
  stx %g5, [%i2]
  stx %g5, [%i3]
  stx %g5, [%i4]
  stx %g5, [%i5]
  stx %g5, [%i1]
  stx %g5, [%i6]
  stx %g5, [%i7]
  stx %g5, [%l1]

  ldx [%i2], %o1
  ldx [%i3], %o2
  ldx [%i4], %o3
  ldx [%i5], %o4
  ldx [%i1], %g6
  ldx [%i6], %g1
  ldx [%i7], %g2
  ldx [%l1], %g3

  

ba test_pass
nop



/*******************************************************
 * Exit code
 *******************************************************/

test_pass:
ta  T_GOOD_TRAP

test_fail:
ta  T_BAD_TRAP
nop


user_text_end:


/************************************************************************
 *  Test case data start
 ************************************************************************/

SECTION       .DATA DATA_VA=0x70000000
attr_data {
      Name = .DATA,
      hypervisor,
      compressimage
}

.data
.global	result_area
.global	alias1
.global	alias2
.global	alias3
.global	alias4
.global	alias5
.global	alias6
.global	alias7
.global	alias8
.global	alias9
.global	alias10
.global	alias11
.global	alias12
.global	alias13
.global	alias14
.global	alias15
.global	alias16

user_data_start:
result_area:
	.skip	512		! 64 bytes per core

	.align	0x40000		! each 246kb, 0x40000, aliases to same L2$ line
alias1:
	.skip	1024
	.align	0x40000
alias2:
	.skip	1024
	.align	0x40000
alias3:
	.skip	1024
	.align	0x40000
alias4:
	.skip	1024
	.align	0x40000
alias5:
	.skip	1024
	.align	0x40000
alias6:
	.skip	1024
	.align	0x40000
alias7:
	.skip	1024
	.align	0x40000
alias8:
	.skip	1024
	.align	0x40000
alias9:
	.skip	1024
	.align	0x40000
alias10:
	.skip	1024
	.align	0x40000
alias11:
	.skip	1024
	.align	0x40000
alias12:	
	.skip	1024
	.align	0x40000
alias13:
	.skip	1024
	.align	0x40000
alias14:
	.skip	1024
	.align	0x40000
alias15:
	.skip	1024
	.align	0x40000
alias16:
	.skip	1024

user_data_end:
.end
