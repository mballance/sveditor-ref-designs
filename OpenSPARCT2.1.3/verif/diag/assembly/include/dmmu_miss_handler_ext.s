/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: dmmu_miss_handler_ext.s
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
dmmu_miss_handler:  	
	

#ifdef EX_TRAPCHECK
	! extended trapcheck returns traptype
	mov	0x68,	%o0
#endif
	mov	ASI_DMMU_TAG_ACCESS_VAL, %g7
	ldxa	[%g7] ASI_DMMU_TAG_REG, %g6		! get va/context from tag-access

#ifdef USE_SOFTWARE_PTR_CALC
    ! SW Implementation of PTR register calQlations

dconfig_0:
    ! Load TSB_CONFIG address in %g7
    mov ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_0, %g7

dmmu_tsbptr_calc:
!Uses g1-g5, Expects TSB_CONFIG address in %g7, va in %g6, REsults in %g1
!Leave %g6 intact
#include <mmu_ptr_calc.s>
    
#else
        
    mov ASI_DTSB_PTR_0, %g7

dmmu_tsbptr_calc:

    ldxa    [%g7] ASI_DTSB_PTR, %g1
    
#endif

#ifdef MIMIC_SOLARIS
	srlx	%g0, %g0, %g0
	brnz	%g0, HT0_Fast_Data_Access_MMU_Miss_0x68
	sll	%g0, %g0, %g0
	xor	%g0, %g0, %g0
#endif
    

dload_entry:
	ldda	[%g1] ASI_NUCLEUS_QUAD_LDD, %g4		! load tte from  tsb
	srlx	%g5, 63, %g2                        ! Check valid bit ..
	brz,a	%g2, dmmu_check_for_ptr_chase
    cmp %g4, -1                             ! if all 1's, follow link
	ldxa	[%g0] ASI_DMMU_TAG_REG, %g2		! get va/context from tag-target
#ifdef DMMU_HAS_SHARED_CTXT
check_dmmu_has_shared_ctx:
    ! If this TSB has use_ctxt bits set, then mask context
    ! 1. Get TSB config (%g7 has TSB_CONFIG addr OR TSB_PTR addr)
#ifndef USE_SOFTWARE_PTR_CALC
    sllx %g6, 51, %g3
    brz,a %g3, compare_ttetag_d            ! Ignore shared ctx for nucleus
	stxa %g0, [%g0]ASI_SCRATCHPAD          ! Save decision for later
    sub %g7, 0x40, %g3                     ! %g3 has TSB config ADDR
#else 
    mov %g7, %g3                           ! %g3 has TSB config ADDR
#endif
    ldxa [%g3] ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g3 
check_use_ctx_d:
    srlx %g3, 61, %g3
    and %g3, 3, %g3                         ! %g3 has use_ctx bits ..
    brz %g3, compare_ttetag_d
	stxa %g3, [%g0]ASI_SCRATCHPAD          ! Save decision for later
mask_ctx_d:
    sethi %hi(0x1fff0000), %g1
    sllx %g1, 32, %g1                       ! Create mask for ctxt in tag target
    andn %g2, %g1, %g2                      ! Masked tag target (%g2) 
    andn %g4, %g1, %g4                      ! Masked tte tag (%g4)
#endif
compare_ttetag_d:
	cmp	%g2, %g4
	be	%xcc, dmmu_trap_done
	mov	0x80, %g1		! offset (VA) for patrition id

    andcc %g5, 0x4, %g1                     ! Check TTE size for mask
	bz,a	dmmu_check_for_ptr_chase        ! size <5 .. no masking reqd
    cmp %g4, -1                             ! if all 1's, follow link
    andn %g2, 0x3f, %g2                     ! mask out bits 22:27
	cmp	%g2, %g4                            ! Now compare masked tag target
	be	%xcc, dmmu_trap_done
	mov	0x80, %g1		                    ! offset (VA) for patrition id


dmmu_check_for_ptr_chase:    
    cmp %g4, -1                             ! if all 1's, follow link
    be,a    %xcc, dmmu_ptr_chase
    nop

    !! Look up all config registers (1-3)
    
#ifdef USE_SOFTWARE_PTR_CALC

    !! Gotta do SW table walk through the 3 remaing configs ..
    ! Expect %g7 to stll have addr of last ctx0 config register
    ! and %g6 should have va/context from tag access register

    ! Normalize %g7
    sllx %g6, 51, %g5
    brnz,a %g5, 1f
    sub %g7, 0x20, %g7     ! this executes only if branch taken

1:

    cmp %g7, ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_1
    bl,a dmmu_tsbptr_calc
dconfig_1:
    mov ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_1, %g7

    cmp %g7, ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_2
    bl,a dmmu_tsbptr_calc
dconfig_2:
    mov ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_2, %g7

    cmp %g7, ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_3
    bl,a dmmu_tsbptr_calc
dconfig_3:
    mov ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_3, %g7
    
#else

    ! %g7 contains last pointer used ..
1:
dconfig_1:
	cmp	%g7, ASI_DTSB_PTR_1
	bge,a	%xcc, dconfig_2
	cmp	%g7, ASI_DTSB_PTR_2
	mov	ASI_DTSB_PTR_1, %g7
	ldxa	[%g7] ASI_DTSB_PTR, %g1
	ba,a	dload_entry
dconfig_2:
	bge,a	%xcc, dconfig_3
	cmp	%g7, ASI_DTSB_PTR_3
	mov	ASI_DTSB_PTR_2, %g7
	ldxa	[%g7] ASI_DTSB_PTR, %g1
	ba,a	dload_entry
dconfig_3:
	bge 	%xcc, dno_tte_in_tsb
	mov	ASI_DTSB_PTR_3, %g7
	ldxa	[%g7] ASI_DTSB_PTR, %g1
	ba,a	dload_entry
#endif

dno_tte_in_tsb:
    nop
#ifdef DMMU_SKIP_IF_NO_TTE
    done
    nop
#endif

dtsb_failing_noptr:
#if defined(KAOS_SIMULATION) 
    ba  check_for_dmmu_flush_and_sigsegv
    nop
#endif	
 	ta	T_BAD_TRAP
	nop
    
! Preserve g6/g7 !!
dmmu_ptr_chase:
    or  %g5, %g0, %g3           ! %g3 is link-reg
dmmu_ptr_chase_loop:
    ldda    [%g3] ASI_NUCLEUS_QUAD_LDD, %g4     ! load tte from tsb
    srlx	%g5, 63, %g2
    brz	%g2, dfollow_link
    nop
    ldxa    [%g0] ASI_DMMU_TAG_REG, %g2     ! get va/context from tag-target
#ifdef DMMU_HAS_SHARED_CTXT
check_dmmu_has_shared_ctx_l:
    ! If this TSB has use_ctxt bits set, then mask context
    ! 1. Get TSB config (%g7 has TSB_CONFIG addr OR TSB_PTR addr)
#ifndef USE_SOFTWARE_PTR_CALC
    sllx %g6, 51, %g1
    brz,a %g1, compare_ttetag_dl           ! Ignore shared ctx for nucleus
	stxa %g0, [%g0]ASI_SCRATCHPAD          ! Save decision for later
    sub %g7, 0x40, %g1                     ! %g1 has TSB config ADDR
#else 
    mov %g7, %g1                           ! %g1 has TSB config ADDR
#endif
    ldxa [%g1] ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g1 
check_use_ctx_dl:
    srlx %g1, 61, %g1
    and %g1, 3, %g1                         ! %g1 has use_ctx bits ..
    brz %g1, compare_ttetag_dl
	stxa %g1, [%g0]ASI_SCRATCHPAD          ! Save decision for later
mask_ctx_dl:
    sethi %hi(0x1fff0000), %g1
    sllx %g1, 32, %g1                        ! Create mask for ctxt in tag target

    andn %g2, %g1, %g2                      ! Masked tag target (%g2) 
    andn %g4, %g1, %g4                      ! Masked tte tag (%g4)
#endif
compare_ttetag_dl:
    cmp %g2, %g4
    be %xcc, dmmu_trap_done
    mov 0x80, %g1                           ! offset (VA) for patrition id

    andcc %g5, 0x4, %g1                     ! Check TTE size for mask
	bz	dfollow_link                        ! size <5 .. no masking reqd
    andn %g2, 0x3f, %g2                     ! mask out bits 22:27
	cmp	%g2, %g4                            ! Now compare masked tag target
	be	%xcc, dmmu_trap_done
	mov	0x80, %g1		                    ! offset (VA) for patrition id
                                            ! DONT USE G1 until PA is done

dfollow_link:
    ldx [%g3+16], %g3
    cmp %g3, -1
    bne %xcc, dmmu_ptr_chase_loop ! keep chasing pointer
    nop

dnext_tsb:
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
    cmp %g7, ASI_DTSB_PTR_3
    bl 1b
    nop
#endif

dpointer_chase_unsuccessful:
#ifdef DMMU_SKIP_IF_NO_TTE
    done
	nop
#endif

dpage_fault_ptr:
#if defined(KAOS_SIMULATION) 
    ba  check_for_dmmu_flush_and_sigsegv
    nop
#endif	
 	ta	T_BAD_TRAP
	nop

dmmu_trap_done:
#ifdef DMMU_HAS_SHARED_CTXT
    ! %g6 has the unmasked tag access
    ldxa [%g0]ASI_SCRATCHPAD, %g3           ! Do we need to force ctxt ?
    brz %g3, done_forcing_ctxt_d            ! Nope
    cmp %g3, 1                              ! Which one ?
    movne %xcc, 0x8, %g3                    ! ctxt_0
    move %xcc, 0x108, %g3                   ! ctxt_1
force_ctxt_d:
    ldxa [%g3]ASI_PRIMARY_CONTEXT_REG, %g3  ! Get ctxt value
    srlx %g6, 13, %g2
    sllx %g2, 13, %g2                       ! Clear ctxt from tag-access
    or %g3, %g2, %g2                        ! Stuff in masked tag-access
	mov	ASI_DMMU_TAG_ACCESS_VAL, %g3        
    stxa %g2, [%g3]0x50                     ! Save forced ctx in tag-access
done_forcing_ctxt_d:
#endif
#ifdef SOME_TSB_PANOTRA
    ! Figure out if Offset should be added.
    ! %g7 contains TSB VA if SW ptr calc, and PTR address if HW_PTR_CALC
    ! %g6 contains ASI_DMMU_TAG_REG value
#ifndef USE_SOFTWARE_PTR_CALC
    sllx %g6, 51, %g3
    brz,a %g3, .+8
    sub %g7, 0x20, %g7      ! extra subtract for Z ctx 
    sub %g7, 0x40, %g7    
#endif
    ldxa [%g7] ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g3
check_ranotpa_d:
    and %g3, 0x100, %g3         ! Is RANOTPA 1 ?
    brz,a %g3, loaded_dtlb
	stxa	%g5, [ %g0 ] ASI_DTLB_DATA_IN	! data-in
#endif
xlate_ratopa_d:
    ! add partition base to data-in
    setx    partition_base_list, %g3, %g2   ! for partition base
    ldxa    [%g1] ASI_PARTITION_ID, %g3     ! partition id
    sllx    %g3, 3, %g3     ! offset - partition list
    ldx [%g2 + %g3], %g1
    add %g5, %g1, %g5
	
dmmu_skip_part_base:

    stxa    %g5, [ %g0 ] ASI_DTLB_DATA_IN   ! data-in
loaded_dtlb:
    retry 
	


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!	
! Data_Real_Tran_Miss_0x3f code here
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!    

dmmu_real_miss_handler:
	mov	0x30, %g7
	ldxa	[%g7] 0x58, %g2		! get ra from tag-access

	!! check to see if RA[39] is set.
	!! RA[39] = 0 means accessing memory space
	!! RA[39] = 1 means accessing I/O space
	mov	%g2, %g4
	mov	%g0, %g1		! %g1 will contain partition base

#ifndef DISABLE_PART_LIMIT_CHECK
    mov %g4, %g2
    srlx    %g2, 33, %g2        ! check to see if ra exceeds 8GB limit
    cmp %g2, %g0
    tne %xcc, T_BAD_TRAP
#endif

    ! add partition base to data-in
    setx    partition_base_list, %g1, %g2   ! for partition base
    mov ASI_PARTITION_ID_VAL, %g1       ! offset (VA) for patrition id
    ldxa    [%g1] ASI_PARTITION_ID, %g3     ! partition id
    sllx    %g3, 3, %g3     ! offset - partition list
    ldx [%g2 + %g3], %g1

dmmu_real_skip_part_base:
#ifdef REAL_DATA_ATTR
        setx    REAL_DATA_ATTR, %g2, %g5 ! user defined attributes
#else
#ifndef SUN4V
    setx    0x8000000000000022, %g2, %g5 ! CP W
#else
    setx    0x8000000000000440, %g2, %g5 ! CP W
#endif
#endif

    srlx    %g4, 13, %g4        ! get rid of garbage in context field
    sllx    %g4, 13, %g4
    or  %g4, %g5, %g5
    add %g5, %g1, %g5
    mov ASI_DMMU_TAG_ACCESS_VAL, %g7


    mov 0x400, %g6
    stxa    %g4, [ %g7 ] ASI_DMMU_TAG_REG   ! {tag-access, data-in}
    stxa    %g5, [ %g6 ] ASI_DTLB_DATA_IN
    retry 

/* Code specific for KAOS */
#if defined(KAOS_SIMULATION)    
check_for_dmmu_flush_and_sigsegv: 
    done
    /* check for flush */

    ldxa   [%g0]ASI_DMMU_TAG_TARGET, %g5
    ldxa   [%g0] 0x59, %g1 

    and     %g5, 0x3ff, %g5 
    sll     %g5, 9, %g5 
    srl     %g1, 4, %g1 
    and     %g1, 0x1ff, %g1 
    or      %g1, %g5, %g4 

    !ta       0x2
    rdpr     %tpc, %g2

    ta       0x2e
    cmp      %o1, 0
    setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_0 THR_0_PARTID,), %g3, %g1
    be,a     1f
    nop 
    cmp      %o1, 1
    setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_1, THR_1_PARTID), %g3, %g1
    be,a     1f
    nop 
    cmp      %o1, 2
    setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_2, THR_2_PARTID), %g3, %g1
    be,a     1f
    nop 
    cmp      %o1, 3
    setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_3, THR_3_PARTID), %g3, %g1
    be,a     1f
    nop
    cmp      %o1, 4
    setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_4, THR_4_PARTID), %g3, %g1
    be,a     1f
    nop 
    cmp      %o1, 5
    setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_5, THR_5_PARTID), %g3, %g1
    be,a     1f
    nop 
    cmp      %o1, 6
    setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_6, THR_6_PARTID), %g3, %g1
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
    setx    data_segv_check, %g1, %o5

    ta 0x2a

    nop

#endif      
