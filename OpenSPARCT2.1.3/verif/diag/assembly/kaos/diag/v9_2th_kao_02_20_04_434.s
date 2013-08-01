/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: v9_2th_kao_02_20_04_434.s
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
#define ALIAS ECACHE 

#define KAOS_SIMULATION
#define SKIP_TRAPCHECK	
#if !defined(NIAGARA2)

!
! If we are verifying, then two pass mode disabled
!
#if defined(T0_KAOS_VERIFY)
#if defined(T0_KAOS_TWOPASS)
#undef T0_KAOS_TWOPASS
#endif
#endif

!
! Get random values and do some basic selections
! Reserve T0_KAOS_RANVAL_00 for the ksim script
!
/*#include "ktbl.0.h"*/

#if defined(T0_KAOS_RANVAL_01)

#if defined(T0_KAOS_GEMINI) 
#define ASI_DCU_CONTROL_REG ASI_LSU_CONTROL_REG
#define DCU_DC_INIT LSU_DC_INIT
#define DCU_IC_INIT LSU_IC_INIT
#endif

#if (T0_KAOS_RANVAL_01 & (1<<0))
#define T0_KREADONLY
#endif

#if (T0_KAOS_RANVAL_01 & (1<<7))
#define T0_KAOS_FPNS
#endif

#if (T0_KAOS_RANVAL_01 & (1<<9))
!#define T0_KAOS_TICK
#endif

#if (T0_KAOS_RANVAL_01 & (1<<10))
#define DISP_MS_INIT		1
#endif

#if (T0_KAOS_RANVAL_01 & (1<<11))
#define PSTATE_MM_INIT 	PSTATE_MM_TSO
#endif

#endif

#if defined(T0_KAOS_RANVAL_01_T1)
#if (T0_KAOS_RANVAL_01_T1 & (1<<0))
#define KREADONLY_T1
#endif

#if (T0_KAOS_RANVAL_01_T1 & (1<<7))
#define T0_KAOS_FPNS_T1
#endif

#if (T0_KAOS_RANVAL_01_T1 & (1<<9))
!#define T0_KAOS_TICK
#endif

#if (T0_KAOS_RANVAL_01_T1 & (1<<10))
#define DISP_MS_INIT_T1		1
#endif

#if (T0_KAOS_RANVAL_01_T1 & (1<<11))
#define PSTATE_MM_INIT_T1 	PSTATE_MM_TSO
#endif

#endif

!
!  Testing V8 code, so mask to 32 bit addresses
!
#define PSTATE_AM_INIT		1

!
! Define primary context number
!
#define USER_CONTEXT		0x0fff

!
! Define local trap numbers
!
#define TRAP_INIT_TICK_COMPARE	0x23
#define	TRAP_SETDATA		0x24
#define TRAP_SIGSEGV_UPDATE	0x27

!
! Define local trap handlers
!
/*
 * Spill trap - spill one window only
 */
#define SPILL_TRAP0	mov	ASI_PRIMARY, %asi ; \
			stda	%l0, [%sp+0x00]%asi ; \
			stda	%l2, [%sp+0x08]%asi ; \
			stda	%l4, [%sp+0x10]%asi ; \
			stda	%l6, [%sp+0x18]%asi ; \
			stda	%i0, [%sp+0x20]%asi ; \
			stda	%i2, [%sp+0x28]%asi ; \
			stda	%i4, [%sp+0x30]%asi
#define SPILL_TRAP1	stda	%i6, [%sp+0x38]%asi ; \
			saved ; \
			retry ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP

/*
 * Fill trap - Fill one window only
 */
#define FILL_TRAP0	mov	ASI_PRIMARY, %asi ; \
			ldda	[%sp+0x00]%asi, %l0 ; \
			ldda	[%sp+0x08]%asi, %l2 ; \
			ldda	[%sp+0x10]%asi, %l4 ; \
			ldda	[%sp+0x18]%asi, %l6 ; \
			ldda	[%sp+0x20]%asi, %i0 ; \
			ldda	[%sp+0x28]%asi, %i2 ; \
			ldda	[%sp+0x30]%asi, %i4
#define FILL_TRAP1	restored ; \
			retry ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP

/*
 * Clean window trap - Increment the cleanwin register
 */
#define CLEAN_TRAP	tge	TRAP_IE_TOGGLE ; \
			rdpr	%cleanwin, %g6 ; \
			inc	%g6 ; \
			wrpr	%g6, %cleanwin ; \
			retry ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP

/*
 * Set window control regs to random values
 */
#define SET_WINDOW_TRAP	tle	TRAP_IE_TOGGLE ; \
			wrpr	%l1, %o1, %cansave ; \
			wrpr	%l2, %o2, %canrestore ; \
			wrpr	%l3, %o3, %cleanwin ; \
			wrpr	%l4, %o4, %otherwin ; \
			wrpr	%l5, %o5, %wstate ; \
			done ; \
			ta	BAD_TRAP

/*
 * These traps use the alternate globals - %g7 points to data area
 */
#define UNIMP_TRAP 1:	mov	ASI_PRIMARY, %asi ; \
			lda	[%g7+KDATA_TRAP_UNIMP_OFF]%asi, %g6 ; \
			inc	%g6 ; \
			sta	%g6, [%g7+KDATA_TRAP_UNIMP_OFF]%asi ; \
			done ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP

#define ILL_TRAP	te	TRAP_IE_TOGGLE ; \
			rdpr	%tpc, %g6 ; \
			lda	[%g6]ASI_PRIMARY, %g5 ; \
			sethi	%hi(0x1fffff), %g6 ; \
			or	%g6, %lo(0x1fffff), %g6 ; \
			cmp	%g5, %g6 ; \
			be	1b ; \
			tne	BAD_TRAP

#define SIGBUS_TRAP	tne	TRAP_IE_TOGGLE ; \
			mov	ASI_PRIMARY, %asi ; \
			lda	[%g7+KDATA_ETRAP_SIGBUS_OFF]%asi, %g6 ; \
			inc	%g6 ; \
			sta	%g6, [%g7+KDATA_ETRAP_SIGBUS_OFF]%asi ; \
			done ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP

#define TAGV_TRAP	tpos	TRAP_IE_TOGGLE ; \
			mov	ASI_PRIMARY, %asi ; \
			lda	[%g7+KDATA_TRAP_OV_OFF]%asi, %g6 ; \
			inc	%g6 ; \
			sta	%g6, [%g7+KDATA_TRAP_OV_OFF]%asi ; \
			done ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP

#define DIV0_TRAP	tneg	TRAP_IE_TOGGLE ; \
			mov	ASI_PRIMARY, %asi ; \
			lda	[%g7+KDATA_TRAP_DIV0_OFF]%asi, %g6 ; \
			inc	%g6 ; \
			sta	%g6, [%g7+KDATA_TRAP_DIV0_OFF]%asi ; \
			done ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP

#define FP_OTHER_TRAP \
			st	%fsr, [%g0] ; \
			ld	[%g0], %g1 ; \
			srl	%g1, 14, %g2 ; \
			andcc	%g2, 7, %g3 ; \
			te	BAD_TRAP ; \
			done ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP

#define FP_IEEE_TRAP \
			st	%fsr, [%g0] ; \
			ld	[%g0], %g1 ; \
			srl	%g1, 14, %g2 ; \
			andcc	%g2, 7, %g3 ; \
			cmp	%g3, 1 ; \
			tne	BAD_TRAP ; \
			done ; \
			ta	BAD_TRAP

/*
#define FP_DISABLED_TRAP \
			wr	%g0, 0x4, %fprs ; \
			retry ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP
*/
#define FP_DISABLED_TRAP ba FP_DISABLED_HANDLER_default; \
                         nop;  \
                         nop;  \
                         nop;  \
                         ta      BAD_TRAP ; \
                         ta      BAD_TRAP ; \
                         ta      BAD_TRAP ; \
                         ta      BAD_TRAP

#define SIGSEGV_UPDATE_TRAP \
			tcc	TRAP_IE_TOGGLE ; \
			mov	ASI_PRIMARY, %asi ; \
			lda	[%g7+KDATA_ETRAP_SIGSEGV_OFF]%asi, %g6 ; \
			inc	%g6 ; \
			sta	%g6, [%g7+KDATA_ETRAP_SIGSEGV_OFF]%asi ; \
			done ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP

/*
 * This is taken on a ta 0x10
 */
#define TICC__TRAP	tl	TRAP_IE_TOGGLE ; \
			mov	ASI_PRIMARY, %asi ; \
			lda	[%g7+KDATA_TRAP_TICC_OFF]%asi, %g6 ; \
			inc	%g6 ; \
			sta	%g6, [%g7+KDATA_TRAP_TICC_OFF]%asi ; \
			done ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP

/*
 * These traps use the MMU globals - %g6 points to data area
 */
#define SIGSEGV_TRAP0 \
		/* get and clear DSFSR */ \
			mov	ASI_DMMU, %asi ; \
			ldxa	[0x18]%asi, %g5 ; \
			stxa	%g0, [0x18]%asi ; \
		/* check for normal access to NFO page */ \
			srl	%g5, 7, %g5 ; \
			and	%g5, 0x7f, %g5 ; \
			cmp	%g5, 0x10 ; \
			be,pt	%xcc, 1f ; \
		/* Check for flush */ \
			rdpr	%tpc, %g7
#define SIGSEGV_TRAP1 \
			membar  #Sync ; \
			lda	[%g7]ASI_PRIMARY, %g2 ; \
			sethi	%hi(0xc1f80000), %g3 ; \
			sethi	%hi(0x81d80000), %g4 ; \
			and	%g2, %g3, %g2 ; \
			cmp	%g2, %g4 ; \
		/* not a flush */ \
1:			tne	TRAP_SIGSEGV_UPDATE ; \
			done 

#define ISIGSEGV_TRAP0 \
		/* get and clear ISFSR */ \
			mov	ASI_IMMU, %asi ; \
			ldxa	[0x18]%asi, %g5 ; \
			stxa	%g0, [0x18]%asi ; \
		/* check for privilege violation */ \
			srl	%g5, 7, %g5 ; \
			and	%g5, 0x7f, %g5 ; \
			cmp	%g5, 0x01 ; \
			te	TRAP_SIGSEGV_UPDATE ; \
		/* skip offending instruction and its delay slot */ \
			add	%o7, 8, %g1
#define ISIGSEGV_TRAP1 \
			wrpr	%g1, %tnpc ; \
			done ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP

/*
 * Software interrupt handlers
 */
#define INT1_TRAP       mov     ASR_SOFTINT_REG, %g1 ; \
			andcc   %g1, (1<<1), %g1 ; \
			te      BAD_TRAP ; \
			mov     %g1, ASR_CLEAR_SOFTINT ; \
			retry ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP

#define INT2_TRAP       mov     ASR_SOFTINT_REG, %g1 ; \
			andcc   %g1, (1<<2), %g1 ; \
			te      BAD_TRAP ; \
			mov     %g1, ASR_CLEAR_SOFTINT ; \
			retry ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP

#define INT3_TRAP       mov     ASR_SOFTINT_REG, %g1 ; \
			andcc   %g1, (1<<3), %g1 ; \
			te      BAD_TRAP ; \
			mov     %g1, ASR_CLEAR_SOFTINT ; \
			retry ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP  

#define INT4_TRAP       mov     ASR_SOFTINT_REG, %g1 ; \
			andcc   %g1, (1<<4), %g1 ; \
			te      BAD_TRAP ; \
			mov     %g1, ASR_CLEAR_SOFTINT ; \
			retry ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP  

#define INT5_TRAP       mov     ASR_SOFTINT_REG, %g1 ; \
			andcc   %g1, (1<<5), %g1 ; \
			te      BAD_TRAP ; \
			mov     %g1, ASR_CLEAR_SOFTINT ; \
			retry ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP  

#define INT6_TRAP       mov     ASR_SOFTINT_REG, %g1 ; \
			andcc   %g1, (1<<6), %g1 ; \
			te      BAD_TRAP ; \
			mov     %g1, ASR_CLEAR_SOFTINT ; \
			retry ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP  

#define INT7_TRAP       mov     ASR_SOFTINT_REG, %g1 ; \
			andcc   %g1, (1<<7), %g1 ; \
			te      BAD_TRAP ; \
			mov     %g1, ASR_CLEAR_SOFTINT ; \
			retry ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP  

#define INT8_TRAP       mov     ASR_SOFTINT_REG, %g1 ; \
			andcc   %g1, (1<<8), %g1 ; \
			te      BAD_TRAP ; \
			mov     %g1, ASR_CLEAR_SOFTINT ; \
			retry ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP  

#define INT9_TRAP       mov     ASR_SOFTINT_REG, %g1 ; \
			andcc   %g1, (1<<9), %g1 ; \
			te      BAD_TRAP ; \
			mov     %g1, ASR_CLEAR_SOFTINT ; \
			retry ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP  

#define INT10_TRAP      mov     ASR_SOFTINT_REG, %g1 ; \
			andcc   %g1, (1<<10), %g1 ; \
			te      BAD_TRAP ; \
			mov     %g1, ASR_CLEAR_SOFTINT ; \
			retry ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP  

#define INT11_TRAP      mov     ASR_SOFTINT_REG, %g1 ; \
			andcc   %g1, (1<<11), %g1 ; \
			te      BAD_TRAP ; \
			mov     %g1, ASR_CLEAR_SOFTINT ; \
			retry ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP  

#define	INT12_TRAP	mov     ASR_SOFTINT_REG, %g1 ; \
			sethi	%hi(1<<12), %g2 ; \
			andcc	%g1, %g2, %g1 ; \
			te	BAD_TRAP ; \
			mov	%g1, ASR_CLEAR_SOFTINT ; \
			retry ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP

#define	INT13_TRAP	mov     ASR_SOFTINT_REG, %g1 ; \
			sethi	%hi(1<<13), %g2 ; \
			andcc	%g1, %g2, %g1 ; \
			te	BAD_TRAP ; \
			mov	%g1, ASR_CLEAR_SOFTINT ; \
			retry ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP

#if defined(T0_KAOS_TICK)
#define	INT14_TRAP	mov     ASR_SOFTINT_REG, %g1 ; \
			sethi	%hi(1<<14), %g2 ; \
			or	%g2, 1, %g2 ; \
			andcc	%g1, %g2, %g1 ; \
			te	BAD_TRAP ; \
			mov	%g1, ASR_CLEAR_SOFTINT ; \
                        wrpr    %g0, %g0, %tick ; \
			retry
#else
#define	INT14_TRAP	mov     ASR_SOFTINT_REG, %g1 ; \
			sethi	%hi(1<<14), %g2 ; \
			andcc	%g1, %g2, %g1 ; \
			te	BAD_TRAP ; \
			mov	%g1, ASR_CLEAR_SOFTINT ; \
			retry ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP
#endif

#define	INT15_TRAP	mov     ASR_SOFTINT_REG, %g1 ; \
			sethi	%hi(1<<15), %g2 ; \
			andcc	%g1, %g2, %g1 ; \
			te	BAD_TRAP ; \
			mov	%g1, ASR_CLEAR_SOFTINT ; \
			retry ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP

/*
 * Mondo interrupt handler
 *	read receive reg and verify busy set
 *	read interrupt data regs
 *	demap a random va
 *	clear receive reg
 *
 * This routine must not muck up %g5/%g6 in the alternate globals
 * because there are TL==1 handlers that enable interrupts.
 *
 * There is a check here if we are going to demap the same
 * random va we demapped last time. If so, skip the demap.
 * This was originally put in to break the cycle when we re-interrupt
 * the same instruction. The check for identical va is used
 * instead of identical pc because we allow interrupts within
 * the TL>0 handlers. There might have been a case where the
 * pc's were alternating but we still were stuck in an infinite
 * loop. Since %l7 is only modified by the ktbl code, the check
 * for identical %l7 insures forward ktbl progress.
 */
#define MONDO_TRAP \
			membar #Sync ; \
		/* demap a random va */ \
			cmp	%l7, %g7 ; \
			tne	TRAP_DEMAP_RANDOM_VA ; \
			mov	%l7, %g7 ; \
		/* service the mondo */ \
			ba	IMPL_DEP_XCPN_0_HANDLER_default ; \
			nop ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP

/*
 * Watchpoint traps
 * Disable the watchpoint enables and byte masks
 */
#define PA_WP_TRAP	ldxa	[%g0]ASI_DCU_CONTROL_REG, %g1 ; \
			sethi	%hi(0xff00c000), %g2 ; \
			sllx	%g2, 9, %g2 ; \
			andn	%g1, %g2, %g1 ; \
			stxa	%g1, [%g0]ASI_DCU_CONTROL_REG ; \
			membar	#Sync ; \
			retry ; \
			ta	BAD_TRAP

#define VA_WP_TRAP	ldxa	[%g0]ASI_DCU_CONTROL_REG, %g1 ; \
			sethi	%hi(0xff300000), %g2 ; \
			sllx	%g2, 1, %g2 ; \
			andn	%g1, %g2, %g1 ; \
			stxa	%g1, [%g0]ASI_DCU_CONTROL_REG ; \
			membar	#Sync ; \
			retry ; \
			ta	BAD_TRAP

/*
 * Demap random va handler
 *
 * I use %l7 for the random demap va. Bit 0 selects IMMU/DMMU
 *
 * The table of demaps we must avoid is:
 *	CID	TYPE	VA
 *	10	0	0	Nucleus, page 0
 *	10	1	x	Nucleus, context
 *	11	x	x	Reserved
 *
 */
#define DEMAP_RANDOM_VA_TRAP0 \
		/* cid==10, type==0, va(512k)==0 */ \
			sethi	%hi(0x7ff8f), %g2 ; \
			or	%g2, %lo(0x7ff8f), %g2 ; \
			andn	%l7, %g2, %g2 ; \
			cmp	%g2, 0x20 ; \
			be,a	1f ; \
			andn	%l7, 0x3f, %g3 ; \
		/* cid==10, type==1, va==x */ \
			and	%l7, 0x70, %g1 ; \
			cmp	%g1, 0x60
#define DEMAP_RANDOM_VA_TRAP1 \
			be,a	1f ; \
			andn	%l7, 0x3f, %g3 ; \
		/* cid==11, type==x, va==x */ \
			and	%l7, 0x30, %g2 ; \
			cmp	%g2, 0x30 ; \
			be,a	1f ; \
			andn	%l7, 0x3f, %g3 ; \
			andn	%l7, 0xf, %g3 ; \
		/* select and demap immu/dmmu */ \
1:			andcc	%l7, 1, %g0
#define DEMAP_RANDOM_VA_TRAP2 \
			sethi	%hi(0x1f80), %g2 ; \
			or	%g2, %lo(0x1f80), %g2 ; \
			andn	%g3, %g2, %g3 ; \
			rdpr	%pstate, %g1 ; \
			or	%g1, PSTATE_AM_MASK, %g1 ; \
			wrpr	%g1, %pstate ; \
			be,a	2f ; \
			stxa	%g0, [%g3]ASI_DMMU_DEMAP
#define DEMAP_RANDOM_VA_TRAP3 \
2:			bne,a	3f ; \
			stxa	%g0, [%g3]ASI_IMMU_DEMAP ; \
3:			membar	#Sync ; \
			done ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP

/*
 * Good/Bad traps
 */
#define GOOD_T_TRAP	ba	good_trap_sync ; \
			nop ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP
#define BAD_T_TRAP	ba	bad_trap_sync ; \
			nop ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP
#define GOOD_TL_TRAP \
good_trap_sync:		membar	#Sync ; \
			call  	local_good_trap_start ; \
			nop ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP
#define BAD_TL_TRAP \
bad_trap_sync:		membar	#Sync ; \
bad_trap: ; \
error_detected:		ba bad_trap ; \
			nop ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP

/*
 * Fast instruction access mmu exception handler
 * Handles:
 *	8K hit, 8k miss
 *	sigsegv check
 * If we don't have one of the above cases, then we have an error
 * This requires that kaos only use 8k pages
 */
#define IA_MMU_TRAP0 \
			ta	TRAP_IE_TOGGLE ; \
			ldxa	[%g0]ASI_IMMU_TSB_8KB_PTR_REG, %g1 ; \
			ldxa	[%g0]ASI_IMMU_TAG_TARGET_REG, %g5 ; \
			ldda	[%g1]ASI_NUCLEUS_QUAD_LDD, %g2 ; \
/* check if tsb collision */ \
			cmp	%g2, -1 ; \
			be,a,pn	%xcc, tsb_chase ; \
			rd	%pc, %g1 ; \
/* invalid if tags don't match */ \
			cmp	%g2, %g5
#define IA_MMU_TRAP1 \
			bne,pn	%xcc,1f ; \
			nop ; \
/* valid only if V==1, SIZE==00, NFO==0 */ \
			srlx	%g3, 60, %g1 ; \
			cmp	%g1, 0x8 ; \
			bne,pn	%xcc, 1f ; \
			nop ; \
/* stuff entry into ITLB */ \
			stxa	%g3,[%g0]ASI_ITLB_DATA_IN_REG ; \
			retry
#define IA_MMU_TRAP2 \
1: \
/* invalid TTE, see if a sigsegv */ \
/* get va */		rdpr	%tpc, %g1 ; \
			set	0xffffe000, %g2 ; \
/* check first page */	andcc	%g1, %g2, %g3 ; \
			be	2f ; \
			nop ; \
/* check last page */	cmp	%g2, %g3 ; \
			bne 	error_detected ; \
			nop
#define IA_MMU_TRAP3 \
2: \
/* update segv count */ \
			ta	TRAP_SIGSEGV_UPDATE ; \
			add	%o7, 8, %g1 ; \
			wrpr	%g1, %tnpc ; \
			done ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP

/*
 * Fast Data access mmu exception handler
 * Handles:
 *	8K hit, 8k miss
 *	flush check
 *	sigsegv check
 * If we don't have one of the above cases, then we have an error
 * This requires that kaos only use 8k pages
 *
 * This code gets pretty tricky because the flush test must
 * come before the sigsegv check because flushes don't trap
 * on the reference machine. Also, the load of the instruction
 * for the flush test can cause a recursive DA_MMU_TRAP.
 * Thus the 8K hit case cannot destroy the va of the original
 * trap (in %g4) or the va of the trapping instruction (in %g7).
 *
 * We also cannot crash %g7 in the 8k hit code as this register
 * is used as the va to retrieve the instruction in the SIGSEGV
 * handler. The load of the instruction can cause a trap if
 * the ktbl is not yet mapped in the dmmu.
 *
 * Also, not use %g4/%g7 in the 8k hit code because the
 * counter update in ISIGSEGV, SIGSEGV, and IA_MUU_TRAP
 * needs these registers preserved.
 */
#define DA_MMU_TRAP0 \
			ldxa	[%g0]ASI_DMMU_TSB_8KB_PTR_REG, %g1 ; \
			ldxa	[%g0]ASI_DMMU_TAG_TARGET_REG, %g5 ; \
			ldda	[%g1]ASI_NUCLEUS_QUAD_LDD, %g2 ; \
/* check if tsb collision */ \
			cmp	%g2, -1 ; \
			be,a,pn	%xcc, tsb_chase ; \
			rd	%pc, %g1 ; \
			cmp	%g2, %g5 ; \
			bne,pn	%xcc,1f
#define DA_MMU_TRAP1 \
			nop ; \
			brgez,pn %g3,1f ; \
			nop ; \
			stxa	%g3,[%g0]ASI_DTLB_DATA_IN_REG ; \
			retry ; \
1: \
/* calc va */		and	%g5, 0x3ff, %g5 ; \
			sll	%g5, 9, %g5 ; \
			ldxa	[%g0]ASI_DMMU_TSB_8KB_PTR_REG, %g1
#define DA_MMU_TRAP2 \
			srl	%g1, 4, %g1 ; \
			and	%g1, 0x1ff, %g1 ; \
			or	%g1, %g5, %g4 ; \
/* Check for flush */	rdpr	%tpc, %g7 ; \
			lda	[%g7]ASI_PRIMARY, %g2 ; \
			sethi	%hi(0xc1f80000), %g3 ; \
			sethi	%hi(0x81d80000), %g1 ; \
			and	%g2, %g3, %g2
#define DA_MMU_TRAP3 \
			cmp	%g2, %g1 ; \
/* not a flush */	bne,pt	%xcc, segv_check ; \
			nop ; \
			done ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP

/*
 * Get the icc value (not needed on v9, but required on v8)
 */
#define GETCC_TRAP	rdpr	%pstate, %g1 ; \
			wrpr	%g1, PSTATE_AG_MASK, %pstate ; \
			rd	%ccr, %g1 ; \
			and	%g1, 0xf, %g1 ; \
			done ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP

/*
 * Set the icc value (not needed on v9, but required on v8)
 * Note that the caller's %g2/%g3 are trashed
 */
#define SETCC_TRAP0	rdpr	%pstate, %g1 ; \
			wrpr	%g1, PSTATE_AG_MASK, %pstate ; \
			rdpr	%tstate, %g2 ; \
			mov	0xff, %g3 ; \
			sllx	%g3, 32, %g3 ; \
			andn	%g2, %g3, %g2 ; \
			sllx	%g1, 32, %g1 ; \
			or	%g2, %g1, %g2
#define SETCC_TRAP1	wrpr	%g2, %tstate ; \
			done ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP

/*
 * Trap to define the data area pointer for both
 * alternate and MMU global regsiter sets.
 * Address of the data area is in %o0.
 *
 * Note that %g7 is used for alternate set and %g6 is used
 * for MMU set to detetect improper setting of AG and MG.
 */
#define SETDATA_TRAP0	mov	%o0, %g7 ; \
			rdpr	%pstate, %g1 ; \
			or	%g1, PSTATE_MG_MASK, %g1 ; \
			wrpr	%g1, PSTATE_AG_MASK, %pstate ; \
			mov	%o0, %g6 ;\
			rdpr	%pstate, %g1 ; \
			or	%g1, PSTATE_IG_MASK, %g1 ; \
			wrpr	%g1, PSTATE_MG_MASK, %pstate
#define SETDATA_TRAP1	clr	%g7 ; \
			done ;\
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP

/*
 * Trap to init tick and tick compare registers. Idea is to
 * generate tick interrupts by loading the tick compare 
 * register with a constant and then clear the tick register.
 * When the value in the tick compare reg matches the value
 * in the tick register we will get a level 14 softint. The
 * handler for this interrupt will clear the tick register
 * before it returns. 
 */
#define INIT_TICK_COMPARE_TRAP  mov     201, %g1 ; \
                                wr      %g1, %tick_cmpr ; \
                                wrpr    %g0, %g0, %tick ; \
                                done ; \
                                ta	BAD_TRAP ; \
                                ta	BAD_TRAP ; \
                                ta	BAD_TRAP ; \
                                ta	BAD_TRAP

#define DONE_TRAP	done; ta BAD_TRAP; ta BAD_TRAP; ta BAD_TRAP; ta BAD_TRAP; ta BAD_TRAP; ta BAD_TRAP; ta BAD_TRAP;
#define TRAP		ba error_detected; nop; ta BAD_TRAP; ta BAD_TRAP; ta BAD_TRAP; ta BAD_TRAP; ta BAD_TRAP; ta BAD_TRAP;

/*
 * These traps demap various kaos mappings
 *
 * For the area demap, the %i0 area pointer is used
 * For the ktbl demap, the %tpc is used
 * For the subr demap, the _subr1 location is used
 * For the reg demap, the %g7 register pointer is used
 * For the stack demap, %fp or %sp is used based on bit 0 of %l0
 *
 */
#define DTSB_VA	0x60000

#define	DEMAP_AREA_TRAP \
		/* demap area pointed to by %i0 */ \
			srlx	%i0, 13, %g1 ; \
			sllx	%g1, 13, %g1 ; \
			stxa	%g0, [%g1]ASI_DMMU_DEMAP ; \
			membar	#Sync ; \
			done ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP

#define	DEMAP_KTBL_TEXT_TRAP \
			rdpr	%tpc, %g1 ; \
			srlx	%g1, 13, %g1 ; \
			sllx	%g1, 13, %g1 ; \
			stxa	%g0, [%g1]ASI_IMMU_DEMAP ; \
			membar	#Sync ; \
			done ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP

#define	DEMAP_KTBL_DATA_TRAP \
			rdpr	%tpc, %g1 ; \
			srlx	%g1, 13, %g1 ; \
			sllx	%g1, 13, %g1 ; \
			stxa	%g0, [%g1]ASI_DMMU_DEMAP ; \
			membar	#Sync ; \
			done ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP

#define	DEMAP_SUBR_TRAP \
			sethi	%hi(_t0_subr1), %g1 ; \
			or	%g1, %lo(_t0_subr1), %g1 ; \
			srlx	%g1, 13, %g1 ; \
			sllx	%g1, 13, %g1 ; \
			stxa	%g0, [%g1]ASI_IMMU_DEMAP ; \
			membar	#Sync ; \
			done ; \
			ta	BAD_TRAP

#define	DEMAP_REG_TRAP \
			srlx	%g7, 13, %g1 ; \
			sllx	%g1, 13, %g1 ; \
			stxa	%g0, [%g1]ASI_DMMU_DEMAP ; \
			membar	#Sync ; \
			done ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP

#define	DEMAP_STACK_TRAP0 \
			mov	%fp, %g1 ; \
			andcc	%l6, 1, %g0 ; \
			be,a	1f ; \
			mov	%sp, %g1 ; \
1:			srlx	%g1, 13, %g1 ; \
			sllx	%g1, 13, %g1 ; \
			stxa	%g0, [%g1]ASI_DMMU_DEMAP ; \
			membar	#Sync
#define	DEMAP_STACK_TRAP1 \
			done ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP

/*
 * These traps toggle the W bit in the TSB for various kaos mappings
 *
 * For the area toggle, the %i0 area pointer is used
 * For the ktbl toggle, the %tpc is used
 * For the subr toggle, the _subr1 location is used
 * For the reg toggle, the %g7 register pointer is used
 * For the stack toggle, %fp or %sp is used based on bit 0 of %l0
 *
 */
#define	RO_AREA_TRAP0 \
			srlx	%i0, 13, %g1 ; \
			and	%g1, 0x1ff, %g1 ; \
			sllx	%g1, 4, %g1 ; \
			sethi	%hi(DTSB_VA), %g2 ; \
			add	%g1, %g2, %g1 ; \
			ldx	[%g1], %g2 ; \
			cmp	%g2, -1 ; \
			be,pn	%xcc, 1f
#define	RO_AREA_TRAP1	\
			nop ; \
			ldx	[%g1+0x8], %g3 ; \
			xor	%g3, 2, %g3 ; \
			stx	%g3, [%g1+0x8] ; \
1:			done ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP

#define RO_KTBL_DATA_TRAP0 \
			rdpr	%tpc, %g1 ; \
			srlx	%g1, 13, %g1 ; \
			and	%g1, 0x1ff, %g1 ; \
			sllx	%g1, 4, %g1 ; \
			sethi	%hi(DTSB_VA), %g2 ; \
			add	%g1, %g2, %g1 ; \
			ldx	[%g1], %g2 ; \
			cmp	%g2, -1
#define RO_KTBL_DATA_TRAP1 \
			be,pn	%xcc, 1f ; \
			nop ; \
			ldx	[%g1+0x8], %g3 ; \
			xor	%g3, 2, %g3 ; \
			stx	%g3, [%g1+0x8] ; \
1:			done ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP
		
#define RO_REG_TRAP0 \
			srlx	%g7, 13, %g1 ; \
			and	%g1, 0x1ff, %g1 ; \
			sllx	%g1, 4, %g1 ; \
			sethi	%hi(DTSB_VA), %g2 ; \
			add	%g1, %g2, %g1 ; \
			ldx	[%g1], %g2 ; \
			cmp	%g2, -1 ; \
			be,pn	%xcc, 1f
#define	RO_REG_TRAP1	\
			nop ; \
			ldx	[%g1+0x8], %g3 ; \
			xor	%g3, 2, %g3 ; \
			stx	%g3, [%g1+0x8] ; \
1:			done ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP
	
#define RO_STACK_TRAP0 \
			mov	%fp, %g1 ; \
			andcc	%l5, 1, %g0 ; \
			be,a	1f ; \
			mov	%sp, %g1 ; \
1:			srlx	%g1, 13, %g1 ; \
			and	%g1, 0x1ff, %g1 ; \
			sllx	%g1, 4, %g1 ; \
			sethi	%hi(DTSB_VA), %g2
#define RO_STACK_TRAP1 \
			add	%g1, %g2, %g1 ; \
			ldx	[%g1], %g2 ; \
			ldx	[%g1+0x8], %g3 ; \
			xor	%g3, 2, %g3 ; \
			cmp	%g2, -1 ; \
			bne,a,pt %xcc, 2f ; \
			stx	%g3, [%g1+0x8] ; \
2:			done

/*
 * Toggle interrupt enable at previous TL
 */
#define	IE_TOGGLE_TRAP \
			rdpr	%tstate, %g1 ; \
			wrpr	%g1, 0x200, %tstate ; \
			done ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP

/*
 * Set PIL to random value
 */
#define	SET_PIL_TRAP \
			wrpr	%l2, %o5, %pil ; \
			done ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP

/*
 * Set memory models at previous TL
 */
#define	SET_TSO_TRAP \
			sethi	%hi(0xc000), %g1 ; \
			rdpr	%tstate, %g2 ; \
			andn	%g2, %g1, %g2 ; \
			wrpr	%g2, %tstate ; \
			done ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP

#define	SET_PSO_TRAP \
			sethi	%hi(0xc000), %g1 ; \
			sethi	%hi(0x4000), %g3 ; \
			rdpr	%tstate, %g2 ; \
			andn	%g2, %g1, %g2 ; \
			wrpr	%g2, %g3, %tstate ; \
			done ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP

#define	SET_RMO_TRAP \
			sethi	%hi(0xc000), %g1 ; \
			sethi	%hi(0x8000), %g3 ; \
			rdpr	%tstate, %g2 ; \
			andn	%g2, %g1, %g2 ; \
			wrpr	%g2, %g3, %tstate ; \
			done ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP

/*
 * Remap from readonly to read/write (in TLB only)
 * Do not use %g4/%g7 in this trap because the
 * counter update in ISIGSEGV, SIGSEGV, and IA_MUU_TRAP
 * needs these registers preserved.
 *
 * update -- rameshg
 *
 * The Remap is done directly in the TSB rather that
 * in the TLB due to differences in CIAM & RTL in
 * way replacement if we did a de-map & re-write it
 * back into TLB entry 
 * 
 * endupdate -- rameshg
 */
#define	REMAP_W_TRAP0 \
			mov	ASI_DMMU, %asi ; \
/* get DSFSR */		ldxa	[0x18]%asi, %g5 ; \
/* clear DSFSR */	stxa	%g0, [0x18]%asi ; \
			membar	#Sync ; \
/* get DSFAR */		ldxa	[0x20]%asi, %g2 ; \
/* calc TSB va */	srlx	%g2, 13, %g1 ; \
			and	%g1, 0x1ff, %g1 ; \
			sllx	%g1, 4, %g1 
#define	REMAP_W_TRAP1	\
			sethi	%hi(DTSB_VA), %g3 ; \
			add	%g1, %g3, %g3 ; \
/* get data */		ldx	[%g3+8], %g1 ; \
/* set W bit */		or	%g1, 2, %g1 ; \
			stx	%g1, [%g3+8];\
			membar	#Sync;\
/* demap */		srlx	%g2, 13, %g1 ; \
			sllx	%g1, 13, %g1 
#define	REMAP_W_TRAP2	\
			stxa	%g0, [%g1]ASI_DMMU_DEMAP ;\
			membar	#Sync ;\
			retry ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP

/*
 * Set watchpoints
 * Use %l0 to set enables and byte masks
 * Use PA(%i0+%i5) as PA
 * Use %i0+%i4 as VA
 */
#define SET_PA_WP_TRAP0 \
		/* get TSB entry for %i0 */ \
			srlx	%i0, 13, %g1 ; \
			and	%g1, 0x1ff, %g1 ; \
			sllx	%g1, 4, %g1 ; \
			add	%g1, 8, %g1 ; \
			sethi	%hi(DTSB_VA), %g2 ; \
			ldx	[%g2+%g1], %g3 ; \
		/* convert TTE to PA[40:13] */ \
			srlx	%g3, 13, %g3 ; \
			sllx	%g3, 36, %g3
#define SET_PA_WP_TRAP1 \
			srax	%g3, 23, %g3 ; \
		/* get ls 13 bits of VA */ \
			add	%i0, %i5, %g4 ; \
			sllx	%g4, 51, %g4 ; \
			srlx	%g4, 51, %g4 ; \
		/* combine ls bits of VA with ms bits of PA */ \
			add	%g3, %g4, %g3 ; \
		/* write PA into DMMU */ \
			set	0x40, %g1 ; \
			stxa	%g3, [%g1]ASI_DMMU_PA_WATCHPOINT_REG ; \
			membar	#Sync 
#define SET_PA_WP_TRAP2 \
		/* enable the PA watchpoint */ \
			ldxa	[%g0]ASI_DCU_CONTROL_REG, %g1 ; \
			sethi	%hi(0xff00c000), %g2 ; \
			and	%l0, %g2, %g3 ; \
			sllx	%g3, 9, %g3 ; \
			or	%g1, %g3, %g1 ; \
			stxa	%g1, [%g0]ASI_DCU_CONTROL_REG ; \
			membar	#Sync ; \
			done

#define SET_VA_WP_TRAP0 \
		/* write VA into DMMU */ \
			add	%i0, %i4, %g3 ; \
			set	0x38, %g1 ; \
			stxa	%g3, [%g1]ASI_DMMU_VA_WATCHPOINT_REG ; \
			membar	#Sync ; \
		/* enable the VA watchpoint */ \
			ldxa	[%g0]ASI_DCU_CONTROL_REG, %g1 ; \
			sethi	%hi(0xff300000), %g2 ; \
			and	%l1, %g2, %g3 ; \
			sllx	%g3, 1, %g3 
#define SET_VA_WP_TRAP1 \
			or	%g1, %g3, %g1 ; \
			stxa	%g1, [%g0]ASI_DCU_CONTROL_REG ; \
			membar	#Sync ; \
			done ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP ; \
			ta	BAD_TRAP

/*
 * Set the softint value
 */
#define SET_SOFTINT_TRAP \
			andcc	%l7, 0xf, %g1 ; \
			be,a	1f ; \
			inc	%g1 ; \
1:			mov	1, %g2 ; \
			sllx	%g2, %g1, %g3 ; \
			mov	%g3, ASR_SET_SOFTINT ; \
			done ; \
			ta	BAD_TRAP

/*
 * Ecc and parity error trap handlers.
 */
#define CORRECTED_ECC_TRAP \
                        ldxa    [%g0]ASI_ASYNC_FAULT_STATUS, %g3; \
                        stxa    %g3, [%g0]ASI_ASYNC_FAULT_STATUS; \
                        membar  #Sync; \
                        retry ; \
                        ta BAD_TRAP ; \
                        ta BAD_TRAP ; \
                        ta BAD_TRAP ; \
                        ta BAD_TRAP

#define FAST_ECC_TRAP \
                        retry ; \
                        ta BAD_TRAP ; \
                        ta BAD_TRAP ; \
                        ta BAD_TRAP ; \
                        ta BAD_TRAP ; \
                        ta BAD_TRAP ; \
                        ta BAD_TRAP ; \
                        ta BAD_TRAP
define(D_CLR,`!$clear_the_dcache_index_with_bad_parity(trig_simulation_start(), .) ;
DCACHE_PARITY_ERROR_HANDLER_default: ');

#define D_PARITY_TRAP \
                        D_CLR \
                        membar 0x40 ; \
                        ldxa [%g0] 0x45, %g5 ; \
                        xor %g5, 2, %g5 ; \
                        xor %g5, DCU_IC_INIT, %g5 ; \
                        stxa %g5, [%g0] 0x45 ; \
                        retry ; \
                        ta BAD_TRAP ; \
                        ta BAD_TRAP

#define TL_D_PARITY \
                        ba      DCACHE_PARITY_ERROR_HANDLER_default ; \
                        nop ; \
                        ta BAD_TRAP; \
                        ta BAD_TRAP; \
                        ta BAD_TRAP; \
                        ta BAD_TRAP; \
                        ta BAD_TRAP; \
                        ta BAD_TRAP

define(I_CLR,`!$clear_the_icache_index_with_bad_parity(trig_simulation_start(), .) ;
ICACHE_PARITY_ERROR_HANDLER_default: ');

#if 1
#define I_PARITY_TRAP \
                        I_CLR \
                        membar  0x40 ;  \
                        stx     %g5, [%g0+8]  ; \
                        ldxa    [%g0] 0x45, %g5; \
                        xor     %g5, 1, %g5 ; \
                        stxa    %g5, [%g0] 0x45 ; \
                        membar  #Sync; \
                        ldx     [%g0+8], %g5; \
                        retry ;
#else
#define I_PARITY_TRAP \
                        I_CLR \
                        membar 0x40 ;  \
                        ldxa    [%g0] 0x45, %g5 ; \
                        xor     %g5, 1, %g5 ; \
                        xor     %g5, (DCU_DC_INIT<<1), %g5 ; \
                        stxa    %g5, [%g0] 0x45 ; \
                        retry ; \
                        ta BAD_TRAP ; \
                        ta BAD_TRAP
#endif

#define TL_I_PARITY \
                        ba      ICACHE_PARITY_ERROR_HANDLER_default ; \
                        nop ; \
                        ta BAD_TRAP; \
                        ta BAD_TRAP; \
                        ta BAD_TRAP; \
                        ta BAD_TRAP; \
                        ta BAD_TRAP; \
                        ta BAD_TRAP


!
! Define where trap handlers are installed
!
#define TRAP_008	ISIGSEGV_TRAP0		/* instruction_access_exception */
#define TRAP_009	ISIGSEGV_TRAP1
#define TRAP_00f	UNIMP_TRAP		/* illegal_instruction helper */
#define TRAP_010	ILL_TRAP		/* illegal_instruction */
#define TRAP_020	FP_DISABLED_TRAP	/* fp_disabled */
#define TRAP_021	FP_IEEE_TRAP		/* fp_ieee_754 */
#define TRAP_022	FP_OTHER_TRAP		/* fp_exception_other */
#define TRAP_023	TAGV_TRAP		/* tag_overflow */
#define TRAP_024	CLEAN_TRAP		/* clean_window */
#define TRAP_028	DIV0_TRAP		/* division_by_zero */
#define TRAP_030	SIGSEGV_TRAP0		/* data_access_exception */
#define TRAP_031	SIGSEGV_TRAP1
#define TRAP_034	SIGBUS_TRAP		/* mem_address_not_aligned */
#define TRAP_035	SIGBUS_TRAP		/* LDDF_mem_address_not_aligned */
#define TRAP_036	SIGBUS_TRAP		/* STDF_mem_address_not_aligned */
#define TRAP_038	SIGBUS_TRAP		/* LDQF_mem_address_not_aligned */
#define TRAP_039	SIGBUS_TRAP		/* STQF_mem_address_not_aligned */
#define	TRAP_041	INT1_TRAP		/* interrupt_level_1 */
#define	TRAP_042	INT2_TRAP		/* interrupt_level_2 */
#define	TRAP_043	INT3_TRAP		/* interrupt_level_3 */
#define	TRAP_044	INT4_TRAP		/* interrupt_level_4 */
#define	TRAP_045	INT5_TRAP		/* interrupt_level_5 */
#define	TRAP_046	INT6_TRAP		/* interrupt_level_6 */
#define	TRAP_047	INT7_TRAP		/* interrupt_level_7 */
#define	TRAP_048	INT8_TRAP		/* interrupt_level_8 */
#define	TRAP_049	INT9_TRAP		/* interrupt_level_9 */
#define	TRAP_04a	INT10_TRAP		/* interrupt_level_10 */
#define	TRAP_04b	INT11_TRAP		/* interrupt_level_11 */
#define	TRAP_04c	INT12_TRAP		/* interrupt_level_12 */
#define	TRAP_04d	INT13_TRAP		/* interrupt_level_13 */
#define	TRAP_04e	INT14_TRAP		/* interrupt_level_14 */
#define	TRAP_04f	INT15_TRAP		/* interrupt_level_15 */
#define TRAP_060	MONDO_TRAP		/* interrupt_vector */
#define TRAP_061 	PA_WP_TRAP		/* PA_watchpoint_trap */
#define TRAP_062 	VA_WP_TRAP		/* VA_watchpoint_trap */
#define TRAP_063	CORRECTED_ECC_TRAP	/* Corrected_ecc_trap */
#define TRAP_064	IA_MMU_TRAP0		/* fast_instruction_access_MMU_miss */
#define TRAP_065	IA_MMU_TRAP1
#define TRAP_066	IA_MMU_TRAP2
#define TRAP_067	IA_MMU_TRAP3
#define TRAP_068	DA_MMU_TRAP0		/* fast_data_access_MMU_miss */
#define TRAP_069	DA_MMU_TRAP1
#define TRAP_06a	DA_MMU_TRAP2
#define TRAP_06b	DA_MMU_TRAP3
#define	TRAP_06c	REMAP_W_TRAP0		/* fast_data_access_protection */
#define	TRAP_06d	REMAP_W_TRAP1
#define	TRAP_06e	REMAP_W_TRAP2
#define TRAP_070	FAST_ECC_TRAP		/* Fast_ecc_error_trap */
#define TRAP_071	D_PARITY_TRAP		/* Dcache_parity_error_trap */
#define TRAP_072	I_PARITY_TRAP		/* Icache_parity_error_trap */


#define	TRAP_080	SPILL_TRAP0		/* spill_0_normal */
#define	TRAP_081	SPILL_TRAP1
#define	TRAP_084	SPILL_TRAP0		/* spill_1_normal */
#define	TRAP_085	SPILL_TRAP1
#define	TRAP_088	SPILL_TRAP0		/* spill_2_normal */
#define	TRAP_089	SPILL_TRAP1
#define	TRAP_08c	SPILL_TRAP0		/* spill_3_normal */
#define	TRAP_08d	SPILL_TRAP1
#define	TRAP_090	SPILL_TRAP0		/* spill_4_normal */
#define	TRAP_091	SPILL_TRAP1
#define	TRAP_094	SPILL_TRAP0		/* spill_5_normal */
#define	TRAP_095	SPILL_TRAP1
#define	TRAP_098	SPILL_TRAP0		/* spill_6_normal */
#define	TRAP_099	SPILL_TRAP1
#define	TRAP_09c	SPILL_TRAP0		/* spill_7_normal */
#define	TRAP_09d	SPILL_TRAP1
#define	TRAP_0a0	SPILL_TRAP0		/* spill_0_other */
#define	TRAP_0a1	SPILL_TRAP1
#define	TRAP_0a4	SPILL_TRAP0		/* spill_1_other */
#define	TRAP_0a5	SPILL_TRAP1
#define	TRAP_0a8	SPILL_TRAP0		/* spill_2_other */
#define	TRAP_0a9	SPILL_TRAP1
#define	TRAP_0ac	SPILL_TRAP0		/* spill_3_other */
#define	TRAP_0ad	SPILL_TRAP1
#define	TRAP_0b0	SPILL_TRAP0		/* spill_4_other */
#define	TRAP_0b1	SPILL_TRAP1
#define	TRAP_0b4	SPILL_TRAP0		/* spill_5_other */
#define	TRAP_0b5	SPILL_TRAP1
#define	TRAP_0b8	SPILL_TRAP0		/* spill_6_other */
#define	TRAP_0b9	SPILL_TRAP1
#define	TRAP_0bc	SPILL_TRAP0		/* spill_7_other */
#define	TRAP_0bd	SPILL_TRAP1
#define	TRAP_0c0	FILL_TRAP0		/* fill_0_normal */
#define	TRAP_0c1	FILL_TRAP1
#define	TRAP_0c4	FILL_TRAP0		/* fill_1_normal */
#define	TRAP_0c5	FILL_TRAP1
#define	TRAP_0c8	FILL_TRAP0		/* fill_2_normal */
#define	TRAP_0c9	FILL_TRAP1
#define	TRAP_0cc	FILL_TRAP0		/* fill_3_normal */
#define	TRAP_0cd	FILL_TRAP1
#define	TRAP_0d0	FILL_TRAP0		/* fill_4_normal */
#define	TRAP_0d1	FILL_TRAP1
#define	TRAP_0d4	FILL_TRAP0		/* fill_5_normal */
#define	TRAP_0d5	FILL_TRAP1
#define	TRAP_0d8	FILL_TRAP0		/* fill_6_normal */
#define	TRAP_0d9	FILL_TRAP1
#define	TRAP_0dc	FILL_TRAP0		/* fill_7_normal */
#define	TRAP_0dd	FILL_TRAP1
#define	TRAP_0e0	FILL_TRAP0		/* fill_0_other */
#define	TRAP_0e1	FILL_TRAP1
#define	TRAP_0e4	FILL_TRAP0		/* fill_1_other */
#define	TRAP_0e5	FILL_TRAP1
#define	TRAP_0e8	FILL_TRAP0		/* fill_2_other */
#define	TRAP_0e9	FILL_TRAP1
#define	TRAP_0ec	FILL_TRAP0		/* fill_3_other */
#define	TRAP_0ed	FILL_TRAP1
#define	TRAP_0f0	FILL_TRAP0		/* fill_4_other */
#define	TRAP_0f1	FILL_TRAP1
#define	TRAP_0f4	FILL_TRAP0		/* fill_5_other */
#define	TRAP_0f5	FILL_TRAP1
#define	TRAP_0f8	FILL_TRAP0		/* fill_6_other */
#define	TRAP_0f9	FILL_TRAP1
#define	TRAP_0fc	FILL_TRAP0		/* fill_7_other */
#define	TRAP_0fd	FILL_TRAP1

#define	TRAP_100	GOOD_T_TRAP		/* Good trap */
#define	TRAP_101	BAD_T_TRAP		/* Bad trap */
#define TRAP_110	TICC__TRAP		/* ticc 0x10 - kaos generated ticc */
#define TRAP_111	DONE_TRAP		/* ticc 0x11 - kaos trigger trap */
#define TRAP_120	GETCC_TRAP		/* ticc 0x20 - get icc */
#define TRAP_121	SETCC_TRAP0		/* ticc 0x21 - set icc */
#define TRAP_122	SETCC_TRAP1
#define TRAP_123	INIT_TICK_COMPARE_TRAP	/* ticc 0x23 - init tick compare register */
#define TRAP_124	SETDATA_TRAP0		/* ticc 0x24 - set trap data pointer */
#define TRAP_125	SETDATA_TRAP1
#define TRAP_127	SIGSEGV_UPDATE_TRAP 	/* ticc 0x27 - sigsegv counter update */

/* the following must match the defines in kaos.h */
#define TRAP_128	DEMAP_RANDOM_VA_TRAP0	/* ticc 0x28 */
#define TRAP_129	DEMAP_RANDOM_VA_TRAP1
#define TRAP_12a	DEMAP_RANDOM_VA_TRAP2
#define TRAP_12b	DEMAP_RANDOM_VA_TRAP3
#define	TRAP_12c	DEMAP_AREA_TRAP		/* ticc 0x2c */
#define	TRAP_130	DEMAP_KTBL_TEXT_TRAP	/* ticc 0x30 */
#define TRAP_134	DEMAP_KTBL_DATA_TRAP	/* ticc 0x34 */
#define	TRAP_138	DEMAP_SUBR_TRAP		/* ticc 0x38 */
#define	TRAP_13c	DEMAP_REG_TRAP		/* ticc 0x3c */
#define	TRAP_140	DEMAP_STACK_TRAP0	/* ticc 0x40 */
#define	TRAP_141	DEMAP_STACK_TRAP1
#define	TRAP_144	RO_AREA_TRAP0		/* ticc 0x44 */
#define	TRAP_145	RO_AREA_TRAP1
#define	TRAP_175	RO_KTBL_DATA_TRAP0	/* ticc 0x75 */
#define	TRAP_176	RO_KTBL_DATA_TRAP1
#define	TRAP_14c	RO_REG_TRAP0		/* ticc 0x4c */
#define	TRAP_14d	RO_REG_TRAP1
#define	TRAP_150	RO_STACK_TRAP0		/* ticc 0x50 */
#define	TRAP_151	RO_STACK_TRAP1
#define	TRAP_154	SET_WINDOW_TRAP		/* ticc 0x54 */
#define	TRAP_158	SET_VA_WP_TRAP0		/* ticc 0x58 */
#define	TRAP_159	SET_VA_WP_TRAP1
#define	TRAP_15c	SET_PA_WP_TRAP0		/* ticc 0x5c */
#define	TRAP_15d	SET_PA_WP_TRAP1
#define	TRAP_15e	SET_PA_WP_TRAP2
#define	TRAP_160	SET_SOFTINT_TRAP	/* ticc 0x60 */
#define	TRAP_164	IE_TOGGLE_TRAP		/* ticc 0x64 */
#define	TRAP_168	SET_PIL_TRAP		/* ticc 0x68 */
#define	TRAP_16c	SET_TSO_TRAP		/* ticc 0x6c */
#define	TRAP_170	SET_PSO_TRAP		/* ticc 0x70 */
#define	TRAP_174	SET_RMO_TRAP		/* ticc 0x74 */

#define	TRAP_TL_100	GOOD_TL_TRAP		/* Good trap */
#define	TRAP_TL_101	BAD_TL_TRAP		/* Bad trap */
#define TRAP_TL_071	TL_D_PARITY
#define TRAP_TL_072	TL_I_PARITY

!
! Page 0 is priv'ed area at bottom of memory
!
! Define page 0 to be privileged, not global so segv code works
!
#define PAGE0_TTE		0xc000000000000076

!
! We map everything ourselves to control the i$ preload
!
#define NO_DEFAULT_MAPS

!
! The following avoids the definition of the default window stack data
!
#define NO_DEFAULT_WINDOW_STACK

!
! Define our entry point
!
#define ENTRY_POINT kaos_boot

!
! Include the local kaos definitions
!

#if !defined(_KAOS_H)
#define _KAOS_H

#define I2OFF(a)	((a)*4)	/* convert integer index to address offset */

/*
 * _kaos() register load/store area layout
 */
#define KDATA_FREGS	(64)
#define KDATA_LREGS	(8)
#define KDATA_IREGS	(8)
#define KDATA_GREGS	(8)
#define KDATA_OREGS	(8)

#define KDATA_FREG_IDX		(0)
#define KDATA_GREG_IDX		(KDATA_FREG_IDX+KDATA_FREGS)
#define KDATA_OREG_IDX		(KDATA_GREG_IDX+KDATA_GREGS)
#define KDATA_LREG_IDX		(KDATA_OREG_IDX+KDATA_OREGS)
#define KDATA_IREG_IDX		(KDATA_LREG_IDX+KDATA_LREGS)
#define KDATA_Y_IDX		(KDATA_IREG_IDX+KDATA_IREGS)
#define KDATA_ICC_IDX		(KDATA_Y_IDX+1)
#define KDATA_FSR_IDX		(KDATA_ICC_IDX+1)
#define KDATA_GSRMASK_IDX	(KDATA_FSR_IDX+1)
#define KDATA_GSR_IDX		(KDATA_GSRMASK_IDX+1)
#define KDATA_ASI_IDX		(KDATA_GSR_IDX+1)
#define KDATA_TRAP_BEG_IDX	(KDATA_ASI_IDX+1)
#define KDATA_TRAP_OV_IDX	(KDATA_TRAP_BEG_IDX)
#define KDATA_TRAP_DIV0_IDX	(KDATA_TRAP_OV_IDX+1)
#define KDATA_TRAP_DIV52_IDX	(KDATA_TRAP_DIV0_IDX+1)
#define KDATA_TRAP_NX_IDX	(KDATA_TRAP_DIV52_IDX+1)
#define KDATA_TRAP_DZ_IDX	(KDATA_TRAP_NX_IDX+1)
#define KDATA_TRAP_UF_IDX	(KDATA_TRAP_DZ_IDX+1)
#define KDATA_TRAP_OF_IDX	(KDATA_TRAP_UF_IDX+1)
#define KDATA_TRAP_NV_IDX	(KDATA_TRAP_OF_IDX+1)
#define KDATA_TRAP_FP_OTHER_IDX	(KDATA_TRAP_NV_IDX+1)
#define KDATA_TRAP_TICC_IDX	(KDATA_TRAP_FP_OTHER_IDX+1)
#define KDATA_TRAP_SIGFPE_IDX	(KDATA_TRAP_TICC_IDX+1)
#define KDATA_TRAP_SIGSEGV_IDX	(KDATA_TRAP_SIGFPE_IDX+1)
#define KDATA_TRAP_SIGBUS_IDX	(KDATA_TRAP_SIGSEGV_IDX+1)
#define KDATA_TRAP_SIGILL_IDX	(KDATA_TRAP_SIGBUS_IDX+1)
#define KDATA_ETRAP_SIGSEGV_IDX	(KDATA_TRAP_SIGILL_IDX+1)
#define KDATA_ETRAP_SIGBUS_IDX	(KDATA_ETRAP_SIGSEGV_IDX+1)
#define KDATA_TRAP_UNIMP_IDX	(KDATA_ETRAP_SIGBUS_IDX+1)
#define KDATA_TRAP_MAX_IDX	(KDATA_TRAP_UNIMP_IDX+1)
#define KDATA_MAX_IDX		((KDATA_TRAP_MAX_IDX+1)&~1)

#define KDATA_FREG_OFF(a)	I2OFF((a)+KDATA_FREG_IDX)
#define KDATA_GREG_OFF(a)	I2OFF((a)+KDATA_GREG_IDX)
#define KDATA_OREG_OFF(a)	I2OFF((a)+KDATA_OREG_IDX)
#define KDATA_LREG_OFF(a)	I2OFF((a)+KDATA_LREG_IDX)
#define KDATA_IREG_OFF(a)	I2OFF((a)+KDATA_IREG_IDX)
#define KDATA_ICC_OFF		I2OFF(KDATA_ICC_IDX)
#define KDATA_Y_OFF		I2OFF(KDATA_Y_IDX)
#define KDATA_FSR_OFF		I2OFF(KDATA_FSR_IDX)
#define KDATA_GSRMASK_OFF	I2OFF(KDATA_GSRMASK_IDX)
#define KDATA_GSR_OFF		I2OFF(KDATA_GSR_IDX)
#define KDATA_ASI_OFF		I2OFF(KDATA_ASI_IDX)
#define KDATA_TRAP_BEG_OFF	I2OFF(KDATA_TRAP_BEG_IDX)
#define KDATA_TRAP_OV_OFF	I2OFF(KDATA_TRAP_OV_IDX)
#define KDATA_TRAP_DIV0_OFF	I2OFF(KDATA_TRAP_DIV0_IDX)
#define KDATA_TRAP_DIV52_OFF	I2OFF(KDATA_TRAP_DIV52_IDX)
#define KDATA_TRAP_NX_OFF	I2OFF(KDATA_TRAP_NX_IDX)
#define KDATA_TRAP_DZ_OFF	I2OFF(KDATA_TRAP_DZ_IDX)
#define KDATA_TRAP_UF_OFF	I2OFF(KDATA_TRAP_UF_IDX)
#define KDATA_TRAP_OF_OFF	I2OFF(KDATA_TRAP_OF_IDX)
#define KDATA_TRAP_NV_OFF	I2OFF(KDATA_TRAP_NV_IDX)
#define KDATA_TRAP_FP_OTHER_OFF	I2OFF(KDATA_TRAP_FP_OTHER_IDX)
#define KDATA_TRAP_TICC_OFF	I2OFF(KDATA_TRAP_TICC_IDX)
#define KDATA_TRAP_SIGFPE_OFF	I2OFF(KDATA_TRAP_SIGFPE_IDX)
#define KDATA_TRAP_SIGSEGV_OFF	I2OFF(KDATA_TRAP_SIGSEGV_IDX)
#define KDATA_TRAP_SIGBUS_OFF	I2OFF(KDATA_TRAP_SIGBUS_IDX)
#define KDATA_TRAP_SIGILL_OFF	I2OFF(KDATA_TRAP_SIGILL_IDX)
#define KDATA_ETRAP_SIGSEGV_OFF	I2OFF(KDATA_ETRAP_SIGSEGV_IDX)
#define KDATA_ETRAP_SIGBUS_OFF	I2OFF(KDATA_ETRAP_SIGBUS_IDX)
#define KDATA_TRAP_UNIMP_OFF	I2OFF(KDATA_TRAP_UNIMP_IDX)
#define KDATA_MAX_OFF		I2OFF(KDATA_MAX_IDX)

/*
 * _kaos() local stack frame layout
 */
#define KFRAME_FSR	(-4)			/* addr offset for fsr */
#define KFRAME_XFLAGS	(KFRAME_FSR-4)		/* addr offset for xflags */
#define KFRAME_REGPTR	(KFRAME_XFLAGS-4)	/* addr offset for reg ptr */
#define KFRAME_MTBL	(KFRAME_REGPTR-4)	/* addr offset for first */
						/* word of variable */
						/* stack region */

/*
 * _kaos xflags bits
 */
#define	XFLAG_TRIGGER	0x1		/* Activate triggers */
#define	XFLAG_SGI	0x2		/* Save/restore %gsr */
#define	XFLAG_V9	0x4		/* Save/restore %f[32-63], %asi */

/*
 * %fsr set/get bit mask
 * We only allow RD and fcc fields
 */
#define FSR_MASK	0xc0000c00

/*
 * Trap numbers
 */
#define TICC_TRAP		0x10
#define TRIGGER_START_TRAP	0x14
#define TRIGGER_STOP_TRAP	0x18
#define WATCHDOG_TRAP		0x71

#endif

/*
 * Minimum frame size
 */
#define MINFRAME	0x60

/*
 * Special ticc traps for simulation
 */
#define TRAP_DEMAP_RANDOM_VA	0x28
#define	TRAP_DEMAP_AREA		0x2c
#define	TRAP_DEMAP_KTBL_TEXT	0x30
#define TRAP_DEMAP_KTBL_DATA	0x34
#define	TRAP_DEMAP_SUBR		0x38
#define	TRAP_DEMAP_REG		0x3c
#define	TRAP_DEMAP_STACK	0x40
#define	TRAP_RO_AREA		0x44
#define	TRAP_RO_KTBL_DATA	0x75
#define	TRAP_RO_REG		0x4c
#define	TRAP_RO_STACK		0x50
#define	TRAP_SET_WINDOW		0x54
#define	TRAP_SET_VA_WP		0x58
#define	TRAP_SET_PA_WP		0x5c
#define	TRAP_SET_SOFTINT	0x60
#define	TRAP_IE_TOGGLE		0x64
#define	TRAP_SET_PIL		0x68
#define	TRAP_SET_TSO		0x6c
#define	TRAP_SET_PSO		0x70
#define	TRAP_SET_RMO		0x74

/*
 * mplock return codes
 */
#define LOCK_SUCCESS    0
#define LOCK_TIMEOUT    1

/*
 * memtest types
 */
#define MEMTEST_NONE	0
#define MEMTEST_TSO	1
#define MEMTEST_RMO	2

#define MAXHOSTS	10

/************************************************************************
   The following code is based on traps.s. I hand include
   the modules because I only need the reset handler.
 ************************************************************************/
#define NEW_TRAP_TABLE


/*
 * Trap table, cacheable reset handler
 */
Module "priv", VA_text = 0x0, VA_data = 0x10000

#include "constants.h"
#include "macros.h"

.seg "data"
reset_data_start:
.seg "text"
trap_text_start:
/*#include "trap_table.s"*/
.seg "text"
trap_text_end:
.seg "text"
reset_text_start:
	.skip 0x1a00	/* place at end of lower 8k of i$ */
/*#include "reset_cacheable.s"
#include "impl_dep_xcpn.s"
*/
/*
 * Chase pages that collide in the tsb
 * %g3 - va of tte list
 * %g5 - tag to match
 * %g1 - return address
 * return %g2/%g3 as tsb tag/data
 * Must preserve %g1/%g4/%g5/%g7
 */
tsb_chase:
1:
	ldx	[%g3], %g2		! load tag from list
	cmp	%g2, %g5		! if tag match
	be,pt	%xcc, 2f		!   then successful
	nop
	ldx	[%g3+0x10], %g3		! load pointer to next tag
	brnz,pt	%g3, 1b			! if pointer is not null
	nop				!   then loop
	jmp	%g1 + 4			! exit
	clr	%g2			! clear tag (not in list)
2:
	jmp	%g1 + 4			! exit
	ldx	[%g3+8], %g3		! load tte data


/*
 * Check if we have a data sigsegv
 * %g2 has the virtual page number (32-13 => 19 bits)

 * Must be all 1's or all 0's for a legal sigsegv
 */
segv_check:
			sethi	%hi(0x7ffff), %g2
			or	%g2, %lo(0x7ffff), %g2
/* Check page 0 */	andcc	%g2, %g4, %g1
			te	TRAP_SIGSEGV_UPDATE
/* Check last page */	cmp	%g2, %g1
			te	TRAP_SIGSEGV_UPDATE
/* unexpected page */	tne	BAD_TRAP
1:			done
			ta	BAD_TRAP


/*
 * Close off reset handler code
 */
.seg "data"
reset_data_end:
.seg "text"
reset_text_end:

/* 
 * Non-cacheable reset vector
 */
Module "red_priv", VA_text = 0xfffffffff0000000, VA_data = 0xfffffffff0010000
/*#include "red_trap_table.s"*/

/*
 * Non-cacheable reset handler
 */
Module "reset_nc", VA_text = 0xfffffffff0020000, VA_data = 0xfffffffff0030000
reset_handler_nc_start:
/*#include "reset.s"*/
reset_handler_nc_end:

Module "special_trap_handler", VA_text = 0xe000, VA_data = 0xe00
.seg "text"
special_trap_handler_start:
FP_DISABLED_HANDLER_default:

/*
        This handler checks if the fpu is really
        disabled, if not then it is an interrupt
        pending trap, in which case the handler
        enables the interrupts and issues an integer
        instruction which traps becasue of the pending
        interrupt. If the fp is really disabled then
        it enables the fpu and issues a retry  */

/*
   if TSTATE.PEF == 1 && FPRS.FE == 1 then an interrupt is pending
*/
        rdpr  %tstate , %g1
        srlx  %g1 , 0xc , %g1
        and   %g1, 0x001, %g1   /* TSTATE.PEF == 1 */

        rd    %fprs, %g2
        srlx  %g2 , 0x2 , %g2   /* FPRS.FEF == 1 */
        and   %g2, 0x001, %g2

        and   %g1, %g2, %g1
        cmp   %g1, %g0
        be    %icc, FP_DISABLED_HANDLER_default_real

        nop
        /*if true enable interrupts and issue an integer instruction */
        rdpr  %pstate, %g3
        or    %g3, 0x002, %g3
        wrpr  %g3, %pstate
        add   %g0, %g0, %g0
        retry

FP_DISABLED_HANDLER_default_real: /* this merely enables the trap fgu */

        rdpr    %tstate , %g1
        set     0x1000, %g2
        or      %g1, %g2, %g1
        wrpr    %g1, %g0, %tstate
        wr      %g0, 0x4, %fprs
        retry
special_trap_handler_end:

/*
 * User code/data
 */
Module "default_user", VA_text = T0_KAOS_BOOT_VA, VA_data = 0x8200000

/************************************************************************
   Test case code start
 ************************************************************************/
.seg "text"
ALIGN_PAGE_8K
user_text_start:
	.skip 0x1b00			/* place at end of lower 8k of i$ */
kaos_boot:
	set	t0_data_in_fp, %sp	/* setup stack pointer */

	/*
	 * setup %sp in all windows
	 * clear all window registers
	 */
	clr %l0; clr %l1; clr %l2; clr %l3; clr %l4; clr %l5; clr %l6; clr %l7
	clr %i0; clr %i1; clr %i2; clr %i3; clr %i4; clr %i5; mov %o6, %i6; clr %i7
	save	%sp, 0, %sp
	clr %l0; clr %l1; clr %l2; clr %l3; clr %l4; clr %l5; clr %l6; clr %l7
	clr %i0; clr %i1; clr %i2; clr %i3; clr %i4; clr %i5; mov %o6, %i6; clr %i7
	save	%sp, 0, %sp
	clr %l0; clr %l1; clr %l2; clr %l3; clr %l4; clr %l5; clr %l6; clr %l7
	clr %i0; clr %i1; clr %i2; clr %i3; clr %i4; clr %i5; mov %o6, %i6; clr %i7
	save	%sp, 0, %sp
	clr %l0; clr %l1; clr %l2; clr %l3; clr %l4; clr %l5; clr %l6; clr %l7
	clr %i0; clr %i1; clr %i2; clr %i3; clr %i4; clr %i5; mov %o6, %i6; clr %i7
	save	%sp, 0, %sp
	clr %l0; clr %l1; clr %l2; clr %l3; clr %l4; clr %l5; clr %l6; clr %l7
	clr %i0; clr %i1; clr %i2; clr %i3; clr %i4; clr %i5; mov %o6, %i6; clr %i7
	save	%sp, 0, %sp
	clr %l0; clr %l1; clr %l2; clr %l3; clr %l4; clr %l5; clr %l6; clr %l7
	clr %i0; clr %i1; clr %i2; clr %i3; clr %i4; clr %i5; mov %o6, %i6; clr %i7
	save	%sp, 0, %sp
	clr %l0; clr %l1; clr %l2; clr %l3; clr %l4; clr %l5; clr %l6; clr %l7
	clr %i0; clr %i1; clr %i2; clr %i3; clr %i4; clr %i5; mov %o6, %i6; clr %i7
	save	%sp, 0, %sp
	clr %l0; clr %l1; clr %l2; clr %l3; clr %l4; clr %l5; clr %l6; clr %l7
	clr %i0; clr %i1; clr %i2; clr %i3; clr %i4; clr %i5; mov %o6, %i6; clr %i7
	save	%sp, 0, %sp

#if defined(T0_KAOS_TICK)
	ta	TRAP_INIT_TICK_COMPARE	/* init tick compare register */
#endif
	set	t0_data_in_regs, %o0	/* Tell trap handlers where */
	ta	TRAP_SETDATA		/* data area is */

	mov	ASI_PRIMARY, %asi	/* Setup asi register */

#ifdef SET_WORKS
	set	t0_ktbl, %o0		/* execute random code */
#else
	setx	t0_ktbl, %l0, %o0	/* execute random code */
#endif
	set	t0_data_in_regs, %o1
	set	t0_data_in_mtbl_size, %o2
	ld	[%o2], %o2
	set	t0_data_in_mtbl, %o3
	mov	XFLAG_SGI|XFLAG_V9, %o4
	call	__kaos
	nop

#if defined(T0_KAOS_TWOPASS)
/*
 * Preload d$ with data
 */
two_pass_preload:
	set	T0_KAOS_AREAS, %l0		/* get area table size */
	set	t0_offset_table_size, %l1	/* get offset table size */
	ld	[%l1], %l1
	set	t0_data_exp_mtbl, %l2		/* point to last area */
	sub	%l2, 16, %l2
	sll	%l0, 2, %l3
	sub	%l2, %l3, %l2
	set	t0_offset_table, %l3		/* point to first offset */

1:
	ld	[%l2], %l7			/* point to next area */
	mov	%l1, %l4			/* offset table size */
	mov	%l3, %l5			/* offset table */
2:
	ld	[%l5], %l6			/* get next offset */
	ld	[%l6+%l7], %o0			/* preload d$ with data */
	deccc	%l4				/* loop until out of offsets */
	bne	2b
	add	%l5, 4, %l5

/*
 * only need to do one area because areasize = D$ size
 */
	deccc	%l0				/* loop until out of areas */
	bne	1b
	add	%l2, 4, %l2

/*
 * Execute random code for a second time
 */
	set	t0_data_exp_fp, %sp		/* setup stack pointer */
	save	%sp, 0, %sp			/* setup %sp in all windows */
	save	%sp, 0, %sp
	save	%sp, 0, %sp
	save	%sp, 0, %sp
	save	%sp, 0, %sp
	save	%sp, 0, %sp
	save	%sp, 0, %sp
	save	%sp, 0, %sp
#ifdef SET_WORKS
	set	t0_ktbl, %o0			/* execute random code */
#else
	setx	t0_ktbl, %l0, %o0		/* execute random code */
#endif
        set     t0_data_exp_regs, %o1
        set     t0_data_exp_mtbl_size, %o2
        ld      [%o2], %o2
        set     t0_data_exp_mtbl, %o3
	mov	XFLAG_SGI|XFLAG_V9, %o4
two_pass_execute:
        call    __kaos
        nop
#endif

#if defined(T0_KAOS_VERIFY)
/*
 * Code to verify expected==observed
 * Do not run this option under RTL because it takes forever
 */
kverify_regs:
	set	t0_data_in_regs, %o0		/* Point to observed regs */
	set	t0_data_exp_regs, %o1		/* Point to expected regs */
	call	kcmp				/* Compare expected/observed registers */
	set	KDATA_MAX_IDX, %o2		/* Count of words to compare */

kverify_area:
	set	T0_KAOS_AREAS, %l0		/* get area table size */
	set	t0_data_in_mtbl, %l1		/* point to observed area pointers */
	sub	%l1, 16, %l1
	set	t0_data_exp_mtbl, %l2		/* point to expected area pointers */
	sub	%l2, 16, %l2
	set	t0_data_in_area0, %l3		/* Calculate offset to beginning of area */
	set	t0_data_in_area0_begin, %l4
	sub	%l3, %l4, %l3
	set	t0_data_in_area0_end, %l4	/* Calculate number of words in each area */
	set	t0_data_in_area0_begin, %l5
	sub	%l4, %l5, %l4
	srl	%l4, 2, %l4
kverify_area_loop:
	sub	%l1, 4, %l1			/* Point to next area */
	sub	%l2, 4, %l2
	ld	[%l1], %o0			/* Point to start of observed area data */
	sub	%o0, %l3, %o0
	ld	[%l2], %o1			/* Point to start of expected area data */
	sub	%o1, %l3, %o1
	call	kcmp				/* Compare expected/observed areas */
	mov	%l4, %o2			/* Setup count of words to verify */

	deccc	%l0				/* loop until out of areas */
	bne	kverify_area_loop
	nop
#endif

normal_end:
        ta      GOOD_TRAP

/************************************************************************
   Routine to compare expected/observed  values
   Input:
	%o0	observed data pointer
	%o1	expected data pointer
	%o2	count of words to compare
 ************************************************************************/
#if defined(T0_KAOS_VERIFY)
kcmp:
	ld	[%o0], %o3
	ld	[%o1], %o4
	cmp	%o3, %o4
	tne	BAD_TRAP
	deccc	%o2
	bne	kcmp
	nop

	retl
	nop
#endif

/************************************************************************
   Test case data start
 ************************************************************************/
.seg "data"
ALIGN_PAGE_8K

user_data_start:

.seg "text"			/* Realign default segments */
user_text_end:
ALIGN_PAGE_8K
.seg "data"
user_data_end:
ALIGN_PAGE_8K

/************************************************************************
   Include startup code
 ************************************************************************/
#define KAOS_SIMULATION
#define KAOS_V9
#define KGLOBAL(a)
Module "kaos_startup", VA_text = T0_KAOS_STARTUP_VA, VA_data = 0x8300000
.seg	"text"
_kaos_page_begin:

#if !defined(_KAOS_H)
#define _KAOS_H

#define I2OFF(a)	((a)*4)	/* convert integer index to address offset */

/*
 * _kaos() register load/store area layout
 */
#define KDATA_FREGS	(64)
#define KDATA_LREGS	(8)
#define KDATA_IREGS	(8)
#define KDATA_GREGS	(8)
#define KDATA_OREGS	(8)

#define KDATA_FREG_IDX		(0)
#define KDATA_GREG_IDX		(KDATA_FREG_IDX+KDATA_FREGS)
#define KDATA_OREG_IDX		(KDATA_GREG_IDX+KDATA_GREGS)
#define KDATA_LREG_IDX		(KDATA_OREG_IDX+KDATA_OREGS)
#define KDATA_IREG_IDX		(KDATA_LREG_IDX+KDATA_LREGS)
#define KDATA_Y_IDX		(KDATA_IREG_IDX+KDATA_IREGS)
#define KDATA_ICC_IDX		(KDATA_Y_IDX+1)
#define KDATA_FSR_IDX		(KDATA_ICC_IDX+1)
#define KDATA_GSRMASK_IDX	(KDATA_FSR_IDX+1)
#define KDATA_GSR_IDX		(KDATA_GSRMASK_IDX+1)
#define KDATA_ASI_IDX		(KDATA_GSR_IDX+1)
#define KDATA_TRAP_BEG_IDX	(KDATA_ASI_IDX+1)
#define KDATA_TRAP_OV_IDX	(KDATA_TRAP_BEG_IDX)
#define KDATA_TRAP_DIV0_IDX	(KDATA_TRAP_OV_IDX+1)
#define KDATA_TRAP_DIV52_IDX	(KDATA_TRAP_DIV0_IDX+1)
#define KDATA_TRAP_NX_IDX	(KDATA_TRAP_DIV52_IDX+1)
#define KDATA_TRAP_DZ_IDX	(KDATA_TRAP_NX_IDX+1)
#define KDATA_TRAP_UF_IDX	(KDATA_TRAP_DZ_IDX+1)
#define KDATA_TRAP_OF_IDX	(KDATA_TRAP_UF_IDX+1)
#define KDATA_TRAP_NV_IDX	(KDATA_TRAP_OF_IDX+1)
#define KDATA_TRAP_FP_OTHER_IDX	(KDATA_TRAP_NV_IDX+1)
#define KDATA_TRAP_TICC_IDX	(KDATA_TRAP_FP_OTHER_IDX+1)
#define KDATA_TRAP_SIGFPE_IDX	(KDATA_TRAP_TICC_IDX+1)
#define KDATA_TRAP_SIGSEGV_IDX	(KDATA_TRAP_SIGFPE_IDX+1)
#define KDATA_TRAP_SIGBUS_IDX	(KDATA_TRAP_SIGSEGV_IDX+1)
#define KDATA_TRAP_SIGILL_IDX	(KDATA_TRAP_SIGBUS_IDX+1)
#define KDATA_ETRAP_SIGSEGV_IDX	(KDATA_TRAP_SIGILL_IDX+1)
#define KDATA_ETRAP_SIGBUS_IDX	(KDATA_ETRAP_SIGSEGV_IDX+1)
#define KDATA_TRAP_UNIMP_IDX	(KDATA_ETRAP_SIGBUS_IDX+1)
#define KDATA_TRAP_MAX_IDX	(KDATA_TRAP_UNIMP_IDX+1)
#define KDATA_MAX_IDX		((KDATA_TRAP_MAX_IDX+1)&~1)

#define KDATA_FREG_OFF(a)	I2OFF((a)+KDATA_FREG_IDX)
#define KDATA_GREG_OFF(a)	I2OFF((a)+KDATA_GREG_IDX)
#define KDATA_OREG_OFF(a)	I2OFF((a)+KDATA_OREG_IDX)
#define KDATA_LREG_OFF(a)	I2OFF((a)+KDATA_LREG_IDX)
#define KDATA_IREG_OFF(a)	I2OFF((a)+KDATA_IREG_IDX)
#define KDATA_ICC_OFF		I2OFF(KDATA_ICC_IDX)
#define KDATA_Y_OFF		I2OFF(KDATA_Y_IDX)
#define KDATA_FSR_OFF		I2OFF(KDATA_FSR_IDX)
#define KDATA_GSRMASK_OFF	I2OFF(KDATA_GSRMASK_IDX)
#define KDATA_GSR_OFF		I2OFF(KDATA_GSR_IDX)
#define KDATA_ASI_OFF		I2OFF(KDATA_ASI_IDX)
#define KDATA_TRAP_BEG_OFF	I2OFF(KDATA_TRAP_BEG_IDX)
#define KDATA_TRAP_OV_OFF	I2OFF(KDATA_TRAP_OV_IDX)
#define KDATA_TRAP_DIV0_OFF	I2OFF(KDATA_TRAP_DIV0_IDX)
#define KDATA_TRAP_DIV52_OFF	I2OFF(KDATA_TRAP_DIV52_IDX)
#define KDATA_TRAP_NX_OFF	I2OFF(KDATA_TRAP_NX_IDX)
#define KDATA_TRAP_DZ_OFF	I2OFF(KDATA_TRAP_DZ_IDX)
#define KDATA_TRAP_UF_OFF	I2OFF(KDATA_TRAP_UF_IDX)
#define KDATA_TRAP_OF_OFF	I2OFF(KDATA_TRAP_OF_IDX)
#define KDATA_TRAP_NV_OFF	I2OFF(KDATA_TRAP_NV_IDX)
#define KDATA_TRAP_FP_OTHER_OFF	I2OFF(KDATA_TRAP_FP_OTHER_IDX)
#define KDATA_TRAP_TICC_OFF	I2OFF(KDATA_TRAP_TICC_IDX)
#define KDATA_TRAP_SIGFPE_OFF	I2OFF(KDATA_TRAP_SIGFPE_IDX)
#define KDATA_TRAP_SIGSEGV_OFF	I2OFF(KDATA_TRAP_SIGSEGV_IDX)
#define KDATA_TRAP_SIGBUS_OFF	I2OFF(KDATA_TRAP_SIGBUS_IDX)
#define KDATA_TRAP_SIGILL_OFF	I2OFF(KDATA_TRAP_SIGILL_IDX)
#define KDATA_ETRAP_SIGSEGV_OFF	I2OFF(KDATA_ETRAP_SIGSEGV_IDX)
#define KDATA_ETRAP_SIGBUS_OFF	I2OFF(KDATA_ETRAP_SIGBUS_IDX)
#define KDATA_TRAP_UNIMP_OFF	I2OFF(KDATA_TRAP_UNIMP_IDX)
#define KDATA_MAX_OFF		I2OFF(KDATA_MAX_IDX)

/*
 * _kaos() local stack frame layout
 */
#define KFRAME_FSR	(-4)			/* addr offset for fsr */
#define KFRAME_XFLAGS	(KFRAME_FSR-4)		/* addr offset for xflags */
#define KFRAME_REGPTR	(KFRAME_XFLAGS-4)	/* addr offset for reg ptr */
#define KFRAME_MTBL	(KFRAME_REGPTR-4)	/* addr offset for first */
						/* word of variable */
						/* stack region */

/*
 * _kaos xflags bits
 */
#define	XFLAG_TRIGGER	0x1		/* Activate triggers */
#define	XFLAG_SGI	0x2		/* Save/restore %gsr */
#define	XFLAG_V9	0x4		/* Save/restore %f[32-63], %asi */

/*
 * %fsr set/get bit mask
 * We only allow RD and fcc fields
 */
#define FSR_MASK	0xc0000c00

/*
 * Trap numbers
 */
#define TICC_TRAP		0x10
#define TRIGGER_START_TRAP	0x14
#define TRIGGER_STOP_TRAP	0x18
#define WATCHDOG_TRAP		0x71

#endif

/*
 * Minimum frame size
 */
#define MINFRAME	0x60

/*
 * Special ticc traps for simulation
 */
#define TRAP_DEMAP_RANDOM_VA	0x28
#define	TRAP_DEMAP_AREA		0x2c
#define	TRAP_DEMAP_KTBL_TEXT	0x30
#define TRAP_DEMAP_KTBL_DATA	0x34
#define	TRAP_DEMAP_SUBR		0x38
#define	TRAP_DEMAP_REG		0x3c
#define	TRAP_DEMAP_STACK	0x40
#define	TRAP_RO_AREA		0x44
#define	TRAP_RO_KTBL_DATA	0x75
#define	TRAP_RO_REG		0x4c
#define	TRAP_RO_STACK		0x50
#define	TRAP_SET_WINDOW		0x54
#define	TRAP_SET_VA_WP		0x58
#define	TRAP_SET_PA_WP		0x5c
#define	TRAP_SET_SOFTINT	0x60
#define	TRAP_IE_TOGGLE		0x64
#define	TRAP_SET_PIL		0x68
#define	TRAP_SET_TSO		0x6c
#define	TRAP_SET_PSO		0x70
#define	TRAP_SET_RMO		0x74

/*
 * mplock return codes
 */
#define LOCK_SUCCESS    0
#define LOCK_TIMEOUT    1

/*
 * memtest types
 */
#define MEMTEST_NONE	0
#define MEMTEST_TSO	1
#define MEMTEST_RMO	2

#define MAXHOSTS	10

!
! Trap types for UNIX set condition codes
!
#define T_SETCC		0x21

!
! Entry point macros
!
#if defined(KAOS_SIMULATION) || defined(KAOS_VERIFY)
#define ENTRY(a)  _/**/a:

#if defined(NIAGARA2)
#define ENTRY_GLOBAL(a)  .global _/**/a ; _/**/a:  
#endif

#define SYM(a)	_/**/a
#else
#define ENTRY(a) .global a ; a:
#define SYM(a)	a
#endif

	.seg	"text"

!	_kaos(code, regdata, mtbl_cnt, mtbl, xflags); 
!	int	*code ;
!	int	*regdata ;
!	int	mtbl_cnt ;
!	int	**mtbl ;
!	int	xflags ;

#if !defined(NIAGARA2)
ENTRY(_kaos)
#else
ENTRY_GLOBAL(_kaos)
#endif
	sll	%o2, 2, %g1			! allocate stack frame
	add	%g1, (MINFRAME-(KFRAME_MTBL+4))+7, %g1
	andn	%g1, 7, %g1
	neg	%g1
	save	%sp,%g1,%sp

#if !defined(KAOS_SIMULATION)

! copy mtbl to stack
! (assumes the top of mtbl is dword aligned)

#if ((KFRAME_MTBL & 0x4) == 0)
	dec	4, %i3
	ld	[%i3], %f0
	st	%f0, [%fp+KFRAME_MTBL]
	add	%fp, KFRAME_MTBL-8, %l2
	dec	%i2
#else
	add	%fp, KFRAME_MTBL-4, %l2
#endif
1:
	dec	8, %i3
	deccc	2, %i2
	ldd	[%i3], %f0
	std	%f0, [%l2]
	bne	1b
	dec	8, %l2
#else

! If we are simulating, then mtbl is already on the stack
! so just the the nops right so va's match.

#if ((KFRAME_MTBL & 0x4) == 0)
	nop
	nop
	nop
	nop
	nop
#else
	nop
#endif
	nop
	nop
	nop
	nop
	nop
	nop
#endif

! set up the floating point registers

	ldd	[%i1+KDATA_FREG_OFF(0)],%f0
	ldd	[%i1+KDATA_FREG_OFF(2)],%f2
	ldd	[%i1+KDATA_FREG_OFF(4)],%f4
	ldd	[%i1+KDATA_FREG_OFF(6)],%f6
	ldd	[%i1+KDATA_FREG_OFF(8)],%f8
	ldd	[%i1+KDATA_FREG_OFF(10)],%f10
	ldd	[%i1+KDATA_FREG_OFF(12)],%f12
	ldd	[%i1+KDATA_FREG_OFF(14)],%f14
	ldd	[%i1+KDATA_FREG_OFF(16)],%f16
	ldd	[%i1+KDATA_FREG_OFF(18)],%f18
	ldd	[%i1+KDATA_FREG_OFF(20)],%f20
	ldd	[%i1+KDATA_FREG_OFF(22)],%f22
	ldd	[%i1+KDATA_FREG_OFF(24)],%f24
	ldd	[%i1+KDATA_FREG_OFF(26)],%f26
	ldd	[%i1+KDATA_FREG_OFF(28)],%f28
	ldd	[%i1+KDATA_FREG_OFF(30)],%f30

#if !defined(KAOS_V8_ONLY)
	andcc	%i4, XFLAG_V9, %g0		! set extended floating
	be	1f					! (in v9, odd registers for
	nop						!  double opcodes actually
							!  refer to the upper bank)
	ldd	[%i1+KDATA_FREG_OFF(32)], %f32
	ldd	[%i1+KDATA_FREG_OFF(34)], %f34
	ldd	[%i1+KDATA_FREG_OFF(36)], %f36
	ldd	[%i1+KDATA_FREG_OFF(38)], %f38
	ldd	[%i1+KDATA_FREG_OFF(40)], %f40
	ldd	[%i1+KDATA_FREG_OFF(42)], %f42
	ldd	[%i1+KDATA_FREG_OFF(44)], %f44
	ldd	[%i1+KDATA_FREG_OFF(46)], %f46
	ldd	[%i1+KDATA_FREG_OFF(48)], %f48
	ldd	[%i1+KDATA_FREG_OFF(50)], %f50
	ldd	[%i1+KDATA_FREG_OFF(52)], %f52
	ldd	[%i1+KDATA_FREG_OFF(54)], %f54
	ldd	[%i1+KDATA_FREG_OFF(56)], %f56
	ldd	[%i1+KDATA_FREG_OFF(58)], %f58
	ldd	[%i1+KDATA_FREG_OFF(60)], %f60
	ldd	[%i1+KDATA_FREG_OFF(62)], %f62
	membar	#Sync

	ld	[%i1+KDATA_ASI_OFF], %l0	! set %asi
	
#if !defined(NIAGARA2)
	wr	%l0, %g0, %asr3
#endif
1:

! set %gsr if requested

	andcc	%i4, XFLAG_SGI, %g0
	be	1f
	nop
	ld	[%i1+KDATA_GSRMASK_OFF],%o1
	ld	[%i1+KDATA_GSR_OFF], %o0	! set %gsr
	sllx	%o1, 32, %o1
	or	%o0, %o1, %o0
#if !defined(NIAGARA2)
	wr	%o0, %gsr
#endif
1:
#else
! 30 nop's so silicon/sim va's match
	nop ; nop ; nop ; nop ; nop
	nop ; nop ; nop ; nop ; nop
	nop ; nop ; nop ; nop ; nop
	nop ; nop ; nop ; nop ; nop
	nop ; nop ; nop ; nop ; nop
	nop ; nop ; nop ; nop ; nop
#endif

! save xflags and fire start trigger if requested
! (must do this before the T_SETCC trap below)

#if !defined(KAOS_SIMULATION)
	st	%i4, [%fp+KFRAME_XFLAGS]
	andcc	%i4, XFLAG_TRIGGER, %g0
	tne	TRIGGER_START_TRAP
#else
	nop
	nop
	nop
#endif

! set up other registers

	ld	[%i1+KDATA_Y_OFF], %o0		! set y
	mov	%o0, %y
	
	ld	[%i1+KDATA_ICC_OFF], %g1	! set icc
#if !defined(NIAGARA2)
	ta	T_SETCC
#endif

	st	%fsr, [%fp+KFRAME_FSR]		! save old fsr

#if defined(KAOS_V9) && defined(KAOS_FPNS)
	ld	[%i1+KDATA_FSR_OFF], %o0
	set	(1<<22), %o1			! set fsr.NS to avoid traps
	or	%o0, %o1, %o0			! in simulation
	st	%o0, [%i1+KDATA_FSR_OFF]
#else
	nop
	nop
	nop
	nop
#endif
	fmovs	%f0, %f0			! clear %fsr ftt field
	ld	[%i1+KDATA_FSR_OFF], %fsr	! set fsr
	
	mov	%i0, %o7			! save code pointer
	st	%i1, [%fp+KFRAME_REGPTR]	! save register area pointer
	ldd	[%i1+KDATA_IREG_OFF(2)], %i2	! r/w area offsets
	ldd	[%i1+KDATA_IREG_OFF(4)], %i4
	ldd	[%i1+KDATA_OREG_OFF(0)], %o0	! output regs
	ldd	[%i1+KDATA_OREG_OFF(2)], %o2
	ldd	[%i1+KDATA_OREG_OFF(4)], %o4
	ldd	[%i1+KDATA_LREG_OFF(0)], %l0	! local regs
	ldd	[%i1+KDATA_LREG_OFF(2)], %l2
	ldd	[%i1+KDATA_LREG_OFF(4)], %l4
	ldd	[%i1+KDATA_LREG_OFF(6)], %l6
	ld	[%i1+KDATA_GREG_OFF(0)], %g0	! always zero
	ld	[%i1+KDATA_GREG_OFF(1)], %g1	! code offset
	ld	[%i1+KDATA_GREG_OFF(2)], %g2	! unused
	ld	[%i1+KDATA_GREG_OFF(3)], %g3	! loop index
	ld	[%i1+KDATA_GREG_OFF(4)], %g4	! jmpl target
	ld	[%i1+KDATA_GREG_OFF(5)], %g5	! sigbus target
	ld	[%i1+KDATA_GREG_OFF(6)], %g6	! block ld offset
	ld	[%i1+KDATA_GREG_OFF(7)], %g7	! block st offset
	ldd	[%i1+KDATA_IREG_OFF(0)], %i0	! area pointers

#if defined(KAOS_SIMULATION)
!
! Save return address on stack
! HARI
	st	%i7, [%sp+0x3c]
#else
	nop
#endif
!
! Begin random instruction execution at specified entry point
! When done, code returns using a "call SYM(_kaos_done)"
!
#if !defined(NIAGARA2)
	flush	%o7
#endif
	jmp	%o7
	membar	#Sync

! Random instruction execution done

#if !defined(NIAGARA2)
ENTRY(_kaos_done)
#else
SECTION kaos_done TEXT_VA=T0_KAOS_DONE_VA
ENTRY_GLOBAL(_kaos_done)  
#endif
	membar	#Sync
#if defined(KAOS_SIMULATION)
	ret
	restore
#else
	nop
	nop
#endif
	ld	[%fp+KFRAME_REGPTR], %o7	! point to register area
	std	%o0, [%o7+KDATA_OREG_OFF(0)]	! output regs
	std	%o2, [%o7+KDATA_OREG_OFF(2)]
	std	%o4, [%o7+KDATA_OREG_OFF(4)]

	st	%g0, [%o7+KDATA_GREG_OFF(0)]	! should be 0
	st	%g1, [%o7+KDATA_GREG_OFF(1)]	! code offset
	st	%g2, [%o7+KDATA_GREG_OFF(2)]	! unused
	st	%g3, [%o7+KDATA_GREG_OFF(3)]	! loop index
	st	%g4, [%o7+KDATA_GREG_OFF(4)]	! jmpl target
	st	%g5, [%o7+KDATA_GREG_OFF(5)]	! sigbus target
	st	%g6, [%o7+KDATA_GREG_OFF(6)]	! block ld offset
	st	%g7, [%o7+KDATA_GREG_OFF(7)]	! block st offset

	std	%i0, [%o7+KDATA_IREG_OFF(0)]	! area pointers
	std	%i2, [%o7+KDATA_IREG_OFF(2)]	! r/w area offsets
	std	%i4, [%o7+KDATA_IREG_OFF(4)]

	std	%l0, [%o7+KDATA_LREG_OFF(0)]	! locals
	std	%l2, [%o7+KDATA_LREG_OFF(2)]
	std	%l4, [%o7+KDATA_LREG_OFF(4)]
	std	%l6, [%o7+KDATA_LREG_OFF(6)]

	clr	%o0				! get icc
	bcs,a	1f
	or	%o0, 0x1, %o0
1:	bvs,a	2f
	or	%o0, 0x2, %o0
2:	be,a	4f
	or	%o0, 0x4, %o0
4:	bneg,a	8f
	or	%o0, 0x8, %o0
8:
	st	%o0, [%o7+KDATA_ICC_OFF]

	ld	[%fp+KFRAME_XFLAGS], %g1	! trigger analyzer
	andcc	%g1, XFLAG_TRIGGER, %g0
	tne	TRIGGER_STOP_TRAP

	st	%fsr, [%o7+KDATA_FSR_OFF]	! get fsr
	ld	[%fp+KFRAME_FSR], %fsr		! restore original fsr

#if !defined(KAOS_V8_ONLY)
	ld	[%fp+KFRAME_XFLAGS], %g1	! get %gsr
	andcc	%g1, XFLAG_SGI, %g0
	be	1f
	nop
#if !defined(NIAGARA2)
	rd	%gsr, %o0
#endif
	srlx	%o0, 32, %o1
	st	%o1, [%o7+KDATA_GSRMASK_OFF]
	st	%o0, [%o7+KDATA_GSR_OFF]
1:
#else
! 8 nop's so silicon/sim va's match
	nop ; nop ; nop ; nop ; nop
	nop ; nop ; nop
#endif

	mov	%y, %o0
	st	%o0, [%o7+KDATA_Y_OFF]		! get y
	
	std	%f0, [%o7+KDATA_FREG_OFF(0)]	! get floating
	std	%f2, [%o7+KDATA_FREG_OFF(2)]
	std	%f4, [%o7+KDATA_FREG_OFF(4)]
	std	%f6, [%o7+KDATA_FREG_OFF(6)]
	std	%f8, [%o7+KDATA_FREG_OFF(8)]
	std	%f10, [%o7+KDATA_FREG_OFF(10)]
	std	%f12, [%o7+KDATA_FREG_OFF(12)]
	std	%f14, [%o7+KDATA_FREG_OFF(14)]
	std	%f16, [%o7+KDATA_FREG_OFF(16)]
	std	%f18, [%o7+KDATA_FREG_OFF(18)]
	std	%f20, [%o7+KDATA_FREG_OFF(20)]
	std	%f22, [%o7+KDATA_FREG_OFF(22)]
	std	%f24, [%o7+KDATA_FREG_OFF(24)]
	std	%f26, [%o7+KDATA_FREG_OFF(26)]
	std	%f28, [%o7+KDATA_FREG_OFF(28)]
	std	%f30, [%o7+KDATA_FREG_OFF(30)]

#if !defined(KAOS_V8_ONLY)
	ld	[%fp+KFRAME_XFLAGS], %o1	! get extended floating
	andcc	%o1, XFLAG_V9, %g0		! (in v9, odd registers for
	be	1f					!  double opcodes actually
	nop						!  refer to the upper bank)

	membar 	#Sync
	std	%f32, [%o7+KDATA_FREG_OFF(32)]
	std	%f34, [%o7+KDATA_FREG_OFF(34)]
	std	%f36, [%o7+KDATA_FREG_OFF(36)]
	std	%f38, [%o7+KDATA_FREG_OFF(38)]
	std	%f40, [%o7+KDATA_FREG_OFF(40)]
	std	%f42, [%o7+KDATA_FREG_OFF(42)]
	std	%f44, [%o7+KDATA_FREG_OFF(44)]
	std	%f46, [%o7+KDATA_FREG_OFF(46)]
	std	%f48, [%o7+KDATA_FREG_OFF(48)]
	std	%f50, [%o7+KDATA_FREG_OFF(50)]
	std	%f52, [%o7+KDATA_FREG_OFF(52)]
	std	%f54, [%o7+KDATA_FREG_OFF(54)]
	std	%f56, [%o7+KDATA_FREG_OFF(56)]
	std	%f58, [%o7+KDATA_FREG_OFF(58)]
	std	%f60, [%o7+KDATA_FREG_OFF(60)]
	std	%f62, [%o7+KDATA_FREG_OFF(62)]

						! save %asi
#if !defined(NIAGARA2)
	rd	%asr3, %o1
#endif
	st	%o1, [%o7+KDATA_ASI_OFF]
1:
#else
! 23 nop's so silicon/sim va's match
	nop ; nop ; nop ; nop ; nop
	nop ; nop ; nop ; nop ; nop
	nop ; nop ; nop ; nop ; nop
	nop ; nop ; nop ; nop ; nop
	nop ; nop ; nop
#endif

	ret
	restore

!----------------------------------------------------------------------
.seg	"text"
_kaos_page_end:

/************************************************************************
   Include random code and data
 ************************************************************************/
#define KTEXT_MODULE(mod, va) Module "mod", VA_text = va, VA_data = 0x20000000
#define KDATA_MODULE(mod, va) Module "mod", VA_text = 0x30000000, VA_data = va

/*#include "ktbl.0.s"		 Kaos random code */

/************************************************************************
   16k of zeros to overwrite trap handlers in i$.
 ************************************************************************/

Module "illtrap_text", VA_text = 0x100000, VA_data = 0x8300000
.seg "text"
ALIGN_PAGE_8K
illtrap_text_start:
/*#include "illtrap_16kb.s"*/
illtrap_text_end:

Module "kaos_done", VA_text = T0_KAOS_DONE_VA, VA_data = 0x8300000
.seg "text"
ALIGN_PAGE_8K
local_good_trap_start:
 
#ifdef MEM_CHK
#define MEM_SYNC_ADDR 0x123456789ab
mem_chk:
                clr     %g1
                setx    MEM_SYNC_ADDR, %g2, %g1
                lduba   [%g1]ASI_PHYS_BYPASS_EC_WITH_EBIT, %g2
#endif
 
                membar  #Sync
good_trap:      ba good_trap
                nop
 
local_good_trap_end:


/************************************************************************
   Map in the RED mode non-cacheable stuff
   This is just to emit the code. The mapping is performed by RED mode.
 ************************************************************************/

#undef ENTRY
MMU_MAP_START
	NAME= red_priv_text
        TYPE= TEXT
        START_LABEL=red_priv_text_start
        END_LABEL=red_priv_text_end
        PA=07FFF0000000
	CONTEXT = 0
	SIZE=MMU_PAGE_SIZE
	NFO=0
	IE=1
	CP=0
	CV=0
	LOCK=0
	PRIV=0
	WRITE=0
        ENTRY = OFF
MMU_MAP_END

MMU_MAP_START
	NAME=reset_handler_nc
	TYPE=TEXT
	SIZE=MMU_PAGE_SIZE
	START_LABEL=reset_handler_nc_start
	END_LABEL=reset_handler_nc_end
	ENTRY = OFF
	CP=0	/* Mark noncacheable to avoid dots2mem sun5 warning */
	CV=0	/* Mark noncacheable to avoid dots2mem sun5 warning */
	PA=07fff0020000
	CONTEXT=0
	NFO=0
	IE=0
	PRIV=0
	WRITE=0
	LOCK=0
MMU_MAP_END

/************************************************************************
   Map data required by cacheable reset handler
   This is just to emit the data. The mapping is jammed into the TLB
   by reset.s.
 ************************************************************************/

MMU_MAP_START
	NAME= reset_data
	TYPE= DATA
	SIZE=8K
	START_LABEL=reset_data_start
	END_LABEL=reset_data_end
	PA=10000
	CP=1
	CV=1
	ENTRY = OFF
	CONTEXT=0
	NFO=0
	IE=0
	PRIV=0
	WRITE=0
	LOCK=0
MMU_MAP_END	

/************************************************************************
   Map user page 0
 ************************************************************************/

MMU_MAP_START
	NAME= user_page0_text
	TYPE= TEXT_AND_DATA
	START_LABEL=T_RESERVED_000
	END_LABEL=T_EXTRA_0ff
	CONTEXT=USER_CONTEXT
	GLOBAL=USER_DATA_GLOBAL_BIT
	WRITE=USER_DATA_WRITE_BIT
	PRIV=0
	SIDE_EFFECT=USER_DATA_SIDE_EFFECT_BIT
	CV=USER_DATA_CV_BIT
	CP=USER_DATA_CP_BIT
	LOCK=USER_DATA_LOCK_BIT
	PA=00000fff0000
	IE=USER_DATA_IE_BIT
	NFO=1
	SIZE=USER_DATA_SIZE
MMU_MAP_END

/************************************************************************
   Map stacks
 ************************************************************************/

MMU_MAP_START
	NAME= t0_data_in_stack
	TYPE= DATA
	START_LABEL=t0_data_in_stack_start
	END_LABEL=t0_data_in_stack_end
	CONTEXT=USER_CONTEXT
	GLOBAL=USER_DATA_GLOBAL_BIT
	WRITE=USER_DATA_WRITE_BIT
	PRIV=USER_DATA_PRIV_BIT
	SIDE_EFFECT=USER_DATA_SIDE_EFFECT_BIT
	CV=T0_KAOS_RUN_STACK_CACHEABLE
	CP=T0_KAOS_RUN_STACK_CACHEABLE
	PA=T0_KAOS_RUN_STACK_PA
	LOCK=USER_DATA_LOCK_BIT
	IE=T0_KAOS_RUN_STACK_NONCACHEABLE
	NFO=USER_DATA_NFO_BIT
	SIZE=USER_DATA_SIZE
MMU_MAP_END

#if defined(T0_KAOS_TWOPASS) || defined(T0_KAOS_VERIFY)
MMU_MAP_START
	NAME= t0_data_exp_stack
	TYPE= DATA
	START_LABEL=t0_data_exp_stack_start
	END_LABEL=t0_data_exp_stack_end
	CONTEXT=USER_CONTEXT
	GLOBAL=USER_DATA_GLOBAL_BIT
	WRITE=USER_DATA_WRITE_BIT
	PRIV=USER_DATA_PRIV_BIT
	SIDE_EFFECT=USER_DATA_SIDE_EFFECT_BIT
	CV=T0_KAOS_EXP_STACK_CACHEABLE
	CP=T0_KAOS_EXP_STACK_CACHEABLE
	PA=T0_KAOS_EXP_STACK_PA
	LOCK=USER_DATA_LOCK_BIT
	IE=T0_KAOS_EXP_STACK_NONCACHEABLE
	NFO=USER_DATA_NFO_BIT
	SIZE=USER_DATA_SIZE
MMU_MAP_END
#endif

/************************************************************************
   Map kaos subroutines
 ************************************************************************/

MMU_MAP_START
	NAME= t0_subr0_text
	TYPE= TEXT
	START_LABEL=t0_subr0_page_begin
	END_LABEL=t0_subr0_page_end
	CONTEXT=USER_CONTEXT
	GLOBAL=USER_DATA_GLOBAL_BIT
	WRITE=USER_DATA_WRITE_BIT
	PRIV=USER_DATA_PRIV_BIT
	SIDE_EFFECT=USER_DATA_SIDE_EFFECT_BIT
	CV=T0_KAOS_SUBR0_CACHEABLE
	CP=T0_KAOS_SUBR0_CACHEABLE
	PA=T0_KAOS_SUBR0_PA
	LOCK=USER_DATA_LOCK_BIT
	IE=T0_KAOS_SUBR0_NONCACHEABLE
	NFO=USER_DATA_NFO_BIT
	SIZE=USER_DATA_SIZE
MMU_MAP_END

MMU_MAP_START
	NAME= t0_subr1_text
	TYPE= TEXT
	START_LABEL=t0_subr1_page_begin
	END_LABEL=t0_subr1_page_end
	CONTEXT=USER_CONTEXT
	GLOBAL=USER_DATA_GLOBAL_BIT
	WRITE=USER_DATA_WRITE_BIT
	PRIV=USER_DATA_PRIV_BIT
	SIDE_EFFECT=USER_DATA_SIDE_EFFECT_BIT
	CV=T0_KAOS_SUBR1_CACHEABLE
	CP=T0_KAOS_SUBR1_CACHEABLE
	PA=T0_KAOS_SUBR1_PA
	LOCK=USER_DATA_LOCK_BIT
	IE=T0_KAOS_SUBR1_NONCACHEABLE
	NFO=USER_DATA_NFO_BIT
	SIZE=USER_DATA_SIZE
MMU_MAP_END

MMU_MAP_START
	NAME= t0_subr2_text
	TYPE= TEXT
	START_LABEL=t0_subr2_page_begin
	END_LABEL=t0_subr2_page_end
	CONTEXT=USER_CONTEXT
	GLOBAL=USER_DATA_GLOBAL_BIT
	WRITE=USER_DATA_WRITE_BIT
	PRIV=USER_DATA_PRIV_BIT
	SIDE_EFFECT=USER_DATA_SIDE_EFFECT_BIT
	CV=T0_KAOS_SUBR2_CACHEABLE
	CP=T0_KAOS_SUBR2_CACHEABLE
	PA=T0_KAOS_SUBR2_PA
	LOCK=USER_DATA_LOCK_BIT
	IE=T0_KAOS_SUBR2_NONCACHEABLE
	NFO=USER_DATA_NFO_BIT
	SIZE=USER_DATA_SIZE
MMU_MAP_END

MMU_MAP_START
	NAME= t0_subr3_text
	TYPE= TEXT
	START_LABEL=t0_subr3_page_begin
	END_LABEL=t0_subr3_page_end
	CONTEXT=USER_CONTEXT
	GLOBAL=USER_DATA_GLOBAL_BIT
	WRITE=USER_DATA_WRITE_BIT
	PRIV=USER_DATA_PRIV_BIT
	SIDE_EFFECT=USER_DATA_SIDE_EFFECT_BIT
	CV=T0_KAOS_SUBR3_CACHEABLE
	CP=T0_KAOS_SUBR3_CACHEABLE
	PA=T0_KAOS_SUBR3_PA
	LOCK=USER_DATA_LOCK_BIT
	IE=T0_KAOS_SUBR3_NONCACHEABLE
	NFO=USER_DATA_NFO_BIT
	SIZE=USER_DATA_SIZE
MMU_MAP_END

/************************************************************************
   Map kaos input data
 ************************************************************************/

MMU_MAP_START
	NAME= t0_kdata_regs
	TYPE= DATA
	START_LABEL=t0_data_in_regs_start
	END_LABEL=t0_data_in_regs_end
	CONTEXT=USER_CONTEXT
	GLOBAL=USER_DATA_GLOBAL_BIT
	WRITE=USER_DATA_WRITE_BIT
	PRIV=USER_DATA_PRIV_BIT
	SIDE_EFFECT=USER_DATA_SIDE_EFFECT_BIT
	CV=T0_KAOS_RUN_REGS_CACHEABLE
	CP=T0_KAOS_RUN_REGS_CACHEABLE
	PA=T0_KAOS_RUN_REGS_PA
	LOCK=USER_DATA_LOCK_BIT
	IE=T0_KAOS_RUN_REGS_NONCACHEABLE
	NFO=USER_DATA_NFO_BIT
	SIZE=USER_DATA_SIZE
MMU_MAP_END

#if defined(T0_KAOS_AREA0)
MMU_MAP_START
	NAME= t0_kdata_area0
	TYPE= DATA
	START_LABEL=t0_data_in_area0_start
	END_LABEL=t0_data_in_area0_end
	CONTEXT=USER_CONTEXT
	GLOBAL=USER_DATA_GLOBAL_BIT
	WRITE=USER_DATA_WRITE_BIT
	PRIV=USER_DATA_PRIV_BIT
	SIDE_EFFECT=USER_DATA_SIDE_EFFECT_BIT
	CV=T0_KAOS_RUN_AREA0_CACHEABLE
	CP=T0_KAOS_RUN_AREA0_CACHEABLE
	PA=T0_KAOS_RUN_AREA0_PA
	LOCK=USER_DATA_LOCK_BIT
	IE=T0_KAOS_RUN_AREA0_NONCACHEABLE
	NFO=USER_DATA_NFO_BIT
	SIZE=USER_DATA_SIZE
MMU_MAP_END
#endif

#if defined(T0_KAOS_AREA1)
MMU_MAP_START
	NAME= t0_kdata_area1
	TYPE= DATA
	START_LABEL=t0_data_in_area1_start
	END_LABEL=t0_data_in_area1_end
	CONTEXT=USER_CONTEXT
	GLOBAL=USER_DATA_GLOBAL_BIT
	WRITE=USER_DATA_WRITE_BIT
	PRIV=USER_DATA_PRIV_BIT
	SIDE_EFFECT=USER_DATA_SIDE_EFFECT_BIT
	CV=T0_KAOS_RUN_AREA1_CACHEABLE
	CP=T0_KAOS_RUN_AREA1_CACHEABLE
	PA=T0_KAOS_RUN_AREA1_PA
	LOCK=USER_DATA_LOCK_BIT
	IE=T0_KAOS_RUN_AREA1_NONCACHEABLE
	NFO=USER_DATA_NFO_BIT
	SIZE=USER_DATA_SIZE
MMU_MAP_END
#endif

#if defined(T0_KAOS_AREA2)
MMU_MAP_START
	NAME= t0_kdata_area2
	TYPE= DATA
	START_LABEL=t0_data_in_area2_start
	END_LABEL=t0_data_in_area2_end
	CONTEXT=USER_CONTEXT
	GLOBAL=USER_DATA_GLOBAL_BIT
	WRITE=USER_DATA_WRITE_BIT
	PRIV=USER_DATA_PRIV_BIT
	SIDE_EFFECT=USER_DATA_SIDE_EFFECT_BIT
	CV=T0_KAOS_RUN_AREA2_CACHEABLE
	CP=T0_KAOS_RUN_AREA2_CACHEABLE
	PA=T0_KAOS_RUN_AREA2_PA
	LOCK=USER_DATA_LOCK_BIT
	IE=T0_KAOS_RUN_AREA2_NONCACHEABLE
	NFO=USER_DATA_NFO_BIT
	SIZE=USER_DATA_SIZE
MMU_MAP_END
#endif

#if defined(T0_KAOS_AREA3)
MMU_MAP_START
	NAME= t0_kdata_area3
	TYPE= DATA
	START_LABEL=t0_data_in_area3_start
	END_LABEL=t0_data_in_area3_end
	CONTEXT=USER_CONTEXT
	GLOBAL=USER_DATA_GLOBAL_BIT
	WRITE=USER_DATA_WRITE_BIT
	PRIV=USER_DATA_PRIV_BIT
	SIDE_EFFECT=USER_DATA_SIDE_EFFECT_BIT
	CV=T0_KAOS_RUN_AREA3_CACHEABLE
	CP=T0_KAOS_RUN_AREA3_CACHEABLE
	PA=T0_KAOS_RUN_AREA3_PA
	LOCK=USER_DATA_LOCK_BIT
	IE=T0_KAOS_RUN_AREA3_NONCACHEABLE
	NFO=USER_DATA_NFO_BIT
	SIZE=USER_DATA_SIZE
MMU_MAP_END
#endif

#if defined(T0_KAOS_AREA4)
MMU_MAP_START
	NAME= t0_kdata_area4
	TYPE= DATA
	START_LABEL=t0_data_in_area4_start
	END_LABEL=t0_data_in_area4_end
	CONTEXT=USER_CONTEXT
	GLOBAL=USER_DATA_GLOBAL_BIT
	WRITE=USER_DATA_WRITE_BIT
	PRIV=USER_DATA_PRIV_BIT
	SIDE_EFFECT=USER_DATA_SIDE_EFFECT_BIT
	CV=T0_KAOS_RUN_AREA4_CACHEABLE
	CP=T0_KAOS_RUN_AREA4_CACHEABLE
	PA=T0_KAOS_RUN_AREA4_PA
	LOCK=USER_DATA_LOCK_BIT
	IE=T0_KAOS_RUN_AREA4_NONCACHEABLE
	NFO=USER_DATA_NFO_BIT
	SIZE=USER_DATA_SIZE
MMU_MAP_END
#endif

#if defined(T0_KAOS_AREA5)
MMU_MAP_START
	NAME= t0_kdata_area5
	TYPE= DATA
	START_LABEL=t0_data_in_area5_start
	END_LABEL=t0_data_in_area5_end
	CONTEXT=USER_CONTEXT
	GLOBAL=USER_DATA_GLOBAL_BIT
	WRITE=USER_DATA_WRITE_BIT
	PRIV=USER_DATA_PRIV_BIT
	SIDE_EFFECT=USER_DATA_SIDE_EFFECT_BIT
	CV=T0_KAOS_RUN_AREA5_CACHEABLE
	CP=T0_KAOS_RUN_AREA5_CACHEABLE
	PA=T0_KAOS_RUN_AREA5_PA
	LOCK=USER_DATA_LOCK_BIT
	IE=T0_KAOS_RUN_AREA5_NONCACHEABLE
	NFO=USER_DATA_NFO_BIT
	SIZE=USER_DATA_SIZE
MMU_MAP_END
#endif

#if defined(T0_KAOS_AREA6)
MMU_MAP_START
	NAME= t0_kdata_area6
	TYPE= DATA
	START_LABEL=t0_data_in_area6_start
	END_LABEL=t0_data_in_area6_end
	CONTEXT=USER_CONTEXT
	GLOBAL=USER_DATA_GLOBAL_BIT
	WRITE=USER_DATA_WRITE_BIT
	PRIV=USER_DATA_PRIV_BIT
	SIDE_EFFECT=USER_DATA_SIDE_EFFECT_BIT
	CV=T0_KAOS_RUN_AREA6_CACHEABLE
	CP=T0_KAOS_RUN_AREA6_CACHEABLE
	PA=T0_KAOS_RUN_AREA6_PA
	LOCK=USER_DATA_LOCK_BIT
	IE=T0_KAOS_RUN_AREA6_NONCACHEABLE
	NFO=USER_DATA_NFO_BIT
	SIZE=USER_DATA_SIZE
MMU_MAP_END
#endif

#if defined(T0_KAOS_AREA7)
MMU_MAP_START
	NAME= t0_kdata_area7
	TYPE= DATA
	START_LABEL=t0_data_in_area7_start
	END_LABEL=t0_data_in_area7_end
	CONTEXT=USER_CONTEXT
	GLOBAL=USER_DATA_GLOBAL_BIT
	WRITE=USER_DATA_WRITE_BIT
	PRIV=USER_DATA_PRIV_BIT
	SIDE_EFFECT=USER_DATA_SIDE_EFFECT_BIT
	CV=T0_KAOS_RUN_AREA7_CACHEABLE
	CP=T0_KAOS_RUN_AREA7_CACHEABLE
	PA=T0_KAOS_RUN_AREA7_PA
	LOCK=USER_DATA_LOCK_BIT
	IE=T0_KAOS_RUN_AREA7_NONCACHEABLE
	NFO=USER_DATA_NFO_BIT
	SIZE=USER_DATA_SIZE
MMU_MAP_END
#endif

#if defined(T0_KAOS_AREA8)
MMU_MAP_START
	NAME= t0_kdata_area8
	TYPE= DATA
	START_LABEL=t0_data_in_area8_start
	END_LABEL=t0_data_in_area8_end
	CONTEXT=USER_CONTEXT
	GLOBAL=USER_DATA_GLOBAL_BIT
	WRITE=USER_DATA_WRITE_BIT
	PRIV=USER_DATA_PRIV_BIT
	SIDE_EFFECT=USER_DATA_SIDE_EFFECT_BIT
	CV=T0_KAOS_RUN_AREA8_CACHEABLE
	CP=T0_KAOS_RUN_AREA8_CACHEABLE
	PA=T0_KAOS_RUN_AREA8_PA
	LOCK=USER_DATA_LOCK_BIT
	IE=T0_KAOS_RUN_AREA8_NONCACHEABLE
	NFO=USER_DATA_NFO_BIT
	SIZE=USER_DATA_SIZE
MMU_MAP_END
#endif

#if defined(T0_KAOS_AREA9)
MMU_MAP_START
	NAME= t0_kdata_area9
	TYPE= DATA
	START_LABEL=t0_data_in_area9_start
	END_LABEL=t0_data_in_area9_end
	CONTEXT=USER_CONTEXT
	GLOBAL=USER_DATA_GLOBAL_BIT
	WRITE=USER_DATA_WRITE_BIT
	PRIV=USER_DATA_PRIV_BIT
	SIDE_EFFECT=USER_DATA_SIDE_EFFECT_BIT
	CV=T0_KAOS_RUN_AREA9_CACHEABLE
	CP=T0_KAOS_RUN_AREA9_CACHEABLE
	PA=T0_KAOS_RUN_AREA9_PA
	LOCK=USER_DATA_LOCK_BIT
	IE=T0_KAOS_RUN_AREA9_NONCACHEABLE
	NFO=USER_DATA_NFO_BIT
	SIZE=USER_DATA_SIZE
MMU_MAP_END
#endif

#if defined(T0_KAOS_AREA10)
MMU_MAP_START
	NAME= t0_kdata_area10
	TYPE= DATA
	START_LABEL=t0_data_in_area10_start
	END_LABEL=t0_data_in_area10_end
	CONTEXT=USER_CONTEXT
	GLOBAL=USER_DATA_GLOBAL_BIT
	WRITE=USER_DATA_WRITE_BIT
	PRIV=USER_DATA_PRIV_BIT
	SIDE_EFFECT=USER_DATA_SIDE_EFFECT_BIT
	CV=T0_KAOS_RUN_AREA10_CACHEABLE
	CP=T0_KAOS_RUN_AREA10_CACHEABLE
	PA=T0_KAOS_RUN_AREA10_PA
	LOCK=USER_DATA_LOCK_BIT
	IE=T0_KAOS_RUN_AREA10_NONCACHEABLE
	NFO=USER_DATA_NFO_BIT
	SIZE=USER_DATA_SIZE
MMU_MAP_END
#endif

#if defined(T0_KAOS_AREA11)
MMU_MAP_START
	NAME= t0_kdata_area11
	TYPE= DATA
	START_LABEL=t0_data_in_area11_start
	END_LABEL=t0_data_in_area11_end
	CONTEXT=USER_CONTEXT
	GLOBAL=USER_DATA_GLOBAL_BIT
	WRITE=USER_DATA_WRITE_BIT
	PRIV=USER_DATA_PRIV_BIT
	SIDE_EFFECT=USER_DATA_SIDE_EFFECT_BIT
	CV=T0_KAOS_RUN_AREA11_CACHEABLE
	CP=T0_KAOS_RUN_AREA11_CACHEABLE
	PA=T0_KAOS_RUN_AREA11_PA
	LOCK=USER_DATA_LOCK_BIT
	IE=T0_KAOS_RUN_AREA11_NONCACHEABLE
	NFO=USER_DATA_NFO_BIT
	SIZE=USER_DATA_SIZE
MMU_MAP_END
#endif

#if defined(T0_KAOS_AREA12)
MMU_MAP_START
	NAME= t0_kdata_area12
	TYPE= DATA
	START_LABEL=t0_data_in_area12_start
	END_LABEL=t0_data_in_area12_end
	CONTEXT=USER_CONTEXT
	GLOBAL=USER_DATA_GLOBAL_BIT
	WRITE=USER_DATA_WRITE_BIT
	PRIV=USER_DATA_PRIV_BIT
	SIDE_EFFECT=USER_DATA_SIDE_EFFECT_BIT
	CV=T0_KAOS_RUN_AREA12_CACHEABLE
	CP=T0_KAOS_RUN_AREA12_CACHEABLE
	PA=T0_KAOS_RUN_AREA12_PA
	LOCK=USER_DATA_LOCK_BIT
	IE=T0_KAOS_RUN_AREA12_NONCACHEABLE
	NFO=USER_DATA_NFO_BIT
	SIZE=USER_DATA_SIZE
MMU_MAP_END
#endif

#if defined(T0_KAOS_AREA13)
MMU_MAP_START
	NAME= t0_kdata_area13
	TYPE= DATA
	START_LABEL=t0_data_in_area13_start
	END_LABEL=t0_data_in_area13_end
	CONTEXT=USER_CONTEXT
	GLOBAL=USER_DATA_GLOBAL_BIT
	WRITE=USER_DATA_WRITE_BIT
	PRIV=USER_DATA_PRIV_BIT
	SIDE_EFFECT=USER_DATA_SIDE_EFFECT_BIT
	CV=T0_KAOS_RUN_AREA13_CACHEABLE
	CP=T0_KAOS_RUN_AREA13_CACHEABLE
	PA=T0_KAOS_RUN_AREA13_PA
	LOCK=USER_DATA_LOCK_BIT
	IE=T0_KAOS_RUN_AREA13_NONCACHEABLE
	NFO=USER_DATA_NFO_BIT
	SIZE=USER_DATA_SIZE
MMU_MAP_END
#endif

#if defined(T0_KAOS_AREA14)
MMU_MAP_START
	NAME= t0_kdata_area14
	TYPE= DATA
	START_LABEL=t0_data_in_area14_start
	END_LABEL=t0_data_in_area14_end
	CONTEXT=USER_CONTEXT
	GLOBAL=USER_DATA_GLOBAL_BIT
	WRITE=USER_DATA_WRITE_BIT
	PRIV=USER_DATA_PRIV_BIT
	SIDE_EFFECT=USER_DATA_SIDE_EFFECT_BIT
	CV=T0_KAOS_RUN_AREA14_CACHEABLE
	CP=T0_KAOS_RUN_AREA14_CACHEABLE
	PA=T0_KAOS_RUN_AREA14_PA
	LOCK=USER_DATA_LOCK_BIT
	IE=T0_KAOS_RUN_AREA14_NONCACHEABLE
	NFO=USER_DATA_NFO_BIT
	SIZE=USER_DATA_SIZE
MMU_MAP_END
#endif

#if defined(T0_KAOS_AREA15)
MMU_MAP_START
	NAME= t0_kdata_area15
	TYPE= DATA
	START_LABEL=t0_data_in_area15_start
	END_LABEL=t0_data_in_area15_end
	CONTEXT=USER_CONTEXT
	GLOBAL=USER_DATA_GLOBAL_BIT
	WRITE=USER_DATA_WRITE_BIT
	PRIV=USER_DATA_PRIV_BIT
	SIDE_EFFECT=USER_DATA_SIDE_EFFECT_BIT
	CV=T0_KAOS_RUN_AREA15_CACHEABLE
	CP=T0_KAOS_RUN_AREA15_CACHEABLE
	PA=T0_KAOS_RUN_AREA15_PA
	LOCK=USER_DATA_LOCK_BIT
	IE=T0_KAOS_RUN_AREA15_NONCACHEABLE
	NFO=USER_DATA_NFO_BIT
	SIZE=USER_DATA_SIZE
MMU_MAP_END
#endif

#if defined(T0_KAOS_SHM_AREA)
MMU_MAP_START
        NAME= t0_kdata_shm_in_area
        TYPE= DATA
        START_LABEL=t0_data_in_shm_area_start
        END_LABEL=t0_data_in_shm_area_end
        CONTEXT=USER_CONTEXT
        GLOBAL=USER_DATA_GLOBAL_BIT
        WRITE=USER_DATA_WRITE_BIT
        PRIV=USER_DATA_PRIV_BIT
        SIDE_EFFECT=USER_DATA_SIDE_EFFECT_BIT
        CV=T0_KAOS_RUN_SHM_AREA_CACHEABLE
        CP=T0_KAOS_RUN_SHM_AREA_CACHEABLE
        PA=T0_KAOS_RUN_SHM_AREA_PA
        LOCK=USER_DATA_LOCK_BIT
        IE=T0_KAOS_RUN_SHM_AREA_NONCACHEABLE
        NFO=USER_DATA_NFO_BIT
        SIZE=USER_DATA_SIZE
MMU_MAP_END
#endif


/************************************************************************
   Map kaos expected data
 ************************************************************************/
#if defined(T0_KAOS_TWOPASS) || defined(T0_KAOS_VERIFY)

MMU_MAP_START
	NAME= t0_kdata_exp_regs
	TYPE= DATA
	START_LABEL=t0_data_exp_regs_start
	END_LABEL=t0_data_exp_regs_end
	CONTEXT=USER_CONTEXT
	GLOBAL=USER_DATA_GLOBAL_BIT
	WRITE=USER_DATA_WRITE_BIT
	PRIV=USER_DATA_PRIV_BIT
	SIDE_EFFECT=USER_DATA_SIDE_EFFECT_BIT
	LOCK=USER_DATA_LOCK_BIT
	CV=T0_KAOS_EXP_REGS_CACHEABLE
	CP=T0_KAOS_EXP_REGS_CACHEABLE
	PA=T0_KAOS_EXP_REGS_PA
	IE=T0_KAOS_EXP_REGS_NONCACHEABLE
	NFO=USER_DATA_NFO_BIT
	SIZE=USER_DATA_SIZE
MMU_MAP_END

#if defined(T0_KAOS_AREA0)
MMU_MAP_START
	NAME= t0_kdata_exp_area0
	TYPE= DATA
	START_LABEL=t0_data_exp_area0_start
	END_LABEL=t0_data_exp_area0_end
	CONTEXT=USER_CONTEXT
	GLOBAL=USER_DATA_GLOBAL_BIT
	WRITE=USER_DATA_WRITE_BIT
	PRIV=USER_DATA_PRIV_BIT
	SIDE_EFFECT=USER_DATA_SIDE_EFFECT_BIT
	CV=T0_KAOS_EXP_AREA0_CACHEABLE
	CP=T0_KAOS_EXP_AREA0_CACHEABLE
	PA=T0_KAOS_EXP_AREA0_PA
	LOCK=USER_DATA_LOCK_BIT
	IE=T0_KAOS_EXP_AREA0_NONCACHEABLE
	NFO=USER_DATA_NFO_BIT
	SIZE=USER_DATA_SIZE
MMU_MAP_END
#endif

#if defined(T0_KAOS_AREA1)
MMU_MAP_START
	NAME= t0_kdata_exp_area1
	TYPE= DATA
	START_LABEL=t0_data_exp_area1_start
	END_LABEL=t0_data_exp_area1_end
	CONTEXT=USER_CONTEXT
	GLOBAL=USER_DATA_GLOBAL_BIT
	WRITE=USER_DATA_WRITE_BIT
	PRIV=USER_DATA_PRIV_BIT
	SIDE_EFFECT=USER_DATA_SIDE_EFFECT_BIT
	CV=T0_KAOS_EXP_AREA1_CACHEABLE
	CP=T0_KAOS_EXP_AREA1_CACHEABLE
	PA=T0_KAOS_EXP_AREA1_PA
	LOCK=USER_DATA_LOCK_BIT
	IE=T0_KAOS_EXP_AREA1_NONCACHEABLE
	NFO=USER_DATA_NFO_BIT
	SIZE=USER_DATA_SIZE
MMU_MAP_END
#endif

#if defined(T0_KAOS_AREA2)
MMU_MAP_START
	NAME= t0_kdata_exp_area2
	TYPE= DATA
	START_LABEL=t0_data_exp_area2_start
	END_LABEL=t0_data_exp_area2_end
	CONTEXT=USER_CONTEXT
	GLOBAL=USER_DATA_GLOBAL_BIT
	WRITE=USER_DATA_WRITE_BIT
	PRIV=USER_DATA_PRIV_BIT
	SIDE_EFFECT=USER_DATA_SIDE_EFFECT_BIT
	CV=T0_KAOS_EXP_AREA2_CACHEABLE
	CP=T0_KAOS_EXP_AREA2_CACHEABLE
	PA=T0_KAOS_EXP_AREA2_PA
	LOCK=USER_DATA_LOCK_BIT
	IE=T0_KAOS_EXP_AREA2_NONCACHEABLE
	NFO=USER_DATA_NFO_BIT
	SIZE=USER_DATA_SIZE
MMU_MAP_END
#endif

#if defined(T0_KAOS_AREA3)
MMU_MAP_START
	NAME= t0_kdata_exp_area3
	TYPE= DATA
	START_LABEL=t0_data_exp_area3_start
	END_LABEL=t0_data_exp_area3_end
	CONTEXT=USER_CONTEXT
	GLOBAL=USER_DATA_GLOBAL_BIT
	WRITE=USER_DATA_WRITE_BIT
	PRIV=USER_DATA_PRIV_BIT
	SIDE_EFFECT=USER_DATA_SIDE_EFFECT_BIT
	CV=T0_KAOS_EXP_AREA3_CACHEABLE
	CP=T0_KAOS_EXP_AREA3_CACHEABLE
	PA=T0_KAOS_EXP_AREA3_PA
	LOCK=USER_DATA_LOCK_BIT
	IE=T0_KAOS_EXP_AREA3_NONCACHEABLE
	NFO=USER_DATA_NFO_BIT
	SIZE=USER_DATA_SIZE
MMU_MAP_END
#endif

#if defined(T0_KAOS_AREA4)
MMU_MAP_START
	NAME= t0_kdata_exp_area4
	TYPE= DATA
	START_LABEL=t0_data_exp_area4_start
	END_LABEL=t0_data_exp_area4_end
	CONTEXT=USER_CONTEXT
	GLOBAL=USER_DATA_GLOBAL_BIT
	WRITE=USER_DATA_WRITE_BIT
	PRIV=USER_DATA_PRIV_BIT
	SIDE_EFFECT=USER_DATA_SIDE_EFFECT_BIT
	CV=T0_KAOS_EXP_AREA4_CACHEABLE
	CP=T0_KAOS_EXP_AREA4_CACHEABLE
	PA=T0_KAOS_EXP_AREA4_PA
	LOCK=USER_DATA_LOCK_BIT
	IE=T0_KAOS_EXP_AREA4_NONCACHEABLE
	NFO=USER_DATA_NFO_BIT
	SIZE=USER_DATA_SIZE
MMU_MAP_END
#endif

#if defined(T0_KAOS_AREA5)
MMU_MAP_START
	NAME= t0_kdata_exp_area5
	TYPE= DATA
	START_LABEL=t0_data_exp_area5_start
	END_LABEL=t0_data_exp_area5_end
	CONTEXT=USER_CONTEXT
	GLOBAL=USER_DATA_GLOBAL_BIT
	WRITE=USER_DATA_WRITE_BIT
	PRIV=USER_DATA_PRIV_BIT
	SIDE_EFFECT=USER_DATA_SIDE_EFFECT_BIT
	CV=T0_KAOS_EXP_AREA5_CACHEABLE
	CP=T0_KAOS_EXP_AREA5_CACHEABLE
	PA=T0_KAOS_EXP_AREA5_PA
	LOCK=USER_DATA_LOCK_BIT
	IE=T0_KAOS_EXP_AREA5_NONCACHEABLE
	NFO=USER_DATA_NFO_BIT
	SIZE=USER_DATA_SIZE
MMU_MAP_END
#endif

#if defined(T0_KAOS_AREA6)
MMU_MAP_START
	NAME= t0_kdata_exp_area6
	TYPE= DATA
	START_LABEL=t0_data_exp_area6_start
	END_LABEL=t0_data_exp_area6_end
	CONTEXT=USER_CONTEXT
	GLOBAL=USER_DATA_GLOBAL_BIT
	WRITE=USER_DATA_WRITE_BIT
	PRIV=USER_DATA_PRIV_BIT
	SIDE_EFFECT=USER_DATA_SIDE_EFFECT_BIT
	CV=T0_KAOS_EXP_AREA6_CACHEABLE
	CP=T0_KAOS_EXP_AREA6_CACHEABLE
	PA=T0_KAOS_EXP_AREA6_PA
	LOCK=USER_DATA_LOCK_BIT
	IE=T0_KAOS_EXP_AREA6_NONCACHEABLE
	NFO=USER_DATA_NFO_BIT
	SIZE=USER_DATA_SIZE
MMU_MAP_END
#endif

#if defined(T0_KAOS_AREA7)
MMU_MAP_START
	NAME= t0_kdata_exp_area7
	TYPE= DATA
	START_LABEL=t0_data_exp_area7_start
	END_LABEL=t0_data_exp_area7_end
	CONTEXT=USER_CONTEXT
	GLOBAL=USER_DATA_GLOBAL_BIT
	WRITE=USER_DATA_WRITE_BIT
	PRIV=USER_DATA_PRIV_BIT
	SIDE_EFFECT=USER_DATA_SIDE_EFFECT_BIT
	CV=T0_KAOS_EXP_AREA7_CACHEABLE
	CP=T0_KAOS_EXP_AREA7_CACHEABLE
	PA=T0_KAOS_EXP_AREA7_PA
	LOCK=USER_DATA_LOCK_BIT
	IE=T0_KAOS_EXP_AREA7_NONCACHEABLE
	NFO=USER_DATA_NFO_BIT
	SIZE=USER_DATA_SIZE
MMU_MAP_END
#endif

#if defined(T0_KAOS_AREA8)
MMU_MAP_START
	NAME= t0_kdata_exp_area8
	TYPE= DATA
	START_LABEL=t0_data_exp_area8_start
	END_LABEL=t0_data_exp_area8_end
	CONTEXT=USER_CONTEXT
	GLOBAL=USER_DATA_GLOBAL_BIT
	WRITE=USER_DATA_WRITE_BIT
	PRIV=USER_DATA_PRIV_BIT
	SIDE_EFFECT=USER_DATA_SIDE_EFFECT_BIT
	CV=T0_KAOS_EXP_AREA8_CACHEABLE
	CP=T0_KAOS_EXP_AREA8_CACHEABLE
	PA=T0_KAOS_EXP_AREA8_PA
	LOCK=USER_DATA_LOCK_BIT
	IE=T0_KAOS_EXP_AREA8_NONCACHEABLE
	NFO=USER_DATA_NFO_BIT
	SIZE=USER_DATA_SIZE
MMU_MAP_END
#endif

#if defined(T0_KAOS_AREA9)
MMU_MAP_START
	NAME=t0_kdata_exp_area9
	TYPE=DATA
	START_LABEL=t0_data_exp_area9_start
	END_LABEL=t0_data_exp_area9_end
	CONTEXT=USER_CONTEXT
	GLOBAL=USER_DATA_GLOBAL_BIT
	WRITE=USER_DATA_WRITE_BIT
	PRIV=USER_DATA_PRIV_BIT
	SIDE_EFFECT=USER_DATA_SIDE_EFFECT_BIT
	CV=T0_KAOS_EXP_AREA9_CACHEABLE
	CP=T0_KAOS_EXP_AREA9_CACHEABLE
	PA=T0_KAOS_EXP_AREA9_PA
	LOCK=USER_DATA_LOCK_BIT
	IE=T0_KAOS_EXP_AREA9_NONCACHEABLE
	NFO=USER_DATA_NFO_BIT
	SIZE=USER_DATA_SIZE
MMU_MAP_END
#endif

#if defined(T0_KAOS_AREA10)
MMU_MAP_START
	NAME=t0_kdata_exp_area10
	TYPE=DATA
	START_LABEL=t0_data_exp_area10_start
	END_LABEL=t0_data_exp_area10_end
	CONTEXT=USER_CONTEXT
	GLOBAL=USER_DATA_GLOBAL_BIT
	WRITE=USER_DATA_WRITE_BIT
	PRIV=USER_DATA_PRIV_BIT
	SIDE_EFFECT=USER_DATA_SIDE_EFFECT_BIT
	CV=T0_KAOS_EXP_AREA10_CACHEABLE
	CP=T0_KAOS_EXP_AREA10_CACHEABLE
	PA=T0_KAOS_EXP_AREA10_PA
	LOCK=USER_DATA_LOCK_BIT
	IE=T0_KAOS_EXP_AREA10_NONCACHEABLE
	NFO=USER_DATA_NFO_BIT
	SIZE=USER_DATA_SIZE
MMU_MAP_END
#endif

#if defined(T0_KAOS_AREA11)
MMU_MAP_START
	NAME=t0_kdata_exp_area11
	TYPE=DATA
	START_LABEL=t0_data_exp_area11_start
	END_LABEL=t0_data_exp_area11_end
	CONTEXT=USER_CONTEXT
	GLOBAL=USER_DATA_GLOBAL_BIT
	WRITE=USER_DATA_WRITE_BIT
	PRIV=USER_DATA_PRIV_BIT
	SIDE_EFFECT=USER_DATA_SIDE_EFFECT_BIT
	CV=T0_KAOS_EXP_AREA11_CACHEABLE
	CP=T0_KAOS_EXP_AREA11_CACHEABLE
	PA=T0_KAOS_EXP_AREA11_PA
	LOCK=USER_DATA_LOCK_BIT
	IE=T0_KAOS_EXP_AREA11_NONCACHEABLE
	NFO=USER_DATA_NFO_BIT
	SIZE=USER_DATA_SIZE
MMU_MAP_END
#endif

#if defined(T0_KAOS_AREA12)
MMU_MAP_START
	NAME=t0_kdata_exp_area12
	TYPE=DATA
	START_LABEL=t0_data_exp_area12_start
	END_LABEL=t0_data_exp_area12_end
	CONTEXT=USER_CONTEXT
	GLOBAL=USER_DATA_GLOBAL_BIT
	WRITE=USER_DATA_WRITE_BIT
	PRIV=USER_DATA_PRIV_BIT
	SIDE_EFFECT=USER_DATA_SIDE_EFFECT_BIT
	CV=T0_KAOS_EXP_AREA12_CACHEABLE
	CP=T0_KAOS_EXP_AREA12_CACHEABLE
	PA=T0_KAOS_EXP_AREA12_PA
	LOCK=USER_DATA_LOCK_BIT
	IE=T0_KAOS_EXP_AREA12_NONCACHEABLE
	NFO=USER_DATA_NFO_BIT
	SIZE=USER_DATA_SIZE
MMU_MAP_END
#endif

#if defined(T0_KAOS_AREA13)
MMU_MAP_START
	NAME=t0_kdata_exp_area13
	TYPE=DATA
	START_LABEL=t0_data_exp_area13_start
	END_LABEL=t0_data_exp_area13_end
	CONTEXT=USER_CONTEXT
	GLOBAL=USER_DATA_GLOBAL_BIT
	WRITE=USER_DATA_WRITE_BIT
	PRIV=USER_DATA_PRIV_BIT
	SIDE_EFFECT=USER_DATA_SIDE_EFFECT_BIT
	CV=T0_KAOS_EXP_AREA13_CACHEABLE
	CP=T0_KAOS_EXP_AREA13_CACHEABLE
	PA=T0_KAOS_EXP_AREA13_PA
	LOCK=USER_DATA_LOCK_BIT
	IE=T0_KAOS_EXP_AREA13_NONCACHEABLE
	NFO=USER_DATA_NFO_BIT
	SIZE=USER_DATA_SIZE
MMU_MAP_END
#endif

#if defined(T0_KAOS_AREA14)
MMU_MAP_START
	NAME=t0_kdata_exp_area14
	TYPE=DATA
	START_LABEL=t0_data_exp_area14_start
	END_LABEL=t0_data_exp_area14_end
	CONTEXT=USER_CONTEXT
	GLOBAL=USER_DATA_GLOBAL_BIT
	WRITE=USER_DATA_WRITE_BIT
	PRIV=USER_DATA_PRIV_BIT
	SIDE_EFFECT=USER_DATA_SIDE_EFFECT_BIT
	CV=T0_KAOS_EXP_AREA14_CACHEABLE
	CP=T0_KAOS_EXP_AREA14_CACHEABLE
	PA=T0_KAOS_EXP_AREA14_PA
	LOCK=USER_DATA_LOCK_BIT
	IE=T0_KAOS_EXP_AREA14_NONCACHEABLE
	NFO=USER_DATA_NFO_BIT
	SIZE=USER_DATA_SIZE
MMU_MAP_END
#endif

#if defined(T0_KAOS_AREA15)
MMU_MAP_START
	NAME=t0_kdata_exp_area15
	TYPE=DATA
	START_LABEL=t0_data_exp_area15_start
	END_LABEL=t0_data_exp_area15_end
	CONTEXT=USER_CONTEXT
	GLOBAL=USER_DATA_GLOBAL_BIT
	WRITE=USER_DATA_WRITE_BIT
	PRIV=USER_DATA_PRIV_BIT
	SIDE_EFFECT=USER_DATA_SIDE_EFFECT_BIT
	CV=T0_KAOS_EXP_AREA15_CACHEABLE
	CP=T0_KAOS_EXP_AREA15_CACHEABLE
	PA=T0_KAOS_EXP_AREA15_PA
	LOCK=USER_DATA_LOCK_BIT
	IE=T0_KAOS_EXP_AREA15_NONCACHEABLE
	NFO=USER_DATA_NFO_BIT
	SIZE=USER_DATA_SIZE
MMU_MAP_END
#endif

#if defined(T0_KAOS_SHM_AREA)
MMU_MAP_START
        NAME= t0_kdata_shm_exp_area
        TYPE= DATA
        START_LABEL=t0_data_exp_shm_area_start
        END_LABEL=t0_data_exp_shm_area_end
        CONTEXT=USER_CONTEXT
        GLOBAL=USER_DATA_GLOBAL_BIT
        WRITE=USER_DATA_WRITE_BIT
        PRIV=USER_DATA_PRIV_BIT
        SIDE_EFFECT=USER_DATA_SIDE_EFFECT_BIT
        CV=T0_KAOS_EXP_SHM_AREA_CACHEABLE
        CP=T0_KAOS_EXP_SHM_AREA_CACHEABLE
        PA=T0_KAOS_EXP_SHM_AREA_PA
        LOCK=USER_DATA_LOCK_BIT
        IE=T0_KAOS_EXP_SHM_AREA_NONCACHEABLE
        NFO=USER_DATA_NFO_BIT
        SIZE=USER_DATA_SIZE
MMU_MAP_END
#endif

MMU_MAP_START
        NAME=t0_offset_data
        TYPE=DATA
        START_LABEL=t0_offset_table_start
        END_LABEL=t0_offset_table_end
        CONTEXT=USER_CONTEXT
        GLOBAL=0
        WRITE=1
        PRIV=0
        SIDE_EFFECT=0
        CV=T0_KAOS_OFFSET_TBL_CACHEABLE
        CP=T0_KAOS_OFFSET_TBL_CACHEABLE
        LOCK=0
        PA=T0_KAOS_OFFSET_TBL_PA
        IE=0
        NFO=0
        SIZE=8K
MMU_MAP_END

#endif

/************************************************************************
   Map trap tables
   This is just to emit the code. The mapping is jammed into the TLB
   by reset.s.
 ************************************************************************/

MMU_MAP_START
	NAME= trap_text
	TYPE= TEXT
	START_LABEL=trap_text_start
	END_LABEL=trap_text_end
	PA=0
	SIZE=8K
	CP=1
	CV=1
	CONTEXT=0
	NFO=0
	IE=0
	PRIV=0
	WRITE=0
	LOCK=0
	ENTRY = OFF
MMU_MAP_END	

/************************************************************************
   Map 16kb of nops to overwrite the trap table text
 ************************************************************************/

MMU_MAP_START
        NAME= illtrap_text
        TYPE= TEXT
        START_LABEL=illtrap_text_start
        END_LABEL=illtrap_text_end
        PA=0x100000
        SIZE=8K
        CP=1
        CV=1
        CONTEXT=USER_CONTEXT
        NFO=0
        IE=0
        PRIV=0
        WRITE=0
        LOCK=0
        ENTRY = OFF
MMU_MAP_END

/************************************************************************
   Map _ktbl in both immu and dmmu
 ************************************************************************/

MMU_MAP_START
	NAME= t0_ktbl_text
	TYPE= TEXT_AND_DATA
	START_LABEL=t0_ktbl_page_begin
	END_LABEL=t0_ktbl_page_end
	CONTEXT=USER_CONTEXT
	GLOBAL=0
	WRITE=1
	PRIV=0
	SIDE_EFFECT=0
	CV=T0_KAOS_KTBL_CACHEABLE
	CP=T0_KAOS_KTBL_CACHEABLE
	PA=T0_KAOS_KTBL_PA
	LOCK=0
	IE=T0_KAOS_KTBL_NONCACHEABLE
	NFO=0
	SIZE=8K
MMU_MAP_END

/************************************************************************
   Map kaos_boot code
 ************************************************************************/

MMU_MAP_START
        NAME= kaos_boot
        TYPE= TEXT
        START_LABEL=user_text_start
        END_LABEL=user_text_end
        CONTEXT=USER_TEXT_CONTEXT
        GLOBAL=USER_TEXT_GLOBAL_BIT
        WRITE=USER_TEXT_WRITE_BIT
        PRIV=USER_TEXT_PRIV_BIT
        SIDE_EFFECT=USER_TEXT_SIDE_EFFECT_BIT
        CV=USER_TEXT_CV_BIT
        CP=USER_TEXT_CP_BIT
        LOCK=USER_TEXT_LOCK_BIT
        PA=T0_KAOS_BOOT_PA
        IE=USER_TEXT_IE_BIT
        NFO=USER_TEXT_NFO_BIT
        SIZE=USER_TEXT_SIZE
MMU_MAP_END

/************************************************************************
	Map GOOD TRAP handler to local trap handler for MEM_CHK option of churn
 ************************************************************************/

MMU_MAP_START
        NAME=kaos_done
        TYPE=TEXT
        START_LABEL=local_good_trap_start
        END_LABEL=local_good_trap_end
        CONTEXT=0
        GLOBAL=0
        WRITE=0
        PRIV=1
        SIDE_EFFECT=0
        CV=T0_KAOS_DONE_CACHEABLE
        CP=T0_KAOS_DONE_CACHEABLE
        LOCK=0
        PA=T0_KAOS_DONE_PA
        IE=0
        NFO=0
        SIZE=USER_TEXT_SIZE
MMU_MAP_END


/************************************************************************
   Map kaos_startup code
 ************************************************************************/

MMU_MAP_START
        NAME= kaos_startup
        TYPE= TEXT
        START_LABEL=_kaos_page_begin
        END_LABEL=_kaos_page_end
        CONTEXT=USER_CONTEXT
        GLOBAL=USER_TEXT_GLOBAL_BIT
        WRITE=USER_TEXT_WRITE_BIT
        PRIV=USER_TEXT_PRIV_BIT
        SIDE_EFFECT=USER_TEXT_SIDE_EFFECT_BIT
        CV=T0_KAOS_STARTUP_CACHEABLE
        CP=T0_KAOS_STARTUP_CACHEABLE
        LOCK=USER_TEXT_LOCK_BIT
        PA=T0_KAOS_STARTUP_PA
        IE=USER_TEXT_IE_BIT
        NFO=USER_TEXT_NFO_BIT
        SIZE=USER_TEXT_SIZE
MMU_MAP_END

/************************************************************************
   Map cacheable reset handler
   This is just to emit the code. The mapping is jammed into the TLB
   by reset.s.
 ************************************************************************/

MMU_MAP_START
	NAME= reset_text
	TYPE= TEXT
	START_LABEL=reset_text_start
	END_LABEL=reset_text_end
	PA=8000
	SIZE=8K
	CP=1
	CV=1
	CONTEXT=0
	NFO=0
	IE=0
	PRIV=0
	WRITE=0
	LOCK=0
	ENTRY = OFF
MMU_MAP_END	

MMU_MAP_START
        NAME = special_trap_handler
        TYPE =TEXT
        START_LABEL = special_trap_handler_start
        END_LABEL = special_trap_handler_end
        PA=0xe000
        CP=1
        ENTRY= OFF
MMU_MAP_END

/************************************************************************
   Test case end
 ************************************************************************/

#endif ! non-NIAGARA code


/************************************************************************
   Test case end
 ************************************************************************/
#if defined(NIAGARA2)

!
! If we are verifying, then two pass mode disabled
!
#if defined(T0_KAOS_VERIFY)
#if defined(T0_KAOS_TWOPASS)
#undef T0_KAOS_TWOPASS
#endif
#endif


#if defined(T1_KAOS_VERIFY)
#if defined(T1_KAOS_TWOPASS)
#undef T1_KAOS_TWOPASS
#endif
#endif


!
! Get random values and do some basic selections
! Reserve T0_KAOS_RANVAL_00 for the ksim script
!
/* start ktbl.0.h */
#define T0_KAOS_NIAGARA
#define T0_KAOS_VERSION       4.2
#define T0_KAOS_SEED          d3d4c9dc4871
#define T0_KAOS_ICOUNT        5000
#define T0_KAOS_AREAS         1
#define T0_KAOS_AREASIZE      64
#define T0_KAOS_AREAOFFSET    2240
#define T0_KAOS_PAGESIZE      8192
#define T0_KAOS_CODECOUNT     5005

#define T0_KAOS_BOOT_VA                  0x04968000
#define T0_KAOS_BOOT_PA                  0x000000000017a000
#define T0_KAOS_BOOT_CACHEABLE           1
#define T0_KAOS_BOOT_NONCACHEABLE        0

#define T0_KAOS_STARTUP_VA               0x074a6000
#define T0_KAOS_STARTUP_PA               0x0000000001a42000
#define T0_KAOS_STARTUP_CACHEABLE        1
#define T0_KAOS_STARTUP_NONCACHEABLE     0

#define T0_KAOS_OFFSET_TBL_VA            0x190cc000
#define T0_KAOS_OFFSET_TBL_PA            0x0000000002fb6000
#define T0_KAOS_OFFSET_TBL_CACHEABLE     1
#define T0_KAOS_OFFSET_TBL_NONCACHEABLE  0

#define T0_KAOS_DONE_VA                  0x3cfee000
#define T0_KAOS_DONE_PA                  0x0000000003e48000
#define T0_KAOS_DONE_CACHEABLE           1
#define T0_KAOS_DONE_NONCACHEABLE        0

#define T0_KAOS_KTBL_VA                  0x30518000
#define T0_KAOS_KTBL_PA                  0x0000000004194000
#define T0_KAOS_KTBL_CACHEABLE           1
#define T0_KAOS_KTBL_NONCACHEABLE        0

#define T0_KAOS_SUBR0_VA                 0x3b84c000
#define T0_KAOS_SUBR0_PA                 0x0000000005356000
#define T0_KAOS_SUBR0_CACHEABLE          1
#define T0_KAOS_SUBR0_NONCACHEABLE       0
#define T0_KAOS_SUBR1_VA                 0x304e2000
#define T0_KAOS_SUBR1_PA                 0x0000000006f50000
#define T0_KAOS_SUBR1_CACHEABLE          1
#define T0_KAOS_SUBR1_NONCACHEABLE       0
#define T0_KAOS_SUBR2_VA                 0x3049e000
#define T0_KAOS_SUBR2_PA                 0x0000000007014000
#define T0_KAOS_SUBR2_CACHEABLE          1
#define T0_KAOS_SUBR2_NONCACHEABLE       0
#define T0_KAOS_SUBR3_VA                 0x20c42000
#define T0_KAOS_SUBR3_PA                 0x000000000867c000
#define T0_KAOS_SUBR3_CACHEABLE          1
#define T0_KAOS_SUBR3_NONCACHEABLE       0

#define T0_KAOS_EXP_REGS_VA              0x11afa000
#define T0_KAOS_EXP_REGS_PA              0x000000000915c000
#define T0_KAOS_EXP_REGS_CACHEABLE       1
#define T0_KAOS_EXP_REGS_NONCACHEABLE    0
#define T0_KAOS_RUN_REGS_VA              0x0909a000
#define T0_KAOS_RUN_REGS_PA              0x000000000a7d0000
#define T0_KAOS_RUN_REGS_CACHEABLE       1
#define T0_KAOS_RUN_REGS_NONCACHEABLE    0

#define T0_KAOS_EXP_STACK_VA             0x0688a000
#define T0_KAOS_EXP_STACK_PA             0x000000000b820000
#define T0_KAOS_EXP_STACK_CACHEABLE      1
#define T0_KAOS_EXP_STACK_NONCACHEABLE   0
#define T0_KAOS_RUN_STACK_VA             0x2f9e8000
#define T0_KAOS_RUN_STACK_PA             0x000000000c860000
#define T0_KAOS_RUN_STACK_CACHEABLE      1
#define T0_KAOS_RUN_STACK_NONCACHEABLE   0

#define T0_KAOS_AREA0
#define T0_KAOS_EXP_AREA0_VA             0x1e162000
#define T0_KAOS_EXP_AREA0_PA             0x000000000d9c2000
#define T0_KAOS_EXP_AREA0_CACHEABLE      1
#define T0_KAOS_EXP_AREA0_NONCACHEABLE   0
#define T0_KAOS_RUN_AREA0_VA             0x3d1ba000
#define T0_KAOS_RUN_AREA0_PA             0x000000000e8ba000
#define T0_KAOS_RUN_AREA0_CACHEABLE      1
#define T0_KAOS_RUN_AREA0_NONCACHEABLE   0

#define T0_KAOS_SHM_AREA
#define T0_KAOS_EXP_SHM_AREA_VA          0x1340a000
#define T0_KAOS_EXP_SHM_AREA_PA          0x00000000005fa000
#define T0_KAOS_EXP_SHM_AREA_CACHEABLE   1
#define T0_KAOS_EXP_SHM_AREA_NONCACHEABLE 0
#define T0_KAOS_RUN_SHM_AREA_VA          0x11dc2000
#define T0_KAOS_RUN_SHM_AREA_PA          0x000000000068a000
#define T0_KAOS_RUN_SHM_AREA_CACHEABLE   1
#define T0_KAOS_RUN_SHM_AREA_NONCACHEABLE 0

#define T0_KAOS_RANVAL_00     0x51223d52
#define T0_KAOS_RANVAL_01     0xdbf25235
#define T0_KAOS_RANVAL_02     0x00a21546
#define T0_KAOS_RANVAL_03     0x66a64c28
#define T0_KAOS_RANVAL_04     0x4c500bbc
#define T0_KAOS_RANVAL_05     0x7cf0c67f
#define T0_KAOS_RANVAL_06     0x2d0bad44
#define T0_KAOS_RANVAL_07     0x6d6a6323
#define T0_KAOS_RANVAL_08     0x48919bb8
#define T0_KAOS_RANVAL_09     0xfe46542e
#define T0_KAOS_RANVAL_0a     0x885eb8ff
#define T0_KAOS_RANVAL_0b     0x9aee52d4
#define T0_KAOS_RANVAL_0c     0xec84217c
#define T0_KAOS_RANVAL_0d     0x56ec0aa9
#define T0_KAOS_RANVAL_0e     0xb2bd4015
#define T0_KAOS_RANVAL_0f     0x7b02e110
#define T0_KAOS_RANVAL_10     0xcf025bfe
#define T0_KAOS_RANVAL_11     0x3598f9d4
#define T0_KAOS_RANVAL_12     0x094aa0aa
#define T0_KAOS_RANVAL_13     0x73e41534
#define T0_KAOS_RANVAL_14     0x59ecda92
#define T0_KAOS_RANVAL_15     0xe9c930ed
#define T0_KAOS_RANVAL_16     0xea8887af
#define T0_KAOS_RANVAL_17     0x3f8c0510
#define T0_KAOS_RANVAL_18     0x5f7e78d7
#define T0_KAOS_RANVAL_19     0xce355698
#define T0_KAOS_RANVAL_1a     0x0854a966
#define T0_KAOS_RANVAL_1b     0x5a30fd22
#define T0_KAOS_RANVAL_1c     0xa61234d4
#define T0_KAOS_RANVAL_1d     0x2ba32e37
#define T0_KAOS_RANVAL_1e     0x13eafe25
#define T0_KAOS_RANVAL_1f     0x3e817806
#define T0_KAOS_RANVAL_20     0x24edc35d
#define T0_KAOS_RANVAL_21     0xa0a89e7f
#define T0_KAOS_RANVAL_22     0x8c488759
#define T0_KAOS_RANVAL_23     0x1a63992d
#define T0_KAOS_RANVAL_24     0x37f686bb
#define T0_KAOS_RANVAL_25     0x52800d48
#define T0_KAOS_RANVAL_26     0xd286e0cd
#define T0_KAOS_RANVAL_27     0xa1251ecd
#define T0_KAOS_RANVAL_28     0xd66ccb8b
#define T0_KAOS_RANVAL_29     0x4da624a3
#define T0_KAOS_RANVAL_2a     0x1289222c
#define T0_KAOS_RANVAL_2b     0xcd63ff18
#define T0_KAOS_RANVAL_2c     0x24236fe6
#define T0_KAOS_RANVAL_2d     0xa7e65531
#define T0_KAOS_RANVAL_2e     0xfcd6d4c4
#define T0_KAOS_RANVAL_2f     0x44c724af
#define T0_KAOS_RANVAL_30     0x336858c2
#define T0_KAOS_RANVAL_31     0xd9fca9b2
#define T0_KAOS_RANVAL_32     0xb90a018c
#define T0_KAOS_RANVAL_33     0xd521fe59
#define T0_KAOS_RANVAL_34     0xd2345997
#define T0_KAOS_RANVAL_35     0xea48bfdc
#define T0_KAOS_RANVAL_36     0x1b019b68
#define T0_KAOS_RANVAL_37     0x5514d5ef
#define T0_KAOS_RANVAL_38     0xfd7f7245
#define T0_KAOS_RANVAL_39     0xfd76fa6d
#define T0_KAOS_RANVAL_3a     0xc059c9aa
#define T0_KAOS_RANVAL_3b     0x6ce7229b
#define T0_KAOS_RANVAL_3c     0x6c008734
#define T0_KAOS_RANVAL_3d     0xa2c24083
#define T0_KAOS_RANVAL_3e     0xd3bfd6dc
#define T0_KAOS_RANVAL_3f     0x3e784a41
#define T0_KAOS_RANVAL_40     0x4c6df7bc
#define T0_KAOS_RANVAL_41     0x38c1de2b
#define T0_KAOS_RANVAL_42     0x50cfc7bc
#define T0_KAOS_RANVAL_43     0x0ff6863c
#define T0_KAOS_RANVAL_44     0x34c6b6c7
#define T0_KAOS_RANVAL_45     0x6adc5a37
#define T0_KAOS_RANVAL_46     0x9185de87
#define T0_KAOS_RANVAL_47     0x7bd2df4d
#define T0_KAOS_RANVAL_48     0x9e81c9b5
#define T0_KAOS_RANVAL_49     0x6fb15553
#define T0_KAOS_RANVAL_4a     0xfe2e8e7a
#define T0_KAOS_RANVAL_4b     0xe46474cf
#define T0_KAOS_RANVAL_4c     0x90fc517f
#define T0_KAOS_RANVAL_4d     0x1b59c65a
#define T0_KAOS_RANVAL_4e     0xfe63a395
#define T0_KAOS_RANVAL_4f     0x221c832f
#define T0_KAOS_RANVAL_50     0x165c821e
#define T0_KAOS_RANVAL_51     0x567f27e5
#define T0_KAOS_RANVAL_52     0xdd4da2a2
#define T0_KAOS_RANVAL_53     0x6b4fdd9c
#define T0_KAOS_RANVAL_54     0x39a22c2d
#define T0_KAOS_RANVAL_55     0x423f6b25
#define T0_KAOS_RANVAL_56     0x914ca575
#define T0_KAOS_RANVAL_57     0x13b1cefa
#define T0_KAOS_RANVAL_58     0xed03bccd
#define T0_KAOS_RANVAL_59     0x79dcc3f2
#define T0_KAOS_RANVAL_5a     0x1f9c3774
#define T0_KAOS_RANVAL_5b     0xf2e7961b
#define T0_KAOS_RANVAL_5c     0xd040d7c8
#define T0_KAOS_RANVAL_5d     0x0b95a223
#define T0_KAOS_RANVAL_5e     0x4bb9f659
#define T0_KAOS_RANVAL_5f     0x745af130
#define T0_KAOS_RANVAL_60     0x3d81eff8
#define T0_KAOS_RANVAL_61     0x0af26c20
#define T0_KAOS_RANVAL_62     0x108efb36
#define T0_KAOS_RANVAL_63     0xa9e56c7d
#define T0_KAOS_RANVAL_64     0xcaee81e9
#define T0_KAOS_RANVAL_65     0xfd9bceb4
#define T0_KAOS_RANVAL_66     0xf2d84fb9
#define T0_KAOS_RANVAL_67     0x4e55684b
#define T0_KAOS_RANVAL_68     0xf599d4bd
#define T0_KAOS_RANVAL_69     0xe1a5b627
#define T0_KAOS_RANVAL_6a     0x014af3b1
#define T0_KAOS_RANVAL_6b     0xbf690a23
#define T0_KAOS_RANVAL_6c     0x7a006550
#define T0_KAOS_RANVAL_6d     0x8668448b
#define T0_KAOS_RANVAL_6e     0x83b436d0
#define T0_KAOS_RANVAL_6f     0x57ea8d38
#define T0_KAOS_RANVAL_70     0xe54e5f9b
#define T0_KAOS_RANVAL_71     0x58c15956
#define T0_KAOS_RANVAL_72     0x271f6ab2
#define T0_KAOS_RANVAL_73     0xad5ca624
#define T0_KAOS_RANVAL_74     0xbb49ca5d
#define T0_KAOS_RANVAL_75     0x5e2e7e31
#define T0_KAOS_RANVAL_76     0x5e16311d
#define T0_KAOS_RANVAL_77     0x705cedd7
#define T0_KAOS_RANVAL_78     0x9d4148f7
#define T0_KAOS_RANVAL_79     0xc0d84d0e
#define T0_KAOS_RANVAL_7a     0xb1a0ea8a
#define T0_KAOS_RANVAL_7b     0xa6cd87cc
#define T0_KAOS_RANVAL_7c     0xc90a9797
#define T0_KAOS_RANVAL_7d     0x2ea5a380
#define T0_KAOS_RANVAL_7e     0xa60108e4
#define T0_KAOS_RANVAL_7f     0xba36777c
/* end ktbl.0.h */
/* start ktbl.1.h */
#define T1_KAOS_NIAGARA
#define T1_KAOS_VERSION       4.2
#define T1_KAOS_SEED          d3d4c9dc4872
#define T1_KAOS_ICOUNT        5000
#define T1_KAOS_AREAS         1
#define T1_KAOS_AREASIZE      64
#define T1_KAOS_AREAOFFSET    2240
#define T1_KAOS_PAGESIZE      8192
#define T1_KAOS_CODECOUNT     5005

#define T1_KAOS_BOOT_VA                  0x793e6000
#define T1_KAOS_BOOT_PA                  0x0000000040dcc000
#define T1_KAOS_BOOT_CACHEABLE           1
#define T1_KAOS_BOOT_NONCACHEABLE        0

#define T1_KAOS_STARTUP_VA               0x57d6c000
#define T1_KAOS_STARTUP_PA               0x0000000041a68000
#define T1_KAOS_STARTUP_CACHEABLE        1
#define T1_KAOS_STARTUP_NONCACHEABLE     0

#define T1_KAOS_OFFSET_TBL_VA            0x45c38000
#define T1_KAOS_OFFSET_TBL_PA            0x0000000042362000
#define T1_KAOS_OFFSET_TBL_CACHEABLE     1
#define T1_KAOS_OFFSET_TBL_NONCACHEABLE  0

#define T1_KAOS_DONE_VA                  0x63b48000
#define T1_KAOS_DONE_PA                  0x0000000043826000
#define T1_KAOS_DONE_CACHEABLE           1
#define T1_KAOS_DONE_NONCACHEABLE        0

#define T1_KAOS_KTBL_VA                  0x483b0000
#define T1_KAOS_KTBL_PA                  0x00000000440c4000
#define T1_KAOS_KTBL_CACHEABLE           1
#define T1_KAOS_KTBL_NONCACHEABLE        0

#define T1_KAOS_SUBR0_VA                 0x418a4000
#define T1_KAOS_SUBR0_PA                 0x0000000045394000
#define T1_KAOS_SUBR0_CACHEABLE          1
#define T1_KAOS_SUBR0_NONCACHEABLE       0
#define T1_KAOS_SUBR1_VA                 0x4851e000
#define T1_KAOS_SUBR1_PA                 0x000000004621e000
#define T1_KAOS_SUBR1_CACHEABLE          1
#define T1_KAOS_SUBR1_NONCACHEABLE       0
#define T1_KAOS_SUBR2_VA                 0x7aaca000
#define T1_KAOS_SUBR2_PA                 0x00000000474d6000
#define T1_KAOS_SUBR2_CACHEABLE          1
#define T1_KAOS_SUBR2_NONCACHEABLE       0
#define T1_KAOS_SUBR3_VA                 0x4830a000
#define T1_KAOS_SUBR3_PA                 0x0000000048826000
#define T1_KAOS_SUBR3_CACHEABLE          1
#define T1_KAOS_SUBR3_NONCACHEABLE       0

#define T1_KAOS_EXP_REGS_VA              0x52fe0000
#define T1_KAOS_EXP_REGS_PA              0x00000000497c4000
#define T1_KAOS_EXP_REGS_CACHEABLE       1
#define T1_KAOS_EXP_REGS_NONCACHEABLE    0
#define T1_KAOS_RUN_REGS_VA              0x5199e000
#define T1_KAOS_RUN_REGS_PA              0x000000004a7a4000
#define T1_KAOS_RUN_REGS_CACHEABLE       1
#define T1_KAOS_RUN_REGS_NONCACHEABLE    0

#define T1_KAOS_EXP_STACK_VA             0x59c2c000
#define T1_KAOS_EXP_STACK_PA             0x000000004b992000
#define T1_KAOS_EXP_STACK_CACHEABLE      1
#define T1_KAOS_EXP_STACK_NONCACHEABLE   0
#define T1_KAOS_RUN_STACK_VA             0x44100000
#define T1_KAOS_RUN_STACK_PA             0x000000004c218000
#define T1_KAOS_RUN_STACK_CACHEABLE      1
#define T1_KAOS_RUN_STACK_NONCACHEABLE   0

#define T1_KAOS_AREA0
#define T1_KAOS_EXP_AREA0_VA             0x5afde000
#define T1_KAOS_EXP_AREA0_PA             0x000000004de0e000
#define T1_KAOS_EXP_AREA0_CACHEABLE      1
#define T1_KAOS_EXP_AREA0_NONCACHEABLE   0
#define T1_KAOS_RUN_AREA0_VA             0x42c92000
#define T1_KAOS_RUN_AREA0_PA             0x000000004e264000
#define T1_KAOS_RUN_AREA0_CACHEABLE      1
#define T1_KAOS_RUN_AREA0_NONCACHEABLE   0

#define T1_KAOS_SHM_AREA
#define T1_KAOS_EXP_SHM_AREA_VA          0x7563e000
#define T1_KAOS_EXP_SHM_AREA_PA          0x000000004005e000
#define T1_KAOS_EXP_SHM_AREA_CACHEABLE   1
#define T1_KAOS_EXP_SHM_AREA_NONCACHEABLE 0
#define T1_KAOS_RUN_SHM_AREA_VA          0x576f8000
#define T1_KAOS_RUN_SHM_AREA_PA          0x00000000401bc000
#define T1_KAOS_RUN_SHM_AREA_CACHEABLE   1
#define T1_KAOS_RUN_SHM_AREA_NONCACHEABLE 0

#define T1_KAOS_RANVAL_00     0xcb287c59
#define T1_KAOS_RANVAL_01     0x74424bf3
#define T1_KAOS_RANVAL_02     0xe9ca50e2
#define T1_KAOS_RANVAL_03     0xc8e31375
#define T1_KAOS_RANVAL_04     0x313a1955
#define T1_KAOS_RANVAL_05     0x2b355300
#define T1_KAOS_RANVAL_06     0x2e3b1684
#define T1_KAOS_RANVAL_07     0x1425bf0e
#define T1_KAOS_RANVAL_08     0xaa9184c9
#define T1_KAOS_RANVAL_09     0x9dd4bef9
#define T1_KAOS_RANVAL_0a     0x57399252
#define T1_KAOS_RANVAL_0b     0xbd837036
#define T1_KAOS_RANVAL_0c     0x688d77a4
#define T1_KAOS_RANVAL_0d     0x5c363e72
#define T1_KAOS_RANVAL_0e     0x0b368032
#define T1_KAOS_RANVAL_0f     0x16822c47
#define T1_KAOS_RANVAL_10     0x4f1b8736
#define T1_KAOS_RANVAL_11     0x79a301a7
#define T1_KAOS_RANVAL_12     0xaa2ead35
#define T1_KAOS_RANVAL_13     0x4150703c
#define T1_KAOS_RANVAL_14     0x915fe4cf
#define T1_KAOS_RANVAL_15     0xd961ab44
#define T1_KAOS_RANVAL_16     0x4974f9d4
#define T1_KAOS_RANVAL_17     0xf2813fab
#define T1_KAOS_RANVAL_18     0x8526f3a7
#define T1_KAOS_RANVAL_19     0x28edfa80
#define T1_KAOS_RANVAL_1a     0x62a3bc7b
#define T1_KAOS_RANVAL_1b     0x1605aef1
#define T1_KAOS_RANVAL_1c     0x933fd8fd
#define T1_KAOS_RANVAL_1d     0xad38826f
#define T1_KAOS_RANVAL_1e     0x4fe3484b
#define T1_KAOS_RANVAL_1f     0x4af85cae
#define T1_KAOS_RANVAL_20     0x4b2d6a81
#define T1_KAOS_RANVAL_21     0x175a0298
#define T1_KAOS_RANVAL_22     0xfe4b9c1c
#define T1_KAOS_RANVAL_23     0x6a228e73
#define T1_KAOS_RANVAL_24     0xcf8d1ef6
#define T1_KAOS_RANVAL_25     0x37cb34c5
#define T1_KAOS_RANVAL_26     0xf7037dc0
#define T1_KAOS_RANVAL_27     0x7569e4ba
#define T1_KAOS_RANVAL_28     0xd469e513
#define T1_KAOS_RANVAL_29     0x86eb241a
#define T1_KAOS_RANVAL_2a     0xd11f858e
#define T1_KAOS_RANVAL_2b     0x8dd0da16
#define T1_KAOS_RANVAL_2c     0x2bab04aa
#define T1_KAOS_RANVAL_2d     0x53ab6169
#define T1_KAOS_RANVAL_2e     0xdd67de1e
#define T1_KAOS_RANVAL_2f     0x81a381ab
#define T1_KAOS_RANVAL_30     0xac2d6e0c
#define T1_KAOS_RANVAL_31     0xcedaa8c4
#define T1_KAOS_RANVAL_32     0x0253bc51
#define T1_KAOS_RANVAL_33     0x800d38df
#define T1_KAOS_RANVAL_34     0x10181baa
#define T1_KAOS_RANVAL_35     0xbffbcc52
#define T1_KAOS_RANVAL_36     0x25f5d393
#define T1_KAOS_RANVAL_37     0xc9eb4051
#define T1_KAOS_RANVAL_38     0x0ce269ff
#define T1_KAOS_RANVAL_39     0x311ff866
#define T1_KAOS_RANVAL_3a     0x8d854a63
#define T1_KAOS_RANVAL_3b     0x4c7b7009
#define T1_KAOS_RANVAL_3c     0x5d8d89ad
#define T1_KAOS_RANVAL_3d     0xd718a4cd
#define T1_KAOS_RANVAL_3e     0x6ae2f313
#define T1_KAOS_RANVAL_3f     0xe0c57af1
#define T1_KAOS_RANVAL_40     0x1c006fe6
#define T1_KAOS_RANVAL_41     0x0bc6c767
#define T1_KAOS_RANVAL_42     0x9032cccc
#define T1_KAOS_RANVAL_43     0x15907584
#define T1_KAOS_RANVAL_44     0x9b87e90d
#define T1_KAOS_RANVAL_45     0x4e921bf8
#define T1_KAOS_RANVAL_46     0x5c9e10d5
#define T1_KAOS_RANVAL_47     0x889d93c5
#define T1_KAOS_RANVAL_48     0xe272b19c
#define T1_KAOS_RANVAL_49     0xf46c9540
#define T1_KAOS_RANVAL_4a     0x5bd25014
#define T1_KAOS_RANVAL_4b     0xb1fc5271
#define T1_KAOS_RANVAL_4c     0xeddbb947
#define T1_KAOS_RANVAL_4d     0xda734b48
#define T1_KAOS_RANVAL_4e     0x781664d4
#define T1_KAOS_RANVAL_4f     0xe0db7f77
#define T1_KAOS_RANVAL_50     0x8732f462
#define T1_KAOS_RANVAL_51     0xfd7f7afe
#define T1_KAOS_RANVAL_52     0xbd163cc8
#define T1_KAOS_RANVAL_53     0xf77dd5a7
#define T1_KAOS_RANVAL_54     0xb1375f7f
#define T1_KAOS_RANVAL_55     0x130f6b04
#define T1_KAOS_RANVAL_56     0x7c12bf4f
#define T1_KAOS_RANVAL_57     0x1b301faa
#define T1_KAOS_RANVAL_58     0x881b195b
#define T1_KAOS_RANVAL_59     0xfe1849c4
#define T1_KAOS_RANVAL_5a     0xa93353f9
#define T1_KAOS_RANVAL_5b     0x288a1632
#define T1_KAOS_RANVAL_5c     0xf8b4b6fa
#define T1_KAOS_RANVAL_5d     0xe9cf58c7
#define T1_KAOS_RANVAL_5e     0xc98acd49
#define T1_KAOS_RANVAL_5f     0xdb226d71
#define T1_KAOS_RANVAL_60     0x6b2f360f
#define T1_KAOS_RANVAL_61     0x3689f947
#define T1_KAOS_RANVAL_62     0x0a39bbbc
#define T1_KAOS_RANVAL_63     0x7d71c5ce
#define T1_KAOS_RANVAL_64     0x88dc31a1
#define T1_KAOS_RANVAL_65     0x4eb96e02
#define T1_KAOS_RANVAL_66     0xa7346d0a
#define T1_KAOS_RANVAL_67     0xd92773d6
#define T1_KAOS_RANVAL_68     0xa8e23cec
#define T1_KAOS_RANVAL_69     0x15006650
#define T1_KAOS_RANVAL_6a     0xb3d31bab
#define T1_KAOS_RANVAL_6b     0x6cee5370
#define T1_KAOS_RANVAL_6c     0x56bb8884
#define T1_KAOS_RANVAL_6d     0x65ada677
#define T1_KAOS_RANVAL_6e     0x74b7129c
#define T1_KAOS_RANVAL_6f     0x81cf1a55
#define T1_KAOS_RANVAL_70     0x5e1735c0
#define T1_KAOS_RANVAL_71     0x2ec8613e
#define T1_KAOS_RANVAL_72     0xa1f7c962
#define T1_KAOS_RANVAL_73     0x2b40ddbe
#define T1_KAOS_RANVAL_74     0x03f1fc55
#define T1_KAOS_RANVAL_75     0xcf9016bf
#define T1_KAOS_RANVAL_76     0x36373c4e
#define T1_KAOS_RANVAL_77     0x10cfbf5e
#define T1_KAOS_RANVAL_78     0xaae10640
#define T1_KAOS_RANVAL_79     0xbc1b0c81
#define T1_KAOS_RANVAL_7a     0x836d0503
#define T1_KAOS_RANVAL_7b     0xd24cf592
#define T1_KAOS_RANVAL_7c     0x4ad425e9
#define T1_KAOS_RANVAL_7d     0x18dbb2c6
#define T1_KAOS_RANVAL_7e     0x852bf735
#define T1_KAOS_RANVAL_7f     0x16faa2d6
/* end ktbl.1.h */


#define CREGS_PSTATE_AM 1
#define CREGS_TSTATE_PSTATE_AM 1

#define NO_TRAPCHECK

#define LOCAL_SUPERVISOR_SECTION_TEXT_VA 0x20200000
#define LOCAL_SUPERVISOR_SECTION_TEXT_PA 0x20200000
#define LOCAL_SUPERVISOR_SECTION_DATA_VA 0x20210000
#define LOCAL_SUPERVISOR_SECTION_DATA_PA 0x20210000
#define LOCAL_SUPERVISOR_SECTION_DATA_VA_0 0x20210000
#define LOCAL_SUPERVISOR_SECTION_DATA_PA_0 0x20210000
#define LOCAL_SUPERVISOR_SECTION_DATA_VA_1 0x20210008
#define LOCAL_SUPERVISOR_SECTION_DATA_PA_1 0x20210008
#define LOCAL_SUPERVISOR_SECTION_DATA_VA_2 0x20210010
#define LOCAL_SUPERVISOR_SECTION_DATA_PA_2 0x20210010
#define LOCAL_SUPERVISOR_SECTION_DATA_VA_3 0x20210018
#define LOCAL_SUPERVISOR_SECTION_DATA_PA_3 0x20210018



#if defined(T0_KAOS_RANVAL_01)

#if (T0_KAOS_RANVAL_01 & (1<<0))
#define T0_KREADONLY
#endif

#if (T0_KAOS_RANVAL_01 & (1<<7))
#define T0_KAOS_FPNS
#endif

#if (T0_KAOS_RANVAL_01 & (1<<9))
!#define T0_KAOS_TICK
#endif

#if (T0_KAOS_RANVAL_01 & (1<<10))
#define DISP_MS_INIT		1
#endif

#if (T0_KAOS_RANVAL_01 & (1<<11))
#define PSTATE_MM_INIT 	PSTATE_MM_TSO
#endif

#endif



#if defined(T1_KAOS_RANVAL_01)
#if (T1_KAOS_RANVAL_01 & (1<<0))
#define T1_KREADONLY
#endif

#if (T1_KAOS_RANVAL_01 & (1<<7))
#define T1_KAOS_FPNS
#endif

#if (T1_KAOS_RANVAL_01 & (1<<9))
!#define KAOS_TICK
#endif

#if (T1_KAOS_RANVAL_01 & (1<<10))
#define T1_DISP_MS_INIT         1
#endif

#if (KAOS_RANVAL_01 & (1<<11))
#define T1_PSTATE_MM_INIT       PSTATE_MM_TSO
#endif

#endif




!
! Define primary context number
!
#define USER_CONTEXT		0x0fff

!
! Define local trap numbers
!
#define TRAP_INIT_TICK_COMPARE	0x23
#define	TRAP_SETDATA		0x24
#define TRAP_SIGSEGV_UPDATE	0x27


!
! Include the local kaos definitions
!

#if !defined(_KAOS_H)
#define _KAOS_H

#define I2OFF(a)	((a)*4)	/* convert integer index to address offset */

/*
 * _kaos() register load/store area layout
 */
#define KDATA_FREGS	(64)
#define KDATA_LREGS	(8)
#define KDATA_IREGS	(8)
#define KDATA_GREGS	(8)
#define KDATA_OREGS	(8)

#define KDATA_FREG_IDX		(0)
#define KDATA_GREG_IDX		(KDATA_FREG_IDX+KDATA_FREGS)
#define KDATA_OREG_IDX		(KDATA_GREG_IDX+KDATA_GREGS)
#define KDATA_LREG_IDX		(KDATA_OREG_IDX+KDATA_OREGS)
#define KDATA_IREG_IDX		(KDATA_LREG_IDX+KDATA_LREGS)
#define KDATA_Y_IDX		(KDATA_IREG_IDX+KDATA_IREGS)
#define KDATA_ICC_IDX		(KDATA_Y_IDX+1)
#define KDATA_FSR_IDX		(KDATA_ICC_IDX+1)
#define KDATA_GSRMASK_IDX	(KDATA_FSR_IDX+1)
#define KDATA_GSR_IDX		(KDATA_GSRMASK_IDX+1)
#define KDATA_ASI_IDX		(KDATA_GSR_IDX+1)
#define KDATA_TRAP_BEG_IDX	(KDATA_ASI_IDX+1)
#define KDATA_TRAP_OV_IDX	(KDATA_TRAP_BEG_IDX)
#define KDATA_TRAP_DIV0_IDX	(KDATA_TRAP_OV_IDX+1)
#define KDATA_TRAP_DIV52_IDX	(KDATA_TRAP_DIV0_IDX+1)
#define KDATA_TRAP_NX_IDX	(KDATA_TRAP_DIV52_IDX+1)
#define KDATA_TRAP_DZ_IDX	(KDATA_TRAP_NX_IDX+1)
#define KDATA_TRAP_UF_IDX	(KDATA_TRAP_DZ_IDX+1)
#define KDATA_TRAP_OF_IDX	(KDATA_TRAP_UF_IDX+1)
#define KDATA_TRAP_NV_IDX	(KDATA_TRAP_OF_IDX+1)
#define KDATA_TRAP_FP_OTHER_IDX	(KDATA_TRAP_NV_IDX+1)
#define KDATA_TRAP_TICC_IDX	(KDATA_TRAP_FP_OTHER_IDX+1)
#define KDATA_TRAP_SIGFPE_IDX	(KDATA_TRAP_TICC_IDX+1)
#define KDATA_TRAP_SIGSEGV_IDX	(KDATA_TRAP_SIGFPE_IDX+1)
#define KDATA_TRAP_SIGBUS_IDX	(KDATA_TRAP_SIGSEGV_IDX+1)
#define KDATA_TRAP_SIGILL_IDX	(KDATA_TRAP_SIGBUS_IDX+1)
#define KDATA_ETRAP_SIGSEGV_IDX	(KDATA_TRAP_SIGILL_IDX+1)
#define KDATA_ETRAP_SIGBUS_IDX	(KDATA_ETRAP_SIGSEGV_IDX+1)
#define KDATA_TRAP_UNIMP_IDX	(KDATA_ETRAP_SIGBUS_IDX+1)
#define KDATA_TRAP_MAX_IDX	(KDATA_TRAP_UNIMP_IDX+1)
#define KDATA_MAX_IDX		((KDATA_TRAP_MAX_IDX+1)&~1)

#define KDATA_FREG_OFF(a)	I2OFF((a)+KDATA_FREG_IDX)
#define KDATA_GREG_OFF(a)	I2OFF((a)+KDATA_GREG_IDX)
#define KDATA_OREG_OFF(a)	I2OFF((a)+KDATA_OREG_IDX)
#define KDATA_LREG_OFF(a)	I2OFF((a)+KDATA_LREG_IDX)
#define KDATA_IREG_OFF(a)	I2OFF((a)+KDATA_IREG_IDX)
#define KDATA_ICC_OFF		I2OFF(KDATA_ICC_IDX)
#define KDATA_Y_OFF		I2OFF(KDATA_Y_IDX)
#define KDATA_FSR_OFF		I2OFF(KDATA_FSR_IDX)
#define KDATA_GSRMASK_OFF	I2OFF(KDATA_GSRMASK_IDX)
#define KDATA_GSR_OFF		I2OFF(KDATA_GSR_IDX)
#define KDATA_ASI_OFF		I2OFF(KDATA_ASI_IDX)
#define KDATA_TRAP_BEG_OFF	I2OFF(KDATA_TRAP_BEG_IDX)
#define KDATA_TRAP_OV_OFF	I2OFF(KDATA_TRAP_OV_IDX)
#define KDATA_TRAP_DIV0_OFF	I2OFF(KDATA_TRAP_DIV0_IDX)
#define KDATA_TRAP_DIV52_OFF	I2OFF(KDATA_TRAP_DIV52_IDX)
#define KDATA_TRAP_NX_OFF	I2OFF(KDATA_TRAP_NX_IDX)
#define KDATA_TRAP_DZ_OFF	I2OFF(KDATA_TRAP_DZ_IDX)
#define KDATA_TRAP_UF_OFF	I2OFF(KDATA_TRAP_UF_IDX)
#define KDATA_TRAP_OF_OFF	I2OFF(KDATA_TRAP_OF_IDX)
#define KDATA_TRAP_NV_OFF	I2OFF(KDATA_TRAP_NV_IDX)
#define KDATA_TRAP_FP_OTHER_OFF	I2OFF(KDATA_TRAP_FP_OTHER_IDX)
#define KDATA_TRAP_TICC_OFF	I2OFF(KDATA_TRAP_TICC_IDX)
#define KDATA_TRAP_SIGFPE_OFF	I2OFF(KDATA_TRAP_SIGFPE_IDX)
#define KDATA_TRAP_SIGSEGV_OFF	I2OFF(KDATA_TRAP_SIGSEGV_IDX)
#define KDATA_TRAP_SIGBUS_OFF	I2OFF(KDATA_TRAP_SIGBUS_IDX)
#define KDATA_TRAP_SIGILL_OFF	I2OFF(KDATA_TRAP_SIGILL_IDX)
#define KDATA_ETRAP_SIGSEGV_OFF	I2OFF(KDATA_ETRAP_SIGSEGV_IDX)
#define KDATA_ETRAP_SIGBUS_OFF	I2OFF(KDATA_ETRAP_SIGBUS_IDX)
#define KDATA_TRAP_UNIMP_OFF	I2OFF(KDATA_TRAP_UNIMP_IDX)
#define KDATA_MAX_OFF		I2OFF(KDATA_MAX_IDX)

/*
 * _kaos() local stack frame layout
 */
#define KFRAME_FSR	(-4)			/* addr offset for fsr */
#define KFRAME_XFLAGS	(KFRAME_FSR-4)		/* addr offset for xflags */
#define KFRAME_REGPTR	(KFRAME_XFLAGS-4)	/* addr offset for reg ptr */
#define KFRAME_MTBL	(KFRAME_REGPTR-4)	/* addr offset for first */
						/* word of variable */
						/* stack region */

/*
 * _kaos xflags bits
 */
#define	XFLAG_TRIGGER	0x1		/* Activate triggers */
#define	XFLAG_SGI	0x2		/* Save/restore %gsr */
#define	XFLAG_V9	0x4		/* Save/restore %f[32-63], %asi */

/*
 * %fsr set/get bit mask
 * We only allow RD and fcc fields
 */
#define FSR_MASK	0xc0000c00

/*
 * Trap numbers
 */
#define TICC_TRAP		0x10
#define TRIGGER_START_TRAP	0x14
#define TRIGGER_STOP_TRAP	0x18
#define WATCHDOG_TRAP		0x71

#endif

/*
 * Minimum frame size
 */
#define MINFRAME	0x60

/*
 * Special ticc traps for simulation
 */
#define TRAP_DEMAP_RANDOM_VA	0x28
#define	TRAP_DEMAP_AREA		0x2c
#define	TRAP_DEMAP_KTBL_TEXT	0x30
#define TRAP_DEMAP_KTBL_DATA	0x34
#define	TRAP_DEMAP_SUBR		0x38
#define	TRAP_DEMAP_REG		0x3c
#define	TRAP_DEMAP_STACK	0x40
#define	TRAP_RO_AREA		0x44
#define	TRAP_RO_KTBL_DATA	0x75
#define	TRAP_RO_REG		0x4c
#define	TRAP_RO_STACK		0x50
#define	TRAP_SET_WINDOW		0x54
#define	TRAP_SET_VA_WP		0x58
#define	TRAP_SET_PA_WP		0x5c
#define	TRAP_SET_SOFTINT	0x60
#define	TRAP_IE_TOGGLE		0x64
#define	TRAP_SET_PIL		0x68
#define	TRAP_SET_TSO		0x6c
#define	TRAP_SET_PSO		0x70
#define	TRAP_SET_RMO		0x74

/*
 * mplock return codes
 */
#define LOCK_SUCCESS    0
#define LOCK_TIMEOUT    1

/*
 * memtest types
 */
#define MEMTEST_NONE	0
#define MEMTEST_TSO	1
#define MEMTEST_RMO	2

#define MAXHOSTS	10


#include "constants.h"
#include "macros.h"


/*
#include "enable_traps.h"
*/

#define H_T0_Trap_Instruction_0
#define SUN_H_T0_Trap_Instruction_0  \
                        tcc     T_TRAP_INST1; \
                        wr      %g0, ASI_PRIMARY, %asi; \
			set     T0_KAOS_RUN_REGS_PA, %g7; \
                        lda     [%g7+KDATA_ETRAP_SIGSEGV_OFF]%asi, %g6 ; \
                        inc     %g6 ; \
                        sta     %g6, [%g7+KDATA_ETRAP_SIGSEGV_OFF]%asi ; \
                        done; \
			nop

#define H_HT0_Trap_Instruction_0
#define SUN_H_HT0_Trap_Instruction_0  \
                        tcc     T_TRAP_INST1; \
                        wr      %g0, ASI_PRIMARY, %asi; \
			set     T0_KAOS_RUN_REGS_PA, %g7; \
                        lda     [%g7+KDATA_ETRAP_SIGSEGV_OFF]%asi, %g6 ; \
                        inc     %g6 ; \
                        sta     %g6, [%g7+KDATA_ETRAP_SIGSEGV_OFF]%asi ; \
                        done; \
			nop

#define H_T0_Trap_Instruction_1
#define SUN_H_T0_Trap_Instruction_1  \
                        rdpr    %tstate, %g1; \
                        wrpr    %g1, 0x200, %tstate; \
                        done; \
			nop; \
			nop; \
			nop; \
			nop; \
			nop

#define H_HT0_Trap_Instruction_1
#define SUN_H_HT0_Trap_Instruction_1  \
                        rdpr    %tstate, %g1; \
                        wrpr    %g1, 0x200, %tstate; \
                        done; \
			nop; \
			nop; \
			nop; \
			nop; \
			nop

#define H_HT0_Trap_Instruction_2
#define SUN_H_HT0_Trap_Instruction_2  \
                        tcc     T_TRAP_INST1; \
                        wr      %g0, ASI_PRIMARY, %asi; \
			set     T0_KAOS_RUN_REGS_PA, %g7; \
                        lda     [%g7+KDATA_ETRAP_SIGSEGV_OFF]%asi, %g6 ; \
                        inc     %g6 ; \
                        sta     %g6, [%g7+KDATA_ETRAP_SIGSEGV_OFF]%asi ; \
                        done; \
			nop

#define H_T0_Trap_Instruction_3
#define SUN_H_T0_Trap_Instruction_3  \
                        rdpr    %tstate, %g1; \
                        wrpr    %g1, 0x200, %tstate; \
                        done; \
			nop; \
			nop; \
			nop; \
			nop; \
			nop

#define H_HT0_Trap_Instruction_3
#define SUN_H_HT0_Trap_Instruction_3  \
                        rdpr    %tstate, %g1; \
                        wrpr    %g1, 0x200, %tstate; \
                        done; \
			nop; \
			nop; \
			nop; \
			nop; \
			nop
#define H_T0_Trap_Instruction_4
#define SUN_H_T0_Trap_Instruction_4  \
                        rdpr    %tstate, %g1; \
                        wrpr    %g1, 0x200, %tstate; \
                        done; \
			nop; \
			nop; \
			nop; \
			nop; \
			nop

#define H_HT0_Trap_Instruction_4
#define SUN_H_HT0_Trap_Instruction_4  \
                        rdpr    %tstate, %g1; \
                        wrpr    %g1, 0x200, %tstate; \
                        done; \
			nop; \
			nop; \
			nop; \
			nop; \
			nop
	
#define H_T0_Trap_Instruction_180
#define SUN_H_T0_Trap_Instruction_180  \
                        rdpr    %tstate, %g1; \
                        wrpr    %g1, 0x200, %tstate; \
                        done; \
			nop; \
			nop; \
			nop; \
			nop; \
			nop

#define H_HT0_Trap_Instruction_180
#define SUN_H_HT0_Trap_Instruction_180  \
                        rdpr    %tstate, %g1; \
                        wrpr    %g1, 0x200, %tstate; \
                        done; \
			nop; \
			nop; \
			nop; \
			nop; \
			nop

#define H_T0_Fp_disabled_0x20
#define SUN_H_T0_Fp_disabled_0x20 \
			wr	%g0, 0x4, %fprs ; \
			retry ; \
			nop; \
			nop; \
			nop; \
			nop; \
			nop; \
			nop
	
#define H_T1_Trap_Instruction_0
#define SUN_H_T1_Trap_Instruction_0  \
                        tcc     T_TRAP_INST1; \
                        wr      %g0, ASI_PRIMARY, %asi; \
			set     T0_KAOS_RUN_REGS_PA, %g7; \
                        lda     [%g7+KDATA_ETRAP_SIGSEGV_OFF]%asi, %g6 ; \
                        inc     %g6 ; \
                        sta     %g6, [%g7+KDATA_ETRAP_SIGSEGV_OFF]%asi ; \
                        done; \
			nop

#define H_HT1_Trap_Instruction_0
#define SUN_H_HT1_Trap_Instruction_0  \
                        tcc     T_TRAP_INST1; \
                        wr      %g0, ASI_PRIMARY, %asi; \
			set     T0_KAOS_RUN_REGS_PA, %g7; \
                        lda     [%g7+KDATA_ETRAP_SIGSEGV_OFF]%asi, %g6 ; \
                        inc     %g6 ; \
                        sta     %g6, [%g7+KDATA_ETRAP_SIGSEGV_OFF]%asi ; \
                        done; \
			nop

#define H_T1_Trap_Instruction_1
#define SUN_H_T1_Trap_Instruction_1  \
                        rdpr    %tstate, %g1; \
                        wrpr    %g1, 0x200, %tstate; \
                        done; \
			nop; \
			nop; \
			nop; \
			nop; \
			nop

#define H_HT1_Trap_Instruction_1
#define SUN_H_HT1_Trap_Instruction_1  \
                        rdpr    %tstate, %g1; \
                        wrpr    %g1, 0x200, %tstate; \
                        done; \
			nop; \
			nop; \
			nop; \
			nop; \
			nop

#define H_T1_Trap_Instruction_2
#define SUN_H_T1_Trap_Instruction_2  \
                        tcc     T_TRAP_INST1; \
                        wr      %g0, ASI_PRIMARY, %asi; \
			set     T0_KAOS_RUN_REGS_PA, %g7; \
                        lda     [%g7+KDATA_ETRAP_SIGSEGV_OFF]%asi, %g6 ; \
                        inc     %g6 ; \
                        sta     %g6, [%g7+KDATA_ETRAP_SIGSEGV_OFF]%asi ; \
                        done; \
			nop

#define H_HT1_Trap_Instruction_2
#define SUN_H_HT1_Trap_Instruction_2  \
                        tcc     T_TRAP_INST1; \
                        wr      %g0, ASI_PRIMARY, %asi; \
			set     T0_KAOS_RUN_REGS_PA, %g7; \
                        lda     [%g7+KDATA_ETRAP_SIGSEGV_OFF]%asi, %g6 ; \
                        inc     %g6 ; \
                        sta     %g6, [%g7+KDATA_ETRAP_SIGSEGV_OFF]%asi ; \
                        done; \
			nop

#define H_T1_Trap_Instruction_3
#define SUN_H_T1_Trap_Instruction_3  \
                        rdpr    %tstate, %g1; \
                        wrpr    %g1, 0x200, %tstate; \
                        done; \
			nop; \
			nop; \
			nop; \
			nop; \
			nop

#define H_HT1_Trap_Instruction_3
#define SUN_H_HT1_Trap_Instruction_3  \
                        rdpr    %tstate, %g1; \
                        wrpr    %g1, 0x200, %tstate; \
                        done; \
			nop; \
			nop; \
			nop; \
			nop; \
			nop
#define H_T1_Trap_Instruction_4
#define SUN_H_T1_Trap_Instruction_4  \
                        rdpr    %tstate, %g1; \
                        wrpr    %g1, 0x200, %tstate; \
                        done; \
			nop; \
			nop; \
			nop; \
			nop; \
			nop

#define H_HT1_Trap_Instruction_4
#define SUN_H_HT1_Trap_Instruction_4  \
                        rdpr    %tstate, %g1; \
                        wrpr    %g1, 0x200, %tstate; \
                        done; \
			nop; \
			nop; \
			nop; \
			nop; \
			nop
	
#define H_T1_Trap_Instruction_180
#define SUN_H_T1_Trap_Instruction_180  \
                        rdpr    %tstate, %g1; \
                        wrpr    %g1, 0x200, %tstate; \
                        done; \
			nop; \
			nop; \
			nop; \
			nop; \
			nop

#define H_HT1_Trap_Instruction_180
#define SUN_H_HT1_Trap_Instruction_180  \
                        rdpr    %tstate, %g1; \
                        wrpr    %g1, 0x200, %tstate; \
                        done; \
			nop; \
			nop; \
			nop; \
			nop; \
			nop	
#define H_T1_Fp_disabled_0x20
#define SUN_H_T1_Fp_disabled_0x20 \
			wr	%g0, 0x4, %fprs ; \
			retry ; \
			nop; \
			nop; \
			nop; \
			nop; \
			nop; \
			nop
		
/****************************************************************  
 * MEMORY ADDRESS NOT ALIGNED TRAP HANDLERS
 * DO NOTHING SINCE THE COUNTERS ARE NO LONGER USED
 ****************************************************************/

  /* HYPERVISOR MODE */

#define H_HT0_Mem_Address_Not_Aligned_0x34
#define SUN_H_HT0_Mem_Address_Not_Aligned_0x34 \
                        tne     T_TRAP_INST1; \
                        done; \
                        nop; \
                        nop; \
                        nop; \
                        nop; \
                        nop; \
                        nop

#define H_HT0_Lddf_Mem_Address_Not_Aligned_0x35
#define SUN_H_HT0_Lddf_Mem_Address_Not_Aligned_0x35 \
                        tne     T_TRAP_INST1; \
                        done; \
                        nop; \
                        nop; \
                        nop; \
                        nop; \
                        nop; \
                        nop

#define H_HT0_Stdf_Mem_Address_Not_Aligned_0x36
#define SUN_H_HT0_Stdf_Mem_Address_Not_Aligned_0x36 \
                        tne     T_TRAP_INST1; \
                        done; \
                        nop; \
                        nop; \
                        nop; \
                        nop; \
                        nop; \
                        nop

#define H_HT0_Reserved_0x38
#define SUN_H_HT0_Reserved_0x38 \
                        tne     T_TRAP_INST1; \
                        done; \
                        nop; \
                        nop; \
                        nop; \
                        nop; \
                        nop; \
                        nop

#define H_HT0_Reserved_0x39
#define SUN_H_HT0_Reserved_0x39 \
                        tne     T_TRAP_INST1; \
                        done; \
                        nop; \
                        nop; \
                        nop; \
                        nop; \
                        nop; \
                        nop

  /* SUPERVISOR MODE */

#define H_T0_Mem_Address_Not_Aligned_0x34
#define SUN_H_T0_Mem_Address_Not_Aligned_0x34 \
                        tne     T_TRAP_INST1; \
                        done; \
                        nop; \
                        nop; \
                        nop; \
                        nop; \
                        nop; \
                        nop

#define H_T0_Lddf_Mem_Address_Not_Aligned_0x35
#define SUN_H_T0_Lddf_Mem_Address_Not_Aligned_0x35 \
                        tne     T_TRAP_INST1; \
                        done; \
                        nop; \
                        nop; \
                        nop; \
                        nop; \
                        nop; \
                        nop

#define H_T0_Stdf_Mem_Address_Not_Aligned_0x36
#define SUN_H_T0_Stdf_Mem_Address_Not_Aligned_0x36 \
                        tne     T_TRAP_INST1; \
                        done; \
                        nop; \
                        nop; \
                        nop; \
                        nop; \
                        nop; \
                        nop

#define H_T0_Reserved_0x38
#define SUN_H_T0_Reserved_0x38 \
                        tne     T_TRAP_INST1; \
                        done; \
                        nop; \
                        nop; \
                        nop; \
                        nop; \
                        nop; \
                        nop

#define H_T0_Reserved_0x39
#define SUN_H_T0_Reserved_0x39 \
                        tne     T_TRAP_INST1; \
                        done; \
                        nop; \
                        nop; \
                        nop; \
                        nop; \
                        nop; \
                        nop


/** ILLEGAL TRAP HANDLERS **/

#define H_HT0_Illegal_instruction_0x10
#define SUN_H_HT0_Illegal_instruction_0x10 \
                       setx illegal_trap_handler, %g1, %g2; \
                       jmp %g2;\
                       nop

#define H_T0_Illegal_instruction_0x10
#define SUN_H_T0_Illegal_instruction_0x10 \
                       setx illegal_trap_handler, %g1, %g2; \
                       jmp %g2;\
                       nop
	
#define H_T0_Trap_Instruction_0x180
#define SUN_H_T0_Trap_Instruction_0x180  \
                        rdpr    %tstate, %g1; \
                        wrpr    %g1, 0x200, %tstate; \
                        done; \
			nop; \
			nop; \
			nop; \
			nop; \
			nop		


		
#define H_HT0_Trap_Instruction_0x180
#define SUN_H_HT0_Trap_Instruction_0x180  \
                        rdpr    %tstate, %g1; \
                        wrpr    %g1, 0x200, %tstate; \
                        done; \
			nop; \
			nop; \
			nop; \
			nop; \
			nop

#define THREAD_COUNT 2

#include "enable_file.h"
#include "hboot.s"


.global main

.seg "text"
ALIGN_PAGE_8K
main:
  setx  kaos_boot, %l0, %o5
  jmp %o5
  !ta      T_GOOD_TRAP
  nop

main_end:





/************************************************************************
   Include startup code
 ************************************************************************/
#define KAOS_SIMULATION
#define KAOS_V9

SECTION kaos_startup TEXT_VA=T0_KAOS_STARTUP_VA

.seg	"text"
_kaos_page_begin:

#if !defined(_KAOS_H)
#define _KAOS_H

#define I2OFF(a)	((a)*4)	/* convert integer index to address offset */

/*
 * _kaos() register load/store area layout
 */
#define KDATA_FREGS	(64)
#define KDATA_LREGS	(8)
#define KDATA_IREGS	(8)
#define KDATA_GREGS	(8)
#define KDATA_OREGS	(8)

#define KDATA_FREG_IDX		(0)
#define KDATA_GREG_IDX		(KDATA_FREG_IDX+KDATA_FREGS)
#define KDATA_OREG_IDX		(KDATA_GREG_IDX+KDATA_GREGS)
#define KDATA_LREG_IDX		(KDATA_OREG_IDX+KDATA_OREGS)
#define KDATA_IREG_IDX		(KDATA_LREG_IDX+KDATA_LREGS)
#define KDATA_Y_IDX		(KDATA_IREG_IDX+KDATA_IREGS)
#define KDATA_ICC_IDX		(KDATA_Y_IDX+1)
#define KDATA_FSR_IDX		(KDATA_ICC_IDX+1)
#define KDATA_GSRMASK_IDX	(KDATA_FSR_IDX+1)
#define KDATA_GSR_IDX		(KDATA_GSRMASK_IDX+1)
#define KDATA_ASI_IDX		(KDATA_GSR_IDX+1)
#define KDATA_TRAP_BEG_IDX	(KDATA_ASI_IDX+1)
#define KDATA_TRAP_OV_IDX	(KDATA_TRAP_BEG_IDX)
#define KDATA_TRAP_DIV0_IDX	(KDATA_TRAP_OV_IDX+1)
#define KDATA_TRAP_DIV52_IDX	(KDATA_TRAP_DIV0_IDX+1)
#define KDATA_TRAP_NX_IDX	(KDATA_TRAP_DIV52_IDX+1)
#define KDATA_TRAP_DZ_IDX	(KDATA_TRAP_NX_IDX+1)
#define KDATA_TRAP_UF_IDX	(KDATA_TRAP_DZ_IDX+1)
#define KDATA_TRAP_OF_IDX	(KDATA_TRAP_UF_IDX+1)
#define KDATA_TRAP_NV_IDX	(KDATA_TRAP_OF_IDX+1)
#define KDATA_TRAP_FP_OTHER_IDX	(KDATA_TRAP_NV_IDX+1)
#define KDATA_TRAP_TICC_IDX	(KDATA_TRAP_FP_OTHER_IDX+1)
#define KDATA_TRAP_SIGFPE_IDX	(KDATA_TRAP_TICC_IDX+1)
#define KDATA_TRAP_SIGSEGV_IDX	(KDATA_TRAP_SIGFPE_IDX+1)
#define KDATA_TRAP_SIGBUS_IDX	(KDATA_TRAP_SIGSEGV_IDX+1)
#define KDATA_TRAP_SIGILL_IDX	(KDATA_TRAP_SIGBUS_IDX+1)
#define KDATA_ETRAP_SIGSEGV_IDX	(KDATA_TRAP_SIGILL_IDX+1)
#define KDATA_ETRAP_SIGBUS_IDX	(KDATA_ETRAP_SIGSEGV_IDX+1)
#define KDATA_TRAP_UNIMP_IDX	(KDATA_ETRAP_SIGBUS_IDX+1)
#define KDATA_TRAP_MAX_IDX	(KDATA_TRAP_UNIMP_IDX+1)
#define KDATA_MAX_IDX		((KDATA_TRAP_MAX_IDX+1)&~1)

#define KDATA_FREG_OFF(a)	I2OFF((a)+KDATA_FREG_IDX)
#define KDATA_GREG_OFF(a)	I2OFF((a)+KDATA_GREG_IDX)
#define KDATA_OREG_OFF(a)	I2OFF((a)+KDATA_OREG_IDX)
#define KDATA_LREG_OFF(a)	I2OFF((a)+KDATA_LREG_IDX)
#define KDATA_IREG_OFF(a)	I2OFF((a)+KDATA_IREG_IDX)
#define KDATA_ICC_OFF		I2OFF(KDATA_ICC_IDX)
#define KDATA_Y_OFF		I2OFF(KDATA_Y_IDX)
#define KDATA_FSR_OFF		I2OFF(KDATA_FSR_IDX)
#define KDATA_GSRMASK_OFF	I2OFF(KDATA_GSRMASK_IDX)
#define KDATA_GSR_OFF		I2OFF(KDATA_GSR_IDX)
#define KDATA_ASI_OFF		I2OFF(KDATA_ASI_IDX)
#define KDATA_TRAP_BEG_OFF	I2OFF(KDATA_TRAP_BEG_IDX)
#define KDATA_TRAP_OV_OFF	I2OFF(KDATA_TRAP_OV_IDX)
#define KDATA_TRAP_DIV0_OFF	I2OFF(KDATA_TRAP_DIV0_IDX)
#define KDATA_TRAP_DIV52_OFF	I2OFF(KDATA_TRAP_DIV52_IDX)
#define KDATA_TRAP_NX_OFF	I2OFF(KDATA_TRAP_NX_IDX)
#define KDATA_TRAP_DZ_OFF	I2OFF(KDATA_TRAP_DZ_IDX)
#define KDATA_TRAP_UF_OFF	I2OFF(KDATA_TRAP_UF_IDX)
#define KDATA_TRAP_OF_OFF	I2OFF(KDATA_TRAP_OF_IDX)
#define KDATA_TRAP_NV_OFF	I2OFF(KDATA_TRAP_NV_IDX)
#define KDATA_TRAP_FP_OTHER_OFF	I2OFF(KDATA_TRAP_FP_OTHER_IDX)
#define KDATA_TRAP_TICC_OFF	I2OFF(KDATA_TRAP_TICC_IDX)
#define KDATA_TRAP_SIGFPE_OFF	I2OFF(KDATA_TRAP_SIGFPE_IDX)
#define KDATA_TRAP_SIGSEGV_OFF	I2OFF(KDATA_TRAP_SIGSEGV_IDX)
#define KDATA_TRAP_SIGBUS_OFF	I2OFF(KDATA_TRAP_SIGBUS_IDX)
#define KDATA_TRAP_SIGILL_OFF	I2OFF(KDATA_TRAP_SIGILL_IDX)
#define KDATA_ETRAP_SIGSEGV_OFF	I2OFF(KDATA_ETRAP_SIGSEGV_IDX)
#define KDATA_ETRAP_SIGBUS_OFF	I2OFF(KDATA_ETRAP_SIGBUS_IDX)
#define KDATA_TRAP_UNIMP_OFF	I2OFF(KDATA_TRAP_UNIMP_IDX)
#define KDATA_MAX_OFF		I2OFF(KDATA_MAX_IDX)

/*
 * _kaos() local stack frame layout
 */
#define KFRAME_FSR	(-4)			/* addr offset for fsr */
#define KFRAME_XFLAGS	(KFRAME_FSR-4)		/* addr offset for xflags */
#define KFRAME_REGPTR	(KFRAME_XFLAGS-4)	/* addr offset for reg ptr */
#define KFRAME_MTBL	(KFRAME_REGPTR-4)	/* addr offset for first */
						/* word of variable */
						/* stack region */

/*
 * _kaos xflags bits
 */
#define	XFLAG_TRIGGER	0x1		/* Activate triggers */
#define	XFLAG_SGI	0x2		/* Save/restore %gsr */
#define	XFLAG_V9	0x4		/* Save/restore %f[32-63], %asi */

/*
 * %fsr set/get bit mask
 * We only allow RD and fcc fields
 */
#define FSR_MASK	0xc0000c00

/*
 * Trap numbers
 */
#define TICC_TRAP		0x10
#define TRIGGER_START_TRAP	0x14
#define TRIGGER_STOP_TRAP	0x18
#define WATCHDOG_TRAP		0x71

#endif

/*
 * Minimum frame size
 */
#define MINFRAME	0x60

/*
 * Special ticc traps for simulation
 */
#define TRAP_DEMAP_RANDOM_VA	0x28
#define	TRAP_DEMAP_AREA		0x2c
#define	TRAP_DEMAP_KTBL_TEXT	0x30
#define TRAP_DEMAP_KTBL_DATA	0x34
#define	TRAP_DEMAP_SUBR		0x38
#define	TRAP_DEMAP_REG		0x3c
#define	TRAP_DEMAP_STACK	0x40
#define	TRAP_RO_AREA		0x44
#define	TRAP_RO_KTBL_DATA	0x75
#define	TRAP_RO_REG		0x4c
#define	TRAP_RO_STACK		0x50
#define	TRAP_SET_WINDOW		0x54
#define	TRAP_SET_VA_WP		0x58
#define	TRAP_SET_PA_WP		0x5c
#define	TRAP_SET_SOFTINT	0x60
#define	TRAP_IE_TOGGLE		0x64
#define	TRAP_SET_PIL		0x68
#define	TRAP_SET_TSO		0x6c
#define	TRAP_SET_PSO		0x70
#define	TRAP_SET_RMO		0x74

/*
 * mplock return codes
 */
#define LOCK_SUCCESS    0
#define LOCK_TIMEOUT    1

/*
 * memtest types
 */
#define MEMTEST_NONE	0
#define MEMTEST_TSO	1
#define MEMTEST_RMO	2

#define MAXHOSTS	10

!
! Trap types for UNIX set condition codes
!
#define T_SETCC		0x21

!
! Entry point macros
!
#if defined(KAOS_SIMULATION) || defined(KAOS_VERIFY)
#define ENTRY(a)  _/**/a:

#if defined(NIAGARA2)
#define ENTRY_GLOBAL(a)  .global _/**/a ; _/**/a:  
#endif

#define SYM(a)	_/**/a
#else
#define ENTRY(a) .global a ; a:
#define SYM(a)	a
#endif

	.seg	"text"

!	_kaos(code, regdata, mtbl_cnt, mtbl, xflags); 
!	int	*code ;
!	int	*regdata ;
!	int	mtbl_cnt ;
!	int	**mtbl ;
!	int	xflags ;

#if !defined(NIAGARA2)
ENTRY(_kaos)
#else
ENTRY_GLOBAL(_kaos)
#endif
	sll	%o2, 2, %g1			! allocate stack frame
	add	%g1, (MINFRAME-(KFRAME_MTBL+4))+7, %g1
	andn	%g1, 7, %g1
	neg	%g1
	save	%sp,%g1,%sp

#if !defined(KAOS_SIMULATION)

! copy mtbl to stack
! (assumes the top of mtbl is dword aligned)

#if ((KFRAME_MTBL & 0x4) == 0)
	dec	4, %i3
	ld	[%i3], %f0
	st	%f0, [%fp+KFRAME_MTBL]
	add	%fp, KFRAME_MTBL-8, %l2
	dec	%i2
#else
	add	%fp, KFRAME_MTBL-4, %l2
#endif
1:
	dec	8, %i3
	deccc	2, %i2
	ldd	[%i3], %f0
	std	%f0, [%l2]
	bne	1b
	dec	8, %l2
#else

! If we are simulating, then mtbl is already on the stack
! so just the the nops right so va's match.

#if ((KFRAME_MTBL & 0x4) == 0)
	nop
	nop
	nop
	nop
	nop
#else
	nop
#endif
	nop
	nop
	nop
	nop
	nop
	nop
#endif

! set up the floating point registers

	ldd	[%i1+KDATA_FREG_OFF(0)],%f0
	ldd	[%i1+KDATA_FREG_OFF(2)],%f2
	ldd	[%i1+KDATA_FREG_OFF(4)],%f4
	ldd	[%i1+KDATA_FREG_OFF(6)],%f6
	ldd	[%i1+KDATA_FREG_OFF(8)],%f8
	ldd	[%i1+KDATA_FREG_OFF(10)],%f10
	ldd	[%i1+KDATA_FREG_OFF(12)],%f12
	ldd	[%i1+KDATA_FREG_OFF(14)],%f14
	ldd	[%i1+KDATA_FREG_OFF(16)],%f16
	ldd	[%i1+KDATA_FREG_OFF(18)],%f18
	ldd	[%i1+KDATA_FREG_OFF(20)],%f20
	ldd	[%i1+KDATA_FREG_OFF(22)],%f22
	ldd	[%i1+KDATA_FREG_OFF(24)],%f24
	ldd	[%i1+KDATA_FREG_OFF(26)],%f26
	ldd	[%i1+KDATA_FREG_OFF(28)],%f28
	ldd	[%i1+KDATA_FREG_OFF(30)],%f30

#if !defined(KAOS_V8_ONLY)
	andcc	%i4, XFLAG_V9, %g0		! set extended floating
	be	1f					! (in v9, odd registers for
	nop						!  double opcodes actually
							!  refer to the upper bank)
	ldd	[%i1+KDATA_FREG_OFF(32)], %f32
	ldd	[%i1+KDATA_FREG_OFF(34)], %f34
	ldd	[%i1+KDATA_FREG_OFF(36)], %f36
	ldd	[%i1+KDATA_FREG_OFF(38)], %f38
	ldd	[%i1+KDATA_FREG_OFF(40)], %f40
	ldd	[%i1+KDATA_FREG_OFF(42)], %f42
	ldd	[%i1+KDATA_FREG_OFF(44)], %f44
	ldd	[%i1+KDATA_FREG_OFF(46)], %f46
	ldd	[%i1+KDATA_FREG_OFF(48)], %f48
	ldd	[%i1+KDATA_FREG_OFF(50)], %f50
	ldd	[%i1+KDATA_FREG_OFF(52)], %f52
	ldd	[%i1+KDATA_FREG_OFF(54)], %f54
	ldd	[%i1+KDATA_FREG_OFF(56)], %f56
	ldd	[%i1+KDATA_FREG_OFF(58)], %f58
	ldd	[%i1+KDATA_FREG_OFF(60)], %f60
	ldd	[%i1+KDATA_FREG_OFF(62)], %f62
	membar	#Sync

	ld	[%i1+KDATA_ASI_OFF], %l0	! set %asi
	
#if !defined(NIAGARA2)
	wr	%l0, %g0, %asr3
#endif
1:

! set %gsr if requested

	andcc	%i4, XFLAG_SGI, %g0
	be	1f
	nop
	ld	[%i1+KDATA_GSRMASK_OFF],%o1
	ld	[%i1+KDATA_GSR_OFF], %o0	! set %gsr
	sllx	%o1, 32, %o1
	or	%o0, %o1, %o0
#if !defined(NIAGARA2)
	wr	%o0, %gsr
#endif
1:
#else
! 30 nop's so silicon/sim va's match
	nop ; nop ; nop ; nop ; nop
	nop ; nop ; nop ; nop ; nop
	nop ; nop ; nop ; nop ; nop
	nop ; nop ; nop ; nop ; nop
	nop ; nop ; nop ; nop ; nop
	nop ; nop ; nop ; nop ; nop
#endif

! save xflags and fire start trigger if requested
! (must do this before the T_SETCC trap below)

#if !defined(KAOS_SIMULATION)
	st	%i4, [%fp+KFRAME_XFLAGS]
	andcc	%i4, XFLAG_TRIGGER, %g0
	tne	TRIGGER_START_TRAP
#else
	nop
	nop
	nop
#endif

! set up other registers

	ld	[%i1+KDATA_Y_OFF], %o0		! set y
	mov	%o0, %y
	
	ld	[%i1+KDATA_ICC_OFF], %g1	! set icc
#if !defined(NIAGARA2)
	ta	T_SETCC
#endif

	st	%fsr, [%fp+KFRAME_FSR]		! save old fsr

#if defined(KAOS_V9) && defined(KAOS_FPNS)
	ld	[%i1+KDATA_FSR_OFF], %o0
	set	(1<<22), %o1			! set fsr.NS to avoid traps
	or	%o0, %o1, %o0			! in simulation
	st	%o0, [%i1+KDATA_FSR_OFF]
#else
	nop
	nop
	nop
	nop
#endif
	fmovs	%f0, %f0			! clear %fsr ftt field
	ld	[%i1+KDATA_FSR_OFF], %fsr	! set fsr
	
	mov	%i0, %o7			! save code pointer
	st	%i1, [%fp+KFRAME_REGPTR]	! save register area pointer
	ldd	[%i1+KDATA_IREG_OFF(2)], %i2	! r/w area offsets
	ldd	[%i1+KDATA_IREG_OFF(4)], %i4
	ldd	[%i1+KDATA_OREG_OFF(0)], %o0	! output regs
	ldd	[%i1+KDATA_OREG_OFF(2)], %o2
	ldd	[%i1+KDATA_OREG_OFF(4)], %o4
	ldd	[%i1+KDATA_LREG_OFF(0)], %l0	! local regs
	ldd	[%i1+KDATA_LREG_OFF(2)], %l2
	ldd	[%i1+KDATA_LREG_OFF(4)], %l4
	ldd	[%i1+KDATA_LREG_OFF(6)], %l6
	ld	[%i1+KDATA_GREG_OFF(0)], %g0	! always zero
	ld	[%i1+KDATA_GREG_OFF(1)], %g1	! code offset
	ld	[%i1+KDATA_GREG_OFF(2)], %g2	! unused
	ld	[%i1+KDATA_GREG_OFF(3)], %g3	! loop index
	ld	[%i1+KDATA_GREG_OFF(4)], %g4	! jmpl target
	ld	[%i1+KDATA_GREG_OFF(5)], %g5	! sigbus target
	ld	[%i1+KDATA_GREG_OFF(6)], %g6	! block ld offset
	ld	[%i1+KDATA_GREG_OFF(7)], %g7	! block st offset
	ldd	[%i1+KDATA_IREG_OFF(0)], %i0	! area pointers

#if defined(KAOS_SIMULATION)
!
! Save return address on stack
! HARI
	st	%i7, [%sp+0x3c]
#else
	nop
#endif
!
! Begin random instruction execution at specified entry point
! When done, code returns using a "call SYM(_kaos_done)"
!
#if !defined(NIAGARA2)
	flush	%o7
#endif
	jmp	%o7
	membar	#Sync

! Random instruction execution done

#if !defined(NIAGARA2)
ENTRY(_kaos_done)
#else
SECTION kaos_done TEXT_VA=T0_KAOS_DONE_VA
ENTRY_GLOBAL(_kaos_done)  
#endif
	membar	#Sync
#if defined(KAOS_SIMULATION)
	ret
	restore
#else
	nop
	nop
#endif
	ld	[%fp+KFRAME_REGPTR], %o7	! point to register area
	std	%o0, [%o7+KDATA_OREG_OFF(0)]	! output regs
	std	%o2, [%o7+KDATA_OREG_OFF(2)]
	std	%o4, [%o7+KDATA_OREG_OFF(4)]

	st	%g0, [%o7+KDATA_GREG_OFF(0)]	! should be 0
	st	%g1, [%o7+KDATA_GREG_OFF(1)]	! code offset
	st	%g2, [%o7+KDATA_GREG_OFF(2)]	! unused
	st	%g3, [%o7+KDATA_GREG_OFF(3)]	! loop index
	st	%g4, [%o7+KDATA_GREG_OFF(4)]	! jmpl target
	st	%g5, [%o7+KDATA_GREG_OFF(5)]	! sigbus target
	st	%g6, [%o7+KDATA_GREG_OFF(6)]	! block ld offset
	st	%g7, [%o7+KDATA_GREG_OFF(7)]	! block st offset

	std	%i0, [%o7+KDATA_IREG_OFF(0)]	! area pointers
	std	%i2, [%o7+KDATA_IREG_OFF(2)]	! r/w area offsets
	std	%i4, [%o7+KDATA_IREG_OFF(4)]

	std	%l0, [%o7+KDATA_LREG_OFF(0)]	! locals
	std	%l2, [%o7+KDATA_LREG_OFF(2)]
	std	%l4, [%o7+KDATA_LREG_OFF(4)]
	std	%l6, [%o7+KDATA_LREG_OFF(6)]

	clr	%o0				! get icc
	bcs,a	1f
	or	%o0, 0x1, %o0
1:	bvs,a	2f
	or	%o0, 0x2, %o0
2:	be,a	4f
	or	%o0, 0x4, %o0
4:	bneg,a	8f
	or	%o0, 0x8, %o0
8:
	st	%o0, [%o7+KDATA_ICC_OFF]

	ld	[%fp+KFRAME_XFLAGS], %g1	! trigger analyzer
	andcc	%g1, XFLAG_TRIGGER, %g0
	tne	TRIGGER_STOP_TRAP

	st	%fsr, [%o7+KDATA_FSR_OFF]	! get fsr
	ld	[%fp+KFRAME_FSR], %fsr		! restore original fsr

#if !defined(KAOS_V8_ONLY)
	ld	[%fp+KFRAME_XFLAGS], %g1	! get %gsr
	andcc	%g1, XFLAG_SGI, %g0
	be	1f
	nop
#if !defined(NIAGARA2)
	rd	%gsr, %o0
#endif
	srlx	%o0, 32, %o1
	st	%o1, [%o7+KDATA_GSRMASK_OFF]
	st	%o0, [%o7+KDATA_GSR_OFF]
1:
#else
! 8 nop's so silicon/sim va's match
	nop ; nop ; nop ; nop ; nop
	nop ; nop ; nop
#endif

	mov	%y, %o0
	st	%o0, [%o7+KDATA_Y_OFF]		! get y
	
	std	%f0, [%o7+KDATA_FREG_OFF(0)]	! get floating
	std	%f2, [%o7+KDATA_FREG_OFF(2)]
	std	%f4, [%o7+KDATA_FREG_OFF(4)]
	std	%f6, [%o7+KDATA_FREG_OFF(6)]
	std	%f8, [%o7+KDATA_FREG_OFF(8)]
	std	%f10, [%o7+KDATA_FREG_OFF(10)]
	std	%f12, [%o7+KDATA_FREG_OFF(12)]
	std	%f14, [%o7+KDATA_FREG_OFF(14)]
	std	%f16, [%o7+KDATA_FREG_OFF(16)]
	std	%f18, [%o7+KDATA_FREG_OFF(18)]
	std	%f20, [%o7+KDATA_FREG_OFF(20)]
	std	%f22, [%o7+KDATA_FREG_OFF(22)]
	std	%f24, [%o7+KDATA_FREG_OFF(24)]
	std	%f26, [%o7+KDATA_FREG_OFF(26)]
	std	%f28, [%o7+KDATA_FREG_OFF(28)]
	std	%f30, [%o7+KDATA_FREG_OFF(30)]

#if !defined(KAOS_V8_ONLY)
	ld	[%fp+KFRAME_XFLAGS], %o1	! get extended floating
	andcc	%o1, XFLAG_V9, %g0		! (in v9, odd registers for
	be	1f					!  double opcodes actually
	nop						!  refer to the upper bank)

	membar 	#Sync
	std	%f32, [%o7+KDATA_FREG_OFF(32)]
	std	%f34, [%o7+KDATA_FREG_OFF(34)]
	std	%f36, [%o7+KDATA_FREG_OFF(36)]
	std	%f38, [%o7+KDATA_FREG_OFF(38)]
	std	%f40, [%o7+KDATA_FREG_OFF(40)]
	std	%f42, [%o7+KDATA_FREG_OFF(42)]
	std	%f44, [%o7+KDATA_FREG_OFF(44)]
	std	%f46, [%o7+KDATA_FREG_OFF(46)]
	std	%f48, [%o7+KDATA_FREG_OFF(48)]
	std	%f50, [%o7+KDATA_FREG_OFF(50)]
	std	%f52, [%o7+KDATA_FREG_OFF(52)]
	std	%f54, [%o7+KDATA_FREG_OFF(54)]
	std	%f56, [%o7+KDATA_FREG_OFF(56)]
	std	%f58, [%o7+KDATA_FREG_OFF(58)]
	std	%f60, [%o7+KDATA_FREG_OFF(60)]
	std	%f62, [%o7+KDATA_FREG_OFF(62)]

						! save %asi
#if !defined(NIAGARA2)
	rd	%asr3, %o1
#endif
	st	%o1, [%o7+KDATA_ASI_OFF]
1:
#else
! 23 nop's so silicon/sim va's match
	nop ; nop ; nop ; nop ; nop
	nop ; nop ; nop ; nop ; nop
	nop ; nop ; nop ; nop ; nop
	nop ; nop ; nop ; nop ; nop
	nop ; nop ; nop
#endif

	ret
	restore

!----------------------------------------------------------------------
.seg	"text"
_kaos_page_end:

/************************************************************************
   Include random code and data
 ************************************************************************/
#define KTEXT_MODULE(mod, va) SECTION mod TEXT_VA=va
#define KDATA_MODULE(mod, va) SECTION mod DATA_VA=va


!    kaos version   4.2
!    thread         0
!    icount         5000
!    targetid       NIAGARA:SIM
!    hostid         NIAGARA:5.8
!    areas          1
!    areasize       64
!    areaoffset     2240
!    ncache         0
!    emulate_ncache 1
!    pagesize       8192
!    invsize        0
!    codecount      5005
!    code           30518000
!    entry          30518000
!    fsr_exceptions 00000000
!    fsr_roundmode  00000004
!    fsr_mask       c0000fff
!    seed           d3d4c9dc4871
!    va_map         0000000000400000,000000003fffffff
!    pa_cached      0000000000400000,000000003fffffff
!    pa_noncached   000001ff00000000,000001ff7fffffff
!    weights        /import/n2-aus-localdir1/ntran/n2cdmspp/verif/diag/assembly/kaos/weights_files/allv9_n2.w
!    begcount       0
!    endcount       5000
!    dwords         8
!    ldblocks       0
!    stblocks       0
!    ldfsr_words    0
!    annul          1
!    predict        1
!    iudepend       0
!    bug            65535

#if !defined(KGLOBAL)
#define KGLOBAL(a) .global a
#endif

#if !defined(SYM)
#define SYM(a) /**/a
#endif

#if !defined(KTEXT_MODULE)
#define KTEXT_MODULE(module, va)
#endif

#if !defined(KDATA_MODULE)
#define KDATA_MODULE(module, va)
#endif

KTEXT_MODULE(t0_module_ktbl, 0x30518000)
.seg "text"
	KGLOBAL(t0_ktbl)
t0_ktbl_page_begin:
.global t0_kref; t0_kref:
	.skip 0
t0_ktbl:
	.word	0xc76e3ff8	! t0_kref+0x0:   	prefetch	%i0 - 8, 3
	.word	0xd2062010	! t0_kref+0x4:   	ld	[%i0 + 0x10], %o1
	.word	0xd828a028	! t0_kref+0x8:   	stb	%o4, [%g2 + 0x28]
	.word	0xe59f5058	! t0_kref+0xc:   	ldda	[%i5 + %i0]0x82, %f18
	.word	0xd40e201a	! t0_kref+0x10:   	ldub	[%i0 + 0x1a], %o2
	.word	0xab380000	! t0_kref+0x14:   	sra	%g0, %g0, %l5
	.word	0x81aacab5	! t0_kref+0x18:   	fcmpes	%fcc0, %f11, %f21
	.word	0x81ab0a28	! t0_kref+0x1c:   	fcmps	%fcc0, %f12, %f8
	.word	0xc028a032	! t0_kref+0x20:   	clrb	[%g2 + 0x32]
	.word	0x9fb54fa9	! t0_kref+0x24:   	fors	%f21, %f9, %f15
	.word	0xd2ee101a	! t0_kref+0x28:   	ldstuba	[%i0 + %i2]0x80, %o1
	.word	0x95b2c6ac	! t0_kref+0x2c:   	fmul8x16al	%f11, %f12, %f10
	.word	0x92a0000c	! t0_kref+0x30:   	subcc	%g0, %o4, %o1
	.word	0x9de3bfa0	! t0_kref+0x34:   	save	%sp, -0x60, %sp
	.word	0xafef0018	! t0_kref+0x38:   	restore	%i4, %i0, %l7
	.word	0xa9a0012c	! t0_kref+0x3c:   	fabss	%f12, %f20
	.word	0xa9b44aec	! t0_kref+0x40:   	fpsub32s	%f17, %f12, %f20
	.word	0xa6534000	! t0_kref+0x44:   	umul	%o5, %g0, %l3
	.word	0x9de3bfa0	! t0_kref+0x48:   	save	%sp, -0x60, %sp
	.word	0x95ef3f09	! t0_kref+0x4c:   	restore	%i4, -0xf7, %o2
	.word	0xa1a38854	! t0_kref+0x50:   	faddd	%f14, %f20, %f16
	.word	0xd1be5a5b	! t0_kref+0x54:   	stda	%f8, [%i1 + %i3]0xd2
	.word	0x9ba00531	! t0_kref+0x58:   	fsqrts	%f17, %f13
	.word	0xa5a01929	! t0_kref+0x5c:   	fstod	%f9, %f18
	.word	0xe96e6000	! t0_kref+0x60:   	prefetch	%i1, 20
	.word	0x878020d2	! t0_kref+0x64:   	mov	0xd2, %asi
	.word	0xabb2048e	! t0_kref+0x68:   	fcmple32	%f8, %f14, %l5
	.word	0xac3b7ae2	! t0_kref+0x6c:   	xnor	%o5, -0x51e, %l6
	.word	0xaaa375ad	! t0_kref+0x70:   	subcc	%o5, -0xa53, %l5
	.word	0xacf369f0	! t0_kref+0x74:   	udivcc	%o5, 0x9f0, %l6
	.word	0xd51fbf08	! t0_kref+0x78:   	ldd	[%fp - 0xf8], %f10
	.word	0x95400000	! t0_kref+0x7c:   	mov	%y, %o2
	.word	0x37480007	! t0_kref+0x80:   	fbge,a,pt	%fcc0, _kref+0x9c
	.word	0xef68a08c	! t0_kref+0x84:   	prefetch	%g2 + 0x8c, 23
	call	SYM(t0_subr2)
	.word	0xd836401b	! t0_kref+0x8c:   	sth	%o4, [%i1 + %i3]
	.word	0xaba01a52	! t0_kref+0x90:   	fdtoi	%f18, %f21
	.word	0xe56e401a	! t0_kref+0x94:   	prefetch	%i1 + %i2, 18
	.word	0xa87b0000	! t0_kref+0x98:   	sdiv	%o4, %g0, %l4
	.word	0x93a000ab	! t0_kref+0x9c:   	fnegs	%f11, %f9
	.word	0x9da01a29	! t0_kref+0xa0:   	fstoi	%f9, %f14
	.word	0xead01018	! t0_kref+0xa4:   	ldsha	[%g0 + %i0]0x80, %l5
	.word	0xd008a02a	! t0_kref+0xa8:   	ldub	[%g2 + 0x2a], %o0
	.word	0x2b480005	! t0_kref+0xac:   	fbug,a,pt	%fcc0, _kref+0xc0
	.word	0xa3a000aa	! t0_kref+0xb0:   	fnegs	%f10, %f17
	.word	0xa6a37c1d	! t0_kref+0xb4:   	subcc	%o5, -0x3e3, %l3
	.word	0x930b0000	! t0_kref+0xb8:   	tsubcc	%o4, %g0, %o1
	.word	0xadb34000	! t0_kref+0xbc:   	edge8	%o5, %g0, %l6
	.word	0xa6ab353f	! t0_kref+0xc0:   	andncc	%o4, -0xac1, %l3
	call	SYM(t0_subr0)
	.word	0xa6fb4000	! t0_kref+0xc8:   	sdivcc	%o5, %g0, %l3
	.word	0xd9be1840	! t0_kref+0xcc:   	stda	%f12, [%i0]0xc2
	.word	0xaefb400c	! t0_kref+0xd0:   	sdivcc	%o5, %o4, %l7
	.word	0x9da00130	! t0_kref+0xd4:   	fabss	%f16, %f14
	.word	0x95a2cd2b	! t0_kref+0xd8:   	fsmuld	%f11, %f11, %f10
	.word	0x91a388ca	! t0_kref+0xdc:   	fsubd	%f14, %f10, %f8
	.word	0xe6164000	! t0_kref+0xe0:   	lduh	[%i1], %l3
	.word	0xea070018	! t0_kref+0xe4:   	ld	[%i4 + %i0], %l5
	.word	0xa85b000d	! t0_kref+0xe8:   	smul	%o4, %o5, %l4
	.word	0xd410a000	! t0_kref+0xec:   	lduh	[%g2], %o2
	.word	0xe800a010	! t0_kref+0xf0:   	ld	[%g2 + 0x10], %l4
	.word	0x9fc10000	! t0_kref+0xf4:   	call	%g4
	.word	0xa9b68280	! t0_kref+0xf8:   	array32	%i2, %g0, %l4
	.word	0xaee03afe	! t0_kref+0xfc:   	subccc	%g0, -0x502, %l7
	.word	0xec060000	! t0_kref+0x100:   	ld	[%i0], %l6
	.word	0x90d820f9	! t0_kref+0x104:   	smulcc	%g0, 0xf9, %o0
	.word	0x99a00534	! t0_kref+0x108:   	fsqrts	%f20, %f12
	.word	0xa7a00533	! t0_kref+0x10c:   	fsqrts	%f19, %f19
	.word	0x2f480001	! t0_kref+0x110:   	fbu,a,pt	%fcc0, _kref+0x114
	.word	0x95a01891	! t0_kref+0x114:   	fitos	%f17, %f10
	.word	0xab400000	! t0_kref+0x118:   	mov	%y, %l5
	.word	0x81aaca2a	! t0_kref+0x11c:   	fcmps	%fcc0, %f11, %f10
	.word	0x91a00129	! t0_kref+0x120:   	fabss	%f9, %f8
	.word	0x951b000c	! t0_kref+0x124:   	tsubcctv	%o4, %o4, %o2
	.word	0xac7e801a	! t0_kref+0x128:   	sdiv	%i2, %i2, %l6
	call	1f
	.empty
	.word	0x9db286c8	! t0_kref+0x130:   	fmul8sux16	%f10, %f8, %f14
	.word	0xa5b48d40	! t0_kref+0x134:   	fnot1	%f18, %f18
	.word	0xe6060000	! t0_kref+0x138:   	ld	[%i0], %l3
	.word	0xd0167ffe	! t0_kref+0x13c:   	lduh	[%i1 - 2], %o0
1:	.word	0x9533201a	! t0_kref+0x140:   	srl	%o4, 0x1a, %o2
	.word	0xda2e4000	! t0_kref+0x144:   	stb	%o5, [%i1]
	.word	0xfd6e001b	! t0_kref+0x148:   	prefetch	%i0 + %i3, 30
	.word	0xa88e801a	! t0_kref+0x14c:   	andcc	%i2, %i2, %l4
	.word	0x95a388d4	! t0_kref+0x150:   	fsubd	%f14, %f20, %f10
	.word	0xee4e3ff7	! t0_kref+0x154:   	ldsb	[%i0 - 9], %l7
	.word	0xe06e8019	! t0_kref+0x158:   	ldstub	[%i2 + %i1], %l0
	.word	0xaeb32a98	! t0_kref+0x15c:   	orncc	%o4, 0xa98, %l7
	.word	0x95a00133	! t0_kref+0x160:   	fabss	%f19, %f10
	.word	0xa7a000ad	! t0_kref+0x164:   	fnegs	%f13, %f19
	.word	0xda6e001a	! t0_kref+0x168:   	ldstub	[%i0 + %i2], %o5
	.word	0x9253001a	! t0_kref+0x16c:   	umul	%o4, %i2, %o1
	.word	0x92a3400d	! t0_kref+0x170:   	subcc	%o5, %o5, %o1
	.word	0xaba309b1	! t0_kref+0x174:   	fdivs	%f12, %f17, %f21
	.word	0xdb00a030	! t0_kref+0x178:   	ld	[%g2 + 0x30], %f13
	.word	0x9ba01a2e	! t0_kref+0x17c:   	fstoi	%f14, %f13
	.word	0x20800006	! t0_kref+0x180:   	bn,a	_kref+0x198
	.word	0xa7b40588	! t0_kref+0x184:   	fcmpgt32	%f16, %f8, %l3
	.word	0xa1a34829	! t0_kref+0x188:   	fadds	%f13, %f9, %f16
	.word	0x91a388d2	! t0_kref+0x18c:   	fsubd	%f14, %f18, %f8
	.word	0xd700a018	! t0_kref+0x190:   	ld	[%g2 + 0x18], %f11
	.word	0xa7a00033	! t0_kref+0x194:   	fmovs	%f19, %f19
	.word	0x9de3bfa0	! t0_kref+0x198:   	save	%sp, -0x60, %sp
	.word	0xafef001a	! t0_kref+0x19c:   	restore	%i4, %i2, %l7
	.word	0x95a00531	! t0_kref+0x1a0:   	fsqrts	%f17, %f10
	.word	0x923b000d	! t0_kref+0x1a4:   	xnor	%o4, %o5, %o1
	.word	0xa1b40c8c	! t0_kref+0x1a8:   	fandnot2	%f16, %f12, %f16
	.word	0xaf33001a	! t0_kref+0x1ac:   	srl	%o4, %i2, %l7
	.word	0x99a0012f	! t0_kref+0x1b0:   	fabss	%f15, %f12
	.word	0x9ba549b4	! t0_kref+0x1b4:   	fdivs	%f21, %f20, %f13
	.word	0x9da349b5	! t0_kref+0x1b8:   	fdivs	%f13, %f21, %f14
	.word	0xd2067fe0	! t0_kref+0x1bc:   	ld	[%i1 - 0x20], %o1
	.word	0xd40e401a	! t0_kref+0x1c0:   	ldub	[%i1 + %i2], %o2
	.word	0xc768a088	! t0_kref+0x1c4:   	prefetch	%g2 + 0x88, 3
	.word	0x81800000	! t0_kref+0x1c8:   	mov	%g0, %y
	.word	0xe81e2008	! t0_kref+0x1cc:   	ldd	[%i0 + 8], %l4
	.word	0x25800008	! t0_kref+0x1d0:   	fblg,a	_kref+0x1f0
	.word	0xabb0003a	! t0_kref+0x1d4:   	edge8n	%g0, %i2, %l5
	.word	0x9f414000	! t0_kref+0x1d8:   	mov	%pc, %o7
	.word	0x97b28fb2	! t0_kref+0x1dc:   	fors	%f10, %f18, %f11
	.word	0xa9a488ae	! t0_kref+0x1e0:   	fsubs	%f18, %f14, %f20
	.word	0xec86101c	! t0_kref+0x1e4:   	lda	[%i0 + %i4]0x80, %l6
	.word	0x92fead5b	! t0_kref+0x1e8:   	sdivcc	%i2, 0xd5b, %o1
	.word	0xac668000	! t0_kref+0x1ec:   	subc	%i2, %g0, %l6
	.word	0x8143e040	! t0_kref+0x1f0:   	membar	0x40
	.word	0x943eb364	! t0_kref+0x1f4:   	xnor	%i2, -0xc9c, %o2
	.word	0xa6a34000	! t0_kref+0x1f8:   	subcc	%o5, %g0, %l3
	.word	0x2f2ecc85	! t0_kref+0x1fc:   	sethi	%hi(0xbb321400), %l7
	.word	0xe810a00a	! t0_kref+0x200:   	lduh	[%g2 + 0xa], %l4
	.word	0xeb000018	! t0_kref+0x204:   	ld	[%g0 + %i0], %f21
	.word	0xaa1b7823	! t0_kref+0x208:   	xor	%o5, -0x7dd, %l5
	.word	0x95b28d40	! t0_kref+0x20c:   	fnot1	%f10, %f10
	.word	0xc368a040	! t0_kref+0x210:   	prefetch	%g2 + 0x40, 1
	.word	0xa6ab001a	! t0_kref+0x214:   	andncc	%o4, %i2, %l3
	.word	0xa5a30835	! t0_kref+0x218:   	fadds	%f12, %f21, %f18
	.word	0xc06e8019	! t0_kref+0x21c:   	ldstub	[%i2 + %i1], %g0
	.word	0xe800a000	! t0_kref+0x220:   	ld	[%g2], %l4
	.word	0x92c6abc0	! t0_kref+0x224:   	addccc	%i2, 0xbc0, %o1
	.word	0x99a00132	! t0_kref+0x228:   	fabss	%f18, %f12
	.word	0x9fa00029	! t0_kref+0x22c:   	fmovs	%f9, %f15
	.word	0xe168a085	! t0_kref+0x230:   	prefetch	%g2 + 0x85, 16
	.word	0x9da01912	! t0_kref+0x234:   	fitod	%f18, %f14
	.word	0xd8e81018	! t0_kref+0x238:   	ldstuba	[%g0 + %i0]0x80, %o4
	.word	0x3a480001	! t0_kref+0x23c:   	bcc,a,pt	%icc, _kref+0x240
	.word	0xaba4c830	! t0_kref+0x240:   	fadds	%f19, %f16, %f21
	.word	0xa5b20e4a	! t0_kref+0x244:   	fxnor	%f8, %f10, %f18
	.word	0x99b28dca	! t0_kref+0x248:   	fnand	%f10, %f10, %f12
	.word	0xa9a2084e	! t0_kref+0x24c:   	faddd	%f8, %f14, %f20
	.word	0xec1f4018	! t0_kref+0x250:   	ldd	[%i5 + %i0], %l6
	.word	0x25480003	! t0_kref+0x254:   	fblg,a,pt	%fcc0, _kref+0x260
	.word	0xaa1b77f4	! t0_kref+0x258:   	xor	%o5, -0x80c, %l5
	.word	0xd248a003	! t0_kref+0x25c:   	ldsb	[%g2 + 3], %o1
	.word	0xa5b44a70	! t0_kref+0x260:   	fpadd32s	%f17, %f16, %f18
	.word	0xa9330000	! t0_kref+0x264:   	srl	%o4, %g0, %l4
	.word	0xa9400000	! t0_kref+0x268:   	mov	%y, %l4
	.word	0x35480002	! t0_kref+0x26c:   	fbue,a,pt	%fcc0, _kref+0x274
	.word	0x9073000d	! t0_kref+0x270:   	udiv	%o4, %o5, %o0
	.word	0x92702945	! t0_kref+0x274:   	udiv	%g0, 0x945, %o1
	.word	0x97b20d60	! t0_kref+0x278:   	fnot1s	%f8, %f11
	.word	0xa7b34cb3	! t0_kref+0x27c:   	fandnot2s	%f13, %f19, %f19
	.word	0xebf6501a	! t0_kref+0x280:   	casxa	[%i1]0x80, %i2, %l5
	sethi	%hi(2f), %o7
	.word	0xe40be2c4	! t0_kref+0x288:   	ldub	[%o7 + 0x2c4], %l2
	.word	0xa41ca00c	! t0_kref+0x28c:   	xor	%l2, 0xc, %l2
	.word	0xe42be2c4	! t0_kref+0x290:   	stb	%l2, [%o7 + 0x2c4]
	.word	0x81dbe2c4	! t0_kref+0x294:   	flush	%o7 + 0x2c4
	.word	0x91a01911	! t0_kref+0x298:   	fitod	%f17, %f8
	.word	0xd248a02b	! t0_kref+0x29c:   	ldsb	[%g2 + 0x2b], %o1
	.word	0x9fb2cd60	! t0_kref+0x2a0:   	fnot1s	%f11, %f15
	.word	0x95a309a8	! t0_kref+0x2a4:   	fdivs	%f12, %f8, %f10
	.word	0x91a01a2e	! t0_kref+0x2a8:   	fstoi	%f14, %f8
	.word	0x81ac8aaf	! t0_kref+0x2ac:   	fcmpes	%fcc0, %f18, %f15
	.word	0xae5375f6	! t0_kref+0x2b0:   	umul	%o5, -0xa0a, %l7
	.word	0xa7a00534	! t0_kref+0x2b4:   	fsqrts	%f20, %f19
	.word	0xee10a012	! t0_kref+0x2b8:   	lduh	[%g2 + 0x12], %l7
	.word	0xa5b48d40	! t0_kref+0x2bc:   	fnot1	%f18, %f18
	.word	0xae5379ab	! t0_kref+0x2c0:   	umul	%o5, -0x655, %l7
2:	.word	0xa933201c	! t0_kref+0x2c4:   	srl	%o4, 0x1c, %l4
	.word	0x9fc00004	! t0_kref+0x2c8:   	call	%g0 + %g4
	.word	0x94febd3c	! t0_kref+0x2cc:   	sdivcc	%i2, -0x2c4, %o2
	.word	0x81aa8ab5	! t0_kref+0x2d0:   	fcmpes	%fcc0, %f10, %f21
	.word	0xaf3e801a	! t0_kref+0x2d4:   	sra	%i2, %i2, %l7
	.word	0xd8700019	! t0_kref+0x2d8:   	stx	%o4, [%g0 + %i1]
	.word	0xf420a028	! t0_kref+0x2dc:   	st	%i2, [%g2 + 0x28]
	.word	0xe0680019	! t0_kref+0x2e0:   	ldstub	[%g0 + %i1], %l0
	.word	0xa89e801a	! t0_kref+0x2e4:   	xorcc	%i2, %i2, %l4
	.word	0xe168a081	! t0_kref+0x2e8:   	prefetch	%g2 + 0x81, 16
	.word	0x90ae800d	! t0_kref+0x2ec:   	andncc	%i2, %o5, %o0
	.word	0x95302002	! t0_kref+0x2f0:   	srl	%g0, 0x2, %o2
	.word	0xad400000	! t0_kref+0x2f4:   	mov	%y, %l6
	.word	0xd1be5880	! t0_kref+0x2f8:   	stda	%f8, [%i1]0xc4
	.word	0xaec02228	! t0_kref+0x2fc:   	addccc	%g0, 0x228, %l7
	.word	0xa5b20dd0	! t0_kref+0x300:   	fnand	%f8, %f16, %f18
	.word	0xe5bf5018	! t0_kref+0x304:   	stda	%f18, [%i5 + %i0]0x80
	.word	0xea5e3fe0	! t0_kref+0x308:   	ldx	[%i0 - 0x20], %l5
	.word	0xa623001a	! t0_kref+0x30c:   	sub	%o4, %i2, %l3
	.word	0x97b50a6e	! t0_kref+0x310:   	fpadd32s	%f20, %f14, %f11
	.word	0xc02e8018	! t0_kref+0x314:   	clrb	[%i2 + %i0]
	.word	0xa69ebdeb	! t0_kref+0x318:   	xorcc	%i2, -0x215, %l3
	.word	0x3d480006	! t0_kref+0x31c:   	fbule,a,pt	%fcc0, _kref+0x334
	.word	0xae03000c	! t0_kref+0x320:   	add	%o4, %o4, %l7
	.word	0xd248a00b	! t0_kref+0x324:   	ldsb	[%g2 + 0xb], %o1
	.word	0xea780018	! t0_kref+0x328:   	swap	[%g0 + %i0], %l5
	.word	0x93b34140	! t0_kref+0x32c:   	edge32l	%o5, %g0, %o1
	.word	0x926366b9	! t0_kref+0x330:   	subc	%o5, 0x6b9, %o1
	.word	0x3e800006	! t0_kref+0x334:   	bvc,a	_kref+0x34c
	.word	0xa7400000	! t0_kref+0x338:   	mov	%y, %l3
	.word	0xda20a018	! t0_kref+0x33c:   	st	%o5, [%g2 + 0x18]
	.word	0xd3062004	! t0_kref+0x340:   	ld	[%i0 + 4], %f9
	.word	0x91b00f35	! t0_kref+0x344:   	fsrc2s	%f21, %f8
	.word	0xd4070018	! t0_kref+0x348:   	ld	[%i4 + %i0], %o2
	.word	0xaf2b401a	! t0_kref+0x34c:   	sll	%o5, %i2, %l7
	.word	0x913b001a	! t0_kref+0x350:   	sra	%o4, %i2, %o0
	.word	0xae8b6e19	! t0_kref+0x354:   	andcc	%o5, 0xe19, %l7
	.word	0xe498105d	! t0_kref+0x358:   	ldda	[%g0 + %i5]0x82, %l2
	.word	0xe81e2008	! t0_kref+0x35c:   	ldd	[%i0 + 8], %l4
	.word	0xe4086040	! t0_kref+0x360:   	ldub	[%g1 + 0x40], %l2
	.word	0xa41ca00c	! t0_kref+0x364:   	xor	%l2, 0xc, %l2
	.word	0xe4286040	! t0_kref+0x368:   	stb	%l2, [%g1 + 0x40]
	.word	0x81d86040	! t0_kref+0x36c:   	flush	%g1 + 0x40
	.word	0xa6b82f75	! t0_kref+0x370:   	xnorcc	%g0, 0xf75, %l3
	.word	0x925e8000	! t0_kref+0x374:   	smul	%i2, %g0, %o1
	.word	0xa9a408b5	! t0_kref+0x378:   	fsubs	%f16, %f21, %f20
	.word	0xa5a4084e	! t0_kref+0x37c:   	faddd	%f16, %f14, %f18
	.word	0xa69b000d	! t0_kref+0x380:   	xorcc	%o4, %o5, %l3
	.word	0xaef8287c	! t0_kref+0x384:   	sdivcc	%g0, 0x87c, %l7
	.word	0xe300a008	! t0_kref+0x388:   	ld	[%g2 + 8], %f17
	.word	0x91a488c8	! t0_kref+0x38c:   	fsubd	%f18, %f8, %f8
	.word	0xe300a020	! t0_kref+0x390:   	ld	[%g2 + 0x20], %f17
	.word	0xa6e3001a	! t0_kref+0x394:   	subccc	%o4, %i2, %l3
	.word	0xf007bfe0	! t0_kref+0x398:   	ld	[%fp - 0x20], %i0
	.word	0xa5b007b0	! t0_kref+0x39c:   	fpackfix	%f16, %f18
	.word	0xa1b00c00	! t0_kref+0x3a0:   	fzero	%f16
	.word	0xa7b3416d	! t0_kref+0x3a4:   	edge32ln	%o5, %o5, %l3
	.word	0xee464000	! t0_kref+0x3a8:   	ldsw	[%i1], %l7
2:	.word	0xd210a038	! t0_kref+0x3ac:   	lduh	[%g2 + 0x38], %o1
	.word	0x92fb4000	! t0_kref+0x3b0:   	sdivcc	%o5, %g0, %o1
	.word	0x3b480003	! t0_kref+0x3b4:   	fble,a,pt	%fcc0, _kref+0x3c0
	.word	0xc030a010	! t0_kref+0x3b8:   	clrh	[%g2 + 0x10]
	.word	0x91b20c48	! t0_kref+0x3bc:   	fnor	%f8, %f8, %f8
	.word	0x93b68300	! t0_kref+0x3c0:   	alignaddr	%i2, %g0, %o1
	.word	0x9fa01a50	! t0_kref+0x3c4:   	fdtoi	%f16, %f15
	.word	0x81ac0ad0	! t0_kref+0x3c8:   	fcmped	%fcc0, %f16, %f16
	.word	0xe610a02a	! t0_kref+0x3cc:   	lduh	[%g2 + 0x2a], %l3
	.word	0xa5b30dce	! t0_kref+0x3d0:   	fnand	%f12, %f14, %f18
	.word	0xe8067ffc	! t0_kref+0x3d4:   	ld	[%i1 - 4], %l4
	.word	0xda280018	! t0_kref+0x3d8:   	stb	%o5, [%g0 + %i0]
	.word	0xacf8000d	! t0_kref+0x3dc:   	sdivcc	%g0, %o5, %l6
	.word	0xa83b001a	! t0_kref+0x3e0:   	xnor	%o4, %i2, %l4
	.word	0x9db50d60	! t0_kref+0x3e4:   	fnot1s	%f20, %f14
	.word	0x95a30852	! t0_kref+0x3e8:   	faddd	%f12, %f18, %f10
	.word	0xa5a30830	! t0_kref+0x3ec:   	fadds	%f12, %f16, %f18
	.word	0x99b50e08	! t0_kref+0x3f0:   	fand	%f20, %f8, %f12
	.word	0xeace9018	! t0_kref+0x3f4:   	ldsba	[%i2 + %i0]0x80, %l5
	.word	0xa3a00028	! t0_kref+0x3f8:   	fmovs	%f8, %f17
	.word	0xa9a388b4	! t0_kref+0x3fc:   	fsubs	%f14, %f20, %f20
	.word	0x97a3082a	! t0_kref+0x400:   	fadds	%f12, %f10, %f11
	.word	0xa3a0002c	! t0_kref+0x404:   	fmovs	%f12, %f17
	.word	0xa69ea707	! t0_kref+0x408:   	xorcc	%i2, 0x707, %l3
	.word	0xaa4037f9	! t0_kref+0x40c:   	addc	%g0, -0x807, %l5
	.word	0xa6236630	! t0_kref+0x410:   	sub	%o5, 0x630, %l3
	.word	0xe320a000	! t0_kref+0x414:   	st	%f17, [%g2]
	.word	0x99a288d0	! t0_kref+0x418:   	fsubd	%f10, %f16, %f12
	.word	0xd99f5058	! t0_kref+0x41c:   	ldda	[%i5 + %i0]0x82, %f12
	.word	0xe8d6501b	! t0_kref+0x420:   	ldsha	[%i1 + %i3]0x80, %l4
	.word	0xd7e6100c	! t0_kref+0x424:   	casa	[%i0]0x80, %o4, %o3
	.word	0xe8d81019	! t0_kref+0x428:   	ldxa	[%g0 + %i1]0x80, %l4
	.word	0xdd1e7ff0	! t0_kref+0x42c:   	ldd	[%i1 - 0x10], %f14
	.word	0xc020a010	! t0_kref+0x430:   	clr	[%g2 + 0x10]
	.word	0xa9a00534	! t0_kref+0x434:   	fsqrts	%f20, %f20
	.word	0xae06800c	! t0_kref+0x438:   	add	%i2, %o4, %l7
	.word	0x93400000	! t0_kref+0x43c:   	mov	%y, %o1
	.word	0x8143e040	! t0_kref+0x440:   	membar	0x40
	.word	0x920331ab	! t0_kref+0x444:   	add	%o4, -0xe55, %o1
	.word	0x99b48c92	! t0_kref+0x448:   	fandnot2	%f18, %f18, %f12
	.word	0xa8d8000d	! t0_kref+0x44c:   	smulcc	%g0, %o5, %l4
	.word	0xa866800c	! t0_kref+0x450:   	subc	%i2, %o4, %l4
	.word	0xa1b38e80	! t0_kref+0x454:   	fsrc1	%f14, %f16
	.word	0xab382018	! t0_kref+0x458:   	sra	%g0, 0x18, %l5
	.word	0xd830a00a	! t0_kref+0x45c:   	sth	%o4, [%g2 + 0xa]
	.word	0xdd067fe8	! t0_kref+0x460:   	ld	[%i1 - 0x18], %f14
	.word	0xa9b50c4e	! t0_kref+0x464:   	fnor	%f20, %f14, %f20
	.word	0x95a28950	! t0_kref+0x468:   	fmuld	%f10, %f16, %f10
	.word	0x25480004	! t0_kref+0x46c:   	fblg,a,pt	%fcc0, _kref+0x47c
	.word	0xaba00531	! t0_kref+0x470:   	fsqrts	%f17, %f21
	.word	0xa81b7eb8	! t0_kref+0x474:   	xor	%o5, -0x148, %l4
	.word	0x33480003	! t0_kref+0x478:   	fbe,a,pt	%fcc0, _kref+0x484
	.word	0x9ba0052d	! t0_kref+0x47c:   	fsqrts	%f13, %f13
	.word	0xd26e401a	! t0_kref+0x480:   	ldstub	[%i1 + %i2], %o1
	.word	0xe86e3ffa	! t0_kref+0x484:   	ldstub	[%i0 - 6], %l4
	.word	0x91b3cdf5	! t0_kref+0x488:   	fnands	%f15, %f21, %f8
	.word	0xee50a008	! t0_kref+0x48c:   	ldsh	[%g2 + 8], %l7
	.word	0x91b50c4c	! t0_kref+0x490:   	fnor	%f20, %f12, %f8
	.word	0x81db8000	! t0_kref+0x494:   	flush	%sp
	.word	0x99a348a9	! t0_kref+0x498:   	fsubs	%f13, %f9, %f12
	.word	0xa9a0108c	! t0_kref+0x49c:   	fxtos	%f12, %f20
	.word	0xa9a449b0	! t0_kref+0x4a0:   	fdivs	%f17, %f16, %f20
	.word	0xdb20a010	! t0_kref+0x4a4:   	st	%f13, [%g2 + 0x10]
	.word	0xac8b400c	! t0_kref+0x4a8:   	andcc	%o5, %o4, %l6
	.word	0x81dab576	! t0_kref+0x4ac:   	flush	%o2 - 0xa8a
	.word	0xb4102000	! t0_kref+0x4b0:   	mov	0x0, %i2
	.word	0x9066b423	! t0_kref+0x4b4:   	subc	%i2, -0xbdd, %o0
	.word	0xf430a020	! t0_kref+0x4b8:   	sth	%i2, [%g2 + 0x20]
	.word	0xaab3001a	! t0_kref+0x4bc:   	orncc	%o4, %i2, %l5
	.word	0x91a289b5	! t0_kref+0x4c0:   	fdivs	%f10, %f21, %f8
	.word	0xa3a4c9b5	! t0_kref+0x4c4:   	fdivs	%f19, %f21, %f17
	.word	0x91a2cd28	! t0_kref+0x4c8:   	fsmuld	%f11, %f8, %f8
	.word	0xab1332ca	! t0_kref+0x4cc:   	taddcctv	%o4, -0xd36, %l5
	.word	0x81830000	! t0_kref+0x4d0:   	wr	%o4, %g0, %y
	.word	0x81ac0aca	! t0_kref+0x4d4:   	fcmped	%fcc0, %f16, %f10
	.word	0xe5062018	! t0_kref+0x4d8:   	ld	[%i0 + 0x18], %f18
	.word	0xabb28594	! t0_kref+0x4dc:   	fcmpgt32	%f10, %f20, %l5
	.word	0x9fa01a48	! t0_kref+0x4e0:   	fdtoi	%f8, %f15
	.word	0x97a00130	! t0_kref+0x4e4:   	fabss	%f16, %f11
	.word	0xa9b00f0c	! t0_kref+0x4e8:   	fsrc2	%f12, %f20
	.word	0x913b001a	! t0_kref+0x4ec:   	sra	%o4, %i2, %o0
	.word	0x81ab8ab3	! t0_kref+0x4f0:   	fcmpes	%fcc0, %f14, %f19
	.word	0x37480007	! t0_kref+0x4f4:   	fbge,a,pt	%fcc0, _kref+0x510
	.word	0xd4482b8c	! t0_kref+0x4f8:   	ldsb	[%g0 + 0xb8c], %o2
	.word	0x94530000	! t0_kref+0x4fc:   	umul	%o4, %g0, %o2
	.word	0x901b001a	! t0_kref+0x500:   	xor	%o4, %i2, %o0
	.word	0x131292d5	! t0_kref+0x504:   	sethi	%hi(0x4a4b5400), %o1
	.word	0x9fa0188b	! t0_kref+0x508:   	fitos	%f11, %f15
	.word	0xea865000	! t0_kref+0x50c:   	lda	[%i1]0x80, %l5
	.word	0x20480003	! t0_kref+0x510:   	bn,a,pt	%icc, _kref+0x51c
	.word	0xd11fbd58	! t0_kref+0x514:   	ldd	[%fp - 0x2a8], %f8
	.word	0xa3a0012b	! t0_kref+0x518:   	fabss	%f11, %f17
	.word	0x9da0002c	! t0_kref+0x51c:   	fmovs	%f12, %f14
	.word	0x81aa0a50	! t0_kref+0x520:   	fcmpd	%fcc0, %f8, %f16
	.word	0x97a0012c	! t0_kref+0x524:   	fabss	%f12, %f11
	.word	0x90c6bcc3	! t0_kref+0x528:   	addccc	%i2, -0x33d, %o0
	.word	0x22800007	! t0_kref+0x52c:   	be,a	_kref+0x548
	.word	0xe610a018	! t0_kref+0x530:   	lduh	[%g2 + 0x18], %l3
	.word	0xa93b4000	! t0_kref+0x534:   	sra	%o5, %g0, %l4
	.word	0x95a2884e	! t0_kref+0x538:   	faddd	%f10, %f14, %f10
	.word	0x9da01911	! t0_kref+0x53c:   	fitod	%f17, %f14
!	.word	0x34bf2ead	! t0_kref+0x540:   	bg,a	SYM(t0_subr1)
	   	bg,a	SYM(t0_subr1)
	.word	0x9f414000	! t0_kref+0x544:   	mov	%pc, %o7
	.word	0x912ea00c	! t0_kref+0x548:   	sll	%i2, 0xc, %o0
	.word	0xc07e0000	! t0_kref+0x54c:   	swap	[%i0], %g0
	.word	0x95a30850	! t0_kref+0x550:   	faddd	%f12, %f16, %f10
	.word	0xe5063ffc	! t0_kref+0x554:   	ld	[%i0 - 4], %f18
	.word	0x91a0052e	! t0_kref+0x558:   	fsqrts	%f14, %f8
	.word	0xe06e3ff8	! t0_kref+0x55c:   	ldstub	[%i0 - 8], %l0
	.word	0x9258001a	! t0_kref+0x560:   	smul	%g0, %i2, %o1
	.word	0xaabb2650	! t0_kref+0x564:   	xnorcc	%o4, 0x650, %l5
	.word	0x92783e2c	! t0_kref+0x568:   	sdiv	%g0, -0x1d4, %o1
	.word	0xf430a000	! t0_kref+0x56c:   	sth	%i2, [%g2]
	.word	0x81db3509	! t0_kref+0x570:   	flush	%o4 - 0xaf7
	.word	0x94802931	! t0_kref+0x574:   	addcc	%g0, 0x931, %o2
	.word	0x9463400d	! t0_kref+0x578:   	subc	%o5, %o5, %o2
	.word	0x93418000	! t0_kref+0x57c:   	mov	%fprs, %o1
	.word	0xec00a038	! t0_kref+0x580:   	ld	[%g2 + 0x38], %l6
	.word	0x33480006	! t0_kref+0x584:   	fbe,a,pt	%fcc0, _kref+0x59c
	.word	0x95b50c92	! t0_kref+0x588:   	fandnot2	%f20, %f18, %f10
	.word	0x9096800d	! t0_kref+0x58c:   	orcc	%i2, %o5, %o0
	.word	0x290b2fab	! t0_kref+0x590:   	sethi	%hi(0x2cbeac00), %l4
	.word	0xd51fbc78	! t0_kref+0x594:   	ldd	[%fp - 0x388], %f10
	.word	0xaa46800c	! t0_kref+0x598:   	addc	%i2, %o4, %l5
	.word	0xadb50412	! t0_kref+0x59c:   	fcmple16	%f20, %f18, %l6
	.word	0xa1b38729	! t0_kref+0x5a0:   	fmuld8ulx16	%f14, %f9, %f16
	.word	0xa5b4c6ac	! t0_kref+0x5a4:   	fmul8x16al	%f19, %f12, %f18
	.word	0xaac37c08	! t0_kref+0x5a8:   	addccc	%o5, -0x3f8, %l5
	.word	0xd82e001a	! t0_kref+0x5ac:   	stb	%o4, [%i0 + %i2]
	.word	0x81ad4a2d	! t0_kref+0x5b0:   	fcmps	%fcc0, %f21, %f13
	.word	0x95b485ce	! t0_kref+0x5b4:   	fcmpeq32	%f18, %f14, %o2
	.word	0xa9a48952	! t0_kref+0x5b8:   	fmuld	%f18, %f18, %f20
	.word	0xe6965000	! t0_kref+0x5bc:   	lduha	[%i1]0x80, %l3
	.word	0xd240a038	! t0_kref+0x5c0:   	ldsw	[%g2 + 0x38], %o1
	.word	0x91a00052	! t0_kref+0x5c4:   	fmovd	%f18, %f8
	.word	0xadb34280	! t0_kref+0x5c8:   	array32	%o5, %g0, %l6
	.word	0x92568000	! t0_kref+0x5cc:   	umul	%i2, %g0, %o1
	.word	0xc028a00b	! t0_kref+0x5d0:   	clrb	[%g2 + 0xb]
	.word	0xc028a009	! t0_kref+0x5d4:   	clrb	[%g2 + 9]
	.word	0x21480001	! t0_kref+0x5d8:   	fbn,a,pt	%fcc0, _kref+0x5dc
	.word	0x9da0002c	! t0_kref+0x5dc:   	fmovs	%f12, %f14
	.word	0x930b23ae	! t0_kref+0x5e0:   	tsubcc	%o4, 0x3ae, %o1
	.word	0x35480008	! t0_kref+0x5e4:   	fbue,a,pt	%fcc0, _kref+0x604
	.word	0xa936800d	! t0_kref+0x5e8:   	srl	%i2, %o5, %l4
	.word	0xa1a38d2c	! t0_kref+0x5ec:   	fsmuld	%f14, %f12, %f16
	.word	0xee00a018	! t0_kref+0x5f0:   	ld	[%g2 + 0x18], %l7
	.word	0xc12e3fe4	! t0_kref+0x5f4:   	st	%fsr, [%i0 - 0x1c]
	.word	0x99a209b2	! t0_kref+0x5f8:   	fdivs	%f8, %f18, %f12
	.word	0x81aa4ab0	! t0_kref+0x5fc:   	fcmpes	%fcc0, %f9, %f16
	.word	0x81d9001e	! t0_kref+0x600:   	flush	%g4 + %fp
	.word	0x81ac0aae	! t0_kref+0x604:   	fcmpes	%fcc0, %f16, %f14
	.word	0x95a489af	! t0_kref+0x608:   	fdivs	%f18, %f15, %f10
	.word	0x9473400c	! t0_kref+0x60c:   	udiv	%o5, %o4, %o2
	.word	0x903e800d	! t0_kref+0x610:   	xnor	%i2, %o5, %o0
	.word	0x9bb24aea	! t0_kref+0x614:   	fpsub32s	%f9, %f10, %f13
	.word	0xafb6805a	! t0_kref+0x618:   	edge8l	%i2, %i2, %l7
	.word	0xa944c000	! t0_kref+0x61c:   	mov	%gsr, %l4
	.word	0xead0105b	! t0_kref+0x620:   	ldsha	[%g0 + %i3]0x82, %l5
	.word	0xe60e201a	! t0_kref+0x624:   	ldub	[%i0 + 0x1a], %l3
	.word	0xe60e6000	! t0_kref+0x628:   	ldub	[%i1], %l3
	.word	0xaa80001a	! t0_kref+0x62c:   	addcc	%g0, %i2, %l5
	.word	0xa6930000	! t0_kref+0x630:   	orcc	%o4, %g0, %l3
	.word	0xa1a00028	! t0_kref+0x634:   	fmovs	%f8, %f16
	.word	0xc07e6000	! t0_kref+0x638:   	swap	[%i1], %g0
	.word	0x81aa4a35	! t0_kref+0x63c:   	fcmps	%fcc0, %f9, %f21
	.word	0xf76e3fe0	! t0_kref+0x640:   	prefetch	%i0 - 0x20, 27
	.word	0xae183929	! t0_kref+0x644:   	xor	%g0, -0x6d7, %l7
	.word	0xd82e4000	! t0_kref+0x648:   	stb	%o4, [%i1]
	.word	0x95a249b5	! t0_kref+0x64c:   	fdivs	%f9, %f21, %f10
	.word	0xa7a01a4a	! t0_kref+0x650:   	fdtoi	%f10, %f19
	.word	0x95b0031a	! t0_kref+0x654:   	alignaddr	%g0, %i2, %o2
	.word	0xe856c019	! t0_kref+0x658:   	ldsh	[%i3 + %i1], %l4
	.word	0x94be800c	! t0_kref+0x65c:   	xnorcc	%i2, %o4, %o2
	.word	0x93418000	! t0_kref+0x660:   	mov	%fprs, %o1
	.word	0xab334000	! t0_kref+0x664:   	srl	%o5, %g0, %l5
	.word	0x9db50ecc	! t0_kref+0x668:   	fornot2	%f20, %f12, %f14
	.word	0x94bb3845	! t0_kref+0x66c:   	xnorcc	%o4, -0x7bb, %o2
	.word	0x9db24df2	! t0_kref+0x670:   	fnands	%f9, %f18, %f14
	.word	0x9ba0002a	! t0_kref+0x674:   	fmovs	%f10, %f13
	.word	0x81ac0aac	! t0_kref+0x678:   	fcmpes	%fcc0, %f16, %f12
	.word	0x9bb40ee9	! t0_kref+0x67c:   	fornot2s	%f16, %f9, %f13
	.word	0x91b3410d	! t0_kref+0x680:   	edge32	%o5, %o5, %o0
	.word	0x93b3415a	! t0_kref+0x684:   	edge32l	%o5, %i2, %o1
	.word	0xa6537090	! t0_kref+0x688:   	umul	%o5, -0xf70, %l3
	.word	0x92503795	! t0_kref+0x68c:   	umul	%g0, -0x86b, %o1
	.word	0xe3062010	! t0_kref+0x690:   	ld	[%i0 + 0x10], %f17
	.word	0xd010a030	! t0_kref+0x694:   	lduh	[%g2 + 0x30], %o0
	.word	0x31480003	! t0_kref+0x698:   	fba,a,pt	%fcc0, _kref+0x6a4
	.word	0x99b2cd60	! t0_kref+0x69c:   	fnot1s	%f11, %f12
	.word	0x92db401a	! t0_kref+0x6a0:   	smulcc	%o5, %i2, %o1
	.word	0xf436001b	! t0_kref+0x6a4:   	sth	%i2, [%i0 + %i3]
	.word	0xe86e6002	! t0_kref+0x6a8:   	ldstub	[%i1 + 2], %l4
	.word	0xa836a2be	! t0_kref+0x6ac:   	orn	%i2, 0x2be, %l4
	.word	0xd9be1880	! t0_kref+0x6b0:   	stda	%f12, [%i0]0xc4
	.word	0x95a289ca	! t0_kref+0x6b4:   	fdivd	%f10, %f10, %f10
	.word	0x91b4c6b2	! t0_kref+0x6b8:   	fmul8x16al	%f19, %f18, %f8
	.word	0x91400000	! t0_kref+0x6bc:   	mov	%y, %o0
	.word	0x37480003	! t0_kref+0x6c0:   	fbge,a,pt	%fcc0, _kref+0x6cc
	.word	0xae702684	! t0_kref+0x6c4:   	udiv	%g0, 0x684, %l7
	.word	0x81ad4a2b	! t0_kref+0x6c8:   	fcmps	%fcc0, %f21, %f11
	.word	0xec00a020	! t0_kref+0x6cc:   	ld	[%g2 + 0x20], %l6
	.word	0xabb340fa	! t0_kref+0x6d0:   	edge16ln	%o5, %i2, %l5
	.word	0x2b800003	! t0_kref+0x6d4:   	fbug,a	_kref+0x6e0
	.word	0x93a00032	! t0_kref+0x6d8:   	fmovs	%f18, %f9
	.word	0x91b30f52	! t0_kref+0x6dc:   	fornot1	%f12, %f18, %f8
	.word	0x31800008	! t0_kref+0x6e0:   	fba,a	_kref+0x700
	.word	0xa7b2044c	! t0_kref+0x6e4:   	fcmpne16	%f8, %f12, %l3
	.word	0xa63361f5	! t0_kref+0x6e8:   	orn	%o5, 0x1f5, %l3
	.word	0xe816c000	! t0_kref+0x6ec:   	lduh	[%i3], %l4
	.word	0x9da28850	! t0_kref+0x6f0:   	faddd	%f10, %f16, %f14
	.word	0xf430a03a	! t0_kref+0x6f4:   	sth	%i2, [%g2 + 0x3a]
	.word	0xac40000d	! t0_kref+0x6f8:   	addc	%g0, %o5, %l6
	.word	0xc168a008	! t0_kref+0x6fc:   	prefetch	%g2 + 8, 0
	.word	0x81da22e4	! t0_kref+0x700:   	flush	%o0 + 0x2e4
	.word	0xaaa3215a	! t0_kref+0x704:   	subcc	%o4, 0x15a, %l5
	.word	0xa1a3894a	! t0_kref+0x708:   	fmuld	%f14, %f10, %f16
	.word	0x91b6817a	! t0_kref+0x70c:   	edge32ln	%i2, %i2, %o0
	.word	0x81aa8a54	! t0_kref+0x710:   	fcmpd	%fcc0, %f10, %f20
	.word	0x91b00280	! t0_kref+0x714:   	array32	%g0, %g0, %o0
	.word	0xe640a020	! t0_kref+0x718:   	ldsw	[%g2 + 0x20], %l3
	.word	0x95b00fc0	! t0_kref+0x71c:   	fone	%f10
	.word	0xec40a000	! t0_kref+0x720:   	ldsw	[%g2], %l6
	.word	0xa723001a	! t0_kref+0x724:   	mulscc	%o4, %i2, %l3
	.word	0xc3ee1000	! t0_kref+0x728:   	prefetcha	%i0, 1
	.word	0xad1b0000	! t0_kref+0x72c:   	tsubcctv	%o4, %g0, %l6
	.word	0xe8163ffa	! t0_kref+0x730:   	lduh	[%i0 - 6], %l4
	.word	0xa5a01a29	! t0_kref+0x734:   	fstoi	%f9, %f18
	.word	0xc568a08f	! t0_kref+0x738:   	prefetch	%g2 + 0x8f, 2
	.word	0xf007bfe0	! t0_kref+0x73c:   	ld	[%fp - 0x20], %i0
	.word	0x99a4c82c	! t0_kref+0x740:   	fadds	%f19, %f12, %f12
	.word	0xd47e401c	! t0_kref+0x744:   	swap	[%i1 + %i4], %o2
	.word	0xd11e7ff8	! t0_kref+0x748:   	ldd	[%i1 - 8], %f8
	.word	0xac9b400c	! t0_kref+0x74c:   	xorcc	%o5, %o4, %l6
	.word	0x9fc00004	! t0_kref+0x750:   	call	%g0 + %g4
	.word	0x9023400d	! t0_kref+0x754:   	sub	%o5, %o5, %o0
	.word	0xa6f6abc4	! t0_kref+0x758:   	udivcc	%i2, 0xbc4, %l3
	.word	0xa5b40ecc	! t0_kref+0x75c:   	fornot2	%f16, %f12, %f18
	.word	0xda2e6007	! t0_kref+0x760:   	stb	%o5, [%i1 + 7]
	.word	0xd010a03a	! t0_kref+0x764:   	lduh	[%g2 + 0x3a], %o0
	.word	0xa68b395d	! t0_kref+0x768:   	andcc	%o4, -0x6a3, %l3
	.word	0x90c0000d	! t0_kref+0x76c:   	addccc	%g0, %o5, %o0
	.word	0xae9b000c	! t0_kref+0x770:   	xorcc	%o4, %o4, %l7
	.word	0x39480007	! t0_kref+0x774:   	fbuge,a,pt	%fcc0, _kref+0x790
	.word	0xe81e3ff0	! t0_kref+0x778:   	ldd	[%i0 - 0x10], %l4
	.word	0xa7a488ab	! t0_kref+0x77c:   	fsubs	%f18, %f11, %f19
	call	SYM(t0_subr3)
	.word	0x925b400c	! t0_kref+0x784:   	smul	%o5, %o4, %o1
	.word	0xf4b6d019	! t0_kref+0x788:   	stha	%i2, [%i3 + %i1]0x80
	.word	0xe6ce9018	! t0_kref+0x78c:   	ldsba	[%i2 + %i0]0x80, %l3
	.word	0xa7b485cc	! t0_kref+0x790:   	fcmpeq32	%f18, %f12, %l3
	.word	0xda28a010	! t0_kref+0x794:   	stb	%o5, [%g2 + 0x10]
	.word	0xa7a0052a	! t0_kref+0x798:   	fsqrts	%f10, %f19
	.word	0x93b48554	! t0_kref+0x79c:   	fcmpeq16	%f18, %f20, %o1
	.word	0xd19e3fe8	! t0_kref+0x7a0:   	ldda	[%i0 - 0x18]%asi, %f8
	.word	0xaa634000	! t0_kref+0x7a4:   	subc	%o5, %g0, %l5
	.word	0xa5b00c20	! t0_kref+0x7a8:   	fzeros	%f18
	.word	0xaca80000	! t0_kref+0x7ac:   	andncc	%g0, %g0, %l6
	.word	0x9fc00004	! t0_kref+0x7b0:   	call	%g0 + %g4
	.word	0xa9a4cd2e	! t0_kref+0x7b4:   	fsmuld	%f19, %f14, %f20
	.word	0xe76e001c	! t0_kref+0x7b8:   	prefetch	%i0 + %i4, 19
	.word	0xe87e0000	! t0_kref+0x7bc:   	swap	[%i0], %l4
	.word	0x9db28634	! t0_kref+0x7c0:   	fmul8x16	%f10, %f20, %f14
	.word	0xa6730000	! t0_kref+0x7c4:   	udiv	%o4, %g0, %l3
	.word	0x39480003	! t0_kref+0x7c8:   	fbuge,a,pt	%fcc0, _kref+0x7d4
	.word	0xac5832f8	! t0_kref+0x7cc:   	smul	%g0, -0xd08, %l6
	.word	0x90b3400d	! t0_kref+0x7d0:   	orncc	%o5, %o5, %o0
	.word	0x95b2898e	! t0_kref+0x7d4:   	bshuffle	%f10, %f14, %f10
	.word	0x81dab859	! t0_kref+0x7d8:   	flush	%o2 - 0x7a7
	.word	0xa5b50d0a	! t0_kref+0x7dc:   	fandnot1	%f20, %f10, %f18
	.word	0x94d68000	! t0_kref+0x7e0:   	umulcc	%i2, %g0, %o2
	.word	0x9fa00530	! t0_kref+0x7e4:   	fsqrts	%f16, %f15
	.word	0x33480005	! t0_kref+0x7e8:   	fbe,a,pt	%fcc0, _kref+0x7fc
	.word	0x91b28e4a	! t0_kref+0x7ec:   	fxnor	%f10, %f10, %f8
	.word	0x81800000	! t0_kref+0x7f0:   	mov	%g0, %y
	.word	0x81aa0a54	! t0_kref+0x7f4:   	fcmpd	%fcc0, %f8, %f20
	.word	0x3d480003	! t0_kref+0x7f8:   	fbule,a,pt	%fcc0, _kref+0x804
	.word	0xf96e3ff0	! t0_kref+0x7fc:   	prefetch	%i0 - 0x10, 28
	.word	0x99b48dca	! t0_kref+0x800:   	fnand	%f18, %f10, %f12
	.word	0xadb2844a	! t0_kref+0x804:   	fcmpne16	%f10, %f10, %l6
	.word	0xad1b400d	! t0_kref+0x808:   	tsubcctv	%o5, %o5, %l6
	.word	0x99a0190d	! t0_kref+0x80c:   	fitod	%f13, %f12
	.word	0x9ba209ad	! t0_kref+0x810:   	fdivs	%f8, %f13, %f13
	.word	0xa7832e3f	! t0_kref+0x814:   	wr	%o4, 0xe3f, %gsr
	.word	0x95a0192f	! t0_kref+0x818:   	fstod	%f15, %f10
	.word	0x8610200d	! t0_kref+0x81c:   	mov	0xd, %g3
	.word	0x86a0e001	! t0_kref+0x820:   	subcc	%g3, 1, %g3
	.word	0x22800019	! t0_kref+0x824:   	be,a	_kref+0x888
	.word	0x97a00133	! t0_kref+0x828:   	fabss	%f19, %f11
	.word	0x93b34ea0	! t0_kref+0x82c:   	fsrc1s	%f13, %f9
	.word	0x3b4ffffc	! t0_kref+0x830:   	fble,a,pt	%fcc0, _kref+0x820
	.word	0xab200000	! t0_kref+0x834:   	mulscc	%g0, %g0, %l5
	.word	0xe8070018	! t0_kref+0x838:   	ld	[%i4 + %i0], %l4
	.word	0xd448a032	! t0_kref+0x83c:   	ldsb	[%g2 + 0x32], %o2
	.word	0xd0d61000	! t0_kref+0x840:   	ldsha	[%i0]0x80, %o0
	.word	0xea871040	! t0_kref+0x844:   	lda	[%i4]0x82, %l5
	.word	0x91b30492	! t0_kref+0x848:   	fcmple32	%f12, %f18, %o0
	.word	0x81dc71c2	! t0_kref+0x84c:   	flush	%l1 - 0xe3e
	.word	0xd828a010	! t0_kref+0x850:   	stb	%o4, [%g2 + 0x10]
	.word	0x91a5094e	! t0_kref+0x854:   	fmuld	%f20, %f14, %f8
	.word	0xaf23000d	! t0_kref+0x858:   	mulscc	%o4, %o5, %l7
	.word	0xaabb0000	! t0_kref+0x85c:   	xnorcc	%o4, %g0, %l5
	.word	0xae1b6cc0	! t0_kref+0x860:   	xor	%o5, 0xcc0, %l7
	.word	0xe5f61000	! t0_kref+0x864:   	casxa	[%i0]0x80, %g0, %l2
	.word	0x9da00530	! t0_kref+0x868:   	fsqrts	%f16, %f14
	.word	0xe53e0000	! t0_kref+0x86c:   	std	%f18, [%i0]
	.word	0x3b4fffec	! t0_kref+0x870:   	fble,a,pt	%fcc0, _kref+0x820
	.word	0xa89b2f60	! t0_kref+0x874:   	xorcc	%o4, 0xf60, %l4
	.word	0xa7b0076a	! t0_kref+0x878:   	fpack16	%f10, %f19
	.word	0xda36c018	! t0_kref+0x87c:   	sth	%o5, [%i3 + %i0]
	.word	0x9fb20ca9	! t0_kref+0x880:   	fandnot2s	%f8, %f9, %f15
	.word	0xf007bfe0	! t0_kref+0x884:   	ld	[%fp - 0x20], %i0
	.word	0x99a00533	! t0_kref+0x888:   	fsqrts	%f19, %f12
	.word	0xec064000	! t0_kref+0x88c:   	ld	[%i1], %l6
	.word	0xd820a000	! t0_kref+0x890:   	st	%o4, [%g2]
	.word	0x94ab4000	! t0_kref+0x894:   	andncc	%o5, %g0, %o2
	.word	0xaf1b0000	! t0_kref+0x898:   	tsubcctv	%o4, %g0, %l7
	.word	0x95a00535	! t0_kref+0x89c:   	fsqrts	%f21, %f10
	.word	0xa5a01112	! t0_kref+0x8a0:   	fxtod	%f18, %f18
	.word	0x95a01910	! t0_kref+0x8a4:   	fitod	%f16, %f10
	.word	0x83c06550	! t0_kref+0x8a8:   	jmpl	%g1 + 0x550, %g1
	.word	0xafb50508	! t0_kref+0x8ac:   	fcmpgt16	%f20, %f8, %l7
	.word	0xd82e001a	! t0_kref+0x8b0:   	stb	%o4, [%i0 + %i2]
	.word	0xa73e8000	! t0_kref+0x8b4:   	sra	%i2, %g0, %l3
	.word	0x91a000ad	! t0_kref+0x8b8:   	fnegs	%f13, %f8
	.word	0xa1b34728	! t0_kref+0x8bc:   	fmuld8ulx16	%f13, %f8, %f16
	.word	0x81abca2b	! t0_kref+0x8c0:   	fcmps	%fcc0, %f15, %f11
	.word	0xd210a038	! t0_kref+0x8c4:   	lduh	[%g2 + 0x38], %o1
	.word	0x9db30a0c	! t0_kref+0x8c8:   	fpadd16	%f12, %f12, %f14
	.word	0xd820a020	! t0_kref+0x8cc:   	st	%o4, [%g2 + 0x20]
	.word	0xa696adb8	! t0_kref+0x8d0:   	orcc	%i2, 0xdb8, %l3
	.word	0xc020a010	! t0_kref+0x8d4:   	clr	[%g2 + 0x10]
	.word	0x99a0052e	! t0_kref+0x8d8:   	fsqrts	%f14, %f12
	.word	0xa8db001a	! t0_kref+0x8dc:   	smulcc	%o4, %i2, %l4
	.word	0x81ad0acc	! t0_kref+0x8e0:   	fcmped	%fcc0, %f20, %f12
	.word	0xd4060000	! t0_kref+0x8e4:   	ld	[%i0], %o2
	.word	0x81b01020	! t0_kref+0x8e8:   	siam	0x0
	.word	0x9fa00535	! t0_kref+0x8ec:   	fsqrts	%f21, %f15
	.word	0xea780019	! t0_kref+0x8f0:   	swap	[%g0 + %i1], %l5
	.word	0xac70205b	! t0_kref+0x8f4:   	udiv	%g0, 0x5b, %l6
	.word	0x2b480004	! t0_kref+0x8f8:   	fbug,a,pt	%fcc0, _kref+0x908
	.word	0x9da348ab	! t0_kref+0x8fc:   	fsubs	%f13, %f11, %f14
	.word	0xa1a0052b	! t0_kref+0x900:   	fsqrts	%f11, %f16
	.word	0xa89b000c	! t0_kref+0x904:   	xorcc	%o4, %o4, %l4
	.word	0x99a0052d	! t0_kref+0x908:   	fsqrts	%f13, %f12
	.word	0xe3260000	! t0_kref+0x90c:   	st	%f17, [%i0]
	.word	0x92be800c	! t0_kref+0x910:   	xnorcc	%i2, %o4, %o1
	.word	0xa5b00fc0	! t0_kref+0x914:   	fone	%f18
	.word	0x9da0190a	! t0_kref+0x918:   	fitod	%f10, %f14
	.word	0x945e800d	! t0_kref+0x91c:   	smul	%i2, %o5, %o2
	.word	0xdab6d018	! t0_kref+0x920:   	stha	%o5, [%i3 + %i0]0x80
	.word	0xaba018cc	! t0_kref+0x924:   	fdtos	%f12, %f21
	.word	0x9ba248ae	! t0_kref+0x928:   	fsubs	%f9, %f14, %f13
	.word	0x2f34e423	! t0_kref+0x92c:   	sethi	%hi(0xd3908c00), %l7
	.word	0xa72b200b	! t0_kref+0x930:   	sll	%o4, 0xb, %l3
	.word	0x9da408c8	! t0_kref+0x934:   	fsubd	%f16, %f8, %f14
	.word	0x90fe800d	! t0_kref+0x938:   	sdivcc	%i2, %o5, %o0
	.word	0xd4c81018	! t0_kref+0x93c:   	ldsba	[%g0 + %i0]0x80, %o2
	.word	0xed6e2018	! t0_kref+0x940:   	prefetch	%i0 + 0x18, 22
	.word	0x925b3970	! t0_kref+0x944:   	smul	%o4, -0x690, %o1
	.word	0xae900000	! t0_kref+0x948:   	orcc	%g0, %g0, %l7
	.word	0xaf102a2d	! t0_kref+0x94c:   	taddcctv	%g0, 0xa2d, %l7
	.word	0xe808a033	! t0_kref+0x950:   	ldub	[%g2 + 0x33], %l4
	.word	0x2a800004	! t0_kref+0x954:   	bcs,a	_kref+0x964
	.word	0xa6b32a49	! t0_kref+0x958:   	orncc	%o4, 0xa49, %l3
	.word	0xa3a00528	! t0_kref+0x95c:   	fsqrts	%f8, %f17
	.word	0xa7a01a4e	! t0_kref+0x960:   	fdtoi	%f14, %f19
	.word	0x9130000c	! t0_kref+0x964:   	srl	%g0, %o4, %o0
	.word	0xeb6e001d	! t0_kref+0x968:   	prefetch	%i0 + %i5, 21
	.word	0xa9418000	! t0_kref+0x96c:   	mov	%fprs, %l4
	call	SYM(t0_subr2)
	.word	0x9283000d	! t0_kref+0x974:   	addcc	%o4, %o5, %o1
	.word	0x111cfa49	! t0_kref+0x978:   	sethi	%hi(0x73e92400), %o0
	.word	0xe67e0000	! t0_kref+0x97c:   	swap	[%i0], %l3
	.word	0x92a8000c	! t0_kref+0x980:   	andncc	%g0, %o4, %o1
	.word	0xadb300ed	! t0_kref+0x984:   	edge16ln	%o4, %o5, %l6
	.word	0xd296d018	! t0_kref+0x988:   	lduha	[%i3 + %i0]0x80, %o1
	.word	0xaf3ea002	! t0_kref+0x98c:   	sra	%i2, 0x2, %l7
	.word	0xa9a01910	! t0_kref+0x990:   	fitod	%f16, %f20
	.word	0xaba308aa	! t0_kref+0x994:   	fsubs	%f12, %f10, %f21
	.word	0xa7b48ea0	! t0_kref+0x998:   	fsrc1s	%f18, %f19
	.word	0xaa06800c	! t0_kref+0x99c:   	add	%i2, %o4, %l5
	.word	0xae1b401a	! t0_kref+0x9a0:   	xor	%o5, %i2, %l7
	.word	0xae28299b	! t0_kref+0x9a4:   	andn	%g0, 0x99b, %l7
	.word	0x21480008	! t0_kref+0x9a8:   	fbn,a,pt	%fcc0, _kref+0x9c8
	.word	0xeb6e401d	! t0_kref+0x9ac:   	prefetch	%i1 + %i5, 21
	.word	0x81ac0aab	! t0_kref+0x9b0:   	fcmpes	%fcc0, %f16, %f11
	.word	0x95b2098c	! t0_kref+0x9b4:   	bshuffle	%f8, %f12, %f10
	.word	0xa1a01a54	! t0_kref+0x9b8:   	fdtoi	%f20, %f16
	.word	0xaac3400c	! t0_kref+0x9bc:   	addccc	%o5, %o4, %l5
	.word	0x31480008	! t0_kref+0x9c0:   	fba,a,pt	%fcc0, _kref+0x9e0
	.word	0xc0ae101a	! t0_kref+0x9c4:   	stba	%g0, [%i0 + %i2]0x80
	.word	0x9da000ac	! t0_kref+0x9c8:   	fnegs	%f12, %f14
	.word	0x23480007	! t0_kref+0x9cc:   	fbne,a,pt	%fcc0, _kref+0x9e8
	.word	0xeac01019	! t0_kref+0x9d0:   	ldswa	[%g0 + %i1]0x80, %l5
	.word	0xa3a01a54	! t0_kref+0x9d4:   	fdtoi	%f20, %f17
	.word	0xd03e6018	! t0_kref+0x9d8:   	std	%o0, [%i1 + 0x18]
	.word	0x9da308d4	! t0_kref+0x9dc:   	fsubd	%f12, %f20, %f14
	.word	0xc80e8000	! t0_kref+0x9e0:   	ldub	[%i2], %g4
	.word	0x9293000d	! t0_kref+0x9e4:   	orcc	%o4, %o5, %o1
	.word	0xec067ffc	! t0_kref+0x9e8:   	ld	[%i1 - 4], %l6
	.word	0xe9064000	! t0_kref+0x9ec:   	ld	[%i1], %f20
	.word	0x91b30300	! t0_kref+0x9f0:   	alignaddr	%o4, %g0, %o0
	.word	0x130e37fa	! t0_kref+0x9f4:   	sethi	%hi(0x38dfe800), %o1
	.word	0xaab6a1b8	! t0_kref+0x9f8:   	orncc	%i2, 0x1b8, %l5
	.word	0x8143c000	! t0_kref+0x9fc:   	stbar
	.word	0xe8500019	! t0_kref+0xa00:   	ldsh	[%g0 + %i1], %l4
	.word	0x9fa4c832	! t0_kref+0xa04:   	fadds	%f19, %f18, %f15
	.word	0xe80e6014	! t0_kref+0xa08:   	ldub	[%i1 + 0x14], %l4
	.word	0xda200019	! t0_kref+0xa0c:   	st	%o5, [%g0 + %i1]
	.word	0x3b480004	! t0_kref+0xa10:   	fble,a,pt	%fcc0, _kref+0xa20
	.word	0xaa1b7f37	! t0_kref+0xa14:   	xor	%o5, -0xc9, %l5
	.word	0xc12e7ff0	! t0_kref+0xa18:   	st	%fsr, [%i1 - 0x10]
	.word	0x92c33ff8	! t0_kref+0xa1c:   	addccc	%o4, -0x8, %o1
	.word	0xaba018c8	! t0_kref+0xa20:   	fdtos	%f8, %f21
	.word	0xad0b4000	! t0_kref+0xa24:   	tsubcc	%o5, %g0, %l6
	.word	0xa83e801a	! t0_kref+0xa28:   	xnor	%i2, %i2, %l4
	.word	0x91b54df4	! t0_kref+0xa2c:   	fnands	%f21, %f20, %f8
	.word	0xaa783f52	! t0_kref+0xa30:   	sdiv	%g0, -0xae, %l5
	.word	0xd2067ff8	! t0_kref+0xa34:   	ld	[%i1 - 8], %o1
	.word	0x92db400d	! t0_kref+0xa38:   	smulcc	%o5, %o5, %o1
	.word	0xec00a038	! t0_kref+0xa3c:   	ld	[%g2 + 0x38], %l6
	.word	0x92636c1a	! t0_kref+0xa40:   	subc	%o5, 0xc1a, %o1
	.word	0xe40861d8	! t0_kref+0xa44:   	ldub	[%g1 + 0x1d8], %l2
	.word	0xa41ca00c	! t0_kref+0xa48:   	xor	%l2, 0xc, %l2
	.word	0xe42861d8	! t0_kref+0xa4c:   	stb	%l2, [%g1 + 0x1d8]
	.word	0x81d861d8	! t0_kref+0xa50:   	flush	%g1 + 0x1d8
	.word	0xacc6b3b2	! t0_kref+0xa54:   	addccc	%i2, -0xc4e, %l6
	.word	0xda363ffa	! t0_kref+0xa58:   	sth	%o5, [%i0 - 6]
	.word	0xd000a008	! t0_kref+0xa5c:   	ld	[%g2 + 8], %o0
	.word	0xae98000c	! t0_kref+0xa60:   	xorcc	%g0, %o4, %l7
	.word	0xd440a020	! t0_kref+0xa64:   	ldsw	[%g2 + 0x20], %o2
	.word	0xd900a000	! t0_kref+0xa68:   	ld	[%g2], %f12
	.word	0x3d480004	! t0_kref+0xa6c:   	fbule,a,pt	%fcc0, _kref+0xa7c
	.word	0x9ba0002f	! t0_kref+0xa70:   	fmovs	%f15, %f13
	.word	0x92db64cc	! t0_kref+0xa74:   	smulcc	%o5, 0x4cc, %o1
	.word	0x9138200e	! t0_kref+0xa78:   	sra	%g0, 0xe, %o0
	.word	0x35480003	! t0_kref+0xa7c:   	fbue,a,pt	%fcc0, _kref+0xa88
2:	.word	0xae1e8000	! t0_kref+0xa80:   	xor	%i2, %g0, %l7
	.word	0xea00a008	! t0_kref+0xa84:   	ld	[%g2 + 8], %l5
	.word	0x95b30492	! t0_kref+0xa88:   	fcmple32	%f12, %f18, %o2
	.word	0x945e800d	! t0_kref+0xa8c:   	smul	%i2, %o5, %o2
	.word	0xd820a018	! t0_kref+0xa90:   	st	%o4, [%g2 + 0x18]
	.word	0x81830000	! t0_kref+0xa94:   	wr	%o4, %g0, %y
	.word	0xaaa34000	! t0_kref+0xa98:   	subcc	%o5, %g0, %l5
	.word	0xa9b28ac8	! t0_kref+0xa9c:   	fpsub32	%f10, %f8, %f20
	.word	0xaedb29c2	! t0_kref+0xaa0:   	smulcc	%o4, 0x9c2, %l7
	.word	0x81ac8ace	! t0_kref+0xaa4:   	fcmped	%fcc0, %f18, %f14
	.word	0xef68a087	! t0_kref+0xaa8:   	prefetch	%g2 + 0x87, 23
	.word	0x94db4000	! t0_kref+0xaac:   	smulcc	%o5, %g0, %o2
	.word	0x945365dc	! t0_kref+0xab0:   	umul	%o5, 0x5dc, %o2
	.word	0xaa580000	! t0_kref+0xab4:   	smul	%g0, %g0, %l5
	.word	0x945b400c	! t0_kref+0xab8:   	smul	%o5, %o4, %o2
	.word	0xd43e4000	! t0_kref+0xabc:   	std	%o2, [%i1]
	.word	0x8143e040	! t0_kref+0xac0:   	membar	0x40
	.word	0x95b50c94	! t0_kref+0xac4:   	fandnot2	%f20, %f20, %f10
	.word	0x9f414000	! t0_kref+0xac8:   	mov	%pc, %o7
	.word	0xa5a48831	! t0_kref+0xacc:   	fadds	%f18, %f17, %f18
	.word	0x3c480005	! t0_kref+0xad0:   	bpos,a,pt	%icc, _kref+0xae4
	.word	0xa65b000d	! t0_kref+0xad4:   	smul	%o4, %o5, %l3
	.word	0xe11e7ff0	! t0_kref+0xad8:   	ldd	[%i1 - 0x10], %f16
	.word	0xaba2c9af	! t0_kref+0xadc:   	fdivs	%f11, %f15, %f21
	.word	0xaebb400c	! t0_kref+0xae0:   	xnorcc	%o5, %o4, %l7
	.word	0x93b3cd60	! t0_kref+0xae4:   	fnot1s	%f15, %f9
	.word	0x25800002	! t0_kref+0xae8:   	fblg,a	_kref+0xaf0
	.word	0xf420a030	! t0_kref+0xaec:   	st	%i2, [%g2 + 0x30]
	.word	0xe6062010	! t0_kref+0xaf0:   	ld	[%i0 + 0x10], %l3
	.word	0xa81ea906	! t0_kref+0xaf4:   	xor	%i2, 0x906, %l4
	.word	0xaeb6ad62	! t0_kref+0xaf8:   	orncc	%i2, 0xd62, %l7
	.word	0xa5a389a8	! t0_kref+0xafc:   	fdivs	%f14, %f8, %f18
	.word	0xa6668000	! t0_kref+0xb00:   	subc	%i2, %g0, %l3
	.word	0xa5b4c632	! t0_kref+0xb04:   	fmul8x16	%f19, %f18, %f18
	.word	0xa5a0052b	! t0_kref+0xb08:   	fsqrts	%f11, %f18
	.word	0xabb3030c	! t0_kref+0xb0c:   	alignaddr	%o4, %o4, %l5
	.word	0xa5a40954	! t0_kref+0xb10:   	fmuld	%f16, %f20, %f18
	.word	0xa9b20ca9	! t0_kref+0xb14:   	fandnot2s	%f8, %f9, %f20
	.word	0xda7e401c	! t0_kref+0xb18:   	swap	[%i1 + %i4], %o5
	.word	0xad44c000	! t0_kref+0xb1c:   	mov	%gsr, %l6
	.word	0x97a2c9b3	! t0_kref+0xb20:   	fdivs	%f11, %f19, %f11
	.word	0xa1a30952	! t0_kref+0xb24:   	fmuld	%f12, %f18, %f16
	.word	0x9de3bfa0	! t0_kref+0xb28:   	save	%sp, -0x60, %sp
	.word	0x80803562	! t0_kref+0xb2c:   	addcc	%g0, -0xa9e, %g0
	.word	0x93ee801a	! t0_kref+0xb30:   	restore	%i2, %i2, %o1
	.word	0xa5b2cee8	! t0_kref+0xb34:   	fornot2s	%f11, %f8, %f18
	.word	0x90982588	! t0_kref+0xb38:   	xorcc	%g0, 0x588, %o0
	.word	0x11169fc2	! t0_kref+0xb3c:   	sethi	%hi(0x5a7f0800), %o0
	.word	0xa5b28e80	! t0_kref+0xb40:   	fsrc1	%f10, %f18
	.word	0xac330000	! t0_kref+0xb44:   	orn	%o4, %g0, %l6
	.word	0x927ea978	! t0_kref+0xb48:   	sdiv	%i2, 0x978, %o1
	.word	0xa8036179	! t0_kref+0xb4c:   	add	%o5, 0x179, %l4
	.word	0x9246800c	! t0_kref+0xb50:   	addc	%i2, %o4, %o1
	.word	0x113ae429	! t0_kref+0xb54:   	sethi	%hi(0xeb90a400), %o0
	.word	0xec7e200c	! t0_kref+0xb58:   	swap	[%i0 + 0xc], %l6
	.word	0xaebb7475	! t0_kref+0xb5c:   	xnorcc	%o5, -0xb8b, %l7
	.word	0xa9b38988	! t0_kref+0xb60:   	bshuffle	%f14, %f8, %f20
	.word	0xe8060000	! t0_kref+0xb64:   	ld	[%i0], %l4
	.word	0x93a288b3	! t0_kref+0xb68:   	fsubs	%f10, %f19, %f9
	.word	0x90f8000d	! t0_kref+0xb6c:   	sdivcc	%g0, %o5, %o0
	.word	0x91b546b2	! t0_kref+0xb70:   	fmul8x16al	%f21, %f18, %f8
	.word	0xa9a0012e	! t0_kref+0xb74:   	fabss	%f14, %f20
	.word	0x15029514	! t0_kref+0xb78:   	sethi	%hi(0xa545000), %o2
	.word	0x81def699	! t0_kref+0xb7c:   	flush	%i3 - 0x967
	.word	0x81b01026	! t0_kref+0xb80:   	siam	0x6
	.word	0xc0367ff2	! t0_kref+0xb84:   	clrh	[%i1 - 0xe]
	.word	0x91b40cae	! t0_kref+0xb88:   	fandnot2s	%f16, %f14, %f8
	.word	0xc0367fe8	! t0_kref+0xb8c:   	clrh	[%i1 - 0x18]
	.word	0xec50a020	! t0_kref+0xb90:   	ldsh	[%g2 + 0x20], %l6
	.word	0xad3b4000	! t0_kref+0xb94:   	sra	%o5, %g0, %l6
	.word	0xec861000	! t0_kref+0xb98:   	lda	[%i0]0x80, %l6
	.word	0x99a4884a	! t0_kref+0xb9c:   	faddd	%f18, %f10, %f12
	.word	0x81ddb59c	! t0_kref+0xba0:   	flush	%l6 - 0xa64
	.word	0xba103fe0	! t0_kref+0xba4:   	mov	0xffffffe0, %i5
	.word	0x37800006	! t0_kref+0xba8:   	fbge,a	_kref+0xbc0
	.word	0xd5180018	! t0_kref+0xbac:   	ldd	[%g0 + %i0], %f10
	.word	0xec96105b	! t0_kref+0xbb0:   	lduha	[%i0 + %i3]0x82, %l6
	.word	0x21800003	! t0_kref+0xbb4:   	fbn,a	_kref+0xbc0
	.word	0x91b2048e	! t0_kref+0xbb8:   	fcmple32	%f8, %f14, %o0
	.word	0xe7066018	! t0_kref+0xbbc:   	ld	[%i1 + 0x18], %f19
	.word	0x9fa548ae	! t0_kref+0xbc0:   	fsubs	%f21, %f14, %f15
	.word	0xaf3e801a	! t0_kref+0xbc4:   	sra	%i2, %i2, %l7
	.word	0xd4000018	! t0_kref+0xbc8:   	ld	[%g0 + %i0], %o2
	.word	0xa9a0104a	! t0_kref+0xbcc:   	fdtox	%f10, %f20
	.word	0xd53e3fe8	! t0_kref+0xbd0:   	std	%f10, [%i0 - 0x18]
	.word	0xec48a012	! t0_kref+0xbd4:   	ldsb	[%g2 + 0x12], %l6
	.word	0xa3a01a4e	! t0_kref+0xbd8:   	fdtoi	%f14, %f17
	.word	0x9da488c8	! t0_kref+0xbdc:   	fsubd	%f18, %f8, %f14
	.word	0x901b78f3	! t0_kref+0xbe0:   	xor	%o5, -0x70d, %o0
	.word	0x99a01893	! t0_kref+0xbe4:   	fitos	%f19, %f12
	.word	0xee000018	! t0_kref+0xbe8:   	ld	[%g0 + %i0], %l7
	.word	0x27800001	! t0_kref+0xbec:   	fbul,a	_kref+0xbf0
	.word	0x99a0192d	! t0_kref+0xbf0:   	fstod	%f13, %f12
	.word	0x95a30950	! t0_kref+0xbf4:   	fmuld	%f12, %f16, %f10
	.word	0xa1b486c8	! t0_kref+0xbf8:   	fmul8sux16	%f18, %f8, %f16
	.word	0x97b007b0	! t0_kref+0xbfc:   	fpackfix	%f16, %f11
	.word	0xc0300018	! t0_kref+0xc00:   	clrh	[%g0 + %i0]
	.word	0xa9302018	! t0_kref+0xc04:   	srl	%g0, 0x18, %l4
	.word	0x9f414000	! t0_kref+0xc08:   	mov	%pc, %o7
	.word	0x912b6019	! t0_kref+0xc0c:   	sll	%o5, 0x19, %o0
	.word	0xa3a00533	! t0_kref+0xc10:   	fsqrts	%f19, %f17
	.word	0xd440a020	! t0_kref+0xc14:   	ldsw	[%g2 + 0x20], %o2
	.word	0xa1b3c708	! t0_kref+0xc18:   	fmuld8sux16	%f15, %f8, %f16
	.word	0xacb8000d	! t0_kref+0xc1c:   	xnorcc	%g0, %o5, %l6
	.word	0xec466014	! t0_kref+0xc20:   	ldsw	[%i1 + 0x14], %l6
	.word	0xabb3404d	! t0_kref+0xc24:   	edge8l	%o5, %o5, %l5
	.word	0x92b6a8ef	! t0_kref+0xc28:   	orncc	%i2, 0x8ef, %o1
	.word	0xaa3ea77e	! t0_kref+0xc2c:   	xnor	%i2, 0x77e, %l5
	.word	0x92668000	! t0_kref+0xc30:   	subc	%i2, %g0, %o1
	.word	0xadb3402c	! t0_kref+0xc34:   	edge8n	%o5, %o4, %l6
	.word	0x39480002	! t0_kref+0xc38:   	fbuge,a,pt	%fcc0, _kref+0xc40
	.word	0xd06e3ffe	! t0_kref+0xc3c:   	ldstub	[%i0 - 2], %o0
	.word	0x94b027e6	! t0_kref+0xc40:   	orncc	%g0, 0x7e6, %o2
	.word	0x94437995	! t0_kref+0xc44:   	addc	%o5, -0x66b, %o2
	.word	0xea070018	! t0_kref+0xc48:   	ld	[%i4 + %i0], %l5
	.word	0x93b5044e	! t0_kref+0xc4c:   	fcmpne16	%f20, %f14, %o1
	.word	0x91a20833	! t0_kref+0xc50:   	fadds	%f8, %f19, %f8
	.word	0xd296d019	! t0_kref+0xc54:   	lduha	[%i3 + %i1]0x80, %o1
	.word	0x93a00132	! t0_kref+0xc58:   	fabss	%f18, %f9
	.word	0xaa53000d	! t0_kref+0xc5c:   	umul	%o4, %o5, %l5
	.word	0xacb026d7	! t0_kref+0xc60:   	orncc	%g0, 0x6d7, %l6
	.word	0xd4780019	! t0_kref+0xc64:   	swap	[%g0 + %i1], %o2
	.word	0x91a549aa	! t0_kref+0xc68:   	fdivs	%f21, %f10, %f8
	.word	0xaade800c	! t0_kref+0xc6c:   	smulcc	%i2, %o4, %l5
	.word	0xd06e7fed	! t0_kref+0xc70:   	ldstub	[%i1 - 0x13], %o0
	.word	0x9fa0012e	! t0_kref+0xc74:   	fabss	%f14, %f15
	.word	0xd91e2010	! t0_kref+0xc78:   	ldd	[%i0 + 0x10], %f12
	.word	0xf428a010	! t0_kref+0xc7c:   	stb	%i2, [%g2 + 0x10]
	.word	0xa6037be1	! t0_kref+0xc80:   	add	%o5, -0x41f, %l3
	.word	0x9228000c	! t0_kref+0xc84:   	andn	%g0, %o4, %o1
	.word	0xaa03001a	! t0_kref+0xc88:   	add	%o4, %i2, %l5
	sethi	%hi(2f), %o7
	.word	0xe40be0b4	! t0_kref+0xc90:   	ldub	[%o7 + 0xb4], %l2
	.word	0xa41ca00c	! t0_kref+0xc94:   	xor	%l2, 0xc, %l2
	.word	0xe42be0b4	! t0_kref+0xc98:   	stb	%l2, [%o7 + 0xb4]
	.word	0x81dbe0b4	! t0_kref+0xc9c:   	flush	%o7 + 0xb4
	.word	0xac1b7eeb	! t0_kref+0xca0:   	xor	%o5, -0x115, %l6
	.word	0xe91fbd98	! t0_kref+0xca4:   	ldd	[%fp - 0x268], %f20
	.word	0x93202b4f	! t0_kref+0xca8:   	mulscc	%g0, 0xb4f, %o1
	.word	0x9fc00004	! t0_kref+0xcac:   	call	%g0 + %g4
	.word	0x99a0052b	! t0_kref+0xcb0:   	fsqrts	%f11, %f12
2:	.word	0xa8933c27	! t0_kref+0xcb4:   	orcc	%o4, -0x3d9, %l4
	.word	0x94db401a	! t0_kref+0xcb8:   	smulcc	%o5, %i2, %o2
	.word	0xa5b4462a	! t0_kref+0xcbc:   	fmul8x16	%f17, %f10, %f18
	.word	0xfd6e3fe8	! t0_kref+0xcc0:   	prefetch	%i0 - 0x18, 30
	.word	0x95b00040	! t0_kref+0xcc4:   	edge8l	%g0, %g0, %o2
	.word	0x99a3482d	! t0_kref+0xcc8:   	fadds	%f13, %f13, %f12
	.word	0x90e33585	! t0_kref+0xccc:   	subccc	%o4, -0xa7b, %o0
	.word	0x91a509ce	! t0_kref+0xcd0:   	fdivd	%f20, %f14, %f8
	.word	0x81580000	! t0_kref+0xcd4:   	flushw
	.word	0xaa83001a	! t0_kref+0xcd8:   	addcc	%o4, %i2, %l5
	.word	0x9daa4048	! t0_kref+0xcdc:   	fmovde	%fcc0, %f8, %f14
	.word	0xda20a008	! t0_kref+0xce0:   	st	%o5, [%g2 + 8]
	.word	0x81d90014	! t0_kref+0xce4:   	flush	%g4 + %l4
	.word	0x9fc10000	! t0_kref+0xce8:   	call	%g4
	.word	0xa89b6881	! t0_kref+0xcec:   	xorcc	%o5, 0x881, %l4
	.word	0xa5a00052	! t0_kref+0xcf0:   	fmovd	%f18, %f18
	.word	0xa9a000d2	! t0_kref+0xcf4:   	fnegd	%f18, %f20
	.word	0x3b480007	! t0_kref+0xcf8:   	fble,a,pt	%fcc0, _kref+0xd14
	.word	0x94500000	! t0_kref+0xcfc:   	umul	%g0, %g0, %o2
	.word	0xa5b2472b	! t0_kref+0xd00:   	fmuld8ulx16	%f9, %f11, %f18
	.word	0x92b3000d	! t0_kref+0xd04:   	orncc	%o4, %o5, %o1
	.word	0xaeab316b	! t0_kref+0xd08:   	andncc	%o4, -0xe95, %l7
	.word	0xe26e001a	! t0_kref+0xd0c:   	ldstub	[%i0 + %i2], %l1
	.word	0xd836600c	! t0_kref+0xd10:   	sth	%o4, [%i1 + 0xc]
!	.word	0x364e1cb8	! t0_kref+0xd14:   	bge,a,pt	%icc, SYM(t0_subr2)
	   	bge,a,pt	%icc, SYM(t0_subr2)
	.word	0x9f414000	! t0_kref+0xd18:   	mov	%pc, %o7
	.word	0xec6e4000	! t0_kref+0xd1c:   	ldstub	[%i1], %l6
	.word	0xd8367ffc	! t0_kref+0xd20:   	sth	%o4, [%i1 - 4]
	.word	0xe7a6101c	! t0_kref+0xd24:   	sta	%f19, [%i0 + %i4]0x80
	.word	0x86102003	! t0_kref+0xd28:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0xd2c:   	bne,a	_kref+0xd2c
	.word	0x86a0e001	! t0_kref+0xd30:   	subcc	%g3, 1, %g3
	.word	0x92a34000	! t0_kref+0xd34:   	subcc	%o5, %g0, %o1
	.word	0xad38200d	! t0_kref+0xd38:   	sra	%g0, 0xd, %l6
	call	SYM(t0_subr3)
	.word	0x95a018ca	! t0_kref+0xd40:   	fdtos	%f10, %f10
	.word	0xd1be585a	! t0_kref+0xd44:   	stda	%f8, [%i1 + %i2]0xc2
	.word	0x9f414000	! t0_kref+0xd48:   	mov	%pc, %o7
	.word	0xae26b134	! t0_kref+0xd4c:   	sub	%i2, -0xecc, %l7
	.word	0xe76e001c	! t0_kref+0xd50:   	prefetch	%i0 + %i4, 19
	.word	0x81ad4a35	! t0_kref+0xd54:   	fcmps	%fcc0, %f21, %f21
	.word	0xa6f8001a	! t0_kref+0xd58:   	sdivcc	%g0, %i2, %l3
	.word	0x37800003	! t0_kref+0xd5c:   	fbge,a	_kref+0xd68
	.word	0x9ba00529	! t0_kref+0xd60:   	fsqrts	%f9, %f13
	.word	0xa9b30e0c	! t0_kref+0xd64:   	fand	%f12, %f12, %f20
	.word	0x2a800006	! t0_kref+0xd68:   	bcs,a	_kref+0xd80
	.word	0xa5b48ad4	! t0_kref+0xd6c:   	fpsub32	%f18, %f20, %f18
	.word	0x9fc00004	! t0_kref+0xd70:   	call	%g0 + %g4
	.word	0x92ab6867	! t0_kref+0xd74:   	andncc	%o5, 0x867, %o1
	.word	0xad3ea00c	! t0_kref+0xd78:   	sra	%i2, 0xc, %l6
	.word	0x94c3000c	! t0_kref+0xd7c:   	addccc	%o4, %o4, %o2
	.word	0xeece501a	! t0_kref+0xd80:   	ldsba	[%i1 + %i2]0x80, %l7
	.word	0x9da01a34	! t0_kref+0xd84:   	fstoi	%f20, %f14
	.word	0xa853001a	! t0_kref+0xd88:   	umul	%o4, %i2, %l4
	.word	0xa68e8000	! t0_kref+0xd8c:   	andcc	%i2, %g0, %l3
	.word	0xa7a00132	! t0_kref+0xd90:   	fabss	%f18, %f19
	.word	0x95b3054e	! t0_kref+0xd94:   	fcmpeq16	%f12, %f14, %o2
	.word	0xd51fbdc8	! t0_kref+0xd98:   	ldd	[%fp - 0x238], %f10
	.word	0x9de3bfa0	! t0_kref+0xd9c:   	save	%sp, -0x60, %sp
	.word	0xb6177e22	! t0_kref+0xda0:   	or	%i5, -0x1de, %i3
	.word	0x93ef4018	! t0_kref+0xda4:   	restore	%i5, %i0, %o1
	.word	0x97a00034	! t0_kref+0xda8:   	fmovs	%f20, %f11
	.word	0xaa18001a	! t0_kref+0xdac:   	xor	%g0, %i2, %l5
	.word	0xeb000018	! t0_kref+0xdb0:   	ld	[%g0 + %i0], %f21
	.word	0x912b400c	! t0_kref+0xdb4:   	sll	%o5, %o4, %o0
	.word	0x878020e0	! t0_kref+0xdb8:   	mov	0xe0, %asi
	call	SYM(t0_subr0)
	.word	0xda20a028	! t0_kref+0xdc0:   	st	%o5, [%g2 + 0x28]
	.word	0xa8be800c	! t0_kref+0xdc4:   	xnorcc	%i2, %o4, %l4
	.word	0xe1070019	! t0_kref+0xdc8:   	ld	[%i4 + %i1], %f16
	.word	0xaf44c000	! t0_kref+0xdcc:   	mov	%gsr, %l7
	.word	0x3a800006	! t0_kref+0xdd0:   	bcc,a	_kref+0xde8
	.word	0x95a0004e	! t0_kref+0xdd4:   	fmovd	%f14, %f10
	.word	0x9ba000b2	! t0_kref+0xdd8:   	fnegs	%f18, %f13
	.word	0x95b40971	! t0_kref+0xddc:   	fpmerge	%f16, %f17, %f10
	.word	0x3b480002	! t0_kref+0xde0:   	fble,a,pt	%fcc0, _kref+0xde8
	.word	0xd836601a	! t0_kref+0xde4:   	sth	%o4, [%i1 + 0x1a]
	.word	0x81dc0018	! t0_kref+0xde8:   	flush	%l0 + %i0
	.word	0x37480006	! t0_kref+0xdec:   	fbge,a,pt	%fcc0, _kref+0xe04
	.word	0xa6182e7a	! t0_kref+0xdf0:   	xor	%g0, 0xe7a, %l3
	.word	0xaa934000	! t0_kref+0xdf4:   	orcc	%o5, %g0, %l5
	.word	0x9da3094e	! t0_kref+0xdf8:   	fmuld	%f12, %f14, %f14
	.word	0x9fa01890	! t0_kref+0xdfc:   	fitos	%f16, %f15
	.word	0xd040a018	! t0_kref+0xe00:   	ldsw	[%g2 + 0x18], %o0
	.word	0xae00000d	! t0_kref+0xe04:   	add	%g0, %o5, %l7
	.word	0xaba4c9ae	! t0_kref+0xe08:   	fdivs	%f19, %f14, %f21
	.word	0xea000018	! t0_kref+0xe0c:   	ld	[%g0 + %i0], %l5
	.word	0x9da0192a	! t0_kref+0xe10:   	fstod	%f10, %f14
	.word	0xa1b4470e	! t0_kref+0xe14:   	fmuld8sux16	%f17, %f14, %f16
	.word	0x9443400c	! t0_kref+0xe18:   	addc	%o5, %o4, %o2
	.word	0x9fa349b4	! t0_kref+0xe1c:   	fdivs	%f13, %f20, %f15
	.word	0x9db00770	! t0_kref+0xe20:   	fpack16	%f16, %f14
	.word	0xea48a021	! t0_kref+0xe24:   	ldsb	[%g2 + 0x21], %l5
	.word	0x81ac8acc	! t0_kref+0xe28:   	fcmped	%fcc0, %f18, %f12
	.word	0x95b48d40	! t0_kref+0xe2c:   	fnot1	%f18, %f10
	.word	0x92b3400c	! t0_kref+0xe30:   	orncc	%o5, %o4, %o1
	.word	0xe648a039	! t0_kref+0xe34:   	ldsb	[%g2 + 0x39], %l3
	.word	0xe306401c	! t0_kref+0xe38:   	ld	[%i1 + %i4], %f17
	.word	0xa9a01090	! t0_kref+0xe3c:   	fxtos	%f16, %f20
	.word	0xa3a4882f	! t0_kref+0xe40:   	fadds	%f18, %f15, %f17
	.word	0xae1ebc29	! t0_kref+0xe44:   	xor	%i2, -0x3d7, %l7
	.word	0x81aacaa8	! t0_kref+0xe48:   	fcmpes	%fcc0, %f11, %f8
	.word	0x93a01a48	! t0_kref+0xe4c:   	fdtoi	%f8, %f9
	.word	0x3d480007	! t0_kref+0xe50:   	fbule,a,pt	%fcc0, _kref+0xe6c
	.word	0xa7a01a4a	! t0_kref+0xe54:   	fdtoi	%f10, %f19
	.word	0xe640a010	! t0_kref+0xe58:   	ldsw	[%g2 + 0x10], %l3
	.word	0xdd00a000	! t0_kref+0xe5c:   	ld	[%g2], %f14
	.word	0x8143c000	! t0_kref+0xe60:   	stbar
	.word	0xd44e401a	! t0_kref+0xe64:   	ldsb	[%i1 + %i2], %o2
	.word	0x81aa0aad	! t0_kref+0xe68:   	fcmpes	%fcc0, %f8, %f13
	.word	0xe6801019	! t0_kref+0xe6c:   	lda	[%g0 + %i1]0x80, %l3
	.word	0x9270001a	! t0_kref+0xe70:   	udiv	%g0, %i2, %o1
	.word	0xa9b68020	! t0_kref+0xe74:   	edge8n	%i2, %g0, %l4
	.word	0xc028a01a	! t0_kref+0xe78:   	clrb	[%g2 + 0x1a]
	.word	0x9db4cd60	! t0_kref+0xe7c:   	fnot1s	%f19, %f14
	.word	0xe4086624	! t0_kref+0xe80:   	ldub	[%g1 + 0x624], %l2
	.word	0xa41ca00c	! t0_kref+0xe84:   	xor	%l2, 0xc, %l2
	.word	0xe4286624	! t0_kref+0xe88:   	stb	%l2, [%g1 + 0x624]
	.word	0x81d86624	! t0_kref+0xe8c:   	flush	%g1 + 0x624
	.word	0x93b38df3	! t0_kref+0xe90:   	fnands	%f14, %f19, %f9
	.word	0xdf00a028	! t0_kref+0xe94:   	ld	[%g2 + 0x28], %f15
	.word	0x31480004	! t0_kref+0xe98:   	fba,a,pt	%fcc0, _kref+0xea8
	.word	0xec00a038	! t0_kref+0xe9c:   	ld	[%g2 + 0x38], %l6
	.word	0x2a800007	! t0_kref+0xea0:   	bcs,a	_kref+0xebc
	.word	0xedf65000	! t0_kref+0xea4:   	casxa	[%i1]0x80, %g0, %l6
	.word	0xe67e3fe0	! t0_kref+0xea8:   	swap	[%i0 - 0x20], %l3
	.word	0xa930001a	! t0_kref+0xeac:   	srl	%g0, %i2, %l4
	.word	0xd41e3fe0	! t0_kref+0xeb0:   	ldd	[%i0 - 0x20], %o2
	.word	0xe9064000	! t0_kref+0xeb4:   	ld	[%i1], %f20
	.word	0x94b8238e	! t0_kref+0xeb8:   	xnorcc	%g0, 0x38e, %o2
	.word	0xec060000	! t0_kref+0xebc:   	ld	[%i0], %l6
	.word	0xab3ea005	! t0_kref+0xec0:   	sra	%i2, 0x5, %l5
	.word	0x90c00000	! t0_kref+0xec4:   	addccc	%g0, %g0, %o0
	.word	0x91133a1d	! t0_kref+0xec8:   	taddcctv	%o4, -0x5e3, %o0
2:	.word	0x92ab63e9	! t0_kref+0xecc:   	andncc	%o5, 0x3e9, %o1
	.word	0x92de800d	! t0_kref+0xed0:   	smulcc	%i2, %o5, %o1
	.word	0xa6e0236a	! t0_kref+0xed4:   	subccc	%g0, 0x36a, %l3
	.word	0xe3b8a040	! t0_kref+0xed8:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x9144c000	! t0_kref+0xedc:   	mov	%gsr, %o0
	.word	0x23480004	! t0_kref+0xee0:   	fbne,a,pt	%fcc0, _kref+0xef0
	.word	0xa5a00135	! t0_kref+0xee4:   	fabss	%f21, %f18
	.word	0x95082fc6	! t0_kref+0xee8:   	tsubcc	%g0, 0xfc6, %o2
	.word	0x94bb67a5	! t0_kref+0xeec:   	xnorcc	%o5, 0x7a5, %o2
	.word	0xe9be1000	! t0_kref+0xef0:   	stda	%f20, [%i0]0x80
	.word	0xa5b30e14	! t0_kref+0xef4:   	fand	%f12, %f20, %f18
	.word	0xa81b0000	! t0_kref+0xef8:   	xor	%o4, %g0, %l4
	.word	0xd07f0019	! t0_kref+0xefc:   	swap	[%i4 + %i1], %o0
	.word	0x9266aaed	! t0_kref+0xf00:   	subc	%i2, 0xaed, %o1
	.word	0xabb34160	! t0_kref+0xf04:   	edge32ln	%o5, %g0, %l5
	.word	0xad40c000	! t0_kref+0xf08:   	mov	%asi, %l6
	.word	0xa9b3034d	! t0_kref+0xf0c:   	alignaddrl	%o4, %o5, %l4
	.word	0x93b0008c	! t0_kref+0xf10:   	edge16	%g0, %o4, %o1
	.word	0x81acca2b	! t0_kref+0xf14:   	fcmps	%fcc0, %f19, %f11
	.word	0x273ce07a	! t0_kref+0xf18:   	sethi	%hi(0xf381e800), %l3
	.word	0x9ba489aa	! t0_kref+0xf1c:   	fdivs	%f18, %f10, %f13
	.word	0x97a00135	! t0_kref+0xf20:   	fabss	%f21, %f11
	.word	0x90c6b6e0	! t0_kref+0xf24:   	addccc	%i2, -0x920, %o0
	.word	0x9da4894a	! t0_kref+0xf28:   	fmuld	%f18, %f10, %f14
	.word	0x2f3dbaf3	! t0_kref+0xf2c:   	sethi	%hi(0xf6ebcc00), %l7
	.word	0xa1a4cd29	! t0_kref+0xf30:   	fsmuld	%f19, %f9, %f16
	.word	0x2e800003	! t0_kref+0xf34:   	bvs,a	_kref+0xf40
	.word	0x90b30000	! t0_kref+0xf38:   	orncc	%o4, %g0, %o0
	.word	0x9da389cc	! t0_kref+0xf3c:   	fdivd	%f14, %f12, %f14
	.word	0xae932cae	! t0_kref+0xf40:   	orcc	%o4, 0xcae, %l7
	.word	0x94982ac3	! t0_kref+0xf44:   	xorcc	%g0, 0xac3, %o2
	.word	0x2d480003	! t0_kref+0xf48:   	fbg,a,pt	%fcc0, _kref+0xf54
	.word	0xd820a030	! t0_kref+0xf4c:   	st	%o4, [%g2 + 0x30]
	.word	0x905e800c	! t0_kref+0xf50:   	smul	%i2, %o4, %o0
	.word	0x91a548b2	! t0_kref+0xf54:   	fsubs	%f21, %f18, %f8
	.word	0xaf400000	! t0_kref+0xf58:   	mov	%y, %l7
	.word	0xa81b27b9	! t0_kref+0xf5c:   	xor	%o4, 0x7b9, %l4
	.word	0xe9981018	! t0_kref+0xf60:   	ldda	[%g0 + %i0]0x80, %f20
	.word	0x81800000	! t0_kref+0xf64:   	mov	%g0, %y
	.word	0x9db0076a	! t0_kref+0xf68:   	fpack16	%f10, %f14
	call	SYM(t0_subr1)
	.word	0x921b3edd	! t0_kref+0xf70:   	xor	%o4, -0x123, %o1
	.word	0xd09f5019	! t0_kref+0xf74:   	ldda	[%i5 + %i1]0x80, %o0
	.word	0x92de800d	! t0_kref+0xf78:   	smulcc	%i2, %o5, %o1
	.word	0x933b600b	! t0_kref+0xf7c:   	sra	%o5, 0xb, %o1
	.word	0xa5a409a8	! t0_kref+0xf80:   	fdivs	%f16, %f8, %f18
	.word	0xc0367fea	! t0_kref+0xf84:   	clrh	[%i1 - 0x16]
	.word	0xe3b8a040	! t0_kref+0xf88:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x2f01dad5	! t0_kref+0xf8c:   	sethi	%hi(0x76b5400), %l7
	.word	0x99a508d0	! t0_kref+0xf90:   	fsubd	%f20, %f16, %f12
	.word	0xea067ff4	! t0_kref+0xf94:   	ld	[%i1 - 0xc], %l5
	.word	0x9ba388b2	! t0_kref+0xf98:   	fsubs	%f14, %f18, %f13
	call	SYM(t0_subr0)
	.word	0xd096101b	! t0_kref+0xfa0:   	lduha	[%i0 + %i3]0x80, %o0
	.word	0x95a0012b	! t0_kref+0xfa4:   	fabss	%f11, %f10
	.word	0xf420a038	! t0_kref+0xfa8:   	st	%i2, [%g2 + 0x38]
	.word	0xa83b0000	! t0_kref+0xfac:   	not	%o4, %l4
	.word	0xe4086728	! t0_kref+0xfb0:   	ldub	[%g1 + 0x728], %l2
	.word	0xa41ca00c	! t0_kref+0xfb4:   	xor	%l2, 0xc, %l2
	.word	0xe4286728	! t0_kref+0xfb8:   	stb	%l2, [%g1 + 0x728]
	.word	0x81d86728	! t0_kref+0xfbc:   	flush	%g1 + 0x728
	.word	0xa81b4000	! t0_kref+0xfc0:   	xor	%o5, %g0, %l4
	.word	0x34480001	! t0_kref+0xfc4:   	bg,a,pt	%icc, _kref+0xfc8
	.word	0xa8ab0000	! t0_kref+0xfc8:   	andncc	%o4, %g0, %l4
	.word	0x91a34d2e	! t0_kref+0xfcc:   	fsmuld	%f13, %f14, %f8
2:	.word	0x925322ba	! t0_kref+0xfd0:   	umul	%o4, 0x2ba, %o1
	.word	0xd9be588d	! t0_kref+0xfd4:   	stda	%f12, [%i1 + %o5]0xc4
	.word	0xf420a000	! t0_kref+0xfd8:   	st	%i2, [%g2]
	.word	0x81dd7179	! t0_kref+0xfdc:   	flush	%l5 - 0xe87
	.word	0xc036c018	! t0_kref+0xfe0:   	clrh	[%i3 + %i0]
	.word	0x3b480005	! t0_kref+0xfe4:   	fble,a,pt	%fcc0, _kref+0xff8
	.word	0xe846600c	! t0_kref+0xfe8:   	ldsw	[%i1 + 0xc], %l4
	.word	0x8d86ba6d	! t0_kref+0xfec:   	wr	%i2, 0xfffffa6d, %fprs
	.word	0xf207bfe0	! t0_kref+0xff0:   	ld	[%fp - 0x20], %i1
	.word	0xc0b01019	! t0_kref+0xff4:   	stha	%g0, [%g0 + %i1]0x80
	.word	0x90a0000d	! t0_kref+0xff8:   	subcc	%g0, %o5, %o0
	.word	0xa9b30c92	! t0_kref+0xffc:   	fandnot2	%f12, %f18, %f20
	.word	0x9da0190e	! t0_kref+0x1000:   	fitod	%f14, %f14
	.word	0xa1a3094c	! t0_kref+0x1004:   	fmuld	%f12, %f12, %f16
	.word	0xaa83000d	! t0_kref+0x1008:   	addcc	%o4, %o5, %l5
	.word	0xe3b8a040	! t0_kref+0x100c:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xafb00280	! t0_kref+0x1010:   	array32	%g0, %g0, %l7
	.word	0x92b3000d	! t0_kref+0x1014:   	orncc	%o4, %o5, %o1
	.word	0xaa50001a	! t0_kref+0x1018:   	umul	%g0, %i2, %l5
	.word	0xaeb6800d	! t0_kref+0x101c:   	orncc	%i2, %o5, %l7
	.word	0xe47e601c	! t0_kref+0x1020:   	swap	[%i1 + 0x1c], %l2
	.word	0xc16e400d	! t0_kref+0x1024:   	prefetch	%i1 + %o5, 0
	.word	0xac1b29b0	! t0_kref+0x1028:   	xor	%o4, 0x9b0, %l6
	.word	0xe65f4018	! t0_kref+0x102c:   	ldx	[%i5 + %i0], %l3
	.word	0x95400000	! t0_kref+0x1030:   	mov	%y, %o2
	.word	0x95a0012e	! t0_kref+0x1034:   	fabss	%f14, %f10
	.word	0x110149c7	! t0_kref+0x1038:   	sethi	%hi(0x5271c00), %o0
	.word	0x95b40590	! t0_kref+0x103c:   	fcmpgt32	%f16, %f16, %o2
	.word	0xc139401d	! t0_kref+0x1040:   	std	%f0, [%g5 + %i5]
	.word	0xa7b3cea0	! t0_kref+0x1044:   	fsrc1s	%f15, %f19
	.word	0x3f480008	! t0_kref+0x1048:   	fbo,a,pt	%fcc0, _kref+0x1068
	.word	0xe8566008	! t0_kref+0x104c:   	ldsh	[%i1 + 8], %l4
	.word	0xf207bfe0	! t0_kref+0x1050:   	ld	[%fp - 0x20], %i1
	.word	0x9ba4882e	! t0_kref+0x1054:   	fadds	%f18, %f14, %f13
	.word	0x9ba38830	! t0_kref+0x1058:   	fadds	%f14, %f16, %f13
	.word	0xf16e7ff8	! t0_kref+0x105c:   	prefetch	%i1 - 8, 24
	.word	0x9258373b	! t0_kref+0x1060:   	smul	%g0, -0x8c5, %o1
	.word	0xc568a00f	! t0_kref+0x1064:   	prefetch	%g2 + 0xf, 2
	.word	0x9fc10000	! t0_kref+0x1068:   	call	%g4
	.word	0xc96e400d	! t0_kref+0x106c:   	prefetch	%i1 + %o5, 4
	.word	0xacc00000	! t0_kref+0x1070:   	addccc	%g0, %g0, %l6
	.word	0xda503492	! t0_kref+0x1074:   	ldsh	[%g0 - 0xb6e], %o5
	.word	0xae8eab1f	! t0_kref+0x1078:   	andcc	%i2, 0xb1f, %l7
	.word	0x2f480001	! t0_kref+0x107c:   	fbu,a,pt	%fcc0, _kref+0x1080
	.word	0xd320a008	! t0_kref+0x1080:   	st	%f9, [%g2 + 8]
	.word	0x81aa8a4e	! t0_kref+0x1084:   	fcmpd	%fcc0, %f10, %f14
	.word	0xe7070019	! t0_kref+0x1088:   	ld	[%i4 + %i1], %f19
	.word	0x94c6800d	! t0_kref+0x108c:   	addccc	%i2, %o5, %o2
	.word	0xfb6e6018	! t0_kref+0x1090:   	prefetch	%i1 + 0x18, 29
	.word	0x99b40c94	! t0_kref+0x1094:   	fandnot2	%f16, %f20, %f12
	.word	0xd016600a	! t0_kref+0x1098:   	lduh	[%i1 + 0xa], %o0
	.word	0x9de3bfa0	! t0_kref+0x109c:   	save	%sp, -0x60, %sp
	.word	0x91ef001b	! t0_kref+0x10a0:   	restore	%i4, %i3, %o0
	.word	0x91a01a50	! t0_kref+0x10a4:   	fdtoi	%f16, %f8
	.word	0x923b2fce	! t0_kref+0x10a8:   	xnor	%o4, 0xfce, %o1
	.word	0xe968a08a	! t0_kref+0x10ac:   	prefetch	%g2 + 0x8a, 20
	.word	0x953e801a	! t0_kref+0x10b0:   	sra	%i2, %i2, %o2
	.word	0xac5ea1d2	! t0_kref+0x10b4:   	smul	%i2, 0x1d2, %l6
	.word	0x99a0002f	! t0_kref+0x10b8:   	fmovs	%f15, %f12
	.word	0xd210a010	! t0_kref+0x10bc:   	lduh	[%g2 + 0x10], %o1
	.word	0x2d120bed	! t0_kref+0x10c0:   	sethi	%hi(0x482fb400), %l6
	.word	0xae23400c	! t0_kref+0x10c4:   	sub	%o5, %o4, %l7
	.word	0xa9a0012c	! t0_kref+0x10c8:   	fabss	%f12, %f20
	.word	0xa7a348a8	! t0_kref+0x10cc:   	fsubs	%f13, %f8, %f19
	.word	0xad0eb1e1	! t0_kref+0x10d0:   	tsubcc	%i2, -0xe1f, %l6
	.word	0x91b48dce	! t0_kref+0x10d4:   	fnand	%f18, %f14, %f8
	.word	0xa87eaec2	! t0_kref+0x10d8:   	sdiv	%i2, 0xec2, %l4
	.word	0xd2566002	! t0_kref+0x10dc:   	ldsh	[%i1 + 2], %o1
	.word	0x81dafe2d	! t0_kref+0x10e0:   	flush	%o3 - 0x1d3
	.word	0xd03e7ff0	! t0_kref+0x10e4:   	std	%o0, [%i1 - 0x10]
	.word	0xe1bf1a59	! t0_kref+0x10e8:   	stda	%f16, [%i4 + %i1]0xd2
	.word	0x93b0035a	! t0_kref+0x10ec:   	alignaddrl	%g0, %i2, %o1
	.word	0xe3b8a040	! t0_kref+0x10f0:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xa9400000	! t0_kref+0x10f4:   	mov	%y, %l4
	.word	0xa9aa0050	! t0_kref+0x10f8:   	fmovda	%fcc0, %f16, %f20
	.word	0x25480006	! t0_kref+0x10fc:   	fblg,a,pt	%fcc0, _kref+0x1114
	.word	0x1308357e	! t0_kref+0x1100:   	sethi	%hi(0x20d5f800), %o1
	.word	0xec48a00b	! t0_kref+0x1104:   	ldsb	[%g2 + 0xb], %l6
	.word	0xd4063fe8	! t0_kref+0x1108:   	ld	[%i0 - 0x18], %o2
	.word	0x3f480008	! t0_kref+0x110c:   	fbo,a,pt	%fcc0, _kref+0x112c
	.word	0xac934000	! t0_kref+0x1110:   	orcc	%o5, %g0, %l6
	.word	0xa6b6b0df	! t0_kref+0x1114:   	orncc	%i2, -0xf21, %l3
	.word	0xa7a01a50	! t0_kref+0x1118:   	fdtoi	%f16, %f19
	.word	0x94bea844	! t0_kref+0x111c:   	xnorcc	%i2, 0x844, %o2
	.word	0xa5a40d2c	! t0_kref+0x1120:   	fsmuld	%f16, %f12, %f18
	.word	0xc568a10c	! t0_kref+0x1124:   	prefetch	%g2 + 0x10c, 2
	.word	0x9da28852	! t0_kref+0x1128:   	faddd	%f10, %f18, %f14
	.word	0xeb067ffc	! t0_kref+0x112c:   	ld	[%i1 - 4], %f21
	.word	0xea48a028	! t0_kref+0x1130:   	ldsb	[%g2 + 0x28], %l5
	.word	0x23480006	! t0_kref+0x1134:   	fbne,a,pt	%fcc0, _kref+0x114c
	.word	0xa7802ed1	! t0_kref+0x1138:   	mov	0xed1, %gsr
	.word	0xe1be589a	! t0_kref+0x113c:   	stda	%f16, [%i1 + %i2]0xc4
	.word	0xf16e2010	! t0_kref+0x1140:   	prefetch	%i0 + 0x10, 24
	.word	0x92e0001a	! t0_kref+0x1144:   	subccc	%g0, %i2, %o1
	.word	0xa9a0002a	! t0_kref+0x1148:   	fmovs	%f10, %f20
	.word	0x95b34140	! t0_kref+0x114c:   	edge32l	%o5, %g0, %o2
	.word	0xaa930000	! t0_kref+0x1150:   	orcc	%o4, %g0, %l5
	.word	0x3a480001	! t0_kref+0x1154:   	bcc,a,pt	%icc, _kref+0x1158
	.word	0x93a0012b	! t0_kref+0x1158:   	fabss	%f11, %f9
	.word	0x9fa549ae	! t0_kref+0x115c:   	fdivs	%f21, %f14, %f15
	.word	0xd86e2004	! t0_kref+0x1160:   	ldstub	[%i0 + 4], %o4
	.word	0x29800004	! t0_kref+0x1164:   	fbl,a	_kref+0x1174
	.word	0xeb68a080	! t0_kref+0x1168:   	prefetch	%g2 + 0x80, 21
	.word	0x94db001a	! t0_kref+0x116c:   	smulcc	%o4, %i2, %o2
	.word	0x97a01a32	! t0_kref+0x1170:   	fstoi	%f18, %f11
	.word	0x20800007	! t0_kref+0x1174:   	bn,a	_kref+0x1190
	.word	0x97b38ea0	! t0_kref+0x1178:   	fsrc1s	%f14, %f11
	.word	0xdd00a008	! t0_kref+0x117c:   	ld	[%g2 + 8], %f14
	.word	0xe87e6004	! t0_kref+0x1180:   	swap	[%i1 + 4], %l4
	.word	0x92ab0000	! t0_kref+0x1184:   	andncc	%o4, %g0, %o1
	.word	0x923e8000	! t0_kref+0x1188:   	not	%i2, %o1
	.word	0x81deefb9	! t0_kref+0x118c:   	flush	%i3 + 0xfb9
	.word	0xa7a0002c	! t0_kref+0x1190:   	fmovs	%f12, %f19
	.word	0xe41e401d	! t0_kref+0x1194:   	ldd	[%i1 + %i5], %l2
	.word	0x33480005	! t0_kref+0x1198:   	fbe,a,pt	%fcc0, _kref+0x11ac
	.word	0xe47f0018	! t0_kref+0x119c:   	swap	[%i4 + %i0], %l2
	.word	0x97b2cee9	! t0_kref+0x11a0:   	fornot2s	%f11, %f9, %f11
	.word	0xd0067fe8	! t0_kref+0x11a4:   	ld	[%i1 - 0x18], %o0
	.word	0x94a03e70	! t0_kref+0x11a8:   	subcc	%g0, -0x190, %o2
	.word	0x9fa000ab	! t0_kref+0x11ac:   	fnegs	%f11, %f15
	.word	0x9253400d	! t0_kref+0x11b0:   	umul	%o5, %o5, %o1
	.word	0x9de3bfa0	! t0_kref+0x11b4:   	save	%sp, -0x60, %sp
	.word	0xafee8019	! t0_kref+0x11b8:   	restore	%i2, %i1, %l7
	.word	0xd1e6500d	! t0_kref+0x11bc:   	casa	[%i1]0x80, %o5, %o0
	.word	0x91b0012d	! t0_kref+0x11c0:   	edge32n	%g0, %o5, %o0
	.word	0xa9a00028	! t0_kref+0x11c4:   	fmovs	%f8, %f20
	.word	0xa63b24c8	! t0_kref+0x11c8:   	xnor	%o4, 0x4c8, %l3
	.word	0xa636ae60	! t0_kref+0x11cc:   	orn	%i2, 0xe60, %l3
	.word	0xac90001a	! t0_kref+0x11d0:   	orcc	%g0, %i2, %l6
	.word	0xe07e3ffc	! t0_kref+0x11d4:   	swap	[%i0 - 4], %l0
	.word	0xe76e401b	! t0_kref+0x11d8:   	prefetch	%i1 + %i3, 19
	.word	0xaba209a9	! t0_kref+0x11dc:   	fdivs	%f8, %f9, %f21
	.word	0xaba000a9	! t0_kref+0x11e0:   	fnegs	%f9, %f21
	.word	0x9da38848	! t0_kref+0x11e4:   	faddd	%f14, %f8, %f14
	.word	0x81aa8aa9	! t0_kref+0x11e8:   	fcmpes	%fcc0, %f10, %f9
	.word	0xaa56b27c	! t0_kref+0x11ec:   	umul	%i2, -0xd84, %l5
	.word	0x95a208d4	! t0_kref+0x11f0:   	fsubd	%f8, %f20, %f10
	.word	0x2d0cd8ee	! t0_kref+0x11f4:   	sethi	%hi(0x3363b800), %l6
	.word	0x2d800008	! t0_kref+0x11f8:   	fbg,a	_kref+0x1218
	.word	0x93b3408d	! t0_kref+0x11fc:   	edge16	%o5, %o5, %o1
	.word	0x9fc00004	! t0_kref+0x1200:   	call	%g0 + %g4
	.word	0x92ab6782	! t0_kref+0x1204:   	andncc	%o5, 0x782, %o1
	.word	0x9413000c	! t0_kref+0x1208:   	or	%o4, %o4, %o2
	.word	0x9473000d	! t0_kref+0x120c:   	udiv	%o4, %o5, %o2
	.word	0xac602c66	! t0_kref+0x1210:   	subc	%g0, 0xc66, %l6
	.word	0xa6b0000c	! t0_kref+0x1214:   	orncc	%g0, %o4, %l3
	.word	0xd82e2006	! t0_kref+0x1218:   	stb	%o4, [%i0 + 6]
	.word	0xae33400c	! t0_kref+0x121c:   	orn	%o5, %o4, %l7
	.word	0xa5a01909	! t0_kref+0x1220:   	fitod	%f9, %f18
	.word	0x34480001	! t0_kref+0x1224:   	bg,a,pt	%icc, _kref+0x1228
	.word	0x91b48e80	! t0_kref+0x1228:   	fsrc1	%f18, %f8
	.word	0x949b0000	! t0_kref+0x122c:   	xorcc	%o4, %g0, %o2
	.word	0xabb28508	! t0_kref+0x1230:   	fcmpgt16	%f10, %f8, %l5
	.word	0xed6e001a	! t0_kref+0x1234:   	prefetch	%i0 + %i2, 22
	.word	0xa8dea8a6	! t0_kref+0x1238:   	smulcc	%i2, 0x8a6, %l4
	.word	0x9093000c	! t0_kref+0x123c:   	orcc	%o4, %o4, %o0
	.word	0xa7a01a34	! t0_kref+0x1240:   	fstoi	%f20, %f19
	.word	0x92936401	! t0_kref+0x1244:   	orcc	%o5, 0x401, %o1
	.word	0x9fa48832	! t0_kref+0x1248:   	fadds	%f18, %f18, %f15
	.word	0xe120a020	! t0_kref+0x124c:   	st	%f16, [%g2 + 0x20]
	.word	0xafb0012d	! t0_kref+0x1250:   	edge32n	%g0, %o5, %l7
	.word	0xac637cd8	! t0_kref+0x1254:   	subc	%o5, -0x328, %l6
	.word	0xa9a01928	! t0_kref+0x1258:   	fstod	%f8, %f20
	.word	0xa5b28d60	! t0_kref+0x125c:   	fnot1s	%f10, %f18
	.word	0xa1a289d4	! t0_kref+0x1260:   	fdivd	%f10, %f20, %f16
	.word	0xa9a00130	! t0_kref+0x1264:   	fabss	%f16, %f20
	.word	0x9023000c	! t0_kref+0x1268:   	sub	%o4, %o4, %o0
	.word	0xd828a002	! t0_kref+0x126c:   	stb	%o4, [%g2 + 2]
	.word	0xff6e7fe0	! t0_kref+0x1270:   	prefetch	%i1 - 0x20, 31
	.word	0x87802082	! t0_kref+0x1274:   	mov	0x82, %asi
	.word	0x9fa309a9	! t0_kref+0x1278:   	fdivs	%f12, %f9, %f15
	.word	0xee7e6000	! t0_kref+0x127c:   	swap	[%i1], %l7
	.word	0xa9a0110c	! t0_kref+0x1280:   	fxtod	%f12, %f20
	.word	0xa5aac052	! t0_kref+0x1284:   	fmovdge	%fcc0, %f18, %f18
	.word	0xab0b001a	! t0_kref+0x1288:   	tsubcc	%o4, %i2, %l5
	.word	0x99a01052	! t0_kref+0x128c:   	fdtox	%f18, %f12
	.word	0xd100a028	! t0_kref+0x1290:   	ld	[%g2 + 0x28], %f8
	.word	0x95a388ca	! t0_kref+0x1294:   	fsubd	%f14, %f10, %f10
	.word	0xc76e2018	! t0_kref+0x1298:   	prefetch	%i0 + 0x18, 3
	.word	0xa5a50d32	! t0_kref+0x129c:   	fsmuld	%f20, %f18, %f18
	.word	0xc1282ba8	! t0_kref+0x12a0:   	st	%fsr, [%g0 + 0xba8]
	.word	0x113d14b4	! t0_kref+0x12a4:   	sethi	%hi(0xf452d000), %o0
	.word	0xaf3e801a	! t0_kref+0x12a8:   	sra	%i2, %i2, %l7
	.word	0xaf36800c	! t0_kref+0x12ac:   	srl	%i2, %o4, %l7
	.word	0xa1b20e80	! t0_kref+0x12b0:   	fsrc1	%f8, %f16
	.word	0xe840a000	! t0_kref+0x12b4:   	ldsw	[%g2], %l4
	.word	0x91a2094a	! t0_kref+0x12b8:   	fmuld	%f8, %f10, %f8
	.word	0x90db624f	! t0_kref+0x12bc:   	smulcc	%o5, 0x24f, %o0
	.word	0x99a3094a	! t0_kref+0x12c0:   	fmuld	%f12, %f10, %f12
	.word	0xdf267ffc	! t0_kref+0x12c4:   	st	%f15, [%i1 - 4]
	.word	0xafb6801a	! t0_kref+0x12c8:   	edge8	%i2, %i2, %l7
	.word	0xec070018	! t0_kref+0x12cc:   	ld	[%i4 + %i0], %l6
	.word	0xa9a408ab	! t0_kref+0x12d0:   	fsubs	%f16, %f11, %f20
	.word	0x3b480006	! t0_kref+0x12d4:   	fble,a,pt	%fcc0, _kref+0x12ec
	.word	0x95b405cc	! t0_kref+0x12d8:   	fcmpeq32	%f16, %f12, %o2
	.word	0x909b400d	! t0_kref+0x12dc:   	xorcc	%o5, %o5, %o0
	.word	0xdd1fbef0	! t0_kref+0x12e0:   	ldd	[%fp - 0x110], %f14
	.word	0xae803647	! t0_kref+0x12e4:   	addcc	%g0, -0x9b9, %l7
	.word	0xf56e001c	! t0_kref+0x12e8:   	prefetch	%i0 + %i4, 26
	.word	0xaf30000d	! t0_kref+0x12ec:   	srl	%g0, %o5, %l7
	.word	0x81ac8a29	! t0_kref+0x12f0:   	fcmps	%fcc0, %f18, %f9
	.word	0xa61eaf6a	! t0_kref+0x12f4:   	xor	%i2, 0xf6a, %l3
	.word	0x37480008	! t0_kref+0x12f8:   	fbge,a,pt	%fcc0, _kref+0x1318
	.word	0x95a388d0	! t0_kref+0x12fc:   	fsubd	%f14, %f16, %f10
	.word	0x99aac054	! t0_kref+0x1300:   	fmovdge	%fcc0, %f20, %f12
	.word	0x9fc00004	! t0_kref+0x1304:   	call	%g0 + %g4
	.word	0xa81b610c	! t0_kref+0x1308:   	xor	%o5, 0x10c, %l4
	.word	0xa6db667b	! t0_kref+0x130c:   	smulcc	%o5, 0x67b, %l3
	.word	0x929b7fbd	! t0_kref+0x1310:   	xorcc	%o5, -0x43, %o1
	.word	0x13280468	! t0_kref+0x1314:   	sethi	%hi(0xa011a000), %o1
	.word	0x909e8000	! t0_kref+0x1318:   	xorcc	%i2, %g0, %o0
	.word	0xa3a0052e	! t0_kref+0x131c:   	fsqrts	%f14, %f17
	.word	0x9fb50fac	! t0_kref+0x1320:   	fors	%f20, %f12, %f15
	.word	0xc028a02b	! t0_kref+0x1324:   	clrb	[%g2 + 0x2b]
	.word	0x99a0108c	! t0_kref+0x1328:   	fxtos	%f12, %f12
	.word	0xa5b50c52	! t0_kref+0x132c:   	fnor	%f20, %f18, %f18
	.word	0xee780018	! t0_kref+0x1330:   	swap	[%g0 + %i0], %l7
	.word	0xd1be584c	! t0_kref+0x1334:   	stda	%f8, [%i1 + %o4]0xc2
	.word	0xa9a289ce	! t0_kref+0x1338:   	fdivd	%f10, %f14, %f20
	.word	0xd5380019	! t0_kref+0x133c:   	std	%f10, [%g0 + %i1]
	.word	0xa1a289ae	! t0_kref+0x1340:   	fdivs	%f10, %f14, %f16
	.word	0xa8332d5e	! t0_kref+0x1344:   	orn	%o4, 0xd5e, %l4
	.word	0xa9b20448	! t0_kref+0x1348:   	fcmpne16	%f8, %f8, %l4
	.word	0xad3b401a	! t0_kref+0x134c:   	sra	%o5, %i2, %l6
	.word	0xd828a01b	! t0_kref+0x1350:   	stb	%o4, [%g2 + 0x1b]
	.word	0xaaf6bef7	! t0_kref+0x1354:   	udivcc	%i2, -0x109, %l5
	.word	0x95b40e80	! t0_kref+0x1358:   	fsrc1	%f16, %f10
	.word	0xa3a00129	! t0_kref+0x135c:   	fabss	%f9, %f17
	.word	0xe7270018	! t0_kref+0x1360:   	st	%f19, [%i4 + %i0]
	.word	0xf420a018	! t0_kref+0x1364:   	st	%i2, [%g2 + 0x18]
	.word	0x95a348ac	! t0_kref+0x1368:   	fsubs	%f13, %f12, %f10
	.word	0x92ab400c	! t0_kref+0x136c:   	andncc	%o5, %o4, %o1
	.word	0xac1ea15d	! t0_kref+0x1370:   	xor	%i2, 0x15d, %l6
	.word	0x9de3bfa0	! t0_kref+0x1374:   	save	%sp, -0x60, %sp
	.word	0xba0e6f87	! t0_kref+0x1378:   	and	%i1, 0xf87, %i5
	.word	0xafee658c	! t0_kref+0x137c:   	restore	%i1, 0x58c, %l7
	.word	0xd3260000	! t0_kref+0x1380:   	st	%f9, [%i0]
	.word	0x878020d0	! t0_kref+0x1384:   	mov	0xd0, %asi
	.word	0x86102004	! t0_kref+0x1388:   	mov	0x4, %g3
	.word	0x86a0e001	! t0_kref+0x138c:   	subcc	%g3, 1, %g3
	.word	0x2280001d	! t0_kref+0x1390:   	be,a	_kref+0x1404
	.word	0xae7b400d	! t0_kref+0x1394:   	sdiv	%o5, %o5, %l7
	.word	0xe53e6010	! t0_kref+0x1398:   	std	%f18, [%i1 + 0x10]
	.word	0xe9be1840	! t0_kref+0x139c:   	stda	%f20, [%i0]0xc2
	.word	0xe968a081	! t0_kref+0x13a0:   	prefetch	%g2 + 0x81, 20
	.word	0xee7e0000	! t0_kref+0x13a4:   	swap	[%i0], %l7
	.word	0x95a01110	! t0_kref+0x13a8:   	fxtod	%f16, %f10
	.word	0x20800006	! t0_kref+0x13ac:   	bn,a	_kref+0x13c4
	.word	0xa600000c	! t0_kref+0x13b0:   	add	%g0, %o4, %l3
	.word	0xa7380000	! t0_kref+0x13b4:   	sra	%g0, %g0, %l3
	.word	0xaba3c835	! t0_kref+0x13b8:   	fadds	%f15, %f21, %f21
	.word	0x2d399864	! t0_kref+0x13bc:   	sethi	%hi(0xe6619000), %l6
	.word	0x93a0002f	! t0_kref+0x13c0:   	fmovs	%f15, %f9
	.word	0x94003c09	! t0_kref+0x13c4:   	add	%g0, -0x3f7, %o2
	.word	0xd47f0018	! t0_kref+0x13c8:   	swap	[%i4 + %i0], %o2
	.word	0xac1e800c	! t0_kref+0x13cc:   	xor	%i2, %o4, %l6
	.word	0x3ebfffef	! t0_kref+0x13d0:   	bvc,a	_kref+0x138c
	.word	0x9ba388ac	! t0_kref+0x13d4:   	fsubs	%f14, %f12, %f13
	.word	0x2b4fffed	! t0_kref+0x13d8:   	fbug,a,pt	%fcc0, _kref+0x138c
	.word	0xa736a00f	! t0_kref+0x13dc:   	srl	%i2, 0xf, %l3
	.word	0x97a00131	! t0_kref+0x13e0:   	fabss	%f17, %f11
	.word	0xda36001b	! t0_kref+0x13e4:   	sth	%o5, [%i0 + %i3]
	.word	0xa5a508a8	! t0_kref+0x13e8:   	fsubs	%f20, %f8, %f18
	.word	0xee167fe8	! t0_kref+0x13ec:   	lduh	[%i1 - 0x18], %l7
	.word	0x39480001	! t0_kref+0x13f0:   	fbuge,a,pt	%fcc0, _kref+0x13f4
	.word	0x912e801a	! t0_kref+0x13f4:   	sll	%i2, %i2, %o0
	.word	0xa5a50833	! t0_kref+0x13f8:   	fadds	%f20, %f19, %f18
	.word	0xe656401b	! t0_kref+0x13fc:   	ldsh	[%i1 + %i3], %l3
	.word	0xd8360000	! t0_kref+0x1400:   	sth	%o4, [%i0]
	.word	0xb410200d	! t0_kref+0x1404:   	mov	0xd, %i2
	.word	0xee40a038	! t0_kref+0x1408:   	ldsw	[%g2 + 0x38], %l7
	.word	0xc76e0000	! t0_kref+0x140c:   	prefetch	%i0, 3
	.word	0xef6e001b	! t0_kref+0x1410:   	prefetch	%i0 + %i3, 23
	.word	0xabb340ed	! t0_kref+0x1414:   	edge16ln	%o5, %o5, %l5
	.word	0xa9b30020	! t0_kref+0x1418:   	edge8n	%o4, %g0, %l4
	.word	0xec462008	! t0_kref+0x141c:   	ldsw	[%i0 + 8], %l6
	call	SYM(t0_subr1)
	.word	0xd20e401a	! t0_kref+0x1424:   	ldub	[%i1 + %i2], %o1
	.word	0xa9b50acc	! t0_kref+0x1428:   	fpsub32	%f20, %f12, %f20
	.word	0x94fb6d54	! t0_kref+0x142c:   	sdivcc	%o5, 0xd54, %o2
	.word	0x95a00054	! t0_kref+0x1430:   	fmovd	%f20, %f10
	.word	0x95b30e80	! t0_kref+0x1434:   	fsrc1	%f12, %f10
	.word	0x8d80000c	! t0_kref+0x1438:   	mov	%o4, %fprs
	.word	0xac06aa97	! t0_kref+0x143c:   	add	%i2, 0xa97, %l6
	.word	0xd408a02a	! t0_kref+0x1440:   	ldub	[%g2 + 0x2a], %o2
	.word	0x97b48c71	! t0_kref+0x1444:   	fnors	%f18, %f17, %f11
	.word	0x9da01050	! t0_kref+0x1448:   	fdtox	%f16, %f14
	.word	0xe810a000	! t0_kref+0x144c:   	lduh	[%g2], %l4
	.word	0xecee9019	! t0_kref+0x1450:   	ldstuba	[%i2 + %i1]0x80, %l6
	.word	0xeb20a030	! t0_kref+0x1454:   	st	%f21, [%g2 + 0x30]
	.word	0x93b34080	! t0_kref+0x1458:   	edge16	%o5, %g0, %o1
	.word	0xa6bb3caa	! t0_kref+0x145c:   	xnorcc	%o4, -0x356, %l3
	.word	0x95a548b5	! t0_kref+0x1460:   	fsubs	%f21, %f21, %f10
	.word	0xda28a01b	! t0_kref+0x1464:   	stb	%o5, [%g2 + 0x1b]
	.word	0xaa002735	! t0_kref+0x1468:   	add	%g0, 0x735, %l5
	.word	0x35480001	! t0_kref+0x146c:   	fbue,a,pt	%fcc0, _kref+0x1470
	.word	0xd4780018	! t0_kref+0x1470:   	swap	[%g0 + %i0], %o2
	.word	0x99a30850	! t0_kref+0x1474:   	faddd	%f12, %f16, %f12
	.word	0xae3b001a	! t0_kref+0x1478:   	xnor	%o4, %i2, %l7
	.word	0x920378cf	! t0_kref+0x147c:   	add	%o5, -0x731, %o1
	.word	0xe53e3ff0	! t0_kref+0x1480:   	std	%f18, [%i0 - 0x10]
	.word	0xc1283aa8	! t0_kref+0x1484:   	st	%fsr, [%g0 - 0x558]
	.word	0xa1a488d4	! t0_kref+0x1488:   	fsubd	%f18, %f20, %f16
	.word	0xe81e3ff8	! t0_kref+0x148c:   	ldd	[%i0 - 8], %l4
	.word	0xa6b3401a	! t0_kref+0x1490:   	orncc	%o5, %i2, %l3
	.word	0x3c480005	! t0_kref+0x1494:   	bpos,a,pt	%icc, _kref+0x14a8
	.word	0xd2166016	! t0_kref+0x1498:   	lduh	[%i1 + 0x16], %o1
	.word	0x9fb20fb1	! t0_kref+0x149c:   	fors	%f8, %f17, %f15
	.word	0xc12e001c	! t0_kref+0x14a0:   	st	%fsr, [%i0 + %i4]
	.word	0xa944c000	! t0_kref+0x14a4:   	mov	%gsr, %l4
	.word	0x92980000	! t0_kref+0x14a8:   	xorcc	%g0, %g0, %o1
	.word	0xe1bf1a59	! t0_kref+0x14ac:   	stda	%f16, [%i4 + %i1]0xd2
	.word	0xe650a02a	! t0_kref+0x14b0:   	ldsh	[%g2 + 0x2a], %l3
	.word	0x35480005	! t0_kref+0x14b4:   	fbue,a,pt	%fcc0, _kref+0x14c8
	.word	0xa5a01a4a	! t0_kref+0x14b8:   	fdtoi	%f10, %f18
	.word	0x81ac4a2e	! t0_kref+0x14bc:   	fcmps	%fcc0, %f17, %f14
	.word	0x94beb541	! t0_kref+0x14c0:   	xnorcc	%i2, -0xabf, %o2
	.word	0xaf134000	! t0_kref+0x14c4:   	taddcctv	%o5, %g0, %l7
	.word	0xac1b6979	! t0_kref+0x14c8:   	xor	%o5, 0x979, %l6
	.word	0xad20000d	! t0_kref+0x14cc:   	mulscc	%g0, %o5, %l6
	.word	0x27800005	! t0_kref+0x14d0:   	fbul,a	_kref+0x14e4
	.word	0xa9a00529	! t0_kref+0x14d4:   	fsqrts	%f9, %f20
	.word	0x95b3401a	! t0_kref+0x14d8:   	edge8	%o5, %i2, %o2
	.word	0x9ba0052a	! t0_kref+0x14dc:   	fsqrts	%f10, %f13
	.word	0x92937367	! t0_kref+0x14e0:   	orcc	%o5, -0xc99, %o1
	.word	0xace3401a	! t0_kref+0x14e4:   	subccc	%o5, %i2, %l6
	.word	0x91a01914	! t0_kref+0x14e8:   	fitod	%f20, %f8
	.word	0xa5a288d4	! t0_kref+0x14ec:   	fsubd	%f10, %f20, %f18
	.word	0x99b2470e	! t0_kref+0x14f0:   	fmuld8sux16	%f9, %f14, %f12
	.word	0x9db20a92	! t0_kref+0x14f4:   	fpsub16	%f8, %f18, %f14
	.word	0xaa302f2a	! t0_kref+0x14f8:   	orn	%g0, 0xf2a, %l5
	.word	0xaba549b4	! t0_kref+0x14fc:   	fdivs	%f21, %f20, %f21
	.word	0x92aeafdc	! t0_kref+0x1500:   	andncc	%i2, 0xfdc, %o1
	.word	0x9ba448a8	! t0_kref+0x1504:   	fsubs	%f17, %f8, %f13
	.word	0xa1a309ad	! t0_kref+0x1508:   	fdivs	%f12, %f13, %f16
	.word	0x9fc10000	! t0_kref+0x150c:   	call	%g4
	.word	0xa81b20b5	! t0_kref+0x1510:   	xor	%o4, 0xb5, %l4
	.word	0x99a01933	! t0_kref+0x1514:   	fstod	%f19, %f12
	.word	0xa1a01915	! t0_kref+0x1518:   	fitod	%f21, %f16
	.word	0xad400000	! t0_kref+0x151c:   	mov	%y, %l6
	.word	0x81aa0ad0	! t0_kref+0x1520:   	fcmped	%fcc0, %f8, %f16
	.word	0xa8d0000d	! t0_kref+0x1524:   	umulcc	%g0, %o5, %l4
	.word	0xa8f6b9da	! t0_kref+0x1528:   	udivcc	%i2, -0x626, %l4
	.word	0xa9368000	! t0_kref+0x152c:   	srl	%i2, %g0, %l4
	.word	0x92db000d	! t0_kref+0x1530:   	smulcc	%o4, %o5, %o1
	.word	0xac1eb0b1	! t0_kref+0x1534:   	xor	%i2, -0xf4f, %l6
	.word	0xeb00a038	! t0_kref+0x1538:   	ld	[%g2 + 0x38], %f21
	.word	0xa8bb000c	! t0_kref+0x153c:   	xnorcc	%o4, %o4, %l4
	.word	0xec00a030	! t0_kref+0x1540:   	ld	[%g2 + 0x30], %l6
	.word	0xd830a02a	! t0_kref+0x1544:   	sth	%o4, [%g2 + 0x2a]
	.word	0xeed61000	! t0_kref+0x1548:   	ldsha	[%i0]0x80, %l7
	.word	0xa9a01909	! t0_kref+0x154c:   	fitod	%f9, %f20
	.word	0x95a40952	! t0_kref+0x1550:   	fmuld	%f16, %f18, %f10
	.word	0x9090244d	! t0_kref+0x1554:   	orcc	%g0, 0x44d, %o0
	.word	0xa5a549b4	! t0_kref+0x1558:   	fdivs	%f21, %f20, %f18
	.word	0xe19eda58	! t0_kref+0x155c:   	ldda	[%i3 + %i0]0xd2, %f16
	.word	0xa8bb2415	! t0_kref+0x1560:   	xnorcc	%o4, 0x415, %l4
	.word	0x11134587	! t0_kref+0x1564:   	sethi	%hi(0x4d161c00), %o0
	.word	0x91b3054e	! t0_kref+0x1568:   	fcmpeq16	%f12, %f14, %o0
	.word	0x92303933	! t0_kref+0x156c:   	orn	%g0, -0x6cd, %o1
	.word	0xa9b20d40	! t0_kref+0x1570:   	fnot1	%f8, %f20
	.word	0xd836401b	! t0_kref+0x1574:   	sth	%o4, [%i1 + %i3]
	.word	0xa7b00200	! t0_kref+0x1578:   	array8	%g0, %g0, %l3
	.word	0xee564000	! t0_kref+0x157c:   	ldsh	[%i1], %l7
	.word	0xd9be588c	! t0_kref+0x1580:   	stda	%f12, [%i1 + %o4]0xc4
	.word	0xaedb001a	! t0_kref+0x1584:   	smulcc	%o4, %i2, %l7
	.word	0x273380a5	! t0_kref+0x1588:   	sethi	%hi(0xce029400), %l3
	.word	0x9433000c	! t0_kref+0x158c:   	orn	%o4, %o4, %o2
	.word	0xc0200018	! t0_kref+0x1590:   	clr	[%g0 + %i0]
	.word	0x3e480004	! t0_kref+0x1594:   	bvc,a,pt	%icc, _kref+0x15a4
	.word	0x99a01892	! t0_kref+0x1598:   	fitos	%f18, %f12
	.word	0xa9a0052c	! t0_kref+0x159c:   	fsqrts	%f12, %f20
	.word	0x292822b4	! t0_kref+0x15a0:   	sethi	%hi(0xa08ad000), %l4
	.word	0xa7a449b4	! t0_kref+0x15a4:   	fdivs	%f17, %f20, %f19
	.word	0xe850a000	! t0_kref+0x15a8:   	ldsh	[%g2], %l4
	.word	0xd01e2000	! t0_kref+0x15ac:   	ldd	[%i0], %o0
	.word	0xd11e401d	! t0_kref+0x15b0:   	ldd	[%i1 + %i5], %f8
	.word	0xc568a08f	! t0_kref+0x15b4:   	prefetch	%g2 + 0x8f, 2
	.word	0x901b4000	! t0_kref+0x15b8:   	xor	%o5, %g0, %o0
	.word	0xa6a8001a	! t0_kref+0x15bc:   	andncc	%g0, %i2, %l3
	.word	0x942b2924	! t0_kref+0x15c0:   	andn	%o4, 0x924, %o2
	.word	0x93a00134	! t0_kref+0x15c4:   	fabss	%f20, %f9
	.word	0x37480005	! t0_kref+0x15c8:   	fbge,a,pt	%fcc0, _kref+0x15dc
	.word	0x91b3cee8	! t0_kref+0x15cc:   	fornot2s	%f15, %f8, %f8
	.word	0x94c6ab1e	! t0_kref+0x15d0:   	addccc	%i2, 0xb1e, %o2
	.word	0xd03f4019	! t0_kref+0x15d4:   	std	%o0, [%i5 + %i1]
	.word	0x95b30140	! t0_kref+0x15d8:   	edge32l	%o4, %g0, %o2
	.word	0x81aa8ab2	! t0_kref+0x15dc:   	fcmpes	%fcc0, %f10, %f18
	.word	0xc030a032	! t0_kref+0x15e0:   	clrh	[%g2 + 0x32]
	.word	0x99b38e48	! t0_kref+0x15e4:   	fxnor	%f14, %f8, %f12
	.word	0xa1a01a54	! t0_kref+0x15e8:   	fdtoi	%f20, %f16
	.word	0x93a01a30	! t0_kref+0x15ec:   	fstoi	%f16, %f9
	.word	0x81ad4a2d	! t0_kref+0x15f0:   	fcmps	%fcc0, %f21, %f13
	.word	0xab400000	! t0_kref+0x15f4:   	mov	%y, %l5
	.word	0x945b001a	! t0_kref+0x15f8:   	smul	%o4, %i2, %o2
	.word	0x81ac4ab1	! t0_kref+0x15fc:   	fcmpes	%fcc0, %f17, %f17
	.word	0x95b30715	! t0_kref+0x1600:   	fmuld8sux16	%f12, %f21, %f10
	.word	0xa5a308cc	! t0_kref+0x1604:   	fsubd	%f12, %f12, %f18
	.word	0x95b2c62a	! t0_kref+0x1608:   	fmul8x16	%f11, %f10, %f10
	.word	0x81b01022	! t0_kref+0x160c:   	siam	0x2
	.word	0xa1b28e4c	! t0_kref+0x1610:   	fxnor	%f10, %f12, %f16
	.word	0x94182f56	! t0_kref+0x1614:   	xor	%g0, 0xf56, %o2
	.word	0x110c8163	! t0_kref+0x1618:   	sethi	%hi(0x32058c00), %o0
	.word	0xa61b2c02	! t0_kref+0x161c:   	xor	%o4, 0xc02, %l3
	.word	0xe810a012	! t0_kref+0x1620:   	lduh	[%g2 + 0x12], %l4
	.word	0xa9a388cc	! t0_kref+0x1624:   	fsubd	%f14, %f12, %f20
	.word	0x81aa8a50	! t0_kref+0x1628:   	fcmpd	%fcc0, %f10, %f16
	.word	0xe9be1880	! t0_kref+0x162c:   	stda	%f20, [%i0]0xc4
	.word	0xaebe800d	! t0_kref+0x1630:   	xnorcc	%i2, %o5, %l7
	call	SYM(t0_subr0)
	.word	0xd27e4000	! t0_kref+0x1638:   	swap	[%i1], %o1
	.word	0xec282392	! t0_kref+0x163c:   	stb	%l6, [%g0 + 0x392]
	.word	0xda20a038	! t0_kref+0x1640:   	st	%o5, [%g2 + 0x38]
	.word	0x81d8000f	! t0_kref+0x1644:   	flush	%g0 + %o7
	.word	0x81ab0a2e	! t0_kref+0x1648:   	fcmps	%fcc0, %f12, %f14
	.word	0xaf336019	! t0_kref+0x164c:   	srl	%o5, 0x19, %l7
	.word	0xa1b30ace	! t0_kref+0x1650:   	fpsub32	%f12, %f14, %f16
	.word	0xd1180019	! t0_kref+0x1654:   	ldd	[%g0 + %i1], %f8
	.word	0x95a94033	! t0_kref+0x1658:   	fmovsug	%fcc0, %f19, %f10
	.word	0x9fc10000	! t0_kref+0x165c:   	call	%g4
	.word	0xa863774a	! t0_kref+0x1660:   	subc	%o5, -0x8b6, %l4
	.word	0x9fa0002c	! t0_kref+0x1664:   	fmovs	%f12, %f15
	.word	0xdb00a038	! t0_kref+0x1668:   	ld	[%g2 + 0x38], %f13
	.word	0xaf36a016	! t0_kref+0x166c:   	srl	%i2, 0x16, %l7
	.word	0xe8066004	! t0_kref+0x1670:   	ld	[%i1 + 4], %l4
	.word	0x94768000	! t0_kref+0x1674:   	udiv	%i2, %g0, %o2
	.word	0xa9b3402d	! t0_kref+0x1678:   	edge8n	%o5, %o5, %l4
	.word	0xa1b50e48	! t0_kref+0x167c:   	fxnor	%f20, %f8, %f16
	.word	0xaaf8001a	! t0_kref+0x1680:   	sdivcc	%g0, %i2, %l5
	.word	0xe808a023	! t0_kref+0x1684:   	ldub	[%g2 + 0x23], %l4
	.word	0x95a2094a	! t0_kref+0x1688:   	fmuld	%f8, %f10, %f10
	.word	0xc02e6007	! t0_kref+0x168c:   	clrb	[%i1 + 7]
	.word	0xa1a4094a	! t0_kref+0x1690:   	fmuld	%f16, %f10, %f16
	.word	0xc16e001a	! t0_kref+0x1694:   	prefetch	%i0 + %i2, 0
	.word	0xa9a309ce	! t0_kref+0x1698:   	fdivd	%f12, %f14, %f20
	.word	0x91418000	! t0_kref+0x169c:   	mov	%fprs, %o0
	.word	0x99b28c4e	! t0_kref+0x16a0:   	fnor	%f10, %f14, %f12
	.word	0xd86e401a	! t0_kref+0x16a4:   	ldstub	[%i1 + %i2], %o4
	.word	0xacab401a	! t0_kref+0x16a8:   	andncc	%o5, %i2, %l6
	.word	0x9540c000	! t0_kref+0x16ac:   	mov	%asi, %o2
	.word	0x94fb000c	! t0_kref+0x16b0:   	sdivcc	%o4, %o4, %o2
	.word	0x93400000	! t0_kref+0x16b4:   	mov	%y, %o1
	.word	0x91b48cb5	! t0_kref+0x16b8:   	fandnot2s	%f18, %f21, %f8
	.word	0xe11fbfa8	! t0_kref+0x16bc:   	ldd	[%fp - 0x58], %f16
	.word	0x110d4531	! t0_kref+0x16c0:   	sethi	%hi(0x3514c400), %o0
	.word	0x943b2b64	! t0_kref+0x16c4:   	xnor	%o4, 0xb64, %o2
	.word	0xa7a000b5	! t0_kref+0x16c8:   	fnegs	%f21, %f19
	.word	0xafb6804d	! t0_kref+0x16cc:   	edge8l	%i2, %o5, %l7
	.word	0x95b40d40	! t0_kref+0x16d0:   	fnot1	%f16, %f10
	.word	0x95a0014c	! t0_kref+0x16d4:   	fabsd	%f12, %f10
	.word	0xec7e401c	! t0_kref+0x16d8:   	swap	[%i1 + %i4], %l6
	.word	0xee40a008	! t0_kref+0x16dc:   	ldsw	[%g2 + 8], %l7
	.word	0xd0801018	! t0_kref+0x16e0:   	lda	[%g0 + %i0]0x80, %o0
	.word	0xd99e1a5b	! t0_kref+0x16e4:   	ldda	[%i0 + %i3]0xd2, %f12
	.word	0xd1a01018	! t0_kref+0x16e8:   	sta	%f8, [%g0 + %i0]0x80
	.word	0x92aebd62	! t0_kref+0x16ec:   	andncc	%i2, -0x29e, %o1
	.word	0x8143e040	! t0_kref+0x16f0:   	membar	0x40
	.word	0xae736d70	! t0_kref+0x16f4:   	udiv	%o5, 0xd70, %l7
	.word	0x95a0002e	! t0_kref+0x16f8:   	fmovs	%f14, %f10
	.word	0xaebb401a	! t0_kref+0x16fc:   	xnorcc	%o5, %i2, %l7
	.word	0xea801019	! t0_kref+0x1700:   	lda	[%g0 + %i1]0x80, %l5
	.word	0xa933001a	! t0_kref+0x1704:   	srl	%o4, %i2, %l4
	.word	0xa69b401a	! t0_kref+0x1708:   	xorcc	%o5, %i2, %l3
	.word	0xae7b39d0	! t0_kref+0x170c:   	sdiv	%o4, -0x630, %l7
	.word	0xa5a018d2	! t0_kref+0x1710:   	fdtos	%f18, %f18
	.word	0xa7408000	! t0_kref+0x1714:   	mov	%ccr, %l3
	.word	0xea10a028	! t0_kref+0x1718:   	lduh	[%g2 + 0x28], %l5
	.word	0xa736a00a	! t0_kref+0x171c:   	srl	%i2, 0xa, %l3
	.word	0xf007bfe0	! t0_kref+0x1720:   	ld	[%fp - 0x20], %i0
	.word	0x99a309cc	! t0_kref+0x1724:   	fdivd	%f12, %f12, %f12
	.word	0xe9be585a	! t0_kref+0x1728:   	stda	%f20, [%i1 + %i2]0xc2
	.word	0x31480001	! t0_kref+0x172c:   	fba,a,pt	%fcc0, _kref+0x1730
	.word	0x81dc0004	! t0_kref+0x1730:   	flush	%l0 + %g4
	.word	0x2b480008	! t0_kref+0x1734:   	fbug,a,pt	%fcc0, _kref+0x1754
	.word	0xe1000018	! t0_kref+0x1738:   	ld	[%g0 + %i0], %f16
	.word	0xa7418000	! t0_kref+0x173c:   	mov	%fprs, %l3
	.word	0x91418000	! t0_kref+0x1740:   	mov	%fprs, %o0
	.word	0x97a0188f	! t0_kref+0x1744:   	fitos	%f15, %f11
	.word	0xe7070019	! t0_kref+0x1748:   	ld	[%i4 + %i1], %f19
	.word	0xaba01a2d	! t0_kref+0x174c:   	fstoi	%f13, %f21
	.word	0xea50a022	! t0_kref+0x1750:   	ldsh	[%g2 + 0x22], %l5
	.word	0x9fa000ac	! t0_kref+0x1754:   	fnegs	%f12, %f15
	.word	0xafb34340	! t0_kref+0x1758:   	alignaddrl	%o5, %g0, %l7
	.word	0xa1a0002e	! t0_kref+0x175c:   	fmovs	%f14, %f16
	.word	0xc030a020	! t0_kref+0x1760:   	clrh	[%g2 + 0x20]
	.word	0xd26e3fef	! t0_kref+0x1764:   	ldstub	[%i0 - 0x11], %o1
	.word	0xaab0000d	! t0_kref+0x1768:   	orncc	%g0, %o5, %l5
	.word	0xc028a031	! t0_kref+0x176c:   	clrb	[%g2 + 0x31]
	.word	0xad400000	! t0_kref+0x1770:   	mov	%y, %l6
	.word	0x9ba20828	! t0_kref+0x1774:   	fadds	%f8, %f8, %f13
	.word	0xadb000e0	! t0_kref+0x1778:   	edge16ln	%g0, %g0, %l6
	.word	0x901b0000	! t0_kref+0x177c:   	xor	%o4, %g0, %o0
	.word	0xa1a0002e	! t0_kref+0x1780:   	fmovs	%f14, %f16
	.word	0xd820a010	! t0_kref+0x1784:   	st	%o4, [%g2 + 0x10]
	.word	0xa89eabc7	! t0_kref+0x1788:   	xorcc	%i2, 0xbc7, %l4
	.word	0xa5a4c9a8	! t0_kref+0x178c:   	fdivs	%f19, %f8, %f18
	.word	0xace02496	! t0_kref+0x1790:   	subccc	%g0, 0x496, %l6
	.word	0xee6e001a	! t0_kref+0x1794:   	ldstub	[%i0 + %i2], %l7
	.word	0xe8d01018	! t0_kref+0x1798:   	ldsha	[%g0 + %i0]0x80, %l4
	.word	0xa5a2c9a9	! t0_kref+0x179c:   	fdivs	%f11, %f9, %f18
	.word	0x99a2094a	! t0_kref+0x17a0:   	fmuld	%f8, %f10, %f12
	.word	0x90e3400d	! t0_kref+0x17a4:   	subccc	%o5, %o5, %o0
	.word	0x9466800d	! t0_kref+0x17a8:   	subc	%i2, %o5, %o2
	.word	0xaf700000	! t0_kref+0x17ac:   	popc	%g0, %l7
	.word	0x92936c62	! t0_kref+0x17b0:   	orcc	%o5, 0xc62, %o1
	.word	0xd9be1a5c	! t0_kref+0x17b4:   	stda	%f12, [%i0 + %i4]0xd2
	.word	0x81daaf3e	! t0_kref+0x17b8:   	flush	%o2 + 0xf3e
	.word	0xa783000d	! t0_kref+0x17bc:   	wr	%o4, %o5, %gsr
	.word	0xa5a208ca	! t0_kref+0x17c0:   	fsubd	%f8, %f10, %f18
	.word	0x94d8000c	! t0_kref+0x17c4:   	smulcc	%g0, %o4, %o2
	.word	0xa5b28fb3	! t0_kref+0x17c8:   	fors	%f10, %f19, %f18
	.word	0x81d93ae2	! t0_kref+0x17cc:   	flush	%g4 - 0x51e
	.word	0x9128000c	! t0_kref+0x17d0:   	sll	%g0, %o4, %o0
	.word	0xd830a032	! t0_kref+0x17d4:   	sth	%o4, [%g2 + 0x32]
	.word	0xab2ea01a	! t0_kref+0x17d8:   	sll	%i2, 0x1a, %l5
	.word	0xa896800c	! t0_kref+0x17dc:   	orcc	%i2, %o4, %l4
	.word	0xec40a020	! t0_kref+0x17e0:   	ldsw	[%g2 + 0x20], %l6
	.word	0xa9a0190f	! t0_kref+0x17e4:   	fitod	%f15, %f20
	.word	0xe47e7fec	! t0_kref+0x17e8:   	swap	[%i1 - 0x14], %l2
	.word	0xa7a00528	! t0_kref+0x17ec:   	fsqrts	%f8, %f19
	.word	0xa9a018d2	! t0_kref+0x17f0:   	fdtos	%f18, %f20
	.word	0xd1be1a5c	! t0_kref+0x17f4:   	stda	%f8, [%i0 + %i4]0xd2
	.word	0x933e8000	! t0_kref+0x17f8:   	sra	%i2, %g0, %o1
	.word	0xd06e8019	! t0_kref+0x17fc:   	ldstub	[%i2 + %i1], %o0
	.word	0x31480006	! t0_kref+0x1800:   	fba,a,pt	%fcc0, _kref+0x1818
	.word	0x94b3664c	! t0_kref+0x1804:   	orncc	%o5, 0x64c, %o2
	.word	0x99a0190b	! t0_kref+0x1808:   	fitod	%f11, %f12
	.word	0xec680019	! t0_kref+0x180c:   	ldstub	[%g0 + %i1], %l6
	.word	0xe5180019	! t0_kref+0x1810:   	ldd	[%g0 + %i1], %f18
	.word	0xac03400c	! t0_kref+0x1814:   	add	%o5, %o4, %l6
	.word	0x2f3fa32b	! t0_kref+0x1818:   	sethi	%hi(0xfe8cac00), %l7
	.word	0x92c34000	! t0_kref+0x181c:   	addccc	%o5, %g0, %o1
	.word	0x95a84054	! t0_kref+0x1820:   	fmovdne	%fcc0, %f20, %f10
	.word	0x150995dd	! t0_kref+0x1824:   	sethi	%hi(0x26577400), %o2
	.word	0x93a01a2b	! t0_kref+0x1828:   	fstoi	%f11, %f9
	.word	0xec40a030	! t0_kref+0x182c:   	ldsw	[%g2 + 0x30], %l6
	.word	0xaea0342c	! t0_kref+0x1830:   	subcc	%g0, -0xbd4, %l7
	.word	0xa8032254	! t0_kref+0x1834:   	add	%o4, 0x254, %l4
	.word	0x99a0190b	! t0_kref+0x1838:   	fitod	%f11, %f12
	.word	0xa786801a	! t0_kref+0x183c:   	wr	%i2, %i2, %gsr
	.word	0xd82e8018	! t0_kref+0x1840:   	stb	%o4, [%i2 + %i0]
	.word	0x23800004	! t0_kref+0x1844:   	fbne,a	_kref+0x1854
	.word	0xf96e6018	! t0_kref+0x1848:   	prefetch	%i1 + 0x18, 28
	.word	0x91a40954	! t0_kref+0x184c:   	fmuld	%f16, %f20, %f8
	call	SYM(t0_subr2)
	.word	0xec08a03b	! t0_kref+0x1854:   	ldub	[%g2 + 0x3b], %l6
	.word	0xaedb401a	! t0_kref+0x1858:   	smulcc	%o5, %i2, %l7
	.word	0xaa3b001a	! t0_kref+0x185c:   	xnor	%o4, %i2, %l5
	.word	0xd406201c	! t0_kref+0x1860:   	ld	[%i0 + 0x1c], %o2
	.word	0x2b480007	! t0_kref+0x1864:   	fbug,a,pt	%fcc0, _kref+0x1880
	.word	0xee56001b	! t0_kref+0x1868:   	ldsh	[%i0 + %i3], %l7
	.word	0x9fa0012d	! t0_kref+0x186c:   	fabss	%f13, %f15
	.word	0xed68a08f	! t0_kref+0x1870:   	prefetch	%g2 + 0x8f, 22
	.word	0xdf20a018	! t0_kref+0x1874:   	st	%f15, [%g2 + 0x18]
	.word	0xa71b400c	! t0_kref+0x1878:   	tsubcctv	%o5, %o4, %l3
	.word	0x97a2c9ae	! t0_kref+0x187c:   	fdivs	%f11, %f14, %f11
	.word	0x91b6817a	! t0_kref+0x1880:   	edge32ln	%i2, %i2, %o0
	.word	0xa646800d	! t0_kref+0x1884:   	addc	%i2, %o5, %l3
	.word	0x28800008	! t0_kref+0x1888:   	bleu,a	_kref+0x18a8
	.word	0xa853400c	! t0_kref+0x188c:   	umul	%o5, %o4, %l4
	.word	0xaba00032	! t0_kref+0x1890:   	fmovs	%f18, %f21
	.word	0x25480008	! t0_kref+0x1894:   	fblg,a,pt	%fcc0, _kref+0x18b4
	.word	0xaad82018	! t0_kref+0x1898:   	smulcc	%g0, 0x18, %l5
	.word	0x81df000a	! t0_kref+0x189c:   	flush	%i4 + %o2
	.word	0x2f480005	! t0_kref+0x18a0:   	fbu,a,pt	%fcc0, _kref+0x18b4
	.word	0xa3a288af	! t0_kref+0x18a4:   	fsubs	%f10, %f15, %f17
	.word	0xd828a009	! t0_kref+0x18a8:   	stb	%o4, [%g2 + 9]
	.word	0x91a28952	! t0_kref+0x18ac:   	fmuld	%f10, %f18, %f8
	.word	0xae982834	! t0_kref+0x18b0:   	xorcc	%g0, 0x834, %l7
	.word	0xa1a00532	! t0_kref+0x18b4:   	fsqrts	%f18, %f16
	.word	0xa6630000	! t0_kref+0x18b8:   	subc	%o4, %g0, %l3
	.word	0xa886b579	! t0_kref+0x18bc:   	addcc	%i2, -0xa87, %l4
	.word	0x33480008	! t0_kref+0x18c0:   	fbe,a,pt	%fcc0, _kref+0x18e0
	.word	0xe41e3ff0	! t0_kref+0x18c4:   	ldd	[%i0 - 0x10], %l2
	.word	0xa63b001a	! t0_kref+0x18c8:   	xnor	%o4, %i2, %l3
	.word	0xa69eae0f	! t0_kref+0x18cc:   	xorcc	%i2, 0xe0f, %l3
	.word	0xe1a01019	! t0_kref+0x18d0:   	sta	%f16, [%g0 + %i1]0x80
	.word	0x9bb00772	! t0_kref+0x18d4:   	fpack16	%f18, %f13
	.word	0xa8903921	! t0_kref+0x18d8:   	orcc	%g0, -0x6df, %l4
	.word	0xd4070019	! t0_kref+0x18dc:   	ld	[%i4 + %i1], %o2
	.word	0x81dd3157	! t0_kref+0x18e0:   	flush	%l4 - 0xea9
	.word	0xe9000018	! t0_kref+0x18e4:   	ld	[%g0 + %i0], %f20
	.word	0xa1b20d8a	! t0_kref+0x18e8:   	fxor	%f8, %f10, %f16
	.word	0xafb6834c	! t0_kref+0x18ec:   	alignaddrl	%i2, %o4, %l7
	.word	0xea08a002	! t0_kref+0x18f0:   	ldub	[%g2 + 2], %l5
	.word	0x92d82940	! t0_kref+0x18f4:   	smulcc	%g0, 0x940, %o1
	.word	0x29480007	! t0_kref+0x18f8:   	fbl,a,pt	%fcc0, _kref+0x1914
	.word	0xe99f5018	! t0_kref+0x18fc:   	ldda	[%i5 + %i0]0x80, %f20
	.word	0xa5b48f90	! t0_kref+0x1900:   	for	%f18, %f16, %f18
	.word	0x95a00535	! t0_kref+0x1904:   	fsqrts	%f21, %f10
	.word	0x9fa00032	! t0_kref+0x1908:   	fmovs	%f18, %f15
	.word	0xa1a00534	! t0_kref+0x190c:   	fsqrts	%f20, %f16
	.word	0xa3b24f70	! t0_kref+0x1910:   	fornot1s	%f9, %f16, %f17
	.word	0x92e34000	! t0_kref+0x1914:   	subccc	%o5, %g0, %o1
	.word	0xe67e7ffc	! t0_kref+0x1918:   	swap	[%i1 - 4], %l3
	.word	0xd8300018	! t0_kref+0x191c:   	sth	%o4, [%g0 + %i0]
	.word	0x26480005	! t0_kref+0x1920:   	bl,a,pt	%icc, _kref+0x1934
	.word	0xe920a020	! t0_kref+0x1924:   	st	%f20, [%g2 + 0x20]
	.word	0xe8ce9018	! t0_kref+0x1928:   	ldsba	[%i2 + %i0]0x80, %l4
	.word	0xa6968000	! t0_kref+0x192c:   	orcc	%i2, %g0, %l3
	.word	0x9fa3c8a8	! t0_kref+0x1930:   	fsubs	%f15, %f8, %f15
	.word	0xc02e7ffa	! t0_kref+0x1934:   	clrb	[%i1 - 6]
	.word	0x91a28848	! t0_kref+0x1938:   	faddd	%f10, %f8, %f8
	.word	0xa643000d	! t0_kref+0x193c:   	addc	%o4, %o5, %l3
	.word	0xa940c000	! t0_kref+0x1940:   	mov	%asi, %l4
	.word	0x99b4896d	! t0_kref+0x1944:   	fpmerge	%f18, %f13, %f12
	.word	0x878020d0	! t0_kref+0x1948:   	mov	0xd0, %asi
	.word	0xadb3034c	! t0_kref+0x194c:   	alignaddrl	%o4, %o4, %l6
	.word	0x95b4896a	! t0_kref+0x1950:   	fpmerge	%f18, %f10, %f10
	.word	0xf430a020	! t0_kref+0x1954:   	sth	%i2, [%g2 + 0x20]
	.word	0xad1b000d	! t0_kref+0x1958:   	tsubcctv	%o4, %o5, %l6
	.word	0x90333724	! t0_kref+0x195c:   	orn	%o4, -0x8dc, %o0
	.word	0x99b20e48	! t0_kref+0x1960:   	fxnor	%f8, %f8, %f12
	sethi	%hi(2f), %o7
	.word	0xe40be188	! t0_kref+0x1968:   	ldub	[%o7 + 0x188], %l2
	.word	0xa41ca00c	! t0_kref+0x196c:   	xor	%l2, 0xc, %l2
	.word	0xe42be188	! t0_kref+0x1970:   	stb	%l2, [%o7 + 0x188]
	.word	0x81dbe188	! t0_kref+0x1974:   	flush	%o7 + 0x188
	.word	0xd410a020	! t0_kref+0x1978:   	lduh	[%g2 + 0x20], %o2
	.word	0xe60e3fee	! t0_kref+0x197c:   	ldub	[%i0 - 0x12], %l3
	.word	0x9da0192a	! t0_kref+0x1980:   	fstod	%f10, %f14
	.word	0x81830000	! t0_kref+0x1984:   	wr	%o4, %g0, %y
2:	.word	0x9fa0002f	! t0_kref+0x1988:   	fmovs	%f15, %f15
	.word	0xa72e800d	! t0_kref+0x198c:   	sll	%i2, %o5, %l3
	.word	0x9f414000	! t0_kref+0x1990:   	mov	%pc, %o7
!	.word	0x284e1998	! t0_kref+0x1994:   	bleu,a,pt	%icc, SYM(t0_subr2)
	   	bleu,a,pt	%icc, SYM(t0_subr2)
	.word	0xb6103ffa	! t0_kref+0x1998:   	mov	0xfffffffa, %i3
	.word	0xa3a00528	! t0_kref+0x199c:   	fsqrts	%f8, %f17
	.word	0xa1a388cc	! t0_kref+0x19a0:   	fsubd	%f14, %f12, %f16
	.word	0xa1b44a6d	! t0_kref+0x19a4:   	fpadd32s	%f17, %f13, %f16
	.word	0xa783000d	! t0_kref+0x19a8:   	wr	%o4, %o5, %gsr
	.word	0x9da30952	! t0_kref+0x19ac:   	fmuld	%f12, %f18, %f14
	.word	0xf4ae101a	! t0_kref+0x19b0:   	stba	%i2, [%i0 + %i2]0x80
	.word	0xf9ee501a	! t0_kref+0x19b4:   	prefetcha	%i1 + %i2, 28
	.word	0x22480005	! t0_kref+0x19b8:   	be,a,pt	%icc, _kref+0x19cc
	.word	0xad282005	! t0_kref+0x19bc:   	sll	%g0, 0x5, %l6
	.word	0x9003665a	! t0_kref+0x19c0:   	add	%o5, 0x65a, %o0
	.word	0xaa73400d	! t0_kref+0x19c4:   	udiv	%o5, %o5, %l5
!	.word	0x3a4e198b	! t0_kref+0x19c8:   	bcc,a,pt	%icc, SYM(t0_subr2)
	   	bcc,a,pt	%icc, SYM(t0_subr2)
	.word	0x9f414000	! t0_kref+0x19cc:   	mov	%pc, %o7
	.word	0xac2b4000	! t0_kref+0x19d0:   	andn	%o5, %g0, %l6
	.word	0xa9a409ca	! t0_kref+0x19d4:   	fdivd	%f16, %f10, %f20
	.word	0x931b6c5a	! t0_kref+0x19d8:   	tsubcctv	%o5, 0xc5a, %o1
	.word	0xaba208af	! t0_kref+0x19dc:   	fsubs	%f8, %f15, %f21
	.word	0xe87e401c	! t0_kref+0x19e0:   	swap	[%i1 + %i4], %l4
	.word	0x26800001	! t0_kref+0x19e4:   	bl,a	_kref+0x19e8
	.word	0x95400000	! t0_kref+0x19e8:   	mov	%y, %o2
	.word	0xe306401c	! t0_kref+0x19ec:   	ld	[%i1 + %i4], %f17
	.word	0xee7e001c	! t0_kref+0x19f0:   	swap	[%i0 + %i4], %l7
	.word	0x9de3bfa0	! t0_kref+0x19f4:   	save	%sp, -0x60, %sp
	.word	0x93ef0019	! t0_kref+0x19f8:   	restore	%i4, %i1, %o1
	.word	0x93408000	! t0_kref+0x19fc:   	mov	%ccr, %o1
	.word	0xd7a71018	! t0_kref+0x1a00:   	sta	%f11, [%i4 + %i0]0x80
	.word	0xf428a029	! t0_kref+0x1a04:   	stb	%i2, [%g2 + 0x29]
	.word	0x945360b8	! t0_kref+0x1a08:   	umul	%o5, 0xb8, %o2
	.word	0xaee3000d	! t0_kref+0x1a0c:   	subccc	%o4, %o5, %l7
	.word	0xa9382003	! t0_kref+0x1a10:   	sra	%g0, 0x3, %l4
	.word	0xef6e2010	! t0_kref+0x1a14:   	prefetch	%i0 + 0x10, 23
	.word	0x81dc400d	! t0_kref+0x1a18:   	flush	%l1 + %o5
	.word	0x2f480003	! t0_kref+0x1a1c:   	fbu,a,pt	%fcc0, _kref+0x1a28
	.word	0x9063400d	! t0_kref+0x1a20:   	subc	%o5, %o5, %o0
	.word	0xa7a000aa	! t0_kref+0x1a24:   	fnegs	%f10, %f19
	.word	0xacb0000d	! t0_kref+0x1a28:   	orncc	%g0, %o5, %l6
	.word	0x34480005	! t0_kref+0x1a2c:   	bg,a,pt	%icc, _kref+0x1a40
	.word	0xa7a0052e	! t0_kref+0x1a30:   	fsqrts	%f14, %f19
	.word	0x91b3cf6c	! t0_kref+0x1a34:   	fornot1s	%f15, %f12, %f8
         nop   !	call	0xffffffa0
	.word	0x99a0192c	! t0_kref+0x1a3c:   	fstod	%f12, %f12
	.word	0xd43e001d	! t0_kref+0x1a40:   	std	%o2, [%i0 + %i5]
	.word	0x8143e040	! t0_kref+0x1a44:   	membar	0x40
	.word	0x9de3bfa0	! t0_kref+0x1a48:   	save	%sp, -0x60, %sp
	.word	0xb82ec01a	! t0_kref+0x1a4c:   	andn	%i3, %i2, %i4
	.word	0xadee8000	! t0_kref+0x1a50:   	restore	%i2, %g0, %l6
	.word	0x99a00131	! t0_kref+0x1a54:   	fabss	%f17, %f12
	.word	0xdd00a008	! t0_kref+0x1a58:   	ld	[%g2 + 8], %f14
	.word	0xa1b00fc0	! t0_kref+0x1a5c:   	fone	%f16
	.word	0xaec368bc	! t0_kref+0x1a60:   	addccc	%o5, 0x8bc, %l7
	.word	0x2b15ba96	! t0_kref+0x1a64:   	sethi	%hi(0x56ea5800), %l5
	.word	0xe1be188d	! t0_kref+0x1a68:   	stda	%f16, [%i0 + %o5]0xc4
	.word	0x9da00532	! t0_kref+0x1a6c:   	fsqrts	%f18, %f14
	.word	0xaab3000d	! t0_kref+0x1a70:   	orncc	%o4, %o5, %l5
	.word	0x2a800003	! t0_kref+0x1a74:   	bcs,a	_kref+0x1a80
	.word	0xab418000	! t0_kref+0x1a78:   	mov	%fprs, %l5
	.word	0xdf070019	! t0_kref+0x1a7c:   	ld	[%i4 + %i1], %f15
	.word	0xc168a088	! t0_kref+0x1a80:   	prefetch	%g2 + 0x88, 0
	.word	0xa9a0192e	! t0_kref+0x1a84:   	fstod	%f14, %f20
	.word	0xa7b3004d	! t0_kref+0x1a88:   	edge8l	%o4, %o5, %l3
	.word	0xd010a018	! t0_kref+0x1a8c:   	lduh	[%g2 + 0x18], %o0
	.word	0xd120a030	! t0_kref+0x1a90:   	st	%f8, [%g2 + 0x30]
	.word	0x9fc00004	! t0_kref+0x1a94:   	call	%g0 + %g4
	.word	0xf56e001b	! t0_kref+0x1a98:   	prefetch	%i0 + %i3, 26
	.word	0x2d480002	! t0_kref+0x1a9c:   	fbg,a,pt	%fcc0, _kref+0x1aa4
	.word	0x9db38ec8	! t0_kref+0x1aa0:   	fornot2	%f14, %f8, %f14
	sethi	%hi(2f), %o7
	.word	0xe40be2dc	! t0_kref+0x1aa8:   	ldub	[%o7 + 0x2dc], %l2
	.word	0xa41ca00c	! t0_kref+0x1aac:   	xor	%l2, 0xc, %l2
	.word	0xe42be2dc	! t0_kref+0x1ab0:   	stb	%l2, [%o7 + 0x2dc]
	.word	0x81dbe2dc	! t0_kref+0x1ab4:   	flush	%o7 + 0x2dc
	.word	0x932b400c	! t0_kref+0x1ab8:   	sll	%o5, %o4, %o1
	.word	0xec163fee	! t0_kref+0x1abc:   	lduh	[%i0 - 0x12], %l6
	.word	0x9fc00004	! t0_kref+0x1ac0:   	call	%g0 + %g4
	.word	0xa65ea049	! t0_kref+0x1ac4:   	smul	%i2, 0x49, %l3
	.word	0xda30a02a	! t0_kref+0x1ac8:   	sth	%o5, [%g2 + 0x2a]
	.word	0x92bb3c3c	! t0_kref+0x1acc:   	xnorcc	%o4, -0x3c4, %o1
	.word	0xaba2c9b1	! t0_kref+0x1ad0:   	fdivs	%f11, %f17, %f21
	.word	0x91a00050	! t0_kref+0x1ad4:   	fmovd	%f16, %f8
	.word	0xea86101c	! t0_kref+0x1ad8:   	lda	[%i0 + %i4]0x80, %l5
2:	.word	0xa3a0002b	! t0_kref+0x1adc:   	fmovs	%f11, %f17
	.word	0xeb00a018	! t0_kref+0x1ae0:   	ld	[%g2 + 0x18], %f21
	.word	0xe5066008	! t0_kref+0x1ae4:   	ld	[%i1 + 8], %f18
	.word	0x99a24828	! t0_kref+0x1ae8:   	fadds	%f9, %f8, %f12
	.word	0x95b38588	! t0_kref+0x1aec:   	fcmpgt32	%f14, %f8, %o2
	.word	0x907b789b	! t0_kref+0x1af0:   	sdiv	%o5, -0x765, %o0
	.word	0xf4700019	! t0_kref+0x1af4:   	stx	%i2, [%g0 + %i1]
	.word	0xc036200e	! t0_kref+0x1af8:   	clrh	[%i0 + 0xe]
	.word	0xdd1e4000	! t0_kref+0x1afc:   	ldd	[%i1], %f14
	.word	0xda763fe0	! t0_kref+0x1b00:   	stx	%o5, [%i0 - 0x20]
	.word	0x99a01912	! t0_kref+0x1b04:   	fitod	%f18, %f12
	.word	0xa8dea859	! t0_kref+0x1b08:   	smulcc	%i2, 0x859, %l4
	.word	0xaf400000	! t0_kref+0x1b0c:   	mov	%y, %l7
	.word	0xaa80001a	! t0_kref+0x1b10:   	addcc	%g0, %i2, %l5
	.word	0xf4a81018	! t0_kref+0x1b14:   	stba	%i2, [%g0 + %i0]0x80
	.word	0x95a018d0	! t0_kref+0x1b18:   	fdtos	%f16, %f10
	.word	0xea00a008	! t0_kref+0x1b1c:   	ld	[%g2 + 8], %l5
	.word	0xe6580018	! t0_kref+0x1b20:   	ldx	[%g0 + %i0], %l3
	.word	0xa9a01909	! t0_kref+0x1b24:   	fitod	%f9, %f20
	.word	0x91400000	! t0_kref+0x1b28:   	mov	%y, %o0
	.word	0x95183b0d	! t0_kref+0x1b2c:   	tsubcctv	%g0, -0x4f3, %o2
	.word	0xa920000c	! t0_kref+0x1b30:   	mulscc	%g0, %o4, %l4
!	.word	0x284f2930	! t0_kref+0x1b34:   	bleu,a,pt	%icc, SYM(t0_subr1)
	   	bleu,a,pt	%icc, SYM(t0_subr1)
	.word	0x9f414000	! t0_kref+0x1b38:   	mov	%pc, %o7
	.word	0x9290302d	! t0_kref+0x1b3c:   	orcc	%g0, -0xfd3, %o1
	.word	0xe41e401d	! t0_kref+0x1b40:   	ldd	[%i1 + %i5], %l2
	.word	0x2b480003	! t0_kref+0x1b44:   	fbug,a,pt	%fcc0, _kref+0x1b50
	.word	0xda30a018	! t0_kref+0x1b48:   	sth	%o5, [%g2 + 0x18]
	.word	0xa6182a4b	! t0_kref+0x1b4c:   	xor	%g0, 0xa4b, %l3
	call	SYM(t0_subr3)
	.word	0x91a40850	! t0_kref+0x1b54:   	faddd	%f16, %f16, %f8
	.word	0x95a88052	! t0_kref+0x1b58:   	fmovdlg	%fcc0, %f18, %f10
	.word	0xe51fbd90	! t0_kref+0x1b5c:   	ldd	[%fp - 0x270], %f18
	.word	0x93418000	! t0_kref+0x1b60:   	mov	%fprs, %o1
	.word	0xa7b30200	! t0_kref+0x1b64:   	array8	%o4, %g0, %l3
	.word	0xd5981018	! t0_kref+0x1b68:   	ldda	[%g0 + %i0]0x80, %f10
	.word	0xa830000c	! t0_kref+0x1b6c:   	orn	%g0, %o4, %l4
	.word	0xac9ea700	! t0_kref+0x1b70:   	xorcc	%i2, 0x700, %l6
	.word	0x933b600c	! t0_kref+0x1b74:   	sra	%o5, 0xc, %o1
	.word	0x9fc00004	! t0_kref+0x1b78:   	call	%g0 + %g4
	.word	0x9fb54cb2	! t0_kref+0x1b7c:   	fandnot2s	%f21, %f18, %f15
	.word	0xad3b2005	! t0_kref+0x1b80:   	sra	%o4, 0x5, %l6
	.word	0xa5a2c832	! t0_kref+0x1b84:   	fadds	%f11, %f18, %f18
	.word	0xd1be588d	! t0_kref+0x1b88:   	stda	%f8, [%i1 + %o5]0xc4
	.word	0x9098356c	! t0_kref+0x1b8c:   	xorcc	%g0, -0xa94, %o0
	.word	0x99a2094c	! t0_kref+0x1b90:   	fmuld	%f8, %f12, %f12
	.word	0xe7263fe8	! t0_kref+0x1b94:   	st	%f19, [%i0 - 0x18]
	.word	0xfd6e401d	! t0_kref+0x1b98:   	prefetch	%i1 + %i5, 30
	.word	0xd9be5840	! t0_kref+0x1b9c:   	stda	%f12, [%i1]0xc2
	.word	0xc028a021	! t0_kref+0x1ba0:   	clrb	[%g2 + 0x21]
	.word	0xe900a000	! t0_kref+0x1ba4:   	ld	[%g2], %f20
	.word	0xaaa82d4d	! t0_kref+0x1ba8:   	andncc	%g0, 0xd4d, %l5
	.word	0xd9e6100d	! t0_kref+0x1bac:   	casa	[%i0]0x80, %o5, %o4
	.word	0x23480003	! t0_kref+0x1bb0:   	fbne,a,pt	%fcc0, _kref+0x1bbc
	.word	0xae96afea	! t0_kref+0x1bb4:   	orcc	%i2, 0xfea, %l7
	.word	0x95b40712	! t0_kref+0x1bb8:   	fmuld8sux16	%f16, %f18, %f10
	.word	0x8143e040	! t0_kref+0x1bbc:   	membar	0x40
	.word	0x93a00530	! t0_kref+0x1bc0:   	fsqrts	%f16, %f9
	.word	0x99b30c88	! t0_kref+0x1bc4:   	fandnot2	%f12, %f8, %f12
	.word	0x908b7200	! t0_kref+0x1bc8:   	andcc	%o5, -0xe00, %o0
	.word	0x95a509b0	! t0_kref+0x1bcc:   	fdivs	%f20, %f16, %f10
	.word	0xa9a2492e	! t0_kref+0x1bd0:   	fmuls	%f9, %f14, %f20
	.word	0x9fc10000	! t0_kref+0x1bd4:   	call	%g4
	.word	0x99b34c6e	! t0_kref+0x1bd8:   	fnors	%f13, %f14, %f12
	.word	0xa1a0052e	! t0_kref+0x1bdc:   	fsqrts	%f14, %f16
	.word	0xab3ea01a	! t0_kref+0x1be0:   	sra	%i2, 0x1a, %l5
	.word	0x81ad0a4a	! t0_kref+0x1be4:   	fcmpd	%fcc0, %f20, %f10
	.word	0xa961e7d2	! t0_kref+0x1be8:   	movu	%fcc0, -0x2e, %l4
	.word	0xa8b8270c	! t0_kref+0x1bec:   	xnorcc	%g0, 0x70c, %l4
	.word	0x2e800006	! t0_kref+0x1bf0:   	bvs,a	_kref+0x1c08
	.word	0xa5a4094a	! t0_kref+0x1bf4:   	fmuld	%f16, %f10, %f18
	.word	0x81b01024	! t0_kref+0x1bf8:   	siam	0x4
	.word	0xa7b504cc	! t0_kref+0x1bfc:   	fcmpne32	%f20, %f12, %l3
	.word	0xec00a028	! t0_kref+0x1c00:   	ld	[%g2 + 0x28], %l6
	.word	0xe640a020	! t0_kref+0x1c04:   	ldsw	[%g2 + 0x20], %l3
	.word	0xef68a0c8	! t0_kref+0x1c08:   	prefetch	%g2 + 0xc8, 23
	.word	0xa6a820fe	! t0_kref+0x1c0c:   	andncc	%g0, 0xfe, %l3
	.word	0xda20a000	! t0_kref+0x1c10:   	st	%o5, [%g2]
	.word	0xa9a01a30	! t0_kref+0x1c14:   	fstoi	%f16, %f20
	.word	0xaafe801a	! t0_kref+0x1c18:   	sdivcc	%i2, %i2, %l5
	.word	0xa7b2844e	! t0_kref+0x1c1c:   	fcmpne16	%f10, %f14, %l3
	.word	0x9ba00529	! t0_kref+0x1c20:   	fsqrts	%f9, %f13
	.word	0x952b2003	! t0_kref+0x1c24:   	sll	%o4, 0x3, %o2
	.word	0xa783401a	! t0_kref+0x1c28:   	wr	%o5, %i2, %gsr
	.word	0xda28a022	! t0_kref+0x1c2c:   	stb	%o5, [%g2 + 0x22]
	.word	0x9fc00004	! t0_kref+0x1c30:   	call	%g0 + %g4
	.word	0xea08a01a	! t0_kref+0x1c34:   	ldub	[%g2 + 0x1a], %l5
	.word	0x93a00534	! t0_kref+0x1c38:   	fsqrts	%f20, %f9
	.word	0xa7003916	! t0_kref+0x1c3c:   	taddcc	%g0, -0x6ea, %l3
	.word	0xd1be189a	! t0_kref+0x1c40:   	stda	%f8, [%i0 + %i2]0xc4
	.word	0x9de3bfa0	! t0_kref+0x1c44:   	save	%sp, -0x60, %sp
	.word	0x80bf4000	! t0_kref+0x1c48:   	xnorcc	%i5, %g0, %g0
	.word	0xabef401b	! t0_kref+0x1c4c:   	restore	%i5, %i3, %l5
	.word	0xaae30000	! t0_kref+0x1c50:   	subccc	%o4, %g0, %l5
	.word	0x8d832012	! t0_kref+0x1c54:   	wr	%o4, 0x12, %fprs
	.word	0x2f480004	! t0_kref+0x1c58:   	fbu,a,pt	%fcc0, _kref+0x1c68
	.word	0xaeb3001a	! t0_kref+0x1c5c:   	orncc	%o4, %i2, %l7
	.word	0xaa1b0000	! t0_kref+0x1c60:   	xor	%o4, %g0, %l5
	.word	0xc0364000	! t0_kref+0x1c64:   	clrh	[%i1]
	.word	0x9da488ce	! t0_kref+0x1c68:   	fsubd	%f18, %f14, %f14
	.word	0x3b480003	! t0_kref+0x1c6c:   	fble,a,pt	%fcc0, _kref+0x1c78
	.word	0x99b40a14	! t0_kref+0x1c70:   	fpadd16	%f16, %f20, %f12
	.word	0xaf400000	! t0_kref+0x1c74:   	mov	%y, %l7
	.word	0xe6de1000	! t0_kref+0x1c78:   	ldxa	[%i0]0x80, %l3
	.word	0x94db661b	! t0_kref+0x1c7c:   	smulcc	%o5, 0x61b, %o2
	.word	0x93b40d60	! t0_kref+0x1c80:   	fnot1s	%f16, %f9
	.word	0xaefb000d	! t0_kref+0x1c84:   	sdivcc	%o4, %o5, %l7
	call	SYM(t0_subr3)
	.word	0x903323f2	! t0_kref+0x1c8c:   	orn	%o4, 0x3f2, %o0
	.word	0x931eb551	! t0_kref+0x1c90:   	tsubcctv	%i2, -0xaaf, %o1
	.word	0xac66801a	! t0_kref+0x1c94:   	subc	%i2, %i2, %l6
	.word	0xacc68000	! t0_kref+0x1c98:   	addccc	%i2, %g0, %l6
	.word	0xe900a008	! t0_kref+0x1c9c:   	ld	[%g2 + 8], %f20
	.word	0x9fb2cd60	! t0_kref+0x1ca0:   	fnot1s	%f11, %f15
	.word	0xa9a289ad	! t0_kref+0x1ca4:   	fdivs	%f10, %f13, %f20
	.word	0xd9be5a5d	! t0_kref+0x1ca8:   	stda	%f12, [%i1 + %i5]0xd2
	.word	0xa83e800d	! t0_kref+0x1cac:   	xnor	%i2, %o5, %l4
	.word	0xa7400000	! t0_kref+0x1cb0:   	mov	%y, %l3
	.word	0xd0567ff2	! t0_kref+0x1cb4:   	ldsh	[%i1 - 0xe], %o0
	.word	0x93a309b3	! t0_kref+0x1cb8:   	fdivs	%f12, %f19, %f9
	.word	0xd43e3ff0	! t0_kref+0x1cbc:   	std	%o2, [%i0 - 0x10]
	.word	0x97a3c8ae	! t0_kref+0x1cc0:   	fsubs	%f15, %f14, %f11
	.word	0x9fa409b4	! t0_kref+0x1cc4:   	fdivs	%f16, %f20, %f15
	.word	0x28800008	! t0_kref+0x1cc8:   	bleu,a	_kref+0x1ce8
	.word	0xdd00a000	! t0_kref+0x1ccc:   	ld	[%g2], %f14
	.word	0xacfb7b25	! t0_kref+0x1cd0:   	sdivcc	%o5, -0x4db, %l6
	.word	0xeb68a000	! t0_kref+0x1cd4:   	prefetch	%g2, 21
	.word	0xabb485c8	! t0_kref+0x1cd8:   	fcmpeq32	%f18, %f8, %l5
	.word	0xa9a0108a	! t0_kref+0x1cdc:   	fxtos	%f10, %f20
	.word	0x95b24d60	! t0_kref+0x1ce0:   	fnot1s	%f9, %f10
	.word	0x94fb401a	! t0_kref+0x1ce4:   	sdivcc	%o5, %i2, %o2
	.word	0x94c37bc2	! t0_kref+0x1ce8:   	addccc	%o5, -0x43e, %o2
	.word	0xec6e8018	! t0_kref+0x1cec:   	ldstub	[%i2 + %i0], %l6
	.word	0xa7b300fa	! t0_kref+0x1cf0:   	edge16ln	%o4, %i2, %l3
	.word	0x99a488d4	! t0_kref+0x1cf4:   	fsubd	%f18, %f20, %f12
	.word	0xa5a01915	! t0_kref+0x1cf8:   	fitod	%f21, %f18
	.word	0xe5180019	! t0_kref+0x1cfc:   	ldd	[%g0 + %i1], %f18
	.word	0x81ab8ab0	! t0_kref+0x1d00:   	fcmpes	%fcc0, %f14, %f16
	.word	0x81ad0aca	! t0_kref+0x1d04:   	fcmped	%fcc0, %f20, %f10
	.word	0xae300000	! t0_kref+0x1d08:   	orn	%g0, %g0, %l7
	.word	0x9db00774	! t0_kref+0x1d0c:   	fpack16	%f20, %f14
	.word	0xa1a2c8ae	! t0_kref+0x1d10:   	fsubs	%f11, %f14, %f16
	.word	0xaa83000d	! t0_kref+0x1d14:   	addcc	%o4, %o5, %l5
	.word	0x95a00531	! t0_kref+0x1d18:   	fsqrts	%f17, %f10
	.word	0xa6b02682	! t0_kref+0x1d1c:   	orncc	%g0, 0x682, %l3
	.word	0xa823401a	! t0_kref+0x1d20:   	sub	%o5, %i2, %l4
	.word	0xa63021dd	! t0_kref+0x1d24:   	orn	%g0, 0x1dd, %l3
	.word	0x93a00130	! t0_kref+0x1d28:   	fabss	%f16, %f9
	.word	0x91a000b2	! t0_kref+0x1d2c:   	fnegs	%f18, %f8
	.word	0xaba4082c	! t0_kref+0x1d30:   	fadds	%f16, %f12, %f21
	.word	0xec680019	! t0_kref+0x1d34:   	ldstub	[%g0 + %i1], %l6
	.word	0x81daaafd	! t0_kref+0x1d38:   	flush	%o2 + 0xafd
	.word	0xc96e7fe8	! t0_kref+0x1d3c:   	prefetch	%i1 - 0x18, 4
	.word	0x90032026	! t0_kref+0x1d40:   	add	%o4, 0x26, %o0
	.word	0x912b000c	! t0_kref+0x1d44:   	sll	%o4, %o4, %o0
	.word	0xae8eadec	! t0_kref+0x1d48:   	andcc	%i2, 0xdec, %l7
	.word	0x39480006	! t0_kref+0x1d4c:   	fbuge,a,pt	%fcc0, _kref+0x1d64
	.word	0xecde101d	! t0_kref+0x1d50:   	ldxa	[%i0 + %i5]0x80, %l6
	.word	0xaab0000d	! t0_kref+0x1d54:   	orncc	%g0, %o5, %l5
	.word	0x93a01a4e	! t0_kref+0x1d58:   	fdtoi	%f14, %f9
	.word	0x94e6801a	! t0_kref+0x1d5c:   	subccc	%i2, %i2, %o2
	.word	0xa1b20d60	! t0_kref+0x1d60:   	fnot1s	%f8, %f16
	.word	0x2f12f27f	! t0_kref+0x1d64:   	sethi	%hi(0x4bc9fc00), %l7
	.word	0xe3e6101a	! t0_kref+0x1d68:   	casa	[%i0]0x80, %i2, %l1
	.word	0xa1a00533	! t0_kref+0x1d6c:   	fsqrts	%f19, %f16
	.word	0xc12e401c	! t0_kref+0x1d70:   	st	%fsr, [%i1 + %i4]
	.word	0xabb44a73	! t0_kref+0x1d74:   	fpadd32s	%f17, %f19, %f21
	.word	0x9bb4cd60	! t0_kref+0x1d78:   	fnot1s	%f19, %f13
	.word	0xfd6e001b	! t0_kref+0x1d7c:   	prefetch	%i0 + %i3, 30
	.word	0xd720a008	! t0_kref+0x1d80:   	st	%f11, [%g2 + 8]
	.word	0xa7334000	! t0_kref+0x1d84:   	srl	%o5, %g0, %l3
	.word	0xaa9b000d	! t0_kref+0x1d88:   	xorcc	%o4, %o5, %l5
	.word	0x8143e040	! t0_kref+0x1d8c:   	membar	0x40
	.word	0xa733000d	! t0_kref+0x1d90:   	srl	%o4, %o5, %l3
	.word	0xa3b3ca72	! t0_kref+0x1d94:   	fpadd32s	%f15, %f18, %f17
	.word	0xa7b3400c	! t0_kref+0x1d98:   	edge8	%o5, %o4, %l3
	.word	0x95a48948	! t0_kref+0x1d9c:   	fmuld	%f18, %f8, %f10
	.word	0xa7b68040	! t0_kref+0x1da0:   	edge8l	%i2, %g0, %l3
	.word	0x9daa804c	! t0_kref+0x1da4:   	fmovdue	%fcc0, %f12, %f14
	.word	0x81aa0a54	! t0_kref+0x1da8:   	fcmpd	%fcc0, %f8, %f20
	.word	0x15108eb7	! t0_kref+0x1dac:   	sethi	%hi(0x423adc00), %o2
	.word	0x9438000d	! t0_kref+0x1db0:   	xnor	%g0, %o5, %o2
	.word	0x93a0002e	! t0_kref+0x1db4:   	fmovs	%f14, %f9
	.word	0xadb50492	! t0_kref+0x1db8:   	fcmple32	%f20, %f18, %l6
	.word	0xacc00000	! t0_kref+0x1dbc:   	addccc	%g0, %g0, %l6
	.word	0xe91e6000	! t0_kref+0x1dc0:   	ldd	[%i1], %f20
	.word	0x81aa8a4c	! t0_kref+0x1dc4:   	fcmpd	%fcc0, %f10, %f12
	.word	0x110b3068	! t0_kref+0x1dc8:   	sethi	%hi(0x2cc1a000), %o0
	.word	0xaa40273e	! t0_kref+0x1dcc:   	addc	%g0, 0x73e, %l5
	.word	0xeedf5019	! t0_kref+0x1dd0:   	ldxa	[%i5 + %i1]0x80, %l7
	.word	0x81834000	! t0_kref+0x1dd4:   	wr	%o5, %g0, %y
	.word	0xf428a039	! t0_kref+0x1dd8:   	stb	%i2, [%g2 + 0x39]
	.word	0x92d82171	! t0_kref+0x1ddc:   	smulcc	%g0, 0x171, %o1
	.word	0xa1b30c4c	! t0_kref+0x1de0:   	fnor	%f12, %f12, %f16
	.word	0xdd1e4000	! t0_kref+0x1de4:   	ldd	[%i1], %f14
	.word	0xaba0052e	! t0_kref+0x1de8:   	fsqrts	%f14, %f21
	.word	0x93a0188f	! t0_kref+0x1dec:   	fitos	%f15, %f9
	.word	0xaa86bff5	! t0_kref+0x1df0:   	addcc	%i2, -0xb, %l5
	.word	0xee562006	! t0_kref+0x1df4:   	ldsh	[%i0 + 6], %l7
	.word	0xe27e6004	! t0_kref+0x1df8:   	swap	[%i1 + 4], %l1
	.word	0xac1e800c	! t0_kref+0x1dfc:   	xor	%i2, %o4, %l6
	.word	0x2c480004	! t0_kref+0x1e00:   	bneg,a,pt	%icc, _kref+0x1e10
	.word	0x94debd51	! t0_kref+0x1e04:   	smulcc	%i2, -0x2af, %o2
	.word	0x91b3470a	! t0_kref+0x1e08:   	fmuld8sux16	%f13, %f10, %f8
	.word	0x33480002	! t0_kref+0x1e0c:   	fbe,a,pt	%fcc0, _kref+0x1e14
	.word	0xadb304d0	! t0_kref+0x1e10:   	fcmpne32	%f12, %f16, %l6
	.word	0x26480007	! t0_kref+0x1e14:   	bl,a,pt	%icc, _kref+0x1e30
	.word	0xc848001a	! t0_kref+0x1e18:   	ldsb	[%g0 + %i2], %g4
	.word	0x9db28d40	! t0_kref+0x1e1c:   	fnot1	%f10, %f14
	.word	0x91a248a8	! t0_kref+0x1e20:   	fsubs	%f9, %f8, %f8
	.word	0x97b24d60	! t0_kref+0x1e24:   	fnot1s	%f9, %f11
	.word	0x97a0002a	! t0_kref+0x1e28:   	fmovs	%f10, %f11
	.word	0xeb68a04e	! t0_kref+0x1e2c:   	prefetch	%g2 + 0x4e, 21
	.word	0xc12e401c	! t0_kref+0x1e30:   	st	%fsr, [%i1 + %i4]
	.word	0x90fb001a	! t0_kref+0x1e34:   	sdivcc	%o4, %i2, %o0
	.word	0xa9a000b2	! t0_kref+0x1e38:   	fnegs	%f18, %f20
	.word	0xab36800d	! t0_kref+0x1e3c:   	srl	%i2, %o5, %l5
	.word	0x9db44eee	! t0_kref+0x1e40:   	fornot2s	%f17, %f14, %f14
	.word	0x93a01a33	! t0_kref+0x1e44:   	fstoi	%f19, %f9
	.word	0xa3a01a30	! t0_kref+0x1e48:   	fstoi	%f16, %f17
	.word	0xe36e2000	! t0_kref+0x1e4c:   	prefetch	%i0, 17
	.word	0xda20a038	! t0_kref+0x1e50:   	st	%o5, [%g2 + 0x38]
	.word	0xa9a01930	! t0_kref+0x1e54:   	fstod	%f16, %f20
	.word	0xa9a00028	! t0_kref+0x1e58:   	fmovs	%f8, %f20
	.word	0x2c800003	! t0_kref+0x1e5c:   	bneg,a	_kref+0x1e68
	.word	0xaeab001a	! t0_kref+0x1e60:   	andncc	%o4, %i2, %l7
	.word	0x945b7787	! t0_kref+0x1e64:   	smul	%o5, -0x879, %o2
	.word	0xe51e4000	! t0_kref+0x1e68:   	ldd	[%i1], %f18
	.word	0xa5a248a8	! t0_kref+0x1e6c:   	fsubs	%f9, %f8, %f18
	.word	0x9fa308b5	! t0_kref+0x1e70:   	fsubs	%f12, %f21, %f15
	.word	0xafb3408c	! t0_kref+0x1e74:   	edge16	%o5, %o4, %l7
	.word	0xee160000	! t0_kref+0x1e78:   	lduh	[%i0], %l7
	.word	0xe91fbd10	! t0_kref+0x1e7c:   	ldd	[%fp - 0x2f0], %f20
	.word	0x90c00000	! t0_kref+0x1e80:   	addccc	%g0, %g0, %o0
	.word	0xea067fe4	! t0_kref+0x1e84:   	ld	[%i1 - 0x1c], %l5
	.word	0x95a488c8	! t0_kref+0x1e88:   	fsubd	%f18, %f8, %f10
	.word	0x33480003	! t0_kref+0x1e8c:   	fbe,a,pt	%fcc0, _kref+0x1e98
	.word	0xaba38831	! t0_kref+0x1e90:   	fadds	%f14, %f17, %f21
	.word	0x81dee9ad	! t0_kref+0x1e94:   	flush	%i3 + 0x9ad
	.word	0xf430a030	! t0_kref+0x1e98:   	sth	%i2, [%g2 + 0x30]
	.word	0xd9be584d	! t0_kref+0x1e9c:   	stda	%f12, [%i1 + %o5]0xc2
	.word	0xaeb6801a	! t0_kref+0x1ea0:   	orncc	%i2, %i2, %l7
	.word	0xacb6acfb	! t0_kref+0x1ea4:   	orncc	%i2, 0xcfb, %l6
	.word	0xd6780019	! t0_kref+0x1ea8:   	swap	[%g0 + %i1], %o3
	.word	0xd048a032	! t0_kref+0x1eac:   	ldsb	[%g2 + 0x32], %o0
	.word	0xe500a000	! t0_kref+0x1eb0:   	ld	[%g2], %f18
	.word	0x2b323860	! t0_kref+0x1eb4:   	sethi	%hi(0xc8e18000), %l5
	.word	0x91a28954	! t0_kref+0x1eb8:   	fmuld	%f10, %f20, %f8
	.word	0xdd00a018	! t0_kref+0x1ebc:   	ld	[%g2 + 0x18], %f14
	.word	0xa878000c	! t0_kref+0x1ec0:   	sdiv	%g0, %o4, %l4
	.word	0xadb00140	! t0_kref+0x1ec4:   	edge32l	%g0, %g0, %l6
	.word	0xd926600c	! t0_kref+0x1ec8:   	st	%f12, [%i1 + 0xc]
	.word	0xabb484ce	! t0_kref+0x1ecc:   	fcmpne32	%f18, %f14, %l5
	.word	0xd1067ff4	! t0_kref+0x1ed0:   	ld	[%i1 - 0xc], %f8
	.word	0xe4780019	! t0_kref+0x1ed4:   	swap	[%g0 + %i1], %l2
	.word	0x9363000c	! t0_kref+0x1ed8:   	movuge	%fcc0, %o4, %o1
	.word	0xabb34200	! t0_kref+0x1edc:   	array8	%o5, %g0, %l5
	.word	0x913b201b	! t0_kref+0x1ee0:   	sra	%o4, 0x1b, %o0
	.word	0xa1b2ccab	! t0_kref+0x1ee4:   	fandnot2s	%f11, %f11, %f16
	.word	0xc0fe101c	! t0_kref+0x1ee8:   	swapa	[%i0 + %i4]0x80, %g0
	.word	0xd520a018	! t0_kref+0x1eec:   	st	%f10, [%g2 + 0x18]
	.word	0xacb83738	! t0_kref+0x1ef0:   	xnorcc	%g0, -0x8c8, %l6
	.word	0x99a34d33	! t0_kref+0x1ef4:   	fsmuld	%f13, %f19, %f12
	.word	0x9270000d	! t0_kref+0x1ef8:   	udiv	%g0, %o5, %o1
	.word	0x99b30ecc	! t0_kref+0x1efc:   	fornot2	%f12, %f12, %f12
	.word	0xa8b363cb	! t0_kref+0x1f00:   	orncc	%o5, 0x3cb, %l4
	.word	0x1111cca0	! t0_kref+0x1f04:   	sethi	%hi(0x47328000), %o0
	.word	0x9fa289ac	! t0_kref+0x1f08:   	fdivs	%f10, %f12, %f15
	.word	0xec08a01a	! t0_kref+0x1f0c:   	ldub	[%g2 + 0x1a], %l6
	.word	0xacb3252b	! t0_kref+0x1f10:   	orncc	%o4, 0x52b, %l6
	.word	0xa8fb001a	! t0_kref+0x1f14:   	sdivcc	%o4, %i2, %l4
	.word	0xaab0000d	! t0_kref+0x1f18:   	orncc	%g0, %o5, %l5
	.word	0xa8bb7389	! t0_kref+0x1f1c:   	xnorcc	%o5, -0xc77, %l4
	.word	0xea48a020	! t0_kref+0x1f20:   	ldsb	[%g2 + 0x20], %l5
	.word	0xd4380019	! t0_kref+0x1f24:   	std	%o2, [%g0 + %i1]
	.word	0xe806201c	! t0_kref+0x1f28:   	ld	[%i0 + 0x1c], %l4
	.word	0xaab369ac	! t0_kref+0x1f2c:   	orncc	%o5, 0x9ac, %l5
	.word	0x8143e040	! t0_kref+0x1f30:   	membar	0x40
	.word	0xe8180019	! t0_kref+0x1f34:   	ldd	[%g0 + %i1], %l4
	.word	0xa6e6800d	! t0_kref+0x1f38:   	subccc	%i2, %o5, %l3
	.word	0xf4ae501a	! t0_kref+0x1f3c:   	stba	%i2, [%i1 + %i2]0x80
	.word	0x95a0188e	! t0_kref+0x1f40:   	fitos	%f14, %f10
	.word	0xa7300000	! t0_kref+0x1f44:   	srl	%g0, %g0, %l3
	.word	0xa6d6ae43	! t0_kref+0x1f48:   	umulcc	%i2, 0xe43, %l3
	.word	0x9fab8032	! t0_kref+0x1f4c:   	fmovsule	%fcc0, %f18, %f15
	.word	0x95400000	! t0_kref+0x1f50:   	mov	%y, %o2
	.word	0x99a01910	! t0_kref+0x1f54:   	fitod	%f16, %f12
	.word	0x27480003	! t0_kref+0x1f58:   	fbul,a,pt	%fcc0, _kref+0x1f64
	.word	0xf4367fe8	! t0_kref+0x1f5c:   	sth	%i2, [%i1 - 0x18]
	.word	0xa728201c	! t0_kref+0x1f60:   	sll	%g0, 0x1c, %l3
	.word	0xd306600c	! t0_kref+0x1f64:   	ld	[%i1 + 0xc], %f9
	.word	0x95a01a48	! t0_kref+0x1f68:   	fdtoi	%f8, %f10
	.word	0xe500a030	! t0_kref+0x1f6c:   	ld	[%g2 + 0x30], %f18
	.word	0xe1be1a5c	! t0_kref+0x1f70:   	stda	%f16, [%i0 + %i4]0xd2
	.word	0xaa903c33	! t0_kref+0x1f74:   	orcc	%g0, -0x3cd, %l5
	.word	0x8143e040	! t0_kref+0x1f78:   	membar	0x40
	.word	0x9da408d4	! t0_kref+0x1f7c:   	fsubd	%f16, %f20, %f14
	.word	0xab3b000d	! t0_kref+0x1f80:   	sra	%o4, %o5, %l5
	.word	0xc56e7ff8	! t0_kref+0x1f84:   	prefetch	%i1 - 8, 2
	.word	0xa5a409b1	! t0_kref+0x1f88:   	fdivs	%f16, %f17, %f18
	.word	0xd906601c	! t0_kref+0x1f8c:   	ld	[%i1 + 0x1c], %f12
	.word	0xaa382061	! t0_kref+0x1f90:   	xnor	%g0, 0x61, %l5
	.word	0xd048a013	! t0_kref+0x1f94:   	ldsb	[%g2 + 0x13], %o0
	.word	0x9fa448ae	! t0_kref+0x1f98:   	fsubs	%f17, %f14, %f15
	.word	0xa3b48f72	! t0_kref+0x1f9c:   	fornot1s	%f18, %f18, %f17
	.word	0x924371d6	! t0_kref+0x1fa0:   	addc	%o5, -0xe2a, %o1
	.word	0xe19e101d	! t0_kref+0x1fa4:   	ldda	[%i0 + %i5]0x80, %f16
	.word	0x99b30c8e	! t0_kref+0x1fa8:   	fandnot2	%f12, %f14, %f12
	.word	0xa9a01a33	! t0_kref+0x1fac:   	fstoi	%f19, %f20
	.word	0xc36e000c	! t0_kref+0x1fb0:   	prefetch	%i0 + %o4, 1
	.word	0xc12f0000	! t0_kref+0x1fb4:   	st	%fsr, [%i4]
	.word	0x91a4894e	! t0_kref+0x1fb8:   	fmuld	%f18, %f14, %f8
	.word	0xa62832d0	! t0_kref+0x1fbc:   	andn	%g0, -0xd30, %l3
	.word	0xd3a6501c	! t0_kref+0x1fc0:   	sta	%f9, [%i1 + %i4]0x80
	.word	0xa9b40a54	! t0_kref+0x1fc4:   	fpadd32	%f16, %f20, %f20
	.word	0xaa86b8e6	! t0_kref+0x1fc8:   	addcc	%i2, -0x71a, %l5
	.word	0x99b00cca	! t0_kref+0x1fcc:   	fnot2	%f10, %f12
	sethi	%hi(2f), %o7
	.word	0xe40be3f8	! t0_kref+0x1fd4:   	ldub	[%o7 + 0x3f8], %l2
	.word	0xa41ca00c	! t0_kref+0x1fd8:   	xor	%l2, 0xc, %l2
	.word	0xe42be3f8	! t0_kref+0x1fdc:   	stb	%l2, [%o7 + 0x3f8]
	.word	0x81dbe3f8	! t0_kref+0x1fe0:   	flush	%o7 + 0x3f8
	.word	0xa7b007b0	! t0_kref+0x1fe4:   	fpackfix	%f16, %f19
	.word	0x902b6c2e	! t0_kref+0x1fe8:   	andn	%o5, 0xc2e, %o0
	.word	0xead6d018	! t0_kref+0x1fec:   	ldsha	[%i3 + %i0]0x80, %l5
	.word	0x8d80000c	! t0_kref+0x1ff0:   	mov	%o4, %fprs
	.word	0x9da00150	! t0_kref+0x1ff4:   	fabsd	%f16, %f14
2:	.word	0xd3066008	! t0_kref+0x1ff8:   	ld	[%i1 + 8], %f9
	.word	0x99a388ce	! t0_kref+0x1ffc:   	fsubd	%f14, %f14, %f12
	.word	0xeb20a018	! t0_kref+0x2000:   	st	%f21, [%g2 + 0x18]
	.word	0x99a01a48	! t0_kref+0x2004:   	fdtoi	%f8, %f12
	.word	0xe700a010	! t0_kref+0x2008:   	ld	[%g2 + 0x10], %f19
	sethi	%hi(2f), %o7
	.word	0xe40be05c	! t0_kref+0x2010:   	ldub	[%o7 + 0x5c], %l2
	.word	0xa41ca00c	! t0_kref+0x2014:   	xor	%l2, 0xc, %l2
	.word	0xe42be05c	! t0_kref+0x2018:   	stb	%l2, [%o7 + 0x5c]
	.word	0x81dbe05c	! t0_kref+0x201c:   	flush	%o7 + 0x5c
	.word	0x9db4c711	! t0_kref+0x2020:   	fmuld8sux16	%f19, %f17, %f14
	.word	0x93a000b3	! t0_kref+0x2024:   	fnegs	%f19, %f9
	.word	0xf4364000	! t0_kref+0x2028:   	sth	%i2, [%i1]
	.word	0x90d8001a	! t0_kref+0x202c:   	smulcc	%g0, %i2, %o0
	.word	0x9533000c	! t0_kref+0x2030:   	srl	%o4, %o4, %o2
	.word	0xa9a01a48	! t0_kref+0x2034:   	fdtoi	%f8, %f20
	.word	0xd0063ff4	! t0_kref+0x2038:   	ld	[%i0 - 0xc], %o0
	.word	0xac068000	! t0_kref+0x203c:   	add	%i2, %g0, %l6
	.word	0xd410a008	! t0_kref+0x2040:   	lduh	[%g2 + 8], %o2
	.word	0xa1b20acc	! t0_kref+0x2044:   	fpsub32	%f8, %f12, %f16
	.word	0xa7400000	! t0_kref+0x2048:   	mov	%y, %l3
	.word	0x9ba0012c	! t0_kref+0x204c:   	fabss	%f12, %f13
	.word	0xa8a68000	! t0_kref+0x2050:   	subcc	%i2, %g0, %l4
	.word	0xe9beda19	! t0_kref+0x2054:   	stda	%f20, [%i3 + %i1]0xd0
	.word	0xdf20a030	! t0_kref+0x2058:   	st	%f15, [%g2 + 0x30]
2:	.word	0xa9418000	! t0_kref+0x205c:   	mov	%fprs, %l4
	.word	0x9de3bfa0	! t0_kref+0x2060:   	save	%sp, -0x60, %sp
	.word	0xb857641a	! t0_kref+0x2064:   	umul	%i5, 0x41a, %i4
	.word	0x91ee4019	! t0_kref+0x2068:   	restore	%i1, %i1, %o0
	.word	0xda20a000	! t0_kref+0x206c:   	st	%o5, [%g2]
	.word	0xae18000d	! t0_kref+0x2070:   	xor	%g0, %o5, %l7
	.word	0xae46bd68	! t0_kref+0x2074:   	addc	%i2, -0x298, %l7
	.word	0xa63b2469	! t0_kref+0x2078:   	xnor	%o4, 0x469, %l3
	.word	0x9de3bfa0	! t0_kref+0x207c:   	save	%sp, -0x60, %sp
	.word	0xb6be8018	! t0_kref+0x2080:   	xnorcc	%i2, %i0, %i3
	.word	0x95eebc9b	! t0_kref+0x2084:   	restore	%i2, -0x365, %o2
	.word	0x99a00128	! t0_kref+0x2088:   	fabss	%f8, %f12
	.word	0xacb3400d	! t0_kref+0x208c:   	orncc	%o5, %o5, %l6
	.word	0xd448a030	! t0_kref+0x2090:   	ldsb	[%g2 + 0x30], %o2
	.word	0xd410a010	! t0_kref+0x2094:   	lduh	[%g2 + 0x10], %o2
	.word	0x9226a192	! t0_kref+0x2098:   	sub	%i2, 0x192, %o1
	.word	0xa730201b	! t0_kref+0x209c:   	srl	%g0, 0x1b, %l3
	.word	0xac7b401a	! t0_kref+0x20a0:   	sdiv	%o5, %i2, %l6
	.word	0xac736465	! t0_kref+0x20a4:   	udiv	%o5, 0x465, %l6
	.word	0xa9b50a0e	! t0_kref+0x20a8:   	fpadd16	%f20, %f14, %f20
	.word	0xd43e2010	! t0_kref+0x20ac:   	std	%o2, [%i0 + 0x10]
	.word	0xae90000c	! t0_kref+0x20b0:   	orcc	%g0, %o4, %l7
	.word	0x9da00131	! t0_kref+0x20b4:   	fabss	%f17, %f14
	.word	0xea167ffa	! t0_kref+0x20b8:   	lduh	[%i1 - 6], %l5
	.word	0xaa7ea350	! t0_kref+0x20bc:   	sdiv	%i2, 0x350, %l5
	.word	0xab400000	! t0_kref+0x20c0:   	mov	%y, %l5
	.word	0xd51fbf28	! t0_kref+0x20c4:   	ldd	[%fp - 0xd8], %f10
	.word	0x91a0190b	! t0_kref+0x20c8:   	fitod	%f11, %f8
	.word	0xa5b34fad	! t0_kref+0x20cc:   	fors	%f13, %f13, %f18
	.word	0x11172229	! t0_kref+0x20d0:   	sethi	%hi(0x5c88a400), %o0
	.word	0xd496101b	! t0_kref+0x20d4:   	lduha	[%i0 + %i3]0x80, %o2
	.word	0xa3a0188c	! t0_kref+0x20d8:   	fitos	%f12, %f17
	.word	0xad332005	! t0_kref+0x20dc:   	srl	%o4, 0x5, %l6
	.word	0x9ba00134	! t0_kref+0x20e0:   	fabss	%f20, %f13
	.word	0x81ab4a2c	! t0_kref+0x20e4:   	fcmps	%fcc0, %f13, %f12
	.word	0xa3a000ad	! t0_kref+0x20e8:   	fnegs	%f13, %f17
	.word	0x22800003	! t0_kref+0x20ec:   	be,a	_kref+0x20f8
	.word	0x93b3430c	! t0_kref+0x20f0:   	alignaddr	%o5, %o4, %o1
	.word	0x91a88050	! t0_kref+0x20f4:   	fmovdlg	%fcc0, %f16, %f8
	.word	0xe1be1880	! t0_kref+0x20f8:   	stda	%f16, [%i0]0xc4
	.word	0xe1066018	! t0_kref+0x20fc:   	ld	[%i1 + 0x18], %f16
	.word	0xae733be8	! t0_kref+0x2100:   	udiv	%o4, -0x418, %l7
	.word	0xa8c36bc7	! t0_kref+0x2104:   	addccc	%o5, 0xbc7, %l4
	.word	0x92a03957	! t0_kref+0x2108:   	subcc	%g0, -0x6a9, %o1
	.word	0x9450001a	! t0_kref+0x210c:   	umul	%g0, %i2, %o2
	.word	0xaec6bbda	! t0_kref+0x2110:   	addccc	%i2, -0x426, %l7
	.word	0xa81b3b52	! t0_kref+0x2114:   	xor	%o4, -0x4ae, %l4
	.word	0xc030a032	! t0_kref+0x2118:   	clrh	[%g2 + 0x32]
	.word	0xc030a032	! t0_kref+0x211c:   	clrh	[%g2 + 0x32]
	.word	0xd1063ffc	! t0_kref+0x2120:   	ld	[%i0 - 4], %f8
	.word	0x2b020009	! t0_kref+0x2124:   	sethi	%hi(0x8002400), %l5
	.word	0xa88b4000	! t0_kref+0x2128:   	andcc	%o5, %g0, %l4
	.word	0x8d802e9c	! t0_kref+0x212c:   	mov	0xe9c, %fprs
	.word	0xc030a010	! t0_kref+0x2130:   	clrh	[%g2 + 0x10]
	.word	0xa893001a	! t0_kref+0x2134:   	orcc	%o4, %i2, %l4
	.word	0xa1b50c92	! t0_kref+0x2138:   	fandnot2	%f20, %f18, %f16
	.word	0xd216401b	! t0_kref+0x213c:   	lduh	[%i1 + %i3], %o1
	.word	0x24480006	! t0_kref+0x2140:   	ble,a,pt	%icc, _kref+0x2158
	.word	0xace6a131	! t0_kref+0x2144:   	subccc	%i2, 0x131, %l6
	.word	0xd0d6101b	! t0_kref+0x2148:   	ldsha	[%i0 + %i3]0x80, %o0
	.word	0x90a3001a	! t0_kref+0x214c:   	subcc	%o4, %i2, %o0
	.word	0x81de27f4	! t0_kref+0x2150:   	flush	%i0 + 0x7f4
	.word	0xa5a00532	! t0_kref+0x2154:   	fsqrts	%f18, %f18
	.word	0x90b02af6	! t0_kref+0x2158:   	orncc	%g0, 0xaf6, %o0
	.word	0xdda61000	! t0_kref+0x215c:   	sta	%f14, [%i0]0x80
	.word	0xec1e001d	! t0_kref+0x2160:   	ldd	[%i0 + %i5], %l6
	.word	0xa5a01930	! t0_kref+0x2164:   	fstod	%f16, %f18
	.word	0xe100a010	! t0_kref+0x2168:   	ld	[%g2 + 0x10], %f16
	.word	0x9da0004e	! t0_kref+0x216c:   	fmovd	%f14, %f14
	.word	0xc030a00a	! t0_kref+0x2170:   	clrh	[%g2 + 0xa]
	.word	0xa9b007ac	! t0_kref+0x2174:   	fpackfix	%f12, %f20
	.word	0xd720a010	! t0_kref+0x2178:   	st	%f11, [%g2 + 0x10]
	.word	0xa713400d	! t0_kref+0x217c:   	taddcctv	%o5, %o5, %l3
	.word	0xa1a0052a	! t0_kref+0x2180:   	fsqrts	%f10, %f16
	.word	0x9da0012b	! t0_kref+0x2184:   	fabss	%f11, %f14
	.word	0x81ac8aac	! t0_kref+0x2188:   	fcmpes	%fcc0, %f18, %f12
	.word	0x9ba248ab	! t0_kref+0x218c:   	fsubs	%f9, %f11, %f13
	.word	0xac93401a	! t0_kref+0x2190:   	orcc	%o5, %i2, %l6
	.word	0xa8030000	! t0_kref+0x2194:   	add	%o4, %g0, %l4
	.word	0xd0df5019	! t0_kref+0x2198:   	ldxa	[%i5 + %i1]0x80, %o0
	.word	0xd40e4000	! t0_kref+0x219c:   	ldub	[%i1], %o2
	.word	0x99a2894a	! t0_kref+0x21a0:   	fmuld	%f10, %f10, %f12
	.word	0xd830a022	! t0_kref+0x21a4:   	sth	%o4, [%g2 + 0x22]
	call	1f
	.empty
	.word	0xa1a548b1	! t0_kref+0x21ac:   	fsubs	%f21, %f17, %f16
	.word	0x95a309ce	! t0_kref+0x21b0:   	fdivd	%f12, %f14, %f10
	.word	0xa1a01915	! t0_kref+0x21b4:   	fitod	%f21, %f16
	.word	0xe6100018	! t0_kref+0x21b8:   	lduh	[%g0 + %i0], %l3
	.word	0x81868000	! t0_kref+0x21bc:   	wr	%i2, %g0, %y
	.word	0xe9062000	! t0_kref+0x21c0:   	ld	[%i0], %f20
1:	.word	0x25480008	! t0_kref+0x21c4:   	fblg,a,pt	%fcc0, _kref+0x21e4
	.word	0xa5a28950	! t0_kref+0x21c8:   	fmuld	%f10, %f16, %f18
	.word	0xab232bb3	! t0_kref+0x21cc:   	mulscc	%o4, 0xbb3, %l5
	.word	0xaaa37384	! t0_kref+0x21d0:   	subcc	%o5, -0xc7c, %l5
	.word	0xd41e7ff8	! t0_kref+0x21d4:   	ldd	[%i1 - 8], %o2
	.word	0xea40a028	! t0_kref+0x21d8:   	ldsw	[%g2 + 0x28], %l5
	.word	0xa9b20ded	! t0_kref+0x21dc:   	fnands	%f8, %f13, %f20
	.word	0xc0ae9018	! t0_kref+0x21e0:   	stba	%g0, [%i2 + %i0]0x80
	.word	0x99a00528	! t0_kref+0x21e4:   	fsqrts	%f8, %f12
	sethi	%hi(2f), %o7
	.word	0xe40be204	! t0_kref+0x21ec:   	ldub	[%o7 + 0x204], %l2
	.word	0xa41ca00c	! t0_kref+0x21f0:   	xor	%l2, 0xc, %l2
	.word	0xe42be204	! t0_kref+0x21f4:   	stb	%l2, [%o7 + 0x204]
	.word	0x81dbe204	! t0_kref+0x21f8:   	flush	%o7 + 0x204
	.word	0x81ac0aaa	! t0_kref+0x21fc:   	fcmpes	%fcc0, %f16, %f10
	.word	0xa1a249a9	! t0_kref+0x2200:   	fdivs	%f9, %f9, %f16
2:	.word	0x930b400d	! t0_kref+0x2204:   	tsubcc	%o5, %o5, %o1
	.word	0x2e800006	! t0_kref+0x2208:   	bvs,a	_kref+0x2220
	.word	0xa7400000	! t0_kref+0x220c:   	mov	%y, %l3
	.word	0x95418000	! t0_kref+0x2210:   	mov	%fprs, %o2
	.word	0xe13e401d	! t0_kref+0x2214:   	std	%f16, [%i1 + %i5]
	.word	0xa7b68240	! t0_kref+0x2218:   	array16	%i2, %g0, %l3
	.word	0xae9b69d0	! t0_kref+0x221c:   	xorcc	%o5, 0x9d0, %l7
	.word	0x81ac0a50	! t0_kref+0x2220:   	fcmpd	%fcc0, %f16, %f16
	.word	0x9da388c8	! t0_kref+0x2224:   	fsubd	%f14, %f8, %f14
	.word	0x91400000	! t0_kref+0x2228:   	mov	%y, %o0
	.word	0xee16c019	! t0_kref+0x222c:   	lduh	[%i3 + %i1], %l7
	.word	0x9fa00032	! t0_kref+0x2230:   	fmovs	%f18, %f15
	.word	0xe51f4019	! t0_kref+0x2234:   	ldd	[%i5 + %i1], %f18
	.word	0xa933400d	! t0_kref+0x2238:   	srl	%o5, %o5, %l4
	.word	0xd51e4000	! t0_kref+0x223c:   	ldd	[%i1], %f10
	.word	0xe786105c	! t0_kref+0x2240:   	lda	[%i0 + %i4]0x82, %f19
	.word	0x99a0052b	! t0_kref+0x2244:   	fsqrts	%f11, %f12
	.word	0xaeb6b5d6	! t0_kref+0x2248:   	orncc	%i2, -0xa2a, %l7
	.word	0x91b24ea0	! t0_kref+0x224c:   	fsrc1s	%f9, %f8
	.word	0xe4ee9018	! t0_kref+0x2250:   	ldstuba	[%i2 + %i0]0x80, %l2
	.word	0xd4162016	! t0_kref+0x2254:   	lduh	[%i0 + 0x16], %o2
	.word	0xe500a028	! t0_kref+0x2258:   	ld	[%g2 + 0x28], %f18
	.word	0xef68a080	! t0_kref+0x225c:   	prefetch	%g2 + 0x80, 23
	.word	0xa5a00130	! t0_kref+0x2260:   	fabss	%f16, %f18
	.word	0xa85ea045	! t0_kref+0x2264:   	smul	%i2, 0x45, %l4
	.word	0xe16e401a	! t0_kref+0x2268:   	prefetch	%i1 + %i2, 16
	.word	0xa8c6a746	! t0_kref+0x226c:   	addccc	%i2, 0x746, %l4
	.word	0x923b756d	! t0_kref+0x2270:   	xnor	%o5, -0xa93, %o1
	.word	0xa65b2b37	! t0_kref+0x2274:   	smul	%o4, 0xb37, %l3
	.word	0xae9b3b19	! t0_kref+0x2278:   	xorcc	%o4, -0x4e7, %l7
	.word	0xf430a01a	! t0_kref+0x227c:   	sth	%i2, [%g2 + 0x1a]
	.word	0x91b0000c	! t0_kref+0x2280:   	edge8	%g0, %o4, %o0
	.word	0x9da20834	! t0_kref+0x2284:   	fadds	%f8, %f20, %f14
	.word	0xaee328be	! t0_kref+0x2288:   	subccc	%o4, 0x8be, %l7
	.word	0x81ad0aab	! t0_kref+0x228c:   	fcmpes	%fcc0, %f20, %f11
	.word	0x99a0192b	! t0_kref+0x2290:   	fstod	%f11, %f12
	.word	0x9133401a	! t0_kref+0x2294:   	srl	%o5, %i2, %o0
	.word	0x22480006	! t0_kref+0x2298:   	be,a,pt	%icc, _kref+0x22b0
	.word	0xd91f4018	! t0_kref+0x229c:   	ldd	[%i5 + %i0], %f12
	.word	0xa5a000b2	! t0_kref+0x22a0:   	fnegs	%f18, %f18
	.word	0xabb40f6e	! t0_kref+0x22a4:   	fornot1s	%f16, %f14, %f21
	.word	0xadb6803a	! t0_kref+0x22a8:   	edge8n	%i2, %i2, %l6
	.word	0xa89b2c85	! t0_kref+0x22ac:   	xorcc	%o4, 0xc85, %l4
	.word	0xa8034000	! t0_kref+0x22b0:   	add	%o5, %g0, %l4
	.word	0x95b68280	! t0_kref+0x22b4:   	array32	%i2, %g0, %o2
	.word	0xa1a28952	! t0_kref+0x22b8:   	fmuld	%f10, %f18, %f16
	.word	0xd820a020	! t0_kref+0x22bc:   	st	%o4, [%g2 + 0x20]
	.word	0xa7a01a2a	! t0_kref+0x22c0:   	fstoi	%f10, %f19
	.word	0xaba0052a	! t0_kref+0x22c4:   	fsqrts	%f10, %f21
	.word	0xd41e6000	! t0_kref+0x22c8:   	ldd	[%i1], %o2
	.word	0xacd83d77	! t0_kref+0x22cc:   	smulcc	%g0, -0x289, %l6
	.word	0xe07e001c	! t0_kref+0x22d0:   	swap	[%i0 + %i4], %l0
	.word	0xea562006	! t0_kref+0x22d4:   	ldsh	[%i0 + 6], %l5
	.word	0xee8e101a	! t0_kref+0x22d8:   	lduba	[%i0 + %i2]0x80, %l7
	.word	0xaa1b001a	! t0_kref+0x22dc:   	xor	%o4, %i2, %l5
	.word	0xc568a042	! t0_kref+0x22e0:   	prefetch	%g2 + 0x42, 2
	.word	0x9bb30f70	! t0_kref+0x22e4:   	fornot1s	%f12, %f16, %f13
	.word	0xa1b00fe0	! t0_kref+0x22e8:   	fones	%f16
	.word	0x90936380	! t0_kref+0x22ec:   	orcc	%o5, 0x380, %o0
	.word	0x92fb6baf	! t0_kref+0x22f0:   	sdivcc	%o5, 0xbaf, %o1
	.word	0x81aa4ab2	! t0_kref+0x22f4:   	fcmpes	%fcc0, %f9, %f18
	.word	0xaad68000	! t0_kref+0x22f8:   	umulcc	%i2, %g0, %l5
	.word	0x27250ba6	! t0_kref+0x22fc:   	sethi	%hi(0x942e9800), %l3
	.word	0xe6063ff8	! t0_kref+0x2300:   	ld	[%i0 - 8], %l3
	.word	0xa5a01a35	! t0_kref+0x2304:   	fstoi	%f21, %f18
	.word	0xd450a018	! t0_kref+0x2308:   	ldsh	[%g2 + 0x18], %o2
	call	SYM(t0_subr2)
	.word	0xc020a000	! t0_kref+0x2310:   	clr	[%g2]
	.word	0x8143e040	! t0_kref+0x2314:   	membar	0x40
	.word	0xaa3373f5	! t0_kref+0x2318:   	orn	%o5, -0xc0b, %l5
	.word	0x3c480001	! t0_kref+0x231c:   	bpos,a,pt	%icc, _kref+0x2320
	.word	0x99a489ad	! t0_kref+0x2320:   	fdivs	%f18, %f13, %f12
	.word	0xd920a020	! t0_kref+0x2324:   	st	%f12, [%g2 + 0x20]
	.word	0x93400000	! t0_kref+0x2328:   	mov	%y, %o1
	.word	0xaa5ea828	! t0_kref+0x232c:   	smul	%i2, 0x828, %l5
	.word	0x32480003	! t0_kref+0x2330:   	bne,a,pt	%icc, _kref+0x233c
	.word	0xaa3b000c	! t0_kref+0x2334:   	xnor	%o4, %o4, %l5
	.word	0x81ab8a50	! t0_kref+0x2338:   	fcmpd	%fcc0, %f14, %f16
	.word	0x91a00529	! t0_kref+0x233c:   	fsqrts	%f9, %f8
	.word	0x81580000	! t0_kref+0x2340:   	flushw
	.word	0x94603aeb	! t0_kref+0x2344:   	subc	%g0, -0x515, %o2
	.word	0x97a28829	! t0_kref+0x2348:   	fadds	%f10, %f9, %f11
	.word	0xd7060000	! t0_kref+0x234c:   	ld	[%i0], %f11
	.word	0x92f6bd65	! t0_kref+0x2350:   	udivcc	%i2, -0x29b, %o1
	.word	0xee80105c	! t0_kref+0x2354:   	lda	[%g0 + %i4]0x82, %l7
	.word	0xd03e3ff0	! t0_kref+0x2358:   	std	%o0, [%i0 - 0x10]
	.word	0x99b48990	! t0_kref+0x235c:   	bshuffle	%f18, %f16, %f12
	.word	0xd0060000	! t0_kref+0x2360:   	ld	[%i0], %o0
	.word	0x9fc00004	! t0_kref+0x2364:   	call	%g0 + %g4
	.word	0xc12e401c	! t0_kref+0x2368:   	st	%fsr, [%i1 + %i4]
	.word	0xaba01a48	! t0_kref+0x236c:   	fdtoi	%f8, %f21
	.word	0xd4162012	! t0_kref+0x2370:   	lduh	[%i0 + 0x12], %o2
	.word	0xf56e3fe0	! t0_kref+0x2374:   	prefetch	%i0 - 0x20, 26
	.word	0x91a00533	! t0_kref+0x2378:   	fsqrts	%f19, %f8
	.word	0x81dd6f17	! t0_kref+0x237c:   	flush	%l5 + 0xf17
	.word	0x26480006	! t0_kref+0x2380:   	bl,a,pt	%icc, _kref+0x2398
	.word	0x99a00130	! t0_kref+0x2384:   	fabss	%f16, %f12
	.word	0xa7b50452	! t0_kref+0x2388:   	fcmpne16	%f20, %f18, %l3
	.word	0xac2b000c	! t0_kref+0x238c:   	andn	%o4, %o4, %l6
	.word	0xaab6aa9d	! t0_kref+0x2390:   	orncc	%i2, 0xa9d, %l5
	.word	0x9da00031	! t0_kref+0x2394:   	fmovs	%f17, %f14
	.word	0x81da334a	! t0_kref+0x2398:   	flush	%o0 - 0xcb6
	.word	0xd91e6018	! t0_kref+0x239c:   	ldd	[%i1 + 0x18], %f12
	.word	0xd4801019	! t0_kref+0x23a0:   	lda	[%g0 + %i1]0x80, %o2
	.word	0x9076a284	! t0_kref+0x23a4:   	udiv	%i2, 0x284, %o0
	.word	0x97b00cec	! t0_kref+0x23a8:   	fnot2s	%f12, %f11
	.word	0x8143e040	! t0_kref+0x23ac:   	membar	0x40
	.word	0xabb30200	! t0_kref+0x23b0:   	array8	%o4, %g0, %l5
	.word	0xfd6e2010	! t0_kref+0x23b4:   	prefetch	%i0 + 0x10, 30
	.word	0xec16c018	! t0_kref+0x23b8:   	lduh	[%i3 + %i0], %l6
	.word	0xa9400000	! t0_kref+0x23bc:   	mov	%y, %l4
	.word	0x81b01025	! t0_kref+0x23c0:   	siam	0x5
	.word	0x81acca2a	! t0_kref+0x23c4:   	fcmps	%fcc0, %f19, %f10
	.word	0xd19f5a58	! t0_kref+0x23c8:   	ldda	[%i5 + %i0]0xd2, %f8
	.word	0xe1be188c	! t0_kref+0x23cc:   	stda	%f16, [%i0 + %o4]0xc4
	.word	0x2d480006	! t0_kref+0x23d0:   	fbg,a,pt	%fcc0, _kref+0x23e8
	.word	0xa1a3894c	! t0_kref+0x23d4:   	fmuld	%f14, %f12, %f16
	.word	0xa7b0002d	! t0_kref+0x23d8:   	edge8n	%g0, %o5, %l3
	.word	0xaa1e8000	! t0_kref+0x23dc:   	xor	%i2, %g0, %l5
	.word	0xa1a01a4e	! t0_kref+0x23e0:   	fdtoi	%f14, %f16
	.word	0x9bb50fae	! t0_kref+0x23e4:   	fors	%f20, %f14, %f13
	.word	0xa89b400c	! t0_kref+0x23e8:   	xorcc	%o5, %o4, %l4
	.word	0xa1a2082b	! t0_kref+0x23ec:   	fadds	%f8, %f11, %f16
	.word	0xecc01019	! t0_kref+0x23f0:   	ldswa	[%g0 + %i1]0x80, %l6
	.word	0xa1a0052b	! t0_kref+0x23f4:   	fsqrts	%f11, %f16
	.word	0xac5ebdf6	! t0_kref+0x23f8:   	smul	%i2, -0x20a, %l6
	.word	0xe6871018	! t0_kref+0x23fc:   	lda	[%i4 + %i0]0x80, %l3
	.word	0x91a00129	! t0_kref+0x2400:   	fabss	%f9, %f8
	.word	0xd9064000	! t0_kref+0x2404:   	ld	[%i1], %f12
	.word	0x8d868000	! t0_kref+0x2408:   	wr	%i2, %g0, %fprs
	.word	0xaa933eb2	! t0_kref+0x240c:   	orcc	%o4, -0x14e, %l5
	.word	0x9da2894a	! t0_kref+0x2410:   	fmuld	%f10, %f10, %f14
	.word	0x925b400d	! t0_kref+0x2414:   	smul	%o5, %o5, %o1
	.word	0xd0070018	! t0_kref+0x2418:   	ld	[%i4 + %i0], %o0
	.word	0xa1b3890e	! t0_kref+0x241c:   	faligndata	%f14, %f14, %f16
	.word	0x9fc00004	! t0_kref+0x2420:   	call	%g0 + %g4
	.word	0x90602b06	! t0_kref+0x2424:   	subc	%g0, 0xb06, %o0
	.word	0xa7a0052b	! t0_kref+0x2428:   	fsqrts	%f11, %f19
	.word	0xe610a002	! t0_kref+0x242c:   	lduh	[%g2 + 2], %l3
	.word	0xee48a000	! t0_kref+0x2430:   	ldsb	[%g2], %l7
	.word	0xa3a0052e	! t0_kref+0x2434:   	fsqrts	%f14, %f17
	.word	0x95b48e80	! t0_kref+0x2438:   	fsrc1	%f18, %f10
	.word	0x8143e040	! t0_kref+0x243c:   	membar	0x40
	.word	0xa710001a	! t0_kref+0x2440:   	taddcctv	%g0, %i2, %l3
	.word	0xa1a48852	! t0_kref+0x2444:   	faddd	%f18, %f18, %f16
	.word	0x9fc00004	! t0_kref+0x2448:   	call	%g0 + %g4
	.word	0xad36a012	! t0_kref+0x244c:   	srl	%i2, 0x12, %l6
	.word	0xc030a010	! t0_kref+0x2450:   	clrh	[%g2 + 0x10]
	.word	0x9296800c	! t0_kref+0x2454:   	orcc	%i2, %o4, %o1
	.word	0xe700a008	! t0_kref+0x2458:   	ld	[%g2 + 8], %f19
	.word	0x81ab4ab3	! t0_kref+0x245c:   	fcmpes	%fcc0, %f13, %f19
	.word	0xc02e2004	! t0_kref+0x2460:   	clrb	[%i0 + 4]
	.word	0xd4062010	! t0_kref+0x2464:   	ld	[%i0 + 0x10], %o2
	.word	0xad400000	! t0_kref+0x2468:   	mov	%y, %l6
	.word	0x30800004	! t0_kref+0x246c:   	ba,a	_kref+0x247c
	.word	0x81de0001	! t0_kref+0x2470:   	flush	%i0 + %g1
	.word	0x94c374b7	! t0_kref+0x2474:   	addccc	%o5, -0xb49, %o2
	.word	0xa5a01914	! t0_kref+0x2478:   	fitod	%f20, %f18
	.word	0xab1b7b88	! t0_kref+0x247c:   	tsubcctv	%o5, -0x478, %l5
	sethi	%hi(2f), %o7
	.word	0xe40be0d0	! t0_kref+0x2484:   	ldub	[%o7 + 0xd0], %l2
	.word	0xa41ca00c	! t0_kref+0x2488:   	xor	%l2, 0xc, %l2
	.word	0xe42be0d0	! t0_kref+0x248c:   	stb	%l2, [%o7 + 0xd0]
	.word	0x81dbe0d0	! t0_kref+0x2490:   	flush	%o7 + 0xd0
	.word	0x99a00028	! t0_kref+0x2494:   	fmovs	%f8, %f12
	.word	0xaa032f7e	! t0_kref+0x2498:   	add	%o4, 0xf7e, %l5
	.word	0xa1b009b4	! t0_kref+0x249c:   	fexpand	%f20, %f16
	.word	0x9db28d40	! t0_kref+0x24a0:   	fnot1	%f10, %f14
	.word	0xf36e401a	! t0_kref+0x24a4:   	prefetch	%i1 + %i2, 25
	.word	0xa92e800c	! t0_kref+0x24a8:   	sll	%i2, %o4, %l4
	.word	0x90db400d	! t0_kref+0x24ac:   	smulcc	%o5, %o5, %o0
	.word	0x9ba00128	! t0_kref+0x24b0:   	fabss	%f8, %f13
	.word	0xe91fbf48	! t0_kref+0x24b4:   	ldd	[%fp - 0xb8], %f20
	.word	0xaba0002c	! t0_kref+0x24b8:   	fmovs	%f12, %f21
	.word	0x81ac8aca	! t0_kref+0x24bc:   	fcmped	%fcc0, %f18, %f10
	.word	0xaac3400c	! t0_kref+0x24c0:   	addccc	%o5, %o4, %l5
	.word	0xf420a000	! t0_kref+0x24c4:   	st	%i2, [%g2]
	.word	0xd2166012	! t0_kref+0x24c8:   	lduh	[%i1 + 0x12], %o1
	.word	0xee000019	! t0_kref+0x24cc:   	ld	[%g0 + %i1], %l7
2:	.word	0x94032c45	! t0_kref+0x24d0:   	add	%o4, 0xc45, %o2
	.word	0x36480008	! t0_kref+0x24d4:   	bge,a,pt	%icc, _kref+0x24f4
	.word	0xacab000d	! t0_kref+0x24d8:   	andncc	%o4, %o5, %l6
	.word	0xaade801a	! t0_kref+0x24dc:   	smulcc	%i2, %i2, %l5
	.word	0x92903b6c	! t0_kref+0x24e0:   	orcc	%g0, -0x494, %o1
	.word	0xe76e001d	! t0_kref+0x24e4:   	prefetch	%i0 + %i5, 19
	.word	0xa91034f6	! t0_kref+0x24e8:   	taddcctv	%g0, -0xb0a, %l4
	.word	0xaec6801a	! t0_kref+0x24ec:   	addccc	%i2, %i2, %l7
	.word	0x3f480002	! t0_kref+0x24f0:   	fbo,a,pt	%fcc0, _kref+0x24f8
	.word	0xeed6d040	! t0_kref+0x24f4:   	ldsha	[%i3]0x82, %l7
	.word	0x81d9400f	! t0_kref+0x24f8:   	flush	%g5 + %o7
	.word	0x81aa0acc	! t0_kref+0x24fc:   	fcmped	%fcc0, %f8, %f12
	.word	0xd51fbde8	! t0_kref+0x2500:   	ldd	[%fp - 0x218], %f10
	.word	0x9db48e54	! t0_kref+0x2504:   	fxnor	%f18, %f20, %f14
!	.word	0x2b4f26bb	! t0_kref+0x2508:   	fbug,a,pt	%fcc0, SYM(t0_subr1)
	   	fbug,a,pt	%fcc0, SYM(t0_subr1)
	.word	0x9f414000	! t0_kref+0x250c:   	mov	%pc, %o7
	.word	0xee7e7fe8	! t0_kref+0x2510:   	swap	[%i1 - 0x18], %l7
	.word	0x953b000c	! t0_kref+0x2514:   	sra	%o4, %o4, %o2
	.word	0xad237220	! t0_kref+0x2518:   	mulscc	%o5, -0xde0, %l6
	.word	0x3f480007	! t0_kref+0x251c:   	fbo,a,pt	%fcc0, _kref+0x2538
	.word	0xd208a02a	! t0_kref+0x2520:   	ldub	[%g2 + 0x2a], %o1
	.word	0xa744c000	! t0_kref+0x2524:   	mov	%gsr, %l3
	.word	0xa8930000	! t0_kref+0x2528:   	orcc	%o4, %g0, %l4
	.word	0xf96e001a	! t0_kref+0x252c:   	prefetch	%i0 + %i2, 28
	call	SYM(t0_subr1)
	.word	0xe4ff1018	! t0_kref+0x2534:   	swapa	[%i4 + %i0]0x80, %l2
	.word	0x94d8000c	! t0_kref+0x2538:   	smulcc	%g0, %o4, %o2
	.word	0xd26e001a	! t0_kref+0x253c:   	ldstub	[%i0 + %i2], %o1
	.word	0xa70b39d1	! t0_kref+0x2540:   	tsubcc	%o4, -0x62f, %l3
	.word	0x81868000	! t0_kref+0x2544:   	wr	%i2, %g0, %y
	.word	0xac9b000c	! t0_kref+0x2548:   	xorcc	%o4, %o4, %l6
	.word	0xa9b0031a	! t0_kref+0x254c:   	alignaddr	%g0, %i2, %l4
	.word	0x95b007ae	! t0_kref+0x2550:   	fpackfix	%f14, %f10
	.word	0xec08a03b	! t0_kref+0x2554:   	ldub	[%g2 + 0x3b], %l6
	.word	0xa3a44829	! t0_kref+0x2558:   	fadds	%f17, %f9, %f17
	.word	0xae003ffa	! t0_kref+0x255c:   	add	%g0, -0x6, %l7
	.word	0x92732444	! t0_kref+0x2560:   	udiv	%o4, 0x444, %o1
	.word	0x93400000	! t0_kref+0x2564:   	mov	%y, %o1
	.word	0xd8300018	! t0_kref+0x2568:   	sth	%o4, [%g0 + %i0]
	.word	0x94a33bb0	! t0_kref+0x256c:   	subcc	%o4, -0x450, %o2
	.word	0xac637c9e	! t0_kref+0x2570:   	subc	%o5, -0x362, %l6
	.word	0x9278000c	! t0_kref+0x2574:   	sdiv	%g0, %o4, %o1
	.word	0xae76800d	! t0_kref+0x2578:   	udiv	%i2, %o5, %l7
	.word	0xee00a028	! t0_kref+0x257c:   	ld	[%g2 + 0x28], %l7
	.word	0xec166016	! t0_kref+0x2580:   	lduh	[%i1 + 0x16], %l6
	.word	0xa7b00280	! t0_kref+0x2584:   	array32	%g0, %g0, %l3
	.word	0xa9b28488	! t0_kref+0x2588:   	fcmple32	%f10, %f8, %l4
	.word	0xd41e3ff8	! t0_kref+0x258c:   	ldd	[%i0 - 8], %o2
	.word	0xe51e001d	! t0_kref+0x2590:   	ldd	[%i0 + %i5], %f18
	.word	0xa606a6f2	! t0_kref+0x2594:   	add	%i2, 0x6f2, %l3
	.word	0x9338000c	! t0_kref+0x2598:   	sra	%g0, %o4, %o1
	.word	0xd1be501d	! t0_kref+0x259c:   	stda	%f8, [%i1 + %i5]0x80
	.word	0xeedf5018	! t0_kref+0x25a0:   	ldxa	[%i5 + %i0]0x80, %l7
	.word	0x94f32a8f	! t0_kref+0x25a4:   	udivcc	%o4, 0xa8f, %o2
	.word	0x92633da7	! t0_kref+0x25a8:   	subc	%o4, -0x259, %o1
	.word	0xc368a004	! t0_kref+0x25ac:   	prefetch	%g2 + 4, 1
	.word	0xdaf01019	! t0_kref+0x25b0:   	stxa	%o5, [%g0 + %i1]0x80
	.word	0xc0766010	! t0_kref+0x25b4:   	stx	%g0, [%i1 + 0x10]
	.word	0xadb6805a	! t0_kref+0x25b8:   	edge8l	%i2, %i2, %l6
	.word	0x903e800c	! t0_kref+0x25bc:   	xnor	%i2, %o4, %o0
	.word	0x2c800002	! t0_kref+0x25c0:   	bneg,a	_kref+0x25c8
	.word	0xd048001a	! t0_kref+0x25c4:   	ldsb	[%g0 + %i2], %o0
	.word	0x35480008	! t0_kref+0x25c8:   	fbue,a,pt	%fcc0, _kref+0x25e8
	.word	0xd82e2000	! t0_kref+0x25cc:   	stb	%o4, [%i0]
	.word	0xe800a000	! t0_kref+0x25d0:   	ld	[%g2], %l4
	.word	0xa6a360a5	! t0_kref+0x25d4:   	subcc	%o5, 0xa5, %l3
	.word	0xdd00a008	! t0_kref+0x25d8:   	ld	[%g2 + 8], %f14
	.word	0xee7e600c	! t0_kref+0x25dc:   	swap	[%i1 + 0xc], %l7
	.word	0x81abcab3	! t0_kref+0x25e0:   	fcmpes	%fcc0, %f15, %f19
	.word	0xe41f4019	! t0_kref+0x25e4:   	ldd	[%i5 + %i1], %l2
	.word	0xe19e105d	! t0_kref+0x25e8:   	ldda	[%i0 + %i5]0x82, %f16
	.word	0xaa16800c	! t0_kref+0x25ec:   	or	%i2, %o4, %l5
	.word	0xa9b00340	! t0_kref+0x25f0:   	alignaddrl	%g0, %g0, %l4
	.word	0xda2e201a	! t0_kref+0x25f4:   	stb	%o5, [%i0 + 0x1a]
	.word	0xaca32056	! t0_kref+0x25f8:   	subcc	%o4, 0x56, %l6
	.word	0x81ddeeca	! t0_kref+0x25fc:   	flush	%l7 + 0xeca
	.word	0x9da00134	! t0_kref+0x2600:   	fabss	%f20, %f14
	.word	0xa8db2d0b	! t0_kref+0x2604:   	smulcc	%o4, 0xd0b, %l4
	.word	0xd100a018	! t0_kref+0x2608:   	ld	[%g2 + 0x18], %f8
	.word	0x81ad4a31	! t0_kref+0x260c:   	fcmps	%fcc0, %f21, %f17
	.word	0x9db48634	! t0_kref+0x2610:   	fmul8x16	%f18, %f20, %f14
	.word	0xdd263ffc	! t0_kref+0x2614:   	st	%f14, [%i0 - 4]
	.word	0x9ba389ad	! t0_kref+0x2618:   	fdivs	%f14, %f13, %f13
	.word	0x95b306cc	! t0_kref+0x261c:   	fmul8sux16	%f12, %f12, %f10
	.word	0xfb6e001d	! t0_kref+0x2620:   	prefetch	%i0 + %i5, 29
	.word	0xe168a100	! t0_kref+0x2624:   	prefetch	%g2 + 0x100, 16
	.word	0x99b406aa	! t0_kref+0x2628:   	fmul8x16al	%f16, %f10, %f12
	.word	0x91ab8052	! t0_kref+0x262c:   	fmovdule	%fcc0, %f18, %f8
	.word	0xc12e001c	! t0_kref+0x2630:   	st	%fsr, [%i0 + %i4]
	.word	0xa89b400d	! t0_kref+0x2634:   	xorcc	%o5, %o5, %l4
	.word	0xdb00a008	! t0_kref+0x2638:   	ld	[%g2 + 8], %f13
	.word	0xd700a000	! t0_kref+0x263c:   	ld	[%g2], %f11
	.word	0x9216b42f	! t0_kref+0x2640:   	or	%i2, -0xbd1, %o1
	.word	0x909b4000	! t0_kref+0x2644:   	xorcc	%o5, %g0, %o0
	.word	0x9da0052e	! t0_kref+0x2648:   	fsqrts	%f14, %f14
	.word	0xda6e0000	! t0_kref+0x264c:   	ldstub	[%i0], %o5
	.word	0xa9400000	! t0_kref+0x2650:   	mov	%y, %l4
	.word	0x95a449aa	! t0_kref+0x2654:   	fdivs	%f17, %f10, %f10
	.word	0x90fb7425	! t0_kref+0x2658:   	sdivcc	%o5, -0xbdb, %o0
	.word	0xe968a047	! t0_kref+0x265c:   	prefetch	%g2 + 0x47, 20
	.word	0xda7e7fec	! t0_kref+0x2660:   	swap	[%i1 - 0x14], %o5
	.word	0x878020f0	! t0_kref+0x2664:   	mov	0xf0, %asi
	.word	0xae83401a	! t0_kref+0x2668:   	addcc	%o5, %i2, %l7
	.word	0xa9a01913	! t0_kref+0x266c:   	fitod	%f19, %f20
	.word	0xdf26600c	! t0_kref+0x2670:   	st	%f15, [%i1 + 0xc]
	.word	0xd2ce501a	! t0_kref+0x2674:   	ldsba	[%i1 + %i2]0x80, %o1
	.word	0x95b40494	! t0_kref+0x2678:   	fcmple32	%f16, %f20, %o2
	.word	0xee06200c	! t0_kref+0x267c:   	ld	[%i0 + 0xc], %l7
	.word	0x95a01912	! t0_kref+0x2680:   	fitod	%f18, %f10
	.word	0x81ddc01f	! t0_kref+0x2684:   	flush	%l7 + %i7
	.word	0xa1a308ce	! t0_kref+0x2688:   	fsubd	%f12, %f14, %f16
	.word	0xafb2854c	! t0_kref+0x268c:   	fcmpeq16	%f10, %f12, %l7
	.word	0xadb3002c	! t0_kref+0x2690:   	edge8n	%o4, %o4, %l6
	.word	0xe100a020	! t0_kref+0x2694:   	ld	[%g2 + 0x20], %f16
	.word	0x81ac8a34	! t0_kref+0x2698:   	fcmps	%fcc0, %f18, %f20
	.word	0x9fc00004	! t0_kref+0x269c:   	call	%g0 + %g4
	.word	0x92180000	! t0_kref+0x26a0:   	xor	%g0, %g0, %o1
	.word	0xd87e0000	! t0_kref+0x26a4:   	swap	[%i0], %o4
	.word	0xec96d018	! t0_kref+0x26a8:   	lduha	[%i3 + %i0]0x80, %l6
	.word	0xe900a028	! t0_kref+0x26ac:   	ld	[%g2 + 0x28], %f20
	.word	0xabb00768	! t0_kref+0x26b0:   	fpack16	%f8, %f21
	.word	0xd1000018	! t0_kref+0x26b4:   	ld	[%g0 + %i0], %f8
	.word	0xeadf5019	! t0_kref+0x26b8:   	ldxa	[%i5 + %i1]0x80, %l5
	.word	0xae3b7c81	! t0_kref+0x26bc:   	xnor	%o5, -0x37f, %l7
	.word	0x85832f2f	! t0_kref+0x26c0:   	wr	%o4, 0xf2f, %ccr
	.word	0x9fb54ea0	! t0_kref+0x26c4:   	fsrc1s	%f21, %f15
	.word	0x91a00035	! t0_kref+0x26c8:   	fmovs	%f21, %f8
	.word	0x9286b57e	! t0_kref+0x26cc:   	addcc	%i2, -0xa82, %o1
	.word	0x95a388d4	! t0_kref+0x26d0:   	fsubd	%f14, %f20, %f10
	.word	0x92a6801a	! t0_kref+0x26d4:   	subcc	%i2, %i2, %o1
	.word	0xa8b3401a	! t0_kref+0x26d8:   	orncc	%o5, %i2, %l4
	.word	0x97b38ea0	! t0_kref+0x26dc:   	fsrc1s	%f14, %f11
	.word	0xa5a308d4	! t0_kref+0x26e0:   	fsubd	%f12, %f20, %f18
	.word	0xe120a000	! t0_kref+0x26e4:   	st	%f16, [%g2]
	.word	0xeb20a028	! t0_kref+0x26e8:   	st	%f21, [%g2 + 0x28]
	.word	0xafb00280	! t0_kref+0x26ec:   	array32	%g0, %g0, %l7
	.word	0x81ac0a31	! t0_kref+0x26f0:   	fcmps	%fcc0, %f16, %f17
	.word	0xd09e501d	! t0_kref+0x26f4:   	ldda	[%i1 + %i5]0x80, %o0
	.word	0xd43e401d	! t0_kref+0x26f8:   	std	%o2, [%i1 + %i5]
	.word	0xe648a010	! t0_kref+0x26fc:   	ldsb	[%g2 + 0x10], %l3
	.word	0xeb68a04c	! t0_kref+0x2700:   	prefetch	%g2 + 0x4c, 21
	.word	0xd580105c	! t0_kref+0x2704:   	lda	[%g0 + %i4]0x82, %f10
	.word	0xa933600b	! t0_kref+0x2708:   	srl	%o5, 0xb, %l4
	.word	0x95b2862e	! t0_kref+0x270c:   	fmul8x16	%f10, %f14, %f10
	.word	0x95400000	! t0_kref+0x2710:   	mov	%y, %o2
	.word	0x9de3bfa0	! t0_kref+0x2714:   	save	%sp, -0x60, %sp
	.word	0xb90f6936	! t0_kref+0x2718:   	tsubcc	%i5, 0x936, %i4
	.word	0x95ee801d	! t0_kref+0x271c:   	restore	%i2, %i5, %o2
	.word	0xa7b3016d	! t0_kref+0x2720:   	edge32ln	%o4, %o5, %l3
	.word	0xabb68000	! t0_kref+0x2724:   	edge8	%i2, %g0, %l5
	.word	0xa3a2c9ae	! t0_kref+0x2728:   	fdivs	%f11, %f14, %f17
	.word	0xa9400000	! t0_kref+0x272c:   	mov	%y, %l4
	.word	0x93b34300	! t0_kref+0x2730:   	alignaddr	%o5, %g0, %o1
	.word	0x91400000	! t0_kref+0x2734:   	mov	%y, %o0
	.word	0xd440a020	! t0_kref+0x2738:   	ldsw	[%g2 + 0x20], %o2
	.word	0xd43f4019	! t0_kref+0x273c:   	std	%o2, [%i5 + %i1]
	.word	0xeb68a00e	! t0_kref+0x2740:   	prefetch	%g2 + 0xe, 21
	.word	0x9098001a	! t0_kref+0x2744:   	xorcc	%g0, %i2, %o0
	.word	0xaca021a8	! t0_kref+0x2748:   	subcc	%g0, 0x1a8, %l6
	.word	0xe56e401c	! t0_kref+0x274c:   	prefetch	%i1 + %i4, 18
	.word	0xaaf3401a	! t0_kref+0x2750:   	udivcc	%o5, %i2, %l5
	.word	0x2724d96c	! t0_kref+0x2754:   	sethi	%hi(0x9365b000), %l3
	.word	0x95a2c9b3	! t0_kref+0x2758:   	fdivs	%f11, %f19, %f10
	.word	0xa9b0014d	! t0_kref+0x275c:   	edge32l	%g0, %o5, %l4
	.word	0xa8b0001a	! t0_kref+0x2760:   	orncc	%g0, %i2, %l4
	.word	0x9db30dce	! t0_kref+0x2764:   	fnand	%f12, %f14, %f14
	.word	0x903b340c	! t0_kref+0x2768:   	xnor	%o4, -0xbf4, %o0
	.word	0x99a4894e	! t0_kref+0x276c:   	fmuld	%f18, %f14, %f12
	.word	0x20800007	! t0_kref+0x2770:   	bn,a	_kref+0x278c
	.word	0x90a334a7	! t0_kref+0x2774:   	subcc	%o4, -0xb59, %o0
	.word	0x943b7c59	! t0_kref+0x2778:   	xnor	%o5, -0x3a7, %o2
	.word	0xd836c019	! t0_kref+0x277c:   	sth	%o4, [%i3 + %i1]
	.word	0xe320a028	! t0_kref+0x2780:   	st	%f17, [%g2 + 0x28]
	.word	0xc0ae501a	! t0_kref+0x2784:   	stba	%g0, [%i1 + %i2]0x80
	.word	0xa7b68240	! t0_kref+0x2788:   	array16	%i2, %g0, %l3
	.word	0xe8167fe4	! t0_kref+0x278c:   	lduh	[%i1 - 0x1c], %l4
	.word	0xda364000	! t0_kref+0x2790:   	sth	%o5, [%i1]
	.word	0xda30a030	! t0_kref+0x2794:   	sth	%o5, [%g2 + 0x30]
	.word	0xa1b50ecc	! t0_kref+0x2798:   	fornot2	%f20, %f12, %f16
	.word	0xa1a01a4c	! t0_kref+0x279c:   	fdtoi	%f12, %f16
	.word	0x99a489d2	! t0_kref+0x27a0:   	fdivd	%f18, %f18, %f12
	.word	0x91b00f08	! t0_kref+0x27a4:   	fsrc2	%f8, %f8
	.word	0xe11e2018	! t0_kref+0x27a8:   	ldd	[%i0 + 0x18], %f16
	.word	0xa5a40848	! t0_kref+0x27ac:   	faddd	%f16, %f8, %f18
	.word	0x91b68000	! t0_kref+0x27b0:   	edge8	%i2, %g0, %o0
	.word	0xd900a020	! t0_kref+0x27b4:   	ld	[%g2 + 0x20], %f12
	.word	0xa7b40df0	! t0_kref+0x27b8:   	fnands	%f16, %f16, %f19
	.word	0x3f480001	! t0_kref+0x27bc:   	fbo,a,pt	%fcc0, _kref+0x27c0
	.word	0x94d832c1	! t0_kref+0x27c0:   	smulcc	%g0, -0xd3f, %o2
	.word	0xd1be9a18	! t0_kref+0x27c4:   	stda	%f8, [%i2 + %i0]0xd0
	.word	0xac90000d	! t0_kref+0x27c8:   	orcc	%g0, %o5, %l6
	.word	0xf207bfe0	! t0_kref+0x27cc:   	ld	[%fp - 0x20], %i1
	.word	0xd500a038	! t0_kref+0x27d0:   	ld	[%g2 + 0x38], %f10
	.word	0xa1a508a8	! t0_kref+0x27d4:   	fsubs	%f20, %f8, %f16
	.word	0xd1bf5a59	! t0_kref+0x27d8:   	stda	%f8, [%i5 + %i1]0xd2
	.word	0x923b0000	! t0_kref+0x27dc:   	not	%o4, %o1
	.word	0x20480005	! t0_kref+0x27e0:   	bn,a,pt	%icc, _kref+0x27f4
	.word	0xec50a018	! t0_kref+0x27e4:   	ldsh	[%g2 + 0x18], %l6
	.word	0xd08e501a	! t0_kref+0x27e8:   	lduba	[%i1 + %i2]0x80, %o0
	.word	0x91b48ea0	! t0_kref+0x27ec:   	fsrc1s	%f18, %f8
	.word	0xa6d8001a	! t0_kref+0x27f0:   	smulcc	%g0, %i2, %l3
	.word	0x2b21df5b	! t0_kref+0x27f4:   	sethi	%hi(0x877d6c00), %l5
	.word	0x81ab0aca	! t0_kref+0x27f8:   	fcmped	%fcc0, %f12, %f10
	.word	0xec400019	! t0_kref+0x27fc:   	ldsw	[%g0 + %i1], %l6
	.word	0xa5b48e14	! t0_kref+0x2800:   	fand	%f18, %f20, %f18
	.word	0xdf00a018	! t0_kref+0x2804:   	ld	[%g2 + 0x18], %f15
	.word	0x3f480003	! t0_kref+0x2808:   	fbo,a,pt	%fcc0, _kref+0x2814
	.word	0x93b24aaf	! t0_kref+0x280c:   	fpsub16s	%f9, %f15, %f9
	.word	0xe650a028	! t0_kref+0x2810:   	ldsh	[%g2 + 0x28], %l3
	.word	0xa9400000	! t0_kref+0x2814:   	mov	%y, %l4
	.word	0xa61e800c	! t0_kref+0x2818:   	xor	%i2, %o4, %l3
	.word	0xeefe501c	! t0_kref+0x281c:   	swapa	[%i1 + %i4]0x80, %l7
	.word	0x95a0190a	! t0_kref+0x2820:   	fitod	%f10, %f10
	.word	0x9fa00132	! t0_kref+0x2824:   	fabss	%f18, %f15
	.word	0x3d480005	! t0_kref+0x2828:   	fbule,a,pt	%fcc0, _kref+0x283c
	.word	0xe4180019	! t0_kref+0x282c:   	ldd	[%g0 + %i1], %l2
	.word	0x81dd8000	! t0_kref+0x2830:   	flush	%l6
	.word	0xab28000d	! t0_kref+0x2834:   	sll	%g0, %o5, %l5
	.word	0x81ddf5ef	! t0_kref+0x2838:   	flush	%l7 - 0xa11
	.word	0xea7e3fe8	! t0_kref+0x283c:   	swap	[%i0 - 0x18], %l5
	.word	0x97a01a34	! t0_kref+0x2840:   	fstoi	%f20, %f11
	.word	0x90ae800d	! t0_kref+0x2844:   	andncc	%i2, %o5, %o0
	.word	0xa9400000	! t0_kref+0x2848:   	mov	%y, %l4
	.word	0xa9a50954	! t0_kref+0x284c:   	fmuld	%f20, %f20, %f20
	.word	0xa9a01114	! t0_kref+0x2850:   	fxtod	%f20, %f20
	.word	0xac63624b	! t0_kref+0x2854:   	subc	%o5, 0x24b, %l6
	.word	0x81ab8ab1	! t0_kref+0x2858:   	fcmpes	%fcc0, %f14, %f17
	.word	0x9da00031	! t0_kref+0x285c:   	fmovs	%f17, %f14
	.word	0xd1be185a	! t0_kref+0x2860:   	stda	%f8, [%i0 + %i2]0xc2
	.word	0xa6aebae6	! t0_kref+0x2864:   	andncc	%i2, -0x51a, %l3
	.word	0xe26e601a	! t0_kref+0x2868:   	ldstub	[%i1 + 0x1a], %l1
	.word	0x9da00534	! t0_kref+0x286c:   	fsqrts	%f20, %f14
	.word	0x908b70a0	! t0_kref+0x2870:   	andcc	%o5, -0xf60, %o0
	.word	0xed68a008	! t0_kref+0x2874:   	prefetch	%g2 + 8, 22
	.word	0xd820a030	! t0_kref+0x2878:   	st	%o4, [%g2 + 0x30]
	.word	0xe1064000	! t0_kref+0x287c:   	ld	[%i1], %f16
	.word	0xaae3000d	! t0_kref+0x2880:   	subccc	%o4, %o5, %l5
	.word	0x81acca2d	! t0_kref+0x2884:   	fcmps	%fcc0, %f19, %f13
	.word	0xaebeafec	! t0_kref+0x2888:   	xnorcc	%i2, 0xfec, %l7
	.word	0xa9b20410	! t0_kref+0x288c:   	fcmple16	%f8, %f16, %l4
	.word	0xd7e6101a	! t0_kref+0x2890:   	casa	[%i0]0x80, %i2, %o3
	.word	0x81de8014	! t0_kref+0x2894:   	flush	%i2 + %l4
	.word	0xaaf82b9a	! t0_kref+0x2898:   	sdivcc	%g0, 0xb9a, %l5
	.word	0xac5e800c	! t0_kref+0x289c:   	smul	%i2, %o4, %l6
	.word	0x32800005	! t0_kref+0x28a0:   	bne,a	_kref+0x28b4
	.word	0x81dffc19	! t0_kref+0x28a4:   	flush	%i7 - 0x3e7
	.word	0xa5b4c96a	! t0_kref+0x28a8:   	fpmerge	%f19, %f10, %f18
	.word	0xe3b8a080	! t0_kref+0x28ac:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xe1beda58	! t0_kref+0x28b0:   	stda	%f16, [%i3 + %i0]0xd2
	.word	0x91a30850	! t0_kref+0x28b4:   	faddd	%f12, %f16, %f8
	.word	0xa9400000	! t0_kref+0x28b8:   	mov	%y, %l4
	.word	0xec067ff0	! t0_kref+0x28bc:   	ld	[%i1 - 0x10], %l6
	.word	0xe1be588c	! t0_kref+0x28c0:   	stda	%f16, [%i1 + %o4]0xc4
	.word	0xa9a508a9	! t0_kref+0x28c4:   	fsubs	%f20, %f9, %f20
	.word	0xb6103fe2	! t0_kref+0x28c8:   	mov	0xffffffe2, %i3
	.word	0x95a0002c	! t0_kref+0x28cc:   	fmovs	%f12, %f10
	.word	0xd4380019	! t0_kref+0x28d0:   	std	%o2, [%g0 + %i1]
	.word	0xaca831da	! t0_kref+0x28d4:   	andncc	%g0, -0xe26, %l6
	.word	0x81868000	! t0_kref+0x28d8:   	wr	%i2, %g0, %y
	.word	0x2f306654	! t0_kref+0x28dc:   	sethi	%hi(0xc1995000), %l7
	.word	0x91b40713	! t0_kref+0x28e0:   	fmuld8sux16	%f16, %f19, %f8
	.word	0xad06800d	! t0_kref+0x28e4:   	taddcc	%i2, %o5, %l6
	.word	0x9406b6ab	! t0_kref+0x28e8:   	add	%i2, -0x955, %o2
	.word	0xe1871040	! t0_kref+0x28ec:   	lda	[%i4]0x82, %f16
	.word	0xd078a000	! t0_kref+0x28f0:   	swap	[%g2], %o0
	.word	0xaf36a00a	! t0_kref+0x28f4:   	srl	%i2, 0xa, %l7
	.word	0xa9a000ae	! t0_kref+0x28f8:   	fnegs	%f14, %f20
!	.word	0x23bf25be	! t0_kref+0x28fc:   	fbne,a	SYM(t0_subr1)
	   	fbne,a	SYM(t0_subr1)
	.word	0x9f414000	! t0_kref+0x2900:   	mov	%pc, %o7
	.word	0xa1b30d40	! t0_kref+0x2904:   	fnot1	%f12, %f16
	.word	0xad400000	! t0_kref+0x2908:   	mov	%y, %l6
	.word	0x95a0052e	! t0_kref+0x290c:   	fsqrts	%f14, %f10
	.word	0x97a00135	! t0_kref+0x2910:   	fabss	%f21, %f11
	.word	0xa6968000	! t0_kref+0x2914:   	orcc	%i2, %g0, %l3
	.word	0xa7b3010c	! t0_kref+0x2918:   	edge32	%o4, %o4, %l3
	.word	0xaf3b200a	! t0_kref+0x291c:   	sra	%o4, 0xa, %l7
	.word	0xaa18000c	! t0_kref+0x2920:   	xor	%g0, %o4, %l5
	.word	0xd1be9a19	! t0_kref+0x2924:   	stda	%f8, [%i2 + %i1]0xd0
	.word	0x94733554	! t0_kref+0x2928:   	udiv	%o4, -0xaac, %o2
	.word	0x83414000	! t0_kref+0x292c:   	mov	%pc, %g1
	.word	0x81aa8acc	! t0_kref+0x2930:   	fcmped	%fcc0, %f10, %f12
	.word	0xee00a010	! t0_kref+0x2934:   	ld	[%g2 + 0x10], %l7
	.word	0xac16a8a4	! t0_kref+0x2938:   	or	%i2, 0x8a4, %l6
	.word	0xa7a489ad	! t0_kref+0x293c:   	fdivs	%f18, %f13, %f19
	.word	0xa9b28d32	! t0_kref+0x2940:   	fandnot1s	%f10, %f18, %f20
	.word	0xe81e2008	! t0_kref+0x2944:   	ldd	[%i0 + 8], %l4
	.word	0xa5a01a35	! t0_kref+0x2948:   	fstoi	%f21, %f18
	.word	0x9db306d0	! t0_kref+0x294c:   	fmul8sux16	%f12, %f16, %f14
	.word	0xd81f4019	! t0_kref+0x2950:   	ldd	[%i5 + %i1], %o4
	.word	0xa1b34aeb	! t0_kref+0x2954:   	fpsub32s	%f13, %f11, %f16
	.word	0x32800006	! t0_kref+0x2958:   	bne,a	_kref+0x2970
	.word	0x94c3400c	! t0_kref+0x295c:   	addccc	%o5, %o4, %o2
	.word	0xa9a01a2f	! t0_kref+0x2960:   	fstoi	%f15, %f20
	.word	0x910b736b	! t0_kref+0x2964:   	tsubcc	%o5, -0xc95, %o0
	.word	0xad2ea018	! t0_kref+0x2968:   	sll	%i2, 0x18, %l6
	.word	0xa1a508cc	! t0_kref+0x296c:   	fsubd	%f20, %f12, %f16
	.word	0xa9a3482a	! t0_kref+0x2970:   	fadds	%f13, %f10, %f20
	.word	0xd040a000	! t0_kref+0x2974:   	ldsw	[%g2], %o0
	.word	0xa1a488d2	! t0_kref+0x2978:   	fsubd	%f18, %f18, %f16
	.word	0xab6523a9	! t0_kref+0x297c:   	movleu	%icc, 0x3a9, %l5
	.word	0x95a4884a	! t0_kref+0x2980:   	faddd	%f18, %f10, %f10
	.word	0xa9b2cd60	! t0_kref+0x2984:   	fnot1s	%f11, %f20
	.word	0xef68a008	! t0_kref+0x2988:   	prefetch	%g2 + 8, 23
	.word	0xd47e3fe0	! t0_kref+0x298c:   	swap	[%i0 - 0x20], %o2
	.word	0xa7b38d2b	! t0_kref+0x2990:   	fandnot1s	%f14, %f11, %f19
	.word	0xd008a00b	! t0_kref+0x2994:   	ldub	[%g2 + 0xb], %o0
	.word	0xf007bfe0	! t0_kref+0x2998:   	ld	[%fp - 0x20], %i0
	.word	0x9ba3c8b0	! t0_kref+0x299c:   	fsubs	%f15, %f16, %f13
	.word	0xd9000019	! t0_kref+0x29a0:   	ld	[%g0 + %i1], %f12
	.word	0xee0e3fef	! t0_kref+0x29a4:   	ldub	[%i0 - 0x11], %l7
	.word	0x81aa0aad	! t0_kref+0x29a8:   	fcmpes	%fcc0, %f8, %f13
	.word	0xe100a028	! t0_kref+0x29ac:   	ld	[%g2 + 0x28], %f16
	.word	0xda367fe8	! t0_kref+0x29b0:   	sth	%o5, [%i1 - 0x18]
	.word	0xc96e6018	! t0_kref+0x29b4:   	prefetch	%i1 + 0x18, 4
	.word	0xaf3b001a	! t0_kref+0x29b8:   	sra	%o4, %i2, %l7
	.word	0x9da000ac	! t0_kref+0x29bc:   	fnegs	%f12, %f14
	.word	0x37480002	! t0_kref+0x29c0:   	fbge,a,pt	%fcc0, _kref+0x29c8
	.word	0xa9a0188e	! t0_kref+0x29c4:   	fitos	%f14, %f20
	.word	0x9fa01a2f	! t0_kref+0x29c8:   	fstoi	%f15, %f15
	.word	0x83c060b4	! t0_kref+0x29cc:   	jmpl	%g1 + 0xb4, %g1
	.word	0xa6ab36b2	! t0_kref+0x29d0:   	andncc	%o4, -0x94e, %l3
	.word	0x9333000c	! t0_kref+0x29d4:   	srl	%o4, %o4, %o1
	.word	0x81ac0a28	! t0_kref+0x29d8:   	fcmps	%fcc0, %f16, %f8
	.word	0x9344c000	! t0_kref+0x29dc:   	mov	%gsr, %o1
	.word	0xdd80105c	! t0_kref+0x29e0:   	lda	[%g0 + %i4]0x82, %f14
	.word	0xd920a030	! t0_kref+0x29e4:   	st	%f12, [%g2 + 0x30]
	.word	0x93b3013a	! t0_kref+0x29e8:   	edge32n	%o4, %i2, %o1
	.word	0xa63b7f25	! t0_kref+0x29ec:   	xnor	%o5, -0xdb, %l3
	.word	0xac736bb8	! t0_kref+0x29f0:   	udiv	%o5, 0xbb8, %l6
	.word	0x3c480007	! t0_kref+0x29f4:   	bpos,a,pt	%icc, _kref+0x2a10
	.word	0xa5a548ae	! t0_kref+0x29f8:   	fsubs	%f21, %f14, %f18
	.word	0x99b20912	! t0_kref+0x29fc:   	faligndata	%f8, %f18, %f12
	.word	0x2c800007	! t0_kref+0x2a00:   	bneg,a	_kref+0x2a1c
	.word	0x91b4848a	! t0_kref+0x2a04:   	fcmple32	%f18, %f10, %o0
	.word	0x37800001	! t0_kref+0x2a08:   	fbge,a	_kref+0x2a0c
	.word	0xad30000c	! t0_kref+0x2a0c:   	srl	%g0, %o4, %l6
	.word	0xd250a03a	! t0_kref+0x2a10:   	ldsh	[%g2 + 0x3a], %o1
	.word	0x20800007	! t0_kref+0x2a14:   	bn,a	_kref+0x2a30
	.word	0xa73e8000	! t0_kref+0x2a18:   	sra	%i2, %g0, %l3
	.word	0x9da00528	! t0_kref+0x2a1c:   	fsqrts	%f8, %f14
	.word	0xa9a00034	! t0_kref+0x2a20:   	fmovs	%f20, %f20
	.word	0xae98322a	! t0_kref+0x2a24:   	xorcc	%g0, -0xdd6, %l7
	.word	0xa63b69d6	! t0_kref+0x2a28:   	xnor	%o5, 0x9d6, %l3
	.word	0xaefe801a	! t0_kref+0x2a2c:   	sdivcc	%i2, %i2, %l7
	.word	0x91b00fe0	! t0_kref+0x2a30:   	fones	%f8
	.word	0xa9408000	! t0_kref+0x2a34:   	mov	%ccr, %l4
	.word	0xe3b8a080	! t0_kref+0x2a38:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xee066008	! t0_kref+0x2a3c:   	ld	[%i1 + 8], %l7
	.word	0xa5b38cab	! t0_kref+0x2a40:   	fandnot2s	%f14, %f11, %f18
	.word	0xecdf5019	! t0_kref+0x2a44:   	ldxa	[%i5 + %i1]0x80, %l6
	.word	0x9420000d	! t0_kref+0x2a48:   	neg	%o5, %o2
	.word	0x91b680fa	! t0_kref+0x2a4c:   	edge16ln	%i2, %i2, %o0
	.word	0xe500a000	! t0_kref+0x2a50:   	ld	[%g2], %f18
	.word	0xa1b28632	! t0_kref+0x2a54:   	fmul8x16	%f10, %f18, %f16
	sethi	%hi(2f), %o7
	.word	0xe40be290	! t0_kref+0x2a5c:   	ldub	[%o7 + 0x290], %l2
	.word	0xa41ca00c	! t0_kref+0x2a60:   	xor	%l2, 0xc, %l2
	.word	0xe42be290	! t0_kref+0x2a64:   	stb	%l2, [%o7 + 0x290]
	.word	0x81dbe290	! t0_kref+0x2a68:   	flush	%o7 + 0x290
	.word	0x9536800d	! t0_kref+0x2a6c:   	srl	%i2, %o5, %o2
	.word	0x95b4858c	! t0_kref+0x2a70:   	fcmpgt32	%f18, %f12, %o2
	.word	0x9fb3caf1	! t0_kref+0x2a74:   	fpsub32s	%f15, %f17, %f15
	.word	0xacfb4000	! t0_kref+0x2a78:   	sdivcc	%o5, %g0, %l6
	.word	0xc028a020	! t0_kref+0x2a7c:   	clrb	[%g2 + 0x20]
	.word	0xaab03ddb	! t0_kref+0x2a80:   	orncc	%g0, -0x225, %l5
	.word	0xd2ce1000	! t0_kref+0x2a84:   	ldsba	[%i0]0x80, %o1
	.word	0x90433bca	! t0_kref+0x2a88:   	addc	%o4, -0x436, %o0
	.word	0xfd6e3fe8	! t0_kref+0x2a8c:   	prefetch	%i0 - 0x18, 30
2:	.word	0x9db2cdf2	! t0_kref+0x2a90:   	fnands	%f11, %f18, %f14
	.word	0xaeb8000d	! t0_kref+0x2a94:   	xnorcc	%g0, %o5, %l7
	.word	0x8610201f	! t0_kref+0x2a98:   	mov	0x1f, %g3
	.word	0x86a0e001	! t0_kref+0x2a9c:   	subcc	%g3, 1, %g3
	.word	0x22800018	! t0_kref+0x2aa0:   	be,a	_kref+0x2b00
	.word	0x95a0190e	! t0_kref+0x2aa4:   	fitod	%f14, %f10
	.word	0x30bffffd	! t0_kref+0x2aa8:   	ba,a	_kref+0x2a9c
	.word	0xd2167fe0	! t0_kref+0x2aac:   	lduh	[%i1 - 0x20], %o1
	.word	0xf207bfe0	! t0_kref+0x2ab0:   	ld	[%fp - 0x20], %i1
	.word	0xa786bfb9	! t0_kref+0x2ab4:   	wr	%i2, 0xffffffb9, %gsr
	.word	0x93b00fe0	! t0_kref+0x2ab8:   	fones	%f9
	.word	0xa92e800d	! t0_kref+0x2abc:   	sll	%i2, %o5, %l4
	.word	0x92b82de8	! t0_kref+0x2ac0:   	xnorcc	%g0, 0xde8, %o1
	.word	0x394ffff6	! t0_kref+0x2ac4:   	fbuge,a,pt	%fcc0, _kref+0x2a9c
	.word	0xe608a019	! t0_kref+0x2ac8:   	ldub	[%g2 + 0x19], %l3
	.word	0x90bb000c	! t0_kref+0x2acc:   	xnorcc	%o4, %o4, %o0
	.word	0xe66e001a	! t0_kref+0x2ad0:   	ldstub	[%i0 + %i2], %l3
	.word	0xd208a002	! t0_kref+0x2ad4:   	ldub	[%g2 + 2], %o1
	.word	0xd820a030	! t0_kref+0x2ad8:   	st	%o4, [%g2 + 0x30]
	.word	0xa8602b3c	! t0_kref+0x2adc:   	subc	%g0, 0xb3c, %l4
	.word	0x272d2c18	! t0_kref+0x2ae0:   	sethi	%hi(0xb4b06000), %l3
	.word	0xd27e001c	! t0_kref+0x2ae4:   	swap	[%i0 + %i4], %o1
	.word	0xacc6800d	! t0_kref+0x2ae8:   	addccc	%i2, %o5, %l6
	.word	0x2a480004	! t0_kref+0x2aec:   	bcs,a,pt	%icc, _kref+0x2afc
	.word	0xc368a04c	! t0_kref+0x2af0:   	prefetch	%g2 + 0x4c, 1
	.word	0xd11e001d	! t0_kref+0x2af4:   	ldd	[%i0 + %i5], %f8
	.word	0x99a5082f	! t0_kref+0x2af8:   	fadds	%f20, %f15, %f12
	.word	0x99a01a2f	! t0_kref+0x2afc:   	fstoi	%f15, %f12
	.word	0x9db00fc0	! t0_kref+0x2b00:   	fone	%f14
	.word	0x91a0190e	! t0_kref+0x2b04:   	fitod	%f14, %f8
	.word	0xaa1b400d	! t0_kref+0x2b08:   	xor	%o5, %o5, %l5
	.word	0x8610201e	! t0_kref+0x2b0c:   	mov	0x1e, %g3
	.word	0x86a0e001	! t0_kref+0x2b10:   	subcc	%g3, 1, %g3
	.word	0x2280001e	! t0_kref+0x2b14:   	be,a	_kref+0x2b8c
	.word	0x91b304ce	! t0_kref+0x2b18:   	fcmpne32	%f12, %f14, %o0
	.word	0xeb00a028	! t0_kref+0x2b1c:   	ld	[%g2 + 0x28], %f21
	.word	0xda366010	! t0_kref+0x2b20:   	sth	%o5, [%i1 + 0x10]
	.word	0x20800005	! t0_kref+0x2b24:   	bn,a	_kref+0x2b38
	.word	0xeb00a018	! t0_kref+0x2b28:   	ld	[%g2 + 0x18], %f21
	.word	0xd3263ff4	! t0_kref+0x2b2c:   	st	%f9, [%i0 - 0xc]
	.word	0x9fc00004	! t0_kref+0x2b30:   	call	%g0 + %g4
	.word	0xa5a248b1	! t0_kref+0x2b34:   	fsubs	%f9, %f17, %f18
	.word	0xa9a508ca	! t0_kref+0x2b38:   	fsubd	%f20, %f10, %f20
	.word	0xa6a6a375	! t0_kref+0x2b3c:   	subcc	%i2, 0x375, %l3
	.word	0xa838000c	! t0_kref+0x2b40:   	xnor	%g0, %o4, %l4
	.word	0xd7064000	! t0_kref+0x2b44:   	ld	[%i1], %f11
	.word	0x81800000	! t0_kref+0x2b48:   	mov	%g0, %y
	.word	0xaba00034	! t0_kref+0x2b4c:   	fmovs	%f20, %f21
	.word	0xe8c71019	! t0_kref+0x2b50:   	ldswa	[%i4 + %i1]0x80, %l4
	.word	0xa6b3401a	! t0_kref+0x2b54:   	orncc	%o5, %i2, %l3
	.word	0xa9b30040	! t0_kref+0x2b58:   	edge8l	%o4, %g0, %l4
	.word	0x9db00fc0	! t0_kref+0x2b5c:   	fone	%f14
	.word	0x2e480002	! t0_kref+0x2b60:   	bvs,a,pt	%icc, _kref+0x2b68
	.word	0xaee3705d	! t0_kref+0x2b64:   	subccc	%o5, -0xfa3, %l7
	.word	0x93b4054a	! t0_kref+0x2b68:   	fcmpeq16	%f16, %f10, %o1
	.word	0x9da5482e	! t0_kref+0x2b6c:   	fadds	%f21, %f14, %f14
	.word	0x941b401a	! t0_kref+0x2b70:   	xor	%o5, %i2, %o2
	.word	0x9f414000	! t0_kref+0x2b74:   	mov	%pc, %o7
	.word	0xd43e2018	! t0_kref+0x2b78:   	std	%o2, [%i0 + 0x18]
	.word	0x33480005	! t0_kref+0x2b7c:   	fbe,a,pt	%fcc0, _kref+0x2b90
	.word	0xa600000d	! t0_kref+0x2b80:   	add	%g0, %o5, %l3
	.word	0xd250a022	! t0_kref+0x2b84:   	ldsh	[%g2 + 0x22], %o1
	.word	0xeb20a038	! t0_kref+0x2b88:   	st	%f21, [%g2 + 0x38]
	.word	0x91b6804c	! t0_kref+0x2b8c:   	edge8l	%i2, %o4, %o0
	.word	0xe806001c	! t0_kref+0x2b90:   	ld	[%i0 + %i4], %l4
	.word	0xa3a01a29	! t0_kref+0x2b94:   	fstoi	%f9, %f17
	.word	0xa6db2270	! t0_kref+0x2b98:   	smulcc	%o4, 0x270, %l3
	.word	0xe3200019	! t0_kref+0x2b9c:   	st	%f17, [%g0 + %i1]
	.word	0xc0367fe4	! t0_kref+0x2ba0:   	clrh	[%i1 - 0x1c]
	.word	0xd2d61000	! t0_kref+0x2ba4:   	ldsha	[%i0]0x80, %o1
	.word	0x20480004	! t0_kref+0x2ba8:   	bn,a,pt	%icc, _kref+0x2bb8
	.word	0x9fb3cea0	! t0_kref+0x2bac:   	fsrc1s	%f15, %f15
	.word	0x9da4894e	! t0_kref+0x2bb0:   	fmuld	%f18, %f14, %f14
	.word	0x32480003	! t0_kref+0x2bb4:   	bne,a,pt	%icc, _kref+0x2bc0
	.word	0xe810a022	! t0_kref+0x2bb8:   	lduh	[%g2 + 0x22], %l4
	.word	0x99a4084a	! t0_kref+0x2bbc:   	faddd	%f16, %f10, %f12
	.word	0xaa26b817	! t0_kref+0x2bc0:   	sub	%i2, -0x7e9, %l5
	.word	0xda6e0000	! t0_kref+0x2bc4:   	ldstub	[%i0], %o5
	.word	0x9ba209af	! t0_kref+0x2bc8:   	fdivs	%f8, %f15, %f13
	.word	0x3f480005	! t0_kref+0x2bcc:   	fbo,a,pt	%fcc0, _kref+0x2be0
	.word	0xea000018	! t0_kref+0x2bd0:   	ld	[%g0 + %i0], %l5
	.word	0xab44c000	! t0_kref+0x2bd4:   	mov	%gsr, %l5
	.word	0x95b4cd60	! t0_kref+0x2bd8:   	fnot1s	%f19, %f10
	.word	0xd06e3fe9	! t0_kref+0x2bdc:   	ldstub	[%i0 - 0x17], %o0
	.word	0xec00a000	! t0_kref+0x2be0:   	ld	[%g2], %l6
	.word	0x97a44828	! t0_kref+0x2be4:   	fadds	%f17, %f8, %f11
	.word	0xa1a00034	! t0_kref+0x2be8:   	fmovs	%f20, %f16
	call	SYM(t0_subr0)
	.word	0xa83b64d6	! t0_kref+0x2bf0:   	xnor	%o5, 0x4d6, %l4
	.word	0xc0a71018	! t0_kref+0x2bf4:   	sta	%g0, [%i4 + %i0]0x80
	.word	0xa9368000	! t0_kref+0x2bf8:   	srl	%i2, %g0, %l4
	.word	0x9da50852	! t0_kref+0x2bfc:   	faddd	%f20, %f18, %f14
	.word	0xdf267fec	! t0_kref+0x2c00:   	st	%f15, [%i1 - 0x14]
	.word	0x99b28c8c	! t0_kref+0x2c04:   	fandnot2	%f10, %f12, %f12
	.word	0xa933400d	! t0_kref+0x2c08:   	srl	%o5, %o5, %l4
	.word	0xd03e0000	! t0_kref+0x2c0c:   	std	%o0, [%i0]
	.word	0x8143e040	! t0_kref+0x2c10:   	membar	0x40
	.word	0xd208a01a	! t0_kref+0x2c14:   	ldub	[%g2 + 0x1a], %o1
	.word	0xe3b8a040	! t0_kref+0x2c18:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xf0516f5a	! t0_kref+0x2c1c:   	ldsh	[%g5 + 0xf5a], %i0
	.word	0x91b0008d	! t0_kref+0x2c20:   	edge16	%g0, %o5, %o0
	.word	0xa1b3cfb3	! t0_kref+0x2c24:   	fors	%f15, %f19, %f16
	.word	0xb8102010	! t0_kref+0x2c28:   	mov	0x10, %i4
	.word	0x95a00128	! t0_kref+0x2c2c:   	fabss	%f8, %f10
	.word	0x95418000	! t0_kref+0x2c30:   	mov	%fprs, %o2
	.word	0x81ab8a52	! t0_kref+0x2c34:   	fcmpd	%fcc0, %f14, %f18
	.word	0x94a6801a	! t0_kref+0x2c38:   	subcc	%i2, %i2, %o2
	.word	0x81d94017	! t0_kref+0x2c3c:   	flush	%g5 + %l7
	.word	0x90c03935	! t0_kref+0x2c40:   	addccc	%g0, -0x6cb, %o0
	.word	0xe8680019	! t0_kref+0x2c44:   	ldstub	[%g0 + %i1], %l4
	.word	0x92f8000c	! t0_kref+0x2c48:   	sdivcc	%g0, %o4, %o1
	.word	0x3d800002	! t0_kref+0x2c4c:   	fbule,a	_kref+0x2c54
	.word	0xa7a349b4	! t0_kref+0x2c50:   	fdivs	%f13, %f20, %f19
	.word	0xad36a005	! t0_kref+0x2c54:   	srl	%i2, 0x5, %l6
	.word	0x91a348ab	! t0_kref+0x2c58:   	fsubs	%f13, %f11, %f8
	.word	0xa1a00032	! t0_kref+0x2c5c:   	fmovs	%f18, %f16
	.word	0x9ba000a8	! t0_kref+0x2c60:   	fnegs	%f8, %f13
	.word	0x81aa0a31	! t0_kref+0x2c64:   	fcmps	%fcc0, %f8, %f17
	.word	0xaed3400c	! t0_kref+0x2c68:   	umulcc	%o5, %o4, %l7
	.word	0xacc3400d	! t0_kref+0x2c6c:   	addccc	%o5, %o5, %l6
	.word	0x99b28e0a	! t0_kref+0x2c70:   	fand	%f10, %f10, %f12
	.word	0xda766000	! t0_kref+0x2c74:   	stx	%o5, [%i1]
	.word	0xd416001b	! t0_kref+0x2c78:   	lduh	[%i0 + %i3], %o2
	.word	0xa81823a8	! t0_kref+0x2c7c:   	xor	%g0, 0x3a8, %l4
	.word	0xa7b38de9	! t0_kref+0x2c80:   	fnands	%f14, %f9, %f19
	.word	0xaa88001a	! t0_kref+0x2c84:   	andcc	%g0, %i2, %l5
	.word	0xa8b37fdb	! t0_kref+0x2c88:   	orncc	%o5, -0x25, %l4
	.word	0xa638001a	! t0_kref+0x2c8c:   	xnor	%g0, %i2, %l3
	.word	0xc768a0c6	! t0_kref+0x2c90:   	prefetch	%g2 + 0xc6, 3
	.word	0xa9a01890	! t0_kref+0x2c94:   	fitos	%f16, %f20
	.word	0x81ab8a2e	! t0_kref+0x2c98:   	fcmps	%fcc0, %f14, %f14
	.word	0xa6b32e9e	! t0_kref+0x2c9c:   	orncc	%o4, 0xe9e, %l3
	.word	0xa88b6dcd	! t0_kref+0x2ca0:   	andcc	%o5, 0xdcd, %l4
	.word	0x99b38d14	! t0_kref+0x2ca4:   	fandnot1	%f14, %f20, %f12
	.word	0xa740c000	! t0_kref+0x2ca8:   	mov	%asi, %l3
	.word	0x8586a2d3	! t0_kref+0x2cac:   	wr	%i2, 0x2d3, %ccr
	.word	0x91a389d0	! t0_kref+0x2cb0:   	fdivd	%f14, %f16, %f8
	.word	0xe700a010	! t0_kref+0x2cb4:   	ld	[%g2 + 0x10], %f19
	.word	0x99b2c70e	! t0_kref+0x2cb8:   	fmuld8sux16	%f11, %f14, %f12
	.word	0xd448a039	! t0_kref+0x2cbc:   	ldsb	[%g2 + 0x39], %o2
	.word	0x94034000	! t0_kref+0x2cc0:   	add	%o5, %g0, %o2
	.word	0x94303cef	! t0_kref+0x2cc4:   	orn	%g0, -0x311, %o2
	.word	0x9403661f	! t0_kref+0x2cc8:   	add	%o5, 0x61f, %o2
	.word	0xa5a00533	! t0_kref+0x2ccc:   	fsqrts	%f19, %f18
	.word	0x9da3482e	! t0_kref+0x2cd0:   	fadds	%f13, %f14, %f14
	.word	0xa1b50e50	! t0_kref+0x2cd4:   	fxnor	%f20, %f16, %f16
	.word	0xe3b8a040	! t0_kref+0x2cd8:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xab36801a	! t0_kref+0x2cdc:   	srl	%i2, %i2, %l5
	.word	0x31480008	! t0_kref+0x2ce0:   	fba,a,pt	%fcc0, _kref+0x2d00
	.word	0x95a488ca	! t0_kref+0x2ce4:   	fsubd	%f18, %f10, %f10
	.word	0x91a01929	! t0_kref+0x2ce8:   	fstod	%f9, %f8
	.word	0xab44c000	! t0_kref+0x2cec:   	mov	%gsr, %l5
	.word	0xa8b30000	! t0_kref+0x2cf0:   	orncc	%o4, %g0, %l4
	.word	0x95408000	! t0_kref+0x2cf4:   	mov	%ccr, %o2
	.word	0x23480003	! t0_kref+0x2cf8:   	fbne,a,pt	%fcc0, _kref+0x2d04
	.word	0x9ba00528	! t0_kref+0x2cfc:   	fsqrts	%f8, %f13
	.word	0xa1b00fc0	! t0_kref+0x2d00:   	fone	%f16
	.word	0xa873393e	! t0_kref+0x2d04:   	udiv	%o4, -0x6c2, %l4
	.word	0xa9b28acc	! t0_kref+0x2d08:   	fpsub32	%f10, %f12, %f20
	.word	0xac9b3cc3	! t0_kref+0x2d0c:   	xorcc	%o4, -0x33d, %l6
	.word	0x91b2872c	! t0_kref+0x2d10:   	fmuld8ulx16	%f10, %f12, %f8
	.word	0xa9b40c8a	! t0_kref+0x2d14:   	fandnot2	%f16, %f10, %f20
	.word	0xa8c36f17	! t0_kref+0x2d18:   	addccc	%o5, 0xf17, %l4
	.word	0x9fc10000	! t0_kref+0x2d1c:   	call	%g4
	.word	0x9058001a	! t0_kref+0x2d20:   	smul	%g0, %i2, %o0
	.word	0xf96e001b	! t0_kref+0x2d24:   	prefetch	%i0 + %i3, 28
	.word	0xe650a03a	! t0_kref+0x2d28:   	ldsh	[%g2 + 0x3a], %l3
	.word	0x929b000c	! t0_kref+0x2d2c:   	xorcc	%o4, %o4, %o1
	.word	0xe700a018	! t0_kref+0x2d30:   	ld	[%g2 + 0x18], %f19
	.word	0x91a0108a	! t0_kref+0x2d34:   	fxtos	%f10, %f8
	.word	0xa9302004	! t0_kref+0x2d38:   	srl	%g0, 0x4, %l4
	call	SYM(t0_subr0)
	.word	0x90b6a40f	! t0_kref+0x2d40:   	orncc	%i2, 0x40f, %o0
	.word	0xee86505c	! t0_kref+0x2d44:   	lda	[%i1 + %i4]0x82, %l7
	.word	0xe968a105	! t0_kref+0x2d48:   	prefetch	%g2 + 0x105, 20
	.word	0xd320a000	! t0_kref+0x2d4c:   	st	%f9, [%g2]
	.word	0xdf20a000	! t0_kref+0x2d50:   	st	%f15, [%g2]
	call	SYM(t0_subr3)
	.word	0xa7a4c8b3	! t0_kref+0x2d58:   	fsubs	%f19, %f19, %f19
	.word	0xe168a005	! t0_kref+0x2d5c:   	prefetch	%g2 + 5, 16
	.word	0xab3b400d	! t0_kref+0x2d60:   	sra	%o5, %o5, %l5
	.word	0xa7a409af	! t0_kref+0x2d64:   	fdivs	%f16, %f15, %f19
	.word	0x9db40caf	! t0_kref+0x2d68:   	fandnot2s	%f16, %f15, %f14
	.word	0x33480005	! t0_kref+0x2d6c:   	fbe,a,pt	%fcc0, _kref+0x2d80
	.word	0xdd1e0000	! t0_kref+0x2d70:   	ldd	[%i0], %f14
	.word	0xd81e7ff8	! t0_kref+0x2d74:   	ldd	[%i1 - 8], %o4
	.word	0xdd00a030	! t0_kref+0x2d78:   	ld	[%g2 + 0x30], %f14
	.word	0xa656801a	! t0_kref+0x2d7c:   	umul	%i2, %i2, %l3
	.word	0xa5a00531	! t0_kref+0x2d80:   	fsqrts	%f17, %f18
	.word	0xe7067fe4	! t0_kref+0x2d84:   	ld	[%i1 - 0x1c], %f19
	.word	0xa1a38832	! t0_kref+0x2d88:   	fadds	%f14, %f18, %f16
	.word	0xa5b20e52	! t0_kref+0x2d8c:   	fxnor	%f8, %f18, %f18
	.word	0xa72b000c	! t0_kref+0x2d90:   	sll	%o4, %o4, %l3
	.word	0xa1a289d2	! t0_kref+0x2d94:   	fdivd	%f10, %f18, %f16
	.word	0x3f800001	! t0_kref+0x2d98:   	fbo,a	_kref+0x2d9c
	.word	0x91b3858c	! t0_kref+0x2d9c:   	fcmpgt32	%f14, %f12, %o0
	.word	0x2f480005	! t0_kref+0x2da0:   	fbu,a,pt	%fcc0, _kref+0x2db4
	.word	0xa9a50848	! t0_kref+0x2da4:   	faddd	%f20, %f8, %f20
	.word	0x9da00048	! t0_kref+0x2da8:   	fmovd	%f8, %f14
	.word	0xac034000	! t0_kref+0x2dac:   	add	%o5, %g0, %l6
	.word	0xe51f4018	! t0_kref+0x2db0:   	ldd	[%i5 + %i0], %f18
	.word	0x9dabc02e	! t0_kref+0x2db4:   	fmovso	%fcc0, %f14, %f14
	.word	0xa89b78cc	! t0_kref+0x2db8:   	xorcc	%o5, -0x734, %l4
	call	1f
	.empty
	.word	0x9530200f	! t0_kref+0x2dc0:   	srl	%g0, 0xf, %o2
	.word	0x95a01108	! t0_kref+0x2dc4:   	fxtod	%f8, %f10
	.word	0x9fc00004	! t0_kref+0x2dc8:   	call	%g0 + %g4
	.word	0x91b00160	! t0_kref+0x2dcc:   	edge32ln	%g0, %g0, %o0
	.word	0xaebe800d	! t0_kref+0x2dd0:   	xnorcc	%i2, %o5, %l7
	.word	0xf430a010	! t0_kref+0x2dd4:   	sth	%i2, [%g2 + 0x10]
1:	.word	0xa9b34080	! t0_kref+0x2dd8:   	edge16	%o5, %g0, %l4
	.word	0xe8000018	! t0_kref+0x2ddc:   	ld	[%g0 + %i0], %l4
	.word	0x94c6801a	! t0_kref+0x2de0:   	addccc	%i2, %i2, %o2
	.word	0x81ab8ab2	! t0_kref+0x2de4:   	fcmpes	%fcc0, %f14, %f18
	.word	0x91a48954	! t0_kref+0x2de8:   	fmuld	%f18, %f20, %f8
	.word	0x9fb50d60	! t0_kref+0x2dec:   	fnot1s	%f20, %f15
	.word	0x93a01a29	! t0_kref+0x2df0:   	fstoi	%f9, %f9
	sethi	%hi(2f), %o7
	.word	0xe40be22c	! t0_kref+0x2df8:   	ldub	[%o7 + 0x22c], %l2
	.word	0xa41ca00c	! t0_kref+0x2dfc:   	xor	%l2, 0xc, %l2
	.word	0xe42be22c	! t0_kref+0x2e00:   	stb	%l2, [%o7 + 0x22c]
	.word	0x81dbe22c	! t0_kref+0x2e04:   	flush	%o7 + 0x22c
	.word	0x95a5084a	! t0_kref+0x2e08:   	faddd	%f20, %f10, %f10
	.word	0xa7b00240	! t0_kref+0x2e0c:   	array16	%g0, %g0, %l3
	.word	0xa1a20950	! t0_kref+0x2e10:   	fmuld	%f8, %f16, %f16
	call	SYM(t0_subr1)
	.word	0x93b30ea0	! t0_kref+0x2e18:   	fsrc1s	%f12, %f9
	.word	0xfb6e6008	! t0_kref+0x2e1c:   	prefetch	%i1 + 8, 29
	.word	0x9ba00028	! t0_kref+0x2e20:   	fmovs	%f8, %f13
	.word	0xec062008	! t0_kref+0x2e24:   	ld	[%i0 + 8], %l6
	.word	0xda363fee	! t0_kref+0x2e28:   	sth	%o5, [%i0 - 0x12]
2:	.word	0xab400000	! t0_kref+0x2e2c:   	mov	%y, %l5
	.word	0x91a408d2	! t0_kref+0x2e30:   	fsubd	%f16, %f18, %f8
	.word	0x97a018c8	! t0_kref+0x2e34:   	fdtos	%f8, %f11
	.word	0xa9a01a4e	! t0_kref+0x2e38:   	fdtoi	%f14, %f20
	.word	0xede6500c	! t0_kref+0x2e3c:   	casa	[%i1]0x80, %o4, %l6
	.word	0xdd00a028	! t0_kref+0x2e40:   	ld	[%g2 + 0x28], %f14
	.word	0xda300019	! t0_kref+0x2e44:   	sth	%o5, [%g0 + %i1]
	.word	0xf428a020	! t0_kref+0x2e48:   	stb	%i2, [%g2 + 0x20]
	.word	0xa5a308ca	! t0_kref+0x2e4c:   	fsubd	%f12, %f10, %f18
	.word	0xd41e401d	! t0_kref+0x2e50:   	ldd	[%i1 + %i5], %o2
	.word	0x95b40d40	! t0_kref+0x2e54:   	fnot1	%f16, %f10
	.word	0x93a0002e	! t0_kref+0x2e58:   	fmovs	%f14, %f9
	.word	0xf428a008	! t0_kref+0x2e5c:   	stb	%i2, [%g2 + 8]
	.word	0x81aa0ab4	! t0_kref+0x2e60:   	fcmpes	%fcc0, %f8, %f20
	.word	0xa5a48948	! t0_kref+0x2e64:   	fmuld	%f18, %f8, %f18
	.word	0xacbb000c	! t0_kref+0x2e68:   	xnorcc	%o4, %o4, %l6
	.word	0x1527f199	! t0_kref+0x2e6c:   	sethi	%hi(0x9fc66400), %o2
	.word	0xd41e4000	! t0_kref+0x2e70:   	ldd	[%i1], %o2
	.word	0x91a488b5	! t0_kref+0x2e74:   	fsubs	%f18, %f21, %f8
	.word	0x9fc10000	! t0_kref+0x2e78:   	call	%g4
	.word	0xa9a0190b	! t0_kref+0x2e7c:   	fitod	%f11, %f20
	.word	0xa3a01a30	! t0_kref+0x2e80:   	fstoi	%f16, %f17
	.word	0x9fa018d0	! t0_kref+0x2e84:   	fdtos	%f16, %f15
	.word	0xaeb6b311	! t0_kref+0x2e88:   	orncc	%i2, -0xcef, %l7
	.word	0xa850000d	! t0_kref+0x2e8c:   	umul	%g0, %o5, %l4
	.word	0x953b6000	! t0_kref+0x2e90:   	sra	%o5, 0x0, %o2
	.word	0x9f414000	! t0_kref+0x2e94:   	mov	%pc, %o7
	.word	0x81ad0a4e	! t0_kref+0x2e98:   	fcmpd	%fcc0, %f20, %f14
	.word	0x9fc00004	! t0_kref+0x2e9c:   	call	%g0 + %g4
	.word	0xe3b8a040	! t0_kref+0x2ea0:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xaaa6af25	! t0_kref+0x2ea4:   	subcc	%i2, 0xf25, %l5
	.word	0xe66e3ff0	! t0_kref+0x2ea8:   	ldstub	[%i0 - 0x10], %l3
	.word	0x31480006	! t0_kref+0x2eac:   	fba,a,pt	%fcc0, _kref+0x2ec4
	.word	0x95a00034	! t0_kref+0x2eb0:   	fmovs	%f20, %f10
	.word	0xa7b00120	! t0_kref+0x2eb4:   	edge32n	%g0, %g0, %l3
	.word	0xdfa01019	! t0_kref+0x2eb8:   	sta	%f15, [%g0 + %i1]0x80
	.word	0x99a01048	! t0_kref+0x2ebc:   	fdtox	%f8, %f12
	.word	0x81ab0acc	! t0_kref+0x2ec0:   	fcmped	%fcc0, %f12, %f12
	.word	0xeb68a044	! t0_kref+0x2ec4:   	prefetch	%g2 + 0x44, 21
	.word	0x81ddf4db	! t0_kref+0x2ec8:   	flush	%l7 - 0xb25
	.word	0x878020f0	! t0_kref+0x2ecc:   	mov	0xf0, %asi
	.word	0x81df000e	! t0_kref+0x2ed0:   	flush	%i4 + %sp
	.word	0x81868000	! t0_kref+0x2ed4:   	wr	%i2, %g0, %y
	.word	0xa5b00770	! t0_kref+0x2ed8:   	fpack16	%f16, %f18
	.word	0x94968000	! t0_kref+0x2edc:   	orcc	%i2, %g0, %o2
	.word	0xa1b40e80	! t0_kref+0x2ee0:   	fsrc1	%f16, %f16
	.word	0x9093401a	! t0_kref+0x2ee4:   	orcc	%o5, %i2, %o0
	.word	0xa930000d	! t0_kref+0x2ee8:   	srl	%g0, %o5, %l4
	.word	0x93a00534	! t0_kref+0x2eec:   	fsqrts	%f20, %f9
	sethi	%hi(2f), %o7
	.word	0xe40be320	! t0_kref+0x2ef4:   	ldub	[%o7 + 0x320], %l2
	.word	0xa41ca00c	! t0_kref+0x2ef8:   	xor	%l2, 0xc, %l2
	.word	0xe42be320	! t0_kref+0x2efc:   	stb	%l2, [%o7 + 0x320]
	.word	0x81dbe320	! t0_kref+0x2f00:   	flush	%o7 + 0x320
	.word	0xa9a01090	! t0_kref+0x2f04:   	fxtos	%f16, %f20
	.word	0x293fb80a	! t0_kref+0x2f08:   	sethi	%hi(0xfee02800), %l4
	.word	0x92febf43	! t0_kref+0x2f0c:   	sdivcc	%i2, -0xbd, %o1
	.word	0xe610a03a	! t0_kref+0x2f10:   	lduh	[%g2 + 0x3a], %l3
	.word	0xd100a038	! t0_kref+0x2f14:   	ld	[%g2 + 0x38], %f8
	.word	0x91268000	! t0_kref+0x2f18:   	mulscc	%i2, %g0, %o0
	.word	0xad3b201f	! t0_kref+0x2f1c:   	sra	%o4, 0x1f, %l6
2:	.word	0xa9a3c8a8	! t0_kref+0x2f20:   	fsubs	%f15, %f8, %f20
	.word	0xd0062004	! t0_kref+0x2f24:   	ld	[%i0 + 4], %o0
	.word	0x91b50554	! t0_kref+0x2f28:   	fcmpeq16	%f20, %f20, %o0
	sethi	%hi(2f), %o7
	.word	0xe40be34c	! t0_kref+0x2f30:   	ldub	[%o7 + 0x34c], %l2
	.word	0xa41ca00c	! t0_kref+0x2f34:   	xor	%l2, 0xc, %l2
	.word	0xe42be34c	! t0_kref+0x2f38:   	stb	%l2, [%o7 + 0x34c]
	.word	0x81dbe34c	! t0_kref+0x2f3c:   	flush	%o7 + 0x34c
	.word	0xd828a023	! t0_kref+0x2f40:   	stb	%o4, [%g2 + 0x23]
	.word	0x9ba0052c	! t0_kref+0x2f44:   	fsqrts	%f12, %f13
	.word	0xec062000	! t0_kref+0x2f48:   	ld	[%i0], %l6
2:	.word	0xa9a01090	! t0_kref+0x2f4c:   	fxtos	%f16, %f20
	.word	0xec000019	! t0_kref+0x2f50:   	ld	[%g0 + %i1], %l6
	.word	0xaf66607c	! t0_kref+0x2f54:   	movne	%icc, 0x7c, %l7
	.word	0x9fa0052d	! t0_kref+0x2f58:   	fsqrts	%f13, %f15
	.word	0xe6062010	! t0_kref+0x2f5c:   	ld	[%i0 + 0x10], %l3
	.word	0x92a68000	! t0_kref+0x2f60:   	subcc	%i2, %g0, %o1
	.word	0x8143e040	! t0_kref+0x2f64:   	membar	0x40
	.word	0x83414000	! t0_kref+0x2f68:   	mov	%pc, %g1
	.word	0x92430000	! t0_kref+0x2f6c:   	addc	%o4, %g0, %o1
	.word	0xa85b2456	! t0_kref+0x2f70:   	smul	%o4, 0x456, %l4
	.word	0xf4a81018	! t0_kref+0x2f74:   	stba	%i2, [%g0 + %i0]0x80
	.word	0x93b0076c	! t0_kref+0x2f78:   	fpack16	%f12, %f9
	.word	0xac068000	! t0_kref+0x2f7c:   	add	%i2, %g0, %l6
	.word	0x11327d14	! t0_kref+0x2f80:   	sethi	%hi(0xc9f45000), %o0
	.word	0xfb6e401d	! t0_kref+0x2f84:   	prefetch	%i1 + %i5, 29
	.word	0xda20a018	! t0_kref+0x2f88:   	st	%o5, [%g2 + 0x18]
	.word	0xa1a208d0	! t0_kref+0x2f8c:   	fsubd	%f8, %f16, %f16
	.word	0x34800002	! t0_kref+0x2f90:   	bg,a	_kref+0x2f98
	.word	0xa6beba5e	! t0_kref+0x2f94:   	xnorcc	%i2, -0x5a2, %l3
	.word	0xa1b50a0e	! t0_kref+0x2f98:   	fpadd16	%f20, %f14, %f16
	.word	0xabb3405a	! t0_kref+0x2f9c:   	edge8l	%o5, %i2, %l5
	.word	0xf4767fe8	! t0_kref+0x2fa0:   	stx	%i2, [%i1 - 0x18]
	.word	0x9db50f48	! t0_kref+0x2fa4:   	fornot1	%f20, %f8, %f14
	.word	0xee167fea	! t0_kref+0x2fa8:   	lduh	[%i1 - 0x16], %l7
	.word	0xe5260000	! t0_kref+0x2fac:   	st	%f18, [%i0]
	.word	0x29480008	! t0_kref+0x2fb0:   	fbl,a,pt	%fcc0, _kref+0x2fd0
	.word	0x8143c000	! t0_kref+0x2fb4:   	stbar
	.word	0x95a5084a	! t0_kref+0x2fb8:   	faddd	%f20, %f10, %f10
	.word	0xe900a018	! t0_kref+0x2fbc:   	ld	[%g2 + 0x18], %f20
	.word	0xa9a4094c	! t0_kref+0x2fc0:   	fmuld	%f16, %f12, %f20
	.word	0xd0bf5019	! t0_kref+0x2fc4:   	stda	%o0, [%i5 + %i1]0x80
	.word	0x91400000	! t0_kref+0x2fc8:   	mov	%y, %o0
	.word	0x93a01a29	! t0_kref+0x2fcc:   	fstoi	%f9, %f9
	.word	0xd82e2016	! t0_kref+0x2fd0:   	stb	%o4, [%i0 + 0x16]
	.word	0xd010a030	! t0_kref+0x2fd4:   	lduh	[%g2 + 0x30], %o0
	.word	0xa3a01a4a	! t0_kref+0x2fd8:   	fdtoi	%f10, %f17
	.word	0x91a388ae	! t0_kref+0x2fdc:   	fsubs	%f14, %f14, %f8
	.word	0xda366010	! t0_kref+0x2fe0:   	sth	%o5, [%i1 + 0x10]
	.word	0xab400000	! t0_kref+0x2fe4:   	mov	%y, %l5
	.word	0xac96800d	! t0_kref+0x2fe8:   	orcc	%i2, %o5, %l6
	.word	0xeece101a	! t0_kref+0x2fec:   	ldsba	[%i0 + %i2]0x80, %l7
	.word	0x9023000c	! t0_kref+0x2ff0:   	sub	%o4, %o4, %o0
	.word	0x81aa0aae	! t0_kref+0x2ff4:   	fcmpes	%fcc0, %f8, %f14
	.word	0xad3b0000	! t0_kref+0x2ff8:   	sra	%o4, %g0, %l6
	.word	0x95b0017a	! t0_kref+0x2ffc:   	edge32ln	%g0, %i2, %o2
	.word	0xa8b03f68	! t0_kref+0x3000:   	orncc	%g0, -0x98, %l4
	.word	0x953b400d	! t0_kref+0x3004:   	sra	%o5, %o5, %o2
	.word	0x34480007	! t0_kref+0x3008:   	bg,a,pt	%icc, _kref+0x3024
	.word	0xc398a040	! t0_kref+0x300c:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xa1a0188a	! t0_kref+0x3010:   	fitos	%f10, %f16
	.word	0x929b0000	! t0_kref+0x3014:   	xorcc	%o4, %g0, %o1
	.word	0xeb00a008	! t0_kref+0x3018:   	ld	[%g2 + 8], %f21
	.word	0x94e37c54	! t0_kref+0x301c:   	subccc	%o5, -0x3ac, %o2
	.word	0xc768a00f	! t0_kref+0x3020:   	prefetch	%g2 + 0xf, 3
	.word	0x2c800004	! t0_kref+0x3024:   	bneg,a	_kref+0x3034
	.word	0xae800000	! t0_kref+0x3028:   	addcc	%g0, %g0, %l7
	.word	0xec08a001	! t0_kref+0x302c:   	ldub	[%g2 + 1], %l6
	.word	0xaa634000	! t0_kref+0x3030:   	subc	%o5, %g0, %l5
	.word	0xaa70000c	! t0_kref+0x3034:   	udiv	%g0, %o4, %l5
	.word	0xa5b20e14	! t0_kref+0x3038:   	fand	%f8, %f20, %f18
	.word	0x95a0052c	! t0_kref+0x303c:   	fsqrts	%f12, %f10
	.word	0xdf00a018	! t0_kref+0x3040:   	ld	[%g2 + 0x18], %f15
	.word	0x93b0009a	! t0_kref+0x3044:   	edge16	%g0, %i2, %o1
	.word	0xe81e3fe8	! t0_kref+0x3048:   	ldd	[%i0 - 0x18], %l4
	.word	0x81ab4a28	! t0_kref+0x304c:   	fcmps	%fcc0, %f13, %f8
	call	SYM(t0_subr0)
	.word	0x94630000	! t0_kref+0x3054:   	subc	%o4, %g0, %o2
	.word	0xa9b4c96b	! t0_kref+0x3058:   	fpmerge	%f19, %f11, %f20
	.word	0xdf070019	! t0_kref+0x305c:   	ld	[%i4 + %i1], %f15
	.word	0x9da000a8	! t0_kref+0x3060:   	fnegs	%f8, %f14
	.word	0xef6e7fe8	! t0_kref+0x3064:   	prefetch	%i1 - 0x18, 23
	.word	0xe408614c	! t0_kref+0x3068:   	ldub	[%g1 + 0x14c], %l2
	.word	0xa41ca00c	! t0_kref+0x306c:   	xor	%l2, 0xc, %l2
	.word	0xe428614c	! t0_kref+0x3070:   	stb	%l2, [%g1 + 0x14c]
	.word	0x81d8614c	! t0_kref+0x3074:   	flush	%g1 + 0x14c
	.word	0xc0266000	! t0_kref+0x3078:   	clr	[%i1]
	.word	0xc020a020	! t0_kref+0x307c:   	clr	[%g2 + 0x20]
	.word	0x92b83e24	! t0_kref+0x3080:   	xnorcc	%g0, -0x1dc, %o1
	.word	0xae3b400d	! t0_kref+0x3084:   	xnor	%o5, %o5, %l7
	.word	0x9da0190f	! t0_kref+0x3088:   	fitod	%f15, %f14
	.word	0xafb68280	! t0_kref+0x308c:   	array32	%i2, %g0, %l7
	.word	0xc030a03a	! t0_kref+0x3090:   	clrh	[%g2 + 0x3a]
	.word	0xd9f6501a	! t0_kref+0x3094:   	casxa	[%i1]0x80, %i2, %o4
	.word	0x97b40ea0	! t0_kref+0x3098:   	fsrc1s	%f16, %f11
	.word	0x951b2316	! t0_kref+0x309c:   	tsubcctv	%o4, 0x316, %o2
	.word	0x92a6801a	! t0_kref+0x30a0:   	subcc	%i2, %i2, %o1
	.word	0x81834000	! t0_kref+0x30a4:   	wr	%o5, %g0, %y
	.word	0x95aac02b	! t0_kref+0x30a8:   	fmovsge	%fcc0, %f11, %f10
	.word	0xaedeb54a	! t0_kref+0x30ac:   	smulcc	%i2, -0xab6, %l7
	.word	0xe51fbd90	! t0_kref+0x30b0:   	ldd	[%fp - 0x270], %f18
2:	.word	0xa8182215	! t0_kref+0x30b4:   	xor	%g0, 0x215, %l4
	.word	0xd448a029	! t0_kref+0x30b8:   	ldsb	[%g2 + 0x29], %o2
	.word	0xad0827f3	! t0_kref+0x30bc:   	tsubcc	%g0, 0x7f3, %l6
	.word	0xa7b00fe0	! t0_kref+0x30c0:   	fones	%f19
	.word	0x90c00000	! t0_kref+0x30c4:   	addccc	%g0, %g0, %o0
	.word	0x9da00032	! t0_kref+0x30c8:   	fmovs	%f18, %f14
	.word	0xf430a012	! t0_kref+0x30cc:   	sth	%i2, [%g2 + 0x12]
	.word	0x92600000	! t0_kref+0x30d0:   	subc	%g0, %g0, %o1
	.word	0x3b480006	! t0_kref+0x30d4:   	fble,a,pt	%fcc0, _kref+0x30ec
	.word	0xa5a01929	! t0_kref+0x30d8:   	fstod	%f9, %f18
	.word	0xe3270019	! t0_kref+0x30dc:   	st	%f17, [%i4 + %i1]
	.word	0xa1b246b4	! t0_kref+0x30e0:   	fmul8x16al	%f9, %f20, %f16
	.word	0xa618000d	! t0_kref+0x30e4:   	xor	%g0, %o5, %l3
	.word	0xa5a288b4	! t0_kref+0x30e8:   	fsubs	%f10, %f20, %f18
	.word	0xa8c332a8	! t0_kref+0x30ec:   	addccc	%o4, -0xd58, %l4
	.word	0xa5b3caf1	! t0_kref+0x30f0:   	fpsub32s	%f15, %f17, %f18
	.word	0xd20e7fe2	! t0_kref+0x30f4:   	ldub	[%i1 - 0x1e], %o1
	.word	0xe1bf1a58	! t0_kref+0x30f8:   	stda	%f16, [%i4 + %i0]0xd2
	.word	0x9400001a	! t0_kref+0x30fc:   	add	%g0, %i2, %o2
	.word	0xa1a0104a	! t0_kref+0x3100:   	fdtox	%f10, %f16
	.word	0xf4764000	! t0_kref+0x3104:   	stx	%i2, [%i1]
	.word	0x90d82325	! t0_kref+0x3108:   	smulcc	%g0, 0x325, %o0
	.word	0xa7b54c68	! t0_kref+0x310c:   	fnors	%f21, %f8, %f19
	.word	0x93b68200	! t0_kref+0x3110:   	array8	%i2, %g0, %o1
	.word	0xec00a028	! t0_kref+0x3114:   	ld	[%g2 + 0x28], %l6
	.word	0x9fa408aa	! t0_kref+0x3118:   	fsubs	%f16, %f10, %f15
	.word	0x2f480003	! t0_kref+0x311c:   	fbu,a,pt	%fcc0, _kref+0x3128
	.word	0x949b6a6c	! t0_kref+0x3120:   	xorcc	%o5, 0xa6c, %o2
	.word	0xa7a01a52	! t0_kref+0x3124:   	fdtoi	%f18, %f19
	.word	0x9fc00004	! t0_kref+0x3128:   	call	%g0 + %g4
	.word	0xa1a408a8	! t0_kref+0x312c:   	fsubs	%f16, %f8, %f16
	.word	0xe91fbe58	! t0_kref+0x3130:   	ldd	[%fp - 0x1a8], %f20
	.word	0xea680019	! t0_kref+0x3134:   	ldstub	[%g0 + %i1], %l5
	.word	0xa8f8000c	! t0_kref+0x3138:   	sdivcc	%g0, %o4, %l4
	.word	0xda28a033	! t0_kref+0x313c:   	stb	%o5, [%g2 + 0x33]
	.word	0xa1b40e80	! t0_kref+0x3140:   	fsrc1	%f16, %f16
	.word	0x81ac4ab5	! t0_kref+0x3144:   	fcmpes	%fcc0, %f17, %f21
	.word	0xe7270018	! t0_kref+0x3148:   	st	%f19, [%i4 + %i0]
	.word	0x920028a0	! t0_kref+0x314c:   	add	%g0, 0x8a0, %o1
	.word	0x9333401a	! t0_kref+0x3150:   	srl	%o5, %i2, %o1
	.word	0xd2067ff8	! t0_kref+0x3154:   	ld	[%i1 - 8], %o1
	.word	0xe500a020	! t0_kref+0x3158:   	ld	[%g2 + 0x20], %f18
	.word	0xa6fb000c	! t0_kref+0x315c:   	sdivcc	%o4, %o4, %l3
	.word	0x81dc2a8a	! t0_kref+0x3160:   	flush	%l0 + 0xa8a
	.word	0xd0de501d	! t0_kref+0x3164:   	ldxa	[%i1 + %i5]0x80, %o0
	.word	0x31480005	! t0_kref+0x3168:   	fba,a,pt	%fcc0, _kref+0x317c
	.word	0xd03e401d	! t0_kref+0x316c:   	std	%o0, [%i1 + %i5]
	.word	0x81ab4ab4	! t0_kref+0x3170:   	fcmpes	%fcc0, %f13, %f20
	.word	0xae032936	! t0_kref+0x3174:   	add	%o4, 0x936, %l7
	.word	0x130a7824	! t0_kref+0x3178:   	sethi	%hi(0x29e09000), %o1
	.word	0xa3a0012d	! t0_kref+0x317c:   	fabss	%f13, %f17
	.word	0x90368000	! t0_kref+0x3180:   	orn	%i2, %g0, %o0
	.word	0x81dd001a	! t0_kref+0x3184:   	flush	%l4 + %i2
	.word	0x99a0190c	! t0_kref+0x3188:   	fitod	%f12, %f12
	.word	0xee070018	! t0_kref+0x318c:   	ld	[%i4 + %i0], %l7
	.word	0x81aa8a4c	! t0_kref+0x3190:   	fcmpd	%fcc0, %f10, %f12
	.word	0xf4263ff0	! t0_kref+0x3194:   	st	%i2, [%i0 - 0x10]
	.word	0x91b34140	! t0_kref+0x3198:   	edge32l	%o5, %g0, %o0
	.word	0xf430a038	! t0_kref+0x319c:   	sth	%i2, [%g2 + 0x38]
	.word	0xd4ce9018	! t0_kref+0x31a0:   	ldsba	[%i2 + %i0]0x80, %o2
	.word	0xe3b8a080	! t0_kref+0x31a4:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xe6070018	! t0_kref+0x31a8:   	ld	[%i4 + %i0], %l3
	.word	0xd93e6018	! t0_kref+0x31ac:   	std	%f12, [%i1 + 0x18]
	.word	0x8143e040	! t0_kref+0x31b0:   	membar	0x40
	.word	0xa87b401a	! t0_kref+0x31b4:   	sdiv	%o5, %i2, %l4
	.word	0x26480006	! t0_kref+0x31b8:   	bl,a,pt	%icc, _kref+0x31d0
	.word	0xa1a3c9b2	! t0_kref+0x31bc:   	fdivs	%f15, %f18, %f16
	.word	0xa8e3000c	! t0_kref+0x31c0:   	subccc	%o4, %o4, %l4
	.word	0xac66b9a1	! t0_kref+0x31c4:   	subc	%i2, -0x65f, %l6
	.word	0xd2df5019	! t0_kref+0x31c8:   	ldxa	[%i5 + %i1]0x80, %o1
	.word	0xa9a0002e	! t0_kref+0x31cc:   	fmovs	%f14, %f20
	.word	0x81868000	! t0_kref+0x31d0:   	wr	%i2, %g0, %y
	.word	0xa85b316b	! t0_kref+0x31d4:   	smul	%o4, -0xe95, %l4
	.word	0xd210a012	! t0_kref+0x31d8:   	lduh	[%g2 + 0x12], %o1
	.word	0x9236a584	! t0_kref+0x31dc:   	orn	%i2, 0x584, %o1
	.word	0x94a379d9	! t0_kref+0x31e0:   	subcc	%o5, -0x627, %o2
	.word	0xe66e3ff5	! t0_kref+0x31e4:   	ldstub	[%i0 - 0xb], %l3
	.word	0xafb48590	! t0_kref+0x31e8:   	fcmpgt32	%f18, %f16, %l7
	.word	0xe920a010	! t0_kref+0x31ec:   	st	%f20, [%g2 + 0x10]
	.word	0xacbeb98c	! t0_kref+0x31f0:   	xnorcc	%i2, -0x674, %l6
	.word	0x95a44935	! t0_kref+0x31f4:   	fmuls	%f17, %f21, %f10
	.word	0x949e800c	! t0_kref+0x31f8:   	xorcc	%i2, %o4, %o2
	.word	0xff6e401d	! t0_kref+0x31fc:   	prefetch	%i1 + %i5, 31
	.word	0xabb0014c	! t0_kref+0x3200:   	edge32l	%g0, %o4, %l5
	.word	0xc0b01018	! t0_kref+0x3204:   	stha	%g0, [%g0 + %i0]0x80
	.word	0x9f414000	! t0_kref+0x3208:   	mov	%pc, %o7
	.word	0xd9000018	! t0_kref+0x320c:   	ld	[%g0 + %i0], %f12
	.word	0x9450001a	! t0_kref+0x3210:   	umul	%g0, %i2, %o2
	.word	0x91a20850	! t0_kref+0x3214:   	faddd	%f8, %f16, %f8
	.word	0x2d480005	! t0_kref+0x3218:   	fbg,a,pt	%fcc0, _kref+0x322c
	.word	0xac503b61	! t0_kref+0x321c:   	umul	%g0, -0x49f, %l6
	.word	0xee40a020	! t0_kref+0x3220:   	ldsw	[%g2 + 0x20], %l7
	.word	0x92b369af	! t0_kref+0x3224:   	orncc	%o5, 0x9af, %o1
	.word	0x953b201e	! t0_kref+0x3228:   	sra	%o4, 0x1e, %o2
	.word	0x3a480004	! t0_kref+0x322c:   	bcc,a,pt	%icc, _kref+0x323c
	.word	0xa71b2398	! t0_kref+0x3230:   	tsubcctv	%o4, 0x398, %l3
	.word	0xaf382001	! t0_kref+0x3234:   	sra	%g0, 0x1, %l7
	.word	0x95a34d2d	! t0_kref+0x3238:   	fsmuld	%f13, %f13, %f10
	.word	0xe640a018	! t0_kref+0x323c:   	ldsw	[%g2 + 0x18], %l3
	.word	0xd8ae1000	! t0_kref+0x3240:   	stba	%o4, [%i0]0x80
	.word	0xa69ebe60	! t0_kref+0x3244:   	xorcc	%i2, -0x1a0, %l3
	.word	0x9da488ca	! t0_kref+0x3248:   	fsubd	%f18, %f10, %f14
	.word	0xaa1b7518	! t0_kref+0x324c:   	xor	%o5, -0xae8, %l5
	.word	0xf42e0000	! t0_kref+0x3250:   	stb	%i2, [%i0]
	.word	0xa1a01a35	! t0_kref+0x3254:   	fstoi	%f21, %f16
	.word	0x2d480001	! t0_kref+0x3258:   	fbg,a,pt	%fcc0, _kref+0x325c
	.word	0xa5b54dea	! t0_kref+0x325c:   	fnands	%f21, %f10, %f18
	.word	0xa9a28954	! t0_kref+0x3260:   	fmuld	%f10, %f20, %f20
	.word	0xa7a289b1	! t0_kref+0x3264:   	fdivs	%f10, %f17, %f19
	.word	0x9056a855	! t0_kref+0x3268:   	umul	%i2, 0x855, %o0
	.word	0x2e480005	! t0_kref+0x326c:   	bvs,a,pt	%icc, _kref+0x3280
	.word	0x9db486ec	! t0_kref+0x3270:   	fmul8ulx16	%f18, %f12, %f14
	.word	0x9273400d	! t0_kref+0x3274:   	udiv	%o5, %o5, %o1
	.word	0xa71e801a	! t0_kref+0x3278:   	tsubcctv	%i2, %i2, %l3
	.word	0x20800008	! t0_kref+0x327c:   	bn,a	_kref+0x329c
	.word	0x9db38709	! t0_kref+0x3280:   	fmuld8sux16	%f14, %f9, %f14
	.word	0x94933d12	! t0_kref+0x3284:   	orcc	%o4, -0x2ee, %o2
	.word	0xafb3400d	! t0_kref+0x3288:   	edge8	%o5, %o5, %l7
	.word	0x90beba62	! t0_kref+0x328c:   	xnorcc	%i2, -0x59e, %o0
	.word	0xa6db4000	! t0_kref+0x3290:   	smulcc	%o5, %g0, %l3
	.word	0x81ab4a2e	! t0_kref+0x3294:   	fcmps	%fcc0, %f13, %f14
	.word	0xa3b34d2d	! t0_kref+0x3298:   	fandnot1s	%f13, %f13, %f17
	.word	0xac3b000d	! t0_kref+0x329c:   	xnor	%o4, %o5, %l6
	.word	0x947b001a	! t0_kref+0x32a0:   	sdiv	%o4, %i2, %o2
	.word	0xa9a348b1	! t0_kref+0x32a4:   	fsubs	%f13, %f17, %f20
	.word	0xa9a4c8ad	! t0_kref+0x32a8:   	fsubs	%f19, %f13, %f20
	.word	0x81aa4aac	! t0_kref+0x32ac:   	fcmpes	%fcc0, %f9, %f12
	.word	0x91b38494	! t0_kref+0x32b0:   	fcmple32	%f14, %f20, %o0
	.word	0x35480002	! t0_kref+0x32b4:   	fbue,a,pt	%fcc0, _kref+0x32bc
	.word	0x9da0002d	! t0_kref+0x32b8:   	fmovs	%f13, %f14
	.word	0xf4267fec	! t0_kref+0x32bc:   	st	%i2, [%i1 - 0x14]
	.word	0x94a03169	! t0_kref+0x32c0:   	subcc	%g0, -0xe97, %o2
	.word	0x39800004	! t0_kref+0x32c4:   	fbuge,a	_kref+0x32d4
	.word	0xf420a010	! t0_kref+0x32c8:   	st	%i2, [%g2 + 0x10]
	.word	0x33800003	! t0_kref+0x32cc:   	fbe,a	_kref+0x32d8
	.word	0xac43708b	! t0_kref+0x32d0:   	addc	%o5, -0xf75, %l6
	.word	0xd450a018	! t0_kref+0x32d4:   	ldsh	[%g2 + 0x18], %o2
	.word	0x923ea2b5	! t0_kref+0x32d8:   	xnor	%i2, 0x2b5, %o1
	.word	0xaaf839da	! t0_kref+0x32dc:   	sdivcc	%g0, -0x626, %l5
	.word	0xa1a288ca	! t0_kref+0x32e0:   	fsubd	%f10, %f10, %f16
	.word	0xed68a0cb	! t0_kref+0x32e4:   	prefetch	%g2 + 0xcb, 22
	.word	0xf16e7fe8	! t0_kref+0x32e8:   	prefetch	%i1 - 0x18, 24
	.word	0x90f83679	! t0_kref+0x32ec:   	sdivcc	%g0, -0x987, %o0
	.word	0xe848a013	! t0_kref+0x32f0:   	ldsb	[%g2 + 0x13], %l4
	.word	0xd820a010	! t0_kref+0x32f4:   	st	%o4, [%g2 + 0x10]
	.word	0xa8fb33db	! t0_kref+0x32f8:   	sdivcc	%o4, -0xc25, %l4
	.word	0xa1a0052d	! t0_kref+0x32fc:   	fsqrts	%f13, %f16
	.word	0xa646aa62	! t0_kref+0x3300:   	addc	%i2, 0xa62, %l3
	.word	0x9ba2c9ad	! t0_kref+0x3304:   	fdivs	%f11, %f13, %f13
	.word	0xa9a449ad	! t0_kref+0x3308:   	fdivs	%f17, %f13, %f20
	.word	0xa1b30d40	! t0_kref+0x330c:   	fnot1	%f12, %f16
	.word	0xd450a03a	! t0_kref+0x3310:   	ldsh	[%g2 + 0x3a], %o2
	.word	0xd2067fe0	! t0_kref+0x3314:   	ld	[%i1 - 0x20], %o1
	.word	0x81aa4a30	! t0_kref+0x3318:   	fcmps	%fcc0, %f9, %f16
	.word	0xe886501c	! t0_kref+0x331c:   	lda	[%i1 + %i4]0x80, %l4
	.word	0xacbb6c5c	! t0_kref+0x3320:   	xnorcc	%o5, 0xc5c, %l6
	.word	0x90c6b5cf	! t0_kref+0x3324:   	addccc	%i2, -0xa31, %o0
	.word	0xaa1ead57	! t0_kref+0x3328:   	xor	%i2, 0xd57, %l5
	.word	0xaeb0001a	! t0_kref+0x332c:   	orncc	%g0, %i2, %l7
	.word	0x90ab709d	! t0_kref+0x3330:   	andncc	%o5, -0xf63, %o0
	.word	0xae0b000c	! t0_kref+0x3334:   	and	%o4, %o4, %l7
	.word	0xabb2850c	! t0_kref+0x3338:   	fcmpgt16	%f10, %f12, %l5
	.word	0x32800001	! t0_kref+0x333c:   	bne,a	_kref+0x3340
	.word	0x9fa01a54	! t0_kref+0x3340:   	fdtoi	%f20, %f15
	.word	0x9ba00533	! t0_kref+0x3344:   	fsqrts	%f19, %f13
	.word	0x99b40dd0	! t0_kref+0x3348:   	fnand	%f16, %f16, %f12
	.word	0x9544c000	! t0_kref+0x334c:   	mov	%gsr, %o2
	.word	0xe840a018	! t0_kref+0x3350:   	ldsw	[%g2 + 0x18], %l4
	.word	0xe0f81018	! t0_kref+0x3354:   	swapa	[%g0 + %i0]0x80, %l0
	.word	0x81dbf593	! t0_kref+0x3358:   	flush	%o7 - 0xa6d
	.word	0xaba01a48	! t0_kref+0x335c:   	fdtoi	%f8, %f21
	.word	0x90db75b1	! t0_kref+0x3360:   	smulcc	%o5, -0xa4f, %o0
	.word	0xdd3f4019	! t0_kref+0x3364:   	std	%f14, [%i5 + %i1]
	.word	0x9db28f94	! t0_kref+0x3368:   	for	%f10, %f20, %f14
	.word	0xaab6ba93	! t0_kref+0x336c:   	orncc	%i2, -0x56d, %l5
	.word	0xe6871019	! t0_kref+0x3370:   	lda	[%i4 + %i1]0x80, %l3
	.word	0x81ac0aad	! t0_kref+0x3374:   	fcmpes	%fcc0, %f16, %f13
	.word	0xaba00532	! t0_kref+0x3378:   	fsqrts	%f18, %f21
	.word	0xaf3e800c	! t0_kref+0x337c:   	sra	%i2, %o4, %l7
	.word	0x9370000c	! t0_kref+0x3380:   	popc	%o4, %o1
	.word	0x9316a16e	! t0_kref+0x3384:   	taddcctv	%i2, 0x16e, %o1
	.word	0x95a209b5	! t0_kref+0x3388:   	fdivs	%f8, %f21, %f10
	.word	0xda20a030	! t0_kref+0x338c:   	st	%o5, [%g2 + 0x30]
	.word	0xa6583382	! t0_kref+0x3390:   	smul	%g0, -0xc7e, %l3
	.word	0x909ea20a	! t0_kref+0x3394:   	xorcc	%i2, 0x20a, %o0
	.word	0x31480005	! t0_kref+0x3398:   	fba,a,pt	%fcc0, _kref+0x33ac
	.word	0xd5262004	! t0_kref+0x339c:   	st	%f10, [%i0 + 4]
	.word	0x93b6803a	! t0_kref+0x33a0:   	edge8n	%i2, %i2, %o1
	.word	0xe3b8a040	! t0_kref+0x33a4:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x81830000	! t0_kref+0x33a8:   	wr	%o4, %g0, %y
	.word	0x99b0076e	! t0_kref+0x33ac:   	fpack16	%f14, %f12
	call	SYM(t0_subr2)
	.word	0x953b6000	! t0_kref+0x33b4:   	sra	%o5, 0x0, %o2
	.word	0xa1b4898e	! t0_kref+0x33b8:   	bshuffle	%f18, %f14, %f16
	.word	0x9fa4c834	! t0_kref+0x33bc:   	fadds	%f19, %f20, %f15
	.word	0xd300a008	! t0_kref+0x33c0:   	ld	[%g2 + 8], %f9
	.word	0x9da209b2	! t0_kref+0x33c4:   	fdivs	%f8, %f18, %f14
	.word	0x35480005	! t0_kref+0x33c8:   	fbue,a,pt	%fcc0, _kref+0x33dc
	.word	0x94fb37a0	! t0_kref+0x33cc:   	sdivcc	%o4, -0x860, %o2
	.word	0xa9a00128	! t0_kref+0x33d0:   	fabss	%f8, %f20
	.word	0xacb00000	! t0_kref+0x33d4:   	orncc	%g0, %g0, %l6
	.word	0x92b34000	! t0_kref+0x33d8:   	orncc	%o5, %g0, %o1
	.word	0xd4060000	! t0_kref+0x33dc:   	ld	[%i0], %o2
	.word	0xa9a000ad	! t0_kref+0x33e0:   	fnegs	%f13, %f20
	.word	0xa8c6b500	! t0_kref+0x33e4:   	addccc	%i2, -0xb00, %l4
	.word	0x9de3bfa0	! t0_kref+0x33e8:   	save	%sp, -0x60, %sp
	.word	0xa7ef70ed	! t0_kref+0x33ec:   	restore	%i5, -0xf13, %l3
	.word	0x9fa018d4	! t0_kref+0x33f0:   	fdtos	%f20, %f15
	.word	0x81b01025	! t0_kref+0x33f4:   	siam	0x5
	.word	0xaab3400d	! t0_kref+0x33f8:   	orncc	%o5, %o5, %l5
	.word	0xa5a01928	! t0_kref+0x33fc:   	fstod	%f8, %f18
	.word	0xe99eda59	! t0_kref+0x3400:   	ldda	[%i3 + %i1]0xd2, %f20
	.word	0xa9b40e14	! t0_kref+0x3404:   	fand	%f16, %f20, %f20
	sethi	%hi(2f), %o7
	.word	0xe40be01c	! t0_kref+0x340c:   	ldub	[%o7 + 0x1c], %l2
	.word	0xa41ca00c	! t0_kref+0x3410:   	xor	%l2, 0xc, %l2
	.word	0xe42be01c	! t0_kref+0x3414:   	stb	%l2, [%o7 + 0x1c]
	.word	0x81dbe01c	! t0_kref+0x3418:   	flush	%o7 + 0x1c
2:	.word	0xe700a000	! t0_kref+0x341c:   	ld	[%g2], %f19
	.word	0x81ac0a30	! t0_kref+0x3420:   	fcmps	%fcc0, %f16, %f16
	.word	0xd448a01b	! t0_kref+0x3424:   	ldsb	[%g2 + 0x1b], %o2
	.word	0xa8902920	! t0_kref+0x3428:   	orcc	%g0, 0x920, %l4
	.word	0xad33001a	! t0_kref+0x342c:   	srl	%o4, %i2, %l6
	.word	0xe3b8a040	! t0_kref+0x3430:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x81830000	! t0_kref+0x3434:   	wr	%o4, %g0, %y
	.word	0x81abca2b	! t0_kref+0x3438:   	fcmps	%fcc0, %f15, %f11
	.word	0xe886501c	! t0_kref+0x343c:   	lda	[%i1 + %i4]0x80, %l4
	.word	0xa9a0052a	! t0_kref+0x3440:   	fsqrts	%f10, %f20
	.word	0xa8b30000	! t0_kref+0x3444:   	orncc	%o4, %g0, %l4
	.word	0x9fa488b0	! t0_kref+0x3448:   	fsubs	%f18, %f16, %f15
	.word	0xe1be584c	! t0_kref+0x344c:   	stda	%f16, [%i1 + %o4]0xc2
	.word	0x9fa018cc	! t0_kref+0x3450:   	fdtos	%f12, %f15
	.word	0x95b30c4e	! t0_kref+0x3454:   	fnor	%f12, %f14, %f10
	.word	0xd1be1a5d	! t0_kref+0x3458:   	stda	%f8, [%i0 + %i5]0xd2
	.word	0xa1a209ad	! t0_kref+0x345c:   	fdivs	%f8, %f13, %f16
	.word	0x9ba000b4	! t0_kref+0x3460:   	fnegs	%f20, %f13
	.word	0x92c022e2	! t0_kref+0x3464:   	addccc	%g0, 0x2e2, %o1
	.word	0x95a00135	! t0_kref+0x3468:   	fabss	%f21, %f10
	.word	0xd20e7ffe	! t0_kref+0x346c:   	ldub	[%i1 - 2], %o1
	.word	0x95a01930	! t0_kref+0x3470:   	fstod	%f16, %f10
	.word	0x95a249ac	! t0_kref+0x3474:   	fdivs	%f9, %f12, %f10
	.word	0xa5a00530	! t0_kref+0x3478:   	fsqrts	%f16, %f18
	.word	0xa3a3c82a	! t0_kref+0x347c:   	fadds	%f15, %f10, %f17
	.word	0x90f8001a	! t0_kref+0x3480:   	sdivcc	%g0, %i2, %o0
	.word	0xa876bba3	! t0_kref+0x3484:   	udiv	%i2, -0x45d, %l4
	.word	0x945b000c	! t0_kref+0x3488:   	smul	%o4, %o4, %o2
	.word	0xec6e3ff6	! t0_kref+0x348c:   	ldstub	[%i0 - 0xa], %l6
	.word	0x93b3ccb0	! t0_kref+0x3490:   	fandnot2s	%f15, %f16, %f9
	.word	0xa5b44fb3	! t0_kref+0x3494:   	fors	%f17, %f19, %f18
	.word	0xa1b3cd30	! t0_kref+0x3498:   	fandnot1s	%f15, %f16, %f16
	.word	0x34800005	! t0_kref+0x349c:   	bg,a	_kref+0x34b0
	.word	0x953ea01d	! t0_kref+0x34a0:   	sra	%i2, 0x1d, %o2
	.word	0xa5a28948	! t0_kref+0x34a4:   	fmuld	%f10, %f8, %f18
	.word	0x92e3000d	! t0_kref+0x34a8:   	subccc	%o4, %o5, %o1
	.word	0xae38001a	! t0_kref+0x34ac:   	xnor	%g0, %i2, %l7
	.word	0x81da4018	! t0_kref+0x34b0:   	flush	%o1 + %i0
	.word	0x95a0190f	! t0_kref+0x34b4:   	fitod	%f15, %f10
	.word	0xa5b48dcc	! t0_kref+0x34b8:   	fnand	%f18, %f12, %f18
	.word	0xd1be5a5d	! t0_kref+0x34bc:   	stda	%f8, [%i1 + %i5]0xd2
	.word	0x902b2168	! t0_kref+0x34c0:   	andn	%o4, 0x168, %o0
	.word	0xaac34000	! t0_kref+0x34c4:   	addccc	%o5, %g0, %l5
	.word	0x95a01092	! t0_kref+0x34c8:   	fxtos	%f18, %f10
	.word	0x933b201a	! t0_kref+0x34cc:   	sra	%o4, 0x1a, %o1
	.word	0x86102001	! t0_kref+0x34d0:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x34d4:   	bne,a	_kref+0x34d4
	.word	0x86a0e001	! t0_kref+0x34d8:   	subcc	%g3, 1, %g3
	.word	0x9da00054	! t0_kref+0x34dc:   	fmovd	%f20, %f14
	.word	0x99a00535	! t0_kref+0x34e0:   	fsqrts	%f21, %f12
	.word	0xaa602014	! t0_kref+0x34e4:   	subc	%g0, 0x14, %l5
	.word	0xe6000019	! t0_kref+0x34e8:   	ld	[%g0 + %i1], %l3
	.word	0xee8e9018	! t0_kref+0x34ec:   	lduba	[%i2 + %i0]0x80, %l7
	.word	0xa64029db	! t0_kref+0x34f0:   	addc	%g0, 0x9db, %l3
	.word	0xd700a028	! t0_kref+0x34f4:   	ld	[%g2 + 0x28], %f11
	.word	0xff6e001d	! t0_kref+0x34f8:   	prefetch	%i0 + %i5, 31
	.word	0xd81e4000	! t0_kref+0x34fc:   	ldd	[%i1], %o4
	.word	0xaadebf4c	! t0_kref+0x3500:   	smulcc	%i2, -0xb4, %l5
	.word	0x91b4890c	! t0_kref+0x3504:   	faligndata	%f18, %f12, %f8
	.word	0xda7e600c	! t0_kref+0x3508:   	swap	[%i1 + 0xc], %o5
	.word	0xac1b67de	! t0_kref+0x350c:   	xor	%o5, 0x7de, %l6
	.word	0x91a01914	! t0_kref+0x3510:   	fitod	%f20, %f8
	.word	0xd2d0105b	! t0_kref+0x3514:   	ldsha	[%g0 + %i3]0x82, %o1
	.word	0xa666801a	! t0_kref+0x3518:   	subc	%i2, %i2, %l3
	.word	0x9206b297	! t0_kref+0x351c:   	add	%i2, -0xd69, %o1
	.word	0x29174c15	! t0_kref+0x3520:   	sethi	%hi(0x5d305400), %l4
	.word	0x3b480008	! t0_kref+0x3524:   	fble,a,pt	%fcc0, _kref+0x3544
	.word	0x97a01a2b	! t0_kref+0x3528:   	fstoi	%f11, %f11
	.word	0xaa268000	! t0_kref+0x352c:   	sub	%i2, %g0, %l5
	.word	0x29480004	! t0_kref+0x3530:   	fbl,a,pt	%fcc0, _kref+0x3540
	.word	0xa6feba22	! t0_kref+0x3534:   	sdivcc	%i2, -0x5de, %l3
	.word	0x99a28954	! t0_kref+0x3538:   	fmuld	%f10, %f20, %f12
	.word	0xaf132b4d	! t0_kref+0x353c:   	taddcctv	%o4, 0xb4d, %l7
	.word	0x90c0000c	! t0_kref+0x3540:   	addccc	%g0, %o4, %o0
	.word	0x81ad0a4c	! t0_kref+0x3544:   	fcmpd	%fcc0, %f20, %f12
	.word	0xea0e201e	! t0_kref+0x3548:   	ldub	[%i0 + 0x1e], %l5
	.word	0xec0e6001	! t0_kref+0x354c:   	ldub	[%i1 + 1], %l6
	.word	0xe26e7fe7	! t0_kref+0x3550:   	ldstub	[%i1 - 0x19], %l1
	.word	0xd20e8018	! t0_kref+0x3554:   	ldub	[%i2 + %i0], %o1
	.word	0x9fa01a54	! t0_kref+0x3558:   	fdtoi	%f20, %f15
	.word	0xe16e3ff0	! t0_kref+0x355c:   	prefetch	%i0 - 0x10, 16
	.word	0xda280019	! t0_kref+0x3560:   	stb	%o5, [%g0 + %i1]
	.word	0xdab61000	! t0_kref+0x3564:   	stha	%o5, [%i0]0x80
	.word	0x9ba01891	! t0_kref+0x3568:   	fitos	%f17, %f13
	.word	0x9ba00035	! t0_kref+0x356c:   	fmovs	%f21, %f13
	.word	0xda30a018	! t0_kref+0x3570:   	sth	%o5, [%g2 + 0x18]
	.word	0xaa3b3431	! t0_kref+0x3574:   	xnor	%o4, -0xbcf, %l5
	.word	0x93a00129	! t0_kref+0x3578:   	fabss	%f9, %f9
	.word	0xe67e7fe0	! t0_kref+0x357c:   	swap	[%i1 - 0x20], %l3
	.word	0xeb00a020	! t0_kref+0x3580:   	ld	[%g2 + 0x20], %f21
	.word	0xaac3000d	! t0_kref+0x3584:   	addccc	%o4, %o5, %l5
	.word	0xa7a00135	! t0_kref+0x3588:   	fabss	%f21, %f19
	.word	0xaf30000d	! t0_kref+0x358c:   	srl	%g0, %o5, %l7
	.word	0x93102c46	! t0_kref+0x3590:   	taddcctv	%g0, 0xc46, %o1
	.word	0x81ab8aa8	! t0_kref+0x3594:   	fcmpes	%fcc0, %f14, %f8
	.word	0x9fc00004	! t0_kref+0x3598:   	call	%g0 + %g4
	.word	0x81debdb7	! t0_kref+0x359c:   	flush	%i2 - 0x249
	.word	0xaa180000	! t0_kref+0x35a0:   	xor	%g0, %g0, %l5
	.word	0xee166004	! t0_kref+0x35a4:   	lduh	[%i1 + 4], %l7
	.word	0xe51e4000	! t0_kref+0x35a8:   	ldd	[%i1], %f18
	.word	0x90de8000	! t0_kref+0x35ac:   	smulcc	%i2, %g0, %o0
	.word	0x9073000c	! t0_kref+0x35b0:   	udiv	%o4, %o4, %o0
	.word	0x9496aa7f	! t0_kref+0x35b4:   	orcc	%i2, 0xa7f, %o2
	.word	0x91400000	! t0_kref+0x35b8:   	mov	%y, %o0
	.word	0x95a0104c	! t0_kref+0x35bc:   	fdtox	%f12, %f10
	.word	0xe610a022	! t0_kref+0x35c0:   	lduh	[%g2 + 0x22], %l3
	.word	0x81834000	! t0_kref+0x35c4:   	wr	%o5, %g0, %y
	.word	0xdf20a038	! t0_kref+0x35c8:   	st	%f15, [%g2 + 0x38]
	.word	0x90e6800c	! t0_kref+0x35cc:   	subccc	%i2, %o4, %o0
	.word	0xac58000c	! t0_kref+0x35d0:   	smul	%g0, %o4, %l6
	.word	0x87802080	! t0_kref+0x35d4:   	mov	0x80, %asi
	.word	0x9da50834	! t0_kref+0x35d8:   	fadds	%f20, %f20, %f14
	.word	0x81ddaf88	! t0_kref+0x35dc:   	flush	%l6 + 0xf88
	.word	0xec167fe0	! t0_kref+0x35e0:   	lduh	[%i1 - 0x20], %l6
	.word	0xec08a01b	! t0_kref+0x35e4:   	ldub	[%g2 + 0x1b], %l6
	.word	0xe3270018	! t0_kref+0x35e8:   	st	%f17, [%i4 + %i0]
	.word	0x81daa797	! t0_kref+0x35ec:   	flush	%o2 + 0x797
	.word	0xc028a01b	! t0_kref+0x35f0:   	clrb	[%g2 + 0x1b]
	.word	0xec5e3ff8	! t0_kref+0x35f4:   	ldx	[%i0 - 8], %l6
	.word	0xa9a0012c	! t0_kref+0x35f8:   	fabss	%f12, %f20
	.word	0xa7a0188d	! t0_kref+0x35fc:   	fitos	%f13, %f19
	.word	0x95a5084a	! t0_kref+0x3600:   	faddd	%f20, %f10, %f10
	.word	0xe968a082	! t0_kref+0x3604:   	prefetch	%g2 + 0x82, 20
	.word	0xa6be801a	! t0_kref+0x3608:   	xnorcc	%i2, %i2, %l3
	.word	0x94a6800d	! t0_kref+0x360c:   	subcc	%i2, %o5, %o2
	.word	0x91a48852	! t0_kref+0x3610:   	faddd	%f18, %f18, %f8
	.word	0x91b40e50	! t0_kref+0x3614:   	fxnor	%f16, %f16, %f8
	.word	0x94b3400d	! t0_kref+0x3618:   	orncc	%o5, %o5, %o2
	.word	0xa1a489b4	! t0_kref+0x361c:   	fdivs	%f18, %f20, %f16
	.word	0xa1a00031	! t0_kref+0x3620:   	fmovs	%f17, %f16
	.word	0xacdeb925	! t0_kref+0x3624:   	smulcc	%i2, -0x6db, %l6
	.word	0x91b6805a	! t0_kref+0x3628:   	edge8l	%i2, %i2, %o0
	.word	0xdd262018	! t0_kref+0x362c:   	st	%f14, [%i0 + 0x18]
!	.word	0x2cbf2271	! t0_kref+0x3630:   	bneg,a	SYM(t0_subr1)
	   	bneg,a	SYM(t0_subr1)
	.word	0x9f414000	! t0_kref+0x3634:   	mov	%pc, %o7
	.word	0xac9b000d	! t0_kref+0x3638:   	xorcc	%o4, %o5, %l6
	.word	0x90736b87	! t0_kref+0x363c:   	udiv	%o5, 0xb87, %o0
	.word	0xaab0000d	! t0_kref+0x3640:   	orncc	%g0, %o5, %l5
	.word	0x931337ae	! t0_kref+0x3644:   	taddcctv	%o4, -0x852, %o1
	.word	0x99a01a4c	! t0_kref+0x3648:   	fdtoi	%f12, %f12
	.word	0xda2e7ffc	! t0_kref+0x364c:   	stb	%o5, [%i1 - 4]
	.word	0xac636ad8	! t0_kref+0x3650:   	subc	%o5, 0xad8, %l6
	.word	0x31480006	! t0_kref+0x3654:   	fba,a,pt	%fcc0, _kref+0x366c
	.word	0xea0e3ff8	! t0_kref+0x3658:   	ldub	[%i0 - 8], %l5
	.word	0x99b00fe0	! t0_kref+0x365c:   	fones	%f12
	.word	0x39480006	! t0_kref+0x3660:   	fbuge,a,pt	%fcc0, _kref+0x3678
	.word	0xac9ea199	! t0_kref+0x3664:   	xorcc	%i2, 0x199, %l6
	.word	0xac8b0000	! t0_kref+0x3668:   	andcc	%o4, %g0, %l6
	.word	0xae3b0000	! t0_kref+0x366c:   	not	%o4, %l7
	.word	0x9da01a4c	! t0_kref+0x3670:   	fdtoi	%f12, %f14
	.word	0xe840a018	! t0_kref+0x3674:   	ldsw	[%g2 + 0x18], %l4
	.word	0xa8c0000d	! t0_kref+0x3678:   	addccc	%g0, %o5, %l4
	.word	0x21480003	! t0_kref+0x367c:   	fbn,a,pt	%fcc0, _kref+0x3688
	.word	0x93a3082a	! t0_kref+0x3680:   	fadds	%f12, %f10, %f9
	.word	0xa9a2c9ad	! t0_kref+0x3684:   	fdivs	%f11, %f13, %f20
	.word	0x9206b616	! t0_kref+0x3688:   	add	%i2, -0x9ea, %o1
	.word	0xe16e6018	! t0_kref+0x368c:   	prefetch	%i1 + 0x18, 16
	.word	0xac1ea505	! t0_kref+0x3690:   	xor	%i2, 0x505, %l6
	.word	0xe11e3ff8	! t0_kref+0x3694:   	ldd	[%i0 - 8], %f16
	.word	0xee10a03a	! t0_kref+0x3698:   	lduh	[%g2 + 0x3a], %l7
	.word	0x2c480007	! t0_kref+0x369c:   	bneg,a,pt	%icc, _kref+0x36b8
	.word	0xa6ab400d	! t0_kref+0x36a0:   	andncc	%o5, %o5, %l3
	.word	0x81aa4aa9	! t0_kref+0x36a4:   	fcmpes	%fcc0, %f9, %f9
	.word	0xd43e0000	! t0_kref+0x36a8:   	std	%o2, [%i0]
	.word	0xa6b6800d	! t0_kref+0x36ac:   	orncc	%i2, %o5, %l3
	.word	0x91a01935	! t0_kref+0x36b0:   	fstod	%f21, %f8
	.word	0xf430a02a	! t0_kref+0x36b4:   	sth	%i2, [%g2 + 0x2a]
	.word	0x9fa00029	! t0_kref+0x36b8:   	fmovs	%f9, %f15
	.word	0xae983ddf	! t0_kref+0x36bc:   	xorcc	%g0, -0x221, %l7
	.word	0x83414000	! t0_kref+0x36c0:   	mov	%pc, %g1
	.word	0xe1b81019	! t0_kref+0x36c4:   	stda	%f16, [%g0 + %i1]0x80
	.word	0x91b28e4a	! t0_kref+0x36c8:   	fxnor	%f10, %f10, %f8
	.word	0xae933b6f	! t0_kref+0x36cc:   	orcc	%o4, -0x491, %l7
	.word	0xa9a0192d	! t0_kref+0x36d0:   	fstod	%f13, %f20
	.word	0x95132e42	! t0_kref+0x36d4:   	taddcctv	%o4, 0xe42, %o2
	.word	0xa7a00532	! t0_kref+0x36d8:   	fsqrts	%f18, %f19
	.word	0xecd63ff4	! t0_kref+0x36dc:   	ldsha	[%i0 - 0xc]%asi, %l6
	.word	0xec1e7fe8	! t0_kref+0x36e0:   	ldd	[%i1 - 0x18], %l6
	.word	0xa9a20829	! t0_kref+0x36e4:   	fadds	%f8, %f9, %f20
	.word	0x99b48e80	! t0_kref+0x36e8:   	fsrc1	%f18, %f12
	.word	0xe91fbee8	! t0_kref+0x36ec:   	ldd	[%fp - 0x118], %f20
	.word	0xacab000d	! t0_kref+0x36f0:   	andncc	%o4, %o5, %l6
	.word	0x81ac4aaa	! t0_kref+0x36f4:   	fcmpes	%fcc0, %f17, %f10
	.word	0x99b00fc0	! t0_kref+0x36f8:   	fone	%f12
	.word	0xd19f1a59	! t0_kref+0x36fc:   	ldda	[%i4 + %i1]0xd2, %f8
	.word	0xe6080018	! t0_kref+0x3700:   	ldub	[%g0 + %i0], %l3
	.word	0xa938000d	! t0_kref+0x3704:   	sra	%g0, %o5, %l4
	.word	0xe6de3ff8	! t0_kref+0x3708:   	ldxa	[%i0 - 8]%asi, %l3
	.word	0xee863ff4	! t0_kref+0x370c:   	lda	[%i0 - 0xc]%asi, %l7
	.word	0x23800002	! t0_kref+0x3710:   	fbne,a	_kref+0x3718
	.word	0x93a0002a	! t0_kref+0x3714:   	fmovs	%f10, %f9
	.word	0xc96e4000	! t0_kref+0x3718:   	prefetch	%i1, 4
	.word	0xe888a013	! t0_kref+0x371c:   	lduba	[%g2 + 0x13]%asi, %l4
	.word	0xe4086088	! t0_kref+0x3720:   	ldub	[%g1 + 0x88], %l2
	.word	0xa41ca00c	! t0_kref+0x3724:   	xor	%l2, 0xc, %l2
	.word	0xe4286088	! t0_kref+0x3728:   	stb	%l2, [%g1 + 0x88]
	.word	0x81d86088	! t0_kref+0x372c:   	flush	%g1 + 0x88
	.word	0x81aa4a2b	! t0_kref+0x3730:   	fcmps	%fcc0, %f9, %f11
	.word	0xdb80a030	! t0_kref+0x3734:   	lda	[%g2 + 0x30]%asi, %f13
	.word	0x9ba0188c	! t0_kref+0x3738:   	fitos	%f12, %f13
	.word	0xae9b78a3	! t0_kref+0x373c:   	xorcc	%o5, -0x75d, %l7
	.word	0x91b3862a	! t0_kref+0x3740:   	fmul8x16	%f14, %f10, %f8
	.word	0xae96b5da	! t0_kref+0x3744:   	orcc	%i2, -0xa26, %l7
2:	.word	0x95b3008c	! t0_kref+0x3748:   	edge16	%o4, %o4, %o2
	.word	0xc5e8a080	! t0_kref+0x374c:   	prefetcha	%g2 + 0x80, 2
	.word	0xac3b000d	! t0_kref+0x3750:   	xnor	%o4, %o5, %l6
	.word	0x95408000	! t0_kref+0x3754:   	mov	%ccr, %o2
	.word	0xaf60001a	! t0_kref+0x3758:   	movn	%fcc0, %i2, %l7
	.word	0x9218000c	! t0_kref+0x375c:   	xor	%g0, %o4, %o1
	.word	0x91b304ca	! t0_kref+0x3760:   	fcmpne32	%f12, %f10, %o0
	.word	0xa3a01a29	! t0_kref+0x3764:   	fstoi	%f9, %f17
	.word	0xaba0052f	! t0_kref+0x3768:   	fsqrts	%f15, %f21
	.word	0x90583e17	! t0_kref+0x376c:   	smul	%g0, -0x1e9, %o0
	.word	0xad400000	! t0_kref+0x3770:   	mov	%y, %l6
	.word	0xd9be188c	! t0_kref+0x3774:   	stda	%f12, [%i0 + %o4]0xc4
	.word	0xaad82869	! t0_kref+0x3778:   	smulcc	%g0, 0x869, %l5
	.word	0x93b3408c	! t0_kref+0x377c:   	edge16	%o5, %o4, %o1
	.word	0x81ab8aaa	! t0_kref+0x3780:   	fcmpes	%fcc0, %f14, %f10
	.word	0xaf2b2010	! t0_kref+0x3784:   	sll	%o4, 0x10, %l7
	.word	0xd1064000	! t0_kref+0x3788:   	ld	[%i1], %f8
	.word	0xad400000	! t0_kref+0x378c:   	mov	%y, %l6
	.word	0x91b38f6e	! t0_kref+0x3790:   	fornot1s	%f14, %f14, %f8
	.word	0x92b0001a	! t0_kref+0x3794:   	orncc	%g0, %i2, %o1
	.word	0xa1a0052e	! t0_kref+0x3798:   	fsqrts	%f14, %f16
	.word	0xe700a018	! t0_kref+0x379c:   	ld	[%g2 + 0x18], %f19
	.word	0x270f2b38	! t0_kref+0x37a0:   	sethi	%hi(0x3cace000), %l3
	.word	0xaba00532	! t0_kref+0x37a4:   	fsqrts	%f18, %f21
	.word	0xa5a4c8b3	! t0_kref+0x37a8:   	fsubs	%f19, %f19, %f18
	.word	0xf42e200b	! t0_kref+0x37ac:   	stb	%i2, [%i0 + 0xb]
	.word	0xa7a00131	! t0_kref+0x37b0:   	fabss	%f17, %f19
	.word	0x941eb14b	! t0_kref+0x37b4:   	xor	%i2, -0xeb5, %o2
	.word	0x81830000	! t0_kref+0x37b8:   	wr	%o4, %g0, %y
	.word	0xe168a10c	! t0_kref+0x37bc:   	prefetch	%g2 + 0x10c, 16
	.word	0xd4167fe2	! t0_kref+0x37c0:   	lduh	[%i1 - 0x1e], %o2
	.word	0xf4367fe0	! t0_kref+0x37c4:   	sth	%i2, [%i1 - 0x20]
	.word	0x9223367a	! t0_kref+0x37c8:   	sub	%o4, -0x986, %o1
	.word	0x9fc10000	! t0_kref+0x37cc:   	call	%g4
	.word	0x91400000	! t0_kref+0x37d0:   	mov	%y, %o0
	.word	0xaa633186	! t0_kref+0x37d4:   	subc	%o4, -0xe7a, %l5
	.word	0x27362c98	! t0_kref+0x37d8:   	sethi	%hi(0xd8b26000), %l3
	.word	0x92737b05	! t0_kref+0x37dc:   	udiv	%o5, -0x4fb, %o1
	.word	0xaba01a2e	! t0_kref+0x37e0:   	fstoi	%f14, %f21
	.word	0xd03e401d	! t0_kref+0x37e4:   	std	%o0, [%i1 + %i5]
	.word	0x39480001	! t0_kref+0x37e8:   	fbuge,a,pt	%fcc0, _kref+0x37ec
	.word	0x95a408ce	! t0_kref+0x37ec:   	fsubd	%f16, %f14, %f10
	.word	0xa5b446ad	! t0_kref+0x37f0:   	fmul8x16al	%f17, %f13, %f18
	.word	0x93a000b2	! t0_kref+0x37f4:   	fnegs	%f18, %f9
	.word	0x9de3bfa0	! t0_kref+0x37f8:   	save	%sp, -0x60, %sp
	.word	0xabef4019	! t0_kref+0x37fc:   	restore	%i5, %i1, %l5
	.word	0xaf3b400c	! t0_kref+0x3800:   	sra	%o5, %o4, %l7
	.word	0xd580a030	! t0_kref+0x3804:   	lda	[%g2 + 0x30]%asi, %f10
	.word	0xa806beee	! t0_kref+0x3808:   	add	%i2, -0x112, %l4
	.word	0x81da001a	! t0_kref+0x380c:   	flush	%o0 + %i2
	.word	0xa783401a	! t0_kref+0x3810:   	wr	%o5, %i2, %gsr
	.word	0x90fea942	! t0_kref+0x3814:   	sdivcc	%i2, 0x942, %o0
	.word	0x93b6801a	! t0_kref+0x3818:   	edge8	%i2, %i2, %o1
	.word	0xc020a038	! t0_kref+0x381c:   	clr	[%g2 + 0x38]
	.word	0xa5a000ac	! t0_kref+0x3820:   	fnegs	%f12, %f18
	.word	0xa9b28a4e	! t0_kref+0x3824:   	fpadd32	%f10, %f14, %f20
	.word	0x81aa0a4a	! t0_kref+0x3828:   	fcmpd	%fcc0, %f8, %f10
	.word	0xa1a00030	! t0_kref+0x382c:   	fmovs	%f16, %f16
	.word	0xa9a00035	! t0_kref+0x3830:   	fmovs	%f21, %f20
	.word	0xafb6802d	! t0_kref+0x3834:   	edge8n	%i2, %o5, %l7
	.word	0x94b68000	! t0_kref+0x3838:   	orncc	%i2, %g0, %o2
	.word	0x2e480003	! t0_kref+0x383c:   	bvs,a,pt	%icc, _kref+0x3848
	.word	0xabb30020	! t0_kref+0x3840:   	edge8n	%o4, %g0, %l5
	.word	0x25480005	! t0_kref+0x3844:   	fblg,a,pt	%fcc0, _kref+0x3858
	.word	0xa3a288ae	! t0_kref+0x3848:   	fsubs	%f10, %f14, %f17
	.word	0x95a00032	! t0_kref+0x384c:   	fmovs	%f18, %f10
	.word	0xe9be1880	! t0_kref+0x3850:   	stda	%f20, [%i0]0xc4
	.word	0x91b48454	! t0_kref+0x3854:   	fcmpne16	%f18, %f20, %o0
	.word	0x81ad0a50	! t0_kref+0x3858:   	fcmpd	%fcc0, %f20, %f16
	.word	0x99a48950	! t0_kref+0x385c:   	fmuld	%f18, %f16, %f12
	.word	0xd9be9a19	! t0_kref+0x3860:   	stda	%f12, [%i2 + %i1]0xd0
	.word	0xac9b0000	! t0_kref+0x3864:   	xorcc	%o4, %g0, %l6
	.word	0xd0d0a02a	! t0_kref+0x3868:   	ldsha	[%g2 + 0x2a]%asi, %o0
	.word	0x272d688b	! t0_kref+0x386c:   	sethi	%hi(0xb5a22c00), %l3
	.word	0xa1a409ce	! t0_kref+0x3870:   	fdivd	%f16, %f14, %f16
	.word	0x95a5084a	! t0_kref+0x3874:   	faddd	%f20, %f10, %f10
	.word	0x81ac4ab2	! t0_kref+0x3878:   	fcmpes	%fcc0, %f17, %f18
	.word	0xe66e2012	! t0_kref+0x387c:   	ldstub	[%i0 + 0x12], %l3
	.word	0xabb34040	! t0_kref+0x3880:   	edge8l	%o5, %g0, %l5
	.word	0x941b35c8	! t0_kref+0x3884:   	xor	%o4, -0xa38, %o2
	sethi	%hi(1f), %o7
	jmpl	%o7+%lo(1f), %g1
	.empty
	.word	0x97a00133	! t0_kref+0x3890:   	fabss	%f19, %f11
1:	.word	0x95b30ecc	! t0_kref+0x3894:   	fornot2	%f12, %f12, %f10
	.word	0xa7168000	! t0_kref+0x3898:   	taddcctv	%i2, %g0, %l3
	.word	0xd250a010	! t0_kref+0x389c:   	ldsh	[%g2 + 0x10], %o1
	.word	0xd120a030	! t0_kref+0x38a0:   	st	%f8, [%g2 + 0x30]
	.word	0xaf3ea01e	! t0_kref+0x38a4:   	sra	%i2, 0x1e, %l7
	.word	0xd11fbe78	! t0_kref+0x38a8:   	ldd	[%fp - 0x188], %f8
	.word	0xd06e3fff	! t0_kref+0x38ac:   	ldstub	[%i0 - 1], %o0
	.word	0xaef82579	! t0_kref+0x38b0:   	sdivcc	%g0, 0x579, %l7
	.word	0xee064000	! t0_kref+0x38b4:   	ld	[%i1], %l7
	.word	0xd99f1a58	! t0_kref+0x38b8:   	ldda	[%i4 + %i0]0xd2, %f12
	.word	0x94d0226a	! t0_kref+0x38bc:   	umulcc	%g0, 0x26a, %o2
	.word	0x9544c000	! t0_kref+0x38c0:   	mov	%gsr, %o2
	.word	0xaec6801a	! t0_kref+0x38c4:   	addccc	%i2, %i2, %l7
	.word	0x97a00528	! t0_kref+0x38c8:   	fsqrts	%f8, %f11
	.word	0x9fa01a48	! t0_kref+0x38cc:   	fdtoi	%f8, %f15
	.word	0x81ad4a2d	! t0_kref+0x38d0:   	fcmps	%fcc0, %f21, %f13
	.word	0xd2c8a019	! t0_kref+0x38d4:   	ldsba	[%g2 + 0x19]%asi, %o1
	.word	0xae63400d	! t0_kref+0x38d8:   	subc	%o5, %o5, %l7
	.word	0xa6234000	! t0_kref+0x38dc:   	sub	%o5, %g0, %l3
	.word	0xae36800d	! t0_kref+0x38e0:   	orn	%i2, %o5, %l7
	.word	0xd836c019	! t0_kref+0x38e4:   	sth	%o4, [%i3 + %i1]
	.word	0xf4a0a010	! t0_kref+0x38e8:   	sta	%i2, [%g2 + 0x10]%asi
	.word	0x92402a62	! t0_kref+0x38ec:   	addc	%g0, 0xa62, %o1
	.word	0xfb6e001c	! t0_kref+0x38f0:   	prefetch	%i0 + %i4, 29
	.word	0xec80a018	! t0_kref+0x38f4:   	lda	[%g2 + 0x18]%asi, %l6
	.word	0x29480005	! t0_kref+0x38f8:   	fbl,a,pt	%fcc0, _kref+0x390c
	.word	0x99a01094	! t0_kref+0x38fc:   	fxtos	%f20, %f12
	.word	0x94d80000	! t0_kref+0x3900:   	smulcc	%g0, %g0, %o2
	.word	0x2f800006	! t0_kref+0x3904:   	fbu,a	_kref+0x391c
	.word	0xd9000018	! t0_kref+0x3908:   	ld	[%g0 + %i0], %f12
	.word	0xa7b5044a	! t0_kref+0x390c:   	fcmpne16	%f20, %f10, %l3
	.word	0xa93b2006	! t0_kref+0x3910:   	sra	%o4, 0x6, %l4
	.word	0x90b6bbe4	! t0_kref+0x3914:   	orncc	%i2, -0x41c, %o0
	.word	0xa8bb000d	! t0_kref+0x3918:   	xnorcc	%o4, %o5, %l4
	.word	0x99b2090e	! t0_kref+0x391c:   	faligndata	%f8, %f14, %f12
	.word	0x93a01a50	! t0_kref+0x3920:   	fdtoi	%f16, %f9
	.word	0xdd1e2010	! t0_kref+0x3924:   	ldd	[%i0 + 0x10], %f14
	.word	0x91a0052c	! t0_kref+0x3928:   	fsqrts	%f12, %f8
	.word	0xaca0000d	! t0_kref+0x392c:   	subcc	%g0, %o5, %l6
	.word	0xa1a0190e	! t0_kref+0x3930:   	fitod	%f14, %f16
	.word	0x93400000	! t0_kref+0x3934:   	mov	%y, %o1
	.word	0xf436c018	! t0_kref+0x3938:   	sth	%i2, [%i3 + %i0]
	.word	0xab400000	! t0_kref+0x393c:   	mov	%y, %l5
	.word	0xe800a020	! t0_kref+0x3940:   	ld	[%g2 + 0x20], %l4
	.word	0xe7066014	! t0_kref+0x3944:   	ld	[%i1 + 0x14], %f19
	.word	0x81ab8ab2	! t0_kref+0x3948:   	fcmpes	%fcc0, %f14, %f18
	.word	0x9ba0052b	! t0_kref+0x394c:   	fsqrts	%f11, %f13
	.word	0xe1be189a	! t0_kref+0x3950:   	stda	%f16, [%i0 + %i2]0xc4
	.word	0xaba249b4	! t0_kref+0x3954:   	fdivs	%f9, %f20, %f21
	.word	0xd1380018	! t0_kref+0x3958:   	std	%f8, [%g0 + %i0]
	.word	0xa89ea65b	! t0_kref+0x395c:   	xorcc	%i2, 0x65b, %l4
	.word	0xaa503da5	! t0_kref+0x3960:   	umul	%g0, -0x25b, %l5
	.word	0x81ddeb7c	! t0_kref+0x3964:   	flush	%l7 + 0xb7c
	.word	0xee48a00a	! t0_kref+0x3968:   	ldsb	[%g2 + 0xa], %l7
	.word	0xe608a011	! t0_kref+0x396c:   	ldub	[%g2 + 0x11], %l3
	.word	0x25480003	! t0_kref+0x3970:   	fblg,a,pt	%fcc0, _kref+0x397c
	.word	0x2d13e77c	! t0_kref+0x3974:   	sethi	%hi(0x4f9df000), %l6
	.word	0xc0b0a02a	! t0_kref+0x3978:   	stha	%g0, [%g2 + 0x2a]%asi
	.word	0xac38000c	! t0_kref+0x397c:   	xnor	%g0, %o4, %l6
	.word	0x2b480001	! t0_kref+0x3980:   	fbug,a,pt	%fcc0, _kref+0x3984
	.word	0x901b0000	! t0_kref+0x3984:   	xor	%o4, %g0, %o0
	.word	0x9da018cc	! t0_kref+0x3988:   	fdtos	%f12, %f14
	.word	0xaa800000	! t0_kref+0x398c:   	addcc	%g0, %g0, %l5
	.word	0xa93e8000	! t0_kref+0x3990:   	sra	%i2, %g0, %l4
	.word	0x95a388d2	! t0_kref+0x3994:   	fsubd	%f14, %f18, %f10
	.word	0x9083400c	! t0_kref+0x3998:   	addcc	%o5, %o4, %o0
	.word	0xac0ea1fc	! t0_kref+0x399c:   	and	%i2, 0x1fc, %l6
	.word	0xe6780018	! t0_kref+0x39a0:   	swap	[%g0 + %i0], %l3
	.word	0xd008a020	! t0_kref+0x39a4:   	ldub	[%g2 + 0x20], %o0
	.word	0x8586800c	! t0_kref+0x39a8:   	wr	%i2, %o4, %ccr
	.word	0x94903118	! t0_kref+0x39ac:   	orcc	%g0, -0xee8, %o2
	.word	0xa83b000c	! t0_kref+0x39b0:   	xnor	%o4, %o4, %l4
	.word	0x91a308d4	! t0_kref+0x39b4:   	fsubd	%f12, %f20, %f8
	.word	0xabb38512	! t0_kref+0x39b8:   	fcmpgt16	%f14, %f18, %l5
	.word	0xa93ea01b	! t0_kref+0x39bc:   	sra	%i2, 0x1b, %l4
	.word	0x3d480007	! t0_kref+0x39c0:   	fbule,a,pt	%fcc0, _kref+0x39dc
	.word	0x91a01933	! t0_kref+0x39c4:   	fstod	%f19, %f8
	.word	0x35480007	! t0_kref+0x39c8:   	fbue,a,pt	%fcc0, _kref+0x39e4
	.word	0x90e0000d	! t0_kref+0x39cc:   	subccc	%g0, %o5, %o0
	.word	0x9320001a	! t0_kref+0x39d0:   	mulscc	%g0, %i2, %o1
	.word	0xa6303b83	! t0_kref+0x39d4:   	orn	%g0, -0x47d, %l3
	.word	0xc1e8a100	! t0_kref+0x39d8:   	prefetcha	%g2 + 0x100, 0
	.word	0xa3a018d2	! t0_kref+0x39dc:   	fdtos	%f18, %f17
	.word	0xee48a029	! t0_kref+0x39e0:   	ldsb	[%g2 + 0x29], %l7
	.word	0xdb00a010	! t0_kref+0x39e4:   	ld	[%g2 + 0x10], %f13
	.word	0x9fa0012a	! t0_kref+0x39e8:   	fabss	%f10, %f15
	.word	0xe9b81018	! t0_kref+0x39ec:   	stda	%f20, [%g0 + %i0]0x80
	.word	0x9ba448b1	! t0_kref+0x39f0:   	fsubs	%f17, %f17, %f13
	.word	0x94db7853	! t0_kref+0x39f4:   	smulcc	%o5, -0x7ad, %o2
	.word	0xc020a030	! t0_kref+0x39f8:   	clr	[%g2 + 0x30]
	.word	0xa744c000	! t0_kref+0x39fc:   	mov	%gsr, %l3
	.word	0xa6e6a526	! t0_kref+0x3a00:   	subccc	%i2, 0x526, %l3
	.word	0x3f480003	! t0_kref+0x3a04:   	fbo,a,pt	%fcc0, _kref+0x3a10
	.word	0xe51fbd48	! t0_kref+0x3a08:   	ldd	[%fp - 0x2b8], %f18
	.word	0xac9b6adb	! t0_kref+0x3a0c:   	xorcc	%o5, 0xadb, %l6
	.word	0xda36c019	! t0_kref+0x3a10:   	sth	%o5, [%i3 + %i1]
	.word	0xa9b28c8e	! t0_kref+0x3a14:   	fandnot2	%f10, %f14, %f20
	.word	0x9db00fc0	! t0_kref+0x3a18:   	fone	%f14
	.word	0xae5b400d	! t0_kref+0x3a1c:   	smul	%o5, %o5, %l7
	.word	0xa6db7c85	! t0_kref+0x3a20:   	smulcc	%o5, -0x37b, %l3
	.word	0x81ac0a30	! t0_kref+0x3a24:   	fcmps	%fcc0, %f16, %f16
	.word	0x9276800c	! t0_kref+0x3a28:   	udiv	%i2, %o4, %o1
	.word	0xae66800c	! t0_kref+0x3a2c:   	subc	%i2, %o4, %l7
	.word	0xe6ee5000	! t0_kref+0x3a30:   	ldstuba	[%i1]0x80, %l3
	.word	0x9db00c00	! t0_kref+0x3a34:   	fzero	%f14
	.word	0xa5a00034	! t0_kref+0x3a38:   	fmovs	%f20, %f18
	.word	0xd4be7ff8	! t0_kref+0x3a3c:   	stda	%o2, [%i1 - 8]%asi
	.word	0x91a00034	! t0_kref+0x3a40:   	fmovs	%f20, %f8
	.word	0x95b44cb2	! t0_kref+0x3a44:   	fandnot2s	%f17, %f18, %f10
	.word	0xeaee6010	! t0_kref+0x3a48:   	ldstuba	[%i1 + 0x10]%asi, %l5
	.word	0x35480001	! t0_kref+0x3a4c:   	fbue,a,pt	%fcc0, _kref+0x3a50
	.word	0xd440a018	! t0_kref+0x3a50:   	ldsw	[%g2 + 0x18], %o2
	.word	0xf420a030	! t0_kref+0x3a54:   	st	%i2, [%g2 + 0x30]
	.word	0x90a369ed	! t0_kref+0x3a58:   	subcc	%o5, 0x9ed, %o0
	.word	0x2d480008	! t0_kref+0x3a5c:   	fbg,a,pt	%fcc0, _kref+0x3a7c
	.word	0x95b00774	! t0_kref+0x3a60:   	fpack16	%f20, %f10
	.word	0xa6600000	! t0_kref+0x3a64:   	subc	%g0, %g0, %l3
	.word	0xabb50590	! t0_kref+0x3a68:   	fcmpgt32	%f20, %f16, %l5
	.word	0xdf00a020	! t0_kref+0x3a6c:   	ld	[%g2 + 0x20], %f15
	.word	0x95b0035a	! t0_kref+0x3a70:   	alignaddrl	%g0, %i2, %o2
	.word	0xc038001d	! t0_kref+0x3a74:   	std	%g0, [%g0 + %i5]
	.word	0xd580a018	! t0_kref+0x3a78:   	lda	[%g2 + 0x18]%asi, %f10
	.word	0xa1a0190a	! t0_kref+0x3a7c:   	fitod	%f10, %f16
	.word	0x81830000	! t0_kref+0x3a80:   	wr	%o4, %g0, %y
	.word	0x9f414000	! t0_kref+0x3a84:   	mov	%pc, %o7
!	.word	0x3abf215b	! t0_kref+0x3a88:   	bcc,a	SYM(t0_subr1)
	   	bcc,a	SYM(t0_subr1)
	.word	0xaef8000c	! t0_kref+0x3a8c:   	sdivcc	%g0, %o4, %l7
	.word	0x91a01913	! t0_kref+0x3a90:   	fitod	%f19, %f8
	.word	0x9f414000	! t0_kref+0x3a94:   	mov	%pc, %o7
	.word	0xd4c81018	! t0_kref+0x3a98:   	ldsba	[%g0 + %i0]0x80, %o2
	.word	0xea7e0000	! t0_kref+0x3a9c:   	swap	[%i0], %l5
	.word	0x93b34160	! t0_kref+0x3aa0:   	edge32ln	%o5, %g0, %o1
	.word	0xf4a81019	! t0_kref+0x3aa4:   	stba	%i2, [%g0 + %i1]0x80
	.word	0xa93e801a	! t0_kref+0x3aa8:   	sra	%i2, %i2, %l4
	.word	0xa1a388d2	! t0_kref+0x3aac:   	fsubd	%f14, %f18, %f16
	.word	0x92330000	! t0_kref+0x3ab0:   	orn	%o4, %g0, %o1
	.word	0xaa1b401a	! t0_kref+0x3ab4:   	xor	%o5, %i2, %l5
	sethi	%hi(2f), %o7
	.word	0xe40be300	! t0_kref+0x3abc:   	ldub	[%o7 + 0x300], %l2
	.word	0xa41ca00c	! t0_kref+0x3ac0:   	xor	%l2, 0xc, %l2
	.word	0xe42be300	! t0_kref+0x3ac4:   	stb	%l2, [%o7 + 0x300]
	.word	0x81dbe300	! t0_kref+0x3ac8:   	flush	%o7 + 0x300
	.word	0xa1a01a35	! t0_kref+0x3acc:   	fstoi	%f21, %f16
	.word	0x91a0012e	! t0_kref+0x3ad0:   	fabss	%f14, %f8
	.word	0x81ab0aac	! t0_kref+0x3ad4:   	fcmpes	%fcc0, %f12, %f12
	.word	0x92503447	! t0_kref+0x3ad8:   	umul	%g0, -0xbb9, %o1
	.word	0xadb4858c	! t0_kref+0x3adc:   	fcmpgt32	%f18, %f12, %l6
	.word	0x2c480006	! t0_kref+0x3ae0:   	bneg,a,pt	%icc, _kref+0x3af8
	.word	0xa3a0002a	! t0_kref+0x3ae4:   	fmovs	%f10, %f17
	.word	0x94a8000c	! t0_kref+0x3ae8:   	andncc	%g0, %o4, %o2
	.word	0xc0362006	! t0_kref+0x3aec:   	clrh	[%i0 + 6]
	call	SYM(t0_subr0)
	.word	0xaafb400d	! t0_kref+0x3af4:   	sdivcc	%o5, %o5, %l5
	.word	0xf4ae7ff3	! t0_kref+0x3af8:   	stba	%i2, [%i1 - 0xd]%asi
	.word	0xd19e7ff0	! t0_kref+0x3afc:   	ldda	[%i1 - 0x10]%asi, %f8
2:	.word	0x927022e6	! t0_kref+0x3b00:   	udiv	%g0, 0x2e6, %o1
	.word	0xa5a4094e	! t0_kref+0x3b04:   	fmuld	%f16, %f14, %f18
	.word	0x9de3bfa0	! t0_kref+0x3b08:   	save	%sp, -0x60, %sp
	.word	0x91ee2516	! t0_kref+0x3b0c:   	restore	%i0, 0x516, %o0
	.word	0x29480006	! t0_kref+0x3b10:   	fbl,a,pt	%fcc0, _kref+0x3b28
	.word	0x902e800d	! t0_kref+0x3b14:   	andn	%i2, %o5, %o0
	.word	0x9fb54db3	! t0_kref+0x3b18:   	fxors	%f21, %f19, %f15
	.word	0xd2070018	! t0_kref+0x3b1c:   	ld	[%i4 + %i0], %o1
	.word	0x94bb000c	! t0_kref+0x3b20:   	xnorcc	%o4, %o4, %o2
	.word	0xa5b30e4a	! t0_kref+0x3b24:   	fxnor	%f12, %f10, %f18
	.word	0x8143e040	! t0_kref+0x3b28:   	membar	0x40
	.word	0x95b386cc	! t0_kref+0x3b2c:   	fmul8sux16	%f14, %f12, %f10
	.word	0x93a289b1	! t0_kref+0x3b30:   	fdivs	%f10, %f17, %f9
	.word	0xa5a408d2	! t0_kref+0x3b34:   	fsubd	%f16, %f18, %f18
	.word	0x9043000d	! t0_kref+0x3b38:   	addc	%o4, %o5, %o0
	.word	0x81ab4a31	! t0_kref+0x3b3c:   	fcmps	%fcc0, %f13, %f17
	.word	0xa898000d	! t0_kref+0x3b40:   	xorcc	%g0, %o5, %l4
	.word	0xae9e800d	! t0_kref+0x3b44:   	xorcc	%i2, %o5, %l7
	.word	0xd66e3ff9	! t0_kref+0x3b48:   	ldstub	[%i0 - 7], %o3
	.word	0x99b24975	! t0_kref+0x3b4c:   	fpmerge	%f9, %f21, %f12
	.word	0xec867fe4	! t0_kref+0x3b50:   	lda	[%i1 - 0x1c]%asi, %l6
	.word	0x3c800001	! t0_kref+0x3b54:   	bpos,a	_kref+0x3b58
	.word	0xac368000	! t0_kref+0x3b58:   	orn	%i2, %g0, %l6
	.word	0xda7e7ffc	! t0_kref+0x3b5c:   	swap	[%i1 - 4], %o5
	.word	0x81868000	! t0_kref+0x3b60:   	wr	%i2, %g0, %y
	.word	0xa8c0001a	! t0_kref+0x3b64:   	addccc	%g0, %i2, %l4
	.word	0x9058000d	! t0_kref+0x3b68:   	smul	%g0, %o5, %o0
	.word	0x81de4015	! t0_kref+0x3b6c:   	flush	%i1 + %l5
	.word	0x99a30832	! t0_kref+0x3b70:   	fadds	%f12, %f18, %f12
	.word	0xec060000	! t0_kref+0x3b74:   	ld	[%i0], %l6
	.word	0x947b401a	! t0_kref+0x3b78:   	sdiv	%o5, %i2, %o2
	.word	0xa5a388cc	! t0_kref+0x3b7c:   	fsubd	%f14, %f12, %f18
	.word	0x9ba509b0	! t0_kref+0x3b80:   	fdivs	%f20, %f16, %f13
	.word	0xe9be3fe0	! t0_kref+0x3b84:   	stda	%f20, [%i0 - 0x20]%asi
	.word	0x81def845	! t0_kref+0x3b88:   	flush	%i3 - 0x7bb
	.word	0x92c68000	! t0_kref+0x3b8c:   	addccc	%i2, %g0, %o1
	.word	0x9db28f88	! t0_kref+0x3b90:   	for	%f10, %f8, %f14
	.word	0xe91e401d	! t0_kref+0x3b94:   	ldd	[%i1 + %i5], %f20
	.word	0xa9a308cc	! t0_kref+0x3b98:   	fsubd	%f12, %f12, %f20
	.word	0xb410200c	! t0_kref+0x3b9c:   	mov	0xc, %i2
	.word	0x81868000	! t0_kref+0x3ba0:   	wr	%i2, %g0, %y
	.word	0x99a00532	! t0_kref+0x3ba4:   	fsqrts	%f18, %f12
	.word	0x81ac4a2e	! t0_kref+0x3ba8:   	fcmps	%fcc0, %f17, %f14
	.word	0xac9e800c	! t0_kref+0x3bac:   	xorcc	%i2, %o4, %l6
	.word	0xd43e2010	! t0_kref+0x3bb0:   	std	%o2, [%i0 + 0x10]
	.word	0x91002caf	! t0_kref+0x3bb4:   	taddcc	%g0, 0xcaf, %o0
	.word	0xa6b00000	! t0_kref+0x3bb8:   	orncc	%g0, %g0, %l3
	.word	0xd1262000	! t0_kref+0x3bbc:   	st	%f8, [%i0]
	.word	0xa8bb3e96	! t0_kref+0x3bc0:   	xnorcc	%o4, -0x16a, %l4
	.word	0x95a01a54	! t0_kref+0x3bc4:   	fdtoi	%f20, %f10
	.word	0xe6d0a012	! t0_kref+0x3bc8:   	ldsha	[%g2 + 0x12]%asi, %l3
	.word	0x9bb34aee	! t0_kref+0x3bcc:   	fpsub32s	%f13, %f14, %f13
	.word	0xea7e3fe8	! t0_kref+0x3bd0:   	swap	[%i0 - 0x18], %l5
	.word	0xa600000c	! t0_kref+0x3bd4:   	add	%g0, %o4, %l3
	.word	0x93a01a28	! t0_kref+0x3bd8:   	fstoi	%f8, %f9
	.word	0x9fa01a30	! t0_kref+0x3bdc:   	fstoi	%f16, %f15
	.word	0x21480006	! t0_kref+0x3be0:   	fbn,a,pt	%fcc0, _kref+0x3bf8
	.word	0xadb6834c	! t0_kref+0x3be4:   	alignaddrl	%i2, %o4, %l6
	.word	0xa5a01110	! t0_kref+0x3be8:   	fxtod	%f16, %f18
	.word	0xa6100000	! t0_kref+0x3bec:   	clr	%l3
	.word	0xad3e800d	! t0_kref+0x3bf0:   	sra	%i2, %o5, %l6
	.word	0xae9b2f1d	! t0_kref+0x3bf4:   	xorcc	%o4, 0xf1d, %l7
	.word	0xefe8a101	! t0_kref+0x3bf8:   	prefetcha	%g2 + 0x101, 23
	.word	0xd0d65000	! t0_kref+0x3bfc:   	ldsha	[%i1]0x80, %o0
	.word	0xac6362b1	! t0_kref+0x3c00:   	subc	%o5, 0x2b1, %l6
	.word	0x81ab4a2b	! t0_kref+0x3c04:   	fcmps	%fcc0, %f13, %f11
	.word	0xe9a0a030	! t0_kref+0x3c08:   	sta	%f20, [%g2 + 0x30]%asi
	.word	0xd100a000	! t0_kref+0x3c0c:   	ld	[%g2], %f8
	.word	0xe40863b4	! t0_kref+0x3c10:   	ldub	[%g1 + 0x3b4], %l2
	.word	0xa41ca00c	! t0_kref+0x3c14:   	xor	%l2, 0xc, %l2
	.word	0xe42863b4	! t0_kref+0x3c18:   	stb	%l2, [%g1 + 0x3b4]
	.word	0x81d863b4	! t0_kref+0x3c1c:   	flush	%g1 + 0x3b4
	.word	0x99b2c975	! t0_kref+0x3c20:   	fpmerge	%f11, %f21, %f12
	.word	0xa1b40f94	! t0_kref+0x3c24:   	for	%f16, %f20, %f16
	.word	0x97a0052a	! t0_kref+0x3c28:   	fsqrts	%f10, %f11
	.word	0xc020a030	! t0_kref+0x3c2c:   	clr	[%g2 + 0x30]
	.word	0xe968a109	! t0_kref+0x3c30:   	prefetch	%g2 + 0x109, 20
	.word	0x99a01a2b	! t0_kref+0x3c34:   	fstoi	%f11, %f12
	.word	0xa3a01a29	! t0_kref+0x3c38:   	fstoi	%f9, %f17
	.word	0xe8062010	! t0_kref+0x3c3c:   	ld	[%i0 + 0x10], %l4
2:	.word	0xa063362e	! t0_kref+0x3c40:   	subc	%o4, -0x9d2, %l0
	.word	0x29800006	! t0_kref+0x3c44:   	fbl,a	_kref+0x3c5c
	.word	0x93b285ce	! t0_kref+0x3c48:   	fcmpeq32	%f10, %f14, %o1
	.word	0xae00001a	! t0_kref+0x3c4c:   	add	%g0, %i2, %l7
	.word	0x945ea062	! t0_kref+0x3c50:   	smul	%i2, 0x62, %o2
	.word	0x9db30af2	! t0_kref+0x3c54:   	fpsub32s	%f12, %f18, %f14
	.word	0xee40a030	! t0_kref+0x3c58:   	ldsw	[%g2 + 0x30], %l7
	.word	0x95b68280	! t0_kref+0x3c5c:   	array32	%i2, %g0, %o2
	.word	0xad0b000c	! t0_kref+0x3c60:   	tsubcc	%o4, %o4, %l6
	.word	0xec40a018	! t0_kref+0x3c64:   	ldsw	[%g2 + 0x18], %l6
	.word	0x925e800d	! t0_kref+0x3c68:   	smul	%i2, %o5, %o1
	.word	0x91b286ee	! t0_kref+0x3c6c:   	fmul8ulx16	%f10, %f14, %f8
	.word	0x81aa4a34	! t0_kref+0x3c70:   	fcmps	%fcc0, %f9, %f20
	call	SYM(t0_subr2)
	.word	0xf4200019	! t0_kref+0x3c78:   	st	%i2, [%g0 + %i1]
	.word	0x87802080	! t0_kref+0x3c7c:   	mov	0x80, %asi
	.word	0x91a4082f	! t0_kref+0x3c80:   	fadds	%f16, %f15, %f8
	.word	0xa9b3015a	! t0_kref+0x3c84:   	edge32l	%o4, %i2, %l4
	.word	0x9da9404e	! t0_kref+0x3c88:   	fmovdug	%fcc0, %f14, %f14
	.word	0xa7a00134	! t0_kref+0x3c8c:   	fabss	%f20, %f19
	.word	0xa1a4c82f	! t0_kref+0x3c90:   	fadds	%f19, %f15, %f16
	.word	0x9446800c	! t0_kref+0x3c94:   	addc	%i2, %o4, %o2
	.word	0x90780000	! t0_kref+0x3c98:   	sdiv	%g0, %g0, %o0
	.word	0x8143e040	! t0_kref+0x3c9c:   	membar	0x40
	.word	0xa3b007b2	! t0_kref+0x3ca0:   	fpackfix	%f18, %f17
	.word	0xea7f0019	! t0_kref+0x3ca4:   	swap	[%i4 + %i1], %l5
	.word	0x903b000c	! t0_kref+0x3ca8:   	xnor	%o4, %o4, %o0
	.word	0x81ad4a29	! t0_kref+0x3cac:   	fcmps	%fcc0, %f21, %f9
	.word	0xd9be1a5d	! t0_kref+0x3cb0:   	stda	%f12, [%i0 + %i5]0xd2
	.word	0xc12e2000	! t0_kref+0x3cb4:   	st	%fsr, [%i0]
	.word	0x9da508ca	! t0_kref+0x3cb8:   	fsubd	%f20, %f10, %f14
	.word	0x92536c4e	! t0_kref+0x3cbc:   	umul	%o5, 0xc4e, %o1
	.word	0xafb3002c	! t0_kref+0x3cc0:   	edge8n	%o4, %o4, %l7
	.word	0x31480001	! t0_kref+0x3cc4:   	fba,a,pt	%fcc0, _kref+0x3cc8
	.word	0xd2063fe0	! t0_kref+0x3cc8:   	ld	[%i0 - 0x20], %o1
	.word	0x81ac8ab5	! t0_kref+0x3ccc:   	fcmpes	%fcc0, %f18, %f21
	.word	0x86102004	! t0_kref+0x3cd0:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x3cd4:   	bne,a	_kref+0x3cd4
	.word	0x86a0e001	! t0_kref+0x3cd8:   	subcc	%g3, 1, %g3
	.word	0xf420a030	! t0_kref+0x3cdc:   	st	%i2, [%g2 + 0x30]
	.word	0x91a3482e	! t0_kref+0x3ce0:   	fadds	%f13, %f14, %f8
	.word	0x21800006	! t0_kref+0x3ce4:   	fbn,a	_kref+0x3cfc
	.word	0x92b3000c	! t0_kref+0x3ce8:   	orncc	%o4, %o4, %o1
	.word	0xea10a020	! t0_kref+0x3cec:   	lduh	[%g2 + 0x20], %l5
	.word	0x9fb00772	! t0_kref+0x3cf0:   	fpack16	%f18, %f15
	.word	0xdfa6501c	! t0_kref+0x3cf4:   	sta	%f15, [%i1 + %i4]0x80
	.word	0xe6163fe8	! t0_kref+0x3cf8:   	lduh	[%i0 - 0x18], %l3
	.word	0xea7e3ff8	! t0_kref+0x3cfc:   	swap	[%i0 - 8], %l5
	.word	0xd13f4018	! t0_kref+0x3d00:   	std	%f8, [%i5 + %i0]
	.word	0xa6a3001a	! t0_kref+0x3d04:   	subcc	%o4, %i2, %l3
	.word	0x93a0052b	! t0_kref+0x3d08:   	fsqrts	%f11, %f9
	.word	0xc16e000c	! t0_kref+0x3d0c:   	prefetch	%i0 + %o4, 0
	.word	0xaba018d2	! t0_kref+0x3d10:   	fdtos	%f18, %f21
	.word	0xdb00a010	! t0_kref+0x3d14:   	ld	[%g2 + 0x10], %f13
	.word	0xa5a30835	! t0_kref+0x3d18:   	fadds	%f12, %f21, %f18
	.word	0xa8b3001a	! t0_kref+0x3d1c:   	orncc	%o4, %i2, %l4
	.word	0x95b40588	! t0_kref+0x3d20:   	fcmpgt32	%f16, %f8, %o2
	.word	0xac90000c	! t0_kref+0x3d24:   	orcc	%g0, %o4, %l6
	.word	0x950b001a	! t0_kref+0x3d28:   	tsubcc	%o4, %i2, %o2
	.word	0x2a480002	! t0_kref+0x3d2c:   	bcs,a,pt	%icc, _kref+0x3d34
	.word	0x99a01a28	! t0_kref+0x3d30:   	fstoi	%f8, %f12
	.word	0xea167ffc	! t0_kref+0x3d34:   	lduh	[%i1 - 4], %l5
	.word	0xad0ea44b	! t0_kref+0x3d38:   	tsubcc	%i2, 0x44b, %l6
	.word	0x921ea2a9	! t0_kref+0x3d3c:   	xor	%i2, 0x2a9, %o1
	.word	0xd66e7fe1	! t0_kref+0x3d40:   	ldstub	[%i1 - 0x1f], %o3
	.word	0xb4103ff7	! t0_kref+0x3d44:   	mov	0xfffffff7, %i2
	.word	0x23480004	! t0_kref+0x3d48:   	fbne,a,pt	%fcc0, _kref+0x3d58
	.word	0xdb062000	! t0_kref+0x3d4c:   	ld	[%i0], %f13
	.word	0xa5a488b0	! t0_kref+0x3d50:   	fsubs	%f18, %f16, %f18
	.word	0xe2ee501a	! t0_kref+0x3d54:   	ldstuba	[%i1 + %i2]0x80, %l1
	.word	0x951b400d	! t0_kref+0x3d58:   	tsubcctv	%o5, %o5, %o2
	.word	0x95b40d60	! t0_kref+0x3d5c:   	fnot1s	%f16, %f10
	.word	0xe87e0000	! t0_kref+0x3d60:   	swap	[%i0], %l4
	.word	0xec6e8018	! t0_kref+0x3d64:   	ldstub	[%i2 + %i0], %l6
	.word	0xc0a0a030	! t0_kref+0x3d68:   	sta	%g0, [%g2 + 0x30]%asi
	.word	0xdb062004	! t0_kref+0x3d6c:   	ld	[%i0 + 4], %f13
	.word	0x9da01112	! t0_kref+0x3d70:   	fxtod	%f18, %f14
	.word	0x92fb001a	! t0_kref+0x3d74:   	sdivcc	%o4, %i2, %o1
	.word	0xac83001a	! t0_kref+0x3d78:   	addcc	%o4, %i2, %l6
	.word	0xeeee601b	! t0_kref+0x3d7c:   	ldstuba	[%i1 + 0x1b]%asi, %l7
	.word	0xdaa0a038	! t0_kref+0x3d80:   	sta	%o5, [%g2 + 0x38]%asi
	.word	0x9db40f48	! t0_kref+0x3d84:   	fornot1	%f16, %f8, %f14
	.word	0xe1beda19	! t0_kref+0x3d88:   	stda	%f16, [%i3 + %i1]0xd0
	.word	0xa1a308a9	! t0_kref+0x3d8c:   	fsubs	%f12, %f9, %f16
	.word	0x81dd2074	! t0_kref+0x3d90:   	flush	%l4 + 0x74
	.word	0x9db24974	! t0_kref+0x3d94:   	fpmerge	%f9, %f20, %f14
	.word	0xa5a0012a	! t0_kref+0x3d98:   	fabss	%f10, %f18
	.word	0x35480004	! t0_kref+0x3d9c:   	fbue,a,pt	%fcc0, _kref+0x3dac
	.word	0xa783001a	! t0_kref+0x3da0:   	wr	%o4, %i2, %gsr
	.word	0xa8a33b97	! t0_kref+0x3da4:   	subcc	%o4, -0x469, %l4
	.word	0xeb067ff0	! t0_kref+0x3da8:   	ld	[%i1 - 0x10], %f21
	.word	0x9da00532	! t0_kref+0x3dac:   	fsqrts	%f18, %f14
	.word	0xaf3ea006	! t0_kref+0x3db0:   	sra	%i2, 0x6, %l7
	.word	0xaabb400c	! t0_kref+0x3db4:   	xnorcc	%o5, %o4, %l5
	.word	0x9206801a	! t0_kref+0x3db8:   	add	%i2, %i2, %o1
	.word	0x928b7242	! t0_kref+0x3dbc:   	andcc	%o5, -0xdbe, %o1
	.word	0xf4300019	! t0_kref+0x3dc0:   	sth	%i2, [%g0 + %i1]
	.word	0xaef83983	! t0_kref+0x3dc4:   	sdivcc	%g0, -0x67d, %l7
	.word	0x9fa0002b	! t0_kref+0x3dc8:   	fmovs	%f11, %f15
	.word	0x9de3bfa0	! t0_kref+0x3dcc:   	save	%sp, -0x60, %sp
	.word	0xb41f401d	! t0_kref+0x3dd0:   	xor	%i5, %i5, %i2
	.word	0xa7eea9c0	! t0_kref+0x3dd4:   	restore	%i2, 0x9c0, %l3
	.word	0xd280a030	! t0_kref+0x3dd8:   	lda	[%g2 + 0x30]%asi, %o1
	.word	0xae9b22a9	! t0_kref+0x3ddc:   	xorcc	%o4, 0x2a9, %l7
	.word	0xf420a008	! t0_kref+0x3de0:   	st	%i2, [%g2 + 8]
	.word	0xa5a9004e	! t0_kref+0x3de4:   	fmovdl	%fcc0, %f14, %f18
	.word	0x93a00533	! t0_kref+0x3de8:   	fsqrts	%f19, %f9
	.word	0xec070018	! t0_kref+0x3dec:   	ld	[%i4 + %i0], %l6
	.word	0xa68b74c1	! t0_kref+0x3df0:   	andcc	%o5, -0xb3f, %l3
	.word	0xd11fbee8	! t0_kref+0x3df4:   	ldd	[%fp - 0x118], %f8
	.word	0x90fe800d	! t0_kref+0x3df8:   	sdivcc	%i2, %o5, %o0
	.word	0xe6ee7ff2	! t0_kref+0x3dfc:   	ldstuba	[%i1 - 0xe]%asi, %l3
	.word	0x81ab4ab0	! t0_kref+0x3e00:   	fcmpes	%fcc0, %f13, %f16
	.word	0xa863001a	! t0_kref+0x3e04:   	subc	%o4, %i2, %l4
	.word	0xaef80000	! t0_kref+0x3e08:   	sdivcc	%g0, %g0, %l7
	.word	0x21480008	! t0_kref+0x3e0c:   	fbn,a,pt	%fcc0, _kref+0x3e2c
	.word	0x93a00532	! t0_kref+0x3e10:   	fsqrts	%f18, %f9
	.word	0x93b44fa8	! t0_kref+0x3e14:   	fors	%f17, %f8, %f9
	.word	0xa9b30c94	! t0_kref+0x3e18:   	fandnot2	%f12, %f20, %f20
	.word	0xd480a000	! t0_kref+0x3e1c:   	lda	[%g2]%asi, %o2
	.word	0x81aa8ad0	! t0_kref+0x3e20:   	fcmped	%fcc0, %f10, %f16
	.word	0xdd9e5000	! t0_kref+0x3e24:   	ldda	[%i1]0x80, %f14
	.word	0xd5a01019	! t0_kref+0x3e28:   	sta	%f10, [%g0 + %i1]0x80
	.word	0xa6b6bc47	! t0_kref+0x3e2c:   	orncc	%i2, -0x3b9, %l3
	.word	0x2b08a585	! t0_kref+0x3e30:   	sethi	%hi(0x22961400), %l5
	.word	0xd8b0a02a	! t0_kref+0x3e34:   	stha	%o4, [%g2 + 0x2a]%asi
	.word	0x81ab4a30	! t0_kref+0x3e38:   	fcmps	%fcc0, %f13, %f16
	.word	0xd3a0a030	! t0_kref+0x3e3c:   	sta	%f9, [%g2 + 0x30]%asi
	.word	0xe11fbc50	! t0_kref+0x3e40:   	ldd	[%fp - 0x3b0], %f16
	sethi	%hi(2f), %o7
	.word	0xe40be27c	! t0_kref+0x3e48:   	ldub	[%o7 + 0x27c], %l2
	.word	0xa41ca00c	! t0_kref+0x3e4c:   	xor	%l2, 0xc, %l2
	.word	0xe42be27c	! t0_kref+0x3e50:   	stb	%l2, [%o7 + 0x27c]
	.word	0x81dbe27c	! t0_kref+0x3e54:   	flush	%o7 + 0x27c
	.word	0xa61b382f	! t0_kref+0x3e58:   	xor	%o4, -0x7d1, %l3
	.word	0xf428a030	! t0_kref+0x3e5c:   	stb	%i2, [%g2 + 0x30]
	.word	0xe690a032	! t0_kref+0x3e60:   	lduha	[%g2 + 0x32]%asi, %l3
	.word	0x81abcaa9	! t0_kref+0x3e64:   	fcmpes	%fcc0, %f15, %f9
	.word	0xd4c0a000	! t0_kref+0x3e68:   	ldswa	[%g2]%asi, %o2
	.word	0x9da000d2	! t0_kref+0x3e6c:   	fnegd	%f18, %f14
	.word	0x951b401a	! t0_kref+0x3e70:   	tsubcctv	%o5, %i2, %o2
	.word	0x951b7667	! t0_kref+0x3e74:   	tsubcctv	%o5, -0x999, %o2
	.word	0x81da7061	! t0_kref+0x3e78:   	flush	%o1 - 0xf9f
2:	.word	0xe03e4000	! t0_kref+0x3e7c:   	std	%l0, [%i1]
	.word	0x95b3c730	! t0_kref+0x3e80:   	fmuld8ulx16	%f15, %f16, %f10
	.word	0xe9bf5019	! t0_kref+0x3e84:   	stda	%f20, [%i5 + %i1]0x80
	.word	0xc12e7ffc	! t0_kref+0x3e88:   	st	%fsr, [%i1 - 4]
	.word	0xc12e401c	! t0_kref+0x3e8c:   	st	%fsr, [%i1 + %i4]
	.word	0x9fc00004	! t0_kref+0x3e90:   	call	%g0 + %g4
	.word	0xaa930000	! t0_kref+0x3e94:   	orcc	%o4, %g0, %l5
	.word	0x81ad4a2a	! t0_kref+0x3e98:   	fcmps	%fcc0, %f21, %f10
	.word	0x91b4898e	! t0_kref+0x3e9c:   	bshuffle	%f18, %f14, %f8
	.word	0xaa56acf9	! t0_kref+0x3ea0:   	umul	%i2, 0xcf9, %l5
	.word	0xae200000	! t0_kref+0x3ea4:   	neg	%g0, %l7
	.word	0xec6e3fe3	! t0_kref+0x3ea8:   	ldstub	[%i0 - 0x1d], %l6
	.word	0xae3b6e9d	! t0_kref+0x3eac:   	xnor	%o5, 0xe9d, %l7
	.word	0xa676800d	! t0_kref+0x3eb0:   	udiv	%i2, %o5, %l3
	.word	0xd2000018	! t0_kref+0x3eb4:   	ld	[%g0 + %i0], %o1
	.word	0x90ab0000	! t0_kref+0x3eb8:   	andncc	%o4, %g0, %o0
	.word	0x9bb00768	! t0_kref+0x3ebc:   	fpack16	%f8, %f13
	.word	0x94bb401a	! t0_kref+0x3ec0:   	xnorcc	%o5, %i2, %o2
	.word	0x2e800002	! t0_kref+0x3ec4:   	bvs,a	_kref+0x3ecc
	.word	0xe100a028	! t0_kref+0x3ec8:   	ld	[%g2 + 0x28], %f16
	.word	0x9de3bfa0	! t0_kref+0x3ecc:   	save	%sp, -0x60, %sp
	.word	0x8106fea5	! t0_kref+0x3ed0:   	taddcc	%i3, -0x15b, %g0
	.word	0x95ee7457	! t0_kref+0x3ed4:   	restore	%i1, -0xba9, %o2
	.word	0x90db3d2e	! t0_kref+0x3ed8:   	smulcc	%o4, -0x2d2, %o0
	.word	0xa6c02c23	! t0_kref+0x3edc:   	addccc	%g0, 0xc23, %l3
	.word	0xdb26601c	! t0_kref+0x3ee0:   	st	%f13, [%i1 + 0x1c]
	.word	0xae1b001a	! t0_kref+0x3ee4:   	xor	%o4, %i2, %l7
	.word	0x925b0000	! t0_kref+0x3ee8:   	smul	%o4, %g0, %o1
	.word	0x81ad0a35	! t0_kref+0x3eec:   	fcmps	%fcc0, %f20, %f21
	.word	0xa1a40954	! t0_kref+0x3ef0:   	fmuld	%f16, %f20, %f16
	.word	0x9fc00004	! t0_kref+0x3ef4:   	call	%g0 + %g4
	.word	0x9026801a	! t0_kref+0x3ef8:   	sub	%i2, %i2, %o0
	.word	0xae06801a	! t0_kref+0x3efc:   	add	%i2, %i2, %l7
	.word	0xe610a032	! t0_kref+0x3f00:   	lduh	[%g2 + 0x32], %l3
	.word	0xd086101c	! t0_kref+0x3f04:   	lda	[%i0 + %i4]0x80, %o0
	.word	0xd4100019	! t0_kref+0x3f08:   	lduh	[%g0 + %i1], %o2
	.word	0x90aebcb9	! t0_kref+0x3f0c:   	andncc	%i2, -0x347, %o0
	.word	0x9fa00533	! t0_kref+0x3f10:   	fsqrts	%f19, %f15
	.word	0xa9a0052f	! t0_kref+0x3f14:   	fsqrts	%f15, %f20
	.word	0x91a0052e	! t0_kref+0x3f18:   	fsqrts	%f14, %f8
	.word	0xe7a0a000	! t0_kref+0x3f1c:   	sta	%f19, [%g2]%asi
	.word	0xe81e3fe8	! t0_kref+0x3f20:   	ldd	[%i0 - 0x18], %l4
	.word	0xaeb6b362	! t0_kref+0x3f24:   	orncc	%i2, -0xc9e, %l7
	.word	0xee167fe4	! t0_kref+0x3f28:   	lduh	[%i1 - 0x1c], %l7
	.word	0xe8d0a002	! t0_kref+0x3f2c:   	ldsha	[%g2 + 2]%asi, %l4
	.word	0xd99e5000	! t0_kref+0x3f30:   	ldda	[%i1]0x80, %f12
	.word	0x152c1ece	! t0_kref+0x3f34:   	sethi	%hi(0xb07b3800), %o2
	.word	0x99a50848	! t0_kref+0x3f38:   	faddd	%f20, %f8, %f12
	.word	0x9338201f	! t0_kref+0x3f3c:   	sra	%g0, 0x1f, %o1
	.word	0xa8236eee	! t0_kref+0x3f40:   	sub	%o5, 0xeee, %l4
	.word	0x9da4094e	! t0_kref+0x3f44:   	fmuld	%f16, %f14, %f14
	.word	0x94bebe3d	! t0_kref+0x3f48:   	xnorcc	%i2, -0x1c3, %o2
	.word	0xa9a00530	! t0_kref+0x3f4c:   	fsqrts	%f16, %f20
	.word	0xa5a0052d	! t0_kref+0x3f50:   	fsqrts	%f13, %f18
	.word	0xeec8a021	! t0_kref+0x3f54:   	ldsba	[%g2 + 0x21]%asi, %l7
	.word	0xd0de2008	! t0_kref+0x3f58:   	ldxa	[%i0 + 8]%asi, %o0
	.word	0x9da408ce	! t0_kref+0x3f5c:   	fsubd	%f16, %f14, %f14
	sethi	%hi(2f), %o7
	.word	0xe40be3b0	! t0_kref+0x3f64:   	ldub	[%o7 + 0x3b0], %l2
	.word	0xa41ca00c	! t0_kref+0x3f68:   	xor	%l2, 0xc, %l2
	.word	0xe42be3b0	! t0_kref+0x3f6c:   	stb	%l2, [%o7 + 0x3b0]
	.word	0x81dbe3b0	! t0_kref+0x3f70:   	flush	%o7 + 0x3b0
	.word	0x91a01911	! t0_kref+0x3f74:   	fitod	%f17, %f8
	.word	0x90fb22e4	! t0_kref+0x3f78:   	sdivcc	%o4, 0x2e4, %o0
	.word	0xc12e401c	! t0_kref+0x3f7c:   	st	%fsr, [%i1 + %i4]
	.word	0x9da0190e	! t0_kref+0x3f80:   	fitod	%f14, %f14
	.word	0xa9a01a29	! t0_kref+0x3f84:   	fstoi	%f9, %f20
	.word	0x81ab4ab4	! t0_kref+0x3f88:   	fcmpes	%fcc0, %f13, %f20
	.word	0x94b6801a	! t0_kref+0x3f8c:   	orncc	%i2, %i2, %o2
	.word	0xacbe8000	! t0_kref+0x3f90:   	xnorcc	%i2, %g0, %l6
	.word	0x99a01891	! t0_kref+0x3f94:   	fitos	%f17, %f12
	.word	0x99a000b3	! t0_kref+0x3f98:   	fnegs	%f19, %f12
	.word	0xd9be1a5b	! t0_kref+0x3f9c:   	stda	%f12, [%i0 + %i3]0xd2
	.word	0xd106001c	! t0_kref+0x3fa0:   	ld	[%i0 + %i4], %f8
	.word	0x90b30000	! t0_kref+0x3fa4:   	orncc	%o4, %g0, %o0
	.word	0xf436c019	! t0_kref+0x3fa8:   	sth	%i2, [%i3 + %i1]
	.word	0xdd1fbce8	! t0_kref+0x3fac:   	ldd	[%fp - 0x318], %f14
2:	.word	0xd11e4000	! t0_kref+0x3fb0:   	ldd	[%i1], %f8
	.word	0x81ac8acc	! t0_kref+0x3fb4:   	fcmped	%fcc0, %f18, %f12
	.word	0xab44c000	! t0_kref+0x3fb8:   	mov	%gsr, %l5
	.word	0xad38201f	! t0_kref+0x3fbc:   	sra	%g0, 0x1f, %l6
	.word	0x81580000	! t0_kref+0x3fc0:   	flushw
	.word	0xaac6800d	! t0_kref+0x3fc4:   	addccc	%i2, %o5, %l5
	.word	0x92b80000	! t0_kref+0x3fc8:   	xnorcc	%g0, %g0, %o1
	.word	0x2b480001	! t0_kref+0x3fcc:   	fbug,a,pt	%fcc0, _kref+0x3fd0
	.word	0x95400000	! t0_kref+0x3fd0:   	mov	%y, %o2
	.word	0x9328000c	! t0_kref+0x3fd4:   	sll	%g0, %o4, %o1
	.word	0x81da0004	! t0_kref+0x3fd8:   	flush	%o0 + %g4
	sethi	%hi(2f), %o7
	.word	0xe40be3f4	! t0_kref+0x3fe0:   	ldub	[%o7 + 0x3f4], %l2
	.word	0xa41ca00c	! t0_kref+0x3fe4:   	xor	%l2, 0xc, %l2
	.word	0xe42be3f4	! t0_kref+0x3fe8:   	stb	%l2, [%o7 + 0x3f4]
	.word	0x81dbe3f4	! t0_kref+0x3fec:   	flush	%o7 + 0x3f4
	.word	0xaaa6800c	! t0_kref+0x3ff0:   	subcc	%i2, %o4, %l5
2:	.word	0xa5b48988	! t0_kref+0x3ff4:   	bshuffle	%f18, %f8, %f18
	.word	0xa3a018cc	! t0_kref+0x3ff8:   	fdtos	%f12, %f17
	.word	0xe408679c	! t0_kref+0x3ffc:   	ldub	[%g1 + 0x79c], %l2
	.word	0xa41ca00c	! t0_kref+0x4000:   	xor	%l2, 0xc, %l2
	.word	0xe428679c	! t0_kref+0x4004:   	stb	%l2, [%g1 + 0x79c]
	.word	0x81d8679c	! t0_kref+0x4008:   	flush	%g1 + 0x79c
	.word	0x953ea01b	! t0_kref+0x400c:   	sra	%i2, 0x1b, %o2
	.word	0x22480005	! t0_kref+0x4010:   	be,a,pt	%icc, _kref+0x4024
	.word	0xabb30160	! t0_kref+0x4014:   	edge32ln	%o4, %g0, %l5
	.word	0xdaa0a010	! t0_kref+0x4018:   	sta	%o5, [%g2 + 0x10]%asi
	.word	0x91a0190d	! t0_kref+0x401c:   	fitod	%f13, %f8
	.word	0xaba488a8	! t0_kref+0x4020:   	fsubs	%f18, %f8, %f21
	.word	0x95b28634	! t0_kref+0x4024:   	fmul8x16	%f10, %f20, %f10
2:	.word	0xaca83d7c	! t0_kref+0x4028:   	andncc	%g0, -0x284, %l6
	.word	0xd11e7ff8	! t0_kref+0x402c:   	ldd	[%i1 - 8], %f8
	.word	0xd20e7fff	! t0_kref+0x4030:   	ldub	[%i1 - 1], %o1
	.word	0x91b009aa	! t0_kref+0x4034:   	fexpand	%f10, %f8
	.word	0xf4200018	! t0_kref+0x4038:   	st	%i2, [%g0 + %i0]
	.word	0x9db30aca	! t0_kref+0x403c:   	fpsub32	%f12, %f10, %f14
	.word	0xe9063ff8	! t0_kref+0x4040:   	ld	[%i0 - 8], %f20
	.word	0x949b3ef7	! t0_kref+0x4044:   	xorcc	%o4, -0x109, %o2
	.word	0x99a40854	! t0_kref+0x4048:   	faddd	%f16, %f20, %f12
	.word	0x2b09aa65	! t0_kref+0x404c:   	sethi	%hi(0x26a99400), %l5
	.word	0xea070019	! t0_kref+0x4050:   	ld	[%i4 + %i1], %l5
	.word	0xc12e3fe8	! t0_kref+0x4054:   	st	%fsr, [%i0 - 0x18]
	.word	0xd0c8a013	! t0_kref+0x4058:   	ldsba	[%g2 + 0x13]%asi, %o0
	.word	0xacd0001a	! t0_kref+0x405c:   	umulcc	%g0, %i2, %l6
	.word	0x81de401d	! t0_kref+0x4060:   	flush	%i1 + %i5
	.word	0x92182e5c	! t0_kref+0x4064:   	xor	%g0, 0xe5c, %o1
	.word	0xa9b007a8	! t0_kref+0x4068:   	fpackfix	%f8, %f20
	.word	0x2b480001	! t0_kref+0x406c:   	fbug,a,pt	%fcc0, _kref+0x4070
	.word	0xaba00533	! t0_kref+0x4070:   	fsqrts	%f19, %f21
	.word	0xa6980000	! t0_kref+0x4074:   	xorcc	%g0, %g0, %l3
	.word	0x93400000	! t0_kref+0x4078:   	mov	%y, %o1
	.word	0x9db30e4c	! t0_kref+0x407c:   	fxnor	%f12, %f12, %f14
	.word	0xc5383fe0	! t0_kref+0x4080:   	std	%f2, [%g0 - 0x20]
	.word	0xe8180018	! t0_kref+0x4084:   	ldd	[%g0 + %i0], %l4
	.word	0x95b546af	! t0_kref+0x4088:   	fmul8x16al	%f21, %f15, %f10
	.word	0x8143e040	! t0_kref+0x408c:   	membar	0x40
	.word	0xa9a01934	! t0_kref+0x4090:   	fstod	%f20, %f20
	.word	0xaa7b6c5b	! t0_kref+0x4094:   	sdiv	%o5, 0xc5b, %l5
	.word	0x9533001a	! t0_kref+0x4098:   	srl	%o4, %i2, %o2
	.word	0x905e800c	! t0_kref+0x409c:   	smul	%i2, %o4, %o0
	.word	0xac1e800d	! t0_kref+0x40a0:   	xor	%i2, %o5, %l6
	call	SYM(t0_subr2)
	.word	0x90b03941	! t0_kref+0x40a8:   	orncc	%g0, -0x6bf, %o0
	.word	0x9fc10000	! t0_kref+0x40ac:   	call	%g4
	.word	0xd2070019	! t0_kref+0x40b0:   	ld	[%i4 + %i1], %o1
	.word	0xc12e7ffc	! t0_kref+0x40b4:   	st	%fsr, [%i1 - 4]
	.word	0x2d28ecf7	! t0_kref+0x40b8:   	sethi	%hi(0xa3b3dc00), %l6
	.word	0xa9b38e80	! t0_kref+0x40bc:   	fsrc1	%f14, %f20
	.word	0xa7b6802c	! t0_kref+0x40c0:   	edge8n	%i2, %o4, %l3
	.word	0xe67e001c	! t0_kref+0x40c4:   	swap	[%i0 + %i4], %l3
	.word	0xaeb37c5c	! t0_kref+0x40c8:   	orncc	%o5, -0x3a4, %l7
	.word	0xdb062010	! t0_kref+0x40cc:   	ld	[%i0 + 0x10], %f13
	.word	0xacc6801a	! t0_kref+0x40d0:   	addccc	%i2, %i2, %l6
	.word	0xa3a40835	! t0_kref+0x40d4:   	fadds	%f16, %f21, %f17
	.word	0xa5a3894a	! t0_kref+0x40d8:   	fmuld	%f14, %f10, %f18
	.word	0xaafb27a6	! t0_kref+0x40dc:   	sdivcc	%o4, 0x7a6, %l5
	.word	0xe47e2008	! t0_kref+0x40e0:   	swap	[%i0 + 8], %l2
	.word	0x9fc00004	! t0_kref+0x40e4:   	call	%g0 + %g4
	.word	0x81834000	! t0_kref+0x40e8:   	wr	%o5, %g0, %y
	.word	0x2b07b208	! t0_kref+0x40ec:   	sethi	%hi(0x1ec82000), %l5
	.word	0x30480003	! t0_kref+0x40f0:   	ba,a,pt	%icc, _kref+0x40fc
	.word	0xa93b4000	! t0_kref+0x40f4:   	sra	%o5, %g0, %l4
	.word	0xa9a0190c	! t0_kref+0x40f8:   	fitod	%f12, %f20
	.word	0x81de8015	! t0_kref+0x40fc:   	flush	%i2 + %l5
	.word	0x83414000	! t0_kref+0x4100:   	mov	%pc, %g1
	.word	0xd4c0a000	! t0_kref+0x4104:   	ldswa	[%g2]%asi, %o2
	.word	0x9126800c	! t0_kref+0x4108:   	mulscc	%i2, %o4, %o0
	.word	0xda7e6014	! t0_kref+0x410c:   	swap	[%i1 + 0x14], %o5
	.word	0x94db27e4	! t0_kref+0x4110:   	smulcc	%o4, 0x7e4, %o2
	.word	0xaa303a3b	! t0_kref+0x4114:   	orn	%g0, -0x5c5, %l5
	.word	0x93a00133	! t0_kref+0x4118:   	fabss	%f19, %f9
	.word	0xa6be800c	! t0_kref+0x411c:   	xnorcc	%i2, %o4, %l3
	.word	0xaedb627c	! t0_kref+0x4120:   	smulcc	%o5, 0x27c, %l7
	.word	0x99a01a52	! t0_kref+0x4124:   	fdtoi	%f18, %f12
	.word	0xe5ee501d	! t0_kref+0x4128:   	prefetcha	%i1 + %i5, 18
	.word	0x81834000	! t0_kref+0x412c:   	wr	%o5, %g0, %y
	.word	0x81b01024	! t0_kref+0x4130:   	siam	0x4
	.word	0x9da388ca	! t0_kref+0x4134:   	fsubd	%f14, %f10, %f14
	.word	0xa666a14a	! t0_kref+0x4138:   	subc	%i2, 0x14a, %l3
	.word	0xa1a289b0	! t0_kref+0x413c:   	fdivs	%f10, %f16, %f16
	.word	0x9536a010	! t0_kref+0x4140:   	srl	%i2, 0x10, %o2
	.word	0xa7400000	! t0_kref+0x4144:   	mov	%y, %l3
	.word	0x95b4070f	! t0_kref+0x4148:   	fmuld8sux16	%f16, %f15, %f10
	.word	0xab368000	! t0_kref+0x414c:   	srl	%i2, %g0, %l5
	.word	0x39480002	! t0_kref+0x4150:   	fbuge,a,pt	%fcc0, _kref+0x4158
	.word	0xe76e6000	! t0_kref+0x4154:   	prefetch	%i1, 19
	.word	0xa3a01a35	! t0_kref+0x4158:   	fstoi	%f21, %f17
	.word	0x97b007ac	! t0_kref+0x415c:   	fpackfix	%f12, %f11
	.word	0xee40a030	! t0_kref+0x4160:   	ldsw	[%g2 + 0x30], %l7
	.word	0x95400000	! t0_kref+0x4164:   	mov	%y, %o2
	.word	0xae3b3b71	! t0_kref+0x4168:   	xnor	%o4, -0x48f, %l7
	.word	0x35480006	! t0_kref+0x416c:   	fbue,a,pt	%fcc0, _kref+0x4184
	.word	0xd91f4019	! t0_kref+0x4170:   	ldd	[%i5 + %i1], %f12
	.word	0xa9b68280	! t0_kref+0x4174:   	array32	%i2, %g0, %l4
	.word	0xd03f4019	! t0_kref+0x4178:   	std	%o0, [%i5 + %i1]
	.word	0xe51fbe28	! t0_kref+0x417c:   	ldd	[%fp - 0x1d8], %f18
	.word	0xa6bb000c	! t0_kref+0x4180:   	xnorcc	%o4, %o4, %l3
	.word	0x90db63ad	! t0_kref+0x4184:   	smulcc	%o5, 0x3ad, %o0
	.word	0x9ba00529	! t0_kref+0x4188:   	fsqrts	%f9, %f13
	.word	0xa8de800c	! t0_kref+0x418c:   	smulcc	%i2, %o4, %l4
	.word	0xac5b2350	! t0_kref+0x4190:   	smul	%o4, 0x350, %l6
	.word	0xac5b000d	! t0_kref+0x4194:   	smul	%o4, %o5, %l6
	.word	0xa8902735	! t0_kref+0x4198:   	orcc	%g0, 0x735, %l4
	.word	0x92233d31	! t0_kref+0x419c:   	sub	%o4, -0x2cf, %o1
	.word	0xa7b3004d	! t0_kref+0x41a0:   	edge8l	%o4, %o5, %l3
	.word	0x92e3000c	! t0_kref+0x41a4:   	subccc	%o4, %o4, %o1
	.word	0xaa80000d	! t0_kref+0x41a8:   	addcc	%g0, %o5, %l5
	.word	0xec90a010	! t0_kref+0x41ac:   	lduha	[%g2 + 0x10]%asi, %l6
	.word	0x99a48828	! t0_kref+0x41b0:   	fadds	%f18, %f8, %f12
	.word	0xaf400000	! t0_kref+0x41b4:   	mov	%y, %l7
	.word	0x99a00034	! t0_kref+0x41b8:   	fmovs	%f20, %f12
	.word	0x9fc00004	! t0_kref+0x41bc:   	call	%g0 + %g4
	.word	0xa5a01a33	! t0_kref+0x41c0:   	fstoi	%f19, %f18
	.word	0xa646baf2	! t0_kref+0x41c4:   	addc	%i2, -0x50e, %l3
	.word	0x92e3401a	! t0_kref+0x41c8:   	subccc	%o5, %i2, %o1
	.word	0x81aa8a52	! t0_kref+0x41cc:   	fcmpd	%fcc0, %f10, %f18
	.word	0xaa8b400d	! t0_kref+0x41d0:   	andcc	%o5, %o5, %l5
	.word	0x95a2094a	! t0_kref+0x41d4:   	fmuld	%f8, %f10, %f10
	.word	0x91a0004c	! t0_kref+0x41d8:   	fmovd	%f12, %f8
	.word	0xd91fbd48	! t0_kref+0x41dc:   	ldd	[%fp - 0x2b8], %f12
	.word	0x25800006	! t0_kref+0x41e0:   	fblg,a	_kref+0x41f8
	.word	0x93a2c8af	! t0_kref+0x41e4:   	fsubs	%f11, %f15, %f9
	.word	0x99a0190e	! t0_kref+0x41e8:   	fitod	%f14, %f12
	.word	0xae602e76	! t0_kref+0x41ec:   	subc	%g0, 0xe76, %l7
	.word	0x9063000c	! t0_kref+0x41f0:   	subc	%o4, %o4, %o0
	.word	0xd8262004	! t0_kref+0x41f4:   	st	%o4, [%i0 + 4]
	.word	0xa638000d	! t0_kref+0x41f8:   	xnor	%g0, %o5, %l3
	.word	0xd7070018	! t0_kref+0x41fc:   	ld	[%i4 + %i0], %f11
	.word	0xa846800c	! t0_kref+0x4200:   	addc	%i2, %o4, %l4
	.word	0x81834000	! t0_kref+0x4204:   	wr	%o5, %g0, %y
	.word	0xa65eacdd	! t0_kref+0x4208:   	smul	%i2, 0xcdd, %l3
	.word	0xa6db000c	! t0_kref+0x420c:   	smulcc	%o4, %o4, %l3
	.word	0x9fa01a2d	! t0_kref+0x4210:   	fstoi	%f13, %f15
	.word	0xd400a010	! t0_kref+0x4214:   	ld	[%g2 + 0x10], %o2
	.word	0xda780019	! t0_kref+0x4218:   	swap	[%g0 + %i1], %o5
	.word	0x26480008	! t0_kref+0x421c:   	bl,a,pt	%icc, _kref+0x423c
	.word	0xd980a020	! t0_kref+0x4220:   	lda	[%g2 + 0x20]%asi, %f12
	.word	0x91b3008d	! t0_kref+0x4224:   	edge16	%o4, %o5, %o0
	.word	0x95a2094e	! t0_kref+0x4228:   	fmuld	%f8, %f14, %f10
	.word	0x2f0eb67c	! t0_kref+0x422c:   	sethi	%hi(0x3ad9f000), %l7
	.word	0xac53401a	! t0_kref+0x4230:   	umul	%o5, %i2, %l6
	.word	0x9fb00fe0	! t0_kref+0x4234:   	fones	%f15
	.word	0x130c4da4	! t0_kref+0x4238:   	sethi	%hi(0x31369000), %o1
	.word	0xa9a01911	! t0_kref+0x423c:   	fitod	%f17, %f20
	.word	0x001fffff	! t0_kref+0x4240:   	illtrap	0x1fffff
	.word	0x947330b5	! t0_kref+0x4244:   	udiv	%o4, -0xf4b, %o2
	.word	0x81df0005	! t0_kref+0x4248:   	flush	%i4 + %g5
	.word	0x9443625f	! t0_kref+0x424c:   	addc	%o5, 0x25f, %o2
	.word	0x81dff953	! t0_kref+0x4250:   	flush	%i7 - 0x6ad
	sethi	%hi(2f), %o7
	.word	0xe40be284	! t0_kref+0x4258:   	ldub	[%o7 + 0x284], %l2
	.word	0xa41ca00c	! t0_kref+0x425c:   	xor	%l2, 0xc, %l2
	.word	0xe42be284	! t0_kref+0x4260:   	stb	%l2, [%o7 + 0x284]
	.word	0x81dbe284	! t0_kref+0x4264:   	flush	%o7 + 0x284
	.word	0xa1a01108	! t0_kref+0x4268:   	fxtod	%f8, %f16
	.word	0x91b54a6f	! t0_kref+0x426c:   	fpadd32s	%f21, %f15, %f8
	.word	0xd016c018	! t0_kref+0x4270:   	lduh	[%i3 + %i0], %o0
	.word	0xead81018	! t0_kref+0x4274:   	ldxa	[%g0 + %i0]0x80, %l5
	.word	0xe11fbd20	! t0_kref+0x4278:   	ldd	[%fp - 0x2e0], %f16
	.word	0xdaa8a012	! t0_kref+0x427c:   	stba	%o5, [%g2 + 0x12]%asi
	.word	0x97a288b1	! t0_kref+0x4280:   	fsubs	%f10, %f17, %f11
2:	.word	0x9da0190f	! t0_kref+0x4284:   	fitod	%f15, %f14
	.word	0xae3b0000	! t0_kref+0x4288:   	not	%o4, %l7
	.word	0xaa1ea6d5	! t0_kref+0x428c:   	xor	%i2, 0x6d5, %l5
	.word	0xa6833ca3	! t0_kref+0x4290:   	addcc	%o4, -0x35d, %l3
	.word	0xa8bb2414	! t0_kref+0x4294:   	xnorcc	%o4, 0x414, %l4
	sethi	%hi(1f), %o7
	jmpl	%o7+%lo(1f), %g1
	.empty
	.word	0x95a01a33	! t0_kref+0x42a0:   	fstoi	%f19, %f10
	.word	0xf4a8a031	! t0_kref+0x42a4:   	stba	%i2, [%g2 + 0x31]%asi
	.word	0xc568a009	! t0_kref+0x42a8:   	prefetch	%g2 + 9, 2
1:	.word	0xe9ee501c	! t0_kref+0x42ac:   	prefetcha	%i1 + %i4, 20
	.word	0x91b3404d	! t0_kref+0x42b0:   	edge8l	%o5, %o5, %o0
	.word	0xaba01891	! t0_kref+0x42b4:   	fitos	%f17, %f21
	.word	0x81ab8ad4	! t0_kref+0x42b8:   	fcmped	%fcc0, %f14, %f20
	call	SYM(t0_subr2)
	.word	0xda26401c	! t0_kref+0x42c0:   	st	%o5, [%i1 + %i4]
	.word	0x97a509b1	! t0_kref+0x42c4:   	fdivs	%f20, %f17, %f11
	.word	0x90182e1c	! t0_kref+0x42c8:   	xor	%g0, 0xe1c, %o0
	.word	0xe9be1a5c	! t0_kref+0x42cc:   	stda	%f20, [%i0 + %i4]0xd2
	.word	0xa944c000	! t0_kref+0x42d0:   	mov	%gsr, %l4
	.word	0xa8bead26	! t0_kref+0x42d4:   	xnorcc	%i2, 0xd26, %l4
	.word	0xaba408ae	! t0_kref+0x42d8:   	fsubs	%f16, %f14, %f21
	.word	0xa5b3cf68	! t0_kref+0x42dc:   	fornot1s	%f15, %f8, %f18
	.word	0xa5a01915	! t0_kref+0x42e0:   	fitod	%f21, %f18
	.word	0xacb82d64	! t0_kref+0x42e4:   	xnorcc	%g0, 0xd64, %l6
	.word	0xa1b3c62e	! t0_kref+0x42e8:   	fmul8x16	%f15, %f14, %f16
	.word	0x3d800006	! t0_kref+0x42ec:   	fbule,a	_kref+0x4304
	.word	0x9403400d	! t0_kref+0x42f0:   	add	%o5, %o5, %o2
	.word	0x91a48850	! t0_kref+0x42f4:   	faddd	%f18, %f16, %f8
	.word	0x9f414000	! t0_kref+0x42f8:   	mov	%pc, %o7
	.word	0x9db50dd4	! t0_kref+0x42fc:   	fnand	%f20, %f20, %f14
	.word	0x9da000b4	! t0_kref+0x4300:   	fnegs	%f20, %f14
	.word	0x9da01092	! t0_kref+0x4304:   	fxtos	%f18, %f14
	.word	0xa1a4cd31	! t0_kref+0x4308:   	fsmuld	%f19, %f17, %f16
	.word	0xd4166016	! t0_kref+0x430c:   	lduh	[%i1 + 0x16], %o2
	.word	0x91b50a4e	! t0_kref+0x4310:   	fpadd32	%f20, %f14, %f8
	.word	0xa7b007ac	! t0_kref+0x4314:   	fpackfix	%f12, %f19
	.word	0xaca364f4	! t0_kref+0x4318:   	subcc	%o5, 0x4f4, %l6
	sethi	%hi(2f), %o7
	.word	0xe40be36c	! t0_kref+0x4320:   	ldub	[%o7 + 0x36c], %l2
	.word	0xa41ca00c	! t0_kref+0x4324:   	xor	%l2, 0xc, %l2
	.word	0xe42be36c	! t0_kref+0x4328:   	stb	%l2, [%o7 + 0x36c]
	.word	0x81dbe36c	! t0_kref+0x432c:   	flush	%o7 + 0x36c
	.word	0xefe8a04c	! t0_kref+0x4330:   	prefetcha	%g2 + 0x4c, 23
	.word	0xd0d0a028	! t0_kref+0x4334:   	ldsha	[%g2 + 0x28]%asi, %o0
	.word	0xe580a020	! t0_kref+0x4338:   	lda	[%g2 + 0x20]%asi, %f18
	.word	0xa8e6800c	! t0_kref+0x433c:   	subccc	%i2, %o4, %l4
	.word	0x94ab400d	! t0_kref+0x4340:   	andncc	%o5, %o5, %o2
	.word	0xa68b400d	! t0_kref+0x4344:   	andcc	%o5, %o5, %l3
	.word	0xd0067ffc	! t0_kref+0x4348:   	ld	[%i1 - 4], %o0
	.word	0x95b4048e	! t0_kref+0x434c:   	fcmple32	%f16, %f14, %o2
	.word	0xef68a0ce	! t0_kref+0x4350:   	prefetch	%g2 + 0xce, 23
	.word	0x91a0054c	! t0_kref+0x4354:   	fsqrtd	%f12, %f8
	.word	0xa8500000	! t0_kref+0x4358:   	umul	%g0, %g0, %l4
	.word	0x81ab4aab	! t0_kref+0x435c:   	fcmpes	%fcc0, %f13, %f11
	.word	0xaba3082c	! t0_kref+0x4360:   	fadds	%f12, %f12, %f21
	.word	0xa9a50950	! t0_kref+0x4364:   	fmuld	%f20, %f16, %f20
	.word	0xac3b400d	! t0_kref+0x4368:   	xnor	%o5, %o5, %l6
2:	.word	0xa1a48950	! t0_kref+0x436c:   	fmuld	%f18, %f16, %f16
	.word	0xd2c8a02b	! t0_kref+0x4370:   	ldsba	[%g2 + 0x2b]%asi, %o1
	.word	0xa5a01915	! t0_kref+0x4374:   	fitod	%f21, %f18
	.word	0x99a4c8aa	! t0_kref+0x4378:   	fsubs	%f19, %f10, %f12
	.word	0xc020a018	! t0_kref+0x437c:   	clr	[%g2 + 0x18]
	.word	0x9bb44ef0	! t0_kref+0x4380:   	fornot2s	%f17, %f16, %f13
	.word	0xd1be189a	! t0_kref+0x4384:   	stda	%f8, [%i0 + %i2]0xc4
	.word	0xa7b6812d	! t0_kref+0x4388:   	edge32n	%i2, %o5, %l3
	.word	0x81dc000e	! t0_kref+0x438c:   	flush	%l0 + %sp
	.word	0xa8b37de3	! t0_kref+0x4390:   	orncc	%o5, -0x21d, %l4
	call	1f
	.empty
	.word	0xa5a3c82f	! t0_kref+0x4398:   	fadds	%f15, %f15, %f18
	.word	0x94b365c1	! t0_kref+0x439c:   	orncc	%o5, 0x5c1, %o2
1:	.word	0xf4266000	! t0_kref+0x43a0:   	st	%i2, [%i1]
	.word	0xa6fb7f26	! t0_kref+0x43a4:   	sdivcc	%o5, -0xda, %l3
	.word	0x39480004	! t0_kref+0x43a8:   	fbuge,a,pt	%fcc0, _kref+0x43b8
	.word	0xd500a008	! t0_kref+0x43ac:   	ld	[%g2 + 8], %f10
	.word	0x95b50ad2	! t0_kref+0x43b0:   	fpsub32	%f20, %f18, %f10
	.word	0x9403401a	! t0_kref+0x43b4:   	add	%o5, %i2, %o2
	.word	0x95a3cd35	! t0_kref+0x43b8:   	fsmuld	%f15, %f21, %f10
	.word	0xa65b2e87	! t0_kref+0x43bc:   	smul	%o4, 0xe87, %l3
	.word	0xda300018	! t0_kref+0x43c0:   	sth	%o5, [%g0 + %i0]
	.word	0x9da308cc	! t0_kref+0x43c4:   	fsubd	%f12, %f12, %f14
	.word	0xd3266014	! t0_kref+0x43c8:   	st	%f9, [%i1 + 0x14]
	.word	0x92400000	! t0_kref+0x43cc:   	addc	%g0, %g0, %o1
	.word	0xaa3b0000	! t0_kref+0x43d0:   	not	%o4, %l5
	.word	0xd450a03a	! t0_kref+0x43d4:   	ldsh	[%g2 + 0x3a], %o2
	.word	0x94b36916	! t0_kref+0x43d8:   	orncc	%o5, 0x916, %o2
	.word	0xea070018	! t0_kref+0x43dc:   	ld	[%i4 + %i0], %l5
	.word	0x37800005	! t0_kref+0x43e0:   	fbge,a	_kref+0x43f4
	.word	0x91b48552	! t0_kref+0x43e4:   	fcmpeq16	%f18, %f18, %o0
	.word	0xadb00300	! t0_kref+0x43e8:   	alignaddr	%g0, %g0, %l6
	.word	0xa3a018d4	! t0_kref+0x43ec:   	fdtos	%f20, %f17
	.word	0x33480003	! t0_kref+0x43f0:   	fbe,a,pt	%fcc0, _kref+0x43fc
	.word	0xa9a40954	! t0_kref+0x43f4:   	fmuld	%f16, %f20, %f20
	.word	0x91b30c52	! t0_kref+0x43f8:   	fnor	%f12, %f18, %f8
	.word	0x91a0052b	! t0_kref+0x43fc:   	fsqrts	%f11, %f8
	.word	0x97b40ea0	! t0_kref+0x4400:   	fsrc1s	%f16, %f11
	.word	0xf4200018	! t0_kref+0x4404:   	st	%i2, [%g0 + %i0]
	.word	0x81de4018	! t0_kref+0x4408:   	flush	%i1 + %i0
	.word	0x91a94050	! t0_kref+0x440c:   	fmovdug	%fcc0, %f16, %f8
	.word	0xebf6500c	! t0_kref+0x4410:   	casxa	[%i1]0x80, %o4, %l5
	.word	0xda7e7fe4	! t0_kref+0x4414:   	swap	[%i1 - 0x1c], %o5
	.word	0x95a00134	! t0_kref+0x4418:   	fabss	%f20, %f10
	.word	0x92fb4000	! t0_kref+0x441c:   	sdivcc	%o5, %g0, %o1
	.word	0xa1a4cd2e	! t0_kref+0x4420:   	fsmuld	%f19, %f14, %f16
	.word	0xaba549ab	! t0_kref+0x4424:   	fdivs	%f21, %f11, %f21
	.word	0x90c02e59	! t0_kref+0x4428:   	addccc	%g0, 0xe59, %o0
	.word	0xaf418000	! t0_kref+0x442c:   	mov	%fprs, %l7
	.word	0x99a20948	! t0_kref+0x4430:   	fmuld	%f8, %f8, %f12
	.word	0x95a00530	! t0_kref+0x4434:   	fsqrts	%f16, %f10
	.word	0x951b6383	! t0_kref+0x4438:   	tsubcctv	%o5, 0x383, %o2
	.word	0x91a488d2	! t0_kref+0x443c:   	fsubd	%f18, %f18, %f8
	.word	0xa9b6817a	! t0_kref+0x4440:   	edge32ln	%i2, %i2, %l4
	.word	0xec1e2008	! t0_kref+0x4444:   	ldd	[%i0 + 8], %l6
	.word	0xab3b200e	! t0_kref+0x4448:   	sra	%o4, 0xe, %l5
	.word	0x91a00148	! t0_kref+0x444c:   	fabsd	%f8, %f8
	.word	0x93400000	! t0_kref+0x4450:   	mov	%y, %o1
	.word	0x81aa0a33	! t0_kref+0x4454:   	fcmps	%fcc0, %f8, %f19
	.word	0x81ad4a2d	! t0_kref+0x4458:   	fcmps	%fcc0, %f21, %f13
	.word	0xee5e6018	! t0_kref+0x445c:   	ldx	[%i1 + 0x18], %l7
	.word	0x81580000	! t0_kref+0x4460:   	flushw
	.word	0x3f480003	! t0_kref+0x4464:   	fbo,a,pt	%fcc0, _kref+0x4470
	.word	0xaa5eb891	! t0_kref+0x4468:   	smul	%i2, -0x76f, %l5
	.word	0xaa03400d	! t0_kref+0x446c:   	add	%o5, %o5, %l5
	.word	0x91b5096c	! t0_kref+0x4470:   	fpmerge	%f20, %f12, %f8
	.word	0xe4086204	! t0_kref+0x4474:   	ldub	[%g1 + 0x204], %l2
	.word	0xa41ca00c	! t0_kref+0x4478:   	xor	%l2, 0xc, %l2
	.word	0xe4286204	! t0_kref+0x447c:   	stb	%l2, [%g1 + 0x204]
	.word	0x81d86204	! t0_kref+0x4480:   	flush	%g1 + 0x204
	.word	0x9433400d	! t0_kref+0x4484:   	orn	%o5, %o5, %o2
	.word	0xa8de8000	! t0_kref+0x4488:   	smulcc	%i2, %g0, %l4
	.word	0xae06800c	! t0_kref+0x448c:   	add	%i2, %o4, %l7
	.word	0x31480006	! t0_kref+0x4490:   	fba,a,pt	%fcc0, _kref+0x44a8
	.word	0xa1a0190d	! t0_kref+0x4494:   	fitod	%f13, %f16
	call	SYM(t0_subr2)
	.word	0x9203400c	! t0_kref+0x449c:   	add	%o5, %o4, %o1
2:	.word	0x9db20a8e	! t0_kref+0x44a0:   	fpsub16	%f8, %f14, %f14
	.word	0xab400000	! t0_kref+0x44a4:   	mov	%y, %l5
	.word	0xa7a01895	! t0_kref+0x44a8:   	fitos	%f21, %f19
	.word	0xd0be6000	! t0_kref+0x44ac:   	stda	%o0, [%i1]%asi
	.word	0xa9a0192a	! t0_kref+0x44b0:   	fstod	%f10, %f20
	.word	0xd2c0a010	! t0_kref+0x44b4:   	ldswa	[%g2 + 0x10]%asi, %o1
	.word	0xa5b306c8	! t0_kref+0x44b8:   	fmul8sux16	%f12, %f8, %f18
	.word	0xf4263ffc	! t0_kref+0x44bc:   	st	%i2, [%i0 - 4]
	.word	0x81ac4a35	! t0_kref+0x44c0:   	fcmps	%fcc0, %f17, %f21
!	.word	0x2ebf1ecc	! t0_kref+0x44c4:   	bvs,a	SYM(t0_subr1)
	   	bvs,a	SYM(t0_subr1)
	.word	0x9f414000	! t0_kref+0x44c8:   	mov	%pc, %o7
	.word	0xa7b0004d	! t0_kref+0x44cc:   	edge8l	%g0, %o5, %l3
	.word	0xaa3b33e0	! t0_kref+0x44d0:   	xnor	%o4, -0xc20, %l5
	.word	0xd53e3fe8	! t0_kref+0x44d4:   	std	%f10, [%i0 - 0x18]
	.word	0xec1e2000	! t0_kref+0x44d8:   	ldd	[%i0], %l6
	.word	0xa3a018d0	! t0_kref+0x44dc:   	fdtos	%f16, %f17
	.word	0xaca8372f	! t0_kref+0x44e0:   	andncc	%g0, -0x8d1, %l6
	.word	0x9333001a	! t0_kref+0x44e4:   	srl	%o4, %i2, %o1
	.word	0x923b0000	! t0_kref+0x44e8:   	not	%o4, %o1
	.word	0x94b34000	! t0_kref+0x44ec:   	orncc	%o5, %g0, %o2
	.word	0xa68e8000	! t0_kref+0x44f0:   	andcc	%i2, %g0, %l3
	.word	0xa3a00029	! t0_kref+0x44f4:   	fmovs	%f9, %f17
	.word	0x24800006	! t0_kref+0x44f8:   	ble,a	_kref+0x4510
	.word	0x941eaa36	! t0_kref+0x44fc:   	xor	%i2, 0xa36, %o2
	.word	0x90b83c68	! t0_kref+0x4500:   	xnorcc	%g0, -0x398, %o0
	.word	0xa5b48dd4	! t0_kref+0x4504:   	fnand	%f18, %f20, %f18
	.word	0xd408a02a	! t0_kref+0x4508:   	ldub	[%g2 + 0x2a], %o2
	.word	0xa1b50d40	! t0_kref+0x450c:   	fnot1	%f20, %f16
	.word	0xa9b48c94	! t0_kref+0x4510:   	fandnot2	%f18, %f20, %f20
	.word	0xe8060000	! t0_kref+0x4514:   	ld	[%i0], %l4
	.word	0x921b401a	! t0_kref+0x4518:   	xor	%o5, %i2, %o1
	.word	0xae60000c	! t0_kref+0x451c:   	subc	%g0, %o4, %l7
	.word	0xe8560000	! t0_kref+0x4520:   	ldsh	[%i0], %l4
	.word	0x9de3bfa0	! t0_kref+0x4524:   	save	%sp, -0x60, %sp
	.word	0xabee6c1e	! t0_kref+0x4528:   	restore	%i1, 0xc1e, %l5
	.word	0x95b3405a	! t0_kref+0x452c:   	edge8l	%o5, %i2, %o2
	.word	0xa643354b	! t0_kref+0x4530:   	addc	%o4, -0xab5, %l3
	.word	0xae8b30e6	! t0_kref+0x4534:   	andcc	%o4, -0xf1a, %l7
	.word	0x94b8394c	! t0_kref+0x4538:   	xnorcc	%g0, -0x6b4, %o2
	.word	0x81800000	! t0_kref+0x453c:   	mov	%g0, %y
	.word	0xf4364000	! t0_kref+0x4540:   	sth	%i2, [%i1]
	.word	0xc168a100	! t0_kref+0x4544:   	prefetch	%g2 + 0x100, 0
	.word	0xeed01018	! t0_kref+0x4548:   	ldsha	[%g0 + %i0]0x80, %l7
	sethi	%hi(2f), %o7
	.word	0xe40be174	! t0_kref+0x4550:   	ldub	[%o7 + 0x174], %l2
	.word	0xa41ca00c	! t0_kref+0x4554:   	xor	%l2, 0xc, %l2
	.word	0xe42be174	! t0_kref+0x4558:   	stb	%l2, [%o7 + 0x174]
	.word	0x81dbe174	! t0_kref+0x455c:   	flush	%o7 + 0x174
	.word	0xaf3ea00c	! t0_kref+0x4560:   	sra	%i2, 0xc, %l7
	.word	0x30800007	! t0_kref+0x4564:   	ba,a	_kref+0x4580
	.word	0xf4363ff4	! t0_kref+0x4568:   	sth	%i2, [%i0 - 0xc]
	.word	0xdd067ff8	! t0_kref+0x456c:   	ld	[%i1 - 8], %f14
	.word	0x92e68000	! t0_kref+0x4570:   	subccc	%i2, %g0, %o1
2:	.word	0xa6de800d	! t0_kref+0x4574:   	smulcc	%i2, %o5, %l3
	.word	0xa9a2094e	! t0_kref+0x4578:   	fmuld	%f8, %f14, %f20
	.word	0xd28e6011	! t0_kref+0x457c:   	lduba	[%i1 + 0x11]%asi, %o1
	.word	0xa62eb3ec	! t0_kref+0x4580:   	andn	%i2, -0xc14, %l3
	call	SYM(t0_subr3)
	.word	0xa6feb8cb	! t0_kref+0x4588:   	sdivcc	%i2, -0x735, %l3
	.word	0xaa036439	! t0_kref+0x458c:   	add	%o5, 0x439, %l5
	.word	0x9da508d2	! t0_kref+0x4590:   	fsubd	%f20, %f18, %f14
	.word	0x91b68340	! t0_kref+0x4594:   	alignaddrl	%i2, %g0, %o0
	.word	0xea48a010	! t0_kref+0x4598:   	ldsb	[%g2 + 0x10], %l5
	.word	0xd8300018	! t0_kref+0x459c:   	sth	%o4, [%g0 + %i0]
	.word	0xa5a01928	! t0_kref+0x45a0:   	fstod	%f8, %f18
	.word	0x92802815	! t0_kref+0x45a4:   	addcc	%g0, 0x815, %o1
	.word	0x3c800006	! t0_kref+0x45a8:   	bpos,a	_kref+0x45c0
	.word	0xd820a010	! t0_kref+0x45ac:   	st	%o4, [%g2 + 0x10]
	.word	0xaba0002c	! t0_kref+0x45b0:   	fmovs	%f12, %f21
	.word	0xaf36a00e	! t0_kref+0x45b4:   	srl	%i2, 0xe, %l7
	.word	0xf4280018	! t0_kref+0x45b8:   	stb	%i2, [%g0 + %i0]
	.word	0xa72b4000	! t0_kref+0x45bc:   	sll	%o5, %g0, %l3
	.word	0xa8d030bc	! t0_kref+0x45c0:   	umulcc	%g0, -0xf44, %l4
	.word	0x95b2054e	! t0_kref+0x45c4:   	fcmpeq16	%f8, %f14, %o2
	.word	0xe6100019	! t0_kref+0x45c8:   	lduh	[%g0 + %i1], %l3
	.word	0x9144c000	! t0_kref+0x45cc:   	mov	%gsr, %o0
	.word	0xa9a000b3	! t0_kref+0x45d0:   	fnegs	%f19, %f20
	.word	0x99b3cdec	! t0_kref+0x45d4:   	fnands	%f15, %f12, %f12
	.word	0xe81e001d	! t0_kref+0x45d8:   	ldd	[%i0 + %i5], %l4
	.word	0xa8a8000c	! t0_kref+0x45dc:   	andncc	%g0, %o4, %l4
	.word	0xa926801a	! t0_kref+0x45e0:   	mulscc	%i2, %i2, %l4
	.word	0x9da0002c	! t0_kref+0x45e4:   	fmovs	%f12, %f14
	.word	0x8d837d7a	! t0_kref+0x45e8:   	wr	%o5, 0xfffffd7a, %fprs
	.word	0xa1a84028	! t0_kref+0x45ec:   	fmovsne	%fcc0, %f8, %f16
	.word	0xe4086384	! t0_kref+0x45f0:   	ldub	[%g1 + 0x384], %l2
	.word	0xa41ca00c	! t0_kref+0x45f4:   	xor	%l2, 0xc, %l2
	.word	0xe4286384	! t0_kref+0x45f8:   	stb	%l2, [%g1 + 0x384]
	.word	0x81d86384	! t0_kref+0x45fc:   	flush	%g1 + 0x384
	.word	0xe808a021	! t0_kref+0x4600:   	ldub	[%g2 + 0x21], %l4
	.word	0x97a28832	! t0_kref+0x4604:   	fadds	%f10, %f18, %f11
	.word	0x92468000	! t0_kref+0x4608:   	addc	%i2, %g0, %o1
	.word	0xa7a000ae	! t0_kref+0x460c:   	fnegs	%f14, %f19
	.word	0xd410a018	! t0_kref+0x4610:   	lduh	[%g2 + 0x18], %o2
	.word	0xad400000	! t0_kref+0x4614:   	mov	%y, %l6
	.word	0xae5b400c	! t0_kref+0x4618:   	smul	%o5, %o4, %l7
	.word	0x9290001a	! t0_kref+0x461c:   	orcc	%g0, %i2, %o1
2:	.word	0xa1a01933	! t0_kref+0x4620:   	fstod	%f19, %f16
	.word	0x1131ed63	! t0_kref+0x4624:   	sethi	%hi(0xc7b58c00), %o0
	.word	0xf42e7fee	! t0_kref+0x4628:   	stb	%i2, [%i1 - 0x12]
	.word	0xa65e800d	! t0_kref+0x462c:   	smul	%i2, %o5, %l3
	.word	0xa6e37a62	! t0_kref+0x4630:   	subccc	%o5, -0x59e, %l3
	.word	0x9113000c	! t0_kref+0x4634:   	taddcctv	%o4, %o4, %o0
	.word	0xd81e3ff8	! t0_kref+0x4638:   	ldd	[%i0 - 8], %o4
	.word	0xd240a000	! t0_kref+0x463c:   	ldsw	[%g2], %o1
	.word	0xd4981018	! t0_kref+0x4640:   	ldda	[%g0 + %i0]0x80, %o2
	.word	0xa69b400d	! t0_kref+0x4644:   	xorcc	%o5, %o5, %l3
	.word	0xea40a008	! t0_kref+0x4648:   	ldsw	[%g2 + 8], %l5
	.word	0x31800001	! t0_kref+0x464c:   	fba,a	_kref+0x4650
	.word	0xf430a000	! t0_kref+0x4650:   	sth	%i2, [%g2]
	.word	0x95400000	! t0_kref+0x4654:   	mov	%y, %o2
	.word	0x9db28ea0	! t0_kref+0x4658:   	fsrc1s	%f10, %f14
	.word	0x99a000aa	! t0_kref+0x465c:   	fnegs	%f10, %f12
	.word	0x93a01a4e	! t0_kref+0x4660:   	fdtoi	%f14, %f9
	.word	0x95b386ca	! t0_kref+0x4664:   	fmul8sux16	%f14, %f10, %f10
	.word	0x92c3401a	! t0_kref+0x4668:   	addccc	%o5, %i2, %o1
	.word	0xe51e3fe8	! t0_kref+0x466c:   	ldd	[%i0 - 0x18], %f18
	.word	0xaedb6c20	! t0_kref+0x4670:   	smulcc	%o5, 0xc20, %l7
	.word	0xa1a01a33	! t0_kref+0x4674:   	fstoi	%f19, %f16
	.word	0xa6003ffd	! t0_kref+0x4678:   	add	%g0, -0x3, %l3
	.word	0x94603b92	! t0_kref+0x467c:   	subc	%g0, -0x46e, %o2
	.word	0x95a30848	! t0_kref+0x4680:   	faddd	%f12, %f8, %f10
	.word	0xdd00a030	! t0_kref+0x4684:   	ld	[%g2 + 0x30], %f14
	.word	0x9fb24ded	! t0_kref+0x4688:   	fnands	%f9, %f13, %f15
	.word	0xabb00200	! t0_kref+0x468c:   	array8	%g0, %g0, %l5
	.word	0xea56c019	! t0_kref+0x4690:   	ldsh	[%i3 + %i1], %l5
	.word	0xa5b4cdf5	! t0_kref+0x4694:   	fnands	%f19, %f21, %f18
	.word	0xd280a038	! t0_kref+0x4698:   	lda	[%g2 + 0x38]%asi, %o1
	.word	0x97a348a8	! t0_kref+0x469c:   	fsubs	%f13, %f8, %f11
	.word	0x948e8000	! t0_kref+0x46a0:   	andcc	%i2, %g0, %o2
	.word	0xa83ebc44	! t0_kref+0x46a4:   	xnor	%i2, -0x3bc, %l4
	.word	0x9da00531	! t0_kref+0x46a8:   	fsqrts	%f17, %f14
	.word	0x97a01a4c	! t0_kref+0x46ac:   	fdtoi	%f12, %f11
	.word	0xaf408000	! t0_kref+0x46b0:   	mov	%ccr, %l7
	sethi	%hi(2f), %o7
	.word	0xe40be2d8	! t0_kref+0x46b8:   	ldub	[%o7 + 0x2d8], %l2
	.word	0xa41ca00c	! t0_kref+0x46bc:   	xor	%l2, 0xc, %l2
	.word	0xe42be2d8	! t0_kref+0x46c0:   	stb	%l2, [%o7 + 0x2d8]
	.word	0x81dbe2d8	! t0_kref+0x46c4:   	flush	%o7 + 0x2d8
	.word	0xa5a309ac	! t0_kref+0x46c8:   	fdivs	%f12, %f12, %f18
	.word	0x9da00132	! t0_kref+0x46cc:   	fabss	%f18, %f14
	.word	0x9528001a	! t0_kref+0x46d0:   	sll	%g0, %i2, %o2
	.word	0xe51fbe98	! t0_kref+0x46d4:   	ldd	[%fp - 0x168], %f18
2:	.word	0xa6430000	! t0_kref+0x46d8:   	addc	%o4, %g0, %l3
	.word	0xaeb37a5d	! t0_kref+0x46dc:   	orncc	%o5, -0x5a3, %l7
	.word	0xa3a00133	! t0_kref+0x46e0:   	fabss	%f19, %f17
	.word	0xeed65000	! t0_kref+0x46e4:   	ldsha	[%i1]0x80, %l7
	.word	0xac1e8000	! t0_kref+0x46e8:   	xor	%i2, %g0, %l6
	.word	0xad3b000d	! t0_kref+0x46ec:   	sra	%o4, %o5, %l6
	.word	0xae732d66	! t0_kref+0x46f0:   	udiv	%o4, 0xd66, %l7
	.word	0x95b3008c	! t0_kref+0x46f4:   	edge16	%o4, %o4, %o2
	.word	0x81834000	! t0_kref+0x46f8:   	wr	%o5, %g0, %y
	.word	0xa5a208c8	! t0_kref+0x46fc:   	fsubd	%f8, %f8, %f18
	.word	0xa3a01894	! t0_kref+0x4700:   	fitos	%f20, %f17
	.word	0xa89e801a	! t0_kref+0x4704:   	xorcc	%i2, %i2, %l4
	.word	0x9ba00131	! t0_kref+0x4708:   	fabss	%f17, %f13
	.word	0xa5a408cc	! t0_kref+0x470c:   	fsubd	%f16, %f12, %f18
	.word	0xa3a01088	! t0_kref+0x4710:   	fxtos	%f8, %f17
	.word	0x81ac0a34	! t0_kref+0x4714:   	fcmps	%fcc0, %f16, %f20
	.word	0xa9a01910	! t0_kref+0x4718:   	fitod	%f16, %f20
	.word	0xc568a040	! t0_kref+0x471c:   	prefetch	%g2 + 0x40, 2
	.word	0xaab8001a	! t0_kref+0x4720:   	xnorcc	%g0, %i2, %l5
	.word	0x94ab001a	! t0_kref+0x4724:   	andncc	%o4, %i2, %o2
	.word	0xaee3400c	! t0_kref+0x4728:   	subccc	%o5, %o4, %l7
	.word	0x90032bdc	! t0_kref+0x472c:   	add	%o4, 0xbdc, %o0
	.word	0x94a0000c	! t0_kref+0x4730:   	subcc	%g0, %o4, %o2
	.word	0xa9b68280	! t0_kref+0x4734:   	array32	%i2, %g0, %l4
	.word	0xaec30000	! t0_kref+0x4738:   	addccc	%o4, %g0, %l7
	.word	0x9266b864	! t0_kref+0x473c:   	subc	%i2, -0x79c, %o1
	.word	0x91a308a8	! t0_kref+0x4740:   	fsubs	%f12, %f8, %f8
	.word	0xc0366006	! t0_kref+0x4744:   	clrh	[%i1 + 6]
	.word	0xaa06b673	! t0_kref+0x4748:   	add	%i2, -0x98d, %l5
	.word	0x93b38a6d	! t0_kref+0x474c:   	fpadd32s	%f14, %f13, %f9
	.word	0xd086601c	! t0_kref+0x4750:   	lda	[%i1 + 0x1c]%asi, %o0
	.word	0xaa936de0	! t0_kref+0x4754:   	orcc	%o5, 0xde0, %l5
	.word	0xa936801a	! t0_kref+0x4758:   	srl	%i2, %i2, %l4
	.word	0xa73b401a	! t0_kref+0x475c:   	sra	%o5, %i2, %l3
	.word	0xa1a388aa	! t0_kref+0x4760:   	fsubs	%f14, %f10, %f16
	.word	0xc026001c	! t0_kref+0x4764:   	clr	[%i0 + %i4]
	.word	0xe51fbef8	! t0_kref+0x4768:   	ldd	[%fp - 0x108], %f18
	.word	0x81868000	! t0_kref+0x476c:   	wr	%i2, %g0, %y
	.word	0x99b287d0	! t0_kref+0x4770:   	pdist	%f10, %f16, %f12
	.word	0x81aa0ad0	! t0_kref+0x4774:   	fcmped	%fcc0, %f8, %f16
	.word	0x905b000c	! t0_kref+0x4778:   	smul	%o4, %o4, %o0
	.word	0xafb00020	! t0_kref+0x477c:   	edge8n	%g0, %g0, %l7
	.word	0x99b40cb4	! t0_kref+0x4780:   	fandnot2s	%f16, %f20, %f12
	.word	0xa5b40c8a	! t0_kref+0x4784:   	fandnot2	%f16, %f10, %f18
	.word	0xaae6800c	! t0_kref+0x4788:   	subccc	%i2, %o4, %l5
	.word	0xec7e3fe0	! t0_kref+0x478c:   	swap	[%i0 - 0x20], %l6
	.word	0x943b0000	! t0_kref+0x4790:   	not	%o4, %o2
	.word	0x91a00535	! t0_kref+0x4794:   	fsqrts	%f21, %f8
	.word	0xaabb63c1	! t0_kref+0x4798:   	xnorcc	%o5, 0x3c1, %l5
	.word	0xa1b00cec	! t0_kref+0x479c:   	fnot2s	%f12, %f16
	.word	0xae5b29e6	! t0_kref+0x47a0:   	smul	%o4, 0x9e6, %l7
	.word	0xf207bfe0	! t0_kref+0x47a4:   	ld	[%fp - 0x20], %i1
	.word	0x31480007	! t0_kref+0x47a8:   	fba,a,pt	%fcc0, _kref+0x47c4
	.word	0xd200a010	! t0_kref+0x47ac:   	ld	[%g2 + 0x10], %o1
	.word	0xc0b01019	! t0_kref+0x47b0:   	stha	%g0, [%g0 + %i1]0x80
	.word	0xa9a48848	! t0_kref+0x47b4:   	faddd	%f18, %f8, %f20
	.word	0x9fa3c9aa	! t0_kref+0x47b8:   	fdivs	%f15, %f10, %f15
	.word	0xe8865000	! t0_kref+0x47bc:   	lda	[%i1]0x80, %l4
	.word	0x950b4000	! t0_kref+0x47c0:   	tsubcc	%o5, %g0, %o2
	.word	0x91b54ca8	! t0_kref+0x47c4:   	fandnot2s	%f21, %f8, %f8
	.word	0xa5b007b2	! t0_kref+0x47c8:   	fpackfix	%f18, %f18
	.word	0xf4266018	! t0_kref+0x47cc:   	st	%i2, [%i1 + 0x18]
	.word	0x92582589	! t0_kref+0x47d0:   	smul	%g0, 0x589, %o1
	.word	0xa70b3880	! t0_kref+0x47d4:   	tsubcc	%o4, -0x780, %l3
	.word	0x905b000d	! t0_kref+0x47d8:   	smul	%o4, %o5, %o0
	.word	0x91a209ce	! t0_kref+0x47dc:   	fdivd	%f8, %f14, %f8
	.word	0xa878001a	! t0_kref+0x47e0:   	sdiv	%g0, %i2, %l4
	.word	0x94003922	! t0_kref+0x47e4:   	add	%g0, -0x6de, %o2
	.word	0x94280000	! t0_kref+0x47e8:   	andn	%g0, %g0, %o2
	.word	0xc1e8a04c	! t0_kref+0x47ec:   	prefetcha	%g2 + 0x4c, 0
	.word	0x81ac8a4a	! t0_kref+0x47f0:   	fcmpd	%fcc0, %f18, %f10
	.word	0xac3b6af0	! t0_kref+0x47f4:   	xnor	%o5, 0xaf0, %l6
	.word	0x9f414000	! t0_kref+0x47f8:   	mov	%pc, %o7
!	.word	0x214f1dfe	! t0_kref+0x47fc:   	fbn,a,pt	%fcc0, SYM(t0_subr1)
	   	fbn,a,pt	%fcc0, SYM(t0_subr1)
	.word	0xae9ea10e	! t0_kref+0x4800:   	xorcc	%i2, 0x10e, %l7
	.word	0xab3b6019	! t0_kref+0x4804:   	sra	%o5, 0x19, %l5
	.word	0x9db00fc0	! t0_kref+0x4808:   	fone	%f14
	.word	0xab1b000c	! t0_kref+0x480c:   	tsubcctv	%o4, %o4, %l5
	.word	0xa61b4000	! t0_kref+0x4810:   	xor	%o5, %g0, %l3
	.word	0xdda62004	! t0_kref+0x4814:   	sta	%f14, [%i0 + 4]%asi
	.word	0xa7b68280	! t0_kref+0x4818:   	array32	%i2, %g0, %l3
	.word	0xea5e2000	! t0_kref+0x481c:   	ldx	[%i0], %l5
	.word	0xa5b24eea	! t0_kref+0x4820:   	fornot2s	%f9, %f10, %f18
	.word	0x3a480003	! t0_kref+0x4824:   	bcc,a,pt	%icc, _kref+0x4830
	.word	0xaba9c033	! t0_kref+0x4828:   	fmovsu	%fcc0, %f19, %f21
	.word	0x92a00000	! t0_kref+0x482c:   	subcc	%g0, %g0, %o1
	.word	0xc16e400d	! t0_kref+0x4830:   	prefetch	%i1 + %o5, 0
	.word	0xe700a020	! t0_kref+0x4834:   	ld	[%g2 + 0x20], %f19
	.word	0xaba01890	! t0_kref+0x4838:   	fitos	%f16, %f21
	.word	0xdb00a028	! t0_kref+0x483c:   	ld	[%g2 + 0x28], %f13
	.word	0xa1b3070d	! t0_kref+0x4840:   	fmuld8sux16	%f12, %f13, %f16
	.word	0xd080a008	! t0_kref+0x4844:   	lda	[%g2 + 8]%asi, %o0
	.word	0x23480007	! t0_kref+0x4848:   	fbne,a,pt	%fcc0, _kref+0x4864
	.word	0x9206a31a	! t0_kref+0x484c:   	add	%i2, 0x31a, %o1
	.word	0xd8a8a02a	! t0_kref+0x4850:   	stba	%o4, [%g2 + 0x2a]%asi
	.word	0xa9400000	! t0_kref+0x4854:   	mov	%y, %l4
	.word	0x9ba309ae	! t0_kref+0x4858:   	fdivs	%f12, %f14, %f13
	.word	0x95a3094c	! t0_kref+0x485c:   	fmuld	%f12, %f12, %f10
	.word	0xaba0002a	! t0_kref+0x4860:   	fmovs	%f10, %f21
	.word	0xe500a020	! t0_kref+0x4864:   	ld	[%g2 + 0x20], %f18
	.word	0xea08a032	! t0_kref+0x4868:   	ldub	[%g2 + 0x32], %l5
	.word	0x878020d2	! t0_kref+0x486c:   	mov	0xd2, %asi
	.word	0xe900a038	! t0_kref+0x4870:   	ld	[%g2 + 0x38], %f20
	.word	0xe810a01a	! t0_kref+0x4874:   	lduh	[%g2 + 0x1a], %l4
	.word	0xeed01019	! t0_kref+0x4878:   	ldsha	[%g0 + %i1]0x80, %l7
	.word	0xe408662c	! t0_kref+0x487c:   	ldub	[%g1 + 0x62c], %l2
	.word	0xa41ca00c	! t0_kref+0x4880:   	xor	%l2, 0xc, %l2
	.word	0xe428662c	! t0_kref+0x4884:   	stb	%l2, [%g1 + 0x62c]
	.word	0x81d8662c	! t0_kref+0x4888:   	flush	%g1 + 0x62c
	.word	0xd4ee101a	! t0_kref+0x488c:   	ldstuba	[%i0 + %i2]0x80, %o2
	.word	0xc36e6018	! t0_kref+0x4890:   	prefetch	%i1 + 0x18, 1
	.word	0xa3a0052d	! t0_kref+0x4894:   	fsqrts	%f13, %f17
	.word	0xf4367fe0	! t0_kref+0x4898:   	sth	%i2, [%i1 - 0x20]
	.word	0xd200a038	! t0_kref+0x489c:   	ld	[%g2 + 0x38], %o1
	.word	0xe848a020	! t0_kref+0x48a0:   	ldsb	[%g2 + 0x20], %l4
	.word	0xe27f0019	! t0_kref+0x48a4:   	swap	[%i4 + %i1], %l1
	.word	0x9fa488a8	! t0_kref+0x48a8:   	fsubs	%f18, %f8, %f15
	.word	0xabb0014d	! t0_kref+0x48ac:   	edge32l	%g0, %o5, %l5
	.word	0xae33400d	! t0_kref+0x48b0:   	orn	%o5, %o5, %l7
	.word	0x99a01108	! t0_kref+0x48b4:   	fxtod	%f8, %f12
	.word	0xe91e3ff0	! t0_kref+0x48b8:   	ldd	[%i0 - 0x10], %f20
	.word	0x908b4000	! t0_kref+0x48bc:   	andcc	%o5, %g0, %o0
	.word	0xeb060000	! t0_kref+0x48c0:   	ld	[%i0], %f21
	.word	0x94c0242c	! t0_kref+0x48c4:   	addccc	%g0, 0x42c, %o2
2:	.word	0xa9a01934	! t0_kref+0x48c8:   	fstod	%f20, %f20
	.word	0xa9a3894e	! t0_kref+0x48cc:   	fmuld	%f14, %f14, %f20
	.word	0xaa93001a	! t0_kref+0x48d0:   	orcc	%o4, %i2, %l5
	.word	0xd0c71019	! t0_kref+0x48d4:   	ldswa	[%i4 + %i1]0x80, %o0
	.word	0xe968a0c3	! t0_kref+0x48d8:   	prefetch	%g2 + 0xc3, 20
	.word	0xa5a0108c	! t0_kref+0x48dc:   	fxtos	%f12, %f18
	.word	0xaea3401a	! t0_kref+0x48e0:   	subcc	%o5, %i2, %l7
	.word	0xa9a38850	! t0_kref+0x48e4:   	faddd	%f14, %f16, %f20
	.word	0x933ea002	! t0_kref+0x48e8:   	sra	%i2, 0x2, %o1
	.word	0xd500a018	! t0_kref+0x48ec:   	ld	[%g2 + 0x18], %f10
	.word	0xa8b02875	! t0_kref+0x48f0:   	orncc	%g0, 0x875, %l4
	.word	0xc036c019	! t0_kref+0x48f4:   	clrh	[%i3 + %i1]
	.word	0xf430a03a	! t0_kref+0x48f8:   	sth	%i2, [%g2 + 0x3a]
	.word	0xa7b3ca6d	! t0_kref+0x48fc:   	fpadd32s	%f15, %f13, %f19
	.word	0xa1b3c673	! t0_kref+0x4900:   	fmul8x16au	%f15, %f19, %f16
	.word	0xc0780018	! t0_kref+0x4904:   	swap	[%g0 + %i0], %g0
	.word	0x93b3003a	! t0_kref+0x4908:   	edge8n	%o4, %i2, %o1
	.word	0x9db30709	! t0_kref+0x490c:   	fmuld8sux16	%f12, %f9, %f14
	.word	0xac634000	! t0_kref+0x4910:   	subc	%o5, %g0, %l6
	.word	0xd4be101d	! t0_kref+0x4914:   	stda	%o2, [%i0 + %i5]0x80
	.word	0x9033001a	! t0_kref+0x4918:   	orn	%o4, %i2, %o0
	.word	0xaedb000c	! t0_kref+0x491c:   	smulcc	%o4, %o4, %l7
	.word	0xac53357b	! t0_kref+0x4920:   	umul	%o4, -0xa85, %l6
	.word	0xec560000	! t0_kref+0x4924:   	ldsh	[%i0], %l6
	.word	0x9da0012b	! t0_kref+0x4928:   	fabss	%f11, %f14
	.word	0x99a0190f	! t0_kref+0x492c:   	fitod	%f15, %f12
	.word	0x90980000	! t0_kref+0x4930:   	xorcc	%g0, %g0, %o0
	.word	0xafb34200	! t0_kref+0x4934:   	array8	%o5, %g0, %l7
	.word	0x9ba01a52	! t0_kref+0x4938:   	fdtoi	%f18, %f13
	.word	0xd06e4000	! t0_kref+0x493c:   	ldstub	[%i1], %o0
	.word	0xf4367ff2	! t0_kref+0x4940:   	sth	%i2, [%i1 - 0xe]
	.word	0xaedb63a5	! t0_kref+0x4944:   	smulcc	%o5, 0x3a5, %l7
	.word	0xa5a508ab	! t0_kref+0x4948:   	fsubs	%f20, %f11, %f18
	.word	0xa9400000	! t0_kref+0x494c:   	mov	%y, %l4
	.word	0xba103ff8	! t0_kref+0x4950:   	mov	0xfffffff8, %i5
	.word	0xef68a0cf	! t0_kref+0x4954:   	prefetch	%g2 + 0xcf, 23
	.word	0xaba00534	! t0_kref+0x4958:   	fsqrts	%f20, %f21
	.word	0x81d8001d	! t0_kref+0x495c:   	flush	%g0 + %i5
	.word	0xa3a408b5	! t0_kref+0x4960:   	fsubs	%f16, %f21, %f17
	.word	0xa1a01094	! t0_kref+0x4964:   	fxtos	%f20, %f16
	.word	0x8d83401a	! t0_kref+0x4968:   	wr	%o5, %i2, %fprs
	.word	0xaebb000d	! t0_kref+0x496c:   	xnorcc	%o4, %o5, %l7
	.word	0xd468a003	! t0_kref+0x4970:   	ldstub	[%g2 + 3], %o2
	.word	0xe11fbd98	! t0_kref+0x4974:   	ldd	[%fp - 0x268], %f16
	.word	0xaabe800c	! t0_kref+0x4978:   	xnorcc	%i2, %o4, %l5
	.word	0xea166004	! t0_kref+0x497c:   	lduh	[%i1 + 4], %l5
	.word	0x9fa00533	! t0_kref+0x4980:   	fsqrts	%f19, %f15
	.word	0x91a288d2	! t0_kref+0x4984:   	fsubd	%f10, %f18, %f8
	.word	0x9db34af3	! t0_kref+0x4988:   	fpsub32s	%f13, %f19, %f14
	.word	0xd300a020	! t0_kref+0x498c:   	ld	[%g2 + 0x20], %f9
	.word	0xdd1e7ff0	! t0_kref+0x4990:   	ldd	[%i1 - 0x10], %f14
	.word	0x91400000	! t0_kref+0x4994:   	mov	%y, %o0
	.word	0x81dea8f0	! t0_kref+0x4998:   	flush	%i2 + 0x8f0
	.word	0xd51e3fe0	! t0_kref+0x499c:   	ldd	[%i0 - 0x20], %f10
	.word	0xa863000d	! t0_kref+0x49a0:   	subc	%o4, %o5, %l4
	.word	0x94ab683e	! t0_kref+0x49a4:   	andncc	%o5, 0x83e, %o2
	.word	0x9de3bfa0	! t0_kref+0x49a8:   	save	%sp, -0x60, %sp
	.word	0xa7ee4018	! t0_kref+0x49ac:   	restore	%i1, %i0, %l3
	.word	0xda20a028	! t0_kref+0x49b0:   	st	%o5, [%g2 + 0x28]
	.word	0xa7a01a28	! t0_kref+0x49b4:   	fstoi	%f8, %f19
	.word	0xa7400000	! t0_kref+0x49b8:   	mov	%y, %l3
	.word	0x99a01914	! t0_kref+0x49bc:   	fitod	%f20, %f12
	.word	0xf207bfe0	! t0_kref+0x49c0:   	ld	[%fp - 0x20], %i1
	.word	0xea16001b	! t0_kref+0x49c4:   	lduh	[%i0 + %i3], %l5
	.word	0xc020a018	! t0_kref+0x49c8:   	clr	[%g2 + 0x18]
	.word	0xc0a81018	! t0_kref+0x49cc:   	stba	%g0, [%g0 + %i0]0x80
	.word	0x3c800008	! t0_kref+0x49d0:   	bpos,a	_kref+0x49f0
	.word	0xa5a549b4	! t0_kref+0x49d4:   	fdivs	%f21, %f20, %f18
	.word	0x38480002	! t0_kref+0x49d8:   	bgu,a,pt	%icc, _kref+0x49e0
	.word	0xae66b3f3	! t0_kref+0x49dc:   	subc	%i2, -0xc0d, %l7
	.word	0xe4ee9019	! t0_kref+0x49e0:   	ldstuba	[%i2 + %i1]0x80, %l2
	.word	0xaf3b001a	! t0_kref+0x49e4:   	sra	%o4, %i2, %l7
	.word	0xa8a6800c	! t0_kref+0x49e8:   	subcc	%i2, %o4, %l4
	.word	0x9290000d	! t0_kref+0x49ec:   	orcc	%g0, %o5, %o1
	.word	0x81d8228b	! t0_kref+0x49f0:   	flush	%g0 + 0x28b
	.word	0x37800005	! t0_kref+0x49f4:   	fbge,a	_kref+0x4a08
	.word	0xaba0052c	! t0_kref+0x49f8:   	fsqrts	%f12, %f21
	.word	0xa728001a	! t0_kref+0x49fc:   	sll	%g0, %i2, %l3
	.word	0x93b6834c	! t0_kref+0x4a00:   	alignaddrl	%i2, %o4, %o1
	.word	0xa73b600b	! t0_kref+0x4a04:   	sra	%o5, 0xb, %l3
	.word	0xa5a3894e	! t0_kref+0x4a08:   	fmuld	%f14, %f14, %f18
	.word	0xd11fbe68	! t0_kref+0x4a0c:   	ldd	[%fp - 0x198], %f8
	.word	0xa6b8001a	! t0_kref+0x4a10:   	xnorcc	%g0, %i2, %l3
	.word	0xa81b401a	! t0_kref+0x4a14:   	xor	%o5, %i2, %l4
	.word	0x97b50cb2	! t0_kref+0x4a18:   	fandnot2s	%f20, %f18, %f11
	.word	0x91a408ce	! t0_kref+0x4a1c:   	fsubd	%f16, %f14, %f8
	.word	0x9da38850	! t0_kref+0x4a20:   	faddd	%f14, %f16, %f14
	.word	0xa3a00134	! t0_kref+0x4a24:   	fabss	%f20, %f17
	.word	0x9da24835	! t0_kref+0x4a28:   	fadds	%f9, %f21, %f14
	.word	0x99b306ee	! t0_kref+0x4a2c:   	fmul8ulx16	%f12, %f14, %f12
	.word	0xe816200c	! t0_kref+0x4a30:   	lduh	[%i0 + 0xc], %l4
	.word	0x90fb3055	! t0_kref+0x4a34:   	sdivcc	%o4, -0xfab, %o0
	.word	0xaba0012e	! t0_kref+0x4a38:   	fabss	%f14, %f21
	.word	0x99a01112	! t0_kref+0x4a3c:   	fxtod	%f18, %f12
	.word	0x81580000	! t0_kref+0x4a40:   	flushw
	.word	0x21480005	! t0_kref+0x4a44:   	fbn,a,pt	%fcc0, _kref+0x4a58
	.word	0xa640001a	! t0_kref+0x4a48:   	addc	%g0, %i2, %l3
	.word	0x81ac8a4e	! t0_kref+0x4a4c:   	fcmpd	%fcc0, %f18, %f14
	.word	0xd1380018	! t0_kref+0x4a50:   	std	%f8, [%g0 + %i0]
	.word	0xd93e001d	! t0_kref+0x4a54:   	std	%f12, [%i0 + %i5]
	.word	0xa5b50f8c	! t0_kref+0x4a58:   	for	%f20, %f12, %f18
	.word	0xd27e001c	! t0_kref+0x4a5c:   	swap	[%i0 + %i4], %o1
	.word	0xa9a308ca	! t0_kref+0x4a60:   	fsubd	%f12, %f10, %f20
	.word	0xaa6320b4	! t0_kref+0x4a64:   	subc	%o4, 0xb4, %l5
	.word	0xda36201e	! t0_kref+0x4a68:   	sth	%o5, [%i0 + 0x1e]
	.word	0x99a00528	! t0_kref+0x4a6c:   	fsqrts	%f8, %f12
	.word	0xc0360000	! t0_kref+0x4a70:   	clrh	[%i0]
	.word	0x9540c000	! t0_kref+0x4a74:   	mov	%asi, %o2
	.word	0x9e0067e0	! t0_kref+0x4a78:   	add	%g1, 0x7e0, %o7
!	.word	0x234f1d5e	! t0_kref+0x4a7c:   	fbne,a,pt	%fcc0, SYM(t0_subr1)
	   	fbne,a,pt	%fcc0, SYM(t0_subr1)
	.word	0xa5b50c88	! t0_kref+0x4a80:   	fandnot2	%f20, %f8, %f18
	.word	0xa1a209b5	! t0_kref+0x4a84:   	fdivs	%f8, %f21, %f16
	.word	0xe11fbeb0	! t0_kref+0x4a88:   	ldd	[%fp - 0x150], %f16
	.word	0xe848a02b	! t0_kref+0x4a8c:   	ldsb	[%g2 + 0x2b], %l4
	.word	0xa3b007ae	! t0_kref+0x4a90:   	fpackfix	%f14, %f17
	.word	0xa83b700d	! t0_kref+0x4a94:   	xnor	%o5, -0xff3, %l4
	.word	0x99a0190e	! t0_kref+0x4a98:   	fitod	%f14, %f12
	.word	0xa8202b97	! t0_kref+0x4a9c:   	sub	%g0, 0xb97, %l4
	.word	0x93a489b4	! t0_kref+0x4aa0:   	fdivs	%f18, %f20, %f9
	.word	0xa9a01914	! t0_kref+0x4aa4:   	fitod	%f20, %f20
	.word	0xda2e8018	! t0_kref+0x4aa8:   	stb	%o5, [%i2 + %i0]
	.word	0x97a00529	! t0_kref+0x4aac:   	fsqrts	%f9, %f11
	.word	0x95b00f10	! t0_kref+0x4ab0:   	fsrc2	%f16, %f10
	.word	0x9ba01894	! t0_kref+0x4ab4:   	fitos	%f20, %f13
	.word	0xec6e0000	! t0_kref+0x4ab8:   	ldstub	[%i0], %l6
	.word	0xd99e501d	! t0_kref+0x4abc:   	ldda	[%i1 + %i5]0x80, %f12
	.word	0xa8bb7928	! t0_kref+0x4ac0:   	xnorcc	%o5, -0x6d8, %l4
	.word	0x9570000d	! t0_kref+0x4ac4:   	popc	%o5, %o2
	.word	0xa5b50f6e	! t0_kref+0x4ac8:   	fornot1s	%f20, %f14, %f18
	.word	0x9ba00134	! t0_kref+0x4acc:   	fabss	%f20, %f13
	.word	0xc368a083	! t0_kref+0x4ad0:   	prefetch	%g2 + 0x83, 1
	.word	0xd820a000	! t0_kref+0x4ad4:   	st	%o4, [%g2]
	.word	0x95a28952	! t0_kref+0x4ad8:   	fmuld	%f10, %f18, %f10
	.word	0xa838000c	! t0_kref+0x4adc:   	xnor	%g0, %o4, %l4
	.word	0xe700a000	! t0_kref+0x4ae0:   	ld	[%g2], %f19
	.word	0x81db401a	! t0_kref+0x4ae4:   	flush	%o5 + %i2
	.word	0xa3b007a8	! t0_kref+0x4ae8:   	fpackfix	%f8, %f17
	.word	0xac9b7634	! t0_kref+0x4aec:   	xorcc	%o5, -0x9cc, %l6
	.word	0x9ba0012a	! t0_kref+0x4af0:   	fabss	%f10, %f13
	.word	0xad3e800c	! t0_kref+0x4af4:   	sra	%i2, %o4, %l6
	.word	0xa1a000b1	! t0_kref+0x4af8:   	fnegs	%f17, %f16
	.word	0x9da40835	! t0_kref+0x4afc:   	fadds	%f16, %f21, %f14
	.word	0x9db48c8a	! t0_kref+0x4b00:   	fandnot2	%f18, %f10, %f14
	.word	0x91b3ce2c	! t0_kref+0x4b04:   	fands	%f15, %f12, %f8
	.word	0x92568000	! t0_kref+0x4b08:   	umul	%i2, %g0, %o1
	call	1f
	.empty
	.word	0x91b50a48	! t0_kref+0x4b10:   	fpadd32	%f20, %f8, %f8
	.word	0x91a01a35	! t0_kref+0x4b14:   	fstoi	%f21, %f8
	.word	0x91b3434c	! t0_kref+0x4b18:   	alignaddrl	%o5, %o4, %o0
	.word	0x33480003	! t0_kref+0x4b1c:   	fbe,a,pt	%fcc0, _kref+0x4b28
	.word	0xda20a038	! t0_kref+0x4b20:   	st	%o5, [%g2 + 0x38]
	.word	0xa3a308ad	! t0_kref+0x4b24:   	fsubs	%f12, %f13, %f17
	.word	0x99b007b4	! t0_kref+0x4b28:   	fpackfix	%f20, %f12
1:	.word	0x99b48d40	! t0_kref+0x4b2c:   	fnot1	%f18, %f12
	.word	0x9da388ab	! t0_kref+0x4b30:   	fsubs	%f14, %f11, %f14
	.word	0xd0d6101b	! t0_kref+0x4b34:   	ldsha	[%i0 + %i3]0x80, %o0
	.word	0x9bb30ea0	! t0_kref+0x4b38:   	fsrc1s	%f12, %f13
	.word	0xaba309b1	! t0_kref+0x4b3c:   	fdivs	%f12, %f17, %f21
	.word	0xd2163ffc	! t0_kref+0x4b40:   	lduh	[%i0 - 4], %o1
	.word	0x9fc10000	! t0_kref+0x4b44:   	call	%g4
	.word	0xa81ead9a	! t0_kref+0x4b48:   	xor	%i2, 0xd9a, %l4
	.word	0x99a00533	! t0_kref+0x4b4c:   	fsqrts	%f19, %f12
	.word	0xe91e7fe8	! t0_kref+0x4b50:   	ldd	[%i1 - 0x18], %f20
	.word	0x9fc10000	! t0_kref+0x4b54:   	call	%g4
	.word	0xa5a48950	! t0_kref+0x4b58:   	fmuld	%f18, %f16, %f18
	.word	0x93a00528	! t0_kref+0x4b5c:   	fsqrts	%f8, %f9
	.word	0xe91fbe98	! t0_kref+0x4b60:   	ldd	[%fp - 0x168], %f20
	.word	0x81ab8ab3	! t0_kref+0x4b64:   	fcmpes	%fcc0, %f14, %f19
	.word	0xe1be188c	! t0_kref+0x4b68:   	stda	%f16, [%i0 + %o4]0xc4
	.word	0xd41e401d	! t0_kref+0x4b6c:   	ldd	[%i1 + %i5], %o2
	.word	0xed68a007	! t0_kref+0x4b70:   	prefetch	%g2 + 7, 22
	.word	0xea56001b	! t0_kref+0x4b74:   	ldsh	[%i0 + %i3], %l5
	.word	0xa9b40e48	! t0_kref+0x4b78:   	fxnor	%f16, %f8, %f20
	.word	0xa9b446ae	! t0_kref+0x4b7c:   	fmul8x16al	%f17, %f14, %f20
	.word	0x39480001	! t0_kref+0x4b80:   	fbuge,a,pt	%fcc0, _kref+0x4b84
	.word	0xae3eae60	! t0_kref+0x4b84:   	xnor	%i2, 0xe60, %l7
	.word	0x928375b5	! t0_kref+0x4b88:   	addcc	%o5, -0xa4b, %o1
	.word	0xaba0002c	! t0_kref+0x4b8c:   	fmovs	%f12, %f21
	sethi	%hi(2f), %o7
	.word	0xe40be3c4	! t0_kref+0x4b94:   	ldub	[%o7 + 0x3c4], %l2
	.word	0xa41ca00c	! t0_kref+0x4b98:   	xor	%l2, 0xc, %l2
	.word	0xe42be3c4	! t0_kref+0x4b9c:   	stb	%l2, [%o7 + 0x3c4]
	.word	0x81dbe3c4	! t0_kref+0x4ba0:   	flush	%o7 + 0x3c4
	.word	0x81ac0aca	! t0_kref+0x4ba4:   	fcmped	%fcc0, %f16, %f10
	.word	0xae9eab55	! t0_kref+0x4ba8:   	xorcc	%i2, 0xb55, %l7
	.word	0xa87b63fc	! t0_kref+0x4bac:   	sdiv	%o5, 0x3fc, %l4
	.word	0xe16e401b	! t0_kref+0x4bb0:   	prefetch	%i1 + %i3, 16
	.word	0xa1a01913	! t0_kref+0x4bb4:   	fitod	%f19, %f16
	.word	0xa9400000	! t0_kref+0x4bb8:   	mov	%y, %l4
	.word	0x9403232b	! t0_kref+0x4bbc:   	add	%o4, 0x32b, %o2
	.word	0xa92b400c	! t0_kref+0x4bc0:   	sll	%o5, %o4, %l4
2:	.word	0xa9a44833	! t0_kref+0x4bc4:   	fadds	%f17, %f19, %f20
	.word	0xd0780019	! t0_kref+0x4bc8:   	swap	[%g0 + %i1], %o0
	.word	0xa7b284ca	! t0_kref+0x4bcc:   	fcmpne32	%f10, %f10, %l3
	.word	0xd81e001d	! t0_kref+0x4bd0:   	ldd	[%i0 + %i5], %o4
	.word	0x29480001	! t0_kref+0x4bd4:   	fbl,a,pt	%fcc0, _kref+0x4bd8
	.word	0xaba2482b	! t0_kref+0x4bd8:   	fadds	%f9, %f11, %f21
	.word	0x94232ca6	! t0_kref+0x4bdc:   	sub	%o4, 0xca6, %o2
	.word	0xd27e4000	! t0_kref+0x4be0:   	swap	[%i1], %o1
	.word	0x290f8877	! t0_kref+0x4be4:   	sethi	%hi(0x3e21dc00), %l4
	.word	0xa9083c85	! t0_kref+0x4be8:   	tsubcc	%g0, -0x37b, %l4
	.word	0xa7b30448	! t0_kref+0x4bec:   	fcmpne16	%f12, %f8, %l3
	.word	0x92b30000	! t0_kref+0x4bf0:   	orncc	%o4, %g0, %o1
	.word	0xa61b7e44	! t0_kref+0x4bf4:   	xor	%o5, -0x1bc, %l3
	.word	0x3e800004	! t0_kref+0x4bf8:   	bvc,a	_kref+0x4c08
	.word	0x9db3090a	! t0_kref+0x4bfc:   	faligndata	%f12, %f10, %f14
	.word	0xaf08322c	! t0_kref+0x4c00:   	tsubcc	%g0, -0xdd4, %l7
	.word	0x95a01894	! t0_kref+0x4c04:   	fitos	%f20, %f10
	.word	0x94e3388d	! t0_kref+0x4c08:   	subccc	%o4, -0x773, %o2
	.word	0x93a00134	! t0_kref+0x4c0c:   	fabss	%f20, %f9
	sethi	%hi(2f), %o7
	.word	0xe40be03c	! t0_kref+0x4c14:   	ldub	[%o7 + 0x3c], %l2
	.word	0xa41ca00c	! t0_kref+0x4c18:   	xor	%l2, 0xc, %l2
	.word	0xe42be03c	! t0_kref+0x4c1c:   	stb	%l2, [%o7 + 0x3c]
	.word	0x81dbe03c	! t0_kref+0x4c20:   	flush	%o7 + 0x3c
	.word	0x32800004	! t0_kref+0x4c24:   	bne,a	_kref+0x4c34
	.word	0xaaab3301	! t0_kref+0x4c28:   	andncc	%o4, -0xcff, %l5
	.word	0x2d25e758	! t0_kref+0x4c2c:   	sethi	%hi(0x979d6000), %l6
	.word	0xe9bf5a59	! t0_kref+0x4c30:   	stda	%f20, [%i5 + %i1]0xd2
	.word	0xad400000	! t0_kref+0x4c34:   	mov	%y, %l6
	.word	0xa5a0192c	! t0_kref+0x4c38:   	fstod	%f12, %f18
2:	.word	0xd43e2018	! t0_kref+0x4c3c:   	std	%o2, [%i0 + 0x18]
	.word	0xc020a018	! t0_kref+0x4c40:   	clr	[%g2 + 0x18]
	.word	0xa3a489b2	! t0_kref+0x4c44:   	fdivs	%f18, %f18, %f17
	.word	0x9de3bfa0	! t0_kref+0x4c48:   	save	%sp, -0x60, %sp
	.word	0xabef4000	! t0_kref+0x4c4c:   	restore	%i5, %g0, %l5
	.word	0xdb263fe8	! t0_kref+0x4c50:   	st	%f13, [%i0 - 0x18]
	.word	0xa9a01090	! t0_kref+0x4c54:   	fxtos	%f16, %f20
	.word	0x272d8f9c	! t0_kref+0x4c58:   	sethi	%hi(0xb63e7000), %l3
	.word	0xafb38594	! t0_kref+0x4c5c:   	fcmpgt32	%f14, %f20, %l7
	.word	0xb8103ff4	! t0_kref+0x4c60:   	mov	0xfffffff4, %i4
	.word	0xacbb7afa	! t0_kref+0x4c64:   	xnorcc	%o5, -0x506, %l6
	.word	0xac032435	! t0_kref+0x4c68:   	add	%o4, 0x435, %l6
	.word	0xc02e6002	! t0_kref+0x4c6c:   	clrb	[%i1 + 2]
	.word	0x97a00534	! t0_kref+0x4c70:   	fsqrts	%f20, %f11
	.word	0xdb00a028	! t0_kref+0x4c74:   	ld	[%g2 + 0x28], %f13
	.word	0x91a0004a	! t0_kref+0x4c78:   	fmovd	%f10, %f8
	.word	0x90b80000	! t0_kref+0x4c7c:   	xnorcc	%g0, %g0, %o0
	.word	0x81800000	! t0_kref+0x4c80:   	mov	%g0, %y
	.word	0x9da01a28	! t0_kref+0x4c84:   	fstoi	%f8, %f14
	.word	0x93a01a31	! t0_kref+0x4c88:   	fstoi	%f17, %f9
	.word	0x90a00000	! t0_kref+0x4c8c:   	subcc	%g0, %g0, %o0
	.word	0xaeb6a7d4	! t0_kref+0x4c90:   	orncc	%i2, 0x7d4, %l7
	.word	0x95b6830c	! t0_kref+0x4c94:   	alignaddr	%i2, %o4, %o2
	.word	0x9036800d	! t0_kref+0x4c98:   	orn	%i2, %o5, %o0
	.word	0x91a40850	! t0_kref+0x4c9c:   	faddd	%f16, %f16, %f8
	.word	0xa9a00530	! t0_kref+0x4ca0:   	fsqrts	%f16, %f20
	.word	0x9da00052	! t0_kref+0x4ca4:   	fmovd	%f18, %f14
	.word	0x95400000	! t0_kref+0x4ca8:   	mov	%y, %o2
	.word	0x97a00029	! t0_kref+0x4cac:   	fmovs	%f9, %f11
	.word	0x9db38dc8	! t0_kref+0x4cb0:   	fnand	%f14, %f8, %f14
	.word	0x35480001	! t0_kref+0x4cb4:   	fbue,a,pt	%fcc0, _kref+0x4cb8
	.word	0xec567ff8	! t0_kref+0x4cb8:   	ldsh	[%i1 - 8], %l6
	.word	0xe4086a5c	! t0_kref+0x4cbc:   	ldub	[%g1 + 0xa5c], %l2
	.word	0xa41ca00c	! t0_kref+0x4cc0:   	xor	%l2, 0xc, %l2
	.word	0xe4286a5c	! t0_kref+0x4cc4:   	stb	%l2, [%g1 + 0xa5c]
	.word	0x81d86a5c	! t0_kref+0x4cc8:   	flush	%g1 + 0xa5c
	.word	0x9fb38a71	! t0_kref+0x4ccc:   	fpadd32s	%f14, %f17, %f15
	.word	0x3b480002	! t0_kref+0x4cd0:   	fble,a,pt	%fcc0, _kref+0x4cd8
	.word	0xacd8351a	! t0_kref+0x4cd4:   	smulcc	%g0, -0xae6, %l6
	.word	0xac7b400d	! t0_kref+0x4cd8:   	sdiv	%o5, %o5, %l6
	.word	0xd0163fea	! t0_kref+0x4cdc:   	lduh	[%i0 - 0x16], %o0
	.word	0xaf3b400c	! t0_kref+0x4ce0:   	sra	%o5, %o4, %l7
	.word	0xa5b20e14	! t0_kref+0x4ce4:   	fand	%f8, %f20, %f18
	.word	0x81aa0a2a	! t0_kref+0x4ce8:   	fcmps	%fcc0, %f8, %f10
	.word	0xd1be584c	! t0_kref+0x4cec:   	stda	%f8, [%i1 + %o4]0xc2
	.word	0xd4380018	! t0_kref+0x4cf0:   	std	%o2, [%g0 + %i0]
	.word	0xc0280019	! t0_kref+0x4cf4:   	clrb	[%g0 + %i1]
2:	.word	0xaaa80000	! t0_kref+0x4cf8:   	andncc	%g0, %g0, %l5
	.word	0x93b34ea0	! t0_kref+0x4cfc:   	fsrc1s	%f13, %f9
	.word	0x97a00033	! t0_kref+0x4d00:   	fmovs	%f19, %f11
	.word	0xf207bfe0	! t0_kref+0x4d04:   	ld	[%fp - 0x20], %i1
	.word	0xa1a208d0	! t0_kref+0x4d08:   	fsubd	%f8, %f16, %f16
	.word	0xa90b401a	! t0_kref+0x4d0c:   	tsubcc	%o5, %i2, %l4
	.word	0xf420a018	! t0_kref+0x4d10:   	st	%i2, [%g2 + 0x18]
	.word	0xacbeb1c2	! t0_kref+0x4d14:   	xnorcc	%i2, -0xe3e, %l6
	.word	0x95a2c9a9	! t0_kref+0x4d18:   	fdivs	%f11, %f9, %f10
	.word	0x81800000	! t0_kref+0x4d1c:   	mov	%g0, %y
	.word	0x93a000af	! t0_kref+0x4d20:   	fnegs	%f15, %f9
	.word	0x9450000c	! t0_kref+0x4d24:   	umul	%g0, %o4, %o2
	.word	0xae46801a	! t0_kref+0x4d28:   	addc	%i2, %i2, %l7
	.word	0x81ddc010	! t0_kref+0x4d2c:   	flush	%l7 + %l0
	.word	0x9db30e80	! t0_kref+0x4d30:   	fsrc1	%f12, %f14
	.word	0xec00a008	! t0_kref+0x4d34:   	ld	[%g2 + 8], %l6
	sethi	%hi(2f), %o7
	.word	0xe40be15c	! t0_kref+0x4d3c:   	ldub	[%o7 + 0x15c], %l2
	.word	0xa41ca00c	! t0_kref+0x4d40:   	xor	%l2, 0xc, %l2
	.word	0xe42be15c	! t0_kref+0x4d44:   	stb	%l2, [%o7 + 0x15c]
	.word	0x81dbe15c	! t0_kref+0x4d48:   	flush	%o7 + 0x15c
	.word	0x9ba0002d	! t0_kref+0x4d4c:   	fmovs	%f13, %f13
	.word	0xd99f5a59	! t0_kref+0x4d50:   	ldda	[%i5 + %i1]0xd2, %f12
	.word	0xd408a023	! t0_kref+0x4d54:   	ldub	[%g2 + 0x23], %o2
	.word	0xa6334000	! t0_kref+0x4d58:   	orn	%o5, %g0, %l3
2:	.word	0xeb00a038	! t0_kref+0x4d5c:   	ld	[%g2 + 0x38], %f21
	.word	0x95b6835a	! t0_kref+0x4d60:   	alignaddrl	%i2, %i2, %o2
	.word	0xacb6800c	! t0_kref+0x4d64:   	orncc	%i2, %o4, %l6
	.word	0xae502640	! t0_kref+0x4d68:   	umul	%g0, 0x640, %l7
	.word	0xe610a038	! t0_kref+0x4d6c:   	lduh	[%g2 + 0x38], %l3
	.word	0x94433aff	! t0_kref+0x4d70:   	addc	%o4, -0x501, %o2
	.word	0xa9a01932	! t0_kref+0x4d74:   	fstod	%f18, %f20
	.word	0xd416201e	! t0_kref+0x4d78:   	lduh	[%i0 + 0x1e], %o2
	.word	0xa9b34fb3	! t0_kref+0x4d7c:   	fors	%f13, %f19, %f20
	.word	0x9073001a	! t0_kref+0x4d80:   	udiv	%o4, %i2, %o0
	.word	0x9ba01a4a	! t0_kref+0x4d84:   	fdtoi	%f10, %f13
	.word	0x953b4000	! t0_kref+0x4d88:   	sra	%o5, %g0, %o2
	.word	0x81ac4a35	! t0_kref+0x4d8c:   	fcmps	%fcc0, %f17, %f21
	.word	0xad400000	! t0_kref+0x4d90:   	mov	%y, %l6
	.word	0xda20a000	! t0_kref+0x4d94:   	st	%o5, [%g2]
	.word	0xa1b00f12	! t0_kref+0x4d98:   	fsrc2	%f18, %f16
	.word	0x91a409ad	! t0_kref+0x4d9c:   	fdivs	%f16, %f13, %f8
	.word	0x90b8000d	! t0_kref+0x4da0:   	xnorcc	%g0, %o5, %o0
	.word	0xe91fbef0	! t0_kref+0x4da4:   	ldd	[%fp - 0x110], %f20
	.word	0x92c6bf03	! t0_kref+0x4da8:   	addccc	%i2, -0xfd, %o1
	.word	0xda20a030	! t0_kref+0x4dac:   	st	%o5, [%g2 + 0x30]
	.word	0x38800004	! t0_kref+0x4db0:   	bgu,a	_kref+0x4dc0
	.word	0xea064000	! t0_kref+0x4db4:   	ld	[%i1], %l5
	.word	0xa8030000	! t0_kref+0x4db8:   	add	%o4, %g0, %l4
	.word	0x94fb4000	! t0_kref+0x4dbc:   	sdivcc	%o5, %g0, %o2
	.word	0x2702113e	! t0_kref+0x4dc0:   	sethi	%hi(0x844f800), %l3
	.word	0xd7e6501a	! t0_kref+0x4dc4:   	casa	[%i1]0x80, %i2, %o3
	.word	0xa1b28c8c	! t0_kref+0x4dc8:   	fandnot2	%f10, %f12, %f16
	.word	0x99b24f73	! t0_kref+0x4dcc:   	fornot1s	%f9, %f19, %f12
	.word	0xa7b3400d	! t0_kref+0x4dd0:   	edge8	%o5, %o5, %l3
	.word	0xd8266014	! t0_kref+0x4dd4:   	st	%o4, [%i1 + 0x14]
	.word	0x81abca2b	! t0_kref+0x4dd8:   	fcmps	%fcc0, %f15, %f11
	.word	0xef68a0c7	! t0_kref+0x4ddc:   	prefetch	%g2 + 0xc7, 23
	.word	0x9063400d	! t0_kref+0x4de0:   	subc	%o5, %o5, %o0
	.word	0xe19e7fe0	! t0_kref+0x4de4:   	ldda	[%i1 - 0x20]%asi, %f16
	.word	0x36800006	! t0_kref+0x4de8:   	bge,a	_kref+0x4e00
	.word	0xa606aa77	! t0_kref+0x4dec:   	add	%i2, 0xa77, %l3
	.word	0x99a00534	! t0_kref+0x4df0:   	fsqrts	%f20, %f12
	.word	0xa89b27d5	! t0_kref+0x4df4:   	xorcc	%o4, 0x7d5, %l4
	.word	0xec50a020	! t0_kref+0x4df8:   	ldsh	[%g2 + 0x20], %l6
	.word	0x91a0002d	! t0_kref+0x4dfc:   	fmovs	%f13, %f8
	.word	0xaec6800d	! t0_kref+0x4e00:   	addccc	%i2, %o5, %l7
	.word	0xd000a010	! t0_kref+0x4e04:   	ld	[%g2 + 0x10], %o0
	.word	0xee064000	! t0_kref+0x4e08:   	ld	[%i1], %l7
	.word	0xaac322ff	! t0_kref+0x4e0c:   	addccc	%o4, 0x2ff, %l5
	.word	0x2c800007	! t0_kref+0x4e10:   	bneg,a	_kref+0x4e2c
	.word	0x920023d5	! t0_kref+0x4e14:   	add	%g0, 0x3d5, %o1
	.word	0x99a0012c	! t0_kref+0x4e18:   	fabss	%f12, %f12
	.word	0xeac65000	! t0_kref+0x4e1c:   	ldswa	[%i1]0x80, %l5
	.word	0x01000000	! t0_kref+0x4e20:   	nop
	.word	0x01000000	! t0_kref+0x4e24:   	nop
	.word	0x01000000	! t0_kref+0x4e28:   	nop
	call	SYM(_kaos_done)
	.word	0x01000000	! t0_kref+0x4e30:   	nop
	KGLOBAL(t0_ktbl_end)
t0_ktbl_end:
t0_ktbl_page_end:

KTEXT_MODULE(t0_module_subr0, 0x3b84c000)
.seg "text"
t0_subr0_page_begin:
	.skip 8188
.global _t0_subr0; ENTRY(t0_subr0)
	.word	0xa6844012	! t0_subr0+0x0:   	addcc	%l1, %l2, %l3
	.word	0x81c3e008	! t0_subr0+0x4:   	retl
	.word	0xaa64c014	! t0_subr0+0x8:   	subc	%l3, %l4, %l5
t0_subr0_page_end:

KTEXT_MODULE(t0_module_subr1, 0x304e2000)
.seg "text"
t0_subr1_page_begin:
	.skip 8180
.global _t0_subr1; ENTRY(t0_subr1)
	.word	0x9de3bfa0	! t0_subr1+0x0:   	save	%sp, -0x60, %sp
	.word	0xb29eaa5a	! t0_subr1+0x4:   	xorcc	%i2, 0xa5a, %i1
	.word	0x81c7e008	! t0_subr1+0x8:   	ret
	.word	0xa7ee6001	! t0_subr1+0xc:   	restore	%i1, 1, %l3
t0_subr1_page_end:

KTEXT_MODULE(t0_module_subr2, 0x3049e000)
.seg "text"
t0_subr2_page_begin:
	.skip 8180
.global _t0_subr2; ENTRY(t0_subr2)
	.word	0x9de3bfa0	! t0_subr2+0x0:   	save	%sp, -0x60, %sp
	.word	0xb2066001	! t0_subr2+0x4:   	add	%i1, 1, %i1
	.word	0x81c7e008	! t0_subr2+0x8:   	ret
	.word	0xa3ee6001	! t0_subr2+0xc:   	restore	%i1, 1, %l1
t0_subr2_page_end:

KTEXT_MODULE(t0_module_subr3, 0x20c42000)
.seg "text"
t0_subr3_page_begin:
	.skip 8164
.global _t0_subr3; ENTRY(t0_subr3)
	.word	0x90056001	! t0_subr3+0x0:   	add	%l5, 1, %o0
	.word	0x9de3bfa0	! t0_subr3+0x4:   	save	%sp, -0x60, %sp
#if defined(KAOS_SIMULATION)
	add	%i0, 12, %i0
#else
	.word	0x90062001	! t0_subr3+0x8:   	add	%i0, 1, %o0
	.word	0x9de3bfa0	! t0_subr3+0xc:   	save	%sp, -0x60, %sp
	.word	0x90062001	! t0_subr3+0x10:   	add	%i0, 1, %o0
	.word	0x9de3bfa0	! t0_subr3+0x14:   	save	%sp, -0x60, %sp
	.word	0x90062001	! t0_subr3+0x18:   	add	%i0, 1, %o0
	.word	0x9de3bfa0	! t0_subr3+0x1c:   	save	%sp, -0x60, %sp
	.word	0x90062001	! t0_subr3+0x20:   	add	%i0, 1, %o0
	.word	0x9de3bfa0	! t0_subr3+0x24:   	save	%sp, -0x60, %sp
	.word	0x90062001	! t0_subr3+0x28:   	add	%i0, 1, %o0
	.word	0x9de3bfa0	! t0_subr3+0x2c:   	save	%sp, -0x60, %sp
	.word	0x90062001	! t0_subr3+0x30:   	add	%i0, 1, %o0
	.word	0x9de3bfa0	! t0_subr3+0x34:   	save	%sp, -0x60, %sp
	.word	0xb1ee2001	! t0_subr3+0x38:   	restore	%i0, 1, %i0
	.word	0xb1ee2001	! t0_subr3+0x3c:   	restore	%i0, 1, %i0
	.word	0xb1ee2001	! t0_subr3+0x40:   	restore	%i0, 1, %i0
	.word	0xb1ee2001	! t0_subr3+0x44:   	restore	%i0, 1, %i0
	.word	0xb1ee2001	! t0_subr3+0x48:   	restore	%i0, 1, %i0
	.word	0xb1ee2001	! t0_subr3+0x4c:   	restore	%i0, 1, %i0
#endif
	.word	0x81c7e008	! t0_subr3+0x50:   	ret
	.word	0xadee2001	! t0_subr3+0x54:   	restore	%i0, 1, %l6
t0_subr3_page_end:
!
!  Total operations: 4818  
!
!  Operation frequencies
!
!  name               exp    obs
!  ldsb              0.04   0.04
!  ldub              0.47   0.35
!  ldsh              0.42   0.31
!  lduh              0.62   0.77
!  ld                1.22   1.35
!  ldd               0.61   0.68
!  swap              1.19   1.20
!  ldstub            0.92   0.83
!  stb               0.48   0.50
!  sth               1.11   0.95
!  st                0.37   0.31
!  std               0.37   0.46
!  add               1.19   1.16
!  addcc             0.45   0.44
!  addx              0.68   0.60
!  addxcc            1.08   1.12
!  taddcc            0.10   0.06
!  taddcctv          0.17   0.29
!  sub               0.60   0.42
!  subcc             0.68   0.83
!  subx              1.15   1.00
!  subxcc            0.54   0.64
!  tsubcc            0.25   0.37
!  tsubcctv          0.22   0.37
!  mulscc            0.45   0.25
!  and               0.06   0.04
!  andcc             0.33   0.44
!  andn              0.35   0.23
!  andncc            0.86   0.81
!  or                0.19   0.10
!  orcc              0.89   1.00
!  orn               0.77   0.58
!  orncc             1.05   1.56
!  xor               1.20   1.45
!  xorcc             1.00   1.29
!  xnor              1.11   1.14
!  xnorcc            1.04   1.25
!  sll               0.57   0.52
!  srl               0.96   1.02
!  sra               1.07   1.37
!  unimp             0.01   0.02
!  umul              0.61   0.71
!  smul              0.69   0.98
!  udiv              0.69   0.66
!  sdiv              0.40   0.44
!  umulcc            0.13   0.17
!  smulcc            1.23   1.20
!  udivcc            0.20   0.15
!  sdivcc            1.13   1.02
!  rdy               1.06   1.29
!  wry               0.73   0.60
!  bicc              0.82   0.91
!  sethi             1.22   1.25
!  jmpl              0.79   0.75
!  call              0.71   0.56
!  ticc              0.00   0.00
!  flush             1.22   1.29
!  save              0.63   0.46
!  restore           0.70   0.00
!  stbar             0.13   0.06
!  ldf               0.96   1.00
!  lddf              0.70   0.71
!  stf               0.47   0.44
!  stdf              0.24   0.27
!  fadds             1.25   1.04
!  fsubs             1.26   1.33
!  fmuls             0.04   0.04
!  fdivs             1.34   1.52
!  faddd             0.60   0.71
!  fsubd             1.26   1.14
!  fmuld             1.18   1.16
!  fdivd             0.29   0.29
!  faddq             0.00   0.00
!  fsubq             0.00   0.00
!  fmulq             0.00   0.00
!  fdivq             0.00   0.00
!  fsmuld            0.24   0.27
!  fdmulq            0.00   0.00
!  fitos             0.38   0.46
!  fitod             0.88   1.06
!  fitoq             0.00   0.00
!  fstoi             0.91   0.93
!  fstod             0.54   0.54
!  fstoq             0.00   0.00
!  fdtoi             0.69   0.77
!  fdtos             0.30   0.33
!  fdtoq             0.00   0.00
!  fqtoi             0.00   0.00
!  fqtos             0.00   0.00
!  fqtod             0.00   0.00
!  fmovs             1.37   1.35
!  fnegs             0.64   0.64
!  fabss             1.16   1.33
!  fsqrts            2.41   2.14
!  fsqrtd            0.08   0.02
!  fsqrtq            0.00   0.00
!  fcmps             0.81   0.91
!  fcmpd             0.37   0.39
!  fcmpq             0.00   0.00
!  fcmpes            0.89   0.87
!  fcmped            0.43   0.35
!  fcmpeq            0.00   0.00
!  fbfcc             0.78   0.54
!  ldfsr             0.11   0.00
!  stfsr             0.26   0.27
!  loop              0.21   0.15
!  offset            0.17   0.21
!  area              0.25   0.25
!  target            0.05   0.00
!  goto              0.19   0.19
!  sigsegv           0.21   0.27
!  sigbus            0.07   0.04
!  imodify           0.93   0.75
!  ldfsr_offset      0.05   0.00
!  fpattern          0.54   0.62
!  lbranch           0.20   0.25
!  shmld             4.41   4.77
!  shmst             2.75   2.80
!  shmpf             1.31   1.08
!  shmswap           0.02   0.04
!  shmblkld          0.30   0.02
!  shmblkst          1.12   0.25
!  shmblkchk         0.47   0.37
!  hack_restore      0.00   0.00
!  demap_random_va   0.00   0.00
!  demap_area        0.00   0.00
!  demap_ktbl_text   0.00   0.00
!  demap_ktbl_data   0.00   0.00
!  demap_subr        0.00   0.00
!  demap_reg         0.00   0.00
!  demap_stack       0.00   0.00
!  ro_area           0.00   0.00
!  ro_ktbl_data      0.00   0.00
!  ro_reg            0.00   0.00
!  ro_stack          0.00   0.00
!  set_window        0.00   0.00
!  set_va_wp         0.00   0.00
!  set_pa_wp         0.00   0.00
!  set_softint       0.00   0.00
!  ie_toggle         0.00   0.00
!  set_pil           0.00   0.00
!  set_tso           0.00   0.00
!  set_pso           0.00   0.00
!  set_rmo           0.00   0.00
!  cflush            0.00   0.00
!  return            0.00   0.00
!  casa              0.14   0.15
!  rdasi             0.10   0.10
!  wrasi             0.25   0.21
!  bpcc              0.78   0.79
!  fbpfcc            2.90   2.72
!  fmovscc           0.08   0.12
!  fmovdcc           0.23   0.25
!  fmovqcc           0.00   0.00
!  movcc             0.10   0.10
!  flushw            0.25   0.10
!  membar            0.01   0.00
!  prefetch          0.93   1.25
!  rdpc              0.27   0.27
!  ldqf              0.00   0.00
!  stqf              0.00   0.00
!  ldfa              0.01   0.00
!  lddfa             0.17   0.17
!  ldqfa             0.00   0.00
!  ldsba             0.23   0.21
!  ldsha             0.28   0.29
!  lduba             0.04   0.08
!  lduha             0.10   0.12
!  lda               0.27   0.35
!  ldda              0.05   0.06
!  ldstuba           0.22   0.23
!  prefetcha         0.04   0.08
!  stfa              0.12   0.21
!  stdfa             0.07   0.15
!  stqfa             0.00   0.00
!  stba              0.20   0.23
!  stha              0.10   0.12
!  sta               0.10   0.02
!  stda              0.20   0.08
!  swapa             0.10   0.08
!  fmovd             0.27   0.23
!  fnegd             0.05   0.04
!  fabsd             0.12   0.06
!  fstox             0.03   0.00
!  fdtox             0.13   0.12
!  fxtos             0.24   0.29
!  fxtod             0.14   0.21
!  lds               0.08   0.10
!  ldsa              0.11   0.10
!  ldx               0.14   0.12
!  ldxa              0.23   0.27
!  nofault           0.25   0.31
!  rdgsr             0.24   0.31
!  wrgsr             0.14   0.19
!  fpadd16           0.06   0.08
!  fpadd16s          0.00   0.00
!  fpadd32           0.06   0.08
!  fpadd32s          0.24   0.19
!  fpsub16           0.02   0.04
!  fpsub16s          0.07   0.02
!  fpsub32           0.16   0.17
!  fpsub32s          0.21   0.17
!  fpack16           0.21   0.25
!  fpack32           0.02   0.00
!  fpackfix          0.22   0.27
!  fexpand           0.07   0.04
!  fpmerge           0.19   0.19
!  fmul8x16          0.20   0.21
!  fmul8x16au        0.06   0.02
!  fmul8x16al        0.08   0.19
!  fmul8sux16        0.21   0.15
!  fmul8ulx16        0.10   0.06
!  fmuld8sux16       0.25   0.27
!  fmuld8ulx16       0.06   0.10
!  alignaddr         0.21   0.19
!  alignaddrl        0.22   0.25
!  faligndata        0.13   0.10
!  fzero             0.08   0.04
!  fzeros            0.01   0.02
!  fone              0.21   0.19
!  fones             0.14   0.12
!  fsrc1             0.23   0.25
!  fsrc1s            0.16   0.31
!  fsrc2             0.12   0.08
!  fsrc2s            0.04   0.02
!  fnot1             0.23   0.27
!  fnot1s            0.25   0.35
!  fnot2             0.07   0.02
!  fnot2s            0.04   0.04
!  for               0.09   0.10
!  fors              0.24   0.23
!  fnor              0.13   0.17
!  fnors             0.04   0.06
!  fand              0.17   0.17
!  fands             0.03   0.02
!  fnand             0.22   0.23
!  fnands            0.24   0.25
!  fxor              0.04   0.02
!  fxors             0.01   0.02
!  fxnor             0.24   0.29
!  fxnors            0.00   0.00
!  fornot1           0.10   0.06
!  fornot1s          0.14   0.19
!  fornot2           0.14   0.12
!  fornot2s          0.08   0.15
!  fandnot1          0.02   0.04
!  fandnot1s         0.05   0.08
!  fandnot2          0.25   0.37
!  fandnot2s         0.16   0.29
!  fcmpgt16          0.03   0.08
!  fcmpgt32          0.19   0.23
!  fcmple16          0.07   0.04
!  fcmple32          0.20   0.21
!  fcmpne16          0.20   0.19
!  fcmpne32          0.16   0.12
!  fcmpeq16          0.20   0.17
!  fcmpeq32          0.07   0.10
!  edge8             0.17   0.21
!  edge8l            0.25   0.33
!  edge16            0.24   0.23
!  edge16l           0.00   0.00
!  edge32            0.13   0.04
!  edge32l           0.23   0.21
!  pdist             0.06   0.02
!  partial_st8       0.00   0.00
!  partial_st16      0.13   0.21
!  partial_st32      0.27   0.35
!  short_st8         0.09   0.10
!  short_st16        0.24   0.33
!  short_ld8         0.02   0.00
!  short_ld16        0.23   0.19
!  blkld             0.01   0.00
!  blkst             0.11   0.00
!  blkld_offset      0.16   0.00
!  blkst_offset      0.03   0.00
!  blk_check         0.26   0.21
!  casxa             0.17   0.10
!  rdccr             0.07   0.12
!  rdfprs            0.25   0.25
!  wrccr             0.09   0.06
!  popc              0.04   0.06
!  wrfprs            0.16   0.17
!  stx               0.19   0.15
!  stxa              0.11   0.02
!  cflush            0.00   0.00
!  array8            0.18   0.15
!  array16           0.14   0.06
!  array32           0.18   0.25
!  edge8n            0.26   0.31
!  edge8ln           0.01   0.00
!  edge16n           0.01   0.00
!  edge16ln          0.25   0.12
!  edge32n           0.07   0.10
!  edge32ln          0.21   0.21
!  bmask             0.02   0.00
!  bshuffle          0.15   0.15
!  siam              0.14   0.15
!  fpadds16          0.00   0.00
!  fpadds16s         0.00   0.00
!  fpadds32          0.00   0.00
!  fpadds32s         0.00   0.00
!  fpsubs16          0.00   0.00
!  fpsubs16s         0.00   0.00
!  fpsubs32          0.00   0.00
!  fpsubs32s         0.00   0.00
!  fpadd64           0.00   0.00
!  fpsub64           0.00   0.00
!  fpmean16          0.00   0.00
!  fpchksm16         0.00   0.00
!  fshl16            0.00   0.00
!  fshrl16           0.00   0.00
!  fshl32            0.00   0.00
!  fshrl32           0.00   0.00
!  fshlas16          0.00   0.00
!  fshra16           0.00   0.00
!  fshlas32          0.00   0.00
!  fshra32           0.00   0.00
!  fpmovc8           0.00   0.00
!  fpmovc16          0.00   0.00
!  fpmovc32          0.00   0.00
!  fmergesp          0.00   0.00
!  fucmpgt8          0.00   0.00
!  fucmple8          0.00   0.00
!  fucmpne8          0.00   0.00
!  fucmpeq8          0.00   0.00
!  pdistn            0.00   0.00
!  lzd               0.00   0.00
!  addxc             0.00   0.00
!  addxccc           0.00   0.00
!  umulxhi           0.00   0.00
!  flcmps            0.00   0.00
!  flcmpd            0.00   0.00
!  sfabss            0.00   0.00
!  sfnegs            0.00   0.00
!  sfadds            0.00   0.00
!  sfsubs            0.00   0.00
!  sfmuls            0.00   0.00
!  sfitos            0.00   0.00
!  sfstoi            0.00   0.00
!  sfcmpeqs          0.00   0.00
!  sfcmpnes          0.00   0.00
!  sfcmpgts          0.00   0.00
!  sfcmples          0.00   0.00
!  fmadds            0.00   0.00
!  fmaddd            0.00   0.00
!  fmsubs            0.00   0.00
!  fmsubd            0.00   0.00
!  fnmsubs           0.00   0.00
!  fnmsubd           0.00   0.00
!  fnmadds           0.00   0.00
!  fnmaddd           0.00   0.00
!
KDATA_MODULE(t0_module_offset_table, 0x190cc000)
.seg "data"
t0_offset_table_start:
t0_offset_table_size:	.word	0x00000008
t0_offset_table:
	.word	0xfffffff8
	.word	0x00000000
	.word	0x00000010
	.word	0xffffffe0
	.word	0x00000008
	.word	0xfffffff0
	.word	0x00000018
	.word	0xffffffe8
t0_offset_table_end:

t0_ldfsr_offset_table_start:
t0_ldfsr_offset_table_size:	.word	0x00000000
t0_ldfsr_offset_table:
t0_ldfsr_offset_table_end:

t0_bld_offset_table_start:
t0_bld_offset_table_size:	.word	0x00000000
t0_bld_offset_table:
t0_bld_offset_table_end:

t0_bst_offset_table_start:
t0_bst_offset_table_size:	.word	0x00000000
t0_bst_offset_table:
t0_bst_offset_table_end:

.skip 8144	! page align

KDATA_MODULE(t0_module_data_in_regs, 0x0909a000)
.seg "data"
KGLOBAL(t0_data_in_regs)
t0_data_in_regs_start:
t0_data_in_regs:
	.word	0xd34b438c          ! %f0
	.word	0x801dd53e          ! %f1
	.word	0xc5f82bac          ! %f2
	.word	0x11b02554          ! %f3
	.word	0x14714d5f          ! %f4
	.word	0x77843244          ! %f5
	.word	0xfd29d0c0          ! %f6
	.word	0x78d5306e          ! %f7
	.word	0x75dff220          ! %f8
	.word	0xdfff485e          ! %f9
	.word	0x23f6ccfa          ! %f10
	.word	0x940608a6          ! %f11
	.word	0x14840e7b          ! %f12
	.word	0x9e87838b          ! %f13
	.word	0x5b13c97f          ! %f14
	.word	0x6e5862b9          ! %f15
	.word	0xf84deeeb          ! %f16
	.word	0x8968eb5f          ! %f17
	.word	0x597478c7          ! %f18
	.word	0xb858b757          ! %f19
	.word	0x479df38f          ! %f20
	.word	0xc8255c4e          ! %f21
	.word	0x41c11090          ! %f22
	.word	0x3b906806          ! %f23
	.word	0xb6b71d44          ! %f24
	.word	0x986a912a          ! %f25
	.word	0xc954ef15          ! %f26
	.word	0xa14ece47          ! %f27
	.word	0xfc24d7ef          ! %f28
	.word	0xaea0c0e9          ! %f29
	.word	0xdf65df7f          ! %f30
	.word	0x98d198f6          ! %f31
	.word	0x2402961a          ! %f32
	.word	0xc59ed4ac          ! %f33
	.word	0x08f6b19b          ! %f34
	.word	0xe3cb1bf6          ! %f35
	.word	0x33e911c2          ! %f36
	.word	0x2e5d79fc          ! %f37
	.word	0x412f18ce          ! %f38
	.word	0xef0b760d          ! %f39
	.word	0xc92e466e          ! %f40
	.word	0x8e529556          ! %f41
	.word	0x38de0645          ! %f42
	.word	0x39fbb10b          ! %f43
	.word	0xa0627883          ! %f44
	.word	0x7db2d8e9          ! %f45
	.word	0x9a8af270          ! %f46
	.word	0x28e84032          ! %f47
	.word	0x48c5ddd6          ! %f48
	.word	0x666f839d          ! %f49
	.word	0x85cdc9b0          ! %f50
	.word	0xd60a80d1          ! %f51
	.word	0x7e17bb83          ! %f52
	.word	0x2da28c57          ! %f53
	.word	0xbbec704e          ! %f54
	.word	0xd2172131          ! %f55
	.word	0xa7d90cfc          ! %f56
	.word	0xa37bbd7b          ! %f57
	.word	0x243811af          ! %f58
	.word	0x711191b5          ! %f59
	.word	0x0c2a0864          ! %f60
	.word	0x05e584b2          ! %f61
	.word	0xff93aec5          ! %f62
	.word	0x8982e43c          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x36c       ! %g1 (code pointer)
	.word	t0_data_in_shm_area ! %g2 (shared area pointer)
	.word	0x185395f8          ! %g3 (loop index)
	.word	SYM(t0_subr1)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x2f95a18b          ! %o0
	.word	0x78e9ca72          ! %o1
	.word	0x6f4b23b8          ! %o2
	.word	0x5c030344          ! %o3
	.word	0xb44304ff          ! %o4
	.word	0x615519ad          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x2f0b141d          ! %l0
	.word	0xa8407aec          ! %l1
	.word	0xab309fc9          ! %l2
	.word	0x6534bdc9          ! %l3
	.word	0x423f019f          ! %l4
	.word	0xeb00e8a8          ! %l5
	.word	0x7a24fd26          ! %l6
	.word	0xe1773e66          ! %l7
	.word	t0_data_in_area0    ! %i0 (area pointer)
	.word	t0_data_in_area0    ! %i1 (area pointer)
	.word	0x0000000a          ! %i2 (byte offset)
	.word	0xffffffe0          ! %i3 (halfword offset)
	.word	0x00000008          ! %i4 (word offset)
	.word	0xffffffe0          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x6c18c835          ! %y
	.word	0x00000007          ! %icc (nzvc)
	.word	0xc0000205          ! %fsr
	.word	0x00000000          ! %gsr.mask
	.word	0x00000000          ! %gsr
	.word	0x000000f0          ! %asi
	.word	0x00000000          ! Integer overflow traps
	.word	0x00000000          ! Integer divide by zero traps
	.word	0x00000000          ! Integer divide > 52 bit dividend traps
	.word	0x00000000          ! Floating inexact traps
	.word	0x00000000          ! Floating divide by zero traps
	.word	0x00000000          ! Floating underflow traps
	.word	0x00000000          ! Floating overflow traps
	.word	0x00000000          ! Floating invalid traps
	.word	0x00000000          ! Floating other traps
	.word	0x00000000          ! Ticc traps
	.word	0x00000000          ! Unexpected SIGFPE traps
	.word	0x00000000          ! Unexpected SIGSEGV traps
	.word	0x00000000          ! Unexpected SIGBUS traps
	.word	0x00000000          ! Unexpected SIGILL traps
	.word	0x00000000          ! Expected SIGSEGV traps
	.word	0x00000000          ! Expected SIGBUS traps
	.word	0x00000000          ! UNIMP traps
	.word	0x00000000          ! ??
.global t0_data_in_mtbl_size; t0_data_in_mtbl_size:	.word	253
t0_data_in_regs_end:

.skip 7708	! page align

KDATA_MODULE(t0_module_data_in_stack, 0x2f9e8000)
.seg "data"
KGLOBAL(t0_data_in_mtbl_size)
KGLOBAL(t0_data_in_mtbl)
KGLOBAL(t0_data_in_stack)
t0_data_in_stack_start:
	.word	0x234b49b4
	.word	0xfcd95143
	.word	0x211ab27e
	.word	0xa1647ec8
	.word	0x15d8795b
	.word	0x5b24d2d6
	.word	0xad4a785f
	.word	0x621fd990
	.word	0x85f20b72
	.word	0x3567ca02
	.word	0xed2ead60
	.word	0x98cbaf7c
	.word	0x82fee57a
	.word	0xecb1c059
	.word	0x08b61458
	.word	0xa564c21f
	.word	0x6db8e578
	.word	0xbc776120
	.word	0x694454d2
	.word	0x950b7206
	.word	0x7432a2a0
	.word	0x72173ded
	.word	0xa5150cdc
	.word	0xa4a6cdf9
	.word	0xbbac054f
	.word	0xe9d3b98b
	.word	0x80ddac1f
	.word	0xac12d280
	.word	0x9603ea3e
	.word	0x74c63d20
	.word	0x0f496c2f
	.word	0xac749da8
	.word	0x72c444f4
	.word	0xbcee1b92
	.word	0x83cbfa24
	.word	0x84b79b06
	.word	0x39a9757c
	.word	0x01bfc725
	.word	0x50fca569
	.word	0xcde2ebfc
	.word	0xed5cc558
	.word	0xb6bf3d68
	.word	0x9b7527d3
	.word	0xb626903b
	.word	0x94253fb5
	.word	0xe0facd51
	.word	0x364c5af5
	.word	0xc1741288
	.word	0xa0d158df
	.word	0xa5e99ba7
	.word	0x26f66eb2
	.word	0x096ebdc1
	.word	0x534f18f6
	.word	0x988389a0
	.word	0xc8d97513
	.word	0x98bb9e22
	.word	0x9d8fbde2
	.word	0x969e61ca
	.word	0xde7e5759
	.word	0xff79d2c4
	.word	0x11af0883
	.word	0xc2f66f2d
	.word	0x4c338856
	.word	0x342ff367
	.word	0xb925a92d
	.word	0x0606e2b1
	.word	0x8f7807f8
	.word	0x36038e70
	.word	0xa5517f53
	.word	0xd338aabd
	.word	0xccda8c26
	.word	0xeedc0334
	.word	0xb715a081
	.word	0xef34a121
	.word	0x1c61e2ce
	.word	0x46623c76
	.word	0xe0ff5a8f
	.word	0xf9903335
	.word	0x8050e13e
	.word	0xb5e30f2e
	.word	0xd47ca513
	.word	0x45d9e842
	.word	0x2c6974b3
	.word	0x8132418c
	.word	0x2283b617
	.word	0x807d6a1f
	.word	0xc9f7a82f
	.word	0xce087e3b
	.word	0xd1d2ae0b
	.word	0xf94cf41f
	.word	0xa026b38f
	.word	0x7a36b7ea
	.word	0xf3e98efd
	.word	0xa1f84c2a
	.word	0xb5af67dc
	.word	0xddadc107
	.word	0xf54ff306
	.word	0xa897aa29
	.word	0x72108ce0
	.word	0xb0011bcd
	.word	0x18db3607
	.word	0x87f331a7
	.word	0x1e7703fc
	.word	0x6df84680
	.word	0x87c10695
	.word	0xc695e1b4
	.word	0x2284c439
	.word	0xbb3207f7
	.word	0x9c8d9231
	.word	0xe5451f0d
	.word	0x8483039c
	.word	0xfa11805b
	.word	0xfcd3c0bc
	.word	0x0b643c79
	.word	0x307d21bd
	.word	0x5965022d
	.word	0xd7e13329
	.word	0x565da575
	.word	0xcb87279a
	.word	0xcfb2f78d
	.word	0x4f26f974
	.word	0xb6a18f13
	.word	0x694bf0a8
	.word	0x581957b8
	.word	0xf2a333d2
	.word	0x8364531e
	.word	0xb72c512b
	.word	0x787070d2
	.word	0x17a71329
	.word	0x5444d982
	.word	0x0af9cdc6
	.word	0xdc2a09e5
	.word	0x1617ecc1
	.word	0xcfa5b3ea
	.word	0x00ecb855
	.word	0x1f722129
	.word	0x8f01553c
	.word	0x6c09cfab
	.word	0xce1ec5fa
	.word	0xc2a6ca85
	.word	0x623976c3
	.word	0x3c6fe1e0
	.word	0x4fd07276
	.word	0x6b90f255
	.word	0xf7381682
	.word	0xc1b5f1d5
	.word	0xed50c4b9
	.word	0xe020086d
	.word	0xba53fd55
	.word	0x07c0a5a8
	.word	0x2fc448bb
	.word	0x9206d75e
	.word	0xe2a1b7c3
	.word	0x92b8352d
	.word	0x2981528c
	.word	0xb3b80bf7
	.word	0xa8e9e12a
	.word	0x79672712
	.word	0x6384deaa
	.word	0xfa25310e
	.word	0x6cdc6e3c
	.word	0x8be53c43
	.word	0x9be4a392
	.word	0xbb8b2380
	.word	0xee09aaa9
	.word	0x437b2d8f
	.word	0x91582899
	.word	0xa6c34275
t0_data_in_sp:
	.word	0xc180de1d
	.word	0x08521f8b
	.word	0xdf3bf5fb
	.word	0xf840dfe8
	.word	0xc67fcc6d
	.word	0xd54bf0b6
	.word	0x580f3234
	.word	0xbe56b566
	.word	t0_data_in_area0
	.word	t0_data_in_area0
	.word	0x0000000f
	.word	0xfffffff0
	.word	0x0000001c
	.word	0xfffffff0
	.word	t0_data_in_fp
	.word	0x022878c1
	.word	0x4f0a34fb
	.word	0xf6e82ef7
	.word	0x0044f4a1
	.word	0x37c8ccf6
	.word	0x09123124
	.word	0xa001b270
	.word	0xa613b52f
	.word	0x67a38f0d
t0_data_in_mtbl_base:
	.word   	0x380fffff	! [%fp - 0x400]
	.word   	0xc0000000	! [%fp - 0x3fc]
	.word   	0x380fffff	! [%fp - 0x3f8]
	.word   	0xe0000000	! [%fp - 0x3f4]
	.word   	0x380fffff	! [%fp - 0x3f0]
	.word   	0x80000000	! [%fp - 0x3ec]
	.word   	0x38000000	! [%fp - 0x3e8]
	.word   	0x40000000	! [%fp - 0x3e4]
	.word   	0x38000000	! [%fp - 0x3e0]
	.word   	0x80000000	! [%fp - 0x3dc]
	.word   	0x38000000	! [%fp - 0x3d8]
	.word   	0x20000000	! [%fp - 0x3d4]
	.word   	0x47f00000	! [%fp - 0x3d0]
	.word   	0x00000000	! [%fp - 0x3cc]
	.word   	0x47f00000	! [%fp - 0x3c8]
	.word   	0x20000000	! [%fp - 0x3c4]
	.word   	0x47efffff	! [%fp - 0x3c0]
	.word   	0xffffffff	! [%fp - 0x3bc]
	.word   	0x7ff00000	! [%fp - 0x3b8]
	.word   	0x00000000	! [%fp - 0x3b4]
	.word   	0x7fefffff	! [%fp - 0x3b0]
	.word   	0xffffffff	! [%fp - 0x3ac]
	.word   	0x000fffff	! [%fp - 0x3a8]
	.word   	0xffffffff	! [%fp - 0x3a4]
	.word   	0x000fffff	! [%fp - 0x3a0]
	.word   	0xfffffffe	! [%fp - 0x39c]
	.word   	0x00100000	! [%fp - 0x398]
	.word   	0x00000000	! [%fp - 0x394]
	.word   	0x00000000	! [%fp - 0x390]
	.word   	0x00000001	! [%fp - 0x38c]
	.word   	0x00000000	! [%fp - 0x388]
	.word   	0x00000002	! [%fp - 0x384]
	.word   	0x00000000	! [%fp - 0x380]
	.word   	0x00000000	! [%fp - 0x37c]
	.word   	0x7f800000	! [%fp - 0x378]
	.word   	0x7f7fffff	! [%fp - 0x374]
	.word   	0x007fffff	! [%fp - 0x370]
	.word   	0x007ffffe	! [%fp - 0x36c]
	.word   	0x00800000	! [%fp - 0x368]
	.word   	0x00000001	! [%fp - 0x364]
	.word   	0x00000002	! [%fp - 0x360]
	.word   	0x80000000	! [%fp - 0x35c]
	.word   	0x207fe000	! [%fp - 0x358]
	.word   	0x1ffff000	! [%fp - 0x354]
	.word   	0x307fe123	! [%fp - 0x350]
	.word   	0x0fff1001	! [%fp - 0x34c]
	.word   	0x2ff81000	! [%fp - 0x348]
	.word   	0x1072e100	! [%fp - 0x344]
	.word   	0x027fe067	! [%fp - 0x340]
	.word   	0x3eff1289	! [%fp - 0x33c]
	.word   	0x3f000400	! [%fp - 0x338]
	.word   	0x80003c1f	! [%fp - 0x334]
	.word   	0x00fff800	! [%fp - 0x330]
	.word   	0xffff8000	! [%fp - 0x32c]
	.word   	0x200ff760	! [%fp - 0x328]
	.word   	0x0800011f	! [%fp - 0x324]
	.word   	0x1ffff800	! [%fp - 0x320]
	.word   	0x00000000	! [%fp - 0x31c]
	.word   	0x3ffe8000	! [%fp - 0x318]
	.word   	0x147ff000	! [%fp - 0x314]
	.word   	0x137fe671	! [%fp - 0x310]
	.word   	0x3ffe8459	! [%fp - 0x30c]
	.word   	0x127fffff	! [%fp - 0x308]
	.word   	0x3fffffff	! [%fp - 0x304]
	.word   	0x307fe123	! [%fp - 0x300]
	.word   	0x047fffff	! [%fp - 0x2fc]
	.word   	0x307fe123	! [%fp - 0x2f8]
	.word   	0x03ffffff	! [%fp - 0x2f4]
	.word   	0x107fe100	! [%fp - 0x2f0]
	.word   	0x22efffff	! [%fp - 0x2ec]
	.word   	0x380ffe80	! [%fp - 0x2e8]
	.word   	0x00000000	! [%fp - 0x2e4]
	.word   	0x04bfeff9	! [%fp - 0x2e0]
	.word   	0x00000000	! [%fp - 0x2dc]
	.word   	0x380fffff	! [%fp - 0x2d8]
	.word   	0xffffffff	! [%fp - 0x2d4]
	.word   	0x04bfffff	! [%fp - 0x2d0]
	.word   	0xffffffff	! [%fp - 0x2cc]
	.word   	0x300ff123	! [%fp - 0x2c8]
	.word   	0x40000000	! [%fp - 0x2c4]
	.word   	0x0caf8ee0	! [%fp - 0x2c0]
	.word   	0x00000000	! [%fp - 0x2bc]
	.word   	0x3c0ff456	! [%fp - 0x2b8]
	.word   	0x00000000	! [%fp - 0x2b4]
	.word   	0x009ff000	! [%fp - 0x2b0]
	.word   	0x00000000	! [%fp - 0x2ac]
	.word   	0x3c0ff456	! [%fp - 0x2a8]
	.word   	0x0000ff99	! [%fp - 0x2a4]
	.word   	0x009ff000	! [%fp - 0x2a0]
	.word   	0x001234ff	! [%fp - 0x29c]
	.word   	0x0080ffff	! [%fp - 0x298]
	.word   	0x3ff8f000	! [%fp - 0x294]
	.word   	0x01800001	! [%fp - 0x290]
	.word   	0x40c2fc1f	! [%fp - 0x28c]
	.word   	0x00100100	! [%fp - 0x288]
	.word   	0x10010001	! [%fp - 0x284]
	.word   	0x3fff8f88	! [%fp - 0x280]
	.word   	0x00000000	! [%fp - 0x27c]
	.word   	0x00f00f00	! [%fp - 0x278]
	.word   	0xf000000f	! [%fp - 0x274]
	.word   	0x409ff00f	! [%fp - 0x270]
	.word   	0xff000fff	! [%fp - 0x26c]
	.word   	0x04003009	! [%fp - 0x268]
	.word   	0x4fff0001	! [%fp - 0x264]
	.word   	0x03001001	! [%fp - 0x260]
	.word   	0x4feeeeee	! [%fp - 0x25c]
	.word   	0x0801e067	! [%fp - 0x258]
	.word   	0x54f231f8	! [%fp - 0x254]
	.word   	0x01000001	! [%fp - 0x250]
	.word   	0x00000001	! [%fp - 0x24c]
	.word   	0x453eef45	! [%fp - 0x248]
	.word   	0x00000001	! [%fp - 0x244]
	.word   	0x01100111	! [%fp - 0x240]
	.word   	0x00011111	! [%fp - 0x23c]
	.word   	0x455f8000	! [%fp - 0x238]
	.word   	0xffffffff	! [%fp - 0x234]
	.word   	0x01301222	! [%fp - 0x230]
	.word   	0x00111222	! [%fp - 0x22c]
	.word   	0x458f1100	! [%fp - 0x228]
	.word   	0x01111001	! [%fp - 0x224]
	.word   	0x40811111	! [%fp - 0x220]
	.word   	0x00feeeee	! [%fp - 0x21c]
	.word   	0x40000011	! [%fp - 0x218]
	.word   	0x007fffff	! [%fp - 0x214]
	.word   	0x41800221	! [%fp - 0x210]
	.word   	0x01ff0001	! [%fp - 0x20c]
	.word   	0x7f333333	! [%fp - 0x208]
	.word   	0x3f7fffff	! [%fp - 0x204]
	.word   	0x40100001	! [%fp - 0x200]
	.word   	0x11000011	! [%fp - 0x1fc]
	.word   	0x001fffff	! [%fp - 0x1f8]
	.word   	0xffffffff	! [%fp - 0x1f4]
	.word   	0x40000000	! [%fp - 0x1f0]
	.word   	0x00000011	! [%fp - 0x1ec]
	.word   	0x000fffff	! [%fp - 0x1e8]
	.word   	0xffffffff	! [%fp - 0x1e4]
	.word   	0x7fe11111	! [%fp - 0x1e0]
	.word   	0xffffffff	! [%fp - 0x1dc]
	.word   	0x3ffff110	! [%fp - 0x1d8]
	.word   	0x00000001	! [%fp - 0x1d4]
	.word   	0x7fffffff	! [%fp - 0x1d0]
	.word   	0x7f800001	! [%fp - 0x1cc]
	.word   	0x7f800000	! [%fp - 0x1c8]
	.word   	0x7f7fffff	! [%fp - 0x1c4]
	.word   	0x5f800001	! [%fp - 0x1c0]
	.word   	0x5f800000	! [%fp - 0x1bc]
	.word   	0x5f7fffff	! [%fp - 0x1b8]
	.word   	0x5f000001	! [%fp - 0x1b4]
	.word   	0x5f000000	! [%fp - 0x1b0]
	.word   	0x5effffff	! [%fp - 0x1ac]
	.word   	0x4b000001	! [%fp - 0x1a8]
	.word   	0x4b000000	! [%fp - 0x1a4]
	.word   	0x4affffff	! [%fp - 0x1a0]
	.word   	0x40000001	! [%fp - 0x19c]
	.word   	0x40000000	! [%fp - 0x198]
	.word   	0x3fffffff	! [%fp - 0x194]
	.word   	0x3f800001	! [%fp - 0x190]
	.word   	0x3f800000	! [%fp - 0x18c]
	.word   	0x3f7fffff	! [%fp - 0x188]
	.word   	0x00000000	! [%fp - 0x184]
	.word   	0x7fffffff	! [%fp - 0x180]
	.word   	0xffffffff	! [%fp - 0x17c]
	.word   	0x7ff00000	! [%fp - 0x178]
	.word   	0x00000001	! [%fp - 0x174]
	.word   	0x7ff00000	! [%fp - 0x170]
	.word   	0x00000000	! [%fp - 0x16c]
	.word   	0x7fefffff	! [%fp - 0x168]
	.word   	0xffffffff	! [%fp - 0x164]
	.word   	0x43e00000	! [%fp - 0x160]
	.word   	0x00000001	! [%fp - 0x15c]
	.word   	0x43e00000	! [%fp - 0x158]
	.word   	0x00000000	! [%fp - 0x154]
	.word   	0x43dfffff	! [%fp - 0x150]
	.word   	0xffffffff	! [%fp - 0x14c]
	.word   	0x43d00000	! [%fp - 0x148]
	.word   	0x00000001	! [%fp - 0x144]
	.word   	0x43d00000	! [%fp - 0x140]
	.word   	0x00000000	! [%fp - 0x13c]
	.word   	0x43cfffff	! [%fp - 0x138]
	.word   	0xffffffff	! [%fp - 0x134]
	.word   	0x43300000	! [%fp - 0x130]
	.word   	0x00000001	! [%fp - 0x12c]
	.word   	0x43300000	! [%fp - 0x128]
	.word   	0x00000000	! [%fp - 0x124]
	.word   	0x432fffff	! [%fp - 0x120]
	.word   	0xffffffff	! [%fp - 0x11c]
	.word   	0x40000000	! [%fp - 0x118]
	.word   	0x00000001	! [%fp - 0x114]
	.word   	0x40000000	! [%fp - 0x110]
	.word   	0x00000000	! [%fp - 0x10c]
	.word   	0x3fffffff	! [%fp - 0x108]
	.word   	0xffffffff	! [%fp - 0x104]
	.word   	0x3ff00000	! [%fp - 0x100]
	.word   	0x00000001	! [%fp - 0xfc]
	.word   	0x3ff00000	! [%fp - 0xf8]
	.word   	0x00000000	! [%fp - 0xf4]
	.word   	0x3fefffff	! [%fp - 0xf0]
	.word   	0xffffffff	! [%fp - 0xec]
	.word   	0x80000000	! [%fp - 0xe8]
	.word   	0x00000000	! [%fp - 0xe4]
	.word   	0x7fffffff	! [%fp - 0xe0]
	.word   	0xffffffff	! [%fp - 0xdc]
	.word   	0x00000000	! [%fp - 0xd8]
	.word   	0x00000000	! [%fp - 0xd4]
	.word   	0x00200000	! [%fp - 0xd0]
	.word   	0x00000003	! [%fp - 0xcc]
	.word   	0x00200000	! [%fp - 0xc8]
	.word   	0x00000002	! [%fp - 0xc4]
	.word   	0x00200000	! [%fp - 0xc0]
	.word   	0x00000001	! [%fp - 0xbc]
	.word   	0x00200000	! [%fp - 0xb8]
	.word   	0x00000000	! [%fp - 0xb4]
	.word   	0x001fffff	! [%fp - 0xb0]
	.word   	0xffffffff	! [%fp - 0xac]
	.word   	0x00100000	! [%fp - 0xa8]
	.word   	0x00000001	! [%fp - 0xa4]
	.word   	0x00100000	! [%fp - 0xa0]
	.word   	0x00000000	! [%fp - 0x9c]
	.word   	0x000fffff	! [%fp - 0x98]
	.word   	0xffffffff	! [%fp - 0x94]
	.word   	0x00080000	! [%fp - 0x90]
	.word   	0x00000001	! [%fp - 0x8c]
	.word   	0x00080000	! [%fp - 0x88]
	.word   	0x00000000	! [%fp - 0x84]
	.word   	0x0007ffff	! [%fp - 0x80]
	.word   	0xffffffff	! [%fp - 0x7c]
	.word   	0x00000000	! [%fp - 0x78]
	.word   	0x01000003	! [%fp - 0x74]
	.word   	0x00000000	! [%fp - 0x70]
	.word   	0x01000002	! [%fp - 0x6c]
	.word   	0x00000000	! [%fp - 0x68]
	.word   	0x01000001	! [%fp - 0x64]
	.word   	0x00000000	! [%fp - 0x60]
	.word   	0x01000000	! [%fp - 0x5c]
	.word   	0x00000000	! [%fp - 0x58]
	.word   	0x00ffffff	! [%fp - 0x54]
	.word   	0x00000000	! [%fp - 0x50]
	.word   	0x00800001	! [%fp - 0x4c]
	.word   	0x00000000	! [%fp - 0x48]
	.word   	0x00800000	! [%fp - 0x44]
	.word   	0x00000000	! [%fp - 0x40]
	.word   	0x007fffff	! [%fp - 0x3c]
	.word   	0x00000000	! [%fp - 0x38]
	.word   	0x00400001	! [%fp - 0x34]
	.word   	0x00000000	! [%fp - 0x30]
	.word   	0x00400000	! [%fp - 0x2c]
	.word   	0x00000000	! [%fp - 0x28]
	.word   	0x003fffff	! [%fp - 0x24]
	.word   	t0_data_in_area0	! [%fp - 0x20]
	.word   	SYM(t0_subr3)	! [%fp - 0x1c]
	.word   	SYM(t0_subr2)	! [%fp - 0x18]
	.word   	SYM(t0_subr1)	! [%fp - 0x14]
	.word   	SYM(t0_subr0)	! [%fp - 0x10]
t0_data_in_mtbl:
	.word   	0x5138fec1	! [%fp - 0xc]
	.word   	0x5f55f405	! [%fp - 0x8]
	.word   	0x35b8dce8	! [%fp - 0x4]
.global t0_data_in_fp; t0_data_in_fp:
	.word	0xc28401f5
	.word	0xeea87b2a
	.word	0x60963766
	.word	0xcb4d2ae7
	.word	0x11353e9e
	.word	0xb851a82e
	.word	0xfb969dae
	.word	0xdffbe6e2
	.word	0xb90d69de
	.word	0xfccd7623
	.word	0x870227e8
	.word	0x849a8b56
	.word	0xf15be498
	.word	0xdab79b3e
	.word	0xededddd4
	.word	0xfad45f03
	.word	0x35c7da1a
	.word	0xe30f0c24
	.word	0xffb11ceb
	.word	0x5af1b19b
	.word	0xea9ed0c7
	.word	0x33cce9c0
	.word	0x734553a1
	.word	0xa089afb5
t0_data_in_stacktop:
	.word	0
t0_data_in_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_in_area0, 0x3d1ba000)
.seg "data"
t0_data_in_area0_start:
.skip 2240
t0_data_in_area0_begin:
	.word	0x85e920f5	! t0_data_in_area0-0x20
	.word	0xaa9bf857	! t0_data_in_area0-0x1c
	.word	0x72cface9	! t0_data_in_area0-0x18
	.word	0x59e90207	! t0_data_in_area0-0x14
	.word	0x4d147618	! t0_data_in_area0-0x10
	.word	0x1ba7f3d9	! t0_data_in_area0-0xc
	.word	0xcd1b6ffe	! t0_data_in_area0-0x8
	.word	0xebe6abd4	! t0_data_in_area0-0x4
.global t0_data_in_area0; t0_data_in_area0:
	.word	0x2162be1f	! t0_data_in_area0+0x0
	.word	0x701d5578	! t0_data_in_area0+0x4
	.word	0x39f4185f	! t0_data_in_area0+0x8
	.word	0x3983dca3	! t0_data_in_area0+0xc
	.word	0xdf4e2b1e	! t0_data_in_area0+0x10
	.word	0xd8675e7e	! t0_data_in_area0+0x14
	.word	0x4fba6a1a	! t0_data_in_area0+0x18
	.word	0xcb4aa931	! t0_data_in_area0+0x1c
t0_data_in_area0_end:
.skip 5888
t0_data_in_area0_stop:

KDATA_MODULE(t0_module_data_in_shm_area, 0x11dc2000)
.seg "data"
t0_data_in_shm_area_start:
t0_data_in_shm_area_begin:
.global t0_data_in_shm_area; t0_data_in_shm_area:
	.word	0x54f92b2c	! t0_data_in_shm_area+0x0 (t0)
	.word	0xe0b413dd	! t0_data_in_shm_area+0x4 (t1)
	.word	0x90c37c5b	! t0_data_in_shm_area+0x8 (t0)
	.word	0x8d11e578	! t0_data_in_shm_area+0xc (t1)
	.word	0x3c80064d	! t0_data_in_shm_area+0x10 (t0)
	.word	0xd8acf893	! t0_data_in_shm_area+0x14 (t1)
	.word	0xc92adfa8	! t0_data_in_shm_area+0x18 (t0)
	.word	0x7ad58f50	! t0_data_in_shm_area+0x1c (t1)
	.word	0xc3cb7a8e	! t0_data_in_shm_area+0x20 (t0)
	.word	0x15558d4e	! t0_data_in_shm_area+0x24 (t1)
	.word	0x209e59fd	! t0_data_in_shm_area+0x28 (t0)
	.word	0x81b744e9	! t0_data_in_shm_area+0x2c (t1)
	.word	0x2fa943e9	! t0_data_in_shm_area+0x30 (t0)
	.word	0x1a20d3e6	! t0_data_in_shm_area+0x34 (t1)
	.word	0x29d36b10	! t0_data_in_shm_area+0x38 (t0)
	.word	0x041a263e	! t0_data_in_shm_area+0x3c (t1)
	.word	0x9fcbb414	! t0_data_in_shm_area+0x40 (t0 bload)
	.word	0x1fa03264	! t0_data_in_shm_area+0x44
	.word	0xcacd50b9	! t0_data_in_shm_area+0x48
	.word	0x0779fa04	! t0_data_in_shm_area+0x4c
	.word	0xce5703c3	! t0_data_in_shm_area+0x50
	.word	0xdb933875	! t0_data_in_shm_area+0x54
	.word	0x5588dea2	! t0_data_in_shm_area+0x58
	.word	0xaae9dca9	! t0_data_in_shm_area+0x5c
	.word	0xebcedfb3	! t0_data_in_shm_area+0x60
	.word	0x41a8280d	! t0_data_in_shm_area+0x64
	.word	0xc077e12c	! t0_data_in_shm_area+0x68
	.word	0x5dce4ddc	! t0_data_in_shm_area+0x6c
	.word	0x26eeeb3a	! t0_data_in_shm_area+0x70
	.word	0x094a5458	! t0_data_in_shm_area+0x74
	.word	0x73cf1f40	! t0_data_in_shm_area+0x78
	.word	0xb3bb9baa	! t0_data_in_shm_area+0x7c
	.word	0x76fb684a	! t0_data_in_shm_area+0x80 (t0 bstore)
	.word	0xbff5c764	! t0_data_in_shm_area+0x84
	.word	0x2e569d33	! t0_data_in_shm_area+0x88
	.word	0xa9bde304	! t0_data_in_shm_area+0x8c
	.word	0x6a1adb17	! t0_data_in_shm_area+0x90
	.word	0x419746f0	! t0_data_in_shm_area+0x94
	.word	0xd6122303	! t0_data_in_shm_area+0x98
	.word	0xa56b52b3	! t0_data_in_shm_area+0x9c
	.word	0x7933c3fc	! t0_data_in_shm_area+0xa0
	.word	0xb927528a	! t0_data_in_shm_area+0xa4
	.word	0x8cf562df	! t0_data_in_shm_area+0xa8
	.word	0x19e32989	! t0_data_in_shm_area+0xac
	.word	0xd0d1939f	! t0_data_in_shm_area+0xb0
	.word	0x26ae6ed8	! t0_data_in_shm_area+0xb4
	.word	0xe5d583ec	! t0_data_in_shm_area+0xb8
	.word	0xfa01e3d8	! t0_data_in_shm_area+0xbc
	.word	0x3cdd5fe6	! t0_data_in_shm_area+0xc0 (t1 bload)
	.word	0x6705d88f	! t0_data_in_shm_area+0xc4
	.word	0xd5a71658	! t0_data_in_shm_area+0xc8
	.word	0x53f0bb60	! t0_data_in_shm_area+0xcc
	.word	0xbf08c221	! t0_data_in_shm_area+0xd0
	.word	0xcb8de542	! t0_data_in_shm_area+0xd4
	.word	0x426981d8	! t0_data_in_shm_area+0xd8
	.word	0xe3d56f19	! t0_data_in_shm_area+0xdc
	.word	0x07752235	! t0_data_in_shm_area+0xe0
	.word	0xfde825f2	! t0_data_in_shm_area+0xe4
	.word	0xfa0dd096	! t0_data_in_shm_area+0xe8
	.word	0x4fd1ceab	! t0_data_in_shm_area+0xec
	.word	0x0363432e	! t0_data_in_shm_area+0xf0
	.word	0xfa278bfc	! t0_data_in_shm_area+0xf4
	.word	0x6a6010c9	! t0_data_in_shm_area+0xf8
	.word	0x5b27fea4	! t0_data_in_shm_area+0xfc
	.word	0xa1ac8859	! t0_data_in_shm_area+0x100 (t1 bstore)
	.word	0x7f3630bf	! t0_data_in_shm_area+0x104
	.word	0x7b6078ac	! t0_data_in_shm_area+0x108
	.word	0xfc619898	! t0_data_in_shm_area+0x10c
	.word	0xca3712e6	! t0_data_in_shm_area+0x110
	.word	0x49174c6f	! t0_data_in_shm_area+0x114
	.word	0x048bf6c8	! t0_data_in_shm_area+0x118
	.word	0x7582300f	! t0_data_in_shm_area+0x11c
	.word	0x37db95c8	! t0_data_in_shm_area+0x120
	.word	0x62514628	! t0_data_in_shm_area+0x124
	.word	0xebe70278	! t0_data_in_shm_area+0x128
	.word	0xf4a8b2c1	! t0_data_in_shm_area+0x12c
	.word	0xa17a03e0	! t0_data_in_shm_area+0x130
	.word	0xf7603146	! t0_data_in_shm_area+0x134
	.word	0x6bc670aa	! t0_data_in_shm_area+0x138
	.word	0xd66a1800	! t0_data_in_shm_area+0x13c
t0_data_in_shm_area_end:
t0_data_in_shm_area_stop:

KDATA_MODULE(t0_module_data_exp_regs, 0x11afa000)
.seg "data"
KGLOBAL(t0_data_exp_regs)
t0_data_exp_regs_start:
t0_data_exp_regs:
	.word	0xd34b438c          ! %f0
	.word	0x801dd53e          ! %f1
	.word	0xc5f82bac          ! %f2
	.word	0x11b02554          ! %f3
	.word	0x14714d5f          ! %f4
	.word	0x77843244          ! %f5
	.word	0xfd29d0c0          ! %f6
	.word	0x78d5306e          ! %f7
	.word	0x75dff220          ! %f8
	.word	0xdfff485e          ! %f9
	.word	0x23f6ccfa          ! %f10
	.word	0x940608a6          ! %f11
	.word	0x14840e7b          ! %f12
	.word	0x9e87838b          ! %f13
	.word	0x5b13c97f          ! %f14
	.word	0x6e5862b9          ! %f15
	.word	0xf84deeeb          ! %f16
	.word	0x8968eb5f          ! %f17
	.word	0x597478c7          ! %f18
	.word	0xb858b757          ! %f19
	.word	0x479df38f          ! %f20
	.word	0xc8255c4e          ! %f21
	.word	0x41c11090          ! %f22
	.word	0x3b906806          ! %f23
	.word	0xb6b71d44          ! %f24
	.word	0x986a912a          ! %f25
	.word	0xc954ef15          ! %f26
	.word	0xa14ece47          ! %f27
	.word	0xfc24d7ef          ! %f28
	.word	0xaea0c0e9          ! %f29
	.word	0xdf65df7f          ! %f30
	.word	0x98d198f6          ! %f31
	.word	0x2402961a          ! %f32
	.word	0xc59ed4ac          ! %f33
	.word	0x08f6b19b          ! %f34
	.word	0xe3cb1bf6          ! %f35
	.word	0x33e911c2          ! %f36
	.word	0x2e5d79fc          ! %f37
	.word	0x412f18ce          ! %f38
	.word	0xef0b760d          ! %f39
	.word	0xc92e466e          ! %f40
	.word	0x8e529556          ! %f41
	.word	0x38de0645          ! %f42
	.word	0x39fbb10b          ! %f43
	.word	0xa0627883          ! %f44
	.word	0x7db2d8e9          ! %f45
	.word	0x9a8af270          ! %f46
	.word	0x28e84032          ! %f47
	.word	0x48c5ddd6          ! %f48
	.word	0x666f839d          ! %f49
	.word	0x85cdc9b0          ! %f50
	.word	0xd60a80d1          ! %f51
	.word	0x7e17bb83          ! %f52
	.word	0x2da28c57          ! %f53
	.word	0xbbec704e          ! %f54
	.word	0xd2172131          ! %f55
	.word	0xa7d90cfc          ! %f56
	.word	0xa37bbd7b          ! %f57
	.word	0x243811af          ! %f58
	.word	0x711191b5          ! %f59
	.word	0x0c2a0864          ! %f60
	.word	0x05e584b2          ! %f61
	.word	0xff93aec5          ! %f62
	.word	0x8982e43c          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x36c       ! %g1 (code pointer)
	.word	t0_data_exp_shm_area! %g2 (shared area pointer)
	.word	0x185395f8          ! %g3 (loop index)
	.word	SYM(t0_subr1)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x2f95a18b          ! %o0
	.word	0x78e9ca72          ! %o1
	.word	0x6f4b23b8          ! %o2
	.word	0x5c030344          ! %o3
	.word	0xb44304ff          ! %o4
	.word	0x615519ad          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x2f0b141d          ! %l0
	.word	0xa8407aec          ! %l1
	.word	0xab309fc9          ! %l2
	.word	0x6534bdc9          ! %l3
	.word	0x423f019f          ! %l4
	.word	0xeb00e8a8          ! %l5
	.word	0x7a24fd26          ! %l6
	.word	0xe1773e66          ! %l7
	.word	t0_data_exp_area0   ! %i0 (area pointer)
	.word	t0_data_exp_area0   ! %i1 (area pointer)
	.word	0x0000000a          ! %i2 (byte offset)
	.word	0xffffffe0          ! %i3 (halfword offset)
	.word	0x00000008          ! %i4 (word offset)
	.word	0xffffffe0          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x6c18c835          ! %y
	.word	0x00000007          ! %icc (nzvc)
	.word	0xc0000205          ! %fsr
	.word	0x00000000          ! %gsr.mask
	.word	0x00000000          ! %gsr
	.word	0x000000f0          ! %asi
	.word	0x00000000          ! Integer overflow traps
	.word	0x00000000          ! Integer divide by zero traps
	.word	0x00000000          ! Integer divide > 52 bit dividend traps
	.word	0x00000000          ! Floating inexact traps
	.word	0x00000000          ! Floating divide by zero traps
	.word	0x00000000          ! Floating underflow traps
	.word	0x00000000          ! Floating overflow traps
	.word	0x00000000          ! Floating invalid traps
	.word	0x00000000          ! Floating other traps
	.word	0x00000000          ! Ticc traps
	.word	0x00000000          ! Unexpected SIGFPE traps
	.word	0x00000000          ! Unexpected SIGSEGV traps
	.word	0x00000000          ! Unexpected SIGBUS traps
	.word	0x00000000          ! Unexpected SIGILL traps
	.word	0x00000000          ! Expected SIGSEGV traps
	.word	0x00000000          ! Expected SIGBUS traps
	.word	0x00000000          ! UNIMP traps
	.word	0x00000000          ! ??
t0_data_exp_mtbl_size:	.word	253
t0_data_exp_regs_end:

.skip 7708	! page align

KDATA_MODULE(t0_module_data_exp_stack, 0x0688a000)
.seg "data"
KGLOBAL(t0_data_exp_mtbl_size)
KGLOBAL(t0_data_exp_mtbl)
KGLOBAL(t0_data_exp_stack)
t0_data_exp_stack_start:
	.word	0x234b49b4
	.word	0xfcd95143
	.word	0x211ab27e
	.word	0xa1647ec8
	.word	0x15d8795b
	.word	0x5b24d2d6
	.word	0xad4a785f
	.word	0x621fd990
	.word	0x85f20b72
	.word	0x3567ca02
	.word	0xed2ead60
	.word	0x98cbaf7c
	.word	0x82fee57a
	.word	0xecb1c059
	.word	0x08b61458
	.word	0xa564c21f
	.word	0x6db8e578
	.word	0xbc776120
	.word	0x694454d2
	.word	0x950b7206
	.word	0x7432a2a0
	.word	0x72173ded
	.word	0xa5150cdc
	.word	0xa4a6cdf9
	.word	0xbbac054f
	.word	0xe9d3b98b
	.word	0x80ddac1f
	.word	0xac12d280
	.word	0x9603ea3e
	.word	0x74c63d20
	.word	0x0f496c2f
	.word	0xac749da8
	.word	0x72c444f4
	.word	0xbcee1b92
	.word	0x83cbfa24
	.word	0x84b79b06
	.word	0x39a9757c
	.word	0x01bfc725
	.word	0x50fca569
	.word	0xcde2ebfc
	.word	0xed5cc558
	.word	0xb6bf3d68
	.word	0x9b7527d3
	.word	0xb626903b
	.word	0x94253fb5
	.word	0xe0facd51
	.word	0x364c5af5
	.word	0xc1741288
	.word	0xa0d158df
	.word	0xa5e99ba7
	.word	0x26f66eb2
	.word	0x096ebdc1
	.word	0x534f18f6
	.word	0x988389a0
	.word	0xc8d97513
	.word	0x98bb9e22
	.word	0x9d8fbde2
	.word	0x969e61ca
	.word	0xde7e5759
	.word	0xff79d2c4
	.word	0x11af0883
	.word	0xc2f66f2d
	.word	0x4c338856
	.word	0x342ff367
	.word	0xb925a92d
	.word	0x0606e2b1
	.word	0x8f7807f8
	.word	0x36038e70
	.word	0xa5517f53
	.word	0xd338aabd
	.word	0xccda8c26
	.word	0xeedc0334
	.word	0xb715a081
	.word	0xef34a121
	.word	0x1c61e2ce
	.word	0x46623c76
	.word	0xe0ff5a8f
	.word	0xf9903335
	.word	0x8050e13e
	.word	0xb5e30f2e
	.word	0xd47ca513
	.word	0x45d9e842
	.word	0x2c6974b3
	.word	0x8132418c
	.word	0x2283b617
	.word	0x807d6a1f
	.word	0xc9f7a82f
	.word	0xce087e3b
	.word	0xd1d2ae0b
	.word	0xf94cf41f
	.word	0xa026b38f
	.word	0x7a36b7ea
	.word	0xf3e98efd
	.word	0xa1f84c2a
	.word	0xb5af67dc
	.word	0xddadc107
	.word	0xf54ff306
	.word	0xa897aa29
	.word	0x72108ce0
	.word	0xb0011bcd
	.word	0x18db3607
	.word	0x87f331a7
	.word	0x1e7703fc
	.word	0x6df84680
	.word	0x87c10695
	.word	0xc695e1b4
	.word	0x2284c439
	.word	0xbb3207f7
	.word	0x9c8d9231
	.word	0xe5451f0d
	.word	0x8483039c
	.word	0xfa11805b
	.word	0xfcd3c0bc
	.word	0x0b643c79
	.word	0x307d21bd
	.word	0x5965022d
	.word	0xd7e13329
	.word	0x565da575
	.word	0xcb87279a
	.word	0xcfb2f78d
	.word	0x4f26f974
	.word	0xb6a18f13
	.word	0x694bf0a8
	.word	0x581957b8
	.word	0xf2a333d2
	.word	0x8364531e
	.word	0xb72c512b
	.word	0x787070d2
	.word	0x17a71329
	.word	0x5444d982
	.word	0x0af9cdc6
	.word	0xdc2a09e5
	.word	0x1617ecc1
	.word	0xcfa5b3ea
	.word	0x00ecb855
	.word	0x1f722129
	.word	0x8f01553c
	.word	0x6c09cfab
	.word	0xce1ec5fa
	.word	0xc2a6ca85
	.word	0x623976c3
	.word	0x3c6fe1e0
	.word	0x4fd07276
	.word	0x6b90f255
	.word	0xf7381682
	.word	0xc1b5f1d5
	.word	0xed50c4b9
	.word	0xe020086d
	.word	0xba53fd55
	.word	0x07c0a5a8
	.word	0x2fc448bb
	.word	0x9206d75e
	.word	0xe2a1b7c3
	.word	0x92b8352d
	.word	0x2981528c
	.word	0xb3b80bf7
	.word	0xa8e9e12a
	.word	0x79672712
	.word	0x6384deaa
	.word	0xfa25310e
	.word	0x6cdc6e3c
	.word	0x8be53c43
	.word	0x9be4a392
	.word	0xbb8b2380
	.word	0xee09aaa9
	.word	0x437b2d8f
	.word	0x91582899
	.word	0xa6c34275
t0_data_exp_sp:
	.word	0xc180de1d
	.word	0x08521f8b
	.word	0xdf3bf5fb
	.word	0xf840dfe8
	.word	0xc67fcc6d
	.word	0xd54bf0b6
	.word	0x580f3234
	.word	0xbe56b566
	.word	t0_data_exp_area0
	.word	t0_data_exp_area0
	.word	0x0000000f
	.word	0xfffffff0
	.word	0x0000001c
	.word	0xfffffff0
	.word	t0_data_exp_fp
	.word	0x022878c1
	.word	0x4f0a34fb
	.word	0xf6e82ef7
	.word	0x0044f4a1
	.word	0x37c8ccf6
	.word	0x09123124
	.word	0xa001b270
	.word	0xa613b52f
	.word	0x67a38f0d
t0_data_exp_mtbl_base:
	.word   	0x380fffff	! [%fp - 0x400]
	.word   	0xc0000000	! [%fp - 0x3fc]
	.word   	0x380fffff	! [%fp - 0x3f8]
	.word   	0xe0000000	! [%fp - 0x3f4]
	.word   	0x380fffff	! [%fp - 0x3f0]
	.word   	0x80000000	! [%fp - 0x3ec]
	.word   	0x38000000	! [%fp - 0x3e8]
	.word   	0x40000000	! [%fp - 0x3e4]
	.word   	0x38000000	! [%fp - 0x3e0]
	.word   	0x80000000	! [%fp - 0x3dc]
	.word   	0x38000000	! [%fp - 0x3d8]
	.word   	0x20000000	! [%fp - 0x3d4]
	.word   	0x47f00000	! [%fp - 0x3d0]
	.word   	0x00000000	! [%fp - 0x3cc]
	.word   	0x47f00000	! [%fp - 0x3c8]
	.word   	0x20000000	! [%fp - 0x3c4]
	.word   	0x47efffff	! [%fp - 0x3c0]
	.word   	0xffffffff	! [%fp - 0x3bc]
	.word   	0x7ff00000	! [%fp - 0x3b8]
	.word   	0x00000000	! [%fp - 0x3b4]
	.word   	0x7fefffff	! [%fp - 0x3b0]
	.word   	0xffffffff	! [%fp - 0x3ac]
	.word   	0x000fffff	! [%fp - 0x3a8]
	.word   	0xffffffff	! [%fp - 0x3a4]
	.word   	0x000fffff	! [%fp - 0x3a0]
	.word   	0xfffffffe	! [%fp - 0x39c]
	.word   	0x00100000	! [%fp - 0x398]
	.word   	0x00000000	! [%fp - 0x394]
	.word   	0x00000000	! [%fp - 0x390]
	.word   	0x00000001	! [%fp - 0x38c]
	.word   	0x00000000	! [%fp - 0x388]
	.word   	0x00000002	! [%fp - 0x384]
	.word   	0x00000000	! [%fp - 0x380]
	.word   	0x00000000	! [%fp - 0x37c]
	.word   	0x7f800000	! [%fp - 0x378]
	.word   	0x7f7fffff	! [%fp - 0x374]
	.word   	0x007fffff	! [%fp - 0x370]
	.word   	0x007ffffe	! [%fp - 0x36c]
	.word   	0x00800000	! [%fp - 0x368]
	.word   	0x00000001	! [%fp - 0x364]
	.word   	0x00000002	! [%fp - 0x360]
	.word   	0x80000000	! [%fp - 0x35c]
	.word   	0x207fe000	! [%fp - 0x358]
	.word   	0x1ffff000	! [%fp - 0x354]
	.word   	0x307fe123	! [%fp - 0x350]
	.word   	0x0fff1001	! [%fp - 0x34c]
	.word   	0x2ff81000	! [%fp - 0x348]
	.word   	0x1072e100	! [%fp - 0x344]
	.word   	0x027fe067	! [%fp - 0x340]
	.word   	0x3eff1289	! [%fp - 0x33c]
	.word   	0x3f000400	! [%fp - 0x338]
	.word   	0x80003c1f	! [%fp - 0x334]
	.word   	0x00fff800	! [%fp - 0x330]
	.word   	0xffff8000	! [%fp - 0x32c]
	.word   	0x200ff760	! [%fp - 0x328]
	.word   	0x0800011f	! [%fp - 0x324]
	.word   	0x1ffff800	! [%fp - 0x320]
	.word   	0x00000000	! [%fp - 0x31c]
	.word   	0x3ffe8000	! [%fp - 0x318]
	.word   	0x147ff000	! [%fp - 0x314]
	.word   	0x137fe671	! [%fp - 0x310]
	.word   	0x3ffe8459	! [%fp - 0x30c]
	.word   	0x127fffff	! [%fp - 0x308]
	.word   	0x3fffffff	! [%fp - 0x304]
	.word   	0x307fe123	! [%fp - 0x300]
	.word   	0x047fffff	! [%fp - 0x2fc]
	.word   	0x307fe123	! [%fp - 0x2f8]
	.word   	0x03ffffff	! [%fp - 0x2f4]
	.word   	0x107fe100	! [%fp - 0x2f0]
	.word   	0x22efffff	! [%fp - 0x2ec]
	.word   	0x380ffe80	! [%fp - 0x2e8]
	.word   	0x00000000	! [%fp - 0x2e4]
	.word   	0x04bfeff9	! [%fp - 0x2e0]
	.word   	0x00000000	! [%fp - 0x2dc]
	.word   	0x380fffff	! [%fp - 0x2d8]
	.word   	0xffffffff	! [%fp - 0x2d4]
	.word   	0x04bfffff	! [%fp - 0x2d0]
	.word   	0xffffffff	! [%fp - 0x2cc]
	.word   	0x300ff123	! [%fp - 0x2c8]
	.word   	0x40000000	! [%fp - 0x2c4]
	.word   	0x0caf8ee0	! [%fp - 0x2c0]
	.word   	0x00000000	! [%fp - 0x2bc]
	.word   	0x3c0ff456	! [%fp - 0x2b8]
	.word   	0x00000000	! [%fp - 0x2b4]
	.word   	0x009ff000	! [%fp - 0x2b0]
	.word   	0x00000000	! [%fp - 0x2ac]
	.word   	0x3c0ff456	! [%fp - 0x2a8]
	.word   	0x0000ff99	! [%fp - 0x2a4]
	.word   	0x009ff000	! [%fp - 0x2a0]
	.word   	0x001234ff	! [%fp - 0x29c]
	.word   	0x0080ffff	! [%fp - 0x298]
	.word   	0x3ff8f000	! [%fp - 0x294]
	.word   	0x01800001	! [%fp - 0x290]
	.word   	0x40c2fc1f	! [%fp - 0x28c]
	.word   	0x00100100	! [%fp - 0x288]
	.word   	0x10010001	! [%fp - 0x284]
	.word   	0x3fff8f88	! [%fp - 0x280]
	.word   	0x00000000	! [%fp - 0x27c]
	.word   	0x00f00f00	! [%fp - 0x278]
	.word   	0xf000000f	! [%fp - 0x274]
	.word   	0x409ff00f	! [%fp - 0x270]
	.word   	0xff000fff	! [%fp - 0x26c]
	.word   	0x04003009	! [%fp - 0x268]
	.word   	0x4fff0001	! [%fp - 0x264]
	.word   	0x03001001	! [%fp - 0x260]
	.word   	0x4feeeeee	! [%fp - 0x25c]
	.word   	0x0801e067	! [%fp - 0x258]
	.word   	0x54f231f8	! [%fp - 0x254]
	.word   	0x01000001	! [%fp - 0x250]
	.word   	0x00000001	! [%fp - 0x24c]
	.word   	0x453eef45	! [%fp - 0x248]
	.word   	0x00000001	! [%fp - 0x244]
	.word   	0x01100111	! [%fp - 0x240]
	.word   	0x00011111	! [%fp - 0x23c]
	.word   	0x455f8000	! [%fp - 0x238]
	.word   	0xffffffff	! [%fp - 0x234]
	.word   	0x01301222	! [%fp - 0x230]
	.word   	0x00111222	! [%fp - 0x22c]
	.word   	0x458f1100	! [%fp - 0x228]
	.word   	0x01111001	! [%fp - 0x224]
	.word   	0x40811111	! [%fp - 0x220]
	.word   	0x00feeeee	! [%fp - 0x21c]
	.word   	0x40000011	! [%fp - 0x218]
	.word   	0x007fffff	! [%fp - 0x214]
	.word   	0x41800221	! [%fp - 0x210]
	.word   	0x01ff0001	! [%fp - 0x20c]
	.word   	0x7f333333	! [%fp - 0x208]
	.word   	0x3f7fffff	! [%fp - 0x204]
	.word   	0x40100001	! [%fp - 0x200]
	.word   	0x11000011	! [%fp - 0x1fc]
	.word   	0x001fffff	! [%fp - 0x1f8]
	.word   	0xffffffff	! [%fp - 0x1f4]
	.word   	0x40000000	! [%fp - 0x1f0]
	.word   	0x00000011	! [%fp - 0x1ec]
	.word   	0x000fffff	! [%fp - 0x1e8]
	.word   	0xffffffff	! [%fp - 0x1e4]
	.word   	0x7fe11111	! [%fp - 0x1e0]
	.word   	0xffffffff	! [%fp - 0x1dc]
	.word   	0x3ffff110	! [%fp - 0x1d8]
	.word   	0x00000001	! [%fp - 0x1d4]
	.word   	0x7fffffff	! [%fp - 0x1d0]
	.word   	0x7f800001	! [%fp - 0x1cc]
	.word   	0x7f800000	! [%fp - 0x1c8]
	.word   	0x7f7fffff	! [%fp - 0x1c4]
	.word   	0x5f800001	! [%fp - 0x1c0]
	.word   	0x5f800000	! [%fp - 0x1bc]
	.word   	0x5f7fffff	! [%fp - 0x1b8]
	.word   	0x5f000001	! [%fp - 0x1b4]
	.word   	0x5f000000	! [%fp - 0x1b0]
	.word   	0x5effffff	! [%fp - 0x1ac]
	.word   	0x4b000001	! [%fp - 0x1a8]
	.word   	0x4b000000	! [%fp - 0x1a4]
	.word   	0x4affffff	! [%fp - 0x1a0]
	.word   	0x40000001	! [%fp - 0x19c]
	.word   	0x40000000	! [%fp - 0x198]
	.word   	0x3fffffff	! [%fp - 0x194]
	.word   	0x3f800001	! [%fp - 0x190]
	.word   	0x3f800000	! [%fp - 0x18c]
	.word   	0x3f7fffff	! [%fp - 0x188]
	.word   	0x00000000	! [%fp - 0x184]
	.word   	0x7fffffff	! [%fp - 0x180]
	.word   	0xffffffff	! [%fp - 0x17c]
	.word   	0x7ff00000	! [%fp - 0x178]
	.word   	0x00000001	! [%fp - 0x174]
	.word   	0x7ff00000	! [%fp - 0x170]
	.word   	0x00000000	! [%fp - 0x16c]
	.word   	0x7fefffff	! [%fp - 0x168]
	.word   	0xffffffff	! [%fp - 0x164]
	.word   	0x43e00000	! [%fp - 0x160]
	.word   	0x00000001	! [%fp - 0x15c]
	.word   	0x43e00000	! [%fp - 0x158]
	.word   	0x00000000	! [%fp - 0x154]
	.word   	0x43dfffff	! [%fp - 0x150]
	.word   	0xffffffff	! [%fp - 0x14c]
	.word   	0x43d00000	! [%fp - 0x148]
	.word   	0x00000001	! [%fp - 0x144]
	.word   	0x43d00000	! [%fp - 0x140]
	.word   	0x00000000	! [%fp - 0x13c]
	.word   	0x43cfffff	! [%fp - 0x138]
	.word   	0xffffffff	! [%fp - 0x134]
	.word   	0x43300000	! [%fp - 0x130]
	.word   	0x00000001	! [%fp - 0x12c]
	.word   	0x43300000	! [%fp - 0x128]
	.word   	0x00000000	! [%fp - 0x124]
	.word   	0x432fffff	! [%fp - 0x120]
	.word   	0xffffffff	! [%fp - 0x11c]
	.word   	0x40000000	! [%fp - 0x118]
	.word   	0x00000001	! [%fp - 0x114]
	.word   	0x40000000	! [%fp - 0x110]
	.word   	0x00000000	! [%fp - 0x10c]
	.word   	0x3fffffff	! [%fp - 0x108]
	.word   	0xffffffff	! [%fp - 0x104]
	.word   	0x3ff00000	! [%fp - 0x100]
	.word   	0x00000001	! [%fp - 0xfc]
	.word   	0x3ff00000	! [%fp - 0xf8]
	.word   	0x00000000	! [%fp - 0xf4]
	.word   	0x3fefffff	! [%fp - 0xf0]
	.word   	0xffffffff	! [%fp - 0xec]
	.word   	0x80000000	! [%fp - 0xe8]
	.word   	0x00000000	! [%fp - 0xe4]
	.word   	0x7fffffff	! [%fp - 0xe0]
	.word   	0xffffffff	! [%fp - 0xdc]
	.word   	0x00000000	! [%fp - 0xd8]
	.word   	0x00000000	! [%fp - 0xd4]
	.word   	0x00200000	! [%fp - 0xd0]
	.word   	0x00000003	! [%fp - 0xcc]
	.word   	0x00200000	! [%fp - 0xc8]
	.word   	0x00000002	! [%fp - 0xc4]
	.word   	0x00200000	! [%fp - 0xc0]
	.word   	0x00000001	! [%fp - 0xbc]
	.word   	0x00200000	! [%fp - 0xb8]
	.word   	0x00000000	! [%fp - 0xb4]
	.word   	0x001fffff	! [%fp - 0xb0]
	.word   	0xffffffff	! [%fp - 0xac]
	.word   	0x00100000	! [%fp - 0xa8]
	.word   	0x00000001	! [%fp - 0xa4]
	.word   	0x00100000	! [%fp - 0xa0]
	.word   	0x00000000	! [%fp - 0x9c]
	.word   	0x000fffff	! [%fp - 0x98]
	.word   	0xffffffff	! [%fp - 0x94]
	.word   	0x00080000	! [%fp - 0x90]
	.word   	0x00000001	! [%fp - 0x8c]
	.word   	0x00080000	! [%fp - 0x88]
	.word   	0x00000000	! [%fp - 0x84]
	.word   	0x0007ffff	! [%fp - 0x80]
	.word   	0xffffffff	! [%fp - 0x7c]
	.word   	0x00000000	! [%fp - 0x78]
	.word   	0x01000003	! [%fp - 0x74]
	.word   	0x00000000	! [%fp - 0x70]
	.word   	0x01000002	! [%fp - 0x6c]
	.word   	0x00000000	! [%fp - 0x68]
	.word   	0x01000001	! [%fp - 0x64]
	.word   	0x00000000	! [%fp - 0x60]
	.word   	0x01000000	! [%fp - 0x5c]
	.word   	0x00000000	! [%fp - 0x58]
	.word   	0x00ffffff	! [%fp - 0x54]
	.word   	0x00000000	! [%fp - 0x50]
	.word   	0x00800001	! [%fp - 0x4c]
	.word   	0x00000000	! [%fp - 0x48]
	.word   	0x00800000	! [%fp - 0x44]
	.word   	0x00000000	! [%fp - 0x40]
	.word   	0x007fffff	! [%fp - 0x3c]
	.word   	0x00000000	! [%fp - 0x38]
	.word   	0x00400001	! [%fp - 0x34]
	.word   	0x00000000	! [%fp - 0x30]
	.word   	0x00400000	! [%fp - 0x2c]
	.word   	0x00000000	! [%fp - 0x28]
	.word   	0x003fffff	! [%fp - 0x24]
	.word   	t0_data_exp_area0	! [%fp - 0x20]
	.word   	SYM(t0_subr3)	! [%fp - 0x1c]
	.word   	SYM(t0_subr2)	! [%fp - 0x18]
	.word   	SYM(t0_subr1)	! [%fp - 0x14]
	.word   	SYM(t0_subr0)	! [%fp - 0x10]
t0_data_exp_mtbl:
	.word   	0x5138fec1	! [%fp - 0xc]
	.word   	0x5f55f405	! [%fp - 0x8]
	.word   	0x35b8dce8	! [%fp - 0x4]
t0_data_exp_fp:
	.word	0xc28401f5
	.word	0xeea87b2a
	.word	0x60963766
	.word	0xcb4d2ae7
	.word	0x11353e9e
	.word	0xb851a82e
	.word	0xfb969dae
	.word	0xdffbe6e2
	.word	0xb90d69de
	.word	0xfccd7623
	.word	0x870227e8
	.word	0x849a8b56
	.word	0xf15be498
	.word	0xdab79b3e
	.word	0xededddd4
	.word	0xfad45f03
	.word	0x35c7da1a
	.word	0xe30f0c24
	.word	0xffb11ceb
	.word	0x5af1b19b
	.word	0xea9ed0c7
	.word	0x33cce9c0
	.word	0x734553a1
	.word	0xa089afb5
t0_data_exp_stacktop:
	.word	0
t0_data_exp_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_exp_area0, 0x1e162000)
.seg "data"
t0_data_exp_area0_start:
.skip 2240
t0_data_exp_area0_begin:
	.word	0x85e920f5	! t0_data_exp_area0-0x20
	.word	0xaa9bf857	! t0_data_exp_area0-0x1c
	.word	0x72cface9	! t0_data_exp_area0-0x18
	.word	0x59e90207	! t0_data_exp_area0-0x14
	.word	0x4d147618	! t0_data_exp_area0-0x10
	.word	0x1ba7f3d9	! t0_data_exp_area0-0xc
	.word	0xcd1b6ffe	! t0_data_exp_area0-0x8
	.word	0xebe6abd4	! t0_data_exp_area0-0x4
.global t0_data_exp_area0; t0_data_exp_area0:
	.word	0x2162be1f	! t0_data_exp_area0+0x0
	.word	0x701d5578	! t0_data_exp_area0+0x4
	.word	0x39f4185f	! t0_data_exp_area0+0x8
	.word	0x3983dca3	! t0_data_exp_area0+0xc
	.word	0xdf4e2b1e	! t0_data_exp_area0+0x10
	.word	0xd8675e7e	! t0_data_exp_area0+0x14
	.word	0x4fba6a1a	! t0_data_exp_area0+0x18
	.word	0xcb4aa931	! t0_data_exp_area0+0x1c
t0_data_exp_area0_end:
.skip 5888
t0_data_exp_area0_stop:

KDATA_MODULE(t0_module_data_exp_shm_area, 0x1340a000)
.seg "data"
t0_data_exp_shm_area_start:
t0_data_exp_shm_area_begin:
.global t0_data_exp_shm_area; t0_data_exp_shm_area:
	.word	0x54f92b2c	! t0_data_exp_shm_area+0x0 (t0)
	.word	0xe0b413dd	! t0_data_exp_shm_area+0x4 (t1)
	.word	0x90c37c5b	! t0_data_exp_shm_area+0x8 (t0)
	.word	0x8d11e578	! t0_data_exp_shm_area+0xc (t1)
	.word	0x3c80064d	! t0_data_exp_shm_area+0x10 (t0)
	.word	0xd8acf893	! t0_data_exp_shm_area+0x14 (t1)
	.word	0xc92adfa8	! t0_data_exp_shm_area+0x18 (t0)
	.word	0x7ad58f50	! t0_data_exp_shm_area+0x1c (t1)
	.word	0xc3cb7a8e	! t0_data_exp_shm_area+0x20 (t0)
	.word	0x15558d4e	! t0_data_exp_shm_area+0x24 (t1)
	.word	0x209e59fd	! t0_data_exp_shm_area+0x28 (t0)
	.word	0x81b744e9	! t0_data_exp_shm_area+0x2c (t1)
	.word	0x2fa943e9	! t0_data_exp_shm_area+0x30 (t0)
	.word	0x1a20d3e6	! t0_data_exp_shm_area+0x34 (t1)
	.word	0x29d36b10	! t0_data_exp_shm_area+0x38 (t0)
	.word	0x041a263e	! t0_data_exp_shm_area+0x3c (t1)
	.word	0x9fcbb414	! t0_data_exp_shm_area+0x40 (t0 bload)
	.word	0x1fa03264	! t0_data_exp_shm_area+0x44
	.word	0xcacd50b9	! t0_data_exp_shm_area+0x48
	.word	0x0779fa04	! t0_data_exp_shm_area+0x4c
	.word	0xce5703c3	! t0_data_exp_shm_area+0x50
	.word	0xdb933875	! t0_data_exp_shm_area+0x54
	.word	0x5588dea2	! t0_data_exp_shm_area+0x58
	.word	0xaae9dca9	! t0_data_exp_shm_area+0x5c
	.word	0xebcedfb3	! t0_data_exp_shm_area+0x60
	.word	0x41a8280d	! t0_data_exp_shm_area+0x64
	.word	0xc077e12c	! t0_data_exp_shm_area+0x68
	.word	0x5dce4ddc	! t0_data_exp_shm_area+0x6c
	.word	0x26eeeb3a	! t0_data_exp_shm_area+0x70
	.word	0x094a5458	! t0_data_exp_shm_area+0x74
	.word	0x73cf1f40	! t0_data_exp_shm_area+0x78
	.word	0xb3bb9baa	! t0_data_exp_shm_area+0x7c
	.word	0x76fb684a	! t0_data_exp_shm_area+0x80 (t0 bstore)
	.word	0xbff5c764	! t0_data_exp_shm_area+0x84
	.word	0x2e569d33	! t0_data_exp_shm_area+0x88
	.word	0xa9bde304	! t0_data_exp_shm_area+0x8c
	.word	0x6a1adb17	! t0_data_exp_shm_area+0x90
	.word	0x419746f0	! t0_data_exp_shm_area+0x94
	.word	0xd6122303	! t0_data_exp_shm_area+0x98
	.word	0xa56b52b3	! t0_data_exp_shm_area+0x9c
	.word	0x7933c3fc	! t0_data_exp_shm_area+0xa0
	.word	0xb927528a	! t0_data_exp_shm_area+0xa4
	.word	0x8cf562df	! t0_data_exp_shm_area+0xa8
	.word	0x19e32989	! t0_data_exp_shm_area+0xac
	.word	0xd0d1939f	! t0_data_exp_shm_area+0xb0
	.word	0x26ae6ed8	! t0_data_exp_shm_area+0xb4
	.word	0xe5d583ec	! t0_data_exp_shm_area+0xb8
	.word	0xfa01e3d8	! t0_data_exp_shm_area+0xbc
	.word	0x3cdd5fe6	! t0_data_exp_shm_area+0xc0 (t1 bload)
	.word	0x6705d88f	! t0_data_exp_shm_area+0xc4
	.word	0xd5a71658	! t0_data_exp_shm_area+0xc8
	.word	0x53f0bb60	! t0_data_exp_shm_area+0xcc
	.word	0xbf08c221	! t0_data_exp_shm_area+0xd0
	.word	0xcb8de542	! t0_data_exp_shm_area+0xd4
	.word	0x426981d8	! t0_data_exp_shm_area+0xd8
	.word	0xe3d56f19	! t0_data_exp_shm_area+0xdc
	.word	0x07752235	! t0_data_exp_shm_area+0xe0
	.word	0xfde825f2	! t0_data_exp_shm_area+0xe4
	.word	0xfa0dd096	! t0_data_exp_shm_area+0xe8
	.word	0x4fd1ceab	! t0_data_exp_shm_area+0xec
	.word	0x0363432e	! t0_data_exp_shm_area+0xf0
	.word	0xfa278bfc	! t0_data_exp_shm_area+0xf4
	.word	0x6a6010c9	! t0_data_exp_shm_area+0xf8
	.word	0x5b27fea4	! t0_data_exp_shm_area+0xfc
	.word	0xa1ac8859	! t0_data_exp_shm_area+0x100 (t1 bstore)
	.word	0x7f3630bf	! t0_data_exp_shm_area+0x104
	.word	0x7b6078ac	! t0_data_exp_shm_area+0x108
	.word	0xfc619898	! t0_data_exp_shm_area+0x10c
	.word	0xca3712e6	! t0_data_exp_shm_area+0x110
	.word	0x49174c6f	! t0_data_exp_shm_area+0x114
	.word	0x048bf6c8	! t0_data_exp_shm_area+0x118
	.word	0x7582300f	! t0_data_exp_shm_area+0x11c
	.word	0x37db95c8	! t0_data_exp_shm_area+0x120
	.word	0x62514628	! t0_data_exp_shm_area+0x124
	.word	0xebe70278	! t0_data_exp_shm_area+0x128
	.word	0xf4a8b2c1	! t0_data_exp_shm_area+0x12c
	.word	0xa17a03e0	! t0_data_exp_shm_area+0x130
	.word	0xf7603146	! t0_data_exp_shm_area+0x134
	.word	0x6bc670aa	! t0_data_exp_shm_area+0x138
	.word	0xd66a1800	! t0_data_exp_shm_area+0x13c
t0_data_exp_shm_area_end:
t0_data_exp_shm_area_stop:

!    kaos version   4.2
!    thread         1
!    icount         5000
!    targetid       NIAGARA:SIM
!    hostid         NIAGARA:5.8
!    areas          1
!    areasize       64
!    areaoffset     2240
!    ncache         0
!    emulate_ncache 1
!    pagesize       8192
!    invsize        0
!    codecount      5005
!    code           083b0000
!    entry          083b0000
!    fsr_exceptions 00000000
!    fsr_roundmode  00000004
!    fsr_mask       c0000fff
!    seed           d3d4c9dc4872
!    va_map         0000000040400000,000000007fffffff
!    pa_cached      0000000040400000,000000007fffffff
!    pa_noncached   000001ff40000000,000001ff7fffffff
!    weights        /import/n2-aus-localdir1/ntran/n2cdmspp/verif/diag/assembly/kaos/weights_files/allv9_n2.w
!    begcount       0
!    endcount       5000
!    dwords         8
!    ldblocks       0
!    stblocks       0
!    ldfsr_words    0
!    annul          1
!    predict        1
!    iudepend       0
!    bug            65535

#if !defined(KGLOBAL)
#define KGLOBAL(a) .global a
#endif

#if !defined(SYM)
#define SYM(a) /**/a
#endif

#if !defined(KTEXT_MODULE)
#define KTEXT_MODULE(module, va)
#endif

#if !defined(KDATA_MODULE)
#define KDATA_MODULE(module, va)
#endif

KTEXT_MODULE(t1_module_ktbl, 0x483b0000)
.seg "text"
	KGLOBAL(t1_ktbl)
t1_ktbl_page_begin:
.global t1_kref; t1_kref:
	.skip 0
t1_ktbl:
	.word	0xa8dac00c	! t1_kref+0x0:   	smulcc	%o3, %o4, %l4
	.word	0xb9a00156	! t1_kref+0x4:   	fabsd	%f22, %f28
	.word	0xa4bb38e3	! t1_kref+0x8:   	xnorcc	%o4, -0x71d, %l2
	.word	0xe8871040	! t1_kref+0xc:   	lda	[%i4]0x82, %l4
	.word	0xc807bfe4	! t1_kref+0x10:   	ld	[%fp - 0x1c], %g4
	.word	0x39800005	! t1_kref+0x14:   	fbuge,a	_kref+0x28
	.word	0x93b24049	! t1_kref+0x18:   	edge8l	%o1, %o1, %o1
	.word	0xa83ae38b	! t1_kref+0x1c:   	xnor	%o3, 0x38b, %l4
	.word	0xa73b2007	! t1_kref+0x20:   	sra	%o4, 0x7, %l3
	.word	0xd220a004	! t1_kref+0x24:   	st	%o1, [%g2 + 4]
	.word	0xada6085a	! t1_kref+0x28:   	faddd	%f24, %f26, %f22
	.word	0xef6e401a	! t1_kref+0x2c:   	prefetch	%i1 + %i2, 23
	.word	0x86102003	! t1_kref+0x30:   	mov	0x3, %g3
	.word	0x32800000	! t1_kref+0x34:   	bne,a	_kref+0x34
	.word	0x86a0e001	! t1_kref+0x38:   	subcc	%g3, 1, %g3
	.word	0xaa333270	! t1_kref+0x3c:   	orn	%o4, -0xd90, %l5
	.word	0xd04e4000	! t1_kref+0x40:   	ldsb	[%i1], %o0
	.word	0x91400000	! t1_kref+0x44:   	mov	%y, %o0
	.word	0xb9a000dc	! t1_kref+0x48:   	fnegd	%f28, %f28
	.word	0xada508d2	! t1_kref+0x4c:   	fsubd	%f20, %f18, %f22
	.word	0xbdb74e7a	! t1_kref+0x50:   	fxnors	%f29, %f26, %f30
	.word	0xd2280018	! t1_kref+0x54:   	stb	%o1, [%g0 + %i0]
	.word	0xabb78fb6	! t1_kref+0x58:   	fors	%f30, %f22, %f21
	.word	0xe84e8019	! t1_kref+0x5c:   	ldsb	[%i2 + %i1], %l4
	.word	0xb9a018d8	! t1_kref+0x60:   	fdtos	%f24, %f28
	.word	0xafb3004b	! t1_kref+0x64:   	edge8l	%o4, %o3, %l7
	.word	0xf6796b20	! t1_kref+0x68:   	swap	[%g5 + 0xb20], %i3
	.word	0xa3a01893	! t1_kref+0x6c:   	fitos	%f19, %f17
	.word	0xa472400a	! t1_kref+0x70:   	udiv	%o1, %o2, %l2
	.word	0xb1a01931	! t1_kref+0x74:   	fstod	%f17, %f24
	.word	0xafa00031	! t1_kref+0x78:   	fmovs	%f17, %f23
	.word	0x272c054f	! t1_kref+0x7c:   	sethi	%hi(0xb0153c00), %l3
	.word	0xa1a64d35	! t1_kref+0x80:   	fsmuld	%f25, %f21, %f16
	.word	0xd220a024	! t1_kref+0x84:   	st	%o1, [%g2 + 0x24]
	.word	0xa61a4009	! t1_kref+0x88:   	xor	%o1, %o1, %l3
	.word	0xada488b6	! t1_kref+0x8c:   	fsubs	%f18, %f22, %f22
	.word	0xb1a4cd32	! t1_kref+0x90:   	fsmuld	%f19, %f18, %f24
	.word	0x86102004	! t1_kref+0x94:   	mov	0x4, %g3
	.word	0x86a0e001	! t1_kref+0x98:   	subcc	%g3, 1, %g3
	.word	0x22800003	! t1_kref+0x9c:   	be,a	_kref+0xa8
	.word	0xec96d040	! t1_kref+0xa0:   	lduha	[%i3]0x82, %l6
	.word	0xb1b406d4	! t1_kref+0xa4:   	fmul8sux16	%f16, %f20, %f24
	.word	0xad400000	! t1_kref+0xa8:   	mov	%y, %l6
	.word	0xe89e101d	! t1_kref+0xac:   	ldda	[%i0 + %i5]0x80, %l4
	.word	0xa9a000d2	! t1_kref+0xb0:   	fnegd	%f18, %f20
	.word	0xee6e600b	! t1_kref+0xb4:   	ldstub	[%i1 + 0xb], %l7
	.word	0xf7263fe0	! t1_kref+0xb8:   	st	%f27, [%i0 - 0x20]
	.word	0x2f1b3607	! t1_kref+0xbc:   	sethi	%hi(0x6cd81c00), %l7
	.word	0xa522800a	! t1_kref+0xc0:   	mulscc	%o2, %o2, %l2
	.word	0xa63a800c	! t1_kref+0xc4:   	xnor	%o2, %o4, %l3
	.word	0xe6166004	! t1_kref+0xc8:   	lduh	[%i1 + 4], %l3
	.word	0xf326001c	! t1_kref+0xcc:   	st	%f25, [%i0 + %i4]
	.word	0xa7a01897	! t1_kref+0xd0:   	fitos	%f23, %f19
	.word	0xa65ae129	! t1_kref+0xd4:   	smul	%o3, 0x129, %l3
	.word	0xb9a0013b	! t1_kref+0xd8:   	fabss	%f27, %f28
	.word	0xaa7a400a	! t1_kref+0xdc:   	sdiv	%o1, %o2, %l5
	.word	0xada0055a	! t1_kref+0xe0:   	fsqrtd	%f26, %f22
	.word	0xaeba775e	! t1_kref+0xe4:   	xnorcc	%o1, -0x8a2, %l7
	.word	0xb1a6cd33	! t1_kref+0xe8:   	fsmuld	%f27, %f19, %f24
	.word	0x25480007	! t1_kref+0xec:   	fblg,a,pt	%fcc0, _kref+0x108
	.word	0xb5b00f3a	! t1_kref+0xf0:   	fsrc2s	%f26, %f26
	.word	0xd43e6018	! t1_kref+0xf4:   	std	%o2, [%i1 + 0x18]
	.word	0xaeaaf5c3	! t1_kref+0xf8:   	andncc	%o3, -0xa3d, %l7
	.word	0x9fc00004	! t1_kref+0xfc:   	call	%g0 + %g4
	.word	0xe5200019	! t1_kref+0x100:   	st	%f18, [%g0 + %i1]
	.word	0x30480003	! t1_kref+0x104:   	ba,a,pt	%icc, _kref+0x110
	.word	0xa4dac00c	! t1_kref+0x108:   	smulcc	%o3, %o4, %l2
	.word	0xea10a026	! t1_kref+0x10c:   	lduh	[%g2 + 0x26], %l5
	.word	0xada01916	! t1_kref+0x110:   	fitod	%f22, %f22
	.word	0xd236401b	! t1_kref+0x114:   	sth	%o1, [%i1 + %i3]
	.word	0xa9a0013b	! t1_kref+0x118:   	fabss	%f27, %f20
	.word	0xa4b2e3e9	! t1_kref+0x11c:   	orncc	%o3, 0x3e9, %l2
	.word	0xaba509b6	! t1_kref+0x120:   	fdivs	%f20, %f22, %f21
	.word	0x39480002	! t1_kref+0x124:   	fbuge,a,pt	%fcc0, _kref+0x12c
	.word	0xa1a0193b	! t1_kref+0x128:   	fstod	%f27, %f16
	.word	0xaa9a66f0	! t1_kref+0x12c:   	xorcc	%o1, 0x6f0, %l5
	.word	0xa9b00c00	! t1_kref+0x130:   	fzero	%f20
	.word	0xa923339f	! t1_kref+0x134:   	mulscc	%o4, -0xc61, %l4
	.word	0xa522f546	! t1_kref+0x138:   	mulscc	%o3, -0xaba, %l2
	.word	0xad400000	! t1_kref+0x13c:   	mov	%y, %l6
	.word	0xacb3000b	! t1_kref+0x140:   	orncc	%o4, %o3, %l6
	.word	0xbba0189a	! t1_kref+0x144:   	fitos	%f26, %f29
	.word	0xe44e8018	! t1_kref+0x148:   	ldsb	[%i2 + %i0], %l2
	.word	0xe300a02c	! t1_kref+0x14c:   	ld	[%g2 + 0x2c], %f17
	.word	0x81adca33	! t1_kref+0x150:   	fcmps	%fcc0, %f23, %f19
	.word	0x92c2a6bb	! t1_kref+0x154:   	addccc	%o2, 0x6bb, %o1
	.word	0x9fc10000	! t1_kref+0x158:   	call	%g4
	.word	0xaaf2400b	! t1_kref+0x15c:   	udivcc	%o1, %o3, %l5
	.word	0xaba000b3	! t1_kref+0x160:   	fnegs	%f19, %f21
	.word	0xd26e401a	! t1_kref+0x164:   	ldstub	[%i1 + %i2], %o1
	.word	0xaa5276dc	! t1_kref+0x168:   	umul	%o1, -0x924, %l5
	.word	0xac7b0009	! t1_kref+0x16c:   	sdiv	%o4, %o1, %l6
	.word	0xee00a03c	! t1_kref+0x170:   	ld	[%g2 + 0x3c], %l7
	.word	0xb7a0013b	! t1_kref+0x174:   	fabss	%f27, %f27
	.word	0xadb00cf3	! t1_kref+0x178:   	fnot2s	%f19, %f22
	.word	0x87802082	! t1_kref+0x17c:   	mov	0x82, %asi
	.word	0xa9b2810b	! t1_kref+0x180:   	edge32	%o2, %o3, %l4
	.word	0xb1a00554	! t1_kref+0x184:   	fsqrtd	%f20, %f24
	.word	0xd2367ffe	! t1_kref+0x188:   	sth	%o1, [%i1 - 2]
	.word	0xa4730009	! t1_kref+0x18c:   	udiv	%o4, %o1, %l2
	.word	0xfb6e3ff8	! t1_kref+0x190:   	prefetch	%i0 - 8, 29
	.word	0x9132c00c	! t1_kref+0x194:   	srl	%o3, %o4, %o0
	.word	0xabb00f3d	! t1_kref+0x198:   	fsrc2s	%f29, %f21
	.word	0xadb607da	! t1_kref+0x19c:   	pdist	%f24, %f26, %f22
	.word	0xeace9019	! t1_kref+0x1a0:   	ldsba	[%i2 + %i1]0x80, %l5
	.word	0xa8f27cbd	! t1_kref+0x1a4:   	udivcc	%o1, -0x343, %l4
	.word	0xa69a7f1b	! t1_kref+0x1a8:   	xorcc	%o1, -0xe5, %l3
	.word	0xafa6c8bd	! t1_kref+0x1ac:   	fsubs	%f27, %f29, %f23
	.word	0x90a24009	! t1_kref+0x1b0:   	subcc	%o1, %o1, %o0
	.word	0xd830a034	! t1_kref+0x1b4:   	sth	%o4, [%g2 + 0x34]
	.word	0x33800006	! t1_kref+0x1b8:   	fbe,a	_kref+0x1d0
	.word	0xbda01a39	! t1_kref+0x1bc:   	fstoi	%f25, %f30
	.word	0xe9be1889	! t1_kref+0x1c0:   	stda	%f20, [%i0 + %o1]0xc4
	call	SYM(t1_subr0)
	.word	0xa6a337aa	! t1_kref+0x1c8:   	subcc	%o4, -0x856, %l3
	.word	0xd220a02c	! t1_kref+0x1cc:   	st	%o1, [%g2 + 0x2c]
	.word	0xed68a10b	! t1_kref+0x1d0:   	prefetch	%g2 + 0x10b, 22
	.word	0x91b68512	! t1_kref+0x1d4:   	fcmpgt16	%f26, %f18, %o0
	.word	0xa5a0191e	! t1_kref+0x1d8:   	fitod	%f30, %f18
	.word	0xac2a7961	! t1_kref+0x1dc:   	andn	%o1, -0x69f, %l6
	.word	0xafb00c20	! t1_kref+0x1e0:   	fzeros	%f23
	.word	0x90028009	! t1_kref+0x1e4:   	add	%o2, %o1, %o0
	.word	0xbba0003d	! t1_kref+0x1e8:   	fmovs	%f29, %f29
	.word	0xa1a509d2	! t1_kref+0x1ec:   	fdivd	%f20, %f18, %f16
	.word	0xa782a65b	! t1_kref+0x1f0:   	wr	%o2, 0x65b, %gsr
	.word	0xafa608b8	! t1_kref+0x1f4:   	fsubs	%f24, %f24, %f23
	.word	0xaac2a176	! t1_kref+0x1f8:   	addccc	%o2, 0x176, %l5
	.word	0xa5b74f77	! t1_kref+0x1fc:   	fornot1s	%f29, %f23, %f18
	.word	0xd1e65009	! t1_kref+0x200:   	casa	[%i1]0x80, %o1, %o0
	.word	0xb9a0191a	! t1_kref+0x204:   	fitod	%f26, %f28
	.word	0xbda01899	! t1_kref+0x208:   	fitos	%f25, %f30
	.word	0xef00a024	! t1_kref+0x20c:   	ld	[%g2 + 0x24], %f23
	.word	0xacb2800c	! t1_kref+0x210:   	orncc	%o2, %o4, %l6
	.word	0x8143c000	! t1_kref+0x214:   	stbar
	.word	0xed3f4018	! t1_kref+0x218:   	std	%f22, [%i5 + %i0]
	.word	0xd2067fe0	! t1_kref+0x21c:   	ld	[%i1 - 0x20], %o1
	.word	0x86102004	! t1_kref+0x220:   	mov	0x4, %g3
	.word	0x32800000	! t1_kref+0x224:   	bne,a	_kref+0x224
	.word	0x86a0e001	! t1_kref+0x228:   	subcc	%g3, 1, %g3
	.word	0xa93b000a	! t1_kref+0x22c:   	sra	%o4, %o2, %l4
	.word	0xd430a014	! t1_kref+0x230:   	sth	%o2, [%g2 + 0x14]
	.word	0xa6d2400c	! t1_kref+0x234:   	umulcc	%o1, %o4, %l3
	.word	0x9072c00a	! t1_kref+0x238:   	udiv	%o3, %o2, %o0
	.word	0xe46e4000	! t1_kref+0x23c:   	ldstub	[%i1], %l2
	.word	0xa673000c	! t1_kref+0x240:   	udiv	%o4, %o4, %l3
	.word	0xa9a70837	! t1_kref+0x244:   	fadds	%f28, %f23, %f20
	.word	0xada01914	! t1_kref+0x248:   	fitod	%f20, %f22
	.word	0xeb68a08f	! t1_kref+0x24c:   	prefetch	%g2 + 0x8f, 21
	.word	0xbbb60cbd	! t1_kref+0x250:   	fandnot2s	%f24, %f29, %f29
	.word	0xb5b50ad8	! t1_kref+0x254:   	fpsub32	%f20, %f24, %f26
	.word	0xae02e980	! t1_kref+0x258:   	add	%o3, 0x980, %l7
	.word	0xaa02400b	! t1_kref+0x25c:   	add	%o1, %o3, %l5
	.word	0x35800008	! t1_kref+0x260:   	fbue,a	_kref+0x280
	.word	0xada408d4	! t1_kref+0x264:   	fsubd	%f16, %f20, %f22
	.word	0xb5a0191b	! t1_kref+0x268:   	fitod	%f27, %f26
	.word	0xa53ac009	! t1_kref+0x26c:   	sra	%o3, %o1, %l2
	.word	0xf13e4000	! t1_kref+0x270:   	std	%f24, [%i1]
	.word	0xb1a01a54	! t1_kref+0x274:   	fdtoi	%f20, %f24
	.word	0xb3a0013d	! t1_kref+0x278:   	fabss	%f29, %f25
	.word	0x3d480008	! t1_kref+0x27c:   	fbule,a,pt	%fcc0, _kref+0x29c
	.word	0xac9a400c	! t1_kref+0x280:   	xorcc	%o1, %o4, %l6
	call	SYM(t1_subr3)
	.word	0xadb48ddc	! t1_kref+0x288:   	fnand	%f18, %f28, %f22
	.word	0xa9a00032	! t1_kref+0x28c:   	fmovs	%f18, %f20
	.word	0x30480003	! t1_kref+0x290:   	ba,a,pt	%icc, _kref+0x29c
	.word	0xe13e3fe0	! t1_kref+0x294:   	std	%f16, [%i0 - 0x20]
	.word	0xd830a01e	! t1_kref+0x298:   	sth	%o4, [%g2 + 0x1e]
	.word	0xd5e6100a	! t1_kref+0x29c:   	casa	[%i0]0x80, %o2, %o2
	.word	0x29800001	! t1_kref+0x2a0:   	fbl,a	_kref+0x2a4
	.word	0xa5326008	! t1_kref+0x2a4:   	srl	%o1, 0x8, %l2
	.word	0xdaee9018	! t1_kref+0x2a8:   	ldstuba	[%i2 + %i0]0x80, %o5
	.word	0x30480001	! t1_kref+0x2ac:   	ba,a,pt	%icc, _kref+0x2b0
	.word	0xd000a014	! t1_kref+0x2b0:   	ld	[%g2 + 0x14], %o0
	.word	0xb9a01915	! t1_kref+0x2b4:   	fitod	%f21, %f28
	.word	0xe320a004	! t1_kref+0x2b8:   	st	%f17, [%g2 + 4]
	.word	0xa9a00554	! t1_kref+0x2bc:   	fsqrtd	%f20, %f20
	.word	0xa5a01891	! t1_kref+0x2c0:   	fitos	%f17, %f18
	.word	0xafa00537	! t1_kref+0x2c4:   	fsqrts	%f23, %f23
	.word	0x24800004	! t1_kref+0x2c8:   	ble,a	_kref+0x2d8
	.word	0xc368a101	! t1_kref+0x2cc:   	prefetch	%g2 + 0x101, 1
	.word	0x92f27c36	! t1_kref+0x2d0:   	udivcc	%o1, -0x3ca, %o1
	.word	0x2d480007	! t1_kref+0x2d4:   	fbg,a,pt	%fcc0, _kref+0x2f0
	.word	0xb5a6895c	! t1_kref+0x2d8:   	fmuld	%f26, %f28, %f26
	.word	0x29800008	! t1_kref+0x2dc:   	fbl,a	_kref+0x2fc
	.word	0xd420a02c	! t1_kref+0x2e0:   	st	%o2, [%g2 + 0x2c]
	.word	0x81d86da2	! t1_kref+0x2e4:   	flush	%g1 + 0xda2
	.word	0xf51fbd18	! t1_kref+0x2e8:   	ldd	[%fp - 0x2e8], %f26
	.word	0xb9a00552	! t1_kref+0x2ec:   	fsqrtd	%f18, %f28
	.word	0xadb58ad6	! t1_kref+0x2f0:   	fpsub32	%f22, %f22, %f22
	.word	0xd628a036	! t1_kref+0x2f4:   	stb	%o3, [%g2 + 0x36]
	.word	0xa9a01896	! t1_kref+0x2f8:   	fitos	%f22, %f20
	.word	0xe4066018	! t1_kref+0x2fc:   	ld	[%i1 + 0x18], %l2
	.word	0xd228a007	! t1_kref+0x300:   	stb	%o1, [%g2 + 7]
	.word	0x90baac38	! t1_kref+0x304:   	xnorcc	%o2, 0xc38, %o0
	.word	0x91400000	! t1_kref+0x308:   	mov	%y, %o0
	.word	0xd820a01c	! t1_kref+0x30c:   	st	%o4, [%g2 + 0x1c]
	.word	0x92c2b993	! t1_kref+0x310:   	addccc	%o2, -0x66d, %o1
	.word	0xae3a800c	! t1_kref+0x314:   	xnor	%o2, %o4, %l7
	.word	0xa9b68eda	! t1_kref+0x318:   	fornot2	%f26, %f26, %f20
	.word	0xa62b3c6e	! t1_kref+0x31c:   	andn	%o4, -0x392, %l3
	.word	0xa1b50d18	! t1_kref+0x320:   	fandnot1	%f20, %f24, %f16
	.word	0xe51fbce0	! t1_kref+0x324:   	ldd	[%fp - 0x320], %f18
	.word	0xf53e6000	! t1_kref+0x328:   	std	%f26, [%i1]
	.word	0xea4e7ffb	! t1_kref+0x32c:   	ldsb	[%i1 - 5], %l5
	.word	0xa47b000a	! t1_kref+0x330:   	sdiv	%o4, %o2, %l2
	.word	0x9fc10000	! t1_kref+0x334:   	call	%g4
	.word	0xfd20a03c	! t1_kref+0x338:   	st	%f30, [%g2 + 0x3c]
	.word	0xa9400000	! t1_kref+0x33c:   	mov	%y, %l4
	.word	0xae324009	! t1_kref+0x340:   	orn	%o1, %o1, %l7
	.word	0xb1a0191b	! t1_kref+0x344:   	fitod	%f27, %f24
	.word	0xb9a709da	! t1_kref+0x348:   	fdivd	%f28, %f26, %f28
	.word	0xa1b70d14	! t1_kref+0x34c:   	fandnot1	%f28, %f20, %f16
	.word	0xada709d4	! t1_kref+0x350:   	fdivd	%f28, %f20, %f22
	.word	0x81ac8ad6	! t1_kref+0x354:   	fcmped	%fcc0, %f18, %f22
	.word	0xaa030009	! t1_kref+0x358:   	add	%o4, %o1, %l5
	.word	0x3d800007	! t1_kref+0x35c:   	fbule,a	_kref+0x378
	.word	0xb5a68935	! t1_kref+0x360:   	fmuls	%f26, %f21, %f26
	.word	0xbda0191c	! t1_kref+0x364:   	fitod	%f28, %f30
	.word	0x81ad8a5c	! t1_kref+0x368:   	fcmpd	%fcc0, %f22, %f28
	.word	0xf120a034	! t1_kref+0x36c:   	st	%f24, [%g2 + 0x34]
	.word	0xa1a6095e	! t1_kref+0x370:   	fmuld	%f24, %f30, %f16
	.word	0xaba00032	! t1_kref+0x374:   	fmovs	%f18, %f21
	.word	0xe640a034	! t1_kref+0x378:   	ldsw	[%g2 + 0x34], %l3
	.word	0x273b92ad	! t1_kref+0x37c:   	sethi	%hi(0xee4ab400), %l3
	.word	0xd4ae9019	! t1_kref+0x380:   	stba	%o2, [%i2 + %i1]0x80
	.word	0xa9400000	! t1_kref+0x384:   	mov	%y, %l4
	.word	0xae5ac009	! t1_kref+0x388:   	smul	%o3, %o1, %l7
	.word	0xadb00c00	! t1_kref+0x38c:   	fzero	%f22
	.word	0xa7a0003e	! t1_kref+0x390:   	fmovs	%f30, %f19
	.word	0xb9a58854	! t1_kref+0x394:   	faddd	%f22, %f20, %f28
	.word	0x81ac8ab6	! t1_kref+0x398:   	fcmpes	%fcc0, %f18, %f22
	.word	0xa8f28009	! t1_kref+0x39c:   	udivcc	%o2, %o1, %l4
	.word	0xa5a018de	! t1_kref+0x3a0:   	fdtos	%f30, %f18
	.word	0x91b28109	! t1_kref+0x3a4:   	edge32	%o2, %o1, %o0
	.word	0xa53a400c	! t1_kref+0x3a8:   	sra	%o1, %o4, %l2
	.word	0xae2b000a	! t1_kref+0x3ac:   	andn	%o4, %o2, %l7
	.word	0xbba689b8	! t1_kref+0x3b0:   	fdivs	%f26, %f24, %f29
	.word	0x913aa00c	! t1_kref+0x3b4:   	sra	%o2, 0xc, %o0
	.word	0xa8d26512	! t1_kref+0x3b8:   	umulcc	%o1, 0x512, %l4
	.word	0xa5b00fc0	! t1_kref+0x3bc:   	fone	%f18
	.word	0xaebae521	! t1_kref+0x3c0:   	xnorcc	%o3, 0x521, %l7
	.word	0xae7a400c	! t1_kref+0x3c4:   	sdiv	%o1, %o4, %l7
	.word	0xd830a00c	! t1_kref+0x3c8:   	sth	%o4, [%g2 + 0xc]
	.word	0xa4628009	! t1_kref+0x3cc:   	subc	%o2, %o1, %l2
	.word	0xc56e3fe8	! t1_kref+0x3d0:   	prefetch	%i0 - 0x18, 2
	call	SYM(t1_subr3)
	.word	0xa6b2e902	! t1_kref+0x3d8:   	orncc	%o3, 0x902, %l3
	.word	0xaebb25c6	! t1_kref+0x3dc:   	xnorcc	%o4, 0x5c6, %l7
	.word	0xafa78838	! t1_kref+0x3e0:   	fadds	%f30, %f24, %f23
	.word	0xd0066000	! t1_kref+0x3e4:   	ld	[%i1], %o0
	.word	0xa60a6617	! t1_kref+0x3e8:   	and	%o1, 0x617, %l3
	.word	0xed20a014	! t1_kref+0x3ec:   	st	%f22, [%g2 + 0x14]
	.word	0xb1a0015a	! t1_kref+0x3f0:   	fabsd	%f26, %f24
	.word	0x39800005	! t1_kref+0x3f4:   	fbuge,a	_kref+0x408
	.word	0xac1b000a	! t1_kref+0x3f8:   	xor	%o4, %o2, %l6
	.word	0xea4e401a	! t1_kref+0x3fc:   	ldsb	[%i1 + %i2], %l5
	.word	0x38480007	! t1_kref+0x400:   	bgu,a,pt	%icc, _kref+0x41c
	.word	0x90f2400a	! t1_kref+0x404:   	udivcc	%o1, %o2, %o0
	.word	0xa5a018da	! t1_kref+0x408:   	fdtos	%f26, %f18
	.word	0xe64e3fec	! t1_kref+0x40c:   	ldsb	[%i0 - 0x14], %l3
	.word	0xa81af664	! t1_kref+0x410:   	xor	%o3, -0x99c, %l4
	.word	0xa8c2400b	! t1_kref+0x414:   	addccc	%o1, %o3, %l4
	.word	0xa7b300ab	! t1_kref+0x418:   	edge16n	%o4, %o3, %l3
	.word	0xa63b2d94	! t1_kref+0x41c:   	xnor	%o4, 0xd94, %l3
	.word	0xada709dc	! t1_kref+0x420:   	fdivd	%f28, %f28, %f22
	.word	0x93b40410	! t1_kref+0x424:   	fcmple16	%f16, %f16, %o1
	.word	0xa5b607d6	! t1_kref+0x428:   	pdist	%f24, %f22, %f18
	.word	0xa9a609dc	! t1_kref+0x42c:   	fdivd	%f24, %f28, %f20
	.word	0xe648a02c	! t1_kref+0x430:   	ldsb	[%g2 + 0x2c], %l3
	.word	0xa8633926	! t1_kref+0x434:   	subc	%o4, -0x6da, %l4
	.word	0x2e800005	! t1_kref+0x438:   	bvs,a	_kref+0x44c
	.word	0xa1a0055c	! t1_kref+0x43c:   	fsqrtd	%f28, %f16
	.word	0xe720a004	! t1_kref+0x440:   	st	%f19, [%g2 + 4]
	.word	0xa5b58979	! t1_kref+0x444:   	fpmerge	%f22, %f25, %f18
	.word	0xae1a800b	! t1_kref+0x448:   	xor	%o2, %o3, %l7
	.word	0xa89b31e2	! t1_kref+0x44c:   	xorcc	%o4, -0xe1e, %l4
	.word	0x92b32002	! t1_kref+0x450:   	orncc	%o4, 2, %o1
	.word	0xacb3000a	! t1_kref+0x454:   	orncc	%o4, %o2, %l6
	.word	0xef68a041	! t1_kref+0x458:   	prefetch	%g2 + 0x41, 23
	.word	0x923a400b	! t1_kref+0x45c:   	xnor	%o1, %o3, %o1
	.word	0xb7a01895	! t1_kref+0x460:   	fitos	%f21, %f27
	.word	0x91b2400c	! t1_kref+0x464:   	edge8	%o1, %o4, %o0
	call	SYM(t1_subr0)
	.word	0xa3a01a31	! t1_kref+0x46c:   	fstoi	%f17, %f17
	.word	0xfd060000	! t1_kref+0x470:   	ld	[%i0], %f30
	.word	0xa4d2c009	! t1_kref+0x474:   	umulcc	%o3, %o1, %l2
	.word	0xec40a03c	! t1_kref+0x478:   	ldsw	[%g2 + 0x3c], %l6
	.word	0xbdb58d9a	! t1_kref+0x47c:   	fxor	%f22, %f26, %f30
	.word	0xaa9b0009	! t1_kref+0x480:   	xorcc	%o4, %o1, %l5
	.word	0xa5a54d34	! t1_kref+0x484:   	fsmuld	%f21, %f20, %f18
	.word	0xeb20a00c	! t1_kref+0x488:   	st	%f21, [%g2 + 0xc]
	.word	0xd628a006	! t1_kref+0x48c:   	stb	%o3, [%g2 + 6]
	.word	0x8143c000	! t1_kref+0x490:   	stbar
	.word	0xe99e1a1c	! t1_kref+0x494:   	ldda	[%i0 + %i4]0xd0, %f20
	.word	0xc807bfe8	! t1_kref+0x498:   	ld	[%fp - 0x18], %g4
	.word	0xa42a400a	! t1_kref+0x49c:   	andn	%o1, %o2, %l2
	.word	0xbdb6cea0	! t1_kref+0x4a0:   	fsrc1s	%f27, %f30
	.word	0xaba018d2	! t1_kref+0x4a4:   	fdtos	%f18, %f21
	.word	0xb9a588dc	! t1_kref+0x4a8:   	fsubd	%f22, %f28, %f28
	.word	0xa5a0191d	! t1_kref+0x4ac:   	fitod	%f29, %f18
	.word	0x907abf94	! t1_kref+0x4b0:   	sdiv	%o2, -0x6c, %o0
	.word	0xc36e2000	! t1_kref+0x4b4:   	prefetch	%i0, 1
	.word	0xb5a488d2	! t1_kref+0x4b8:   	fsubd	%f18, %f18, %f26
	.word	0xa9a58d33	! t1_kref+0x4bc:   	fsmuld	%f22, %f19, %f20
	.word	0xb9b70c90	! t1_kref+0x4c0:   	fandnot2	%f28, %f16, %f28
	.word	0xa8d2c009	! t1_kref+0x4c4:   	umulcc	%o3, %o1, %l4
	.word	0x39800007	! t1_kref+0x4c8:   	fbuge,a	_kref+0x4e4
	.word	0x929aa26f	! t1_kref+0x4cc:   	xorcc	%o2, 0x26f, %o1
	.word	0xe648a03c	! t1_kref+0x4d0:   	ldsb	[%g2 + 0x3c], %l3
	.word	0xa7b5ca74	! t1_kref+0x4d4:   	fpadd32s	%f23, %f20, %f19
	.word	0x9fc00004	! t1_kref+0x4d8:   	call	%g0 + %g4
	.word	0xc768a082	! t1_kref+0x4dc:   	prefetch	%g2 + 0x82, 3
	.word	0xadb606ba	! t1_kref+0x4e0:   	fmul8x16al	%f24, %f26, %f22
	.word	0xe168a108	! t1_kref+0x4e4:   	prefetch	%g2 + 0x108, 16
	.word	0xa882edaa	! t1_kref+0x4e8:   	addcc	%o3, 0xdaa, %l4
	.word	0x24480007	! t1_kref+0x4ec:   	ble,a,pt	%icc, _kref+0x508
	.word	0xb5a689d6	! t1_kref+0x4f0:   	fdivd	%f26, %f22, %f26
	.word	0xa882800b	! t1_kref+0x4f4:   	addcc	%o2, %o3, %l4
	.word	0xb3a00533	! t1_kref+0x4f8:   	fsqrts	%f19, %f25
	.word	0x22480008	! t1_kref+0x4fc:   	be,a,pt	%icc, _kref+0x51c
	.word	0xa9b505d6	! t1_kref+0x500:   	fcmpeq32	%f20, %f22, %l4
	.word	0xd628a00e	! t1_kref+0x504:   	stb	%o3, [%g2 + 0xe]
	.word	0x93400000	! t1_kref+0x508:   	mov	%y, %o1
	.word	0xa80aa1ab	! t1_kref+0x50c:   	and	%o2, 0x1ab, %l4
	.word	0xa9a00054	! t1_kref+0x510:   	fmovd	%f20, %f20
	.word	0xa8033a8e	! t1_kref+0x514:   	add	%o4, -0x572, %l4
	.word	0xa5b2406b	! t1_kref+0x518:   	edge8ln	%o1, %o3, %l2
	.word	0x8143e040	! t1_kref+0x51c:   	membar	0x40
	.word	0x8143c000	! t1_kref+0x520:   	stbar
	.word	0xc368a00b	! t1_kref+0x524:   	prefetch	%g2 + 0xb, 1
	.word	0xf1bf1a18	! t1_kref+0x528:   	stda	%f24, [%i4 + %i0]0xd0
	.word	0x8143e054	! t1_kref+0x52c:   	membar	0x54
	.word	0xb9b48adc	! t1_kref+0x530:   	fpsub32	%f18, %f28, %f28
	.word	0xadb70c58	! t1_kref+0x534:   	fnor	%f28, %f24, %f22
	.word	0xb9a00556	! t1_kref+0x538:   	fsqrtd	%f22, %f28
	call	SYM(t1_subr1)
	.word	0xb1b60d40	! t1_kref+0x540:   	fnot1	%f24, %f24
	.word	0x933ac00c	! t1_kref+0x544:   	sra	%o3, %o4, %o1
	.word	0x9fc00004	! t1_kref+0x548:   	call	%g0 + %g4
	.word	0xac9abdf2	! t1_kref+0x54c:   	xorcc	%o2, -0x20e, %l6
	.word	0x90028009	! t1_kref+0x550:   	add	%o2, %o1, %o0
	.word	0xaa9abdbb	! t1_kref+0x554:   	xorcc	%o2, -0x245, %l5
	.word	0xaa2b3a6e	! t1_kref+0x558:   	andn	%o4, -0x592, %l5
	.word	0xeb6e3ff0	! t1_kref+0x55c:   	prefetch	%i0 - 0x10, 21
	.word	0xe5a61000	! t1_kref+0x560:   	sta	%f18, [%i0]0x80
	.word	0x83c07bd4	! t1_kref+0x564:   	jmpl	%g1 - 0x42c, %g1
	.word	0xf1bf1a18	! t1_kref+0x568:   	stda	%f24, [%i4 + %i0]0xd0
	.word	0xd836c018	! t1_kref+0x56c:   	sth	%o4, [%i3 + %i0]
	.word	0xd04e6009	! t1_kref+0x570:   	ldsb	[%i1 + 9], %o0
	.word	0xd03e401d	! t1_kref+0x574:   	std	%o0, [%i1 + %i5]
	.word	0x28480001	! t1_kref+0x578:   	bleu,a,pt	%icc, _kref+0x57c
	.word	0xbda589be	! t1_kref+0x57c:   	fdivs	%f22, %f30, %f30
	.word	0xf19eda19	! t1_kref+0x580:   	ldda	[%i3 + %i1]0xd0, %f24
	.word	0x86102005	! t1_kref+0x584:   	mov	0x5, %g3
	.word	0x86a0e001	! t1_kref+0x588:   	subcc	%g3, 1, %g3
	.word	0x2280000d	! t1_kref+0x58c:   	be,a	_kref+0x5c0
	.word	0xb5b58db5	! t1_kref+0x590:   	fxors	%f22, %f21, %f26
	.word	0xa5b24280	! t1_kref+0x594:   	array32	%o1, %g0, %l2
	.word	0xe1ee101d	! t1_kref+0x598:   	prefetcha	%i0 + %i5, 16
	.word	0xe51fbf88	! t1_kref+0x59c:   	ldd	[%fp - 0x78], %f18
	.word	0xe9ee101c	! t1_kref+0x5a0:   	prefetcha	%i0 + %i4, 20
	.word	0x909af367	! t1_kref+0x5a4:   	xorcc	%o3, -0xc99, %o0
	.word	0xea503f78	! t1_kref+0x5a8:   	ldsh	[%g0 - 0x88], %l5
	.word	0xa765000b	! t1_kref+0x5ac:   	movleu	%icc, %o3, %l3
	.word	0x81adcab9	! t1_kref+0x5b0:   	fcmpes	%fcc0, %f23, %f25
	.word	0x92ab000c	! t1_kref+0x5b4:   	andncc	%o4, %o4, %o1
	.word	0x81dff5a0	! t1_kref+0x5b8:   	flush	%i7 - 0xa60
	.word	0xc368a103	! t1_kref+0x5bc:   	prefetch	%g2 + 0x103, 1
	.word	0xb7b00fe0	! t1_kref+0x5c0:   	fones	%f27
	.word	0x929a794f	! t1_kref+0x5c4:   	xorcc	%o1, -0x6b1, %o1
	.word	0xa5a01112	! t1_kref+0x5c8:   	fxtod	%f18, %f18
	.word	0xd228a017	! t1_kref+0x5cc:   	stb	%o1, [%g2 + 0x17]
	.word	0xae0afac3	! t1_kref+0x5d0:   	and	%o3, -0x53d, %l7
	.word	0xaba0189c	! t1_kref+0x5d4:   	fitos	%f28, %f21
	.word	0xef060000	! t1_kref+0x5d8:   	ld	[%i0], %f23
	.word	0xf007bfe0	! t1_kref+0x5dc:   	ld	[%fp - 0x20], %i0
	.word	0xa7400000	! t1_kref+0x5e0:   	mov	%y, %l3
	.word	0xafa4c936	! t1_kref+0x5e4:   	fmuls	%f19, %f22, %f23
	.word	0xbda00132	! t1_kref+0x5e8:   	fabss	%f18, %f30
	.word	0xa81b3998	! t1_kref+0x5ec:   	xor	%o4, -0x668, %l4
	.word	0x90d2f379	! t1_kref+0x5f0:   	umulcc	%o3, -0xc87, %o0
	.word	0xd620a004	! t1_kref+0x5f4:   	st	%o3, [%g2 + 4]
	.word	0xfba65000	! t1_kref+0x5f8:   	sta	%f29, [%i1]0x80
	.word	0xfd20a02c	! t1_kref+0x5fc:   	st	%f30, [%g2 + 0x2c]
	.word	0xa5a70856	! t1_kref+0x600:   	faddd	%f28, %f22, %f18
	.word	0xe850a00e	! t1_kref+0x604:   	ldsh	[%g2 + 0xe], %l4
	.word	0x81ae8a54	! t1_kref+0x608:   	fcmpd	%fcc0, %f26, %f20
	.word	0xd820a014	! t1_kref+0x60c:   	st	%o4, [%g2 + 0x14]
	.word	0xb5b00cda	! t1_kref+0x610:   	fnot2	%f26, %f26
	.word	0xf207bfe0	! t1_kref+0x614:   	ld	[%fp - 0x20], %i1
	.word	0xb5b68d94	! t1_kref+0x618:   	fxor	%f26, %f20, %f26
	.word	0x9de3bfa0	! t1_kref+0x61c:   	save	%sp, -0x60, %sp
	.word	0x80e6b598	! t1_kref+0x620:   	subccc	%i2, -0xa68, %g0
	.word	0xa5eec01a	! t1_kref+0x624:   	restore	%i3, %i2, %l2
	.word	0x90532ffc	! t1_kref+0x628:   	umul	%o4, 0xffc, %o0
	.word	0x31800007	! t1_kref+0x62c:   	fba,a	_kref+0x648
	.word	0xd430a004	! t1_kref+0x630:   	sth	%o2, [%g2 + 4]
	.word	0xb5a00556	! t1_kref+0x634:   	fsqrtd	%f22, %f26
	.word	0xaeaae748	! t1_kref+0x638:   	andncc	%o3, 0x748, %l7
	.word	0xbda018d8	! t1_kref+0x63c:   	fdtos	%f24, %f30
	.word	0xa9b300ab	! t1_kref+0x640:   	edge16n	%o4, %o3, %l4
	.word	0xa89ae188	! t1_kref+0x644:   	xorcc	%o3, 0x188, %l4
	.word	0xa6b28009	! t1_kref+0x648:   	orncc	%o2, %o1, %l3
	.word	0xacaa800a	! t1_kref+0x64c:   	andncc	%o2, %o2, %l6
	.word	0xe5871058	! t1_kref+0x650:   	lda	[%i4 + %i0]0x82, %f18
	.word	0x86102003	! t1_kref+0x654:   	mov	0x3, %g3
	.word	0x32800000	! t1_kref+0x658:   	bne,a	_kref+0x658
	.word	0x86a0e001	! t1_kref+0x65c:   	subcc	%g3, 1, %g3
	.word	0xa7b58598	! t1_kref+0x660:   	fcmpgt32	%f22, %f24, %l3
	.word	0xd2070018	! t1_kref+0x664:   	ld	[%i4 + %i0], %o1
	.word	0xaba708ba	! t1_kref+0x668:   	fsubs	%f28, %f26, %f21
	.word	0xa9a68d32	! t1_kref+0x66c:   	fsmuld	%f26, %f18, %f20
	.word	0xaf22c00c	! t1_kref+0x670:   	mulscc	%o3, %o4, %l7
	.word	0xa60a746a	! t1_kref+0x674:   	and	%o1, -0xb96, %l3
	.word	0xc807bfe4	! t1_kref+0x678:   	ld	[%fp - 0x1c], %g4
	.word	0xacfb000b	! t1_kref+0x67c:   	sdivcc	%o4, %o3, %l6
	.word	0xd236c019	! t1_kref+0x680:   	sth	%o1, [%i3 + %i1]
	.word	0xb1a0003e	! t1_kref+0x684:   	fmovs	%f30, %f24
	.word	0x90db3a18	! t1_kref+0x688:   	smulcc	%o4, -0x5e8, %o0
	.word	0xd03e4000	! t1_kref+0x68c:   	std	%o0, [%i1]
	.word	0xaa1270c7	! t1_kref+0x690:   	or	%o1, -0xf39, %l5
	call	SYM(t1_subr3)
	.word	0xadb7071e	! t1_kref+0x698:   	fmuld8sux16	%f28, %f30, %f22
	.word	0xb9a7493b	! t1_kref+0x69c:   	fmuls	%f29, %f27, %f28
	.word	0xaf400000	! t1_kref+0x6a0:   	mov	%y, %l7
	.word	0x9323000c	! t1_kref+0x6a4:   	mulscc	%o4, %o4, %o1
	.word	0xa89328be	! t1_kref+0x6a8:   	orcc	%o4, 0x8be, %l4
	.word	0xf13e401d	! t1_kref+0x6ac:   	std	%f24, [%i1 + %i5]
	.word	0xa3a00135	! t1_kref+0x6b0:   	fabss	%f21, %f17
!	.word	0x2385be52	! t1_kref+0x6b4:   	fbne,a	SYM(t1_subr1)
	   	fbne,a	SYM(t1_subr1)
	.word	0x9e006150	! t1_kref+0x6b8:   	add	%g1, 0x150, %o7
	.word	0xf9262008	! t1_kref+0x6bc:   	st	%f28, [%i0 + 8]
	.word	0xb1b70cb8	! t1_kref+0x6c0:   	fandnot2s	%f28, %f24, %f24
	.word	0xa4db000a	! t1_kref+0x6c4:   	smulcc	%o4, %o2, %l2
	.word	0xfb00a014	! t1_kref+0x6c8:   	ld	[%g2 + 0x14], %f29
	.word	0x92f2400a	! t1_kref+0x6cc:   	udivcc	%o1, %o2, %o1
	.word	0xaa124009	! t1_kref+0x6d0:   	or	%o1, %o1, %l5
	.word	0xd82e3ffe	! t1_kref+0x6d4:   	stb	%o4, [%i0 - 2]
	.word	0xb1a01916	! t1_kref+0x6d8:   	fitod	%f22, %f24
	.word	0xe648a03c	! t1_kref+0x6dc:   	ldsb	[%g2 + 0x3c], %l3
	.word	0xa5a01911	! t1_kref+0x6e0:   	fitod	%f17, %f18
	.word	0xd42e401a	! t1_kref+0x6e4:   	stb	%o2, [%i1 + %i2]
	.word	0xa5b2810a	! t1_kref+0x6e8:   	edge32	%o2, %o2, %l2
	.word	0xd228a00c	! t1_kref+0x6ec:   	stb	%o1, [%g2 + 0xc]
	.word	0xa7828009	! t1_kref+0x6f0:   	wr	%o2, %o1, %gsr
	.word	0x8143e06b	! t1_kref+0x6f4:   	membar	0x6b
	.word	0xae02800a	! t1_kref+0x6f8:   	add	%o2, %o2, %l7
	.word	0xd8363fe4	! t1_kref+0x6fc:   	sth	%o4, [%i0 - 0x1c]
	.word	0x30800002	! t1_kref+0x700:   	ba,a	_kref+0x708
	.word	0xa5a60858	! t1_kref+0x704:   	faddd	%f24, %f24, %f18
	.word	0xb9a588dc	! t1_kref+0x708:   	fsubd	%f22, %f28, %f28
	.word	0xe64e4000	! t1_kref+0x70c:   	ldsb	[%i1], %l3
	.word	0xc568a086	! t1_kref+0x710:   	prefetch	%g2 + 0x86, 2
	.word	0xa8fb000c	! t1_kref+0x714:   	sdivcc	%o4, %o4, %l4
	.word	0x81db7b5a	! t1_kref+0x718:   	flush	%o5 - 0x4a6
	call	SYM(t1_subr1)
	.word	0xadb485d8	! t1_kref+0x720:   	fcmpeq32	%f18, %f24, %l6
	.word	0x20480005	! t1_kref+0x724:   	bn,a,pt	%icc, _kref+0x738
	.word	0xadb68ddc	! t1_kref+0x728:   	fnand	%f26, %f28, %f22
	.word	0x927b219b	! t1_kref+0x72c:   	sdiv	%o4, 0x19b, %o1
	.word	0xe7f65009	! t1_kref+0x730:   	casxa	[%i1]0x80, %o1, %l3
	.word	0xa1a58d32	! t1_kref+0x734:   	fsmuld	%f22, %f18, %f16
	.word	0x36480008	! t1_kref+0x738:   	bge,a,pt	%icc, _kref+0x758
	.word	0xec4e8019	! t1_kref+0x73c:   	ldsb	[%i2 + %i1], %l6
	.word	0xafb58ab9	! t1_kref+0x740:   	fpsub16s	%f22, %f25, %f23
	.word	0xa5a01934	! t1_kref+0x744:   	fstod	%f20, %f18
	.word	0xadb50492	! t1_kref+0x748:   	fcmple32	%f20, %f18, %l6
	.word	0xa7b3016b	! t1_kref+0x74c:   	edge32ln	%o4, %o3, %l3
	.word	0xd43e6010	! t1_kref+0x750:   	std	%o2, [%i1 + 0x10]
	.word	0xafa01891	! t1_kref+0x754:   	fitos	%f17, %f23
	.word	0xd019401d	! t1_kref+0x758:   	ldd	[%g5 + %i5], %o0
	.word	0xb3a00033	! t1_kref+0x75c:   	fmovs	%f19, %f25
	.word	0x9232800c	! t1_kref+0x760:   	orn	%o2, %o4, %o1
	.word	0xe36e3fe8	! t1_kref+0x764:   	prefetch	%i0 - 0x18, 17
	.word	0x81af8ada	! t1_kref+0x768:   	fcmped	%fcc0, %f30, %f26
	.word	0xe700a03c	! t1_kref+0x76c:   	ld	[%g2 + 0x3c], %f19
	.word	0xaa7af286	! t1_kref+0x770:   	sdiv	%o3, -0xd7a, %l5
	.word	0xa7b28200	! t1_kref+0x774:   	array8	%o2, %g0, %l3
	.word	0x3b480002	! t1_kref+0x778:   	fble,a,pt	%fcc0, _kref+0x780
	.word	0xa5a50d37	! t1_kref+0x77c:   	fsmuld	%f20, %f23, %f18
	.word	0xef20a02c	! t1_kref+0x780:   	st	%f23, [%g2 + 0x2c]
	.word	0xa82b000a	! t1_kref+0x784:   	andn	%o4, %o2, %l4
	.word	0x93b585d2	! t1_kref+0x788:   	fcmpeq32	%f22, %f18, %o1
	.word	0xadb58dd8	! t1_kref+0x78c:   	fnand	%f22, %f24, %f22
	.word	0xa9a508d6	! t1_kref+0x790:   	fsubd	%f20, %f22, %f20
	.word	0x913a400c	! t1_kref+0x794:   	sra	%o1, %o4, %o0
	.word	0x36480004	! t1_kref+0x798:   	bge,a,pt	%icc, _kref+0x7a8
	.word	0xbba01893	! t1_kref+0x79c:   	fitos	%f19, %f29
	.word	0xb3a0053d	! t1_kref+0x7a0:   	fsqrts	%f29, %f25
	.word	0xa5b70a90	! t1_kref+0x7a4:   	fpsub16	%f28, %f16, %f18
	.word	0xad2a6017	! t1_kref+0x7a8:   	sll	%o1, 0x17, %l6
	.word	0xaa02b943	! t1_kref+0x7ac:   	add	%o2, -0x6bd, %l5
	.word	0xd81f4018	! t1_kref+0x7b0:   	ldd	[%i5 + %i0], %o4
	.word	0xbda4895e	! t1_kref+0x7b4:   	fmuld	%f18, %f30, %f30
	.word	0x901b2490	! t1_kref+0x7b8:   	xor	%o4, 0x490, %o0
	.word	0xa52ac00a	! t1_kref+0x7bc:   	sll	%o3, %o2, %l2
	.word	0xadb300ac	! t1_kref+0x7c0:   	edge16n	%o4, %o4, %l6
	.word	0xa61b3240	! t1_kref+0x7c4:   	xor	%o4, -0xdc0, %l3
	.word	0x93418000	! t1_kref+0x7c8:   	mov	%fprs, %o1
	.word	0xae7a6137	! t1_kref+0x7cc:   	sdiv	%o1, 0x137, %l7
	.word	0xe3ee501c	! t1_kref+0x7d0:   	prefetcha	%i1 + %i4, 17
	.word	0xe9264000	! t1_kref+0x7d4:   	st	%f20, [%i1]
	.word	0xeb206236	! t1_kref+0x7d8:   	st	%f21, [%g1 + 0x236]
	.word	0xaeaa67de	! t1_kref+0x7dc:   	andncc	%o1, 0x7de, %l7
	.word	0xfb067ff0	! t1_kref+0x7e0:   	ld	[%i1 - 0x10], %f29
	.word	0xa9b70fb3	! t1_kref+0x7e4:   	fors	%f28, %f19, %f20
	.word	0xa7a0003d	! t1_kref+0x7e8:   	fmovs	%f29, %f19
	.word	0xef6e6018	! t1_kref+0x7ec:   	prefetch	%i1 + 0x18, 23
	.word	0x29480005	! t1_kref+0x7f0:   	fbl,a,pt	%fcc0, _kref+0x804
	.word	0xa89329dc	! t1_kref+0x7f4:   	orcc	%o4, 0x9dc, %l4
	.word	0xaf22665f	! t1_kref+0x7f8:   	mulscc	%o1, 0x65f, %l7
	.word	0x93b2c08c	! t1_kref+0x7fc:   	edge16	%o3, %o4, %o1
	.word	0xbba0003a	! t1_kref+0x800:   	fmovs	%f26, %f29
	.word	0xa69a8009	! t1_kref+0x804:   	xorcc	%o2, %o1, %l3
	.word	0xd43e0000	! t1_kref+0x808:   	std	%o2, [%i0]
	.word	0xa82ac00b	! t1_kref+0x80c:   	andn	%o3, %o3, %l4
	.word	0xa5b2832c	! t1_kref+0x810:   	bmask	%o2, %o4, %l2
	.word	0x9de3bfa0	! t1_kref+0x814:   	save	%sp, -0x60, %sp
	.word	0x93eefb5d	! t1_kref+0x818:   	restore	%i3, -0x4a3, %o1
	.word	0xa7b4055e	! t1_kref+0x81c:   	fcmpeq16	%f16, %f30, %l3
	.word	0xe8067ffc	! t1_kref+0x820:   	ld	[%i1 - 4], %l4
	.word	0xaeaa400a	! t1_kref+0x824:   	andncc	%o1, %o2, %l7
	.word	0xec562000	! t1_kref+0x828:   	ldsh	[%i0], %l6
	.word	0xf13e3fe8	! t1_kref+0x82c:   	std	%f24, [%i0 - 0x18]
	.word	0x26800005	! t1_kref+0x830:   	bl,a	_kref+0x844
	.word	0xae0263c9	! t1_kref+0x834:   	add	%o1, 0x3c9, %l7
	.word	0xa4332c80	! t1_kref+0x838:   	orn	%o4, 0xc80, %l2
	.word	0xa8f26458	! t1_kref+0x83c:   	udivcc	%o1, 0x458, %l4
	.word	0xa7400000	! t1_kref+0x840:   	mov	%y, %l3
	.word	0x9fc00004	! t1_kref+0x844:   	call	%g0 + %g4
	.word	0xb9a00131	! t1_kref+0x848:   	fabss	%f17, %f28
	.word	0xf007bfe0	! t1_kref+0x84c:   	ld	[%fp - 0x20], %i0
	.word	0xa9a78852	! t1_kref+0x850:   	faddd	%f30, %f18, %f20
	.word	0xd2ee501a	! t1_kref+0x854:   	ldstuba	[%i1 + %i2]0x80, %o1
	.word	0xa96225be	! t1_kref+0x858:   	mova	%fcc0, -0x242, %l4
	.word	0xa62b3127	! t1_kref+0x85c:   	andn	%o4, -0xed9, %l3
	.word	0x9302ee54	! t1_kref+0x860:   	taddcc	%o3, 0xe54, %o1
	.word	0xa8b2a321	! t1_kref+0x864:   	orncc	%o2, 0x321, %l4
	.word	0xbda00031	! t1_kref+0x868:   	fmovs	%f17, %f30
	.word	0xa4db27de	! t1_kref+0x86c:   	smulcc	%o4, 0x7de, %l2
	.word	0xee4e201d	! t1_kref+0x870:   	ldsb	[%i0 + 0x1d], %l7
	.word	0xd630a014	! t1_kref+0x874:   	sth	%o3, [%g2 + 0x14]
	.word	0xd6e81019	! t1_kref+0x878:   	ldstuba	[%g0 + %i1]0x80, %o3
	.word	0xa8aa712d	! t1_kref+0x87c:   	andncc	%o1, -0xed3, %l4
	.word	0xfbee501b	! t1_kref+0x880:   	prefetcha	%i1 + %i3, 29
	.word	0x8143e040	! t1_kref+0x884:   	membar	0x40
	.word	0xb6102002	! t1_kref+0x888:   	mov	0x2, %i3
	.word	0xad3b200a	! t1_kref+0x88c:   	sra	%o4, 0xa, %l6
	.word	0xc22160ac	! t1_kref+0x890:   	st	%g1, [%g5 + 0xac]
	.word	0xab400000	! t1_kref+0x894:   	mov	%y, %l5
	.word	0xaa3b000a	! t1_kref+0x898:   	xnor	%o4, %o2, %l5
	.word	0xa5a0191d	! t1_kref+0x89c:   	fitod	%f29, %f18
	.word	0xaee2688e	! t1_kref+0x8a0:   	subccc	%o1, 0x88e, %l7
	.word	0xb5a0189a	! t1_kref+0x8a4:   	fitos	%f26, %f26
	.word	0x3b800001	! t1_kref+0x8a8:   	fble,a	_kref+0x8ac
	.word	0xa692fa7d	! t1_kref+0x8ac:   	orcc	%o3, -0x583, %l3
	.word	0xa672b9fc	! t1_kref+0x8b0:   	udiv	%o2, -0x604, %l3
	.word	0xa402ade2	! t1_kref+0x8b4:   	add	%o2, 0xde2, %l2
	.word	0xafa01a37	! t1_kref+0x8b8:   	fstoi	%f23, %f23
	.word	0xabb4855a	! t1_kref+0x8bc:   	fcmpeq16	%f18, %f26, %l5
	.word	0xf926401c	! t1_kref+0x8c0:   	st	%f28, [%i1 + %i4]
	.word	0xd428a00e	! t1_kref+0x8c4:   	stb	%o2, [%g2 + 0xe]
	.word	0xae1a800c	! t1_kref+0x8c8:   	xor	%o2, %o4, %l7
	.word	0xd010a01c	! t1_kref+0x8cc:   	lduh	[%g2 + 0x1c], %o0
	.word	0xb5b70d40	! t1_kref+0x8d0:   	fnot1	%f28, %f26
	.word	0x38800004	! t1_kref+0x8d4:   	bgu,a	_kref+0x8e4
	.word	0xb9b009b3	! t1_kref+0x8d8:   	fexpand	%f19, %f28
	.word	0x90d2a552	! t1_kref+0x8dc:   	umulcc	%o2, 0x552, %o0
	.word	0xee167ffa	! t1_kref+0x8e0:   	lduh	[%i1 - 6], %l7
	.word	0xa672ff6f	! t1_kref+0x8e4:   	udiv	%o3, -0x91, %l3
	.word	0x28480002	! t1_kref+0x8e8:   	bleu,a,pt	%icc, _kref+0x8f0
	.word	0xf9be184b	! t1_kref+0x8ec:   	stda	%f28, [%i0 + %o3]0xc2
	.word	0x9002f54c	! t1_kref+0x8f0:   	add	%o3, -0xab4, %o0
	.word	0xa765000a	! t1_kref+0x8f4:   	movleu	%icc, %o2, %l3
	.word	0x9de3bfa0	! t1_kref+0x8f8:   	save	%sp, -0x60, %sp
	.word	0x91e8001d	! t1_kref+0x8fc:   	restore	%g0, %i5, %o0
	.word	0xae9b30af	! t1_kref+0x900:   	xorcc	%o4, -0xf51, %l7
	.word	0xfd6e001d	! t1_kref+0x904:   	prefetch	%i0 + %i5, 30
	.word	0xd0b81019	! t1_kref+0x908:   	stda	%o0, [%g0 + %i1]0x80
	.word	0xa822e359	! t1_kref+0x90c:   	sub	%o3, 0x359, %l4
	.word	0xe1beda58	! t1_kref+0x910:   	stda	%f16, [%i3 + %i0]0xd2
	.word	0xa1a489d8	! t1_kref+0x914:   	fdivd	%f18, %f24, %f16
	.word	0xee063ff8	! t1_kref+0x918:   	ld	[%i0 - 8], %l7
	.word	0xb5a0055a	! t1_kref+0x91c:   	fsqrtd	%f26, %f26
	.word	0xb9a00036	! t1_kref+0x920:   	fmovs	%f22, %f28
	.word	0x9fc00004	! t1_kref+0x924:   	call	%g0 + %g4
	.word	0x81d866da	! t1_kref+0x928:   	flush	%g1 + 0x6da
	.word	0xd230a02e	! t1_kref+0x92c:   	sth	%o1, [%g2 + 0x2e]
	.word	0x9f414000	! t1_kref+0x930:   	mov	%pc, %o7
!	.word	0x2dbd6daf	! t1_kref+0x934:   	fbg,a	SYM(t1_subr3)
	   	fbg,a	SYM(t1_subr3)
	.word	0xa5a01a3a	! t1_kref+0x938:   	fstoi	%f26, %f18
	.word	0xa5a00550	! t1_kref+0x93c:   	fsqrtd	%f16, %f18
	.word	0xb1a74d34	! t1_kref+0x940:   	fsmuld	%f29, %f20, %f24
	.word	0xc168a105	! t1_kref+0x944:   	prefetch	%g2 + 0x105, 0
	.word	0x26480004	! t1_kref+0x948:   	bl,a,pt	%icc, _kref+0x958
	.word	0xb3a01894	! t1_kref+0x94c:   	fitos	%f20, %f25
	.word	0xaeb2400a	! t1_kref+0x950:   	orncc	%o1, %o2, %l7
	.word	0x33480005	! t1_kref+0x954:   	fbe,a,pt	%fcc0, _kref+0x968
	.word	0xd428a00c	! t1_kref+0x958:   	stb	%o2, [%g2 + 0xc]
	.word	0xa5a60936	! t1_kref+0x95c:   	fmuls	%f24, %f22, %f18
	.word	0xb9a01894	! t1_kref+0x960:   	fitos	%f20, %f28
	.word	0xa8c33c8c	! t1_kref+0x964:   	addccc	%o4, -0x374, %l4
	.word	0x902aff7d	! t1_kref+0x968:   	andn	%o3, -0x83, %o0
	.word	0x9de3bfa0	! t1_kref+0x96c:   	save	%sp, -0x60, %sp
	.word	0xadeee4e7	! t1_kref+0x970:   	restore	%i3, 0x4e7, %l6
	.word	0x2d22d6fb	! t1_kref+0x974:   	sethi	%hi(0x8b5bec00), %l6
	.word	0xaa92800c	! t1_kref+0x978:   	orcc	%o2, %o4, %l5
	.word	0xa782e0aa	! t1_kref+0x97c:   	wr	%o3, 0xaa, %gsr
	.word	0x20800003	! t1_kref+0x980:   	bn,a	_kref+0x98c
	.word	0xa7b007b8	! t1_kref+0x984:   	fpackfix	%f24, %f19
	.word	0x3a480004	! t1_kref+0x988:   	bcc,a,pt	%icc, _kref+0x998
	.word	0xe4000019	! t1_kref+0x98c:   	ld	[%g0 + %i1], %l2
	.word	0xf1062010	! t1_kref+0x990:   	ld	[%i0 + 0x10], %f24
	.word	0xd49f5058	! t1_kref+0x994:   	ldda	[%i5 + %i0]0x82, %o2
	.word	0xa8a3335e	! t1_kref+0x998:   	subcc	%o4, -0xca2, %l4
	.word	0xd01e6000	! t1_kref+0x99c:   	ldd	[%i1], %o0
	call	SYM(t1_subr0)
	.word	0xbda0053a	! t1_kref+0x9a4:   	fsqrts	%f26, %f30
	.word	0xed380019	! t1_kref+0x9a8:   	std	%f22, [%g0 + %i1]
	.word	0xa7418000	! t1_kref+0x9ac:   	mov	%fprs, %l3
	.word	0x39800007	! t1_kref+0x9b0:   	fbuge,a	_kref+0x9cc
	.word	0xa7b28240	! t1_kref+0x9b4:   	array16	%o2, %g0, %l3
	.word	0xaaaa71f9	! t1_kref+0x9b8:   	andncc	%o1, -0xe07, %l5
	.word	0xaf63222e	! t1_kref+0x9bc:   	movuge	%fcc0, 0x22e, %l7
	.word	0xac02800b	! t1_kref+0x9c0:   	add	%o2, %o3, %l6
	.word	0xec1e001d	! t1_kref+0x9c4:   	ldd	[%i0 + %i5], %l6
	.word	0xae3a4009	! t1_kref+0x9c8:   	xnor	%o1, %o1, %l7
	.word	0xe3063ff0	! t1_kref+0x9cc:   	ld	[%i0 - 0x10], %f17
	.word	0xa4fb000c	! t1_kref+0x9d0:   	sdivcc	%o4, %o4, %l2
	.word	0xa5a6cd3b	! t1_kref+0x9d4:   	fsmuld	%f27, %f27, %f18
	.word	0xb5a689da	! t1_kref+0x9d8:   	fdivd	%f26, %f26, %f26
	.word	0xb5a01118	! t1_kref+0x9dc:   	fxtod	%f24, %f26
	.word	0xb1a0053d	! t1_kref+0x9e0:   	fsqrts	%f29, %f24
	.word	0xb8103fe4	! t1_kref+0x9e4:   	mov	0xffffffe4, %i4
	.word	0xa7b70490	! t1_kref+0x9e8:   	fcmple32	%f28, %f16, %l3
	.word	0xf9263fe0	! t1_kref+0x9ec:   	st	%f28, [%i0 - 0x20]
	.word	0xf13e6008	! t1_kref+0x9f0:   	std	%f24, [%i1 + 8]
	.word	0xa1b60f90	! t1_kref+0x9f4:   	for	%f24, %f16, %f16
	.word	0xb5a0191d	! t1_kref+0x9f8:   	fitod	%f29, %f26
	call	SYM(t1_subr1)
	.word	0xaa2a6b80	! t1_kref+0xa00:   	andn	%o1, 0xb80, %l5
	.word	0x38480004	! t1_kref+0xa04:   	bgu,a,pt	%icc, _kref+0xa14
	.word	0xd4362018	! t1_kref+0xa08:   	sth	%o2, [%i0 + 0x18]
	.word	0x81da7dee	! t1_kref+0xa0c:   	flush	%o1 - 0x212
	.word	0xb9b68a78	! t1_kref+0xa10:   	fpadd32s	%f26, %f24, %f28
	.word	0xa4b2c009	! t1_kref+0xa14:   	orncc	%o3, %o1, %l2
	.word	0xab3ac00b	! t1_kref+0xa18:   	sra	%o3, %o3, %l5
	.word	0xd0167fea	! t1_kref+0xa1c:   	lduh	[%i1 - 0x16], %o0
	.word	0xa9a5c9bd	! t1_kref+0xa20:   	fdivs	%f23, %f29, %f20
	.word	0xaa9a4009	! t1_kref+0xa24:   	xorcc	%o1, %o1, %l5
	.word	0xac3b000b	! t1_kref+0xa28:   	xnor	%o4, %o3, %l6
	.word	0xf93e3ff0	! t1_kref+0xa2c:   	std	%f28, [%i0 - 0x10]
	.word	0x92b2b0e3	! t1_kref+0xa30:   	orncc	%o2, -0xf1d, %o1
	.word	0xb7a00536	! t1_kref+0xa34:   	fsqrts	%f22, %f27
	.word	0xada00058	! t1_kref+0xa38:   	fmovd	%f24, %f22
	.word	0xb9a0055e	! t1_kref+0xa3c:   	fsqrtd	%f30, %f28
	.word	0xd42e8019	! t1_kref+0xa40:   	stb	%o2, [%i2 + %i1]
	.word	0xc768a04a	! t1_kref+0xa44:   	prefetch	%g2 + 0x4a, 3
	.word	0xb3a689bc	! t1_kref+0xa48:   	fdivs	%f26, %f28, %f25
	.word	0xe64e7fe0	! t1_kref+0xa4c:   	ldsb	[%i1 - 0x20], %l3
	.word	0xadb2416c	! t1_kref+0xa50:   	edge32ln	%o1, %o4, %l6
	.word	0xd81e2008	! t1_kref+0xa54:   	ldd	[%i0 + 8], %o4
	.word	0x91b30240	! t1_kref+0xa58:   	array16	%o4, %g0, %o0
	.word	0x2b800008	! t1_kref+0xa5c:   	fbug,a	_kref+0xa7c
	.word	0xa9a00039	! t1_kref+0xa60:   	fmovs	%f25, %f20
	.word	0xd630a024	! t1_kref+0xa64:   	sth	%o3, [%g2 + 0x24]
	.word	0x909b000a	! t1_kref+0xa68:   	xorcc	%o4, %o2, %o0
	.word	0xac02400b	! t1_kref+0xa6c:   	add	%o1, %o3, %l6
	.word	0xa9a0055a	! t1_kref+0xa70:   	fsqrtd	%f26, %f20
	.word	0xd220a014	! t1_kref+0xa74:   	st	%o1, [%g2 + 0x14]
	.word	0xb9a4c8b5	! t1_kref+0xa78:   	fsubs	%f19, %f21, %f28
	.word	0xada0111c	! t1_kref+0xa7c:   	fxtod	%f28, %f22
	.word	0xe53e6008	! t1_kref+0xa80:   	std	%f18, [%i1 + 8]
	.word	0xf201401c	! t1_kref+0xa84:   	ld	[%g5 + %i4], %i1
	.word	0x9de3bfa0	! t1_kref+0xa88:   	save	%sp, -0x60, %sp
	.word	0x93ee001c	! t1_kref+0xa8c:   	restore	%i0, %i4, %o1
	.word	0xd04e8019	! t1_kref+0xa90:   	ldsb	[%i2 + %i1], %o0
	.word	0xa9a00556	! t1_kref+0xa94:   	fsqrtd	%f22, %f20
	.word	0xbdb58f76	! t1_kref+0xa98:   	fornot1s	%f22, %f22, %f30
	.word	0xf5067ffc	! t1_kref+0xa9c:   	ld	[%i1 - 4], %f26
	.word	0x92f2682d	! t1_kref+0xaa0:   	udivcc	%o1, 0x82d, %o1
	.word	0xb1b58f58	! t1_kref+0xaa4:   	fornot1	%f22, %f24, %f24
	.word	0xa1a6095a	! t1_kref+0xaa8:   	fmuld	%f24, %f26, %f16
	.word	0xa9b58f58	! t1_kref+0xaac:   	fornot1	%f22, %f24, %f20
	.word	0x39480003	! t1_kref+0xab0:   	fbuge,a,pt	%fcc0, _kref+0xabc
	.word	0xbda00550	! t1_kref+0xab4:   	fsqrtd	%f16, %f30
	.word	0x3d800003	! t1_kref+0xab8:   	fbule,a	_kref+0xac4
	.word	0xc807bfe8	! t1_kref+0xabc:   	ld	[%fp - 0x18], %g4
	.word	0xa1a408d0	! t1_kref+0xac0:   	fsubd	%f16, %f16, %f16
	.word	0xb5b009b9	! t1_kref+0xac4:   	fexpand	%f25, %f26
	.word	0xaf22400a	! t1_kref+0xac8:   	mulscc	%o1, %o2, %l7
	.word	0xbba508b7	! t1_kref+0xacc:   	fsubs	%f20, %f23, %f29
	.word	0xb5a00556	! t1_kref+0xad0:   	fsqrtd	%f22, %f26
	.word	0xee4e3fef	! t1_kref+0xad4:   	ldsb	[%i0 - 0x11], %l7
	.word	0xecd01018	! t1_kref+0xad8:   	ldsha	[%g0 + %i0]0x80, %l6
	.word	0xafb2c06c	! t1_kref+0xadc:   	edge8ln	%o3, %o4, %l7
	.word	0xee4e001a	! t1_kref+0xae0:   	ldsb	[%i0 + %i2], %l7
	.word	0x20480006	! t1_kref+0xae4:   	bn,a,pt	%icc, _kref+0xafc
	.word	0xa6aac009	! t1_kref+0xae8:   	andncc	%o3, %o1, %l3
	.word	0x922a400c	! t1_kref+0xaec:   	andn	%o1, %o4, %o1
	.word	0x9212a9aa	! t1_kref+0xaf0:   	or	%o2, 0x9aa, %o1
	.word	0xc3ee5009	! t1_kref+0xaf4:   	prefetcha	%i1 + %o1, 1
	.word	0xa9a68850	! t1_kref+0xaf8:   	faddd	%f26, %f16, %f20
	.word	0xd628a00c	! t1_kref+0xafc:   	stb	%o3, [%g2 + 0xc]
	.word	0xa53aa01b	! t1_kref+0xb00:   	sra	%o2, 0x1b, %l2
	.word	0xabb30349	! t1_kref+0xb04:   	alignaddrl	%o4, %o1, %l5
	.word	0xae1af4b2	! t1_kref+0xb08:   	xor	%o3, -0xb4e, %l7
	.word	0xf59f5019	! t1_kref+0xb0c:   	ldda	[%i5 + %i1]0x80, %f26
	.word	0x3c480008	! t1_kref+0xb10:   	bpos,a,pt	%icc, _kref+0xb30
	.word	0xa632b688	! t1_kref+0xb14:   	orn	%o2, -0x978, %l3
	.word	0xa7b2810c	! t1_kref+0xb18:   	edge32	%o2, %o4, %l3
	.word	0x90933dd6	! t1_kref+0xb1c:   	orcc	%o4, -0x22a, %o0
	.word	0x922a8009	! t1_kref+0xb20:   	andn	%o2, %o1, %o1
	.word	0xf56e401c	! t1_kref+0xb24:   	prefetch	%i1 + %i4, 26
	.word	0xa4033b25	! t1_kref+0xb28:   	add	%o4, -0x4db, %l2
	.word	0xf9264000	! t1_kref+0xb2c:   	st	%f28, [%i1]
	.word	0xd0163fec	! t1_kref+0xb30:   	lduh	[%i0 - 0x14], %o0
	.word	0xaa732efd	! t1_kref+0xb34:   	udiv	%o4, 0xefd, %l5
	.word	0x92b2800c	! t1_kref+0xb38:   	orncc	%o2, %o4, %o1
	.word	0x81de38ae	! t1_kref+0xb3c:   	flush	%i0 - 0x752
	.word	0xe640a034	! t1_kref+0xb40:   	ldsw	[%g2 + 0x34], %l3
	.word	0xada01a5c	! t1_kref+0xb44:   	fdtoi	%f28, %f22
	.word	0xa7b4051a	! t1_kref+0xb48:   	fcmpgt16	%f16, %f26, %l3
	.word	0xee48a03d	! t1_kref+0xb4c:   	ldsb	[%g2 + 0x3d], %l7
	.word	0x9fc00004	! t1_kref+0xb50:   	call	%g0 + %g4
	.word	0xd428a024	! t1_kref+0xb54:   	stb	%o2, [%g2 + 0x24]
	.word	0xa5b007b8	! t1_kref+0xb58:   	fpackfix	%f24, %f18
	.word	0xaaf33c53	! t1_kref+0xb5c:   	udivcc	%o4, -0x3ad, %l5
	.word	0xa5a749be	! t1_kref+0xb60:   	fdivs	%f29, %f30, %f18
	.word	0xd630a014	! t1_kref+0xb64:   	sth	%o3, [%g2 + 0x14]
	.word	0xd430a014	! t1_kref+0xb68:   	sth	%o2, [%g2 + 0x14]
	.word	0xb5b64cb4	! t1_kref+0xb6c:   	fandnot2s	%f25, %f20, %f26
	.word	0x90724009	! t1_kref+0xb70:   	udiv	%o1, %o1, %o0
	.word	0x9de3bfa0	! t1_kref+0xb74:   	save	%sp, -0x60, %sp
	.word	0xa7ef243e	! t1_kref+0xb78:   	restore	%i4, 0x43e, %l3
	.word	0xed1fbe98	! t1_kref+0xb7c:   	ldd	[%fp - 0x168], %f22
	.word	0x8143e040	! t1_kref+0xb80:   	membar	0x40
	.word	0xb5b00f3e	! t1_kref+0xb84:   	fsrc2s	%f30, %f26
	.word	0xac0af7ed	! t1_kref+0xb88:   	and	%o3, -0x813, %l6
	.word	0xd2e81019	! t1_kref+0xb8c:   	ldstuba	[%g0 + %i1]0x80, %o1
	.word	0xa85b215f	! t1_kref+0xb90:   	smul	%o4, 0x15f, %l4
	.word	0xa70ac00b	! t1_kref+0xb94:   	tsubcc	%o3, %o3, %l3
	.word	0xa4f2c009	! t1_kref+0xb98:   	udivcc	%o3, %o1, %l2
	.word	0x9133000c	! t1_kref+0xb9c:   	srl	%o4, %o4, %o0
	.word	0xe5262014	! t1_kref+0xba0:   	st	%f18, [%i0 + 0x14]
	.word	0xa1b48f9c	! t1_kref+0xba4:   	for	%f18, %f28, %f16
	.word	0x8143c000	! t1_kref+0xba8:   	stbar
	.word	0xfd00a014	! t1_kref+0xbac:   	ld	[%g2 + 0x14], %f30
	.word	0xe4d6d018	! t1_kref+0xbb0:   	ldsha	[%i3 + %i0]0x80, %l2
	.word	0xa9b70516	! t1_kref+0xbb4:   	fcmpgt16	%f28, %f22, %l4
	.word	0xb5b70d1e	! t1_kref+0xbb8:   	fandnot1	%f28, %f30, %f26
	.word	0xf13e6008	! t1_kref+0xbbc:   	std	%f24, [%i1 + 8]
	.word	0xb5a01935	! t1_kref+0xbc0:   	fstod	%f21, %f26
	.word	0xa5a00554	! t1_kref+0xbc4:   	fsqrtd	%f20, %f18
	.word	0x932a8009	! t1_kref+0xbc8:   	sll	%o2, %o1, %o1
	.word	0xaba00038	! t1_kref+0xbcc:   	fmovs	%f24, %f21
	.word	0xa9a01936	! t1_kref+0xbd0:   	fstod	%f22, %f20
	.word	0xd428a03c	! t1_kref+0xbd4:   	stb	%o2, [%g2 + 0x3c]
	.word	0xada0055c	! t1_kref+0xbd8:   	fsqrtd	%f28, %f22
	.word	0xb9a44d36	! t1_kref+0xbdc:   	fsmuld	%f17, %f22, %f28
	.word	0x33800002	! t1_kref+0xbe0:   	fbe,a	_kref+0xbe8
	.word	0xbda01895	! t1_kref+0xbe4:   	fitos	%f21, %f30
	.word	0xa5400000	! t1_kref+0xbe8:   	mov	%y, %l2
	.word	0xa6da4009	! t1_kref+0xbec:   	smulcc	%o1, %o1, %l3
	.word	0xb9a01938	! t1_kref+0xbf0:   	fstod	%f24, %f28
	.word	0xaab30009	! t1_kref+0xbf4:   	orncc	%o4, %o1, %l5
	.word	0xb7a01a3a	! t1_kref+0xbf8:   	fstoi	%f26, %f27
	.word	0xf007bfe0	! t1_kref+0xbfc:   	ld	[%fp - 0x20], %i0
	.word	0xa4b263e5	! t1_kref+0xc00:   	orncc	%o1, 0x3e5, %l2
	.word	0xd2000019	! t1_kref+0xc04:   	ld	[%g0 + %i1], %o1
	.word	0xb1a0193a	! t1_kref+0xc08:   	fstod	%f26, %f24
	.word	0xa65b3026	! t1_kref+0xc0c:   	smul	%o4, -0xfda, %l3
	.word	0xbdb009ba	! t1_kref+0xc10:   	fexpand	%f26, %f30
	.word	0x9de3bfa0	! t1_kref+0xc14:   	save	%sp, -0x60, %sp
	.word	0x91e838cd	! t1_kref+0xc18:   	restore	%g0, -0x733, %o0
	.word	0x21800001	! t1_kref+0xc1c:   	fbn,a	_kref+0xc20
	.word	0xe610a026	! t1_kref+0xc20:   	lduh	[%g2 + 0x26], %l3
	.word	0x91233031	! t1_kref+0xc24:   	mulscc	%o4, -0xfcf, %o0
	.word	0x2b800006	! t1_kref+0xc28:   	fbug,a	_kref+0xc40
	.word	0xb9a00558	! t1_kref+0xc2c:   	fsqrtd	%f24, %f28
	.word	0xd628a007	! t1_kref+0xc30:   	stb	%o3, [%g2 + 7]
	.word	0xd628a01c	! t1_kref+0xc34:   	stb	%o3, [%g2 + 0x1c]
	.word	0xefee101b	! t1_kref+0xc38:   	prefetcha	%i0 + %i3, 23
	.word	0xef266018	! t1_kref+0xc3c:   	st	%f23, [%i1 + 0x18]
	.word	0x9f414000	! t1_kref+0xc40:   	mov	%pc, %o7
!	.word	0x3385bcee	! t1_kref+0xc44:   	fbe,a	SYM(t1_subr1)
	   	fbe,a	SYM(t1_subr1)
	.word	0x92c2400b	! t1_kref+0xc48:   	addccc	%o1, %o3, %o1
	.word	0xa5a01911	! t1_kref+0xc4c:   	fitod	%f17, %f18
	.word	0xaf400000	! t1_kref+0xc50:   	mov	%y, %l7
	.word	0xf3263fe8	! t1_kref+0xc54:   	st	%f25, [%i0 - 0x18]
	.word	0xf1be5a5d	! t1_kref+0xc58:   	stda	%f24, [%i1 + %i5]0xd2
	.word	0xa62b000c	! t1_kref+0xc5c:   	andn	%o4, %o4, %l3
	.word	0xe520a03c	! t1_kref+0xc60:   	st	%f18, [%g2 + 0x3c]
	.word	0xaeab000b	! t1_kref+0xc64:   	andncc	%o4, %o3, %l7
	.word	0xaedaf23f	! t1_kref+0xc68:   	smulcc	%o3, -0xdc1, %l7
	.word	0xb5b50c52	! t1_kref+0xc6c:   	fnor	%f20, %f18, %f26
	.word	0x81dec01e	! t1_kref+0xc70:   	flush	%i3 + %fp
	.word	0xb1a0055a	! t1_kref+0xc74:   	fsqrtd	%f26, %f24
	.word	0xa6b2eb7d	! t1_kref+0xc78:   	orncc	%o3, 0xb7d, %l3
	.word	0x81ae0ade	! t1_kref+0xc7c:   	fcmped	%fcc0, %f24, %f30
	.word	0xec6e401a	! t1_kref+0xc80:   	ldstub	[%i1 + %i2], %l6
	.word	0x9de3bfa0	! t1_kref+0xc84:   	save	%sp, -0x60, %sp
	.word	0xb8b76044	! t1_kref+0xc88:   	orncc	%i5, 0x44, %i4
	.word	0xa7eeb77d	! t1_kref+0xc8c:   	restore	%i2, -0x883, %l3
	.word	0xe968a080	! t1_kref+0xc90:   	prefetch	%g2 + 0x80, 20
	.word	0xe48e501a	! t1_kref+0xc94:   	lduba	[%i1 + %i2]0x80, %l2
	.word	0xb5a0191b	! t1_kref+0xc98:   	fitod	%f27, %f26
	.word	0x28800005	! t1_kref+0xc9c:   	bleu,a	_kref+0xcb0
	.word	0x903ac009	! t1_kref+0xca0:   	xnor	%o3, %o1, %o0
	.word	0xd628a016	! t1_kref+0xca4:   	stb	%o3, [%g2 + 0x16]
	.word	0xa5418000	! t1_kref+0xca8:   	mov	%fprs, %l2
	.word	0xac92f86e	! t1_kref+0xcac:   	orcc	%o3, -0x792, %l6
	.word	0x9062a7d6	! t1_kref+0xcb0:   	subc	%o2, 0x7d6, %o0
	.word	0xaf124009	! t1_kref+0xcb4:   	taddcctv	%o1, %o1, %l7
	.word	0xa1a0105a	! t1_kref+0xcb8:   	fdtox	%f26, %f16
	.word	0xf720a034	! t1_kref+0xcbc:   	st	%f27, [%g2 + 0x34]
	.word	0x8143c000	! t1_kref+0xcc0:   	stbar
	.word	0xb1a01912	! t1_kref+0xcc4:   	fitod	%f18, %f24
	.word	0xae9ac00b	! t1_kref+0xcc8:   	xorcc	%o3, %o3, %l7
	.word	0xa6dabb63	! t1_kref+0xccc:   	smulcc	%o2, -0x49d, %l3
	.word	0x92030009	! t1_kref+0xcd0:   	add	%o4, %o1, %o1
	.word	0xa7b50514	! t1_kref+0xcd4:   	fcmpgt16	%f20, %f20, %l3
	.word	0xa4127081	! t1_kref+0xcd8:   	or	%o1, -0xf7f, %l2
	.word	0x8143c000	! t1_kref+0xcdc:   	stbar
	.word	0xaa5a7551	! t1_kref+0xce0:   	smul	%o1, -0xaaf, %l5
	.word	0x9de3bfa0	! t1_kref+0xce4:   	save	%sp, -0x60, %sp
	.word	0xb236401c	! t1_kref+0xce8:   	orn	%i1, %i4, %i1
	.word	0xa5eec01c	! t1_kref+0xcec:   	restore	%i3, %i4, %l2
	.word	0xe408a015	! t1_kref+0xcf0:   	ldub	[%g2 + 0x15], %l2
	.word	0xaba01892	! t1_kref+0xcf4:   	fitos	%f18, %f21
	.word	0xd630a004	! t1_kref+0xcf8:   	sth	%o3, [%g2 + 4]
	.word	0xc807bfec	! t1_kref+0xcfc:   	ld	[%fp - 0x14], %g4
	.word	0xd430a02e	! t1_kref+0xd00:   	sth	%o2, [%g2 + 0x2e]
	.word	0x2f800007	! t1_kref+0xd04:   	fbu,a	_kref+0xd20
	.word	0xe3f6100a	! t1_kref+0xd08:   	casxa	[%i0]0x80, %o2, %l1
	.word	0xb1a00556	! t1_kref+0xd0c:   	fsqrtd	%f22, %f24
	.word	0xe9a01019	! t1_kref+0xd10:   	sta	%f20, [%g0 + %i1]0x80
	.word	0xb9a7895e	! t1_kref+0xd14:   	fmuld	%f30, %f30, %f28
	.word	0xe4d6501b	! t1_kref+0xd18:   	ldsha	[%i1 + %i3]0x80, %l2
	.word	0xa5b48dd6	! t1_kref+0xd1c:   	fnand	%f18, %f22, %f18
	.word	0xf920a03c	! t1_kref+0xd20:   	st	%f28, [%g2 + 0x3c]
	.word	0xd62e600e	! t1_kref+0xd24:   	stb	%o3, [%i1 + 0xe]
	.word	0xa5a00554	! t1_kref+0xd28:   	fsqrtd	%f20, %f18
	.word	0xada54d36	! t1_kref+0xd2c:   	fsmuld	%f21, %f22, %f22
	.word	0xe8063fe0	! t1_kref+0xd30:   	ld	[%i0 - 0x20], %l4
	.word	0xada000d4	! t1_kref+0xd34:   	fnegd	%f20, %f22
	.word	0xee965000	! t1_kref+0xd38:   	lduha	[%i1]0x80, %l7
	.word	0xa3a01898	! t1_kref+0xd3c:   	fitos	%f24, %f17
	.word	0xb1b50718	! t1_kref+0xd40:   	fmuld8sux16	%f20, %f24, %f24
	call	SYM(t1_subr1)
	.word	0xae1b000a	! t1_kref+0xd48:   	xor	%o4, %o2, %l7
	.word	0xc368a0cd	! t1_kref+0xd4c:   	prefetch	%g2 + 0xcd, 1
	.word	0xa892c00c	! t1_kref+0xd50:   	orcc	%o3, %o4, %l4
	.word	0xa1b00cd8	! t1_kref+0xd54:   	fnot2	%f24, %f16
	.word	0xa7a00037	! t1_kref+0xd58:   	fmovs	%f23, %f19
	.word	0xa3b60f78	! t1_kref+0xd5c:   	fornot1s	%f24, %f24, %f17
	.word	0x3e480003	! t1_kref+0xd60:   	bvc,a,pt	%icc, _kref+0xd6c
	.word	0xe99f5018	! t1_kref+0xd64:   	ldda	[%i5 + %i0]0x80, %f20
	.word	0xa433000b	! t1_kref+0xd68:   	orn	%o4, %o3, %l2
	.word	0xfb06001c	! t1_kref+0xd6c:   	ld	[%i0 + %i4], %f29
	.word	0xd830a034	! t1_kref+0xd70:   	sth	%o4, [%g2 + 0x34]
	.word	0xada0015c	! t1_kref+0xd74:   	fabsd	%f28, %f22
	.word	0xfd00a034	! t1_kref+0xd78:   	ld	[%g2 + 0x34], %f30
	.word	0xa802b121	! t1_kref+0xd7c:   	add	%o2, -0xedf, %l4
	.word	0x91b2c32b	! t1_kref+0xd80:   	bmask	%o3, %o3, %o0
	.word	0xada018dc	! t1_kref+0xd84:   	fdtos	%f28, %f22
	.word	0xfd26401c	! t1_kref+0xd88:   	st	%f30, [%i1 + %i4]
	.word	0xe84e201f	! t1_kref+0xd8c:   	ldsb	[%i0 + 0x1f], %l4
	.word	0xb5a44934	! t1_kref+0xd90:   	fmuls	%f17, %f20, %f26
	.word	0xa69a4009	! t1_kref+0xd94:   	xorcc	%o1, %o1, %l3
	.word	0xd620a01c	! t1_kref+0xd98:   	st	%o3, [%g2 + 0x1c]
	.word	0xe9262004	! t1_kref+0xd9c:   	st	%f20, [%i0 + 4]
	.word	0xac02c00b	! t1_kref+0xda0:   	add	%o3, %o3, %l6
	.word	0xa70a400b	! t1_kref+0xda4:   	tsubcc	%o1, %o3, %l3
	.word	0x39480001	! t1_kref+0xda8:   	fbuge,a,pt	%fcc0, _kref+0xdac
	.word	0xf13e2010	! t1_kref+0xdac:   	std	%f24, [%i0 + 0x10]
	.word	0xef06600c	! t1_kref+0xdb0:   	ld	[%i1 + 0xc], %f23
	.word	0xac92e345	! t1_kref+0xdb4:   	orcc	%o3, 0x345, %l6
	.word	0xe168a007	! t1_kref+0xdb8:   	prefetch	%g2 + 7, 16
	.word	0xa5a00054	! t1_kref+0xdbc:   	fmovd	%f20, %f18
	.word	0xaa7ac00b	! t1_kref+0xdc0:   	sdiv	%o3, %o3, %l5
	.word	0xae0a6532	! t1_kref+0xdc4:   	and	%o1, 0x532, %l7
	.word	0xbba01a39	! t1_kref+0xdc8:   	fstoi	%f25, %f29
	.word	0xed26001c	! t1_kref+0xdcc:   	st	%f22, [%i0 + %i4]
	.word	0xf1bf5a59	! t1_kref+0xdd0:   	stda	%f24, [%i5 + %i1]0xd2
	.word	0xe9be5a5d	! t1_kref+0xdd4:   	stda	%f20, [%i1 + %i5]0xd2
	.word	0xe968a040	! t1_kref+0xdd8:   	prefetch	%g2 + 0x40, 20
	.word	0xb9a00552	! t1_kref+0xddc:   	fsqrtd	%f18, %f28
	.word	0xeace5000	! t1_kref+0xde0:   	ldsba	[%i1]0x80, %l5
	.word	0xa4ab27f4	! t1_kref+0xde4:   	andncc	%o4, 0x7f4, %l2
	.word	0xd6ae1000	! t1_kref+0xde8:   	stba	%o3, [%i0]0x80
	.word	0xa9b300ac	! t1_kref+0xdec:   	edge16n	%o4, %o4, %l4
	.word	0x30800006	! t1_kref+0xdf0:   	ba,a	_kref+0xe08
	.word	0xe700a02c	! t1_kref+0xdf4:   	ld	[%g2 + 0x2c], %f19
	.word	0xa92a800a	! t1_kref+0xdf8:   	sll	%o2, %o2, %l4
	.word	0xea881019	! t1_kref+0xdfc:   	lduba	[%g0 + %i1]0x80, %l5
	.word	0x2a480002	! t1_kref+0xe00:   	bcs,a,pt	%icc, _kref+0xe08
	.word	0xa5b70ad0	! t1_kref+0xe04:   	fpsub32	%f28, %f16, %f18
	.word	0xaf2a400b	! t1_kref+0xe08:   	sll	%o1, %o3, %l7
	.word	0xef20a004	! t1_kref+0xe0c:   	st	%f23, [%g2 + 4]
	.word	0xa5a0003e	! t1_kref+0xe10:   	fmovs	%f30, %f18
	.word	0x28800004	! t1_kref+0xe14:   	bleu,a	_kref+0xe24
	.word	0xac82c009	! t1_kref+0xe18:   	addcc	%o3, %o1, %l6
	.word	0xb7a018d6	! t1_kref+0xe1c:   	fdtos	%f22, %f27
	.word	0xef066018	! t1_kref+0xe20:   	ld	[%i1 + 0x18], %f23
	.word	0xa7b4cf79	! t1_kref+0xe24:   	fornot1s	%f19, %f25, %f19
	.word	0xaa1aa1f3	! t1_kref+0xe28:   	xor	%o2, 0x1f3, %l5
	.word	0x92b2bcb3	! t1_kref+0xe2c:   	orncc	%o2, -0x34d, %o1
	.word	0xc568a048	! t1_kref+0xe30:   	prefetch	%g2 + 0x48, 2
	.word	0x86102001	! t1_kref+0xe34:   	mov	0x1, %g3
	.word	0x32800000	! t1_kref+0xe38:   	bne,a	_kref+0xe38
	.word	0x86a0e001	! t1_kref+0xe3c:   	subcc	%g3, 1, %g3
	.word	0xe608a02d	! t1_kref+0xe40:   	ldub	[%g2 + 0x2d], %l3
	.word	0xd876401d	! t1_kref+0xe44:   	stx	%o4, [%i1 + %i5]
	.word	0xad22800a	! t1_kref+0xe48:   	mulscc	%o2, %o2, %l6
	.word	0x92fa7b82	! t1_kref+0xe4c:   	sdivcc	%o1, -0x47e, %o1
	.word	0xf9066010	! t1_kref+0xe50:   	ld	[%i1 + 0x10], %f28
	.word	0xa87b000a	! t1_kref+0xe54:   	sdiv	%o4, %o2, %l4
	.word	0x31480005	! t1_kref+0xe58:   	fba,a,pt	%fcc0, _kref+0xe6c
	.word	0xacaa73cc	! t1_kref+0xe5c:   	andncc	%o1, -0xc34, %l6
	.word	0x92d2bd36	! t1_kref+0xe60:   	umulcc	%o2, -0x2ca, %o1
	.word	0xee48a007	! t1_kref+0xe64:   	ldsb	[%g2 + 7], %l7
	.word	0xe4460000	! t1_kref+0xe68:   	ldsw	[%i0], %l2
	.word	0x3a480008	! t1_kref+0xe6c:   	bcc,a,pt	%icc, _kref+0xe8c
	.word	0xa402400c	! t1_kref+0xe70:   	add	%o1, %o4, %l2
	.word	0x81ac8ada	! t1_kref+0xe74:   	fcmped	%fcc0, %f18, %f26
	.word	0x8582800c	! t1_kref+0xe78:   	wr	%o2, %o4, %ccr
	.word	0x902a8009	! t1_kref+0xe7c:   	andn	%o2, %o1, %o0
	.word	0xd43e001d	! t1_kref+0xe80:   	std	%o2, [%i0 + %i5]
	.word	0xadb68e58	! t1_kref+0xe84:   	fxnor	%f26, %f24, %f22
	.word	0xc168a00c	! t1_kref+0xe88:   	prefetch	%g2 + 0xc, 0
	.word	0xa7a00538	! t1_kref+0xe8c:   	fsqrts	%f24, %f19
	.word	0xf7266000	! t1_kref+0xe90:   	st	%f27, [%i1]
	.word	0xc12e001c	! t1_kref+0xe94:   	st	%fsr, [%i0 + %i4]
	.word	0xe300a02c	! t1_kref+0xe98:   	ld	[%g2 + 0x2c], %f17
	.word	0xeb68a049	! t1_kref+0xe9c:   	prefetch	%g2 + 0x49, 21
	.word	0xe168a04a	! t1_kref+0xea0:   	prefetch	%g2 + 0x4a, 16
	.word	0x92fb000b	! t1_kref+0xea4:   	sdivcc	%o4, %o3, %o1
	.word	0x81ad8a5a	! t1_kref+0xea8:   	fcmpd	%fcc0, %f22, %f26
	.word	0xaf32e011	! t1_kref+0xeac:   	srl	%o3, 0x11, %l7
	.word	0xa5b68ada	! t1_kref+0xeb0:   	fpsub32	%f26, %f26, %f18
	.word	0xb1b00fe0	! t1_kref+0xeb4:   	fones	%f24
	.word	0x81af8ade	! t1_kref+0xeb8:   	fcmped	%fcc0, %f30, %f30
	.word	0xaf418000	! t1_kref+0xebc:   	mov	%fprs, %l7
	.word	0xa3b74a7a	! t1_kref+0xec0:   	fpadd32s	%f29, %f26, %f17
	.word	0xa69b3631	! t1_kref+0xec4:   	xorcc	%o4, -0x9cf, %l3
	.word	0xfb266000	! t1_kref+0xec8:   	st	%f29, [%i1]
	.word	0xadb00c00	! t1_kref+0xecc:   	fzero	%f22
	.word	0xacb2800c	! t1_kref+0xed0:   	orncc	%o2, %o4, %l6
	.word	0xe608a02c	! t1_kref+0xed4:   	ldub	[%g2 + 0x2c], %l3
	.word	0xae9ab9e3	! t1_kref+0xed8:   	xorcc	%o2, -0x61d, %l7
	.word	0xe4063ff8	! t1_kref+0xedc:   	ld	[%i0 - 8], %l2
	.word	0xb3b007bc	! t1_kref+0xee0:   	fpackfix	%f28, %f25
	.word	0x93400000	! t1_kref+0xee4:   	mov	%y, %o1
	.word	0xa81b265e	! t1_kref+0xee8:   	xor	%o4, 0x65e, %l4
	.word	0xaba5c935	! t1_kref+0xeec:   	fmuls	%f23, %f21, %f21
	.word	0xac0b0009	! t1_kref+0xef0:   	and	%o4, %o1, %l6
	.word	0x30480008	! t1_kref+0xef4:   	ba,a,pt	%icc, _kref+0xf14
	.word	0x90db000a	! t1_kref+0xef8:   	smulcc	%o4, %o2, %o0
	.word	0xb1b50f5a	! t1_kref+0xefc:   	fornot1	%f20, %f26, %f24
	.word	0xbda00552	! t1_kref+0xf00:   	fsqrtd	%f18, %f30
	.word	0xa8ab000a	! t1_kref+0xf04:   	andncc	%o4, %o2, %l4
	.word	0xd228a005	! t1_kref+0xf08:   	stb	%o1, [%g2 + 5]
	.word	0xada01116	! t1_kref+0xf0c:   	fxtod	%f22, %f22
	.word	0xd220a014	! t1_kref+0xf10:   	st	%o1, [%g2 + 0x14]
	.word	0xac23000a	! t1_kref+0xf14:   	sub	%o4, %o2, %l6
	.word	0xa5a01918	! t1_kref+0xf18:   	fitod	%f24, %f18
	.word	0xad400000	! t1_kref+0xf1c:   	mov	%y, %l6
	.word	0xada50d3d	! t1_kref+0xf20:   	fsmuld	%f20, %f29, %f22
	.word	0xb1a40856	! t1_kref+0xf24:   	faddd	%f16, %f22, %f24
	.word	0xac2a8009	! t1_kref+0xf28:   	andn	%o2, %o1, %l6
	.word	0xafb30280	! t1_kref+0xf2c:   	array32	%o4, %g0, %l7
	.word	0xd82e201e	! t1_kref+0xf30:   	stb	%o4, [%i0 + 0x1e]
	.word	0xd4362006	! t1_kref+0xf34:   	sth	%o2, [%i0 + 6]
	.word	0xaaaaa79f	! t1_kref+0xf38:   	andncc	%o2, 0x79f, %l5
	.word	0xa482b106	! t1_kref+0xf3c:   	addcc	%o2, -0xefa, %l2
	.word	0xacfab219	! t1_kref+0xf40:   	sdivcc	%o2, -0xde7, %l6
	.word	0xac3a800a	! t1_kref+0xf44:   	xnor	%o2, %o2, %l6
	.word	0x8143c000	! t1_kref+0xf48:   	stbar
	.word	0xbda0105c	! t1_kref+0xf4c:   	fdtox	%f28, %f30
	.word	0xa7232922	! t1_kref+0xf50:   	mulscc	%o4, 0x922, %l3
	.word	0xf36e6010	! t1_kref+0xf54:   	prefetch	%i1 + 0x10, 25
	.word	0x92fa7abd	! t1_kref+0xf58:   	sdivcc	%o1, -0x543, %o1
	.word	0xac728009	! t1_kref+0xf5c:   	udiv	%o2, %o1, %l6
	.word	0xd03e7fe0	! t1_kref+0xf60:   	std	%o0, [%i1 - 0x20]
	.word	0x8143e040	! t1_kref+0xf64:   	membar	0x40
	.word	0xa9418000	! t1_kref+0xf68:   	mov	%fprs, %l4
	.word	0xabb28280	! t1_kref+0xf6c:   	array32	%o2, %g0, %l5
	.word	0x90aa400c	! t1_kref+0xf70:   	andncc	%o1, %o4, %o0
	.word	0x9de3bfa0	! t1_kref+0xf74:   	save	%sp, -0x60, %sp
	.word	0xb05f3249	! t1_kref+0xf78:   	smul	%i4, -0xdb7, %i0
	.word	0xa5ef401a	! t1_kref+0xf7c:   	restore	%i5, %i2, %l2
	.word	0xada44937	! t1_kref+0xf80:   	fmuls	%f17, %f23, %f22
	.word	0x3f480003	! t1_kref+0xf84:   	fbo,a,pt	%fcc0, _kref+0xf90
	.word	0xa9a689da	! t1_kref+0xf88:   	fdivd	%f26, %f26, %f20
	.word	0x23800002	! t1_kref+0xf8c:   	fbne,a	_kref+0xf94
	.word	0xae9ac00c	! t1_kref+0xf90:   	xorcc	%o3, %o4, %l7
	.word	0xb9a68856	! t1_kref+0xf94:   	faddd	%f26, %f22, %f28
	.word	0x81af8a54	! t1_kref+0xf98:   	fcmpd	%fcc0, %f30, %f20
	.word	0xac0a400a	! t1_kref+0xf9c:   	and	%o1, %o2, %l6
	.word	0xfb86101c	! t1_kref+0xfa0:   	lda	[%i0 + %i4]0x80, %f29
	.word	0xf11e3fe0	! t1_kref+0xfa4:   	ldd	[%i0 - 0x20], %f24
	.word	0xe840a024	! t1_kref+0xfa8:   	ldsw	[%g2 + 0x24], %l4
	.word	0x81adcab6	! t1_kref+0xfac:   	fcmpes	%fcc0, %f23, %f22
	.word	0x81db6066	! t1_kref+0xfb0:   	flush	%o5 + 0x66
	.word	0x91b2c109	! t1_kref+0xfb4:   	edge32	%o3, %o1, %o0
	.word	0x2a800006	! t1_kref+0xfb8:   	bcs,a	_kref+0xfd0
	.word	0xb6103fe8	! t1_kref+0xfbc:   	mov	0xffffffe8, %i3
	.word	0xb5a0053a	! t1_kref+0xfc0:   	fsqrts	%f26, %f26
	.word	0x3f480004	! t1_kref+0xfc4:   	fbo,a,pt	%fcc0, _kref+0xfd4
	.word	0xabb2416b	! t1_kref+0xfc8:   	edge32ln	%o1, %o3, %l5
	.word	0x907b0009	! t1_kref+0xfcc:   	sdiv	%o4, %o1, %o0
	.word	0xaa52f529	! t1_kref+0xfd0:   	umul	%o3, -0xad7, %l5
	.word	0x932ac00a	! t1_kref+0xfd4:   	sll	%o3, %o2, %o1
	.word	0xf56e001b	! t1_kref+0xfd8:   	prefetch	%i0 + %i3, 26
	.word	0xd89e1000	! t1_kref+0xfdc:   	ldda	[%i0]0x80, %o4
	.word	0xb5a00056	! t1_kref+0xfe0:   	fmovd	%f22, %f26
	.word	0xb8102014	! t1_kref+0xfe4:   	mov	0x14, %i4
	.word	0x34800003	! t1_kref+0xfe8:   	bg,a	_kref+0xff4
	.word	0xe478a00c	! t1_kref+0xfec:   	swap	[%g2 + 0xc], %l2
	.word	0xd0b81019	! t1_kref+0xff0:   	stda	%o0, [%g0 + %i1]0x80
	.word	0xa4228009	! t1_kref+0xff4:   	sub	%o2, %o1, %l2
	.word	0xd04e401a	! t1_kref+0xff8:   	ldsb	[%i1 + %i2], %o0
	.word	0xaadb000c	! t1_kref+0xffc:   	smulcc	%o4, %o4, %l5
	.word	0xb9a548bb	! t1_kref+0x1000:   	fsubs	%f21, %f27, %f28
	.word	0x9fc10000	! t1_kref+0x1004:   	call	%g4
	.word	0xb5a488da	! t1_kref+0x1008:   	fsubd	%f18, %f26, %f26
	.word	0xabb2c280	! t1_kref+0x100c:   	array32	%o3, %g0, %l5
	.word	0xafb4849a	! t1_kref+0x1010:   	fcmple32	%f18, %f26, %l7
	.word	0xd830a01e	! t1_kref+0x1014:   	sth	%o4, [%g2 + 0x1e]
	.word	0xb9a6cd3b	! t1_kref+0x1018:   	fsmuld	%f27, %f27, %f28
	.word	0xa7a6883a	! t1_kref+0x101c:   	fadds	%f26, %f26, %f19
	.word	0xe66e7fe8	! t1_kref+0x1020:   	ldstub	[%i1 - 0x18], %l3
	.word	0xd7f6500a	! t1_kref+0x1024:   	casxa	[%i1]0x80, %o2, %o3
	.word	0xc9ee1009	! t1_kref+0x1028:   	prefetcha	%i0 + %o1, 4
	.word	0xaa1b3b06	! t1_kref+0x102c:   	xor	%o4, -0x4fa, %l5
	.word	0xa85a7a50	! t1_kref+0x1030:   	smul	%o1, -0x5b0, %l4
	.word	0x8143e040	! t1_kref+0x1034:   	membar	0x40
	.word	0xf1070018	! t1_kref+0x1038:   	ld	[%i4 + %i0], %f24
	.word	0xec564000	! t1_kref+0x103c:   	ldsh	[%i1], %l6
	.word	0xaf400000	! t1_kref+0x1040:   	mov	%y, %l7
	.word	0xe46e6004	! t1_kref+0x1044:   	ldstub	[%i1 + 4], %l2
	.word	0xb1a01919	! t1_kref+0x1048:   	fitod	%f25, %f24
	.word	0xadb28280	! t1_kref+0x104c:   	array32	%o2, %g0, %l6
	.word	0xa5a01a3e	! t1_kref+0x1050:   	fstoi	%f30, %f18
	.word	0xb5b009b1	! t1_kref+0x1054:   	fexpand	%f17, %f26
	.word	0xb3a749b8	! t1_kref+0x1058:   	fdivs	%f29, %f24, %f25
	.word	0x92332034	! t1_kref+0x105c:   	orn	%o4, 0x34, %o1
	.word	0xe9be5849	! t1_kref+0x1060:   	stda	%f20, [%i1 + %o1]0xc2
	.word	0xb5a0193a	! t1_kref+0x1064:   	fstod	%f26, %f26
	.word	0xc807bfe4	! t1_kref+0x1068:   	ld	[%fp - 0x1c], %g4
	.word	0xa7400000	! t1_kref+0x106c:   	mov	%y, %l3
	.word	0x92db000b	! t1_kref+0x1070:   	smulcc	%o4, %o3, %o1
	.word	0xa6333408	! t1_kref+0x1074:   	orn	%o4, -0xbf8, %l3
	.word	0x001fffff	! t1_kref+0x1078:   	illtrap	0x1fffff
	.word	0xd82e8018	! t1_kref+0x107c:   	stb	%o4, [%i2 + %i0]
	.word	0xb9a409d8	! t1_kref+0x1080:   	fdivd	%f16, %f24, %f28
	.word	0x81ae8ab6	! t1_kref+0x1084:   	fcmpes	%fcc0, %f26, %f22
	.word	0xfb00a00c	! t1_kref+0x1088:   	ld	[%g2 + 0xc], %f29
	.word	0xbda0055a	! t1_kref+0x108c:   	fsqrtd	%f26, %f30
	.word	0xe85e2008	! t1_kref+0x1090:   	ldx	[%i0 + 8], %l4
	.word	0xe850a02c	! t1_kref+0x1094:   	ldsh	[%g2 + 0x2c], %l4
	.word	0xae1b000b	! t1_kref+0x1098:   	xor	%o4, %o3, %l7
	.word	0xa9a00556	! t1_kref+0x109c:   	fsqrtd	%f22, %f20
	.word	0xf7067ff0	! t1_kref+0x10a0:   	ld	[%i1 - 0x10], %f27
	.word	0xc368a0c1	! t1_kref+0x10a4:   	prefetch	%g2 + 0xc1, 1
	.word	0xaa22c009	! t1_kref+0x10a8:   	sub	%o3, %o1, %l5
	.word	0xab2ac00c	! t1_kref+0x10ac:   	sll	%o3, %o4, %l5
	.word	0xaad2c00a	! t1_kref+0x10b0:   	umulcc	%o3, %o2, %l5
	.word	0x2a800001	! t1_kref+0x10b4:   	bcs,a	_kref+0x10b8
	.word	0xae2a800a	! t1_kref+0x10b8:   	andn	%o2, %o2, %l7
	.word	0x34800007	! t1_kref+0x10bc:   	bg,a	_kref+0x10d8
	.word	0xa9b68f94	! t1_kref+0x10c0:   	for	%f26, %f20, %f20
	.word	0xa5a0191e	! t1_kref+0x10c4:   	fitod	%f30, %f18
	.word	0xbda589de	! t1_kref+0x10c8:   	fdivd	%f22, %f30, %f30
	.word	0xd820a00c	! t1_kref+0x10cc:   	st	%o4, [%g2 + 0xc]
	.word	0xa6c2400a	! t1_kref+0x10d0:   	addccc	%o1, %o2, %l3
	.word	0xa5a018de	! t1_kref+0x10d4:   	fdtos	%f30, %f18
	.word	0x9fc10000	! t1_kref+0x10d8:   	call	%g4
	.word	0xb5b5cabe	! t1_kref+0x10dc:   	fpsub16s	%f23, %f30, %f26
	.word	0x9262400a	! t1_kref+0x10e0:   	subc	%o1, %o2, %o1
	.word	0xa1a50856	! t1_kref+0x10e4:   	faddd	%f20, %f22, %f16
	.word	0xa6fa400c	! t1_kref+0x10e8:   	sdivcc	%o1, %o4, %l3
	.word	0x9fc10000	! t1_kref+0x10ec:   	call	%g4
	.word	0xb1a00054	! t1_kref+0x10f0:   	fmovd	%f20, %f24
	.word	0x933ac00c	! t1_kref+0x10f4:   	sra	%o3, %o4, %o1
	.word	0xe4d01019	! t1_kref+0x10f8:   	ldsha	[%g0 + %i1]0x80, %l2
	.word	0xb9b00f3e	! t1_kref+0x10fc:   	fsrc2s	%f30, %f28
	.word	0xa8bb000b	! t1_kref+0x1100:   	xnorcc	%o4, %o3, %l4
	.word	0xa3a58832	! t1_kref+0x1104:   	fadds	%f22, %f18, %f17
	.word	0xb9b58d94	! t1_kref+0x1108:   	fxor	%f22, %f20, %f28
	.word	0xaa62400b	! t1_kref+0x110c:   	subc	%o1, %o3, %l5
	.word	0x8610201f	! t1_kref+0x1110:   	mov	0x1f, %g3
	.word	0x86a0e001	! t1_kref+0x1114:   	subcc	%g3, 1, %g3
	.word	0x22800019	! t1_kref+0x1118:   	be,a	_kref+0x117c
	.word	0xc1f6100b	! t1_kref+0x111c:   	casxa	[%i0]0x80, %o3, %g0
	.word	0xa6d26697	! t1_kref+0x1120:   	umulcc	%o1, 0x697, %l3
	.word	0xf53e6018	! t1_kref+0x1124:   	std	%f26, [%i1 + 0x18]
	.word	0x304ffffb	! t1_kref+0x1128:   	ba,a,pt	%icc, _kref+0x1114
	.word	0xb5b5471b	! t1_kref+0x112c:   	fmuld8sux16	%f21, %f27, %f26
	.word	0x9092a7f5	! t1_kref+0x1130:   	orcc	%o2, 0x7f5, %o0
	.word	0xe968a088	! t1_kref+0x1134:   	prefetch	%g2 + 0x88, 20
	.word	0x9272c00b	! t1_kref+0x1138:   	udiv	%o3, %o3, %o1
	.word	0xa88ac00c	! t1_kref+0x113c:   	andcc	%o3, %o4, %l4
	.word	0xa5b58fb5	! t1_kref+0x1140:   	fors	%f22, %f21, %f18
	.word	0xd81e3fe8	! t1_kref+0x1144:   	ldd	[%i0 - 0x18], %o4
	.word	0x8582800c	! t1_kref+0x1148:   	wr	%o2, %o4, %ccr
	.word	0xb5a74d3a	! t1_kref+0x114c:   	fsmuld	%f29, %f26, %f26
	.word	0xa5a48d3e	! t1_kref+0x1150:   	fsmuld	%f18, %f30, %f18
	.word	0xa9b5891e	! t1_kref+0x1154:   	faligndata	%f22, %f30, %f20
	.word	0xe44e6003	! t1_kref+0x1158:   	ldsb	[%i1 + 3], %l2
	.word	0xb1a4c9bb	! t1_kref+0x115c:   	fdivs	%f19, %f27, %f24
	.word	0xaedb2d5b	! t1_kref+0x1160:   	smulcc	%o4, 0xd5b, %l7
	.word	0xe616001b	! t1_kref+0x1164:   	lduh	[%i0 + %i3], %l3
	.word	0x92aac00b	! t1_kref+0x1168:   	andncc	%o3, %o3, %o1
	.word	0x39bfffea	! t1_kref+0x116c:   	fbuge,a	_kref+0x1114
	.word	0xb5b78f9c	! t1_kref+0x1170:   	for	%f30, %f28, %f26
	call	SYM(t1_subr2)
	.word	0xa9a0055e	! t1_kref+0x1178:   	fsqrtd	%f30, %f20
	.word	0x81ae4ab8	! t1_kref+0x117c:   	fcmpes	%fcc0, %f25, %f24
	.word	0xa7a0053e	! t1_kref+0x1180:   	fsqrts	%f30, %f19
	.word	0x92c2eda3	! t1_kref+0x1184:   	addccc	%o3, 0xda3, %o1
	.word	0x8143e078	! t1_kref+0x1188:   	membar	0x78
	.word	0xa49ac00a	! t1_kref+0x118c:   	xorcc	%o3, %o2, %l2
	.word	0xa5b4ca78	! t1_kref+0x1190:   	fpadd32s	%f19, %f24, %f18
	.word	0xa5a5085c	! t1_kref+0x1194:   	faddd	%f20, %f28, %f18
	.word	0xaab2b44c	! t1_kref+0x1198:   	orncc	%o2, -0xbb4, %l5
	.word	0xe5be5000	! t1_kref+0x119c:   	stda	%f18, [%i1]0x80
	.word	0xa8630009	! t1_kref+0x11a0:   	subc	%o4, %o1, %l4
	.word	0xae7a8009	! t1_kref+0x11a4:   	sdiv	%o2, %o1, %l7
	.word	0xac9af2fc	! t1_kref+0x11a8:   	xorcc	%o3, -0xd04, %l6
	.word	0xd03e001d	! t1_kref+0x11ac:   	std	%o0, [%i0 + %i5]
	.word	0x35480002	! t1_kref+0x11b0:   	fbue,a,pt	%fcc0, _kref+0x11b8
	.word	0xa5b2814b	! t1_kref+0x11b4:   	edge32l	%o2, %o3, %l2
	.word	0xb6103ff4	! t1_kref+0x11b8:   	mov	0xfffffff4, %i3
	.word	0xa8bac009	! t1_kref+0x11bc:   	xnorcc	%o3, %o1, %l4
	.word	0xa9b4851a	! t1_kref+0x11c0:   	fcmpgt16	%f18, %f26, %l4
	.word	0xb1b6cdbc	! t1_kref+0x11c4:   	fxors	%f27, %f28, %f24
	.word	0xa9b58754	! t1_kref+0x11c8:   	fpack32	%f22, %f20, %f20
	.word	0xd220a02c	! t1_kref+0x11cc:   	st	%o1, [%g2 + 0x2c]
	.word	0xa9b48494	! t1_kref+0x11d0:   	fcmple32	%f18, %f20, %l4
	.word	0xafb60496	! t1_kref+0x11d4:   	fcmple32	%f24, %f22, %l7
	.word	0xa60a7df0	! t1_kref+0x11d8:   	and	%o1, -0x210, %l3
	.word	0xa9b6891c	! t1_kref+0x11dc:   	faligndata	%f26, %f28, %f20
	.word	0xe86e3fe0	! t1_kref+0x11e0:   	ldstub	[%i0 - 0x20], %l4
	.word	0xb1a708d2	! t1_kref+0x11e4:   	fsubd	%f28, %f18, %f24
	.word	0xabb3006c	! t1_kref+0x11e8:   	edge8ln	%o4, %o4, %l5
	.word	0x929a4009	! t1_kref+0x11ec:   	xorcc	%o1, %o1, %o1
	.word	0x9fc10000	! t1_kref+0x11f0:   	call	%g4
	.word	0xabb00f31	! t1_kref+0x11f4:   	fsrc2s	%f17, %f21
	.word	0xb1b60e80	! t1_kref+0x11f8:   	fsrc1	%f24, %f24
	.word	0xb1a0055e	! t1_kref+0x11fc:   	fsqrtd	%f30, %f24
	.word	0xe9062014	! t1_kref+0x1200:   	ld	[%i0 + 0x14], %f20
	.word	0xad23000a	! t1_kref+0x1204:   	mulscc	%o4, %o2, %l6
	.word	0x91b280ab	! t1_kref+0x1208:   	edge16n	%o2, %o3, %o0
	.word	0xa9a0003c	! t1_kref+0x120c:   	fmovs	%f28, %f20
	.word	0xb1b5cdba	! t1_kref+0x1210:   	fxors	%f23, %f26, %f24
	.word	0x38480008	! t1_kref+0x1214:   	bgu,a,pt	%icc, _kref+0x1234
	.word	0xa9b00c00	! t1_kref+0x1218:   	fzero	%f20
	.word	0xb1a0193e	! t1_kref+0x121c:   	fstod	%f30, %f24
	.word	0xaed3000b	! t1_kref+0x1220:   	umulcc	%o4, %o3, %l7
	.word	0xd3f61009	! t1_kref+0x1224:   	casxa	[%i0]0x80, %o1, %o1
	.word	0xb9a01a3b	! t1_kref+0x1228:   	fstoi	%f27, %f28
	.word	0xa5b4899a	! t1_kref+0x122c:   	bshuffle	%f18, %f26, %f18
	.word	0xd010a02e	! t1_kref+0x1230:   	lduh	[%g2 + 0x2e], %o0
	.word	0xada70d34	! t1_kref+0x1234:   	fsmuld	%f28, %f20, %f22
	.word	0xa7a448b4	! t1_kref+0x1238:   	fsubs	%f17, %f20, %f19
	.word	0xd820a024	! t1_kref+0x123c:   	st	%o4, [%g2 + 0x24]
	.word	0x86102003	! t1_kref+0x1240:   	mov	0x3, %g3
	.word	0x86a0e001	! t1_kref+0x1244:   	subcc	%g3, 1, %g3
	.word	0x22800017	! t1_kref+0x1248:   	be,a	_kref+0x12a4
	.word	0xa5b48d92	! t1_kref+0x124c:   	fxor	%f18, %f18, %f18
	.word	0xf93e2000	! t1_kref+0x1250:   	std	%f28, [%i0]
	.word	0xadb58d14	! t1_kref+0x1254:   	fandnot1	%f22, %f20, %f22
	.word	0x92d33916	! t1_kref+0x1258:   	umulcc	%o4, -0x6ea, %o1
	.word	0xe968a0c2	! t1_kref+0x125c:   	prefetch	%g2 + 0xc2, 20
	.word	0xaa3ac009	! t1_kref+0x1260:   	xnor	%o3, %o1, %l5
	.word	0xd46e001a	! t1_kref+0x1264:   	ldstub	[%i0 + %i2], %o2
	.word	0xa4fa800a	! t1_kref+0x1268:   	sdivcc	%o2, %o2, %l2
	.word	0xb5a0191c	! t1_kref+0x126c:   	fitod	%f28, %f26
	.word	0xb5b507d8	! t1_kref+0x1270:   	pdist	%f20, %f24, %f26
	.word	0xd0180018	! t1_kref+0x1274:   	ldd	[%g0 + %i0], %o0
	.word	0xb9a018dc	! t1_kref+0x1278:   	fdtos	%f28, %f28
	.word	0x81aeca36	! t1_kref+0x127c:   	fcmps	%fcc0, %f27, %f22
	.word	0xec10a016	! t1_kref+0x1280:   	lduh	[%g2 + 0x16], %l6
	.word	0xd43e6018	! t1_kref+0x1284:   	std	%o2, [%i1 + 0x18]
	.word	0x9fc10000	! t1_kref+0x1288:   	call	%g4
	.word	0xb1b5cdf3	! t1_kref+0x128c:   	fnands	%f23, %f19, %f24
	.word	0xec1e001d	! t1_kref+0x1290:   	ldd	[%i0 + %i5], %l6
	.word	0xedee501a	! t1_kref+0x1294:   	prefetcha	%i1 + %i2, 22
	.word	0xafb6ce7a	! t1_kref+0x1298:   	fxnors	%f27, %f26, %f23
	.word	0xb1b68f96	! t1_kref+0x129c:   	for	%f26, %f22, %f24
	.word	0x9202800a	! t1_kref+0x12a0:   	add	%o2, %o2, %o1
	.word	0xe6480019	! t1_kref+0x12a4:   	ldsb	[%g0 + %i1], %l3
	.word	0xaa7328b2	! t1_kref+0x12a8:   	udiv	%o4, 0x8b2, %l5
	.word	0xb7a0189e	! t1_kref+0x12ac:   	fitos	%f30, %f27
	.word	0xa7a0189c	! t1_kref+0x12b0:   	fitos	%f28, %f19
	.word	0xab3a400b	! t1_kref+0x12b4:   	sra	%o1, %o3, %l5
	.word	0xb3a5c939	! t1_kref+0x12b8:   	fmuls	%f23, %f25, %f25
	.word	0x9fc10000	! t1_kref+0x12bc:   	call	%g4
	.word	0xe96e401d	! t1_kref+0x12c0:   	prefetch	%i1 + %i5, 20
	.word	0xa803000a	! t1_kref+0x12c4:   	add	%o4, %o2, %l4
	.word	0xad640009	! t1_kref+0x12c8:   	movn	%icc, %o1, %l6
	.word	0xa5a4085e	! t1_kref+0x12cc:   	faddd	%f16, %f30, %f18
	.word	0xf1be5a1d	! t1_kref+0x12d0:   	stda	%f24, [%i1 + %i5]0xd0
	.word	0xe84e6007	! t1_kref+0x12d4:   	ldsb	[%i1 + 7], %l4
	.word	0xbba01a54	! t1_kref+0x12d8:   	fdtoi	%f20, %f29
	call	SYM(t1_subr2)
	.word	0xb7a5893d	! t1_kref+0x12e0:   	fmuls	%f22, %f29, %f27
	.word	0xa8a3000c	! t1_kref+0x12e4:   	subcc	%o4, %o4, %l4
	.word	0xae9a6a49	! t1_kref+0x12e8:   	xorcc	%o1, 0xa49, %l7
	.word	0x9032400b	! t1_kref+0x12ec:   	orn	%o1, %o3, %o0
	.word	0x2e480008	! t1_kref+0x12f0:   	bvs,a,pt	%icc, _kref+0x1310
	.word	0xaba01891	! t1_kref+0x12f4:   	fitos	%f17, %f21
	.word	0xf1ee101d	! t1_kref+0x12f8:   	prefetcha	%i0 + %i5, 24
	.word	0xfbee101a	! t1_kref+0x12fc:   	prefetcha	%i0 + %i2, 29
	.word	0xb5a0055c	! t1_kref+0x1300:   	fsqrtd	%f28, %f26
	.word	0xe640a01c	! t1_kref+0x1304:   	ldsw	[%g2 + 0x1c], %l3
	.word	0x907b000a	! t1_kref+0x1308:   	sdiv	%o4, %o2, %o0
	.word	0xa5a78d38	! t1_kref+0x130c:   	fsmuld	%f30, %f24, %f18
	.word	0xae7ac00b	! t1_kref+0x1310:   	sdiv	%o3, %o3, %l7
	.word	0xd0be1000	! t1_kref+0x1314:   	stda	%o0, [%i0]0x80
	.word	0x81ae0a5a	! t1_kref+0x1318:   	fcmpd	%fcc0, %f24, %f26
	.word	0xb5a78d3d	! t1_kref+0x131c:   	fsmuld	%f30, %f29, %f26
	.word	0xa7b00f32	! t1_kref+0x1320:   	fsrc2s	%f18, %f19
	.word	0xe450a016	! t1_kref+0x1324:   	ldsh	[%g2 + 0x16], %l2
	.word	0xa5a0191b	! t1_kref+0x1328:   	fitod	%f27, %f18
	.word	0xe8070018	! t1_kref+0x132c:   	ld	[%i4 + %i0], %l4
	.word	0xd4363fe8	! t1_kref+0x1330:   	sth	%o2, [%i0 - 0x18]
	.word	0xd630a00c	! t1_kref+0x1334:   	sth	%o3, [%g2 + 0xc]
	.word	0xbba508b3	! t1_kref+0x1338:   	fsubs	%f20, %f19, %f29
	.word	0xacab0009	! t1_kref+0x133c:   	andncc	%o4, %o1, %l6
	.word	0x23800004	! t1_kref+0x1340:   	fbne,a	_kref+0x1350
	.word	0xe6164000	! t1_kref+0x1344:   	lduh	[%i1], %l3
	.word	0xa9b6871b	! t1_kref+0x1348:   	fmuld8sux16	%f26, %f27, %f20
	.word	0x81ac8a38	! t1_kref+0x134c:   	fcmps	%fcc0, %f18, %f24
	.word	0x87802082	! t1_kref+0x1350:   	mov	0x82, %asi
	.word	0xa9a64d36	! t1_kref+0x1354:   	fsmuld	%f25, %f22, %f20
	.word	0xb1b48c9a	! t1_kref+0x1358:   	fandnot2	%f18, %f26, %f24
	.word	0xaf2ac00c	! t1_kref+0x135c:   	sll	%o3, %o4, %l7
	.word	0xa53b2002	! t1_kref+0x1360:   	sra	%o4, 0x2, %l2
	.word	0xfd3e3ff8	! t1_kref+0x1364:   	std	%f30, [%i0 - 8]
	.word	0x913b000c	! t1_kref+0x1368:   	sra	%o4, %o4, %o0
	.word	0xec5e7ff8	! t1_kref+0x136c:   	ldx	[%i1 - 8], %l6
	.word	0xc36e000a	! t1_kref+0x1370:   	prefetch	%i0 + %o2, 1
	.word	0xb1a64d33	! t1_kref+0x1374:   	fsmuld	%f25, %f19, %f24
	.word	0xd7e6500b	! t1_kref+0x1378:   	casa	[%i1]0x80, %o3, %o3
	.word	0xa3a00136	! t1_kref+0x137c:   	fabss	%f22, %f17
	.word	0xd620a03c	! t1_kref+0x1380:   	st	%o3, [%g2 + 0x3c]
	.word	0xa9b2c00b	! t1_kref+0x1384:   	edge8	%o3, %o3, %l4
	.word	0x933ae01e	! t1_kref+0x1388:   	sra	%o3, 0x1e, %o1
	.word	0x9fc10000	! t1_kref+0x138c:   	call	%g4
	.word	0xee5e6008	! t1_kref+0x1390:   	ldx	[%i1 + 8], %l7
	.word	0xa832eff4	! t1_kref+0x1394:   	orn	%o3, 0xff4, %l4
	.word	0xfb20a014	! t1_kref+0x1398:   	st	%f29, [%g2 + 0x14]
	.word	0xe9266004	! t1_kref+0x139c:   	st	%f20, [%i1 + 4]
	.word	0xbba01891	! t1_kref+0x13a0:   	fitos	%f17, %f29
	.word	0xf5380018	! t1_kref+0x13a4:   	std	%f26, [%g0 + %i0]
	.word	0xe64e401a	! t1_kref+0x13a8:   	ldsb	[%i1 + %i2], %l3
	.word	0xd420a024	! t1_kref+0x13ac:   	st	%o2, [%g2 + 0x24]
	.word	0xf100a034	! t1_kref+0x13b0:   	ld	[%g2 + 0x34], %f24
	.word	0xe64e3ffe	! t1_kref+0x13b4:   	ldsb	[%i0 - 2], %l3
	.word	0xfb263ff0	! t1_kref+0x13b8:   	st	%f29, [%i0 - 0x10]
	.word	0x26480006	! t1_kref+0x13bc:   	bl,a,pt	%icc, _kref+0x13d4
	.word	0xd2d6d018	! t1_kref+0x13c0:   	ldsha	[%i3 + %i0]0x80, %o1
	.word	0xaed2800a	! t1_kref+0x13c4:   	umulcc	%o2, %o2, %l7
	.word	0xb5a70950	! t1_kref+0x13c8:   	fmuld	%f28, %f16, %f26
	.word	0xa9a0013c	! t1_kref+0x13cc:   	fabss	%f28, %f20
	.word	0xa47ab075	! t1_kref+0x13d0:   	sdiv	%o2, -0xf8b, %l2
	.word	0xadb68d40	! t1_kref+0x13d4:   	fnot1	%f26, %f22
	.word	0xeb06601c	! t1_kref+0x13d8:   	ld	[%i1 + 0x1c], %f21
	.word	0xb1a01894	! t1_kref+0x13dc:   	fitos	%f20, %f24
	.word	0x92226db8	! t1_kref+0x13e0:   	sub	%o1, 0xdb8, %o1
	.word	0xe81f4018	! t1_kref+0x13e4:   	ldd	[%i5 + %i0], %l4
	.word	0x9232e106	! t1_kref+0x13e8:   	orn	%o3, 0x106, %o1
	.word	0xbda60856	! t1_kref+0x13ec:   	faddd	%f24, %f22, %f30
	.word	0xd01e001d	! t1_kref+0x13f0:   	ldd	[%i0 + %i5], %o0
	.word	0xec50a016	! t1_kref+0x13f4:   	ldsh	[%g2 + 0x16], %l6
	.word	0xaa3a400b	! t1_kref+0x13f8:   	xnor	%o1, %o3, %l5
	.word	0xb1a0055e	! t1_kref+0x13fc:   	fsqrtd	%f30, %f24
	.word	0xee4e401a	! t1_kref+0x1400:   	ldsb	[%i1 + %i2], %l7
	.word	0xcc38001d	! t1_kref+0x1404:   	std	%g6, [%g0 + %i5]
	.word	0xb5a0189d	! t1_kref+0x1408:   	fitos	%f29, %f26
	.word	0x81ae0a52	! t1_kref+0x140c:   	fcmpd	%fcc0, %f24, %f18
	.word	0xd820a03c	! t1_kref+0x1410:   	st	%o4, [%g2 + 0x3c]
	.word	0xabb6051e	! t1_kref+0x1414:   	fcmpgt16	%f24, %f30, %l5
	.word	0x9292400b	! t1_kref+0x1418:   	orcc	%o1, %o3, %o1
	.word	0x86102002	! t1_kref+0x141c:   	mov	0x2, %g3
	.word	0x32800000	! t1_kref+0x1420:   	bne,a	_kref+0x1420
	.word	0x86a0e001	! t1_kref+0x1424:   	subcc	%g3, 1, %g3
	.word	0x81ad8a5e	! t1_kref+0x1428:   	fcmpd	%fcc0, %f22, %f30
	.word	0xd0480019	! t1_kref+0x142c:   	ldsb	[%g0 + %i1], %o0
	.word	0xada6085a	! t1_kref+0x1430:   	faddd	%f24, %f26, %f22
	.word	0xae22c009	! t1_kref+0x1434:   	sub	%o3, %o1, %l7
	.word	0x90fae402	! t1_kref+0x1438:   	sdivcc	%o3, 0x402, %o0
	.word	0xae227037	! t1_kref+0x143c:   	sub	%o1, -0xfc9, %l7
	.word	0xa5a0053e	! t1_kref+0x1440:   	fsqrts	%f30, %f18
	.word	0xa1b58714	! t1_kref+0x1444:   	fmuld8sux16	%f22, %f20, %f16
	.word	0xb7a0053e	! t1_kref+0x1448:   	fsqrts	%f30, %f27
	.word	0xd43e7fe8	! t1_kref+0x144c:   	std	%o2, [%i1 - 0x18]
	.word	0x28480007	! t1_kref+0x1450:   	bleu,a,pt	%icc, _kref+0x146c
	.word	0xadb54f71	! t1_kref+0x1454:   	fornot1s	%f21, %f17, %f22
	.word	0xa9a608da	! t1_kref+0x1458:   	fsubd	%f24, %f26, %f20
	.word	0x91b2412b	! t1_kref+0x145c:   	edge32n	%o1, %o3, %o0
	.word	0x928ab1ca	! t1_kref+0x1460:   	andcc	%o2, -0xe36, %o1
	.word	0xd820a03c	! t1_kref+0x1464:   	st	%o4, [%g2 + 0x3c]
	.word	0x29800002	! t1_kref+0x1468:   	fbl,a	_kref+0x1470
	.word	0xa5b686ba	! t1_kref+0x146c:   	fmul8x16al	%f26, %f26, %f18
	.word	0x927a7d0d	! t1_kref+0x1470:   	sdiv	%o1, -0x2f3, %o1
	.word	0xaaf33358	! t1_kref+0x1474:   	udivcc	%o4, -0xca8, %l5
	.word	0xe8167fe6	! t1_kref+0x1478:   	lduh	[%i1 - 0x1a], %l4
	.word	0xf56e2000	! t1_kref+0x147c:   	prefetch	%i0, 26
	.word	0xe36e6018	! t1_kref+0x1480:   	prefetch	%i1 + 0x18, 17
	.word	0xc5ee500b	! t1_kref+0x1484:   	prefetcha	%i1 + %o3, 2
	.word	0xbdb6c71c	! t1_kref+0x1488:   	fmuld8sux16	%f27, %f28, %f30
	.word	0x90c3000a	! t1_kref+0x148c:   	addccc	%o4, %o2, %o0
	.word	0xac92c00c	! t1_kref+0x1490:   	orcc	%o3, %o4, %l6
	.word	0xb5a01a33	! t1_kref+0x1494:   	fstoi	%f19, %f26
	.word	0xd2367fe6	! t1_kref+0x1498:   	sth	%o1, [%i1 - 0x1a]
	.word	0xa92a8009	! t1_kref+0x149c:   	sll	%o2, %o1, %l4
	.word	0xacb2abf2	! t1_kref+0x14a0:   	orncc	%o2, 0xbf2, %l6
	.word	0xfd981018	! t1_kref+0x14a4:   	ldda	[%g0 + %i0]0x80, %f30
	.word	0xadb5c71d	! t1_kref+0x14a8:   	fmuld8sux16	%f23, %f29, %f22
	.word	0x8143c000	! t1_kref+0x14ac:   	stbar
	.word	0x25480008	! t1_kref+0x14b0:   	fblg,a,pt	%fcc0, _kref+0x14d0
	.word	0xada00556	! t1_kref+0x14b4:   	fsqrtd	%f22, %f22
	call	SYM(t1_subr1)
	.word	0xa6b2800a	! t1_kref+0x14bc:   	orncc	%o2, %o2, %l3
	.word	0xa7a01a3d	! t1_kref+0x14c0:   	fstoi	%f29, %f19
	.word	0x29480004	! t1_kref+0x14c4:   	fbl,a,pt	%fcc0, _kref+0x14d4
	.word	0xd236601c	! t1_kref+0x14c8:   	sth	%o1, [%i1 + 0x1c]
	.word	0xac226a3c	! t1_kref+0x14cc:   	sub	%o1, 0xa3c, %l6
	.word	0xbda4cd3c	! t1_kref+0x14d0:   	fsmuld	%f19, %f28, %f30
	.word	0xacb33a93	! t1_kref+0x14d4:   	orncc	%o4, -0x56d, %l6
	.word	0xac9ac009	! t1_kref+0x14d8:   	xorcc	%o3, %o1, %l6
	.word	0x9062717f	! t1_kref+0x14dc:   	subc	%o1, -0xe81, %o0
	.word	0xadb58f54	! t1_kref+0x14e0:   	fornot1	%f22, %f20, %f22
	.word	0xadb486b5	! t1_kref+0x14e4:   	fmul8x16al	%f18, %f21, %f22
	.word	0xc807bfe8	! t1_kref+0x14e8:   	ld	[%fp - 0x18], %g4
	.word	0xa5b48dda	! t1_kref+0x14ec:   	fnand	%f18, %f26, %f18
	.word	0xa9a688b2	! t1_kref+0x14f0:   	fsubs	%f26, %f18, %f20
	.word	0xf786101c	! t1_kref+0x14f4:   	lda	[%i0 + %i4]0x80, %f27
	.word	0xa5a01a31	! t1_kref+0x14f8:   	fstoi	%f17, %f18
	.word	0xed267ff8	! t1_kref+0x14fc:   	st	%f22, [%i1 - 8]
	.word	0x86102002	! t1_kref+0x1500:   	mov	0x2, %g3
	.word	0x32800000	! t1_kref+0x1504:   	bne,a	_kref+0x1504
	.word	0x86a0e001	! t1_kref+0x1508:   	subcc	%g3, 1, %g3
	.word	0xe808a01d	! t1_kref+0x150c:   	ldub	[%g2 + 0x1d], %l4
	.word	0xaebaf68f	! t1_kref+0x1510:   	xnorcc	%o3, -0x971, %l7
	.word	0xafb30240	! t1_kref+0x1514:   	array16	%o4, %g0, %l7
	.word	0xfd260000	! t1_kref+0x1518:   	st	%f30, [%i0]
	.word	0xa6db000c	! t1_kref+0x151c:   	smulcc	%o4, %o4, %l3
	.word	0x81ae0a58	! t1_kref+0x1520:   	fcmpd	%fcc0, %f24, %f24
	.word	0xafb58db4	! t1_kref+0x1524:   	fxors	%f22, %f20, %f23
	.word	0xd2060000	! t1_kref+0x1528:   	ld	[%i0], %o1
	.word	0x933a4009	! t1_kref+0x152c:   	sra	%o1, %o1, %o1
	.word	0x001fffff	! t1_kref+0x1530:   	illtrap	0x1fffff
	.word	0xd2883fec	! t1_kref+0x1534:   	lduba	[%g0 - 0x14]%asi, %o1
	.word	0x9fc00004	! t1_kref+0x1538:   	call	%g0 + %g4
	.word	0x251256b0	! t1_kref+0x153c:   	sethi	%hi(0x495ac000), %l2
	.word	0xada0015c	! t1_kref+0x1540:   	fabsd	%f28, %f22
	.word	0xa3a448bd	! t1_kref+0x1544:   	fsubs	%f17, %f29, %f17
	.word	0xd230a024	! t1_kref+0x1548:   	sth	%o1, [%g2 + 0x24]
	.word	0xb9b50f9e	! t1_kref+0x154c:   	for	%f20, %f30, %f28
	.word	0x9fc00004	! t1_kref+0x1550:   	call	%g0 + %g4
	.word	0xa8bb36b5	! t1_kref+0x1554:   	xnorcc	%o4, -0x94b, %l4
	.word	0x86102007	! t1_kref+0x1558:   	mov	0x7, %g3
	.word	0x86a0e001	! t1_kref+0x155c:   	subcc	%g3, 1, %g3
	.word	0x22800008	! t1_kref+0x1560:   	be,a	_kref+0x1580
	.word	0xacd2edbc	! t1_kref+0x1564:   	umulcc	%o3, 0xdbc, %l6
	.word	0xa9a01931	! t1_kref+0x1568:   	fstod	%f17, %f20
	.word	0xae02c009	! t1_kref+0x156c:   	add	%o3, %o1, %l7
	.word	0xadb68ddc	! t1_kref+0x1570:   	fnand	%f26, %f28, %f22
	.word	0xa5a0191c	! t1_kref+0x1574:   	fitod	%f28, %f18
	.word	0x304ffff9	! t1_kref+0x1578:   	ba,a,pt	%icc, _kref+0x155c
	.word	0xe9be588b	! t1_kref+0x157c:   	stda	%f20, [%i1 + %o3]0xc4
	.word	0xec060000	! t1_kref+0x1580:   	ld	[%i0], %l6
	.word	0xed267fec	! t1_kref+0x1584:   	st	%f22, [%i1 - 0x14]
	.word	0xd3f6100b	! t1_kref+0x1588:   	casxa	[%i0]0x80, %o3, %o1
	.word	0xa5b2810a	! t1_kref+0x158c:   	edge32	%o2, %o2, %l2
	.word	0xc807bfe4	! t1_kref+0x1590:   	ld	[%fp - 0x1c], %g4
	.word	0xaed2f002	! t1_kref+0x1594:   	umulcc	%o3, -0xffe, %l7
	.word	0xacf33ca7	! t1_kref+0x1598:   	udivcc	%o4, -0x359, %l6
	.word	0xc9ee500c	! t1_kref+0x159c:   	prefetcha	%i1 + %o4, 4
	.word	0xfd801018	! t1_kref+0x15a0:   	lda	[%g0 + %i0]0x80, %f30
	.word	0xef68a0cc	! t1_kref+0x15a4:   	prefetch	%g2 + 0xcc, 23
	.word	0xb3a01a56	! t1_kref+0x15a8:   	fdtoi	%f22, %f25
	.word	0x3a480004	! t1_kref+0x15ac:   	bcc,a,pt	%icc, _kref+0x15bc
	.word	0xa602a8e0	! t1_kref+0x15b0:   	add	%o2, 0x8e0, %l3
	.word	0xe19e1000	! t1_kref+0x15b4:   	ldda	[%i0]0x80, %f16
	.word	0xad3b000c	! t1_kref+0x15b8:   	sra	%o4, %o4, %l6
	.word	0x9012b65a	! t1_kref+0x15bc:   	or	%o2, -0x9a6, %o0
	.word	0x90b24009	! t1_kref+0x15c0:   	orncc	%o1, %o1, %o0
	.word	0xe84e7fea	! t1_kref+0x15c4:   	ldsb	[%i1 - 0x16], %l4
	.word	0xe16e401a	! t1_kref+0x15c8:   	prefetch	%i1 + %i2, 16
	.word	0xb9a00554	! t1_kref+0x15cc:   	fsqrtd	%f20, %f28
	.word	0xada00550	! t1_kref+0x15d0:   	fsqrtd	%f16, %f22
	.word	0xa4faa874	! t1_kref+0x15d4:   	sdivcc	%o2, 0x874, %l2
	.word	0xa6aae041	! t1_kref+0x15d8:   	andncc	%o3, 0x41, %l3
	.word	0x91b2832b	! t1_kref+0x15dc:   	bmask	%o2, %o3, %o0
	.word	0xa7b7051e	! t1_kref+0x15e0:   	fcmpgt16	%f28, %f30, %l3
	.word	0xe320a024	! t1_kref+0x15e4:   	st	%f17, [%g2 + 0x24]
	.word	0xa6fab493	! t1_kref+0x15e8:   	sdivcc	%o2, -0xb6d, %l3
	.word	0x9292400a	! t1_kref+0x15ec:   	orcc	%o1, %o2, %o1
	.word	0x22480006	! t1_kref+0x15f0:   	be,a,pt	%icc, _kref+0x1608
	.word	0x922a400b	! t1_kref+0x15f4:   	andn	%o1, %o3, %o1
	.word	0xebee101c	! t1_kref+0x15f8:   	prefetcha	%i0 + %i4, 21
	.word	0xa832800b	! t1_kref+0x15fc:   	orn	%o2, %o3, %l4
	.word	0xb9a01a35	! t1_kref+0x1600:   	fstoi	%f21, %f28
	.word	0x90faa9b6	! t1_kref+0x1604:   	sdivcc	%o2, 0x9b6, %o0
	.word	0xa83b000b	! t1_kref+0x1608:   	xnor	%o4, %o3, %l4
	.word	0x31800004	! t1_kref+0x160c:   	fba,a	_kref+0x161c
	.word	0xafa00532	! t1_kref+0x1610:   	fsqrts	%f18, %f23
	.word	0xacc2a19f	! t1_kref+0x1614:   	addccc	%o2, 0x19f, %l6
	.word	0x922b000b	! t1_kref+0x1618:   	andn	%o4, %o3, %o1
	.word	0x81af0a5a	! t1_kref+0x161c:   	fcmpd	%fcc0, %f28, %f26
	.word	0xafb50558	! t1_kref+0x1620:   	fcmpeq16	%f20, %f24, %l7
	.word	0xb5a7885a	! t1_kref+0x1624:   	faddd	%f30, %f26, %f26
	.word	0x2b480006	! t1_kref+0x1628:   	fbug,a,pt	%fcc0, _kref+0x1640
	.word	0xd830a036	! t1_kref+0x162c:   	sth	%o4, [%g2 + 0x36]
	.word	0x92fab7ba	! t1_kref+0x1630:   	sdivcc	%o2, -0x846, %o1
	.word	0x9344c000	! t1_kref+0x1634:   	mov	%gsr, %o1
	.word	0xbba48932	! t1_kref+0x1638:   	fmuls	%f18, %f18, %f29
	.word	0x31480008	! t1_kref+0x163c:   	fba,a,pt	%fcc0, _kref+0x165c
	.word	0xd428a035	! t1_kref+0x1640:   	stb	%o2, [%g2 + 0x35]
	.word	0xa9a489da	! t1_kref+0x1644:   	fdivd	%f18, %f26, %f20
	.word	0xb1a9803b	! t1_kref+0x1648:   	fmovsg	%fcc0, %f27, %f24
	.word	0xb5a01a52	! t1_kref+0x164c:   	fdtoi	%f18, %f26
	.word	0xa5b3008a	! t1_kref+0x1650:   	edge16	%o4, %o2, %l2
	.word	0x91232aa3	! t1_kref+0x1654:   	mulscc	%o4, 0xaa3, %o0
	.word	0x37800003	! t1_kref+0x1658:   	fbge,a	_kref+0x1664
	.word	0xa7a609b8	! t1_kref+0x165c:   	fdivs	%f24, %f24, %f19
	.word	0xe968a00d	! t1_kref+0x1660:   	prefetch	%g2 + 0xd, 20
	.word	0xa63aaadd	! t1_kref+0x1664:   	xnor	%o2, 0xadd, %l3
	.word	0xec8e1000	! t1_kref+0x1668:   	lduba	[%i0]0x80, %l6
	.word	0xe53e3fe8	! t1_kref+0x166c:   	std	%f18, [%i0 - 0x18]
	.word	0x912aa000	! t1_kref+0x1670:   	sll	%o2, 0x0, %o0
	.word	0xab22e201	! t1_kref+0x1674:   	mulscc	%o3, 0x201, %l5
	.word	0xd230a03e	! t1_kref+0x1678:   	sth	%o1, [%g2 + 0x3e]
	.word	0xb9a5895e	! t1_kref+0x167c:   	fmuld	%f22, %f30, %f28
	.word	0xb5a0191b	! t1_kref+0x1680:   	fitod	%f27, %f26
	.word	0xd820a00c	! t1_kref+0x1684:   	st	%o4, [%g2 + 0xc]
	.word	0xf11e001d	! t1_kref+0x1688:   	ldd	[%i0 + %i5], %f24
	.word	0xbda489b3	! t1_kref+0x168c:   	fdivs	%f18, %f19, %f30
	.word	0xf900a01c	! t1_kref+0x1690:   	ld	[%g2 + 0x1c], %f28
	.word	0xc12e401c	! t1_kref+0x1694:   	st	%fsr, [%i1 + %i4]
	.word	0xfdee501d	! t1_kref+0x1698:   	prefetcha	%i1 + %i5, 30
	.word	0xabb240ec	! t1_kref+0x169c:   	edge16ln	%o1, %o4, %l5
	.word	0xee060000	! t1_kref+0x16a0:   	ld	[%i0], %l7
	.word	0xafb2400a	! t1_kref+0x16a4:   	edge8	%o1, %o2, %l7
	.word	0xa8b33e18	! t1_kref+0x16a8:   	orncc	%o4, -0x1e8, %l4
	.word	0xaec2f23c	! t1_kref+0x16ac:   	addccc	%o3, -0xdc4, %l7
	.word	0xede6100c	! t1_kref+0x16b0:   	casa	[%i0]0x80, %o4, %l6
	.word	0xd8a81019	! t1_kref+0x16b4:   	stba	%o4, [%g0 + %i1]0x80
	.word	0xa9b58e5c	! t1_kref+0x16b8:   	fxnor	%f22, %f28, %f20
	.word	0xabb00f39	! t1_kref+0x16bc:   	fsrc2s	%f25, %f21
	.word	0xac3b3a84	! t1_kref+0x16c0:   	xnor	%o4, -0x57c, %l6
	.word	0x25800003	! t1_kref+0x16c4:   	fblg,a	_kref+0x16d0
	.word	0xba102018	! t1_kref+0x16c8:   	mov	0x18, %i5
	.word	0x81ad8a3a	! t1_kref+0x16cc:   	fcmps	%fcc0, %f22, %f26
	.word	0xd430a034	! t1_kref+0x16d0:   	sth	%o2, [%g2 + 0x34]
	.word	0xaac2f38f	! t1_kref+0x16d4:   	addccc	%o3, -0xc71, %l5
	.word	0x81ae8ada	! t1_kref+0x16d8:   	fcmped	%fcc0, %f26, %f26
	.word	0xab400000	! t1_kref+0x16dc:   	mov	%y, %l5
	.word	0xf93e3ff8	! t1_kref+0x16e0:   	std	%f28, [%i0 - 8]
	.word	0xb5b60e5a	! t1_kref+0x16e4:   	fxnor	%f24, %f26, %f26
	.word	0x35480002	! t1_kref+0x16e8:   	fbue,a,pt	%fcc0, _kref+0x16f0
	.word	0xac1b3583	! t1_kref+0x16ec:   	xor	%o4, -0xa7d, %l6
	.word	0xed063fe4	! t1_kref+0x16f0:   	ld	[%i0 - 0x1c], %f22
	.word	0x8610201a	! t1_kref+0x16f4:   	mov	0x1a, %g3
	.word	0x86a0e001	! t1_kref+0x16f8:   	subcc	%g3, 1, %g3
	.word	0x2280001a	! t1_kref+0x16fc:   	be,a	_kref+0x1764
	.word	0xa7a0003c	! t1_kref+0x1700:   	fmovs	%f28, %f19
	.word	0xd2363ffc	! t1_kref+0x1704:   	sth	%o1, [%i0 - 4]
	.word	0x91b2c12c	! t1_kref+0x1708:   	edge32n	%o3, %o4, %o0
	.word	0xd820a014	! t1_kref+0x170c:   	st	%o4, [%g2 + 0x14]
	.word	0xecd01019	! t1_kref+0x1710:   	ldsha	[%g0 + %i1]0x80, %l6
	.word	0x274ffff9	! t1_kref+0x1714:   	fbul,a,pt	%fcc0, _kref+0x16f8
	.word	0x91400000	! t1_kref+0x1718:   	mov	%y, %o0
	.word	0xa9a00556	! t1_kref+0x171c:   	fsqrtd	%f22, %f20
	.word	0x900327f1	! t1_kref+0x1720:   	add	%o4, 0x7f1, %o0
	.word	0xacfb000a	! t1_kref+0x1724:   	sdivcc	%o4, %o2, %l6
	.word	0xb9a60838	! t1_kref+0x1728:   	fadds	%f24, %f24, %f28
	.word	0xa65b0009	! t1_kref+0x172c:   	smul	%o4, %o1, %l3
	.word	0xf53e7fe0	! t1_kref+0x1730:   	std	%f26, [%i1 - 0x20]
	.word	0xad3a6000	! t1_kref+0x1734:   	sra	%o1, 0x0, %l6
	.word	0xd2067fec	! t1_kref+0x1738:   	ld	[%i1 - 0x14], %o1
	.word	0x90f2c009	! t1_kref+0x173c:   	udivcc	%o3, %o1, %o0
	.word	0xf9270018	! t1_kref+0x1740:   	st	%f28, [%i4 + %i0]
	.word	0xbba00537	! t1_kref+0x1744:   	fsqrts	%f23, %f29
	.word	0x33480007	! t1_kref+0x1748:   	fbe,a,pt	%fcc0, _kref+0x1764
	.word	0xb5a70852	! t1_kref+0x174c:   	faddd	%f28, %f18, %f26
	.word	0xee00a02c	! t1_kref+0x1750:   	ld	[%g2 + 0x2c], %l7
	.word	0xd220a03c	! t1_kref+0x1754:   	st	%o1, [%g2 + 0x3c]
	.word	0x2f26f653	! t1_kref+0x1758:   	sethi	%hi(0x9bd94c00), %l7
	.word	0xab0afcf1	! t1_kref+0x175c:   	tsubcc	%o3, -0x30f, %l5
	.word	0x9fc10000	! t1_kref+0x1760:   	call	%g4
	.word	0xe720a034	! t1_kref+0x1764:   	st	%f19, [%g2 + 0x34]
	.word	0xafa00036	! t1_kref+0x1768:   	fmovs	%f22, %f23
	.word	0x909afcd3	! t1_kref+0x176c:   	xorcc	%o3, -0x32d, %o0
	.word	0x932a400a	! t1_kref+0x1770:   	sll	%o1, %o2, %o1
	.word	0x86102003	! t1_kref+0x1774:   	mov	0x3, %g3
	.word	0x32800000	! t1_kref+0x1778:   	bne,a	_kref+0x1778
	.word	0x86a0e001	! t1_kref+0x177c:   	subcc	%g3, 1, %g3
	.word	0xed6e3ff8	! t1_kref+0x1780:   	prefetch	%i0 - 8, 22
	.word	0x8143c000	! t1_kref+0x1784:   	stbar
	.word	0xac9a400c	! t1_kref+0x1788:   	xorcc	%o1, %o4, %l6
	.word	0x2a800006	! t1_kref+0x178c:   	bcs,a	_kref+0x17a4
	.word	0xacba76ee	! t1_kref+0x1790:   	xnorcc	%o1, -0x912, %l6
	.word	0xae5b000c	! t1_kref+0x1794:   	smul	%o4, %o4, %l7
	.word	0xa73ae00b	! t1_kref+0x1798:   	sra	%o3, 0xb, %l3
	.word	0xaada800a	! t1_kref+0x179c:   	smulcc	%o2, %o2, %l5
	.word	0xaed32841	! t1_kref+0x17a0:   	umulcc	%o4, 0x841, %l7
	.word	0x81ac0a58	! t1_kref+0x17a4:   	fcmpd	%fcc0, %f16, %f24
	call	SYM(t1_subr3)
	.word	0xa5b68498	! t1_kref+0x17ac:   	fcmple32	%f26, %f24, %l2
	.word	0xd828a02e	! t1_kref+0x17b0:   	stb	%o4, [%g2 + 0x2e]
	.word	0xa5a0003c	! t1_kref+0x17b4:   	fmovs	%f28, %f18
	.word	0xf3871018	! t1_kref+0x17b8:   	lda	[%i4 + %i0]0x80, %f25
	.word	0xe16e401a	! t1_kref+0x17bc:   	prefetch	%i1 + %i2, 16
	.word	0xe76e401d	! t1_kref+0x17c0:   	prefetch	%i1 + %i5, 19
	.word	0xb5a6493b	! t1_kref+0x17c4:   	fmuls	%f25, %f27, %f26
	.word	0xb5a488d8	! t1_kref+0x17c8:   	fsubd	%f18, %f24, %f26
	.word	0xf3ee501c	! t1_kref+0x17cc:   	prefetcha	%i1 + %i4, 25
	.word	0xe408a00e	! t1_kref+0x17d0:   	ldub	[%g2 + 0xe], %l2
	.word	0x33480004	! t1_kref+0x17d4:   	fbe,a,pt	%fcc0, _kref+0x17e4
	.word	0xa4c24009	! t1_kref+0x17d8:   	addccc	%o1, %o1, %l2
	.word	0xb5b00fc0	! t1_kref+0x17dc:   	fone	%f26
	.word	0x90aab4b0	! t1_kref+0x17e0:   	andncc	%o2, -0xb50, %o0
	.word	0x29800008	! t1_kref+0x17e4:   	fbl,a	_kref+0x1804
	.word	0xaba6c934	! t1_kref+0x17e8:   	fmuls	%f27, %f20, %f21
	.word	0xa89a800b	! t1_kref+0x17ec:   	xorcc	%o2, %o3, %l4
	.word	0xd0680018	! t1_kref+0x17f0:   	ldstub	[%g0 + %i0], %o0
	.word	0xa940c000	! t1_kref+0x17f4:   	mov	%asi, %l4
	.word	0xa8724009	! t1_kref+0x17f8:   	udiv	%o1, %o1, %l4
	.word	0xa63ac00b	! t1_kref+0x17fc:   	xnor	%o3, %o3, %l3
	.word	0xa61b000c	! t1_kref+0x1800:   	xor	%o4, %o4, %l3
	.word	0x8610200a	! t1_kref+0x1804:   	mov	0xa, %g3
	.word	0x86a0e001	! t1_kref+0x1808:   	subcc	%g3, 1, %g3
	.word	0x22800008	! t1_kref+0x180c:   	be,a	_kref+0x182c
	.word	0xb5b70f76	! t1_kref+0x1810:   	fornot1s	%f28, %f22, %f26
	.word	0xfd263ff0	! t1_kref+0x1814:   	st	%f30, [%i0 - 0x10]
	.word	0x81b01025	! t1_kref+0x1818:   	siam	0x5
	.word	0xd03e4000	! t1_kref+0x181c:   	std	%o0, [%i1]
	.word	0xd89e1000	! t1_kref+0x1820:   	ldda	[%i0]0x80, %o4
	.word	0xa6d2c009	! t1_kref+0x1824:   	umulcc	%o3, %o1, %l3
	.word	0xaa32400a	! t1_kref+0x1828:   	orn	%o1, %o2, %l5
	.word	0xc76e2008	! t1_kref+0x182c:   	prefetch	%i0 + 8, 3
	.word	0x35800007	! t1_kref+0x1830:   	fbue,a	_kref+0x184c
	.word	0xb1b54db1	! t1_kref+0x1834:   	fxors	%f21, %f17, %f24
	.word	0xad400000	! t1_kref+0x1838:   	mov	%y, %l6
	.word	0xed260000	! t1_kref+0x183c:   	st	%f22, [%i0]
	.word	0xd228a035	! t1_kref+0x1840:   	stb	%o1, [%g2 + 0x35]
	.word	0xaa1ae7eb	! t1_kref+0x1844:   	xor	%o3, 0x7eb, %l5
	.word	0xa1a4cd3b	! t1_kref+0x1848:   	fsmuld	%f19, %f27, %f16
	.word	0xaab2ee0f	! t1_kref+0x184c:   	orncc	%o3, 0xe0f, %l5
	.word	0xa6c2a642	! t1_kref+0x1850:   	addccc	%o2, 0x642, %l3
	.word	0xb3a608b9	! t1_kref+0x1854:   	fsubs	%f24, %f25, %f25
	.word	0xb1a48d39	! t1_kref+0x1858:   	fsmuld	%f18, %f25, %f24
	.word	0xa7400000	! t1_kref+0x185c:   	mov	%y, %l3
	.word	0xada589dc	! t1_kref+0x1860:   	fdivd	%f22, %f28, %f22
	.word	0xacd3000a	! t1_kref+0x1864:   	umulcc	%o4, %o2, %l6
	.word	0x3e800001	! t1_kref+0x1868:   	bvc,a	_kref+0x186c
	.word	0xd03e3fe0	! t1_kref+0x186c:   	std	%o0, [%i0 - 0x20]
	.word	0xadb00fe0	! t1_kref+0x1870:   	fones	%f22
	.word	0x90c2bf41	! t1_kref+0x1874:   	addccc	%o2, -0xbf, %o0
	.word	0xee070018	! t1_kref+0x1878:   	ld	[%i4 + %i0], %l7
	.word	0xb9a00034	! t1_kref+0x187c:   	fmovs	%f20, %f28
	.word	0xd828a01f	! t1_kref+0x1880:   	stb	%o4, [%g2 + 0x1f]
	.word	0xbda000b4	! t1_kref+0x1884:   	fnegs	%f20, %f30
	.word	0xaa7aa48e	! t1_kref+0x1888:   	sdiv	%o2, 0x48e, %l5
	.word	0xafa0189b	! t1_kref+0x188c:   	fitos	%f27, %f23
	.word	0xb6103ffe	! t1_kref+0x1890:   	mov	0xfffffffe, %i3
	.word	0x29800001	! t1_kref+0x1894:   	fbl,a	_kref+0x1898
	.word	0xaa02eb75	! t1_kref+0x1898:   	add	%o3, 0xb75, %l5
	.word	0xc36e400c	! t1_kref+0x189c:   	prefetch	%i1 + %o4, 1
	.word	0xed3e4000	! t1_kref+0x18a0:   	std	%f22, [%i1]
	.word	0xd41e2000	! t1_kref+0x18a4:   	ldd	[%i0], %o2
	.word	0xae92800c	! t1_kref+0x18a8:   	orcc	%o2, %o4, %l7
	.word	0xa9a01892	! t1_kref+0x18ac:   	fitos	%f18, %f20
	.word	0xc368a109	! t1_kref+0x18b0:   	prefetch	%g2 + 0x109, 1
	.word	0x20480008	! t1_kref+0x18b4:   	bn,a,pt	%icc, _kref+0x18d4
	.word	0xd428a025	! t1_kref+0x18b8:   	stb	%o2, [%g2 + 0x25]
	.word	0xb5b58d9c	! t1_kref+0x18bc:   	fxor	%f22, %f28, %f26
	.word	0xa67a4009	! t1_kref+0x18c0:   	sdiv	%o1, %o1, %l3
	.word	0x81ae0a56	! t1_kref+0x18c4:   	fcmpd	%fcc0, %f24, %f22
	.word	0xa60b28e4	! t1_kref+0x18c8:   	and	%o4, 0x8e4, %l3
	.word	0xe7000019	! t1_kref+0x18cc:   	ld	[%g0 + %i1], %f19
	.word	0x92dac00a	! t1_kref+0x18d0:   	smulcc	%o3, %o2, %o1
	.word	0xeb266014	! t1_kref+0x18d4:   	st	%f21, [%i1 + 0x14]
	.word	0xc3ee500b	! t1_kref+0x18d8:   	prefetcha	%i1 + %o3, 1
	.word	0xa8d3000b	! t1_kref+0x18dc:   	umulcc	%o4, %o3, %l4
	.word	0x24480003	! t1_kref+0x18e0:   	ble,a,pt	%icc, _kref+0x18ec
	.word	0xa4c2a3b8	! t1_kref+0x18e4:   	addccc	%o2, 0x3b8, %l2
	.word	0xb5b78996	! t1_kref+0x18e8:   	bshuffle	%f30, %f22, %f26
	.word	0xad3a400c	! t1_kref+0x18ec:   	sra	%o1, %o4, %l6
	.word	0x900a800c	! t1_kref+0x18f0:   	and	%o2, %o4, %o0
	.word	0xbda6cd3c	! t1_kref+0x18f4:   	fsmuld	%f27, %f28, %f30
	.word	0xbba0189a	! t1_kref+0x18f8:   	fitos	%f26, %f29
	.word	0xa6da400c	! t1_kref+0x18fc:   	smulcc	%o1, %o4, %l3
	.word	0x81dc2b29	! t1_kref+0x1900:   	flush	%l0 + 0xb29
	.word	0xada7883c	! t1_kref+0x1904:   	fadds	%f30, %f28, %f22
	.word	0xd2ee9019	! t1_kref+0x1908:   	ldstuba	[%i2 + %i1]0x80, %o1
	.word	0x921ae36c	! t1_kref+0x190c:   	xor	%o3, 0x36c, %o1
	.word	0xb9a018da	! t1_kref+0x1910:   	fdtos	%f26, %f28
	.word	0xa872618e	! t1_kref+0x1914:   	udiv	%o1, 0x18e, %l4
	.word	0xb9b50c94	! t1_kref+0x1918:   	fandnot2	%f20, %f20, %f28
	.word	0xe88e9059	! t1_kref+0x191c:   	lduba	[%i2 + %i1]0x82, %l4
	.word	0xadb3000c	! t1_kref+0x1920:   	edge8	%o4, %o4, %l6
	.word	0xad400000	! t1_kref+0x1924:   	mov	%y, %l6
	.word	0xd82e200d	! t1_kref+0x1928:   	stb	%o4, [%i0 + 0xd]
	.word	0xb9a789de	! t1_kref+0x192c:   	fdivd	%f30, %f30, %f28
	.word	0xb9a0003a	! t1_kref+0x1930:   	fmovs	%f26, %f28
	.word	0xa50aa146	! t1_kref+0x1934:   	tsubcc	%o2, 0x146, %l2
	.word	0xa7a50832	! t1_kref+0x1938:   	fadds	%f20, %f18, %f19
	.word	0xb5a6cd3a	! t1_kref+0x193c:   	fsmuld	%f27, %f26, %f26
	.word	0xa1b586d2	! t1_kref+0x1940:   	fmul8sux16	%f22, %f18, %f16
	.word	0xe84e001a	! t1_kref+0x1944:   	ldsb	[%i0 + %i2], %l4
	.word	0xd820a014	! t1_kref+0x1948:   	st	%o4, [%g2 + 0x14]
	.word	0xc807bfe8	! t1_kref+0x194c:   	ld	[%fp - 0x18], %g4
	.word	0x9fc00004	! t1_kref+0x1950:   	call	%g0 + %g4
	.word	0xb9b48ed8	! t1_kref+0x1954:   	fornot2	%f18, %f24, %f28
	.word	0xa432afb3	! t1_kref+0x1958:   	orn	%o2, 0xfb3, %l2
	.word	0xc56e7ff0	! t1_kref+0x195c:   	prefetch	%i1 - 0x10, 2
	.word	0xa3b6cdbc	! t1_kref+0x1960:   	fxors	%f27, %f28, %f17
	.word	0xacfab812	! t1_kref+0x1964:   	sdivcc	%o2, -0x7ee, %l6
	.word	0x9de3bfa0	! t1_kref+0x1968:   	save	%sp, -0x60, %sp
	.word	0xabeee6a3	! t1_kref+0x196c:   	restore	%i3, 0x6a3, %l5
	.word	0xe11fbea8	! t1_kref+0x1970:   	ldd	[%fp - 0x158], %f16
	.word	0xa872c00a	! t1_kref+0x1974:   	udiv	%o3, %o2, %l4
	.word	0xac9a8009	! t1_kref+0x1978:   	xorcc	%o2, %o1, %l6
	.word	0xaaaa6eab	! t1_kref+0x197c:   	andncc	%o1, 0xeab, %l5
	.word	0xd830a034	! t1_kref+0x1980:   	sth	%o4, [%g2 + 0x34]
	.word	0x9232400c	! t1_kref+0x1984:   	orn	%o1, %o4, %o1
	.word	0xb1a50958	! t1_kref+0x1988:   	fmuld	%f20, %f24, %f24
	.word	0x9052ecad	! t1_kref+0x198c:   	umul	%o3, 0xcad, %o0
	.word	0xada609b1	! t1_kref+0x1990:   	fdivs	%f24, %f17, %f22
	.word	0x903abfa3	! t1_kref+0x1994:   	xnor	%o2, -0x5d, %o0
	.word	0xf53f4019	! t1_kref+0x1998:   	std	%f26, [%i5 + %i1]
	.word	0x9322eff0	! t1_kref+0x199c:   	mulscc	%o3, 0xff0, %o1
	.word	0x3b480005	! t1_kref+0x19a0:   	fble,a,pt	%fcc0, _kref+0x19b4
	.word	0xd43f4019	! t1_kref+0x19a4:   	std	%o2, [%i5 + %i1]
	.word	0x81ad8a3e	! t1_kref+0x19a8:   	fcmps	%fcc0, %f22, %f30
	.word	0xa4db000a	! t1_kref+0x19ac:   	smulcc	%o4, %o2, %l2
	.word	0xb1a00554	! t1_kref+0x19b0:   	fsqrtd	%f20, %f24
	.word	0xaada800b	! t1_kref+0x19b4:   	smulcc	%o2, %o3, %l5
	.word	0x929a8009	! t1_kref+0x19b8:   	xorcc	%o2, %o1, %o1
	.word	0x90d2f209	! t1_kref+0x19bc:   	umulcc	%o3, -0xdf7, %o0
	.word	0xa9a489b8	! t1_kref+0x19c0:   	fdivs	%f18, %f24, %f20
	.word	0xa6d264be	! t1_kref+0x19c4:   	umulcc	%o1, 0x4be, %l3
	.word	0xe1ee101a	! t1_kref+0x19c8:   	prefetcha	%i0 + %i2, 16
	.word	0xef20a034	! t1_kref+0x19cc:   	st	%f23, [%g2 + 0x34]
	.word	0x9202a213	! t1_kref+0x19d0:   	add	%o2, 0x213, %o1
	.word	0xe8ee1000	! t1_kref+0x19d4:   	ldstuba	[%i0]0x80, %l4
	.word	0xd0881018	! t1_kref+0x19d8:   	lduba	[%g0 + %i0]0x80, %o0
	.word	0x9002400c	! t1_kref+0x19dc:   	add	%o1, %o4, %o0
	.word	0xa8dab0c7	! t1_kref+0x19e0:   	smulcc	%o2, -0xf39, %l4
	.word	0x20480004	! t1_kref+0x19e4:   	bn,a,pt	%icc, _kref+0x19f4
	.word	0xd228a02e	! t1_kref+0x19e8:   	stb	%o1, [%g2 + 0x2e]
	.word	0xd03e001d	! t1_kref+0x19ec:   	std	%o0, [%i0 + %i5]
	.word	0x81ac0ad4	! t1_kref+0x19f0:   	fcmped	%fcc0, %f16, %f20
	.word	0xb7a01893	! t1_kref+0x19f4:   	fitos	%f19, %f27
	.word	0xada74d3b	! t1_kref+0x19f8:   	fsmuld	%f29, %f27, %f22
	.word	0xea4e401a	! t1_kref+0x19fc:   	ldsb	[%i1 + %i2], %l5
	.word	0x932a8009	! t1_kref+0x1a00:   	sll	%o2, %o1, %o1
	.word	0xd430a024	! t1_kref+0x1a04:   	sth	%o2, [%g2 + 0x24]
	.word	0xa9a488d4	! t1_kref+0x1a08:   	fsubd	%f18, %f20, %f20
	.word	0xa9b00fc0	! t1_kref+0x1a0c:   	fone	%f20
	.word	0xe8067ff8	! t1_kref+0x1a10:   	ld	[%i1 - 8], %l4
	.word	0xae028009	! t1_kref+0x1a14:   	add	%o2, %o1, %l7
	.word	0xe720a034	! t1_kref+0x1a18:   	st	%f19, [%g2 + 0x34]
	.word	0x9fc10000	! t1_kref+0x1a1c:   	call	%g4
	.word	0xd03e2010	! t1_kref+0x1a20:   	std	%o0, [%i0 + 0x10]
	.word	0xa944c000	! t1_kref+0x1a24:   	mov	%gsr, %l4
	.word	0xb5a0055e	! t1_kref+0x1a28:   	fsqrtd	%f30, %f26
	.word	0xeb20a024	! t1_kref+0x1a2c:   	st	%f21, [%g2 + 0x24]
	.word	0x24480006	! t1_kref+0x1a30:   	ble,a,pt	%icc, _kref+0x1a48
	.word	0xd620a024	! t1_kref+0x1a34:   	st	%o3, [%g2 + 0x24]
	.word	0xae5b0009	! t1_kref+0x1a38:   	smul	%o4, %o1, %l7
	.word	0xa9228009	! t1_kref+0x1a3c:   	mulscc	%o2, %o1, %l4
	.word	0xd220a014	! t1_kref+0x1a40:   	st	%o1, [%g2 + 0x14]
	.word	0xa3a01899	! t1_kref+0x1a44:   	fitos	%f25, %f17
	.word	0xa9b3006a	! t1_kref+0x1a48:   	edge8ln	%o4, %o2, %l4
	.word	0xae62c00c	! t1_kref+0x1a4c:   	subc	%o3, %o4, %l7
	.word	0xee4e200e	! t1_kref+0x1a50:   	ldsb	[%i0 + 0xe], %l7
	.word	0xa9a0015e	! t1_kref+0x1a54:   	fabsd	%f30, %f20
	.word	0xef68a107	! t1_kref+0x1a58:   	prefetch	%g2 + 0x107, 23
	.word	0x3e480002	! t1_kref+0x1a5c:   	bvc,a,pt	%icc, _kref+0x1a64
	.word	0xa9b40dd8	! t1_kref+0x1a60:   	fnand	%f16, %f24, %f20
	.word	0xaedae310	! t1_kref+0x1a64:   	smulcc	%o3, 0x310, %l7
	.word	0x9fc10000	! t1_kref+0x1a68:   	call	%g4
	.word	0xa4da8009	! t1_kref+0x1a6c:   	smulcc	%o2, %o1, %l2
	.word	0xa4daf20c	! t1_kref+0x1a70:   	smulcc	%o3, -0xdf4, %l2
	.word	0xb5a01933	! t1_kref+0x1a74:   	fstod	%f19, %f26
	.word	0xb5a000ba	! t1_kref+0x1a78:   	fnegs	%f26, %f26
	.word	0xd428a037	! t1_kref+0x1a7c:   	stb	%o2, [%g2 + 0x37]
	.word	0xd04e200d	! t1_kref+0x1a80:   	ldsb	[%i0 + 0xd], %o0
	.word	0xaa9a7393	! t1_kref+0x1a84:   	xorcc	%o1, -0xc6d, %l5
	.word	0x81828000	! t1_kref+0x1a88:   	wr	%o2, %g0, %y
	.word	0xa9b007ba	! t1_kref+0x1a8c:   	fpackfix	%f26, %f20
	.word	0xa9a01036	! t1_kref+0x1a90:   	fstox	%f22, %f20
	.word	0xb5a588b2	! t1_kref+0x1a94:   	fsubs	%f22, %f18, %f26
	.word	0x110aa261	! t1_kref+0x1a98:   	sethi	%hi(0x2a898400), %o0
	.word	0x8143e014	! t1_kref+0x1a9c:   	membar	0x14
	.word	0xa5a01918	! t1_kref+0x1aa0:   	fitod	%f24, %f18
	.word	0xe926401c	! t1_kref+0x1aa4:   	st	%f20, [%i1 + %i4]
	.word	0xe6480018	! t1_kref+0x1aa8:   	ldsb	[%g0 + %i0], %l3
	.word	0xd830a026	! t1_kref+0x1aac:   	sth	%o4, [%g2 + 0x26]
	.word	0xf3060000	! t1_kref+0x1ab0:   	ld	[%i0], %f25
	.word	0xa8f33a69	! t1_kref+0x1ab4:   	udivcc	%o4, -0x597, %l4
	.word	0x9fc00004	! t1_kref+0x1ab8:   	call	%g0 + %g4
	.word	0xadb24329	! t1_kref+0x1abc:   	bmask	%o1, %o1, %l6
	.word	0xadb68512	! t1_kref+0x1ac0:   	fcmpgt16	%f26, %f18, %l6
	.word	0xada609da	! t1_kref+0x1ac4:   	fdivd	%f24, %f26, %f22
	.word	0xd6ee9018	! t1_kref+0x1ac8:   	ldstuba	[%i2 + %i0]0x80, %o3
	.word	0xa5b009b5	! t1_kref+0x1acc:   	fexpand	%f21, %f18
	.word	0xa802b976	! t1_kref+0x1ad0:   	add	%o2, -0x68a, %l4
	.word	0x3a800006	! t1_kref+0x1ad4:   	bcc,a	_kref+0x1aec
	.word	0xed1fbde0	! t1_kref+0x1ad8:   	ldd	[%fp - 0x220], %f22
	.word	0xd620a024	! t1_kref+0x1adc:   	st	%o3, [%g2 + 0x24]
	.word	0xada0055c	! t1_kref+0x1ae0:   	fsqrtd	%f28, %f22
	.word	0xa5b00cda	! t1_kref+0x1ae4:   	fnot2	%f26, %f18
	.word	0x35800008	! t1_kref+0x1ae8:   	fbue,a	_kref+0x1b08
	.word	0xad3aa002	! t1_kref+0x1aec:   	sra	%o2, 0x2, %l6
	.word	0x25480007	! t1_kref+0x1af0:   	fblg,a,pt	%fcc0, _kref+0x1b0c
	.word	0xa9a78d3c	! t1_kref+0x1af4:   	fsmuld	%f30, %f28, %f20
	.word	0xaaaa791d	! t1_kref+0x1af8:   	andncc	%o1, -0x6e3, %l5
	.word	0xae02f129	! t1_kref+0x1afc:   	add	%o3, -0xed7, %l7
	.word	0xf13e401d	! t1_kref+0x1b00:   	std	%f24, [%i1 + %i5]
	.word	0xad400000	! t1_kref+0x1b04:   	mov	%y, %l6
	.word	0xa9b00cd4	! t1_kref+0x1b08:   	fnot2	%f20, %f20
	.word	0xadb00fe0	! t1_kref+0x1b0c:   	fones	%f22
	.word	0xa5a588d2	! t1_kref+0x1b10:   	fsubd	%f22, %f18, %f18
	.word	0xae9aa21c	! t1_kref+0x1b14:   	xorcc	%o2, 0x21c, %l7
	.word	0xd836001b	! t1_kref+0x1b18:   	sth	%o4, [%i0 + %i3]
	.word	0xad44c000	! t1_kref+0x1b1c:   	mov	%gsr, %l6
	.word	0xd8200018	! t1_kref+0x1b20:   	st	%o4, [%g0 + %i0]
	.word	0xa9b7097b	! t1_kref+0x1b24:   	fpmerge	%f28, %f27, %f20
	.word	0xacda4009	! t1_kref+0x1b28:   	smulcc	%o1, %o1, %l6
	.word	0x3d480007	! t1_kref+0x1b2c:   	fbule,a,pt	%fcc0, _kref+0x1b48
	.word	0xd4ae9018	! t1_kref+0x1b30:   	stba	%o2, [%i2 + %i0]0x80
	.word	0xada489d2	! t1_kref+0x1b34:   	fdivd	%f18, %f18, %f22
	.word	0xa9a6cd3b	! t1_kref+0x1b38:   	fsmuld	%f27, %f27, %f20
	.word	0xf93e401d	! t1_kref+0x1b3c:   	std	%f28, [%i1 + %i5]
	.word	0xec06001c	! t1_kref+0x1b40:   	ld	[%i0 + %i4], %l6
	call	SYM(t1_subr0)
	.word	0xd000a03c	! t1_kref+0x1b48:   	ld	[%g2 + 0x3c], %o0
	.word	0xb5a00556	! t1_kref+0x1b4c:   	fsqrtd	%f22, %f26
	.word	0xe1be5a5c	! t1_kref+0x1b50:   	stda	%f16, [%i1 + %i4]0xd2
	.word	0xa9b58c96	! t1_kref+0x1b54:   	fandnot2	%f22, %f22, %f20
	.word	0xb1a688d2	! t1_kref+0x1b58:   	fsubd	%f26, %f18, %f24
	.word	0xb9a00558	! t1_kref+0x1b5c:   	fsqrtd	%f24, %f28
	.word	0xf9ee101d	! t1_kref+0x1b60:   	prefetcha	%i0 + %i5, 28
	.word	0xe64e7fec	! t1_kref+0x1b64:   	ldsb	[%i1 - 0x14], %l3
	.word	0x81824000	! t1_kref+0x1b68:   	wr	%o1, %g0, %y
	.word	0xe13e7fe0	! t1_kref+0x1b6c:   	std	%f16, [%i1 - 0x20]
	.word	0xa732c00a	! t1_kref+0x1b70:   	srl	%o3, %o2, %l3
	.word	0xac1b000b	! t1_kref+0x1b74:   	xor	%o4, %o3, %l6
	.word	0xe9f6100c	! t1_kref+0x1b78:   	casxa	[%i0]0x80, %o4, %l4
	.word	0xf13e001d	! t1_kref+0x1b7c:   	std	%f24, [%i0 + %i5]
	.word	0xac3ac009	! t1_kref+0x1b80:   	xnor	%o3, %o1, %l6
	.word	0xa3b0077c	! t1_kref+0x1b84:   	fpack16	%f28, %f17
	.word	0xb1a0013e	! t1_kref+0x1b88:   	fabss	%f30, %f24
	.word	0xee40a034	! t1_kref+0x1b8c:   	ldsw	[%g2 + 0x34], %l7
	.word	0xc109401c	! t1_kref+0x1b90:   	ld	[%g5 + %i4], %fsr
	.word	0xb1a44932	! t1_kref+0x1b94:   	fmuls	%f17, %f18, %f24
	.word	0xa9a54d3d	! t1_kref+0x1b98:   	fsmuld	%f21, %f29, %f20
	.word	0xf1200019	! t1_kref+0x1b9c:   	st	%f24, [%g0 + %i1]
	.word	0xb5b00fe0	! t1_kref+0x1ba0:   	fones	%f26
	.word	0xa8026acd	! t1_kref+0x1ba4:   	add	%o1, 0xacd, %l4
	.word	0x3d800008	! t1_kref+0x1ba8:   	fbule,a	_kref+0x1bc8
	.word	0xd428a037	! t1_kref+0x1bac:   	stb	%o2, [%g2 + 0x37]
	.word	0xadb58f98	! t1_kref+0x1bb0:   	for	%f22, %f24, %f22
	.word	0x93b584d2	! t1_kref+0x1bb4:   	fcmpne32	%f22, %f18, %o1
	.word	0xb1a588d0	! t1_kref+0x1bb8:   	fsubd	%f22, %f16, %f24
	.word	0xd436001b	! t1_kref+0x1bbc:   	sth	%o2, [%i0 + %i3]
	.word	0xbdb44fbe	! t1_kref+0x1bc0:   	fors	%f17, %f30, %f30
	.word	0x81af0a5e	! t1_kref+0x1bc4:   	fcmpd	%fcc0, %f28, %f30
	.word	0xadb00c20	! t1_kref+0x1bc8:   	fzeros	%f22
	.word	0x22480005	! t1_kref+0x1bcc:   	be,a,pt	%icc, _kref+0x1be0
	.word	0xb9a489d8	! t1_kref+0x1bd0:   	fdivd	%f18, %f24, %f28
	.word	0xee680019	! t1_kref+0x1bd4:   	ldstub	[%g0 + %i1], %l7
	.word	0xe9f6500a	! t1_kref+0x1bd8:   	casxa	[%i1]0x80, %o2, %l4
	.word	0xb5a709d6	! t1_kref+0x1bdc:   	fdivd	%f28, %f22, %f26
	.word	0xee464000	! t1_kref+0x1be0:   	ldsw	[%i1], %l7
	.word	0xec4e8018	! t1_kref+0x1be4:   	ldsb	[%i2 + %i0], %l6
	.word	0xb9a709d8	! t1_kref+0x1be8:   	fdivd	%f28, %f24, %f28
	.word	0xafa01a31	! t1_kref+0x1bec:   	fstoi	%f17, %f23
	.word	0xc168a109	! t1_kref+0x1bf0:   	prefetch	%g2 + 0x109, 0
	.word	0xaba00535	! t1_kref+0x1bf4:   	fsqrts	%f21, %f21
	.word	0xe968a083	! t1_kref+0x1bf8:   	prefetch	%g2 + 0x83, 20
	.word	0xf500a014	! t1_kref+0x1bfc:   	ld	[%g2 + 0x14], %f26
	.word	0xaba01a50	! t1_kref+0x1c00:   	fdtoi	%f16, %f21
	.word	0x81ad0a56	! t1_kref+0x1c04:   	fcmpd	%fcc0, %f20, %f22
	.word	0xb3a01a33	! t1_kref+0x1c08:   	fstoi	%f19, %f25
	.word	0xc068a014	! t1_kref+0x1c0c:   	ldstub	[%g2 + 0x14], %g0
	.word	0x81af0abc	! t1_kref+0x1c10:   	fcmpes	%fcc0, %f28, %f28
	.word	0xe840a02c	! t1_kref+0x1c14:   	ldsw	[%g2 + 0x2c], %l4
	.word	0xa6b30009	! t1_kref+0x1c18:   	orncc	%o4, %o1, %l3
	.word	0x39480001	! t1_kref+0x1c1c:   	fbuge,a,pt	%fcc0, _kref+0x1c20
	.word	0xd42e001a	! t1_kref+0x1c20:   	stb	%o2, [%i0 + %i2]
	.word	0xd04e3fe4	! t1_kref+0x1c24:   	ldsb	[%i0 - 0x1c], %o0
	.word	0xb1a01a3b	! t1_kref+0x1c28:   	fstoi	%f27, %f24
	.word	0x81af4a35	! t1_kref+0x1c2c:   	fcmps	%fcc0, %f29, %f21
	.word	0xd620a03c	! t1_kref+0x1c30:   	st	%o3, [%g2 + 0x3c]
	.word	0x3a800007	! t1_kref+0x1c34:   	bcc,a	_kref+0x1c50
	.word	0xa8924009	! t1_kref+0x1c38:   	orcc	%o1, %o1, %l4
	.word	0xb9a01919	! t1_kref+0x1c3c:   	fitod	%f25, %f28
	.word	0xe11e0000	! t1_kref+0x1c40:   	ldd	[%i0], %f16
	.word	0xadb58dd6	! t1_kref+0x1c44:   	fnand	%f22, %f22, %f22
	.word	0x909b304f	! t1_kref+0x1c48:   	xorcc	%o4, -0xfb1, %o0
	.word	0xf11fbd90	! t1_kref+0x1c4c:   	ldd	[%fp - 0x270], %f24
	.word	0xaeb2800c	! t1_kref+0x1c50:   	orncc	%o2, %o4, %l7
	.word	0xd628a02f	! t1_kref+0x1c54:   	stb	%o3, [%g2 + 0x2f]
	.word	0xa8b2c00a	! t1_kref+0x1c58:   	orncc	%o3, %o2, %l4
	.word	0xb7a01895	! t1_kref+0x1c5c:   	fitos	%f21, %f27
	.word	0xa7400000	! t1_kref+0x1c60:   	mov	%y, %l3
	.word	0xae3b2a6f	! t1_kref+0x1c64:   	xnor	%o4, 0xa6f, %l7
	.word	0x8610201a	! t1_kref+0x1c68:   	mov	0x1a, %g3
	.word	0x86a0e001	! t1_kref+0x1c6c:   	subcc	%g3, 1, %g3
	.word	0x22800004	! t1_kref+0x1c70:   	be,a	_kref+0x1c80
	.word	0xd830a02c	! t1_kref+0x1c74:   	sth	%o4, [%g2 + 0x2c]
	.word	0xbdb58a9e	! t1_kref+0x1c78:   	fpsub16	%f22, %f30, %f30
	.word	0xf11fbd70	! t1_kref+0x1c7c:   	ldd	[%fp - 0x290], %f24
	.word	0xa760652f	! t1_kref+0x1c80:   	movne	%fcc0, -0x2d1, %l3
	.word	0x92f33a65	! t1_kref+0x1c84:   	udivcc	%o4, -0x59b, %o1
	.word	0xe416c018	! t1_kref+0x1c88:   	lduh	[%i3 + %i0], %l2
	.word	0xb5a689d6	! t1_kref+0x1c8c:   	fdivd	%f26, %f22, %f26
	call	SYM(t1_subr3)
	.word	0x8143c000	! t1_kref+0x1c94:   	stbar
	.word	0xad400000	! t1_kref+0x1c98:   	mov	%y, %l6
	.word	0xbdb40ddc	! t1_kref+0x1c9c:   	fnand	%f16, %f28, %f30
	.word	0xd2881019	! t1_kref+0x1ca0:   	lduba	[%g0 + %i1]0x80, %o1
	.word	0xa9b74cbe	! t1_kref+0x1ca4:   	fandnot2s	%f29, %f30, %f20
	.word	0xbda01892	! t1_kref+0x1ca8:   	fitos	%f18, %f30
	.word	0xeb68a0cd	! t1_kref+0x1cac:   	prefetch	%g2 + 0xcd, 21
	.word	0x9de3bfa0	! t1_kref+0x1cb0:   	save	%sp, -0x60, %sp
	.word	0xb236c01d	! t1_kref+0x1cb4:   	orn	%i3, %i5, %i1
	.word	0xabee801d	! t1_kref+0x1cb8:   	restore	%i2, %i5, %l5
	.word	0xe5e65009	! t1_kref+0x1cbc:   	casa	[%i1]0x80, %o1, %l2
	.word	0xd000a01c	! t1_kref+0x1cc0:   	ld	[%g2 + 0x1c], %o0
	.word	0xac0a4009	! t1_kref+0x1cc4:   	and	%o1, %o1, %l6
	.word	0xac2ae8bd	! t1_kref+0x1cc8:   	andn	%o3, 0x8bd, %l6
	.word	0xae227b72	! t1_kref+0x1ccc:   	sub	%o1, -0x48e, %l7
	.word	0xa7a64838	! t1_kref+0x1cd0:   	fadds	%f25, %f24, %f19
	.word	0xa9a018da	! t1_kref+0x1cd4:   	fdtos	%f26, %f20
	.word	0xf2070000	! t1_kref+0x1cd8:   	ld	[%i4], %i1
	.word	0xe93e001d	! t1_kref+0x1cdc:   	std	%f20, [%i0 + %i5]
	.word	0xaad2c00c	! t1_kref+0x1ce0:   	umulcc	%o3, %o4, %l5
	.word	0xac3ac00a	! t1_kref+0x1ce4:   	xnor	%o3, %o2, %l6
	.word	0xafb300ab	! t1_kref+0x1ce8:   	edge16n	%o4, %o3, %l7
	.word	0x909a400b	! t1_kref+0x1cec:   	xorcc	%o1, %o3, %o0
	.word	0xb7b64cbc	! t1_kref+0x1cf0:   	fandnot2s	%f25, %f28, %f27
	.word	0xabb24280	! t1_kref+0x1cf4:   	array32	%o1, %g0, %l5
	.word	0xb1a409dc	! t1_kref+0x1cf8:   	fdivd	%f16, %f28, %f24
	.word	0x8610200f	! t1_kref+0x1cfc:   	mov	0xf, %g3
	.word	0x86a0e001	! t1_kref+0x1d00:   	subcc	%g3, 1, %g3
	.word	0x22800003	! t1_kref+0x1d04:   	be,a	_kref+0x1d10
	.word	0xa49ab611	! t1_kref+0x1d08:   	xorcc	%o2, -0x9ef, %l2
	.word	0xfd3e6010	! t1_kref+0x1d0c:   	std	%f30, [%i1 + 0x10]
	.word	0xd03e3fe0	! t1_kref+0x1d10:   	std	%o0, [%i0 - 0x20]
	.word	0xea167ff4	! t1_kref+0x1d14:   	lduh	[%i1 - 0xc], %l5
	.word	0x9122400b	! t1_kref+0x1d18:   	mulscc	%o1, %o3, %o0
	.word	0xe608a024	! t1_kref+0x1d1c:   	ldub	[%g2 + 0x24], %l3
	.word	0x23800005	! t1_kref+0x1d20:   	fbne,a	_kref+0x1d34
	.word	0xe9be5a5b	! t1_kref+0x1d24:   	stda	%f20, [%i1 + %i3]0xd2
	.word	0xa8932a8d	! t1_kref+0x1d28:   	orcc	%o4, 0xa8d, %l4
	.word	0x81ddc01d	! t1_kref+0x1d2c:   	flush	%l7 + %i5
	.word	0xd628a00e	! t1_kref+0x1d30:   	stb	%o3, [%g2 + 0xe]
	.word	0xa83ac00b	! t1_kref+0x1d34:   	xnor	%o3, %o3, %l4
	.word	0xfd6e7fe0	! t1_kref+0x1d38:   	prefetch	%i1 - 0x20, 30
	.word	0x8143e013	! t1_kref+0x1d3c:   	membar	0x13
	.word	0xa7b00cf4	! t1_kref+0x1d40:   	fnot2s	%f20, %f19
	.word	0xae02c00a	! t1_kref+0x1d44:   	add	%o3, %o2, %l7
	.word	0xab3a400b	! t1_kref+0x1d48:   	sra	%o1, %o3, %l5
	.word	0xa61abfb8	! t1_kref+0x1d4c:   	xor	%o2, -0x48, %l3
	.word	0xbda0055e	! t1_kref+0x1d50:   	fsqrtd	%f30, %f30
	.word	0xae1b362e	! t1_kref+0x1d54:   	xor	%o4, -0x9d2, %l7
	.word	0x9de3bfa0	! t1_kref+0x1d58:   	save	%sp, -0x60, %sp
	.word	0xb3082615	! t1_kref+0x1d5c:   	tsubcc	%g0, 0x615, %i1
	.word	0xafeef6ff	! t1_kref+0x1d60:   	restore	%i3, -0x901, %l7
	.word	0x90d2e2e7	! t1_kref+0x1d64:   	umulcc	%o3, 0x2e7, %o0
	.word	0xd430a01e	! t1_kref+0x1d68:   	sth	%o2, [%g2 + 0x1e]
	.word	0xa5400000	! t1_kref+0x1d6c:   	mov	%y, %l2
	.word	0xd228a025	! t1_kref+0x1d70:   	stb	%o1, [%g2 + 0x25]
	.word	0xa4d2c00b	! t1_kref+0x1d74:   	umulcc	%o3, %o3, %l2
	.word	0xd43e3fe8	! t1_kref+0x1d78:   	std	%o2, [%i0 - 0x18]
	.word	0xa5b486da	! t1_kref+0x1d7c:   	fmul8sux16	%f18, %f26, %f18
	.word	0xa1a0191a	! t1_kref+0x1d80:   	fitod	%f26, %f16
	.word	0xa5a549b6	! t1_kref+0x1d84:   	fdivs	%f21, %f22, %f18
	.word	0x92bb0009	! t1_kref+0x1d88:   	xnorcc	%o4, %o1, %o1
	.word	0xac7b3da9	! t1_kref+0x1d8c:   	sdiv	%o4, -0x257, %l6
	.word	0xf91e3fe8	! t1_kref+0x1d90:   	ldd	[%i0 - 0x18], %f28
	.word	0xbdb68e80	! t1_kref+0x1d94:   	fsrc1	%f26, %f30
	.word	0x25480003	! t1_kref+0x1d98:   	fblg,a,pt	%fcc0, _kref+0x1da4
	.word	0xae2b000a	! t1_kref+0x1d9c:   	andn	%o4, %o2, %l7
	.word	0xeb26001c	! t1_kref+0x1da0:   	st	%f21, [%i0 + %i4]
	.word	0xd24e2013	! t1_kref+0x1da4:   	ldsb	[%i0 + 0x13], %o1
	.word	0xaab2bf9a	! t1_kref+0x1da8:   	orncc	%o2, -0x66, %l5
	.word	0xafb300aa	! t1_kref+0x1dac:   	edge16n	%o4, %o2, %l7
	.word	0xa9a018d4	! t1_kref+0x1db0:   	fdtos	%f20, %f20
	.word	0xa9b78e75	! t1_kref+0x1db4:   	fxnors	%f30, %f21, %f20
	.word	0xe6d01018	! t1_kref+0x1db8:   	ldsha	[%g0 + %i0]0x80, %l3
	.word	0xd430a03c	! t1_kref+0x1dbc:   	sth	%o2, [%g2 + 0x3c]
	.word	0xb7a01a56	! t1_kref+0x1dc0:   	fdtoi	%f22, %f27
	.word	0xd230a006	! t1_kref+0x1dc4:   	sth	%o1, [%g2 + 6]
	.word	0x81ac8a56	! t1_kref+0x1dc8:   	fcmpd	%fcc0, %f18, %f22
	.word	0xa3b6cdfe	! t1_kref+0x1dcc:   	fnands	%f27, %f30, %f17
	.word	0x901a400c	! t1_kref+0x1dd0:   	xor	%o1, %o4, %o0
	.word	0xb7a98034	! t1_kref+0x1dd4:   	fmovsg	%fcc0, %f20, %f27
	.word	0xd420a004	! t1_kref+0x1dd8:   	st	%o2, [%g2 + 4]
	.word	0xa82ac00a	! t1_kref+0x1ddc:   	andn	%o3, %o2, %l4
	.word	0x81ac8a5a	! t1_kref+0x1de0:   	fcmpd	%fcc0, %f18, %f26
	.word	0xa802e716	! t1_kref+0x1de4:   	add	%o3, 0x716, %l4
	.word	0xb9a01a35	! t1_kref+0x1de8:   	fstoi	%f21, %f28
	.word	0xa82a8009	! t1_kref+0x1dec:   	andn	%o2, %o1, %l4
	.word	0xec067ff4	! t1_kref+0x1df0:   	ld	[%i1 - 0xc], %l6
	.word	0xada688b7	! t1_kref+0x1df4:   	fsubs	%f26, %f23, %f22
	.word	0x920b38c4	! t1_kref+0x1df8:   	and	%o4, -0x73c, %o1
	.word	0x91400000	! t1_kref+0x1dfc:   	mov	%y, %o0
	.word	0xb9a00139	! t1_kref+0x1e00:   	fabss	%f25, %f28
	.word	0xa9a68854	! t1_kref+0x1e04:   	faddd	%f26, %f20, %f20
	.word	0xb5b5c6b7	! t1_kref+0x1e08:   	fmul8x16al	%f23, %f23, %f26
	.word	0x86102004	! t1_kref+0x1e0c:   	mov	0x4, %g3
	.word	0x32800000	! t1_kref+0x1e10:   	bne,a	_kref+0x1e10
	.word	0x86a0e001	! t1_kref+0x1e14:   	subcc	%g3, 1, %g3
	.word	0xa61ab920	! t1_kref+0x1e18:   	xor	%o2, -0x6e0, %l3
	.word	0x92f27ca3	! t1_kref+0x1e1c:   	udivcc	%o1, -0x35d, %o1
	.word	0xaa0a7468	! t1_kref+0x1e20:   	and	%o1, -0xb98, %l5
	.word	0xa9b44e74	! t1_kref+0x1e24:   	fxnors	%f17, %f20, %f20
	.word	0xaf3aa01a	! t1_kref+0x1e28:   	sra	%o2, 0x1a, %l7
	.word	0x34480003	! t1_kref+0x1e2c:   	bg,a,pt	%icc, _kref+0x1e38
	.word	0xb1a609de	! t1_kref+0x1e30:   	fdivd	%f24, %f30, %f24
	.word	0xb5a00556	! t1_kref+0x1e34:   	fsqrtd	%f22, %f26
	.word	0xe406001c	! t1_kref+0x1e38:   	ld	[%i0 + %i4], %l2
	.word	0x3e480005	! t1_kref+0x1e3c:   	bvc,a,pt	%icc, _kref+0x1e50
	.word	0xd630a026	! t1_kref+0x1e40:   	sth	%o3, [%g2 + 0x26]
	.word	0xafa50938	! t1_kref+0x1e44:   	fmuls	%f20, %f24, %f23
	.word	0xd630a00c	! t1_kref+0x1e48:   	sth	%o3, [%g2 + 0xc]
	.word	0xf100a004	! t1_kref+0x1e4c:   	ld	[%g2 + 4], %f24
	.word	0x8610201c	! t1_kref+0x1e50:   	mov	0x1c, %g3
	.word	0x86a0e001	! t1_kref+0x1e54:   	subcc	%g3, 1, %g3
	.word	0x22800001	! t1_kref+0x1e58:   	be,a	_kref+0x1e5c
	.word	0xae2b3d9c	! t1_kref+0x1e5c:   	andn	%o4, -0x264, %l7
	.word	0xd240a02c	! t1_kref+0x1e60:   	ldsw	[%g2 + 0x2c], %o1
	.word	0xaebb3fe0	! t1_kref+0x1e64:   	xnorcc	%o4, -0x20, %l7
	.word	0xa65ab2d6	! t1_kref+0x1e68:   	smul	%o2, -0xd2a, %l3
	.word	0xb5a508da	! t1_kref+0x1e6c:   	fsubd	%f20, %f26, %f26
	.word	0x91400000	! t1_kref+0x1e70:   	mov	%y, %o0
	.word	0xb1a5085a	! t1_kref+0x1e74:   	faddd	%f20, %f26, %f24
	.word	0xd296501b	! t1_kref+0x1e78:   	lduha	[%i1 + %i3]0x80, %o1
	.word	0xa92a6003	! t1_kref+0x1e7c:   	sll	%o1, 0x3, %l4
	.word	0xb1a589d6	! t1_kref+0x1e80:   	fdivd	%f22, %f22, %f24
	.word	0xa4926398	! t1_kref+0x1e84:   	orcc	%o1, 0x398, %l2
	.word	0xa802c009	! t1_kref+0x1e88:   	add	%o3, %o1, %l4
	.word	0xa9a0191b	! t1_kref+0x1e8c:   	fitod	%f27, %f20
	.word	0x921a800b	! t1_kref+0x1e90:   	xor	%o2, %o3, %o1
	.word	0xb9a01897	! t1_kref+0x1e94:   	fitos	%f23, %f28
	.word	0x38800005	! t1_kref+0x1e98:   	bgu,a	_kref+0x1eac
	.word	0xa1b6871e	! t1_kref+0x1e9c:   	fmuld8sux16	%f26, %f30, %f16
	.word	0xa9b70e80	! t1_kref+0x1ea0:   	fsrc1	%f28, %f20
	.word	0xe4066004	! t1_kref+0x1ea4:   	ld	[%i1 + 4], %l2
	.word	0xab2ac009	! t1_kref+0x1ea8:   	sll	%o3, %o1, %l5
	.word	0xd03e3fe0	! t1_kref+0x1eac:   	std	%o0, [%i0 - 0x20]
	.word	0x30480002	! t1_kref+0x1eb0:   	ba,a,pt	%icc, _kref+0x1eb8
	.word	0x91b24280	! t1_kref+0x1eb4:   	array32	%o1, %g0, %o0
	.word	0xafa0003b	! t1_kref+0x1eb8:   	fmovs	%f27, %f23
	.word	0xe968a008	! t1_kref+0x1ebc:   	prefetch	%g2 + 8, 20
	.word	0xacaaa927	! t1_kref+0x1ec0:   	andncc	%o2, 0x927, %l6
	.word	0x2f800008	! t1_kref+0x1ec4:   	fbu,a	_kref+0x1ee4
	.word	0xada50858	! t1_kref+0x1ec8:   	faddd	%f20, %f24, %f22
	.word	0x91b2432b	! t1_kref+0x1ecc:   	bmask	%o1, %o3, %o0
	.word	0xeda71018	! t1_kref+0x1ed0:   	sta	%f22, [%i4 + %i0]0x80
	.word	0xabb00f37	! t1_kref+0x1ed4:   	fsrc2s	%f23, %f21
	.word	0xada00535	! t1_kref+0x1ed8:   	fsqrts	%f21, %f22
	.word	0xb5a708d2	! t1_kref+0x1edc:   	fsubd	%f28, %f18, %f26
	.word	0x81ac8ada	! t1_kref+0x1ee0:   	fcmped	%fcc0, %f18, %f26
	.word	0xb5b40d14	! t1_kref+0x1ee4:   	fandnot1	%f16, %f20, %f26
	.word	0xa5a608da	! t1_kref+0x1ee8:   	fsubd	%f24, %f26, %f18
	.word	0x24480007	! t1_kref+0x1eec:   	ble,a,pt	%icc, _kref+0x1f08
	.word	0xfd20a024	! t1_kref+0x1ef0:   	st	%f30, [%g2 + 0x24]
	.word	0xaa7a400b	! t1_kref+0x1ef4:   	sdiv	%o1, %o3, %l5
	.word	0xd220a02c	! t1_kref+0x1ef8:   	st	%o1, [%g2 + 0x2c]
	.word	0xb9a0053b	! t1_kref+0x1efc:   	fsqrts	%f27, %f28
	.word	0xa432800a	! t1_kref+0x1f00:   	orn	%o2, %o2, %l2
	.word	0xed6e001d	! t1_kref+0x1f04:   	prefetch	%i0 + %i5, 22
	.word	0x905b000c	! t1_kref+0x1f08:   	smul	%o4, %o4, %o0
	.word	0xef26001c	! t1_kref+0x1f0c:   	st	%f23, [%i0 + %i4]
	.word	0xa5a0189c	! t1_kref+0x1f10:   	fitos	%f28, %f18
	.word	0xd0167fec	! t1_kref+0x1f14:   	lduh	[%i1 - 0x14], %o0
	.word	0xd428a026	! t1_kref+0x1f18:   	stb	%o2, [%g2 + 0x26]
	.word	0x90728009	! t1_kref+0x1f1c:   	udiv	%o2, %o1, %o0
	.word	0xc9ee500c	! t1_kref+0x1f20:   	prefetcha	%i1 + %o4, 4
	.word	0xc807bfe8	! t1_kref+0x1f24:   	ld	[%fp - 0x18], %g4
	.word	0xb1b40f9e	! t1_kref+0x1f28:   	for	%f16, %f30, %f24
	.word	0x81ac0ad4	! t1_kref+0x1f2c:   	fcmped	%fcc0, %f16, %f20
	.word	0x35480004	! t1_kref+0x1f30:   	fbue,a,pt	%fcc0, _kref+0x1f40
	.word	0xd420a01c	! t1_kref+0x1f34:   	st	%o2, [%g2 + 0x1c]
	.word	0xa9418000	! t1_kref+0x1f38:   	mov	%fprs, %l4
	.word	0x3d800002	! t1_kref+0x1f3c:   	fbule,a	_kref+0x1f44
	.word	0xaac2b2bc	! t1_kref+0x1f40:   	addccc	%o2, -0xd44, %l5
	.word	0xbdb00c00	! t1_kref+0x1f44:   	fzero	%f30
	.word	0xb5a00554	! t1_kref+0x1f48:   	fsqrtd	%f20, %f26
	.word	0xec062000	! t1_kref+0x1f4c:   	ld	[%i0], %l6
	.word	0xac9ac00b	! t1_kref+0x1f50:   	xorcc	%o3, %o3, %l6
	call	SYM(t1_subr0)
	.word	0xaa726fa6	! t1_kref+0x1f58:   	udiv	%o1, 0xfa6, %l5
	.word	0xa873000b	! t1_kref+0x1f5c:   	udiv	%o4, %o3, %l4
	.word	0xaa9ac00a	! t1_kref+0x1f60:   	xorcc	%o3, %o2, %l5
	.word	0xee062010	! t1_kref+0x1f64:   	ld	[%i0 + 0x10], %l7
	.word	0xa1b48dd2	! t1_kref+0x1f68:   	fnand	%f18, %f18, %f16
	.word	0xac7b283a	! t1_kref+0x1f6c:   	sdiv	%o4, 0x83a, %l6
	.word	0x2f800002	! t1_kref+0x1f70:   	fbu,a	_kref+0x1f78
	.word	0xe7070019	! t1_kref+0x1f74:   	ld	[%i4 + %i1], %f19
	.word	0xfb00a034	! t1_kref+0x1f78:   	ld	[%g2 + 0x34], %f29
	.word	0xc9ee500a	! t1_kref+0x1f7c:   	prefetcha	%i1 + %o2, 4
	.word	0xb9a489b1	! t1_kref+0x1f80:   	fdivs	%f18, %f17, %f28
	.word	0xe810a03c	! t1_kref+0x1f84:   	lduh	[%g2 + 0x3c], %l4
	.word	0xe51fbdf8	! t1_kref+0x1f88:   	ldd	[%fp - 0x208], %f18
	.word	0xac033346	! t1_kref+0x1f8c:   	add	%o4, -0xcba, %l6
	.word	0xae3a400c	! t1_kref+0x1f90:   	xnor	%o1, %o4, %l7
	.word	0xae1ac009	! t1_kref+0x1f94:   	xor	%o3, %o1, %l7
	.word	0xaa3a800c	! t1_kref+0x1f98:   	xnor	%o2, %o4, %l5
	.word	0xf9be1a1c	! t1_kref+0x1f9c:   	stda	%f28, [%i0 + %i4]0xd0
	.word	0xb1a709d4	! t1_kref+0x1fa0:   	fdivd	%f28, %f20, %f24
	.word	0x900aedeb	! t1_kref+0x1fa4:   	and	%o3, 0xdeb, %o0
	.word	0xa69afe47	! t1_kref+0x1fa8:   	xorcc	%o3, -0x1b9, %l3
	.word	0xa1b406de	! t1_kref+0x1fac:   	fmul8sux16	%f16, %f30, %f16
	.word	0x2c800002	! t1_kref+0x1fb0:   	bneg,a	_kref+0x1fb8
	.word	0xa9b4851a	! t1_kref+0x1fb4:   	fcmpgt16	%f18, %f26, %l4
	.word	0x922ab315	! t1_kref+0x1fb8:   	andn	%o2, -0xceb, %o1
	.word	0xb1a01912	! t1_kref+0x1fbc:   	fitod	%f18, %f24
	.word	0xd43f4019	! t1_kref+0x1fc0:   	std	%o2, [%i5 + %i1]
	.word	0xf700a004	! t1_kref+0x1fc4:   	ld	[%g2 + 4], %f27
	.word	0xa8da400c	! t1_kref+0x1fc8:   	smulcc	%o1, %o4, %l4
	.word	0xea50a016	! t1_kref+0x1fcc:   	ldsh	[%g2 + 0x16], %l5
	.word	0xaaab2478	! t1_kref+0x1fd0:   	andncc	%o4, 0x478, %l5
	.word	0xea067ffc	! t1_kref+0x1fd4:   	ld	[%i1 - 4], %l5
	.word	0xa85a8009	! t1_kref+0x1fd8:   	smul	%o2, %o1, %l4
	.word	0x37480003	! t1_kref+0x1fdc:   	fbge,a,pt	%fcc0, _kref+0x1fe8
	.word	0xa6b2ec4f	! t1_kref+0x1fe0:   	orncc	%o3, 0xc4f, %l3
	.word	0x91b584d6	! t1_kref+0x1fe4:   	fcmpne32	%f22, %f22, %o0
	.word	0xac1b000b	! t1_kref+0x1fe8:   	xor	%o4, %o3, %l6
	.word	0x90d2c00a	! t1_kref+0x1fec:   	umulcc	%o3, %o2, %o0
	.word	0xb1a01918	! t1_kref+0x1ff0:   	fitod	%f24, %f24
	.word	0x2c480006	! t1_kref+0x1ff4:   	bneg,a,pt	%icc, _kref+0x200c
	.word	0xd4ee5000	! t1_kref+0x1ff8:   	ldstuba	[%i1]0x80, %o2
	.word	0xa1a58854	! t1_kref+0x1ffc:   	faddd	%f22, %f20, %f16
	.word	0xd420a004	! t1_kref+0x2000:   	st	%o2, [%g2 + 4]
	.word	0xd056c019	! t1_kref+0x2004:   	ldsh	[%i3 + %i1], %o0
	.word	0xa9a74d32	! t1_kref+0x2008:   	fsmuld	%f29, %f18, %f20
	.word	0xe900a00c	! t1_kref+0x200c:   	ld	[%g2 + 0xc], %f20
	.word	0xa4aa8009	! t1_kref+0x2010:   	andncc	%o2, %o1, %l2
	.word	0xf120a034	! t1_kref+0x2014:   	st	%f24, [%g2 + 0x34]
	.word	0xa7a0053e	! t1_kref+0x2018:   	fsqrts	%f30, %f19
	.word	0xafb585d4	! t1_kref+0x201c:   	fcmpeq32	%f22, %f20, %l7
	.word	0x903b0009	! t1_kref+0x2020:   	xnor	%o4, %o1, %o0
	.word	0x23800003	! t1_kref+0x2024:   	fbne,a	_kref+0x2030
	.word	0xada00558	! t1_kref+0x2028:   	fsqrtd	%f24, %f22
	.word	0xa8aa400a	! t1_kref+0x202c:   	andncc	%o1, %o2, %l4
	.word	0x21480001	! t1_kref+0x2030:   	fbn,a,pt	%fcc0, _kref+0x2034
	.word	0xaf12800c	! t1_kref+0x2034:   	taddcctv	%o2, %o4, %l7
	.word	0x9de3bfa0	! t1_kref+0x2038:   	save	%sp, -0x60, %sp
	.word	0xbabe001d	! t1_kref+0x203c:   	xnorcc	%i0, %i5, %i5
	.word	0x93eef54f	! t1_kref+0x2040:   	restore	%i3, -0xab1, %o1
	.word	0xa8db2317	! t1_kref+0x2044:   	smulcc	%o4, 0x317, %l4
	.word	0xbda4cd3d	! t1_kref+0x2048:   	fsmuld	%f19, %f29, %f30
	.word	0xa6626464	! t1_kref+0x204c:   	subc	%o1, 0x464, %l3
	.word	0xe13e001d	! t1_kref+0x2050:   	std	%f16, [%i0 + %i5]
	.word	0x2e480002	! t1_kref+0x2054:   	bvs,a,pt	%icc, _kref+0x205c
	.word	0xed68a04a	! t1_kref+0x2058:   	prefetch	%g2 + 0x4a, 22
	.word	0x908a4009	! t1_kref+0x205c:   	andcc	%o1, %o1, %o0
	.word	0xa9227cec	! t1_kref+0x2060:   	mulscc	%o1, -0x314, %l4
	.word	0xac2a7b61	! t1_kref+0x2064:   	andn	%o1, -0x49f, %l6
	.word	0xa9b240ab	! t1_kref+0x2068:   	edge16n	%o1, %o3, %l4
	.word	0xf93f4018	! t1_kref+0x206c:   	std	%f28, [%i5 + %i0]
	.word	0xa3a01896	! t1_kref+0x2070:   	fitos	%f22, %f17
	.word	0xbbb68ef7	! t1_kref+0x2074:   	fornot2s	%f26, %f23, %f29
	.word	0xedee101c	! t1_kref+0x2078:   	prefetcha	%i0 + %i4, 22
	.word	0x93b2c10a	! t1_kref+0x207c:   	edge32	%o3, %o2, %o1
	.word	0xa6bab0d8	! t1_kref+0x2080:   	xnorcc	%o2, -0xf28, %l3
	.word	0xa61b2eb5	! t1_kref+0x2084:   	xor	%o4, 0xeb5, %l3
	.word	0xeb68a087	! t1_kref+0x2088:   	prefetch	%g2 + 0x87, 21
	.word	0xa5330009	! t1_kref+0x208c:   	srl	%o4, %o1, %l2
	.word	0xf9be588c	! t1_kref+0x2090:   	stda	%f28, [%i1 + %o4]0xc4
	.word	0xa5a01058	! t1_kref+0x2094:   	fdtox	%f24, %f18
	.word	0xa62abe09	! t1_kref+0x2098:   	andn	%o2, -0x1f7, %l3
	.word	0xe1380019	! t1_kref+0x209c:   	std	%f16, [%g0 + %i1]
	.word	0xa6a263a4	! t1_kref+0x20a0:   	subcc	%o1, 0x3a4, %l3
	.word	0xa43b000a	! t1_kref+0x20a4:   	xnor	%o4, %o2, %l2
	.word	0xaf0b37a4	! t1_kref+0x20a8:   	tsubcc	%o4, -0x85c, %l7
	.word	0xe8866010	! t1_kref+0x20ac:   	lda	[%i1 + 0x10]%asi, %l4
	.word	0xa5b40514	! t1_kref+0x20b0:   	fcmpgt16	%f16, %f20, %l2
	.word	0xa5a01094	! t1_kref+0x20b4:   	fxtos	%f20, %f18
	.word	0xa9b009bb	! t1_kref+0x20b8:   	fexpand	%f27, %f20
	.word	0xb7b00fe0	! t1_kref+0x20bc:   	fones	%f27
	.word	0x2f800004	! t1_kref+0x20c0:   	fbu,a	_kref+0x20d0
	.word	0xa53a6007	! t1_kref+0x20c4:   	sra	%o1, 0x7, %l2
	.word	0xb5b78db3	! t1_kref+0x20c8:   	fxors	%f30, %f19, %f26
	.word	0xb9a00556	! t1_kref+0x20cc:   	fsqrtd	%f22, %f28
	.word	0x9fc10000	! t1_kref+0x20d0:   	call	%g4
	.word	0xb1b00f32	! t1_kref+0x20d4:   	fsrc2s	%f18, %f24
	.word	0xeafe501c	! t1_kref+0x20d8:   	swapa	[%i1 + %i4]0x80, %l5
	.word	0xeb264000	! t1_kref+0x20dc:   	st	%f21, [%i1]
	.word	0xada58836	! t1_kref+0x20e0:   	fadds	%f22, %f22, %f22
	.word	0x913a6001	! t1_kref+0x20e4:   	sra	%o1, 0x1, %o0
	.word	0xa5b70750	! t1_kref+0x20e8:   	fpack32	%f28, %f16, %f18
	.word	0xa9a48854	! t1_kref+0x20ec:   	faddd	%f18, %f20, %f20
	.word	0xeb06401c	! t1_kref+0x20f0:   	ld	[%i1 + %i4], %f21
	.word	0xe81e3ff0	! t1_kref+0x20f4:   	ldd	[%i0 - 0x10], %l4
	.word	0xefe6100b	! t1_kref+0x20f8:   	casa	[%i0]0x80, %o3, %l7
	.word	0x2c800006	! t1_kref+0x20fc:   	bneg,a	_kref+0x2114
	.word	0xada588d6	! t1_kref+0x2100:   	fsubd	%f22, %f22, %f22
	.word	0x903a7189	! t1_kref+0x2104:   	xnor	%o1, -0xe77, %o0
	.word	0x3a480006	! t1_kref+0x2108:   	bcc,a,pt	%icc, _kref+0x2120
	.word	0xd220a004	! t1_kref+0x210c:   	st	%o1, [%g2 + 4]
	.word	0xd420a034	! t1_kref+0x2110:   	st	%o2, [%g2 + 0x34]
	.word	0xa8bb000a	! t1_kref+0x2114:   	xnorcc	%o4, %o2, %l4
	.word	0xa65ac009	! t1_kref+0x2118:   	smul	%o3, %o1, %l3
	.word	0xe440a014	! t1_kref+0x211c:   	ldsw	[%g2 + 0x14], %l2
	.word	0xfd20a00c	! t1_kref+0x2120:   	st	%f30, [%g2 + 0xc]
	.word	0x23800005	! t1_kref+0x2124:   	fbne,a	_kref+0x2138
	.word	0xe84e001a	! t1_kref+0x2128:   	ldsb	[%i0 + %i2], %l4
	.word	0xaa32beb7	! t1_kref+0x212c:   	orn	%o2, -0x149, %l5
	.word	0xabb70498	! t1_kref+0x2130:   	fcmple32	%f28, %f24, %l5
	.word	0xe5260000	! t1_kref+0x2134:   	st	%f18, [%i0]
	.word	0x39800003	! t1_kref+0x2138:   	fbuge,a	_kref+0x2144
	.word	0xd0067ffc	! t1_kref+0x213c:   	ld	[%i1 - 4], %o0
	.word	0xbba6c9bd	! t1_kref+0x2140:   	fdivs	%f27, %f29, %f29
	.word	0xd87e3ffc	! t1_kref+0x2144:   	swap	[%i0 - 4], %o4
	.word	0xf93e6008	! t1_kref+0x2148:   	std	%f28, [%i1 + 8]
	.word	0xaeaab68a	! t1_kref+0x214c:   	andncc	%o2, -0x976, %l7
	.word	0x9fc00004	! t1_kref+0x2150:   	call	%g0 + %g4
	.word	0xa5a0105e	! t1_kref+0x2154:   	fdtox	%f30, %f18
	.word	0x92c2bb34	! t1_kref+0x2158:   	addccc	%o2, -0x4cc, %o1
	.word	0x8610200f	! t1_kref+0x215c:   	mov	0xf, %g3
	.word	0x86a0e001	! t1_kref+0x2160:   	subcc	%g3, 1, %g3
	.word	0x22800015	! t1_kref+0x2164:   	be,a	_kref+0x21b8
	.word	0xae02fd78	! t1_kref+0x2168:   	add	%o3, -0x288, %l7
	.word	0x92da687f	! t1_kref+0x216c:   	smulcc	%o1, 0x87f, %o1
	.word	0x91400000	! t1_kref+0x2170:   	mov	%y, %o0
	.word	0xa9b40d9a	! t1_kref+0x2174:   	fxor	%f16, %f26, %f20
	.word	0xaba00533	! t1_kref+0x2178:   	fsqrts	%f19, %f21
	.word	0x90b2c009	! t1_kref+0x217c:   	orncc	%o3, %o1, %o0
	.word	0x3f4ffff8	! t1_kref+0x2180:   	fbo,a,pt	%fcc0, _kref+0x2160
	.word	0xa7b00774	! t1_kref+0x2184:   	fpack16	%f20, %f19
	.word	0xe9be5a5c	! t1_kref+0x2188:   	stda	%f20, [%i1 + %i4]0xd2
	.word	0xa5a01a35	! t1_kref+0x218c:   	fstoi	%f21, %f18
	.word	0xbba01894	! t1_kref+0x2190:   	fitos	%f20, %f29
	.word	0x284ffff3	! t1_kref+0x2194:   	bleu,a,pt	%icc, _kref+0x2160
	.word	0xa9400000	! t1_kref+0x2198:   	mov	%y, %l4
	.word	0x21480008	! t1_kref+0x219c:   	fbn,a,pt	%fcc0, _kref+0x21bc
	.word	0xec48a016	! t1_kref+0x21a0:   	ldsb	[%g2 + 0x16], %l6
	.word	0xb3b6cef9	! t1_kref+0x21a4:   	fornot2s	%f27, %f25, %f25
	.word	0xd03f4018	! t1_kref+0x21a8:   	std	%o0, [%i5 + %i0]
	.word	0x35800006	! t1_kref+0x21ac:   	fbue,a	_kref+0x21c4
	.word	0xe640a00c	! t1_kref+0x21b0:   	ldsw	[%g2 + 0xc], %l3
	.word	0xe9380019	! t1_kref+0x21b4:   	std	%f20, [%g0 + %i1]
	.word	0x90932608	! t1_kref+0x21b8:   	orcc	%o4, 0x608, %o0
	.word	0xd236600e	! t1_kref+0x21bc:   	sth	%o1, [%i1 + 0xe]
	.word	0xabb007b8	! t1_kref+0x21c0:   	fpackfix	%f24, %f21
	.word	0x9fc10000	! t1_kref+0x21c4:   	call	%g4
	.word	0xac92b3d1	! t1_kref+0x21c8:   	orcc	%o2, -0xc2f, %l6
	.word	0xe41e6010	! t1_kref+0x21cc:   	ldd	[%i1 + 0x10], %l2
	.word	0xae5a400a	! t1_kref+0x21d0:   	smul	%o1, %o2, %l7
	.word	0xc368a10d	! t1_kref+0x21d4:   	prefetch	%g2 + 0x10d, 1
	.word	0xf300a03c	! t1_kref+0x21d8:   	ld	[%g2 + 0x3c], %f25
	.word	0xf91fbe38	! t1_kref+0x21dc:   	ldd	[%fp - 0x1c8], %f28
	.word	0xbbb64ea0	! t1_kref+0x21e0:   	fsrc1s	%f25, %f29
	.word	0xb5b686b3	! t1_kref+0x21e4:   	fmul8x16al	%f26, %f19, %f26
	.word	0xed264000	! t1_kref+0x21e8:   	st	%f22, [%i1]
	.word	0x35800006	! t1_kref+0x21ec:   	fbue,a	_kref+0x2204
	.word	0xd8367fe8	! t1_kref+0x21f0:   	sth	%o4, [%i1 - 0x18]
	.word	0xb1a0189c	! t1_kref+0x21f4:   	fitos	%f28, %f24
	.word	0xb6103fea	! t1_kref+0x21f8:   	mov	0xffffffea, %i3
	.word	0xe5066018	! t1_kref+0x21fc:   	ld	[%i1 + 0x18], %f18
	.word	0xad0b000b	! t1_kref+0x2200:   	tsubcc	%o4, %o3, %l6
	.word	0xa9a01931	! t1_kref+0x2204:   	fstod	%f17, %f20
	.word	0x93b70412	! t1_kref+0x2208:   	fcmple16	%f28, %f18, %o1
	.word	0x9012aeb6	! t1_kref+0x220c:   	or	%o2, 0xeb6, %o0
	.word	0x923a63a7	! t1_kref+0x2210:   	xnor	%o1, 0x3a7, %o1
	.word	0xc56e6000	! t1_kref+0x2214:   	prefetch	%i1, 2
	.word	0xd42e8019	! t1_kref+0x2218:   	stb	%o2, [%i2 + %i1]
	.word	0xbda78d35	! t1_kref+0x221c:   	fsmuld	%f30, %f21, %f30
	.word	0xbba00532	! t1_kref+0x2220:   	fsqrts	%f18, %f29
	.word	0xacd2767a	! t1_kref+0x2224:   	umulcc	%o1, -0x986, %l6
	.word	0xbdb606bb	! t1_kref+0x2228:   	fmul8x16al	%f24, %f27, %f30
	.word	0xa882c009	! t1_kref+0x222c:   	addcc	%o3, %o1, %l4
	.word	0xb7b6cdb7	! t1_kref+0x2230:   	fxors	%f27, %f23, %f27
	.word	0xb5a4c93b	! t1_kref+0x2234:   	fmuls	%f19, %f27, %f26
	.word	0xaeaafb15	! t1_kref+0x2238:   	andncc	%o3, -0x4eb, %l7
	.word	0x81ac8ab9	! t1_kref+0x223c:   	fcmpes	%fcc0, %f18, %f25
	.word	0xa9a78952	! t1_kref+0x2240:   	fmuld	%f30, %f18, %f20
	.word	0x33480006	! t1_kref+0x2244:   	fbe,a,pt	%fcc0, _kref+0x225c
	.word	0xe3871018	! t1_kref+0x2248:   	lda	[%i4 + %i0]0x80, %f17
	.word	0xee06600c	! t1_kref+0x224c:   	ld	[%i1 + 0xc], %l7
	.word	0xa6b3000b	! t1_kref+0x2250:   	orncc	%o4, %o3, %l3
	.word	0x26800003	! t1_kref+0x2254:   	bl,a	_kref+0x2260
	.word	0xf5063fec	! t1_kref+0x2258:   	ld	[%i0 - 0x14], %f26
	.word	0x9fc00004	! t1_kref+0x225c:   	call	%g0 + %g4
	.word	0xa5a00038	! t1_kref+0x2260:   	fmovs	%f24, %f18
	.word	0xd636200a	! t1_kref+0x2264:   	sth	%o3, [%i0 + 0xa]
	.word	0xbba0189b	! t1_kref+0x2268:   	fitos	%f27, %f29
	.word	0xf93e7ff8	! t1_kref+0x226c:   	std	%f28, [%i1 - 8]
	.word	0x21800007	! t1_kref+0x2270:   	fbn,a	_kref+0x228c
	.word	0x81828000	! t1_kref+0x2274:   	wr	%o2, %g0, %y
	.word	0xf720a01c	! t1_kref+0x2278:   	st	%f27, [%g2 + 0x1c]
	.word	0xa4928009	! t1_kref+0x227c:   	orcc	%o2, %o1, %l2
	.word	0xf56e001a	! t1_kref+0x2280:   	prefetch	%i0 + %i2, 26
	.word	0xa9400000	! t1_kref+0x2284:   	mov	%y, %l4
	.word	0x9fc00004	! t1_kref+0x2288:   	call	%g0 + %g4
	.word	0xa61b2329	! t1_kref+0x228c:   	xor	%o4, 0x329, %l3
	.word	0x902a400b	! t1_kref+0x2290:   	andn	%o1, %o3, %o0
	call	SYM(t1_subr2)
	.word	0xa4aac009	! t1_kref+0x2298:   	andncc	%o3, %o1, %l2
	.word	0x3b800003	! t1_kref+0x229c:   	fble,a	_kref+0x22a8
	.word	0xf56e401c	! t1_kref+0x22a0:   	prefetch	%i1 + %i4, 26
	.word	0xd620a03c	! t1_kref+0x22a4:   	st	%o3, [%g2 + 0x3c]
	.word	0xbdb58914	! t1_kref+0x22a8:   	faligndata	%f22, %f20, %f30
	.word	0x38480001	! t1_kref+0x22ac:   	bgu,a,pt	%icc, _kref+0x22b0
	.word	0xa922800c	! t1_kref+0x22b0:   	mulscc	%o2, %o4, %l4
	.word	0x8143c000	! t1_kref+0x22b4:   	stbar
	.word	0x3e800007	! t1_kref+0x22b8:   	bvc,a	_kref+0x22d4
	.word	0xee8e101a	! t1_kref+0x22bc:   	lduba	[%i0 + %i2]0x80, %l7
	.word	0xbda0003b	! t1_kref+0x22c0:   	fmovs	%f27, %f30
	.word	0x8143c000	! t1_kref+0x22c4:   	stbar
	.word	0xe1bf5a59	! t1_kref+0x22c8:   	stda	%f16, [%i5 + %i1]0xd2
	.word	0xd1e6500c	! t1_kref+0x22cc:   	casa	[%i1]0x80, %o4, %o0
	.word	0xd210a026	! t1_kref+0x22d0:   	lduh	[%g2 + 0x26], %o1
	.word	0x2a480008	! t1_kref+0x22d4:   	bcs,a,pt	%icc, _kref+0x22f4
	.word	0xaa1b319e	! t1_kref+0x22d8:   	xor	%o4, -0xe62, %l5
	.word	0x93b4849c	! t1_kref+0x22dc:   	fcmple32	%f18, %f28, %o1
	.word	0xb5a00558	! t1_kref+0x22e0:   	fsqrtd	%f24, %f26
	.word	0xa1a0191a	! t1_kref+0x22e4:   	fitod	%f26, %f16
	.word	0x9fc10000	! t1_kref+0x22e8:   	call	%g4
	.word	0xb5a00556	! t1_kref+0x22ec:   	fsqrtd	%f22, %f26
	.word	0x925b0009	! t1_kref+0x22f0:   	smul	%o4, %o1, %o1
	.word	0xb9a7895a	! t1_kref+0x22f4:   	fmuld	%f30, %f26, %f28
	.word	0x901a7f6e	! t1_kref+0x22f8:   	xor	%o1, -0x92, %o0
	.word	0x2b800008	! t1_kref+0x22fc:   	fbug,a	_kref+0x231c
	.word	0xb5b70ed0	! t1_kref+0x2300:   	fornot2	%f28, %f16, %f26
	.word	0x24480004	! t1_kref+0x2304:   	ble,a,pt	%icc, _kref+0x2314
	.word	0xa892f468	! t1_kref+0x2308:   	orcc	%o3, -0xb98, %l4
	.word	0xe13e3fe0	! t1_kref+0x230c:   	std	%f16, [%i0 - 0x20]
	.word	0x28800008	! t1_kref+0x2310:   	bleu,a	_kref+0x2330
	.word	0xe6060000	! t1_kref+0x2314:   	ld	[%i0], %l3
	.word	0xbda0055a	! t1_kref+0x2318:   	fsqrtd	%f26, %f30
	.word	0xa6aa4009	! t1_kref+0x231c:   	andncc	%o1, %o1, %l3
	.word	0xf9beda58	! t1_kref+0x2320:   	stda	%f28, [%i3 + %i0]0xd2
	.word	0xa783000c	! t1_kref+0x2324:   	wr	%o4, %o4, %gsr
	.word	0xe6d0200e	! t1_kref+0x2328:   	ldsha	[%g0 + 0xe]%asi, %l3
	.word	0xa802f0f1	! t1_kref+0x232c:   	add	%o3, -0xf0f, %l4
	.word	0xaba6c831	! t1_kref+0x2330:   	fadds	%f27, %f17, %f21
	.word	0xa51ab3c3	! t1_kref+0x2334:   	tsubcctv	%o2, -0xc3d, %l2
	.word	0xa9b6897b	! t1_kref+0x2338:   	fpmerge	%f26, %f27, %f20
	.word	0xeb267ffc	! t1_kref+0x233c:   	st	%f21, [%i1 - 4]
	.word	0xa4aaaef9	! t1_kref+0x2340:   	andncc	%o2, 0xef9, %l2
	.word	0xab12400c	! t1_kref+0x2344:   	taddcctv	%o1, %o4, %l5
	.word	0xb7b68f7a	! t1_kref+0x2348:   	fornot1s	%f26, %f26, %f27
	.word	0xac928009	! t1_kref+0x234c:   	orcc	%o2, %o1, %l6
	.word	0xd01e401d	! t1_kref+0x2350:   	ldd	[%i1 + %i5], %o0
	.word	0xa4928009	! t1_kref+0x2354:   	orcc	%o2, %o1, %l2
	.word	0xed68a04b	! t1_kref+0x2358:   	prefetch	%g2 + 0x4b, 22
	.word	0xa4b2c009	! t1_kref+0x235c:   	orncc	%o3, %o1, %l2
	.word	0x81ad4abb	! t1_kref+0x2360:   	fcmpes	%fcc0, %f21, %f27
	.word	0xa5b6871c	! t1_kref+0x2364:   	fmuld8sux16	%f26, %f28, %f18
	.word	0xadb30280	! t1_kref+0x2368:   	array32	%o4, %g0, %l6
	.word	0x33800004	! t1_kref+0x236c:   	fbe,a	_kref+0x237c
	.word	0x93b70514	! t1_kref+0x2370:   	fcmpgt16	%f28, %f20, %o1
	.word	0xc36e400b	! t1_kref+0x2374:   	prefetch	%i1 + %o3, 1
	.word	0xbda00058	! t1_kref+0x2378:   	fmovd	%f24, %f30
	.word	0xb5a40956	! t1_kref+0x237c:   	fmuld	%f16, %f22, %f26
	.word	0xf9066008	! t1_kref+0x2380:   	ld	[%i1 + 8], %f28
	.word	0xa5a48954	! t1_kref+0x2384:   	fmuld	%f18, %f20, %f18
	.word	0x90aa79df	! t1_kref+0x2388:   	andncc	%o1, -0x621, %o0
	.word	0xa7a01891	! t1_kref+0x238c:   	fitos	%f17, %f19
	.word	0x878020d0	! t1_kref+0x2390:   	mov	0xd0, %asi
	.word	0xee8e9019	! t1_kref+0x2394:   	lduba	[%i2 + %i1]0x80, %l7
	.word	0xae2b0009	! t1_kref+0x2398:   	andn	%o4, %o1, %l7
	.word	0x903b2cca	! t1_kref+0x239c:   	xnor	%o4, 0xcca, %o0
	.word	0x001fffff	! t1_kref+0x23a0:   	illtrap	0x1fffff
	.word	0xf9be5a1d	! t1_kref+0x23a4:   	stda	%f28, [%i1 + %i5]0xd0
	.word	0x86102011	! t1_kref+0x23a8:   	mov	0x11, %g3
	.word	0x86a0e001	! t1_kref+0x23ac:   	subcc	%g3, 1, %g3
	.word	0x2280000c	! t1_kref+0x23b0:   	be,a	_kref+0x23e0
	.word	0xf3200018	! t1_kref+0x23b4:   	st	%f25, [%g0 + %i0]
	.word	0xa9a00031	! t1_kref+0x23b8:   	fmovs	%f17, %f20
	.word	0xa60a800a	! t1_kref+0x23bc:   	and	%o2, %o2, %l3
	.word	0xa5b685d8	! t1_kref+0x23c0:   	fcmpeq32	%f26, %f24, %l2
	.word	0x2dbffffa	! t1_kref+0x23c4:   	fbg,a	_kref+0x23ac
	.word	0xa632400b	! t1_kref+0x23c8:   	orn	%o1, %o3, %l3
	.word	0xb9a01919	! t1_kref+0x23cc:   	fitod	%f25, %f28
	.word	0xa4633f9a	! t1_kref+0x23d0:   	subc	%o4, -0x66, %l2
	.word	0xab228009	! t1_kref+0x23d4:   	mulscc	%o2, %o1, %l5
	.word	0xada549b7	! t1_kref+0x23d8:   	fdivs	%f21, %f23, %f22
	.word	0x905b305e	! t1_kref+0x23dc:   	smul	%o4, -0xfa2, %o0
	.word	0xe6d0105b	! t1_kref+0x23e0:   	ldsha	[%g0 + %i3]0x82, %l3
	.word	0xee8e9019	! t1_kref+0x23e4:   	lduba	[%i2 + %i1]0x80, %l7
	.word	0xd248a00f	! t1_kref+0x23e8:   	ldsb	[%g2 + 0xf], %o1
	.word	0xa1a788d4	! t1_kref+0x23ec:   	fsubd	%f30, %f20, %f16
	.word	0xaaab000c	! t1_kref+0x23f0:   	andncc	%o4, %o4, %l5
	.word	0x81dfeca0	! t1_kref+0x23f4:   	flush	%i7 + 0xca0
	.word	0xa42afad8	! t1_kref+0x23f8:   	andn	%o3, -0x528, %l2
	.word	0x922a400c	! t1_kref+0x23fc:   	andn	%o1, %o4, %o1
	.word	0xd2480019	! t1_kref+0x2400:   	ldsb	[%g0 + %i1], %o1
	.word	0xacdb3f83	! t1_kref+0x2404:   	smulcc	%o4, -0x7d, %l6
	.word	0xa433293e	! t1_kref+0x2408:   	orn	%o4, 0x93e, %l2
	.word	0xaf13000c	! t1_kref+0x240c:   	taddcctv	%o4, %o4, %l7
	.word	0xe56e001d	! t1_kref+0x2410:   	prefetch	%i0 + %i5, 18
	.word	0xada01916	! t1_kref+0x2414:   	fitod	%f22, %f22
	.word	0xb9a00539	! t1_kref+0x2418:   	fsqrts	%f25, %f28
	.word	0x2b480007	! t1_kref+0x241c:   	fbug,a,pt	%fcc0, _kref+0x2438
	.word	0xada609d4	! t1_kref+0x2420:   	fdivd	%f24, %f20, %f22
	.word	0xa482800a	! t1_kref+0x2424:   	addcc	%o2, %o2, %l2
	.word	0xeb68a040	! t1_kref+0x2428:   	prefetch	%g2 + 0x40, 21
	.word	0xb5a688d2	! t1_kref+0x242c:   	fsubd	%f26, %f18, %f26
	.word	0x3c480007	! t1_kref+0x2430:   	bpos,a,pt	%icc, _kref+0x244c
	.word	0x90330009	! t1_kref+0x2434:   	orn	%o4, %o1, %o0
	.word	0xd230a034	! t1_kref+0x2438:   	sth	%o1, [%g2 + 0x34]
	.word	0xeb871018	! t1_kref+0x243c:   	lda	[%i4 + %i0]0x80, %f21
	.word	0x31800003	! t1_kref+0x2440:   	fba,a	_kref+0x244c
	.word	0xf7263fe0	! t1_kref+0x2444:   	st	%f27, [%i0 - 0x20]
	.word	0xd2360000	! t1_kref+0x2448:   	sth	%o1, [%i0]
	.word	0xabb505de	! t1_kref+0x244c:   	fcmpeq32	%f20, %f30, %l5
	.word	0x90b2c00c	! t1_kref+0x2450:   	orncc	%o3, %o4, %o0
	.word	0xac02698f	! t1_kref+0x2454:   	add	%o1, 0x98f, %l6
	.word	0xada01898	! t1_kref+0x2458:   	fitos	%f24, %f22
	.word	0x92d27b98	! t1_kref+0x245c:   	umulcc	%o1, -0x468, %o1
	.word	0xe1be588a	! t1_kref+0x2460:   	stda	%f16, [%i1 + %o2]0xc4
	.word	0xd03e6008	! t1_kref+0x2464:   	std	%o0, [%i1 + 8]
	.word	0xb7a00031	! t1_kref+0x2468:   	fmovs	%f17, %f27
	.word	0xb1a01094	! t1_kref+0x246c:   	fxtos	%f20, %f24
	.word	0x8143c000	! t1_kref+0x2470:   	stbar
	.word	0x92c2800c	! t1_kref+0x2474:   	addccc	%o2, %o4, %o1
	.word	0xb5a01919	! t1_kref+0x2478:   	fitod	%f25, %f26
	.word	0xa9a000d2	! t1_kref+0x247c:   	fnegd	%f18, %f20
	.word	0xa43b2dbe	! t1_kref+0x2480:   	xnor	%o4, 0xdbe, %l2
	.word	0xd43e7fe0	! t1_kref+0x2484:   	std	%o2, [%i1 - 0x20]
	.word	0x9fc10000	! t1_kref+0x2488:   	call	%g4
	.word	0xef00a01c	! t1_kref+0x248c:   	ld	[%g2 + 0x1c], %f23
	.word	0xb1a0191b	! t1_kref+0x2490:   	fitod	%f27, %f24
	.word	0xa5a0191b	! t1_kref+0x2494:   	fitod	%f27, %f18
	.word	0xb1a00052	! t1_kref+0x2498:   	fmovd	%f18, %f24
	.word	0xd4366000	! t1_kref+0x249c:   	sth	%o2, [%i1]
	.word	0x933a601f	! t1_kref+0x24a0:   	sra	%o1, 0x1f, %o1
	.word	0x913aa005	! t1_kref+0x24a4:   	sra	%o2, 0x5, %o0
	.word	0xc12e001c	! t1_kref+0x24a8:   	st	%fsr, [%i0 + %i4]
	.word	0xb1a0191d	! t1_kref+0x24ac:   	fitod	%f29, %f24
	.word	0x9f414000	! t1_kref+0x24b0:   	mov	%pc, %o7
!	.word	0x2085b6d2	! t1_kref+0x24b4:   	bn,a	SYM(t1_subr1)
	   	bn,a	SYM(t1_subr1)
	.word	0xae1b3efb	! t1_kref+0x24b8:   	xor	%o4, -0x105, %l7
	.word	0xd630a036	! t1_kref+0x24bc:   	sth	%o3, [%g2 + 0x36]
	.word	0x31800002	! t1_kref+0x24c0:   	fba,a	_kref+0x24c8
	.word	0xad2a400a	! t1_kref+0x24c4:   	sll	%o1, %o2, %l6
	.word	0xaba00134	! t1_kref+0x24c8:   	fabss	%f20, %f21
	.word	0xfdee101b	! t1_kref+0x24cc:   	prefetcha	%i0 + %i3, 30
	.word	0xd430a01e	! t1_kref+0x24d0:   	sth	%o2, [%g2 + 0x1e]
	.word	0xadb2810a	! t1_kref+0x24d4:   	edge32	%o2, %o2, %l6
	.word	0xb9a0189e	! t1_kref+0x24d8:   	fitos	%f30, %f28
	.word	0xb5a50d37	! t1_kref+0x24dc:   	fsmuld	%f20, %f23, %f26
	.word	0xa7827751	! t1_kref+0x24e0:   	wr	%o1, 0xfffff751, %gsr
	.word	0x81ae0ada	! t1_kref+0x24e4:   	fcmped	%fcc0, %f24, %f26
	.word	0x90bae36b	! t1_kref+0x24e8:   	xnorcc	%o3, 0x36b, %o0
	.word	0x8d82f02e	! t1_kref+0x24ec:   	wr	%o3, 0xfffff02e, %fprs
	.word	0x33800008	! t1_kref+0x24f0:   	fbe,a	_kref+0x2510
	.word	0xec1e2010	! t1_kref+0x24f4:   	ldd	[%i0 + 0x10], %l6
	.word	0xf9063ffc	! t1_kref+0x24f8:   	ld	[%i0 - 4], %f28
	.word	0xabb00776	! t1_kref+0x24fc:   	fpack16	%f22, %f21
	.word	0xea062014	! t1_kref+0x2500:   	ld	[%i0 + 0x14], %l5
	.word	0x905ac009	! t1_kref+0x2504:   	smul	%o3, %o1, %o0
	.word	0xf13e6000	! t1_kref+0x2508:   	std	%f24, [%i1]
	.word	0xa8b2e72f	! t1_kref+0x250c:   	orncc	%o3, 0x72f, %l4
	.word	0xb9a6895e	! t1_kref+0x2510:   	fmuld	%f26, %f30, %f28
	.word	0xd628a025	! t1_kref+0x2514:   	stb	%o3, [%g2 + 0x25]
	.word	0xa92a6004	! t1_kref+0x2518:   	sll	%o1, 0x4, %l4
	.word	0x2b17a662	! t1_kref+0x251c:   	sethi	%hi(0x5e998800), %l5
	.word	0xacbaa812	! t1_kref+0x2520:   	xnorcc	%o2, 0x812, %l6
	.word	0xb9a01a34	! t1_kref+0x2524:   	fstoi	%f20, %f28
	.word	0x8143c000	! t1_kref+0x2528:   	stbar
	.word	0xa892400c	! t1_kref+0x252c:   	orcc	%o1, %o4, %l4
	.word	0xf5263fe8	! t1_kref+0x2530:   	st	%f26, [%i0 - 0x18]
	.word	0xb9a01a5c	! t1_kref+0x2534:   	fdtoi	%f28, %f28
	.word	0xe448a016	! t1_kref+0x2538:   	ldsb	[%g2 + 0x16], %l2
	.word	0x20480007	! t1_kref+0x253c:   	bn,a,pt	%icc, _kref+0x2558
	.word	0xe81e6008	! t1_kref+0x2540:   	ldd	[%i1 + 8], %l4
	.word	0xe64e7fea	! t1_kref+0x2544:   	ldsb	[%i1 - 0x16], %l3
	.word	0xa6f2a017	! t1_kref+0x2548:   	udivcc	%o2, 0x17, %l3
	.word	0x92030009	! t1_kref+0x254c:   	add	%o4, %o1, %o1
	.word	0xbba0003e	! t1_kref+0x2550:   	fmovs	%f30, %f29
	.word	0xa9a60854	! t1_kref+0x2554:   	faddd	%f24, %f20, %f20
	.word	0xa63aa291	! t1_kref+0x2558:   	xnor	%o2, 0x291, %l3
	.word	0xada708d2	! t1_kref+0x255c:   	fsubd	%f28, %f18, %f22
	.word	0xb1a58936	! t1_kref+0x2560:   	fmuls	%f22, %f22, %f24
	.word	0xac22bdd3	! t1_kref+0x2564:   	sub	%o2, -0x22d, %l6
	.word	0xa3a0053d	! t1_kref+0x2568:   	fsqrts	%f29, %f17
	.word	0xe80e001a	! t1_kref+0x256c:   	ldub	[%i0 + %i2], %l4
	.word	0xae13000c	! t1_kref+0x2570:   	or	%o4, %o4, %l7
	.word	0xa672800c	! t1_kref+0x2574:   	udiv	%o2, %o4, %l3
	.word	0xa3a789b6	! t1_kref+0x2578:   	fdivs	%f30, %f22, %f17
	.word	0xa60aaee4	! t1_kref+0x257c:   	and	%o2, 0xee4, %l3
	.word	0xbba01a32	! t1_kref+0x2580:   	fstoi	%f18, %f29
	.word	0xea00a02c	! t1_kref+0x2584:   	ld	[%g2 + 0x2c], %l5
	.word	0xada70856	! t1_kref+0x2588:   	faddd	%f28, %f22, %f22
	.word	0x3f800006	! t1_kref+0x258c:   	fbo,a	_kref+0x25a4
	.word	0xe3a01019	! t1_kref+0x2590:   	sta	%f17, [%g0 + %i1]0x80
	.word	0xf1380018	! t1_kref+0x2594:   	std	%f24, [%g0 + %i0]
	.word	0xd830a034	! t1_kref+0x2598:   	sth	%o4, [%g2 + 0x34]
	.word	0xea470019	! t1_kref+0x259c:   	ldsw	[%i4 + %i1], %l5
	.word	0xb5a0193b	! t1_kref+0x25a0:   	fstod	%f27, %f26
	.word	0xaa3a800c	! t1_kref+0x25a4:   	xnor	%o2, %o4, %l5
	.word	0xa7a0003d	! t1_kref+0x25a8:   	fmovs	%f29, %f19
	.word	0x81dbed60	! t1_kref+0x25ac:   	flush	%o7 + 0xd60
	.word	0x31800004	! t1_kref+0x25b0:   	fba,a	_kref+0x25c0
	.word	0xaec32233	! t1_kref+0x25b4:   	addccc	%o4, 0x233, %l7
	.word	0xac2aa45d	! t1_kref+0x25b8:   	andn	%o2, 0x45d, %l6
	.word	0xa9a018d4	! t1_kref+0x25bc:   	fdtos	%f20, %f20
	.word	0xbda70d35	! t1_kref+0x25c0:   	fsmuld	%f28, %f21, %f30
	.word	0xa82aa571	! t1_kref+0x25c4:   	andn	%o2, 0x571, %l4
	.word	0x86102003	! t1_kref+0x25c8:   	mov	0x3, %g3
	.word	0x32800000	! t1_kref+0x25cc:   	bne,a	_kref+0x25cc
	.word	0x86a0e001	! t1_kref+0x25d0:   	subcc	%g3, 1, %g3
	.word	0xe1e61009	! t1_kref+0x25d4:   	casa	[%i0]0x80, %o1, %l0
	.word	0xd3f6500a	! t1_kref+0x25d8:   	casxa	[%i1]0x80, %o2, %o1
	.word	0x81acca37	! t1_kref+0x25dc:   	fcmps	%fcc0, %f19, %f23
	.word	0xb3b4cd3a	! t1_kref+0x25e0:   	fandnot1s	%f19, %f26, %f25
	.word	0xd4363fe2	! t1_kref+0x25e4:   	sth	%o2, [%i0 - 0x1e]
	.word	0x9140c000	! t1_kref+0x25e8:   	mov	%asi, %o0
	.word	0xbda48d3a	! t1_kref+0x25ec:   	fsmuld	%f18, %f26, %f30
	.word	0xa9a64d32	! t1_kref+0x25f0:   	fsmuld	%f25, %f18, %f20
	.word	0x86102001	! t1_kref+0x25f4:   	mov	0x1, %g3
	.word	0x32800000	! t1_kref+0x25f8:   	bne,a	_kref+0x25f8
	.word	0x86a0e001	! t1_kref+0x25fc:   	subcc	%g3, 1, %g3
	.word	0xa4926622	! t1_kref+0x2600:   	orcc	%o1, 0x622, %l2
	.word	0xb9b64cb5	! t1_kref+0x2604:   	fandnot2s	%f25, %f21, %f28
	call	SYM(t1_subr2)
	.word	0xb9b00c00	! t1_kref+0x260c:   	fzero	%f28
	.word	0xae9a7950	! t1_kref+0x2610:   	xorcc	%o1, -0x6b0, %l7
	.word	0xaba549bb	! t1_kref+0x2614:   	fdivs	%f21, %f27, %f21
	.word	0xe526001c	! t1_kref+0x2618:   	st	%f18, [%i0 + %i4]
	.word	0x81ae0ab3	! t1_kref+0x261c:   	fcmpes	%fcc0, %f24, %f19
	.word	0xfd3e001d	! t1_kref+0x2620:   	std	%f30, [%i0 + %i5]
	.word	0xae52f512	! t1_kref+0x2624:   	umul	%o3, -0xaee, %l7
	.word	0xb9b60e80	! t1_kref+0x2628:   	fsrc1	%f24, %f28
	.word	0xa5b28200	! t1_kref+0x262c:   	array8	%o2, %g0, %l2
	.word	0xae5a400a	! t1_kref+0x2630:   	smul	%o1, %o2, %l7
	.word	0xacd2bc2b	! t1_kref+0x2634:   	umulcc	%o2, -0x3d5, %l6
	.word	0xae7a400c	! t1_kref+0x2638:   	sdiv	%o1, %o4, %l7
	.word	0xae53000c	! t1_kref+0x263c:   	umul	%o4, %o4, %l7
	.word	0xaab33370	! t1_kref+0x2640:   	orncc	%o4, -0xc90, %l5
	.word	0xa5a68d38	! t1_kref+0x2644:   	fsmuld	%f26, %f24, %f18
	.word	0x37480004	! t1_kref+0x2648:   	fbge,a,pt	%fcc0, _kref+0x2658
	.word	0xab418000	! t1_kref+0x264c:   	mov	%fprs, %l5
	.word	0xa782f17d	! t1_kref+0x2650:   	wr	%o3, 0xfffff17d, %gsr
	.word	0xaa824009	! t1_kref+0x2654:   	addcc	%o1, %o1, %l5
	.word	0xd006001c	! t1_kref+0x2658:   	ld	[%i0 + %i4], %o0
	.word	0xf53e3ff8	! t1_kref+0x265c:   	std	%f26, [%i0 - 8]
	.word	0x2f800006	! t1_kref+0x2660:   	fbu,a	_kref+0x2678
	.word	0xb1b60edc	! t1_kref+0x2664:   	fornot2	%f24, %f28, %f24
	.word	0x3b480002	! t1_kref+0x2668:   	fble,a,pt	%fcc0, _kref+0x2670
	.word	0xbba00536	! t1_kref+0x266c:   	fsqrts	%f22, %f29
	.word	0xfd266010	! t1_kref+0x2670:   	st	%f30, [%i1 + 0x10]
	.word	0xa41ac009	! t1_kref+0x2674:   	xor	%o3, %o1, %l2
	.word	0xacb27b25	! t1_kref+0x2678:   	orncc	%o1, -0x4db, %l6
	.word	0xa52a8009	! t1_kref+0x267c:   	sll	%o2, %o1, %l2
	.word	0xe13f4018	! t1_kref+0x2680:   	std	%f16, [%i5 + %i0]
	.word	0xd228a005	! t1_kref+0x2684:   	stb	%o1, [%g2 + 5]
	.word	0x35480008	! t1_kref+0x2688:   	fbue,a,pt	%fcc0, _kref+0x26a8
	.word	0xb9b446bd	! t1_kref+0x268c:   	fmul8x16al	%f17, %f29, %f28
	.word	0x90b3000a	! t1_kref+0x2690:   	orncc	%o4, %o2, %o0
	.word	0x3d800008	! t1_kref+0x2694:   	fbule,a	_kref+0x26b4
	.word	0xb3a01a37	! t1_kref+0x2698:   	fstoi	%f23, %f25
	.word	0xaa22400a	! t1_kref+0x269c:   	sub	%o1, %o2, %l5
	.word	0xe44e601f	! t1_kref+0x26a0:   	ldsb	[%i1 + 0x1f], %l2
	.word	0xa4332586	! t1_kref+0x26a4:   	orn	%o4, 0x586, %l2
	.word	0x9fc00004	! t1_kref+0x26a8:   	call	%g0 + %g4
	.word	0x90d2e3b0	! t1_kref+0x26ac:   	umulcc	%o3, 0x3b0, %o0
	.word	0xaa1a400a	! t1_kref+0x26b0:   	xor	%o1, %o2, %l5
	.word	0xa52ae00c	! t1_kref+0x26b4:   	sll	%o3, 0xc, %l2
	.word	0xe650a03c	! t1_kref+0x26b8:   	ldsh	[%g2 + 0x3c], %l3
	.word	0x90ab3cdd	! t1_kref+0x26bc:   	andncc	%o4, -0x323, %o0
	.word	0xabb24280	! t1_kref+0x26c0:   	array32	%o1, %g0, %l5
	.word	0xac928009	! t1_kref+0x26c4:   	orcc	%o2, %o1, %l6
	.word	0xaaaac009	! t1_kref+0x26c8:   	andncc	%o3, %o1, %l5
	.word	0xa7b2434c	! t1_kref+0x26cc:   	alignaddrl	%o1, %o4, %l3
	.word	0xabb70fb7	! t1_kref+0x26d0:   	fors	%f28, %f23, %f21
	.word	0xa9a01919	! t1_kref+0x26d4:   	fitod	%f25, %f20
	.word	0xd236601a	! t1_kref+0x26d8:   	sth	%o1, [%i1 + 0x1a]
	.word	0xb5a01891	! t1_kref+0x26dc:   	fitos	%f17, %f26
	.word	0x81ae4ab4	! t1_kref+0x26e0:   	fcmpes	%fcc0, %f25, %f20
	.word	0xe44e3ffb	! t1_kref+0x26e4:   	ldsb	[%i0 - 5], %l2
	.word	0xa5400000	! t1_kref+0x26e8:   	mov	%y, %l2
	.word	0xa612c009	! t1_kref+0x26ec:   	or	%o3, %o1, %l3
	.word	0xb5a00550	! t1_kref+0x26f0:   	fsqrtd	%f16, %f26
	.word	0xe91fbed8	! t1_kref+0x26f4:   	ldd	[%fp - 0x128], %f20
	.word	0xe3ee101a	! t1_kref+0x26f8:   	prefetcha	%i0 + %i2, 17
	.word	0xb9b706f6	! t1_kref+0x26fc:   	fmul8ulx16	%f28, %f22, %f28
	.word	0xaa032247	! t1_kref+0x2700:   	add	%o4, 0x247, %l5
	.word	0xc96e6008	! t1_kref+0x2704:   	prefetch	%i1 + 8, 4
	.word	0xb5a68856	! t1_kref+0x2708:   	faddd	%f26, %f22, %f26
	.word	0xaed334e7	! t1_kref+0x270c:   	umulcc	%o4, -0xb19, %l7
	.word	0xec40a004	! t1_kref+0x2710:   	ldsw	[%g2 + 4], %l6
	.word	0xa8dac00c	! t1_kref+0x2714:   	smulcc	%o3, %o4, %l4
	.word	0x81ac8a52	! t1_kref+0x2718:   	fcmpd	%fcc0, %f18, %f18
	.word	0xee6e6014	! t1_kref+0x271c:   	ldstub	[%i1 + 0x14], %l7
	.word	0xadb58754	! t1_kref+0x2720:   	fpack32	%f22, %f20, %f22
	.word	0xacaac009	! t1_kref+0x2724:   	andncc	%o3, %o1, %l6
	.word	0x3d480005	! t1_kref+0x2728:   	fbule,a,pt	%fcc0, _kref+0x273c
	.word	0xb1a000d0	! t1_kref+0x272c:   	fnegd	%f16, %f24
	.word	0xd6300019	! t1_kref+0x2730:   	sth	%o3, [%g0 + %i1]
	.word	0xa3a0189b	! t1_kref+0x2734:   	fitos	%f27, %f17
	.word	0xa9a00054	! t1_kref+0x2738:   	fmovd	%f20, %f20
	.word	0xa9b58d18	! t1_kref+0x273c:   	fandnot1	%f22, %f24, %f20
	.word	0xb7a0189c	! t1_kref+0x2740:   	fitos	%f28, %f27
	.word	0x91b280aa	! t1_kref+0x2744:   	edge16n	%o2, %o2, %o0
	.word	0xb9b44ef1	! t1_kref+0x2748:   	fornot2s	%f17, %f17, %f28
	.word	0xada01917	! t1_kref+0x274c:   	fitod	%f23, %f22
	.word	0x9fc00004	! t1_kref+0x2750:   	call	%g0 + %g4
	.word	0x910af1e7	! t1_kref+0x2754:   	tsubcc	%o3, -0xe19, %o0
	.word	0x2d480007	! t1_kref+0x2758:   	fbg,a,pt	%fcc0, _kref+0x2774
	.word	0xef68a10c	! t1_kref+0x275c:   	prefetch	%g2 + 0x10c, 23
	.word	0x3f480003	! t1_kref+0x2760:   	fbo,a,pt	%fcc0, _kref+0x276c
	.word	0xf920a034	! t1_kref+0x2764:   	st	%f28, [%g2 + 0x34]
	.word	0xb7b00c20	! t1_kref+0x2768:   	fzeros	%f27
	.word	0xb9b64dba	! t1_kref+0x276c:   	fxors	%f25, %f26, %f28
	.word	0x25480002	! t1_kref+0x2770:   	fblg,a,pt	%fcc0, _kref+0x2778
	.word	0x933a4009	! t1_kref+0x2774:   	sra	%o1, %o1, %o1
	.word	0xd03e7ff0	! t1_kref+0x2778:   	std	%o0, [%i1 - 0x10]
	.word	0xa5a00031	! t1_kref+0x277c:   	fmovs	%f17, %f18
	.word	0x9272c00b	! t1_kref+0x2780:   	udiv	%o3, %o3, %o1
	.word	0xbbb00774	! t1_kref+0x2784:   	fpack16	%f20, %f29
	.word	0x929a800c	! t1_kref+0x2788:   	xorcc	%o2, %o4, %o1
	.word	0xa53aa001	! t1_kref+0x278c:   	sra	%o2, 0x1, %l2
	.word	0xea067ffc	! t1_kref+0x2790:   	ld	[%i1 - 4], %l5
	.word	0xa8c32726	! t1_kref+0x2794:   	addccc	%o4, 0x726, %l4
	.word	0xe6d6505b	! t1_kref+0x2798:   	ldsha	[%i1 + %i3]0x82, %l3
	.word	0xc1ee100b	! t1_kref+0x279c:   	prefetcha	%i0 + %o3, 0
	.word	0x81ad0ada	! t1_kref+0x27a0:   	fcmped	%fcc0, %f20, %f26
	.word	0xbba01896	! t1_kref+0x27a4:   	fitos	%f22, %f29
	.word	0xeb6e001a	! t1_kref+0x27a8:   	prefetch	%i0 + %i2, 21
	.word	0xe6070018	! t1_kref+0x27ac:   	ld	[%i4 + %i0], %l3
	.word	0xaf3ae011	! t1_kref+0x27b0:   	sra	%o3, 0x11, %l7
	.word	0xe4180018	! t1_kref+0x27b4:   	ldd	[%g0 + %i0], %l2
	.word	0xbdb007b2	! t1_kref+0x27b8:   	fpackfix	%f18, %f30
	.word	0xad3aa011	! t1_kref+0x27bc:   	sra	%o2, 0x11, %l6
	.word	0xd228a02f	! t1_kref+0x27c0:   	stb	%o1, [%g2 + 0x2f]
	.word	0xd0070019	! t1_kref+0x27c4:   	ld	[%i4 + %i1], %o0
	.word	0x81ae0a39	! t1_kref+0x27c8:   	fcmps	%fcc0, %f24, %f25
	.word	0x9de3bfa0	! t1_kref+0x27cc:   	save	%sp, -0x60, %sp
	.word	0x91ee4019	! t1_kref+0x27d0:   	restore	%i1, %i1, %o0
	.word	0xeece501a	! t1_kref+0x27d4:   	ldsba	[%i1 + %i2]0x80, %l7
	.word	0xee4e7ffc	! t1_kref+0x27d8:   	ldsb	[%i1 - 4], %l7
	.word	0x81ae8a5e	! t1_kref+0x27dc:   	fcmpd	%fcc0, %f26, %f30
	.word	0xe3267fe8	! t1_kref+0x27e0:   	st	%f17, [%i1 - 0x18]
	.word	0x90b2400c	! t1_kref+0x27e4:   	orncc	%o1, %o4, %o0
	.word	0x2517f055	! t1_kref+0x27e8:   	sethi	%hi(0x5fc15400), %l2
	.word	0xbdb68d9c	! t1_kref+0x27ec:   	fxor	%f26, %f28, %f30
	.word	0xf9a71018	! t1_kref+0x27f0:   	sta	%f28, [%i4 + %i0]0x80
	.word	0xae3b3972	! t1_kref+0x27f4:   	xnor	%o4, -0x68e, %l7
	.word	0xea000018	! t1_kref+0x27f8:   	ld	[%g0 + %i0], %l5
	.word	0xf500a014	! t1_kref+0x27fc:   	ld	[%g2 + 0x14], %f26
	.word	0xac232662	! t1_kref+0x2800:   	sub	%o4, 0x662, %l6
	.word	0x901ac00b	! t1_kref+0x2804:   	xor	%o3, %o3, %o0
	.word	0xab400000	! t1_kref+0x2808:   	mov	%y, %l5
	.word	0xb5a01a5e	! t1_kref+0x280c:   	fdtoi	%f30, %f26
	.word	0xa5a01911	! t1_kref+0x2810:   	fitod	%f17, %f18
	.word	0xd828a02c	! t1_kref+0x2814:   	stb	%o4, [%g2 + 0x2c]
	.word	0xd6362014	! t1_kref+0x2818:   	sth	%o3, [%i0 + 0x14]
	.word	0xf7260000	! t1_kref+0x281c:   	st	%f27, [%i0]
	.word	0xa1b60a9e	! t1_kref+0x2820:   	fpsub16	%f24, %f30, %f16
	.word	0xab22b7c1	! t1_kref+0x2824:   	mulscc	%o2, -0x83f, %l5
	.word	0x92d2e86c	! t1_kref+0x2828:   	umulcc	%o3, 0x86c, %o1
	.word	0xa40abfbf	! t1_kref+0x282c:   	and	%o2, -0x41, %l2
	.word	0x93128009	! t1_kref+0x2830:   	taddcctv	%o2, %o1, %o1
	.word	0x23800002	! t1_kref+0x2834:   	fbne,a	_kref+0x283c
	.word	0xa7b5855c	! t1_kref+0x2838:   	fcmpeq16	%f22, %f28, %l3
	.word	0xee06401c	! t1_kref+0x283c:   	ld	[%i1 + %i4], %l7
	.word	0x81d96298	! t1_kref+0x2840:   	flush	%g5 + 0x298
	.word	0xaec2c00c	! t1_kref+0x2844:   	addccc	%o3, %o4, %l7
	.word	0x8143c000	! t1_kref+0x2848:   	stbar
	.word	0xaafac00b	! t1_kref+0x284c:   	sdivcc	%o3, %o3, %l5
	.word	0x9de3bfa0	! t1_kref+0x2850:   	save	%sp, -0x60, %sp
	.word	0xba0e38c7	! t1_kref+0x2854:   	and	%i0, -0x739, %i5
	.word	0x91ee8000	! t1_kref+0x2858:   	restore	%i2, %g0, %o0
	.word	0xb5a01056	! t1_kref+0x285c:   	fdtox	%f22, %f26
	.word	0x913a400b	! t1_kref+0x2860:   	sra	%o1, %o3, %o0
	.word	0xa6fa8009	! t1_kref+0x2864:   	sdivcc	%o2, %o1, %l3
	.word	0xafa88039	! t1_kref+0x2868:   	fmovslg	%fcc0, %f25, %f23
	.word	0xa93a400b	! t1_kref+0x286c:   	sra	%o1, %o3, %l4
	.word	0xbba44937	! t1_kref+0x2870:   	fmuls	%f17, %f23, %f29
	.word	0x91b28280	! t1_kref+0x2874:   	array32	%o2, %g0, %o0
	.word	0xed380018	! t1_kref+0x2878:   	std	%f22, [%g0 + %i0]
	.word	0xd040a034	! t1_kref+0x287c:   	ldsw	[%g2 + 0x34], %o0
	.word	0x90da400c	! t1_kref+0x2880:   	smulcc	%o1, %o4, %o0
	.word	0xbda589d2	! t1_kref+0x2884:   	fdivd	%f22, %f18, %f30
	.word	0xd26e8018	! t1_kref+0x2888:   	ldstub	[%i2 + %i0], %o1
	.word	0x92aa8009	! t1_kref+0x288c:   	andncc	%o2, %o1, %o1
	.word	0xa8aa4009	! t1_kref+0x2890:   	andncc	%o1, %o1, %l4
	.word	0xd236001b	! t1_kref+0x2894:   	sth	%o1, [%i0 + %i3]
	.word	0xa3a00532	! t1_kref+0x2898:   	fsqrts	%f18, %f17
	.word	0xa50ac00c	! t1_kref+0x289c:   	tsubcc	%o3, %o4, %l2
	.word	0x28480003	! t1_kref+0x28a0:   	bleu,a,pt	%icc, _kref+0x28ac
	.word	0x901aa987	! t1_kref+0x28a4:   	xor	%o2, 0x987, %o0
	.word	0xaa32fcb0	! t1_kref+0x28a8:   	orn	%o3, -0x350, %l5
	.word	0x9144c000	! t1_kref+0x28ac:   	mov	%gsr, %o0
	.word	0xa5a00558	! t1_kref+0x28b0:   	fsqrtd	%f24, %f18
	.word	0xd230a024	! t1_kref+0x28b4:   	sth	%o1, [%g2 + 0x24]
	.word	0xe8467fe4	! t1_kref+0x28b8:   	ldsw	[%i1 - 0x1c], %l4
	.word	0xf7a71019	! t1_kref+0x28bc:   	sta	%f27, [%i4 + %i1]0x80
	.word	0xb3a58831	! t1_kref+0x28c0:   	fadds	%f22, %f17, %f25
	.word	0x878020d2	! t1_kref+0x28c4:   	mov	0xd2, %asi
	.word	0x92333fdb	! t1_kref+0x28c8:   	orn	%o4, -0x25, %o1
	.word	0xb1b78750	! t1_kref+0x28cc:   	fpack32	%f30, %f16, %f24
	.word	0x90da800c	! t1_kref+0x28d0:   	smulcc	%o2, %o4, %o0
	.word	0xb9b6097d	! t1_kref+0x28d4:   	fpmerge	%f24, %f29, %f28
	.word	0xb3a00038	! t1_kref+0x28d8:   	fmovs	%f24, %f25
	.word	0x86102001	! t1_kref+0x28dc:   	mov	0x1, %g3
	.word	0x32800000	! t1_kref+0x28e0:   	bne,a	_kref+0x28e0
	.word	0x86a0e001	! t1_kref+0x28e4:   	subcc	%g3, 1, %g3
	.word	0xf126001c	! t1_kref+0x28e8:   	st	%f24, [%i0 + %i4]
	call	SYM(t1_subr1)
	.word	0xada0191e	! t1_kref+0x28f0:   	fitod	%f30, %f22
	.word	0xf920a034	! t1_kref+0x28f4:   	st	%f28, [%g2 + 0x34]
	.word	0xc56e0009	! t1_kref+0x28f8:   	prefetch	%i0 + %o1, 2
	.word	0xabb705d8	! t1_kref+0x28fc:   	fcmpeq32	%f28, %f24, %l5
	.word	0xb1a00133	! t1_kref+0x2900:   	fabss	%f19, %f24
	.word	0x92baa609	! t1_kref+0x2904:   	xnorcc	%o2, 0x609, %o1
	.word	0xaf400000	! t1_kref+0x2908:   	mov	%y, %l7
	.word	0xd428a014	! t1_kref+0x290c:   	stb	%o2, [%g2 + 0x14]
	.word	0xbba01a58	! t1_kref+0x2910:   	fdtoi	%f24, %f29
	.word	0xa5400000	! t1_kref+0x2914:   	mov	%y, %l2
	.word	0xa7b00f3c	! t1_kref+0x2918:   	fsrc2s	%f28, %f19
	.word	0xae02ffde	! t1_kref+0x291c:   	add	%o3, -0x22, %l7
	.word	0xa8fae431	! t1_kref+0x2920:   	sdivcc	%o3, 0x431, %l4
	.word	0xada688d4	! t1_kref+0x2924:   	fsubd	%f26, %f20, %f22
	.word	0xe1be188b	! t1_kref+0x2928:   	stda	%f16, [%i0 + %o3]0xc4
	.word	0x900b000c	! t1_kref+0x292c:   	and	%o4, %o4, %o0
	.word	0xef68a084	! t1_kref+0x2930:   	prefetch	%g2 + 0x84, 23
	.word	0xa6ba7947	! t1_kref+0x2934:   	xnorcc	%o1, -0x6b9, %l3
	.word	0xd220a004	! t1_kref+0x2938:   	st	%o1, [%g2 + 4]
	.word	0xa3a00534	! t1_kref+0x293c:   	fsqrts	%f20, %f17
	.word	0xd240a01c	! t1_kref+0x2940:   	ldsw	[%g2 + 0x1c], %o1
	.word	0x001fffff	! t1_kref+0x2944:   	illtrap	0x1fffff
	.word	0xe6516b2c	! t1_kref+0x2948:   	ldsh	[%g5 + 0xb2c], %l3
	.word	0xe608a006	! t1_kref+0x294c:   	ldub	[%g2 + 6], %l3
	.word	0xb1b48e52	! t1_kref+0x2950:   	fxnor	%f18, %f18, %f24
	.word	0xafa4c9b2	! t1_kref+0x2954:   	fdivs	%f19, %f18, %f23
	.word	0x86102002	! t1_kref+0x2958:   	mov	0x2, %g3
	.word	0x86a0e001	! t1_kref+0x295c:   	subcc	%g3, 1, %g3
	.word	0x22800015	! t1_kref+0x2960:   	be,a	_kref+0x29b4
	.word	0xafa0013e	! t1_kref+0x2964:   	fabss	%f30, %f23
	.word	0x8143c000	! t1_kref+0x2968:   	stbar
	.word	0xa5400000	! t1_kref+0x296c:   	mov	%y, %l2
	.word	0xb1a01914	! t1_kref+0x2970:   	fitod	%f20, %f24
	.word	0x909a400c	! t1_kref+0x2974:   	xorcc	%o1, %o4, %o0
	.word	0xb9a689b4	! t1_kref+0x2978:   	fdivs	%f26, %f20, %f28
	.word	0xae3b000c	! t1_kref+0x297c:   	xnor	%o4, %o4, %l7
	.word	0xb3a68932	! t1_kref+0x2980:   	fmuls	%f26, %f18, %f25
	.word	0xe56e401d	! t1_kref+0x2984:   	prefetch	%i1 + %i5, 18
	.word	0xa5a789bb	! t1_kref+0x2988:   	fdivs	%f30, %f27, %f18
	.word	0xf3266004	! t1_kref+0x298c:   	st	%f25, [%i1 + 4]
	.word	0x90932555	! t1_kref+0x2990:   	orcc	%o4, 0x555, %o0
	.word	0x907a800b	! t1_kref+0x2994:   	sdiv	%o2, %o3, %o0
	.word	0xe9e6100a	! t1_kref+0x2998:   	casa	[%i0]0x80, %o2, %l4
	.word	0xe810a006	! t1_kref+0x299c:   	lduh	[%g2 + 6], %l4
	.word	0xe9ee501a	! t1_kref+0x29a0:   	prefetcha	%i1 + %i2, 20
	call	SYM(t1_subr2)
	.word	0xa7a4493b	! t1_kref+0x29a8:   	fmuls	%f17, %f27, %f19
	.word	0xec40a01c	! t1_kref+0x29ac:   	ldsw	[%g2 + 0x1c], %l6
	.word	0x909ab174	! t1_kref+0x29b0:   	xorcc	%o2, -0xe8c, %o0
	.word	0xac1a800c	! t1_kref+0x29b4:   	xor	%o2, %o4, %l6
	.word	0xb9a00552	! t1_kref+0x29b8:   	fsqrtd	%f18, %f28
	.word	0xa5a0055e	! t1_kref+0x29bc:   	fsqrtd	%f30, %f18
	.word	0x81af8ab5	! t1_kref+0x29c0:   	fcmpes	%fcc0, %f30, %f21
	.word	0xa5a689d2	! t1_kref+0x29c4:   	fdivd	%f26, %f18, %f18
	.word	0xabb5ccb6	! t1_kref+0x29c8:   	fandnot2s	%f23, %f22, %f21
	.word	0x23480003	! t1_kref+0x29cc:   	fbne,a,pt	%fcc0, _kref+0x29d8
	.word	0xd86e4000	! t1_kref+0x29d0:   	ldstub	[%i1], %o4
	.word	0x90927b0b	! t1_kref+0x29d4:   	orcc	%o1, -0x4f5, %o0
	.word	0xd436c018	! t1_kref+0x29d8:   	sth	%o2, [%i3 + %i0]
	.word	0xa9a6885a	! t1_kref+0x29dc:   	faddd	%f26, %f26, %f20
	.word	0xa5a01090	! t1_kref+0x29e0:   	fxtos	%f16, %f18
	.word	0xd420a03c	! t1_kref+0x29e4:   	st	%o2, [%g2 + 0x3c]
	.word	0x90d26638	! t1_kref+0x29e8:   	umulcc	%o1, 0x638, %o0
	.word	0xb9a54d32	! t1_kref+0x29ec:   	fsmuld	%f21, %f18, %f28
	.word	0x2d480001	! t1_kref+0x29f0:   	fbg,a,pt	%fcc0, _kref+0x29f4
	.word	0xb7a5493c	! t1_kref+0x29f4:   	fmuls	%f21, %f28, %f27
	.word	0xa1b68f9c	! t1_kref+0x29f8:   	for	%f26, %f28, %f16
	call	SYM(t1_subr1)
	.word	0xb7b00c20	! t1_kref+0x2a00:   	fzeros	%f27
	.word	0x92732d37	! t1_kref+0x2a04:   	udiv	%o4, 0xd37, %o1
	.word	0xab400000	! t1_kref+0x2a08:   	mov	%y, %l5
	.word	0xee00a03c	! t1_kref+0x2a0c:   	ld	[%g2 + 0x3c], %l7
	.word	0x38800001	! t1_kref+0x2a10:   	bgu,a	_kref+0x2a14
	.word	0xd8767fe8	! t1_kref+0x2a14:   	stx	%o4, [%i1 - 0x18]
	.word	0x93400000	! t1_kref+0x2a18:   	mov	%y, %o1
	.word	0xac02800a	! t1_kref+0x2a1c:   	add	%o2, %o2, %l6
	.word	0xb7a00533	! t1_kref+0x2a20:   	fsqrts	%f19, %f27
	.word	0xa5a01932	! t1_kref+0x2a24:   	fstod	%f18, %f18
	.word	0xb4102004	! t1_kref+0x2a28:   	mov	0x4, %i2
	.word	0xe3067ff0	! t1_kref+0x2a2c:   	ld	[%i1 - 0x10], %f17
	.word	0x81ad0a58	! t1_kref+0x2a30:   	fcmpd	%fcc0, %f20, %f24
	.word	0xa83a800a	! t1_kref+0x2a34:   	xnor	%o2, %o2, %l4
	.word	0xb1a44d32	! t1_kref+0x2a38:   	fsmuld	%f17, %f18, %f24
	.word	0xb1a409dc	! t1_kref+0x2a3c:   	fdivd	%f16, %f28, %f24
	.word	0x93400000	! t1_kref+0x2a40:   	mov	%y, %o1
	.word	0x8143c000	! t1_kref+0x2a44:   	stbar
	.word	0xa80b0009	! t1_kref+0x2a48:   	and	%o4, %o1, %l4
	.word	0x35800001	! t1_kref+0x2a4c:   	fbue,a	_kref+0x2a50
	.word	0xab44c000	! t1_kref+0x2a50:   	mov	%gsr, %l5
	.word	0x86102020	! t1_kref+0x2a54:   	mov	0x20, %g3
	.word	0x86a0e001	! t1_kref+0x2a58:   	subcc	%g3, 1, %g3
	.word	0x22800009	! t1_kref+0x2a5c:   	be,a	_kref+0x2a80
	.word	0xd8ee5000	! t1_kref+0x2a60:   	ldstuba	[%i1]0x80, %o4
	.word	0xd420a01c	! t1_kref+0x2a64:   	st	%o2, [%g2 + 0x1c]
	.word	0xe6100019	! t1_kref+0x2a68:   	lduh	[%g0 + %i1], %l3
	.word	0xa4aa7888	! t1_kref+0x2a6c:   	andncc	%o1, -0x778, %l2
	.word	0xd1f6100b	! t1_kref+0x2a70:   	casxa	[%i0]0x80, %o3, %o0
	.word	0xb6102006	! t1_kref+0x2a74:   	mov	0x6, %i3
	.word	0x9fc10000	! t1_kref+0x2a78:   	call	%g4
	.word	0x90b33dcc	! t1_kref+0x2a7c:   	orncc	%o4, -0x234, %o0
	.word	0xed68a08e	! t1_kref+0x2a80:   	prefetch	%g2 + 0x8e, 22
	.word	0xb9b48af2	! t1_kref+0x2a84:   	fpsub32s	%f18, %f18, %f28
	.word	0xadb28280	! t1_kref+0x2a88:   	array32	%o2, %g0, %l6
	.word	0xa5a64d36	! t1_kref+0x2a8c:   	fsmuld	%f25, %f22, %f18
	.word	0x001fffff	! t1_kref+0x2a90:   	illtrap	0x1fffff
	.word	0x91b48498	! t1_kref+0x2a94:   	fcmple32	%f18, %f24, %o0
	.word	0xaec26998	! t1_kref+0x2a98:   	addccc	%o1, 0x998, %l7
	.word	0xa4932965	! t1_kref+0x2a9c:   	orcc	%o4, 0x965, %l2
	.word	0x3e480007	! t1_kref+0x2aa0:   	bvc,a,pt	%icc, _kref+0x2abc
	.word	0xa5a6885a	! t1_kref+0x2aa4:   	faddd	%f26, %f26, %f18
	.word	0xad326018	! t1_kref+0x2aa8:   	srl	%o1, 0x18, %l6
	.word	0xd830a016	! t1_kref+0x2aac:   	sth	%o4, [%g2 + 0x16]
	.word	0xaa22f1e2	! t1_kref+0x2ab0:   	sub	%o3, -0xe1e, %l5
	.word	0xfb260000	! t1_kref+0x2ab4:   	st	%f29, [%i0]
	.word	0x81824000	! t1_kref+0x2ab8:   	wr	%o1, %g0, %y
	.word	0xa6f2800c	! t1_kref+0x2abc:   	udivcc	%o2, %o4, %l3
	.word	0x39480002	! t1_kref+0x2ac0:   	fbuge,a,pt	%fcc0, _kref+0x2ac8
	.word	0x92c2c00c	! t1_kref+0x2ac4:   	addccc	%o3, %o4, %o1
	.word	0xe46e200b	! t1_kref+0x2ac8:   	ldstub	[%i0 + 0xb], %l2
	.word	0xedee501d	! t1_kref+0x2acc:   	prefetcha	%i1 + %i5, 22
	.word	0x81ac8a5e	! t1_kref+0x2ad0:   	fcmpd	%fcc0, %f18, %f30
	.word	0x81ae8ad8	! t1_kref+0x2ad4:   	fcmped	%fcc0, %f26, %f24
	.word	0xd420a01c	! t1_kref+0x2ad8:   	st	%o2, [%g2 + 0x1c]
	.word	0x32800008	! t1_kref+0x2adc:   	bne,a	_kref+0x2afc
	.word	0xae7a400c	! t1_kref+0x2ae0:   	sdiv	%o1, %o4, %l7
	.word	0x933ac00c	! t1_kref+0x2ae4:   	sra	%o3, %o4, %o1
	.word	0xb5a588da	! t1_kref+0x2ae8:   	fsubd	%f22, %f26, %f26
	.word	0xdbf6500c	! t1_kref+0x2aec:   	casxa	[%i1]0x80, %o4, %o5
	.word	0xadb2c08c	! t1_kref+0x2af0:   	edge16	%o3, %o4, %l6
	.word	0xbba01898	! t1_kref+0x2af4:   	fitos	%f24, %f29
	.word	0xee466000	! t1_kref+0x2af8:   	ldsw	[%i1], %l7
	.word	0x2b800007	! t1_kref+0x2afc:   	fbug,a	_kref+0x2b18
	.word	0x1337db5e	! t1_kref+0x2b00:   	sethi	%hi(0xdf6d7800), %o1
	.word	0xaa7ac00a	! t1_kref+0x2b04:   	sdiv	%o3, %o2, %l5
	.word	0xbda00552	! t1_kref+0x2b08:   	fsqrtd	%f18, %f30
	.word	0xe7ee101c	! t1_kref+0x2b0c:   	prefetcha	%i0 + %i4, 19
	.word	0xad3b0009	! t1_kref+0x2b10:   	sra	%o4, %o1, %l6
	.word	0xd216001b	! t1_kref+0x2b14:   	lduh	[%i0 + %i3], %o1
	.word	0xd81e3ff8	! t1_kref+0x2b18:   	ldd	[%i0 - 8], %o4
	.word	0xb1a0189e	! t1_kref+0x2b1c:   	fitos	%f30, %f24
	.word	0xab400000	! t1_kref+0x2b20:   	mov	%y, %l5
	.word	0xa5400000	! t1_kref+0x2b24:   	mov	%y, %l2
	.word	0x86102002	! t1_kref+0x2b28:   	mov	0x2, %g3
	.word	0x32800000	! t1_kref+0x2b2c:   	bne,a	_kref+0x2b2c
	.word	0x86a0e001	! t1_kref+0x2b30:   	subcc	%g3, 1, %g3
	sethi	%hi(1f), %o7
	jmpl	%o7+%lo(1f), %g1
	.empty
	.word	0xeb00a02c	! t1_kref+0x2b3c:   	ld	[%g2 + 0x2c], %f21
	.word	0xec10a024	! t1_kref+0x2b40:   	lduh	[%g2 + 0x24], %l6
	.word	0xeb6e401c	! t1_kref+0x2b44:   	prefetch	%i1 + %i4, 21
	.word	0x93b2810a	! t1_kref+0x2b48:   	edge32	%o2, %o2, %o1
1:	.word	0xaba01892	! t1_kref+0x2b4c:   	fitos	%f18, %f21
	.word	0x91b48514	! t1_kref+0x2b50:   	fcmpgt16	%f18, %f20, %o0
	.word	0xd03e2000	! t1_kref+0x2b54:   	std	%o0, [%i0]
	.word	0xa5a489d8	! t1_kref+0x2b58:   	fdivd	%f18, %f24, %f18
	.word	0xe968a101	! t1_kref+0x2b5c:   	prefetch	%g2 + 0x101, 20
	.word	0xa9a4cd3e	! t1_kref+0x2b60:   	fsmuld	%f19, %f30, %f20
	.word	0xa602a5be	! t1_kref+0x2b64:   	add	%o2, 0x5be, %l3
	.word	0xa5400000	! t1_kref+0x2b68:   	mov	%y, %l2
	.word	0x2b480007	! t1_kref+0x2b6c:   	fbug,a,pt	%fcc0, _kref+0x2b88
	.word	0xf9be5a1b	! t1_kref+0x2b70:   	stda	%f28, [%i1 + %i3]0xd0
	.word	0x81ae0a5a	! t1_kref+0x2b74:   	fcmpd	%fcc0, %f24, %f26
	.word	0xa5a01a54	! t1_kref+0x2b78:   	fdtoi	%f20, %f18
	.word	0xf520a02c	! t1_kref+0x2b7c:   	st	%f26, [%g2 + 0x2c]
	.word	0xabb3032b	! t1_kref+0x2b80:   	bmask	%o4, %o3, %l5
	.word	0xa49b000c	! t1_kref+0x2b84:   	xorcc	%o4, %o4, %l2
	.word	0xd630a016	! t1_kref+0x2b88:   	sth	%o3, [%g2 + 0x16]
	.word	0xad0a400a	! t1_kref+0x2b8c:   	tsubcc	%o1, %o2, %l6
	.word	0xaf6525aa	! t1_kref+0x2b90:   	movleu	%icc, -0x256, %l7
	.word	0xe448a01d	! t1_kref+0x2b94:   	ldsb	[%g2 + 0x1d], %l2
	.word	0xa9b3016c	! t1_kref+0x2b98:   	edge32ln	%o4, %o4, %l4
	.word	0xa8826800	! t1_kref+0x2b9c:   	addcc	%o1, 0x800, %l4
	.word	0xbda01a31	! t1_kref+0x2ba0:   	fstoi	%f17, %f30
	.word	0xf1be5a1a	! t1_kref+0x2ba4:   	stda	%f24, [%i1 + %i2]0xd0
	.word	0xa4b2c00b	! t1_kref+0x2ba8:   	orncc	%o3, %o3, %l2
	.word	0xa9a00156	! t1_kref+0x2bac:   	fabsd	%f22, %f20
	.word	0xd8282035	! t1_kref+0x2bb0:   	stb	%o4, [%g0 + 0x35]
	.word	0xac9b0009	! t1_kref+0x2bb4:   	xorcc	%o4, %o1, %l6
	.word	0xeb00a02c	! t1_kref+0x2bb8:   	ld	[%g2 + 0x2c], %f21
	.word	0xada018dc	! t1_kref+0x2bbc:   	fdtos	%f28, %f22
	.word	0x9312c00a	! t1_kref+0x2bc0:   	taddcctv	%o3, %o2, %o1
	.word	0xa5b2c280	! t1_kref+0x2bc4:   	array32	%o3, %g0, %l2
	.word	0xa5b00fe0	! t1_kref+0x2bc8:   	fones	%f18
	.word	0xf16e6010	! t1_kref+0x2bcc:   	prefetch	%i1 + 0x10, 24
	.word	0xb5a608da	! t1_kref+0x2bd0:   	fsubd	%f24, %f26, %f26
	.word	0xb3a649b8	! t1_kref+0x2bd4:   	fdivs	%f25, %f24, %f25
	.word	0xa7b60e73	! t1_kref+0x2bd8:   	fxnors	%f24, %f19, %f19
	.word	0xa7b2c16b	! t1_kref+0x2bdc:   	edge32ln	%o3, %o3, %l3
	.word	0xacba800b	! t1_kref+0x2be0:   	xnorcc	%o2, %o3, %l6
	.word	0xa9a018d6	! t1_kref+0x2be4:   	fdtos	%f22, %f20
	.word	0xbda649bd	! t1_kref+0x2be8:   	fdivs	%f25, %f29, %f30
	.word	0xaeb2c00c	! t1_kref+0x2bec:   	orncc	%o3, %o4, %l7
	.word	0xe410a016	! t1_kref+0x2bf0:   	lduh	[%g2 + 0x16], %l2
	.word	0x81ae0a58	! t1_kref+0x2bf4:   	fcmpd	%fcc0, %f24, %f24
	.word	0xa7400000	! t1_kref+0x2bf8:   	mov	%y, %l3
	.word	0x37800005	! t1_kref+0x2bfc:   	fbge,a	_kref+0x2c10
	.word	0xafb00c20	! t1_kref+0x2c00:   	fzeros	%f23
	.word	0xab64e14e	! t1_kref+0x2c04:   	movl	%icc, 0x14e, %l5
	.word	0xc1082640	! t1_kref+0x2c08:   	ld	[%g0 + 0x640], %fsr
	.word	0xafa489bd	! t1_kref+0x2c0c:   	fdivs	%f18, %f29, %f23
	.word	0xa61a800b	! t1_kref+0x2c10:   	xor	%o2, %o3, %l3
	.word	0xafa00031	! t1_kref+0x2c14:   	fmovs	%f17, %f23
	.word	0xafb007ba	! t1_kref+0x2c18:   	fpackfix	%f26, %f23
	.word	0xeed6101b	! t1_kref+0x2c1c:   	ldsha	[%i0 + %i3]0x80, %l7
	.word	0xbba018d2	! t1_kref+0x2c20:   	fdtos	%f18, %f29
	.word	0xa80aea22	! t1_kref+0x2c24:   	and	%o3, 0xa22, %l4
	.word	0x8143e05e	! t1_kref+0x2c28:   	membar	0x5e
	.word	0xa5b2c200	! t1_kref+0x2c2c:   	array8	%o3, %g0, %l2
	.word	0x9fc00004	! t1_kref+0x2c30:   	call	%g0 + %g4
	.word	0x81df801d	! t1_kref+0x2c34:   	flush	%fp + %i5
	.word	0x903b3cc4	! t1_kref+0x2c38:   	xnor	%o4, -0x33c, %o0
	.word	0x27800005	! t1_kref+0x2c3c:   	fbul,a	_kref+0x2c50
	.word	0xfb00a02c	! t1_kref+0x2c40:   	ld	[%g2 + 0x2c], %f29
	.word	0xa5b3008c	! t1_kref+0x2c44:   	edge16	%o4, %o4, %l2
	.word	0xa62ae142	! t1_kref+0x2c48:   	andn	%o3, 0x142, %l3
	.word	0xe520a02c	! t1_kref+0x2c4c:   	st	%f18, [%g2 + 0x2c]
	.word	0xd230a00e	! t1_kref+0x2c50:   	sth	%o1, [%g2 + 0xe]
	.word	0xe168a003	! t1_kref+0x2c54:   	prefetch	%g2 + 3, 16
	.word	0xe7ee501d	! t1_kref+0x2c58:   	prefetcha	%i1 + %i5, 19
	.word	0xe91e7ff8	! t1_kref+0x2c5c:   	ldd	[%i1 - 8], %f20
	.word	0x9de3bfa0	! t1_kref+0x2c60:   	save	%sp, -0x60, %sp
	.word	0x93ee3f3a	! t1_kref+0x2c64:   	restore	%i0, -0xc6, %o1
	.word	0xb1b68a94	! t1_kref+0x2c68:   	fpsub16	%f26, %f20, %f24
	.word	0xa5b280ab	! t1_kref+0x2c6c:   	edge16n	%o2, %o3, %l2
	.word	0xd04e7ff5	! t1_kref+0x2c70:   	ldsb	[%i1 - 0xb], %o0
	.word	0xacb2c00a	! t1_kref+0x2c74:   	orncc	%o3, %o2, %l6
	.word	0xb7a01a3a	! t1_kref+0x2c78:   	fstoi	%f26, %f27
	.word	0xa1a01912	! t1_kref+0x2c7c:   	fitod	%f18, %f16
	.word	0x27480007	! t1_kref+0x2c80:   	fbul,a,pt	%fcc0, _kref+0x2c9c
	.word	0xac3b000a	! t1_kref+0x2c84:   	xnor	%o4, %o2, %l6
	.word	0x23480002	! t1_kref+0x2c88:   	fbne,a,pt	%fcc0, _kref+0x2c90
	.word	0xa6b2e058	! t1_kref+0x2c8c:   	orncc	%o3, 0x58, %l3
	.word	0xd630a016	! t1_kref+0x2c90:   	sth	%o3, [%g2 + 0x16]
	.word	0x001fffff	! t1_kref+0x2c94:   	illtrap	0x1fffff
	.word	0xac0b000c	! t1_kref+0x2c98:   	and	%o4, %o4, %l6
	.word	0xb5a4c931	! t1_kref+0x2c9c:   	fmuls	%f19, %f17, %f26
	.word	0x83c06188	! t1_kref+0x2ca0:   	jmpl	%g1 + 0x188, %g1
	.word	0xada5085c	! t1_kref+0x2ca4:   	faddd	%f20, %f28, %f22
	.word	0xa1a488d2	! t1_kref+0x2ca8:   	fsubd	%f18, %f18, %f16
	.word	0xd230a024	! t1_kref+0x2cac:   	sth	%o1, [%g2 + 0x24]
	.word	0xee480019	! t1_kref+0x2cb0:   	ldsb	[%g0 + %i1], %l7
	.word	0xafb6851e	! t1_kref+0x2cb4:   	fcmpgt16	%f26, %f30, %l7
	.word	0xeb68a106	! t1_kref+0x2cb8:   	prefetch	%g2 + 0x106, 21
	.word	0xbda68856	! t1_kref+0x2cbc:   	faddd	%f26, %f22, %f30
	.word	0xd4366000	! t1_kref+0x2cc0:   	sth	%o2, [%i1]
	.word	0xa5a609da	! t1_kref+0x2cc4:   	fdivd	%f24, %f26, %f18
	.word	0xa9b60e5a	! t1_kref+0x2cc8:   	fxnor	%f24, %f26, %f20
	.word	0xa6db2bca	! t1_kref+0x2ccc:   	smulcc	%o4, 0xbca, %l3
	.word	0xfd20a01c	! t1_kref+0x2cd0:   	st	%f30, [%g2 + 0x1c]
	.word	0x86102002	! t1_kref+0x2cd4:   	mov	0x2, %g3
	.word	0x32800000	! t1_kref+0x2cd8:   	bne,a	_kref+0x2cd8
	.word	0x86a0e001	! t1_kref+0x2cdc:   	subcc	%g3, 1, %g3
	.word	0x90327177	! t1_kref+0x2ce0:   	orn	%o1, -0xe89, %o0
	.word	0xa5a00136	! t1_kref+0x2ce4:   	fabss	%f22, %f18
	.word	0x920a77fb	! t1_kref+0x2ce8:   	and	%o1, -0x805, %o1
	.word	0xaa72400b	! t1_kref+0x2cec:   	udiv	%o1, %o3, %l5
	.word	0x2c480001	! t1_kref+0x2cf0:   	bneg,a,pt	%icc, _kref+0x2cf4
	.word	0xa9b00fe0	! t1_kref+0x2cf4:   	fones	%f20
	.word	0xed20a004	! t1_kref+0x2cf8:   	st	%f22, [%g2 + 4]
	.word	0xe53f4019	! t1_kref+0x2cfc:   	std	%f18, [%i5 + %i1]
	.word	0xa5a01896	! t1_kref+0x2d00:   	fitos	%f22, %f18
	.word	0xaedb30d6	! t1_kref+0x2d04:   	smulcc	%o4, -0xf2a, %l7
	.word	0xc4506525	! t1_kref+0x2d08:   	ldsh	[%g1 + 0x525], %g2
	.word	0x929aaa8d	! t1_kref+0x2d0c:   	xorcc	%o2, 0xa8d, %o1
	.word	0x901a800c	! t1_kref+0x2d10:   	xor	%o2, %o4, %o0
	.word	0xe06e3ff4	! t1_kref+0x2d14:   	ldstub	[%i0 - 0xc], %l0
	.word	0xb9a01912	! t1_kref+0x2d18:   	fitod	%f18, %f28
	.word	0xea16c018	! t1_kref+0x2d1c:   	lduh	[%i3 + %i0], %l5
	.word	0xc368a00e	! t1_kref+0x2d20:   	prefetch	%g2 + 0xe, 1
	.word	0x920a400a	! t1_kref+0x2d24:   	and	%o1, %o2, %o1
	.word	0xd89f5018	! t1_kref+0x2d28:   	ldda	[%i5 + %i0]0x80, %o4
	.word	0x81ae0a56	! t1_kref+0x2d2c:   	fcmpd	%fcc0, %f24, %f22
	.word	0xaf12c00a	! t1_kref+0x2d30:   	taddcctv	%o3, %o2, %l7
	.word	0x903ab84f	! t1_kref+0x2d34:   	xnor	%o2, -0x7b1, %o0
	.word	0xab2ae007	! t1_kref+0x2d38:   	sll	%o3, 0x7, %l5
	call	SYM(t1_subr1)
	.word	0xd03e401d	! t1_kref+0x2d40:   	std	%o0, [%i1 + %i5]
	.word	0xd24e6012	! t1_kref+0x2d44:   	ldsb	[%i1 + 0x12], %o1
	.word	0xec480018	! t1_kref+0x2d48:   	ldsb	[%g0 + %i0], %l6
	.word	0x81ac8a5c	! t1_kref+0x2d4c:   	fcmpd	%fcc0, %f18, %f28
	.word	0xabb48498	! t1_kref+0x2d50:   	fcmple32	%f18, %f24, %l5
	.word	0xb1a00535	! t1_kref+0x2d54:   	fsqrts	%f21, %f24
	.word	0x903a753e	! t1_kref+0x2d58:   	xnor	%o1, -0xac2, %o0
	.word	0xada6885c	! t1_kref+0x2d5c:   	faddd	%f26, %f28, %f22
	.word	0xa67a800c	! t1_kref+0x2d60:   	sdiv	%o2, %o4, %l3
	.word	0x9fc00004	! t1_kref+0x2d64:   	call	%g0 + %g4
	.word	0xf51e0000	! t1_kref+0x2d68:   	ldd	[%i0], %f26
	.word	0x90732d6b	! t1_kref+0x2d6c:   	udiv	%o4, 0xd6b, %o0
	.word	0xb1a0003e	! t1_kref+0x2d70:   	fmovs	%f30, %f24
	.word	0xab40c000	! t1_kref+0x2d74:   	mov	%asi, %l5
	.word	0xae032832	! t1_kref+0x2d78:   	add	%o4, 0x832, %l7
	.word	0xaa1ab65f	! t1_kref+0x2d7c:   	xor	%o2, -0x9a1, %l5
	.word	0xd820a03c	! t1_kref+0x2d80:   	st	%o4, [%g2 + 0x3c]
	.word	0xb9b68c5a	! t1_kref+0x2d84:   	fnor	%f26, %f26, %f28
	.word	0xe9bf5a58	! t1_kref+0x2d88:   	stda	%f20, [%i5 + %i0]0xd2
	.word	0x27800001	! t1_kref+0x2d8c:   	fbul,a	_kref+0x2d90
	.word	0xaa9a8009	! t1_kref+0x2d90:   	xorcc	%o2, %o1, %l5
	.word	0xadb30280	! t1_kref+0x2d94:   	array32	%o4, %g0, %l6
	.word	0xeb270019	! t1_kref+0x2d98:   	st	%f21, [%i4 + %i1]
	.word	0xe600a024	! t1_kref+0x2d9c:   	ld	[%g2 + 0x24], %l3
	.word	0xe500a004	! t1_kref+0x2da0:   	ld	[%g2 + 4], %f18
	.word	0xd006001c	! t1_kref+0x2da4:   	ld	[%i0 + %i4], %o0
	.word	0xd620a014	! t1_kref+0x2da8:   	st	%o3, [%g2 + 0x14]
	.word	0xd2167fe0	! t1_kref+0x2dac:   	lduh	[%i1 - 0x20], %o1
	.word	0xada709d6	! t1_kref+0x2db0:   	fdivd	%f28, %f22, %f22
	.word	0xc12e401c	! t1_kref+0x2db4:   	st	%fsr, [%i1 + %i4]
	call	1f
	.empty
	.word	0xada00552	! t1_kref+0x2dbc:   	fsqrtd	%f18, %f22
	.word	0xacb2a156	! t1_kref+0x2dc0:   	orncc	%o2, 0x156, %l6
	.word	0xad418000	! t1_kref+0x2dc4:   	mov	%fprs, %l6
	.word	0x25800002	! t1_kref+0x2dc8:   	fblg,a	_kref+0x2dd0
	.word	0xd43e3fe8	! t1_kref+0x2dcc:   	std	%o2, [%i0 - 0x18]
	.word	0xad12c00c	! t1_kref+0x2dd0:   	taddcctv	%o3, %o4, %l6
	.word	0xaa9aa1e4	! t1_kref+0x2dd4:   	xorcc	%o2, 0x1e4, %l5
1:	.word	0xc568a003	! t1_kref+0x2dd8:   	prefetch	%g2 + 3, 2
	.word	0xb1a00036	! t1_kref+0x2ddc:   	fmovs	%f22, %f24
	.word	0xaab2800a	! t1_kref+0x2de0:   	orncc	%o2, %o2, %l5
	.word	0xa5a608d4	! t1_kref+0x2de4:   	fsubd	%f24, %f20, %f18
	.word	0xa5a4cd32	! t1_kref+0x2de8:   	fsmuld	%f19, %f18, %f18
	.word	0xbda4493c	! t1_kref+0x2dec:   	fmuls	%f17, %f28, %f30
	.word	0xb6102008	! t1_kref+0x2df0:   	mov	0x8, %i3
	.word	0xa765a30c	! t1_kref+0x2df4:   	movneg	%icc, 0x30c, %l3
	.word	0x81af8a3a	! t1_kref+0x2df8:   	fcmps	%fcc0, %f30, %f26
	.word	0xa4d32ec8	! t1_kref+0x2dfc:   	umulcc	%o4, 0xec8, %l2
	.word	0xbda01914	! t1_kref+0x2e00:   	fitod	%f20, %f30
	.word	0xe8d01018	! t1_kref+0x2e04:   	ldsha	[%g0 + %i0]0x80, %l4
	.word	0xb5b50f9c	! t1_kref+0x2e08:   	for	%f20, %f28, %f26
	.word	0x39800008	! t1_kref+0x2e0c:   	fbuge,a	_kref+0x2e2c
	.word	0xae52400b	! t1_kref+0x2e10:   	umul	%o1, %o3, %l7
	.word	0xa5b00c00	! t1_kref+0x2e14:   	fzero	%f18
	.word	0x81af8a50	! t1_kref+0x2e18:   	fcmpd	%fcc0, %f30, %f16
	.word	0x28480005	! t1_kref+0x2e1c:   	bleu,a,pt	%icc, _kref+0x2e30
	.word	0x90f32f88	! t1_kref+0x2e20:   	udivcc	%o4, 0xf88, %o0
	.word	0xc56e000c	! t1_kref+0x2e24:   	prefetch	%i0 + %o4, 2
	.word	0xa5b4cfb9	! t1_kref+0x2e28:   	fors	%f19, %f25, %f18
	.word	0x81df62bf	! t1_kref+0x2e2c:   	flush	%i5 + 0x2bf
	.word	0xb5a78932	! t1_kref+0x2e30:   	fmuls	%f30, %f18, %f26
	.word	0xd41e7ff8	! t1_kref+0x2e34:   	ldd	[%i1 - 8], %o2
	.word	0xa3a0053e	! t1_kref+0x2e38:   	fsqrts	%f30, %f17
	.word	0x2d800005	! t1_kref+0x2e3c:   	fbg,a	_kref+0x2e50
	.word	0xe44e0000	! t1_kref+0x2e40:   	ldsb	[%i0], %l2
	.word	0xb7a01a34	! t1_kref+0x2e44:   	fstoi	%f20, %f27
	.word	0xa9a0193c	! t1_kref+0x2e48:   	fstod	%f28, %f20
	.word	0xb1b5097e	! t1_kref+0x2e4c:   	fpmerge	%f20, %f30, %f24
	.word	0x3a480007	! t1_kref+0x2e50:   	bcc,a,pt	%icc, _kref+0x2e6c
	.word	0xaec3000a	! t1_kref+0x2e54:   	addccc	%o4, %o2, %l7
	.word	0xa83a4009	! t1_kref+0x2e58:   	xnor	%o1, %o1, %l4
	.word	0xc168a087	! t1_kref+0x2e5c:   	prefetch	%g2 + 0x87, 0
	.word	0xa1b70f52	! t1_kref+0x2e60:   	fornot1	%f28, %f18, %f16
	.word	0xaeb271eb	! t1_kref+0x2e64:   	orncc	%o1, -0xe15, %l7
	.word	0x291dca7a	! t1_kref+0x2e68:   	sethi	%hi(0x7729e800), %l4
	.word	0xa5b5ca79	! t1_kref+0x2e6c:   	fpadd32s	%f23, %f25, %f18
	.word	0xd220a034	! t1_kref+0x2e70:   	st	%o1, [%g2 + 0x34]
	.word	0x927a6478	! t1_kref+0x2e74:   	sdiv	%o1, 0x478, %o1
	.word	0xf5270019	! t1_kref+0x2e78:   	st	%f26, [%i4 + %i1]
	.word	0xf19e1a1c	! t1_kref+0x2e7c:   	ldda	[%i0 + %i4]0xd0, %f24
	.word	0x901ac009	! t1_kref+0x2e80:   	xor	%o3, %o1, %o0
	.word	0xd620a02c	! t1_kref+0x2e84:   	st	%o3, [%g2 + 0x2c]
	.word	0x27480001	! t1_kref+0x2e88:   	fbul,a,pt	%fcc0, _kref+0x2e8c
	.word	0xd630a01e	! t1_kref+0x2e8c:   	sth	%o3, [%g2 + 0x1e]
	.word	0xed68a001	! t1_kref+0x2e90:   	prefetch	%g2 + 1, 22
	.word	0xabb2832c	! t1_kref+0x2e94:   	bmask	%o2, %o4, %l5
	.word	0xb5b7875c	! t1_kref+0x2e98:   	fpack32	%f30, %f28, %f26
	.word	0x907a800c	! t1_kref+0x2e9c:   	sdiv	%o2, %o4, %o0
	.word	0xaa9a6481	! t1_kref+0x2ea0:   	xorcc	%o1, 0x481, %l5
	.word	0xc768a102	! t1_kref+0x2ea4:   	prefetch	%g2 + 0x102, 3
	.word	0xa5a708d4	! t1_kref+0x2ea8:   	fsubd	%f28, %f20, %f18
	.word	0xf3067ffc	! t1_kref+0x2eac:   	ld	[%i1 - 4], %f25
	.word	0xf5266014	! t1_kref+0x2eb0:   	st	%f26, [%i1 + 0x14]
	.word	0x32480004	! t1_kref+0x2eb4:   	bne,a,pt	%icc, _kref+0x2ec4
	.word	0x923274c6	! t1_kref+0x2eb8:   	orn	%o1, -0xb3a, %o1
	.word	0xd03e0000	! t1_kref+0x2ebc:   	std	%o0, [%i0]
	.word	0x39480008	! t1_kref+0x2ec0:   	fbuge,a,pt	%fcc0, _kref+0x2ee0
	.word	0xa9a609d4	! t1_kref+0x2ec4:   	fdivd	%f24, %f20, %f20
	.word	0x24480007	! t1_kref+0x2ec8:   	ble,a,pt	%icc, _kref+0x2ee4
	.word	0xef68a00a	! t1_kref+0x2ecc:   	prefetch	%g2 + 0xa, 23
	.word	0xb9a01891	! t1_kref+0x2ed0:   	fitos	%f17, %f28
	.word	0xb9a0013c	! t1_kref+0x2ed4:   	fabss	%f28, %f28
	.word	0x929a400b	! t1_kref+0x2ed8:   	xorcc	%o1, %o3, %o1
	.word	0x23480001	! t1_kref+0x2edc:   	fbne,a,pt	%fcc0, _kref+0x2ee0
	.word	0xb9b606b5	! t1_kref+0x2ee0:   	fmul8x16al	%f24, %f21, %f28
	.word	0xaf3b000c	! t1_kref+0x2ee4:   	sra	%o4, %o4, %l7
	.word	0x922b000a	! t1_kref+0x2ee8:   	andn	%o4, %o2, %o1
	.word	0xa83ac009	! t1_kref+0x2eec:   	xnor	%o3, %o1, %l4
	.word	0x92d32f41	! t1_kref+0x2ef0:   	umulcc	%o4, 0xf41, %o1
	.word	0x2a800006	! t1_kref+0x2ef4:   	bcs,a	_kref+0x2f0c
	.word	0xa93a400b	! t1_kref+0x2ef8:   	sra	%o1, %o3, %l4
	.word	0xe8881018	! t1_kref+0x2efc:   	lduba	[%g0 + %i0]0x80, %l4
	.word	0x9232ad82	! t1_kref+0x2f00:   	orn	%o2, 0xd82, %o1
	.word	0xd4380018	! t1_kref+0x2f04:   	std	%o2, [%g0 + %i0]
	.word	0xd228a03e	! t1_kref+0x2f08:   	stb	%o1, [%g2 + 0x3e]
	.word	0xada01916	! t1_kref+0x2f0c:   	fitod	%f22, %f22
	.word	0x91b3014a	! t1_kref+0x2f10:   	edge32l	%o4, %o2, %o0
	.word	0xac43000b	! t1_kref+0x2f14:   	addc	%o4, %o3, %l6
	.word	0xe81e2000	! t1_kref+0x2f18:   	ldd	[%i0], %l4
	.word	0x001fffff	! t1_kref+0x2f1c:   	illtrap	0x1fffff
	.word	0xb3a01a3a	! t1_kref+0x2f20:   	fstoi	%f26, %f25
	.word	0xd620a00c	! t1_kref+0x2f24:   	st	%o3, [%g2 + 0xc]
	.word	0xa683000a	! t1_kref+0x2f28:   	addcc	%o4, %o2, %l3
	.word	0xa5b00fc0	! t1_kref+0x2f2c:   	fone	%f18
	.word	0xacf3000a	! t1_kref+0x2f30:   	udivcc	%o4, %o2, %l6
	.word	0xa4b2400b	! t1_kref+0x2f34:   	orncc	%o1, %o3, %l2
	.word	0xc96e000b	! t1_kref+0x2f38:   	prefetch	%i0 + %o3, 4
	.word	0xd62e3ffc	! t1_kref+0x2f3c:   	stb	%o3, [%i0 - 4]
	.word	0xa7b2810c	! t1_kref+0x2f40:   	edge32	%o2, %o4, %l3
	.word	0xbba748be	! t1_kref+0x2f44:   	fsubs	%f29, %f30, %f29
	.word	0xbda000b6	! t1_kref+0x2f48:   	fnegs	%f22, %f30
	.word	0xaaaa800a	! t1_kref+0x2f4c:   	andncc	%o2, %o2, %l5
	.word	0xe920a014	! t1_kref+0x2f50:   	st	%f20, [%g2 + 0x14]
	.word	0xbba789ba	! t1_kref+0x2f54:   	fdivs	%f30, %f26, %f29
	.word	0xeb000019	! t1_kref+0x2f58:   	ld	[%g0 + %i1], %f21
	.word	0xb5b486d6	! t1_kref+0x2f5c:   	fmul8sux16	%f18, %f22, %f26
	.word	0xf3ee501d	! t1_kref+0x2f60:   	prefetcha	%i1 + %i5, 25
	.word	0x3f800002	! t1_kref+0x2f64:   	fbo,a	_kref+0x2f6c
	.word	0xae3a8009	! t1_kref+0x2f68:   	xnor	%o2, %o1, %l7
	.word	0xabb2816a	! t1_kref+0x2f6c:   	edge32ln	%o2, %o2, %l5
	.word	0xee40a01c	! t1_kref+0x2f70:   	ldsw	[%g2 + 0x1c], %l7
	.word	0xaa23000b	! t1_kref+0x2f74:   	sub	%o4, %o3, %l5
	.word	0xd03e2008	! t1_kref+0x2f78:   	std	%o0, [%i0 + 8]
	.word	0x2d800006	! t1_kref+0x2f7c:   	fbg,a	_kref+0x2f94
	.word	0xfb20a01c	! t1_kref+0x2f80:   	st	%f29, [%g2 + 0x1c]
	.word	0xb3a00138	! t1_kref+0x2f84:   	fabss	%f24, %f25
	.word	0xa622e12b	! t1_kref+0x2f88:   	sub	%o3, 0x12b, %l3
	.word	0xac32c00a	! t1_kref+0x2f8c:   	orn	%o3, %o2, %l6
	.word	0xafa00037	! t1_kref+0x2f90:   	fmovs	%f23, %f23
	.word	0x91b3004a	! t1_kref+0x2f94:   	edge8l	%o4, %o2, %o0
	.word	0x86102003	! t1_kref+0x2f98:   	mov	0x3, %g3
	.word	0x32800000	! t1_kref+0x2f9c:   	bne,a	_kref+0x2f9c
	.word	0x86a0e001	! t1_kref+0x2fa0:   	subcc	%g3, 1, %g3
	.word	0xd620a03c	! t1_kref+0x2fa4:   	st	%o3, [%g2 + 0x3c]
	.word	0xb1a58934	! t1_kref+0x2fa8:   	fmuls	%f22, %f20, %f24
	.word	0x86102001	! t1_kref+0x2fac:   	mov	0x1, %g3
	.word	0x32800000	! t1_kref+0x2fb0:   	bne,a	_kref+0x2fb0
	.word	0x86a0e001	! t1_kref+0x2fb4:   	subcc	%g3, 1, %g3
	.word	0x8143e040	! t1_kref+0x2fb8:   	membar	0x40
	.word	0xb9b58a58	! t1_kref+0x2fbc:   	fpadd32	%f22, %f24, %f28
	.word	0xad3b0009	! t1_kref+0x2fc0:   	sra	%o4, %o1, %l6
	.word	0xb5a01896	! t1_kref+0x2fc4:   	fitos	%f22, %f26
	.word	0x903ac00c	! t1_kref+0x2fc8:   	xnor	%o3, %o4, %o0
	.word	0xa9a0005c	! t1_kref+0x2fcc:   	fmovd	%f28, %f20
	.word	0xd43e4000	! t1_kref+0x2fd0:   	std	%o2, [%i1]
	.word	0xa3b78a74	! t1_kref+0x2fd4:   	fpadd32s	%f30, %f20, %f17
	.word	0xd81e401d	! t1_kref+0x2fd8:   	ldd	[%i1 + %i5], %o4
	.word	0x9fc00004	! t1_kref+0x2fdc:   	call	%g0 + %g4
	.word	0xe4180019	! t1_kref+0x2fe0:   	ldd	[%g0 + %i1], %l2
	.word	0xe36e2008	! t1_kref+0x2fe4:   	prefetch	%i0 + 8, 17
	.word	0xa3b00778	! t1_kref+0x2fe8:   	fpack16	%f24, %f17
	.word	0xacb3000a	! t1_kref+0x2fec:   	orncc	%o4, %o2, %l6
	.word	0xa1a74d3d	! t1_kref+0x2ff0:   	fsmuld	%f29, %f29, %f16
	.word	0xa3b00fe0	! t1_kref+0x2ff4:   	fones	%f17
	.word	0xa93b2001	! t1_kref+0x2ff8:   	sra	%o4, 0x1, %l4
	.word	0xb1a588d4	! t1_kref+0x2ffc:   	fsubd	%f22, %f20, %f24
	.word	0xe19e1a1c	! t1_kref+0x3000:   	ldda	[%i0 + %i4]0xd0, %f16
	.word	0xe65e401d	! t1_kref+0x3004:   	ldx	[%i1 + %i5], %l3
	.word	0xd828a025	! t1_kref+0x3008:   	stb	%o4, [%g2 + 0x25]
	.word	0x001fffff	! t1_kref+0x300c:   	illtrap	0x1fffff
	.word	0xef68a002	! t1_kref+0x3010:   	prefetch	%g2 + 2, 23
	.word	0xa5a50858	! t1_kref+0x3014:   	faddd	%f20, %f24, %f18
	.word	0xd630a03c	! t1_kref+0x3018:   	sth	%o3, [%g2 + 0x3c]
	.word	0x2a480008	! t1_kref+0x301c:   	bcs,a,pt	%icc, _kref+0x303c
	.word	0xb1b70d9e	! t1_kref+0x3020:   	fxor	%f28, %f30, %f24
	.word	0xb1a01894	! t1_kref+0x3024:   	fitos	%f20, %f24
	.word	0xbba00033	! t1_kref+0x3028:   	fmovs	%f19, %f29
	.word	0xd4366010	! t1_kref+0x302c:   	sth	%o2, [%i1 + 0x10]
	.word	0x909a800b	! t1_kref+0x3030:   	xorcc	%o2, %o3, %o0
	.word	0xd230a024	! t1_kref+0x3034:   	sth	%o1, [%g2 + 0x24]
	.word	0xab400000	! t1_kref+0x3038:   	mov	%y, %l5
	.word	0xab44c000	! t1_kref+0x303c:   	mov	%gsr, %l5
	.word	0xf007bfe0	! t1_kref+0x3040:   	ld	[%fp - 0x20], %i0
	.word	0xd228a01c	! t1_kref+0x3044:   	stb	%o1, [%g2 + 0x1c]
	.word	0xa7b785d6	! t1_kref+0x3048:   	fcmpeq32	%f30, %f22, %l3
	.word	0x27480006	! t1_kref+0x304c:   	fbul,a,pt	%fcc0, _kref+0x3064
	.word	0xe93e7fe0	! t1_kref+0x3050:   	std	%f20, [%i1 - 0x20]
	.word	0xada508d0	! t1_kref+0x3054:   	fsubd	%f20, %f16, %f22
	.word	0xa5a788dc	! t1_kref+0x3058:   	fsubd	%f30, %f28, %f18
	.word	0x93418000	! t1_kref+0x305c:   	mov	%fprs, %o1
	.word	0xaa72f774	! t1_kref+0x3060:   	udiv	%o3, -0x88c, %l5
	.word	0xb1b60d14	! t1_kref+0x3064:   	fandnot1	%f24, %f20, %f24
	.word	0x9de3bfa0	! t1_kref+0x3068:   	save	%sp, -0x60, %sp
	.word	0xafe822b3	! t1_kref+0x306c:   	restore	%g0, 0x2b3, %l7
	.word	0xb1b58dd6	! t1_kref+0x3070:   	fnand	%f22, %f22, %f24
	.word	0x81ae0a56	! t1_kref+0x3074:   	fcmpd	%fcc0, %f24, %f22
	.word	0xd8763ff8	! t1_kref+0x3078:   	stx	%o4, [%i0 - 8]
	.word	0x001fffff	! t1_kref+0x307c:   	illtrap	0x1fffff
	.word	0xa69a8009	! t1_kref+0x3080:   	xorcc	%o2, %o1, %l3
	.word	0xb1a0189d	! t1_kref+0x3084:   	fitos	%f29, %f24
	.word	0xe76e401a	! t1_kref+0x3088:   	prefetch	%i1 + %i2, 19
	.word	0xb9b58a5e	! t1_kref+0x308c:   	fpadd32	%f22, %f30, %f28
	.word	0xa9a01897	! t1_kref+0x3090:   	fitos	%f23, %f20
	.word	0xae2b000b	! t1_kref+0x3094:   	andn	%o4, %o3, %l7
	.word	0xd428a00d	! t1_kref+0x3098:   	stb	%o2, [%g2 + 0xd]
	.word	0xaba01a3c	! t1_kref+0x309c:   	fstoi	%f28, %f21
	.word	0xada000d6	! t1_kref+0x30a0:   	fnegd	%f22, %f22
	.word	0xd230a02e	! t1_kref+0x30a4:   	sth	%o1, [%g2 + 0x2e]
	.word	0x8143e040	! t1_kref+0x30a8:   	membar	0x40
	.word	0xa69b24e3	! t1_kref+0x30ac:   	xorcc	%o4, 0x4e3, %l3
	.word	0xa9a0193b	! t1_kref+0x30b0:   	fstod	%f27, %f20
	.word	0xae1aaaae	! t1_kref+0x30b4:   	xor	%o2, 0xaae, %l7
	.word	0xafb3012b	! t1_kref+0x30b8:   	edge32n	%o4, %o3, %l7
	.word	0xafb78514	! t1_kref+0x30bc:   	fcmpgt16	%f30, %f20, %l7
	.word	0xd628a01e	! t1_kref+0x30c0:   	stb	%o3, [%g2 + 0x1e]
	.word	0xbda70d3e	! t1_kref+0x30c4:   	fsmuld	%f28, %f30, %f30
	.word	0xafb00cf6	! t1_kref+0x30c8:   	fnot2s	%f22, %f23
	.word	0xf9266008	! t1_kref+0x30cc:   	st	%f28, [%i1 + 8]
	.word	0x9fc00004	! t1_kref+0x30d0:   	call	%g0 + %g4
	.word	0xb9b00f1e	! t1_kref+0x30d4:   	fsrc2	%f30, %f28
	.word	0xae2a800c	! t1_kref+0x30d8:   	andn	%o2, %o4, %l7
	.word	0x92b32624	! t1_kref+0x30dc:   	orncc	%o4, 0x624, %o1
	.word	0xa9b2c240	! t1_kref+0x30e0:   	array16	%o3, %g0, %l4
	.word	0xafb28200	! t1_kref+0x30e4:   	array8	%o2, %g0, %l7
	.word	0xc368a0c3	! t1_kref+0x30e8:   	prefetch	%g2 + 0xc3, 1
	.word	0x9fc00004	! t1_kref+0x30ec:   	call	%g0 + %g4
	.word	0xa9b3014a	! t1_kref+0x30f0:   	edge32l	%o4, %o2, %l4
	.word	0x2b800008	! t1_kref+0x30f4:   	fbug,a	_kref+0x3114
	.word	0xae9ab38c	! t1_kref+0x30f8:   	xorcc	%o2, -0xc74, %l7
	.word	0xf3260000	! t1_kref+0x30fc:   	st	%f25, [%i0]
	.word	0xe7ee101d	! t1_kref+0x3100:   	prefetcha	%i0 + %i5, 19
	.word	0x81ad0ad0	! t1_kref+0x3104:   	fcmped	%fcc0, %f20, %f16
	.word	0xd820a014	! t1_kref+0x3108:   	st	%o4, [%g2 + 0x14]
	.word	0x32480005	! t1_kref+0x310c:   	bne,a,pt	%icc, _kref+0x3120
	.word	0xaafae443	! t1_kref+0x3110:   	sdivcc	%o3, 0x443, %l5
	.word	0x9012af74	! t1_kref+0x3114:   	or	%o2, 0xf74, %o0
	.word	0xb9a60856	! t1_kref+0x3118:   	faddd	%f24, %f22, %f28
	.word	0xb5a4885c	! t1_kref+0x311c:   	faddd	%f18, %f28, %f26
	.word	0xa6ab3c3b	! t1_kref+0x3120:   	andncc	%o4, -0x3c5, %l3
	.word	0x2b480006	! t1_kref+0x3124:   	fbug,a,pt	%fcc0, _kref+0x313c
	.word	0xa7a7493b	! t1_kref+0x3128:   	fmuls	%f29, %f27, %f19
	.word	0xb1a00135	! t1_kref+0x312c:   	fabss	%f21, %f24
	.word	0x92c2b6f0	! t1_kref+0x3130:   	addccc	%o2, -0x910, %o1
	.word	0xb5b60a94	! t1_kref+0x3134:   	fpsub16	%f24, %f20, %f26
	.word	0x903b332f	! t1_kref+0x3138:   	xnor	%o4, -0xcd1, %o0
	.word	0xadb4ce74	! t1_kref+0x313c:   	fxnors	%f19, %f20, %f22
	.word	0xa5a408d4	! t1_kref+0x3140:   	fsubd	%f16, %f20, %f18
	.word	0xb9a00032	! t1_kref+0x3144:   	fmovs	%f18, %f28
	.word	0xadb50456	! t1_kref+0x3148:   	fcmpne16	%f20, %f22, %l6
	.word	0xe648a006	! t1_kref+0x314c:   	ldsb	[%g2 + 6], %l3
	.word	0xb5a00156	! t1_kref+0x3150:   	fabsd	%f22, %f26
	.word	0xa5a0003d	! t1_kref+0x3154:   	fmovs	%f29, %f18
	.word	0xf120a024	! t1_kref+0x3158:   	st	%f24, [%g2 + 0x24]
	.word	0xd430a03e	! t1_kref+0x315c:   	sth	%o2, [%g2 + 0x3e]
	.word	0xa8b337d9	! t1_kref+0x3160:   	orncc	%o4, -0x827, %l4
	.word	0xe44e4000	! t1_kref+0x3164:   	ldsb	[%i1], %l2
	.word	0xe8180018	! t1_kref+0x3168:   	ldd	[%g0 + %i0], %l4
	.word	0xea08a01c	! t1_kref+0x316c:   	ldub	[%g2 + 0x1c], %l5
	.word	0xb9a0189e	! t1_kref+0x3170:   	fitos	%f30, %f28
	.word	0xaf2b000a	! t1_kref+0x3174:   	sll	%o4, %o2, %l7
	.word	0x2b800008	! t1_kref+0x3178:   	fbug,a	_kref+0x3198
	.word	0xb1a58852	! t1_kref+0x317c:   	faddd	%f22, %f18, %f24
	.word	0xa5b3032b	! t1_kref+0x3180:   	bmask	%o4, %o3, %l2
	.word	0xb9b70994	! t1_kref+0x3184:   	bshuffle	%f28, %f20, %f28
	.word	0xad32800a	! t1_kref+0x3188:   	srl	%o2, %o2, %l6
	.word	0xaf40c000	! t1_kref+0x318c:   	mov	%asi, %l7
	.word	0xa49ae017	! t1_kref+0x3190:   	xorcc	%o3, 0x17, %l2
	.word	0xee08a03c	! t1_kref+0x3194:   	ldub	[%g2 + 0x3c], %l7
	.word	0xb9b40a98	! t1_kref+0x3198:   	fpsub16	%f16, %f24, %f28
	sethi	%hi(2f), %o7
	.word	0xe40be1dc	! t1_kref+0x31a0:   	ldub	[%o7 + 0x1dc], %l2
	.word	0xa41ca00c	! t1_kref+0x31a4:   	xor	%l2, 0xc, %l2
	.word	0xe42be1dc	! t1_kref+0x31a8:   	stb	%l2, [%o7 + 0x1dc]
	.word	0x81dbe1dc	! t1_kref+0x31ac:   	flush	%o7 + 0x1dc
	.word	0xabb24200	! t1_kref+0x31b0:   	array8	%o1, %g0, %l5
	.word	0xa8926e65	! t1_kref+0x31b4:   	orcc	%o1, 0xe65, %l4
	.word	0xb5a5085c	! t1_kref+0x31b8:   	faddd	%f20, %f28, %f26
	.word	0xb5b50996	! t1_kref+0x31bc:   	bshuffle	%f20, %f22, %f26
	.word	0xab3ac00b	! t1_kref+0x31c0:   	sra	%o3, %o3, %l5
	.word	0xec50a03e	! t1_kref+0x31c4:   	ldsh	[%g2 + 0x3e], %l6
	.word	0xac93000c	! t1_kref+0x31c8:   	orcc	%o4, %o4, %l6
	.word	0xf1be188b	! t1_kref+0x31cc:   	stda	%f24, [%i0 + %o3]0xc4
	.word	0xadb60dde	! t1_kref+0x31d0:   	fnand	%f24, %f30, %f22
	.word	0xd8300019	! t1_kref+0x31d4:   	sth	%o4, [%g0 + %i1]
	.word	0xa7b2c16a	! t1_kref+0x31d8:   	edge32ln	%o3, %o2, %l3
2:	.word	0xa45af89f	! t1_kref+0x31dc:   	smul	%o3, -0x761, %l2
	.word	0xb5a01a3e	! t1_kref+0x31e0:   	fstoi	%f30, %f26
	.word	0xb5a64d32	! t1_kref+0x31e4:   	fsmuld	%f25, %f18, %f26
	.word	0xf1ee101b	! t1_kref+0x31e8:   	prefetcha	%i0 + %i3, 24
	.word	0x90fab92d	! t1_kref+0x31ec:   	sdivcc	%o2, -0x6d3, %o0
	.word	0xb5a01935	! t1_kref+0x31f0:   	fstod	%f21, %f26
	.word	0xc9ee100c	! t1_kref+0x31f4:   	prefetcha	%i0 + %o4, 4
	.word	0xaebaa300	! t1_kref+0x31f8:   	xnorcc	%o2, 0x300, %l7
	.word	0xf83f4000	! t1_kref+0x31fc:   	std	%i4, [%i5]
	.word	0xad418000	! t1_kref+0x3200:   	mov	%fprs, %l6
	.word	0xb9b50912	! t1_kref+0x3204:   	faligndata	%f20, %f18, %f28
	.word	0xe4d6501b	! t1_kref+0x3208:   	ldsha	[%i1 + %i3]0x80, %l2
	.word	0x93400000	! t1_kref+0x320c:   	mov	%y, %o1
	.word	0xa62b3a20	! t1_kref+0x3210:   	andn	%o4, -0x5e0, %l3
	.word	0xbba01892	! t1_kref+0x3214:   	fitos	%f18, %f29
	.word	0x86102002	! t1_kref+0x3218:   	mov	0x2, %g3
	.word	0x32800000	! t1_kref+0x321c:   	bne,a	_kref+0x321c
	.word	0x86a0e001	! t1_kref+0x3220:   	subcc	%g3, 1, %g3
	.word	0x2d480008	! t1_kref+0x3224:   	fbg,a,pt	%fcc0, _kref+0x3244
	.word	0xa65336c9	! t1_kref+0x3228:   	umul	%o4, -0x937, %l3
	.word	0xe44e4000	! t1_kref+0x322c:   	ldsb	[%i1], %l2
	.word	0xe9be188b	! t1_kref+0x3230:   	stda	%f20, [%i0 + %o3]0xc4
	.word	0x9fc10000	! t1_kref+0x3234:   	call	%g4
	.word	0xe7070019	! t1_kref+0x3238:   	ld	[%i4 + %i1], %f19
	.word	0xb9a0191e	! t1_kref+0x323c:   	fitod	%f30, %f28
	.word	0x37480005	! t1_kref+0x3240:   	fbge,a,pt	%fcc0, _kref+0x3254
	.word	0xa85ac009	! t1_kref+0x3244:   	smul	%o3, %o1, %l4
	.word	0xeb6e7ff0	! t1_kref+0x3248:   	prefetch	%i1 - 0x10, 21
	.word	0xd620a004	! t1_kref+0x324c:   	st	%o3, [%g2 + 4]
	.word	0xacc2703a	! t1_kref+0x3250:   	addccc	%o1, -0xfc6, %l6
	.word	0xa7418000	! t1_kref+0x3254:   	mov	%fprs, %l3
	.word	0xec4e2011	! t1_kref+0x3258:   	ldsb	[%i0 + 0x11], %l6
	.word	0xeb263fe0	! t1_kref+0x325c:   	st	%f21, [%i0 - 0x20]
	.word	0xbda01892	! t1_kref+0x3260:   	fitos	%f18, %f30
	call	1f
	.empty
	.word	0xc807bff0	! t1_kref+0x3268:   	ld	[%fp - 0x10], %g4
	.word	0x23800003	! t1_kref+0x326c:   	fbne,a	_kref+0x3278
1:	.word	0x92b2b86a	! t1_kref+0x3270:   	orncc	%o2, -0x796, %o1
	.word	0xa403000a	! t1_kref+0x3274:   	add	%o4, %o2, %l2
	.word	0x3d480007	! t1_kref+0x3278:   	fbule,a,pt	%fcc0, _kref+0x3294
	.word	0x913ae015	! t1_kref+0x327c:   	sra	%o3, 0x15, %o0
	.word	0xf207bfe0	! t1_kref+0x3280:   	ld	[%fp - 0x20], %i1
	.word	0x3f800008	! t1_kref+0x3284:   	fbo,a	_kref+0x32a4
	.word	0xe3070019	! t1_kref+0x3288:   	ld	[%i4 + %i1], %f17
	.word	0xa9b009b3	! t1_kref+0x328c:   	fexpand	%f19, %f20
	.word	0x8143c000	! t1_kref+0x3290:   	stbar
	.word	0xa7a01a37	! t1_kref+0x3294:   	fstoi	%f23, %f19
	.word	0xb5a01052	! t1_kref+0x3298:   	fdtox	%f18, %f26
	.word	0xa9b3000b	! t1_kref+0x329c:   	edge8	%o4, %o3, %l4
	.word	0xaed3000a	! t1_kref+0x32a0:   	umulcc	%o4, %o2, %l7
	.word	0xa482a304	! t1_kref+0x32a4:   	addcc	%o2, 0x304, %l2
	.word	0xe44e401a	! t1_kref+0x32a8:   	ldsb	[%i1 + %i2], %l2
	.word	0xaebaeb69	! t1_kref+0x32ac:   	xnorcc	%o3, 0xb69, %l7
	.word	0xa5a00031	! t1_kref+0x32b0:   	fmovs	%f17, %f18
	.word	0xadb4ccb7	! t1_kref+0x32b4:   	fandnot2s	%f19, %f23, %f22
	.word	0xd230a03c	! t1_kref+0x32b8:   	sth	%o1, [%g2 + 0x3c]
	.word	0xa9227daa	! t1_kref+0x32bc:   	mulscc	%o1, -0x256, %l4
	.word	0xa60afa45	! t1_kref+0x32c0:   	and	%o3, -0x5bb, %l3
	.word	0xb5b70e80	! t1_kref+0x32c4:   	fsrc1	%f28, %f26
	.word	0xc368a00a	! t1_kref+0x32c8:   	prefetch	%g2 + 0xa, 1
	.word	0xec062014	! t1_kref+0x32cc:   	ld	[%i0 + 0x14], %l6
	.word	0x9002c009	! t1_kref+0x32d0:   	add	%o3, %o1, %o0
	.word	0x3f800003	! t1_kref+0x32d4:   	fbo,a	_kref+0x32e0
	.word	0x90ab36c8	! t1_kref+0x32d8:   	andncc	%o4, -0x938, %o0
	.word	0xac03000c	! t1_kref+0x32dc:   	add	%o4, %o4, %l6
	.word	0xd420a03c	! t1_kref+0x32e0:   	st	%o2, [%g2 + 0x3c]
	.word	0x23800002	! t1_kref+0x32e4:   	fbne,a	_kref+0x32ec
	.word	0xb5b78912	! t1_kref+0x32e8:   	faligndata	%f30, %f18, %f26
	.word	0xe53e7ff8	! t1_kref+0x32ec:   	std	%f18, [%i1 - 8]
	.word	0xa5a00552	! t1_kref+0x32f0:   	fsqrtd	%f18, %f18
	.word	0xa41ac00b	! t1_kref+0x32f4:   	xor	%o3, %o3, %l2
	.word	0x922b3dcf	! t1_kref+0x32f8:   	andn	%o4, -0x231, %o1
	.word	0xaa92ba60	! t1_kref+0x32fc:   	orcc	%o2, -0x5a0, %l5
	.word	0xada01914	! t1_kref+0x3300:   	fitod	%f20, %f22
	.word	0xfd070018	! t1_kref+0x3304:   	ld	[%i4 + %i0], %f30
	.word	0xa9a7085e	! t1_kref+0x3308:   	faddd	%f28, %f30, %f20
	.word	0xa4faec4c	! t1_kref+0x330c:   	sdivcc	%o3, 0xc4c, %l2
	.word	0xb9a00136	! t1_kref+0x3310:   	fabss	%f22, %f28
	.word	0xf1270019	! t1_kref+0x3314:   	st	%f24, [%i4 + %i1]
	.word	0xa9b78717	! t1_kref+0x3318:   	fmuld8sux16	%f30, %f23, %f20
	.word	0xb1a01a39	! t1_kref+0x331c:   	fstoi	%f25, %f24
	.word	0xc56e000c	! t1_kref+0x3320:   	prefetch	%i0 + %o4, 2
	.word	0xa9a0053a	! t1_kref+0x3324:   	fsqrts	%f26, %f20
	.word	0xa45a400a	! t1_kref+0x3328:   	smul	%o1, %o2, %l2
	.word	0xaad334f2	! t1_kref+0x332c:   	umulcc	%o4, -0xb0e, %l5
	.word	0xae0b38d3	! t1_kref+0x3330:   	and	%o4, -0x72d, %l7
	.word	0x90726ba8	! t1_kref+0x3334:   	udiv	%o1, 0xba8, %o0
	.word	0x92b2c009	! t1_kref+0x3338:   	orncc	%o3, %o1, %o1
	.word	0x81af0a58	! t1_kref+0x333c:   	fcmpd	%fcc0, %f28, %f24
	.word	0xb1a0055c	! t1_kref+0x3340:   	fsqrtd	%f28, %f24
	.word	0xe4871058	! t1_kref+0x3344:   	lda	[%i4 + %i0]0x82, %l2
	.word	0xae12c00c	! t1_kref+0x3348:   	or	%o3, %o4, %l7
	.word	0xec070019	! t1_kref+0x334c:   	ld	[%i4 + %i1], %l6
	.word	0xd43e2008	! t1_kref+0x3350:   	std	%o2, [%i0 + 8]
	.word	0xaedafdc8	! t1_kref+0x3354:   	smulcc	%o3, -0x238, %l7
	.word	0xec4e6006	! t1_kref+0x3358:   	ldsb	[%i1 + 6], %l6
	.word	0xd2400018	! t1_kref+0x335c:   	ldsw	[%g0 + %i0], %o1
	.word	0xef68a006	! t1_kref+0x3360:   	prefetch	%g2 + 6, 23
	.word	0xb5a48d32	! t1_kref+0x3364:   	fsmuld	%f18, %f18, %f26
	.word	0xaaf2c009	! t1_kref+0x3368:   	udivcc	%o3, %o1, %l5
	.word	0xd4364000	! t1_kref+0x336c:   	sth	%o2, [%i1]
	.word	0xab3a6008	! t1_kref+0x3370:   	sra	%o1, 0x8, %l5
	.word	0xd01e7fe8	! t1_kref+0x3374:   	ldd	[%i1 - 0x18], %o0
	.word	0xb1a00135	! t1_kref+0x3378:   	fabss	%f21, %f24
	.word	0xafa5893b	! t1_kref+0x337c:   	fmuls	%f22, %f27, %f23
	.word	0xe968a04a	! t1_kref+0x3380:   	prefetch	%g2 + 0x4a, 20
	.word	0xd0067fe0	! t1_kref+0x3384:   	ld	[%i1 - 0x20], %o0
	.word	0xa566000b	! t1_kref+0x3388:   	mova	%icc, %o3, %l2
	.word	0xd420a034	! t1_kref+0x338c:   	st	%o2, [%g2 + 0x34]
	.word	0xada589d4	! t1_kref+0x3390:   	fdivd	%f22, %f20, %f22
	.word	0xa6c323e7	! t1_kref+0x3394:   	addccc	%o4, 0x3e7, %l3
	.word	0xa5a688bd	! t1_kref+0x3398:   	fsubs	%f26, %f29, %f18
	.word	0xa9b7891e	! t1_kref+0x339c:   	faligndata	%f30, %f30, %f20
	.word	0x2f480001	! t1_kref+0x33a0:   	fbu,a,pt	%fcc0, _kref+0x33a4
	.word	0xa5a00034	! t1_kref+0x33a4:   	fmovs	%f20, %f18
	.word	0xa5a00556	! t1_kref+0x33a8:   	fsqrtd	%f22, %f18
	.word	0xa7a01a3c	! t1_kref+0x33ac:   	fstoi	%f28, %f19
	.word	0xe168a10b	! t1_kref+0x33b0:   	prefetch	%g2 + 0x10b, 16
	.word	0xac9aa788	! t1_kref+0x33b4:   	xorcc	%o2, 0x788, %l6
	.word	0xa4dac00a	! t1_kref+0x33b8:   	smulcc	%o3, %o2, %l2
	.word	0xd8360000	! t1_kref+0x33bc:   	sth	%o4, [%i0]
	.word	0x39480008	! t1_kref+0x33c0:   	fbuge,a,pt	%fcc0, _kref+0x33e0
	.word	0xab1b0009	! t1_kref+0x33c4:   	tsubcctv	%o4, %o1, %l5
	.word	0xf5ee101d	! t1_kref+0x33c8:   	prefetcha	%i0 + %i5, 26
	.word	0xd430a004	! t1_kref+0x33cc:   	sth	%o2, [%g2 + 4]
	.word	0xa9a01a39	! t1_kref+0x33d0:   	fstoi	%f25, %f20
	.word	0xed3f4005	! t1_kref+0x33d4:   	std	%f22, [%i5 + %g5]
	.word	0xa9a0191c	! t1_kref+0x33d8:   	fitod	%f28, %f20
	.word	0xed20a034	! t1_kref+0x33dc:   	st	%f22, [%g2 + 0x34]
	.word	0xd03e2008	! t1_kref+0x33e0:   	std	%o0, [%i0 + 8]
	.word	0xa5b28200	! t1_kref+0x33e4:   	array8	%o2, %g0, %l2
	.word	0xa5a0015c	! t1_kref+0x33e8:   	fabsd	%f28, %f18
	.word	0xbda68856	! t1_kref+0x33ec:   	faddd	%f26, %f22, %f30
	.word	0x900a400a	! t1_kref+0x33f0:   	and	%o1, %o2, %o0
	.word	0xe3063ff0	! t1_kref+0x33f4:   	ld	[%i0 - 0x10], %f17
	.word	0xa9b60456	! t1_kref+0x33f8:   	fcmpne16	%f24, %f22, %l4
	.word	0x923ac00a	! t1_kref+0x33fc:   	xnor	%o3, %o2, %o1
	.word	0xd0163fe2	! t1_kref+0x3400:   	lduh	[%i0 - 0x1e], %o0
	.word	0x921a800c	! t1_kref+0x3404:   	xor	%o2, %o4, %o1
	.word	0xa53aa014	! t1_kref+0x3408:   	sra	%o2, 0x14, %l2
	.word	0xae72c009	! t1_kref+0x340c:   	udiv	%o3, %o1, %l7
	.word	0xb3a0053e	! t1_kref+0x3410:   	fsqrts	%f30, %f25
	.word	0xaa8b0009	! t1_kref+0x3414:   	andcc	%o4, %o1, %l5
	.word	0xb9a409dc	! t1_kref+0x3418:   	fdivd	%f16, %f28, %f28
	.word	0xd430a01e	! t1_kref+0x341c:   	sth	%o2, [%g2 + 0x1e]
	.word	0xae8b3d05	! t1_kref+0x3420:   	andcc	%o4, -0x2fb, %l7
	.word	0xa892c009	! t1_kref+0x3424:   	orcc	%o3, %o1, %l4
	.word	0xa4fa76e5	! t1_kref+0x3428:   	sdivcc	%o1, -0x91b, %l2
	.word	0xb9a409d0	! t1_kref+0x342c:   	fdivd	%f16, %f16, %f28
	.word	0xaba018d4	! t1_kref+0x3430:   	fdtos	%f20, %f21
	.word	0xcc386ec4	! t1_kref+0x3434:   	std	%g6, [%g1 + 0xec4]
	.word	0xa802a890	! t1_kref+0x3438:   	add	%o2, 0x890, %l4
	.word	0xadb30029	! t1_kref+0x343c:   	edge8n	%o4, %o1, %l6
	.word	0xef266014	! t1_kref+0x3440:   	st	%f23, [%i1 + 0x14]
	.word	0xaad30009	! t1_kref+0x3444:   	umulcc	%o4, %o1, %l5
	.word	0xb9a6085a	! t1_kref+0x3448:   	faddd	%f24, %f26, %f28
	.word	0xf93f4019	! t1_kref+0x344c:   	std	%f28, [%i5 + %i1]
	.word	0xa61a69f3	! t1_kref+0x3450:   	xor	%o1, 0x9f3, %l3
	.word	0xa72b2016	! t1_kref+0x3454:   	sll	%o4, 0x16, %l3
	.word	0x90628009	! t1_kref+0x3458:   	subc	%o2, %o1, %o0
	.word	0xd630a02e	! t1_kref+0x345c:   	sth	%o3, [%g2 + 0x2e]
	.word	0xa62a73a8	! t1_kref+0x3460:   	andn	%o1, -0xc58, %l3
	.word	0xb5a000d2	! t1_kref+0x3464:   	fnegd	%f18, %f26
	.word	0xa6d2bf30	! t1_kref+0x3468:   	umulcc	%o2, -0xd0, %l3
	.word	0xef68a10f	! t1_kref+0x346c:   	prefetch	%g2 + 0x10f, 23
	.word	0x90baa79d	! t1_kref+0x3470:   	xnorcc	%o2, 0x79d, %o0
	.word	0xac7a800b	! t1_kref+0x3474:   	sdiv	%o2, %o3, %l6
	.word	0xb5a40852	! t1_kref+0x3478:   	faddd	%f16, %f18, %f26
	.word	0x9de3bfa0	! t1_kref+0x347c:   	save	%sp, -0x60, %sp
	.word	0xb016c01b	! t1_kref+0x3480:   	or	%i3, %i3, %i0
	.word	0x91ef401d	! t1_kref+0x3484:   	restore	%i5, %i5, %o0
	.word	0xd0070018	! t1_kref+0x3488:   	ld	[%i4 + %i0], %o0
	.word	0xa7418000	! t1_kref+0x348c:   	mov	%fprs, %l3
	.word	0xd24e8018	! t1_kref+0x3490:   	ldsb	[%i2 + %i0], %o1
	.word	0xd43f4018	! t1_kref+0x3494:   	std	%o2, [%i5 + %i0]
	.word	0xead6d058	! t1_kref+0x3498:   	ldsha	[%i3 + %i0]0x82, %l5
	.word	0xb1a00550	! t1_kref+0x349c:   	fsqrtd	%f16, %f24
	.word	0xaa3b000a	! t1_kref+0x34a0:   	xnor	%o4, %o2, %l5
	.word	0xa7a5c8b9	! t1_kref+0x34a4:   	fsubs	%f23, %f25, %f19
	.word	0xe36e3ff0	! t1_kref+0x34a8:   	prefetch	%i0 - 0x10, 17
	.word	0x81ad0a5c	! t1_kref+0x34ac:   	fcmpd	%fcc0, %f20, %f28
	.word	0xac9a400b	! t1_kref+0x34b0:   	xorcc	%o1, %o3, %l6
	.word	0xe480105c	! t1_kref+0x34b4:   	lda	[%g0 + %i4]0x82, %l2
	.word	0xa5a48854	! t1_kref+0x34b8:   	faddd	%f18, %f20, %f18
	.word	0xabb2410a	! t1_kref+0x34bc:   	edge32	%o1, %o2, %l5
	.word	0xd428a006	! t1_kref+0x34c0:   	stb	%o2, [%g2 + 6]
	.word	0xa1a00554	! t1_kref+0x34c4:   	fsqrtd	%f20, %f16
	.word	0xa5a508d2	! t1_kref+0x34c8:   	fsubd	%f20, %f18, %f18
	.word	0x90ab2b71	! t1_kref+0x34cc:   	andncc	%o4, 0xb71, %o0
	.word	0xada0003d	! t1_kref+0x34d0:   	fmovs	%f29, %f22
	.word	0xabb40518	! t1_kref+0x34d4:   	fcmpgt16	%f16, %f24, %l5
	.word	0xd03e3fe8	! t1_kref+0x34d8:   	std	%o0, [%i0 - 0x18]
	.word	0x2b480002	! t1_kref+0x34dc:   	fbug,a,pt	%fcc0, _kref+0x34e4
	.word	0xaed2fb66	! t1_kref+0x34e0:   	umulcc	%o3, -0x49a, %l7
	.word	0xacd33265	! t1_kref+0x34e4:   	umulcc	%o4, -0xd9b, %l6
	.word	0xac9aeef4	! t1_kref+0x34e8:   	xorcc	%o3, 0xef4, %l6
	.word	0xb5b00cf9	! t1_kref+0x34ec:   	fnot2s	%f25, %f26
	.word	0xa7418000	! t1_kref+0x34f0:   	mov	%fprs, %l3
	.word	0xaab2e786	! t1_kref+0x34f4:   	orncc	%o3, 0x786, %l5
	.word	0x901ae1a7	! t1_kref+0x34f8:   	xor	%o3, 0x1a7, %o0
	.word	0xd250a00e	! t1_kref+0x34fc:   	ldsh	[%g2 + 0xe], %o1
	.word	0xad3aa008	! t1_kref+0x3500:   	sra	%o2, 0x8, %l6
	.word	0xf93f4018	! t1_kref+0x3504:   	std	%f28, [%i5 + %i0]
	.word	0xe81e6018	! t1_kref+0x3508:   	ldd	[%i1 + 0x18], %l4
	.word	0x86102002	! t1_kref+0x350c:   	mov	0x2, %g3
	.word	0x32800000	! t1_kref+0x3510:   	bne,a	_kref+0x3510
	.word	0x86a0e001	! t1_kref+0x3514:   	subcc	%g3, 1, %g3
	.word	0xf9be584a	! t1_kref+0x3518:   	stda	%f28, [%i1 + %o2]0xc2
	.word	0xb5a588d2	! t1_kref+0x351c:   	fsubd	%f22, %f18, %f26
	.word	0xa783000a	! t1_kref+0x3520:   	wr	%o4, %o2, %gsr
	.word	0x93b78510	! t1_kref+0x3524:   	fcmpgt16	%f30, %f16, %o1
	.word	0xabb3000b	! t1_kref+0x3528:   	edge8	%o4, %o3, %l5
	.word	0xad2a8009	! t1_kref+0x352c:   	sll	%o2, %o1, %l6
	.word	0x913b000c	! t1_kref+0x3530:   	sra	%o4, %o4, %o0
	.word	0xf920a01c	! t1_kref+0x3534:   	st	%f28, [%g2 + 0x1c]
	.word	0xa8fa800c	! t1_kref+0x3538:   	sdivcc	%o2, %o4, %l4
	.word	0xb1a0055c	! t1_kref+0x353c:   	fsqrtd	%f28, %f24
	.word	0xbda00554	! t1_kref+0x3540:   	fsqrtd	%f20, %f30
	.word	0x8143e040	! t1_kref+0x3544:   	membar	0x40
	.word	0xd836001b	! t1_kref+0x3548:   	sth	%o4, [%i0 + %i3]
	.word	0xadb70d33	! t1_kref+0x354c:   	fandnot1s	%f28, %f19, %f22
	.word	0x920325b5	! t1_kref+0x3550:   	add	%o4, 0x5b5, %o1
	.word	0xa5b70598	! t1_kref+0x3554:   	fcmpgt32	%f28, %f24, %l2
	.word	0xc768a0c4	! t1_kref+0x3558:   	prefetch	%g2 + 0xc4, 3
	.word	0xea86505c	! t1_kref+0x355c:   	lda	[%i1 + %i4]0x82, %l5
	.word	0xaa2aaace	! t1_kref+0x3560:   	andn	%o2, 0xace, %l5
	.word	0x30480002	! t1_kref+0x3564:   	ba,a,pt	%icc, _kref+0x356c
	.word	0x92b2400a	! t1_kref+0x3568:   	orncc	%o1, %o2, %o1
	.word	0xb9a5c839	! t1_kref+0x356c:   	fadds	%f23, %f25, %f28
	.word	0xd428a00d	! t1_kref+0x3570:   	stb	%o2, [%g2 + 0xd]
	.word	0xbdb00cda	! t1_kref+0x3574:   	fnot2	%f26, %f30
	.word	0xe96e7fe0	! t1_kref+0x3578:   	prefetch	%i1 - 0x20, 20
	.word	0xd8363ffe	! t1_kref+0x357c:   	sth	%o4, [%i0 - 2]
	.word	0xae22400a	! t1_kref+0x3580:   	sub	%o1, %o2, %l7
	.word	0xeb00a004	! t1_kref+0x3584:   	ld	[%g2 + 4], %f21
	.word	0xe920a02c	! t1_kref+0x3588:   	st	%f20, [%g2 + 0x2c]
	.word	0xd43e001d	! t1_kref+0x358c:   	std	%o2, [%i0 + %i5]
	.word	0xb9a5085a	! t1_kref+0x3590:   	faddd	%f20, %f26, %f28
	.word	0xb9a0003a	! t1_kref+0x3594:   	fmovs	%f26, %f28
	.word	0xec06001c	! t1_kref+0x3598:   	ld	[%i0 + %i4], %l6
	.word	0x912b000c	! t1_kref+0x359c:   	sll	%o4, %o4, %o0
	.word	0xa5b2c06a	! t1_kref+0x35a0:   	edge8ln	%o3, %o2, %l2
	.word	0xa87ac009	! t1_kref+0x35a4:   	sdiv	%o3, %o1, %l4
	.word	0x92b2c00c	! t1_kref+0x35a8:   	orncc	%o3, %o4, %o1
	.word	0xb5a70d38	! t1_kref+0x35ac:   	fsmuld	%f28, %f24, %f26
	.word	0x86102003	! t1_kref+0x35b0:   	mov	0x3, %g3
	.word	0x32800000	! t1_kref+0x35b4:   	bne,a	_kref+0x35b4
	.word	0x86a0e001	! t1_kref+0x35b8:   	subcc	%g3, 1, %g3
	.word	0x28480007	! t1_kref+0x35bc:   	bleu,a,pt	%icc, _kref+0x35d8
	.word	0xa9a018d0	! t1_kref+0x35c0:   	fdtos	%f16, %f20
	.word	0xbdb00f3c	! t1_kref+0x35c4:   	fsrc2s	%f28, %f30
	.word	0xf3262008	! t1_kref+0x35c8:   	st	%f25, [%i0 + 8]
	.word	0xe46e600b	! t1_kref+0x35cc:   	ldstub	[%i1 + 0xb], %l2
	.word	0xb1a64834	! t1_kref+0x35d0:   	fadds	%f25, %f20, %f24
	.word	0xa73ae014	! t1_kref+0x35d4:   	sra	%o3, 0x14, %l3
	.word	0xb9a588d4	! t1_kref+0x35d8:   	fsubd	%f22, %f20, %f28
	.word	0xe36e2000	! t1_kref+0x35dc:   	prefetch	%i0, 17
	.word	0x9de3bfa0	! t1_kref+0x35e0:   	save	%sp, -0x60, %sp
	.word	0x91e8207a	! t1_kref+0x35e4:   	restore	%g0, 0x7a, %o0
	.word	0xfbee101d	! t1_kref+0x35e8:   	prefetcha	%i0 + %i5, 29
	.word	0xadb2816c	! t1_kref+0x35ec:   	edge32ln	%o2, %o4, %l6
	.word	0xed200018	! t1_kref+0x35f0:   	st	%f22, [%g0 + %i0]
	.word	0xa7a01a3a	! t1_kref+0x35f4:   	fstoi	%f26, %f19
	.word	0xafa01a3d	! t1_kref+0x35f8:   	fstoi	%f29, %f23
	.word	0xb9a00556	! t1_kref+0x35fc:   	fsqrtd	%f22, %f28
	.word	0x91b58518	! t1_kref+0x3600:   	fcmpgt16	%f22, %f24, %o0
	.word	0xa5b78550	! t1_kref+0x3604:   	fcmpeq16	%f30, %f16, %l2
	.word	0x3e480002	! t1_kref+0x3608:   	bvc,a,pt	%icc, _kref+0x3610
	.word	0x90d2661c	! t1_kref+0x360c:   	umulcc	%o1, 0x61c, %o0
	.word	0xa5b70490	! t1_kref+0x3610:   	fcmple32	%f28, %f16, %l2
	.word	0x31800001	! t1_kref+0x3614:   	fba,a	_kref+0x3618
	.word	0xaba0053e	! t1_kref+0x3618:   	fsqrts	%f30, %f21
	.word	0xb5a01917	! t1_kref+0x361c:   	fitod	%f23, %f26
	.word	0x2d800004	! t1_kref+0x3620:   	fbg,a	_kref+0x3630
	.word	0xafa74938	! t1_kref+0x3624:   	fmuls	%f29, %f24, %f23
	.word	0x3f800006	! t1_kref+0x3628:   	fbo,a	_kref+0x3640
	.word	0xd8ae9018	! t1_kref+0x362c:   	stba	%o4, [%i2 + %i0]0x80
	.word	0xe64e8019	! t1_kref+0x3630:   	ldsb	[%i2 + %i1], %l3
	.word	0x81ad0ab2	! t1_kref+0x3634:   	fcmpes	%fcc0, %f20, %f18
	.word	0xa69ac00b	! t1_kref+0x3638:   	xorcc	%o3, %o3, %l3
	.word	0x2d480008	! t1_kref+0x363c:   	fbg,a,pt	%fcc0, _kref+0x365c
	.word	0xa9b50dd6	! t1_kref+0x3640:   	fnand	%f20, %f22, %f20
	.word	0xe65f4019	! t1_kref+0x3644:   	ldx	[%i5 + %i1], %l3
	.word	0xaa9aa58d	! t1_kref+0x3648:   	xorcc	%o2, 0x58d, %l5
	.word	0xfd063ff0	! t1_kref+0x364c:   	ld	[%i0 - 0x10], %f30
	.word	0xa822c00b	! t1_kref+0x3650:   	sub	%o3, %o3, %l4
	.word	0xa70a400b	! t1_kref+0x3654:   	tsubcc	%o1, %o3, %l3
	.word	0xd050a026	! t1_kref+0x3658:   	ldsh	[%g2 + 0x26], %o0
	.word	0x81ae0a5a	! t1_kref+0x365c:   	fcmpd	%fcc0, %f24, %f26
	.word	0xae0aa0ae	! t1_kref+0x3660:   	and	%o2, 0xae, %l7
	.word	0xf9bf5a59	! t1_kref+0x3664:   	stda	%f28, [%i5 + %i1]0xd2
	.word	0x92f2a27a	! t1_kref+0x3668:   	udivcc	%o2, 0x27a, %o1
	.word	0xee4e3ffe	! t1_kref+0x366c:   	ldsb	[%i0 - 2], %l7
	.word	0x20800008	! t1_kref+0x3670:   	bn,a	_kref+0x3690
	.word	0x9232c009	! t1_kref+0x3674:   	orn	%o3, %o1, %o1
	.word	0x903b000b	! t1_kref+0x3678:   	xnor	%o4, %o3, %o0
	.word	0xaf02f01b	! t1_kref+0x367c:   	taddcc	%o3, -0xfe5, %l7
	.word	0xe9ee101d	! t1_kref+0x3680:   	prefetcha	%i0 + %i5, 20
	.word	0xa9b5471e	! t1_kref+0x3684:   	fmuld8sux16	%f21, %f30, %f20
	.word	0xe6d81019	! t1_kref+0x3688:   	ldxa	[%g0 + %i1]0x80, %l3
	.word	0xa5b30169	! t1_kref+0x368c:   	edge32ln	%o4, %o1, %l2
	.word	0xac2a800a	! t1_kref+0x3690:   	andn	%o2, %o2, %l6
	.word	0x902a400a	! t1_kref+0x3694:   	andn	%o1, %o2, %o0
	.word	0xa532a01d	! t1_kref+0x3698:   	srl	%o2, 0x1d, %l2
	.word	0xea00a024	! t1_kref+0x369c:   	ld	[%g2 + 0x24], %l5
	.word	0xa47ae780	! t1_kref+0x36a0:   	sdiv	%o3, 0x780, %l2
	.word	0xaadaad05	! t1_kref+0x36a4:   	smulcc	%o2, 0xd05, %l5
	.word	0xa8c2c00c	! t1_kref+0x36a8:   	addccc	%o3, %o4, %l4
	.word	0xafb00fe0	! t1_kref+0x36ac:   	fones	%f23
	.word	0xd22e401a	! t1_kref+0x36b0:   	stb	%o1, [%i1 + %i2]
	.word	0xeace9040	! t1_kref+0x36b4:   	ldsba	[%i2]0x82, %l5
	.word	0xecce501a	! t1_kref+0x36b8:   	ldsba	[%i1 + %i2]0x80, %l6
	.word	0xfe01401c	! t1_kref+0x36bc:   	ld	[%g5 + %i4], %i7
	.word	0xafb2400a	! t1_kref+0x36c0:   	edge8	%o1, %o2, %l7
	.word	0x24800006	! t1_kref+0x36c4:   	ble,a	_kref+0x36dc
	.word	0xed20a01c	! t1_kref+0x36c8:   	st	%f22, [%g2 + 0x1c]
	.word	0xe9ee101b	! t1_kref+0x36cc:   	prefetcha	%i0 + %i3, 20
	.word	0xacda400c	! t1_kref+0x36d0:   	smulcc	%o1, %o4, %l6
	call	SYM(t1_subr0)
	.word	0x93400000	! t1_kref+0x36d8:   	mov	%y, %o1
	.word	0xb5a5cd3e	! t1_kref+0x36dc:   	fsmuld	%f23, %f30, %f26
	.word	0xd830a02c	! t1_kref+0x36e0:   	sth	%o4, [%g2 + 0x2c]
	.word	0xadb009b9	! t1_kref+0x36e4:   	fexpand	%f25, %f22
	.word	0x30800001	! t1_kref+0x36e8:   	ba,a	_kref+0x36ec
	.word	0xba102018	! t1_kref+0x36ec:   	mov	0x18, %i5
	.word	0xa9a0055c	! t1_kref+0x36f0:   	fsqrtd	%f28, %f20
	.word	0x39800001	! t1_kref+0x36f4:   	fbuge,a	_kref+0x36f8
	.word	0xacba6548	! t1_kref+0x36f8:   	xnorcc	%o1, 0x548, %l6
	.word	0xa9a54d3a	! t1_kref+0x36fc:   	fsmuld	%f21, %f26, %f20
	.word	0xaba0053c	! t1_kref+0x3700:   	fsqrts	%f28, %f21
	.word	0xa5a00534	! t1_kref+0x3704:   	fsqrts	%f20, %f18
	.word	0xe44e8018	! t1_kref+0x3708:   	ldsb	[%i2 + %i0], %l2
	.word	0xadb6055a	! t1_kref+0x370c:   	fcmpeq16	%f24, %f26, %l6
	.word	0xaeb32b3a	! t1_kref+0x3710:   	orncc	%o4, 0xb3a, %l7
	.word	0xb9a749b8	! t1_kref+0x3714:   	fdivs	%f29, %f24, %f28
	.word	0x22480001	! t1_kref+0x3718:   	be,a,pt	%icc, _kref+0x371c
	.word	0xb9b48a90	! t1_kref+0x371c:   	fpsub16	%f18, %f16, %f28
	.word	0xbdb686d6	! t1_kref+0x3720:   	fmul8sux16	%f26, %f22, %f30
	.word	0x8143c000	! t1_kref+0x3724:   	stbar
	.word	0xaba0053b	! t1_kref+0x3728:   	fsqrts	%f27, %f21
	.word	0x2a480006	! t1_kref+0x372c:   	bcs,a,pt	%icc, _kref+0x3744
	.word	0xa9b58f58	! t1_kref+0x3730:   	fornot1	%f22, %f24, %f20
	.word	0xea070018	! t1_kref+0x3734:   	ld	[%i4 + %i0], %l5
	.word	0xd03f4019	! t1_kref+0x3738:   	std	%o0, [%i5 + %i1]
	.word	0x93400000	! t1_kref+0x373c:   	mov	%y, %o1
	.word	0xbbb58ef4	! t1_kref+0x3740:   	fornot2s	%f22, %f20, %f29
	.word	0xa9b68512	! t1_kref+0x3744:   	fcmpgt16	%f26, %f18, %l4
	.word	0xf706401c	! t1_kref+0x3748:   	ld	[%i1 + %i4], %f27
	.word	0xac0aa4f0	! t1_kref+0x374c:   	and	%o2, 0x4f0, %l6
	.word	0xd2560000	! t1_kref+0x3750:   	ldsh	[%i0], %o1
	.word	0xa5a000b2	! t1_kref+0x3754:   	fnegs	%f18, %f18
	.word	0xbba01895	! t1_kref+0x3758:   	fitos	%f21, %f29
	.word	0xd628a03e	! t1_kref+0x375c:   	stb	%o3, [%g2 + 0x3e]
	call	SYM(t1_subr3)
	.word	0xb5a01056	! t1_kref+0x3764:   	fdtox	%f22, %f26
	.word	0xa47b000c	! t1_kref+0x3768:   	sdiv	%o4, %o4, %l2
	.word	0x9fc10000	! t1_kref+0x376c:   	call	%g4
	.word	0x92933077	! t1_kref+0x3770:   	orcc	%o4, -0xf89, %o1
	.word	0x81ae0a58	! t1_kref+0x3774:   	fcmpd	%fcc0, %f24, %f24
	.word	0x90d2b715	! t1_kref+0x3778:   	umulcc	%o2, -0x8eb, %o0
	.word	0xacb2c00b	! t1_kref+0x377c:   	orncc	%o3, %o3, %l6
	.word	0xef20a02c	! t1_kref+0x3780:   	st	%f23, [%g2 + 0x2c]
	.word	0xa7400000	! t1_kref+0x3784:   	mov	%y, %l3
	.word	0xa7b2432b	! t1_kref+0x3788:   	bmask	%o1, %o3, %l3
	.word	0xb5b6cdb1	! t1_kref+0x378c:   	fxors	%f27, %f17, %f26
	.word	0xf1be5889	! t1_kref+0x3790:   	stda	%f24, [%i1 + %o1]0xc4
	.word	0x81580000	! t1_kref+0x3794:   	flushw
	.word	0xa7a01899	! t1_kref+0x3798:   	fitos	%f25, %f19
	.word	0xaa926af1	! t1_kref+0x379c:   	orcc	%o1, 0xaf1, %l5
	.word	0xf207bfe0	! t1_kref+0x37a0:   	ld	[%fp - 0x20], %i1
	.word	0xd828a03e	! t1_kref+0x37a4:   	stb	%o4, [%g2 + 0x3e]
	.word	0xa3a00536	! t1_kref+0x37a8:   	fsqrts	%f22, %f17
	.word	0xab40c000	! t1_kref+0x37ac:   	mov	%asi, %l5
	.word	0x87802082	! t1_kref+0x37b0:   	mov	0x82, %asi
	.word	0x2f800007	! t1_kref+0x37b4:   	fbu,a	_kref+0x37d0
	.word	0xbdb74a7e	! t1_kref+0x37b8:   	fpadd32s	%f29, %f30, %f30
	.word	0xa9b50a16	! t1_kref+0x37bc:   	fpadd16	%f20, %f22, %f20
	.word	0xd8a71018	! t1_kref+0x37c0:   	sta	%o4, [%i4 + %i0]0x80
	.word	0xb7b70f72	! t1_kref+0x37c4:   	fornot1s	%f28, %f18, %f27
	.word	0xe68e9018	! t1_kref+0x37c8:   	lduba	[%i2 + %i0]0x80, %l3
	.word	0x929334de	! t1_kref+0x37cc:   	orcc	%o4, -0xb22, %o1
	.word	0x31480001	! t1_kref+0x37d0:   	fba,a,pt	%fcc0, _kref+0x37d4
	.word	0xd428a00e	! t1_kref+0x37d4:   	stb	%o2, [%g2 + 0xe]
	.word	0xaef3212f	! t1_kref+0x37d8:   	udivcc	%o4, 0x12f, %l7
	.word	0x92b3323d	! t1_kref+0x37dc:   	orncc	%o4, -0xdc3, %o1
	.word	0xaec33218	! t1_kref+0x37e0:   	addccc	%o4, -0xde8, %l7
	.word	0x912ac00b	! t1_kref+0x37e4:   	sll	%o3, %o3, %o0
	.word	0xea070019	! t1_kref+0x37e8:   	ld	[%i4 + %i1], %l5
	.word	0xa5a0055e	! t1_kref+0x37ec:   	fsqrtd	%f30, %f18
	.word	0x93b2c169	! t1_kref+0x37f0:   	edge32ln	%o3, %o1, %o1
	.word	0x9fc00004	! t1_kref+0x37f4:   	call	%g0 + %g4
	.word	0xa4c26190	! t1_kref+0x37f8:   	addccc	%o1, 0x190, %l2
	.word	0xacfb377c	! t1_kref+0x37fc:   	sdivcc	%o4, -0x884, %l6
	sethi	%hi(1f), %o7
	jmpl	%o7+%lo(1f), %g1
	.empty
	.word	0xa5a0003b	! t1_kref+0x3808:   	fmovs	%f27, %f18
	.word	0xa7b6ce7e	! t1_kref+0x380c:   	fxnors	%f27, %f30, %f19
	.word	0xafa0013b	! t1_kref+0x3810:   	fabss	%f27, %f23
	.word	0xb9a018da	! t1_kref+0x3814:   	fdtos	%f26, %f28
1:	.word	0xa9418000	! t1_kref+0x3818:   	mov	%fprs, %l4
	.word	0xbda00554	! t1_kref+0x381c:   	fsqrtd	%f20, %f30
	.word	0x913b000a	! t1_kref+0x3820:   	sra	%o4, %o2, %o0
	.word	0xf93e6008	! t1_kref+0x3824:   	std	%f28, [%i1 + 8]
	.word	0xd620a014	! t1_kref+0x3828:   	st	%o3, [%g2 + 0x14]
	.word	0xa42ac00b	! t1_kref+0x382c:   	andn	%o3, %o3, %l2
	.word	0xa5a0055c	! t1_kref+0x3830:   	fsqrtd	%f28, %f18
	.word	0xd620a004	! t1_kref+0x3834:   	st	%o3, [%g2 + 4]
	.word	0xb1a01915	! t1_kref+0x3838:   	fitod	%f21, %f24
	.word	0x2a800002	! t1_kref+0x383c:   	bcs,a	_kref+0x3844
	.word	0xa41a400a	! t1_kref+0x3840:   	xor	%o1, %o2, %l2
	.word	0xaba4483a	! t1_kref+0x3844:   	fadds	%f17, %f26, %f21
	.word	0xa5b50c54	! t1_kref+0x3848:   	fnor	%f20, %f20, %f18
	.word	0xb5a01a33	! t1_kref+0x384c:   	fstoi	%f19, %f26
	.word	0xe64e200b	! t1_kref+0x3850:   	ldsb	[%i0 + 0xb], %l3
	.word	0xaa2b2593	! t1_kref+0x3854:   	andn	%o4, 0x593, %l5
	.word	0xef68a0c3	! t1_kref+0x3858:   	prefetch	%g2 + 0xc3, 23
	.word	0xa9a00550	! t1_kref+0x385c:   	fsqrtd	%f16, %f20
	.word	0xc368a045	! t1_kref+0x3860:   	prefetch	%g2 + 0x45, 1
	.word	0x2b800001	! t1_kref+0x3864:   	fbug,a	_kref+0x3868
	.word	0xa62b323b	! t1_kref+0x3868:   	andn	%o4, -0xdc5, %l3
	.word	0xaa72c00a	! t1_kref+0x386c:   	udiv	%o3, %o2, %l5
	.word	0xb1a01118	! t1_kref+0x3870:   	fxtod	%f24, %f24
	.word	0xd220a034	! t1_kref+0x3874:   	st	%o1, [%g2 + 0x34]
	.word	0x81ac8ad6	! t1_kref+0x3878:   	fcmped	%fcc0, %f18, %f22
	.word	0xae5b000a	! t1_kref+0x387c:   	smul	%o4, %o2, %l7
	.word	0xb5a708b3	! t1_kref+0x3880:   	fsubs	%f28, %f19, %f26
	.word	0xb7a00036	! t1_kref+0x3884:   	fmovs	%f22, %f27
	.word	0xa9a0055a	! t1_kref+0x3888:   	fsqrtd	%f26, %f20
	.word	0x81ac0ad0	! t1_kref+0x388c:   	fcmped	%fcc0, %f16, %f16
	.word	0xe9a01018	! t1_kref+0x3890:   	sta	%f20, [%g0 + %i0]0x80
	.word	0xaeb2400b	! t1_kref+0x3894:   	orncc	%o1, %o3, %l7
	.word	0xf007bfe0	! t1_kref+0x3898:   	ld	[%fp - 0x20], %i0
	.word	0xaafb335e	! t1_kref+0x389c:   	sdivcc	%o4, -0xca2, %l5
	.word	0xa8aab521	! t1_kref+0x38a0:   	andncc	%o2, -0xadf, %l4
	.word	0xd03e3ff0	! t1_kref+0x38a4:   	std	%o0, [%i0 - 0x10]
	.word	0xa4c2c00a	! t1_kref+0x38a8:   	addccc	%o3, %o2, %l2
	.word	0xbda68834	! t1_kref+0x38ac:   	fadds	%f26, %f20, %f30
	.word	0x8143e067	! t1_kref+0x38b0:   	membar	0x67
	.word	0x92328009	! t1_kref+0x38b4:   	orn	%o2, %o1, %o1
	.word	0xf920a02c	! t1_kref+0x38b8:   	st	%f28, [%g2 + 0x2c]
	.word	0xf9ee501a	! t1_kref+0x38bc:   	prefetcha	%i1 + %i2, 28
	.word	0xad400000	! t1_kref+0x38c0:   	mov	%y, %l6
	.word	0xf9262014	! t1_kref+0x38c4:   	st	%f28, [%i0 + 0x14]
	.word	0x3c800003	! t1_kref+0x38c8:   	bpos,a	_kref+0x38d4
	.word	0xb1a60952	! t1_kref+0x38cc:   	fmuld	%f24, %f18, %f24
	.word	0xe9be1a1a	! t1_kref+0x38d0:   	stda	%f20, [%i0 + %i2]0xd0
	.word	0x9e0060d4	! t1_kref+0x38d4:   	add	%g1, 0xd4, %o7
!	.word	0x2f4d61c6	! t1_kref+0x38d8:   	fbu,a,pt	%fcc0, SYM(t1_subr3)
	   	fbu,a,pt	%fcc0, SYM(t1_subr3)
	.word	0xa402efa3	! t1_kref+0x38dc:   	add	%o3, 0xfa3, %l2
	.word	0x91b68556	! t1_kref+0x38e0:   	fcmpeq16	%f26, %f22, %o0
	.word	0x9de3bfa0	! t1_kref+0x38e4:   	save	%sp, -0x60, %sp
	.word	0x91eec01d	! t1_kref+0x38e8:   	restore	%i3, %i5, %o0
	.word	0xe720a03c	! t1_kref+0x38ec:   	st	%f19, [%g2 + 0x3c]
	.word	0xe53f4018	! t1_kref+0x38f0:   	std	%f18, [%i5 + %i0]
	.word	0x81accab3	! t1_kref+0x38f4:   	fcmpes	%fcc0, %f19, %f19
	.word	0x93b30200	! t1_kref+0x38f8:   	array8	%o4, %g0, %o1
	.word	0xa5a00556	! t1_kref+0x38fc:   	fsqrtd	%f22, %f18
	.word	0xf3ee101d	! t1_kref+0x3900:   	prefetcha	%i0 + %i5, 25
	.word	0xd820a014	! t1_kref+0x3904:   	st	%o4, [%g2 + 0x14]
	.word	0xb1b00fe0	! t1_kref+0x3908:   	fones	%f24
	.word	0x92aa6043	! t1_kref+0x390c:   	andncc	%o1, 0x43, %o1
	.word	0xb1a00550	! t1_kref+0x3910:   	fsqrtd	%f16, %f24
	.word	0xe88e1000	! t1_kref+0x3914:   	lduba	[%i0]0x80, %l4
	.word	0xada70834	! t1_kref+0x3918:   	fadds	%f28, %f20, %f22
	.word	0xa423000c	! t1_kref+0x391c:   	sub	%o4, %o4, %l2
	.word	0x20480008	! t1_kref+0x3920:   	bn,a,pt	%icc, _kref+0x3940
	.word	0xd250a02e	! t1_kref+0x3924:   	ldsh	[%g2 + 0x2e], %o1
	.word	0xa633000c	! t1_kref+0x3928:   	orn	%o4, %o4, %l3
	.word	0xabb30089	! t1_kref+0x392c:   	edge16	%o4, %o1, %l5
	.word	0xafb70db6	! t1_kref+0x3930:   	fxors	%f28, %f22, %f23
	.word	0x921b3ed9	! t1_kref+0x3934:   	xor	%o4, -0x127, %o1
	.word	0xce01401c	! t1_kref+0x3938:   	ld	[%g5 + %i4], %g7
	.word	0x92d2400a	! t1_kref+0x393c:   	umulcc	%o1, %o2, %o1
	.word	0xa5400000	! t1_kref+0x3940:   	mov	%y, %l2
	.word	0xadb68a1a	! t1_kref+0x3944:   	fpadd16	%f26, %f26, %f22
	.word	0xb9b706f8	! t1_kref+0x3948:   	fmul8ulx16	%f28, %f24, %f28
	.word	0xe968a0cd	! t1_kref+0x394c:   	prefetch	%g2 + 0xcd, 20
	.word	0xa9a00135	! t1_kref+0x3950:   	fabss	%f21, %f20
	.word	0x81ad8aba	! t1_kref+0x3954:   	fcmpes	%fcc0, %f22, %f26
	.word	0xaba548b6	! t1_kref+0x3958:   	fsubs	%f21, %f22, %f21
	.word	0xa7a018de	! t1_kref+0x395c:   	fdtos	%f30, %f19
	.word	0x81ae0ada	! t1_kref+0x3960:   	fcmped	%fcc0, %f24, %f26
	.word	0xada0003e	! t1_kref+0x3964:   	fmovs	%f30, %f22
	.word	0x9fc10000	! t1_kref+0x3968:   	call	%g4
	.word	0xa8aae55e	! t1_kref+0x396c:   	andncc	%o3, 0x55e, %l4
	.word	0x31480006	! t1_kref+0x3970:   	fba,a,pt	%fcc0, _kref+0x3988
	.word	0xac2a800c	! t1_kref+0x3974:   	andn	%o2, %o4, %l6
	.word	0xabb58450	! t1_kref+0x3978:   	fcmpne16	%f22, %f16, %l5
	.word	0xb5a5cd31	! t1_kref+0x397c:   	fsmuld	%f23, %f17, %f26
	.word	0xa9b58977	! t1_kref+0x3980:   	fpmerge	%f22, %f23, %f20
	.word	0xe56e2010	! t1_kref+0x3984:   	prefetch	%i0 + 0x10, 18
	.word	0xa5a00535	! t1_kref+0x3988:   	fsqrts	%f21, %f18
	.word	0xb9a018dc	! t1_kref+0x398c:   	fdtos	%f28, %f28
	.word	0x3c800002	! t1_kref+0x3990:   	bpos,a	_kref+0x3998
	.word	0xd4364000	! t1_kref+0x3994:   	sth	%o2, [%i1]
	.word	0xa9400000	! t1_kref+0x3998:   	mov	%y, %l4
	.word	0x90fae39b	! t1_kref+0x399c:   	sdivcc	%o3, 0x39b, %o0
	.word	0x3b800001	! t1_kref+0x39a0:   	fble,a	_kref+0x39a4
	.word	0xaadac00c	! t1_kref+0x39a4:   	smulcc	%o3, %o4, %l5
	.word	0xd230a01e	! t1_kref+0x39a8:   	sth	%o1, [%g2 + 0x1e]
	.word	0x81ad8ab4	! t1_kref+0x39ac:   	fcmpes	%fcc0, %f22, %f20
	.word	0xa9b686d2	! t1_kref+0x39b0:   	fmul8sux16	%f26, %f18, %f20
	.word	0xa42ac00b	! t1_kref+0x39b4:   	andn	%o3, %o3, %l2
	.word	0xe41e6018	! t1_kref+0x39b8:   	ldd	[%i1 + 0x18], %l2
	.word	0x37480008	! t1_kref+0x39bc:   	fbge,a,pt	%fcc0, _kref+0x39dc
	.word	0xef20a004	! t1_kref+0x39c0:   	st	%f23, [%g2 + 4]
	.word	0xb5a01918	! t1_kref+0x39c4:   	fitod	%f24, %f26
	.word	0x30480004	! t1_kref+0x39c8:   	ba,a,pt	%icc, _kref+0x39d8
	.word	0xf706601c	! t1_kref+0x39cc:   	ld	[%i1 + 0x1c], %f27
!	.word	0x2e4d6188	! t1_kref+0x39d0:   	bvs,a,pt	%icc, SYM(t1_subr3)
	   	bvs,a,pt	%icc, SYM(t1_subr3)
	.word	0x9f414000	! t1_kref+0x39d4:   	mov	%pc, %o7
	.word	0xb9a6cd34	! t1_kref+0x39d8:   	fsmuld	%f27, %f20, %f28
	.word	0x90f32d3a	! t1_kref+0x39dc:   	udivcc	%o4, 0xd3a, %o0
	.word	0xe3000018	! t1_kref+0x39e0:   	ld	[%g0 + %i0], %f17
	.word	0xd428a01d	! t1_kref+0x39e4:   	stb	%o2, [%g2 + 0x1d]
	.word	0xa93a6013	! t1_kref+0x39e8:   	sra	%o1, 0x13, %l4
	.word	0xa5a649b4	! t1_kref+0x39ec:   	fdivs	%f25, %f20, %f18
	.word	0x36480005	! t1_kref+0x39f0:   	bge,a,pt	%icc, _kref+0x3a04
	.word	0xb1b68cb5	! t1_kref+0x39f4:   	fandnot2s	%f26, %f21, %f24
	.word	0xd81e2000	! t1_kref+0x39f8:   	ldd	[%i0], %o4
	.word	0xacaa800b	! t1_kref+0x39fc:   	andncc	%o2, %o3, %l6
	.word	0xe848a00e	! t1_kref+0x3a00:   	ldsb	[%g2 + 0xe], %l4
	.word	0xd828a027	! t1_kref+0x3a04:   	stb	%o4, [%g2 + 0x27]
	.word	0x913b0009	! t1_kref+0x3a08:   	sra	%o4, %o1, %o0
	.word	0x29800008	! t1_kref+0x3a0c:   	fbl,a	_kref+0x3a2c
	.word	0xb9a789de	! t1_kref+0x3a10:   	fdivd	%f30, %f30, %f28
	.word	0xd236c018	! t1_kref+0x3a14:   	sth	%o1, [%i3 + %i0]
	.word	0x91b50594	! t1_kref+0x3a18:   	fcmpgt32	%f20, %f20, %o0
	.word	0xf99e7ff8	! t1_kref+0x3a1c:   	ldda	[%i1 - 8]%asi, %f28
	.word	0xee06600c	! t1_kref+0x3a20:   	ld	[%i1 + 0xc], %l7
	.word	0xa72333ae	! t1_kref+0x3a24:   	mulscc	%o4, -0xc52, %l3
	.word	0xadb00c00	! t1_kref+0x3a28:   	fzero	%f22
	.word	0xada488d4	! t1_kref+0x3a2c:   	fsubd	%f18, %f20, %f22
	.word	0xa7b5045a	! t1_kref+0x3a30:   	fcmpne16	%f20, %f26, %l3
	.word	0x91400000	! t1_kref+0x3a34:   	mov	%y, %o0
	.word	0xd630a01c	! t1_kref+0x3a38:   	sth	%o3, [%g2 + 0x1c]
	.word	0xb6103fec	! t1_kref+0x3a3c:   	mov	0xffffffec, %i3
	.word	0x31480001	! t1_kref+0x3a40:   	fba,a,pt	%fcc0, _kref+0x3a44
	.word	0xe41e401d	! t1_kref+0x3a44:   	ldd	[%i1 + %i5], %l2
	.word	0x92d24009	! t1_kref+0x3a48:   	umulcc	%o1, %o1, %o1
	.word	0xd428a01c	! t1_kref+0x3a4c:   	stb	%o2, [%g2 + 0x1c]
	.word	0xd420a03c	! t1_kref+0x3a50:   	st	%o2, [%g2 + 0x3c]
	.word	0x32800003	! t1_kref+0x3a54:   	bne,a	_kref+0x3a60
	.word	0xb5b5891c	! t1_kref+0x3a58:   	faligndata	%f22, %f28, %f26
	.word	0xd820a00c	! t1_kref+0x3a5c:   	st	%o4, [%g2 + 0xc]
	.word	0xa6d2400c	! t1_kref+0x3a60:   	umulcc	%o1, %o4, %l3
	.word	0xa6b325ac	! t1_kref+0x3a64:   	orncc	%o4, 0x5ac, %l3
	.word	0xb1b00c00	! t1_kref+0x3a68:   	fzero	%f24
	call	SYM(t1_subr1)
	.word	0xf99e5000	! t1_kref+0x3a70:   	ldda	[%i1]0x80, %f28
	.word	0xed3e3fe8	! t1_kref+0x3a74:   	std	%f22, [%i0 - 0x18]
	.word	0x31480002	! t1_kref+0x3a78:   	fba,a,pt	%fcc0, _kref+0x3a80
	.word	0xe840a03c	! t1_kref+0x3a7c:   	ldsw	[%g2 + 0x3c], %l4
	.word	0xb5b70ad6	! t1_kref+0x3a80:   	fpsub32	%f28, %f22, %f26
	.word	0xd4364000	! t1_kref+0x3a84:   	sth	%o2, [%i1]
	.word	0xe99e1a1c	! t1_kref+0x3a88:   	ldda	[%i0 + %i4]0xd0, %f20
	.word	0x9002617c	! t1_kref+0x3a8c:   	add	%o1, 0x17c, %o0
	.word	0xaa5ac00c	! t1_kref+0x3a90:   	smul	%o3, %o4, %l5
	.word	0xef270018	! t1_kref+0x3a94:   	st	%f23, [%i4 + %i0]
	.word	0xe9be1a5d	! t1_kref+0x3a98:   	stda	%f20, [%i0 + %i5]0xd2
	.word	0xb9a609d6	! t1_kref+0x3a9c:   	fdivd	%f24, %f22, %f28
	.word	0x922ac00b	! t1_kref+0x3aa0:   	andn	%o3, %o3, %o1
	.word	0xd430a024	! t1_kref+0x3aa4:   	sth	%o2, [%g2 + 0x24]
	.word	0xd0000019	! t1_kref+0x3aa8:   	ld	[%g0 + %i1], %o0
	.word	0x8143e044	! t1_kref+0x3aac:   	membar	0x44
	.word	0xaa02800b	! t1_kref+0x3ab0:   	add	%o2, %o3, %l5
	.word	0xebee501d	! t1_kref+0x3ab4:   	prefetcha	%i1 + %i5, 21
	.word	0x24480007	! t1_kref+0x3ab8:   	ble,a,pt	%icc, _kref+0x3ad4
	.word	0xa1b70d96	! t1_kref+0x3abc:   	fxor	%f28, %f22, %f16
	.word	0xf207bfe0	! t1_kref+0x3ac0:   	ld	[%fp - 0x20], %i1
	.word	0xbda60937	! t1_kref+0x3ac4:   	fmuls	%f24, %f23, %f30
	.word	0xa6aa400c	! t1_kref+0x3ac8:   	andncc	%o1, %o4, %l3
	.word	0xfd00a00c	! t1_kref+0x3acc:   	ld	[%g2 + 0xc], %f30
	.word	0xb3a449b1	! t1_kref+0x3ad0:   	fdivs	%f17, %f17, %f25
	.word	0x81ad8a5a	! t1_kref+0x3ad4:   	fcmpd	%fcc0, %f22, %f26
	.word	0x93418000	! t1_kref+0x3ad8:   	mov	%fprs, %o1
	.word	0xa60b2856	! t1_kref+0x3adc:   	and	%o4, 0x856, %l3
	.word	0xfd00a02c	! t1_kref+0x3ae0:   	ld	[%g2 + 0x2c], %f30
	.word	0xae63000b	! t1_kref+0x3ae4:   	subc	%o4, %o3, %l7
	.word	0xa1b78e80	! t1_kref+0x3ae8:   	fsrc1	%f30, %f16
	.word	0xae3ae93d	! t1_kref+0x3aec:   	xnor	%o3, 0x93d, %l7
	.word	0xa9b2832b	! t1_kref+0x3af0:   	bmask	%o2, %o3, %l4
	.word	0x902ac00c	! t1_kref+0x3af4:   	andn	%o3, %o4, %o0
	.word	0xe920a004	! t1_kref+0x3af8:   	st	%f20, [%g2 + 4]
	.word	0xec48a006	! t1_kref+0x3afc:   	ldsb	[%g2 + 6], %l6
	.word	0xa7418000	! t1_kref+0x3b00:   	mov	%fprs, %l3
	.word	0xf007bfe0	! t1_kref+0x3b04:   	ld	[%fp - 0x20], %i0
	.word	0x91b2406c	! t1_kref+0x3b08:   	edge8ln	%o1, %o4, %o0
	.word	0xadb6cf77	! t1_kref+0x3b0c:   	fornot1s	%f27, %f23, %f22
	.word	0xb1a609d0	! t1_kref+0x3b10:   	fdivd	%f24, %f16, %f24
	.word	0xaafac00c	! t1_kref+0x3b14:   	sdivcc	%o3, %o4, %l5
	.word	0x9112be37	! t1_kref+0x3b18:   	taddcctv	%o2, -0x1c9, %o0
	.word	0xc06e3ff6	! t1_kref+0x3b1c:   	ldstub	[%i0 - 0xa], %g0
	.word	0x9de3bfa0	! t1_kref+0x3b20:   	save	%sp, -0x60, %sp
	.word	0xabef62e9	! t1_kref+0x3b24:   	restore	%i5, 0x2e9, %l5
	.word	0xee00a00c	! t1_kref+0x3b28:   	ld	[%g2 + 0xc], %l7
	.word	0xf100a02c	! t1_kref+0x3b2c:   	ld	[%g2 + 0x2c], %f24
	.word	0xab400000	! t1_kref+0x3b30:   	mov	%y, %l5
	.word	0xe168a04f	! t1_kref+0x3b34:   	prefetch	%g2 + 0x4f, 16
	.word	0xaefb37a3	! t1_kref+0x3b38:   	sdivcc	%o4, -0x85d, %l7
	.word	0xd230a02e	! t1_kref+0x3b3c:   	sth	%o1, [%g2 + 0x2e]
	.word	0xf7263ffc	! t1_kref+0x3b40:   	st	%f27, [%i0 - 4]
	.word	0x90aa800a	! t1_kref+0x3b44:   	andncc	%o2, %o2, %o0
	.word	0xaa1a400b	! t1_kref+0x3b48:   	xor	%o1, %o3, %l5
	.word	0xb1a409d2	! t1_kref+0x3b4c:   	fdivd	%f16, %f18, %f24
	.word	0xa5b78cbc	! t1_kref+0x3b50:   	fandnot2s	%f30, %f28, %f18
	.word	0xad3aa015	! t1_kref+0x3b54:   	sra	%o2, 0x15, %l6
	.word	0xafa48937	! t1_kref+0x3b58:   	fmuls	%f18, %f23, %f23
	.word	0xa83b000b	! t1_kref+0x3b5c:   	xnor	%o4, %o3, %l4
	.word	0x86102004	! t1_kref+0x3b60:   	mov	0x4, %g3
	.word	0x32800000	! t1_kref+0x3b64:   	bne,a	_kref+0x3b64
	.word	0x86a0e001	! t1_kref+0x3b68:   	subcc	%g3, 1, %g3
	.word	0xa3a4c938	! t1_kref+0x3b6c:   	fmuls	%f19, %f24, %f17
	.word	0x9002800c	! t1_kref+0x3b70:   	add	%o2, %o4, %o0
	.word	0x3b800006	! t1_kref+0x3b74:   	fble,a	_kref+0x3b8c
	.word	0xa45a7a27	! t1_kref+0x3b78:   	smul	%o1, -0x5d9, %l2
	.word	0x9340c000	! t1_kref+0x3b7c:   	mov	%asi, %o1
	.word	0xa4d33460	! t1_kref+0x3b80:   	umulcc	%o4, -0xba0, %l2
	.word	0x81af4abb	! t1_kref+0x3b84:   	fcmpes	%fcc0, %f29, %f27
	.word	0xf51fbf10	! t1_kref+0x3b88:   	ldd	[%fp - 0xf0], %f26
	.word	0x909ac00b	! t1_kref+0x3b8c:   	xorcc	%o3, %o3, %o0
	.word	0x27800001	! t1_kref+0x3b90:   	fbul,a	_kref+0x3b94
	.word	0xaada800a	! t1_kref+0x3b94:   	smulcc	%o2, %o2, %l5
	.word	0xa5a44d36	! t1_kref+0x3b98:   	fsmuld	%f17, %f22, %f18
	.word	0xd2063fe4	! t1_kref+0x3b9c:   	ld	[%i0 - 0x1c], %o1
	.word	0x2b800006	! t1_kref+0x3ba0:   	fbug,a	_kref+0x3bb8
	.word	0x90d2c00c	! t1_kref+0x3ba4:   	umulcc	%o3, %o4, %o0
	.word	0xa1a0191e	! t1_kref+0x3ba8:   	fitod	%f30, %f16
	.word	0xfda01019	! t1_kref+0x3bac:   	sta	%f30, [%g0 + %i1]0x80
	.word	0xabb58e76	! t1_kref+0x3bb0:   	fxnors	%f22, %f22, %f21
	.word	0xd41e401d	! t1_kref+0x3bb4:   	ldd	[%i1 + %i5], %o2
	.word	0xbda7093e	! t1_kref+0x3bb8:   	fmuls	%f28, %f30, %f30
	.word	0xd630a026	! t1_kref+0x3bbc:   	sth	%o3, [%g2 + 0x26]
	.word	0xa8c33d6f	! t1_kref+0x3bc0:   	addccc	%o4, -0x291, %l4
	.word	0xb9a60856	! t1_kref+0x3bc4:   	faddd	%f24, %f22, %f28
	.word	0xae928009	! t1_kref+0x3bc8:   	orcc	%o2, %o1, %l7
	.word	0xc36e0009	! t1_kref+0x3bcc:   	prefetch	%i0 + %o1, 1
	.word	0x3b800004	! t1_kref+0x3bd0:   	fble,a	_kref+0x3be0
	.word	0xf3063fec	! t1_kref+0x3bd4:   	ld	[%i0 - 0x14], %f25
	.word	0xd06e4000	! t1_kref+0x3bd8:   	ldstub	[%i1], %o0
	.word	0xa63b2b09	! t1_kref+0x3bdc:   	xnor	%o4, 0xb09, %l3
	.word	0xb5b58e80	! t1_kref+0x3be0:   	fsrc1	%f22, %f26
	.word	0xa782400b	! t1_kref+0x3be4:   	wr	%o1, %o3, %gsr
	.word	0x293fdb95	! t1_kref+0x3be8:   	sethi	%hi(0xff6e5400), %l4
	sethi	%hi(2f), %o7
	.word	0xe40be00c	! t1_kref+0x3bf0:   	ldub	[%o7 + 0xc], %l2
	.word	0xa41ca00c	! t1_kref+0x3bf4:   	xor	%l2, 0xc, %l2
	.word	0xe42be00c	! t1_kref+0x3bf8:   	stb	%l2, [%o7 + 0xc]
	.word	0x81dbe00c	! t1_kref+0x3bfc:   	flush	%o7 + 0xc
	.word	0xe88e9018	! t1_kref+0x3c00:   	lduba	[%i2 + %i0]0x80, %l4
	.word	0xa3a0189d	! t1_kref+0x3c04:   	fitos	%f29, %f17
	.word	0xfd20a01c	! t1_kref+0x3c08:   	st	%f30, [%g2 + 0x1c]
2:	.word	0xdbf6100a	! t1_kref+0x3c0c:   	casxa	[%i0]0x80, %o2, %o5
	.word	0xd03e6018	! t1_kref+0x3c10:   	std	%o0, [%i1 + 0x18]
	.word	0xb9a68d36	! t1_kref+0x3c14:   	fsmuld	%f26, %f22, %f28
	.word	0xaab3000a	! t1_kref+0x3c18:   	orncc	%o4, %o2, %l5
	.word	0xa3a01a5c	! t1_kref+0x3c1c:   	fdtoi	%f28, %f17
	.word	0xa4ab23c5	! t1_kref+0x3c20:   	andncc	%o4, 0x3c5, %l2
	.word	0x93400000	! t1_kref+0x3c24:   	mov	%y, %o1
	.word	0xa7b2c200	! t1_kref+0x3c28:   	array8	%o3, %g0, %l3
	.word	0xf5ee101b	! t1_kref+0x3c2c:   	prefetcha	%i0 + %i3, 26
	.word	0xa6b2c009	! t1_kref+0x3c30:   	orncc	%o3, %o1, %l3
	.word	0xa3a6c9b5	! t1_kref+0x3c34:   	fdivs	%f27, %f21, %f17
	.word	0x8182c000	! t1_kref+0x3c38:   	wr	%o3, %g0, %y
	.word	0x86102002	! t1_kref+0x3c3c:   	mov	0x2, %g3
	.word	0x32800000	! t1_kref+0x3c40:   	bne,a	_kref+0x3c40
	.word	0x86a0e001	! t1_kref+0x3c44:   	subcc	%g3, 1, %g3
	.word	0x91b6055a	! t1_kref+0x3c48:   	fcmpeq16	%f24, %f26, %o0
	.word	0xa7b68552	! t1_kref+0x3c4c:   	fcmpeq16	%f26, %f18, %l3
	.word	0xef6e7fe8	! t1_kref+0x3c50:   	prefetch	%i1 - 0x18, 23
	.word	0x81830000	! t1_kref+0x3c54:   	wr	%o4, %g0, %y
	.word	0xa5a01914	! t1_kref+0x3c58:   	fitod	%f20, %f18
	.word	0x2f800006	! t1_kref+0x3c5c:   	fbu,a	_kref+0x3c74
	.word	0xa5b58496	! t1_kref+0x3c60:   	fcmple32	%f22, %f22, %l2
	.word	0xa1a408d2	! t1_kref+0x3c64:   	fsubd	%f16, %f18, %f16
	.word	0xa62b313f	! t1_kref+0x3c68:   	andn	%o4, -0xec1, %l3
	.word	0x8143c000	! t1_kref+0x3c6c:   	stbar
	.word	0xbda70937	! t1_kref+0x3c70:   	fmuls	%f28, %f23, %f30
	.word	0x9de3bfa0	! t1_kref+0x3c74:   	save	%sp, -0x60, %sp
	.word	0xabee791d	! t1_kref+0x3c78:   	restore	%i1, -0x6e3, %l5
	.word	0xd228a01d	! t1_kref+0x3c7c:   	stb	%o1, [%g2 + 0x1d]
	.word	0x29480006	! t1_kref+0x3c80:   	fbl,a,pt	%fcc0, _kref+0x3c98
	.word	0xb9b60752	! t1_kref+0x3c84:   	fpack32	%f24, %f18, %f28
	.word	0x81ac8a5a	! t1_kref+0x3c88:   	fcmpd	%fcc0, %f18, %f26
	.word	0xa8b27448	! t1_kref+0x3c8c:   	orncc	%o1, -0xbb8, %l4
	.word	0xbdb78977	! t1_kref+0x3c90:   	fpmerge	%f30, %f23, %f30
	.word	0xa5b4ca73	! t1_kref+0x3c94:   	fpadd32s	%f19, %f19, %f18
	.word	0xada5c832	! t1_kref+0x3c98:   	fadds	%f23, %f18, %f22
	.word	0xa632b506	! t1_kref+0x3c9c:   	orn	%o2, -0xafa, %l3
	.word	0x907a800b	! t1_kref+0x3ca0:   	sdiv	%o2, %o3, %o0
	.word	0xa544c000	! t1_kref+0x3ca4:   	mov	%gsr, %l2
	.word	0x001fffff	! t1_kref+0x3ca8:   	illtrap	0x1fffff
	.word	0x93b5859c	! t1_kref+0x3cac:   	fcmpgt32	%f22, %f28, %o1
	.word	0x3f480003	! t1_kref+0x3cb0:   	fbo,a,pt	%fcc0, _kref+0x3cbc
	.word	0xec00a024	! t1_kref+0x3cb4:   	ld	[%g2 + 0x24], %l6
	.word	0xf5264000	! t1_kref+0x3cb8:   	st	%f26, [%i1]
	.word	0xa5a50856	! t1_kref+0x3cbc:   	faddd	%f20, %f22, %f18
	.word	0x81dec009	! t1_kref+0x3cc0:   	flush	%i3 + %o1
	.word	0xaad2fe98	! t1_kref+0x3cc4:   	umulcc	%o3, -0x168, %l5
	call	1f
	.empty
	.word	0x81dbb9bc	! t1_kref+0x3ccc:   	flush	%sp - 0x644
	.word	0x90b2c00a	! t1_kref+0x3cd0:   	orncc	%o3, %o2, %o0
	.word	0xada54d36	! t1_kref+0x3cd4:   	fsmuld	%f21, %f22, %f22
	.word	0xa5a0191c	! t1_kref+0x3cd8:   	fitod	%f28, %f18
	.word	0x9232efec	! t1_kref+0x3cdc:   	orn	%o3, 0xfec, %o1
1:	.word	0xd620a034	! t1_kref+0x3ce0:   	st	%o3, [%g2 + 0x34]
	.word	0xa5b2400b	! t1_kref+0x3ce4:   	edge8	%o1, %o3, %l2
	.word	0x9333000a	! t1_kref+0x3ce8:   	srl	%o4, %o2, %o1
	.word	0x86102004	! t1_kref+0x3cec:   	mov	0x4, %g3
	.word	0x32800000	! t1_kref+0x3cf0:   	bne,a	_kref+0x3cf0
	.word	0x86a0e001	! t1_kref+0x3cf4:   	subcc	%g3, 1, %g3
	.word	0xaba6893d	! t1_kref+0x3cf8:   	fmuls	%f26, %f29, %f21
	.word	0x900ab127	! t1_kref+0x3cfc:   	and	%o2, -0xed9, %o0
	.word	0xd430a03e	! t1_kref+0x3d00:   	sth	%o2, [%g2 + 0x3e]
	.word	0x86102016	! t1_kref+0x3d04:   	mov	0x16, %g3
	.word	0x86a0e001	! t1_kref+0x3d08:   	subcc	%g3, 1, %g3
	.word	0x22800014	! t1_kref+0x3d0c:   	be,a	_kref+0x3d5c
	.word	0xec8e501a	! t1_kref+0x3d10:   	lduba	[%i1 + %i2]0x80, %l6
	.word	0xf726601c	! t1_kref+0x3d14:   	st	%f27, [%i1 + 0x1c]
	.word	0xa5a01056	! t1_kref+0x3d18:   	fdtox	%f22, %f18
	.word	0xf520a024	! t1_kref+0x3d1c:   	st	%f26, [%g2 + 0x24]
	.word	0xb1a0189d	! t1_kref+0x3d20:   	fitos	%f29, %f24
	.word	0xb1a4885a	! t1_kref+0x3d24:   	faddd	%f18, %f26, %f24
	.word	0xf1267fec	! t1_kref+0x3d28:   	st	%f24, [%i1 - 0x14]
	.word	0xd628a03e	! t1_kref+0x3d2c:   	stb	%o3, [%g2 + 0x3e]
	.word	0x93b280a9	! t1_kref+0x3d30:   	edge16n	%o2, %o1, %o1
	.word	0x81ad8a39	! t1_kref+0x3d34:   	fcmps	%fcc0, %f22, %f25
	.word	0xada0055c	! t1_kref+0x3d38:   	fsqrtd	%f28, %f22
	.word	0xadb30169	! t1_kref+0x3d3c:   	edge32ln	%o4, %o1, %l6
	.word	0xb1b70f94	! t1_kref+0x3d40:   	for	%f28, %f20, %f24
	.word	0x2cbffff1	! t1_kref+0x3d44:   	bneg,a	_kref+0x3d08
	.word	0xe920a01c	! t1_kref+0x3d48:   	st	%f20, [%g2 + 0x1c]
	.word	0x90d331db	! t1_kref+0x3d4c:   	umulcc	%o4, -0xe25, %o0
	.word	0xbbb68e74	! t1_kref+0x3d50:   	fxnors	%f26, %f20, %f29
	.word	0xaa02f024	! t1_kref+0x3d54:   	add	%o3, -0xfdc, %l5
	.word	0xa5a0005c	! t1_kref+0x3d58:   	fmovd	%f28, %f18
	.word	0xb3b0077c	! t1_kref+0x3d5c:   	fpack16	%f28, %f25
	.word	0xb5b50ef9	! t1_kref+0x3d60:   	fornot2s	%f20, %f25, %f26
	.word	0x27480006	! t1_kref+0x3d64:   	fbul,a,pt	%fcc0, _kref+0x3d7c
	.word	0xe1be1889	! t1_kref+0x3d68:   	stda	%f16, [%i0 + %o1]0xc4
	.word	0xacd28009	! t1_kref+0x3d6c:   	umulcc	%o2, %o1, %l6
	.word	0x81deb808	! t1_kref+0x3d70:   	flush	%i2 - 0x7f8
	.word	0x2517d384	! t1_kref+0x3d74:   	sethi	%hi(0x5f4e1000), %l2
	.word	0xaaaac00b	! t1_kref+0x3d78:   	andncc	%o3, %o3, %l5
	.word	0xbda509d4	! t1_kref+0x3d7c:   	fdivd	%f20, %f20, %f30
	.word	0xff6e7fe8	! t1_kref+0x3d80:   	prefetch	%i1 - 0x18, 31
	.word	0xaf2aa01e	! t1_kref+0x3d84:   	sll	%o2, 0x1e, %l7
	.word	0x2f480003	! t1_kref+0x3d88:   	fbu,a,pt	%fcc0, _kref+0x3d94
	.word	0xa7a60934	! t1_kref+0x3d8c:   	fmuls	%f24, %f20, %f19
	.word	0xbba58834	! t1_kref+0x3d90:   	fadds	%f22, %f20, %f29
	.word	0xec38001d	! t1_kref+0x3d94:   	std	%l6, [%g0 + %i5]
	.word	0xad3b000b	! t1_kref+0x3d98:   	sra	%o4, %o3, %l6
	.word	0x22800004	! t1_kref+0x3d9c:   	be,a	_kref+0x3dac
	.word	0x90b2c00c	! t1_kref+0x3da0:   	orncc	%o3, %o4, %o0
	.word	0xe5e6100c	! t1_kref+0x3da4:   	casa	[%i0]0x80, %o4, %l2
	.word	0xa823304b	! t1_kref+0x3da8:   	sub	%o4, -0xfb5, %l4
	.word	0x27480007	! t1_kref+0x3dac:   	fbul,a,pt	%fcc0, _kref+0x3dc8
	.word	0xb9a48958	! t1_kref+0x3db0:   	fmuld	%f18, %f24, %f28
	.word	0xaef32e34	! t1_kref+0x3db4:   	udivcc	%o4, 0xe34, %l7
	.word	0xb9b50dbd	! t1_kref+0x3db8:   	fxors	%f20, %f29, %f28
	.word	0x93400000	! t1_kref+0x3dbc:   	mov	%y, %o1
	.word	0xa9400000	! t1_kref+0x3dc0:   	mov	%y, %l4
	.word	0x92026482	! t1_kref+0x3dc4:   	add	%o1, 0x482, %o1
	.word	0xd228a016	! t1_kref+0x3dc8:   	stb	%o1, [%g2 + 0x16]
	.word	0xe91f4018	! t1_kref+0x3dcc:   	ldd	[%i5 + %i0], %f20
	.word	0xf7000018	! t1_kref+0x3dd0:   	ld	[%g0 + %i0], %f27
	.word	0x81dd800f	! t1_kref+0x3dd4:   	flush	%l6 + %o7
	.word	0xac326143	! t1_kref+0x3dd8:   	orn	%o1, 0x143, %l6
	.word	0xb5a00039	! t1_kref+0x3ddc:   	fmovs	%f25, %f26
	.word	0xadb7891e	! t1_kref+0x3de0:   	faligndata	%f30, %f30, %f22
	.word	0xaa0b000a	! t1_kref+0x3de4:   	and	%o4, %o2, %l5
	.word	0xd0680019	! t1_kref+0x3de8:   	ldstub	[%g0 + %i1], %o0
	.word	0xd8180019	! t1_kref+0x3dec:   	ldd	[%g0 + %i1], %o4
	.word	0xb9a01912	! t1_kref+0x3df0:   	fitod	%f18, %f28
	.word	0xada01893	! t1_kref+0x3df4:   	fitos	%f19, %f22
	.word	0x81af0a56	! t1_kref+0x3df8:   	fcmpd	%fcc0, %f28, %f22
	.word	0x878020e0	! t1_kref+0x3dfc:   	mov	0xe0, %asi
	.word	0xc9ee500b	! t1_kref+0x3e00:   	prefetcha	%i1 + %o3, 4
	.word	0xa3a018dc	! t1_kref+0x3e04:   	fdtos	%f28, %f17
	.word	0x81af8a37	! t1_kref+0x3e08:   	fcmps	%fcc0, %f30, %f23
	.word	0x9fc10000	! t1_kref+0x3e0c:   	call	%g4
	.word	0xb1a01a33	! t1_kref+0x3e10:   	fstoi	%f19, %f24
	.word	0xaa7a4009	! t1_kref+0x3e14:   	sdiv	%o1, %o1, %l5
	.word	0x001fffff	! t1_kref+0x3e18:   	illtrap	0x1fffff
	.word	0xb5a01919	! t1_kref+0x3e1c:   	fitod	%f25, %f26
	.word	0x81af0abe	! t1_kref+0x3e20:   	fcmpes	%fcc0, %f28, %f30
	.word	0x81af0a54	! t1_kref+0x3e24:   	fcmpd	%fcc0, %f28, %f20
	.word	0xbdb009b7	! t1_kref+0x3e28:   	fexpand	%f23, %f30
	.word	0xa9b50992	! t1_kref+0x3e2c:   	bshuffle	%f20, %f18, %f20
	.word	0xa5a44d38	! t1_kref+0x3e30:   	fsmuld	%f17, %f24, %f18
	.word	0x81af8a5e	! t1_kref+0x3e34:   	fcmpd	%fcc0, %f30, %f30
	.word	0xb9a0191e	! t1_kref+0x3e38:   	fitod	%f30, %f28
	call	SYM(t1_subr3)
	.word	0xf5263ff0	! t1_kref+0x3e40:   	st	%f26, [%i0 - 0x10]
	.word	0xeece5000	! t1_kref+0x3e44:   	ldsba	[%i1]0x80, %l7
	.word	0xac3aa2b4	! t1_kref+0x3e48:   	xnor	%o2, 0x2b4, %l6
	.word	0x9fc10000	! t1_kref+0x3e4c:   	call	%g4
	.word	0x81dd401c	! t1_kref+0x3e50:   	flush	%l5 + %i4
	.word	0x902a800b	! t1_kref+0x3e54:   	andn	%o2, %o3, %o0
	.word	0xd04e600c	! t1_kref+0x3e58:   	ldsb	[%i1 + 0xc], %o0
	.word	0xecd65000	! t1_kref+0x3e5c:   	ldsha	[%i1]0x80, %l6
	.word	0xae1af63a	! t1_kref+0x3e60:   	xor	%o3, -0x9c6, %l7
	.word	0x81acca39	! t1_kref+0x3e64:   	fcmps	%fcc0, %f19, %f25
	.word	0xaaab27c7	! t1_kref+0x3e68:   	andncc	%o4, 0x7c7, %l5
	.word	0xa8026c49	! t1_kref+0x3e6c:   	add	%o1, 0xc49, %l4
	.word	0x31800003	! t1_kref+0x3e70:   	fba,a	_kref+0x3e7c
	.word	0xa43a79e7	! t1_kref+0x3e74:   	xnor	%o1, -0x619, %l2
	.word	0xb9a54d36	! t1_kref+0x3e78:   	fsmuld	%f21, %f22, %f28
	.word	0xd830a03c	! t1_kref+0x3e7c:   	sth	%o4, [%g2 + 0x3c]
	.word	0xa892800a	! t1_kref+0x3e80:   	orcc	%o2, %o2, %l4
	.word	0xa62334e0	! t1_kref+0x3e84:   	sub	%o4, -0xb20, %l3
	.word	0xa9a68d3c	! t1_kref+0x3e88:   	fsmuld	%f26, %f28, %f20
	.word	0xea060000	! t1_kref+0x3e8c:   	ld	[%i0], %l5
	.word	0xd0d6101b	! t1_kref+0x3e90:   	ldsha	[%i0 + %i3]0x80, %o0
	.word	0x903a400b	! t1_kref+0x3e94:   	xnor	%o1, %o3, %o0
	.word	0xaa3af558	! t1_kref+0x3e98:   	xnor	%o3, -0xaa8, %l5
	.word	0x20480001	! t1_kref+0x3e9c:   	bn,a,pt	%icc, _kref+0x3ea0
	.word	0xa8933d27	! t1_kref+0x3ea0:   	orcc	%o4, -0x2d9, %l4
	.word	0x81ae8a35	! t1_kref+0x3ea4:   	fcmps	%fcc0, %f26, %f21
	.word	0xab2a601d	! t1_kref+0x3ea8:   	sll	%o1, 0x1d, %l5
	.word	0xa9b40994	! t1_kref+0x3eac:   	bshuffle	%f16, %f20, %f20
	.word	0x38480007	! t1_kref+0x3eb0:   	bgu,a,pt	%icc, _kref+0x3ecc
	.word	0x91b3000a	! t1_kref+0x3eb4:   	edge8	%o4, %o2, %o0
	.word	0x909278bd	! t1_kref+0x3eb8:   	orcc	%o1, -0x743, %o0
	.word	0xbdb78c52	! t1_kref+0x3ebc:   	fnor	%f30, %f18, %f30
	.word	0xd420a034	! t1_kref+0x3ec0:   	st	%o2, [%g2 + 0x34]
	.word	0xa82329e1	! t1_kref+0x3ec4:   	sub	%o4, 0x9e1, %l4
	.word	0xb3a01896	! t1_kref+0x3ec8:   	fitos	%f22, %f25
	.word	0xa9b60912	! t1_kref+0x3ecc:   	faligndata	%f24, %f18, %f20
	.word	0xadb3010c	! t1_kref+0x3ed0:   	edge32	%o4, %o4, %l6
	.word	0x9de3bfa0	! t1_kref+0x3ed4:   	save	%sp, -0x60, %sp
	.word	0xafee3575	! t1_kref+0x3ed8:   	restore	%i0, -0xa8b, %l7
	.word	0xd630a026	! t1_kref+0x3edc:   	sth	%o3, [%g2 + 0x26]
	.word	0x92fb3955	! t1_kref+0x3ee0:   	sdivcc	%o4, -0x6ab, %o1
	.word	0xa4324009	! t1_kref+0x3ee4:   	orn	%o1, %o1, %l2
	.word	0x30480006	! t1_kref+0x3ee8:   	ba,a,pt	%icc, _kref+0x3f00
	.word	0xc16e4009	! t1_kref+0x3eec:   	prefetch	%i1 + %o1, 0
	.word	0xb9b00f38	! t1_kref+0x3ef0:   	fsrc2s	%f24, %f28
	.word	0xa5a0189c	! t1_kref+0x3ef4:   	fitos	%f28, %f18
	.word	0xa3a68938	! t1_kref+0x3ef8:   	fmuls	%f26, %f24, %f17
	.word	0xb9a50d33	! t1_kref+0x3efc:   	fsmuld	%f20, %f19, %f28
	.word	0xafa01893	! t1_kref+0x3f00:   	fitos	%f19, %f23
	.word	0x8143e040	! t1_kref+0x3f04:   	membar	0x40
	.word	0xa9a58d3c	! t1_kref+0x3f08:   	fsmuld	%f22, %f28, %f20
	.word	0xc76e400c	! t1_kref+0x3f0c:   	prefetch	%i1 + %o4, 3
	.word	0xb5a589de	! t1_kref+0x3f10:   	fdivd	%f22, %f30, %f26
	.word	0xacb2afec	! t1_kref+0x3f14:   	orncc	%o2, 0xfec, %l6
	.word	0xd43e4000	! t1_kref+0x3f18:   	std	%o2, [%i1]
	.word	0xaba01897	! t1_kref+0x3f1c:   	fitos	%f23, %f21
	.word	0xac3b000b	! t1_kref+0x3f20:   	xnor	%o4, %o3, %l6
	.word	0xb9a609da	! t1_kref+0x3f24:   	fdivd	%f24, %f26, %f28
	.word	0x9223000a	! t1_kref+0x3f28:   	sub	%o4, %o2, %o1
	.word	0xb5a01a35	! t1_kref+0x3f2c:   	fstoi	%f21, %f26
	.word	0xa5b60cb5	! t1_kref+0x3f30:   	fandnot2s	%f24, %f21, %f18
	.word	0x86102017	! t1_kref+0x3f34:   	mov	0x17, %g3
	.word	0x86a0e001	! t1_kref+0x3f38:   	subcc	%g3, 1, %g3
	.word	0x2280000c	! t1_kref+0x3f3c:   	be,a	_kref+0x3f6c
	.word	0xa9a00554	! t1_kref+0x3f40:   	fsqrtd	%f20, %f20
	.word	0xa9b58598	! t1_kref+0x3f44:   	fcmpgt32	%f22, %f24, %l4
	.word	0xa882ff1a	! t1_kref+0x3f48:   	addcc	%o3, -0xe6, %l4
	.word	0x3c480005	! t1_kref+0x3f4c:   	bpos,a,pt	%icc, _kref+0x3f60
	.word	0xf99e5a1b	! t1_kref+0x3f50:   	ldda	[%i1 + %i3]0xd0, %f28
	.word	0xf1ee101b	! t1_kref+0x3f54:   	prefetcha	%i0 + %i3, 24
	call	SYM(t1_subr3)
	.word	0xa65b000c	! t1_kref+0x3f5c:   	smul	%o4, %o4, %l3
	.word	0x9fc00004	! t1_kref+0x3f60:   	call	%g0 + %g4
	.word	0xee6e8018	! t1_kref+0x3f64:   	ldstub	[%i2 + %i0], %l7
	.word	0xa5a0055c	! t1_kref+0x3f68:   	fsqrtd	%f28, %f18
	.word	0x35480002	! t1_kref+0x3f6c:   	fbue,a,pt	%fcc0, _kref+0x3f74
	.word	0xd0164000	! t1_kref+0x3f70:   	lduh	[%i1], %o0
	.word	0xad1af724	! t1_kref+0x3f74:   	tsubcctv	%o3, -0x8dc, %l6
	.word	0xea00a02c	! t1_kref+0x3f78:   	ld	[%g2 + 0x2c], %l5
	.word	0xaa1275ad	! t1_kref+0x3f7c:   	or	%o1, -0xa53, %l5
	.word	0xa9b00c00	! t1_kref+0x3f80:   	fzero	%f20
	.word	0xe320a02c	! t1_kref+0x3f84:   	st	%f17, [%g2 + 0x2c]
	.word	0x81af0ab2	! t1_kref+0x3f88:   	fcmpes	%fcc0, %f28, %f18
	.word	0xada00558	! t1_kref+0x3f8c:   	fsqrtd	%f24, %f22
	.word	0xabb00c20	! t1_kref+0x3f90:   	fzeros	%f21
	.word	0xd62e2019	! t1_kref+0x3f94:   	stb	%o3, [%i0 + 0x19]
	.word	0xd82e001a	! t1_kref+0x3f98:   	stb	%o4, [%i0 + %i2]
	.word	0xa6ab304c	! t1_kref+0x3f9c:   	andncc	%o4, -0xfb4, %l3
	.word	0xa4ab000c	! t1_kref+0x3fa0:   	andncc	%o4, %o4, %l2
	.word	0xa7a00032	! t1_kref+0x3fa4:   	fmovs	%f18, %f19
	.word	0x81d90004	! t1_kref+0x3fa8:   	flush	%g4 + %g4
	.word	0xa872b007	! t1_kref+0x3fac:   	udiv	%o2, -0xff9, %l4
	.word	0xe3b8a0c0	! t1_kref+0x3fb0:   	stda	%f48, [%g2 + 0xc0]%asi
	.word	0xa4f2b44f	! t1_kref+0x3fb4:   	udivcc	%o2, -0xbb1, %l2
	.word	0xb5b00f35	! t1_kref+0x3fb8:   	fsrc2s	%f21, %f26
	.word	0xd836001b	! t1_kref+0x3fbc:   	sth	%o4, [%i0 + %i3]
	.word	0xb1a50858	! t1_kref+0x3fc0:   	faddd	%f20, %f24, %f24
	.word	0xaeaa800c	! t1_kref+0x3fc4:   	andncc	%o2, %o4, %l7
	.word	0x22480008	! t1_kref+0x3fc8:   	be,a,pt	%icc, _kref+0x3fe8
	.word	0xa5a0193e	! t1_kref+0x3fcc:   	fstod	%f30, %f18
	.word	0x92bb000b	! t1_kref+0x3fd0:   	xnorcc	%o4, %o3, %o1
	.word	0xafa549b3	! t1_kref+0x3fd4:   	fdivs	%f21, %f19, %f23
	.word	0xa9a01914	! t1_kref+0x3fd8:   	fitod	%f20, %f20
	.word	0xb5a409dc	! t1_kref+0x3fdc:   	fdivd	%f16, %f28, %f26
	.word	0xe56e3ff8	! t1_kref+0x3fe0:   	prefetch	%i0 - 8, 18
	.word	0xaac2b8eb	! t1_kref+0x3fe4:   	addccc	%o2, -0x715, %l5
	.word	0xdbf6100a	! t1_kref+0x3fe8:   	casxa	[%i0]0x80, %o2, %o5
	.word	0xa9a4cd32	! t1_kref+0x3fec:   	fsmuld	%f19, %f18, %f20
	.word	0xa61aa1d6	! t1_kref+0x3ff0:   	xor	%o2, 0x1d6, %l3
	.word	0x2c480006	! t1_kref+0x3ff4:   	bneg,a,pt	%icc, _kref+0x400c
	.word	0xc768a10a	! t1_kref+0x3ff8:   	prefetch	%g2 + 0x10a, 3
	.word	0xa62ac00c	! t1_kref+0x3ffc:   	andn	%o3, %o4, %l3
	.word	0xa9a00137	! t1_kref+0x4000:   	fabss	%f23, %f20
	.word	0x90d2800c	! t1_kref+0x4004:   	umulcc	%o2, %o4, %o0
	.word	0xb9a60854	! t1_kref+0x4008:   	faddd	%f24, %f20, %f28
	.word	0xa9a749b1	! t1_kref+0x400c:   	fdivs	%f29, %f17, %f20
	.word	0xf1263fec	! t1_kref+0x4010:   	st	%f24, [%i0 - 0x14]
	.word	0x9de3bfa0	! t1_kref+0x4014:   	save	%sp, -0x60, %sp
	.word	0xadef4000	! t1_kref+0x4018:   	restore	%i5, %g0, %l6
	.word	0xd230a00c	! t1_kref+0x401c:   	sth	%o1, [%g2 + 0xc]
	.word	0xb1a01912	! t1_kref+0x4020:   	fitod	%f18, %f24
	call	SYM(t1_subr0)
	.word	0xa5b2808b	! t1_kref+0x4028:   	edge16	%o2, %o3, %l2
	.word	0xd040a01c	! t1_kref+0x402c:   	ldsw	[%g2 + 0x1c], %o0
	.word	0x81af8ab8	! t1_kref+0x4030:   	fcmpes	%fcc0, %f30, %f24
	.word	0xa7328009	! t1_kref+0x4034:   	srl	%o2, %o1, %l3
	.word	0xf326401c	! t1_kref+0x4038:   	st	%f25, [%i1 + %i4]
	.word	0xb9b00c20	! t1_kref+0x403c:   	fzeros	%f28
	.word	0xf5262004	! t1_kref+0x4040:   	st	%f26, [%i0 + 4]
	.word	0x3c480006	! t1_kref+0x4044:   	bpos,a,pt	%icc, _kref+0x405c
	.word	0xaad2e5b8	! t1_kref+0x4048:   	umulcc	%o3, 0x5b8, %l5
	.word	0xd436601c	! t1_kref+0x404c:   	sth	%o2, [%i1 + 0x1c]
	.word	0xd430a01e	! t1_kref+0x4050:   	sth	%o2, [%g2 + 0x1e]
	.word	0xe9be588b	! t1_kref+0x4054:   	stda	%f20, [%i1 + %o3]0xc4
	.word	0xd230a02e	! t1_kref+0x4058:   	sth	%o1, [%g2 + 0x2e]
	.word	0x81ac8ada	! t1_kref+0x405c:   	fcmped	%fcc0, %f18, %f26
	.word	0xada01938	! t1_kref+0x4060:   	fstod	%f24, %f22
	.word	0x81af0a3e	! t1_kref+0x4064:   	fcmps	%fcc0, %f28, %f30
	.word	0xed86501c	! t1_kref+0x4068:   	lda	[%i1 + %i4]0x80, %f22
	.word	0xbda01917	! t1_kref+0x406c:   	fitod	%f23, %f30
	.word	0xa7b58e78	! t1_kref+0x4070:   	fxnors	%f22, %f24, %f19
	.word	0xaa3a400c	! t1_kref+0x4074:   	xnor	%o1, %o4, %l5
	.word	0x93b2c06b	! t1_kref+0x4078:   	edge8ln	%o3, %o3, %o1
	.word	0xada58d35	! t1_kref+0x407c:   	fsmuld	%f22, %f21, %f22
	.word	0xd230a03c	! t1_kref+0x4080:   	sth	%o1, [%g2 + 0x3c]
	.word	0xa1b70ed4	! t1_kref+0x4084:   	fornot2	%f28, %f20, %f16
	.word	0xa1b58a9c	! t1_kref+0x4088:   	fpsub16	%f22, %f28, %f16
	.word	0xa1a0191b	! t1_kref+0x408c:   	fitod	%f27, %f16
	.word	0xaba01a38	! t1_kref+0x4090:   	fstoi	%f24, %f21
	.word	0xaada613d	! t1_kref+0x4094:   	smulcc	%o1, 0x13d, %l5
	.word	0x8143e053	! t1_kref+0x4098:   	membar	0x53
	.word	0xa5b48a52	! t1_kref+0x409c:   	fpadd32	%f18, %f18, %f18
	.word	0xada00033	! t1_kref+0x40a0:   	fmovs	%f19, %f22
	.word	0xb7a70838	! t1_kref+0x40a4:   	fadds	%f28, %f24, %f27
	.word	0xa5a0191d	! t1_kref+0x40a8:   	fitod	%f29, %f18
	.word	0xd42e2008	! t1_kref+0x40ac:   	stb	%o2, [%i0 + 8]
	.word	0xf99eda18	! t1_kref+0x40b0:   	ldda	[%i3 + %i0]0xd0, %f28
	.word	0x8143c000	! t1_kref+0x40b4:   	stbar
	.word	0xa1b70754	! t1_kref+0x40b8:   	fpack32	%f28, %f20, %f16
	.word	0x9140c000	! t1_kref+0x40bc:   	mov	%asi, %o0
	.word	0xae82400c	! t1_kref+0x40c0:   	addcc	%o1, %o4, %l7
	.word	0xa67a4009	! t1_kref+0x40c4:   	sdiv	%o1, %o1, %l3
	.word	0xd636200c	! t1_kref+0x40c8:   	sth	%o3, [%i0 + 0xc]
	.word	0xd628a007	! t1_kref+0x40cc:   	stb	%o3, [%g2 + 7]
	.word	0xacfa6cf1	! t1_kref+0x40d0:   	sdivcc	%o1, 0xcf1, %l6
	.word	0x25800003	! t1_kref+0x40d4:   	fblg,a	_kref+0x40e0
	.word	0x92b3000c	! t1_kref+0x40d8:   	orncc	%o4, %o4, %o1
	.word	0x81ae8a56	! t1_kref+0x40dc:   	fcmpd	%fcc0, %f26, %f22
	.word	0x9fc10000	! t1_kref+0x40e0:   	call	%g4
	.word	0x9312f470	! t1_kref+0x40e4:   	taddcctv	%o3, -0xb90, %o1
	.word	0xaa03371f	! t1_kref+0x40e8:   	add	%o4, -0x8e1, %l5
	.word	0xa922f1d7	! t1_kref+0x40ec:   	mulscc	%o3, -0xe29, %l4
	.word	0xa7b240c9	! t1_kref+0x40f0:   	edge16l	%o1, %o1, %l3
	.word	0xa93a800b	! t1_kref+0x40f4:   	sra	%o2, %o3, %l4
	.word	0xadb2800c	! t1_kref+0x40f8:   	edge8	%o2, %o4, %l6
	.word	0xd210a03e	! t1_kref+0x40fc:   	lduh	[%g2 + 0x3e], %o1
	.word	0xb1b00776	! t1_kref+0x4100:   	fpack16	%f22, %f24
	.word	0x3d800005	! t1_kref+0x4104:   	fbule,a	_kref+0x4118
	.word	0xe3b8a0c0	! t1_kref+0x4108:   	stda	%f48, [%g2 + 0xc0]%asi
	.word	0xb9a409da	! t1_kref+0x410c:   	fdivd	%f16, %f26, %f28
	.word	0x928a800c	! t1_kref+0x4110:   	andcc	%o2, %o4, %o1
	.word	0xbdb68d18	! t1_kref+0x4114:   	fandnot1	%f26, %f24, %f30
	.word	0xb1a00531	! t1_kref+0x4118:   	fsqrts	%f17, %f24
	.word	0xd2062008	! t1_kref+0x411c:   	ld	[%i0 + 8], %o1
	.word	0x92d321bf	! t1_kref+0x4120:   	umulcc	%o4, 0x1bf, %o1
	.word	0x110bb1b2	! t1_kref+0x4124:   	sethi	%hi(0x2ec6c800), %o0
	.word	0x9fc10000	! t1_kref+0x4128:   	call	%g4
	.word	0xada0191e	! t1_kref+0x412c:   	fitod	%f30, %f22
	.word	0xa5b00f37	! t1_kref+0x4130:   	fsrc2s	%f23, %f18
	.word	0xa89af6c3	! t1_kref+0x4134:   	xorcc	%o3, -0x93d, %l4
	.word	0xb9b00c00	! t1_kref+0x4138:   	fzero	%f28
	.word	0xe91fbfb8	! t1_kref+0x413c:   	ldd	[%fp - 0x48], %f20
	.word	0xa6f338b8	! t1_kref+0x4140:   	udivcc	%o4, -0x748, %l3
	.word	0x902af28d	! t1_kref+0x4144:   	andn	%o3, -0xd73, %o0
	.word	0xa7b007b4	! t1_kref+0x4148:   	fpackfix	%f20, %f19
	.word	0xd430a02c	! t1_kref+0x414c:   	sth	%o2, [%g2 + 0x2c]
	.word	0xd43e6010	! t1_kref+0x4150:   	std	%o2, [%i1 + 0x10]
	.word	0xaa5b2dcf	! t1_kref+0x4154:   	smul	%o4, 0xdcf, %l5
	.word	0xb1a0003e	! t1_kref+0x4158:   	fmovs	%f30, %f24
	.word	0xb5b70f92	! t1_kref+0x415c:   	for	%f28, %f18, %f26
	.word	0xe44e2013	! t1_kref+0x4160:   	ldsb	[%i0 + 0x13], %l2
	.word	0xa402c009	! t1_kref+0x4164:   	add	%o3, %o1, %l2
	.word	0xb9b00f38	! t1_kref+0x4168:   	fsrc2s	%f24, %f28
	.word	0xa5a01917	! t1_kref+0x416c:   	fitod	%f23, %f18
	.word	0xa82a4009	! t1_kref+0x4170:   	andn	%o1, %o1, %l4
	.word	0x909ac009	! t1_kref+0x4174:   	xorcc	%o3, %o1, %o0
	.word	0xee480018	! t1_kref+0x4178:   	ldsb	[%g0 + %i0], %l7
	.word	0xe4064000	! t1_kref+0x417c:   	ld	[%i1], %l2
	.word	0x37480006	! t1_kref+0x4180:   	fbge,a,pt	%fcc0, _kref+0x4198
	.word	0xe168a089	! t1_kref+0x4184:   	prefetch	%g2 + 0x89, 16
	.word	0xa82ae3ed	! t1_kref+0x4188:   	andn	%o3, 0x3ed, %l4
	.word	0x81ac0a5c	! t1_kref+0x418c:   	fcmpd	%fcc0, %f16, %f28
	.word	0x3a480004	! t1_kref+0x4190:   	bcc,a,pt	%icc, _kref+0x41a0
	.word	0xab22400c	! t1_kref+0x4194:   	mulscc	%o1, %o4, %l5
	.word	0xe3b8a0c0	! t1_kref+0x4198:   	stda	%f48, [%g2 + 0xc0]%asi
	.word	0xd4280019	! t1_kref+0x419c:   	stb	%o2, [%g0 + %i1]
	.word	0xbda60834	! t1_kref+0x41a0:   	fadds	%f24, %f20, %f30
	.word	0xf320a01c	! t1_kref+0x41a4:   	st	%f25, [%g2 + 0x1c]
	.word	0xb3a5893d	! t1_kref+0x41a8:   	fmuls	%f22, %f29, %f25
	.word	0xadb2816b	! t1_kref+0x41ac:   	edge32ln	%o2, %o3, %l6
	.word	0xed3e2008	! t1_kref+0x41b0:   	std	%f22, [%i0 + 8]
	.word	0x91b6051a	! t1_kref+0x41b4:   	fcmpgt16	%f24, %f26, %o0
	.word	0xa60a800b	! t1_kref+0x41b8:   	and	%o2, %o3, %l3
	.word	0x81af0ab5	! t1_kref+0x41bc:   	fcmpes	%fcc0, %f28, %f21
	.word	0xb7a689b7	! t1_kref+0x41c0:   	fdivs	%f26, %f23, %f27
	.word	0xc807bff0	! t1_kref+0x41c4:   	ld	[%fp - 0x10], %g4
	.word	0xa67a400a	! t1_kref+0x41c8:   	sdiv	%o1, %o2, %l3
	.word	0xa9b5497e	! t1_kref+0x41cc:   	fpmerge	%f21, %f30, %f20
	.word	0x81ad0a54	! t1_kref+0x41d0:   	fcmpd	%fcc0, %f20, %f20
	.word	0x81ac8a58	! t1_kref+0x41d4:   	fcmpd	%fcc0, %f18, %f24
	.word	0x902b2161	! t1_kref+0x41d8:   	andn	%o4, 0x161, %o0
	.word	0xa4d2800a	! t1_kref+0x41dc:   	umulcc	%o2, %o2, %l2
	.word	0xaad3000b	! t1_kref+0x41e0:   	umulcc	%o4, %o3, %l5
	.word	0xaa3a8009	! t1_kref+0x41e4:   	xnor	%o2, %o1, %l5
	.word	0xf11fbe70	! t1_kref+0x41e8:   	ldd	[%fp - 0x190], %f24
	.word	0xafb5855a	! t1_kref+0x41ec:   	fcmpeq16	%f22, %f26, %l7
	.word	0xd4b81019	! t1_kref+0x41f0:   	stda	%o2, [%g0 + %i1]0x80
	.word	0x37480002	! t1_kref+0x41f4:   	fbge,a,pt	%fcc0, _kref+0x41fc
	.word	0xa5a0005c	! t1_kref+0x41f8:   	fmovd	%f28, %f18
	.word	0x8143c000	! t1_kref+0x41fc:   	stbar
	.word	0xa6930009	! t1_kref+0x4200:   	orcc	%o4, %o1, %l3
	.word	0xb1a00554	! t1_kref+0x4204:   	fsqrtd	%f20, %f24
	.word	0xaabaf038	! t1_kref+0x4208:   	xnorcc	%o3, -0xfc8, %l5
	.word	0xee50a036	! t1_kref+0x420c:   	ldsh	[%g2 + 0x36], %l7
	.word	0xab400000	! t1_kref+0x4210:   	mov	%y, %l5
	.word	0xa9b24049	! t1_kref+0x4214:   	edge8l	%o1, %o1, %l4
	.word	0xbda70939	! t1_kref+0x4218:   	fmuls	%f28, %f25, %f30
	.word	0xa8fab8a1	! t1_kref+0x421c:   	sdivcc	%o2, -0x75f, %l4
	.word	0x37480005	! t1_kref+0x4220:   	fbge,a,pt	%fcc0, _kref+0x4234
	.word	0xe3b8a0c0	! t1_kref+0x4224:   	stda	%f48, [%g2 + 0xc0]%asi
	.word	0xa73ae018	! t1_kref+0x4228:   	sra	%o3, 0x18, %l3
	.word	0x2b800006	! t1_kref+0x422c:   	fbug,a	_kref+0x4244
	.word	0xacfa62d8	! t1_kref+0x4230:   	sdivcc	%o1, 0x2d8, %l6
	.word	0x81ae8a33	! t1_kref+0x4234:   	fcmps	%fcc0, %f26, %f19
	.word	0xd428a005	! t1_kref+0x4238:   	stb	%o2, [%g2 + 5]
	.word	0xd830a004	! t1_kref+0x423c:   	sth	%o4, [%g2 + 4]
	.word	0x9092c00b	! t1_kref+0x4240:   	orcc	%o3, %o3, %o0
	.word	0xafb504dc	! t1_kref+0x4244:   	fcmpne32	%f20, %f28, %l7
	.word	0x35480006	! t1_kref+0x4248:   	fbue,a,pt	%fcc0, _kref+0x4260
	.word	0xa4b2b897	! t1_kref+0x424c:   	orncc	%o2, -0x769, %l2
	.word	0xac5b000a	! t1_kref+0x4250:   	smul	%o4, %o2, %l6
	.word	0xacb2c00c	! t1_kref+0x4254:   	orncc	%o3, %o4, %l6
	.word	0xa52a800c	! t1_kref+0x4258:   	sll	%o2, %o4, %l2
	.word	0x93b3016c	! t1_kref+0x425c:   	edge32ln	%o4, %o4, %o1
	.word	0xf53f4018	! t1_kref+0x4260:   	std	%f26, [%i5 + %i0]
	.word	0xea40a014	! t1_kref+0x4264:   	ldsw	[%g2 + 0x14], %l5
	.word	0xa47a6a7d	! t1_kref+0x4268:   	sdiv	%o1, 0xa7d, %l2
	.word	0xb3a00136	! t1_kref+0x426c:   	fabss	%f22, %f25
	.word	0xafb4845a	! t1_kref+0x4270:   	fcmpne16	%f18, %f26, %l7
	.word	0xa1b5467d	! t1_kref+0x4274:   	fmul8x16au	%f21, %f29, %f16
	.word	0xa43339c9	! t1_kref+0x4278:   	orn	%o4, -0x637, %l2
	.word	0xd420a014	! t1_kref+0x427c:   	st	%o2, [%g2 + 0x14]
	.word	0x35800006	! t1_kref+0x4280:   	fbue,a	_kref+0x4298
	.word	0xa3b5ccb6	! t1_kref+0x4284:   	fandnot2s	%f23, %f22, %f17
	.word	0x81dc0000	! t1_kref+0x4288:   	flush	%l0
	.word	0xb1b60d40	! t1_kref+0x428c:   	fnot1	%f24, %f24
	.word	0xa5a509d2	! t1_kref+0x4290:   	fdivd	%f20, %f18, %f18
	.word	0xb3a01a33	! t1_kref+0x4294:   	fstoi	%f19, %f25
	.word	0x90aa800b	! t1_kref+0x4298:   	andncc	%o2, %o3, %o0
	.word	0x001fffff	! t1_kref+0x429c:   	illtrap	0x1fffff
	.word	0x92632259	! t1_kref+0x42a0:   	subc	%o4, 0x259, %o1
	.word	0xa9a01a3e	! t1_kref+0x42a4:   	fstoi	%f30, %f20
	.word	0xaa2ab675	! t1_kref+0x42a8:   	andn	%o2, -0x98b, %l5
	.word	0xe806401c	! t1_kref+0x42ac:   	ld	[%i1 + %i4], %l4
	.word	0xaba01a3b	! t1_kref+0x42b0:   	fstoi	%f27, %f21
	call	SYM(t1_subr1)
	.word	0xa6f3000c	! t1_kref+0x42b8:   	udivcc	%o4, %o4, %l3
	.word	0xb9b68dd4	! t1_kref+0x42bc:   	fnand	%f26, %f20, %f28
	.word	0x93400000	! t1_kref+0x42c0:   	mov	%y, %o1
	.word	0x28800008	! t1_kref+0x42c4:   	bleu,a	_kref+0x42e4
	.word	0xadb240aa	! t1_kref+0x42c8:   	edge16n	%o1, %o2, %l6
	.word	0xe4164000	! t1_kref+0x42cc:   	lduh	[%i1], %l2
	.word	0xc568a043	! t1_kref+0x42d0:   	prefetch	%g2 + 0x43, 2
	.word	0x9272fa69	! t1_kref+0x42d4:   	udiv	%o3, -0x597, %o1
	.word	0x81af0abe	! t1_kref+0x42d8:   	fcmpes	%fcc0, %f28, %f30
	.word	0xd03e4000	! t1_kref+0x42dc:   	std	%o0, [%i1]
	.word	0xd41e4000	! t1_kref+0x42e0:   	ldd	[%i1], %o2
	.word	0xab400000	! t1_kref+0x42e4:   	mov	%y, %l5
	.word	0x31480005	! t1_kref+0x42e8:   	fba,a,pt	%fcc0, _kref+0x42fc
	.word	0xd2363fe0	! t1_kref+0x42ec:   	sth	%o1, [%i0 - 0x20]
	.word	0xae02c00c	! t1_kref+0x42f0:   	add	%o3, %o4, %l7
	.word	0xa6b269b7	! t1_kref+0x42f4:   	orncc	%o1, 0x9b7, %l3
	.word	0xf99e101d	! t1_kref+0x42f8:   	ldda	[%i0 + %i5]0x80, %f28
	.word	0xa472800b	! t1_kref+0x42fc:   	udiv	%o2, %o3, %l2
	.word	0xa5b00774	! t1_kref+0x4300:   	fpack16	%f20, %f18
	.word	0x3b480005	! t1_kref+0x4304:   	fble,a,pt	%fcc0, _kref+0x4318
	.word	0xae926dd5	! t1_kref+0x4308:   	orcc	%o1, 0xdd5, %l7
	.word	0xa49a8009	! t1_kref+0x430c:   	xorcc	%o2, %o1, %l2
	.word	0xf3262008	! t1_kref+0x4310:   	st	%f25, [%i0 + 8]
	.word	0xc12e2000	! t1_kref+0x4314:   	st	%fsr, [%i0]
	.word	0x2b800003	! t1_kref+0x4318:   	fbug,a	_kref+0x4324
	.word	0xd42e601c	! t1_kref+0x431c:   	stb	%o2, [%i1 + 0x1c]
	.word	0xabb58452	! t1_kref+0x4320:   	fcmpne16	%f22, %f18, %l5
	.word	0xacfb000b	! t1_kref+0x4324:   	sdivcc	%o4, %o3, %l6
	.word	0xb9a00133	! t1_kref+0x4328:   	fabss	%f19, %f28
	.word	0xea000018	! t1_kref+0x432c:   	ld	[%g0 + %i0], %l5
	.word	0x903b000c	! t1_kref+0x4330:   	xnor	%o4, %o4, %o0
	.word	0x25480005	! t1_kref+0x4334:   	fblg,a,pt	%fcc0, _kref+0x4348
	.word	0xe610a02c	! t1_kref+0x4338:   	lduh	[%g2 + 0x2c], %l3
	.word	0xa3a018d6	! t1_kref+0x433c:   	fdtos	%f22, %f17
	.word	0x81ae4ab2	! t1_kref+0x4340:   	fcmpes	%fcc0, %f25, %f18
	.word	0xa4fae81e	! t1_kref+0x4344:   	sdivcc	%o3, 0x81e, %l2
	.word	0xabb2830c	! t1_kref+0x4348:   	alignaddr	%o2, %o4, %l5
	.word	0xd43e6018	! t1_kref+0x434c:   	std	%o2, [%i1 + 0x18]
	.word	0x93b3000b	! t1_kref+0x4350:   	edge8	%o4, %o3, %o1
	.word	0x87802082	! t1_kref+0x4354:   	mov	0x82, %asi
	.word	0x37800007	! t1_kref+0x4358:   	fbge,a	_kref+0x4374
	.word	0xa4dab903	! t1_kref+0x435c:   	smulcc	%o2, -0x6fd, %l2
	.word	0xf99e1000	! t1_kref+0x4360:   	ldda	[%i0]0x80, %f28
	call	SYM(t1_subr2)
	.word	0xec16601a	! t1_kref+0x4368:   	lduh	[%i1 + 0x1a], %l6
	.word	0xa5a018d4	! t1_kref+0x436c:   	fdtos	%f20, %f18
	.word	0xa3a609bc	! t1_kref+0x4370:   	fdivs	%f24, %f28, %f17
	.word	0xb5a0191c	! t1_kref+0x4374:   	fitod	%f28, %f26
	.word	0x9fc00004	! t1_kref+0x4378:   	call	%g0 + %g4
	.word	0xafb68456	! t1_kref+0x437c:   	fcmpne16	%f26, %f22, %l7
	.word	0xe5981018	! t1_kref+0x4380:   	ldda	[%g0 + %i0]0x80, %f18
	.word	0xa8d2e62f	! t1_kref+0x4384:   	umulcc	%o3, 0x62f, %l4
	.word	0x26480004	! t1_kref+0x4388:   	bl,a,pt	%icc, _kref+0x4398
	.word	0x902afebd	! t1_kref+0x438c:   	andn	%o3, -0x143, %o0
	.word	0xada01a58	! t1_kref+0x4390:   	fdtoi	%f24, %f22
	.word	0xa9a01898	! t1_kref+0x4394:   	fitos	%f24, %f20
	.word	0xacf3000a	! t1_kref+0x4398:   	udivcc	%o4, %o2, %l6
	.word	0x912ae018	! t1_kref+0x439c:   	sll	%o3, 0x18, %o0
	.word	0xada01a31	! t1_kref+0x43a0:   	fstoi	%f17, %f22
	.word	0x81ac8ab9	! t1_kref+0x43a4:   	fcmpes	%fcc0, %f18, %f25
	.word	0xd250a00e	! t1_kref+0x43a8:   	ldsh	[%g2 + 0xe], %o1
	.word	0x92d2800b	! t1_kref+0x43ac:   	umulcc	%o2, %o3, %o1
	.word	0xa5b00f3e	! t1_kref+0x43b0:   	fsrc2s	%f30, %f18
	.word	0x26800007	! t1_kref+0x43b4:   	bl,a	_kref+0x43d0
	.word	0xa402ad0a	! t1_kref+0x43b8:   	add	%o2, 0xd0a, %l2
	.word	0xa9a01a3d	! t1_kref+0x43bc:   	fstoi	%f29, %f20
	.word	0xe810a036	! t1_kref+0x43c0:   	lduh	[%g2 + 0x36], %l4
	.word	0xd0c81019	! t1_kref+0x43c4:   	ldsba	[%g0 + %i1]0x80, %o0
	.word	0xa6c2400b	! t1_kref+0x43c8:   	addccc	%o1, %o3, %l3
	.word	0xd830a02e	! t1_kref+0x43cc:   	sth	%o4, [%g2 + 0x2e]
	.word	0xb3a0189b	! t1_kref+0x43d0:   	fitos	%f27, %f25
	.word	0x933b2000	! t1_kref+0x43d4:   	sra	%o4, 0x0, %o1
	.word	0x81af4ab6	! t1_kref+0x43d8:   	fcmpes	%fcc0, %f29, %f22
	.word	0x001fffff	! t1_kref+0x43dc:   	illtrap	0x1fffff
	.word	0xd43e7fe0	! t1_kref+0x43e0:   	std	%o2, [%i1 - 0x20]
	.word	0x91400000	! t1_kref+0x43e4:   	mov	%y, %o0
	.word	0xa3a00536	! t1_kref+0x43e8:   	fsqrts	%f22, %f17
	.word	0xd81f4018	! t1_kref+0x43ec:   	ldd	[%i5 + %i0], %o4
	.word	0xb3a688be	! t1_kref+0x43f0:   	fsubs	%f26, %f30, %f25
	.word	0x86102002	! t1_kref+0x43f4:   	mov	0x2, %g3
	.word	0x32800000	! t1_kref+0x43f8:   	bne,a	_kref+0x43f8
	.word	0x86a0e001	! t1_kref+0x43fc:   	subcc	%g3, 1, %g3
	.word	0x38480003	! t1_kref+0x4400:   	bgu,a,pt	%icc, _kref+0x440c
	.word	0xa9a00050	! t1_kref+0x4404:   	fmovd	%f16, %f20
	.word	0xc9ee100a	! t1_kref+0x4408:   	prefetcha	%i0 + %o2, 4
	.word	0x9322c00b	! t1_kref+0x440c:   	mulscc	%o3, %o3, %o1
	.word	0xacb2ff71	! t1_kref+0x4410:   	orncc	%o3, -0x8f, %l6
	.word	0x9de3bfa0	! t1_kref+0x4414:   	save	%sp, -0x60, %sp
	.word	0xb016c01b	! t1_kref+0x4418:   	or	%i3, %i3, %i0
	.word	0x93ee0019	! t1_kref+0x441c:   	restore	%i0, %i1, %o1
	.word	0xafa01a56	! t1_kref+0x4420:   	fdtoi	%f22, %f23
	.word	0xb5a0055a	! t1_kref+0x4424:   	fsqrtd	%f26, %f26
	.word	0xeec61000	! t1_kref+0x4428:   	ldswa	[%i0]0x80, %l7
	.word	0xa82aa452	! t1_kref+0x442c:   	andn	%o2, 0x452, %l4
	.word	0xe4480019	! t1_kref+0x4430:   	ldsb	[%g0 + %i1], %l2
	.word	0xa69b2dd7	! t1_kref+0x4434:   	xorcc	%o4, 0xdd7, %l3
	.word	0x92f2f178	! t1_kref+0x4438:   	udivcc	%o3, -0xe88, %o1
	.word	0x81ae0a58	! t1_kref+0x443c:   	fcmpd	%fcc0, %f24, %f24
	.word	0xa682800c	! t1_kref+0x4440:   	addcc	%o2, %o4, %l3
	.word	0xa9a00138	! t1_kref+0x4444:   	fabss	%f24, %f20
	.word	0xb9a01a56	! t1_kref+0x4448:   	fdtoi	%f22, %f28
	.word	0xa3b00f34	! t1_kref+0x444c:   	fsrc2s	%f20, %f17
	.word	0x2c480005	! t1_kref+0x4450:   	bneg,a,pt	%icc, _kref+0x4464
	.word	0xaf1ac009	! t1_kref+0x4454:   	tsubcctv	%o3, %o1, %l7
	.word	0xb5a00152	! t1_kref+0x4458:   	fabsd	%f18, %f26
	.word	0xc368a009	! t1_kref+0x445c:   	prefetch	%g2 + 9, 1
	.word	0xada68958	! t1_kref+0x4460:   	fmuld	%f26, %f24, %f22
	.word	0xd03f4019	! t1_kref+0x4464:   	std	%o0, [%i5 + %i1]
	.word	0xe3266004	! t1_kref+0x4468:   	st	%f17, [%i1 + 4]
	.word	0xe56e001b	! t1_kref+0x446c:   	prefetch	%i0 + %i3, 18
	.word	0xafa6c83c	! t1_kref+0x4470:   	fadds	%f27, %f28, %f23
	.word	0x24480003	! t1_kref+0x4474:   	ble,a,pt	%icc, _kref+0x4480
	.word	0x90133a1d	! t1_kref+0x4478:   	or	%o4, -0x5e3, %o0
	.word	0x38480005	! t1_kref+0x447c:   	bgu,a,pt	%icc, _kref+0x4490
	.word	0xab3aa003	! t1_kref+0x4480:   	sra	%o2, 0x3, %l5
	.word	0xaf3a400b	! t1_kref+0x4484:   	sra	%o1, %o3, %l7
	.word	0x90b2c009	! t1_kref+0x4488:   	orncc	%o3, %o1, %o0
	.word	0xaf2a6013	! t1_kref+0x448c:   	sll	%o1, 0x13, %l7
	.word	0xb9a58933	! t1_kref+0x4490:   	fmuls	%f22, %f19, %f28
	.word	0xaf32c00b	! t1_kref+0x4494:   	srl	%o3, %o3, %l7
	.word	0xa8b3000c	! t1_kref+0x4498:   	orncc	%o4, %o4, %l4
	.word	0x9022c009	! t1_kref+0x449c:   	sub	%o3, %o1, %o0
	.word	0xa6c2a959	! t1_kref+0x44a0:   	addccc	%o2, 0x959, %l3
	.word	0xadb58598	! t1_kref+0x44a4:   	fcmpgt32	%f22, %f24, %l6
	.word	0x34480004	! t1_kref+0x44a8:   	bg,a,pt	%icc, _kref+0x44b8
	.word	0xd2762010	! t1_kref+0x44ac:   	stx	%o1, [%i0 + 0x10]
	.word	0x33800001	! t1_kref+0x44b0:   	fbe,a	_kref+0x44b4
	.word	0xd03f4018	! t1_kref+0x44b4:   	std	%o0, [%i5 + %i0]
	.word	0x81ad0a5a	! t1_kref+0x44b8:   	fcmpd	%fcc0, %f20, %f26
	.word	0xe720a03c	! t1_kref+0x44bc:   	st	%f19, [%g2 + 0x3c]
	.word	0xf53e001d	! t1_kref+0x44c0:   	std	%f26, [%i0 + %i5]
	.word	0xb9a0005a	! t1_kref+0x44c4:   	fmovd	%f26, %f28
	.word	0xaefa800a	! t1_kref+0x44c8:   	sdivcc	%o2, %o2, %l7
	.word	0xa61aa0e3	! t1_kref+0x44cc:   	xor	%o2, 0xe3, %l3
	.word	0xb3a6c9bd	! t1_kref+0x44d0:   	fdivs	%f27, %f29, %f25
	.word	0xadb5099e	! t1_kref+0x44d4:   	bshuffle	%f20, %f30, %f22
	.word	0x26480003	! t1_kref+0x44d8:   	bl,a,pt	%icc, _kref+0x44e4
	.word	0xb1a58856	! t1_kref+0x44dc:   	faddd	%f22, %f22, %f24
	.word	0x3b800007	! t1_kref+0x44e0:   	fble,a	_kref+0x44fc
	.word	0xaac2f860	! t1_kref+0x44e4:   	addccc	%o3, -0x7a0, %l5
	.word	0xa5a6c93c	! t1_kref+0x44e8:   	fmuls	%f27, %f28, %f18
	.word	0xd8b65000	! t1_kref+0x44ec:   	stha	%o4, [%i1]0x80
	.word	0x29200021	! t1_kref+0x44f0:   	sethi	%hi(0x80008400), %l4
	.word	0xaf2b201f	! t1_kref+0x44f4:   	sll	%o4, 0x1f, %l7
	.word	0xbbb007b2	! t1_kref+0x44f8:   	fpackfix	%f18, %f29
	.word	0xac8b2154	! t1_kref+0x44fc:   	andcc	%o4, 0x154, %l6
	.word	0xaba01899	! t1_kref+0x4500:   	fitos	%f25, %f21
	.word	0xeb06201c	! t1_kref+0x4504:   	ld	[%i0 + 0x1c], %f21
	.word	0x9fc10000	! t1_kref+0x4508:   	call	%g4
	.word	0x9002bf54	! t1_kref+0x450c:   	add	%o2, -0xac, %o0
	.word	0xacb32a3b	! t1_kref+0x4510:   	orncc	%o4, 0xa3b, %l6
	.word	0xaba01a37	! t1_kref+0x4514:   	fstoi	%f23, %f21
	.word	0xf1be584c	! t1_kref+0x4518:   	stda	%f24, [%i1 + %o4]0xc2
	.word	0xb1b68dbc	! t1_kref+0x451c:   	fxors	%f26, %f28, %f24
	.word	0xf53e6008	! t1_kref+0x4520:   	std	%f26, [%i1 + 8]
	.word	0x913aa003	! t1_kref+0x4524:   	sra	%o2, 0x3, %o0
	.word	0x81aecab2	! t1_kref+0x4528:   	fcmpes	%fcc0, %f27, %f18
	.word	0xb9a50d38	! t1_kref+0x452c:   	fsmuld	%f20, %f24, %f28
	.word	0xa4f2ee59	! t1_kref+0x4530:   	udivcc	%o3, 0xe59, %l2
	.word	0xf1263fec	! t1_kref+0x4534:   	st	%f24, [%i0 - 0x14]
	.word	0xd620a00c	! t1_kref+0x4538:   	st	%o3, [%g2 + 0xc]
	.word	0xf5380018	! t1_kref+0x453c:   	std	%f26, [%g0 + %i0]
	.word	0xec10a00c	! t1_kref+0x4540:   	lduh	[%g2 + 0xc], %l6
	.word	0x81ac8a3e	! t1_kref+0x4544:   	fcmps	%fcc0, %f18, %f30
	.word	0x38480006	! t1_kref+0x4548:   	bgu,a,pt	%icc, _kref+0x4560
	.word	0x902ac00b	! t1_kref+0x454c:   	andn	%o3, %o3, %o0
	.word	0xa89a800b	! t1_kref+0x4550:   	xorcc	%o2, %o3, %l4
	.word	0xa61a800c	! t1_kref+0x4554:   	xor	%o2, %o4, %l3
	.word	0xa9400000	! t1_kref+0x4558:   	mov	%y, %l4
	.word	0xd630a01c	! t1_kref+0x455c:   	sth	%o3, [%g2 + 0x1c]
	.word	0xae9b000a	! t1_kref+0x4560:   	xorcc	%o4, %o2, %l7
	.word	0xd220a03c	! t1_kref+0x4564:   	st	%o1, [%g2 + 0x3c]
	.word	0x86102001	! t1_kref+0x4568:   	mov	0x1, %g3
	.word	0x32800000	! t1_kref+0x456c:   	bne,a	_kref+0x456c
	.word	0x86a0e001	! t1_kref+0x4570:   	subcc	%g3, 1, %g3
	.word	0xada01897	! t1_kref+0x4574:   	fitos	%f23, %f22
	.word	0xb4102002	! t1_kref+0x4578:   	mov	0x2, %i2
	.word	0xbda00554	! t1_kref+0x457c:   	fsqrtd	%f20, %f30
	.word	0x922b000c	! t1_kref+0x4580:   	andn	%o4, %o4, %o1
	.word	0xa9b3008a	! t1_kref+0x4584:   	edge16	%o4, %o2, %l4
	.word	0xb9a0193d	! t1_kref+0x4588:   	fstod	%f29, %f28
	.word	0xd420a004	! t1_kref+0x458c:   	st	%o2, [%g2 + 4]
	.word	0x86102004	! t1_kref+0x4590:   	mov	0x4, %g3
	.word	0x32800000	! t1_kref+0x4594:   	bne,a	_kref+0x4594
	.word	0x86a0e001	! t1_kref+0x4598:   	subcc	%g3, 1, %g3
	.word	0xb1a00138	! t1_kref+0x459c:   	fabss	%f24, %f24
	.word	0x92f2a48f	! t1_kref+0x45a0:   	udivcc	%o2, 0x48f, %o1
	.word	0xd4360000	! t1_kref+0x45a4:   	sth	%o2, [%i0]
	.word	0xd24e401a	! t1_kref+0x45a8:   	ldsb	[%i1 + %i2], %o1
	.word	0xb1a708d6	! t1_kref+0x45ac:   	fsubd	%f28, %f22, %f24
	.word	0xe13e001d	! t1_kref+0x45b0:   	std	%f16, [%i0 + %i5]
	.word	0xbbb00f35	! t1_kref+0x45b4:   	fsrc2s	%f21, %f29
	.word	0xbbb5ca7e	! t1_kref+0x45b8:   	fpadd32s	%f23, %f30, %f29
	.word	0x9002800a	! t1_kref+0x45bc:   	add	%o2, %o2, %o0
	.word	0xa73ae00d	! t1_kref+0x45c0:   	sra	%o3, 0xd, %l3
	.word	0xae5a73ef	! t1_kref+0x45c4:   	smul	%o1, -0xc11, %l7
	.word	0xffee501c	! t1_kref+0x45c8:   	prefetcha	%i1 + %i4, 31
	.word	0xe6480018	! t1_kref+0x45cc:   	ldsb	[%g0 + %i0], %l3
	.word	0xd0180018	! t1_kref+0x45d0:   	ldd	[%g0 + %i0], %o0
	.word	0xb9a00037	! t1_kref+0x45d4:   	fmovs	%f23, %f28
	.word	0xbda01896	! t1_kref+0x45d8:   	fitos	%f22, %f30
	.word	0xeb68a045	! t1_kref+0x45dc:   	prefetch	%g2 + 0x45, 21
	.word	0xbdabc037	! t1_kref+0x45e0:   	fmovso	%fcc0, %f23, %f30
	.word	0xa43ab2b0	! t1_kref+0x45e4:   	xnor	%o2, -0xd50, %l2
	.word	0xf1ee101a	! t1_kref+0x45e8:   	prefetcha	%i0 + %i2, 24
	.word	0x39480002	! t1_kref+0x45ec:   	fbuge,a,pt	%fcc0, _kref+0x45f4
	.word	0x932ac00b	! t1_kref+0x45f0:   	sll	%o3, %o3, %o1
	.word	0xa8f24009	! t1_kref+0x45f4:   	udivcc	%o1, %o1, %l4
	.word	0xa8033e18	! t1_kref+0x45f8:   	add	%o4, -0x1e8, %l4
	.word	0xe4881018	! t1_kref+0x45fc:   	lduba	[%g0 + %i0]0x80, %l2
	.word	0xa3a018dc	! t1_kref+0x4600:   	fdtos	%f28, %f17
	.word	0xbdb786b2	! t1_kref+0x4604:   	fmul8x16al	%f30, %f18, %f30
	.word	0x3e480003	! t1_kref+0x4608:   	bvc,a,pt	%icc, _kref+0x4614
	.word	0xb9a0191c	! t1_kref+0x460c:   	fitod	%f28, %f28
	.word	0xae92800c	! t1_kref+0x4610:   	orcc	%o2, %o4, %l7
	.word	0xae82c00c	! t1_kref+0x4614:   	addcc	%o3, %o4, %l7
	.word	0x8182c000	! t1_kref+0x4618:   	wr	%o3, %g0, %y
	.word	0x35800003	! t1_kref+0x461c:   	fbue,a	_kref+0x4628
	.word	0xa7b48f7d	! t1_kref+0x4620:   	fornot1s	%f18, %f29, %f19
	.word	0xeb68a002	! t1_kref+0x4624:   	prefetch	%g2 + 2, 21
	.word	0xb7a0053e	! t1_kref+0x4628:   	fsqrts	%f30, %f27
	.word	0xb5a5cd36	! t1_kref+0x462c:   	fsmuld	%f23, %f22, %f26
	.word	0xe848a00e	! t1_kref+0x4630:   	ldsb	[%g2 + 0xe], %l4
	.word	0x81ae8abc	! t1_kref+0x4634:   	fcmpes	%fcc0, %f26, %f28
	.word	0x92b27e0c	! t1_kref+0x4638:   	orncc	%o1, -0x1f4, %o1
	.word	0xa53b000b	! t1_kref+0x463c:   	sra	%o4, %o3, %l2
	.word	0xa9b40916	! t1_kref+0x4640:   	faligndata	%f16, %f22, %f20
	.word	0xae7ac00a	! t1_kref+0x4644:   	sdiv	%o3, %o2, %l7
	.word	0x9fc00004	! t1_kref+0x4648:   	call	%g0 + %g4
	.word	0xaed2c00b	! t1_kref+0x464c:   	umulcc	%o3, %o3, %l7
	.word	0xaa82c00b	! t1_kref+0x4650:   	addcc	%o3, %o3, %l5
	.word	0xa3b00f3e	! t1_kref+0x4654:   	fsrc2s	%f30, %f17
	.word	0xc12e001c	! t1_kref+0x4658:   	st	%fsr, [%i0 + %i4]
	.word	0x900a8009	! t1_kref+0x465c:   	and	%o2, %o1, %o0
	.word	0xd0380018	! t1_kref+0x4660:   	std	%o0, [%g0 + %i0]
	.word	0xb5a0191d	! t1_kref+0x4664:   	fitod	%f29, %f26
	.word	0xac9a7a88	! t1_kref+0x4668:   	xorcc	%o1, -0x578, %l6
	.word	0x81ae8a56	! t1_kref+0x466c:   	fcmpd	%fcc0, %f26, %f22
	.word	0xad2a400c	! t1_kref+0x4670:   	sll	%o1, %o4, %l6
	.word	0xada01056	! t1_kref+0x4674:   	fdtox	%f22, %f22
	.word	0xacfa400b	! t1_kref+0x4678:   	sdivcc	%o1, %o3, %l6
	.word	0x32480004	! t1_kref+0x467c:   	bne,a,pt	%icc, _kref+0x468c
	.word	0xaab28009	! t1_kref+0x4680:   	orncc	%o2, %o1, %l5
	.word	0xa9b60c56	! t1_kref+0x4684:   	fnor	%f24, %f22, %f20
	.word	0xa5a00150	! t1_kref+0x4688:   	fabsd	%f16, %f18
	.word	0x20800003	! t1_kref+0x468c:   	bn,a	_kref+0x4698
	.word	0xf1be1a5b	! t1_kref+0x4690:   	stda	%f24, [%i0 + %i3]0xd2
	.word	0x2c480003	! t1_kref+0x4694:   	bneg,a,pt	%icc, _kref+0x46a0
	.word	0xb5a00034	! t1_kref+0x4698:   	fmovs	%f20, %f26
	.word	0x3e480005	! t1_kref+0x469c:   	bvc,a,pt	%icc, _kref+0x46b0
	.word	0xa63b000b	! t1_kref+0x46a0:   	xnor	%o4, %o3, %l3
	.word	0xa93aa00b	! t1_kref+0x46a4:   	sra	%o2, 0xb, %l4
	.word	0xae32f5f5	! t1_kref+0x46a8:   	orn	%o3, -0xa0b, %l7
	.word	0xbda508da	! t1_kref+0x46ac:   	fsubd	%f20, %f26, %f30
	.word	0xa8aaabfe	! t1_kref+0x46b0:   	andncc	%o2, 0xbfe, %l4
	.word	0xd010a014	! t1_kref+0x46b4:   	lduh	[%g2 + 0x14], %o0
	.word	0xac1ac009	! t1_kref+0x46b8:   	xor	%o3, %o1, %l6
	.word	0xb9a01899	! t1_kref+0x46bc:   	fitos	%f25, %f28
	.word	0x25800007	! t1_kref+0x46c0:   	fblg,a	_kref+0x46dc
	.word	0xe44e7fec	! t1_kref+0x46c4:   	ldsb	[%i1 - 0x14], %l2
	.word	0x81af8abe	! t1_kref+0x46c8:   	fcmpes	%fcc0, %f30, %f30
	.word	0xd220a00c	! t1_kref+0x46cc:   	st	%o1, [%g2 + 0xc]
	.word	0xd04e0000	! t1_kref+0x46d0:   	ldsb	[%i0], %o0
	.word	0xd628a024	! t1_kref+0x46d4:   	stb	%o3, [%g2 + 0x24]
	.word	0xe631401b	! t1_kref+0x46d8:   	sth	%l3, [%g5 + %i3]
	.word	0xa3b00fe0	! t1_kref+0x46dc:   	fones	%f17
	.word	0xc768a083	! t1_kref+0x46e0:   	prefetch	%g2 + 0x83, 3
	.word	0xac1a6f1a	! t1_kref+0x46e4:   	xor	%o1, 0xf1a, %l6
	.word	0xd230a01c	! t1_kref+0x46e8:   	sth	%o1, [%g2 + 0x1c]
	.word	0x81af0ad2	! t1_kref+0x46ec:   	fcmped	%fcc0, %f28, %f18
	.word	0x81dac00b	! t1_kref+0x46f0:   	flush	%o3 + %o3
	.word	0xec10a024	! t1_kref+0x46f4:   	lduh	[%g2 + 0x24], %l6
	.word	0x34800003	! t1_kref+0x46f8:   	bg,a	_kref+0x4704
	.word	0xa8533867	! t1_kref+0x46fc:   	umul	%o4, -0x799, %l4
	.word	0xa5b3000b	! t1_kref+0x4700:   	edge8	%o4, %o3, %l2
	.word	0xec46401c	! t1_kref+0x4704:   	ldsw	[%i1 + %i4], %l6
	.word	0xf500a02c	! t1_kref+0x4708:   	ld	[%g2 + 0x2c], %f26
	.word	0xa4d2800b	! t1_kref+0x470c:   	umulcc	%o2, %o3, %l2
	.word	0xc16e2008	! t1_kref+0x4710:   	prefetch	%i0 + 8, 0
	.word	0xaba01898	! t1_kref+0x4714:   	fitos	%f24, %f21
	.word	0xd428a00e	! t1_kref+0x4718:   	stb	%o2, [%g2 + 0xe]
	.word	0xb3a01a32	! t1_kref+0x471c:   	fstoi	%f18, %f25
	.word	0x90d33e89	! t1_kref+0x4720:   	umulcc	%o4, -0x177, %o0
	.word	0xa4fb28f2	! t1_kref+0x4724:   	sdivcc	%o4, 0x8f2, %l2
	.word	0xb1a01918	! t1_kref+0x4728:   	fitod	%f24, %f24
	.word	0x9fc00004	! t1_kref+0x472c:   	call	%g0 + %g4
	.word	0xa7b2830b	! t1_kref+0x4730:   	alignaddr	%o2, %o3, %l3
	.word	0xb5a01a5e	! t1_kref+0x4734:   	fdtoi	%f30, %f26
	.word	0xf9be5a5c	! t1_kref+0x4738:   	stda	%f28, [%i1 + %i4]0xd2
	.word	0xa5a00552	! t1_kref+0x473c:   	fsqrtd	%f18, %f18
	.word	0xb9a00533	! t1_kref+0x4740:   	fsqrts	%f19, %f28
	.word	0xd4767ff0	! t1_kref+0x4744:   	stx	%o2, [%i1 - 0x10]
	.word	0xe66e0000	! t1_kref+0x4748:   	ldstub	[%i0], %l3
	.word	0xaba0189d	! t1_kref+0x474c:   	fitos	%f29, %f21
	.word	0x81af4a3a	! t1_kref+0x4750:   	fcmps	%fcc0, %f29, %f26
	.word	0xb1b606b7	! t1_kref+0x4754:   	fmul8x16al	%f24, %f23, %f24
	.word	0xe8d65000	! t1_kref+0x4758:   	ldsha	[%i1]0x80, %l4
	.word	0xb9a0055a	! t1_kref+0x475c:   	fsqrtd	%f26, %f28
	.word	0xa9a6c836	! t1_kref+0x4760:   	fadds	%f27, %f22, %f20
	.word	0x9fc00004	! t1_kref+0x4764:   	call	%g0 + %g4
	.word	0x8143c000	! t1_kref+0x4768:   	stbar
	.word	0xd208a034	! t1_kref+0x476c:   	ldub	[%g2 + 0x34], %o1
	.word	0x110e0b67	! t1_kref+0x4770:   	sethi	%hi(0x382d9c00), %o0
	.word	0xd820a00c	! t1_kref+0x4774:   	st	%o4, [%g2 + 0xc]
	.word	0xada0105a	! t1_kref+0x4778:   	fdtox	%f26, %f22
	.word	0xa6aa4009	! t1_kref+0x477c:   	andncc	%o1, %o1, %l3
	.word	0xa622c00b	! t1_kref+0x4780:   	sub	%o3, %o3, %l3
	.word	0xadb00c20	! t1_kref+0x4784:   	fzeros	%f22
	.word	0xe408a00e	! t1_kref+0x4788:   	ldub	[%g2 + 0xe], %l2
	.word	0xaa5b209e	! t1_kref+0x478c:   	smul	%o4, 0x9e, %l5
	.word	0xa893000a	! t1_kref+0x4790:   	orcc	%o4, %o2, %l4
	.word	0xd2766010	! t1_kref+0x4794:   	stx	%o1, [%i1 + 0x10]
	.word	0x22480007	! t1_kref+0x4798:   	be,a,pt	%icc, _kref+0x47b4
	.word	0xa862c00a	! t1_kref+0x479c:   	subc	%o3, %o2, %l4
	.word	0xaa2b000b	! t1_kref+0x47a0:   	andn	%o4, %o3, %l5
	.word	0xd81e6000	! t1_kref+0x47a4:   	ldd	[%i1], %o4
	.word	0x28480008	! t1_kref+0x47a8:   	bleu,a,pt	%icc, _kref+0x47c8
	.word	0xd620a00c	! t1_kref+0x47ac:   	st	%o3, [%g2 + 0xc]
	.word	0x2b800007	! t1_kref+0x47b0:   	fbug,a	_kref+0x47cc
	.word	0xac3a6330	! t1_kref+0x47b4:   	xnor	%o1, 0x330, %l6
	.word	0x81ae8ab4	! t1_kref+0x47b8:   	fcmpes	%fcc0, %f26, %f20
	.word	0xb9a01915	! t1_kref+0x47bc:   	fitod	%f21, %f28
	.word	0xa9b68d40	! t1_kref+0x47c0:   	fnot1	%f26, %f20
	.word	0xfd20a034	! t1_kref+0x47c4:   	st	%f30, [%g2 + 0x34]
	.word	0xafb68510	! t1_kref+0x47c8:   	fcmpgt16	%f26, %f16, %l7
	.word	0xd4ae501a	! t1_kref+0x47cc:   	stba	%o2, [%i1 + %i2]0x80
	.word	0xf1be188b	! t1_kref+0x47d0:   	stda	%f24, [%i0 + %o3]0xc4
	.word	0xa41a800a	! t1_kref+0x47d4:   	xor	%o2, %o2, %l2
	.word	0xf1267fe0	! t1_kref+0x47d8:   	st	%f24, [%i1 - 0x20]
	.word	0xbba018da	! t1_kref+0x47dc:   	fdtos	%f26, %f29
	.word	0x878020f0	! t1_kref+0x47e0:   	mov	0xf0, %asi
	.word	0x91b30009	! t1_kref+0x47e4:   	edge8	%o4, %o1, %o0
	.word	0xa6fb000c	! t1_kref+0x47e8:   	sdivcc	%o4, %o4, %l3
	.word	0x21800003	! t1_kref+0x47ec:   	fbn,a	_kref+0x47f8
	.word	0xa722400c	! t1_kref+0x47f0:   	mulscc	%o1, %o4, %l3
	.word	0xe720a014	! t1_kref+0x47f4:   	st	%f19, [%g2 + 0x14]
	.word	0xd040a02c	! t1_kref+0x47f8:   	ldsw	[%g2 + 0x2c], %o0
	.word	0x2f480008	! t1_kref+0x47fc:   	fbu,a,pt	%fcc0, _kref+0x481c
	.word	0xe3067ff0	! t1_kref+0x4800:   	ld	[%i1 - 0x10], %f17
	.word	0xa8b2e861	! t1_kref+0x4804:   	orncc	%o3, 0x861, %l4
	.word	0x932aa00b	! t1_kref+0x4808:   	sll	%o2, 0xb, %o1
	.word	0xaa22fb86	! t1_kref+0x480c:   	sub	%o3, -0x47a, %l5
	.word	0xafa01a54	! t1_kref+0x4810:   	fdtoi	%f20, %f23
	.word	0xae2a800c	! t1_kref+0x4814:   	andn	%o2, %o4, %l7
	.word	0xd220a02c	! t1_kref+0x4818:   	st	%o1, [%g2 + 0x2c]
	.word	0xa73a4009	! t1_kref+0x481c:   	sra	%o1, %o1, %l3
	.word	0x92baa458	! t1_kref+0x4820:   	xnorcc	%o2, 0x458, %o1
	.word	0xb5b78910	! t1_kref+0x4824:   	faligndata	%f30, %f16, %f26
	.word	0xbda0003e	! t1_kref+0x4828:   	fmovs	%f30, %f30
	.word	0xada01a5e	! t1_kref+0x482c:   	fdtoi	%f30, %f22
	.word	0xac2b000c	! t1_kref+0x4830:   	andn	%o4, %o4, %l6
	.word	0x8610201f	! t1_kref+0x4834:   	mov	0x1f, %g3
	.word	0x86a0e001	! t1_kref+0x4838:   	subcc	%g3, 1, %g3
	.word	0x22800010	! t1_kref+0x483c:   	be,a	_kref+0x487c
	.word	0x902a7f24	! t1_kref+0x4840:   	andn	%o1, -0xdc, %o0
	.word	0xd4363fe0	! t1_kref+0x4844:   	sth	%o2, [%i0 - 0x20]
	.word	0xf1ee101d	! t1_kref+0x4848:   	prefetcha	%i0 + %i5, 24
	.word	0x30bffffb	! t1_kref+0x484c:   	ba,a	_kref+0x4838
	.word	0xe500a02c	! t1_kref+0x4850:   	ld	[%g2 + 0x2c], %f18
	.word	0x3c480006	! t1_kref+0x4854:   	bpos,a,pt	%icc, _kref+0x486c
	.word	0xd82e3ffe	! t1_kref+0x4858:   	stb	%o4, [%i0 - 2]
	.word	0xabb2c200	! t1_kref+0x485c:   	array8	%o3, %g0, %l5
	.word	0xd42e2002	! t1_kref+0x4860:   	stb	%o2, [%i0 + 2]
	.word	0xb9a709d8	! t1_kref+0x4864:   	fdivd	%f28, %f24, %f28
	.word	0x9292fed1	! t1_kref+0x4868:   	orcc	%o3, -0x12f, %o1
	.word	0x34480003	! t1_kref+0x486c:   	bg,a,pt	%icc, _kref+0x4878
	.word	0xb9a0003e	! t1_kref+0x4870:   	fmovs	%f30, %f28
	.word	0xa81a400b	! t1_kref+0x4874:   	xor	%o1, %o3, %l4
	.word	0xac5a800c	! t1_kref+0x4878:   	smul	%o2, %o4, %l6
	.word	0xde16c005	! t1_kref+0x487c:   	lduh	[%i3 + %g5], %o7
	.word	0x933ae010	! t1_kref+0x4880:   	sra	%o3, 0x10, %o1
	.word	0xec162014	! t1_kref+0x4884:   	lduh	[%i0 + 0x14], %l6
	.word	0xa80ae845	! t1_kref+0x4888:   	and	%o3, 0x845, %l4
	.word	0x22480001	! t1_kref+0x488c:   	be,a,pt	%icc, _kref+0x4890
	.word	0xa3b58ea0	! t1_kref+0x4890:   	fsrc1s	%f22, %f17
	.word	0x2f800003	! t1_kref+0x4894:   	fbu,a	_kref+0x48a0
	.word	0xd220a034	! t1_kref+0x4898:   	st	%o1, [%g2 + 0x34]
	.word	0x34800008	! t1_kref+0x489c:   	bg,a	_kref+0x48bc
	.word	0xb1b50e80	! t1_kref+0x48a0:   	fsrc1	%f20, %f24
	.word	0xb5a6cd34	! t1_kref+0x48a4:   	fsmuld	%f27, %f20, %f26
	.word	0xb1a01913	! t1_kref+0x48a8:   	fitod	%f19, %f24
	.word	0xa9a00554	! t1_kref+0x48ac:   	fsqrtd	%f20, %f20
	.word	0xbdb60f74	! t1_kref+0x48b0:   	fornot1s	%f24, %f20, %f30
	.word	0xe1be1a1b	! t1_kref+0x48b4:   	stda	%f16, [%i0 + %i3]0xd0
	.word	0xac02c00a	! t1_kref+0x48b8:   	add	%o3, %o2, %l6
	.word	0x91b3032b	! t1_kref+0x48bc:   	bmask	%o4, %o3, %o0
	.word	0xc368a001	! t1_kref+0x48c0:   	prefetch	%g2 + 1, 1
	.word	0xa7226336	! t1_kref+0x48c4:   	mulscc	%o1, 0x336, %l3
	.word	0x86102020	! t1_kref+0x48c8:   	mov	0x20, %g3
	.word	0x86a0e001	! t1_kref+0x48cc:   	subcc	%g3, 1, %g3
	.word	0x22800011	! t1_kref+0x48d0:   	be,a	_kref+0x4914
	.word	0xc168a0c7	! t1_kref+0x48d4:   	prefetch	%g2 + 0xc7, 0
	.word	0xd03e4000	! t1_kref+0x48d8:   	std	%o0, [%i1]
	.word	0xd620a03c	! t1_kref+0x48dc:   	st	%o3, [%g2 + 0x3c]
	.word	0xa63ac00a	! t1_kref+0x48e0:   	xnor	%o3, %o2, %l3
	.word	0x92d32fc1	! t1_kref+0x48e4:   	umulcc	%o4, 0xfc1, %o1
	.word	0xa5a01931	! t1_kref+0x48e8:   	fstod	%f17, %f18
	.word	0xe53e001d	! t1_kref+0x48ec:   	std	%f18, [%i0 + %i5]
	.word	0x9fc00004	! t1_kref+0x48f0:   	call	%g0 + %g4
	.word	0xaba01a5a	! t1_kref+0x48f4:   	fdtoi	%f26, %f21
	.word	0x8143c000	! t1_kref+0x48f8:   	stbar
	.word	0xabb30280	! t1_kref+0x48fc:   	array32	%o4, %g0, %l5
	.word	0x93400000	! t1_kref+0x4900:   	mov	%y, %o1
	.word	0xf007bfe0	! t1_kref+0x4904:   	ld	[%fp - 0x20], %i0
	.word	0xeb6e6000	! t1_kref+0x4908:   	prefetch	%i1, 21
	.word	0xe1bf5a59	! t1_kref+0x490c:   	stda	%f16, [%i5 + %i1]0xd2
	.word	0xd230a026	! t1_kref+0x4910:   	sth	%o1, [%g2 + 0x26]
	.word	0xe93e2010	! t1_kref+0x4914:   	std	%f20, [%i0 + 0x10]
	.word	0xedf6100a	! t1_kref+0x4918:   	casxa	[%i0]0x80, %o2, %l6
	.word	0x38480001	! t1_kref+0x491c:   	bgu,a,pt	%icc, _kref+0x4920
	.word	0x933a800a	! t1_kref+0x4920:   	sra	%o2, %o2, %o1
	.word	0xd220a01c	! t1_kref+0x4924:   	st	%o1, [%g2 + 0x1c]
	.word	0xa932a014	! t1_kref+0x4928:   	srl	%o2, 0x14, %l4
	.word	0xafb24329	! t1_kref+0x492c:   	bmask	%o1, %o1, %l7
	.word	0xa4da800b	! t1_kref+0x4930:   	smulcc	%o2, %o3, %l2
	.word	0xaf418000	! t1_kref+0x4934:   	mov	%fprs, %l7
	.word	0xe99f5018	! t1_kref+0x4938:   	ldda	[%i5 + %i0]0x80, %f20
	.word	0xe56e001b	! t1_kref+0x493c:   	prefetch	%i0 + %i3, 18
	.word	0xe616c019	! t1_kref+0x4940:   	lduh	[%i3 + %i1], %l3
	.word	0x93400000	! t1_kref+0x4944:   	mov	%y, %o1
	.word	0xaf12729c	! t1_kref+0x4948:   	taddcctv	%o1, -0xd64, %l7
	.word	0xd430a03e	! t1_kref+0x494c:   	sth	%o2, [%g2 + 0x3e]
	.word	0xa62afe88	! t1_kref+0x4950:   	andn	%o3, -0x178, %l3
	.word	0xa5a01892	! t1_kref+0x4954:   	fitos	%f18, %f18
	.word	0xa5a0191c	! t1_kref+0x4958:   	fitod	%f28, %f18
	.word	0xa52aa012	! t1_kref+0x495c:   	sll	%o2, 0x12, %l2
	.word	0xec965000	! t1_kref+0x4960:   	lduha	[%i1]0x80, %l6
	.word	0xd2366018	! t1_kref+0x4964:   	sth	%o1, [%i1 + 0x18]
	.word	0xa6ab000c	! t1_kref+0x4968:   	andncc	%o4, %o4, %l3
	.word	0xa7a018de	! t1_kref+0x496c:   	fdtos	%f30, %f19
	.word	0x907339ca	! t1_kref+0x4970:   	udiv	%o4, -0x636, %o0
	.word	0xa93b2000	! t1_kref+0x4974:   	sra	%o4, 0x0, %l4
	.word	0xb1a01914	! t1_kref+0x4978:   	fitod	%f20, %f24
	.word	0xabb5849a	! t1_kref+0x497c:   	fcmple32	%f22, %f26, %l5
	call	1f
	.empty
	.word	0xb1a0105c	! t1_kref+0x4984:   	fdtox	%f28, %f24
	.word	0x903b28b2	! t1_kref+0x4988:   	xnor	%o4, 0x8b2, %o0
	.word	0xb5a68950	! t1_kref+0x498c:   	fmuld	%f26, %f16, %f26
	.word	0x28800004	! t1_kref+0x4990:   	bleu,a	_kref+0x49a0
	.word	0xb7a018d2	! t1_kref+0x4994:   	fdtos	%f18, %f27
	.word	0xafa6c8b5	! t1_kref+0x4998:   	fsubs	%f27, %f21, %f23
	.word	0xea50a014	! t1_kref+0x499c:   	ldsh	[%g2 + 0x14], %l5
	.word	0xb8103ff4	! t1_kref+0x49a0:   	mov	0xfffffff4, %i4
1:	.word	0xb9a608d4	! t1_kref+0x49a4:   	fsubd	%f24, %f20, %f28
	.word	0xa4d2400a	! t1_kref+0x49a8:   	umulcc	%o1, %o2, %l2
	.word	0xd43e7fe8	! t1_kref+0x49ac:   	std	%o2, [%i1 - 0x18]
	.word	0xf3060000	! t1_kref+0x49b0:   	ld	[%i0], %f25
	.word	0xac92b080	! t1_kref+0x49b4:   	orcc	%o2, -0xf80, %l6
	.word	0xa4dae12f	! t1_kref+0x49b8:   	smulcc	%o3, 0x12f, %l2
	.word	0xf93e3fe8	! t1_kref+0x49bc:   	std	%f28, [%i0 - 0x18]
	.word	0xd24e3ff1	! t1_kref+0x49c0:   	ldsb	[%i0 - 0xf], %o1
	.word	0xaa02800b	! t1_kref+0x49c4:   	add	%o2, %o3, %l5
	.word	0xe5070019	! t1_kref+0x49c8:   	ld	[%i4 + %i1], %f18
	.word	0xd820a004	! t1_kref+0x49cc:   	st	%o4, [%g2 + 4]
	.word	0xe64e6008	! t1_kref+0x49d0:   	ldsb	[%i1 + 8], %l3
	.word	0x2a480002	! t1_kref+0x49d4:   	bcs,a,pt	%icc, _kref+0x49dc
	.word	0x909b000c	! t1_kref+0x49d8:   	xorcc	%o4, %o4, %o0
	.word	0x81b01026	! t1_kref+0x49dc:   	siam	0x6
	.word	0xec08a03d	! t1_kref+0x49e0:   	ldub	[%g2 + 0x3d], %l6
	.word	0x90dac00b	! t1_kref+0x49e4:   	smulcc	%o3, %o3, %o0
	.word	0xa802400a	! t1_kref+0x49e8:   	add	%o1, %o2, %l4
	.word	0xd228a03d	! t1_kref+0x49ec:   	stb	%o1, [%g2 + 0x3d]
	.word	0xa602be3e	! t1_kref+0x49f0:   	add	%o2, -0x1c2, %l3
	.word	0xa3a00536	! t1_kref+0x49f4:   	fsqrts	%f22, %f17
	.word	0xb6103fe6	! t1_kref+0x49f8:   	mov	0xffffffe6, %i3
	.word	0x81adcab4	! t1_kref+0x49fc:   	fcmpes	%fcc0, %f23, %f20
	.word	0xd42e401a	! t1_kref+0x4a00:   	stb	%o2, [%i1 + %i2]
	.word	0x9de3bfa0	! t1_kref+0x4a04:   	save	%sp, -0x60, %sp
	.word	0xa7eea686	! t1_kref+0x4a08:   	restore	%i2, 0x686, %l3
	.word	0xaba0109e	! t1_kref+0x4a0c:   	fxtos	%f30, %f21
	.word	0xa82b0009	! t1_kref+0x4a10:   	andn	%o4, %o1, %l4
	.word	0xd428a025	! t1_kref+0x4a14:   	stb	%o2, [%g2 + 0x25]
	.word	0xe6d65000	! t1_kref+0x4a18:   	ldsha	[%i1]0x80, %l3
	.word	0xa4ba8009	! t1_kref+0x4a1c:   	xnorcc	%o2, %o1, %l2
	.word	0xa7600009	! t1_kref+0x4a20:   	movn	%fcc0, %o1, %l3
	.word	0xa5a0191b	! t1_kref+0x4a24:   	fitod	%f27, %f18
	.word	0xaeaa400c	! t1_kref+0x4a28:   	andncc	%o1, %o4, %l7
	.word	0xa61a8009	! t1_kref+0x4a2c:   	xor	%o2, %o1, %l3
	.word	0xe9be1889	! t1_kref+0x4a30:   	stda	%f20, [%i0 + %o1]0xc4
	.word	0x81ae0a5e	! t1_kref+0x4a34:   	fcmpd	%fcc0, %f24, %f30
	.word	0xe53e401d	! t1_kref+0x4a38:   	std	%f18, [%i1 + %i5]
	.word	0xd8367fe0	! t1_kref+0x4a3c:   	sth	%o4, [%i1 - 0x20]
	.word	0xf76e401d	! t1_kref+0x4a40:   	prefetch	%i1 + %i5, 27
	.word	0xb3b44efd	! t1_kref+0x4a44:   	fornot2s	%f17, %f29, %f25
	.word	0xafa018d8	! t1_kref+0x4a48:   	fdtos	%f24, %f23
	.word	0xaba7483c	! t1_kref+0x4a4c:   	fadds	%f29, %f28, %f21
	.word	0xab2aa006	! t1_kref+0x4a50:   	sll	%o2, 0x6, %l5
	.word	0xa8dac00c	! t1_kref+0x4a54:   	smulcc	%o3, %o4, %l4
	.word	0xac926af6	! t1_kref+0x4a58:   	orcc	%o1, 0xaf6, %l6
	.word	0xa6f2800c	! t1_kref+0x4a5c:   	udivcc	%o2, %o4, %l3
	.word	0xf56e401b	! t1_kref+0x4a60:   	prefetch	%i1 + %i3, 26
	.word	0xaefaad53	! t1_kref+0x4a64:   	sdivcc	%o2, 0xd53, %l7
	.word	0xb5a488d6	! t1_kref+0x4a68:   	fsubd	%f18, %f22, %f26
	.word	0x26480002	! t1_kref+0x4a6c:   	bl,a,pt	%icc, _kref+0x4a74
	.word	0xf120a03c	! t1_kref+0x4a70:   	st	%f24, [%g2 + 0x3c]
	.word	0xadb68dd0	! t1_kref+0x4a74:   	fnand	%f26, %f16, %f22
	.word	0xf53e3fe8	! t1_kref+0x4a78:   	std	%f26, [%i0 - 0x18]
	.word	0x8143c000	! t1_kref+0x4a7c:   	stbar
	.word	0xce270005	! t1_kref+0x4a80:   	st	%g7, [%i4 + %g5]
	.word	0xa5b60452	! t1_kref+0x4a84:   	fcmpne16	%f24, %f18, %l2
	.word	0x8143c000	! t1_kref+0x4a88:   	stbar
	.word	0xb5b40d92	! t1_kref+0x4a8c:   	fxor	%f16, %f18, %f26
	.word	0xec070019	! t1_kref+0x4a90:   	ld	[%i4 + %i1], %l6
	.word	0x900b326a	! t1_kref+0x4a94:   	and	%o4, -0xd96, %o0
	.word	0x8d83000c	! t1_kref+0x4a98:   	wr	%o4, %o4, %fprs
	.word	0xada00533	! t1_kref+0x4a9c:   	fsqrts	%f19, %f22
	.word	0xa87aad6e	! t1_kref+0x4aa0:   	sdiv	%o2, 0xd6e, %l4
	.word	0x9fc10000	! t1_kref+0x4aa4:   	call	%g4
	.word	0xc807bff0	! t1_kref+0x4aa8:   	ld	[%fp - 0x10], %g4
	.word	0xa4fab012	! t1_kref+0x4aac:   	sdivcc	%o2, -0xfee, %l2
	.word	0xd420a034	! t1_kref+0x4ab0:   	st	%o2, [%g2 + 0x34]
	.word	0xf007bfe0	! t1_kref+0x4ab4:   	ld	[%fp - 0x20], %i0
	.word	0xbba01898	! t1_kref+0x4ab8:   	fitos	%f24, %f29
	.word	0xd220a004	! t1_kref+0x4abc:   	st	%o1, [%g2 + 4]
	.word	0xbda00136	! t1_kref+0x4ac0:   	fabss	%f22, %f30
	sethi	%hi(2f), %o7
	.word	0xe40be2ec	! t1_kref+0x4ac8:   	ldub	[%o7 + 0x2ec], %l2
	.word	0xa41ca00c	! t1_kref+0x4acc:   	xor	%l2, 0xc, %l2
	.word	0xe42be2ec	! t1_kref+0x4ad0:   	stb	%l2, [%o7 + 0x2ec]
	.word	0x81dbe2ec	! t1_kref+0x4ad4:   	flush	%o7 + 0x2ec
	.word	0xafa6c83b	! t1_kref+0x4ad8:   	fadds	%f27, %f27, %f23
	.word	0x31800003	! t1_kref+0x4adc:   	fba,a	_kref+0x4ae8
	.word	0xaeda8009	! t1_kref+0x4ae0:   	smulcc	%o2, %o1, %l7
	.word	0xb1a709d8	! t1_kref+0x4ae4:   	fdivd	%f28, %f24, %f24
	.word	0xabb00c20	! t1_kref+0x4ae8:   	fzeros	%f21
2:	.word	0xe41e2008	! t1_kref+0x4aec:   	ldd	[%i0 + 8], %l2
	.word	0xa41ae8df	! t1_kref+0x4af0:   	xor	%o3, 0x8df, %l2
	.word	0xb5a01917	! t1_kref+0x4af4:   	fitod	%f23, %f26
	.word	0xab2ae00b	! t1_kref+0x4af8:   	sll	%o3, 0xb, %l5
	.word	0x93b5049a	! t1_kref+0x4afc:   	fcmple32	%f20, %f26, %o1
	.word	0x30800008	! t1_kref+0x4b00:   	ba,a	_kref+0x4b20
	.word	0xe3b8a0c0	! t1_kref+0x4b04:   	stda	%f48, [%g2 + 0xc0]%asi
	.word	0xaa328009	! t1_kref+0x4b08:   	orn	%o2, %o1, %l5
	.word	0x929ae073	! t1_kref+0x4b0c:   	xorcc	%o3, 0x73, %o1
	.word	0xf9200018	! t1_kref+0x4b10:   	st	%f28, [%g0 + %i0]
	.word	0xa5a9003a	! t1_kref+0x4b14:   	fmovsl	%fcc0, %f26, %f18
	.word	0x93418000	! t1_kref+0x4b18:   	mov	%fprs, %o1
	.word	0xea4e4000	! t1_kref+0x4b1c:   	ldsb	[%i1], %l5
	.word	0xa9326003	! t1_kref+0x4b20:   	srl	%o1, 0x3, %l4
	.word	0xbba018d0	! t1_kref+0x4b24:   	fdtos	%f16, %f29
	.word	0xadb68eda	! t1_kref+0x4b28:   	fornot2	%f26, %f26, %f22
	.word	0x3b800005	! t1_kref+0x4b2c:   	fble,a	_kref+0x4b40
	.word	0xf76e7fe0	! t1_kref+0x4b30:   	prefetch	%i1 - 0x20, 27
	.word	0x22800006	! t1_kref+0x4b34:   	be,a	_kref+0x4b4c
	.word	0xad3aa012	! t1_kref+0x4b38:   	sra	%o2, 0x12, %l6
	.word	0x38800003	! t1_kref+0x4b3c:   	bgu,a	_kref+0x4b48
	.word	0xac9aa390	! t1_kref+0x4b40:   	xorcc	%o2, 0x390, %l6
	.word	0xa9b78a3a	! t1_kref+0x4b44:   	fpadd16s	%f30, %f26, %f20
	.word	0xa9b24149	! t1_kref+0x4b48:   	edge32l	%o1, %o1, %l4
	.word	0xd630a036	! t1_kref+0x4b4c:   	sth	%o3, [%g2 + 0x36]
	.word	0xab400000	! t1_kref+0x4b50:   	mov	%y, %l5
	.word	0xa944c000	! t1_kref+0x4b54:   	mov	%gsr, %l4
	.word	0x86102002	! t1_kref+0x4b58:   	mov	0x2, %g3
	.word	0x32800000	! t1_kref+0x4b5c:   	bne,a	_kref+0x4b5c
	.word	0x86a0e001	! t1_kref+0x4b60:   	subcc	%g3, 1, %g3
	.word	0xd6760000	! t1_kref+0x4b64:   	stx	%o3, [%i0]
	.word	0xb3a00138	! t1_kref+0x4b68:   	fabss	%f24, %f25
	.word	0xae1b000a	! t1_kref+0x4b6c:   	xor	%o4, %o2, %l7
	.word	0xd620a00c	! t1_kref+0x4b70:   	st	%o3, [%g2 + 0xc]
	.word	0xb5a50956	! t1_kref+0x4b74:   	fmuld	%f20, %f22, %f26
	.word	0x81ae8adc	! t1_kref+0x4b78:   	fcmped	%fcc0, %f26, %f28
	.word	0x933a600e	! t1_kref+0x4b7c:   	sra	%o1, 0xe, %o1
	.word	0xada588d4	! t1_kref+0x4b80:   	fsubd	%f22, %f20, %f22
	.word	0xe800a03c	! t1_kref+0x4b84:   	ld	[%g2 + 0x3c], %l4
	.word	0xf120a004	! t1_kref+0x4b88:   	st	%f24, [%g2 + 4]
	.word	0xd46e2016	! t1_kref+0x4b8c:   	ldstub	[%i0 + 0x16], %o2
	.word	0xb1a01897	! t1_kref+0x4b90:   	fitos	%f23, %f24
	.word	0x22480003	! t1_kref+0x4b94:   	be,a,pt	%icc, _kref+0x4ba0
	.word	0x92fac00a	! t1_kref+0x4b98:   	sdivcc	%o3, %o2, %o1
	.word	0xaed33a20	! t1_kref+0x4b9c:   	umulcc	%o4, -0x5e0, %l7
	.word	0xa7a01a34	! t1_kref+0x4ba0:   	fstoi	%f20, %f19
	sethi	%hi(2f), %o7
	.word	0xe40be3e4	! t1_kref+0x4ba8:   	ldub	[%o7 + 0x3e4], %l2
	.word	0xa41ca00c	! t1_kref+0x4bac:   	xor	%l2, 0xc, %l2
	.word	0xe42be3e4	! t1_kref+0x4bb0:   	stb	%l2, [%o7 + 0x3e4]
	.word	0x81dbe3e4	! t1_kref+0x4bb4:   	flush	%o7 + 0x3e4
!	.word	0x21bd5d0e	! t1_kref+0x4bb8:   	fbn,a	SYM(t1_subr3)
	   	fbn,a	SYM(t1_subr3)
	.word	0x9f414000	! t1_kref+0x4bbc:   	mov	%pc, %o7
	.word	0xec6e8019	! t1_kref+0x4bc0:   	ldstub	[%i2 + %i1], %l6
	.word	0xa6ab000a	! t1_kref+0x4bc4:   	andncc	%o4, %o2, %l3
	.word	0xe808a02c	! t1_kref+0x4bc8:   	ldub	[%g2 + 0x2c], %l4
	.word	0xa7a789b7	! t1_kref+0x4bcc:   	fdivs	%f30, %f23, %f19
	.word	0x901a4009	! t1_kref+0x4bd0:   	xor	%o1, %o1, %o0
	.word	0xe4c71018	! t1_kref+0x4bd4:   	ldswa	[%i4 + %i0]0x80, %l2
	.word	0x2f800008	! t1_kref+0x4bd8:   	fbu,a	_kref+0x4bf8
	.word	0xa6b2800c	! t1_kref+0x4bdc:   	orncc	%o2, %o4, %l3
	.word	0xaaab304b	! t1_kref+0x4be0:   	andncc	%o4, -0xfb5, %l5
2:	.word	0xada5883c	! t1_kref+0x4be4:   	fadds	%f22, %f28, %f22
	.word	0xe808a02e	! t1_kref+0x4be8:   	ldub	[%g2 + 0x2e], %l4
	.word	0x31800007	! t1_kref+0x4bec:   	fba,a	_kref+0x4c08
	.word	0xb9a01a39	! t1_kref+0x4bf0:   	fstoi	%f25, %f28
	.word	0xadb48d94	! t1_kref+0x4bf4:   	fxor	%f18, %f20, %f22
	.word	0xb9b60e58	! t1_kref+0x4bf8:   	fxnor	%f24, %f24, %f28
	.word	0x25480001	! t1_kref+0x4bfc:   	fblg,a,pt	%fcc0, _kref+0x4c00
	.word	0x909a4009	! t1_kref+0x4c00:   	xorcc	%o1, %o1, %o0
	.word	0xf93e2008	! t1_kref+0x4c04:   	std	%f28, [%i0 + 8]
	.word	0xc36e6018	! t1_kref+0x4c08:   	prefetch	%i1 + 0x18, 1
	.word	0xe64e4000	! t1_kref+0x4c0c:   	ldsb	[%i1], %l3
	.word	0xaa7a800a	! t1_kref+0x4c10:   	sdiv	%o2, %o2, %l5
	.word	0xa1a70856	! t1_kref+0x4c14:   	faddd	%f28, %f22, %f16
	.word	0x25800008	! t1_kref+0x4c18:   	fblg,a	_kref+0x4c38
	.word	0x93b48458	! t1_kref+0x4c1c:   	fcmpne16	%f18, %f24, %o1
	.word	0xb1b60f92	! t1_kref+0x4c20:   	for	%f24, %f18, %f24
	.word	0x110e95c6	! t1_kref+0x4c24:   	sethi	%hi(0x3a571800), %o0
	.word	0x81df400b	! t1_kref+0x4c28:   	flush	%i5 + %o3
	.word	0xaec2c009	! t1_kref+0x4c2c:   	addccc	%o3, %o1, %l7
	.word	0xd430a026	! t1_kref+0x4c30:   	sth	%o2, [%g2 + 0x26]
	.word	0xeb6e401c	! t1_kref+0x4c34:   	prefetch	%i1 + %i4, 21
	.word	0xb1a00035	! t1_kref+0x4c38:   	fmovs	%f21, %f24
	.word	0xf9be5a1a	! t1_kref+0x4c3c:   	stda	%f28, [%i1 + %i2]0xd0
	.word	0xeb68a04f	! t1_kref+0x4c40:   	prefetch	%g2 + 0x4f, 21
	.word	0xbda5083e	! t1_kref+0x4c44:   	fadds	%f20, %f30, %f30
	.word	0x921ac00a	! t1_kref+0x4c48:   	xor	%o3, %o2, %o1
	.word	0xc168a001	! t1_kref+0x4c4c:   	prefetch	%g2 + 1, 0
	.word	0xd628a025	! t1_kref+0x4c50:   	stb	%o3, [%g2 + 0x25]
	sethi	%hi(1f), %o7
	jmpl	%o7+%lo(1f), %g1
	.empty
	.word	0xd436601e	! t1_kref+0x4c5c:   	sth	%o2, [%i1 + 0x1e]
	.word	0xa940c000	! t1_kref+0x4c60:   	mov	%asi, %l4
	.word	0xadb68cb4	! t1_kref+0x4c64:   	fandnot2s	%f26, %f20, %f22
1:	.word	0xd89e5000	! t1_kref+0x4c68:   	ldda	[%i1]0x80, %o4
	.word	0xaa0a742d	! t1_kref+0x4c6c:   	and	%o1, -0xbd3, %l5
	.word	0x81ac8a5a	! t1_kref+0x4c70:   	fcmpd	%fcc0, %f18, %f26
	.word	0xb9a00535	! t1_kref+0x4c74:   	fsqrts	%f21, %f28
	.word	0xabb70e7c	! t1_kref+0x4c78:   	fxnors	%f28, %f28, %f21
	.word	0x3a800007	! t1_kref+0x4c7c:   	bcc,a	_kref+0x4c98
	.word	0xf520a034	! t1_kref+0x4c80:   	st	%f26, [%g2 + 0x34]
	.word	0xd24e8018	! t1_kref+0x4c84:   	ldsb	[%i2 + %i0], %o1
	.word	0xf5ee501b	! t1_kref+0x4c88:   	prefetcha	%i1 + %i3, 26
	.word	0xb9b50a5c	! t1_kref+0x4c8c:   	fpadd32	%f20, %f28, %f28
	.word	0x001fffff	! t1_kref+0x4c90:   	illtrap	0x1fffff
	.word	0xb9a01897	! t1_kref+0x4c94:   	fitos	%f23, %f28
	.word	0xa3a0053c	! t1_kref+0x4c98:   	fsqrts	%f28, %f17
	.word	0xb1a00034	! t1_kref+0x4c9c:   	fmovs	%f20, %f24
	.word	0xd620a004	! t1_kref+0x4ca0:   	st	%o3, [%g2 + 4]
	.word	0xb5a608b1	! t1_kref+0x4ca4:   	fsubs	%f24, %f17, %f26
	.word	0x2f800008	! t1_kref+0x4ca8:   	fbu,a	_kref+0x4cc8
	.word	0xae1b3707	! t1_kref+0x4cac:   	xor	%o4, -0x8f9, %l7
	.word	0x37800004	! t1_kref+0x4cb0:   	fbge,a	_kref+0x4cc0
	.word	0xe41e7fe0	! t1_kref+0x4cb4:   	ldd	[%i1 - 0x20], %l2
	.word	0xb9b00fc0	! t1_kref+0x4cb8:   	fone	%f28
	.word	0xd830a006	! t1_kref+0x4cbc:   	sth	%o4, [%g2 + 6]
	.word	0xd828a024	! t1_kref+0x4cc0:   	stb	%o4, [%g2 + 0x24]
	.word	0xa6dabc04	! t1_kref+0x4cc4:   	smulcc	%o2, -0x3fc, %l3
	.word	0xbda01035	! t1_kref+0x4cc8:   	fstox	%f21, %f30
	.word	0xaba00537	! t1_kref+0x4ccc:   	fsqrts	%f23, %f21
	.word	0xa5b28200	! t1_kref+0x4cd0:   	array8	%o2, %g0, %l2
	.word	0xd0162006	! t1_kref+0x4cd4:   	lduh	[%i0 + 6], %o0
	.word	0xb7a5083d	! t1_kref+0x4cd8:   	fadds	%f20, %f29, %f27
	.word	0xab2ae00d	! t1_kref+0x4cdc:   	sll	%o3, 0xd, %l5
	.word	0xe4680019	! t1_kref+0x4ce0:   	ldstub	[%g0 + %i1], %l2
	.word	0xa80aa358	! t1_kref+0x4ce4:   	and	%o2, 0x358, %l4
	.word	0xa540c000	! t1_kref+0x4ce8:   	mov	%asi, %l2
	.word	0xa5b300ab	! t1_kref+0x4cec:   	edge16n	%o4, %o3, %l2
	.word	0xb5a0191e	! t1_kref+0x4cf0:   	fitod	%f30, %f26
	.word	0x20480001	! t1_kref+0x4cf4:   	bn,a,pt	%icc, _kref+0x4cf8
	.word	0xed9f5018	! t1_kref+0x4cf8:   	ldda	[%i5 + %i0]0x80, %f22
	.word	0xa45a800a	! t1_kref+0x4cfc:   	smul	%o2, %o2, %l2
	.word	0xaedb30a2	! t1_kref+0x4d00:   	smulcc	%o4, -0xf5e, %l7
	.word	0xacd24009	! t1_kref+0x4d04:   	umulcc	%o1, %o1, %l6
	.word	0xa5a01912	! t1_kref+0x4d08:   	fitod	%f18, %f18
	.word	0x81dec01d	! t1_kref+0x4d0c:   	flush	%i3 + %i5
	.word	0x9232a66d	! t1_kref+0x4d10:   	orn	%o2, 0x66d, %o1
	.word	0xd6360000	! t1_kref+0x4d14:   	sth	%o3, [%i0]
	.word	0xb1b60d14	! t1_kref+0x4d18:   	fandnot1	%f24, %f20, %f24
	.word	0xe8567ffc	! t1_kref+0x4d1c:   	ldsh	[%i1 - 4], %l4
	sethi	%hi(2f), %o7
	.word	0xe40be148	! t1_kref+0x4d24:   	ldub	[%o7 + 0x148], %l2
	.word	0xa41ca00c	! t1_kref+0x4d28:   	xor	%l2, 0xc, %l2
	.word	0xe42be148	! t1_kref+0x4d2c:   	stb	%l2, [%o7 + 0x148]
	.word	0x81dbe148	! t1_kref+0x4d30:   	flush	%o7 + 0x148
	.word	0xb9b68f56	! t1_kref+0x4d34:   	fornot1	%f26, %f22, %f28
	.word	0xa1b60918	! t1_kref+0x4d38:   	faligndata	%f24, %f24, %f16
	.word	0x2e800004	! t1_kref+0x4d3c:   	bvs,a	_kref+0x4d4c
	.word	0xb7a789bd	! t1_kref+0x4d40:   	fdivs	%f30, %f29, %f27
	.word	0xd828a02e	! t1_kref+0x4d44:   	stb	%o4, [%g2 + 0x2e]
2:	.word	0xa4f27aa6	! t1_kref+0x4d48:   	udivcc	%o1, -0x55a, %l2
	.word	0x81ae8a58	! t1_kref+0x4d4c:   	fcmpd	%fcc0, %f26, %f24
	.word	0x81ad8a54	! t1_kref+0x4d50:   	fcmpd	%fcc0, %f22, %f20
	.word	0xa9a60836	! t1_kref+0x4d54:   	fadds	%f24, %f22, %f20
	.word	0x2e800008	! t1_kref+0x4d58:   	bvs,a	_kref+0x4d78
	.word	0xb5b5891e	! t1_kref+0x4d5c:   	faligndata	%f22, %f30, %f26
	.word	0xa90b3ca3	! t1_kref+0x4d60:   	tsubcc	%o4, -0x35d, %l4
	.word	0x9292400b	! t1_kref+0x4d64:   	orcc	%o1, %o3, %o1
	call	SYM(t1_subr2)
	.word	0xe64e6004	! t1_kref+0x4d6c:   	ldsb	[%i1 + 4], %l3
	.word	0xafb4041a	! t1_kref+0x4d70:   	fcmple16	%f16, %f26, %l7
	.word	0xa7a6c83d	! t1_kref+0x4d74:   	fadds	%f27, %f29, %f19
	.word	0xf9262000	! t1_kref+0x4d78:   	st	%f28, [%i0]
	.word	0xa5a00556	! t1_kref+0x4d7c:   	fsqrtd	%f22, %f18
	.word	0xadb60518	! t1_kref+0x4d80:   	fcmpgt16	%f24, %f24, %l6
	.word	0xa4da68cd	! t1_kref+0x4d84:   	smulcc	%o1, 0x8cd, %l2
	.word	0xb1a709da	! t1_kref+0x4d88:   	fdivd	%f28, %f26, %f24
	.word	0xd9e6500a	! t1_kref+0x4d8c:   	casa	[%i1]0x80, %o2, %o4
	.word	0x8143e01b	! t1_kref+0x4d90:   	membar	0x1b
	.word	0xa1a00558	! t1_kref+0x4d94:   	fsqrtd	%f24, %f16
	.word	0xe9be188a	! t1_kref+0x4d98:   	stda	%f20, [%i0 + %o2]0xc4
	.word	0x27800004	! t1_kref+0x4d9c:   	fbul,a	_kref+0x4dac
	.word	0xa69a8009	! t1_kref+0x4da0:   	xorcc	%o2, %o1, %l3
	.word	0xfd3e6008	! t1_kref+0x4da4:   	std	%f30, [%i1 + 8]
	.word	0xf320a02c	! t1_kref+0x4da8:   	st	%f25, [%g2 + 0x2c]
	.word	0x81af8ada	! t1_kref+0x4dac:   	fcmped	%fcc0, %f30, %f26
	.word	0xd420a01c	! t1_kref+0x4db0:   	st	%o2, [%g2 + 0x1c]
	.word	0xb9a00535	! t1_kref+0x4db4:   	fsqrts	%f21, %f28
	.word	0xd43e0000	! t1_kref+0x4db8:   	std	%o2, [%i0]
	.word	0xef20a00c	! t1_kref+0x4dbc:   	st	%f23, [%g2 + 0xc]
	.word	0xa602f237	! t1_kref+0x4dc0:   	add	%o3, -0xdc9, %l3
	.word	0x30480003	! t1_kref+0x4dc4:   	ba,a,pt	%icc, _kref+0x4dd0
	.word	0xae7a400b	! t1_kref+0x4dc8:   	sdiv	%o1, %o3, %l7
	.word	0xafa64931	! t1_kref+0x4dcc:   	fmuls	%f25, %f17, %f23
	.word	0x2b800004	! t1_kref+0x4dd0:   	fbug,a	_kref+0x4de0
	.word	0xc168a00d	! t1_kref+0x4dd4:   	prefetch	%g2 + 0xd, 0
	.word	0xd08e9040	! t1_kref+0x4dd8:   	lduba	[%i2]0x82, %o0
	.word	0xe93e3fe0	! t1_kref+0x4ddc:   	std	%f20, [%i0 - 0x20]
	.word	0xd24e7ff5	! t1_kref+0x4de0:   	ldsb	[%i1 - 0xb], %o1
	.word	0xb9a01911	! t1_kref+0x4de4:   	fitod	%f17, %f28
	.word	0x3a480005	! t1_kref+0x4de8:   	bcc,a,pt	%icc, _kref+0x4dfc
	.word	0xb1b58d40	! t1_kref+0x4dec:   	fnot1	%f22, %f24
	.word	0xb7b50fb5	! t1_kref+0x4df0:   	fors	%f20, %f21, %f27
	.word	0xf76e7ff8	! t1_kref+0x4df4:   	prefetch	%i1 - 8, 27
	.word	0xa492c00c	! t1_kref+0x4df8:   	orcc	%o3, %o4, %l2
	.word	0xac2aaf0d	! t1_kref+0x4dfc:   	andn	%o2, 0xf0d, %l6
	.word	0xaa3a8009	! t1_kref+0x4e00:   	xnor	%o2, %o1, %l5
	.word	0xa4f2eb4e	! t1_kref+0x4e04:   	udivcc	%o3, 0xb4e, %l2
	sethi	%hi(1f), %o7
	jmpl	%o7+%lo(1f), %g1
	.empty
	.word	0xaba4c83d	! t1_kref+0x4e10:   	fadds	%f19, %f29, %f21
	.word	0x26800006	! t1_kref+0x4e14:   	bl,a	_kref+0x4e2c
	.word	0xaf3a600d	! t1_kref+0x4e18:   	sra	%o1, 0xd, %l7
	.word	0x01000000	! t1_kref+0x4e1c:   	nop
	.word	0x01000000	! t1_kref+0x4e20:   	nop
	.word	0x01000000	! t1_kref+0x4e24:   	nop
1:	.word	0x01000000	! t1_kref+0x4e28:   	nop
	call	SYM(_kaos_done)
	.word	0x01000000	! t1_kref+0x4e30:   	nop
	KGLOBAL(t1_ktbl_end)
t1_ktbl_end:
t1_ktbl_page_end:

KTEXT_MODULE(t1_module_subr0, 0x418a4000)
.seg "text"
t1_subr0_page_begin:
	.skip 8188
.global _t1_subr0; ENTRY(t1_subr0)
	.word	0xa6844012	! t1_subr0+0x0:   	addcc	%l1, %l2, %l3
	.word	0x81c3e008	! t1_subr0+0x4:   	retl
	.word	0xaa64c014	! t1_subr0+0x8:   	subc	%l3, %l4, %l5
t1_subr0_page_end:

KTEXT_MODULE(t1_module_subr1, 0x4851e000)
.seg "text"
t1_subr1_page_begin:
	.skip 8188
.global _t1_subr1; ENTRY(t1_subr1)
	.word	0x9de3bfa0	! t1_subr1+0x0:   	save	%sp, -0x60, %sp
	.word	0xb29eaa5a	! t1_subr1+0x4:   	xorcc	%i2, 0xa5a, %i1
	.word	0x81c7e008	! t1_subr1+0x8:   	ret
	.word	0xa7ee6001	! t1_subr1+0xc:   	restore	%i1, 1, %l3
t1_subr1_page_end:

KTEXT_MODULE(t1_module_subr2, 0x7aaca000)
.seg "text"
t1_subr2_page_begin:
	.skip 8188
.global _t1_subr2; ENTRY(t1_subr2)
	.word	0x9de3bfa0	! t1_subr2+0x0:   	save	%sp, -0x60, %sp
	.word	0xb2066001	! t1_subr2+0x4:   	add	%i1, 1, %i1
	.word	0x81c7e008	! t1_subr2+0x8:   	ret
	.word	0xa3ee6001	! t1_subr2+0xc:   	restore	%i1, 1, %l1
t1_subr2_page_end:

KTEXT_MODULE(t1_module_subr3, 0x4830a000)
.seg "text"
t1_subr3_page_begin:
	.skip 8176
.global _t1_subr3; ENTRY(t1_subr3)
	.word	0x90056001	! t1_subr3+0x0:   	add	%l5, 1, %o0
	.word	0x9de3bfa0	! t1_subr3+0x4:   	save	%sp, -0x60, %sp
#if defined(KAOS_SIMULATION)
	add	%i0, 12, %i0
#else
	.word	0x90062001	! t1_subr3+0x8:   	add	%i0, 1, %o0
	.word	0x9de3bfa0	! t1_subr3+0xc:   	save	%sp, -0x60, %sp
	.word	0x90062001	! t1_subr3+0x10:   	add	%i0, 1, %o0
	.word	0x9de3bfa0	! t1_subr3+0x14:   	save	%sp, -0x60, %sp
	.word	0x90062001	! t1_subr3+0x18:   	add	%i0, 1, %o0
	.word	0x9de3bfa0	! t1_subr3+0x1c:   	save	%sp, -0x60, %sp
	.word	0x90062001	! t1_subr3+0x20:   	add	%i0, 1, %o0
	.word	0x9de3bfa0	! t1_subr3+0x24:   	save	%sp, -0x60, %sp
	.word	0x90062001	! t1_subr3+0x28:   	add	%i0, 1, %o0
	.word	0x9de3bfa0	! t1_subr3+0x2c:   	save	%sp, -0x60, %sp
	.word	0x90062001	! t1_subr3+0x30:   	add	%i0, 1, %o0
	.word	0x9de3bfa0	! t1_subr3+0x34:   	save	%sp, -0x60, %sp
	.word	0xb1ee2001	! t1_subr3+0x38:   	restore	%i0, 1, %i0
	.word	0xb1ee2001	! t1_subr3+0x3c:   	restore	%i0, 1, %i0
	.word	0xb1ee2001	! t1_subr3+0x40:   	restore	%i0, 1, %i0
	.word	0xb1ee2001	! t1_subr3+0x44:   	restore	%i0, 1, %i0
	.word	0xb1ee2001	! t1_subr3+0x48:   	restore	%i0, 1, %i0
	.word	0xb1ee2001	! t1_subr3+0x4c:   	restore	%i0, 1, %i0
#endif
	.word	0x81c7e008	! t1_subr3+0x50:   	ret
	.word	0xadee2001	! t1_subr3+0x54:   	restore	%i0, 1, %l6
t1_subr3_page_end:
!
!  Total operations: 4860  
!
!  Operation frequencies
!
!  name               exp    obs
!  ldsb              1.22   1.42
!  ldub              0.06   0.02
!  ldsh              0.12   0.10
!  lduh              0.55   0.43
!  ld                0.98   1.05
!  ldd               0.61   0.72
!  swap              0.03   0.02
!  ldstub            0.43   0.49
!  stb               0.54   0.41
!  sth               0.72   0.91
!  st                0.02   0.02
!  std               1.05   1.01
!  add               1.28   1.38
!  addcc             0.27   0.31
!  addx              0.01   0.02
!  addxcc            0.74   0.78
!  taddcc            0.05   0.04
!  taddcctv          0.23   0.23
!  sub               0.40   0.51
!  subcc             0.12   0.10
!  subx              0.23   0.29
!  subxcc            0.03   0.02
!  tsubcc            0.19   0.23
!  tsubcctv          0.07   0.08
!  mulscc            0.40   0.56
!  and               0.89   0.78
!  andcc             0.16   0.14
!  andn              1.24   1.40
!  andncc            1.05   1.26
!  or                0.33   0.25
!  orcc              1.19   1.01
!  orn               0.86   0.78
!  orncc             1.37   1.60
!  xor               1.42   1.28
!  xorcc             1.39   1.48
!  xnor              1.24   1.30
!  xnorcc            0.46   0.56
!  sll               0.80   0.76
!  srl               0.32   0.29
!  sra               1.32   1.38
!  unimp             0.23   0.29
!  umul              0.19   0.19
!  smul              0.58   0.64
!  udiv              0.58   0.62
!  sdiv              0.97   0.84
!  umulcc            1.46   1.30
!  smulcc            0.84   0.99
!  udivcc            0.57   0.74
!  sdivcc            0.66   0.86
!  rdy               1.30   1.32
!  wry               0.08   0.14
!  bicc              0.85   1.01
!  sethi             0.41   0.35
!  jmpl              1.22   1.11
!  call              0.68   0.66
!  ticc              0.00   0.00
!  flush             0.47   0.51
!  save              0.58   0.56
!  restore           0.71   0.00
!  stbar             0.44   0.53
!  ldf               0.69   0.82
!  lddf              0.10   0.14
!  stf               1.44   1.42
!  stdf              1.45   1.28
!  fadds             0.46   0.62
!  fsubs             0.36   0.45
!  fmuls             0.85   0.82
!  fdivs             0.78   0.74
!  faddd             1.22   0.95
!  fsubd             1.04   0.86
!  fmuld             0.25   0.37
!  fdivd             0.95   0.99
!  faddq             0.00   0.00
!  fsubq             0.00   0.00
!  fmulq             0.00   0.00
!  fdivq             0.00   0.00
!  fsmuld            1.14   1.34
!  fdmulq            0.00   0.00
!  fitos             1.43   1.54
!  fitod             1.40   1.58
!  fitoq             0.00   0.00
!  fstoi             1.17   0.93
!  fstod             0.34   0.43
!  fstoq             0.00   0.00
!  fdtoi             0.33   0.39
!  fdtos             0.45   0.62
!  fdtoq             0.00   0.00
!  fqtoi             0.00   0.00
!  fqtos             0.00   0.00
!  fqtod             0.00   0.00
!  fmovs             1.03   1.11
!  fnegs             0.19   0.10
!  fabss             0.83   0.60
!  fsqrts            0.92   0.93
!  fsqrtd            1.63   1.63
!  fsqrtq            0.00   0.00
!  fcmps             0.28   0.35
!  fcmpd             0.97   0.93
!  fcmpq             0.00   0.00
!  fcmpes            0.81   0.60
!  fcmped            0.48   0.41
!  fcmpeq            0.00   0.00
!  fbfcc             1.89   2.14
!  ldfsr             0.24   0.00
!  stfsr             0.19   0.12
!  loop              1.48   0.88
!  offset            0.18   0.33
!  area              0.22   0.25
!  target            0.29   0.27
!  goto              0.30   0.21
!  sigsegv           0.11   0.14
!  sigbus            0.28   0.31
!  imodify           0.11   0.10
!  ldfsr_offset      0.08   0.00
!  fpattern          0.18   0.29
!  lbranch           0.16   0.14
!  shmld             2.48   2.41
!  shmst             4.84   5.16
!  shmpf             1.25   1.46
!  shmswap           0.05   0.04
!  shmblkld          0.10   0.00
!  shmblkst          0.44   0.10
!  shmblkchk         0.26   0.19
!  hack_restore      0.00   0.00
!  demap_random_va   0.00   0.00
!  demap_area        0.00   0.00
!  demap_ktbl_text   0.00   0.00
!  demap_ktbl_data   0.00   0.00
!  demap_subr        0.00   0.00
!  demap_reg         0.00   0.00
!  demap_stack       0.00   0.00
!  ro_area           0.00   0.00
!  ro_ktbl_data      0.00   0.00
!  ro_reg            0.00   0.00
!  ro_stack          0.00   0.00
!  set_window        0.00   0.00
!  set_va_wp         0.00   0.00
!  set_pa_wp         0.00   0.00
!  set_softint       0.00   0.00
!  ie_toggle         0.00   0.00
!  set_pil           0.00   0.00
!  set_tso           0.00   0.00
!  set_pso           0.00   0.00
!  set_rmo           0.00   0.00
!  cflush            0.00   0.00
!  return            0.00   0.00
!  casa              0.14   0.23
!  rdasi             0.13   0.19
!  wrasi             0.21   0.16
!  bpcc              2.14   2.00
!  fbpfcc            1.76   1.63
!  fmovscc           0.14   0.10
!  fmovdcc           0.03   0.00
!  fmovqcc           0.00   0.00
!  movcc             0.16   0.23
!  flushw            0.07   0.02
!  membar            0.25   0.21
!  prefetch          1.49   1.26
!  rdpc              0.03   0.00
!  ldqf              0.00   0.00
!  stqf              0.00   0.00
!  ldfa              0.21   0.14
!  lddfa             0.13   0.21
!  ldqfa             0.00   0.00
!  ldsba             0.13   0.12
!  ldsha             0.20   0.29
!  lduba             0.24   0.29
!  lduha             0.18   0.06
!  lda               0.00   0.00
!  ldda              0.26   0.10
!  ldstuba           0.10   0.19
!  prefetcha         0.82   0.97
!  stfa              0.18   0.19
!  stdfa             0.03   0.02
!  stqfa             0.00   0.00
!  stba              0.07   0.12
!  stha              0.01   0.02
!  sta               0.04   0.02
!  stda              0.12   0.08
!  swapa             0.01   0.02
!  fmovd             0.28   0.27
!  fnegd             0.25   0.14
!  fabsd             0.23   0.21
!  fstox             0.04   0.04
!  fdtox             0.22   0.23
!  fxtos             0.08   0.08
!  fxtod             0.16   0.10
!  lds               0.10   0.14
!  ldsa              0.09   0.04
!  ldx               0.12   0.10
!  ldxa              0.07   0.02
!  nofault           0.28   0.35
!  rdgsr             0.20   0.16
!  wrgsr             0.26   0.16
!  fpadd16           0.09   0.04
!  fpadd16s          0.07   0.02
!  fpadd32           0.05   0.08
!  fpadd32s          0.21   0.19
!  fpsub16           0.16   0.16
!  fpsub16s          0.01   0.04
!  fpsub32           0.14   0.12
!  fpsub32s          0.03   0.02
!  fpack16           0.11   0.16
!  fpack32           0.13   0.14
!  fpackfix          0.14   0.19
!  fexpand           0.20   0.19
!  fpmerge           0.13   0.16
!  fmul8x16          0.00   0.00
!  fmul8x16au        0.03   0.02
!  fmul8x16al        0.25   0.21
!  fmul8sux16        0.14   0.14
!  fmul8ulx16        0.08   0.04
!  fmuld8sux16       0.24   0.23
!  fmuld8ulx16       0.00   0.00
!  alignaddr         0.08   0.04
!  alignaddrl        0.10   0.04
!  faligndata        0.25   0.27
!  fzero             0.20   0.23
!  fzeros            0.20   0.19
!  fone              0.16   0.10
!  fones             0.19   0.25
!  fsrc1             0.09   0.16
!  fsrc1s            0.03   0.06
!  fsrc2             0.10   0.02
!  fsrc2s            0.29   0.39
!  fnot1             0.08   0.12
!  fnot1s            0.04   0.00
!  fnot2             0.04   0.10
!  fnot2s            0.09   0.08
!  for               0.25   0.27
!  fors              0.10   0.14
!  fnor              0.20   0.12
!  fnors             0.00   0.00
!  fand              0.07   0.00
!  fands             0.02   0.00
!  fnand             0.13   0.31
!  fnands            0.08   0.04
!  fxor              0.21   0.23
!  fxors             0.22   0.27
!  fxnor             0.14   0.12
!  fxnors            0.25   0.23
!  fornot1           0.17   0.14
!  fornot1s          0.17   0.23
!  fornot2           0.23   0.12
!  fornot2s          0.23   0.12
!  fandnot1          0.18   0.19
!  fandnot1s         0.11   0.04
!  fandnot2          0.10   0.08
!  fandnot2s         0.14   0.27
!  fcmpgt16          0.28   0.43
!  fcmpgt32          0.09   0.12
!  fcmple16          0.03   0.06
!  fcmple32          0.17   0.29
!  fcmpne16          0.24   0.19
!  fcmpne32          0.04   0.06
!  fcmpeq16          0.16   0.21
!  fcmpeq32          0.14   0.16
!  edge8             0.27   0.27
!  edge8l            0.04   0.08
!  edge16            0.17   0.14
!  edge16l           0.03   0.02
!  edge32            0.27   0.25
!  edge32l           0.17   0.08
!  pdist             0.08   0.06
!  partial_st8       0.00   0.00
!  partial_st16      0.05   0.08
!  partial_st32      0.11   0.27
!  short_st8         0.18   0.21
!  short_st16        0.26   0.31
!  short_ld8         0.15   0.14
!  short_ld16        0.01   0.00
!  blkld             0.26   0.00
!  blkst             0.00   0.00
!  blkld_offset      0.05   0.00
!  blkst_offset      0.13   0.00
!  blk_check         0.26   0.29
!  casxa             0.16   0.29
!  rdccr             0.00   0.00
!  rdfprs            0.24   0.37
!  wrccr             0.02   0.04
!  popc              0.02   0.00
!  wrfprs            0.07   0.04
!  stx               0.15   0.14
!  stxa              0.01   0.00
!  cflush            0.00   0.00
!  array8            0.15   0.21
!  array16           0.03   0.08
!  array32           0.24   0.29
!  edge8n            0.04   0.02
!  edge8ln           0.16   0.14
!  edge16n           0.21   0.27
!  edge16ln          0.04   0.02
!  edge32n           0.08   0.06
!  edge32ln          0.25   0.27
!  bmask             0.14   0.25
!  bshuffle          0.15   0.14
!  siam              0.06   0.04
!  fpadds16          0.00   0.00
!  fpadds16s         0.00   0.00
!  fpadds32          0.00   0.00
!  fpadds32s         0.00   0.00
!  fpsubs16          0.00   0.00
!  fpsubs16s         0.00   0.00
!  fpsubs32          0.00   0.00
!  fpsubs32s         0.00   0.00
!  fpadd64           0.00   0.00
!  fpsub64           0.00   0.00
!  fpmean16          0.00   0.00
!  fpchksm16         0.00   0.00
!  fshl16            0.00   0.00
!  fshrl16           0.00   0.00
!  fshl32            0.00   0.00
!  fshrl32           0.00   0.00
!  fshlas16          0.00   0.00
!  fshra16           0.00   0.00
!  fshlas32          0.00   0.00
!  fshra32           0.00   0.00
!  fpmovc8           0.00   0.00
!  fpmovc16          0.00   0.00
!  fpmovc32          0.00   0.00
!  fmergesp          0.00   0.00
!  fucmpgt8          0.00   0.00
!  fucmple8          0.00   0.00
!  fucmpne8          0.00   0.00
!  fucmpeq8          0.00   0.00
!  pdistn            0.00   0.00
!  lzd               0.00   0.00
!  addxc             0.00   0.00
!  addxccc           0.00   0.00
!  umulxhi           0.00   0.00
!  flcmps            0.00   0.00
!  flcmpd            0.00   0.00
!  sfabss            0.00   0.00
!  sfnegs            0.00   0.00
!  sfadds            0.00   0.00
!  sfsubs            0.00   0.00
!  sfmuls            0.00   0.00
!  sfitos            0.00   0.00
!  sfstoi            0.00   0.00
!  sfcmpeqs          0.00   0.00
!  sfcmpnes          0.00   0.00
!  sfcmpgts          0.00   0.00
!  sfcmples          0.00   0.00
!  fmadds            0.00   0.00
!  fmaddd            0.00   0.00
!  fmsubs            0.00   0.00
!  fmsubd            0.00   0.00
!  fnmsubs           0.00   0.00
!  fnmsubd           0.00   0.00
!  fnmadds           0.00   0.00
!  fnmaddd           0.00   0.00
!
KDATA_MODULE(t1_module_offset_table, 0x45c38000)
.seg "data"
t1_offset_table_start:
t1_offset_table_size:	.word	0x00000008
t1_offset_table:
	.word	0x00000018
	.word	0x00000000
	.word	0xffffffe8
	.word	0x00000008
	.word	0x00000010
	.word	0xfffffff8
	.word	0xffffffe0
	.word	0xfffffff0
t1_offset_table_end:

t1_ldfsr_offset_table_start:
t1_ldfsr_offset_table_size:	.word	0x00000000
t1_ldfsr_offset_table:
t1_ldfsr_offset_table_end:

t1_bld_offset_table_start:
t1_bld_offset_table_size:	.word	0x00000000
t1_bld_offset_table:
t1_bld_offset_table_end:

t1_bst_offset_table_start:
t1_bst_offset_table_size:	.word	0x00000000
t1_bst_offset_table:
t1_bst_offset_table_end:

.skip 8144	! page align

KDATA_MODULE(t1_module_data_in_regs, 0x5199e000)
.seg "data"
KGLOBAL(t1_data_in_regs)
t1_data_in_regs_start:
t1_data_in_regs:
	.word	0x7ff55d02          ! %f0
	.word	0x6232495a          ! %f1
	.word	0xd268c143          ! %f2
	.word	0xd12c8342          ! %f3
	.word	0xd3e79f35          ! %f4
	.word	0x30e5e224          ! %f5
	.word	0xc7f6d947          ! %f6
	.word	0xd2263b7c          ! %f7
	.word	0x04f208e5          ! %f8
	.word	0x7ae4a02b          ! %f9
	.word	0x37c957f6          ! %f10
	.word	0x479907be          ! %f11
	.word	0x8c5a54bb          ! %f12
	.word	0xfdb823ca          ! %f13
	.word	0x0581e817          ! %f14
	.word	0xdceac930          ! %f15
	.word	0x18d4dc4e          ! %f16
	.word	0xf8f0c64f          ! %f17
	.word	0x6faeb2ac          ! %f18
	.word	0xd0f4a86a          ! %f19
	.word	0xc31bf0c7          ! %f20
	.word	0x7b69afcc          ! %f21
	.word	0x18d4222f          ! %f22
	.word	0x8f4a516e          ! %f23
	.word	0x2e1199c7          ! %f24
	.word	0x1557f62e          ! %f25
	.word	0x6c39161e          ! %f26
	.word	0x07247ad8          ! %f27
	.word	0xfa03de87          ! %f28
	.word	0xeb44198e          ! %f29
	.word	0x4d444aba          ! %f30
	.word	0xe2102c54          ! %f31
	.word	0x1189fd40          ! %f32
	.word	0xf82e71c7          ! %f33
	.word	0x57e1f90a          ! %f34
	.word	0x38a7784f          ! %f35
	.word	0xdcf334ce          ! %f36
	.word	0x98146148          ! %f37
	.word	0x3a54f326          ! %f38
	.word	0xb6af9cf0          ! %f39
	.word	0xada6048f          ! %f40
	.word	0x7115612a          ! %f41
	.word	0xbd46c0b1          ! %f42
	.word	0x4543c049          ! %f43
	.word	0x2f590691          ! %f44
	.word	0x0dd43a84          ! %f45
	.word	0x8a1e7fa6          ! %f46
	.word	0xb872bbc9          ! %f47
	.word	0x3ffcc7eb          ! %f48
	.word	0x18a200fe          ! %f49
	.word	0x51de8d58          ! %f50
	.word	0xc929aaf5          ! %f51
	.word	0xbac0436b          ! %f52
	.word	0x19c5a2a4          ! %f53
	.word	0x8c453bb3          ! %f54
	.word	0xebac3157          ! %f55
	.word	0xed0fe271          ! %f56
	.word	0xed0c20fc          ! %f57
	.word	0x0fed16c7          ! %f58
	.word	0xa176abb6          ! %f59
	.word	0x2009281a          ! %f60
	.word	0x30fac759          ! %f61
	.word	0x74ed7e87          ! %f62
	.word	0x7a75c086          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t1_kref+0x99c       ! %g1 (code pointer)
	.word	t1_data_in_shm_area ! %g2 (shared area pointer)
	.word	0xb42dd382          ! %g3 (loop index)
	.word	SYM(t1_subr0)       ! %g4 (jmpl target)
	.word	t1_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x393c7adc          ! %o0
	.word	0x529f26c0          ! %o1
	.word	0x74a8cfb9          ! %o2
	.word	0x619d4403          ! %o3
	.word	0xc3c4f0a2          ! %o4
	.word	0x57bf85fb          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0xcbdb6aa0          ! %l0
	.word	0xadbdf271          ! %l1
	.word	0xc44498cd          ! %l2
	.word	0x884203a2          ! %l3
	.word	0x3f303eff          ! %l4
	.word	0xe0843d2d          ! %l5
	.word	0xe35fdfa0          ! %l6
	.word	0xf5c5a138          ! %l7
	.word	t1_data_in_area0    ! %i0 (area pointer)
	.word	t1_data_in_area0    ! %i1 (area pointer)
	.word	0xffffffe6          ! %i2 (byte offset)
	.word	0xffffffec          ! %i3 (halfword offset)
	.word	0x00000014          ! %i4 (word offset)
	.word	0xfffffff0          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x504f7b43          ! %y
	.word	0x00000000          ! %icc (nzvc)
	.word	0x80000b21          ! %fsr
	.word	0x00000000          ! %gsr.mask
	.word	0x00000000          ! %gsr
	.word	0x000000e0          ! %asi
	.word	0x00000000          ! Integer overflow traps
	.word	0x00000000          ! Integer divide by zero traps
	.word	0x00000000          ! Integer divide > 52 bit dividend traps
	.word	0x00000000          ! Floating inexact traps
	.word	0x00000000          ! Floating divide by zero traps
	.word	0x00000000          ! Floating underflow traps
	.word	0x00000000          ! Floating overflow traps
	.word	0x00000000          ! Floating invalid traps
	.word	0x00000000          ! Floating other traps
	.word	0x00000000          ! Ticc traps
	.word	0x00000000          ! Unexpected SIGFPE traps
	.word	0x00000000          ! Unexpected SIGSEGV traps
	.word	0x00000000          ! Unexpected SIGBUS traps
	.word	0x00000000          ! Unexpected SIGILL traps
	.word	0x00000000          ! Expected SIGSEGV traps
	.word	0x00000000          ! Expected SIGBUS traps
	.word	0x00000000          ! UNIMP traps
	.word	0x00000000          ! ??
.global t1_data_in_mtbl_size; t1_data_in_mtbl_size:	.word	253
t1_data_in_regs_end:

.skip 7708	! page align

KDATA_MODULE(t1_module_data_in_stack, 0x44100000)
.seg "data"
KGLOBAL(t1_data_in_mtbl_size)
KGLOBAL(t1_data_in_mtbl)
KGLOBAL(t1_data_in_stack)
t1_data_in_stack_start:
	.word	0xe64b61ea
	.word	0xc61c10a7
	.word	0xc154c441
	.word	0x86720b52
	.word	0x5c464c62
	.word	0xee3f59d3
	.word	0xd927153d
	.word	0x190fedff
	.word	0xc7bcb9fa
	.word	0xf8a6c053
	.word	0x45951ed6
	.word	0x513880d7
	.word	0x514e7716
	.word	0xf76327f7
	.word	0x3ca92a95
	.word	0xd3bccb37
	.word	0xe10294bb
	.word	0xdf73bfdd
	.word	0x332edfd8
	.word	0xea73c614
	.word	0xf951cb40
	.word	0x36cfc114
	.word	0xaf50c79d
	.word	0x152bf543
	.word	0xc067d445
	.word	0x40faf381
	.word	0xed69b9a1
	.word	0x4546d0f4
	.word	0xbfcbefe4
	.word	0xe5631d06
	.word	0x94d786a9
	.word	0xfde2c37f
	.word	0x38f00926
	.word	0x7e02bee0
	.word	0x399d741e
	.word	0xc580bf63
	.word	0x11292db9
	.word	0xfda7c550
	.word	0x4d7a5cdf
	.word	0xc95eb18a
	.word	0xf08b4cdf
	.word	0x22030d7d
	.word	0x88ff8b52
	.word	0x869053d1
	.word	0x184d71a8
	.word	0x888fe598
	.word	0x2872a0bc
	.word	0xc57423c8
	.word	0xfdfaec62
	.word	0xbcb0eb41
	.word	0x9a161dd2
	.word	0x39ba81b5
	.word	0xe4091f50
	.word	0x9351ec28
	.word	0x41196090
	.word	0xf8113bdf
	.word	0x6db0e29b
	.word	0x2b34acf7
	.word	0xa32a2b48
	.word	0x7ae60a08
	.word	0xb665b385
	.word	0x9b08ba6f
	.word	0xf3af08fd
	.word	0xb5d6bd3a
	.word	0x643422e4
	.word	0x05cca8d1
	.word	0x485322f1
	.word	0x538e27c6
	.word	0xd2f436cd
	.word	0x6cf9657e
	.word	0x7c015b7c
	.word	0x88390189
	.word	0x1bd3b38e
	.word	0xfcde7ee1
	.word	0x98f5c21e
	.word	0x43ae4c71
	.word	0xdc877fe2
	.word	0xb4a0868c
	.word	0x9d69b4d8
	.word	0x261afd3f
	.word	0x2ab2985f
	.word	0x8eb8f1a1
	.word	0x31d042b7
	.word	0x90b8ec8d
	.word	0xb6044632
	.word	0xb2e91b73
	.word	0xe8dda3b0
	.word	0xee155413
	.word	0x55768d0f
	.word	0xa5884e6c
	.word	0x69edd9b3
	.word	0xcaeb5c25
	.word	0xe5310462
	.word	0xe42ef730
	.word	0x530bcef9
	.word	0x45db7d7f
	.word	0xb2238fca
	.word	0x5b3f6602
	.word	0x221b85a1
	.word	0x7190bb45
	.word	0xa9afaac7
	.word	0xaceec266
	.word	0x51bf2c7a
	.word	0x7e70f944
	.word	0x05ee3bb1
	.word	0x57771508
	.word	0x67b82d22
	.word	0x5f05f27d
	.word	0x558b21eb
	.word	0x7f458bdc
	.word	0xa502874f
	.word	0x612093e4
	.word	0x180ef358
	.word	0xf9865c85
	.word	0x9cfa0d6c
	.word	0x2d90bf65
	.word	0xf8029d0e
	.word	0x4da1e8fa
	.word	0x45be5667
	.word	0x5567bb27
	.word	0x2adfdb4a
	.word	0xc7550a67
	.word	0x420378c9
	.word	0x165bd113
	.word	0x167cbca2
	.word	0x8948a650
	.word	0xb0cae306
	.word	0x2447e297
	.word	0xebcfa480
	.word	0x67aaf1fc
	.word	0xcb60e516
	.word	0xe429f4a6
	.word	0x02cc80ce
	.word	0x5d8f0810
	.word	0xeab0bf43
	.word	0xb9aff803
	.word	0xf1f326ee
	.word	0xc4fdb479
	.word	0x2bca4a44
	.word	0x739251bf
	.word	0x59320bed
	.word	0x52ec9a8f
	.word	0x25918c8b
	.word	0xe8efe800
	.word	0x523fcbf7
	.word	0xd3ff1977
	.word	0xd841d0db
	.word	0xe2d7b703
	.word	0x53c1350c
	.word	0x074692c8
	.word	0xe7f3121c
	.word	0x25683263
	.word	0xe7b8c8f3
	.word	0xdf6df770
	.word	0x16e9d072
	.word	0x03acf69a
	.word	0xec17ea6f
	.word	0x3316bed8
	.word	0xf066a38b
	.word	0x54e78ec8
	.word	0xad1929b0
	.word	0x28ebac46
	.word	0x5a2c1e38
	.word	0xd97852b3
	.word	0x378e640c
	.word	0xc5500683
	.word	0xd746d73f
	.word	0x5d68a10e
t1_data_in_sp:
	.word	0xecc4aaee
	.word	0x24d825bd
	.word	0x430cab6e
	.word	0xeee7f9fe
	.word	0x054b260e
	.word	0x7a227bae
	.word	0x9d058cf3
	.word	0xd421bdd9
	.word	t1_data_in_area0
	.word	t1_data_in_area0
	.word	0xffffffec
	.word	0x00000010
	.word	0x0000000c
	.word	0x00000018
	.word	t1_data_in_fp
	.word	0xf300fae3
	.word	0xe8c44438
	.word	0x4018bf0f
	.word	0xe5fc45b4
	.word	0x4fdc1011
	.word	0x9ce9bc97
	.word	0xb556de83
	.word	0xc77bcfef
	.word	0x008a5bd0
t1_data_in_mtbl_base:
	.word   	0x380fffff	! [%fp - 0x400]
	.word   	0xc0000000	! [%fp - 0x3fc]
	.word   	0x380fffff	! [%fp - 0x3f8]
	.word   	0xe0000000	! [%fp - 0x3f4]
	.word   	0x380fffff	! [%fp - 0x3f0]
	.word   	0x80000000	! [%fp - 0x3ec]
	.word   	0x38000000	! [%fp - 0x3e8]
	.word   	0x40000000	! [%fp - 0x3e4]
	.word   	0x38000000	! [%fp - 0x3e0]
	.word   	0x80000000	! [%fp - 0x3dc]
	.word   	0x38000000	! [%fp - 0x3d8]
	.word   	0x20000000	! [%fp - 0x3d4]
	.word   	0x47f00000	! [%fp - 0x3d0]
	.word   	0x00000000	! [%fp - 0x3cc]
	.word   	0x47f00000	! [%fp - 0x3c8]
	.word   	0x20000000	! [%fp - 0x3c4]
	.word   	0x47efffff	! [%fp - 0x3c0]
	.word   	0xffffffff	! [%fp - 0x3bc]
	.word   	0x7ff00000	! [%fp - 0x3b8]
	.word   	0x00000000	! [%fp - 0x3b4]
	.word   	0x7fefffff	! [%fp - 0x3b0]
	.word   	0xffffffff	! [%fp - 0x3ac]
	.word   	0x000fffff	! [%fp - 0x3a8]
	.word   	0xffffffff	! [%fp - 0x3a4]
	.word   	0x000fffff	! [%fp - 0x3a0]
	.word   	0xfffffffe	! [%fp - 0x39c]
	.word   	0x00100000	! [%fp - 0x398]
	.word   	0x00000000	! [%fp - 0x394]
	.word   	0x00000000	! [%fp - 0x390]
	.word   	0x00000001	! [%fp - 0x38c]
	.word   	0x00000000	! [%fp - 0x388]
	.word   	0x00000002	! [%fp - 0x384]
	.word   	0x00000000	! [%fp - 0x380]
	.word   	0x00000000	! [%fp - 0x37c]
	.word   	0x7f800000	! [%fp - 0x378]
	.word   	0x7f7fffff	! [%fp - 0x374]
	.word   	0x007fffff	! [%fp - 0x370]
	.word   	0x007ffffe	! [%fp - 0x36c]
	.word   	0x00800000	! [%fp - 0x368]
	.word   	0x00000001	! [%fp - 0x364]
	.word   	0x00000002	! [%fp - 0x360]
	.word   	0x80000000	! [%fp - 0x35c]
	.word   	0x207fe000	! [%fp - 0x358]
	.word   	0x1ffff000	! [%fp - 0x354]
	.word   	0x307fe123	! [%fp - 0x350]
	.word   	0x0fff1001	! [%fp - 0x34c]
	.word   	0x2ff81000	! [%fp - 0x348]
	.word   	0x1072e100	! [%fp - 0x344]
	.word   	0x027fe067	! [%fp - 0x340]
	.word   	0x3eff1289	! [%fp - 0x33c]
	.word   	0x3f000400	! [%fp - 0x338]
	.word   	0x80003c1f	! [%fp - 0x334]
	.word   	0x00fff800	! [%fp - 0x330]
	.word   	0xffff8000	! [%fp - 0x32c]
	.word   	0x200ff760	! [%fp - 0x328]
	.word   	0x0800011f	! [%fp - 0x324]
	.word   	0x1ffff800	! [%fp - 0x320]
	.word   	0x00000000	! [%fp - 0x31c]
	.word   	0x3ffe8000	! [%fp - 0x318]
	.word   	0x147ff000	! [%fp - 0x314]
	.word   	0x137fe671	! [%fp - 0x310]
	.word   	0x3ffe8459	! [%fp - 0x30c]
	.word   	0x127fffff	! [%fp - 0x308]
	.word   	0x3fffffff	! [%fp - 0x304]
	.word   	0x307fe123	! [%fp - 0x300]
	.word   	0x047fffff	! [%fp - 0x2fc]
	.word   	0x307fe123	! [%fp - 0x2f8]
	.word   	0x03ffffff	! [%fp - 0x2f4]
	.word   	0x107fe100	! [%fp - 0x2f0]
	.word   	0x22efffff	! [%fp - 0x2ec]
	.word   	0x380ffe80	! [%fp - 0x2e8]
	.word   	0x00000000	! [%fp - 0x2e4]
	.word   	0x04bfeff9	! [%fp - 0x2e0]
	.word   	0x00000000	! [%fp - 0x2dc]
	.word   	0x380fffff	! [%fp - 0x2d8]
	.word   	0xffffffff	! [%fp - 0x2d4]
	.word   	0x04bfffff	! [%fp - 0x2d0]
	.word   	0xffffffff	! [%fp - 0x2cc]
	.word   	0x300ff123	! [%fp - 0x2c8]
	.word   	0x40000000	! [%fp - 0x2c4]
	.word   	0x0caf8ee0	! [%fp - 0x2c0]
	.word   	0x00000000	! [%fp - 0x2bc]
	.word   	0x3c0ff456	! [%fp - 0x2b8]
	.word   	0x00000000	! [%fp - 0x2b4]
	.word   	0x009ff000	! [%fp - 0x2b0]
	.word   	0x00000000	! [%fp - 0x2ac]
	.word   	0x3c0ff456	! [%fp - 0x2a8]
	.word   	0x0000ff99	! [%fp - 0x2a4]
	.word   	0x009ff000	! [%fp - 0x2a0]
	.word   	0x001234ff	! [%fp - 0x29c]
	.word   	0x0080ffff	! [%fp - 0x298]
	.word   	0x3ff8f000	! [%fp - 0x294]
	.word   	0x01800001	! [%fp - 0x290]
	.word   	0x40c2fc1f	! [%fp - 0x28c]
	.word   	0x00100100	! [%fp - 0x288]
	.word   	0x10010001	! [%fp - 0x284]
	.word   	0x3fff8f88	! [%fp - 0x280]
	.word   	0x00000000	! [%fp - 0x27c]
	.word   	0x00f00f00	! [%fp - 0x278]
	.word   	0xf000000f	! [%fp - 0x274]
	.word   	0x409ff00f	! [%fp - 0x270]
	.word   	0xff000fff	! [%fp - 0x26c]
	.word   	0x04003009	! [%fp - 0x268]
	.word   	0x4fff0001	! [%fp - 0x264]
	.word   	0x03001001	! [%fp - 0x260]
	.word   	0x4feeeeee	! [%fp - 0x25c]
	.word   	0x0801e067	! [%fp - 0x258]
	.word   	0x54f231f8	! [%fp - 0x254]
	.word   	0x01000001	! [%fp - 0x250]
	.word   	0x00000001	! [%fp - 0x24c]
	.word   	0x453eef45	! [%fp - 0x248]
	.word   	0x00000001	! [%fp - 0x244]
	.word   	0x01100111	! [%fp - 0x240]
	.word   	0x00011111	! [%fp - 0x23c]
	.word   	0x455f8000	! [%fp - 0x238]
	.word   	0xffffffff	! [%fp - 0x234]
	.word   	0x01301222	! [%fp - 0x230]
	.word   	0x00111222	! [%fp - 0x22c]
	.word   	0x458f1100	! [%fp - 0x228]
	.word   	0x01111001	! [%fp - 0x224]
	.word   	0x40811111	! [%fp - 0x220]
	.word   	0x00feeeee	! [%fp - 0x21c]
	.word   	0x40000011	! [%fp - 0x218]
	.word   	0x007fffff	! [%fp - 0x214]
	.word   	0x41800221	! [%fp - 0x210]
	.word   	0x01ff0001	! [%fp - 0x20c]
	.word   	0x7f333333	! [%fp - 0x208]
	.word   	0x3f7fffff	! [%fp - 0x204]
	.word   	0x40100001	! [%fp - 0x200]
	.word   	0x11000011	! [%fp - 0x1fc]
	.word   	0x001fffff	! [%fp - 0x1f8]
	.word   	0xffffffff	! [%fp - 0x1f4]
	.word   	0x40000000	! [%fp - 0x1f0]
	.word   	0x00000011	! [%fp - 0x1ec]
	.word   	0x000fffff	! [%fp - 0x1e8]
	.word   	0xffffffff	! [%fp - 0x1e4]
	.word   	0x7fe11111	! [%fp - 0x1e0]
	.word   	0xffffffff	! [%fp - 0x1dc]
	.word   	0x3ffff110	! [%fp - 0x1d8]
	.word   	0x00000001	! [%fp - 0x1d4]
	.word   	0x7fffffff	! [%fp - 0x1d0]
	.word   	0x7f800001	! [%fp - 0x1cc]
	.word   	0x7f800000	! [%fp - 0x1c8]
	.word   	0x7f7fffff	! [%fp - 0x1c4]
	.word   	0x5f800001	! [%fp - 0x1c0]
	.word   	0x5f800000	! [%fp - 0x1bc]
	.word   	0x5f7fffff	! [%fp - 0x1b8]
	.word   	0x5f000001	! [%fp - 0x1b4]
	.word   	0x5f000000	! [%fp - 0x1b0]
	.word   	0x5effffff	! [%fp - 0x1ac]
	.word   	0x4b000001	! [%fp - 0x1a8]
	.word   	0x4b000000	! [%fp - 0x1a4]
	.word   	0x4affffff	! [%fp - 0x1a0]
	.word   	0x40000001	! [%fp - 0x19c]
	.word   	0x40000000	! [%fp - 0x198]
	.word   	0x3fffffff	! [%fp - 0x194]
	.word   	0x3f800001	! [%fp - 0x190]
	.word   	0x3f800000	! [%fp - 0x18c]
	.word   	0x3f7fffff	! [%fp - 0x188]
	.word   	0x00000000	! [%fp - 0x184]
	.word   	0x7fffffff	! [%fp - 0x180]
	.word   	0xffffffff	! [%fp - 0x17c]
	.word   	0x7ff00000	! [%fp - 0x178]
	.word   	0x00000001	! [%fp - 0x174]
	.word   	0x7ff00000	! [%fp - 0x170]
	.word   	0x00000000	! [%fp - 0x16c]
	.word   	0x7fefffff	! [%fp - 0x168]
	.word   	0xffffffff	! [%fp - 0x164]
	.word   	0x43e00000	! [%fp - 0x160]
	.word   	0x00000001	! [%fp - 0x15c]
	.word   	0x43e00000	! [%fp - 0x158]
	.word   	0x00000000	! [%fp - 0x154]
	.word   	0x43dfffff	! [%fp - 0x150]
	.word   	0xffffffff	! [%fp - 0x14c]
	.word   	0x43d00000	! [%fp - 0x148]
	.word   	0x00000001	! [%fp - 0x144]
	.word   	0x43d00000	! [%fp - 0x140]
	.word   	0x00000000	! [%fp - 0x13c]
	.word   	0x43cfffff	! [%fp - 0x138]
	.word   	0xffffffff	! [%fp - 0x134]
	.word   	0x43300000	! [%fp - 0x130]
	.word   	0x00000001	! [%fp - 0x12c]
	.word   	0x43300000	! [%fp - 0x128]
	.word   	0x00000000	! [%fp - 0x124]
	.word   	0x432fffff	! [%fp - 0x120]
	.word   	0xffffffff	! [%fp - 0x11c]
	.word   	0x40000000	! [%fp - 0x118]
	.word   	0x00000001	! [%fp - 0x114]
	.word   	0x40000000	! [%fp - 0x110]
	.word   	0x00000000	! [%fp - 0x10c]
	.word   	0x3fffffff	! [%fp - 0x108]
	.word   	0xffffffff	! [%fp - 0x104]
	.word   	0x3ff00000	! [%fp - 0x100]
	.word   	0x00000001	! [%fp - 0xfc]
	.word   	0x3ff00000	! [%fp - 0xf8]
	.word   	0x00000000	! [%fp - 0xf4]
	.word   	0x3fefffff	! [%fp - 0xf0]
	.word   	0xffffffff	! [%fp - 0xec]
	.word   	0x80000000	! [%fp - 0xe8]
	.word   	0x00000000	! [%fp - 0xe4]
	.word   	0x7fffffff	! [%fp - 0xe0]
	.word   	0xffffffff	! [%fp - 0xdc]
	.word   	0x00000000	! [%fp - 0xd8]
	.word   	0x00000000	! [%fp - 0xd4]
	.word   	0x00200000	! [%fp - 0xd0]
	.word   	0x00000003	! [%fp - 0xcc]
	.word   	0x00200000	! [%fp - 0xc8]
	.word   	0x00000002	! [%fp - 0xc4]
	.word   	0x00200000	! [%fp - 0xc0]
	.word   	0x00000001	! [%fp - 0xbc]
	.word   	0x00200000	! [%fp - 0xb8]
	.word   	0x00000000	! [%fp - 0xb4]
	.word   	0x001fffff	! [%fp - 0xb0]
	.word   	0xffffffff	! [%fp - 0xac]
	.word   	0x00100000	! [%fp - 0xa8]
	.word   	0x00000001	! [%fp - 0xa4]
	.word   	0x00100000	! [%fp - 0xa0]
	.word   	0x00000000	! [%fp - 0x9c]
	.word   	0x000fffff	! [%fp - 0x98]
	.word   	0xffffffff	! [%fp - 0x94]
	.word   	0x00080000	! [%fp - 0x90]
	.word   	0x00000001	! [%fp - 0x8c]
	.word   	0x00080000	! [%fp - 0x88]
	.word   	0x00000000	! [%fp - 0x84]
	.word   	0x0007ffff	! [%fp - 0x80]
	.word   	0xffffffff	! [%fp - 0x7c]
	.word   	0x00000000	! [%fp - 0x78]
	.word   	0x01000003	! [%fp - 0x74]
	.word   	0x00000000	! [%fp - 0x70]
	.word   	0x01000002	! [%fp - 0x6c]
	.word   	0x00000000	! [%fp - 0x68]
	.word   	0x01000001	! [%fp - 0x64]
	.word   	0x00000000	! [%fp - 0x60]
	.word   	0x01000000	! [%fp - 0x5c]
	.word   	0x00000000	! [%fp - 0x58]
	.word   	0x00ffffff	! [%fp - 0x54]
	.word   	0x00000000	! [%fp - 0x50]
	.word   	0x00800001	! [%fp - 0x4c]
	.word   	0x00000000	! [%fp - 0x48]
	.word   	0x00800000	! [%fp - 0x44]
	.word   	0x00000000	! [%fp - 0x40]
	.word   	0x007fffff	! [%fp - 0x3c]
	.word   	0x00000000	! [%fp - 0x38]
	.word   	0x00400001	! [%fp - 0x34]
	.word   	0x00000000	! [%fp - 0x30]
	.word   	0x00400000	! [%fp - 0x2c]
	.word   	0x00000000	! [%fp - 0x28]
	.word   	0x003fffff	! [%fp - 0x24]
	.word   	t1_data_in_area0	! [%fp - 0x20]
	.word   	SYM(t1_subr3)	! [%fp - 0x1c]
	.word   	SYM(t1_subr2)	! [%fp - 0x18]
	.word   	SYM(t1_subr1)	! [%fp - 0x14]
	.word   	SYM(t1_subr0)	! [%fp - 0x10]
t1_data_in_mtbl:
	.word   	0xb830c2f0	! [%fp - 0xc]
	.word   	0xb6ace85c	! [%fp - 0x8]
	.word   	0x657a5c01	! [%fp - 0x4]
.global t1_data_in_fp; t1_data_in_fp:
	.word	0x836c586a
	.word	0x2cfea1f0
	.word	0x1fe95833
	.word	0x9075b3a7
	.word	0x813831c8
	.word	0xa6e00bd5
	.word	0x34c8dbae
	.word	0x5d18f159
	.word	0xf2e3155c
	.word	0xaad6f688
	.word	0x9046ff02
	.word	0x06448c77
	.word	0xf1f51c40
	.word	0xc0a1a4f0
	.word	0xfbae9db9
	.word	0x310e74c2
	.word	0xac2f339f
	.word	0x33587184
	.word	0x4e3a1bb4
	.word	0x1ee3f10d
	.word	0x8ffca753
	.word	0x07852e22
	.word	0x648faa73
	.word	0x865e3533
t1_data_in_stacktop:
	.word	0
t1_data_in_stack_end:
.skip 6300	! page align

KDATA_MODULE(t1_module_data_in_area0, 0x42c92000)
.seg "data"
t1_data_in_area0_start:
.skip 2240
t1_data_in_area0_begin:
	.word	0x72a032cf	! t1_data_in_area0-0x20
	.word	0x03b02d1f	! t1_data_in_area0-0x1c
	.word	0x31661e94	! t1_data_in_area0-0x18
	.word	0x0ef5e34b	! t1_data_in_area0-0x14
	.word	0xb5a6bc3f	! t1_data_in_area0-0x10
	.word	0x738c479e	! t1_data_in_area0-0xc
	.word	0x12631999	! t1_data_in_area0-0x8
	.word	0x85d0ec1a	! t1_data_in_area0-0x4
.global t1_data_in_area0; t1_data_in_area0:
	.word	0x3d281ded	! t1_data_in_area0+0x0
	.word	0x96ac7525	! t1_data_in_area0+0x4
	.word	0x2e0b8bee	! t1_data_in_area0+0x8
	.word	0x45a982c9	! t1_data_in_area0+0xc
	.word	0xee00a1e6	! t1_data_in_area0+0x10
	.word	0x3742c86d	! t1_data_in_area0+0x14
	.word	0x25abd329	! t1_data_in_area0+0x18
	.word	0x608417d7	! t1_data_in_area0+0x1c
t1_data_in_area0_end:
.skip 5888
t1_data_in_area0_stop:

KDATA_MODULE(t1_module_data_in_shm_area, 0x576f8000)
.seg "data"
t1_data_in_shm_area_start:
t1_data_in_shm_area_begin:
.global t1_data_in_shm_area; t1_data_in_shm_area:
	.word	0x54f92b2c	! t1_data_in_shm_area+0x0 (t0)
	.word	0xe0b413dd	! t1_data_in_shm_area+0x4 (t1)
	.word	0x90c37c5b	! t1_data_in_shm_area+0x8 (t0)
	.word	0x8d11e578	! t1_data_in_shm_area+0xc (t1)
	.word	0x3c80064d	! t1_data_in_shm_area+0x10 (t0)
	.word	0xd8acf893	! t1_data_in_shm_area+0x14 (t1)
	.word	0xc92adfa8	! t1_data_in_shm_area+0x18 (t0)
	.word	0x7ad58f50	! t1_data_in_shm_area+0x1c (t1)
	.word	0xc3cb7a8e	! t1_data_in_shm_area+0x20 (t0)
	.word	0x15558d4e	! t1_data_in_shm_area+0x24 (t1)
	.word	0x209e59fd	! t1_data_in_shm_area+0x28 (t0)
	.word	0x81b744e9	! t1_data_in_shm_area+0x2c (t1)
	.word	0x2fa943e9	! t1_data_in_shm_area+0x30 (t0)
	.word	0x1a20d3e6	! t1_data_in_shm_area+0x34 (t1)
	.word	0x29d36b10	! t1_data_in_shm_area+0x38 (t0)
	.word	0x041a263e	! t1_data_in_shm_area+0x3c (t1)
	.word	0x9fcbb414	! t1_data_in_shm_area+0x40 (t0 bload)
	.word	0x1fa03264	! t1_data_in_shm_area+0x44
	.word	0xcacd50b9	! t1_data_in_shm_area+0x48
	.word	0x0779fa04	! t1_data_in_shm_area+0x4c
	.word	0xce5703c3	! t1_data_in_shm_area+0x50
	.word	0xdb933875	! t1_data_in_shm_area+0x54
	.word	0x5588dea2	! t1_data_in_shm_area+0x58
	.word	0xaae9dca9	! t1_data_in_shm_area+0x5c
	.word	0xebcedfb3	! t1_data_in_shm_area+0x60
	.word	0x41a8280d	! t1_data_in_shm_area+0x64
	.word	0xc077e12c	! t1_data_in_shm_area+0x68
	.word	0x5dce4ddc	! t1_data_in_shm_area+0x6c
	.word	0x26eeeb3a	! t1_data_in_shm_area+0x70
	.word	0x094a5458	! t1_data_in_shm_area+0x74
	.word	0x73cf1f40	! t1_data_in_shm_area+0x78
	.word	0xb3bb9baa	! t1_data_in_shm_area+0x7c
	.word	0x76fb684a	! t1_data_in_shm_area+0x80 (t0 bstore)
	.word	0xbff5c764	! t1_data_in_shm_area+0x84
	.word	0x2e569d33	! t1_data_in_shm_area+0x88
	.word	0xa9bde304	! t1_data_in_shm_area+0x8c
	.word	0x6a1adb17	! t1_data_in_shm_area+0x90
	.word	0x419746f0	! t1_data_in_shm_area+0x94
	.word	0xd6122303	! t1_data_in_shm_area+0x98
	.word	0xa56b52b3	! t1_data_in_shm_area+0x9c
	.word	0x7933c3fc	! t1_data_in_shm_area+0xa0
	.word	0xb927528a	! t1_data_in_shm_area+0xa4
	.word	0x8cf562df	! t1_data_in_shm_area+0xa8
	.word	0x19e32989	! t1_data_in_shm_area+0xac
	.word	0xd0d1939f	! t1_data_in_shm_area+0xb0
	.word	0x26ae6ed8	! t1_data_in_shm_area+0xb4
	.word	0xe5d583ec	! t1_data_in_shm_area+0xb8
	.word	0xfa01e3d8	! t1_data_in_shm_area+0xbc
	.word	0x3cdd5fe6	! t1_data_in_shm_area+0xc0 (t1 bload)
	.word	0x6705d88f	! t1_data_in_shm_area+0xc4
	.word	0xd5a71658	! t1_data_in_shm_area+0xc8
	.word	0x53f0bb60	! t1_data_in_shm_area+0xcc
	.word	0xbf08c221	! t1_data_in_shm_area+0xd0
	.word	0xcb8de542	! t1_data_in_shm_area+0xd4
	.word	0x426981d8	! t1_data_in_shm_area+0xd8
	.word	0xe3d56f19	! t1_data_in_shm_area+0xdc
	.word	0x07752235	! t1_data_in_shm_area+0xe0
	.word	0xfde825f2	! t1_data_in_shm_area+0xe4
	.word	0xfa0dd096	! t1_data_in_shm_area+0xe8
	.word	0x4fd1ceab	! t1_data_in_shm_area+0xec
	.word	0x0363432e	! t1_data_in_shm_area+0xf0
	.word	0xfa278bfc	! t1_data_in_shm_area+0xf4
	.word	0x6a6010c9	! t1_data_in_shm_area+0xf8
	.word	0x5b27fea4	! t1_data_in_shm_area+0xfc
	.word	0xa1ac8859	! t1_data_in_shm_area+0x100 (t1 bstore)
	.word	0x7f3630bf	! t1_data_in_shm_area+0x104
	.word	0x7b6078ac	! t1_data_in_shm_area+0x108
	.word	0xfc619898	! t1_data_in_shm_area+0x10c
	.word	0xca3712e6	! t1_data_in_shm_area+0x110
	.word	0x49174c6f	! t1_data_in_shm_area+0x114
	.word	0x048bf6c8	! t1_data_in_shm_area+0x118
	.word	0x7582300f	! t1_data_in_shm_area+0x11c
	.word	0x37db95c8	! t1_data_in_shm_area+0x120
	.word	0x62514628	! t1_data_in_shm_area+0x124
	.word	0xebe70278	! t1_data_in_shm_area+0x128
	.word	0xf4a8b2c1	! t1_data_in_shm_area+0x12c
	.word	0xa17a03e0	! t1_data_in_shm_area+0x130
	.word	0xf7603146	! t1_data_in_shm_area+0x134
	.word	0x6bc670aa	! t1_data_in_shm_area+0x138
	.word	0xd66a1800	! t1_data_in_shm_area+0x13c
t1_data_in_shm_area_end:
t1_data_in_shm_area_stop:

KDATA_MODULE(t1_module_data_exp_regs, 0x52fe0000)
.seg "data"
KGLOBAL(t1_data_exp_regs)
t1_data_exp_regs_start:
t1_data_exp_regs:
	.word	0x7ff55d02          ! %f0
	.word	0x6232495a          ! %f1
	.word	0xd268c143          ! %f2
	.word	0xd12c8342          ! %f3
	.word	0xd3e79f35          ! %f4
	.word	0x30e5e224          ! %f5
	.word	0xc7f6d947          ! %f6
	.word	0xd2263b7c          ! %f7
	.word	0x04f208e5          ! %f8
	.word	0x7ae4a02b          ! %f9
	.word	0x37c957f6          ! %f10
	.word	0x479907be          ! %f11
	.word	0x8c5a54bb          ! %f12
	.word	0xfdb823ca          ! %f13
	.word	0x0581e817          ! %f14
	.word	0xdceac930          ! %f15
	.word	0x18d4dc4e          ! %f16
	.word	0xf8f0c64f          ! %f17
	.word	0x6faeb2ac          ! %f18
	.word	0xd0f4a86a          ! %f19
	.word	0xc31bf0c7          ! %f20
	.word	0x7b69afcc          ! %f21
	.word	0x18d4222f          ! %f22
	.word	0x8f4a516e          ! %f23
	.word	0x2e1199c7          ! %f24
	.word	0x1557f62e          ! %f25
	.word	0x6c39161e          ! %f26
	.word	0x07247ad8          ! %f27
	.word	0xfa03de87          ! %f28
	.word	0xeb44198e          ! %f29
	.word	0x4d444aba          ! %f30
	.word	0xe2102c54          ! %f31
	.word	0x1189fd40          ! %f32
	.word	0xf82e71c7          ! %f33
	.word	0x57e1f90a          ! %f34
	.word	0x38a7784f          ! %f35
	.word	0xdcf334ce          ! %f36
	.word	0x98146148          ! %f37
	.word	0x3a54f326          ! %f38
	.word	0xb6af9cf0          ! %f39
	.word	0xada6048f          ! %f40
	.word	0x7115612a          ! %f41
	.word	0xbd46c0b1          ! %f42
	.word	0x4543c049          ! %f43
	.word	0x2f590691          ! %f44
	.word	0x0dd43a84          ! %f45
	.word	0x8a1e7fa6          ! %f46
	.word	0xb872bbc9          ! %f47
	.word	0x3ffcc7eb          ! %f48
	.word	0x18a200fe          ! %f49
	.word	0x51de8d58          ! %f50
	.word	0xc929aaf5          ! %f51
	.word	0xbac0436b          ! %f52
	.word	0x19c5a2a4          ! %f53
	.word	0x8c453bb3          ! %f54
	.word	0xebac3157          ! %f55
	.word	0xed0fe271          ! %f56
	.word	0xed0c20fc          ! %f57
	.word	0x0fed16c7          ! %f58
	.word	0xa176abb6          ! %f59
	.word	0x2009281a          ! %f60
	.word	0x30fac759          ! %f61
	.word	0x74ed7e87          ! %f62
	.word	0x7a75c086          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t1_kref+0x99c       ! %g1 (code pointer)
	.word	t1_data_exp_shm_area! %g2 (shared area pointer)
	.word	0xb42dd382          ! %g3 (loop index)
	.word	SYM(t1_subr0)       ! %g4 (jmpl target)
	.word	t1_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x393c7adc          ! %o0
	.word	0x529f26c0          ! %o1
	.word	0x74a8cfb9          ! %o2
	.word	0x619d4403          ! %o3
	.word	0xc3c4f0a2          ! %o4
	.word	0x57bf85fb          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0xcbdb6aa0          ! %l0
	.word	0xadbdf271          ! %l1
	.word	0xc44498cd          ! %l2
	.word	0x884203a2          ! %l3
	.word	0x3f303eff          ! %l4
	.word	0xe0843d2d          ! %l5
	.word	0xe35fdfa0          ! %l6
	.word	0xf5c5a138          ! %l7
	.word	t1_data_exp_area0   ! %i0 (area pointer)
	.word	t1_data_exp_area0   ! %i1 (area pointer)
	.word	0xffffffe6          ! %i2 (byte offset)
	.word	0xffffffec          ! %i3 (halfword offset)
	.word	0x00000014          ! %i4 (word offset)
	.word	0xfffffff0          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x504f7b43          ! %y
	.word	0x00000000          ! %icc (nzvc)
	.word	0x80000b21          ! %fsr
	.word	0x00000000          ! %gsr.mask
	.word	0x00000000          ! %gsr
	.word	0x000000e0          ! %asi
	.word	0x00000000          ! Integer overflow traps
	.word	0x00000000          ! Integer divide by zero traps
	.word	0x00000000          ! Integer divide > 52 bit dividend traps
	.word	0x00000000          ! Floating inexact traps
	.word	0x00000000          ! Floating divide by zero traps
	.word	0x00000000          ! Floating underflow traps
	.word	0x00000000          ! Floating overflow traps
	.word	0x00000000          ! Floating invalid traps
	.word	0x00000000          ! Floating other traps
	.word	0x00000000          ! Ticc traps
	.word	0x00000000          ! Unexpected SIGFPE traps
	.word	0x00000000          ! Unexpected SIGSEGV traps
	.word	0x00000000          ! Unexpected SIGBUS traps
	.word	0x00000000          ! Unexpected SIGILL traps
	.word	0x00000000          ! Expected SIGSEGV traps
	.word	0x00000000          ! Expected SIGBUS traps
	.word	0x00000000          ! UNIMP traps
	.word	0x00000000          ! ??
t1_data_exp_mtbl_size:	.word	253
t1_data_exp_regs_end:

.skip 7708	! page align

KDATA_MODULE(t1_module_data_exp_stack, 0x59c2c000)
.seg "data"
KGLOBAL(t1_data_exp_mtbl_size)
KGLOBAL(t1_data_exp_mtbl)
KGLOBAL(t1_data_exp_stack)
t1_data_exp_stack_start:
	.word	0xe64b61ea
	.word	0xc61c10a7
	.word	0xc154c441
	.word	0x86720b52
	.word	0x5c464c62
	.word	0xee3f59d3
	.word	0xd927153d
	.word	0x190fedff
	.word	0xc7bcb9fa
	.word	0xf8a6c053
	.word	0x45951ed6
	.word	0x513880d7
	.word	0x514e7716
	.word	0xf76327f7
	.word	0x3ca92a95
	.word	0xd3bccb37
	.word	0xe10294bb
	.word	0xdf73bfdd
	.word	0x332edfd8
	.word	0xea73c614
	.word	0xf951cb40
	.word	0x36cfc114
	.word	0xaf50c79d
	.word	0x152bf543
	.word	0xc067d445
	.word	0x40faf381
	.word	0xed69b9a1
	.word	0x4546d0f4
	.word	0xbfcbefe4
	.word	0xe5631d06
	.word	0x94d786a9
	.word	0xfde2c37f
	.word	0x38f00926
	.word	0x7e02bee0
	.word	0x399d741e
	.word	0xc580bf63
	.word	0x11292db9
	.word	0xfda7c550
	.word	0x4d7a5cdf
	.word	0xc95eb18a
	.word	0xf08b4cdf
	.word	0x22030d7d
	.word	0x88ff8b52
	.word	0x869053d1
	.word	0x184d71a8
	.word	0x888fe598
	.word	0x2872a0bc
	.word	0xc57423c8
	.word	0xfdfaec62
	.word	0xbcb0eb41
	.word	0x9a161dd2
	.word	0x39ba81b5
	.word	0xe4091f50
	.word	0x9351ec28
	.word	0x41196090
	.word	0xf8113bdf
	.word	0x6db0e29b
	.word	0x2b34acf7
	.word	0xa32a2b48
	.word	0x7ae60a08
	.word	0xb665b385
	.word	0x9b08ba6f
	.word	0xf3af08fd
	.word	0xb5d6bd3a
	.word	0x643422e4
	.word	0x05cca8d1
	.word	0x485322f1
	.word	0x538e27c6
	.word	0xd2f436cd
	.word	0x6cf9657e
	.word	0x7c015b7c
	.word	0x88390189
	.word	0x1bd3b38e
	.word	0xfcde7ee1
	.word	0x98f5c21e
	.word	0x43ae4c71
	.word	0xdc877fe2
	.word	0xb4a0868c
	.word	0x9d69b4d8
	.word	0x261afd3f
	.word	0x2ab2985f
	.word	0x8eb8f1a1
	.word	0x31d042b7
	.word	0x90b8ec8d
	.word	0xb6044632
	.word	0xb2e91b73
	.word	0xe8dda3b0
	.word	0xee155413
	.word	0x55768d0f
	.word	0xa5884e6c
	.word	0x69edd9b3
	.word	0xcaeb5c25
	.word	0xe5310462
	.word	0xe42ef730
	.word	0x530bcef9
	.word	0x45db7d7f
	.word	0xb2238fca
	.word	0x5b3f6602
	.word	0x221b85a1
	.word	0x7190bb45
	.word	0xa9afaac7
	.word	0xaceec266
	.word	0x51bf2c7a
	.word	0x7e70f944
	.word	0x05ee3bb1
	.word	0x57771508
	.word	0x67b82d22
	.word	0x5f05f27d
	.word	0x558b21eb
	.word	0x7f458bdc
	.word	0xa502874f
	.word	0x612093e4
	.word	0x180ef358
	.word	0xf9865c85
	.word	0x9cfa0d6c
	.word	0x2d90bf65
	.word	0xf8029d0e
	.word	0x4da1e8fa
	.word	0x45be5667
	.word	0x5567bb27
	.word	0x2adfdb4a
	.word	0xc7550a67
	.word	0x420378c9
	.word	0x165bd113
	.word	0x167cbca2
	.word	0x8948a650
	.word	0xb0cae306
	.word	0x2447e297
	.word	0xebcfa480
	.word	0x67aaf1fc
	.word	0xcb60e516
	.word	0xe429f4a6
	.word	0x02cc80ce
	.word	0x5d8f0810
	.word	0xeab0bf43
	.word	0xb9aff803
	.word	0xf1f326ee
	.word	0xc4fdb479
	.word	0x2bca4a44
	.word	0x739251bf
	.word	0x59320bed
	.word	0x52ec9a8f
	.word	0x25918c8b
	.word	0xe8efe800
	.word	0x523fcbf7
	.word	0xd3ff1977
	.word	0xd841d0db
	.word	0xe2d7b703
	.word	0x53c1350c
	.word	0x074692c8
	.word	0xe7f3121c
	.word	0x25683263
	.word	0xe7b8c8f3
	.word	0xdf6df770
	.word	0x16e9d072
	.word	0x03acf69a
	.word	0xec17ea6f
	.word	0x3316bed8
	.word	0xf066a38b
	.word	0x54e78ec8
	.word	0xad1929b0
	.word	0x28ebac46
	.word	0x5a2c1e38
	.word	0xd97852b3
	.word	0x378e640c
	.word	0xc5500683
	.word	0xd746d73f
	.word	0x5d68a10e
t1_data_exp_sp:
	.word	0xecc4aaee
	.word	0x24d825bd
	.word	0x430cab6e
	.word	0xeee7f9fe
	.word	0x054b260e
	.word	0x7a227bae
	.word	0x9d058cf3
	.word	0xd421bdd9
	.word	t1_data_exp_area0
	.word	t1_data_exp_area0
	.word	0xffffffec
	.word	0x00000010
	.word	0x0000000c
	.word	0x00000018
	.word	t1_data_exp_fp
	.word	0xf300fae3
	.word	0xe8c44438
	.word	0x4018bf0f
	.word	0xe5fc45b4
	.word	0x4fdc1011
	.word	0x9ce9bc97
	.word	0xb556de83
	.word	0xc77bcfef
	.word	0x008a5bd0
t1_data_exp_mtbl_base:
	.word   	0x380fffff	! [%fp - 0x400]
	.word   	0xc0000000	! [%fp - 0x3fc]
	.word   	0x380fffff	! [%fp - 0x3f8]
	.word   	0xe0000000	! [%fp - 0x3f4]
	.word   	0x380fffff	! [%fp - 0x3f0]
	.word   	0x80000000	! [%fp - 0x3ec]
	.word   	0x38000000	! [%fp - 0x3e8]
	.word   	0x40000000	! [%fp - 0x3e4]
	.word   	0x38000000	! [%fp - 0x3e0]
	.word   	0x80000000	! [%fp - 0x3dc]
	.word   	0x38000000	! [%fp - 0x3d8]
	.word   	0x20000000	! [%fp - 0x3d4]
	.word   	0x47f00000	! [%fp - 0x3d0]
	.word   	0x00000000	! [%fp - 0x3cc]
	.word   	0x47f00000	! [%fp - 0x3c8]
	.word   	0x20000000	! [%fp - 0x3c4]
	.word   	0x47efffff	! [%fp - 0x3c0]
	.word   	0xffffffff	! [%fp - 0x3bc]
	.word   	0x7ff00000	! [%fp - 0x3b8]
	.word   	0x00000000	! [%fp - 0x3b4]
	.word   	0x7fefffff	! [%fp - 0x3b0]
	.word   	0xffffffff	! [%fp - 0x3ac]
	.word   	0x000fffff	! [%fp - 0x3a8]
	.word   	0xffffffff	! [%fp - 0x3a4]
	.word   	0x000fffff	! [%fp - 0x3a0]
	.word   	0xfffffffe	! [%fp - 0x39c]
	.word   	0x00100000	! [%fp - 0x398]
	.word   	0x00000000	! [%fp - 0x394]
	.word   	0x00000000	! [%fp - 0x390]
	.word   	0x00000001	! [%fp - 0x38c]
	.word   	0x00000000	! [%fp - 0x388]
	.word   	0x00000002	! [%fp - 0x384]
	.word   	0x00000000	! [%fp - 0x380]
	.word   	0x00000000	! [%fp - 0x37c]
	.word   	0x7f800000	! [%fp - 0x378]
	.word   	0x7f7fffff	! [%fp - 0x374]
	.word   	0x007fffff	! [%fp - 0x370]
	.word   	0x007ffffe	! [%fp - 0x36c]
	.word   	0x00800000	! [%fp - 0x368]
	.word   	0x00000001	! [%fp - 0x364]
	.word   	0x00000002	! [%fp - 0x360]
	.word   	0x80000000	! [%fp - 0x35c]
	.word   	0x207fe000	! [%fp - 0x358]
	.word   	0x1ffff000	! [%fp - 0x354]
	.word   	0x307fe123	! [%fp - 0x350]
	.word   	0x0fff1001	! [%fp - 0x34c]
	.word   	0x2ff81000	! [%fp - 0x348]
	.word   	0x1072e100	! [%fp - 0x344]
	.word   	0x027fe067	! [%fp - 0x340]
	.word   	0x3eff1289	! [%fp - 0x33c]
	.word   	0x3f000400	! [%fp - 0x338]
	.word   	0x80003c1f	! [%fp - 0x334]
	.word   	0x00fff800	! [%fp - 0x330]
	.word   	0xffff8000	! [%fp - 0x32c]
	.word   	0x200ff760	! [%fp - 0x328]
	.word   	0x0800011f	! [%fp - 0x324]
	.word   	0x1ffff800	! [%fp - 0x320]
	.word   	0x00000000	! [%fp - 0x31c]
	.word   	0x3ffe8000	! [%fp - 0x318]
	.word   	0x147ff000	! [%fp - 0x314]
	.word   	0x137fe671	! [%fp - 0x310]
	.word   	0x3ffe8459	! [%fp - 0x30c]
	.word   	0x127fffff	! [%fp - 0x308]
	.word   	0x3fffffff	! [%fp - 0x304]
	.word   	0x307fe123	! [%fp - 0x300]
	.word   	0x047fffff	! [%fp - 0x2fc]
	.word   	0x307fe123	! [%fp - 0x2f8]
	.word   	0x03ffffff	! [%fp - 0x2f4]
	.word   	0x107fe100	! [%fp - 0x2f0]
	.word   	0x22efffff	! [%fp - 0x2ec]
	.word   	0x380ffe80	! [%fp - 0x2e8]
	.word   	0x00000000	! [%fp - 0x2e4]
	.word   	0x04bfeff9	! [%fp - 0x2e0]
	.word   	0x00000000	! [%fp - 0x2dc]
	.word   	0x380fffff	! [%fp - 0x2d8]
	.word   	0xffffffff	! [%fp - 0x2d4]
	.word   	0x04bfffff	! [%fp - 0x2d0]
	.word   	0xffffffff	! [%fp - 0x2cc]
	.word   	0x300ff123	! [%fp - 0x2c8]
	.word   	0x40000000	! [%fp - 0x2c4]
	.word   	0x0caf8ee0	! [%fp - 0x2c0]
	.word   	0x00000000	! [%fp - 0x2bc]
	.word   	0x3c0ff456	! [%fp - 0x2b8]
	.word   	0x00000000	! [%fp - 0x2b4]
	.word   	0x009ff000	! [%fp - 0x2b0]
	.word   	0x00000000	! [%fp - 0x2ac]
	.word   	0x3c0ff456	! [%fp - 0x2a8]
	.word   	0x0000ff99	! [%fp - 0x2a4]
	.word   	0x009ff000	! [%fp - 0x2a0]
	.word   	0x001234ff	! [%fp - 0x29c]
	.word   	0x0080ffff	! [%fp - 0x298]
	.word   	0x3ff8f000	! [%fp - 0x294]
	.word   	0x01800001	! [%fp - 0x290]
	.word   	0x40c2fc1f	! [%fp - 0x28c]
	.word   	0x00100100	! [%fp - 0x288]
	.word   	0x10010001	! [%fp - 0x284]
	.word   	0x3fff8f88	! [%fp - 0x280]
	.word   	0x00000000	! [%fp - 0x27c]
	.word   	0x00f00f00	! [%fp - 0x278]
	.word   	0xf000000f	! [%fp - 0x274]
	.word   	0x409ff00f	! [%fp - 0x270]
	.word   	0xff000fff	! [%fp - 0x26c]
	.word   	0x04003009	! [%fp - 0x268]
	.word   	0x4fff0001	! [%fp - 0x264]
	.word   	0x03001001	! [%fp - 0x260]
	.word   	0x4feeeeee	! [%fp - 0x25c]
	.word   	0x0801e067	! [%fp - 0x258]
	.word   	0x54f231f8	! [%fp - 0x254]
	.word   	0x01000001	! [%fp - 0x250]
	.word   	0x00000001	! [%fp - 0x24c]
	.word   	0x453eef45	! [%fp - 0x248]
	.word   	0x00000001	! [%fp - 0x244]
	.word   	0x01100111	! [%fp - 0x240]
	.word   	0x00011111	! [%fp - 0x23c]
	.word   	0x455f8000	! [%fp - 0x238]
	.word   	0xffffffff	! [%fp - 0x234]
	.word   	0x01301222	! [%fp - 0x230]
	.word   	0x00111222	! [%fp - 0x22c]
	.word   	0x458f1100	! [%fp - 0x228]
	.word   	0x01111001	! [%fp - 0x224]
	.word   	0x40811111	! [%fp - 0x220]
	.word   	0x00feeeee	! [%fp - 0x21c]
	.word   	0x40000011	! [%fp - 0x218]
	.word   	0x007fffff	! [%fp - 0x214]
	.word   	0x41800221	! [%fp - 0x210]
	.word   	0x01ff0001	! [%fp - 0x20c]
	.word   	0x7f333333	! [%fp - 0x208]
	.word   	0x3f7fffff	! [%fp - 0x204]
	.word   	0x40100001	! [%fp - 0x200]
	.word   	0x11000011	! [%fp - 0x1fc]
	.word   	0x001fffff	! [%fp - 0x1f8]
	.word   	0xffffffff	! [%fp - 0x1f4]
	.word   	0x40000000	! [%fp - 0x1f0]
	.word   	0x00000011	! [%fp - 0x1ec]
	.word   	0x000fffff	! [%fp - 0x1e8]
	.word   	0xffffffff	! [%fp - 0x1e4]
	.word   	0x7fe11111	! [%fp - 0x1e0]
	.word   	0xffffffff	! [%fp - 0x1dc]
	.word   	0x3ffff110	! [%fp - 0x1d8]
	.word   	0x00000001	! [%fp - 0x1d4]
	.word   	0x7fffffff	! [%fp - 0x1d0]
	.word   	0x7f800001	! [%fp - 0x1cc]
	.word   	0x7f800000	! [%fp - 0x1c8]
	.word   	0x7f7fffff	! [%fp - 0x1c4]
	.word   	0x5f800001	! [%fp - 0x1c0]
	.word   	0x5f800000	! [%fp - 0x1bc]
	.word   	0x5f7fffff	! [%fp - 0x1b8]
	.word   	0x5f000001	! [%fp - 0x1b4]
	.word   	0x5f000000	! [%fp - 0x1b0]
	.word   	0x5effffff	! [%fp - 0x1ac]
	.word   	0x4b000001	! [%fp - 0x1a8]
	.word   	0x4b000000	! [%fp - 0x1a4]
	.word   	0x4affffff	! [%fp - 0x1a0]
	.word   	0x40000001	! [%fp - 0x19c]
	.word   	0x40000000	! [%fp - 0x198]
	.word   	0x3fffffff	! [%fp - 0x194]
	.word   	0x3f800001	! [%fp - 0x190]
	.word   	0x3f800000	! [%fp - 0x18c]
	.word   	0x3f7fffff	! [%fp - 0x188]
	.word   	0x00000000	! [%fp - 0x184]
	.word   	0x7fffffff	! [%fp - 0x180]
	.word   	0xffffffff	! [%fp - 0x17c]
	.word   	0x7ff00000	! [%fp - 0x178]
	.word   	0x00000001	! [%fp - 0x174]
	.word   	0x7ff00000	! [%fp - 0x170]
	.word   	0x00000000	! [%fp - 0x16c]
	.word   	0x7fefffff	! [%fp - 0x168]
	.word   	0xffffffff	! [%fp - 0x164]
	.word   	0x43e00000	! [%fp - 0x160]
	.word   	0x00000001	! [%fp - 0x15c]
	.word   	0x43e00000	! [%fp - 0x158]
	.word   	0x00000000	! [%fp - 0x154]
	.word   	0x43dfffff	! [%fp - 0x150]
	.word   	0xffffffff	! [%fp - 0x14c]
	.word   	0x43d00000	! [%fp - 0x148]
	.word   	0x00000001	! [%fp - 0x144]
	.word   	0x43d00000	! [%fp - 0x140]
	.word   	0x00000000	! [%fp - 0x13c]
	.word   	0x43cfffff	! [%fp - 0x138]
	.word   	0xffffffff	! [%fp - 0x134]
	.word   	0x43300000	! [%fp - 0x130]
	.word   	0x00000001	! [%fp - 0x12c]
	.word   	0x43300000	! [%fp - 0x128]
	.word   	0x00000000	! [%fp - 0x124]
	.word   	0x432fffff	! [%fp - 0x120]
	.word   	0xffffffff	! [%fp - 0x11c]
	.word   	0x40000000	! [%fp - 0x118]
	.word   	0x00000001	! [%fp - 0x114]
	.word   	0x40000000	! [%fp - 0x110]
	.word   	0x00000000	! [%fp - 0x10c]
	.word   	0x3fffffff	! [%fp - 0x108]
	.word   	0xffffffff	! [%fp - 0x104]
	.word   	0x3ff00000	! [%fp - 0x100]
	.word   	0x00000001	! [%fp - 0xfc]
	.word   	0x3ff00000	! [%fp - 0xf8]
	.word   	0x00000000	! [%fp - 0xf4]
	.word   	0x3fefffff	! [%fp - 0xf0]
	.word   	0xffffffff	! [%fp - 0xec]
	.word   	0x80000000	! [%fp - 0xe8]
	.word   	0x00000000	! [%fp - 0xe4]
	.word   	0x7fffffff	! [%fp - 0xe0]
	.word   	0xffffffff	! [%fp - 0xdc]
	.word   	0x00000000	! [%fp - 0xd8]
	.word   	0x00000000	! [%fp - 0xd4]
	.word   	0x00200000	! [%fp - 0xd0]
	.word   	0x00000003	! [%fp - 0xcc]
	.word   	0x00200000	! [%fp - 0xc8]
	.word   	0x00000002	! [%fp - 0xc4]
	.word   	0x00200000	! [%fp - 0xc0]
	.word   	0x00000001	! [%fp - 0xbc]
	.word   	0x00200000	! [%fp - 0xb8]
	.word   	0x00000000	! [%fp - 0xb4]
	.word   	0x001fffff	! [%fp - 0xb0]
	.word   	0xffffffff	! [%fp - 0xac]
	.word   	0x00100000	! [%fp - 0xa8]
	.word   	0x00000001	! [%fp - 0xa4]
	.word   	0x00100000	! [%fp - 0xa0]
	.word   	0x00000000	! [%fp - 0x9c]
	.word   	0x000fffff	! [%fp - 0x98]
	.word   	0xffffffff	! [%fp - 0x94]
	.word   	0x00080000	! [%fp - 0x90]
	.word   	0x00000001	! [%fp - 0x8c]
	.word   	0x00080000	! [%fp - 0x88]
	.word   	0x00000000	! [%fp - 0x84]
	.word   	0x0007ffff	! [%fp - 0x80]
	.word   	0xffffffff	! [%fp - 0x7c]
	.word   	0x00000000	! [%fp - 0x78]
	.word   	0x01000003	! [%fp - 0x74]
	.word   	0x00000000	! [%fp - 0x70]
	.word   	0x01000002	! [%fp - 0x6c]
	.word   	0x00000000	! [%fp - 0x68]
	.word   	0x01000001	! [%fp - 0x64]
	.word   	0x00000000	! [%fp - 0x60]
	.word   	0x01000000	! [%fp - 0x5c]
	.word   	0x00000000	! [%fp - 0x58]
	.word   	0x00ffffff	! [%fp - 0x54]
	.word   	0x00000000	! [%fp - 0x50]
	.word   	0x00800001	! [%fp - 0x4c]
	.word   	0x00000000	! [%fp - 0x48]
	.word   	0x00800000	! [%fp - 0x44]
	.word   	0x00000000	! [%fp - 0x40]
	.word   	0x007fffff	! [%fp - 0x3c]
	.word   	0x00000000	! [%fp - 0x38]
	.word   	0x00400001	! [%fp - 0x34]
	.word   	0x00000000	! [%fp - 0x30]
	.word   	0x00400000	! [%fp - 0x2c]
	.word   	0x00000000	! [%fp - 0x28]
	.word   	0x003fffff	! [%fp - 0x24]
	.word   	t1_data_exp_area0	! [%fp - 0x20]
	.word   	SYM(t1_subr3)	! [%fp - 0x1c]
	.word   	SYM(t1_subr2)	! [%fp - 0x18]
	.word   	SYM(t1_subr1)	! [%fp - 0x14]
	.word   	SYM(t1_subr0)	! [%fp - 0x10]
t1_data_exp_mtbl:
	.word   	0xb830c2f0	! [%fp - 0xc]
	.word   	0xb6ace85c	! [%fp - 0x8]
	.word   	0x657a5c01	! [%fp - 0x4]
t1_data_exp_fp:
	.word	0x836c586a
	.word	0x2cfea1f0
	.word	0x1fe95833
	.word	0x9075b3a7
	.word	0x813831c8
	.word	0xa6e00bd5
	.word	0x34c8dbae
	.word	0x5d18f159
	.word	0xf2e3155c
	.word	0xaad6f688
	.word	0x9046ff02
	.word	0x06448c77
	.word	0xf1f51c40
	.word	0xc0a1a4f0
	.word	0xfbae9db9
	.word	0x310e74c2
	.word	0xac2f339f
	.word	0x33587184
	.word	0x4e3a1bb4
	.word	0x1ee3f10d
	.word	0x8ffca753
	.word	0x07852e22
	.word	0x648faa73
	.word	0x865e3533
t1_data_exp_stacktop:
	.word	0
t1_data_exp_stack_end:
.skip 6300	! page align

KDATA_MODULE(t1_module_data_exp_area0, 0x5afde000)
.seg "data"
t1_data_exp_area0_start:
.skip 2240
t1_data_exp_area0_begin:
	.word	0x72a032cf	! t1_data_exp_area0-0x20
	.word	0x03b02d1f	! t1_data_exp_area0-0x1c
	.word	0x31661e94	! t1_data_exp_area0-0x18
	.word	0x0ef5e34b	! t1_data_exp_area0-0x14
	.word	0xb5a6bc3f	! t1_data_exp_area0-0x10
	.word	0x738c479e	! t1_data_exp_area0-0xc
	.word	0x12631999	! t1_data_exp_area0-0x8
	.word	0x85d0ec1a	! t1_data_exp_area0-0x4
.global t1_data_exp_area0; t1_data_exp_area0:
	.word	0x3d281ded	! t1_data_exp_area0+0x0
	.word	0x96ac7525	! t1_data_exp_area0+0x4
	.word	0x2e0b8bee	! t1_data_exp_area0+0x8
	.word	0x45a982c9	! t1_data_exp_area0+0xc
	.word	0xee00a1e6	! t1_data_exp_area0+0x10
	.word	0x3742c86d	! t1_data_exp_area0+0x14
	.word	0x25abd329	! t1_data_exp_area0+0x18
	.word	0x608417d7	! t1_data_exp_area0+0x1c
t1_data_exp_area0_end:
.skip 5888
t1_data_exp_area0_stop:

KDATA_MODULE(t1_module_data_exp_shm_area, 0x7563e000)
.seg "data"
t1_data_exp_shm_area_start:
t1_data_exp_shm_area_begin:
.global t1_data_exp_shm_area; t1_data_exp_shm_area:
	.word	0x54f92b2c	! t1_data_exp_shm_area+0x0 (t0)
	.word	0xe0b413dd	! t1_data_exp_shm_area+0x4 (t1)
	.word	0x90c37c5b	! t1_data_exp_shm_area+0x8 (t0)
	.word	0x8d11e578	! t1_data_exp_shm_area+0xc (t1)
	.word	0x3c80064d	! t1_data_exp_shm_area+0x10 (t0)
	.word	0xd8acf893	! t1_data_exp_shm_area+0x14 (t1)
	.word	0xc92adfa8	! t1_data_exp_shm_area+0x18 (t0)
	.word	0x7ad58f50	! t1_data_exp_shm_area+0x1c (t1)
	.word	0xc3cb7a8e	! t1_data_exp_shm_area+0x20 (t0)
	.word	0x15558d4e	! t1_data_exp_shm_area+0x24 (t1)
	.word	0x209e59fd	! t1_data_exp_shm_area+0x28 (t0)
	.word	0x81b744e9	! t1_data_exp_shm_area+0x2c (t1)
	.word	0x2fa943e9	! t1_data_exp_shm_area+0x30 (t0)
	.word	0x1a20d3e6	! t1_data_exp_shm_area+0x34 (t1)
	.word	0x29d36b10	! t1_data_exp_shm_area+0x38 (t0)
	.word	0x041a263e	! t1_data_exp_shm_area+0x3c (t1)
	.word	0x9fcbb414	! t1_data_exp_shm_area+0x40 (t0 bload)
	.word	0x1fa03264	! t1_data_exp_shm_area+0x44
	.word	0xcacd50b9	! t1_data_exp_shm_area+0x48
	.word	0x0779fa04	! t1_data_exp_shm_area+0x4c
	.word	0xce5703c3	! t1_data_exp_shm_area+0x50
	.word	0xdb933875	! t1_data_exp_shm_area+0x54
	.word	0x5588dea2	! t1_data_exp_shm_area+0x58
	.word	0xaae9dca9	! t1_data_exp_shm_area+0x5c
	.word	0xebcedfb3	! t1_data_exp_shm_area+0x60
	.word	0x41a8280d	! t1_data_exp_shm_area+0x64
	.word	0xc077e12c	! t1_data_exp_shm_area+0x68
	.word	0x5dce4ddc	! t1_data_exp_shm_area+0x6c
	.word	0x26eeeb3a	! t1_data_exp_shm_area+0x70
	.word	0x094a5458	! t1_data_exp_shm_area+0x74
	.word	0x73cf1f40	! t1_data_exp_shm_area+0x78
	.word	0xb3bb9baa	! t1_data_exp_shm_area+0x7c
	.word	0x76fb684a	! t1_data_exp_shm_area+0x80 (t0 bstore)
	.word	0xbff5c764	! t1_data_exp_shm_area+0x84
	.word	0x2e569d33	! t1_data_exp_shm_area+0x88
	.word	0xa9bde304	! t1_data_exp_shm_area+0x8c
	.word	0x6a1adb17	! t1_data_exp_shm_area+0x90
	.word	0x419746f0	! t1_data_exp_shm_area+0x94
	.word	0xd6122303	! t1_data_exp_shm_area+0x98
	.word	0xa56b52b3	! t1_data_exp_shm_area+0x9c
	.word	0x7933c3fc	! t1_data_exp_shm_area+0xa0
	.word	0xb927528a	! t1_data_exp_shm_area+0xa4
	.word	0x8cf562df	! t1_data_exp_shm_area+0xa8
	.word	0x19e32989	! t1_data_exp_shm_area+0xac
	.word	0xd0d1939f	! t1_data_exp_shm_area+0xb0
	.word	0x26ae6ed8	! t1_data_exp_shm_area+0xb4
	.word	0xe5d583ec	! t1_data_exp_shm_area+0xb8
	.word	0xfa01e3d8	! t1_data_exp_shm_area+0xbc
	.word	0x3cdd5fe6	! t1_data_exp_shm_area+0xc0 (t1 bload)
	.word	0x6705d88f	! t1_data_exp_shm_area+0xc4
	.word	0xd5a71658	! t1_data_exp_shm_area+0xc8
	.word	0x53f0bb60	! t1_data_exp_shm_area+0xcc
	.word	0xbf08c221	! t1_data_exp_shm_area+0xd0
	.word	0xcb8de542	! t1_data_exp_shm_area+0xd4
	.word	0x426981d8	! t1_data_exp_shm_area+0xd8
	.word	0xe3d56f19	! t1_data_exp_shm_area+0xdc
	.word	0x07752235	! t1_data_exp_shm_area+0xe0
	.word	0xfde825f2	! t1_data_exp_shm_area+0xe4
	.word	0xfa0dd096	! t1_data_exp_shm_area+0xe8
	.word	0x4fd1ceab	! t1_data_exp_shm_area+0xec
	.word	0x0363432e	! t1_data_exp_shm_area+0xf0
	.word	0xfa278bfc	! t1_data_exp_shm_area+0xf4
	.word	0x6a6010c9	! t1_data_exp_shm_area+0xf8
	.word	0x5b27fea4	! t1_data_exp_shm_area+0xfc
	.word	0xa1ac8859	! t1_data_exp_shm_area+0x100 (t1 bstore)
	.word	0x7f3630bf	! t1_data_exp_shm_area+0x104
	.word	0x7b6078ac	! t1_data_exp_shm_area+0x108
	.word	0xfc619898	! t1_data_exp_shm_area+0x10c
	.word	0xca3712e6	! t1_data_exp_shm_area+0x110
	.word	0x49174c6f	! t1_data_exp_shm_area+0x114
	.word	0x048bf6c8	! t1_data_exp_shm_area+0x118
	.word	0x7582300f	! t1_data_exp_shm_area+0x11c
	.word	0x37db95c8	! t1_data_exp_shm_area+0x120
	.word	0x62514628	! t1_data_exp_shm_area+0x124
	.word	0xebe70278	! t1_data_exp_shm_area+0x128
	.word	0xf4a8b2c1	! t1_data_exp_shm_area+0x12c
	.word	0xa17a03e0	! t1_data_exp_shm_area+0x130
	.word	0xf7603146	! t1_data_exp_shm_area+0x134
	.word	0x6bc670aa	! t1_data_exp_shm_area+0x138
	.word	0xd66a1800	! t1_data_exp_shm_area+0x13c
t1_data_exp_shm_area_end:
t1_data_exp_shm_area_stop:



#include "asi_s.h"



/*
 * User code/data
 */


SECTION default_user TEXT_VA=T0_KAOS_BOOT_VA

.global kaos_boot

/************************************************************************
   Test case code start
 ************************************************************************/
.seg "text"
ALIGN_PAGE_8K
user_text_start:
	.skip 0x1b00			/* place at end of lower 8k of i$ */
kaos_boot:

        /* Branching code */

        ta      0x2e
	subcc	%o1, 0x4, %g2
	bl	three_or_less
	nop
	sub	%o1, 0x4, %o1
three_or_less:			
	subcc	%o1, 0x2, %g2
	bl	one_or_less
	nop
	sub	%o1, 2, %o1
one_or_less:		
        cmp      %o1, 0
        setx    t0_kaos_boot, %g2, %g3
        be,a    .+8
        jmp     %g3
        nop

        cmp      %o1, 1
        setx    t1_kaos_boot, %g2, %g3
        be,a    .+8
        jmp     %g3
        nop
        ta 0x1
        nop

                         
                        /** Thread 0 begins here ****/
t0_kaos_boot:                  
	set	t0_data_in_fp, %sp	/* setup stack pointer */

	/*
	 * setup %sp in all windows
	 * clear all window registers
	 */
	clr %l0; clr %l1; clr %l2; clr %l3; clr %l4; clr %l5; clr %l6; clr %l7
	clr %i0; clr %i1; clr %i2; clr %i3; clr %i4; clr %i5; mov %o6, %i6; clr %i7
	save	%sp, 0, %sp
	clr %l0; clr %l1; clr %l2; clr %l3; clr %l4; clr %l5; clr %l6; clr %l7
	clr %i0; clr %i1; clr %i2; clr %i3; clr %i4; clr %i5; mov %o6, %i6; clr %i7
	save	%sp, 0, %sp
	clr %l0; clr %l1; clr %l2; clr %l3; clr %l4; clr %l5; clr %l6; clr %l7
	clr %i0; clr %i1; clr %i2; clr %i3; clr %i4; clr %i5; mov %o6, %i6; clr %i7
	save	%sp, 0, %sp
	clr %l0; clr %l1; clr %l2; clr %l3; clr %l4; clr %l5; clr %l6; clr %l7
	clr %i0; clr %i1; clr %i2; clr %i3; clr %i4; clr %i5; mov %o6, %i6; clr %i7
	save	%sp, 0, %sp
	clr %l0; clr %l1; clr %l2; clr %l3; clr %l4; clr %l5; clr %l6; clr %l7
	clr %i0; clr %i1; clr %i2; clr %i3; clr %i4; clr %i5; mov %o6, %i6; clr %i7
	save	%sp, 0, %sp

	/*** REMOVED FOR NIAGARA
	clr %l0; clr %l1; clr %l2; clr %l3; clr %l4; clr %l5; clr %l6; clr %l7
	clr %i0; clr %i1; clr %i2; clr %i3; clr %i4; clr %i5; mov %o6, %i6; clr %i7
	save	%sp, 0, %sp
	clr %l0; clr %l1; clr %l2; clr %l3; clr %l4; clr %l5; clr %l6; clr %l7
	clr %i0; clr %i1; clr %i2; clr %i3; clr %i4; clr %i5; mov %o6, %i6; clr %i7

	save	%sp, 0, %sp
	clr %l0; clr %l1; clr %l2; clr %l3; clr %l4; clr %l5; clr %l6; clr %l7
	clr %i0; clr %i1; clr %i2; clr %i3; clr %i4; clr %i5; mov %o6, %i6; clr %i7
	save	%sp, 0, %sp
	****/

	restore	%sp, 0, %sp
	restore	%sp, 0, %sp
	restore	%sp, 0, %sp
	restore	%sp, 0, %sp
	restore	%sp, 0, %sp
	/*** REMOVED FOR NIAGARA
	restore	%sp, 0, %sp
	restore	%sp, 0, %sp
	restore	%sp, 0, %sp
	***/


#if defined(T0_KAOS_TICK)
	ta	TRAP_INIT_TICK_COMPARE	/* init tick compare register */
#endif
	set	t0_data_in_regs, %o0	/* Tell trap handlers where */

	! HARI ta	TRAP_SETDATA		/* data area is */
	! ta	T_TRAP_INST0		/* data area is */

	! HARI mov	ASI_PRIMARY, %asi	/* Setup asi register */
	wr %g0, ASI_PRIMARY, %asi

#ifdef SET_WORKS
	set	t0_ktbl, %o0		/* execute random code */
#else
	setx	t0_ktbl, %l0, %o0	/* execute random code */
#endif
	set	t0_data_in_regs, %o1
	set	t0_data_in_mtbl_size, %o2
	ld	[%o2], %o2
	set	t0_data_in_mtbl, %o3
	mov	XFLAG_SGI|XFLAG_V9, %o4
	call	__kaos
	nop

#if defined(T0_KAOS_TWOPASS)
/*
 * Preload d$ with data
 */
t0_two_pass_preload:
	set	T0_KAOS_AREAS, %l0		/* get area table size */
	set	t0_offset_table_size, %l1	/* get offset table size */
	ld	[%l1], %l1
	set	t0_data_exp_mtbl, %l2		/* point to last area */
	sub	%l2, 16, %l2
	sll	%l0, 2, %l3
	sub	%l2, %l3, %l2
	set	t0_offset_table, %l3		/* point to first offset */

1:
	ld	[%l2], %l7			/* point to next area */
	mov	%l1, %l4			/* offset table size */
	mov	%l3, %l5			/* offset table */
2:
	ld	[%l5], %l6			/* get next offset */
	ld	[%l6+%l7], %o0			/* preload d$ with data */
	deccc	%l4				/* loop until out of offsets */
	bne	2b
	add	%l5, 4, %l5

/*
 * only need to do one area because areasize = D$ size
 */
	deccc	%l0				/* loop until out of areas */
	bne	1b
	add	%l2, 4, %l2

/*
 * Execute random code for a second time
 */
	set	t0_data_exp_fp, %sp		/* setup stack pointer */
	save	%sp, 0, %sp			/* setup %sp in all windows */
	save	%sp, 0, %sp
	save	%sp, 0, %sp
	save	%sp, 0, %sp
	save	%sp, 0, %sp
	save	%sp, 0, %sp
	save	%sp, 0, %sp
	save	%sp, 0, %sp
#ifdef SET_WORKS
	set	t0_ktbl, %o0			/* execute random code */
#else
	setx	t0_ktbl, %l0, %o0		/* execute random code */
#endif
        set     t0_data_exp_regs, %o1
        set     t0_data_exp_mtbl_size, %o2
        ld      [%o2], %o2
        set     t0_data_exp_mtbl, %o3
	mov	XFLAG_SGI|XFLAG_V9, %o4
t0_two_pass_execute:
        call    __kaos
        nop
#endif

#if defined(T0_KAOS_VERIFY)
/*
 * Code to verify expected==observed
 * Do not run this option under RTL because it takes forever
 */
t0_kverify_regs:
	set	t0_data_in_regs, %o0		/* Point to observed regs */
	set	t0_data_exp_regs, %o1		/* Point to expected regs */
	call	t0_kcmp				/* Compare expected/observed registers */
	set	KDATA_MAX_IDX, %o2		/* Count of words to compare */

t0_kverify_area:
	set	T0_KAOS_AREAS, %l0		/* get area table size */
	set	t0_data_in_mtbl, %l1		/* point to observed area pointers */
	sub	%l1, 16, %l1
	set	t0_data_exp_mtbl, %l2		/* point to expected area pointers */
	sub	%l2, 16, %l2
	set	t0_data_in_area0, %l3		/* Calculate offset to beginning of area */
	set	t0_data_in_area0_begin, %l4
	sub	%l3, %l4, %l3
	set	t0_data_in_area0_end, %l4	/* Calculate number of words in each area */
	set	t0_data_in_area0_begin, %l5
	sub	%l4, %l5, %l4
	srl	%l4, 2, %l4
t0_kverify_area_loop:
	sub	%l1, 4, %l1			/* Point to next area */
	sub	%l2, 4, %l2
	ld	[%l1], %o0			/* Point to start of observed area data */
	sub	%o0, %l3, %o0
	ld	[%l2], %o1			/* Point to start of expected area data */
	sub	%o1, %l3, %o1
	call	t0_kcmp				/* Compare expected/observed areas */
	mov	%l4, %o2			/* Setup count of words to verify */

	deccc	%l0				/* loop until out of areas */
	bne	t0_kverify_area_loop
	nop
#endif


        ta      T_GOOD_TRAP
        nop


                        /** Thread 1 begins here ****/
t1_kaos_boot:                  
	set	t1_data_in_fp, %sp	/* setup stack pointer */

	/*
	 * setup %sp in all windows
	 * clear all window registers
	 */
	clr %l0; clr %l1; clr %l2; clr %l3; clr %l4; clr %l5; clr %l6; clr %l7
	clr %i0; clr %i1; clr %i2; clr %i3; clr %i4; clr %i5; mov %o6, %i6; clr %i7
	save	%sp, 0, %sp
	clr %l0; clr %l1; clr %l2; clr %l3; clr %l4; clr %l5; clr %l6; clr %l7
	clr %i0; clr %i1; clr %i2; clr %i3; clr %i4; clr %i5; mov %o6, %i6; clr %i7
	save	%sp, 0, %sp
	clr %l0; clr %l1; clr %l2; clr %l3; clr %l4; clr %l5; clr %l6; clr %l7
	clr %i0; clr %i1; clr %i2; clr %i3; clr %i4; clr %i5; mov %o6, %i6; clr %i7
	save	%sp, 0, %sp
	clr %l0; clr %l1; clr %l2; clr %l3; clr %l4; clr %l5; clr %l6; clr %l7
	clr %i0; clr %i1; clr %i2; clr %i3; clr %i4; clr %i5; mov %o6, %i6; clr %i7
	save	%sp, 0, %sp
	clr %l0; clr %l1; clr %l2; clr %l3; clr %l4; clr %l5; clr %l6; clr %l7
	clr %i0; clr %i1; clr %i2; clr %i3; clr %i4; clr %i5; mov %o6, %i6; clr %i7
	save	%sp, 0, %sp

	/*** REMOVED FOR NIAGARA
	clr %l0; clr %l1; clr %l2; clr %l3; clr %l4; clr %l5; clr %l6; clr %l7
	clr %i0; clr %i1; clr %i2; clr %i3; clr %i4; clr %i5; mov %o6, %i6; clr %i7
	save	%sp, 0, %sp
	clr %l0; clr %l1; clr %l2; clr %l3; clr %l4; clr %l5; clr %l6; clr %l7
	clr %i0; clr %i1; clr %i2; clr %i3; clr %i4; clr %i5; mov %o6, %i6; clr %i7

	save	%sp, 0, %sp
	clr %l0; clr %l1; clr %l2; clr %l3; clr %l4; clr %l5; clr %l6; clr %l7
	clr %i0; clr %i1; clr %i2; clr %i3; clr %i4; clr %i5; mov %o6, %i6; clr %i7
	save	%sp, 0, %sp
	****/

	restore	%sp, 0, %sp
	restore	%sp, 0, %sp
	restore	%sp, 0, %sp
	restore	%sp, 0, %sp
	restore	%sp, 0, %sp
	/*** REMOVED FOR NIAGARA
	restore	%sp, 0, %sp
	restore	%sp, 0, %sp
	restore	%sp, 0, %sp
	***/


#if defined(T1_KAOS_TICK)
	ta	TRAP_INIT_TICK_COMPARE	/* init tick compare register */
#endif
	set	t1_data_in_regs, %o0	/* Tell trap handlers where */

	! HARI ta	TRAP_SETDATA		/* data area is */
	! ta	T_TRAP_INST0		/* data area is */

	! HARI mov	ASI_PRIMARY, %asi	/* Setup asi register */
	wr %g0, ASI_PRIMARY, %asi

#ifdef SET_WORKS
	set	t1_ktbl, %o0		/* execute random code */
#else
	setx	t1_ktbl, %l0, %o0	/* execute random code */
#endif
	set	t1_data_in_regs, %o1
	set	t1_data_in_mtbl_size, %o2
	ld	[%o2], %o2
	set	t1_data_in_mtbl, %o3
	mov	XFLAG_SGI|XFLAG_V9, %o4
	call	__kaos
	nop

#if defined(T1_KAOS_TWOPASS)
/*
 * Preload d$ with data
 */
t1_two_pass_preload:
	set	T1_KAOS_AREAS, %l0		/* get area table size */
	set	t1_offset_table_size, %l1	/* get offset table size */
	ld	[%l1], %l1
	set	t1_data_exp_mtbl, %l2		/* point to last area */
	sub	%l2, 16, %l2
	sll	%l0, 2, %l3
	sub	%l2, %l3, %l2
	set	t1_offset_table, %l3		/* point to first offset */

1:
	ld	[%l2], %l7			/* point to next area */
	mov	%l1, %l4			/* offset table size */
	mov	%l3, %l5			/* offset table */
2:
	ld	[%l5], %l6			/* get next offset */
	ld	[%l6+%l7], %o0			/* preload d$ with data */
	deccc	%l4				/* loop until out of offsets */
	bne	2b
	add	%l5, 4, %l5

/*
 * only need to do one area because areasize = D$ size
 */
	deccc	%l0				/* loop until out of areas */
	bne	1b
	add	%l2, 4, %l2

/*
 * Execute random code for a second time
 */
	set	t1_data_exp_fp, %sp		/* setup stack pointer */
	save	%sp, 0, %sp			/* setup %sp in all windows */
	save	%sp, 0, %sp
	save	%sp, 0, %sp
	save	%sp, 0, %sp
	save	%sp, 0, %sp
	save	%sp, 0, %sp
	save	%sp, 0, %sp
	save	%sp, 0, %sp
#ifdef SET_WORKS
	set	t1_ktbl, %o0			/* execute random code */
#else
	setx	t1_ktbl, %l0, %o0		/* execute random code */
#endif
        set     t1_data_exp_regs, %o1
        set     t1_data_exp_mtbl_size, %o2
        ld      [%o2], %o2
        set     t1_data_exp_mtbl, %o3
	mov	XFLAG_SGI|XFLAG_V9, %o4
t1_two_pass_execute:
        call    __kaos
        nop
#endif

#if defined(T1_KAOS_VERIFY)
/*
 * Code to verify expected==observed
 * Do not run this option under RTL because it takes forever
 */
t1_kverify_regs:
	set	t1_data_in_regs, %o0		/* Point to observed regs */
	set	t1_data_exp_regs, %o1		/* Point to expected regs */
	call	t1_kcmp				/* Compare expected/observed registers */
	set	KDATA_MAX_IDX, %o2		/* Count of words to compare */

t1_kverify_area:
	set	T1_KAOS_AREAS, %l0		/* get area table size */
	set	t1_data_in_mtbl, %l1		/* point to observed area pointers */
	sub	%l1, 16, %l1
	set	t1_data_exp_mtbl, %l2		/* point to expected area pointers */
	sub	%l2, 16, %l2
	set	t1_data_in_area0, %l3		/* Calculate offset to beginning of area */
	set	t1_data_in_area0_begin, %l4
	sub	%l3, %l4, %l3
	set	t1_data_in_area0_end, %l4	/* Calculate number of words in each area */
	set	t1_data_in_area0_begin, %l5
	sub	%l4, %l5, %l4
	srl	%l4, 2, %l4
t1_kverify_area_loop:
	sub	%l1, 4, %l1			/* Point to next area */
	sub	%l2, 4, %l2
	ld	[%l1], %o0			/* Point to start of observed area data */
	sub	%o0, %l3, %o0
	ld	[%l2], %o1			/* Point to start of expected area data */
	sub	%o1, %l3, %o1
	call	t1_kcmp				/* Compare expected/observed areas */
	mov	%l4, %o2			/* Setup count of words to verify */

	deccc	%l0				/* loop until out of areas */
	bne	t1_kverify_area_loop
	nop
#endif


        ta      T_GOOD_TRAP
        nop

/************************************************************************
   Routine to compare expected/observed  values
   Input:
	%o0	observed data pointer
	%o1	expected data pointer
	%o2	count of words to compare
 ************************************************************************/
#if defined(T0_KAOS_VERIFY)
t0_kcmp:
	ld	[%o0], %o3
	ld	[%o1], %o4
	cmp	%o3, %o4
	tne	BAD_TRAP
	deccc	%o2
	bne	t0_kcmp
	nop

	retl
	nop
#endif


#if defined(T1_KAOS_VERIFY)
t1_kcmp:
	ld	[%o0], %o3
	ld	[%o1], %o4
	cmp	%o3, %o4
	tne	BAD_TRAP
	deccc	%o2
	bne	t1_kcmp
	nop

	retl
	nop
#endif



/************************************************************************
   Test case data start
 ************************************************************************/
.seg "data"
ALIGN_PAGE_8K

user_data_start:

.seg "text"			/* Realign default segments */
user_text_end:
ALIGN_PAGE_8K
.seg "data"
user_data_end:


/************************************************************************
   Test case end
 ************************************************************************/

attr_text {
        Name = default_user,
        VA=T0_KAOS_BOOT_VA, 
	PA=ra2pa(T0_KAOS_BOOT_PA,0),
	RA=T0_KAOS_BOOT_PA,
        part_0_ctx_nonzero_tsb_config_0,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=T0_KAOS_BOOT_CACHEABLE, TTE_CV=T0_KAOS_BOOT_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=0
        }

attr_text {
        Name = kaos_startup,
        VA=T0_KAOS_STARTUP_VA, 
	PA=ra2pa(T0_KAOS_STARTUP_PA,0),
	RA=T0_KAOS_STARTUP_PA,
        part_0_ctx_nonzero_tsb_config_1,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=T0_KAOS_STARTUP_CACHEABLE, TTE_CV=T0_KAOS_STARTUP_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=0
        }


attr_text {
        Name = kaos_done,
        VA=T0_KAOS_DONE_VA, 
	PA=ra2pa(T0_KAOS_DONE_PA,0),
	RA=T0_KAOS_DONE_PA,
        part_0_ctx_nonzero_tsb_config_2,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=T0_KAOS_DONE_CACHEABLE, TTE_CV=T0_KAOS_DONE_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=0
        }


attr_text {
        Name = t0_module_ktbl, 
        VA=T0_KAOS_KTBL_VA, 
	PA=ra2pa(T0_KAOS_KTBL_PA,0),
	RA=T0_KAOS_KTBL_PA,
        part_0_ctx_nonzero_tsb_config_3,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=T0_KAOS_KTBL_CACHEABLE, TTE_CV=T0_KAOS_KTBL_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=0
        }


attr_text {
        Name = t0_module_ktbl,
        VA=T0_KAOS_KTBL_VA,
	PA=ra2pa(T0_KAOS_KTBL_PA,0),
	RA=T0_KAOS_KTBL_PA,
        part_0_ctx_nonzero_tsb_config_0,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=T0_KAOS_KTBL_CACHEABLE, TTE_CV=T0_KAOS_KTBL_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1, tsbonly
        }


attr_text {
        Name = t0_module_subr0, 
        VA=T0_KAOS_SUBR0_VA, 
	PA=ra2pa(T0_KAOS_SUBR0_PA,0),
	RA=T0_KAOS_SUBR0_PA,
        part_0_ctx_nonzero_tsb_config_1,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=T0_KAOS_SUBR0_CACHEABLE, TTE_CV=T0_KAOS_SUBR0_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=0
        }

attr_text {
        Name = t0_module_subr1, 
        VA=T0_KAOS_SUBR1_VA, 
	PA=ra2pa(T0_KAOS_SUBR1_PA,0),
	RA=T0_KAOS_SUBR1_PA,
        part_0_ctx_nonzero_tsb_config_2,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=T0_KAOS_SUBR1_CACHEABLE, TTE_CV=T0_KAOS_SUBR1_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=0
        }


attr_text {
        Name = t0_module_subr2, 
        VA=T0_KAOS_SUBR2_VA, 
	PA=ra2pa(T0_KAOS_SUBR2_PA,0),
	RA=T0_KAOS_SUBR2_PA,
        part_0_ctx_nonzero_tsb_config_3,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=T0_KAOS_SUBR2_CACHEABLE, TTE_CV=T0_KAOS_SUBR2_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=0
        }


attr_text {
        Name = t0_module_subr3, 
        VA=T0_KAOS_SUBR3_VA, 
	PA=ra2pa(T0_KAOS_SUBR3_PA,0),
	RA=T0_KAOS_SUBR3_PA,
        part_0_ctx_nonzero_tsb_config_0,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=T0_KAOS_SUBR3_CACHEABLE, TTE_CV=T0_KAOS_SUBR3_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=0
        }


attr_data {
        Name = t0_module_offset_table,
        VA=T0_KAOS_OFFSET_TBL_VA, 
	PA=ra2pa(T0_KAOS_OFFSET_TBL_PA,0),
	RA=T0_KAOS_OFFSET_TBL_PA,
        part_0_ctx_nonzero_tsb_config_1,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T0_KAOS_OFFSET_TBL_CACHEABLE, TTE_CV=T0_KAOS_OFFSET_TBL_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }





attr_data {
        Name = t0_module_data_in_regs,
        VA=T0_KAOS_RUN_REGS_VA, 
	PA=ra2pa(T0_KAOS_RUN_REGS_PA,0),
	RA=T0_KAOS_RUN_REGS_PA,
        part_0_ctx_nonzero_tsb_config_2,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T0_KAOS_RUN_REGS_CACHEABLE, TTE_CV=T0_KAOS_RUN_REGS_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }



attr_data {
        Name = t0_module_data_in_stack,
        VA=T0_KAOS_RUN_STACK_VA, 
	PA=ra2pa(T0_KAOS_RUN_STACK_PA,0),
	RA=T0_KAOS_RUN_STACK_PA,
        part_0_ctx_nonzero_tsb_config_3,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T0_KAOS_RUN_STACK_CACHEABLE, TTE_CV=T0_KAOS_RUN_STACK_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }



attr_data {
        Name = t0_module_data_in_area0,
        VA=T0_KAOS_RUN_AREA0_VA, 
	PA=ra2pa(T0_KAOS_RUN_AREA0_PA,0),
	RA=T0_KAOS_RUN_AREA0_PA,
        part_0_ctx_nonzero_tsb_config_0,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T0_KAOS_RUN_AREA0_CACHEABLE, TTE_CV=T0_KAOS_RUN_AREA0_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }


#if defined(T0_KAOS_AREA1)
attr_data {
        Name = t0_module_data_in_area1,
        VA=T0_KAOS_RUN_AREA1_VA, 
	PA=ra2pa(T0_KAOS_RUN_AREA1_PA,0),
	RA=T0_KAOS_RUN_AREA1_PA,
        part_0_ctx_nonzero_tsb_config_1,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T0_KAOS_RUN_AREA1_CACHEABLE, TTE_CV=T0_KAOS_RUN_AREA1_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T0_KAOS_AREA2)
attr_data {
        Name = t0_module_data_in_area2,
        VA=T0_KAOS_RUN_AREA2_VA, 
	PA=ra2pa(T0_KAOS_RUN_AREA2_PA,0),
	RA=T0_KAOS_RUN_AREA2_PA,
        part_0_ctx_nonzero_tsb_config_2,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T0_KAOS_RUN_AREA2_CACHEABLE, TTE_CV=T0_KAOS_RUN_AREA2_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T0_KAOS_AREA3)
attr_data {
        Name = t0_module_data_in_area3,
        VA=T0_KAOS_RUN_AREA3_VA, 
	PA=ra2pa(T0_KAOS_RUN_AREA3_PA,0),
	RA=T0_KAOS_RUN_AREA3_PA,
        part_0_ctx_nonzero_tsb_config_3,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T0_KAOS_RUN_AREA3_CACHEABLE, TTE_CV=T0_KAOS_RUN_AREA3_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif

#if defined(T0_KAOS_AREA4)
attr_data {
        Name = t0_module_data_in_area4,
        VA=T0_KAOS_RUN_AREA4_VA, 
	PA=ra2pa(T0_KAOS_RUN_AREA4_PA,0),
	RA=T0_KAOS_RUN_AREA4_PA,
        part_0_ctx_nonzero_tsb_config_0,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T0_KAOS_RUN_AREA4_CACHEABLE, TTE_CV=T0_KAOS_RUN_AREA4_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T0_KAOS_AREA5)
attr_data {
        Name = t0_module_data_in_area5,
        VA=T0_KAOS_RUN_AREA5_VA, 
	PA=ra2pa(T0_KAOS_RUN_AREA5_PA,0),
	RA=T0_KAOS_RUN_AREA5_PA,
        part_0_ctx_nonzero_tsb_config_1,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T0_KAOS_RUN_AREA5_CACHEABLE, TTE_CV=T0_KAOS_RUN_AREA5_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T0_KAOS_AREA6)
attr_data {
        Name = t0_module_data_in_area6,
        VA=T0_KAOS_RUN_AREA6_VA, 
	PA=ra2pa(T0_KAOS_RUN_AREA6_PA,0),
	RA=T0_KAOS_RUN_AREA6_PA,
        part_0_ctx_nonzero_tsb_config_2,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T0_KAOS_RUN_AREA6_CACHEABLE, TTE_CV=T0_KAOS_RUN_AREA6_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T0_KAOS_AREA7)
attr_data {
        Name = t0_module_data_in_area7,
        VA=T0_KAOS_RUN_AREA7_VA, 
	PA=ra2pa(T0_KAOS_RUN_AREA7_PA,0),
	RA=T0_KAOS_RUN_AREA7_PA,
        part_0_ctx_nonzero_tsb_config_3,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T0_KAOS_RUN_AREA7_CACHEABLE, TTE_CV=T0_KAOS_RUN_AREA7_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T0_KAOS_AREA8)
attr_data {
        Name = t0_module_data_in_area8,
        VA=T0_KAOS_RUN_AREA8_VA, 
	PA=ra2pa(T0_KAOS_RUN_AREA8_PA,0),
	RA=T0_KAOS_RUN_AREA8_PA,
        part_0_ctx_nonzero_tsb_config_0,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T0_KAOS_RUN_AREA8_CACHEABLE, TTE_CV=T0_KAOS_RUN_AREA8_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T0_KAOS_AREA9)
attr_data {
        Name = t0_module_data_in_area9,
        VA=T0_KAOS_RUN_AREA9_VA, 
	PA=ra2pa(T0_KAOS_RUN_AREA9_PA,0),
	RA=T0_KAOS_RUN_AREA9_PA,
        part_0_ctx_nonzero_tsb_config_1,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T0_KAOS_RUN_AREA9_CACHEABLE, TTE_CV=T0_KAOS_RUN_AREA9_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T0_KAOS_AREA10)
attr_data {
        Name = t0_module_data_in_area10,
        VA=T0_KAOS_RUN_AREA10_VA, 
	PA=ra2pa(T0_KAOS_RUN_AREA10_PA,0),
	RA=T0_KAOS_RUN_AREA10_PA,
        part_0_ctx_nonzero_tsb_config_2,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T0_KAOS_RUN_AREA10_CACHEABLE, TTE_CV=T0_KAOS_RUN_AREA10_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T0_KAOS_AREA11)
attr_data {
        Name = t0_module_data_in_area11,
        VA=T0_KAOS_RUN_AREA11_VA, 
	PA=ra2pa(T0_KAOS_RUN_AREA11_PA,0),
	RA=T0_KAOS_RUN_AREA11_PA,
        part_0_ctx_nonzero_tsb_config_3,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T0_KAOS_RUN_AREA11_CACHEABLE, TTE_CV=T0_KAOS_RUN_AREA11_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T0_KAOS_AREA12)
attr_data {
        Name = t0_module_data_in_area12,
        VA=T0_KAOS_RUN_AREA12_VA, 
	PA=ra2pa(T0_KAOS_RUN_AREA12_PA,0),
	RA=T0_KAOS_RUN_AREA12_PA,
        part_0_ctx_nonzero_tsb_config_0,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T0_KAOS_RUN_AREA12_CACHEABLE, TTE_CV=T0_KAOS_RUN_AREA12_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T0_KAOS_AREA13)
attr_data {
        Name = t0_module_data_in_area13,
        VA=T0_KAOS_RUN_AREA13_VA, 
	PA=ra2pa(T0_KAOS_RUN_AREA13_PA,0),
	RA=T0_KAOS_RUN_AREA13_PA,
        part_0_ctx_nonzero_tsb_config_1,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T0_KAOS_RUN_AREA13_CACHEABLE, TTE_CV=T0_KAOS_RUN_AREA13_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T0_KAOS_AREA14)
attr_data {
        Name = t0_module_data_in_area14,
        VA=T0_KAOS_RUN_AREA14_VA, 
	PA=ra2pa(T0_KAOS_RUN_AREA14_PA,0),
	RA=T0_KAOS_RUN_AREA14_PA,
        part_0_ctx_nonzero_tsb_config_2,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T0_KAOS_RUN_AREA14_CACHEABLE, TTE_CV=T0_KAOS_RUN_AREA14_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T0_KAOS_AREA15)
attr_data {
        Name = t0_module_data_in_area15,
        VA=T0_KAOS_RUN_AREA15_VA, 
	PA=ra2pa(T0_KAOS_RUN_AREA15_PA,0),
	RA=T0_KAOS_RUN_AREA15_PA,
        part_0_ctx_nonzero_tsb_config_3,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T0_KAOS_RUN_AREA15_CACHEABLE, TTE_CV=T0_KAOS_RUN_AREA15_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T0_KAOS_SHM_AREA)
attr_data {
        Name = t0_module_data_in_shm_area,
        VA=T0_KAOS_RUN_SHM_AREA_VA, 
	PA=ra2pa(T0_KAOS_RUN_SHM_AREA_PA,0),
	RA=T0_KAOS_RUN_SHM_AREA_PA,
        part_0_ctx_nonzero_tsb_config_0,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T0_KAOS_RUN_SHM_AREA_CACHEABLE, TTE_CV=T0_KAOS_RUN_SHM_AREA_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


attr_data {
        Name = t0_module_data_exp_regs,
        VA=T0_KAOS_EXP_REGS_VA, 
	PA=ra2pa(T0_KAOS_EXP_REGS_PA,0),
	RA=T0_KAOS_EXP_REGS_PA,
        part_0_ctx_nonzero_tsb_config_1,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T0_KAOS_EXP_REGS_CACHEABLE, TTE_CV=T0_KAOS_EXP_REGS_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }


attr_data {
        Name = t0_module_data_exp_stack,
        VA=T0_KAOS_EXP_STACK_VA, 
	PA=ra2pa(T0_KAOS_EXP_STACK_PA,0),
	RA=T0_KAOS_EXP_STACK_PA,
        part_0_ctx_nonzero_tsb_config_2,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T0_KAOS_EXP_STACK_CACHEABLE, TTE_CV=T0_KAOS_EXP_STACK_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }



#if defined(T0_KAOS_AREA0)
attr_data {
        Name = t0_module_data_exp_area0,
        VA=T0_KAOS_EXP_AREA0_VA, 
	PA=ra2pa(T0_KAOS_EXP_AREA0_PA,0),
	RA=T0_KAOS_EXP_AREA0_PA,
        part_0_ctx_nonzero_tsb_config_3,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T0_KAOS_EXP_AREA0_CACHEABLE, TTE_CV=T0_KAOS_EXP_AREA0_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif



#if defined(T0_KAOS_AREA1)
attr_data {
        Name = t0_module_data_exp_area1,
        VA=T0_KAOS_EXP_AREA1_VA, 
	PA=ra2pa(T0_KAOS_EXP_AREA1_PA,0),
	RA=T0_KAOS_EXP_AREA1_PA,
        part_0_ctx_nonzero_tsb_config_0,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T0_KAOS_EXP_AREA1_CACHEABLE, TTE_CV=T0_KAOS_EXP_AREA1_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif

#if defined(T0_KAOS_AREA2)
attr_data {
        Name = t0_module_data_exp_area2,
        VA=T0_KAOS_EXP_AREA2_VA, 
	PA=ra2pa(T0_KAOS_EXP_AREA2_PA,0),
	RA=T0_KAOS_EXP_AREA2_PA,
        part_0_ctx_nonzero_tsb_config_1,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T0_KAOS_EXP_AREA2_CACHEABLE, TTE_CV=T0_KAOS_EXP_AREA2_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif

#if defined(T0_KAOS_AREA3)
attr_data {
        Name = t0_module_data_exp_area3,
        VA=T0_KAOS_EXP_AREA3_VA, 
	PA=ra2pa(T0_KAOS_EXP_AREA3_PA,0),
	RA=T0_KAOS_EXP_AREA3_PA,
        part_0_ctx_nonzero_tsb_config_2,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T0_KAOS_EXP_AREA3_CACHEABLE, TTE_CV=T0_KAOS_EXP_AREA3_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T0_KAOS_AREA4)
attr_data {
        Name = t0_module_data_exp_area4,
        VA=T0_KAOS_EXP_AREA4_VA, 
	PA=ra2pa(T0_KAOS_EXP_AREA4_PA,0),
	RA=T0_KAOS_EXP_AREA4_PA,
        part_0_ctx_nonzero_tsb_config_3,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T0_KAOS_EXP_AREA4_CACHEABLE, TTE_CV=T0_KAOS_EXP_AREA4_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T0_KAOS_AREA5)
attr_data {
        Name = t0_module_data_exp_area5,
        VA=T0_KAOS_EXP_AREA5_VA, 
	PA=ra2pa(T0_KAOS_EXP_AREA5_PA,0),
	RA=T0_KAOS_EXP_AREA5_PA,
        part_0_ctx_nonzero_tsb_config_0,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T0_KAOS_EXP_AREA5_CACHEABLE, TTE_CV=T0_KAOS_EXP_AREA5_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T0_KAOS_AREA6)
attr_data {
        Name = t0_module_data_exp_area6,
        VA=T0_KAOS_EXP_AREA6_VA, 
	PA=ra2pa(T0_KAOS_EXP_AREA6_PA,0),
	RA=T0_KAOS_EXP_AREA6_PA,
        part_0_ctx_nonzero_tsb_config_1,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T0_KAOS_EXP_AREA6_CACHEABLE, TTE_CV=T0_KAOS_EXP_AREA6_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T0_KAOS_AREA7)
attr_data {
        Name = t0_module_data_exp_area7,
        VA=T0_KAOS_EXP_AREA7_VA, 
	PA=ra2pa(T0_KAOS_EXP_AREA7_PA,0),
	RA=T0_KAOS_EXP_AREA7_PA,
        part_0_ctx_nonzero_tsb_config_2,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T0_KAOS_EXP_AREA7_CACHEABLE, TTE_CV=T0_KAOS_EXP_AREA7_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T0_KAOS_AREA8)
attr_data {
        Name = t0_module_data_exp_area8,
        VA=T0_KAOS_EXP_AREA8_VA, 
	PA=ra2pa(T0_KAOS_EXP_AREA8_PA,0),
	RA=T0_KAOS_EXP_AREA8_PA,
        part_0_ctx_nonzero_tsb_config_3,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T0_KAOS_EXP_AREA8_CACHEABLE, TTE_CV=T0_KAOS_EXP_AREA8_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T0_KAOS_AREA9)
attr_data {
        Name = t0_module_data_exp_area9,
        VA=T0_KAOS_EXP_AREA9_VA, 
	PA=ra2pa(T0_KAOS_EXP_AREA9_PA,0),
	RA=T0_KAOS_EXP_AREA9_PA,
        part_0_ctx_nonzero_tsb_config_0,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T0_KAOS_EXP_AREA9_CACHEABLE, TTE_CV=T0_KAOS_EXP_AREA9_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T0_KAOS_AREA10)
attr_data {
        Name = t0_module_data_exp_area10,
        VA=T0_KAOS_EXP_AREA10_VA, 
	PA=ra2pa(T0_KAOS_EXP_AREA10_PA,0),
	RA=T0_KAOS_EXP_AREA10_PA,
        part_0_ctx_nonzero_tsb_config_1,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T0_KAOS_EXP_AREA10_CACHEABLE, TTE_CV=T0_KAOS_EXP_AREA10_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T0_KAOS_AREA11)
attr_data {
        Name = t0_module_data_exp_area11,
        VA=T0_KAOS_EXP_AREA11_VA, 
	PA=ra2pa(T0_KAOS_EXP_AREA11_PA,0),
	RA=T0_KAOS_EXP_AREA11_PA,
        part_0_ctx_nonzero_tsb_config_2,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T0_KAOS_EXP_AREA11_CACHEABLE, TTE_CV=T0_KAOS_EXP_AREA11_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T0_KAOS_AREA12)
attr_data {
        Name = t0_module_data_exp_area12,
        VA=T0_KAOS_EXP_AREA12_VA, 
	PA=ra2pa(T0_KAOS_EXP_AREA12_PA,0),
	RA=T0_KAOS_EXP_AREA12_PA,
        part_0_ctx_nonzero_tsb_config_3,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T0_KAOS_EXP_AREA12_CACHEABLE, TTE_CV=T0_KAOS_EXP_AREA12_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T0_KAOS_AREA13)
attr_data {
        Name = t0_module_data_exp_area13,
        VA=T0_KAOS_EXP_AREA13_VA, 
	PA=ra2pa(T0_KAOS_EXP_AREA13_PA,0),
	RA=T0_KAOS_EXP_AREA13_PA,
        part_0_ctx_nonzero_tsb_config_0,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T0_KAOS_EXP_AREA13_CACHEABLE, TTE_CV=T0_KAOS_EXP_AREA13_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T0_KAOS_AREA14)
attr_data {
        Name = t0_module_data_exp_area14,
        VA=T0_KAOS_EXP_AREA14_VA, 
	PA=ra2pa(T0_KAOS_EXP_AREA14_PA,0),
	RA=T0_KAOS_EXP_AREA14_PA,
        part_0_ctx_nonzero_tsb_config_1,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T0_KAOS_EXP_AREA14_CACHEABLE, TTE_CV=T0_KAOS_EXP_AREA14_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif

#if defined(T0_KAOS_AREA15)
attr_data {
        Name = t0_module_data_exp_area15,
        VA=T0_KAOS_EXP_AREA15_VA, 
	PA=ra2pa(T0_KAOS_EXP_AREA15_PA,0),
	RA=T0_KAOS_EXP_AREA15_PA,
        part_0_ctx_nonzero_tsb_config_2,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T0_KAOS_EXP_AREA15_CACHEABLE, TTE_CV=T0_KAOS_EXP_AREA15_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T0_KAOS_SHM_AREA)
attr_data {
        Name = t0_module_data_exp_shm_area,
        VA=T0_KAOS_EXP_SHM_AREA_VA, 
	PA=ra2pa(T0_KAOS_EXP_SHM_AREA_PA,0),
	RA=T0_KAOS_EXP_SHM_AREA_PA,
        part_0_ctx_nonzero_tsb_config_3,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T0_KAOS_EXP_SHM_AREA_CACHEABLE, TTE_CV=T0_KAOS_EXP_SHM_AREA_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif





/************************************************************************
   Test case end
 ************************************************************************/


attr_text {
        Name = local_supervisor_section_text,
        VA=LOCAL_SUPERVISOR_SECTION_TEXT_VA, 
	PA=ra2pa(LOCAL_SUPERVISOR_SECTION_TEXT_PA,0),
	RA=LOCAL_SUPERVISOR_SECTION_TEXT_PA,
        part_0_ctx_zero_tsb_config_0,
        TTE_G=1, TTE_Context=0x0, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=T0_KAOS_BOOT_CACHEABLE, TTE_CV=T0_KAOS_BOOT_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=0
        }

SECTION local_supervisor_section_text TEXT_VA=LOCAL_SUPERVISOR_SECTION_TEXT_VA


/*
 * Check if we have a data sigsegv
 * %g2 has the virtual page number (32-13 => 19 bits)

 * Must be all 1's or all 0's for a legal sigsegv
 */
.global data_segv_check
data_segv_check:
        ta       0x2e
        cmp      %o1, 0
        setx      LOCAL_SUPERVISOR_SECTION_DATA_VA_0, %g1, %o2
        be,a     1f
        nop
        cmp      %o1, 1
        setx      LOCAL_SUPERVISOR_SECTION_DATA_VA_1, %g1, %o2
        be,a     1f
        nop
        cmp      %o1, 2
        setx      LOCAL_SUPERVISOR_SECTION_DATA_VA_2, %g1, %o2
        be,a     1f
        nop
        cmp      %o1, 3
        setx      LOCAL_SUPERVISOR_SECTION_DATA_VA_3, %g1, %o2
        be,a     1f
        nop
        ta       0x1
        nop

1:      ldx       [%o2], %g1

        lda      [%g1]ASI_PRIMARY, %g2

        sethi    %hi(0xc1f80000), %g3
        sethi    %hi(0x81d80000), %g1
        and      %g2, %g3, %g2
        cmp      %g2, %g1
        bne,pt   %xcc, 1f  ! not a flush
        nop
        done
        nop


1:                      sethi   %hi(0x7ffff), %g2
                        or      %g2, %lo(0x7ffff), %g2
/* Check page 0 */      andcc   %g2, %g4, %g1

                        !te      T_TRAP_INST0
			!be,pt    %xcc, increment_sigsegv_count
			be,pt    %xcc, 2f

/* Check last page */   cmp     %g2, %g1

                        !te      T_TRAP_INST0
			be,pt    %xcc, 2f
			nop
			ta	0x1 !bad trap
			nop
2:
                        done
			nop

increment_sigsegv_count:
                        wr      %g0, ASI_PRIMARY, %asi
			set     T0_KAOS_RUN_REGS_VA, %g7
                        lda     [%g7+KDATA_ETRAP_SIGSEGV_OFF]%asi, %g6
                        inc     %g6 
                        sta     %g6, [%g7+KDATA_ETRAP_SIGSEGV_OFF]%asi 

			done
			nop




/* for illegal trap handling */

.global handle_ill_trap
	
handle_ill_trap:
        ta       0x2e
        cmp      %o1, 0
        setx      LOCAL_SUPERVISOR_SECTION_DATA_VA_0, %g1, %o2
        be,a     1f
        nop
        cmp      %o1, 1
        setx      LOCAL_SUPERVISOR_SECTION_DATA_VA_1, %g1, %o2
        be,a     1f
        nop
        cmp      %o1, 2
        setx      LOCAL_SUPERVISOR_SECTION_DATA_VA_2, %g1, %o2
        be,a     1f
        nop
        cmp      %o1, 3
        setx      LOCAL_SUPERVISOR_SECTION_DATA_VA_3, %g1, %o2
        be,a     1f
        nop
        ta       0x1
        nop


1:      ldx       [%o2], %g1
        lda      [%g1]ASI_PRIMARY, %g5
        sethi   %hi(0x1fffff), %g6
        or      %g6, %lo(0x1fffff), %g6
        cmp     %g5, %g6
        tne     0x1 !bad trap
        nop
        done
        nop





attr_data {
        Name = local_supervisor_section_data,
        VA=LOCAL_SUPERVISOR_SECTION_DATA_VA, 
	PA=ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA,0),
	RA=LOCAL_SUPERVISOR_SECTION_DATA_PA,
        part_0_ctx_zero_tsb_config_1,
        part_0_ctx_nonzero_tsb_config_2,
        TTE_G=1, TTE_Context=0x0, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T0_KAOS_BOOT_CACHEABLE, TTE_CV=T0_KAOS_BOOT_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }


SECTION local_supervisor_section_data DATA_VA=LOCAL_SUPERVISOR_SECTION_DATA_VA
.seg "data"
.global local_supervisor_tmp_area
local_supervisor_tmp_area:
      .word 0
      .word 0
      .word 0
      .word 0
      .word 0
      .word 0
      .word 0
      .word 0
      .word 0
      .word 0
      .word 0
      .word 0
      .word 0
      .word 0
      .word 0
      .word 0
      .word 0
      .word 0
      .word 0
      .word 0
      .word 0
      .word 0
      .word 0
      .word 0
      .word 0
      .word 0
      .word 0
      .word 0
      .word 0
      .word 0
      .word 0
      .word 0





/*********************************************************
 * For 2nd thread - HARI
 *********************************************************/


attr_text {
        Name = t1_module_ktbl, 
        VA=T1_KAOS_KTBL_VA, 
	PA=ra2pa(T1_KAOS_KTBL_PA,0),
	RA=T1_KAOS_KTBL_PA,
        part_0_ctx_nonzero_tsb_config_3,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=T1_KAOS_KTBL_CACHEABLE, TTE_CV=T1_KAOS_KTBL_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=0
        }


attr_text {
        Name = t1_module_ktbl,
        VA=T1_KAOS_KTBL_VA,
	PA=ra2pa(T1_KAOS_KTBL_PA,0),
	RA=T1_KAOS_KTBL_PA,
        part_0_ctx_nonzero_tsb_config_0,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=T1_KAOS_KTBL_CACHEABLE, TTE_CV=T1_KAOS_KTBL_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1, tsbonly
        }


attr_text {
        Name = t1_module_subr0, 
        VA=T1_KAOS_SUBR0_VA, 
	PA=ra2pa(T1_KAOS_SUBR0_PA,0),
	RA=T1_KAOS_SUBR0_PA,
        part_0_ctx_nonzero_tsb_config_1,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=T1_KAOS_SUBR0_CACHEABLE, TTE_CV=T1_KAOS_SUBR0_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=0
        }

attr_text {
        Name = t1_module_subr1, 
        VA=T1_KAOS_SUBR1_VA, 
	PA=ra2pa(T1_KAOS_SUBR1_PA,0),
	RA=T1_KAOS_SUBR1_PA,
        part_0_ctx_nonzero_tsb_config_2,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=T1_KAOS_SUBR1_CACHEABLE, TTE_CV=T1_KAOS_SUBR1_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=0
        }


attr_text {
        Name = t1_module_subr2, 
        VA=T1_KAOS_SUBR2_VA, 
	PA=ra2pa(T1_KAOS_SUBR2_PA,0),
	RA=T1_KAOS_SUBR2_PA,
        part_0_ctx_nonzero_tsb_config_3,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=T1_KAOS_SUBR2_CACHEABLE, TTE_CV=T1_KAOS_SUBR2_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=0
        }


attr_text {
        Name = t1_module_subr3, 
        VA=T1_KAOS_SUBR3_VA, 
	PA=ra2pa(T1_KAOS_SUBR3_PA,0),
	RA=T1_KAOS_SUBR3_PA,
        part_0_ctx_nonzero_tsb_config_0,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=T1_KAOS_SUBR3_CACHEABLE, TTE_CV=T1_KAOS_SUBR3_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=0
        }


attr_data {
        Name = t1_module_offset_table,
        VA=T1_KAOS_OFFSET_TBL_VA, 
	PA=ra2pa(T1_KAOS_OFFSET_TBL_PA,0),
	RA=T1_KAOS_OFFSET_TBL_PA,
        part_0_ctx_nonzero_tsb_config_1,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T1_KAOS_OFFSET_TBL_CACHEABLE, TTE_CV=T1_KAOS_OFFSET_TBL_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }





attr_data {
        Name = t1_module_data_in_regs,
        VA=T1_KAOS_RUN_REGS_VA, 
	PA=ra2pa(T1_KAOS_RUN_REGS_PA,0),
	RA=T1_KAOS_RUN_REGS_PA,
        part_0_ctx_nonzero_tsb_config_2,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T1_KAOS_RUN_REGS_CACHEABLE, TTE_CV=T1_KAOS_RUN_REGS_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }



attr_data {
        Name = t1_module_data_in_stack,
        VA=T1_KAOS_RUN_STACK_VA, 
	PA=ra2pa(T1_KAOS_RUN_STACK_PA,0),
	RA=T1_KAOS_RUN_STACK_PA,
        part_0_ctx_nonzero_tsb_config_3,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T1_KAOS_RUN_STACK_CACHEABLE, TTE_CV=T1_KAOS_RUN_STACK_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }



attr_data {
        Name = t1_module_data_in_area0,
        VA=T1_KAOS_RUN_AREA0_VA, 
	PA=ra2pa(T1_KAOS_RUN_AREA0_PA,0),
	RA=T1_KAOS_RUN_AREA0_PA,
        part_0_ctx_nonzero_tsb_config_0,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T1_KAOS_RUN_AREA0_CACHEABLE, TTE_CV=T1_KAOS_RUN_AREA0_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }


#if defined(T1_KAOS_AREA1)
attr_data {
        Name = t1_module_data_in_area1,
        VA=T1_KAOS_RUN_AREA1_VA, 
	PA=ra2pa(T1_KAOS_RUN_AREA1_PA,0),
	RA=T1_KAOS_RUN_AREA1_PA,
        part_0_ctx_nonzero_tsb_config_1,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T1_KAOS_RUN_AREA1_CACHEABLE, TTE_CV=T1_KAOS_RUN_AREA1_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T1_KAOS_AREA2)
attr_data {
        Name = t1_module_data_in_area2,
        VA=T1_KAOS_RUN_AREA2_VA, 
	PA=ra2pa(T1_KAOS_RUN_AREA2_PA,0),
	RA=T1_KAOS_RUN_AREA2_PA,
        part_0_ctx_nonzero_tsb_config_2,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T1_KAOS_RUN_AREA2_CACHEABLE, TTE_CV=T1_KAOS_RUN_AREA2_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T1_KAOS_AREA3)
attr_data {
        Name = t1_module_data_in_area3,
        VA=T1_KAOS_RUN_AREA3_VA, 
	PA=ra2pa(T1_KAOS_RUN_AREA3_PA,0),
	RA=T1_KAOS_RUN_AREA3_PA,
        part_0_ctx_nonzero_tsb_config_3,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T1_KAOS_RUN_AREA3_CACHEABLE, TTE_CV=T1_KAOS_RUN_AREA3_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif

#if defined(T1_KAOS_AREA4)
attr_data {
        Name = t1_module_data_in_area4,
        VA=T1_KAOS_RUN_AREA4_VA, 
	PA=ra2pa(T1_KAOS_RUN_AREA4_PA,0),
	RA=T1_KAOS_RUN_AREA4_PA,
        part_0_ctx_nonzero_tsb_config_0,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T1_KAOS_RUN_AREA4_CACHEABLE, TTE_CV=T1_KAOS_RUN_AREA4_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T1_KAOS_AREA5)
attr_data {
        Name = t1_module_data_in_area5,
        VA=T1_KAOS_RUN_AREA5_VA, 
	PA=ra2pa(T1_KAOS_RUN_AREA5_PA,0),
	RA=T1_KAOS_RUN_AREA5_PA,
        part_0_ctx_nonzero_tsb_config_1,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T1_KAOS_RUN_AREA5_CACHEABLE, TTE_CV=T1_KAOS_RUN_AREA5_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T1_KAOS_AREA6)
attr_data {
        Name = t1_module_data_in_area6,
        VA=T1_KAOS_RUN_AREA6_VA, 
	PA=ra2pa(T1_KAOS_RUN_AREA6_PA,0),
	RA=T1_KAOS_RUN_AREA6_PA,
        part_0_ctx_nonzero_tsb_config_2,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T1_KAOS_RUN_AREA6_CACHEABLE, TTE_CV=T1_KAOS_RUN_AREA6_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T1_KAOS_AREA7)
attr_data {
        Name = t1_module_data_in_area7,
        VA=T1_KAOS_RUN_AREA7_VA, 
	PA=ra2pa(T1_KAOS_RUN_AREA7_PA,0),
	RA=T1_KAOS_RUN_AREA7_PA,
        part_0_ctx_nonzero_tsb_config_3,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T1_KAOS_RUN_AREA7_CACHEABLE, TTE_CV=T1_KAOS_RUN_AREA7_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T1_KAOS_AREA8)
attr_data {
        Name = t1_module_data_in_area8,
        VA=T1_KAOS_RUN_AREA8_VA, 
	PA=ra2pa(T1_KAOS_RUN_AREA8_PA,0),
	RA=T1_KAOS_RUN_AREA8_PA,
        part_0_ctx_nonzero_tsb_config_0,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T1_KAOS_RUN_AREA8_CACHEABLE, TTE_CV=T1_KAOS_RUN_AREA8_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T1_KAOS_AREA9)
attr_data {
        Name = t1_module_data_in_area9,
        VA=T1_KAOS_RUN_AREA9_VA, 
	PA=ra2pa(T1_KAOS_RUN_AREA9_PA,0),
	RA=T1_KAOS_RUN_AREA9_PA,
        part_0_ctx_nonzero_tsb_config_1,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T1_KAOS_RUN_AREA9_CACHEABLE, TTE_CV=T1_KAOS_RUN_AREA9_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T1_KAOS_AREA10)
attr_data {
        Name = t1_module_data_in_area10,
        VA=T1_KAOS_RUN_AREA10_VA, 
	PA=ra2pa(T1_KAOS_RUN_AREA10_PA,0),
	RA=T1_KAOS_RUN_AREA10_PA,
        part_0_ctx_nonzero_tsb_config_2,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T1_KAOS_RUN_AREA10_CACHEABLE, TTE_CV=T1_KAOS_RUN_AREA10_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T1_KAOS_AREA11)
attr_data {
        Name = t1_module_data_in_area11,
        VA=T1_KAOS_RUN_AREA11_VA, 
	PA=ra2pa(T1_KAOS_RUN_AREA11_PA,0),
	RA=T1_KAOS_RUN_AREA11_PA,
        part_0_ctx_nonzero_tsb_config_3,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T1_KAOS_RUN_AREA11_CACHEABLE, TTE_CV=T1_KAOS_RUN_AREA11_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T1_KAOS_AREA12)
attr_data {
        Name = t1_module_data_in_area12,
        VA=T1_KAOS_RUN_AREA12_VA, 
	PA=ra2pa(T1_KAOS_RUN_AREA12_PA,0),
	RA=T1_KAOS_RUN_AREA12_PA,
        part_0_ctx_nonzero_tsb_config_0,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T1_KAOS_RUN_AREA12_CACHEABLE, TTE_CV=T1_KAOS_RUN_AREA12_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T1_KAOS_AREA13)
attr_data {
        Name = t1_module_data_in_area13,
        VA=T1_KAOS_RUN_AREA13_VA, 
	PA=ra2pa(T1_KAOS_RUN_AREA13_PA,0),
	RA=T1_KAOS_RUN_AREA13_PA,
        part_0_ctx_nonzero_tsb_config_1,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T1_KAOS_RUN_AREA13_CACHEABLE, TTE_CV=T1_KAOS_RUN_AREA13_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T1_KAOS_AREA14)
attr_data {
        Name = t1_module_data_in_area14,
        VA=T1_KAOS_RUN_AREA14_VA, 
	PA=ra2pa(T1_KAOS_RUN_AREA14_PA,0),
	RA=T1_KAOS_RUN_AREA14_PA,
        part_0_ctx_nonzero_tsb_config_2,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T1_KAOS_RUN_AREA14_CACHEABLE, TTE_CV=T1_KAOS_RUN_AREA14_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T1_KAOS_AREA15)
attr_data {
        Name = t1_module_data_in_area15,
        VA=T1_KAOS_RUN_AREA15_VA, 
	PA=ra2pa(T1_KAOS_RUN_AREA15_PA,0),
	RA=T1_KAOS_RUN_AREA15_PA,
        part_0_ctx_nonzero_tsb_config_3,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T1_KAOS_RUN_AREA15_CACHEABLE, TTE_CV=T1_KAOS_RUN_AREA15_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T1_KAOS_SHM_AREA)
attr_data {
        Name = t1_module_data_in_shm_area,
        VA=T1_KAOS_RUN_SHM_AREA_VA, 
	PA=ra2pa(T1_KAOS_RUN_SHM_AREA_PA,0),
	RA=T1_KAOS_RUN_SHM_AREA_PA,
        part_0_ctx_nonzero_tsb_config_0,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T1_KAOS_RUN_SHM_AREA_CACHEABLE, TTE_CV=T1_KAOS_RUN_SHM_AREA_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


attr_data {
        Name = t1_module_data_exp_regs,
        VA=T1_KAOS_EXP_REGS_VA, 
	PA=ra2pa(T1_KAOS_EXP_REGS_PA,0),
	RA=T1_KAOS_EXP_REGS_PA,
        part_0_ctx_nonzero_tsb_config_1,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T1_KAOS_EXP_REGS_CACHEABLE, TTE_CV=T1_KAOS_EXP_REGS_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }


attr_data {
        Name = t1_module_data_exp_stack,
        VA=T1_KAOS_EXP_STACK_VA, 
	PA=ra2pa(T1_KAOS_EXP_STACK_PA,0),
	RA=T1_KAOS_EXP_STACK_PA,
        part_0_ctx_nonzero_tsb_config_1,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T1_KAOS_EXP_STACK_CACHEABLE, TTE_CV=T1_KAOS_EXP_STACK_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }



#if defined(T1_KAOS_AREA0)
attr_data {
        Name = t1_module_data_exp_area0,
        VA=T1_KAOS_EXP_AREA0_VA, 
	PA=ra2pa(T1_KAOS_EXP_AREA0_PA,0),
	RA=T1_KAOS_EXP_AREA0_PA,
        part_0_ctx_nonzero_tsb_config_3,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T1_KAOS_EXP_AREA0_CACHEABLE, TTE_CV=T1_KAOS_EXP_AREA0_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif



#if defined(T1_KAOS_AREA1)
attr_data {
        Name = t1_module_data_exp_area1,
        VA=T1_KAOS_EXP_AREA1_VA, 
	PA=ra2pa(T1_KAOS_EXP_AREA1_PA,0),
	RA=T1_KAOS_EXP_AREA1_PA,
        part_0_ctx_nonzero_tsb_config_0,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T1_KAOS_EXP_AREA1_CACHEABLE, TTE_CV=T1_KAOS_EXP_AREA1_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif

#if defined(T1_KAOS_AREA2)
attr_data {
        Name = t1_module_data_exp_area2,
        VA=T1_KAOS_EXP_AREA2_VA, 
	PA=ra2pa(T1_KAOS_EXP_AREA2_PA,0),
	RA=T1_KAOS_EXP_AREA2_PA,
        part_0_ctx_nonzero_tsb_config_1,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T1_KAOS_EXP_AREA2_CACHEABLE, TTE_CV=T1_KAOS_EXP_AREA2_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif

#if defined(T1_KAOS_AREA3)
attr_data {
        Name = t1_module_data_exp_area3,
        VA=T1_KAOS_EXP_AREA3_VA, 
	PA=ra2pa(T1_KAOS_EXP_AREA3_PA,0),
	RA=T1_KAOS_EXP_AREA3_PA,
        part_0_ctx_nonzero_tsb_config_2,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T1_KAOS_EXP_AREA3_CACHEABLE, TTE_CV=T1_KAOS_EXP_AREA3_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T1_KAOS_AREA4)
attr_data {
        Name = t1_module_data_exp_area4,
        VA=T1_KAOS_EXP_AREA4_VA, 
	PA=ra2pa(T1_KAOS_EXP_AREA4_PA,0),
	RA=T1_KAOS_EXP_AREA4_PA,
        part_0_ctx_nonzero_tsb_config_3,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T1_KAOS_EXP_AREA4_CACHEABLE, TTE_CV=T1_KAOS_EXP_AREA4_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T1_KAOS_AREA5)
attr_data {
        Name = t1_module_data_exp_area5,
        VA=T1_KAOS_EXP_AREA5_VA, 
	PA=ra2pa(T1_KAOS_EXP_AREA5_PA,0),
	RA=T1_KAOS_EXP_AREA5_PA,
        part_0_ctx_nonzero_tsb_config_0,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T1_KAOS_EXP_AREA5_CACHEABLE, TTE_CV=T1_KAOS_EXP_AREA5_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T1_KAOS_AREA6)
attr_data {
        Name = t1_module_data_exp_area6,
        VA=T1_KAOS_EXP_AREA6_VA, 
	PA=ra2pa(T1_KAOS_EXP_AREA6_PA,0),
	RA=T1_KAOS_EXP_AREA6_PA,
        part_0_ctx_nonzero_tsb_config_1,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T1_KAOS_EXP_AREA6_CACHEABLE, TTE_CV=T1_KAOS_EXP_AREA6_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T1_KAOS_AREA7)
attr_data {
        Name = t1_module_data_exp_area7,
        VA=T1_KAOS_EXP_AREA7_VA, 
	PA=ra2pa(T1_KAOS_EXP_AREA7_PA,0),
	RA=T1_KAOS_EXP_AREA7_PA,
        part_0_ctx_nonzero_tsb_config_2,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T1_KAOS_EXP_AREA7_CACHEABLE, TTE_CV=T1_KAOS_EXP_AREA7_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T1_KAOS_AREA8)
attr_data {
        Name = t1_module_data_exp_area8,
        VA=T1_KAOS_EXP_AREA8_VA, 
	PA=ra2pa(T1_KAOS_EXP_AREA8_PA,0),
	RA=T1_KAOS_EXP_AREA8_PA,
        part_0_ctx_nonzero_tsb_config_3,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T1_KAOS_EXP_AREA8_CACHEABLE, TTE_CV=T1_KAOS_EXP_AREA8_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T1_KAOS_AREA9)
attr_data {
        Name = t1_module_data_exp_area9,
        VA=T1_KAOS_EXP_AREA9_VA, 
	PA=ra2pa(T1_KAOS_EXP_AREA9_PA,0),
	RA=T1_KAOS_EXP_AREA9_PA,
        part_0_ctx_nonzero_tsb_config_0,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T1_KAOS_EXP_AREA9_CACHEABLE, TTE_CV=T1_KAOS_EXP_AREA9_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T1_KAOS_AREA10)
attr_data {
        Name = t1_module_data_exp_area10,
        VA=T1_KAOS_EXP_AREA10_VA, 
	PA=ra2pa(T1_KAOS_EXP_AREA10_PA,0),
	RA=T1_KAOS_EXP_AREA10_PA,
        part_0_ctx_nonzero_tsb_config_1,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T1_KAOS_EXP_AREA10_CACHEABLE, TTE_CV=T1_KAOS_EXP_AREA10_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T1_KAOS_AREA11)
attr_data {
        Name = t1_module_data_exp_area11,
        VA=T1_KAOS_EXP_AREA11_VA, 
	PA=ra2pa(T1_KAOS_EXP_AREA11_PA,0),
	RA=T1_KAOS_EXP_AREA11_PA,
        part_0_ctx_nonzero_tsb_config_2,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T1_KAOS_EXP_AREA11_CACHEABLE, TTE_CV=T1_KAOS_EXP_AREA11_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T1_KAOS_AREA12)
attr_data {
        Name = t1_module_data_exp_area12,
        VA=T1_KAOS_EXP_AREA12_VA, 
	PA=ra2pa(T1_KAOS_EXP_AREA12_PA,0),
	RA=T1_KAOS_EXP_AREA12_PA,
        part_0_ctx_nonzero_tsb_config_3,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T1_KAOS_EXP_AREA12_CACHEABLE, TTE_CV=T1_KAOS_EXP_AREA12_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T1_KAOS_AREA13)
attr_data {
        Name = t1_module_data_exp_area13,
        VA=T1_KAOS_EXP_AREA13_VA, 
	PA=ra2pa(T1_KAOS_EXP_AREA13_PA,0),
	RA=T1_KAOS_EXP_AREA13_PA,
        part_0_ctx_nonzero_tsb_config_0,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T1_KAOS_EXP_AREA13_CACHEABLE, TTE_CV=T1_KAOS_EXP_AREA13_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T1_KAOS_AREA14)
attr_data {
        Name = t1_module_data_exp_area14,
        VA=T1_KAOS_EXP_AREA14_VA, 
	PA=ra2pa(T1_KAOS_EXP_AREA14_PA,0),
	RA=T1_KAOS_EXP_AREA14_PA,
        part_0_ctx_nonzero_tsb_config_1,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T1_KAOS_EXP_AREA14_CACHEABLE, TTE_CV=T1_KAOS_EXP_AREA14_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif

#if defined(T1_KAOS_AREA15)
attr_data {
        Name = t1_module_data_exp_area15,
        VA=T1_KAOS_EXP_AREA15_VA, 
	PA=ra2pa(T1_KAOS_EXP_AREA15_PA,0),
	RA=T1_KAOS_EXP_AREA15_PA,
        part_0_ctx_nonzero_tsb_config_2,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T1_KAOS_EXP_AREA15_CACHEABLE, TTE_CV=T1_KAOS_EXP_AREA15_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif


#if defined(T1_KAOS_SHM_AREA)
attr_data {
        Name = t1_module_data_exp_shm_area,
        VA=T1_KAOS_EXP_SHM_AREA_VA, 
	PA=ra2pa(T1_KAOS_EXP_SHM_AREA_PA,0),
	RA=T1_KAOS_EXP_SHM_AREA_PA,
        part_0_ctx_nonzero_tsb_config_3,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=1, TTE_CP=T1_KAOS_EXP_SHM_AREA_CACHEABLE, TTE_CV=T1_KAOS_EXP_SHM_AREA_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=1
        }
#endif



#endif ! if NIAGARA



