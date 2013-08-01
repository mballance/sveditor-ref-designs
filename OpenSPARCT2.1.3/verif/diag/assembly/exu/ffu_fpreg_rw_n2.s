/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ffu_fpreg_rw_n2.s
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


.text
.global main
main:

	        wr      %g0, 0x4, %fprs         /* make sure fef is 1 */
	
		setx	data1, %l0,  %g1
		setx	result,%l0,  %g2
                add     %g0, 0x04,   %g3

single_loop:
		ld	[%g1],    %f0		
		ld	[%g1],    %f1		
		ld	[%g1],    %f2
		ld	[%g1],    %f3
		ld	[%g1],    %f4
		ld	[%g1],    %f5
		ld	[%g1],    %f6
		ld	[%g1],    %f7
		ld	[%g1],    %f8
		ld	[%g1],    %f9
		ld	[%g1],    %f10		
		ld	[%g1],    %f11		
		ld	[%g1],    %f12
		ld	[%g1],    %f13
		ld	[%g1],    %f14
		ld	[%g1],    %f15
		ld	[%g1],    %f16
		ld	[%g1],    %f17
		ld	[%g1],    %f18
		ld	[%g1],    %f19
		ld	[%g1],    %f20		
		ld	[%g1],    %f21		
		ld	[%g1],    %f22
		ld	[%g1],    %f23
		ld	[%g1],    %f24
		ld	[%g1],    %f25
		ld	[%g1],    %f26
		ld	[%g1],    %f27
		ld	[%g1],    %f28
		ld	[%g1],    %f29
		ld	[%g1],    %f30		
		ld	[%g1],    %f31		
		ld	[%g1],    %f32
		ld	[%g1],    %f33
		ld	[%g1],    %f34
		ld	[%g1],    %f35
		ld	[%g1],    %f36
		ld	[%g1],    %f37
		ld	[%g1],    %f38
		ld	[%g1],    %f39
		ld	[%g1],    %f40		
		ld	[%g1],    %f41		
		ld	[%g1],    %f42
		ld	[%g1],    %f43
		ld	[%g1],    %f44
		ld	[%g1],    %f45
		ld	[%g1],    %f46
		ld	[%g1],    %f47
		ld	[%g1],    %f48
		ld	[%g1],    %f49
		ld	[%g1],    %f50		
		ld	[%g1],    %f51		
		ld	[%g1],    %f52
		ld	[%g1],    %f53
		ld	[%g1],    %f54
		ld	[%g1],    %f55
		ld	[%g1],    %f56
		ld	[%g1],    %f57
		ld	[%g1],    %f58
		ld	[%g1],    %f59
		ld	[%g1],    %f60		
		ld	[%g1],    %f61		
		ld	[%g1],    %f62
		ld	[%g1],    %f63

		st	%f0,      [%g2]		 
		st	%f1,      [%g2]		
		st	%f2,      [%g2]
		st	%f3,      [%g2]
		st	%f4,      [%g2]
		st	%f5,      [%g2]
		st	%f6,      [%g2]
		st	%f7,      [%g2]
		st	%f8,      [%g2]
		st	%f9,      [%g2]
		st	%f10,      [%g2]		
		st	%f11,      [%g2]		
		st	%f12,      [%g2]
		st	%f13,      [%g2]
		st	%f14,      [%g2]
		st	%f15,      [%g2]
		st	%f16,      [%g2]
		st	%f17,      [%g2]
		st	%f18,      [%g2]
		st	%f19,      [%g2]
		st	%f20,      [%g2]		
		st	%f21,      [%g2]		
		st	%f22,      [%g2]
		st	%f23,      [%g2]
		st	%f24,      [%g2]
		st	%f25,      [%g2]
		st	%f26,      [%g2]
		st	%f27,      [%g2]
		st	%f28,      [%g2]
		st	%f29,      [%g2]
		st	%f30,      [%g2]		
		st	%f31,      [%g2]		
		st	%f32,      [%g2]
		st	%f33,      [%g2]
		st	%f34,      [%g2]
		st	%f35,      [%g2]
		st	%f36,      [%g2]
		st	%f37,      [%g2]
		st	%f38,      [%g2]
		st	%f39,      [%g2]
		st	%f40,      [%g2]		
		st	%f41,      [%g2]		
		st	%f42,      [%g2]
		st	%f43,      [%g2]
		st	%f44,      [%g2]
		st	%f45,      [%g2]
		st	%f46,      [%g2]
		st	%f47,      [%g2]
		st	%f48,      [%g2]
		st	%f49,      [%g2]
		st	%f50,      [%g2]		
		st	%f51,      [%g2]		
		st	%f52,      [%g2]
		st	%f53,      [%g2]
		st	%f54,      [%g2]
		st	%f55,      [%g2]
		st	%f56,      [%g2]
		st	%f57,      [%g2]
		st	%f58,      [%g2]
		st	%f59,      [%g2]
		st	%f60,      [%g2]		
		st	%f61,      [%g2]		
		st	%f62,      [%g2]
		st	%f63,      [%g2]

                add     %g1,  0x08, %g1
                add     %g2,  0x08, %g2

                sub    %g3 , 0x01, %g3
                brnz,pt %g3,single_loop
                nop

                setx     data1,   %l0, %g1
                setx     result, %l0, %g2

double_loop:
		ldd	[%g1],    %f0		
		ldd	[%g1],    %f2
		ldd	[%g1],    %f4
		ldd	[%g1],    %f6
		ldd	[%g1],    %f8
		ldd	[%g1],    %f10		
		ldd	[%g1],    %f12
		ldd	[%g1],    %f14
		ldd	[%g1],    %f16
		ldd	[%g1],    %f18
		ldd	[%g1],    %f20		
		ldd	[%g1],    %f22
		ldd	[%g1],    %f24
		ldd	[%g1],    %f26
		ldd	[%g1],    %f28
		ldd	[%g1],    %f30		
		ldd	[%g1],    %f32
		ldd	[%g1],    %f34
		ldd	[%g1],    %f36
		ldd	[%g1],    %f38
		ldd	[%g1],    %f40		
		ldd	[%g1],    %f42
		ldd	[%g1],    %f44
		ldd	[%g1],    %f46
		ldd	[%g1],    %f48
		ldd	[%g1],    %f50		
		ldd	[%g1],    %f52
		ldd	[%g1],    %f54
		ldd	[%g1],    %f56
		ldd	[%g1],    %f58
		ldd	[%g1],    %f60		
		ldd	[%g1],    %f62

		std	%f0,      [%g2]		 
		st	%f1,      [%g2]		
		std	%f2,      [%g2]
		st	%f3,      [%g2]
		std	%f4,      [%g2]
		st	%f5,      [%g2]
		std	%f6,      [%g2]
		st	%f7,      [%g2]
		std	%f8,      [%g2]
		st	%f9,      [%g2]
		std	%f10,      [%g2]		
		st	%f11,      [%g2]		
		std	%f12,      [%g2]
		st	%f13,      [%g2]
		std	%f14,      [%g2]
		st	%f15,      [%g2]
		std	%f16,      [%g2]
		st	%f17,      [%g2]
		std	%f18,      [%g2]
		st	%f19,      [%g2]
		std	%f20,      [%g2]		
		st	%f21,      [%g2]		
		std	%f22,      [%g2]
		st	%f23,      [%g2]
		std	%f24,      [%g2]
		st	%f25,      [%g2]
		std	%f26,      [%g2]
		st	%f27,      [%g2]
		std	%f28,      [%g2]
		st	%f29,      [%g2]
		std	%f30,      [%g2]		
		st	%f31,      [%g2]		
		std	%f32,      [%g2]
		st	%f33,      [%g2]
		std	%f34,      [%g2]
		st	%f35,      [%g2]
		std	%f36,      [%g2]
		st	%f37,      [%g2]
		std	%f38,      [%g2]
		st	%f39,      [%g2]
		std	%f40,      [%g2]		
		st	%f41,      [%g2]		
		std	%f42,      [%g2]
		st	%f43,      [%g2]
		std	%f44,      [%g2]
		st	%f45,      [%g2]
		std	%f46,      [%g2]
		st	%f47,      [%g2]
		std	%f48,      [%g2]
		st	%f49,      [%g2]
		std	%f50,      [%g2]		
		st	%f51,      [%g2]		
		std	%f52,      [%g2]
		st	%f53,      [%g2]
		std	%f54,      [%g2]
		st	%f55,      [%g2]
		std	%f56,      [%g2]
		st	%f57,      [%g2]
		std	%f58,      [%g2]
		st	%f59,      [%g2]
		std	%f60,      [%g2]		
		st	%f61,      [%g2]		
		std	%f62,      [%g2]
		st	%f63,      [%g2]

                add     %g1,  0x08, %g1
                add     %g2,  0x08, %g2

                sub     %g3 , 0x1, %g3
                brnz,pt %g3,  double_loop


good_end:	ta 	GOOD_TRAP
		
.seg "data"
.align 0x1fff+1
data1:
		.word 0x0, 0x0
		.word 0x55555555, 0x55555555
		.word 0xaaaaaaaa, 0xaaaaaaaa
		.word 0xffffffff, 0xffffffff 
.align 8
result :          

