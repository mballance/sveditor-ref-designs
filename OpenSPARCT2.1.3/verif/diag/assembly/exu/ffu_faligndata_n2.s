/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ffu_faligndata_n2.s
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


#define	check_result(label) \
	ldx	[%l2+%i2], %i1; \
	cmp	%i0, %i1; \
	be      label; \
	add	%i2, 0x8, %i2; \
	ta	BAD_TRAP

.global sam_fast_immu_miss
.global sam_fast_dmmu_miss


/****************START OF TEST*********************************************/


.text
.global main
ALIGN_PAGE_8K

user_text_start:

main:
	
	        wr      %g0, 0x4, %fprs         /* make sure fef is 1 */

		set	data, %g1
		set 	store_result, %l1
		set 	exp_result_start, %l2

		mov	0x0, %l3
		mov	0x0, %i2

		ldd	[%g1], %f0
		ldd	[%g1+8], %f2
		ldd	[%g1+16], %f4
		ldd	[%g1+24], %f6


!write to gsr followed by faligndata
tst_0:
		wr	%l3, %g0, %asr19	!align_offset=0
		faligndata	%f0, %f2, %f32	!since align_offset=0, so, %f32=%f0
		fcmpd	%fcc3, %f0, %f32	
		fbe	%fcc3, tst_1
		add	%l3, 0x1, %l3	!increment l3
		ta	BAD_TRAP


!align offset = 1
tst_1:
		wr	%l3, %g0, %asr19	!align_offset =1
		faligndata	%f0, %f2, %f32
		std 	%f32, [%l1]	!store freg (dw) into store_result
		ldx	[%l1], %i0
		add	%l3, 0x1, %l3	!increment l3
		check_result(tst_2)

!align offset = 2
tst_2:
		wr	%l3, %g0, %asr19	!align_offset =2
		faligndata	%f0, %f2, %f32
		std 	%f32, [%l1]
		ldx	[%l1], %i0
		add	%l3, 0x1, %l3	!increment l2
		check_result(tst_3)

!align offset = 3
tst_3:
		wr	%l3, %g0, %asr19	!align_offset =3
		faligndata	%f0, %f2, %f32
		std 	%f32, [%l1]
		ldx	[%l1], %i0
		add	%l3, 0x1, %l3	!increment l2
		check_result(tst_4)

!align offset = 4
tst_4:
		wr	%l3, %g0, %asr19	!align_offset =4
		faligndata	%f0, %f2, %f32
		std 	%f32, [%l1]
		ldx	[%l1], %i0
		add	%l3, 0x1, %l3	!increment l2
		check_result(tst_5)

!align offset = 5
tst_5:
		wr	%l3, %g0, %asr19	!align_offset =5
		faligndata	%f0, %f2, %f32
		std 	%f32, [%l1]
		ldx	[%l1], %i0
		add	%l3, 0x1, %l3	!increment l2
		check_result(tst_6)

!align offset = 6
tst_6:
		wr	%l3, %g0, %asr19	!align_offset =6
		faligndata	%f0, %f2, %f32
		std 	%f32, [%l1]
		ldx	[%l1], %i0
		add	%l3, 0x1, %l3	!increment l2
		check_result(tst_7)

!align offset = 7
tst_7:
		wr	%l3, %g0, %asr19	!align_offset =7
		faligndata	%f0, %f2, %f32
		std 	%f32, [%l1]
		ldx	[%l1], %i0
		add	%l3, 0x1, %l3	!increment l2
		check_result(tst_8)

!align offset = 0
tst_8:
		wr	%l3, %g0, %asr19	!align_offset =0
		faligndata	%f2, %f0, %f32
		fcmpd	%fcc2, %f2, %f32	
		fbe	%fcc2, end_of_test
		nop	
		ta	BAD_TRAP





end_of_test:	ta	GOOD_TRAP
bad:		ta	BAD_TRAP
user_text_end:


.seg "data"


ALIGN_PAGE_8K

user_data_start:
.align 8
data:
	.word 0x01234567, 0x89abcdef
	.word 0xfedcba98, 0x76543210
	.word 0x11223344, 0x66778899
	.word 0xeeccbbaa, 0x00dd55ff

.align 8
store_result:
		.skip 512

.align 8
short_load: 
		.byte 0x56, 0x0, 0x0,0x0
		.byte 0x0,0x0, 0x0, 0x0
		.byte 0xa9, 0x0, 0x0, 0x0
		.byte 0x0,0x0, 0x0, 0x0
		.half 0xfecd,0x0
		.half 0x0,0x0
		.half 0x5678,0x0
		.half 0x0,0x0

.align 8
exp_result_start:
		.word 0x23456789, 0xabcdeffe
		.word 0x456789ab, 0xcdeffedc
		.word 0x6789abcd, 0xeffedcba
		.word 0x89abcdef, 0xfedcba98
		.word 0xabcdeffe, 0xdcba9876
		.word 0xcdeffedc, 0xba987654
		.word 0xeffedcba, 0x98765432
		.word 0x66778899, 0xeeccbbaa
		.word 0x99eeccbb, 0xaa00dd55
		.word 0x01112233, 0x44667788
		.word 0x76543210, 0x11223344
		.word 0x00dd55ff, 0xfedcba98
		.word 0xaa00dd55, 0xfffedcba
		.word 0x98765432, 0x10eeccbb
		.word 0xfedcba98, 0x76543210
		.word 0x56000000, 0x0
		.word 0x56780000, 0x0
		.word 0xeda8eda8, 0x00007731
		.word 0x33884499, 0x0
		.word 0x44993388, 0x44993388
		.word 0x0, 0x00440000


user_data_end:
