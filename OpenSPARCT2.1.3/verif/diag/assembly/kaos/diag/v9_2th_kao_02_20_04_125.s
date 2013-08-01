/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: v9_2th_kao_02_20_04_125.s
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
#define T0_KAOS_SEED          d3d134afccd1
#define T0_KAOS_ICOUNT        5000
#define T0_KAOS_AREAS         1
#define T0_KAOS_AREASIZE      64
#define T0_KAOS_AREAOFFSET    3008
#define T0_KAOS_PAGESIZE      8192
#define T0_KAOS_CODECOUNT     5002

#define T0_KAOS_BOOT_VA                  0x1a0ca000
#define T0_KAOS_BOOT_PA                  0x0000000000402000
#define T0_KAOS_BOOT_CACHEABLE           1
#define T0_KAOS_BOOT_NONCACHEABLE        0

#define T0_KAOS_STARTUP_VA               0x00a80000
#define T0_KAOS_STARTUP_PA               0x0000000001c44000
#define T0_KAOS_STARTUP_CACHEABLE        1
#define T0_KAOS_STARTUP_NONCACHEABLE     0

#define T0_KAOS_OFFSET_TBL_VA            0x0c816000
#define T0_KAOS_OFFSET_TBL_PA            0x0000000002c06000
#define T0_KAOS_OFFSET_TBL_CACHEABLE     1
#define T0_KAOS_OFFSET_TBL_NONCACHEABLE  0

#define T0_KAOS_DONE_VA                  0x1791a000
#define T0_KAOS_DONE_PA                  0x0000000003834000
#define T0_KAOS_DONE_CACHEABLE           1
#define T0_KAOS_DONE_NONCACHEABLE        0

#define T0_KAOS_KTBL_VA                  0x1af8e000
#define T0_KAOS_KTBL_PA                  0x00000000049cc000
#define T0_KAOS_KTBL_CACHEABLE           1
#define T0_KAOS_KTBL_NONCACHEABLE        0

#define T0_KAOS_SUBR0_VA                 0x1aff6000
#define T0_KAOS_SUBR0_PA                 0x0000000005a58000
#define T0_KAOS_SUBR0_CACHEABLE          1
#define T0_KAOS_SUBR0_NONCACHEABLE       0
#define T0_KAOS_SUBR1_VA                 0x1b03c000
#define T0_KAOS_SUBR1_PA                 0x0000000006c1c000
#define T0_KAOS_SUBR1_CACHEABLE          1
#define T0_KAOS_SUBR1_NONCACHEABLE       0
#define T0_KAOS_SUBR2_VA                 0x1aef4000
#define T0_KAOS_SUBR2_PA                 0x00000000079fa000
#define T0_KAOS_SUBR2_CACHEABLE          1
#define T0_KAOS_SUBR2_NONCACHEABLE       0
#define T0_KAOS_SUBR3_VA                 0x1af1c000
#define T0_KAOS_SUBR3_PA                 0x00000000083cc000
#define T0_KAOS_SUBR3_CACHEABLE          1
#define T0_KAOS_SUBR3_NONCACHEABLE       0

#define T0_KAOS_EXP_REGS_VA              0x17fe0000
#define T0_KAOS_EXP_REGS_PA              0x0000000009540000
#define T0_KAOS_EXP_REGS_CACHEABLE       1
#define T0_KAOS_EXP_REGS_NONCACHEABLE    0
#define T0_KAOS_RUN_REGS_VA              0x06266000
#define T0_KAOS_RUN_REGS_PA              0x000000000a85a000
#define T0_KAOS_RUN_REGS_CACHEABLE       1
#define T0_KAOS_RUN_REGS_NONCACHEABLE    0

#define T0_KAOS_EXP_STACK_VA             0x30e2e000
#define T0_KAOS_EXP_STACK_PA             0x000000000b1fc000
#define T0_KAOS_EXP_STACK_CACHEABLE      1
#define T0_KAOS_EXP_STACK_NONCACHEABLE   0
#define T0_KAOS_RUN_STACK_VA             0x18924000
#define T0_KAOS_RUN_STACK_PA             0x000000000c73e000
#define T0_KAOS_RUN_STACK_CACHEABLE      1
#define T0_KAOS_RUN_STACK_NONCACHEABLE   0

#define T0_KAOS_AREA0
#define T0_KAOS_EXP_AREA0_VA             0x0f1f2000
#define T0_KAOS_EXP_AREA0_PA             0x000000000db74000
#define T0_KAOS_EXP_AREA0_CACHEABLE      1
#define T0_KAOS_EXP_AREA0_NONCACHEABLE   0
#define T0_KAOS_RUN_AREA0_VA             0x355d0000
#define T0_KAOS_RUN_AREA0_PA             0x000000000e78a000
#define T0_KAOS_RUN_AREA0_CACHEABLE      1
#define T0_KAOS_RUN_AREA0_NONCACHEABLE   0

#define T0_KAOS_SHM_AREA
#define T0_KAOS_EXP_SHM_AREA_VA          0x38366000
#define T0_KAOS_EXP_SHM_AREA_PA          0x0000000000bdc000
#define T0_KAOS_EXP_SHM_AREA_CACHEABLE   1
#define T0_KAOS_EXP_SHM_AREA_NONCACHEABLE 0
#define T0_KAOS_RUN_SHM_AREA_VA          0x2b7bc000
#define T0_KAOS_RUN_SHM_AREA_PA          0x0000000000140000
#define T0_KAOS_RUN_SHM_AREA_CACHEABLE   1
#define T0_KAOS_RUN_SHM_AREA_NONCACHEABLE 0

#define T0_KAOS_RANVAL_00     0x04cefab1
#define T0_KAOS_RANVAL_01     0x76bfe897
#define T0_KAOS_RANVAL_02     0xf89d36eb
#define T0_KAOS_RANVAL_03     0x1f7cb931
#define T0_KAOS_RANVAL_04     0xaa0e3922
#define T0_KAOS_RANVAL_05     0x195b33f8
#define T0_KAOS_RANVAL_06     0x53cbea96
#define T0_KAOS_RANVAL_07     0x74944825
#define T0_KAOS_RANVAL_08     0x635dc835
#define T0_KAOS_RANVAL_09     0x53dc0423
#define T0_KAOS_RANVAL_0a     0xef0f5867
#define T0_KAOS_RANVAL_0b     0x1f2daee0
#define T0_KAOS_RANVAL_0c     0xe50c3bc4
#define T0_KAOS_RANVAL_0d     0x8fcb5fbf
#define T0_KAOS_RANVAL_0e     0xd7e634a7
#define T0_KAOS_RANVAL_0f     0xb42ea6e5
#define T0_KAOS_RANVAL_10     0xa495e7ba
#define T0_KAOS_RANVAL_11     0x3a5ce103
#define T0_KAOS_RANVAL_12     0x2b6b87f7
#define T0_KAOS_RANVAL_13     0x6aaf1cc6
#define T0_KAOS_RANVAL_14     0x47f92ab1
#define T0_KAOS_RANVAL_15     0xed91d58c
#define T0_KAOS_RANVAL_16     0x5853b497
#define T0_KAOS_RANVAL_17     0x5a1f861e
#define T0_KAOS_RANVAL_18     0x62323edc
#define T0_KAOS_RANVAL_19     0x38ce0771
#define T0_KAOS_RANVAL_1a     0xe95e0be4
#define T0_KAOS_RANVAL_1b     0x06aa22c3
#define T0_KAOS_RANVAL_1c     0xcd28b526
#define T0_KAOS_RANVAL_1d     0x04c78394
#define T0_KAOS_RANVAL_1e     0x2c0bb822
#define T0_KAOS_RANVAL_1f     0x2bca9d3c
#define T0_KAOS_RANVAL_20     0xa956fe9b
#define T0_KAOS_RANVAL_21     0x537bf13a
#define T0_KAOS_RANVAL_22     0x6d34fe7b
#define T0_KAOS_RANVAL_23     0xf4dabe70
#define T0_KAOS_RANVAL_24     0x9d16a807
#define T0_KAOS_RANVAL_25     0xe46b4ede
#define T0_KAOS_RANVAL_26     0x97221d48
#define T0_KAOS_RANVAL_27     0x840a28a0
#define T0_KAOS_RANVAL_28     0xcf022bdc
#define T0_KAOS_RANVAL_29     0xe9012841
#define T0_KAOS_RANVAL_2a     0xbb5d4a8e
#define T0_KAOS_RANVAL_2b     0x65224d97
#define T0_KAOS_RANVAL_2c     0xe2877e58
#define T0_KAOS_RANVAL_2d     0xa21299c5
#define T0_KAOS_RANVAL_2e     0x41c796ca
#define T0_KAOS_RANVAL_2f     0x61d7141f
#define T0_KAOS_RANVAL_30     0xf1d4b7e7
#define T0_KAOS_RANVAL_31     0x36e8b4fb
#define T0_KAOS_RANVAL_32     0xded2b7f1
#define T0_KAOS_RANVAL_33     0xe477e0b7
#define T0_KAOS_RANVAL_34     0xbefa81c5
#define T0_KAOS_RANVAL_35     0xedb41a7a
#define T0_KAOS_RANVAL_36     0x205e00b1
#define T0_KAOS_RANVAL_37     0x62dbf582
#define T0_KAOS_RANVAL_38     0xa5b628e7
#define T0_KAOS_RANVAL_39     0xcdbfdcf2
#define T0_KAOS_RANVAL_3a     0xe3d507fd
#define T0_KAOS_RANVAL_3b     0x19a05d81
#define T0_KAOS_RANVAL_3c     0xe20f7b1b
#define T0_KAOS_RANVAL_3d     0x9a870180
#define T0_KAOS_RANVAL_3e     0xb512c4c8
#define T0_KAOS_RANVAL_3f     0x0e7cd704
#define T0_KAOS_RANVAL_40     0x9414d26d
#define T0_KAOS_RANVAL_41     0x95313143
#define T0_KAOS_RANVAL_42     0x4474220f
#define T0_KAOS_RANVAL_43     0xf2d8715d
#define T0_KAOS_RANVAL_44     0x38c1f2cd
#define T0_KAOS_RANVAL_45     0xed30702e
#define T0_KAOS_RANVAL_46     0x6fb14f1d
#define T0_KAOS_RANVAL_47     0x1d1dd1d7
#define T0_KAOS_RANVAL_48     0xb1c49dee
#define T0_KAOS_RANVAL_49     0xba02ed1f
#define T0_KAOS_RANVAL_4a     0xe4c5500a
#define T0_KAOS_RANVAL_4b     0xa2da53e6
#define T0_KAOS_RANVAL_4c     0x239c0170
#define T0_KAOS_RANVAL_4d     0x8cb93f30
#define T0_KAOS_RANVAL_4e     0x149f9284
#define T0_KAOS_RANVAL_4f     0x56b2789f
#define T0_KAOS_RANVAL_50     0x09be6340
#define T0_KAOS_RANVAL_51     0x8112a44d
#define T0_KAOS_RANVAL_52     0xe4d38ad1
#define T0_KAOS_RANVAL_53     0x6ee9596a
#define T0_KAOS_RANVAL_54     0xa542b03f
#define T0_KAOS_RANVAL_55     0x69061507
#define T0_KAOS_RANVAL_56     0x80369d14
#define T0_KAOS_RANVAL_57     0x3ae011f5
#define T0_KAOS_RANVAL_58     0x0241d121
#define T0_KAOS_RANVAL_59     0x83a841a6
#define T0_KAOS_RANVAL_5a     0x7e9cd6ce
#define T0_KAOS_RANVAL_5b     0x1acd556b
#define T0_KAOS_RANVAL_5c     0x04fde997
#define T0_KAOS_RANVAL_5d     0xc6cbcc84
#define T0_KAOS_RANVAL_5e     0xcfe93ca7
#define T0_KAOS_RANVAL_5f     0xe43ca2e5
#define T0_KAOS_RANVAL_60     0x701be5b0
#define T0_KAOS_RANVAL_61     0x4aba5598
#define T0_KAOS_RANVAL_62     0xdeaeb06e
#define T0_KAOS_RANVAL_63     0xb2e7cd20
#define T0_KAOS_RANVAL_64     0x731df97c
#define T0_KAOS_RANVAL_65     0xe63a2b51
#define T0_KAOS_RANVAL_66     0xf6eab35e
#define T0_KAOS_RANVAL_67     0x7f74c970
#define T0_KAOS_RANVAL_68     0xc213f6f2
#define T0_KAOS_RANVAL_69     0x97fdb4a5
#define T0_KAOS_RANVAL_6a     0x663388a3
#define T0_KAOS_RANVAL_6b     0x8fccf9f5
#define T0_KAOS_RANVAL_6c     0x57609e13
#define T0_KAOS_RANVAL_6d     0x66d6e868
#define T0_KAOS_RANVAL_6e     0x08477c1b
#define T0_KAOS_RANVAL_6f     0x3e62670b
#define T0_KAOS_RANVAL_70     0x0cc14b4e
#define T0_KAOS_RANVAL_71     0xecda65e1
#define T0_KAOS_RANVAL_72     0x0d835160
#define T0_KAOS_RANVAL_73     0xb20a9c06
#define T0_KAOS_RANVAL_74     0x13b7a826
#define T0_KAOS_RANVAL_75     0xa0430299
#define T0_KAOS_RANVAL_76     0x0ca21f06
#define T0_KAOS_RANVAL_77     0xe65e1b1f
#define T0_KAOS_RANVAL_78     0xc54b4211
#define T0_KAOS_RANVAL_79     0x089fe176
#define T0_KAOS_RANVAL_7a     0xae891a21
#define T0_KAOS_RANVAL_7b     0x00069ca8
#define T0_KAOS_RANVAL_7c     0x30132ba3
#define T0_KAOS_RANVAL_7d     0xa4e46709
#define T0_KAOS_RANVAL_7e     0x0e061609
#define T0_KAOS_RANVAL_7f     0xf8558d87
/* end ktbl.0.h */
/* start ktbl.1.h */
#define T1_KAOS_NIAGARA
#define T1_KAOS_VERSION       4.2
#define T1_KAOS_SEED          d3d134afccd2
#define T1_KAOS_ICOUNT        5000
#define T1_KAOS_AREAS         1
#define T1_KAOS_AREASIZE      64
#define T1_KAOS_AREAOFFSET    3008
#define T1_KAOS_PAGESIZE      8192
#define T1_KAOS_CODECOUNT     5002

#define T1_KAOS_BOOT_VA                  0x6ee66000
#define T1_KAOS_BOOT_PA                  0x000000004033a000
#define T1_KAOS_BOOT_CACHEABLE           1
#define T1_KAOS_BOOT_NONCACHEABLE        0

#define T1_KAOS_STARTUP_VA               0x79a2c000
#define T1_KAOS_STARTUP_PA               0x0000000041e76000
#define T1_KAOS_STARTUP_CACHEABLE        1
#define T1_KAOS_STARTUP_NONCACHEABLE     0

#define T1_KAOS_OFFSET_TBL_VA            0x7ad32000
#define T1_KAOS_OFFSET_TBL_PA            0x00000000426ea000
#define T1_KAOS_OFFSET_TBL_CACHEABLE     1
#define T1_KAOS_OFFSET_TBL_NONCACHEABLE  0

#define T1_KAOS_DONE_VA                  0x6b644000
#define T1_KAOS_DONE_PA                  0x0000000043b2a000
#define T1_KAOS_DONE_CACHEABLE           1
#define T1_KAOS_DONE_NONCACHEABLE        0

#define T1_KAOS_KTBL_VA                  0x72a1c000
#define T1_KAOS_KTBL_PA                  0x0000000044954000
#define T1_KAOS_KTBL_CACHEABLE           1
#define T1_KAOS_KTBL_NONCACHEABLE        0

#define T1_KAOS_SUBR0_VA                 0x729be000
#define T1_KAOS_SUBR0_PA                 0x000000004573a000
#define T1_KAOS_SUBR0_CACHEABLE          1
#define T1_KAOS_SUBR0_NONCACHEABLE       0
#define T1_KAOS_SUBR1_VA                 0x729ee000
#define T1_KAOS_SUBR1_PA                 0x0000000046ace000
#define T1_KAOS_SUBR1_CACHEABLE          1
#define T1_KAOS_SUBR1_NONCACHEABLE       0
#define T1_KAOS_SUBR2_VA                 0x728ca000
#define T1_KAOS_SUBR2_PA                 0x0000000047542000
#define T1_KAOS_SUBR2_CACHEABLE          1
#define T1_KAOS_SUBR2_NONCACHEABLE       0
#define T1_KAOS_SUBR3_VA                 0x72314000
#define T1_KAOS_SUBR3_PA                 0x000000004825a000
#define T1_KAOS_SUBR3_CACHEABLE          1
#define T1_KAOS_SUBR3_NONCACHEABLE       0

#define T1_KAOS_EXP_REGS_VA              0x5c282000
#define T1_KAOS_EXP_REGS_PA              0x0000000049244000
#define T1_KAOS_EXP_REGS_CACHEABLE       1
#define T1_KAOS_EXP_REGS_NONCACHEABLE    0
#define T1_KAOS_RUN_REGS_VA              0x6f368000
#define T1_KAOS_RUN_REGS_PA              0x000000004a6e8000
#define T1_KAOS_RUN_REGS_CACHEABLE       1
#define T1_KAOS_RUN_REGS_NONCACHEABLE    0

#define T1_KAOS_EXP_STACK_VA             0x5f5de000
#define T1_KAOS_EXP_STACK_PA             0x000000004bcae000
#define T1_KAOS_EXP_STACK_CACHEABLE      1
#define T1_KAOS_EXP_STACK_NONCACHEABLE   0
#define T1_KAOS_RUN_STACK_VA             0x7c386000
#define T1_KAOS_RUN_STACK_PA             0x000000004cf5c000
#define T1_KAOS_RUN_STACK_CACHEABLE      1
#define T1_KAOS_RUN_STACK_NONCACHEABLE   0

#define T1_KAOS_AREA0
#define T1_KAOS_EXP_AREA0_VA             0x60a34000
#define T1_KAOS_EXP_AREA0_PA             0x000000004df52000
#define T1_KAOS_EXP_AREA0_CACHEABLE      1
#define T1_KAOS_EXP_AREA0_NONCACHEABLE   0
#define T1_KAOS_RUN_AREA0_VA             0x67c08000
#define T1_KAOS_RUN_AREA0_PA             0x000000004e546000
#define T1_KAOS_RUN_AREA0_CACHEABLE      1
#define T1_KAOS_RUN_AREA0_NONCACHEABLE   0

#define T1_KAOS_SHM_AREA
#define T1_KAOS_EXP_SHM_AREA_VA          0x411a0000
#define T1_KAOS_EXP_SHM_AREA_PA          0x0000000040e6e000
#define T1_KAOS_EXP_SHM_AREA_CACHEABLE   1
#define T1_KAOS_EXP_SHM_AREA_NONCACHEABLE 0
#define T1_KAOS_RUN_SHM_AREA_VA          0x54226000
#define T1_KAOS_RUN_SHM_AREA_PA          0x0000000040e46000
#define T1_KAOS_RUN_SHM_AREA_CACHEABLE   1
#define T1_KAOS_RUN_SHM_AREA_NONCACHEABLE 0

#define T1_KAOS_RANVAL_00     0x592f7c66
#define T1_KAOS_RANVAL_01     0x8de1f6ed
#define T1_KAOS_RANVAL_02     0x59d21808
#define T1_KAOS_RANVAL_03     0x94616bdc
#define T1_KAOS_RANVAL_04     0xba7c0fb3
#define T1_KAOS_RANVAL_05     0x65f93c2b
#define T1_KAOS_RANVAL_06     0xca62a3c0
#define T1_KAOS_RANVAL_07     0x093cec91
#define T1_KAOS_RANVAL_08     0xa697d7f8
#define T1_KAOS_RANVAL_09     0x45fc8a84
#define T1_KAOS_RANVAL_0a     0x65a7cd6a
#define T1_KAOS_RANVAL_0b     0x1a5919da
#define T1_KAOS_RANVAL_0c     0x4250d944
#define T1_KAOS_RANVAL_0d     0x6aa9fb8f
#define T1_KAOS_RANVAL_0e     0xd97554b2
#define T1_KAOS_RANVAL_0f     0x9b33cd18
#define T1_KAOS_RANVAL_10     0x14d4d520
#define T1_KAOS_RANVAL_11     0xc6df11dd
#define T1_KAOS_RANVAL_12     0xa182814d
#define T1_KAOS_RANVAL_13     0x9f1eb4d3
#define T1_KAOS_RANVAL_14     0x50ecdf07
#define T1_KAOS_RANVAL_15     0x2c47265a
#define T1_KAOS_RANVAL_16     0xa0268e94
#define T1_KAOS_RANVAL_17     0x4e901aba
#define T1_KAOS_RANVAL_18     0x3df94414
#define T1_KAOS_RANVAL_19     0x02b8c7f9
#define T1_KAOS_RANVAL_1a     0x7837bc56
#define T1_KAOS_RANVAL_1b     0xefab85e8
#define T1_KAOS_RANVAL_1c     0x2a97b9fd
#define T1_KAOS_RANVAL_1d     0xc816f190
#define T1_KAOS_RANVAL_1e     0xbc8a18e9
#define T1_KAOS_RANVAL_1f     0xab3bbd68
#define T1_KAOS_RANVAL_20     0xb309093f
#define T1_KAOS_RANVAL_21     0x60753a00
#define T1_KAOS_RANVAL_22     0x2bc85882
#define T1_KAOS_RANVAL_23     0x32ebeefb
#define T1_KAOS_RANVAL_24     0x950aa69a
#define T1_KAOS_RANVAL_25     0xd88c6298
#define T1_KAOS_RANVAL_26     0x30324dc6
#define T1_KAOS_RANVAL_27     0xc625fe18
#define T1_KAOS_RANVAL_28     0xcd2befc0
#define T1_KAOS_RANVAL_29     0x857ee7ba
#define T1_KAOS_RANVAL_2a     0x8f71d7a0
#define T1_KAOS_RANVAL_2b     0x74d83f33
#define T1_KAOS_RANVAL_2c     0x45edff48
#define T1_KAOS_RANVAL_2d     0x2ac377bf
#define T1_KAOS_RANVAL_2e     0x88705855
#define T1_KAOS_RANVAL_2f     0xbac52342
#define T1_KAOS_RANVAL_30     0x22784be8
#define T1_KAOS_RANVAL_31     0xec057417
#define T1_KAOS_RANVAL_32     0xc92409d4
#define T1_KAOS_RANVAL_33     0x3723977c
#define T1_KAOS_RANVAL_34     0x449b86e3
#define T1_KAOS_RANVAL_35     0x9b29e0b5
#define T1_KAOS_RANVAL_36     0x7dedc352
#define T1_KAOS_RANVAL_37     0xf37f1d63
#define T1_KAOS_RANVAL_38     0x6b7f6dc0
#define T1_KAOS_RANVAL_39     0x5ca965a9
#define T1_KAOS_RANVAL_3a     0xe4950416
#define T1_KAOS_RANVAL_3b     0x3e32df04
#define T1_KAOS_RANVAL_3c     0x74ef833c
#define T1_KAOS_RANVAL_3d     0x7c56470d
#define T1_KAOS_RANVAL_3e     0xff795791
#define T1_KAOS_RANVAL_3f     0xf0cb437d
#define T1_KAOS_RANVAL_40     0x6205e380
#define T1_KAOS_RANVAL_41     0x9caf7725
#define T1_KAOS_RANVAL_42     0x4f6d66b1
#define T1_KAOS_RANVAL_43     0x354dc7c0
#define T1_KAOS_RANVAL_44     0xb032a796
#define T1_KAOS_RANVAL_45     0x895026c2
#define T1_KAOS_RANVAL_46     0x7d214a76
#define T1_KAOS_RANVAL_47     0xa71f1f95
#define T1_KAOS_RANVAL_48     0x04918c19
#define T1_KAOS_RANVAL_49     0xe41d77e6
#define T1_KAOS_RANVAL_4a     0x0b46f3c4
#define T1_KAOS_RANVAL_4b     0x713be2e5
#define T1_KAOS_RANVAL_4c     0xa866cf2c
#define T1_KAOS_RANVAL_4d     0x8aca36ad
#define T1_KAOS_RANVAL_4e     0x11f4bc7b
#define T1_KAOS_RANVAL_4f     0xbbf84b34
#define T1_KAOS_RANVAL_50     0xb5b779ad
#define T1_KAOS_RANVAL_51     0xf962bc6a
#define T1_KAOS_RANVAL_52     0x7f7775c4
#define T1_KAOS_RANVAL_53     0x0cbfc56f
#define T1_KAOS_RANVAL_54     0x518087a9
#define T1_KAOS_RANVAL_55     0x85116110
#define T1_KAOS_RANVAL_56     0xdc0687ae
#define T1_KAOS_RANVAL_57     0xe2955be7
#define T1_KAOS_RANVAL_58     0xe153a411
#define T1_KAOS_RANVAL_59     0x226e1ed3
#define T1_KAOS_RANVAL_5a     0x59e1f5f8
#define T1_KAOS_RANVAL_5b     0xd6a23c9d
#define T1_KAOS_RANVAL_5c     0xb3576bae
#define T1_KAOS_RANVAL_5d     0x7ab24c0e
#define T1_KAOS_RANVAL_5e     0x6b8b5e30
#define T1_KAOS_RANVAL_5f     0x592fdfbf
#define T1_KAOS_RANVAL_60     0x2d146b52
#define T1_KAOS_RANVAL_61     0x75538f66
#define T1_KAOS_RANVAL_62     0xdb4842fc
#define T1_KAOS_RANVAL_63     0x0d3f9272
#define T1_KAOS_RANVAL_64     0xd6574d4f
#define T1_KAOS_RANVAL_65     0x8e177230
#define T1_KAOS_RANVAL_66     0xb32d38b7
#define T1_KAOS_RANVAL_67     0x0fc969d2
#define T1_KAOS_RANVAL_68     0xbd03ea2d
#define T1_KAOS_RANVAL_69     0x74e3350f
#define T1_KAOS_RANVAL_6a     0x40d6c73f
#define T1_KAOS_RANVAL_6b     0xafc8e236
#define T1_KAOS_RANVAL_6c     0xf43c3096
#define T1_KAOS_RANVAL_6d     0x92a1cae1
#define T1_KAOS_RANVAL_6e     0x4cee150c
#define T1_KAOS_RANVAL_6f     0x51ddaeb8
#define T1_KAOS_RANVAL_70     0xbff91895
#define T1_KAOS_RANVAL_71     0x4fd41ddc
#define T1_KAOS_RANVAL_72     0xb9e4af85
#define T1_KAOS_RANVAL_73     0x41ab7cf4
#define T1_KAOS_RANVAL_74     0x356315ff
#define T1_KAOS_RANVAL_75     0xebfe02f3
#define T1_KAOS_RANVAL_76     0x3834048e
#define T1_KAOS_RANVAL_77     0xe48bb10e
#define T1_KAOS_RANVAL_78     0x4b1abe30
#define T1_KAOS_RANVAL_79     0x8b647f7e
#define T1_KAOS_RANVAL_7a     0x7e226165
#define T1_KAOS_RANVAL_7b     0x38d05dfa
#define T1_KAOS_RANVAL_7c     0x0a7994fb
#define T1_KAOS_RANVAL_7d     0xf0b84519
#define T1_KAOS_RANVAL_7e     0x6ed88aae
#define T1_KAOS_RANVAL_7f     0x6b07fdf7
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
!    areaoffset     3008
!    ncache         0
!    emulate_ncache 1
!    pagesize       8192
!    invsize        0
!    codecount      5002
!    code           1af8e000
!    entry          1af8e000
!    fsr_exceptions 00000000
!    fsr_roundmode  00000004
!    fsr_mask       c0000fff
!    seed           d3d134afccd1
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

KTEXT_MODULE(t0_module_ktbl, 0x1af8e000)
.seg "text"
	KGLOBAL(t0_ktbl)
t0_ktbl_page_begin:
.global t0_kref; t0_kref:
	.skip 0
t0_ktbl:
	.word	0xed68a0ca	! t0_kref+0x0:   	prefetch	%g2 + 0xca, 22
	.word	0xda263ffc	! t0_kref+0x4:   	st	%o5, [%i0 - 4]
	.word	0xf4280019	! t0_kref+0x8:   	stb	%i2, [%g0 + %i1]
	.word	0x81b01023	! t0_kref+0xc:   	siam	0x3
	.word	0xfa30a00a	! t0_kref+0x10:   	sth	%i5, [%g2 + 0xa]
	.word	0x81aa8adc	! t0_kref+0x14:   	fcmped	%fcc0, %f10, %f28
	.word	0x81dcb149	! t0_kref+0x18:   	flush	%l2 - 0xeb7
	.word	0xa8c3400c	! t0_kref+0x1c:   	addccc	%o5, %o4, %l4
	.word	0xaea7401d	! t0_kref+0x20:   	subcc	%i5, %i5, %l7
	.word	0xf8367fea	! t0_kref+0x24:   	sth	%i4, [%i1 - 0x16]
	.word	0xec5e001d	! t0_kref+0x28:   	ldx	[%i0 + %i5], %l6
	.word	0xda263ff4	! t0_kref+0x2c:   	st	%o5, [%i0 - 0xc]
	.word	0x9fc00004	! t0_kref+0x30:   	call	%g0 + %g4
	.word	0xa3a01a2d	! t0_kref+0x34:   	fstoi	%f13, %f17
	.word	0x96d82229	! t0_kref+0x38:   	smulcc	%g0, 0x229, %o3
	.word	0xa5a018d0	! t0_kref+0x3c:   	fdtos	%f16, %f18
	.word	0x81db8019	! t0_kref+0x40:   	flush	%sp + %i1
	.word	0xc96e7ff0	! t0_kref+0x44:   	prefetch	%i1 - 0x10, 4
	.word	0x2c800005	! t0_kref+0x48:   	bneg,a	_kref+0x5c
	.word	0x913b401d	! t0_kref+0x4c:   	sra	%o5, %i5, %o0
	.word	0x21480008	! t0_kref+0x50:   	fbn,a,pt	%fcc0, _kref+0x70
	.word	0xb9b38fac	! t0_kref+0x54:   	fors	%f14, %f12, %f28
	.word	0xfa20a020	! t0_kref+0x58:   	st	%i5, [%g2 + 0x20]
	.word	0x9a86c01c	! t0_kref+0x5c:   	addcc	%i3, %i4, %o5
	.word	0xa5a48850	! t0_kref+0x60:   	faddd	%f18, %f16, %f18
	.word	0xa812b377	! t0_kref+0x64:   	or	%o2, -0xc89, %l4
	.word	0xbba018d4	! t0_kref+0x68:   	fdtos	%f20, %f29
	.word	0x81ad0aae	! t0_kref+0x6c:   	fcmpes	%fcc0, %f20, %f14
	.word	0xe100a030	! t0_kref+0x70:   	ld	[%g2 + 0x30], %f16
	sethi	%hi(2f), %o7
	.word	0xe40be088	! t0_kref+0x78:   	ldub	[%o7 + 0x88], %l2
	.word	0xa41ca00c	! t0_kref+0x7c:   	xor	%l2, 0xc, %l2
	.word	0xe42be088	! t0_kref+0x80:   	stb	%l2, [%o7 + 0x88]
	.word	0x81dbe088	! t0_kref+0x84:   	flush	%o7 + 0x88
2:	.word	0xaa3b400a	! t0_kref+0x88:   	xnor	%o5, %o2, %l5
	.word	0xb5b44af2	! t0_kref+0x8c:   	fpsub32s	%f17, %f18, %f26
	.word	0xa93a401c	! t0_kref+0x90:   	sra	%o1, %i4, %l4
	.word	0x947a640a	! t0_kref+0x94:   	sdiv	%o1, 0x40a, %o2
	.word	0xabb00772	! t0_kref+0x98:   	fpack16	%f18, %f21
	.word	0x97b3030d	! t0_kref+0x9c:   	alignaddr	%o4, %o5, %o3
	.word	0xa9a30937	! t0_kref+0xa0:   	fmuls	%f12, %f23, %f20
	.word	0xdb00a008	! t0_kref+0xa4:   	ld	[%g2 + 8], %f13
	.word	0x9736801a	! t0_kref+0xa8:   	srl	%i2, %i2, %o3
	.word	0x9fc00004	! t0_kref+0xac:   	call	%g0 + %g4
	.word	0x94a02501	! t0_kref+0xb0:   	subcc	%g0, 0x501, %o2
	.word	0xada0054a	! t0_kref+0xb4:   	fsqrtd	%f10, %f22
	.word	0xa7b48eee	! t0_kref+0xb8:   	fornot2s	%f18, %f14, %f19
	.word	0xb1b40c4c	! t0_kref+0xbc:   	fnor	%f16, %f12, %f24
	.word	0x2a480008	! t0_kref+0xc0:   	bcs,a,pt	%icc, _kref+0xe0
	.word	0xfa28a019	! t0_kref+0xc4:   	stb	%i5, [%g2 + 0x19]
	.word	0xd0de1000	! t0_kref+0xc8:   	ldxa	[%i0]0x80, %o0
	.word	0x81af4ab0	! t0_kref+0xcc:   	fcmpes	%fcc0, %f29, %f16
	.word	0x38480002	! t0_kref+0xd0:   	bgu,a,pt	%icc, _kref+0xd8
	.word	0xf1ee501b	! t0_kref+0xd4:   	prefetcha	%i1 + %i3, 24
	.word	0xf986501c	! t0_kref+0xd8:   	lda	[%i1 + %i4]0x80, %f28
	.word	0xd016001b	! t0_kref+0xdc:   	lduh	[%i0 + %i3], %o0
	.word	0xadb30a36	! t0_kref+0xe0:   	fpadd16s	%f12, %f22, %f22
	.word	0xe840a018	! t0_kref+0xe4:   	ldsw	[%g2 + 0x18], %l4
	.word	0x99a00550	! t0_kref+0xe8:   	fsqrtd	%f16, %f12
	.word	0xf636c019	! t0_kref+0xec:   	sth	%i3, [%i3 + %i1]
	.word	0xb3b60dfd	! t0_kref+0xf0:   	fnands	%f24, %f29, %f25
	.word	0xb5a588d6	! t0_kref+0xf4:   	fsubd	%f22, %f22, %f26
	.word	0xa1a3892d	! t0_kref+0xf8:   	fmuls	%f14, %f13, %f16
	.word	0xb1a00152	! t0_kref+0xfc:   	fabsd	%f18, %f24
	.word	0x900ae35e	! t0_kref+0x100:   	and	%o3, 0x35e, %o0
	.word	0xed070019	! t0_kref+0x104:   	ld	[%i4 + %i1], %f22
	.word	0x9da0055c	! t0_kref+0x108:   	fsqrtd	%f28, %f14
	.word	0x9da30d31	! t0_kref+0x10c:   	fsmuld	%f12, %f17, %f14
	.word	0x913a400c	! t0_kref+0x110:   	sra	%o1, %o4, %o0
	.word	0x81db7c53	! t0_kref+0x114:   	flush	%o5 - 0x3ad
	.word	0xf500a018	! t0_kref+0x118:   	ld	[%g2 + 0x18], %f26
	.word	0xf1be185b	! t0_kref+0x11c:   	stda	%f24, [%i0 + %i3]0xc2
	.word	0xa7b68f78	! t0_kref+0x120:   	fornot1s	%f26, %f24, %f19
	.word	0x9da000b1	! t0_kref+0x124:   	fnegs	%f17, %f14
	.word	0x30800002	! t0_kref+0x128:   	ba,a	_kref+0x130
	.word	0xa9b48d18	! t0_kref+0x12c:   	fandnot1	%f18, %f24, %f20
	.word	0xa1b007b0	! t0_kref+0x130:   	fpackfix	%f16, %f16
	.word	0xa5a00035	! t0_kref+0x134:   	fmovs	%f21, %f18
	.word	0x9de3bfa0	! t0_kref+0x138:   	save	%sp, -0x60, %sp
	.word	0x97ef4018	! t0_kref+0x13c:   	restore	%i5, %i0, %o3
	.word	0xe8480018	! t0_kref+0x140:   	ldsb	[%g0 + %i0], %l4
	.word	0x2911eade	! t0_kref+0x144:   	sethi	%hi(0x47ab7800), %l4
	.word	0x99b300ca	! t0_kref+0x148:   	edge16l	%o4, %o2, %o4
	.word	0x95a01912	! t0_kref+0x14c:   	fitod	%f18, %f10
	.word	0x9fc10000	! t0_kref+0x150:   	call	%g4
	.word	0xac18000c	! t0_kref+0x154:   	xor	%g0, %o4, %l6
	.word	0x34800008	! t0_kref+0x158:   	bg,a	_kref+0x178
	.word	0x9bb68140	! t0_kref+0x15c:   	edge32l	%i2, %g0, %o5
	.word	0xafb38df7	! t0_kref+0x160:   	fnands	%f14, %f23, %f23
	.word	0x98f2400c	! t0_kref+0x164:   	udivcc	%o1, %o4, %o4
	.word	0x929e801d	! t0_kref+0x168:   	xorcc	%i2, %i5, %o1
	.word	0x912f601f	! t0_kref+0x16c:   	sll	%i5, 0x1f, %o0
	.word	0x25480002	! t0_kref+0x170:   	fblg,a,pt	%fcc0, _kref+0x178
	.word	0xafa0013d	! t0_kref+0x174:   	fabss	%f29, %f23
	.word	0x8143c000	! t0_kref+0x178:   	stbar
	.word	0x9da3493d	! t0_kref+0x17c:   	fmuls	%f13, %f29, %f14
	.word	0xfaf01018	! t0_kref+0x180:   	stxa	%i5, [%g0 + %i0]0x80
	.word	0xc02e4000	! t0_kref+0x184:   	clrb	[%i1]
	.word	0xb5a01112	! t0_kref+0x188:   	fxtod	%f18, %f26
	.word	0xee08a031	! t0_kref+0x18c:   	ldub	[%g2 + 0x31], %l7
	.word	0xf007bfe0	! t0_kref+0x190:   	ld	[%fp - 0x20], %i0
	.word	0x81ac0adc	! t0_kref+0x194:   	fcmped	%fcc0, %f16, %f28
	.word	0x9a26800d	! t0_kref+0x198:   	sub	%i2, %o5, %o5
	.word	0x96f7000d	! t0_kref+0x19c:   	udivcc	%i4, %o5, %o3
	.word	0xf836c018	! t0_kref+0x1a0:   	sth	%i4, [%i3 + %i0]
	.word	0x95b6c30a	! t0_kref+0x1a4:   	alignaddr	%i3, %o2, %o2
	.word	0xd4b6101b	! t0_kref+0x1a8:   	stha	%o2, [%i0 + %i3]0x80
	.word	0x97a018d4	! t0_kref+0x1ac:   	fdtos	%f20, %f11
	.word	0x9db54f72	! t0_kref+0x1b0:   	fornot1s	%f21, %f18, %f14
	.word	0x9de3bfa0	! t0_kref+0x1b4:   	save	%sp, -0x60, %sp
	.word	0xadef4018	! t0_kref+0x1b8:   	restore	%i5, %i0, %l6
	.word	0xa5a00554	! t0_kref+0x1bc:   	fsqrtd	%f20, %f18
	.word	0xa840000a	! t0_kref+0x1c0:   	addc	%g0, %o2, %l4
	.word	0x92f334cb	! t0_kref+0x1c4:   	udivcc	%o4, -0xb35, %o1
	call	SYM(t0_subr1)
	.word	0xb9b60efd	! t0_kref+0x1cc:   	fornot2s	%f24, %f29, %f28
	.word	0xf51fbf88	! t0_kref+0x1d0:   	ldd	[%fp - 0x78], %f26
	.word	0xa87ae4de	! t0_kref+0x1d4:   	sdiv	%o3, 0x4de, %l4
	.word	0xadb70e80	! t0_kref+0x1d8:   	fsrc1	%f28, %f22
	.word	0xb1a28950	! t0_kref+0x1dc:   	fmuld	%f10, %f16, %f24
	.word	0x81af0a4a	! t0_kref+0x1e0:   	fcmpd	%fcc0, %f28, %f10
	.word	0x90df3804	! t0_kref+0x1e4:   	smulcc	%i4, -0x7fc, %o0
	.word	0x94e7400c	! t0_kref+0x1e8:   	subccc	%i5, %o4, %o2
	.word	0xac0ef8a2	! t0_kref+0x1ec:   	and	%i3, -0x75e, %l6
	.word	0xd810a03a	! t0_kref+0x1f0:   	lduh	[%g2 + 0x3a], %o4
	.word	0xd700a038	! t0_kref+0x1f4:   	ld	[%g2 + 0x38], %f11
	.word	0x95b3404b	! t0_kref+0x1f8:   	edge8l	%o5, %o3, %o2
	.word	0x171decd3	! t0_kref+0x1fc:   	sethi	%hi(0x77b34c00), %o3
	.word	0xf8362018	! t0_kref+0x200:   	sth	%i4, [%i0 + 0x18]
	.word	0xb9b00c00	! t0_kref+0x204:   	fzero	%f28
	.word	0x21480002	! t0_kref+0x208:   	fbn,a,pt	%fcc0, _kref+0x210
	.word	0xae3f400b	! t0_kref+0x20c:   	xnor	%i5, %o3, %l7
	.word	0x23480002	! t0_kref+0x210:   	fbne,a,pt	%fcc0, _kref+0x218
	.word	0xf62e8019	! t0_kref+0x214:   	stb	%i3, [%i2 + %i1]
	.word	0xa5a00550	! t0_kref+0x218:   	fsqrtd	%f16, %f18
	.word	0xaf408000	! t0_kref+0x21c:   	mov	%ccr, %l7
	.word	0x30800005	! t0_kref+0x220:   	ba,a	_kref+0x234
	.word	0x9132800b	! t0_kref+0x224:   	srl	%o2, %o3, %o0
	.word	0xa9a0054c	! t0_kref+0x228:   	fsqrtd	%f12, %f20
	.word	0xb7a649ae	! t0_kref+0x22c:   	fdivs	%f25, %f14, %f27
	.word	0xb1a0188e	! t0_kref+0x230:   	fitos	%f14, %f24
	.word	0xd008a00a	! t0_kref+0x234:   	ldub	[%g2 + 0xa], %o0
	.word	0xbba01a5a	! t0_kref+0x238:   	fdtoi	%f26, %f29
	.word	0x9de3bfa0	! t0_kref+0x23c:   	save	%sp, -0x60, %sp
	.word	0xb4466c7e	! t0_kref+0x240:   	addc	%i1, 0xc7e, %i2
	.word	0xa9ef0019	! t0_kref+0x244:   	restore	%i4, %i1, %l4
	.word	0x85836297	! t0_kref+0x248:   	wr	%o5, 0x297, %ccr
	.word	0x9b0f7053	! t0_kref+0x24c:   	tsubcc	%i5, -0xfad, %o5
	.word	0xa5a018d8	! t0_kref+0x250:   	fdtos	%f24, %f18
	.word	0xd8ce5000	! t0_kref+0x254:   	ldsba	[%i1]0x80, %o4
	.word	0x9bb007bc	! t0_kref+0x258:   	fpackfix	%f28, %f13
	.word	0xaae2801c	! t0_kref+0x25c:   	subccc	%o2, %i4, %l5
	.word	0x95400000	! t0_kref+0x260:   	mov	%y, %o2
	.word	0x9a9ae8c9	! t0_kref+0x264:   	xorcc	%o3, 0x8c9, %o5
	.word	0xab1f70c3	! t0_kref+0x268:   	tsubcctv	%i5, -0xf3d, %l5
	.word	0x81ac0ab8	! t0_kref+0x26c:   	fcmpes	%fcc0, %f16, %f24
	.word	0xa826c000	! t0_kref+0x270:   	sub	%i3, %g0, %l4
	.word	0xe2680019	! t0_kref+0x274:   	ldstub	[%g0 + %i1], %l1
	.word	0xd700a008	! t0_kref+0x278:   	ld	[%g2 + 8], %f11
	.word	0xd6263ffc	! t0_kref+0x27c:   	st	%o3, [%i0 - 4]
	.word	0xe5ee101a	! t0_kref+0x280:   	prefetcha	%i0 + %i2, 18
	.word	0x952e8000	! t0_kref+0x284:   	sll	%i2, %g0, %o2
	.word	0xb9a5085a	! t0_kref+0x288:   	faddd	%f20, %f26, %f28
	.word	0x9863400a	! t0_kref+0x28c:   	subc	%o5, %o2, %o4
	.word	0xd01e6008	! t0_kref+0x290:   	ldd	[%i1 + 8], %o0
	.word	0x30800008	! t0_kref+0x294:   	ba,a	_kref+0x2b4
	.word	0x8143c000	! t0_kref+0x298:   	stbar
	.word	0xc5ee100d	! t0_kref+0x29c:   	prefetcha	%i0 + %o5, 2
	.word	0x2a800008	! t0_kref+0x2a0:   	bcs,a	_kref+0x2c0
	.word	0xf1262018	! t0_kref+0x2a4:   	st	%f24, [%i0 + 0x18]
	.word	0xd6901018	! t0_kref+0x2a8:   	lduha	[%g0 + %i0]0x80, %o3
	.word	0xf7063fe8	! t0_kref+0x2ac:   	ld	[%i0 - 0x18], %f27
	.word	0x81def445	! t0_kref+0x2b0:   	flush	%i3 - 0xbbb
	.word	0xd840a028	! t0_kref+0x2b4:   	ldsw	[%g2 + 0x28], %o4
	.word	0xecbe101d	! t0_kref+0x2b8:   	stda	%l6, [%i0 + %i5]0x80
	call	SYM(t0_subr2)
	.word	0x9fa01a4c	! t0_kref+0x2c0:   	fdtoi	%f12, %f15
	.word	0xe810a018	! t0_kref+0x2c4:   	lduh	[%g2 + 0x18], %l4
	.word	0x81af0adc	! t0_kref+0x2c8:   	fcmped	%fcc0, %f28, %f28
	.word	0x923f400a	! t0_kref+0x2cc:   	xnor	%i5, %o2, %o1
	.word	0xacc34000	! t0_kref+0x2d0:   	addccc	%o5, %g0, %l6
	.word	0xf11fbd60	! t0_kref+0x2d4:   	ldd	[%fp - 0x2a0], %f24
	.word	0xac7e8000	! t0_kref+0x2d8:   	sdiv	%i2, %g0, %l6
	.word	0xadb2416a	! t0_kref+0x2dc:   	edge32ln	%o1, %o2, %l6
	.word	0x96a028dc	! t0_kref+0x2e0:   	subcc	%g0, 0x8dc, %o3
	.word	0xb5a408d8	! t0_kref+0x2e4:   	fsubd	%f16, %f24, %f26
	.word	0xda08a022	! t0_kref+0x2e8:   	ldub	[%g2 + 0x22], %o5
	.word	0x9622becc	! t0_kref+0x2ec:   	sub	%o2, -0x134, %o3
	.word	0xb1a0005a	! t0_kref+0x2f0:   	fmovd	%f26, %f24
	.word	0xd6163ff4	! t0_kref+0x2f4:   	lduh	[%i0 - 0xc], %o3
	.word	0x878020e0	! t0_kref+0x2f8:   	mov	0xe0, %asi
	.word	0xacdb401b	! t0_kref+0x2fc:   	smulcc	%o5, %i3, %l6
	.word	0xe5e6101a	! t0_kref+0x300:   	casa	[%i0]0x80, %i2, %l2
	.word	0xb5a2cd2d	! t0_kref+0x304:   	fsmuld	%f11, %f13, %f26
	.word	0xd040a030	! t0_kref+0x308:   	ldsw	[%g2 + 0x30], %o0
	.word	0x81ad0abb	! t0_kref+0x30c:   	fcmpes	%fcc0, %f20, %f27
	.word	0xa7a000bd	! t0_kref+0x310:   	fnegs	%f29, %f19
	.word	0x93b2414d	! t0_kref+0x314:   	edge32l	%o1, %o5, %o1
	.word	0xd85e3ff0	! t0_kref+0x318:   	ldx	[%i0 - 0x10], %o4
	.word	0xd416401b	! t0_kref+0x31c:   	lduh	[%i1 + %i3], %o2
	.word	0xa1a01a52	! t0_kref+0x320:   	fdtoi	%f18, %f16
	.word	0x9a974000	! t0_kref+0x324:   	orcc	%i5, %g0, %o5
	.word	0x94634000	! t0_kref+0x328:   	subc	%o5, %g0, %o2
	.word	0xa8dae67e	! t0_kref+0x32c:   	smulcc	%o3, 0x67e, %l4
	.word	0x2d480008	! t0_kref+0x330:   	fbg,a,pt	%fcc0, _kref+0x350
	.word	0xacf6bcda	! t0_kref+0x334:   	udivcc	%i2, -0x326, %l6
	.word	0x965a6960	! t0_kref+0x338:   	smul	%o1, 0x960, %o3
	.word	0x81da801c	! t0_kref+0x33c:   	flush	%o2 + %i4
	.word	0xa8aefc07	! t0_kref+0x340:   	andncc	%i3, -0x3f9, %l4
	.word	0x92db400c	! t0_kref+0x344:   	smulcc	%o5, %o4, %o1
	.word	0xd46e401a	! t0_kref+0x348:   	ldstub	[%i1 + %i2], %o2
	.word	0xed1e4000	! t0_kref+0x34c:   	ldd	[%i1], %f22
	.word	0xe906001c	! t0_kref+0x350:   	ld	[%i0 + %i4], %f20
	.word	0xa1a00038	! t0_kref+0x354:   	fmovs	%f24, %f16
	.word	0xe36e001a	! t0_kref+0x358:   	prefetch	%i0 + %i2, 17
	.word	0xa3b40fb0	! t0_kref+0x35c:   	fors	%f16, %f16, %f17
	.word	0x3b480008	! t0_kref+0x360:   	fble,a,pt	%fcc0, _kref+0x380
	.word	0x9256b3e1	! t0_kref+0x364:   	umul	%i2, -0xc1f, %o1
	.word	0x929a400c	! t0_kref+0x368:   	xorcc	%o1, %o4, %o1
	.word	0x9da488d6	! t0_kref+0x36c:   	fsubd	%f18, %f22, %f14
	.word	0xa1b606fa	! t0_kref+0x370:   	fmul8ulx16	%f24, %f26, %f16
	.word	0x96376a9a	! t0_kref+0x374:   	orn	%i5, 0xa9a, %o3
	.word	0xee48a012	! t0_kref+0x378:   	ldsb	[%g2 + 0x12], %l7
	.word	0xf6b01019	! t0_kref+0x37c:   	stha	%i3, [%g0 + %i1]0x80
	.word	0xa5a01a5a	! t0_kref+0x380:   	fdtoi	%f26, %f18
	.word	0xadb00cd4	! t0_kref+0x384:   	fnot2	%f20, %f22
	.word	0x81ae0ad0	! t0_kref+0x388:   	fcmped	%fcc0, %f24, %f16
	.word	0xadb4874e	! t0_kref+0x38c:   	fpack32	%f18, %f14, %f22
	.word	0x34800006	! t0_kref+0x390:   	bg,a	_kref+0x3a8
	.word	0x81df7578	! t0_kref+0x394:   	flush	%i5 - 0xa88
	.word	0xd62e3ffe	! t0_kref+0x398:   	stb	%o3, [%i0 - 2]
	.word	0xada38950	! t0_kref+0x39c:   	fmuld	%f14, %f16, %f22
	.word	0xf19e1a1c	! t0_kref+0x3a0:   	ldda	[%i0 + %i4]0xd0, %f24
	.word	0xb1a018ce	! t0_kref+0x3a4:   	fdtos	%f14, %f24
	.word	0x9db3ca6d	! t0_kref+0x3a8:   	fpadd32s	%f15, %f13, %f14
	.word	0x9a06c009	! t0_kref+0x3ac:   	add	%i3, %o1, %o5
	.word	0x31480002	! t0_kref+0x3b0:   	fba,a,pt	%fcc0, _kref+0x3b8
	.word	0xda08a009	! t0_kref+0x3b4:   	ldub	[%g2 + 9], %o5
	.word	0xa856e51d	! t0_kref+0x3b8:   	umul	%i3, 0x51d, %l4
	.word	0xe99eda59	! t0_kref+0x3bc:   	ldda	[%i3 + %i1]0xd2, %f20
	.word	0x9467001b	! t0_kref+0x3c0:   	subc	%i4, %i3, %o2
	.word	0xec3e001d	! t0_kref+0x3c4:   	std	%l6, [%i0 + %i5]
	.word	0xb5a2cd3d	! t0_kref+0x3c8:   	fsmuld	%f11, %f29, %f26
	.word	0x9a07001a	! t0_kref+0x3cc:   	add	%i4, %i2, %o5
	.word	0x9442c01a	! t0_kref+0x3d0:   	addc	%o3, %i2, %o2
	.word	0xa9a00552	! t0_kref+0x3d4:   	fsqrtd	%f18, %f20
	.word	0x96803076	! t0_kref+0x3d8:   	addcc	%g0, -0xf8a, %o3
	.word	0x9072b8bb	! t0_kref+0x3dc:   	udiv	%o2, -0x745, %o0
	.word	0xae468000	! t0_kref+0x3e0:   	addc	%i2, %g0, %l7
	.word	0x81ad8ab8	! t0_kref+0x3e4:   	fcmpes	%fcc0, %f22, %f24
	.word	0xae38000b	! t0_kref+0x3e8:   	xnor	%g0, %o3, %l7
	.word	0xab400000	! t0_kref+0x3ec:   	mov	%y, %l5
	.word	0xee7e7ff4	! t0_kref+0x3f0:   	swap	[%i1 - 0xc], %l7
	.word	0xfa2e3fe4	! t0_kref+0x3f4:   	stb	%i5, [%i0 - 0x1c]
	.word	0xd51e3fe0	! t0_kref+0x3f8:   	ldd	[%i0 - 0x20], %f10
	.word	0x81aaca2f	! t0_kref+0x3fc:   	fcmps	%fcc0, %f11, %f15
	.word	0xe8be1000	! t0_kref+0x400:   	stda	%l4, [%i0]0x80
	.word	0xa3a00531	! t0_kref+0x404:   	fsqrts	%f17, %f17
	.word	0xb3a00030	! t0_kref+0x408:   	fmovs	%f16, %f25
	.word	0x8143c000	! t0_kref+0x40c:   	stbar
	.word	0x99b5098a	! t0_kref+0x410:   	bshuffle	%f20, %f10, %f12
	.word	0xfaa61000	! t0_kref+0x414:   	sta	%i5, [%i0]0x80
	.word	0x99b506dc	! t0_kref+0x418:   	fmul8sux16	%f20, %f28, %f12
	.word	0xe9060000	! t0_kref+0x41c:   	ld	[%i0], %f20
	.word	0xf3070018	! t0_kref+0x420:   	ld	[%i4 + %i0], %f25
	.word	0xada409d6	! t0_kref+0x424:   	fdivd	%f16, %f22, %f22
	.word	0xae9a76a9	! t0_kref+0x428:   	xorcc	%o1, -0x957, %l7
	.word	0x9052e3ff	! t0_kref+0x42c:   	umul	%o3, 0x3ff, %o0
	.word	0x2c800002	! t0_kref+0x430:   	bneg,a	_kref+0x438
	.word	0xe51fbef0	! t0_kref+0x434:   	ldd	[%fp - 0x110], %f18
	.word	0xd816c018	! t0_kref+0x438:   	lduh	[%i3 + %i0], %o4
	.word	0xd9062004	! t0_kref+0x43c:   	ld	[%i0 + 4], %f12
	.word	0x8d86bdd1	! t0_kref+0x440:   	wr	%i2, 0xfffffdd1, %fprs
	.word	0xe3b8a080	! t0_kref+0x444:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xe3b8a080	! t0_kref+0x448:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x9856a5cb	! t0_kref+0x44c:   	umul	%i2, 0x5cb, %o4
	.word	0x9da308d2	! t0_kref+0x450:   	fsubd	%f12, %f18, %f14
	.word	0xd0be101d	! t0_kref+0x454:   	stda	%o0, [%i0 + %i5]0x80
	.word	0xd6480018	! t0_kref+0x458:   	ldsb	[%g0 + %i0], %o3
	.word	0xaa837692	! t0_kref+0x45c:   	addcc	%o5, -0x96e, %l5
	.word	0xf620a028	! t0_kref+0x460:   	st	%i3, [%g2 + 0x28]
	.word	0x81ad0ad8	! t0_kref+0x464:   	fcmped	%fcc0, %f20, %f24
	.word	0xa7b38afb	! t0_kref+0x468:   	fpsub32s	%f14, %f27, %f19
	.word	0xe9be5809	! t0_kref+0x46c:   	stda	%f20, [%i1 + %o1]0xc0
	call	SYM(t0_subr0)
	.word	0xf62e6006	! t0_kref+0x474:   	stb	%i3, [%i1 + 6]
	.word	0x9fc10000	! t0_kref+0x478:   	call	%g4
	.word	0xb5a689da	! t0_kref+0x47c:   	fdivd	%f26, %f26, %f26
	.word	0xe9861000	! t0_kref+0x480:   	lda	[%i0]0x80, %f20
	.word	0xb7a018dc	! t0_kref+0x484:   	fdtos	%f28, %f27
	.word	0x93b7406a	! t0_kref+0x488:   	edge8ln	%i5, %o2, %o1
	.word	0x973b001b	! t0_kref+0x48c:   	sra	%o4, %i3, %o3
	.word	0xea6e7ffd	! t0_kref+0x490:   	ldstub	[%i1 - 3], %l5
	.word	0x9bb685d6	! t0_kref+0x494:   	fcmpeq32	%f26, %f22, %o5
	.word	0xb1a0055c	! t0_kref+0x498:   	fsqrtd	%f28, %f24
	.word	0xe51e2000	! t0_kref+0x49c:   	ldd	[%i0], %f18
	.word	0x9ba00532	! t0_kref+0x4a0:   	fsqrts	%f18, %f13
	.word	0x98bf4000	! t0_kref+0x4a4:   	xnorcc	%i5, %g0, %o4
	.word	0x95a0055c	! t0_kref+0x4a8:   	fsqrtd	%f28, %f10
	.word	0xd808a020	! t0_kref+0x4ac:   	ldub	[%g2 + 0x20], %o4
	.word	0xa9a000da	! t0_kref+0x4b0:   	fnegd	%f26, %f20
	.word	0x27480001	! t0_kref+0x4b4:   	fbul,a,pt	%fcc0, _kref+0x4b8
	.word	0x953b2004	! t0_kref+0x4b8:   	sra	%o4, 0x4, %o2
	.word	0xbbb007b8	! t0_kref+0x4bc:   	fpackfix	%f24, %f29
	.word	0xb1a00534	! t0_kref+0x4c0:   	fsqrts	%f20, %f24
	.word	0x86102002	! t0_kref+0x4c4:   	mov	0x2, %g3
	.word	0x86a0e001	! t0_kref+0x4c8:   	subcc	%g3, 1, %g3
	.word	0x22800018	! t0_kref+0x4cc:   	be,a	_kref+0x52c
	.word	0x960ec00a	! t0_kref+0x4d0:   	and	%i3, %o2, %o3
	.word	0xadb2811b	! t0_kref+0x4d4:   	edge32	%o2, %i3, %l6
	.word	0x961a62ea	! t0_kref+0x4d8:   	xor	%o1, 0x2ea, %o3
	.word	0x9426800b	! t0_kref+0x4dc:   	sub	%i2, %o3, %o2
	.word	0x9bb2804a	! t0_kref+0x4e0:   	edge8l	%o2, %o2, %o5
	.word	0x90e27dd2	! t0_kref+0x4e4:   	subccc	%o1, -0x22e, %o0
	.word	0xdd19401d	! t0_kref+0x4e8:   	ldd	[%g5 + %i5], %f14
	.word	0x2cbffff7	! t0_kref+0x4ec:   	bneg,a	_kref+0x4c8
	.word	0xe3b8a080	! t0_kref+0x4f0:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xada509dc	! t0_kref+0x4f4:   	fdivd	%f20, %f28, %f22
	.word	0xe1060000	! t0_kref+0x4f8:   	ld	[%i0], %f16
	.word	0x9267001b	! t0_kref+0x4fc:   	subc	%i4, %i3, %o1
	.word	0x9b3b4009	! t0_kref+0x500:   	sra	%o5, %o1, %o5
	.word	0xb5a388b4	! t0_kref+0x504:   	fsubs	%f14, %f20, %f26
	.word	0x9a16c01a	! t0_kref+0x508:   	or	%i3, %i2, %o5
	.word	0x99a01918	! t0_kref+0x50c:   	fitod	%f24, %f12
	.word	0xd4c81019	! t0_kref+0x510:   	ldsba	[%g0 + %i1]0x80, %o2
	.word	0x3b480002	! t0_kref+0x514:   	fble,a,pt	%fcc0, _kref+0x51c
	.word	0xa7a018d6	! t0_kref+0x518:   	fdtos	%f22, %f19
	.word	0xae5b335f	! t0_kref+0x51c:   	smul	%o4, -0xca1, %l7
	.word	0xa9b007aa	! t0_kref+0x520:   	fpackfix	%f10, %f20
	.word	0xd410a010	! t0_kref+0x524:   	lduh	[%g2 + 0x10], %o2
	.word	0xd428a01a	! t0_kref+0x528:   	stb	%o2, [%g2 + 0x1a]
	.word	0xb7a000ae	! t0_kref+0x52c:   	fnegs	%f14, %f27
	.word	0xd81e6000	! t0_kref+0x530:   	ldd	[%i1], %o4
	.word	0x95400000	! t0_kref+0x534:   	mov	%y, %o2
	.word	0xfa263ffc	! t0_kref+0x538:   	st	%i5, [%i0 - 4]
	.word	0xe91fbf78	! t0_kref+0x53c:   	ldd	[%fp - 0x88], %f20
	.word	0xa5b68916	! t0_kref+0x540:   	faligndata	%f26, %f22, %f18
	.word	0x9a66f20d	! t0_kref+0x544:   	subc	%i3, -0xdf3, %o5
	.word	0x9da0110e	! t0_kref+0x548:   	fxtod	%f14, %f14
	.word	0x97b3405a	! t0_kref+0x54c:   	edge8l	%o5, %i2, %o3
	.word	0x97b00f2e	! t0_kref+0x550:   	fsrc2s	%f14, %f11
	.word	0xd84e0000	! t0_kref+0x554:   	ldsb	[%i0], %o4
	.word	0xbbb3ce7a	! t0_kref+0x558:   	fxnors	%f15, %f26, %f29
	.word	0x81ad4ab0	! t0_kref+0x55c:   	fcmpes	%fcc0, %f21, %f16
	.word	0xaca76efc	! t0_kref+0x560:   	subcc	%i5, 0xefc, %l6
	.word	0x9db00c20	! t0_kref+0x564:   	fzeros	%f14
	.word	0xf8363ff8	! t0_kref+0x568:   	sth	%i4, [%i0 - 8]
	.word	0xee08a02b	! t0_kref+0x56c:   	ldub	[%g2 + 0x2b], %l7
	.word	0xc807bfe8	! t0_kref+0x570:   	ld	[%fp - 0x18], %g4
	.word	0xa9b5cdfc	! t0_kref+0x574:   	fnands	%f23, %f28, %f20
	.word	0xa7a00534	! t0_kref+0x578:   	fsqrts	%f20, %f19
	.word	0xd9f6500d	! t0_kref+0x57c:   	casxa	[%i1]0x80, %o5, %o4
	.word	0x9da0055a	! t0_kref+0x580:   	fsqrtd	%f26, %f14
	.word	0x9287001a	! t0_kref+0x584:   	addcc	%i4, %i2, %o1
	.word	0xa8a36e8d	! t0_kref+0x588:   	subcc	%o5, 0xe8d, %l4
	.word	0x81ae8a50	! t0_kref+0x58c:   	fcmpd	%fcc0, %f26, %f16
	.word	0xd900a000	! t0_kref+0x590:   	ld	[%g2], %f12
	.word	0xe8bf5019	! t0_kref+0x594:   	stda	%l4, [%i5 + %i1]0x80
	.word	0xda48a01a	! t0_kref+0x598:   	ldsb	[%g2 + 0x1a], %o5
	.word	0xac633640	! t0_kref+0x59c:   	subc	%o4, -0x9c0, %l6
	.word	0xacf6800a	! t0_kref+0x5a0:   	udivcc	%i2, %o2, %l6
	.word	0xaeab0000	! t0_kref+0x5a4:   	andncc	%o4, %g0, %l7
	.word	0xeb68a10c	! t0_kref+0x5a8:   	prefetch	%g2 + 0x10c, 21
	.word	0xe3b8a080	! t0_kref+0x5ac:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x8143c000	! t0_kref+0x5b0:   	stbar
	.word	0x9de3bfa0	! t0_kref+0x5b4:   	save	%sp, -0x60, %sp
	.word	0xb23f291b	! t0_kref+0x5b8:   	xnor	%i4, 0x91b, %i1
	.word	0x91ef6ae2	! t0_kref+0x5bc:   	restore	%i5, 0xae2, %o0
	.word	0xda167fe4	! t0_kref+0x5c0:   	lduh	[%i1 - 0x1c], %o5
	.word	0xb1b70e5c	! t0_kref+0x5c4:   	fxnor	%f28, %f28, %f24
	.word	0xb3b38e6d	! t0_kref+0x5c8:   	fxnors	%f14, %f13, %f25
	.word	0xa9a0054e	! t0_kref+0x5cc:   	fsqrtd	%f14, %f20
	.word	0x24800003	! t0_kref+0x5d0:   	ble,a	_kref+0x5dc
	.word	0xada0054e	! t0_kref+0x5d4:   	fsqrtd	%f14, %f22
	.word	0xad3f201f	! t0_kref+0x5d8:   	sra	%i4, 0x1f, %l6
	.word	0x99a4c8bd	! t0_kref+0x5dc:   	fsubs	%f19, %f29, %f12
	.word	0x96a2b8a1	! t0_kref+0x5e0:   	subcc	%o2, -0x75f, %o3
	.word	0x99a608d4	! t0_kref+0x5e4:   	fsubd	%f24, %f20, %f12
	.word	0xaa03000c	! t0_kref+0x5e8:   	add	%o4, %o4, %l5
	.word	0x92a3001c	! t0_kref+0x5ec:   	subcc	%o4, %i4, %o1
	.word	0xaedac00a	! t0_kref+0x5f0:   	smulcc	%o3, %o2, %l7
	.word	0x9bb34f71	! t0_kref+0x5f4:   	fornot1s	%f13, %f17, %f13
	.word	0xd4ce9018	! t0_kref+0x5f8:   	ldsba	[%i2 + %i0]0x80, %o2
	.word	0xb3a64938	! t0_kref+0x5fc:   	fmuls	%f25, %f24, %f25
	.word	0xa9b3844a	! t0_kref+0x600:   	fcmpne16	%f14, %f10, %l4
	.word	0x92d7000a	! t0_kref+0x604:   	umulcc	%i4, %o2, %o1
	.word	0xc807bfec	! t0_kref+0x608:   	ld	[%fp - 0x14], %g4
	.word	0x97400000	! t0_kref+0x60c:   	mov	%y, %o3
	.word	0xb3a018d2	! t0_kref+0x610:   	fdtos	%f18, %f25
	.word	0xb1b7472f	! t0_kref+0x614:   	fmuld8ulx16	%f29, %f15, %f24
	.word	0xa1a01915	! t0_kref+0x618:   	fitod	%f21, %f16
	.word	0x9de3bfa0	! t0_kref+0x61c:   	save	%sp, -0x60, %sp
	.word	0xadef0000	! t0_kref+0x620:   	restore	%i4, %g0, %l6
	.word	0x942f2eed	! t0_kref+0x624:   	andn	%i4, 0xeed, %o2
	.word	0x9b400000	! t0_kref+0x628:   	mov	%y, %o5
	.word	0x9fa01a4c	! t0_kref+0x62c:   	fdtoi	%f12, %f15
	.word	0xa7b6cfb7	! t0_kref+0x630:   	fors	%f27, %f23, %f19
	.word	0xf4200018	! t0_kref+0x634:   	st	%i2, [%g0 + %i0]
	.word	0xacf0000a	! t0_kref+0x638:   	udivcc	%g0, %o2, %l6
	.word	0x99b48f8c	! t0_kref+0x63c:   	for	%f18, %f12, %f12
	.word	0xac3a8009	! t0_kref+0x640:   	xnor	%o2, %o1, %l6
	.word	0xe808a00b	! t0_kref+0x644:   	ldub	[%g2 + 0xb], %l4
	.word	0xc16e6000	! t0_kref+0x648:   	prefetch	%i1, 0
	.word	0xb1b486f8	! t0_kref+0x64c:   	fmul8ulx16	%f18, %f24, %f24
	.word	0x81dbc009	! t0_kref+0x650:   	flush	%o7 + %o1
	.word	0x94027163	! t0_kref+0x654:   	add	%o1, -0xe9d, %o2
	.word	0xef063ff0	! t0_kref+0x658:   	ld	[%i0 - 0x10], %f23
	.word	0xa5a68950	! t0_kref+0x65c:   	fmuld	%f26, %f16, %f18
	.word	0x8143c000	! t0_kref+0x660:   	stbar
	.word	0x32480006	! t0_kref+0x664:   	bne,a,pt	%icc, _kref+0x67c
	.word	0xd626600c	! t0_kref+0x668:   	st	%o3, [%i1 + 0xc]
	.word	0xf51e7fe0	! t0_kref+0x66c:   	ldd	[%i1 - 0x20], %f26
	.word	0xaeaf26c3	! t0_kref+0x670:   	andncc	%i4, 0x6c3, %l7
	.word	0xabb3cdf8	! t0_kref+0x674:   	fnands	%f15, %f24, %f21
	.word	0xd630a00a	! t0_kref+0x678:   	sth	%o3, [%g2 + 0xa]
	.word	0x9bb7035c	! t0_kref+0x67c:   	alignaddrl	%i4, %i4, %o5
	.word	0x81af4a3b	! t0_kref+0x680:   	fcmps	%fcc0, %f29, %f27
	.word	0x9733000a	! t0_kref+0x684:   	srl	%o4, %o2, %o3
	.word	0x92c7401c	! t0_kref+0x688:   	addccc	%i5, %i4, %o1
	.word	0x001fffff	! t0_kref+0x68c:   	illtrap	0x1fffff
	.word	0xd2166004	! t0_kref+0x690:   	lduh	[%i1 + 4], %o1
	.word	0x81ad8a32	! t0_kref+0x694:   	fcmps	%fcc0, %f22, %f18
	.word	0xc368a04b	! t0_kref+0x698:   	prefetch	%g2 + 0x4b, 1
	.word	0x81ae0a52	! t0_kref+0x69c:   	fcmpd	%fcc0, %f24, %f18
	.word	0xa3a308b6	! t0_kref+0x6a0:   	fsubs	%f12, %f22, %f17
	.word	0xb9a01913	! t0_kref+0x6a4:   	fitod	%f19, %f28
	.word	0x2a800001	! t0_kref+0x6a8:   	bcs,a	_kref+0x6ac
	.word	0x9733200d	! t0_kref+0x6ac:   	srl	%o4, 0xd, %o3
	.word	0xefe6100a	! t0_kref+0x6b0:   	casa	[%i0]0x80, %o2, %l7
	.word	0xa93b2006	! t0_kref+0x6b4:   	sra	%o4, 0x6, %l4
	.word	0xef00a030	! t0_kref+0x6b8:   	ld	[%g2 + 0x30], %f23
	.word	0xa862bfea	! t0_kref+0x6bc:   	subc	%o2, -0x16, %l4
	.word	0xaba0052e	! t0_kref+0x6c0:   	fsqrts	%f14, %f21
	.word	0x9abae37f	! t0_kref+0x6c4:   	xnorcc	%o3, 0x37f, %o5
	.word	0xadb28f4c	! t0_kref+0x6c8:   	fornot1	%f10, %f12, %f22
	.word	0x9fc00004	! t0_kref+0x6cc:   	call	%g0 + %g4
	.word	0xafa000bb	! t0_kref+0x6d0:   	fnegs	%f27, %f23
	.word	0xac33401c	! t0_kref+0x6d4:   	orn	%o5, %i4, %l6
	.word	0xe3b8a080	! t0_kref+0x6d8:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xb5a01916	! t0_kref+0x6dc:   	fitod	%f22, %f26
	.word	0xad408000	! t0_kref+0x6e0:   	mov	%ccr, %l6
	.word	0xa3a018ce	! t0_kref+0x6e4:   	fdtos	%f14, %f17
	.word	0x98ba801c	! t0_kref+0x6e8:   	xnorcc	%o2, %i4, %o4
	.word	0xc1ee500a	! t0_kref+0x6ec:   	prefetcha	%i1 + %o2, 0
	.word	0x25480001	! t0_kref+0x6f0:   	fblg,a,pt	%fcc0, _kref+0x6f4
	.word	0x91b74020	! t0_kref+0x6f4:   	edge8n	%i5, %g0, %o0
	.word	0xf430a030	! t0_kref+0x6f8:   	sth	%i2, [%g2 + 0x30]
	.word	0x2b480008	! t0_kref+0x6fc:   	fbug,a,pt	%fcc0, _kref+0x71c
	.word	0xed6e2000	! t0_kref+0x700:   	prefetch	%i0, 22
	.word	0xf6200018	! t0_kref+0x704:   	st	%i3, [%g0 + %i0]
	.word	0xd01e3ff0	! t0_kref+0x708:   	ldd	[%i0 - 0x10], %o0
	.word	0xad408000	! t0_kref+0x70c:   	mov	%ccr, %l6
	.word	0x2a800003	! t0_kref+0x710:   	bcs,a	_kref+0x71c
	.word	0xa1b70edc	! t0_kref+0x714:   	fornot2	%f28, %f28, %f16
	.word	0xd420a038	! t0_kref+0x718:   	st	%o2, [%g2 + 0x38]
	.word	0xd610a02a	! t0_kref+0x71c:   	lduh	[%g2 + 0x2a], %o3
	.word	0xffee501a	! t0_kref+0x720:   	prefetcha	%i1 + %i2, 31
	.word	0x988b001a	! t0_kref+0x724:   	andcc	%o4, %i2, %o4
	.word	0xd648a00b	! t0_kref+0x728:   	ldsb	[%g2 + 0xb], %o3
	.word	0x9266b065	! t0_kref+0x72c:   	subc	%i2, -0xf9b, %o1
	.word	0x3b800004	! t0_kref+0x730:   	fble,a	_kref+0x740
	.word	0xac9321f5	! t0_kref+0x734:   	orcc	%o4, 0x1f5, %l6
	.word	0xdd1fbe60	! t0_kref+0x738:   	ldd	[%fp - 0x1a0], %f14
	.word	0xd630a002	! t0_kref+0x73c:   	sth	%o3, [%g2 + 2]
	.word	0xf5ee501b	! t0_kref+0x740:   	prefetcha	%i1 + %i3, 26
	.word	0xe86e200f	! t0_kref+0x744:   	ldstub	[%i0 + 0xf], %l4
	.word	0xd200a010	! t0_kref+0x748:   	ld	[%g2 + 0x10], %o1
	.word	0xd99eda58	! t0_kref+0x74c:   	ldda	[%i3 + %i0]0xd2, %f12
	.word	0xd06e7fe1	! t0_kref+0x750:   	ldstub	[%i1 - 0x1f], %o0
	.word	0x900324db	! t0_kref+0x754:   	add	%o4, 0x4db, %o0
	.word	0x9b408000	! t0_kref+0x758:   	mov	%ccr, %o5
	.word	0x92002638	! t0_kref+0x75c:   	add	%g0, 0x638, %o1
	.word	0xaf400000	! t0_kref+0x760:   	mov	%y, %l7
	.word	0x8583000c	! t0_kref+0x764:   	wr	%o4, %o4, %ccr
	.word	0xa1a018d0	! t0_kref+0x768:   	fdtos	%f16, %f16
	.word	0x9da00552	! t0_kref+0x76c:   	fsqrtd	%f18, %f14
	.word	0xb1a00550	! t0_kref+0x770:   	fsqrtd	%f16, %f24
	.word	0xd608a000	! t0_kref+0x774:   	ldub	[%g2], %o3
	.word	0xada748bb	! t0_kref+0x778:   	fsubs	%f29, %f27, %f22
	.word	0x96636af6	! t0_kref+0x77c:   	subc	%o5, 0xaf6, %o3
	.word	0xa3b2cd32	! t0_kref+0x780:   	fandnot1s	%f11, %f18, %f17
	.word	0x9adf400c	! t0_kref+0x784:   	smulcc	%i5, %o4, %o5
	.word	0xa8900009	! t0_kref+0x788:   	orcc	%g0, %o1, %l4
	.word	0xc807bfec	! t0_kref+0x78c:   	ld	[%fp - 0x14], %g4
	.word	0xf8200018	! t0_kref+0x790:   	st	%i4, [%g0 + %i0]
	.word	0xf19f5019	! t0_kref+0x794:   	ldda	[%i5 + %i1]0x80, %f24
	.word	0xabb3cafd	! t0_kref+0x798:   	fpsub32s	%f15, %f29, %f21
	.word	0x86102013	! t0_kref+0x79c:   	mov	0x13, %g3
	.word	0x86a0e001	! t0_kref+0x7a0:   	subcc	%g3, 1, %g3
	.word	0x2280000c	! t0_kref+0x7a4:   	be,a	_kref+0x7d4
	.word	0x96dea0d1	! t0_kref+0x7a8:   	smulcc	%i2, 0xd1, %o3
	.word	0xda20a018	! t0_kref+0x7ac:   	st	%o5, [%g2 + 0x18]
	.word	0x9fa01a30	! t0_kref+0x7b0:   	fstoi	%f16, %f15
	.word	0xada018d0	! t0_kref+0x7b4:   	fdtos	%f16, %f22
	.word	0xd4067ff0	! t0_kref+0x7b8:   	ld	[%i1 - 0x10], %o2
	.word	0x94724000	! t0_kref+0x7bc:   	udiv	%o1, %g0, %o2
	.word	0x90633d53	! t0_kref+0x7c0:   	subc	%o4, -0x2ad, %o0
	.word	0xa8f36933	! t0_kref+0x7c4:   	udivcc	%o5, 0x933, %l4
	.word	0x99a6895c	! t0_kref+0x7c8:   	fmuld	%f26, %f28, %f12
	.word	0x94db22c3	! t0_kref+0x7cc:   	smulcc	%o4, 0x2c3, %o2
	.word	0xada00535	! t0_kref+0x7d0:   	fsqrts	%f21, %f22
	.word	0xa9a589dc	! t0_kref+0x7d4:   	fdivd	%f22, %f28, %f20
	.word	0x38480006	! t0_kref+0x7d8:   	bgu,a,pt	%icc, _kref+0x7f0
	.word	0xe268a011	! t0_kref+0x7dc:   	ldstub	[%g2 + 0x11], %l1
	.word	0x96bb4009	! t0_kref+0x7e0:   	xnorcc	%o5, %o1, %o3
	.word	0xac937260	! t0_kref+0x7e4:   	orcc	%o5, -0xda0, %l6
	.word	0x99a00550	! t0_kref+0x7e8:   	fsqrtd	%f16, %f12
	.word	0xf430a010	! t0_kref+0x7ec:   	sth	%i2, [%g2 + 0x10]
	.word	0x9770001b	! t0_kref+0x7f0:   	popc	%i3, %o3
	.word	0xb5b68e4c	! t0_kref+0x7f4:   	fxnor	%f26, %f12, %f26
	.word	0x9bb3033c	! t0_kref+0x7f8:   	bmask	%o4, %i4, %o5
	.word	0x23480001	! t0_kref+0x7fc:   	fbne,a,pt	%fcc0, _kref+0x800
	.word	0x97a000b5	! t0_kref+0x800:   	fnegs	%f21, %f11
	.word	0x9fc10000	! t0_kref+0x804:   	call	%g4
	.word	0xed1e2008	! t0_kref+0x808:   	ldd	[%i0 + 8], %f22
	.word	0xd42e7fec	! t0_kref+0x80c:   	stb	%o2, [%i1 - 0x14]
	.word	0xfb6e3ff0	! t0_kref+0x810:   	prefetch	%i0 - 0x10, 29
	.word	0xf51fbcb8	! t0_kref+0x814:   	ldd	[%fp - 0x348], %f26
	.word	0xd91e401d	! t0_kref+0x818:   	ldd	[%i1 + %i5], %f12
	.word	0x9022800b	! t0_kref+0x81c:   	sub	%o2, %o3, %o0
	.word	0xa1a00534	! t0_kref+0x820:   	fsqrts	%f20, %f16
	.word	0xa9a01a33	! t0_kref+0x824:   	fstoi	%f19, %f20
	.word	0x81ab8a5a	! t0_kref+0x828:   	fcmpd	%fcc0, %f14, %f26
	.word	0xd24e2018	! t0_kref+0x82c:   	ldsb	[%i0 + 0x18], %o1
	.word	0xe3064000	! t0_kref+0x830:   	ld	[%i1], %f17
	.word	0xb4102000	! t0_kref+0x834:   	mov	0x0, %i2
	.word	0x96af6f13	! t0_kref+0x838:   	andncc	%i5, 0xf13, %o3
	.word	0xa930001b	! t0_kref+0x83c:   	srl	%g0, %i3, %l4
	.word	0xc807bff0	! t0_kref+0x840:   	ld	[%fp - 0x10], %g4
	.word	0xea4e4000	! t0_kref+0x844:   	ldsb	[%i1], %l5
	.word	0x3a800002	! t0_kref+0x848:   	bcc,a	_kref+0x850
	.word	0xd41e0000	! t0_kref+0x84c:   	ldd	[%i0], %o2
	.word	0xafa018dc	! t0_kref+0x850:   	fdtos	%f28, %f23
	.word	0xa5a0191c	! t0_kref+0x854:   	fitod	%f28, %f18
	.word	0x81da20b1	! t0_kref+0x858:   	flush	%o0 + 0xb1
	.word	0xa5b3cdfd	! t0_kref+0x85c:   	fnands	%f15, %f29, %f18
	.word	0xa9b7001a	! t0_kref+0x860:   	edge8	%i4, %i2, %l4
	.word	0x8d872c61	! t0_kref+0x864:   	wr	%i4, 0xc61, %fprs
	.word	0xe11fbc60	! t0_kref+0x868:   	ldd	[%fp - 0x3a0], %f16
	.word	0x99a4c9b3	! t0_kref+0x86c:   	fdivs	%f19, %f19, %f12
	.word	0x952f6010	! t0_kref+0x870:   	sll	%i5, 0x10, %o2
	.word	0xf36e6018	! t0_kref+0x874:   	prefetch	%i1 + 0x18, 25
	.word	0xacdab7f2	! t0_kref+0x878:   	smulcc	%o2, -0x80e, %l6
	.word	0xd050a020	! t0_kref+0x87c:   	ldsh	[%g2 + 0x20], %o0
	.word	0xad1ac00a	! t0_kref+0x880:   	tsubcctv	%o3, %o2, %l6
	.word	0xe3b8a080	! t0_kref+0x884:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xda100019	! t0_kref+0x888:   	lduh	[%g0 + %i1], %o5
	.word	0xf820a030	! t0_kref+0x88c:   	st	%i4, [%g2 + 0x30]
	.word	0xb5a0054e	! t0_kref+0x890:   	fsqrtd	%f14, %f26
	.word	0xf420a010	! t0_kref+0x894:   	st	%i2, [%g2 + 0x10]
	.word	0xb9b60756	! t0_kref+0x898:   	fpack32	%f24, %f22, %f28
	.word	0xa9a01a33	! t0_kref+0x89c:   	fstoi	%f19, %f20
	.word	0xae50000b	! t0_kref+0x8a0:   	umul	%g0, %o3, %l7
	.word	0xda68a028	! t0_kref+0x8a4:   	ldstub	[%g2 + 0x28], %o5
	.word	0xeed65000	! t0_kref+0x8a8:   	ldsha	[%i1]0x80, %l7
	.word	0xb5a00531	! t0_kref+0x8ac:   	fsqrts	%f17, %f26
	.word	0xd408a003	! t0_kref+0x8b0:   	ldub	[%g2 + 3], %o2
	.word	0x2a800003	! t0_kref+0x8b4:   	bcs,a	_kref+0x8c0
	.word	0xa862801a	! t0_kref+0x8b8:   	subc	%o2, %i2, %l4
	.word	0x95b24240	! t0_kref+0x8bc:   	array16	%o1, %g0, %o2
	.word	0x9057400c	! t0_kref+0x8c0:   	umul	%i5, %o4, %o0
	.word	0xef067fe8	! t0_kref+0x8c4:   	ld	[%i1 - 0x18], %f23
	.word	0xe808a01a	! t0_kref+0x8c8:   	ldub	[%g2 + 0x1a], %l4
	.word	0xe99e5a5b	! t0_kref+0x8cc:   	ldda	[%i1 + %i3]0xd2, %f20
	.word	0xa1a0055c	! t0_kref+0x8d0:   	fsqrtd	%f28, %f16
	.word	0xe4086750	! t0_kref+0x8d4:   	ldub	[%g1 + 0x750], %l2
	.word	0xa41ca00c	! t0_kref+0x8d8:   	xor	%l2, 0xc, %l2
	.word	0xe4286750	! t0_kref+0x8dc:   	stb	%l2, [%g1 + 0x750]
	.word	0x81d86750	! t0_kref+0x8e0:   	flush	%g1 + 0x750
	.word	0xafb70410	! t0_kref+0x8e4:   	fcmple16	%f28, %f16, %l7
	.word	0xa1b38ada	! t0_kref+0x8e8:   	fpsub32	%f14, %f26, %f16
	.word	0xd8363ff2	! t0_kref+0x8ec:   	sth	%o4, [%i0 - 0xe]
	.word	0xadb50f70	! t0_kref+0x8f0:   	fornot1s	%f20, %f16, %f22
2:	.word	0xada588d6	! t0_kref+0x8f4:   	fsubd	%f22, %f22, %f22
	.word	0xac78377a	! t0_kref+0x8f8:   	sdiv	%g0, -0x886, %l6
	.word	0x97b3013d	! t0_kref+0x8fc:   	edge32n	%o4, %i5, %o3
	.word	0x31480003	! t0_kref+0x900:   	fba,a,pt	%fcc0, _kref+0x90c
	.word	0xb5b30e4a	! t0_kref+0x904:   	fxnor	%f12, %f10, %f26
	.word	0xf8270018	! t0_kref+0x908:   	st	%i4, [%i4 + %i0]
	.word	0xb1b70e80	! t0_kref+0x90c:   	fsrc1	%f28, %f24
	.word	0xac234000	! t0_kref+0x910:   	sub	%o5, %g0, %l6
	.word	0x96080009	! t0_kref+0x914:   	and	%g0, %o1, %o3
	sethi	%hi(2f), %o7
	.word	0xe40be160	! t0_kref+0x91c:   	ldub	[%o7 + 0x160], %l2
	.word	0xa41ca00c	! t0_kref+0x920:   	xor	%l2, 0xc, %l2
	.word	0xe42be160	! t0_kref+0x924:   	stb	%l2, [%o7 + 0x160]
	.word	0x81dbe160	! t0_kref+0x928:   	flush	%o7 + 0x160
	.word	0xf11fbf78	! t0_kref+0x92c:   	ldd	[%fp - 0x88], %f24
	.word	0xd478a018	! t0_kref+0x930:   	swap	[%g2 + 0x18], %o2
	.word	0x001fffff	! t0_kref+0x934:   	illtrap	0x1fffff
	.word	0xc768a000	! t0_kref+0x938:   	prefetch	%g2, 3
	.word	0xa3a018d2	! t0_kref+0x93c:   	fdtos	%f18, %f17
	.word	0xb7a00135	! t0_kref+0x940:   	fabss	%f21, %f27
	.word	0xa88ef375	! t0_kref+0x944:   	andcc	%i3, -0xc8b, %l4
	.word	0xb9a01a3a	! t0_kref+0x948:   	fstoi	%f26, %f28
	.word	0xb1a00554	! t0_kref+0x94c:   	fsqrtd	%f20, %f24
	.word	0x99b74240	! t0_kref+0x950:   	array16	%i5, %g0, %o4
	.word	0xd2680019	! t0_kref+0x954:   	ldstub	[%g0 + %i1], %o1
	.word	0x81af0ad4	! t0_kref+0x958:   	fcmped	%fcc0, %f28, %f20
	.word	0xfdee101a	! t0_kref+0x95c:   	prefetcha	%i0 + %i2, 30
2:	.word	0x98a02e3e	! t0_kref+0x960:   	subcc	%g0, 0xe3e, %o4
	.word	0xa5a688d8	! t0_kref+0x964:   	fsubd	%f26, %f24, %f18
	.word	0x99a0053b	! t0_kref+0x968:   	fsqrts	%f27, %f12
	.word	0xd00e7fe6	! t0_kref+0x96c:   	ldub	[%i1 - 0x1a], %o0
	.word	0x9144c000	! t0_kref+0x970:   	mov	%gsr, %o0
	.word	0xdd20a000	! t0_kref+0x974:   	st	%f14, [%g2]
	.word	0xd41e7ff8	! t0_kref+0x978:   	ldd	[%i1 - 8], %o2
	.word	0xada018d4	! t0_kref+0x97c:   	fdtos	%f20, %f22
	.word	0xd9066000	! t0_kref+0x980:   	ld	[%i1], %f12
	.word	0xd808a03a	! t0_kref+0x984:   	ldub	[%g2 + 0x3a], %o4
	.word	0x98a0000c	! t0_kref+0x988:   	subcc	%g0, %o4, %o4
	.word	0xe3b8a080	! t0_kref+0x98c:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xf6a65000	! t0_kref+0x990:   	sta	%i3, [%i1]0x80
	.word	0x26800001	! t0_kref+0x994:   	bl,a	_kref+0x998
	.word	0xb1b30e80	! t0_kref+0x998:   	fsrc1	%f12, %f24
	.word	0x9aa7001a	! t0_kref+0x99c:   	subcc	%i4, %i2, %o5
	.word	0x99b38f4a	! t0_kref+0x9a0:   	fornot1	%f14, %f10, %f12
	.word	0xe078a038	! t0_kref+0x9a4:   	swap	[%g2 + 0x38], %l0
	.word	0xda20a018	! t0_kref+0x9a8:   	st	%o5, [%g2 + 0x18]
	.word	0x992ae01a	! t0_kref+0x9ac:   	sll	%o3, 0x1a, %o4
	.word	0x81df2116	! t0_kref+0x9b0:   	flush	%i4 + 0x116
	.word	0xd6b6d018	! t0_kref+0x9b4:   	stha	%o3, [%i3 + %i0]0x80
	.word	0xada01a4c	! t0_kref+0x9b8:   	fdtoi	%f12, %f22
	.word	0xf620a000	! t0_kref+0x9bc:   	st	%i3, [%g2]
	.word	0x99a5095a	! t0_kref+0x9c0:   	fmuld	%f20, %f26, %f12
	.word	0xaa62a4e5	! t0_kref+0x9c4:   	subc	%o2, 0x4e5, %l5
	.word	0xe7ee501d	! t0_kref+0x9c8:   	prefetcha	%i1 + %i5, 19
	.word	0x92db380c	! t0_kref+0x9cc:   	smulcc	%o4, -0x7f4, %o1
	.word	0xd9064000	! t0_kref+0x9d0:   	ld	[%i1], %f12
	.word	0xd81e6010	! t0_kref+0x9d4:   	ldd	[%i1 + 0x10], %o4
	.word	0xd01e2008	! t0_kref+0x9d8:   	ldd	[%i0 + 8], %o0
	.word	0xb3a018d2	! t0_kref+0x9dc:   	fdtos	%f18, %f25
	.word	0x9620000a	! t0_kref+0x9e0:   	neg	%o2, %o3
	.word	0xaca77601	! t0_kref+0x9e4:   	subcc	%i5, -0x9ff, %l6
	.word	0x2a800002	! t0_kref+0x9e8:   	bcs,a	_kref+0x9f0
	.word	0x99a0055c	! t0_kref+0x9ec:   	fsqrtd	%f28, %f12
	.word	0xb9a68858	! t0_kref+0x9f0:   	faddd	%f26, %f24, %f28
	.word	0xd8a01018	! t0_kref+0x9f4:   	sta	%o4, [%g0 + %i0]0x80
	.word	0x9fa308ad	! t0_kref+0x9f8:   	fsubs	%f12, %f13, %f15
	.word	0xa7a00534	! t0_kref+0x9fc:   	fsqrts	%f20, %f19
	.word	0x86102003	! t0_kref+0xa00:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0xa04:   	bne,a	_kref+0xa04
	.word	0x86a0e001	! t0_kref+0xa08:   	subcc	%g3, 1, %g3
	.word	0xacf6a280	! t0_kref+0xa0c:   	udivcc	%i2, 0x280, %l6
	.word	0x9072e0fb	! t0_kref+0xa10:   	udiv	%o3, 0xfb, %o0
	.word	0x30800006	! t0_kref+0xa14:   	ba,a	_kref+0xa2c
	.word	0xad3b401c	! t0_kref+0xa18:   	sra	%o5, %i4, %l6
	.word	0xfb00a038	! t0_kref+0xa1c:   	ld	[%g2 + 0x38], %f29
	.word	0xaa66a564	! t0_kref+0xa20:   	subc	%i2, 0x564, %l5
	.word	0xd01e2000	! t0_kref+0xa24:   	ldd	[%i0], %o0
	.word	0x9fc10000	! t0_kref+0xa28:   	call	%g4
	.word	0xd9066018	! t0_kref+0xa2c:   	ld	[%i1 + 0x18], %f12
	.word	0xdd1f4018	! t0_kref+0xa30:   	ldd	[%i5 + %i0], %f14
	.word	0xada58850	! t0_kref+0xa34:   	faddd	%f22, %f16, %f22
	.word	0xa9a0191b	! t0_kref+0xa38:   	fitod	%f27, %f20
	call	SYM(t0_subr2)
	.word	0xf920a020	! t0_kref+0xa40:   	st	%f28, [%g2 + 0x20]
	.word	0xec08a022	! t0_kref+0xa44:   	ldub	[%g2 + 0x22], %l6
	.word	0x98bf401d	! t0_kref+0xa48:   	xnorcc	%i5, %i5, %o4
	.word	0x9a2eb358	! t0_kref+0xa4c:   	andn	%i2, -0xca8, %o5
	.word	0xafa018d0	! t0_kref+0xa50:   	fdtos	%f16, %f23
	.word	0xa9b2811c	! t0_kref+0xa54:   	edge32	%o2, %i4, %l4
	.word	0xf420a018	! t0_kref+0xa58:   	st	%i2, [%g2 + 0x18]
	.word	0xace6c01c	! t0_kref+0xa5c:   	subccc	%i3, %i4, %l6
	.word	0x9de3bfa0	! t0_kref+0xa60:   	save	%sp, -0x60, %sp
	.word	0x8106b7cd	! t0_kref+0xa64:   	taddcc	%i2, -0x833, %g0
	.word	0x97ee4000	! t0_kref+0xa68:   	restore	%i1, %g0, %o3
	.word	0xdd062018	! t0_kref+0xa6c:   	ld	[%i0 + 0x18], %f14
	.word	0x9fc00004	! t0_kref+0xa70:   	call	%g0 + %g4
	.word	0x99a589bb	! t0_kref+0xa74:   	fdivs	%f22, %f27, %f12
	.word	0xe40868e8	! t0_kref+0xa78:   	ldub	[%g1 + 0x8e8], %l2
	.word	0xa41ca00c	! t0_kref+0xa7c:   	xor	%l2, 0xc, %l2
	.word	0xe42868e8	! t0_kref+0xa80:   	stb	%l2, [%g1 + 0x8e8]
	.word	0x81d868e8	! t0_kref+0xa84:   	flush	%g1 + 0x8e8
	.word	0x9677401c	! t0_kref+0xa88:   	udiv	%i5, %i4, %o3
2:	.word	0x9ac2800a	! t0_kref+0xa8c:   	addccc	%o2, %o2, %o5
	.word	0xf96e401a	! t0_kref+0xa90:   	prefetch	%i1 + %i2, 28
	.word	0xe8bf5018	! t0_kref+0xa94:   	stda	%l4, [%i5 + %i0]0x80
	.word	0xa940c000	! t0_kref+0xa98:   	mov	%asi, %l4
	.word	0x9de3bfa0	! t0_kref+0xa9c:   	save	%sp, -0x60, %sp
	.word	0x95eeb10f	! t0_kref+0xaa0:   	restore	%i2, -0xef1, %o2
	.word	0xaadeaf84	! t0_kref+0xaa4:   	smulcc	%i2, 0xf84, %l5
	.word	0xdd00a000	! t0_kref+0xaa8:   	ld	[%g2], %f14
	.word	0x86102020	! t0_kref+0xaac:   	mov	0x20, %g3
	.word	0x86a0e001	! t0_kref+0xab0:   	subcc	%g3, 1, %g3
	.word	0x2280000b	! t0_kref+0xab4:   	be,a	_kref+0xae0
	.word	0xe99f5a59	! t0_kref+0xab8:   	ldda	[%i5 + %i1]0xd2, %f20
	.word	0x81ae8a56	! t0_kref+0xabc:   	fcmpd	%fcc0, %f26, %f22
	.word	0xb1a00554	! t0_kref+0xac0:   	fsqrtd	%f20, %f24
	.word	0xec08a038	! t0_kref+0xac4:   	ldub	[%g2 + 0x38], %l6
	.word	0xaa96b5b1	! t0_kref+0xac8:   	orcc	%i2, -0xa4f, %l5
	.word	0xaf44c000	! t0_kref+0xacc:   	mov	%gsr, %l7
	.word	0x9da688cc	! t0_kref+0xad0:   	fsubd	%f26, %f12, %f14
	.word	0x99b00770	! t0_kref+0xad4:   	fpack16	%f16, %f12
	.word	0xd89e1000	! t0_kref+0xad8:   	ldda	[%i0]0x80, %o4
	.word	0x9fa00139	! t0_kref+0xadc:   	fabss	%f25, %f15
	.word	0x9932800a	! t0_kref+0xae0:   	srl	%o2, %o2, %o4
	.word	0xfa36c019	! t0_kref+0xae4:   	sth	%i5, [%i3 + %i1]
	.word	0xa9b58a58	! t0_kref+0xae8:   	fpadd32	%f22, %f24, %f20
	.word	0xab32a014	! t0_kref+0xaec:   	srl	%o2, 0x14, %l5
	.word	0xae9aef77	! t0_kref+0xaf0:   	xorcc	%o3, 0xf77, %l7
	.word	0x905a801b	! t0_kref+0xaf4:   	smul	%o2, %i3, %o0
	.word	0xae7b001d	! t0_kref+0xaf8:   	sdiv	%o4, %i5, %l7
	.word	0x9b3b4009	! t0_kref+0xafc:   	sra	%o5, %o1, %o5
	.word	0x99a00038	! t0_kref+0xb00:   	fmovs	%f24, %f12
	.word	0x9da408dc	! t0_kref+0xb04:   	fsubd	%f16, %f28, %f14
	.word	0x963b4000	! t0_kref+0xb08:   	not	%o5, %o3
	.word	0xa5b007b2	! t0_kref+0xb0c:   	fpackfix	%f18, %f18
	.word	0xaba018ce	! t0_kref+0xb10:   	fdtos	%f14, %f21
	.word	0xd4363fee	! t0_kref+0xb14:   	sth	%o2, [%i0 - 0x12]
	.word	0xb1a0054e	! t0_kref+0xb18:   	fsqrtd	%f14, %f24
	.word	0xaa76800c	! t0_kref+0xb1c:   	udiv	%i2, %o4, %l5
	.word	0xb5a48952	! t0_kref+0xb20:   	fmuld	%f18, %f18, %f26
	.word	0x9ae7000c	! t0_kref+0xb24:   	subccc	%i4, %o4, %o5
	.word	0xb5b00c20	! t0_kref+0xb28:   	fzeros	%f26
	.word	0xf1060000	! t0_kref+0xb2c:   	ld	[%i0], %f24
	.word	0xd286101c	! t0_kref+0xb30:   	lda	[%i0 + %i4]0x80, %o1
	.word	0xb5a01a58	! t0_kref+0xb34:   	fdtoi	%f24, %f26
	.word	0xaebf400d	! t0_kref+0xb38:   	xnorcc	%i5, %o5, %l7
	.word	0xac582620	! t0_kref+0xb3c:   	smul	%g0, 0x620, %l6
	.word	0xaebaaa58	! t0_kref+0xb40:   	xnorcc	%o2, 0xa58, %l7
	.word	0xe3b8a080	! t0_kref+0xb44:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x97400000	! t0_kref+0xb48:   	mov	%y, %o3
	.word	0xa9b38c5a	! t0_kref+0xb4c:   	fnor	%f14, %f26, %f20
	call	1f
	.empty
	.word	0xbba01a2e	! t0_kref+0xb54:   	fstoi	%f14, %f29
	.word	0xaba708b2	! t0_kref+0xb58:   	fsubs	%f28, %f18, %f21
	.word	0x97326000	! t0_kref+0xb5c:   	srl	%o1, 0x0, %o3
1:	.word	0xdb861000	! t0_kref+0xb60:   	lda	[%i0]0x80, %f13
	.word	0xea564000	! t0_kref+0xb64:   	ldsh	[%i1], %l5
	.word	0xae93001c	! t0_kref+0xb68:   	orcc	%o4, %i4, %l7
	.word	0x8143e040	! t0_kref+0xb6c:   	membar	0x40
	.word	0xa9b3010b	! t0_kref+0xb70:   	edge32	%o4, %o3, %l4
	.word	0xd05e7ff0	! t0_kref+0xb74:   	ldx	[%i1 - 0x10], %o0
	.word	0x9682e565	! t0_kref+0xb78:   	addcc	%o3, 0x565, %o3
	.word	0x92a3000b	! t0_kref+0xb7c:   	subcc	%o4, %o3, %o1
	.word	0x9270001a	! t0_kref+0xb80:   	udiv	%g0, %i2, %o1
	.word	0xafb00040	! t0_kref+0xb84:   	edge8l	%g0, %g0, %l7
	.word	0x9a0efb73	! t0_kref+0xb88:   	and	%i3, -0x48d, %o5
	.word	0x9ba709ba	! t0_kref+0xb8c:   	fdivs	%f28, %f26, %f13
	.word	0xda00a038	! t0_kref+0xb90:   	ld	[%g2 + 0x38], %o5
	.word	0xa9b704cc	! t0_kref+0xb94:   	fcmpne32	%f28, %f12, %l4
	.word	0xf430a020	! t0_kref+0xb98:   	sth	%i2, [%g2 + 0x20]
	.word	0x97b30000	! t0_kref+0xb9c:   	edge8	%o4, %g0, %o3
	.word	0xc76e2018	! t0_kref+0xba0:   	prefetch	%i0 + 0x18, 3
	.word	0x953f6012	! t0_kref+0xba4:   	sra	%i5, 0x12, %o2
	.word	0x95b6810c	! t0_kref+0xba8:   	edge32	%i2, %o4, %o2
	.word	0x9de3bfa0	! t0_kref+0xbac:   	save	%sp, -0x60, %sp
	.word	0x99ee801a	! t0_kref+0xbb0:   	restore	%i2, %i2, %o4
	.word	0xb9a58854	! t0_kref+0xbb4:   	faddd	%f22, %f20, %f28
	.word	0x991abb94	! t0_kref+0xbb8:   	tsubcctv	%o2, -0x46c, %o4
	.word	0x9bb3411a	! t0_kref+0xbbc:   	edge32	%o5, %i2, %o5
	.word	0xada00552	! t0_kref+0xbc0:   	fsqrtd	%f18, %f22
	.word	0xaa203f4b	! t0_kref+0xbc4:   	sub	%g0, -0xb5, %l5
	.word	0xda20a038	! t0_kref+0xbc8:   	st	%o5, [%g2 + 0x38]
	.word	0x99b50498	! t0_kref+0xbcc:   	fcmple32	%f20, %f24, %o4
	.word	0x99a0004c	! t0_kref+0xbd0:   	fmovd	%f12, %f12
	.word	0x97b48d3b	! t0_kref+0xbd4:   	fandnot1s	%f18, %f27, %f11
	.word	0x99b4099c	! t0_kref+0xbd8:   	bshuffle	%f16, %f28, %f12
	.word	0xd91fbc70	! t0_kref+0xbdc:   	ldd	[%fp - 0x390], %f12
	.word	0xc56e2000	! t0_kref+0xbe0:   	prefetch	%i0, 2
	.word	0x113cb14e	! t0_kref+0xbe4:   	sethi	%hi(0xf2c53800), %o0
	.word	0xa9400000	! t0_kref+0xbe8:   	mov	%y, %l4
	.word	0xa5a018d4	! t0_kref+0xbec:   	fdtos	%f20, %f18
	.word	0xb1a00554	! t0_kref+0xbf0:   	fsqrtd	%f20, %f24
	.word	0xf91fbcd8	! t0_kref+0xbf4:   	ldd	[%fp - 0x328], %f28
	.word	0xd0063fe8	! t0_kref+0xbf8:   	ld	[%i0 - 0x18], %o0
	.word	0x32800004	! t0_kref+0xbfc:   	bne,a	_kref+0xc0c
	.word	0x91b30029	! t0_kref+0xc00:   	edge8n	%o4, %o1, %o0
	.word	0xb9b30e80	! t0_kref+0xc04:   	fsrc1	%f12, %f28
	.word	0x9852c01c	! t0_kref+0xc08:   	umul	%o3, %i4, %o4
	.word	0xe840a010	! t0_kref+0xc0c:   	ldsw	[%g2 + 0x10], %l4
	.word	0x9212c00b	! t0_kref+0xc10:   	or	%o3, %o3, %o1
	.word	0xf8267fe4	! t0_kref+0xc14:   	st	%i4, [%i1 - 0x1c]
	.word	0x9fc10000	! t0_kref+0xc18:   	call	%g4
	.word	0xaa5ec009	! t0_kref+0xc1c:   	smul	%i3, %o1, %l5
	.word	0x905f001c	! t0_kref+0xc20:   	smul	%i4, %i4, %o0
	.word	0x9aba400d	! t0_kref+0xc24:   	xnorcc	%o1, %o5, %o5
	.word	0x2a480002	! t0_kref+0xc28:   	bcs,a,pt	%icc, _kref+0xc30
	.word	0x948777d5	! t0_kref+0xc2c:   	addcc	%i5, -0x82b, %o2
	.word	0x943f7bec	! t0_kref+0xc30:   	xnor	%i5, -0x414, %o2
	.word	0xa9a0055a	! t0_kref+0xc34:   	fsqrtd	%f26, %f20
	.word	0xa5a00154	! t0_kref+0xc38:   	fabsd	%f20, %f18
	.word	0x81de4009	! t0_kref+0xc3c:   	flush	%i1 + %o1
	.word	0xb1b00c00	! t0_kref+0xc40:   	fzero	%f24
	.word	0xa5a489ab	! t0_kref+0xc44:   	fdivs	%f18, %f11, %f18
	.word	0xe920a020	! t0_kref+0xc48:   	st	%f20, [%g2 + 0x20]
	.word	0x81dfc011	! t0_kref+0xc4c:   	flush	%i7 + %l1
	.word	0xb3a018d0	! t0_kref+0xc50:   	fdtos	%f16, %f25
	.word	0xe7063ff4	! t0_kref+0xc54:   	ld	[%i0 - 0xc], %f19
	.word	0xd22e001a	! t0_kref+0xc58:   	stb	%o1, [%i0 + %i2]
	.word	0xaa32ff0e	! t0_kref+0xc5c:   	orn	%o3, -0xf2, %l5
	.word	0xee6e3ff0	! t0_kref+0xc60:   	ldstub	[%i0 - 0x10], %l7
	.word	0xac272c4f	! t0_kref+0xc64:   	sub	%i4, 0xc4f, %l6
	.word	0xef060000	! t0_kref+0xc68:   	ld	[%i0], %f23
	.word	0xe76e401d	! t0_kref+0xc6c:   	prefetch	%i1 + %i5, 19
	.word	0xb3a01a52	! t0_kref+0xc70:   	fdtoi	%f18, %f25
	.word	0xe8100018	! t0_kref+0xc74:   	lduh	[%g0 + %i0], %l4
	.word	0x9bb2806a	! t0_kref+0xc78:   	edge8ln	%o2, %o2, %o5
	.word	0xee0e8018	! t0_kref+0xc7c:   	ldub	[%i2 + %i0], %l7
	.word	0x96a3000b	! t0_kref+0xc80:   	subcc	%o4, %o3, %o3
	.word	0x98030000	! t0_kref+0xc84:   	add	%o4, %g0, %o4
	.word	0xb1b00f10	! t0_kref+0xc88:   	fsrc2	%f16, %f24
	.word	0x980f2353	! t0_kref+0xc8c:   	and	%i4, 0x353, %o4
	.word	0xc168a048	! t0_kref+0xc90:   	prefetch	%g2 + 0x48, 0
	.word	0xadb30329	! t0_kref+0xc94:   	bmask	%o4, %o1, %l6
	.word	0xe611401b	! t0_kref+0xc98:   	lduh	[%g5 + %i3], %l3
	.word	0xf9871018	! t0_kref+0xc9c:   	lda	[%i4 + %i0]0x80, %f28
	.word	0xc020a018	! t0_kref+0xca0:   	clr	[%g2 + 0x18]
	.word	0x31480007	! t0_kref+0xca4:   	fba,a,pt	%fcc0, _kref+0xcc0
	.word	0xafb680db	! t0_kref+0xca8:   	edge16l	%i2, %i3, %l7
	.word	0x8182c000	! t0_kref+0xcac:   	wr	%o3, %g0, %y
	.word	0x98aa6476	! t0_kref+0xcb0:   	andncc	%o1, 0x476, %o4
	.word	0x949822a2	! t0_kref+0xcb4:   	xorcc	%g0, 0x2a2, %o2
	.word	0x9340c000	! t0_kref+0xcb8:   	mov	%asi, %o1
	.word	0xd4263fe0	! t0_kref+0xcbc:   	st	%o2, [%i0 - 0x20]
	.word	0xdd1fbc10	! t0_kref+0xcc0:   	ldd	[%fp - 0x3f0], %f14
	.word	0xa7b007aa	! t0_kref+0xcc4:   	fpackfix	%f10, %f19
	.word	0x94f725ec	! t0_kref+0xcc8:   	udivcc	%i4, 0x5ec, %o2
	call	SYM(t0_subr1)
	.word	0xe8be101d	! t0_kref+0xcd0:   	stda	%l4, [%i0 + %i5]0x80
	.word	0x9db68ed8	! t0_kref+0xcd4:   	fornot2	%f26, %f24, %f14
	.word	0xa1a60856	! t0_kref+0xcd8:   	faddd	%f24, %f22, %f16
	.word	0x90bf213d	! t0_kref+0xcdc:   	xnorcc	%i4, 0x13d, %o0
	.word	0xea4e7ff0	! t0_kref+0xce0:   	ldsb	[%i1 - 0x10], %l5
	.word	0x87802080	! t0_kref+0xce4:   	mov	0x80, %asi
	.word	0x985b78a1	! t0_kref+0xce8:   	smul	%o5, -0x75f, %o4
	.word	0xfdee501a	! t0_kref+0xcec:   	prefetcha	%i1 + %i2, 30
	.word	0xc16e001a	! t0_kref+0xcf0:   	prefetch	%i0 + %i2, 0
	.word	0xac8e8009	! t0_kref+0xcf4:   	andcc	%i2, %o1, %l6
	.word	0xfb80a038	! t0_kref+0xcf8:   	lda	[%g2 + 0x38]%asi, %f29
	.word	0xafb0015a	! t0_kref+0xcfc:   	edge32l	%g0, %i2, %l7
	.word	0x906325ab	! t0_kref+0xd00:   	subc	%o4, 0x5ab, %o0
	.word	0xa7a00530	! t0_kref+0xd04:   	fsqrts	%f16, %f19
	.word	0x91b2c17a	! t0_kref+0xd08:   	edge32ln	%o3, %i2, %o0
	.word	0x81ab0a58	! t0_kref+0xd0c:   	fcmpd	%fcc0, %f12, %f24
	.word	0xd7062000	! t0_kref+0xd10:   	ld	[%i0], %f11
	.word	0xa83b3638	! t0_kref+0xd14:   	xnor	%o4, -0x9c8, %l4
	.word	0xee50a000	! t0_kref+0xd18:   	ldsh	[%g2], %l7
	.word	0x909a6ee0	! t0_kref+0xd1c:   	xorcc	%o1, 0xee0, %o0
	.word	0xac97717b	! t0_kref+0xd20:   	orcc	%i5, -0xe85, %l6
	.word	0xeb801018	! t0_kref+0xd24:   	lda	[%g0 + %i0]0x80, %f21
	.word	0x99400000	! t0_kref+0xd28:   	mov	%y, %o4
	.word	0x92dee474	! t0_kref+0xd2c:   	smulcc	%i3, 0x474, %o1
	.word	0xac53400a	! t0_kref+0xd30:   	umul	%o5, %o2, %l6
	.word	0xaa634009	! t0_kref+0xd34:   	subc	%o5, %o1, %l5
	.word	0xa9408000	! t0_kref+0xd38:   	mov	%ccr, %l4
	.word	0xafb58ab1	! t0_kref+0xd3c:   	fpsub16s	%f22, %f17, %f23
	.word	0x95b2816b	! t0_kref+0xd40:   	edge32ln	%o2, %o3, %o2
	.word	0xd0380018	! t0_kref+0xd44:   	std	%o0, [%g0 + %i0]
	.word	0x929a6d4d	! t0_kref+0xd48:   	xorcc	%o1, 0xd4d, %o1
	.word	0x9ba000b9	! t0_kref+0xd4c:   	fnegs	%f25, %f13
	.word	0xf19e5a5b	! t0_kref+0xd50:   	ldda	[%i1 + %i3]0xd2, %f24
	.word	0xfb80a038	! t0_kref+0xd54:   	lda	[%g2 + 0x38]%asi, %f29
	.word	0xc12e401c	! t0_kref+0xd58:   	st	%fsr, [%i1 + %i4]
	.word	0xdd863fe4	! t0_kref+0xd5c:   	lda	[%i0 - 0x1c]%asi, %f14
	.word	0xafa00536	! t0_kref+0xd60:   	fsqrts	%f22, %f23
	.word	0xd006001c	! t0_kref+0xd64:   	ld	[%i0 + %i4], %o0
	.word	0x9223400d	! t0_kref+0xd68:   	sub	%o5, %o5, %o1
	.word	0xd0163ff4	! t0_kref+0xd6c:   	lduh	[%i0 - 0xc], %o0
	.word	0xaa3a401b	! t0_kref+0xd70:   	xnor	%o1, %i3, %l5
	.word	0x9878000c	! t0_kref+0xd74:   	sdiv	%g0, %o4, %o4
	.word	0xd41f4019	! t0_kref+0xd78:   	ldd	[%i5 + %i1], %o2
	.word	0xa5a00558	! t0_kref+0xd7c:   	fsqrtd	%f24, %f18
	.word	0xb5b40d60	! t0_kref+0xd80:   	fnot1s	%f16, %f26
	.word	0x81aa8a4a	! t0_kref+0xd84:   	fcmpd	%fcc0, %f10, %f10
	.word	0x94f2c009	! t0_kref+0xd88:   	udivcc	%o3, %o1, %o2
	.word	0xb9a018d6	! t0_kref+0xd8c:   	fdtos	%f22, %f28
	.word	0x97b3cefc	! t0_kref+0xd90:   	fornot2s	%f15, %f28, %f11
	.word	0xfbee101a	! t0_kref+0xd94:   	prefetcha	%i0 + %i2, 29
	.word	0xd8c0a000	! t0_kref+0xd98:   	ldswa	[%g2]%asi, %o4
	.word	0xf6b0a028	! t0_kref+0xd9c:   	stha	%i3, [%g2 + 0x28]%asi
	.word	0xa85f400c	! t0_kref+0xda0:   	smul	%i5, %o4, %l4
	.word	0x96bf3f13	! t0_kref+0xda4:   	xnorcc	%i4, -0xed, %o3
	.word	0xda160000	! t0_kref+0xda8:   	lduh	[%i0], %o5
	.word	0xb5b70a54	! t0_kref+0xdac:   	fpadd32	%f28, %f20, %f26
	.word	0x949a7d44	! t0_kref+0xdb0:   	xorcc	%o1, -0x2bc, %o2
	.word	0x9aa0326b	! t0_kref+0xdb4:   	subcc	%g0, -0xd95, %o5
	.word	0xef067ff4	! t0_kref+0xdb8:   	ld	[%i1 - 0xc], %f23
	.word	0xae36fc08	! t0_kref+0xdbc:   	orn	%i3, -0x3f8, %l7
	.word	0x97b2814a	! t0_kref+0xdc0:   	edge32l	%o2, %o2, %o3
	.word	0x99a3084a	! t0_kref+0xdc4:   	faddd	%f12, %f10, %f12
	.word	0xdace9019	! t0_kref+0xdc8:   	ldsba	[%i2 + %i1]0x80, %o5
	.word	0xb7a018d2	! t0_kref+0xdcc:   	fdtos	%f18, %f27
	.word	0x8143e043	! t0_kref+0xdd0:   	membar	0x43
	.word	0x905034dc	! t0_kref+0xdd4:   	umul	%g0, -0xb24, %o0
	.word	0xd51f4018	! t0_kref+0xdd8:   	ldd	[%i5 + %i0], %f10
	.word	0xd4186428	! t0_kref+0xddc:   	ldd	[%g1 + 0x428], %o2
	.word	0x96aa401c	! t0_kref+0xde0:   	andncc	%o1, %i4, %o3
	.word	0xd8c0a030	! t0_kref+0xde4:   	ldswa	[%g2 + 0x30]%asi, %o4
	.word	0x99b2ce72	! t0_kref+0xde8:   	fxnors	%f11, %f18, %f12
	.word	0xaa9aaa37	! t0_kref+0xdec:   	xorcc	%o2, 0xa37, %l5
	.word	0xb5a5c831	! t0_kref+0xdf0:   	fadds	%f23, %f17, %f26
	.word	0xab400000	! t0_kref+0xdf4:   	mov	%y, %l5
	.word	0xd4d0a00a	! t0_kref+0xdf8:   	ldsha	[%g2 + 0xa]%asi, %o2
	.word	0xe850a018	! t0_kref+0xdfc:   	ldsh	[%g2 + 0x18], %l4
	.word	0xec1e7fe8	! t0_kref+0xe00:   	ldd	[%i1 - 0x18], %l6
	.word	0x2b480003	! t0_kref+0xe04:   	fbug,a,pt	%fcc0, _kref+0xe10
	.word	0xe5ee501b	! t0_kref+0xe08:   	prefetcha	%i1 + %i3, 18
	.word	0xaeda79de	! t0_kref+0xe0c:   	smulcc	%o1, -0x622, %l7
	.word	0xabb70418	! t0_kref+0xe10:   	fcmple16	%f28, %f24, %l5
	.word	0xa89aae43	! t0_kref+0xe14:   	xorcc	%o2, 0xe43, %l4
	.word	0x81ae0a30	! t0_kref+0xe18:   	fcmps	%fcc0, %f24, %f16
	.word	0xa5a58d2e	! t0_kref+0xe1c:   	fsmuld	%f22, %f14, %f18
	.word	0x9fc10000	! t0_kref+0xe20:   	call	%g4
	.word	0xa1a30837	! t0_kref+0xe24:   	fadds	%f12, %f23, %f16
	.word	0x86102002	! t0_kref+0xe28:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0xe2c:   	bne,a	_kref+0xe2c
	.word	0x86a0e001	! t0_kref+0xe30:   	subcc	%g3, 1, %g3
	.word	0xf980a028	! t0_kref+0xe34:   	lda	[%g2 + 0x28]%asi, %f28
	.word	0xaba00138	! t0_kref+0xe38:   	fabss	%f24, %f21
	.word	0xb9a0055c	! t0_kref+0xe3c:   	fsqrtd	%f28, %f28
	.word	0xada0193d	! t0_kref+0xe40:   	fstod	%f29, %f22
	.word	0x9bb6841a	! t0_kref+0xe44:   	fcmple16	%f26, %f26, %o5
	.word	0xd648a003	! t0_kref+0xe48:   	ldsb	[%g2 + 3], %o3
	.word	0xe800a010	! t0_kref+0xe4c:   	ld	[%g2 + 0x10], %l4
	.word	0xd836401b	! t0_kref+0xe50:   	sth	%o4, [%i1 + %i3]
	.word	0xc028a03b	! t0_kref+0xe54:   	clrb	[%g2 + 0x3b]
	.word	0x90dec00a	! t0_kref+0xe58:   	smulcc	%i3, %o2, %o0
	.word	0xb1a01934	! t0_kref+0xe5c:   	fstod	%f20, %f24
	.word	0xc1e8a085	! t0_kref+0xe60:   	prefetcha	%g2 + 0x85, 0
	.word	0x94c2f2a5	! t0_kref+0xe64:   	addccc	%o3, -0xd5b, %o2
	.word	0x920afb1f	! t0_kref+0xe68:   	and	%o3, -0x4e1, %o1
	.word	0xb7a7482c	! t0_kref+0xe6c:   	fadds	%f29, %f12, %f27
	.word	0x945afb08	! t0_kref+0xe70:   	smul	%o3, -0x4f8, %o2
	.word	0x9db38e4c	! t0_kref+0xe74:   	fxnor	%f14, %f12, %f14
	.word	0xabb40e6e	! t0_kref+0xe78:   	fxnors	%f16, %f14, %f21
	.word	0xda4e001a	! t0_kref+0xe7c:   	ldsb	[%i0 + %i2], %o5
	.word	0x37480001	! t0_kref+0xe80:   	fbge,a,pt	%fcc0, _kref+0xe84
	.word	0xc16e3ff8	! t0_kref+0xe84:   	prefetch	%i0 - 8, 0
	.word	0xaa26801c	! t0_kref+0xe88:   	sub	%i2, %i4, %l5
	.word	0x985f2db1	! t0_kref+0xe8c:   	smul	%i4, 0xdb1, %o4
	.word	0x81834000	! t0_kref+0xe90:   	wr	%o5, %g0, %y
	.word	0x9af2a90e	! t0_kref+0xe94:   	udivcc	%o2, 0x90e, %o5
	.word	0xa3a5c933	! t0_kref+0xe98:   	fmuls	%f23, %f19, %f17
	.word	0xeb066018	! t0_kref+0xe9c:   	ld	[%i1 + 0x18], %f21
	.word	0x9267001b	! t0_kref+0xea0:   	subc	%i4, %i3, %o1
	.word	0xafb24240	! t0_kref+0xea4:   	array16	%o1, %g0, %l7
	.word	0xd888a019	! t0_kref+0xea8:   	lduba	[%g2 + 0x19]%asi, %o4
	.word	0xef20a030	! t0_kref+0xeac:   	st	%f23, [%g2 + 0x30]
	.word	0xa1a01916	! t0_kref+0xeb0:   	fitod	%f22, %f16
	.word	0xa5a6095a	! t0_kref+0xeb4:   	fmuld	%f24, %f26, %f18
	.word	0x9de3bfa0	! t0_kref+0xeb8:   	save	%sp, -0x60, %sp
	.word	0x99eef67e	! t0_kref+0xebc:   	restore	%i3, -0x982, %o4
	.word	0x2d480005	! t0_kref+0xec0:   	fbg,a,pt	%fcc0, _kref+0xed4
	.word	0x97a48932	! t0_kref+0xec4:   	fmuls	%f18, %f18, %f11
	.word	0xaaae800b	! t0_kref+0xec8:   	andncc	%i2, %o3, %l5
	.word	0xa5a018d2	! t0_kref+0xecc:   	fdtos	%f18, %f18
	.word	0xd6de7fe0	! t0_kref+0xed0:   	ldxa	[%i1 - 0x20]%asi, %o3
	.word	0x94f0000a	! t0_kref+0xed4:   	udivcc	%g0, %o2, %o2
	.word	0xf436001b	! t0_kref+0xed8:   	sth	%i2, [%i0 + %i3]
	.word	0x91b28069	! t0_kref+0xedc:   	edge8ln	%o2, %o1, %o0
	.word	0xada01917	! t0_kref+0xee0:   	fitod	%f23, %f22
	.word	0xafb68240	! t0_kref+0xee4:   	array16	%i2, %g0, %l7
	.word	0xa8a6bad9	! t0_kref+0xee8:   	subcc	%i2, -0x527, %l4
	.word	0xb1b40a50	! t0_kref+0xeec:   	fpadd32	%f16, %f16, %f24
	.word	0xb5b7075a	! t0_kref+0xef0:   	fpack32	%f28, %f26, %f26
	.word	0x85837977	! t0_kref+0xef4:   	wr	%o5, 0xfffff977, %ccr
	.word	0x9fc10000	! t0_kref+0xef8:   	call	%g4
	.word	0xf91e6010	! t0_kref+0xefc:   	ldd	[%i1 + 0x10], %f28
	.word	0xabb240dd	! t0_kref+0xf00:   	edge16l	%o1, %i5, %l5
	.word	0xaad3400d	! t0_kref+0xf04:   	umulcc	%o5, %o5, %l5
	.word	0xb1a488d8	! t0_kref+0xf08:   	fsubd	%f18, %f24, %f24
	.word	0xb1b30ad0	! t0_kref+0xf0c:   	fpsub32	%f12, %f16, %f24
	.word	0xb9a00550	! t0_kref+0xf10:   	fsqrtd	%f16, %f28
	.word	0xaa56e705	! t0_kref+0xf14:   	umul	%i3, 0x705, %l5
	.word	0xb4102013	! t0_kref+0xf18:   	mov	0x13, %i2
	.word	0x973f0000	! t0_kref+0xf1c:   	sra	%i4, %g0, %o3
	.word	0xa1a0054c	! t0_kref+0xf20:   	fsqrtd	%f12, %f16
	.word	0xa8632185	! t0_kref+0xf24:   	subc	%o4, 0x185, %l4
	.word	0xd0680018	! t0_kref+0xf28:   	ldstub	[%g0 + %i0], %o0
	.word	0xa3a0012c	! t0_kref+0xf2c:   	fabss	%f12, %f17
	.word	0xadb24140	! t0_kref+0xf30:   	edge32l	%o1, %g0, %l6
	.word	0x98d828dd	! t0_kref+0xf34:   	smulcc	%g0, 0x8dd, %o4
	.word	0x81ab8aae	! t0_kref+0xf38:   	fcmpes	%fcc0, %f14, %f14
	.word	0xab66400c	! t0_kref+0xf3c:   	movne	%icc, %o4, %l5
	.word	0x905f345c	! t0_kref+0xf40:   	smul	%i4, -0xba4, %o0
	.word	0xaebf000a	! t0_kref+0xf44:   	xnorcc	%i4, %o2, %l7
	.word	0xd490a002	! t0_kref+0xf48:   	lduha	[%g2 + 2]%asi, %o2
	.word	0xb5a2885a	! t0_kref+0xf4c:   	faddd	%f10, %f26, %f26
	.word	0xadb00772	! t0_kref+0xf50:   	fpack16	%f18, %f22
	.word	0xa1a0190b	! t0_kref+0xf54:   	fitod	%f11, %f16
	.word	0xa3b68e75	! t0_kref+0xf58:   	fxnors	%f26, %f21, %f17
	.word	0xd830a018	! t0_kref+0xf5c:   	sth	%o4, [%g2 + 0x18]
	.word	0x8143c000	! t0_kref+0xf60:   	stbar
	.word	0x9456c00b	! t0_kref+0xf64:   	umul	%i3, %o3, %o2
	.word	0xaeb8000a	! t0_kref+0xf68:   	xnorcc	%g0, %o2, %l7
	.word	0xe83e2000	! t0_kref+0xf6c:   	std	%l4, [%i0]
	.word	0xd636c018	! t0_kref+0xf70:   	sth	%o3, [%i3 + %i0]
	.word	0xafb00ceb	! t0_kref+0xf74:   	fnot2s	%f11, %f23
	.word	0xa87f25f4	! t0_kref+0xf78:   	sdiv	%i4, 0x5f4, %l4
	.word	0x8143c000	! t0_kref+0xf7c:   	stbar
	.word	0xab2f200d	! t0_kref+0xf80:   	sll	%i4, 0xd, %l5
	.word	0x8143c000	! t0_kref+0xf84:   	stbar
	.word	0xb8103fe8	! t0_kref+0xf88:   	mov	0xffffffe8, %i4
	.word	0xae972369	! t0_kref+0xf8c:   	orcc	%i4, 0x369, %l7
	.word	0xc0280019	! t0_kref+0xf90:   	clrb	[%g0 + %i1]
	.word	0x9bb28200	! t0_kref+0xf94:   	array8	%o2, %g0, %o5
	.word	0xb5a00556	! t0_kref+0xf98:   	fsqrtd	%f22, %f26
	.word	0xb9b586f0	! t0_kref+0xf9c:   	fmul8ulx16	%f22, %f16, %f28
	.word	0xa8024000	! t0_kref+0xfa0:   	add	%o1, %g0, %l4
	.word	0x81dd76b7	! t0_kref+0xfa4:   	flush	%l5 - 0x949
	.word	0xf3063fe4	! t0_kref+0xfa8:   	ld	[%i0 - 0x1c], %f25
	.word	0x81da8012	! t0_kref+0xfac:   	flush	%o2 + %l2
	.word	0xa5b386ee	! t0_kref+0xfb0:   	fmul8ulx16	%f14, %f14, %f18
	.word	0x98a2400d	! t0_kref+0xfb4:   	subcc	%o1, %o5, %o4
	.word	0xc7e8a080	! t0_kref+0xfb8:   	prefetcha	%g2 + 0x80, 3
	.word	0xb1a3885a	! t0_kref+0xfbc:   	faddd	%f14, %f26, %f24
	.word	0xb1a7094e	! t0_kref+0xfc0:   	fmuld	%f28, %f14, %f24
	.word	0x925ec01a	! t0_kref+0xfc4:   	smul	%i3, %i2, %o1
	.word	0x9bb5844a	! t0_kref+0xfc8:   	fcmpne16	%f22, %f10, %o5
	.word	0xb9b58630	! t0_kref+0xfcc:   	fmul8x16	%f22, %f16, %f28
	.word	0x97a000b7	! t0_kref+0xfd0:   	fnegs	%f23, %f11
	.word	0x99a3885c	! t0_kref+0xfd4:   	faddd	%f14, %f28, %f12
	.word	0xaa624000	! t0_kref+0xfd8:   	subc	%o1, %g0, %l5
	.word	0x86102018	! t0_kref+0xfdc:   	mov	0x18, %g3
	.word	0x86a0e001	! t0_kref+0xfe0:   	subcc	%g3, 1, %g3
	.word	0x22800015	! t0_kref+0xfe4:   	be,a	_kref+0x1038
	.word	0x91400000	! t0_kref+0xfe8:   	mov	%y, %o0
	.word	0x98bf4000	! t0_kref+0xfec:   	xnorcc	%i5, %g0, %o4
	.word	0xc9ee500b	! t0_kref+0xff0:   	prefetcha	%i1 + %o3, 4
	.word	0x3e800006	! t0_kref+0xff4:   	bvc,a	_kref+0x100c
	.word	0x90c2801a	! t0_kref+0xff8:   	addccc	%o2, %i2, %o0
	.word	0xd2a71018	! t0_kref+0xffc:   	sta	%o1, [%i4 + %i0]0x80
	.word	0xf830a030	! t0_kref+0x1000:   	sth	%i4, [%g2 + 0x30]
	.word	0x9da01910	! t0_kref+0x1004:   	fitod	%f16, %f14
	.word	0x99a018ce	! t0_kref+0x1008:   	fdtos	%f14, %f12
	.word	0xac9a801d	! t0_kref+0x100c:   	xorcc	%o2, %i5, %l6
	.word	0x933b6006	! t0_kref+0x1010:   	sra	%o5, 0x6, %o1
	.word	0xb9b38e80	! t0_kref+0x1014:   	fsrc1	%f14, %f28
	.word	0x24800004	! t0_kref+0x1018:   	ble,a	_kref+0x1028
	.word	0x94f32f94	! t0_kref+0x101c:   	udivcc	%o4, 0xf94, %o2
	.word	0x92f02bbf	! t0_kref+0x1020:   	udivcc	%g0, 0xbbf, %o1
	.word	0xd46e001a	! t0_kref+0x1024:   	ldstub	[%i0 + %i2], %o2
	.word	0xa9b4867c	! t0_kref+0x1028:   	fmul8x16au	%f18, %f28, %f20
	.word	0xe880a018	! t0_kref+0x102c:   	lda	[%g2 + 0x18]%asi, %l4
	.word	0xd6366006	! t0_kref+0x1030:   	sth	%o3, [%i1 + 6]
	.word	0xada000bb	! t0_kref+0x1034:   	fnegs	%f27, %f22
	.word	0xb1b64df9	! t0_kref+0x1038:   	fnands	%f25, %f25, %f24
	.word	0xad44c000	! t0_kref+0x103c:   	mov	%gsr, %l6
	.word	0xd0180019	! t0_kref+0x1040:   	ldd	[%g0 + %i1], %o0
	.word	0x907ac01a	! t0_kref+0x1044:   	sdiv	%o3, %i2, %o0
	.word	0xf19eda19	! t0_kref+0x1048:   	ldda	[%i3 + %i1]0xd0, %f24
	.word	0xee16c018	! t0_kref+0x104c:   	lduh	[%i3 + %i0], %l7
	.word	0xec5e001d	! t0_kref+0x1050:   	ldx	[%i0 + %i5], %l6
	.word	0x923b4009	! t0_kref+0x1054:   	xnor	%o5, %o1, %o1
	.word	0xa1a408d2	! t0_kref+0x1058:   	fsubd	%f16, %f18, %f16
	.word	0xf636200e	! t0_kref+0x105c:   	sth	%i3, [%i0 + 0xe]
	.word	0x923f001c	! t0_kref+0x1060:   	xnor	%i4, %i4, %o1
	.word	0x9bb5caf3	! t0_kref+0x1064:   	fpsub32s	%f23, %f19, %f13
	.word	0x95a6895a	! t0_kref+0x1068:   	fmuld	%f26, %f26, %f10
	.word	0xada00552	! t0_kref+0x106c:   	fsqrtd	%f18, %f22
	.word	0xb9a00534	! t0_kref+0x1070:   	fsqrts	%f20, %f28
	.word	0x99b4cd2b	! t0_kref+0x1074:   	fandnot1s	%f19, %f11, %f12
	.word	0x9ac7001b	! t0_kref+0x1078:   	addccc	%i4, %i3, %o5
	.word	0xdf20a000	! t0_kref+0x107c:   	st	%f15, [%g2]
	.word	0xb1a6c8ab	! t0_kref+0x1080:   	fsubs	%f27, %f11, %f24
	.word	0xf6360000	! t0_kref+0x1084:   	sth	%i3, [%i0]
	.word	0x920f0009	! t0_kref+0x1088:   	and	%i4, %o1, %o1
	.word	0xa85f7bb6	! t0_kref+0x108c:   	smul	%i5, -0x44a, %l4
	.word	0xf8a0a030	! t0_kref+0x1090:   	sta	%i4, [%g2 + 0x30]%asi
	.word	0xacc7401b	! t0_kref+0x1094:   	addccc	%i5, %i3, %l6
	.word	0x923afba0	! t0_kref+0x1098:   	xnor	%o3, -0x460, %o1
	.word	0xd6367ff8	! t0_kref+0x109c:   	sth	%o3, [%i1 - 8]
	.word	0x31480005	! t0_kref+0x10a0:   	fba,a,pt	%fcc0, _kref+0x10b4
	.word	0x96870009	! t0_kref+0x10a4:   	addcc	%i4, %o1, %o3
	.word	0xf3060000	! t0_kref+0x10a8:   	ld	[%i0], %f25
	.word	0xa9a0191d	! t0_kref+0x10ac:   	fitod	%f29, %f20
	.word	0x99b48e73	! t0_kref+0x10b0:   	fxnors	%f18, %f19, %f12
	.word	0x90d3001c	! t0_kref+0x10b4:   	umulcc	%o4, %i4, %o0
	.word	0x152dbdca	! t0_kref+0x10b8:   	sethi	%hi(0xb6f72800), %o2
	.word	0xd89e501d	! t0_kref+0x10bc:   	ldda	[%i1 + %i5]0x80, %o4
	.word	0xd51fbe30	! t0_kref+0x10c0:   	ldd	[%fp - 0x1d0], %f10
	.word	0xa8d6f1e5	! t0_kref+0x10c4:   	umulcc	%i3, -0xe1b, %l4
	.word	0xe3a0a008	! t0_kref+0x10c8:   	sta	%f17, [%g2 + 8]%asi
	.word	0x9da608ce	! t0_kref+0x10cc:   	fsubd	%f24, %f14, %f14
	.word	0xada0192c	! t0_kref+0x10d0:   	fstod	%f12, %f22
	.word	0x95b7014a	! t0_kref+0x10d4:   	edge32l	%i4, %o2, %o2
	.word	0x9bb6802d	! t0_kref+0x10d8:   	edge8n	%i2, %o5, %o5
	.word	0x99b58e80	! t0_kref+0x10dc:   	fsrc1	%f22, %f12
	.word	0xa9a6885a	! t0_kref+0x10e0:   	faddd	%f26, %f26, %f20
	.word	0x81ad8a4e	! t0_kref+0x10e4:   	fcmpd	%fcc0, %f22, %f14
	.word	0x86102020	! t0_kref+0x10e8:   	mov	0x20, %g3
	.word	0x86a0e001	! t0_kref+0x10ec:   	subcc	%g3, 1, %g3
	.word	0x22800012	! t0_kref+0x10f0:   	be,a	_kref+0x1138
	.word	0xec000018	! t0_kref+0x10f4:   	ld	[%g0 + %i0], %l6
	.word	0xea16001b	! t0_kref+0x10f8:   	lduh	[%i0 + %i3], %l5
	.word	0x907b394b	! t0_kref+0x10fc:   	sdiv	%o4, -0x6b5, %o0
	.word	0x9602e758	! t0_kref+0x1100:   	add	%o3, 0x758, %o3
	.word	0xd89e7ff8	! t0_kref+0x1104:   	ldda	[%i1 - 8]%asi, %o4
	.word	0x9808001d	! t0_kref+0x1108:   	and	%g0, %i5, %o4
	.word	0xaa26c01d	! t0_kref+0x110c:   	sub	%i3, %i5, %l5
	.word	0x2f4ffff7	! t0_kref+0x1110:   	fbu,a,pt	%fcc0, _kref+0x10ec
	.word	0x90ba400b	! t0_kref+0x1114:   	xnorcc	%o1, %o3, %o0
	.word	0xb5b706f0	! t0_kref+0x1118:   	fmul8ulx16	%f28, %f16, %f26
	.word	0xac5ebf7d	! t0_kref+0x111c:   	smul	%i2, -0x83, %l6
	.word	0xc7ee100b	! t0_kref+0x1120:   	prefetcha	%i0 + %o3, 3
	.word	0xa8f7000c	! t0_kref+0x1124:   	udivcc	%i4, %o4, %l4
	.word	0x907e8000	! t0_kref+0x1128:   	sdiv	%i2, %g0, %o0
	.word	0x99a0003d	! t0_kref+0x112c:   	fmovs	%f29, %f12
	.word	0xf3070018	! t0_kref+0x1130:   	ld	[%i4 + %i0], %f25
	.word	0xeba62008	! t0_kref+0x1134:   	sta	%f21, [%i0 + 8]%asi
	.word	0x94df0009	! t0_kref+0x1138:   	smulcc	%i4, %o1, %o2
	.word	0x30800006	! t0_kref+0x113c:   	ba,a	_kref+0x1154
	.word	0xf8270018	! t0_kref+0x1140:   	st	%i4, [%i4 + %i0]
	.word	0x90bf3209	! t0_kref+0x1144:   	xnorcc	%i4, -0xdf7, %o0
	.word	0xd46e6000	! t0_kref+0x1148:   	ldstub	[%i1], %o2
	.word	0xed063ffc	! t0_kref+0x114c:   	ld	[%i0 - 4], %f22
	.word	0xa5a018ce	! t0_kref+0x1150:   	fdtos	%f14, %f18
	.word	0x2f480001	! t0_kref+0x1154:   	fbu,a,pt	%fcc0, _kref+0x1158
	.word	0x9402c00b	! t0_kref+0x1158:   	add	%o3, %o3, %o2
	.word	0xc0260000	! t0_kref+0x115c:   	clr	[%i0]
	.word	0xad400000	! t0_kref+0x1160:   	mov	%y, %l6
	.word	0xbba488b3	! t0_kref+0x1164:   	fsubs	%f18, %f19, %f29
	.word	0x9640001b	! t0_kref+0x1168:   	addc	%g0, %i3, %o3
	.word	0xd6c8a000	! t0_kref+0x116c:   	ldsba	[%g2]%asi, %o3
	.word	0x9fc00004	! t0_kref+0x1170:   	call	%g0 + %g4
	.word	0xac0f3940	! t0_kref+0x1174:   	and	%i4, -0x6c0, %l6
	.word	0x9a07400a	! t0_kref+0x1178:   	add	%i5, %o2, %o5
	.word	0xb5a01a2b	! t0_kref+0x117c:   	fstoi	%f11, %f26
	.word	0x9bb3040c	! t0_kref+0x1180:   	fcmple16	%f12, %f12, %o5
	.word	0x930a6e4b	! t0_kref+0x1184:   	tsubcc	%o1, 0xe4b, %o1
	.word	0x81ad0ace	! t0_kref+0x1188:   	fcmped	%fcc0, %f20, %f14
	.word	0x9b400000	! t0_kref+0x118c:   	mov	%y, %o5
	.word	0xe0f81018	! t0_kref+0x1190:   	swapa	[%g0 + %i0]0x80, %l0
	.word	0x9940c000	! t0_kref+0x1194:   	mov	%asi, %o4
	.word	0xd41e0000	! t0_kref+0x1198:   	ldd	[%i0], %o2
	.word	0xa5b00c20	! t0_kref+0x119c:   	fzeros	%f18
	.word	0xaf400000	! t0_kref+0x11a0:   	mov	%y, %l7
	.word	0x95400000	! t0_kref+0x11a4:   	mov	%y, %o2
	.word	0xe380a008	! t0_kref+0x11a8:   	lda	[%g2 + 8]%asi, %f17
	call	SYM(t0_subr1)
	.word	0xc807bff0	! t0_kref+0x11b0:   	ld	[%fp - 0x10], %g4
	.word	0xa5a01932	! t0_kref+0x11b4:   	fstod	%f18, %f18
	.word	0xd440a008	! t0_kref+0x11b8:   	ldsw	[%g2 + 8], %o2
	.word	0xa9b6c6af	! t0_kref+0x11bc:   	fmul8x16al	%f27, %f15, %f20
	.word	0x3a800006	! t0_kref+0x11c0:   	bcc,a	_kref+0x11d8
	.word	0xf3801018	! t0_kref+0x11c4:   	lda	[%g0 + %i0]0x80, %f25
	.word	0xada0193a	! t0_kref+0x11c8:   	fstod	%f26, %f22
	.word	0xaba000b4	! t0_kref+0x11cc:   	fnegs	%f20, %f21
	.word	0x35480005	! t0_kref+0x11d0:   	fbue,a,pt	%fcc0, _kref+0x11e4
	.word	0x99a689d6	! t0_kref+0x11d4:   	fdivd	%f26, %f22, %f12
	.word	0x92de800b	! t0_kref+0x11d8:   	smulcc	%i2, %o3, %o1
	.word	0xb3a01a31	! t0_kref+0x11dc:   	fstoi	%f17, %f25
	.word	0x963ab9c5	! t0_kref+0x11e0:   	xnor	%o2, -0x63b, %o3
	.word	0xa9b2c11a	! t0_kref+0x11e4:   	edge32	%o3, %i2, %l4
	.word	0xe900a018	! t0_kref+0x11e8:   	ld	[%g2 + 0x18], %f20
	.word	0xaec2b44b	! t0_kref+0x11ec:   	addccc	%o2, -0xbb5, %l7
	.word	0xe9e8a08a	! t0_kref+0x11f0:   	prefetcha	%g2 + 0x8a, 20
	.word	0xd6f81019	! t0_kref+0x11f4:   	swapa	[%g0 + %i1]0x80, %o3
	.word	0x95a308d8	! t0_kref+0x11f8:   	fsubd	%f12, %f24, %f10
	.word	0xada00556	! t0_kref+0x11fc:   	fsqrtd	%f22, %f22
	.word	0xb5a018d0	! t0_kref+0x1200:   	fdtos	%f16, %f26
	.word	0xa8aa7a5b	! t0_kref+0x1204:   	andncc	%o1, -0x5a5, %l4
	sethi	%hi(2f), %o7
	.word	0xe40be234	! t0_kref+0x120c:   	ldub	[%o7 + 0x234], %l2
	.word	0xa41ca00c	! t0_kref+0x1210:   	xor	%l2, 0xc, %l2
	.word	0xe42be234	! t0_kref+0x1214:   	stb	%l2, [%o7 + 0x234]
	.word	0x81dbe234	! t0_kref+0x1218:   	flush	%o7 + 0x234
	.word	0xadb6c70b	! t0_kref+0x121c:   	fmuld8sux16	%f27, %f11, %f22
	.word	0xf3867fe0	! t0_kref+0x1220:   	lda	[%i1 - 0x20]%asi, %f25
	.word	0xc36e6000	! t0_kref+0x1224:   	prefetch	%i1, 1
	.word	0x93b30240	! t0_kref+0x1228:   	array16	%o4, %g0, %o1
	.word	0xab408000	! t0_kref+0x122c:   	mov	%ccr, %l5
	.word	0xec167fea	! t0_kref+0x1230:   	lduh	[%i1 - 0x16], %l6
2:	.word	0xaebee3e0	! t0_kref+0x1234:   	xnorcc	%i3, 0x3e0, %l7
	.word	0x81aa8adc	! t0_kref+0x1238:   	fcmped	%fcc0, %f10, %f28
	.word	0xa806801a	! t0_kref+0x123c:   	add	%i2, %i2, %l4
	.word	0x9de3bfa0	! t0_kref+0x1240:   	save	%sp, -0x60, %sp
	.word	0x808f2171	! t0_kref+0x1244:   	btst	0x171, %i4
	.word	0x93ef320b	! t0_kref+0x1248:   	restore	%i4, -0xdf5, %o1
	.word	0x9da01a56	! t0_kref+0x124c:   	fdtoi	%f22, %f14
	.word	0xb5a68952	! t0_kref+0x1250:   	fmuld	%f26, %f18, %f26
	.word	0xb1a0054c	! t0_kref+0x1254:   	fsqrtd	%f12, %f24
	.word	0x81ab4aab	! t0_kref+0x1258:   	fcmpes	%fcc0, %f13, %f11
	.word	0xead0a012	! t0_kref+0x125c:   	ldsha	[%g2 + 0x12]%asi, %l5
	.word	0x99a00552	! t0_kref+0x1260:   	fsqrtd	%f18, %f12
	.word	0xa9a01911	! t0_kref+0x1264:   	fitod	%f17, %f20
	.word	0x9ba649b3	! t0_kref+0x1268:   	fdivs	%f25, %f19, %f13
	.word	0xa82ec01a	! t0_kref+0x126c:   	andn	%i3, %i2, %l4
	.word	0xa9b0015a	! t0_kref+0x1270:   	edge32l	%g0, %i2, %l4
	.word	0x990a801a	! t0_kref+0x1274:   	tsubcc	%o2, %i2, %o4
	.word	0xa9a000b0	! t0_kref+0x1278:   	fnegs	%f16, %f20
	.word	0xb5a5085c	! t0_kref+0x127c:   	faddd	%f20, %f28, %f26
	.word	0x969f001d	! t0_kref+0x1280:   	xorcc	%i4, %i5, %o3
	.word	0xb5b48a8e	! t0_kref+0x1284:   	fpsub16	%f18, %f14, %f26
	.word	0xb9b38fb6	! t0_kref+0x1288:   	fors	%f14, %f22, %f28
	.word	0x81da23c8	! t0_kref+0x128c:   	flush	%o0 + 0x3c8
	.word	0xbba018d2	! t0_kref+0x1290:   	fdtos	%f18, %f29
	.word	0xeefe3fec	! t0_kref+0x1294:   	swapa	[%i0 - 0x14]%asi, %l7
	.word	0x25480008	! t0_kref+0x1298:   	fblg,a,pt	%fcc0, _kref+0x12b8
	.word	0xb5a01a5c	! t0_kref+0x129c:   	fdtoi	%f28, %f26
	.word	0xaa7b2caa	! t0_kref+0x12a0:   	sdiv	%o4, 0xcaa, %l5
	.word	0xb1a01a4c	! t0_kref+0x12a4:   	fdtoi	%f12, %f24
	.word	0xa9a5885a	! t0_kref+0x12a8:   	faddd	%f22, %f26, %f20
	.word	0xe7ee101a	! t0_kref+0x12ac:   	prefetcha	%i0 + %i2, 19
	.word	0x908b6c9e	! t0_kref+0x12b0:   	andcc	%o5, 0xc9e, %o0
	.word	0x81dc4012	! t0_kref+0x12b4:   	flush	%l1 + %l2
	.word	0xc036201e	! t0_kref+0x12b8:   	clrh	[%i0 + 0x1e]
	.word	0xee96d040	! t0_kref+0x12bc:   	lduha	[%i3]0x82, %l7
	.word	0xae0b2cb4	! t0_kref+0x12c0:   	and	%o4, 0xcb4, %l7
	.word	0x9276c00c	! t0_kref+0x12c4:   	udiv	%i3, %o4, %o1
	.word	0xda8e101a	! t0_kref+0x12c8:   	lduba	[%i0 + %i2]0x80, %o5
	.word	0x99b0035d	! t0_kref+0x12cc:   	alignaddrl	%g0, %i5, %o4
	.word	0x9a72c00d	! t0_kref+0x12d0:   	udiv	%o3, %o5, %o5
	.word	0xe16e7fe0	! t0_kref+0x12d4:   	prefetch	%i1 - 0x20, 16
	.word	0x2a800007	! t0_kref+0x12d8:   	bcs,a	_kref+0x12f4
	.word	0xe8070019	! t0_kref+0x12dc:   	ld	[%i4 + %i1], %l4
	.word	0xaeda8009	! t0_kref+0x12e0:   	smulcc	%o2, %o1, %l7
	.word	0x9033401c	! t0_kref+0x12e4:   	orn	%o5, %i4, %o0
	.word	0x9140c000	! t0_kref+0x12e8:   	mov	%asi, %o0
	.word	0x9a5a71b2	! t0_kref+0x12ec:   	smul	%o1, -0xe4e, %o5
	.word	0x95a408d8	! t0_kref+0x12f0:   	fsubd	%f16, %f24, %f10
	.word	0xd4862014	! t0_kref+0x12f4:   	lda	[%i0 + 0x14]%asi, %o2
	.word	0xd91e7fe0	! t0_kref+0x12f8:   	ldd	[%i1 - 0x20], %f12
	.word	0x905eef8a	! t0_kref+0x12fc:   	smul	%i3, 0xf8a, %o0
	.word	0xa9a0192f	! t0_kref+0x1300:   	fstod	%f15, %f20
	.word	0x81ac0a54	! t0_kref+0x1304:   	fcmpd	%fcc0, %f16, %f20
	.word	0x9267401b	! t0_kref+0x1308:   	subc	%i5, %i3, %o1
	.word	0x93b5840c	! t0_kref+0x130c:   	fcmple16	%f22, %f12, %o1
	.word	0x99a0190c	! t0_kref+0x1310:   	fitod	%f12, %f12
	.word	0x90603a67	! t0_kref+0x1314:   	subc	%g0, -0x599, %o0
	.word	0xed6e6008	! t0_kref+0x1318:   	prefetch	%i1 + 8, 22
	.word	0x9820337f	! t0_kref+0x131c:   	sub	%g0, -0xc81, %o4
	.word	0xb5b68f90	! t0_kref+0x1320:   	for	%f26, %f16, %f26
	.word	0xd82e3ff1	! t0_kref+0x1324:   	stb	%o4, [%i0 - 0xf]
	.word	0xd0c0a008	! t0_kref+0x1328:   	ldswa	[%g2 + 8]%asi, %o0
	.word	0xe8de2000	! t0_kref+0x132c:   	ldxa	[%i0]%asi, %l4
	.word	0x3c800008	! t0_kref+0x1330:   	bpos,a	_kref+0x1350
	.word	0xaca3001c	! t0_kref+0x1334:   	subcc	%o4, %i4, %l6
	.word	0xada01a32	! t0_kref+0x1338:   	fstoi	%f18, %f22
	.word	0x99a018ce	! t0_kref+0x133c:   	fdtos	%f14, %f12
	.word	0xae903083	! t0_kref+0x1340:   	orcc	%g0, -0xf7d, %l7
	.word	0x9452c01d	! t0_kref+0x1344:   	umul	%o3, %i5, %o2
	.word	0xb9b38c96	! t0_kref+0x1348:   	fandnot2	%f14, %f22, %f28
	.word	0x24480007	! t0_kref+0x134c:   	ble,a,pt	%icc, _kref+0x1368
	.word	0xd2200018	! t0_kref+0x1350:   	st	%o1, [%g0 + %i0]
	.word	0xd9063fe0	! t0_kref+0x1354:   	ld	[%i0 - 0x20], %f12
	.word	0xa826ee48	! t0_kref+0x1358:   	sub	%i3, 0xe48, %l4
	.word	0x81def341	! t0_kref+0x135c:   	flush	%i3 - 0xcbf
	.word	0x81df801c	! t0_kref+0x1360:   	flush	%fp + %i4
	.word	0x9132c00c	! t0_kref+0x1364:   	srl	%o3, %o4, %o0
	.word	0xd88e5000	! t0_kref+0x1368:   	lduba	[%i1]0x80, %o4
	.word	0x9da00552	! t0_kref+0x136c:   	fsqrtd	%f18, %f14
	.word	0xadb68ace	! t0_kref+0x1370:   	fpsub32	%f26, %f14, %f22
	.word	0xee90a012	! t0_kref+0x1374:   	lduha	[%g2 + 0x12]%asi, %l7
	.word	0xae372286	! t0_kref+0x1378:   	orn	%i4, 0x286, %l7
	.word	0xa782400d	! t0_kref+0x137c:   	wr	%o1, %o5, %gsr
	.word	0xfa20a020	! t0_kref+0x1380:   	st	%i5, [%g2 + 0x20]
	.word	0xaba018d0	! t0_kref+0x1384:   	fdtos	%f16, %f21
	.word	0x3f480008	! t0_kref+0x1388:   	fbo,a,pt	%fcc0, _kref+0x13a8
	.word	0x9ac025fa	! t0_kref+0x138c:   	addccc	%g0, 0x5fa, %o5
	.word	0x8d827dc1	! t0_kref+0x1390:   	wr	%o1, 0xfffffdc1, %fprs
	.word	0xd6c8a031	! t0_kref+0x1394:   	ldsba	[%g2 + 0x31]%asi, %o3
	.word	0xd4200019	! t0_kref+0x1398:   	st	%o2, [%g0 + %i1]
	.word	0x81ae0a56	! t0_kref+0x139c:   	fcmpd	%fcc0, %f24, %f22
	.word	0xd430a030	! t0_kref+0x13a0:   	sth	%o2, [%g2 + 0x30]
	.word	0xc0b0a000	! t0_kref+0x13a4:   	stha	%g0, [%g2]%asi
	.word	0x93b240cd	! t0_kref+0x13a8:   	edge16l	%o1, %o5, %o1
	.word	0xae632473	! t0_kref+0x13ac:   	subc	%o4, 0x473, %l7
	.word	0x3b480008	! t0_kref+0x13b0:   	fble,a,pt	%fcc0, _kref+0x13d0
	.word	0x95a0055c	! t0_kref+0x13b4:   	fsqrtd	%f28, %f10
	.word	0xac62c00c	! t0_kref+0x13b8:   	subc	%o3, %o4, %l6
	.word	0xe11fbc48	! t0_kref+0x13bc:   	ldd	[%fp - 0x3b8], %f16
	.word	0x94dec01a	! t0_kref+0x13c0:   	smulcc	%i3, %i2, %o2
	.word	0xbbb74c6b	! t0_kref+0x13c4:   	fnors	%f29, %f11, %f29
	.word	0xec1e2008	! t0_kref+0x13c8:   	ldd	[%i0 + 8], %l6
	.word	0x9027276e	! t0_kref+0x13cc:   	sub	%i4, 0x76e, %o0
	.word	0xb5a000b9	! t0_kref+0x13d0:   	fnegs	%f25, %f26
	.word	0xd25165a8	! t0_kref+0x13d4:   	ldsh	[%g5 + 0x5a8], %o1
	.word	0x96bec000	! t0_kref+0x13d8:   	xnorcc	%i3, %g0, %o3
	.word	0xb5a00032	! t0_kref+0x13dc:   	fmovs	%f18, %f26
	.word	0x95a01910	! t0_kref+0x13e0:   	fitod	%f16, %f10
	call	SYM(t0_subr2)
	.word	0xea8e600d	! t0_kref+0x13e8:   	lduba	[%i1 + 0xd]%asi, %l5
	.word	0xd9200018	! t0_kref+0x13ec:   	st	%f12, [%g0 + %i0]
	.word	0xb9b306f0	! t0_kref+0x13f0:   	fmul8ulx16	%f12, %f16, %f28
	.word	0xab400000	! t0_kref+0x13f4:   	mov	%y, %l5
	.word	0x9660282e	! t0_kref+0x13f8:   	subc	%g0, 0x82e, %o3
	.word	0xd22e4000	! t0_kref+0x13fc:   	stb	%o1, [%i1]
	.word	0xa5b00cda	! t0_kref+0x1400:   	fnot2	%f26, %f18
	.word	0xada509da	! t0_kref+0x1404:   	fdivd	%f20, %f26, %f22
	.word	0xb7a000b0	! t0_kref+0x1408:   	fnegs	%f16, %f27
	.word	0x3c800004	! t0_kref+0x140c:   	bpos,a	_kref+0x141c
	.word	0xd9064000	! t0_kref+0x1410:   	ld	[%i1], %f12
	.word	0xb9a018ce	! t0_kref+0x1414:   	fdtos	%f14, %f28
	.word	0x3b480005	! t0_kref+0x1418:   	fble,a,pt	%fcc0, _kref+0x142c
	.word	0xa1a0054e	! t0_kref+0x141c:   	fsqrtd	%f14, %f16
	.word	0xeade2000	! t0_kref+0x1420:   	ldxa	[%i0]%asi, %l5
	.word	0x96ab2c7e	! t0_kref+0x1424:   	andncc	%o4, 0xc7e, %o3
	.word	0xb5b28ecc	! t0_kref+0x1428:   	fornot2	%f10, %f12, %f26
	.word	0xa1b50c50	! t0_kref+0x142c:   	fnor	%f20, %f16, %f16
	.word	0xa7a01a4e	! t0_kref+0x1430:   	fdtoi	%f14, %f19
	.word	0x21480004	! t0_kref+0x1434:   	fbn,a,pt	%fcc0, _kref+0x1444
	.word	0x903f38d8	! t0_kref+0x1438:   	xnor	%i4, -0x728, %o0
	.word	0xdd20a000	! t0_kref+0x143c:   	st	%f14, [%g2]
	.word	0x98a6c01b	! t0_kref+0x1440:   	subcc	%i3, %i3, %o4
	.word	0xda2e2001	! t0_kref+0x1444:   	stb	%o5, [%i0 + 1]
	.word	0x81ae8ace	! t0_kref+0x1448:   	fcmped	%fcc0, %f26, %f14
	.word	0xa9a01a58	! t0_kref+0x144c:   	fdtoi	%f24, %f20
	.word	0x81ae8ab5	! t0_kref+0x1450:   	fcmpes	%fcc0, %f26, %f21
	.word	0xe19f5a59	! t0_kref+0x1454:   	ldda	[%i5 + %i1]0xd2, %f16
	.word	0xdf00a010	! t0_kref+0x1458:   	ld	[%g2 + 0x10], %f15
	.word	0xb5a000b9	! t0_kref+0x145c:   	fnegs	%f25, %f26
	.word	0xec50a038	! t0_kref+0x1460:   	ldsh	[%g2 + 0x38], %l6
	.word	0xd01e3ff8	! t0_kref+0x1464:   	ldd	[%i0 - 8], %o0
	.word	0x81abcab5	! t0_kref+0x1468:   	fcmpes	%fcc0, %f15, %f21
	.word	0xc56e401c	! t0_kref+0x146c:   	prefetch	%i1 + %i4, 2
	.word	0x98a02a46	! t0_kref+0x1470:   	subcc	%g0, 0xa46, %o4
	.word	0x3c800004	! t0_kref+0x1474:   	bpos,a	_kref+0x1484
	.word	0xe920a030	! t0_kref+0x1478:   	st	%f20, [%g2 + 0x30]
	.word	0xf306401c	! t0_kref+0x147c:   	ld	[%i1 + %i4], %f25
	.word	0xabb6c0bd	! t0_kref+0x1480:   	edge16n	%i3, %i5, %l5
	.word	0xa9a01911	! t0_kref+0x1484:   	fitod	%f17, %f20
	.word	0xd41e4000	! t0_kref+0x1488:   	ldd	[%i1], %o2
	.word	0x9da018d0	! t0_kref+0x148c:   	fdtos	%f16, %f14
	.word	0x953b6002	! t0_kref+0x1490:   	sra	%o5, 0x2, %o2
	.word	0x92773dff	! t0_kref+0x1494:   	udiv	%i4, -0x201, %o1
	.word	0x950f400d	! t0_kref+0x1498:   	tsubcc	%i5, %o5, %o2
	.word	0xe9070018	! t0_kref+0x149c:   	ld	[%i4 + %i0], %f20
	.word	0x9da01916	! t0_kref+0x14a0:   	fitod	%f22, %f14
	.word	0xada28852	! t0_kref+0x14a4:   	faddd	%f10, %f18, %f22
	.word	0x943aab04	! t0_kref+0x14a8:   	xnor	%o2, 0xb04, %o2
	.word	0x9a27001d	! t0_kref+0x14ac:   	sub	%i4, %i5, %o5
	.word	0x98f74009	! t0_kref+0x14b0:   	udivcc	%i5, %o1, %o4
	.word	0xaa22aa72	! t0_kref+0x14b4:   	sub	%o2, 0xa72, %l5
	.word	0xac0a400d	! t0_kref+0x14b8:   	and	%o1, %o5, %l6
	.word	0xc807bff0	! t0_kref+0x14bc:   	ld	[%fp - 0x10], %g4
	.word	0xa1a000ab	! t0_kref+0x14c0:   	fnegs	%f11, %f16
	.word	0xb1b00f34	! t0_kref+0x14c4:   	fsrc2s	%f20, %f24
	.word	0x9fc10000	! t0_kref+0x14c8:   	call	%g4
	.word	0x99b60418	! t0_kref+0x14cc:   	fcmple16	%f24, %f24, %o4
	.word	0x93b0000a	! t0_kref+0x14d0:   	edge8	%g0, %o2, %o1
	.word	0xb9b58e4e	! t0_kref+0x14d4:   	fxnor	%f22, %f14, %f28
	.word	0x93400000	! t0_kref+0x14d8:   	mov	%y, %o1
	.word	0xf9180018	! t0_kref+0x14dc:   	ldd	[%g0 + %i0], %f28
	.word	0x9db5c675	! t0_kref+0x14e0:   	fmul8x16au	%f23, %f21, %f14
	.word	0x98db20fd	! t0_kref+0x14e4:   	smulcc	%o4, 0xfd, %o4
	.word	0x86102001	! t0_kref+0x14e8:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x14ec:   	bne,a	_kref+0x14ec
	.word	0x86a0e001	! t0_kref+0x14f0:   	subcc	%g3, 1, %g3
	sethi	%hi(2f), %o7
	.word	0xe40be114	! t0_kref+0x14f8:   	ldub	[%o7 + 0x114], %l2
	.word	0xa41ca00c	! t0_kref+0x14fc:   	xor	%l2, 0xc, %l2
	.word	0xe42be114	! t0_kref+0x1500:   	stb	%l2, [%o7 + 0x114]
	.word	0x81dbe114	! t0_kref+0x1504:   	flush	%o7 + 0x114
	.word	0xa87b3c9b	! t0_kref+0x1508:   	sdiv	%o4, -0x365, %l4
	.word	0x9b13000c	! t0_kref+0x150c:   	taddcctv	%o4, %o4, %o5
	.word	0xd01e2000	! t0_kref+0x1510:   	ldd	[%i0], %o0
2:	.word	0xaca0000b	! t0_kref+0x1514:   	subcc	%g0, %o3, %l6
	.word	0xb9a2c9b6	! t0_kref+0x1518:   	fdivs	%f11, %f22, %f28
	.word	0xd81f4019	! t0_kref+0x151c:   	ldd	[%i5 + %i1], %o4
	.word	0xec40a010	! t0_kref+0x1520:   	ldsw	[%g2 + 0x10], %l6
	.word	0xd4b01019	! t0_kref+0x1524:   	stha	%o2, [%g0 + %i1]0x80
	.word	0x989b73dc	! t0_kref+0x1528:   	xorcc	%o5, -0xc24, %o4
	.word	0xada708ad	! t0_kref+0x152c:   	fsubs	%f28, %f13, %f22
	.word	0xec1e7fe0	! t0_kref+0x1530:   	ldd	[%i1 - 0x20], %l6
	.word	0xa3a01a54	! t0_kref+0x1534:   	fdtoi	%f20, %f17
	call	SYM(t0_subr3)
	.word	0xd82e6017	! t0_kref+0x153c:   	stb	%o4, [%i1 + 0x17]
	.word	0xa1b50e80	! t0_kref+0x1540:   	fsrc1	%f20, %f16
	.word	0x969ec01a	! t0_kref+0x1544:   	xorcc	%i3, %i2, %o3
	.word	0xdfa01018	! t0_kref+0x1548:   	sta	%f15, [%g0 + %i0]0x80
	.word	0xec1e3fe8	! t0_kref+0x154c:   	ldd	[%i0 - 0x18], %l6
	.word	0xaea2bf5c	! t0_kref+0x1550:   	subcc	%o2, -0xa4, %l7
	.word	0x94bb401d	! t0_kref+0x1554:   	xnorcc	%o5, %i5, %o2
	.word	0xe5a0a010	! t0_kref+0x1558:   	sta	%f18, [%g2 + 0x10]%asi
	.word	0xe7e6500d	! t0_kref+0x155c:   	casa	[%i1]0x80, %o5, %l3
	.word	0xd000a018	! t0_kref+0x1560:   	ld	[%g2 + 0x18], %o0
	.word	0x81dc0017	! t0_kref+0x1564:   	flush	%l0 + %l7
	.word	0xec8e9058	! t0_kref+0x1568:   	lduba	[%i2 + %i0]0x82, %l6
	.word	0x90af3595	! t0_kref+0x156c:   	andncc	%i4, -0xa6b, %o0
	.word	0x98e3001c	! t0_kref+0x1570:   	subccc	%o4, %i4, %o4
	.word	0xd8a8a039	! t0_kref+0x1574:   	stba	%o4, [%g2 + 0x39]%asi
	.word	0xa5b58eda	! t0_kref+0x1578:   	fornot2	%f22, %f26, %f18
	.word	0xc0e8a02a	! t0_kref+0x157c:   	ldstuba	[%g2 + 0x2a]%asi, %g0
	.word	0x9532401a	! t0_kref+0x1580:   	srl	%o1, %i2, %o2
	.word	0xb5b38a94	! t0_kref+0x1584:   	fpsub16	%f14, %f20, %f26
	.word	0x99b48a2f	! t0_kref+0x1588:   	fpadd16s	%f18, %f15, %f12
	.word	0x9087001d	! t0_kref+0x158c:   	addcc	%i4, %i5, %o0
	sethi	%hi(2f), %o7
	.word	0xe40be1a4	! t0_kref+0x1594:   	ldub	[%o7 + 0x1a4], %l2
	.word	0xa41ca00c	! t0_kref+0x1598:   	xor	%l2, 0xc, %l2
	.word	0xe42be1a4	! t0_kref+0x159c:   	stb	%l2, [%o7 + 0x1a4]
	.word	0x81dbe1a4	! t0_kref+0x15a0:   	flush	%o7 + 0x1a4
2:	.word	0x93400000	! t0_kref+0x15a4:   	mov	%y, %o1
	.word	0xf1a0a010	! t0_kref+0x15a8:   	sta	%f24, [%g2 + 0x10]%asi
	.word	0xb5b5897a	! t0_kref+0x15ac:   	fpmerge	%f22, %f26, %f26
	.word	0x9132c00c	! t0_kref+0x15b0:   	srl	%o3, %o4, %o0
	.word	0xc0364000	! t0_kref+0x15b4:   	clrh	[%i1]
	.word	0xb3a01a4c	! t0_kref+0x15b8:   	fdtoi	%f12, %f25
	.word	0xb1b5ca7c	! t0_kref+0x15bc:   	fpadd32s	%f23, %f28, %f24
	.word	0xaea6801a	! t0_kref+0x15c0:   	subcc	%i2, %i2, %l7
	.word	0xa9b00c00	! t0_kref+0x15c4:   	fzero	%f20
	.word	0x3e480006	! t0_kref+0x15c8:   	bvc,a,pt	%icc, _kref+0x15e0
	.word	0x99400000	! t0_kref+0x15cc:   	mov	%y, %o4
	.word	0x2b02d8bb	! t0_kref+0x15d0:   	sethi	%hi(0xb62ec00), %l5
	.word	0xada689d8	! t0_kref+0x15d4:   	fdivd	%f26, %f24, %f22
	.word	0xa5a509d4	! t0_kref+0x15d8:   	fdivd	%f20, %f20, %f18
	.word	0xa1a01a52	! t0_kref+0x15dc:   	fdtoi	%f18, %f16
	.word	0xaa273408	! t0_kref+0x15e0:   	sub	%i4, -0xbf8, %l5
	.word	0x98baf7f8	! t0_kref+0x15e4:   	xnorcc	%o3, -0x808, %o4
	.word	0x9652800a	! t0_kref+0x15e8:   	umul	%o2, %o2, %o3
	.word	0x98aabbab	! t0_kref+0x15ec:   	andncc	%o2, -0x455, %o4
	.word	0xb9a00554	! t0_kref+0x15f0:   	fsqrtd	%f20, %f28
	.word	0x8143c000	! t0_kref+0x15f4:   	stbar
	.word	0xe168a045	! t0_kref+0x15f8:   	prefetch	%g2 + 0x45, 16
	.word	0x99a018ce	! t0_kref+0x15fc:   	fdtos	%f14, %f12
	.word	0xee4e0000	! t0_kref+0x1600:   	ldsb	[%i0], %l7
	.word	0x9660000c	! t0_kref+0x1604:   	subc	%g0, %o4, %o3
	.word	0x949ef126	! t0_kref+0x1608:   	xorcc	%i3, -0xeda, %o2
	.word	0xa1a01a2c	! t0_kref+0x160c:   	fstoi	%f12, %f16
	.word	0xf3a6201c	! t0_kref+0x1610:   	sta	%f25, [%i0 + 0x1c]%asi
	.word	0xe8867fe4	! t0_kref+0x1614:   	lda	[%i1 - 0x1c]%asi, %l4
	.word	0xb7a509ac	! t0_kref+0x1618:   	fdivs	%f20, %f12, %f27
	.word	0xd2162004	! t0_kref+0x161c:   	lduh	[%i0 + 4], %o1
	.word	0xd01e3fe8	! t0_kref+0x1620:   	ldd	[%i0 - 0x18], %o0
	.word	0x9288001d	! t0_kref+0x1624:   	andcc	%g0, %i5, %o1
	.word	0x93408000	! t0_kref+0x1628:   	mov	%ccr, %o1
	.word	0xa5a018da	! t0_kref+0x162c:   	fdtos	%f26, %f18
	.word	0xab400000	! t0_kref+0x1630:   	mov	%y, %l5
	.word	0x907b21d3	! t0_kref+0x1634:   	sdiv	%o4, 0x1d3, %o0
	.word	0xac7e800c	! t0_kref+0x1638:   	sdiv	%i2, %o4, %l6
	.word	0xd03e3fe0	! t0_kref+0x163c:   	std	%o0, [%i0 - 0x20]
	.word	0x81db4016	! t0_kref+0x1640:   	flush	%o5 + %l6
	.word	0xb9a0053a	! t0_kref+0x1644:   	fsqrts	%f26, %f28
	.word	0x98c3000c	! t0_kref+0x1648:   	addccc	%o4, %o4, %o4
	.word	0xf42e601e	! t0_kref+0x164c:   	stb	%i2, [%i1 + 0x1e]
	.word	0xd9be185a	! t0_kref+0x1650:   	stda	%f12, [%i0 + %i2]0xc2
	.word	0xb1a00552	! t0_kref+0x1654:   	fsqrtd	%f18, %f24
	.word	0x2c480005	! t0_kref+0x1658:   	bneg,a,pt	%icc, _kref+0x166c
	.word	0xa5a94052	! t0_kref+0x165c:   	fmovdug	%fcc0, %f18, %f18
	.word	0x9473001d	! t0_kref+0x1660:   	udiv	%o4, %i5, %o2
	.word	0xe8c0a008	! t0_kref+0x1664:   	ldswa	[%g2 + 8]%asi, %l4
	.word	0x11244c39	! t0_kref+0x1668:   	sethi	%hi(0x9130e400), %o0
	.word	0x30800006	! t0_kref+0x166c:   	ba,a	_kref+0x1684
	.word	0xe36e401c	! t0_kref+0x1670:   	prefetch	%i1 + %i4, 17
	.word	0x93b4850c	! t0_kref+0x1674:   	fcmpgt16	%f18, %f12, %o1
	.word	0xa85f000c	! t0_kref+0x1678:   	smul	%i4, %o4, %l4
	.word	0xd7000019	! t0_kref+0x167c:   	ld	[%g0 + %i1], %f11
	.word	0xffee501c	! t0_kref+0x1680:   	prefetcha	%i1 + %i4, 31
	.word	0xd656200a	! t0_kref+0x1684:   	ldsh	[%i0 + 0xa], %o3
	.word	0x9b44c000	! t0_kref+0x1688:   	mov	%gsr, %o5
	.word	0x90dab717	! t0_kref+0x168c:   	smulcc	%o2, -0x8e9, %o0
	.word	0xd410a010	! t0_kref+0x1690:   	lduh	[%g2 + 0x10], %o2
	.word	0xb1a018da	! t0_kref+0x1694:   	fdtos	%f26, %f24
	.word	0x910f7d8b	! t0_kref+0x1698:   	tsubcc	%i5, -0x275, %o0
	.word	0xabb7011d	! t0_kref+0x169c:   	edge32	%i4, %i5, %l5
	.word	0xc3ee501d	! t0_kref+0x16a0:   	prefetcha	%i1 + %i5, 1
	.word	0xa9a00534	! t0_kref+0x16a4:   	fsqrts	%f20, %f20
	.word	0xb1a0192c	! t0_kref+0x16a8:   	fstod	%f12, %f24
	.word	0x8143c000	! t0_kref+0x16ac:   	stbar
	.word	0xdf861000	! t0_kref+0x16b0:   	lda	[%i0]0x80, %f15
	.word	0xd450a028	! t0_kref+0x16b4:   	ldsh	[%g2 + 0x28], %o2
	.word	0xda36001b	! t0_kref+0x16b8:   	sth	%o5, [%i0 + %i3]
	.word	0xe890a022	! t0_kref+0x16bc:   	lduha	[%g2 + 0x22]%asi, %l4
	.word	0xac7f401b	! t0_kref+0x16c0:   	sdiv	%i5, %i3, %l6
	.word	0x2c480007	! t0_kref+0x16c4:   	bneg,a,pt	%icc, _kref+0x16e0
	.word	0x99a0054e	! t0_kref+0x16c8:   	fsqrtd	%f14, %f12
	.word	0xa9a48858	! t0_kref+0x16cc:   	faddd	%f18, %f24, %f20
	.word	0xd0b81018	! t0_kref+0x16d0:   	stda	%o0, [%g0 + %i0]0x80
	.word	0xc9ee500d	! t0_kref+0x16d4:   	prefetcha	%i1 + %o5, 4
	.word	0xee6e8019	! t0_kref+0x16d8:   	ldstub	[%i2 + %i1], %l7
	.word	0xacd30000	! t0_kref+0x16dc:   	umulcc	%o4, %g0, %l6
	.word	0x95b7010b	! t0_kref+0x16e0:   	edge32	%i4, %o3, %o2
	.word	0xaca2800b	! t0_kref+0x16e4:   	subcc	%o2, %o3, %l6
	.word	0xf830a018	! t0_kref+0x16e8:   	sth	%i4, [%g2 + 0x18]
	.word	0xaf37601b	! t0_kref+0x16ec:   	srl	%i5, 0x1b, %l7
	.word	0xee88a031	! t0_kref+0x16f0:   	lduba	[%g2 + 0x31]%asi, %l7
	.word	0xae083190	! t0_kref+0x16f4:   	and	%g0, -0xe70, %l7
	.word	0xb8103ffc	! t0_kref+0x16f8:   	mov	0xfffffffc, %i4
	.word	0x99b28000	! t0_kref+0x16fc:   	edge8	%o2, %g0, %o4
	.word	0x90803278	! t0_kref+0x1700:   	addcc	%g0, -0xd88, %o0
	.word	0xf420a030	! t0_kref+0x1704:   	st	%i2, [%g2 + 0x30]
	.word	0xac67400b	! t0_kref+0x1708:   	subc	%i5, %o3, %l6
	.word	0x9817401d	! t0_kref+0x170c:   	or	%i5, %i5, %o4
	.word	0x9530001b	! t0_kref+0x1710:   	srl	%g0, %i3, %o2
	.word	0x81ac8ad2	! t0_kref+0x1714:   	fcmped	%fcc0, %f18, %f18
	.word	0xf8270018	! t0_kref+0x1718:   	st	%i4, [%i4 + %i0]
	.word	0xeb066014	! t0_kref+0x171c:   	ld	[%i1 + 0x14], %f21
	.word	0xa5a0012f	! t0_kref+0x1720:   	fabss	%f15, %f18
	.word	0x92a2401d	! t0_kref+0x1724:   	subcc	%o1, %i5, %o1
	.word	0x90803207	! t0_kref+0x1728:   	addcc	%g0, -0xdf9, %o0
	.word	0xacc0001a	! t0_kref+0x172c:   	addccc	%g0, %i2, %l6
	.word	0x9de3bfa0	! t0_kref+0x1730:   	save	%sp, -0x60, %sp
	.word	0xb81e801d	! t0_kref+0x1734:   	xor	%i2, %i5, %i4
	.word	0x95ef0000	! t0_kref+0x1738:   	restore	%i4, %g0, %o2
	.word	0xe1a61000	! t0_kref+0x173c:   	sta	%f16, [%i0]0x80
	.word	0x94a6ffb3	! t0_kref+0x1740:   	subcc	%i3, -0x4d, %o2
	.word	0xa9a349b6	! t0_kref+0x1744:   	fdivs	%f13, %f22, %f20
	.word	0x81ab8ace	! t0_kref+0x1748:   	fcmped	%fcc0, %f14, %f14
	.word	0x9da000b9	! t0_kref+0x174c:   	fnegs	%f25, %f14
	.word	0x9da308da	! t0_kref+0x1750:   	fsubd	%f12, %f26, %f14
	.word	0x96b2b470	! t0_kref+0x1754:   	orncc	%o2, -0xb90, %o3
	.word	0xaba8803a	! t0_kref+0x1758:   	fmovslg	%fcc0, %f26, %f21
	.word	0x9332a01b	! t0_kref+0x175c:   	srl	%o2, 0x1b, %o1
	.word	0x25480002	! t0_kref+0x1760:   	fblg,a,pt	%fcc0, _kref+0x1768
	.word	0xb5a588cc	! t0_kref+0x1764:   	fsubd	%f22, %f12, %f26
	.word	0xf306401c	! t0_kref+0x1768:   	ld	[%i1 + %i4], %f25
	.word	0xa5b50d94	! t0_kref+0x176c:   	fxor	%f20, %f20, %f18
	.word	0x99a0104e	! t0_kref+0x1770:   	fdtox	%f14, %f12
	.word	0xadb48d14	! t0_kref+0x1774:   	fandnot1	%f18, %f20, %f22
	.word	0x36480005	! t0_kref+0x1778:   	bge,a,pt	%icc, _kref+0x178c
	.word	0xdaa0a028	! t0_kref+0x177c:   	sta	%o5, [%g2 + 0x28]%asi
	.word	0xaa30001d	! t0_kref+0x1780:   	orn	%g0, %i5, %l5
	.word	0xada00550	! t0_kref+0x1784:   	fsqrtd	%f16, %f22
	.word	0xa3b48df3	! t0_kref+0x1788:   	fnands	%f18, %f19, %f17
	.word	0x97a000af	! t0_kref+0x178c:   	fnegs	%f15, %f11
	.word	0xafa0053a	! t0_kref+0x1790:   	fsqrts	%f26, %f23
	.word	0x86102002	! t0_kref+0x1794:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x1798:   	bne,a	_kref+0x1798
	.word	0x86a0e001	! t0_kref+0x179c:   	subcc	%g3, 1, %g3
	.word	0xef070019	! t0_kref+0x17a0:   	ld	[%i4 + %i1], %f23
	.word	0x9da509b4	! t0_kref+0x17a4:   	fdivs	%f20, %f20, %f14
	.word	0xa3b00c20	! t0_kref+0x17a8:   	fzeros	%f17
	.word	0xe89f5058	! t0_kref+0x17ac:   	ldda	[%i5 + %i0]0x82, %l4
	.word	0xb1a3c8b0	! t0_kref+0x17b0:   	fsubs	%f15, %f16, %f24
	.word	0xf91e7fe8	! t0_kref+0x17b4:   	ldd	[%i1 - 0x18], %f28
	.word	0xada508d0	! t0_kref+0x17b8:   	fsubd	%f20, %f16, %f22
	.word	0xea90a012	! t0_kref+0x17bc:   	lduha	[%g2 + 0x12]%asi, %l5
	.word	0xc568a08f	! t0_kref+0x17c0:   	prefetch	%g2 + 0x8f, 2
	.word	0xf96e7fe0	! t0_kref+0x17c4:   	prefetch	%i1 - 0x20, 28
	.word	0xc02e601d	! t0_kref+0x17c8:   	clrb	[%i1 + 0x1d]
	.word	0x81de3c93	! t0_kref+0x17cc:   	flush	%i0 - 0x36d
	.word	0xa92f0000	! t0_kref+0x17d0:   	sll	%i4, %g0, %l4
	.word	0xc1e8a0c0	! t0_kref+0x17d4:   	prefetcha	%g2 + 0xc0, 0
	.word	0x96f6c01d	! t0_kref+0x17d8:   	udivcc	%i3, %i5, %o3
	.word	0xb9a4085c	! t0_kref+0x17dc:   	faddd	%f16, %f28, %f28
	.word	0x3b480005	! t0_kref+0x17e0:   	fble,a,pt	%fcc0, _kref+0x17f4
	.word	0xabb6830b	! t0_kref+0x17e4:   	alignaddr	%i2, %o3, %l5
	.word	0x81db400e	! t0_kref+0x17e8:   	flush	%o5 + %sp
	.word	0x9b32400d	! t0_kref+0x17ec:   	srl	%o1, %o5, %o5
	.word	0xe56e001d	! t0_kref+0x17f0:   	prefetch	%i0 + %i5, 18
	.word	0xaf36e018	! t0_kref+0x17f4:   	srl	%i3, 0x18, %l7
	.word	0x97a00533	! t0_kref+0x17f8:   	fsqrts	%f19, %f11
	.word	0x3d480001	! t0_kref+0x17fc:   	fbule,a,pt	%fcc0, _kref+0x1800
	.word	0xa9a409bc	! t0_kref+0x1800:   	fdivs	%f16, %f28, %f20
	.word	0xd82e2009	! t0_kref+0x1804:   	stb	%o4, [%i0 + 9]
	.word	0xaedb001a	! t0_kref+0x1808:   	smulcc	%o4, %i2, %l7
	.word	0x39480007	! t0_kref+0x180c:   	fbuge,a,pt	%fcc0, _kref+0x1828
	.word	0xdade7ff8	! t0_kref+0x1810:   	ldxa	[%i1 - 8]%asi, %o5
	.word	0x36800007	! t0_kref+0x1814:   	bge,a	_kref+0x1830
	.word	0xd690a008	! t0_kref+0x1818:   	lduha	[%g2 + 8]%asi, %o3
	.word	0x3f480002	! t0_kref+0x181c:   	fbo,a,pt	%fcc0, _kref+0x1824
	.word	0xd416401b	! t0_kref+0x1820:   	lduh	[%i1 + %i3], %o2
	.word	0x923f39fb	! t0_kref+0x1824:   	xnor	%i4, -0x605, %o1
	.word	0xaa72400d	! t0_kref+0x1828:   	udiv	%o1, %o5, %l5
	.word	0xf51fbfc8	! t0_kref+0x182c:   	ldd	[%fp - 0x38], %f26
	.word	0x8580001d	! t0_kref+0x1830:   	mov	%i5, %ccr
	.word	0x97a0003b	! t0_kref+0x1834:   	fmovs	%f27, %f11
	.word	0xc02e001a	! t0_kref+0x1838:   	clrb	[%i0 + %i2]
	.word	0x9de3bfa0	! t0_kref+0x183c:   	save	%sp, -0x60, %sp
	.word	0xa9ef7600	! t0_kref+0x1840:   	restore	%i5, -0xa00, %l4
	.word	0xa5b3c6b8	! t0_kref+0x1844:   	fmul8x16al	%f15, %f24, %f18
	.word	0xa9a01939	! t0_kref+0x1848:   	fstod	%f25, %f20
	.word	0x945a801d	! t0_kref+0x184c:   	smul	%o2, %i5, %o2
	.word	0x9656801a	! t0_kref+0x1850:   	umul	%i2, %i2, %o3
	.word	0xa5a0002b	! t0_kref+0x1854:   	fmovs	%f11, %f18
	.word	0xe3a0a030	! t0_kref+0x1858:   	sta	%f17, [%g2 + 0x30]%asi
	.word	0x953f000a	! t0_kref+0x185c:   	sra	%i4, %o2, %o2
	.word	0x9de3bfa0	! t0_kref+0x1860:   	save	%sp, -0x60, %sp
	.word	0x97ee801a	! t0_kref+0x1864:   	restore	%i2, %i2, %o3
	.word	0xb1a3885a	! t0_kref+0x1868:   	faddd	%f14, %f26, %f24
	.word	0xa9a00531	! t0_kref+0x186c:   	fsqrts	%f17, %f20
	.word	0xd7062000	! t0_kref+0x1870:   	ld	[%i0], %f11
	.word	0x9abf2f19	! t0_kref+0x1874:   	xnorcc	%i4, 0xf19, %o5
	.word	0x81ad4aad	! t0_kref+0x1878:   	fcmpes	%fcc0, %f21, %f13
	.word	0x906774f7	! t0_kref+0x187c:   	subc	%i5, -0xb09, %o0
	.word	0xed68a0c8	! t0_kref+0x1880:   	prefetch	%g2 + 0xc8, 22
	.word	0x90a2801a	! t0_kref+0x1884:   	subcc	%o2, %i2, %o0
	.word	0xe8066008	! t0_kref+0x1888:   	ld	[%i1 + 8], %l4
	.word	0x22800002	! t0_kref+0x188c:   	be,a	_kref+0x1894
	.word	0xda06001c	! t0_kref+0x1890:   	ld	[%i0 + %i4], %o5
	.word	0xfaa0a038	! t0_kref+0x1894:   	sta	%i5, [%g2 + 0x38]%asi
	.word	0xd248a022	! t0_kref+0x1898:   	ldsb	[%g2 + 0x22], %o1
	.word	0xfba0a000	! t0_kref+0x189c:   	sta	%f29, [%g2]%asi
	.word	0x95b286f4	! t0_kref+0x18a0:   	fmul8ulx16	%f10, %f20, %f10
	.word	0xe840a020	! t0_kref+0x18a4:   	ldsw	[%g2 + 0x20], %l4
	.word	0xd09e501d	! t0_kref+0x18a8:   	ldda	[%i1 + %i5]0x80, %o0
	.word	0x99b38d12	! t0_kref+0x18ac:   	fandnot1	%f14, %f18, %f12
	.word	0x9b32a019	! t0_kref+0x18b0:   	srl	%o2, 0x19, %o5
	.word	0xaae2400b	! t0_kref+0x18b4:   	subccc	%o1, %o3, %l5
	.word	0x9da0052e	! t0_kref+0x18b8:   	fsqrts	%f14, %f14
	.word	0x29363eda	! t0_kref+0x18bc:   	sethi	%hi(0xd8fb6800), %l4
	.word	0x2a480005	! t0_kref+0x18c0:   	bcs,a,pt	%icc, _kref+0x18d4
	.word	0xd080a000	! t0_kref+0x18c4:   	lda	[%g2]%asi, %o0
	.word	0xb1a00537	! t0_kref+0x18c8:   	fsqrts	%f23, %f24
	.word	0x99b3412d	! t0_kref+0x18cc:   	edge32n	%o5, %o5, %o4
	.word	0x81ab8a4c	! t0_kref+0x18d0:   	fcmpd	%fcc0, %f14, %f12
	.word	0xa83aecfc	! t0_kref+0x18d4:   	xnor	%o3, 0xcfc, %l4
	.word	0xd44e2011	! t0_kref+0x18d8:   	ldsb	[%i0 + 0x11], %o2
	.word	0x30800005	! t0_kref+0x18dc:   	ba,a	_kref+0x18f0
	.word	0xadb5848a	! t0_kref+0x18e0:   	fcmple32	%f22, %f10, %l6
	.word	0xa3a01a3b	! t0_kref+0x18e4:   	fstoi	%f27, %f17
	.word	0xa3a01a50	! t0_kref+0x18e8:   	fdtoi	%f16, %f17
	.word	0x9bb5041a	! t0_kref+0x18ec:   	fcmple16	%f20, %f26, %o5
	.word	0xa5b5062e	! t0_kref+0x18f0:   	fmul8x16	%f20, %f14, %f18
	.word	0x9de3bfa0	! t0_kref+0x18f4:   	save	%sp, -0x60, %sp
	.word	0xb447401b	! t0_kref+0x18f8:   	addc	%i5, %i3, %i2
	.word	0xadee2e58	! t0_kref+0x18fc:   	restore	%i0, 0xe58, %l6
	.word	0xad400000	! t0_kref+0x1900:   	mov	%y, %l6
	.word	0x27480002	! t0_kref+0x1904:   	fbul,a,pt	%fcc0, _kref+0x190c
	.word	0xa5a388ca	! t0_kref+0x1908:   	fsubd	%f14, %f10, %f18
	.word	0xd64e600a	! t0_kref+0x190c:   	ldsb	[%i1 + 0xa], %o3
	.word	0x94083b80	! t0_kref+0x1910:   	and	%g0, -0x480, %o2
	.word	0x95b00f1c	! t0_kref+0x1914:   	fsrc2	%f28, %f10
	sethi	%hi(2f), %o7
	.word	0xe40be150	! t0_kref+0x191c:   	ldub	[%o7 + 0x150], %l2
	.word	0xa41ca00c	! t0_kref+0x1920:   	xor	%l2, 0xc, %l2
	.word	0xe42be150	! t0_kref+0x1924:   	stb	%l2, [%o7 + 0x150]
	.word	0x81dbe150	! t0_kref+0x1928:   	flush	%o7 + 0x150
	.word	0xac5b3aff	! t0_kref+0x192c:   	smul	%o4, -0x501, %l6
	.word	0xd68e9018	! t0_kref+0x1930:   	lduba	[%i2 + %i0]0x80, %o3
	.word	0xea08a03b	! t0_kref+0x1934:   	ldub	[%g2 + 0x3b], %l5
	.word	0xdd070019	! t0_kref+0x1938:   	ld	[%i4 + %i1], %f14
	.word	0xd99eda18	! t0_kref+0x193c:   	ldda	[%i3 + %i0]0xd0, %f12
	.word	0x9a67001d	! t0_kref+0x1940:   	subc	%i4, %i5, %o5
	.word	0x905f400a	! t0_kref+0x1944:   	smul	%i5, %o2, %o0
	.word	0x9af34009	! t0_kref+0x1948:   	udivcc	%o5, %o1, %o5
	.word	0xd900a010	! t0_kref+0x194c:   	ld	[%g2 + 0x10], %f12
2:	.word	0xafb3006b	! t0_kref+0x1950:   	edge8ln	%o4, %o3, %l7
	.word	0xadb40ed4	! t0_kref+0x1954:   	fornot2	%f16, %f20, %f22
	.word	0x81ae0a54	! t0_kref+0x1958:   	fcmpd	%fcc0, %f24, %f20
	.word	0x9db386da	! t0_kref+0x195c:   	fmul8sux16	%f14, %f26, %f14
	.word	0x9da4084e	! t0_kref+0x1960:   	faddd	%f16, %f14, %f14
	.word	0x9676fab6	! t0_kref+0x1964:   	udiv	%i3, -0x54a, %o3
	.word	0xd85e6018	! t0_kref+0x1968:   	ldx	[%i1 + 0x18], %o4
	.word	0x94ba801a	! t0_kref+0x196c:   	xnorcc	%o2, %i2, %o2
	.word	0xe96e6008	! t0_kref+0x1970:   	prefetch	%i1 + 8, 20
	.word	0x3e480001	! t0_kref+0x1974:   	bvc,a,pt	%icc, _kref+0x1978
	.word	0xbba000bd	! t0_kref+0x1978:   	fnegs	%f29, %f29
	.word	0x9de3bfa0	! t0_kref+0x197c:   	save	%sp, -0x60, %sp
	.word	0xb6c7001c	! t0_kref+0x1980:   	addccc	%i4, %i4, %i3
	.word	0xa9ef20cc	! t0_kref+0x1984:   	restore	%i4, 0xcc, %l4
	.word	0x3a800002	! t0_kref+0x1988:   	bcc,a	_kref+0x1990
	.word	0xa83b36e6	! t0_kref+0x198c:   	xnor	%o4, -0x91a, %l4
	.word	0xf3ee101d	! t0_kref+0x1990:   	prefetcha	%i0 + %i5, 25
	.word	0x81af0a56	! t0_kref+0x1994:   	fcmpd	%fcc0, %f28, %f22
	.word	0xacf30009	! t0_kref+0x1998:   	udivcc	%o4, %o1, %l6
	.word	0xab3ae004	! t0_kref+0x199c:   	sra	%o3, 0x4, %l5
	.word	0x99a448bb	! t0_kref+0x19a0:   	fsubs	%f17, %f27, %f12
	.word	0x99ab0054	! t0_kref+0x19a4:   	fmovduge	%fcc0, %f20, %f12
	.word	0xe83e6010	! t0_kref+0x19a8:   	std	%l4, [%i1 + 0x10]
	.word	0xe81e0000	! t0_kref+0x19ac:   	ldd	[%i0], %l4
	.word	0xec4e200f	! t0_kref+0x19b0:   	ldsb	[%i0 + 0xf], %l6
	.word	0xee167ffe	! t0_kref+0x19b4:   	lduh	[%i1 - 2], %l7
	.word	0xad3b4009	! t0_kref+0x19b8:   	sra	%o5, %o1, %l6
	.word	0xea871019	! t0_kref+0x19bc:   	lda	[%i4 + %i1]0x80, %l5
	.word	0x81ae0a50	! t0_kref+0x19c0:   	fcmpd	%fcc0, %f24, %f16
	.word	0xefee101d	! t0_kref+0x19c4:   	prefetcha	%i0 + %i5, 23
	.word	0x99b705d8	! t0_kref+0x19c8:   	fcmpeq32	%f28, %f24, %o4
	.word	0xf82e6001	! t0_kref+0x19cc:   	stb	%i4, [%i1 + 1]
	.word	0x81ab0ad2	! t0_kref+0x19d0:   	fcmped	%fcc0, %f12, %f18
	.word	0xa1a01a54	! t0_kref+0x19d4:   	fdtoi	%f20, %f16
	.word	0x9092400c	! t0_kref+0x19d8:   	orcc	%o1, %o4, %o0
	.word	0xa1a50950	! t0_kref+0x19dc:   	fmuld	%f20, %f16, %f16
	.word	0x81dff08c	! t0_kref+0x19e0:   	flush	%i7 - 0xf74
	.word	0xada0052b	! t0_kref+0x19e4:   	fsqrts	%f11, %f22
	.word	0xd6162004	! t0_kref+0x19e8:   	lduh	[%i0 + 4], %o3
	.word	0xdd1e2018	! t0_kref+0x19ec:   	ldd	[%i0 + 0x18], %f14
	.word	0xda16c018	! t0_kref+0x19f0:   	lduh	[%i3 + %i0], %o5
	.word	0x3b480002	! t0_kref+0x19f4:   	fble,a,pt	%fcc0, _kref+0x19fc
	.word	0xfa362006	! t0_kref+0x19f8:   	sth	%i5, [%i0 + 6]
	.word	0xb3b007b2	! t0_kref+0x19fc:   	fpackfix	%f18, %f25
	.word	0x8143c000	! t0_kref+0x1a00:   	stbar
	.word	0x99b70a52	! t0_kref+0x1a04:   	fpadd32	%f28, %f18, %f12
	.word	0xaf44c000	! t0_kref+0x1a08:   	mov	%gsr, %l7
	.word	0x969373b1	! t0_kref+0x1a0c:   	orcc	%o5, -0xc4f, %o3
	.word	0x9fa018d0	! t0_kref+0x1a10:   	fdtos	%f16, %f15
	.word	0xa3b0077c	! t0_kref+0x1a14:   	fpack16	%f28, %f17
	.word	0x9de3bfa0	! t0_kref+0x1a18:   	save	%sp, -0x60, %sp
	.word	0xba3f401c	! t0_kref+0x1a1c:   	xnor	%i5, %i4, %i5
	.word	0xabef7afa	! t0_kref+0x1a20:   	restore	%i5, -0x506, %l5
	.word	0xa8502b9a	! t0_kref+0x1a24:   	umul	%g0, 0xb9a, %l4
	.word	0xe2f81018	! t0_kref+0x1a28:   	swapa	[%g0 + %i0]0x80, %l1
	.word	0xada489ca	! t0_kref+0x1a2c:   	fdivd	%f18, %f10, %f22
	.word	0x9a3a6a48	! t0_kref+0x1a30:   	xnor	%o1, 0xa48, %o5
	.word	0x9de3bfa0	! t0_kref+0x1a34:   	save	%sp, -0x60, %sp
	.word	0x80d6401b	! t0_kref+0x1a38:   	umulcc	%i1, %i3, %g0
	.word	0xadef20a1	! t0_kref+0x1a3c:   	restore	%i4, 0xa1, %l6
	.word	0xea08a012	! t0_kref+0x1a40:   	ldub	[%g2 + 0x12], %l5
	.word	0x9da01a56	! t0_kref+0x1a44:   	fdtoi	%f22, %f14
	.word	0xf007bfe0	! t0_kref+0x1a48:   	ld	[%fp - 0x20], %i0
	.word	0xada509ca	! t0_kref+0x1a4c:   	fdivd	%f20, %f10, %f22
	.word	0xea80a010	! t0_kref+0x1a50:   	lda	[%g2 + 0x10]%asi, %l5
	.word	0x9bb340cc	! t0_kref+0x1a54:   	edge16l	%o5, %o4, %o5
	.word	0x9066bc60	! t0_kref+0x1a58:   	subc	%i2, -0x3a0, %o0
	.word	0xa9b30dee	! t0_kref+0x1a5c:   	fnands	%f12, %f14, %f20
	.word	0xb5a00556	! t0_kref+0x1a60:   	fsqrtd	%f22, %f26
	.word	0x913b2004	! t0_kref+0x1a64:   	sra	%o4, 0x4, %o0
	.word	0xd42e8019	! t0_kref+0x1a68:   	stb	%o2, [%i2 + %i1]
	.word	0xee100018	! t0_kref+0x1a6c:   	lduh	[%g0 + %i0], %l7
	.word	0xb1a018da	! t0_kref+0x1a70:   	fdtos	%f26, %f24
	.word	0x97a000ae	! t0_kref+0x1a74:   	fnegs	%f14, %f11
	.word	0x92a76943	! t0_kref+0x1a78:   	subcc	%i5, 0x943, %o1
	.word	0xd6b0a03a	! t0_kref+0x1a7c:   	stha	%o3, [%g2 + 0x3a]%asi
	.word	0xc12e401c	! t0_kref+0x1a80:   	st	%fsr, [%i1 + %i4]
	.word	0xeda0a000	! t0_kref+0x1a84:   	sta	%f22, [%g2]%asi
	.word	0x9022635d	! t0_kref+0x1a88:   	sub	%o1, 0x35d, %o0
	.word	0xb5a289d6	! t0_kref+0x1a8c:   	fdivd	%f10, %f22, %f26
	.word	0xaf1b74c8	! t0_kref+0x1a90:   	tsubcctv	%o5, -0xb38, %l7
	.word	0x95b3414a	! t0_kref+0x1a94:   	edge32l	%o5, %o2, %o2
	.word	0xd436c018	! t0_kref+0x1a98:   	sth	%o2, [%i3 + %i0]
	.word	0x953b401b	! t0_kref+0x1a9c:   	sra	%o5, %i3, %o2
	.word	0xa5a018d2	! t0_kref+0x1aa0:   	fdtos	%f18, %f18
	.word	0xe7060000	! t0_kref+0x1aa4:   	ld	[%i0], %f19
	.word	0x95b3435a	! t0_kref+0x1aa8:   	alignaddrl	%o5, %i2, %o2
	.word	0xdb066000	! t0_kref+0x1aac:   	ld	[%i1], %f13
	.word	0xd0be7ff8	! t0_kref+0x1ab0:   	stda	%o0, [%i1 - 8]%asi
	.word	0x96a736d8	! t0_kref+0x1ab4:   	subcc	%i4, -0x928, %o3
	.word	0x95b406dc	! t0_kref+0x1ab8:   	fmul8sux16	%f16, %f28, %f10
	.word	0xda36c018	! t0_kref+0x1abc:   	sth	%o5, [%i3 + %i0]
	.word	0xf62e2018	! t0_kref+0x1ac0:   	stb	%i3, [%i0 + 0x18]
	.word	0xafb7004a	! t0_kref+0x1ac4:   	edge8l	%i4, %o2, %l7
	.word	0xc76e400b	! t0_kref+0x1ac8:   	prefetch	%i1 + %o3, 3
	.word	0xa1b58e58	! t0_kref+0x1acc:   	fxnor	%f22, %f24, %f16
	.word	0x9ba509bc	! t0_kref+0x1ad0:   	fdivs	%f20, %f28, %f13
	.word	0xa9a00535	! t0_kref+0x1ad4:   	fsqrts	%f21, %f20
	.word	0x2b480008	! t0_kref+0x1ad8:   	fbug,a,pt	%fcc0, _kref+0x1af8
	.word	0x9da509da	! t0_kref+0x1adc:   	fdivd	%f20, %f26, %f14
	.word	0xd0be101d	! t0_kref+0x1ae0:   	stda	%o0, [%i0 + %i5]0x80
	.word	0xadb64e7b	! t0_kref+0x1ae4:   	fxnors	%f25, %f27, %f22
	.word	0x85833365	! t0_kref+0x1ae8:   	wr	%o4, 0xfffff365, %ccr
	.word	0x81ad0a4a	! t0_kref+0x1aec:   	fcmpd	%fcc0, %f20, %f10
	.word	0x98f0000d	! t0_kref+0x1af0:   	udivcc	%g0, %o5, %o4
	.word	0xe76e2018	! t0_kref+0x1af4:   	prefetch	%i0 + 0x18, 19
	.word	0x993a601b	! t0_kref+0x1af8:   	sra	%o1, 0x1b, %o4
	.word	0x2919a57c	! t0_kref+0x1afc:   	sethi	%hi(0x6695f000), %l4
	sethi	%hi(2f), %o7
	.word	0xe40be350	! t0_kref+0x1b04:   	ldub	[%o7 + 0x350], %l2
	.word	0xa41ca00c	! t0_kref+0x1b08:   	xor	%l2, 0xc, %l2
	.word	0xe42be350	! t0_kref+0x1b0c:   	stb	%l2, [%o7 + 0x350]
	.word	0x81dbe350	! t0_kref+0x1b10:   	flush	%o7 + 0x350
	.word	0x95b6841a	! t0_kref+0x1b14:   	fcmple16	%f26, %f26, %o2
	.word	0xb5b00c20	! t0_kref+0x1b18:   	fzeros	%f26
	.word	0x92502951	! t0_kref+0x1b1c:   	umul	%g0, 0x951, %o1
	.word	0xd0066010	! t0_kref+0x1b20:   	ld	[%i1 + 0x10], %o0
	.word	0xa3a00134	! t0_kref+0x1b24:   	fabss	%f20, %f17
	.word	0xc020a018	! t0_kref+0x1b28:   	clr	[%g2 + 0x18]
	.word	0xa9400000	! t0_kref+0x1b2c:   	mov	%y, %l4
	.word	0xaca2401a	! t0_kref+0x1b30:   	subcc	%o1, %i2, %l6
	.word	0xdd1fbe08	! t0_kref+0x1b34:   	ldd	[%fp - 0x1f8], %f14
	.word	0xdb00a020	! t0_kref+0x1b38:   	ld	[%g2 + 0x20], %f13
	.word	0xe9e8a107	! t0_kref+0x1b3c:   	prefetcha	%g2 + 0x107, 20
	.word	0x8143c000	! t0_kref+0x1b40:   	stbar
	.word	0xa3a000ba	! t0_kref+0x1b44:   	fnegs	%f26, %f17
	.word	0x982a800d	! t0_kref+0x1b48:   	andn	%o2, %o5, %o4
	.word	0x963838a7	! t0_kref+0x1b4c:   	xnor	%g0, -0x759, %o3
2:	.word	0x9a90001d	! t0_kref+0x1b50:   	orcc	%g0, %i5, %o5
	.word	0xf4263fe0	! t0_kref+0x1b54:   	st	%i2, [%i0 - 0x20]
	.word	0xaaf6a9b5	! t0_kref+0x1b58:   	udivcc	%i2, 0x9b5, %l5
	.word	0x2b1c01ac	! t0_kref+0x1b5c:   	sethi	%hi(0x7006b000), %l5
	.word	0xd720a030	! t0_kref+0x1b60:   	st	%f11, [%g2 + 0x30]
	.word	0x81ae0a4c	! t0_kref+0x1b64:   	fcmpd	%fcc0, %f24, %f12
	sethi	%hi(1f), %o7
	jmpl	%o7+%lo(1f), %g1
	.empty
	.word	0xa1a00556	! t0_kref+0x1b70:   	fsqrtd	%f22, %f16
	.word	0x81ac8ad8	! t0_kref+0x1b74:   	fcmped	%fcc0, %f18, %f24
	.word	0x99a6894c	! t0_kref+0x1b78:   	fmuld	%f26, %f12, %f12
	.word	0xe9e8a040	! t0_kref+0x1b7c:   	prefetcha	%g2 + 0x40, 20
	.word	0x99b68d18	! t0_kref+0x1b80:   	fandnot1	%f26, %f24, %f12
1:	.word	0xaba01a4a	! t0_kref+0x1b84:   	fdtoi	%f10, %f21
	.word	0x8d870000	! t0_kref+0x1b88:   	wr	%i4, %g0, %fprs
	.word	0x8143e070	! t0_kref+0x1b8c:   	membar	0x70
	.word	0xedee501d	! t0_kref+0x1b90:   	prefetcha	%i1 + %i5, 22
	.word	0xa9a01a58	! t0_kref+0x1b94:   	fdtoi	%f24, %f20
	.word	0xada01110	! t0_kref+0x1b98:   	fxtod	%f16, %f22
	.word	0xa83b3173	! t0_kref+0x1b9c:   	xnor	%o4, -0xe8d, %l4
	.word	0xab400000	! t0_kref+0x1ba0:   	mov	%y, %l5
	.word	0x9890001c	! t0_kref+0x1ba4:   	orcc	%g0, %i4, %o4
	.word	0x8143c000	! t0_kref+0x1ba8:   	stbar
	.word	0xf1180019	! t0_kref+0x1bac:   	ldd	[%g0 + %i1], %f24
	.word	0x965a401d	! t0_kref+0x1bb0:   	smul	%o1, %i5, %o3
	.word	0xef6e401d	! t0_kref+0x1bb4:   	prefetch	%i1 + %i5, 23
	.word	0x9763a66a	! t0_kref+0x1bb8:   	movule	%fcc0, -0x196, %o3
	.word	0xb9a0052f	! t0_kref+0x1bbc:   	fsqrts	%f15, %f28
	.word	0xe840a030	! t0_kref+0x1bc0:   	ldsw	[%g2 + 0x30], %l4
	.word	0xd2b0a03a	! t0_kref+0x1bc4:   	stha	%o1, [%g2 + 0x3a]%asi
	.word	0xfa30a002	! t0_kref+0x1bc8:   	sth	%i5, [%g2 + 2]
	.word	0xd420a038	! t0_kref+0x1bcc:   	st	%o2, [%g2 + 0x38]
	.word	0xd22e401a	! t0_kref+0x1bd0:   	stb	%o1, [%i1 + %i2]
	.word	0xacbef774	! t0_kref+0x1bd4:   	xnorcc	%i3, -0x88c, %l6
	.word	0xd9be2018	! t0_kref+0x1bd8:   	stda	%f12, [%i0 + 0x18]%asi
	.word	0x878020f0	! t0_kref+0x1bdc:   	mov	0xf0, %asi
	.word	0xb1a0052d	! t0_kref+0x1be0:   	fsqrts	%f13, %f24
	.word	0x25480008	! t0_kref+0x1be4:   	fblg,a,pt	%fcc0, _kref+0x1c04
	.word	0x940af3a8	! t0_kref+0x1be8:   	and	%o3, -0xc58, %o2
	.word	0x91b2c0cd	! t0_kref+0x1bec:   	edge16l	%o3, %o5, %o0
	.word	0xb1a0110e	! t0_kref+0x1bf0:   	fxtod	%f14, %f24
	.word	0xa9a00558	! t0_kref+0x1bf4:   	fsqrtd	%f24, %f20
	.word	0xda08a029	! t0_kref+0x1bf8:   	ldub	[%g2 + 0x29], %o5
	.word	0x99a5084e	! t0_kref+0x1bfc:   	faddd	%f20, %f14, %f12
	.word	0xada01915	! t0_kref+0x1c00:   	fitod	%f21, %f22
	.word	0x86102003	! t0_kref+0x1c04:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x1c08:   	bne,a	_kref+0x1c08
	.word	0x86a0e001	! t0_kref+0x1c0c:   	subcc	%g3, 1, %g3
	.word	0xa8632db9	! t0_kref+0x1c10:   	subc	%o4, 0xdb9, %l4
	.word	0xd2363ff0	! t0_kref+0x1c14:   	sth	%o1, [%i0 - 0x10]
	.word	0x96e6801d	! t0_kref+0x1c18:   	subccc	%i2, %i5, %o3
	.word	0x9b37001b	! t0_kref+0x1c1c:   	srl	%i4, %i3, %o5
	.word	0x9fc10000	! t0_kref+0x1c20:   	call	%g4
	.word	0xa9a44930	! t0_kref+0x1c24:   	fmuls	%f17, %f16, %f20
	.word	0xdfa71019	! t0_kref+0x1c28:   	sta	%f15, [%i4 + %i1]0x80
	.word	0xd2c65000	! t0_kref+0x1c2c:   	ldswa	[%i1]0x80, %o1
	.word	0xbbb60c79	! t0_kref+0x1c30:   	fnors	%f24, %f25, %f29
	.word	0x94bf7e36	! t0_kref+0x1c34:   	xnorcc	%i5, -0x1ca, %o2
	.word	0x8143c000	! t0_kref+0x1c38:   	stbar
	.word	0x9738000c	! t0_kref+0x1c3c:   	sra	%g0, %o4, %o3
	.word	0xafa01a36	! t0_kref+0x1c40:   	fstoi	%f22, %f23
	.word	0xac3b7173	! t0_kref+0x1c44:   	xnor	%o5, -0xe8d, %l6
	.word	0x2d480001	! t0_kref+0x1c48:   	fbg,a,pt	%fcc0, _kref+0x1c4c
	.word	0xf91e4000	! t0_kref+0x1c4c:   	ldd	[%i1], %f28
	.word	0xec48a00b	! t0_kref+0x1c50:   	ldsb	[%g2 + 0xb], %l6
	.word	0xb1b686f6	! t0_kref+0x1c54:   	fmul8ulx16	%f26, %f22, %f24
	.word	0xc028a022	! t0_kref+0x1c58:   	clrb	[%g2 + 0x22]
	.word	0x3f480006	! t0_kref+0x1c5c:   	fbo,a,pt	%fcc0, _kref+0x1c74
	.word	0xe120a020	! t0_kref+0x1c60:   	st	%f16, [%g2 + 0x20]
	.word	0x28480002	! t0_kref+0x1c64:   	bleu,a,pt	%icc, _kref+0x1c6c
	.word	0x99a508d2	! t0_kref+0x1c68:   	fsubd	%f20, %f18, %f12
	.word	0xbbb00f2b	! t0_kref+0x1c6c:   	fsrc2s	%f11, %f29
	.word	0x3d480004	! t0_kref+0x1c70:   	fbule,a,pt	%fcc0, _kref+0x1c80
	.word	0x9336a004	! t0_kref+0x1c74:   	srl	%i2, 0x4, %o1
	.word	0xa9b7433a	! t0_kref+0x1c78:   	bmask	%i5, %i2, %l4
	.word	0x98af0009	! t0_kref+0x1c7c:   	andncc	%i4, %o1, %o4
	.word	0x9a903338	! t0_kref+0x1c80:   	orcc	%g0, -0xcc8, %o5
	.word	0x93b700a0	! t0_kref+0x1c84:   	edge16n	%i4, %g0, %o1
	.word	0xd81f4018	! t0_kref+0x1c88:   	ldd	[%i5 + %i0], %o4
	.word	0xb7a01a3b	! t0_kref+0x1c8c:   	fstoi	%f27, %f27
	.word	0xd220a030	! t0_kref+0x1c90:   	st	%o1, [%g2 + 0x30]
	.word	0x9bb6845c	! t0_kref+0x1c94:   	fcmpne16	%f26, %f28, %o5
	.word	0x90c33a79	! t0_kref+0x1c98:   	addccc	%o4, -0x587, %o0
	.word	0x2f480002	! t0_kref+0x1c9c:   	fbu,a,pt	%fcc0, _kref+0x1ca4
	.word	0x9bb70280	! t0_kref+0x1ca0:   	array32	%i4, %g0, %o5
	.word	0xb5a689d6	! t0_kref+0x1ca4:   	fdivd	%f26, %f22, %f26
	.word	0xb5b4ce6b	! t0_kref+0x1ca8:   	fxnors	%f19, %f11, %f26
	.word	0xa3b007b6	! t0_kref+0x1cac:   	fpackfix	%f22, %f17
	.word	0x9866ac53	! t0_kref+0x1cb0:   	subc	%i2, 0xc53, %o4
	.word	0xaca6aa0f	! t0_kref+0x1cb4:   	subcc	%i2, 0xa0f, %l6
	.word	0x93400000	! t0_kref+0x1cb8:   	mov	%y, %o1
	.word	0x95b68a9c	! t0_kref+0x1cbc:   	fpsub16	%f26, %f28, %f10
	.word	0xd0be1000	! t0_kref+0x1cc0:   	stda	%o0, [%i0]0x80
	.word	0xdbe6101a	! t0_kref+0x1cc4:   	casa	[%i0]0x80, %i2, %o5
	.word	0xb1a01a3a	! t0_kref+0x1cc8:   	fstoi	%f26, %f24
	.word	0xd0ce5000	! t0_kref+0x1ccc:   	ldsba	[%i1]0x80, %o0
	.word	0x9072fd1f	! t0_kref+0x1cd0:   	udiv	%o3, -0x2e1, %o0
	.word	0xf7ee501d	! t0_kref+0x1cd4:   	prefetcha	%i1 + %i5, 27
	.word	0xa932401d	! t0_kref+0x1cd8:   	srl	%o1, %i5, %l4
	.word	0xa5a488dc	! t0_kref+0x1cdc:   	fsubd	%f18, %f28, %f18
	.word	0xd920a028	! t0_kref+0x1ce0:   	st	%f12, [%g2 + 0x28]
	.word	0xa5a0054c	! t0_kref+0x1ce4:   	fsqrtd	%f12, %f18
	.word	0xaa22801c	! t0_kref+0x1ce8:   	sub	%o2, %i4, %l5
	.word	0xa9a00535	! t0_kref+0x1cec:   	fsqrts	%f21, %f20
	.word	0xdf00a008	! t0_kref+0x1cf0:   	ld	[%g2 + 8], %f15
	.word	0xd2360000	! t0_kref+0x1cf4:   	sth	%o1, [%i0]
	.word	0xd6280018	! t0_kref+0x1cf8:   	stb	%o3, [%g0 + %i0]
	.word	0x28480001	! t0_kref+0x1cfc:   	bleu,a,pt	%icc, _kref+0x1d00
	.word	0xafb54efa	! t0_kref+0x1d00:   	fornot2s	%f21, %f26, %f23
	.word	0xdd865000	! t0_kref+0x1d04:   	lda	[%i1]0x80, %f14
	.word	0x9da0188c	! t0_kref+0x1d08:   	fitos	%f12, %f14
	.word	0x99b50a5a	! t0_kref+0x1d0c:   	fpadd32	%f20, %f26, %f12
	.word	0x9db60ed6	! t0_kref+0x1d10:   	fornot2	%f24, %f22, %f14
	.word	0xdb20a038	! t0_kref+0x1d14:   	st	%f13, [%g2 + 0x38]
	.word	0xd430a020	! t0_kref+0x1d18:   	sth	%o2, [%g2 + 0x20]
	.word	0xf428a01a	! t0_kref+0x1d1c:   	stb	%i2, [%g2 + 0x1a]
	.word	0x960b39f1	! t0_kref+0x1d20:   	and	%o4, -0x60f, %o3
	.word	0x9a932b78	! t0_kref+0x1d24:   	orcc	%o4, 0xb78, %o5
	.word	0xac7b400c	! t0_kref+0x1d28:   	sdiv	%o5, %o4, %l6
	.word	0x9da000b4	! t0_kref+0x1d2c:   	fnegs	%f20, %f14
	.word	0x3c800008	! t0_kref+0x1d30:   	bpos,a	_kref+0x1d50
	.word	0xec163ff4	! t0_kref+0x1d34:   	lduh	[%i0 - 0xc], %l6
	.word	0xa9400000	! t0_kref+0x1d38:   	mov	%y, %l4
	.word	0xaa3a7420	! t0_kref+0x1d3c:   	xnor	%o1, -0xbe0, %l5
	.word	0x9da01a50	! t0_kref+0x1d40:   	fdtoi	%f16, %f14
	.word	0xc768a100	! t0_kref+0x1d44:   	prefetch	%g2 + 0x100, 3
	.word	0x9a67400d	! t0_kref+0x1d48:   	subc	%i5, %o5, %o5
	.word	0xed1fbdf8	! t0_kref+0x1d4c:   	ldd	[%fp - 0x208], %f22
	sethi	%hi(2f), %o7
	.word	0xe40be16c	! t0_kref+0x1d54:   	ldub	[%o7 + 0x16c], %l2
	.word	0xa41ca00c	! t0_kref+0x1d58:   	xor	%l2, 0xc, %l2
	.word	0xe42be16c	! t0_kref+0x1d5c:   	stb	%l2, [%o7 + 0x16c]
	.word	0x81dbe16c	! t0_kref+0x1d60:   	flush	%o7 + 0x16c
	.word	0xfb6e7fe8	! t0_kref+0x1d64:   	prefetch	%i1 - 0x18, 29
	.word	0x8143c000	! t0_kref+0x1d68:   	stbar
2:	.word	0xdf20a020	! t0_kref+0x1d6c:   	st	%f15, [%g2 + 0x20]
	sethi	%hi(2f), %o7
	.word	0xe40be194	! t0_kref+0x1d74:   	ldub	[%o7 + 0x194], %l2
	.word	0xa41ca00c	! t0_kref+0x1d78:   	xor	%l2, 0xc, %l2
	.word	0xe42be194	! t0_kref+0x1d7c:   	stb	%l2, [%o7 + 0x194]
	.word	0x81dbe194	! t0_kref+0x1d80:   	flush	%o7 + 0x194
	.word	0xb1a409b7	! t0_kref+0x1d84:   	fdivs	%f16, %f23, %f24
	.word	0xa9a000cc	! t0_kref+0x1d88:   	fnegd	%f12, %f20
	.word	0xb5a589d2	! t0_kref+0x1d8c:   	fdivd	%f22, %f18, %f26
	.word	0xac26fea5	! t0_kref+0x1d90:   	sub	%i3, -0x15b, %l6
2:	.word	0xacbb3a38	! t0_kref+0x1d94:   	xnorcc	%o4, -0x5c8, %l6
	.word	0x99b00c00	! t0_kref+0x1d98:   	fzero	%f12
	.word	0xb9a00530	! t0_kref+0x1d9c:   	fsqrts	%f16, %f28
	.word	0xaa56e036	! t0_kref+0x1da0:   	umul	%i3, 0x36, %l5
	.word	0x9560801b	! t0_kref+0x1da4:   	movlg	%fcc0, %i3, %o2
	.word	0x3b480004	! t0_kref+0x1da8:   	fble,a,pt	%fcc0, _kref+0x1db8
	.word	0xea48a02a	! t0_kref+0x1dac:   	ldsb	[%g2 + 0x2a], %l5
	.word	0xa9a2c9b5	! t0_kref+0x1db0:   	fdivs	%f11, %f21, %f20
	.word	0xd51e3fe0	! t0_kref+0x1db4:   	ldd	[%i0 - 0x20], %f10
	.word	0xdf264000	! t0_kref+0x1db8:   	st	%f15, [%i1]
	.word	0xa7a000ba	! t0_kref+0x1dbc:   	fnegs	%f26, %f19
	.word	0xbba018d0	! t0_kref+0x1dc0:   	fdtos	%f16, %f29
	.word	0x23480006	! t0_kref+0x1dc4:   	fbne,a,pt	%fcc0, _kref+0x1ddc
	.word	0xaba00536	! t0_kref+0x1dc8:   	fsqrts	%f22, %f21
	.word	0x98a0001b	! t0_kref+0x1dcc:   	subcc	%g0, %i3, %o4
	.word	0xa8a6c00d	! t0_kref+0x1dd0:   	subcc	%i3, %o5, %l4
	.word	0xb1a7095a	! t0_kref+0x1dd4:   	fmuld	%f28, %f26, %f24
	.word	0x90903911	! t0_kref+0x1dd8:   	orcc	%g0, -0x6ef, %o0
	.word	0x81d90011	! t0_kref+0x1ddc:   	flush	%g4 + %l1
	.word	0x3a800002	! t0_kref+0x1de0:   	bcc,a	_kref+0x1de8
	.word	0xda28a029	! t0_kref+0x1de4:   	stb	%o5, [%g2 + 0x29]
	.word	0x92febfac	! t0_kref+0x1de8:   	sdivcc	%i2, -0x54, %o1
	.word	0x2b480003	! t0_kref+0x1dec:   	fbug,a,pt	%fcc0, _kref+0x1df8
	.word	0xf786101c	! t0_kref+0x1df0:   	lda	[%i0 + %i4]0x80, %f27
	.word	0x81ad8ada	! t0_kref+0x1df4:   	fcmped	%fcc0, %f22, %f26
	.word	0xd8180019	! t0_kref+0x1df8:   	ldd	[%g0 + %i1], %o4
	.word	0x95b40a4c	! t0_kref+0x1dfc:   	fpadd32	%f16, %f12, %f10
	.word	0x91400000	! t0_kref+0x1e00:   	mov	%y, %o0
	.word	0xa5a000bd	! t0_kref+0x1e04:   	fnegs	%f29, %f18
	.word	0x22800007	! t0_kref+0x1e08:   	be,a	_kref+0x1e24
	.word	0xaec265c3	! t0_kref+0x1e0c:   	addccc	%o1, 0x5c3, %l7
	.word	0xb1a6892d	! t0_kref+0x1e10:   	fmuls	%f26, %f13, %f24
	.word	0xb3a01a3d	! t0_kref+0x1e14:   	fstoi	%f29, %f25
	.word	0x99b6cdf0	! t0_kref+0x1e18:   	fnands	%f27, %f16, %f12
	.word	0x927eb6ae	! t0_kref+0x1e1c:   	sdiv	%i2, -0x952, %o1
	.word	0xd0180018	! t0_kref+0x1e20:   	ldd	[%g0 + %i0], %o0
	.word	0xc398a080	! t0_kref+0x1e24:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0x3e800006	! t0_kref+0x1e28:   	bvc,a	_kref+0x1e40
	.word	0xd46e8019	! t0_kref+0x1e2c:   	ldstub	[%i2 + %i1], %o2
	.word	0xec96501b	! t0_kref+0x1e30:   	lduha	[%i1 + %i3]0x80, %l6
	.word	0xda10a030	! t0_kref+0x1e34:   	lduh	[%g2 + 0x30], %o5
	.word	0x81ab8a5c	! t0_kref+0x1e38:   	fcmpd	%fcc0, %f14, %f28
	.word	0x903a400b	! t0_kref+0x1e3c:   	xnor	%o1, %o3, %o0
	.word	0xe99e9a19	! t0_kref+0x1e40:   	ldda	[%i2 + %i1]0xd0, %f20
	.word	0xfa36401b	! t0_kref+0x1e44:   	sth	%i5, [%i1 + %i3]
	.word	0xe1e6501c	! t0_kref+0x1e48:   	casa	[%i1]0x80, %i4, %l0
	.word	0x97b00ced	! t0_kref+0x1e4c:   	fnot2s	%f13, %f11
	.word	0x35480001	! t0_kref+0x1e50:   	fbue,a,pt	%fcc0, _kref+0x1e54
	.word	0xd4280019	! t0_kref+0x1e54:   	stb	%o2, [%g0 + %i1]
	.word	0xda0e3ff0	! t0_kref+0x1e58:   	ldub	[%i0 - 0x10], %o5
	.word	0xafb2802c	! t0_kref+0x1e5c:   	edge8n	%o2, %o4, %l7
	.word	0x9466801b	! t0_kref+0x1e60:   	subc	%i2, %i3, %o2
	.word	0x90a6ef0b	! t0_kref+0x1e64:   	subcc	%i3, 0xf0b, %o0
	.word	0xa5b44c73	! t0_kref+0x1e68:   	fnors	%f17, %f19, %f18
	.word	0x37480007	! t0_kref+0x1e6c:   	fbge,a,pt	%fcc0, _kref+0x1e88
	.word	0xa89a801b	! t0_kref+0x1e70:   	xorcc	%o2, %i3, %l4
	.word	0x97b60e70	! t0_kref+0x1e74:   	fxnors	%f24, %f16, %f11
	.word	0x9540c000	! t0_kref+0x1e78:   	mov	%asi, %o2
	.word	0xacf6c009	! t0_kref+0x1e7c:   	udivcc	%i3, %o1, %l6
	.word	0xf1ee101d	! t0_kref+0x1e80:   	prefetcha	%i0 + %i5, 24
	.word	0x94383fe9	! t0_kref+0x1e84:   	xnor	%g0, -0x17, %o2
	.word	0xaa376103	! t0_kref+0x1e88:   	orn	%i5, 0x103, %l5
	.word	0xd89e105d	! t0_kref+0x1e8c:   	ldda	[%i0 + %i5]0x82, %o4
	.word	0x81800000	! t0_kref+0x1e90:   	mov	%g0, %y
	.word	0x95a0004e	! t0_kref+0x1e94:   	fmovd	%f14, %f10
	.word	0x29800007	! t0_kref+0x1e98:   	fbl,a	_kref+0x1eb4
	.word	0xe3b8a040	! t0_kref+0x1e9c:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x8143c000	! t0_kref+0x1ea0:   	stbar
	.word	0x27480001	! t0_kref+0x1ea4:   	fbul,a,pt	%fcc0, _kref+0x1ea8
	.word	0x81dde9f7	! t0_kref+0x1ea8:   	flush	%l7 + 0x9f7
	.word	0x97b4040c	! t0_kref+0x1eac:   	fcmple16	%f16, %f12, %o3
	.word	0xda00a038	! t0_kref+0x1eb0:   	ld	[%g2 + 0x38], %o5
	.word	0xa1a01930	! t0_kref+0x1eb4:   	fstod	%f16, %f16
	.word	0xd000a008	! t0_kref+0x1eb8:   	ld	[%g2 + 8], %o0
	.word	0xd41e0000	! t0_kref+0x1ebc:   	ldd	[%i0], %o2
	.word	0x9fc00004	! t0_kref+0x1ec0:   	call	%g0 + %g4
	.word	0x97b7401d	! t0_kref+0x1ec4:   	edge8	%i5, %i5, %o3
	.word	0xc030a00a	! t0_kref+0x1ec8:   	clrh	[%g2 + 0xa]
	.word	0xaac0001c	! t0_kref+0x1ecc:   	addccc	%g0, %i4, %l5
	.word	0x9db58e80	! t0_kref+0x1ed0:   	fsrc1	%f22, %f14
	.word	0x900765ab	! t0_kref+0x1ed4:   	add	%i5, 0x5ab, %o0
	.word	0xada01a4e	! t0_kref+0x1ed8:   	fdtoi	%f14, %f22
	.word	0x8143c000	! t0_kref+0x1edc:   	stbar
	.word	0xa8c6c00d	! t0_kref+0x1ee0:   	addccc	%i3, %o5, %l4
	.word	0xacda801a	! t0_kref+0x1ee4:   	smulcc	%o2, %i2, %l6
	.word	0x9de3bfa0	! t0_kref+0x1ee8:   	save	%sp, -0x60, %sp
	.word	0x802f001b	! t0_kref+0x1eec:   	andn	%i4, %i3, %g0
	.word	0xafeec000	! t0_kref+0x1ef0:   	restore	%i3, %g0, %l7
	.word	0xae328009	! t0_kref+0x1ef4:   	orn	%o2, %o1, %l7
	.word	0x98f82e21	! t0_kref+0x1ef8:   	sdivcc	%g0, 0xe21, %o4
	.word	0x81af0aae	! t0_kref+0x1efc:   	fcmpes	%fcc0, %f28, %f14
	.word	0x97a0052f	! t0_kref+0x1f00:   	fsqrts	%f15, %f11
	.word	0xf630a038	! t0_kref+0x1f04:   	sth	%i3, [%g2 + 0x38]
	.word	0xb7a01a2b	! t0_kref+0x1f08:   	fstoi	%f11, %f27
	.word	0x23480006	! t0_kref+0x1f0c:   	fbne,a,pt	%fcc0, _kref+0x1f24
	.word	0x963762c4	! t0_kref+0x1f10:   	orn	%i5, 0x2c4, %o3
	.word	0x93b2814a	! t0_kref+0x1f14:   	edge32l	%o2, %o2, %o1
	.word	0xa1a01918	! t0_kref+0x1f18:   	fitod	%f24, %f16
	.word	0x9da5c82f	! t0_kref+0x1f1c:   	fadds	%f23, %f15, %f14
	.word	0xc36e000c	! t0_kref+0x1f20:   	prefetch	%i0 + %o4, 1
	.word	0x83c063c4	! t0_kref+0x1f24:   	jmpl	%g1 + 0x3c4, %g1
	.word	0x91b2c0fc	! t0_kref+0x1f28:   	edge16ln	%o3, %i4, %o0
	.word	0xb7a01a50	! t0_kref+0x1f2c:   	fdtoi	%f16, %f27
	.word	0x39480007	! t0_kref+0x1f30:   	fbuge,a,pt	%fcc0, _kref+0x1f4c
	.word	0x99a488b8	! t0_kref+0x1f34:   	fsubs	%f18, %f24, %f12
	.word	0x2f1961d5	! t0_kref+0x1f38:   	sethi	%hi(0x65875400), %l7
	.word	0x38800003	! t0_kref+0x1f3c:   	bgu,a	_kref+0x1f48
	.word	0xe99e1a5d	! t0_kref+0x1f40:   	ldda	[%i0 + %i5]0xd2, %f20
	.word	0x9da4cd34	! t0_kref+0x1f44:   	fsmuld	%f19, %f20, %f14
	.word	0xc12e2004	! t0_kref+0x1f48:   	st	%fsr, [%i0 + 4]
	.word	0x81dc20cc	! t0_kref+0x1f4c:   	flush	%l0 + 0xcc
	.word	0x1918a98f	! t0_kref+0x1f50:   	sethi	%hi(0x62a63c00), %o4
	.word	0x9340c000	! t0_kref+0x1f54:   	mov	%asi, %o1
	.word	0xaca2401c	! t0_kref+0x1f58:   	subcc	%o1, %i4, %l6
	.word	0xa3a018d6	! t0_kref+0x1f5c:   	fdtos	%f22, %f17
	.word	0xda00a008	! t0_kref+0x1f60:   	ld	[%g2 + 8], %o5
	.word	0xda364000	! t0_kref+0x1f64:   	sth	%o5, [%i1]
	.word	0x969aefd4	! t0_kref+0x1f68:   	xorcc	%o3, 0xfd4, %o3
	.word	0xbba01a38	! t0_kref+0x1f6c:   	fstoi	%f24, %f29
	.word	0x9328000d	! t0_kref+0x1f70:   	sll	%g0, %o5, %o1
	.word	0xadb706f0	! t0_kref+0x1f74:   	fmul8ulx16	%f28, %f16, %f22
	.word	0x81aa8a5a	! t0_kref+0x1f78:   	fcmpd	%fcc0, %f10, %f26
	.word	0xda16001b	! t0_kref+0x1f7c:   	lduh	[%i0 + %i3], %o5
	.word	0xd600a020	! t0_kref+0x1f80:   	ld	[%g2 + 0x20], %o3
	.word	0xf420a010	! t0_kref+0x1f84:   	st	%i2, [%g2 + 0x10]
	.word	0xacf3401a	! t0_kref+0x1f88:   	udivcc	%o5, %i2, %l6
	.word	0xee48a01b	! t0_kref+0x1f8c:   	ldsb	[%g2 + 0x1b], %l7
	.word	0xa1a00556	! t0_kref+0x1f90:   	fsqrtd	%f22, %f16
	.word	0xae32f6ca	! t0_kref+0x1f94:   	orn	%o3, -0x936, %l7
	.word	0x92a33f43	! t0_kref+0x1f98:   	subcc	%o4, -0xbd, %o1
	.word	0xa1a00556	! t0_kref+0x1f9c:   	fsqrtd	%f22, %f16
	.word	0x9fa00532	! t0_kref+0x1fa0:   	fsqrts	%f18, %f15
	.word	0xaef2400b	! t0_kref+0x1fa4:   	udivcc	%o1, %o3, %l7
	.word	0xec9e5000	! t0_kref+0x1fa8:   	ldda	[%i1]0x80, %l6
	.word	0x9466b7e7	! t0_kref+0x1fac:   	subc	%i2, -0x819, %o2
	.word	0x99a00554	! t0_kref+0x1fb0:   	fsqrtd	%f20, %f12
	.word	0x81aa8aca	! t0_kref+0x1fb4:   	fcmped	%fcc0, %f10, %f10
	.word	0xf1180018	! t0_kref+0x1fb8:   	ldd	[%g0 + %i0], %f24
	.word	0xaf332004	! t0_kref+0x1fbc:   	srl	%o4, 0x4, %l7
	.word	0x99b5849c	! t0_kref+0x1fc0:   	fcmple32	%f22, %f28, %o4
	.word	0xec6e6009	! t0_kref+0x1fc4:   	ldstub	[%i1 + 9], %l6
	.word	0xaa727f5f	! t0_kref+0x1fc8:   	udiv	%o1, -0xa1, %l5
	.word	0xb6103fea	! t0_kref+0x1fcc:   	mov	0xffffffea, %i3
	.word	0xa9400000	! t0_kref+0x1fd0:   	mov	%y, %l4
	.word	0x9fc00004	! t0_kref+0x1fd4:   	call	%g0 + %g4
	.word	0xeb062010	! t0_kref+0x1fd8:   	ld	[%i0 + 0x10], %f21
	.word	0x9ba4c8bb	! t0_kref+0x1fdc:   	fsubs	%f19, %f27, %f13
	.word	0xaba00039	! t0_kref+0x1fe0:   	fmovs	%f25, %f21
	.word	0xada388b1	! t0_kref+0x1fe4:   	fsubs	%f14, %f17, %f22
	.word	0x96bb401d	! t0_kref+0x1fe8:   	xnorcc	%o5, %i5, %o3
	.word	0xfb20a018	! t0_kref+0x1fec:   	st	%f29, [%g2 + 0x18]
	.word	0xf828a028	! t0_kref+0x1ff0:   	stb	%i4, [%g2 + 0x28]
	.word	0x9540c000	! t0_kref+0x1ff4:   	mov	%asi, %o2
	.word	0x952ec01b	! t0_kref+0x1ff8:   	sll	%i3, %i3, %o2
	.word	0x9de3bfa0	! t0_kref+0x1ffc:   	save	%sp, -0x60, %sp
	.word	0xabe8001a	! t0_kref+0x2000:   	restore	%g0, %i2, %l5
	.word	0x98a6c01b	! t0_kref+0x2004:   	subcc	%i3, %i3, %o4
	.word	0x9862c000	! t0_kref+0x2008:   	subc	%o3, %g0, %o4
	.word	0xd920a008	! t0_kref+0x200c:   	st	%f12, [%g2 + 8]
	.word	0x9606b5d5	! t0_kref+0x2010:   	add	%i2, -0xa2b, %o3
	.word	0x9fa58830	! t0_kref+0x2014:   	fadds	%f22, %f16, %f15
	.word	0x3f480005	! t0_kref+0x2018:   	fbo,a,pt	%fcc0, _kref+0x202c
	.word	0x9662800a	! t0_kref+0x201c:   	subc	%o2, %o2, %o3
	.word	0xaadae83a	! t0_kref+0x2020:   	smulcc	%o3, 0x83a, %l5
	.word	0xafb6806d	! t0_kref+0x2024:   	edge8ln	%i2, %o5, %l7
	.word	0x81ab8ad0	! t0_kref+0x2028:   	fcmped	%fcc0, %f14, %f16
	.word	0xfb00a028	! t0_kref+0x202c:   	ld	[%g2 + 0x28], %f29
	.word	0x9da00558	! t0_kref+0x2030:   	fsqrtd	%f24, %f14
	.word	0xfa20a030	! t0_kref+0x2034:   	st	%i5, [%g2 + 0x30]
	.word	0xe89e501d	! t0_kref+0x2038:   	ldda	[%i1 + %i5]0x80, %l4
	.word	0xbba00131	! t0_kref+0x203c:   	fabss	%f17, %f29
	.word	0xad400000	! t0_kref+0x2040:   	mov	%y, %l6
	.word	0xaf40c000	! t0_kref+0x2044:   	mov	%asi, %l7
	.word	0x941263a0	! t0_kref+0x2048:   	or	%o1, 0x3a0, %o2
	.word	0x97a4093d	! t0_kref+0x204c:   	fmuls	%f16, %f29, %f11
	.word	0xd46e3fe6	! t0_kref+0x2050:   	ldstub	[%i0 - 0x1a], %o2
	.word	0xaebeb2ab	! t0_kref+0x2054:   	xnorcc	%i2, -0xd55, %l7
	.word	0x969a780e	! t0_kref+0x2058:   	xorcc	%o1, -0x7f2, %o3
	.word	0xa8bf0000	! t0_kref+0x205c:   	xnorcc	%i4, %g0, %l4
	.word	0xb3a01a5c	! t0_kref+0x2060:   	fdtoi	%f28, %f25
	.word	0x9a06800c	! t0_kref+0x2064:   	add	%i2, %o4, %o5
	.word	0xe9ee501c	! t0_kref+0x2068:   	prefetcha	%i1 + %i4, 20
	.word	0xfa36401b	! t0_kref+0x206c:   	sth	%i5, [%i1 + %i3]
	.word	0xd008a000	! t0_kref+0x2070:   	ldub	[%g2], %o0
	.word	0xa9a01a5c	! t0_kref+0x2074:   	fdtoi	%f28, %f20
	.word	0x969b2228	! t0_kref+0x2078:   	xorcc	%o4, 0x228, %o3
	.word	0x9623000b	! t0_kref+0x207c:   	sub	%o4, %o3, %o3
	.word	0xc568a0c0	! t0_kref+0x2080:   	prefetch	%g2 + 0xc0, 2
	.word	0xec4e3fea	! t0_kref+0x2084:   	ldsb	[%i0 - 0x16], %l6
	.word	0xea16c019	! t0_kref+0x2088:   	lduh	[%i3 + %i1], %l5
	.word	0x81ae0a50	! t0_kref+0x208c:   	fcmpd	%fcc0, %f24, %f16
	.word	0xd248a002	! t0_kref+0x2090:   	ldsb	[%g2 + 2], %o1
	.word	0xabb40f7b	! t0_kref+0x2094:   	fornot1s	%f16, %f27, %f21
	.word	0x99a0054c	! t0_kref+0x2098:   	fsqrtd	%f12, %f12
	.word	0xb1a000b4	! t0_kref+0x209c:   	fnegs	%f20, %f24
	.word	0x9b44c000	! t0_kref+0x20a0:   	mov	%gsr, %o5
	.word	0xada01930	! t0_kref+0x20a4:   	fstod	%f16, %f22
	.word	0x93b3049c	! t0_kref+0x20a8:   	fcmple32	%f12, %f28, %o1
	.word	0xa1a000ab	! t0_kref+0x20ac:   	fnegs	%f11, %f16
	.word	0x90d3400c	! t0_kref+0x20b0:   	umulcc	%o5, %o4, %o0
	.word	0x86102002	! t0_kref+0x20b4:   	mov	0x2, %g3
	.word	0x86a0e001	! t0_kref+0x20b8:   	subcc	%g3, 1, %g3
	.word	0x2280001e	! t0_kref+0x20bc:   	be,a	_kref+0x2134
	.word	0xf8364000	! t0_kref+0x20c0:   	sth	%i4, [%i1]
	.word	0x9022800d	! t0_kref+0x20c4:   	sub	%o2, %o5, %o0
	.word	0xa9b4091c	! t0_kref+0x20c8:   	faligndata	%f16, %f28, %f20
	.word	0xb1b00f10	! t0_kref+0x20cc:   	fsrc2	%f16, %f24
	.word	0xd01f4019	! t0_kref+0x20d0:   	ldd	[%i5 + %i1], %o0
	.word	0x96bb001b	! t0_kref+0x20d4:   	xnorcc	%o4, %i3, %o3
	.word	0x9652400d	! t0_kref+0x20d8:   	umul	%o1, %o5, %o3
	.word	0x23480003	! t0_kref+0x20dc:   	fbne,a,pt	%fcc0, _kref+0x20e8
	.word	0x9676a11e	! t0_kref+0x20e0:   	udiv	%i2, 0x11e, %o3
	.word	0xab3a800b	! t0_kref+0x20e4:   	sra	%o2, %o3, %l5
	.word	0x81ae0a2f	! t0_kref+0x20e8:   	fcmps	%fcc0, %f24, %f15
	.word	0xd706401c	! t0_kref+0x20ec:   	ld	[%i1 + %i4], %f11
	.word	0xada00558	! t0_kref+0x20f0:   	fsqrtd	%f24, %f22
	.word	0x99b00c20	! t0_kref+0x20f4:   	fzeros	%f12
	.word	0xda00a000	! t0_kref+0x20f8:   	ld	[%g2], %o5
	.word	0xad36c01a	! t0_kref+0x20fc:   	srl	%i3, %i2, %l6
	.word	0x3c4fffee	! t0_kref+0x2100:   	bpos,a,pt	%icc, _kref+0x20b8
	.word	0xa5b00cd4	! t0_kref+0x2104:   	fnot2	%f20, %f18
	.word	0x9da00554	! t0_kref+0x2108:   	fsqrtd	%f20, %f14
	.word	0x9b32800d	! t0_kref+0x210c:   	srl	%o2, %o5, %o5
	.word	0x95a30d30	! t0_kref+0x2110:   	fsmuld	%f12, %f16, %f10
	.word	0xd208a018	! t0_kref+0x2114:   	ldub	[%g2 + 0x18], %o1
	.word	0xa9b24240	! t0_kref+0x2118:   	array16	%o1, %g0, %l4
	.word	0x9fb58e6f	! t0_kref+0x211c:   	fxnors	%f22, %f15, %f15
	.word	0x9907000c	! t0_kref+0x2120:   	taddcc	%i4, %o4, %o4
	.word	0xfb262004	! t0_kref+0x2124:   	st	%f29, [%i0 + 4]
	.word	0xaaa025a6	! t0_kref+0x2128:   	subcc	%g0, 0x5a6, %l5
	.word	0xaf330000	! t0_kref+0x212c:   	srl	%o4, %g0, %l7
	.word	0xaa66bc21	! t0_kref+0x2130:   	subc	%i2, -0x3df, %l5
	.word	0x9940c000	! t0_kref+0x2134:   	mov	%asi, %o4
	.word	0x9456af85	! t0_kref+0x2138:   	umul	%i2, 0xf85, %o2
	.word	0x36800006	! t0_kref+0x213c:   	bge,a	_kref+0x2154
	.word	0xa9a01a30	! t0_kref+0x2140:   	fstoi	%f16, %f20
	.word	0xa9b60a9c	! t0_kref+0x2144:   	fpsub16	%f24, %f28, %f20
	.word	0xa9a0054c	! t0_kref+0x2148:   	fsqrtd	%f12, %f20
	.word	0x81ab0a5c	! t0_kref+0x214c:   	fcmpd	%fcc0, %f12, %f28
	.word	0x9544c000	! t0_kref+0x2150:   	mov	%gsr, %o2
	.word	0x973ae002	! t0_kref+0x2154:   	sra	%o3, 0x2, %o3
	.word	0x9da01937	! t0_kref+0x2158:   	fstod	%f23, %f14
	.word	0xd010a020	! t0_kref+0x215c:   	lduh	[%g2 + 0x20], %o0
	.word	0xed6e401c	! t0_kref+0x2160:   	prefetch	%i1 + %i4, 22
	.word	0xda262018	! t0_kref+0x2164:   	st	%o5, [%i0 + 0x18]
	.word	0x81b01020	! t0_kref+0x2168:   	siam	0x0
	.word	0xadb30492	! t0_kref+0x216c:   	fcmple32	%f12, %f18, %l6
	.word	0xb1b64efc	! t0_kref+0x2170:   	fornot2s	%f25, %f28, %f24
	.word	0x99a018d6	! t0_kref+0x2174:   	fdtos	%f22, %f12
	.word	0x24800005	! t0_kref+0x2178:   	ble,a	_kref+0x218c
	.word	0xa1a000b5	! t0_kref+0x217c:   	fnegs	%f21, %f16
	.word	0xe168a10f	! t0_kref+0x2180:   	prefetch	%g2 + 0x10f, 16
	.word	0x8143c000	! t0_kref+0x2184:   	stbar
	.word	0x90f7348a	! t0_kref+0x2188:   	udivcc	%i4, -0xb76, %o0
	.word	0xd416c018	! t0_kref+0x218c:   	lduh	[%i3 + %i0], %o2
	.word	0x9de3bfa0	! t0_kref+0x2190:   	save	%sp, -0x60, %sp
	.word	0xb82e4018	! t0_kref+0x2194:   	andn	%i1, %i0, %i4
	.word	0x95eec01b	! t0_kref+0x2198:   	restore	%i3, %i3, %o2
	.word	0x9de3bfa0	! t0_kref+0x219c:   	save	%sp, -0x60, %sp
	.word	0x8036726c	! t0_kref+0x21a0:   	orn	%i1, -0xd94, %g0
	.word	0xafee001c	! t0_kref+0x21a4:   	restore	%i0, %i4, %l7
	.word	0x95a4084e	! t0_kref+0x21a8:   	faddd	%f16, %f14, %f10
	.word	0x34800002	! t0_kref+0x21ac:   	bg,a	_kref+0x21b4
	.word	0x93400000	! t0_kref+0x21b0:   	mov	%y, %o1
	.word	0x9db506f4	! t0_kref+0x21b4:   	fmul8ulx16	%f20, %f20, %f14
	.word	0x81ae8a5a	! t0_kref+0x21b8:   	fcmpd	%fcc0, %f26, %f26
	.word	0xb3b74ab8	! t0_kref+0x21bc:   	fpsub16s	%f29, %f24, %f25
	.word	0xd8060000	! t0_kref+0x21c0:   	ld	[%i0], %o4
	.word	0xac9f400a	! t0_kref+0x21c4:   	xorcc	%i5, %o2, %l6
	.word	0xb1a01a36	! t0_kref+0x21c8:   	fstoi	%f22, %f24
	.word	0xd4366010	! t0_kref+0x21cc:   	sth	%o2, [%i1 + 0x10]
	.word	0xd0480018	! t0_kref+0x21d0:   	ldsb	[%g0 + %i0], %o0
	.word	0xd206001c	! t0_kref+0x21d4:   	ld	[%i0 + %i4], %o1
	.word	0xc036c019	! t0_kref+0x21d8:   	clrh	[%i3 + %i1]
	.word	0xd81e2010	! t0_kref+0x21dc:   	ldd	[%i0 + 0x10], %o4
	.word	0xa1a0055a	! t0_kref+0x21e0:   	fsqrtd	%f26, %f16
	.word	0x85803d9d	! t0_kref+0x21e4:   	mov	0xfffffd9d, %ccr
	.word	0x99b5c72b	! t0_kref+0x21e8:   	fmuld8ulx16	%f23, %f11, %f12
	.word	0x81df4015	! t0_kref+0x21ec:   	flush	%i5 + %l5
	.word	0xb5a74836	! t0_kref+0x21f0:   	fadds	%f29, %f22, %f26
	.word	0xa9a2cd3d	! t0_kref+0x21f4:   	fsmuld	%f11, %f29, %f20
	.word	0x91b50410	! t0_kref+0x21f8:   	fcmple16	%f20, %f16, %o0
	.word	0x81da8019	! t0_kref+0x21fc:   	flush	%o2 + %i1
	.word	0xf1801018	! t0_kref+0x2200:   	lda	[%g0 + %i0]0x80, %f24
	.word	0x99b34ded	! t0_kref+0x2204:   	fnands	%f13, %f13, %f12
	.word	0xae53001d	! t0_kref+0x2208:   	umul	%o4, %i5, %l7
	.word	0xf51e2000	! t0_kref+0x220c:   	ldd	[%i0], %f26
	.word	0x27480003	! t0_kref+0x2210:   	fbul,a,pt	%fcc0, _kref+0x221c
	.word	0xb3a01a54	! t0_kref+0x2214:   	fdtoi	%f20, %f25
	.word	0xf620a010	! t0_kref+0x2218:   	st	%i3, [%g2 + 0x10]
	.word	0x33480004	! t0_kref+0x221c:   	fbe,a,pt	%fcc0, _kref+0x222c
	.word	0xf1ee501b	! t0_kref+0x2220:   	prefetcha	%i1 + %i3, 24
	.word	0x9af36b7d	! t0_kref+0x2224:   	udivcc	%o5, 0xb7d, %o5
	.word	0x9fa60832	! t0_kref+0x2228:   	fadds	%f24, %f18, %f15
	.word	0xd01e3fe0	! t0_kref+0x222c:   	ldd	[%i0 - 0x20], %o0
	.word	0x2d480002	! t0_kref+0x2230:   	fbg,a,pt	%fcc0, _kref+0x2238
	.word	0x9db386fa	! t0_kref+0x2234:   	fmul8ulx16	%f14, %f26, %f14
	.word	0x965335b4	! t0_kref+0x2238:   	umul	%o4, -0xa4c, %o3
	.word	0xb1b30c98	! t0_kref+0x223c:   	fandnot2	%f12, %f24, %f24
	.word	0x96bb400d	! t0_kref+0x2240:   	xnorcc	%o5, %o5, %o3
	.word	0x99b3cef5	! t0_kref+0x2244:   	fornot2s	%f15, %f21, %f12
	.word	0xda50a022	! t0_kref+0x2248:   	ldsh	[%g2 + 0x22], %o5
	.word	0xa1b50a98	! t0_kref+0x224c:   	fpsub16	%f20, %f24, %f16
	.word	0x90bf7be8	! t0_kref+0x2250:   	xnorcc	%i5, -0x418, %o0
	.word	0xe91fbe28	! t0_kref+0x2254:   	ldd	[%fp - 0x1d8], %f20
	.word	0xaa332b38	! t0_kref+0x2258:   	orn	%o4, 0xb38, %l5
	.word	0xd0be1000	! t0_kref+0x225c:   	stda	%o0, [%i0]0x80
	.word	0x90e2b6b4	! t0_kref+0x2260:   	subccc	%o2, -0x94c, %o0
	.word	0x9a3ec01b	! t0_kref+0x2264:   	xnor	%i3, %i3, %o5
	.word	0x9fc00004	! t0_kref+0x2268:   	call	%g0 + %g4
	.word	0x9456f5e1	! t0_kref+0x226c:   	umul	%i3, -0xa1f, %o2
	.word	0xa9408000	! t0_kref+0x2270:   	mov	%ccr, %l4
	.word	0x972b001c	! t0_kref+0x2274:   	sll	%o4, %i4, %o3
	.word	0xad36c00c	! t0_kref+0x2278:   	srl	%i3, %o4, %l6
	.word	0x97a000b9	! t0_kref+0x227c:   	fnegs	%f25, %f11
	.word	0xa5b5cfbc	! t0_kref+0x2280:   	fors	%f23, %f28, %f18
	.word	0xda30a038	! t0_kref+0x2284:   	sth	%o5, [%g2 + 0x38]
	.word	0xb5a74937	! t0_kref+0x2288:   	fmuls	%f29, %f23, %f26
	.word	0x21800003	! t0_kref+0x228c:   	fbn,a	_kref+0x2298
	.word	0xfa366010	! t0_kref+0x2290:   	sth	%i5, [%i1 + 0x10]
	.word	0x9db4890c	! t0_kref+0x2294:   	faligndata	%f18, %f12, %f14
	.word	0xc06e001a	! t0_kref+0x2298:   	ldstub	[%i0 + %i2], %g0
	.word	0xa7aa002f	! t0_kref+0x229c:   	fmovsa	%fcc0, %f15, %f19
	.word	0x94583e80	! t0_kref+0x22a0:   	smul	%g0, -0x180, %o2
	.word	0x98576330	! t0_kref+0x22a4:   	umul	%i5, 0x330, %o4
	.word	0x92a6fd3a	! t0_kref+0x22a8:   	subcc	%i3, -0x2c6, %o1
	.word	0xb9b58e80	! t0_kref+0x22ac:   	fsrc1	%f22, %f28
	.word	0xc398a080	! t0_kref+0x22b0:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0x92382cde	! t0_kref+0x22b4:   	xnor	%g0, 0xcde, %o1
	.word	0x2e480003	! t0_kref+0x22b8:   	bvs,a,pt	%icc, _kref+0x22c4
	.word	0xfb063fe0	! t0_kref+0x22bc:   	ld	[%i0 - 0x20], %f29
	.word	0xada000d2	! t0_kref+0x22c0:   	fnegd	%f18, %f22
	.word	0xd248a031	! t0_kref+0x22c4:   	ldsb	[%g2 + 0x31], %o1
	.word	0xedee101c	! t0_kref+0x22c8:   	prefetcha	%i0 + %i4, 22
	.word	0x99a018da	! t0_kref+0x22cc:   	fdtos	%f26, %f12
	.word	0x9da6084a	! t0_kref+0x22d0:   	faddd	%f24, %f10, %f14
	.word	0xd9a71018	! t0_kref+0x22d4:   	sta	%f12, [%i4 + %i0]0x80
	.word	0xac772e74	! t0_kref+0x22d8:   	udiv	%i4, 0xe74, %l6
	.word	0x25480004	! t0_kref+0x22dc:   	fblg,a,pt	%fcc0, _kref+0x22ec
	.word	0x909aa958	! t0_kref+0x22e0:   	xorcc	%o2, 0x958, %o0
	.word	0xef6e3ff0	! t0_kref+0x22e4:   	prefetch	%i0 - 0x10, 23
	.word	0xb1b50f8e	! t0_kref+0x22e8:   	for	%f20, %f14, %f24
	.word	0xadb009b6	! t0_kref+0x22ec:   	fexpand	%f22, %f22
	.word	0x23480001	! t0_kref+0x22f0:   	fbne,a,pt	%fcc0, _kref+0x22f4
	.word	0xf99e101d	! t0_kref+0x22f4:   	ldda	[%i0 + %i5]0x80, %f28
	.word	0xad282019	! t0_kref+0x22f8:   	sll	%g0, 0x19, %l6
	.word	0x81ac0ace	! t0_kref+0x22fc:   	fcmped	%fcc0, %f16, %f14
	.word	0xf520a020	! t0_kref+0x2300:   	st	%f26, [%g2 + 0x20]
	.word	0xb1b60ad6	! t0_kref+0x2304:   	fpsub32	%f24, %f22, %f24
	.word	0x9de3bfa0	! t0_kref+0x2308:   	save	%sp, -0x60, %sp
	.word	0xafee001d	! t0_kref+0x230c:   	restore	%i0, %i5, %l7
	.word	0x96583b07	! t0_kref+0x2310:   	smul	%g0, -0x4f9, %o3
	.word	0xec1e2018	! t0_kref+0x2314:   	ldd	[%i0 + 0x18], %l6
	.word	0x9fc00004	! t0_kref+0x2318:   	call	%g0 + %g4
	.word	0x8586b3c2	! t0_kref+0x231c:   	wr	%i2, 0xfffff3c2, %ccr
	.word	0x940b4009	! t0_kref+0x2320:   	and	%o5, %o1, %o2
	.word	0x99400000	! t0_kref+0x2324:   	mov	%y, %o4
	.word	0xed9e101d	! t0_kref+0x2328:   	ldda	[%i0 + %i5]0x80, %f22
	.word	0x9ba0109c	! t0_kref+0x232c:   	fxtos	%f28, %f13
	.word	0x9de3bfa0	! t0_kref+0x2330:   	save	%sp, -0x60, %sp
	.word	0xb0d6b217	! t0_kref+0x2334:   	umulcc	%i2, -0xde9, %i0
	.word	0xa9ee801a	! t0_kref+0x2338:   	restore	%i2, %i2, %l4
	.word	0xed1e3fe0	! t0_kref+0x233c:   	ldd	[%i0 - 0x20], %f22
	.word	0x81dc800d	! t0_kref+0x2340:   	flush	%l2 + %o5
	.word	0x92bf31fc	! t0_kref+0x2344:   	xnorcc	%i4, -0xe04, %o1
	.word	0xc398a080	! t0_kref+0x2348:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0xf900a018	! t0_kref+0x234c:   	ld	[%g2 + 0x18], %f28
	.word	0x81d83da5	! t0_kref+0x2350:   	flush	%g0 - 0x25b
	.word	0xada609d4	! t0_kref+0x2354:   	fdivd	%f24, %f20, %f22
	.word	0x8143c000	! t0_kref+0x2358:   	stbar
	.word	0xda0e401a	! t0_kref+0x235c:   	ldub	[%i1 + %i2], %o5
	.word	0xb1a6885a	! t0_kref+0x2360:   	faddd	%f26, %f26, %f24
	.word	0xbbb00c20	! t0_kref+0x2364:   	fzeros	%f29
	.word	0xc398a080	! t0_kref+0x2368:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0x94f7693a	! t0_kref+0x236c:   	udivcc	%i5, 0x93a, %o2
	.word	0x9228001b	! t0_kref+0x2370:   	andn	%g0, %i3, %o1
	.word	0x97a000b3	! t0_kref+0x2374:   	fnegs	%f19, %f11
	.word	0xac5a400c	! t0_kref+0x2378:   	smul	%o1, %o4, %l6
	.word	0x94f6bd2e	! t0_kref+0x237c:   	udivcc	%i2, -0x2d2, %o2
	.word	0xe81e4000	! t0_kref+0x2380:   	ldd	[%i1], %l4
	.word	0xa5b68ad2	! t0_kref+0x2384:   	fpsub32	%f26, %f18, %f18
	.word	0xb9a0054c	! t0_kref+0x2388:   	fsqrtd	%f12, %f28
	.word	0xb9a0193a	! t0_kref+0x238c:   	fstod	%f26, %f28
	.word	0x26800004	! t0_kref+0x2390:   	bl,a	_kref+0x23a0
	.word	0x94da7c28	! t0_kref+0x2394:   	smulcc	%o1, -0x3d8, %o2
	.word	0xc398a080	! t0_kref+0x2398:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0xd6ee101a	! t0_kref+0x239c:   	ldstuba	[%i0 + %i2]0x80, %o3
	.word	0x90f6c000	! t0_kref+0x23a0:   	udivcc	%i3, %g0, %o0
	.word	0xa8377241	! t0_kref+0x23a4:   	orn	%i5, -0xdbf, %l4
	.word	0xa827001a	! t0_kref+0x23a8:   	sub	%i4, %i2, %l4
	.word	0xe76e2010	! t0_kref+0x23ac:   	prefetch	%i0 + 0x10, 19
	.word	0xacaf7872	! t0_kref+0x23b0:   	andncc	%i5, -0x78e, %l6
	.word	0x35480002	! t0_kref+0x23b4:   	fbue,a,pt	%fcc0, _kref+0x23bc
	.word	0xa5b58fb7	! t0_kref+0x23b8:   	fors	%f22, %f23, %f18
	.word	0x8143c000	! t0_kref+0x23bc:   	stbar
	.word	0xe8ff1019	! t0_kref+0x23c0:   	swapa	[%i4 + %i1]0x80, %l4
	.word	0x9bb3001d	! t0_kref+0x23c4:   	edge8	%o4, %i5, %o5
	.word	0x98ba7d07	! t0_kref+0x23c8:   	xnorcc	%o1, -0x2f9, %o4
	.word	0x91b0017b	! t0_kref+0x23cc:   	edge32ln	%g0, %i3, %o0
	.word	0x3c800008	! t0_kref+0x23d0:   	bpos,a	_kref+0x23f0
	.word	0xd000a038	! t0_kref+0x23d4:   	ld	[%g2 + 0x38], %o0
	.word	0xa1a0055c	! t0_kref+0x23d8:   	fsqrtd	%f28, %f16
	.word	0xe86e3ff8	! t0_kref+0x23dc:   	ldstub	[%i0 - 8], %l4
	.word	0x81de8004	! t0_kref+0x23e0:   	flush	%i2 + %g4
	.word	0x91b2410a	! t0_kref+0x23e4:   	edge32	%o1, %o2, %o0
	.word	0x9a20000b	! t0_kref+0x23e8:   	neg	%o3, %o5
	.word	0x92883b0b	! t0_kref+0x23ec:   	andcc	%g0, -0x4f5, %o1
	sethi	%hi(1f), %o7
	jmpl	%o7+%lo(1f), %g1
	.empty
	.word	0xa7a2c93a	! t0_kref+0x23f8:   	fmuls	%f11, %f26, %f19
1:	.word	0xf11e3fe8	! t0_kref+0x23fc:   	ldd	[%i0 - 0x18], %f24
	.word	0x99b3c6bd	! t0_kref+0x2400:   	fmul8x16al	%f15, %f29, %f12
	.word	0xb1a0191b	! t0_kref+0x2404:   	fitod	%f27, %f24
	.word	0x34480007	! t0_kref+0x2408:   	bg,a,pt	%icc, _kref+0x2424
	.word	0x8143c000	! t0_kref+0x240c:   	stbar
	.word	0x97b3430d	! t0_kref+0x2410:   	alignaddr	%o5, %o5, %o3
	.word	0xa8a68000	! t0_kref+0x2414:   	subcc	%i2, %g0, %l4
	.word	0xa8b333ba	! t0_kref+0x2418:   	orncc	%o4, -0xc46, %l4
	.word	0x9b44c000	! t0_kref+0x241c:   	mov	%gsr, %o5
	.word	0x9257401d	! t0_kref+0x2420:   	umul	%i5, %i5, %o1
	.word	0xfa2e601e	! t0_kref+0x2424:   	stb	%i5, [%i1 + 0x1e]
	.word	0x99b007b2	! t0_kref+0x2428:   	fpackfix	%f18, %f12
	.word	0xe3b8a040	! t0_kref+0x242c:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x95400000	! t0_kref+0x2430:   	mov	%y, %o2
	.word	0xef06001c	! t0_kref+0x2434:   	ld	[%i0 + %i4], %f23
	.word	0xf520a000	! t0_kref+0x2438:   	st	%f26, [%g2]
	.word	0xed067ff4	! t0_kref+0x243c:   	ld	[%i1 - 0xc], %f22
	.word	0xa5a5c92b	! t0_kref+0x2440:   	fmuls	%f23, %f11, %f18
	.word	0xe800a020	! t0_kref+0x2444:   	ld	[%g2 + 0x20], %l4
	.word	0xec167fea	! t0_kref+0x2448:   	lduh	[%i1 - 0x16], %l6
	.word	0x97a7492d	! t0_kref+0x244c:   	fmuls	%f29, %f13, %f11
	.word	0x962a77cd	! t0_kref+0x2450:   	andn	%o1, -0x833, %o3
	.word	0xa5a588d2	! t0_kref+0x2454:   	fsubd	%f22, %f18, %f18
	.word	0x9bb3050a	! t0_kref+0x2458:   	fcmpgt16	%f12, %f10, %o5
	.word	0xd0f81019	! t0_kref+0x245c:   	swapa	[%g0 + %i1]0x80, %o0
	.word	0xae327867	! t0_kref+0x2460:   	orn	%o1, -0x799, %l7
	.word	0x8143c000	! t0_kref+0x2464:   	stbar
	.word	0x92a83264	! t0_kref+0x2468:   	andncc	%g0, -0xd9c, %o1
	.word	0x2a480001	! t0_kref+0x246c:   	bcs,a,pt	%icc, _kref+0x2470
	.word	0xa8aebcd6	! t0_kref+0x2470:   	andncc	%i2, -0x32a, %l4
	.word	0xe9bf1a59	! t0_kref+0x2474:   	stda	%f20, [%i4 + %i1]0xd2
	.word	0xe40860c0	! t0_kref+0x2478:   	ldub	[%g1 + 0xc0], %l2
	.word	0xa41ca00c	! t0_kref+0x247c:   	xor	%l2, 0xc, %l2
	.word	0xe42860c0	! t0_kref+0x2480:   	stb	%l2, [%g1 + 0xc0]
	.word	0x81d860c0	! t0_kref+0x2484:   	flush	%g1 + 0xc0
	.word	0xa5a0054c	! t0_kref+0x2488:   	fsqrtd	%f12, %f18
	.word	0x9abb6bac	! t0_kref+0x248c:   	xnorcc	%o5, 0xbac, %o5
	.word	0xf9be1a1c	! t0_kref+0x2490:   	stda	%f28, [%i0 + %i4]0xd0
	.word	0xf53e2008	! t0_kref+0x2494:   	std	%f26, [%i0 + 8]
	.word	0xaa9f3ad2	! t0_kref+0x2498:   	xorcc	%i4, -0x52e, %l5
	.word	0x96a6c00a	! t0_kref+0x249c:   	subcc	%i3, %o2, %o3
	.word	0xae5f0009	! t0_kref+0x24a0:   	smul	%i4, %o1, %l7
	.word	0xa5a00037	! t0_kref+0x24a4:   	fmovs	%f23, %f18
	.word	0x99a01937	! t0_kref+0x24a8:   	fstod	%f23, %f12
	.word	0xa1a00033	! t0_kref+0x24ac:   	fmovs	%f19, %f16
	.word	0x90277eed	! t0_kref+0x24b0:   	sub	%i5, -0x113, %o0
2:	.word	0xad40c000	! t0_kref+0x24b4:   	mov	%asi, %l6
	.word	0xc568a08c	! t0_kref+0x24b8:   	prefetch	%g2 + 0x8c, 2
	.word	0x96d834d8	! t0_kref+0x24bc:   	smulcc	%g0, -0xb28, %o3
	.word	0x9ba448bd	! t0_kref+0x24c0:   	fsubs	%f17, %f29, %f13
	.word	0x9847000a	! t0_kref+0x24c4:   	addc	%i4, %o2, %o4
	.word	0xb9a00556	! t0_kref+0x24c8:   	fsqrtd	%f22, %f28
	.word	0x9de3bfa0	! t0_kref+0x24cc:   	save	%sp, -0x60, %sp
	.word	0x99ef4000	! t0_kref+0x24d0:   	restore	%i5, %g0, %o4
	.word	0xa5b00c20	! t0_kref+0x24d4:   	fzeros	%f18
	.word	0xadb70e80	! t0_kref+0x24d8:   	fsrc1	%f28, %f22
	.word	0x9da0105a	! t0_kref+0x24dc:   	fdtox	%f26, %f14
	.word	0x9b400000	! t0_kref+0x24e0:   	mov	%y, %o5
	.word	0x2b480007	! t0_kref+0x24e4:   	fbug,a,pt	%fcc0, _kref+0x2500
	.word	0xfb6e001b	! t0_kref+0x24e8:   	prefetch	%i0 + %i3, 29
	.word	0x98d72c6c	! t0_kref+0x24ec:   	umulcc	%i4, 0xc6c, %o4
	.word	0x9056ba42	! t0_kref+0x24f0:   	umul	%i2, -0x5be, %o0
	.word	0xabb7417b	! t0_kref+0x24f4:   	edge32ln	%i5, %i3, %l5
	.word	0xd41e401d	! t0_kref+0x24f8:   	ldd	[%i1 + %i5], %o2
	.word	0x9db4098e	! t0_kref+0x24fc:   	bshuffle	%f16, %f14, %f14
	.word	0xe9be180b	! t0_kref+0x2500:   	stda	%f20, [%i0 + %o3]0xc0
	.word	0xad3b000b	! t0_kref+0x2504:   	sra	%o4, %o3, %l6
	.word	0xc398a080	! t0_kref+0x2508:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0x9258001a	! t0_kref+0x250c:   	smul	%g0, %i2, %o1
	.word	0xaca30000	! t0_kref+0x2510:   	subcc	%o4, %g0, %l6
	.word	0xf920a030	! t0_kref+0x2514:   	st	%f28, [%g2 + 0x30]
	.word	0x990ac00b	! t0_kref+0x2518:   	tsubcc	%o3, %o3, %o4
	.word	0xe56e7ff8	! t0_kref+0x251c:   	prefetch	%i1 - 8, 18
	.word	0xaedec01b	! t0_kref+0x2520:   	smulcc	%i3, %i3, %l7
	.word	0xd240a028	! t0_kref+0x2524:   	ldsw	[%g2 + 0x28], %o1
	.word	0xd900a008	! t0_kref+0x2528:   	ld	[%g2 + 8], %f12
	.word	0xadb40ed4	! t0_kref+0x252c:   	fornot2	%f16, %f20, %f22
	.word	0xc398a080	! t0_kref+0x2530:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0x9832a0cd	! t0_kref+0x2534:   	orn	%o2, 0xcd, %o4
	.word	0xa8037da5	! t0_kref+0x2538:   	add	%o5, -0x25b, %l4
	.word	0xac82feb5	! t0_kref+0x253c:   	addcc	%o3, -0x14b, %l6
	.word	0xada00539	! t0_kref+0x2540:   	fsqrts	%f25, %f22
	.word	0x86102004	! t0_kref+0x2544:   	mov	0x4, %g3
	.word	0x86a0e001	! t0_kref+0x2548:   	subcc	%g3, 1, %g3
	.word	0x22800004	! t0_kref+0x254c:   	be,a	_kref+0x255c
	.word	0x90376eaf	! t0_kref+0x2550:   	orn	%i5, 0xeaf, %o0
	.word	0xdd062018	! t0_kref+0x2554:   	ld	[%i0 + 0x18], %f14
	.word	0xb5a30d34	! t0_kref+0x2558:   	fsmuld	%f12, %f20, %f26
	.word	0x81ad0a5c	! t0_kref+0x255c:   	fcmpd	%fcc0, %f20, %f28
	.word	0xac0aafd7	! t0_kref+0x2560:   	and	%o2, 0xfd7, %l6
	.word	0xe3b8a040	! t0_kref+0x2564:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xe81e2000	! t0_kref+0x2568:   	ldd	[%i0], %l4
	.word	0xac06a9bc	! t0_kref+0x256c:   	add	%i2, 0x9bc, %l6
	.word	0x9692fff5	! t0_kref+0x2570:   	orcc	%o3, -0xb, %o3
	.word	0x9fc10000	! t0_kref+0x2574:   	call	%g4
	.word	0xb7a018d8	! t0_kref+0x2578:   	fdtos	%f24, %f27
	.word	0xafb74280	! t0_kref+0x257c:   	array32	%i5, %g0, %l7
	.word	0x81ab0ad4	! t0_kref+0x2580:   	fcmped	%fcc0, %f12, %f20
	.word	0x9db68f6d	! t0_kref+0x2584:   	fornot1s	%f26, %f13, %f14
	.word	0xa7b00f39	! t0_kref+0x2588:   	fsrc2s	%f25, %f19
	.word	0xee5e3fe8	! t0_kref+0x258c:   	ldx	[%i0 - 0x18], %l7
	.word	0xaae2c000	! t0_kref+0x2590:   	subccc	%o3, %g0, %l5
	.word	0xd04e7fea	! t0_kref+0x2594:   	ldsb	[%i1 - 0x16], %o0
	.word	0xf19e5a5d	! t0_kref+0x2598:   	ldda	[%i1 + %i5]0xd2, %f24
	.word	0xaba00539	! t0_kref+0x259c:   	fsqrts	%f25, %f21
	.word	0xab336000	! t0_kref+0x25a0:   	srl	%o5, 0x0, %l5
	.word	0x9936801d	! t0_kref+0x25a4:   	srl	%i2, %i5, %o4
	.word	0x967ec000	! t0_kref+0x25a8:   	sdiv	%i3, %g0, %o3
	.word	0xd6080019	! t0_kref+0x25ac:   	ldub	[%g0 + %i1], %o3
	.word	0xb1a309d2	! t0_kref+0x25b0:   	fdivd	%f12, %f18, %f24
	.word	0x81ad8abc	! t0_kref+0x25b4:   	fcmpes	%fcc0, %f22, %f28
	.word	0x33480001	! t0_kref+0x25b8:   	fbe,a,pt	%fcc0, _kref+0x25bc
	.word	0xe1be188c	! t0_kref+0x25bc:   	stda	%f16, [%i0 + %o4]0xc4
	.word	0xa9a01a5c	! t0_kref+0x25c0:   	fdtoi	%f28, %f20
	sethi	%hi(2f), %o7
	.word	0xe40be1fc	! t0_kref+0x25c8:   	ldub	[%o7 + 0x1fc], %l2
	.word	0xa41ca00c	! t0_kref+0x25cc:   	xor	%l2, 0xc, %l2
	.word	0xe42be1fc	! t0_kref+0x25d0:   	stb	%l2, [%o7 + 0x1fc]
	.word	0x81dbe1fc	! t0_kref+0x25d4:   	flush	%o7 + 0x1fc
	.word	0xb7b64fb9	! t0_kref+0x25d8:   	fors	%f25, %f25, %f27
	.word	0x9b400000	! t0_kref+0x25dc:   	mov	%y, %o5
	.word	0xd2881018	! t0_kref+0x25e0:   	lduba	[%g0 + %i0]0x80, %o1
	.word	0x8143c000	! t0_kref+0x25e4:   	stbar
	.word	0xf436c019	! t0_kref+0x25e8:   	sth	%i2, [%i3 + %i1]
	.word	0xf8363fee	! t0_kref+0x25ec:   	sth	%i4, [%i0 - 0x12]
	.word	0x81abca2e	! t0_kref+0x25f0:   	fcmps	%fcc0, %f15, %f14
	.word	0xb5a01918	! t0_kref+0x25f4:   	fitod	%f24, %f26
	.word	0xa5a01919	! t0_kref+0x25f8:   	fitod	%f25, %f18
2:	.word	0x96a2c01a	! t0_kref+0x25fc:   	subcc	%o3, %i2, %o3
	.word	0xa1a00539	! t0_kref+0x2600:   	fsqrts	%f25, %f16
	.word	0xd42e201f	! t0_kref+0x2604:   	stb	%o2, [%i0 + 0x1f]
	.word	0x81dc801f	! t0_kref+0x2608:   	flush	%l2 + %i7
	.word	0xb9b00f0e	! t0_kref+0x260c:   	fsrc2	%f14, %f28
	.word	0xab63401b	! t0_kref+0x2610:   	movle	%fcc0, %i3, %l5
	.word	0xeb68a084	! t0_kref+0x2614:   	prefetch	%g2 + 0x84, 21
	.word	0x9da00052	! t0_kref+0x2618:   	fmovd	%f18, %f14
	.word	0x9852c01a	! t0_kref+0x261c:   	umul	%o3, %i2, %o4
	.word	0xb9a389da	! t0_kref+0x2620:   	fdivd	%f14, %f26, %f28
	.word	0xa5a0190f	! t0_kref+0x2624:   	fitod	%f15, %f18
	.word	0xb5a018d4	! t0_kref+0x2628:   	fdtos	%f20, %f26
	.word	0x9da349b7	! t0_kref+0x262c:   	fdivs	%f13, %f23, %f14
	.word	0xabb2413a	! t0_kref+0x2630:   	edge32n	%o1, %i2, %l5
	.word	0x9de3bfa0	! t0_kref+0x2634:   	save	%sp, -0x60, %sp
	.word	0xb8364018	! t0_kref+0x2638:   	orn	%i1, %i0, %i4
	.word	0x97eee242	! t0_kref+0x263c:   	restore	%i3, 0x242, %o3
	.word	0xa1a000bb	! t0_kref+0x2640:   	fnegs	%f27, %f16
	.word	0xf207bfe0	! t0_kref+0x2644:   	ld	[%fp - 0x20], %i1
	.word	0x1330e9fb	! t0_kref+0x2648:   	sethi	%hi(0xc3a7ec00), %o1
	.word	0xa5b30679	! t0_kref+0x264c:   	fmul8x16au	%f12, %f25, %f18
	.word	0xd42e401a	! t0_kref+0x2650:   	stb	%o2, [%i1 + %i2]
	.word	0xa8d6c00d	! t0_kref+0x2654:   	umulcc	%i3, %o5, %l4
	.word	0xb5a0054c	! t0_kref+0x2658:   	fsqrtd	%f12, %f26
	.word	0x86102015	! t0_kref+0x265c:   	mov	0x15, %g3
	.word	0x86a0e001	! t0_kref+0x2660:   	subcc	%g3, 1, %g3
	.word	0x22800010	! t0_kref+0x2664:   	be,a	_kref+0x26a4
	.word	0xb9a018d4	! t0_kref+0x2668:   	fdtos	%f20, %f28
	.word	0xad32401d	! t0_kref+0x266c:   	srl	%o1, %i5, %l6
	.word	0xd4d6d040	! t0_kref+0x2670:   	ldsha	[%i3]0x82, %o2
	.word	0xdd00a000	! t0_kref+0x2674:   	ld	[%g2], %f14
	.word	0xe8881018	! t0_kref+0x2678:   	lduba	[%g0 + %i0]0x80, %l4
	.word	0x97a01a3a	! t0_kref+0x267c:   	fstoi	%f26, %f11
	.word	0xac06fa54	! t0_kref+0x2680:   	add	%i3, -0x5ac, %l6
	.word	0x95b60552	! t0_kref+0x2684:   	fcmpeq16	%f24, %f18, %o2
	.word	0x99b68912	! t0_kref+0x2688:   	faligndata	%f26, %f18, %f12
	.word	0xe168a08e	! t0_kref+0x268c:   	prefetch	%g2 + 0x8e, 16
	.word	0xadb30240	! t0_kref+0x2690:   	array16	%o4, %g0, %l6
	.word	0xec4e0000	! t0_kref+0x2694:   	ldsb	[%i0], %l6
	.word	0xda50a03a	! t0_kref+0x2698:   	ldsh	[%g2 + 0x3a], %o5
	.word	0xa1a2c931	! t0_kref+0x269c:   	fmuls	%f11, %f17, %f16
	.word	0xa1a589d2	! t0_kref+0x26a0:   	fdivd	%f22, %f18, %f16
	.word	0xc0f81018	! t0_kref+0x26a4:   	swapa	[%g0 + %i0]0x80, %g0
	.word	0xee6e401a	! t0_kref+0x26a8:   	ldstub	[%i1 + %i2], %l7
	.word	0xe3b8a040	! t0_kref+0x26ac:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xa8a0000b	! t0_kref+0x26b0:   	subcc	%g0, %o3, %l4
	.word	0x9da01932	! t0_kref+0x26b4:   	fstod	%f18, %f14
	.word	0x8143c000	! t0_kref+0x26b8:   	stbar
	.word	0x9aa2401b	! t0_kref+0x26bc:   	subcc	%o1, %i3, %o5
	.word	0xd720a020	! t0_kref+0x26c0:   	st	%f11, [%g2 + 0x20]
	.word	0xafb64fba	! t0_kref+0x26c4:   	fors	%f25, %f26, %f23
	.word	0xb1b40f71	! t0_kref+0x26c8:   	fornot1s	%f16, %f17, %f24
	.word	0xfb00a010	! t0_kref+0x26cc:   	ld	[%g2 + 0x10], %f29
	.word	0xada01934	! t0_kref+0x26d0:   	fstod	%f20, %f22
	.word	0x99a308d8	! t0_kref+0x26d4:   	fsubd	%f12, %f24, %f12
	.word	0xf8a71019	! t0_kref+0x26d8:   	sta	%i4, [%i4 + %i1]0x80
	.word	0xad400000	! t0_kref+0x26dc:   	mov	%y, %l6
	.word	0x81df6ae4	! t0_kref+0x26e0:   	flush	%i5 + 0xae4
	.word	0x9fc00004	! t0_kref+0x26e4:   	call	%g0 + %g4
	.word	0xa5b3098c	! t0_kref+0x26e8:   	bshuffle	%f12, %f12, %f18
	.word	0xea40a018	! t0_kref+0x26ec:   	ldsw	[%g2 + 0x18], %l5
	.word	0x90bb401d	! t0_kref+0x26f0:   	xnorcc	%o5, %i5, %o0
	.word	0xa1a018d6	! t0_kref+0x26f4:   	fdtos	%f22, %f16
	.word	0x3d800001	! t0_kref+0x26f8:   	fbule,a	_kref+0x26fc
	.word	0x9296aa35	! t0_kref+0x26fc:   	orcc	%i2, 0xa35, %o1
	.word	0x9fc10000	! t0_kref+0x2700:   	call	%g4
	.word	0x95a4884c	! t0_kref+0x2704:   	faddd	%f18, %f12, %f10
	.word	0x9fb44eee	! t0_kref+0x2708:   	fornot2s	%f17, %f14, %f15
	.word	0xa1a00558	! t0_kref+0x270c:   	fsqrtd	%f24, %f16
	.word	0xd6080019	! t0_kref+0x2710:   	ldub	[%g0 + %i1], %o3
	.word	0xb5b38634	! t0_kref+0x2714:   	fmul8x16	%f14, %f20, %f26
	.word	0x9da0055a	! t0_kref+0x2718:   	fsqrtd	%f26, %f14
	.word	0xeb06001c	! t0_kref+0x271c:   	ld	[%i0 + %i4], %f21
	.word	0xd850a012	! t0_kref+0x2720:   	ldsh	[%g2 + 0x12], %o4
	.word	0xa1a0055a	! t0_kref+0x2724:   	fsqrtd	%f26, %f16
	.word	0xee10a032	! t0_kref+0x2728:   	lduh	[%g2 + 0x32], %l7
	.word	0xf428a01b	! t0_kref+0x272c:   	stb	%i2, [%g2 + 0x1b]
	.word	0x96a2401b	! t0_kref+0x2730:   	subcc	%o1, %i3, %o3
	.word	0xaeb7400a	! t0_kref+0x2734:   	orncc	%i5, %o2, %l7
	.word	0xecc65000	! t0_kref+0x2738:   	ldswa	[%i1]0x80, %l6
	.word	0x9da38850	! t0_kref+0x273c:   	faddd	%f14, %f16, %f14
	.word	0xe83f4018	! t0_kref+0x2740:   	std	%l4, [%i5 + %i0]
	.word	0x81ae8ab1	! t0_kref+0x2744:   	fcmpes	%fcc0, %f26, %f17
	.word	0xea163ffa	! t0_kref+0x2748:   	lduh	[%i0 - 6], %l5
	.word	0xa5a00056	! t0_kref+0x274c:   	fmovd	%f22, %f18
	.word	0x878020f0	! t0_kref+0x2750:   	mov	0xf0, %asi
	.word	0xb7b007bc	! t0_kref+0x2754:   	fpackfix	%f28, %f27
	.word	0x993ac00c	! t0_kref+0x2758:   	sra	%o3, %o4, %o4
	.word	0xaa66ed2e	! t0_kref+0x275c:   	subc	%i3, 0xd2e, %l5
	.word	0x90630009	! t0_kref+0x2760:   	subc	%o4, %o1, %o0
	.word	0x90a7400b	! t0_kref+0x2764:   	subcc	%i5, %o3, %o0
	.word	0x81ae0ad2	! t0_kref+0x2768:   	fcmped	%fcc0, %f24, %f18
	.word	0xe91fbdd8	! t0_kref+0x276c:   	ldd	[%fp - 0x228], %f20
	.word	0xa8200009	! t0_kref+0x2770:   	neg	%o1, %l4
	.word	0xd248a00b	! t0_kref+0x2774:   	ldsb	[%g2 + 0xb], %o1
	.word	0x9da01050	! t0_kref+0x2778:   	fdtox	%f16, %f14
	.word	0xd210a028	! t0_kref+0x277c:   	lduh	[%g2 + 0x28], %o1
	.word	0xe3b8a040	! t0_kref+0x2780:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xaedb000c	! t0_kref+0x2784:   	smulcc	%o4, %o4, %l7
	.word	0xada449b0	! t0_kref+0x2788:   	fdivs	%f17, %f16, %f22
	.word	0xae02fc15	! t0_kref+0x278c:   	add	%o3, -0x3eb, %l7
	.word	0xf700a038	! t0_kref+0x2790:   	ld	[%g2 + 0x38], %f27
	.word	0xed066004	! t0_kref+0x2794:   	ld	[%i1 + 4], %f22
	.word	0xaa8eb2b4	! t0_kref+0x2798:   	andcc	%i2, -0xd4c, %l5
	.word	0xa1ab0056	! t0_kref+0x279c:   	fmovduge	%fcc0, %f22, %f16
	.word	0x96a3001c	! t0_kref+0x27a0:   	subcc	%o4, %i4, %o3
	.word	0xd28e501a	! t0_kref+0x27a4:   	lduba	[%i1 + %i2]0x80, %o1
	.word	0xd248a039	! t0_kref+0x27a8:   	ldsb	[%g2 + 0x39], %o1
	.word	0x8582f055	! t0_kref+0x27ac:   	wr	%o3, 0xfffff055, %ccr
	.word	0x943af6be	! t0_kref+0x27b0:   	xnor	%o3, -0x942, %o2
	.word	0x9de3bfa0	! t0_kref+0x27b4:   	save	%sp, -0x60, %sp
	.word	0xb8dee7c4	! t0_kref+0x27b8:   	smulcc	%i3, 0x7c4, %i4
	.word	0xa9e82fa5	! t0_kref+0x27bc:   	restore	%g0, 0xfa5, %l4
	.word	0xa1a508d4	! t0_kref+0x27c0:   	fsubd	%f20, %f20, %f16
	.word	0x90c3001c	! t0_kref+0x27c4:   	addccc	%o4, %i4, %o0
	.word	0xaa9e800a	! t0_kref+0x27c8:   	xorcc	%i2, %o2, %l5
	.word	0x31480008	! t0_kref+0x27cc:   	fba,a,pt	%fcc0, _kref+0x27ec
	.word	0xa5b3899a	! t0_kref+0x27d0:   	bshuffle	%f14, %f26, %f18
	.word	0x8143c000	! t0_kref+0x27d4:   	stbar
	.word	0x93400000	! t0_kref+0x27d8:   	mov	%y, %o1
	.word	0x99a018d2	! t0_kref+0x27dc:   	fdtos	%f18, %f12
	.word	0x9fa3c9af	! t0_kref+0x27e0:   	fdivs	%f15, %f15, %f15
	.word	0xaba0053b	! t0_kref+0x27e4:   	fsqrts	%f27, %f21
	.word	0x95a2895c	! t0_kref+0x27e8:   	fmuld	%f10, %f28, %f10
	.word	0xe3b8a040	! t0_kref+0x27ec:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x81ab0acc	! t0_kref+0x27f0:   	fcmped	%fcc0, %f12, %f12
	.word	0x9b400000	! t0_kref+0x27f4:   	mov	%y, %o5
	.word	0x81dee898	! t0_kref+0x27f8:   	flush	%i3 + 0x898
	.word	0x9623001a	! t0_kref+0x27fc:   	sub	%o4, %i2, %o3
	.word	0x9bb2c329	! t0_kref+0x2800:   	bmask	%o3, %o1, %o5
	.word	0xe4086420	! t0_kref+0x2804:   	ldub	[%g1 + 0x420], %l2
	.word	0xa41ca00c	! t0_kref+0x2808:   	xor	%l2, 0xc, %l2
	.word	0xe4286420	! t0_kref+0x280c:   	stb	%l2, [%g1 + 0x420]
	.word	0x81d86420	! t0_kref+0x2810:   	flush	%g1 + 0x420
2:	.word	0xd628a038	! t0_kref+0x2814:   	stb	%o3, [%g2 + 0x38]
	.word	0xad0ee6c4	! t0_kref+0x2818:   	tsubcc	%i3, 0x6c4, %l6
	.word	0xaedac01b	! t0_kref+0x281c:   	smulcc	%o3, %i3, %l7
	.word	0xf91fbdc8	! t0_kref+0x2820:   	ldd	[%fp - 0x238], %f28
	.word	0x110f1f38	! t0_kref+0x2824:   	sethi	%hi(0x3c7ce000), %o0
	.word	0xa1ab4038	! t0_kref+0x2828:   	fmovsle	%fcc0, %f24, %f16
	.word	0xe1ee501c	! t0_kref+0x282c:   	prefetcha	%i1 + %i4, 16
	.word	0xee40a008	! t0_kref+0x2830:   	ldsw	[%g2 + 8], %l7
	.word	0x91b3000b	! t0_kref+0x2834:   	edge8	%o4, %o3, %o0
	.word	0xee00a038	! t0_kref+0x2838:   	ld	[%g2 + 0x38], %l7
	.word	0x98c2b9cf	! t0_kref+0x283c:   	addccc	%o2, -0x631, %o4
	.word	0xf51fbe88	! t0_kref+0x2840:   	ldd	[%fp - 0x178], %f26
	.word	0xb5a30839	! t0_kref+0x2844:   	fadds	%f12, %f25, %f26
	.word	0x8143c000	! t0_kref+0x2848:   	stbar
	.word	0x963e800d	! t0_kref+0x284c:   	xnor	%i2, %o5, %o3
	.word	0x81ae0a4e	! t0_kref+0x2850:   	fcmpd	%fcc0, %f24, %f14
	call	SYM(t0_subr2)
	.word	0xa5a000d0	! t0_kref+0x2858:   	fnegd	%f16, %f18
	.word	0x97326019	! t0_kref+0x285c:   	srl	%o1, 0x19, %o3
	.word	0xaac6fc06	! t0_kref+0x2860:   	addccc	%i3, -0x3fa, %l5
	.word	0x97a0003b	! t0_kref+0x2864:   	fmovs	%f27, %f11
	.word	0xb5a6092d	! t0_kref+0x2868:   	fmuls	%f24, %f13, %f26
	.word	0xee965000	! t0_kref+0x286c:   	lduha	[%i1]0x80, %l7
	.word	0x92a0000a	! t0_kref+0x2870:   	subcc	%g0, %o2, %o1
	.word	0x9da00532	! t0_kref+0x2874:   	fsqrts	%f18, %f14
	.word	0xf436600a	! t0_kref+0x2878:   	sth	%i2, [%i1 + 0xa]
	.word	0x39480007	! t0_kref+0x287c:   	fbuge,a,pt	%fcc0, _kref+0x2898
	.word	0x9bb68450	! t0_kref+0x2880:   	fcmpne16	%f26, %f16, %o5
	.word	0xab33400b	! t0_kref+0x2884:   	srl	%o5, %o3, %l5
	.word	0xb5b38eee	! t0_kref+0x2888:   	fornot2s	%f14, %f14, %f26
	.word	0x8143c000	! t0_kref+0x288c:   	stbar
	.word	0xd050a022	! t0_kref+0x2890:   	ldsh	[%g2 + 0x22], %o0
	.word	0x94dac000	! t0_kref+0x2894:   	smulcc	%o3, %g0, %o2
	.word	0xac02c01a	! t0_kref+0x2898:   	add	%o3, %i2, %l6
	.word	0xd01f4019	! t0_kref+0x289c:   	ldd	[%i5 + %i1], %o0
	.word	0x9fc00004	! t0_kref+0x28a0:   	call	%g0 + %g4
	.word	0xd786501c	! t0_kref+0x28a4:   	lda	[%i1 + %i4]0x80, %f11
	.word	0xb1a01918	! t0_kref+0x28a8:   	fitod	%f24, %f24
	.word	0xf82e001a	! t0_kref+0x28ac:   	stb	%i4, [%i0 + %i2]
	.word	0xfb06001c	! t0_kref+0x28b0:   	ld	[%i0 + %i4], %f29
	.word	0xab67400a	! t0_kref+0x28b4:   	movcc	%icc, %o2, %l5
	.word	0xadb00c00	! t0_kref+0x28b8:   	fzero	%f22
	.word	0xb1a00556	! t0_kref+0x28bc:   	fsqrtd	%f22, %f24
	.word	0xac32c000	! t0_kref+0x28c0:   	orn	%o3, %g0, %l6
	.word	0xe9ee101b	! t0_kref+0x28c4:   	prefetcha	%i0 + %i3, 20
	.word	0xe3b8a040	! t0_kref+0x28c8:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x9006b259	! t0_kref+0x28cc:   	add	%i2, -0xda7, %o0
	.word	0xd09e5000	! t0_kref+0x28d0:   	ldda	[%i1]0x80, %o0
	.word	0x81aaca31	! t0_kref+0x28d4:   	fcmps	%fcc0, %f11, %f17
	.word	0x933aa00f	! t0_kref+0x28d8:   	sra	%o2, 0xf, %o1
	.word	0xacbf6f93	! t0_kref+0x28dc:   	xnorcc	%i5, 0xf93, %l6
	.word	0x31480005	! t0_kref+0x28e0:   	fba,a,pt	%fcc0, _kref+0x28f4
	.word	0xd700a028	! t0_kref+0x28e4:   	ld	[%g2 + 0x28], %f11
	.word	0xac0eb604	! t0_kref+0x28e8:   	and	%i2, -0x9fc, %l6
	.word	0xa3a000ae	! t0_kref+0x28ec:   	fnegs	%f14, %f17
	.word	0xa852800b	! t0_kref+0x28f0:   	umul	%o2, %o3, %l4
	.word	0xebee501c	! t0_kref+0x28f4:   	prefetcha	%i1 + %i4, 21
	.word	0x90937765	! t0_kref+0x28f8:   	orcc	%o5, -0x89b, %o0
	.word	0xae674000	! t0_kref+0x28fc:   	subc	%i5, %g0, %l7
	.word	0xea40a000	! t0_kref+0x2900:   	ldsw	[%g2], %l5
	.word	0xaae6c00d	! t0_kref+0x2904:   	subccc	%i3, %o5, %l5
	.word	0xa1a588d8	! t0_kref+0x2908:   	fsubd	%f22, %f24, %f16
	.word	0xb5b6863a	! t0_kref+0x290c:   	fmul8x16	%f26, %f26, %f26
	.word	0x942331fd	! t0_kref+0x2910:   	sub	%o4, -0xe03, %o2
	.word	0x81834000	! t0_kref+0x2914:   	wr	%o5, %g0, %y
	.word	0x9de3bfa0	! t0_kref+0x2918:   	save	%sp, -0x60, %sp
	.word	0x8046fa31	! t0_kref+0x291c:   	addc	%i3, -0x5cf, %g0
	.word	0x91ef651b	! t0_kref+0x2920:   	restore	%i5, 0x51b, %o0
	.word	0xa5a00556	! t0_kref+0x2924:   	fsqrtd	%f22, %f18
	.word	0x9da608d4	! t0_kref+0x2928:   	fsubd	%f24, %f20, %f14
	.word	0xe93e6008	! t0_kref+0x292c:   	std	%f20, [%i1 + 8]
	.word	0xa1b3ce2f	! t0_kref+0x2930:   	fands	%f15, %f15, %f16
	.word	0xa5a5cd34	! t0_kref+0x2934:   	fsmuld	%f23, %f20, %f18
	.word	0x9422e5d9	! t0_kref+0x2938:   	sub	%o3, 0x5d9, %o2
	.word	0xc398a080	! t0_kref+0x293c:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0xab2ae018	! t0_kref+0x2940:   	sll	%o3, 0x18, %l5
	.word	0xc12e001c	! t0_kref+0x2944:   	st	%fsr, [%i0 + %i4]
	.word	0x9de3bfa0	! t0_kref+0x2948:   	save	%sp, -0x60, %sp
	.word	0xa9ee6808	! t0_kref+0x294c:   	restore	%i1, 0x808, %l4
	.word	0xa3b007bc	! t0_kref+0x2950:   	fpackfix	%f28, %f17
	.word	0xe706401c	! t0_kref+0x2954:   	ld	[%i1 + %i4], %f19
	.word	0x9bb6c07b	! t0_kref+0x2958:   	edge8ln	%i3, %i3, %o5
	.word	0xb1a018ce	! t0_kref+0x295c:   	fdtos	%f14, %f24
	.word	0xad32a01b	! t0_kref+0x2960:   	srl	%o2, 0x1b, %l6
	.word	0xa3a00132	! t0_kref+0x2964:   	fabss	%f18, %f17
	.word	0x38480008	! t0_kref+0x2968:   	bgu,a,pt	%icc, _kref+0x2988
	.word	0xe3070018	! t0_kref+0x296c:   	ld	[%i4 + %i0], %f17
	.word	0xa1a00554	! t0_kref+0x2970:   	fsqrtd	%f20, %f16
	.word	0xd706401c	! t0_kref+0x2974:   	ld	[%i1 + %i4], %f11
	.word	0xaca32e6a	! t0_kref+0x2978:   	subcc	%o4, 0xe6a, %l6
	.word	0x20800002	! t0_kref+0x297c:   	bn,a	_kref+0x2984
	.word	0xd1196f00	! t0_kref+0x2980:   	ldd	[%g5 + 0xf00], %f8
	.word	0xd620a020	! t0_kref+0x2984:   	st	%o3, [%g2 + 0x20]
	.word	0x92274009	! t0_kref+0x2988:   	sub	%i5, %o1, %o1
	.word	0x9056e825	! t0_kref+0x298c:   	umul	%i3, 0x825, %o0
	.word	0xe81e0000	! t0_kref+0x2990:   	ldd	[%i0], %l4
	.word	0x95a01935	! t0_kref+0x2994:   	fstod	%f21, %f10
	.word	0xc398a080	! t0_kref+0x2998:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0xdb067fe0	! t0_kref+0x299c:   	ld	[%i1 - 0x20], %f13
	.word	0xda2e7ff3	! t0_kref+0x29a0:   	stb	%o5, [%i1 - 0xd]
	.word	0x81dca6c5	! t0_kref+0x29a4:   	flush	%l2 + 0x6c5
	.word	0xd410a018	! t0_kref+0x29a8:   	lduh	[%g2 + 0x18], %o2
	.word	0x98da7040	! t0_kref+0x29ac:   	smulcc	%o1, -0xfc0, %o4
	.word	0x9af2a0df	! t0_kref+0x29b0:   	udivcc	%o2, 0xdf, %o5
	.word	0xd8162018	! t0_kref+0x29b4:   	lduh	[%i0 + 0x18], %o4
	.word	0x980a75c6	! t0_kref+0x29b8:   	and	%o1, -0xa3a, %o4
	.word	0x9b0ee367	! t0_kref+0x29bc:   	tsubcc	%i3, 0x367, %o5
	.word	0xac737526	! t0_kref+0x29c0:   	udiv	%o5, -0xada, %l6
	.word	0xd050a002	! t0_kref+0x29c4:   	ldsh	[%g2 + 2], %o0
	.word	0xaa037621	! t0_kref+0x29c8:   	add	%o5, -0x9df, %l5
	.word	0xd6200018	! t0_kref+0x29cc:   	st	%o3, [%g0 + %i0]
	.word	0xa8872695	! t0_kref+0x29d0:   	addcc	%i4, 0x695, %l4
	.word	0xd400a008	! t0_kref+0x29d4:   	ld	[%g2 + 8], %o2
	.word	0x2a800007	! t0_kref+0x29d8:   	bcs,a	_kref+0x29f4
	.word	0xa7b48e73	! t0_kref+0x29dc:   	fxnors	%f18, %f19, %f19
	.word	0xf300a010	! t0_kref+0x29e0:   	ld	[%g2 + 0x10], %f25
	.word	0x3d480008	! t0_kref+0x29e4:   	fbule,a,pt	%fcc0, _kref+0x2a04
	.word	0x96c2c01b	! t0_kref+0x29e8:   	addccc	%o3, %i3, %o3
	.word	0x97400000	! t0_kref+0x29ec:   	mov	%y, %o3
	.word	0x9da00552	! t0_kref+0x29f0:   	fsqrtd	%f18, %f14
	.word	0xaba000ad	! t0_kref+0x29f4:   	fnegs	%f13, %f21
	.word	0x3d480005	! t0_kref+0x29f8:   	fbule,a,pt	%fcc0, _kref+0x2a0c
	.word	0xa7b54a2b	! t0_kref+0x29fc:   	fpadd16s	%f21, %f11, %f19
	.word	0xb1b7098a	! t0_kref+0x2a00:   	bshuffle	%f28, %f10, %f24
	.word	0x97b60558	! t0_kref+0x2a04:   	fcmpeq16	%f24, %f24, %o3
	.word	0xd89f5019	! t0_kref+0x2a08:   	ldda	[%i5 + %i1]0x80, %o4
	.word	0x878020f0	! t0_kref+0x2a0c:   	mov	0xf0, %asi
	.word	0xe96e2018	! t0_kref+0x2a10:   	prefetch	%i0 + 0x18, 20
	.word	0xec40a018	! t0_kref+0x2a14:   	ldsw	[%g2 + 0x18], %l6
	.word	0x9da000ae	! t0_kref+0x2a18:   	fnegs	%f14, %f14
	.word	0xc807bfe8	! t0_kref+0x2a1c:   	ld	[%fp - 0x18], %g4
	.word	0xc398a080	! t0_kref+0x2a20:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0x8583401a	! t0_kref+0x2a24:   	wr	%o5, %i2, %ccr
	.word	0xef262008	! t0_kref+0x2a28:   	st	%f23, [%i0 + 8]
	.word	0x929331ed	! t0_kref+0x2a2c:   	orcc	%o4, -0xe13, %o1
	.word	0x86102003	! t0_kref+0x2a30:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x2a34:   	bne,a	_kref+0x2a34
	.word	0x86a0e001	! t0_kref+0x2a38:   	subcc	%g3, 1, %g3
	.word	0xd800a010	! t0_kref+0x2a3c:   	ld	[%g2 + 0x10], %o4
	.word	0x96302aa5	! t0_kref+0x2a40:   	orn	%g0, 0xaa5, %o3
	.word	0x98af001b	! t0_kref+0x2a44:   	andncc	%i4, %i3, %o4
	.word	0xe3b8a040	! t0_kref+0x2a48:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xe3b8a040	! t0_kref+0x2a4c:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xd4280019	! t0_kref+0x2a50:   	stb	%o2, [%g0 + %i1]
	.word	0xabb485d8	! t0_kref+0x2a54:   	fcmpeq32	%f18, %f24, %l5
	.word	0xe3063ff0	! t0_kref+0x2a58:   	ld	[%i0 - 0x10], %f17
	.word	0xe96e6010	! t0_kref+0x2a5c:   	prefetch	%i1 + 0x10, 20
	.word	0xa85f400c	! t0_kref+0x2a60:   	smul	%i5, %o4, %l4
	.word	0xf91fbf70	! t0_kref+0x2a64:   	ldd	[%fp - 0x90], %f28
	.word	0x81ac0adc	! t0_kref+0x2a68:   	fcmped	%fcc0, %f16, %f28
	.word	0xf51e3fe0	! t0_kref+0x2a6c:   	ldd	[%i0 - 0x20], %f26
	.word	0x9de3bfa0	! t0_kref+0x2a70:   	save	%sp, -0x60, %sp
	.word	0xb85e3d8f	! t0_kref+0x2a74:   	smul	%i0, -0x271, %i4
	.word	0x95e838c6	! t0_kref+0x2a78:   	restore	%g0, -0x73a, %o2
	.word	0xa9400000	! t0_kref+0x2a7c:   	mov	%y, %l4
	.word	0x2c480002	! t0_kref+0x2a80:   	bneg,a,pt	%icc, _kref+0x2a88
	.word	0xf430a00a	! t0_kref+0x2a84:   	sth	%i2, [%g2 + 0xa]
	.word	0xb5a509dc	! t0_kref+0x2a88:   	fdivd	%f20, %f28, %f26
	.word	0xb5a2894a	! t0_kref+0x2a8c:   	fmuld	%f10, %f10, %f26
	.word	0xf5006452	! t0_kref+0x2a90:   	ld	[%g1 + 0x452], %f26
	.word	0x90bf000a	! t0_kref+0x2a94:   	xnorcc	%i4, %o2, %o0
	.word	0xd636c019	! t0_kref+0x2a98:   	sth	%o3, [%i3 + %i1]
	.word	0x97400000	! t0_kref+0x2a9c:   	mov	%y, %o3
	.word	0xafa00530	! t0_kref+0x2aa0:   	fsqrts	%f16, %f23
	sethi	%hi(2f), %o7
	.word	0xe40be2f0	! t0_kref+0x2aa8:   	ldub	[%o7 + 0x2f0], %l2
	.word	0xa41ca00c	! t0_kref+0x2aac:   	xor	%l2, 0xc, %l2
	.word	0xe42be2f0	! t0_kref+0x2ab0:   	stb	%l2, [%o7 + 0x2f0]
	.word	0x81dbe2f0	! t0_kref+0x2ab4:   	flush	%o7 + 0x2f0
	.word	0xfa200018	! t0_kref+0x2ab8:   	st	%i5, [%g0 + %i0]
	.word	0xf8266008	! t0_kref+0x2abc:   	st	%i4, [%i1 + 8]
	.word	0xb1b64af1	! t0_kref+0x2ac0:   	fpsub32s	%f25, %f17, %f24
	.word	0xc368a00b	! t0_kref+0x2ac4:   	prefetch	%g2 + 0xb, 1
	.word	0xd19f5a59	! t0_kref+0x2ac8:   	ldda	[%i5 + %i1]0xd2, %f8
	.word	0xf59e501d	! t0_kref+0x2acc:   	ldda	[%i1 + %i5]0x80, %f26
	.word	0x2c800003	! t0_kref+0x2ad0:   	bneg,a	_kref+0x2adc
	.word	0x9bb3035a	! t0_kref+0x2ad4:   	alignaddrl	%o4, %i2, %o5
	.word	0x9fc00004	! t0_kref+0x2ad8:   	call	%g0 + %g4
	.word	0xe81e3ff8	! t0_kref+0x2adc:   	ldd	[%i0 - 8], %l4
	.word	0xc36e401d	! t0_kref+0x2ae0:   	prefetch	%i1 + %i5, 1
	.word	0xd81e0000	! t0_kref+0x2ae4:   	ldd	[%i0], %o4
	.word	0xbba000b0	! t0_kref+0x2ae8:   	fnegs	%f16, %f29
	.word	0x99a01935	! t0_kref+0x2aec:   	fstod	%f21, %f12
2:	.word	0x9db68a5a	! t0_kref+0x2af0:   	fpadd32	%f26, %f26, %f14
	.word	0xd84e001a	! t0_kref+0x2af4:   	ldsb	[%i0 + %i2], %o4
	.word	0x98aee8bc	! t0_kref+0x2af8:   	andncc	%i3, 0x8bc, %o4
	.word	0x38800001	! t0_kref+0x2afc:   	bgu,a	_kref+0x2b00
	.word	0xf100a030	! t0_kref+0x2b00:   	ld	[%g2 + 0x30], %f24
	.word	0x971a7dac	! t0_kref+0x2b04:   	tsubcctv	%o1, -0x254, %o3
	.word	0x90677045	! t0_kref+0x2b08:   	subc	%i5, -0xfbb, %o0
	.word	0x39480001	! t0_kref+0x2b0c:   	fbuge,a,pt	%fcc0, _kref+0x2b10
	.word	0xaa22a0b5	! t0_kref+0x2b10:   	sub	%o2, 0xb5, %l5
	.word	0xc5ee1000	! t0_kref+0x2b14:   	prefetcha	%i0, 2
	.word	0xd8300018	! t0_kref+0x2b18:   	sth	%o4, [%g0 + %i0]
	.word	0xe26e600b	! t0_kref+0x2b1c:   	ldstub	[%i1 + 0xb], %l1
	.word	0x3f480005	! t0_kref+0x2b20:   	fbo,a,pt	%fcc0, _kref+0x2b34
	.word	0xb5b38c6c	! t0_kref+0x2b24:   	fnors	%f14, %f12, %f26
	.word	0xadb30dca	! t0_kref+0x2b28:   	fnand	%f12, %f10, %f22
	.word	0x29480002	! t0_kref+0x2b2c:   	fbl,a,pt	%fcc0, _kref+0x2b34
	.word	0xe3b8a040	! t0_kref+0x2b30:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xb1a5882f	! t0_kref+0x2b34:   	fadds	%f22, %f15, %f24
	.word	0x8143c000	! t0_kref+0x2b38:   	stbar
	.word	0x9da01a58	! t0_kref+0x2b3c:   	fdtoi	%f24, %f14
	.word	0x86102001	! t0_kref+0x2b40:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x2b44:   	bne,a	_kref+0x2b44
	.word	0x86a0e001	! t0_kref+0x2b48:   	subcc	%g3, 1, %g3
	.word	0xa5b60a0a	! t0_kref+0x2b4c:   	fpadd16	%f24, %f10, %f18
	.word	0x2d480006	! t0_kref+0x2b50:   	fbg,a,pt	%fcc0, _kref+0x2b68
	.word	0x9a86800b	! t0_kref+0x2b54:   	addcc	%i2, %o3, %o5
	.word	0xd000a000	! t0_kref+0x2b58:   	ld	[%g2], %o0
	.word	0x95b6834b	! t0_kref+0x2b5c:   	alignaddrl	%i2, %o3, %o2
	.word	0xae733c1e	! t0_kref+0x2b60:   	udiv	%o4, -0x3e2, %l7
	.word	0xb3a01a33	! t0_kref+0x2b64:   	fstoi	%f19, %f25
	.word	0xec3e6008	! t0_kref+0x2b68:   	std	%l6, [%i1 + 8]
	.word	0xf7067fe0	! t0_kref+0x2b6c:   	ld	[%i1 - 0x20], %f27
	.word	0xeb20a010	! t0_kref+0x2b70:   	st	%f21, [%g2 + 0x10]
	.word	0xe168a00f	! t0_kref+0x2b74:   	prefetch	%g2 + 0xf, 16
	.word	0x9da01a34	! t0_kref+0x2b78:   	fstoi	%f20, %f14
	.word	0xae76801c	! t0_kref+0x2b7c:   	udiv	%i2, %i4, %l7
	.word	0xae26a5ff	! t0_kref+0x2b80:   	sub	%i2, 0x5ff, %l7
	.word	0x81ae0a4a	! t0_kref+0x2b84:   	fcmpd	%fcc0, %f24, %f10
	.word	0x86102014	! t0_kref+0x2b88:   	mov	0x14, %g3
	.word	0x86a0e001	! t0_kref+0x2b8c:   	subcc	%g3, 1, %g3
	.word	0x22800016	! t0_kref+0x2b90:   	be,a	_kref+0x2be8
	.word	0x90c2ad73	! t0_kref+0x2b94:   	addccc	%o2, 0xd73, %o0
	.word	0x2d480004	! t0_kref+0x2b98:   	fbg,a,pt	%fcc0, _kref+0x2ba8
	.word	0xe3b8a040	! t0_kref+0x2b9c:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xaef2acf3	! t0_kref+0x2ba0:   	udivcc	%o2, 0xcf3, %l7
	.word	0x9fa44839	! t0_kref+0x2ba4:   	fadds	%f17, %f25, %f15
	.word	0xc028a011	! t0_kref+0x2ba8:   	clrb	[%g2 + 0x11]
	.word	0x911a800a	! t0_kref+0x2bac:   	tsubcctv	%o2, %o2, %o0
	.word	0x95a508dc	! t0_kref+0x2bb0:   	fsubd	%f20, %f28, %f10
	.word	0xd81f4018	! t0_kref+0x2bb4:   	ldd	[%i5 + %i0], %o4
	.word	0xea166004	! t0_kref+0x2bb8:   	lduh	[%i1 + 4], %l5
	.word	0xac5ee72d	! t0_kref+0x2bbc:   	smul	%i3, 0x72d, %l6
	.word	0xb5a0054e	! t0_kref+0x2bc0:   	fsqrtd	%f14, %f26
	.word	0x291b3db7	! t0_kref+0x2bc4:   	sethi	%hi(0x6cf6dc00), %l4
	.word	0x34800004	! t0_kref+0x2bc8:   	bg,a	_kref+0x2bd8
	.word	0x9606f34a	! t0_kref+0x2bcc:   	add	%i3, -0xcb6, %o3
	.word	0x97a389b5	! t0_kref+0x2bd0:   	fdivs	%f14, %f21, %f11
	.word	0xf5ee501b	! t0_kref+0x2bd4:   	prefetcha	%i1 + %i3, 26
	.word	0x9666801b	! t0_kref+0x2bd8:   	subc	%i2, %i3, %o3
	.word	0x990a801b	! t0_kref+0x2bdc:   	tsubcc	%o2, %i3, %o4
	.word	0x81d84014	! t0_kref+0x2be0:   	flush	%g1 + %l4
	.word	0xbba70939	! t0_kref+0x2be4:   	fmuls	%f28, %f25, %f29
	.word	0xea96d019	! t0_kref+0x2be8:   	lduha	[%i3 + %i1]0x80, %l5
	.word	0x83414000	! t0_kref+0x2bec:   	mov	%pc, %g1
	.word	0xa7a0052d	! t0_kref+0x2bf0:   	fsqrts	%f13, %f19
	.word	0xa9b7034d	! t0_kref+0x2bf4:   	alignaddrl	%i4, %o5, %l4
	.word	0xb1a01933	! t0_kref+0x2bf8:   	fstod	%f19, %f24
	.word	0x9adb4000	! t0_kref+0x2bfc:   	smulcc	%o5, %g0, %o5
	.word	0xac7f3e0a	! t0_kref+0x2c00:   	sdiv	%i4, -0x1f6, %l6
	.word	0xd44e8018	! t0_kref+0x2c04:   	ldsb	[%i2 + %i0], %o2
	.word	0x9fb3cfae	! t0_kref+0x2c08:   	fors	%f15, %f14, %f15
	.word	0xfa20a030	! t0_kref+0x2c0c:   	st	%i5, [%g2 + 0x30]
	.word	0x878020d0	! t0_kref+0x2c10:   	mov	0xd0, %asi
	.word	0xd616201c	! t0_kref+0x2c14:   	lduh	[%i0 + 0x1c], %o3
	.word	0x39480001	! t0_kref+0x2c18:   	fbuge,a,pt	%fcc0, _kref+0x2c1c
	.word	0xe19e1a5d	! t0_kref+0x2c1c:   	ldda	[%i0 + %i5]0xd2, %f16
	.word	0xd8270019	! t0_kref+0x2c20:   	st	%o4, [%i4 + %i1]
	.word	0xc96e000b	! t0_kref+0x2c24:   	prefetch	%i0 + %o3, 4
	.word	0x9fc00004	! t0_kref+0x2c28:   	call	%g0 + %g4
	.word	0xa1a60850	! t0_kref+0x2c2c:   	faddd	%f24, %f16, %f16
	.word	0xe4ff1019	! t0_kref+0x2c30:   	swapa	[%i4 + %i1]0x80, %l2
	.word	0xf828a02b	! t0_kref+0x2c34:   	stb	%i4, [%g2 + 0x2b]
	.word	0xf300a028	! t0_kref+0x2c38:   	ld	[%g2 + 0x28], %f25
	.word	0xada609cc	! t0_kref+0x2c3c:   	fdivd	%f24, %f12, %f22
	.word	0xab33601e	! t0_kref+0x2c40:   	srl	%o5, 0x1e, %l5
	.word	0xf720a010	! t0_kref+0x2c44:   	st	%f27, [%g2 + 0x10]
	.word	0xa8e2762f	! t0_kref+0x2c48:   	subccc	%o1, -0x9d1, %l4
	.word	0xa1a00558	! t0_kref+0x2c4c:   	fsqrtd	%f24, %f16
	.word	0xb3a00538	! t0_kref+0x2c50:   	fsqrts	%f24, %f25
	.word	0x96276fe8	! t0_kref+0x2c54:   	sub	%i5, 0xfe8, %o3
	.word	0xd0164000	! t0_kref+0x2c58:   	lduh	[%i1], %o0
	.word	0x99a01915	! t0_kref+0x2c5c:   	fitod	%f21, %f12
	.word	0xd008a031	! t0_kref+0x2c60:   	ldub	[%g2 + 0x31], %o0
	.word	0x9056a18b	! t0_kref+0x2c64:   	umul	%i2, 0x18b, %o0
	.word	0xbba00037	! t0_kref+0x2c68:   	fmovs	%f23, %f29
	.word	0x30800007	! t0_kref+0x2c6c:   	ba,a	_kref+0x2c88
	.word	0xd1e6501d	! t0_kref+0x2c70:   	casa	[%i1]0x80, %i5, %o0
	.word	0xd44e8018	! t0_kref+0x2c74:   	ldsb	[%i2 + %i0], %o2
	.word	0xec00a028	! t0_kref+0x2c78:   	ld	[%g2 + 0x28], %l6
	.word	0xf4f65000	! t0_kref+0x2c7c:   	stxa	%i2, [%i1]0x80
	.word	0xd250a028	! t0_kref+0x2c80:   	ldsh	[%g2 + 0x28], %o1
	.word	0xb9a2c92b	! t0_kref+0x2c84:   	fmuls	%f11, %f11, %f28
	.word	0x8d87001c	! t0_kref+0x2c88:   	wr	%i4, %i4, %fprs
	.word	0x9de3bfa0	! t0_kref+0x2c8c:   	save	%sp, -0x60, %sp
	.word	0x8038001d	! t0_kref+0x2c90:   	xnor	%g0, %i5, %g0
	.word	0x97e83e82	! t0_kref+0x2c94:   	restore	%g0, -0x17e, %o3
	.word	0x9bb70514	! t0_kref+0x2c98:   	fcmpgt16	%f28, %f20, %o5
	.word	0xb9a01a2e	! t0_kref+0x2c9c:   	fstoi	%f14, %f28
	.word	0xa9a01a4e	! t0_kref+0x2ca0:   	fdtoi	%f14, %f20
	.word	0xb5a0190b	! t0_kref+0x2ca4:   	fitod	%f11, %f26
	.word	0x9fc00004	! t0_kref+0x2ca8:   	call	%g0 + %g4
	.word	0xa3a00533	! t0_kref+0x2cac:   	fsqrts	%f19, %f17
	.word	0x95b60c96	! t0_kref+0x2cb0:   	fandnot2	%f24, %f22, %f10
	.word	0xda16401b	! t0_kref+0x2cb4:   	lduh	[%i1 + %i3], %o5
	.word	0x9ba000b1	! t0_kref+0x2cb8:   	fnegs	%f17, %f13
	.word	0x9fc10000	! t0_kref+0x2cbc:   	call	%g4
	.word	0xaec0262c	! t0_kref+0x2cc0:   	addccc	%g0, 0x62c, %l7
	.word	0xa8a2800b	! t0_kref+0x2cc4:   	subcc	%o2, %o3, %l4
	.word	0x2a800005	! t0_kref+0x2cc8:   	bcs,a	_kref+0x2cdc
	.word	0xada58952	! t0_kref+0x2ccc:   	fmuld	%f22, %f18, %f22
	.word	0x90c6ef4b	! t0_kref+0x2cd0:   	addccc	%i3, 0xf4b, %o0
	.word	0xb1a0052e	! t0_kref+0x2cd4:   	fsqrts	%f14, %f24
	.word	0xada00550	! t0_kref+0x2cd8:   	fsqrtd	%f16, %f22
	.word	0xada00156	! t0_kref+0x2cdc:   	fabsd	%f22, %f22
	.word	0xe3ee501c	! t0_kref+0x2ce0:   	prefetcha	%i1 + %i4, 17
	.word	0xe06e200a	! t0_kref+0x2ce4:   	ldstub	[%i0 + 0xa], %l0
	.word	0xafa01a4a	! t0_kref+0x2ce8:   	fdtoi	%f10, %f23
	.word	0xd4166008	! t0_kref+0x2cec:   	lduh	[%i1 + 8], %o2
	.word	0x90df291e	! t0_kref+0x2cf0:   	smulcc	%i4, 0x91e, %o0
	.word	0xaa02c00d	! t0_kref+0x2cf4:   	add	%o3, %o5, %l5
	.word	0x21480006	! t0_kref+0x2cf8:   	fbn,a,pt	%fcc0, _kref+0x2d10
	.word	0xd868a032	! t0_kref+0x2cfc:   	ldstub	[%g2 + 0x32], %o4
	.word	0x92c3001d	! t0_kref+0x2d00:   	addccc	%o4, %i5, %o1
	.word	0xffee501c	! t0_kref+0x2d04:   	prefetcha	%i1 + %i4, 31
	.word	0xaa036292	! t0_kref+0x2d08:   	add	%o5, 0x292, %l5
	.word	0xb1b5c62c	! t0_kref+0x2d0c:   	fmul8x16	%f23, %f12, %f24
	.word	0xefee501d	! t0_kref+0x2d10:   	prefetcha	%i1 + %i5, 23
	.word	0xe968a045	! t0_kref+0x2d14:   	prefetch	%g2 + 0x45, 20
	.word	0xfa364000	! t0_kref+0x2d18:   	sth	%i5, [%i1]
	.word	0xa3a01a54	! t0_kref+0x2d1c:   	fdtoi	%f20, %f17
	.word	0xa1b30e80	! t0_kref+0x2d20:   	fsrc1	%f12, %f16
	.word	0xa1a01912	! t0_kref+0x2d24:   	fitod	%f18, %f16
	.word	0x94f27539	! t0_kref+0x2d28:   	udivcc	%o1, -0xac7, %o2
	.word	0xae503205	! t0_kref+0x2d2c:   	umul	%g0, -0xdfb, %l7
	.word	0x92e33e1d	! t0_kref+0x2d30:   	subccc	%o4, -0x1e3, %o1
	.word	0xac96c009	! t0_kref+0x2d34:   	orcc	%i3, %o1, %l6
	.word	0xac7ef66b	! t0_kref+0x2d38:   	sdiv	%i3, -0x995, %l6
	.word	0xfbee101a	! t0_kref+0x2d3c:   	prefetcha	%i0 + %i2, 29
	.word	0x2e800004	! t0_kref+0x2d40:   	bvs,a	_kref+0x2d50
	.word	0xf430a02a	! t0_kref+0x2d44:   	sth	%i2, [%g2 + 0x2a]
	.word	0x31480005	! t0_kref+0x2d48:   	fba,a,pt	%fcc0, _kref+0x2d5c
	.word	0xee08a039	! t0_kref+0x2d4c:   	ldub	[%g2 + 0x39], %l7
	.word	0xab3aa00a	! t0_kref+0x2d50:   	sra	%o2, 0xa, %l5
	.word	0xea08a039	! t0_kref+0x2d54:   	ldub	[%g2 + 0x39], %l5
	.word	0x9b408000	! t0_kref+0x2d58:   	mov	%ccr, %o5
	.word	0xafb5840c	! t0_kref+0x2d5c:   	fcmple16	%f22, %f12, %l7
	.word	0xc9ee100a	! t0_kref+0x2d60:   	prefetcha	%i0 + %o2, 4
	.word	0xa8524000	! t0_kref+0x2d64:   	umul	%o1, %g0, %l4
	.word	0x95400000	! t0_kref+0x2d68:   	mov	%y, %o2
	.word	0x20800002	! t0_kref+0x2d6c:   	bn,a	_kref+0x2d74
	.word	0xc028a031	! t0_kref+0x2d70:   	clrb	[%g2 + 0x31]
	.word	0xe7871019	! t0_kref+0x2d74:   	lda	[%i4 + %i1]0x80, %f19
	.word	0x2d480007	! t0_kref+0x2d78:   	fbg,a,pt	%fcc0, _kref+0x2d94
	.word	0x953ee015	! t0_kref+0x2d7c:   	sra	%i3, 0x15, %o2
	.word	0x81dc60cc	! t0_kref+0x2d80:   	flush	%l1 + 0xcc
	.word	0xa1a00558	! t0_kref+0x2d84:   	fsqrtd	%f24, %f16
	.word	0xa1b00f37	! t0_kref+0x2d88:   	fsrc2s	%f23, %f16
	.word	0x2939f6cd	! t0_kref+0x2d8c:   	sethi	%hi(0xe7db3400), %l4
	.word	0x9da000b5	! t0_kref+0x2d90:   	fnegs	%f21, %f14
	.word	0xab400000	! t0_kref+0x2d94:   	mov	%y, %l5
	.word	0x2a800006	! t0_kref+0x2d98:   	bcs,a	_kref+0x2db0
	.word	0x9da01912	! t0_kref+0x2d9c:   	fitod	%f18, %f14
	.word	0x23480001	! t0_kref+0x2da0:   	fbne,a,pt	%fcc0, _kref+0x2da4
	.word	0xd22e7ff2	! t0_kref+0x2da4:   	stb	%o1, [%i1 - 0xe]
	.word	0xd820a038	! t0_kref+0x2da8:   	st	%o4, [%g2 + 0x38]
	.word	0xa9a000bd	! t0_kref+0x2dac:   	fnegs	%f29, %f20
	.word	0xb7a01a3c	! t0_kref+0x2db0:   	fstoi	%f28, %f27
	.word	0xf620a028	! t0_kref+0x2db4:   	st	%i3, [%g2 + 0x28]
	.word	0x81af0a5c	! t0_kref+0x2db8:   	fcmpd	%fcc0, %f28, %f28
	.word	0xaac6ac76	! t0_kref+0x2dbc:   	addccc	%i2, 0xc76, %l5
	.word	0x969377a7	! t0_kref+0x2dc0:   	orcc	%o5, -0x859, %o3
	.word	0xad372007	! t0_kref+0x2dc4:   	srl	%i4, 0x7, %l6
	.word	0xaa0afe61	! t0_kref+0x2dc8:   	and	%o3, -0x19f, %l5
	.word	0xe3063ffc	! t0_kref+0x2dcc:   	ld	[%i0 - 4], %f17
	.word	0x91652259	! t0_kref+0x2dd0:   	movleu	%icc, 0x259, %o0
	.word	0xe1be184b	! t0_kref+0x2dd4:   	stda	%f16, [%i0 + %o3]0xc2
	.word	0xed1e401d	! t0_kref+0x2dd8:   	ldd	[%i1 + %i5], %f22
	.word	0xe84e6018	! t0_kref+0x2ddc:   	ldsb	[%i1 + 0x18], %l4
	.word	0x985f4000	! t0_kref+0x2de0:   	smul	%i5, %g0, %o4
	.word	0xafb74e7b	! t0_kref+0x2de4:   	fxnors	%f29, %f27, %f23
	.word	0x9a280000	! t0_kref+0x2de8:   	andn	%g0, %g0, %o5
	.word	0x908e800c	! t0_kref+0x2dec:   	andcc	%i2, %o4, %o0
	.word	0x81ad0acc	! t0_kref+0x2df0:   	fcmped	%fcc0, %f20, %f12
	.word	0x9133600f	! t0_kref+0x2df4:   	srl	%o5, 0xf, %o0
	.word	0x9de3bfa0	! t0_kref+0x2df8:   	save	%sp, -0x60, %sp
	.word	0xb6c020d0	! t0_kref+0x2dfc:   	addccc	%g0, 0xd0, %i3
	.word	0xa9ef001d	! t0_kref+0x2e00:   	restore	%i4, %i5, %l4
	.word	0xefee101b	! t0_kref+0x2e04:   	prefetcha	%i0 + %i3, 23
	.word	0xea10a012	! t0_kref+0x2e08:   	lduh	[%g2 + 0x12], %l5
	.word	0x99b386cc	! t0_kref+0x2e0c:   	fmul8sux16	%f14, %f12, %f12
	.word	0x9da00538	! t0_kref+0x2e10:   	fsqrts	%f24, %f14
	.word	0xfa30a038	! t0_kref+0x2e14:   	sth	%i5, [%g2 + 0x38]
	.word	0xafa018ce	! t0_kref+0x2e18:   	fdtos	%f14, %f23
	.word	0xec8e1000	! t0_kref+0x2e1c:   	lduba	[%i0]0x80, %l6
	.word	0xa860000b	! t0_kref+0x2e20:   	subc	%g0, %o3, %l4
	.word	0x35480005	! t0_kref+0x2e24:   	fbue,a,pt	%fcc0, _kref+0x2e38
	.word	0xb3a01a56	! t0_kref+0x2e28:   	fdtoi	%f22, %f25
	.word	0xb1a708d4	! t0_kref+0x2e2c:   	fsubd	%f28, %f20, %f24
	.word	0x9fc00004	! t0_kref+0x2e30:   	call	%g0 + %g4
	.word	0xf7067fe8	! t0_kref+0x2e34:   	ld	[%i1 - 0x18], %f27
	.word	0xdf00a038	! t0_kref+0x2e38:   	ld	[%g2 + 0x38], %f15
	.word	0xaea2801d	! t0_kref+0x2e3c:   	subcc	%o2, %i5, %l7
	.word	0xa9400000	! t0_kref+0x2e40:   	mov	%y, %l4
	.word	0x93b30490	! t0_kref+0x2e44:   	fcmple32	%f12, %f16, %o1
	.word	0x9870284b	! t0_kref+0x2e48:   	udiv	%g0, 0x84b, %o4
	.word	0xacf02664	! t0_kref+0x2e4c:   	udivcc	%g0, 0x664, %l6
	.word	0x9fa0053a	! t0_kref+0x2e50:   	fsqrts	%f26, %f15
	.word	0xc5ee100a	! t0_kref+0x2e54:   	prefetcha	%i0 + %o2, 2
	.word	0xd0d01018	! t0_kref+0x2e58:   	ldsha	[%g0 + %i0]0x80, %o0
	.word	0xed1fbe98	! t0_kref+0x2e5c:   	ldd	[%fp - 0x168], %f22
	.word	0xab44c000	! t0_kref+0x2e60:   	mov	%gsr, %l5
	.word	0x91b280fc	! t0_kref+0x2e64:   	edge16ln	%o2, %i4, %o0
	.word	0x9092800d	! t0_kref+0x2e68:   	orcc	%o2, %o5, %o0
	.word	0xda40a008	! t0_kref+0x2e6c:   	ldsw	[%g2 + 8], %o5
	.word	0xd010a002	! t0_kref+0x2e70:   	lduh	[%g2 + 2], %o0
	.word	0xed68a0c9	! t0_kref+0x2e74:   	prefetch	%g2 + 0xc9, 22
	.word	0xa92ea01e	! t0_kref+0x2e78:   	sll	%i2, 0x1e, %l4
	.word	0x9de3bfa0	! t0_kref+0x2e7c:   	save	%sp, -0x60, %sp
	.word	0xabeee503	! t0_kref+0x2e80:   	restore	%i3, 0x503, %l5
	.word	0xa5a4894c	! t0_kref+0x2e84:   	fmuld	%f18, %f12, %f18
	.word	0xb1a0052d	! t0_kref+0x2e88:   	fsqrts	%f13, %f24
	.word	0x960277d1	! t0_kref+0x2e8c:   	add	%o1, -0x82f, %o3
	.word	0x940f000d	! t0_kref+0x2e90:   	and	%i4, %o5, %o2
	.word	0x92933492	! t0_kref+0x2e94:   	orcc	%o4, -0xb6e, %o1
	.word	0xafa018ce	! t0_kref+0x2e98:   	fdtos	%f14, %f23
	.word	0xada609d4	! t0_kref+0x2e9c:   	fdivd	%f24, %f20, %f22
	.word	0x81ae0a4c	! t0_kref+0x2ea0:   	fcmpd	%fcc0, %f24, %f12
	.word	0xd230a020	! t0_kref+0x2ea4:   	sth	%o1, [%g2 + 0x20]
	.word	0xe99e5a5b	! t0_kref+0x2ea8:   	ldda	[%i1 + %i3]0xd2, %f20
	.word	0xc568a0ca	! t0_kref+0x2eac:   	prefetch	%g2 + 0xca, 2
	.word	0xa7a01a3b	! t0_kref+0x2eb0:   	fstoi	%f27, %f19
	.word	0xe720a020	! t0_kref+0x2eb4:   	st	%f19, [%g2 + 0x20]
	.word	0xfa300019	! t0_kref+0x2eb8:   	sth	%i5, [%g0 + %i1]
	.word	0xaf400000	! t0_kref+0x2ebc:   	mov	%y, %l7
	.word	0xb1b48eda	! t0_kref+0x2ec0:   	fornot2	%f18, %f26, %f24
	.word	0x9de3bfa0	! t0_kref+0x2ec4:   	save	%sp, -0x60, %sp
	.word	0xb2362e70	! t0_kref+0x2ec8:   	orn	%i0, 0xe70, %i1
	.word	0x93e80000	! t0_kref+0x2ecc:   	restore	%g0, %g0, %o1
	.word	0xa3a000b6	! t0_kref+0x2ed0:   	fnegs	%f22, %f17
	.word	0xef00a020	! t0_kref+0x2ed4:   	ld	[%g2 + 0x20], %f23
	.word	0xea160000	! t0_kref+0x2ed8:   	lduh	[%i0], %l5
	.word	0xaea726f7	! t0_kref+0x2edc:   	subcc	%i4, 0x6f7, %l7
	.word	0x34800002	! t0_kref+0x2ee0:   	bg,a	_kref+0x2ee8
	.word	0x98ba800b	! t0_kref+0x2ee4:   	xnorcc	%o2, %o3, %o4
	.word	0xc568a089	! t0_kref+0x2ee8:   	prefetch	%g2 + 0x89, 2
	.word	0xc0762018	! t0_kref+0x2eec:   	stx	%g0, [%i0 + 0x18]
	.word	0x9fc10000	! t0_kref+0x2ef0:   	call	%g4
	.word	0x94c2acef	! t0_kref+0x2ef4:   	addccc	%o2, 0xcef, %o2
	.word	0xaa03001c	! t0_kref+0x2ef8:   	add	%o4, %i4, %l5
	.word	0x39480007	! t0_kref+0x2efc:   	fbuge,a,pt	%fcc0, _kref+0x2f18
	.word	0xa5a01931	! t0_kref+0x2f00:   	fstod	%f17, %f18
	.word	0x9af6ac57	! t0_kref+0x2f04:   	udivcc	%i2, 0xc57, %o5
	.word	0x9fa00537	! t0_kref+0x2f08:   	fsqrts	%f23, %f15
	.word	0xf11fbdf8	! t0_kref+0x2f0c:   	ldd	[%fp - 0x208], %f24
	.word	0xaedb22f2	! t0_kref+0x2f10:   	smulcc	%o4, 0x2f2, %l7
	.word	0x9abafed5	! t0_kref+0x2f14:   	xnorcc	%o3, -0x12b, %o5
	.word	0xd636401b	! t0_kref+0x2f18:   	sth	%o3, [%i1 + %i3]
	.word	0xec50a00a	! t0_kref+0x2f1c:   	ldsh	[%g2 + 0xa], %l6
	.word	0xa3a00531	! t0_kref+0x2f20:   	fsqrts	%f17, %f17
	.word	0xf906001c	! t0_kref+0x2f24:   	ld	[%i0 + %i4], %f28
	.word	0x96f376e1	! t0_kref+0x2f28:   	udivcc	%o5, -0x91f, %o3
	.word	0x9da01a58	! t0_kref+0x2f2c:   	fdtoi	%f24, %f14
	.word	0x8143c000	! t0_kref+0x2f30:   	stbar
	.word	0x9043000b	! t0_kref+0x2f34:   	addc	%o4, %o3, %o0
	.word	0xadb2832b	! t0_kref+0x2f38:   	bmask	%o2, %o3, %l6
	.word	0x86102015	! t0_kref+0x2f3c:   	mov	0x15, %g3
	.word	0x86a0e001	! t0_kref+0x2f40:   	subcc	%g3, 1, %g3
	.word	0x22800003	! t0_kref+0x2f44:   	be,a	_kref+0x2f50
	.word	0xa1a389b2	! t0_kref+0x2f48:   	fdivs	%f14, %f18, %f16
	.word	0xafb74fad	! t0_kref+0x2f4c:   	fors	%f29, %f13, %f23
	.word	0xb9a0193c	! t0_kref+0x2f50:   	fstod	%f28, %f28
	.word	0xf51f4018	! t0_kref+0x2f54:   	ldd	[%i5 + %i0], %f26
	.word	0xb3a018da	! t0_kref+0x2f58:   	fdtos	%f26, %f25
	.word	0xac5f6733	! t0_kref+0x2f5c:   	smul	%i5, 0x733, %l6
	.word	0x33480004	! t0_kref+0x2f60:   	fbe,a,pt	%fcc0, _kref+0x2f70
	.word	0xb1a01937	! t0_kref+0x2f64:   	fstod	%f23, %f24
	.word	0xf900a020	! t0_kref+0x2f68:   	ld	[%g2 + 0x20], %f28
	.word	0xec40a010	! t0_kref+0x2f6c:   	ldsw	[%g2 + 0x10], %l6
	.word	0xd4200018	! t0_kref+0x2f70:   	st	%o2, [%g0 + %i0]
	.word	0x93b240dd	! t0_kref+0x2f74:   	edge16l	%o1, %i5, %o1
	.word	0x93400000	! t0_kref+0x2f78:   	mov	%y, %o1
	.word	0xe8000019	! t0_kref+0x2f7c:   	ld	[%g0 + %i1], %l4
	.word	0x95a5894a	! t0_kref+0x2f80:   	fmuld	%f22, %f10, %f10
	.word	0x96f6c01b	! t0_kref+0x2f84:   	udivcc	%i3, %i3, %o3
	.word	0xafa54836	! t0_kref+0x2f88:   	fadds	%f21, %f22, %f23
	.word	0xd468a003	! t0_kref+0x2f8c:   	ldstub	[%g2 + 3], %o2
	.word	0x28800002	! t0_kref+0x2f90:   	bleu,a	_kref+0x2f98
	.word	0xb1a388d6	! t0_kref+0x2f94:   	fsubd	%f14, %f22, %f24
	.word	0xe168a083	! t0_kref+0x2f98:   	prefetch	%g2 + 0x83, 16
	.word	0xa9b386b5	! t0_kref+0x2f9c:   	fmul8x16al	%f14, %f21, %f20
	.word	0xd8366006	! t0_kref+0x2fa0:   	sth	%o4, [%i1 + 6]
	.word	0x95b384cc	! t0_kref+0x2fa4:   	fcmpne32	%f14, %f12, %o2
	.word	0xc12e401c	! t0_kref+0x2fa8:   	st	%fsr, [%i1 + %i4]
	.word	0xa8534009	! t0_kref+0x2fac:   	umul	%o5, %o1, %l4
	.word	0xd8166010	! t0_kref+0x2fb0:   	lduh	[%i1 + 0x10], %o4
	.word	0xa5a3894c	! t0_kref+0x2fb4:   	fmuld	%f14, %f12, %f18
	.word	0xb5b486dc	! t0_kref+0x2fb8:   	fmul8sux16	%f18, %f28, %f26
	.word	0x3e800008	! t0_kref+0x2fbc:   	bvc,a	_kref+0x2fdc
	.word	0xacdb0009	! t0_kref+0x2fc0:   	smulcc	%o4, %o1, %l6
	.word	0xa1a448ac	! t0_kref+0x2fc4:   	fsubs	%f17, %f12, %f16
	.word	0x900825f5	! t0_kref+0x2fc8:   	and	%g0, 0x5f5, %o0
	.word	0xa9b60418	! t0_kref+0x2fcc:   	fcmple16	%f24, %f24, %l4
	.word	0xa9b24100	! t0_kref+0x2fd0:   	edge32	%o1, %g0, %l4
	.word	0xada000b1	! t0_kref+0x2fd4:   	fnegs	%f17, %f22
	.word	0x9332a01e	! t0_kref+0x2fd8:   	srl	%o2, 0x1e, %o1
	.word	0xea00a020	! t0_kref+0x2fdc:   	ld	[%g2 + 0x20], %l5
	.word	0xa9b60dce	! t0_kref+0x2fe0:   	fnand	%f24, %f14, %f20
	.word	0xa7a01a4c	! t0_kref+0x2fe4:   	fdtoi	%f12, %f19
	.word	0x930b2811	! t0_kref+0x2fe8:   	tsubcc	%o4, 0x811, %o1
	.word	0xd99e200a	! t0_kref+0x2fec:   	ldda	[%i0 + 0xa]%asi, %f12
	.word	0x973e801d	! t0_kref+0x2ff0:   	sra	%i2, %i5, %o3
	.word	0xd1f6100b	! t0_kref+0x2ff4:   	casxa	[%i0]0x80, %o3, %o0
	.word	0xc0360000	! t0_kref+0x2ff8:   	clrh	[%i0]
	.word	0xb3a40835	! t0_kref+0x2ffc:   	fadds	%f16, %f21, %f25
	.word	0x35480005	! t0_kref+0x3000:   	fbue,a,pt	%fcc0, _kref+0x3014
	.word	0xea40a028	! t0_kref+0x3004:   	ldsw	[%g2 + 0x28], %l5
	.word	0x81af0a50	! t0_kref+0x3008:   	fcmpd	%fcc0, %f28, %f16
	.word	0xfb00a038	! t0_kref+0x300c:   	ld	[%g2 + 0x38], %f29
	.word	0xe9be6010	! t0_kref+0x3010:   	stda	%f20, [%i1 + 0x10]%asi
	.word	0xf1be5a1d	! t0_kref+0x3014:   	stda	%f24, [%i1 + %i5]0xd0
	.word	0xb1a308d6	! t0_kref+0x3018:   	fsubd	%f12, %f22, %f24
	.word	0xaebec00d	! t0_kref+0x301c:   	xnorcc	%i3, %o5, %l7
	.word	0x9236abb2	! t0_kref+0x3020:   	orn	%i2, 0xbb2, %o1
	.word	0xefee501d	! t0_kref+0x3024:   	prefetcha	%i1 + %i5, 23
	.word	0xd720a020	! t0_kref+0x3028:   	st	%f11, [%g2 + 0x20]
	.word	0xfa28a02b	! t0_kref+0x302c:   	stb	%i5, [%g2 + 0x2b]
	.word	0xa9a01916	! t0_kref+0x3030:   	fitod	%f22, %f20
	.word	0x973b000d	! t0_kref+0x3034:   	sra	%o4, %o5, %o3
	.word	0xa5a000b3	! t0_kref+0x3038:   	fnegs	%f19, %f18
	.word	0xf1ee101b	! t0_kref+0x303c:   	prefetcha	%i0 + %i3, 24
	.word	0x8143c000	! t0_kref+0x3040:   	stbar
	.word	0xafa0052f	! t0_kref+0x3044:   	fsqrts	%f15, %f23
	.word	0xa5a00558	! t0_kref+0x3048:   	fsqrtd	%f24, %f18
	.word	0xa1a0054c	! t0_kref+0x304c:   	fsqrtd	%f12, %f16
	.word	0xef20a000	! t0_kref+0x3050:   	st	%f23, [%g2]
	sethi	%hi(2f), %o7
	.word	0xe40be0a4	! t0_kref+0x3058:   	ldub	[%o7 + 0xa4], %l2
	.word	0xa41ca00c	! t0_kref+0x305c:   	xor	%l2, 0xc, %l2
	.word	0xe42be0a4	! t0_kref+0x3060:   	stb	%l2, [%o7 + 0xa4]
	.word	0x81dbe0a4	! t0_kref+0x3064:   	flush	%o7 + 0xa4
	.word	0x9da588ca	! t0_kref+0x3068:   	fsubd	%f22, %f10, %f14
	.word	0x8583401a	! t0_kref+0x306c:   	wr	%o5, %i2, %ccr
	.word	0x3e480007	! t0_kref+0x3070:   	bvc,a,pt	%icc, _kref+0x308c
	.word	0x97a0053a	! t0_kref+0x3074:   	fsqrts	%f26, %f11
	.word	0xed00a030	! t0_kref+0x3078:   	ld	[%g2 + 0x30], %f22
	.word	0xb5a00552	! t0_kref+0x307c:   	fsqrtd	%f18, %f26
	.word	0xa9a28852	! t0_kref+0x3080:   	faddd	%f10, %f18, %f20
	.word	0xaea30000	! t0_kref+0x3084:   	subcc	%o4, %g0, %l7
	.word	0xa82762ec	! t0_kref+0x3088:   	sub	%i5, 0x2ec, %l4
	.word	0xa3a649bc	! t0_kref+0x308c:   	fdivs	%f25, %f28, %f17
	.word	0x81ab4aba	! t0_kref+0x3090:   	fcmpes	%fcc0, %f13, %f26
	.word	0xaa9270ef	! t0_kref+0x3094:   	orcc	%o1, -0xf11, %l5
	.word	0x2c800007	! t0_kref+0x3098:   	bneg,a	_kref+0x30b4
	.word	0x97400000	! t0_kref+0x309c:   	mov	%y, %o3
	.word	0xad40c000	! t0_kref+0x30a0:   	mov	%asi, %l6
2:	.word	0xa9a018d4	! t0_kref+0x30a4:   	fdtos	%f20, %f20
	.word	0xf42e6015	! t0_kref+0x30a8:   	stb	%i2, [%i1 + 0x15]
	.word	0xe5e6501c	! t0_kref+0x30ac:   	casa	[%i1]0x80, %i4, %l2
	.word	0x9072e460	! t0_kref+0x30b0:   	udiv	%o3, 0x460, %o0
	.word	0xadb74160	! t0_kref+0x30b4:   	edge32ln	%i5, %g0, %l6
	.word	0x97b28496	! t0_kref+0x30b8:   	fcmple32	%f10, %f22, %o3
	.word	0xfb063ff8	! t0_kref+0x30bc:   	ld	[%i0 - 8], %f29
	.word	0xf628a012	! t0_kref+0x30c0:   	stb	%i3, [%g2 + 0x12]
	.word	0xb9b6062e	! t0_kref+0x30c4:   	fmul8x16	%f24, %f14, %f28
	.word	0xbba01a50	! t0_kref+0x30c8:   	fdtoi	%f16, %f29
	.word	0x949aadca	! t0_kref+0x30cc:   	xorcc	%o2, 0xdca, %o2
	.word	0xb5b40e4c	! t0_kref+0x30d0:   	fxnor	%f16, %f12, %f26
	.word	0x3d480004	! t0_kref+0x30d4:   	fbule,a,pt	%fcc0, _kref+0x30e4
	.word	0x905369c5	! t0_kref+0x30d8:   	umul	%o5, 0x9c5, %o0
	.word	0xaf3f401d	! t0_kref+0x30dc:   	sra	%i5, %i5, %l7
	.word	0x9f414000	! t0_kref+0x30e0:   	mov	%pc, %o7
	.word	0xa1a509ca	! t0_kref+0x30e4:   	fdivd	%f20, %f10, %f16
	.word	0xada68856	! t0_kref+0x30e8:   	faddd	%f26, %f22, %f22
	sethi	%hi(2f), %o7
	.word	0xe40be110	! t0_kref+0x30f0:   	ldub	[%o7 + 0x110], %l2
	.word	0xa41ca00c	! t0_kref+0x30f4:   	xor	%l2, 0xc, %l2
	.word	0xe42be110	! t0_kref+0x30f8:   	stb	%l2, [%o7 + 0x110]
	.word	0x81dbe110	! t0_kref+0x30fc:   	flush	%o7 + 0x110
	.word	0xb1a01939	! t0_kref+0x3100:   	fstod	%f25, %f24
	.word	0xd240a028	! t0_kref+0x3104:   	ldsw	[%g2 + 0x28], %o1
	.word	0xb7a01a4e	! t0_kref+0x3108:   	fdtoi	%f14, %f27
	.word	0x9226c00d	! t0_kref+0x310c:   	sub	%i3, %o5, %o1
2:	.word	0xa7a00531	! t0_kref+0x3110:   	fsqrts	%f17, %f19
	.word	0x26800002	! t0_kref+0x3114:   	bl,a	_kref+0x311c
	.word	0x90da401b	! t0_kref+0x3118:   	smulcc	%o1, %i3, %o0
	.word	0x93b30020	! t0_kref+0x311c:   	edge8n	%o4, %g0, %o1
	.word	0x9bb44a7a	! t0_kref+0x3120:   	fpadd32s	%f17, %f26, %f13
	.word	0x9ba018ce	! t0_kref+0x3124:   	fdtos	%f14, %f13
	.word	0x9db6890c	! t0_kref+0x3128:   	faligndata	%f26, %f12, %f14
	.word	0xed070019	! t0_kref+0x312c:   	ld	[%i4 + %i1], %f22
	.word	0xb5a000b9	! t0_kref+0x3130:   	fnegs	%f25, %f26
	.word	0xc56e7ff8	! t0_kref+0x3134:   	prefetch	%i1 - 8, 2
	.word	0xbba000b3	! t0_kref+0x3138:   	fnegs	%f19, %f29
	.word	0xe168a082	! t0_kref+0x313c:   	prefetch	%g2 + 0x82, 16
	.word	0xa9a0052f	! t0_kref+0x3140:   	fsqrts	%f15, %f20
	.word	0xa9a2c8b7	! t0_kref+0x3144:   	fsubs	%f11, %f23, %f20
	.word	0xa9b0007a	! t0_kref+0x3148:   	edge8ln	%g0, %i2, %l4
	.word	0xb1b00c20	! t0_kref+0x314c:   	fzeros	%f24
	.word	0xadb2c32b	! t0_kref+0x3150:   	bmask	%o3, %o3, %l6
	.word	0x96bea7b1	! t0_kref+0x3154:   	xnorcc	%i2, 0x7b1, %o3
	.word	0xa1b009b6	! t0_kref+0x3158:   	fexpand	%f22, %f16
	.word	0xeb06001c	! t0_kref+0x315c:   	ld	[%i0 + %i4], %f21
	.word	0xe86e6014	! t0_kref+0x3160:   	ldstub	[%i1 + 0x14], %l4
	.word	0xa5a0105a	! t0_kref+0x3164:   	fdtox	%f26, %f18
	.word	0x99a0002c	! t0_kref+0x3168:   	fmovs	%f12, %f12
	.word	0x9a32fbc4	! t0_kref+0x316c:   	orn	%o3, -0x43c, %o5
	.word	0x96c28009	! t0_kref+0x3170:   	addccc	%o2, %o1, %o3
	call	SYM(t0_subr0)
	.word	0xa5a0190d	! t0_kref+0x3178:   	fitod	%f13, %f18
	.word	0x99a0054e	! t0_kref+0x317c:   	fsqrtd	%f14, %f12
	.word	0x96e00000	! t0_kref+0x3180:   	subccc	%g0, %g0, %o3
	.word	0xadb40c72	! t0_kref+0x3184:   	fnors	%f16, %f18, %f22
	.word	0xd410a018	! t0_kref+0x3188:   	lduh	[%g2 + 0x18], %o2
	.word	0x94037117	! t0_kref+0x318c:   	add	%o5, -0xee9, %o2
	.word	0x8d874009	! t0_kref+0x3190:   	wr	%i5, %o1, %fprs
	.word	0x9db74a2d	! t0_kref+0x3194:   	fpadd16s	%f29, %f13, %f14
	.word	0xf42e6018	! t0_kref+0x3198:   	stb	%i2, [%i1 + 0x18]
	.word	0xa8727932	! t0_kref+0x319c:   	udiv	%o1, -0x6ce, %l4
	.word	0x9360a36b	! t0_kref+0x31a0:   	movlg	%fcc0, 0x36b, %o1
	.word	0xeb067fec	! t0_kref+0x31a4:   	ld	[%i1 - 0x14], %f21
	.word	0xda062008	! t0_kref+0x31a8:   	ld	[%i0 + 8], %o5
	.word	0xa1a000ba	! t0_kref+0x31ac:   	fnegs	%f26, %f16
	.word	0xb9b2c6b2	! t0_kref+0x31b0:   	fmul8x16al	%f11, %f18, %f28
	.word	0x9fc00004	! t0_kref+0x31b4:   	call	%g0 + %g4
	.word	0x9762a748	! t0_kref+0x31b8:   	movue	%fcc0, -0xb8, %o3
	.word	0xbba018d8	! t0_kref+0x31bc:   	fdtos	%f24, %f29
	.word	0x2b800002	! t0_kref+0x31c0:   	fbug,a	_kref+0x31c8
	.word	0xd440a020	! t0_kref+0x31c4:   	ldsw	[%g2 + 0x20], %o2
	.word	0xf9067ff4	! t0_kref+0x31c8:   	ld	[%i1 - 0xc], %f28
	.word	0x31480001	! t0_kref+0x31cc:   	fba,a,pt	%fcc0, _kref+0x31d0
	.word	0xe96e3fe0	! t0_kref+0x31d0:   	prefetch	%i0 - 0x20, 20
	.word	0x99a000b6	! t0_kref+0x31d4:   	fnegs	%f22, %f12
	.word	0xa1a0015c	! t0_kref+0x31d8:   	fabsd	%f28, %f16
	.word	0xd840a010	! t0_kref+0x31dc:   	ldsw	[%g2 + 0x10], %o4
	.word	0xb1a01a4c	! t0_kref+0x31e0:   	fdtoi	%f12, %f24
	.word	0xec78a030	! t0_kref+0x31e4:   	swap	[%g2 + 0x30], %l6
	.word	0xd51fbe88	! t0_kref+0x31e8:   	ldd	[%fp - 0x178], %f10
	.word	0x94da401d	! t0_kref+0x31ec:   	smulcc	%o1, %i5, %o2
	.word	0x27480002	! t0_kref+0x31f0:   	fbul,a,pt	%fcc0, _kref+0x31f8
	.word	0xad0ac01a	! t0_kref+0x31f4:   	tsubcc	%o3, %i2, %l6
	.word	0xf500a018	! t0_kref+0x31f8:   	ld	[%g2 + 0x18], %f26
	.word	0xae3aa84d	! t0_kref+0x31fc:   	xnor	%o2, 0x84d, %l7
	.word	0x99b2c01a	! t0_kref+0x3200:   	edge8	%o3, %i2, %o4
	.word	0x9fc00004	! t0_kref+0x3204:   	call	%g0 + %g4
	.word	0x99a01931	! t0_kref+0x3208:   	fstod	%f17, %f12
	.word	0xafa0053a	! t0_kref+0x320c:   	fsqrts	%f26, %f23
	.word	0x973ea01b	! t0_kref+0x3210:   	sra	%i2, 0x1b, %o3
	.word	0xa85a801a	! t0_kref+0x3214:   	smul	%o2, %i2, %l4
	.word	0xb3a01a4e	! t0_kref+0x3218:   	fdtoi	%f14, %f25
	.word	0xea50a038	! t0_kref+0x321c:   	ldsh	[%g2 + 0x38], %l5
	.word	0xb9b4066c	! t0_kref+0x3220:   	fmul8x16au	%f16, %f12, %f28
	.word	0xa9b686f0	! t0_kref+0x3224:   	fmul8ulx16	%f26, %f16, %f20
	.word	0xb5a0054e	! t0_kref+0x3228:   	fsqrtd	%f14, %f26
	.word	0xa7a4c9b9	! t0_kref+0x322c:   	fdivs	%f19, %f25, %f19
	.word	0xb1a0055a	! t0_kref+0x3230:   	fsqrtd	%f26, %f24
	.word	0xb1b6899a	! t0_kref+0x3234:   	bshuffle	%f26, %f26, %f24
	.word	0xafa00531	! t0_kref+0x3238:   	fsqrts	%f17, %f23
	sethi	%hi(2f), %o7
	.word	0xe40be278	! t0_kref+0x3240:   	ldub	[%o7 + 0x278], %l2
	.word	0xa41ca00c	! t0_kref+0x3244:   	xor	%l2, 0xc, %l2
	.word	0xe42be278	! t0_kref+0x3248:   	stb	%l2, [%o7 + 0x278]
	.word	0x81dbe278	! t0_kref+0x324c:   	flush	%o7 + 0x278
	.word	0xef066004	! t0_kref+0x3250:   	ld	[%i1 + 4], %f23
	.word	0xa822e32c	! t0_kref+0x3254:   	sub	%o3, 0x32c, %l4
	.word	0xed68a0ca	! t0_kref+0x3258:   	prefetch	%g2 + 0xca, 22
	.word	0x953ea002	! t0_kref+0x325c:   	sra	%i2, 0x2, %o2
	.word	0xb9a00556	! t0_kref+0x3260:   	fsqrtd	%f22, %f28
	.word	0xad408000	! t0_kref+0x3264:   	mov	%ccr, %l6
	.word	0xa1a0002b	! t0_kref+0x3268:   	fmovs	%f11, %f16
	.word	0xc12e001c	! t0_kref+0x326c:   	st	%fsr, [%i0 + %i4]
	.word	0x9806800d	! t0_kref+0x3270:   	add	%i2, %o5, %o4
	.word	0xe8180018	! t0_kref+0x3274:   	ldd	[%g0 + %i0], %l4
2:	.word	0xacc2bde6	! t0_kref+0x3278:   	addccc	%o2, -0x21a, %l6
	.word	0xd000a020	! t0_kref+0x327c:   	ld	[%g2 + 0x20], %o0
	.word	0x9297001b	! t0_kref+0x3280:   	orcc	%i4, %i3, %o1
	.word	0xb1a0105c	! t0_kref+0x3284:   	fdtox	%f28, %f24
	.word	0x9830001d	! t0_kref+0x3288:   	orn	%g0, %i5, %o4
	.word	0xa5a38d2d	! t0_kref+0x328c:   	fsmuld	%f14, %f13, %f18
	.word	0x9770001a	! t0_kref+0x3290:   	popc	%i2, %o3
	.word	0x9fa018d0	! t0_kref+0x3294:   	fdtos	%f16, %f15
	.word	0xac3af37f	! t0_kref+0x3298:   	xnor	%o3, -0xc81, %l6
	.word	0xe9871018	! t0_kref+0x329c:   	lda	[%i4 + %i0]0x80, %f20
	.word	0xa7a000bd	! t0_kref+0x32a0:   	fnegs	%f29, %f19
	.word	0xabb34280	! t0_kref+0x32a4:   	array32	%o5, %g0, %l5
	.word	0xec16c018	! t0_kref+0x32a8:   	lduh	[%i3 + %i0], %l6
	.word	0xda0e401a	! t0_kref+0x32ac:   	ldub	[%i1 + %i2], %o5
	.word	0xec40a038	! t0_kref+0x32b0:   	ldsw	[%g2 + 0x38], %l6
	.word	0x99400000	! t0_kref+0x32b4:   	mov	%y, %o4
	.word	0x96633f62	! t0_kref+0x32b8:   	subc	%o4, -0x9e, %o3
	.word	0x9db00774	! t0_kref+0x32bc:   	fpack16	%f20, %f14
	.word	0xe76e6008	! t0_kref+0x32c0:   	prefetch	%i1 + 8, 19
	.word	0x96e3401d	! t0_kref+0x32c4:   	subccc	%o5, %i5, %o3
	.word	0xa822a9cd	! t0_kref+0x32c8:   	sub	%o2, 0x9cd, %l4
	.word	0x25480008	! t0_kref+0x32cc:   	fblg,a,pt	%fcc0, _kref+0x32ec
	.word	0xe83e001d	! t0_kref+0x32d0:   	std	%l4, [%i0 + %i5]
	.word	0x81874000	! t0_kref+0x32d4:   	wr	%i5, %g0, %y
	.word	0x9b2a801c	! t0_kref+0x32d8:   	sll	%o2, %i4, %o5
	.word	0xac0ec01b	! t0_kref+0x32dc:   	and	%i3, %i3, %l6
	.word	0xa89f001c	! t0_kref+0x32e0:   	xorcc	%i4, %i4, %l4
	.word	0xd51e6018	! t0_kref+0x32e4:   	ldd	[%i1 + 0x18], %f10
	.word	0x90bb000d	! t0_kref+0x32e8:   	xnorcc	%o4, %o5, %o0
	.word	0xeb6e3ff8	! t0_kref+0x32ec:   	prefetch	%i0 - 8, 21
	.word	0xf500a018	! t0_kref+0x32f0:   	ld	[%g2 + 0x18], %f26
	.word	0xf76e401a	! t0_kref+0x32f4:   	prefetch	%i1 + %i2, 27
	.word	0xafa00037	! t0_kref+0x32f8:   	fmovs	%f23, %f23
	.word	0x93b000c0	! t0_kref+0x32fc:   	edge16l	%g0, %g0, %o1
	.word	0xadb00f1c	! t0_kref+0x3300:   	fsrc2	%f28, %f22
	.word	0x9267400b	! t0_kref+0x3304:   	subc	%i5, %o3, %o1
	.word	0x9da0055c	! t0_kref+0x3308:   	fsqrtd	%f28, %f14
	.word	0x993a400a	! t0_kref+0x330c:   	sra	%o1, %o2, %o4
	.word	0xafb740db	! t0_kref+0x3310:   	edge16l	%i5, %i3, %l7
	.word	0xc06e3fe9	! t0_kref+0x3314:   	ldstub	[%i0 - 0x17], %g0
	.word	0x9fc00004	! t0_kref+0x3318:   	call	%g0 + %g4
	.word	0x90aec000	! t0_kref+0x331c:   	andncc	%i3, %g0, %o0
	.word	0x81ac8a4e	! t0_kref+0x3320:   	fcmpd	%fcc0, %f18, %f14
	.word	0xd630a000	! t0_kref+0x3324:   	sth	%o3, [%g2]
	.word	0xdd871058	! t0_kref+0x3328:   	lda	[%i4 + %i0]0x82, %f14
	.word	0xb7b40e72	! t0_kref+0x332c:   	fxnors	%f16, %f18, %f27
	.word	0x32480007	! t0_kref+0x3330:   	bne,a,pt	%icc, _kref+0x334c
	.word	0x940b35b8	! t0_kref+0x3334:   	and	%o4, -0xa48, %o2
	.word	0x20800003	! t0_kref+0x3338:   	bn,a	_kref+0x3344
	.word	0xd62e2016	! t0_kref+0x333c:   	stb	%o3, [%i0 + 0x16]
	.word	0xc030a02a	! t0_kref+0x3340:   	clrh	[%g2 + 0x2a]
	.word	0xaa9f0009	! t0_kref+0x3344:   	xorcc	%i4, %o1, %l5
	.word	0xc030a02a	! t0_kref+0x3348:   	clrh	[%g2 + 0x2a]
	.word	0xc56e3fe0	! t0_kref+0x334c:   	prefetch	%i0 - 0x20, 2
	.word	0x90073a2a	! t0_kref+0x3350:   	add	%i4, -0x5d6, %o0
	.word	0x9de3bfa0	! t0_kref+0x3354:   	save	%sp, -0x60, %sp
	.word	0xb5073a0e	! t0_kref+0x3358:   	taddcc	%i4, -0x5f2, %i2
	.word	0x91eec019	! t0_kref+0x335c:   	restore	%i3, %i1, %o0
	.word	0xb5a018d2	! t0_kref+0x3360:   	fdtos	%f18, %f26
	.word	0x8143c000	! t0_kref+0x3364:   	stbar
	.word	0xd010a000	! t0_kref+0x3368:   	lduh	[%g2], %o0
	.word	0x9456800d	! t0_kref+0x336c:   	umul	%i2, %o5, %o2
	.word	0x965b401d	! t0_kref+0x3370:   	smul	%o5, %i5, %o3
	.word	0x83414000	! t0_kref+0x3374:   	mov	%pc, %g1
	.word	0x81ac8a4c	! t0_kref+0x3378:   	fcmpd	%fcc0, %f18, %f12
	.word	0x9bb24349	! t0_kref+0x337c:   	alignaddrl	%o1, %o1, %o5
	.word	0xa8202440	! t0_kref+0x3380:   	sub	%g0, 0x440, %l4
	.word	0x95b2413b	! t0_kref+0x3384:   	edge32n	%o1, %i3, %o2
	.word	0x99b5cc6d	! t0_kref+0x3388:   	fnors	%f23, %f13, %f12
	.word	0x97a01a2f	! t0_kref+0x338c:   	fstoi	%f15, %f11
	.word	0xaa0b401d	! t0_kref+0x3390:   	and	%o5, %i5, %l5
	.word	0xf8f01018	! t0_kref+0x3394:   	stxa	%i4, [%g0 + %i0]0x80
	.word	0xed1e001d	! t0_kref+0x3398:   	ldd	[%i0 + %i5], %f22
	.word	0x878020f0	! t0_kref+0x339c:   	mov	0xf0, %asi
	.word	0xa9a6894e	! t0_kref+0x33a0:   	fmuld	%f26, %f14, %f20
	.word	0x81ad8ad2	! t0_kref+0x33a4:   	fcmped	%fcc0, %f22, %f18
	.word	0xada0012c	! t0_kref+0x33a8:   	fabss	%f12, %f22
	.word	0x95a388d8	! t0_kref+0x33ac:   	fsubd	%f14, %f24, %f10
	.word	0x99b0003c	! t0_kref+0x33b0:   	edge8n	%g0, %i4, %o4
	.word	0x2f480004	! t0_kref+0x33b4:   	fbu,a,pt	%fcc0, _kref+0x33c4
	.word	0xaf44c000	! t0_kref+0x33b8:   	mov	%gsr, %l7
	.word	0xb9a0055a	! t0_kref+0x33bc:   	fsqrtd	%f26, %f28
	.word	0x96f727dd	! t0_kref+0x33c0:   	udivcc	%i4, 0x7dd, %o3
	.word	0xe3b8a040	! t0_kref+0x33c4:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x997028f4	! t0_kref+0x33c8:   	popc	0x8f4, %o4
	.word	0x99a0052e	! t0_kref+0x33cc:   	fsqrts	%f14, %f12
	.word	0xa9a3884a	! t0_kref+0x33d0:   	faddd	%f14, %f10, %f20
	.word	0x980039ea	! t0_kref+0x33d4:   	add	%g0, -0x616, %o4
	.word	0xc768a0c3	! t0_kref+0x33d8:   	prefetch	%g2 + 0xc3, 3
	.word	0xda28a023	! t0_kref+0x33dc:   	stb	%o5, [%g2 + 0x23]
	.word	0xa5a0055c	! t0_kref+0x33e0:   	fsqrtd	%f28, %f18
	.word	0xd91fbc80	! t0_kref+0x33e4:   	ldd	[%fp - 0x380], %f12
	.word	0xe4086090	! t0_kref+0x33e8:   	ldub	[%g1 + 0x90], %l2
	.word	0xa41ca00c	! t0_kref+0x33ec:   	xor	%l2, 0xc, %l2
	.word	0xe4286090	! t0_kref+0x33f0:   	stb	%l2, [%g1 + 0x90]
	.word	0x81d86090	! t0_kref+0x33f4:   	flush	%g1 + 0x90
	.word	0x9ba018d8	! t0_kref+0x33f8:   	fdtos	%f24, %f13
	.word	0xdb060000	! t0_kref+0x33fc:   	ld	[%i0], %f13
	.word	0xae5aed74	! t0_kref+0x3400:   	smul	%o3, 0xd74, %l7
2:	.word	0xacda4009	! t0_kref+0x3404:   	smulcc	%o1, %o1, %l6
	.word	0x9db38c54	! t0_kref+0x3408:   	fnor	%f14, %f20, %f14
	.word	0x99a0190e	! t0_kref+0x340c:   	fitod	%f14, %f12
	.word	0xae127ee6	! t0_kref+0x3410:   	or	%o1, -0x11a, %l7
	.word	0x95a6cd3b	! t0_kref+0x3414:   	fsmuld	%f27, %f27, %f10
	.word	0x90503c97	! t0_kref+0x3418:   	umul	%g0, -0x369, %o0
	.word	0xe91fbee0	! t0_kref+0x341c:   	ldd	[%fp - 0x120], %f20
	.word	0x81af0acc	! t0_kref+0x3420:   	fcmped	%fcc0, %f28, %f12
	.word	0xe06e200e	! t0_kref+0x3424:   	ldstub	[%i0 + 0xe], %l0
	.word	0xda100018	! t0_kref+0x3428:   	lduh	[%g0 + %i0], %o5
	.word	0xf586101c	! t0_kref+0x342c:   	lda	[%i0 + %i4]0x80, %f26
	.word	0xb5b00f0a	! t0_kref+0x3430:   	fsrc2	%f10, %f26
	.word	0x8143c000	! t0_kref+0x3434:   	stbar
	.word	0x92c6f361	! t0_kref+0x3438:   	addccc	%i3, -0xc9f, %o1
	.word	0xe900a000	! t0_kref+0x343c:   	ld	[%g2], %f20
	.word	0xe99e1a1d	! t0_kref+0x3440:   	ldda	[%i0 + %i5]0xd0, %f20
	.word	0x99a00138	! t0_kref+0x3444:   	fabss	%f24, %f12
	.word	0xa1a0192f	! t0_kref+0x3448:   	fstod	%f15, %f16
	.word	0x9fc10000	! t0_kref+0x344c:   	call	%g4
	.word	0xada01a52	! t0_kref+0x3450:   	fdtoi	%f18, %f22
	.word	0xc026200c	! t0_kref+0x3454:   	clr	[%i0 + 0xc]
	.word	0xa93b000c	! t0_kref+0x3458:   	sra	%o4, %o4, %l4
	.word	0xafb38dae	! t0_kref+0x345c:   	fxors	%f14, %f14, %f23
	.word	0xf5ee501d	! t0_kref+0x3460:   	prefetcha	%i1 + %i5, 26
	.word	0x9161001c	! t0_kref+0x3464:   	movl	%fcc0, %i4, %o0
	.word	0x9062801d	! t0_kref+0x3468:   	subc	%o2, %i5, %o0
	.word	0x81ac8a2b	! t0_kref+0x346c:   	fcmps	%fcc0, %f18, %f11
	.word	0x98f74009	! t0_kref+0x3470:   	udivcc	%i5, %o1, %o4
	.word	0xda2e7ff3	! t0_kref+0x3474:   	stb	%o5, [%i1 - 0xd]
	.word	0x93b7402c	! t0_kref+0x3478:   	edge8n	%i5, %o4, %o1
	.word	0x24800005	! t0_kref+0x347c:   	ble,a	_kref+0x3490
	.word	0xa9b3c731	! t0_kref+0x3480:   	fmuld8ulx16	%f15, %f17, %f20
	.word	0xbba018cc	! t0_kref+0x3484:   	fdtos	%f12, %f29
	.word	0x2e800005	! t0_kref+0x3488:   	bvs,a	_kref+0x349c
	.word	0xe3b8a040	! t0_kref+0x348c:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xb1a0052f	! t0_kref+0x3490:   	fsqrts	%f15, %f24
	.word	0xa1a489d6	! t0_kref+0x3494:   	fdivd	%f18, %f22, %f16
	.word	0xc807bfe4	! t0_kref+0x3498:   	ld	[%fp - 0x1c], %g4
	.word	0xa1a00532	! t0_kref+0x349c:   	fsqrts	%f18, %f16
	.word	0xc398a080	! t0_kref+0x34a0:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0xdace105a	! t0_kref+0x34a4:   	ldsba	[%i0 + %i2]0x82, %o5
	.word	0xb5a00556	! t0_kref+0x34a8:   	fsqrtd	%f22, %f26
	.word	0x9fc10000	! t0_kref+0x34ac:   	call	%g4
	.word	0xe51e6008	! t0_kref+0x34b0:   	ldd	[%i1 + 8], %f18
	.word	0xa8da7bca	! t0_kref+0x34b4:   	smulcc	%o1, -0x436, %l4
	.word	0xeb68a002	! t0_kref+0x34b8:   	prefetch	%g2 + 2, 21
	.word	0xa8926dac	! t0_kref+0x34bc:   	orcc	%o1, 0xdac, %l4
	.word	0xa7a01a33	! t0_kref+0x34c0:   	fstoi	%f19, %f19
	.word	0xacc2f21f	! t0_kref+0x34c4:   	addccc	%o3, -0xde1, %l6
	.word	0x97400000	! t0_kref+0x34c8:   	mov	%y, %o3
	.word	0xc398a080	! t0_kref+0x34cc:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0x98124000	! t0_kref+0x34d0:   	or	%o1, %g0, %o4
	.word	0x93b6044e	! t0_kref+0x34d4:   	fcmpne16	%f24, %f14, %o1
	.word	0xf8200019	! t0_kref+0x34d8:   	st	%i4, [%g0 + %i1]
	.word	0xac1271bd	! t0_kref+0x34dc:   	or	%o1, -0xe43, %l6
	.word	0xe3b8a040	! t0_kref+0x34e0:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xeb00a010	! t0_kref+0x34e4:   	ld	[%g2 + 0x10], %f21
	.word	0xe83e401d	! t0_kref+0x34e8:   	std	%l4, [%i1 + %i5]
	.word	0xd848a030	! t0_kref+0x34ec:   	ldsb	[%g2 + 0x30], %o4
	.word	0xd82e3fe0	! t0_kref+0x34f0:   	stb	%o4, [%i0 - 0x20]
	.word	0x8143c000	! t0_kref+0x34f4:   	stbar
	.word	0xed00a030	! t0_kref+0x34f8:   	ld	[%g2 + 0x30], %f22
	.word	0x99b6c33a	! t0_kref+0x34fc:   	bmask	%i3, %i2, %o4
	.word	0xe96e3fe8	! t0_kref+0x3500:   	prefetch	%i0 - 0x18, 20
	.word	0xf16e3fe0	! t0_kref+0x3504:   	prefetch	%i0 - 0x20, 24
	.word	0xb1a00554	! t0_kref+0x3508:   	fsqrtd	%f20, %f24
	.word	0xb7a4492f	! t0_kref+0x350c:   	fmuls	%f17, %f15, %f27
	.word	0x9de3bfa0	! t0_kref+0x3510:   	save	%sp, -0x60, %sp
	.word	0xb6063201	! t0_kref+0x3514:   	add	%i0, -0xdff, %i3
	.word	0x91eea459	! t0_kref+0x3518:   	restore	%i2, 0x459, %o0
	.word	0xf91fbe08	! t0_kref+0x351c:   	ldd	[%fp - 0x1f8], %f28
	.word	0xb9a0055c	! t0_kref+0x3520:   	fsqrtd	%f28, %f28
	.word	0xb5a508ca	! t0_kref+0x3524:   	fsubd	%f20, %f10, %f26
	.word	0xf11fbd00	! t0_kref+0x3528:   	ldd	[%fp - 0x300], %f24
	.word	0xc0266008	! t0_kref+0x352c:   	clr	[%i1 + 8]
	.word	0xa1a4085a	! t0_kref+0x3530:   	faddd	%f16, %f26, %f16
	.word	0xc56e7ff0	! t0_kref+0x3534:   	prefetch	%i1 - 0x10, 2
	.word	0xafa38837	! t0_kref+0x3538:   	fadds	%f14, %f23, %f23
	.word	0xe40861f0	! t0_kref+0x353c:   	ldub	[%g1 + 0x1f0], %l2
	.word	0xa41ca00c	! t0_kref+0x3540:   	xor	%l2, 0xc, %l2
	.word	0xe42861f0	! t0_kref+0x3544:   	stb	%l2, [%g1 + 0x1f0]
	.word	0x81d861f0	! t0_kref+0x3548:   	flush	%g1 + 0x1f0
	.word	0xd4871018	! t0_kref+0x354c:   	lda	[%i4 + %i0]0x80, %o2
	.word	0xaa06b69c	! t0_kref+0x3550:   	add	%i2, -0x964, %l5
	.word	0x97a01a5a	! t0_kref+0x3554:   	fdtoi	%f26, %f11
	.word	0xac60000a	! t0_kref+0x3558:   	subc	%g0, %o2, %l6
	.word	0xa5b5866c	! t0_kref+0x355c:   	fmul8x16au	%f22, %f12, %f18
	.word	0x81af0a31	! t0_kref+0x3560:   	fcmps	%fcc0, %f28, %f17
2:	.word	0xaba018ce	! t0_kref+0x3564:   	fdtos	%f14, %f21
	.word	0xa1a00554	! t0_kref+0x3568:   	fsqrtd	%f20, %f16
	.word	0xa9a388dc	! t0_kref+0x356c:   	fsubd	%f14, %f28, %f20
	.word	0xe26e2006	! t0_kref+0x3570:   	ldstub	[%i0 + 6], %l1
	.word	0x9092b4d1	! t0_kref+0x3574:   	orcc	%o2, -0xb2f, %o0
	.word	0xee50a01a	! t0_kref+0x3578:   	ldsh	[%g2 + 0x1a], %l7
	.word	0xe3b8a040	! t0_kref+0x357c:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xae3ee134	! t0_kref+0x3580:   	xnor	%i3, 0x134, %l7
	.word	0x9db68e33	! t0_kref+0x3584:   	fands	%f26, %f19, %f14
	.word	0xae56f716	! t0_kref+0x3588:   	umul	%i3, -0x8ea, %l7
	.word	0xaa326018	! t0_kref+0x358c:   	orn	%o1, 0x18, %l5
	.word	0xa3a00534	! t0_kref+0x3590:   	fsqrts	%f20, %f17
	.word	0xa89f3fba	! t0_kref+0x3594:   	xorcc	%i4, -0x46, %l4
	.word	0xafa000ac	! t0_kref+0x3598:   	fnegs	%f12, %f23
	sethi	%hi(2f), %o7
	.word	0xe40be1d8	! t0_kref+0x35a0:   	ldub	[%o7 + 0x1d8], %l2
	.word	0xa41ca00c	! t0_kref+0x35a4:   	xor	%l2, 0xc, %l2
	.word	0xe42be1d8	! t0_kref+0x35a8:   	stb	%l2, [%o7 + 0x1d8]
	.word	0x81dbe1d8	! t0_kref+0x35ac:   	flush	%o7 + 0x1d8
	.word	0xec50a012	! t0_kref+0x35b0:   	ldsh	[%g2 + 0x12], %l6
	.word	0xb9a000b4	! t0_kref+0x35b4:   	fnegs	%f20, %f28
	.word	0xe91fbf10	! t0_kref+0x35b8:   	ldd	[%fp - 0xf0], %f20
	.word	0x9bb68410	! t0_kref+0x35bc:   	fcmple16	%f26, %f16, %o5
	.word	0x81dac00d	! t0_kref+0x35c0:   	flush	%o3 + %o5
	.word	0xbba000ab	! t0_kref+0x35c4:   	fnegs	%f11, %f29
	.word	0x99b6096e	! t0_kref+0x35c8:   	fpmerge	%f24, %f14, %f12
	.word	0xbba000af	! t0_kref+0x35cc:   	fnegs	%f15, %f29
	.word	0x33480006	! t0_kref+0x35d0:   	fbe,a,pt	%fcc0, _kref+0x35e8
	.word	0xf51fbe18	! t0_kref+0x35d4:   	ldd	[%fp - 0x1e8], %f26
2:	.word	0x9db68d2d	! t0_kref+0x35d8:   	fandnot1s	%f26, %f13, %f14
	.word	0x94f27aa6	! t0_kref+0x35dc:   	udivcc	%o1, -0x55a, %o2
	.word	0xe120a030	! t0_kref+0x35e0:   	st	%f16, [%g2 + 0x30]
	.word	0xee162006	! t0_kref+0x35e4:   	lduh	[%i0 + 6], %l7
	.word	0x9ba5c8ab	! t0_kref+0x35e8:   	fsubs	%f23, %f11, %f13
	.word	0x963ef04d	! t0_kref+0x35ec:   	xnor	%i3, -0xfb3, %o3
	.word	0xb1a588d2	! t0_kref+0x35f0:   	fsubd	%f22, %f18, %f24
	.word	0xb5a68931	! t0_kref+0x35f4:   	fmuls	%f26, %f17, %f26
	.word	0xa9a000b7	! t0_kref+0x35f8:   	fnegs	%f23, %f20
	.word	0xd828a012	! t0_kref+0x35fc:   	stb	%o4, [%g2 + 0x12]
	.word	0xc3ee501d	! t0_kref+0x3600:   	prefetcha	%i1 + %i5, 1
	.word	0xadb00120	! t0_kref+0x3604:   	edge32n	%g0, %g0, %l6
	.word	0x81dfade6	! t0_kref+0x3608:   	flush	%fp + 0xde6
	.word	0xf19f5a19	! t0_kref+0x360c:   	ldda	[%i5 + %i1]0xd0, %f24
	.word	0x81df4010	! t0_kref+0x3610:   	flush	%i5 + %l0
	.word	0x3f480005	! t0_kref+0x3614:   	fbo,a,pt	%fcc0, _kref+0x3628
	.word	0xb4103fe5	! t0_kref+0x3618:   	mov	0xffffffe5, %i2
	.word	0xd248a002	! t0_kref+0x361c:   	ldsb	[%g2 + 2], %o1
	.word	0xd828a010	! t0_kref+0x3620:   	stb	%o4, [%g2 + 0x10]
	.word	0xd49f5019	! t0_kref+0x3624:   	ldda	[%i5 + %i1]0x80, %o2
	.word	0xee16401b	! t0_kref+0x3628:   	lduh	[%i1 + %i3], %l7
	.word	0xa8a8000b	! t0_kref+0x362c:   	andncc	%g0, %o3, %l4
	.word	0x97a01a54	! t0_kref+0x3630:   	fdtoi	%f20, %f11
	.word	0x96637269	! t0_kref+0x3634:   	subc	%o5, -0xd97, %o3
	.word	0xe3b8a040	! t0_kref+0x3638:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xae5b3d1f	! t0_kref+0x363c:   	smul	%o4, -0x2e1, %l7
	.word	0xc398a080	! t0_kref+0x3640:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0xb9a408da	! t0_kref+0x3644:   	fsubd	%f16, %f26, %f28
	.word	0x8d82a044	! t0_kref+0x3648:   	wr	%o2, 0x44, %fprs
	.word	0xa5a01a36	! t0_kref+0x364c:   	fstoi	%f22, %f18
	.word	0x81ad0a50	! t0_kref+0x3650:   	fcmpd	%fcc0, %f20, %f16
	.word	0xfa20a010	! t0_kref+0x3654:   	st	%i5, [%g2 + 0x10]
	.word	0xad0f001c	! t0_kref+0x3658:   	tsubcc	%i4, %i4, %l6
	.word	0xb9b38ed8	! t0_kref+0x365c:   	fornot2	%f14, %f24, %f28
	.word	0x9bb2c34c	! t0_kref+0x3660:   	alignaddrl	%o3, %o4, %o5
	.word	0x9766246f	! t0_kref+0x3664:   	mova	%icc, -0x391, %o3
	.word	0xec10a020	! t0_kref+0x3668:   	lduh	[%g2 + 0x20], %l6
	.word	0xada01a37	! t0_kref+0x366c:   	fstoi	%f23, %f22
	.word	0x99a01935	! t0_kref+0x3670:   	fstod	%f21, %f12
	.word	0xf820a008	! t0_kref+0x3674:   	st	%i4, [%g2 + 8]
	.word	0xe810a020	! t0_kref+0x3678:   	lduh	[%g2 + 0x20], %l4
	.word	0x9846e6af	! t0_kref+0x367c:   	addc	%i3, 0x6af, %o4
	.word	0x99b44af1	! t0_kref+0x3680:   	fpsub32s	%f17, %f17, %f12
	.word	0xdd1fbc20	! t0_kref+0x3684:   	ldd	[%fp - 0x3e0], %f14
	.word	0xf7067fec	! t0_kref+0x3688:   	ld	[%i1 - 0x14], %f27
	.word	0x91400000	! t0_kref+0x368c:   	mov	%y, %o0
	.word	0xf428a012	! t0_kref+0x3690:   	stb	%i2, [%g2 + 0x12]
	.word	0xa8f33049	! t0_kref+0x3694:   	udivcc	%o4, -0xfb7, %l4
	.word	0xc398a080	! t0_kref+0x3698:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0xed1e0000	! t0_kref+0x369c:   	ldd	[%i0], %f22
	.word	0xac62401c	! t0_kref+0x36a0:   	subc	%o1, %i4, %l6
	.word	0xd91fbcb0	! t0_kref+0x36a4:   	ldd	[%fp - 0x350], %f12
	.word	0xada000b7	! t0_kref+0x36a8:   	fnegs	%f23, %f22
	.word	0xa5a508d4	! t0_kref+0x36ac:   	fsubd	%f20, %f20, %f18
	.word	0xada5084e	! t0_kref+0x36b0:   	faddd	%f20, %f14, %f22
	.word	0x99b7430c	! t0_kref+0x36b4:   	alignaddr	%i5, %o4, %o4
	.word	0x929f001b	! t0_kref+0x36b8:   	xorcc	%i4, %i3, %o1
	.word	0x2e480005	! t0_kref+0x36bc:   	bvs,a,pt	%icc, _kref+0x36d0
	.word	0xd2067ff8	! t0_kref+0x36c0:   	ld	[%i1 - 8], %o1
	.word	0xf628a030	! t0_kref+0x36c4:   	stb	%i3, [%g2 + 0x30]
	.word	0xada589cc	! t0_kref+0x36c8:   	fdivd	%f22, %f12, %f22
	.word	0xe3b8a040	! t0_kref+0x36cc:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xab37600a	! t0_kref+0x36d0:   	srl	%i5, 0xa, %l5
	.word	0xada0190e	! t0_kref+0x36d4:   	fitod	%f14, %f22
	.word	0xb5a01932	! t0_kref+0x36d8:   	fstod	%f18, %f26
	.word	0x9da0055c	! t0_kref+0x36dc:   	fsqrtd	%f28, %f14
	.word	0x9402400d	! t0_kref+0x36e0:   	add	%o1, %o5, %o2
	.word	0x36480006	! t0_kref+0x36e4:   	bge,a,pt	%icc, _kref+0x36fc
	.word	0xba102008	! t0_kref+0x36e8:   	mov	0x8, %i5
	.word	0xb5b00c00	! t0_kref+0x36ec:   	fzero	%f26
	.word	0xe120a020	! t0_kref+0x36f0:   	st	%f16, [%g2 + 0x20]
	.word	0x95b3033c	! t0_kref+0x36f4:   	bmask	%o4, %i4, %o2
	.word	0xac7b2eab	! t0_kref+0x36f8:   	sdiv	%o4, 0xeab, %l6
	.word	0x9fa6c830	! t0_kref+0x36fc:   	fadds	%f27, %f16, %f15
	.word	0xad400000	! t0_kref+0x3700:   	mov	%y, %l6
	.word	0x36800004	! t0_kref+0x3704:   	bge,a	_kref+0x3714
	.word	0xf636c018	! t0_kref+0x3708:   	sth	%i3, [%i3 + %i0]
	.word	0x99a00530	! t0_kref+0x370c:   	fsqrts	%f16, %f12
	.word	0xc0f75019	! t0_kref+0x3710:   	stxa	%g0, [%i5 + %i1]0x80
	.word	0xa1a48937	! t0_kref+0x3714:   	fmuls	%f18, %f23, %f16
	.word	0xeece101a	! t0_kref+0x3718:   	ldsba	[%i0 + %i2]0x80, %l7
	.word	0xa9b5caee	! t0_kref+0x371c:   	fpsub32s	%f23, %f14, %f20
	.word	0xf630a022	! t0_kref+0x3720:   	sth	%i3, [%g2 + 0x22]
	.word	0xad32e00d	! t0_kref+0x3724:   	srl	%o3, 0xd, %l6
	.word	0xad400000	! t0_kref+0x3728:   	mov	%y, %l6
	.word	0xfb6e001a	! t0_kref+0x372c:   	prefetch	%i0 + %i2, 29
	.word	0x96927b9f	! t0_kref+0x3730:   	orcc	%o1, -0x461, %o3
	.word	0x9ba000ba	! t0_kref+0x3734:   	fnegs	%f26, %f13
	.word	0xbba000ae	! t0_kref+0x3738:   	fnegs	%f14, %f29
	.word	0x971aad99	! t0_kref+0x373c:   	tsubcctv	%o2, 0xd99, %o3
	.word	0xe3b8a040	! t0_kref+0x3740:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xc020a000	! t0_kref+0x3744:   	clr	[%g2]
	.word	0xd016001b	! t0_kref+0x3748:   	lduh	[%i0 + %i3], %o0
	.word	0x9a5a8000	! t0_kref+0x374c:   	smul	%o2, %g0, %o5
	.word	0xb3a6c82d	! t0_kref+0x3750:   	fadds	%f27, %f13, %f25
	.word	0xab400000	! t0_kref+0x3754:   	mov	%y, %l5
	.word	0xd19eda58	! t0_kref+0x3758:   	ldda	[%i3 + %i0]0xd2, %f8
	.word	0x30480007	! t0_kref+0x375c:   	ba,a,pt	%icc, _kref+0x3778
	.word	0xd44e4000	! t0_kref+0x3760:   	ldsb	[%i1], %o2
	.word	0xc036601e	! t0_kref+0x3764:   	clrh	[%i1 + 0x1e]
	.word	0xda263fec	! t0_kref+0x3768:   	st	%o5, [%i0 - 0x14]
	.word	0xa9b706d2	! t0_kref+0x376c:   	fmul8sux16	%f28, %f18, %f20
	.word	0xb9a3894e	! t0_kref+0x3770:   	fmuld	%f14, %f14, %f28
	.word	0xc0300019	! t0_kref+0x3774:   	clrh	[%g0 + %i1]
	.word	0xa9b7435c	! t0_kref+0x3778:   	alignaddrl	%i5, %i4, %l4
	.word	0xec380018	! t0_kref+0x377c:   	std	%l6, [%g0 + %i0]
	.word	0xada01914	! t0_kref+0x3780:   	fitod	%f20, %f22
	.word	0xd82e6003	! t0_kref+0x3784:   	stb	%o4, [%i1 + 3]
	.word	0xaba0108c	! t0_kref+0x3788:   	fxtos	%f12, %f21
	.word	0xdf06001c	! t0_kref+0x378c:   	ld	[%i0 + %i4], %f15
	.word	0xa9b009b6	! t0_kref+0x3790:   	fexpand	%f22, %f20
	.word	0xe83e401d	! t0_kref+0x3794:   	std	%l4, [%i1 + %i5]
	.word	0xd4167ffa	! t0_kref+0x3798:   	lduh	[%i1 - 6], %o2
	.word	0xa9b74afd	! t0_kref+0x379c:   	fpsub32s	%f29, %f29, %f20
	.word	0x99a01a52	! t0_kref+0x37a0:   	fdtoi	%f18, %f12
	.word	0x90d80009	! t0_kref+0x37a4:   	smulcc	%g0, %o1, %o0
	.word	0x9db00f2c	! t0_kref+0x37a8:   	fsrc2s	%f12, %f14
	.word	0x81ab0ab2	! t0_kref+0x37ac:   	fcmpes	%fcc0, %f12, %f18
	.word	0xabb2801a	! t0_kref+0x37b0:   	edge8	%o2, %i2, %l5
	.word	0xf96e401b	! t0_kref+0x37b4:   	prefetch	%i1 + %i3, 28
	.word	0x913f400c	! t0_kref+0x37b8:   	sra	%i5, %o4, %o0
	.word	0x9aa74000	! t0_kref+0x37bc:   	subcc	%i5, %g0, %o5
	.word	0xada488cc	! t0_kref+0x37c0:   	fsubd	%f18, %f12, %f22
	.word	0xd616001b	! t0_kref+0x37c4:   	lduh	[%i0 + %i3], %o3
	.word	0x9262e961	! t0_kref+0x37c8:   	subc	%o3, 0x961, %o1
	.word	0x91b304dc	! t0_kref+0x37cc:   	fcmpne32	%f12, %f28, %o0
	.word	0x9bb48e70	! t0_kref+0x37d0:   	fxnors	%f18, %f16, %f13
	.word	0x3c480001	! t0_kref+0x37d4:   	bpos,a,pt	%icc, _kref+0x37d8
	.word	0x81de801f	! t0_kref+0x37d8:   	flush	%i2 + %i7
	.word	0xec8e501a	! t0_kref+0x37dc:   	lduba	[%i1 + %i2]0x80, %l6
	.word	0xd250a002	! t0_kref+0x37e0:   	ldsh	[%g2 + 2], %o1
	.word	0xf91e2010	! t0_kref+0x37e4:   	ldd	[%i0 + 0x10], %f28
	.word	0xa8d8001a	! t0_kref+0x37e8:   	smulcc	%g0, %i2, %l4
	.word	0x9422c000	! t0_kref+0x37ec:   	sub	%o3, %g0, %o2
	.word	0xd9e6500b	! t0_kref+0x37f0:   	casa	[%i1]0x80, %o3, %o4
	.word	0xb7a01a39	! t0_kref+0x37f4:   	fstoi	%f25, %f27
	.word	0xc398a080	! t0_kref+0x37f8:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0x9bb48e77	! t0_kref+0x37fc:   	fxnors	%f18, %f23, %f13
	.word	0xf11fbef0	! t0_kref+0x3800:   	ldd	[%fp - 0x110], %f24
	.word	0x81ad8a4e	! t0_kref+0x3804:   	fcmpd	%fcc0, %f22, %f14
	.word	0x95b7010b	! t0_kref+0x3808:   	edge32	%i4, %o3, %o2
	.word	0x91b6815b	! t0_kref+0x380c:   	edge32l	%i2, %i3, %o0
	.word	0x9bb34f77	! t0_kref+0x3810:   	fornot1s	%f13, %f23, %f13
	.word	0xac9a78cb	! t0_kref+0x3814:   	xorcc	%o1, -0x735, %l6
	.word	0x9da00558	! t0_kref+0x3818:   	fsqrtd	%f24, %f14
	.word	0xb9a00037	! t0_kref+0x381c:   	fmovs	%f23, %f28
	.word	0xd4180018	! t0_kref+0x3820:   	ldd	[%g0 + %i0], %o2
	.word	0xac86ff88	! t0_kref+0x3824:   	addcc	%i3, -0x78, %l6
	.word	0xf56e3ff0	! t0_kref+0x3828:   	prefetch	%i0 - 0x10, 26
	.word	0x9a400000	! t0_kref+0x382c:   	addc	%g0, %g0, %o5
	.word	0xda00a018	! t0_kref+0x3830:   	ld	[%g2 + 0x18], %o5
	.word	0xc398a080	! t0_kref+0x3834:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0x3e480006	! t0_kref+0x3838:   	bvc,a,pt	%icc, _kref+0x3850
	.word	0xd8100019	! t0_kref+0x383c:   	lduh	[%g0 + %i1], %o4
	.word	0xa9b50f8e	! t0_kref+0x3840:   	for	%f20, %f14, %f20
	.word	0x9130200a	! t0_kref+0x3844:   	srl	%g0, 0xa, %o0
	.word	0x97b60fb8	! t0_kref+0x3848:   	fors	%f24, %f24, %f11
	.word	0xaf2a6012	! t0_kref+0x384c:   	sll	%o1, 0x12, %l7
	.word	0xe3ee101d	! t0_kref+0x3850:   	prefetcha	%i0 + %i5, 17
	.word	0xd800a020	! t0_kref+0x3854:   	ld	[%g2 + 0x20], %o4
	.word	0xb1a00032	! t0_kref+0x3858:   	fmovs	%f18, %f24
	.word	0xfa280018	! t0_kref+0x385c:   	stb	%i5, [%g0 + %i0]
	.word	0xaf40c000	! t0_kref+0x3860:   	mov	%asi, %l7
	.word	0xac0f216f	! t0_kref+0x3864:   	and	%i4, 0x16f, %l6
	.word	0x81dd401b	! t0_kref+0x3868:   	flush	%l5 + %i3
	.word	0x91b68200	! t0_kref+0x386c:   	array8	%i2, %g0, %o0
	.word	0xf906201c	! t0_kref+0x3870:   	ld	[%i0 + 0x1c], %f28
	.word	0x920b400a	! t0_kref+0x3874:   	and	%o5, %o2, %o1
	.word	0xb3b4cc6f	! t0_kref+0x3878:   	fnors	%f19, %f15, %f25
	.word	0x93400000	! t0_kref+0x387c:   	mov	%y, %o1
	.word	0xba103ff8	! t0_kref+0x3880:   	mov	0xfffffff8, %i5
	.word	0x9db70dd0	! t0_kref+0x3884:   	fnand	%f28, %f16, %f14
	.word	0x9fc10000	! t0_kref+0x3888:   	call	%g4
	.word	0xe300a030	! t0_kref+0x388c:   	ld	[%g2 + 0x30], %f17
	.word	0xf96e001b	! t0_kref+0x3890:   	prefetch	%i0 + %i3, 28
	.word	0xe8380019	! t0_kref+0x3894:   	std	%l4, [%g0 + %i1]
	.word	0x31480002	! t0_kref+0x3898:   	fba,a,pt	%fcc0, _kref+0x38a0
	.word	0x9fb00cf8	! t0_kref+0x389c:   	fnot2s	%f24, %f15
	.word	0xf820a030	! t0_kref+0x38a0:   	st	%i4, [%g2 + 0x30]
	.word	0xc028a033	! t0_kref+0x38a4:   	clrb	[%g2 + 0x33]
	.word	0xada4493d	! t0_kref+0x38a8:   	fmuls	%f17, %f29, %f22
	.word	0x969f0000	! t0_kref+0x38ac:   	xorcc	%i4, %g0, %o3
	.word	0xb5a01937	! t0_kref+0x38b0:   	fstod	%f23, %f26
	.word	0xa9a608d4	! t0_kref+0x38b4:   	fsubd	%f24, %f20, %f20
	.word	0xb3a0013a	! t0_kref+0x38b8:   	fabss	%f26, %f25
	.word	0x9b65e2eb	! t0_kref+0x38bc:   	movvs	%icc, 0x2eb, %o5
	.word	0xf11fbec0	! t0_kref+0x38c0:   	ldd	[%fp - 0x140], %f24
	.word	0x985a401b	! t0_kref+0x38c4:   	smul	%o1, %i3, %o4
	.word	0xe3b8a040	! t0_kref+0x38c8:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x3e480007	! t0_kref+0x38cc:   	bvc,a,pt	%icc, _kref+0x38e8
	.word	0xe0fe1000	! t0_kref+0x38d0:   	swapa	[%i0]0x80, %l0
	.word	0xa1a018d6	! t0_kref+0x38d4:   	fdtos	%f22, %f16
	.word	0x9b7020ab	! t0_kref+0x38d8:   	popc	0xab, %o5
	.word	0xd91fbd98	! t0_kref+0x38dc:   	ldd	[%fp - 0x268], %f12
	.word	0xd81f4019	! t0_kref+0x38e0:   	ldd	[%i5 + %i1], %o4
	.word	0xa9a0054c	! t0_kref+0x38e4:   	fsqrtd	%f12, %f20
	.word	0xd03e001d	! t0_kref+0x38e8:   	std	%o0, [%i0 + %i5]
	.word	0x99a01a35	! t0_kref+0x38ec:   	fstoi	%f21, %f12
	.word	0xec3e401d	! t0_kref+0x38f0:   	std	%l6, [%i1 + %i5]
	.word	0x99b605cc	! t0_kref+0x38f4:   	fcmpeq32	%f24, %f12, %o4
	.word	0x99a58852	! t0_kref+0x38f8:   	faddd	%f22, %f18, %f12
	.word	0x9bb700da	! t0_kref+0x38fc:   	edge16l	%i4, %i2, %o5
	.word	0xa1a00035	! t0_kref+0x3900:   	fmovs	%f21, %f16
	.word	0x3b480001	! t0_kref+0x3904:   	fble,a,pt	%fcc0, _kref+0x3908
	.word	0xa5a01938	! t0_kref+0x3908:   	fstod	%f24, %f18
	.word	0x94e76327	! t0_kref+0x390c:   	subccc	%i5, 0x327, %o2
	.word	0xac62801d	! t0_kref+0x3910:   	subc	%o2, %i5, %l6
	.word	0xaeaebefb	! t0_kref+0x3914:   	andncc	%i2, -0x105, %l7
	.word	0x94db400a	! t0_kref+0x3918:   	smulcc	%o5, %o2, %o2
	.word	0xa3b0076c	! t0_kref+0x391c:   	fpack16	%f12, %f17
	.word	0x92df000c	! t0_kref+0x3920:   	smulcc	%i4, %o4, %o1
	.word	0xe8180018	! t0_kref+0x3924:   	ldd	[%g0 + %i0], %l4
	.word	0x81aa8a4c	! t0_kref+0x3928:   	fcmpd	%fcc0, %f10, %f12
	.word	0xafb300ad	! t0_kref+0x392c:   	edge16n	%o4, %o5, %l7
	.word	0xda28a000	! t0_kref+0x3930:   	stb	%o5, [%g2]
	.word	0x9fc10000	! t0_kref+0x3934:   	call	%g4
	.word	0xa86729f1	! t0_kref+0x3938:   	subc	%i4, 0x9f1, %l4
	.word	0xe11e0000	! t0_kref+0x393c:   	ldd	[%i0], %f16
	.word	0xff6e2000	! t0_kref+0x3940:   	prefetch	%i0, 31
	.word	0x9fb00cf5	! t0_kref+0x3944:   	fnot2s	%f21, %f15
	.word	0xd216201c	! t0_kref+0x3948:   	lduh	[%i0 + 0x1c], %o1
	.word	0xd41e001d	! t0_kref+0x394c:   	ldd	[%i0 + %i5], %o2
	.word	0xa8d3001c	! t0_kref+0x3950:   	umulcc	%o4, %i4, %l4
	.word	0xa1a488d6	! t0_kref+0x3954:   	fsubd	%f18, %f22, %f16
	.word	0xc3ee500d	! t0_kref+0x3958:   	prefetcha	%i1 + %o5, 1
	.word	0x83414000	! t0_kref+0x395c:   	mov	%pc, %g1
	.word	0xa1b68717	! t0_kref+0x3960:   	fmuld8sux16	%f26, %f23, %f16
	.word	0x9da01a38	! t0_kref+0x3964:   	fstoi	%f24, %f14
	.word	0xab40c000	! t0_kref+0x3968:   	mov	%asi, %l5
	.word	0x92a3294f	! t0_kref+0x396c:   	subcc	%o4, 0x94f, %o1
	.word	0x81ae0ad6	! t0_kref+0x3970:   	fcmped	%fcc0, %f24, %f22
	.word	0xa1a2885c	! t0_kref+0x3974:   	faddd	%f10, %f28, %f16
	.word	0xf900a038	! t0_kref+0x3978:   	ld	[%g2 + 0x38], %f28
	.word	0xadb6812a	! t0_kref+0x397c:   	edge32n	%i2, %o2, %l6
	.word	0x9abf22da	! t0_kref+0x3980:   	xnorcc	%i4, 0x2da, %o5
	.word	0x9aab400c	! t0_kref+0x3984:   	andncc	%o5, %o4, %o5
	.word	0x9fb6ceef	! t0_kref+0x3988:   	fornot2s	%f27, %f15, %f15
	.word	0x151598ce	! t0_kref+0x398c:   	sethi	%hi(0x56633800), %o2
	.word	0xb3a00032	! t0_kref+0x3990:   	fmovs	%f18, %f25
	.word	0xb1a018d6	! t0_kref+0x3994:   	fdtos	%f22, %f24
	.word	0xf830a002	! t0_kref+0x3998:   	sth	%i4, [%g2 + 2]
	.word	0x97400000	! t0_kref+0x399c:   	mov	%y, %o3
	.word	0x9ba000b4	! t0_kref+0x39a0:   	fnegs	%f20, %f13
	.word	0x81ab4ab7	! t0_kref+0x39a4:   	fcmpes	%fcc0, %f13, %f23
	.word	0xb3a01a2b	! t0_kref+0x39a8:   	fstoi	%f11, %f25
	.word	0x96f6f0a4	! t0_kref+0x39ac:   	udivcc	%i3, -0xf5c, %o3
	.word	0x26480001	! t0_kref+0x39b0:   	bl,a,pt	%icc, _kref+0x39b4
	.word	0xe3b8a040	! t0_kref+0x39b4:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xb3a01a5c	! t0_kref+0x39b8:   	fdtoi	%f28, %f25
	.word	0x98736aa7	! t0_kref+0x39bc:   	udiv	%o5, 0xaa7, %o4
	.word	0xa1a68850	! t0_kref+0x39c0:   	faddd	%f26, %f16, %f16
	.word	0xb9b58e80	! t0_kref+0x39c4:   	fsrc1	%f22, %f28
	.word	0xa82760f8	! t0_kref+0x39c8:   	sub	%i5, 0xf8, %l4
	.word	0xe120a038	! t0_kref+0x39cc:   	st	%f16, [%g2 + 0x38]
	.word	0xe3b8a040	! t0_kref+0x39d0:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x9808247b	! t0_kref+0x39d4:   	and	%g0, 0x47b, %o4
	.word	0x95b5091c	! t0_kref+0x39d8:   	faligndata	%f20, %f28, %f10
	.word	0x2d0e81ea	! t0_kref+0x39dc:   	sethi	%hi(0x3a07a800), %l6
	.word	0xdd20a008	! t0_kref+0x39e0:   	st	%f14, [%g2 + 8]
	.word	0x9a3a801a	! t0_kref+0x39e4:   	xnor	%o2, %i2, %o5
	.word	0x912ea011	! t0_kref+0x39e8:   	sll	%i2, 0x11, %o0
	.word	0x9f414000	! t0_kref+0x39ec:   	mov	%pc, %o7
	.word	0xa9b7435b	! t0_kref+0x39f0:   	alignaddrl	%i5, %i3, %l4
	.word	0x923ea410	! t0_kref+0x39f4:   	xnor	%i2, 0x410, %o1
	.word	0x28800003	! t0_kref+0x39f8:   	bleu,a	_kref+0x3a04
	.word	0xa9b44af2	! t0_kref+0x39fc:   	fpsub32s	%f17, %f18, %f20
	.word	0xf51e7ff0	! t0_kref+0x3a00:   	ldd	[%i1 - 0x10], %f26
	.word	0xd8160000	! t0_kref+0x3a04:   	lduh	[%i0], %o4
	.word	0xa8a6ed2f	! t0_kref+0x3a08:   	subcc	%i3, 0xd2f, %l4
	.word	0xe83f4019	! t0_kref+0x3a0c:   	std	%l4, [%i5 + %i1]
	.word	0xafb0032c	! t0_kref+0x3a10:   	bmask	%g0, %o4, %l7
	.word	0xee100018	! t0_kref+0x3a14:   	lduh	[%g0 + %i0], %l7
	.word	0xd05e3fe0	! t0_kref+0x3a18:   	ldx	[%i0 - 0x20], %o0
	.word	0x967f2ad3	! t0_kref+0x3a1c:   	sdiv	%i4, 0xad3, %o3
	.word	0xa5b007b8	! t0_kref+0x3a20:   	fpackfix	%f24, %f18
	.word	0x20480001	! t0_kref+0x3a24:   	bn,a,pt	%icc, _kref+0x3a28
	.word	0xf5861000	! t0_kref+0x3a28:   	lda	[%i0]0x80, %f26
	.word	0xaf61c01b	! t0_kref+0x3a2c:   	movu	%fcc0, %i3, %l7
	.word	0x91b5048a	! t0_kref+0x3a30:   	fcmple32	%f20, %f10, %o0
	.word	0x9da5cd2d	! t0_kref+0x3a34:   	fsmuld	%f23, %f13, %f14
	.word	0x92d73c64	! t0_kref+0x3a38:   	umulcc	%i4, -0x39c, %o1
	.word	0x3b480001	! t0_kref+0x3a3c:   	fble,a,pt	%fcc0, _kref+0x3a40
	.word	0xac92c01d	! t0_kref+0x3a40:   	orcc	%o3, %i5, %l6
	sethi	%hi(2f), %o7
	.word	0xe40be25c	! t0_kref+0x3a48:   	ldub	[%o7 + 0x25c], %l2
	.word	0xa41ca00c	! t0_kref+0x3a4c:   	xor	%l2, 0xc, %l2
	.word	0xe42be25c	! t0_kref+0x3a50:   	stb	%l2, [%o7 + 0x25c]
	.word	0x81dbe25c	! t0_kref+0x3a54:   	flush	%o7 + 0x25c
	.word	0x9fa000b9	! t0_kref+0x3a58:   	fnegs	%f25, %f15
2:	.word	0xad400000	! t0_kref+0x3a5c:   	mov	%y, %l6
	.word	0xd628a002	! t0_kref+0x3a60:   	stb	%o3, [%g2 + 2]
	.word	0x95a00550	! t0_kref+0x3a64:   	fsqrtd	%f16, %f10
	.word	0x9da98052	! t0_kref+0x3a68:   	fmovdg	%fcc0, %f18, %f14
	.word	0x9412401a	! t0_kref+0x3a6c:   	or	%o1, %i2, %o2
	.word	0xa8628009	! t0_kref+0x3a70:   	subc	%o2, %o1, %l4
	.word	0x81ddc008	! t0_kref+0x3a74:   	flush	%l7 + %o0
	.word	0xa5b70d14	! t0_kref+0x3a78:   	fandnot1	%f28, %f20, %f18
	.word	0x9a033d01	! t0_kref+0x3a7c:   	add	%o4, -0x2ff, %o5
	.word	0x3a800008	! t0_kref+0x3a80:   	bcc,a	_kref+0x3aa0
	.word	0x9db00f18	! t0_kref+0x3a84:   	fsrc2	%f24, %f14
	.word	0xb9a708d0	! t0_kref+0x3a88:   	fsubd	%f28, %f16, %f28
	.word	0xa9a000ab	! t0_kref+0x3a8c:   	fnegs	%f11, %f20
	.word	0xf51e001d	! t0_kref+0x3a90:   	ldd	[%i0 + %i5], %f26
	.word	0xe3b8a040	! t0_kref+0x3a94:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x30800004	! t0_kref+0x3a98:   	ba,a	_kref+0x3aa8
	.word	0xd9be180c	! t0_kref+0x3a9c:   	stda	%f12, [%i0 + %o4]0xc0
	.word	0x9057401d	! t0_kref+0x3aa0:   	umul	%i5, %i5, %o0
	.word	0x989a800b	! t0_kref+0x3aa4:   	xorcc	%o2, %o3, %o4
	.word	0xc5ee500a	! t0_kref+0x3aa8:   	prefetcha	%i1 + %o2, 2
	.word	0xb3b38c79	! t0_kref+0x3aac:   	fnors	%f14, %f25, %f25
	.word	0xab282013	! t0_kref+0x3ab0:   	sll	%g0, 0x13, %l5
	.word	0x9333201b	! t0_kref+0x3ab4:   	srl	%o4, 0x1b, %o1
	.word	0x9a124000	! t0_kref+0x3ab8:   	or	%o1, %g0, %o5
	.word	0x9406c000	! t0_kref+0x3abc:   	add	%i3, %g0, %o2
	.word	0x27480004	! t0_kref+0x3ac0:   	fbul,a,pt	%fcc0, _kref+0x3ad0
	.word	0xe9be1800	! t0_kref+0x3ac4:   	stda	%f20, [%i0]0xc0
	.word	0x947ae404	! t0_kref+0x3ac8:   	sdiv	%o3, 0x404, %o2
	.word	0x97a000bc	! t0_kref+0x3acc:   	fnegs	%f28, %f11
	.word	0xb3a01a4e	! t0_kref+0x3ad0:   	fdtoi	%f14, %f25
	.word	0x38800008	! t0_kref+0x3ad4:   	bgu,a	_kref+0x3af4
	.word	0x9a0f697a	! t0_kref+0x3ad8:   	and	%i5, 0x97a, %o5
	.word	0xf6a81018	! t0_kref+0x3adc:   	stba	%i3, [%g0 + %i0]0x80
	.word	0xa5a01a52	! t0_kref+0x3ae0:   	fdtoi	%f18, %f18
	.word	0x910a400b	! t0_kref+0x3ae4:   	tsubcc	%o1, %o3, %o0
	.word	0x9263400a	! t0_kref+0x3ae8:   	subc	%o5, %o2, %o1
	.word	0x81ad8a58	! t0_kref+0x3aec:   	fcmpd	%fcc0, %f22, %f24
	.word	0xb1b009bc	! t0_kref+0x3af0:   	fexpand	%f28, %f24
	.word	0x8143c000	! t0_kref+0x3af4:   	stbar
	.word	0x9fc00004	! t0_kref+0x3af8:   	call	%g0 + %g4
	.word	0xfb861000	! t0_kref+0x3afc:   	lda	[%i0]0x80, %f29
	.word	0x97b34200	! t0_kref+0x3b00:   	array8	%o5, %g0, %o3
	.word	0x81ac0a5a	! t0_kref+0x3b04:   	fcmpd	%fcc0, %f16, %f26
	.word	0x9222747d	! t0_kref+0x3b08:   	sub	%o1, -0xb83, %o1
	.word	0x9490395a	! t0_kref+0x3b0c:   	orcc	%g0, -0x6a6, %o2
	.word	0x93b30240	! t0_kref+0x3b10:   	array16	%o4, %g0, %o1
	.word	0x92c2801b	! t0_kref+0x3b14:   	addccc	%o2, %i3, %o1
	.word	0x94f3000b	! t0_kref+0x3b18:   	udivcc	%o4, %o3, %o2
	.word	0xd800a000	! t0_kref+0x3b1c:   	ld	[%g2], %o4
	.word	0xa1b68c7a	! t0_kref+0x3b20:   	fnors	%f26, %f26, %f16
	.word	0xda08a02b	! t0_kref+0x3b24:   	ldub	[%g2 + 0x2b], %o5
	.word	0xacf2800b	! t0_kref+0x3b28:   	udivcc	%o2, %o3, %l6
	.word	0x900278b3	! t0_kref+0x3b2c:   	add	%o1, -0x74d, %o0
	.word	0xd210a00a	! t0_kref+0x3b30:   	lduh	[%g2 + 0xa], %o1
	.word	0xada509dc	! t0_kref+0x3b34:   	fdivd	%f20, %f28, %f22
	.word	0xd81e3fe8	! t0_kref+0x3b38:   	ldd	[%i0 - 0x18], %o4
	.word	0xb3a489b8	! t0_kref+0x3b3c:   	fdivs	%f18, %f24, %f25
	.word	0x9097001c	! t0_kref+0x3b40:   	orcc	%i4, %i4, %o0
	.word	0xada609b6	! t0_kref+0x3b44:   	fdivs	%f24, %f22, %f22
	.word	0x81ac0aae	! t0_kref+0x3b48:   	fcmpes	%fcc0, %f16, %f14
	.word	0xd45e6000	! t0_kref+0x3b4c:   	ldx	[%i1], %o2
	.word	0x90a2725e	! t0_kref+0x3b50:   	subcc	%o1, -0xda2, %o0
	.word	0xf900a020	! t0_kref+0x3b54:   	ld	[%g2 + 0x20], %f28
	.word	0x9fb54ea0	! t0_kref+0x3b58:   	fsrc1s	%f21, %f15
	.word	0xda20a018	! t0_kref+0x3b5c:   	st	%o5, [%g2 + 0x18]
	.word	0xaaf2c009	! t0_kref+0x3b60:   	udivcc	%o3, %o1, %l5
	.word	0xd41e2000	! t0_kref+0x3b64:   	ldd	[%i0], %o2
	.word	0x28800004	! t0_kref+0x3b68:   	bleu,a	_kref+0x3b78
	.word	0x2b20a603	! t0_kref+0x3b6c:   	sethi	%hi(0x82980c00), %l5
	.word	0xe51e001d	! t0_kref+0x3b70:   	ldd	[%i0 + %i5], %f18
	.word	0xa7a68837	! t0_kref+0x3b74:   	fadds	%f26, %f23, %f19
	.word	0xac183d69	! t0_kref+0x3b78:   	xor	%g0, -0x297, %l6
	.word	0x99a00539	! t0_kref+0x3b7c:   	fsqrts	%f25, %f12
	.word	0xb3a018ce	! t0_kref+0x3b80:   	fdtos	%f14, %f25
	.word	0x93b30240	! t0_kref+0x3b84:   	array16	%o4, %g0, %o1
	.word	0xe810a028	! t0_kref+0x3b88:   	lduh	[%g2 + 0x28], %l4
	.word	0xfa300019	! t0_kref+0x3b8c:   	sth	%i5, [%g0 + %i1]
	.word	0xf5ee501b	! t0_kref+0x3b90:   	prefetcha	%i1 + %i3, 26
	.word	0xe51fbcb0	! t0_kref+0x3b94:   	ldd	[%fp - 0x350], %f18
	.word	0x92a3000d	! t0_kref+0x3b98:   	subcc	%o4, %o5, %o1
	.word	0x925e8000	! t0_kref+0x3b9c:   	smul	%i2, %g0, %o1
	.word	0xe168a10e	! t0_kref+0x3ba0:   	prefetch	%g2 + 0x10e, 16
	.word	0x81aacaae	! t0_kref+0x3ba4:   	fcmpes	%fcc0, %f11, %f14
	.word	0xafb3ce6c	! t0_kref+0x3ba8:   	fxnors	%f15, %f12, %f23
	.word	0xdad6d058	! t0_kref+0x3bac:   	ldsha	[%i3 + %i0]0x82, %o5
	.word	0xd620a028	! t0_kref+0x3bb0:   	st	%o3, [%g2 + 0x28]
	.word	0x9222401c	! t0_kref+0x3bb4:   	sub	%o1, %i4, %o1
	.word	0x97b7434d	! t0_kref+0x3bb8:   	alignaddrl	%i5, %o5, %o3
	.word	0x9aba7686	! t0_kref+0x3bbc:   	xnorcc	%o1, -0x97a, %o5
	.word	0xec16601a	! t0_kref+0x3bc0:   	lduh	[%i1 + 0x1a], %l6
	.word	0x933f0000	! t0_kref+0x3bc4:   	sra	%i4, %g0, %o1
	.word	0x9062af7a	! t0_kref+0x3bc8:   	subc	%o2, 0xf7a, %o0
	.word	0xada0190c	! t0_kref+0x3bcc:   	fitod	%f12, %f22
	.word	0x9bb7013d	! t0_kref+0x3bd0:   	edge32n	%i4, %i5, %o5
	.word	0xa912be1b	! t0_kref+0x3bd4:   	taddcctv	%o2, -0x1e5, %l4
	.word	0x81580000	! t0_kref+0x3bd8:   	flushw
	.word	0xa1a01a2e	! t0_kref+0x3bdc:   	fstoi	%f14, %f16
	.word	0x81ac0a4a	! t0_kref+0x3be0:   	fcmpd	%fcc0, %f16, %f10
	.word	0xada5083b	! t0_kref+0x3be4:   	fadds	%f20, %f27, %f22
	.word	0xc398a080	! t0_kref+0x3be8:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0xea08a012	! t0_kref+0x3bec:   	ldub	[%g2 + 0x12], %l5
	.word	0x9fc00004	! t0_kref+0x3bf0:   	call	%g0 + %g4
	.word	0x9767e0fa	! t0_kref+0x3bf4:   	movvc	%icc, 0xfa, %o3
	.word	0xe3b8a040	! t0_kref+0x3bf8:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x81b01024	! t0_kref+0x3bfc:   	siam	0x4
	.word	0xae3f000d	! t0_kref+0x3c00:   	xnor	%i4, %o5, %l7
	.word	0x27480006	! t0_kref+0x3c04:   	fbul,a,pt	%fcc0, _kref+0x3c1c
	.word	0xaec2a06f	! t0_kref+0x3c08:   	addccc	%o2, 0x6f, %l7
	.word	0xd81e001d	! t0_kref+0x3c0c:   	ldd	[%i0 + %i5], %o4
	.word	0xda30a00a	! t0_kref+0x3c10:   	sth	%o5, [%g2 + 0xa]
	.word	0xafb2416b	! t0_kref+0x3c14:   	edge32ln	%o1, %o3, %l7
	.word	0xb1b00c00	! t0_kref+0x3c18:   	fzero	%f24
	.word	0x9ad8000a	! t0_kref+0x3c1c:   	smulcc	%g0, %o2, %o5
	.word	0xd440a028	! t0_kref+0x3c20:   	ldsw	[%g2 + 0x28], %o2
	.word	0xabb38456	! t0_kref+0x3c24:   	fcmpne16	%f14, %f22, %l5
	.word	0xa1a01a5a	! t0_kref+0x3c28:   	fdtoi	%f26, %f16
	.word	0xf636c019	! t0_kref+0x3c2c:   	sth	%i3, [%i3 + %i1]
	.word	0xa1b58ed6	! t0_kref+0x3c30:   	fornot2	%f22, %f22, %f16
	.word	0x96777df7	! t0_kref+0x3c34:   	udiv	%i5, -0x209, %o3
	.word	0xe968a084	! t0_kref+0x3c38:   	prefetch	%g2 + 0x84, 20
	.word	0xecbe1000	! t0_kref+0x3c3c:   	stda	%l6, [%i0]0x80
	.word	0x94bf000a	! t0_kref+0x3c40:   	xnorcc	%i4, %o2, %o2
	.word	0xf16e401c	! t0_kref+0x3c44:   	prefetch	%i1 + %i4, 24
	.word	0xda00a030	! t0_kref+0x3c48:   	ld	[%g2 + 0x30], %o5
	.word	0xbba5c9b1	! t0_kref+0x3c4c:   	fdivs	%f23, %f17, %f29
	.word	0xafb6caf2	! t0_kref+0x3c50:   	fpsub32s	%f27, %f18, %f23
	.word	0xad40c000	! t0_kref+0x3c54:   	mov	%asi, %l6
	.word	0xd0000019	! t0_kref+0x3c58:   	ld	[%g0 + %i1], %o0
	.word	0xea6e8018	! t0_kref+0x3c5c:   	ldstub	[%i2 + %i0], %l5
	.word	0xc7ee501d	! t0_kref+0x3c60:   	prefetcha	%i1 + %i5, 3
	.word	0xafb30abb	! t0_kref+0x3c64:   	fpsub16s	%f12, %f27, %f23
	.word	0xb9a0105a	! t0_kref+0x3c68:   	fdtox	%f26, %f28
	.word	0x9db7462c	! t0_kref+0x3c6c:   	fmul8x16	%f29, %f12, %f14
	.word	0xd9be180d	! t0_kref+0x3c70:   	stda	%f12, [%i0 + %o5]0xc0
	.word	0x9ad8000c	! t0_kref+0x3c74:   	smulcc	%g0, %o4, %o5
	.word	0x81ae0a58	! t0_kref+0x3c78:   	fcmpd	%fcc0, %f24, %f24
	.word	0xe99eda59	! t0_kref+0x3c7c:   	ldda	[%i3 + %i1]0xd2, %f20
	.word	0x99b5062c	! t0_kref+0x3c80:   	fmul8x16	%f20, %f12, %f12
	.word	0xaa037705	! t0_kref+0x3c84:   	add	%o5, -0x8fb, %l5
	.word	0x9892f659	! t0_kref+0x3c88:   	orcc	%o3, -0x9a7, %o4
	.word	0x81ac8a52	! t0_kref+0x3c8c:   	fcmpd	%fcc0, %f18, %f18
	.word	0x96372363	! t0_kref+0x3c90:   	orn	%i4, 0x363, %o3
	.word	0xaec77030	! t0_kref+0x3c94:   	addccc	%i5, -0xfd0, %l7
	.word	0xa8a2401c	! t0_kref+0x3c98:   	subcc	%o1, %i4, %l4
	.word	0x81dc6bd0	! t0_kref+0x3c9c:   	flush	%l1 + 0xbd0
	.word	0x94bb3305	! t0_kref+0x3ca0:   	xnorcc	%o4, -0xcfb, %o2
	.word	0xd828a00b	! t0_kref+0x3ca4:   	stb	%o4, [%g2 + 0xb]
	.word	0xa3b2cfae	! t0_kref+0x3ca8:   	fors	%f11, %f14, %f17
	.word	0xfa28a033	! t0_kref+0x3cac:   	stb	%i5, [%g2 + 0x33]
	.word	0xfab6101b	! t0_kref+0x3cb0:   	stha	%i5, [%i0 + %i3]0x80
	.word	0x27480005	! t0_kref+0x3cb4:   	fbul,a,pt	%fcc0, _kref+0x3cc8
	.word	0xa3a4492b	! t0_kref+0x3cb8:   	fmuls	%f17, %f11, %f17
	.word	0xa1a3cd2c	! t0_kref+0x3cbc:   	fsmuld	%f15, %f12, %f16
	.word	0x9236800a	! t0_kref+0x3cc0:   	orn	%i2, %o2, %o1
	.word	0xb5a000b3	! t0_kref+0x3cc4:   	fnegs	%f19, %f26
	.word	0x9128000c	! t0_kref+0x3cc8:   	sll	%g0, %o4, %o0
	.word	0x9ba018d6	! t0_kref+0x3ccc:   	fdtos	%f22, %f13
	.word	0xd230a000	! t0_kref+0x3cd0:   	sth	%o1, [%g2]
	.word	0xae9b001d	! t0_kref+0x3cd4:   	xorcc	%o4, %i5, %l7
	.word	0xdb20a030	! t0_kref+0x3cd8:   	st	%f13, [%g2 + 0x30]
	.word	0xae0a7512	! t0_kref+0x3cdc:   	and	%o1, -0xaee, %l7
	.word	0xada509d2	! t0_kref+0x3ce0:   	fdivd	%f20, %f18, %f22
	.word	0xacab6783	! t0_kref+0x3ce4:   	andncc	%o5, 0x783, %l6
	.word	0x9bb00300	! t0_kref+0x3ce8:   	alignaddr	%g0, %g0, %o5
	.word	0xaad77693	! t0_kref+0x3cec:   	umulcc	%i5, -0x96d, %l5
	.word	0xa5b00c20	! t0_kref+0x3cf0:   	fzeros	%f18
	.word	0x86102019	! t0_kref+0x3cf4:   	mov	0x19, %g3
	.word	0x86a0e001	! t0_kref+0x3cf8:   	subcc	%g3, 1, %g3
	.word	0x22800013	! t0_kref+0x3cfc:   	be,a	_kref+0x3d48
	.word	0xd2162002	! t0_kref+0x3d00:   	lduh	[%i0 + 2], %o1
	.word	0xaaf2c00d	! t0_kref+0x3d04:   	udivcc	%o3, %o5, %l5
	.word	0x9297001a	! t0_kref+0x3d08:   	orcc	%i4, %i2, %o1
	.word	0xedee501a	! t0_kref+0x3d0c:   	prefetcha	%i1 + %i2, 22
	.word	0xb5a0190c	! t0_kref+0x3d10:   	fitod	%f12, %f26
	.word	0xec1e401d	! t0_kref+0x3d14:   	ldd	[%i1 + %i5], %l6
	.word	0x8143c000	! t0_kref+0x3d18:   	stbar
	.word	0xaa07001c	! t0_kref+0x3d1c:   	add	%i4, %i4, %l5
	.word	0xeb000018	! t0_kref+0x3d20:   	ld	[%g0 + %i0], %f21
	.word	0xd830a002	! t0_kref+0x3d24:   	sth	%o4, [%g2 + 2]
	.word	0xf7ee101c	! t0_kref+0x3d28:   	prefetcha	%i0 + %i4, 27
	.word	0xa1a688d2	! t0_kref+0x3d2c:   	fsubd	%f26, %f18, %f16
	.word	0x81ad0a4e	! t0_kref+0x3d30:   	fcmpd	%fcc0, %f20, %f14
	.word	0x9fb0076a	! t0_kref+0x3d34:   	fpack16	%f10, %f15
	.word	0x967eb3fc	! t0_kref+0x3d38:   	sdiv	%i2, -0xc04, %o3
	.word	0xc026001c	! t0_kref+0x3d3c:   	clr	[%i0 + %i4]
	.word	0xda28a00a	! t0_kref+0x3d40:   	stb	%o5, [%g2 + 0xa]
	.word	0x93b6800b	! t0_kref+0x3d44:   	edge8	%i2, %o3, %o1
	.word	0xac53401c	! t0_kref+0x3d48:   	umul	%o5, %i4, %l6
	.word	0x9da01916	! t0_kref+0x3d4c:   	fitod	%f22, %f14
	.word	0x9136800d	! t0_kref+0x3d50:   	srl	%i2, %o5, %o0
	.word	0xae676d29	! t0_kref+0x3d54:   	subc	%i5, 0xd29, %l7
	.word	0xd44e3fee	! t0_kref+0x3d58:   	ldsb	[%i0 - 0x12], %o2
	.word	0xf36e7fe8	! t0_kref+0x3d5c:   	prefetch	%i1 - 0x18, 25
	.word	0x9ba01a56	! t0_kref+0x3d60:   	fdtoi	%f22, %f13
	.word	0xd41e2000	! t0_kref+0x3d64:   	ldd	[%i0], %o2
	.word	0xaafec01c	! t0_kref+0x3d68:   	sdivcc	%i3, %i4, %l5
	.word	0xe848a03b	! t0_kref+0x3d6c:   	ldsb	[%g2 + 0x3b], %l4
	.word	0xe89e1000	! t0_kref+0x3d70:   	ldda	[%i0]0x80, %l4
	.word	0x9fc00004	! t0_kref+0x3d74:   	call	%g0 + %g4
	.word	0xf1064000	! t0_kref+0x3d78:   	ld	[%i1], %f24
	.word	0x9fc00004	! t0_kref+0x3d7c:   	call	%g0 + %g4
	.word	0xb3a000ac	! t0_kref+0x3d80:   	fnegs	%f12, %f25
	.word	0x37480002	! t0_kref+0x3d84:   	fbge,a,pt	%fcc0, _kref+0x3d8c
	.word	0xea100018	! t0_kref+0x3d88:   	lduh	[%g0 + %i0], %l5
	.word	0xa3a018d6	! t0_kref+0x3d8c:   	fdtos	%f22, %f17
	.word	0xdb00a010	! t0_kref+0x3d90:   	ld	[%g2 + 0x10], %f13
	.word	0x95b6832a	! t0_kref+0x3d94:   	bmask	%i2, %o2, %o2
	.word	0x945ec01a	! t0_kref+0x3d98:   	smul	%i3, %i2, %o2
	.word	0xe76e001c	! t0_kref+0x3d9c:   	prefetch	%i0 + %i4, 19
	.word	0xba102018	! t0_kref+0x3da0:   	mov	0x18, %i5
	.word	0x9fc10000	! t0_kref+0x3da4:   	call	%g4
	.word	0xf8280018	! t0_kref+0x3da8:   	stb	%i4, [%g0 + %i0]
	.word	0xac52c00c	! t0_kref+0x3dac:   	umul	%o3, %o4, %l6
	.word	0xd420a000	! t0_kref+0x3db0:   	st	%o2, [%g2]
	.word	0xec48a000	! t0_kref+0x3db4:   	ldsb	[%g2], %l6
	.word	0xf3070018	! t0_kref+0x3db8:   	ld	[%i4 + %i0], %f25
	.word	0xa8a73c0e	! t0_kref+0x3dbc:   	subcc	%i4, -0x3f2, %l4
	.word	0xb9b50c98	! t0_kref+0x3dc0:   	fandnot2	%f20, %f24, %f28
	.word	0xea064000	! t0_kref+0x3dc4:   	ld	[%i1], %l5
	.word	0xd2167ff8	! t0_kref+0x3dc8:   	lduh	[%i1 - 8], %o1
	.word	0xa896c01c	! t0_kref+0x3dcc:   	orcc	%i3, %i4, %l4
	.word	0xf630a022	! t0_kref+0x3dd0:   	sth	%i3, [%g2 + 0x22]
	.word	0xd440a038	! t0_kref+0x3dd4:   	ldsw	[%g2 + 0x38], %o2
	.word	0x81ab8a54	! t0_kref+0x3dd8:   	fcmpd	%fcc0, %f14, %f20
	.word	0xc12e6014	! t0_kref+0x3ddc:   	st	%fsr, [%i1 + 0x14]
	.word	0xd8100018	! t0_kref+0x3de0:   	lduh	[%g0 + %i0], %o4
	.word	0x81ad8adc	! t0_kref+0x3de4:   	fcmped	%fcc0, %f22, %f28
	.word	0x8582c009	! t0_kref+0x3de8:   	wr	%o3, %o1, %ccr
	.word	0xaaf031d5	! t0_kref+0x3dec:   	udivcc	%g0, -0xe2b, %l5
	.word	0x949f334d	! t0_kref+0x3df0:   	xorcc	%i4, -0xcb3, %o2
	.word	0xada018da	! t0_kref+0x3df4:   	fdtos	%f26, %f22
	.word	0xa9a7085a	! t0_kref+0x3df8:   	faddd	%f28, %f26, %f20
	.word	0xadb30a4a	! t0_kref+0x3dfc:   	fpadd32	%f12, %f10, %f22
	.word	0x95a00556	! t0_kref+0x3e00:   	fsqrtd	%f22, %f10
	.word	0x87802082	! t0_kref+0x3e04:   	mov	0x82, %asi
	.word	0xd01e001d	! t0_kref+0x3e08:   	ldd	[%i0 + %i5], %o0
	.word	0x933ac000	! t0_kref+0x3e0c:   	sra	%o3, %g0, %o1
	.word	0x86102004	! t0_kref+0x3e10:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x3e14:   	bne,a	_kref+0x3e14
	.word	0x86a0e001	! t0_kref+0x3e18:   	subcc	%g3, 1, %g3
	.word	0xa9a30958	! t0_kref+0x3e1c:   	fmuld	%f12, %f24, %f20
	.word	0xadb00f1c	! t0_kref+0x3e20:   	fsrc2	%f28, %f22
	.word	0x972f6016	! t0_kref+0x3e24:   	sll	%i5, 0x16, %o3
	.word	0xaba01a4a	! t0_kref+0x3e28:   	fdtoi	%f10, %f21
	.word	0xee10a020	! t0_kref+0x3e2c:   	lduh	[%g2 + 0x20], %l7
	.word	0xab44c000	! t0_kref+0x3e30:   	mov	%gsr, %l5
	.word	0x96def9d0	! t0_kref+0x3e34:   	smulcc	%i3, -0x630, %o3
	.word	0xf1066004	! t0_kref+0x3e38:   	ld	[%i1 + 4], %f24
	.word	0xaa70000b	! t0_kref+0x3e3c:   	udiv	%g0, %o3, %l5
	.word	0xe51fbcb8	! t0_kref+0x3e40:   	ldd	[%fp - 0x348], %f18
	.word	0x9fc10000	! t0_kref+0x3e44:   	call	%g4
	.word	0xa9a01050	! t0_kref+0x3e48:   	fdtox	%f16, %f20
	.word	0xc3ee500b	! t0_kref+0x3e4c:   	prefetcha	%i1 + %o3, 1
	.word	0xf19e5a1d	! t0_kref+0x3e50:   	ldda	[%i1 + %i5]0xd0, %f24
	.word	0xec080018	! t0_kref+0x3e54:   	ldub	[%g0 + %i0], %l6
	.word	0xa1a00552	! t0_kref+0x3e58:   	fsqrtd	%f18, %f16
	.word	0x9de3bfa0	! t0_kref+0x3e5c:   	save	%sp, -0x60, %sp
	.word	0xb4ae7b5c	! t0_kref+0x3e60:   	andncc	%i1, -0x4a4, %i2
	.word	0x93eee7a3	! t0_kref+0x3e64:   	restore	%i3, 0x7a3, %o1
	.word	0x99a70856	! t0_kref+0x3e68:   	faddd	%f28, %f22, %f12
	.word	0xf920a020	! t0_kref+0x3e6c:   	st	%f28, [%g2 + 0x20]
	.word	0x97b7435b	! t0_kref+0x3e70:   	alignaddrl	%i5, %i3, %o3
	.word	0xb9b406f8	! t0_kref+0x3e74:   	fmul8ulx16	%f16, %f24, %f28
	.word	0xae328000	! t0_kref+0x3e78:   	orn	%o2, %g0, %l7
	.word	0x98a735e4	! t0_kref+0x3e7c:   	subcc	%i4, -0xa1c, %o4
	.word	0xa83f4000	! t0_kref+0x3e80:   	not	%i5, %l4
	.word	0xb5a0054a	! t0_kref+0x3e84:   	fsqrtd	%f10, %f26
	.word	0xd2362000	! t0_kref+0x3e88:   	sth	%o1, [%i0]
	.word	0xada609ca	! t0_kref+0x3e8c:   	fdivd	%f24, %f10, %f22
	.word	0xec00a008	! t0_kref+0x3e90:   	ld	[%g2 + 8], %l6
	.word	0x969b711e	! t0_kref+0x3e94:   	xorcc	%o5, -0xee2, %o3
	.word	0xd430a030	! t0_kref+0x3e98:   	sth	%o2, [%g2 + 0x30]
	.word	0x9da01a54	! t0_kref+0x3e9c:   	fdtoi	%f20, %f14
	.word	0x9da608d0	! t0_kref+0x3ea0:   	fsubd	%f24, %f16, %f14
	.word	0x86102001	! t0_kref+0x3ea4:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x3ea8:   	bne,a	_kref+0x3ea8
	.word	0x86a0e001	! t0_kref+0x3eac:   	subcc	%g3, 1, %g3
	.word	0x2f480007	! t0_kref+0x3eb0:   	fbu,a,pt	%fcc0, _kref+0x3ecc
	.word	0xd03e001d	! t0_kref+0x3eb4:   	std	%o0, [%i0 + %i5]
	.word	0xacbec009	! t0_kref+0x3eb8:   	xnorcc	%i3, %o1, %l6
	.word	0xb9a689dc	! t0_kref+0x3ebc:   	fdivd	%f26, %f28, %f28
	.word	0xb5b486d4	! t0_kref+0x3ec0:   	fmul8sux16	%f18, %f20, %f26
	.word	0x9462c01b	! t0_kref+0x3ec4:   	subc	%o3, %i3, %o2
	.word	0xafa44933	! t0_kref+0x3ec8:   	fmuls	%f17, %f19, %f23
	.word	0xa5a01a35	! t0_kref+0x3ecc:   	fstoi	%f21, %f18
	.word	0xda163ff4	! t0_kref+0x3ed0:   	lduh	[%i0 - 0xc], %o5
	.word	0xd2263ff0	! t0_kref+0x3ed4:   	st	%o1, [%i0 - 0x10]
	.word	0x985ac01c	! t0_kref+0x3ed8:   	smul	%o3, %i4, %o4
	.word	0x98bf0000	! t0_kref+0x3edc:   	xnorcc	%i4, %g0, %o4
	.word	0xd210a01a	! t0_kref+0x3ee0:   	lduh	[%g2 + 0x1a], %o1
	.word	0x972e8000	! t0_kref+0x3ee4:   	sll	%i2, %g0, %o3
	.word	0x26480006	! t0_kref+0x3ee8:   	bl,a,pt	%icc, _kref+0x3f00
	.word	0x9b408000	! t0_kref+0x3eec:   	mov	%ccr, %o5
	.word	0xd64e8019	! t0_kref+0x3ef0:   	ldsb	[%i2 + %i1], %o3
	.word	0x9af37873	! t0_kref+0x3ef4:   	udivcc	%o5, -0x78d, %o5
	.word	0xacdae258	! t0_kref+0x3ef8:   	smulcc	%o3, 0x258, %l6
	.word	0xa1b0076e	! t0_kref+0x3efc:   	fpack16	%f14, %f16
	.word	0x8580000a	! t0_kref+0x3f00:   	mov	%o2, %ccr
	.word	0xada488d6	! t0_kref+0x3f04:   	fsubd	%f18, %f22, %f22
	.word	0x9272c000	! t0_kref+0x3f08:   	udiv	%o3, %g0, %o1
	.word	0xb3b00774	! t0_kref+0x3f0c:   	fpack16	%f20, %f25
	.word	0x9936e01c	! t0_kref+0x3f10:   	srl	%i3, 0x1c, %o4
	.word	0xaf12800c	! t0_kref+0x3f14:   	taddcctv	%o2, %o4, %l7
	.word	0x9aa32df3	! t0_kref+0x3f18:   	subcc	%o4, 0xdf3, %o5
	.word	0x81af0adc	! t0_kref+0x3f1c:   	fcmped	%fcc0, %f28, %f28
	.word	0xe56e2008	! t0_kref+0x3f20:   	prefetch	%i0 + 8, 18
	.word	0xae57000b	! t0_kref+0x3f24:   	umul	%i4, %o3, %l7
	.word	0x24480003	! t0_kref+0x3f28:   	ble,a,pt	%icc, _kref+0x3f34
	.word	0x950f001b	! t0_kref+0x3f2c:   	tsubcc	%i4, %i3, %o2
	.word	0x96624009	! t0_kref+0x3f30:   	subc	%o1, %o1, %o3
	.word	0xb5a01a3a	! t0_kref+0x3f34:   	fstoi	%f26, %f26
	.word	0x35480005	! t0_kref+0x3f38:   	fbue,a,pt	%fcc0, _kref+0x3f4c
	.word	0xc0200019	! t0_kref+0x3f3c:   	clr	[%g0 + %i1]
	.word	0x3f480001	! t0_kref+0x3f40:   	fbo,a,pt	%fcc0, _kref+0x3f44
	.word	0xd0ce1000	! t0_kref+0x3f44:   	ldsba	[%i0]0x80, %o0
	.word	0xd81e3fe8	! t0_kref+0x3f48:   	ldd	[%i0 - 0x18], %o4
	.word	0xeb68a049	! t0_kref+0x3f4c:   	prefetch	%g2 + 0x49, 21
	.word	0xf836001b	! t0_kref+0x3f50:   	sth	%i4, [%i0 + %i3]
	.word	0xd99f1a58	! t0_kref+0x3f54:   	ldda	[%i4 + %i0]0xd2, %f12
	.word	0x9632f8b3	! t0_kref+0x3f58:   	orn	%o3, -0x74d, %o3
	.word	0x87802080	! t0_kref+0x3f5c:   	mov	0x80, %asi
	.word	0xaaa03013	! t0_kref+0x3f60:   	subcc	%g0, -0xfed, %l5
	.word	0xd8063fe8	! t0_kref+0x3f64:   	ld	[%i0 - 0x18], %o4
	.word	0xc1e8a04b	! t0_kref+0x3f68:   	prefetcha	%g2 + 0x4b, 0
	.word	0xb9a58834	! t0_kref+0x3f6c:   	fadds	%f22, %f20, %f28
	.word	0xb9b44711	! t0_kref+0x3f70:   	fmuld8sux16	%f17, %f17, %f28
	.word	0xb9b48a4e	! t0_kref+0x3f74:   	fpadd32	%f18, %f14, %f28
	.word	0xaa92aca8	! t0_kref+0x3f78:   	orcc	%o2, 0xca8, %l5
	.word	0x34800001	! t0_kref+0x3f7c:   	bg,a	_kref+0x3f80
	.word	0xd628a01a	! t0_kref+0x3f80:   	stb	%o3, [%g2 + 0x1a]
	.word	0xeda67ff8	! t0_kref+0x3f84:   	sta	%f22, [%i1 - 8]%asi
	.word	0xa1a0054e	! t0_kref+0x3f88:   	fsqrtd	%f14, %f16
	.word	0xb1a588d4	! t0_kref+0x3f8c:   	fsubd	%f22, %f20, %f24
	.word	0x81ae8ada	! t0_kref+0x3f90:   	fcmped	%fcc0, %f26, %f26
	.word	0x9fa000ac	! t0_kref+0x3f94:   	fnegs	%f12, %f15
	.word	0xc0a0a010	! t0_kref+0x3f98:   	sta	%g0, [%g2 + 0x10]%asi
	.word	0xa8c6bfda	! t0_kref+0x3f9c:   	addccc	%i2, -0x26, %l4
	.word	0xe76e401c	! t0_kref+0x3fa0:   	prefetch	%i1 + %i4, 19
	.word	0xa1a0190c	! t0_kref+0x3fa4:   	fitod	%f12, %f16
	.word	0xa852c009	! t0_kref+0x3fa8:   	umul	%o3, %o1, %l4
	.word	0xd03e0000	! t0_kref+0x3fac:   	std	%o0, [%i0]
	.word	0xa5a00550	! t0_kref+0x3fb0:   	fsqrtd	%f16, %f18
	.word	0xe11fbfd8	! t0_kref+0x3fb4:   	ldd	[%fp - 0x28], %f16
	.word	0x9fc00004	! t0_kref+0x3fb8:   	call	%g0 + %g4
	.word	0xb5b58dce	! t0_kref+0x3fbc:   	fnand	%f22, %f14, %f26
	.word	0x9ac3401c	! t0_kref+0x3fc0:   	addccc	%o5, %i4, %o5
	.word	0xd288a018	! t0_kref+0x3fc4:   	lduba	[%g2 + 0x18]%asi, %o1
	.word	0xa9aa0054	! t0_kref+0x3fc8:   	fmovda	%fcc0, %f20, %f20
	.word	0xd450a028	! t0_kref+0x3fcc:   	ldsh	[%g2 + 0x28], %o2
	.word	0xb1a5885c	! t0_kref+0x3fd0:   	faddd	%f22, %f28, %f24
	.word	0x29044ae9	! t0_kref+0x3fd4:   	sethi	%hi(0x112ba400), %l4
	.word	0x36480004	! t0_kref+0x3fd8:   	bge,a,pt	%icc, _kref+0x3fe8
	.word	0x905af2ec	! t0_kref+0x3fdc:   	smul	%o3, -0xd14, %o0
	.word	0x99a3c834	! t0_kref+0x3fe0:   	fadds	%f15, %f20, %f12
	.word	0x97a0053a	! t0_kref+0x3fe4:   	fsqrts	%f26, %f11
	.word	0x9677360f	! t0_kref+0x3fe8:   	udiv	%i4, -0x9f1, %o3
	.word	0x966268fe	! t0_kref+0x3fec:   	subc	%o1, 0x8fe, %o3
	.word	0x35800007	! t0_kref+0x3ff0:   	fbue,a	_kref+0x400c
	.word	0xae0f000a	! t0_kref+0x3ff4:   	and	%i4, %o2, %l7
	.word	0xa9a0192c	! t0_kref+0x3ff8:   	fstod	%f12, %f20
	.word	0xb1a0013a	! t0_kref+0x3ffc:   	fabss	%f26, %f24
	.word	0x81ad8ace	! t0_kref+0x4000:   	fcmped	%fcc0, %f22, %f14
	.word	0xac983dfe	! t0_kref+0x4004:   	xorcc	%g0, -0x202, %l6
	.word	0x99b68c7c	! t0_kref+0x4008:   	fnors	%f26, %f28, %f12
	call	SYM(t0_subr3)
	.word	0x93408000	! t0_kref+0x4010:   	mov	%ccr, %o1
	.word	0x81aeca32	! t0_kref+0x4014:   	fcmps	%fcc0, %f27, %f18
	.word	0x81ab0ad6	! t0_kref+0x4018:   	fcmped	%fcc0, %f12, %f22
	.word	0x81ad8a3a	! t0_kref+0x401c:   	fcmps	%fcc0, %f22, %f26
	.word	0x9086c00c	! t0_kref+0x4020:   	addcc	%i3, %o4, %o0
	.word	0xf6b66000	! t0_kref+0x4024:   	stha	%i3, [%i1]%asi
	.word	0xd420a010	! t0_kref+0x4028:   	st	%o2, [%g2 + 0x10]
	.word	0x34480004	! t0_kref+0x402c:   	bg,a,pt	%icc, _kref+0x403c
	.word	0xd290a028	! t0_kref+0x4030:   	lduha	[%g2 + 0x28]%asi, %o1
	.word	0x992ec00d	! t0_kref+0x4034:   	sll	%i3, %o5, %o4
	.word	0xa5a00536	! t0_kref+0x4038:   	fsqrts	%f22, %f18
	.word	0xe3066010	! t0_kref+0x403c:   	ld	[%i1 + 0x10], %f17
	.word	0x2a800006	! t0_kref+0x4040:   	bcs,a	_kref+0x4058
	.word	0xfa36201c	! t0_kref+0x4044:   	sth	%i5, [%i0 + 0x1c]
	.word	0xd626401c	! t0_kref+0x4048:   	st	%o3, [%i1 + %i4]
	.word	0x81ae8a4e	! t0_kref+0x404c:   	fcmpd	%fcc0, %f26, %f14
	.word	0xa3a01a56	! t0_kref+0x4050:   	fdtoi	%f22, %f17
	.word	0xc768a007	! t0_kref+0x4054:   	prefetch	%g2 + 7, 3
	.word	0xc36e2010	! t0_kref+0x4058:   	prefetch	%i0 + 0x10, 1
	.word	0xae66f671	! t0_kref+0x405c:   	subc	%i3, -0x98f, %l7
	.word	0xdd00a028	! t0_kref+0x4060:   	ld	[%g2 + 0x28], %f14
	.word	0xa9a6092c	! t0_kref+0x4064:   	fmuls	%f24, %f12, %f20
	sethi	%hi(1f), %o7
	jmpl	%o7+%lo(1f), %g1
	.empty
	.word	0x988f734d	! t0_kref+0x4070:   	andcc	%i5, -0xcb3, %o4
	.word	0xefee501a	! t0_kref+0x4074:   	prefetcha	%i1 + %i2, 23
	.word	0xd60e2015	! t0_kref+0x4078:   	ldub	[%i0 + 0x15], %o3
	.word	0xd800a038	! t0_kref+0x407c:   	ld	[%g2 + 0x38], %o4
	.word	0xae600000	! t0_kref+0x4080:   	subc	%g0, %g0, %l7
	.word	0xec50a01a	! t0_kref+0x4084:   	ldsh	[%g2 + 0x1a], %l6
1:	.word	0xe986501c	! t0_kref+0x4088:   	lda	[%i1 + %i4]0x80, %f20
	.word	0xb5a0002e	! t0_kref+0x408c:   	fmovs	%f14, %f26
	.word	0xe8064000	! t0_kref+0x4090:   	ld	[%i1], %l4
	.word	0xaf400000	! t0_kref+0x4094:   	mov	%y, %l7
	.word	0x32800001	! t0_kref+0x4098:   	bne,a	_kref+0x409c
	.word	0x92670009	! t0_kref+0x409c:   	subc	%i4, %o1, %o1
	.word	0x81ae0a52	! t0_kref+0x40a0:   	fcmpd	%fcc0, %f24, %f18
	.word	0x93b3430c	! t0_kref+0x40a4:   	alignaddr	%o5, %o4, %o1
	.word	0x9626b159	! t0_kref+0x40a8:   	sub	%i2, -0xea7, %o3
	.word	0xae3f000d	! t0_kref+0x40ac:   	xnor	%i4, %o5, %l7
	.word	0x9bb68109	! t0_kref+0x40b0:   	edge32	%i2, %o1, %o5
	.word	0x81ddae03	! t0_kref+0x40b4:   	flush	%l6 + 0xe03
	.word	0xb5a40854	! t0_kref+0x40b8:   	faddd	%f16, %f20, %f26
	.word	0x9fc00004	! t0_kref+0x40bc:   	call	%g0 + %g4
	.word	0xa5a01a5a	! t0_kref+0x40c0:   	fdtoi	%f26, %f18
	.word	0xa9b3014c	! t0_kref+0x40c4:   	edge32l	%o4, %o4, %l4
	.word	0x39480004	! t0_kref+0x40c8:   	fbuge,a,pt	%fcc0, _kref+0x40d8
	.word	0x8d80239f	! t0_kref+0x40cc:   	mov	0x39f, %fprs
	.word	0xd636c018	! t0_kref+0x40d0:   	sth	%o3, [%i3 + %i0]
	.word	0xaf400000	! t0_kref+0x40d4:   	mov	%y, %l7
	.word	0xd51fbe48	! t0_kref+0x40d8:   	ldd	[%fp - 0x1b8], %f10
	.word	0xada60852	! t0_kref+0x40dc:   	faddd	%f24, %f18, %f22
	.word	0xb1a0190e	! t0_kref+0x40e0:   	fitod	%f14, %f24
	.word	0x9de3bfa0	! t0_kref+0x40e4:   	save	%sp, -0x60, %sp
	.word	0xadeec01c	! t0_kref+0x40e8:   	restore	%i3, %i4, %l6
	.word	0xdd067ff0	! t0_kref+0x40ec:   	ld	[%i1 - 0x10], %f14
	.word	0x9457001d	! t0_kref+0x40f0:   	umul	%i4, %i5, %o2
	.word	0xf8b0a030	! t0_kref+0x40f4:   	stha	%i4, [%g2 + 0x30]%asi
	.word	0xd4c0a038	! t0_kref+0x40f8:   	ldswa	[%g2 + 0x38]%asi, %o2
	.word	0xd410a000	! t0_kref+0x40fc:   	lduh	[%g2], %o2
	.word	0xdd1fbe68	! t0_kref+0x4100:   	ldd	[%fp - 0x198], %f14
	.word	0x81aecaad	! t0_kref+0x4104:   	fcmpes	%fcc0, %f27, %f13
	.word	0x943a7cb9	! t0_kref+0x4108:   	xnor	%o1, -0x347, %o2
	.word	0xc7ee501a	! t0_kref+0x410c:   	prefetcha	%i1 + %i2, 3
	.word	0xdf80a000	! t0_kref+0x4110:   	lda	[%g2]%asi, %f15
	.word	0xf5180019	! t0_kref+0x4114:   	ldd	[%g0 + %i1], %f26
	.word	0xaa47000a	! t0_kref+0x4118:   	addc	%i4, %o2, %l5
	.word	0x920f3ebf	! t0_kref+0x411c:   	and	%i4, -0x141, %o1
	.word	0x9a637ab9	! t0_kref+0x4120:   	subc	%o5, -0x547, %o5
	.word	0xb1a0191c	! t0_kref+0x4124:   	fitod	%f28, %f24
	.word	0xa5a000b1	! t0_kref+0x4128:   	fnegs	%f17, %f18
	.word	0x86102006	! t0_kref+0x412c:   	mov	0x6, %g3
	.word	0x86a0e001	! t0_kref+0x4130:   	subcc	%g3, 1, %g3
	.word	0x22800012	! t0_kref+0x4134:   	be,a	_kref+0x417c
	.word	0xd1be5a5d	! t0_kref+0x4138:   	stda	%f8, [%i1 + %i5]0xd2
	.word	0xa7a649af	! t0_kref+0x413c:   	fdivs	%f25, %f15, %f19
	.word	0x95a30958	! t0_kref+0x4140:   	fmuld	%f12, %f24, %f10
	.word	0x9683400d	! t0_kref+0x4144:   	addcc	%o5, %o5, %o3
	.word	0x989ac00a	! t0_kref+0x4148:   	xorcc	%o3, %o2, %o4
	.word	0x92bee871	! t0_kref+0x414c:   	xnorcc	%i3, 0x871, %o1
	.word	0x81ad8acc	! t0_kref+0x4150:   	fcmped	%fcc0, %f22, %f12
	.word	0x81af4abb	! t0_kref+0x4154:   	fcmpes	%fcc0, %f29, %f27
	.word	0xe890a008	! t0_kref+0x4158:   	lduha	[%g2 + 8]%asi, %l4
	.word	0xbba01a54	! t0_kref+0x415c:   	fdtoi	%f20, %f29
	.word	0x94e0000a	! t0_kref+0x4160:   	subccc	%g0, %o2, %o2
	.word	0xed80a028	! t0_kref+0x4164:   	lda	[%g2 + 0x28]%asi, %f22
	.word	0xe86e601b	! t0_kref+0x4168:   	ldstub	[%i1 + 0x1b], %l4
	.word	0x94ae800a	! t0_kref+0x416c:   	andncc	%i2, %o2, %o2
	.word	0xada00550	! t0_kref+0x4170:   	fsqrtd	%f16, %f22
	.word	0xbbb74f76	! t0_kref+0x4174:   	fornot1s	%f29, %f22, %f29
	.word	0x9ba01a5c	! t0_kref+0x4178:   	fdtoi	%f28, %f13
	.word	0xdb80a030	! t0_kref+0x417c:   	lda	[%g2 + 0x30]%asi, %f13
	.word	0xac36801a	! t0_kref+0x4180:   	orn	%i2, %i2, %l6
	.word	0xe91fbd28	! t0_kref+0x4184:   	ldd	[%fp - 0x2d8], %f20
	.word	0xa9b3891c	! t0_kref+0x4188:   	faligndata	%f14, %f28, %f20
	.word	0xd28e1000	! t0_kref+0x418c:   	lduba	[%i0]0x80, %o1
	.word	0xa822c00a	! t0_kref+0x4190:   	sub	%o3, %o2, %l4
	.word	0xda80a000	! t0_kref+0x4194:   	lda	[%g2]%asi, %o5
	.word	0xf6a8a00b	! t0_kref+0x4198:   	stba	%i3, [%g2 + 0xb]%asi
	.word	0xe9ee501b	! t0_kref+0x419c:   	prefetcha	%i1 + %i3, 20
	.word	0xd216c018	! t0_kref+0x41a0:   	lduh	[%i3 + %i0], %o1
	.word	0x945aea12	! t0_kref+0x41a4:   	smul	%o3, 0xa12, %o2
	.word	0x95400000	! t0_kref+0x41a8:   	mov	%y, %o2
	.word	0xaba70839	! t0_kref+0x41ac:   	fadds	%f28, %f25, %f21
	sethi	%hi(2f), %o7
	.word	0xe40be1e4	! t0_kref+0x41b4:   	ldub	[%o7 + 0x1e4], %l2
	.word	0xa41ca00c	! t0_kref+0x41b8:   	xor	%l2, 0xc, %l2
	.word	0xe42be1e4	! t0_kref+0x41bc:   	stb	%l2, [%o7 + 0x1e4]
	.word	0x81dbe1e4	! t0_kref+0x41c0:   	flush	%o7 + 0x1e4
	.word	0xda28a009	! t0_kref+0x41c4:   	stb	%o5, [%g2 + 9]
	.word	0x94e3000d	! t0_kref+0x41c8:   	subccc	%o4, %o5, %o2
	.word	0xabb2cfaf	! t0_kref+0x41cc:   	fors	%f11, %f15, %f21
	.word	0xb1a0192e	! t0_kref+0x41d0:   	fstod	%f14, %f24
	.word	0x8143c000	! t0_kref+0x41d4:   	stbar
	.word	0x925f0009	! t0_kref+0x41d8:   	smul	%i4, %o1, %o1
	.word	0x9a66a715	! t0_kref+0x41dc:   	subc	%i2, 0x715, %o5
	.word	0x98f32dec	! t0_kref+0x41e0:   	udivcc	%o4, 0xdec, %o4
2:	.word	0x9ba01a4c	! t0_kref+0x41e4:   	fdtoi	%f12, %f13
	.word	0x97b5cc6e	! t0_kref+0x41e8:   	fnors	%f23, %f14, %f11
	.word	0x9666801b	! t0_kref+0x41ec:   	subc	%i2, %i3, %o3
	.word	0x81ac0a5a	! t0_kref+0x41f0:   	fcmpd	%fcc0, %f16, %f26
	.word	0xb3a018d8	! t0_kref+0x41f4:   	fdtos	%f24, %f25
	.word	0x96c6c00d	! t0_kref+0x41f8:   	addccc	%i3, %o5, %o3
	.word	0x38800002	! t0_kref+0x41fc:   	bgu,a	_kref+0x4204
	.word	0xee90a028	! t0_kref+0x4200:   	lduha	[%g2 + 0x28]%asi, %l7
	.word	0x2c800007	! t0_kref+0x4204:   	bneg,a	_kref+0x4220
	.word	0xee50a00a	! t0_kref+0x4208:   	ldsh	[%g2 + 0xa], %l7
	.word	0xad36a006	! t0_kref+0x420c:   	srl	%i2, 0x6, %l6
	.word	0xa3a01a34	! t0_kref+0x4210:   	fstoi	%f20, %f17
	.word	0x81ae8a5c	! t0_kref+0x4214:   	fcmpd	%fcc0, %f26, %f28
	.word	0xada388cc	! t0_kref+0x4218:   	fsubd	%f14, %f12, %f22
	.word	0xd66e600a	! t0_kref+0x421c:   	ldstub	[%i1 + 0xa], %o3
	.word	0x92a6af77	! t0_kref+0x4220:   	subcc	%i2, 0xf77, %o1
	.word	0xec1e3ff8	! t0_kref+0x4224:   	ldd	[%i0 - 8], %l6
	.word	0x1b0bc7c1	! t0_kref+0x4228:   	sethi	%hi(0x2f1f0400), %o5
	.word	0x21480005	! t0_kref+0x422c:   	fbn,a,pt	%fcc0, _kref+0x4240
	.word	0xa5a608ca	! t0_kref+0x4230:   	fsubd	%f24, %f10, %f18
	.word	0x972ac01b	! t0_kref+0x4234:   	sll	%o3, %i3, %o3
	.word	0x26800005	! t0_kref+0x4238:   	bl,a	_kref+0x424c
	.word	0xf4a01018	! t0_kref+0x423c:   	sta	%i2, [%g0 + %i0]0x80
	.word	0xbba01a4e	! t0_kref+0x4240:   	fdtoi	%f14, %f29
	.word	0xdc016dcc	! t0_kref+0x4244:   	ld	[%g5 + 0xdcc], %sp
	call	SYM(t0_subr2)
	.word	0xb7b3cab0	! t0_kref+0x424c:   	fpsub16s	%f15, %f16, %f27
	.word	0x8143c000	! t0_kref+0x4250:   	stbar
	.word	0x2e480001	! t0_kref+0x4254:   	bvs,a,pt	%icc, _kref+0x4258
	.word	0xf5064000	! t0_kref+0x4258:   	ld	[%i1], %f26
	.word	0xacc022c3	! t0_kref+0x425c:   	addccc	%g0, 0x2c3, %l6
	.word	0x965f001d	! t0_kref+0x4260:   	smul	%i4, %i5, %o3
	.word	0x9052801d	! t0_kref+0x4264:   	umul	%o2, %i5, %o0
	.word	0xb3a000b7	! t0_kref+0x4268:   	fnegs	%f23, %f25
	.word	0x9da0052d	! t0_kref+0x426c:   	fsqrts	%f13, %f14
	.word	0x95b7055c	! t0_kref+0x4270:   	fcmpeq16	%f28, %f28, %o2
	.word	0xf91e0000	! t0_kref+0x4274:   	ldd	[%i0], %f28
	.word	0x99a018ca	! t0_kref+0x4278:   	fdtos	%f10, %f12
	.word	0xafb00fe0	! t0_kref+0x427c:   	fones	%f23
	.word	0x2e800004	! t0_kref+0x4280:   	bvs,a	_kref+0x4290
	.word	0xa3b40efa	! t0_kref+0x4284:   	fornot2s	%f16, %f26, %f17
	.word	0x81af0aaf	! t0_kref+0x4288:   	fcmpes	%fcc0, %f28, %f15
	.word	0x8182c000	! t0_kref+0x428c:   	wr	%o3, %g0, %y
	.word	0x3d480001	! t0_kref+0x4290:   	fbule,a,pt	%fcc0, _kref+0x4294
	.word	0x9ba01a35	! t0_kref+0x4294:   	fstoi	%f21, %f13
	.word	0x98fe800b	! t0_kref+0x4298:   	sdivcc	%i2, %o3, %o4
	.word	0xefe8a00b	! t0_kref+0x429c:   	prefetcha	%g2 + 0xb, 23
	.word	0x3a480002	! t0_kref+0x42a0:   	bcc,a,pt	%icc, _kref+0x42a8
	.word	0xd240a000	! t0_kref+0x42a4:   	ldsw	[%g2], %o1
	.word	0xed68a04b	! t0_kref+0x42a8:   	prefetch	%g2 + 0x4b, 22
	.word	0x930a7a01	! t0_kref+0x42ac:   	tsubcc	%o1, -0x5ff, %o1
	.word	0xa3a609bc	! t0_kref+0x42b0:   	fdivs	%f24, %f28, %f17
	.word	0xb9a6885c	! t0_kref+0x42b4:   	faddd	%f26, %f28, %f28
	.word	0xf11f4018	! t0_kref+0x42b8:   	ldd	[%i5 + %i0], %f24
	.word	0xa8a3401a	! t0_kref+0x42bc:   	subcc	%o5, %i2, %l4
	.word	0xd690a02a	! t0_kref+0x42c0:   	lduha	[%g2 + 0x2a]%asi, %o3
	.word	0xada309d4	! t0_kref+0x42c4:   	fdivd	%f12, %f20, %f22
	.word	0x1523628d	! t0_kref+0x42c8:   	sethi	%hi(0x8d8a3400), %o2
	.word	0x2c800007	! t0_kref+0x42cc:   	bneg,a	_kref+0x42e8
	.word	0xd82e3ff4	! t0_kref+0x42d0:   	stb	%o4, [%i0 - 0xc]
	.word	0xc7ee500a	! t0_kref+0x42d4:   	prefetcha	%i1 + %o2, 3
	.word	0xaa3ec00b	! t0_kref+0x42d8:   	xnor	%i3, %o3, %l5
	.word	0x9fa30830	! t0_kref+0x42dc:   	fadds	%f12, %f16, %f15
	.word	0xec00a020	! t0_kref+0x42e0:   	ld	[%g2 + 0x20], %l6
	.word	0x99a489dc	! t0_kref+0x42e4:   	fdivd	%f18, %f28, %f12
	.word	0xa5a5c839	! t0_kref+0x42e8:   	fadds	%f23, %f25, %f18
	.word	0xa9b007b4	! t0_kref+0x42ec:   	fpackfix	%f20, %f20
	.word	0xe91fbd50	! t0_kref+0x42f0:   	ldd	[%fp - 0x2b0], %f20
	.word	0x933f2011	! t0_kref+0x42f4:   	sra	%i4, 0x11, %o1
	.word	0x878020d0	! t0_kref+0x42f8:   	mov	0xd0, %asi
	.word	0x9732e00b	! t0_kref+0x42fc:   	srl	%o3, 0xb, %o3
	.word	0xada508d2	! t0_kref+0x4300:   	fsubd	%f20, %f18, %f22
	.word	0xabb0035b	! t0_kref+0x4304:   	alignaddrl	%g0, %i3, %l5
	.word	0xa3a00530	! t0_kref+0x4308:   	fsqrts	%f16, %f17
	.word	0xe51e3fe8	! t0_kref+0x430c:   	ldd	[%i0 - 0x18], %f18
	.word	0x91b280ad	! t0_kref+0x4310:   	edge16n	%o2, %o5, %o0
	.word	0xf62e2000	! t0_kref+0x4314:   	stb	%i3, [%i0]
	.word	0x81dd8018	! t0_kref+0x4318:   	flush	%l6 + %i0
	.word	0xe0fe101c	! t0_kref+0x431c:   	swapa	[%i0 + %i4]0x80, %l0
	.word	0xafb2c00b	! t0_kref+0x4320:   	edge8	%o3, %o3, %l7
	.word	0x39480008	! t0_kref+0x4324:   	fbuge,a,pt	%fcc0, _kref+0x4344
	.word	0xf1be501d	! t0_kref+0x4328:   	stda	%f24, [%i1 + %i5]0x80
	.word	0x9db4099a	! t0_kref+0x432c:   	bshuffle	%f16, %f26, %f14
	.word	0xa9a00552	! t0_kref+0x4330:   	fsqrtd	%f18, %f20
	.word	0xd4200018	! t0_kref+0x4334:   	st	%o2, [%g0 + %i0]
	.word	0xb1b38afa	! t0_kref+0x4338:   	fpsub32s	%f14, %f26, %f24
	.word	0x9da0012d	! t0_kref+0x433c:   	fabss	%f13, %f14
	.word	0xa9a609bd	! t0_kref+0x4340:   	fdivs	%f24, %f29, %f20
	.word	0xd250a032	! t0_kref+0x4344:   	ldsh	[%g2 + 0x32], %o1
	.word	0xe8167ff2	! t0_kref+0x4348:   	lduh	[%i1 - 0xe], %l4
	.word	0xa9b00f0e	! t0_kref+0x434c:   	fsrc2	%f14, %f20
	.word	0xa5a000ae	! t0_kref+0x4350:   	fnegs	%f14, %f18
	.word	0x23480006	! t0_kref+0x4354:   	fbne,a,pt	%fcc0, _kref+0x436c
	.word	0x91b28456	! t0_kref+0x4358:   	fcmpne16	%f10, %f22, %o0
	.word	0xa5a00558	! t0_kref+0x435c:   	fsqrtd	%f24, %f18
	.word	0x983b001d	! t0_kref+0x4360:   	xnor	%o4, %i5, %o4
	.word	0xa9b7412c	! t0_kref+0x4364:   	edge32n	%i5, %o4, %l4
	.word	0x9ba4c8b1	! t0_kref+0x4368:   	fsubs	%f19, %f17, %f13
	.word	0x9ba01a2e	! t0_kref+0x436c:   	fstoi	%f14, %f13
	.word	0xa1a01933	! t0_kref+0x4370:   	fstod	%f19, %f16
	.word	0x99a0105a	! t0_kref+0x4374:   	fdtox	%f26, %f12
	.word	0xa1a509da	! t0_kref+0x4378:   	fdivd	%f20, %f26, %f16
	.word	0x8143c000	! t0_kref+0x437c:   	stbar
	.word	0xac36800c	! t0_kref+0x4380:   	orn	%i2, %o4, %l6
	.word	0xab400000	! t0_kref+0x4384:   	mov	%y, %l5
	.word	0xaaa37e7b	! t0_kref+0x4388:   	subcc	%o5, -0x185, %l5
	.word	0xb1a00552	! t0_kref+0x438c:   	fsqrtd	%f18, %f24
	.word	0xab37000b	! t0_kref+0x4390:   	srl	%i4, %o3, %l5
	.word	0x9de3bfa0	! t0_kref+0x4394:   	save	%sp, -0x60, %sp
	.word	0xb2874018	! t0_kref+0x4398:   	addcc	%i5, %i0, %i1
	.word	0xa9ee260c	! t0_kref+0x439c:   	restore	%i0, 0x60c, %l4
	.word	0xd44e401a	! t0_kref+0x43a0:   	ldsb	[%i1 + %i2], %o2
	.word	0xed067fec	! t0_kref+0x43a4:   	ld	[%i1 - 0x14], %f22
	.word	0x967b3ea9	! t0_kref+0x43a8:   	sdiv	%o4, -0x157, %o3
	.word	0x9bb3410b	! t0_kref+0x43ac:   	edge32	%o5, %o3, %o5
	.word	0xeb68a101	! t0_kref+0x43b0:   	prefetch	%g2 + 0x101, 21
	.word	0xb3a018d4	! t0_kref+0x43b4:   	fdtos	%f20, %f25
	.word	0xaee6a89a	! t0_kref+0x43b8:   	subccc	%i2, 0x89a, %l7
	.word	0xdd1fbea0	! t0_kref+0x43bc:   	ldd	[%fp - 0x160], %f14
	.word	0xb9a3095a	! t0_kref+0x43c0:   	fmuld	%f12, %f26, %f28
	.word	0x2b480007	! t0_kref+0x43c4:   	fbug,a,pt	%fcc0, _kref+0x43e0
	.word	0xd248a00b	! t0_kref+0x43c8:   	ldsb	[%g2 + 0xb], %o1
	.word	0xffee501d	! t0_kref+0x43cc:   	prefetcha	%i1 + %i5, 31
	.word	0xa9a00550	! t0_kref+0x43d0:   	fsqrtd	%f16, %f20
	.word	0x98077653	! t0_kref+0x43d4:   	add	%i5, -0x9ad, %o4
	.word	0xaba38834	! t0_kref+0x43d8:   	fadds	%f14, %f20, %f21
	.word	0xe46e3fe8	! t0_kref+0x43dc:   	ldstub	[%i0 - 0x18], %l2
	.word	0xe700a010	! t0_kref+0x43e0:   	ld	[%g2 + 0x10], %f19
	.word	0x947a400b	! t0_kref+0x43e4:   	sdiv	%o1, %o3, %o2
	.word	0xed6e3ff0	! t0_kref+0x43e8:   	prefetch	%i0 - 0x10, 22
	.word	0x2a800003	! t0_kref+0x43ec:   	bcs,a	_kref+0x43f8
	.word	0xa8bb001c	! t0_kref+0x43f0:   	xnorcc	%o4, %i4, %l4
	.word	0x991b7d6c	! t0_kref+0x43f4:   	tsubcctv	%o5, -0x294, %o4
	.word	0x968a401c	! t0_kref+0x43f8:   	andcc	%o1, %i4, %o3
	.word	0xfa28a00a	! t0_kref+0x43fc:   	stb	%i5, [%g2 + 0xa]
	.word	0x8143c000	! t0_kref+0x4400:   	stbar
	.word	0xa9b60d0a	! t0_kref+0x4404:   	fandnot1	%f24, %f10, %f20
	.word	0xa1a0054c	! t0_kref+0x4408:   	fsqrtd	%f12, %f16
	.word	0x34800006	! t0_kref+0x440c:   	bg,a	_kref+0x4424
	.word	0xf7ee101c	! t0_kref+0x4410:   	prefetcha	%i0 + %i4, 27
	.word	0xd6200019	! t0_kref+0x4414:   	st	%o3, [%g0 + %i1]
	.word	0xa1a0104c	! t0_kref+0x4418:   	fdtox	%f12, %f16
	.word	0x81ab0ad0	! t0_kref+0x441c:   	fcmped	%fcc0, %f12, %f16
	.word	0x2f3bb409	! t0_kref+0x4420:   	sethi	%hi(0xeed02400), %l7
	.word	0x9826eb38	! t0_kref+0x4424:   	sub	%i3, 0xb38, %o4
	.word	0xbba00138	! t0_kref+0x4428:   	fabss	%f24, %f29
	.word	0x81ac0a58	! t0_kref+0x442c:   	fcmpd	%fcc0, %f16, %f24
	.word	0x3c800004	! t0_kref+0x4430:   	bpos,a	_kref+0x4440
	.word	0xc02e600b	! t0_kref+0x4434:   	clrb	[%i1 + 0xb]
	.word	0xc368a08e	! t0_kref+0x4438:   	prefetch	%g2 + 0x8e, 1
	.word	0x989a6e9a	! t0_kref+0x443c:   	xorcc	%o1, 0xe9a, %o4
	.word	0xaabe801c	! t0_kref+0x4440:   	xnorcc	%i2, %i4, %l5
	.word	0xb1a00039	! t0_kref+0x4444:   	fmovs	%f25, %f24
	.word	0xae624000	! t0_kref+0x4448:   	subc	%o1, %g0, %l7
	.word	0x81d83bee	! t0_kref+0x444c:   	flush	%g0 - 0x412
	.word	0x8143e035	! t0_kref+0x4450:   	membar	0x35
	.word	0xa1a01937	! t0_kref+0x4454:   	fstod	%f23, %f16
	.word	0xd400a020	! t0_kref+0x4458:   	ld	[%g2 + 0x20], %o2
	.word	0xee40a000	! t0_kref+0x445c:   	ldsw	[%g2], %l7
	.word	0xec380019	! t0_kref+0x4460:   	std	%l6, [%g0 + %i1]
	.word	0x96ab32a6	! t0_kref+0x4464:   	andncc	%o4, -0xd5a, %o3
	.word	0xa9b6c029	! t0_kref+0x4468:   	edge8n	%i3, %o1, %l4
	.word	0x92bf67aa	! t0_kref+0x446c:   	xnorcc	%i5, 0x7aa, %o1
	.word	0xf4280019	! t0_kref+0x4470:   	stb	%i2, [%g0 + %i1]
	.word	0xac22800d	! t0_kref+0x4474:   	sub	%o2, %o5, %l6
	.word	0xa9b3403b	! t0_kref+0x4478:   	edge8n	%o5, %i3, %l4
	.word	0xae66ec8c	! t0_kref+0x447c:   	subc	%i3, 0xc8c, %l7
	.word	0xbba6c9ad	! t0_kref+0x4480:   	fdivs	%f27, %f13, %f29
	.word	0xa1a00550	! t0_kref+0x4484:   	fsqrtd	%f16, %f16
	.word	0xb5a0054c	! t0_kref+0x4488:   	fsqrtd	%f12, %f26
	.word	0xb5b30d1a	! t0_kref+0x448c:   	fandnot1	%f12, %f26, %f26
	.word	0xa1a01932	! t0_kref+0x4490:   	fstod	%f18, %f16
	.word	0x940f401b	! t0_kref+0x4494:   	and	%i5, %i3, %o2
	.word	0x8143c000	! t0_kref+0x4498:   	stbar
	.word	0xb9a708d4	! t0_kref+0x449c:   	fsubd	%f28, %f20, %f28
	.word	0x99a01114	! t0_kref+0x44a0:   	fxtod	%f20, %f12
	.word	0x95b4067a	! t0_kref+0x44a4:   	fmul8x16au	%f16, %f26, %f10
	.word	0xec100018	! t0_kref+0x44a8:   	lduh	[%g0 + %i0], %l6
	.word	0x81ac8a5c	! t0_kref+0x44ac:   	fcmpd	%fcc0, %f18, %f28
	.word	0x9da00532	! t0_kref+0x44b0:   	fsqrts	%f18, %f14
	.word	0x36480002	! t0_kref+0x44b4:   	bge,a,pt	%icc, _kref+0x44bc
	.word	0xdd1fbc00	! t0_kref+0x44b8:   	ldd	[%fp - 0x400], %f14
	.word	0xd8ce5000	! t0_kref+0x44bc:   	ldsba	[%i1]0x80, %o4
	.word	0xae46bcb1	! t0_kref+0x44c0:   	addc	%i2, -0x34f, %l7
	.word	0xe99f5018	! t0_kref+0x44c4:   	ldda	[%i5 + %i0]0x80, %f20
	.word	0x9686e82b	! t0_kref+0x44c8:   	addcc	%i3, 0x82b, %o3
	.word	0xa3a000bc	! t0_kref+0x44cc:   	fnegs	%f28, %f17
	.word	0xd2df5019	! t0_kref+0x44d0:   	ldxa	[%i5 + %i1]0x80, %o1
	.word	0xada01918	! t0_kref+0x44d4:   	fitod	%f24, %f22
	.word	0x99408000	! t0_kref+0x44d8:   	mov	%ccr, %o4
	.word	0xe40864b4	! t0_kref+0x44dc:   	ldub	[%g1 + 0x4b4], %l2
	.word	0xa41ca00c	! t0_kref+0x44e0:   	xor	%l2, 0xc, %l2
	.word	0xe42864b4	! t0_kref+0x44e4:   	stb	%l2, [%g1 + 0x4b4]
	.word	0x81d864b4	! t0_kref+0x44e8:   	flush	%g1 + 0x4b4
	.word	0xb9a0190e	! t0_kref+0x44ec:   	fitod	%f14, %f28
	.word	0xaba000bc	! t0_kref+0x44f0:   	fnegs	%f28, %f21
	.word	0xab400000	! t0_kref+0x44f4:   	mov	%y, %l5
	.word	0x27480003	! t0_kref+0x44f8:   	fbul,a,pt	%fcc0, _kref+0x4504
	.word	0xada01931	! t0_kref+0x44fc:   	fstod	%f17, %f22
	.word	0xa9a709d8	! t0_kref+0x4500:   	fdivd	%f28, %f24, %f20
	.word	0x9fa01a54	! t0_kref+0x4504:   	fdtoi	%f20, %f15
	.word	0xda100018	! t0_kref+0x4508:   	lduh	[%g0 + %i0], %o5
	.word	0xe7e6101b	! t0_kref+0x450c:   	casa	[%i0]0x80, %i3, %l3
	.word	0x93b30412	! t0_kref+0x4510:   	fcmple16	%f12, %f18, %o1
	.word	0xa1b007b8	! t0_kref+0x4514:   	fpackfix	%f24, %f16
	.word	0xd2865000	! t0_kref+0x4518:   	lda	[%i1]0x80, %o1
	.word	0xa5a00054	! t0_kref+0x451c:   	fmovd	%f20, %f18
2:	.word	0x9db00f0a	! t0_kref+0x4520:   	fsrc2	%f10, %f14
	.word	0xdd20a038	! t0_kref+0x4524:   	st	%f14, [%g2 + 0x38]
	.word	0x9da30956	! t0_kref+0x4528:   	fmuld	%f12, %f22, %f14
	.word	0xac574000	! t0_kref+0x452c:   	umul	%i5, %g0, %l6
	.word	0x95a0055a	! t0_kref+0x4530:   	fsqrtd	%f26, %f10
	.word	0x9083400c	! t0_kref+0x4534:   	addcc	%o5, %o4, %o0
	.word	0x929af9d7	! t0_kref+0x4538:   	xorcc	%o3, -0x629, %o1
	.word	0xd8260000	! t0_kref+0x453c:   	st	%o4, [%i0]
	.word	0xfb6e3ff8	! t0_kref+0x4540:   	prefetch	%i0 - 8, 29
	.word	0xbba3882b	! t0_kref+0x4544:   	fadds	%f14, %f11, %f29
	.word	0xd2b6101b	! t0_kref+0x4548:   	stha	%o1, [%i0 + %i3]0x80
	.word	0x945a401b	! t0_kref+0x454c:   	smul	%o1, %i3, %o2
	.word	0xae92801b	! t0_kref+0x4550:   	orcc	%o2, %i3, %l7
	.word	0xb9a5895c	! t0_kref+0x4554:   	fmuld	%f22, %f28, %f28
	.word	0x9361c01c	! t0_kref+0x4558:   	movu	%fcc0, %i4, %o1
	.word	0xee08a033	! t0_kref+0x455c:   	ldub	[%g2 + 0x33], %l7
	.word	0xe8c81019	! t0_kref+0x4560:   	ldsba	[%g0 + %i1]0x80, %l4
	.word	0x9fc00004	! t0_kref+0x4564:   	call	%g0 + %g4
	.word	0xafa00134	! t0_kref+0x4568:   	fabss	%f20, %f23
	.word	0xeb68a082	! t0_kref+0x456c:   	prefetch	%g2 + 0x82, 21
	.word	0xb9a4085a	! t0_kref+0x4570:   	faddd	%f16, %f26, %f28
	.word	0xac3eb5d2	! t0_kref+0x4574:   	xnor	%i2, -0xa2e, %l6
	.word	0xea48a03b	! t0_kref+0x4578:   	ldsb	[%g2 + 0x3b], %l5
	.word	0x92c2c00a	! t0_kref+0x457c:   	addccc	%o3, %o2, %o1
	.word	0x81db800c	! t0_kref+0x4580:   	flush	%sp + %o4
	.word	0xd606200c	! t0_kref+0x4584:   	ld	[%i0 + 0xc], %o3
	.word	0x9a0ac01b	! t0_kref+0x4588:   	and	%o3, %i3, %o5
	.word	0xe408653c	! t0_kref+0x458c:   	ldub	[%g1 + 0x53c], %l2
	.word	0xa41ca00c	! t0_kref+0x4590:   	xor	%l2, 0xc, %l2
	.word	0xe428653c	! t0_kref+0x4594:   	stb	%l2, [%g1 + 0x53c]
	.word	0x81d8653c	! t0_kref+0x4598:   	flush	%g1 + 0x53c
	.word	0xaba0053b	! t0_kref+0x459c:   	fsqrts	%f27, %f21
	.word	0xe5ee501b	! t0_kref+0x45a0:   	prefetcha	%i1 + %i3, 18
	.word	0x2a800007	! t0_kref+0x45a4:   	bcs,a	_kref+0x45c0
2:	.word	0x99b70e80	! t0_kref+0x45a8:   	fsrc1	%f28, %f12
	.word	0xf7063fe4	! t0_kref+0x45ac:   	ld	[%i0 - 0x1c], %f27
	.word	0x9a000009	! t0_kref+0x45b0:   	add	%g0, %o1, %o5
	.word	0x8143c000	! t0_kref+0x45b4:   	stbar
	.word	0x97a000bd	! t0_kref+0x45b8:   	fnegs	%f29, %f11
	.word	0xe89e101d	! t0_kref+0x45bc:   	ldda	[%i0 + %i5]0x80, %l4
	.word	0xaea2c01c	! t0_kref+0x45c0:   	subcc	%o3, %i4, %l7
	.word	0xd84e6000	! t0_kref+0x45c4:   	ldsb	[%i1], %o4
	.word	0x2d480007	! t0_kref+0x45c8:   	fbg,a,pt	%fcc0, _kref+0x45e4
	.word	0xa937400b	! t0_kref+0x45cc:   	srl	%i5, %o3, %l4
	.word	0xa80ebb4e	! t0_kref+0x45d0:   	and	%i2, -0x4b2, %l4
	.word	0xb9b30e75	! t0_kref+0x45d4:   	fxnors	%f12, %f21, %f28
	.word	0x9932a012	! t0_kref+0x45d8:   	srl	%o2, 0x12, %o4
	.word	0xb5a688ba	! t0_kref+0x45dc:   	fsubs	%f26, %f26, %f26
	.word	0x31480002	! t0_kref+0x45e0:   	fba,a,pt	%fcc0, _kref+0x45e8
	.word	0xf7a61000	! t0_kref+0x45e4:   	sta	%f27, [%i0]0x80
	.word	0x9db00ceb	! t0_kref+0x45e8:   	fnot2s	%f11, %f14
	.word	0xf51fbd50	! t0_kref+0x45ec:   	ldd	[%fp - 0x2b0], %f26
	.word	0xe40865cc	! t0_kref+0x45f0:   	ldub	[%g1 + 0x5cc], %l2
	.word	0xa41ca00c	! t0_kref+0x45f4:   	xor	%l2, 0xc, %l2
	.word	0xe42865cc	! t0_kref+0x45f8:   	stb	%l2, [%g1 + 0x5cc]
	.word	0x81d865cc	! t0_kref+0x45fc:   	flush	%g1 + 0x5cc
	.word	0xee062000	! t0_kref+0x4600:   	ld	[%i0], %l7
	.word	0xd68e501a	! t0_kref+0x4604:   	lduba	[%i1 + %i2]0x80, %o3
	.word	0xb5a00552	! t0_kref+0x4608:   	fsqrtd	%f18, %f26
	.word	0xd88e501a	! t0_kref+0x460c:   	lduba	[%i1 + %i2]0x80, %o4
	.word	0x81d87625	! t0_kref+0x4610:   	flush	%g1 - 0x9db
	.word	0x9bb68129	! t0_kref+0x4614:   	edge32n	%i2, %o1, %o5
	.word	0x9bb6c020	! t0_kref+0x4618:   	edge8n	%i3, %g0, %o5
	.word	0xaa502ffd	! t0_kref+0x461c:   	umul	%g0, 0xffd, %l5
	.word	0x94234000	! t0_kref+0x4620:   	sub	%o5, %g0, %o2
	.word	0xd416c019	! t0_kref+0x4624:   	lduh	[%i3 + %i1], %o2
	.word	0xc02e2018	! t0_kref+0x4628:   	clrb	[%i0 + 0x18]
	.word	0x39480004	! t0_kref+0x462c:   	fbuge,a,pt	%fcc0, _kref+0x463c
	.word	0xaa63001d	! t0_kref+0x4630:   	subc	%o4, %i5, %l5
	.word	0x96880000	! t0_kref+0x4634:   	andcc	%g0, %g0, %o3
2:	.word	0xd41e4000	! t0_kref+0x4638:   	ldd	[%i1], %o2
	.word	0xa5a0055c	! t0_kref+0x463c:   	fsqrtd	%f28, %f18
	.word	0xae7ec01a	! t0_kref+0x4640:   	sdiv	%i3, %i2, %l7
	.word	0xd416001b	! t0_kref+0x4644:   	lduh	[%i0 + %i3], %o2
	.word	0xed063fec	! t0_kref+0x4648:   	ld	[%i0 - 0x14], %f22
	.word	0xe1062014	! t0_kref+0x464c:   	ld	[%i0 + 0x14], %f16
	.word	0x9a22800c	! t0_kref+0x4650:   	sub	%o2, %o4, %o5
	.word	0x926024d3	! t0_kref+0x4654:   	subc	%g0, 0x4d3, %o1
	.word	0x9a0b298e	! t0_kref+0x4658:   	and	%o4, 0x98e, %o5
	.word	0xe1063fec	! t0_kref+0x465c:   	ld	[%i0 - 0x14], %f16
	.word	0x90ba7ed3	! t0_kref+0x4660:   	xnorcc	%o1, -0x12d, %o0
	.word	0xec380019	! t0_kref+0x4664:   	std	%l6, [%g0 + %i1]
	.word	0xb5a01a38	! t0_kref+0x4668:   	fstoi	%f24, %f26
	.word	0xc030a032	! t0_kref+0x466c:   	clrh	[%g2 + 0x32]
	.word	0xaba0012f	! t0_kref+0x4670:   	fabss	%f15, %f21
	.word	0x949b3b67	! t0_kref+0x4674:   	xorcc	%o4, -0x499, %o2
	.word	0x970b769a	! t0_kref+0x4678:   	tsubcc	%o5, -0x966, %o3
	.word	0xe8ce105a	! t0_kref+0x467c:   	ldsba	[%i0 + %i2]0x82, %l4
	.word	0x27480004	! t0_kref+0x4680:   	fbul,a,pt	%fcc0, _kref+0x4690
	.word	0x9a233530	! t0_kref+0x4684:   	sub	%o4, -0xad0, %o5
	.word	0x99b30d40	! t0_kref+0x4688:   	fnot1	%f12, %f12
	.word	0x9adaae0f	! t0_kref+0x468c:   	smulcc	%o2, 0xe0f, %o5
	.word	0xf5000019	! t0_kref+0x4690:   	ld	[%g0 + %i1], %f26
	.word	0x81834000	! t0_kref+0x4694:   	wr	%o5, %g0, %y
	.word	0xd24e401a	! t0_kref+0x4698:   	ldsb	[%i1 + %i2], %o1
	.word	0x24800003	! t0_kref+0x469c:   	ble,a	_kref+0x46a8
	.word	0xa9a01914	! t0_kref+0x46a0:   	fitod	%f20, %f20
	.word	0xa3a01a50	! t0_kref+0x46a4:   	fdtoi	%f16, %f17
	.word	0xb1a01a5c	! t0_kref+0x46a8:   	fdtoi	%f28, %f24
	call	SYM(t0_subr3)
	.word	0xec160000	! t0_kref+0x46b0:   	lduh	[%i0], %l6
	.word	0x99a0192b	! t0_kref+0x46b4:   	fstod	%f11, %f12
	.word	0xda2e001a	! t0_kref+0x46b8:   	stb	%o5, [%i0 + %i2]
	.word	0x26800008	! t0_kref+0x46bc:   	bl,a	_kref+0x46dc
	.word	0xac92800b	! t0_kref+0x46c0:   	orcc	%o2, %o3, %l6
	.word	0x81dec01b	! t0_kref+0x46c4:   	flush	%i3 + %i3
	.word	0xaa234000	! t0_kref+0x46c8:   	sub	%o5, %g0, %l5
	.word	0xa7a6493c	! t0_kref+0x46cc:   	fmuls	%f25, %f28, %f19
	.word	0xaaba6843	! t0_kref+0x46d0:   	xnorcc	%o1, 0x843, %l5
	.word	0xf628a033	! t0_kref+0x46d4:   	stb	%i3, [%g2 + 0x33]
	.word	0x9a36acbe	! t0_kref+0x46d8:   	orn	%i2, 0xcbe, %o5
	.word	0xd8067ff8	! t0_kref+0x46dc:   	ld	[%i1 - 8], %o4
	.word	0x86102001	! t0_kref+0x46e0:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x46e4:   	bne,a	_kref+0x46e4
	.word	0x86a0e001	! t0_kref+0x46e8:   	subcc	%g3, 1, %g3
	.word	0xa7a5c9b7	! t0_kref+0x46ec:   	fdivs	%f23, %f23, %f19
	.word	0xb1a488ca	! t0_kref+0x46f0:   	fsubd	%f18, %f10, %f24
	.word	0xe76e2010	! t0_kref+0x46f4:   	prefetch	%i0 + 0x10, 19
	.word	0x920eafa2	! t0_kref+0x46f8:   	and	%i2, 0xfa2, %o1
	.word	0x9732800b	! t0_kref+0x46fc:   	srl	%o2, %o3, %o3
	.word	0x99b28a94	! t0_kref+0x4700:   	fpsub16	%f10, %f20, %f12
	.word	0xadb50a8a	! t0_kref+0x4704:   	fpsub16	%f20, %f10, %f22
	.word	0xb9a6c9af	! t0_kref+0x4708:   	fdivs	%f27, %f15, %f28
	.word	0xafa01a30	! t0_kref+0x470c:   	fstoi	%f16, %f23
	.word	0xa5b60ad6	! t0_kref+0x4710:   	fpsub32	%f24, %f22, %f18
	.word	0xaaa2b78f	! t0_kref+0x4714:   	subcc	%o2, -0x871, %l5
	.word	0x27480006	! t0_kref+0x4718:   	fbul,a,pt	%fcc0, _kref+0x4730
	.word	0xb9a3cd3d	! t0_kref+0x471c:   	fsmuld	%f15, %f29, %f28
	.word	0x95a0191b	! t0_kref+0x4720:   	fitod	%f27, %f10
	.word	0xa5a018d0	! t0_kref+0x4724:   	fdtos	%f16, %f18
	.word	0xa5a5884c	! t0_kref+0x4728:   	faddd	%f22, %f12, %f18
	.word	0xd9f6100a	! t0_kref+0x472c:   	casxa	[%i0]0x80, %o2, %o4
	.word	0xb3a01a35	! t0_kref+0x4730:   	fstoi	%f21, %f25
	.word	0xa1a3094e	! t0_kref+0x4734:   	fmuld	%f12, %f14, %f16
	.word	0xf636200e	! t0_kref+0x4738:   	sth	%i3, [%i0 + 0xe]
	.word	0xa5b3ca2b	! t0_kref+0x473c:   	fpadd16s	%f15, %f11, %f18
	.word	0xf5ee101b	! t0_kref+0x4740:   	prefetcha	%i0 + %i3, 26
	.word	0xda30a032	! t0_kref+0x4744:   	sth	%o5, [%g2 + 0x32]
	.word	0xb7a3083b	! t0_kref+0x4748:   	fadds	%f12, %f27, %f27
	.word	0x8143c000	! t0_kref+0x474c:   	stbar
	.word	0xa9b700dc	! t0_kref+0x4750:   	edge16l	%i4, %i4, %l4
	.word	0xda060000	! t0_kref+0x4754:   	ld	[%i0], %o5
	.word	0x8143e040	! t0_kref+0x4758:   	membar	0x40
	.word	0xd826200c	! t0_kref+0x475c:   	st	%o4, [%i0 + 0xc]
	.word	0xe808a038	! t0_kref+0x4760:   	ldub	[%g2 + 0x38], %l4
	.word	0xe100a020	! t0_kref+0x4764:   	ld	[%g2 + 0x20], %f16
	.word	0xd8180018	! t0_kref+0x4768:   	ldd	[%g0 + %i0], %o4
	.word	0xa860347e	! t0_kref+0x476c:   	subc	%g0, -0xb82, %l4
	.word	0xaa072690	! t0_kref+0x4770:   	add	%i4, 0x690, %l5
	.word	0xb9b00f1a	! t0_kref+0x4774:   	fsrc2	%f26, %f28
	.word	0xafb00ceb	! t0_kref+0x4778:   	fnot2s	%f11, %f23
	.word	0x97b685d0	! t0_kref+0x477c:   	fcmpeq32	%f26, %f16, %o3
	.word	0xa7a01a52	! t0_kref+0x4780:   	fdtoi	%f18, %f19
	.word	0xb9b00f16	! t0_kref+0x4784:   	fsrc2	%f22, %f28
	.word	0xaa7ec01a	! t0_kref+0x4788:   	sdiv	%i3, %i2, %l5
	.word	0xe51fbfc0	! t0_kref+0x478c:   	ldd	[%fp - 0x40], %f18
	.word	0xfa28a01a	! t0_kref+0x4790:   	stb	%i5, [%g2 + 0x1a]
	.word	0x97a0052f	! t0_kref+0x4794:   	fsqrts	%f15, %f11
	.word	0xaac2800c	! t0_kref+0x4798:   	addccc	%o2, %o4, %l5
	.word	0xe81e4000	! t0_kref+0x479c:   	ldd	[%i1], %l4
	.word	0xaa67400b	! t0_kref+0x47a0:   	subc	%i5, %o3, %l5
	.word	0xd608a00b	! t0_kref+0x47a4:   	ldub	[%g2 + 0xb], %o3
	.word	0xb5a0053b	! t0_kref+0x47a8:   	fsqrts	%f27, %f26
	.word	0x96a7400a	! t0_kref+0x47ac:   	subcc	%i5, %o2, %o3
	.word	0x9144c000	! t0_kref+0x47b0:   	mov	%gsr, %o0
	.word	0xd840a008	! t0_kref+0x47b4:   	ldsw	[%g2 + 8], %o4
	.word	0x35800001	! t0_kref+0x47b8:   	fbue,a	_kref+0x47bc
	.word	0xd60e2012	! t0_kref+0x47bc:   	ldub	[%i0 + 0x12], %o3
	.word	0x933f2009	! t0_kref+0x47c0:   	sra	%i4, 0x9, %o1
	.word	0xaa9a6614	! t0_kref+0x47c4:   	xorcc	%o1, 0x614, %l5
	.word	0xbbb00c20	! t0_kref+0x47c8:   	fzeros	%f29
	.word	0xf426001c	! t0_kref+0x47cc:   	st	%i2, [%i0 + %i4]
	.word	0xada00552	! t0_kref+0x47d0:   	fsqrtd	%f18, %f22
	.word	0xee567ffc	! t0_kref+0x47d4:   	ldsh	[%i1 - 4], %l7
	.word	0xd6871019	! t0_kref+0x47d8:   	lda	[%i4 + %i1]0x80, %o3
	.word	0xb9a6895a	! t0_kref+0x47dc:   	fmuld	%f26, %f26, %f28
	.word	0x93b2411a	! t0_kref+0x47e0:   	edge32	%o1, %i2, %o1
	.word	0xbba449b1	! t0_kref+0x47e4:   	fdivs	%f17, %f17, %f29
	.word	0x905a8009	! t0_kref+0x47e8:   	smul	%o2, %o1, %o0
	.word	0xa8a7000c	! t0_kref+0x47ec:   	subcc	%i4, %o4, %l4
	.word	0x8143e040	! t0_kref+0x47f0:   	membar	0x40
	.word	0x9a882c30	! t0_kref+0x47f4:   	andcc	%g0, 0xc30, %o5
	.word	0x81ad0a56	! t0_kref+0x47f8:   	fcmpd	%fcc0, %f20, %f22
	.word	0xa9b70630	! t0_kref+0x47fc:   	fmul8x16	%f28, %f16, %f20
	.word	0xa93a6015	! t0_kref+0x4800:   	sra	%o1, 0x15, %l4
	.word	0xadb740da	! t0_kref+0x4804:   	edge16l	%i5, %i2, %l6
	.word	0xabb70240	! t0_kref+0x4808:   	array16	%i4, %g0, %l5
	.word	0x27480007	! t0_kref+0x480c:   	fbul,a,pt	%fcc0, _kref+0x4828
	.word	0xa5b007b6	! t0_kref+0x4810:   	fpackfix	%f22, %f18
	.word	0xaa9afcec	! t0_kref+0x4814:   	xorcc	%o3, -0x314, %l5
	.word	0x90580000	! t0_kref+0x4818:   	smul	%g0, %g0, %o0
	.word	0xa9b74240	! t0_kref+0x481c:   	array16	%i5, %g0, %l4
	.word	0xada0192b	! t0_kref+0x4820:   	fstod	%f11, %f22
	.word	0x81ad8a52	! t0_kref+0x4824:   	fcmpd	%fcc0, %f22, %f18
	.word	0xf16e401b	! t0_kref+0x4828:   	prefetch	%i1 + %i3, 24
	.word	0x81af0ad4	! t0_kref+0x482c:   	fcmped	%fcc0, %f28, %f20
	.word	0x949ee27f	! t0_kref+0x4830:   	xorcc	%i3, 0x27f, %o2
	.word	0x9b65c01d	! t0_kref+0x4834:   	movvs	%icc, %i5, %o5
	.word	0xd430a012	! t0_kref+0x4838:   	sth	%o2, [%g2 + 0x12]
	.word	0x9b408000	! t0_kref+0x483c:   	mov	%ccr, %o5
	.word	0x9a370000	! t0_kref+0x4840:   	orn	%i4, %g0, %o5
	.word	0x9fc10000	! t0_kref+0x4844:   	call	%g4
	.word	0x8143c000	! t0_kref+0x4848:   	stbar
	.word	0xaaa6c00d	! t0_kref+0x484c:   	subcc	%i3, %o5, %l5
	.word	0xd630a022	! t0_kref+0x4850:   	sth	%o3, [%g2 + 0x22]
	.word	0xac56801b	! t0_kref+0x4854:   	umul	%i2, %i3, %l6
	.word	0x28800002	! t0_kref+0x4858:   	bleu,a	_kref+0x4860
	.word	0x9266b046	! t0_kref+0x485c:   	subc	%i2, -0xfba, %o1
	.word	0xe83f4019	! t0_kref+0x4860:   	std	%l4, [%i5 + %i1]
	.word	0xa9a000bd	! t0_kref+0x4864:   	fnegs	%f29, %f20
	.word	0x982a801b	! t0_kref+0x4868:   	andn	%o2, %i3, %o4
	.word	0xd400a018	! t0_kref+0x486c:   	ld	[%g2 + 0x18], %o2
	.word	0x9de3bfa0	! t0_kref+0x4870:   	save	%sp, -0x60, %sp
	.word	0xabee801b	! t0_kref+0x4874:   	restore	%i2, %i3, %l5
	.word	0x86102004	! t0_kref+0x4878:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x487c:   	bne,a	_kref+0x487c
	.word	0x86a0e001	! t0_kref+0x4880:   	subcc	%g3, 1, %g3
	.word	0xeb00a018	! t0_kref+0x4884:   	ld	[%g2 + 0x18], %f21
	.word	0xd24e401a	! t0_kref+0x4888:   	ldsb	[%i1 + %i2], %o1
	.word	0xf8362000	! t0_kref+0x488c:   	sth	%i4, [%i0]
	.word	0x81ac8a5c	! t0_kref+0x4890:   	fcmpd	%fcc0, %f18, %f28
	.word	0x9437312d	! t0_kref+0x4894:   	orn	%i4, -0xed3, %o2
	.word	0x9fc10000	! t0_kref+0x4898:   	call	%g4
	.word	0xaae2a067	! t0_kref+0x489c:   	subccc	%o2, 0x67, %l5
	.word	0xab400000	! t0_kref+0x48a0:   	mov	%y, %l5
	.word	0xd628a002	! t0_kref+0x48a4:   	stb	%o3, [%g2 + 2]
	.word	0x30800008	! t0_kref+0x48a8:   	ba,a	_kref+0x48c8
	.word	0x9db70dda	! t0_kref+0x48ac:   	fnand	%f28, %f26, %f14
	.word	0xa1b00778	! t0_kref+0x48b0:   	fpack16	%f24, %f16
	.word	0x9fc10000	! t0_kref+0x48b4:   	call	%g4
	.word	0xa85a800c	! t0_kref+0x48b8:   	smul	%o2, %o4, %l4
	.word	0xa1b58df7	! t0_kref+0x48bc:   	fnands	%f22, %f23, %f16
	.word	0xa87a7615	! t0_kref+0x48c0:   	sdiv	%o1, -0x9eb, %l4
	.word	0x38480002	! t0_kref+0x48c4:   	bgu,a,pt	%icc, _kref+0x48cc
	.word	0x932ea01a	! t0_kref+0x48c8:   	sll	%i2, 0x1a, %o1
	.word	0xabb34280	! t0_kref+0x48cc:   	array32	%o5, %g0, %l5
	.word	0xf830a018	! t0_kref+0x48d0:   	sth	%i4, [%g2 + 0x18]
	.word	0xaf44c000	! t0_kref+0x48d4:   	mov	%gsr, %l7
	.word	0x9b44c000	! t0_kref+0x48d8:   	mov	%gsr, %o5
	.word	0x92c3340b	! t0_kref+0x48dc:   	addccc	%o4, -0xbf5, %o1
	.word	0xafa00039	! t0_kref+0x48e0:   	fmovs	%f25, %f23
	.word	0xea680019	! t0_kref+0x48e4:   	ldstub	[%g0 + %i1], %l5
	.word	0x36800001	! t0_kref+0x48e8:   	bge,a	_kref+0x48ec
	.word	0xc7ee5000	! t0_kref+0x48ec:   	prefetcha	%i1, 3
	.word	0xafa0012d	! t0_kref+0x48f0:   	fabss	%f13, %f23
	.word	0xa1a588d8	! t0_kref+0x48f4:   	fsubd	%f22, %f24, %f16
	.word	0xe5067fec	! t0_kref+0x48f8:   	ld	[%i1 - 0x14], %f18
	.word	0x94e33935	! t0_kref+0x48fc:   	subccc	%o4, -0x6cb, %o2
	.word	0x9fc10000	! t0_kref+0x4900:   	call	%g4
	.word	0xd000a030	! t0_kref+0x4904:   	ld	[%g2 + 0x30], %o0
	.word	0xd828a018	! t0_kref+0x4908:   	stb	%o4, [%g2 + 0x18]
	.word	0x949aff23	! t0_kref+0x490c:   	xorcc	%o3, -0xdd, %o2
	.word	0x94a029ba	! t0_kref+0x4910:   	subcc	%g0, 0x9ba, %o2
	.word	0x2f480006	! t0_kref+0x4914:   	fbu,a,pt	%fcc0, _kref+0x492c
	.word	0x8d803564	! t0_kref+0x4918:   	mov	0xfffff564, %fprs
	.word	0xdd1e6008	! t0_kref+0x491c:   	ldd	[%i1 + 8], %f14
	.word	0xba103ff8	! t0_kref+0x4920:   	mov	0xfffffff8, %i5
	.word	0x33480002	! t0_kref+0x4924:   	fbe,a,pt	%fcc0, _kref+0x492c
	.word	0x99a01936	! t0_kref+0x4928:   	fstod	%f22, %f12
	.word	0x81af0a54	! t0_kref+0x492c:   	fcmpd	%fcc0, %f28, %f20
	.word	0x933ea004	! t0_kref+0x4930:   	sra	%i2, 0x4, %o1
	.word	0xda200019	! t0_kref+0x4934:   	st	%o5, [%g0 + %i1]
	.word	0xa9a01058	! t0_kref+0x4938:   	fdtox	%f24, %f20
	.word	0xb5a70956	! t0_kref+0x493c:   	fmuld	%f28, %f22, %f26
	.word	0xac22800a	! t0_kref+0x4940:   	sub	%o2, %o2, %l6
	.word	0xb5a01935	! t0_kref+0x4944:   	fstod	%f21, %f26
	.word	0xf300a028	! t0_kref+0x4948:   	ld	[%g2 + 0x28], %f25
	.word	0x94ab000c	! t0_kref+0x494c:   	andncc	%o4, %o4, %o2
	.word	0xaa3e800d	! t0_kref+0x4950:   	xnor	%i2, %o5, %l5
	.word	0xa7b60d35	! t0_kref+0x4954:   	fandnot1s	%f24, %f21, %f19
	.word	0xf628a023	! t0_kref+0x4958:   	stb	%i3, [%g2 + 0x23]
	.word	0xd62e401a	! t0_kref+0x495c:   	stb	%o3, [%i1 + %i2]
	.word	0xda280018	! t0_kref+0x4960:   	stb	%o5, [%g0 + %i0]
	.word	0xc96e3fe0	! t0_kref+0x4964:   	prefetch	%i0 - 0x20, 4
	.word	0xf5ee101a	! t0_kref+0x4968:   	prefetcha	%i0 + %i2, 26
	.word	0x86102006	! t0_kref+0x496c:   	mov	0x6, %g3
	.word	0x86a0e001	! t0_kref+0x4970:   	subcc	%g3, 1, %g3
	.word	0x22800008	! t0_kref+0x4974:   	be,a	_kref+0x4994
	.word	0xdf801019	! t0_kref+0x4978:   	lda	[%g0 + %i1]0x80, %f15
	.word	0x3d480008	! t0_kref+0x497c:   	fbule,a,pt	%fcc0, _kref+0x499c
	.word	0x980abb6f	! t0_kref+0x4980:   	and	%o2, -0x491, %o4
	.word	0xad3a801b	! t0_kref+0x4984:   	sra	%o2, %i3, %l6
	.word	0xa1a01050	! t0_kref+0x4988:   	fdtox	%f16, %f16
	.word	0x98c37f81	! t0_kref+0x498c:   	addccc	%o5, -0x7f, %o4
	.word	0xaeab400c	! t0_kref+0x4990:   	andncc	%o5, %o4, %l7
	.word	0xb3a018dc	! t0_kref+0x4994:   	fdtos	%f28, %f25
	.word	0x99b6c15b	! t0_kref+0x4998:   	edge32l	%i3, %i3, %o4
	.word	0x9400001b	! t0_kref+0x499c:   	add	%g0, %i3, %o2
	.word	0x81ae8a50	! t0_kref+0x49a0:   	fcmpd	%fcc0, %f26, %f16
	.word	0xec0e001a	! t0_kref+0x49a4:   	ldub	[%i0 + %i2], %l6
	.word	0x81874000	! t0_kref+0x49a8:   	wr	%i5, %g0, %y
	.word	0x878020d2	! t0_kref+0x49ac:   	mov	0xd2, %asi
	.word	0xe1063fe4	! t0_kref+0x49b0:   	ld	[%i0 - 0x1c], %f16
	.word	0x989f401c	! t0_kref+0x49b4:   	xorcc	%i5, %i4, %o4
	.word	0x9a33001c	! t0_kref+0x49b8:   	orn	%o4, %i4, %o5
	.word	0x8143c000	! t0_kref+0x49bc:   	stbar
	.word	0x9de3bfa0	! t0_kref+0x49c0:   	save	%sp, -0x60, %sp
	.word	0x804033a9	! t0_kref+0x49c4:   	addc	%g0, -0xc57, %g0
	.word	0xa9ef401d	! t0_kref+0x49c8:   	restore	%i5, %i5, %l4
	.word	0x99a0054e	! t0_kref+0x49cc:   	fsqrtd	%f14, %f12
	.word	0xec1f4019	! t0_kref+0x49d0:   	ldd	[%i5 + %i1], %l6
	.word	0x99b68e4a	! t0_kref+0x49d4:   	fxnor	%f26, %f10, %f12
	.word	0x81870000	! t0_kref+0x49d8:   	wr	%i4, %g0, %y
	.word	0xd49e1000	! t0_kref+0x49dc:   	ldda	[%i0]0x80, %o2
	.word	0x99a3093d	! t0_kref+0x49e0:   	fmuls	%f12, %f29, %f12
	.word	0xd8ce9018	! t0_kref+0x49e4:   	ldsba	[%i2 + %i0]0x80, %o4
	.word	0xb9b44a35	! t0_kref+0x49e8:   	fpadd16s	%f17, %f21, %f28
	.word	0xe40869a4	! t0_kref+0x49ec:   	ldub	[%g1 + 0x9a4], %l2
	.word	0xa41ca00c	! t0_kref+0x49f0:   	xor	%l2, 0xc, %l2
	.word	0xe42869a4	! t0_kref+0x49f4:   	stb	%l2, [%g1 + 0x9a4]
	.word	0x81d869a4	! t0_kref+0x49f8:   	flush	%g1 + 0x9a4
	.word	0x9da4c8af	! t0_kref+0x49fc:   	fsubs	%f19, %f15, %f14
	.word	0x9bb0011d	! t0_kref+0x4a00:   	edge32	%g0, %i5, %o5
	.word	0x8d82400c	! t0_kref+0x4a04:   	wr	%o1, %o4, %fprs
	.word	0x9aa30009	! t0_kref+0x4a08:   	subcc	%o4, %o1, %o5
	.word	0xd82e001a	! t0_kref+0x4a0c:   	stb	%o4, [%i0 + %i2]
2:	.word	0xee50a038	! t0_kref+0x4a10:   	ldsh	[%g2 + 0x38], %l7
	.word	0xaa2a400b	! t0_kref+0x4a14:   	andn	%o1, %o3, %l5
	.word	0xa9a01a50	! t0_kref+0x4a18:   	fdtoi	%f16, %f20
	.word	0x96bf7e6b	! t0_kref+0x4a1c:   	xnorcc	%i5, -0x195, %o3
	.word	0xac3b401b	! t0_kref+0x4a20:   	xnor	%o5, %i3, %l6
	.word	0xd448a02a	! t0_kref+0x4a24:   	ldsb	[%g2 + 0x2a], %o2
	.word	0x98782908	! t0_kref+0x4a28:   	sdiv	%g0, 0x908, %o4
	.word	0xd808a010	! t0_kref+0x4a2c:   	ldub	[%g2 + 0x10], %o4
	.word	0xd208a03a	! t0_kref+0x4a30:   	ldub	[%g2 + 0x3a], %o1
	.word	0x9bb40598	! t0_kref+0x4a34:   	fcmpgt32	%f16, %f24, %o5
	.word	0xe9ee101b	! t0_kref+0x4a38:   	prefetcha	%i0 + %i3, 20
	.word	0xd4364000	! t0_kref+0x4a3c:   	sth	%o2, [%i1]
	.word	0xda801018	! t0_kref+0x4a40:   	lda	[%g0 + %i0]0x80, %o5
	.word	0x9fc00004	! t0_kref+0x4a44:   	call	%g0 + %g4
	.word	0xc0267fe0	! t0_kref+0x4a48:   	clr	[%i1 - 0x20]
	.word	0x99a0054c	! t0_kref+0x4a4c:   	fsqrtd	%f12, %f12
	.word	0xec066014	! t0_kref+0x4a50:   	ld	[%i1 + 0x14], %l6
	.word	0xed6e7ff8	! t0_kref+0x4a54:   	prefetch	%i1 - 8, 22
	.word	0xb7a30937	! t0_kref+0x4a58:   	fmuls	%f12, %f23, %f27
	.word	0x97400000	! t0_kref+0x4a5c:   	mov	%y, %o3
	.word	0xb610200a	! t0_kref+0x4a60:   	mov	0xa, %i3
	.word	0x9da6094a	! t0_kref+0x4a64:   	fmuld	%f24, %f10, %f14
	.word	0xe96e401d	! t0_kref+0x4a68:   	prefetch	%i1 + %i5, 20
	.word	0x9fc00004	! t0_kref+0x4a6c:   	call	%g0 + %g4
	.word	0xada01917	! t0_kref+0x4a70:   	fitod	%f23, %f22
	.word	0x31480003	! t0_kref+0x4a74:   	fba,a,pt	%fcc0, _kref+0x4a80
	.word	0xb9a01913	! t0_kref+0x4a78:   	fitod	%f19, %f28
	.word	0xed68a0ce	! t0_kref+0x4a7c:   	prefetch	%g2 + 0xce, 22
	.word	0x920b35a3	! t0_kref+0x4a80:   	and	%o4, -0xa5d, %o1
	.word	0xada000ba	! t0_kref+0x4a84:   	fnegs	%f26, %f22
	.word	0x95b50c8e	! t0_kref+0x4a88:   	fandnot2	%f20, %f14, %f10
	.word	0x9db48a92	! t0_kref+0x4a8c:   	fpsub16	%f18, %f18, %f14
	.word	0x25480006	! t0_kref+0x4a90:   	fblg,a,pt	%fcc0, _kref+0x4aa8
	.word	0x98da800c	! t0_kref+0x4a94:   	smulcc	%o2, %o4, %o4
	.word	0xa9b60756	! t0_kref+0x4a98:   	fpack32	%f24, %f22, %f20
	.word	0x21480006	! t0_kref+0x4a9c:   	fbn,a,pt	%fcc0, _kref+0x4ab4
	.word	0xa88e801a	! t0_kref+0x4aa0:   	andcc	%i2, %i2, %l4
	.word	0x9133201b	! t0_kref+0x4aa4:   	srl	%o4, 0x1b, %o0
	.word	0xdaf6101d	! t0_kref+0x4aa8:   	stxa	%o5, [%i0 + %i5]0x80
	.word	0xe36e001c	! t0_kref+0x4aac:   	prefetch	%i0 + %i4, 17
	.word	0xa9b5891a	! t0_kref+0x4ab0:   	faligndata	%f22, %f26, %f20
	.word	0xd01f4018	! t0_kref+0x4ab4:   	ldd	[%i5 + %i0], %o0
	.word	0xada0191d	! t0_kref+0x4ab8:   	fitod	%f29, %f22
	.word	0x81ac0ab2	! t0_kref+0x4abc:   	fcmpes	%fcc0, %f16, %f18
	.word	0xadb00770	! t0_kref+0x4ac0:   	fpack16	%f16, %f22
	.word	0x86102001	! t0_kref+0x4ac4:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x4ac8:   	bne,a	_kref+0x4ac8
	.word	0x86a0e001	! t0_kref+0x4acc:   	subcc	%g3, 1, %g3
	.word	0xd078a038	! t0_kref+0x4ad0:   	swap	[%g2 + 0x38], %o0
	.word	0xac333780	! t0_kref+0x4ad4:   	orn	%o4, -0x880, %l6
	.word	0x81ae4aaf	! t0_kref+0x4ad8:   	fcmpes	%fcc0, %f25, %f15
	.word	0x9da0190f	! t0_kref+0x4adc:   	fitod	%f15, %f14
	.word	0x8d83329a	! t0_kref+0x4ae0:   	wr	%o4, 0xfffff29a, %fprs
	.word	0xacf6b899	! t0_kref+0x4ae4:   	udivcc	%i2, -0x767, %l6
	.word	0xac1b74ba	! t0_kref+0x4ae8:   	xor	%o5, -0xb46, %l6
	.word	0xa802a215	! t0_kref+0x4aec:   	add	%o2, 0x215, %l4
	.word	0x97b3015a	! t0_kref+0x4af0:   	edge32l	%o4, %i2, %o3
	.word	0xda48a022	! t0_kref+0x4af4:   	ldsb	[%g2 + 0x22], %o5
	.word	0x993f6008	! t0_kref+0x4af8:   	sra	%i5, 0x8, %o4
	.word	0xd6ff1019	! t0_kref+0x4afc:   	swapa	[%i4 + %i1]0x80, %o3
	.word	0x81874000	! t0_kref+0x4b00:   	wr	%i5, %g0, %y
	.word	0xed063fe0	! t0_kref+0x4b04:   	ld	[%i0 - 0x20], %f22
	.word	0xf720a010	! t0_kref+0x4b08:   	st	%f27, [%g2 + 0x10]
	.word	0xe886101c	! t0_kref+0x4b0c:   	lda	[%i0 + %i4]0x80, %l4
	.word	0xe1000019	! t0_kref+0x4b10:   	ld	[%g0 + %i1], %f16
	.word	0x9732600e	! t0_kref+0x4b14:   	srl	%o1, 0xe, %o3
	.word	0x953b000a	! t0_kref+0x4b18:   	sra	%o4, %o2, %o2
	.word	0xa5b60e80	! t0_kref+0x4b1c:   	fsrc1	%f24, %f18
	.word	0xed20a008	! t0_kref+0x4b20:   	st	%f22, [%g2 + 8]
	.word	0xed20a010	! t0_kref+0x4b24:   	st	%f22, [%g2 + 0x10]
	.word	0x27480001	! t0_kref+0x4b28:   	fbul,a,pt	%fcc0, _kref+0x4b2c
	.word	0xab17001c	! t0_kref+0x4b2c:   	taddcctv	%i4, %i4, %l5
	.word	0xb9a5895c	! t0_kref+0x4b30:   	fmuld	%f22, %f28, %f28
	.word	0xc368a00d	! t0_kref+0x4b34:   	prefetch	%g2 + 0xd, 1
	.word	0xd81e2018	! t0_kref+0x4b38:   	ldd	[%i0 + 0x18], %o4
	.word	0x81aecaad	! t0_kref+0x4b3c:   	fcmpes	%fcc0, %f27, %f13
	.word	0xac5820df	! t0_kref+0x4b40:   	smul	%g0, 0xdf, %l6
	.word	0xb7b54fbd	! t0_kref+0x4b44:   	fors	%f21, %f29, %f27
	.word	0xc568a100	! t0_kref+0x4b48:   	prefetch	%g2 + 0x100, 2
	.word	0x99a000d0	! t0_kref+0x4b4c:   	fnegd	%f16, %f12
	.word	0xf91fbec8	! t0_kref+0x4b50:   	ldd	[%fp - 0x138], %f28
	.word	0x90bead0d	! t0_kref+0x4b54:   	xnorcc	%i2, 0xd0d, %o0
	.word	0xee48a018	! t0_kref+0x4b58:   	ldsb	[%g2 + 0x18], %l7
	.word	0x2a800007	! t0_kref+0x4b5c:   	bcs,a	_kref+0x4b78
	.word	0x94a6e1fe	! t0_kref+0x4b60:   	subcc	%i3, 0x1fe, %o2
	.word	0xb9b5c73b	! t0_kref+0x4b64:   	fmuld8ulx16	%f23, %f27, %f28
	.word	0x9b400000	! t0_kref+0x4b68:   	mov	%y, %o5
	.word	0xa9a2cd2d	! t0_kref+0x4b6c:   	fsmuld	%f11, %f13, %f20
	.word	0xd816001b	! t0_kref+0x4b70:   	lduh	[%i0 + %i3], %o4
	.word	0x24800002	! t0_kref+0x4b74:   	ble,a	_kref+0x4b7c
	.word	0xda0e8018	! t0_kref+0x4b78:   	ldub	[%i2 + %i0], %o5
	.word	0x8143c000	! t0_kref+0x4b7c:   	stbar
	.word	0x9aab000b	! t0_kref+0x4b80:   	andncc	%o4, %o3, %o5
	.word	0x99a708ce	! t0_kref+0x4b84:   	fsubd	%f28, %f14, %f12
	.word	0x27480002	! t0_kref+0x4b88:   	fbul,a,pt	%fcc0, _kref+0x4b90
	.word	0x9ba01a5c	! t0_kref+0x4b8c:   	fdtoi	%f28, %f13
	.word	0xa1a018cc	! t0_kref+0x4b90:   	fdtos	%f12, %f16
	.word	0xe7e6101c	! t0_kref+0x4b94:   	casa	[%i0]0x80, %i4, %l3
	.word	0x9692801d	! t0_kref+0x4b98:   	orcc	%o2, %i5, %o3
	.word	0x9fa01a2f	! t0_kref+0x4b9c:   	fstoi	%f15, %f15
	.word	0xaa9a8009	! t0_kref+0x4ba0:   	xorcc	%o2, %o1, %l5
	.word	0x86102002	! t0_kref+0x4ba4:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x4ba8:   	bne,a	_kref+0x4ba8
	.word	0x86a0e001	! t0_kref+0x4bac:   	subcc	%g3, 1, %g3
	.word	0x1919f30c	! t0_kref+0x4bb0:   	sethi	%hi(0x67cc3000), %o4
	.word	0xada0055a	! t0_kref+0x4bb4:   	fsqrtd	%f26, %f22
	.word	0xab62c01a	! t0_kref+0x4bb8:   	movge	%fcc0, %i2, %l5
	.word	0xb5a00550	! t0_kref+0x4bbc:   	fsqrtd	%f16, %f26
	.word	0xc368a10e	! t0_kref+0x4bc0:   	prefetch	%g2 + 0x10e, 1
	.word	0x86102001	! t0_kref+0x4bc4:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x4bc8:   	bne,a	_kref+0x4bc8
	.word	0x86a0e001	! t0_kref+0x4bcc:   	subcc	%g3, 1, %g3
	.word	0xb9b50d2e	! t0_kref+0x4bd0:   	fandnot1s	%f20, %f14, %f28
	.word	0xa9b38adc	! t0_kref+0x4bd4:   	fpsub32	%f14, %f28, %f20
	.word	0x81834000	! t0_kref+0x4bd8:   	wr	%o5, %g0, %y
	.word	0xa892800c	! t0_kref+0x4bdc:   	orcc	%o2, %o4, %l4
	.word	0x98f6c00c	! t0_kref+0x4be0:   	udivcc	%i3, %o4, %o4
	.word	0xb1b4091c	! t0_kref+0x4be4:   	faligndata	%f16, %f28, %f24
	.word	0x960b001d	! t0_kref+0x4be8:   	and	%o4, %i5, %o3
	.word	0xb3a0053b	! t0_kref+0x4bec:   	fsqrts	%f27, %f25
	.word	0xaf400000	! t0_kref+0x4bf0:   	mov	%y, %l7
	.word	0xa5b00f10	! t0_kref+0x4bf4:   	fsrc2	%f16, %f18
	.word	0xa9a548b5	! t0_kref+0x4bf8:   	fsubs	%f21, %f21, %f20
	.word	0xada0191d	! t0_kref+0x4bfc:   	fitod	%f29, %f22
	.word	0xb7a00032	! t0_kref+0x4c00:   	fmovs	%f18, %f27
	.word	0xa9a00556	! t0_kref+0x4c04:   	fsqrtd	%f22, %f20
	.word	0xa9b6c717	! t0_kref+0x4c08:   	fmuld8sux16	%f27, %f23, %f20
	.word	0xaf3a6006	! t0_kref+0x4c0c:   	sra	%o1, 0x6, %l7
	.word	0xa1a9804c	! t0_kref+0x4c10:   	fmovdg	%fcc0, %f12, %f16
	.word	0x3e800005	! t0_kref+0x4c14:   	bvc,a	_kref+0x4c28
	.word	0xe1be189b	! t0_kref+0x4c18:   	stda	%f16, [%i0 + %i3]0xc4
	.word	0x93b7011a	! t0_kref+0x4c1c:   	edge32	%i4, %i2, %o1
	.word	0x81ad0a5c	! t0_kref+0x4c20:   	fcmpd	%fcc0, %f20, %f28
	.word	0xd648a021	! t0_kref+0x4c24:   	ldsb	[%g2 + 0x21], %o3
	.word	0x99b58416	! t0_kref+0x4c28:   	fcmple16	%f22, %f22, %o4
	.word	0xd620a008	! t0_kref+0x4c2c:   	st	%o3, [%g2 + 8]
	.word	0xd0160000	! t0_kref+0x4c30:   	lduh	[%i0], %o0
	.word	0x81de3d33	! t0_kref+0x4c34:   	flush	%i0 - 0x2cd
	.word	0xda20a030	! t0_kref+0x4c38:   	st	%o5, [%g2 + 0x30]
	.word	0xa9a00136	! t0_kref+0x4c3c:   	fabss	%f22, %f20
	.word	0x9482800c	! t0_kref+0x4c40:   	addcc	%o2, %o4, %o2
	.word	0x9de3bfa0	! t0_kref+0x4c44:   	save	%sp, -0x60, %sp
	.word	0xa9eec01a	! t0_kref+0x4c48:   	restore	%i3, %i2, %l4
	.word	0xe868a000	! t0_kref+0x4c4c:   	ldstub	[%g2], %l4
	.word	0xb1a01a31	! t0_kref+0x4c50:   	fstoi	%f17, %f24
	.word	0xb5b70a12	! t0_kref+0x4c54:   	fpadd16	%f28, %f18, %f26
	.word	0xee865000	! t0_kref+0x4c58:   	lda	[%i1]0x80, %l7
	.word	0xe76e001d	! t0_kref+0x4c5c:   	prefetch	%i0 + %i5, 19
	.word	0x81af0ad6	! t0_kref+0x4c60:   	fcmped	%fcc0, %f28, %f22
	.word	0xada689d2	! t0_kref+0x4c64:   	fdivd	%f26, %f18, %f22
	.word	0xada01917	! t0_kref+0x4c68:   	fitod	%f23, %f22
	.word	0x8d86ad91	! t0_kref+0x4c6c:   	wr	%i2, 0xd91, %fprs
	.word	0xf900a020	! t0_kref+0x4c70:   	ld	[%g2 + 0x20], %f28
	.word	0xc0b61000	! t0_kref+0x4c74:   	stha	%g0, [%i0]0x80
	.word	0x9637001b	! t0_kref+0x4c78:   	orn	%i4, %i3, %o3
	.word	0x25480006	! t0_kref+0x4c7c:   	fblg,a,pt	%fcc0, _kref+0x4c94
	.word	0xe51fbfd8	! t0_kref+0x4c80:   	ldd	[%fp - 0x28], %f18
	.word	0xed00a008	! t0_kref+0x4c84:   	ld	[%g2 + 8], %f22
	.word	0x9b2ee00c	! t0_kref+0x4c88:   	sll	%i3, 0xc, %o5
	.word	0x92bec00d	! t0_kref+0x4c8c:   	xnorcc	%i3, %o5, %o1
	.word	0x92e24000	! t0_kref+0x4c90:   	subccc	%o1, %g0, %o1
	.word	0xaca30009	! t0_kref+0x4c94:   	subcc	%o4, %o1, %l6
	.word	0x9800001a	! t0_kref+0x4c98:   	add	%g0, %i2, %o4
	.word	0xe9801019	! t0_kref+0x4c9c:   	lda	[%g0 + %i1]0x80, %f20
	.word	0xa5b48dd0	! t0_kref+0x4ca0:   	fnand	%f18, %f16, %f18
	.word	0x81ab8a36	! t0_kref+0x4ca4:   	fcmps	%fcc0, %f14, %f22
	.word	0x902a801a	! t0_kref+0x4ca8:   	andn	%o2, %i2, %o0
	.word	0x95b505da	! t0_kref+0x4cac:   	fcmpeq32	%f20, %f26, %o2
	.word	0xa5b00c00	! t0_kref+0x4cb0:   	fzero	%f18
	.word	0x9da01096	! t0_kref+0x4cb4:   	fxtos	%f22, %f14
	.word	0xb9a5884c	! t0_kref+0x4cb8:   	faddd	%f22, %f12, %f28
	.word	0xd008a023	! t0_kref+0x4cbc:   	ldub	[%g2 + 0x23], %o0
	.word	0xf430a03a	! t0_kref+0x4cc0:   	sth	%i2, [%g2 + 0x3a]
	.word	0x99a4895c	! t0_kref+0x4cc4:   	fmuld	%f18, %f28, %f12
	.word	0xecb81019	! t0_kref+0x4cc8:   	stda	%l6, [%g0 + %i1]0x80
	.word	0xa8db000d	! t0_kref+0x4ccc:   	smulcc	%o4, %o5, %l4
	.word	0xd4ce5000	! t0_kref+0x4cd0:   	ldsba	[%i1]0x80, %o2
	.word	0x81dc74ea	! t0_kref+0x4cd4:   	flush	%l1 - 0xb16
	.word	0xa8728009	! t0_kref+0x4cd8:   	udiv	%o2, %o1, %l4
	.word	0xd03e4000	! t0_kref+0x4cdc:   	std	%o0, [%i1]
	.word	0x9ada800d	! t0_kref+0x4ce0:   	smulcc	%o2, %o5, %o5
	.word	0xafb48494	! t0_kref+0x4ce4:   	fcmple32	%f18, %f20, %l7
	.word	0xa9b50a92	! t0_kref+0x4ce8:   	fpsub16	%f20, %f18, %f20
	.word	0xaba00034	! t0_kref+0x4cec:   	fmovs	%f20, %f21
	.word	0xaa07364e	! t0_kref+0x4cf0:   	add	%i4, -0x9b2, %l5
	.word	0xf51e4000	! t0_kref+0x4cf4:   	ldd	[%i1], %f26
	.word	0xa1a0003b	! t0_kref+0x4cf8:   	fmovs	%f27, %f16
	.word	0x878020d2	! t0_kref+0x4cfc:   	mov	0xd2, %asi
	.word	0xb3a01a4e	! t0_kref+0x4d00:   	fdtoi	%f14, %f25
	.word	0xeb062014	! t0_kref+0x4d04:   	ld	[%i0 + 0x14], %f21
	.word	0xa93b4009	! t0_kref+0x4d08:   	sra	%o5, %o1, %l4
	.word	0x98df6fe2	! t0_kref+0x4d0c:   	smulcc	%i5, 0xfe2, %o4
	.word	0x8143e025	! t0_kref+0x4d10:   	membar	0x25
	.word	0x900f69bc	! t0_kref+0x4d14:   	and	%i5, 0x9bc, %o0
	.word	0xb9a388d4	! t0_kref+0x4d18:   	fsubd	%f14, %f20, %f28
	.word	0xaf0a7fb6	! t0_kref+0x4d1c:   	tsubcc	%o1, -0x4a, %l7
	.word	0xa9400000	! t0_kref+0x4d20:   	mov	%y, %l4
	.word	0x81d9401f	! t0_kref+0x4d24:   	flush	%g5 + %i7
	.word	0xd66e2012	! t0_kref+0x4d28:   	ldstub	[%i0 + 0x12], %o3
	.word	0xc036c018	! t0_kref+0x4d2c:   	clrh	[%i3 + %i0]
	.word	0xe808a00b	! t0_kref+0x4d30:   	ldub	[%g2 + 0xb], %l4
	.word	0xec3e6010	! t0_kref+0x4d34:   	std	%l6, [%i1 + 0x10]
	.word	0xd228a012	! t0_kref+0x4d38:   	stb	%o1, [%g2 + 0x12]
	.word	0x94c2800b	! t0_kref+0x4d3c:   	addccc	%o2, %o3, %o2
	.word	0x9ba00530	! t0_kref+0x4d40:   	fsqrts	%f16, %f13
	.word	0xef00a028	! t0_kref+0x4d44:   	ld	[%g2 + 0x28], %f23
	.word	0xb5a40856	! t0_kref+0x4d48:   	faddd	%f16, %f22, %f26
	.word	0x99a70950	! t0_kref+0x4d4c:   	fmuld	%f28, %f16, %f12
	.word	0x9340c000	! t0_kref+0x4d50:   	mov	%asi, %o1
	.word	0x37480001	! t0_kref+0x4d54:   	fbge,a,pt	%fcc0, _kref+0x4d58
	.word	0x8182c000	! t0_kref+0x4d58:   	wr	%o3, %g0, %y
	.word	0xada488ce	! t0_kref+0x4d5c:   	fsubd	%f18, %f14, %f22
	.word	0x99a38952	! t0_kref+0x4d60:   	fmuld	%f14, %f18, %f12
	.word	0x98582073	! t0_kref+0x4d64:   	smul	%g0, 0x73, %o4
	.word	0xd8270018	! t0_kref+0x4d68:   	st	%o4, [%i4 + %i0]
	.word	0x9fa00032	! t0_kref+0x4d6c:   	fmovs	%f18, %f15
	.word	0xf828a02a	! t0_kref+0x4d70:   	stb	%i4, [%g2 + 0x2a]
	.word	0xac02401b	! t0_kref+0x4d74:   	add	%o1, %i3, %l6
	.word	0x97400000	! t0_kref+0x4d78:   	mov	%y, %o3
	.word	0xe9801019	! t0_kref+0x4d7c:   	lda	[%g0 + %i1]0x80, %f20
	.word	0x9652801d	! t0_kref+0x4d80:   	umul	%o2, %i5, %o3
	sethi	%hi(2f), %o7
	.word	0xe40be1d4	! t0_kref+0x4d88:   	ldub	[%o7 + 0x1d4], %l2
	.word	0xa41ca00c	! t0_kref+0x4d8c:   	xor	%l2, 0xc, %l2
	.word	0xe42be1d4	! t0_kref+0x4d90:   	stb	%l2, [%o7 + 0x1d4]
	.word	0x81dbe1d4	! t0_kref+0x4d94:   	flush	%o7 + 0x1d4
	.word	0xafb2403a	! t0_kref+0x4d98:   	edge8n	%o1, %i2, %l7
	.word	0xafa3883a	! t0_kref+0x4d9c:   	fadds	%f14, %f26, %f23
	.word	0x99a30852	! t0_kref+0x4da0:   	faddd	%f12, %f18, %f12
	.word	0xee40a000	! t0_kref+0x4da4:   	ldsw	[%g2], %l7
	.word	0xa3a01a2c	! t0_kref+0x4da8:   	fstoi	%f12, %f17
	.word	0xe99e1a1c	! t0_kref+0x4dac:   	ldda	[%i0 + %i4]0xd0, %f20
	.word	0xae03401b	! t0_kref+0x4db0:   	add	%o5, %i3, %l7
	.word	0x90aa70a4	! t0_kref+0x4db4:   	andncc	%o1, -0xf5c, %o0
	.word	0x920e801a	! t0_kref+0x4db8:   	and	%i2, %i2, %o1
	.word	0xec00a000	! t0_kref+0x4dbc:   	ld	[%g2], %l6
	.word	0x9530000d	! t0_kref+0x4dc0:   	srl	%g0, %o5, %o2
	.word	0xec10a012	! t0_kref+0x4dc4:   	lduh	[%g2 + 0x12], %l6
	.word	0xa5a00536	! t0_kref+0x4dc8:   	fsqrts	%f22, %f18
	.word	0x98da400d	! t0_kref+0x4dcc:   	smulcc	%o1, %o5, %o4
	.word	0xe16e2018	! t0_kref+0x4dd0:   	prefetch	%i0 + 0x18, 16
2:	.word	0x9da0054e	! t0_kref+0x4dd4:   	fsqrtd	%f14, %f14
	.word	0xaa27312a	! t0_kref+0x4dd8:   	sub	%i4, -0xed6, %l5
	.word	0x81dfb054	! t0_kref+0x4ddc:   	flush	%fp - 0xfac
	.word	0x2b480006	! t0_kref+0x4de0:   	fbug,a,pt	%fcc0, _kref+0x4df8
	.word	0xecdf5018	! t0_kref+0x4de4:   	ldxa	[%i5 + %i0]0x80, %l6
	.word	0x81ad8ad4	! t0_kref+0x4de8:   	fcmped	%fcc0, %f22, %f20
	.word	0xc168a0c5	! t0_kref+0x4dec:   	prefetch	%g2 + 0xc5, 0
	.word	0xacd32d42	! t0_kref+0x4df0:   	umulcc	%o4, 0xd42, %l6
	.word	0x97a000b9	! t0_kref+0x4df4:   	fnegs	%f25, %f11
	.word	0x9da01a3a	! t0_kref+0x4df8:   	fstoi	%f26, %f14
	.word	0xbba000bd	! t0_kref+0x4dfc:   	fnegs	%f29, %f29
	.word	0xb9a0054e	! t0_kref+0x4e00:   	fsqrtd	%f14, %f28
	.word	0x3f480004	! t0_kref+0x4e04:   	fbo,a,pt	%fcc0, _kref+0x4e14
	.word	0xad40c000	! t0_kref+0x4e08:   	mov	%asi, %l6
	.word	0xabb58aed	! t0_kref+0x4e0c:   	fpsub32s	%f22, %f13, %f21
	.word	0xdb06001c	! t0_kref+0x4e10:   	ld	[%i0 + %i4], %f13
	.word	0xc368a108	! t0_kref+0x4e14:   	prefetch	%g2 + 0x108, 1
	.word	0x9856abbd	! t0_kref+0x4e18:   	umul	%i2, 0xbbd, %o4
	.word	0xa1a018d4	! t0_kref+0x4e1c:   	fdtos	%f20, %f16
	call	SYM(_kaos_done)
	.word	0x01000000	! t0_kref+0x4e24:   	nop
	KGLOBAL(t0_ktbl_end)
t0_ktbl_end:
t0_ktbl_page_end:

KTEXT_MODULE(t0_module_subr0, 0x1aff6000)
.seg "text"
t0_subr0_page_begin:
	.skip 8184
.global _t0_subr0; ENTRY(t0_subr0)
	.word	0xa6844012	! t0_subr0+0x0:   	addcc	%l1, %l2, %l3
	.word	0x81c3e008	! t0_subr0+0x4:   	retl
	.word	0xaa64c014	! t0_subr0+0x8:   	subc	%l3, %l4, %l5
t0_subr0_page_end:

KTEXT_MODULE(t0_module_subr1, 0x1b03c000)
.seg "text"
t0_subr1_page_begin:
	.skip 8180
.global _t0_subr1; ENTRY(t0_subr1)
	.word	0x9de3bfa0	! t0_subr1+0x0:   	save	%sp, -0x60, %sp
	.word	0xb29eaa5a	! t0_subr1+0x4:   	xorcc	%i2, 0xa5a, %i1
	.word	0x81c7e008	! t0_subr1+0x8:   	ret
	.word	0xa7ee6001	! t0_subr1+0xc:   	restore	%i1, 1, %l3
t0_subr1_page_end:

KTEXT_MODULE(t0_module_subr2, 0x1aef4000)
.seg "text"
t0_subr2_page_begin:
	.skip 8188
.global _t0_subr2; ENTRY(t0_subr2)
	.word	0x9de3bfa0	! t0_subr2+0x0:   	save	%sp, -0x60, %sp
	.word	0xb2066001	! t0_subr2+0x4:   	add	%i1, 1, %i1
	.word	0x81c7e008	! t0_subr2+0x8:   	ret
	.word	0xa3ee6001	! t0_subr2+0xc:   	restore	%i1, 1, %l1
t0_subr2_page_end:

KTEXT_MODULE(t0_module_subr3, 0x1af1c000)
.seg "text"
t0_subr3_page_begin:
	.skip 8168
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
!  Total operations: 4779  
!
!  Operation frequencies
!
!  name               exp    obs
!  ldsb              0.51   0.54
!  ldub              0.18   0.25
!  ldsh              0.09   0.06
!  lduh              1.30   1.23
!  ld                0.28   0.46
!  ldd               1.25   1.17
!  swap              0.03   0.02
!  ldstub            0.54   0.61
!  stb               0.85   0.98
!  sth               1.17   1.11
!  st                0.78   0.82
!  std               0.48   0.46
!  add               1.03   0.98
!  addcc             0.30   0.40
!  addx              0.22   0.21
!  addxcc            0.75   0.88
!  taddcc            0.09   0.02
!  taddcctv          0.12   0.08
!  sub               0.97   1.11
!  subcc             1.20   1.57
!  subx              1.36   1.49
!  subxcc            0.68   0.46
!  tsubcc            0.22   0.36
!  tsubcctv          0.11   0.17
!  mulscc            0.01   0.00
!  and               0.90   0.90
!  andcc             0.24   0.27
!  andn              0.08   0.21
!  andncc            0.46   0.59
!  or                0.18   0.21
!  orcc              1.01   0.84
!  orn               0.89   0.71
!  orncc             0.13   0.06
!  xor               0.17   0.08
!  xorcc             0.59   0.96
!  xnor              0.74   0.92
!  xnorcc            1.15   1.17
!  sll               0.53   0.48
!  srl               1.00   1.05
!  sra               1.06   0.98
!  unimp             0.09   0.04
!  umul              0.90   1.00
!  smul              0.90   1.03
!  udiv              0.53   0.59
!  sdiv              0.69   0.63
!  umulcc            0.33   0.25
!  smulcc            1.25   1.13
!  udivcc            1.02   1.05
!  sdivcc            0.08   0.08
!  rdy               1.36   1.36
!  wry               0.20   0.25
!  bicc              2.35   1.78
!  sethi             0.54   0.48
!  jmpl              0.98   1.05
!  call              0.21   0.27
!  ticc              0.00   0.00
!  flush             0.86   1.11
!  save              1.22   0.86
!  restore           0.17   0.00
!  stbar             1.02   0.94
!  ldf               1.27   1.74
!  lddf              0.81   0.80
!  stf               0.13   0.10
!  stdf              0.05   0.04
!  fadds             0.71   0.54
!  fsubs             0.52   0.46
!  fmuls             0.53   0.56
!  fdivs             0.49   0.65
!  faddd             1.05   0.92
!  fsubd             0.82   1.11
!  fmuld             0.65   0.71
!  fdivd             0.80   0.69
!  faddq             0.00   0.00
!  fsubq             0.00   0.00
!  fmulq             0.00   0.00
!  fdivq             0.00   0.00
!  fsmuld            0.33   0.31
!  fdmulq            0.00   0.00
!  fitos             0.11   0.04
!  fitod             0.99   1.03
!  fitoq             0.00   0.00
!  fstoi             1.00   0.96
!  fstod             0.60   0.80
!  fstoq             0.00   0.00
!  fdtoi             1.08   1.32
!  fdtos             1.37   1.46
!  fdtoq             0.00   0.00
!  fqtoi             0.00   0.00
!  fqtos             0.00   0.00
!  fqtod             0.00   0.00
!  fmovs             0.47   0.56
!  fnegs             1.30   1.42
!  fabss             0.34   0.40
!  fsqrts            1.39   1.40
!  fsqrtd            2.26   2.32
!  fsqrtq            0.00   0.00
!  fcmps             0.17   0.25
!  fcmpd             1.15   1.07
!  fcmpq             0.00   0.00
!  fcmpes            0.57   0.52
!  fcmped            0.84   0.73
!  fcmpeq            0.00   0.00
!  fbfcc             0.24   0.15
!  ldfsr             0.09   0.00
!  stfsr             0.17   0.15
!  loop              0.94   0.56
!  offset            0.16   0.23
!  area              0.05   0.06
!  target            0.09   0.17
!  goto              0.20   0.10
!  sigsegv           0.02   0.00
!  sigbus            0.14   0.15
!  imodify           1.15   0.59
!  ldfsr_offset      0.22   0.00
!  fpattern          0.93   1.00
!  lbranch           0.01   0.00
!  shmld             4.50   4.77
!  shmst             3.04   3.20
!  shmpf             1.03   0.98
!  shmswap           0.16   0.21
!  shmblkld          1.24   0.36
!  shmblkst          1.32   0.65
!  shmblkchk         0.17   0.06
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
!  casa              0.16   0.21
!  rdasi             0.19   0.33
!  wrasi             0.24   0.25
!  bpcc              0.69   0.80
!  fbpfcc            2.77   2.47
!  fmovscc           0.04   0.06
!  fmovdcc           0.15   0.13
!  fmovqcc           0.00   0.00
!  movcc             0.26   0.33
!  flushw            0.02   0.02
!  membar            0.14   0.08
!  prefetch          1.19   1.34
!  rdpc              0.17   0.10
!  ldqf              0.00   0.00
!  stqf              0.00   0.00
!  ldfa              0.27   0.46
!  lddfa             0.04   0.10
!  ldqfa             0.00   0.00
!  ldsba             0.22   0.23
!  ldsha             0.09   0.04
!  lduba             0.24   0.25
!  lduha             0.11   0.08
!  lda               0.22   0.21
!  ldda              0.22   0.25
!  ldstuba           0.03   0.02
!  prefetcha         0.90   1.26
!  stfa              0.06   0.17
!  stdfa             0.23   0.04
!  stqfa             0.00   0.00
!  stba              0.02   0.02
!  stha              0.20   0.17
!  sta               0.10   0.13
!  stda              0.20   0.27
!  swapa             0.26   0.23
!  fmovd             0.09   0.13
!  fnegd             0.03   0.10
!  fabsd             0.07   0.08
!  fstox             0.00   0.00
!  fdtox             0.26   0.23
!  fxtos             0.05   0.06
!  fxtod             0.10   0.10
!  lds               0.00   0.00
!  ldsa              0.05   0.04
!  ldx               0.22   0.17
!  ldxa              0.16   0.15
!  nofault           0.26   0.19
!  rdgsr             0.22   0.29
!  wrgsr             0.02   0.02
!  fpadd16           0.03   0.04
!  fpadd16s          0.09   0.13
!  fpadd32           0.16   0.19
!  fpadd32s          0.09   0.06
!  fpsub16           0.12   0.19
!  fpsub16s          0.05   0.08
!  fpsub32           0.11   0.15
!  fpsub32s          0.25   0.25
!  fpack16           0.19   0.23
!  fpack32           0.14   0.08
!  fpackfix          0.22   0.31
!  fexpand           0.11   0.08
!  fpmerge           0.07   0.04
!  fmul8x16          0.24   0.19
!  fmul8x16au        0.12   0.13
!  fmul8x16al        0.14   0.10
!  fmul8sux16        0.05   0.15
!  fmul8ulx16        0.24   0.27
!  fmuld8sux16       0.06   0.08
!  fmuld8ulx16       0.15   0.08
!  alignaddr         0.12   0.15
!  alignaddrl        0.21   0.27
!  faligndata        0.20   0.19
!  fzero             0.25   0.17
!  fzeros            0.18   0.23
!  fone              0.05   0.00
!  fones             0.07   0.02
!  fsrc1             0.25   0.29
!  fsrc1s            0.01   0.02
!  fsrc2             0.22   0.27
!  fsrc2s            0.17   0.13
!  fnot1             0.09   0.02
!  fnot1s            0.11   0.02
!  fnot2             0.08   0.06
!  fnot2s            0.07   0.13
!  for               0.13   0.08
!  fors              0.20   0.29
!  fnor              0.05   0.08
!  fnors             0.27   0.23
!  fand              0.00   0.00
!  fands             0.07   0.04
!  fnand             0.05   0.13
!  fnands            0.13   0.23
!  fxor              0.04   0.02
!  fxors             0.02   0.02
!  fxnor             0.15   0.17
!  fxnors            0.27   0.36
!  fornot1           0.05   0.04
!  fornot1s          0.23   0.19
!  fornot2           0.16   0.21
!  fornot2s          0.21   0.21
!  fandnot1          0.14   0.15
!  fandnot1s         0.11   0.13
!  fandnot2          0.04   0.10
!  fandnot2s         0.00   0.00
!  fcmpgt16          0.06   0.06
!  fcmpgt32          0.06   0.02
!  fcmple16          0.25   0.31
!  fcmple32          0.22   0.19
!  fcmpne16          0.17   0.15
!  fcmpne32          0.05   0.06
!  fcmpeq16          0.08   0.06
!  fcmpeq32          0.12   0.13
!  edge8             0.24   0.23
!  edge8l            0.05   0.10
!  edge16            0.01   0.00
!  edge16l           0.26   0.25
!  edge32            0.24   0.33
!  edge32l           0.23   0.27
!  pdist             0.01   0.00
!  partial_st8       0.12   0.10
!  partial_st16      0.06   0.06
!  partial_st32      0.05   0.04
!  short_st8         0.04   0.06
!  short_st16        0.02   0.04
!  short_ld8         0.17   0.19
!  short_ld16        0.25   0.29
!  blkld             0.26   0.00
!  blkst             0.02   0.00
!  blkld_offset      0.05   0.00
!  blkst_offset      0.05   0.00
!  blk_check         0.08   0.08
!  casxa             0.11   0.06
!  rdccr             0.26   0.29
!  rdfprs            0.07   0.00
!  wrccr             0.27   0.25
!  popc              0.08   0.08
!  wrfprs            0.25   0.25
!  stx               0.06   0.02
!  stxa              0.09   0.10
!  cflush            0.00   0.00
!  array8            0.08   0.06
!  array16           0.22   0.23
!  array32           0.04   0.08
!  edge8n            0.22   0.23
!  edge8ln           0.07   0.15
!  edge16n           0.15   0.08
!  edge16ln          0.01   0.04
!  edge32n           0.25   0.19
!  edge32ln          0.11   0.15
!  bmask             0.23   0.21
!  bshuffle          0.12   0.17
!  siam              0.08   0.06
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
KDATA_MODULE(t0_module_offset_table, 0x0c816000)
.seg "data"
t0_offset_table_start:
t0_offset_table_size:	.word	0x00000008
t0_offset_table:
	.word	0xffffffe0
	.word	0xffffffe8
	.word	0x00000000
	.word	0xfffffff8
	.word	0x00000010
	.word	0x00000018
	.word	0x00000008
	.word	0xfffffff0
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

KDATA_MODULE(t0_module_data_in_regs, 0x06266000)
.seg "data"
KGLOBAL(t0_data_in_regs)
t0_data_in_regs_start:
t0_data_in_regs:
	.word	0x5b8958b1          ! %f0
	.word	0xc0ab624d          ! %f1
	.word	0x14a7afa6          ! %f2
	.word	0x60120752          ! %f3
	.word	0x952904be          ! %f4
	.word	0x5646eaf0          ! %f5
	.word	0x2543890f          ! %f6
	.word	0xcc92f324          ! %f7
	.word	0x87c9dd24          ! %f8
	.word	0xaeec3ac2          ! %f9
	.word	0x65827857          ! %f10
	.word	0xf5dd8b9c          ! %f11
	.word	0xde56920c          ! %f12
	.word	0x0998b1b0          ! %f13
	.word	0x21d7f08a          ! %f14
	.word	0x2176d3ac          ! %f15
	.word	0x91435a84          ! %f16
	.word	0x252d7d0b          ! %f17
	.word	0xc8dc839a          ! %f18
	.word	0x4371208a          ! %f19
	.word	0x6baaf94e          ! %f20
	.word	0x4b911dd4          ! %f21
	.word	0x85e5254d          ! %f22
	.word	0x07ead390          ! %f23
	.word	0x0776baf5          ! %f24
	.word	0x2f6c8f3a          ! %f25
	.word	0x94d72978          ! %f26
	.word	0x6aa44e64          ! %f27
	.word	0x5abfc120          ! %f28
	.word	0xd1b5d160          ! %f29
	.word	0x5b81716d          ! %f30
	.word	0x1fbe8558          ! %f31
	.word	0x34a92f2a          ! %f32
	.word	0x1f11dc62          ! %f33
	.word	0xec567cb1          ! %f34
	.word	0xe5e5d413          ! %f35
	.word	0xf3d80bf1          ! %f36
	.word	0x5d343f99          ! %f37
	.word	0x4bea50f2          ! %f38
	.word	0xa842f870          ! %f39
	.word	0x7da6eced          ! %f40
	.word	0xe602f11e          ! %f41
	.word	0x11526d37          ! %f42
	.word	0x47c657a6          ! %f43
	.word	0x8880be85          ! %f44
	.word	0xe5a9118d          ! %f45
	.word	0xa0b53c59          ! %f46
	.word	0x85fff1a8          ! %f47
	.word	0xb6af3d9d          ! %f48
	.word	0xb22ba80b          ! %f49
	.word	0xe239bab1          ! %f50
	.word	0x11f8a6cd          ! %f51
	.word	0xae9ef673          ! %f52
	.word	0xfabf9a89          ! %f53
	.word	0x7d5f4312          ! %f54
	.word	0x37a7b3b3          ! %f55
	.word	0x4b63dcab          ! %f56
	.word	0x1b506649          ! %f57
	.word	0x04d0b6f9          ! %f58
	.word	0x66e98761          ! %f59
	.word	0x7966d0a7          ! %f60
	.word	0xb99b5ca0          ! %f61
	.word	0x50457603          ! %f62
	.word	0x4d8b57ab          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x1a4       ! %g1 (code pointer)
	.word	t0_data_in_shm_area ! %g2 (shared area pointer)
	.word	0x8bec9228          ! %g3 (loop index)
	.word	SYM(t0_subr1)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0xe208950a          ! %o0
	.word	0x88971cd3          ! %o1
	.word	0xf2f61d63          ! %o2
	.word	0x375fbfd7          ! %o3
	.word	0x1681b335          ! %o4
	.word	0xb5590944          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x38d5a61c          ! %l0
	.word	0xdd3b67fe          ! %l1
	.word	0x6435d89e          ! %l2
	.word	0xdb5117da          ! %l3
	.word	0x46f47fe1          ! %l4
	.word	0x9f3d9d2b          ! %l5
	.word	0x91502203          ! %l6
	.word	0x5d11b58b          ! %l7
	.word	t0_data_in_area0    ! %i0 (area pointer)
	.word	t0_data_in_area0    ! %i1 (area pointer)
	.word	0xfffffffd          ! %i2 (byte offset)
	.word	0x0000000c          ! %i3 (halfword offset)
	.word	0x00000004          ! %i4 (word offset)
	.word	0x00000000          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0xa3dada60          ! %y
	.word	0x00000004          ! %icc (nzvc)
	.word	0x80000a5a          ! %fsr
	.word	0x00000000          ! %gsr.mask
	.word	0x00000000          ! %gsr
	.word	0x000000d0          ! %asi
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

KDATA_MODULE(t0_module_data_in_stack, 0x18924000)
.seg "data"
KGLOBAL(t0_data_in_mtbl_size)
KGLOBAL(t0_data_in_mtbl)
KGLOBAL(t0_data_in_stack)
t0_data_in_stack_start:
	.word	0x9bc90ca5
	.word	0x58509c52
	.word	0x1457846f
	.word	0x46b925e9
	.word	0xb4e46895
	.word	0xd52214ae
	.word	0x0903adf9
	.word	0x969068ed
	.word	0x9227cbeb
	.word	0x689284fd
	.word	0xf5629162
	.word	0x6ca22fa9
	.word	0x963cab03
	.word	0x916b3f38
	.word	0xe6a40286
	.word	0xc5d25f1d
	.word	0xc896e748
	.word	0xda30b858
	.word	0x07f928fe
	.word	0xa27c2512
	.word	0xd5f348e9
	.word	0xfa4411f8
	.word	0xfab572fb
	.word	0xda13d45e
	.word	0x9ed75fcc
	.word	0x5f611a39
	.word	0x330b6155
	.word	0xb153c166
	.word	0x3879ffc2
	.word	0x0821e5e5
	.word	0x8fc180e3
	.word	0xbbbbe2e4
	.word	0xc73acbfc
	.word	0x171f68d6
	.word	0x7c2d250c
	.word	0xef643aea
	.word	0x414285be
	.word	0x5dd8b098
	.word	0x1a85b79e
	.word	0xf39e4c27
	.word	0x0b4d1252
	.word	0xb500a54d
	.word	0x427cb1de
	.word	0x07e21f67
	.word	0xcc396c3e
	.word	0xd76c74d1
	.word	0xea3392df
	.word	0x9d479d60
	.word	0x850af3b8
	.word	0x8bdb0c1e
	.word	0xc76a6717
	.word	0x199540aa
	.word	0x65cad25a
	.word	0xca7042f0
	.word	0x6156b52e
	.word	0xb3f9640f
	.word	0x636f6611
	.word	0xab449dab
	.word	0x423be419
	.word	0xf113b105
	.word	0xdadae75b
	.word	0xe614c97c
	.word	0xa7db6e67
	.word	0xba487277
	.word	0xa061beb1
	.word	0x7e2a36bf
	.word	0xbc6476db
	.word	0x2bafcfcb
	.word	0x7d5c3d41
	.word	0x834875a0
	.word	0x9bef923a
	.word	0x088f3420
	.word	0x054eacdf
	.word	0x1f013904
	.word	0xde0cda64
	.word	0xe06b65d7
	.word	0xc56deb3d
	.word	0x1f8b23a9
	.word	0x04b79ea9
	.word	0xa2a61255
	.word	0x7af6045a
	.word	0xe455c38b
	.word	0xa3644555
	.word	0x0481d206
	.word	0x4a2b8038
	.word	0xaf575f89
	.word	0xaf12328c
	.word	0x5193e8a4
	.word	0xe83757d1
	.word	0x7eb77b48
	.word	0xac94c85d
	.word	0x215b45b8
	.word	0x8898c54b
	.word	0x6f433557
	.word	0x29e3d410
	.word	0xe2288961
	.word	0xd2e7636a
	.word	0x5f46e394
	.word	0x7b74fcc2
	.word	0x19fb1153
	.word	0x92535045
	.word	0xdd3a91cd
	.word	0x4ca50734
	.word	0xd5b35222
	.word	0x8cf8473c
	.word	0x046546aa
	.word	0x7b5102df
	.word	0xae3b00c0
	.word	0x88f3e629
	.word	0x8d7532c9
	.word	0x902cb44a
	.word	0x8647d044
	.word	0xf77e91d4
	.word	0x38492e2a
	.word	0x2064d0a0
	.word	0x2265c7ec
	.word	0xbe49adac
	.word	0xa10a27cc
	.word	0x86f0de7c
	.word	0xbc427565
	.word	0xcc5d1ab4
	.word	0x43796b98
	.word	0xc5e1d007
	.word	0xf2027f49
	.word	0x6cd931bb
	.word	0xbe42e27e
	.word	0x6f37aa45
	.word	0xf6ff5be8
	.word	0xeea1acd0
	.word	0x9370b0dd
	.word	0x3299cdab
	.word	0xbce3304a
	.word	0x3f4933f3
	.word	0x8d0fd728
	.word	0xeef2b3f4
	.word	0x36f51b74
	.word	0x78dc810f
	.word	0x5bebb8c5
	.word	0xd5a93734
	.word	0xadc871ea
	.word	0x48a74f27
	.word	0xe440ad38
	.word	0x863eb62d
	.word	0xeba5ad75
	.word	0x1ffc88d0
	.word	0x47a3ff80
	.word	0xddbaa9e0
	.word	0x722c1526
	.word	0xa2ae69df
	.word	0x0661ffc1
	.word	0x2ac18067
	.word	0xc417619a
	.word	0x087a8862
	.word	0x63790b22
	.word	0x46bdd101
	.word	0x7b04e17e
	.word	0xa278f8d3
	.word	0x8762adf8
	.word	0xcb603d6e
	.word	0x84c7e255
	.word	0x5add018a
	.word	0x0d4a4424
	.word	0xdb2b947d
	.word	0xa6956178
	.word	0x77491173
	.word	0xb662bbb8
	.word	0x310809e2
	.word	0xb24b495e
t0_data_in_sp:
	.word	0xbbdeee01
	.word	0xd6035de0
	.word	0xef31974d
	.word	0xa397bf1d
	.word	0x12504c62
	.word	0xb14dc1ff
	.word	0xce82dab7
	.word	0xd4094430
	.word	t0_data_in_area0
	.word	t0_data_in_area0
	.word	0x00000015
	.word	0xffffffe2
	.word	0x0000000c
	.word	0x00000000
	.word	t0_data_in_fp
	.word	0x9a22ef6f
	.word	0x9692b3b4
	.word	0x4eca488b
	.word	0xf79f6e82
	.word	0x1e15da6f
	.word	0x65acb533
	.word	0x48937421
	.word	0x83b61abb
	.word	0xc00c98ce
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
	.word   	0xdccd2df4	! [%fp - 0xc]
	.word   	0x5b06d8f0	! [%fp - 0x8]
	.word   	0xb6a63c42	! [%fp - 0x4]
.global t0_data_in_fp; t0_data_in_fp:
	.word	0x549fa6ee
	.word	0x50fa9020
	.word	0xb520dda5
	.word	0x3c31c5ed
	.word	0xf0a95986
	.word	0x9af14e67
	.word	0x672ad928
	.word	0xc4be15ba
	.word	0x868ce881
	.word	0xa45c5711
	.word	0x10cb7221
	.word	0x5dcd3801
	.word	0x9028c426
	.word	0x31b1ac52
	.word	0x4a3ef2be
	.word	0x0aeba9e9
	.word	0xa3b69878
	.word	0x60cfade1
	.word	0x09da94b2
	.word	0x80934f1c
	.word	0x891da2df
	.word	0xe12ce7cb
	.word	0x07aa0980
	.word	0xad5b8ebe
t0_data_in_stacktop:
	.word	0
t0_data_in_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_in_area0, 0x355d0000)
.seg "data"
t0_data_in_area0_start:
.skip 3008
t0_data_in_area0_begin:
	.word	0x26623e07	! t0_data_in_area0-0x20
	.word	0x85357a83	! t0_data_in_area0-0x1c
	.word	0xd826c2f8	! t0_data_in_area0-0x18
	.word	0x16d9cb9a	! t0_data_in_area0-0x14
	.word	0x9f27c807	! t0_data_in_area0-0x10
	.word	0xc28e703e	! t0_data_in_area0-0xc
	.word	0x88fcc002	! t0_data_in_area0-0x8
	.word	0x2614ab9e	! t0_data_in_area0-0x4
.global t0_data_in_area0; t0_data_in_area0:
	.word	0xeae846c6	! t0_data_in_area0+0x0
	.word	0xe9a8937d	! t0_data_in_area0+0x4
	.word	0x5fc8e19a	! t0_data_in_area0+0x8
	.word	0x369fe289	! t0_data_in_area0+0xc
	.word	0x31d76e99	! t0_data_in_area0+0x10
	.word	0x01919aeb	! t0_data_in_area0+0x14
	.word	0x9ef90c1a	! t0_data_in_area0+0x18
	.word	0x6a9d73e2	! t0_data_in_area0+0x1c
t0_data_in_area0_end:
.skip 5120
t0_data_in_area0_stop:

KDATA_MODULE(t0_module_data_in_shm_area, 0x2b7bc000)
.seg "data"
t0_data_in_shm_area_start:
t0_data_in_shm_area_begin:
.global t0_data_in_shm_area; t0_data_in_shm_area:
	.word	0x979cef31	! t0_data_in_shm_area+0x0 (t0)
	.word	0x54153e0e	! t0_data_in_shm_area+0x4 (t1)
	.word	0x148bbe68	! t0_data_in_shm_area+0x8 (t0)
	.word	0xc8aae2e6	! t0_data_in_shm_area+0xc (t1)
	.word	0x18b698bf	! t0_data_in_shm_area+0x10 (t0)
	.word	0xdd54119d	! t0_data_in_shm_area+0x14 (t1)
	.word	0xf83ca02b	! t0_data_in_shm_area+0x18 (t0)
	.word	0xd42c3803	! t0_data_in_shm_area+0x1c (t1)
	.word	0x076c2ab4	! t0_data_in_shm_area+0x20 (t0)
	.word	0x0355c277	! t0_data_in_shm_area+0x24 (t1)
	.word	0x71e10965	! t0_data_in_shm_area+0x28 (t0)
	.word	0xeea5b6fc	! t0_data_in_shm_area+0x2c (t1)
	.word	0xcf47db65	! t0_data_in_shm_area+0x30 (t0)
	.word	0x2c97dfe0	! t0_data_in_shm_area+0x34 (t1)
	.word	0x5a1df156	! t0_data_in_shm_area+0x38 (t0)
	.word	0x61a5d8a5	! t0_data_in_shm_area+0x3c (t1)
	.word	0xc4bdbb28	! t0_data_in_shm_area+0x40 (t0 bload)
	.word	0xaae8fe72	! t0_data_in_shm_area+0x44
	.word	0xe5ddc095	! t0_data_in_shm_area+0x48
	.word	0xb6871a78	! t0_data_in_shm_area+0x4c
	.word	0x49516a18	! t0_data_in_shm_area+0x50
	.word	0x618c6014	! t0_data_in_shm_area+0x54
	.word	0xf08ec7c1	! t0_data_in_shm_area+0x58
	.word	0x18c89ebc	! t0_data_in_shm_area+0x5c
	.word	0x8a657e71	! t0_data_in_shm_area+0x60
	.word	0xf6fc32db	! t0_data_in_shm_area+0x64
	.word	0x0690ddcd	! t0_data_in_shm_area+0x68
	.word	0x17e27399	! t0_data_in_shm_area+0x6c
	.word	0x767a84ac	! t0_data_in_shm_area+0x70
	.word	0xb70e4cb4	! t0_data_in_shm_area+0x74
	.word	0x5ad7dbd1	! t0_data_in_shm_area+0x78
	.word	0x0c941247	! t0_data_in_shm_area+0x7c
	.word	0x18c8f531	! t0_data_in_shm_area+0x80 (t0 bstore)
	.word	0xc103057b	! t0_data_in_shm_area+0x84
	.word	0x1556ae1d	! t0_data_in_shm_area+0x88
	.word	0x8ad7ac6e	! t0_data_in_shm_area+0x8c
	.word	0xb2005cfa	! t0_data_in_shm_area+0x90
	.word	0xfe9cdcd4	! t0_data_in_shm_area+0x94
	.word	0x7e7d677d	! t0_data_in_shm_area+0x98
	.word	0xe68f7820	! t0_data_in_shm_area+0x9c
	.word	0x853dec77	! t0_data_in_shm_area+0xa0
	.word	0x5fac293b	! t0_data_in_shm_area+0xa4
	.word	0x976ec4bd	! t0_data_in_shm_area+0xa8
	.word	0xcc274709	! t0_data_in_shm_area+0xac
	.word	0x7ea290b1	! t0_data_in_shm_area+0xb0
	.word	0x07be2458	! t0_data_in_shm_area+0xb4
	.word	0x080be46f	! t0_data_in_shm_area+0xb8
	.word	0x835bdce5	! t0_data_in_shm_area+0xbc
	.word	0x349c10cc	! t0_data_in_shm_area+0xc0 (t1 bload)
	.word	0x793df0e7	! t0_data_in_shm_area+0xc4
	.word	0x7519f8d9	! t0_data_in_shm_area+0xc8
	.word	0x3aef661c	! t0_data_in_shm_area+0xcc
	.word	0xc0941c38	! t0_data_in_shm_area+0xd0
	.word	0x65dd2df2	! t0_data_in_shm_area+0xd4
	.word	0xd65c417b	! t0_data_in_shm_area+0xd8
	.word	0xef14d63a	! t0_data_in_shm_area+0xdc
	.word	0xdd1dbb9a	! t0_data_in_shm_area+0xe0
	.word	0x9a570a3b	! t0_data_in_shm_area+0xe4
	.word	0x1d4603bb	! t0_data_in_shm_area+0xe8
	.word	0xe867d990	! t0_data_in_shm_area+0xec
	.word	0x67996976	! t0_data_in_shm_area+0xf0
	.word	0x08fc1396	! t0_data_in_shm_area+0xf4
	.word	0xc89e31aa	! t0_data_in_shm_area+0xf8
	.word	0x5b4262f0	! t0_data_in_shm_area+0xfc
	.word	0xb92c8f2b	! t0_data_in_shm_area+0x100 (t1 bstore)
	.word	0xd92e86b1	! t0_data_in_shm_area+0x104
	.word	0x877e45c5	! t0_data_in_shm_area+0x108
	.word	0xf7eba32d	! t0_data_in_shm_area+0x10c
	.word	0x3022cf6b	! t0_data_in_shm_area+0x110
	.word	0x89a33a78	! t0_data_in_shm_area+0x114
	.word	0xdaa2548c	! t0_data_in_shm_area+0x118
	.word	0x15ea7d24	! t0_data_in_shm_area+0x11c
	.word	0x21f503e6	! t0_data_in_shm_area+0x120
	.word	0x3f3b5dbb	! t0_data_in_shm_area+0x124
	.word	0x52b02350	! t0_data_in_shm_area+0x128
	.word	0xfa3cb5ff	! t0_data_in_shm_area+0x12c
	.word	0xccd5e248	! t0_data_in_shm_area+0x130
	.word	0xa309eb0d	! t0_data_in_shm_area+0x134
	.word	0x8cd85851	! t0_data_in_shm_area+0x138
	.word	0xe39a65b8	! t0_data_in_shm_area+0x13c
t0_data_in_shm_area_end:
t0_data_in_shm_area_stop:

KDATA_MODULE(t0_module_data_exp_regs, 0x17fe0000)
.seg "data"
KGLOBAL(t0_data_exp_regs)
t0_data_exp_regs_start:
t0_data_exp_regs:
	.word	0x5b8958b1          ! %f0
	.word	0xc0ab624d          ! %f1
	.word	0x14a7afa6          ! %f2
	.word	0x60120752          ! %f3
	.word	0x952904be          ! %f4
	.word	0x5646eaf0          ! %f5
	.word	0x2543890f          ! %f6
	.word	0xcc92f324          ! %f7
	.word	0x87c9dd24          ! %f8
	.word	0xaeec3ac2          ! %f9
	.word	0x65827857          ! %f10
	.word	0xf5dd8b9c          ! %f11
	.word	0xde56920c          ! %f12
	.word	0x0998b1b0          ! %f13
	.word	0x21d7f08a          ! %f14
	.word	0x2176d3ac          ! %f15
	.word	0x91435a84          ! %f16
	.word	0x252d7d0b          ! %f17
	.word	0xc8dc839a          ! %f18
	.word	0x4371208a          ! %f19
	.word	0x6baaf94e          ! %f20
	.word	0x4b911dd4          ! %f21
	.word	0x85e5254d          ! %f22
	.word	0x07ead390          ! %f23
	.word	0x0776baf5          ! %f24
	.word	0x2f6c8f3a          ! %f25
	.word	0x94d72978          ! %f26
	.word	0x6aa44e64          ! %f27
	.word	0x5abfc120          ! %f28
	.word	0xd1b5d160          ! %f29
	.word	0x5b81716d          ! %f30
	.word	0x1fbe8558          ! %f31
	.word	0x34a92f2a          ! %f32
	.word	0x1f11dc62          ! %f33
	.word	0xec567cb1          ! %f34
	.word	0xe5e5d413          ! %f35
	.word	0xf3d80bf1          ! %f36
	.word	0x5d343f99          ! %f37
	.word	0x4bea50f2          ! %f38
	.word	0xa842f870          ! %f39
	.word	0x7da6eced          ! %f40
	.word	0xe602f11e          ! %f41
	.word	0x11526d37          ! %f42
	.word	0x47c657a6          ! %f43
	.word	0x8880be85          ! %f44
	.word	0xe5a9118d          ! %f45
	.word	0xa0b53c59          ! %f46
	.word	0x85fff1a8          ! %f47
	.word	0xb6af3d9d          ! %f48
	.word	0xb22ba80b          ! %f49
	.word	0xe239bab1          ! %f50
	.word	0x11f8a6cd          ! %f51
	.word	0xae9ef673          ! %f52
	.word	0xfabf9a89          ! %f53
	.word	0x7d5f4312          ! %f54
	.word	0x37a7b3b3          ! %f55
	.word	0x4b63dcab          ! %f56
	.word	0x1b506649          ! %f57
	.word	0x04d0b6f9          ! %f58
	.word	0x66e98761          ! %f59
	.word	0x7966d0a7          ! %f60
	.word	0xb99b5ca0          ! %f61
	.word	0x50457603          ! %f62
	.word	0x4d8b57ab          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x1a4       ! %g1 (code pointer)
	.word	t0_data_exp_shm_area! %g2 (shared area pointer)
	.word	0x8bec9228          ! %g3 (loop index)
	.word	SYM(t0_subr1)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0xe208950a          ! %o0
	.word	0x88971cd3          ! %o1
	.word	0xf2f61d63          ! %o2
	.word	0x375fbfd7          ! %o3
	.word	0x1681b335          ! %o4
	.word	0xb5590944          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x38d5a61c          ! %l0
	.word	0xdd3b67fe          ! %l1
	.word	0x6435d89e          ! %l2
	.word	0xdb5117da          ! %l3
	.word	0x46f47fe1          ! %l4
	.word	0x9f3d9d2b          ! %l5
	.word	0x91502203          ! %l6
	.word	0x5d11b58b          ! %l7
	.word	t0_data_exp_area0   ! %i0 (area pointer)
	.word	t0_data_exp_area0   ! %i1 (area pointer)
	.word	0xfffffffd          ! %i2 (byte offset)
	.word	0x0000000c          ! %i3 (halfword offset)
	.word	0x00000004          ! %i4 (word offset)
	.word	0x00000000          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0xa3dada60          ! %y
	.word	0x00000004          ! %icc (nzvc)
	.word	0x80000a5a          ! %fsr
	.word	0x00000000          ! %gsr.mask
	.word	0x00000000          ! %gsr
	.word	0x000000d0          ! %asi
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

KDATA_MODULE(t0_module_data_exp_stack, 0x30e2e000)
.seg "data"
KGLOBAL(t0_data_exp_mtbl_size)
KGLOBAL(t0_data_exp_mtbl)
KGLOBAL(t0_data_exp_stack)
t0_data_exp_stack_start:
	.word	0x9bc90ca5
	.word	0x58509c52
	.word	0x1457846f
	.word	0x46b925e9
	.word	0xb4e46895
	.word	0xd52214ae
	.word	0x0903adf9
	.word	0x969068ed
	.word	0x9227cbeb
	.word	0x689284fd
	.word	0xf5629162
	.word	0x6ca22fa9
	.word	0x963cab03
	.word	0x916b3f38
	.word	0xe6a40286
	.word	0xc5d25f1d
	.word	0xc896e748
	.word	0xda30b858
	.word	0x07f928fe
	.word	0xa27c2512
	.word	0xd5f348e9
	.word	0xfa4411f8
	.word	0xfab572fb
	.word	0xda13d45e
	.word	0x9ed75fcc
	.word	0x5f611a39
	.word	0x330b6155
	.word	0xb153c166
	.word	0x3879ffc2
	.word	0x0821e5e5
	.word	0x8fc180e3
	.word	0xbbbbe2e4
	.word	0xc73acbfc
	.word	0x171f68d6
	.word	0x7c2d250c
	.word	0xef643aea
	.word	0x414285be
	.word	0x5dd8b098
	.word	0x1a85b79e
	.word	0xf39e4c27
	.word	0x0b4d1252
	.word	0xb500a54d
	.word	0x427cb1de
	.word	0x07e21f67
	.word	0xcc396c3e
	.word	0xd76c74d1
	.word	0xea3392df
	.word	0x9d479d60
	.word	0x850af3b8
	.word	0x8bdb0c1e
	.word	0xc76a6717
	.word	0x199540aa
	.word	0x65cad25a
	.word	0xca7042f0
	.word	0x6156b52e
	.word	0xb3f9640f
	.word	0x636f6611
	.word	0xab449dab
	.word	0x423be419
	.word	0xf113b105
	.word	0xdadae75b
	.word	0xe614c97c
	.word	0xa7db6e67
	.word	0xba487277
	.word	0xa061beb1
	.word	0x7e2a36bf
	.word	0xbc6476db
	.word	0x2bafcfcb
	.word	0x7d5c3d41
	.word	0x834875a0
	.word	0x9bef923a
	.word	0x088f3420
	.word	0x054eacdf
	.word	0x1f013904
	.word	0xde0cda64
	.word	0xe06b65d7
	.word	0xc56deb3d
	.word	0x1f8b23a9
	.word	0x04b79ea9
	.word	0xa2a61255
	.word	0x7af6045a
	.word	0xe455c38b
	.word	0xa3644555
	.word	0x0481d206
	.word	0x4a2b8038
	.word	0xaf575f89
	.word	0xaf12328c
	.word	0x5193e8a4
	.word	0xe83757d1
	.word	0x7eb77b48
	.word	0xac94c85d
	.word	0x215b45b8
	.word	0x8898c54b
	.word	0x6f433557
	.word	0x29e3d410
	.word	0xe2288961
	.word	0xd2e7636a
	.word	0x5f46e394
	.word	0x7b74fcc2
	.word	0x19fb1153
	.word	0x92535045
	.word	0xdd3a91cd
	.word	0x4ca50734
	.word	0xd5b35222
	.word	0x8cf8473c
	.word	0x046546aa
	.word	0x7b5102df
	.word	0xae3b00c0
	.word	0x88f3e629
	.word	0x8d7532c9
	.word	0x902cb44a
	.word	0x8647d044
	.word	0xf77e91d4
	.word	0x38492e2a
	.word	0x2064d0a0
	.word	0x2265c7ec
	.word	0xbe49adac
	.word	0xa10a27cc
	.word	0x86f0de7c
	.word	0xbc427565
	.word	0xcc5d1ab4
	.word	0x43796b98
	.word	0xc5e1d007
	.word	0xf2027f49
	.word	0x6cd931bb
	.word	0xbe42e27e
	.word	0x6f37aa45
	.word	0xf6ff5be8
	.word	0xeea1acd0
	.word	0x9370b0dd
	.word	0x3299cdab
	.word	0xbce3304a
	.word	0x3f4933f3
	.word	0x8d0fd728
	.word	0xeef2b3f4
	.word	0x36f51b74
	.word	0x78dc810f
	.word	0x5bebb8c5
	.word	0xd5a93734
	.word	0xadc871ea
	.word	0x48a74f27
	.word	0xe440ad38
	.word	0x863eb62d
	.word	0xeba5ad75
	.word	0x1ffc88d0
	.word	0x47a3ff80
	.word	0xddbaa9e0
	.word	0x722c1526
	.word	0xa2ae69df
	.word	0x0661ffc1
	.word	0x2ac18067
	.word	0xc417619a
	.word	0x087a8862
	.word	0x63790b22
	.word	0x46bdd101
	.word	0x7b04e17e
	.word	0xa278f8d3
	.word	0x8762adf8
	.word	0xcb603d6e
	.word	0x84c7e255
	.word	0x5add018a
	.word	0x0d4a4424
	.word	0xdb2b947d
	.word	0xa6956178
	.word	0x77491173
	.word	0xb662bbb8
	.word	0x310809e2
	.word	0xb24b495e
t0_data_exp_sp:
	.word	0xbbdeee01
	.word	0xd6035de0
	.word	0xef31974d
	.word	0xa397bf1d
	.word	0x12504c62
	.word	0xb14dc1ff
	.word	0xce82dab7
	.word	0xd4094430
	.word	t0_data_exp_area0
	.word	t0_data_exp_area0
	.word	0x00000015
	.word	0xffffffe2
	.word	0x0000000c
	.word	0x00000000
	.word	t0_data_exp_fp
	.word	0x9a22ef6f
	.word	0x9692b3b4
	.word	0x4eca488b
	.word	0xf79f6e82
	.word	0x1e15da6f
	.word	0x65acb533
	.word	0x48937421
	.word	0x83b61abb
	.word	0xc00c98ce
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
	.word   	0xdccd2df4	! [%fp - 0xc]
	.word   	0x5b06d8f0	! [%fp - 0x8]
	.word   	0xb6a63c42	! [%fp - 0x4]
t0_data_exp_fp:
	.word	0x549fa6ee
	.word	0x50fa9020
	.word	0xb520dda5
	.word	0x3c31c5ed
	.word	0xf0a95986
	.word	0x9af14e67
	.word	0x672ad928
	.word	0xc4be15ba
	.word	0x868ce881
	.word	0xa45c5711
	.word	0x10cb7221
	.word	0x5dcd3801
	.word	0x9028c426
	.word	0x31b1ac52
	.word	0x4a3ef2be
	.word	0x0aeba9e9
	.word	0xa3b69878
	.word	0x60cfade1
	.word	0x09da94b2
	.word	0x80934f1c
	.word	0x891da2df
	.word	0xe12ce7cb
	.word	0x07aa0980
	.word	0xad5b8ebe
t0_data_exp_stacktop:
	.word	0
t0_data_exp_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_exp_area0, 0x0f1f2000)
.seg "data"
t0_data_exp_area0_start:
.skip 3008
t0_data_exp_area0_begin:
	.word	0x26623e07	! t0_data_exp_area0-0x20
	.word	0x85357a83	! t0_data_exp_area0-0x1c
	.word	0xd826c2f8	! t0_data_exp_area0-0x18
	.word	0x16d9cb9a	! t0_data_exp_area0-0x14
	.word	0x9f27c807	! t0_data_exp_area0-0x10
	.word	0xc28e703e	! t0_data_exp_area0-0xc
	.word	0x88fcc002	! t0_data_exp_area0-0x8
	.word	0x2614ab9e	! t0_data_exp_area0-0x4
.global t0_data_exp_area0; t0_data_exp_area0:
	.word	0xeae846c6	! t0_data_exp_area0+0x0
	.word	0xe9a8937d	! t0_data_exp_area0+0x4
	.word	0x5fc8e19a	! t0_data_exp_area0+0x8
	.word	0x369fe289	! t0_data_exp_area0+0xc
	.word	0x31d76e99	! t0_data_exp_area0+0x10
	.word	0x01919aeb	! t0_data_exp_area0+0x14
	.word	0x9ef90c1a	! t0_data_exp_area0+0x18
	.word	0x6a9d73e2	! t0_data_exp_area0+0x1c
t0_data_exp_area0_end:
.skip 5120
t0_data_exp_area0_stop:

KDATA_MODULE(t0_module_data_exp_shm_area, 0x38366000)
.seg "data"
t0_data_exp_shm_area_start:
t0_data_exp_shm_area_begin:
.global t0_data_exp_shm_area; t0_data_exp_shm_area:
	.word	0x979cef31	! t0_data_exp_shm_area+0x0 (t0)
	.word	0x54153e0e	! t0_data_exp_shm_area+0x4 (t1)
	.word	0x148bbe68	! t0_data_exp_shm_area+0x8 (t0)
	.word	0xc8aae2e6	! t0_data_exp_shm_area+0xc (t1)
	.word	0x18b698bf	! t0_data_exp_shm_area+0x10 (t0)
	.word	0xdd54119d	! t0_data_exp_shm_area+0x14 (t1)
	.word	0xf83ca02b	! t0_data_exp_shm_area+0x18 (t0)
	.word	0xd42c3803	! t0_data_exp_shm_area+0x1c (t1)
	.word	0x076c2ab4	! t0_data_exp_shm_area+0x20 (t0)
	.word	0x0355c277	! t0_data_exp_shm_area+0x24 (t1)
	.word	0x71e10965	! t0_data_exp_shm_area+0x28 (t0)
	.word	0xeea5b6fc	! t0_data_exp_shm_area+0x2c (t1)
	.word	0xcf47db65	! t0_data_exp_shm_area+0x30 (t0)
	.word	0x2c97dfe0	! t0_data_exp_shm_area+0x34 (t1)
	.word	0x5a1df156	! t0_data_exp_shm_area+0x38 (t0)
	.word	0x61a5d8a5	! t0_data_exp_shm_area+0x3c (t1)
	.word	0xc4bdbb28	! t0_data_exp_shm_area+0x40 (t0 bload)
	.word	0xaae8fe72	! t0_data_exp_shm_area+0x44
	.word	0xe5ddc095	! t0_data_exp_shm_area+0x48
	.word	0xb6871a78	! t0_data_exp_shm_area+0x4c
	.word	0x49516a18	! t0_data_exp_shm_area+0x50
	.word	0x618c6014	! t0_data_exp_shm_area+0x54
	.word	0xf08ec7c1	! t0_data_exp_shm_area+0x58
	.word	0x18c89ebc	! t0_data_exp_shm_area+0x5c
	.word	0x8a657e71	! t0_data_exp_shm_area+0x60
	.word	0xf6fc32db	! t0_data_exp_shm_area+0x64
	.word	0x0690ddcd	! t0_data_exp_shm_area+0x68
	.word	0x17e27399	! t0_data_exp_shm_area+0x6c
	.word	0x767a84ac	! t0_data_exp_shm_area+0x70
	.word	0xb70e4cb4	! t0_data_exp_shm_area+0x74
	.word	0x5ad7dbd1	! t0_data_exp_shm_area+0x78
	.word	0x0c941247	! t0_data_exp_shm_area+0x7c
	.word	0x18c8f531	! t0_data_exp_shm_area+0x80 (t0 bstore)
	.word	0xc103057b	! t0_data_exp_shm_area+0x84
	.word	0x1556ae1d	! t0_data_exp_shm_area+0x88
	.word	0x8ad7ac6e	! t0_data_exp_shm_area+0x8c
	.word	0xb2005cfa	! t0_data_exp_shm_area+0x90
	.word	0xfe9cdcd4	! t0_data_exp_shm_area+0x94
	.word	0x7e7d677d	! t0_data_exp_shm_area+0x98
	.word	0xe68f7820	! t0_data_exp_shm_area+0x9c
	.word	0x853dec77	! t0_data_exp_shm_area+0xa0
	.word	0x5fac293b	! t0_data_exp_shm_area+0xa4
	.word	0x976ec4bd	! t0_data_exp_shm_area+0xa8
	.word	0xcc274709	! t0_data_exp_shm_area+0xac
	.word	0x7ea290b1	! t0_data_exp_shm_area+0xb0
	.word	0x07be2458	! t0_data_exp_shm_area+0xb4
	.word	0x080be46f	! t0_data_exp_shm_area+0xb8
	.word	0x835bdce5	! t0_data_exp_shm_area+0xbc
	.word	0x349c10cc	! t0_data_exp_shm_area+0xc0 (t1 bload)
	.word	0x793df0e7	! t0_data_exp_shm_area+0xc4
	.word	0x7519f8d9	! t0_data_exp_shm_area+0xc8
	.word	0x3aef661c	! t0_data_exp_shm_area+0xcc
	.word	0xc0941c38	! t0_data_exp_shm_area+0xd0
	.word	0x65dd2df2	! t0_data_exp_shm_area+0xd4
	.word	0xd65c417b	! t0_data_exp_shm_area+0xd8
	.word	0xef14d63a	! t0_data_exp_shm_area+0xdc
	.word	0xdd1dbb9a	! t0_data_exp_shm_area+0xe0
	.word	0x9a570a3b	! t0_data_exp_shm_area+0xe4
	.word	0x1d4603bb	! t0_data_exp_shm_area+0xe8
	.word	0xe867d990	! t0_data_exp_shm_area+0xec
	.word	0x67996976	! t0_data_exp_shm_area+0xf0
	.word	0x08fc1396	! t0_data_exp_shm_area+0xf4
	.word	0xc89e31aa	! t0_data_exp_shm_area+0xf8
	.word	0x5b4262f0	! t0_data_exp_shm_area+0xfc
	.word	0xb92c8f2b	! t0_data_exp_shm_area+0x100 (t1 bstore)
	.word	0xd92e86b1	! t0_data_exp_shm_area+0x104
	.word	0x877e45c5	! t0_data_exp_shm_area+0x108
	.word	0xf7eba32d	! t0_data_exp_shm_area+0x10c
	.word	0x3022cf6b	! t0_data_exp_shm_area+0x110
	.word	0x89a33a78	! t0_data_exp_shm_area+0x114
	.word	0xdaa2548c	! t0_data_exp_shm_area+0x118
	.word	0x15ea7d24	! t0_data_exp_shm_area+0x11c
	.word	0x21f503e6	! t0_data_exp_shm_area+0x120
	.word	0x3f3b5dbb	! t0_data_exp_shm_area+0x124
	.word	0x52b02350	! t0_data_exp_shm_area+0x128
	.word	0xfa3cb5ff	! t0_data_exp_shm_area+0x12c
	.word	0xccd5e248	! t0_data_exp_shm_area+0x130
	.word	0xa309eb0d	! t0_data_exp_shm_area+0x134
	.word	0x8cd85851	! t0_data_exp_shm_area+0x138
	.word	0xe39a65b8	! t0_data_exp_shm_area+0x13c
t0_data_exp_shm_area_end:
t0_data_exp_shm_area_stop:

!    kaos version   4.2
!    thread         1
!    icount         5000
!    targetid       NIAGARA:SIM
!    hostid         NIAGARA:5.8
!    areas          1
!    areasize       64
!    areaoffset     3008
!    ncache         0
!    emulate_ncache 1
!    pagesize       8192
!    invsize        0
!    codecount      5002
!    code           32a1c000
!    entry          32a1c000
!    fsr_exceptions 00000000
!    fsr_roundmode  00000004
!    fsr_mask       c0000fff
!    seed           d3d134afccd2
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

KTEXT_MODULE(t1_module_ktbl, 0x72a1c000)
.seg "text"
	KGLOBAL(t1_ktbl)
t1_ktbl_page_begin:
.global t1_kref; t1_kref:
	.skip 0
t1_ktbl:
	.word	0x9adac00a	! t1_kref+0x0:   	smulcc	%o3, %o2, %o5
	.word	0x9da2cd32	! t1_kref+0x4:   	fsmuld	%f11, %f18, %f14
	.word	0xd91fbea8	! t1_kref+0x8:   	ldd	[%fp - 0x158], %f12
	.word	0xa8aac009	! t1_kref+0xc:   	andncc	%o3, %o1, %l4
	.word	0xa872e39a	! t1_kref+0x10:   	udiv	%o3, 0x39a, %l4
	.word	0xd6b6501b	! t1_kref+0x14:   	stha	%o3, [%i1 + %i3]0x80
	.word	0x81db0000	! t1_kref+0x18:   	flush	%o4
	.word	0x9ba28822	! t1_kref+0x1c:   	fadds	%f10, %f2, %f13
	.word	0xa1a01912	! t1_kref+0x20:   	fitod	%f18, %f16
	.word	0xc12e7fe8	! t1_kref+0x24:   	st	%fsr, [%i1 - 0x18]
	.word	0xafb6c169	! t1_kref+0x28:   	edge32ln	%i3, %o1, %l7
	.word	0x9b40c000	! t1_kref+0x2c:   	mov	%asi, %o5
	.word	0x96adf7ab	! t1_kref+0x30:   	andncc	%l7, -0x855, %o3
	.word	0xd0767fe0	! t1_kref+0x34:   	stx	%o0, [%i1 - 0x20]
	.word	0x28480004	! t1_kref+0x38:   	bleu,a,pt	%icc, _kref+0x48
	.word	0xd210a024	! t1_kref+0x3c:   	lduh	[%g2 + 0x24], %o1
	.word	0x9af6c00c	! t1_kref+0x40:   	udivcc	%i3, %o4, %o5
	.word	0xacfef4ae	! t1_kref+0x44:   	sdivcc	%i3, -0xb52, %l6
	.word	0xac7eff38	! t1_kref+0x48:   	sdiv	%i3, -0xc8, %l6
	.word	0xf42e001a	! t1_kref+0x4c:   	stb	%i2, [%i0 + %i2]
	.word	0x99a18922	! t1_kref+0x50:   	fmuls	%f6, %f2, %f12
	.word	0xaf418000	! t1_kref+0x54:   	mov	%fprs, %l7
	.word	0x99b00c20	! t1_kref+0x58:   	fzeros	%f12
	.word	0x98e00000	! t1_kref+0x5c:   	subccc	%g0, %g0, %o4
	.word	0x81a28950	! t1_kref+0x60:   	fmuld	%f10, %f16, %f0
	.word	0xa1b28f44	! t1_kref+0x64:   	fornot1	%f10, %f4, %f16
	.word	0x96b836bf	! t1_kref+0x68:   	xnorcc	%g0, -0x941, %o3
	.word	0x81a10844	! t1_kref+0x6c:   	faddd	%f4, %f4, %f0
	.word	0x9b418000	! t1_kref+0x70:   	mov	%fprs, %o5
	.word	0x2b480006	! t1_kref+0x74:   	fbug,a,pt	%fcc0, _kref+0x8c
	.word	0x93a30924	! t1_kref+0x78:   	fmuls	%f12, %f4, %f9
	.word	0x98300008	! t1_kref+0x7c:   	orn	%g0, %o0, %o4
	.word	0x85b14d60	! t1_kref+0x80:   	fnot1s	%f5, %f2
	.word	0x85a28920	! t1_kref+0x84:   	fmuls	%f10, %f0, %f2
	.word	0xf6f75018	! t1_kref+0x88:   	stxa	%i3, [%i5 + %i0]0x80
	.word	0xd91e001d	! t1_kref+0x8c:   	ldd	[%i0 + %i5], %f12
	.word	0xd320a004	! t1_kref+0x90:   	st	%f9, [%g2 + 4]
	.word	0x89b206f0	! t1_kref+0x94:   	fmul8ulx16	%f8, %f16, %f4
	.word	0x81828000	! t1_kref+0x98:   	wr	%o2, %g0, %y
	.word	0x81abca25	! t1_kref+0x9c:   	fcmps	%fcc0, %f15, %f5
	.word	0x81db2d75	! t1_kref+0xa0:   	flush	%o4 + 0xd75
	.word	0xa81dc008	! t1_kref+0xa4:   	xor	%l7, %o0, %l4
	.word	0xec0e3ffb	! t1_kref+0xa8:   	ldub	[%i0 - 5], %l6
	.word	0x95b10662	! t1_kref+0xac:   	fmul8x16au	%f4, %f2, %f10
	.word	0xaa3dff1d	! t1_kref+0xb0:   	xnor	%l7, -0xe3, %l5
	.word	0x96f5c01a	! t1_kref+0xb4:   	udivcc	%l7, %i2, %o3
	.word	0x951aee82	! t1_kref+0xb8:   	tsubcctv	%o3, 0xe82, %o2
	.word	0xd008a01c	! t1_kref+0xbc:   	ldub	[%g2 + 0x1c], %o0
	.word	0x81b1098c	! t1_kref+0xc0:   	bshuffle	%f4, %f12, %f0
	.word	0xea48a03d	! t1_kref+0xc4:   	ldsb	[%g2 + 0x3d], %l5
	.word	0xac06c008	! t1_kref+0xc8:   	add	%i3, %o0, %l6
	.word	0x97a01a20	! t1_kref+0xcc:   	fstoi	%f0, %f11
	.word	0x9fc10000	! t1_kref+0xd0:   	call	%g4
	.word	0xc036c018	! t1_kref+0xd4:   	clrh	[%i3 + %i0]
	.word	0x91a2cd22	! t1_kref+0xd8:   	fsmuld	%f11, %f2, %f8
	.word	0xd51fbe38	! t1_kref+0xdc:   	ldd	[%fp - 0x1c8], %f10
	.word	0x92bb4009	! t1_kref+0xe0:   	xnorcc	%o5, %o1, %o1
	.word	0xd8080018	! t1_kref+0xe4:   	ldub	[%g0 + %i0], %o4
	.word	0x22480002	! t1_kref+0xe8:   	be,a,pt	%icc, _kref+0xf0
	.word	0xa1a38840	! t1_kref+0xec:   	faddd	%f14, %f0, %f16
	.word	0x9a42000c	! t1_kref+0xf0:   	addc	%o0, %o4, %o5
	.word	0x9292aee0	! t1_kref+0xf4:   	orcc	%o2, 0xee0, %o1
	.word	0xe56e401d	! t1_kref+0xf8:   	prefetch	%i1 + %i5, 18
	.word	0x3c480002	! t1_kref+0xfc:   	bpos,a,pt	%icc, _kref+0x104
	.word	0x90aa800b	! t1_kref+0x100:   	andncc	%o2, %o3, %o0
	.word	0x20480004	! t1_kref+0x104:   	bn,a,pt	%icc, _kref+0x114
	.word	0x973ea00a	! t1_kref+0x108:   	sra	%i2, 0xa, %o3
	.word	0x8da01911	! t1_kref+0x10c:   	fitod	%f17, %f6
	.word	0x89a00050	! t1_kref+0x110:   	fmovd	%f16, %f4
	.word	0x20480006	! t1_kref+0x114:   	bn,a,pt	%icc, _kref+0x12c
	.word	0x9042b15d	! t1_kref+0x118:   	addc	%o2, -0xea3, %o0
	call	SYM(t1_subr3)
	.word	0x8143c000	! t1_kref+0x120:   	stbar
	.word	0xa1a01910	! t1_kref+0x124:   	fitod	%f16, %f16
	.word	0x81a30850	! t1_kref+0x128:   	faddd	%f12, %f16, %f0
	.word	0xc300a03c	! t1_kref+0x12c:   	ld	[%g2 + 0x3c], %f1
	.word	0xd6062010	! t1_kref+0x130:   	ld	[%i0 + 0x10], %o3
	.word	0x9da00020	! t1_kref+0x134:   	fmovs	%f0, %f14
	.word	0xacbb39f5	! t1_kref+0x138:   	xnorcc	%o4, -0x60b, %l6
	.word	0x3d480001	! t1_kref+0x13c:   	fbule,a,pt	%fcc0, _kref+0x140
	.word	0xa9418000	! t1_kref+0x140:   	mov	%fprs, %l4
	.word	0xd278a034	! t1_kref+0x144:   	swap	[%g2 + 0x34], %o1
	.word	0xd020a00c	! t1_kref+0x148:   	st	%o0, [%g2 + 0xc]
	.word	0xaf40c000	! t1_kref+0x14c:   	mov	%asi, %l7
	.word	0x81b01021	! t1_kref+0x150:   	siam	0x1
	.word	0xaf400000	! t1_kref+0x154:   	mov	%y, %l7
	.word	0xd00e3fe9	! t1_kref+0x158:   	ldub	[%i0 - 0x17], %o0
	.word	0xd93e6000	! t1_kref+0x15c:   	std	%f12, [%i1]
	.word	0xcf871019	! t1_kref+0x160:   	lda	[%i4 + %i1]0x80, %f7
	.word	0xe3064000	! t1_kref+0x164:   	ld	[%i1], %f17
	.word	0xeafe501c	! t1_kref+0x168:   	swapa	[%i1 + %i4]0x80, %l5
	.word	0xabb30240	! t1_kref+0x16c:   	array16	%o4, %g0, %l5
	.word	0xac70001a	! t1_kref+0x170:   	udiv	%g0, %i2, %l6
	.word	0xee50a03e	! t1_kref+0x174:   	ldsh	[%g2 + 0x3e], %l7
	.word	0xa1a30d2f	! t1_kref+0x178:   	fsmuld	%f12, %f15, %f16
	.word	0x91b18f8c	! t1_kref+0x17c:   	for	%f6, %f12, %f8
	.word	0xc030a016	! t1_kref+0x180:   	clrh	[%g2 + 0x16]
	.word	0x9de3bfa0	! t1_kref+0x184:   	save	%sp, -0x60, %sp
	.word	0x93ee801c	! t1_kref+0x188:   	restore	%i2, %i4, %o1
	.word	0x86102016	! t1_kref+0x18c:   	mov	0x16, %g3
	.word	0x86a0e001	! t1_kref+0x190:   	subcc	%g3, 1, %g3
	.word	0x22800002	! t1_kref+0x194:   	be,a	_kref+0x19c
	.word	0x94bec009	! t1_kref+0x198:   	xnorcc	%i3, %o1, %o2
	.word	0x81df70b3	! t1_kref+0x19c:   	flush	%i5 - 0xf4d
	.word	0x81a98aca	! t1_kref+0x1a0:   	fcmped	%fcc0, %f6, %f10
	.word	0x95a01907	! t1_kref+0x1a4:   	fitod	%f7, %f10
	.word	0x89b38f44	! t1_kref+0x1a8:   	fornot1	%f14, %f4, %f4
	.word	0x90400008	! t1_kref+0x1ac:   	addc	%g0, %o0, %o0
	.word	0x3c480005	! t1_kref+0x1b0:   	bpos,a,pt	%icc, _kref+0x1c4
	.word	0xd808a00d	! t1_kref+0x1b4:   	ldub	[%g2 + 0xd], %o4
	.word	0xd856600c	! t1_kref+0x1b8:   	ldsh	[%i1 + 0xc], %o4
	.word	0x81da34b2	! t1_kref+0x1bc:   	flush	%o0 - 0xb4e
	.word	0x83a00121	! t1_kref+0x1c0:   	fabss	%f1, %f1
	.word	0x81580000	! t1_kref+0x1c4:   	flushw
	.word	0xd100a00c	! t1_kref+0x1c8:   	ld	[%g2 + 0xc], %f8
	.word	0x81a01902	! t1_kref+0x1cc:   	fitod	%f2, %f0
	.word	0xa802000d	! t1_kref+0x1d0:   	add	%o0, %o5, %l4
	.word	0xd01e3fe8	! t1_kref+0x1d4:   	ldd	[%i0 - 0x18], %o0
	.word	0xace2e4dd	! t1_kref+0x1d8:   	subccc	%o3, 0x4dd, %l6
	.word	0xf007bfe0	! t1_kref+0x1dc:   	ld	[%fp - 0x20], %i0
	.word	0xa1b306c4	! t1_kref+0x1e0:   	fmul8sux16	%f12, %f4, %f16
	.word	0x91a4094c	! t1_kref+0x1e4:   	fmuld	%f16, %f12, %f8
	.word	0x24480005	! t1_kref+0x1e8:   	ble,a,pt	%icc, _kref+0x1fc
	.word	0xac3de44a	! t1_kref+0x1ec:   	xnor	%l7, 0x44a, %l6
	.word	0x9242c017	! t1_kref+0x1f0:   	addc	%o3, %l7, %o1
	.word	0xa80dc008	! t1_kref+0x1f4:   	and	%l7, %o0, %l4
	.word	0xaf408000	! t1_kref+0x1f8:   	mov	%ccr, %l7
	.word	0x98328009	! t1_kref+0x1fc:   	orn	%o2, %o1, %o4
	.word	0xe520a02c	! t1_kref+0x200:   	st	%f18, [%g2 + 0x2c]
	.word	0x83a48929	! t1_kref+0x204:   	fmuls	%f18, %f9, %f1
	.word	0xee965000	! t1_kref+0x208:   	lduha	[%i1]0x80, %l7
	.word	0xd430a02c	! t1_kref+0x20c:   	sth	%o2, [%g2 + 0x2c]
	.word	0xe1be5000	! t1_kref+0x210:   	stda	%f16, [%i1]0x80
	.word	0xc398a0c0	! t1_kref+0x214:   	ldda	[%g2 + 0xc0]%asi, %f32
	.word	0x81dd8005	! t1_kref+0x218:   	flush	%l6 + %g5
	.word	0xd256c018	! t1_kref+0x21c:   	ldsh	[%i3 + %i0], %o1
	.word	0x9bb68040	! t1_kref+0x220:   	edge8l	%i2, %g0, %o5
	.word	0xf4200019	! t1_kref+0x224:   	st	%i2, [%g0 + %i1]
	.word	0xe86e8018	! t1_kref+0x228:   	ldstub	[%i2 + %i0], %l4
	.word	0xc91fbfb8	! t1_kref+0x22c:   	ldd	[%fp - 0x48], %f4
	.word	0xd9b81019	! t1_kref+0x230:   	stda	%f12, [%g0 + %i1]0x80
	.word	0x9a32001a	! t1_kref+0x234:   	orn	%o0, %i2, %o5
	.word	0xe0ff1018	! t1_kref+0x238:   	swapa	[%i4 + %i0]0x80, %l0
	.word	0x8143c000	! t1_kref+0x23c:   	stbar
	.word	0x9bb30200	! t1_kref+0x240:   	array8	%o4, %g0, %o5
	.word	0x81b08d60	! t1_kref+0x244:   	fnot1s	%f2, %f0
	.word	0x81b2cf61	! t1_kref+0x248:   	fornot1s	%f11, %f1, %f0
	.word	0x932ec009	! t1_kref+0x24c:   	sll	%i3, %o1, %o1
	.word	0x8da389d0	! t1_kref+0x250:   	fdivd	%f14, %f16, %f6
	.word	0xd100a034	! t1_kref+0x254:   	ld	[%g2 + 0x34], %f8
	.word	0x91b4866f	! t1_kref+0x258:   	fmul8x16au	%f18, %f15, %f8
	.word	0x86102003	! t1_kref+0x25c:   	mov	0x3, %g3
	.word	0x32800000	! t1_kref+0x260:   	bne,a	_kref+0x260
	.word	0x86a0e001	! t1_kref+0x264:   	subcc	%g3, 1, %g3
	.word	0xac12400b	! t1_kref+0x268:   	or	%o1, %o3, %l6
	.word	0xa1a01911	! t1_kref+0x26c:   	fitod	%f17, %f16
	.word	0xaa3ac008	! t1_kref+0x270:   	xnor	%o3, %o0, %l5
	.word	0x85b28720	! t1_kref+0x274:   	fmuld8ulx16	%f10, %f0, %f2
	.word	0x8bb0076a	! t1_kref+0x278:   	fpack16	%f10, %f5
	.word	0x8143c000	! t1_kref+0x27c:   	stbar
	.word	0x9b400000	! t1_kref+0x280:   	mov	%y, %o5
	.word	0x960021e3	! t1_kref+0x284:   	add	%g0, 0x1e3, %o3
	sethi	%hi(2f), %o7
	.word	0xe40be2a8	! t1_kref+0x28c:   	ldub	[%o7 + 0x2a8], %l2
	.word	0xa41ca00c	! t1_kref+0x290:   	xor	%l2, 0xc, %l2
	.word	0xe42be2a8	! t1_kref+0x294:   	stb	%l2, [%o7 + 0x2a8]
	.word	0x81dbe2a8	! t1_kref+0x298:   	flush	%o7 + 0x2a8
	.word	0xeb6e001d	! t1_kref+0x29c:   	prefetch	%i0 + %i5, 21
	.word	0xec3e401d	! t1_kref+0x2a0:   	std	%l6, [%i1 + %i5]
	.word	0x99336005	! t1_kref+0x2a4:   	srl	%o5, 0x5, %o4
2:	.word	0xdf262018	! t1_kref+0x2a8:   	st	%f15, [%i0 + 0x18]
	.word	0x95b00dc2	! t1_kref+0x2ac:   	fnand	%f0, %f2, %f10
	.word	0x8ba9c024	! t1_kref+0x2b0:   	fmovsu	%fcc0, %f4, %f5
	.word	0x93223723	! t1_kref+0x2b4:   	mulscc	%o0, -0x8dd, %o1
	.word	0x9a36a988	! t1_kref+0x2b8:   	orn	%i2, 0x988, %o5
	.word	0xda2e6001	! t1_kref+0x2bc:   	stb	%o5, [%i1 + 1]
	.word	0x93b4050e	! t1_kref+0x2c0:   	fcmpgt16	%f16, %f14, %o1
	.word	0x29480003	! t1_kref+0x2c4:   	fbl,a,pt	%fcc0, _kref+0x2d0
	.word	0xf6b6101b	! t1_kref+0x2c8:   	stha	%i3, [%i0 + %i3]0x80
	.word	0xa785c008	! t1_kref+0x2cc:   	wr	%l7, %o0, %gsr
	.word	0x948a76ca	! t1_kref+0x2d0:   	andcc	%o1, -0x936, %o2
	.word	0x81ddff60	! t1_kref+0x2d4:   	flush	%l7 - 0xa0
	.word	0x8da08844	! t1_kref+0x2d8:   	faddd	%f2, %f4, %f6
	.word	0x85b20628	! t1_kref+0x2dc:   	fmul8x16	%f8, %f8, %f2
	.word	0x969ef343	! t1_kref+0x2e0:   	xorcc	%i3, -0xcbd, %o3
	.word	0x95b30ac4	! t1_kref+0x2e4:   	fpsub32	%f12, %f4, %f10
	.word	0xabb6c008	! t1_kref+0x2e8:   	edge8	%i3, %o0, %l5
	.word	0x92e2001b	! t1_kref+0x2ec:   	subccc	%o0, %i3, %o1
	.word	0xc91fbee0	! t1_kref+0x2f0:   	ldd	[%fp - 0x120], %f4
	.word	0x91a34825	! t1_kref+0x2f4:   	fadds	%f13, %f5, %f8
	.word	0xa8a0337a	! t1_kref+0x2f8:   	subcc	%g0, -0xc86, %l4
	.word	0x25480005	! t1_kref+0x2fc:   	fblg,a,pt	%fcc0, _kref+0x310
	.word	0xf630a02e	! t1_kref+0x300:   	sth	%i3, [%g2 + 0x2e]
	.word	0xe8470019	! t1_kref+0x304:   	ldsw	[%i4 + %i1], %l4
	.word	0xe878a034	! t1_kref+0x308:   	swap	[%g2 + 0x34], %l4
	.word	0xa5a00552	! t1_kref+0x30c:   	fsqrtd	%f18, %f18
	.word	0x39480005	! t1_kref+0x310:   	fbuge,a,pt	%fcc0, _kref+0x324
	.word	0xd2062014	! t1_kref+0x314:   	ld	[%i0 + 0x14], %o1
	.word	0x99a08846	! t1_kref+0x318:   	faddd	%f2, %f6, %f12
	.word	0x24480003	! t1_kref+0x31c:   	ble,a,pt	%icc, _kref+0x328
	.word	0xa5b38900	! t1_kref+0x320:   	faligndata	%f14, %f0, %f18
	.word	0xaaa2b57f	! t1_kref+0x324:   	subcc	%o2, -0xa81, %l5
	.word	0x3b480003	! t1_kref+0x328:   	fble,a,pt	%fcc0, _kref+0x334
	.word	0xaeaae886	! t1_kref+0x32c:   	andncc	%o3, 0x886, %l7
	.word	0x81a14d24	! t1_kref+0x330:   	fsmuld	%f5, %f4, %f0
	.word	0x91b4054c	! t1_kref+0x334:   	fcmpeq16	%f16, %f12, %o0
	.word	0x81a00048	! t1_kref+0x338:   	fmovd	%f8, %f0
	.word	0xe4380019	! t1_kref+0x33c:   	std	%l2, [%g0 + %i1]
	.word	0xd82e8018	! t1_kref+0x340:   	stb	%o4, [%i2 + %i0]
	.word	0x9fa00131	! t1_kref+0x344:   	fabss	%f17, %f15
	.word	0xc520a02c	! t1_kref+0x348:   	st	%f2, [%g2 + 0x2c]
	.word	0x95a00d20	! t1_kref+0x34c:   	fsmuld	%f0, %f0, %f10
	.word	0xa1b20988	! t1_kref+0x350:   	bshuffle	%f8, %f8, %f16
	.word	0x9102800a	! t1_kref+0x354:   	taddcc	%o2, %o2, %o0
	.word	0x97418000	! t1_kref+0x358:   	mov	%fprs, %o3
	.word	0x85a000a5	! t1_kref+0x35c:   	fnegs	%f5, %f2
	.word	0xadb3410b	! t1_kref+0x360:   	edge32	%o5, %o3, %l6
	.word	0xc9264000	! t1_kref+0x364:   	st	%f4, [%i1]
	.word	0xabb28592	! t1_kref+0x368:   	fcmpgt32	%f10, %f18, %l5
	.word	0xa88a001a	! t1_kref+0x36c:   	andcc	%o0, %i2, %l4
	.word	0xad224008	! t1_kref+0x370:   	mulscc	%o1, %o0, %l6
	.word	0x2a480008	! t1_kref+0x374:   	bcs,a,pt	%icc, _kref+0x394
	.word	0xdd20a024	! t1_kref+0x378:   	st	%f14, [%g2 + 0x24]
	.word	0xd836c018	! t1_kref+0x37c:   	sth	%o4, [%i3 + %i0]
	.word	0xa1a0192e	! t1_kref+0x380:   	fstod	%f14, %f16
	.word	0xe11fbed8	! t1_kref+0x384:   	ldd	[%fp - 0x128], %f16
	.word	0xd84e201c	! t1_kref+0x388:   	ldsb	[%i0 + 0x1c], %o4
	.word	0x9486800a	! t1_kref+0x38c:   	addcc	%i2, %o2, %o2
	.word	0x95a00550	! t1_kref+0x390:   	fsqrtd	%f16, %f10
	.word	0x97b5c30c	! t1_kref+0x394:   	alignaddr	%l7, %o4, %o3
	.word	0xd420a024	! t1_kref+0x398:   	st	%o2, [%g2 + 0x24]
	.word	0x97100000	! t1_kref+0x39c:   	taddcctv	%g0, %g0, %o3
	.word	0xa81b621f	! t1_kref+0x3a0:   	xor	%o5, 0x21f, %l4
	.word	0xe51e2018	! t1_kref+0x3a4:   	ldd	[%i0 + 0x18], %f18
	.word	0x28800007	! t1_kref+0x3a8:   	bleu,a	_kref+0x3c4
	.word	0xef6e7fe8	! t1_kref+0x3ac:   	prefetch	%i1 - 0x18, 23
	.word	0x87a018ce	! t1_kref+0x3b0:   	fdtos	%f14, %f3
	.word	0x81a00552	! t1_kref+0x3b4:   	fsqrtd	%f18, %f0
	.word	0x95b3890e	! t1_kref+0x3b8:   	faligndata	%f14, %f14, %f10
	.word	0xacd5e57e	! t1_kref+0x3bc:   	umulcc	%l7, 0x57e, %l6
	.word	0x93b2c280	! t1_kref+0x3c0:   	array32	%o3, %g0, %o1
	.word	0x24480005	! t1_kref+0x3c4:   	ble,a,pt	%icc, _kref+0x3d8
	.word	0x97418000	! t1_kref+0x3c8:   	mov	%fprs, %o3
	.word	0xe1be1a5c	! t1_kref+0x3cc:   	stda	%f16, [%i0 + %i4]0xd2
	.word	0x96782745	! t1_kref+0x3d0:   	sdiv	%g0, 0x745, %o3
	.word	0xae8dc01a	! t1_kref+0x3d4:   	andcc	%l7, %i2, %l7
	.word	0x927ac00a	! t1_kref+0x3d8:   	sdiv	%o3, %o2, %o1
	.word	0x93a01a2b	! t1_kref+0x3dc:   	fstoi	%f11, %f9
	.word	0xd06e2019	! t1_kref+0x3e0:   	ldstub	[%i0 + 0x19], %o0
	.word	0xaea5c008	! t1_kref+0x3e4:   	subcc	%l7, %o0, %l7
	.word	0x97418000	! t1_kref+0x3e8:   	mov	%fprs, %o3
	.word	0x9da0110e	! t1_kref+0x3ec:   	fxtod	%f14, %f14
	.word	0xc5380018	! t1_kref+0x3f0:   	std	%f2, [%g0 + %i0]
	.word	0x9b400000	! t1_kref+0x3f4:   	mov	%y, %o5
	.word	0xaf400000	! t1_kref+0x3f8:   	mov	%y, %l7
	.word	0x34480005	! t1_kref+0x3fc:   	bg,a,pt	%icc, _kref+0x410
	.word	0x956623a9	! t1_kref+0x400:   	mova	%icc, 0x3a9, %o2
	.word	0x85a048ab	! t1_kref+0x404:   	fsubs	%f1, %f11, %f2
	.word	0x2d480001	! t1_kref+0x408:   	fbg,a,pt	%fcc0, _kref+0x40c
	.word	0x8fa00532	! t1_kref+0x40c:   	fsqrts	%f18, %f7
	.word	0x2e800004	! t1_kref+0x410:   	bvs,a	_kref+0x420
	.word	0x9423400a	! t1_kref+0x414:   	sub	%o5, %o2, %o2
	.word	0x81a88a27	! t1_kref+0x418:   	fcmps	%fcc0, %f2, %f7
	.word	0x95b3054e	! t1_kref+0x41c:   	fcmpeq16	%f12, %f14, %o2
	.word	0xc807bfe8	! t1_kref+0x420:   	ld	[%fp - 0x18], %g4
	.word	0xd2270019	! t1_kref+0x424:   	st	%o1, [%i4 + %i1]
	.word	0xd2563fe2	! t1_kref+0x428:   	ldsh	[%i0 - 0x1e], %o1
	.word	0xe3b8a100	! t1_kref+0x42c:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0x9fc00004	! t1_kref+0x430:   	call	%g0 + %g4
	.word	0x9da01a30	! t1_kref+0x434:   	fstoi	%f16, %f14
	.word	0x9de3bfa0	! t1_kref+0x438:   	save	%sp, -0x60, %sp
	.word	0xadee32c5	! t1_kref+0x43c:   	restore	%i0, -0xd3b, %l6
	.word	0xaab2e311	! t1_kref+0x440:   	orncc	%o3, 0x311, %l5
	.word	0xd428a03f	! t1_kref+0x444:   	stb	%o2, [%g2 + 0x3f]
	.word	0xaeaac00c	! t1_kref+0x448:   	andncc	%o3, %o4, %l7
	.word	0x81a289c4	! t1_kref+0x44c:   	fdivd	%f10, %f4, %f0
	.word	0xda28a004	! t1_kref+0x450:   	stb	%o5, [%g2 + 4]
	.word	0x81b20d40	! t1_kref+0x454:   	fnot1	%f8, %f0
	.word	0x99a84026	! t1_kref+0x458:   	fmovsne	%fcc0, %f6, %f12
	.word	0xe520a024	! t1_kref+0x45c:   	st	%f18, [%g2 + 0x24]
	.word	0x8610201f	! t1_kref+0x460:   	mov	0x1f, %g3
	.word	0x86a0e001	! t1_kref+0x464:   	subcc	%g3, 1, %g3
	.word	0x22800017	! t1_kref+0x468:   	be,a	_kref+0x4c4
	.word	0x9882401a	! t1_kref+0x46c:   	addcc	%o1, %i2, %o4
	.word	0x98a834e1	! t1_kref+0x470:   	andncc	%g0, -0xb1f, %o4
	.word	0x9692c008	! t1_kref+0x474:   	orcc	%o3, %o0, %o3
	.word	0xe1b81018	! t1_kref+0x478:   	stda	%f16, [%g0 + %i0]0x80
	.word	0xd050a034	! t1_kref+0x47c:   	ldsh	[%g2 + 0x34], %o0
	.word	0xae5836df	! t1_kref+0x480:   	smul	%g0, -0x921, %l7
	.word	0xa93a200e	! t1_kref+0x484:   	sra	%o0, 0xe, %l4
	.word	0x98dae29f	! t1_kref+0x488:   	smulcc	%o3, 0x29f, %o4
	.word	0xec6e0000	! t1_kref+0x48c:   	ldstub	[%i0], %l6
	.word	0xd6064000	! t1_kref+0x490:   	ld	[%i1], %o3
	.word	0xe2116a40	! t1_kref+0x494:   	lduh	[%g5 + 0xa40], %l1
	.word	0xaf3a400c	! t1_kref+0x498:   	sra	%o1, %o4, %l7
	.word	0x9a1a800b	! t1_kref+0x49c:   	xor	%o2, %o3, %o5
	.word	0xa83b0009	! t1_kref+0x4a0:   	xnor	%o4, %o1, %l4
	.word	0xa5b18d40	! t1_kref+0x4a4:   	fnot1	%f6, %f18
	.word	0xa1b00762	! t1_kref+0x4a8:   	fpack16	%f2, %f16
	.word	0xa3a00124	! t1_kref+0x4ac:   	fabss	%f4, %f17
	.word	0x9363e47a	! t1_kref+0x4b0:   	movo	%fcc0, -0x386, %o1
	.word	0xd220a03c	! t1_kref+0x4b4:   	st	%o1, [%g2 + 0x3c]
	.word	0x96328009	! t1_kref+0x4b8:   	orn	%o2, %o1, %o3
	.word	0xf420a004	! t1_kref+0x4bc:   	st	%i2, [%g2 + 4]
	.word	0xc398a0c0	! t1_kref+0x4c0:   	ldda	[%g2 + 0xc0]%asi, %f32
	.word	0xf62e2001	! t1_kref+0x4c4:   	stb	%i3, [%i0 + 1]
	.word	0xd4070018	! t1_kref+0x4c8:   	ld	[%i4 + %i0], %o2
	.word	0x91b5c0fb	! t1_kref+0x4cc:   	edge16ln	%l7, %i3, %o0
	.word	0xaa3360a9	! t1_kref+0x4d0:   	orn	%o5, 0xa9, %l5
	.word	0x8fa01a31	! t1_kref+0x4d4:   	fstoi	%f17, %f7
	.word	0xda0e600e	! t1_kref+0x4d8:   	ldub	[%i1 + 0xe], %o5
	.word	0x99b006ec	! t1_kref+0x4dc:   	fmul8ulx16	%f0, %f12, %f12
	.word	0xa1a24922	! t1_kref+0x4e0:   	fmuls	%f9, %f2, %f16
	.word	0x99b306cc	! t1_kref+0x4e4:   	fmul8sux16	%f12, %f12, %f12
	.word	0x9285e949	! t1_kref+0x4e8:   	addcc	%l7, 0x949, %o1
	.word	0x927eb84d	! t1_kref+0x4ec:   	sdiv	%i2, -0x7b3, %o1
	.word	0xaf400000	! t1_kref+0x4f0:   	mov	%y, %l7
	.word	0x8da0190e	! t1_kref+0x4f4:   	fitod	%f14, %f6
	.word	0xec3e3fe8	! t1_kref+0x4f8:   	std	%l6, [%i0 - 0x18]
	.word	0x34480002	! t1_kref+0x4fc:   	bg,a,pt	%icc, _kref+0x504
	.word	0x9525c017	! t1_kref+0x500:   	mulscc	%l7, %l7, %o2
	.word	0x81ab0ac8	! t1_kref+0x504:   	fcmped	%fcc0, %f12, %f8
	.word	0xec380018	! t1_kref+0x508:   	std	%l6, [%g0 + %i0]
	.word	0x8da0190b	! t1_kref+0x50c:   	fitod	%f11, %f6
	.word	0x949de9c7	! t1_kref+0x510:   	xorcc	%l7, 0x9c7, %o2
	.word	0x95380009	! t1_kref+0x514:   	sra	%g0, %o1, %o2
	.word	0x9692e33b	! t1_kref+0x518:   	orcc	%o3, 0x33b, %o3
	.word	0xaefee498	! t1_kref+0x51c:   	sdivcc	%i3, 0x498, %l7
	.word	0x9870000c	! t1_kref+0x520:   	udiv	%g0, %o4, %o4
	.word	0x96b34000	! t1_kref+0x524:   	orncc	%o5, %g0, %o3
	.word	0x90c32281	! t1_kref+0x528:   	addccc	%o4, 0x281, %o0
	.word	0xaeab001b	! t1_kref+0x52c:   	andncc	%o4, %i3, %l7
	.word	0xee4e8019	! t1_kref+0x530:   	ldsb	[%i2 + %i1], %l7
	.word	0x85a000aa	! t1_kref+0x534:   	fnegs	%f10, %f2
	.word	0xdf06001c	! t1_kref+0x538:   	ld	[%i0 + %i4], %f15
	.word	0xe3b8a100	! t1_kref+0x53c:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0xc0b65000	! t1_kref+0x540:   	stha	%g0, [%i1]0x80
	.word	0x99a0054a	! t1_kref+0x544:   	fsqrtd	%f10, %f12
	.word	0xd8363fe4	! t1_kref+0x548:   	sth	%o4, [%i0 - 0x1c]
	.word	0xd236001b	! t1_kref+0x54c:   	sth	%o1, [%i0 + %i3]
	.word	0x99b30ab0	! t1_kref+0x550:   	fpsub16s	%f12, %f16, %f12
	.word	0xa8168008	! t1_kref+0x554:   	or	%i2, %o0, %l4
	.word	0xcd9e101d	! t1_kref+0x558:   	ldda	[%i0 + %i5]0x80, %f6
	.word	0xcb00a034	! t1_kref+0x55c:   	ld	[%g2 + 0x34], %f5
	.word	0xe808a036	! t1_kref+0x560:   	ldub	[%g2 + 0x36], %l4
	.word	0x29480006	! t1_kref+0x564:   	fbl,a,pt	%fcc0, _kref+0x57c
	.word	0xd0060000	! t1_kref+0x568:   	ld	[%i0], %o0
	.word	0x8bb1ca2d	! t1_kref+0x56c:   	fpadd16s	%f7, %f13, %f5
	.word	0x85a0192f	! t1_kref+0x570:   	fstod	%f15, %f2
	.word	0xebee501c	! t1_kref+0x574:   	prefetcha	%i1 + %i4, 21
	.word	0xec3e7ff0	! t1_kref+0x578:   	std	%l6, [%i1 - 0x10]
	.word	0x91b18703	! t1_kref+0x57c:   	fmuld8sux16	%f6, %f3, %f8
	.word	0xd430a006	! t1_kref+0x580:   	sth	%o2, [%g2 + 6]
	.word	0xac93400c	! t1_kref+0x584:   	orcc	%o5, %o4, %l6
	.word	0x2d480002	! t1_kref+0x588:   	fbg,a,pt	%fcc0, _kref+0x590
	.word	0x93a38827	! t1_kref+0x58c:   	fadds	%f14, %f7, %f9
	.word	0xa782683d	! t1_kref+0x590:   	wr	%o1, 0x83d, %gsr
	.word	0xda263ff8	! t1_kref+0x594:   	st	%o5, [%i0 - 8]
	.word	0x97b2404c	! t1_kref+0x598:   	edge8l	%o1, %o4, %o3
	.word	0x85b10dc8	! t1_kref+0x59c:   	fnand	%f4, %f8, %f2
	.word	0x92bea276	! t1_kref+0x5a0:   	xnorcc	%i2, 0x276, %o1
	.word	0xd450a03e	! t1_kref+0x5a4:   	ldsh	[%g2 + 0x3e], %o2
	.word	0x87b007ae	! t1_kref+0x5a8:   	fpackfix	%f14, %f3
	.word	0x949b401a	! t1_kref+0x5ac:   	xorcc	%o5, %i2, %o2
	.word	0x8143c000	! t1_kref+0x5b0:   	stbar
	.word	0xa85a3146	! t1_kref+0x5b4:   	smul	%o0, -0xeba, %l4
	.word	0xaa5a4009	! t1_kref+0x5b8:   	smul	%o1, %o1, %l5
	.word	0x3f480007	! t1_kref+0x5bc:   	fbo,a,pt	%fcc0, _kref+0x5d8
	.word	0xc3066000	! t1_kref+0x5c0:   	ld	[%i1], %f1
	.word	0x8ba0c923	! t1_kref+0x5c4:   	fmuls	%f3, %f3, %f5
	.word	0x89a00540	! t1_kref+0x5c8:   	fsqrtd	%f0, %f4
	.word	0xd60e7ff9	! t1_kref+0x5cc:   	ldub	[%i1 - 7], %o3
	.word	0x81b386c2	! t1_kref+0x5d0:   	fmul8sux16	%f14, %f2, %f0
	.word	0x97a0012a	! t1_kref+0x5d4:   	fabss	%f10, %f11
	.word	0x8143e05d	! t1_kref+0x5d8:   	membar	0x5d
	.word	0x92aa7c93	! t1_kref+0x5dc:   	andncc	%o1, -0x36d, %o1
	.word	0x9f414000	! t1_kref+0x5e0:   	mov	%pc, %o7
	.word	0xd820a01c	! t1_kref+0x5e4:   	st	%o4, [%g2 + 0x1c]
	.word	0x81b01024	! t1_kref+0x5e8:   	siam	0x4
	.word	0x91b185cc	! t1_kref+0x5ec:   	fcmpeq32	%f6, %f12, %o0
	.word	0x9bb280ed	! t1_kref+0x5f0:   	edge16ln	%o2, %o5, %o5
	.word	0x91a00130	! t1_kref+0x5f4:   	fabss	%f16, %f8
	.word	0xd0901019	! t1_kref+0x5f8:   	lduha	[%g0 + %i1]0x80, %o0
	.word	0x22480002	! t1_kref+0x5fc:   	be,a,pt	%icc, _kref+0x604
	.word	0x97400000	! t1_kref+0x600:   	mov	%y, %o3
	.word	0x9492fa6c	! t1_kref+0x604:   	orcc	%o3, -0x594, %o2
	.word	0xa3a0012e	! t1_kref+0x608:   	fabss	%f14, %f17
	.word	0x30480002	! t1_kref+0x60c:   	ba,a,pt	%icc, _kref+0x614
	.word	0x9bb20129	! t1_kref+0x610:   	edge32n	%o0, %o1, %o5
	.word	0xe43e7fe0	! t1_kref+0x614:   	std	%l2, [%i1 - 0x20]
	.word	0x97b5c12a	! t1_kref+0x618:   	edge32n	%l7, %o2, %o3
	.word	0x2a480001	! t1_kref+0x61c:   	bcs,a,pt	%icc, _kref+0x620
	.word	0xc93e2018	! t1_kref+0x620:   	std	%f4, [%i0 + 0x18]
	.word	0x81a90a2f	! t1_kref+0x624:   	fcmps	%fcc0, %f4, %f15
	.word	0xd82e8018	! t1_kref+0x628:   	stb	%o4, [%i2 + %i0]
	.word	0x3d480006	! t1_kref+0x62c:   	fbule,a,pt	%fcc0, _kref+0x644
	.word	0x9da3094c	! t1_kref+0x630:   	fmuld	%f12, %f12, %f14
	.word	0x94d6e7d2	! t1_kref+0x634:   	umulcc	%i3, 0x7d2, %o2
	.word	0x91a0054a	! t1_kref+0x638:   	fsqrtd	%f10, %f8
	.word	0x24800003	! t1_kref+0x63c:   	ble,a	_kref+0x648
	.word	0x98bec01a	! t1_kref+0x640:   	xnorcc	%i3, %i2, %o4
	.word	0x932aa009	! t1_kref+0x644:   	sll	%o2, 0x9, %o1
	.word	0x96aebf01	! t1_kref+0x648:   	andncc	%i2, -0xff, %o3
	.word	0xcb062004	! t1_kref+0x64c:   	ld	[%i0 + 4], %f5
	.word	0x89b4862c	! t1_kref+0x650:   	fmul8x16	%f18, %f12, %f4
	.word	0x3f480006	! t1_kref+0x654:   	fbo,a,pt	%fcc0, _kref+0x66c
	.word	0xaa700017	! t1_kref+0x658:   	udiv	%g0, %l7, %l5
	.word	0x95b38a4a	! t1_kref+0x65c:   	fpadd32	%f14, %f10, %f10
	.word	0x91400000	! t1_kref+0x660:   	mov	%y, %o0
	.word	0xcd1e2008	! t1_kref+0x664:   	ldd	[%i0 + 8], %f6
	.word	0x9fa0012a	! t1_kref+0x668:   	fabss	%f10, %f15
	.word	0xd6166012	! t1_kref+0x66c:   	lduh	[%i1 + 0x12], %o3
	.word	0xa866800a	! t1_kref+0x670:   	subc	%i2, %o2, %l4
	.word	0xd1263ff4	! t1_kref+0x674:   	st	%f8, [%i0 - 0xc]
	.word	0xec50a026	! t1_kref+0x678:   	ldsh	[%g2 + 0x26], %l6
	.word	0x97a01a27	! t1_kref+0x67c:   	fstoi	%f7, %f11
	.word	0xa5a2884e	! t1_kref+0x680:   	faddd	%f10, %f14, %f18
	.word	0x985ac00a	! t1_kref+0x684:   	smul	%o3, %o2, %o4
	.word	0x98e36f76	! t1_kref+0x688:   	subccc	%o5, 0xf76, %o4
	.word	0xc030a004	! t1_kref+0x68c:   	clrh	[%g2 + 4]
	.word	0x912ee018	! t1_kref+0x690:   	sll	%i3, 0x18, %o0
	.word	0xda28a015	! t1_kref+0x694:   	stb	%o5, [%g2 + 0x15]
	.word	0xec066014	! t1_kref+0x698:   	ld	[%i1 + 0x14], %l6
	.word	0xd0901019	! t1_kref+0x69c:   	lduha	[%g0 + %i1]0x80, %o0
	.word	0x89b40d40	! t1_kref+0x6a0:   	fnot1	%f16, %f4
	.word	0x89a01903	! t1_kref+0x6a4:   	fitod	%f3, %f4
	.word	0x8ba289a2	! t1_kref+0x6a8:   	fdivs	%f10, %f2, %f5
	.word	0x89a3082f	! t1_kref+0x6ac:   	fadds	%f12, %f15, %f4
	.word	0xcb262014	! t1_kref+0x6b0:   	st	%f5, [%i0 + 0x14]
	.word	0xf207bfe0	! t1_kref+0x6b4:   	ld	[%fp - 0x20], %i1
	.word	0x9402c00b	! t1_kref+0x6b8:   	add	%o3, %o3, %o2
	.word	0x99b40a06	! t1_kref+0x6bc:   	fpadd16	%f16, %f6, %f12
	.word	0x8da00944	! t1_kref+0x6c0:   	fmuld	%f0, %f4, %f6
	.word	0x91b30dc8	! t1_kref+0x6c4:   	fnand	%f12, %f8, %f8
	.word	0xd1be589a	! t1_kref+0x6c8:   	stda	%f8, [%i1 + %i2]0xc4
	.word	0x99b00a46	! t1_kref+0x6cc:   	fpadd32	%f0, %f6, %f12
	.word	0x2e480008	! t1_kref+0x6d0:   	bvs,a,pt	%icc, _kref+0x6f0
	.word	0xec1f4018	! t1_kref+0x6d4:   	ldd	[%i5 + %i0], %l6
	.word	0x9bb28a6a	! t1_kref+0x6d8:   	fpadd32s	%f10, %f10, %f13
	.word	0x9bb14d24	! t1_kref+0x6dc:   	fandnot1s	%f5, %f4, %f13
	.word	0x98ab6b27	! t1_kref+0x6e0:   	andncc	%o5, 0xb27, %o4
	.word	0xaa1022ad	! t1_kref+0x6e4:   	mov	0x2ad, %l5
	.word	0x81b20e46	! t1_kref+0x6e8:   	fxnor	%f8, %f6, %f0
	.word	0x93a10829	! t1_kref+0x6ec:   	fadds	%f4, %f9, %f9
	.word	0x32480004	! t1_kref+0x6f0:   	bne,a,pt	%icc, _kref+0x700
	.word	0x9a880008	! t1_kref+0x6f4:   	andcc	%g0, %o0, %o5
	.word	0x20480002	! t1_kref+0x6f8:   	bn,a,pt	%icc, _kref+0x700
	.word	0x99400000	! t1_kref+0x6fc:   	mov	%y, %o4
	.word	0xa9b240f7	! t1_kref+0x700:   	edge16ln	%o1, %l7, %l4
	.word	0x23480007	! t1_kref+0x704:   	fbne,a,pt	%fcc0, _kref+0x720
	.word	0xec0e3fe4	! t1_kref+0x708:   	ldub	[%i0 - 0x1c], %l6
	.word	0xd230a036	! t1_kref+0x70c:   	sth	%o1, [%g2 + 0x36]
	.word	0x99a009c8	! t1_kref+0x710:   	fdivd	%f0, %f8, %f12
	.word	0x9b636554	! t1_kref+0x714:   	movle	%fcc0, -0x2ac, %o5
	.word	0x8fa1c828	! t1_kref+0x718:   	fadds	%f7, %f8, %f7
	.word	0xc3264000	! t1_kref+0x71c:   	st	%f1, [%i1]
	.word	0x9db00dc6	! t1_kref+0x720:   	fnand	%f0, %f6, %f14
	.word	0xd8360000	! t1_kref+0x724:   	sth	%o4, [%i0]
	.word	0x27480002	! t1_kref+0x728:   	fbul,a,pt	%fcc0, _kref+0x730
	.word	0x85a10850	! t1_kref+0x72c:   	faddd	%f4, %f16, %f2
	.word	0x89a20952	! t1_kref+0x730:   	fmuld	%f8, %f18, %f4
	.word	0xae3df59e	! t1_kref+0x734:   	xnor	%l7, -0xa62, %l7
	.word	0x9ae3363d	! t1_kref+0x738:   	subccc	%o4, -0x9c3, %o5
	.word	0xad3a4009	! t1_kref+0x73c:   	sra	%o1, %o1, %l6
	.word	0x81b20ec8	! t1_kref+0x740:   	fornot2	%f8, %f8, %f0
	.word	0x96fdf04d	! t1_kref+0x744:   	sdivcc	%l7, -0xfb3, %o3
	.word	0xa1a018ca	! t1_kref+0x748:   	fdtos	%f10, %f16
	.word	0x89b08c82	! t1_kref+0x74c:   	fandnot2	%f2, %f2, %f4
	.word	0x27480007	! t1_kref+0x750:   	fbul,a,pt	%fcc0, _kref+0x76c
	.word	0xee28a02f	! t1_kref+0x754:   	stb	%l7, [%g2 + 0x2f]
	.word	0x99b5c200	! t1_kref+0x758:   	array8	%l7, %g0, %o4
	.word	0xa5a18d2e	! t1_kref+0x75c:   	fsmuld	%f6, %f14, %f18
	.word	0x91a018ca	! t1_kref+0x760:   	fdtos	%f10, %f8
	.word	0x93a0882d	! t1_kref+0x764:   	fadds	%f2, %f13, %f9
	.word	0x9fc10000	! t1_kref+0x768:   	call	%g4
	.word	0x90bb0009	! t1_kref+0x76c:   	xnorcc	%o4, %o1, %o0
	.word	0xd8364000	! t1_kref+0x770:   	sth	%o4, [%i1]
	.word	0xacc27eb5	! t1_kref+0x774:   	addccc	%o1, -0x14b, %l6
	.word	0xd44e401a	! t1_kref+0x778:   	ldsb	[%i1 + %i2], %o2
	.word	0xae237f50	! t1_kref+0x77c:   	sub	%o5, -0xb0, %l7
	.word	0xd19f1a58	! t1_kref+0x780:   	ldda	[%i4 + %i0]0xd2, %f8
	.word	0xa1a000d2	! t1_kref+0x784:   	fnegd	%f18, %f16
	.word	0xa5a000a9	! t1_kref+0x788:   	fnegs	%f9, %f18
	.word	0xd9be188a	! t1_kref+0x78c:   	stda	%f12, [%i0 + %o2]0xc4
	.word	0x3a480008	! t1_kref+0x790:   	bcc,a,pt	%icc, _kref+0x7b0
	.word	0x81b10c84	! t1_kref+0x794:   	fandnot2	%f4, %f4, %f0
	.word	0x900b000b	! t1_kref+0x798:   	and	%o4, %o3, %o0
	.word	0xac783c25	! t1_kref+0x79c:   	sdiv	%g0, -0x3db, %l6
	.word	0xae7ec017	! t1_kref+0x7a0:   	sdiv	%i3, %l7, %l7
	.word	0xd04e7ff7	! t1_kref+0x7a4:   	ldsb	[%i1 - 9], %o0
	.word	0x87b007ae	! t1_kref+0x7a8:   	fpackfix	%f14, %f3
	.word	0xaa630008	! t1_kref+0x7ac:   	subc	%o4, %o0, %l5
	.word	0xea0e4000	! t1_kref+0x7b0:   	ldub	[%i1], %l5
	.word	0xd220a03c	! t1_kref+0x7b4:   	st	%o1, [%g2 + 0x3c]
	.word	0x28480007	! t1_kref+0x7b8:   	bleu,a,pt	%icc, _kref+0x7d4
	.word	0xd8360000	! t1_kref+0x7bc:   	sth	%o4, [%i0]
	.word	0xd22e001a	! t1_kref+0x7c0:   	stb	%o1, [%i0 + %i2]
	.word	0xac92f6d4	! t1_kref+0x7c4:   	orcc	%o3, -0x92c, %l6
	.word	0xf6300019	! t1_kref+0x7c8:   	sth	%i3, [%g0 + %i1]
	.word	0x81a00540	! t1_kref+0x7cc:   	fsqrtd	%f0, %f0
	.word	0x95a01923	! t1_kref+0x7d0:   	fstod	%f3, %f10
	.word	0xa5a20942	! t1_kref+0x7d4:   	fmuld	%f8, %f2, %f18
	.word	0xa5a18d2e	! t1_kref+0x7d8:   	fsmuld	%f6, %f14, %f18
	.word	0x28480003	! t1_kref+0x7dc:   	bleu,a,pt	%icc, _kref+0x7e8
	.word	0xec3e7fe0	! t1_kref+0x7e0:   	std	%l6, [%i1 - 0x20]
	.word	0xa3a34824	! t1_kref+0x7e4:   	fadds	%f13, %f4, %f17
	.word	0x9a58000d	! t1_kref+0x7e8:   	smul	%g0, %o5, %o5
	sethi	%hi(2f), %o7
	.word	0xe40be02c	! t1_kref+0x7f0:   	ldub	[%o7 + 0x2c], %l2
	.word	0xa41ca00c	! t1_kref+0x7f4:   	xor	%l2, 0xc, %l2
	.word	0xe42be02c	! t1_kref+0x7f8:   	stb	%l2, [%o7 + 0x2c]
	.word	0x81dbe02c	! t1_kref+0x7fc:   	flush	%o7 + 0x2c
	.word	0x8da3884a	! t1_kref+0x800:   	faddd	%f14, %f10, %f6
	.word	0xa1b18e44	! t1_kref+0x804:   	fxnor	%f6, %f4, %f16
	.word	0x85a0192d	! t1_kref+0x808:   	fstod	%f13, %f2
	.word	0xd256001b	! t1_kref+0x80c:   	ldsh	[%i0 + %i3], %o1
	.word	0x961a8000	! t1_kref+0x810:   	xor	%o2, %g0, %o3
	.word	0xe06e3fe2	! t1_kref+0x814:   	ldstub	[%i0 - 0x1e], %l0
	.word	0xd048a036	! t1_kref+0x818:   	ldsb	[%g2 + 0x36], %o0
	.word	0xd9be1857	! t1_kref+0x81c:   	stda	%f12, [%i0 + %l7]0xc2
	.word	0xab22f526	! t1_kref+0x820:   	mulscc	%o3, -0xada, %l5
	.word	0x3a480003	! t1_kref+0x824:   	bcc,a,pt	%icc, _kref+0x830
	.word	0x97b24337	! t1_kref+0x828:   	bmask	%o1, %l7, %o3
2:	.word	0x89a2cd2a	! t1_kref+0x82c:   	fsmuld	%f11, %f10, %f4
	.word	0x8da0002e	! t1_kref+0x830:   	fmovs	%f14, %f6
	.word	0x81ab8a2f	! t1_kref+0x834:   	fcmps	%fcc0, %f14, %f15
	.word	0xc56e6018	! t1_kref+0x838:   	prefetch	%i1 + 0x18, 2
	.word	0x81abca25	! t1_kref+0x83c:   	fcmps	%fcc0, %f15, %f5
	.word	0x9bb28200	! t1_kref+0x840:   	array8	%o2, %g0, %o5
	.word	0x92b8000b	! t1_kref+0x844:   	xnorcc	%g0, %o3, %o1
	.word	0xa5b14c67	! t1_kref+0x848:   	fnors	%f5, %f7, %f18
	.word	0xd86e4000	! t1_kref+0x84c:   	ldstub	[%i1], %o4
	.word	0xc7ee500c	! t1_kref+0x850:   	prefetcha	%i1 + %o4, 3
	.word	0xee48a027	! t1_kref+0x854:   	ldsb	[%g2 + 0x27], %l7
	.word	0x95a1084c	! t1_kref+0x858:   	faddd	%f4, %f12, %f10
	.word	0xa5a00123	! t1_kref+0x85c:   	fabss	%f3, %f18
	.word	0xa81dc01a	! t1_kref+0x860:   	xor	%l7, %i2, %l4
	.word	0x8143c000	! t1_kref+0x864:   	stbar
	.word	0x97a000b0	! t1_kref+0x868:   	fnegs	%f16, %f11
	.word	0x9128201e	! t1_kref+0x86c:   	sll	%g0, 0x1e, %o0
	.word	0xaa8dc008	! t1_kref+0x870:   	andcc	%l7, %o0, %l5
	call	SYM(t1_subr1)
	.word	0xd9063fe0	! t1_kref+0x878:   	ld	[%i0 - 0x20], %f12
	.word	0xe3b8a100	! t1_kref+0x87c:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0xae8a0009	! t1_kref+0x880:   	andcc	%o0, %o1, %l7
	.word	0x3c800002	! t1_kref+0x884:   	bpos,a	_kref+0x88c
	.word	0xd210a02c	! t1_kref+0x888:   	lduh	[%g2 + 0x2c], %o1
	.word	0x89a40840	! t1_kref+0x88c:   	faddd	%f16, %f0, %f4
	.word	0x8ba00127	! t1_kref+0x890:   	fabss	%f7, %f5
	.word	0xdb00a024	! t1_kref+0x894:   	ld	[%g2 + 0x24], %f13
	.word	0xad32200a	! t1_kref+0x898:   	srl	%o0, 0xa, %l6
	.word	0xe100a034	! t1_kref+0x89c:   	ld	[%g2 + 0x34], %f16
	.word	0xa8a6c009	! t1_kref+0x8a0:   	subcc	%i3, %o1, %l4
	.word	0xea4e8018	! t1_kref+0x8a4:   	ldsb	[%i2 + %i0], %l5
	.word	0x98a2401a	! t1_kref+0x8a8:   	subcc	%o1, %i2, %o4
	.word	0xea40a004	! t1_kref+0x8ac:   	ldsw	[%g2 + 4], %l5
	call	SYM(t1_subr2)
	.word	0xaca82952	! t1_kref+0x8b4:   	andncc	%g0, 0x952, %l6
	.word	0x9a8a2d31	! t1_kref+0x8b8:   	andcc	%o0, 0xd31, %o5
	.word	0x9283284d	! t1_kref+0x8bc:   	addcc	%o4, 0x84d, %o1
	.word	0x8da1082c	! t1_kref+0x8c0:   	fadds	%f4, %f12, %f6
	.word	0x9de3bfa0	! t1_kref+0x8c4:   	save	%sp, -0x60, %sp
	.word	0xb107401d	! t1_kref+0x8c8:   	taddcc	%i5, %i5, %i0
	.word	0xa9eec01b	! t1_kref+0x8cc:   	restore	%i3, %i3, %l4
	.word	0x85a0190f	! t1_kref+0x8d0:   	fitod	%f15, %f2
	.word	0x99b30446	! t1_kref+0x8d4:   	fcmpne16	%f12, %f6, %o4
	.word	0xdb060000	! t1_kref+0x8d8:   	ld	[%i0], %f13
	.word	0xd6262008	! t1_kref+0x8dc:   	st	%o3, [%i0 + 8]
	.word	0x97b2801b	! t1_kref+0x8e0:   	edge8	%o2, %i3, %o3
	.word	0xe46e3ff9	! t1_kref+0x8e4:   	ldstub	[%i0 - 7], %l2
	.word	0x93a3492a	! t1_kref+0x8e8:   	fmuls	%f13, %f10, %f9
	.word	0xe40865dc	! t1_kref+0x8ec:   	ldub	[%g1 + 0x5dc], %l2
	.word	0xa41ca00c	! t1_kref+0x8f0:   	xor	%l2, 0xc, %l2
	.word	0xe42865dc	! t1_kref+0x8f4:   	stb	%l2, [%g1 + 0x5dc]
	.word	0x81d865dc	! t1_kref+0x8f8:   	flush	%g1 + 0x5dc
	.word	0xa85ac01b	! t1_kref+0x8fc:   	smul	%o3, %i3, %l4
	.word	0xda267ffc	! t1_kref+0x900:   	st	%o5, [%i1 - 4]
	.word	0xd6062010	! t1_kref+0x904:   	ld	[%i0 + 0x10], %o3
	.word	0x962dc000	! t1_kref+0x908:   	andn	%l7, %g0, %o3
2:	.word	0x89b14963	! t1_kref+0x90c:   	fpmerge	%f5, %f3, %f4
	.word	0x993e800a	! t1_kref+0x910:   	sra	%i2, %o2, %o4
	.word	0x2d480004	! t1_kref+0x914:   	fbg,a,pt	%fcc0, _kref+0x924
	.word	0xae12e403	! t1_kref+0x918:   	or	%o3, 0x403, %l7
	.word	0xac82a4d7	! t1_kref+0x91c:   	addcc	%o2, 0x4d7, %l6
	.word	0x81b3070e	! t1_kref+0x920:   	fmuld8sux16	%f12, %f14, %f0
	.word	0x9536c00b	! t1_kref+0x924:   	srl	%i3, %o3, %o2
	.word	0x81580000	! t1_kref+0x928:   	flushw
	.word	0x99a00550	! t1_kref+0x92c:   	fsqrtd	%f16, %f12
	.word	0xd648a01f	! t1_kref+0x930:   	ldsb	[%g2 + 0x1f], %o3
	.word	0x91a01905	! t1_kref+0x934:   	fitod	%f5, %f8
	.word	0xaa42000b	! t1_kref+0x938:   	addc	%o0, %o3, %l5
	.word	0x9232f59a	! t1_kref+0x93c:   	orn	%o3, -0xa66, %o1
	.word	0xa8fae1f3	! t1_kref+0x940:   	sdivcc	%o3, 0x1f3, %l4
	.word	0xa87826e7	! t1_kref+0x944:   	sdiv	%g0, 0x6e7, %l4
	.word	0xd93e3fe8	! t1_kref+0x948:   	std	%f12, [%i0 - 0x18]
	.word	0xc1ee1017	! t1_kref+0x94c:   	prefetcha	%i0 + %l7, 0
	.word	0x3e480005	! t1_kref+0x950:   	bvc,a,pt	%icc, _kref+0x964
	.word	0x9645fe7f	! t1_kref+0x954:   	addc	%l7, -0x181, %o3
	.word	0xef6e401b	! t1_kref+0x958:   	prefetch	%i1 + %i3, 23
	.word	0x93b4040a	! t1_kref+0x95c:   	fcmple16	%f16, %f10, %o1
	.word	0x945ec00d	! t1_kref+0x960:   	smul	%i3, %o5, %o2
	.word	0x2b480007	! t1_kref+0x964:   	fbug,a,pt	%fcc0, _kref+0x980
	.word	0x9bb48486	! t1_kref+0x968:   	fcmple32	%f18, %f6, %o5
	.word	0xa836ba8d	! t1_kref+0x96c:   	orn	%i2, -0x573, %l4
	.word	0xa9b08544	! t1_kref+0x970:   	fcmpeq16	%f2, %f4, %l4
	.word	0x3d480003	! t1_kref+0x974:   	fbule,a,pt	%fcc0, _kref+0x980
	.word	0x9da3c924	! t1_kref+0x978:   	fmuls	%f15, %f4, %f14
	.word	0x93400000	! t1_kref+0x97c:   	mov	%y, %o1
	.word	0xd41e7fe0	! t1_kref+0x980:   	ldd	[%i1 - 0x20], %o2
	.word	0x81a01a21	! t1_kref+0x984:   	fstoi	%f1, %f0
	.word	0xfdee101b	! t1_kref+0x988:   	prefetcha	%i0 + %i3, 30
	.word	0x20480008	! t1_kref+0x98c:   	bn,a,pt	%icc, _kref+0x9ac
	.word	0xa5b48d40	! t1_kref+0x990:   	fnot1	%f18, %f18
	.word	0x81a01904	! t1_kref+0x994:   	fitod	%f4, %f0
	.word	0x9526f56b	! t1_kref+0x998:   	mulscc	%i3, -0xa95, %o2
	.word	0xea48a00c	! t1_kref+0x99c:   	ldsb	[%g2 + 0xc], %l5
	.word	0xc0363ff2	! t1_kref+0x9a0:   	clrh	[%i0 - 0xe]
	.word	0xe43e2008	! t1_kref+0x9a4:   	std	%l2, [%i0 + 8]
	.word	0x81a98a28	! t1_kref+0x9a8:   	fcmps	%fcc0, %f6, %f8
	.word	0x85a00021	! t1_kref+0x9ac:   	fmovs	%f1, %f2
	.word	0xd1e6500c	! t1_kref+0x9b0:   	casa	[%i1]0x80, %o4, %o0
	.word	0x33480008	! t1_kref+0x9b4:   	fbe,a,pt	%fcc0, _kref+0x9d4
	.word	0xaaf2775e	! t1_kref+0x9b8:   	udivcc	%o1, -0x8a2, %l5
	.word	0xac726b35	! t1_kref+0x9bc:   	udiv	%o1, 0xb35, %l6
	.word	0xd8680018	! t1_kref+0x9c0:   	ldstub	[%g0 + %i0], %o4
	.word	0xae65f88d	! t1_kref+0x9c4:   	subc	%l7, -0x773, %l7
	.word	0xe3b8a100	! t1_kref+0x9c8:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0x95a38842	! t1_kref+0x9cc:   	faddd	%f14, %f2, %f10
	.word	0x98fa70b5	! t1_kref+0x9d0:   	sdivcc	%o1, -0xf4b, %o4
	.word	0x81ab4a23	! t1_kref+0x9d4:   	fcmps	%fcc0, %f13, %f3
	.word	0xd8070018	! t1_kref+0x9d8:   	ld	[%i4 + %i0], %o4
	.word	0x9fc00004	! t1_kref+0x9dc:   	call	%g0 + %g4
	.word	0xee20a014	! t1_kref+0x9e0:   	st	%l7, [%g2 + 0x14]
	.word	0x90fec01a	! t1_kref+0x9e4:   	sdivcc	%i3, %i2, %o0
	.word	0x87a0c929	! t1_kref+0x9e8:   	fmuls	%f3, %f9, %f3
	.word	0x3b480005	! t1_kref+0x9ec:   	fble,a,pt	%fcc0, _kref+0xa00
	.word	0xe810a006	! t1_kref+0x9f0:   	lduh	[%g2 + 6], %l4
	.word	0xaf23215b	! t1_kref+0x9f4:   	mulscc	%o4, 0x15b, %l7
	.word	0x988a000c	! t1_kref+0x9f8:   	andcc	%o0, %o4, %o4
	.word	0x95a01902	! t1_kref+0x9fc:   	fitod	%f2, %f10
	.word	0x9b3a2000	! t1_kref+0xa00:   	sra	%o0, 0x0, %o5
	.word	0x28800001	! t1_kref+0xa04:   	bleu,a	_kref+0xa08
	.word	0xae1e800b	! t1_kref+0xa08:   	xor	%i2, %o3, %l7
	.word	0x95b3c96e	! t1_kref+0xa0c:   	fpmerge	%f15, %f14, %f10
	.word	0xee4e6010	! t1_kref+0xa10:   	ldsb	[%i1 + 0x10], %l7
	.word	0x98dafc77	! t1_kref+0xa14:   	smulcc	%o3, -0x389, %o4
	.word	0xaf0ab116	! t1_kref+0xa18:   	tsubcc	%o2, -0xeea, %l7
	.word	0xd8360000	! t1_kref+0xa1c:   	sth	%o4, [%i0]
	.word	0x8db00f2d	! t1_kref+0xa20:   	fsrc2s	%f13, %f6
	.word	0x93b6c0e8	! t1_kref+0xa24:   	edge16ln	%i3, %o0, %o1
	.word	0xee6e3ff6	! t1_kref+0xa28:   	ldstub	[%i0 - 0xa], %l7
	.word	0xa88831bf	! t1_kref+0xa2c:   	andcc	%g0, -0xe41, %l4
	.word	0x90bb000d	! t1_kref+0xa30:   	xnorcc	%o4, %o5, %o0
	.word	0x9265c009	! t1_kref+0xa34:   	subc	%l7, %o1, %o1
	.word	0xd806601c	! t1_kref+0xa38:   	ld	[%i1 + 0x1c], %o4
	.word	0x21480005	! t1_kref+0xa3c:   	fbn,a,pt	%fcc0, _kref+0xa50
	.word	0x97a0012e	! t1_kref+0xa40:   	fabss	%f14, %f11
	.word	0x81b28709	! t1_kref+0xa44:   	fmuld8sux16	%f10, %f9, %f0
	.word	0x81b38dc4	! t1_kref+0xa48:   	fnand	%f14, %f4, %f0
	.word	0xda480018	! t1_kref+0xa4c:   	ldsb	[%g0 + %i0], %o5
	.word	0xd050a014	! t1_kref+0xa50:   	ldsh	[%g2 + 0x14], %o0
	.word	0xa8b82337	! t1_kref+0xa54:   	xnorcc	%g0, 0x337, %l4
	.word	0x8143c000	! t1_kref+0xa58:   	stbar
	.word	0x9a5b001b	! t1_kref+0xa5c:   	smul	%o4, %i3, %o5
	.word	0x81b00cc4	! t1_kref+0xa60:   	fnot2	%f4, %f0
	.word	0xac15c000	! t1_kref+0xa64:   	or	%l7, %g0, %l6
	.word	0x9da00548	! t1_kref+0xa68:   	fsqrtd	%f8, %f14
	.word	0x83a00831	! t1_kref+0xa6c:   	fadds	%f0, %f17, %f1
	.word	0xd22e401a	! t1_kref+0xa70:   	stb	%o1, [%i1 + %i2]
	.word	0x8db10966	! t1_kref+0xa74:   	fpmerge	%f4, %f6, %f6
	.word	0x930ac00d	! t1_kref+0xa78:   	tsubcc	%o3, %o5, %o1
	.word	0x8143c000	! t1_kref+0xa7c:   	stbar
	.word	0x8ba01a4a	! t1_kref+0xa80:   	fdtoi	%f10, %f5
	.word	0x99a08d25	! t1_kref+0xa84:   	fsmuld	%f2, %f5, %f12
	.word	0xd51fbd68	! t1_kref+0xa88:   	ldd	[%fp - 0x298], %f10
	.word	0x81b00f28	! t1_kref+0xa8c:   	fsrc2s	%f8, %f0
	.word	0x20480003	! t1_kref+0xa90:   	bn,a,pt	%icc, _kref+0xa9c
	.word	0x9da30d31	! t1_kref+0xa94:   	fsmuld	%f12, %f17, %f14
	.word	0x99b08446	! t1_kref+0xa98:   	fcmpne16	%f2, %f6, %o4
	.word	0x99a01921	! t1_kref+0xa9c:   	fstod	%f1, %f12
	.word	0xfbee101d	! t1_kref+0xaa0:   	prefetcha	%i0 + %i5, 29
	.word	0xd240a004	! t1_kref+0xaa4:   	ldsw	[%g2 + 4], %o1
	.word	0xf42e201e	! t1_kref+0xaa8:   	stb	%i2, [%i0 + 0x1e]
	.word	0xaa08000a	! t1_kref+0xaac:   	and	%g0, %o2, %l5
	.word	0x8143c000	! t1_kref+0xab0:   	stbar
	.word	0x91b40f80	! t1_kref+0xab4:   	for	%f16, %f0, %f8
	.word	0x23480002	! t1_kref+0xab8:   	fbne,a,pt	%fcc0, _kref+0xac0
	.word	0x99b40963	! t1_kref+0xabc:   	fpmerge	%f16, %f3, %f12
	.word	0x30800006	! t1_kref+0xac0:   	ba,a	_kref+0xad8
	.word	0x83b007a0	! t1_kref+0xac4:   	fpackfix	%f0, %f1
	.word	0x34480007	! t1_kref+0xac8:   	bg,a,pt	%icc, _kref+0xae4
	.word	0x93a3c82e	! t1_kref+0xacc:   	fadds	%f15, %f14, %f9
	.word	0xd840a014	! t1_kref+0xad0:   	ldsw	[%g2 + 0x14], %o4
	.word	0x9da24920	! t1_kref+0xad4:   	fmuls	%f9, %f0, %f14
	.word	0xea48a02e	! t1_kref+0xad8:   	ldsb	[%g2 + 0x2e], %l5
	.word	0xabb305d0	! t1_kref+0xadc:   	fcmpeq32	%f12, %f16, %l5
	.word	0xa89dfe6d	! t1_kref+0xae0:   	xorcc	%l7, -0x193, %l4
	.word	0x968a0017	! t1_kref+0xae4:   	andcc	%o0, %l7, %o3
	.word	0xd6300018	! t1_kref+0xae8:   	sth	%o3, [%g0 + %i0]
	.word	0xec063fe4	! t1_kref+0xaec:   	ld	[%i0 - 0x1c], %l6
	.word	0xee6e0000	! t1_kref+0xaf0:   	ldstub	[%i0], %l7
	.word	0x9a0ac00c	! t1_kref+0xaf4:   	and	%o3, %o4, %o5
	.word	0x2b480006	! t1_kref+0xaf8:   	fbug,a,pt	%fcc0, _kref+0xb10
	.word	0x96f2801a	! t1_kref+0xafc:   	udivcc	%o2, %i2, %o3
	.word	0xa1b38a04	! t1_kref+0xb00:   	fpadd16	%f14, %f4, %f16
	.word	0x95b08a8c	! t1_kref+0xb04:   	fpsub16	%f2, %f12, %f10
	.word	0xd016601e	! t1_kref+0xb08:   	lduh	[%i1 + 0x1e], %o0
	.word	0xd4500018	! t1_kref+0xb0c:   	ldsh	[%g0 + %i0], %o2
	.word	0x93b280fa	! t1_kref+0xb10:   	edge16ln	%o2, %i2, %o1
	.word	0x96726266	! t1_kref+0xb14:   	udiv	%o1, 0x266, %o3
	.word	0xae26c00c	! t1_kref+0xb18:   	sub	%i3, %o4, %l7
	.word	0xe5e6500b	! t1_kref+0xb1c:   	casa	[%i1]0x80, %o3, %l2
	.word	0x9283401b	! t1_kref+0xb20:   	addcc	%o5, %i3, %o1
	.word	0x9446c009	! t1_kref+0xb24:   	addc	%i3, %o1, %o2
	.word	0xc168a104	! t1_kref+0xb28:   	prefetch	%g2 + 0x104, 0
	.word	0x941eb258	! t1_kref+0xb2c:   	xor	%i2, -0xda8, %o2
	.word	0xe3b8a100	! t1_kref+0xb30:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0x9de3bfa0	! t1_kref+0xb34:   	save	%sp, -0x60, %sp
	.word	0x9bef2f7b	! t1_kref+0xb38:   	restore	%i4, 0xf7b, %o5
	.word	0xee063ff4	! t1_kref+0xb3c:   	ld	[%i0 - 0xc], %l7
	.word	0x93400000	! t1_kref+0xb40:   	mov	%y, %o1
	.word	0xa802001a	! t1_kref+0xb44:   	add	%o0, %i2, %l4
	.word	0x95400000	! t1_kref+0xb48:   	mov	%y, %o2
	.word	0x9fc00004	! t1_kref+0xb4c:   	call	%g0 + %g4
	.word	0x9da2094c	! t1_kref+0xb50:   	fmuld	%f8, %f12, %f14
	.word	0x92da4009	! t1_kref+0xb54:   	smulcc	%o1, %o1, %o1
	.word	0x9fc10000	! t1_kref+0xb58:   	call	%g4
	.word	0xa1b007b0	! t1_kref+0xb5c:   	fpackfix	%f16, %f16
	.word	0x96b23c5f	! t1_kref+0xb60:   	orncc	%o0, -0x3a1, %o3
	.word	0x81ab4a2e	! t1_kref+0xb64:   	fcmps	%fcc0, %f13, %f14
	.word	0xc93e6000	! t1_kref+0xb68:   	std	%f4, [%i1]
	.word	0xe806401c	! t1_kref+0xb6c:   	ld	[%i1 + %i4], %l4
	.word	0x81a88ac2	! t1_kref+0xb70:   	fcmped	%fcc0, %f2, %f2
	.word	0xc398a0c0	! t1_kref+0xb74:   	ldda	[%g2 + 0xc0]%asi, %f32
	.word	0x9de3bfa0	! t1_kref+0xb78:   	save	%sp, -0x60, %sp
	.word	0xb106c000	! t1_kref+0xb7c:   	taddcc	%i3, %g0, %i0
	.word	0x95ee3f19	! t1_kref+0xb80:   	restore	%i0, -0xe7, %o2
	.word	0xacbdf016	! t1_kref+0xb84:   	xnorcc	%l7, -0xfea, %l6
	.word	0xee5e6008	! t1_kref+0xb88:   	ldx	[%i1 + 8], %l7
	.word	0xaeba4008	! t1_kref+0xb8c:   	xnorcc	%o1, %o0, %l7
	.word	0xd85e0000	! t1_kref+0xb90:   	ldx	[%i0], %o4
	.word	0x99b14628	! t1_kref+0xb94:   	fmul8x16	%f5, %f8, %f12
	.word	0x89a00028	! t1_kref+0xb98:   	fmovs	%f8, %f4
	.word	0x93a00124	! t1_kref+0xb9c:   	fabss	%f4, %f9
	.word	0xd028a01e	! t1_kref+0xba0:   	stb	%o0, [%g2 + 0x1e]
	.word	0xcd380018	! t1_kref+0xba4:   	std	%f6, [%g0 + %i0]
	.word	0x9a1aaec5	! t1_kref+0xba8:   	xor	%o2, 0xec5, %o5
	.word	0xee28a037	! t1_kref+0xbac:   	stb	%l7, [%g2 + 0x37]
	.word	0x9de3bfa0	! t1_kref+0xbb0:   	save	%sp, -0x60, %sp
	.word	0xabe83737	! t1_kref+0xbb4:   	restore	%g0, -0x8c9, %l5
	.word	0x97b104cc	! t1_kref+0xbb8:   	fcmpne32	%f4, %f12, %o3
	.word	0x99400000	! t1_kref+0xbbc:   	mov	%y, %o4
	.word	0x93418000	! t1_kref+0xbc0:   	mov	%fprs, %o1
	.word	0x89a01a52	! t1_kref+0xbc4:   	fdtoi	%f18, %f4
	.word	0x9ba248a9	! t1_kref+0xbc8:   	fsubs	%f9, %f9, %f13
	.word	0x95a28d2c	! t1_kref+0xbcc:   	fsmuld	%f10, %f12, %f10
	.word	0xa1b3c622	! t1_kref+0xbd0:   	fmul8x16	%f15, %f2, %f16
	.word	0x95b14d60	! t1_kref+0xbd4:   	fnot1s	%f5, %f10
	.word	0x81db2af5	! t1_kref+0xbd8:   	flush	%o4 + 0xaf5
	.word	0xad418000	! t1_kref+0xbdc:   	mov	%fprs, %l6
	.word	0x95b08a44	! t1_kref+0xbe0:   	fpadd32	%f2, %f4, %f10
	.word	0x9292ba0f	! t1_kref+0xbe4:   	orcc	%o2, -0x5f1, %o1
	.word	0x98febcfc	! t1_kref+0xbe8:   	sdivcc	%i2, -0x304, %o4
	.word	0x8da01a21	! t1_kref+0xbec:   	fstoi	%f1, %f6
	.word	0xda30a026	! t1_kref+0xbf0:   	sth	%o5, [%g2 + 0x26]
	.word	0x97b00766	! t1_kref+0xbf4:   	fpack16	%f6, %f11
	.word	0x947a3314	! t1_kref+0xbf8:   	sdiv	%o0, -0xcec, %o2
	.word	0x98227a47	! t1_kref+0xbfc:   	sub	%o1, -0x5b9, %o4
	.word	0xe1bf1a58	! t1_kref+0xc00:   	stda	%f16, [%i4 + %i0]0xd2
	.word	0xa1a01923	! t1_kref+0xc04:   	fstod	%f3, %f16
	.word	0xacdeed4b	! t1_kref+0xc08:   	smulcc	%i3, 0xd4b, %l6
	.word	0xad26fedd	! t1_kref+0xc0c:   	mulscc	%i3, -0x123, %l6
	.word	0xc7871018	! t1_kref+0xc10:   	lda	[%i4 + %i0]0x80, %f3
	.word	0x99a000a4	! t1_kref+0xc14:   	fnegs	%f4, %f12
	.word	0xab2a6002	! t1_kref+0xc18:   	sll	%o1, 0x2, %l5
	.word	0xf630a014	! t1_kref+0xc1c:   	sth	%i3, [%g2 + 0x14]
	.word	0x9de3bfa0	! t1_kref+0xc20:   	save	%sp, -0x60, %sp
	.word	0x93e8001a	! t1_kref+0xc24:   	restore	%g0, %i2, %o1
	.word	0x8143c000	! t1_kref+0xc28:   	stbar
	.word	0xe520a004	! t1_kref+0xc2c:   	st	%f18, [%g2 + 4]
	.word	0x95418000	! t1_kref+0xc30:   	mov	%fprs, %o2
	.word	0x92f0000b	! t1_kref+0xc34:   	udivcc	%g0, %o3, %o1
	.word	0x8143e014	! t1_kref+0xc38:   	membar	0x14
	.word	0x95b3402b	! t1_kref+0xc3c:   	edge8n	%o5, %o3, %o2
	.word	0x91a40d2c	! t1_kref+0xc40:   	fsmuld	%f16, %f12, %f8
	sethi	%hi(2f), %o7
	.word	0xe40be084	! t1_kref+0xc48:   	ldub	[%o7 + 0x84], %l2
	.word	0xa41ca00c	! t1_kref+0xc4c:   	xor	%l2, 0xc, %l2
	.word	0xe42be084	! t1_kref+0xc50:   	stb	%l2, [%o7 + 0x84]
	.word	0x81dbe084	! t1_kref+0xc54:   	flush	%o7 + 0x84
	.word	0x9bb38d20	! t1_kref+0xc58:   	fandnot1s	%f14, %f0, %f13
	.word	0x93200008	! t1_kref+0xc5c:   	mulscc	%g0, %o0, %o1
	.word	0x112e7edf	! t1_kref+0xc60:   	sethi	%hi(0xb9fb7c00), %o0
	.word	0x907a6b4e	! t1_kref+0xc64:   	sdiv	%o1, 0xb4e, %o0
	.word	0x943b672c	! t1_kref+0xc68:   	xnor	%o5, 0x72c, %o2
	.word	0xec961000	! t1_kref+0xc6c:   	lduha	[%i0]0x80, %l6
	.word	0x3a480003	! t1_kref+0xc70:   	bcc,a,pt	%icc, _kref+0xc7c
	.word	0xc320a02c	! t1_kref+0xc74:   	st	%f1, [%g2 + 0x2c]
	.word	0xa885e1a1	! t1_kref+0xc78:   	addcc	%l7, 0x1a1, %l4
	.word	0x89a0012e	! t1_kref+0xc7c:   	fabss	%f14, %f4
	.word	0x2b480003	! t1_kref+0xc80:   	fbug,a,pt	%fcc0, _kref+0xc8c
2:	.word	0xda067fec	! t1_kref+0xc84:   	ld	[%i1 - 0x14], %o5
	.word	0xea566006	! t1_kref+0xc88:   	ldsh	[%i1 + 6], %l5
	.word	0x85b08f68	! t1_kref+0xc8c:   	fornot1s	%f2, %f8, %f2
	.word	0xc020a00c	! t1_kref+0xc90:   	clr	[%g2 + 0xc]
	.word	0x8143c000	! t1_kref+0xc94:   	stbar
	.word	0xe83f4019	! t1_kref+0xc98:   	std	%l4, [%i5 + %i1]
	.word	0x30480007	! t1_kref+0xc9c:   	ba,a,pt	%icc, _kref+0xcb8
	.word	0xd9067fec	! t1_kref+0xca0:   	ld	[%i1 - 0x14], %f12
	.word	0xd200a024	! t1_kref+0xca4:   	ld	[%g2 + 0x24], %o1
	.word	0xc12e6000	! t1_kref+0xca8:   	st	%fsr, [%i1]
	.word	0x928aad38	! t1_kref+0xcac:   	andcc	%o2, 0xd38, %o1
	.word	0x89a0192d	! t1_kref+0xcb0:   	fstod	%f13, %f4
	.word	0x8db00a4c	! t1_kref+0xcb4:   	fpadd32	%f0, %f12, %f6
	.word	0xae33000d	! t1_kref+0xcb8:   	orn	%o4, %o5, %l7
	.word	0xd048a024	! t1_kref+0xcbc:   	ldsb	[%g2 + 0x24], %o0
	.word	0xe3b8a100	! t1_kref+0xcc0:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0xd000a03c	! t1_kref+0xcc4:   	ld	[%g2 + 0x3c], %o0
	.word	0x99a01911	! t1_kref+0xcc8:   	fitod	%f17, %f12
	.word	0x85b286ca	! t1_kref+0xccc:   	fmul8sux16	%f10, %f10, %f2
	.word	0x9fc10000	! t1_kref+0xcd0:   	call	%g4
	.word	0x81580000	! t1_kref+0xcd4:   	flushw
	.word	0x27480005	! t1_kref+0xcd8:   	fbul,a,pt	%fcc0, _kref+0xcec
	.word	0x89b28a88	! t1_kref+0xcdc:   	fpsub16	%f10, %f8, %f4
	.word	0xad1ab66c	! t1_kref+0xce0:   	tsubcctv	%o2, -0x994, %l6
	.word	0xd030a034	! t1_kref+0xce4:   	sth	%o0, [%g2 + 0x34]
	.word	0xd656c018	! t1_kref+0xce8:   	ldsh	[%i3 + %i0], %o3
	.word	0xa1a01923	! t1_kref+0xcec:   	fstod	%f3, %f16
	.word	0x3d480004	! t1_kref+0xcf0:   	fbule,a,pt	%fcc0, _kref+0xd00
	.word	0x89a01929	! t1_kref+0xcf4:   	fstod	%f9, %f4
	.word	0x95400000	! t1_kref+0xcf8:   	mov	%y, %o2
	.word	0x2b480001	! t1_kref+0xcfc:   	fbug,a,pt	%fcc0, _kref+0xd00
	.word	0x93a409ad	! t1_kref+0xd00:   	fdivs	%f16, %f13, %f9
	sethi	%hi(2f), %o7
	.word	0xe40be12c	! t1_kref+0xd08:   	ldub	[%o7 + 0x12c], %l2
	.word	0xa41ca00c	! t1_kref+0xd0c:   	xor	%l2, 0xc, %l2
	.word	0xe42be12c	! t1_kref+0xd10:   	stb	%l2, [%o7 + 0x12c]
	.word	0x81dbe12c	! t1_kref+0xd14:   	flush	%o7 + 0x12c
	.word	0x8db2890e	! t1_kref+0xd18:   	faligndata	%f10, %f14, %f6
!	.word	0x234f4cb6	! t1_kref+0xd1c:   	fbne,a,pt	%fcc0, SYM(t1_subr1)
	   	fbne,a,pt	%fcc0, SYM(t1_subr1)
	.word	0x9f414000	! t1_kref+0xd20:   	mov	%pc, %o7
	.word	0x83b18c60	! t1_kref+0xd24:   	fnors	%f6, %f0, %f1
	.word	0x81b30969	! t1_kref+0xd28:   	fpmerge	%f12, %f9, %f0
2:	.word	0x9a2ac000	! t1_kref+0xd2c:   	andn	%o3, %g0, %o5
	.word	0x31480005	! t1_kref+0xd30:   	fba,a,pt	%fcc0, _kref+0xd44
	.word	0xd6266010	! t1_kref+0xd34:   	st	%o3, [%i1 + 0x10]
	.word	0x97a149b1	! t1_kref+0xd38:   	fdivs	%f5, %f17, %f11
	.word	0xec40a00c	! t1_kref+0xd3c:   	ldsw	[%g2 + 0xc], %l6
	.word	0xdd1fbdd0	! t1_kref+0xd40:   	ldd	[%fp - 0x230], %f14
	.word	0x3b480004	! t1_kref+0xd44:   	fble,a,pt	%fcc0, _kref+0xd54
	.word	0x9523400c	! t1_kref+0xd48:   	mulscc	%o5, %o4, %o2
	.word	0x99a00550	! t1_kref+0xd4c:   	fsqrtd	%f16, %f12
	.word	0x94fa3321	! t1_kref+0xd50:   	sdivcc	%o0, -0xcdf, %o2
	.word	0x95a18944	! t1_kref+0xd54:   	fmuld	%f6, %f4, %f10
	.word	0x81a018cc	! t1_kref+0xd58:   	fdtos	%f12, %f0
	.word	0xaa33651d	! t1_kref+0xd5c:   	orn	%o5, 0x51d, %l5
	.word	0x9a702196	! t1_kref+0xd60:   	udiv	%g0, 0x196, %o5
	.word	0xe3b8a100	! t1_kref+0xd64:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0x2b1a6b61	! t1_kref+0xd68:   	sethi	%hi(0x69ad8400), %l5
	.word	0xe3b8a100	! t1_kref+0xd6c:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0xa5b00ea0	! t1_kref+0xd70:   	fsrc1s	%f0, %f18
	.word	0xa1a30950	! t1_kref+0xd74:   	fmuld	%f12, %f16, %f16
	.word	0x81a84a21	! t1_kref+0xd78:   	fcmps	%fcc0, %f1, %f1
	.word	0xb4103ffc	! t1_kref+0xd7c:   	mov	0xfffffffc, %i2
	.word	0x95b304d2	! t1_kref+0xd80:   	fcmpne32	%f12, %f18, %o2
	.word	0xaafb0008	! t1_kref+0xd84:   	sdivcc	%o4, %o0, %l5
	.word	0x99b2070f	! t1_kref+0xd88:   	fmuld8sux16	%f8, %f15, %f12
	.word	0x99a40924	! t1_kref+0xd8c:   	fmuls	%f16, %f4, %f12
	.word	0xaaba000a	! t1_kref+0xd90:   	xnorcc	%o0, %o2, %l5
	.word	0xea901018	! t1_kref+0xd94:   	lduha	[%g0 + %i0]0x80, %l5
	.word	0x89a4094a	! t1_kref+0xd98:   	fmuld	%f16, %f10, %f4
	.word	0x30800002	! t1_kref+0xd9c:   	ba,a	_kref+0xda4
	.word	0xc9b81019	! t1_kref+0xda0:   	stda	%f4, [%g0 + %i1]0x80
	.word	0x81a408c6	! t1_kref+0xda4:   	fsubd	%f16, %f6, %f0
	.word	0x8fa018c0	! t1_kref+0xda8:   	fdtos	%f0, %f7
	.word	0xc700a01c	! t1_kref+0xdac:   	ld	[%g2 + 0x1c], %f3
	.word	0xd420a00c	! t1_kref+0xdb0:   	st	%o2, [%g2 + 0xc]
	.word	0x93b28404	! t1_kref+0xdb4:   	fcmple16	%f10, %f4, %o1
	.word	0x97a1c931	! t1_kref+0xdb8:   	fmuls	%f7, %f17, %f11
	.word	0xacfa3eba	! t1_kref+0xdbc:   	sdivcc	%o0, -0x146, %l6
	.word	0xf620a014	! t1_kref+0xdc0:   	st	%i3, [%g2 + 0x14]
	.word	0x8bb007a6	! t1_kref+0xdc4:   	fpackfix	%f6, %f5
	.word	0xf420a014	! t1_kref+0xdc8:   	st	%i2, [%g2 + 0x14]
	.word	0x86102018	! t1_kref+0xdcc:   	mov	0x18, %g3
	.word	0x86a0e001	! t1_kref+0xdd0:   	subcc	%g3, 1, %g3
	.word	0x22800007	! t1_kref+0xdd4:   	be,a	_kref+0xdf0
	.word	0xafb68069	! t1_kref+0xdd8:   	edge8ln	%i2, %o1, %l7
	.word	0x81d860e6	! t1_kref+0xddc:   	flush	%g1 + 0xe6
	.word	0x85a30852	! t1_kref+0xde0:   	faddd	%f12, %f18, %f2
	.word	0xda0e4000	! t1_kref+0xde4:   	ldub	[%i1], %o5
	.word	0x9f414000	! t1_kref+0xde8:   	mov	%pc, %o7
	.word	0xd450a006	! t1_kref+0xdec:   	ldsh	[%g2 + 6], %o2
	.word	0xd036c018	! t1_kref+0xdf0:   	sth	%o0, [%i3 + %i0]
	.word	0xd40e3fe3	! t1_kref+0xdf4:   	ldub	[%i0 - 0x1d], %o2
	.word	0x9b3a400c	! t1_kref+0xdf8:   	sra	%o1, %o4, %o5
	.word	0x983b000b	! t1_kref+0xdfc:   	xnor	%o4, %o3, %o4
	.word	0x87b34d60	! t1_kref+0xe00:   	fnot1s	%f13, %f3
	.word	0xd430a026	! t1_kref+0xe04:   	sth	%o2, [%g2 + 0x26]
	.word	0xee08a037	! t1_kref+0xe08:   	ldub	[%g2 + 0x37], %l7
	.word	0xe3b8a100	! t1_kref+0xe0c:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0x22480002	! t1_kref+0xe10:   	be,a,pt	%icc, _kref+0xe18
	.word	0x9db08aae	! t1_kref+0xe14:   	fpsub16s	%f2, %f14, %f14
	.word	0xa1b1496d	! t1_kref+0xe18:   	fpmerge	%f5, %f13, %f16
	.word	0xd8466018	! t1_kref+0xe1c:   	ldsw	[%i1 + 0x18], %o4
	.word	0x83a00130	! t1_kref+0xe20:   	fabss	%f16, %f1
	.word	0xea48a01d	! t1_kref+0xe24:   	ldsb	[%g2 + 0x1d], %l5
	.word	0x81b28c8e	! t1_kref+0xe28:   	fandnot2	%f10, %f14, %f0
	.word	0xec0e0000	! t1_kref+0xe2c:   	ldub	[%i0], %l6
	.word	0x92802651	! t1_kref+0xe30:   	addcc	%g0, 0x651, %o1
	.word	0x1526d7f8	! t1_kref+0xe34:   	sethi	%hi(0x9b5fe000), %o2
	.word	0x8d803a2c	! t1_kref+0xe38:   	mov	0xfffffa2c, %fprs
	.word	0x9686c01b	! t1_kref+0xe3c:   	addcc	%i3, %i3, %o3
	call	SYM(t1_subr1)
	.word	0xaf2ee002	! t1_kref+0xe44:   	sll	%i3, 0x2, %l7
	.word	0x21480002	! t1_kref+0xe48:   	fbn,a,pt	%fcc0, _kref+0xe50
	.word	0xa87ec00c	! t1_kref+0xe4c:   	sdiv	%i3, %o4, %l4
	.word	0xe43e2010	! t1_kref+0xe50:   	std	%l2, [%i0 + 0x10]
	.word	0x8da18948	! t1_kref+0xe54:   	fmuld	%f6, %f8, %f6
	.word	0xe26e7ffc	! t1_kref+0xe58:   	ldstub	[%i1 - 4], %l1
	.word	0xd01e7ff0	! t1_kref+0xe5c:   	ldd	[%i1 - 0x10], %o0
	.word	0x39480007	! t1_kref+0xe60:   	fbuge,a,pt	%fcc0, _kref+0xe7c
	.word	0x9db009ac	! t1_kref+0xe64:   	fexpand	%f12, %f14
	.word	0x97b20077	! t1_kref+0xe68:   	edge8ln	%o0, %l7, %o3
	.word	0xc11fbc28	! t1_kref+0xe6c:   	ldd	[%fp - 0x3d8], %f0
	.word	0xe8470018	! t1_kref+0xe70:   	ldsw	[%i4 + %i0], %l4
	.word	0x92bef485	! t1_kref+0xe74:   	xnorcc	%i3, -0xb7b, %o1
	.word	0x9482c00a	! t1_kref+0xe78:   	addcc	%o3, %o2, %o2
	.word	0x95a018c8	! t1_kref+0xe7c:   	fdtos	%f8, %f10
	.word	0x81a34d2d	! t1_kref+0xe80:   	fsmuld	%f13, %f13, %f0
	.word	0x92f6f28c	! t1_kref+0xe84:   	udivcc	%i3, -0xd74, %o1
	.word	0xec0e8018	! t1_kref+0xe88:   	ldub	[%i2 + %i0], %l6
	.word	0x947a3d0c	! t1_kref+0xe8c:   	sdiv	%o0, -0x2f4, %o2
	.word	0x95a00540	! t1_kref+0xe90:   	fsqrtd	%f0, %f10
	.word	0xd628a037	! t1_kref+0xe94:   	stb	%o3, [%g2 + 0x37]
	.word	0xd300a004	! t1_kref+0xe98:   	ld	[%g2 + 4], %f9
	.word	0x99b40f60	! t1_kref+0xe9c:   	fornot1s	%f16, %f0, %f12
	.word	0xd04e6007	! t1_kref+0xea0:   	ldsb	[%i1 + 7], %o0
	.word	0x99b0cea0	! t1_kref+0xea4:   	fsrc1s	%f3, %f12
	.word	0xa78335bd	! t1_kref+0xea8:   	wr	%o4, 0xfffff5bd, %gsr
	.word	0x9215c00b	! t1_kref+0xeac:   	or	%l7, %o3, %o1
	.word	0x3c480003	! t1_kref+0xeb0:   	bpos,a,pt	%icc, _kref+0xebc
	.word	0x8db00fc0	! t1_kref+0xeb4:   	fone	%f6
	.word	0x928275fa	! t1_kref+0xeb8:   	addcc	%o1, -0xa06, %o1
	.word	0xd408a035	! t1_kref+0xebc:   	ldub	[%g2 + 0x35], %o2
	.word	0xad36a017	! t1_kref+0xec0:   	srl	%i2, 0x17, %l6
	.word	0x8da018d0	! t1_kref+0xec4:   	fdtos	%f16, %f6
	.word	0xec4e8018	! t1_kref+0xec8:   	ldsb	[%i2 + %i0], %l6
	.word	0xd66e4000	! t1_kref+0xecc:   	ldstub	[%i1], %o3
	.word	0x89a0190e	! t1_kref+0xed0:   	fitod	%f14, %f4
	.word	0x920b401a	! t1_kref+0xed4:   	and	%o5, %i2, %o1
	.word	0xe848a015	! t1_kref+0xed8:   	ldsb	[%g2 + 0x15], %l4
	.word	0xaefe8009	! t1_kref+0xedc:   	sdivcc	%i2, %o1, %l7
	.word	0x8da1c9b0	! t1_kref+0xee0:   	fdivs	%f7, %f16, %f6
	.word	0xd8fe101c	! t1_kref+0xee4:   	swapa	[%i0 + %i4]0x80, %o4
	.word	0x9fc10000	! t1_kref+0xee8:   	call	%g4
	.word	0x90ab3c42	! t1_kref+0xeec:   	andncc	%o4, -0x3be, %o0
	.word	0x89a01a4c	! t1_kref+0xef0:   	fdtoi	%f12, %f4
	.word	0x96f369fa	! t1_kref+0xef4:   	udivcc	%o5, 0x9fa, %o3
	.word	0xcd00a014	! t1_kref+0xef8:   	ld	[%g2 + 0x14], %f6
	.word	0xee5e0000	! t1_kref+0xefc:   	ldx	[%i0], %l7
	.word	0x91a00044	! t1_kref+0xf00:   	fmovd	%f4, %f8
	.word	0xd448a01f	! t1_kref+0xf04:   	ldsb	[%g2 + 0x1f], %o2
	.word	0x85a01903	! t1_kref+0xf08:   	fitod	%f3, %f2
	.word	0x932b000a	! t1_kref+0xf0c:   	sll	%o4, %o2, %o1
	.word	0x81a80a42	! t1_kref+0xf10:   	fcmpd	%fcc0, %f0, %f2
	sethi	%hi(2f), %o7
	.word	0xe40be338	! t1_kref+0xf18:   	ldub	[%o7 + 0x338], %l2
	.word	0xa41ca00c	! t1_kref+0xf1c:   	xor	%l2, 0xc, %l2
	.word	0xe42be338	! t1_kref+0xf20:   	stb	%l2, [%o7 + 0x338]
	.word	0x81dbe338	! t1_kref+0xf24:   	flush	%o7 + 0x338
	.word	0x91b18e42	! t1_kref+0xf28:   	fxnor	%f6, %f2, %f8
	.word	0x93b2400d	! t1_kref+0xf2c:   	edge8	%o1, %o5, %o1
	.word	0x38800002	! t1_kref+0xf30:   	bgu,a	_kref+0xf38
	.word	0xae65e9ee	! t1_kref+0xf34:   	subc	%l7, 0x9ee, %l7
2:	.word	0xaf3e8000	! t1_kref+0xf38:   	sra	%i2, %g0, %l7
	.word	0xac3260f1	! t1_kref+0xf3c:   	orn	%o1, 0xf1, %l6
	.word	0xd8000018	! t1_kref+0xf40:   	ld	[%g0 + %i0], %o4
	.word	0xee6e8019	! t1_kref+0xf44:   	ldstub	[%i2 + %i1], %l7
	.word	0xa5b2090e	! t1_kref+0xf48:   	faligndata	%f8, %f14, %f18
	.word	0xe4680018	! t1_kref+0xf4c:   	ldstub	[%g0 + %i0], %l2
	.word	0xd410a014	! t1_kref+0xf50:   	lduh	[%g2 + 0x14], %o2
	.word	0xda062008	! t1_kref+0xf54:   	ld	[%i0 + 8], %o5
	.word	0x967a8017	! t1_kref+0xf58:   	sdiv	%o2, %l7, %o3
	.word	0x29480007	! t1_kref+0xf5c:   	fbl,a,pt	%fcc0, _kref+0xf78
	.word	0xf62e2015	! t1_kref+0xf60:   	stb	%i3, [%i0 + 0x15]
	.word	0x9696a34d	! t1_kref+0xf64:   	orcc	%i2, 0x34d, %o3
	.word	0xffee501b	! t1_kref+0xf68:   	prefetcha	%i1 + %i3, 31
	.word	0xae5b400d	! t1_kref+0xf6c:   	smul	%o5, %o5, %l7
	.word	0x85b38f4a	! t1_kref+0xf70:   	fornot1	%f14, %f10, %f2
	.word	0xc1282ca0	! t1_kref+0xf74:   	st	%fsr, [%g0 + 0xca0]
	.word	0xd3262000	! t1_kref+0xf78:   	st	%f9, [%i0]
	.word	0x95a01908	! t1_kref+0xf7c:   	fitod	%f8, %f10
	.word	0x9da000b1	! t1_kref+0xf80:   	fnegs	%f17, %f14
	.word	0xd85f4018	! t1_kref+0xf84:   	ldx	[%i5 + %i0], %o4
	.word	0x81b3866f	! t1_kref+0xf88:   	fmul8x16au	%f14, %f15, %f0
	.word	0xec00a00c	! t1_kref+0xf8c:   	ld	[%g2 + 0xc], %l6
	.word	0xdf26401c	! t1_kref+0xf90:   	st	%f15, [%i1 + %i4]
	.word	0x95a38830	! t1_kref+0xf94:   	fadds	%f14, %f16, %f10
	.word	0x981a673a	! t1_kref+0xf98:   	xor	%o1, 0x73a, %o4
	.word	0xd228a03f	! t1_kref+0xf9c:   	stb	%o1, [%g2 + 0x3f]
	.word	0xaeb82ba0	! t1_kref+0xfa0:   	xnorcc	%g0, 0xba0, %l7
	.word	0x9ab825ef	! t1_kref+0xfa4:   	xnorcc	%g0, 0x5ef, %o5
	.word	0x99a0002d	! t1_kref+0xfa8:   	fmovs	%f13, %f12
	.word	0xee26001c	! t1_kref+0xfac:   	st	%l7, [%i0 + %i4]
	.word	0x34480007	! t1_kref+0xfb0:   	bg,a,pt	%icc, _kref+0xfcc
	.word	0xaac364f7	! t1_kref+0xfb4:   	addccc	%o5, 0x4f7, %l5
	.word	0x8143c000	! t1_kref+0xfb8:   	stbar
	.word	0x9b22c00a	! t1_kref+0xfbc:   	mulscc	%o3, %o2, %o5
	.word	0x95a01a22	! t1_kref+0xfc0:   	fstoi	%f2, %f10
	.word	0xd05e401d	! t1_kref+0xfc4:   	ldx	[%i1 + %i5], %o0
	.word	0xa1a288d2	! t1_kref+0xfc8:   	fsubd	%f10, %f18, %f16
	.word	0x81a8ca2f	! t1_kref+0xfcc:   	fcmps	%fcc0, %f3, %f15
	.word	0x9de3bfa0	! t1_kref+0xfd0:   	save	%sp, -0x60, %sp
	.word	0xbadeef58	! t1_kref+0xfd4:   	smulcc	%i3, 0xf58, %i5
	.word	0xadee7a2d	! t1_kref+0xfd8:   	restore	%i1, -0x5d3, %l6
	.word	0x24800008	! t1_kref+0xfdc:   	ble,a	_kref+0xffc
	.word	0x96880000	! t1_kref+0xfe0:   	andcc	%g0, %g0, %o3
	.word	0x8582eb97	! t1_kref+0xfe4:   	wr	%o3, 0xb97, %ccr
	.word	0x95a01911	! t1_kref+0xfe8:   	fitod	%f17, %f10
	.word	0xe43e4000	! t1_kref+0xfec:   	std	%l2, [%i1]
	.word	0x9292c00c	! t1_kref+0xff0:   	orcc	%o3, %o4, %o1
	.word	0xda26401c	! t1_kref+0xff4:   	st	%o5, [%i1 + %i4]
	.word	0xa81e8008	! t1_kref+0xff8:   	xor	%i2, %o0, %l4
	.word	0x99a01a28	! t1_kref+0xffc:   	fstoi	%f8, %f12
	.word	0x8bb00fe0	! t1_kref+0x1000:   	fones	%f5
	.word	0xd600a024	! t1_kref+0x1004:   	ld	[%g2 + 0x24], %o3
	.word	0x85b1466a	! t1_kref+0x1008:   	fmul8x16au	%f5, %f10, %f2
	.word	0x81ac8a2f	! t1_kref+0x100c:   	fcmps	%fcc0, %f18, %f15
	.word	0x99a00028	! t1_kref+0x1010:   	fmovs	%f8, %f12
	.word	0x9846fdd5	! t1_kref+0x1014:   	addc	%i3, -0x22b, %o4
	.word	0x23480002	! t1_kref+0x1018:   	fbne,a,pt	%fcc0, _kref+0x1020
	.word	0x81580000	! t1_kref+0x101c:   	flushw
	.word	0xec3e7fe0	! t1_kref+0x1020:   	std	%l6, [%i1 - 0x20]
	.word	0xac42f0b4	! t1_kref+0x1024:   	addc	%o3, -0xf4c, %l6
	.word	0x91a01026	! t1_kref+0x1028:   	fstox	%f6, %f8
	.word	0x21480003	! t1_kref+0x102c:   	fbn,a,pt	%fcc0, _kref+0x1038
	.word	0xaa1eb9a0	! t1_kref+0x1030:   	xor	%i2, -0x660, %l5
	.word	0xea0e2003	! t1_kref+0x1034:   	ldub	[%i0 + 3], %l5
	.word	0xe3b8a100	! t1_kref+0x1038:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0xd22e7fed	! t1_kref+0x103c:   	stb	%o1, [%i1 - 0x13]
	.word	0x81a408c0	! t1_kref+0x1040:   	fsubd	%f16, %f0, %f0
	.word	0xa7832201	! t1_kref+0x1044:   	wr	%o4, 0x201, %gsr
	.word	0x9da0054a	! t1_kref+0x1048:   	fsqrtd	%f10, %f14
	.word	0xa9b5c320	! t1_kref+0x104c:   	bmask	%l7, %g0, %l4
	.word	0x9da3c931	! t1_kref+0x1050:   	fmuls	%f15, %f17, %f14
	.word	0xe3b8a100	! t1_kref+0x1054:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0xafb6c200	! t1_kref+0x1058:   	array8	%i3, %g0, %l7
	.word	0xa3b00a28	! t1_kref+0x105c:   	fpadd16s	%f0, %f8, %f17
	.word	0x9afeb268	! t1_kref+0x1060:   	sdivcc	%i2, -0xd98, %o5
	.word	0x99b40d06	! t1_kref+0x1064:   	fandnot1	%f16, %f6, %f12
	.word	0x81ddc014	! t1_kref+0x1068:   	flush	%l7 + %l4
	.word	0x91b00cc2	! t1_kref+0x106c:   	fnot2	%f2, %f8
	.word	0x85b08e6c	! t1_kref+0x1070:   	fxnors	%f2, %f12, %f2
	.word	0x3e800004	! t1_kref+0x1074:   	bvc,a	_kref+0x1084
	.word	0x81a00050	! t1_kref+0x1078:   	fmovd	%f16, %f0
	.word	0x81830000	! t1_kref+0x107c:   	wr	%o4, %g0, %y
	.word	0x81b01022	! t1_kref+0x1080:   	siam	0x2
	.word	0x9ba000a4	! t1_kref+0x1084:   	fnegs	%f4, %f13
	.word	0xdb20a00c	! t1_kref+0x1088:   	st	%f13, [%g2 + 0xc]
	.word	0x2b480002	! t1_kref+0x108c:   	fbug,a,pt	%fcc0, _kref+0x1094
	.word	0xab400000	! t1_kref+0x1090:   	mov	%y, %l5
	.word	0xaa234000	! t1_kref+0x1094:   	sub	%o5, %g0, %l5
	.word	0xaef2a3d8	! t1_kref+0x1098:   	udivcc	%o2, 0x3d8, %l7
	.word	0x2e800002	! t1_kref+0x109c:   	bvs,a	_kref+0x10a4
	.word	0xece81018	! t1_kref+0x10a0:   	ldstuba	[%g0 + %i0]0x80, %l6
	.word	0x192aa1a6	! t1_kref+0x10a4:   	sethi	%hi(0xaa869800), %o4
	.word	0x93b34d30	! t1_kref+0x10a8:   	fandnot1s	%f13, %f16, %f9
	.word	0x9da0054c	! t1_kref+0x10ac:   	fsqrtd	%f12, %f14
	.word	0xab22800a	! t1_kref+0x10b0:   	mulscc	%o2, %o2, %l5
	.word	0x9fc00004	! t1_kref+0x10b4:   	call	%g0 + %g4
	.word	0xc06e001a	! t1_kref+0x10b8:   	ldstub	[%i0 + %i2], %g0
	.word	0x99b00cc8	! t1_kref+0x10bc:   	fnot2	%f8, %f12
	.word	0x90426311	! t1_kref+0x10c0:   	addc	%o1, 0x311, %o0
	.word	0x9bb1ca6b	! t1_kref+0x10c4:   	fpadd32s	%f7, %f11, %f13
	.word	0xd40e8018	! t1_kref+0x10c8:   	ldub	[%i2 + %i0], %o2
	.word	0xcd06401c	! t1_kref+0x10cc:   	ld	[%i1 + %i4], %f6
	.word	0xd226001c	! t1_kref+0x10d0:   	st	%o1, [%i0 + %i4]
	.word	0x95b20ac2	! t1_kref+0x10d4:   	fpsub32	%f8, %f2, %f10
	.word	0x9fc10000	! t1_kref+0x10d8:   	call	%g4
	.word	0x8bb24c6c	! t1_kref+0x10dc:   	fnors	%f9, %f12, %f5
	.word	0xe11fbeb8	! t1_kref+0x10e0:   	ldd	[%fp - 0x148], %f16
	.word	0xabb00280	! t1_kref+0x10e4:   	array32	%g0, %g0, %l5
	.word	0x91a10952	! t1_kref+0x10e8:   	fmuld	%f4, %f18, %f8
	.word	0x909afd7d	! t1_kref+0x10ec:   	xorcc	%o3, -0x283, %o0
	.word	0x905ee223	! t1_kref+0x10f0:   	smul	%i3, 0x223, %o0
	.word	0x92aefab2	! t1_kref+0x10f4:   	andncc	%i3, -0x54e, %o1
	.word	0x97b007a4	! t1_kref+0x10f8:   	fpackfix	%f4, %f11
	.word	0x8582c008	! t1_kref+0x10fc:   	wr	%o3, %o0, %ccr
	.word	0xdf20a00c	! t1_kref+0x1100:   	st	%f15, [%g2 + 0xc]
	.word	0x81a90a25	! t1_kref+0x1104:   	fcmps	%fcc0, %f4, %f5
	.word	0xa9b2007a	! t1_kref+0x1108:   	edge8ln	%o0, %i2, %l4
	.word	0x9432c000	! t1_kref+0x110c:   	orn	%o3, %g0, %o2
	.word	0xe89f5018	! t1_kref+0x1110:   	ldda	[%i5 + %i0]0x80, %l4
	.word	0xaa23400b	! t1_kref+0x1114:   	sub	%o5, %o3, %l5
	.word	0x91a00048	! t1_kref+0x1118:   	fmovd	%f8, %f8
	.word	0xe8380019	! t1_kref+0x111c:   	std	%l4, [%g0 + %i1]
	.word	0x8fa018c8	! t1_kref+0x1120:   	fdtos	%f8, %f7
	.word	0x91b1062a	! t1_kref+0x1124:   	fmul8x16	%f4, %f10, %f8
	.word	0xc920a03c	! t1_kref+0x1128:   	st	%f4, [%g2 + 0x3c]
	.word	0x38480004	! t1_kref+0x112c:   	bgu,a,pt	%icc, _kref+0x113c
	.word	0x99200017	! t1_kref+0x1130:   	mulscc	%g0, %l7, %o4
	.word	0xe3b8a100	! t1_kref+0x1134:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0xa9b24057	! t1_kref+0x1138:   	edge8l	%o1, %l7, %l4
	.word	0x96f3400d	! t1_kref+0x113c:   	udivcc	%o5, %o5, %o3
	.word	0xd828a014	! t1_kref+0x1140:   	stb	%o4, [%g2 + 0x14]
	.word	0x99b2caa4	! t1_kref+0x1144:   	fpsub16s	%f11, %f4, %f12
	.word	0x93b5c00b	! t1_kref+0x1148:   	edge8	%l7, %o3, %o1
	.word	0xe8be5000	! t1_kref+0x114c:   	stda	%l4, [%i1]0x80
	.word	0x85b1cdec	! t1_kref+0x1150:   	fnands	%f7, %f12, %f2
	.word	0x99a0054c	! t1_kref+0x1154:   	fsqrtd	%f12, %f12
	.word	0x81b10f44	! t1_kref+0x1158:   	fornot1	%f4, %f4, %f0
	.word	0xa9b104ca	! t1_kref+0x115c:   	fcmpne32	%f4, %f10, %l4
	.word	0x99a10848	! t1_kref+0x1160:   	faddd	%f4, %f8, %f12
	.word	0xd6262004	! t1_kref+0x1164:   	st	%o3, [%i0 + 4]
	.word	0x81de4017	! t1_kref+0x1168:   	flush	%i1 + %l7
	.word	0x96a5c017	! t1_kref+0x116c:   	subcc	%l7, %l7, %o3
	.word	0xe8062018	! t1_kref+0x1170:   	ld	[%i0 + 0x18], %l4
	.word	0x9858378d	! t1_kref+0x1174:   	smul	%g0, -0x873, %o4
	.word	0x8582400b	! t1_kref+0x1178:   	wr	%o1, %o3, %ccr
	.word	0xe26e2007	! t1_kref+0x117c:   	ldstub	[%i0 + 7], %l1
	.word	0x95b2cea0	! t1_kref+0x1180:   	fsrc1s	%f11, %f10
	.word	0x99b10dd0	! t1_kref+0x1184:   	fnand	%f4, %f16, %f12
	.word	0x9725c008	! t1_kref+0x1188:   	mulscc	%l7, %o0, %o3
	.word	0x988af064	! t1_kref+0x118c:   	andcc	%o3, -0xf9c, %o4
	.word	0x91a018cc	! t1_kref+0x1190:   	fdtos	%f12, %f8
	.word	0x9fc10000	! t1_kref+0x1194:   	call	%g4
	.word	0xd91fbf60	! t1_kref+0x1198:   	ldd	[%fp - 0xa0], %f12
	.word	0xee360000	! t1_kref+0x119c:   	sth	%l7, [%i0]
	.word	0x95a01a22	! t1_kref+0x11a0:   	fstoi	%f2, %f10
	.word	0x81b0caa5	! t1_kref+0x11a4:   	fpsub16s	%f3, %f5, %f0
	.word	0xa1a01a2c	! t1_kref+0x11a8:   	fstoi	%f12, %f16
	.word	0xac8ae53f	! t1_kref+0x11ac:   	andcc	%o3, 0x53f, %l6
	.word	0xec40a004	! t1_kref+0x11b0:   	ldsw	[%g2 + 4], %l6
	.word	0xd99eda18	! t1_kref+0x11b4:   	ldda	[%i3 + %i0]0xd0, %f12
	.word	0xac12af66	! t1_kref+0x11b8:   	or	%o2, 0xf66, %l6
	.word	0xe4086ed0	! t1_kref+0x11bc:   	ldub	[%g1 + 0xed0], %l2
	.word	0xa41ca00c	! t1_kref+0x11c0:   	xor	%l2, 0xc, %l2
	.word	0xe4286ed0	! t1_kref+0x11c4:   	stb	%l2, [%g1 + 0xed0]
	.word	0x81d86ed0	! t1_kref+0x11c8:   	flush	%g1 + 0xed0
	.word	0xa8583446	! t1_kref+0x11cc:   	smul	%g0, -0xbba, %l4
	.word	0x3a480006	! t1_kref+0x11d0:   	bcc,a,pt	%icc, _kref+0x11e8
	.word	0xc11fbf60	! t1_kref+0x11d4:   	ldd	[%fp - 0xa0], %f0
	.word	0x98aac00b	! t1_kref+0x11d8:   	andncc	%o3, %o3, %o4
	.word	0xea00a02c	! t1_kref+0x11dc:   	ld	[%g2 + 0x2c], %l5
	.word	0xea4e8019	! t1_kref+0x11e0:   	ldsb	[%i2 + %i1], %l5
	.word	0x90080008	! t1_kref+0x11e4:   	and	%g0, %o0, %o0
	.word	0xd520a034	! t1_kref+0x11e8:   	st	%f10, [%g2 + 0x34]
	.word	0x9fa00132	! t1_kref+0x11ec:   	fabss	%f18, %f15
	call	SYM(t1_subr2)
	.word	0xa5a000c6	! t1_kref+0x11f4:   	fnegd	%f6, %f18
	.word	0xd8263fe8	! t1_kref+0x11f8:   	st	%o4, [%i0 - 0x18]
	.word	0xcd00a014	! t1_kref+0x11fc:   	ld	[%g2 + 0x14], %f6
2:	.word	0xda10a014	! t1_kref+0x1200:   	lduh	[%g2 + 0x14], %o5
	.word	0x96bb4000	! t1_kref+0x1204:   	xnorcc	%o5, %g0, %o3
	.word	0x2e480001	! t1_kref+0x1208:   	bvs,a,pt	%icc, _kref+0x120c
	.word	0x89b04aa8	! t1_kref+0x120c:   	fpsub16s	%f1, %f8, %f4
	.word	0x81b00cd0	! t1_kref+0x1210:   	fnot2	%f16, %f0
	.word	0x98fa4009	! t1_kref+0x1214:   	sdivcc	%o1, %o1, %o4
	.word	0xa5a4892a	! t1_kref+0x1218:   	fmuls	%f18, %f10, %f18
	.word	0xe83e6000	! t1_kref+0x121c:   	std	%l4, [%i1]
	.word	0x91a18922	! t1_kref+0x1220:   	fmuls	%f6, %f2, %f8
	.word	0x95a01023	! t1_kref+0x1224:   	fstox	%f3, %f10
	.word	0x96630017	! t1_kref+0x1228:   	subc	%o4, %l7, %o3
	.word	0x94aac009	! t1_kref+0x122c:   	andncc	%o3, %o1, %o2
	.word	0xd0066014	! t1_kref+0x1230:   	ld	[%i1 + 0x14], %o0
	.word	0x81b20dc2	! t1_kref+0x1234:   	fnand	%f8, %f2, %f0
	.word	0xa8bee45e	! t1_kref+0x1238:   	xnorcc	%i3, 0x45e, %l4
	.word	0xabb48542	! t1_kref+0x123c:   	fcmpeq16	%f18, %f2, %l5
	.word	0xa1b106ea	! t1_kref+0x1240:   	fmul8ulx16	%f4, %f10, %f16
	.word	0x95a3cd26	! t1_kref+0x1244:   	fsmuld	%f15, %f6, %f10
	.word	0xc628242a	! t1_kref+0x1248:   	stb	%g3, [%g0 + 0x42a]
	.word	0xaf2b4000	! t1_kref+0x124c:   	sll	%o5, %g0, %l7
	.word	0x91a0cd32	! t1_kref+0x1250:   	fsmuld	%f3, %f18, %f8
	.word	0x85b40f4c	! t1_kref+0x1254:   	fornot1	%f16, %f12, %f2
	.word	0xf420a03c	! t1_kref+0x1258:   	st	%i2, [%g2 + 0x3c]
	.word	0xd6063fec	! t1_kref+0x125c:   	ld	[%i0 - 0x14], %o3
	.word	0xa80b4000	! t1_kref+0x1260:   	and	%o5, %g0, %l4
	.word	0xa5a00023	! t1_kref+0x1264:   	fmovs	%f3, %f18
	.word	0x8582ae16	! t1_kref+0x1268:   	wr	%o2, 0xe16, %ccr
	.word	0x87802082	! t1_kref+0x126c:   	mov	0x82, %asi
	.word	0xa3a28821	! t1_kref+0x1270:   	fadds	%f10, %f1, %f17
	.word	0x91a00126	! t1_kref+0x1274:   	fabss	%f6, %f8
	.word	0xdd1fbf30	! t1_kref+0x1278:   	ldd	[%fp - 0xd0], %f14
	.word	0x907ec00a	! t1_kref+0x127c:   	sdiv	%i3, %o2, %o0
	.word	0xd246201c	! t1_kref+0x1280:   	ldsw	[%i0 + 0x1c], %o1
	.word	0xa1b48e4e	! t1_kref+0x1284:   	fxnor	%f18, %f14, %f16
	.word	0x9fc00004	! t1_kref+0x1288:   	call	%g0 + %g4
	.word	0xd236200e	! t1_kref+0x128c:   	sth	%o1, [%i0 + 0xe]
	.word	0xe19e5a5b	! t1_kref+0x1290:   	ldda	[%i1 + %i3]0xd2, %f16
	.word	0x90aa8008	! t1_kref+0x1294:   	andncc	%o2, %o0, %o0
	.word	0xec40a034	! t1_kref+0x1298:   	ldsw	[%g2 + 0x34], %l6
	.word	0xee28a03c	! t1_kref+0x129c:   	stb	%l7, [%g2 + 0x3c]
	.word	0x9de3bfa0	! t1_kref+0x12a0:   	save	%sp, -0x60, %sp
	.word	0x8046c019	! t1_kref+0x12a4:   	addc	%i3, %i1, %g0
	.word	0x93e830c8	! t1_kref+0x12a8:   	restore	%g0, -0xf38, %o1
	.word	0xd430a02c	! t1_kref+0x12ac:   	sth	%o2, [%g2 + 0x2c]
	.word	0x920b4008	! t1_kref+0x12b0:   	and	%o5, %o0, %o1
	.word	0x9db106e8	! t1_kref+0x12b4:   	fmul8ulx16	%f4, %f8, %f14
	call	SYM(t1_subr3)
	.word	0x91418000	! t1_kref+0x12bc:   	mov	%fprs, %o0
	.word	0x81b006f0	! t1_kref+0x12c0:   	fmul8ulx16	%f0, %f16, %f0
	.word	0xda4e6008	! t1_kref+0x12c4:   	ldsb	[%i1 + 8], %o5
	.word	0x90e68000	! t1_kref+0x12c8:   	subccc	%i2, %g0, %o0
	.word	0x8143c000	! t1_kref+0x12cc:   	stbar
	.word	0x99a01a42	! t1_kref+0x12d0:   	fdtoi	%f2, %f12
	.word	0x20480002	! t1_kref+0x12d4:   	bn,a,pt	%icc, _kref+0x12dc
	.word	0xe500a024	! t1_kref+0x12d8:   	ld	[%g2 + 0x24], %f18
	.word	0xcd066004	! t1_kref+0x12dc:   	ld	[%i1 + 4], %f6
	.word	0x9fc00004	! t1_kref+0x12e0:   	call	%g0 + %g4
	.word	0x9aa6c00d	! t1_kref+0x12e4:   	subcc	%i3, %o5, %o5
	.word	0xac5b400a	! t1_kref+0x12e8:   	smul	%o5, %o2, %l6
	.word	0xd026601c	! t1_kref+0x12ec:   	st	%o0, [%i1 + 0x1c]
	.word	0xd53f4018	! t1_kref+0x12f0:   	std	%f10, [%i5 + %i0]
	.word	0xe81e6018	! t1_kref+0x12f4:   	ldd	[%i1 + 0x18], %l4
	.word	0x81ab0a25	! t1_kref+0x12f8:   	fcmps	%fcc0, %f12, %f5
	.word	0xd250a016	! t1_kref+0x12fc:   	ldsh	[%g2 + 0x16], %o1
	.word	0xcb86101c	! t1_kref+0x1300:   	lda	[%i0 + %i4]0x80, %f5
	.word	0xd208a014	! t1_kref+0x1304:   	ldub	[%g2 + 0x14], %o1
	.word	0x3e800008	! t1_kref+0x1308:   	bvc,a	_kref+0x1328
	.word	0x83a18920	! t1_kref+0x130c:   	fmuls	%f6, %f0, %f1
	call	SYM(t1_subr2)
	.word	0x1335a42b	! t1_kref+0x1314:   	sethi	%hi(0xd690ac00), %o1
	.word	0x91a00030	! t1_kref+0x1318:   	fmovs	%f16, %f8
	.word	0x30480005	! t1_kref+0x131c:   	ba,a,pt	%icc, _kref+0x1330
	.word	0x94730009	! t1_kref+0x1320:   	udiv	%o4, %o1, %o2
	.word	0xa786e634	! t1_kref+0x1324:   	wr	%i3, 0x634, %gsr
	.word	0x9a5a2600	! t1_kref+0x1328:   	smul	%o0, 0x600, %o5
	.word	0xf4266018	! t1_kref+0x132c:   	st	%i2, [%i1 + 0x18]
	.word	0x8da408ca	! t1_kref+0x1330:   	fsubd	%f16, %f10, %f6
	.word	0x3d480007	! t1_kref+0x1334:   	fbule,a,pt	%fcc0, _kref+0x1350
	.word	0x81b01024	! t1_kref+0x1338:   	siam	0x4
	.word	0xc1be181b	! t1_kref+0x133c:   	stda	%f0, [%i0 + %i3]0xc0
	.word	0xe43e6018	! t1_kref+0x1340:   	std	%l2, [%i1 + 0x18]
	.word	0x93b68048	! t1_kref+0x1344:   	edge8l	%i2, %o0, %o1
	.word	0xd828a00c	! t1_kref+0x1348:   	stb	%o4, [%g2 + 0xc]
	.word	0xabb105c8	! t1_kref+0x134c:   	fcmpeq32	%f4, %f8, %l5
	.word	0x91b00cc6	! t1_kref+0x1350:   	fnot2	%f6, %f8
	.word	0x81b386cc	! t1_kref+0x1354:   	fmul8sux16	%f14, %f12, %f0
	.word	0x9b282012	! t1_kref+0x1358:   	sll	%g0, 0x12, %o5
	.word	0x81a00524	! t1_kref+0x135c:   	fsqrts	%f4, %f0
	.word	0x81aaca30	! t1_kref+0x1360:   	fcmps	%fcc0, %f11, %f16
	.word	0x30480002	! t1_kref+0x1364:   	ba,a,pt	%icc, _kref+0x136c
	.word	0xd6000018	! t1_kref+0x1368:   	ld	[%g0 + %i0], %o3
	.word	0x94faa196	! t1_kref+0x136c:   	sdivcc	%o2, 0x196, %o2
	.word	0x8143e05e	! t1_kref+0x1370:   	membar	0x5e
	.word	0x29480001	! t1_kref+0x1374:   	fbl,a,pt	%fcc0, _kref+0x1378
	.word	0xda067fe0	! t1_kref+0x1378:   	ld	[%i1 - 0x20], %o5
	.word	0xa8bec008	! t1_kref+0x137c:   	xnorcc	%i3, %o0, %l4
	.word	0x99a34d21	! t1_kref+0x1380:   	fsmuld	%f13, %f1, %f12
	.word	0xe46e200e	! t1_kref+0x1384:   	ldstub	[%i0 + 0xe], %l2
	.word	0x81a01a46	! t1_kref+0x1388:   	fdtoi	%f6, %f0
	.word	0xd1063ff4	! t1_kref+0x138c:   	ld	[%i0 - 0xc], %f8
	.word	0xa9418000	! t1_kref+0x1390:   	mov	%fprs, %l4
	.word	0x81824000	! t1_kref+0x1394:   	wr	%o1, %g0, %y
	.word	0x985b001a	! t1_kref+0x1398:   	smul	%o4, %i2, %o4
	.word	0x9682e51c	! t1_kref+0x139c:   	addcc	%o3, 0x51c, %o3
	.word	0x95b086ea	! t1_kref+0x13a0:   	fmul8ulx16	%f2, %f10, %f10
	.word	0x993a2019	! t1_kref+0x13a4:   	sra	%o0, 0x19, %o4
	.word	0x973ee010	! t1_kref+0x13a8:   	sra	%i3, 0x10, %o3
	.word	0xa8933e59	! t1_kref+0x13ac:   	orcc	%o4, -0x1a7, %l4
	.word	0xa3a048ab	! t1_kref+0x13b0:   	fsubs	%f1, %f11, %f17
	.word	0xd80e7ff2	! t1_kref+0x13b4:   	ldub	[%i1 - 0xe], %o4
	.word	0x9685f9fc	! t1_kref+0x13b8:   	addcc	%l7, -0x604, %o3
	.word	0x32480001	! t1_kref+0x13bc:   	bne,a,pt	%icc, _kref+0x13c0
	.word	0xacd5ef63	! t1_kref+0x13c0:   	umulcc	%l7, 0xf63, %l6
	.word	0x901ee655	! t1_kref+0x13c4:   	xor	%i3, 0x655, %o0
	sethi	%hi(2f), %o7
	.word	0xe40be3f0	! t1_kref+0x13cc:   	ldub	[%o7 + 0x3f0], %l2
	.word	0xa41ca00c	! t1_kref+0x13d0:   	xor	%l2, 0xc, %l2
	.word	0xe42be3f0	! t1_kref+0x13d4:   	stb	%l2, [%o7 + 0x3f0]
	.word	0x81dbe3f0	! t1_kref+0x13d8:   	flush	%o7 + 0x3f0
	.word	0xaafab1ee	! t1_kref+0x13dc:   	sdivcc	%o2, -0xe12, %l5
	.word	0xa1a01a42	! t1_kref+0x13e0:   	fdtoi	%f2, %f16
	.word	0xacb2801b	! t1_kref+0x13e4:   	orncc	%o2, %i3, %l6
	.word	0xd5be1000	! t1_kref+0x13e8:   	stda	%f10, [%i0]0x80
	.word	0xa3a4092f	! t1_kref+0x13ec:   	fmuls	%f16, %f15, %f17
2:	.word	0xa82026be	! t1_kref+0x13f0:   	sub	%g0, 0x6be, %l4
	.word	0xd99f5a58	! t1_kref+0x13f4:   	ldda	[%i5 + %i0]0xd2, %f12
	.word	0xc900a00c	! t1_kref+0x13f8:   	ld	[%g2 + 0xc], %f4
	.word	0xe326600c	! t1_kref+0x13fc:   	st	%f17, [%i1 + 0xc]
	.word	0xa9b28452	! t1_kref+0x1400:   	fcmpne16	%f10, %f18, %l4
	.word	0x9a82800d	! t1_kref+0x1404:   	addcc	%o2, %o5, %o5
	.word	0x2d480008	! t1_kref+0x1408:   	fbg,a,pt	%fcc0, _kref+0x1428
	.word	0xe028001a	! t1_kref+0x140c:   	stb	%l0, [%g0 + %i2]
	.word	0x91b18a8c	! t1_kref+0x1410:   	fpsub16	%f6, %f12, %f8
	.word	0x8143c000	! t1_kref+0x1414:   	stbar
	.word	0x95a01a27	! t1_kref+0x1418:   	fstoi	%f7, %f10
	.word	0xabb28200	! t1_kref+0x141c:   	array8	%o2, %g0, %l5
	.word	0xd9e6500a	! t1_kref+0x1420:   	casa	[%i1]0x80, %o2, %o4
	.word	0xad22f419	! t1_kref+0x1424:   	mulscc	%o3, -0xbe7, %l6
	.word	0xa1a00550	! t1_kref+0x1428:   	fsqrtd	%f16, %f16
	sethi	%hi(2f), %o7
	.word	0xe40be058	! t1_kref+0x1430:   	ldub	[%o7 + 0x58], %l2
	.word	0xa41ca00c	! t1_kref+0x1434:   	xor	%l2, 0xc, %l2
	.word	0xe42be058	! t1_kref+0x1438:   	stb	%l2, [%o7 + 0x58]
	.word	0x81dbe058	! t1_kref+0x143c:   	flush	%o7 + 0x58
	call	SYM(t1_subr3)
	.word	0xa3a01a46	! t1_kref+0x1444:   	fdtoi	%f6, %f17
	.word	0x99a04d27	! t1_kref+0x1448:   	fsmuld	%f1, %f7, %f12
	.word	0xac1dffc4	! t1_kref+0x144c:   	xor	%l7, -0x3c, %l6
	.word	0x81d96f7c	! t1_kref+0x1450:   	flush	%g5 + 0xf7c
	.word	0xd24e001a	! t1_kref+0x1454:   	ldsb	[%i0 + %i2], %o1
2:	.word	0x91a108ce	! t1_kref+0x1458:   	fsubd	%f4, %f14, %f8
	.word	0x95400000	! t1_kref+0x145c:   	mov	%y, %o2
	.word	0xf007bfe0	! t1_kref+0x1460:   	ld	[%fp - 0x20], %i0
	.word	0xd4266000	! t1_kref+0x1464:   	st	%o2, [%i1]
	.word	0x30480007	! t1_kref+0x1468:   	ba,a,pt	%icc, _kref+0x1484
	.word	0xae5a400c	! t1_kref+0x146c:   	smul	%o1, %o4, %l7
	.word	0x91a0004a	! t1_kref+0x1470:   	fmovd	%f10, %f8
	.word	0x8da30842	! t1_kref+0x1474:   	faddd	%f12, %f2, %f6
	.word	0xec3e0000	! t1_kref+0x1478:   	std	%l6, [%i0]
	.word	0xae834000	! t1_kref+0x147c:   	addcc	%o5, %g0, %l7
	.word	0xc020a024	! t1_kref+0x1480:   	clr	[%g2 + 0x24]
	.word	0x81b48990	! t1_kref+0x1484:   	bshuffle	%f18, %f16, %f0
	.word	0xae828017	! t1_kref+0x1488:   	addcc	%o2, %l7, %l7
	.word	0x9da01921	! t1_kref+0x148c:   	fstod	%f1, %f14
	.word	0xd51e7fe0	! t1_kref+0x1490:   	ldd	[%i1 - 0x20], %f10
	.word	0xd19e1a1b	! t1_kref+0x1494:   	ldda	[%i0 + %i3]0xd0, %f8
	.word	0x3c480006	! t1_kref+0x1498:   	bpos,a,pt	%icc, _kref+0x14b0
	.word	0xc9000019	! t1_kref+0x149c:   	ld	[%g0 + %i1], %f4
	.word	0xea5e7fe8	! t1_kref+0x14a0:   	ldx	[%i1 - 0x18], %l5
	.word	0x89a1892a	! t1_kref+0x14a4:   	fmuls	%f6, %f10, %f4
	.word	0x8143c000	! t1_kref+0x14a8:   	stbar
	.word	0x949b0008	! t1_kref+0x14ac:   	xorcc	%o4, %o0, %o2
	.word	0xd3067fe8	! t1_kref+0x14b0:   	ld	[%i1 - 0x18], %f9
	.word	0x8ba000a4	! t1_kref+0x14b4:   	fnegs	%f4, %f5
	.word	0xec3e3ff8	! t1_kref+0x14b8:   	std	%l6, [%i0 - 8]
	.word	0xc807bff0	! t1_kref+0x14bc:   	ld	[%fp - 0x10], %g4
	.word	0xea96501b	! t1_kref+0x14c0:   	lduha	[%i1 + %i3]0x80, %l5
	.word	0xd1000019	! t1_kref+0x14c4:   	ld	[%g0 + %i1], %f8
	.word	0xae7a2e76	! t1_kref+0x14c8:   	sdiv	%o0, 0xe76, %l7
	.word	0x85a01a23	! t1_kref+0x14cc:   	fstoi	%f3, %f2
	.word	0xd05e0000	! t1_kref+0x14d0:   	ldx	[%i0], %o0
	.word	0x2f480008	! t1_kref+0x14d4:   	fbu,a,pt	%fcc0, _kref+0x14f4
	.word	0x980b7d4a	! t1_kref+0x14d8:   	and	%o5, -0x2b6, %o4
	.word	0xe83e401d	! t1_kref+0x14dc:   	std	%l4, [%i1 + %i5]
	.word	0xa1a009c0	! t1_kref+0x14e0:   	fdivd	%f0, %f0, %f16
	.word	0x21480003	! t1_kref+0x14e4:   	fbn,a,pt	%fcc0, _kref+0x14f0
	.word	0x87a01a28	! t1_kref+0x14e8:   	fstoi	%f8, %f3
	.word	0x9935c00c	! t1_kref+0x14ec:   	srl	%l7, %o4, %o4
	.word	0xabb2054e	! t1_kref+0x14f0:   	fcmpeq16	%f8, %f14, %l5
	.word	0xafb28280	! t1_kref+0x14f4:   	array32	%o2, %g0, %l7
	.word	0x9202800d	! t1_kref+0x14f8:   	add	%o2, %o5, %o1
	.word	0x9816c01b	! t1_kref+0x14fc:   	or	%i3, %i3, %o4
	.word	0xd0ee9018	! t1_kref+0x1500:   	ldstuba	[%i2 + %i0]0x80, %o0
	.word	0xd028a035	! t1_kref+0x1504:   	stb	%o0, [%g2 + 0x35]
	.word	0x89a3094e	! t1_kref+0x1508:   	fmuld	%f12, %f14, %f4
	.word	0xea560000	! t1_kref+0x150c:   	ldsh	[%i0], %l5
	.word	0xa3a0012e	! t1_kref+0x1510:   	fabss	%f14, %f17
	.word	0x93b18ea0	! t1_kref+0x1514:   	fsrc1s	%f6, %f9
	.word	0xd8367fea	! t1_kref+0x1518:   	sth	%o4, [%i1 - 0x16]
	.word	0xe83e7ff8	! t1_kref+0x151c:   	std	%l4, [%i1 - 8]
	.word	0xd51fbeb0	! t1_kref+0x1520:   	ldd	[%fp - 0x150], %f10
	.word	0xe43f4018	! t1_kref+0x1524:   	std	%l2, [%i5 + %i0]
	.word	0x81aa8acc	! t1_kref+0x1528:   	fcmped	%fcc0, %f10, %f12
	.word	0xa940c000	! t1_kref+0x152c:   	mov	%asi, %l4
	.word	0x8da2cd2f	! t1_kref+0x1530:   	fsmuld	%f11, %f15, %f6
	.word	0xec067ff0	! t1_kref+0x1534:   	ld	[%i1 - 0x10], %l6
	.word	0xaa26a0ba	! t1_kref+0x1538:   	sub	%i2, 0xba, %l5
	.word	0xe806601c	! t1_kref+0x153c:   	ld	[%i1 + 0x1c], %l4
	.word	0xa1b40ace	! t1_kref+0x1540:   	fpsub32	%f16, %f14, %f16
	.word	0x91a01910	! t1_kref+0x1544:   	fitod	%f16, %f8
	.word	0x945ac01b	! t1_kref+0x1548:   	smul	%o3, %i3, %o2
	.word	0xa1a00540	! t1_kref+0x154c:   	fsqrtd	%f0, %f16
	.word	0xd8b6101b	! t1_kref+0x1550:   	stha	%o4, [%i0 + %i3]0x80
	.word	0x8da108ce	! t1_kref+0x1554:   	fsubd	%f4, %f14, %f6
	.word	0x96e6801b	! t1_kref+0x1558:   	subccc	%i2, %i3, %o3
	.word	0x170f5814	! t1_kref+0x155c:   	sethi	%hi(0x3d605000), %o3
	.word	0xea0e4000	! t1_kref+0x1560:   	ldub	[%i1], %l5
	.word	0xc0f65000	! t1_kref+0x1564:   	stxa	%g0, [%i1]0x80
	.word	0x99b6c0c8	! t1_kref+0x1568:   	edge16l	%i3, %o0, %o4
	.word	0x2f480008	! t1_kref+0x156c:   	fbu,a,pt	%fcc0, _kref+0x158c
	.word	0xc100a00c	! t1_kref+0x1570:   	ld	[%g2 + 0xc], %f0
	.word	0x97203b41	! t1_kref+0x1574:   	mulscc	%g0, -0x4bf, %o3
	.word	0x93418000	! t1_kref+0x1578:   	mov	%fprs, %o1
	.word	0xafb2c0ac	! t1_kref+0x157c:   	edge16n	%o3, %o4, %l7
	.word	0x21480005	! t1_kref+0x1580:   	fbn,a,pt	%fcc0, _kref+0x1594
	.word	0xd040a014	! t1_kref+0x1584:   	ldsw	[%g2 + 0x14], %o0
	.word	0x99a01908	! t1_kref+0x1588:   	fitod	%f8, %f12
	.word	0x9012b22e	! t1_kref+0x158c:   	or	%o2, -0xdd2, %o0
	.word	0xe806001c	! t1_kref+0x1590:   	ld	[%i0 + %i4], %l4
	.word	0x33480001	! t1_kref+0x1594:   	fbe,a,pt	%fcc0, _kref+0x1598
	.word	0xdf066008	! t1_kref+0x1598:   	ld	[%i1 + 8], %f15
	.word	0x89b10d40	! t1_kref+0x159c:   	fnot1	%f4, %f4
	.word	0x9475eec3	! t1_kref+0x15a0:   	udiv	%l7, 0xec3, %o2
	.word	0x99a01921	! t1_kref+0x15a4:   	fstod	%f1, %f12
	.word	0xafb30328	! t1_kref+0x15a8:   	bmask	%o4, %o0, %l7
	.word	0x81de31dd	! t1_kref+0x15ac:   	flush	%i0 - 0xe23
	.word	0x8143e040	! t1_kref+0x15b0:   	membar	0x40
	.word	0x9fa9c030	! t1_kref+0x15b4:   	fmovsu	%fcc0, %f16, %f15
	.word	0xaf23000c	! t1_kref+0x15b8:   	mulscc	%o4, %o4, %l7
	.word	0x81a08d2c	! t1_kref+0x15bc:   	fsmuld	%f2, %f12, %f0
	.word	0x28480001	! t1_kref+0x15c0:   	bleu,a,pt	%icc, _kref+0x15c4
	.word	0xe8063ff0	! t1_kref+0x15c4:   	ld	[%i0 - 0x10], %l4
	.word	0x96426d7a	! t1_kref+0x15c8:   	addc	%o1, 0xd7a, %o3
	.word	0xcd9e1000	! t1_kref+0x15cc:   	ldda	[%i0]0x80, %f6
	.word	0x85a000ca	! t1_kref+0x15d0:   	fnegd	%f10, %f2
	.word	0xab12f6be	! t1_kref+0x15d4:   	taddcctv	%o3, -0x942, %l5
	.word	0x9836c00a	! t1_kref+0x15d8:   	orn	%i3, %o2, %o4
	.word	0xd64e8019	! t1_kref+0x15dc:   	ldsb	[%i2 + %i1], %o3
	sethi	%hi(2f), %o7
	.word	0xe40be220	! t1_kref+0x15e4:   	ldub	[%o7 + 0x220], %l2
	.word	0xa41ca00c	! t1_kref+0x15e8:   	xor	%l2, 0xc, %l2
	.word	0xe42be220	! t1_kref+0x15ec:   	stb	%l2, [%o7 + 0x220]
	.word	0x81dbe220	! t1_kref+0x15f0:   	flush	%o7 + 0x220
	.word	0x91a00544	! t1_kref+0x15f4:   	fsqrtd	%f4, %f8
	.word	0xee2e8019	! t1_kref+0x15f8:   	stb	%l7, [%i2 + %i1]
	.word	0xafb5c11a	! t1_kref+0x15fc:   	edge32	%l7, %i2, %l7
	.word	0xa1a01901	! t1_kref+0x1600:   	fitod	%f1, %f16
	.word	0x91a089ce	! t1_kref+0x1604:   	fdivd	%f2, %f14, %f8
	.word	0xe138001d	! t1_kref+0x1608:   	std	%f16, [%g0 + %i5]
	.word	0xe06e201e	! t1_kref+0x160c:   	ldstub	[%i0 + 0x1e], %l0
	.word	0xc16e6000	! t1_kref+0x1610:   	prefetch	%i1, 0
	.word	0xaa123313	! t1_kref+0x1614:   	or	%o0, -0xced, %l5
	.word	0x22480004	! t1_kref+0x1618:   	be,a,pt	%icc, _kref+0x1628
	.word	0xaca2400b	! t1_kref+0x161c:   	subcc	%o1, %o3, %l6
2:	.word	0x87a0002f	! t1_kref+0x1620:   	fmovs	%f15, %f3
	.word	0xac1e800b	! t1_kref+0x1624:   	xor	%i2, %o3, %l6
	.word	0xda366018	! t1_kref+0x1628:   	sth	%o5, [%i1 + 0x18]
	.word	0x37480008	! t1_kref+0x162c:   	fbge,a,pt	%fcc0, _kref+0x164c
	.word	0xee4e3fe4	! t1_kref+0x1630:   	ldsb	[%i0 - 0x1c], %l7
	.word	0xd2300018	! t1_kref+0x1634:   	sth	%o1, [%g0 + %i0]
	.word	0xd40e6008	! t1_kref+0x1638:   	ldub	[%i1 + 8], %o2
	.word	0x81824000	! t1_kref+0x163c:   	wr	%o1, %g0, %y
	.word	0x95b08dc0	! t1_kref+0x1640:   	fnand	%f2, %f0, %f10
	call	SYM(t1_subr0)
	.word	0x98f82b19	! t1_kref+0x1648:   	sdivcc	%g0, 0xb19, %o4
	.word	0xd2267ff8	! t1_kref+0x164c:   	st	%o1, [%i1 - 8]
	.word	0x8da01903	! t1_kref+0x1650:   	fitod	%f3, %f6
	.word	0x9fc00004	! t1_kref+0x1654:   	call	%g0 + %g4
	.word	0xd8066008	! t1_kref+0x1658:   	ld	[%i1 + 8], %o4
	.word	0x81a98a27	! t1_kref+0x165c:   	fcmps	%fcc0, %f6, %f7
	.word	0xe100a03c	! t1_kref+0x1660:   	ld	[%g2 + 0x3c], %f16
	.word	0x85a208c6	! t1_kref+0x1664:   	fsubd	%f8, %f6, %f2
	.word	0x94902492	! t1_kref+0x1668:   	orcc	%g0, 0x492, %o2
	.word	0xee0e3fee	! t1_kref+0x166c:   	ldub	[%i0 - 0x12], %l7
	.word	0x940ec017	! t1_kref+0x1670:   	and	%i3, %l7, %o2
	.word	0x91a00550	! t1_kref+0x1674:   	fsqrtd	%f16, %f8
	.word	0xe840a004	! t1_kref+0x1678:   	ldsw	[%g2 + 4], %l4
	.word	0x89b18906	! t1_kref+0x167c:   	faligndata	%f6, %f6, %f4
	.word	0x8db24968	! t1_kref+0x1680:   	fpmerge	%f9, %f8, %f6
	.word	0xd606001c	! t1_kref+0x1684:   	ld	[%i0 + %i4], %o3
	.word	0x9140c000	! t1_kref+0x1688:   	mov	%asi, %o0
	.word	0x83a3c928	! t1_kref+0x168c:   	fmuls	%f15, %f8, %f1
	.word	0x9a9abbc7	! t1_kref+0x1690:   	xorcc	%o2, -0x439, %o5
	.word	0x8da089d2	! t1_kref+0x1694:   	fdivd	%f2, %f18, %f6
	.word	0xf620a00c	! t1_kref+0x1698:   	st	%i3, [%g2 + 0xc]
	.word	0x99a20946	! t1_kref+0x169c:   	fmuld	%f8, %f6, %f12
	.word	0x9682a4c8	! t1_kref+0x16a0:   	addcc	%o2, 0x4c8, %o3
	.word	0x9522400b	! t1_kref+0x16a4:   	mulscc	%o1, %o3, %o2
	.word	0x94624017	! t1_kref+0x16a8:   	subc	%o1, %l7, %o2
	call	SYM(t1_subr0)
	.word	0xd1270018	! t1_kref+0x16b0:   	st	%f8, [%i4 + %i0]
	.word	0x925b64b9	! t1_kref+0x16b4:   	smul	%o5, 0x4b9, %o1
	.word	0xd600a004	! t1_kref+0x16b8:   	ld	[%g2 + 4], %o3
	.word	0xee48a014	! t1_kref+0x16bc:   	ldsb	[%g2 + 0x14], %l7
	.word	0xf630a036	! t1_kref+0x16c0:   	sth	%i3, [%g2 + 0x36]
	.word	0x99234017	! t1_kref+0x16c4:   	mulscc	%o5, %l7, %o4
	.word	0xa8fa4008	! t1_kref+0x16c8:   	sdivcc	%o1, %o0, %l4
	.word	0xab26edc5	! t1_kref+0x16cc:   	mulscc	%i3, 0xdc5, %l5
	.word	0x8db18d12	! t1_kref+0x16d0:   	fandnot1	%f6, %f18, %f6
	.word	0xd8066018	! t1_kref+0x16d4:   	ld	[%i1 + 0x18], %o4
	.word	0x97b0040a	! t1_kref+0x16d8:   	fcmple16	%f0, %f10, %o3
	.word	0x9de3bfa0	! t1_kref+0x16dc:   	save	%sp, -0x60, %sp
	.word	0x97ef401c	! t1_kref+0x16e0:   	restore	%i5, %i4, %o3
	.word	0x35800001	! t1_kref+0x16e4:   	fbue,a	_kref+0x16e8
	.word	0x99a00544	! t1_kref+0x16e8:   	fsqrtd	%f4, %f12
	.word	0xd0364000	! t1_kref+0x16ec:   	sth	%o0, [%i1]
	.word	0x94bb4009	! t1_kref+0x16f0:   	xnorcc	%o5, %o1, %o2
	.word	0x81ac4a2a	! t1_kref+0x16f4:   	fcmps	%fcc0, %f17, %f10
	.word	0xc7000019	! t1_kref+0x16f8:   	ld	[%g0 + %i1], %f3
	.word	0x95a24d24	! t1_kref+0x16fc:   	fsmuld	%f9, %f4, %f10
	.word	0xec4e0000	! t1_kref+0x1700:   	ldsb	[%i0], %l6
	.word	0x9878000c	! t1_kref+0x1704:   	sdiv	%g0, %o4, %o4
	.word	0xf207bfe0	! t1_kref+0x1708:   	ld	[%fp - 0x20], %i1
	.word	0xd6066004	! t1_kref+0x170c:   	ld	[%i1 + 4], %o3
	.word	0xebe65000	! t1_kref+0x1710:   	casa	[%i1]0x80, %g0, %l5
	.word	0xc02e8019	! t1_kref+0x1714:   	clrb	[%i2 + %i1]
	.word	0x86102006	! t1_kref+0x1718:   	mov	0x6, %g3
	.word	0x86a0e001	! t1_kref+0x171c:   	subcc	%g3, 1, %g3
	.word	0x2280000e	! t1_kref+0x1720:   	be,a	_kref+0x1758
	.word	0xdd1fbec8	! t1_kref+0x1724:   	ldd	[%fp - 0x138], %f14
	.word	0x8d86c017	! t1_kref+0x1728:   	wr	%i3, %l7, %fprs
	.word	0x95a00550	! t1_kref+0x172c:   	fsqrtd	%f16, %f10
	.word	0xd8680019	! t1_kref+0x1730:   	ldstub	[%g0 + %i1], %o4
	.word	0x81a88a4c	! t1_kref+0x1734:   	fcmpd	%fcc0, %f2, %f12
	.word	0xe8067ff8	! t1_kref+0x1738:   	ld	[%i1 - 8], %l4
	.word	0xa5a01a26	! t1_kref+0x173c:   	fstoi	%f6, %f18
	.word	0x81a0192e	! t1_kref+0x1740:   	fstod	%f14, %f0
	.word	0x985b4009	! t1_kref+0x1744:   	smul	%o5, %o1, %o4
	.word	0xda10a01e	! t1_kref+0x1748:   	lduh	[%g2 + 0x1e], %o5
	.word	0xd440a004	! t1_kref+0x174c:   	ldsw	[%g2 + 4], %o2
	.word	0xaa3b0017	! t1_kref+0x1750:   	xnor	%o4, %l7, %l5
	.word	0xa1b206ce	! t1_kref+0x1754:   	fmul8sux16	%f8, %f14, %f16
	.word	0xaa13000c	! t1_kref+0x1758:   	or	%o4, %o4, %l5
	.word	0x9860000d	! t1_kref+0x175c:   	subc	%g0, %o5, %o4
	.word	0xd206200c	! t1_kref+0x1760:   	ld	[%i0 + 0xc], %o1
	.word	0xaf2b401a	! t1_kref+0x1764:   	sll	%o5, %i2, %l7
	.word	0x9f414000	! t1_kref+0x1768:   	mov	%pc, %o7
!	.word	0x2c4f4a22	! t1_kref+0x176c:   	bneg,a,pt	%icc, SYM(t1_subr1)
	   	bneg,a,pt	%icc, SYM(t1_subr1)
	.word	0x95a0192d	! t1_kref+0x1770:   	fstod	%f13, %f10
	.word	0xd450a024	! t1_kref+0x1774:   	ldsh	[%g2 + 0x24], %o2
	.word	0x933a6012	! t1_kref+0x1778:   	sra	%o1, 0x12, %o1
	.word	0x99b2c308	! t1_kref+0x177c:   	alignaddr	%o3, %o0, %o4
	.word	0xec0e0000	! t1_kref+0x1780:   	ldub	[%i0], %l6
	.word	0x93a018c2	! t1_kref+0x1784:   	fdtos	%f2, %f9
	.word	0x9db28663	! t1_kref+0x1788:   	fmul8x16au	%f10, %f3, %f14
	.word	0xec467ff8	! t1_kref+0x178c:   	ldsw	[%i1 - 8], %l6
	.word	0x9fa0c926	! t1_kref+0x1790:   	fmuls	%f3, %f6, %f15
	.word	0x81b14c6c	! t1_kref+0x1794:   	fnors	%f5, %f12, %f0
	.word	0xe5067ffc	! t1_kref+0x1798:   	ld	[%i1 - 4], %f18
	.word	0x85a90050	! t1_kref+0x179c:   	fmovdl	%fcc0, %f16, %f2
	.word	0x8143c000	! t1_kref+0x17a0:   	stbar
	.word	0x91b28c6f	! t1_kref+0x17a4:   	fnors	%f10, %f15, %f8
	sethi	%hi(2f), %o7
	.word	0xe40be3d0	! t1_kref+0x17ac:   	ldub	[%o7 + 0x3d0], %l2
	.word	0xa41ca00c	! t1_kref+0x17b0:   	xor	%l2, 0xc, %l2
	.word	0xe42be3d0	! t1_kref+0x17b4:   	stb	%l2, [%o7 + 0x3d0]
	.word	0x81dbe3d0	! t1_kref+0x17b8:   	flush	%o7 + 0x3d0
	.word	0x8ba00128	! t1_kref+0x17bc:   	fabss	%f8, %f5
	.word	0x949ae6e4	! t1_kref+0x17c0:   	xorcc	%o3, 0x6e4, %o2
	.word	0x9418288f	! t1_kref+0x17c4:   	xor	%g0, 0x88f, %o2
	.word	0x99b00400	! t1_kref+0x17c8:   	fcmple16	%f0, %f0, %o4
	.word	0xa1a01922	! t1_kref+0x17cc:   	fstod	%f2, %f16
2:	.word	0xa023000c	! t1_kref+0x17d0:   	sub	%o4, %o4, %l0
	sethi	%hi(2f), %o7
	.word	0xe40be01c	! t1_kref+0x17d8:   	ldub	[%o7 + 0x1c], %l2
	.word	0xa41ca00c	! t1_kref+0x17dc:   	xor	%l2, 0xc, %l2
	.word	0xe42be01c	! t1_kref+0x17e0:   	stb	%l2, [%o7 + 0x1c]
	.word	0x81dbe01c	! t1_kref+0x17e4:   	flush	%o7 + 0x1c
	.word	0xae62400c	! t1_kref+0x17e8:   	subc	%o1, %o4, %l7
	.word	0x38480004	! t1_kref+0x17ec:   	bgu,a,pt	%icc, _kref+0x17fc
	.word	0x94f8000d	! t1_kref+0x17f0:   	sdivcc	%g0, %o5, %o2
	.word	0xea470019	! t1_kref+0x17f4:   	ldsw	[%i4 + %i1], %l5
	.word	0xd826001c	! t1_kref+0x17f8:   	st	%o4, [%i0 + %i4]
	.word	0x1130156d	! t1_kref+0x17fc:   	sethi	%hi(0xc055b400), %o0
	.word	0xc3267ff0	! t1_kref+0x1800:   	st	%f1, [%i1 - 0x10]
	.word	0x8143c000	! t1_kref+0x1804:   	stbar
	.word	0x9f414000	! t1_kref+0x1808:   	mov	%pc, %o7
	.word	0xd450a01e	! t1_kref+0x180c:   	ldsh	[%g2 + 0x1e], %o2
	.word	0xda56401b	! t1_kref+0x1810:   	ldsh	[%i1 + %i3], %o5
	.word	0xa1a018c0	! t1_kref+0x1814:   	fdtos	%f0, %f16
	.word	0x98ba8009	! t1_kref+0x1818:   	xnorcc	%o2, %o1, %o4
2:	.word	0xac330008	! t1_kref+0x181c:   	orn	%o4, %o0, %l6
	.word	0xae76801a	! t1_kref+0x1820:   	udiv	%i2, %i2, %l7
	.word	0x91b08a48	! t1_kref+0x1824:   	fpadd32	%f2, %f8, %f8
	.word	0x96f2401b	! t1_kref+0x1828:   	udivcc	%o1, %i3, %o3
	.word	0x85b20c8e	! t1_kref+0x182c:   	fandnot2	%f8, %f14, %f2
	.word	0xa1a00550	! t1_kref+0x1830:   	fsqrtd	%f16, %f16
	.word	0x93b3400b	! t1_kref+0x1834:   	edge8	%o5, %o3, %o1
	.word	0xe668a017	! t1_kref+0x1838:   	ldstub	[%g2 + 0x17], %l3
	.word	0xaea26a93	! t1_kref+0x183c:   	subcc	%o1, 0xa93, %l7
	.word	0xab66666f	! t1_kref+0x1840:   	movne	%icc, -0x191, %l5
	.word	0x81b00f0c	! t1_kref+0x1844:   	fsrc2	%f12, %f0
	.word	0x85a0084e	! t1_kref+0x1848:   	faddd	%f0, %f14, %f2
	.word	0x9a92800d	! t1_kref+0x184c:   	orcc	%o2, %o5, %o5
	.word	0x9db40aca	! t1_kref+0x1850:   	fpsub32	%f16, %f10, %f14
	.word	0x8d85ff52	! t1_kref+0x1854:   	wr	%l7, 0xffffff52, %fprs
	.word	0x91b00721	! t1_kref+0x1858:   	fmuld8ulx16	%f0, %f1, %f8
	.word	0x31480002	! t1_kref+0x185c:   	fba,a,pt	%fcc0, _kref+0x1864
	.word	0x85a28d26	! t1_kref+0x1860:   	fsmuld	%f10, %f6, %f2
	call	SYM(t1_subr2)
	.word	0xcd270000	! t1_kref+0x1868:   	st	%f6, [%i4]
	.word	0x89a00550	! t1_kref+0x186c:   	fsqrtd	%f16, %f4
	.word	0xaf2ea017	! t1_kref+0x1870:   	sll	%i2, 0x17, %l7
	.word	0x81a84a27	! t1_kref+0x1874:   	fcmps	%fcc0, %f1, %f7
	.word	0x91b00109	! t1_kref+0x1878:   	edge32	%g0, %o1, %o0
	.word	0xaeda4000	! t1_kref+0x187c:   	smulcc	%o1, %g0, %l7
	.word	0x9a300008	! t1_kref+0x1880:   	orn	%g0, %o0, %o5
	.word	0xd6ee9019	! t1_kref+0x1884:   	ldstuba	[%i2 + %i1]0x80, %o3
	.word	0x9bb00049	! t1_kref+0x1888:   	edge8l	%g0, %o1, %o5
	.word	0x38480005	! t1_kref+0x188c:   	bgu,a,pt	%icc, _kref+0x18a0
	.word	0x91b30d21	! t1_kref+0x1890:   	fandnot1s	%f12, %f1, %f8
	.word	0xe8500019	! t1_kref+0x1894:   	ldsh	[%g0 + %i1], %l4
	.word	0xee28a037	! t1_kref+0x1898:   	stb	%l7, [%g2 + 0x37]
	.word	0xffee101a	! t1_kref+0x189c:   	prefetcha	%i0 + %i2, 31
	.word	0xda000019	! t1_kref+0x18a0:   	ld	[%g0 + %i1], %o5
	.word	0xe43e3ff0	! t1_kref+0x18a4:   	std	%l2, [%i0 - 0x10]
	.word	0xac20001a	! t1_kref+0x18a8:   	neg	%i2, %l6
	.word	0x8db08990	! t1_kref+0x18ac:   	bshuffle	%f2, %f16, %f6
	.word	0x3e480005	! t1_kref+0x18b0:   	bvc,a,pt	%icc, _kref+0x18c4
	.word	0xeb6e401d	! t1_kref+0x18b4:   	prefetch	%i1 + %i5, 21
	.word	0xadb6c06d	! t1_kref+0x18b8:   	edge8ln	%i3, %o5, %l6
	.word	0x99a20946	! t1_kref+0x18bc:   	fmuld	%f8, %f6, %f12
	.word	0x81b48d2b	! t1_kref+0x18c0:   	fandnot1s	%f18, %f11, %f0
	.word	0xe078a03c	! t1_kref+0x18c4:   	swap	[%g2 + 0x3c], %l0
	.word	0xe19e5a5b	! t1_kref+0x18c8:   	ldda	[%i1 + %i3]0xd2, %f16
	.word	0x8fa01a30	! t1_kref+0x18cc:   	fstoi	%f16, %f7
	.word	0xd59f5019	! t1_kref+0x18d0:   	ldda	[%i5 + %i1]0x80, %f10
	.word	0xa5a0102f	! t1_kref+0x18d4:   	fstox	%f15, %f18
	.word	0x2e480005	! t1_kref+0x18d8:   	bvs,a,pt	%icc, _kref+0x18ec
	.word	0xd80e0000	! t1_kref+0x18dc:   	ldub	[%i0], %o4
	.word	0xa1b18d40	! t1_kref+0x18e0:   	fnot1	%f6, %f16
	.word	0xe8063fe4	! t1_kref+0x18e4:   	ld	[%i0 - 0x1c], %l4
	.word	0x99a0012d	! t1_kref+0x18e8:   	fabss	%f13, %f12
	.word	0x9ae232e2	! t1_kref+0x18ec:   	subccc	%o0, -0xd1e, %o5
	.word	0xd41f4019	! t1_kref+0x18f0:   	ldd	[%i5 + %i1], %o2
	.word	0xe06e7fef	! t1_kref+0x18f4:   	ldstub	[%i1 - 0x11], %l0
	.word	0xdd063fec	! t1_kref+0x18f8:   	ld	[%i0 - 0x14], %f14
	.word	0x9da0190e	! t1_kref+0x18fc:   	fitod	%f14, %f14
	.word	0x9af36b55	! t1_kref+0x1900:   	udivcc	%o5, 0xb55, %o5
	.word	0xd0d6d018	! t1_kref+0x1904:   	ldsha	[%i3 + %i0]0x80, %o0
	.word	0xaabaa1b9	! t1_kref+0x1908:   	xnorcc	%o2, 0x1b9, %l5
	.word	0xd86e3ff9	! t1_kref+0x190c:   	ldstub	[%i0 - 7], %o4
	.word	0x9da00548	! t1_kref+0x1910:   	fsqrtd	%f8, %f14
	.word	0xd000a024	! t1_kref+0x1914:   	ld	[%g2 + 0x24], %o0
	.word	0x90aeab4b	! t1_kref+0x1918:   	andncc	%i2, 0xb4b, %o0
	.word	0x150ff4ce	! t1_kref+0x191c:   	sethi	%hi(0x3fd33800), %o2
	.word	0x9fc10000	! t1_kref+0x1920:   	call	%g4
	.word	0xacd5c017	! t1_kref+0x1924:   	umulcc	%l7, %l7, %l6
	.word	0x33480001	! t1_kref+0x1928:   	fbe,a,pt	%fcc0, _kref+0x192c
	.word	0x96126baa	! t1_kref+0x192c:   	or	%o1, 0xbaa, %o3
	.word	0xd848a025	! t1_kref+0x1930:   	ldsb	[%g2 + 0x25], %o4
	.word	0xf76e401c	! t1_kref+0x1934:   	prefetch	%i1 + %i4, 27
	.word	0xd4067ff0	! t1_kref+0x1938:   	ld	[%i1 - 0x10], %o2
	.word	0x2e800002	! t1_kref+0x193c:   	bvs,a	_kref+0x1944
	.word	0x908ac00b	! t1_kref+0x1940:   	andcc	%o3, %o3, %o0
	.word	0x85a28d2e	! t1_kref+0x1944:   	fsmuld	%f10, %f14, %f2
	.word	0x95a089c4	! t1_kref+0x1948:   	fdivd	%f2, %f4, %f10
	.word	0xa80a801b	! t1_kref+0x194c:   	and	%o2, %i3, %l4
	.word	0x8143e040	! t1_kref+0x1950:   	membar	0x40
	.word	0xd448a00f	! t1_kref+0x1954:   	ldsb	[%g2 + 0xf], %o2
	.word	0x81a01a4e	! t1_kref+0x1958:   	fdtoi	%f14, %f0
	.word	0xe800a03c	! t1_kref+0x195c:   	ld	[%g2 + 0x3c], %l4
	.word	0xc0280018	! t1_kref+0x1960:   	clrb	[%g0 + %i0]
	.word	0x24800007	! t1_kref+0x1964:   	ble,a	_kref+0x1980
	.word	0xd826601c	! t1_kref+0x1968:   	st	%o4, [%i1 + 0x1c]
	.word	0x8da108cc	! t1_kref+0x196c:   	fsubd	%f4, %f12, %f6
	.word	0xe83e2018	! t1_kref+0x1970:   	std	%l4, [%i0 + 0x18]
	.word	0xaf3a600e	! t1_kref+0x1974:   	sra	%o1, 0xe, %l7
	.word	0xa9b5c057	! t1_kref+0x1978:   	edge8l	%l7, %l7, %l4
	.word	0x35480006	! t1_kref+0x197c:   	fbue,a,pt	%fcc0, _kref+0x1994
	.word	0x98268000	! t1_kref+0x1980:   	sub	%i2, %g0, %o4
	.word	0x36800006	! t1_kref+0x1984:   	bge,a	_kref+0x199c
	.word	0x922ea08c	! t1_kref+0x1988:   	andn	%i2, 0x8c, %o1
	.word	0x31480004	! t1_kref+0x198c:   	fba,a,pt	%fcc0, _kref+0x199c
	.word	0xd248a016	! t1_kref+0x1990:   	ldsb	[%g2 + 0x16], %o1
	.word	0x9fc10000	! t1_kref+0x1994:   	call	%g4
	.word	0x99a01a2c	! t1_kref+0x1998:   	fstoi	%f12, %f12
	.word	0xec063ff0	! t1_kref+0x199c:   	ld	[%i0 - 0x10], %l6
	.word	0x81a01932	! t1_kref+0x19a0:   	fstod	%f18, %f0
	.word	0xa926f439	! t1_kref+0x19a4:   	mulscc	%i3, -0xbc7, %l4
	.word	0x980ee6d6	! t1_kref+0x19a8:   	and	%i3, 0x6d6, %o4
	.word	0x907a216a	! t1_kref+0x19ac:   	sdiv	%o0, 0x16a, %o0
	.word	0xda50a03c	! t1_kref+0x19b0:   	ldsh	[%g2 + 0x3c], %o5
	.word	0xd6280019	! t1_kref+0x19b4:   	stb	%o3, [%g0 + %i1]
	.word	0x2b480008	! t1_kref+0x19b8:   	fbug,a,pt	%fcc0, _kref+0x19d8
	.word	0xe83e7ff8	! t1_kref+0x19bc:   	std	%l4, [%i1 - 8]
	.word	0x3a480007	! t1_kref+0x19c0:   	bcc,a,pt	%icc, _kref+0x19dc
	.word	0xd66e6017	! t1_kref+0x19c4:   	ldstub	[%i1 + 0x17], %o3
	.word	0x29209682	! t1_kref+0x19c8:   	sethi	%hi(0x825a0800), %l4
	.word	0xae06c00d	! t1_kref+0x19cc:   	add	%i3, %o5, %l7
	.word	0xd610a02c	! t1_kref+0x19d0:   	lduh	[%g2 + 0x2c], %o3
	.word	0x91b28a12	! t1_kref+0x19d4:   	fpadd16	%f10, %f18, %f8
	.word	0xc9060000	! t1_kref+0x19d8:   	ld	[%i0], %f4
	.word	0x89b30d40	! t1_kref+0x19dc:   	fnot1	%f12, %f4
	.word	0xa5a0190b	! t1_kref+0x19e0:   	fitod	%f11, %f18
	.word	0x8143c000	! t1_kref+0x19e4:   	stbar
	.word	0x93b34f6a	! t1_kref+0x19e8:   	fornot1s	%f13, %f10, %f9
	sethi	%hi(2f), %o7
	.word	0xe40be22c	! t1_kref+0x19f0:   	ldub	[%o7 + 0x22c], %l2
	.word	0xa41ca00c	! t1_kref+0x19f4:   	xor	%l2, 0xc, %l2
	.word	0xe42be22c	! t1_kref+0x19f8:   	stb	%l2, [%o7 + 0x22c]
	.word	0x81dbe22c	! t1_kref+0x19fc:   	flush	%o7 + 0x22c
	.word	0x81a20d2e	! t1_kref+0x1a00:   	fsmuld	%f8, %f14, %f0
	.word	0x8db18a10	! t1_kref+0x1a04:   	fpadd16	%f6, %f16, %f6
	.word	0xaefdc009	! t1_kref+0x1a08:   	sdivcc	%l7, %o1, %l7
	.word	0x2c800007	! t1_kref+0x1a0c:   	bneg,a	_kref+0x1a28
	.word	0xc118668c	! t1_kref+0x1a10:   	ldd	[%g1 + 0x68c], %f0
	.word	0x28800006	! t1_kref+0x1a14:   	bleu,a	_kref+0x1a2c
	.word	0xa1b00c20	! t1_kref+0x1a18:   	fzeros	%f16
	.word	0xaf1ae9ae	! t1_kref+0x1a1c:   	tsubcctv	%o3, 0x9ae, %l7
	.word	0xd6000018	! t1_kref+0x1a20:   	ld	[%g0 + %i0], %o3
	.word	0x21800002	! t1_kref+0x1a24:   	fbn,a	_kref+0x1a2c
	.word	0x942ee141	! t1_kref+0x1a28:   	andn	%i3, 0x141, %o2
2:	.word	0x93400000	! t1_kref+0x1a2c:   	mov	%y, %o1
	.word	0x99a0012a	! t1_kref+0x1a30:   	fabss	%f10, %f12
	.word	0xac7dc017	! t1_kref+0x1a34:   	sdiv	%l7, %l7, %l6
	.word	0xe848a037	! t1_kref+0x1a38:   	ldsb	[%g2 + 0x37], %l4
	.word	0x9a42400b	! t1_kref+0x1a3c:   	addc	%o1, %o3, %o5
	.word	0xd648a02f	! t1_kref+0x1a40:   	ldsb	[%g2 + 0x2f], %o3
	.word	0xe80e0000	! t1_kref+0x1a44:   	ldub	[%i0], %l4
	.word	0xfbee501c	! t1_kref+0x1a48:   	prefetcha	%i1 + %i4, 29
	.word	0x99a3884c	! t1_kref+0x1a4c:   	faddd	%f14, %f12, %f12
	.word	0xe100a01c	! t1_kref+0x1a50:   	ld	[%g2 + 0x1c], %f16
	call	1f
	.empty
	.word	0xa83b7ffa	! t1_kref+0x1a58:   	xnor	%o5, -0x6, %l4
	.word	0x9ba01a28	! t1_kref+0x1a5c:   	fstoi	%f8, %f13
	.word	0x9bb10500	! t1_kref+0x1a60:   	fcmpgt16	%f4, %f0, %o5
	.word	0xd6063ff8	! t1_kref+0x1a64:   	ld	[%i0 - 8], %o3
	.word	0xab400000	! t1_kref+0x1a68:   	mov	%y, %l5
	.word	0xea680018	! t1_kref+0x1a6c:   	ldstub	[%g0 + %i0], %l5
	.word	0x9b400000	! t1_kref+0x1a70:   	mov	%y, %o5
1:	.word	0xee50a004	! t1_kref+0x1a74:   	ldsh	[%g2 + 4], %l7
	.word	0xd8260000	! t1_kref+0x1a78:   	st	%o4, [%i0]
	.word	0xd628a026	! t1_kref+0x1a7c:   	stb	%o3, [%g2 + 0x26]
	.word	0xaa7ab7ed	! t1_kref+0x1a80:   	sdiv	%o2, -0x813, %l5
	.word	0x9065c00a	! t1_kref+0x1a84:   	subc	%l7, %o2, %o0
	.word	0xec00a034	! t1_kref+0x1a88:   	ld	[%g2 + 0x34], %l6
	.word	0xafb6c32b	! t1_kref+0x1a8c:   	bmask	%i3, %o3, %l7
	.word	0x9605ea62	! t1_kref+0x1a90:   	add	%l7, 0xa62, %o3
	.word	0x972de01b	! t1_kref+0x1a94:   	sll	%l7, 0x1b, %o3
	.word	0x9bb34af1	! t1_kref+0x1a98:   	fpsub32s	%f13, %f17, %f13
	.word	0xc51fbdf8	! t1_kref+0x1a9c:   	ldd	[%fp - 0x208], %f2
	.word	0xa1a01920	! t1_kref+0x1aa0:   	fstod	%f0, %f16
	.word	0xd51f4018	! t1_kref+0x1aa4:   	ldd	[%i5 + %i0], %f10
	.word	0x99b6c04d	! t1_kref+0x1aa8:   	edge8l	%i3, %o5, %o4
	.word	0x94f83265	! t1_kref+0x1aac:   	sdivcc	%g0, -0xd9b, %o2
	.word	0xa3a00132	! t1_kref+0x1ab0:   	fabss	%f18, %f17
	.word	0xabb2c0e9	! t1_kref+0x1ab4:   	edge16ln	%o3, %o1, %l5
	.word	0x9928200b	! t1_kref+0x1ab8:   	sll	%g0, 0xb, %o4
	.word	0x8fb38d20	! t1_kref+0x1abc:   	fandnot1s	%f14, %f0, %f7
	.word	0x97a00131	! t1_kref+0x1ac0:   	fabss	%f17, %f11
	.word	0xa1a1884c	! t1_kref+0x1ac4:   	faddd	%f6, %f12, %f16
	.word	0x20480002	! t1_kref+0x1ac8:   	bn,a,pt	%icc, _kref+0x1ad0
	.word	0xad330008	! t1_kref+0x1acc:   	srl	%o4, %o0, %l6
	.word	0x97202ee3	! t1_kref+0x1ad0:   	mulscc	%g0, 0xee3, %o3
	.word	0xda2e8019	! t1_kref+0x1ad4:   	stb	%o5, [%i2 + %i1]
	.word	0x96f2eccd	! t1_kref+0x1ad8:   	udivcc	%o3, 0xccd, %o3
	.word	0xd00e2017	! t1_kref+0x1adc:   	ldub	[%i0 + 0x17], %o0
	.word	0xda0e001a	! t1_kref+0x1ae0:   	ldub	[%i0 + %i2], %o5
	.word	0x93b3432c	! t1_kref+0x1ae4:   	bmask	%o5, %o4, %o1
	.word	0x99a08944	! t1_kref+0x1ae8:   	fmuld	%f2, %f4, %f12
	.word	0x91b24240	! t1_kref+0x1aec:   	array16	%o1, %g0, %o0
	.word	0xec0e8019	! t1_kref+0x1af0:   	ldub	[%i2 + %i1], %l6
	.word	0xe96e6008	! t1_kref+0x1af4:   	prefetch	%i1 + 8, 20
	.word	0x9fc10000	! t1_kref+0x1af8:   	call	%g4
	.word	0x91a00540	! t1_kref+0x1afc:   	fsqrtd	%f0, %f8
	.word	0xa5b0cd60	! t1_kref+0x1b00:   	fnot1s	%f3, %f18
	.word	0x81a80021	! t1_kref+0x1b04:   	fmovsn	%fcc0, %f1, %f0
	.word	0x81a88a20	! t1_kref+0x1b08:   	fcmps	%fcc0, %f2, %f0
	.word	0x85a30940	! t1_kref+0x1b0c:   	fmuld	%f12, %f0, %f2
	.word	0x96a6ac7c	! t1_kref+0x1b10:   	subcc	%i2, 0xc7c, %o3
	.word	0xe83e2010	! t1_kref+0x1b14:   	std	%l4, [%i0 + 0x10]
	.word	0x8fa01a42	! t1_kref+0x1b18:   	fdtoi	%f2, %f7
	.word	0xa8368000	! t1_kref+0x1b1c:   	orn	%i2, %g0, %l4
	.word	0xd8b01019	! t1_kref+0x1b20:   	stha	%o4, [%g0 + %i1]0x80
	.word	0xe5ee501c	! t1_kref+0x1b24:   	prefetcha	%i1 + %i4, 18
	.word	0xf207bfe0	! t1_kref+0x1b28:   	ld	[%fp - 0x20], %i1
	.word	0x95b3096b	! t1_kref+0x1b2c:   	fpmerge	%f12, %f11, %f10
	.word	0x9dab004c	! t1_kref+0x1b30:   	fmovduge	%fcc0, %f12, %f14
	.word	0xe1bf5a58	! t1_kref+0x1b34:   	stda	%f16, [%i5 + %i0]0xd2
	.word	0x9076ec2f	! t1_kref+0x1b38:   	udiv	%i3, 0xc2f, %o0
	.word	0x8da2c9af	! t1_kref+0x1b3c:   	fdivs	%f11, %f15, %f6
	.word	0x8143c000	! t1_kref+0x1b40:   	stbar
	.word	0xea56401b	! t1_kref+0x1b44:   	ldsh	[%i1 + %i3], %l5
	.word	0x2f480005	! t1_kref+0x1b48:   	fbu,a,pt	%fcc0, _kref+0x1b5c
	.word	0xec3e6010	! t1_kref+0x1b4c:   	std	%l6, [%i1 + 0x10]
	.word	0x33480008	! t1_kref+0x1b50:   	fbe,a,pt	%fcc0, _kref+0x1b70
	.word	0xd6363ff4	! t1_kref+0x1b54:   	sth	%o3, [%i0 - 0xc]
	.word	0xd60e001a	! t1_kref+0x1b58:   	ldub	[%i0 + %i2], %o3
	.word	0x87b24c6f	! t1_kref+0x1b5c:   	fnors	%f9, %f15, %f3
	.word	0x8db00e4c	! t1_kref+0x1b60:   	fxnor	%f0, %f12, %f6
	.word	0xe66e3fea	! t1_kref+0x1b64:   	ldstub	[%i0 - 0x16], %l3
	.word	0xe83f4019	! t1_kref+0x1b68:   	std	%l4, [%i5 + %i1]
	.word	0xac32c008	! t1_kref+0x1b6c:   	orn	%o3, %o0, %l6
	sethi	%hi(2f), %o7
	.word	0xe40be3c0	! t1_kref+0x1b74:   	ldub	[%o7 + 0x3c0], %l2
	.word	0xa41ca00c	! t1_kref+0x1b78:   	xor	%l2, 0xc, %l2
	.word	0xe42be3c0	! t1_kref+0x1b7c:   	stb	%l2, [%o7 + 0x3c0]
	.word	0x81dbe3c0	! t1_kref+0x1b80:   	flush	%o7 + 0x3c0
	.word	0x37480008	! t1_kref+0x1b84:   	fbge,a,pt	%fcc0, _kref+0x1ba4
	.word	0x8ba8c030	! t1_kref+0x1b88:   	fmovsul	%fcc0, %f16, %f5
	.word	0xc02e201b	! t1_kref+0x1b8c:   	clrb	[%i0 + 0x1b]
	.word	0x89a00542	! t1_kref+0x1b90:   	fsqrtd	%f2, %f4
	call	SYM(t1_subr3)
	.word	0x81a00522	! t1_kref+0x1b98:   	fsqrts	%f2, %f0
	.word	0xe1066010	! t1_kref+0x1b9c:   	ld	[%i1 + 0x10], %f16
	.word	0xa80ab8b8	! t1_kref+0x1ba0:   	and	%o2, -0x748, %l4
	.word	0xaa62c008	! t1_kref+0x1ba4:   	subc	%o3, %o0, %l5
	.word	0x97a0012c	! t1_kref+0x1ba8:   	fabss	%f12, %f11
	.word	0xa836800d	! t1_kref+0x1bac:   	orn	%i2, %o5, %l4
	.word	0xea96501b	! t1_kref+0x1bb0:   	lduha	[%i1 + %i3]0x80, %l5
	.word	0xda20a01c	! t1_kref+0x1bb4:   	st	%o5, [%g2 + 0x1c]
	.word	0x933b6005	! t1_kref+0x1bb8:   	sra	%o5, 0x5, %o1
	.word	0xa1b0c966	! t1_kref+0x1bbc:   	fpmerge	%f3, %f6, %f16
2:	.word	0x9643619b	! t1_kref+0x1bc0:   	addc	%o5, 0x19b, %o3
	.word	0xecbf5018	! t1_kref+0x1bc4:   	stda	%l6, [%i5 + %i0]0x80
	.word	0xd9067ffc	! t1_kref+0x1bc8:   	ld	[%i1 - 4], %f12
	.word	0x905ef15d	! t1_kref+0x1bcc:   	smul	%i3, -0xea3, %o0
	.word	0x9a36b80a	! t1_kref+0x1bd0:   	orn	%i2, -0x7f6, %o5
	.word	0xacfa67de	! t1_kref+0x1bd4:   	sdivcc	%o1, 0x7de, %l6
	.word	0xaea2320c	! t1_kref+0x1bd8:   	subcc	%o0, -0xdf4, %l7
	.word	0x81868000	! t1_kref+0x1bdc:   	wr	%i2, %g0, %y
	.word	0xd426201c	! t1_kref+0x1be0:   	st	%o2, [%i0 + 0x1c]
	.word	0xa1b24ea0	! t1_kref+0x1be4:   	fsrc1s	%f9, %f16
	.word	0xee28a00e	! t1_kref+0x1be8:   	stb	%l7, [%g2 + 0xe]
	.word	0x95a34830	! t1_kref+0x1bec:   	fadds	%f13, %f16, %f10
	.word	0x39800007	! t1_kref+0x1bf0:   	fbuge,a	_kref+0x1c0c
	.word	0x9db009b0	! t1_kref+0x1bf4:   	fexpand	%f16, %f14
	.word	0xaa82ba35	! t1_kref+0x1bf8:   	addcc	%o2, -0x5cb, %l5
	.word	0xaf38000d	! t1_kref+0x1bfc:   	sra	%g0, %o5, %l7
	.word	0xea6e601a	! t1_kref+0x1c00:   	ldstub	[%i1 + 0x1a], %l5
	.word	0x9fc00004	! t1_kref+0x1c04:   	call	%g0 + %g4
	.word	0xaabaaea2	! t1_kref+0x1c08:   	xnorcc	%o2, 0xea2, %l5
	.word	0x95a01924	! t1_kref+0x1c0c:   	fstod	%f4, %f10
	.word	0x95b20c86	! t1_kref+0x1c10:   	fandnot2	%f8, %f6, %f10
	.word	0xcd270018	! t1_kref+0x1c14:   	st	%f6, [%i4 + %i0]
	.word	0x94f238f9	! t1_kref+0x1c18:   	udivcc	%o0, -0x707, %o2
	.word	0xc02e7fed	! t1_kref+0x1c1c:   	clrb	[%i1 - 0x13]
	.word	0x2b480007	! t1_kref+0x1c20:   	fbug,a,pt	%fcc0, _kref+0x1c3c
	.word	0xd620a014	! t1_kref+0x1c24:   	st	%o3, [%g2 + 0x14]
	.word	0xea067ff8	! t1_kref+0x1c28:   	ld	[%i1 - 8], %l5
	.word	0xae62800c	! t1_kref+0x1c2c:   	subc	%o2, %o4, %l7
	.word	0x81820000	! t1_kref+0x1c30:   	wr	%o0, %g0, %y
	.word	0x929a801b	! t1_kref+0x1c34:   	xorcc	%o2, %i3, %o1
	.word	0xd628a00d	! t1_kref+0x1c38:   	stb	%o3, [%g2 + 0xd]
	.word	0x27480001	! t1_kref+0x1c3c:   	fbul,a,pt	%fcc0, _kref+0x1c40
	.word	0x97b38d60	! t1_kref+0x1c40:   	fnot1s	%f14, %f11
	.word	0x85a0002a	! t1_kref+0x1c44:   	fmovs	%f10, %f2
	.word	0x21480007	! t1_kref+0x1c48:   	fbn,a,pt	%fcc0, _kref+0x1c64
	.word	0x8da20944	! t1_kref+0x1c4c:   	fmuld	%f8, %f4, %f6
	.word	0x91b38500	! t1_kref+0x1c50:   	fcmpgt16	%f14, %f0, %o0
	.word	0xd2270018	! t1_kref+0x1c54:   	st	%o1, [%i4 + %i0]
	.word	0x81defe54	! t1_kref+0x1c58:   	flush	%i3 - 0x1ac
	.word	0xad3e801b	! t1_kref+0x1c5c:   	sra	%i2, %i3, %l6
	.word	0x923dc01b	! t1_kref+0x1c60:   	xnor	%l7, %i3, %o1
	.word	0x32480003	! t1_kref+0x1c64:   	bne,a,pt	%icc, _kref+0x1c70
	.word	0x90aab2df	! t1_kref+0x1c68:   	andncc	%o2, -0xd21, %o0
	.word	0x93a0c929	! t1_kref+0x1c6c:   	fmuls	%f3, %f9, %f9
	.word	0x36480003	! t1_kref+0x1c70:   	bge,a,pt	%icc, _kref+0x1c7c
	.word	0x85a0190b	! t1_kref+0x1c74:   	fitod	%f11, %f2
	.word	0x949220f3	! t1_kref+0x1c78:   	orcc	%o0, 0xf3, %o2
	.word	0xab3a2001	! t1_kref+0x1c7c:   	sra	%o0, 0x1, %l5
	.word	0xee200019	! t1_kref+0x1c80:   	st	%l7, [%g0 + %i1]
	.word	0xd8062000	! t1_kref+0x1c84:   	ld	[%i0], %o4
	.word	0x963ac01b	! t1_kref+0x1c88:   	xnor	%o3, %i3, %o3
	.word	0xc0200019	! t1_kref+0x1c8c:   	clr	[%g0 + %i1]
	.word	0x95b306e0	! t1_kref+0x1c90:   	fmul8ulx16	%f12, %f0, %f10
	.word	0xec0e0000	! t1_kref+0x1c94:   	ldub	[%i0], %l6
	.word	0xaf2032b1	! t1_kref+0x1c98:   	mulscc	%g0, -0xd4f, %l7
	.word	0x89b486c8	! t1_kref+0x1c9c:   	fmul8sux16	%f18, %f8, %f4
	.word	0x91a00548	! t1_kref+0x1ca0:   	fsqrtd	%f8, %f8
	.word	0x987b652f	! t1_kref+0x1ca4:   	sdiv	%o5, 0x52f, %o4
	.word	0xd4470019	! t1_kref+0x1ca8:   	ldsw	[%i4 + %i1], %o2
	.word	0x8143c000	! t1_kref+0x1cac:   	stbar
	.word	0xcd396f78	! t1_kref+0x1cb0:   	std	%f6, [%g5 + 0xf78]
	.word	0xac05c017	! t1_kref+0x1cb4:   	add	%l7, %l7, %l6
	.word	0xd8562004	! t1_kref+0x1cb8:   	ldsh	[%i0 + 4], %o4
	.word	0x81a00940	! t1_kref+0x1cbc:   	fmuld	%f0, %f0, %f0
	.word	0x9040001a	! t1_kref+0x1cc0:   	addc	%g0, %i2, %o0
	.word	0xda28a02f	! t1_kref+0x1cc4:   	stb	%o5, [%g2 + 0x2f]
	.word	0xd050a03e	! t1_kref+0x1cc8:   	ldsh	[%g2 + 0x3e], %o0
	.word	0x85a01931	! t1_kref+0x1ccc:   	fstod	%f17, %f2
	.word	0x9bb6c337	! t1_kref+0x1cd0:   	bmask	%i3, %l7, %o5
	.word	0x95b24f6f	! t1_kref+0x1cd4:   	fornot1s	%f9, %f15, %f10
	.word	0x9a0a348a	! t1_kref+0x1cd8:   	and	%o0, -0xb76, %o5
	.word	0x943a2118	! t1_kref+0x1cdc:   	xnor	%o0, 0x118, %o2
	.word	0x940b61c7	! t1_kref+0x1ce0:   	and	%o5, 0x1c7, %o2
	sethi	%hi(2f), %o7
	.word	0xe40be118	! t1_kref+0x1ce8:   	ldub	[%o7 + 0x118], %l2
	.word	0xa41ca00c	! t1_kref+0x1cec:   	xor	%l2, 0xc, %l2
	.word	0xe42be118	! t1_kref+0x1cf0:   	stb	%l2, [%o7 + 0x118]
	.word	0x81dbe118	! t1_kref+0x1cf4:   	flush	%o7 + 0x118
	.word	0xd450a036	! t1_kref+0x1cf8:   	ldsh	[%g2 + 0x36], %o2
	.word	0xd220a034	! t1_kref+0x1cfc:   	st	%o1, [%g2 + 0x34]
	.word	0xa1a01028	! t1_kref+0x1d00:   	fstox	%f8, %f16
	.word	0x90f2ebcb	! t1_kref+0x1d04:   	udivcc	%o3, 0xbcb, %o0
	.word	0x920e800c	! t1_kref+0x1d08:   	and	%i2, %o4, %o1
	.word	0x9b26c01b	! t1_kref+0x1d0c:   	mulscc	%i3, %i3, %o5
	.word	0xe96e001b	! t1_kref+0x1d10:   	prefetch	%i0 + %i3, 20
	.word	0xee28a005	! t1_kref+0x1d14:   	stb	%l7, [%g2 + 5]
2:	.word	0xe0f01018	! t1_kref+0x1d18:   	stxa	%l0, [%g0 + %i0]0x80
	.word	0xda264000	! t1_kref+0x1d1c:   	st	%o5, [%i1]
	.word	0xf6762000	! t1_kref+0x1d20:   	stx	%i3, [%i0]
	.word	0x91b2c06a	! t1_kref+0x1d24:   	edge8ln	%o3, %o2, %o0
	.word	0x97a1082d	! t1_kref+0x1d28:   	fadds	%f4, %f13, %f11
	.word	0xee470019	! t1_kref+0x1d2c:   	ldsw	[%i4 + %i1], %l7
	.word	0xab400000	! t1_kref+0x1d30:   	mov	%y, %l5
	.word	0xd8263fec	! t1_kref+0x1d34:   	st	%o4, [%i0 - 0x14]
	.word	0x9da40d26	! t1_kref+0x1d38:   	fsmuld	%f16, %f6, %f14
	.word	0x25480005	! t1_kref+0x1d3c:   	fblg,a,pt	%fcc0, _kref+0x1d50
	.word	0xae228009	! t1_kref+0x1d40:   	sub	%o2, %o1, %l7
	.word	0xe84e0000	! t1_kref+0x1d44:   	ldsb	[%i0], %l4
	.word	0x96be801a	! t1_kref+0x1d48:   	xnorcc	%i2, %i2, %o3
	.word	0x965ec009	! t1_kref+0x1d4c:   	smul	%i3, %o1, %o3
	.word	0x9075c00b	! t1_kref+0x1d50:   	udiv	%l7, %o3, %o0
	.word	0x89a34d20	! t1_kref+0x1d54:   	fsmuld	%f13, %f0, %f4
	.word	0x81b01027	! t1_kref+0x1d58:   	siam	0x7
	.word	0xe1be5000	! t1_kref+0x1d5c:   	stda	%f16, [%i1]0x80
	.word	0x95b30a67	! t1_kref+0x1d60:   	fpadd32s	%f12, %f7, %f10
	.word	0x85b38a4c	! t1_kref+0x1d64:   	fpadd32	%f14, %f12, %f2
	.word	0x8ba0108a	! t1_kref+0x1d68:   	fxtos	%f10, %f5
	.word	0xd836600e	! t1_kref+0x1d6c:   	sth	%o4, [%i1 + 0xe]
	.word	0xc5be501d	! t1_kref+0x1d70:   	stda	%f2, [%i1 + %i5]0x80
	.word	0xea480018	! t1_kref+0x1d74:   	ldsb	[%g0 + %i0], %l5
	.word	0x81da639d	! t1_kref+0x1d78:   	flush	%o1 + 0x39d
	.word	0x9bb68000	! t1_kref+0x1d7c:   	edge8	%i2, %g0, %o5
	.word	0x94bef4e7	! t1_kref+0x1d80:   	xnorcc	%i3, -0xb19, %o2
	.word	0x86102001	! t1_kref+0x1d84:   	mov	0x1, %g3
	.word	0x32800000	! t1_kref+0x1d88:   	bne,a	_kref+0x1d88
	.word	0x86a0e001	! t1_kref+0x1d8c:   	subcc	%g3, 1, %g3
	.word	0x8143e040	! t1_kref+0x1d90:   	membar	0x40
	.word	0xda2e201b	! t1_kref+0x1d94:   	stb	%o5, [%i0 + 0x1b]
	.word	0xd11e7fe0	! t1_kref+0x1d98:   	ldd	[%i1 - 0x20], %f8
	.word	0x9ba01a4a	! t1_kref+0x1d9c:   	fdtoi	%f10, %f13
	.word	0xda6e001a	! t1_kref+0x1da0:   	ldstub	[%i0 + %i2], %o5
	call	SYM(t1_subr1)
	.word	0x907b7d00	! t1_kref+0x1da8:   	sdiv	%o5, -0x300, %o0
	.word	0x91400000	! t1_kref+0x1dac:   	mov	%y, %o0
	.word	0xe80e8019	! t1_kref+0x1db0:   	ldub	[%i2 + %i1], %l4
	.word	0xa1a3084e	! t1_kref+0x1db4:   	faddd	%f12, %f14, %f16
	.word	0x9a3e800a	! t1_kref+0x1db8:   	xnor	%i2, %o2, %o5
	.word	0xc12e6014	! t1_kref+0x1dbc:   	st	%fsr, [%i1 + 0x14]
	.word	0xe100a004	! t1_kref+0x1dc0:   	ld	[%g2 + 4], %f16
	.word	0x92124017	! t1_kref+0x1dc4:   	or	%o1, %l7, %o1
	.word	0x9344c000	! t1_kref+0x1dc8:   	mov	%gsr, %o1
	.word	0xa1a209c0	! t1_kref+0x1dcc:   	fdivd	%f8, %f0, %f16
	.word	0x99b30e46	! t1_kref+0x1dd0:   	fxnor	%f12, %f6, %f12
	.word	0xc7066014	! t1_kref+0x1dd4:   	ld	[%i1 + 0x14], %f3
	.word	0x95b1098c	! t1_kref+0x1dd8:   	bshuffle	%f4, %f12, %f10
	.word	0xa9128008	! t1_kref+0x1ddc:   	taddcctv	%o2, %o0, %l4
	.word	0x9733201a	! t1_kref+0x1de0:   	srl	%o4, 0x1a, %o3
	.word	0xea4e2005	! t1_kref+0x1de4:   	ldsb	[%i0 + 5], %l5
	.word	0x988ec00d	! t1_kref+0x1de8:   	andcc	%i3, %o5, %o4
	.word	0x92a83574	! t1_kref+0x1dec:   	andncc	%g0, -0xa8c, %o1
	.word	0x2e480008	! t1_kref+0x1df0:   	bvs,a,pt	%icc, _kref+0x1e10
	.word	0xe43f4018	! t1_kref+0x1df4:   	std	%l2, [%i5 + %i0]
	.word	0x9da2492d	! t1_kref+0x1df8:   	fmuls	%f9, %f13, %f14
	.word	0xa9400000	! t1_kref+0x1dfc:   	mov	%y, %l4
	.word	0xaf2a6010	! t1_kref+0x1e00:   	sll	%o1, 0x10, %l7
	.word	0xadb2c009	! t1_kref+0x1e04:   	edge8	%o3, %o1, %l6
	.word	0x9b3dc000	! t1_kref+0x1e08:   	sra	%l7, %g0, %o5
	.word	0xaa0ac017	! t1_kref+0x1e0c:   	and	%o3, %l7, %l5
	.word	0x8bb14aa6	! t1_kref+0x1e10:   	fpsub16s	%f5, %f6, %f5
	.word	0xdd260000	! t1_kref+0x1e14:   	st	%f14, [%i0]
	.word	0xaa82f869	! t1_kref+0x1e18:   	addcc	%o3, -0x797, %l5
	.word	0x9fc10000	! t1_kref+0x1e1c:   	call	%g4
	.word	0x8da01a22	! t1_kref+0x1e20:   	fstoi	%f2, %f6
	.word	0xf007bfe0	! t1_kref+0x1e24:   	ld	[%fp - 0x20], %i0
	.word	0xa8322bf1	! t1_kref+0x1e28:   	orn	%o0, 0xbf1, %l4
	.word	0xa5a01a48	! t1_kref+0x1e2c:   	fdtoi	%f8, %f18
	.word	0xd6567ffa	! t1_kref+0x1e30:   	ldsh	[%i1 - 6], %o3
	.word	0xac327925	! t1_kref+0x1e34:   	orn	%o1, -0x6db, %l6
	.word	0x81a000ce	! t1_kref+0x1e38:   	fnegd	%f14, %f0
	.word	0xcf063fe4	! t1_kref+0x1e3c:   	ld	[%i0 - 0x1c], %f7
	.word	0xe80e8019	! t1_kref+0x1e40:   	ldub	[%i2 + %i1], %l4
	.word	0x9744c000	! t1_kref+0x1e44:   	mov	%gsr, %o3
	.word	0x927ab2dd	! t1_kref+0x1e48:   	sdiv	%o2, -0xd23, %o1
	.word	0x2e480008	! t1_kref+0x1e4c:   	bvs,a,pt	%icc, _kref+0x1e6c
	.word	0x99a488ce	! t1_kref+0x1e50:   	fsubd	%f18, %f14, %f12
	.word	0xaafec01a	! t1_kref+0x1e54:   	sdivcc	%i3, %i2, %l5
	.word	0xc320a014	! t1_kref+0x1e58:   	st	%f1, [%g2 + 0x14]
	.word	0x9fb007ac	! t1_kref+0x1e5c:   	fpackfix	%f12, %f15
	.word	0x2e480007	! t1_kref+0x1e60:   	bvs,a,pt	%icc, _kref+0x1e7c
	.word	0x98fab578	! t1_kref+0x1e64:   	sdivcc	%o2, -0xa88, %o4
	.word	0x36480005	! t1_kref+0x1e68:   	bge,a,pt	%icc, _kref+0x1e7c
	.word	0xf626401c	! t1_kref+0x1e6c:   	st	%i3, [%i1 + %i4]
	.word	0xf76e001b	! t1_kref+0x1e70:   	prefetch	%i0 + %i3, 27
	.word	0x94a8273d	! t1_kref+0x1e74:   	andncc	%g0, 0x73d, %o2
	.word	0x94a6f8dc	! t1_kref+0x1e78:   	subcc	%i3, -0x724, %o2
	.word	0xe66e8019	! t1_kref+0x1e7c:   	ldstub	[%i2 + %i1], %l3
	.word	0x91a14d23	! t1_kref+0x1e80:   	fsmuld	%f5, %f3, %f8
	.word	0xa3a349ac	! t1_kref+0x1e84:   	fdivs	%f13, %f12, %f17
	.word	0x9da00540	! t1_kref+0x1e88:   	fsqrtd	%f0, %f14
	.word	0x9120001b	! t1_kref+0x1e8c:   	mulscc	%g0, %i3, %o0
	.word	0x93268008	! t1_kref+0x1e90:   	mulscc	%i2, %o0, %o1
	.word	0x95b0034c	! t1_kref+0x1e94:   	alignaddrl	%g0, %o4, %o2
	.word	0xae3ebbc6	! t1_kref+0x1e98:   	xnor	%i2, -0x43a, %l7
	.word	0x38480002	! t1_kref+0x1e9c:   	bgu,a,pt	%icc, _kref+0x1ea4
	.word	0xe8063ff8	! t1_kref+0x1ea0:   	ld	[%i0 - 8], %l4
	.word	0xabb200e9	! t1_kref+0x1ea4:   	edge16ln	%o0, %o1, %l5
	.word	0xc1ee5000	! t1_kref+0x1ea8:   	prefetcha	%i1, 0
	.word	0x9fb04d60	! t1_kref+0x1eac:   	fnot1s	%f1, %f15
	.word	0xa782b501	! t1_kref+0x1eb0:   	wr	%o2, 0xfffff501, %gsr
	.word	0xae5ea97a	! t1_kref+0x1eb4:   	smul	%i2, 0x97a, %l7
	.word	0xd68e9019	! t1_kref+0x1eb8:   	lduba	[%i2 + %i1]0x80, %o3
	.word	0x85b00cc2	! t1_kref+0x1ebc:   	fnot2	%f2, %f2
	.word	0xc7865000	! t1_kref+0x1ec0:   	lda	[%i1]0x80, %f3
	.word	0x81a00031	! t1_kref+0x1ec4:   	fmovs	%f17, %f0
	.word	0x96a5c01b	! t1_kref+0x1ec8:   	subcc	%l7, %i3, %o3
	.word	0x94f6a7d4	! t1_kref+0x1ecc:   	udivcc	%i2, 0x7d4, %o2
	.word	0x95a10d30	! t1_kref+0x1ed0:   	fsmuld	%f4, %f16, %f10
	.word	0x99b24de0	! t1_kref+0x1ed4:   	fnands	%f9, %f0, %f12
	.word	0xdae81019	! t1_kref+0x1ed8:   	ldstuba	[%g0 + %i1]0x80, %o5
	.word	0xa782a869	! t1_kref+0x1edc:   	wr	%o2, 0x869, %gsr
	.word	0xe4380019	! t1_kref+0x1ee0:   	std	%l2, [%g0 + %i1]
	.word	0xc59f5019	! t1_kref+0x1ee4:   	ldda	[%i5 + %i1]0x80, %f2
	.word	0xd048a014	! t1_kref+0x1ee8:   	ldsb	[%g2 + 0x14], %o0
	.word	0x9da049ab	! t1_kref+0x1eec:   	fdivs	%f1, %f11, %f14
	.word	0x2d480004	! t1_kref+0x1ef0:   	fbg,a,pt	%fcc0, _kref+0x1f00
	.word	0xc920a014	! t1_kref+0x1ef4:   	st	%f4, [%g2 + 0x14]
	.word	0x30480003	! t1_kref+0x1ef8:   	ba,a,pt	%icc, _kref+0x1f04
	.word	0x9db04630	! t1_kref+0x1efc:   	fmul8x16	%f1, %f16, %f14
	.word	0xafb300ab	! t1_kref+0x1f00:   	edge16n	%o4, %o3, %l7
	.word	0xe86e4000	! t1_kref+0x1f04:   	ldstub	[%i1], %l4
	.word	0x35480006	! t1_kref+0x1f08:   	fbue,a,pt	%fcc0, _kref+0x1f20
	.word	0x8db48c80	! t1_kref+0x1f0c:   	fandnot2	%f18, %f0, %f6
	.word	0xd2961000	! t1_kref+0x1f10:   	lduha	[%i0]0x80, %o1
	.word	0xa92ee006	! t1_kref+0x1f14:   	sll	%i3, 0x6, %l4
	.word	0x8bb04a6f	! t1_kref+0x1f18:   	fpadd32s	%f1, %f15, %f5
	.word	0x92133934	! t1_kref+0x1f1c:   	or	%o4, -0x6cc, %o1
	.word	0xd028a00d	! t1_kref+0x1f20:   	stb	%o0, [%g2 + 0xd]
	.word	0x91b0012a	! t1_kref+0x1f24:   	edge32n	%g0, %o2, %o0
	.word	0xd430a02c	! t1_kref+0x1f28:   	sth	%o2, [%g2 + 0x2c]
	.word	0x9fc00004	! t1_kref+0x1f2c:   	call	%g0 + %g4
	.word	0x85a018ca	! t1_kref+0x1f30:   	fdtos	%f10, %f2
	.word	0x25480004	! t1_kref+0x1f34:   	fblg,a,pt	%fcc0, _kref+0x1f44
	.word	0xee50a02e	! t1_kref+0x1f38:   	ldsh	[%g2 + 0x2e], %l7
	.word	0xd8067ff0	! t1_kref+0x1f3c:   	ld	[%i1 - 0x10], %o4
	.word	0x8db00cd0	! t1_kref+0x1f40:   	fnot2	%f16, %f6
	.word	0x95a089a9	! t1_kref+0x1f44:   	fdivs	%f2, %f9, %f10
	.word	0xd0b6101b	! t1_kref+0x1f48:   	stha	%o0, [%i0 + %i3]0x80
	.word	0x8da408d0	! t1_kref+0x1f4c:   	fsubd	%f16, %f16, %f6
	.word	0x948b400d	! t1_kref+0x1f50:   	andcc	%o5, %o5, %o2
	.word	0xc02e4000	! t1_kref+0x1f54:   	clrb	[%i1]
	.word	0x9fa4892a	! t1_kref+0x1f58:   	fmuls	%f18, %f10, %f15
	.word	0x95b10db2	! t1_kref+0x1f5c:   	fxors	%f4, %f18, %f10
	.word	0x85a208c8	! t1_kref+0x1f60:   	fsubd	%f8, %f8, %f2
	.word	0xf007bfe0	! t1_kref+0x1f64:   	ld	[%fp - 0x20], %i0
	.word	0x95b40502	! t1_kref+0x1f68:   	fcmpgt16	%f16, %f2, %o2
	.word	0x83a00026	! t1_kref+0x1f6c:   	fmovs	%f6, %f1
	.word	0x81ab0ab1	! t1_kref+0x1f70:   	fcmpes	%fcc0, %f12, %f17
	.word	0xaf418000	! t1_kref+0x1f74:   	mov	%fprs, %l7
	.word	0x9623001b	! t1_kref+0x1f78:   	sub	%o4, %i3, %o3
	.word	0x22480003	! t1_kref+0x1f7c:   	be,a,pt	%icc, _kref+0x1f88
	.word	0xacfa685d	! t1_kref+0x1f80:   	sdivcc	%o1, 0x85d, %l6
	.word	0x9da01920	! t1_kref+0x1f84:   	fstod	%f0, %f14
	.word	0x9082001a	! t1_kref+0x1f88:   	addcc	%o0, %i2, %o0
	.word	0x99a24926	! t1_kref+0x1f8c:   	fmuls	%f9, %f6, %f12
	.word	0x9fc10000	! t1_kref+0x1f90:   	call	%g4
	.word	0xcb00a03c	! t1_kref+0x1f94:   	ld	[%g2 + 0x3c], %f5
	.word	0x81b1c703	! t1_kref+0x1f98:   	fmuld8sux16	%f7, %f3, %f0
	.word	0x9690001a	! t1_kref+0x1f9c:   	orcc	%g0, %i2, %o3
	.word	0x99a0cd27	! t1_kref+0x1fa0:   	fsmuld	%f3, %f7, %f12
	.word	0x95a24932	! t1_kref+0x1fa4:   	fmuls	%f9, %f18, %f10
	.word	0xd19e1a5d	! t1_kref+0x1fa8:   	ldda	[%i0 + %i5]0xd2, %f8
	.word	0xa8bb2756	! t1_kref+0x1fac:   	xnorcc	%o4, 0x756, %l4
	.word	0xee30a00e	! t1_kref+0x1fb0:   	sth	%l7, [%g2 + 0xe]
	.word	0x26480004	! t1_kref+0x1fb4:   	bl,a,pt	%icc, _kref+0x1fc4
	.word	0x968a6071	! t1_kref+0x1fb8:   	andcc	%o1, 0x71, %o3
	.word	0x99b6c200	! t1_kref+0x1fbc:   	array8	%i3, %g0, %o4
	.word	0x8fa3482e	! t1_kref+0x1fc0:   	fadds	%f13, %f14, %f7
	.word	0x8fa01a2d	! t1_kref+0x1fc4:   	fstoi	%f13, %f7
	.word	0x9122400a	! t1_kref+0x1fc8:   	mulscc	%o1, %o2, %o0
	.word	0x9736c00d	! t1_kref+0x1fcc:   	srl	%i3, %o5, %o3
	.word	0xe66e001a	! t1_kref+0x1fd0:   	ldstub	[%i0 + %i2], %l3
	.word	0xe5200019	! t1_kref+0x1fd4:   	st	%f18, [%g0 + %i1]
	.word	0x9de3bfa0	! t1_kref+0x1fd8:   	save	%sp, -0x60, %sp
	.word	0xade8001c	! t1_kref+0x1fdc:   	restore	%g0, %i4, %l6
	.word	0x2e480007	! t1_kref+0x1fe0:   	bvs,a,pt	%icc, _kref+0x1ffc
	.word	0x94f2acb0	! t1_kref+0x1fe4:   	udivcc	%o2, 0xcb0, %o2
	.word	0x960ae25b	! t1_kref+0x1fe8:   	and	%o3, 0x25b, %o3
	.word	0x99a0190c	! t1_kref+0x1fec:   	fitod	%f12, %f12
	.word	0x93a01a23	! t1_kref+0x1ff0:   	fstoi	%f3, %f9
	.word	0x32480001	! t1_kref+0x1ff4:   	bne,a,pt	%icc, _kref+0x1ff8
	.word	0xd468a01e	! t1_kref+0x1ff8:   	ldstub	[%g2 + 0x1e], %o2
	.word	0xa5a01a32	! t1_kref+0x1ffc:   	fstoi	%f18, %f18
	.word	0x92602723	! t1_kref+0x2000:   	subc	%g0, 0x723, %o1
	.word	0x81800000	! t1_kref+0x2004:   	mov	%g0, %y
	.word	0x83414000	! t1_kref+0x2008:   	mov	%pc, %g1
	.word	0xd82e8018	! t1_kref+0x200c:   	stb	%o4, [%i2 + %i0]
	.word	0x8d82ed8f	! t1_kref+0x2010:   	wr	%o3, 0xd8f, %fprs
	.word	0x83a00125	! t1_kref+0x2014:   	fabss	%f5, %f1
	.word	0xc0364000	! t1_kref+0x2018:   	clrh	[%i1]
	.word	0xe500001c	! t1_kref+0x201c:   	ld	[%g0 + %i4], %f18
	.word	0x33480005	! t1_kref+0x2020:   	fbe,a,pt	%fcc0, _kref+0x2034
	.word	0xd2070018	! t1_kref+0x2024:   	ld	[%i4 + %i0], %o1
	.word	0x9fc00004	! t1_kref+0x2028:   	call	%g0 + %g4
	.word	0xd80e6016	! t1_kref+0x202c:   	ldub	[%i1 + 0x16], %o4
	.word	0xa5a01a2d	! t1_kref+0x2030:   	fstoi	%f13, %f18
	.word	0x9638000b	! t1_kref+0x2034:   	xnor	%g0, %o3, %o3
	.word	0x8db20deb	! t1_kref+0x2038:   	fnands	%f8, %f11, %f6
	.word	0x9632c00b	! t1_kref+0x203c:   	orn	%o3, %o3, %o3
	.word	0x91a00952	! t1_kref+0x2040:   	fmuld	%f0, %f18, %f8
	.word	0x3a480005	! t1_kref+0x2044:   	bcc,a,pt	%icc, _kref+0x2058
	.word	0x89a208d2	! t1_kref+0x2048:   	fsubd	%f8, %f18, %f4
	.word	0x21800002	! t1_kref+0x204c:   	fbn,a	_kref+0x2054
	.word	0x81ddc013	! t1_kref+0x2050:   	flush	%l7 + %l3
	.word	0xec000019	! t1_kref+0x2054:   	ld	[%g0 + %i1], %l6
	.word	0xabb38442	! t1_kref+0x2058:   	fcmpne16	%f14, %f2, %l5
	.word	0xaf25c00c	! t1_kref+0x205c:   	mulscc	%l7, %o4, %l7
	.word	0xadb30240	! t1_kref+0x2060:   	array16	%o4, %g0, %l6
	.word	0xad226449	! t1_kref+0x2064:   	mulscc	%o1, 0x449, %l6
	.word	0x20480004	! t1_kref+0x2068:   	bn,a,pt	%icc, _kref+0x2078
	.word	0x8fa0012c	! t1_kref+0x206c:   	fabss	%f12, %f7
	.word	0xa8f6a330	! t1_kref+0x2070:   	udivcc	%i2, 0x330, %l4
	.word	0xaef8000a	! t1_kref+0x2074:   	sdivcc	%g0, %o2, %l7
	.word	0xac46c01b	! t1_kref+0x2078:   	addc	%i3, %i3, %l6
	.word	0xd45e3fe0	! t1_kref+0x207c:   	ldx	[%i0 - 0x20], %o2
	.word	0x21480006	! t1_kref+0x2080:   	fbn,a,pt	%fcc0, _kref+0x2098
	.word	0xd51fbd48	! t1_kref+0x2084:   	ldd	[%fp - 0x2b8], %f10
	.word	0x9493638c	! t1_kref+0x2088:   	orcc	%o5, 0x38c, %o2
	.word	0xd99e5a5b	! t1_kref+0x208c:   	ldda	[%i1 + %i3]0xd2, %f12
	.word	0xd66e7fec	! t1_kref+0x2090:   	ldstub	[%i1 - 0x14], %o3
	.word	0x89a0884a	! t1_kref+0x2094:   	faddd	%f2, %f10, %f4
	.word	0x92d3400b	! t1_kref+0x2098:   	umulcc	%o5, %o3, %o1
	.word	0xa1a01a2a	! t1_kref+0x209c:   	fstoi	%f10, %f16
	.word	0xaf408000	! t1_kref+0x20a0:   	mov	%ccr, %l7
	.word	0x92ba800a	! t1_kref+0x20a4:   	xnorcc	%o2, %o2, %o1
	.word	0xaaaa0008	! t1_kref+0x20a8:   	andncc	%o0, %o0, %l5
	.word	0x99b20970	! t1_kref+0x20ac:   	fpmerge	%f8, %f16, %f12
	.word	0x34800005	! t1_kref+0x20b0:   	bg,a	_kref+0x20c4
	.word	0xc11e6010	! t1_kref+0x20b4:   	ldd	[%i1 + 0x10], %f0
	.word	0xd920a01c	! t1_kref+0x20b8:   	st	%f12, [%g2 + 0x1c]
	.word	0xe100a00c	! t1_kref+0x20bc:   	ld	[%g2 + 0xc], %f16
	.word	0x9446800c	! t1_kref+0x20c0:   	addc	%i2, %o4, %o2
	.word	0x97400000	! t1_kref+0x20c4:   	mov	%y, %o3
	.word	0x32480008	! t1_kref+0x20c8:   	bne,a,pt	%icc, _kref+0x20e8
	.word	0xa5a00129	! t1_kref+0x20cc:   	fabss	%f9, %f18
	.word	0xcf263ff0	! t1_kref+0x20d0:   	st	%f7, [%i0 - 0x10]
	.word	0x31480007	! t1_kref+0x20d4:   	fba,a,pt	%fcc0, _kref+0x20f0
	.word	0xd0d6101b	! t1_kref+0x20d8:   	ldsha	[%i0 + %i3]0x80, %o0
	.word	0xa88dfb05	! t1_kref+0x20dc:   	andcc	%l7, -0x4fb, %l4
	.word	0x89a209c0	! t1_kref+0x20e0:   	fdivd	%f8, %f0, %f4
	.word	0x96d3286d	! t1_kref+0x20e4:   	umulcc	%o4, 0x86d, %o3
	.word	0x8da01928	! t1_kref+0x20e8:   	fstod	%f8, %f6
	.word	0x83a00120	! t1_kref+0x20ec:   	fabss	%f0, %f1
	.word	0xa785c008	! t1_kref+0x20f0:   	wr	%l7, %o0, %gsr
	.word	0xe83e401d	! t1_kref+0x20f4:   	std	%l4, [%i1 + %i5]
	.word	0xd7262010	! t1_kref+0x20f8:   	st	%f11, [%i0 + 0x10]
	.word	0xd306001c	! t1_kref+0x20fc:   	ld	[%i0 + %i4], %f9
	.word	0xede61017	! t1_kref+0x2100:   	casa	[%i0]0x80, %l7, %l6
	.word	0x9865e993	! t1_kref+0x2104:   	subc	%l7, 0x993, %o4
	.word	0xd648a03f	! t1_kref+0x2108:   	ldsb	[%g2 + 0x3f], %o3
	.word	0x8ba00131	! t1_kref+0x210c:   	fabss	%f17, %f5
	.word	0x93b3004a	! t1_kref+0x2110:   	edge8l	%o4, %o2, %o1
	.word	0x9076800c	! t1_kref+0x2114:   	udiv	%i2, %o4, %o0
	.word	0x9803689c	! t1_kref+0x2118:   	add	%o5, 0x89c, %o4
	.word	0xee267fec	! t1_kref+0x211c:   	st	%l7, [%i1 - 0x14]
	.word	0x93400000	! t1_kref+0x2120:   	mov	%y, %o1
	.word	0x99a3cd27	! t1_kref+0x2124:   	fsmuld	%f15, %f7, %f12
	.word	0x968de1e6	! t1_kref+0x2128:   	andcc	%l7, 0x1e6, %o3
	.word	0xd0de5000	! t1_kref+0x212c:   	ldxa	[%i1]0x80, %o0
	.word	0x25800005	! t1_kref+0x2130:   	fblg,a	_kref+0x2144
	.word	0xd250a006	! t1_kref+0x2134:   	ldsh	[%g2 + 6], %o1
	.word	0x95a01024	! t1_kref+0x2138:   	fstox	%f4, %f10
	.word	0x9416800b	! t1_kref+0x213c:   	or	%i2, %o3, %o2
	.word	0x905a28e7	! t1_kref+0x2140:   	smul	%o0, 0x8e7, %o0
	.word	0xaa3a0008	! t1_kref+0x2144:   	xnor	%o0, %o0, %l5
	.word	0xe868a00c	! t1_kref+0x2148:   	ldstub	[%g2 + 0xc], %l4
	.word	0x9686eb89	! t1_kref+0x214c:   	addcc	%i3, 0xb89, %o3
	.word	0xd048a007	! t1_kref+0x2150:   	ldsb	[%g2 + 7], %o0
	.word	0x9282ed02	! t1_kref+0x2154:   	addcc	%o3, 0xd02, %o1
	.word	0xf420a01c	! t1_kref+0x2158:   	st	%i2, [%g2 + 0x1c]
	.word	0x21480006	! t1_kref+0x215c:   	fbn,a,pt	%fcc0, _kref+0x2174
	.word	0xcb20a034	! t1_kref+0x2160:   	st	%f5, [%g2 + 0x34]
	.word	0x89b18968	! t1_kref+0x2164:   	fpmerge	%f6, %f8, %f4
	.word	0xecee101a	! t1_kref+0x2168:   	ldstuba	[%i0 + %i2]0x80, %l6
	.word	0xec48a03c	! t1_kref+0x216c:   	ldsb	[%g2 + 0x3c], %l6
	.word	0x29480007	! t1_kref+0x2170:   	fbl,a,pt	%fcc0, _kref+0x218c
	.word	0x9aaa800c	! t1_kref+0x2174:   	andncc	%o2, %o4, %o5
	.word	0xaec5c009	! t1_kref+0x2178:   	addccc	%l7, %o1, %l7
	.word	0xd650a02c	! t1_kref+0x217c:   	ldsh	[%g2 + 0x2c], %o3
	.word	0x34800008	! t1_kref+0x2180:   	bg,a	_kref+0x21a0
	.word	0xc320a03c	! t1_kref+0x2184:   	st	%f1, [%g2 + 0x3c]
	.word	0xd440a01c	! t1_kref+0x2188:   	ldsw	[%g2 + 0x1c], %o2
	.word	0xd84e001a	! t1_kref+0x218c:   	ldsb	[%i0 + %i2], %o4
	.word	0xa8a6f8bb	! t1_kref+0x2190:   	subcc	%i3, -0x745, %l4
	.word	0xd920a00c	! t1_kref+0x2194:   	st	%f12, [%g2 + 0xc]
	.word	0xe848a00d	! t1_kref+0x2198:   	ldsb	[%g2 + 0xd], %l4
	.word	0x91a00552	! t1_kref+0x219c:   	fsqrtd	%f18, %f8
	.word	0x948b63cf	! t1_kref+0x21a0:   	andcc	%o5, 0x3cf, %o2
	.word	0x86102003	! t1_kref+0x21a4:   	mov	0x3, %g3
	.word	0x32800000	! t1_kref+0x21a8:   	bne,a	_kref+0x21a8
	.word	0x86a0e001	! t1_kref+0x21ac:   	subcc	%g3, 1, %g3
	.word	0x26480006	! t1_kref+0x21b0:   	bl,a,pt	%icc, _kref+0x21c8
	.word	0xc520a004	! t1_kref+0x21b4:   	st	%f2, [%g2 + 4]
	.word	0x81dfbc0a	! t1_kref+0x21b8:   	flush	%fp - 0x3f6
	.word	0xe86e4000	! t1_kref+0x21bc:   	ldstub	[%i1], %l4
	.word	0xab2a4000	! t1_kref+0x21c0:   	sll	%o1, %g0, %l5
	.word	0xee2e001a	! t1_kref+0x21c4:   	stb	%l7, [%i0 + %i2]
	.word	0xaafdc00d	! t1_kref+0x21c8:   	sdivcc	%l7, %o5, %l5
	.word	0xaf400000	! t1_kref+0x21cc:   	mov	%y, %l7
	.word	0x9da008c2	! t1_kref+0x21d0:   	fsubd	%f0, %f2, %f14
	.word	0xe43e4000	! t1_kref+0x21d4:   	std	%l2, [%i1]
	.word	0xd51fbdb8	! t1_kref+0x21d8:   	ldd	[%fp - 0x248], %f10
	.word	0x9a7de171	! t1_kref+0x21dc:   	sdiv	%l7, 0x171, %o5
	.word	0xa944c000	! t1_kref+0x21e0:   	mov	%gsr, %l4
	.word	0xa5a409c2	! t1_kref+0x21e4:   	fdivd	%f16, %f2, %f18
	.word	0x8143c000	! t1_kref+0x21e8:   	stbar
	call	SYM(t1_subr1)
	.word	0x9ba249a6	! t1_kref+0x21f0:   	fdivs	%f9, %f6, %f13
	.word	0x85a94046	! t1_kref+0x21f4:   	fmovdug	%fcc0, %f6, %f2
	.word	0xac380008	! t1_kref+0x21f8:   	xnor	%g0, %o0, %l6
	.word	0xe856600e	! t1_kref+0x21fc:   	ldsh	[%i1 + 0xe], %l4
	.word	0x9fc10000	! t1_kref+0x2200:   	call	%g4
	.word	0xaf22c01b	! t1_kref+0x2204:   	mulscc	%o3, %i3, %l7
	.word	0x91b405ca	! t1_kref+0x2208:   	fcmpeq32	%f16, %f10, %o0
	.word	0xd41e401d	! t1_kref+0x220c:   	ldd	[%i1 + %i5], %o2
	.word	0xba103fe8	! t1_kref+0x2210:   	mov	0xffffffe8, %i5
	.word	0x3f480007	! t1_kref+0x2214:   	fbo,a,pt	%fcc0, _kref+0x2230
	.word	0x81def137	! t1_kref+0x2218:   	flush	%i3 - 0xec9
	.word	0x8ba3092f	! t1_kref+0x221c:   	fmuls	%f12, %f15, %f5
	.word	0x95a0192b	! t1_kref+0x2220:   	fstod	%f11, %f10
	.word	0x8db30e42	! t1_kref+0x2224:   	fxnor	%f12, %f2, %f6
	.word	0x8da01907	! t1_kref+0x2228:   	fitod	%f7, %f6
	.word	0x99b38a40	! t1_kref+0x222c:   	fpadd32	%f14, %f0, %f12
	.word	0x38480008	! t1_kref+0x2230:   	bgu,a,pt	%icc, _kref+0x2250
	.word	0x85a2cd28	! t1_kref+0x2234:   	fsmuld	%f11, %f8, %f2
	.word	0x9fc10000	! t1_kref+0x2238:   	call	%g4
	.word	0x92133356	! t1_kref+0x223c:   	or	%o4, -0xcaa, %o1
	.word	0x81a00040	! t1_kref+0x2240:   	fmovd	%f0, %f0
	.word	0x91b1c964	! t1_kref+0x2244:   	fpmerge	%f7, %f4, %f8
	.word	0xd410a004	! t1_kref+0x2248:   	lduh	[%g2 + 4], %o2
	.word	0x2b3a5588	! t1_kref+0x224c:   	sethi	%hi(0xe9562000), %l5
	.word	0x89a00540	! t1_kref+0x2250:   	fsqrtd	%f0, %f4
	.word	0x928a73ef	! t1_kref+0x2254:   	andcc	%o1, -0xc11, %o1
	.word	0x85a01911	! t1_kref+0x2258:   	fitod	%f17, %f2
	.word	0x8db18ad2	! t1_kref+0x225c:   	fpsub32	%f6, %f18, %f6
	.word	0x2f480003	! t1_kref+0x2260:   	fbu,a,pt	%fcc0, _kref+0x226c
	.word	0xf007bfe0	! t1_kref+0x2264:   	ld	[%fp - 0x20], %i0
	.word	0x81b00906	! t1_kref+0x2268:   	faligndata	%f0, %f6, %f0
	.word	0xf4362002	! t1_kref+0x226c:   	sth	%i2, [%i0 + 2]
	.word	0x28800006	! t1_kref+0x2270:   	bleu,a	_kref+0x2288
	.word	0xd456001b	! t1_kref+0x2274:   	ldsh	[%i0 + %i3], %o2
	.word	0xe11fbfb0	! t1_kref+0x2278:   	ldd	[%fp - 0x50], %f16
	.word	0x99b00c70	! t1_kref+0x227c:   	fnors	%f0, %f16, %f12
	.word	0x9213001a	! t1_kref+0x2280:   	or	%o4, %i2, %o1
	.word	0xacbb000d	! t1_kref+0x2284:   	xnorcc	%o4, %o5, %l6
	.word	0x98f02646	! t1_kref+0x2288:   	udivcc	%g0, 0x646, %o4
	.word	0xe84e7fe6	! t1_kref+0x228c:   	ldsb	[%i1 - 0x1a], %l4
	.word	0x8d86800a	! t1_kref+0x2290:   	wr	%i2, %o2, %fprs
	.word	0x95280009	! t1_kref+0x2294:   	sll	%g0, %o1, %o2
	.word	0xe86e401a	! t1_kref+0x2298:   	ldstub	[%i1 + %i2], %l4
	.word	0xa8ab6663	! t1_kref+0x229c:   	andncc	%o5, 0x663, %l4
	.word	0x23480002	! t1_kref+0x22a0:   	fbne,a,pt	%fcc0, _kref+0x22a8
	.word	0xd8a81019	! t1_kref+0x22a4:   	stba	%o4, [%g0 + %i1]0x80
	.word	0x81a0192a	! t1_kref+0x22a8:   	fstod	%f10, %f0
	.word	0xd24e7ff5	! t1_kref+0x22ac:   	ldsb	[%i1 - 0xb], %o1
	.word	0x97400000	! t1_kref+0x22b0:   	mov	%y, %o3
	.word	0xa1a1884a	! t1_kref+0x22b4:   	faddd	%f6, %f10, %f16
	.word	0x952ec009	! t1_kref+0x22b8:   	sll	%i3, %o1, %o2
	.word	0x95a30844	! t1_kref+0x22bc:   	faddd	%f12, %f4, %f10
	.word	0x31480003	! t1_kref+0x22c0:   	fba,a,pt	%fcc0, _kref+0x22cc
	.word	0x83a00021	! t1_kref+0x22c4:   	fmovs	%f1, %f1
	.word	0x9da10942	! t1_kref+0x22c8:   	fmuld	%f4, %f2, %f14
	.word	0x921a800c	! t1_kref+0x22cc:   	xor	%o2, %o4, %o1
	.word	0x9bb000e0	! t1_kref+0x22d0:   	edge16ln	%g0, %g0, %o5
	.word	0x99b3010b	! t1_kref+0x22d4:   	edge32	%o4, %o3, %o4
	.word	0xd840a004	! t1_kref+0x22d8:   	ldsw	[%g2 + 4], %o4
	.word	0xa9b5c328	! t1_kref+0x22dc:   	bmask	%l7, %o0, %l4
	.word	0x8da14d31	! t1_kref+0x22e0:   	fsmuld	%f5, %f17, %f6
	.word	0x969a800a	! t1_kref+0x22e4:   	xorcc	%o2, %o2, %o3
	.word	0xe500a024	! t1_kref+0x22e8:   	ld	[%g2 + 0x24], %f18
	.word	0xd120a00c	! t1_kref+0x22ec:   	st	%f8, [%g2 + 0xc]
	.word	0x9b18000d	! t1_kref+0x22f0:   	tsubcctv	%g0, %o5, %o5
	.word	0x91b40ac2	! t1_kref+0x22f4:   	fpsub32	%f16, %f2, %f8
	.word	0x8da00046	! t1_kref+0x22f8:   	fmovd	%f6, %f6
	.word	0x949ea3a9	! t1_kref+0x22fc:   	xorcc	%i2, 0x3a9, %o2
	.word	0x912ea011	! t1_kref+0x2300:   	sll	%i2, 0x11, %o0
	.word	0x2b480002	! t1_kref+0x2304:   	fbug,a,pt	%fcc0, _kref+0x230c
	.word	0xad400000	! t1_kref+0x2308:   	mov	%y, %l6
	.word	0x97b2433a	! t1_kref+0x230c:   	bmask	%o1, %i2, %o3
	.word	0x9de3bfa0	! t1_kref+0x2310:   	save	%sp, -0x60, %sp
	.word	0x99e80019	! t1_kref+0x2314:   	restore	%g0, %i1, %o4
	.word	0x99a01032	! t1_kref+0x2318:   	fstox	%f18, %f12
	.word	0xaf35e001	! t1_kref+0x231c:   	srl	%l7, 0x1, %l7
	.word	0x943aa648	! t1_kref+0x2320:   	xnor	%o2, 0x648, %o2
	.word	0xc028a035	! t1_kref+0x2324:   	clrb	[%g2 + 0x35]
	.word	0x8143c000	! t1_kref+0x2328:   	stbar
	sethi	%hi(2f), %o7
	.word	0xe40be354	! t1_kref+0x2330:   	ldub	[%o7 + 0x354], %l2
	.word	0xa41ca00c	! t1_kref+0x2334:   	xor	%l2, 0xc, %l2
	.word	0xe42be354	! t1_kref+0x2338:   	stb	%l2, [%o7 + 0x354]
	.word	0x81dbe354	! t1_kref+0x233c:   	flush	%o7 + 0x354
	.word	0xd026401c	! t1_kref+0x2340:   	st	%o0, [%i1 + %i4]
	.word	0xd608a006	! t1_kref+0x2344:   	ldub	[%g2 + 6], %o3
	.word	0x99b34280	! t1_kref+0x2348:   	array32	%o5, %g0, %o4
	.word	0xa5b00c20	! t1_kref+0x234c:   	fzeros	%f18
	.word	0x93b34200	! t1_kref+0x2350:   	array8	%o5, %g0, %o1
2:	.word	0xd808a00d	! t1_kref+0x2354:   	ldub	[%g2 + 0xd], %o4
	.word	0x98bb2281	! t1_kref+0x2358:   	xnorcc	%o4, 0x281, %o4
	.word	0x81820000	! t1_kref+0x235c:   	wr	%o0, %g0, %y
	.word	0x98e5e155	! t1_kref+0x2360:   	subccc	%l7, 0x155, %o4
	.word	0x81ab0a21	! t1_kref+0x2364:   	fcmps	%fcc0, %f12, %f1
	.word	0x9273000b	! t1_kref+0x2368:   	udiv	%o4, %o3, %o1
	.word	0x8610200f	! t1_kref+0x236c:   	mov	0xf, %g3
	.word	0x86a0e001	! t1_kref+0x2370:   	subcc	%g3, 1, %g3
	.word	0x22800011	! t1_kref+0x2374:   	be,a	_kref+0x23b8
	.word	0x99a40826	! t1_kref+0x2378:   	fadds	%f16, %f6, %f12
	.word	0xd84e2013	! t1_kref+0x237c:   	ldsb	[%i0 + 0x13], %o4
	.word	0xec50a034	! t1_kref+0x2380:   	ldsh	[%g2 + 0x34], %l6
	.word	0x9fc00004	! t1_kref+0x2384:   	call	%g0 + %g4
	.word	0x81a40950	! t1_kref+0x2388:   	fmuld	%f16, %f16, %f0
	.word	0x85a0190c	! t1_kref+0x238c:   	fitod	%f12, %f2
	.word	0xe320a004	! t1_kref+0x2390:   	st	%f17, [%g2 + 4]
	.word	0x92668000	! t1_kref+0x2394:   	subc	%i2, %g0, %o1
	.word	0x9322f646	! t1_kref+0x2398:   	mulscc	%o3, -0x9ba, %o1
	.word	0x95a24d31	! t1_kref+0x239c:   	fsmuld	%f9, %f17, %f10
	.word	0x91a30846	! t1_kref+0x23a0:   	faddd	%f12, %f6, %f8
	.word	0x967b2e05	! t1_kref+0x23a4:   	sdiv	%o4, 0xe05, %o3
	.word	0xa5a01a40	! t1_kref+0x23a8:   	fdtoi	%f0, %f18
	.word	0xe80e8019	! t1_kref+0x23ac:   	ldub	[%i2 + %i1], %l4
	.word	0xc03f4000	! t1_kref+0x23b0:   	std	%g0, [%i5]
	.word	0x9fc10000	! t1_kref+0x23b4:   	call	%g4
	.word	0xee20a01c	! t1_kref+0x23b8:   	st	%l7, [%g2 + 0x1c]
	.word	0x9da0190c	! t1_kref+0x23bc:   	fitod	%f12, %f14
	.word	0x97400000	! t1_kref+0x23c0:   	mov	%y, %o3
	.word	0xea40a01c	! t1_kref+0x23c4:   	ldsw	[%g2 + 0x1c], %l5
	.word	0xaa5eb44c	! t1_kref+0x23c8:   	smul	%i2, -0xbb4, %l5
	.word	0x97a00130	! t1_kref+0x23cc:   	fabss	%f16, %f11
	.word	0x20480001	! t1_kref+0x23d0:   	bn,a,pt	%icc, _kref+0x23d4
	.word	0xe8464000	! t1_kref+0x23d4:   	ldsw	[%i1], %l4
	.word	0xaf400000	! t1_kref+0x23d8:   	mov	%y, %l7
	.word	0x9af5eb75	! t1_kref+0x23dc:   	udivcc	%l7, 0xb75, %o5
	.word	0x9a76a625	! t1_kref+0x23e0:   	udiv	%i2, 0x625, %o5
	.word	0x9da00950	! t1_kref+0x23e4:   	fmuld	%f0, %f16, %f14
	.word	0xea00a014	! t1_kref+0x23e8:   	ld	[%g2 + 0x14], %l5
	.word	0xaaa80009	! t1_kref+0x23ec:   	andncc	%g0, %o1, %l5
	.word	0x95400000	! t1_kref+0x23f0:   	mov	%y, %o2
	.word	0xacfae2de	! t1_kref+0x23f4:   	sdivcc	%o3, 0x2de, %l6
	.word	0xd850a006	! t1_kref+0x23f8:   	ldsh	[%g2 + 6], %o4
	.word	0x95a08d31	! t1_kref+0x23fc:   	fsmuld	%f2, %f17, %f10
	.word	0xd8063ff0	! t1_kref+0x2400:   	ld	[%i0 - 0x10], %o4
	.word	0xd26e4000	! t1_kref+0x2404:   	ldstub	[%i1], %o1
	.word	0x969ec01b	! t1_kref+0x2408:   	xorcc	%i3, %i3, %o3
	.word	0xe840a024	! t1_kref+0x240c:   	ldsw	[%g2 + 0x24], %l4
	.word	0x89b48a48	! t1_kref+0x2410:   	fpadd32	%f18, %f8, %f4
	.word	0xaa0a001a	! t1_kref+0x2414:   	and	%o0, %i2, %l5
	.word	0x99a000c8	! t1_kref+0x2418:   	fnegd	%f8, %f12
	.word	0xb8102000	! t1_kref+0x241c:   	mov	0x0, %i4
	.word	0x9a9af0af	! t1_kref+0x2420:   	xorcc	%o3, -0xf51, %o5
	.word	0x83b1cf6a	! t1_kref+0x2424:   	fornot1s	%f7, %f10, %f1
	.word	0xab408000	! t1_kref+0x2428:   	mov	%ccr, %l5
	.word	0x9140c000	! t1_kref+0x242c:   	mov	%asi, %o0
	.word	0x9da000aa	! t1_kref+0x2430:   	fnegs	%f10, %f14
	.word	0x85a0190e	! t1_kref+0x2434:   	fitod	%f14, %f2
	.word	0xa5b44628	! t1_kref+0x2438:   	fmul8x16	%f17, %f8, %f18
	.word	0x22800003	! t1_kref+0x243c:   	be,a	_kref+0x2448
	.word	0xd228a005	! t1_kref+0x2440:   	stb	%o1, [%g2 + 5]
	.word	0x95220017	! t1_kref+0x2444:   	mulscc	%o0, %l7, %o2
	.word	0x987ec00c	! t1_kref+0x2448:   	sdiv	%i3, %o4, %o4
	.word	0x97b48d32	! t1_kref+0x244c:   	fandnot1s	%f18, %f18, %f11
	.word	0x93b5c200	! t1_kref+0x2450:   	array8	%l7, %g0, %o1
	.word	0xac7b000b	! t1_kref+0x2454:   	sdiv	%o4, %o3, %l6
	.word	0x95b38a40	! t1_kref+0x2458:   	fpadd32	%f14, %f0, %f10
	.word	0x920ae707	! t1_kref+0x245c:   	and	%o3, 0x707, %o1
	.word	0x96aaebd2	! t1_kref+0x2460:   	andncc	%o3, 0xbd2, %o3
	.word	0x99b20492	! t1_kref+0x2464:   	fcmple32	%f8, %f18, %o4
	.word	0x99b04966	! t1_kref+0x2468:   	fpmerge	%f1, %f6, %f12
	.word	0xd22e7fe1	! t1_kref+0x246c:   	stb	%o1, [%i1 - 0x1f]
	sethi	%hi(2f), %o7
	.word	0xe40be098	! t1_kref+0x2474:   	ldub	[%o7 + 0x98], %l2
	.word	0xa41ca00c	! t1_kref+0x2478:   	xor	%l2, 0xc, %l2
	.word	0xe42be098	! t1_kref+0x247c:   	stb	%l2, [%o7 + 0x98]
	.word	0x81dbe098	! t1_kref+0x2480:   	flush	%o7 + 0x98
	.word	0xa93ac01b	! t1_kref+0x2484:   	sra	%o3, %i3, %l4
	.word	0x91a0190b	! t1_kref+0x2488:   	fitod	%f11, %f8
	.word	0x3f480008	! t1_kref+0x248c:   	fbo,a,pt	%fcc0, _kref+0x24ac
	.word	0x94d3336d	! t1_kref+0x2490:   	umulcc	%o4, -0xc93, %o2
	.word	0x39480005	! t1_kref+0x2494:   	fbuge,a,pt	%fcc0, _kref+0x24a8
2:	.word	0x9a9b4017	! t1_kref+0x2498:   	xorcc	%o5, %l7, %o5
	.word	0xec981019	! t1_kref+0x249c:   	ldda	[%g0 + %i1]0x80, %l6
	.word	0x26480001	! t1_kref+0x24a0:   	bl,a,pt	%icc, _kref+0x24a4
	.word	0xa81e800c	! t1_kref+0x24a4:   	xor	%i2, %o4, %l4
	.word	0xd428a027	! t1_kref+0x24a8:   	stb	%o2, [%g2 + 0x27]
	.word	0xe43e3fe8	! t1_kref+0x24ac:   	std	%l2, [%i0 - 0x18]
	.word	0x87b0cea0	! t1_kref+0x24b0:   	fsrc1s	%f3, %f3
	.word	0xac7b2fc9	! t1_kref+0x24b4:   	sdiv	%o4, 0xfc9, %l6
	.word	0xd09f5018	! t1_kref+0x24b8:   	ldda	[%i5 + %i0]0x80, %o0
	.word	0x8ba00026	! t1_kref+0x24bc:   	fmovs	%f6, %f5
	.word	0x2f480006	! t1_kref+0x24c0:   	fbu,a,pt	%fcc0, _kref+0x24d8
	.word	0x97b00772	! t1_kref+0x24c4:   	fpack16	%f18, %f11
	.word	0xace2401a	! t1_kref+0x24c8:   	subccc	%o1, %i2, %l6
	.word	0xdaf75018	! t1_kref+0x24cc:   	stxa	%o5, [%i5 + %i0]0x80
	.word	0x25480004	! t1_kref+0x24d0:   	fblg,a,pt	%fcc0, _kref+0x24e0
	.word	0xea40a03c	! t1_kref+0x24d4:   	ldsw	[%g2 + 0x3c], %l5
	.word	0xee30a00e	! t1_kref+0x24d8:   	sth	%l7, [%g2 + 0xe]
	.word	0xc11fbf88	! t1_kref+0x24dc:   	ldd	[%fp - 0x78], %f0
	.word	0xd9bf1a58	! t1_kref+0x24e0:   	stda	%f12, [%i4 + %i0]0xd2
	.word	0xf4ae501a	! t1_kref+0x24e4:   	stba	%i2, [%i1 + %i2]0x80
	.word	0x97b007a2	! t1_kref+0x24e8:   	fpackfix	%f2, %f11
	.word	0x81a84a2f	! t1_kref+0x24ec:   	fcmps	%fcc0, %f1, %f15
	.word	0x36480007	! t1_kref+0x24f0:   	bge,a,pt	%icc, _kref+0x250c
	.word	0xd3e6501b	! t1_kref+0x24f4:   	casa	[%i1]0x80, %i3, %o1
	.word	0x89a00d28	! t1_kref+0x24f8:   	fsmuld	%f0, %f8, %f4
	.word	0x87b2caa1	! t1_kref+0x24fc:   	fpsub16s	%f11, %f1, %f3
	.word	0x31480007	! t1_kref+0x2500:   	fba,a,pt	%fcc0, _kref+0x251c
	.word	0xc028a03f	! t1_kref+0x2504:   	clrb	[%g2 + 0x3f]
	.word	0xda36001b	! t1_kref+0x2508:   	sth	%o5, [%i0 + %i3]
	.word	0xcf000019	! t1_kref+0x250c:   	ld	[%g0 + %i1], %f7
	.word	0xd250a03c	! t1_kref+0x2510:   	ldsh	[%g2 + 0x3c], %o1
	.word	0xd650a01e	! t1_kref+0x2514:   	ldsh	[%g2 + 0x1e], %o3
	.word	0x97a01a2e	! t1_kref+0x2518:   	fstoi	%f14, %f11
	.word	0xf6362016	! t1_kref+0x251c:   	sth	%i3, [%i0 + 0x16]
	.word	0xacbdc01a	! t1_kref+0x2520:   	xnorcc	%l7, %i2, %l6
	.word	0xd100a004	! t1_kref+0x2524:   	ld	[%g2 + 4], %f8
	.word	0xd920a03c	! t1_kref+0x2528:   	st	%f12, [%g2 + 0x3c]
	.word	0x89b30aa7	! t1_kref+0x252c:   	fpsub16s	%f12, %f7, %f4
	.word	0xcf063fe0	! t1_kref+0x2530:   	ld	[%i0 - 0x20], %f7
	.word	0xa5a000cc	! t1_kref+0x2534:   	fnegd	%f12, %f18
	.word	0xa9b3432c	! t1_kref+0x2538:   	bmask	%o5, %o4, %l4
	.word	0xaef5c01a	! t1_kref+0x253c:   	udivcc	%l7, %i2, %l7
	.word	0xd24e600f	! t1_kref+0x2540:   	ldsb	[%i1 + 0xf], %o1
	.word	0xefe65017	! t1_kref+0x2544:   	casa	[%i1]0x80, %l7, %l7
	.word	0x95a000ad	! t1_kref+0x2548:   	fnegs	%f13, %f10
	.word	0xae632322	! t1_kref+0x254c:   	subc	%o4, 0x322, %l7
	.word	0x9236b3d9	! t1_kref+0x2550:   	orn	%i2, -0xc27, %o1
	.word	0xae1afcfe	! t1_kref+0x2554:   	xor	%o3, -0x302, %l7
	.word	0x8db3c700	! t1_kref+0x2558:   	fmuld8sux16	%f15, %f0, %f6
	.word	0xe840a01c	! t1_kref+0x255c:   	ldsw	[%g2 + 0x1c], %l4
	.word	0x81a8ca2f	! t1_kref+0x2560:   	fcmps	%fcc0, %f3, %f15
	.word	0xd668001a	! t1_kref+0x2564:   	ldstub	[%g0 + %i2], %o3
	.word	0xe1263fe4	! t1_kref+0x2568:   	st	%f16, [%i0 - 0x1c]
	.word	0xe13e7ff8	! t1_kref+0x256c:   	std	%f16, [%i1 - 8]
	.word	0xa9400000	! t1_kref+0x2570:   	mov	%y, %l4
	.word	0xd6367fe6	! t1_kref+0x2574:   	sth	%o3, [%i1 - 0x1a]
	.word	0xe5270018	! t1_kref+0x2578:   	st	%f18, [%i4 + %i0]
	.word	0xde68001a	! t1_kref+0x257c:   	ldstub	[%g0 + %i2], %o7
	.word	0x39480004	! t1_kref+0x2580:   	fbuge,a,pt	%fcc0, _kref+0x2590
	.word	0x8da0190b	! t1_kref+0x2584:   	fitod	%f11, %f6
	.word	0xd628a03f	! t1_kref+0x2588:   	stb	%o3, [%g2 + 0x3f]
	.word	0x81a018c2	! t1_kref+0x258c:   	fdtos	%f2, %f0
	.word	0x8143c000	! t1_kref+0x2590:   	stbar
	.word	0x81db2213	! t1_kref+0x2594:   	flush	%o4 + 0x213
	.word	0xd0f81018	! t1_kref+0x2598:   	swapa	[%g0 + %i0]0x80, %o0
	.word	0x93418000	! t1_kref+0x259c:   	mov	%fprs, %o1
	.word	0x91a48d24	! t1_kref+0x25a0:   	fsmuld	%f18, %f4, %f8
	.word	0xa5a2482f	! t1_kref+0x25a4:   	fadds	%f9, %f15, %f18
	.word	0xe40865cc	! t1_kref+0x25a8:   	ldub	[%g1 + 0x5cc], %l2
	.word	0xa41ca00c	! t1_kref+0x25ac:   	xor	%l2, 0xc, %l2
	.word	0xe42865cc	! t1_kref+0x25b0:   	stb	%l2, [%g1 + 0x5cc]
	.word	0x81d865cc	! t1_kref+0x25b4:   	flush	%g1 + 0x5cc
	.word	0xaf2ae013	! t1_kref+0x25b8:   	sll	%o3, 0x13, %l7
	.word	0xd648a03d	! t1_kref+0x25bc:   	ldsb	[%g2 + 0x3d], %o3
	.word	0x940ef8f0	! t1_kref+0x25c0:   	and	%i3, -0x710, %o2
	.word	0xa1a90040	! t1_kref+0x25c4:   	fmovdl	%fcc0, %f0, %f16
	.word	0xaf38200b	! t1_kref+0x25c8:   	sra	%g0, 0xb, %l7
	.word	0x92f2ef06	! t1_kref+0x25cc:   	udivcc	%o3, 0xf06, %o1
	.word	0xdb26401c	! t1_kref+0x25d0:   	st	%f13, [%i1 + %i4]
2:	.word	0xd6562006	! t1_kref+0x25d4:   	ldsh	[%i0 + 6], %o3
	.word	0x9fc10000	! t1_kref+0x25d8:   	call	%g4
	.word	0x9bb00c20	! t1_kref+0x25dc:   	fzeros	%f13
	.word	0xab2a801b	! t1_kref+0x25e0:   	sll	%o2, %i3, %l5
	.word	0xaa73400d	! t1_kref+0x25e4:   	udiv	%o5, %o5, %l5
	.word	0xa92aa000	! t1_kref+0x25e8:   	sll	%o2, 0x0, %l4
	.word	0x89a00130	! t1_kref+0x25ec:   	fabss	%f16, %f4
	.word	0xd6466008	! t1_kref+0x25f0:   	ldsw	[%i1 + 8], %o3
	.word	0x91b00c20	! t1_kref+0x25f4:   	fzeros	%f8
	.word	0x95a0192d	! t1_kref+0x25f8:   	fstod	%f13, %f10
	.word	0xadb24009	! t1_kref+0x25fc:   	edge8	%o1, %o1, %l6
	.word	0x3a480007	! t1_kref+0x2600:   	bcc,a,pt	%icc, _kref+0x261c
	.word	0xee5e2000	! t1_kref+0x2604:   	ldx	[%i0], %l7
	.word	0x9215fa2b	! t1_kref+0x2608:   	or	%l7, -0x5d5, %o1
	.word	0xa5b3896a	! t1_kref+0x260c:   	fpmerge	%f14, %f10, %f18
	.word	0x9a5dc00c	! t1_kref+0x2610:   	smul	%l7, %o4, %o5
	.word	0x96330008	! t1_kref+0x2614:   	orn	%o4, %o0, %o3
	.word	0xd4067ff8	! t1_kref+0x2618:   	ld	[%i1 - 8], %o2
	.word	0xdf871018	! t1_kref+0x261c:   	lda	[%i4 + %i0]0x80, %f15
	.word	0x95a00526	! t1_kref+0x2620:   	fsqrts	%f6, %f10
	.word	0xafb6c35a	! t1_kref+0x2624:   	alignaddrl	%i3, %i2, %l7
	.word	0x97b6c30a	! t1_kref+0x2628:   	alignaddr	%i3, %o2, %o3
	.word	0xa9b00480	! t1_kref+0x262c:   	fcmple32	%f0, %f0, %l4
	.word	0xaa836f53	! t1_kref+0x2630:   	addcc	%o5, 0xf53, %l5
	.word	0x2a480006	! t1_kref+0x2634:   	bcs,a,pt	%icc, _kref+0x264c
	.word	0xa8e0204f	! t1_kref+0x2638:   	subccc	%g0, 0x4f, %l4
	.word	0x8da01926	! t1_kref+0x263c:   	fstod	%f6, %f6
	.word	0xcd1e7ff8	! t1_kref+0x2640:   	ldd	[%i1 - 8], %f6
	.word	0xd60e8018	! t1_kref+0x2644:   	ldub	[%i2 + %i0], %o3
	.word	0xda4e3fe4	! t1_kref+0x2648:   	ldsb	[%i0 - 0x1c], %o5
	.word	0x29480003	! t1_kref+0x264c:   	fbl,a,pt	%fcc0, _kref+0x2658
	.word	0xaa5ebf80	! t1_kref+0x2650:   	smul	%i2, -0x80, %l5
	.word	0x85a00540	! t1_kref+0x2654:   	fsqrtd	%f0, %f2
	.word	0x87b00e6f	! t1_kref+0x2658:   	fxnors	%f0, %f15, %f3
	.word	0xd6264000	! t1_kref+0x265c:   	st	%o3, [%i1]
	.word	0x9a624009	! t1_kref+0x2660:   	subc	%o1, %o1, %o5
	.word	0x33480001	! t1_kref+0x2664:   	fbe,a,pt	%fcc0, _kref+0x2668
	.word	0x91b00a10	! t1_kref+0x2668:   	fpadd16	%f0, %f16, %f8
	.word	0x9402c000	! t1_kref+0x266c:   	add	%o3, %g0, %o2
	.word	0x91a088c4	! t1_kref+0x2670:   	fsubd	%f2, %f4, %f8
	.word	0xda28a024	! t1_kref+0x2674:   	stb	%o5, [%g2 + 0x24]
	.word	0x9ba01a2e	! t1_kref+0x2678:   	fstoi	%f14, %f13
	.word	0x81800000	! t1_kref+0x267c:   	mov	%g0, %y
	.word	0x13345731	! t1_kref+0x2680:   	sethi	%hi(0xd15cc400), %o1
	.word	0x85b14da1	! t1_kref+0x2684:   	fxors	%f5, %f1, %f2
	.word	0x92aa3c8b	! t1_kref+0x2688:   	andncc	%o0, -0x375, %o1
	.word	0xec4e8018	! t1_kref+0x268c:   	ldsb	[%i2 + %i0], %l6
	.word	0x9a33400a	! t1_kref+0x2690:   	orn	%o5, %o2, %o5
	.word	0x9daa802c	! t1_kref+0x2694:   	fmovsue	%fcc0, %f12, %f14
	.word	0x9892bac0	! t1_kref+0x2698:   	orcc	%o2, -0x540, %o4
	.word	0xd41e401d	! t1_kref+0x269c:   	ldd	[%i1 + %i5], %o2
	.word	0x9006c00b	! t1_kref+0x26a0:   	add	%i3, %o3, %o0
	.word	0xcd067fe0	! t1_kref+0x26a4:   	ld	[%i1 - 0x20], %f6
	.word	0xf630a016	! t1_kref+0x26a8:   	sth	%i3, [%g2 + 0x16]
	.word	0x91b40552	! t1_kref+0x26ac:   	fcmpeq16	%f16, %f18, %o0
	.word	0xea400018	! t1_kref+0x26b0:   	ldsw	[%g0 + %i0], %l5
	.word	0xaf400000	! t1_kref+0x26b4:   	mov	%y, %l7
	.word	0xcd06001c	! t1_kref+0x26b8:   	ld	[%i0 + %i4], %f6
	.word	0xec0e0000	! t1_kref+0x26bc:   	ldub	[%i0], %l6
	.word	0x99a0190d	! t1_kref+0x26c0:   	fitod	%f13, %f12
	.word	0xa785e881	! t1_kref+0x26c4:   	wr	%l7, 0x881, %gsr
	.word	0x9fa01a28	! t1_kref+0x26c8:   	fstoi	%f8, %f15
	.word	0xab408000	! t1_kref+0x26cc:   	mov	%ccr, %l5
	.word	0x32480006	! t1_kref+0x26d0:   	bne,a,pt	%icc, _kref+0x26e8
	.word	0x8bb24e6a	! t1_kref+0x26d4:   	fxnors	%f9, %f10, %f5
	.word	0xd80e401a	! t1_kref+0x26d8:   	ldub	[%i1 + %i2], %o4
	.word	0x8da20844	! t1_kref+0x26dc:   	faddd	%f8, %f4, %f6
	.word	0x8da0054a	! t1_kref+0x26e0:   	fsqrtd	%f10, %f6
	.word	0xc76e2000	! t1_kref+0x26e4:   	prefetch	%i0, 3
	.word	0x972a8008	! t1_kref+0x26e8:   	sll	%o2, %o0, %o3
	.word	0x32480007	! t1_kref+0x26ec:   	bne,a,pt	%icc, _kref+0x2708
	.word	0xe538001d	! t1_kref+0x26f0:   	std	%f18, [%g0 + %i5]
	.word	0xd22e4000	! t1_kref+0x26f4:   	stb	%o1, [%i1]
	.word	0xacfe800b	! t1_kref+0x26f8:   	sdivcc	%i2, %o3, %l6
	.word	0xea562016	! t1_kref+0x26fc:   	ldsh	[%i0 + 0x16], %l5
	.word	0x95a01a20	! t1_kref+0x2700:   	fstoi	%f0, %f10
	.word	0x3c480004	! t1_kref+0x2704:   	bpos,a,pt	%icc, _kref+0x2714
	.word	0xa8868008	! t1_kref+0x2708:   	addcc	%i2, %o0, %l4
	.word	0xc99e1a5c	! t1_kref+0x270c:   	ldda	[%i0 + %i4]0xd2, %f4
	.word	0x92feb646	! t1_kref+0x2710:   	sdivcc	%i2, -0x9ba, %o1
	.word	0xafb2c06c	! t1_kref+0x2714:   	edge8ln	%o3, %o4, %l7
	.word	0x30480005	! t1_kref+0x2718:   	ba,a,pt	%icc, _kref+0x272c
	.word	0x8ba00525	! t1_kref+0x271c:   	fsqrts	%f5, %f5
	.word	0x973b001b	! t1_kref+0x2720:   	sra	%o4, %i3, %o3
	.word	0x96fb4009	! t1_kref+0x2724:   	sdivcc	%o5, %o1, %o3
	.word	0xe43e6010	! t1_kref+0x2728:   	std	%l2, [%i1 + 0x10]
	.word	0x2c480005	! t1_kref+0x272c:   	bneg,a,pt	%icc, _kref+0x2740
	.word	0x9db40f50	! t1_kref+0x2730:   	fornot1	%f16, %f16, %f14
	.word	0x85b10d40	! t1_kref+0x2734:   	fnot1	%f4, %f2
	.word	0x85a01a2e	! t1_kref+0x2738:   	fstoi	%f14, %f2
	.word	0xa8e34017	! t1_kref+0x273c:   	subccc	%o5, %l7, %l4
	.word	0x8db0cdf1	! t1_kref+0x2740:   	fnands	%f3, %f17, %f6
	.word	0xea066004	! t1_kref+0x2744:   	ld	[%i1 + 4], %l5
	.word	0xa7837772	! t1_kref+0x2748:   	wr	%o5, 0xfffff772, %gsr
	.word	0x972a201d	! t1_kref+0x274c:   	sll	%o0, 0x1d, %o3
	.word	0x9272400b	! t1_kref+0x2750:   	udiv	%o1, %o3, %o1
	.word	0x9816801a	! t1_kref+0x2754:   	or	%i2, %i2, %o4
	.word	0x87a01a2c	! t1_kref+0x2758:   	fstoi	%f12, %f3
	.word	0x89b186c8	! t1_kref+0x275c:   	fmul8sux16	%f6, %f8, %f4
	.word	0x81de39f4	! t1_kref+0x2760:   	flush	%i0 - 0x60c
	.word	0x95a01928	! t1_kref+0x2764:   	fstod	%f8, %f10
	.word	0x9a30000d	! t1_kref+0x2768:   	orn	%g0, %o5, %o5
	.word	0xaf61000b	! t1_kref+0x276c:   	movl	%fcc0, %o3, %l7
	.word	0x95b20d40	! t1_kref+0x2770:   	fnot1	%f8, %f10
	.word	0x89a08d21	! t1_kref+0x2774:   	fsmuld	%f2, %f1, %f4
	.word	0xa1a00125	! t1_kref+0x2778:   	fabss	%f5, %f16
	.word	0x98f0001a	! t1_kref+0x277c:   	udivcc	%g0, %i2, %o4
	.word	0x9fa01a4c	! t1_kref+0x2780:   	fdtoi	%f12, %f15
	.word	0xdf00a03c	! t1_kref+0x2784:   	ld	[%g2 + 0x3c], %f15
	.word	0xa816c00c	! t1_kref+0x2788:   	or	%i3, %o4, %l4
	.word	0xec4e4000	! t1_kref+0x278c:   	ldsb	[%i1], %l6
	.word	0x90ab401a	! t1_kref+0x2790:   	andncc	%o5, %i2, %o0
	.word	0x9de3bfa0	! t1_kref+0x2794:   	save	%sp, -0x60, %sp
	.word	0xb0e6001b	! t1_kref+0x2798:   	subccc	%i0, %i3, %i0
	.word	0x9bee339a	! t1_kref+0x279c:   	restore	%i0, -0xc66, %o5
	.word	0x91b00ced	! t1_kref+0x27a0:   	fnot2s	%f13, %f8
	.word	0x89a2c8ac	! t1_kref+0x27a4:   	fsubs	%f11, %f12, %f4
	.word	0x91b30a4c	! t1_kref+0x27a8:   	fpadd32	%f12, %f12, %f8
	.word	0x93b28328	! t1_kref+0x27ac:   	bmask	%o2, %o0, %o1
	.word	0x9da000c6	! t1_kref+0x27b0:   	fnegd	%f6, %f14
	.word	0xd826200c	! t1_kref+0x27b4:   	st	%o4, [%i0 + 0xc]
	.word	0x98faa477	! t1_kref+0x27b8:   	sdivcc	%o2, 0x477, %o4
	.word	0xdb200018	! t1_kref+0x27bc:   	st	%f13, [%g0 + %i0]
	.word	0x8da308c4	! t1_kref+0x27c0:   	fsubd	%f12, %f4, %f6
	.word	0xe3062010	! t1_kref+0x27c4:   	ld	[%i0 + 0x10], %f17
	.word	0x81a3884e	! t1_kref+0x27c8:   	faddd	%f14, %f14, %f0
	.word	0x91a0054a	! t1_kref+0x27cc:   	fsqrtd	%f10, %f8
	.word	0xf636c018	! t1_kref+0x27d0:   	sth	%i3, [%i3 + %i0]
	.word	0x95b10ad0	! t1_kref+0x27d4:   	fpsub32	%f4, %f16, %f10
	.word	0x8ba4892e	! t1_kref+0x27d8:   	fmuls	%f18, %f14, %f5
	.word	0xa85b2a6a	! t1_kref+0x27dc:   	smul	%o4, 0xa6a, %l4
	.word	0x81ac4a23	! t1_kref+0x27e0:   	fcmps	%fcc0, %f17, %f3
	.word	0xc9b81019	! t1_kref+0x27e4:   	stda	%f4, [%g0 + %i1]0x80
	.word	0xad23684a	! t1_kref+0x27e8:   	mulscc	%o5, 0x84a, %l6
	.word	0xea470018	! t1_kref+0x27ec:   	ldsw	[%i4 + %i0], %l5
	.word	0x91b00fe0	! t1_kref+0x27f0:   	fones	%f8
	.word	0xda260000	! t1_kref+0x27f4:   	st	%o5, [%i0]
	.word	0x92bee935	! t1_kref+0x27f8:   	xnorcc	%i3, 0x935, %o1
	.word	0x932aa016	! t1_kref+0x27fc:   	sll	%o2, 0x16, %o1
	.word	0x81b00fc0	! t1_kref+0x2800:   	fone	%f0
	.word	0x81a0102d	! t1_kref+0x2804:   	fstox	%f13, %f0
	.word	0xc807bfe4	! t1_kref+0x2808:   	ld	[%fp - 0x1c], %g4
	.word	0x89a00552	! t1_kref+0x280c:   	fsqrtd	%f18, %f4
	.word	0xc7064000	! t1_kref+0x2810:   	ld	[%i1], %f3
	.word	0x960a0008	! t1_kref+0x2814:   	and	%o0, %o0, %o3
	.word	0x9328200e	! t1_kref+0x2818:   	sll	%g0, 0xe, %o1
	.word	0x9bb20aa2	! t1_kref+0x281c:   	fpsub16s	%f8, %f2, %f13
	.word	0xea5e3ff8	! t1_kref+0x2820:   	ldx	[%i0 - 8], %l5
	.word	0x81a00122	! t1_kref+0x2824:   	fabss	%f2, %f0
	.word	0xea08a01e	! t1_kref+0x2828:   	ldub	[%g2 + 0x1e], %l5
	.word	0x9144c000	! t1_kref+0x282c:   	mov	%gsr, %o0
	.word	0x91a28942	! t1_kref+0x2830:   	fmuld	%f10, %f2, %f8
	.word	0xf5ee501d	! t1_kref+0x2834:   	prefetcha	%i1 + %i5, 26
	.word	0xc93f4019	! t1_kref+0x2838:   	std	%f4, [%i5 + %i1]
	.word	0xd100a004	! t1_kref+0x283c:   	ld	[%g2 + 4], %f8
	.word	0x8ba10930	! t1_kref+0x2840:   	fmuls	%f4, %f16, %f5
	.word	0x97408000	! t1_kref+0x2844:   	mov	%ccr, %o3
	.word	0xaa1b6bbd	! t1_kref+0x2848:   	xor	%o5, 0xbbd, %l5
	.word	0x9fc00004	! t1_kref+0x284c:   	call	%g0 + %g4
	.word	0x93a00027	! t1_kref+0x2850:   	fmovs	%f7, %f9
	.word	0x89a20d22	! t1_kref+0x2854:   	fsmuld	%f8, %f2, %f4
	.word	0xd440a024	! t1_kref+0x2858:   	ldsw	[%g2 + 0x24], %o2
	.word	0xc1260000	! t1_kref+0x285c:   	st	%f0, [%i0]
	.word	0x90fdc00c	! t1_kref+0x2860:   	sdivcc	%l7, %o4, %o0
	.word	0x85a00126	! t1_kref+0x2864:   	fabss	%f6, %f2
	.word	0x95b34200	! t1_kref+0x2868:   	array8	%o5, %g0, %o2
	.word	0xda0e6019	! t1_kref+0x286c:   	ldub	[%i1 + 0x19], %o5
	.word	0x9db1cd25	! t1_kref+0x2870:   	fandnot1s	%f7, %f5, %f14
	.word	0xaa70000c	! t1_kref+0x2874:   	udiv	%g0, %o4, %l5
	.word	0x2c480005	! t1_kref+0x2878:   	bneg,a,pt	%icc, _kref+0x288c
	.word	0x8da108cc	! t1_kref+0x287c:   	fsubd	%f4, %f12, %f6
	.word	0x81df610a	! t1_kref+0x2880:   	flush	%i5 + 0x10a
	.word	0xc02e200d	! t1_kref+0x2884:   	clrb	[%i0 + 0xd]
	.word	0x3b480004	! t1_kref+0x2888:   	fble,a,pt	%fcc0, _kref+0x2898
	.word	0xc12e001c	! t1_kref+0x288c:   	st	%fsr, [%i0 + %i4]
	.word	0x8da08944	! t1_kref+0x2890:   	fmuld	%f2, %f4, %f6
	.word	0x925ec00a	! t1_kref+0x2894:   	smul	%i3, %o2, %o1
	.word	0x29480008	! t1_kref+0x2898:   	fbl,a,pt	%fcc0, _kref+0x28b8
	.word	0x9da0192a	! t1_kref+0x289c:   	fstod	%f10, %f14
	.word	0x9126800b	! t1_kref+0x28a0:   	mulscc	%i2, %o3, %o0
	.word	0x81a84a2a	! t1_kref+0x28a4:   	fcmps	%fcc0, %f1, %f10
	.word	0xd91fbfa8	! t1_kref+0x28a8:   	ldd	[%fp - 0x58], %f12
	.word	0xd44e6002	! t1_kref+0x28ac:   	ldsb	[%i1 + 2], %o2
	.word	0x9870223d	! t1_kref+0x28b0:   	udiv	%g0, 0x23d, %o4
	.word	0x89a00132	! t1_kref+0x28b4:   	fabss	%f18, %f4
	.word	0xac7a61a1	! t1_kref+0x28b8:   	sdiv	%o1, 0x1a1, %l6
	.word	0xd3264000	! t1_kref+0x28bc:   	st	%f9, [%i1]
	.word	0x99b10ace	! t1_kref+0x28c0:   	fpsub32	%f4, %f14, %f12
	.word	0x81a01922	! t1_kref+0x28c4:   	fstod	%f2, %f0
	.word	0xeeee9019	! t1_kref+0x28c8:   	ldstuba	[%i2 + %i1]0x80, %l7
	.word	0x9692400a	! t1_kref+0x28cc:   	orcc	%o1, %o2, %o3
	.word	0x960aef9d	! t1_kref+0x28d0:   	and	%o3, 0xf9d, %o3
	.word	0xe86e7ff5	! t1_kref+0x28d4:   	ldstub	[%i1 - 0xb], %l4
	.word	0x91418000	! t1_kref+0x28d8:   	mov	%fprs, %o0
	.word	0xd450a004	! t1_kref+0x28dc:   	ldsh	[%g2 + 4], %o2
	.word	0xd820a024	! t1_kref+0x28e0:   	st	%o4, [%g2 + 0x24]
	.word	0xd208a037	! t1_kref+0x28e4:   	ldub	[%g2 + 0x37], %o1
	.word	0x933b6007	! t1_kref+0x28e8:   	sra	%o5, 0x7, %o1
	.word	0x90700008	! t1_kref+0x28ec:   	udiv	%g0, %o0, %o0
	.word	0x86102004	! t1_kref+0x28f0:   	mov	0x4, %g3
	.word	0x32800000	! t1_kref+0x28f4:   	bne,a	_kref+0x28f4
	.word	0x86a0e001	! t1_kref+0x28f8:   	subcc	%g3, 1, %g3
	.word	0x99b00fc0	! t1_kref+0x28fc:   	fone	%f12
	.word	0x9b20362f	! t1_kref+0x2900:   	mulscc	%g0, -0x9d1, %o5
	.word	0xd4363fee	! t1_kref+0x2904:   	sth	%o2, [%i0 - 0x12]
	.word	0xa9400000	! t1_kref+0x2908:   	mov	%y, %l4
	.word	0xc9be1a5c	! t1_kref+0x290c:   	stda	%f4, [%i0 + %i4]0xd2
	.word	0xd01f4019	! t1_kref+0x2910:   	ldd	[%i5 + %i1], %o0
	.word	0xd820a024	! t1_kref+0x2914:   	st	%o4, [%g2 + 0x24]
	.word	0x92aa800d	! t1_kref+0x2918:   	andncc	%o2, %o5, %o1
	.word	0xd620a024	! t1_kref+0x291c:   	st	%o3, [%g2 + 0x24]
	.word	0xea6e7ff4	! t1_kref+0x2920:   	ldstub	[%i1 - 0xc], %l5
	.word	0x91a0054e	! t1_kref+0x2924:   	fsqrtd	%f14, %f8
	.word	0xacc33ca6	! t1_kref+0x2928:   	addccc	%o4, -0x35a, %l6
	.word	0xc0b01018	! t1_kref+0x292c:   	stha	%g0, [%g0 + %i0]0x80
	.word	0x9da2884c	! t1_kref+0x2930:   	faddd	%f10, %f12, %f14
	.word	0xaf36a00b	! t1_kref+0x2934:   	srl	%i2, 0xb, %l7
	.word	0x81de2e06	! t1_kref+0x2938:   	flush	%i0 + 0xe06
	.word	0xa806c00d	! t1_kref+0x293c:   	add	%i3, %o5, %l4
	.word	0x9da00d2e	! t1_kref+0x2940:   	fsmuld	%f0, %f14, %f14
	.word	0x961ab7d3	! t1_kref+0x2944:   	xor	%o2, -0x82d, %o3
	.word	0xda260000	! t1_kref+0x2948:   	st	%o5, [%i0]
	.word	0x8db28ad0	! t1_kref+0x294c:   	fpsub32	%f10, %f16, %f6
	.word	0x9fa3c826	! t1_kref+0x2950:   	fadds	%f15, %f6, %f15
	.word	0xafb18510	! t1_kref+0x2954:   	fcmpgt16	%f6, %f16, %l7
	.word	0x92334009	! t1_kref+0x2958:   	orn	%o5, %o1, %o1
	.word	0xa8724009	! t1_kref+0x295c:   	udiv	%o1, %o1, %l4
	.word	0x85a108ab	! t1_kref+0x2960:   	fsubs	%f4, %f11, %f2
	.word	0xae1abebc	! t1_kref+0x2964:   	xor	%o2, -0x144, %l7
	.word	0xd24e7fe4	! t1_kref+0x2968:   	ldsb	[%i1 - 0x1c], %o1
	.word	0x9da00544	! t1_kref+0x296c:   	fsqrtd	%f4, %f14
	.word	0xec40a00c	! t1_kref+0x2970:   	ldsw	[%g2 + 0xc], %l6
	.word	0xaaf8001b	! t1_kref+0x2974:   	sdivcc	%g0, %i3, %l5
	.word	0x94182c45	! t1_kref+0x2978:   	xor	%g0, 0xc45, %o2
	.word	0x8fb30aa9	! t1_kref+0x297c:   	fpsub16s	%f12, %f9, %f7
	.word	0x87b00c20	! t1_kref+0x2980:   	fzeros	%f3
	.word	0x91400000	! t1_kref+0x2984:   	mov	%y, %o0
	.word	0xaf20000a	! t1_kref+0x2988:   	mulscc	%g0, %o2, %l7
	.word	0x89b30ece	! t1_kref+0x298c:   	fornot2	%f12, %f14, %f4
	.word	0xe43e401d	! t1_kref+0x2990:   	std	%l2, [%i1 + %i5]
	.word	0xd648a025	! t1_kref+0x2994:   	ldsb	[%g2 + 0x25], %o3
	.word	0xec4e001a	! t1_kref+0x2998:   	ldsb	[%i0 + %i2], %l6
	.word	0x9de3bfa0	! t1_kref+0x299c:   	save	%sp, -0x60, %sp
	.word	0x93ef4000	! t1_kref+0x29a0:   	restore	%i5, %g0, %o1
	.word	0xee0e001a	! t1_kref+0x29a4:   	ldub	[%i0 + %i2], %l7
	.word	0xdf20a00c	! t1_kref+0x29a8:   	st	%f15, [%g2 + 0xc]
	.word	0x9db28912	! t1_kref+0x29ac:   	faligndata	%f10, %f18, %f14
	.word	0xcd1fbcc0	! t1_kref+0x29b0:   	ldd	[%fp - 0x340], %f6
	.word	0x85a049a5	! t1_kref+0x29b4:   	fdivs	%f1, %f5, %f2
	.word	0x8da0104a	! t1_kref+0x29b8:   	fdtox	%f10, %f6
	.word	0xe46e4000	! t1_kref+0x29bc:   	ldstub	[%i1], %l2
	.word	0xa1a00540	! t1_kref+0x29c0:   	fsqrtd	%f0, %f16
	.word	0x85b00cce	! t1_kref+0x29c4:   	fnot2	%f14, %f2
	.word	0x83b10cac	! t1_kref+0x29c8:   	fandnot2s	%f4, %f12, %f1
	.word	0x8ba018d2	! t1_kref+0x29cc:   	fdtos	%f18, %f5
	.word	0x8143e040	! t1_kref+0x29d0:   	membar	0x40
	.word	0xa8aee893	! t1_kref+0x29d4:   	andncc	%i3, 0x893, %l4
	.word	0x89a01912	! t1_kref+0x29d8:   	fitod	%f18, %f4
	.word	0x925a0017	! t1_kref+0x29dc:   	smul	%o0, %l7, %o1
	.word	0x2924fa30	! t1_kref+0x29e0:   	sethi	%hi(0x93e8c000), %l4
	.word	0xd62e401a	! t1_kref+0x29e4:   	stb	%o3, [%i1 + %i2]
	.word	0x8610200b	! t1_kref+0x29e8:   	mov	0xb, %g3
	.word	0x86a0e001	! t1_kref+0x29ec:   	subcc	%g3, 1, %g3
	.word	0x22800018	! t1_kref+0x29f0:   	be,a	_kref+0x2a50
	.word	0xd230a016	! t1_kref+0x29f4:   	sth	%o1, [%g2 + 0x16]
	.word	0xea067fe8	! t1_kref+0x29f8:   	ld	[%i1 - 0x18], %l5
	.word	0xa3b44ea0	! t1_kref+0x29fc:   	fsrc1s	%f17, %f17
	.word	0xa7832bbe	! t1_kref+0x2a00:   	wr	%o4, 0xbbe, %gsr
	.word	0xd4567ffc	! t1_kref+0x2a04:   	ldsh	[%i1 - 4], %o2
	.word	0x3b4ffff9	! t1_kref+0x2a08:   	fble,a,pt	%fcc0, _kref+0x29ec
	.word	0xaa5dc00b	! t1_kref+0x2a0c:   	smul	%l7, %o3, %l5
	.word	0x987ee829	! t1_kref+0x2a10:   	sdiv	%i3, 0x829, %o4
	.word	0xaef2b69a	! t1_kref+0x2a14:   	udivcc	%o2, -0x966, %l7
	.word	0x83a38921	! t1_kref+0x2a18:   	fmuls	%f14, %f1, %f1
	.word	0xa8832d9c	! t1_kref+0x2a1c:   	addcc	%o4, 0xd9c, %l4
	.word	0xda28a005	! t1_kref+0x2a20:   	stb	%o5, [%g2 + 5]
	.word	0x90fac00d	! t1_kref+0x2a24:   	sdivcc	%o3, %o5, %o0
	.word	0xda56401b	! t1_kref+0x2a28:   	ldsh	[%i1 + %i3], %o5
	.word	0x92a33ee6	! t1_kref+0x2a2c:   	subcc	%o4, -0x11a, %o1
	.word	0x9ba01082	! t1_kref+0x2a30:   	fxtos	%f2, %f13
	.word	0xd320a01c	! t1_kref+0x2a34:   	st	%f9, [%g2 + 0x1c]
	.word	0x81a00940	! t1_kref+0x2a38:   	fmuld	%f0, %f0, %f0
	.word	0x81a18946	! t1_kref+0x2a3c:   	fmuld	%f6, %f6, %f0
	.word	0xf207bfe0	! t1_kref+0x2a40:   	ld	[%fp - 0x20], %i1
	.word	0xa81df4e8	! t1_kref+0x2a44:   	xor	%l7, -0xb18, %l4
	.word	0x8143c000	! t1_kref+0x2a48:   	stbar
	.word	0xc030a00e	! t1_kref+0x2a4c:   	clrh	[%g2 + 0xe]
	.word	0xee470018	! t1_kref+0x2a50:   	ldsw	[%i4 + %i0], %l7
	.word	0xd826401c	! t1_kref+0x2a54:   	st	%o4, [%i1 + %i4]
	.word	0xa1a288c0	! t1_kref+0x2a58:   	fsubd	%f10, %f0, %f16
	.word	0xd4364000	! t1_kref+0x2a5c:   	sth	%o2, [%i1]
	.word	0xd640a024	! t1_kref+0x2a60:   	ldsw	[%g2 + 0x24], %o3
	.word	0x99a408c2	! t1_kref+0x2a64:   	fsubd	%f16, %f2, %f12
	.word	0x23480005	! t1_kref+0x2a68:   	fbne,a,pt	%fcc0, _kref+0x2a7c
	.word	0x95b10446	! t1_kref+0x2a6c:   	fcmpne16	%f4, %f6, %o2
	.word	0x83b2cda1	! t1_kref+0x2a70:   	fxors	%f11, %f1, %f1
	.word	0xc91e3ff0	! t1_kref+0x2a74:   	ldd	[%i0 - 0x10], %f4
	.word	0x2f3e6766	! t1_kref+0x2a78:   	sethi	%hi(0xf99d9800), %l7
	.word	0xd406201c	! t1_kref+0x2a7c:   	ld	[%i0 + 0x1c], %o2
	.word	0x9bb20240	! t1_kref+0x2a80:   	array16	%o0, %g0, %o5
	.word	0xd80e0000	! t1_kref+0x2a84:   	ldub	[%i0], %o4
	.word	0x94783b7d	! t1_kref+0x2a88:   	sdiv	%g0, -0x483, %o2
	.word	0xa1a0190c	! t1_kref+0x2a8c:   	fitod	%f12, %f16
	.word	0x95b5c0ec	! t1_kref+0x2a90:   	edge16ln	%l7, %o4, %o2
	.word	0x99a08842	! t1_kref+0x2a94:   	faddd	%f2, %f2, %f12
	.word	0x91b18d40	! t1_kref+0x2a98:   	fnot1	%f6, %f8
	.word	0x9612aa01	! t1_kref+0x2a9c:   	or	%o2, 0xa01, %o3
	.word	0x9db00a04	! t1_kref+0x2aa0:   	fpadd16	%f0, %f4, %f14
	.word	0xaf26ec4f	! t1_kref+0x2aa4:   	mulscc	%i3, 0xc4f, %l7
	.word	0x89b40a48	! t1_kref+0x2aa8:   	fpadd32	%f16, %f8, %f4
	.word	0x99a18944	! t1_kref+0x2aac:   	fmuld	%f6, %f4, %f12
	.word	0xaaa025b3	! t1_kref+0x2ab0:   	subcc	%g0, 0x5b3, %l5
	.word	0xab2a400b	! t1_kref+0x2ab4:   	sll	%o1, %o3, %l5
	.word	0xa3a01a2a	! t1_kref+0x2ab8:   	fstoi	%f10, %f17
	.word	0x89b086e8	! t1_kref+0x2abc:   	fmul8ulx16	%f2, %f8, %f4
	.word	0x92e3000c	! t1_kref+0x2ac0:   	subccc	%o4, %o4, %o1
	.word	0x93a018d0	! t1_kref+0x2ac4:   	fdtos	%f16, %f9
	.word	0xee00a01c	! t1_kref+0x2ac8:   	ld	[%g2 + 0x1c], %l7
	.word	0x87b007a6	! t1_kref+0x2acc:   	fpackfix	%f6, %f3
	.word	0xac18374d	! t1_kref+0x2ad0:   	xor	%g0, -0x8b3, %l6
	.word	0xa816c008	! t1_kref+0x2ad4:   	or	%i3, %o0, %l4
	.word	0x9033400b	! t1_kref+0x2ad8:   	orn	%o5, %o3, %o0
	.word	0xa1aac040	! t1_kref+0x2adc:   	fmovdge	%fcc0, %f0, %f16
	.word	0x86102002	! t1_kref+0x2ae0:   	mov	0x2, %g3
	.word	0x32800000	! t1_kref+0x2ae4:   	bne,a	_kref+0x2ae4
	.word	0x86a0e001	! t1_kref+0x2ae8:   	subcc	%g3, 1, %g3
	.word	0xaef5c008	! t1_kref+0x2aec:   	udivcc	%l7, %o0, %l7
	.word	0xee2e0000	! t1_kref+0x2af0:   	stb	%l7, [%i0]
	.word	0x960ab13c	! t1_kref+0x2af4:   	and	%o2, -0xec4, %o3
	.word	0x90db0017	! t1_kref+0x2af8:   	smulcc	%o4, %l7, %o0
	.word	0x923aebd5	! t1_kref+0x2afc:   	xnor	%o3, 0xbd5, %o1
	.word	0x91a00842	! t1_kref+0x2b00:   	faddd	%f0, %f2, %f8
	.word	0x39480007	! t1_kref+0x2b04:   	fbuge,a,pt	%fcc0, _kref+0x2b20
	.word	0x950370e8	! t1_kref+0x2b08:   	taddcc	%o5, -0xf18, %o2
	.word	0x85a38950	! t1_kref+0x2b0c:   	fmuld	%f14, %f16, %f2
	.word	0xd13e7fe8	! t1_kref+0x2b10:   	std	%f8, [%i1 - 0x18]
	.word	0xd1180018	! t1_kref+0x2b14:   	ldd	[%g0 + %i0], %f8
	.word	0xabb2435a	! t1_kref+0x2b18:   	alignaddrl	%o1, %i2, %l5
	.word	0x912a8009	! t1_kref+0x2b1c:   	sll	%o2, %o1, %o0
	.word	0x36480003	! t1_kref+0x2b20:   	bge,a,pt	%icc, _kref+0x2b2c
	.word	0x9abaa3aa	! t1_kref+0x2b24:   	xnorcc	%o2, 0x3aa, %o5
	.word	0xe8df5019	! t1_kref+0x2b28:   	ldxa	[%i5 + %i1]0x80, %l4
	.word	0x8586c00b	! t1_kref+0x2b2c:   	wr	%i3, %o3, %ccr
	.word	0x9096800d	! t1_kref+0x2b30:   	orcc	%i2, %o5, %o0
	.word	0xd4e81018	! t1_kref+0x2b34:   	ldstuba	[%g0 + %i0]0x80, %o2
	.word	0xd20e3ffe	! t1_kref+0x2b38:   	ldub	[%i0 - 2], %o1
	.word	0x91b34240	! t1_kref+0x2b3c:   	array16	%o5, %g0, %o0
	.word	0xa1b2cd30	! t1_kref+0x2b40:   	fandnot1s	%f11, %f16, %f16
	.word	0x90baf9da	! t1_kref+0x2b44:   	xnorcc	%o3, -0x626, %o0
	.word	0xe856c019	! t1_kref+0x2b48:   	ldsh	[%i3 + %i1], %l4
	.word	0x86102003	! t1_kref+0x2b4c:   	mov	0x3, %g3
	.word	0x32800000	! t1_kref+0x2b50:   	bne,a	_kref+0x2b50
	.word	0x86a0e001	! t1_kref+0x2b54:   	subcc	%g3, 1, %g3
	.word	0x94bb246f	! t1_kref+0x2b58:   	xnorcc	%o4, 0x46f, %o2
	.word	0x87a0012f	! t1_kref+0x2b5c:   	fabss	%f15, %f3
	.word	0x95b20440	! t1_kref+0x2b60:   	fcmpne16	%f8, %f0, %o2
	.word	0xd8300019	! t1_kref+0x2b64:   	sth	%o4, [%g0 + %i1]
	.word	0xea460000	! t1_kref+0x2b68:   	ldsw	[%i0], %l5
	.word	0x81b00cd0	! t1_kref+0x2b6c:   	fnot2	%f16, %f0
	.word	0x9db2cca3	! t1_kref+0x2b70:   	fandnot2s	%f11, %f3, %f14
	.word	0xe810a016	! t1_kref+0x2b74:   	lduh	[%g2 + 0x16], %l4
	.word	0xd42e0000	! t1_kref+0x2b78:   	stb	%o2, [%i0]
	.word	0x9043000b	! t1_kref+0x2b7c:   	addc	%o4, %o3, %o0
	.word	0xa9b404c0	! t1_kref+0x2b80:   	fcmpne32	%f16, %f0, %l4
	.word	0xec580019	! t1_kref+0x2b84:   	ldx	[%g0 + %i1], %l6
	.word	0xda00a02c	! t1_kref+0x2b88:   	ld	[%g2 + 0x2c], %o5
	.word	0x97a0012e	! t1_kref+0x2b8c:   	fabss	%f14, %f11
	.word	0x3a480003	! t1_kref+0x2b90:   	bcc,a,pt	%icc, _kref+0x2b9c
	.word	0x94bb355c	! t1_kref+0x2b94:   	xnorcc	%o4, -0xaa4, %o2
	.word	0x9da44d27	! t1_kref+0x2b98:   	fsmuld	%f17, %f7, %f14
	.word	0x9da01906	! t1_kref+0x2b9c:   	fitod	%f6, %f14
	.word	0x3a480001	! t1_kref+0x2ba0:   	bcc,a,pt	%icc, _kref+0x2ba4
	.word	0x9036800d	! t1_kref+0x2ba4:   	orn	%i2, %o5, %o0
	.word	0x9b26801a	! t1_kref+0x2ba8:   	mulscc	%i2, %i2, %o5
	.word	0xd210a03e	! t1_kref+0x2bac:   	lduh	[%g2 + 0x3e], %o1
	.word	0x95b34a62	! t1_kref+0x2bb0:   	fpadd32s	%f13, %f2, %f10
	.word	0xac06c01a	! t1_kref+0x2bb4:   	add	%i3, %i2, %l6
	.word	0x28480004	! t1_kref+0x2bb8:   	bleu,a,pt	%icc, _kref+0x2bc8
	.word	0x9832ff6a	! t1_kref+0x2bbc:   	orn	%o3, -0x96, %o4
	.word	0x91400000	! t1_kref+0x2bc0:   	mov	%y, %o0
	.word	0xaf3a2004	! t1_kref+0x2bc4:   	sra	%o0, 0x4, %l7
	.word	0xc078a02c	! t1_kref+0x2bc8:   	swap	[%g2 + 0x2c], %g0
	.word	0x91b40c8c	! t1_kref+0x2bcc:   	fandnot2	%f16, %f12, %f8
	.word	0x85a01910	! t1_kref+0x2bd0:   	fitod	%f16, %f2
	.word	0x9a82c00b	! t1_kref+0x2bd4:   	addcc	%o3, %o3, %o5
	.word	0xe8560000	! t1_kref+0x2bd8:   	ldsh	[%i0], %l4
	.word	0x81a01921	! t1_kref+0x2bdc:   	fstod	%f1, %f0
	.word	0xaa46800a	! t1_kref+0x2be0:   	addc	%i2, %o2, %l5
	.word	0x81828000	! t1_kref+0x2be4:   	wr	%o2, %g0, %y
	.word	0xe5262000	! t1_kref+0x2be8:   	st	%f18, [%i0]
	.word	0xea56c018	! t1_kref+0x2bec:   	ldsh	[%i3 + %i0], %l5
	.word	0x85a18d27	! t1_kref+0x2bf0:   	fsmuld	%f6, %f7, %f2
	.word	0xaea8385d	! t1_kref+0x2bf4:   	andncc	%g0, -0x7a3, %l7
!	.word	0x204e8500	! t1_kref+0x2bf8:   	bn,a,pt	%icc, SYM(t1_subr0)
	   	bn,a,pt	%icc, SYM(t1_subr0)
	.word	0x9f414000	! t1_kref+0x2bfc:   	mov	%pc, %o7
	.word	0xe26e6008	! t1_kref+0x2c00:   	ldstub	[%i1 + 8], %l1
	.word	0xa1a0190d	! t1_kref+0x2c04:   	fitod	%f13, %f16
	.word	0xd8f65000	! t1_kref+0x2c08:   	stxa	%o4, [%i1]0x80
	.word	0x81b28aef	! t1_kref+0x2c0c:   	fpsub32s	%f10, %f15, %f0
	.word	0x8da34d26	! t1_kref+0x2c10:   	fsmuld	%f13, %f6, %f6
	.word	0xdf00a02c	! t1_kref+0x2c14:   	ld	[%g2 + 0x2c], %f15
	.word	0x89a0192e	! t1_kref+0x2c18:   	fstod	%f14, %f4
	.word	0xa5a01108	! t1_kref+0x2c1c:   	fxtod	%f8, %f18
	.word	0xaf400000	! t1_kref+0x2c20:   	mov	%y, %l7
	.word	0x9de3bfa0	! t1_kref+0x2c24:   	save	%sp, -0x60, %sp
	.word	0xabeef940	! t1_kref+0x2c28:   	restore	%i3, -0x6c0, %l5
	.word	0xafb1840e	! t1_kref+0x2c2c:   	fcmple16	%f6, %f14, %l7
	.word	0xf4366010	! t1_kref+0x2c30:   	sth	%i2, [%i1 + 0x10]
	.word	0xaf222567	! t1_kref+0x2c34:   	mulscc	%o0, 0x567, %l7
	.word	0xd400a034	! t1_kref+0x2c38:   	ld	[%g2 + 0x34], %o2
	.word	0x26480004	! t1_kref+0x2c3c:   	bl,a,pt	%icc, _kref+0x2c4c
	.word	0x90ba8017	! t1_kref+0x2c40:   	xnorcc	%o2, %l7, %o0
	.word	0x98f2310f	! t1_kref+0x2c44:   	udivcc	%o0, -0xef1, %o4
	.word	0xea50a034	! t1_kref+0x2c48:   	ldsh	[%g2 + 0x34], %l5
	.word	0xf42e3ffe	! t1_kref+0x2c4c:   	stb	%i2, [%i0 - 2]
	.word	0x31480002	! t1_kref+0x2c50:   	fba,a,pt	%fcc0, _kref+0x2c58
	.word	0xe41e4000	! t1_kref+0x2c54:   	ldd	[%i1], %l2
	.word	0xd900a02c	! t1_kref+0x2c58:   	ld	[%g2 + 0x2c], %f12
	.word	0xa5b48e67	! t1_kref+0x2c5c:   	fxnors	%f18, %f7, %f18
	.word	0xd60e0000	! t1_kref+0x2c60:   	ldub	[%i0], %o3
	.word	0x8143c000	! t1_kref+0x2c64:   	stbar
	.word	0xe8380018	! t1_kref+0x2c68:   	std	%l4, [%g0 + %i0]
	.word	0x983aad1e	! t1_kref+0x2c6c:   	xnor	%o2, 0xd1e, %o4
	.word	0x35800002	! t1_kref+0x2c70:   	fbue,a	_kref+0x2c78
	.word	0xaa83000c	! t1_kref+0x2c74:   	addcc	%o4, %o4, %l5
	.word	0xe19e5a1a	! t1_kref+0x2c78:   	ldda	[%i1 + %i2]0xd0, %f16
	.word	0x99a08830	! t1_kref+0x2c7c:   	fadds	%f2, %f16, %f12
	.word	0xaed5c009	! t1_kref+0x2c80:   	umulcc	%l7, %o1, %l7
	.word	0xe41e3fe0	! t1_kref+0x2c84:   	ldd	[%i0 - 0x20], %l2
	.word	0xec4e8019	! t1_kref+0x2c88:   	ldsb	[%i2 + %i1], %l6
	.word	0xc030a034	! t1_kref+0x2c8c:   	clrh	[%g2 + 0x34]
	.word	0xd99e1000	! t1_kref+0x2c90:   	ldda	[%i0]0x80, %f12
	.word	0xda56401b	! t1_kref+0x2c94:   	ldsh	[%i1 + %i3], %o5
	.word	0x8186c000	! t1_kref+0x2c98:   	wr	%i3, %g0, %y
	.word	0x9a5a6337	! t1_kref+0x2c9c:   	smul	%o1, 0x337, %o5
	.word	0x85a0190d	! t1_kref+0x2ca0:   	fitod	%f13, %f2
	.word	0x9070000c	! t1_kref+0x2ca4:   	udiv	%g0, %o4, %o0
	.word	0xdb263fec	! t1_kref+0x2ca8:   	st	%f13, [%i0 - 0x14]
	.word	0xec00a01c	! t1_kref+0x2cac:   	ld	[%g2 + 0x1c], %l6
	.word	0xa1b38723	! t1_kref+0x2cb0:   	fmuld8ulx16	%f14, %f3, %f16
	.word	0x81580000	! t1_kref+0x2cb4:   	flushw
	.word	0xee08a005	! t1_kref+0x2cb8:   	ldub	[%g2 + 5], %l7
	.word	0x9adb400d	! t1_kref+0x2cbc:   	smulcc	%o5, %o5, %o5
	.word	0x24480005	! t1_kref+0x2cc0:   	ble,a,pt	%icc, _kref+0x2cd4
	.word	0x81a00126	! t1_kref+0x2cc4:   	fabss	%f6, %f0
	.word	0xd500a03c	! t1_kref+0x2cc8:   	ld	[%g2 + 0x3c], %f10
	.word	0xd64e6013	! t1_kref+0x2ccc:   	ldsb	[%i1 + 0x13], %o3
	.word	0x988a3525	! t1_kref+0x2cd0:   	andcc	%o0, -0xadb, %o4
	.word	0x9682b123	! t1_kref+0x2cd4:   	addcc	%o2, -0xedd, %o3
	.word	0x22480003	! t1_kref+0x2cd8:   	be,a,pt	%icc, _kref+0x2ce4
	.word	0xda28a03d	! t1_kref+0x2cdc:   	stb	%o5, [%g2 + 0x3d]
	.word	0xae16accc	! t1_kref+0x2ce0:   	or	%i2, 0xccc, %l7
	.word	0x81a00546	! t1_kref+0x2ce4:   	fsqrtd	%f6, %f0
	.word	0x9de3bfa0	! t1_kref+0x2ce8:   	save	%sp, -0x60, %sp
	.word	0xa9ef29d9	! t1_kref+0x2cec:   	restore	%i4, 0x9d9, %l4
	.word	0xa8b32bf0	! t1_kref+0x2cf0:   	orncc	%o4, 0xbf0, %l4
	.word	0xdd1e2010	! t1_kref+0x2cf4:   	ldd	[%i0 + 0x10], %f14
	.word	0x9665c017	! t1_kref+0x2cf8:   	subc	%l7, %l7, %o3
	.word	0x8585c008	! t1_kref+0x2cfc:   	wr	%l7, %o0, %ccr
	.word	0x29480007	! t1_kref+0x2d00:   	fbl,a,pt	%fcc0, _kref+0x2d1c
	.word	0x85a01908	! t1_kref+0x2d04:   	fitod	%f8, %f2
	.word	0xd120a014	! t1_kref+0x2d08:   	st	%f8, [%g2 + 0x14]
	.word	0x81828000	! t1_kref+0x2d0c:   	wr	%o2, %g0, %y
	.word	0xaa7dc00b	! t1_kref+0x2d10:   	sdiv	%l7, %o3, %l5
	.word	0xa9400000	! t1_kref+0x2d14:   	mov	%y, %l4
	.word	0xae85c00c	! t1_kref+0x2d18:   	addcc	%l7, %o4, %l7
	.word	0x932b6002	! t1_kref+0x2d1c:   	sll	%o5, 0x2, %o1
	.word	0x81580000	! t1_kref+0x2d20:   	flushw
	.word	0xae05fac1	! t1_kref+0x2d24:   	add	%l7, -0x53f, %l7
	.word	0xad1a6536	! t1_kref+0x2d28:   	tsubcctv	%o1, 0x536, %l6
	.word	0xd650a00c	! t1_kref+0x2d2c:   	ldsh	[%g2 + 0xc], %o3
	.word	0xcf270018	! t1_kref+0x2d30:   	st	%f7, [%i4 + %i0]
	.word	0x153091f7	! t1_kref+0x2d34:   	sethi	%hi(0xc247dc00), %o2
	.word	0x33800007	! t1_kref+0x2d38:   	fbe,a	_kref+0x2d54
	.word	0xd62e8019	! t1_kref+0x2d3c:   	stb	%o3, [%i2 + %i1]
	.word	0xe968a10e	! t1_kref+0x2d40:   	prefetch	%g2 + 0x10e, 20
	.word	0xec6e0000	! t1_kref+0x2d44:   	ldstub	[%i0], %l6
	.word	0x81a00140	! t1_kref+0x2d48:   	fabsd	%f0, %f0
	.word	0x91a01025	! t1_kref+0x2d4c:   	fstox	%f5, %f8
	.word	0xadb2002d	! t1_kref+0x2d50:   	edge8n	%o0, %o5, %l6
	.word	0x87ab002b	! t1_kref+0x2d54:   	fmovsuge	%fcc0, %f11, %f3
	.word	0x25480002	! t1_kref+0x2d58:   	fblg,a,pt	%fcc0, _kref+0x2d60
	.word	0x992a800b	! t1_kref+0x2d5c:   	sll	%o2, %o3, %o4
	.word	0x81dced80	! t1_kref+0x2d60:   	flush	%l3 + 0xd80
	.word	0x28800005	! t1_kref+0x2d64:   	bleu,a	_kref+0x2d78
	.word	0x81db278a	! t1_kref+0x2d68:   	flush	%o4 + 0x78a
	.word	0x89b28dc4	! t1_kref+0x2d6c:   	fnand	%f10, %f4, %f4
	.word	0xc7267fe4	! t1_kref+0x2d70:   	st	%f3, [%i1 - 0x1c]
	.word	0x8143c000	! t1_kref+0x2d74:   	stbar
	.word	0x948b000b	! t1_kref+0x2d78:   	andcc	%o4, %o3, %o2
	.word	0x9a3a0008	! t1_kref+0x2d7c:   	xnor	%o0, %o0, %o5
	.word	0xee28a03f	! t1_kref+0x2d80:   	stb	%l7, [%g2 + 0x3f]
	.word	0x3b480007	! t1_kref+0x2d84:   	fble,a,pt	%fcc0, _kref+0x2da0
	.word	0x9a8afe5f	! t1_kref+0x2d88:   	andcc	%o3, -0x1a1, %o5
	.word	0x9bb2c0a9	! t1_kref+0x2d8c:   	edge16n	%o3, %o1, %o5
	.word	0x993b0008	! t1_kref+0x2d90:   	sra	%o4, %o0, %o4
	.word	0x97a000a5	! t1_kref+0x2d94:   	fnegs	%f5, %f11
	.word	0x26480008	! t1_kref+0x2d98:   	bl,a,pt	%icc, _kref+0x2db8
	.word	0xc3064000	! t1_kref+0x2d9c:   	ld	[%i1], %f1
	.word	0xa940c000	! t1_kref+0x2da0:   	mov	%asi, %l4
	.word	0x3c800005	! t1_kref+0x2da4:   	bpos,a	_kref+0x2db8
	.word	0xd8067fe8	! t1_kref+0x2da8:   	ld	[%i1 - 0x18], %o4
	.word	0xab2ec00b	! t1_kref+0x2dac:   	sll	%i3, %o3, %l5
	.word	0x8da0054c	! t1_kref+0x2db0:   	fsqrtd	%f12, %f6
	.word	0xa832c01a	! t1_kref+0x2db4:   	orn	%o3, %i2, %l4
	.word	0xa5ab402a	! t1_kref+0x2db8:   	fmovsle	%fcc0, %f10, %f18
	.word	0x93b10dee	! t1_kref+0x2dbc:   	fnands	%f4, %f14, %f9
	.word	0x1b1fd810	! t1_kref+0x2dc0:   	sethi	%hi(0x7f604000), %o5
	.word	0x98f2a660	! t1_kref+0x2dc4:   	udivcc	%o2, 0x660, %o4
	.word	0x96268017	! t1_kref+0x2dc8:   	sub	%i2, %l7, %o3
	.word	0x8da00548	! t1_kref+0x2dcc:   	fsqrtd	%f8, %f6
	.word	0x94324008	! t1_kref+0x2dd0:   	orn	%o1, %o0, %o2
	.word	0xaf400000	! t1_kref+0x2dd4:   	mov	%y, %l7
	.word	0xab26af58	! t1_kref+0x2dd8:   	mulscc	%i2, 0xf58, %l5
	.word	0xa786e380	! t1_kref+0x2ddc:   	wr	%i3, 0x380, %gsr
	.word	0xae32a24c	! t1_kref+0x2de0:   	orn	%o2, 0x24c, %l7
	.word	0x85a01922	! t1_kref+0x2de4:   	fstod	%f2, %f2
	call	SYM(t1_subr3)
	.word	0xee08a007	! t1_kref+0x2dec:   	ldub	[%g2 + 7], %l7
	.word	0xec564000	! t1_kref+0x2df0:   	ldsh	[%i1], %l6
	.word	0x9a330000	! t1_kref+0x2df4:   	orn	%o4, %g0, %o5
	.word	0x963dc00c	! t1_kref+0x2df8:   	xnor	%l7, %o4, %o3
	.word	0x26480007	! t1_kref+0x2dfc:   	bl,a,pt	%icc, _kref+0x2e18
	.word	0xee0e401a	! t1_kref+0x2e00:   	ldub	[%i1 + %i2], %l7
	.word	0x22480001	! t1_kref+0x2e04:   	be,a,pt	%icc, _kref+0x2e08
	.word	0x99a28d24	! t1_kref+0x2e08:   	fsmuld	%f10, %f4, %f12
	.word	0x25480003	! t1_kref+0x2e0c:   	fblg,a,pt	%fcc0, _kref+0x2e18
	.word	0x99a018c2	! t1_kref+0x2e10:   	fdtos	%f2, %f12
	.word	0x3b480007	! t1_kref+0x2e14:   	fble,a,pt	%fcc0, _kref+0x2e30
	.word	0x9da10950	! t1_kref+0x2e18:   	fmuld	%f4, %f16, %f14
	.word	0x9fa01a2b	! t1_kref+0x2e1c:   	fstoi	%f11, %f15
	.word	0xd8563ff0	! t1_kref+0x2e20:   	ldsh	[%i0 - 0x10], %o4
	.word	0x94f37880	! t1_kref+0x2e24:   	udivcc	%o5, -0x780, %o2
	.word	0x85b00900	! t1_kref+0x2e28:   	faligndata	%f0, %f0, %f2
	.word	0x81a24922	! t1_kref+0x2e2c:   	fmuls	%f9, %f2, %f0
	.word	0xa9b00169	! t1_kref+0x2e30:   	edge32ln	%g0, %o1, %l4
	.word	0xd60e6001	! t1_kref+0x2e34:   	ldub	[%i1 + 1], %o3
	.word	0xd1270019	! t1_kref+0x2e38:   	st	%f8, [%i4 + %i1]
	.word	0x91b00cc6	! t1_kref+0x2e3c:   	fnot2	%f6, %f8
	.word	0x85a189c8	! t1_kref+0x2e40:   	fdivd	%f6, %f8, %f2
	.word	0xab332014	! t1_kref+0x2e44:   	srl	%o4, 0x14, %l5
	.word	0x8fa00131	! t1_kref+0x2e48:   	fabss	%f17, %f7
	.word	0x91b40984	! t1_kref+0x2e4c:   	bshuffle	%f16, %f4, %f8
	.word	0x8da20848	! t1_kref+0x2e50:   	faddd	%f8, %f8, %f6
	.word	0x9db28d60	! t1_kref+0x2e54:   	fnot1s	%f10, %f14
	.word	0xdd1fbd50	! t1_kref+0x2e58:   	ldd	[%fp - 0x2b0], %f14
	.word	0x83a01a25	! t1_kref+0x2e5c:   	fstoi	%f5, %f1
	.word	0x98db0009	! t1_kref+0x2e60:   	smulcc	%o4, %o1, %o4
	.word	0x90fab868	! t1_kref+0x2e64:   	sdivcc	%o2, -0x798, %o0
	.word	0xd9be1000	! t1_kref+0x2e68:   	stda	%f12, [%i0]0x80
	.word	0x85b00fc0	! t1_kref+0x2e6c:   	fone	%f2
	.word	0x95a289c4	! t1_kref+0x2e70:   	fdivd	%f10, %f4, %f10
	.word	0xe83e6000	! t1_kref+0x2e74:   	std	%l4, [%i1]
	.word	0x81aa0a23	! t1_kref+0x2e78:   	fcmps	%fcc0, %f8, %f3
	.word	0xa9322009	! t1_kref+0x2e7c:   	srl	%o0, 0x9, %l4
	.word	0x8da309ca	! t1_kref+0x2e80:   	fdivd	%f12, %f10, %f6
	.word	0xab32600d	! t1_kref+0x2e84:   	srl	%o1, 0xd, %l5
	.word	0xda6e8018	! t1_kref+0x2e88:   	ldstub	[%i2 + %i0], %o5
	.word	0xd650a02c	! t1_kref+0x2e8c:   	ldsh	[%g2 + 0x2c], %o3
	.word	0x9b408000	! t1_kref+0x2e90:   	mov	%ccr, %o5
	.word	0xae0af31e	! t1_kref+0x2e94:   	and	%o3, -0xce2, %l7
	.word	0xc126401c	! t1_kref+0x2e98:   	st	%f0, [%i1 + %i4]
	.word	0x8143c000	! t1_kref+0x2e9c:   	stbar
	.word	0x37480002	! t1_kref+0x2ea0:   	fbge,a,pt	%fcc0, _kref+0x2ea8
	.word	0xc807bfe4	! t1_kref+0x2ea4:   	ld	[%fp - 0x1c], %g4
	.word	0xaefb4017	! t1_kref+0x2ea8:   	sdivcc	%o5, %l7, %l7
	.word	0x9fc10000	! t1_kref+0x2eac:   	call	%g4
	.word	0xd6070019	! t1_kref+0x2eb0:   	ld	[%i4 + %i1], %o3
	.word	0xcf00a014	! t1_kref+0x2eb4:   	ld	[%g2 + 0x14], %f7
	.word	0xe19f5a59	! t1_kref+0x2eb8:   	ldda	[%i5 + %i1]0xd2, %f16
	.word	0xac7b6497	! t1_kref+0x2ebc:   	sdiv	%o5, 0x497, %l6
	.word	0x8bb34d60	! t1_kref+0x2ec0:   	fnot1s	%f13, %f5
	.word	0xd006200c	! t1_kref+0x2ec4:   	ld	[%i0 + 0xc], %o0
	.word	0xaab80000	! t1_kref+0x2ec8:   	xnorcc	%g0, %g0, %l5
	.word	0xe8063fec	! t1_kref+0x2ecc:   	ld	[%i0 - 0x14], %l4
	.word	0xaea2401b	! t1_kref+0x2ed0:   	subcc	%o1, %i3, %l7
	.word	0x99b0006c	! t1_kref+0x2ed4:   	edge8ln	%g0, %o4, %o4
	.word	0x9da01904	! t1_kref+0x2ed8:   	fitod	%f4, %f14
	.word	0x8143c000	! t1_kref+0x2edc:   	stbar
	.word	0x94d5c00a	! t1_kref+0x2ee0:   	umulcc	%l7, %o2, %o2
	.word	0xd706600c	! t1_kref+0x2ee4:   	ld	[%i1 + 0xc], %f11
	.word	0xcd270018	! t1_kref+0x2ee8:   	st	%f6, [%i4 + %i0]
	.word	0xee266010	! t1_kref+0x2eec:   	st	%l7, [%i1 + 0x10]
	.word	0x968a4009	! t1_kref+0x2ef0:   	andcc	%o1, %o1, %o3
	.word	0x93a089a7	! t1_kref+0x2ef4:   	fdivs	%f2, %f7, %f9
	.word	0x91b24a22	! t1_kref+0x2ef8:   	fpadd16s	%f9, %f2, %f8
	.word	0xa1a00046	! t1_kref+0x2efc:   	fmovd	%f6, %f16
	.word	0xab028008	! t1_kref+0x2f00:   	taddcc	%o2, %o0, %l5
	.word	0x81b08ea0	! t1_kref+0x2f04:   	fsrc1s	%f2, %f0
	.word	0x81b00fc0	! t1_kref+0x2f08:   	fone	%f0
	.word	0xec48a027	! t1_kref+0x2f0c:   	ldsb	[%g2 + 0x27], %l6
	.word	0x21480003	! t1_kref+0x2f10:   	fbn,a,pt	%fcc0, _kref+0x2f1c
	.word	0xd920a00c	! t1_kref+0x2f14:   	st	%f12, [%g2 + 0xc]
	.word	0xd66e6018	! t1_kref+0x2f18:   	ldstub	[%i1 + 0x18], %o3
	.word	0xa8ba787e	! t1_kref+0x2f1c:   	xnorcc	%o1, -0x782, %l4
	sethi	%hi(2f), %o7
	.word	0xe40be360	! t1_kref+0x2f24:   	ldub	[%o7 + 0x360], %l2
	.word	0xa41ca00c	! t1_kref+0x2f28:   	xor	%l2, 0xc, %l2
	.word	0xe42be360	! t1_kref+0x2f2c:   	stb	%l2, [%o7 + 0x360]
	.word	0x81dbe360	! t1_kref+0x2f30:   	flush	%o7 + 0x360
	.word	0x985a001a	! t1_kref+0x2f34:   	smul	%o0, %i2, %o4
	.word	0xaa02e968	! t1_kref+0x2f38:   	add	%o3, 0x968, %l5
	.word	0xd000a034	! t1_kref+0x2f3c:   	ld	[%g2 + 0x34], %o0
	.word	0x81a009ca	! t1_kref+0x2f40:   	fdivd	%f0, %f10, %f0
	.word	0x9da0884e	! t1_kref+0x2f44:   	faddd	%f2, %f14, %f14
	.word	0xd050a006	! t1_kref+0x2f48:   	ldsh	[%g2 + 6], %o0
	.word	0xd9981019	! t1_kref+0x2f4c:   	ldda	[%g0 + %i1]0x80, %f12
	.word	0x3f480002	! t1_kref+0x2f50:   	fbo,a,pt	%fcc0, _kref+0x2f58
	.word	0x13380cd6	! t1_kref+0x2f54:   	sethi	%hi(0xe0335800), %o1
	.word	0xede6500a	! t1_kref+0x2f58:   	casa	[%i1]0x80, %o2, %l6
	.word	0x98402772	! t1_kref+0x2f5c:   	addc	%g0, 0x772, %o4
2:	.word	0xaf1abc8f	! t1_kref+0x2f60:   	tsubcctv	%o2, -0x371, %l7
	.word	0x93a14930	! t1_kref+0x2f64:   	fmuls	%f5, %f16, %f9
	.word	0x9da01907	! t1_kref+0x2f68:   	fitod	%f7, %f14
	.word	0x9082800b	! t1_kref+0x2f6c:   	addcc	%o2, %o3, %o0
	.word	0x89a30840	! t1_kref+0x2f70:   	faddd	%f12, %f0, %f4
	.word	0x99b00e50	! t1_kref+0x2f74:   	fxnor	%f0, %f16, %f12
	.word	0xf3ee501b	! t1_kref+0x2f78:   	prefetcha	%i1 + %i3, 25
	.word	0x89b3ccaf	! t1_kref+0x2f7c:   	fandnot2s	%f15, %f15, %f4
	.word	0xafb2812b	! t1_kref+0x2f80:   	edge32n	%o2, %o3, %l7
	.word	0xd53e6000	! t1_kref+0x2f84:   	std	%f10, [%i1]
	.word	0xa3a01a2b	! t1_kref+0x2f88:   	fstoi	%f11, %f17
	.word	0x920a8008	! t1_kref+0x2f8c:   	and	%o2, %o0, %o1
	call	SYM(t1_subr3)
	.word	0x91b38f44	! t1_kref+0x2f94:   	fornot1	%f14, %f4, %f8
	.word	0x39480007	! t1_kref+0x2f98:   	fbuge,a,pt	%fcc0, _kref+0x2fb4
	.word	0x90980000	! t1_kref+0x2f9c:   	xorcc	%g0, %g0, %o0
	.word	0xf7ee101c	! t1_kref+0x2fa0:   	prefetcha	%i0 + %i4, 27
	.word	0xdd264000	! t1_kref+0x2fa4:   	st	%f14, [%i1]
	.word	0x89b20d40	! t1_kref+0x2fa8:   	fnot1	%f8, %f4
	.word	0xd6270018	! t1_kref+0x2fac:   	st	%o3, [%i4 + %i0]
	.word	0x89b48d40	! t1_kref+0x2fb0:   	fnot1	%f18, %f4
	.word	0x9a3b7775	! t1_kref+0x2fb4:   	xnor	%o5, -0x88b, %o5
	.word	0xee367ffa	! t1_kref+0x2fb8:   	sth	%l7, [%i1 - 6]
	.word	0x25480004	! t1_kref+0x2fbc:   	fblg,a,pt	%fcc0, _kref+0x2fcc
	.word	0x9da309ca	! t1_kref+0x2fc0:   	fdivd	%f12, %f10, %f14
	.word	0x98aabacd	! t1_kref+0x2fc4:   	andncc	%o2, -0x533, %o4
	.word	0x9632e512	! t1_kref+0x2fc8:   	orn	%o3, 0x512, %o3
	.word	0x9de3bfa0	! t1_kref+0x2fcc:   	save	%sp, -0x60, %sp
	.word	0x97ef7511	! t1_kref+0x2fd0:   	restore	%i5, -0xaef, %o3
	.word	0xcf200019	! t1_kref+0x2fd4:   	st	%f7, [%g0 + %i1]
	.word	0x9b280000	! t1_kref+0x2fd8:   	sll	%g0, %g0, %o5
	.word	0x9da0054e	! t1_kref+0x2fdc:   	fsqrtd	%f14, %f14
	.word	0xab30200b	! t1_kref+0x2fe0:   	srl	%g0, 0xb, %l5
	.word	0xacb00008	! t1_kref+0x2fe4:   	orncc	%g0, %o0, %l6
	.word	0x968a8017	! t1_kref+0x2fe8:   	andcc	%o2, %l7, %o3
	.word	0x9932c00b	! t1_kref+0x2fec:   	srl	%o3, %o3, %o4
	.word	0xabb3433b	! t1_kref+0x2ff0:   	bmask	%o5, %i3, %l5
	.word	0x8bb44d27	! t1_kref+0x2ff4:   	fandnot1s	%f17, %f7, %f5
	.word	0x91a28950	! t1_kref+0x2ff8:   	fmuld	%f10, %f16, %f8
	.word	0x8db00cd2	! t1_kref+0x2ffc:   	fnot2	%f18, %f6
	.word	0xd91e401d	! t1_kref+0x3000:   	ldd	[%i1 + %i5], %f12
	.word	0x81dac005	! t1_kref+0x3004:   	flush	%o3 + %g5
	.word	0xa936c00a	! t1_kref+0x3008:   	srl	%i3, %o2, %l4
	.word	0x8ba01a2d	! t1_kref+0x300c:   	fstoi	%f13, %f5
	.word	0x962823fd	! t1_kref+0x3010:   	andn	%g0, 0x3fd, %o3
	.word	0xda30a014	! t1_kref+0x3014:   	sth	%o5, [%g2 + 0x14]
	.word	0x99a18942	! t1_kref+0x3018:   	fmuld	%f6, %f2, %f12
	.word	0x8143c000	! t1_kref+0x301c:   	stbar
	.word	0x92330017	! t1_kref+0x3020:   	orn	%o4, %l7, %o1
	.word	0xaae37b44	! t1_kref+0x3024:   	subccc	%o5, -0x4bc, %l5
	.word	0xee6e8018	! t1_kref+0x3028:   	ldstub	[%i2 + %i0], %l7
	.word	0x24480005	! t1_kref+0x302c:   	ble,a,pt	%icc, _kref+0x3040
	.word	0x81a000c0	! t1_kref+0x3030:   	fnegd	%f0, %f0
	.word	0x90fa801b	! t1_kref+0x3034:   	sdivcc	%o2, %i3, %o0
	.word	0xf4266014	! t1_kref+0x3038:   	st	%i2, [%i1 + 0x14]
	.word	0x93b2404a	! t1_kref+0x303c:   	edge8l	%o1, %o2, %o1
	.word	0xd230a03e	! t1_kref+0x3040:   	sth	%o1, [%g2 + 0x3e]
	.word	0x22480005	! t1_kref+0x3044:   	be,a,pt	%icc, _kref+0x3058
	.word	0x9aa5e78c	! t1_kref+0x3048:   	subcc	%l7, 0x78c, %o5
	.word	0xc02e3ffe	! t1_kref+0x304c:   	clrb	[%i0 - 2]
	.word	0xd650a00e	! t1_kref+0x3050:   	ldsh	[%g2 + 0xe], %o3
	.word	0x97b6801a	! t1_kref+0x3054:   	edge8	%i2, %i2, %o3
	.word	0x2b480007	! t1_kref+0x3058:   	fbug,a,pt	%fcc0, _kref+0x3074
	.word	0xf62e401a	! t1_kref+0x305c:   	stb	%i3, [%i1 + %i2]
	.word	0xe81f4018	! t1_kref+0x3060:   	ldd	[%i5 + %i0], %l4
	.word	0x90980009	! t1_kref+0x3064:   	xorcc	%g0, %o1, %o0
	.word	0x943e800b	! t1_kref+0x3068:   	xnor	%i2, %o3, %o2
	.word	0x81a94a2b	! t1_kref+0x306c:   	fcmps	%fcc0, %f5, %f11
	.word	0xe4180018	! t1_kref+0x3070:   	ldd	[%g0 + %i0], %l2
	.word	0x9da000ce	! t1_kref+0x3074:   	fnegd	%f14, %f14
	.word	0x8da000c8	! t1_kref+0x3078:   	fnegd	%f8, %f6
	.word	0xe41f4018	! t1_kref+0x307c:   	ldd	[%i5 + %i0], %l2
	.word	0xea96d018	! t1_kref+0x3080:   	lduha	[%i3 + %i0]0x80, %l5
	.word	0x81a98acc	! t1_kref+0x3084:   	fcmped	%fcc0, %f6, %f12
	.word	0xa1b00cc6	! t1_kref+0x3088:   	fnot2	%f6, %f16
	.word	0x9a202404	! t1_kref+0x308c:   	sub	%g0, 0x404, %o5
	.word	0xeeae5000	! t1_kref+0x3090:   	stba	%l7, [%i1]0x80
	.word	0x948e800b	! t1_kref+0x3094:   	andcc	%i2, %o3, %o2
	.word	0xae5ec01a	! t1_kref+0x3098:   	smul	%i3, %i2, %l7
	.word	0xe06e8018	! t1_kref+0x309c:   	ldstub	[%i2 + %i0], %l0
	.word	0x94c68009	! t1_kref+0x30a0:   	addccc	%i2, %o1, %o2
	.word	0xae36be1c	! t1_kref+0x30a4:   	orn	%i2, -0x1e4, %l7
	.word	0xad233aeb	! t1_kref+0x30a8:   	mulscc	%o4, -0x515, %l6
	.word	0xd636001b	! t1_kref+0x30ac:   	sth	%o3, [%i0 + %i3]
	.word	0x24480002	! t1_kref+0x30b0:   	ble,a,pt	%icc, _kref+0x30b8
	.word	0xabb28029	! t1_kref+0x30b4:   	edge8n	%o2, %o1, %l5
	.word	0xe83e401d	! t1_kref+0x30b8:   	std	%l4, [%i1 + %i5]
	.word	0xaaa6e446	! t1_kref+0x30bc:   	subcc	%i3, 0x446, %l5
	.word	0xd4871019	! t1_kref+0x30c0:   	lda	[%i4 + %i1]0x80, %o2
	.word	0xac32801a	! t1_kref+0x30c4:   	orn	%o2, %i2, %l6
	.word	0xa5a00d25	! t1_kref+0x30c8:   	fsmuld	%f0, %f5, %f18
	.word	0x2c480003	! t1_kref+0x30cc:   	bneg,a,pt	%icc, _kref+0x30d8
	.word	0x92327fea	! t1_kref+0x30d0:   	orn	%o1, -0x16, %o1
	.word	0xd11fbf78	! t1_kref+0x30d4:   	ldd	[%fp - 0x88], %f8
	.word	0x967e800b	! t1_kref+0x30d8:   	sdiv	%i2, %o3, %o3
	.word	0xda28a035	! t1_kref+0x30dc:   	stb	%o5, [%g2 + 0x35]
	.word	0x99a34d2e	! t1_kref+0x30e0:   	fsmuld	%f13, %f14, %f12
	.word	0xc920a01c	! t1_kref+0x30e4:   	st	%f4, [%g2 + 0x1c]
	.word	0xad02800a	! t1_kref+0x30e8:   	taddcc	%o2, %o2, %l6
	.word	0x81b107c4	! t1_kref+0x30ec:   	pdist	%f4, %f4, %f0
	.word	0x8610201a	! t1_kref+0x30f0:   	mov	0x1a, %g3
	.word	0x86a0e001	! t1_kref+0x30f4:   	subcc	%g3, 1, %g3
	.word	0x22800013	! t1_kref+0x30f8:   	be,a	_kref+0x3144
	.word	0xa83b7788	! t1_kref+0x30fc:   	xnor	%o5, -0x878, %l4
	.word	0x912ae00c	! t1_kref+0x3100:   	sll	%o3, 0xc, %o0
	.word	0xea080018	! t1_kref+0x3104:   	ldub	[%g0 + %i0], %l5
	.word	0x27480003	! t1_kref+0x3108:   	fbul,a,pt	%fcc0, _kref+0x3114
	.word	0x95b30048	! t1_kref+0x310c:   	edge8l	%o4, %o0, %o2
	.word	0xa9202975	! t1_kref+0x3110:   	mulscc	%g0, 0x975, %l4
	.word	0x87a44830	! t1_kref+0x3114:   	fadds	%f17, %f16, %f3
	.word	0xa1a34d25	! t1_kref+0x3118:   	fsmuld	%f13, %f5, %f16
	.word	0xabb185c4	! t1_kref+0x311c:   	fcmpeq32	%f6, %f4, %l5
	.word	0x91b00402	! t1_kref+0x3120:   	fcmple16	%f0, %f2, %o0
	.word	0xec1e2018	! t1_kref+0x3124:   	ldd	[%i0 + 0x18], %l6
	.word	0xd608a03f	! t1_kref+0x3128:   	ldub	[%g2 + 0x3f], %o3
	.word	0xa3a04824	! t1_kref+0x312c:   	fadds	%f1, %f4, %f17
	.word	0x9fc10000	! t1_kref+0x3130:   	call	%g4
	.word	0xa1b3cde1	! t1_kref+0x3134:   	fnands	%f15, %f1, %f16
	.word	0xea464000	! t1_kref+0x3138:   	ldsw	[%i1], %l5
	.word	0xac1a8009	! t1_kref+0x313c:   	xor	%o2, %o1, %l6
	.word	0xcd981019	! t1_kref+0x3140:   	ldda	[%g0 + %i1]0x80, %f6
	.word	0x91b34240	! t1_kref+0x3144:   	array16	%o5, %g0, %o0
	.word	0x93a08827	! t1_kref+0x3148:   	fadds	%f2, %f7, %f9
	.word	0xd4567fec	! t1_kref+0x314c:   	ldsh	[%i1 - 0x14], %o2
	.word	0x981a7657	! t1_kref+0x3150:   	xor	%o1, -0x9a9, %o4
	.word	0x9da01a29	! t1_kref+0x3154:   	fstoi	%f9, %f14
	.word	0x81a00550	! t1_kref+0x3158:   	fsqrtd	%f16, %f0
	.word	0x8db0c62a	! t1_kref+0x315c:   	fmul8x16	%f3, %f10, %f6
	.word	0x99368000	! t1_kref+0x3160:   	srl	%i2, %g0, %o4
	.word	0xe8ee9018	! t1_kref+0x3164:   	ldstuba	[%i2 + %i0]0x80, %l4
	.word	0x95a01106	! t1_kref+0x3168:   	fxtod	%f6, %f10
	.word	0x8143c000	! t1_kref+0x316c:   	stbar
	.word	0x9476c00a	! t1_kref+0x3170:   	udiv	%i3, %o2, %o2
	.word	0xc51e2008	! t1_kref+0x3174:   	ldd	[%i0 + 8], %f2
	.word	0x9bb38508	! t1_kref+0x3178:   	fcmpgt16	%f14, %f8, %o5
	.word	0x81a01a2e	! t1_kref+0x317c:   	fstoi	%f14, %f0
	.word	0x96834009	! t1_kref+0x3180:   	addcc	%o5, %o1, %o3
	.word	0x9825f44b	! t1_kref+0x3184:   	sub	%l7, -0xbb5, %o4
	.word	0x89a0192a	! t1_kref+0x3188:   	fstod	%f10, %f4
	.word	0x83b0caa5	! t1_kref+0x318c:   	fpsub16s	%f3, %f5, %f1
	.word	0xea06001c	! t1_kref+0x3190:   	ld	[%i0 + %i4], %l5
	.word	0xec380019	! t1_kref+0x3194:   	std	%l6, [%g0 + %i1]
	.word	0xc19e5a1a	! t1_kref+0x3198:   	ldda	[%i1 + %i2]0xd0, %f0
	.word	0x96927834	! t1_kref+0x319c:   	orcc	%o1, -0x7cc, %o3
	.word	0xd4763ff8	! t1_kref+0x31a0:   	stx	%o2, [%i0 - 8]
	.word	0xd648a03d	! t1_kref+0x31a4:   	ldsb	[%g2 + 0x3d], %o3
	.word	0x99a01a23	! t1_kref+0x31a8:   	fstoi	%f3, %f12
	.word	0x30480003	! t1_kref+0x31ac:   	ba,a,pt	%icc, _kref+0x31b8
	.word	0x8143c000	! t1_kref+0x31b0:   	stbar
	.word	0x85a01900	! t1_kref+0x31b4:   	fitod	%f0, %f2
	.word	0x85b00c20	! t1_kref+0x31b8:   	fzeros	%f2
	.word	0x31480006	! t1_kref+0x31bc:   	fba,a,pt	%fcc0, _kref+0x31d4
	.word	0x95a01927	! t1_kref+0x31c0:   	fstod	%f7, %f10
	.word	0x97a408ae	! t1_kref+0x31c4:   	fsubs	%f16, %f14, %f11
	.word	0x32800007	! t1_kref+0x31c8:   	bne,a	_kref+0x31e4
	.word	0x92f6e361	! t1_kref+0x31cc:   	udivcc	%i3, 0x361, %o1
	.word	0x9fc00004	! t1_kref+0x31d0:   	call	%g0 + %g4
	.word	0x9a0ec00c	! t1_kref+0x31d4:   	and	%i3, %o4, %o5
	.word	0x99a0054a	! t1_kref+0x31d8:   	fsqrtd	%f10, %f12
	.word	0xa3a00124	! t1_kref+0x31dc:   	fabss	%f4, %f17
	.word	0x91a0054a	! t1_kref+0x31e0:   	fsqrtd	%f10, %f8
	.word	0xc1062010	! t1_kref+0x31e4:   	ld	[%i0 + 0x10], %f0
	.word	0x92803478	! t1_kref+0x31e8:   	addcc	%g0, -0xb88, %o1
	.word	0x9293400a	! t1_kref+0x31ec:   	orcc	%o5, %o2, %o1
	.word	0xcb20a01c	! t1_kref+0x31f0:   	st	%f5, [%g2 + 0x1c]
	.word	0xc06e3ff4	! t1_kref+0x31f4:   	ldstub	[%i0 - 0xc], %g0
	.word	0xd46e401a	! t1_kref+0x31f8:   	ldstub	[%i1 + %i2], %o2
	.word	0x85b28a10	! t1_kref+0x31fc:   	fpadd16	%f10, %f16, %f2
	.word	0xa1a01a40	! t1_kref+0x3200:   	fdtoi	%f0, %f16
	.word	0xc12e401c	! t1_kref+0x3204:   	st	%fsr, [%i1 + %i4]
	.word	0x93a00030	! t1_kref+0x3208:   	fmovs	%f16, %f9
	.word	0x33480004	! t1_kref+0x320c:   	fbe,a,pt	%fcc0, _kref+0x321c
	.word	0x8db08d80	! t1_kref+0x3210:   	fxor	%f2, %f0, %f6
	.word	0x83a00122	! t1_kref+0x3214:   	fabss	%f2, %f1
	.word	0xd51e7fe0	! t1_kref+0x3218:   	ldd	[%i1 - 0x20], %f10
	.word	0x97b18586	! t1_kref+0x321c:   	fcmpgt32	%f6, %f6, %o3
	.word	0xaebb000b	! t1_kref+0x3220:   	xnorcc	%o4, %o3, %l7
	.word	0x8ba10928	! t1_kref+0x3224:   	fmuls	%f4, %f8, %f5
	.word	0x8da288c0	! t1_kref+0x3228:   	fsubd	%f10, %f0, %f6
	.word	0x85a0190a	! t1_kref+0x322c:   	fitod	%f10, %f2
	.word	0xad40c000	! t1_kref+0x3230:   	mov	%asi, %l6
	sethi	%hi(2f), %o7
	.word	0xe40be27c	! t1_kref+0x3238:   	ldub	[%o7 + 0x27c], %l2
	.word	0xa41ca00c	! t1_kref+0x323c:   	xor	%l2, 0xc, %l2
	.word	0xe42be27c	! t1_kref+0x3240:   	stb	%l2, [%o7 + 0x27c]
	.word	0x81dbe27c	! t1_kref+0x3244:   	flush	%o7 + 0x27c
	.word	0x292c3713	! t1_kref+0x3248:   	sethi	%hi(0xb0dc4c00), %l4
	.word	0x91a01a4c	! t1_kref+0x324c:   	fdtoi	%f12, %f8
	.word	0x99b18d40	! t1_kref+0x3250:   	fnot1	%f6, %f12
	.word	0xe5063fe4	! t1_kref+0x3254:   	ld	[%i0 - 0x1c], %f18
	.word	0x947a6919	! t1_kref+0x3258:   	sdiv	%o1, 0x919, %o2
	.word	0x953b201b	! t1_kref+0x325c:   	sra	%o4, 0x1b, %o2
	.word	0x89b38ea0	! t1_kref+0x3260:   	fsrc1s	%f14, %f4
	.word	0xc3200018	! t1_kref+0x3264:   	st	%f1, [%g0 + %i0]
	.word	0xa1b0066d	! t1_kref+0x3268:   	fmul8x16au	%f0, %f13, %f16
	.word	0x3f480005	! t1_kref+0x326c:   	fbo,a,pt	%fcc0, _kref+0x3280
	.word	0xa1a349af	! t1_kref+0x3270:   	fdivs	%f13, %f15, %f16
	.word	0xd840a034	! t1_kref+0x3274:   	ldsw	[%g2 + 0x34], %o4
	.word	0x913ae01c	! t1_kref+0x3278:   	sra	%o3, 0x1c, %o0
2:	.word	0xe66e401a	! t1_kref+0x327c:   	ldstub	[%i1 + %i2], %l3
	.word	0xc12e401c	! t1_kref+0x3280:   	st	%fsr, [%i1 + %i4]
	.word	0x9a5aad49	! t1_kref+0x3284:   	smul	%o2, 0xd49, %o5
	.word	0x96968009	! t1_kref+0x3288:   	orcc	%i2, %o1, %o3
	.word	0x912ec00b	! t1_kref+0x328c:   	sll	%i3, %o3, %o0
	.word	0xec3e3ff8	! t1_kref+0x3290:   	std	%l6, [%i0 - 8]
	.word	0x91b386c6	! t1_kref+0x3294:   	fmul8sux16	%f14, %f6, %f8
	.word	0xe5066008	! t1_kref+0x3298:   	ld	[%i1 + 8], %f18
	.word	0x95b4050a	! t1_kref+0x329c:   	fcmpgt16	%f16, %f10, %o2
	.word	0x9ba1882c	! t1_kref+0x32a0:   	fadds	%f6, %f12, %f13
	.word	0xd030a024	! t1_kref+0x32a4:   	sth	%o0, [%g2 + 0x24]
	.word	0x21480002	! t1_kref+0x32a8:   	fbn,a,pt	%fcc0, _kref+0x32b0
	.word	0xe4be501d	! t1_kref+0x32ac:   	stda	%l2, [%i1 + %i5]0x80
	.word	0xd430a00c	! t1_kref+0x32b0:   	sth	%o2, [%g2 + 0xc]
	.word	0xd1be501d	! t1_kref+0x32b4:   	stda	%f8, [%i1 + %i5]0x80
	.word	0x133764ec	! t1_kref+0x32b8:   	sethi	%hi(0xdd93b000), %o1
	.word	0x9bb10ea0	! t1_kref+0x32bc:   	fsrc1s	%f4, %f13
	.word	0xa5a00d2d	! t1_kref+0x32c0:   	fsmuld	%f0, %f13, %f18
	.word	0x3e480003	! t1_kref+0x32c4:   	bvc,a,pt	%icc, _kref+0x32d0
	.word	0xa93dc00a	! t1_kref+0x32c8:   	sra	%l7, %o2, %l4
	.word	0x131c8f6f	! t1_kref+0x32cc:   	sethi	%hi(0x723dbc00), %o1
	.word	0x99a00848	! t1_kref+0x32d0:   	faddd	%f0, %f8, %f12
	.word	0xa923779e	! t1_kref+0x32d4:   	mulscc	%o5, -0x862, %l4
	.word	0x9165400c	! t1_kref+0x32d8:   	movcs	%icc, %o4, %o0
	.word	0xaaaa25f3	! t1_kref+0x32dc:   	andncc	%o0, 0x5f3, %l5
	.word	0x9fc10000	! t1_kref+0x32e0:   	call	%g4
	.word	0xda467fe8	! t1_kref+0x32e4:   	ldsw	[%i1 - 0x18], %o5
	.word	0x9a120000	! t1_kref+0x32e8:   	or	%o0, %g0, %o5
	.word	0xf430a02e	! t1_kref+0x32ec:   	sth	%i2, [%g2 + 0x2e]
	.word	0x81b00daf	! t1_kref+0x32f0:   	fxors	%f0, %f15, %f0
	.word	0x3d480004	! t1_kref+0x32f4:   	fbule,a,pt	%fcc0, _kref+0x3304
	.word	0x9da9402a	! t1_kref+0x32f8:   	fmovsug	%fcc0, %f10, %f14
	.word	0x8db20dd2	! t1_kref+0x32fc:   	fnand	%f8, %f18, %f6
	.word	0xd19f1a58	! t1_kref+0x3300:   	ldda	[%i4 + %i0]0xd2, %f8
	.word	0x89a2c822	! t1_kref+0x3304:   	fadds	%f11, %f2, %f4
	.word	0xee20a03c	! t1_kref+0x3308:   	st	%l7, [%g2 + 0x3c]
	.word	0x948ab03a	! t1_kref+0x330c:   	andcc	%o2, -0xfc6, %o2
	.word	0x85a00552	! t1_kref+0x3310:   	fsqrtd	%f18, %f2
	.word	0xafb2834b	! t1_kref+0x3314:   	alignaddrl	%o2, %o3, %l7
	.word	0x8da018c8	! t1_kref+0x3318:   	fdtos	%f8, %f6
	.word	0xd60e8018	! t1_kref+0x331c:   	ldub	[%i2 + %i0], %o3
	.word	0xd64e2006	! t1_kref+0x3320:   	ldsb	[%i0 + 6], %o3
	.word	0x9882c01b	! t1_kref+0x3324:   	addcc	%o3, %i3, %o4
	.word	0xee066018	! t1_kref+0x3328:   	ld	[%i1 + 0x18], %l7
	.word	0xec3e001d	! t1_kref+0x332c:   	std	%l6, [%i0 + %i5]
	.word	0x151ffd77	! t1_kref+0x3330:   	sethi	%hi(0x7ff5dc00), %o2
	.word	0xdac61000	! t1_kref+0x3334:   	ldswa	[%i0]0x80, %o5
	.word	0x1723ee45	! t1_kref+0x3338:   	sethi	%hi(0x8fb91400), %o3
	.word	0xaa30000b	! t1_kref+0x333c:   	orn	%g0, %o3, %l5
	.word	0x9a780008	! t1_kref+0x3340:   	sdiv	%g0, %o0, %o5
	.word	0xd8367ffa	! t1_kref+0x3344:   	sth	%o4, [%i1 - 6]
	.word	0xda0e8019	! t1_kref+0x3348:   	ldub	[%i2 + %i1], %o5
	.word	0xd99e1a1d	! t1_kref+0x334c:   	ldda	[%i0 + %i5]0xd0, %f12
	.word	0xa8feaf98	! t1_kref+0x3350:   	sdivcc	%i2, 0xf98, %l4
	.word	0x95136bca	! t1_kref+0x3354:   	taddcctv	%o5, 0xbca, %o2
	.word	0x99a0094e	! t1_kref+0x3358:   	fmuld	%f0, %f14, %f12
	.word	0x9133201f	! t1_kref+0x335c:   	srl	%o4, 0x1f, %o0
	.word	0xcd380018	! t1_kref+0x3360:   	std	%f6, [%g0 + %i0]
	.word	0x81de3832	! t1_kref+0x3364:   	flush	%i0 - 0x7ce
	.word	0x9da00544	! t1_kref+0x3368:   	fsqrtd	%f4, %f14
	.word	0xea067fec	! t1_kref+0x336c:   	ld	[%i1 - 0x14], %l5
	sethi	%hi(2f), %o7
	.word	0xe40be3b8	! t1_kref+0x3374:   	ldub	[%o7 + 0x3b8], %l2
	.word	0xa41ca00c	! t1_kref+0x3378:   	xor	%l2, 0xc, %l2
	.word	0xe42be3b8	! t1_kref+0x337c:   	stb	%l2, [%o7 + 0x3b8]
	.word	0x81dbe3b8	! t1_kref+0x3380:   	flush	%o7 + 0x3b8
	.word	0x8ba00127	! t1_kref+0x3384:   	fabss	%f7, %f5
	.word	0x89b006f0	! t1_kref+0x3388:   	fmul8ulx16	%f0, %f16, %f4
	.word	0x9a903dbc	! t1_kref+0x338c:   	orcc	%g0, -0x244, %o5
	.word	0xadb18440	! t1_kref+0x3390:   	fcmpne16	%f6, %f0, %l6
	.word	0xad26feb3	! t1_kref+0x3394:   	mulscc	%i3, -0x14d, %l6
	.word	0xaf26a408	! t1_kref+0x3398:   	mulscc	%i2, 0x408, %l7
	.word	0xe41e3ff0	! t1_kref+0x339c:   	ldd	[%i0 - 0x10], %l2
	.word	0xee6e6012	! t1_kref+0x33a0:   	ldstub	[%i1 + 0x12], %l7
	.word	0xa9134017	! t1_kref+0x33a4:   	taddcctv	%o5, %l7, %l4
	.word	0x8da000a9	! t1_kref+0x33a8:   	fnegs	%f9, %f6
	.word	0xd830a026	! t1_kref+0x33ac:   	sth	%o4, [%g2 + 0x26]
	.word	0x952de018	! t1_kref+0x33b0:   	sll	%l7, 0x18, %o2
	.word	0x81a98ad0	! t1_kref+0x33b4:   	fcmped	%fcc0, %f6, %f16
2:	.word	0x9842e91e	! t1_kref+0x33b8:   	addc	%o3, 0x91e, %o4
	.word	0xd040a024	! t1_kref+0x33bc:   	ldsw	[%g2 + 0x24], %o0
	.word	0xaedeee4e	! t1_kref+0x33c0:   	smulcc	%i3, 0xe4e, %l7
	.word	0x9472c01b	! t1_kref+0x33c4:   	udiv	%o3, %i3, %o2
	.word	0xc320a01c	! t1_kref+0x33c8:   	st	%f1, [%g2 + 0x1c]
	.word	0x81a30950	! t1_kref+0x33cc:   	fmuld	%f12, %f16, %f0
	.word	0x9de3bfa0	! t1_kref+0x33d0:   	save	%sp, -0x60, %sp
	.word	0xbb07619b	! t1_kref+0x33d4:   	taddcc	%i5, 0x19b, %i5
	.word	0x95ee401d	! t1_kref+0x33d8:   	restore	%i1, %i5, %o2
	.word	0xaefe8009	! t1_kref+0x33dc:   	sdivcc	%i2, %o1, %l7
	.word	0xd02e4000	! t1_kref+0x33e0:   	stb	%o0, [%i1]
	.word	0xc700a03c	! t1_kref+0x33e4:   	ld	[%g2 + 0x3c], %f3
	.word	0xa1b10f46	! t1_kref+0x33e8:   	fornot1	%f4, %f6, %f16
	.word	0xd220a00c	! t1_kref+0x33ec:   	st	%o1, [%g2 + 0xc]
	.word	0xee68a01d	! t1_kref+0x33f0:   	ldstub	[%g2 + 0x1d], %l7
	.word	0xa9b38540	! t1_kref+0x33f4:   	fcmpeq16	%f14, %f0, %l4
	.word	0x8ba01a50	! t1_kref+0x33f8:   	fdtoi	%f16, %f5
	.word	0x9623000b	! t1_kref+0x33fc:   	sub	%o4, %o3, %o3
	.word	0xe43e3fe8	! t1_kref+0x3400:   	std	%l2, [%i0 - 0x18]
	.word	0xec40a01c	! t1_kref+0x3404:   	ldsw	[%g2 + 0x1c], %l6
	.word	0xabb38410	! t1_kref+0x3408:   	fcmple16	%f14, %f16, %l5
	.word	0xd186101c	! t1_kref+0x340c:   	lda	[%i0 + %i4]0x80, %f8
	.word	0x95a00129	! t1_kref+0x3410:   	fabss	%f9, %f10
	.word	0x22800003	! t1_kref+0x3414:   	be,a	_kref+0x3420
	.word	0x95408000	! t1_kref+0x3418:   	mov	%ccr, %o2
	.word	0x81b08d40	! t1_kref+0x341c:   	fnot1	%f2, %f0
	.word	0x2e480004	! t1_kref+0x3420:   	bvs,a,pt	%icc, _kref+0x3430
	.word	0xd60e8018	! t1_kref+0x3424:   	ldub	[%i2 + %i0], %o3
	.word	0x952dc00c	! t1_kref+0x3428:   	sll	%l7, %o4, %o2
	.word	0xa85a8017	! t1_kref+0x342c:   	smul	%o2, %l7, %l4
	.word	0xc500a004	! t1_kref+0x3430:   	ld	[%g2 + 4], %f2
	.word	0xd6562004	! t1_kref+0x3434:   	ldsh	[%i0 + 4], %o3
	.word	0x93b28357	! t1_kref+0x3438:   	alignaddrl	%o2, %l7, %o1
	.word	0x81a0004e	! t1_kref+0x343c:   	fmovd	%f14, %f0
	.word	0xcb263ffc	! t1_kref+0x3440:   	st	%f5, [%i0 - 4]
	.word	0xee08a015	! t1_kref+0x3444:   	ldub	[%g2 + 0x15], %l7
	.word	0xacd5e624	! t1_kref+0x3448:   	umulcc	%l7, 0x624, %l6
	.word	0xea567ff0	! t1_kref+0x344c:   	ldsh	[%i1 - 0x10], %l5
	.word	0x85a0190e	! t1_kref+0x3450:   	fitod	%f14, %f2
	.word	0x9a9a401b	! t1_kref+0x3454:   	xorcc	%o1, %i3, %o5
	.word	0xda0e200e	! t1_kref+0x3458:   	ldub	[%i0 + 0xe], %o5
	.word	0xea40a03c	! t1_kref+0x345c:   	ldsw	[%g2 + 0x3c], %l5
	.word	0xd5263fe4	! t1_kref+0x3460:   	st	%f10, [%i0 - 0x1c]
	.word	0x2c480001	! t1_kref+0x3464:   	bneg,a,pt	%icc, _kref+0x3468
	.word	0xa5a00550	! t1_kref+0x3468:   	fsqrtd	%f16, %f18
	.word	0xafb30240	! t1_kref+0x346c:   	array16	%o4, %g0, %l7
	.word	0x98323d7e	! t1_kref+0x3470:   	orn	%o0, -0x282, %o4
	.word	0xaafaac0c	! t1_kref+0x3474:   	sdivcc	%o2, 0xc0c, %l5
	.word	0x81dc74fa	! t1_kref+0x3478:   	flush	%l1 - 0xb06
	.word	0x85a01a4e	! t1_kref+0x347c:   	fdtoi	%f14, %f2
	.word	0x89aa004e	! t1_kref+0x3480:   	fmovda	%fcc0, %f14, %f4
	.word	0xd000a024	! t1_kref+0x3484:   	ld	[%g2 + 0x24], %o0
	.word	0xd1865000	! t1_kref+0x3488:   	lda	[%i1]0x80, %f8
	.word	0x92aa6f16	! t1_kref+0x348c:   	andncc	%o1, 0xf16, %o1
	.word	0xa87221a1	! t1_kref+0x3490:   	udiv	%o0, 0x1a1, %l4
	.word	0x89a01924	! t1_kref+0x3494:   	fstod	%f4, %f4
	.word	0xc9262004	! t1_kref+0x3498:   	st	%f4, [%i0 + 4]
	.word	0x91b38e44	! t1_kref+0x349c:   	fxnor	%f14, %f4, %f8
	.word	0x94e24008	! t1_kref+0x34a0:   	subccc	%o1, %o0, %o2
	.word	0xad400000	! t1_kref+0x34a4:   	mov	%y, %l6
	.word	0xaea3400c	! t1_kref+0x34a8:   	subcc	%o5, %o4, %l7
	.word	0x99a0190a	! t1_kref+0x34ac:   	fitod	%f10, %f12
	.word	0xec5f4019	! t1_kref+0x34b0:   	ldx	[%i5 + %i1], %l6
	.word	0xac124008	! t1_kref+0x34b4:   	or	%o1, %o0, %l6
	.word	0xd86e8019	! t1_kref+0x34b8:   	ldstub	[%i2 + %i1], %o4
	.word	0x9af82d4e	! t1_kref+0x34bc:   	sdivcc	%g0, 0xd4e, %o5
	.word	0x20480006	! t1_kref+0x34c0:   	bn,a,pt	%icc, _kref+0x34d8
	.word	0x97b20280	! t1_kref+0x34c4:   	array32	%o0, %g0, %o3
	.word	0xd450a03e	! t1_kref+0x34c8:   	ldsh	[%g2 + 0x3e], %o2
	.word	0x97a01a52	! t1_kref+0x34cc:   	fdtoi	%f18, %f11
	.word	0xd2360000	! t1_kref+0x34d0:   	sth	%o1, [%i0]
	.word	0xdd070019	! t1_kref+0x34d4:   	ld	[%i4 + %i1], %f14
	.word	0x9506f824	! t1_kref+0x34d8:   	taddcc	%i3, -0x7dc, %o2
	.word	0x9bb2c0ec	! t1_kref+0x34dc:   	edge16ln	%o3, %o4, %o5
	.word	0x9afb4009	! t1_kref+0x34e0:   	sdivcc	%o5, %o1, %o5
	.word	0xaa730009	! t1_kref+0x34e4:   	udiv	%o4, %o1, %l5
	.word	0xac90000c	! t1_kref+0x34e8:   	orcc	%g0, %o4, %l6
	.word	0x89a00540	! t1_kref+0x34ec:   	fsqrtd	%f0, %f4
	.word	0xae382479	! t1_kref+0x34f0:   	xnor	%g0, 0x479, %l7
	.word	0x94324017	! t1_kref+0x34f4:   	orn	%o1, %l7, %o2
	.word	0xafb34077	! t1_kref+0x34f8:   	edge8ln	%o5, %l7, %l7
	.word	0xae0ab88f	! t1_kref+0x34fc:   	and	%o2, -0x771, %l7
	.word	0x9fc00004	! t1_kref+0x3500:   	call	%g0 + %g4
	.word	0xa1a00124	! t1_kref+0x3504:   	fabss	%f4, %f16
	.word	0xd44e001a	! t1_kref+0x3508:   	ldsb	[%i0 + %i2], %o2
	.word	0x20800008	! t1_kref+0x350c:   	bn,a	_kref+0x352c
	.word	0xaafef139	! t1_kref+0x3510:   	sdivcc	%i3, -0xec7, %l5
	.word	0xa83efff9	! t1_kref+0x3514:   	xnor	%i3, -0x7, %l4
	.word	0xaf400000	! t1_kref+0x3518:   	mov	%y, %l7
	.word	0xaafe801a	! t1_kref+0x351c:   	sdivcc	%i2, %i2, %l5
	.word	0xa9280017	! t1_kref+0x3520:   	sll	%g0, %l7, %l4
	.word	0x3e480006	! t1_kref+0x3524:   	bvc,a,pt	%icc, _kref+0x353c
	.word	0xea500018	! t1_kref+0x3528:   	ldsh	[%g0 + %i0], %l5
	.word	0x91b08e4c	! t1_kref+0x352c:   	fxnor	%f2, %f12, %f8
	.word	0x81a489c4	! t1_kref+0x3530:   	fdivd	%f18, %f4, %f0
	.word	0x9fc00004	! t1_kref+0x3534:   	call	%g0 + %g4
	.word	0x89a01927	! t1_kref+0x3538:   	fstod	%f7, %f4
	.word	0x932e800d	! t1_kref+0x353c:   	sll	%i2, %o5, %o1
	.word	0xa1b1898e	! t1_kref+0x3540:   	bshuffle	%f6, %f14, %f16
	.word	0x9323001a	! t1_kref+0x3544:   	mulscc	%o4, %i2, %o1
	.word	0x8fa08932	! t1_kref+0x3548:   	fmuls	%f2, %f18, %f7
	sethi	%hi(2f), %o7
	.word	0xe40be160	! t1_kref+0x3550:   	ldub	[%o7 + 0x160], %l2
	.word	0xa41ca00c	! t1_kref+0x3554:   	xor	%l2, 0xc, %l2
	.word	0xe42be160	! t1_kref+0x3558:   	stb	%l2, [%o7 + 0x160]
	.word	0x81dbe160	! t1_kref+0x355c:   	flush	%o7 + 0x160
2:	.word	0xd9180018	! t1_kref+0x3560:   	ldd	[%g0 + %i0], %f12
	.word	0xadb30200	! t1_kref+0x3564:   	array8	%o4, %g0, %l6
	.word	0x8bb00f22	! t1_kref+0x3568:   	fsrc2s	%f2, %f5
	.word	0xda30a03e	! t1_kref+0x356c:   	sth	%o5, [%g2 + 0x3e]
	.word	0x3b480002	! t1_kref+0x3570:   	fble,a,pt	%fcc0, _kref+0x3578
	.word	0x96aa800a	! t1_kref+0x3574:   	andncc	%o2, %o2, %o3
	.word	0x81a01a2a	! t1_kref+0x3578:   	fstoi	%f10, %f0
	.word	0x9fc10000	! t1_kref+0x357c:   	call	%g4
	.word	0xaf44c000	! t1_kref+0x3580:   	mov	%gsr, %l7
	.word	0xa1a0054e	! t1_kref+0x3584:   	fsqrtd	%f14, %f16
	.word	0xc020a02c	! t1_kref+0x3588:   	clr	[%g2 + 0x2c]
	sethi	%hi(2f), %o7
	.word	0xe40be1b4	! t1_kref+0x3590:   	ldub	[%o7 + 0x1b4], %l2
	.word	0xa41ca00c	! t1_kref+0x3594:   	xor	%l2, 0xc, %l2
	.word	0xe42be1b4	! t1_kref+0x3598:   	stb	%l2, [%o7 + 0x1b4]
	.word	0x81dbe1b4	! t1_kref+0x359c:   	flush	%o7 + 0x1b4
	.word	0x95202ddb	! t1_kref+0x35a0:   	mulscc	%g0, 0xddb, %o2
	.word	0xd628a01f	! t1_kref+0x35a4:   	stb	%o3, [%g2 + 0x1f]
	.word	0x95a00542	! t1_kref+0x35a8:   	fsqrtd	%f2, %f10
	.word	0x95b20dc2	! t1_kref+0x35ac:   	fnand	%f8, %f2, %f10
	.word	0xab400000	! t1_kref+0x35b0:   	mov	%y, %l5
2:	.word	0x9da1482f	! t1_kref+0x35b4:   	fadds	%f5, %f15, %f14
	.word	0xc520001c	! t1_kref+0x35b8:   	st	%f2, [%g0 + %i4]
	.word	0xd6881019	! t1_kref+0x35bc:   	lduba	[%g0 + %i1]0x80, %o3
	.word	0x993b000c	! t1_kref+0x35c0:   	sra	%o4, %o4, %o4
	.word	0xd27e7fe8	! t1_kref+0x35c4:   	swap	[%i1 - 0x18], %o1
	.word	0xd8567ffe	! t1_kref+0x35c8:   	ldsh	[%i1 - 2], %o4
	.word	0xd240a034	! t1_kref+0x35cc:   	ldsw	[%g2 + 0x34], %o1
	.word	0x36480004	! t1_kref+0x35d0:   	bge,a,pt	%icc, _kref+0x35e0
	.word	0x89a0108a	! t1_kref+0x35d4:   	fxtos	%f10, %f4
	.word	0x8fa44921	! t1_kref+0x35d8:   	fmuls	%f17, %f1, %f7
	.word	0x8fb30a67	! t1_kref+0x35dc:   	fpadd32s	%f12, %f7, %f7
	.word	0x9fc00004	! t1_kref+0x35e0:   	call	%g0 + %g4
	.word	0xd026001c	! t1_kref+0x35e4:   	st	%o0, [%i0 + %i4]
	.word	0xda4e7ffd	! t1_kref+0x35e8:   	ldsb	[%i1 - 3], %o5
	.word	0x34800008	! t1_kref+0x35ec:   	bg,a	_kref+0x360c
	.word	0x9a368009	! t1_kref+0x35f0:   	orn	%i2, %o1, %o5
	.word	0x3e480002	! t1_kref+0x35f4:   	bvc,a,pt	%icc, _kref+0x35fc
	.word	0xd84e401a	! t1_kref+0x35f8:   	ldsb	[%i1 + %i2], %o4
	.word	0xabb004ce	! t1_kref+0x35fc:   	fcmpne32	%f0, %f14, %l5
	.word	0x9da01a42	! t1_kref+0x3600:   	fdtoi	%f2, %f14
	.word	0xda0e2015	! t1_kref+0x3604:   	ldub	[%i0 + 0x15], %o5
	.word	0xd040a014	! t1_kref+0x3608:   	ldsw	[%g2 + 0x14], %o0
	.word	0x33480005	! t1_kref+0x360c:   	fbe,a,pt	%fcc0, _kref+0x3620
	.word	0x943eba41	! t1_kref+0x3610:   	xnor	%i2, -0x5bf, %o2
	.word	0xd830a00c	! t1_kref+0x3614:   	sth	%o4, [%g2 + 0xc]
	.word	0x9fc00004	! t1_kref+0x3618:   	call	%g0 + %g4
	.word	0x81a309ca	! t1_kref+0x361c:   	fdivd	%f12, %f10, %f0
	.word	0xda563fe2	! t1_kref+0x3620:   	ldsh	[%i0 - 0x1e], %o5
	.word	0x81df001a	! t1_kref+0x3624:   	flush	%i4 + %i2
	.word	0x943a6ee4	! t1_kref+0x3628:   	xnor	%o1, 0xee4, %o2
	.word	0xd6881018	! t1_kref+0x362c:   	lduba	[%g0 + %i0]0x80, %o3
	.word	0xe11fbde0	! t1_kref+0x3630:   	ldd	[%fp - 0x220], %f16
	.word	0x89b48620	! t1_kref+0x3634:   	fmul8x16	%f18, %f0, %f4
	.word	0x96a6ab41	! t1_kref+0x3638:   	subcc	%i2, 0xb41, %o3
	.word	0x9da00126	! t1_kref+0x363c:   	fabss	%f6, %f14
	.word	0x9db48a67	! t1_kref+0x3640:   	fpadd32s	%f18, %f7, %f14
	.word	0xd62e8019	! t1_kref+0x3644:   	stb	%o3, [%i2 + %i1]
	.word	0xae1b7861	! t1_kref+0x3648:   	xor	%o5, -0x79f, %l7
	.word	0xabb3032a	! t1_kref+0x364c:   	bmask	%o4, %o2, %l5
	.word	0xea000019	! t1_kref+0x3650:   	ld	[%g0 + %i1], %l5
	.word	0xadb2c108	! t1_kref+0x3654:   	edge32	%o3, %o0, %l6
	.word	0x9da01903	! t1_kref+0x3658:   	fitod	%f3, %f14
	.word	0x9fc00004	! t1_kref+0x365c:   	call	%g0 + %g4
	.word	0x90fef360	! t1_kref+0x3660:   	sdivcc	%i3, -0xca0, %o0
	.word	0xea6e3ff2	! t1_kref+0x3664:   	ldstub	[%i0 - 0xe], %l5
	.word	0xea10a024	! t1_kref+0x3668:   	lduh	[%g2 + 0x24], %l5
	.word	0xa9b304c0	! t1_kref+0x366c:   	fcmpne32	%f12, %f0, %l4
	.word	0x20480005	! t1_kref+0x3670:   	bn,a,pt	%icc, _kref+0x3684
	.word	0x93b00100	! t1_kref+0x3674:   	edge32	%g0, %g0, %o1
	.word	0xec3e6008	! t1_kref+0x3678:   	std	%l6, [%i1 + 8]
	.word	0x9672401b	! t1_kref+0x367c:   	udiv	%o1, %i3, %o3
	.word	0x81debebc	! t1_kref+0x3680:   	flush	%i2 - 0x144
	.word	0x949a253e	! t1_kref+0x3684:   	xorcc	%o0, 0x53e, %o2
	.word	0x95a01084	! t1_kref+0x3688:   	fxtos	%f4, %f10
	.word	0xf430a024	! t1_kref+0x368c:   	sth	%i2, [%g2 + 0x24]
	.word	0xee063fe4	! t1_kref+0x3690:   	ld	[%i0 - 0x1c], %l7
	.word	0xacb334c7	! t1_kref+0x3694:   	orncc	%o4, -0xb39, %l6
	.word	0x9882315a	! t1_kref+0x3698:   	addcc	%o0, -0xea6, %o4
	.word	0xa9702d03	! t1_kref+0x369c:   	popc	0xd03, %l4
	.word	0x9fc10000	! t1_kref+0x36a0:   	call	%g4
	.word	0x973ac01b	! t1_kref+0x36a4:   	sra	%o3, %i3, %o3
	.word	0x85a00540	! t1_kref+0x36a8:   	fsqrtd	%f0, %f2
	.word	0xa8f68008	! t1_kref+0x36ac:   	udivcc	%i2, %o0, %l4
	.word	0x9db00ccc	! t1_kref+0x36b0:   	fnot2	%f12, %f14
	.word	0x97a148b0	! t1_kref+0x36b4:   	fsubs	%f5, %f16, %f11
	.word	0x968a632b	! t1_kref+0x36b8:   	andcc	%o1, 0x32b, %o3
	.word	0x95b3048a	! t1_kref+0x36bc:   	fcmple32	%f12, %f10, %o2
	.word	0xf207bfe0	! t1_kref+0x36c0:   	ld	[%fp - 0x20], %i1
	.word	0x99b6c13b	! t1_kref+0x36c4:   	edge32n	%i3, %i3, %o4
	.word	0x30480006	! t1_kref+0x36c8:   	ba,a,pt	%icc, _kref+0x36e0
	.word	0x95b2c0cb	! t1_kref+0x36cc:   	edge16l	%o3, %o3, %o2
	.word	0xae9b000b	! t1_kref+0x36d0:   	xorcc	%o4, %o3, %l7
	.word	0xdd00a004	! t1_kref+0x36d4:   	ld	[%g2 + 4], %f14
	.word	0xd048a024	! t1_kref+0x36d8:   	ldsb	[%g2 + 0x24], %o0
	.word	0xd60e4000	! t1_kref+0x36dc:   	ldub	[%i1], %o3
	.word	0x9722f2ca	! t1_kref+0x36e0:   	mulscc	%o3, -0xd36, %o3
	.word	0x8da1c92a	! t1_kref+0x36e4:   	fmuls	%f7, %f10, %f6
	.word	0xd9267fe0	! t1_kref+0x36e8:   	st	%f12, [%i1 - 0x20]
	.word	0xaefec00d	! t1_kref+0x36ec:   	sdivcc	%i3, %o5, %l7
	.word	0x81b48d60	! t1_kref+0x36f0:   	fnot1s	%f18, %f0
	.word	0xd8ee5000	! t1_kref+0x36f4:   	ldstuba	[%i1]0x80, %o4
	.word	0x932a8008	! t1_kref+0x36f8:   	sll	%o2, %o0, %o1
	.word	0x9da0c930	! t1_kref+0x36fc:   	fmuls	%f3, %f16, %f14
	.word	0xe43e7fe8	! t1_kref+0x3700:   	std	%l2, [%i1 - 0x18]
	.word	0x81a0102e	! t1_kref+0x3704:   	fstox	%f14, %f0
	.word	0x32480001	! t1_kref+0x3708:   	bne,a,pt	%icc, _kref+0x370c
	.word	0xc020a004	! t1_kref+0x370c:   	clr	[%g2 + 4]
	.word	0x99a94048	! t1_kref+0x3710:   	fmovdug	%fcc0, %f8, %f12
	.word	0xd7064000	! t1_kref+0x3714:   	ld	[%i1], %f11
	.word	0x8da10d2c	! t1_kref+0x3718:   	fsmuld	%f4, %f12, %f6
	.word	0x9bb2c0ac	! t1_kref+0x371c:   	edge16n	%o3, %o4, %o5
	.word	0xd808a024	! t1_kref+0x3720:   	ldub	[%g2 + 0x24], %o4
	.word	0x9fa01a46	! t1_kref+0x3724:   	fdtoi	%f6, %f15
	sethi	%hi(2f), %o7
	.word	0xe40be348	! t1_kref+0x372c:   	ldub	[%o7 + 0x348], %l2
	.word	0xa41ca00c	! t1_kref+0x3730:   	xor	%l2, 0xc, %l2
	.word	0xe42be348	! t1_kref+0x3734:   	stb	%l2, [%o7 + 0x348]
	.word	0x81dbe348	! t1_kref+0x3738:   	flush	%o7 + 0x348
	.word	0x9bb00fe0	! t1_kref+0x373c:   	fones	%f13
	.word	0x98ba801a	! t1_kref+0x3740:   	xnorcc	%o2, %i2, %o4
	.word	0x34480008	! t1_kref+0x3744:   	bg,a,pt	%icc, _kref+0x3764
2:	.word	0xdf263ffc	! t1_kref+0x3748:   	st	%f15, [%i0 - 4]
	.word	0x9893708c	! t1_kref+0x374c:   	orcc	%o5, -0xf74, %o4
	.word	0x83a01a22	! t1_kref+0x3750:   	fstoi	%f2, %f1
	.word	0xa3b00f2b	! t1_kref+0x3754:   	fsrc2s	%f11, %f17
	.word	0xd1be5a1c	! t1_kref+0x3758:   	stda	%f8, [%i1 + %i4]0xd0
	.word	0xa1a018c0	! t1_kref+0x375c:   	fdtos	%f0, %f16
	.word	0x8fa00021	! t1_kref+0x3760:   	fmovs	%f1, %f7
	.word	0xa92a801a	! t1_kref+0x3764:   	sll	%o2, %i2, %l4
	.word	0xe84e3fe9	! t1_kref+0x3768:   	ldsb	[%i0 - 0x17], %l4
	.word	0x908df20a	! t1_kref+0x376c:   	andcc	%l7, -0xdf6, %o0
	.word	0xa5b18665	! t1_kref+0x3770:   	fmul8x16au	%f6, %f5, %f18
	.word	0x9bb205c4	! t1_kref+0x3774:   	fcmpeq32	%f8, %f4, %o5
	.word	0x30480003	! t1_kref+0x3778:   	ba,a,pt	%icc, _kref+0x3784
	.word	0xec3f4019	! t1_kref+0x377c:   	std	%l6, [%i5 + %i1]
	.word	0x8bb3cea0	! t1_kref+0x3780:   	fsrc1s	%f15, %f5
	.word	0xc12e401c	! t1_kref+0x3784:   	st	%fsr, [%i1 + %i4]
	.word	0xd850a03c	! t1_kref+0x3788:   	ldsh	[%g2 + 0x3c], %o4
	.word	0x3d480008	! t1_kref+0x378c:   	fbule,a,pt	%fcc0, _kref+0x37ac
	.word	0x99a0192c	! t1_kref+0x3790:   	fstod	%f12, %f12
	.word	0xda562008	! t1_kref+0x3794:   	ldsh	[%i0 + 8], %o5
	.word	0xaa2025e0	! t1_kref+0x3798:   	sub	%g0, 0x5e0, %l5
	.word	0x89a0084e	! t1_kref+0x379c:   	faddd	%f0, %f14, %f4
	.word	0x90bec008	! t1_kref+0x37a0:   	xnorcc	%i3, %o0, %o0
	.word	0x9b22400b	! t1_kref+0x37a4:   	mulscc	%o1, %o3, %o5
	.word	0x922b0008	! t1_kref+0x37a8:   	andn	%o4, %o0, %o1
	.word	0x97b30280	! t1_kref+0x37ac:   	array32	%o4, %g0, %o3
	.word	0xda40a02c	! t1_kref+0x37b0:   	ldsw	[%g2 + 0x2c], %o5
	.word	0xd830a03e	! t1_kref+0x37b4:   	sth	%o4, [%g2 + 0x3e]
	sethi	%hi(2f), %o7
	.word	0xe40be3d0	! t1_kref+0x37bc:   	ldub	[%o7 + 0x3d0], %l2
	.word	0xa41ca00c	! t1_kref+0x37c0:   	xor	%l2, 0xc, %l2
	.word	0xe42be3d0	! t1_kref+0x37c4:   	stb	%l2, [%o7 + 0x3d0]
	.word	0x81dbe3d0	! t1_kref+0x37c8:   	flush	%o7 + 0x3d0
	.word	0x903039ee	! t1_kref+0x37cc:   	orn	%g0, -0x612, %o0
2:	.word	0xa5a10942	! t1_kref+0x37d0:   	fmuld	%f4, %f2, %f18
	.word	0xc807bfe8	! t1_kref+0x37d4:   	ld	[%fp - 0x18], %g4
	.word	0x92ae800a	! t1_kref+0x37d8:   	andncc	%i2, %o2, %o1
	.word	0xad28201c	! t1_kref+0x37dc:   	sll	%g0, 0x1c, %l6
	.word	0x31480001	! t1_kref+0x37e0:   	fba,a,pt	%fcc0, _kref+0x37e4
	.word	0x9bb20510	! t1_kref+0x37e4:   	fcmpgt16	%f8, %f16, %o5
	.word	0x928eb1b0	! t1_kref+0x37e8:   	andcc	%i2, -0xe50, %o1
	.word	0xc807bff0	! t1_kref+0x37ec:   	ld	[%fp - 0x10], %g4
	.word	0x9de3bfa0	! t1_kref+0x37f0:   	save	%sp, -0x60, %sp
	.word	0xb8673c39	! t1_kref+0x37f4:   	subc	%i4, -0x3c7, %i4
	.word	0x99ee3eb7	! t1_kref+0x37f8:   	restore	%i0, -0x149, %o4
	.word	0x98e2800d	! t1_kref+0x37fc:   	subccc	%o2, %o5, %o4
	.word	0xda366002	! t1_kref+0x3800:   	sth	%o5, [%i1 + 2]
	.word	0xd4562008	! t1_kref+0x3804:   	ldsh	[%i0 + 8], %o2
	.word	0xac12e707	! t1_kref+0x3808:   	or	%o3, 0x707, %l6
	.word	0xd04e8019	! t1_kref+0x380c:   	ldsb	[%i2 + %i1], %o0
	.word	0x91b6c35a	! t1_kref+0x3810:   	alignaddrl	%i3, %i2, %o0
	.word	0xa3a00123	! t1_kref+0x3814:   	fabss	%f3, %f17
	.word	0xd13e2018	! t1_kref+0x3818:   	std	%f8, [%i0 + 0x18]
	.word	0x8da01902	! t1_kref+0x381c:   	fitod	%f2, %f6
	.word	0x91a01909	! t1_kref+0x3820:   	fitod	%f9, %f8
	.word	0x90323348	! t1_kref+0x3824:   	orn	%o0, -0xcb8, %o0
	.word	0x9de3bfa0	! t1_kref+0x3828:   	save	%sp, -0x60, %sp
	.word	0x97eeaeab	! t1_kref+0x382c:   	restore	%i2, 0xeab, %o3
	.word	0x81dc0010	! t1_kref+0x3830:   	flush	%l0 + %l0
	.word	0xac3e800a	! t1_kref+0x3834:   	xnor	%i2, %o2, %l6
	.word	0xa83eee18	! t1_kref+0x3838:   	xnor	%i3, 0xe18, %l4
	.word	0xd3267fe4	! t1_kref+0x383c:   	st	%f9, [%i1 - 0x1c]
	.word	0x9a42800b	! t1_kref+0x3840:   	addc	%o2, %o3, %o5
	.word	0x9a9b28dc	! t1_kref+0x3844:   	xorcc	%o4, 0x8dc, %o5
	.word	0x96fb7d36	! t1_kref+0x3848:   	sdivcc	%o5, -0x2ca, %o3
	.word	0x91a01911	! t1_kref+0x384c:   	fitod	%f17, %f8
	.word	0x9203400a	! t1_kref+0x3850:   	add	%o5, %o2, %o1
	.word	0xf6364000	! t1_kref+0x3854:   	sth	%i3, [%i1]
	.word	0x9723401b	! t1_kref+0x3858:   	mulscc	%o5, %i3, %o3
	.word	0xaeda801b	! t1_kref+0x385c:   	smulcc	%o2, %i3, %l7
	.word	0x90336778	! t1_kref+0x3860:   	orn	%o5, 0x778, %o0
	.word	0x8586bb1d	! t1_kref+0x3864:   	wr	%i2, 0xfffffb1d, %ccr
	.word	0xd620a014	! t1_kref+0x3868:   	st	%o3, [%g2 + 0x14]
	.word	0x9dab0030	! t1_kref+0x386c:   	fmovsuge	%fcc0, %f16, %f14
	.word	0xdafe101c	! t1_kref+0x3870:   	swapa	[%i0 + %i4]0x80, %o5
	.word	0x95a30842	! t1_kref+0x3874:   	faddd	%f12, %f2, %f10
	.word	0xe8066018	! t1_kref+0x3878:   	ld	[%i1 + 0x18], %l4
	.word	0xe808a037	! t1_kref+0x387c:   	ldub	[%g2 + 0x37], %l4
	.word	0x99a01a31	! t1_kref+0x3880:   	fstoi	%f17, %f12
	.word	0x9bb000ca	! t1_kref+0x3884:   	edge16l	%g0, %o2, %o5
	.word	0xae7a76b3	! t1_kref+0x3888:   	sdiv	%o1, -0x94d, %l7
	.word	0xa8fb4017	! t1_kref+0x388c:   	sdivcc	%o5, %l7, %l4
	.word	0xa5b00f28	! t1_kref+0x3890:   	fsrc2s	%f8, %f18
	.word	0x27480007	! t1_kref+0x3894:   	fbul,a,pt	%fcc0, _kref+0x38b0
	.word	0x90230017	! t1_kref+0x3898:   	sub	%o4, %l7, %o0
	.word	0x9312c00a	! t1_kref+0x389c:   	taddcctv	%o3, %o2, %o1
	.word	0xda50a034	! t1_kref+0x38a0:   	ldsh	[%g2 + 0x34], %o5
	.word	0x81580000	! t1_kref+0x38a4:   	flushw
	.word	0x932ae00b	! t1_kref+0x38a8:   	sll	%o3, 0xb, %o1
	.word	0xaa32fa63	! t1_kref+0x38ac:   	orn	%o3, -0x59d, %l5
	.word	0xc0680018	! t1_kref+0x38b0:   	ldstub	[%g0 + %i0], %g0
	.word	0xe320a03c	! t1_kref+0x38b4:   	st	%f17, [%g2 + 0x3c]
	.word	0xe43f4018	! t1_kref+0x38b8:   	std	%l2, [%i5 + %i0]
	.word	0x95a01904	! t1_kref+0x38bc:   	fitod	%f4, %f10
	.word	0x8da00028	! t1_kref+0x38c0:   	fmovs	%f8, %f6
	.word	0xd6070018	! t1_kref+0x38c4:   	ld	[%i4 + %i0], %o3
	.word	0x993a800c	! t1_kref+0x38c8:   	sra	%o2, %o4, %o4
	.word	0x91a0110a	! t1_kref+0x38cc:   	fxtod	%f10, %f8
	.word	0x942b77e4	! t1_kref+0x38d0:   	andn	%o5, -0x81c, %o2
	.word	0x95a289d0	! t1_kref+0x38d4:   	fdivd	%f10, %f16, %f10
	.word	0x81dfc010	! t1_kref+0x38d8:   	flush	%i7 + %l0
	.word	0x89a1cd2e	! t1_kref+0x38dc:   	fsmuld	%f7, %f14, %f4
	.word	0xf6b6501b	! t1_kref+0x38e0:   	stha	%i3, [%i1 + %i3]0x80
	.word	0xa93ee016	! t1_kref+0x38e4:   	sra	%i3, 0x16, %l4
	.word	0x949838c5	! t1_kref+0x38e8:   	xorcc	%g0, -0x73b, %o2
	.word	0xd076001d	! t1_kref+0x38ec:   	stx	%o0, [%i0 + %i5]
	.word	0x81a18d29	! t1_kref+0x38f0:   	fsmuld	%f6, %f9, %f0
	.word	0x31480001	! t1_kref+0x38f4:   	fba,a,pt	%fcc0, _kref+0x38f8
	.word	0x924226fc	! t1_kref+0x38f8:   	addc	%o0, 0x6fc, %o1
	.word	0x2b0587de	! t1_kref+0x38fc:   	sethi	%hi(0x161f7800), %l5
	.word	0xab3e801b	! t1_kref+0x3900:   	sra	%i2, %i3, %l5
	.word	0x99b34280	! t1_kref+0x3904:   	array32	%o5, %g0, %o4
	.word	0xaf400000	! t1_kref+0x3908:   	mov	%y, %l7
	.word	0x9812c00d	! t1_kref+0x390c:   	or	%o3, %o5, %o4
	.word	0x99400000	! t1_kref+0x3910:   	mov	%y, %o4
	.word	0xd04e8019	! t1_kref+0x3914:   	ldsb	[%i2 + %i1], %o0
	.word	0x85b1c96e	! t1_kref+0x3918:   	fpmerge	%f7, %f14, %f2
	.word	0xe520a02c	! t1_kref+0x391c:   	st	%f18, [%g2 + 0x2c]
	.word	0xf630a01e	! t1_kref+0x3920:   	sth	%i3, [%g2 + 0x1e]
	.word	0x91b1cea0	! t1_kref+0x3924:   	fsrc1s	%f7, %f8
	.word	0xea48a01f	! t1_kref+0x3928:   	ldsb	[%g2 + 0x1f], %l5
	call	SYM(t1_subr2)
	.word	0x91b08c62	! t1_kref+0x3930:   	fnors	%f2, %f2, %f8
	.word	0x8bb00ef1	! t1_kref+0x3934:   	fornot2s	%f0, %f17, %f5
	.word	0x81dd4001	! t1_kref+0x3938:   	flush	%l5 + %g1
	.word	0xdf200018	! t1_kref+0x393c:   	st	%f15, [%g0 + %i0]
	.word	0x81db8018	! t1_kref+0x3940:   	flush	%sp + %i0
	.word	0x99b1098e	! t1_kref+0x3944:   	bshuffle	%f4, %f14, %f12
	.word	0xf428a02c	! t1_kref+0x3948:   	stb	%i2, [%g2 + 0x2c]
	.word	0xac78000a	! t1_kref+0x394c:   	sdiv	%g0, %o2, %l6
	.word	0xf4b6d018	! t1_kref+0x3950:   	stha	%i2, [%i3 + %i0]0x80
	.word	0xe100a014	! t1_kref+0x3954:   	ld	[%g2 + 0x14], %f16
	.word	0xac75c00a	! t1_kref+0x3958:   	udiv	%l7, %o2, %l6
	.word	0x967a6c85	! t1_kref+0x395c:   	sdiv	%o1, 0xc85, %o3
	.word	0x96fec00c	! t1_kref+0x3960:   	sdivcc	%i3, %o4, %o3
	.word	0xee4e8019	! t1_kref+0x3964:   	ldsb	[%i2 + %i1], %l7
	.word	0x95a10d23	! t1_kref+0x3968:   	fsmuld	%f4, %f3, %f10
	.word	0xab26ad87	! t1_kref+0x396c:   	mulscc	%i2, 0xd87, %l5
	.word	0xc91fbc40	! t1_kref+0x3970:   	ldd	[%fp - 0x3c0], %f4
	.word	0x98e5f183	! t1_kref+0x3974:   	subccc	%l7, -0xe7d, %o4
	.word	0xaf3a400d	! t1_kref+0x3978:   	sra	%o1, %o5, %l7
	.word	0x99a018c8	! t1_kref+0x397c:   	fdtos	%f8, %f12
	.word	0x2b0888ea	! t1_kref+0x3980:   	sethi	%hi(0x2223a800), %l5
	.word	0x945b401b	! t1_kref+0x3984:   	smul	%o5, %i3, %o2
	.word	0x38800003	! t1_kref+0x3988:   	bgu,a	_kref+0x3994
	.word	0xc300a014	! t1_kref+0x398c:   	ld	[%g2 + 0x14], %f1
	.word	0xec4e600f	! t1_kref+0x3990:   	ldsb	[%i1 + 0xf], %l6
	.word	0x89b00760	! t1_kref+0x3994:   	fpack16	%f0, %f4
	.word	0x8da0192c	! t1_kref+0x3998:   	fstod	%f12, %f6
	.word	0x24480001	! t1_kref+0x399c:   	ble,a,pt	%icc, _kref+0x39a0
	.word	0xaaf2001b	! t1_kref+0x39a0:   	udivcc	%o0, %i3, %l5
	.word	0xf007bfe0	! t1_kref+0x39a4:   	ld	[%fp - 0x20], %i0
	.word	0x98432133	! t1_kref+0x39a8:   	addc	%o4, 0x133, %o4
	.word	0x9afeb766	! t1_kref+0x39ac:   	sdivcc	%i2, -0x89a, %o5
	.word	0x85a288d2	! t1_kref+0x39b0:   	fsubd	%f10, %f18, %f2
	.word	0x911eb3a8	! t1_kref+0x39b4:   	tsubcctv	%i2, -0xc58, %o0
	.word	0xae0ef48f	! t1_kref+0x39b8:   	and	%i3, -0xb71, %l7
	.word	0xd5063ff4	! t1_kref+0x39bc:   	ld	[%i0 - 0xc], %f10
	.word	0xc028a03f	! t1_kref+0x39c0:   	clrb	[%g2 + 0x3f]
	.word	0xa8fdc01a	! t1_kref+0x39c4:   	sdivcc	%l7, %i2, %l4
	.word	0x9a0ac00a	! t1_kref+0x39c8:   	and	%o3, %o2, %o5
	.word	0x9ba3082d	! t1_kref+0x39cc:   	fadds	%f12, %f13, %f13
	.word	0x94fb401a	! t1_kref+0x39d0:   	sdivcc	%o5, %i2, %o2
	.word	0x81580000	! t1_kref+0x39d4:   	flushw
	.word	0x9092aa9f	! t1_kref+0x39d8:   	orcc	%o2, 0xa9f, %o0
	.word	0xe46e8018	! t1_kref+0x39dc:   	ldstub	[%i2 + %i0], %l2
	.word	0xc030a03c	! t1_kref+0x39e0:   	clrh	[%g2 + 0x3c]
	.word	0xa8f3400c	! t1_kref+0x39e4:   	udivcc	%o5, %o4, %l4
	.word	0x96268008	! t1_kref+0x39e8:   	sub	%i2, %o0, %o3
	.word	0x9de3bfa0	! t1_kref+0x39ec:   	save	%sp, -0x60, %sp
	.word	0xb856c01b	! t1_kref+0x39f0:   	umul	%i3, %i3, %i4
	.word	0x9bef001d	! t1_kref+0x39f4:   	restore	%i4, %i5, %o5
	.word	0xa1a01a22	! t1_kref+0x39f8:   	fstoi	%f2, %f16
	.word	0x8db1cc63	! t1_kref+0x39fc:   	fnors	%f7, %f3, %f6
	.word	0xd836600a	! t1_kref+0x3a00:   	sth	%o4, [%i1 + 0xa]
	.word	0xe56e6000	! t1_kref+0x3a04:   	prefetch	%i1, 18
	.word	0x86102001	! t1_kref+0x3a08:   	mov	0x1, %g3
	.word	0x32800000	! t1_kref+0x3a0c:   	bne,a	_kref+0x3a0c
	.word	0x86a0e001	! t1_kref+0x3a10:   	subcc	%g3, 1, %g3
	.word	0x8db3cc70	! t1_kref+0x3a14:   	fnors	%f15, %f16, %f6
	.word	0xab67279c	! t1_kref+0x3a18:   	movgu	%icc, -0x64, %l5
	.word	0xa5a40d31	! t1_kref+0x3a1c:   	fsmuld	%f16, %f17, %f18
	.word	0xa8f33857	! t1_kref+0x3a20:   	udivcc	%o4, -0x7a9, %l4
	.word	0xa926c009	! t1_kref+0x3a24:   	mulscc	%i3, %o1, %l4
	.word	0x97033560	! t1_kref+0x3a28:   	taddcc	%o4, -0xaa0, %o3
	.word	0xe4ee1000	! t1_kref+0x3a2c:   	ldstuba	[%i0]0x80, %l2
	.word	0x9fc00004	! t1_kref+0x3a30:   	call	%g0 + %g4
	.word	0xc1be5000	! t1_kref+0x3a34:   	stda	%f0, [%i1]0x80
	.word	0xc1196958	! t1_kref+0x3a38:   	ldd	[%g5 + 0x958], %f0
	.word	0x93400000	! t1_kref+0x3a3c:   	mov	%y, %o1
	.word	0x9885ffa9	! t1_kref+0x3a40:   	addcc	%l7, -0x57, %o4
	.word	0xd4680018	! t1_kref+0x3a44:   	ldstub	[%g0 + %i0], %o2
	.word	0xdd063fec	! t1_kref+0x3a48:   	ld	[%i0 - 0x14], %f14
	.word	0x91400000	! t1_kref+0x3a4c:   	mov	%y, %o0
	.word	0xe1be1a5d	! t1_kref+0x3a50:   	stda	%f16, [%i0 + %i5]0xd2
	.word	0x9daa8025	! t1_kref+0x3a54:   	fmovsue	%fcc0, %f5, %f14
	.word	0xee064000	! t1_kref+0x3a58:   	ld	[%i1], %l7
	.word	0xd6263ffc	! t1_kref+0x3a5c:   	st	%o3, [%i0 - 4]
	.word	0xe41e2008	! t1_kref+0x3a60:   	ldd	[%i0 + 8], %l2
	.word	0x8da48931	! t1_kref+0x3a64:   	fmuls	%f18, %f17, %f6
	.word	0xd7e6100c	! t1_kref+0x3a68:   	casa	[%i0]0x80, %o4, %o3
	.word	0x91a00552	! t1_kref+0x3a6c:   	fsqrtd	%f18, %f8
	.word	0xa8300017	! t1_kref+0x3a70:   	orn	%g0, %l7, %l4
	.word	0xa9418000	! t1_kref+0x3a74:   	mov	%fprs, %l4
	.word	0xfb6e001c	! t1_kref+0x3a78:   	prefetch	%i0 + %i4, 29
	.word	0x988aa18f	! t1_kref+0x3a7c:   	andcc	%o2, 0x18f, %o4
	.word	0xabb5c12c	! t1_kref+0x3a80:   	edge32n	%l7, %o4, %l5
	.word	0x96ba800a	! t1_kref+0x3a84:   	xnorcc	%o2, %o2, %o3
	.word	0x83b44ca8	! t1_kref+0x3a88:   	fandnot2s	%f17, %f8, %f1
	.word	0x89a48d2e	! t1_kref+0x3a8c:   	fsmuld	%f18, %f14, %f4
	.word	0x973b400b	! t1_kref+0x3a90:   	sra	%o5, %o3, %o3
	.word	0xda28a03f	! t1_kref+0x3a94:   	stb	%o5, [%g2 + 0x3f]
	sethi	%hi(2f), %o7
	.word	0xe40be2d4	! t1_kref+0x3a9c:   	ldub	[%o7 + 0x2d4], %l2
	.word	0xa41ca00c	! t1_kref+0x3aa0:   	xor	%l2, 0xc, %l2
	.word	0xe42be2d4	! t1_kref+0x3aa4:   	stb	%l2, [%o7 + 0x2d4]
	.word	0x81dbe2d4	! t1_kref+0x3aa8:   	flush	%o7 + 0x2d4
	.word	0x92637fd8	! t1_kref+0x3aac:   	subc	%o5, -0x28, %o1
	.word	0xd220a02c	! t1_kref+0x3ab0:   	st	%o1, [%g2 + 0x2c]
	.word	0x9085e804	! t1_kref+0x3ab4:   	addcc	%l7, 0x804, %o0
	.word	0x30480004	! t1_kref+0x3ab8:   	ba,a,pt	%icc, _kref+0x3ac8
	.word	0xd64e0000	! t1_kref+0x3abc:   	ldsb	[%i0], %o3
	.word	0x95b48ad2	! t1_kref+0x3ac0:   	fpsub32	%f18, %f18, %f10
	.word	0xee20a004	! t1_kref+0x3ac4:   	st	%l7, [%g2 + 4]
	.word	0xaa1abf3d	! t1_kref+0x3ac8:   	xor	%o2, -0xc3, %l5
	.word	0x8db40980	! t1_kref+0x3acc:   	bshuffle	%f16, %f0, %f6
	.word	0x97b28c6c	! t1_kref+0x3ad0:   	fnors	%f10, %f12, %f11
2:	.word	0xd256401b	! t1_kref+0x3ad4:   	ldsh	[%i1 + %i3], %o1
	.word	0xadb6c280	! t1_kref+0x3ad8:   	array32	%i3, %g0, %l6
	.word	0x92ab727f	! t1_kref+0x3adc:   	andncc	%o5, -0xd81, %o1
	.word	0xae82edf3	! t1_kref+0x3ae0:   	addcc	%o3, 0xdf3, %l7
	.word	0xab400000	! t1_kref+0x3ae4:   	mov	%y, %l5
	.word	0x99a9c028	! t1_kref+0x3ae8:   	fmovsu	%fcc0, %f8, %f12
	.word	0xafb40406	! t1_kref+0x3aec:   	fcmple16	%f16, %f6, %l7
	.word	0xd04e8019	! t1_kref+0x3af0:   	ldsb	[%i2 + %i1], %o0
	.word	0xe43e7ff8	! t1_kref+0x3af4:   	std	%l2, [%i1 - 8]
	.word	0xa920308f	! t1_kref+0x3af8:   	mulscc	%g0, -0xf71, %l4
	.word	0x85b40d40	! t1_kref+0x3afc:   	fnot1	%f16, %f2
	.word	0x81b00c20	! t1_kref+0x3b00:   	fzeros	%f0
	.word	0xe320a01c	! t1_kref+0x3b04:   	st	%f17, [%g2 + 0x1c]
	.word	0xd53f4019	! t1_kref+0x3b08:   	std	%f10, [%i5 + %i1]
	sethi	%hi(2f), %o7
	.word	0xe40be330	! t1_kref+0x3b10:   	ldub	[%o7 + 0x330], %l2
	.word	0xa41ca00c	! t1_kref+0x3b14:   	xor	%l2, 0xc, %l2
	.word	0xe42be330	! t1_kref+0x3b18:   	stb	%l2, [%o7 + 0x330]
	.word	0x81dbe330	! t1_kref+0x3b1c:   	flush	%o7 + 0x330
	.word	0x94ba6dce	! t1_kref+0x3b20:   	xnorcc	%o1, 0xdce, %o2
	.word	0x9b3a4008	! t1_kref+0x3b24:   	sra	%o1, %o0, %o5
	.word	0x9526af77	! t1_kref+0x3b28:   	mulscc	%i2, 0xf77, %o2
	.word	0xec3e401d	! t1_kref+0x3b2c:   	std	%l6, [%i1 + %i5]
2:	.word	0x9db30ec8	! t1_kref+0x3b30:   	fornot2	%f12, %f8, %f14
	.word	0x3f480006	! t1_kref+0x3b34:   	fbo,a,pt	%fcc0, _kref+0x3b4c
	.word	0x9432c017	! t1_kref+0x3b38:   	orn	%o3, %l7, %o2
	.word	0x8db40ece	! t1_kref+0x3b3c:   	fornot2	%f16, %f14, %f6
	.word	0xf628a025	! t1_kref+0x3b40:   	stb	%i3, [%g2 + 0x25]
	.word	0xe26e2010	! t1_kref+0x3b44:   	ldstub	[%i0 + 0x10], %l1
	.word	0x8143c000	! t1_kref+0x3b48:   	stbar
	.word	0x33480001	! t1_kref+0x3b4c:   	fbe,a,pt	%fcc0, _kref+0x3b50
	.word	0xda8e101a	! t1_kref+0x3b50:   	lduba	[%i0 + %i2]0x80, %o5
	.word	0x9a328017	! t1_kref+0x3b54:   	orn	%o2, %l7, %o5
	.word	0xab2dc00b	! t1_kref+0x3b58:   	sll	%l7, %o3, %l5
	.word	0x33480004	! t1_kref+0x3b5c:   	fbe,a,pt	%fcc0, _kref+0x3b6c
	.word	0xac2227cd	! t1_kref+0x3b60:   	sub	%o0, 0x7cd, %l6
	.word	0x81a18d29	! t1_kref+0x3b64:   	fsmuld	%f6, %f9, %f0
	.word	0xae5ac017	! t1_kref+0x3b68:   	smul	%o3, %l7, %l7
	.word	0x9da0190f	! t1_kref+0x3b6c:   	fitod	%f15, %f14
	.word	0xa892800d	! t1_kref+0x3b70:   	orcc	%o2, %o5, %l4
	.word	0x89a000a4	! t1_kref+0x3b74:   	fnegs	%f4, %f4
	.word	0xd030a014	! t1_kref+0x3b78:   	sth	%o0, [%g2 + 0x14]
	.word	0xaeaa400d	! t1_kref+0x3b7c:   	andncc	%o1, %o5, %l7
	.word	0x967ee4a2	! t1_kref+0x3b80:   	sdiv	%i3, 0x4a2, %o3
	.word	0xacaa679e	! t1_kref+0x3b84:   	andncc	%o1, 0x79e, %l6
	.word	0xaa86eb42	! t1_kref+0x3b88:   	addcc	%i3, 0xb42, %l5
	.word	0x29284764	! t1_kref+0x3b8c:   	sethi	%hi(0xa11d9000), %l4
	.word	0x9fc10000	! t1_kref+0x3b90:   	call	%g4
	.word	0x921a800d	! t1_kref+0x3b94:   	xor	%o2, %o5, %o1
	.word	0xaeb5ecba	! t1_kref+0x3b98:   	orncc	%l7, 0xcba, %l7
	.word	0xc02e8019	! t1_kref+0x3b9c:   	clrb	[%i2 + %i1]
	.word	0x952b6018	! t1_kref+0x3ba0:   	sll	%o5, 0x18, %o2
	.word	0x94e20008	! t1_kref+0x3ba4:   	subccc	%o0, %o0, %o2
	.word	0x86102021	! t1_kref+0x3ba8:   	mov	0x21, %g3
	.word	0x86a0e001	! t1_kref+0x3bac:   	subcc	%g3, 1, %g3
	.word	0x22800016	! t1_kref+0x3bb0:   	be,a	_kref+0x3c08
	.word	0x8da01904	! t1_kref+0x3bb4:   	fitod	%f4, %f6
	.word	0xd808a03d	! t1_kref+0x3bb8:   	ldub	[%g2 + 0x3d], %o4
	.word	0x9da00546	! t1_kref+0x3bbc:   	fsqrtd	%f6, %f14
	.word	0x94bab686	! t1_kref+0x3bc0:   	xnorcc	%o2, -0x97a, %o2
	.word	0x8da84044	! t1_kref+0x3bc4:   	fmovdne	%fcc0, %f4, %f6
	.word	0x8185c000	! t1_kref+0x3bc8:   	wr	%l7, %g0, %y
	.word	0xac02800d	! t1_kref+0x3bcc:   	add	%o2, %o5, %l6
	.word	0xa5b00f00	! t1_kref+0x3bd0:   	fsrc2	%f0, %f18
	.word	0xc700a014	! t1_kref+0x3bd4:   	ld	[%g2 + 0x14], %f3
	.word	0x81df7cb5	! t1_kref+0x3bd8:   	flush	%i5 - 0x34b
	.word	0xf4260000	! t1_kref+0x3bdc:   	st	%i2, [%i0]
	.word	0xc807bff0	! t1_kref+0x3be0:   	ld	[%fp - 0x10], %g4
	.word	0x2f17c845	! t1_kref+0x3be4:   	sethi	%hi(0x5f211400), %l7
	.word	0x9fa389a1	! t1_kref+0x3be8:   	fdivs	%f14, %f1, %f15
	.word	0xaa82241f	! t1_kref+0x3bec:   	addcc	%o0, 0x41f, %l5
	.word	0xda363fe2	! t1_kref+0x3bf0:   	sth	%o5, [%i0 - 0x1e]
	.word	0xc706201c	! t1_kref+0x3bf4:   	ld	[%i0 + 0x1c], %f3
	.word	0x95418000	! t1_kref+0x3bf8:   	mov	%fprs, %o2
	.word	0xec981019	! t1_kref+0x3bfc:   	ldda	[%g0 + %i1]0x80, %l6
	.word	0x92fa7162	! t1_kref+0x3c00:   	sdivcc	%o1, -0xe9e, %o1
	.word	0x33480008	! t1_kref+0x3c04:   	fbe,a,pt	%fcc0, _kref+0x3c24
	.word	0x99b18e4e	! t1_kref+0x3c08:   	fxnor	%f6, %f14, %f12
	.word	0x9db3462c	! t1_kref+0x3c0c:   	fmul8x16	%f13, %f12, %f14
	.word	0x8fa408b2	! t1_kref+0x3c10:   	fsubs	%f16, %f18, %f7
	.word	0x81a01a24	! t1_kref+0x3c14:   	fstoi	%f4, %f0
	.word	0x89a34929	! t1_kref+0x3c18:   	fmuls	%f13, %f9, %f4
	.word	0x8db00cce	! t1_kref+0x3c1c:   	fnot2	%f14, %f6
	.word	0xae0b7e71	! t1_kref+0x3c20:   	and	%o5, -0x18f, %l7
	.word	0xd248a03f	! t1_kref+0x3c24:   	ldsb	[%g2 + 0x3f], %o1
	.word	0x87b00ce9	! t1_kref+0x3c28:   	fnot2s	%f9, %f3
	.word	0xd60e3ff0	! t1_kref+0x3c2c:   	ldub	[%i0 - 0x10], %o3
	.word	0x8ba00121	! t1_kref+0x3c30:   	fabss	%f1, %f5
	.word	0x99b10750	! t1_kref+0x3c34:   	fpack32	%f4, %f16, %f12
	.word	0x9da01a28	! t1_kref+0x3c38:   	fstoi	%f8, %f14
	.word	0xaee2ea19	! t1_kref+0x3c3c:   	subccc	%o3, 0xa19, %l7
	.word	0x170ae690	! t1_kref+0x3c40:   	sethi	%hi(0x2b9a4000), %o3
	.word	0x987b000a	! t1_kref+0x3c44:   	sdiv	%o4, %o2, %o4
	.word	0x9db30906	! t1_kref+0x3c48:   	faligndata	%f12, %f6, %f14
	.word	0xaa32ae8c	! t1_kref+0x3c4c:   	orn	%o2, 0xe8c, %l5
	.word	0x89a109c8	! t1_kref+0x3c50:   	fdivd	%f4, %f8, %f4
	.word	0x93b24200	! t1_kref+0x3c54:   	array8	%o1, %g0, %o1
	.word	0x2d480008	! t1_kref+0x3c58:   	fbg,a,pt	%fcc0, _kref+0x3c78
	.word	0xc13e2008	! t1_kref+0x3c5c:   	std	%f0, [%i0 + 8]
	.word	0xec50a024	! t1_kref+0x3c60:   	ldsh	[%g2 + 0x24], %l6
	.word	0x81a0190c	! t1_kref+0x3c64:   	fitod	%f12, %f0
	.word	0x91a008cc	! t1_kref+0x3c68:   	fsubd	%f0, %f12, %f8
	.word	0x9bb185c6	! t1_kref+0x3c6c:   	fcmpeq32	%f6, %f6, %o5
	.word	0xd20e200c	! t1_kref+0x3c70:   	ldub	[%i0 + 0xc], %o1
	.word	0x99b2898e	! t1_kref+0x3c74:   	bshuffle	%f10, %f14, %f12
	.word	0xa5b0066d	! t1_kref+0x3c78:   	fmul8x16au	%f0, %f13, %f18
	.word	0x9bb105d0	! t1_kref+0x3c7c:   	fcmpeq32	%f4, %f16, %o5
	.word	0xd11fbd70	! t1_kref+0x3c80:   	ldd	[%fp - 0x290], %f8
	.word	0x85b20750	! t1_kref+0x3c84:   	fpack32	%f8, %f16, %f2
	.word	0x99a01911	! t1_kref+0x3c88:   	fitod	%f17, %f12
	.word	0x2f3b4307	! t1_kref+0x3c8c:   	sethi	%hi(0xed0c1c00), %l7
	.word	0xda367fe8	! t1_kref+0x3c90:   	sth	%o5, [%i1 - 0x18]
	.word	0x89a009ce	! t1_kref+0x3c94:   	fdivd	%f0, %f14, %f4
	.word	0xe4380019	! t1_kref+0x3c98:   	std	%l2, [%g0 + %i1]
	.word	0xd6066004	! t1_kref+0x3c9c:   	ld	[%i1 + 4], %o3
	.word	0x913a4017	! t1_kref+0x3ca0:   	sra	%o1, %l7, %o0
	.word	0xd920a02c	! t1_kref+0x3ca4:   	st	%f12, [%g2 + 0x2c]
	.word	0x9610001b	! t1_kref+0x3ca8:   	mov	%i3, %o3
	.word	0xa922c009	! t1_kref+0x3cac:   	mulscc	%o3, %o1, %l4
	.word	0x3d480004	! t1_kref+0x3cb0:   	fbule,a,pt	%fcc0, _kref+0x3cc0
	.word	0x8143c000	! t1_kref+0x3cb4:   	stbar
	.word	0x8143c000	! t1_kref+0x3cb8:   	stbar
	.word	0x95b30280	! t1_kref+0x3cbc:   	array32	%o4, %g0, %o2
	.word	0xa8768000	! t1_kref+0x3cc0:   	udiv	%i2, %g0, %l4
	.word	0x9fc10000	! t1_kref+0x3cc4:   	call	%g4
	.word	0xdaee9019	! t1_kref+0x3cc8:   	ldstuba	[%i2 + %i1]0x80, %o5
	.word	0x3b480005	! t1_kref+0x3ccc:   	fble,a,pt	%fcc0, _kref+0x3ce0
	.word	0x9482f86f	! t1_kref+0x3cd0:   	addcc	%o3, -0x791, %o2
	.word	0x81834000	! t1_kref+0x3cd4:   	wr	%o5, %g0, %y
	.word	0xdd263ff4	! t1_kref+0x3cd8:   	st	%f14, [%i0 - 0xc]
	.word	0xac2ee6d7	! t1_kref+0x3cdc:   	andn	%i3, 0x6d7, %l6
	.word	0x96fe801a	! t1_kref+0x3ce0:   	sdivcc	%i2, %i2, %o3
	.word	0xd7200019	! t1_kref+0x3ce4:   	st	%f11, [%g0 + %i1]
	.word	0xe89e101d	! t1_kref+0x3ce8:   	ldda	[%i0 + %i5]0x80, %l4
	.word	0x85a01090	! t1_kref+0x3cec:   	fxtos	%f16, %f2
	.word	0x35480003	! t1_kref+0x3cf0:   	fbue,a,pt	%fcc0, _kref+0x3cfc
	.word	0x91b3c711	! t1_kref+0x3cf4:   	fmuld8sux16	%f15, %f17, %f8
	.word	0x8fa309a4	! t1_kref+0x3cf8:   	fdivs	%f12, %f4, %f7
	.word	0xe86e6017	! t1_kref+0x3cfc:   	ldstub	[%i1 + 0x17], %l4
	.word	0xacaec00b	! t1_kref+0x3d00:   	andncc	%i3, %o3, %l6
	.word	0xda064000	! t1_kref+0x3d04:   	ld	[%i1], %o5
	.word	0xee20a004	! t1_kref+0x3d08:   	st	%l7, [%g2 + 4]
	.word	0x2b480004	! t1_kref+0x3d0c:   	fbug,a,pt	%fcc0, _kref+0x3d1c
	.word	0x95b20009	! t1_kref+0x3d10:   	edge8	%o0, %o1, %o2
	.word	0x89a00029	! t1_kref+0x3d14:   	fmovs	%f9, %f4
	.word	0x988a3671	! t1_kref+0x3d18:   	andcc	%o0, -0x98f, %o4
	.word	0xd1380018	! t1_kref+0x3d1c:   	std	%f8, [%g0 + %i0]
	.word	0x81a000a5	! t1_kref+0x3d20:   	fnegs	%f5, %f0
	.word	0xa89dc008	! t1_kref+0x3d24:   	xorcc	%l7, %o0, %l4
	.word	0xaebdfcb2	! t1_kref+0x3d28:   	xnorcc	%l7, -0x34e, %l7
	.word	0x91a10948	! t1_kref+0x3d2c:   	fmuld	%f4, %f8, %f8
	.word	0x99a38952	! t1_kref+0x3d30:   	fmuld	%f14, %f18, %f12
	.word	0x96d23d74	! t1_kref+0x3d34:   	umulcc	%o0, -0x28c, %o3
	.word	0x24480002	! t1_kref+0x3d38:   	ble,a,pt	%icc, _kref+0x3d40
	.word	0xa888000b	! t1_kref+0x3d3c:   	andcc	%g0, %o3, %l4
	.word	0x91b6c31a	! t1_kref+0x3d40:   	alignaddr	%i3, %i2, %o0
	.word	0xaeadefda	! t1_kref+0x3d44:   	andncc	%l7, 0xfda, %l7
	.word	0x95b68128	! t1_kref+0x3d48:   	edge32n	%i2, %o0, %o2
	.word	0x81a0190f	! t1_kref+0x3d4c:   	fitod	%f15, %f0
	.word	0x81df74d9	! t1_kref+0x3d50:   	flush	%i5 - 0xb27
	.word	0xcd263fe8	! t1_kref+0x3d54:   	st	%f6, [%i0 - 0x18]
	.word	0xc320a02c	! t1_kref+0x3d58:   	st	%f1, [%g2 + 0x2c]
	.word	0x81dc627b	! t1_kref+0x3d5c:   	flush	%l1 + 0x27b
	.word	0x9a36bc87	! t1_kref+0x3d60:   	orn	%i2, -0x379, %o5
	.word	0xe320a014	! t1_kref+0x3d64:   	st	%f17, [%g2 + 0x14]
	.word	0x89a98050	! t1_kref+0x3d68:   	fmovdg	%fcc0, %f16, %f4
	.word	0x9132c009	! t1_kref+0x3d6c:   	srl	%o3, %o1, %o0
	.word	0x940a4017	! t1_kref+0x3d70:   	and	%o1, %l7, %o2
	.word	0xee0e8019	! t1_kref+0x3d74:   	ldub	[%i2 + %i1], %l7
	.word	0xa786c00c	! t1_kref+0x3d78:   	wr	%i3, %o4, %gsr
	.word	0x91233489	! t1_kref+0x3d7c:   	mulscc	%o4, -0xb77, %o0
	.word	0x991aef69	! t1_kref+0x3d80:   	tsubcctv	%o3, 0xf69, %o4
	.word	0xacdeaaba	! t1_kref+0x3d84:   	smulcc	%i2, 0xaba, %l6
	.word	0xea6e4000	! t1_kref+0x3d88:   	ldstub	[%i1], %l5
	.word	0x91228000	! t1_kref+0x3d8c:   	mulscc	%o2, %g0, %o0
	.word	0xd05e7fe0	! t1_kref+0x3d90:   	ldx	[%i1 - 0x20], %o0
	.word	0xee00a034	! t1_kref+0x3d94:   	ld	[%g2 + 0x34], %l7
	.word	0x9abb4009	! t1_kref+0x3d98:   	xnorcc	%o5, %o1, %o5
	.word	0x31480006	! t1_kref+0x3d9c:   	fba,a,pt	%fcc0, _kref+0x3db4
	.word	0x9144c000	! t1_kref+0x3da0:   	mov	%gsr, %o0
	.word	0xd6264000	! t1_kref+0x3da4:   	st	%o3, [%i1]
	.word	0x8da01a23	! t1_kref+0x3da8:   	fstoi	%f3, %f6
	.word	0xa8befe5c	! t1_kref+0x3dac:   	xnorcc	%i3, -0x1a4, %l4
	.word	0xf42e8019	! t1_kref+0x3db0:   	stb	%i2, [%i2 + %i1]
	.word	0xab3b4008	! t1_kref+0x3db4:   	sra	%o5, %o0, %l5
	.word	0x945ee2a6	! t1_kref+0x3db8:   	smul	%i3, 0x2a6, %o2
	.word	0x91a0894c	! t1_kref+0x3dbc:   	fmuld	%f2, %f12, %f8
	.word	0x9962000d	! t1_kref+0x3dc0:   	mova	%fcc0, %o5, %o4
	.word	0x9452401b	! t1_kref+0x3dc4:   	umul	%o1, %i3, %o2
	.word	0x9db48a20	! t1_kref+0x3dc8:   	fpadd16s	%f18, %f0, %f14
	.word	0xc12e7ff4	! t1_kref+0x3dcc:   	st	%fsr, [%i1 - 0xc]
	.word	0xe89e101d	! t1_kref+0x3dd0:   	ldda	[%i0 + %i5]0x80, %l4
	.word	0xe83e401d	! t1_kref+0x3dd4:   	std	%l4, [%i1 + %i5]
	.word	0x3a480001	! t1_kref+0x3dd8:   	bcc,a,pt	%icc, _kref+0x3ddc
	.word	0xaefa6baa	! t1_kref+0x3ddc:   	sdivcc	%o1, 0xbaa, %l7
	.word	0xec08a017	! t1_kref+0x3de0:   	ldub	[%g2 + 0x17], %l6
	.word	0xabb3001b	! t1_kref+0x3de4:   	edge8	%o4, %i3, %l5
	.word	0xea0e001a	! t1_kref+0x3de8:   	ldub	[%i0 + %i2], %l5
	.word	0x37480004	! t1_kref+0x3dec:   	fbge,a,pt	%fcc0, _kref+0x3dfc
	.word	0xac7aefae	! t1_kref+0x3df0:   	sdiv	%o3, 0xfae, %l6
	.word	0xec40a02c	! t1_kref+0x3df4:   	ldsw	[%g2 + 0x2c], %l6
	.word	0x96f28008	! t1_kref+0x3df8:   	udivcc	%o2, %o0, %o3
	.word	0x9bb0006b	! t1_kref+0x3dfc:   	edge8ln	%g0, %o3, %o5
	.word	0xa802c009	! t1_kref+0x3e00:   	add	%o3, %o1, %l4
	.word	0x91a2c823	! t1_kref+0x3e04:   	fadds	%f11, %f3, %f8
	.word	0x23480007	! t1_kref+0x3e08:   	fbne,a,pt	%fcc0, _kref+0x3e24
	.word	0x96924017	! t1_kref+0x3e0c:   	orcc	%o1, %l7, %o3
	.word	0x8ba01a2e	! t1_kref+0x3e10:   	fstoi	%f14, %f5
	.word	0xac3aabb3	! t1_kref+0x3e14:   	xnor	%o2, 0xbb3, %l6
	.word	0x81a98a40	! t1_kref+0x3e18:   	fcmpd	%fcc0, %f6, %f0
	.word	0x9702c017	! t1_kref+0x3e1c:   	taddcc	%o3, %l7, %o3
	.word	0x153a9710	! t1_kref+0x3e20:   	sethi	%hi(0xea5c4000), %o2
	call	SYM(t1_subr1)
	.word	0xaa70247d	! t1_kref+0x3e28:   	udiv	%g0, 0x47d, %l5
	.word	0x38480007	! t1_kref+0x3e2c:   	bgu,a,pt	%icc, _kref+0x3e48
	.word	0x91a1c92b	! t1_kref+0x3e30:   	fmuls	%f7, %f11, %f8
	.word	0xac06ab8b	! t1_kref+0x3e34:   	add	%i2, 0xb8b, %l6
	.word	0xc06e2015	! t1_kref+0x3e38:   	ldstub	[%i0 + 0x15], %g0
	.word	0xa9b6c280	! t1_kref+0x3e3c:   	array32	%i3, %g0, %l4
	.word	0x81a0012c	! t1_kref+0x3e40:   	fabss	%f12, %f0
	.word	0xc93e7fe0	! t1_kref+0x3e44:   	std	%f4, [%i1 - 0x20]
	.word	0x89b48ac0	! t1_kref+0x3e48:   	fpsub32	%f18, %f0, %f4
	.word	0x9a323cdd	! t1_kref+0x3e4c:   	orn	%o0, -0x323, %o5
	.word	0xcd1fbdf8	! t1_kref+0x3e50:   	ldd	[%fp - 0x208], %f6
	.word	0x9db10ec0	! t1_kref+0x3e54:   	fornot2	%f4, %f0, %f14
	.word	0xaa102e5b	! t1_kref+0x3e58:   	mov	0xe5b, %l5
	.word	0x81a40940	! t1_kref+0x3e5c:   	fmuld	%f16, %f0, %f0
	.word	0xda4e6011	! t1_kref+0x3e60:   	ldsb	[%i1 + 0x11], %o5
	.word	0x9da38946	! t1_kref+0x3e64:   	fmuld	%f14, %f6, %f14
	.word	0x81a01a48	! t1_kref+0x3e68:   	fdtoi	%f8, %f0
	.word	0xd2300019	! t1_kref+0x3e6c:   	sth	%o1, [%g0 + %i1]
	.word	0xd826001c	! t1_kref+0x3e70:   	st	%o4, [%i0 + %i4]
	.word	0x96a6f7e0	! t1_kref+0x3e74:   	subcc	%i3, -0x820, %o3
	.word	0xac0b6b34	! t1_kref+0x3e78:   	and	%o5, 0xb34, %l6
	.word	0xa8136fbe	! t1_kref+0x3e7c:   	or	%o5, 0xfbe, %l4
	.word	0xa3a2c828	! t1_kref+0x3e80:   	fadds	%f11, %f8, %f17
	.word	0x95b18a23	! t1_kref+0x3e84:   	fpadd16s	%f6, %f3, %f10
	.word	0xd60e7feb	! t1_kref+0x3e88:   	ldub	[%i1 - 0x15], %o3
	.word	0xc3263fec	! t1_kref+0x3e8c:   	st	%f1, [%i0 - 0x14]
	.word	0xaa023e4b	! t1_kref+0x3e90:   	add	%o0, -0x1b5, %l5
	.word	0xd0e81018	! t1_kref+0x3e94:   	ldstuba	[%g0 + %i0]0x80, %o0
	.word	0x28480008	! t1_kref+0x3e98:   	bleu,a,pt	%icc, _kref+0x3eb8
	.word	0x95a0190d	! t1_kref+0x3e9c:   	fitod	%f13, %f10
	.word	0x290b9463	! t1_kref+0x3ea0:   	sethi	%hi(0x2e518c00), %l4
	.word	0x99a00944	! t1_kref+0x3ea4:   	fmuld	%f0, %f4, %f12
	.word	0x89b30dce	! t1_kref+0x3ea8:   	fnand	%f12, %f14, %f4
	.word	0x9db1c704	! t1_kref+0x3eac:   	fmuld8sux16	%f7, %f4, %f14
	.word	0x81de400e	! t1_kref+0x3eb0:   	flush	%i1 + %sp
	.word	0xd01e2008	! t1_kref+0x3eb4:   	ldd	[%i0 + 8], %o0
	.word	0x9db00c20	! t1_kref+0x3eb8:   	fzeros	%f14
	.word	0x9a83400a	! t1_kref+0x3ebc:   	addcc	%o5, %o2, %o5
	.word	0x95b5c32c	! t1_kref+0x3ec0:   	bmask	%l7, %o4, %o2
	.word	0x91b5c33a	! t1_kref+0x3ec4:   	bmask	%l7, %i2, %o0
	.word	0x9de3bfa0	! t1_kref+0x3ec8:   	save	%sp, -0x60, %sp
	.word	0xb01f3f47	! t1_kref+0x3ecc:   	xor	%i4, -0xb9, %i0
	.word	0x97ee001a	! t1_kref+0x3ed0:   	restore	%i0, %i2, %o3
	.word	0xc9be1888	! t1_kref+0x3ed4:   	stda	%f4, [%i0 + %o0]0xc4
	.word	0xd84e2000	! t1_kref+0x3ed8:   	ldsb	[%i0], %o4
	call	SYM(t1_subr0)
	.word	0x93a00127	! t1_kref+0x3ee0:   	fabss	%f7, %f9
	.word	0xdf00a014	! t1_kref+0x3ee4:   	ld	[%g2 + 0x14], %f15
	.word	0x943dc017	! t1_kref+0x3ee8:   	xnor	%l7, %l7, %o2
	.word	0xd410a00e	! t1_kref+0x3eec:   	lduh	[%g2 + 0xe], %o2
	.word	0x95a00131	! t1_kref+0x3ef0:   	fabss	%f17, %f10
	.word	0x91b3412b	! t1_kref+0x3ef4:   	edge32n	%o5, %o3, %o0
	.word	0x9030000a	! t1_kref+0x3ef8:   	orn	%g0, %o2, %o0
	.word	0x95220008	! t1_kref+0x3efc:   	mulscc	%o0, %o0, %o2
	.word	0x91a01927	! t1_kref+0x3f00:   	fstod	%f7, %f8
	.word	0x34480001	! t1_kref+0x3f04:   	bg,a,pt	%icc, _kref+0x3f08
	.word	0xd830a00e	! t1_kref+0x3f08:   	sth	%o4, [%g2 + 0xe]
	.word	0x9fc10000	! t1_kref+0x3f0c:   	call	%g4
	.word	0x8fa00128	! t1_kref+0x3f10:   	fabss	%f8, %f7
	.word	0x9933400a	! t1_kref+0x3f14:   	srl	%o5, %o2, %o4
	.word	0xf6280018	! t1_kref+0x3f18:   	stb	%i3, [%g0 + %i0]
	.word	0xec6e401a	! t1_kref+0x3f1c:   	ldstub	[%i1 + %i2], %l6
	.word	0xc1200018	! t1_kref+0x3f20:   	st	%f0, [%g0 + %i0]
	.word	0x94922067	! t1_kref+0x3f24:   	orcc	%o0, 0x67, %o2
	.word	0xee4e0000	! t1_kref+0x3f28:   	ldsb	[%i0], %l7
	.word	0x81a01928	! t1_kref+0x3f2c:   	fstod	%f8, %f0
	.word	0x81580000	! t1_kref+0x3f30:   	flushw
	.word	0x2c480008	! t1_kref+0x3f34:   	bneg,a,pt	%icc, _kref+0x3f54
	.word	0xaa722787	! t1_kref+0x3f38:   	udiv	%o0, 0x787, %l5
	.word	0x91b106e2	! t1_kref+0x3f3c:   	fmul8ulx16	%f4, %f2, %f8
	.word	0xc500a024	! t1_kref+0x3f40:   	ld	[%g2 + 0x24], %f2
	.word	0x99b18ec4	! t1_kref+0x3f44:   	fornot2	%f6, %f4, %f12
	.word	0xaefdfa0d	! t1_kref+0x3f48:   	sdivcc	%l7, -0x5f3, %l7
	.word	0x28800004	! t1_kref+0x3f4c:   	bleu,a	_kref+0x3f5c
	.word	0x87b2cd2b	! t1_kref+0x3f50:   	fandnot1s	%f11, %f11, %f3
	.word	0x9165800d	! t1_kref+0x3f54:   	movneg	%icc, %o5, %o0
	.word	0xa5a00550	! t1_kref+0x3f58:   	fsqrtd	%f16, %f18
	.word	0x3e480002	! t1_kref+0x3f5c:   	bvc,a,pt	%icc, _kref+0x3f64
	.word	0xc506401c	! t1_kref+0x3f60:   	ld	[%i1 + %i4], %f2
	.word	0x95202343	! t1_kref+0x3f64:   	mulscc	%g0, 0x343, %o2
	.word	0x83a00124	! t1_kref+0x3f68:   	fabss	%f4, %f1
	.word	0x81a0190e	! t1_kref+0x3f6c:   	fitod	%f14, %f0
	.word	0xc11fbdc0	! t1_kref+0x3f70:   	ldd	[%fp - 0x240], %f0
	.word	0x91400000	! t1_kref+0x3f74:   	mov	%y, %o0
	.word	0x2e480006	! t1_kref+0x3f78:   	bvs,a,pt	%icc, _kref+0x3f90
	.word	0xd220a004	! t1_kref+0x3f7c:   	st	%o1, [%g2 + 4]
	.word	0x90624017	! t1_kref+0x3f80:   	subc	%o1, %l7, %o0
	.word	0xa1a00142	! t1_kref+0x3f84:   	fabsd	%f2, %f16
	.word	0xa1a01931	! t1_kref+0x3f88:   	fstod	%f17, %f16
	.word	0xf207bfe0	! t1_kref+0x3f8c:   	ld	[%fp - 0x20], %i1
	.word	0xa92ec00a	! t1_kref+0x3f90:   	sll	%i3, %o2, %l4
	.word	0x8586f38c	! t1_kref+0x3f94:   	wr	%i3, 0xfffff38c, %ccr
	.word	0xd0280018	! t1_kref+0x3f98:   	stb	%o0, [%g0 + %i0]
	.word	0x001fffff	! t1_kref+0x3f9c:   	illtrap	0x1fffff
	.word	0xa3a018ce	! t1_kref+0x3fa0:   	fdtos	%f14, %f17
	.word	0x9da0012a	! t1_kref+0x3fa4:   	fabss	%f10, %f14
	.word	0x948abb0f	! t1_kref+0x3fa8:   	andcc	%o2, -0x4f1, %o2
	.word	0xf4362004	! t1_kref+0x3fac:   	sth	%i2, [%i0 + 4]
	.word	0x95a38940	! t1_kref+0x3fb0:   	fmuld	%f14, %f0, %f10
	.word	0x99b10d12	! t1_kref+0x3fb4:   	fandnot1	%f4, %f18, %f12
	call	SYM(t1_subr3)
	.word	0xf40024c4	! t1_kref+0x3fbc:   	ld	[%g0 + 0x4c4], %i2
	.word	0x928af650	! t1_kref+0x3fc0:   	andcc	%o3, -0x9b0, %o1
	.word	0x96fac00b	! t1_kref+0x3fc4:   	sdivcc	%o3, %o3, %o3
	.word	0xdab01019	! t1_kref+0x3fc8:   	stha	%o5, [%g0 + %i1]0x80
	.word	0xabb28200	! t1_kref+0x3fcc:   	array8	%o2, %g0, %l5
	.word	0x8da40850	! t1_kref+0x3fd0:   	faddd	%f16, %f16, %f6
	.word	0xa5b20f44	! t1_kref+0x3fd4:   	fornot1	%f8, %f4, %f18
	.word	0xadb2c328	! t1_kref+0x3fd8:   	bmask	%o3, %o0, %l6
	.word	0x908029e0	! t1_kref+0x3fdc:   	addcc	%g0, 0x9e0, %o0
	.word	0xa1a018c6	! t1_kref+0x3fe0:   	fdtos	%f6, %f16
	.word	0xda263ff0	! t1_kref+0x3fe4:   	st	%o5, [%i0 - 0x10]
	.word	0x9da01a48	! t1_kref+0x3fe8:   	fdtoi	%f8, %f14
	.word	0xadb2c0bb	! t1_kref+0x3fec:   	edge16n	%o3, %i3, %l6
	.word	0x8db20e02	! t1_kref+0x3ff0:   	fand	%f8, %f2, %f6
	.word	0xe5062000	! t1_kref+0x3ff4:   	ld	[%i0], %f18
	.word	0x900a0017	! t1_kref+0x3ff8:   	and	%o0, %l7, %o0
	.word	0x2d480003	! t1_kref+0x3ffc:   	fbg,a,pt	%fcc0, _kref+0x4008
	.word	0xa3a24820	! t1_kref+0x4000:   	fadds	%f9, %f0, %f17
	.word	0x8da00025	! t1_kref+0x4004:   	fmovs	%f5, %f6
	.word	0x30480003	! t1_kref+0x4008:   	ba,a,pt	%icc, _kref+0x4014
	.word	0x9a52801a	! t1_kref+0x400c:   	umul	%o2, %i2, %o5
	.word	0xd840a03c	! t1_kref+0x4010:   	ldsw	[%g2 + 0x3c], %o4
	.word	0xaa76f9c1	! t1_kref+0x4014:   	udiv	%i3, -0x63f, %l5
	.word	0x9a726b55	! t1_kref+0x4018:   	udiv	%o1, 0xb55, %o5
	.word	0xa92ea016	! t1_kref+0x401c:   	sll	%i2, 0x16, %l4
	.word	0x99b40c80	! t1_kref+0x4020:   	fandnot2	%f16, %f0, %f12
	.word	0x8ba0492c	! t1_kref+0x4024:   	fmuls	%f1, %f12, %f5
	.word	0x9db18f46	! t1_kref+0x4028:   	fornot1	%f6, %f6, %f14
	.word	0xea080018	! t1_kref+0x402c:   	ldub	[%g0 + %i0], %l5
	.word	0x8ba00129	! t1_kref+0x4030:   	fabss	%f9, %f5
	.word	0xc5066010	! t1_kref+0x4034:   	ld	[%i1 + 0x10], %f2
	.word	0xa9b2817a	! t1_kref+0x4038:   	edge32ln	%o2, %i2, %l4
	.word	0x39480008	! t1_kref+0x403c:   	fbuge,a,pt	%fcc0, _kref+0x405c
	.word	0xe856001b	! t1_kref+0x4040:   	ldsh	[%i0 + %i3], %l4
	.word	0xd01e001d	! t1_kref+0x4044:   	ldd	[%i0 + %i5], %o0
	.word	0x8bb18f68	! t1_kref+0x4048:   	fornot1s	%f6, %f8, %f5
	.word	0x96630009	! t1_kref+0x404c:   	subc	%o4, %o1, %o3
	.word	0xe4bf5019	! t1_kref+0x4050:   	stda	%l2, [%i5 + %i1]0x80
	.word	0x23480005	! t1_kref+0x4054:   	fbne,a,pt	%fcc0, _kref+0x4068
	.word	0xc1070019	! t1_kref+0x4058:   	ld	[%i4 + %i1], %f0
	.word	0x97b24017	! t1_kref+0x405c:   	edge8	%o1, %l7, %o3
	.word	0x89b306ea	! t1_kref+0x4060:   	fmul8ulx16	%f12, %f10, %f4
	.word	0x29480007	! t1_kref+0x4064:   	fbl,a,pt	%fcc0, _kref+0x4080
	.word	0x9db30ad2	! t1_kref+0x4068:   	fpsub32	%f12, %f18, %f14
	.word	0x87a40932	! t1_kref+0x406c:   	fmuls	%f16, %f18, %f3
	.word	0x91a01a2b	! t1_kref+0x4070:   	fstoi	%f11, %f8
	.word	0xd230a02e	! t1_kref+0x4074:   	sth	%o1, [%g2 + 0x2e]
	.word	0xaf40c000	! t1_kref+0x4078:   	mov	%asi, %l7
	.word	0x9da0cd2f	! t1_kref+0x407c:   	fsmuld	%f3, %f15, %f14
	.word	0x37480007	! t1_kref+0x4080:   	fbge,a,pt	%fcc0, _kref+0x409c
	.word	0xea566002	! t1_kref+0x4084:   	ldsh	[%i1 + 2], %l5
	.word	0x9410001b	! t1_kref+0x4088:   	mov	%i3, %o2
	call	SYM(t1_subr0)
	.word	0xd228a02f	! t1_kref+0x4090:   	stb	%o1, [%g2 + 0x2f]
	.word	0xd326601c	! t1_kref+0x4094:   	st	%f9, [%i1 + 0x1c]
	.word	0x9a732ca4	! t1_kref+0x4098:   	udiv	%o4, 0xca4, %o5
	.word	0x89a309cc	! t1_kref+0x409c:   	fdivd	%f12, %f12, %f4
	.word	0xa1a1084c	! t1_kref+0x40a0:   	faddd	%f4, %f12, %f16
	.word	0x85a40940	! t1_kref+0x40a4:   	fmuld	%f16, %f0, %f2
	.word	0xec3f4018	! t1_kref+0x40a8:   	std	%l6, [%i5 + %i0]
	.word	0x38480008	! t1_kref+0x40ac:   	bgu,a,pt	%icc, _kref+0x40cc
	.word	0x91a1094c	! t1_kref+0x40b0:   	fmuld	%f4, %f12, %f8
	.word	0xaef8295c	! t1_kref+0x40b4:   	sdivcc	%g0, 0x95c, %l7
	.word	0xac25c01a	! t1_kref+0x40b8:   	sub	%l7, %i2, %l6
	.word	0xafb18450	! t1_kref+0x40bc:   	fcmpne16	%f6, %f16, %l7
	.word	0x9063400c	! t1_kref+0x40c0:   	subc	%o5, %o4, %o0
	.word	0xd0467fe4	! t1_kref+0x40c4:   	ldsw	[%i1 - 0x1c], %o0
	.word	0x97a00130	! t1_kref+0x40c8:   	fabss	%f16, %f11
	.word	0x9212a649	! t1_kref+0x40cc:   	or	%o2, 0x649, %o1
	.word	0x81ab8a27	! t1_kref+0x40d0:   	fcmps	%fcc0, %f14, %f7
	.word	0xaa2b400a	! t1_kref+0x40d4:   	andn	%o5, %o2, %l5
	.word	0x81df400a	! t1_kref+0x40d8:   	flush	%i5 + %o2
	.word	0x3d480002	! t1_kref+0x40dc:   	fbule,a,pt	%fcc0, _kref+0x40e4
	.word	0xacb8001b	! t1_kref+0x40e0:   	xnorcc	%g0, %i3, %l6
	.word	0xe2f81018	! t1_kref+0x40e4:   	swapa	[%g0 + %i0]0x80, %l1
	.word	0x8fb2cd60	! t1_kref+0x40e8:   	fnot1s	%f11, %f7
	.word	0xaf418000	! t1_kref+0x40ec:   	mov	%fprs, %l7
	.word	0xd126001c	! t1_kref+0x40f0:   	st	%f8, [%i0 + %i4]
	.word	0xaaadc01a	! t1_kref+0x40f4:   	andncc	%l7, %i2, %l5
	.word	0x9a0e8008	! t1_kref+0x40f8:   	and	%i2, %o0, %o5
	.word	0x8db10a44	! t1_kref+0x40fc:   	fpadd32	%f4, %f4, %f6
	.word	0xa1b40906	! t1_kref+0x4100:   	faligndata	%f16, %f6, %f16
	.word	0xa1b38ac2	! t1_kref+0x4104:   	fpsub32	%f14, %f2, %f16
	.word	0x96f2f179	! t1_kref+0x4108:   	udivcc	%o3, -0xe87, %o3
	.word	0x98f37ba2	! t1_kref+0x410c:   	udivcc	%o5, -0x45e, %o4
	.word	0xe500a02c	! t1_kref+0x4110:   	ld	[%g2 + 0x2c], %f18
	.word	0xd42e0000	! t1_kref+0x4114:   	stb	%o2, [%i0]
	.word	0x2f39073a	! t1_kref+0x4118:   	sethi	%hi(0xe41ce800), %l7
	.word	0x85a3c82a	! t1_kref+0x411c:   	fadds	%f15, %f10, %f2
	.word	0xd80e0000	! t1_kref+0x4120:   	ldub	[%i0], %o4
	.word	0xee2e3ffd	! t1_kref+0x4124:   	stb	%l7, [%i0 - 3]
	.word	0x9522e6de	! t1_kref+0x4128:   	mulscc	%o3, 0x6de, %o2
	.word	0xd4d6d018	! t1_kref+0x412c:   	ldsha	[%i3 + %i0]0x80, %o2
	.word	0x9de3bfa0	! t1_kref+0x4130:   	save	%sp, -0x60, %sp
	.word	0xafe83de3	! t1_kref+0x4134:   	restore	%g0, -0x21d, %l7
	.word	0xaa830009	! t1_kref+0x4138:   	addcc	%o4, %o1, %l5
	.word	0x35800001	! t1_kref+0x413c:   	fbue,a	_kref+0x4140
	.word	0x9296f1aa	! t1_kref+0x4140:   	orcc	%i3, -0xe56, %o1
	.word	0x81de4015	! t1_kref+0x4144:   	flush	%i1 + %l5
	.word	0xe43e001d	! t1_kref+0x4148:   	std	%l2, [%i0 + %i5]
	.word	0x9212000c	! t1_kref+0x414c:   	or	%o0, %o4, %o1
	.word	0xea580019	! t1_kref+0x4150:   	ldx	[%g0 + %i1], %l5
	.word	0xae8ea3a6	! t1_kref+0x4154:   	andcc	%i2, 0x3a6, %l7
	.word	0x34800003	! t1_kref+0x4158:   	bg,a	_kref+0x4164
	.word	0x9b400000	! t1_kref+0x415c:   	mov	%y, %o5
	.word	0x8ba000b1	! t1_kref+0x4160:   	fnegs	%f17, %f5
	.word	0xd8062004	! t1_kref+0x4164:   	ld	[%i0 + 4], %o4
	.word	0x97418000	! t1_kref+0x4168:   	mov	%fprs, %o3
	.word	0xd8400019	! t1_kref+0x416c:   	ldsw	[%g0 + %i1], %o4
	.word	0xaabb3860	! t1_kref+0x4170:   	xnorcc	%o4, -0x7a0, %l5
	.word	0xcd262014	! t1_kref+0x4174:   	st	%f6, [%i0 + 0x14]
	.word	0x87a01a4c	! t1_kref+0x4178:   	fdtoi	%f12, %f3
	.word	0x170bd7fd	! t1_kref+0x417c:   	sethi	%hi(0x2f5ff400), %o3
	.word	0x9db3caa0	! t1_kref+0x4180:   	fpsub16s	%f15, %f0, %f14
	.word	0x83a01a2e	! t1_kref+0x4184:   	fstoi	%f14, %f1
	.word	0xad02b8c4	! t1_kref+0x4188:   	taddcc	%o2, -0x73c, %l6
	.word	0x9b26800c	! t1_kref+0x418c:   	mulscc	%i2, %o4, %o5
	.word	0xe76e6010	! t1_kref+0x4190:   	prefetch	%i1 + 0x10, 19
	.word	0x31480006	! t1_kref+0x4194:   	fba,a,pt	%fcc0, _kref+0x41ac
	.word	0xab400000	! t1_kref+0x4198:   	mov	%y, %l5
	.word	0x8da01a40	! t1_kref+0x419c:   	fdtoi	%f0, %f6
	.word	0x85a38d25	! t1_kref+0x41a0:   	fsmuld	%f14, %f5, %f2
	.word	0x81a00548	! t1_kref+0x41a4:   	fsqrtd	%f8, %f0
	.word	0xea4e6006	! t1_kref+0x41a8:   	ldsb	[%i1 + 6], %l5
	.word	0x3a800006	! t1_kref+0x41ac:   	bcc,a	_kref+0x41c4
	.word	0xd048a014	! t1_kref+0x41b0:   	ldsb	[%g2 + 0x14], %o0
	.word	0x81dd8001	! t1_kref+0x41b4:   	flush	%l6 + %g1
	.word	0xc13e7ff8	! t1_kref+0x41b8:   	std	%f0, [%i1 - 8]
	.word	0x81a01024	! t1_kref+0x41bc:   	fstox	%f4, %f0
	.word	0x992dc01b	! t1_kref+0x41c0:   	sll	%l7, %i3, %o4
	.word	0xf42e2001	! t1_kref+0x41c4:   	stb	%i2, [%i0 + 1]
	.word	0x93a000a0	! t1_kref+0x41c8:   	fnegs	%f0, %f9
	.word	0x85b386e6	! t1_kref+0x41cc:   	fmul8ulx16	%f14, %f6, %f2
	.word	0xec4e6012	! t1_kref+0x41d0:   	ldsb	[%i1 + 0x12], %l6
	.word	0xadb2c10c	! t1_kref+0x41d4:   	edge32	%o3, %o4, %l6
	.word	0xc920a014	! t1_kref+0x41d8:   	st	%f4, [%g2 + 0x14]
	.word	0xc12e6018	! t1_kref+0x41dc:   	st	%fsr, [%i1 + 0x18]
	.word	0x95a28948	! t1_kref+0x41e0:   	fmuld	%f10, %f8, %f10
	.word	0x947a0009	! t1_kref+0x41e4:   	sdiv	%o0, %o1, %o2
	.word	0x95a4094e	! t1_kref+0x41e8:   	fmuld	%f16, %f14, %f10
	.word	0xd4500019	! t1_kref+0x41ec:   	ldsh	[%g0 + %i1], %o2
	.word	0xa8e00000	! t1_kref+0x41f0:   	subccc	%g0, %g0, %l4
	.word	0x93003b0f	! t1_kref+0x41f4:   	taddcc	%g0, -0x4f1, %o1
	.word	0x8da000ca	! t1_kref+0x41f8:   	fnegd	%f10, %f6
	.word	0x32480001	! t1_kref+0x41fc:   	bne,a,pt	%icc, _kref+0x4200
	.word	0x947b0017	! t1_kref+0x4200:   	sdiv	%o4, %l7, %o2
	.word	0x83b00aac	! t1_kref+0x4204:   	fpsub16s	%f0, %f12, %f1
	.word	0x9a8e800a	! t1_kref+0x4208:   	andcc	%i2, %o2, %o5
	.word	0xe1be5a1a	! t1_kref+0x420c:   	stda	%f16, [%i1 + %i2]0xd0
	.word	0xda48a017	! t1_kref+0x4210:   	ldsb	[%g2 + 0x17], %o5
	.word	0x85ab804e	! t1_kref+0x4214:   	fmovdule	%fcc0, %f14, %f2
	.word	0xdd3e2018	! t1_kref+0x4218:   	std	%f14, [%i0 + 0x18]
	.word	0xd53e6008	! t1_kref+0x421c:   	std	%f10, [%i1 + 8]
	.word	0xa1a40823	! t1_kref+0x4220:   	fadds	%f16, %f3, %f16
	.word	0x8da0054a	! t1_kref+0x4224:   	fsqrtd	%f10, %f6
	.word	0xea4e8019	! t1_kref+0x4228:   	ldsb	[%i2 + %i1], %l5
	.word	0x95b30446	! t1_kref+0x422c:   	fcmpne16	%f12, %f6, %o2
	.word	0x92fec000	! t1_kref+0x4230:   	sdivcc	%i3, %g0, %o1
	.word	0xd80e8018	! t1_kref+0x4234:   	ldub	[%i2 + %i0], %o4
	.word	0xd610a03e	! t1_kref+0x4238:   	lduh	[%g2 + 0x3e], %o3
	.word	0x81b08aaa	! t1_kref+0x423c:   	fpsub16s	%f2, %f10, %f0
	.word	0xd19e1a5c	! t1_kref+0x4240:   	ldda	[%i0 + %i4]0xd2, %f8
	.word	0xd20e3ff3	! t1_kref+0x4244:   	ldub	[%i0 - 0xd], %o1
	.word	0x99b4844e	! t1_kref+0x4248:   	fcmpne16	%f18, %f14, %o4
	.word	0x97b5c33b	! t1_kref+0x424c:   	bmask	%l7, %i3, %o3
	.word	0x85a38d2d	! t1_kref+0x4250:   	fsmuld	%f14, %f13, %f2
	.word	0xac4237d0	! t1_kref+0x4254:   	addc	%o0, -0x830, %l6
	.word	0xe520a024	! t1_kref+0x4258:   	st	%f18, [%g2 + 0x24]
	.word	0xda064000	! t1_kref+0x425c:   	ld	[%i1], %o5
	.word	0xd86e6006	! t1_kref+0x4260:   	ldstub	[%i1 + 6], %o4
	.word	0xd66e0000	! t1_kref+0x4264:   	ldstub	[%i0], %o3
	.word	0x37480002	! t1_kref+0x4268:   	fbge,a,pt	%fcc0, _kref+0x4270
	.word	0x96ba4000	! t1_kref+0x426c:   	xnorcc	%o1, %g0, %o3
	.word	0x949a0000	! t1_kref+0x4270:   	xorcc	%o0, %g0, %o2
	.word	0x22800008	! t1_kref+0x4274:   	be,a	_kref+0x4294
	.word	0x93a018d2	! t1_kref+0x4278:   	fdtos	%f18, %f9
	.word	0xc53e7ff0	! t1_kref+0x427c:   	std	%f2, [%i1 - 0x10]
	.word	0xea0e7feb	! t1_kref+0x4280:   	ldub	[%i1 - 0x15], %l5
	.word	0xec070019	! t1_kref+0x4284:   	ld	[%i4 + %i1], %l6
	.word	0x97b24d60	! t1_kref+0x4288:   	fnot1s	%f9, %f11
	.word	0x89b18df1	! t1_kref+0x428c:   	fnands	%f6, %f17, %f4
	.word	0x95a389c6	! t1_kref+0x4290:   	fdivd	%f14, %f6, %f10
	.word	0xe88e1000	! t1_kref+0x4294:   	lduba	[%i0]0x80, %l4
	.word	0x9136c008	! t1_kref+0x4298:   	srl	%i3, %o0, %o0
	.word	0xa1a408ad	! t1_kref+0x429c:   	fsubs	%f16, %f13, %f16
	.word	0xc56e2008	! t1_kref+0x42a0:   	prefetch	%i0 + 8, 2
	.word	0xa1b00f0a	! t1_kref+0x42a4:   	fsrc2	%f10, %f16
	.word	0xec48a027	! t1_kref+0x42a8:   	ldsb	[%g2 + 0x27], %l6
	.word	0xa862001a	! t1_kref+0x42ac:   	subc	%o0, %i2, %l4
	.word	0x99408000	! t1_kref+0x42b0:   	mov	%ccr, %o4
	.word	0xd8f65000	! t1_kref+0x42b4:   	stxa	%o4, [%i1]0x80
	.word	0xffee101b	! t1_kref+0x42b8:   	prefetcha	%i0 + %i3, 31
	.word	0xd430a016	! t1_kref+0x42bc:   	sth	%o2, [%g2 + 0x16]
	.word	0x38480005	! t1_kref+0x42c0:   	bgu,a,pt	%icc, _kref+0x42d4
	.word	0x8da01922	! t1_kref+0x42c4:   	fstod	%f2, %f6
	.word	0xd848a015	! t1_kref+0x42c8:   	ldsb	[%g2 + 0x15], %o4
	.word	0x2e480001	! t1_kref+0x42cc:   	bvs,a,pt	%icc, _kref+0x42d0
	.word	0x81a08944	! t1_kref+0x42d0:   	fmuld	%f2, %f4, %f0
	.word	0x39800002	! t1_kref+0x42d4:   	fbuge,a	_kref+0x42dc
	.word	0xac1e801b	! t1_kref+0x42d8:   	xor	%i2, %i3, %l6
	.word	0x99400000	! t1_kref+0x42dc:   	mov	%y, %o4
	.word	0x81a90a4c	! t1_kref+0x42e0:   	fcmpd	%fcc0, %f4, %f12
	.word	0xd60e8019	! t1_kref+0x42e4:   	ldub	[%i2 + %i1], %o3
	.word	0xf428a017	! t1_kref+0x42e8:   	stb	%i2, [%g2 + 0x17]
	.word	0xdd1e7ff0	! t1_kref+0x42ec:   	ldd	[%i1 - 0x10], %f14
	.word	0xa1b20a67	! t1_kref+0x42f0:   	fpadd32s	%f8, %f7, %f16
	.word	0x94fde189	! t1_kref+0x42f4:   	sdivcc	%l7, 0x189, %o2
	.word	0xd0901018	! t1_kref+0x42f8:   	lduha	[%g0 + %i0]0x80, %o0
	.word	0xd00e3ff2	! t1_kref+0x42fc:   	ldub	[%i0 - 0xe], %o0
	.word	0xd51fbdc0	! t1_kref+0x4300:   	ldd	[%fp - 0x240], %f10
	.word	0x91200009	! t1_kref+0x4304:   	mulscc	%g0, %o1, %o0
	.word	0x991dc00d	! t1_kref+0x4308:   	tsubcctv	%l7, %o5, %o4
	.word	0xf4366006	! t1_kref+0x430c:   	sth	%i2, [%i1 + 6]
	.word	0xcd00a024	! t1_kref+0x4310:   	ld	[%g2 + 0x24], %f6
	.word	0xee901019	! t1_kref+0x4314:   	lduha	[%g0 + %i1]0x80, %l7
	.word	0xabb3044a	! t1_kref+0x4318:   	fcmpne16	%f12, %f10, %l5
	sethi	%hi(2f), %o7
	.word	0xe40be350	! t1_kref+0x4320:   	ldub	[%o7 + 0x350], %l2
	.word	0xa41ca00c	! t1_kref+0x4324:   	xor	%l2, 0xc, %l2
	.word	0xe42be350	! t1_kref+0x4328:   	stb	%l2, [%o7 + 0x350]
	.word	0x81dbe350	! t1_kref+0x432c:   	flush	%o7 + 0x350
	.word	0xae22c00d	! t1_kref+0x4330:   	sub	%o3, %o5, %l7
	.word	0xab3b6011	! t1_kref+0x4334:   	sra	%o5, 0x11, %l5
	.word	0xa1b20f42	! t1_kref+0x4338:   	fornot1	%f8, %f2, %f16
	.word	0x95b00cf2	! t1_kref+0x433c:   	fnot2s	%f18, %f10
	.word	0xae32e70a	! t1_kref+0x4340:   	orn	%o3, 0x70a, %l7
	.word	0x9a0e800d	! t1_kref+0x4344:   	and	%i2, %o5, %o5
	.word	0x909eeb7a	! t1_kref+0x4348:   	xorcc	%i3, 0xb7a, %o0
	.word	0xd200a034	! t1_kref+0x434c:   	ld	[%g2 + 0x34], %o1
2:	.word	0x949a3f80	! t1_kref+0x4350:   	xorcc	%o0, -0x80, %o2
	.word	0x8143c000	! t1_kref+0x4354:   	stbar
	.word	0xee200018	! t1_kref+0x4358:   	st	%l7, [%g0 + %i0]
	.word	0x81a00121	! t1_kref+0x435c:   	fabss	%f1, %f0
	.word	0x9a722a10	! t1_kref+0x4360:   	udiv	%o0, 0xa10, %o5
	.word	0x925a2090	! t1_kref+0x4364:   	smul	%o0, 0x90, %o1
	.word	0xd830a016	! t1_kref+0x4368:   	sth	%o4, [%g2 + 0x16]
	.word	0x9fa0c831	! t1_kref+0x436c:   	fadds	%f3, %f17, %f15
	.word	0xa812801b	! t1_kref+0x4370:   	or	%o2, %i3, %l4
	.word	0x99a18948	! t1_kref+0x4374:   	fmuld	%f6, %f8, %f12
	.word	0x99b4054a	! t1_kref+0x4378:   	fcmpeq16	%f16, %f10, %o4
	.word	0xe83f4019	! t1_kref+0x437c:   	std	%l4, [%i5 + %i1]
	.word	0x9b32000b	! t1_kref+0x4380:   	srl	%o0, %o3, %o5
	.word	0x97233dc1	! t1_kref+0x4384:   	mulscc	%o4, -0x23f, %o3
	.word	0x23480008	! t1_kref+0x4388:   	fbne,a,pt	%fcc0, _kref+0x43a8
	.word	0x81580000	! t1_kref+0x438c:   	flushw
	.word	0x98bdc00d	! t1_kref+0x4390:   	xnorcc	%l7, %o5, %o4
	.word	0xee366010	! t1_kref+0x4394:   	sth	%l7, [%i1 + 0x10]
	.word	0xc11e6000	! t1_kref+0x4398:   	ldd	[%i1], %f0
	.word	0x92e2800a	! t1_kref+0x439c:   	subccc	%o2, %o2, %o1
	.word	0x001fffff	! t1_kref+0x43a0:   	illtrap	0x1fffff
	.word	0x947239db	! t1_kref+0x43a4:   	udiv	%o0, -0x625, %o2
	.word	0xaea2401b	! t1_kref+0x43a8:   	subcc	%o1, %i3, %l7
	.word	0x36800008	! t1_kref+0x43ac:   	bge,a	_kref+0x43cc
	.word	0x8bb24d24	! t1_kref+0x43b0:   	fandnot1s	%f9, %f4, %f5
	.word	0x96720008	! t1_kref+0x43b4:   	udiv	%o0, %o0, %o3
	.word	0x95a00842	! t1_kref+0x43b8:   	faddd	%f0, %f2, %f10
	.word	0x29480007	! t1_kref+0x43bc:   	fbl,a,pt	%fcc0, _kref+0x43d8
	.word	0xf007bfe0	! t1_kref+0x43c0:   	ld	[%fp - 0x20], %i0
	.word	0x85b44ea0	! t1_kref+0x43c4:   	fsrc1s	%f17, %f2
	.word	0xd006601c	! t1_kref+0x43c8:   	ld	[%i1 + 0x1c], %o0
	.word	0xcd266014	! t1_kref+0x43cc:   	st	%f6, [%i1 + 0x14]
	.word	0xaa830009	! t1_kref+0x43d0:   	addcc	%o4, %o1, %l5
	.word	0x9fa088a7	! t1_kref+0x43d4:   	fsubs	%f2, %f7, %f15
	.word	0xe83e7ff0	! t1_kref+0x43d8:   	std	%l4, [%i1 - 0x10]
	.word	0xd668a00d	! t1_kref+0x43dc:   	ldstub	[%g2 + 0xd], %o3
	.word	0x1925b884	! t1_kref+0x43e0:   	sethi	%hi(0x96e21000), %o4
	.word	0x9fc00004	! t1_kref+0x43e4:   	call	%g0 + %g4
	.word	0xee30a03e	! t1_kref+0x43e8:   	sth	%l7, [%g2 + 0x3e]
	.word	0xd028a015	! t1_kref+0x43ec:   	stb	%o0, [%g2 + 0x15]
	.word	0x86102002	! t1_kref+0x43f0:   	mov	0x2, %g3
	.word	0x86a0e001	! t1_kref+0x43f4:   	subcc	%g3, 1, %g3
	.word	0x22800006	! t1_kref+0x43f8:   	be,a	_kref+0x4410
	.word	0x9ba018c4	! t1_kref+0x43fc:   	fdtos	%f4, %f13
	.word	0x8db30a90	! t1_kref+0x4400:   	fpsub16	%f12, %f16, %f6
	.word	0xd810a024	! t1_kref+0x4404:   	lduh	[%g2 + 0x24], %o4
	.word	0xe36e001c	! t1_kref+0x4408:   	prefetch	%i0 + %i4, 17
	.word	0xa3a01a28	! t1_kref+0x440c:   	fstoi	%f8, %f17
	.word	0x23480006	! t1_kref+0x4410:   	fbne,a,pt	%fcc0, _kref+0x4428
	.word	0x92900000	! t1_kref+0x4414:   	orcc	%g0, %g0, %o1
	.word	0x15111001	! t1_kref+0x4418:   	sethi	%hi(0x44400400), %o2
	.word	0x9fc00004	! t1_kref+0x441c:   	call	%g0 + %g4
	.word	0x9462800b	! t1_kref+0x4420:   	subc	%o2, %o3, %o2
	.word	0x9fc10000	! t1_kref+0x4424:   	call	%g4
	.word	0xd8070018	! t1_kref+0x4428:   	ld	[%i4 + %i0], %o4
	.word	0x95a84028	! t1_kref+0x442c:   	fmovsne	%fcc0, %f8, %f10
	.word	0x85a2094e	! t1_kref+0x4430:   	fmuld	%f8, %f14, %f2
	.word	0xd656001b	! t1_kref+0x4434:   	ldsh	[%i0 + %i3], %o3
	.word	0xe100a02c	! t1_kref+0x4438:   	ld	[%g2 + 0x2c], %f16
	.word	0xab67e4a7	! t1_kref+0x443c:   	movvc	%icc, -0x359, %l5
	.word	0x9fc10000	! t1_kref+0x4440:   	call	%g4
	.word	0x96bec00a	! t1_kref+0x4444:   	xnorcc	%i3, %o2, %o3
	.word	0x9812800a	! t1_kref+0x4448:   	or	%o2, %o2, %o4
	.word	0xaaf8001b	! t1_kref+0x444c:   	sdivcc	%g0, %i3, %l5
	.word	0x947a400b	! t1_kref+0x4450:   	sdiv	%o1, %o3, %o2
	.word	0xd020a02c	! t1_kref+0x4454:   	st	%o0, [%g2 + 0x2c]
	.word	0x925a30b7	! t1_kref+0x4458:   	smul	%o0, -0xf49, %o1
	.word	0xae13753f	! t1_kref+0x445c:   	or	%o5, -0xac1, %l7
	.word	0x85b00d40	! t1_kref+0x4460:   	fnot1	%f0, %f2
	.word	0x8bb00c20	! t1_kref+0x4464:   	fzeros	%f5
	.word	0xd030a02c	! t1_kref+0x4468:   	sth	%o0, [%g2 + 0x2c]
	.word	0x8db40969	! t1_kref+0x446c:   	fpmerge	%f16, %f9, %f6
	.word	0x37480006	! t1_kref+0x4470:   	fbge,a,pt	%fcc0, _kref+0x4488
	.word	0xe8080018	! t1_kref+0x4474:   	ldub	[%g0 + %i0], %l4
	.word	0x98200000	! t1_kref+0x4478:   	neg	%g0, %o4
	.word	0x96123561	! t1_kref+0x447c:   	or	%o0, -0xa9f, %o3
	.word	0x99a9c042	! t1_kref+0x4480:   	fmovdu	%fcc0, %f2, %f12
	.word	0x34800002	! t1_kref+0x4484:   	bg,a	_kref+0x448c
	.word	0xec0e6016	! t1_kref+0x4488:   	ldub	[%i1 + 0x16], %l6
	.word	0xaef2e4a6	! t1_kref+0x448c:   	udivcc	%o3, 0x4a6, %l7
	.word	0x933ea014	! t1_kref+0x4490:   	sra	%i2, 0x14, %o1
	.word	0xd60e8018	! t1_kref+0x4494:   	ldub	[%i2 + %i0], %o3
	.word	0x86102001	! t1_kref+0x4498:   	mov	0x1, %g3
	.word	0x32800000	! t1_kref+0x449c:   	bne,a	_kref+0x449c
	.word	0x86a0e001	! t1_kref+0x44a0:   	subcc	%g3, 1, %g3
	.word	0x9540c000	! t1_kref+0x44a4:   	mov	%asi, %o2
	.word	0x32480001	! t1_kref+0x44a8:   	bne,a,pt	%icc, _kref+0x44ac
	.word	0x8db00f31	! t1_kref+0x44ac:   	fsrc2s	%f17, %f6
	.word	0x89b18d04	! t1_kref+0x44b0:   	fandnot1	%f6, %f4, %f4
	.word	0x8da01923	! t1_kref+0x44b4:   	fstod	%f3, %f6
	.word	0x97b00f2f	! t1_kref+0x44b8:   	fsrc2s	%f15, %f11
	.word	0xea10a034	! t1_kref+0x44bc:   	lduh	[%g2 + 0x34], %l5
	.word	0x89a3894a	! t1_kref+0x44c0:   	fmuld	%f14, %f10, %f4
	.word	0xa8803818	! t1_kref+0x44c4:   	addcc	%g0, -0x7e8, %l4
	.word	0x8fb00c20	! t1_kref+0x44c8:   	fzeros	%f7
	.word	0xd40e7ff8	! t1_kref+0x44cc:   	ldub	[%i1 - 8], %o2
	.word	0x26480002	! t1_kref+0x44d0:   	bl,a,pt	%icc, _kref+0x44d8
	.word	0xd5bf5019	! t1_kref+0x44d4:   	stda	%f10, [%i5 + %i1]0x80
	.word	0xa8fac00b	! t1_kref+0x44d8:   	sdivcc	%o3, %o3, %l4
	.word	0x89a38844	! t1_kref+0x44dc:   	faddd	%f14, %f4, %f4
	.word	0x9fa34924	! t1_kref+0x44e0:   	fmuls	%f13, %f4, %f15
	.word	0x91a01903	! t1_kref+0x44e4:   	fitod	%f3, %f8
	.word	0xda2e401a	! t1_kref+0x44e8:   	stb	%o5, [%i1 + %i2]
	.word	0x91b10ed0	! t1_kref+0x44ec:   	fornot2	%f4, %f16, %f8
	.word	0x93400000	! t1_kref+0x44f0:   	mov	%y, %o1
	.word	0x99a1c8a7	! t1_kref+0x44f4:   	fsubs	%f7, %f7, %f12
	.word	0xac60001b	! t1_kref+0x44f8:   	subc	%g0, %i3, %l6
	.word	0x9922801a	! t1_kref+0x44fc:   	mulscc	%o2, %i2, %o4
	.word	0xf62e8019	! t1_kref+0x4500:   	stb	%i3, [%i2 + %i1]
	.word	0xda20a014	! t1_kref+0x4504:   	st	%o5, [%g2 + 0x14]
	.word	0x95a94022	! t1_kref+0x4508:   	fmovsug	%fcc0, %f2, %f10
	.word	0xa8183efb	! t1_kref+0x450c:   	xor	%g0, -0x105, %l4
	.word	0x89a01a2f	! t1_kref+0x4510:   	fstoi	%f15, %f4
	.word	0x98ba0000	! t1_kref+0x4514:   	xnorcc	%o0, %g0, %o4
	.word	0xa5b007b0	! t1_kref+0x4518:   	fpackfix	%f16, %f18
	.word	0x92f6c000	! t1_kref+0x451c:   	udivcc	%i3, %g0, %o1
	.word	0xd600a004	! t1_kref+0x4520:   	ld	[%g2 + 4], %o3
	.word	0x95a00932	! t1_kref+0x4524:   	fmuls	%f0, %f18, %f10
	.word	0xd4070018	! t1_kref+0x4528:   	ld	[%i4 + %i0], %o2
	.word	0x93400000	! t1_kref+0x452c:   	mov	%y, %o1
	.word	0x91a0190e	! t1_kref+0x4530:   	fitod	%f14, %f8
	.word	0xc53e2008	! t1_kref+0x4534:   	std	%f2, [%i0 + 8]
	.word	0xee0e4000	! t1_kref+0x4538:   	ldub	[%i1], %l7
	.word	0xcd1fbe50	! t1_kref+0x453c:   	ldd	[%fp - 0x1b0], %f6
	.word	0x9a923f47	! t1_kref+0x4540:   	orcc	%o0, -0xb9, %o5
	.word	0x9de3bfa0	! t1_kref+0x4544:   	save	%sp, -0x60, %sp
	.word	0xb4d64019	! t1_kref+0x4548:   	umulcc	%i1, %i1, %i2
	.word	0x9be83747	! t1_kref+0x454c:   	restore	%g0, -0x8b9, %o5
	.word	0x89a000ab	! t1_kref+0x4550:   	fnegs	%f11, %f4
	.word	0xee40a034	! t1_kref+0x4554:   	ldsw	[%g2 + 0x34], %l7
	.word	0x93a00123	! t1_kref+0x4558:   	fabss	%f3, %f9
	.word	0xec3e0000	! t1_kref+0x455c:   	std	%l6, [%i0]
	.word	0xa5a01932	! t1_kref+0x4560:   	fstod	%f18, %f18
	.word	0x9fc10000	! t1_kref+0x4564:   	call	%g4
	.word	0x99b10f40	! t1_kref+0x4568:   	fornot1	%f4, %f0, %f12
	.word	0x9f414000	! t1_kref+0x456c:   	mov	%pc, %o7
!	.word	0x3abaaea3	! t1_kref+0x4570:   	bcc,a	SYM(t1_subr2)
	   	bcc,a	SYM(t1_subr2)
	.word	0x8db40c80	! t1_kref+0x4574:   	fandnot2	%f16, %f0, %f6
	.word	0x98ba400d	! t1_kref+0x4578:   	xnorcc	%o1, %o5, %o4
	.word	0x81a84030	! t1_kref+0x457c:   	fmovsne	%fcc0, %f16, %f0
	.word	0x9de3bfa0	! t1_kref+0x4580:   	save	%sp, -0x60, %sp
	.word	0xb03f0018	! t1_kref+0x4584:   	xnor	%i4, %i0, %i0
	.word	0xafeebc41	! t1_kref+0x4588:   	restore	%i2, -0x3bf, %l7
	.word	0x98f20009	! t1_kref+0x458c:   	udivcc	%o0, %o1, %o4
	.word	0x9ba40829	! t1_kref+0x4590:   	fadds	%f16, %f9, %f13
	.word	0xd1264000	! t1_kref+0x4594:   	st	%f8, [%i1]
	.word	0xd320a02c	! t1_kref+0x4598:   	st	%f9, [%g2 + 0x2c]
	.word	0xd236600c	! t1_kref+0x459c:   	sth	%o1, [%i1 + 0xc]
	.word	0x91b10e4e	! t1_kref+0x45a0:   	fxnor	%f4, %f14, %f8
	.word	0x8d824017	! t1_kref+0x45a4:   	wr	%o1, %l7, %fprs
	.word	0xac58267e	! t1_kref+0x45a8:   	smul	%g0, 0x67e, %l6
	.word	0x99a0192e	! t1_kref+0x45ac:   	fstod	%f14, %f12
	.word	0x8db306e4	! t1_kref+0x45b0:   	fmul8ulx16	%f12, %f4, %f6
	.word	0x89a01a48	! t1_kref+0x45b4:   	fdtoi	%f8, %f4
	.word	0xd0680018	! t1_kref+0x45b8:   	ldstub	[%g0 + %i0], %o0
	.word	0xc9260000	! t1_kref+0x45bc:   	st	%f4, [%i0]
	.word	0xd40e8019	! t1_kref+0x45c0:   	ldub	[%i2 + %i1], %o2
	.word	0x8da000d2	! t1_kref+0x45c4:   	fnegd	%f18, %f6
	.word	0xdb00a00c	! t1_kref+0x45c8:   	ld	[%g2 + 0xc], %f13
	.word	0x9962a552	! t1_kref+0x45cc:   	movue	%fcc0, -0x2ae, %o4
	.word	0x9fc10000	! t1_kref+0x45d0:   	call	%g4
	.word	0xd250a02c	! t1_kref+0x45d4:   	ldsh	[%g2 + 0x2c], %o1
	.word	0x9a1b36bd	! t1_kref+0x45d8:   	xor	%o4, -0x943, %o5
	.word	0xa9b0010a	! t1_kref+0x45dc:   	edge32	%g0, %o2, %l4
	.word	0xa1a10940	! t1_kref+0x45e0:   	fmuld	%f4, %f0, %f16
	.word	0x85b20e62	! t1_kref+0x45e4:   	fxnors	%f8, %f2, %f2
	.word	0xcb070018	! t1_kref+0x45e8:   	ld	[%i4 + %i0], %f5
	.word	0x26480001	! t1_kref+0x45ec:   	bl,a,pt	%icc, _kref+0x45f0
	.word	0xe11e0000	! t1_kref+0x45f0:   	ldd	[%i0], %f16
	.word	0x95b340fa	! t1_kref+0x45f4:   	edge16ln	%o5, %i2, %o2
	.word	0x99a30d23	! t1_kref+0x45f8:   	fsmuld	%f12, %f3, %f12
	.word	0x960a400c	! t1_kref+0x45fc:   	and	%o1, %o4, %o3
	.word	0x85b38908	! t1_kref+0x4600:   	faligndata	%f14, %f8, %f2
	.word	0xee0e0000	! t1_kref+0x4604:   	ldub	[%i0], %l7
	.word	0x99a01084	! t1_kref+0x4608:   	fxtos	%f4, %f12
	.word	0x9fc10000	! t1_kref+0x460c:   	call	%g4
	.word	0xd6470018	! t1_kref+0x4610:   	ldsw	[%i4 + %i0], %o3
	.word	0xf42e2012	! t1_kref+0x4614:   	stb	%i2, [%i0 + 0x12]
	.word	0x95b28008	! t1_kref+0x4618:   	edge8	%o2, %o0, %o2
	.word	0xec3e6018	! t1_kref+0x461c:   	std	%l6, [%i1 + 0x18]
	.word	0xa82ec01b	! t1_kref+0x4620:   	andn	%i3, %i3, %l4
	.word	0x1314c4be	! t1_kref+0x4624:   	sethi	%hi(0x5312f800), %o1
	.word	0xee066008	! t1_kref+0x4628:   	ld	[%i1 + 8], %l7
	.word	0x9bb2400a	! t1_kref+0x462c:   	edge8	%o1, %o2, %o5
	.word	0x9a136517	! t1_kref+0x4630:   	or	%o5, 0x517, %o5
	.word	0x36480008	! t1_kref+0x4634:   	bge,a,pt	%icc, _kref+0x4654
	.word	0xe43e3fe0	! t1_kref+0x4638:   	std	%l2, [%i0 - 0x20]
	.word	0x9aaaa6ec	! t1_kref+0x463c:   	andncc	%o2, 0x6ec, %o5
	.word	0x980ec01a	! t1_kref+0x4640:   	and	%i3, %i2, %o4
	.word	0xadb2c0b7	! t1_kref+0x4644:   	edge16n	%o3, %l7, %l6
	.word	0x8db08c8e	! t1_kref+0x4648:   	fandnot2	%f2, %f14, %f6
	.word	0x83a14821	! t1_kref+0x464c:   	fadds	%f5, %f1, %f1
	.word	0xa1a00542	! t1_kref+0x4650:   	fsqrtd	%f2, %f16
	.word	0x38480005	! t1_kref+0x4654:   	bgu,a,pt	%icc, _kref+0x4668
	.word	0x985b4009	! t1_kref+0x4658:   	smul	%o5, %o1, %o4
	.word	0xd6270019	! t1_kref+0x465c:   	st	%o3, [%i4 + %i1]
	.word	0xd020a014	! t1_kref+0x4660:   	st	%o0, [%g2 + 0x14]
	.word	0xda367fe8	! t1_kref+0x4664:   	sth	%o5, [%i1 - 0x18]
	.word	0x8bb28ea0	! t1_kref+0x4668:   	fsrc1s	%f10, %f5
	.word	0x95b08722	! t1_kref+0x466c:   	fmuld8ulx16	%f2, %f2, %f10
	.word	0x947eb880	! t1_kref+0x4670:   	sdiv	%i2, -0x780, %o2
	.word	0x89b08963	! t1_kref+0x4674:   	fpmerge	%f2, %f3, %f4
	.word	0x85830009	! t1_kref+0x4678:   	wr	%o4, %o1, %ccr
	.word	0xac1ef81a	! t1_kref+0x467c:   	xor	%i3, -0x7e6, %l6
	.word	0xd80e601d	! t1_kref+0x4680:   	ldub	[%i1 + 0x1d], %o4
	.word	0x89b3c70e	! t1_kref+0x4684:   	fmuld8sux16	%f15, %f14, %f4
	.word	0x81b14731	! t1_kref+0x4688:   	fmuld8ulx16	%f5, %f17, %f0
	.word	0x81ab8aac	! t1_kref+0x468c:   	fcmpes	%fcc0, %f14, %f12
	.word	0x95a20846	! t1_kref+0x4690:   	faddd	%f8, %f6, %f10
	.word	0x2c480008	! t1_kref+0x4694:   	bneg,a,pt	%icc, _kref+0x46b4
	.word	0xd640a01c	! t1_kref+0x4698:   	ldsw	[%g2 + 0x1c], %o3
	.word	0x89a00540	! t1_kref+0x469c:   	fsqrtd	%f0, %f4
	.word	0x99b28317	! t1_kref+0x46a0:   	alignaddr	%o2, %l7, %o4
	.word	0xa5a01924	! t1_kref+0x46a4:   	fstod	%f4, %f18
	.word	0x81a308d0	! t1_kref+0x46a8:   	fsubd	%f12, %f16, %f0
	.word	0xee48a03c	! t1_kref+0x46ac:   	ldsb	[%g2 + 0x3c], %l7
	.word	0xaf40c000	! t1_kref+0x46b0:   	mov	%asi, %l7
	.word	0x34480002	! t1_kref+0x46b4:   	bg,a,pt	%icc, _kref+0x46bc
	.word	0x96b83aac	! t1_kref+0x46b8:   	xnorcc	%g0, -0x554, %o3
	.word	0x89b10a0e	! t1_kref+0x46bc:   	fpadd16	%f4, %f14, %f4
	.word	0x9478001b	! t1_kref+0x46c0:   	sdiv	%g0, %i3, %o2
	.word	0x85b00c20	! t1_kref+0x46c4:   	fzeros	%f2
	.word	0x9476b698	! t1_kref+0x46c8:   	udiv	%i2, -0x968, %o2
	.word	0x81b00c20	! t1_kref+0x46cc:   	fzeros	%f0
	.word	0xa5b00a46	! t1_kref+0x46d0:   	fpadd32	%f0, %f6, %f18
	.word	0xd0367fe0	! t1_kref+0x46d4:   	sth	%o0, [%i1 - 0x20]
	.word	0x8ba00130	! t1_kref+0x46d8:   	fabss	%f16, %f5
	.word	0x89b00c92	! t1_kref+0x46dc:   	fandnot2	%f0, %f18, %f4
	.word	0x9fc10000	! t1_kref+0x46e0:   	call	%g4
	.word	0xadb240e9	! t1_kref+0x46e4:   	edge16ln	%o1, %o1, %l6
	.word	0x113bacef	! t1_kref+0x46e8:   	sethi	%hi(0xeeb3bc00), %o0
	.word	0x9fa01a4e	! t1_kref+0x46ec:   	fdtoi	%f14, %f15
	.word	0xae800008	! t1_kref+0x46f0:   	addcc	%g0, %o0, %l7
	.word	0x8143e070	! t1_kref+0x46f4:   	membar	0x70
	.word	0x25480004	! t1_kref+0x46f8:   	fblg,a,pt	%fcc0, _kref+0x4708
	.word	0x81a01931	! t1_kref+0x46fc:   	fstod	%f17, %f0
	.word	0x8da28846	! t1_kref+0x4700:   	faddd	%f10, %f6, %f6
	.word	0xc5070019	! t1_kref+0x4704:   	ld	[%i4 + %i1], %f2
	.word	0x9b44c000	! t1_kref+0x4708:   	mov	%gsr, %o5
	.word	0x9fc10000	! t1_kref+0x470c:   	call	%g4
	.word	0x9213000a	! t1_kref+0x4710:   	or	%o4, %o2, %o1
	.word	0xaa86c017	! t1_kref+0x4714:   	addcc	%i3, %l7, %l5
	.word	0x85b486e0	! t1_kref+0x4718:   	fmul8ulx16	%f18, %f0, %f2
	.word	0x920230ab	! t1_kref+0x471c:   	add	%o0, -0xf55, %o1
	.word	0x95a488b2	! t1_kref+0x4720:   	fsubs	%f18, %f18, %f10
	.word	0x8185c000	! t1_kref+0x4724:   	wr	%l7, %g0, %y
	.word	0xee26401c	! t1_kref+0x4728:   	st	%l7, [%i1 + %i4]
	.word	0x9da00526	! t1_kref+0x472c:   	fsqrts	%f6, %f14
	.word	0x9ba209a0	! t1_kref+0x4730:   	fdivs	%f8, %f0, %f13
	.word	0xc5063ff8	! t1_kref+0x4734:   	ld	[%i0 - 8], %f2
	.word	0xee40a01c	! t1_kref+0x4738:   	ldsw	[%g2 + 0x1c], %l7
	.word	0x81ddbc72	! t1_kref+0x473c:   	flush	%l6 - 0x38e
	.word	0x9130000b	! t1_kref+0x4740:   	srl	%g0, %o3, %o0
	.word	0xf4ae5000	! t1_kref+0x4744:   	stba	%i2, [%i1]0x80
	.word	0x9fc00004	! t1_kref+0x4748:   	call	%g0 + %g4
	.word	0xd06e200e	! t1_kref+0x474c:   	ldstub	[%i0 + 0xe], %o0
	.word	0x91223595	! t1_kref+0x4750:   	mulscc	%o0, -0xa6b, %o0
	.word	0x9da30842	! t1_kref+0x4754:   	faddd	%f12, %f2, %f14
	.word	0xee270019	! t1_kref+0x4758:   	st	%l7, [%i4 + %i1]
	.word	0xabb20544	! t1_kref+0x475c:   	fcmpeq16	%f8, %f4, %l5
	.word	0x948aab38	! t1_kref+0x4760:   	andcc	%o2, 0xb38, %o2
	.word	0x34480003	! t1_kref+0x4764:   	bg,a,pt	%icc, _kref+0x4770
	.word	0x99a01a32	! t1_kref+0x4768:   	fstoi	%f18, %f12
	.word	0xdf20a014	! t1_kref+0x476c:   	st	%f15, [%g2 + 0x14]
	.word	0xc9067ffc	! t1_kref+0x4770:   	ld	[%i1 - 4], %f4
	.word	0x9fa00129	! t1_kref+0x4774:   	fabss	%f9, %f15
	.word	0xd608a034	! t1_kref+0x4778:   	ldub	[%g2 + 0x34], %o3
	.word	0x9862c008	! t1_kref+0x477c:   	subc	%o3, %o0, %o4
	.word	0x2d480006	! t1_kref+0x4780:   	fbg,a,pt	%fcc0, _kref+0x4798
	.word	0x98fe801a	! t1_kref+0x4784:   	sdivcc	%i2, %i2, %o4
	.word	0x9fc00004	! t1_kref+0x4788:   	call	%g0 + %g4
	.word	0xac232239	! t1_kref+0x478c:   	sub	%o4, 0x239, %l6
	.word	0x961b26e8	! t1_kref+0x4790:   	xor	%o4, 0x6e8, %o3
	.word	0xd8080019	! t1_kref+0x4794:   	ldub	[%g0 + %i1], %o4
	.word	0xe51e7ff8	! t1_kref+0x4798:   	ldd	[%i1 - 8], %f18
	.word	0x95168009	! t1_kref+0x479c:   	taddcctv	%i2, %o1, %o2
	.word	0xae4268a6	! t1_kref+0x47a0:   	addc	%o1, 0x8a6, %l7
	.word	0xaa824017	! t1_kref+0x47a4:   	addcc	%o1, %l7, %l5
	.word	0x9682000a	! t1_kref+0x47a8:   	addcc	%o0, %o2, %o3
	.word	0xad1e801b	! t1_kref+0x47ac:   	tsubcctv	%i2, %i3, %l6
	.word	0x3e480003	! t1_kref+0x47b0:   	bvc,a,pt	%icc, _kref+0x47bc
	.word	0x91a2cd32	! t1_kref+0x47b4:   	fsmuld	%f11, %f18, %f8
	.word	0xa1a10950	! t1_kref+0x47b8:   	fmuld	%f4, %f16, %f16
	.word	0xa7868017	! t1_kref+0x47bc:   	wr	%i2, %l7, %gsr
	.word	0x90d02747	! t1_kref+0x47c0:   	umulcc	%g0, 0x747, %o0
	.word	0xa9400000	! t1_kref+0x47c4:   	mov	%y, %l4
	.word	0x2e480001	! t1_kref+0x47c8:   	bvs,a,pt	%icc, _kref+0x47cc
	.word	0x9b3ee017	! t1_kref+0x47cc:   	sra	%i3, 0x17, %o5
	.word	0x9bb30f67	! t1_kref+0x47d0:   	fornot1s	%f12, %f7, %f13
	.word	0x83a01a2e	! t1_kref+0x47d4:   	fstoi	%f14, %f1
	.word	0x973b4008	! t1_kref+0x47d8:   	sra	%o5, %o0, %o3
	.word	0xd00e2014	! t1_kref+0x47dc:   	ldub	[%i0 + 0x14], %o0
	.word	0x92d2e416	! t1_kref+0x47e0:   	umulcc	%o3, 0x416, %o1
	.word	0xd220a01c	! t1_kref+0x47e4:   	st	%o1, [%g2 + 0x1c]
	.word	0x95b30664	! t1_kref+0x47e8:   	fmul8x16au	%f12, %f4, %f10
	.word	0xee6e2010	! t1_kref+0x47ec:   	ldstub	[%i0 + 0x10], %l7
	.word	0x89a308ce	! t1_kref+0x47f0:   	fsubd	%f12, %f14, %f4
	.word	0xae9dfb37	! t1_kref+0x47f4:   	xorcc	%l7, -0x4c9, %l7
	.word	0xd630a004	! t1_kref+0x47f8:   	sth	%o3, [%g2 + 4]
	.word	0x933dc00d	! t1_kref+0x47fc:   	sra	%l7, %o5, %o1
	.word	0xa1a10d25	! t1_kref+0x4800:   	fsmuld	%f4, %f5, %f16
	.word	0x99b340aa	! t1_kref+0x4804:   	edge16n	%o5, %o2, %o4
	.word	0x38480001	! t1_kref+0x4808:   	bgu,a,pt	%icc, _kref+0x480c
	.word	0x96d6c000	! t1_kref+0x480c:   	umulcc	%i3, %g0, %o3
	.word	0x81dee12c	! t1_kref+0x4810:   	flush	%i3 + 0x12c
	.word	0xe5801019	! t1_kref+0x4814:   	lda	[%g0 + %i1]0x80, %f18
	.word	0xc120a034	! t1_kref+0x4818:   	st	%f0, [%g2 + 0x34]
	.word	0xf6367ffa	! t1_kref+0x481c:   	sth	%i3, [%i1 - 6]
	.word	0x81800000	! t1_kref+0x4820:   	mov	%g0, %y
	.word	0xa1a30840	! t1_kref+0x4824:   	faddd	%f12, %f0, %f16
	.word	0x95a3cd22	! t1_kref+0x4828:   	fsmuld	%f15, %f2, %f10
	.word	0x96e2c01a	! t1_kref+0x482c:   	subccc	%o3, %i2, %o3
	.word	0xdb20a024	! t1_kref+0x4830:   	st	%f13, [%g2 + 0x24]
	.word	0x968ec01a	! t1_kref+0x4834:   	andcc	%i3, %i2, %o3
	.word	0x952ac00b	! t1_kref+0x4838:   	sll	%o3, %o3, %o2
	.word	0xd4267ff4	! t1_kref+0x483c:   	st	%o2, [%i1 - 0xc]
	.word	0x85b40a46	! t1_kref+0x4840:   	fpadd32	%f16, %f6, %f2
	.word	0x32480008	! t1_kref+0x4844:   	bne,a,pt	%icc, _kref+0x4864
	.word	0xee070019	! t1_kref+0x4848:   	ld	[%i4 + %i1], %l7
	.word	0xe1ee101c	! t1_kref+0x484c:   	prefetcha	%i0 + %i4, 16
	.word	0x97a0002b	! t1_kref+0x4850:   	fmovs	%f11, %f11
	.word	0xea00a00c	! t1_kref+0x4854:   	ld	[%g2 + 0xc], %l5
	.word	0x9abdefb6	! t1_kref+0x4858:   	xnorcc	%l7, 0xfb6, %o5
	.word	0xa1a30952	! t1_kref+0x485c:   	fmuld	%f12, %f18, %f16
	.word	0x87b14c64	! t1_kref+0x4860:   	fnors	%f5, %f4, %f3
	.word	0x963b000a	! t1_kref+0x4864:   	xnor	%o4, %o2, %o3
	.word	0x8585f316	! t1_kref+0x4868:   	wr	%l7, 0xfffff316, %ccr
	.word	0xd920a024	! t1_kref+0x486c:   	st	%f12, [%g2 + 0x24]
	.word	0xda363ff6	! t1_kref+0x4870:   	sth	%o5, [%i0 - 0xa]
	.word	0x83a018c0	! t1_kref+0x4874:   	fdtos	%f0, %f1
	.word	0x81a0192b	! t1_kref+0x4878:   	fstod	%f11, %f0
	.word	0xaa26ed06	! t1_kref+0x487c:   	sub	%i3, 0xd06, %l5
	.word	0x8da38d27	! t1_kref+0x4880:   	fsmuld	%f14, %f7, %f6
	.word	0x81a0110c	! t1_kref+0x4884:   	fxtod	%f12, %f0
	.word	0xacc24000	! t1_kref+0x4888:   	addccc	%o1, %g0, %l6
	.word	0x99b00e4e	! t1_kref+0x488c:   	fxnor	%f0, %f14, %f12
	.word	0x99a40850	! t1_kref+0x4890:   	faddd	%f16, %f16, %f12
	.word	0xac7b400a	! t1_kref+0x4894:   	sdiv	%o5, %o2, %l6
	.word	0xd610a016	! t1_kref+0x4898:   	lduh	[%g2 + 0x16], %o3
	.word	0x85b08ad2	! t1_kref+0x489c:   	fpsub32	%f2, %f18, %f2
	.word	0xd82e0000	! t1_kref+0x48a0:   	stb	%o4, [%i0]
	.word	0x9202c00b	! t1_kref+0x48a4:   	add	%o3, %o3, %o1
	.word	0xd62e3ff9	! t1_kref+0x48a8:   	stb	%o3, [%i0 - 7]
	.word	0xb4102019	! t1_kref+0x48ac:   	mov	0x19, %i2
	.word	0x9435c01b	! t1_kref+0x48b0:   	orn	%l7, %i3, %o2
	.word	0x9075c009	! t1_kref+0x48b4:   	udiv	%l7, %o1, %o0
	.word	0x91a000c6	! t1_kref+0x48b8:   	fnegd	%f6, %f8
	.word	0x2a480003	! t1_kref+0x48bc:   	bcs,a,pt	%icc, _kref+0x48c8
	.word	0x9fa30831	! t1_kref+0x48c0:   	fadds	%f12, %f17, %f15
	.word	0x89a1884e	! t1_kref+0x48c4:   	faddd	%f6, %f14, %f4
	.word	0x85b00cd0	! t1_kref+0x48c8:   	fnot2	%f16, %f2
	.word	0xf628a01c	! t1_kref+0x48cc:   	stb	%i3, [%g2 + 0x1c]
	.word	0xa88dc00b	! t1_kref+0x48d0:   	andcc	%l7, %o3, %l4
	.word	0xe7ee101a	! t1_kref+0x48d4:   	prefetcha	%i0 + %i2, 19
	.word	0xecbf5018	! t1_kref+0x48d8:   	stda	%l6, [%i5 + %i0]0x80
	.word	0xa892400b	! t1_kref+0x48dc:   	orcc	%o1, %o3, %l4
	.word	0x96f36016	! t1_kref+0x48e0:   	udivcc	%o5, 0x16, %o3
	.word	0xd600a03c	! t1_kref+0x48e4:   	ld	[%g2 + 0x3c], %o3
	.word	0xd24e401a	! t1_kref+0x48e8:   	ldsb	[%i1 + %i2], %o1
	.word	0xe120a004	! t1_kref+0x48ec:   	st	%f16, [%g2 + 4]
	.word	0xc129401c	! t1_kref+0x48f0:   	st	%fsr, [%g5 + %i4]
	.word	0x2c480004	! t1_kref+0x48f4:   	bneg,a,pt	%icc, _kref+0x4904
	.word	0xd45e6000	! t1_kref+0x48f8:   	ldx	[%i1], %o2
	.word	0x91b34280	! t1_kref+0x48fc:   	array32	%o5, %g0, %o0
	.word	0xea4e6003	! t1_kref+0x4900:   	ldsb	[%i1 + 3], %l5
	.word	0xd8d01018	! t1_kref+0x4904:   	ldsha	[%g0 + %i0]0x80, %o4
	.word	0xc1f6101b	! t1_kref+0x4908:   	casxa	[%i0]0x80, %i3, %g0
	.word	0xc500a034	! t1_kref+0x490c:   	ld	[%g2 + 0x34], %f2
	.word	0x99b08de0	! t1_kref+0x4910:   	fnands	%f2, %f0, %f12
	.word	0x83b38e6d	! t1_kref+0x4914:   	fxnors	%f14, %f13, %f1
	.word	0xdab01018	! t1_kref+0x4918:   	stha	%o5, [%g0 + %i0]0x80
	.word	0xda2e4000	! t1_kref+0x491c:   	stb	%o5, [%i1]
	.word	0xe4380018	! t1_kref+0x4920:   	std	%l2, [%g0 + %i0]
	.word	0x91b00240	! t1_kref+0x4924:   	array16	%g0, %g0, %o0
	.word	0xc5263fe0	! t1_kref+0x4928:   	st	%f2, [%i0 - 0x20]
	.word	0x87802082	! t1_kref+0x492c:   	mov	0x82, %asi
	.word	0x9aba4017	! t1_kref+0x4930:   	xnorcc	%o1, %l7, %o5
	.word	0xd86e6002	! t1_kref+0x4934:   	ldstub	[%i1 + 2], %o4
	.word	0xffee101a	! t1_kref+0x4938:   	prefetcha	%i0 + %i2, 31
	.word	0x9de3bfa0	! t1_kref+0x493c:   	save	%sp, -0x60, %sp
	.word	0x8096001d	! t1_kref+0x4940:   	orcc	%i0, %i5, %g0
	.word	0xa9eec01b	! t1_kref+0x4944:   	restore	%i3, %i3, %l4
	.word	0xab400000	! t1_kref+0x4948:   	mov	%y, %l5
	.word	0xda28a004	! t1_kref+0x494c:   	stb	%o5, [%g2 + 4]
	.word	0xa1b30ac4	! t1_kref+0x4950:   	fpsub32	%f12, %f4, %f16
	.word	0xd420a01c	! t1_kref+0x4954:   	st	%o2, [%g2 + 0x1c]
	.word	0xee063ff4	! t1_kref+0x4958:   	ld	[%i0 - 0xc], %l7
	.word	0xd2363ffa	! t1_kref+0x495c:   	sth	%o1, [%i0 - 6]
	.word	0x2b1ede5d	! t1_kref+0x4960:   	sethi	%hi(0x7b797400), %l5
	.word	0x92168008	! t1_kref+0x4964:   	or	%i2, %o0, %o1
	.word	0x3f480003	! t1_kref+0x4968:   	fbo,a,pt	%fcc0, _kref+0x4974
	.word	0xae334008	! t1_kref+0x496c:   	orn	%o5, %o0, %l7
	.word	0x28480001	! t1_kref+0x4970:   	bleu,a,pt	%icc, _kref+0x4974
	.word	0x81a08948	! t1_kref+0x4974:   	fmuld	%f2, %f8, %f0
	.word	0x8143e04c	! t1_kref+0x4978:   	membar	0x4c
	.word	0xec3e7ff8	! t1_kref+0x497c:   	std	%l6, [%i1 - 8]
	.word	0xa82dc00c	! t1_kref+0x4980:   	andn	%l7, %o4, %l4
	.word	0xdb86501c	! t1_kref+0x4984:   	lda	[%i1 + %i4]0x80, %f13
	.word	0x9273378a	! t1_kref+0x4988:   	udiv	%o4, -0x876, %o1
	.word	0x9925c01b	! t1_kref+0x498c:   	mulscc	%l7, %i3, %o4
	.word	0x94fe800d	! t1_kref+0x4990:   	sdivcc	%i2, %o5, %o2
	.word	0xd620a03c	! t1_kref+0x4994:   	st	%o3, [%g2 + 0x3c]
	.word	0x89b4072d	! t1_kref+0x4998:   	fmuld8ulx16	%f16, %f13, %f4
	.word	0x91a01042	! t1_kref+0x499c:   	fdtox	%f2, %f8
	.word	0x95a48d23	! t1_kref+0x49a0:   	fsmuld	%f18, %f3, %f10
	.word	0x9a0a77df	! t1_kref+0x49a4:   	and	%o1, -0x821, %o5
	.word	0xab12e622	! t1_kref+0x49a8:   	taddcctv	%o3, 0x622, %l5
	.word	0x97b00c20	! t1_kref+0x49ac:   	fzeros	%f11
	.word	0xe06e6011	! t1_kref+0x49b0:   	ldstub	[%i1 + 0x11], %l0
	.word	0x908a8000	! t1_kref+0x49b4:   	andcc	%o2, %g0, %o0
	.word	0xd830a03c	! t1_kref+0x49b8:   	sth	%o4, [%g2 + 0x3c]
	.word	0xede6500b	! t1_kref+0x49bc:   	casa	[%i1]0x80, %o3, %l6
	.word	0x81a14928	! t1_kref+0x49c0:   	fmuls	%f5, %f8, %f0
	.word	0x24480002	! t1_kref+0x49c4:   	ble,a,pt	%icc, _kref+0x49cc
	.word	0xd010a016	! t1_kref+0x49c8:   	lduh	[%g2 + 0x16], %o0
	.word	0xec3f4018	! t1_kref+0x49cc:   	std	%l6, [%i5 + %i0]
	.word	0x81b206c2	! t1_kref+0x49d0:   	fmul8sux16	%f8, %f2, %f0
	sethi	%hi(2f), %o7
	.word	0xe40be1ec	! t1_kref+0x49d8:   	ldub	[%o7 + 0x1ec], %l2
	.word	0xa41ca00c	! t1_kref+0x49dc:   	xor	%l2, 0xc, %l2
	.word	0xe42be1ec	! t1_kref+0x49e0:   	stb	%l2, [%o7 + 0x1ec]
	.word	0x81dbe1ec	! t1_kref+0x49e4:   	flush	%o7 + 0x1ec
	.word	0x91a00144	! t1_kref+0x49e8:   	fabsd	%f4, %f8
2:	.word	0xd408a00f	! t1_kref+0x49ec:   	ldub	[%g2 + 0xf], %o2
	.word	0x94337155	! t1_kref+0x49f0:   	orn	%o5, -0xeab, %o2
	.word	0x9afb0000	! t1_kref+0x49f4:   	sdivcc	%o4, %g0, %o5
	.word	0xe43e6008	! t1_kref+0x49f8:   	std	%l2, [%i1 + 8]
	.word	0xd00e6019	! t1_kref+0x49fc:   	ldub	[%i1 + 0x19], %o0
	.word	0x2b480005	! t1_kref+0x4a00:   	fbug,a,pt	%fcc0, _kref+0x4a14
	.word	0xda00a03c	! t1_kref+0x4a04:   	ld	[%g2 + 0x3c], %o5
	.word	0xda30a01e	! t1_kref+0x4a08:   	sth	%o5, [%g2 + 0x1e]
	.word	0x22480002	! t1_kref+0x4a0c:   	be,a,pt	%icc, _kref+0x4a14
	.word	0x9263257a	! t1_kref+0x4a10:   	subc	%o4, 0x57a, %o1
	.word	0xda28a01e	! t1_kref+0x4a14:   	stb	%o5, [%g2 + 0x1e]
	.word	0x9a0a6c4c	! t1_kref+0x4a18:   	and	%o1, 0xc4c, %o5
	sethi	%hi(2f), %o7
	.word	0xe40be250	! t1_kref+0x4a20:   	ldub	[%o7 + 0x250], %l2
	.word	0xa41ca00c	! t1_kref+0x4a24:   	xor	%l2, 0xc, %l2
	.word	0xe42be250	! t1_kref+0x4a28:   	stb	%l2, [%o7 + 0x250]
	.word	0x81dbe250	! t1_kref+0x4a2c:   	flush	%o7 + 0x250
	.word	0x85a018c6	! t1_kref+0x4a30:   	fdtos	%f6, %f2
	.word	0x9db2870f	! t1_kref+0x4a34:   	fmuld8sux16	%f10, %f15, %f14
	.word	0x9da40828	! t1_kref+0x4a38:   	fadds	%f16, %f8, %f14
	.word	0x99a00552	! t1_kref+0x4a3c:   	fsqrtd	%f18, %f12
	.word	0x9362801b	! t1_kref+0x4a40:   	movue	%fcc0, %i3, %o1
	.word	0x91a44d25	! t1_kref+0x4a44:   	fsmuld	%f17, %f5, %f8
	.word	0x948de8cc	! t1_kref+0x4a48:   	andcc	%l7, 0x8cc, %o2
	.word	0xd5000018	! t1_kref+0x4a4c:   	ld	[%g0 + %i0], %f10
2:	.word	0x92fb7840	! t1_kref+0x4a50:   	sdivcc	%o5, -0x7c0, %o1
	.word	0xab3b6017	! t1_kref+0x4a54:   	sra	%o5, 0x17, %l5
	.word	0x98fea3db	! t1_kref+0x4a58:   	sdivcc	%i2, 0x3db, %o4
	.word	0xd00e3ffc	! t1_kref+0x4a5c:   	ldub	[%i0 - 4], %o0
	.word	0x988ac01b	! t1_kref+0x4a60:   	andcc	%o3, %i3, %o4
	.word	0xa5b38dce	! t1_kref+0x4a64:   	fnand	%f14, %f14, %f18
	.word	0x83a4492d	! t1_kref+0x4a68:   	fmuls	%f17, %f13, %f1
	.word	0xae82b506	! t1_kref+0x4a6c:   	addcc	%o2, -0xafa, %l7
	.word	0xea56601e	! t1_kref+0x4a70:   	ldsh	[%i1 + 0x1e], %l5
	.word	0xd22e4000	! t1_kref+0x4a74:   	stb	%o1, [%i1]
	.word	0xd11f4019	! t1_kref+0x4a78:   	ldd	[%i5 + %i1], %f8
	.word	0x969b7da5	! t1_kref+0x4a7c:   	xorcc	%o5, -0x25b, %o3
	.word	0x26480005	! t1_kref+0x4a80:   	bl,a,pt	%icc, _kref+0x4a94
	.word	0xd40e7ffa	! t1_kref+0x4a84:   	ldub	[%i1 - 6], %o2
	.word	0x20800001	! t1_kref+0x4a88:   	bn,a	_kref+0x4a8c
	.word	0x8da00546	! t1_kref+0x4a8c:   	fsqrtd	%f6, %f6
	.word	0x85a30950	! t1_kref+0x4a90:   	fmuld	%f12, %f16, %f2
	.word	0x81580000	! t1_kref+0x4a94:   	flushw
	.word	0x9b26a515	! t1_kref+0x4a98:   	mulscc	%i2, 0x515, %o5
	.word	0x85a01a46	! t1_kref+0x4a9c:   	fdtoi	%f6, %f2
	.word	0xa1b00f4e	! t1_kref+0x4aa0:   	fornot1	%f0, %f14, %f16
	.word	0x905a000a	! t1_kref+0x4aa4:   	smul	%o0, %o2, %o0
	.word	0x93b200cb	! t1_kref+0x4aa8:   	edge16l	%o0, %o3, %o1
	.word	0xd9064000	! t1_kref+0x4aac:   	ld	[%i1], %f12
	.word	0x8da00130	! t1_kref+0x4ab0:   	fabss	%f16, %f6
	.word	0x965eaeb2	! t1_kref+0x4ab4:   	smul	%i2, 0xeb2, %o3
	.word	0x9122400a	! t1_kref+0x4ab8:   	mulscc	%o1, %o2, %o0
	.word	0xd848a024	! t1_kref+0x4abc:   	ldsb	[%g2 + 0x24], %o4
	call	SYM(t1_subr2)
	.word	0xdab01018	! t1_kref+0x4ac4:   	stha	%o5, [%g0 + %i0]0x80
	.word	0xc52031f8	! t1_kref+0x4ac8:   	st	%f2, [%g0 - 0xe08]
	.word	0xc02e4000	! t1_kref+0x4acc:   	clrb	[%i1]
	.word	0x9fc00004	! t1_kref+0x4ad0:   	call	%g0 + %g4
	.word	0xad18000b	! t1_kref+0x4ad4:   	tsubcctv	%g0, %o3, %l6
	.word	0x9ba1c930	! t1_kref+0x4ad8:   	fmuls	%f7, %f16, %f13
	.word	0xf6280019	! t1_kref+0x4adc:   	stb	%i3, [%g0 + %i1]
	.word	0xd8366010	! t1_kref+0x4ae0:   	sth	%o4, [%i1 + 0x10]
	.word	0xaf3a6017	! t1_kref+0x4ae4:   	sra	%o1, 0x17, %l7
	.word	0x99400000	! t1_kref+0x4ae8:   	mov	%y, %o4
	.word	0x95b10ac2	! t1_kref+0x4aec:   	fpsub32	%f4, %f2, %f10
	.word	0x8da9404c	! t1_kref+0x4af0:   	fmovdug	%fcc0, %f12, %f6
	.word	0x9de3bfa0	! t1_kref+0x4af4:   	save	%sp, -0x60, %sp
	.word	0xb236e2c3	! t1_kref+0x4af8:   	orn	%i3, 0x2c3, %i1
	.word	0xadeea175	! t1_kref+0x4afc:   	restore	%i2, 0x175, %l6
	.word	0x83ab002d	! t1_kref+0x4b00:   	fmovsuge	%fcc0, %f13, %f1
	.word	0x27480003	! t1_kref+0x4b04:   	fbul,a,pt	%fcc0, _kref+0x4b10
	.word	0x89a1084a	! t1_kref+0x4b08:   	faddd	%f4, %f10, %f4
	.word	0x95b28200	! t1_kref+0x4b0c:   	array8	%o2, %g0, %o2
	.word	0xd300a024	! t1_kref+0x4b10:   	ld	[%g2 + 0x24], %f9
	.word	0x94a26414	! t1_kref+0x4b14:   	subcc	%o1, 0x414, %o2
	.word	0x948eb4da	! t1_kref+0x4b18:   	andcc	%i2, -0xb26, %o2
	.word	0xaabef3b7	! t1_kref+0x4b1c:   	xnorcc	%i3, -0xc49, %l5
	.word	0x95a308cc	! t1_kref+0x4b20:   	fsubd	%f12, %f12, %f10
	.word	0x93b5c12c	! t1_kref+0x4b24:   	edge32n	%l7, %o4, %o1
	.word	0xd8500018	! t1_kref+0x4b28:   	ldsh	[%g0 + %i0], %o4
	.word	0xe506001c	! t1_kref+0x4b2c:   	ld	[%i0 + %i4], %f18
	.word	0x9692c01b	! t1_kref+0x4b30:   	orcc	%o3, %i3, %o3
	.word	0xaa0dc01a	! t1_kref+0x4b34:   	and	%l7, %i2, %l5
	.word	0x3d480006	! t1_kref+0x4b38:   	fbule,a,pt	%fcc0, _kref+0x4b50
	.word	0x94bb692d	! t1_kref+0x4b3c:   	xnorcc	%o5, 0x92d, %o2
	.word	0x3c480005	! t1_kref+0x4b40:   	bpos,a,pt	%icc, _kref+0x4b54
	.word	0xac720000	! t1_kref+0x4b44:   	udiv	%o0, %g0, %l6
	.word	0x94beba51	! t1_kref+0x4b48:   	xnorcc	%i2, -0x5af, %o2
	.word	0x92fafd7d	! t1_kref+0x4b4c:   	sdivcc	%o3, -0x283, %o1
	.word	0x81828000	! t1_kref+0x4b50:   	wr	%o2, %g0, %y
	.word	0xec50a026	! t1_kref+0x4b54:   	ldsh	[%g2 + 0x26], %l6
	.word	0xd300a02c	! t1_kref+0x4b58:   	ld	[%g2 + 0x2c], %f9
	.word	0x91a488a7	! t1_kref+0x4b5c:   	fsubs	%f18, %f7, %f8
	.word	0x98e2e0e6	! t1_kref+0x4b60:   	subccc	%o3, 0xe6, %o4
	.word	0x9bb5c109	! t1_kref+0x4b64:   	edge32	%l7, %o1, %o5
	.word	0x94e5c01b	! t1_kref+0x4b68:   	subccc	%l7, %i3, %o2
	.word	0xa1a28944	! t1_kref+0x4b6c:   	fmuld	%f10, %f4, %f16
	.word	0xf630a024	! t1_kref+0x4b70:   	sth	%i3, [%g2 + 0x24]
	.word	0x95b30c80	! t1_kref+0x4b74:   	fandnot2	%f12, %f0, %f10
	.word	0x8143c000	! t1_kref+0x4b78:   	stbar
	.word	0x96fde352	! t1_kref+0x4b7c:   	sdivcc	%l7, 0x352, %o3
	.word	0x25800008	! t1_kref+0x4b80:   	fblg,a	_kref+0x4ba0
	.word	0xda26201c	! t1_kref+0x4b84:   	st	%o5, [%i0 + 0x1c]
	.word	0x9da30d2e	! t1_kref+0x4b88:   	fsmuld	%f12, %f14, %f14
	.word	0xe8c6101c	! t1_kref+0x4b8c:   	ldswa	[%i0 + %i4]0x80, %l4
	.word	0x3f480005	! t1_kref+0x4b90:   	fbo,a,pt	%fcc0, _kref+0x4ba4
	.word	0x91400000	! t1_kref+0x4b94:   	mov	%y, %o0
	.word	0xd420a024	! t1_kref+0x4b98:   	st	%o2, [%g2 + 0x24]
	.word	0x8db08a8e	! t1_kref+0x4b9c:   	fpsub16	%f2, %f14, %f6
	.word	0x8143c000	! t1_kref+0x4ba0:   	stbar
	.word	0xc026001c	! t1_kref+0x4ba4:   	clr	[%i0 + %i4]
	.word	0x94880008	! t1_kref+0x4ba8:   	andcc	%g0, %o0, %o2
	.word	0xd66e4000	! t1_kref+0x4bac:   	ldstub	[%i1], %o3
	.word	0x9085eaa2	! t1_kref+0x4bb0:   	addcc	%l7, 0xaa2, %o0
	.word	0x8143e040	! t1_kref+0x4bb4:   	membar	0x40
	.word	0x86102017	! t1_kref+0x4bb8:   	mov	0x17, %g3
	.word	0x86a0e001	! t1_kref+0x4bbc:   	subcc	%g3, 1, %g3
	.word	0x22800001	! t1_kref+0x4bc0:   	be,a	_kref+0x4bc4
	.word	0xae8e8017	! t1_kref+0x4bc4:   	andcc	%i2, %l7, %l7
	.word	0xc807bfe4	! t1_kref+0x4bc8:   	ld	[%fp - 0x1c], %g4
	.word	0xd630a02c	! t1_kref+0x4bcc:   	sth	%o3, [%g2 + 0x2c]
	.word	0x9612800b	! t1_kref+0x4bd0:   	or	%o2, %o3, %o3
	.word	0x968af94c	! t1_kref+0x4bd4:   	andcc	%o3, -0x6b4, %o3
	.word	0x9de3bfa0	! t1_kref+0x4bd8:   	save	%sp, -0x60, %sp
	.word	0x9bee672c	! t1_kref+0x4bdc:   	restore	%i1, 0x72c, %o5
	.word	0xa888001a	! t1_kref+0x4be0:   	andcc	%g0, %i2, %l4
	.word	0x3c800006	! t1_kref+0x4be4:   	bpos,a	_kref+0x4bfc
	.word	0x89b00a42	! t1_kref+0x4be8:   	fpadd32	%f0, %f2, %f4
	.word	0x24480005	! t1_kref+0x4bec:   	ble,a,pt	%icc, _kref+0x4c00
	.word	0x8143c000	! t1_kref+0x4bf0:   	stbar
	.word	0xac32c00d	! t1_kref+0x4bf4:   	orn	%o3, %o5, %l6
	.word	0x8da01092	! t1_kref+0x4bf8:   	fxtos	%f18, %f6
	.word	0x95b04df1	! t1_kref+0x4bfc:   	fnands	%f1, %f17, %f10
	.word	0x91652339	! t1_kref+0x4c00:   	movleu	%icc, 0x339, %o0
	.word	0x9de3bfa0	! t1_kref+0x4c04:   	save	%sp, -0x60, %sp
	.word	0xa9e832f0	! t1_kref+0x4c08:   	restore	%g0, -0xd10, %l4
	.word	0x98e27a80	! t1_kref+0x4c0c:   	subccc	%o1, -0x580, %o4
	.word	0x8583401a	! t1_kref+0x4c10:   	wr	%o5, %i2, %ccr
	.word	0xd436200e	! t1_kref+0x4c14:   	sth	%o2, [%i0 + 0xe]
	call	SYM(t1_subr3)
	.word	0xd91fbf80	! t1_kref+0x4c1c:   	ldd	[%fp - 0x80], %f12
	.word	0x8186c000	! t1_kref+0x4c20:   	wr	%i3, %g0, %y
	.word	0x87a2c8a9	! t1_kref+0x4c24:   	fsubs	%f11, %f9, %f3
	.word	0xd0062004	! t1_kref+0x4c28:   	ld	[%i0 + 4], %o0
	.word	0x81580000	! t1_kref+0x4c2c:   	flushw
	.word	0x9a5a000d	! t1_kref+0x4c30:   	smul	%o0, %o5, %o5
	.word	0xd648a02c	! t1_kref+0x4c34:   	ldsb	[%g2 + 0x2c], %o3
	.word	0x3f480003	! t1_kref+0x4c38:   	fbo,a,pt	%fcc0, _kref+0x4c44
	.word	0xa5b18a6f	! t1_kref+0x4c3c:   	fpadd32s	%f6, %f15, %f18
	.word	0x89b18d2a	! t1_kref+0x4c40:   	fandnot1s	%f6, %f10, %f4
	.word	0xcd264000	! t1_kref+0x4c44:   	st	%f6, [%i1]
	.word	0xd19eda18	! t1_kref+0x4c48:   	ldda	[%i3 + %i0]0xd0, %f8
	.word	0x953ae017	! t1_kref+0x4c4c:   	sra	%o3, 0x17, %o2
	.word	0x9a0a001b	! t1_kref+0x4c50:   	and	%o0, %i3, %o5
	.word	0xf620a004	! t1_kref+0x4c54:   	st	%i3, [%g2 + 4]
	.word	0xd0ce9019	! t1_kref+0x4c58:   	ldsba	[%i2 + %i1]0x80, %o0
	.word	0x95408000	! t1_kref+0x4c5c:   	mov	%ccr, %o2
	.word	0x8143e00e	! t1_kref+0x4c60:   	membar	0xe
	.word	0xd410a03e	! t1_kref+0x4c64:   	lduh	[%g2 + 0x3e], %o2
	.word	0x941b7fda	! t1_kref+0x4c68:   	xor	%o5, -0x26, %o2
	.word	0x973a0017	! t1_kref+0x4c6c:   	sra	%o0, %l7, %o3
	.word	0xd5be5000	! t1_kref+0x4c70:   	stda	%f10, [%i1]0x80
	.word	0x95a00126	! t1_kref+0x4c74:   	fabss	%f6, %f10
	.word	0xd2080019	! t1_kref+0x4c78:   	ldub	[%g0 + %i1], %o1
	.word	0xab06c00b	! t1_kref+0x4c7c:   	taddcc	%i3, %o3, %l5
	.word	0x85b48c84	! t1_kref+0x4c80:   	fandnot2	%f18, %f4, %f2
	.word	0x95b40a46	! t1_kref+0x4c84:   	fpadd32	%f16, %f6, %f10
	call	SYM(t1_subr3)
	.word	0xa1b08aa1	! t1_kref+0x4c8c:   	fpsub16s	%f2, %f1, %f16
	.word	0x98baaf25	! t1_kref+0x4c90:   	xnorcc	%o2, 0xf25, %o4
	.word	0xd41e3ff8	! t1_kref+0x4c94:   	ldd	[%i0 - 8], %o2
	.word	0x32480004	! t1_kref+0x4c98:   	bne,a,pt	%icc, _kref+0x4ca8
	.word	0xd99e1a5d	! t1_kref+0x4c9c:   	ldda	[%i0 + %i5]0xd2, %f12
	.word	0x92bb64dc	! t1_kref+0x4ca0:   	xnorcc	%o5, 0x4dc, %o1
	.word	0x81a00132	! t1_kref+0x4ca4:   	fabss	%f18, %f0
	.word	0xa5a48846	! t1_kref+0x4ca8:   	faddd	%f18, %f6, %f18
	.word	0x9022800b	! t1_kref+0x4cac:   	sub	%o2, %o3, %o0
	.word	0x8da10944	! t1_kref+0x4cb0:   	fmuld	%f4, %f4, %f6
	.word	0xc920a02c	! t1_kref+0x4cb4:   	st	%f4, [%g2 + 0x2c]
	.word	0x98a30000	! t1_kref+0x4cb8:   	subcc	%o4, %g0, %o4
	.word	0x92baff53	! t1_kref+0x4cbc:   	xnorcc	%o3, -0xad, %o1
	.word	0x99b106c2	! t1_kref+0x4cc0:   	fmul8sux16	%f4, %f2, %f12
	.word	0x93b30aa9	! t1_kref+0x4cc4:   	fpsub16s	%f12, %f9, %f9
	.word	0x85b00ea0	! t1_kref+0x4cc8:   	fsrc1s	%f0, %f2
	.word	0x87b28ea0	! t1_kref+0x4ccc:   	fsrc1s	%f10, %f3
	.word	0xd400a034	! t1_kref+0x4cd0:   	ld	[%g2 + 0x34], %o2
	.word	0x91a00044	! t1_kref+0x4cd4:   	fmovd	%f4, %f8
	.word	0xeece1000	! t1_kref+0x4cd8:   	ldsba	[%i0]0x80, %l7
	.word	0x33480008	! t1_kref+0x4cdc:   	fbe,a,pt	%fcc0, _kref+0x4cfc
	.word	0x83b007a6	! t1_kref+0x4ce0:   	fpackfix	%f6, %f1
	.word	0x8fa01a21	! t1_kref+0x4ce4:   	fstoi	%f1, %f7
	.word	0x91b30aca	! t1_kref+0x4ce8:   	fpsub32	%f12, %f10, %f8
	.word	0xd66e3fed	! t1_kref+0x4cec:   	ldstub	[%i0 - 0x13], %o3
	.word	0x81a01a31	! t1_kref+0x4cf0:   	fstoi	%f17, %f0
	.word	0x91b200ea	! t1_kref+0x4cf4:   	edge16ln	%o0, %o2, %o0
	.word	0x85a38842	! t1_kref+0x4cf8:   	faddd	%f14, %f2, %f2
	.word	0xac1a74d2	! t1_kref+0x4cfc:   	xor	%o1, -0xb2e, %l6
	.word	0xe43e4000	! t1_kref+0x4d00:   	std	%l2, [%i1]
	.word	0x9a88257d	! t1_kref+0x4d04:   	andcc	%g0, 0x57d, %o5
	.word	0x89a00528	! t1_kref+0x4d08:   	fsqrts	%f8, %f4
	.word	0xabb405c0	! t1_kref+0x4d0c:   	fcmpeq32	%f16, %f0, %l5
	.word	0x9a42a187	! t1_kref+0x4d10:   	addc	%o2, 0x187, %o5
	.word	0x95b10992	! t1_kref+0x4d14:   	bshuffle	%f4, %f18, %f10
	.word	0xd82e8019	! t1_kref+0x4d18:   	stb	%o4, [%i2 + %i1]
	.word	0x81dd64a5	! t1_kref+0x4d1c:   	flush	%l5 + 0x4a5
	.word	0x20480007	! t1_kref+0x4d20:   	bn,a,pt	%icc, _kref+0x4d3c
	.word	0x9bb6c34b	! t1_kref+0x4d24:   	alignaddrl	%i3, %o3, %o5
	.word	0x81a90a4c	! t1_kref+0x4d28:   	fcmpd	%fcc0, %f4, %f12
	.word	0xa8823497	! t1_kref+0x4d2c:   	addcc	%o0, -0xb69, %l4
	.word	0xa1a01901	! t1_kref+0x4d30:   	fitod	%f1, %f16
	.word	0x9a0a001a	! t1_kref+0x4d34:   	and	%o0, %i2, %o5
	.word	0x85a01900	! t1_kref+0x4d38:   	fitod	%f0, %f2
	.word	0xae62ec78	! t1_kref+0x4d3c:   	subc	%o3, 0xc78, %l7
	.word	0xda6e8018	! t1_kref+0x4d40:   	ldstub	[%i2 + %i0], %o5
	.word	0xd8562004	! t1_kref+0x4d44:   	ldsh	[%i0 + 4], %o4
	.word	0xab33601a	! t1_kref+0x4d48:   	srl	%o5, 0x1a, %l5
	.word	0xaafea259	! t1_kref+0x4d4c:   	sdivcc	%i2, 0x259, %l5
	call	SYM(t1_subr1)
	.word	0x9da44d28	! t1_kref+0x4d54:   	fsmuld	%f17, %f8, %f14
	.word	0x9322a588	! t1_kref+0x4d58:   	mulscc	%o2, 0x588, %o1
	.word	0x34480005	! t1_kref+0x4d5c:   	bg,a,pt	%icc, _kref+0x4d70
	.word	0xaa32f775	! t1_kref+0x4d60:   	orn	%o3, -0x88b, %l5
	.word	0xa8d6c00d	! t1_kref+0x4d64:   	umulcc	%i3, %o5, %l4
	.word	0xea063fe0	! t1_kref+0x4d68:   	ld	[%i0 - 0x20], %l5
	.word	0x91b38452	! t1_kref+0x4d6c:   	fcmpne16	%f14, %f18, %o0
	sethi	%hi(2f), %o7
	.word	0xe40be184	! t1_kref+0x4d74:   	ldub	[%o7 + 0x184], %l2
	.word	0xa41ca00c	! t1_kref+0x4d78:   	xor	%l2, 0xc, %l2
	.word	0xe42be184	! t1_kref+0x4d7c:   	stb	%l2, [%o7 + 0x184]
	.word	0x81dbe184	! t1_kref+0x4d80:   	flush	%o7 + 0x184
2:	.word	0xe0f6101d	! t1_kref+0x4d84:   	stxa	%l0, [%i0 + %i5]0x80
	.word	0x85a08d31	! t1_kref+0x4d88:   	fsmuld	%f2, %f17, %f2
	.word	0xd41e4000	! t1_kref+0x4d8c:   	ldd	[%i1], %o2
	.word	0xac883e65	! t1_kref+0x4d90:   	andcc	%g0, -0x19b, %l6
	.word	0x9266800a	! t1_kref+0x4d94:   	subc	%i2, %o2, %o1
	.word	0x2e480004	! t1_kref+0x4d98:   	bvs,a,pt	%icc, _kref+0x4da8
	.word	0x81834000	! t1_kref+0x4d9c:   	wr	%o5, %g0, %y
	.word	0xa5a308c0	! t1_kref+0x4da0:   	fsubd	%f12, %f0, %f18
	.word	0x9a632f33	! t1_kref+0x4da4:   	subc	%o4, 0xf33, %o5
	.word	0x9520000a	! t1_kref+0x4da8:   	mulscc	%g0, %o2, %o2
	.word	0xec080019	! t1_kref+0x4dac:   	ldub	[%g0 + %i1], %l6
	.word	0x3e480002	! t1_kref+0x4db0:   	bvc,a,pt	%icc, _kref+0x4db8
	.word	0x963027a0	! t1_kref+0x4db4:   	orn	%g0, 0x7a0, %o3
	.word	0x9632800c	! t1_kref+0x4db8:   	orn	%o2, %o4, %o3
	.word	0x9da0190b	! t1_kref+0x4dbc:   	fitod	%f11, %f14
	.word	0x95b40731	! t1_kref+0x4dc0:   	fmuld8ulx16	%f16, %f17, %f10
	.word	0x9a85c017	! t1_kref+0x4dc4:   	addcc	%l7, %l7, %o5
	.word	0x95418000	! t1_kref+0x4dc8:   	mov	%fprs, %o2
	.word	0x8143e04b	! t1_kref+0x4dcc:   	membar	0x4b
	.word	0x85aac050	! t1_kref+0x4dd0:   	fmovdge	%fcc0, %f16, %f2
	.word	0x85a40950	! t1_kref+0x4dd4:   	fmuld	%f16, %f16, %f2
	.word	0x38480002	! t1_kref+0x4dd8:   	bgu,a,pt	%icc, _kref+0x4de0
	.word	0xaeaa000d	! t1_kref+0x4ddc:   	andncc	%o0, %o5, %l7
	.word	0xae72f040	! t1_kref+0x4de0:   	udiv	%o3, -0xfc0, %l7
	.word	0x35480001	! t1_kref+0x4de4:   	fbue,a,pt	%fcc0, _kref+0x4de8
	.word	0xadb5c280	! t1_kref+0x4de8:   	array32	%l7, %g0, %l6
	.word	0xd4267ff0	! t1_kref+0x4dec:   	st	%o2, [%i1 - 0x10]
	.word	0xd420a00c	! t1_kref+0x4df0:   	st	%o2, [%g2 + 0xc]
	.word	0x971a317e	! t1_kref+0x4df4:   	tsubcctv	%o0, -0xe82, %o3
	.word	0xd09f5019	! t1_kref+0x4df8:   	ldda	[%i5 + %i1]0x80, %o0
	.word	0xd9be584b	! t1_kref+0x4dfc:   	stda	%f12, [%i1 + %o3]0xc2
	.word	0x81800000	! t1_kref+0x4e00:   	mov	%g0, %y
	.word	0x9a9275dd	! t1_kref+0x4e04:   	orcc	%o1, -0xa23, %o5
	.word	0x85a0012b	! t1_kref+0x4e08:   	fabss	%f11, %f2
	.word	0x9fc10000	! t1_kref+0x4e0c:   	call	%g4
	.word	0x95b084ce	! t1_kref+0x4e10:   	fcmpne32	%f2, %f14, %o2
	.word	0x30480003	! t1_kref+0x4e14:   	ba,a,pt	%icc, _kref+0x4e20
	.word	0xe81e7fe8	! t1_kref+0x4e18:   	ldd	[%i1 - 0x18], %l4
	.word	0x01000000	! t1_kref+0x4e1c:   	nop
	call	SYM(_kaos_done)
	.word	0x01000000	! t1_kref+0x4e24:   	nop
	KGLOBAL(t1_ktbl_end)
t1_ktbl_end:
t1_ktbl_page_end:

KTEXT_MODULE(t1_module_subr0, 0x729be000)
.seg "text"
t1_subr0_page_begin:
	.skip 8184
.global _t1_subr0; ENTRY(t1_subr0)
	.word	0xa6844012	! t1_subr0+0x0:   	addcc	%l1, %l2, %l3
	.word	0x81c3e008	! t1_subr0+0x4:   	retl
	.word	0xaa64c014	! t1_subr0+0x8:   	subc	%l3, %l4, %l5
t1_subr0_page_end:

KTEXT_MODULE(t1_module_subr1, 0x729ee000)
.seg "text"
t1_subr1_page_begin:
	.skip 8180
.global _t1_subr1; ENTRY(t1_subr1)
	.word	0x9de3bfa0	! t1_subr1+0x0:   	save	%sp, -0x60, %sp
	.word	0xb29eaa5a	! t1_subr1+0x4:   	xorcc	%i2, 0xa5a, %i1
	.word	0x81c7e008	! t1_subr1+0x8:   	ret
	.word	0xa7ee6001	! t1_subr1+0xc:   	restore	%i1, 1, %l3
t1_subr1_page_end:

KTEXT_MODULE(t1_module_subr2, 0x728ca000)
.seg "text"
t1_subr2_page_begin:
	.skip 8188
.global _t1_subr2; ENTRY(t1_subr2)
	.word	0x9de3bfa0	! t1_subr2+0x0:   	save	%sp, -0x60, %sp
	.word	0xb2066001	! t1_subr2+0x4:   	add	%i1, 1, %i1
	.word	0x81c7e008	! t1_subr2+0x8:   	ret
	.word	0xa3ee6001	! t1_subr2+0xc:   	restore	%i1, 1, %l1
t1_subr2_page_end:

KTEXT_MODULE(t1_module_subr3, 0x72314000)
.seg "text"
t1_subr3_page_begin:
	.skip 8180
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
!  Total operations: 4799  
!
!  Operation frequencies
!
!  name               exp    obs
!  ldsb              0.99   1.04
!  ldub              1.36   1.52
!  ldsh              0.88   0.85
!  lduh              0.09   0.04
!  ld                1.33   1.50
!  ldd               0.36   0.46
!  swap              0.07   0.02
!  ldstub            1.23   1.35
!  stb               0.99   1.04
!  sth               1.07   1.06
!  st                0.88   1.02
!  std               1.36   1.25
!  add               0.42   0.48
!  addcc             0.95   1.10
!  addx              0.42   0.54
!  addxcc            0.12   0.15
!  taddcc            0.13   0.21
!  taddcctv          0.15   0.17
!  sub               0.82   0.56
!  subcc             0.49   0.52
!  subx              0.59   0.63
!  subxcc            0.61   0.52
!  tsubcc            0.03   0.04
!  tsubcctv          0.22   0.25
!  mulscc            1.30   1.44
!  and               0.87   0.90
!  andcc             0.79   1.08
!  andn              0.15   0.23
!  andncc            0.62   0.90
!  or                1.10   0.85
!  orcc              0.58   0.71
!  orn               1.15   1.29
!  orncc             0.09   0.17
!  xor               0.80   0.75
!  xorcc             0.46   0.56
!  xnor              0.58   0.71
!  xnorcc            1.23   1.31
!  sll               1.18   1.00
!  srl               0.53   0.50
!  sra               0.96   0.96
!  unimp             0.02   0.04
!  umul              0.06   0.04
!  smul              0.91   0.94
!  udiv              0.99   0.88
!  sdiv              0.95   0.96
!  umulcc            0.47   0.31
!  smulcc            0.21   0.25
!  udivcc            0.66   0.81
!  sdivcc            1.34   1.46
!  rdy               1.17   1.15
!  wry               0.37   0.42
!  bicc              1.05   0.75
!  sethi             0.68   0.75
!  jmpl              1.19   1.19
!  call              0.69   0.52
!  ticc              0.00   0.00
!  flush             0.78   0.88
!  save              0.78   0.60
!  restore           0.49   0.00
!  stbar             0.59   0.77
!  ldf               1.11   1.04
!  lddf              0.45   0.42
!  stf               1.03   1.06
!  stdf              0.46   0.46
!  fadds             0.74   0.77
!  fsubs             0.32   0.29
!  fmuls             0.84   0.96
!  fdivs             0.28   0.31
!  faddd             1.00   0.96
!  fsubd             0.49   0.52
!  fmuld             1.07   1.21
!  fdivd             0.40   0.46
!  faddq             0.00   0.00
!  fsubq             0.00   0.00
!  fmulq             0.00   0.00
!  fdivq             0.00   0.00
!  fsmuld            1.34   1.38
!  fdmulq            0.00   0.00
!  fitos             0.01   0.00
!  fitod             1.11   1.33
!  fitoq             0.00   0.00
!  fstoi             1.25   1.13
!  fstod             0.79   0.96
!  fstoq             0.00   0.00
!  fdtoi             0.59   0.56
!  fdtos             0.62   0.52
!  fdtoq             0.00   0.00
!  fqtoi             0.00   0.00
!  fqtos             0.00   0.00
!  fqtod             0.00   0.00
!  fmovs             0.49   0.44
!  fnegs             0.34   0.35
!  fabss             1.24   1.27
!  fsqrts            0.21   0.15
!  fsqrtd            1.09   1.23
!  fsqrtq            0.00   0.00
!  fcmps             0.95   0.54
!  fcmpd             0.18   0.10
!  fcmpq             0.00   0.00
!  fcmpes            0.05   0.04
!  fcmped            0.12   0.13
!  fcmpeq            0.00   0.00
!  fbfcc             0.31   0.21
!  ldfsr             0.23   0.00
!  stfsr             0.11   0.19
!  loop              0.52   0.38
!  offset            0.12   0.08
!  area              0.22   0.27
!  target            0.19   0.17
!  goto              0.15   0.02
!  sigsegv           0.21   0.27
!  sigbus            0.05   0.10
!  imodify           0.82   0.65
!  ldfsr_offset      0.14   0.00
!  fpattern          0.71   0.65
!  lbranch           0.16   0.08
!  shmld             4.33   4.15
!  shmst             3.22   3.46
!  shmpf             0.15   0.04
!  shmswap           0.21   0.19
!  shmblkld          0.25   0.06
!  shmblkst          0.94   0.25
!  shmblkchk         0.28   0.10
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
!  casa              0.12   0.21
!  rdasi             0.17   0.21
!  wrasi             0.06   0.04
!  bpcc              2.96   3.02
!  fbpfcc            3.21   2.92
!  fmovscc           0.26   0.33
!  fmovdcc           0.21   0.27
!  fmovqcc           0.00   0.00
!  movcc             0.26   0.27
!  flushw            0.20   0.25
!  membar            0.24   0.15
!  prefetch          0.43   0.35
!  rdpc              0.09   0.08
!  ldqf              0.00   0.00
!  stqf              0.00   0.00
!  ldfa              0.09   0.19
!  lddfa             0.07   0.15
!  ldqfa             0.00   0.00
!  ldsba             0.07   0.04
!  ldsha             0.16   0.08
!  lduba             0.09   0.10
!  lduha             0.20   0.23
!  lda               0.01   0.02
!  ldda              0.10   0.15
!  ldstuba           0.21   0.25
!  prefetcha         0.36   0.35
!  stfa              0.02   0.00
!  stdfa             0.23   0.27
!  stqfa             0.00   0.00
!  stba              0.17   0.08
!  stha              0.24   0.25
!  sta               0.00   0.00
!  stda              0.11   0.10
!  swapa             0.14   0.13
!  fmovd             0.17   0.23
!  fnegd             0.25   0.27
!  fabsd             0.08   0.06
!  fstox             0.19   0.21
!  fdtox             0.05   0.04
!  fxtos             0.15   0.15
!  fxtod             0.09   0.10
!  lds               0.18   0.40
!  ldsa              0.03   0.04
!  ldx               0.25   0.31
!  ldxa              0.03   0.04
!  nofault           0.04   0.00
!  rdgsr             0.12   0.15
!  wrgsr             0.25   0.29
!  fpadd16           0.15   0.17
!  fpadd16s          0.16   0.10
!  fpadd32           0.24   0.33
!  fpadd32s          0.25   0.19
!  fpsub16           0.09   0.10
!  fpsub16s          0.21   0.33
!  fpsub32           0.25   0.35
!  fpsub32s          0.02   0.04
!  fpack16           0.14   0.10
!  fpack32           0.03   0.04
!  fpackfix          0.20   0.23
!  fexpand           0.10   0.04
!  fpmerge           0.18   0.35
!  fmul8x16          0.18   0.21
!  fmul8x16au        0.20   0.19
!  fmul8x16al        0.01   0.00
!  fmul8sux16        0.26   0.23
!  fmul8ulx16        0.23   0.29
!  fmuld8sux16       0.17   0.21
!  fmuld8ulx16       0.16   0.15
!  alignaddr         0.13   0.10
!  alignaddrl        0.15   0.15
!  faligndata        0.18   0.23
!  fzero             0.03   0.00
!  fzeros            0.20   0.29
!  fone              0.16   0.10
!  fones             0.22   0.06
!  fsrc1             0.02   0.00
!  fsrc1s            0.22   0.33
!  fsrc2             0.10   0.06
!  fsrc2s            0.14   0.15
!  fnot1             0.22   0.33
!  fnot1s            0.13   0.25
!  fnot2             0.25   0.31
!  fnot2s            0.07   0.06
!  for               0.01   0.04
!  fors              0.00   0.00
!  fnor              0.01   0.00
!  fnors             0.20   0.25
!  fand              0.01   0.02
!  fands             0.03   0.00
!  fnand             0.23   0.27
!  fnands            0.17   0.19
!  fxor              0.01   0.02
!  fxors             0.14   0.08
!  fxnor             0.21   0.27
!  fxnors            0.18   0.13
!  fornot1           0.13   0.27
!  fornot1s          0.15   0.17
!  fornot2           0.14   0.15
!  fornot2s          0.01   0.02
!  fandnot1          0.16   0.08
!  fandnot1s         0.25   0.27
!  fandnot2          0.22   0.27
!  fandnot2s         0.12   0.08
!  fcmpgt16          0.19   0.17
!  fcmpgt32          0.05   0.04
!  fcmple16          0.16   0.17
!  fcmple32          0.06   0.08
!  fcmpne16          0.25   0.25
!  fcmpne32          0.17   0.15
!  fcmpeq16          0.11   0.19
!  fcmpeq32          0.15   0.19
!  edge8             0.20   0.29
!  edge8l            0.19   0.21
!  edge16            0.02   0.00
!  edge16l           0.06   0.08
!  edge32            0.23   0.19
!  edge32l           0.00   0.00
!  pdist             0.04   0.02
!  partial_st8       0.02   0.02
!  partial_st16      0.10   0.04
!  partial_st32      0.08   0.06
!  short_st8         0.02   0.04
!  short_st16        0.25   0.13
!  short_ld8         0.15   0.13
!  short_ld16        0.17   0.23
!  blkld             0.15   0.00
!  blkst             0.12   0.00
!  blkld_offset      0.12   0.00
!  blkst_offset      0.02   0.00
!  blk_check         0.09   0.04
!  casxa             0.06   0.02
!  rdccr             0.19   0.19
!  rdfprs            0.24   0.42
!  wrccr             0.26   0.23
!  popc              0.01   0.02
!  wrfprs            0.18   0.13
!  stx               0.09   0.08
!  stxa              0.17   0.15
!  cflush            0.00   0.00
!  array8            0.23   0.27
!  array16           0.19   0.17
!  array32           0.18   0.25
!  edge8n            0.05   0.06
!  edge8ln           0.26   0.19
!  edge16n           0.26   0.15
!  edge16ln          0.21   0.27
!  edge32n           0.15   0.19
!  edge32ln          0.04   0.06
!  bmask             0.25   0.33
!  bshuffle          0.24   0.23
!  siam              0.14   0.10
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
KDATA_MODULE(t1_module_offset_table, 0x7ad32000)
.seg "data"
t1_offset_table_start:
t1_offset_table_size:	.word	0x00000008
t1_offset_table:
	.word	0x00000008
	.word	0xffffffe8
	.word	0x00000018
	.word	0xffffffe0
	.word	0xfffffff0
	.word	0x00000010
	.word	0xfffffff8
	.word	0x00000000
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

KDATA_MODULE(t1_module_data_in_regs, 0x6f368000)
.seg "data"
KGLOBAL(t1_data_in_regs)
t1_data_in_regs_start:
t1_data_in_regs:
	.word	0xa63df6e8          ! %f0
	.word	0x8052fcda          ! %f1
	.word	0x576d8b1c          ! %f2
	.word	0x4ec2bcbd          ! %f3
	.word	0xd879ccea          ! %f4
	.word	0x45c6d1bb          ! %f5
	.word	0x9fdf772d          ! %f6
	.word	0xdf1f01ae          ! %f7
	.word	0x694f1b63          ! %f8
	.word	0xcf1cb1eb          ! %f9
	.word	0xfba44fff          ! %f10
	.word	0xa3ddf5a2          ! %f11
	.word	0x4052ac13          ! %f12
	.word	0x5da23489          ! %f13
	.word	0x9689c9c6          ! %f14
	.word	0x73714b20          ! %f15
	.word	0xaa0eeb42          ! %f16
	.word	0xda365b11          ! %f17
	.word	0xc64ea9eb          ! %f18
	.word	0x010ef970          ! %f19
	.word	0xc2325e28          ! %f20
	.word	0xa59fd1f1          ! %f21
	.word	0x1dd13e0c          ! %f22
	.word	0xf617814b          ! %f23
	.word	0x93c49b8f          ! %f24
	.word	0x55ae265b          ! %f25
	.word	0x41ffbf46          ! %f26
	.word	0x104f48d1          ! %f27
	.word	0xdd1faab6          ! %f28
	.word	0x63d8055c          ! %f29
	.word	0xee5525b6          ! %f30
	.word	0xa6bd42bf          ! %f31
	.word	0xe8e5ec78          ! %f32
	.word	0xa295d82e          ! %f33
	.word	0x4a51303b          ! %f34
	.word	0x057054e0          ! %f35
	.word	0x060af2ad          ! %f36
	.word	0x92d951c9          ! %f37
	.word	0x9302a481          ! %f38
	.word	0x4e9031c4          ! %f39
	.word	0x4987e9d0          ! %f40
	.word	0x8ff7c1bf          ! %f41
	.word	0x87a70b3b          ! %f42
	.word	0xc43599af          ! %f43
	.word	0xc2ba78e2          ! %f44
	.word	0x77664049          ! %f45
	.word	0xded36caf          ! %f46
	.word	0x85d136d4          ! %f47
	.word	0xa1f73b8d          ! %f48
	.word	0x8004079c          ! %f49
	.word	0xeecdd177          ! %f50
	.word	0x54a788c3          ! %f51
	.word	0xddc73a8b          ! %f52
	.word	0x83a08e81          ! %f53
	.word	0x4ff78b85          ! %f54
	.word	0x005b931e          ! %f55
	.word	0x28da0648          ! %f56
	.word	0x02303824          ! %f57
	.word	0x7fa48b67          ! %f58
	.word	0xc5e94393          ! %f59
	.word	0xef2c57c6          ! %f60
	.word	0xa9fbad2b          ! %f61
	.word	0xdcbc45cb          ! %f62
	.word	0x7c0bc305          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t1_kref+0x330       ! %g1 (code pointer)
	.word	t1_data_in_shm_area ! %g2 (shared area pointer)
	.word	0xbddb2d9f          ! %g3 (loop index)
	.word	SYM(t1_subr2)       ! %g4 (jmpl target)
	.word	t1_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x51303b57          ! %o0
	.word	0x21875ad6          ! %o1
	.word	0xbe5b8b93          ! %o2
	.word	0xa5142110          ! %o3
	.word	0xdf8536d3          ! %o4
	.word	0x46acc520          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x1e7d5bc0          ! %l0
	.word	0x9043320a          ! %l1
	.word	0xf244ed46          ! %l2
	.word	0x9f1b260c          ! %l3
	.word	0xa32b0c12          ! %l4
	.word	0x73908e95          ! %l5
	.word	0x1ec20450          ! %l6
	.word	0x9f30309f          ! %l7
	.word	t1_data_in_area0    ! %i0 (area pointer)
	.word	t1_data_in_area0    ! %i1 (area pointer)
	.word	0xffffffe3          ! %i2 (byte offset)
	.word	0xffffffec          ! %i3 (halfword offset)
	.word	0x00000018          ! %i4 (word offset)
	.word	0xfffffff0          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x11535064          ! %y
	.word	0x00000007          ! %icc (nzvc)
	.word	0x40000bc7          ! %fsr
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
.global t1_data_in_mtbl_size; t1_data_in_mtbl_size:	.word	253
t1_data_in_regs_end:

.skip 7708	! page align

KDATA_MODULE(t1_module_data_in_stack, 0x7c386000)
.seg "data"
KGLOBAL(t1_data_in_mtbl_size)
KGLOBAL(t1_data_in_mtbl)
KGLOBAL(t1_data_in_stack)
t1_data_in_stack_start:
	.word	0x1256b412
	.word	0xab8d6290
	.word	0x5ad3c7c7
	.word	0xe3cf04d6
	.word	0x4d83d082
	.word	0x041cf4e9
	.word	0x3fa1c49e
	.word	0x956cc106
	.word	0xfbb64163
	.word	0x73cf6569
	.word	0xd891ebff
	.word	0x3e4d5c97
	.word	0xdba5604e
	.word	0xbf783d6b
	.word	0x65a17a6f
	.word	0x1ddd30f6
	.word	0xb2b1b0af
	.word	0xe0fded73
	.word	0x98e9f55d
	.word	0x0e8918cf
	.word	0x3b86c481
	.word	0xf2804ca6
	.word	0x6377a786
	.word	0xd5033e9d
	.word	0x8070295b
	.word	0xe9231b7b
	.word	0x04e0ff9b
	.word	0x39edc07f
	.word	0xf7a1a1b0
	.word	0x45f17db3
	.word	0xc0a2b520
	.word	0xc56b3d52
	.word	0xa4f32e52
	.word	0xa12a9f86
	.word	0x6e1ed796
	.word	0x63829efb
	.word	0x1d95ac38
	.word	0xec96fa1e
	.word	0x055b2bdc
	.word	0x2944b604
	.word	0x074d0a80
	.word	0x2f88eb48
	.word	0x257d7bd1
	.word	0xea777a6a
	.word	0x4a095cb6
	.word	0xfa229468
	.word	0x10cabc3e
	.word	0x677405b4
	.word	0xe8884d56
	.word	0xb8a634ae
	.word	0x96d82cf3
	.word	0x00219a47
	.word	0x573cb48f
	.word	0xba357287
	.word	0x1eebd72f
	.word	0x0cc94bf8
	.word	0x38525749
	.word	0x2bb74855
	.word	0x5c7c0e44
	.word	0x15231de3
	.word	0xec801269
	.word	0x6ee38861
	.word	0xf493d67b
	.word	0x02b6a97a
	.word	0x3abaf653
	.word	0x41ee2c10
	.word	0x66dc5634
	.word	0x5ab6a2e0
	.word	0x010116b0
	.word	0xbd3be254
	.word	0x3669b551
	.word	0x561fce77
	.word	0x069b1271
	.word	0x952c9165
	.word	0x876c0ed5
	.word	0xfa593bb7
	.word	0x809f9812
	.word	0x959fbfb1
	.word	0x05cb58c7
	.word	0xda1cd941
	.word	0x04746a23
	.word	0x6ea21811
	.word	0xe7bf665c
	.word	0xf34cb633
	.word	0xa5bca803
	.word	0x94f27d3c
	.word	0x9ce36854
	.word	0xd3ca84bd
	.word	0xfddc5eee
	.word	0xd1006080
	.word	0x38568fa4
	.word	0x42ac31f4
	.word	0x4735a73a
	.word	0xb2ec4fae
	.word	0xc971b654
	.word	0xa581a6e6
	.word	0x7dc3d1dd
	.word	0x4d2eee55
	.word	0xacb432aa
	.word	0x180d06ee
	.word	0x4dfd6a32
	.word	0x9119ce33
	.word	0xd4083888
	.word	0x210fff48
	.word	0x3a2e0ffc
	.word	0x63a8dae8
	.word	0x2ca16d12
	.word	0x5de5fbe7
	.word	0xc2056daa
	.word	0xe5524ced
	.word	0x97be9093
	.word	0xc1cc5585
	.word	0x0028cedc
	.word	0x8fee57c3
	.word	0x7cc162a1
	.word	0xca36ccfc
	.word	0x62691b26
	.word	0x49af076f
	.word	0x4c9e247e
	.word	0x909fe7d4
	.word	0x23173913
	.word	0x9eb40125
	.word	0x82d65dc0
	.word	0x012a021c
	.word	0x890d1d6b
	.word	0x334d1b42
	.word	0xcd48c734
	.word	0xdd5f297d
	.word	0xc0a20ab8
	.word	0x9aba007f
	.word	0x345a8000
	.word	0x10ab158b
	.word	0x2e24c507
	.word	0xf0645263
	.word	0xee9bf107
	.word	0x4a0bd15e
	.word	0x42debdeb
	.word	0x6f74fef9
	.word	0x304e0290
	.word	0xb12aea61
	.word	0x3c4f7cc6
	.word	0x557cbdc3
	.word	0xd6528829
	.word	0xddda3869
	.word	0x6a7fc74b
	.word	0x5bf2e7ee
	.word	0x7f5d06c9
	.word	0x450c9309
	.word	0x0a404e3e
	.word	0x30cd1fc6
	.word	0x1be73934
	.word	0xf7140824
	.word	0xd31fe27e
	.word	0x73a57b6b
	.word	0x77bef6a3
	.word	0x857467c2
	.word	0xbb217645
	.word	0xb20c26c5
	.word	0xe5395fa3
	.word	0xfc323927
	.word	0x53fa6ead
	.word	0xb5fcb0b4
	.word	0x4c71753d
	.word	0x28736d21
	.word	0x7b260975
	.word	0xb43e778c
	.word	0x1eb67e56
	.word	0x9dc861a2
t1_data_in_sp:
	.word	0xd7a2db05
	.word	0xb8fae8c0
	.word	0x61b0df59
	.word	0x91c90a8d
	.word	0x09fba8af
	.word	0x3e4b87dc
	.word	0x650a4812
	.word	0x541b53d4
	.word	t1_data_in_area0
	.word	t1_data_in_area0
	.word	0x00000002
	.word	0x0000000a
	.word	0x00000010
	.word	0x00000018
	.word	t1_data_in_fp
	.word	0x9e6348ea
	.word	0x349737ff
	.word	0x847d0c95
	.word	0xe0795bf8
	.word	0xccafd47c
	.word	0x77d37c53
	.word	0xa294104f
	.word	0x8fcff70e
	.word	0x3b7ea1de
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
	.word   	0x7939ba28	! [%fp - 0xc]
	.word   	0x63c7f1cd	! [%fp - 0x8]
	.word   	0x0d144f82	! [%fp - 0x4]
.global t1_data_in_fp; t1_data_in_fp:
	.word	0x562e811d
	.word	0x836b6d69
	.word	0x9f400018
	.word	0xdc76ddc5
	.word	0x9784ba55
	.word	0xa717e3ff
	.word	0x3c9360fa
	.word	0xcc5f2a11
	.word	0x00013764
	.word	0x4439b772
	.word	0x396f33d4
	.word	0x93e318ab
	.word	0x03df14e0
	.word	0x1b7fbcd6
	.word	0x38fb8dae
	.word	0x55b03667
	.word	0xe4d8ce4a
	.word	0x9e7a8ee4
	.word	0x228ba290
	.word	0x679ec971
	.word	0x39867983
	.word	0xa3161666
	.word	0x3116b00f
	.word	0x245eaa49
t1_data_in_stacktop:
	.word	0
t1_data_in_stack_end:
.skip 6300	! page align

KDATA_MODULE(t1_module_data_in_area0, 0x67c08000)
.seg "data"
t1_data_in_area0_start:
.skip 3008
t1_data_in_area0_begin:
	.word	0x069fc57e	! t1_data_in_area0-0x20
	.word	0x5578b4d8	! t1_data_in_area0-0x1c
	.word	0xf6bc7d2a	! t1_data_in_area0-0x18
	.word	0x252a290f	! t1_data_in_area0-0x14
	.word	0x5cd2b036	! t1_data_in_area0-0x10
	.word	0xa8d7f54c	! t1_data_in_area0-0xc
	.word	0x48718356	! t1_data_in_area0-0x8
	.word	0x7d6b8300	! t1_data_in_area0-0x4
.global t1_data_in_area0; t1_data_in_area0:
	.word	0x337b27e2	! t1_data_in_area0+0x0
	.word	0x266ce78e	! t1_data_in_area0+0x4
	.word	0x231c14d6	! t1_data_in_area0+0x8
	.word	0xa605ac40	! t1_data_in_area0+0xc
	.word	0xf4970b68	! t1_data_in_area0+0x10
	.word	0xbfb08987	! t1_data_in_area0+0x14
	.word	0x562d1450	! t1_data_in_area0+0x18
	.word	0xe9b971d9	! t1_data_in_area0+0x1c
t1_data_in_area0_end:
.skip 5120
t1_data_in_area0_stop:

KDATA_MODULE(t1_module_data_in_shm_area, 0x54226000)
.seg "data"
t1_data_in_shm_area_start:
t1_data_in_shm_area_begin:
.global t1_data_in_shm_area; t1_data_in_shm_area:
	.word	0x979cef31	! t1_data_in_shm_area+0x0 (t0)
	.word	0x54153e0e	! t1_data_in_shm_area+0x4 (t1)
	.word	0x148bbe68	! t1_data_in_shm_area+0x8 (t0)
	.word	0xc8aae2e6	! t1_data_in_shm_area+0xc (t1)
	.word	0x18b698bf	! t1_data_in_shm_area+0x10 (t0)
	.word	0xdd54119d	! t1_data_in_shm_area+0x14 (t1)
	.word	0xf83ca02b	! t1_data_in_shm_area+0x18 (t0)
	.word	0xd42c3803	! t1_data_in_shm_area+0x1c (t1)
	.word	0x076c2ab4	! t1_data_in_shm_area+0x20 (t0)
	.word	0x0355c277	! t1_data_in_shm_area+0x24 (t1)
	.word	0x71e10965	! t1_data_in_shm_area+0x28 (t0)
	.word	0xeea5b6fc	! t1_data_in_shm_area+0x2c (t1)
	.word	0xcf47db65	! t1_data_in_shm_area+0x30 (t0)
	.word	0x2c97dfe0	! t1_data_in_shm_area+0x34 (t1)
	.word	0x5a1df156	! t1_data_in_shm_area+0x38 (t0)
	.word	0x61a5d8a5	! t1_data_in_shm_area+0x3c (t1)
	.word	0xc4bdbb28	! t1_data_in_shm_area+0x40 (t0 bload)
	.word	0xaae8fe72	! t1_data_in_shm_area+0x44
	.word	0xe5ddc095	! t1_data_in_shm_area+0x48
	.word	0xb6871a78	! t1_data_in_shm_area+0x4c
	.word	0x49516a18	! t1_data_in_shm_area+0x50
	.word	0x618c6014	! t1_data_in_shm_area+0x54
	.word	0xf08ec7c1	! t1_data_in_shm_area+0x58
	.word	0x18c89ebc	! t1_data_in_shm_area+0x5c
	.word	0x8a657e71	! t1_data_in_shm_area+0x60
	.word	0xf6fc32db	! t1_data_in_shm_area+0x64
	.word	0x0690ddcd	! t1_data_in_shm_area+0x68
	.word	0x17e27399	! t1_data_in_shm_area+0x6c
	.word	0x767a84ac	! t1_data_in_shm_area+0x70
	.word	0xb70e4cb4	! t1_data_in_shm_area+0x74
	.word	0x5ad7dbd1	! t1_data_in_shm_area+0x78
	.word	0x0c941247	! t1_data_in_shm_area+0x7c
	.word	0x18c8f531	! t1_data_in_shm_area+0x80 (t0 bstore)
	.word	0xc103057b	! t1_data_in_shm_area+0x84
	.word	0x1556ae1d	! t1_data_in_shm_area+0x88
	.word	0x8ad7ac6e	! t1_data_in_shm_area+0x8c
	.word	0xb2005cfa	! t1_data_in_shm_area+0x90
	.word	0xfe9cdcd4	! t1_data_in_shm_area+0x94
	.word	0x7e7d677d	! t1_data_in_shm_area+0x98
	.word	0xe68f7820	! t1_data_in_shm_area+0x9c
	.word	0x853dec77	! t1_data_in_shm_area+0xa0
	.word	0x5fac293b	! t1_data_in_shm_area+0xa4
	.word	0x976ec4bd	! t1_data_in_shm_area+0xa8
	.word	0xcc274709	! t1_data_in_shm_area+0xac
	.word	0x7ea290b1	! t1_data_in_shm_area+0xb0
	.word	0x07be2458	! t1_data_in_shm_area+0xb4
	.word	0x080be46f	! t1_data_in_shm_area+0xb8
	.word	0x835bdce5	! t1_data_in_shm_area+0xbc
	.word	0x349c10cc	! t1_data_in_shm_area+0xc0 (t1 bload)
	.word	0x793df0e7	! t1_data_in_shm_area+0xc4
	.word	0x7519f8d9	! t1_data_in_shm_area+0xc8
	.word	0x3aef661c	! t1_data_in_shm_area+0xcc
	.word	0xc0941c38	! t1_data_in_shm_area+0xd0
	.word	0x65dd2df2	! t1_data_in_shm_area+0xd4
	.word	0xd65c417b	! t1_data_in_shm_area+0xd8
	.word	0xef14d63a	! t1_data_in_shm_area+0xdc
	.word	0xdd1dbb9a	! t1_data_in_shm_area+0xe0
	.word	0x9a570a3b	! t1_data_in_shm_area+0xe4
	.word	0x1d4603bb	! t1_data_in_shm_area+0xe8
	.word	0xe867d990	! t1_data_in_shm_area+0xec
	.word	0x67996976	! t1_data_in_shm_area+0xf0
	.word	0x08fc1396	! t1_data_in_shm_area+0xf4
	.word	0xc89e31aa	! t1_data_in_shm_area+0xf8
	.word	0x5b4262f0	! t1_data_in_shm_area+0xfc
	.word	0xb92c8f2b	! t1_data_in_shm_area+0x100 (t1 bstore)
	.word	0xd92e86b1	! t1_data_in_shm_area+0x104
	.word	0x877e45c5	! t1_data_in_shm_area+0x108
	.word	0xf7eba32d	! t1_data_in_shm_area+0x10c
	.word	0x3022cf6b	! t1_data_in_shm_area+0x110
	.word	0x89a33a78	! t1_data_in_shm_area+0x114
	.word	0xdaa2548c	! t1_data_in_shm_area+0x118
	.word	0x15ea7d24	! t1_data_in_shm_area+0x11c
	.word	0x21f503e6	! t1_data_in_shm_area+0x120
	.word	0x3f3b5dbb	! t1_data_in_shm_area+0x124
	.word	0x52b02350	! t1_data_in_shm_area+0x128
	.word	0xfa3cb5ff	! t1_data_in_shm_area+0x12c
	.word	0xccd5e248	! t1_data_in_shm_area+0x130
	.word	0xa309eb0d	! t1_data_in_shm_area+0x134
	.word	0x8cd85851	! t1_data_in_shm_area+0x138
	.word	0xe39a65b8	! t1_data_in_shm_area+0x13c
t1_data_in_shm_area_end:
t1_data_in_shm_area_stop:

KDATA_MODULE(t1_module_data_exp_regs, 0x5c282000)
.seg "data"
KGLOBAL(t1_data_exp_regs)
t1_data_exp_regs_start:
t1_data_exp_regs:
	.word	0xa63df6e8          ! %f0
	.word	0x8052fcda          ! %f1
	.word	0x576d8b1c          ! %f2
	.word	0x4ec2bcbd          ! %f3
	.word	0xd879ccea          ! %f4
	.word	0x45c6d1bb          ! %f5
	.word	0x9fdf772d          ! %f6
	.word	0xdf1f01ae          ! %f7
	.word	0x694f1b63          ! %f8
	.word	0xcf1cb1eb          ! %f9
	.word	0xfba44fff          ! %f10
	.word	0xa3ddf5a2          ! %f11
	.word	0x4052ac13          ! %f12
	.word	0x5da23489          ! %f13
	.word	0x9689c9c6          ! %f14
	.word	0x73714b20          ! %f15
	.word	0xaa0eeb42          ! %f16
	.word	0xda365b11          ! %f17
	.word	0xc64ea9eb          ! %f18
	.word	0x010ef970          ! %f19
	.word	0xc2325e28          ! %f20
	.word	0xa59fd1f1          ! %f21
	.word	0x1dd13e0c          ! %f22
	.word	0xf617814b          ! %f23
	.word	0x93c49b8f          ! %f24
	.word	0x55ae265b          ! %f25
	.word	0x41ffbf46          ! %f26
	.word	0x104f48d1          ! %f27
	.word	0xdd1faab6          ! %f28
	.word	0x63d8055c          ! %f29
	.word	0xee5525b6          ! %f30
	.word	0xa6bd42bf          ! %f31
	.word	0xe8e5ec78          ! %f32
	.word	0xa295d82e          ! %f33
	.word	0x4a51303b          ! %f34
	.word	0x057054e0          ! %f35
	.word	0x060af2ad          ! %f36
	.word	0x92d951c9          ! %f37
	.word	0x9302a481          ! %f38
	.word	0x4e9031c4          ! %f39
	.word	0x4987e9d0          ! %f40
	.word	0x8ff7c1bf          ! %f41
	.word	0x87a70b3b          ! %f42
	.word	0xc43599af          ! %f43
	.word	0xc2ba78e2          ! %f44
	.word	0x77664049          ! %f45
	.word	0xded36caf          ! %f46
	.word	0x85d136d4          ! %f47
	.word	0xa1f73b8d          ! %f48
	.word	0x8004079c          ! %f49
	.word	0xeecdd177          ! %f50
	.word	0x54a788c3          ! %f51
	.word	0xddc73a8b          ! %f52
	.word	0x83a08e81          ! %f53
	.word	0x4ff78b85          ! %f54
	.word	0x005b931e          ! %f55
	.word	0x28da0648          ! %f56
	.word	0x02303824          ! %f57
	.word	0x7fa48b67          ! %f58
	.word	0xc5e94393          ! %f59
	.word	0xef2c57c6          ! %f60
	.word	0xa9fbad2b          ! %f61
	.word	0xdcbc45cb          ! %f62
	.word	0x7c0bc305          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t1_kref+0x330       ! %g1 (code pointer)
	.word	t1_data_exp_shm_area! %g2 (shared area pointer)
	.word	0xbddb2d9f          ! %g3 (loop index)
	.word	SYM(t1_subr2)       ! %g4 (jmpl target)
	.word	t1_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x51303b57          ! %o0
	.word	0x21875ad6          ! %o1
	.word	0xbe5b8b93          ! %o2
	.word	0xa5142110          ! %o3
	.word	0xdf8536d3          ! %o4
	.word	0x46acc520          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x1e7d5bc0          ! %l0
	.word	0x9043320a          ! %l1
	.word	0xf244ed46          ! %l2
	.word	0x9f1b260c          ! %l3
	.word	0xa32b0c12          ! %l4
	.word	0x73908e95          ! %l5
	.word	0x1ec20450          ! %l6
	.word	0x9f30309f          ! %l7
	.word	t1_data_exp_area0   ! %i0 (area pointer)
	.word	t1_data_exp_area0   ! %i1 (area pointer)
	.word	0xffffffe3          ! %i2 (byte offset)
	.word	0xffffffec          ! %i3 (halfword offset)
	.word	0x00000018          ! %i4 (word offset)
	.word	0xfffffff0          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x11535064          ! %y
	.word	0x00000007          ! %icc (nzvc)
	.word	0x40000bc7          ! %fsr
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
t1_data_exp_mtbl_size:	.word	253
t1_data_exp_regs_end:

.skip 7708	! page align

KDATA_MODULE(t1_module_data_exp_stack, 0x5f5de000)
.seg "data"
KGLOBAL(t1_data_exp_mtbl_size)
KGLOBAL(t1_data_exp_mtbl)
KGLOBAL(t1_data_exp_stack)
t1_data_exp_stack_start:
	.word	0x1256b412
	.word	0xab8d6290
	.word	0x5ad3c7c7
	.word	0xe3cf04d6
	.word	0x4d83d082
	.word	0x041cf4e9
	.word	0x3fa1c49e
	.word	0x956cc106
	.word	0xfbb64163
	.word	0x73cf6569
	.word	0xd891ebff
	.word	0x3e4d5c97
	.word	0xdba5604e
	.word	0xbf783d6b
	.word	0x65a17a6f
	.word	0x1ddd30f6
	.word	0xb2b1b0af
	.word	0xe0fded73
	.word	0x98e9f55d
	.word	0x0e8918cf
	.word	0x3b86c481
	.word	0xf2804ca6
	.word	0x6377a786
	.word	0xd5033e9d
	.word	0x8070295b
	.word	0xe9231b7b
	.word	0x04e0ff9b
	.word	0x39edc07f
	.word	0xf7a1a1b0
	.word	0x45f17db3
	.word	0xc0a2b520
	.word	0xc56b3d52
	.word	0xa4f32e52
	.word	0xa12a9f86
	.word	0x6e1ed796
	.word	0x63829efb
	.word	0x1d95ac38
	.word	0xec96fa1e
	.word	0x055b2bdc
	.word	0x2944b604
	.word	0x074d0a80
	.word	0x2f88eb48
	.word	0x257d7bd1
	.word	0xea777a6a
	.word	0x4a095cb6
	.word	0xfa229468
	.word	0x10cabc3e
	.word	0x677405b4
	.word	0xe8884d56
	.word	0xb8a634ae
	.word	0x96d82cf3
	.word	0x00219a47
	.word	0x573cb48f
	.word	0xba357287
	.word	0x1eebd72f
	.word	0x0cc94bf8
	.word	0x38525749
	.word	0x2bb74855
	.word	0x5c7c0e44
	.word	0x15231de3
	.word	0xec801269
	.word	0x6ee38861
	.word	0xf493d67b
	.word	0x02b6a97a
	.word	0x3abaf653
	.word	0x41ee2c10
	.word	0x66dc5634
	.word	0x5ab6a2e0
	.word	0x010116b0
	.word	0xbd3be254
	.word	0x3669b551
	.word	0x561fce77
	.word	0x069b1271
	.word	0x952c9165
	.word	0x876c0ed5
	.word	0xfa593bb7
	.word	0x809f9812
	.word	0x959fbfb1
	.word	0x05cb58c7
	.word	0xda1cd941
	.word	0x04746a23
	.word	0x6ea21811
	.word	0xe7bf665c
	.word	0xf34cb633
	.word	0xa5bca803
	.word	0x94f27d3c
	.word	0x9ce36854
	.word	0xd3ca84bd
	.word	0xfddc5eee
	.word	0xd1006080
	.word	0x38568fa4
	.word	0x42ac31f4
	.word	0x4735a73a
	.word	0xb2ec4fae
	.word	0xc971b654
	.word	0xa581a6e6
	.word	0x7dc3d1dd
	.word	0x4d2eee55
	.word	0xacb432aa
	.word	0x180d06ee
	.word	0x4dfd6a32
	.word	0x9119ce33
	.word	0xd4083888
	.word	0x210fff48
	.word	0x3a2e0ffc
	.word	0x63a8dae8
	.word	0x2ca16d12
	.word	0x5de5fbe7
	.word	0xc2056daa
	.word	0xe5524ced
	.word	0x97be9093
	.word	0xc1cc5585
	.word	0x0028cedc
	.word	0x8fee57c3
	.word	0x7cc162a1
	.word	0xca36ccfc
	.word	0x62691b26
	.word	0x49af076f
	.word	0x4c9e247e
	.word	0x909fe7d4
	.word	0x23173913
	.word	0x9eb40125
	.word	0x82d65dc0
	.word	0x012a021c
	.word	0x890d1d6b
	.word	0x334d1b42
	.word	0xcd48c734
	.word	0xdd5f297d
	.word	0xc0a20ab8
	.word	0x9aba007f
	.word	0x345a8000
	.word	0x10ab158b
	.word	0x2e24c507
	.word	0xf0645263
	.word	0xee9bf107
	.word	0x4a0bd15e
	.word	0x42debdeb
	.word	0x6f74fef9
	.word	0x304e0290
	.word	0xb12aea61
	.word	0x3c4f7cc6
	.word	0x557cbdc3
	.word	0xd6528829
	.word	0xddda3869
	.word	0x6a7fc74b
	.word	0x5bf2e7ee
	.word	0x7f5d06c9
	.word	0x450c9309
	.word	0x0a404e3e
	.word	0x30cd1fc6
	.word	0x1be73934
	.word	0xf7140824
	.word	0xd31fe27e
	.word	0x73a57b6b
	.word	0x77bef6a3
	.word	0x857467c2
	.word	0xbb217645
	.word	0xb20c26c5
	.word	0xe5395fa3
	.word	0xfc323927
	.word	0x53fa6ead
	.word	0xb5fcb0b4
	.word	0x4c71753d
	.word	0x28736d21
	.word	0x7b260975
	.word	0xb43e778c
	.word	0x1eb67e56
	.word	0x9dc861a2
t1_data_exp_sp:
	.word	0xd7a2db05
	.word	0xb8fae8c0
	.word	0x61b0df59
	.word	0x91c90a8d
	.word	0x09fba8af
	.word	0x3e4b87dc
	.word	0x650a4812
	.word	0x541b53d4
	.word	t1_data_exp_area0
	.word	t1_data_exp_area0
	.word	0x00000002
	.word	0x0000000a
	.word	0x00000010
	.word	0x00000018
	.word	t1_data_exp_fp
	.word	0x9e6348ea
	.word	0x349737ff
	.word	0x847d0c95
	.word	0xe0795bf8
	.word	0xccafd47c
	.word	0x77d37c53
	.word	0xa294104f
	.word	0x8fcff70e
	.word	0x3b7ea1de
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
	.word   	0x7939ba28	! [%fp - 0xc]
	.word   	0x63c7f1cd	! [%fp - 0x8]
	.word   	0x0d144f82	! [%fp - 0x4]
t1_data_exp_fp:
	.word	0x562e811d
	.word	0x836b6d69
	.word	0x9f400018
	.word	0xdc76ddc5
	.word	0x9784ba55
	.word	0xa717e3ff
	.word	0x3c9360fa
	.word	0xcc5f2a11
	.word	0x00013764
	.word	0x4439b772
	.word	0x396f33d4
	.word	0x93e318ab
	.word	0x03df14e0
	.word	0x1b7fbcd6
	.word	0x38fb8dae
	.word	0x55b03667
	.word	0xe4d8ce4a
	.word	0x9e7a8ee4
	.word	0x228ba290
	.word	0x679ec971
	.word	0x39867983
	.word	0xa3161666
	.word	0x3116b00f
	.word	0x245eaa49
t1_data_exp_stacktop:
	.word	0
t1_data_exp_stack_end:
.skip 6300	! page align

KDATA_MODULE(t1_module_data_exp_area0, 0x60a34000)
.seg "data"
t1_data_exp_area0_start:
.skip 3008
t1_data_exp_area0_begin:
	.word	0x069fc57e	! t1_data_exp_area0-0x20
	.word	0x5578b4d8	! t1_data_exp_area0-0x1c
	.word	0xf6bc7d2a	! t1_data_exp_area0-0x18
	.word	0x252a290f	! t1_data_exp_area0-0x14
	.word	0x5cd2b036	! t1_data_exp_area0-0x10
	.word	0xa8d7f54c	! t1_data_exp_area0-0xc
	.word	0x48718356	! t1_data_exp_area0-0x8
	.word	0x7d6b8300	! t1_data_exp_area0-0x4
.global t1_data_exp_area0; t1_data_exp_area0:
	.word	0x337b27e2	! t1_data_exp_area0+0x0
	.word	0x266ce78e	! t1_data_exp_area0+0x4
	.word	0x231c14d6	! t1_data_exp_area0+0x8
	.word	0xa605ac40	! t1_data_exp_area0+0xc
	.word	0xf4970b68	! t1_data_exp_area0+0x10
	.word	0xbfb08987	! t1_data_exp_area0+0x14
	.word	0x562d1450	! t1_data_exp_area0+0x18
	.word	0xe9b971d9	! t1_data_exp_area0+0x1c
t1_data_exp_area0_end:
.skip 5120
t1_data_exp_area0_stop:

KDATA_MODULE(t1_module_data_exp_shm_area, 0x411a0000)
.seg "data"
t1_data_exp_shm_area_start:
t1_data_exp_shm_area_begin:
.global t1_data_exp_shm_area; t1_data_exp_shm_area:
	.word	0x979cef31	! t1_data_exp_shm_area+0x0 (t0)
	.word	0x54153e0e	! t1_data_exp_shm_area+0x4 (t1)
	.word	0x148bbe68	! t1_data_exp_shm_area+0x8 (t0)
	.word	0xc8aae2e6	! t1_data_exp_shm_area+0xc (t1)
	.word	0x18b698bf	! t1_data_exp_shm_area+0x10 (t0)
	.word	0xdd54119d	! t1_data_exp_shm_area+0x14 (t1)
	.word	0xf83ca02b	! t1_data_exp_shm_area+0x18 (t0)
	.word	0xd42c3803	! t1_data_exp_shm_area+0x1c (t1)
	.word	0x076c2ab4	! t1_data_exp_shm_area+0x20 (t0)
	.word	0x0355c277	! t1_data_exp_shm_area+0x24 (t1)
	.word	0x71e10965	! t1_data_exp_shm_area+0x28 (t0)
	.word	0xeea5b6fc	! t1_data_exp_shm_area+0x2c (t1)
	.word	0xcf47db65	! t1_data_exp_shm_area+0x30 (t0)
	.word	0x2c97dfe0	! t1_data_exp_shm_area+0x34 (t1)
	.word	0x5a1df156	! t1_data_exp_shm_area+0x38 (t0)
	.word	0x61a5d8a5	! t1_data_exp_shm_area+0x3c (t1)
	.word	0xc4bdbb28	! t1_data_exp_shm_area+0x40 (t0 bload)
	.word	0xaae8fe72	! t1_data_exp_shm_area+0x44
	.word	0xe5ddc095	! t1_data_exp_shm_area+0x48
	.word	0xb6871a78	! t1_data_exp_shm_area+0x4c
	.word	0x49516a18	! t1_data_exp_shm_area+0x50
	.word	0x618c6014	! t1_data_exp_shm_area+0x54
	.word	0xf08ec7c1	! t1_data_exp_shm_area+0x58
	.word	0x18c89ebc	! t1_data_exp_shm_area+0x5c
	.word	0x8a657e71	! t1_data_exp_shm_area+0x60
	.word	0xf6fc32db	! t1_data_exp_shm_area+0x64
	.word	0x0690ddcd	! t1_data_exp_shm_area+0x68
	.word	0x17e27399	! t1_data_exp_shm_area+0x6c
	.word	0x767a84ac	! t1_data_exp_shm_area+0x70
	.word	0xb70e4cb4	! t1_data_exp_shm_area+0x74
	.word	0x5ad7dbd1	! t1_data_exp_shm_area+0x78
	.word	0x0c941247	! t1_data_exp_shm_area+0x7c
	.word	0x18c8f531	! t1_data_exp_shm_area+0x80 (t0 bstore)
	.word	0xc103057b	! t1_data_exp_shm_area+0x84
	.word	0x1556ae1d	! t1_data_exp_shm_area+0x88
	.word	0x8ad7ac6e	! t1_data_exp_shm_area+0x8c
	.word	0xb2005cfa	! t1_data_exp_shm_area+0x90
	.word	0xfe9cdcd4	! t1_data_exp_shm_area+0x94
	.word	0x7e7d677d	! t1_data_exp_shm_area+0x98
	.word	0xe68f7820	! t1_data_exp_shm_area+0x9c
	.word	0x853dec77	! t1_data_exp_shm_area+0xa0
	.word	0x5fac293b	! t1_data_exp_shm_area+0xa4
	.word	0x976ec4bd	! t1_data_exp_shm_area+0xa8
	.word	0xcc274709	! t1_data_exp_shm_area+0xac
	.word	0x7ea290b1	! t1_data_exp_shm_area+0xb0
	.word	0x07be2458	! t1_data_exp_shm_area+0xb4
	.word	0x080be46f	! t1_data_exp_shm_area+0xb8
	.word	0x835bdce5	! t1_data_exp_shm_area+0xbc
	.word	0x349c10cc	! t1_data_exp_shm_area+0xc0 (t1 bload)
	.word	0x793df0e7	! t1_data_exp_shm_area+0xc4
	.word	0x7519f8d9	! t1_data_exp_shm_area+0xc8
	.word	0x3aef661c	! t1_data_exp_shm_area+0xcc
	.word	0xc0941c38	! t1_data_exp_shm_area+0xd0
	.word	0x65dd2df2	! t1_data_exp_shm_area+0xd4
	.word	0xd65c417b	! t1_data_exp_shm_area+0xd8
	.word	0xef14d63a	! t1_data_exp_shm_area+0xdc
	.word	0xdd1dbb9a	! t1_data_exp_shm_area+0xe0
	.word	0x9a570a3b	! t1_data_exp_shm_area+0xe4
	.word	0x1d4603bb	! t1_data_exp_shm_area+0xe8
	.word	0xe867d990	! t1_data_exp_shm_area+0xec
	.word	0x67996976	! t1_data_exp_shm_area+0xf0
	.word	0x08fc1396	! t1_data_exp_shm_area+0xf4
	.word	0xc89e31aa	! t1_data_exp_shm_area+0xf8
	.word	0x5b4262f0	! t1_data_exp_shm_area+0xfc
	.word	0xb92c8f2b	! t1_data_exp_shm_area+0x100 (t1 bstore)
	.word	0xd92e86b1	! t1_data_exp_shm_area+0x104
	.word	0x877e45c5	! t1_data_exp_shm_area+0x108
	.word	0xf7eba32d	! t1_data_exp_shm_area+0x10c
	.word	0x3022cf6b	! t1_data_exp_shm_area+0x110
	.word	0x89a33a78	! t1_data_exp_shm_area+0x114
	.word	0xdaa2548c	! t1_data_exp_shm_area+0x118
	.word	0x15ea7d24	! t1_data_exp_shm_area+0x11c
	.word	0x21f503e6	! t1_data_exp_shm_area+0x120
	.word	0x3f3b5dbb	! t1_data_exp_shm_area+0x124
	.word	0x52b02350	! t1_data_exp_shm_area+0x128
	.word	0xfa3cb5ff	! t1_data_exp_shm_area+0x12c
	.word	0xccd5e248	! t1_data_exp_shm_area+0x130
	.word	0xa309eb0d	! t1_data_exp_shm_area+0x134
	.word	0x8cd85851	! t1_data_exp_shm_area+0x138
	.word	0xe39a65b8	! t1_data_exp_shm_area+0x13c
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



