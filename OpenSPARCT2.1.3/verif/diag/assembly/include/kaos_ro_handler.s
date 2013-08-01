/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: kaos_ro_handler.s
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
#define LOCAL_HYPERVISOR_SECTION_TEXT_VA 0x20210000
attr_text {
        Name = local_hypervisor_section_text,	
	hypervisor
        }
	
SECTION local_hypervisor_section_text TEXT_VA=LOCAL_SUPERVISOR_SECTION_TEXT_VA
.seg "text"
.global	toggle_tte_w_handler
toggle_tte_w_handler:
 	setx    0xfffff000, %g2, %g3
	and	%g6, %g3, %g6
	or	%g6, 0x44, %g6	
#ifdef CHECK_SFSR_SFAR
        mov     0x18, %g7
        ldxa    [%g7] ASI_PARTITION_ID, %g2         ! get sfsr
        mov     0x20, %g7
        ldxa    [%g7] ASI_PARTITION_ID, %g3         ! get sfar
#endif
toggle_tte_w_conf_0:
	! Load TSB_CONFIG address in %g7
        mov ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_0, %g7
	
toggle_tte_w_tsbptr_calc:	
!Uses g1-g5, Expects TSB_CONFIG address in %g7, va in %g6, REsults in %g1
!Leave %g6 intact
#include "mmu_ptr_calc.s"	
toggle_w_load_entry:
	setx	0x1fff, %g4, %g2			! 13 context-bits
	and	%g6, %g2, %g2
	sllx	%g2, 48, %g2
	srl	%g6, 22, %g4
	or	%g2, %g4, %g2			
	ldda	[%g1] ASI_NUCLEUS_QUAD_LDD, %g4		! load tte from ps0 tsb
	!ldxa	[%g0] ASI_DMMU_TAG_REG, %g2		! get va/context from tag-target
	cmp	%g2, %g4
	bne	%xcc, toggle_tte_w_check_for_ptr_chase
	nop
	ba	toggle_tte_w_trap_done
	mov	0x80, %g1
	
toggle_tte_w_check_for_ptr_chase:
    cmp %g4, -1         ! if all 1's, follow link
    be,a    %xcc, toggle_tte_w_ptr_chase
    nop

    !! Look up all config registers (1-3)
    !! Gotta do SW table walk through the 3 remaing configs ..
    ! Expect %g7 to stll have addr of last ctx0 config register
    ! and %g6 should have va/context from tag access register

    ! Normalize %g7
    sllx %g6, 51, %g5
    brnz,a %g5, 1f
    sub %g7, 0x20, %g7     ! this executes only if branch taken

1:

    cmp %g7, ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_1
    bl,a toggle_tte_w_tsbptr_calc
toggle_tte_w_conf_1:
    mov ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_1, %g7

    cmp %g7, ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_2
    bl,a toggle_tte_w_tsbptr_calc
toggle_tte_w_conf_2:
    mov ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_2, %g7

    cmp %g7, ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_3
    bl,a toggle_tte_w_tsbptr_calc
toggle_tte_w_conf_3:
    mov ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_3, %g7

#ifndef SUN4V
	sllx	%g5, 15, %g3		! extract size[2]
	srlx	%g3, 61, %g3
	sllx	%g5, 1, %g1		! extract size[1:0]
	srlx	%g1, 62, %g1
	or	%g3, %g1, %g1		! %g1 = size[2:0]
#else
	sllx	%g5, 61, %g1
	srlx	%g1, 61, %g1            ! %g1 = size[2:0]
#endif
	mulx	%g1, 3, %g1
	sub	%g0, 1, %g3
	sllx	%g3, 13, %g3
	sllx	%g3, %g1, %g3
        sethi   %hi(0x00001fff), %g1
        or      %g1, 0xfff, %g1
	or	%g3, %g1, %g3		! %g3 = va/ctxt mask based on size[2:0]

	and	%g2, %g3, %g3		! apply mask
	cmp	%g3, %g4		! check if va/ctxt match
	be	%xcc, toggle_tte_w_trap_done
	nop
	
toggle_tte_w_ptr_chase:
    or  %g5, %g0, %g3           ! %g3 is link-reg
toggle_tte_w_ptr_chase_loop:
    ldda    [%g3] ASI_NUCLEUS_QUAD_LDD, %g4     ! load tte from tsb
    ldxa    [%g0] ASI_DMMU_TAG_REG, %g2     ! get va/context from tag-target
    cmp %g2, %g4
    bne %xcc, toggle_tte_w_follow_link
    nop
    ba  toggle_tte_w_trap_done
    mov ASI_PARTITION_ID_VAL, %g1       ! offset (VA) for patrition id

toggle_tte_w_follow_link:
    ldx [%g3+16], %g3
    cmp %g3, -1
    bne %xcc, toggle_tte_w_ptr_chase_loop ! keep chasing pointer
    nop

toggle_tte_w_next_tsb:
    ! Look up the Next TSB, until done with all TSBs ?
    ! Compare with TSB_CONFIG_3 for ctx0 and TSB_CONFIG_3+0x20 for ctx!0
    mov ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_3, %g4
    sllx %g6, 51, %g5
    brnz,a %g5, 2f
    sub %g7, 0x20, %g7
2:  
    cmp %g7, %g4
    bl 1b
    nop		

toggle_tte_w_trap_done:
	// check to see if RA[39] is set.
	// RA[39] = 0 means accessing memory space
	// RA[39] = 1 means accessing I/O space
	mov	%g5, %g3
	sllx	%g3, 24, %g3
	srlx	%g3, 63, %g3
	brnz	%g3, toggle_tte_w_skip_part_base	
	! add partition base to data-in
	setx	partition_base_list, %g3, %g2	! for partition base
	ldxa	[%g1] ASI_PARTITION_ID, %g3		! partition id
	sllx	%g3, 3, %g3		! offset - partition list
	ldx	[%g2 + %g3], %g1
	add	%g5, %g1, %g5
toggle_tte_w_skip_part_base:	
	mov	0x30, %g7
#ifndef SUN4V
	mov     0x000, %g6
	mov	0x2, %g1		! set W-bit
#else
	mov	0x400, %g6		
	mov	0x40, %g1		! set W-bit
#endif
	xor	%g1, %g5, %g5
	!stxa	%g4, [ %g7 ] ASI_PARTITION_ID	! {tag-access, data-in}
	stxa	%g5, [ %g6 ] ASI_DTLB_DATA_IN
	retl
	ta T_CHANGE_NONHPRIV 
!!	

	
toggle_tte_w_handler_ext:
	cmp	%g4, -1			! if all 1's, follow link
	be,a	%xcc, toggle_tte_w_ptr_chase
	mov	0, %g7			! remember ptr chase from ps0

    !! Look up all config registers (1-3)
    !! Gotta do SW table walk through the 3 remaing configs ..
    ! Expect %g7 to stll have addr of last ctx0 config register
    ! and %g6 should have va/context from tag access register

    ! Normalize %g7
    sllx %g6, 51, %g5
    brnz,a %g5, 1f
    sub %g7, 0x20, %g7     ! this executes only if branch taken

1:

    cmp %g7, ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_1
    bl,a toggle_tte_w_tsbptr_calc
    mov ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_1, %g7

    cmp %g7, ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_2
    bl,a toggle_tte_w_tsbptr_calc
    mov ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_2, %g7

    cmp %g7, ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_3
    bl,a toggle_tte_w_tsbptr_calc
    mov ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_3, %g7

    ! Now try other crazy stuff, which has not been debugged for N2
    ! TBD TBD TBD TBD TBD

#ifndef SUN4V
	sllx	%g5, 15, %g3		! extract size[2]
	srlx	%g3, 61, %g3
	sllx	%g5, 1, %g1		! extract size[1:0]
	srlx	%g1, 62, %g1
	or	%g3, %g1, %g1		! %g1 = size[2:0]
#else
	sllx	%g5, 61, %g1
	srlx	%g1, 61, %g1            ! %g1 = size[2:0]
#endif
	mulx	%g1, 3, %g1
	sub	%g0, 1, %g3
	sllx	%g3, 13, %g3
	sllx	%g3, %g1, %g3
    sethi   %hi(0x00001fff), %g1
    or      %g1, 0xfff, %g1
	or	%g3, %g1, %g3		! %g3 = va/ctxt mask based on size[2:0]

	and	%g2, %g3, %g3		! apply mask
	cmp	%g3, %g4		! check if va/ctxt match
	be,a	%xcc, toggle_tte_w_trap_done
	mov	0x80, %g1		! offset (VA) for patrition id
		
