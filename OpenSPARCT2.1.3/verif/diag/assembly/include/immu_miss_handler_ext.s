/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: immu_miss_handler_ext.s
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
immu_miss_handler:  	

#ifdef EX_TRAPCHECK
	! extended trapcheck returns traptype
	mov	0x64,	%o0
#endif
	mov	ASI_IMMU_TAG_ACCESS_VAL, %g7
	ldxa	[%g7] ASI_IMMU_TAG_REG, %g6		! get va/context from tag-access

#ifdef USE_SOFTWARE_PTR_CALC

    ! SW Implementation of PTR register calQlations

iconfig_0:
    ! Load ZERO CTX TSB_CONFIG address in %g7
    mov ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_0, %g7

immu_tsbptr_calc:
!Uses g1-g5, Expects TSB_CONFIG address in %g7, va in %g6, REsults in %g1
!Leave %g6 intact
#include <mmu_ptr_calc.s>

#else
    
    mov ASI_ITSB_PTR_0, %g7

immu_tsbptr_calc:

	ldxa	[%g7] ASI_ITSB_PTR, %g1		

#endif

#ifdef MIMIC_SOLARIS
	srlx	%g0, %g0, %g0
	brnz	%g0, HT0_Fast_Instr_Access_MMU_Miss_0x64
	sll	%g0, %g0, %g0
	xor	%g0, %g0, %g0
#endif
	
iload_entry:
	ldda	[%g1] ASI_NUCLEUS_QUAD_LDD, %g4		! load tte from tsb
	srlx	%g5, 63, %g2                        ! Check valid bit ..
	brz,a	%g2, immu_check_for_ptr_chase
	cmp	%g4, -1			                        ! if all 1's, follow link
	ldxa	[%g0] ASI_IMMU_TAG_REG, %g2		! get va/context from tag-target
#ifdef IMMU_HAS_SHARED_CTXT
check_immu_has_shared_ctx:
    ! If this TSB has use_ctxt bits set, then mask context
    ! 1. Get TSB config (%g7 has TSB_CONFIG addr OR TSB_PTR addr)
#ifndef USE_SOFTWARE_PTR_CALC
    sllx %g6, 51, %g3
    brz,a %g3, compare_ttetag_i            ! Ignore shared ctx for nucleus
	stxa %g0, [%g0]ASI_SCRATCHPAD          ! Save decision for later
    sub %g7, 0x20, %g3                     ! %g3 has TSB config ADDR
#else 
    mov %g7, %g3                           ! %g3 has TSB config ADDR
#endif
    ldxa [%g3] ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g3 
check_use_ctx_i:
    srlx %g3, 61, %g3
    and %g3, 3, %g3                         ! %g3 has use_ctx bits ..
    brz %g3, compare_ttetag_i
	stxa %g3, [%g0]ASI_SCRATCHPAD          ! Save decision for later
mask_ctx_i:
    sethi %hi(0x1fff0000), %g1
    sllx %g1, 32, %g1                       ! Create mask for ctxt in tag target
    andn %g2, %g1, %g2                      ! Masked tag target (%g2) 
    andn %g4, %g1, %g4                      ! Masked tte tag (%g4)
#endif
compare_ttetag_i:
	cmp	%g2, %g4
	be	%xcc, immu_trap_done
	mov	0x80, %g1		                    ! offset (VA) for patrition id

    andcc %g5, 0x4, %g1                       ! Check TTE size for mask
	bz,a	%xcc, immu_check_for_ptr_chase      ! size <5 .. no masking reqd
	cmp	%g4, -1			                        ! if all 1's, follow link
    andn %g2, 0x3f, %g2                     ! mask out bits 22:27
	cmp	%g2, %g4                            ! Now compare masked tag target
	be	%xcc, immu_trap_done
	mov	0x80, %g1		                    ! offset (VA) for patrition id

immu_check_for_ptr_chase:    
	be,a	%xcc, immu_ptr_chase
    nop

    !! Look up all config registers (1-3)
    
#ifdef USE_SOFTWARE_PTR_CALC
    !! Gotta do SW table walk through the 3 remaing configs ..
    ! Expect %g7 to stll have addr of last config register
    ! and %g6 should have va/context from tag access register
    ! Normalize %g7
    sllx %g6, 51, %g5
    brnz,a %g5, 1f
    sub %g7, 0x20, %g7     ! this executes only if branch taken

1:
    cmp %g7, ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_1
    bl,a immu_tsbptr_calc
iconfig_1:
    mov ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_1, %g7

    cmp %g7, ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_2
    bl,a immu_tsbptr_calc
iconfig_2:
    mov ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_2, %g7

    cmp %g7, ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_3
    bl,a immu_tsbptr_calc
iconfig_3:
    mov ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_3, %g7

#else
    ! %g7 contains last pointer used ..
1:
iconfig_1:
	cmp	%g7, ASI_ITSB_PTR_1
	bge,a	%xcc, iconfig_2
	cmp	%g7, ASI_ITSB_PTR_2
	mov	ASI_ITSB_PTR_1, %g7
	ldxa	[%g7] ASI_ITSB_PTR, %g1
	ba,a	iload_entry
iconfig_2:
	bge,a	%xcc, iconfig_3
	cmp	%g7, ASI_ITSB_PTR_3
	mov	ASI_ITSB_PTR_2, %g7
	ldxa	[%g7] ASI_ITSB_PTR, %g1
	ba,a	iload_entry
iconfig_3:
	bge 	%xcc, ino_tte_in_tsb
	mov	ASI_ITSB_PTR_3, %g7
	ldxa	[%g7] ASI_ITSB_PTR, %g1
	ba,a	iload_entry
    
#endif

ino_tte_in_tsb:
    nop

! done if TT=0x9, otherwise error
#if defined(KAOS_SIMULATION) 
	ba	check_for_immu_sigsegv
	nop
#endif	
#ifdef IMMU_SKIP_IF_NO_TTE
    done
    nop
#endif	

itsb_failing_noptr:   
 	ta	T_BAD_TRAP
	nop
	
! Preserve g6/g7 !!
immu_ptr_chase:
 	or 	%g5, %g0, %g3           ! %g3 is link-reg
immu_ptr_chase_loop:
	ldda	[%g3] ASI_NUCLEUS_QUAD_LDD, %g4		! load tte from tsb
	srlx	%g5, 63, %g2
	brz	%g2, ifollow_link
	nop
	ldxa	[%g0] ASI_IMMU_TAG_REG, %g2		! get va/context from tag-target
#ifdef IMMU_HAS_SHARED_CTXT
check_immu_has_shared_ctx_l:
    ! If this TSB has use_ctxt bits set, then mask context
    ! 1. Get TSB config (%g7 has TSB_CONFIG addr OR TSB_PTR addr)
#ifndef USE_SOFTWARE_PTR_CALC
    sllx %g6, 51, %g1
    brz,a %g1, compare_ttetag_i            ! Ignore shared ctx for nucleus
	stxa %g0, [%g0]ASI_SCRATCHPAD          ! Save decision for later
    sub %g7, 0x20, %g1                     ! %g1 has TSB config ADDR
#else 
    mov %g7, %g1                           ! %g1 has TSB config ADDR
#endif
    ldxa [%g1] ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g1 
check_use_ctx_il:
    srlx %g1, 61, %g1
    and %g1, 3, %g1                         ! %g1 has use_ctx bits ..
    brz %g1, compare_ttetag_il
	stxa %g1, [%g0]ASI_SCRATCHPAD          ! Save decision for later
mask_ctx_il:
    sethi %hi(0x1fff0000), %g1
    sllx %g1, 32, %g1                        ! Create mask for ctxt in tag target

    andn %g2, %g1, %g2                      ! Masked tag target (%g2) 
    andn %g4, %g1, %g4                      ! Masked tte tag (%g4)
#endif
compare_ttetag_il:
	cmp	%g2, %g4
	be	%xcc, immu_trap_done
	mov	0x80, %g1		                    ! offset (VA) for patrition id

    andcc %g5, 0x4, %g1                     ! Check TTE size for mask
	bz	%xcc, ifollow_link                  ! size <5 .. no masking reqd
    andn %g2, 0x3f, %g2                     ! mask out bits 22:27
	cmp	%g2, %g4                            ! Now compare masked tag target
	be	%xcc, immu_trap_done
	mov	0x80, %g1		                    ! offset (VA) for patrition id
                                            ! DONT USE G1 until PA is done

ifollow_link:
	ldx	[%g3+16], %g3
	cmp	%g3, -1
	bne	%xcc, immu_ptr_chase_loop ! keep chasing pointer
	nop
    
inext_tsb:
    ! Look up the Next TSB, until done with all TSBs ?
#ifdef USE_SOFTWARE_PTR_CALC
    ! Compare with TSB_CONFIG_3 for ctx0 and TSB_CONFIG_3+0x20 for ctx!0
    mov ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_3, %g4
    sllx %g6, 51, %g5
    brnz,a %g5, 2f
    sub %g7, 0x20, %g7
2:  
    cmp %g7, %g4
    bl 1b
    nop
    
#else
    cmp %g7, ASI_ITSB_PTR_3
    bl 1b
    nop
#endif

! finished pointer chasing, go to bad_trap
ipointer_chase_unsuccessful: ! done if TT=0x9, otherwise error	
#if defined(KAOS_SIMULATION) 
	ba	check_for_immu_sigsegv
	nop
#endif	
#ifdef IMMU_SKIP_IF_NO_TTE
    done
	nop
#endif

ipage_fault_ptr:

 	ta	T_BAD_TRAP
	nop
	

immu_trap_done:
#ifdef IMMU_HAS_SHARED_CTXT
    ! %g6 has the unmasked tag access
    ldxa [%g0]ASI_SCRATCHPAD, %g3           ! Do we need to force ctxt ?
    brz %g3, done_forcing_ctxt_i            ! Nope
    cmp %g3, 1                              ! Which one ?
    movne %xcc, 0x8, %g3                    ! ctxt_0
    move %xcc, 0x108, %g3                   ! ctxt_1
force_ctxt_i:
    ldxa [%g3]ASI_PRIMARY_CONTEXT_REG, %g3  ! Get ctxt value
    srlx %g6, 13, %g2
    sllx %g2, 13, %g2                       ! Clear ctxt from tag-access
    or %g3, %g2, %g2                        ! Stuff in masked tag-access
	mov	ASI_IMMU_TAG_ACCESS_VAL, %g3        
    stxa %g2, [%g3]0x50                     ! Save forced ctx in tag-access
done_forcing_ctxt_i:
#endif
#ifdef SOME_TSB_PANOTRA
    ! Figure out if Offset should be added.
    ! %g7 contains TSB VA if SW ptr calc, and PTR address if HW_PTR_CALC
    ! %g6 contains ASI_IMMU_TAG_REG value
#ifndef USE_SOFTWARE_PTR_CALC
    sllx %g6, 51, %g3
    brz,a %g3, .+8
    sub %g7, 0x20, %g7      ! extra subtract for Z ctx 
    sub %g7, 0x20, %g7    
#endif
    ldxa [%g7] ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g3
check_ranotpa_i:
    and %g3, 0x100, %g3         ! Is RANOTPA 1 ?
    brz,a %g3, loaded_itlb
	stxa	%g5, [ %g0 ] ASI_ITLB_DATA_IN	! data-in
#endif
xlate_ratopa_i:
	! add partition base to data-in
	setx	partition_base_list, %g3, %g2	! for partition base
	ldxa	[%g1] ASI_PARTITION_ID, %g3		! partition id
	sllx	%g3, 3, %g3		! offset - partition list
	ldx	[%g2 + %g3], %g1
	add	%g5, %g1, %g5
	stxa	%g5, [ %g0 ] ASI_ITLB_DATA_IN	! data-in
loaded_itlb:

#ifdef H_T0_fast_instr_access_MMU_miss_Ext
	setx	H_T0_fast_instr_access_MMU_miss_Ext, %g4, %g5
	jmp	%g5
	nop
#else
	retry 
#endif
	



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!	
! Instr_Real_Tran_Miss_0x3e code here
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!    
    
immu_real_miss_handler:
	
	mov	0x30, %g7
	ldxa	[%g7] 0x50, %g2		! get ra from tag-access

	mov	%g2, %g4
	mov	%g0, %g1		! %g1 will contain partition base

#ifndef DISABLE_PART_LIMIT_CHECK
	mov	%g4, %g2
	srlx	%g2, 33, %g2		! check to see if ra exceeds 8GB limit
	cmp	%g2, %g0
	tne	%xcc, T_BAD_TRAP
#endif

	! add partition base to data-in
	setx	partition_base_list, %g1, %g2	! for partition base
	mov	ASI_PARTITION_ID_VAL, %g1		! offset (VA) for patrition id
	ldxa	[%g1] ASI_PARTITION_ID, %g3		! partition id
	sllx	%g3, 3, %g3		! offset - partition list
	ldx	[%g2 + %g3], %g1

immu_real_skip_part_base:
#ifdef REAL_DATA_ATTR
        setx    REAL_INST_ATTR, %g2, %g5 ! user defined attributes
#else
#ifndef SUN4V
	setx	0x8000000000000020, %g2, %g5 ! CP
#else
	setx	0x8000000000000400, %g2, %g5 ! CP
#endif
#endif

	srlx	%g4, 13, %g4		! get rid of garbage in context field
	sllx	%g4, 13, %g4
	or	%g4, %g5, %g5
	add	%g5, %g1, %g5
	mov	ASI_IMMU_TAG_ACCESS_VAL, %g7


	mov	0x400, %g6
	stxa	%g4, [ %g7 ] ASI_IMMU_TAG_REG	! {tag-access, data-in}
	stxa	%g5, [ %g6 ] ASI_ITLB_DATA_IN
	retry 

#if defined(KAOS_SIMULATION)	
check_for_immu_sigsegv: 


        rdpr    %tpc, %g1            !get va
        set     0xffffe000, %g2
        andcc   %g1, %g2, %g3        ! check first page 
        be      1f
        nop
        cmp     %g2, %g3             ! check last page
        bne     bad_trap
        nop
1:      
        add     %o7, 8, %g1
        wrpr    %g1, %tnpc 
        done
        nop

.global illegal_trap_handler
illegal_trap_handler:

        rdpr     %tpc, %g2

	ta       0x2e
        cmp      %o1, 0	
        setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_0,THR_0_PARTID), %g3, %g1
	be,a     1f
	nop 
        cmp      %o1, 1
        setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_1,THR_1_PARTID), %g3, %g1
	be,a     1f
	nop 
        cmp      %o1, 2
        setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_2,THR_2_PARTID), %g3, %g1
	be,a     1f
	nop 
        cmp      %o1, 3
        setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_3,THR_3_PARTID), %g3, %g1
	be,a     1f
	nop
        cmp      %o1, 4
        setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_4,THR_4_PARTID), %g3, %g1
	be,a     1f
	nop 
        cmp      %o1, 5
        setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_5,THR_5_PARTID), %g3, %g1
	be,a     1f
	nop 
        cmp      %o1, 6
        setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_6,THR_6_PARTID), %g3, %g1
	be,a     1f
	nop 
        cmp      %o1, 7
        setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_7,THR_7_PARTID), %g3, %g1
	be,a     1f
	nop
	ta       0x1
	nop

1:      stx      %g2, [%g1]

        mov     0x08, %g1
        ldxa    [%g1] 0x21, %o1
        mov     0x10, %g1
        ldxa    [%g1] 0x21, %o2 
        set     0x1, %o3
        set     0x0, %o4
        setx    handle_ill_trap, %g1, %o5

        ta 0x2a

        nop
		
#endif		
