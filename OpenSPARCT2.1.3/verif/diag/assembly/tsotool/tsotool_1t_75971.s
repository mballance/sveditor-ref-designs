/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tsotool_1t_75971.s
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
#define N_CPUS  1
#define REGION_MAPPED_SIZE_RTL 8192
#define REGION_SIZE_RTL (64 * 1024)
#define RESULTS_BUF_SIZE_PER_CPU_RTL 128
#define PRIVATE_DATA_AREA_PER_CPU_RTL 64

#define ALIGN_PAGE_8K .align 8192
#define ALIGN_PAGE_64K .align 65536
#define ALIGN_PAGE_512K .align 524288
#define ALIGN_PAGE_4M .align 4194304
SECTION .MY_HYP_SEC TEXT_VA = 0x1100150000
attr_text {
        Name=.MY_HYP_SEC,
        hypervisor
	}
.text
.global intr0x60_custom_trap
intr0x60_custom_trap:
	ldxa	[%g0] 0x72, %g2;
	ldxa	[%g0] 0x74, %g1;	
	retry;

.global intr0x190_custom_trap
intr0x190_custom_trap:

.global intr0x190_custom_trap
intr0x190_custom_trap:

#ifdef SJM
! programming the JBI - not quite rrugho
!=====================
!setx 0x0000000006040012, %g1, %g2
!setx 0x8503000010, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000100, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000000, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000400, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000108, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000101, %g1, %g2
!setx 0x9800000008, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000408, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000110, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000202, %g1, %g2
!setx 0x9800000010, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000410, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000118, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000303, %g1, %g2
!setx 0x9800000018, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000418, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000120, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000404, %g1, %g2
!setx 0x9800000020, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000420, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000128, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000505, %g1, %g2
!setx 0x9800000028, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000428, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000130, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000606, %g1, %g2
!setx 0x9800000030, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000430, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000138, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000707, %g1, %g2
!setx 0x9800000038, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000438, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000140, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000808, %g1, %g2
!setx 0x9800000040, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000440, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000148, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000909, %g1, %g2
!setx 0x9800000048, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000448, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000150, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000a0a, %g1, %g2
!setx 0x9800000050, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000450, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000158, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000b0b, %g1, %g2
!setx 0x9800000058, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000458, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000160, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000c0c, %g1, %g2
!setx 0x9800000060, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000460, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000168, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000d0d, %g1, %g2
!setx 0x9800000068, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000468, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000170, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000e0e, %g1, %g2
!setx 0x9800000070, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000470, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000178, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000f0f, %g1, %g2
!setx 0x9800000078, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000478, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x000000000000007f, %g1, %g2
!setx 0x8503000008, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000001010, %g1, %g2
!setx 0x9800000080, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000480, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000001111, %g1, %g2
!setx 0x9800000088, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000488, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9300000c00, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9300000e20, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9300000e28, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9300000e38, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000008, %g1, %g2
!setx 0x8503000018, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000828, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x8503000028, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000001, %g1, %g2
!setx 0x8503000020, %g1, %g3
!stx %g2, [%g3]
!!=====================

/***********************************************************************
  Disable L2 Cache Visibility Port
 ***********************************************************************/

setx 0x0000000000000000, %g1, %g2
setx 0x9800001800, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800001820, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800001828, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800001830, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800001838, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800001840, %g1, %g3
stx %g2, [%g3]
!=====================

/***********************************************************************
  Disable IOBridge Visibility Ports
 ***********************************************************************/

setx 0x0000000000000000, %g1, %g2
setx 0x9800001000, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002000, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002008, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002100, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002140, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002160, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002180, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x98000021a0, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002148, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002168, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002188, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x98000021a8, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002150, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002170, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002190, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x98000021b0, %g1, %g3
stx %g2, [%g3]
!=====================

/***********************************************************************
 Configure jbi controller
 ***********************************************************************/

setx 0x03fb303e00000001, %g1, %g2
setx 0x8000000000, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x000000007033fe0f, %g1, %g2
setx 0x8000000008, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000003fc0000000, %g1, %g2
setx 0x80000100a0, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x00000000fe0003ff, %g1, %g2
setx 0x8000004100, %g1, %g3
stx %g2, [%g3]
!=====================

/***********************************************************************
 IOSYNC cycles to start sjm
 ***********************************************************************/

setx 0xdeadbeefdeadbeef, %g1, %g2
setx 0xcf00beef00, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0xdeadbeefdeadbeef, %g1, %g2
setx 0xef00beef00, %g1, %g3
stx %g2, [%g3]

!=============================
done;

#else
#ifdef  DC_ON_OFF
	
	and	%i0, 0x1, %i0
	brz	%i0, on
	nop

        mov     0xd, %i0
	ba	finish_dc_on_off
        stxa    %l0, [%g0] 0x45         /* turn D-cache off */
on:        
        mov     0xf, %i0
        stxa    %i0, [%g0] 0x45         /* turn D-cache back on */

finish_dc_on_off:
	done

#else
	stxa	%i0, [%g0] 0x73;	
	done;
#endif
#endif
!============================================================================

#define ENABLE_T0_Fp_exception_ieee_754_0x21
#define ENABLE_T0_Fp_exception_other_0x22
#define ENABLE_T0_Fp_disabled_0x20
#define ENABLE_T0_Illegal_instruction_0x10
#define ENABLE_T1_Illegal_instruction_0x10
#define ENABLE_HT0_Illegal_instruction_0x10
#define ENABLE_HT1_Illegal_instruction_0x10
#define ENABLE_T0_Clean_Window_0x24

#define H_T0_Trap_Instruction_0
#define My_T0_Trap_Instruction_0	\
	ta      0x90;			\
	done;

#define H_HT0_HTrap_Instruction_0 intr0x190_custom_trap
#ifdef SJM
#define My_HT0_HTrap_Instruction_0 \
	setx intr0x190_custom_trap, %g1, %g2; \
	jmp %g2; nop
#else
#define My_HT0_HTrap_Instruction_0      \
	stxa    %i0, [%g0] 0x73;        \
	done;
#endif

#define H_HT0_Interrupt_0x60 intr0x60_custom_trap
#define My_HT0_Interrupt_0x60   \
        ldxa    [%g0] 0x72, %g2;        \
        ldxa    [%g0] 0x74, %g1;        \
        retry;


#define THREAD_COUNT 8
#define THREAD_STRIDE 1
#include "hboot.s"

!try later:
!	stxa    %l6, [$8] (0x22 | ($2 & 0x9)) ! ASI is randomly set
!===========
define(BST_INIT, `
	add     $6, ($7 & 0xfff0), $8	! 4-byte align the offset
	stxa    %l6, [$8] 0x22		! ASI is randomly set
')

!try later:
!ldda    [$8] (0x22 | ($2 & 0x9)), %l6 ! ASI is randomly set
!===========
define(BLD_INIT, `
        add     $6, ($7 & 0xfff0), $8 	! 4-byte align the offset
        ldda    [$8] 0x22, %l6 		! ASI is randomly set
')

define(CHECK_PROC_ID,`
check_cpu_id: 

	wr	%g0, 0x4, %fprs         /* make sure fef is 1 */
	mov 	THREAD_STRIDE, %l2
	th_fork(thread,%l0)

thread_0:
#ifdef SJM
	ta 	0x30
#endif
	mov 	0, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
	
thread_1:
	mov 	1, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_2:
	mov 	2, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_3:
	mov 	3, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_4:
	mov 	4, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_5:
	mov 	5, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_6:
	mov 	6, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_7:
	mov 	7, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_8:
	mov 	8, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_9:
	mov 	9, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_10:
	mov 	10, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_11:
	mov 	11, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_12:
	mov 	12, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_13:
	mov 	13, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_14:
	mov 	14, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_15:
	mov 	15, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_16:
	mov 	16, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_17:
	mov 	17, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_18:
	mov 	18, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_19:
	mov 	19, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_20:
	mov 	20, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_21:
	mov 	21, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_22:
	mov 	22, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_23:
	mov 	23, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_24:
	mov 	24, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_25:
	mov 	25, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_26:
	mov 	26, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
	
thread_27:
	mov 	27, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_28:
	mov 	28, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_29:
	mov 	29, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_30:
	mov 	30, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_31:
	mov 	31, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop

thread_32:
    mov     32, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_33:
    mov     33, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_34:
    mov     34, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_35:
    mov     35, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_36:
    mov     36, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_37:
    mov     37, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_38:
    mov     38, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_39:
    mov     39, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_40:
    mov     40, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_41:
    mov     41, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_42:
    mov     42, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_43:
    mov     43, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_44:
    mov     44, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_45:
    mov     45, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_46:
    mov     46, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_47:
    mov     47, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_48:
    mov     48, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_49:
    mov     49, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_50:
    mov     50, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_51:
    mov     51, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_52:
    mov     52, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_53:
    mov     53, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_54:
    mov     54, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_55:
    mov     55, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_56:
    mov     56, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_57:
    mov     57, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_58:
    mov     58, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_59:
    mov     59, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_60:
    mov     60, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_61:
    mov     61, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_62:
    mov     62, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_63:
    mov     63, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

entry_point:
#ifdef RTGPRIV
	ta	T_CHANGE_PRIV
#endif
	
')
! --- Common Macro Definitions ---
!
! macros will be instantiated with these arguments
! macro_name(P#, rand#, my_cpu#, PA_val, VA_val, VA_reg, VA_offset, \
!            tmp_reg0, tmp_reg1, tmp_reg2, tmp_reg3)
!
! P# - Pid, just in case one needs unique number
! rand# - random number
! my_cpu# - CPU id
! PA_val - shared memory physisal address value
! VA_val - shared memory virtual address value
! VA_reg - register containing VA region base address
! VA_offset - VA_reg + VA_offset will give correct VA address value
! tmp_reg0-tmp_reg3 - integer registers for arbitrary use within the macro
!                     tmp_reg0 & tmp_reg1 are even-odd register pair
!
! VA_val may be incorrect since VA will be determined at compile time by assembler
! and may not available at diag generation time, but VA_reg+VA_offset is valid
!
! ex. SAMPLE(1, 1249, 0, 0x43400100, 0x100, %i1, 0x100, %l6, %l7, %o5, %l3)
!
! Sample macro 1:
!  load unsigned byte from the given shared addr into tmp_reg1
!  the given shared addr is 4-byte aligned and we will randomly
!  pick one byte from the 4 bytes.
! 
! define(SAMPLE, `
!        ldub   [$6+$7+($2 mod 4)], $8
! ')
!
! Can also use C-like macro definition format.
!
! Sample macro 2:
!   issue an "ldda" instruction to the randomly picked shared location
!   (aligned it to 16-byte boundary first) with a random ASI value among
!   0x22, 0x23, 0x2a, and 0x2b (utilizing the provided "rand" value).
!
! #define BLD_INIT(Pid, rand, my_cpu, PA_val, \
!                 VA_val, VA_reg, VA_offset, \
!                 tmp_reg0, tmp_reg1, tmp_reg2, tmp_reg3) \
!   add  VA_reg, (VA_offset & 0xfff0), tmp_reg3; \
!   ldda [tmp_reg2] (0x22 | (rand & 0x9)), tmp_reg0;
!
! ---

! Macro NOPTRAIN
! Train of NOPs

#define NOPTRAIN(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg1, tmp_reg2, tmp_reg3, tmp_reg4) \
		nop;\
		nop;\
		nop;\
		nop;


! Macro STTRAIN4
! Train of total 4 of UW stores.
! Note: doesn't use shared addresses

#define STTRAIN4(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg1, tmp_reg2, tmp_reg3, tmp_reg4) \
        set 5120, tmp_reg1; \
        add %i0, tmp_reg1, tmp_reg1; \
        set rand, tmp_reg2; \
        stw tmp_reg2, [tmp_reg1]; \
        stw tmp_reg2, [tmp_reg1+4]; \
        stw tmp_reg2, [tmp_reg1+8]; \
        stw tmp_reg2, [tmp_reg1+16];

! Macro STTRAIN8
! Train of total 8 of UW stores 

#define STTRAIN8(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg1, tmp_reg2, tmp_reg3, tmp_reg4) \
        set 5120, tmp_reg1; \
        add %i0, tmp_reg1, tmp_reg1; \
        set rand, tmp_reg2; \
		add tmp_reg2, rand % 4096, tmp_reg3; \
        stw tmp_reg2, [tmp_reg1]; \
        stw tmp_reg2, [tmp_reg1+4]; \
        stw tmp_reg2, [tmp_reg1+8]; \
        stw tmp_reg2, [tmp_reg1+12]; \
        stw tmp_reg3, [tmp_reg1+4]; \
        stw tmp_reg3, [tmp_reg1+12]; \
        stw tmp_reg3, [tmp_reg1]; \
        stw tmp_reg3, [tmp_reg1+8];
 
! Macro LDTRAIN4
! Train of total 4 of UW Loads
! Note the values of those loads inside the macro will not be analized,
! even though the access are [possibly] made to the shared locations

#define LDTRAIN4(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg1, tmp_reg2, tmp_reg3, tmp_reg4) \
        ld [%i0], tmp_reg1; \
        ld [%i1+4], tmp_reg1; \
        ld [%i2+8], tmp_reg1; \
        ld [%i3+12], tmp_reg1;

! Macro LDTRAIN8

#define LDTRAIN8(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg1, tmp_reg2, tmp_reg3, tmp_reg4) \
        ld [%i3], tmp_reg1; \
        ld [%i2+4], tmp_reg1; \
        ld [%i1+8], tmp_reg2; \
        ld [%i0+12], tmp_reg2; \
        ld [%i3+4], tmp_reg3; \
        ld [%i2], tmp_reg3; \
        ld [%i1+12], tmp_reg4; \
        ld [%i0+8], tmp_reg4;

! Macro PREFETCHTRAIN4

#define PREFETCHTRAIN4(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg1, tmp_reg2, tmp_reg3, tmp_reg4) \
        prefetch [%i0+4], 0; \
        prefetch [%i1+12], 0; \
        prefetch [%i2+8], 0; \
        prefetch [%i3], 0;

! Macro PREFETCHTRAIN8

#define PREFETCHTRAIN8(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg1, tmp_reg2, tmp_reg3, tmp_reg4) \
        prefetch [%i3], 0; \
        prefetch [%i2+4], 0; \
        prefetch [%i1+8], 0; \
        prefetch [%i0+12], 0; \
        prefetch [%i3+4], 1; \
        prefetch [%i2], 1; \
        prefetch [%i1+12], 1; \
        prefetch [%i0+8], 1;

! Macro CASTRAIN4
! This is an interesting macro that will probably create the write congessions
! access to the shared locations (offsets from bases have to be adjusted)
! the values of the locations are not changed, so it should not affect analysis

#define CASTRAIN4(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg1, tmp_reg2, tmp_reg3, tmp_reg4) \
        set 128, tmp_reg1;\
        add %i0, tmp_reg1, tmp_reg1;\
        set 256, tmp_reg2;\
        add %i1, tmp_reg2, tmp_reg2;\
		ld [tmp_reg1], tmp_reg3;\
		ld [tmp_reg2], tmp_reg4;\
		cas [tmp_reg1], tmp_reg3, tmp_reg3;\
		cas [tmp_reg1], tmp_reg3, tmp_reg3;\
		cas [tmp_reg2], tmp_reg4, tmp_reg4;\
		cas [tmp_reg2], tmp_reg4, tmp_reg4;

		
define(EN_INTERRUPTS,`
rdpr    %pstate, $1
or      $1, 0x002, $1
wrpr    $1, %pstate
')

define(DIS_INTERRUPTS,`
rdpr    %pstate, $1
and     $1, 0xffd, $1
wrpr    $1, %pstate       ! set PSTATE.IE
')

define(CHECK_DISPATCH_STATUS,`
mov $1, $3
mulx $3, 2, $3
mov 3, $4
sllx $4, $3, $4
ldxa [%g0]ASI_INTR_DISPATCH_STATUS, $3
and $3, $4, $3
cmp %g0, $3
bne $2
')

define(CHECK_RECEIVE_STATUS,`
ldxa [%g0]ASI_INTR_RECEIVE, $1
cmp %g0, $1
tne BAD_TRAP
')

define(WRITE_INTR_DATA_REGS,`
setx $1, $2, $3
add %g0, ASI_INTR_DATA0_W_VAL, $2
stxa $3, [$2]ASI_INTR_DATA0_W
setx $1, $2, $3
add %g0, ASI_INTR_DATA1_W_VAL, $2
stxa $3, [$2]ASI_INTR_DATA1_W
setx $1, $2, $3
add %g0, ASI_INTR_DATA2_W_VAL, $2
stxa $3, [$2]ASI_INTR_DATA2_W
setx $1, $2, $3
add %g0, ASI_INTR_DATA3_W_VAL, $2
stxa $3, [$2]ASI_INTR_DATA3_W
setx $1, $2, $3
add %g0, ASI_INTR_DATA4_W_VAL, $2
stxa $3, [$2]ASI_INTR_DATA4_W
setx $1, $2, $3
add %g0, ASI_INTR_DATA5_W_VAL, $2
stxa $3, [$2]ASI_INTR_DATA5_W
setx $1, $2, $3
add %g0, ASI_INTR_DATA6_W_VAL, $2
stxa $3, [$2]ASI_INTR_DATA6_W
setx $1, $2, $3
add %g0, ASI_INTR_DATA7_W_VAL, $2
stxa $3, [$2]ASI_INTR_DATA7_W
membar #Sync
')

define(INTR_SET_DISPATCH_VECTOR,`
or      %g0,$1,$4
sllx    $4, 29, $4      ! SID
mov     $4, $5
or      %g0,$2,$4
sllx    $4, 24, $4      ! BN pair
or      $5,$4,$5
or      %g0,$3,$4
sllx    $4, 14, $4      ! MID
or      $5,$4,$5
or      $5,0x70,$5      ! VA[13:0] = 0x70
')

define(DSPCH_INTERRUPT,`
stxa    %g0, [$1]ASI_INTR_DISPATCH_W
membar #Sync
')

#define REGION0_ALIAS0_O 0x0
#define REGION1_ALIAS0_O 0x10000
#define REGION2_ALIAS0_O 0x20000
#define REGION3_ALIAS0_O 0x30000
#define REPLACEMENT0_ALIAS0_O 0x40000


!------------------------------------------------------------------------

.seg "data"
ALIGN_PAGE_512K
tsotool_unshared_data_start:
!-- label names of res_buf must match with extract_loads_m64.pl --
.align 64 ! for self bcopy()
res_buf_fp_p_0:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_int_p_0:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
private_data_p0:
	.skip PRIVATE_DATA_AREA_PER_CPU_RTL
stack_top_p0:
	.skip 2048
tsotool_unshared_data_end:
ALIGN_PAGE_512K
! to prevent VAs from running over from this section into shared regions

!------------------------------------------------------------------------

.seg "data"
! 4 shared memory regions, 0 alias(es) each (Alias 0 is normal VA)

ALIGN_PAGE_8K
REGION0_ALIAS0_START:
	.skip REGION_MAPPED_SIZE_RTL
REGION0_ALIAS0_END:
	.skip REGION_SIZE_RTL-REGION_MAPPED_SIZE_RTL

ALIGN_PAGE_8K
REGION1_ALIAS0_START:
	.skip REGION_MAPPED_SIZE_RTL
REGION1_ALIAS0_END:
	.skip REGION_SIZE_RTL-REGION_MAPPED_SIZE_RTL

ALIGN_PAGE_8K
REGION2_ALIAS0_START:
	.skip REGION_MAPPED_SIZE_RTL
REGION2_ALIAS0_END:
	.skip REGION_SIZE_RTL-REGION_MAPPED_SIZE_RTL

ALIGN_PAGE_8K
REGION3_ALIAS0_START:
	.skip REGION_MAPPED_SIZE_RTL
REGION3_ALIAS0_END:
	.skip REGION_SIZE_RTL-REGION_MAPPED_SIZE_RTL

ALIGN_PAGE_8K
REPLACEMENT0_ALIAS0_START:
	.skip REGION_MAPPED_SIZE_RTL
REPLACEMENT0_ALIAS0_END:
	.skip REGION_SIZE_RTL-REGION_MAPPED_SIZE_RTL

ALIGN_PAGE_8K
REPLACEMENT1_ALIAS0_START:
	.skip REGION_MAPPED_SIZE_RTL
REPLACEMENT1_ALIAS0_END:
	.skip REGION_SIZE_RTL-REGION_MAPPED_SIZE_RTL

ALIGN_PAGE_8K
REPLACEMENT2_ALIAS0_START:
	.skip REGION_MAPPED_SIZE_RTL
REPLACEMENT2_ALIAS0_END:
	.skip REGION_SIZE_RTL-REGION_MAPPED_SIZE_RTL

ALIGN_PAGE_8K
REPLACEMENT3_ALIAS0_START:
	.skip REGION_MAPPED_SIZE_RTL
REPLACEMENT3_ALIAS0_END:
	.skip REGION_SIZE_RTL-REGION_MAPPED_SIZE_RTL

.seg "text"
ALIGN_PAGE_8K
local_trap_handlers_start:

.align 64
extern_interrupt_handler:
stxa  %g0, [%g0]ASI_INTR_RECEIVE
retry

local_trap_handlers_end:

.global main
.seg "text"
ALIGN_PAGE_8K
user_text_start:
ba main
nop
user_text_end:

ALIGN_PAGE_64K
tsotool_text_start:
main:
	mov     0, %o0
	mov     0, %o1
	CHECK_PROC_ID
! at this point, g1 should have CPU id (0, 1, 2, ...)
	set     REGION0_ALIAS0_START, %o0	! shared address 0
	set     REGION1_ALIAS0_START, %o1	! shared address 1
	set     REGION2_ALIAS0_START, %o2	! shared address 2
	set     REGION3_ALIAS0_START, %o3	! shared address 3
	cmp     %g1, 0x0
	be      setup_p0
	nop
	EXIT_BAD   ! Should never reach here
	nop

setup_p0:
	setx    stack_top_p0, %g1, %l1
	add     %l1, 1024, %sp
	setx    res_buf_fp_p_0, %g1, %o4
	setx    private_data_p0, %g1, %o5
	setx    func0, %g1, %l4
	call    %l4
	nop
	EXIT_GOOD
	nop
#define	NO_REAL_CPUS_MINUS_1	0

!-----------------

! register usage:
! %i0 %i1 : base registers for first 2 regions
! %i2 %i3 : cache registers for 4 regions
! %i4 fixed pointer to per-cpu results area
! %l1 moving pointer to per-cpu FP results area
! %o7 moving pointer to per-cpu integer results area
! %i5 pointer to per-cpu private area
! %l0 holds lfsr, used as source of random bits 
! %l2 loop count register
! %f16 running counter for unique fp store values
! %f17 holds increment value for fp counter
! %l4 running counter for unique integer store values (increment value is always 1)
! %l5 move-to register for load values (simulation only)
! %f30 move-to register for FP values (simulation only)
! %l3 %l6 %l7 %o5 : 4 temporary registers
! %o0 %o1 %o2 %o3 %o4 : 5 integer results buffer registers
! %f0-f15 FP results buffer registers
! %f32-f47 FP block load/store registers

func0:
! 100 (dynamic) instruction sequence begins
save   %sp, -192, %sp

! Force %i0-%i3 to be 64-byte aligned
add %i0, 63, %i0
andn %i0, 63, %i0

add %i1, 63, %i1
andn %i1, 63, %i1

add %i2, 63, %i2
andn %i2, 63, %i2

add %i3, 63, %i3
andn %i3, 63, %i3

add %i4, 63, %i4
andn %i4, 63, %i4

add %i5, 63, %i5
andn %i5, 63, %i5


! Initialize pointer to FP load results area
mov   %i4, %l1

! Initialize pointer to integer load results area
sethi %hi(0x80000), %o7
or    %o7, %lo(0x80000), %o7
add  %o7, %l1, %o7 

! Initialize %f0-%f62 to 0xdeadbee0deadbee1
sethi %hi(0xdeadbee0), %l6
or    %l6, %lo(0xdeadbee0), %l6
stw   %l6, [%i5]
sethi %hi(0xdeadbee1), %l6
or    %l6, %lo(0xdeadbee1), %l6
stw   %l6, [%i5+4]
ldd [%i5], %f0
fmovd %f0, %f2
fmovd %f0, %f4
fmovd %f0, %f6
fmovd %f0, %f8
fmovd %f0, %f10
fmovd %f0, %f12
fmovd %f0, %f14
fmovd %f0, %f16
fmovd %f0, %f18
fmovd %f0, %f20
fmovd %f0, %f22
fmovd %f0, %f24
fmovd %f0, %f26
fmovd %f0, %f28
fmovd %f0, %f30
fmovd %f0, %f32
fmovd %f0, %f34
fmovd %f0, %f36
fmovd %f0, %f38
fmovd %f0, %f40
fmovd %f0, %f42
fmovd %f0, %f44
fmovd %f0, %f46
fmovd %f0, %f48
fmovd %f0, %f50
fmovd %f0, %f52
fmovd %f0, %f54
fmovd %f0, %f56
fmovd %f0, %f58
fmovd %f0, %f60
fmovd %f0, %f62

! Signature for extract_loads script to start extracting load values for this stream
sethi %hi(0x00deade1), %l6
or    %l6, %lo(0x00deade1), %l6
stw %l6, [%i5] 
ld [%i5], %f16

! Initialize running integer counter in register %l4
sethi %hi(0x1), %l4
or    %l4, %lo(0x1), %l4

! Initialize running FP counter in register %f16
sethi %hi(0x3f800001), %l6
or    %l6, %lo(0x3f800001), %l6
stw %l6, [%i5] 
ld [%i5], %f16

! Initialize FP counter increment value in register %f17 (constant)
sethi %hi(0x34000000), %l6
or    %l6, %lo(0x34000000), %l6
stw %l6, [%i5] 
ld [%i5], %f17 

! Initialize LFSR to 0x75ef^4
sethi %hi(0x75ef), %l0
or    %l0, %lo(0x75ef), %l0
mulx  %l0, %l0, %l0
mulx  %l0, %l0, %l0

!-- init shared addrs 0 to 15 ---
stx   %g0, [%i0+0]
stx   %g0, [%i0+8]
stx   %g0, [%i0+32]
stx   %g0, [%i0+64]
stx   %g0, [%i1+72]
stx   %g0, [%i1+80]
stx   %g0, [%i1+256]
stx   %g0, [%i1+512]
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stx   %g0, [%i3+32]
stx   %g0, [%i3+64]
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stx   %g0, [%i2+0]
stx   %g0, [%i2+64]
stx   %g0, [%i2+128]
stx   %g0, [%i2+192]

! use untouched cache-line (offset 4K) in replacement area for sync
! need to do atomic ops, so need CV=1 (guarunteed in replacement area)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sub %i3, -4096, %l7

sethi %hi(0x10000), %l6 ! for sync time-out
!-- master of sync_init ---
or %g0, NO_REAL_CPUS_MINUS_1, %o5
stw %o5, [%l7]
membar #Sync
sync_init_0:
brnz,pt %l6, 1f
sub %l6, 1, %l6 ! delay slot
EXIT_BAD
1:
brnz,pt %o5, sync_init_0
lduw [%l7], %o5 ! delay slot
!-- end of sync_init ---


BEGIN_NODES0: ! Test istream for CPU 0 begins

P1: !_QWST [6] (maybe <- 0x3f800001) (FP) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_0:
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
stq %f20, [%i1 + 80]
loop_exit_0_0:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_0
nop

P2: !_PREFETCH [2] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_1:
prefetch [%i0 + 12], 1

P3: !_PREFETCH [11] (Int)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetch [%i2 + 64], 1

P4: !_PREFETCH [1] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 4] %asi, 1

P5: !_PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P6: !_QWST [2] (maybe <- 0x3f800003) (FP)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f23 
fmovs  %f16, %f23
fadds  %f16, %f17, %f16
stq %f20, [%i0 + 0]

P7: !_QWST [12] (maybe <- 0x3f800006) (FP)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
stq %f20, [%i3 + 0]

P8: !_PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P9: !_PREFETCH [6] (Int) (Loop exit)
prefetch [%i1 + 80], 1
loop_exit_0_1:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_1
nop

P10: !_QWST [7] (maybe <- 0x3f800007) (FP) (Loop entry)
sethi %hi(0x3), %l2
or %l2, %lo(0x3),  %l2
loop_entry_0_2:
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
stq %f20, [%i1 + 80]

P11: !_PREFETCH [12] (Int)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetch [%i2 + 0], 1

P12: !_QWST [13] (maybe <- 0x3f800009) (FP)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
stq %f20, [%i2 + 64]

P13: !_PREFETCH [2] (Int) (Branch target of P48)
prefetch [%i0 + 12], 1
ba P14
nop

TARGET48:
ba RET48
nop


P14: !_PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P15: !_PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P16: !_QWST [7] (maybe <- 0x3f80000a) (FP)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
stq %f20, [%i1 + 80]

P17: !_PREFETCH [11] (Int) (Loop exit)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetch [%i3 + 64], 1
loop_exit_0_2:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_2
nop

P18: !_QWST [0] (maybe <- 0x3f80000c) (FP) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_3:
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f23 
fmovs  %f16, %f23
fadds  %f16, %f17, %f16
stq %f20, [%i0 + 0]

P19: !_QWST [12] (maybe <- 0x3f80000f) (FP)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
stq %f20, [%i2 + 0]

P20: !_PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P21: !_QWST [15] (maybe <- 0x3f800010) (FP)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
stq %f20, [%i2 + 192]

P22: !_PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P23: !_PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P24: !_PREFETCH [15] (Int)
prefetch [%i2 + 192], 1

P25: !_PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P26: !_QWST [3] (maybe <- 0x3f800011) (FP) (Loop exit) (Branch target of P78)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
stq %f20, [%i0 + 32]
loop_exit_0_3:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_3
nop
ba P27
nop

TARGET78:
ba RET78
nop


P27: !_QWST [5] (maybe <- 0x3f800012) (FP) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_4:
! preparing store val #0, next val will be in f23 
fmovs  %f16, %f23
fadds  %f16, %f17, %f16
stq %f20, [%i1 + 64]

P28: !_QWST [0] (maybe <- 0x3f800013) (FP)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f23 
fmovs  %f16, %f23
fadds  %f16, %f17, %f16
stq %f20, [%i0 + 0]

P29: !_QWST [12] (maybe <- 0x3f800016) (FP)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
stq %f20, [%i3 + 0]

P30: !_LD [14] (Int)
lduw [%i3 + 128], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P31: !_PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P32: !_PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P33: !_PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P34: !_QWST [7] (maybe <- 0x3f800017) (FP)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
stq %f20, [%i1 + 80]

P35: !_REPLACEMENT [1] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x10000), %l7
ld [%i2+4], %l3
st %l3, [%i2+4]
add %i2, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]

P36: !_PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P37: !_QWST [3] (maybe <- 0x3f800019) (FP)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
stq %f20, [%i0 + 32]

P38: !_QWST [10] (maybe <- 0x3f80001a) (FP)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
stq %f20, [%i3 + 32]

P39: !_QWST [1] (maybe <- 0x3f80001b) (FP)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! preparing store val #2, next val will be in f23 
fmovs  %f16, %f23
fadds  %f16, %f17, %f16
stq %f20, [%i0 + 0]

P40: !_QWST [6] (maybe <- 0x3f80001e) (FP)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! preparing store val #1, next val will be in f21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
stq %f20, [%i1 + 80]

P41: !_LD [2] (Int)
lduw [%i0 + 12], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0

P42: !_LD [2] (Int)
lduw [%i0 + 12], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P43: !_LD [9] (Int)
lduw [%i1 + 512], %l7
! move %l7(lower) -> %o1(lower)
or %l7, %o1, %o1

P44: !_LD [9] (Int)
lduw [%i1 + 512], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P45: !_LD [0] (Int)
lduw [%i0 + 0], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2

P46: !_LD [13] (Int)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 64], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P47: !_LD [15] (Int)
lduw [%i2 + 192], %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3

P48: !_LD [3] (Int) (CBR)
lduw [%i0 + 32], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET48
nop
RET48:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P49: !_LD [6] (Int) (Loop exit)
lduw [%i1 + 80], %o5
! move %o5(lower) -> %o4(lower)
or %o5, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
loop_exit_0_4:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_4
nop

P50: !_QWST [3] (maybe <- 0x3f800020) (FP) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_5:
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
stq %f20, [%i0 + 32]

P51: !_LD [4] (Int)
lduw [%i0 + 64], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P52: !_QWST [9] (maybe <- 0x3f800021) (FP)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
stq %f20, [%i1 + 512]

P53: !_QWST [3] (maybe <- 0x3f800022) (FP)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
stq %f20, [%i0 + 32]

P54: !_QWST [12] (maybe <- 0x3f800023) (FP)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
stq %f20, [%i3 + 0]

P55: !_PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P56: !_LD [6] (Int)
lduw [%i1 + 80], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0

P57: !_LD [5] (Int)
lduw [%i1 + 76], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P58: !_LD [10] (Int)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 32], %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1

P59: !_LD [8] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i1 + 256] %asi, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P60: !_LD [15] (Int)
lduw [%i3 + 192], %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2

P61: !_LD [9] (Int)
lduw [%i1 + 512], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P62: !_LD [0] (Int)
lduw [%i0 + 0], %l3
! move %l3(lower) -> %o3(lower)
or %l3, %o3, %o3

P63: !_LD [8] (Int)
lduw [%i1 + 256], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P64: !_LD [0] (Int) (Loop exit)
lduw [%i0 + 0], %l3
! move %l3(lower) -> %o4(lower)
or %l3, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
loop_exit_0_5:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_5
nop

P65: !_PREFETCH [3] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_6:
prefetch [%i0 + 32], 1

P66: !_QWST [3] (maybe <- 0x3f800024) (FP)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
stq %f20, [%i0 + 32]

P67: !_QWST [14] (maybe <- 0x3f800025) (FP) (Loop exit)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
stq %f20, [%i3 + 128]
loop_exit_0_6:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_6
nop

P68: !_MEMBAR (Int)
membar #StoreLoad

P69: !_LD [0] (Int)
lduw [%i0 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P70: !_LD [1] (Int)
lduw [%i0 + 4], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0

P71: !_LD [2] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i0 + 12] %asi, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P72: !_LD [3] (FP)
ld [%i0 + 32], %f0
! 1 addresses covered

P73: !_LD [4] (Int)
lduw [%i0 + 64], %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1

P74: !_LD [5] (Int)
lduw [%i1 + 76], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P75: !_LD [6] (FP)
ld [%i1 + 80], %f1
! 1 addresses covered

P76: !_LD [7] (Int)
lduw [%i1 + 84], %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2

P77: !_LD [8] (FP)
ld [%i1 + 256], %f2
! 1 addresses covered

P78: !_LD [9] (Int) (CBR)
lduw [%i1 + 512], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET78
nop
RET78:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P79: !_LD [10] (Int)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 32], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P80: !_LD [11] (Int)
lduw [%i2 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P81: !_LD [12] (Int)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 0], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P82: !_LD [13] (Int)
lduw [%i3 + 64], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P83: !_LD [14] (Int)
lduw [%i3 + 128], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P84: !_LD [15] (Int)
lduw [%i3 + 192], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

END_NODES0: ! Test istream for CPU 0 ends
sethi %hi(0xdead0e0f), %l3
or    %l3, %lo(0xdead0e0f), %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1
stw %l3, [%i5] 
ld [%i5], %f3
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30

restore
retl
nop
tsotool_text_end:


!#0 N1 P1 QWST 6 0x3f800001 FP BE Pri
!#0 N2 P1 QWST 7 0x3f800002 FP BE Pri
!#A N1 N2
!#0 N7 P6 QWST 0 0x3f800003 FP BE Pri
!#0 N8 P6 QWST 1 0x3f800004 FP BE Pri
!#A N7 N8
!#0 N9 P6 QWST 2 0x3f800005 FP BE Pri
!#0 N10 P7 QWST 12 0x3f800006 FP BE Pri
!#0 N17 P6 QWST 0 0x3f800007 FP BE Pri
!#0 N18 P6 QWST 1 0x3f800008 FP BE Pri
!#A N17 N18
!#0 N19 P6 QWST 2 0x3f800009 FP BE Pri
!#0 N20 P7 QWST 12 0x3f80000a FP BE Pri
!#0 N23 P10 QWST 6 0x3f80000b FP BE Pri
!#0 N24 P10 QWST 7 0x3f80000c FP BE Pri
!#A N23 N24
!#0 N26 P12 QWST 13 0x3f80000d FP BE Pri
!#0 N30 P16 QWST 6 0x3f80000e FP BE Pri
!#0 N31 P16 QWST 7 0x3f80000f FP BE Pri
!#A N30 N31
!#0 N33 P10 QWST 6 0x3f800010 FP BE Pri
!#0 N34 P10 QWST 7 0x3f800011 FP BE Pri
!#A N33 N34
!#0 N36 P12 QWST 13 0x3f800012 FP BE Pri
!#0 N40 P16 QWST 6 0x3f800013 FP BE Pri
!#0 N41 P16 QWST 7 0x3f800014 FP BE Pri
!#A N40 N41
!#0 N43 P10 QWST 6 0x3f800015 FP BE Pri
!#0 N44 P10 QWST 7 0x3f800016 FP BE Pri
!#A N43 N44
!#0 N46 P12 QWST 13 0x3f800017 FP BE Pri
!#0 N50 P16 QWST 6 0x3f800018 FP BE Pri
!#0 N51 P16 QWST 7 0x3f800019 FP BE Pri
!#A N50 N51
!#0 N53 P18 QWST 0 0x3f80001a FP BE Pri
!#0 N54 P18 QWST 1 0x3f80001b FP BE Pri
!#A N53 N54
!#0 N55 P18 QWST 2 0x3f80001c FP BE Pri
!#0 N56 P19 QWST 12 0x3f80001d FP BE Pri
!#0 N58 P21 QWST 15 0x3f80001e FP BE Pri
!#0 N63 P26 QWST 3 0x3f80001f FP BE Pri
!#0 N64 P18 QWST 0 0x3f800020 FP BE Pri
!#0 N65 P18 QWST 1 0x3f800021 FP BE Pri
!#A N64 N65
!#0 N66 P18 QWST 2 0x3f800022 FP BE Pri
!#0 N67 P19 QWST 12 0x3f800023 FP BE Pri
!#0 N69 P21 QWST 15 0x3f800024 FP BE Pri
!#0 N74 P26 QWST 3 0x3f800025 FP BE Pri
!#0 N75 P27 QWST 5 0x3f800026 FP BE Pri
!#0 N76 P28 QWST 0 0x3f800027 FP BE Pri
!#0 N77 P28 QWST 1 0x3f800028 FP BE Pri
!#A N76 N77
!#0 N78 P28 QWST 2 0x3f800029 FP BE Pri
!#0 N79 P29 QWST 12 0x3f80002a FP BE Pri
!#0 N80 P30 LD 14 -1 Int BE Pri
!#0 N84 P34 QWST 6 0x3f80002b FP BE Pri
!#0 N85 P34 QWST 7 0x3f80002c FP BE Pri
!#A N84 N85
!#0 N88 P37 QWST 3 0x3f80002d FP BE Pri
!#0 N89 P38 QWST 10 0x3f80002e FP BE Pri
!#0 N90 P39 QWST 0 0x3f80002f FP BE Pri
!#0 N91 P39 QWST 1 0x3f800030 FP BE Pri
!#A N90 N91
!#0 N92 P39 QWST 2 0x3f800031 FP BE Pri
!#0 N93 P40 QWST 6 0x3f800032 FP BE Pri
!#0 N94 P40 QWST 7 0x3f800033 FP BE Pri
!#A N93 N94
!#0 N95 P41 LD 2 -1 Int BE Pri
!#0 N96 P42 LD 2 -1 Int BE Pri
!#0 N97 P43 LD 9 -1 Int BE Pri
!#0 N98 P44 LD 9 -1 Int BE Pri
!#0 N99 P45 LD 0 -1 Int BE Pri
!#0 N100 P46 LD 13 -1 Int BE Pri
!#0 N101 P47 LD 15 -1 Int BE Pri
!#0 N102 P48 LD 3 -1 Int BE Pri
!#0 N103 P49 LD 6 -1 Int BE Pri
!#0 N104 P50 QWST 3 0x3f800034 FP BE Pri
!#0 N105 P51 LD 4 -1 Int BE Pri
!#0 N106 P52 QWST 9 0x3f800035 FP BE Pri
!#0 N107 P53 QWST 3 0x3f800036 FP BE Pri
!#0 N108 P54 QWST 12 0x3f800037 FP BE Pri
!#0 N110 P56 LD 6 -1 Int BE Pri
!#0 N111 P57 LD 5 -1 Int BE Pri
!#0 N112 P58 LD 10 -1 Int BE Pri
!#0 N113 P59 LD 8 -1 Int LE Pri
!#0 N114 P60 LD 15 -1 Int BE Pri
!#0 N115 P61 LD 9 -1 Int BE Pri
!#0 N116 P62 LD 0 -1 Int BE Pri
!#0 N117 P63 LD 8 -1 Int BE Pri
!#0 N118 P64 LD 0 -1 Int BE Pri
!#0 N120 P66 QWST 3 0x3f800038 FP BE Pri
!#0 N121 P67 QWST 14 0x3f800039 FP BE Pri
!#0 N122 P68 MEMBAR
!#0 N123 P69 LD 0 -1 Int BE Pri
!#0 N124 P70 LD 1 -1 Int BE Pri
!#0 N125 P71 LD 2 -1 Int LE Pri
!#0 N126 P72 LD 3 -1 FP BE Pri
!#0 N127 P73 LD 4 -1 Int BE Pri
!#0 N128 P74 LD 5 -1 Int BE Pri
!#0 N129 P75 LD 6 -1 FP BE Pri
!#0 N130 P76 LD 7 -1 Int BE Pri
!#0 N131 P77 LD 8 -1 FP BE Pri
!#0 N132 P78 LD 9 -1 Int BE Pri
!#0 N133 P79 LD 10 -1 Int BE Pri
!#0 N134 P80 LD 11 -1 Int BE Pri
!#0 N135 P81 LD 12 -1 Int BE Pri
!#0 N136 P82 LD 13 -1 Int BE Pri
!#0 N137 P83 LD 14 -1 Int BE Pri
!#0 N138 P84 LD 15 -1 Int BE Pri
