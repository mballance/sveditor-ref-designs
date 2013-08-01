/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ffu_fplogic_n2.s
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
#define ENABLE_T0_Fp_disabled_0x20

#define  MAIN_PAGE_HV_ALSO  
#define  MAIN_PAGE_NUCLEUS_ALSO

#define ENABLE_T0_Clean_Window_0x24
#define ENABLE_T0_Corrected_ECC_error_0x63 
#define ENABLE_T0_Data_Access_Exception_0x30 
#define ENABLE_T0_Data_access_error_0x32 
#define ENABLE_T0_Division_By_Zero_0x28 
#define ENABLE_T0_Fp_disabled_0x20
#define ENABLE_T0_Fp_exception_ieee_754_0x21 
#define ENABLE_T0_Fp_exception_other_0x22 
#define ENABLE_T0_Illegal_instruction_0x10
#define ENABLE_T0_Instruction_Access_MMU_Miss_0x09
#define ENABLE_T0_Instruction_access_error_0x0a 
#define ENABLE_T0_Instruction_access_exception_0x08
#define ENABLE_T0_Lddf_Mem_Address_Not_Aligned_0x35
#define ENABLE_T0_Mem_Address_Not_Aligned_0x34 
#define ENABLE_T0_Privileged_Action_0x37 
#define ENABLE_T0_Privileged_opcode_0x11
#define ENABLE_T0_Stdf_Mem_Address_Not_Aligned_0x36
#define ENABLE_T0_Tag_Overflow_0x23 
#define ENABLE_T0_Unimplemented_LDD_0x12
#define ENABLE_T0_Unimplemented_STD_0x13
#define ENABLE_T0_data_access_protection_0x6c 
#define ENABLE_T0_fast_data_access_MMU_miss_0x68
#define ENABLE_T0_fast_instr_access_MMU_miss_0x64
		
#include "hboot.s"

.global sam_fast_immu_miss
.global sam_fast_dmmu_miss


/****************START OF TEST*********************************************/


.text
.global main
ALIGN_PAGE_8K

user_text_start:

main:
	
         wr      %g0, 0x4, %fprs         /* make sure fef is 1 */

	 set	 sp_data_start, %g1
	 set	 dp_data_start, %g2
	 ldd	 [%g1 + 0x0], %f0
	 ldd	 [%g1 + 0x8], %f2
	 ldd	 [%g2 + 0x0], %f4
	 ldd	 [%g2 + 0x8], %f6
	 ldd	 [%g2 + 0x10], %f8
	 ldd	 [%g2 + 0x18], %f10
	 wr	 %g0, 0x0, %asr19	!WRASR to GSR
	 mov	 %g0, %o3
	 ba	 tst_plogic_1
	 nop

.align 32
tst_plogic_1:
!	 fzero	 %d32
!	 fone	 %d34
	 fone	 %d34
	 fzero	 %d32
	 fnor	 %f0,  %f2,  %f36
	 for	 %f0,  %f2,  %f38
	 for	 %f2,  %f0,  %f38
	 fnor	 %f2,  %f0,  %f36

tst_plogic_2:
	 fandnot1	 %f6,  %f8,  %f40
	 fandnot2	 %f10,  %f8,  %f42
	 fandnot2	 %f8,  %f8,  %f42
	 fandnot1	 %f4,  %f8,  %f40
	 fnot2	 %f6,  %f44
	 fnot1	 %f4,  %f46
	 fnot1	 %f8,  %f46
	 fnot2	 %f6,  %f44

tst_plogic_3:
	 fand	 %f2,  %f0,  %f48
	 fnand	 %f0,  %f2,  %f50
	 fnand	 %f8,  %f6,  %f50
	 fand	 %f6,  %f8,  %f48
	 fxnor	 %f2,  %f6,  %f52
	 fxor	 %f6,  %f2,  %f54
	 fxor	 %f4,  %f6,  %f54
	 fxnor	 %f6,  %f4,  %f52

tst_plogic_4:
	 fornot2	 %f4,  %f8,  %f56
	 fornot1	 %f4,  %f8,  %f54
	 fornot1	 %f8,  %f4,  %f54
	 fornot2	 %f8,  %f4,  %f56
	 fsrc1	 %f2,  %f58
	 fsrc2	 %f6,  %f60
	 fsrc2	 %f6,  %f60
	 fsrc1	 %f2,  %f58

tst_plogics_1:
	 fzeros	 %f12
	 fones	 %f13
!	 fones	 %f13
!	 fzeros	 %f12
	 fones	 %f12
	 fzeros	 %f13
	 fnors	 %f5,  %f6,  %f14
	 fors	 %f7,  %f8,  %f15
	 fors	 %f8,  %f7,  %f15
	 fnors	 %f6,  %f5,  %f14
	


tst_plogics_2:
	 fandnot1s	 %f8,  %f9,  %f16
	 fandnot2s	 %f9,  %f8,  %f17
	 fandnot2s	 %f10,  %f11,  %f17
	 fandnot1s	 %f11,  %f10,  %f16
	 fnot2s	 %f4,  %f18
	 fnot1s	 %f4,  %f19
	 fnot1s	 %f6,  %f19
	 fnot2s	 %f6,  %f18

tst_plogics_3:
	 fands	 %f2,  %f0,  %f22
	 fnands	 %f0,  %f2,  %f23
	 fnands	 %f8,  %f6,  %f23
	 fands	 %f6,  %f8,  %f22
	 fxnors	 %f2,  %f6,  %f24
	 fxors	 %f6,  %f2,  %f25
	 fxors	 %f4,  %f6,  %f25
	 fxnors	 %f6,  %f4,  %f24

tst_plogics_4:
	 fornot2s	 %f4,  %f9,  %f28
	 fornot1s	 %f4,  %f9,  %f29
	 fornot1s	 %f9,  %f4,  %f29
	 fornot2s	 %f9,  %f4,  %f28
	 fsrc1s	 %f2,  %f26
	 fsrc2s	 %f5,  %f27
	 fsrc2s	 %f5,  %f27
	 fsrc1s	 %f2,  %f26



	ta	GOOD_TRAP

user_text_end:

.seg "data"
ALIGN_PAGE_8K

user_data_start:




sp_data_start:
	 .word 0x3f840041
	 .word 0x40284144
	 .word 0xf67890ab
	 .word 0x264fd879

sp_data_end:

dp_data_start:
.align 8
	 .word 0x56565656
	 .word 0x78787878
	 .word 0x4b4b4b4b
	 .word 0xc3c3c3c3
	 .word 0xdeadbeef
	 .word 0xdeadbeef
	 .word 0x21524110
	 .word 0x21345879

dp_data_end:


fsr_data_start:
.align 8

	 .word 0x0
	 .word 0x80000000


user_result_start:

user_data_end:
