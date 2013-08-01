/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: interrupt_pci_regs.s
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
#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#include "hboot.s"
#include "asi_s.h"
#include "peu_defines.h"

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:

	! Switch to hypervisor mode.

	ta	T_CHANGE_HPRIV
	nop
	ta	T_CHANGE_PRIV
	nop
pstate:	
	rdpr	%pstate, %l0
	and	%l0, 0x2, %l1
	wrpr	%l0, %l1, %pstate	! Disable interrupts

	! Interrupt Mapping registers
map_write_1:
	setx	PCI_E_INT_MAP_ADDR, %g1, %g2
	set	PCI_E_INT_MAP_COUNT, %g3
	set	PCI_E_INT_MAP_STEP, %g4
	setx	0x80000000fe0003C0, %g1, %g5

map_write_1_loop:
	stx	%g5, [%g2]
	addx	%g2, %g4, %g2
	cmp	%g3, 1
	bne	map_write_1_loop
	dec	%g3

	! Two more registers to write, and skip over "missing" 2 registers.
map_write_1_extra:	
	addx	%g2, %g4, %g2
	addx	%g2, %g4, %g2
	stx	%g5, [%g2]
	addx	%g2, %g4, %g2
	stx	%g5, [%g2]

map_read_1:
	setx	PCI_E_INT_MAP_ADDR, %g1, %g2
	set	PCI_E_INT_MAP_COUNT, %g3

map_read_1_loop:	
	ldx	[%g2], %g7
	addx	%g2, %g4, %g2
	cmp	%g7, %g5
	bne	test_failed
	nop
	cmp	%g3, 1
	bne	map_read_1_loop
	dec	%g3

	! Two more registers to read, and ship over "missing" 2 registers.
map_read_1_extra:	
	addx	%g2, %g4, %g2
	addx	%g2, %g4, %g2
	ldx	[%g2], %g7
	addx	%g2, %g4, %g2
	cmp	%g7, %g5
	bne	test_failed
	nop
	ldx	[%g2], %g7
	cmp	%g7, %g5
	bne	test_failed
	nop

map_write_0:
	setx	PCI_E_INT_MAP_ADDR, %g1, %g2
	set	PCI_E_INT_MAP_COUNT, %g3
	set	PCI_E_INT_MAP_STEP, %g4

map_write_0_loop:	
	stx	%g0, [%g2]
	addx	%g2, %g4, %g2
	cmp	%g3, 1
	bne	map_write_0_loop
	dec	%g3

	! Two more registers to write, and skip over "missing" 2 registers.
map_write_0_extra:
	addx	%g2, %g4, %g2
	addx	%g2, %g4, %g2
	stx	%g0, [%g2]
	addx	%g2, %g4, %g2
	stx	%g0, [%g2]

map_read_0:
	setx	PCI_E_INT_MAP_ADDR, %g1, %g2
	set	PCI_E_INT_MAP_COUNT, %g3

map_read_0_loop:	
	ldx	[%g2], %g7
	addx	%g2, %g4, %g2
	cmp	%g7, 0
	bne	test_failed
	nop
	cmp	%g3, 1
	bne	map_read_0_loop
	dec	%g3

	! Two more registers to read, and ship over "missing" 2 registers.
map_read_0_extra:	
	addx	%g2, %g4, %g2
	addx	%g2, %g4, %g2
	ldx	[%g2], %g7
	addx	%g2, %g4, %g2
	cmp	%g7, 0
	bne	test_failed
	nop
	ldx	[%g2], %g7
	cmp	%g7, 0
	bne	test_failed
	nop

	! Interrupt Clear registers

clear:
	setx	PCI_E_INT_CLEAR_ADDR, %g1, %g2
	set	PCI_E_INT_CLEAR_COUNT, %g3
	set	PCI_E_INT_CLEAR_STEP, %g4
	set	3, %g5

clear_write_1_loop:
	stx	%g5, [%g2]
	addx	%g2, %g4, %g2
	cmp	%g3, 1
	bne	clear_write_1_loop
	dec	%g3

	! Two more registers to write, and skip over "missing" 2 registers.
clear_write_1_extra:
	addx	%g2, %g4, %g2
	addx	%g2, %g4, %g2
	stx	%g5, [%g2]
	addx	%g2, %g4, %g2
	stx	%g5, [%g2]

clear_read_1:
	setx	PCI_E_INT_CLEAR_ADDR, %g1, %g2
	set	PCI_E_INT_CLEAR_COUNT, %g3

clear_read_1_loop:	
	ldx	[%g2], %g7
	addx	%g2, %g4, %g2
	cmp	%g7, %g5
	bne	test_failed
	nop
	cmp	%g3, 1
	bne	clear_read_1_loop
	dec	%g3

	! Two more registers to read, and ship over "missing" 2 registers.
clear_read_1_extra:	
	addx	%g2, %g4, %g2
	addx	%g2, %g4, %g2
	ldx	[%g2], %g7
	addx	%g2, %g4, %g2
	cmp	%g7, %g5
	bne	test_failed
	nop
	ldx	[%g2], %g7
	cmp	%g7, %g5
	bne	test_failed
	nop

clear_write_0:
	setx	PCI_E_INT_CLEAR_ADDR, %g1, %g2
	set	PCI_E_INT_CLEAR_COUNT, %g3
	set	PCI_E_INT_CLEAR_STEP, %g4

clear_write_0_loop:	
	stx	%g0, [%g2]
	addx	%g2, %g4, %g2
	cmp	%g3, 1
	bne	clear_write_0_loop
	dec	%g3

	! Two more registers to write, and skip over "missing" 2 registers.
clear_write_0_extra:
	addx	%g2, %g4, %g2
	addx	%g2, %g4, %g2
	stx	%g0, [%g2]
	addx	%g2, %g4, %g2
	stx	%g0, [%g2]

clear_read_0:
	setx	PCI_E_INT_CLEAR_ADDR, %g1, %g2
	set	PCI_E_INT_CLEAR_COUNT, %g3

clear_read_0_loop:	
	ldx	[%g2], %g7
	addx	%g2, %g4, %g2
	cmp	%g7, 0
	bne	test_failed
	nop
	cmp	%g3, 1
	bne	clear_read_0_loop
	dec	%g3

	! Two more registers to read, and ship over "missing" 2 registers.
clear_read_0_extra:	
	addx	%g2, %g4, %g2
	addx	%g2, %g4, %g2
	ldx	[%g2], %g7
	addx	%g2, %g4, %g2
	cmp	%g7, 0
	bne	test_failed
	nop
	ldx	[%g2], %g7
	cmp	%g7, 0
	bne	test_failed
	nop

	! Interrupt Retry Timer register

retry_timer_write_1:
	setx	PCI_E_INT_RETRY_TIMER_ADDR, %g1, %g2
	setx	0x01ffffff, %g1, %g3
	stx	%g3, [%g2]

retry_timer_read_1:
	ldx	[%g2], %g4
	cmp	%g4, %g3
	bne	test_failed
	nop

retry_timer_write_0:
	stx	%g0, [%g2]

retry_timer_read_0:
	ldx	[%g2], %g5
	cmp	%g5, 0
	bne	test_failed
	nop

	! Interrupt State Status registers 1 and 2, read only

state_status:
	setx	PCI_E_INT_STATE_STATUS_1_ADDR, %g1, %g2
	setx	PCI_E_INT_STATE_STATUS_2_ADDR, %g1, %g3
	ldx	[%g2], %g0
	ldx	[%g3], %g0

	! INTX Status register, read only

intx_status:
	setx	PCI_E_INTX_STATUS_ADDR, %g1, %g2
	ldx	[%g2], %g0

	! INT A/B/C/D Clear registers, RW1C

int_abcd_clear:
	set	1, %g7
	setx	PCI_E_INT_A_CLEAR_ADDR, %g1, %g2
	setx	PCI_E_INT_B_CLEAR_ADDR, %g1, %g3
	setx	PCI_E_INT_C_CLEAR_ADDR, %g1, %g4
	setx	PCI_E_INT_D_CLEAR_ADDR, %g1, %g5

int_abcd_clear_write:
	stx	%g7, [%g2]
	stx	%g7, [%g3]
	stx	%g7, [%g4]
	stx	%g7, [%g5]

int_abce_clear_read:
	ldx	[%g2], %g6
	cmp	%g6, 0
	bne	test_failed
	nop

	ldx	[%g3], %g6
	cmp	%g6, 0
	bne	test_failed
	nop

	ldx	[%g4], %g6
	cmp	%g6, 0
	bne	test_failed
	nop

	ldx	[%g5], %g6
	cmp	%g6, 0
	bne	test_failed
	nop

	! Event Queue Base Address register.

event_que_base_addr:
	setx	PCI_E_EV_QUE_BASE_ADDRESS_ADDR, %g1, %g2

event_que_base_addr_write_1:
	subx	%g0, 1, %g3
	stx	%g3, [%g2]

event_que_base_addr_read_1:
	setx	0xfffffffffff80000, %g1, %g3
	ldx	[%g2], %g4
	cmp	%g4, %g3
	bne	test_failed
	nop

event_que_base_addr_write_0:
	stx	%g0, [%g2]

event_que_base_addr_read_0:
	ldx	[%g2], %g4
	cmp	%g4, %g0
	bne	test_failed
	nop

	! Event Queue Control Set registers, WO

event_que_ctl_set:
	setx	PCI_E_EV_QUE_CTL_SET_ADDR, %g1, %g2
	set	PCI_E_EV_QUE_CTL_SET_COUNT, %g3
	set	PCI_E_EV_QUE_CTL_SET_STEP, %g4

event_que_ctl_set_write_1:
	setx	0x100000000000, %g1, %g5	! First only write the EN bit

event_que_ctl_set_write_en_loop:
	stx	%g5, [%g2]
	addx	%g2, %g4, %g2
	cmp	%g3, 1
	bne	event_que_ctl_set_write_en_loop
	dec	%g3

	setx	PCI_E_EV_QUE_CTL_SET_ADDR, %g1, %g2
	set	PCI_E_EV_QUE_CTL_SET_COUNT, %g3
	setx	0x200000000000000, %g1, %g5	! Next write the ENOVERR bit

event_que_ctl_set_write_enoverr_loop:
	stx	%g5, [%g2]
	addx	%g2, %g4, %g2
	cmp	%g3, 1
	bne	event_que_ctl_set_write_enoverr_loop
	dec	%g3

	! Event Queue State registers, RO

event_que_ctl_state:
	setx	PCI_E_EV_QUE_STATE_ADDR, %g1, %g2
	setx	PCI_E_EV_QUE_STATE_COUNT, %g1, %g3
	setx	PCI_E_EV_QUE_STATE_STEP, %g1, %g4

event_que_ctl_state_loop:
	ldx	[%g2], %g5
	addx	%g2, %g4, %g2
	cmp	%g5, 4
	bne	test_failed
	nop

	cmp	%g3, 1
	bne	event_que_ctl_state_loop
	dec	%g3

	! Event Queue Control Clear registers, WO

event_que_ctl_clear:
	setx	PCI_E_EV_QUE_CTL_CLEAR_ADDR, %g1, %g2
	setx	PCI_E_EV_QUE_CTL_CLEAR_COUNT, %g1, %g3
	setx	PCI_E_EV_QUE_CTL_CLEAR_STEP, %g1, %g4
	setx	0x200900000000000, %g1, %g5

event_que_ctl_clear_write_loop:
	stx	%g5, [%g2]
	addx	%g2, %g4, %g2
	cmp	%g3, 1
	bne	event_que_ctl_clear_write_loop
	dec	%g3

	! Event Queue Tail registers

event_que_tail:
	setx	PCI_E_EV_QUE_TAIL_ADDR, %g1, %g2
	setx	PCI_E_EV_QUE_TAIL_COUNT, %g1, %g3
	setx	PCI_E_EV_QUE_TAIL_STEP, %g1, %g4

event_que_tail_write_1:
	set	0x7f, %g5

event_que_tail_write_1_loop:
	stx	%g5, [%g2]
	addx	%g2, %g4, %g2
	cmp	%g3, 1
	bne	event_que_tail_write_1_loop
	dec	%g3

event_que_tail_read_1:
	setx	PCI_E_EV_QUE_TAIL_ADDR, %g1, %g2
	setx	PCI_E_EV_QUE_TAIL_COUNT, %g1, %g3

event_que_tail_read_1_loop:
	ldx	[%g2], %g7
	cmp	%g7, %g5
	bne	test_failed
	nop

	addx	%g2, %g4, %g2
	cmp	%g3, 1
	bne	event_que_tail_read_1_loop
	dec	%g3
	
event_que_tail_write_0:
	setx	PCI_E_EV_QUE_TAIL_ADDR, %g1, %g2
	setx	PCI_E_EV_QUE_TAIL_COUNT, %g1, %g3

event_que_tail_write_0_loop:
	stx	%g0, [%g2]
	addx	%g2, %g4, %g2
	cmp	%g3, 1
	bne	event_que_tail_write_0_loop
	dec	%g3

event_que_tail_read_0:
	setx	PCI_E_EV_QUE_TAIL_ADDR, %g1, %g2
	setx	PCI_E_EV_QUE_TAIL_COUNT, %g1, %g3

event_que_tail_read_0_loop:
	ldx	[%g2], %g7
	cmp	%g7, 0
	bne	test_failed
	nop

	addx	%g2, %g4, %g2
	cmp	%g3, 1
	bne	event_que_tail_read_0_loop
	dec	%g3
	
	! Event Queue Head registers

event_que_head:
	setx	PCI_E_EV_QUE_HEAD_ADDR, %g1, %g2
	setx	PCI_E_EV_QUE_HEAD_COUNT, %g1, %g3
	setx	PCI_E_EV_QUE_HEAD_STEP, %g1, %g4

event_que_head_write_1:
	set	0x7f, %g5

event_que_head_write_1_loop:
	stx	%g5, [%g2]
	addx	%g2, %g4, %g2
	cmp	%g3, 1
	bne	event_que_head_write_1_loop
	dec	%g3

event_que_head_read_1:
	setx	PCI_E_EV_QUE_HEAD_ADDR, %g1, %g2
	setx	PCI_E_EV_QUE_HEAD_COUNT, %g1, %g3

event_que_head_read_1_loop:
	ldx	[%g2], %g7
	cmp	%g7, %g5
	bne	test_failed
	nop

	addx	%g2, %g4, %g2
	cmp	%g3, 1
	bne	event_que_head_read_1_loop
	dec	%g3
	
event_que_head_write_0:
	setx	PCI_E_EV_QUE_HEAD_ADDR, %g1, %g2
	setx	PCI_E_EV_QUE_HEAD_COUNT, %g1, %g3

event_que_head_write_0_loop:
	stx	%g0, [%g2]
	addx	%g2, %g4, %g2
	cmp	%g3, 1
	bne	event_que_head_write_0_loop
	dec	%g3

event_que_head_read_0:
	setx	PCI_E_EV_QUE_HEAD_ADDR, %g1, %g2
	setx	PCI_E_EV_QUE_HEAD_COUNT, %g1, %g3

event_que_head_read_0_loop:
	ldx	[%g2], %g7
	cmp	%g7, 0
	bne	test_failed
	nop

	addx	%g2, %g4, %g2
	cmp	%g3, 1
	bne	event_que_head_read_0_loop
	dec	%g3

	! MSI Mapping registers
	
msi_mapping:	
	setx	PCI_E_MSI_MAP_ADDR, %g1, %g2
	setx	PCI_E_MSI_MAP_COUNT, %g1, %g3
	setx	PCI_E_MSI_MAP_STEP, %g1, %g4

msi_mapping_write_1:
	setx	0x800000000000003f, %g1, %g5

msi_mapping_write_1_loop:
	stx	%g5, [%g2]
	addx	%g2, %g4, %g2
	cmp	%g3, 1
	bne	msi_mapping_write_1_loop
	dec	%g3

msi_mapping_read_1:
	setx	PCI_E_MSI_MAP_ADDR, %g1, %g2
	setx	PCI_E_MSI_MAP_COUNT, %g1, %g3

msi_mapping_read_1_loop:
	ldx	[%g2], %g7
	cmp	%g7, %g5
	addx	%g2, %g4, %g2
	cmp	%g3, 1
	bne	msi_mapping_read_1_loop
	dec	%g3


msi_mapping_write_0:
	setx	PCI_E_MSI_MAP_ADDR, %g1, %g2
	setx	PCI_E_MSI_MAP_COUNT, %g1, %g3
	setx	PCI_E_MSI_MAP_STEP, %g1, %g4

msi_mapping_write_0_loop:
	stx	%g0, [%g2]
	addx	%g2, %g4, %g2
	cmp	%g3, 1
	bne	msi_mapping_write_0_loop
	dec	%g3

msi_mapping_read_0:
	setx	PCI_E_MSI_MAP_ADDR, %g1, %g2
	setx	PCI_E_MSI_MAP_COUNT, %g1, %g3

msi_mapping_read_0_loop:
	ldx	[%g2], %g7
	cmp	%g7, 0
	addx	%g2, %g4, %g2
	cmp	%g3, 1
	bne	msi_mapping_read_0_loop
	dec	%g3

	! MSI Clear registers
	
msi_clear:	
	setx	PCI_E_MSI_CLEAR_ADDR, %g1, %g2
	setx	PCI_E_MSI_CLEAR_COUNT, %g1, %g3
	setx	PCI_E_MSI_CLEAR_STEP, %g1, %g4

msi_clear_write_1:
	setx	0x4000000000000000, %g1, %g5

msi_clear_write_1_loop:
	stx	%g5, [%g2]
	addx	%g2, %g4, %g2
	cmp	%g3, 1
	bne	msi_clear_write_1_loop
	dec	%g3

msi_clear_read_1:
	setx	PCI_E_MSI_CLEAR_ADDR, %g1, %g2
	setx	PCI_E_MSI_CLEAR_COUNT, %g1, %g3

msi_clear_read_1_loop:
	ldx	[%g2], %g7
	cmp	%g7, 0
	addx	%g2, %g4, %g2
	cmp	%g3, 1
	bne	msi_clear_read_1_loop
	dec	%g3


msi_clear_write_0:
	setx	PCI_E_MSI_CLEAR_ADDR, %g1, %g2
	setx	PCI_E_MSI_CLEAR_COUNT, %g1, %g3
	setx	PCI_E_MSI_CLEAR_STEP, %g1, %g4

msi_clear_write_0_loop:
	stx	%g0, [%g2]
	addx	%g2, %g4, %g2
	cmp	%g3, 1
	bne	msi_clear_write_0_loop
	dec	%g3

msi_clear_read_0:
	setx	PCI_E_MSI_CLEAR_ADDR, %g1, %g2
	setx	PCI_E_MSI_CLEAR_COUNT, %g1, %g3

msi_clear_read_0_loop:
	ldx	[%g2], %g7
	cmp	%g7, 0
	addx	%g2, %g4, %g2
	cmp	%g3, 1
	bne	msi_clear_read_0_loop
	dec	%g3

	! Interrupt Mondo Data 0 and 1 registers

intr_mondo_data:
	setx	PCI_E_INT_MONDO_DATA_0_ADDR, %g1, %g2
	setx	PCI_E_INT_MONDO_DATA_1_ADDR, %g1, %g3

intr_mondo_data_write_1:
	subx	%g0, 1, %g7
	stx	%g7, [%g2]
	stx	%g7, [%g3]

intr_mondo_data_read_1:
	ldx	[%g2], %g6
	andn	%g7, 0x3f, %g1
	cmp	%g6, %g1
	bne	test_failed
	nop
	
	ldx	[%g3], %g5
	cmp	%g5, %g7
	bne	test_failed
	nop

intr_mondo_data_write_0:
	stx	%g0, [%g2]
	stx	%g0, [%g3]

intr_mondo_data_read_0:
	ldx	[%g2], %g6
	cmp	%g6, 0
	bne	test_failed
	nop
	
	ldx	[%g3], %g5
	cmp	%g5, 0
	bne	test_failed
	nop

	! ERR COR Mapping register

err_cor_map:
	setx	PCI_E_ERR_COR_MAP_ADDR, %g1, %g2

err_cor_map_write_1:
	subx	%g0, 1, %g5
	stx	%g5, [%g2]

err_core_map_read_1:
	ldx	[%g2], %g6
	setx	0x800000000000003f, %g1, %g7
	cmp	%g6, %g7
	bne	test_failed
	nop

err_cor_map_write_0:
	stx	%g0, [%g2]

err_cor_map_read_0:
	ldx	[%g2], %g3
	cmp	%g3, 0
	bne	test_failed
	nop

	! ERR NONFATAL Mapping register

err_nonfatal_map:
	setx	PCI_E_ERR_NONFATAL_MAP_ADDR, %g1, %g2

err_nonfatal_map_write_1:
	subx	%g0, 1, %g5
	stx	%g5, [%g2]

err_nonfatal_map_read_1:
	ldx	[%g2], %g6
	setx	0x800000000000003f, %g1, %g7
	cmp	%g6, %g7
	bne	test_failed
	nop

err_nonfatal_map_write_0:
	stx	%g0, [%g2]

err_nonfatal_map_read_0:
	ldx	[%g2], %g3
	cmp	%g3, 0
	bne	test_failed
	nop

	! ERR FATAL Mapping register

err_fatal_map:
	setx	PCI_E_ERR_FATAL_MAP_ADDR, %g1, %g2

err_fatal_map_write_1:
	subx	%g0, 1, %g5
	stx	%g5, [%g2]

err_fatal_map_read_1:
	ldx	[%g2], %g6
	setx	0x800000000000003f, %g1, %g7
	cmp	%g6, %g7
	bne	test_failed
	nop

err_fatal_map_write_0:
	stx	%g0, [%g2]

err_fatal_map_read_0:
	ldx	[%g2], %g3
	cmp	%g3, 0
	bne	test_failed
	nop

	! PM PME Mapping register

pm_pme_map:
	setx	PCI_E_PM_PME_MAP_ADDR, %g1, %g2

pm_pme_map_write_1:
	subx	%g0, 1, %g5
	stx	%g5, [%g2]

pm_pme_map_read_1:
	ldx	[%g2], %g6
	setx	0x800000000000003f, %g1, %g7
	cmp	%g6, %g7
	bne	test_failed
	nop

pm_pme_map_write_0:
	stx	%g0, [%g2]

pm_pme_map_read_0:
	ldx	[%g2], %g3
	cmp	%g3, 0
	bne	test_failed
	nop

	! PME To ACK Mapping register

pme_ack_map:
	setx	PCI_E_PME_ACK_MAP_ADDR, %g1, %g2

pme_ack_map_write_1:
	subx	%g0, 1, %g5
	stx	%g5, [%g2]

pme_ack_map_read_1:
	ldx	[%g2], %g6
	setx	0x800000000000003f, %g1, %g7
	cmp	%g6, %g7
	bne	test_failed
	nop

pme_ack_map_write_0:
	stx	%g0, [%g2]

pme_ack_map_read_0:
	ldx	[%g2], %g3
	cmp	%g3, 0
	bne	test_failed
	nop

	! IMU Interrupt Enable register

imu_int_enable:
	setx	PCI_E_IMU_INT_ENB_ADDR, %g1, %g2

imu_int_enable_write_1:
	setx	0x7fff00007fff, %g1, %g3	! Writeable fields
	stx	%g3, [%g2]

imu_int_enable_read_1:
	ldx	[%g2], %g4
	cmp	%g4, %g3
	bne	test_failed
	nop

imu_int_enable_write_0:
	stx	%g0, [%g2]

imu_int_enable_read_0:
	ldx	[%g2], %g5
	cmp	%g5, 0
	bne	test_failed
	nop

	! IMU Interrupt Status register, RO

imu_int_stat:
	setx	PCI_E_IMU_INT_STAT_ADDR, %g1, %g2
	ldx	[%g2], %g4
	cmp	%g4, 0
	bne	test_failed
	nop

	! DMU Core and Block Interrupt Enable register

dmu_int_enable:
	setx	PCI_E_DMU_INT_ENB_ADDR, %g1, %g2

dmu_int_enable_write_1:
	setx	0xc000000000000003, %g1, %g3
	stx	%g3, [%g2]

dmu_int_enable_read_1:
	ldx	[%g2], %g4
	cmp	%g4, %g3
	bne	test_failed
	nop

dmu_int_enable_write_0:
	stx	%g0, [%g2]

dmu_int_enable_read_0:
	ldx	[%g2], %g5
	cmp	%g5, 0
	bne	test_failed
	nop

	! DMU Core and Block Error Status register, RO

dmu_err_status:
	setx	PCI_E_DMU_ERR_STAT_ADDR, %g1, %g2
	ldx	[%g2], %g1
	cmp	%g1, 0
	bne	test_failed
	nop

	! MSI 32-bit Address register

msi_32_addr:
	setx	PCI_E_MSI_32_ADDRESS_ADDR, %g1, %g2


msi_32_addr_write_1:
	subx	%g0, 1, %g3
	stx	%g3, [%g2]

msi_32_addr_read_1:
	ldx	[%g2], %g5
	setx	0xffff0000, %g1, %g4
	cmp	%g5, %g4
	bne	test_failed
	nop

msi_32_addr_write_0:
	stx	%g0, [%g2]

msi_32_addr_read_0:
	ldx	[%g2], %g1
	cmp	%g1, 0
	bne	test_failed
	nop

	! MSI 64-bit Address register

msi_64_addr:
	setx	PCI_E_MSI_64_ADDRESS_ADDR, %g1, %g2

msi_64_addr_write_1:
	subx	%g0, 1, %g3
	stx	%g3, [%g2]

msi_64_addr_read_1:
	ldx	[%g2], %g5
	setx	0xffffffffffff0000, %g1, %g4
	cmp	%g5, %g4
	bne	test_failed
	nop

msi_64_addr_write_0:
	stx	%g0, [%g2]

msi_64_addr_read_0:
	ldx	[%g2], %g1
	cmp	%g1, 0
	bne	test_failed
	nop

	! MMU Interrupt Enable register

mmu_int_enable:
	setx	PCI_E_MMU_INT_ENB_ADDR, %g1, %g2

mmu_int_enable_write_1:
	subx	%g0, 1, %g4
	stx	%g4, [%g2]

mmu_int_enable_read_1:
	ldx	[%g2], %g3
	setx	0x1fffff001fffff, %g1, %g5
	cmp	%g3, %g5
	bne	test_failed
	nop

mmu_int_enable_write_0:
	stx	%g0, [%g2]

mmu_int_enable_read_0:
	ldx	[%g2], %g3
	cmp	%g3, 0
	bne	test_failed
	nop

	! MMU Interrupt Status register, RO

mmu_int_status:
	setx	PCI_E_MMU_INT_STAT_ADDR, %g1, %g2
	ldx	[%g2], %g3
	cmp	%g3, 0
	bne	test_failed
	nop

	! MMU Error Status Clear register, RW1C

mmu_error_status:
	setx	PCI_E_MMU_ERR_STAT_CL_ADDR, %g1, %g2

mmu_error_status_write_1:
	subx	%g0, 1, %g5
	stx	%g5, [%g2]

mmu_error_status_read_0:
	ldx	[%g2], %g3
	cmp	%g3, 0
	bne	test_failed
	nop

	! MMU Error Status Set register, RW1S

mmu_err_status_set:
	setx	PCI_E_MMU_ERR_STAT_SET_ADDR, %g1, %g2

mmu_err_status_set_write_0:
	stx	%g0, [%g2]

mmu_err_status_set_read_0:
	ldx	[%g2], %g4
	cmp	%g4, 0
	bne	test_failed
	nop

mmu_err_status_set_write_1:
	subx	%g0, 1, %g1
	stx	%g1, [%g2]

mmu_err_status_set_read_1:
	ldx	[%g2], %g6
	setx	0x1fffff001fffff, %g1, %g4
	cmp	%g6, %g4
	bne	test_failed
	nop

	! MMU Error Status Clear register, RW1C,
	! status is set in MMU Error Status Set register above

mmu_error_status_2:
	setx	PCI_E_MMU_ERR_STAT_CL_ADDR, %g1, %g2

mmu_error_status_read_1_2:
	ldx	[%g2], %g6
	setx	0x1fffff001fffff, %g1, %g4
	cmp	%g6, %g4
	bne	test_failed
	nop

mmu_error_status_write_1_2:
	subx	%g0, 1, %g5
	stx	%g5, [%g2]

mmu_error_status_read_0_2:
	ldx	[%g2], %g3
	cmp	%g3, 0
	bne	test_failed
	nop

	! ILU Interrupt Enable register

ilu_int_enable:
	setx	PCI_E_ILU_INT_ENB_ADDR, %g1, %g2

ilu_int_enable_write_1:
	subx	%g0, 1, %g4
	stx	%g4, [%g2]

ilu_int_enable_read_1:
	ldx	[%g2], %g3
	setx	0xf0000000f0, %g1, %g5
	cmp	%g3, %g5
	bne	test_failed
	nop

ilu_int_enable_write_0:
	stx	%g0, [%g2]

ilu_int_enable_read_0:
	ldx	[%g2], %g3
	cmp	%g3, 0
	bne	test_failed
	nop

	! ILU Interrupt Status register, RO

ilu_int_status:
	setx	PCI_E_ILU_INT_STAT_ADDR, %g1, %g2
	ldx	[%g2], %g3
	cmp	%g3, 0
	bne	test_failed
	nop

	! ILU Error Status Clear register, RW1C

ilu_error_status:
	setx	PCI_E_ILU_ERR_STAT_CL_ADDR, %g1, %g2

ilu_error_status_write_1:
	subx	%g0, 1, %g5
	stx	%g5, [%g2]

ilu_error_status_read_0:
	ldx	[%g2], %g3
	cmp	%g3, 0
	bne	test_failed
	nop

	! ILU Error Status Set register, RW1S

ilu_err_status_set:
	setx	PCI_E_ILU_ERR_STAT_SET_ADDR, %g1, %g2

ilu_err_status_set_write_0:
	stx	%g0, [%g2]

ilu_err_status_set_read_0:
	ldx	[%g2], %g4
	cmp	%g4, 0
	bne	test_failed
	nop

ilu_err_status_set_write_1:
	subx	%g0, 1, %g1
	stx	%g1, [%g2]

ilu_err_status_set_read_1:
	ldx	[%g2], %g6
	setx	0xf0000000f0, %g1, %g4
	cmp	%g6, %g4
	bne	test_failed
	nop

	! ILU Error Status Clear register, RW1C,
	! status is set in ILU Error Status Set register above

ilu_error_status_2:
	setx	PCI_E_ILU_ERR_STAT_CL_ADDR, %g1, %g2

ilu_error_status_read_1_2:
	ldx	[%g2], %g6
	setx	0xf0000000f0, %g1, %g4
	cmp	%g6, %g4
	bne	test_failed
	nop

ilu_error_status_write_1_2:
	subx	%g0, 1, %g5
	stx	%g5, [%g2]

ilu_error_status_read_0_2:
	ldx	[%g2], %g3
	cmp	%g3, 0
	bne	test_failed
	nop

	! PEU Core and Block Interrupt Enable register

peu_int_enable:
	setx	PCI_E_PEU_INT_ENB_ADDR, %g1, %g2

peu_int_enable_write_1:
	setx	0x800000000000000f, %g1, %g3
	stx	%g3, [%g2]

peu_int_enable_read_1:
	ldx	[%g2], %g4
	cmp	%g4, %g3
	bne	test_failed
	nop

peu_int_enable_write_0:
	stx	%g0, [%g2]

peu_int_enable_read_0:
	ldx	[%g2], %g5
	cmp	%g5, 0
	bne	test_failed
	nop

	! PEU Core and Block Error Status register, RO

peu_err_status:
	setx	PCI_E_PEU_INT_STAT_ADDR, %g1, %g2
	ldx	[%g2], %g1
	cmp	%g1, 0
	bne	test_failed
	nop

	! PEU Other Interrupt Enable register

peu_other_int_enable:
	setx	PCI_E_PEU_OTHER_INT_ENB_ADDR, %g1, %g2

peu_other_int_enable_write_1:
	subx	%g0, 1, %g4
	stx	%g4, [%g2]

peu_other_int_enable_read_1:
	ldx	[%g2], %g3
	setx	0xffffff00ffffff, %g1, %g5
	cmp	%g3, %g5
	bne	test_failed
	nop

peu_other_int_enable_write_0:
	stx	%g0, [%g2]

peu_other_int_enable_read_0:
	ldx	[%g2], %g3
	cmp	%g3, 0
	bne	test_failed
	nop

	! PEU Other Interrupt Status register, RO

peu_other_int_status:
	setx	PCI_E_PEU_OTHER_INT_STAT_ADDR, %g1, %g2
	ldx	[%g2], %g3
	cmp	%g3, 0
	bne	test_failed
	nop

	! PEU Other Error Status Clear register, RW1C

peu_other_error_status:
	setx	PCI_E_PEU_OTHER_ERR_STAT_CL_ADDR, %g1, %g2

peu_other_error_status_write_1:
	subx	%g0, 1, %g5
	stx	%g5, [%g2]

peu_other_error_status_read_0:
	ldx	[%g2], %g3
	cmp	%g3, 0
	bne	test_failed
	nop

	! PEU Other Error Status Set register, RW1S

peu_other_err_status_set:
	setx	PCI_E_PEU_OTHER_ERR_STAT_SET_ADDR, %g1, %g2

peu_other_err_status_set_write_0:
	stx	%g0, [%g2]

peu_other_err_status_set_read_0:
	ldx	[%g2], %g4
	cmp	%g4, 0
	bne	test_failed
	nop

peu_other_err_status_set_write_1:
	subx	%g0, 1, %g1
	stx	%g1, [%g2]

peu_other_err_status_set_read_1:
	ldx	[%g2], %g6
	setx	0xffffff00ffffff, %g1, %g5
	cmp	%g6, %g5
	bne	test_failed
	nop

	! PEU Other Error Status Clear register, RW1C,
	! status is set in PEU Other Error Status Set register above

peu_other_error_status_2:
	setx	PCI_E_PEU_OTHER_ERR_STAT_CL_ADDR, %g1, %g2

peu_other_error_status_read_1_2:
	ldx	[%g2], %g6
	setx	0xffffff00ffffff, %g1, %g5
	cmp	%g6, %g5
	bne	test_failed
	nop

peu_other_error_status_write_1_2:
	subx	%g0, 1, %g5
	stx	%g5, [%g2]

peu_other_error_status_read_0_2:
	ldx	[%g2], %g3
	cmp	%g3, 0
	bne	test_failed
	nop

	! PEU UE Interrupt Enable register

peu_ue_int_enable:
	setx	PCI_E_PEU_UE_INT_ENB_ADDR, %g1, %g2

peu_ue_int_enable_write_1:
	subx	%g0, 1, %g4
	stx	%g4, [%g2]

peu_ue_int_enable_read_1:
	ldx	[%g2], %g3
	setx	0x001fffff001fffff, %g1, %g5
	cmp	%g3, %g5
	bne	test_failed
	nop

peu_ue_int_enable_write_0:
	stx	%g0, [%g2]

peu_ue_int_enable_read_0:
	ldx	[%g2], %g3
	cmp	%g3, 0
	bne	test_failed
	nop

	! PEU UE Interrupt Status register, RO

peu_ue_int_status:
	setx	PCI_E_PEU_UE_INT_STAT_ADDR, %g1, %g2
	ldx	[%g2], %g3
	cmp	%g3, 0
	bne	test_failed
	nop

	! PEU UE Status Clear register, RW1C

peu_ue_status:
	setx	PCI_E_PEU_UE_STAT_CL_ADDR, %g1, %g2

peu_ue_status_write_1:
	subx	%g0, 1, %g5
	stx	%g5, [%g2]

peu_ue_status_read_0:
	ldx	[%g2], %g3
	cmp	%g3, 0
	bne	test_failed
	nop

	! PEU UE Status Set register, RW1S

peu_ue_status_set:
	setx	PCI_E_PEU_UE_STAT_SET_ADDR, %g1, %g2

peu_ue_status_set_write_0:
	stx	%g0, [%g2]

peu_ue_status_set_read_0:
	ldx	[%g2], %g4
	cmp	%g4, 0
	bne	test_failed
	nop

peu_ue_status_set_write_1:
	subx	%g0, 1, %g1
	stx	%g1, [%g2]

peu_ue_status_set_read_1:
	ldx	[%g2], %g6
	setx	0x17f0110017f011, %g1, %g5
	cmp	%g6, %g5
	bne	test_failed
	nop

	! PEU UE Status Clear register, RW1C,
	! status is set in PEU UE Status Set register above

peu_ue_status_2:
	setx	PCI_E_PEU_UE_STAT_CL_ADDR, %g1, %g2

peu_ue_status_read_1_2:
	ldx	[%g2], %g6
	setx	0x17f0110017f011, %g1, %g5
	cmp	%g6, %g5
	bne	test_failed
	nop

peu_ue_status_write_1_2:
	subx	%g0, 1, %g5
	stx	%g5, [%g2]

peu_ue_status_read_0_2:
	ldx	[%g2], %g3
	cmp	%g3, 0
	bne	test_failed
	nop

	! PEU CE Interrupt Enable register

peu_ce_int_enable:
	setx	PCI_E_PEU_CE_INT_ENB_ADDR, %g1, %g2

peu_ce_int_enable_write_1:
	subx	%g0, 1, %g4
	stx	%g4, [%g2]

peu_ce_int_enable_read_1:
	ldx	[%g2], %g3
	setx	0x00001fff00001fff, %g1, %g5
	cmp	%g3, %g5
	bne	test_failed
	nop

peu_ce_int_enable_write_0:
	stx	%g0, [%g2]

peu_ce_int_enable_read_0:
	ldx	[%g2], %g3
	cmp	%g3, 0
	bne	test_failed
	nop

	! PEU CE Interrupt Status register, RO

peu_ce_int_status:
	setx	PCI_E_PEU_CE_INT_STAT_ADDR, %g1, %g2
	ldx	[%g2], %g3
	cmp	%g3, 0
	bne	test_failed
	nop

	! PEU CE Status Clear register, RW1C

peu_ce_status:
	setx	PCI_E_PEU_CE_STAT_CL_ADDR, %g1, %g2

peu_ce_status_write_1:
	subx	%g0, 1, %g5
	stx	%g5, [%g2]

peu_ce_status_read_0:
	ldx	[%g2], %g3
	cmp	%g3, 0
	bne	test_failed
	nop

	! PEU CE Status Set register, RW1S

peu_ce_status_set:
	setx	PCI_E_PEU_CE_STAT_SET_ADDR, %g1, %g2

peu_ce_status_set_write_0:
	stx	%g0, [%g2]

peu_ce_status_set_read_0:
	ldx	[%g2], %g4
	cmp	%g4, 0
	bne	test_failed
	nop

peu_ce_status_set_write_1:
	subx	%g0, 1, %g1
	stx	%g1, [%g2]

peu_ce_status_set_read_1:
	ldx	[%g2], %g6
	setx	0x11c10000000011c1, %g1, %g5
	cmp	%g6, %g5
	bne	test_failed
	nop

	! PEU CE Status Clear register, RW1C,
	! status is set in PEU CE Status Set register above

peu_ce_status_2:
	setx	PCI_E_PEU_CE_STAT_CL_ADDR, %g1, %g2

peu_ce_status_read_1_2:
	ldx	[%g2], %g6
	setx	0x11c10000000011c1, %g1, %g5
	cmp	%g6, %g5
	bne	test_failed
	nop

peu_ce_status_write_1_2:
	subx	%g0, 1, %g5
	stx	%g5, [%g2]

peu_ce_status_read_0_2:
	ldx	[%g2], %g3
	cmp	%g3, 0
	bne	test_failed
	nop

	! PEU DLPL Interrupt Enable register

peu_dlpl_int_enable:
	setx	PCI_E_PEU_DLPL_INT_ENB_ADDR, %g1, %g2

peu_dlpl_int_enable_write_1:
	subx	%g0, 1, %g4
	stx	%g4, [%g2]

peu_dlpl_int_enable_read_1:
	ldx	[%g2], %g3
	setx	0xff03ffff, %g1, %g5
	cmp	%g3, %g5
	bne	test_failed
	nop

peu_dlpl_int_enable_write_0:
	stx	%g0, [%g2]

peu_dlpl_int_enable_read_0:
	ldx	[%g2], %g3
	cmp	%g3, 0
	bne	test_failed
	nop

	! PEU DLPL Interrupt Status register, RO

peu_dlpl_int_status:
	setx	PCI_E_PEU_DLPL_INT_STAT_ADDR, %g1, %g2
	ldx	[%g2], %g3
	cmp	%g3, 0
	bne	test_failed
	nop

	! PEU DLPL Status Clear register, RW1C

peu_dlpl_status:
	setx	PCI_E_PEU_DLPL_STAT_CL_ADDR, %g1, %g2

peu_dlpl_status_write_1:
	subx	%g0, 1, %g5
	stx	%g5, [%g2]

peu_dlpl_status_read_0:
	ldx	[%g2], %g3
	cmp	%g3, 0
	bne	test_failed
	nop

	! PEU DLPL Status Set register, RW1S
	! Note since the link is not being trained some
	! bits in this register can be set.  So for the
	! write of zeros just check that the register
	! contents don't change.

peu_dlpl_status_set:
	setx	PCI_E_PEU_DLPL_STAT_SET_ADDR, %g1, %g2
	ldx	[%g2], %g5

peu_dlpl_status_set_write_0:
	stx	%g0, [%g2]

peu_dlpl_status_set_read_0:
	ldx	[%g2], %g4
	cmp	%g4, %g5
	bne	test_failed
	nop

peu_dlpl_status_set_write_1:
	subx	%g0, 1, %g1
	stx	%g1, [%g2]

peu_dlpl_status_set_read_1:
	ldx	[%g2], %g6
	setx	0xff03ffff, %g1, %g5
	cmp	%g6, %g5
	bne	test_failed
	nop

	! PEU DLPL Status Clear register, RW1C,
	! status is set in PEU DLPL Status Set register above

peu_dlpl_status_2:
	setx	PCI_E_PEU_DLPL_STAT_CL_ADDR, %g1, %g2

peu_dlpl_status_read_1_2:
	ldx	[%g2], %g6
	setx	0xff03ffff, %g1, %g5
	cmp	%g6, %g5
	bne	test_failed
	nop

peu_dlpl_status_write_1_2:
	subx	%g0, 1, %g5
	stx	%g5, [%g2]

peu_dlpl_status_read_0_2:
	setx	0x4000, %g2, %g7
	ldx	[%g2], %g3
	andn	%g3, %g7, %g3
	cmp	%g3, 0
	bne	test_failed
	nop

	! Done

	ba	test_passed
	nop

test_passed:
	EXIT_GOOD

test_failed:
	EXIT_BAD


/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
	.word	0x0
	.word	0x0
user_data_end:	
.end
