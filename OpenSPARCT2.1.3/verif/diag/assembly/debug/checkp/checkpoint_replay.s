/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: checkpoint_replay.s
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
#define ASI_INTR_ID 0x63

#define PART_0_BASE 0x100000000
#define CREGS_L2_CTL_REG 0x000000
#define KERNEL_BASE_DATA_VA      0x1f0c34000
#define KERNEL_BASE_DATA_RA      0x0f0c34000
#define KERNEL_BASE_TEXT_VA 0x1f1834000
#define KERNEL_BASE_TEXT_RA 0x0f1834000
#define MAIN_BASE_BSS_VA  0x1e0400000
#define MAIN_BASE_BSS_RA  0x0e0400000
#define MAIN_BASE_TEXT_VA 0x1e0200000
#define MAIN_BASE_TEXT_RA 0x0e0200000
#define MAIN_BASE_DATA_VA 0x1e0300000
#define MAIN_BASE_DATA_RA 0x0e0300000
/*put htrap code out of the way of the checkpoint memimage */
#define HV_RED_TEXT_PA          0x1f0040000
#define HV_RED_DATA_PA          0x1f004c000
#define HV_TRAP_BASE_PA         0x1f0080000
#define HV_TRAP_DATA_PA         0x1f008c000
#define PART0_Z_ADDR_0 0x1f0100000
#define PART0_NZ_ADDR_0 0x1f0200000
#define PART_0_LINK_AREA_BASE_ADDR 0x1f0300000
#define USER_HEAP_DATA_RA    0x0f0400000
#if 0
#define PART7_D_NZ_PS1_ADDR     0x1f4000000
#define PART0_D_NZ_PS0_ADDR     0x1f0600000
#define PART0_D_Z_PS0_ADDR      0x1f0500000
#define PART0_I_NZ_PS1_ADDR     0x1f0400000
#define PART0_I_Z_PS1_ADDR      0x1f0300000
#define PART0_I_NZ_PS0_ADDR     0x1f0200000
#define PART0_I_Z_PS0_ADDR      0x1f0100000

#endif
!no interrupts until after checkpointing so we can warm up the int pending regs correctly
#define CREGS_TSTATE_PSTATE_IE 0
#define CREGS_FPRS_FEF 1
#define DEBUG_INIT
#include "hboot.s"
#include "my_console.h"

!
! This is a generated diag. for 3des encription checking.
!
	.text
	.global main
main:
	nop
	ta      T_CHANGE_HPRIV
	nop
#ifdef CCU_NOCHANGE
	setx 0x8300000000, %g2, %g4
	mov  1, %g3
	sllx %g3, 32, %g3
	ldx  [%g4], %g2
	andn %g2, %g3, %g3
	stx  %g3, [%g4]    !clear change bit in ccu
#endif

#if 0
	ldxa    [%g0]ASI_INTR_ID, %g3
	andcc %g3, 0x3f, %g0
	bne no_print
	nop
!work around axis dram init problem. Not l2 miss while writing RAs bits
setx 0x1000, %g1, %g4
setx 0x9700000008, %g1, %g2
set 0xe, %g3
ba,a 1f
.align 0x40
1:
stx %g3, [%g2]
add %g2, %g4, %g2
stx %g3, [%g2]
add %g2, %g4, %g2
stx %g3, [%g2]
add %g2, %g4, %g2
stx %g3, [%g2]

!dram_ras_addr_width_reg <- e



setx 0x8000010020, %g1, %g2
!jbi_error_ovf <- 0
!stx %g3, [%g2]
sub %g0, 1, %g3
stx %g3, [%g2]
add %g2, 8, %g2
stx %g3, [%g2]
setx 0x8000010080, %g1, %g2
stx %g3, [%g2]
add %g2, 8, %g2
stx %g3, [%g2]
add %g2, 8, %g2
stx %g3, [%g2]
add %g2, 8, %g2
stx %g3, [%g2]
add %g2, 8, %g2
stx %g3, [%g2]

#include "system_regs.h.new.2"
#define HV_UART               0xfff0c2c000
setx    HV_UART, %g2, %g1
	ba uart_init
	rd %pc, %g7

! PRINT("\r\n");
!
!        PRINT("##### Reset/Config start #####\r\n");
!                PRINT("\r\n");
!                        PRINT("Reset status ...\r\n");

#ifdef SYNC_HACK_LOOP
	setx 0x800e602040, %g3, %g5
	sub %g0, 0x1, %g3
	stx %g3, [%g5]
	set SYNC_HACK_LOOP, %g1
1:
	ldx [%g5], %g3
	subcc %g1, 1, %g1
	bne 1b
	nop
#endif
	!IOB j int vec
	setx 0x9800000a00, %g3, %g5
	mov 0x1f, %g3
	stx %g3, [%g5]
#ifdef JBUS_DEBUG_PORT
!debug port setup
 setx 0x9800001820, %g3, %g2
!clear
 stx %g0, [%g2]
 stx %g0, [%g2+0x8]
 stx %g0, [%g2+0x10]
 stx %g0, [%g2+0x18]
 stx %g0, [%g2+0x20]
 setx 0x8, %g2, %g1           ; setx 0x9800001800, %g3, %g2; stx %g1, [%g2]
 setx 0x100, %g2, %g1         ; setx 0x9800002000, %g3, %g2; stx %g1, [%g2]
 setx 0x10000, %g2, %g1       ; setx 0x9800002100, %g3, %g2; stx %g1, [%g2]
 setx 0x3000ffffffff, %g2, %g1; setx 0x9800002140, %g3, %g2; stx %g1, [%g2]
 setx 0x0000ffffffff, %g2, %g1; setx 0x9800002148, %g3, %g2; stx %g1, [%g2]
 setx 0x3000ffffffff, %g2, %g1; setx 0x9800002180, %g3, %g2; stx %g1, [%g2]
 setx 0x0000ffffffff, %g2, %g1; setx 0x9800002188, %g3, %g2; stx %g1, [%g2]
 setx 0x6105ff, %g2, %g1      ; setx 0x8000004100, %g3, %g2; stx %g1, [%g2]
#endif
no_print:
!enable dbg port for bank 0
setx 0xa900000000, %g1, %g4
mov 1, %g1
sllx %g1, 20, %g1
stx %g1, [%g4]

#if 0
!only replay 1 thread per core for now
	ldxa    [%g0]ASI_INTR_ID, %g3
	andcc %g3, 0x7, %g0
	be do_replay
	nop
	ba,a diag_pass
#endif

do_replay:
!poke uart control addr so that write fifo will appear empty
   !     setx 0x1f10002005, %g1, %g2
   !     mov 0x40, %g1
   !     stb %g1,[%g2]
   !     wrpr %g0, 1, %tl
   !     wrhpr %g0, 0, %htstate

	!%tl save addr
	! setx 0x0000000000101148, %g2, %g1
	setx 0x0000000100801148, %g2, %g1
	ldxa    [%g0]ASI_INTR_ID, %g3
	and     %g3, 0x3f, %g3
	sllx    %g3, 16 , %g3
	add %g1, %g3, %g3
	ldx [%g3], %g3
#endif
#include "replay.s"

des_test:

start_msg_0:


diag_pass:
	ta T_GOOD_TRAP
	nop
#include "my_console.s"
/*
 ********************************
 *      Diag FAILED !           *
 ********************************
 */

diag_fail:
	set     0xdeadcafe,     %l7
	ta T_BAD_TRAP
	nop
	nop

	.data

