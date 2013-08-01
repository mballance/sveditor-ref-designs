/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: kernel_handler.s
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
.global kernel_syscall
kernel_syscall:
	! save globals
	stx	%g1, [%g7+8]
	stx	%g2, [%g7+16]
	stx	%g3, [%g7+24]
	stx	%g4, [%g7+32]
	stx	%g5, [%g7+40]
	stx	%g6, [%g7+48]

	setx	syscall_jmptab, %g1, %g2
	sllx	%o1, 3, %g1
	add	%g2, %g1, %g2	! %g2 = ptr into jump table based on call #
	ldx	[%g2], %g1
	jmp	%g1

kernel_sysret:
	! restore globals
	ldx	[%g7+8], %g1
	ldx	[%g7+16], %g2
	ldx	[%g7+24], %g3
	ldx	[%g7+32], %g4
	ldx	[%g7+40], %g5
	ldx	[%g7+48], %g6

	ta	T_SYSRET
	nop

! %o2 = size in bytes
! %o3 = alignment in bytes (has to be power of 2)
! %o4 = returned pointer
kernel_memalign:
	setx	heapptr, %g1, %g2
	ldx	[%g2], %g1	! %g1 = heapptr
	mov	%o3, %g3
	sub	%g3, 1, %g3	! alignment mask
	and	%g3, %g1, %g4
	brz	%g4, align_done
	not	%g3
	and	%g3, %g1, %g1
	add	%g1, %o3, %g1
align_done:
	mov	%g1, %o4
	add	%g1, %o2, %g1
	ba	kernel_sysret
	stx	%g1, [%g2]
	
kernel_printhex:
	ba	kernel_sysret	! $ EV trig_pc_d(1,expr(@VA(.KERNEL.kernel_printhex), 16, 16)) -> printhex("diagprinthex", %o2)
	nop
	
kernel_printdec:
	ba	kernel_sysret	! $ EV trig_pc_d(1,expr(@VA(.KERNEL.kernel_printdec), 16, 16)) -> printdec("diagprintdec", %o2)
	nop

.data
syscall_jmptab:
	.xword	0x0000000000000000
	.xword	kernel_memalign
	.xword	kernel_printhex
	.xword	kernel_printdec

heapptr:
	.xword	0x0000000000000000

.global start_label_list
start_label_list:
#if defined(USER_PAGE_CUSTOM_MAP) || !defined(USER_TEXT_MT_MAP)
	.xword	USER_START_LABEL, USER_START_LABEL, USER_START_LABEL, USER_START_LABEL
	.xword	USER_START_LABEL, USER_START_LABEL, USER_START_LABEL, USER_START_LABEL
	.xword	USER_START_LABEL, USER_START_LABEL, USER_START_LABEL, USER_START_LABEL
	.xword	USER_START_LABEL, USER_START_LABEL, USER_START_LABEL, USER_START_LABEL
	.xword	USER_START_LABEL, USER_START_LABEL, USER_START_LABEL, USER_START_LABEL
	.xword	USER_START_LABEL, USER_START_LABEL, USER_START_LABEL, USER_START_LABEL
	.xword	USER_START_LABEL, USER_START_LABEL, USER_START_LABEL, USER_START_LABEL
	.xword	USER_START_LABEL, USER_START_LABEL, USER_START_LABEL, USER_START_LABEL
	.xword	USER_START_LABEL, USER_START_LABEL, USER_START_LABEL, USER_START_LABEL
	.xword	USER_START_LABEL, USER_START_LABEL, USER_START_LABEL, USER_START_LABEL
	.xword	USER_START_LABEL, USER_START_LABEL, USER_START_LABEL, USER_START_LABEL
	.xword	USER_START_LABEL, USER_START_LABEL, USER_START_LABEL, USER_START_LABEL
	.xword	USER_START_LABEL, USER_START_LABEL, USER_START_LABEL, USER_START_LABEL
	.xword	USER_START_LABEL, USER_START_LABEL, USER_START_LABEL, USER_START_LABEL
	.xword	USER_START_LABEL, USER_START_LABEL, USER_START_LABEL, USER_START_LABEL
	.xword	USER_START_LABEL, USER_START_LABEL, USER_START_LABEL, USER_START_LABEL
#else
changequote([, ])dnl
	foreachbit([i], 64, M4_user_data_mask, [
	.xword	[main]i
])dnl
changequote(`,')dnl'
#endif

.align 512
user_globals:

#ifndef USER_HEAP_SIZE
#define USER_HEAP_SIZE 0x2000
#endif

#ifndef USER_PAGE_CUSTOM_MAP
SECTION .USER_HEAP        DATA_VA=USER_HEAP_DATA_VA
changequote([, ])dnl
forloop([i], 0, 7, [	
ifdef([part_]i[_used],[
attr_data {
        Name = .USER_HEAP,
        RA = USER_HEAP_DATA_RA,
        PA = ra2pa2(USER_HEAP_DATA_RA,i),
#ifndef USE_N1_TSB_NAMES
        [part_]i[_ctx_nonzero_tsb_config_0],
#else
        [part_]i[_d_ctx_nonzero_ps0_tsb],
#endif
        TTE_G=1,       TTE_Context=0x44, TTE_V=1,    TTE_Size=0, TTE_NFO=0, TTE_IE=0, 
        TTE_Soft2=0,   TTE_Diag=0,    TTE_Soft=0, TTE_L=0,    TTE_CP=1,  TTE_CV=0, 
        TTE_E=0,      TTE_P=0,        TTE_W=1
        }

.data
.global user_heap_start
user_heap_start:
.skip (USER_HEAP_SIZE-0x4)
.word 0x0
.end
])dnl
])dnl
changequote(`,')dnl'
#endif
