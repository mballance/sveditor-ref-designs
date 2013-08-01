/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: v9_2th_kao_02_20_04_131.s
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
#define T0_KAOS_SEED          d3d14663fab2
#define T0_KAOS_ICOUNT        5000
#define T0_KAOS_AREAS         1
#define T0_KAOS_AREASIZE      64
#define T0_KAOS_AREAOFFSET    6336
#define T0_KAOS_PAGESIZE      8192
#define T0_KAOS_CODECOUNT     5002

#define T0_KAOS_BOOT_VA                  0x30df8000
#define T0_KAOS_BOOT_PA                  0x0000000000f5a000
#define T0_KAOS_BOOT_CACHEABLE           1
#define T0_KAOS_BOOT_NONCACHEABLE        0

#define T0_KAOS_STARTUP_VA               0x35de8000
#define T0_KAOS_STARTUP_PA               0x0000000001d38000
#define T0_KAOS_STARTUP_CACHEABLE        1
#define T0_KAOS_STARTUP_NONCACHEABLE     0

#define T0_KAOS_OFFSET_TBL_VA            0x22bf0000
#define T0_KAOS_OFFSET_TBL_PA            0x0000000002f7e000
#define T0_KAOS_OFFSET_TBL_CACHEABLE     1
#define T0_KAOS_OFFSET_TBL_NONCACHEABLE  0

#define T0_KAOS_DONE_VA                  0x2a9dc000
#define T0_KAOS_DONE_PA                  0x0000000003e72000
#define T0_KAOS_DONE_CACHEABLE           1
#define T0_KAOS_DONE_NONCACHEABLE        0

#define T0_KAOS_KTBL_VA                  0x13cd6000
#define T0_KAOS_KTBL_PA                  0x0000000004cf4000
#define T0_KAOS_KTBL_CACHEABLE           1
#define T0_KAOS_KTBL_NONCACHEABLE        0

#define T0_KAOS_SUBR0_VA                 0x14230000
#define T0_KAOS_SUBR0_PA                 0x0000000005f74000
#define T0_KAOS_SUBR0_CACHEABLE          1
#define T0_KAOS_SUBR0_NONCACHEABLE       0
#define T0_KAOS_SUBR1_VA                 0x13da0000
#define T0_KAOS_SUBR1_PA                 0x0000000006f84000
#define T0_KAOS_SUBR1_CACHEABLE          1
#define T0_KAOS_SUBR1_NONCACHEABLE       0
#define T0_KAOS_SUBR2_VA                 0x13d44000
#define T0_KAOS_SUBR2_PA                 0x0000000007628000
#define T0_KAOS_SUBR2_CACHEABLE          1
#define T0_KAOS_SUBR2_NONCACHEABLE       0
#define T0_KAOS_SUBR3_VA                 0x0460c000
#define T0_KAOS_SUBR3_PA                 0x000000000890a000
#define T0_KAOS_SUBR3_CACHEABLE          1
#define T0_KAOS_SUBR3_NONCACHEABLE       0

#define T0_KAOS_EXP_REGS_VA              0x2e498000
#define T0_KAOS_EXP_REGS_PA              0x0000000009bfc000
#define T0_KAOS_EXP_REGS_CACHEABLE       1
#define T0_KAOS_EXP_REGS_NONCACHEABLE    0
#define T0_KAOS_RUN_REGS_VA              0x39c6a000
#define T0_KAOS_RUN_REGS_PA              0x000000000a3ce000
#define T0_KAOS_RUN_REGS_CACHEABLE       1
#define T0_KAOS_RUN_REGS_NONCACHEABLE    0

#define T0_KAOS_EXP_STACK_VA             0x1f71a000
#define T0_KAOS_EXP_STACK_PA             0x000000000b980000
#define T0_KAOS_EXP_STACK_CACHEABLE      1
#define T0_KAOS_EXP_STACK_NONCACHEABLE   0
#define T0_KAOS_RUN_STACK_VA             0x1b6be000
#define T0_KAOS_RUN_STACK_PA             0x000000000cb88000
#define T0_KAOS_RUN_STACK_CACHEABLE      1
#define T0_KAOS_RUN_STACK_NONCACHEABLE   0

#define T0_KAOS_AREA0
#define T0_KAOS_EXP_AREA0_VA             0x0ccb6000
#define T0_KAOS_EXP_AREA0_PA             0x000000000d4c4000
#define T0_KAOS_EXP_AREA0_CACHEABLE      1
#define T0_KAOS_EXP_AREA0_NONCACHEABLE   0
#define T0_KAOS_RUN_AREA0_VA             0x1e872000
#define T0_KAOS_RUN_AREA0_PA             0x000000000ee04000
#define T0_KAOS_RUN_AREA0_CACHEABLE      1
#define T0_KAOS_RUN_AREA0_NONCACHEABLE   0

#define T0_KAOS_SHM_AREA
#define T0_KAOS_EXP_SHM_AREA_VA          0x03e76000
#define T0_KAOS_EXP_SHM_AREA_PA          0x0000000000172000
#define T0_KAOS_EXP_SHM_AREA_CACHEABLE   1
#define T0_KAOS_EXP_SHM_AREA_NONCACHEABLE 0
#define T0_KAOS_RUN_SHM_AREA_VA          0x36b7c000
#define T0_KAOS_RUN_SHM_AREA_PA          0x00000000005dc000
#define T0_KAOS_RUN_SHM_AREA_CACHEABLE   1
#define T0_KAOS_RUN_SHM_AREA_NONCACHEABLE 0

#define T0_KAOS_RANVAL_00     0x711a029b
#define T0_KAOS_RANVAL_01     0xe0c3b8ee
#define T0_KAOS_RANVAL_02     0x94fe5c5a
#define T0_KAOS_RANVAL_03     0x958e5a96
#define T0_KAOS_RANVAL_04     0x755815cf
#define T0_KAOS_RANVAL_05     0x577abfcc
#define T0_KAOS_RANVAL_06     0xcd407291
#define T0_KAOS_RANVAL_07     0x24c21726
#define T0_KAOS_RANVAL_08     0x2a2bd3f7
#define T0_KAOS_RANVAL_09     0xb70c4f1a
#define T0_KAOS_RANVAL_0a     0x5bf6ae11
#define T0_KAOS_RANVAL_0b     0xb71636ed
#define T0_KAOS_RANVAL_0c     0x7993f126
#define T0_KAOS_RANVAL_0d     0x10fa86e5
#define T0_KAOS_RANVAL_0e     0xbd611c73
#define T0_KAOS_RANVAL_0f     0xd1b3f8d5
#define T0_KAOS_RANVAL_10     0x4ae97037
#define T0_KAOS_RANVAL_11     0xe00ae26f
#define T0_KAOS_RANVAL_12     0xeb55f858
#define T0_KAOS_RANVAL_13     0xe70ce513
#define T0_KAOS_RANVAL_14     0xb3183e21
#define T0_KAOS_RANVAL_15     0x755dd2ea
#define T0_KAOS_RANVAL_16     0xaa0aa6e5
#define T0_KAOS_RANVAL_17     0xdb14ef8b
#define T0_KAOS_RANVAL_18     0xe875ae90
#define T0_KAOS_RANVAL_19     0xaf1ec283
#define T0_KAOS_RANVAL_1a     0xb36a986e
#define T0_KAOS_RANVAL_1b     0xc311dc72
#define T0_KAOS_RANVAL_1c     0x41a9adb0
#define T0_KAOS_RANVAL_1d     0xcc02c3a1
#define T0_KAOS_RANVAL_1e     0x202f0070
#define T0_KAOS_RANVAL_1f     0x20e9cb35
#define T0_KAOS_RANVAL_20     0xc918bb4b
#define T0_KAOS_RANVAL_21     0x356c706e
#define T0_KAOS_RANVAL_22     0x39a598c5
#define T0_KAOS_RANVAL_23     0xd4150b99
#define T0_KAOS_RANVAL_24     0xce8a0315
#define T0_KAOS_RANVAL_25     0x026fbe95
#define T0_KAOS_RANVAL_26     0xe343e412
#define T0_KAOS_RANVAL_27     0x35f5a122
#define T0_KAOS_RANVAL_28     0x70a62646
#define T0_KAOS_RANVAL_29     0x9858cb4d
#define T0_KAOS_RANVAL_2a     0x9b07a383
#define T0_KAOS_RANVAL_2b     0x869918b9
#define T0_KAOS_RANVAL_2c     0x3ca08a69
#define T0_KAOS_RANVAL_2d     0x4604e397
#define T0_KAOS_RANVAL_2e     0x327c73ba
#define T0_KAOS_RANVAL_2f     0x080f9488
#define T0_KAOS_RANVAL_30     0xb5264174
#define T0_KAOS_RANVAL_31     0xa68d4cc3
#define T0_KAOS_RANVAL_32     0x9349c504
#define T0_KAOS_RANVAL_33     0x23cd3228
#define T0_KAOS_RANVAL_34     0x1fcadf17
#define T0_KAOS_RANVAL_35     0x61b79137
#define T0_KAOS_RANVAL_36     0x50aba2cd
#define T0_KAOS_RANVAL_37     0x55392efe
#define T0_KAOS_RANVAL_38     0x42dccf58
#define T0_KAOS_RANVAL_39     0xed975573
#define T0_KAOS_RANVAL_3a     0x566bfe56
#define T0_KAOS_RANVAL_3b     0x98e06ee1
#define T0_KAOS_RANVAL_3c     0x7a10025f
#define T0_KAOS_RANVAL_3d     0xf109f94f
#define T0_KAOS_RANVAL_3e     0x8d1970a4
#define T0_KAOS_RANVAL_3f     0xeef74900
#define T0_KAOS_RANVAL_40     0x8007018e
#define T0_KAOS_RANVAL_41     0x02748987
#define T0_KAOS_RANVAL_42     0xd593a7bb
#define T0_KAOS_RANVAL_43     0x6430bf03
#define T0_KAOS_RANVAL_44     0x9aafc1d4
#define T0_KAOS_RANVAL_45     0xadb0c579
#define T0_KAOS_RANVAL_46     0xcad4f30c
#define T0_KAOS_RANVAL_47     0xbbaf826f
#define T0_KAOS_RANVAL_48     0x31eac743
#define T0_KAOS_RANVAL_49     0xe79e3d2c
#define T0_KAOS_RANVAL_4a     0x7b63a32b
#define T0_KAOS_RANVAL_4b     0x92376c4e
#define T0_KAOS_RANVAL_4c     0xc0486ddf
#define T0_KAOS_RANVAL_4d     0x9998cb94
#define T0_KAOS_RANVAL_4e     0xeb4d30c4
#define T0_KAOS_RANVAL_4f     0xdc0c4b0e
#define T0_KAOS_RANVAL_50     0x1e116bb8
#define T0_KAOS_RANVAL_51     0x7b65f113
#define T0_KAOS_RANVAL_52     0x07385ecf
#define T0_KAOS_RANVAL_53     0x4e552aa9
#define T0_KAOS_RANVAL_54     0x4c8ce03a
#define T0_KAOS_RANVAL_55     0x8b3ed243
#define T0_KAOS_RANVAL_56     0x903acc02
#define T0_KAOS_RANVAL_57     0x58a97b06
#define T0_KAOS_RANVAL_58     0xa3c784c2
#define T0_KAOS_RANVAL_59     0xa1b4def2
#define T0_KAOS_RANVAL_5a     0xf1f1a787
#define T0_KAOS_RANVAL_5b     0x2ddfb89e
#define T0_KAOS_RANVAL_5c     0xed44d275
#define T0_KAOS_RANVAL_5d     0xae8b656d
#define T0_KAOS_RANVAL_5e     0x60247cef
#define T0_KAOS_RANVAL_5f     0x428b7b62
#define T0_KAOS_RANVAL_60     0xf33c314d
#define T0_KAOS_RANVAL_61     0x6c809601
#define T0_KAOS_RANVAL_62     0xb2344b65
#define T0_KAOS_RANVAL_63     0x06130fdc
#define T0_KAOS_RANVAL_64     0x1b918474
#define T0_KAOS_RANVAL_65     0xe0a4babe
#define T0_KAOS_RANVAL_66     0x58085c26
#define T0_KAOS_RANVAL_67     0x3f22fe94
#define T0_KAOS_RANVAL_68     0x18d9a7d4
#define T0_KAOS_RANVAL_69     0xde86a77e
#define T0_KAOS_RANVAL_6a     0x494d8c30
#define T0_KAOS_RANVAL_6b     0xcfc825b4
#define T0_KAOS_RANVAL_6c     0xb7b0b2ee
#define T0_KAOS_RANVAL_6d     0x6968a625
#define T0_KAOS_RANVAL_6e     0xbbf3fd39
#define T0_KAOS_RANVAL_6f     0x0edf48ef
#define T0_KAOS_RANVAL_70     0x8cb114eb
#define T0_KAOS_RANVAL_71     0x04216329
#define T0_KAOS_RANVAL_72     0xbd2261e2
#define T0_KAOS_RANVAL_73     0xd6133b9d
#define T0_KAOS_RANVAL_74     0x54b7ddf0
#define T0_KAOS_RANVAL_75     0x79809e54
#define T0_KAOS_RANVAL_76     0xe795592c
#define T0_KAOS_RANVAL_77     0xbb91092a
#define T0_KAOS_RANVAL_78     0x5713c9b6
#define T0_KAOS_RANVAL_79     0x0647a3c8
#define T0_KAOS_RANVAL_7a     0x86d48d2a
#define T0_KAOS_RANVAL_7b     0x2f2bbfb1
#define T0_KAOS_RANVAL_7c     0xfd01df59
#define T0_KAOS_RANVAL_7d     0x0041d144
#define T0_KAOS_RANVAL_7e     0x970e88f8
#define T0_KAOS_RANVAL_7f     0xc21fc0e3
/* end ktbl.0.h */
/* start ktbl.1.h */
#define T1_KAOS_NIAGARA
#define T1_KAOS_VERSION       4.2
#define T1_KAOS_SEED          d3d14663fab3
#define T1_KAOS_ICOUNT        5000
#define T1_KAOS_AREAS         1
#define T1_KAOS_AREASIZE      64
#define T1_KAOS_AREAOFFSET    6336
#define T1_KAOS_PAGESIZE      8192
#define T1_KAOS_CODECOUNT     5002

#define T1_KAOS_BOOT_VA                  0x63948000
#define T1_KAOS_BOOT_PA                  0x0000000040274000
#define T1_KAOS_BOOT_CACHEABLE           1
#define T1_KAOS_BOOT_NONCACHEABLE        0

#define T1_KAOS_STARTUP_VA               0x60edc000
#define T1_KAOS_STARTUP_PA               0x0000000041b48000
#define T1_KAOS_STARTUP_CACHEABLE        1
#define T1_KAOS_STARTUP_NONCACHEABLE     0

#define T1_KAOS_OFFSET_TBL_VA            0x5e716000
#define T1_KAOS_OFFSET_TBL_PA            0x000000004243e000
#define T1_KAOS_OFFSET_TBL_CACHEABLE     1
#define T1_KAOS_OFFSET_TBL_NONCACHEABLE  0

#define T1_KAOS_DONE_VA                  0x752ea000
#define T1_KAOS_DONE_PA                  0x00000000431ec000
#define T1_KAOS_DONE_CACHEABLE           1
#define T1_KAOS_DONE_NONCACHEABLE        0

#define T1_KAOS_KTBL_VA                  0x6c78e000
#define T1_KAOS_KTBL_PA                  0x0000000044c7e000
#define T1_KAOS_KTBL_CACHEABLE           1
#define T1_KAOS_KTBL_NONCACHEABLE        0

#define T1_KAOS_SUBR0_VA                 0x6c80e000
#define T1_KAOS_SUBR0_PA                 0x0000000045004000
#define T1_KAOS_SUBR0_CACHEABLE          1
#define T1_KAOS_SUBR0_NONCACHEABLE       0
#define T1_KAOS_SUBR1_VA                 0x6f86c000
#define T1_KAOS_SUBR1_PA                 0x000000004636a000
#define T1_KAOS_SUBR1_CACHEABLE          1
#define T1_KAOS_SUBR1_NONCACHEABLE       0
#define T1_KAOS_SUBR2_VA                 0x6c60a000
#define T1_KAOS_SUBR2_PA                 0x0000000047bbc000
#define T1_KAOS_SUBR2_CACHEABLE          1
#define T1_KAOS_SUBR2_NONCACHEABLE       0
#define T1_KAOS_SUBR3_VA                 0x6ca5a000
#define T1_KAOS_SUBR3_PA                 0x0000000048f74000
#define T1_KAOS_SUBR3_CACHEABLE          1
#define T1_KAOS_SUBR3_NONCACHEABLE       0

#define T1_KAOS_EXP_REGS_VA              0x44804000
#define T1_KAOS_EXP_REGS_PA              0x00000000496f6000
#define T1_KAOS_EXP_REGS_CACHEABLE       1
#define T1_KAOS_EXP_REGS_NONCACHEABLE    0
#define T1_KAOS_RUN_REGS_VA              0x405ae000
#define T1_KAOS_RUN_REGS_PA              0x000000004a8a8000
#define T1_KAOS_RUN_REGS_CACHEABLE       1
#define T1_KAOS_RUN_REGS_NONCACHEABLE    0

#define T1_KAOS_EXP_STACK_VA             0x427a2000
#define T1_KAOS_EXP_STACK_PA             0x000000004be2c000
#define T1_KAOS_EXP_STACK_CACHEABLE      1
#define T1_KAOS_EXP_STACK_NONCACHEABLE   0
#define T1_KAOS_RUN_STACK_VA             0x433ea000
#define T1_KAOS_RUN_STACK_PA             0x000000004cca6000
#define T1_KAOS_RUN_STACK_CACHEABLE      1
#define T1_KAOS_RUN_STACK_NONCACHEABLE   0

#define T1_KAOS_AREA0
#define T1_KAOS_EXP_AREA0_VA             0x62504000
#define T1_KAOS_EXP_AREA0_PA             0x000000004d568000
#define T1_KAOS_EXP_AREA0_CACHEABLE      1
#define T1_KAOS_EXP_AREA0_NONCACHEABLE   0
#define T1_KAOS_RUN_AREA0_VA             0x48c8a000
#define T1_KAOS_RUN_AREA0_PA             0x000000004e5c6000
#define T1_KAOS_RUN_AREA0_CACHEABLE      1
#define T1_KAOS_RUN_AREA0_NONCACHEABLE   0

#define T1_KAOS_SHM_AREA
#define T1_KAOS_EXP_SHM_AREA_VA          0x7f4f2000
#define T1_KAOS_EXP_SHM_AREA_PA          0x0000000040e42000
#define T1_KAOS_EXP_SHM_AREA_CACHEABLE   1
#define T1_KAOS_EXP_SHM_AREA_NONCACHEABLE 0
#define T1_KAOS_RUN_SHM_AREA_VA          0x5ea50000
#define T1_KAOS_RUN_SHM_AREA_PA          0x000000004048a000
#define T1_KAOS_RUN_SHM_AREA_CACHEABLE   1
#define T1_KAOS_RUN_SHM_AREA_NONCACHEABLE 0

#define T1_KAOS_RANVAL_00     0xe302b613
#define T1_KAOS_RANVAL_01     0xe14871c6
#define T1_KAOS_RANVAL_02     0x1ca33e67
#define T1_KAOS_RANVAL_03     0xfec0ba0b
#define T1_KAOS_RANVAL_04     0x0e4cac4e
#define T1_KAOS_RANVAL_05     0xd156ff18
#define T1_KAOS_RANVAL_06     0x0631c0d4
#define T1_KAOS_RANVAL_07     0x812b0bbb
#define T1_KAOS_RANVAL_08     0xa482a6fd
#define T1_KAOS_RANVAL_09     0xf546dcdb
#define T1_KAOS_RANVAL_0a     0x9b310320
#define T1_KAOS_RANVAL_0b     0x75974a2e
#define T1_KAOS_RANVAL_0c     0x1b701c9f
#define T1_KAOS_RANVAL_0d     0xc64ca97a
#define T1_KAOS_RANVAL_0e     0xb0c2fcd1
#define T1_KAOS_RANVAL_0f     0xf18a1114
#define T1_KAOS_RANVAL_10     0xa0385c55
#define T1_KAOS_RANVAL_11     0xdf6c9fa9
#define T1_KAOS_RANVAL_12     0xe0e00020
#define T1_KAOS_RANVAL_13     0x2141f2a7
#define T1_KAOS_RANVAL_14     0x6a8cca0c
#define T1_KAOS_RANVAL_15     0xceca89b7
#define T1_KAOS_RANVAL_16     0xa76eccb7
#define T1_KAOS_RANVAL_17     0x90838d23
#define T1_KAOS_RANVAL_18     0x75c838e2
#define T1_KAOS_RANVAL_19     0x85b51626
#define T1_KAOS_RANVAL_1a     0x95848abc
#define T1_KAOS_RANVAL_1b     0x580d0374
#define T1_KAOS_RANVAL_1c     0xf77b07c2
#define T1_KAOS_RANVAL_1d     0x5339617d
#define T1_KAOS_RANVAL_1e     0x777af20e
#define T1_KAOS_RANVAL_1f     0x66fbcd31
#define T1_KAOS_RANVAL_20     0x6589e450
#define T1_KAOS_RANVAL_21     0x8484c95b
#define T1_KAOS_RANVAL_22     0x70ab21cd
#define T1_KAOS_RANVAL_23     0x54ab11c9
#define T1_KAOS_RANVAL_24     0xc3bb580c
#define T1_KAOS_RANVAL_25     0xec285ccf
#define T1_KAOS_RANVAL_26     0x8f7fec20
#define T1_KAOS_RANVAL_27     0xad4002fb
#define T1_KAOS_RANVAL_28     0x4fae83b1
#define T1_KAOS_RANVAL_29     0x3eb27de7
#define T1_KAOS_RANVAL_2a     0x8e7a9a31
#define T1_KAOS_RANVAL_2b     0x947cea8b
#define T1_KAOS_RANVAL_2c     0x2cf7acde
#define T1_KAOS_RANVAL_2d     0xcd488886
#define T1_KAOS_RANVAL_2e     0xf6f16c7c
#define T1_KAOS_RANVAL_2f     0xeecadf32
#define T1_KAOS_RANVAL_30     0xffc581f8
#define T1_KAOS_RANVAL_31     0x2733927a
#define T1_KAOS_RANVAL_32     0xc8ff5b49
#define T1_KAOS_RANVAL_33     0x3af554d5
#define T1_KAOS_RANVAL_34     0x2d3c384d
#define T1_KAOS_RANVAL_35     0x5ef098cd
#define T1_KAOS_RANVAL_36     0x0d90db76
#define T1_KAOS_RANVAL_37     0x9711fbfa
#define T1_KAOS_RANVAL_38     0xdbe1e87d
#define T1_KAOS_RANVAL_39     0x7785ae5b
#define T1_KAOS_RANVAL_3a     0x33f1ab7a
#define T1_KAOS_RANVAL_3b     0x73c2a477
#define T1_KAOS_RANVAL_3c     0x8e49cd15
#define T1_KAOS_RANVAL_3d     0x10e2ffa5
#define T1_KAOS_RANVAL_3e     0xfffbeca6
#define T1_KAOS_RANVAL_3f     0x91a6176b
#define T1_KAOS_RANVAL_40     0xf4e2477c
#define T1_KAOS_RANVAL_41     0x0f2fbfe3
#define T1_KAOS_RANVAL_42     0xc9490cac
#define T1_KAOS_RANVAL_43     0x98a81c72
#define T1_KAOS_RANVAL_44     0x23a3cf12
#define T1_KAOS_RANVAL_45     0x4e50535f
#define T1_KAOS_RANVAL_46     0x52c94365
#define T1_KAOS_RANVAL_47     0xe7301e13
#define T1_KAOS_RANVAL_48     0xe39d2e95
#define T1_KAOS_RANVAL_49     0xa9f44b00
#define T1_KAOS_RANVAL_4a     0x0d2ea8ce
#define T1_KAOS_RANVAL_4b     0xd331217d
#define T1_KAOS_RANVAL_4c     0x313bb3c7
#define T1_KAOS_RANVAL_4d     0xc0500524
#define T1_KAOS_RANVAL_4e     0xe1e52753
#define T1_KAOS_RANVAL_4f     0x28150573
#define T1_KAOS_RANVAL_50     0xd4f4354d
#define T1_KAOS_RANVAL_51     0xf38f07b3
#define T1_KAOS_RANVAL_52     0xf020ce50
#define T1_KAOS_RANVAL_53     0x0da83c83
#define T1_KAOS_RANVAL_54     0x3edc12da
#define T1_KAOS_RANVAL_55     0xb9496770
#define T1_KAOS_RANVAL_56     0xf62048d4
#define T1_KAOS_RANVAL_57     0x04ca767d
#define T1_KAOS_RANVAL_58     0xa50f938c
#define T1_KAOS_RANVAL_59     0x4117d092
#define T1_KAOS_RANVAL_5a     0x7e597ca7
#define T1_KAOS_RANVAL_5b     0x49fbed23
#define T1_KAOS_RANVAL_5c     0xbab54695
#define T1_KAOS_RANVAL_5d     0xb9070493
#define T1_KAOS_RANVAL_5e     0x9f22958d
#define T1_KAOS_RANVAL_5f     0xab26481d
#define T1_KAOS_RANVAL_60     0xf0444a1e
#define T1_KAOS_RANVAL_61     0xe164e147
#define T1_KAOS_RANVAL_62     0xfbca00cc
#define T1_KAOS_RANVAL_63     0xe07b4c2f
#define T1_KAOS_RANVAL_64     0xf7ad9c67
#define T1_KAOS_RANVAL_65     0x766e452f
#define T1_KAOS_RANVAL_66     0x54341cec
#define T1_KAOS_RANVAL_67     0x5f32c9ad
#define T1_KAOS_RANVAL_68     0x8e66db32
#define T1_KAOS_RANVAL_69     0x0706650e
#define T1_KAOS_RANVAL_6a     0xe43da1bd
#define T1_KAOS_RANVAL_6b     0xbb947e2d
#define T1_KAOS_RANVAL_6c     0x46571561
#define T1_KAOS_RANVAL_6d     0xc11566bd
#define T1_KAOS_RANVAL_6e     0xfa8e049e
#define T1_KAOS_RANVAL_6f     0x4d51dd7e
#define T1_KAOS_RANVAL_70     0x038c92de
#define T1_KAOS_RANVAL_71     0x47b5553b
#define T1_KAOS_RANVAL_72     0xe7755cfb
#define T1_KAOS_RANVAL_73     0x60fef5d9
#define T1_KAOS_RANVAL_74     0x21acb6ba
#define T1_KAOS_RANVAL_75     0xda31c208
#define T1_KAOS_RANVAL_76     0xd4258d17
#define T1_KAOS_RANVAL_77     0xc2b8e356
#define T1_KAOS_RANVAL_78     0x0f7d5f98
#define T1_KAOS_RANVAL_79     0x8e4fa7b2
#define T1_KAOS_RANVAL_7a     0x614eb30b
#define T1_KAOS_RANVAL_7b     0x7bfb86a1
#define T1_KAOS_RANVAL_7c     0xaaf96a4c
#define T1_KAOS_RANVAL_7d     0x999861af
#define T1_KAOS_RANVAL_7e     0x8623260d
#define T1_KAOS_RANVAL_7f     0xd08f72ed
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
!    areaoffset     6336
!    ncache         0
!    emulate_ncache 1
!    pagesize       8192
!    invsize        0
!    codecount      5002
!    code           13cd6000
!    entry          13cd6000
!    fsr_exceptions 00000000
!    fsr_roundmode  00000004
!    fsr_mask       c0000fff
!    seed           d3d14663fab2
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

KTEXT_MODULE(t0_module_ktbl, 0x13cd6000)
.seg "text"
	KGLOBAL(t0_ktbl)
t0_ktbl_page_begin:
.global t0_kref; t0_kref:
	.skip 0
t0_ktbl:
	.word	0xec1e3ff8	! t0_kref+0x0:   	ldd	[%i0 - 8], %l6
	.word	0xde162000	! t0_kref+0x4:   	lduh	[%i0], %o7
	.word	0xda000019	! t0_kref+0x8:   	ld	[%g0 + %i1], %o5
	.word	0x9e754000	! t0_kref+0xc:   	udiv	%l5, %g0, %o7
	.word	0x8610201d	! t0_kref+0x10:   	mov	0x1d, %g3
	.word	0x86a0e001	! t0_kref+0x14:   	subcc	%g3, 1, %g3
	.word	0x22800016	! t0_kref+0x18:   	be,a	_kref+0x70
	.word	0xd11fbc80	! t0_kref+0x1c:   	ldd	[%fp - 0x380], %f8
	.word	0x81aa0ad0	! t0_kref+0x20:   	fcmped	%fcc0, %f8, %f16
	.word	0x98732446	! t0_kref+0x24:   	udiv	%o4, 0x446, %o4
	.word	0x9474a373	! t0_kref+0x28:   	udiv	%l2, 0x373, %o2
	.word	0x17041f56	! t0_kref+0x2c:   	sethi	%hi(0x107d5800), %o3
	.word	0xadb1c734	! t0_kref+0x30:   	fmuld8ulx16	%f7, %f20, %f22
	.word	0x973dc00d	! t0_kref+0x34:   	sra	%l7, %o5, %o3
	.word	0xe93f4018	! t0_kref+0x38:   	std	%f20, [%i5 + %i0]
	.word	0x8da0053b	! t0_kref+0x3c:   	fsqrts	%f27, %f6
	.word	0xa9a0104c	! t0_kref+0x40:   	fdtox	%f12, %f20
	.word	0xd248a030	! t0_kref+0x44:   	ldsb	[%g2 + 0x30], %o1
	call	SYM(t0_subr1)
	.word	0x9812a077	! t0_kref+0x4c:   	or	%o2, 0x77, %o4
	.word	0x805d0014	! t0_kref+0x50:   	smul	%l4, %l4, %g0
	.word	0xb1a488ca	! t0_kref+0x54:   	fsubd	%f18, %f10, %f24
	.word	0x2dbfffef	! t0_kref+0x58:   	fbg,a	_kref+0x14
	.word	0xef063fe0	! t0_kref+0x5c:   	ld	[%i0 - 0x20], %f23
	.word	0x3a480002	! t0_kref+0x60:   	bcc,a,pt	%icc, _kref+0x68
	.word	0xc12e001c	! t0_kref+0x64:   	st	%fsr, [%i0 + %i4]
	.word	0x972aa014	! t0_kref+0x68:   	sll	%o2, 0x14, %o3
	.word	0x8db00c20	! t0_kref+0x6c:   	fzeros	%f6
	.word	0xde48a021	! t0_kref+0x70:   	ldsb	[%g2 + 0x21], %o7
	.word	0x9de3bfa0	! t0_kref+0x74:   	save	%sp, -0x60, %sp
	.word	0x99ef001a	! t0_kref+0x78:   	restore	%i4, %i2, %o4
	.word	0xad36a013	! t0_kref+0x7c:   	srl	%i2, 0x13, %l6
	.word	0xa1a0054e	! t0_kref+0x80:   	fsqrtd	%f14, %f16
	.word	0xe7ee501d	! t0_kref+0x84:   	prefetcha	%i1 + %i5, 19
	.word	0xa9a58d38	! t0_kref+0x88:   	fsmuld	%f22, %f24, %f20
	.word	0xd608a008	! t0_kref+0x8c:   	ldub	[%g2 + 8], %o3
	.word	0x99b68f46	! t0_kref+0x90:   	fornot1	%f26, %f6, %f12
	.word	0x8fa00035	! t0_kref+0x94:   	fmovs	%f21, %f7
	.word	0xde00a028	! t0_kref+0x98:   	ld	[%g2 + 0x28], %o7
	.word	0x3d800002	! t0_kref+0x9c:   	fbule,a	_kref+0xa4
	.word	0x1f3644c2	! t0_kref+0xa0:   	sethi	%hi(0xd9130800), %o7
	.word	0xda00a000	! t0_kref+0xa4:   	ld	[%g2], %o5
	.word	0x94858013	! t0_kref+0xa8:   	addcc	%l6, %l3, %o2
	.word	0xa9b24a30	! t0_kref+0xac:   	fpadd16s	%f9, %f16, %f20
	.word	0x90b30016	! t0_kref+0xb0:   	orncc	%o4, %l6, %o0
	.word	0x9202e379	! t0_kref+0xb4:   	add	%o3, 0x379, %o1
	.word	0xe11fbd98	! t0_kref+0xb8:   	ldd	[%fp - 0x268], %f16
	.word	0x9b400000	! t0_kref+0xbc:   	mov	%y, %o5
	.word	0x8143c000	! t0_kref+0xc0:   	stbar
	.word	0xd43e001d	! t0_kref+0xc4:   	std	%o2, [%i0 + %i5]
	.word	0xd450a018	! t0_kref+0xc8:   	ldsh	[%g2 + 0x18], %o2
	.word	0xd9beda58	! t0_kref+0xcc:   	stda	%f12, [%i3 + %i0]0xd2
	.word	0x8fb007b6	! t0_kref+0xd0:   	fpackfix	%f22, %f7
	.word	0xb7b18c6a	! t0_kref+0xd4:   	fnors	%f6, %f10, %f27
	.word	0xa9b38e48	! t0_kref+0xd8:   	fxnor	%f14, %f8, %f20
	.word	0x9b400000	! t0_kref+0xdc:   	mov	%y, %o5
	.word	0x9b05e8ea	! t0_kref+0xe0:   	taddcc	%l7, 0x8ea, %o5
	.word	0x9615be00	! t0_kref+0xe4:   	or	%l6, -0x200, %o3
	.word	0xe19eda19	! t0_kref+0xe8:   	ldda	[%i3 + %i1]0xd0, %f16
	.word	0x81a98a2d	! t0_kref+0xec:   	fcmps	%fcc0, %f6, %f13
	.word	0x9da00550	! t0_kref+0xf0:   	fsqrtd	%f16, %f14
	.word	0xef68a0c4	! t0_kref+0xf4:   	prefetch	%g2 + 0xc4, 23
	.word	0x98226186	! t0_kref+0xf8:   	sub	%o1, 0x186, %o4
	.word	0xe43e2000	! t0_kref+0xfc:   	std	%l2, [%i0]
	.word	0xafb2044c	! t0_kref+0x100:   	fcmpne16	%f8, %f12, %l7
	.word	0x91a00539	! t0_kref+0x104:   	fsqrts	%f25, %f8
	.word	0x9736a005	! t0_kref+0x108:   	srl	%i2, 0x5, %o3
	.word	0x925df81a	! t0_kref+0x10c:   	smul	%l7, -0x7e6, %o1
	.word	0x95b3049a	! t0_kref+0x110:   	fcmple32	%f12, %f26, %o2
	.word	0x9da70830	! t0_kref+0x114:   	fadds	%f28, %f16, %f14
	.word	0x99a01894	! t0_kref+0x118:   	fitos	%f20, %f12
	call	1f
	.empty
	.word	0x81b50418	! t0_kref+0x120:   	fcmple16	%f20, %f24, %g0
	.word	0xd1b81018	! t0_kref+0x124:   	stda	%f8, [%g0 + %i0]0x80
	.word	0x97b00072	! t0_kref+0x128:   	edge8ln	%g0, %l2, %o3
1:	.word	0x29800008	! t0_kref+0x12c:   	fbl,a	_kref+0x14c
	.word	0x9084bf51	! t0_kref+0x130:   	addcc	%l2, -0xaf, %o0
	.word	0xeb68a002	! t0_kref+0x134:   	prefetch	%g2 + 2, 21
	.word	0x95a00546	! t0_kref+0x138:   	fsqrtd	%f6, %f10
	.word	0xe6262010	! t0_kref+0x13c:   	st	%l3, [%i0 + 0x10]
	.word	0x35480002	! t0_kref+0x140:   	fbue,a,pt	%fcc0, _kref+0x148
	.word	0x91a01a56	! t0_kref+0x144:   	fdtoi	%f22, %f8
	.word	0x35800008	! t0_kref+0x148:   	fbue,a	_kref+0x168
	.word	0xada388dc	! t0_kref+0x14c:   	fsubd	%f14, %f28, %f22
	.word	0xb1a00525	! t0_kref+0x150:   	fsqrts	%f5, %f24
	.word	0x8ba2893c	! t0_kref+0x154:   	fmuls	%f10, %f28, %f5
	.word	0xa7a0002e	! t0_kref+0x158:   	fmovs	%f14, %f19
	.word	0x90dd800b	! t0_kref+0x15c:   	smulcc	%l6, %o3, %o0
	.word	0xb1b18d60	! t0_kref+0x160:   	fnot1s	%f6, %f24
	.word	0xa9a60d3d	! t0_kref+0x164:   	fsmuld	%f24, %f29, %f20
	.word	0xe4087914	! t0_kref+0x168:   	ldub	[%g1 - 0x6ec], %l2
	.word	0xa41ca00c	! t0_kref+0x16c:   	xor	%l2, 0xc, %l2
	.word	0xe4287914	! t0_kref+0x170:   	stb	%l2, [%g1 - 0x6ec]
	.word	0x81d87914	! t0_kref+0x174:   	flush	%g1 - 0x6ec
	.word	0x33480008	! t0_kref+0x178:   	fbe,a,pt	%fcc0, _kref+0x198
	.word	0xe636c019	! t0_kref+0x17c:   	sth	%l3, [%i3 + %i1]
	.word	0x92e0306e	! t0_kref+0x180:   	subccc	%g0, -0xf92, %o1
	.word	0x95a00546	! t0_kref+0x184:   	fsqrtd	%f6, %f10
	.word	0xa5a6cd28	! t0_kref+0x188:   	fsmuld	%f27, %f8, %f18
2:	.word	0x9602801a	! t0_kref+0x18c:   	add	%o2, %i2, %o3
	.word	0xacd4ec75	! t0_kref+0x190:   	umulcc	%l3, 0xc75, %l6
	.word	0xe83e7ff0	! t0_kref+0x194:   	std	%l4, [%i1 - 0x10]
	.word	0xefee501d	! t0_kref+0x198:   	prefetcha	%i1 + %i5, 23
	.word	0xee4e8019	! t0_kref+0x19c:   	ldsb	[%i2 + %i1], %l7
	.word	0x90be800a	! t0_kref+0x1a0:   	xnorcc	%i2, %o2, %o0
	.word	0x23800006	! t0_kref+0x1a4:   	fbne,a	_kref+0x1bc
	.word	0xde08a00a	! t0_kref+0x1a8:   	ldub	[%g2 + 0xa], %o7
	.word	0xae5d69a9	! t0_kref+0x1ac:   	smul	%l5, 0x9a9, %l7
	.word	0x9b40c000	! t0_kref+0x1b0:   	mov	%asi, %o5
	.word	0xa5a01a48	! t0_kref+0x1b4:   	fdtoi	%f8, %f18
	.word	0xa5a01088	! t0_kref+0x1b8:   	fxtos	%f8, %f18
	.word	0x9f04fa64	! t0_kref+0x1bc:   	taddcc	%l3, -0x59c, %o7
	.word	0x9740c000	! t0_kref+0x1c0:   	mov	%asi, %o3
	.word	0xb7b10d30	! t0_kref+0x1c4:   	fandnot1s	%f4, %f16, %f27
	.word	0x81400000	! t0_kref+0x1c8:   	mov	%y, %g0
	.word	0xe46e601d	! t0_kref+0x1cc:   	ldstub	[%i1 + 0x1d], %l2
	.word	0xad3d6000	! t0_kref+0x1d0:   	sra	%l5, 0x0, %l6
	.word	0xad400000	! t0_kref+0x1d4:   	mov	%y, %l6
	.word	0x89a509d2	! t0_kref+0x1d8:   	fdivd	%f20, %f18, %f4
	.word	0x9ed578f9	! t0_kref+0x1dc:   	umulcc	%l5, -0x707, %o7
	call	SYM(t0_subr2)
	.word	0x152704c6	! t0_kref+0x1e4:   	sethi	%hi(0x9c131800), %o2
	.word	0xa1b24704	! t0_kref+0x1e8:   	fmuld8sux16	%f9, %f4, %f16
	.word	0x2d480007	! t0_kref+0x1ec:   	fbg,a,pt	%fcc0, _kref+0x208
	.word	0xd11fbea8	! t0_kref+0x1f0:   	ldd	[%fp - 0x158], %f8
	.word	0xc91fbc30	! t0_kref+0x1f4:   	ldd	[%fp - 0x3d0], %f4
	.word	0xc0266004	! t0_kref+0x1f8:   	clr	[%i1 + 4]
	.word	0x21800005	! t0_kref+0x1fc:   	fbn,a	_kref+0x210
	.word	0x9bb58200	! t0_kref+0x200:   	array8	%l6, %g0, %o5
	.word	0x9da7092e	! t0_kref+0x204:   	fmuls	%f28, %f14, %f14
	.word	0x95400000	! t0_kref+0x208:   	mov	%y, %o2
	.word	0x808a4009	! t0_kref+0x20c:   	btst	%o1, %o1
	.word	0xd01e3fe8	! t0_kref+0x210:   	ldd	[%i0 - 0x18], %o0
	.word	0x95400000	! t0_kref+0x214:   	mov	%y, %o2
	.word	0x89b40e50	! t0_kref+0x218:   	fxnor	%f16, %f16, %f4
	.word	0xac25af36	! t0_kref+0x21c:   	sub	%l6, 0xf36, %l6
	.word	0x31800004	! t0_kref+0x220:   	fba,a	_kref+0x230
	.word	0x925cc017	! t0_kref+0x224:   	smul	%l3, %l7, %o1
	.word	0x8da688d8	! t0_kref+0x228:   	fsubd	%f26, %f24, %f6
	.word	0xa9a509c8	! t0_kref+0x22c:   	fdivd	%f20, %f8, %f20
	.word	0x91b580d6	! t0_kref+0x230:   	edge16l	%l6, %l6, %o0
	.word	0x953a4012	! t0_kref+0x234:   	sra	%o1, %l2, %o2
	.word	0x9fc00004	! t0_kref+0x238:   	call	%g0 + %g4
	.word	0x81820000	! t0_kref+0x23c:   	wr	%o0, %g0, %y
	.word	0xc008a021	! t0_kref+0x240:   	ldub	[%g2 + 0x21], %g0
	.word	0x86102012	! t0_kref+0x244:   	mov	0x12, %g3
	.word	0x86a0e001	! t0_kref+0x248:   	subcc	%g3, 1, %g3
	.word	0x22800003	! t0_kref+0x24c:   	be,a	_kref+0x258
	.word	0xa9a2c82b	! t0_kref+0x250:   	fadds	%f11, %f11, %f20
	.word	0x81ae4a25	! t0_kref+0x254:   	fcmps	%fcc0, %f25, %f5
	.word	0x86102020	! t0_kref+0x258:   	mov	0x20, %g3
	.word	0x86a0e001	! t0_kref+0x25c:   	subcc	%g3, 1, %g3
	.word	0x2280001f	! t0_kref+0x260:   	be,a	_kref+0x2dc
	.word	0xbba00526	! t0_kref+0x264:   	fsqrts	%f6, %f29
	.word	0x9f2a4000	! t0_kref+0x268:   	sll	%o1, %g0, %o7
	.word	0xacd5eb92	! t0_kref+0x26c:   	umulcc	%l7, 0xb92, %l6
	.word	0xef00a008	! t0_kref+0x270:   	ld	[%g2 + 8], %f23
	.word	0x28800005	! t0_kref+0x274:   	bleu,a	_kref+0x288
	.word	0x99b6859a	! t0_kref+0x278:   	fcmpgt32	%f26, %f26, %o4
	.word	0xb9a00035	! t0_kref+0x27c:   	fmovs	%f21, %f28
	.word	0xb5a588aa	! t0_kref+0x280:   	fsubs	%f22, %f10, %f26
	.word	0xd4000019	! t0_kref+0x284:   	ld	[%g0 + %i1], %o2
	.word	0x8143c000	! t0_kref+0x288:   	stbar
	.word	0xc168a006	! t0_kref+0x28c:   	prefetch	%g2 + 6, 0
	.word	0x33800006	! t0_kref+0x290:   	fbe,a	_kref+0x2a8
	.word	0xd2fe1000	! t0_kref+0x294:   	swapa	[%i0]0x80, %o1
	.word	0xac65f39f	! t0_kref+0x298:   	subc	%l7, -0xc61, %l6
	.word	0xd820a018	! t0_kref+0x29c:   	st	%o4, [%g2 + 0x18]
	.word	0x94d4a963	! t0_kref+0x2a0:   	umulcc	%l2, 0x963, %o2
	.word	0x9b3ae00d	! t0_kref+0x2a4:   	sra	%o3, 0xd, %o5
	.word	0xc768a003	! t0_kref+0x2a8:   	prefetch	%g2 + 3, 3
	.word	0xb7a01885	! t0_kref+0x2ac:   	fitos	%f5, %f27
	.word	0xc900a030	! t0_kref+0x2b0:   	ld	[%g2 + 0x30], %f4
	.word	0x95a108da	! t0_kref+0x2b4:   	fsubd	%f4, %f26, %f10
	.word	0xa3a0188d	! t0_kref+0x2b8:   	fitos	%f13, %f17
	.word	0x31bfffe8	! t0_kref+0x2bc:   	fba,a	_kref+0x25c
	.word	0xe878a000	! t0_kref+0x2c0:   	swap	[%g2], %l4
	.word	0xada54d36	! t0_kref+0x2c4:   	fsmuld	%f21, %f22, %f22
	.word	0x95280015	! t0_kref+0x2c8:   	sll	%g0, %l5, %o2
	.word	0x9f3c8000	! t0_kref+0x2cc:   	sra	%l2, %g0, %o7
	.word	0x8143c000	! t0_kref+0x2d0:   	stbar
	.word	0xa1a589d4	! t0_kref+0x2d4:   	fdivd	%f22, %f20, %f16
	.word	0xb1a3c835	! t0_kref+0x2d8:   	fadds	%f15, %f21, %f24
	.word	0x37480002	! t0_kref+0x2dc:   	fbge,a,pt	%fcc0, _kref+0x2e4
	.word	0x9a5a0012	! t0_kref+0x2e0:   	smul	%o0, %l2, %o5
	.word	0x94803519	! t0_kref+0x2e4:   	addcc	%g0, -0xae7, %o2
	.word	0x9824ab23	! t0_kref+0x2e8:   	sub	%l2, 0xb23, %o4
	.word	0x9ab2000c	! t0_kref+0x2ec:   	orncc	%o0, %o4, %o5
	.word	0xa5b14dec	! t0_kref+0x2f0:   	fnands	%f5, %f12, %f18
	.word	0xa1a00534	! t0_kref+0x2f4:   	fsqrts	%f20, %f16
	.word	0x9ab2c015	! t0_kref+0x2f8:   	orncc	%o3, %l5, %o5
	.word	0x81ac8ace	! t0_kref+0x2fc:   	fcmped	%fcc0, %f18, %f14
	.word	0xd03e7fe0	! t0_kref+0x300:   	std	%o0, [%i1 - 0x20]
	.word	0xdaee9019	! t0_kref+0x304:   	ldstuba	[%i2 + %i1]0x80, %o5
	.word	0x96b5c014	! t0_kref+0x308:   	orncc	%l7, %l4, %o3
	.word	0x2b480002	! t0_kref+0x30c:   	fbug,a,pt	%fcc0, _kref+0x314
	.word	0x94c530a7	! t0_kref+0x310:   	addccc	%l4, -0xf59, %o2
	.word	0xe3b8a080	! t0_kref+0x314:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xdd200018	! t0_kref+0x318:   	st	%f14, [%g0 + %i0]
	.word	0xae84f723	! t0_kref+0x31c:   	addcc	%l3, -0x8dd, %l7
	.word	0x89a7482f	! t0_kref+0x320:   	fadds	%f29, %f15, %f4
	.word	0xc00e3fe1	! t0_kref+0x324:   	ldub	[%i0 - 0x1f], %g0
	.word	0xee28a023	! t0_kref+0x328:   	stb	%l7, [%g2 + 0x23]
	.word	0x31800006	! t0_kref+0x32c:   	fba,a	_kref+0x344
	.word	0xadb2855c	! t0_kref+0x330:   	fcmpeq16	%f10, %f28, %l6
	.word	0x8da5c82e	! t0_kref+0x334:   	fadds	%f23, %f14, %f6
	.word	0xd8865000	! t0_kref+0x338:   	lda	[%i1]0x80, %o4
	.word	0xd93f4019	! t0_kref+0x33c:   	std	%f12, [%i5 + %i1]
	.word	0xd51fbf80	! t0_kref+0x340:   	ldd	[%fp - 0x80], %f10
	.word	0xb7a000b6	! t0_kref+0x344:   	fnegs	%f22, %f27
	.word	0xf700a018	! t0_kref+0x348:   	ld	[%g2 + 0x18], %f27
	.word	0xee774019	! t0_kref+0x34c:   	stx	%l7, [%i5 + %i1]
	.word	0x9da309ca	! t0_kref+0x350:   	fdivd	%f12, %f10, %f14
	.word	0xafb300c0	! t0_kref+0x354:   	edge16l	%o4, %g0, %l7
	.word	0xf4364000	! t0_kref+0x358:   	sth	%i2, [%i1]
	.word	0x29480008	! t0_kref+0x35c:   	fbl,a,pt	%fcc0, _kref+0x37c
	.word	0x988cc01a	! t0_kref+0x360:   	andcc	%l3, %i2, %o4
	.word	0x25800003	! t0_kref+0x364:   	fblg,a	_kref+0x370
	.word	0xec86101c	! t0_kref+0x368:   	lda	[%i0 + %i4]0x80, %l6
	.word	0xae53229a	! t0_kref+0x36c:   	umul	%o4, 0x29a, %l7
	.word	0x90d021f8	! t0_kref+0x370:   	umulcc	%g0, 0x1f8, %o0
	.word	0x9fa509a4	! t0_kref+0x374:   	fdivs	%f20, %f4, %f15
	.word	0xc807bfec	! t0_kref+0x378:   	ld	[%fp - 0x14], %g4
	.word	0x91a0055c	! t0_kref+0x37c:   	fsqrtd	%f28, %f8
	.word	0xc00e4000	! t0_kref+0x380:   	ldub	[%i1], %g0
	.word	0x81aeca28	! t0_kref+0x384:   	fcmps	%fcc0, %f27, %f8
	.word	0xe3b8a080	! t0_kref+0x388:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xde0e8018	! t0_kref+0x38c:   	ldub	[%i2 + %i0], %o7
	.word	0x9ab58013	! t0_kref+0x390:   	orncc	%l6, %l3, %o5
	.word	0x9a13000b	! t0_kref+0x394:   	or	%o4, %o3, %o5
	.word	0x86102003	! t0_kref+0x398:   	mov	0x3, %g3
	.word	0x86a0e001	! t0_kref+0x39c:   	subcc	%g3, 1, %g3
	.word	0x22800019	! t0_kref+0x3a0:   	be,a	_kref+0x404
	.word	0xed68a085	! t0_kref+0x3a4:   	prefetch	%g2 + 0x85, 22
	.word	0xd80e8019	! t0_kref+0x3a8:   	ldub	[%i2 + %i1], %o4
	.word	0x96336204	! t0_kref+0x3ac:   	orn	%o5, 0x204, %o3
	.word	0x3d800004	! t0_kref+0x3b0:   	fbule,a	_kref+0x3c0
	.word	0x89a0105a	! t0_kref+0x3b4:   	fdtox	%f26, %f4
	.word	0xec4e6006	! t0_kref+0x3b8:   	ldsb	[%i1 + 6], %l6
	.word	0xc398a040	! t0_kref+0x3bc:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xacd5000a	! t0_kref+0x3c0:   	umulcc	%l4, %o2, %l6
	.word	0xafb68598	! t0_kref+0x3c4:   	fcmpgt32	%f26, %f24, %l7
	.word	0xd450a008	! t0_kref+0x3c8:   	ldsh	[%g2 + 8], %o2
	.word	0x9102c013	! t0_kref+0x3cc:   	taddcc	%o3, %l3, %o0
	.word	0x9afa400c	! t0_kref+0x3d0:   	sdivcc	%o1, %o4, %o5
	.word	0xb9a6c93d	! t0_kref+0x3d4:   	fmuls	%f27, %f29, %f28
	.word	0x923cc00a	! t0_kref+0x3d8:   	xnor	%l3, %o2, %o1
	.word	0x89b18a04	! t0_kref+0x3dc:   	fpadd16	%f6, %f4, %f4
	.word	0xd4f61000	! t0_kref+0x3e0:   	stxa	%o2, [%i0]0x80
	.word	0x9da74d3b	! t0_kref+0x3e4:   	fsmuld	%f29, %f27, %f14
	.word	0x23bfffed	! t0_kref+0x3e8:   	fbne,a	_kref+0x39c
	.word	0xa3a00536	! t0_kref+0x3ec:   	fsqrts	%f22, %f17
	.word	0x27bfffeb	! t0_kref+0x3f0:   	fbul,a	_kref+0x39c
	.word	0xd2266014	! t0_kref+0x3f4:   	st	%o1, [%i1 + 0x14]
	.word	0xfbee501b	! t0_kref+0x3f8:   	prefetcha	%i1 + %i3, 29
	.word	0xec7e3ff4	! t0_kref+0x3fc:   	swap	[%i0 - 0xc], %l6
	.word	0xec861000	! t0_kref+0x400:   	lda	[%i0]0x80, %l6
	.word	0xe3b8a080	! t0_kref+0x404:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x9fc00004	! t0_kref+0x408:   	call	%g0 + %g4
	.word	0x925cbe6e	! t0_kref+0x40c:   	smul	%l2, -0x192, %o1
	.word	0x9ba0188d	! t0_kref+0x410:   	fitos	%f13, %f13
	.word	0xd4fe501c	! t0_kref+0x414:   	swapa	[%i1 + %i4]0x80, %o2
	.word	0xeb68a109	! t0_kref+0x418:   	prefetch	%g2 + 0x109, 21
	.word	0x8110000c	! t0_kref+0x41c:   	taddcctv	%g0, %o4, %g0
	.word	0x81a98ad8	! t0_kref+0x420:   	fcmped	%fcc0, %f6, %f24
	.word	0x9de3bfa0	! t0_kref+0x424:   	save	%sp, -0x60, %sp
	.word	0x805e801b	! t0_kref+0x428:   	smul	%i2, %i3, %g0
	.word	0xafee3e57	! t0_kref+0x42c:   	restore	%i0, -0x1a9, %l7
	.word	0x91b2832b	! t0_kref+0x430:   	bmask	%o2, %o3, %o0
	.word	0x9b400000	! t0_kref+0x434:   	mov	%y, %o5
	.word	0xac8b3a5a	! t0_kref+0x438:   	andcc	%o4, -0x5a6, %l6
	.word	0xb7a508bc	! t0_kref+0x43c:   	fsubs	%f20, %f28, %f27
	.word	0x94d2f8c0	! t0_kref+0x440:   	umulcc	%o3, -0x740, %o2
	.word	0x9115ee24	! t0_kref+0x444:   	taddcctv	%l7, 0xe24, %o0
	.word	0xd2062010	! t0_kref+0x448:   	ld	[%i0 + 0x10], %o1
	.word	0xc0066010	! t0_kref+0x44c:   	ld	[%i1 + 0x10], %g0
	.word	0x9f28000b	! t0_kref+0x450:   	sll	%g0, %o3, %o7
	.word	0xe168a006	! t0_kref+0x454:   	prefetch	%g2 + 6, 16
	.word	0x3b800001	! t0_kref+0x458:   	fble,a	_kref+0x45c
	.word	0xa5a588d0	! t0_kref+0x45c:   	fsubd	%f22, %f16, %f18
	.word	0x3c480005	! t0_kref+0x460:   	bpos,a,pt	%icc, _kref+0x474
	.word	0xc008a023	! t0_kref+0x464:   	ldub	[%g2 + 0x23], %g0
	.word	0xf43e3ff8	! t0_kref+0x468:   	std	%i2, [%i0 - 8]
	.word	0x23800003	! t0_kref+0x46c:   	fbne,a	_kref+0x478
	.word	0xc99e9a18	! t0_kref+0x470:   	ldda	[%i2 + %i0]0xd0, %f4
	.word	0x96256700	! t0_kref+0x474:   	sub	%l5, 0x700, %o3
	.word	0xd008a008	! t0_kref+0x478:   	ldub	[%g2 + 8], %o0
	.word	0xd02e8019	! t0_kref+0x47c:   	stb	%o0, [%i2 + %i1]
	.word	0x93b2c200	! t0_kref+0x480:   	array8	%o3, %g0, %o1
	.word	0x8ba689b2	! t0_kref+0x484:   	fdivs	%f26, %f18, %f5
	.word	0xd53e7fe8	! t0_kref+0x488:   	std	%f10, [%i1 - 0x18]
	.word	0xc010a010	! t0_kref+0x48c:   	lduh	[%g2 + 0x10], %g0
	.word	0x9ebd2277	! t0_kref+0x490:   	xnorcc	%l4, 0x277, %o7
	.word	0x92c6bb89	! t0_kref+0x494:   	addccc	%i2, -0x477, %o1
	.word	0x81b5c08c	! t0_kref+0x498:   	edge16	%l7, %o4, %g0
	.word	0x89a0052f	! t0_kref+0x49c:   	fsqrts	%f15, %f4
	.word	0xd610a018	! t0_kref+0x4a0:   	lduh	[%g2 + 0x18], %o3
	.word	0xd020a038	! t0_kref+0x4a4:   	st	%o0, [%g2 + 0x38]
	.word	0xafb48454	! t0_kref+0x4a8:   	fcmpne16	%f18, %f20, %l7
	.word	0xbba000b4	! t0_kref+0x4ac:   	fnegs	%f20, %f29
	.word	0xe7ee101d	! t0_kref+0x4b0:   	prefetcha	%i0 + %i5, 19
	.word	0x31800008	! t0_kref+0x4b4:   	fba,a	_kref+0x4d4
	.word	0x9da00546	! t0_kref+0x4b8:   	fsqrtd	%f6, %f14
	.word	0xd0362016	! t0_kref+0x4bc:   	sth	%o0, [%i0 + 0x16]
	.word	0xd700a018	! t0_kref+0x4c0:   	ld	[%g2 + 0x18], %f11
	.word	0xa1a0054a	! t0_kref+0x4c4:   	fsqrtd	%f10, %f16
	.word	0xd478a008	! t0_kref+0x4c8:   	swap	[%g2 + 8], %o2
	.word	0x9170000c	! t0_kref+0x4cc:   	popc	%o4, %o0
	.word	0xb1a00034	! t0_kref+0x4d0:   	fmovs	%f20, %f24
	.word	0xf11fbdb8	! t0_kref+0x4d4:   	ldd	[%fp - 0x248], %f24
	.word	0xe100a010	! t0_kref+0x4d8:   	ld	[%g2 + 0x10], %f16
	.word	0x9e8b7f2d	! t0_kref+0x4dc:   	andcc	%o5, -0xd3, %o7
	.word	0x31800006	! t0_kref+0x4e0:   	fba,a	_kref+0x4f8
	.word	0xdf260000	! t0_kref+0x4e4:   	st	%f15, [%i0]
	.word	0x21800004	! t0_kref+0x4e8:   	fbn,a	_kref+0x4f8
	.word	0xafb184da	! t0_kref+0x4ec:   	fcmpne32	%f6, %f26, %l7
	.word	0x9fb580cb	! t0_kref+0x4f0:   	edge16l	%l6, %o3, %o7
	.word	0x8da00035	! t0_kref+0x4f4:   	fmovs	%f21, %f6
	.word	0xe5264000	! t0_kref+0x4f8:   	st	%f18, [%i1]
	.word	0xde06001c	! t0_kref+0x4fc:   	ld	[%i0 + %i4], %o7
	.word	0x99a00527	! t0_kref+0x500:   	fsqrts	%f7, %f12
	.word	0xe968a107	! t0_kref+0x504:   	prefetch	%g2 + 0x107, 20
	.word	0xd04e601f	! t0_kref+0x508:   	ldsb	[%i1 + 0x1f], %o0
	.word	0xd220a030	! t0_kref+0x50c:   	st	%o1, [%g2 + 0x30]
	.word	0xb5b30af1	! t0_kref+0x510:   	fpsub32s	%f12, %f17, %f26
	.word	0xd600a018	! t0_kref+0x514:   	ld	[%g2 + 0x18], %o3
	.word	0xa9b28a04	! t0_kref+0x518:   	fpadd16	%f10, %f4, %f20
	.word	0x1108c30e	! t0_kref+0x51c:   	sethi	%hi(0x230c3800), %o0
	.word	0xc768a0c7	! t0_kref+0x520:   	prefetch	%g2 + 0xc7, 3
	.word	0x9e048012	! t0_kref+0x524:   	add	%l2, %l2, %o7
	.word	0x908b4008	! t0_kref+0x528:   	andcc	%o5, %o0, %o0
	.word	0x9ad50015	! t0_kref+0x52c:   	umulcc	%l4, %l5, %o5
	.word	0xafa00530	! t0_kref+0x530:   	fsqrts	%f16, %f23
	.word	0xf11fbf48	! t0_kref+0x534:   	ldd	[%fp - 0xb8], %f24
	.word	0x13195f19	! t0_kref+0x538:   	sethi	%hi(0x657c6400), %o1
	.word	0x89b2cd60	! t0_kref+0x53c:   	fnot1s	%f11, %f4
	.word	0xd076001d	! t0_kref+0x540:   	stx	%o0, [%i0 + %i5]
	.word	0xc010a02a	! t0_kref+0x544:   	lduh	[%g2 + 0x2a], %g0
	.word	0xeefe1000	! t0_kref+0x548:   	swapa	[%i0]0x80, %l7
	.word	0xa7a00028	! t0_kref+0x54c:   	fmovs	%f8, %f19
	.word	0xc12e7ffc	! t0_kref+0x550:   	st	%fsr, [%i1 - 4]
	.word	0x81850000	! t0_kref+0x554:   	wr	%l4, %g0, %y
	.word	0xd2367ff6	! t0_kref+0x558:   	sth	%o1, [%i1 - 0xa]
	.word	0x9fa74924	! t0_kref+0x55c:   	fmuls	%f29, %f4, %f15
	.word	0x9f1db8e9	! t0_kref+0x560:   	tsubcctv	%l6, -0x717, %o7
	.word	0x97b70554	! t0_kref+0x564:   	fcmpeq16	%f28, %f20, %o3
	.word	0x9ad6800b	! t0_kref+0x568:   	umulcc	%i2, %o3, %o5
	.word	0x2f2c9571	! t0_kref+0x56c:   	sethi	%hi(0xb255c400), %l7
	.word	0xea36c019	! t0_kref+0x570:   	sth	%l5, [%i3 + %i1]
	.word	0x37480002	! t0_kref+0x574:   	fbge,a,pt	%fcc0, _kref+0x57c
	.word	0x9274c014	! t0_kref+0x578:   	udiv	%l3, %l4, %o1
	.word	0xe8270019	! t0_kref+0x57c:   	st	%l4, [%i4 + %i1]
	.word	0x90522eff	! t0_kref+0x580:   	umul	%o0, 0xeff, %o0
	.word	0x31480007	! t0_kref+0x584:   	fba,a,pt	%fcc0, _kref+0x5a0
	.word	0xeb200018	! t0_kref+0x588:   	st	%f21, [%g0 + %i0]
	.word	0x91b10d3c	! t0_kref+0x58c:   	fandnot1s	%f4, %f28, %f8
	.word	0xb5a489ca	! t0_kref+0x590:   	fdivd	%f18, %f10, %f26
	.word	0xb5a0053c	! t0_kref+0x594:   	fsqrts	%f28, %f26
	.word	0x80db4015	! t0_kref+0x598:   	smulcc	%o5, %l5, %g0
	.word	0xd60e4000	! t0_kref+0x59c:   	ldub	[%i1], %o3
	.word	0xae5a3417	! t0_kref+0x5a0:   	smul	%o0, -0xbe9, %l7
	.word	0xe3b8a080	! t0_kref+0x5a4:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xd01f4018	! t0_kref+0x5a8:   	ldd	[%i5 + %i0], %o0
	.word	0x27480006	! t0_kref+0x5ac:   	fbul,a,pt	%fcc0, _kref+0x5c4
	.word	0xd4070019	! t0_kref+0x5b0:   	ld	[%i4 + %i1], %o2
	.word	0x8182c000	! t0_kref+0x5b4:   	wr	%o3, %g0, %y
	.word	0x91a588b6	! t0_kref+0x5b8:   	fsubs	%f22, %f22, %f8
	.word	0xb9a000bb	! t0_kref+0x5bc:   	fnegs	%f27, %f28
	.word	0xe3b8a080	! t0_kref+0x5c0:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x9f34a008	! t0_kref+0x5c4:   	srl	%l2, 0x8, %o7
	.word	0xa3a64826	! t0_kref+0x5c8:   	fadds	%f25, %f6, %f17
	.word	0x9e92c012	! t0_kref+0x5cc:   	orcc	%o3, %l2, %o7
	.word	0xd9be5817	! t0_kref+0x5d0:   	stda	%f12, [%i1 + %l7]0xc0
	.word	0xb7a688af	! t0_kref+0x5d4:   	fsubs	%f26, %f15, %f27
	.word	0xe26e8019	! t0_kref+0x5d8:   	ldstub	[%i2 + %i1], %l1
	.word	0xc008a011	! t0_kref+0x5dc:   	ldub	[%g2 + 0x11], %g0
	.word	0xacd24013	! t0_kref+0x5e0:   	umulcc	%o1, %l3, %l6
	.word	0xcf200018	! t0_kref+0x5e4:   	st	%f7, [%g0 + %i0]
	.word	0xde0e6006	! t0_kref+0x5e8:   	ldub	[%i1 + 6], %o7
	.word	0x31800005	! t0_kref+0x5ec:   	fba,a	_kref+0x600
	.word	0xd248a031	! t0_kref+0x5f0:   	ldsb	[%g2 + 0x31], %o1
	.word	0xad1ac00c	! t0_kref+0x5f4:   	tsubcctv	%o3, %o4, %l6
	.word	0xb1a00552	! t0_kref+0x5f8:   	fsqrtd	%f18, %f24
	.word	0xd00e001a	! t0_kref+0x5fc:   	ldub	[%i0 + %i2], %o0
	.word	0x9a558012	! t0_kref+0x600:   	umul	%l6, %l2, %o5
	.word	0x9ed4e6a5	! t0_kref+0x604:   	umulcc	%l3, 0x6a5, %o7
	.word	0x81ae8ad2	! t0_kref+0x608:   	fcmped	%fcc0, %f26, %f18
	.word	0x9ab5a71c	! t0_kref+0x60c:   	orncc	%l6, 0x71c, %o5
	.word	0xec50a020	! t0_kref+0x610:   	ldsh	[%g2 + 0x20], %l6
	.word	0xec4e8018	! t0_kref+0x614:   	ldsb	[%i2 + %i0], %l6
	.word	0xb9a01a3b	! t0_kref+0x618:   	fstoi	%f27, %f28
	.word	0xb1a01910	! t0_kref+0x61c:   	fitod	%f16, %f24
	.word	0xd03e2008	! t0_kref+0x620:   	std	%o0, [%i0 + 8]
	.word	0x9664feb3	! t0_kref+0x624:   	subc	%l3, -0x14d, %o3
	.word	0x92224014	! t0_kref+0x628:   	sub	%o1, %l4, %o1
	.word	0x8db3898e	! t0_kref+0x62c:   	bshuffle	%f14, %f14, %f6
	.word	0x96c6800d	! t0_kref+0x630:   	addccc	%i2, %o5, %o3
	.word	0xeb00a030	! t0_kref+0x634:   	ld	[%g2 + 0x30], %f21
	.word	0xda08a020	! t0_kref+0x638:   	ldub	[%g2 + 0x20], %o5
	.word	0x91a00554	! t0_kref+0x63c:   	fsqrtd	%f20, %f8
	.word	0xeea81019	! t0_kref+0x640:   	stba	%l7, [%g0 + %i1]0x80
	.word	0x80e4800d	! t0_kref+0x644:   	subccc	%l2, %o5, %g0
	.word	0xdd801019	! t0_kref+0x648:   	lda	[%g0 + %i1]0x80, %f14
	.word	0xf43e2008	! t0_kref+0x64c:   	std	%i2, [%i0 + 8]
	.word	0x9da01a54	! t0_kref+0x650:   	fdtoi	%f20, %f14
	.word	0x2b480007	! t0_kref+0x654:   	fbug,a,pt	%fcc0, _kref+0x670
	.word	0x9fb5c0c8	! t0_kref+0x658:   	edge16l	%l7, %o0, %o7
	.word	0x9e75723f	! t0_kref+0x65c:   	udiv	%l5, -0xdc1, %o7
	.word	0x99b10e10	! t0_kref+0x660:   	fand	%f4, %f16, %f12
	.word	0x81ae4a39	! t0_kref+0x664:   	fcmps	%fcc0, %f25, %f25
	call	SYM(t0_subr2)
	.word	0xc568a106	! t0_kref+0x66c:   	prefetch	%g2 + 0x106, 2
	.word	0xd25f4018	! t0_kref+0x670:   	ldx	[%i5 + %i0], %o1
	.word	0x86102004	! t0_kref+0x674:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x678:   	bne,a	_kref+0x678
	.word	0x86a0e001	! t0_kref+0x67c:   	subcc	%g3, 1, %g3
	.word	0x9eb30008	! t0_kref+0x680:   	orncc	%o4, %o0, %o7
	.word	0xde462000	! t0_kref+0x684:   	ldsw	[%i0], %o7
	.word	0xa1b107d8	! t0_kref+0x688:   	pdist	%f4, %f24, %f16
	.word	0x1b3bd7a0	! t0_kref+0x68c:   	sethi	%hi(0xef5e8000), %o5
	.word	0x81ad8a2c	! t0_kref+0x690:   	fcmps	%fcc0, %f22, %f12
	.word	0x8072792d	! t0_kref+0x694:   	udiv	%o1, -0x6d3, %g0
	.word	0x928ca4d6	! t0_kref+0x698:   	andcc	%l2, 0x4d6, %o1
	.word	0x8db38a8a	! t0_kref+0x69c:   	fpsub16	%f14, %f10, %f6
	.word	0xb1a0055c	! t0_kref+0x6a0:   	fsqrtd	%f28, %f24
	.word	0x9de3bfa0	! t0_kref+0x6a4:   	save	%sp, -0x60, %sp
	.word	0xb85ec01d	! t0_kref+0x6a8:   	smul	%i3, %i5, %i4
	.word	0xafee3bfc	! t0_kref+0x6ac:   	restore	%i0, -0x404, %l7
	.word	0x9ad2a8d3	! t0_kref+0x6b0:   	umulcc	%o2, 0x8d3, %o5
	call	SYM(t0_subr2)
	.word	0xa5a509c6	! t0_kref+0x6b8:   	fdivd	%f20, %f6, %f18
	.word	0xec3e3fe8	! t0_kref+0x6bc:   	std	%l6, [%i0 - 0x18]
	.word	0x9662c00a	! t0_kref+0x6c0:   	subc	%o3, %o2, %o3
	.word	0x993ce017	! t0_kref+0x6c4:   	sra	%l3, 0x17, %o4
	.word	0x9a5cc013	! t0_kref+0x6c8:   	smul	%l3, %l3, %o5
	.word	0x8da01933	! t0_kref+0x6cc:   	fstod	%f19, %f6
	.word	0x8070000c	! t0_kref+0x6d0:   	udiv	%g0, %o4, %g0
	.word	0xe19e1a1b	! t0_kref+0x6d4:   	ldda	[%i0 + %i3]0xd0, %f16
	.word	0xec1e0000	! t0_kref+0x6d8:   	ldd	[%i0], %l6
	.word	0x9da4cd24	! t0_kref+0x6dc:   	fsmuld	%f19, %f4, %f14
	.word	0xd816c018	! t0_kref+0x6e0:   	lduh	[%i3 + %i0], %o4
	.word	0xb3a14837	! t0_kref+0x6e4:   	fadds	%f5, %f23, %f25
	.word	0x9b3ea005	! t0_kref+0x6e8:   	sra	%i2, 0x5, %o5
	.word	0x9fb3caef	! t0_kref+0x6ec:   	fpsub32s	%f15, %f15, %f15
	.word	0xc010a038	! t0_kref+0x6f0:   	lduh	[%g2 + 0x38], %g0
	.word	0x993ae005	! t0_kref+0x6f4:   	sra	%o3, 0x5, %o4
	.word	0xb5a01910	! t0_kref+0x6f8:   	fitod	%f16, %f26
	.word	0x812de01d	! t0_kref+0x6fc:   	sll	%l7, 0x1d, %g0
	.word	0xe11fbd10	! t0_kref+0x700:   	ldd	[%fp - 0x2f0], %f16
	.word	0x9fb50200	! t0_kref+0x704:   	array8	%l4, %g0, %o7
	.word	0x8db38a8c	! t0_kref+0x708:   	fpsub16	%f14, %f12, %f6
	.word	0xfbee501d	! t0_kref+0x70c:   	prefetcha	%i1 + %i5, 29
	.word	0x99a74835	! t0_kref+0x710:   	fadds	%f29, %f21, %f12
	.word	0x93b4816b	! t0_kref+0x714:   	edge32ln	%l2, %o3, %o1
	.word	0x26800008	! t0_kref+0x718:   	bl,a	_kref+0x738
	.word	0xd700a030	! t0_kref+0x71c:   	ld	[%g2 + 0x30], %f11
	.word	0x3c480001	! t0_kref+0x720:   	bpos,a,pt	%icc, _kref+0x724
	.word	0x9b408000	! t0_kref+0x724:   	mov	%ccr, %o5
	.word	0xe3b8a080	! t0_kref+0x728:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xe3b8a080	! t0_kref+0x72c:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xc807bfec	! t0_kref+0x730:   	ld	[%fp - 0x14], %g4
	.word	0x8bb0076e	! t0_kref+0x734:   	fpack16	%f14, %f5
	.word	0x2f480006	! t0_kref+0x738:   	fbu,a,pt	%fcc0, _kref+0x750
	.word	0xf11fbd50	! t0_kref+0x73c:   	ldd	[%fp - 0x2b0], %f24
	.word	0xafb54335	! t0_kref+0x740:   	bmask	%l5, %l5, %l7
	.word	0xee08a011	! t0_kref+0x744:   	ldub	[%g2 + 0x11], %l7
	.word	0xed1fbed8	! t0_kref+0x748:   	ldd	[%fp - 0x128], %f22
	.word	0x33480001	! t0_kref+0x74c:   	fbe,a,pt	%fcc0, _kref+0x750
	.word	0xb1a68d32	! t0_kref+0x750:   	fsmuld	%f26, %f18, %f24
	call	SYM(t0_subr1)
	.word	0xd4262004	! t0_kref+0x758:   	st	%o2, [%i0 + 4]
	.word	0xdd264000	! t0_kref+0x75c:   	st	%f14, [%i1]
	.word	0x38800005	! t0_kref+0x760:   	bgu,a	_kref+0x774
	.word	0x9e2dc00d	! t0_kref+0x764:   	andn	%l7, %o5, %o7
	.word	0x8bb14e2c	! t0_kref+0x768:   	fands	%f5, %f12, %f5
	.word	0xe1be188b	! t0_kref+0x76c:   	stda	%f16, [%i0 + %o3]0xc4
	.word	0x95a00531	! t0_kref+0x770:   	fsqrts	%f17, %f10
	.word	0x95400000	! t0_kref+0x774:   	mov	%y, %o2
	.word	0xf43e0000	! t0_kref+0x778:   	std	%i2, [%i0]
	.word	0xb5a0052d	! t0_kref+0x77c:   	fsqrts	%f13, %f26
	.word	0x39480004	! t0_kref+0x780:   	fbuge,a,pt	%fcc0, _kref+0x790
	.word	0x95400000	! t0_kref+0x784:   	mov	%y, %o2
	.word	0xd40e6004	! t0_kref+0x788:   	ldub	[%i1 + 4], %o2
	.word	0x9da00536	! t0_kref+0x78c:   	fsqrts	%f22, %f14
	.word	0xe8364000	! t0_kref+0x790:   	sth	%l4, [%i1]
	.word	0x23800004	! t0_kref+0x794:   	fbne,a	_kref+0x7a4
	.word	0x9815a2c2	! t0_kref+0x798:   	or	%l6, 0x2c2, %o4
	.word	0xa1a00529	! t0_kref+0x79c:   	fsqrts	%f9, %f16
	.word	0xec46001c	! t0_kref+0x7a0:   	ldsw	[%i0 + %i4], %l6
	.word	0x85803153	! t0_kref+0x7a4:   	mov	0xfffff153, %ccr
	.word	0xec981019	! t0_kref+0x7a8:   	ldda	[%g0 + %i1]0x80, %l6
	.word	0x9885eb78	! t0_kref+0x7ac:   	addcc	%l7, 0xb78, %o4
	.word	0x25800003	! t0_kref+0x7b0:   	fblg,a	_kref+0x7bc
	.word	0xb9a00136	! t0_kref+0x7b4:   	fabss	%f22, %f28
	.word	0xf306600c	! t0_kref+0x7b8:   	ld	[%i1 + 0xc], %f25
	.word	0x9465eb1f	! t0_kref+0x7bc:   	subc	%l7, 0xb1f, %o2
	.word	0xb1a01035	! t0_kref+0x7c0:   	fstox	%f21, %f24
	.word	0x9905e0f9	! t0_kref+0x7c4:   	taddcc	%l7, 0xf9, %o4
	.word	0x2b480005	! t0_kref+0x7c8:   	fbug,a,pt	%fcc0, _kref+0x7dc
	.word	0x9a228014	! t0_kref+0x7cc:   	sub	%o2, %l4, %o5
	.word	0x39480008	! t0_kref+0x7d0:   	fbuge,a,pt	%fcc0, _kref+0x7f0
	.word	0x9212000d	! t0_kref+0x7d4:   	or	%o0, %o5, %o1
	.word	0x90fae4a0	! t0_kref+0x7d8:   	sdivcc	%o3, 0x4a0, %o0
	.word	0xd300a028	! t0_kref+0x7dc:   	ld	[%g2 + 0x28], %f9
	.word	0xc7ee500c	! t0_kref+0x7e0:   	prefetcha	%i1 + %o4, 3
	.word	0x8db00f08	! t0_kref+0x7e4:   	fsrc2	%f8, %f6
	.word	0xd2480019	! t0_kref+0x7e8:   	ldsb	[%g0 + %i1], %o1
	.word	0x97a00535	! t0_kref+0x7ec:   	fsqrts	%f21, %f11
	.word	0xf7ee501c	! t0_kref+0x7f0:   	prefetcha	%i1 + %i4, 27
	.word	0xda4e7fe2	! t0_kref+0x7f4:   	ldsb	[%i1 - 0x1e], %o5
	.word	0xd830a02a	! t0_kref+0x7f8:   	sth	%o4, [%g2 + 0x2a]
	.word	0xe3b8a080	! t0_kref+0x7fc:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xf1be5897	! t0_kref+0x800:   	stda	%f24, [%i1 + %l7]0xc4
	.word	0xf53e6010	! t0_kref+0x804:   	std	%f26, [%i1 + 0x10]
	.word	0xb3b74d60	! t0_kref+0x808:   	fnot1s	%f29, %f25
	.word	0xaba00030	! t0_kref+0x80c:   	fmovs	%f16, %f21
	.word	0xded6d018	! t0_kref+0x810:   	ldsha	[%i3 + %i0]0x80, %o7
	.word	0x965d7bc2	! t0_kref+0x814:   	smul	%l5, -0x43e, %o3
	.word	0xada18854	! t0_kref+0x818:   	faddd	%f6, %f20, %f22
	.word	0x94bdc00d	! t0_kref+0x81c:   	xnorcc	%l7, %o5, %o2
	.word	0x29480004	! t0_kref+0x820:   	fbl,a,pt	%fcc0, _kref+0x830
	.word	0xe67e3fec	! t0_kref+0x824:   	swap	[%i0 - 0x14], %l3
	.word	0x9b2a2014	! t0_kref+0x828:   	sll	%o0, 0x14, %o5
	.word	0x25480004	! t0_kref+0x82c:   	fblg,a,pt	%fcc0, _kref+0x83c
	.word	0x95b18514	! t0_kref+0x830:   	fcmpgt16	%f6, %f20, %o2
	.word	0xc807bff0	! t0_kref+0x834:   	ld	[%fp - 0x10], %g4
	.word	0x89a00550	! t0_kref+0x838:   	fsqrtd	%f16, %f4
	.word	0xb5a0193d	! t0_kref+0x83c:   	fstod	%f29, %f26
	.word	0xd0380019	! t0_kref+0x840:   	std	%o0, [%g0 + %i1]
	.word	0x9fa00525	! t0_kref+0x844:   	fsqrts	%f5, %f15
	.word	0xd106001c	! t0_kref+0x848:   	ld	[%i0 + %i4], %f8
	.word	0xa5a508d0	! t0_kref+0x84c:   	fsubd	%f20, %f16, %f18
	call	SYM(t0_subr1)
	.word	0x93b2850e	! t0_kref+0x854:   	fcmpgt16	%f10, %f14, %o1
	.word	0x95b68dda	! t0_kref+0x858:   	fnand	%f26, %f26, %f10
	.word	0xb3a000b7	! t0_kref+0x85c:   	fnegs	%f23, %f25
	.word	0xadb5ca71	! t0_kref+0x860:   	fpadd32s	%f23, %f17, %f22
	call	SYM(t0_subr3)
	.word	0xa5a74d28	! t0_kref+0x868:   	fsmuld	%f29, %f8, %f18
	.word	0xd000a038	! t0_kref+0x86c:   	ld	[%g2 + 0x38], %o0
	.word	0xd0563fea	! t0_kref+0x870:   	ldsh	[%i0 - 0x16], %o0
	.word	0xa1a4893a	! t0_kref+0x874:   	fmuls	%f18, %f26, %f16
	.word	0xda4e200d	! t0_kref+0x878:   	ldsb	[%i0 + 0xd], %o5
	.word	0xb9a00531	! t0_kref+0x87c:   	fsqrts	%f17, %f28
	.word	0xe42e0000	! t0_kref+0x880:   	stb	%l2, [%i0]
	.word	0xac75e21e	! t0_kref+0x884:   	udiv	%l7, 0x21e, %l6
	.word	0x9db30f96	! t0_kref+0x888:   	for	%f12, %f22, %f14
	.word	0x9bb48032	! t0_kref+0x88c:   	edge8n	%l2, %l2, %o5
	.word	0x8ba1082c	! t0_kref+0x890:   	fadds	%f4, %f12, %f5
	.word	0xada30d2a	! t0_kref+0x894:   	fsmuld	%f12, %f10, %f22
	.word	0xf3ee101d	! t0_kref+0x898:   	prefetcha	%i0 + %i5, 25
	.word	0x9ba20836	! t0_kref+0x89c:   	fadds	%f8, %f22, %f13
	.word	0xd6ff1018	! t0_kref+0x8a0:   	swapa	[%i4 + %i0]0x80, %o3
	.word	0x99a289c6	! t0_kref+0x8a4:   	fdivd	%f10, %f6, %f12
	.word	0xad2a8000	! t0_kref+0x8a8:   	sll	%o2, %g0, %l6
	.word	0x90c4b2b2	! t0_kref+0x8ac:   	addccc	%l2, -0xd4e, %o0
	.word	0x9334a01c	! t0_kref+0x8b0:   	srl	%l2, 0x1c, %o1
	.word	0x81b6832d	! t0_kref+0x8b4:   	bmask	%i2, %o5, %g0
	.word	0xd000a010	! t0_kref+0x8b8:   	ld	[%g2 + 0x10], %o0
	.word	0xe4266010	! t0_kref+0x8bc:   	st	%l2, [%i1 + 0x10]
	.word	0xde0e2001	! t0_kref+0x8c0:   	ldub	[%i0 + 1], %o7
	.word	0xae534017	! t0_kref+0x8c4:   	umul	%o5, %l7, %l7
	.word	0xda16401b	! t0_kref+0x8c8:   	lduh	[%i1 + %i3], %o5
	.word	0xacba001a	! t0_kref+0x8cc:   	xnorcc	%o0, %i2, %l6
	.word	0x29480005	! t0_kref+0x8d0:   	fbl,a,pt	%fcc0, _kref+0x8e4
	.word	0xec267ff4	! t0_kref+0x8d4:   	st	%l6, [%i1 - 0xc]
	.word	0x9ae021b7	! t0_kref+0x8d8:   	subccc	%g0, 0x1b7, %o5
	.word	0xbba30932	! t0_kref+0x8dc:   	fmuls	%f12, %f18, %f29
	.word	0xa1b00fe0	! t0_kref+0x8e0:   	fones	%f16
	.word	0xd410a022	! t0_kref+0x8e4:   	lduh	[%g2 + 0x22], %o2
	.word	0xada000bc	! t0_kref+0x8e8:   	fnegs	%f28, %f22
	.word	0xb9a0053a	! t0_kref+0x8ec:   	fsqrts	%f26, %f28
	.word	0xc398a040	! t0_kref+0x8f0:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0x81af4a33	! t0_kref+0x8f4:   	fcmps	%fcc0, %f29, %f19
	.word	0xb3a0002a	! t0_kref+0x8f8:   	fmovs	%f10, %f25
	.word	0xadb487d2	! t0_kref+0x8fc:   	pdist	%f18, %f18, %f22
	.word	0xee2e0000	! t0_kref+0x900:   	stb	%l7, [%i0]
	.word	0xd608a021	! t0_kref+0x904:   	ldub	[%g2 + 0x21], %o3
	.word	0xd91e3ff0	! t0_kref+0x908:   	ldd	[%i0 - 0x10], %f12
	.word	0xda40a030	! t0_kref+0x90c:   	ldsw	[%g2 + 0x30], %o5
	.word	0x905d000b	! t0_kref+0x910:   	smul	%l4, %o3, %o0
	.word	0x99b48f6a	! t0_kref+0x914:   	fornot1s	%f18, %f10, %f12
	.word	0x9e3d0008	! t0_kref+0x918:   	xnor	%l4, %o0, %o7
	.word	0xd67e7fe8	! t0_kref+0x91c:   	swap	[%i1 - 0x18], %o3
	.word	0xe3b8a080	! t0_kref+0x920:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xc398a040	! t0_kref+0x924:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0x9305ee3c	! t0_kref+0x928:   	taddcc	%l7, 0xe3c, %o1
	.word	0x97a00032	! t0_kref+0x92c:   	fmovs	%f18, %f11
	.word	0x89a018d6	! t0_kref+0x930:   	fdtos	%f22, %f4
	.word	0x21800005	! t0_kref+0x934:   	fbn,a	_kref+0x948
	.word	0xa7a00537	! t0_kref+0x938:   	fsqrts	%f23, %f19
	.word	0x81820000	! t0_kref+0x93c:   	wr	%o0, %g0, %y
	.word	0x90756a9f	! t0_kref+0x940:   	udiv	%l5, 0xa9f, %o0
	.word	0x81da400b	! t0_kref+0x944:   	flush	%o1 + %o3
	.word	0x9de3bfa0	! t0_kref+0x948:   	save	%sp, -0x60, %sp
	.word	0xb686b156	! t0_kref+0x94c:   	addcc	%i2, -0xeaa, %i3
	.word	0x91eee146	! t0_kref+0x950:   	restore	%i3, 0x146, %o0
	.word	0xee08a030	! t0_kref+0x954:   	ldub	[%g2 + 0x30], %l7
	.word	0x81854000	! t0_kref+0x958:   	wr	%l5, %g0, %y
	.word	0x25480005	! t0_kref+0x95c:   	fblg,a,pt	%fcc0, _kref+0x970
	.word	0xd2d6501b	! t0_kref+0x960:   	ldsha	[%i1 + %i3]0x80, %o1
	.word	0x98b2c015	! t0_kref+0x964:   	orncc	%o3, %l5, %o4
	.word	0xd3264000	! t0_kref+0x968:   	st	%f9, [%i1]
	.word	0xc0364000	! t0_kref+0x96c:   	clrh	[%i1]
	.word	0x95b00fe0	! t0_kref+0x970:   	fones	%f10
	.word	0xe1be588b	! t0_kref+0x974:   	stda	%f16, [%i1 + %o3]0xc4
	.word	0xe3b8a080	! t0_kref+0x978:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x97b2c04a	! t0_kref+0x97c:   	edge8l	%o3, %o2, %o3
	.word	0xd900a000	! t0_kref+0x980:   	ld	[%g2], %f12
	.word	0x968a4016	! t0_kref+0x984:   	andcc	%o1, %l6, %o3
	.word	0xd07e3ffc	! t0_kref+0x988:   	swap	[%i0 - 4], %o0
	.word	0xb5b586ee	! t0_kref+0x98c:   	fmul8ulx16	%f22, %f14, %f26
	.word	0xe11fbc70	! t0_kref+0x990:   	ldd	[%fp - 0x390], %f16
	.word	0x92f538f0	! t0_kref+0x994:   	udivcc	%l4, -0x710, %o1
	.word	0xaeba28de	! t0_kref+0x998:   	xnorcc	%o0, 0x8de, %l7
	.word	0x81aa4a25	! t0_kref+0x99c:   	fcmps	%fcc0, %f9, %f5
	.word	0x9682800a	! t0_kref+0x9a0:   	addcc	%o2, %o2, %o3
	.word	0x3f480001	! t0_kref+0x9a4:   	fbo,a,pt	%fcc0, _kref+0x9a8
	.word	0x9872b5cb	! t0_kref+0x9a8:   	udiv	%o2, -0xa35, %o4
	.word	0x2f800005	! t0_kref+0x9ac:   	fbu,a	_kref+0x9c0
	.word	0xec20a028	! t0_kref+0x9b0:   	st	%l6, [%g2 + 0x28]
	.word	0xe1e6101a	! t0_kref+0x9b4:   	casa	[%i0]0x80, %i2, %l0
	.word	0xd9be580a	! t0_kref+0x9b8:   	stda	%f12, [%i1 + %o2]0xc0
	.word	0xb5a70d34	! t0_kref+0x9bc:   	fsmuld	%f28, %f20, %f26
	.word	0x97a00137	! t0_kref+0x9c0:   	fabss	%f23, %f11
	.word	0x9ec5fb5f	! t0_kref+0x9c4:   	addccc	%l7, -0x4a1, %o7
	.word	0x92124000	! t0_kref+0x9c8:   	or	%o1, %g0, %o1
	.word	0xd200a038	! t0_kref+0x9cc:   	ld	[%g2 + 0x38], %o1
	.word	0xedee101a	! t0_kref+0x9d0:   	prefetcha	%i0 + %i2, 22
	.word	0xb5b00fc0	! t0_kref+0x9d4:   	fone	%f26
	.word	0xc398a040	! t0_kref+0x9d8:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0x9bb4c30b	! t0_kref+0x9dc:   	alignaddr	%l3, %o3, %o5
	.word	0x86102001	! t0_kref+0x9e0:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x9e4:   	bne,a	_kref+0x9e4
	.word	0x86a0e001	! t0_kref+0x9e8:   	subcc	%g3, 1, %g3
	.word	0xda26401c	! t0_kref+0x9ec:   	st	%o5, [%i1 + %i4]
	.word	0xc99f5019	! t0_kref+0x9f0:   	ldda	[%i5 + %i1]0x80, %f4
	.word	0xd010a020	! t0_kref+0x9f4:   	lduh	[%g2 + 0x20], %o0
	.word	0x99a58d37	! t0_kref+0x9f8:   	fsmuld	%f22, %f23, %f12
	.word	0xace37071	! t0_kref+0x9fc:   	subccc	%o5, -0xf8f, %l6
	.word	0xa5b00f1c	! t0_kref+0xa00:   	fsrc2	%f28, %f18
	.word	0xde4e001a	! t0_kref+0xa04:   	ldsb	[%i0 + %i2], %o7
	.word	0xb5b007a6	! t0_kref+0xa08:   	fpackfix	%f6, %f26
	.word	0x812d4009	! t0_kref+0xa0c:   	sll	%l5, %o1, %g0
	.word	0x95a0190a	! t0_kref+0xa10:   	fitod	%f10, %f10
	.word	0xe11e6010	! t0_kref+0xa14:   	ldd	[%i1 + 0x10], %f16
	.word	0xc010a032	! t0_kref+0xa18:   	lduh	[%g2 + 0x32], %g0
	.word	0xe51fbeb0	! t0_kref+0xa1c:   	ldd	[%fp - 0x150], %f18
	.word	0xed260000	! t0_kref+0xa20:   	st	%f22, [%i0]
	.word	0x95b2874c	! t0_kref+0xa24:   	fpack32	%f10, %f12, %f10
	.word	0xe8b81019	! t0_kref+0xa28:   	stda	%l4, [%g0 + %i1]0x80
	.word	0xe8263ff0	! t0_kref+0xa2c:   	st	%l4, [%i0 - 0x10]
	.word	0x9a5b4015	! t0_kref+0xa30:   	smul	%o5, %l5, %o5
	.word	0x91400000	! t0_kref+0xa34:   	mov	%y, %o0
	.word	0xae220017	! t0_kref+0xa38:   	sub	%o0, %l7, %l7
	.word	0xe3b8a080	! t0_kref+0xa3c:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x99a6482d	! t0_kref+0xa40:   	fadds	%f25, %f13, %f12
	.word	0x27800007	! t0_kref+0xa44:   	fbul,a	_kref+0xa60
	.word	0xd800a028	! t0_kref+0xa48:   	ld	[%g2 + 0x28], %o4
	.word	0xb9a48d25	! t0_kref+0xa4c:   	fsmuld	%f18, %f5, %f28
	.word	0x31480007	! t0_kref+0xa50:   	fba,a,pt	%fcc0, _kref+0xa6c
	.word	0x922038b2	! t0_kref+0xa54:   	sub	%g0, -0x74e, %o1
	.word	0xd048a01b	! t0_kref+0xa58:   	ldsb	[%g2 + 0x1b], %o0
	.word	0xde16601c	! t0_kref+0xa5c:   	lduh	[%i1 + 0x1c], %o7
	.word	0xde06401c	! t0_kref+0xa60:   	ld	[%i1 + %i4], %o7
	.word	0x95a01a52	! t0_kref+0xa64:   	fdtoi	%f18, %f10
	.word	0x99a3092a	! t0_kref+0xa68:   	fmuls	%f12, %f10, %f12
	.word	0x23800002	! t0_kref+0xa6c:   	fbne,a	_kref+0xa74
	.word	0x90b6a7f9	! t0_kref+0xa70:   	orncc	%i2, 0x7f9, %o0
	.word	0x8136a01c	! t0_kref+0xa74:   	srl	%i2, 0x1c, %g0
	.word	0x25800005	! t0_kref+0xa78:   	fblg,a	_kref+0xa8c
	.word	0xe9be5a5b	! t0_kref+0xa7c:   	stda	%f20, [%i1 + %i3]0xd2
	.word	0x81820000	! t0_kref+0xa80:   	wr	%o0, %g0, %y
	.word	0x89b60cb9	! t0_kref+0xa84:   	fandnot2s	%f24, %f25, %f4
	.word	0xd0180018	! t0_kref+0xa88:   	ldd	[%g0 + %i0], %o0
	.word	0x9da20d28	! t0_kref+0xa8c:   	fsmuld	%f8, %f8, %f14
	.word	0xda881018	! t0_kref+0xa90:   	lduba	[%g0 + %i0]0x80, %o5
	.word	0x945aa7dd	! t0_kref+0xa94:   	smul	%o2, 0x7dd, %o2
	.word	0xd4480018	! t0_kref+0xa98:   	ldsb	[%g0 + %i0], %o2
	call	SYM(t0_subr0)
	.word	0x151197f4	! t0_kref+0xaa0:   	sethi	%hi(0x465fd000), %o2
	.word	0xd4167ff6	! t0_kref+0xaa4:   	lduh	[%i1 - 0xa], %o2
	.word	0xac5d627c	! t0_kref+0xaa8:   	smul	%l5, 0x27c, %l6
	.word	0x9db68dc8	! t0_kref+0xaac:   	fnand	%f26, %f8, %f14
	.word	0x9425fdf7	! t0_kref+0xab0:   	sub	%l7, -0x209, %o2
	.word	0x98bcfea8	! t0_kref+0xab4:   	xnorcc	%l3, -0x158, %o4
	.word	0xa782e647	! t0_kref+0xab8:   	wr	%o3, 0x647, %gsr
	.word	0xc398a040	! t0_kref+0xabc:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0x81aa8a2f	! t0_kref+0xac0:   	fcmps	%fcc0, %f10, %f15
	.word	0xf1264000	! t0_kref+0xac4:   	st	%f24, [%i1]
	.word	0xef26001c	! t0_kref+0xac8:   	st	%f23, [%i0 + %i4]
	.word	0x92d26bab	! t0_kref+0xacc:   	umulcc	%o1, 0xbab, %o1
	.word	0xd84e601a	! t0_kref+0xad0:   	ldsb	[%i1 + 0x1a], %o4
	.word	0x99a2894a	! t0_kref+0xad4:   	fmuld	%f10, %f10, %f12
	.word	0xee7f0019	! t0_kref+0xad8:   	swap	[%i4 + %i1], %l7
	.word	0x95b4c0cb	! t0_kref+0xadc:   	edge16l	%l3, %o3, %o2
	.word	0x98b30014	! t0_kref+0xae0:   	orncc	%o4, %l4, %o4
	.word	0xba103fe8	! t0_kref+0xae4:   	mov	0xffffffe8, %i5
	.word	0xafa00035	! t0_kref+0xae8:   	fmovs	%f21, %f23
	.word	0xed68a082	! t0_kref+0xaec:   	prefetch	%g2 + 0x82, 22
	.word	0x97a24833	! t0_kref+0xaf0:   	fadds	%f9, %f19, %f11
	.word	0xa1b3090c	! t0_kref+0xaf4:   	faligndata	%f12, %f12, %f16
	.word	0xe11e6018	! t0_kref+0xaf8:   	ldd	[%i1 + 0x18], %f16
	.word	0x9e55ecce	! t0_kref+0xafc:   	umul	%l7, 0xcce, %o7
	.word	0xe83e4000	! t0_kref+0xb00:   	std	%l4, [%i1]
	.word	0xe51fbe88	! t0_kref+0xb04:   	ldd	[%fp - 0x178], %f18
	.word	0x2f480003	! t0_kref+0xb08:   	fbu,a,pt	%fcc0, _kref+0xb14
	.word	0x91b24df2	! t0_kref+0xb0c:   	fnands	%f9, %f18, %f8
	.word	0x96de8016	! t0_kref+0xb10:   	smulcc	%i2, %l6, %o3
	.word	0x91a00552	! t0_kref+0xb14:   	fsqrtd	%f18, %f8
	.word	0x93b54154	! t0_kref+0xb18:   	edge32l	%l5, %l4, %o1
	call	SYM(t0_subr3)
	.word	0xc0000018	! t0_kref+0xb20:   	ld	[%g0 + %i0], %g0
	.word	0x21800004	! t0_kref+0xb24:   	fbn,a	_kref+0xb34
	.word	0x9ba0053d	! t0_kref+0xb28:   	fsqrts	%f29, %f13
	.word	0xa5a38d33	! t0_kref+0xb2c:   	fsmuld	%f14, %f19, %f18
	.word	0xc12e001c	! t0_kref+0xb30:   	st	%fsr, [%i0 + %i4]
	.word	0xec1e001d	! t0_kref+0xb34:   	ldd	[%i0 + %i5], %l6
	.word	0x3d480007	! t0_kref+0xb38:   	fbule,a,pt	%fcc0, _kref+0xb54
	.word	0x9f2b2008	! t0_kref+0xb3c:   	sll	%o4, 0x8, %o7
	.word	0x89a588c4	! t0_kref+0xb40:   	fsubd	%f22, %f4, %f4
	.word	0x23480006	! t0_kref+0xb44:   	fbne,a,pt	%fcc0, _kref+0xb5c
	.word	0x95b30200	! t0_kref+0xb48:   	array8	%o4, %g0, %o2
	.word	0xaf400000	! t0_kref+0xb4c:   	mov	%y, %l7
	.word	0x90b5400c	! t0_kref+0xb50:   	orncc	%l5, %o4, %o0
	.word	0x92150009	! t0_kref+0xb54:   	or	%l4, %o1, %o1
	.word	0x8182c000	! t0_kref+0xb58:   	wr	%o3, %g0, %y
	.word	0xd0260000	! t0_kref+0xb5c:   	st	%o0, [%i0]
	.word	0xd650a012	! t0_kref+0xb60:   	ldsh	[%g2 + 0x12], %o3
	.word	0x81dc0000	! t0_kref+0xb64:   	flush	%l0
	.word	0xa5a4c835	! t0_kref+0xb68:   	fadds	%f19, %f21, %f18
	.word	0x9aad4009	! t0_kref+0xb6c:   	andncc	%l5, %o1, %o5
	.word	0xec1e3fe8	! t0_kref+0xb70:   	ldd	[%i0 - 0x18], %l6
	call	SYM(t0_subr3)
	.word	0xafb00f26	! t0_kref+0xb78:   	fsrc2s	%f6, %f23
	.word	0xb1a01895	! t0_kref+0xb7c:   	fitos	%f21, %f24
	.word	0xb9a00538	! t0_kref+0xb80:   	fsqrts	%f24, %f28
	.word	0x30480007	! t0_kref+0xb84:   	ba,a,pt	%icc, _kref+0xba0
	.word	0xa9b6ca73	! t0_kref+0xb88:   	fpadd32s	%f27, %f19, %f20
	.word	0xe3b8a080	! t0_kref+0xb8c:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x9abb20af	! t0_kref+0xb90:   	xnorcc	%o4, 0xaf, %o5
	.word	0xadb200cb	! t0_kref+0xb94:   	edge16l	%o0, %o3, %l6
	.word	0xda0e3fe0	! t0_kref+0xb98:   	ldub	[%i0 - 0x20], %o5
	call	SYM(t0_subr3)
	.word	0x170d2a46	! t0_kref+0xba0:   	sethi	%hi(0x34a91800), %o3
	.word	0x9fb00fe0	! t0_kref+0xba4:   	fones	%f15
	.word	0xbba000ba	! t0_kref+0xba8:   	fnegs	%f26, %f29
	.word	0x95b18a4a	! t0_kref+0xbac:   	fpadd32	%f6, %f10, %f10
	.word	0x92333f87	! t0_kref+0xbb0:   	orn	%o4, -0x79, %o1
	.word	0xaed54009	! t0_kref+0xbb4:   	umulcc	%l5, %o1, %l7
	.word	0x905c8016	! t0_kref+0xbb8:   	smul	%l2, %l6, %o0
	.word	0xc12e401c	! t0_kref+0xbbc:   	st	%fsr, [%i1 + %i4]
	.word	0xc0f75018	! t0_kref+0xbc0:   	stxa	%g0, [%i5 + %i0]0x80
	.word	0xda0e600b	! t0_kref+0xbc4:   	ldub	[%i1 + 0xb], %o5
	.word	0x31800006	! t0_kref+0xbc8:   	fba,a	_kref+0xbe0
	.word	0x9ad58016	! t0_kref+0xbcc:   	umulcc	%l6, %l6, %o5
	.word	0xec1e6018	! t0_kref+0xbd0:   	ldd	[%i1 + 0x18], %l6
	.word	0xd856601e	! t0_kref+0xbd4:   	ldsh	[%i1 + 0x1e], %o4
	.word	0x97a000ab	! t0_kref+0xbd8:   	fnegs	%f11, %f11
	.word	0xed1fbf38	! t0_kref+0xbdc:   	ldd	[%fp - 0xc8], %f22
	.word	0x9e5d000c	! t0_kref+0xbe0:   	smul	%l4, %o4, %o7
	.word	0x9ba00032	! t0_kref+0xbe4:   	fmovs	%f18, %f13
	.word	0xb5b2cab0	! t0_kref+0xbe8:   	fpsub16s	%f11, %f16, %f26
	.word	0xe4086384	! t0_kref+0xbec:   	ldub	[%g1 + 0x384], %l2
	.word	0xa41ca00c	! t0_kref+0xbf0:   	xor	%l2, 0xc, %l2
	.word	0xe4286384	! t0_kref+0xbf4:   	stb	%l2, [%g1 + 0x384]
	.word	0x81d86384	! t0_kref+0xbf8:   	flush	%g1 + 0x384
2:	.word	0xaf326000	! t0_kref+0xbfc:   	srl	%o1, 0x0, %l7
	.word	0x35800006	! t0_kref+0xc00:   	fbue,a	_kref+0xc18
	.word	0x9aaac012	! t0_kref+0xc04:   	andncc	%o3, %l2, %o5
	.word	0xee48a030	! t0_kref+0xc08:   	ldsb	[%g2 + 0x30], %l7
	.word	0xdf00a018	! t0_kref+0xc0c:   	ld	[%g2 + 0x18], %f15
	.word	0x2f800006	! t0_kref+0xc10:   	fbu,a	_kref+0xc28
	.word	0xda7f0019	! t0_kref+0xc14:   	swap	[%i4 + %i1], %o5
	.word	0xda563ff6	! t0_kref+0xc18:   	ldsh	[%i0 - 0xa], %o5
	.word	0xd068a009	! t0_kref+0xc1c:   	ldstub	[%g2 + 9], %o0
	.word	0xd850a002	! t0_kref+0xc20:   	ldsh	[%g2 + 2], %o4
	.word	0xae154008	! t0_kref+0xc24:   	or	%l5, %o0, %l7
	.word	0xc368a0cc	! t0_kref+0xc28:   	prefetch	%g2 + 0xcc, 1
	.word	0xe9ee101d	! t0_kref+0xc2c:   	prefetcha	%i0 + %i5, 20
	.word	0x908d0013	! t0_kref+0xc30:   	andcc	%l4, %l3, %o0
	.word	0x39800002	! t0_kref+0xc34:   	fbuge,a	_kref+0xc3c
	.word	0x9ba1c832	! t0_kref+0xc38:   	fadds	%f7, %f18, %f13
	.word	0x99b28336	! t0_kref+0xc3c:   	bmask	%o2, %l6, %o4
	.word	0x8da3cd2c	! t0_kref+0xc40:   	fsmuld	%f15, %f12, %f6
	.word	0x1b1af12a	! t0_kref+0xc44:   	sethi	%hi(0x6bc4a800), %o5
	.word	0x91400000	! t0_kref+0xc48:   	mov	%y, %o0
	.word	0xe3b8a080	! t0_kref+0xc4c:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x2d157b4a	! t0_kref+0xc50:   	sethi	%hi(0x55ed2800), %l6
	.word	0x9fc00004	! t0_kref+0xc54:   	call	%g0 + %g4
	.word	0x948836c4	! t0_kref+0xc58:   	andcc	%g0, -0x93c, %o2
	.word	0xae127f40	! t0_kref+0xc5c:   	or	%o1, -0xc0, %l7
	.word	0xadb38510	! t0_kref+0xc60:   	fcmpgt16	%f14, %f16, %l6
	.word	0x98fd800c	! t0_kref+0xc64:   	sdivcc	%l6, %o4, %o4
	.word	0xb3b74ef5	! t0_kref+0xc68:   	fornot2s	%f29, %f21, %f25
	.word	0xec580018	! t0_kref+0xc6c:   	ldx	[%g0 + %i0], %l6
	.word	0x97b0014c	! t0_kref+0xc70:   	edge32l	%g0, %o4, %o3
	.word	0x89a2c8b3	! t0_kref+0xc74:   	fsubs	%f11, %f19, %f4
	.word	0xa1a30d3c	! t0_kref+0xc78:   	fsmuld	%f12, %f28, %f16
	.word	0x9de3bfa0	! t0_kref+0xc7c:   	save	%sp, -0x60, %sp
	.word	0x95ee6df7	! t0_kref+0xc80:   	restore	%i1, 0xdf7, %o2
	.word	0xd1e6100a	! t0_kref+0xc84:   	casa	[%i0]0x80, %o2, %o0
	.word	0xae65ad4c	! t0_kref+0xc88:   	subc	%l6, 0xd4c, %l7
	.word	0x95b20140	! t0_kref+0xc8c:   	edge32l	%o0, %g0, %o2
	.word	0x95b58200	! t0_kref+0xc90:   	array8	%l6, %g0, %o2
	.word	0x933ac000	! t0_kref+0xc94:   	sra	%o3, %g0, %o1
	.word	0x9f34a019	! t0_kref+0xc98:   	srl	%l2, 0x19, %o7
	.word	0x95b60e10	! t0_kref+0xc9c:   	fand	%f24, %f16, %f10
	.word	0xd608a001	! t0_kref+0xca0:   	ldub	[%g2 + 1], %o3
	.word	0xd9396750	! t0_kref+0xca4:   	std	%f12, [%g5 + 0x750]
	.word	0x9f3ac013	! t0_kref+0xca8:   	sra	%o3, %l3, %o7
	.word	0xd430a002	! t0_kref+0xcac:   	sth	%o2, [%g2 + 2]
	.word	0x943535a5	! t0_kref+0xcb0:   	orn	%l4, -0xa5b, %o2
	.word	0x8ba01886	! t0_kref+0xcb4:   	fitos	%f6, %f5
	.word	0xd520a020	! t0_kref+0xcb8:   	st	%f10, [%g2 + 0x20]
	.word	0xad65a02b	! t0_kref+0xcbc:   	movneg	%icc, 0x2b, %l6
	.word	0x89a00556	! t0_kref+0xcc0:   	fsqrtd	%f22, %f4
	.word	0x9604800b	! t0_kref+0xcc4:   	add	%l2, %o3, %o3
	.word	0x27800002	! t0_kref+0xcc8:   	fbul,a	_kref+0xcd0
	.word	0xcd3e001d	! t0_kref+0xccc:   	std	%f6, [%i0 + %i5]
	.word	0xe3b8a080	! t0_kref+0xcd0:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x90236a4f	! t0_kref+0xcd4:   	sub	%o5, 0xa4f, %o0
	.word	0xaed5c008	! t0_kref+0xcd8:   	umulcc	%l7, %o0, %l7
	.word	0x9de3bfa0	! t0_kref+0xcdc:   	save	%sp, -0x60, %sp
	.word	0xbb0e7af9	! t0_kref+0xce0:   	tsubcc	%i1, -0x507, %i5
	.word	0xafe8001b	! t0_kref+0xce4:   	restore	%g0, %i3, %l7
	.word	0x985a800c	! t0_kref+0xce8:   	smul	%o2, %o4, %o4
	.word	0x98f80013	! t0_kref+0xcec:   	sdivcc	%g0, %l3, %o4
	.word	0x8143e035	! t0_kref+0xcf0:   	membar	0x35
	.word	0x9fa01898	! t0_kref+0xcf4:   	fitos	%f24, %f15
	.word	0xb5a000a8	! t0_kref+0xcf8:   	fnegs	%f8, %f26
	.word	0x9b3d0015	! t0_kref+0xcfc:   	sra	%l4, %l5, %o5
	.word	0xe9be588b	! t0_kref+0xd00:   	stda	%f20, [%i1 + %o3]0xc4
	.word	0x99a0190c	! t0_kref+0xd04:   	fitod	%f12, %f12
	.word	0x972a0013	! t0_kref+0xd08:   	sll	%o0, %l3, %o3
	.word	0xd0865000	! t0_kref+0xd0c:   	lda	[%i1]0x80, %o0
	.word	0x9db1870f	! t0_kref+0xd10:   	fmuld8sux16	%f6, %f15, %f14
	.word	0x94833edc	! t0_kref+0xd14:   	addcc	%o4, -0x124, %o2
	.word	0x983e800a	! t0_kref+0xd18:   	xnor	%i2, %o2, %o4
	.word	0x2f800008	! t0_kref+0xd1c:   	fbu,a	_kref+0xd3c
	.word	0xee48a000	! t0_kref+0xd20:   	ldsb	[%g2], %l7
	.word	0xde4e600d	! t0_kref+0xd24:   	ldsb	[%i1 + 0xd], %o7
	.word	0xd47f0018	! t0_kref+0xd28:   	swap	[%i4 + %i0], %o2
	call	SYM(t0_subr2)
	.word	0xec2e2010	! t0_kref+0xd30:   	stb	%l6, [%i0 + 0x10]
	.word	0xd42e7fed	! t0_kref+0xd34:   	stb	%o2, [%i1 - 0x13]
	.word	0x9a930014	! t0_kref+0xd38:   	orcc	%o4, %l4, %o5
	.word	0x97b00cfb	! t0_kref+0xd3c:   	fnot2s	%f27, %f11
	.word	0x9e8ac014	! t0_kref+0xd40:   	andcc	%o3, %l4, %o7
	.word	0x9ba0012a	! t0_kref+0xd44:   	fabss	%f10, %f13
	.word	0x81b58037	! t0_kref+0xd48:   	edge8n	%l6, %l7, %g0
	.word	0x38800007	! t0_kref+0xd4c:   	bgu,a	_kref+0xd68
	.word	0xd848a019	! t0_kref+0xd50:   	ldsb	[%g2 + 0x19], %o4
	.word	0xe3b8a080	! t0_kref+0xd54:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xe3b8a080	! t0_kref+0xd58:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x9fc00004	! t0_kref+0xd5c:   	call	%g0 + %g4
	.word	0xe8270019	! t0_kref+0xd60:   	st	%l4, [%i4 + %i1]
	.word	0xcd1e6010	! t0_kref+0xd64:   	ldd	[%i1 + 0x10], %f6
	.word	0x9e048009	! t0_kref+0xd68:   	add	%l2, %o1, %o7
	.word	0x91b70c9a	! t0_kref+0xd6c:   	fandnot2	%f28, %f26, %f8
	.word	0xae503a32	! t0_kref+0xd70:   	umul	%g0, -0x5ce, %l7
	.word	0xf91e4000	! t0_kref+0xd74:   	ldd	[%i1], %f28
	.word	0x25800004	! t0_kref+0xd78:   	fblg,a	_kref+0xd88
	.word	0xada000bc	! t0_kref+0xd7c:   	fnegs	%f28, %f22
	.word	0xae352ce8	! t0_kref+0xd80:   	orn	%l4, 0xce8, %l7
	.word	0xd1beda59	! t0_kref+0xd84:   	stda	%f8, [%i3 + %i1]0xd2
	.word	0xc008a033	! t0_kref+0xd88:   	ldub	[%g2 + 0x33], %g0
	.word	0x9fc00004	! t0_kref+0xd8c:   	call	%g0 + %g4
	.word	0xeb20a000	! t0_kref+0xd90:   	st	%f21, [%g2]
	.word	0xa9a389b4	! t0_kref+0xd94:   	fdivs	%f14, %f20, %f20
	.word	0x98e4800b	! t0_kref+0xd98:   	subccc	%l2, %o3, %o4
	.word	0x89b18739	! t0_kref+0xd9c:   	fmuld8ulx16	%f6, %f25, %f4
	.word	0x8da48d27	! t0_kref+0xda0:   	fsmuld	%f18, %f7, %f6
	.word	0xd8100019	! t0_kref+0xda4:   	lduh	[%g0 + %i1], %o4
	.word	0x92b58012	! t0_kref+0xda8:   	orncc	%l6, %l2, %o1
	.word	0x29480008	! t0_kref+0xdac:   	fbl,a,pt	%fcc0, _kref+0xdcc
	.word	0xa1a14832	! t0_kref+0xdb0:   	fadds	%f5, %f18, %f16
	.word	0x8020000d	! t0_kref+0xdb4:   	neg	%o5, %g0
	.word	0x9ba01893	! t0_kref+0xdb8:   	fitos	%f19, %f13
	.word	0xd0566012	! t0_kref+0xdbc:   	ldsh	[%i1 + 0x12], %o0
	.word	0x9da000ad	! t0_kref+0xdc0:   	fnegs	%f13, %f14
	.word	0xc12e600c	! t0_kref+0xdc4:   	st	%fsr, [%i1 + 0xc]
	.word	0x8fa00531	! t0_kref+0xdc8:   	fsqrts	%f17, %f7
	.word	0xe0e81018	! t0_kref+0xdcc:   	ldstuba	[%g0 + %i0]0x80, %l0
	.word	0x20800006	! t0_kref+0xdd0:   	bn,a	_kref+0xde8
	.word	0x908274dc	! t0_kref+0xdd4:   	addcc	%o1, -0xb24, %o0
	.word	0xb1a00039	! t0_kref+0xdd8:   	fmovs	%f25, %f24
	.word	0x3f480001	! t0_kref+0xddc:   	fbo,a,pt	%fcc0, _kref+0xde0
	.word	0xf51fbcc8	! t0_kref+0xde0:   	ldd	[%fp - 0x338], %f26
	.word	0x95b20f96	! t0_kref+0xde4:   	for	%f8, %f22, %f10
	.word	0x96732bb5	! t0_kref+0xde8:   	udiv	%o4, 0xbb5, %o3
	.word	0x81ad8acc	! t0_kref+0xdec:   	fcmped	%fcc0, %f22, %f12
	.word	0xa9b10758	! t0_kref+0xdf0:   	fpack32	%f4, %f24, %f20
	.word	0x9de3bfa0	! t0_kref+0xdf4:   	save	%sp, -0x60, %sp
	.word	0xb85f0019	! t0_kref+0xdf8:   	smul	%i4, %i1, %i4
	.word	0x93e80000	! t0_kref+0xdfc:   	restore	%g0, %g0, %o1
	.word	0xda500019	! t0_kref+0xe00:   	ldsh	[%g0 + %i1], %o5
	.word	0x9453000c	! t0_kref+0xe04:   	umul	%o4, %o4, %o2
	.word	0x99a00529	! t0_kref+0xe08:   	fsqrts	%f9, %f12
	.word	0xde56601a	! t0_kref+0xe0c:   	ldsh	[%i1 + 0x1a], %o7
	.word	0x80fa8014	! t0_kref+0xe10:   	sdivcc	%o2, %l4, %g0
	.word	0xf500a020	! t0_kref+0xe14:   	ld	[%g2 + 0x20], %f26
	.word	0x9b400000	! t0_kref+0xe18:   	mov	%y, %o5
	.word	0xb5b70e52	! t0_kref+0xe1c:   	fxnor	%f28, %f18, %f26
	.word	0xd4066000	! t0_kref+0xe20:   	ld	[%i1], %o2
	.word	0xd4801019	! t0_kref+0xe24:   	lda	[%g0 + %i1]0x80, %o2
	.word	0xe91fbc98	! t0_kref+0xe28:   	ldd	[%fp - 0x368], %f20
	.word	0xd436401b	! t0_kref+0xe2c:   	sth	%o2, [%i1 + %i3]
	.word	0xda366006	! t0_kref+0xe30:   	sth	%o5, [%i1 + 6]
	.word	0x90336ae2	! t0_kref+0xe34:   	orn	%o5, 0xae2, %o0
	.word	0x3b800008	! t0_kref+0xe38:   	fble,a	_kref+0xe58
	.word	0x94722422	! t0_kref+0xe3c:   	udiv	%o0, 0x422, %o2
	.word	0x89b009a7	! t0_kref+0xe40:   	fexpand	%f7, %f4
	.word	0x89a000b1	! t0_kref+0xe44:   	fnegs	%f17, %f4
	.word	0xc036600e	! t0_kref+0xe48:   	clrh	[%i1 + 0xe]
	.word	0xe5ee101d	! t0_kref+0xe4c:   	prefetcha	%i0 + %i5, 18
	.word	0x91a00152	! t0_kref+0xe50:   	fabsd	%f18, %f8
	.word	0x9ae24017	! t0_kref+0xe54:   	subccc	%o1, %l7, %o5
	.word	0x9858247c	! t0_kref+0xe58:   	smul	%g0, 0x47c, %o4
	.word	0xd6062018	! t0_kref+0xe5c:   	ld	[%i0 + 0x18], %o3
	.word	0xd8566008	! t0_kref+0xe60:   	ldsh	[%i1 + 8], %o4
	.word	0xdb064000	! t0_kref+0xe64:   	ld	[%i1], %f13
	.word	0x8fa3892d	! t0_kref+0xe68:   	fmuls	%f14, %f13, %f7
	.word	0xa5b18c84	! t0_kref+0xe6c:   	fandnot2	%f6, %f4, %f18
	.word	0x983cc00c	! t0_kref+0xe70:   	xnor	%l3, %o4, %o4
	.word	0xd0200019	! t0_kref+0xe74:   	st	%o0, [%g0 + %i1]
	.word	0xeb00a008	! t0_kref+0xe78:   	ld	[%g2 + 8], %f21
	.word	0xf53e2008	! t0_kref+0xe7c:   	std	%f26, [%i0 + 8]
	.word	0xd840a000	! t0_kref+0xe80:   	ldsw	[%g2], %o4
	.word	0x80120016	! t0_kref+0xe84:   	or	%o0, %l6, %g0
	.word	0x93b34328	! t0_kref+0xe88:   	bmask	%o5, %o0, %o1
	.word	0xd91fbc80	! t0_kref+0xe8c:   	ldd	[%fp - 0x380], %f12
	.word	0xa5b5062a	! t0_kref+0xe90:   	fmul8x16	%f20, %f10, %f18
	.word	0x8143c000	! t0_kref+0xe94:   	stbar
	.word	0xda00a028	! t0_kref+0xe98:   	ld	[%g2 + 0x28], %o5
	.word	0xe900a008	! t0_kref+0xe9c:   	ld	[%g2 + 8], %f20
	.word	0xec3e001d	! t0_kref+0xea0:   	std	%l6, [%i0 + %i5]
	.word	0x813ea00a	! t0_kref+0xea4:   	sra	%i2, 0xa, %g0
	.word	0x9da0054c	! t0_kref+0xea8:   	fsqrtd	%f12, %f14
	.word	0xf42e3ff3	! t0_kref+0xeac:   	stb	%i2, [%i0 - 0xd]
	.word	0x2f800006	! t0_kref+0xeb0:   	fbu,a	_kref+0xec8
	.word	0xb9a58d26	! t0_kref+0xeb4:   	fsmuld	%f22, %f6, %f28
	.word	0x95b40df2	! t0_kref+0xeb8:   	fnands	%f16, %f18, %f10
	.word	0xd050a020	! t0_kref+0xebc:   	ldsh	[%g2 + 0x20], %o0
	.word	0xb9a24d25	! t0_kref+0xec0:   	fsmuld	%f9, %f5, %f28
	.word	0xac55317a	! t0_kref+0xec4:   	umul	%l4, -0xe86, %l6
	.word	0xde40a038	! t0_kref+0xec8:   	ldsw	[%g2 + 0x38], %o7
	.word	0x9a04be3e	! t0_kref+0xecc:   	add	%l2, -0x1c2, %o5
	.word	0x9afb4009	! t0_kref+0xed0:   	sdivcc	%o5, %o1, %o5
	.word	0x808828d5	! t0_kref+0xed4:   	btst	0x8d5, %g0
	.word	0xaeb23a86	! t0_kref+0xed8:   	orncc	%o0, -0x57a, %l7
	.word	0xadb586ea	! t0_kref+0xedc:   	fmul8ulx16	%f22, %f10, %f22
	.word	0x93a01899	! t0_kref+0xee0:   	fitos	%f25, %f9
	.word	0xec362000	! t0_kref+0xee4:   	sth	%l6, [%i0]
	call	SYM(t0_subr2)
	.word	0x80258017	! t0_kref+0xeec:   	sub	%l6, %l7, %g0
	.word	0x89b00cce	! t0_kref+0xef0:   	fnot2	%f14, %f4
	.word	0xa9b00fc0	! t0_kref+0xef4:   	fone	%f20
	.word	0xef267fe4	! t0_kref+0xef8:   	st	%f23, [%i1 - 0x1c]
	.word	0x91b00080	! t0_kref+0xefc:   	edge16	%g0, %g0, %o0
	.word	0xd610a038	! t0_kref+0xf00:   	lduh	[%g2 + 0x38], %o3
	.word	0xe300a020	! t0_kref+0xf04:   	ld	[%g2 + 0x20], %f17
	.word	0x9f3a200e	! t0_kref+0xf08:   	sra	%o0, 0xe, %o7
	.word	0xe51e3ff0	! t0_kref+0xf0c:   	ldd	[%i0 - 0x10], %f18
	.word	0x9200393b	! t0_kref+0xf10:   	add	%g0, -0x6c5, %o1
	.word	0xda10a008	! t0_kref+0xf14:   	lduh	[%g2 + 8], %o5
	.word	0xafb185d6	! t0_kref+0xf18:   	fcmpeq32	%f6, %f22, %l7
	.word	0x81a9ca36	! t0_kref+0xf1c:   	fcmps	%fcc0, %f7, %f22
	.word	0xe8266010	! t0_kref+0xf20:   	st	%l4, [%i1 + 0x10]
	.word	0xc04e401a	! t0_kref+0xf24:   	ldsb	[%i1 + %i2], %g0
	.word	0x94e33039	! t0_kref+0xf28:   	subccc	%o4, -0xfc7, %o2
	.word	0xae024009	! t0_kref+0xf2c:   	add	%o1, %o1, %l7
	.word	0xe9bf1a19	! t0_kref+0xf30:   	stda	%f20, [%i4 + %i1]0xd0
	.word	0xc9380018	! t0_kref+0xf34:   	std	%f4, [%g0 + %i0]
	.word	0xe4086700	! t0_kref+0xf38:   	ldub	[%g1 + 0x700], %l2
	.word	0xa41ca00c	! t0_kref+0xf3c:   	xor	%l2, 0xc, %l2
	.word	0xe4286700	! t0_kref+0xf40:   	stb	%l2, [%g1 + 0x700]
	.word	0x81d86700	! t0_kref+0xf44:   	flush	%g1 + 0x700
	.word	0xd248a030	! t0_kref+0xf48:   	ldsb	[%g2 + 0x30], %o1
	.word	0x805a0009	! t0_kref+0xf4c:   	smul	%o0, %o1, %g0
	.word	0x993b001a	! t0_kref+0xf50:   	sra	%o4, %i2, %o4
	.word	0xc050a030	! t0_kref+0xf54:   	ldsh	[%g2 + 0x30], %g0
	.word	0xe5262014	! t0_kref+0xf58:   	st	%f18, [%i0 + 0x14]
	.word	0x91a01893	! t0_kref+0xf5c:   	fitos	%f19, %f8
	.word	0x89a6883c	! t0_kref+0xf60:   	fadds	%f26, %f28, %f4
	.word	0xacd3400a	! t0_kref+0xf64:   	umulcc	%o5, %o2, %l6
	.word	0x95a00039	! t0_kref+0xf68:   	fmovs	%f25, %f10
	.word	0xd408a002	! t0_kref+0xf6c:   	ldub	[%g2 + 2], %o2
	.word	0xd9be5a5c	! t0_kref+0xf70:   	stda	%f12, [%i1 + %i4]0xd2
	.word	0x92f4a105	! t0_kref+0xf74:   	udivcc	%l2, 0x105, %o1
2:	.word	0xafa00532	! t0_kref+0xf78:   	fsqrts	%f18, %f23
	.word	0x91b30c86	! t0_kref+0xf7c:   	fandnot2	%f12, %f6, %f8
	.word	0xeb68a04f	! t0_kref+0xf80:   	prefetch	%g2 + 0x4f, 21
	.word	0x97a018dc	! t0_kref+0xf84:   	fdtos	%f28, %f11
	.word	0x9e7567c2	! t0_kref+0xf88:   	udiv	%l5, 0x7c2, %o7
	.word	0x95a28854	! t0_kref+0xf8c:   	faddd	%f10, %f20, %f10
	.word	0x9e73607a	! t0_kref+0xf90:   	udiv	%o5, 0x7a, %o7
	.word	0x91a0054a	! t0_kref+0xf94:   	fsqrtd	%f10, %f8
	.word	0x9de3bfa0	! t0_kref+0xf98:   	save	%sp, -0x60, %sp
	.word	0xb446c01c	! t0_kref+0xf9c:   	addc	%i3, %i4, %i2
	.word	0x99eec01c	! t0_kref+0xfa0:   	restore	%i3, %i4, %o4
	call	SYM(t0_subr3)
	.word	0xaf3b201b	! t0_kref+0xfa8:   	sra	%o4, 0x1b, %l7
	.word	0x37480005	! t0_kref+0xfac:   	fbge,a,pt	%fcc0, _kref+0xfc0
	.word	0xc168a0ca	! t0_kref+0xfb0:   	prefetch	%g2 + 0xca, 0
	call	SYM(t0_subr1)
	.word	0xe3b8a080	! t0_kref+0xfb8:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xd6d6101b	! t0_kref+0xfbc:   	ldsha	[%i0 + %i3]0x80, %o3
	.word	0x9ed4c015	! t0_kref+0xfc0:   	umulcc	%l3, %l5, %o7
	.word	0x805a682e	! t0_kref+0xfc4:   	smul	%o1, 0x82e, %g0
	.word	0xe3b8a080	! t0_kref+0xfc8:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x95a708ca	! t0_kref+0xfcc:   	fsubd	%f28, %f10, %f10
	.word	0xc168a0c0	! t0_kref+0xfd0:   	prefetch	%g2 + 0xc0, 0
	.word	0xd09e1000	! t0_kref+0xfd4:   	ldda	[%i0]0x80, %o0
	.word	0x89b50aca	! t0_kref+0xfd8:   	fpsub32	%f20, %f10, %f4
	.word	0x89b707dc	! t0_kref+0xfdc:   	pdist	%f28, %f28, %f4
	.word	0x9a3278c0	! t0_kref+0xfe0:   	orn	%o1, -0x740, %o5
	.word	0x94928016	! t0_kref+0xfe4:   	orcc	%o2, %l6, %o2
	.word	0xd0166018	! t0_kref+0xfe8:   	lduh	[%i1 + 0x18], %o0
	.word	0xaba4082b	! t0_kref+0xfec:   	fadds	%f16, %f11, %f21
	.word	0x8143e040	! t0_kref+0xff0:   	membar	0x40
	.word	0xb7a00029	! t0_kref+0xff4:   	fmovs	%f9, %f27
	.word	0x2f800006	! t0_kref+0xff8:   	fbu,a	_kref+0x1010
	.word	0x8da108da	! t0_kref+0xffc:   	fsubd	%f4, %f26, %f6
	.word	0x8143e057	! t0_kref+0x1000:   	membar	0x57
	.word	0xa9a00548	! t0_kref+0x1004:   	fsqrtd	%f8, %f20
	.word	0xafa0052f	! t0_kref+0x1008:   	fsqrts	%f15, %f23
	.word	0x81b505d8	! t0_kref+0x100c:   	fcmpeq32	%f20, %f24, %g0
	.word	0x9a84c00d	! t0_kref+0x1010:   	addcc	%l3, %o5, %o5
	.word	0x9da408d0	! t0_kref+0x1014:   	fsubd	%f16, %f16, %f14
	.word	0xe251401b	! t0_kref+0x1018:   	ldsh	[%g5 + %i3], %l1
	.word	0x25480007	! t0_kref+0x101c:   	fblg,a,pt	%fcc0, _kref+0x1038
	.word	0x99b00fe0	! t0_kref+0x1020:   	fones	%f12
	.word	0xd04e3ff2	! t0_kref+0x1024:   	ldsb	[%i0 - 0xe], %o0
	.word	0xa1a00544	! t0_kref+0x1028:   	fsqrtd	%f4, %f16
	.word	0xd600a030	! t0_kref+0x102c:   	ld	[%g2 + 0x30], %o3
	.word	0xd84e0000	! t0_kref+0x1030:   	ldsb	[%i0], %o4
	.word	0x9db40f9c	! t0_kref+0x1034:   	for	%f16, %f28, %f14
	.word	0xed200019	! t0_kref+0x1038:   	st	%f22, [%g0 + %i1]
	.word	0xd11fbee0	! t0_kref+0x103c:   	ldd	[%fp - 0x120], %f8
	.word	0x91b60c84	! t0_kref+0x1040:   	fandnot2	%f24, %f4, %f8
	.word	0x97a01897	! t0_kref+0x1044:   	fitos	%f23, %f11
	.word	0x9e52abf1	! t0_kref+0x1048:   	umul	%o2, 0xbf1, %o7
	.word	0x933ea01d	! t0_kref+0x104c:   	sra	%i2, 0x1d, %o1
	.word	0x93b24320	! t0_kref+0x1050:   	bmask	%o1, %g0, %o1
	.word	0xf1be1853	! t0_kref+0x1054:   	stda	%f24, [%i0 + %l3]0xc2
	.word	0xadb18e5a	! t0_kref+0x1058:   	fxnor	%f6, %f26, %f22
	.word	0xc0167fe2	! t0_kref+0x105c:   	lduh	[%i1 - 0x1e], %g0
	.word	0x81aecaac	! t0_kref+0x1060:   	fcmpes	%fcc0, %f27, %f12
	.word	0x95b40456	! t0_kref+0x1064:   	fcmpne16	%f16, %f22, %o2
	.word	0x9da000a8	! t0_kref+0x1068:   	fnegs	%f8, %f14
	.word	0x9e158012	! t0_kref+0x106c:   	or	%l6, %l2, %o7
	.word	0xa5a50835	! t0_kref+0x1070:   	fadds	%f20, %f21, %f18
	.word	0x92e48016	! t0_kref+0x1074:   	subccc	%l2, %l6, %o1
	.word	0x91a489da	! t0_kref+0x1078:   	fdivd	%f18, %f26, %f8
	.word	0xada01899	! t0_kref+0x107c:   	fitos	%f25, %f22
	.word	0x89b28a86	! t0_kref+0x1080:   	fpsub16	%f10, %f6, %f4
	.word	0xd400a030	! t0_kref+0x1084:   	ld	[%g2 + 0x30], %o2
	.word	0x3b800002	! t0_kref+0x1088:   	fble,a	_kref+0x1090
	.word	0xa5a01056	! t0_kref+0x108c:   	fdtox	%f22, %f18
	.word	0xa5b18dd6	! t0_kref+0x1090:   	fnand	%f6, %f22, %f18
	.word	0xf300a028	! t0_kref+0x1094:   	ld	[%g2 + 0x28], %f25
	.word	0xc398a080	! t0_kref+0x1098:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0xeea6501c	! t0_kref+0x109c:   	sta	%l7, [%i1 + %i4]0x80
	.word	0x9fa00534	! t0_kref+0x10a0:   	fsqrts	%f20, %f15
	.word	0xadb5c312	! t0_kref+0x10a4:   	alignaddr	%l7, %l2, %l6
	.word	0xc12e601c	! t0_kref+0x10a8:   	st	%fsr, [%i1 + 0x1c]
	.word	0xb9b44715	! t0_kref+0x10ac:   	fmuld8sux16	%f17, %f21, %f28
	.word	0xadb40d16	! t0_kref+0x10b0:   	fandnot1	%f16, %f22, %f22
	.word	0xcb26401c	! t0_kref+0x10b4:   	st	%f5, [%i1 + %i4]
	.word	0x2d480007	! t0_kref+0x10b8:   	fbg,a,pt	%fcc0, _kref+0x10d4
	.word	0x92c58013	! t0_kref+0x10bc:   	addccc	%l6, %l3, %o1
	.word	0x2d480008	! t0_kref+0x10c0:   	fbg,a,pt	%fcc0, _kref+0x10e0
	.word	0xe3b8a040	! t0_kref+0x10c4:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xec1e001d	! t0_kref+0x10c8:   	ldd	[%i0 + %i5], %l6
	.word	0x9b3d800a	! t0_kref+0x10cc:   	sra	%l6, %o2, %o5
	.word	0x8016800a	! t0_kref+0x10d0:   	or	%i2, %o2, %g0
	.word	0xd7266010	! t0_kref+0x10d4:   	st	%f11, [%i1 + 0x10]
	.word	0xe6ee501a	! t0_kref+0x10d8:   	ldstuba	[%i1 + %i2]0x80, %l3
	.word	0x812a200f	! t0_kref+0x10dc:   	sll	%o0, 0xf, %g0
	.word	0x2f480003	! t0_kref+0x10e0:   	fbu,a,pt	%fcc0, _kref+0x10ec
	.word	0xae026c76	! t0_kref+0x10e4:   	add	%o1, 0xc76, %l7
	.word	0x9e22c008	! t0_kref+0x10e8:   	sub	%o3, %o0, %o7
	.word	0xb1b70c8e	! t0_kref+0x10ec:   	fandnot2	%f28, %f14, %f24
	.word	0xd726401c	! t0_kref+0x10f0:   	st	%f11, [%i1 + %i4]
	.word	0x9882c01a	! t0_kref+0x10f4:   	addcc	%o3, %i2, %o4
	.word	0xf500a028	! t0_kref+0x10f8:   	ld	[%g2 + 0x28], %f26
	.word	0x81ad8ad8	! t0_kref+0x10fc:   	fcmped	%fcc0, %f22, %f24
	.word	0x9b3d601b	! t0_kref+0x1100:   	sra	%l5, 0x1b, %o5
	.word	0xd640a020	! t0_kref+0x1104:   	ldsw	[%g2 + 0x20], %o3
	.word	0xebee501b	! t0_kref+0x1108:   	prefetcha	%i1 + %i3, 21
	.word	0xa7a00034	! t0_kref+0x110c:   	fmovs	%f20, %f19
	.word	0xac6573b8	! t0_kref+0x1110:   	subc	%l5, -0xc48, %l6
	.word	0x908cb1c0	! t0_kref+0x1114:   	andcc	%l2, -0xe40, %o0
	.word	0xe968a049	! t0_kref+0x1118:   	prefetch	%g2 + 0x49, 20
	.word	0x9da289d0	! t0_kref+0x111c:   	fdivd	%f10, %f16, %f14
	.word	0xacbdc008	! t0_kref+0x1120:   	xnorcc	%l7, %o0, %l6
	.word	0xd85e3ff0	! t0_kref+0x1124:   	ldx	[%i0 - 0x10], %o4
	.word	0xeea01018	! t0_kref+0x1128:   	sta	%l7, [%g0 + %i0]0x80
	.word	0xd668a031	! t0_kref+0x112c:   	ldstub	[%g2 + 0x31], %o3
	.word	0x1b397278	! t0_kref+0x1130:   	sethi	%hi(0xe5c9e000), %o5
	.word	0xecfe1000	! t0_kref+0x1134:   	swapa	[%i0]0x80, %l6
	.word	0x8da000b9	! t0_kref+0x1138:   	fnegs	%f25, %f6
	.word	0x81ac8a5c	! t0_kref+0x113c:   	fcmpd	%fcc0, %f18, %f28
	.word	0x992dc012	! t0_kref+0x1140:   	sll	%l7, %l2, %o4
	.word	0x9de3bfa0	! t0_kref+0x1144:   	save	%sp, -0x60, %sp
	.word	0x80076fe6	! t0_kref+0x1148:   	add	%i5, 0xfe6, %g0
	.word	0x81ee401c	! t0_kref+0x114c:   	restore	%i1, %i4, %g0
	.word	0x29800002	! t0_kref+0x1150:   	fbl,a	_kref+0x1158
	.word	0xe1062000	! t0_kref+0x1154:   	ld	[%i0], %f16
	.word	0x32800004	! t0_kref+0x1158:   	bne,a	_kref+0x1168
	.word	0xee46401c	! t0_kref+0x115c:   	ldsw	[%i1 + %i4], %l7
	.word	0xd19e101d	! t0_kref+0x1160:   	ldda	[%i0 + %i5]0x80, %f8
	.word	0xd60e7ff1	! t0_kref+0x1164:   	ldub	[%i1 - 0xf], %o3
	.word	0x9fc00004	! t0_kref+0x1168:   	call	%g0 + %g4
	.word	0xb5b20f8a	! t0_kref+0x116c:   	for	%f8, %f10, %f26
	.word	0xa1a409c6	! t0_kref+0x1170:   	fdivd	%f16, %f6, %f16
	.word	0x13305f42	! t0_kref+0x1174:   	sethi	%hi(0xc17d0800), %o1
	.word	0x91382000	! t0_kref+0x1178:   	sra	%g0, 0x0, %o0
	.word	0x9f400000	! t0_kref+0x117c:   	mov	%y, %o7
	.word	0xd840a038	! t0_kref+0x1180:   	ldsw	[%g2 + 0x38], %o4
	.word	0x21480003	! t0_kref+0x1184:   	fbn,a,pt	%fcc0, _kref+0x1190
	.word	0xd93e3fe0	! t0_kref+0x1188:   	std	%f12, [%i0 - 0x20]
	.word	0xb7b74e3a	! t0_kref+0x118c:   	fands	%f29, %f26, %f27
	.word	0x97a00537	! t0_kref+0x1190:   	fsqrts	%f23, %f11
	.word	0x95268015	! t0_kref+0x1194:   	mulscc	%i2, %l5, %o2
	.word	0x89a00558	! t0_kref+0x1198:   	fsqrtd	%f24, %f4
	.word	0x968ce6a6	! t0_kref+0x119c:   	andcc	%l3, 0x6a6, %o3
	.word	0x96003a81	! t0_kref+0x11a0:   	add	%g0, -0x57f, %o3
	.word	0x2e480004	! t0_kref+0x11a4:   	bvs,a,pt	%icc, _kref+0x11b4
	.word	0xada000b5	! t0_kref+0x11a8:   	fnegs	%f21, %f22
	.word	0xb1a00531	! t0_kref+0x11ac:   	fsqrts	%f17, %f24
	.word	0xb9b00770	! t0_kref+0x11b0:   	fpack16	%f16, %f28
	.word	0x9fb00770	! t0_kref+0x11b4:   	fpack16	%f16, %f15
	.word	0xa9a00532	! t0_kref+0x11b8:   	fsqrts	%f18, %f20
	.word	0xc398a080	! t0_kref+0x11bc:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0x953ea01e	! t0_kref+0x11c0:   	sra	%i2, 0x1e, %o2
	.word	0xac85f61b	! t0_kref+0x11c4:   	addcc	%l7, -0x9e5, %l6
	.word	0x9f3a200c	! t0_kref+0x11c8:   	sra	%o0, 0xc, %o7
	.word	0x932ce00e	! t0_kref+0x11cc:   	sll	%l3, 0xe, %o1
	.word	0xc768a04b	! t0_kref+0x11d0:   	prefetch	%g2 + 0x4b, 3
	.word	0xd5e65012	! t0_kref+0x11d4:   	casa	[%i1]0x80, %l2, %o2
	.word	0xed00a000	! t0_kref+0x11d8:   	ld	[%g2], %f22
	.word	0xd3e65008	! t0_kref+0x11dc:   	casa	[%i1]0x80, %o0, %o1
	call	SYM(t0_subr0)
	.word	0xb9a38d36	! t0_kref+0x11e4:   	fsmuld	%f14, %f22, %f28
	.word	0x39480003	! t0_kref+0x11e8:   	fbuge,a,pt	%fcc0, _kref+0x11f4
	.word	0x92b2c015	! t0_kref+0x11ec:   	orncc	%o3, %l5, %o1
	.word	0xc0163ff0	! t0_kref+0x11f0:   	lduh	[%i0 - 0x10], %g0
	.word	0xaec2f51b	! t0_kref+0x11f4:   	addccc	%o3, -0xae5, %l7
	.word	0x925ac00a	! t0_kref+0x11f8:   	smul	%o3, %o2, %o1
	.word	0x99b54200	! t0_kref+0x11fc:   	array8	%l5, %g0, %o4
	.word	0xd9be5895	! t0_kref+0x1200:   	stda	%f12, [%i1 + %l5]0xc4
	.word	0xc9be1893	! t0_kref+0x1204:   	stda	%f4, [%i0 + %l3]0xc4
	.word	0x97b6848c	! t0_kref+0x1208:   	fcmple32	%f26, %f12, %o3
	.word	0x99b54e38	! t0_kref+0x120c:   	fands	%f21, %f24, %f12
	.word	0x9f400000	! t0_kref+0x1210:   	mov	%y, %o7
	.word	0xec364000	! t0_kref+0x1214:   	sth	%l6, [%i1]
	.word	0xaeb0000d	! t0_kref+0x1218:   	orncc	%g0, %o5, %l7
	.word	0x91b00fc0	! t0_kref+0x121c:   	fone	%f8
	.word	0x878020f0	! t0_kref+0x1220:   	mov	0xf0, %asi
	.word	0x9213400c	! t0_kref+0x1224:   	or	%o5, %o4, %o1
	.word	0xd6063ff8	! t0_kref+0x1228:   	ld	[%i0 - 8], %o3
	.word	0xd8363ff4	! t0_kref+0x122c:   	sth	%o4, [%i0 - 0xc]
	.word	0xde16c019	! t0_kref+0x1230:   	lduh	[%i3 + %i1], %o7
	.word	0x95a50824	! t0_kref+0x1234:   	fadds	%f20, %f4, %f10
	.word	0x33800005	! t0_kref+0x1238:   	fbe,a	_kref+0x124c
	.word	0x9bb14d60	! t0_kref+0x123c:   	fnot1s	%f5, %f13
	.word	0x9eb4a9cc	! t0_kref+0x1240:   	orncc	%l2, 0x9cc, %o7
	.word	0xe3b8a040	! t0_kref+0x1244:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xea267ff4	! t0_kref+0x1248:   	st	%l5, [%i1 - 0xc]
	.word	0xd848a03a	! t0_kref+0x124c:   	ldsb	[%g2 + 0x3a], %o4
	.word	0xa9a488c4	! t0_kref+0x1250:   	fsubd	%f18, %f4, %f20
	.word	0x9e24ef69	! t0_kref+0x1254:   	sub	%l3, 0xf69, %o7
	call	1f
	.empty
	.word	0x93400000	! t0_kref+0x125c:   	mov	%y, %o1
	.word	0xa3b24e37	! t0_kref+0x1260:   	fands	%f9, %f23, %f17
	.word	0xed68a00f	! t0_kref+0x1264:   	prefetch	%g2 + 0xf, 22
	.word	0x81ac0ac6	! t0_kref+0x1268:   	fcmped	%fcc0, %f16, %f6
	.word	0xb5a01887	! t0_kref+0x126c:   	fitos	%f7, %f26
1:	.word	0x89a00128	! t0_kref+0x1270:   	fabss	%f8, %f4
	.word	0x33480001	! t0_kref+0x1274:   	fbe,a,pt	%fcc0, _kref+0x1278
	.word	0xd408a013	! t0_kref+0x1278:   	ldub	[%g2 + 0x13], %o2
	.word	0x905d62e4	! t0_kref+0x127c:   	smul	%l5, 0x2e4, %o0
	.word	0xb9b00772	! t0_kref+0x1280:   	fpack16	%f18, %f28
	.word	0xb5a248a7	! t0_kref+0x1284:   	fsubs	%f9, %f7, %f26
	.word	0xcd1fbcf0	! t0_kref+0x1288:   	ldd	[%fp - 0x310], %f6
	.word	0x8143c000	! t0_kref+0x128c:   	stbar
	.word	0x81ab0ac6	! t0_kref+0x1290:   	fcmped	%fcc0, %f12, %f6
	.word	0xd250a03a	! t0_kref+0x1294:   	ldsh	[%g2 + 0x3a], %o1
	.word	0xaf400000	! t0_kref+0x1298:   	mov	%y, %l7
	.word	0x9a3d400b	! t0_kref+0x129c:   	xnor	%l5, %o3, %o5
	.word	0xad400000	! t0_kref+0x12a0:   	mov	%y, %l6
	.word	0xcdb81019	! t0_kref+0x12a4:   	stda	%f6, [%g0 + %i1]0x80
	.word	0xabb34d39	! t0_kref+0x12a8:   	fandnot1s	%f13, %f25, %f21
	.word	0xec266018	! t0_kref+0x12ac:   	st	%l6, [%i1 + 0x18]
	.word	0x808b6bc5	! t0_kref+0x12b0:   	btst	0xbc5, %o5
	.word	0x9de3bfa0	! t0_kref+0x12b4:   	save	%sp, -0x60, %sp
	.word	0xb4082af9	! t0_kref+0x12b8:   	and	%g0, 0xaf9, %i2
	.word	0xafe83b3c	! t0_kref+0x12bc:   	restore	%g0, -0x4c4, %l7
	.word	0x9de3bfa0	! t0_kref+0x12c0:   	save	%sp, -0x60, %sp
	.word	0xb6a6384d	! t0_kref+0x12c4:   	subcc	%i0, -0x7b3, %i3
	.word	0x81ee401c	! t0_kref+0x12c8:   	restore	%i1, %i4, %g0
	.word	0x9244c013	! t0_kref+0x12cc:   	addc	%l3, %l3, %o1
	.word	0x89a01910	! t0_kref+0x12d0:   	fitod	%f16, %f4
	.word	0x98c48015	! t0_kref+0x12d4:   	addccc	%l2, %l5, %o4
	.word	0xde10a038	! t0_kref+0x12d8:   	lduh	[%g2 + 0x38], %o7
	.word	0xc12e6004	! t0_kref+0x12dc:   	st	%fsr, [%i1 + 4]
	.word	0xbba3c836	! t0_kref+0x12e0:   	fadds	%f15, %f22, %f29
	.word	0x9e5b0016	! t0_kref+0x12e4:   	smul	%o4, %l6, %o7
	.word	0xd616c019	! t0_kref+0x12e8:   	lduh	[%i3 + %i1], %o3
	.word	0xc900a010	! t0_kref+0x12ec:   	ld	[%g2 + 0x10], %f4
	.word	0x37480006	! t0_kref+0x12f0:   	fbge,a,pt	%fcc0, _kref+0x1308
	.word	0x9f3cc015	! t0_kref+0x12f4:   	sra	%l3, %l5, %o7
	.word	0x95400000	! t0_kref+0x12f8:   	mov	%y, %o2
	.word	0x9ab02a42	! t0_kref+0x12fc:   	orncc	%g0, 0xa42, %o5
	call	SYM(t0_subr2)
	.word	0x9da01915	! t0_kref+0x1304:   	fitod	%f21, %f14
	.word	0x99a01918	! t0_kref+0x1308:   	fitod	%f24, %f12
	.word	0xe87e2004	! t0_kref+0x130c:   	swap	[%i0 + 4], %l4
	.word	0xb1b30f90	! t0_kref+0x1310:   	for	%f12, %f16, %f24
	.word	0xe5e61012	! t0_kref+0x1314:   	casa	[%i0]0x80, %l2, %l2
	.word	0xad34c009	! t0_kref+0x1318:   	srl	%l3, %o1, %l6
	.word	0xa1a01046	! t0_kref+0x131c:   	fdtox	%f6, %f16
	.word	0xeb267ff8	! t0_kref+0x1320:   	st	%f21, [%i1 - 8]
	.word	0xe43e4000	! t0_kref+0x1324:   	std	%l2, [%i1]
	.word	0xae12bf61	! t0_kref+0x1328:   	or	%o2, -0x9f, %l7
	.word	0x28800001	! t0_kref+0x132c:   	bleu,a	_kref+0x1330
	.word	0x98aa6091	! t0_kref+0x1330:   	andncc	%o1, 0x91, %o4
	.word	0x9e32800b	! t0_kref+0x1334:   	orn	%o2, %o3, %o7
	.word	0x9da689d0	! t0_kref+0x1338:   	fdivd	%f26, %f16, %f14
	.word	0x29480002	! t0_kref+0x133c:   	fbl,a,pt	%fcc0, _kref+0x1344
	.word	0x91a00548	! t0_kref+0x1340:   	fsqrtd	%f8, %f8
	.word	0xd1a01018	! t0_kref+0x1344:   	sta	%f8, [%g0 + %i0]0x80
	.word	0x9b3a201e	! t0_kref+0x1348:   	sra	%o0, 0x1e, %o5
	.word	0xc9260000	! t0_kref+0x134c:   	st	%f4, [%i0]
	.word	0xec36001b	! t0_kref+0x1350:   	sth	%l6, [%i0 + %i3]
	.word	0xd2861000	! t0_kref+0x1354:   	lda	[%i0]0x80, %o1
	.word	0x9fa00027	! t0_kref+0x1358:   	fmovs	%f7, %f15
	.word	0x99a00146	! t0_kref+0x135c:   	fabsd	%f6, %f12
	.word	0xe3b8a040	! t0_kref+0x1360:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xe168a10f	! t0_kref+0x1364:   	prefetch	%g2 + 0x10f, 16
	.word	0xb5a209cc	! t0_kref+0x1368:   	fdivd	%f8, %f12, %f26
	.word	0xada689d6	! t0_kref+0x136c:   	fdivd	%f26, %f22, %f22
	.word	0x9da0055a	! t0_kref+0x1370:   	fsqrtd	%f26, %f14
	.word	0xeed81019	! t0_kref+0x1374:   	ldxa	[%g0 + %i1]0x80, %l7
	.word	0x8da409dc	! t0_kref+0x1378:   	fdivd	%f16, %f28, %f6
	.word	0x8182c000	! t0_kref+0x137c:   	wr	%o3, %g0, %y
	.word	0xd87e200c	! t0_kref+0x1380:   	swap	[%i0 + 0xc], %o4
	.word	0xb1a48d2d	! t0_kref+0x1384:   	fsmuld	%f18, %f13, %f24
	.word	0x93b40552	! t0_kref+0x1388:   	fcmpeq16	%f16, %f18, %o1
	.word	0xa9a0012a	! t0_kref+0x138c:   	fabss	%f10, %f20
	.word	0xec4e001a	! t0_kref+0x1390:   	ldsb	[%i0 + %i2], %l6
	.word	0x95b00cd0	! t0_kref+0x1394:   	fnot2	%f16, %f10
	call	SYM(t0_subr1)
	.word	0xd8f6101d	! t0_kref+0x139c:   	stxa	%o4, [%i0 + %i5]0x80
	.word	0x97b00f30	! t0_kref+0x13a0:   	fsrc2s	%f16, %f11
	.word	0xd616c019	! t0_kref+0x13a4:   	lduh	[%i3 + %i1], %o3
	.word	0x912d800c	! t0_kref+0x13a8:   	sll	%l6, %o4, %o0
	.word	0xd600a020	! t0_kref+0x13ac:   	ld	[%g2 + 0x20], %o3
	.word	0x96050017	! t0_kref+0x13b0:   	add	%l4, %l7, %o3
	.word	0xe99e1a1a	! t0_kref+0x13b4:   	ldda	[%i0 + %i2]0xd0, %f20
	.word	0xb5a00130	! t0_kref+0x13b8:   	fabss	%f16, %f26
	.word	0x99b58448	! t0_kref+0x13bc:   	fcmpne16	%f22, %f8, %o4
	.word	0xae64c00b	! t0_kref+0x13c0:   	subc	%l3, %o3, %l7
	.word	0x39480008	! t0_kref+0x13c4:   	fbuge,a,pt	%fcc0, _kref+0x13e4
	.word	0xacfa4008	! t0_kref+0x13c8:   	sdivcc	%o1, %o0, %l6
	.word	0xde00a038	! t0_kref+0x13cc:   	ld	[%g2 + 0x38], %o7
	.word	0xbbb00fe0	! t0_kref+0x13d0:   	fones	%f29
	.word	0x9b400000	! t0_kref+0x13d4:   	mov	%y, %o5
	.word	0x922ce715	! t0_kref+0x13d8:   	andn	%l3, 0x715, %o1
	.word	0xac158015	! t0_kref+0x13dc:   	or	%l6, %l5, %l6
	.word	0x933d2018	! t0_kref+0x13e0:   	sra	%l4, 0x18, %o1
	.word	0x9bb00333	! t0_kref+0x13e4:   	bmask	%g0, %l3, %o5
	.word	0xee7e7ff4	! t0_kref+0x13e8:   	swap	[%i1 - 0xc], %l7
	.word	0x89b68f84	! t0_kref+0x13ec:   	for	%f26, %f4, %f4
	.word	0x9ec5400c	! t0_kref+0x13f0:   	addccc	%l5, %o4, %o7
	.word	0x9db50a94	! t0_kref+0x13f4:   	fpsub16	%f20, %f20, %f14
	.word	0xbba00527	! t0_kref+0x13f8:   	fsqrts	%f7, %f29
	.word	0x9a24e456	! t0_kref+0x13fc:   	sub	%l3, 0x456, %o5
	.word	0xb7a4082e	! t0_kref+0x1400:   	fadds	%f16, %f14, %f27
	.word	0xada2884a	! t0_kref+0x1404:   	faddd	%f10, %f10, %f22
	.word	0x98150008	! t0_kref+0x1408:   	or	%l4, %o0, %o4
	.word	0x3d800006	! t0_kref+0x140c:   	fbule,a	_kref+0x1424
	.word	0xad408000	! t0_kref+0x1410:   	mov	%ccr, %l6
	.word	0xae8ca96f	! t0_kref+0x1414:   	andcc	%l2, 0x96f, %l7
	.word	0xd0480019	! t0_kref+0x1418:   	ldsb	[%g0 + %i1], %o0
	.word	0x27800005	! t0_kref+0x141c:   	fbul,a	_kref+0x1430
	.word	0xb9a28d30	! t0_kref+0x1420:   	fsmuld	%f10, %f16, %f28
	.word	0x9eb33887	! t0_kref+0x1424:   	orncc	%o4, -0x779, %o7
	.word	0xd626401c	! t0_kref+0x1428:   	st	%o3, [%i1 + %i4]
	.word	0xb1a0054a	! t0_kref+0x142c:   	fsqrtd	%f10, %f24
	.word	0x9fa00524	! t0_kref+0x1430:   	fsqrts	%f4, %f15
	.word	0x35800006	! t0_kref+0x1434:   	fbue,a	_kref+0x144c
	.word	0x993a6019	! t0_kref+0x1438:   	sra	%o1, 0x19, %o4
	call	SYM(t0_subr1)
	.word	0x90526513	! t0_kref+0x1440:   	umul	%o1, 0x513, %o0
	.word	0x91a0191d	! t0_kref+0x1444:   	fitod	%f29, %f8
	.word	0x90156432	! t0_kref+0x1448:   	or	%l5, 0x432, %o0
	.word	0x94bcf197	! t0_kref+0x144c:   	xnorcc	%l3, -0xe69, %o2
	.word	0x35800008	! t0_kref+0x1450:   	fbue,a	_kref+0x1470
	.word	0xda08a021	! t0_kref+0x1454:   	ldub	[%g2 + 0x21], %o5
	.word	0x9fc00004	! t0_kref+0x1458:   	call	%g0 + %g4
	.word	0xd8100018	! t0_kref+0x145c:   	lduh	[%g0 + %i0], %o4
	.word	0xc12e7fe4	! t0_kref+0x1460:   	st	%fsr, [%i1 - 0x1c]
	.word	0x94c57493	! t0_kref+0x1464:   	addccc	%l5, -0xb6d, %o2
	.word	0x9a56800b	! t0_kref+0x1468:   	umul	%i2, %o3, %o5
	.word	0x93b2845c	! t0_kref+0x146c:   	fcmpne16	%f10, %f28, %o1
	.word	0x95b20032	! t0_kref+0x1470:   	edge8n	%o0, %l2, %o2
	.word	0xda2e600b	! t0_kref+0x1474:   	stb	%o5, [%i1 + 0xb]
	.word	0xdd180019	! t0_kref+0x1478:   	ldd	[%g0 + %i1], %f14
	.word	0x29480007	! t0_kref+0x147c:   	fbl,a,pt	%fcc0, _kref+0x1498
	.word	0x95a00556	! t0_kref+0x1480:   	fsqrtd	%f22, %f10
	.word	0xd208a008	! t0_kref+0x1484:   	ldub	[%g2 + 8], %o1
	.word	0xd0100019	! t0_kref+0x1488:   	lduh	[%g0 + %i1], %o0
	.word	0xf3067fec	! t0_kref+0x148c:   	ld	[%i1 - 0x14], %f25
	.word	0x9da00536	! t0_kref+0x1490:   	fsqrts	%f22, %f14
	.word	0xa7b58da5	! t0_kref+0x1494:   	fxors	%f22, %f5, %f19
	.word	0x01147f4d	! t0_kref+0x1498:   	sethi	%hi(0x51fd3400), %g0
	.word	0xcb00a010	! t0_kref+0x149c:   	ld	[%g2 + 0x10], %f5
	.word	0xa1a0054a	! t0_kref+0x14a0:   	fsqrtd	%f10, %f16
	.word	0x9f2aa006	! t0_kref+0x14a4:   	sll	%o2, 0x6, %o7
	.word	0x25480007	! t0_kref+0x14a8:   	fblg,a,pt	%fcc0, _kref+0x14c4
	.word	0xb9a4082d	! t0_kref+0x14ac:   	fadds	%f16, %f13, %f28
	.word	0x91a0052e	! t0_kref+0x14b0:   	fsqrts	%f14, %f8
	.word	0xc050a028	! t0_kref+0x14b4:   	ldsh	[%g2 + 0x28], %g0
	call	SYM(t0_subr2)
	.word	0x9056a4f4	! t0_kref+0x14bc:   	umul	%i2, 0x4f4, %o0
	.word	0xb9b14e31	! t0_kref+0x14c0:   	fands	%f5, %f17, %f28
	.word	0x99b680b7	! t0_kref+0x14c4:   	edge16n	%i2, %l7, %o4
	.word	0xacaa4016	! t0_kref+0x14c8:   	andncc	%o1, %l6, %l6
	.word	0x2c480003	! t0_kref+0x14cc:   	bneg,a,pt	%icc, _kref+0x14d8
	.word	0x813a4012	! t0_kref+0x14d0:   	sra	%o1, %l2, %g0
	.word	0x81a94a3a	! t0_kref+0x14d4:   	fcmps	%fcc0, %f5, %f26
	.word	0xb5a0189b	! t0_kref+0x14d8:   	fitos	%f27, %f26
	.word	0x2b800005	! t0_kref+0x14dc:   	fbug,a	_kref+0x14f0
	.word	0xd8e81018	! t0_kref+0x14e0:   	ldstuba	[%g0 + %i0]0x80, %o4
	.word	0xec68a019	! t0_kref+0x14e4:   	ldstub	[%g2 + 0x19], %l6
	.word	0xd8e81018	! t0_kref+0x14e8:   	ldstuba	[%g0 + %i0]0x80, %o4
	.word	0x39800002	! t0_kref+0x14ec:   	fbuge,a	_kref+0x14f4
	.word	0x90252e06	! t0_kref+0x14f0:   	sub	%l4, 0xe06, %o0
	.word	0x99b50c98	! t0_kref+0x14f4:   	fandnot2	%f20, %f24, %f12
	.word	0x9b068008	! t0_kref+0x14f8:   	taddcc	%i2, %o0, %o5
	.word	0xb5a10932	! t0_kref+0x14fc:   	fmuls	%f4, %f18, %f26
	.word	0xd448a010	! t0_kref+0x1500:   	ldsb	[%g2 + 0x10], %o2
	.word	0xb5b10f84	! t0_kref+0x1504:   	for	%f4, %f4, %f26
	.word	0x93b00034	! t0_kref+0x1508:   	edge8n	%g0, %l4, %o1
	.word	0xec20a030	! t0_kref+0x150c:   	st	%l6, [%g2 + 0x30]
	.word	0x9e13401a	! t0_kref+0x1510:   	or	%o5, %i2, %o7
	.word	0x97400000	! t0_kref+0x1514:   	mov	%y, %o3
	.word	0x97a6893c	! t0_kref+0x1518:   	fmuls	%f26, %f28, %f11
	.word	0x8610201c	! t0_kref+0x151c:   	mov	0x1c, %g3
	.word	0x86a0e001	! t0_kref+0x1520:   	subcc	%g3, 1, %g3
	.word	0x22800002	! t0_kref+0x1524:   	be,a	_kref+0x152c
	.word	0x8fa0052a	! t0_kref+0x1528:   	fsqrts	%f10, %f7
	.word	0xd9e65014	! t0_kref+0x152c:   	casa	[%i1]0x80, %l4, %o4
	.word	0x191f49c6	! t0_kref+0x1530:   	sethi	%hi(0x7d271800), %o4
	.word	0xd84e7ffa	! t0_kref+0x1534:   	ldsb	[%i1 - 6], %o4
	.word	0x9b3dc008	! t0_kref+0x1538:   	sra	%l7, %o0, %o5
	.word	0x93b5845c	! t0_kref+0x153c:   	fcmpne16	%f22, %f28, %o1
	.word	0x9e654016	! t0_kref+0x1540:   	subc	%l5, %l6, %o7
	.word	0x9e15a7ff	! t0_kref+0x1544:   	or	%l6, 0x7ff, %o7
	.word	0xb9a01889	! t0_kref+0x1548:   	fitos	%f9, %f28
	.word	0xd01e4000	! t0_kref+0x154c:   	ldd	[%i1], %o0
	.word	0x81aa0a5a	! t0_kref+0x1550:   	fcmpd	%fcc0, %f8, %f26
	.word	0x9a124000	! t0_kref+0x1554:   	or	%o1, %g0, %o5
	.word	0x31800002	! t0_kref+0x1558:   	fba,a	_kref+0x1560
	.word	0xa3b00774	! t0_kref+0x155c:   	fpack16	%f20, %f17
	.word	0x21480001	! t0_kref+0x1560:   	fbn,a,pt	%fcc0, _kref+0x1564
	.word	0xa5a68d3a	! t0_kref+0x1564:   	fsmuld	%f26, %f26, %f18
	.word	0xd900a020	! t0_kref+0x1568:   	ld	[%g2 + 0x20], %f12
	.word	0xad1d401a	! t0_kref+0x156c:   	tsubcctv	%l5, %i2, %l6
	.word	0x3a800001	! t0_kref+0x1570:   	bcc,a	_kref+0x1574
	.word	0x968eb67f	! t0_kref+0x1574:   	andcc	%i2, -0x981, %o3
	.word	0xafa01897	! t0_kref+0x1578:   	fitos	%f23, %f23
	.word	0x2f37383c	! t0_kref+0x157c:   	sethi	%hi(0xdce0f000), %l7
	.word	0x81aa4a2a	! t0_kref+0x1580:   	fcmps	%fcc0, %f9, %f10
	.word	0xe5981019	! t0_kref+0x1584:   	ldda	[%g0 + %i1]0x80, %f18
	.word	0xd0981018	! t0_kref+0x1588:   	ldda	[%g0 + %i0]0x80, %o0
	.word	0xafa01899	! t0_kref+0x158c:   	fitos	%f25, %f23
	.word	0xd420a020	! t0_kref+0x1590:   	st	%o2, [%g2 + 0x20]
	.word	0x81dd2acd	! t0_kref+0x1594:   	flush	%l4 + 0xacd
	.word	0xde100019	! t0_kref+0x1598:   	lduh	[%g0 + %i1], %o7
	.word	0xda40a038	! t0_kref+0x159c:   	ldsw	[%g2 + 0x38], %o5
	.word	0xb9b706f0	! t0_kref+0x15a0:   	fmul8ulx16	%f28, %f16, %f28
	.word	0x91a1cd3c	! t0_kref+0x15a4:   	fsmuld	%f7, %f28, %f8
	.word	0xada00552	! t0_kref+0x15a8:   	fsqrtd	%f18, %f22
	.word	0xee961000	! t0_kref+0x15ac:   	lduha	[%i0]0x80, %l7
	.word	0x2a480001	! t0_kref+0x15b0:   	bcs,a,pt	%icc, _kref+0x15b4
	.word	0xc368a0c6	! t0_kref+0x15b4:   	prefetch	%g2 + 0xc6, 1
	.word	0x9ee2bf05	! t0_kref+0x15b8:   	subccc	%o2, -0xfb, %o7
	.word	0xd4d6501b	! t0_kref+0x15bc:   	ldsha	[%i1 + %i3]0x80, %o2
	.word	0x81ae0a3b	! t0_kref+0x15c0:   	fcmps	%fcc0, %f24, %f27
	.word	0xda7e7fe8	! t0_kref+0x15c4:   	swap	[%i1 - 0x18], %o5
	.word	0x965d800d	! t0_kref+0x15c8:   	smul	%l6, %o5, %o3
	.word	0xe8266010	! t0_kref+0x15cc:   	st	%l4, [%i1 + 0x10]
	.word	0x3b800006	! t0_kref+0x15d0:   	fble,a	_kref+0x15e8
	.word	0x89b60e56	! t0_kref+0x15d4:   	fxnor	%f24, %f22, %f4
	.word	0x95a7085a	! t0_kref+0x15d8:   	faddd	%f28, %f26, %f10
	.word	0x27480008	! t0_kref+0x15dc:   	fbul,a,pt	%fcc0, _kref+0x15fc
	.word	0x99a10d39	! t0_kref+0x15e0:   	fsmuld	%f4, %f25, %f12
	.word	0x33480002	! t0_kref+0x15e4:   	fbe,a,pt	%fcc0, _kref+0x15ec
	.word	0x9f40c000	! t0_kref+0x15e8:   	mov	%asi, %o7
	.word	0xd4df5018	! t0_kref+0x15ec:   	ldxa	[%i5 + %i0]0x80, %o2
	.word	0x9fc10000	! t0_kref+0x15f0:   	call	%g4
	.word	0xa0b28015	! t0_kref+0x15f4:   	orncc	%o2, %l5, %l0
	.word	0x9e2aabe3	! t0_kref+0x15f8:   	andn	%o2, 0xbe3, %o7
	.word	0x98c32f58	! t0_kref+0x15fc:   	addccc	%o4, 0xf58, %o4
	.word	0x9ba0052f	! t0_kref+0x1600:   	fsqrts	%f15, %f13
	.word	0xd4c71018	! t0_kref+0x1604:   	ldswa	[%i4 + %i0]0x80, %o2
	.word	0xa9b28998	! t0_kref+0x1608:   	bshuffle	%f10, %f24, %f20
	.word	0x113ccf04	! t0_kref+0x160c:   	sethi	%hi(0xf33c1000), %o0
	.word	0xc04e6001	! t0_kref+0x1610:   	ldsb	[%i1 + 1], %g0
	.word	0x9433657d	! t0_kref+0x1614:   	orn	%o5, 0x57d, %o2
	.word	0x89a00546	! t0_kref+0x1618:   	fsqrtd	%f6, %f4
	.word	0x9770000c	! t0_kref+0x161c:   	popc	%o4, %o3
	.word	0x9488320e	! t0_kref+0x1620:   	andcc	%g0, -0xdf2, %o2
	.word	0xd27f0018	! t0_kref+0x1624:   	swap	[%i4 + %i0], %o1
	.word	0x94b34000	! t0_kref+0x1628:   	orncc	%o5, %g0, %o2
	.word	0xe51fbd90	! t0_kref+0x162c:   	ldd	[%fp - 0x270], %f18
	.word	0x93a01a46	! t0_kref+0x1630:   	fdtoi	%f6, %f9
	.word	0xe3b8a040	! t0_kref+0x1634:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xc398a080	! t0_kref+0x1638:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0xa3a2c836	! t0_kref+0x163c:   	fadds	%f11, %f22, %f17
	.word	0x91322003	! t0_kref+0x1640:   	srl	%o0, 0x3, %o0
	.word	0xd428a009	! t0_kref+0x1644:   	stb	%o2, [%g2 + 9]
	.word	0x922023ba	! t0_kref+0x1648:   	sub	%g0, 0x3ba, %o1
	.word	0xe300a000	! t0_kref+0x164c:   	ld	[%g2], %f17
	.word	0xe3b8a040	! t0_kref+0x1650:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xee7e0000	! t0_kref+0x1654:   	swap	[%i0], %l7
	.word	0xac603422	! t0_kref+0x1658:   	subc	%g0, -0xbde, %l6
	.word	0xec78a030	! t0_kref+0x165c:   	swap	[%g2 + 0x30], %l6
	.word	0xe2e81019	! t0_kref+0x1660:   	ldstuba	[%g0 + %i1]0x80, %l1
	.word	0xee0e6017	! t0_kref+0x1664:   	ldub	[%i1 + 0x17], %l7
	.word	0x95b28334	! t0_kref+0x1668:   	bmask	%o2, %l4, %o2
	.word	0xfb20a000	! t0_kref+0x166c:   	st	%f29, [%g2]
	.word	0x3f480003	! t0_kref+0x1670:   	fbo,a,pt	%fcc0, _kref+0x167c
	.word	0xbba40925	! t0_kref+0x1674:   	fmuls	%f16, %f5, %f29
	.word	0xb4102001	! t0_kref+0x1678:   	mov	0x1, %i2
	.word	0x81850000	! t0_kref+0x167c:   	wr	%l4, %g0, %y
	.word	0xa5b58f9c	! t0_kref+0x1680:   	for	%f22, %f28, %f18
	.word	0xf19e5a5d	! t0_kref+0x1684:   	ldda	[%i1 + %i5]0xd2, %f24
	.word	0xcd1fbc80	! t0_kref+0x1688:   	ldd	[%fp - 0x380], %f6
	.word	0xd01e6018	! t0_kref+0x168c:   	ldd	[%i1 + 0x18], %o0
	.word	0xae952cd9	! t0_kref+0x1690:   	orcc	%l4, 0xcd9, %l7
	.word	0xde4e7fea	! t0_kref+0x1694:   	ldsb	[%i1 - 0x16], %o7
	.word	0x25480003	! t0_kref+0x1698:   	fblg,a,pt	%fcc0, _kref+0x16a4
	.word	0xb9b58a04	! t0_kref+0x169c:   	fpadd16	%f22, %f4, %f28
	.word	0xbbb00768	! t0_kref+0x16a0:   	fpack16	%f8, %f29
	.word	0x9de3bfa0	! t0_kref+0x16a4:   	save	%sp, -0x60, %sp
	.word	0xb286401c	! t0_kref+0x16a8:   	addcc	%i1, %i4, %i1
	.word	0xafee4019	! t0_kref+0x16ac:   	restore	%i1, %i1, %l7
	.word	0x90d28016	! t0_kref+0x16b0:   	umulcc	%o2, %l6, %o0
	.word	0x9ad0262f	! t0_kref+0x16b4:   	umulcc	%g0, 0x62f, %o5
	.word	0xd210a02a	! t0_kref+0x16b8:   	lduh	[%g2 + 0x2a], %o1
	.word	0xd4680018	! t0_kref+0x16bc:   	ldstub	[%g0 + %i0], %o2
	.word	0x3c480004	! t0_kref+0x16c0:   	bpos,a,pt	%icc, _kref+0x16d0
	.word	0x953a8015	! t0_kref+0x16c4:   	sra	%o2, %l5, %o2
	.word	0xd0280019	! t0_kref+0x16c8:   	stb	%o0, [%g0 + %i1]
	.word	0xcd06600c	! t0_kref+0x16cc:   	ld	[%i1 + 0xc], %f6
	.word	0xda16401b	! t0_kref+0x16d0:   	lduh	[%i1 + %i3], %o5
	.word	0xe07f0018	! t0_kref+0x16d4:   	swap	[%i4 + %i0], %l0
	.word	0x97400000	! t0_kref+0x16d8:   	mov	%y, %o3
	.word	0xbba5c83b	! t0_kref+0x16dc:   	fadds	%f23, %f27, %f29
	.word	0x95a4c828	! t0_kref+0x16e0:   	fadds	%f19, %f8, %f10
	.word	0x9136a006	! t0_kref+0x16e4:   	srl	%i2, 0x6, %o0
	.word	0x81ad0a32	! t0_kref+0x16e8:   	fcmps	%fcc0, %f20, %f18
	.word	0x86102011	! t0_kref+0x16ec:   	mov	0x11, %g3
	.word	0x86a0e001	! t0_kref+0x16f0:   	subcc	%g3, 1, %g3
	.word	0x2280001d	! t0_kref+0x16f4:   	be,a	_kref+0x1768
	.word	0xb9a00033	! t0_kref+0x16f8:   	fmovs	%f19, %f28
	.word	0x81ab8ace	! t0_kref+0x16fc:   	fcmped	%fcc0, %f14, %f14
	.word	0x9e25e2d8	! t0_kref+0x1700:   	sub	%l7, 0x2d8, %o7
	.word	0xec1e7fe0	! t0_kref+0x1704:   	ldd	[%i1 - 0x20], %l6
	.word	0xac3a282e	! t0_kref+0x1708:   	xnor	%o0, 0x82e, %l6
	.word	0x90702690	! t0_kref+0x170c:   	udiv	%g0, 0x690, %o0
	.word	0x99400000	! t0_kref+0x1710:   	mov	%y, %o4
	.word	0xd608a02a	! t0_kref+0x1714:   	ldub	[%g2 + 0x2a], %o3
	.word	0x92432464	! t0_kref+0x1718:   	addc	%o4, 0x464, %o1
	.word	0x95a00550	! t0_kref+0x171c:   	fsqrtd	%f16, %f10
	.word	0xb1a208c4	! t0_kref+0x1720:   	fsubd	%f8, %f4, %f24
	.word	0x8db58a0a	! t0_kref+0x1724:   	fpadd16	%f22, %f10, %f6
	.word	0x394ffff2	! t0_kref+0x1728:   	fbuge,a,pt	%fcc0, _kref+0x16f0
	.word	0xaf1df4c8	! t0_kref+0x172c:   	tsubcctv	%l7, -0xb38, %l7
	.word	0xea26401c	! t0_kref+0x1730:   	st	%l5, [%i1 + %i4]
	.word	0xe03e001d	! t0_kref+0x1734:   	std	%l0, [%i0 + %i5]
	.word	0x81aa8a2b	! t0_kref+0x1738:   	fcmps	%fcc0, %f10, %f11
	.word	0xf51fbe58	! t0_kref+0x173c:   	ldd	[%fp - 0x1a8], %f26
	.word	0x91a0190f	! t0_kref+0x1740:   	fitod	%f15, %f8
	.word	0xf900a008	! t0_kref+0x1744:   	ld	[%g2 + 8], %f28
	.word	0x91656533	! t0_kref+0x1748:   	movcs	%icc, -0x2cd, %o0
	.word	0xb3a0002e	! t0_kref+0x174c:   	fmovs	%f14, %f25
	.word	0xe4ae1000	! t0_kref+0x1750:   	stba	%l2, [%i0]0x80
	.word	0xe3b8a040	! t0_kref+0x1754:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xb7b10df1	! t0_kref+0x1758:   	fnands	%f4, %f17, %f27
	.word	0xd11fbcc0	! t0_kref+0x175c:   	ldd	[%fp - 0x340], %f8
	.word	0xef68a040	! t0_kref+0x1760:   	prefetch	%g2 + 0x40, 23
	.word	0x9b3a000d	! t0_kref+0x1764:   	sra	%o0, %o5, %o5
	.word	0x96d0369a	! t0_kref+0x1768:   	umulcc	%g0, -0x966, %o3
	.word	0xa5a00031	! t0_kref+0x176c:   	fmovs	%f17, %f18
	.word	0xde08a010	! t0_kref+0x1770:   	ldub	[%g2 + 0x10], %o7
	.word	0x2d480007	! t0_kref+0x1774:   	fbg,a,pt	%fcc0, _kref+0x1790
	.word	0x92b5b440	! t0_kref+0x1778:   	orncc	%l6, -0xbc0, %o1
	.word	0x9275e352	! t0_kref+0x177c:   	udiv	%l7, 0x352, %o1
	.word	0x81408000	! t0_kref+0x1780:   	mov	%ccr, %g0
	.word	0xacd6bacc	! t0_kref+0x1784:   	umulcc	%i2, -0x534, %l6
	.word	0x9656800c	! t0_kref+0x1788:   	umul	%i2, %o4, %o3
	.word	0x8182c000	! t0_kref+0x178c:   	wr	%o3, %g0, %y
	.word	0xd800a028	! t0_kref+0x1790:   	ld	[%g2 + 0x28], %o4
	.word	0xf9000018	! t0_kref+0x1794:   	ld	[%g0 + %i0], %f28
	.word	0xd650a028	! t0_kref+0x1798:   	ldsh	[%g2 + 0x28], %o3
	.word	0xb1b186ee	! t0_kref+0x179c:   	fmul8ulx16	%f6, %f14, %f24
	.word	0xc398a080	! t0_kref+0x17a0:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0xd830a008	! t0_kref+0x17a4:   	sth	%o4, [%g2 + 8]
	.word	0xb9a20d2f	! t0_kref+0x17a8:   	fsmuld	%f8, %f15, %f28
	.word	0xc398a080	! t0_kref+0x17ac:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0x80150009	! t0_kref+0x17b0:   	or	%l4, %o1, %g0
	.word	0xb1b00fc0	! t0_kref+0x17b4:   	fone	%f24
	.word	0xa7a0052d	! t0_kref+0x17b8:   	fsqrts	%f13, %f19
	.word	0xb9a0055c	! t0_kref+0x17bc:   	fsqrtd	%f28, %f28
	.word	0xfe016154	! t0_kref+0x17c0:   	ld	[%g5 + 0x154], %i7
	.word	0x9422350d	! t0_kref+0x17c4:   	sub	%o0, -0xaf3, %o2
	.word	0x9424800b	! t0_kref+0x17c8:   	sub	%l2, %o3, %o2
	.word	0x86102001	! t0_kref+0x17cc:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x17d0:   	bne,a	_kref+0x17d0
	.word	0x86a0e001	! t0_kref+0x17d4:   	subcc	%g3, 1, %g3
	.word	0x1716a5f1	! t0_kref+0x17d8:   	sethi	%hi(0x5a97c400), %o3
	.word	0xfd6e401d	! t0_kref+0x17dc:   	prefetch	%i1 + %i5, 30
	.word	0xec00a000	! t0_kref+0x17e0:   	ld	[%g2], %l6
	.word	0x81834000	! t0_kref+0x17e4:   	wr	%o5, %g0, %y
	.word	0x9f22b14e	! t0_kref+0x17e8:   	mulscc	%o2, -0xeb2, %o7
	.word	0xb7a01891	! t0_kref+0x17ec:   	fitos	%f17, %f27
	.word	0x92e03641	! t0_kref+0x17f0:   	subccc	%g0, -0x9bf, %o1
	.word	0x2d480002	! t0_kref+0x17f4:   	fbg,a,pt	%fcc0, _kref+0x17fc
	.word	0x1f15963e	! t0_kref+0x17f8:   	sethi	%hi(0x5658f800), %o7
	.word	0x3f800008	! t0_kref+0x17fc:   	fbo,a	_kref+0x181c
	.word	0x9ee5c00b	! t0_kref+0x1800:   	subccc	%l7, %o3, %o7
	.word	0x9fb24040	! t0_kref+0x1804:   	edge8l	%o1, %g0, %o7
	.word	0xcd1fbe68	! t0_kref+0x1808:   	ldd	[%fp - 0x198], %f6
	.word	0xec2e2011	! t0_kref+0x180c:   	stb	%l6, [%i0 + 0x11]
	.word	0x9896a228	! t0_kref+0x1810:   	orcc	%i2, 0x228, %o4
	.word	0x3d800005	! t0_kref+0x1814:   	fbule,a	_kref+0x1828
	.word	0xfb00a028	! t0_kref+0x1818:   	ld	[%g2 + 0x28], %f29
	.word	0xc398a080	! t0_kref+0x181c:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0xd030a032	! t0_kref+0x1820:   	sth	%o0, [%g2 + 0x32]
	.word	0xbbb10dac	! t0_kref+0x1824:   	fxors	%f4, %f12, %f29
	.word	0x8610201b	! t0_kref+0x1828:   	mov	0x1b, %g3
	.word	0x86a0e001	! t0_kref+0x182c:   	subcc	%g3, 1, %g3
	.word	0x22800001	! t0_kref+0x1830:   	be,a	_kref+0x1834
	.word	0xb9a0191d	! t0_kref+0x1834:   	fitod	%f29, %f28
	.word	0x99b00156	! t0_kref+0x1838:   	edge32l	%g0, %l6, %o4
	.word	0x21800006	! t0_kref+0x183c:   	fbn,a	_kref+0x1854
	.word	0xed68a04d	! t0_kref+0x1840:   	prefetch	%g2 + 0x4d, 22
	.word	0x9ed6a999	! t0_kref+0x1844:   	umulcc	%i2, 0x999, %o7
	.word	0x9092c012	! t0_kref+0x1848:   	orcc	%o3, %l2, %o0
	.word	0xd6c01018	! t0_kref+0x184c:   	ldswa	[%g0 + %i0]0x80, %o3
	.word	0x89a00525	! t0_kref+0x1850:   	fsqrts	%f5, %f4
	.word	0xd230a012	! t0_kref+0x1854:   	sth	%o1, [%g2 + 0x12]
	.word	0xc0881019	! t0_kref+0x1858:   	lduba	[%g0 + %i1]0x80, %g0
	.word	0xee264000	! t0_kref+0x185c:   	st	%l7, [%i1]
	.word	0x925aaddf	! t0_kref+0x1860:   	smul	%o2, 0xddf, %o1
	.word	0xe03e2008	! t0_kref+0x1864:   	std	%l0, [%i0 + 8]
	.word	0xae22000d	! t0_kref+0x1868:   	sub	%o0, %o5, %l7
	.word	0xb7a000a4	! t0_kref+0x186c:   	fnegs	%f4, %f27
	call	SYM(t0_subr1)
	.word	0x921d772c	! t0_kref+0x1874:   	xor	%l5, -0x8d4, %o1
	.word	0xac02b617	! t0_kref+0x1878:   	add	%o2, -0x9e9, %l6
	.word	0xe93f4018	! t0_kref+0x187c:   	std	%f20, [%i5 + %i0]
	.word	0xe1260000	! t0_kref+0x1880:   	st	%f16, [%i0]
	.word	0xa5b28f4a	! t0_kref+0x1884:   	fornot1	%f10, %f10, %f18
	.word	0xe5262014	! t0_kref+0x1888:   	st	%f18, [%i0 + 0x14]
	.word	0x95a01908	! t0_kref+0x188c:   	fitod	%f8, %f10
	.word	0xd250a030	! t0_kref+0x1890:   	ldsh	[%g2 + 0x30], %o1
	.word	0x9da01898	! t0_kref+0x1894:   	fitos	%f24, %f14
	.word	0xb5a00550	! t0_kref+0x1898:   	fsqrtd	%f16, %f26
	.word	0xe9be1812	! t0_kref+0x189c:   	stda	%f20, [%i0 + %l2]0xc0
	.word	0x24800001	! t0_kref+0x18a0:   	ble,a	_kref+0x18a4
	.word	0xd43e2018	! t0_kref+0x18a4:   	std	%o2, [%i0 + 0x18]
	.word	0x39800005	! t0_kref+0x18a8:   	fbuge,a	_kref+0x18bc
	.word	0xbba00527	! t0_kref+0x18ac:   	fsqrts	%f7, %f29
	.word	0xb1b6c733	! t0_kref+0x18b0:   	fmuld8ulx16	%f27, %f19, %f24
	.word	0x171d675e	! t0_kref+0x18b4:   	sethi	%hi(0x759d7800), %o3
	.word	0xd2266018	! t0_kref+0x18b8:   	st	%o1, [%i1 + 0x18]
	sethi	%hi(2f), %o7
	.word	0xe40be10c	! t0_kref+0x18c0:   	ldub	[%o7 + 0x10c], %l2
	.word	0xa41ca00c	! t0_kref+0x18c4:   	xor	%l2, 0xc, %l2
	.word	0xe42be10c	! t0_kref+0x18c8:   	stb	%l2, [%o7 + 0x10c]
	.word	0x81dbe10c	! t0_kref+0x18cc:   	flush	%o7 + 0x10c
	.word	0x9bb00fe0	! t0_kref+0x18d0:   	fones	%f13
	.word	0xda40a008	! t0_kref+0x18d4:   	ldsw	[%g2 + 8], %o5
	.word	0x9642ead7	! t0_kref+0x18d8:   	addc	%o3, 0xad7, %o3
	.word	0xac54800c	! t0_kref+0x18dc:   	umul	%l2, %o4, %l6
	.word	0x81dc75e2	! t0_kref+0x18e0:   	flush	%l1 - 0xa1e
	.word	0xaf400000	! t0_kref+0x18e4:   	mov	%y, %l7
	.word	0x91a38d26	! t0_kref+0x18e8:   	fsmuld	%f14, %f6, %f8
	.word	0xe91fbe38	! t0_kref+0x18ec:   	ldd	[%fp - 0x1c8], %f20
	.word	0x951d0012	! t0_kref+0x18f0:   	tsubcctv	%l4, %l2, %o2
	.word	0xd810a022	! t0_kref+0x18f4:   	lduh	[%g2 + 0x22], %o4
	.word	0xf91e7fe8	! t0_kref+0x18f8:   	ldd	[%i1 - 0x18], %f28
	.word	0x92e28017	! t0_kref+0x18fc:   	subccc	%o2, %l7, %o1
	.word	0xc9be1a1a	! t0_kref+0x1900:   	stda	%f4, [%i0 + %i2]0xd0
	.word	0x925eb452	! t0_kref+0x1904:   	smul	%i2, -0xbae, %o1
	.word	0xb9a0003d	! t0_kref+0x1908:   	fmovs	%f29, %f28
2:	.word	0xaf2c8009	! t0_kref+0x190c:   	sll	%l2, %o1, %l7
	.word	0x31800005	! t0_kref+0x1910:   	fba,a	_kref+0x1924
	.word	0xae05e0fe	! t0_kref+0x1914:   	add	%l7, 0xfe, %l7
	.word	0x9db20e80	! t0_kref+0x1918:   	fsrc1	%f8, %f14
	.word	0xa7a000b9	! t0_kref+0x191c:   	fnegs	%f25, %f19
	.word	0x95a00125	! t0_kref+0x1920:   	fabss	%f5, %f10
	.word	0x2d480001	! t0_kref+0x1924:   	fbg,a,pt	%fcc0, _kref+0x1928
	.word	0x94d4a3f0	! t0_kref+0x1928:   	umulcc	%l2, 0x3f0, %o2
	.word	0xadb00008	! t0_kref+0x192c:   	edge8	%g0, %o0, %l6
	.word	0xb9a018c8	! t0_kref+0x1930:   	fdtos	%f8, %f28
	.word	0x952d000d	! t0_kref+0x1934:   	sll	%l4, %o5, %o2
	.word	0x37480006	! t0_kref+0x1938:   	fbge,a,pt	%fcc0, _kref+0x1950
	.word	0x992ae010	! t0_kref+0x193c:   	sll	%o3, 0x10, %o4
	.word	0xd60e0000	! t0_kref+0x1940:   	ldub	[%i0], %o3
	.word	0x89a188d2	! t0_kref+0x1944:   	fsubd	%f6, %f18, %f4
	.word	0x945d800d	! t0_kref+0x1948:   	smul	%l6, %o5, %o2
	.word	0x95a2892b	! t0_kref+0x194c:   	fmuls	%f10, %f11, %f10
	.word	0xd9beda18	! t0_kref+0x1950:   	stda	%f12, [%i3 + %i0]0xd0
	.word	0xf91e0000	! t0_kref+0x1954:   	ldd	[%i0], %f28
	.word	0x31800002	! t0_kref+0x1958:   	fba,a	_kref+0x1960
	.word	0xe93e7ff8	! t0_kref+0x195c:   	std	%f20, [%i1 - 8]
	.word	0xa7a74838	! t0_kref+0x1960:   	fadds	%f29, %f24, %f19
	.word	0x23480008	! t0_kref+0x1964:   	fbne,a,pt	%fcc0, _kref+0x1984
	.word	0xa7b54e68	! t0_kref+0x1968:   	fxnors	%f21, %f8, %f19
	.word	0xd1270018	! t0_kref+0x196c:   	st	%f8, [%i4 + %i0]
	.word	0xea366012	! t0_kref+0x1970:   	sth	%l5, [%i1 + 0x12]
	.word	0xaee30015	! t0_kref+0x1974:   	subccc	%o4, %l5, %l7
	.word	0x9a5d2f06	! t0_kref+0x1978:   	smul	%l4, 0xf06, %o5
	.word	0x95a000b8	! t0_kref+0x197c:   	fnegs	%f24, %f10
	.word	0x972de01b	! t0_kref+0x1980:   	sll	%l7, 0x1b, %o3
	.word	0x9424f73b	! t0_kref+0x1984:   	sub	%l3, -0x8c5, %o2
	.word	0xdd3e4000	! t0_kref+0x1988:   	std	%f14, [%i1]
	.word	0x9005401a	! t0_kref+0x198c:   	add	%l5, %i2, %o0
	.word	0x9b2de00f	! t0_kref+0x1990:   	sll	%l7, 0xf, %o5
	.word	0xd24e3ffe	! t0_kref+0x1994:   	ldsb	[%i0 - 2], %o1
	.word	0x9415400d	! t0_kref+0x1998:   	or	%l5, %o5, %o2
	.word	0xe3b8a040	! t0_kref+0x199c:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x9db10a4e	! t0_kref+0x19a0:   	fpadd32	%f4, %f14, %f14
	.word	0x973cc01a	! t0_kref+0x19a4:   	sra	%l3, %i2, %o3
	.word	0x805ca7fd	! t0_kref+0x19a8:   	smul	%l2, 0x7fd, %g0
	.word	0x9075fea5	! t0_kref+0x19ac:   	udiv	%l7, -0x15b, %o0
	.word	0xb9a0191c	! t0_kref+0x19b0:   	fitod	%f28, %f28
	.word	0xac22000a	! t0_kref+0x19b4:   	sub	%o0, %o2, %l6
	.word	0xee0e6002	! t0_kref+0x19b8:   	ldub	[%i1 + 2], %l7
	.word	0x9ad68000	! t0_kref+0x19bc:   	umulcc	%i2, %g0, %o5
	.word	0xed063ff0	! t0_kref+0x19c0:   	ld	[%i0 - 0x10], %f22
	.word	0xd616401b	! t0_kref+0x19c4:   	lduh	[%i1 + %i3], %o3
	.word	0xe8780018	! t0_kref+0x19c8:   	swap	[%g0 + %i0], %l4
	.word	0x3f800001	! t0_kref+0x19cc:   	fbo,a	_kref+0x19d0
	.word	0xd99f1a18	! t0_kref+0x19d0:   	ldda	[%i4 + %i0]0xd0, %f12
	.word	0xe5066010	! t0_kref+0x19d4:   	ld	[%i1 + 0x10], %f18
	.word	0xacd2000c	! t0_kref+0x19d8:   	umulcc	%o0, %o4, %l6
	.word	0x813b0015	! t0_kref+0x19dc:   	sra	%o4, %l5, %g0
	.word	0x91a01a3a	! t0_kref+0x19e0:   	fstoi	%f26, %f8
	.word	0x91b28015	! t0_kref+0x19e4:   	edge8	%o2, %l5, %o0
	.word	0x910af585	! t0_kref+0x19e8:   	tsubcc	%o3, -0xa7b, %o0
	.word	0x9bb2006b	! t0_kref+0x19ec:   	edge8ln	%o0, %o3, %o5
	.word	0x9e22b2e9	! t0_kref+0x19f0:   	sub	%o2, -0xd17, %o7
	.word	0x972dc01a	! t0_kref+0x19f4:   	sll	%l7, %i2, %o3
	.word	0x89a00558	! t0_kref+0x19f8:   	fsqrtd	%f24, %f4
	.word	0xe62e4000	! t0_kref+0x19fc:   	stb	%l3, [%i1]
	.word	0x91b58f4e	! t0_kref+0x1a00:   	fornot1	%f22, %f14, %f8
	.word	0xa3b50e38	! t0_kref+0x1a04:   	fands	%f20, %f24, %f17
	.word	0xd04e6012	! t0_kref+0x1a08:   	ldsb	[%i1 + 0x12], %o0
	.word	0xb5a1cd25	! t0_kref+0x1a0c:   	fsmuld	%f7, %f5, %f26
	.word	0xada01912	! t0_kref+0x1a10:   	fitod	%f18, %f22
	.word	0xd9bf5019	! t0_kref+0x1a14:   	stda	%f12, [%i5 + %i1]0x80
	.word	0xaec00009	! t0_kref+0x1a18:   	addccc	%g0, %o1, %l7
	.word	0xd84e4000	! t0_kref+0x1a1c:   	ldsb	[%i1], %o4
	.word	0xb9a00558	! t0_kref+0x1a20:   	fsqrtd	%f24, %f28
	.word	0x9ba01899	! t0_kref+0x1a24:   	fitos	%f25, %f13
	.word	0x91b384c8	! t0_kref+0x1a28:   	fcmpne32	%f14, %f8, %o0
	.word	0x9a86a7de	! t0_kref+0x1a2c:   	addcc	%i2, 0x7de, %o5
	.word	0x81a94ab8	! t0_kref+0x1a30:   	fcmpes	%fcc0, %f5, %f24
	.word	0xd640a000	! t0_kref+0x1a34:   	ldsw	[%g2], %o3
	.word	0xc93f4019	! t0_kref+0x1a38:   	std	%f4, [%i5 + %i1]
	.word	0x81aa0ab0	! t0_kref+0x1a3c:   	fcmpes	%fcc0, %f8, %f16
	.word	0xa9a01898	! t0_kref+0x1a40:   	fitos	%f24, %f20
	.word	0x89b00764	! t0_kref+0x1a44:   	fpack16	%f4, %f4
	.word	0xc398a080	! t0_kref+0x1a48:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0x99b5462a	! t0_kref+0x1a4c:   	fmul8x16	%f21, %f10, %f12
	.word	0x988d0013	! t0_kref+0x1a50:   	andcc	%l4, %l3, %o4
	.word	0xacc2f1cc	! t0_kref+0x1a54:   	addccc	%o3, -0xe34, %l6
	.word	0xee08a03a	! t0_kref+0x1a58:   	ldub	[%g2 + 0x3a], %l7
	.word	0x89a38d2c	! t0_kref+0x1a5c:   	fsmuld	%f14, %f12, %f4
	.word	0xb9a00531	! t0_kref+0x1a60:   	fsqrts	%f17, %f28
	.word	0xd93e401d	! t0_kref+0x1a64:   	std	%f12, [%i1 + %i5]
	.word	0xa5a608ce	! t0_kref+0x1a68:   	fsubd	%f24, %f14, %f18
	.word	0x89a01026	! t0_kref+0x1a6c:   	fstox	%f6, %f4
	.word	0xd4164000	! t0_kref+0x1a70:   	lduh	[%i1], %o2
	.word	0xafa01a2c	! t0_kref+0x1a74:   	fstoi	%f12, %f23
	.word	0x2b800005	! t0_kref+0x1a78:   	fbug,a	_kref+0x1a8c
	.word	0xe1be5a1b	! t0_kref+0x1a7c:   	stda	%f16, [%i1 + %i3]0xd0
	.word	0xd3270018	! t0_kref+0x1a80:   	st	%f9, [%i4 + %i0]
	.word	0x942a68bd	! t0_kref+0x1a84:   	andn	%o1, 0x8bd, %o2
	.word	0x9282f225	! t0_kref+0x1a88:   	addcc	%o3, -0xddb, %o1
	.word	0xde48a028	! t0_kref+0x1a8c:   	ldsb	[%g2 + 0x28], %o7
	.word	0xc0f61000	! t0_kref+0x1a90:   	stxa	%g0, [%i0]0x80
	.word	0xda262008	! t0_kref+0x1a94:   	st	%o5, [%i0 + 8]
	.word	0x9ac4c000	! t0_kref+0x1a98:   	addccc	%l3, %g0, %o5
	.word	0x962b3f34	! t0_kref+0x1a9c:   	andn	%o4, -0xcc, %o3
	.word	0x9604ec6d	! t0_kref+0x1aa0:   	add	%l3, 0xc6d, %o3
	.word	0x9aae801a	! t0_kref+0x1aa4:   	andncc	%i2, %i2, %o5
	.word	0x3d480008	! t0_kref+0x1aa8:   	fbule,a,pt	%fcc0, _kref+0x1ac8
	.word	0xc12e2014	! t0_kref+0x1aac:   	st	%fsr, [%i0 + 0x14]
	.word	0x8bb2ce3b	! t0_kref+0x1ab0:   	fands	%f11, %f27, %f5
	.word	0xaeb36d8c	! t0_kref+0x1ab4:   	orncc	%o5, 0xd8c, %l7
	.word	0xacfdc00a	! t0_kref+0x1ab8:   	sdivcc	%l7, %o2, %l6
	.word	0xc9a71019	! t0_kref+0x1abc:   	sta	%f4, [%i4 + %i1]0x80
	.word	0xd01e001d	! t0_kref+0x1ac0:   	ldd	[%i0 + %i5], %o0
	.word	0x81ad0ac6	! t0_kref+0x1ac4:   	fcmped	%fcc0, %f20, %f6
	.word	0xe99f5018	! t0_kref+0x1ac8:   	ldda	[%i5 + %i0]0x80, %f20
	.word	0xad2a8000	! t0_kref+0x1acc:   	sll	%o2, %g0, %l6
	.word	0xa5b48e0a	! t0_kref+0x1ad0:   	fand	%f18, %f10, %f18
	.word	0xef68a001	! t0_kref+0x1ad4:   	prefetch	%g2 + 1, 23
	.word	0x9da70d24	! t0_kref+0x1ad8:   	fsmuld	%f28, %f4, %f14
	.word	0x9a500008	! t0_kref+0x1adc:   	umul	%g0, %o0, %o5
	.word	0x81580000	! t0_kref+0x1ae0:   	flushw
	.word	0xad408000	! t0_kref+0x1ae4:   	mov	%ccr, %l6
	.word	0xac9df78e	! t0_kref+0x1ae8:   	xorcc	%l7, -0x872, %l6
	.word	0x948b000a	! t0_kref+0x1aec:   	andcc	%o4, %o2, %o2
	.word	0xf76e7ff8	! t0_kref+0x1af0:   	prefetch	%i1 - 8, 27
	.word	0x86102004	! t0_kref+0x1af4:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x1af8:   	bne,a	_kref+0x1af8
	.word	0x86a0e001	! t0_kref+0x1afc:   	subcc	%g3, 1, %g3
	.word	0xe3b8a040	! t0_kref+0x1b00:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xda50a018	! t0_kref+0x1b04:   	ldsh	[%g2 + 0x18], %o5
	.word	0xf9260000	! t0_kref+0x1b08:   	st	%f28, [%i0]
	.word	0xc16e2008	! t0_kref+0x1b0c:   	prefetch	%i0 + 8, 0
	.word	0x9de3bfa0	! t0_kref+0x1b10:   	save	%sp, -0x60, %sp
	.word	0x99ee7132	! t0_kref+0x1b14:   	restore	%i1, -0xece, %o4
	.word	0xf4a81018	! t0_kref+0x1b18:   	stba	%i2, [%g0 + %i0]0x80
	.word	0xeb260000	! t0_kref+0x1b1c:   	st	%f21, [%i0]
	.word	0x81580000	! t0_kref+0x1b20:   	flushw
	.word	0x8ba0002f	! t0_kref+0x1b24:   	fmovs	%f15, %f5
	.word	0x23800008	! t0_kref+0x1b28:   	fbne,a	_kref+0x1b48
	.word	0xcb00a008	! t0_kref+0x1b2c:   	ld	[%g2 + 8], %f5
	.word	0xc168a002	! t0_kref+0x1b30:   	prefetch	%g2 + 2, 0
	.word	0x9ab2f13d	! t0_kref+0x1b34:   	orncc	%o3, -0xec3, %o5
	.word	0x91a5c937	! t0_kref+0x1b38:   	fmuls	%f23, %f23, %f8
	.word	0x90d2400b	! t0_kref+0x1b3c:   	umulcc	%o1, %o3, %o0
	call	SYM(t0_subr3)
	.word	0x9a3c8015	! t0_kref+0x1b44:   	xnor	%l2, %l5, %o5
	.word	0xef00a008	! t0_kref+0x1b48:   	ld	[%g2 + 8], %f23
	.word	0x8143c000	! t0_kref+0x1b4c:   	stbar
	.word	0xb1b48a92	! t0_kref+0x1b50:   	fpsub16	%f18, %f18, %f24
	.word	0xa7b007b0	! t0_kref+0x1b54:   	fpackfix	%f16, %f19
	.word	0xadb14d39	! t0_kref+0x1b58:   	fandnot1s	%f5, %f25, %f22
	.word	0xcf266004	! t0_kref+0x1b5c:   	st	%f7, [%i1 + 4]
	.word	0xaf400000	! t0_kref+0x1b60:   	mov	%y, %l7
	.word	0xa3a00529	! t0_kref+0x1b64:   	fsqrts	%f9, %f17
	.word	0xaba54830	! t0_kref+0x1b68:   	fadds	%f21, %f16, %f21
	.word	0xd640a000	! t0_kref+0x1b6c:   	ldsw	[%g2], %o3
	.word	0x8135a01f	! t0_kref+0x1b70:   	srl	%l6, 0x1f, %g0
	.word	0x9fc10000	! t0_kref+0x1b74:   	call	%g4
	.word	0xd650a008	! t0_kref+0x1b78:   	ldsh	[%g2 + 8], %o3
	.word	0xa3a00528	! t0_kref+0x1b7c:   	fsqrts	%f8, %f17
	.word	0xae5d3a85	! t0_kref+0x1b80:   	smul	%l4, -0x57b, %l7
	.word	0x908b289b	! t0_kref+0x1b84:   	andcc	%o4, 0x89b, %o0
	.word	0xb5a288d0	! t0_kref+0x1b88:   	fsubd	%f10, %f16, %f26
	.word	0x89a00124	! t0_kref+0x1b8c:   	fabss	%f4, %f4
	sethi	%hi(2f), %o7
	.word	0xe40be3c4	! t0_kref+0x1b94:   	ldub	[%o7 + 0x3c4], %l2
	.word	0xa41ca00c	! t0_kref+0x1b98:   	xor	%l2, 0xc, %l2
	.word	0xe42be3c4	! t0_kref+0x1b9c:   	stb	%l2, [%o7 + 0x3c4]
	.word	0x81dbe3c4	! t0_kref+0x1ba0:   	flush	%o7 + 0x3c4
	.word	0x8db70c8e	! t0_kref+0x1ba4:   	fandnot2	%f28, %f14, %f6
	.word	0xb1b58ad8	! t0_kref+0x1ba8:   	fpsub32	%f22, %f24, %f24
	.word	0xa9a40834	! t0_kref+0x1bac:   	fadds	%f16, %f20, %f20
	.word	0xda08a00b	! t0_kref+0x1bb0:   	ldub	[%g2 + 0xb], %o5
	.word	0x97a0003c	! t0_kref+0x1bb4:   	fmovs	%f28, %f11
	.word	0xaebb400c	! t0_kref+0x1bb8:   	xnorcc	%o5, %o4, %l7
	.word	0xae368015	! t0_kref+0x1bbc:   	orn	%i2, %l5, %l7
	.word	0x3f480003	! t0_kref+0x1bc0:   	fbo,a,pt	%fcc0, _kref+0x1bcc
2:	.word	0x928a3f0c	! t0_kref+0x1bc4:   	andcc	%o0, -0xf4, %o1
	.word	0x01061010	! t0_kref+0x1bc8:   	sethi	%hi(0x18404000), %g0
	.word	0xd0267ff4	! t0_kref+0x1bcc:   	st	%o0, [%i1 - 0xc]
	.word	0xa5b00fc0	! t0_kref+0x1bd0:   	fone	%f18
	.word	0x3b800008	! t0_kref+0x1bd4:   	fble,a	_kref+0x1bf4
	.word	0xec00a020	! t0_kref+0x1bd8:   	ld	[%g2 + 0x20], %l6
	.word	0xad400000	! t0_kref+0x1bdc:   	mov	%y, %l6
	.word	0x81a90ad0	! t0_kref+0x1be0:   	fcmped	%fcc0, %f4, %f16
	.word	0xec00a010	! t0_kref+0x1be4:   	ld	[%g2 + 0x10], %l6
	.word	0xee066018	! t0_kref+0x1be8:   	ld	[%i1 + 0x18], %l7
	.word	0x99b340b5	! t0_kref+0x1bec:   	edge16n	%o5, %l5, %o4
	.word	0x8db00f0a	! t0_kref+0x1bf0:   	fsrc2	%f10, %f6
	.word	0xac6269e6	! t0_kref+0x1bf4:   	subc	%o1, 0x9e6, %l6
	.word	0x20800006	! t0_kref+0x1bf8:   	bn,a	_kref+0x1c10
	.word	0x95a4483b	! t0_kref+0x1bfc:   	fadds	%f17, %f27, %f10
	.word	0xec1e2008	! t0_kref+0x1c00:   	ldd	[%i0 + 8], %l6
	.word	0x9123000a	! t0_kref+0x1c04:   	mulscc	%o4, %o2, %o0
	.word	0xb7a0188c	! t0_kref+0x1c08:   	fitos	%f12, %f27
	.word	0x81ac0ad6	! t0_kref+0x1c0c:   	fcmped	%fcc0, %f16, %f22
	.word	0x95a708c4	! t0_kref+0x1c10:   	fsubd	%f28, %f4, %f10
	.word	0xb1b20e80	! t0_kref+0x1c14:   	fsrc1	%f8, %f24
	.word	0x95a0054a	! t0_kref+0x1c18:   	fsqrtd	%f10, %f10
	.word	0x23480008	! t0_kref+0x1c1c:   	fbne,a,pt	%fcc0, _kref+0x1c3c
	.word	0xe3b8a040	! t0_kref+0x1c20:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x89a388a4	! t0_kref+0x1c24:   	fsubs	%f14, %f4, %f4
	.word	0xbba000b5	! t0_kref+0x1c28:   	fnegs	%f21, %f29
	.word	0x97703755	! t0_kref+0x1c2c:   	popc	-0x8ab, %o3
	.word	0xf500a020	! t0_kref+0x1c30:   	ld	[%g2 + 0x20], %f26
	.word	0x9a256bc3	! t0_kref+0x1c34:   	sub	%l5, 0xbc3, %o5
	.word	0xe3b8a040	! t0_kref+0x1c38:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x21800006	! t0_kref+0x1c3c:   	fbn,a	_kref+0x1c54
	.word	0x1916b4f5	! t0_kref+0x1c40:   	sethi	%hi(0x5ad3d400), %o4
	.word	0x95b284ca	! t0_kref+0x1c44:   	fcmpne32	%f10, %f10, %o2
	.word	0x9472ffb0	! t0_kref+0x1c48:   	udiv	%o3, -0x50, %o2
	.word	0xa3a0189d	! t0_kref+0x1c4c:   	fitos	%f29, %f17
	.word	0x95a0188a	! t0_kref+0x1c50:   	fitos	%f10, %f10
	.word	0xe3267ff0	! t0_kref+0x1c54:   	st	%f17, [%i1 - 0x10]
	.word	0x91a3082b	! t0_kref+0x1c58:   	fadds	%f12, %f11, %f8
	.word	0x9105b580	! t0_kref+0x1c5c:   	taddcc	%l6, -0xa80, %o0
	.word	0x9de3bfa0	! t0_kref+0x1c60:   	save	%sp, -0x60, %sp
	.word	0xbad80018	! t0_kref+0x1c64:   	smulcc	%g0, %i0, %i5
	.word	0x81ee4018	! t0_kref+0x1c68:   	restore	%i1, %i0, %g0
	.word	0xaba44834	! t0_kref+0x1c6c:   	fadds	%f17, %f20, %f21
	.word	0xe3b8a040	! t0_kref+0x1c70:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xad3b0016	! t0_kref+0x1c74:   	sra	%o4, %l6, %l6
	.word	0xb7a01884	! t0_kref+0x1c78:   	fitos	%f4, %f27
	.word	0x97b58333	! t0_kref+0x1c7c:   	bmask	%l6, %l3, %o3
	.word	0x97268014	! t0_kref+0x1c80:   	mulscc	%i2, %l4, %o3
	.word	0x8ba01889	! t0_kref+0x1c84:   	fitos	%f9, %f5
	.word	0x25480007	! t0_kref+0x1c88:   	fblg,a,pt	%fcc0, _kref+0x1ca4
	.word	0xc398a080	! t0_kref+0x1c8c:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0xec8e9059	! t0_kref+0x1c90:   	lduba	[%i2 + %i1]0x82, %l6
	.word	0x99400000	! t0_kref+0x1c94:   	mov	%y, %o4
	.word	0xadb50c6f	! t0_kref+0x1c98:   	fnors	%f20, %f15, %f22
	.word	0x9a2d8014	! t0_kref+0x1c9c:   	andn	%l6, %l4, %o5
	.word	0x81b5845a	! t0_kref+0x1ca0:   	fcmpne16	%f22, %f26, %g0
	.word	0x37480004	! t0_kref+0x1ca4:   	fbge,a,pt	%fcc0, _kref+0x1cb4
	.word	0x89b00f04	! t0_kref+0x1ca8:   	fsrc2	%f4, %f4
	.word	0xc398a080	! t0_kref+0x1cac:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0x9fc00004	! t0_kref+0x1cb0:   	call	%g0 + %g4
	.word	0xafa00038	! t0_kref+0x1cb4:   	fmovs	%f24, %f23
	.word	0x91336019	! t0_kref+0x1cb8:   	srl	%o5, 0x19, %o0
	.word	0x87802082	! t0_kref+0x1cbc:   	mov	0x82, %asi
	.word	0x3d480003	! t0_kref+0x1cc0:   	fbule,a,pt	%fcc0, _kref+0x1ccc
	.word	0xd610a030	! t0_kref+0x1cc4:   	lduh	[%g2 + 0x30], %o3
	.word	0x9fc10000	! t0_kref+0x1cc8:   	call	%g4
	.word	0x91b2c332	! t0_kref+0x1ccc:   	bmask	%o3, %l2, %o0
	.word	0xd0000018	! t0_kref+0x1cd0:   	ld	[%g0 + %i0], %o0
	.word	0x80c2ef39	! t0_kref+0x1cd4:   	addccc	%o3, 0xf39, %g0
	.word	0xd3e65015	! t0_kref+0x1cd8:   	casa	[%i1]0x80, %l5, %o1
	.word	0x9fc10000	! t0_kref+0x1cdc:   	call	%g4
	.word	0xd0366014	! t0_kref+0x1ce0:   	sth	%o0, [%i1 + 0x14]
	.word	0x8d858013	! t0_kref+0x1ce4:   	wr	%l6, %l3, %fprs
	call	SYM(t0_subr1)
	.word	0xa065ae7e	! t0_kref+0x1cec:   	subc	%l6, 0xe7e, %l0
	.word	0xe9064000	! t0_kref+0x1cf0:   	ld	[%i1], %f20
	.word	0x81828000	! t0_kref+0x1cf4:   	wr	%o2, %g0, %y
	.word	0x8ba6c82c	! t0_kref+0x1cf8:   	fadds	%f27, %f12, %f5
	.word	0x963033c6	! t0_kref+0x1cfc:   	orn	%g0, -0xc3a, %o3
	.word	0x93a0052c	! t0_kref+0x1d00:   	fsqrts	%f12, %f9
	.word	0xb5b30e34	! t0_kref+0x1d04:   	fands	%f12, %f20, %f26
	.word	0x81a90a3d	! t0_kref+0x1d08:   	fcmps	%fcc0, %f4, %f29
	.word	0xe16e7fe8	! t0_kref+0x1d0c:   	prefetch	%i1 - 0x18, 16
	.word	0xd09e101d	! t0_kref+0x1d10:   	ldda	[%i0 + %i5]0x80, %o0
	.word	0xd8ee1000	! t0_kref+0x1d14:   	ldstuba	[%i0]0x80, %o4
	.word	0x2d264a48	! t0_kref+0x1d18:   	sethi	%hi(0x99292000), %l6
	.word	0xb7b4cd60	! t0_kref+0x1d1c:   	fnot1s	%f19, %f27
	.word	0xada708c8	! t0_kref+0x1d20:   	fsubd	%f28, %f8, %f22
	.word	0xad400000	! t0_kref+0x1d24:   	mov	%y, %l6
	.word	0x8fb50af2	! t0_kref+0x1d28:   	fpsub32s	%f20, %f18, %f7
	.word	0xacba4000	! t0_kref+0x1d2c:   	xnorcc	%o1, %g0, %l6
	.word	0x81ac0a58	! t0_kref+0x1d30:   	fcmpd	%fcc0, %f16, %f24
	.word	0x2d30fd73	! t0_kref+0x1d34:   	sethi	%hi(0xc3f5cc00), %l6
	.word	0xd80e600b	! t0_kref+0x1d38:   	ldub	[%i1 + 0xb], %o4
	.word	0x35800001	! t0_kref+0x1d3c:   	fbue,a	_kref+0x1d40
	.word	0x91a00554	! t0_kref+0x1d40:   	fsqrtd	%f20, %f8
	.word	0x93b20458	! t0_kref+0x1d44:   	fcmpne16	%f8, %f24, %o1
	.word	0xac120016	! t0_kref+0x1d48:   	or	%o0, %l6, %l6
	.word	0x81ad4a3d	! t0_kref+0x1d4c:   	fcmps	%fcc0, %f21, %f29
	.word	0xac652c3a	! t0_kref+0x1d50:   	subc	%l4, 0xc3a, %l6
	.word	0x11339e48	! t0_kref+0x1d54:   	sethi	%hi(0xce792000), %o0
	.word	0xd4270018	! t0_kref+0x1d58:   	st	%o2, [%i4 + %i0]
	.word	0x9de3bfa0	! t0_kref+0x1d5c:   	save	%sp, -0x60, %sp
	.word	0x99ee001d	! t0_kref+0x1d60:   	restore	%i0, %i5, %o4
	.word	0x8143e040	! t0_kref+0x1d64:   	membar	0x40
	.word	0x8db3872c	! t0_kref+0x1d68:   	fmuld8ulx16	%f14, %f12, %f6
	.word	0xd22e8018	! t0_kref+0x1d6c:   	stb	%o1, [%i2 + %i0]
	.word	0xda363fe8	! t0_kref+0x1d70:   	sth	%o5, [%i0 - 0x18]
	.word	0xb5a01909	! t0_kref+0x1d74:   	fitod	%f9, %f26
	.word	0x913c8009	! t0_kref+0x1d78:   	sra	%l2, %o1, %o0
	.word	0x9bb540ba	! t0_kref+0x1d7c:   	edge16n	%l5, %i2, %o5
	.word	0xac62bff9	! t0_kref+0x1d80:   	subc	%o2, -0x7, %l6
	.word	0x812a600d	! t0_kref+0x1d84:   	sll	%o1, 0xd, %g0
	.word	0xa9a0052b	! t0_kref+0x1d88:   	fsqrts	%f11, %f20
	.word	0x2f309776	! t0_kref+0x1d8c:   	sethi	%hi(0xc25dd800), %l7
	.word	0x98bb3b13	! t0_kref+0x1d90:   	xnorcc	%o4, -0x4ed, %o4
	.word	0xef68a080	! t0_kref+0x1d94:   	prefetch	%g2 + 0x80, 23
	.word	0xd01e2008	! t0_kref+0x1d98:   	ldd	[%i0 + 8], %o0
	.word	0xd44e2004	! t0_kref+0x1d9c:   	ldsb	[%i0 + 4], %o2
	.word	0x27480001	! t0_kref+0x1da0:   	fbul,a,pt	%fcc0, _kref+0x1da4
	.word	0x985de9e6	! t0_kref+0x1da4:   	smul	%l7, 0x9e6, %o4
	.word	0x3d800005	! t0_kref+0x1da8:   	fbule,a	_kref+0x1dbc
	.word	0xd7060000	! t0_kref+0x1dac:   	ld	[%i0], %f11
	.word	0x95b28486	! t0_kref+0x1db0:   	fcmple32	%f10, %f6, %o2
	.word	0x9e4568cf	! t0_kref+0x1db4:   	addc	%l5, 0x8cf, %o7
	.word	0xd6162002	! t0_kref+0x1db8:   	lduh	[%i0 + 2], %o3
	.word	0x9fb6811a	! t0_kref+0x1dbc:   	edge32	%i2, %i2, %o7
	.word	0xacfa6d16	! t0_kref+0x1dc0:   	sdivcc	%o1, 0xd16, %l6
	.word	0x9da01a5c	! t0_kref+0x1dc4:   	fdtoi	%f28, %f14
	.word	0x9e15800c	! t0_kref+0x1dc8:   	or	%l6, %o4, %o7
	.word	0xa5b20d10	! t0_kref+0x1dcc:   	fandnot1	%f8, %f16, %f18
	.word	0x9415b388	! t0_kref+0x1dd0:   	or	%l6, -0xc78, %o2
	.word	0xa5a488d8	! t0_kref+0x1dd4:   	fsubd	%f18, %f24, %f18
	.word	0xb5a000b5	! t0_kref+0x1dd8:   	fnegs	%f21, %f26
	.word	0xf1b81018	! t0_kref+0x1ddc:   	stda	%f24, [%g0 + %i0]0x80
	.word	0x96228016	! t0_kref+0x1de0:   	sub	%o2, %l6, %o3
	.word	0xee7e401c	! t0_kref+0x1de4:   	swap	[%i1 + %i4], %l7
	.word	0x27480006	! t0_kref+0x1de8:   	fbul,a,pt	%fcc0, _kref+0x1e00
	.word	0xae65b281	! t0_kref+0x1dec:   	subc	%l6, -0xd7f, %l7
	.word	0xd808a028	! t0_kref+0x1df0:   	ldub	[%g2 + 0x28], %o4
	.word	0xb7a0052d	! t0_kref+0x1df4:   	fsqrts	%f13, %f27
	.word	0x9fc10000	! t0_kref+0x1df8:   	call	%g4
	.word	0xec9e5000	! t0_kref+0x1dfc:   	ldda	[%i1]0x80, %l6
	.word	0x9fc00004	! t0_kref+0x1e00:   	call	%g0 + %g4
	.word	0xafb00f35	! t0_kref+0x1e04:   	fsrc2s	%f21, %f23
	.word	0xc568a006	! t0_kref+0x1e08:   	prefetch	%g2 + 6, 2
	.word	0x81abca29	! t0_kref+0x1e0c:   	fcmps	%fcc0, %f15, %f9
	.word	0xb3a0002e	! t0_kref+0x1e10:   	fmovs	%f14, %f25
	.word	0xd11fbf60	! t0_kref+0x1e14:   	ldd	[%fp - 0xa0], %f8
	.word	0xe9be1a1a	! t0_kref+0x1e18:   	stda	%f20, [%i0 + %i2]0xd0
	.word	0x8fb60d60	! t0_kref+0x1e1c:   	fnot1s	%f24, %f7
	.word	0x8db206f0	! t0_kref+0x1e20:   	fmul8ulx16	%f8, %f16, %f6
	.word	0xd2f6501d	! t0_kref+0x1e24:   	stxa	%o1, [%i1 + %i5]0x80
	.word	0xb9b14d60	! t0_kref+0x1e28:   	fnot1s	%f5, %f28
	.word	0x99b10acc	! t0_kref+0x1e2c:   	fpsub32	%f4, %f12, %f12
	.word	0xbba00030	! t0_kref+0x1e30:   	fmovs	%f16, %f29
	.word	0xe6680019	! t0_kref+0x1e34:   	ldstub	[%g0 + %i1], %l3
	.word	0x89b00fc0	! t0_kref+0x1e38:   	fone	%f4
	.word	0x952d000a	! t0_kref+0x1e3c:   	sll	%l4, %o2, %o2
	.word	0x96fb0016	! t0_kref+0x1e40:   	sdivcc	%o4, %l6, %o3
	.word	0x878020f0	! t0_kref+0x1e44:   	mov	0xf0, %asi
	.word	0x9072400b	! t0_kref+0x1e48:   	udiv	%o1, %o3, %o0
	.word	0xa1b10a16	! t0_kref+0x1e4c:   	fpadd16	%f4, %f22, %f16
	.word	0x9da308ca	! t0_kref+0x1e50:   	fsubd	%f12, %f10, %f14
	.word	0x21800004	! t0_kref+0x1e54:   	fbn,a	_kref+0x1e64
	.word	0x9a5cf058	! t0_kref+0x1e58:   	smul	%l3, -0xfa8, %o5
	.word	0x39480003	! t0_kref+0x1e5c:   	fbuge,a,pt	%fcc0, _kref+0x1e68
	.word	0x89a01886	! t0_kref+0x1e60:   	fitos	%f6, %f4
	.word	0x2b480007	! t0_kref+0x1e64:   	fbug,a,pt	%fcc0, _kref+0x1e80
	.word	0x9673678d	! t0_kref+0x1e68:   	udiv	%o5, 0x78d, %o3
	.word	0x9364a726	! t0_kref+0x1e6c:   	movle	%icc, -0xda, %o1
	.word	0xc04e6005	! t0_kref+0x1e70:   	ldsb	[%i1 + 5], %g0
	.word	0xb7a0052c	! t0_kref+0x1e74:   	fsqrts	%f12, %f27
	.word	0xadb4c31a	! t0_kref+0x1e78:   	alignaddr	%l3, %i2, %l6
	.word	0x89a488d8	! t0_kref+0x1e7c:   	fsubd	%f18, %f24, %f4
	.word	0x9605ba29	! t0_kref+0x1e80:   	add	%l6, -0x5d7, %o3
	.word	0xf4300019	! t0_kref+0x1e84:   	sth	%i2, [%g0 + %i1]
	.word	0xf93e3fe8	! t0_kref+0x1e88:   	std	%f28, [%i0 - 0x18]
	.word	0x9fc10000	! t0_kref+0x1e8c:   	call	%g4
	.word	0xda10a012	! t0_kref+0x1e90:   	lduh	[%g2 + 0x12], %o5
	.word	0xb1a28827	! t0_kref+0x1e94:   	fadds	%f10, %f7, %f24
	.word	0x80248009	! t0_kref+0x1e98:   	sub	%l2, %o1, %g0
	.word	0x1f1b6ab9	! t0_kref+0x1e9c:   	sethi	%hi(0x6daae400), %o7
	.word	0xb3b1cd60	! t0_kref+0x1ea0:   	fnot1s	%f7, %f25
	.word	0x9db58d16	! t0_kref+0x1ea4:   	fandnot1	%f22, %f22, %f14
	.word	0x96748016	! t0_kref+0x1ea8:   	udiv	%l2, %l6, %o3
	.word	0xec1e7fe8	! t0_kref+0x1eac:   	ldd	[%i1 - 0x18], %l6
	.word	0x32480002	! t0_kref+0x1eb0:   	bne,a,pt	%icc, _kref+0x1eb8
	.word	0xaefa734c	! t0_kref+0x1eb4:   	sdivcc	%o1, -0xcb4, %l7
	.word	0x9da508d0	! t0_kref+0x1eb8:   	fsubd	%f20, %f16, %f14
	.word	0xa5a589ce	! t0_kref+0x1ebc:   	fdivd	%f22, %f14, %f18
	.word	0x29800004	! t0_kref+0x1ec0:   	fbl,a	_kref+0x1ed0
	.word	0xa5a408c8	! t0_kref+0x1ec4:   	fsubd	%f16, %f8, %f18
	.word	0x21480008	! t0_kref+0x1ec8:   	fbn,a,pt	%fcc0, _kref+0x1ee8
	.word	0x990cc017	! t0_kref+0x1ecc:   	tsubcc	%l3, %l7, %o4
	.word	0x8db4c708	! t0_kref+0x1ed0:   	fmuld8sux16	%f19, %f8, %f6
	.word	0xcf200018	! t0_kref+0x1ed4:   	st	%f7, [%g0 + %i0]
	.word	0xc768a10a	! t0_kref+0x1ed8:   	prefetch	%g2 + 0x10a, 3
	.word	0xd036c019	! t0_kref+0x1edc:   	sth	%o0, [%i3 + %i1]
	.word	0xac228016	! t0_kref+0x1ee0:   	sub	%o2, %l6, %l6
	.word	0xd83e2018	! t0_kref+0x1ee4:   	std	%o4, [%i0 + 0x18]
	.word	0x35480004	! t0_kref+0x1ee8:   	fbue,a,pt	%fcc0, _kref+0x1ef8
	.word	0xacc68016	! t0_kref+0x1eec:   	addccc	%i2, %l6, %l6
	.word	0xafb007a6	! t0_kref+0x1ef0:   	fpackfix	%f6, %f23
	.word	0xef263fec	! t0_kref+0x1ef4:   	st	%f23, [%i0 - 0x14]
	.word	0x965d0012	! t0_kref+0x1ef8:   	smul	%l4, %l2, %o3
	.word	0xb5b1c6ab	! t0_kref+0x1efc:   	fmul8x16al	%f7, %f11, %f26
	.word	0xf300a008	! t0_kref+0x1f00:   	ld	[%g2 + 8], %f25
	.word	0xd91fbe38	! t0_kref+0x1f04:   	ldd	[%fp - 0x1c8], %f12
	.word	0x8fa01893	! t0_kref+0x1f08:   	fitos	%f19, %f7
	.word	0x81400000	! t0_kref+0x1f0c:   	mov	%y, %g0
	.word	0x9eb4bc9f	! t0_kref+0x1f10:   	orncc	%l2, -0x361, %o7
	.word	0xb9b40752	! t0_kref+0x1f14:   	fpack32	%f16, %f18, %f28
	.word	0x809572cd	! t0_kref+0x1f18:   	orcc	%l5, -0xd33, %g0
	.word	0x81dba56f	! t0_kref+0x1f1c:   	flush	%sp + 0x56f
	.word	0xec180019	! t0_kref+0x1f20:   	ldd	[%g0 + %i1], %l6
	.word	0x24480008	! t0_kref+0x1f24:   	ble,a,pt	%icc, _kref+0x1f44
	.word	0x91a00544	! t0_kref+0x1f28:   	fsqrtd	%f4, %f8
	.word	0x9a12b1ba	! t0_kref+0x1f2c:   	or	%o2, -0xe46, %o5
	.word	0x96534000	! t0_kref+0x1f30:   	umul	%o5, %g0, %o3
	.word	0xec00a018	! t0_kref+0x1f34:   	ld	[%g2 + 0x18], %l6
	.word	0xe8b81018	! t0_kref+0x1f38:   	stda	%l4, [%g0 + %i0]0x80
	.word	0xac03000d	! t0_kref+0x1f3c:   	add	%o4, %o5, %l6
	.word	0xd2270019	! t0_kref+0x1f40:   	st	%o1, [%i4 + %i1]
	.word	0x95b4c0f5	! t0_kref+0x1f44:   	edge16ln	%l3, %l5, %o2
	.word	0x948d4000	! t0_kref+0x1f48:   	andcc	%l5, %g0, %o2
	.word	0xd42e4000	! t0_kref+0x1f4c:   	stb	%o2, [%i1]
	.word	0xc398a040	! t0_kref+0x1f50:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xaf400000	! t0_kref+0x1f54:   	mov	%y, %l7
	.word	0xda36c019	! t0_kref+0x1f58:   	sth	%o5, [%i3 + %i1]
	.word	0x92036f4a	! t0_kref+0x1f5c:   	add	%o5, 0xf4a, %o1
	.word	0x9014c014	! t0_kref+0x1f60:   	or	%l3, %l4, %o0
	.word	0xf9be5a1a	! t0_kref+0x1f64:   	stda	%f28, [%i1 + %i2]0xd0
	.word	0x9fc10000	! t0_kref+0x1f68:   	call	%g4
	.word	0xc04e3ff7	! t0_kref+0x1f6c:   	ldsb	[%i0 - 9], %g0
	.word	0xd6fe101c	! t0_kref+0x1f70:   	swapa	[%i0 + %i4]0x80, %o3
	.word	0xeb68a102	! t0_kref+0x1f74:   	prefetch	%g2 + 0x102, 21
	.word	0x95a0052a	! t0_kref+0x1f78:   	fsqrts	%f10, %f10
	.word	0xac5d800d	! t0_kref+0x1f7c:   	smul	%l6, %o5, %l6
	.word	0xf11fbe18	! t0_kref+0x1f80:   	ldd	[%fp - 0x1e8], %f24
	.word	0x23480005	! t0_kref+0x1f84:   	fbne,a,pt	%fcc0, _kref+0x1f98
	.word	0x8143c000	! t0_kref+0x1f88:   	stbar
	.word	0xd48e9018	! t0_kref+0x1f8c:   	lduba	[%i2 + %i0]0x80, %o2
	.word	0xac96bec2	! t0_kref+0x1f90:   	orcc	%i2, -0x13e, %l6
	.word	0x91b34334	! t0_kref+0x1f94:   	bmask	%o5, %l4, %o0
	.word	0xad3da004	! t0_kref+0x1f98:   	sra	%l6, 0x4, %l6
	.word	0x9083000d	! t0_kref+0x1f9c:   	addcc	%o4, %o5, %o0
	.word	0xe168a105	! t0_kref+0x1fa0:   	prefetch	%g2 + 0x105, 16
	.word	0x2d480008	! t0_kref+0x1fa4:   	fbg,a,pt	%fcc0, _kref+0x1fc4
	.word	0xde50a002	! t0_kref+0x1fa8:   	ldsh	[%g2 + 2], %o7
	.word	0xa1b707c8	! t0_kref+0x1fac:   	pdist	%f28, %f8, %f16
	.word	0xd6881018	! t0_kref+0x1fb0:   	lduba	[%g0 + %i0]0x80, %o3
	.word	0x925eb2c4	! t0_kref+0x1fb4:   	smul	%i2, -0xd3c, %o1
	.word	0xd000a008	! t0_kref+0x1fb8:   	ld	[%g2 + 8], %o0
	.word	0x2d800007	! t0_kref+0x1fbc:   	fbg,a	_kref+0x1fd8
	.word	0x9ba0002c	! t0_kref+0x1fc0:   	fmovs	%f12, %f13
	.word	0x90f48014	! t0_kref+0x1fc4:   	udivcc	%l2, %l4, %o0
	.word	0x91b506e8	! t0_kref+0x1fc8:   	fmul8ulx16	%f20, %f8, %f8
	.word	0x21800004	! t0_kref+0x1fcc:   	fbn,a	_kref+0x1fdc
	.word	0x97150012	! t0_kref+0x1fd0:   	taddcctv	%l4, %l2, %o3
	.word	0x39800006	! t0_kref+0x1fd4:   	fbuge,a	_kref+0x1fec
	.word	0xda080018	! t0_kref+0x1fd8:   	ldub	[%g0 + %i0], %o5
	.word	0xd608a033	! t0_kref+0x1fdc:   	ldub	[%g2 + 0x33], %o3
	.word	0xe168a0c6	! t0_kref+0x1fe0:   	prefetch	%g2 + 0xc6, 16
	.word	0xd0bf5019	! t0_kref+0x1fe4:   	stda	%o0, [%i5 + %i1]0x80
	.word	0x9fb00770	! t0_kref+0x1fe8:   	fpack16	%f16, %f15
	.word	0x9024800b	! t0_kref+0x1fec:   	sub	%l2, %o3, %o0
	.word	0x94e260bf	! t0_kref+0x1ff0:   	subccc	%o1, 0xbf, %o2
	.word	0x89a0055c	! t0_kref+0x1ff4:   	fsqrtd	%f28, %f4
	.word	0x81ab0ad4	! t0_kref+0x1ff8:   	fcmped	%fcc0, %f12, %f20
	.word	0xee270019	! t0_kref+0x1ffc:   	st	%l7, [%i4 + %i1]
	call	SYM(t0_subr1)
	.word	0x8d85c015	! t0_kref+0x2004:   	wr	%l7, %l5, %fprs
	.word	0xee7e0000	! t0_kref+0x2008:   	swap	[%i0], %l7
	.word	0xd8163fe6	! t0_kref+0x200c:   	lduh	[%i0 - 0x1a], %o4
	.word	0xae048014	! t0_kref+0x2010:   	add	%l2, %l4, %l7
	.word	0xad400000	! t0_kref+0x2014:   	mov	%y, %l6
	.word	0x81a94ab2	! t0_kref+0x2018:   	fcmpes	%fcc0, %f5, %f18
	.word	0x909a2c52	! t0_kref+0x201c:   	xorcc	%o0, 0xc52, %o0
	.word	0xde063fe0	! t0_kref+0x2020:   	ld	[%i0 - 0x20], %o7
	.word	0xd51fbd20	! t0_kref+0x2024:   	ldd	[%fp - 0x2e0], %f10
	.word	0xf0003694	! t0_kref+0x2028:   	ld	[%g0 - 0x96c], %i0
	.word	0xcf00a010	! t0_kref+0x202c:   	ld	[%g2 + 0x10], %f7
	.word	0xb1b1cd34	! t0_kref+0x2030:   	fandnot1s	%f7, %f20, %f24
	.word	0x9ba3493a	! t0_kref+0x2034:   	fmuls	%f13, %f26, %f13
	.word	0xd1be188c	! t0_kref+0x2038:   	stda	%f8, [%i0 + %o4]0xc4
	.word	0x97b28caf	! t0_kref+0x203c:   	fandnot2s	%f10, %f15, %f11
	.word	0xa1b58e80	! t0_kref+0x2040:   	fsrc1	%f22, %f16
	.word	0x9fa00124	! t0_kref+0x2044:   	fabss	%f4, %f15
	.word	0xb4103fe7	! t0_kref+0x2048:   	mov	0xffffffe7, %i2
	sethi	%hi(2f), %o7
	.word	0xe40be090	! t0_kref+0x2050:   	ldub	[%o7 + 0x90], %l2
	.word	0xa41ca00c	! t0_kref+0x2054:   	xor	%l2, 0xc, %l2
	.word	0xe42be090	! t0_kref+0x2058:   	stb	%l2, [%o7 + 0x90]
	.word	0x81dbe090	! t0_kref+0x205c:   	flush	%o7 + 0x90
	.word	0xa5b50754	! t0_kref+0x2060:   	fpack32	%f20, %f20, %f18
	.word	0x8024800a	! t0_kref+0x2064:   	sub	%l2, %o2, %g0
	.word	0x80b24017	! t0_kref+0x2068:   	orncc	%o1, %l7, %g0
	.word	0x94fb001a	! t0_kref+0x206c:   	sdivcc	%o4, %i2, %o2
	.word	0x9052bcc9	! t0_kref+0x2070:   	umul	%o2, -0x337, %o0
	call	SYM(t0_subr3)
	.word	0x8fa01a4c	! t0_kref+0x2078:   	fdtoi	%f12, %f7
	.word	0x9735a017	! t0_kref+0x207c:   	srl	%l6, 0x17, %o3
	.word	0xd808a012	! t0_kref+0x2080:   	ldub	[%g2 + 0x12], %o4
	.word	0xad334000	! t0_kref+0x2084:   	srl	%o5, %g0, %l6
	.word	0x36480001	! t0_kref+0x2088:   	bge,a,pt	%icc, _kref+0x208c
	.word	0xd4d81019	! t0_kref+0x208c:   	ldxa	[%g0 + %i1]0x80, %o2
2:	.word	0xaf34c00c	! t0_kref+0x2090:   	srl	%l3, %o4, %l7
	.word	0x9fa60936	! t0_kref+0x2094:   	fmuls	%f24, %f22, %f15
	.word	0xa9a3c8bd	! t0_kref+0x2098:   	fsubs	%f15, %f29, %f20
	.word	0xd2467ff4	! t0_kref+0x209c:   	ldsw	[%i1 - 0xc], %o1
	.word	0x95b70ac8	! t0_kref+0x20a0:   	fpsub32	%f28, %f8, %f10
	.word	0xc04e4000	! t0_kref+0x20a4:   	ldsb	[%i1], %g0
	.word	0x96fac015	! t0_kref+0x20a8:   	sdivcc	%o3, %l5, %o3
	.word	0x9f400000	! t0_kref+0x20ac:   	mov	%y, %o7
	.word	0xe13f4018	! t0_kref+0x20b0:   	std	%f16, [%i5 + %i0]
	.word	0xd648a028	! t0_kref+0x20b4:   	ldsb	[%g2 + 0x28], %o3
	.word	0x3f480001	! t0_kref+0x20b8:   	fbo,a,pt	%fcc0, _kref+0x20bc
	.word	0x95a6cd27	! t0_kref+0x20bc:   	fsmuld	%f27, %f7, %f10
	.word	0x95400000	! t0_kref+0x20c0:   	mov	%y, %o2
	.word	0x973a601c	! t0_kref+0x20c4:   	sra	%o1, 0x1c, %o3
	.word	0xba103ff8	! t0_kref+0x20c8:   	mov	0xfffffff8, %i5
	.word	0xb5a00137	! t0_kref+0x20cc:   	fabss	%f23, %f26
	.word	0x972ac015	! t0_kref+0x20d0:   	sll	%o3, %l5, %o3
	.word	0x25480004	! t0_kref+0x20d4:   	fblg,a,pt	%fcc0, _kref+0x20e4
	.word	0x81580000	! t0_kref+0x20d8:   	flushw
	.word	0x9fa00031	! t0_kref+0x20dc:   	fmovs	%f17, %f15
	.word	0xe3b8a080	! t0_kref+0x20e0:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x9ac5000a	! t0_kref+0x20e4:   	addccc	%l4, %o2, %o5
	.word	0x9272b36e	! t0_kref+0x20e8:   	udiv	%o2, -0xc92, %o1
	.word	0x99b3406c	! t0_kref+0x20ec:   	edge8ln	%o5, %o4, %o4
	.word	0xee00a038	! t0_kref+0x20f0:   	ld	[%g2 + 0x38], %l7
	.word	0x81ac0a25	! t0_kref+0x20f4:   	fcmps	%fcc0, %f16, %f5
	.word	0xa7a0053c	! t0_kref+0x20f8:   	fsqrts	%f28, %f19
	.word	0xdf267ff4	! t0_kref+0x20fc:   	st	%f15, [%i1 - 0xc]
	.word	0x8015a83e	! t0_kref+0x2100:   	or	%l6, 0x83e, %g0
	.word	0xa9a2c826	! t0_kref+0x2104:   	fadds	%f11, %f6, %f20
	.word	0x813ae001	! t0_kref+0x2108:   	sra	%o3, 0x1, %g0
	.word	0x953a201c	! t0_kref+0x210c:   	sra	%o0, 0x1c, %o2
	.word	0xe500a038	! t0_kref+0x2110:   	ld	[%g2 + 0x38], %f18
	.word	0xd808a00a	! t0_kref+0x2114:   	ldub	[%g2 + 0xa], %o4
	.word	0xe3b8a080	! t0_kref+0x2118:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x91a18d38	! t0_kref+0x211c:   	fsmuld	%f6, %f24, %f8
	.word	0xec1e7fe8	! t0_kref+0x2120:   	ldd	[%i1 - 0x18], %l6
	.word	0xd8367fe2	! t0_kref+0x2124:   	sth	%o4, [%i1 - 0x1e]
	.word	0x81b01026	! t0_kref+0x2128:   	siam	0x6
	.word	0x9654c017	! t0_kref+0x212c:   	umul	%l3, %l7, %o3
	.word	0x91a18946	! t0_kref+0x2130:   	fmuld	%f6, %f6, %f8
	.word	0xc807bfe8	! t0_kref+0x2134:   	ld	[%fp - 0x18], %g4
	.word	0x91a0189d	! t0_kref+0x2138:   	fitos	%f29, %f8
	.word	0x99a3892d	! t0_kref+0x213c:   	fmuls	%f14, %f13, %f12
	.word	0xb5a00531	! t0_kref+0x2140:   	fsqrts	%f17, %f26
	.word	0x22800004	! t0_kref+0x2144:   	be,a	_kref+0x2154
	.word	0xda763ff0	! t0_kref+0x2148:   	stx	%o5, [%i0 - 0x10]
	.word	0x952a0017	! t0_kref+0x214c:   	sll	%o0, %l7, %o2
	.word	0x8ba01a44	! t0_kref+0x2150:   	fdtoi	%f4, %f5
	.word	0x9a8ca3cd	! t0_kref+0x2154:   	andcc	%l2, 0x3cd, %o5
	.word	0x8db60e52	! t0_kref+0x2158:   	fxnor	%f24, %f18, %f6
	.word	0x8db3c72e	! t0_kref+0x215c:   	fmuld8ulx16	%f15, %f14, %f6
	.word	0x9fb58017	! t0_kref+0x2160:   	edge8	%l6, %l7, %o7
	.word	0x928a4000	! t0_kref+0x2164:   	andcc	%o1, %g0, %o1
	.word	0xafb3408a	! t0_kref+0x2168:   	edge16	%o5, %o2, %l7
	.word	0xafb30134	! t0_kref+0x216c:   	edge32n	%o4, %l4, %l7
	.word	0xd42e401a	! t0_kref+0x2170:   	stb	%o2, [%i1 + %i2]
	.word	0x001fffff	! t0_kref+0x2174:   	illtrap	0x1fffff
	.word	0x81400000	! t0_kref+0x2178:   	mov	%y, %g0
	.word	0xacc2c013	! t0_kref+0x217c:   	addccc	%o3, %l3, %l6
	.word	0x39800008	! t0_kref+0x2180:   	fbuge,a	_kref+0x21a0
	.word	0x99b4c156	! t0_kref+0x2184:   	edge32l	%l3, %l6, %o4
	.word	0xa9a40839	! t0_kref+0x2188:   	fadds	%f16, %f25, %f20
	.word	0x8d82f7e3	! t0_kref+0x218c:   	wr	%o3, 0xfffff7e3, %fprs
	call	SYM(t0_subr1)
	.word	0x80127b54	! t0_kref+0x2194:   	or	%o1, -0x4ac, %g0
	.word	0xb1b007aa	! t0_kref+0x2198:   	fpackfix	%f10, %f24
	.word	0xe168a0c2	! t0_kref+0x219c:   	prefetch	%g2 + 0xc2, 16
	.word	0x86102004	! t0_kref+0x21a0:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x21a4:   	bne,a	_kref+0x21a4
	.word	0x86a0e001	! t0_kref+0x21a8:   	subcc	%g3, 1, %g3
	.word	0xcd000018	! t0_kref+0x21ac:   	ld	[%g0 + %i0], %f6
	.word	0xb1a189da	! t0_kref+0x21b0:   	fdivd	%f6, %f26, %f24
	.word	0x91b18550	! t0_kref+0x21b4:   	fcmpeq16	%f6, %f16, %o0
	.word	0xafb5c280	! t0_kref+0x21b8:   	array32	%l7, %g0, %l7
	.word	0xcd1e001d	! t0_kref+0x21bc:   	ldd	[%i0 + %i5], %f6
	.word	0xada00548	! t0_kref+0x21c0:   	fsqrtd	%f8, %f22
	.word	0xfdee501b	! t0_kref+0x21c4:   	prefetcha	%i1 + %i3, 30
	.word	0x29800004	! t0_kref+0x21c8:   	fbl,a	_kref+0x21d8
	.word	0x9f2d400c	! t0_kref+0x21cc:   	sll	%l5, %o4, %o7
	.word	0xcf063ff8	! t0_kref+0x21d0:   	ld	[%i0 - 8], %f7
	.word	0xecd65000	! t0_kref+0x21d4:   	ldsha	[%i1]0x80, %l6
	.word	0xe27e0000	! t0_kref+0x21d8:   	swap	[%i0], %l1
	.word	0xa1b38ad6	! t0_kref+0x21dc:   	fpsub32	%f14, %f22, %f16
	.word	0x89b00fc0	! t0_kref+0x21e0:   	fone	%f4
	call	SYM(t0_subr0)
	.word	0xf19e5a1c	! t0_kref+0x21e8:   	ldda	[%i1 + %i4]0xd0, %f24
	.word	0xde10a012	! t0_kref+0x21ec:   	lduh	[%g2 + 0x12], %o7
	.word	0x3d800007	! t0_kref+0x21f0:   	fbule,a	_kref+0x220c
	.word	0xd610a030	! t0_kref+0x21f4:   	lduh	[%g2 + 0x30], %o3
	.word	0xb9b00fc0	! t0_kref+0x21f8:   	fone	%f28
	.word	0xd4267fec	! t0_kref+0x21fc:   	st	%o2, [%i1 - 0x14]
	.word	0x8da01905	! t0_kref+0x2200:   	fitod	%f5, %f6
	.word	0xaef57457	! t0_kref+0x2204:   	udivcc	%l5, -0xba9, %l7
	.word	0xb1b70c54	! t0_kref+0x2208:   	fnor	%f28, %f20, %f24
	.word	0x151ffe02	! t0_kref+0x220c:   	sethi	%hi(0x7ff80800), %o2
	.word	0xd09e5000	! t0_kref+0x2210:   	ldda	[%i1]0x80, %o0
	.word	0x2d480008	! t0_kref+0x2214:   	fbg,a,pt	%fcc0, _kref+0x2234
	.word	0xd248a020	! t0_kref+0x2218:   	ldsb	[%g2 + 0x20], %o1
	.word	0x99b24200	! t0_kref+0x221c:   	array8	%o1, %g0, %o4
	.word	0x9160e703	! t0_kref+0x2220:   	movul	%fcc0, -0xfd, %o0
	.word	0x968df1fb	! t0_kref+0x2224:   	andcc	%l7, -0xe05, %o3
	.word	0xe168a0c1	! t0_kref+0x2228:   	prefetch	%g2 + 0xc1, 16
	.word	0xdade1000	! t0_kref+0x222c:   	ldxa	[%i0]0x80, %o5
	.word	0x21480003	! t0_kref+0x2230:   	fbn,a,pt	%fcc0, _kref+0x223c
	.word	0xda7f0019	! t0_kref+0x2234:   	swap	[%i4 + %i1], %o5
	.word	0xd048a038	! t0_kref+0x2238:   	ldsb	[%g2 + 0x38], %o0
	.word	0xde5e4000	! t0_kref+0x223c:   	ldx	[%i1], %o7
	.word	0x9ab2fa61	! t0_kref+0x2240:   	orncc	%o3, -0x59f, %o5
	.word	0x99a309ca	! t0_kref+0x2244:   	fdivd	%f12, %f10, %f12
	.word	0xeb067ff4	! t0_kref+0x2248:   	ld	[%i1 - 0xc], %f21
	.word	0x9305bec0	! t0_kref+0x224c:   	taddcc	%l6, -0x140, %o1
	.word	0x97a0002b	! t0_kref+0x2250:   	fmovs	%f11, %f11
	.word	0xd01e6008	! t0_kref+0x2254:   	ldd	[%i1 + 8], %o0
	.word	0x93400000	! t0_kref+0x2258:   	mov	%y, %o1
	.word	0xd00e6002	! t0_kref+0x225c:   	ldub	[%i1 + 2], %o0
	.word	0x98f3395d	! t0_kref+0x2260:   	udivcc	%o4, -0x6a3, %o4
	.word	0xe6e81018	! t0_kref+0x2264:   	ldstuba	[%g0 + %i0]0x80, %l3
	.word	0x9ba0003b	! t0_kref+0x2268:   	fmovs	%f27, %f13
	.word	0xc398a040	! t0_kref+0x226c:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xd1be5a1d	! t0_kref+0x2270:   	stda	%f8, [%i1 + %i5]0xd0
	.word	0xe3b8a080	! t0_kref+0x2274:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x92e2000a	! t0_kref+0x2278:   	subccc	%o0, %o2, %o1
	.word	0x9ad4e0a1	! t0_kref+0x227c:   	umulcc	%l3, 0xa1, %o5
	.word	0xdadf5018	! t0_kref+0x2280:   	ldxa	[%i5 + %i0]0x80, %o5
	.word	0x9204af25	! t0_kref+0x2284:   	add	%l2, 0xf25, %o1
	.word	0x96fd4015	! t0_kref+0x2288:   	sdivcc	%l5, %l5, %o3
	.word	0x81b50035	! t0_kref+0x228c:   	edge8n	%l4, %l5, %g0
	.word	0xe668a003	! t0_kref+0x2290:   	ldstub	[%g2 + 3], %l3
	.word	0x811b4013	! t0_kref+0x2294:   	tsubcctv	%o5, %l3, %g0
	.word	0x8db48d16	! t0_kref+0x2298:   	fandnot1	%f18, %f22, %f6
	.word	0xe5ee501c	! t0_kref+0x229c:   	prefetcha	%i1 + %i4, 18
	.word	0xd440a018	! t0_kref+0x22a0:   	ldsw	[%g2 + 0x18], %o2
	.word	0x9204a908	! t0_kref+0x22a4:   	add	%l2, 0x908, %o1
	.word	0xb5a00558	! t0_kref+0x22a8:   	fsqrtd	%f24, %f26
	.word	0xaba00527	! t0_kref+0x22ac:   	fsqrts	%f7, %f21
	.word	0x9eb00013	! t0_kref+0x22b0:   	orncc	%g0, %l3, %o7
	.word	0x30800002	! t0_kref+0x22b4:   	ba,a	_kref+0x22bc
	.word	0xb5a00032	! t0_kref+0x22b8:   	fmovs	%f18, %f26
	.word	0x8ba00037	! t0_kref+0x22bc:   	fmovs	%f23, %f5
	.word	0x99a108d0	! t0_kref+0x22c0:   	fsubd	%f4, %f16, %f12
	.word	0x3d480005	! t0_kref+0x22c4:   	fbule,a,pt	%fcc0, _kref+0x22d8
	.word	0xda467ff8	! t0_kref+0x22c8:   	ldsw	[%i1 - 8], %o5
	.word	0xea28a01a	! t0_kref+0x22cc:   	stb	%l5, [%g2 + 0x1a]
	.word	0xb1a3cd31	! t0_kref+0x22d0:   	fsmuld	%f15, %f17, %f24
	.word	0xb3a00529	! t0_kref+0x22d4:   	fsqrts	%f9, %f25
	.word	0xec10a03a	! t0_kref+0x22d8:   	lduh	[%g2 + 0x3a], %l6
	.word	0x96b52569	! t0_kref+0x22dc:   	orncc	%l4, 0x569, %o3
	.word	0x81aeca33	! t0_kref+0x22e0:   	fcmps	%fcc0, %f27, %f19
	.word	0xc398a040	! t0_kref+0x22e4:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xec1f4018	! t0_kref+0x22e8:   	ldd	[%i5 + %i0], %l6
	.word	0x90623a2e	! t0_kref+0x22ec:   	subc	%o0, -0x5d2, %o0
	.word	0x37800002	! t0_kref+0x22f0:   	fbge,a	_kref+0x22f8
	.word	0xbbb0076a	! t0_kref+0x22f4:   	fpack16	%f10, %f29
	.word	0x95a0188c	! t0_kref+0x22f8:   	fitos	%f12, %f10
	.word	0xd82e200e	! t0_kref+0x22fc:   	stb	%o4, [%i0 + 0xe]
	.word	0x9eb4c013	! t0_kref+0x2300:   	orncc	%l3, %l3, %o7
	.word	0x9fc10000	! t0_kref+0x2304:   	call	%g4
	.word	0xd42e200a	! t0_kref+0x2308:   	stb	%o2, [%i0 + 0xa]
	.word	0xa1a609b9	! t0_kref+0x230c:   	fdivs	%f24, %f25, %f16
	.word	0xe67e2018	! t0_kref+0x2310:   	swap	[%i0 + 0x18], %l3
	.word	0x191f7937	! t0_kref+0x2314:   	sethi	%hi(0x7de4dc00), %o4
	.word	0x27800005	! t0_kref+0x2318:   	fbul,a	_kref+0x232c
	.word	0x97a00029	! t0_kref+0x231c:   	fmovs	%f9, %f11
	.word	0x9b400000	! t0_kref+0x2320:   	mov	%y, %o5
	.word	0x97400000	! t0_kref+0x2324:   	mov	%y, %o3
	.word	0xb5a40d31	! t0_kref+0x2328:   	fsmuld	%f16, %f17, %f26
	.word	0x9908000c	! t0_kref+0x232c:   	tsubcc	%g0, %o4, %o4
	.word	0xd2080018	! t0_kref+0x2330:   	ldub	[%g0 + %i0], %o1
	call	SYM(t0_subr1)
	.word	0xe420a000	! t0_kref+0x2338:   	st	%l2, [%g2]
	.word	0x952a4017	! t0_kref+0x233c:   	sll	%o1, %l7, %o2
	.word	0xa9a00546	! t0_kref+0x2340:   	fsqrtd	%f6, %f20
	.word	0xe1be1813	! t0_kref+0x2344:   	stda	%f16, [%i0 + %l3]0xc0
	.word	0x86102001	! t0_kref+0x2348:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x234c:   	bne,a	_kref+0x234c
	.word	0x86a0e001	! t0_kref+0x2350:   	subcc	%g3, 1, %g3
	.word	0xa9b10a0c	! t0_kref+0x2354:   	fpadd16	%f4, %f12, %f20
	.word	0x91282019	! t0_kref+0x2358:   	sll	%g0, 0x19, %o0
	.word	0x8584a3f2	! t0_kref+0x235c:   	wr	%l2, 0x3f2, %ccr
	.word	0xa7a0189d	! t0_kref+0x2360:   	fitos	%f29, %f19
	.word	0x931336be	! t0_kref+0x2364:   	taddcctv	%o4, -0x942, %o1
	.word	0x90d53d52	! t0_kref+0x2368:   	umulcc	%l4, -0x2ae, %o0
	.word	0xd810a028	! t0_kref+0x236c:   	lduh	[%g2 + 0x28], %o4
	.word	0x8143e040	! t0_kref+0x2370:   	membar	0x40
	.word	0xec180019	! t0_kref+0x2374:   	ldd	[%g0 + %i1], %l6
	.word	0x81df37b9	! t0_kref+0x2378:   	flush	%i4 - 0x847
	.word	0xd610a00a	! t0_kref+0x237c:   	lduh	[%g2 + 0xa], %o3
	.word	0x95a0190d	! t0_kref+0x2380:   	fitod	%f13, %f10
	.word	0xf1be1808	! t0_kref+0x2384:   	stda	%f24, [%i0 + %o0]0xc0
	.word	0xa5a00546	! t0_kref+0x2388:   	fsqrtd	%f6, %f18
	.word	0xc0fe101c	! t0_kref+0x238c:   	swapa	[%i0 + %i4]0x80, %g0
	.word	0xadb500ad	! t0_kref+0x2390:   	edge16n	%l4, %o5, %l6
	.word	0xcd200019	! t0_kref+0x2394:   	st	%f6, [%g0 + %i1]
	.word	0xad223179	! t0_kref+0x2398:   	mulscc	%o0, -0xe87, %l6
	.word	0xb1b48d14	! t0_kref+0x239c:   	fandnot1	%f18, %f20, %f24
	.word	0x3f800003	! t0_kref+0x23a0:   	fbo,a	_kref+0x23ac
	.word	0xa3a000b5	! t0_kref+0x23a4:   	fnegs	%f21, %f17
	.word	0xa1a5cd34	! t0_kref+0x23a8:   	fsmuld	%f23, %f20, %f16
	.word	0xda08a018	! t0_kref+0x23ac:   	ldub	[%g2 + 0x18], %o5
	.word	0xede6500c	! t0_kref+0x23b0:   	casa	[%i1]0x80, %o4, %l6
	.word	0x968e800d	! t0_kref+0x23b4:   	andcc	%i2, %o5, %o3
	.word	0x9e5b0008	! t0_kref+0x23b8:   	smul	%o4, %o0, %o7
	.word	0x93b00cef	! t0_kref+0x23bc:   	fnot2s	%f15, %f9
	.word	0x90ba400b	! t0_kref+0x23c0:   	xnorcc	%o1, %o3, %o0
	.word	0x9afd4015	! t0_kref+0x23c4:   	sdivcc	%l5, %l5, %o5
	.word	0xad30200b	! t0_kref+0x23c8:   	srl	%g0, 0xb, %l6
	.word	0x812de00b	! t0_kref+0x23cc:   	sll	%l7, 0xb, %g0
	.word	0xae030012	! t0_kref+0x23d0:   	add	%o4, %l2, %l7
	.word	0x93b484ca	! t0_kref+0x23d4:   	fcmpne32	%f18, %f10, %o1
	.word	0x95a3882c	! t0_kref+0x23d8:   	fadds	%f14, %f12, %f10
	.word	0xd19f5058	! t0_kref+0x23dc:   	ldda	[%i5 + %i0]0x82, %f8
	.word	0xd8163fe8	! t0_kref+0x23e0:   	lduh	[%i0 - 0x18], %o4
	.word	0x86102019	! t0_kref+0x23e4:   	mov	0x19, %g3
	.word	0x86a0e001	! t0_kref+0x23e8:   	subcc	%g3, 1, %g3
	.word	0x2280000b	! t0_kref+0x23ec:   	be,a	_kref+0x2418
	.word	0xd51fbe28	! t0_kref+0x23f0:   	ldd	[%fp - 0x1d8], %f10
	.word	0xde16c018	! t0_kref+0x23f4:   	lduh	[%i3 + %i0], %o7
	.word	0x91b70c44	! t0_kref+0x23f8:   	fnor	%f28, %f4, %f8
	.word	0x9a003161	! t0_kref+0x23fc:   	add	%g0, -0xe9f, %o5
	.word	0x969a33f0	! t0_kref+0x2400:   	xorcc	%o0, -0xc10, %o3
	.word	0x8da109c6	! t0_kref+0x2404:   	fdivd	%f4, %f6, %f6
	.word	0xc398a080	! t0_kref+0x2408:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0x9db38dca	! t0_kref+0x240c:   	fnand	%f14, %f10, %f14
	.word	0xd4e81018	! t0_kref+0x2410:   	ldstuba	[%g0 + %i0]0x80, %o2
	.word	0x39bffff5	! t0_kref+0x2414:   	fbuge,a	_kref+0x23e8
	.word	0xada00548	! t0_kref+0x2418:   	fsqrtd	%f8, %f22
	.word	0x9ab030c2	! t0_kref+0x241c:   	orncc	%g0, -0xf3e, %o5
	.word	0xaf400000	! t0_kref+0x2420:   	mov	%y, %l7
	.word	0xb1b68e5c	! t0_kref+0x2424:   	fxnor	%f26, %f28, %f24
	.word	0xa5a00556	! t0_kref+0x2428:   	fsqrtd	%f22, %f18
	call	SYM(t0_subr0)
	.word	0xe7a71019	! t0_kref+0x2430:   	sta	%f19, [%i4 + %i1]0x80
	.word	0xa3a0002a	! t0_kref+0x2434:   	fmovs	%f10, %f17
	.word	0x36480007	! t0_kref+0x2438:   	bge,a,pt	%icc, _kref+0x2454
	.word	0xa9b68d06	! t0_kref+0x243c:   	fandnot1	%f26, %f6, %f20
	.word	0xe5e65009	! t0_kref+0x2440:   	casa	[%i1]0x80, %o1, %l2
	.word	0xd240a038	! t0_kref+0x2444:   	ldsw	[%g2 + 0x38], %o1
	.word	0xacc5728a	! t0_kref+0x2448:   	addccc	%l5, -0xd76, %l6
	.word	0xe168a0cd	! t0_kref+0x244c:   	prefetch	%g2 + 0xcd, 16
	.word	0xe836201a	! t0_kref+0x2450:   	sth	%l4, [%i0 + 0x1a]
	.word	0x3a800008	! t0_kref+0x2454:   	bcc,a	_kref+0x2474
	.word	0xc398a080	! t0_kref+0x2458:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0xaeb24009	! t0_kref+0x245c:   	orncc	%o1, %o1, %l7
	.word	0xd40e3fe7	! t0_kref+0x2460:   	ldub	[%i0 - 0x19], %o2
	.word	0xac76800a	! t0_kref+0x2464:   	udiv	%i2, %o2, %l6
	.word	0x96beb5a5	! t0_kref+0x2468:   	xnorcc	%i2, -0xa5b, %o3
	.word	0x3c800008	! t0_kref+0x246c:   	bpos,a	_kref+0x248c
	.word	0xe100a038	! t0_kref+0x2470:   	ld	[%g2 + 0x38], %f16
	.word	0xe91fbde0	! t0_kref+0x2474:   	ldd	[%fp - 0x220], %f20
	.word	0xae22e165	! t0_kref+0x2478:   	sub	%o3, 0x165, %l7
	.word	0x9a74efdb	! t0_kref+0x247c:   	udiv	%l3, 0xfdb, %o5
	.word	0xb9a3c82b	! t0_kref+0x2480:   	fadds	%f15, %f11, %f28
	.word	0xd800a018	! t0_kref+0x2484:   	ld	[%g2 + 0x18], %o4
	.word	0xe9ee101d	! t0_kref+0x2488:   	prefetcha	%i0 + %i5, 20
	.word	0xd2100018	! t0_kref+0x248c:   	lduh	[%g0 + %i0], %o1
	.word	0x9875c015	! t0_kref+0x2490:   	udiv	%l7, %l5, %o4
	.word	0x30480007	! t0_kref+0x2494:   	ba,a,pt	%icc, _kref+0x24b0
	.word	0xb5b30cb6	! t0_kref+0x2498:   	fandnot2s	%f12, %f22, %f26
	.word	0x27480004	! t0_kref+0x249c:   	fbul,a,pt	%fcc0, _kref+0x24ac
	.word	0xd430a000	! t0_kref+0x24a0:   	sth	%o2, [%g2]
	.word	0xef070018	! t0_kref+0x24a4:   	ld	[%i4 + %i0], %f23
	.word	0xd85e7fe0	! t0_kref+0x24a8:   	ldx	[%i1 - 0x20], %o4
	.word	0xada5c8b6	! t0_kref+0x24ac:   	fsubs	%f23, %f22, %f22
	.word	0x9536a00c	! t0_kref+0x24b0:   	srl	%i2, 0xc, %o2
	.word	0x97a00124	! t0_kref+0x24b4:   	fabss	%f4, %f11
	.word	0x91b6800a	! t0_kref+0x24b8:   	edge8	%i2, %o2, %o0
	.word	0xe11fbf18	! t0_kref+0x24bc:   	ldd	[%fp - 0xe8], %f16
	.word	0x95a3882d	! t0_kref+0x24c0:   	fadds	%f14, %f13, %f10
	.word	0x9de3bfa0	! t0_kref+0x24c4:   	save	%sp, -0x60, %sp
	.word	0xadef3903	! t0_kref+0x24c8:   	restore	%i4, -0x6fd, %l6
	.word	0xd51fbc30	! t0_kref+0x24cc:   	ldd	[%fp - 0x3d0], %f10
	.word	0x95a488cc	! t0_kref+0x24d0:   	fsubd	%f18, %f12, %f10
	.word	0x36800008	! t0_kref+0x24d4:   	bge,a	_kref+0x24f4
	.word	0xe1bf5a19	! t0_kref+0x24d8:   	stda	%f16, [%i5 + %i1]0xd0
	.word	0xde10a038	! t0_kref+0x24dc:   	lduh	[%g2 + 0x38], %o7
	.word	0xc16e6008	! t0_kref+0x24e0:   	prefetch	%i1 + 8, 0
	.word	0x80b221ff	! t0_kref+0x24e4:   	orncc	%o0, 0x1ff, %g0
	.word	0xd51fbd38	! t0_kref+0x24e8:   	ldd	[%fp - 0x2c8], %f10
	.word	0x932ae012	! t0_kref+0x24ec:   	sll	%o3, 0x12, %o1
	.word	0x37800007	! t0_kref+0x24f0:   	fbge,a	_kref+0x250c
	.word	0x967266be	! t0_kref+0x24f4:   	udiv	%o1, 0x6be, %o3
	.word	0x9fc00004	! t0_kref+0x24f8:   	call	%g0 + %g4
	.word	0x972d2013	! t0_kref+0x24fc:   	sll	%l4, 0x13, %o3
	.word	0x3b480004	! t0_kref+0x2500:   	fble,a,pt	%fcc0, _kref+0x2510
	.word	0x91b68009	! t0_kref+0x2504:   	edge8	%i2, %o1, %o0
	.word	0x95b2010a	! t0_kref+0x2508:   	edge32	%o0, %o2, %o2
	.word	0x99b30037	! t0_kref+0x250c:   	edge8n	%o4, %l7, %o4
	.word	0xc040a010	! t0_kref+0x2510:   	ldsw	[%g2 + 0x10], %g0
	.word	0xac45400c	! t0_kref+0x2514:   	addc	%l5, %o4, %l6
	.word	0xa5a00538	! t0_kref+0x2518:   	fsqrts	%f24, %f18
	.word	0xd01e6000	! t0_kref+0x251c:   	ldd	[%i1], %o0
	.word	0xa7a000a9	! t0_kref+0x2520:   	fnegs	%f9, %f19
	.word	0x8da0190a	! t0_kref+0x2524:   	fitod	%f10, %f6
	.word	0x952de01b	! t0_kref+0x2528:   	sll	%l7, 0x1b, %o2
	.word	0x99408000	! t0_kref+0x252c:   	mov	%ccr, %o4
	.word	0x913b201f	! t0_kref+0x2530:   	sra	%o4, 0x1f, %o0
	.word	0x31480002	! t0_kref+0x2534:   	fba,a,pt	%fcc0, _kref+0x253c
	.word	0xeb68a101	! t0_kref+0x2538:   	prefetch	%g2 + 0x101, 21
	.word	0xb7b6cf67	! t0_kref+0x253c:   	fornot1s	%f27, %f7, %f27
	.word	0x9892b4be	! t0_kref+0x2540:   	orcc	%o2, -0xb42, %o4
	.word	0xf5267ffc	! t0_kref+0x2544:   	st	%f26, [%i1 - 4]
	.word	0xe168a080	! t0_kref+0x2548:   	prefetch	%g2 + 0x80, 16
	.word	0xd120a000	! t0_kref+0x254c:   	st	%f8, [%g2]
	.word	0xa1b38f9c	! t0_kref+0x2550:   	for	%f14, %f28, %f16
	.word	0x92158017	! t0_kref+0x2554:   	or	%l6, %l7, %o1
	.word	0x992b6003	! t0_kref+0x2558:   	sll	%o5, 0x3, %o4
	.word	0xc900a028	! t0_kref+0x255c:   	ld	[%g2 + 0x28], %f4
	.word	0xd616001b	! t0_kref+0x2560:   	lduh	[%i0 + %i3], %o3
	.word	0xada00550	! t0_kref+0x2564:   	fsqrtd	%f16, %f22
	.word	0xa9a0054e	! t0_kref+0x2568:   	fsqrtd	%f14, %f20
	.word	0x813a4009	! t0_kref+0x256c:   	sra	%o1, %o1, %g0
	.word	0xaf408000	! t0_kref+0x2570:   	mov	%ccr, %l7
	.word	0xd100a010	! t0_kref+0x2574:   	ld	[%g2 + 0x10], %f8
	.word	0xd01e7fe0	! t0_kref+0x2578:   	ldd	[%i1 - 0x20], %o0
	.word	0x9e15a548	! t0_kref+0x257c:   	or	%l6, 0x548, %o7
	.word	0x012950ec	! t0_kref+0x2580:   	sethi	%hi(0xa543b000), %g0
	.word	0xa7a70834	! t0_kref+0x2584:   	fadds	%f28, %f20, %f19
	.word	0xd83e2000	! t0_kref+0x2588:   	std	%o4, [%i0]
	.word	0xa5a58854	! t0_kref+0x258c:   	faddd	%f22, %f20, %f18
	.word	0xe5000019	! t0_kref+0x2590:   	ld	[%g0 + %i1], %f18
	.word	0x8610200b	! t0_kref+0x2594:   	mov	0xb, %g3
	.word	0x86a0e001	! t0_kref+0x2598:   	subcc	%g3, 1, %g3
	.word	0x22800008	! t0_kref+0x259c:   	be,a	_kref+0x25bc
	.word	0xa9b28f52	! t0_kref+0x25a0:   	fornot1	%f10, %f18, %f20
	.word	0xa5b009b5	! t0_kref+0x25a4:   	fexpand	%f21, %f18
	.word	0x89a01890	! t0_kref+0x25a8:   	fitos	%f16, %f4
	.word	0xa5a0190a	! t0_kref+0x25ac:   	fitod	%f10, %f18
	.word	0x9db00fc0	! t0_kref+0x25b0:   	fone	%f14
	.word	0x8052000d	! t0_kref+0x25b4:   	umul	%o0, %o5, %g0
	.word	0x8da2092d	! t0_kref+0x25b8:   	fmuls	%f8, %f13, %f6
	.word	0xb3a48838	! t0_kref+0x25bc:   	fadds	%f18, %f24, %f25
	call	SYM(t0_subr2)
	.word	0x9805f096	! t0_kref+0x25c4:   	add	%l7, -0xf6a, %o4
	.word	0x91a10d3b	! t0_kref+0x25c8:   	fsmuld	%f4, %f27, %f8
	.word	0x33800004	! t0_kref+0x25cc:   	fbe,a	_kref+0x25dc
	.word	0xb1a3c83c	! t0_kref+0x25d0:   	fadds	%f15, %f28, %f24
	.word	0xb7a0052d	! t0_kref+0x25d4:   	fsqrts	%f13, %f27
	.word	0x35480002	! t0_kref+0x25d8:   	fbue,a,pt	%fcc0, _kref+0x25e0
	.word	0xd43e6018	! t0_kref+0x25dc:   	std	%o2, [%i1 + 0x18]
	.word	0xb5a000b1	! t0_kref+0x25e0:   	fnegs	%f17, %f26
	.word	0x9a06a148	! t0_kref+0x25e4:   	add	%i2, 0x148, %o5
	.word	0xb9a00536	! t0_kref+0x25e8:   	fsqrts	%f22, %f28
	.word	0xc0d6d059	! t0_kref+0x25ec:   	ldsha	[%i3 + %i1]0x82, %g0
	.word	0xae5b000a	! t0_kref+0x25f0:   	smul	%o4, %o2, %l7
	.word	0x98248008	! t0_kref+0x25f4:   	sub	%l2, %o0, %o4
	.word	0xe3b8a040	! t0_kref+0x25f8:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x2f2c25cb	! t0_kref+0x25fc:   	sethi	%hi(0xb0972c00), %l7
	.word	0x1f2e1569	! t0_kref+0x2600:   	sethi	%hi(0xb855a400), %o7
	.word	0xeeee501a	! t0_kref+0x2604:   	ldstuba	[%i1 + %i2]0x80, %l7
	.word	0x80b378c2	! t0_kref+0x2608:   	orncc	%o5, -0x73e, %g0
	.word	0x8db3071d	! t0_kref+0x260c:   	fmuld8sux16	%f12, %f29, %f6
	.word	0xb5b009af	! t0_kref+0x2610:   	fexpand	%f15, %f26
	.word	0x9f400000	! t0_kref+0x2614:   	mov	%y, %o7
	.word	0xd0de1000	! t0_kref+0x2618:   	ldxa	[%i0]0x80, %o0
	.word	0xa9a64827	! t0_kref+0x261c:   	fadds	%f25, %f7, %f20
	.word	0x3f480008	! t0_kref+0x2620:   	fbo,a,pt	%fcc0, _kref+0x2640
	.word	0xd87f0018	! t0_kref+0x2624:   	swap	[%i4 + %i0], %o4
	.word	0x28480003	! t0_kref+0x2628:   	bleu,a,pt	%icc, _kref+0x2634
	.word	0xc040a000	! t0_kref+0x262c:   	ldsw	[%g2], %g0
	.word	0xb1a60836	! t0_kref+0x2630:   	fadds	%f24, %f22, %f24
	.word	0xc398a080	! t0_kref+0x2634:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0x95a01918	! t0_kref+0x2638:   	fitod	%f24, %f10
	.word	0xb7a01889	! t0_kref+0x263c:   	fitos	%f9, %f27
	.word	0x93400000	! t0_kref+0x2640:   	mov	%y, %o1
	.word	0x89a0054a	! t0_kref+0x2644:   	fsqrtd	%f10, %f4
	.word	0xde06401c	! t0_kref+0x2648:   	ld	[%i1 + %i4], %o7
	.word	0x98268012	! t0_kref+0x264c:   	sub	%i2, %l2, %o4
	.word	0xd210a002	! t0_kref+0x2650:   	lduh	[%g2 + 2], %o1
	.word	0xad400000	! t0_kref+0x2654:   	mov	%y, %l6
	.word	0xb1a00137	! t0_kref+0x2658:   	fabss	%f23, %f24
	sethi	%hi(2f), %o7
	.word	0xe40be278	! t0_kref+0x2660:   	ldub	[%o7 + 0x278], %l2
	.word	0xa41ca00c	! t0_kref+0x2664:   	xor	%l2, 0xc, %l2
	.word	0xe42be278	! t0_kref+0x2668:   	stb	%l2, [%o7 + 0x278]
	.word	0x81dbe278	! t0_kref+0x266c:   	flush	%o7 + 0x278
	.word	0x30480006	! t0_kref+0x2670:   	ba,a,pt	%icc, _kref+0x2688
	.word	0x9530200a	! t0_kref+0x2674:   	srl	%g0, 0xa, %o2
2:	.word	0x95b28acc	! t0_kref+0x2678:   	fpsub32	%f10, %f12, %f10
	.word	0x93b4c337	! t0_kref+0x267c:   	bmask	%l3, %l7, %o1
	.word	0x95a00526	! t0_kref+0x2680:   	fsqrts	%f6, %f10
	.word	0x80fac00c	! t0_kref+0x2684:   	sdivcc	%o3, %o4, %g0
	.word	0xc02e4000	! t0_kref+0x2688:   	clrb	[%i1]
	.word	0xc028a01b	! t0_kref+0x268c:   	clrb	[%g2 + 0x1b]
	.word	0x9a04ebf7	! t0_kref+0x2690:   	add	%l3, 0xbf7, %o5
	.word	0x23480007	! t0_kref+0x2694:   	fbne,a,pt	%fcc0, _kref+0x26b0
	.word	0xa1a00533	! t0_kref+0x2698:   	fsqrts	%f19, %f16
	.word	0x3b800001	! t0_kref+0x269c:   	fble,a	_kref+0x26a0
	.word	0xda364000	! t0_kref+0x26a0:   	sth	%o5, [%i1]
	.word	0x151fc15d	! t0_kref+0x26a4:   	sethi	%hi(0x7f057400), %o2
	.word	0x9003000b	! t0_kref+0x26a8:   	add	%o4, %o3, %o0
	.word	0xee063fe8	! t0_kref+0x26ac:   	ld	[%i0 - 0x18], %l7
	.word	0xd05e401d	! t0_kref+0x26b0:   	ldx	[%i1 + %i5], %o0
	.word	0xa5b28a4c	! t0_kref+0x26b4:   	fpadd32	%f10, %f12, %f18
	.word	0x19360e15	! t0_kref+0x26b8:   	sethi	%hi(0xd8385400), %o4
	.word	0xe8280018	! t0_kref+0x26bc:   	stb	%l4, [%g0 + %i0]
	.word	0xa3a00535	! t0_kref+0x26c0:   	fsqrts	%f21, %f17
	.word	0x99a01910	! t0_kref+0x26c4:   	fitod	%f16, %f12
	.word	0x9214c008	! t0_kref+0x26c8:   	or	%l3, %o0, %o1
	.word	0x982dbcfe	! t0_kref+0x26cc:   	andn	%l6, -0x302, %o4
	.word	0xb5c70005	! t0_kref+0x26d0:   	jmpl	%i4 + %g5, %i2
	.word	0xc0267ff8	! t0_kref+0x26d4:   	clr	[%i1 - 8]
	.word	0xd4300018	! t0_kref+0x26d8:   	sth	%o2, [%g0 + %i0]
	.word	0x96f3619e	! t0_kref+0x26dc:   	udivcc	%o5, 0x19e, %o3
	.word	0x99a00548	! t0_kref+0x26e0:   	fsqrtd	%f8, %f12
	.word	0xd40e4000	! t0_kref+0x26e4:   	ldub	[%i1], %o2
	.word	0x86102003	! t0_kref+0x26e8:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x26ec:   	bne,a	_kref+0x26ec
	.word	0x86a0e001	! t0_kref+0x26f0:   	subcc	%g3, 1, %g3
	.word	0x9de3bfa0	! t0_kref+0x26f4:   	save	%sp, -0x60, %sp
	.word	0xb027382e	! t0_kref+0x26f8:   	sub	%i4, -0x7d2, %i0
	.word	0x91eec01d	! t0_kref+0x26fc:   	restore	%i3, %i5, %o0
	.word	0xa1a01a52	! t0_kref+0x2700:   	fdtoi	%f18, %f16
	.word	0x97400000	! t0_kref+0x2704:   	mov	%y, %o3
	.word	0x8583000a	! t0_kref+0x2708:   	wr	%o4, %o2, %ccr
	.word	0xd036601a	! t0_kref+0x270c:   	sth	%o0, [%i1 + 0x1a]
	.word	0xe3b8a040	! t0_kref+0x2710:   	stda	%f48, [%g2 + 0x40]%asi
	call	SYM(t0_subr0)
	.word	0xa1b58148	! t0_kref+0x2718:   	edge32l	%l6, %o0, %l0
	.word	0x99b4058a	! t0_kref+0x271c:   	fcmpgt32	%f16, %f10, %o4
	.word	0xe826600c	! t0_kref+0x2720:   	st	%l4, [%i1 + 0xc]
	.word	0x985a8014	! t0_kref+0x2724:   	smul	%o2, %l4, %o4
	.word	0xda367ff4	! t0_kref+0x2728:   	sth	%o5, [%i1 - 0xc]
	.word	0xe3b8a040	! t0_kref+0x272c:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xa1a60d3a	! t0_kref+0x2730:   	fsmuld	%f24, %f26, %f16
	.word	0x25800002	! t0_kref+0x2734:   	fblg,a	_kref+0x273c
	.word	0xe4ee101a	! t0_kref+0x2738:   	ldstuba	[%i0 + %i2]0x80, %l2
	.word	0x8db00c00	! t0_kref+0x273c:   	fzero	%f6
	.word	0xad3d0008	! t0_kref+0x2740:   	sra	%l4, %o0, %l6
	.word	0xe3070019	! t0_kref+0x2744:   	ld	[%i4 + %i1], %f17
	.word	0x81ac0ace	! t0_kref+0x2748:   	fcmped	%fcc0, %f16, %f14
	.word	0x87802080	! t0_kref+0x274c:   	mov	0x80, %asi
	.word	0x23800004	! t0_kref+0x2750:   	fbne,a	_kref+0x2760
	.word	0xb6103fea	! t0_kref+0x2754:   	mov	0xffffffea, %i3
	.word	0xc12e600c	! t0_kref+0x2758:   	st	%fsr, [%i1 + 0xc]
	.word	0x99a408d2	! t0_kref+0x275c:   	fsubd	%f16, %f18, %f12
	.word	0xd4163fea	! t0_kref+0x2760:   	lduh	[%i0 - 0x16], %o2
	.word	0x8da208c6	! t0_kref+0x2764:   	fsubd	%f8, %f6, %f6
	.word	0xa1b00cce	! t0_kref+0x2768:   	fnot2	%f14, %f16
	.word	0x81a9caa6	! t0_kref+0x276c:   	fcmpes	%fcc0, %f7, %f6
	.word	0xa785ad62	! t0_kref+0x2770:   	wr	%l6, 0xd62, %gsr
	.word	0xde0e3ff8	! t0_kref+0x2774:   	ldub	[%i0 - 8], %o7
	.word	0xec2e3ff5	! t0_kref+0x2778:   	stb	%l6, [%i0 - 0xb]
	.word	0x9de3bfa0	! t0_kref+0x277c:   	save	%sp, -0x60, %sp
	.word	0x81e83c48	! t0_kref+0x2780:   	restore	%g0, -0x3b8, %g0
	.word	0x9484fba7	! t0_kref+0x2784:   	addcc	%l3, -0x459, %o2
	.word	0xf7ee501c	! t0_kref+0x2788:   	prefetcha	%i1 + %i4, 27
	.word	0xd4d67ff4	! t0_kref+0x278c:   	ldsha	[%i1 - 0xc]%asi, %o2
	.word	0x9fc00004	! t0_kref+0x2790:   	call	%g0 + %g4
	.word	0x013170ab	! t0_kref+0x2794:   	sethi	%hi(0xc5c2ac00), %g0
	.word	0x9b082195	! t0_kref+0x2798:   	tsubcc	%g0, 0x195, %o5
	.word	0x37800006	! t0_kref+0x279c:   	fbge,a	_kref+0x27b4
	.word	0x8da509dc	! t0_kref+0x27a0:   	fdivd	%f20, %f28, %f6
	.word	0x945d400d	! t0_kref+0x27a4:   	smul	%l5, %o5, %o2
	.word	0x98753b3b	! t0_kref+0x27a8:   	udiv	%l4, -0x4c5, %o4
	.word	0x95400000	! t0_kref+0x27ac:   	mov	%y, %o2
	.word	0x9db50a70	! t0_kref+0x27b0:   	fpadd32s	%f20, %f16, %f14
	.word	0xb5a00544	! t0_kref+0x27b4:   	fsqrtd	%f4, %f26
	.word	0x8ba000b6	! t0_kref+0x27b8:   	fnegs	%f22, %f5
	.word	0x81868000	! t0_kref+0x27bc:   	wr	%i2, %g0, %y
	.word	0x94c5c00d	! t0_kref+0x27c0:   	addccc	%l7, %o5, %o2
	.word	0xbba4082a	! t0_kref+0x27c4:   	fadds	%f16, %f10, %f29
	.word	0x9da48d35	! t0_kref+0x27c8:   	fsmuld	%f18, %f21, %f14
	.word	0xd67e6010	! t0_kref+0x27cc:   	swap	[%i1 + 0x10], %o3
	.word	0xb5a00548	! t0_kref+0x27d0:   	fsqrtd	%f8, %f26
	.word	0x97a70828	! t0_kref+0x27d4:   	fadds	%f28, %f8, %f11
	.word	0x81af0acc	! t0_kref+0x27d8:   	fcmped	%fcc0, %f28, %f12
	.word	0x8da00558	! t0_kref+0x27dc:   	fsqrtd	%f24, %f6
	.word	0xd2871018	! t0_kref+0x27e0:   	lda	[%i4 + %i0]0x80, %o1
	.word	0x9de3bfa0	! t0_kref+0x27e4:   	save	%sp, -0x60, %sp
	.word	0x97ee801a	! t0_kref+0x27e8:   	restore	%i2, %i2, %o3
	.word	0xee90a00a	! t0_kref+0x27ec:   	lduha	[%g2 + 0xa]%asi, %l7
	.word	0xa1b3c6aa	! t0_kref+0x27f0:   	fmul8x16al	%f15, %f10, %f16
	.word	0x25800005	! t0_kref+0x27f4:   	fblg,a	_kref+0x2808
	.word	0xd03e0000	! t0_kref+0x27f8:   	std	%o0, [%i0]
	.word	0x9fc00004	! t0_kref+0x27fc:   	call	%g0 + %g4
	.word	0xc010a000	! t0_kref+0x2800:   	lduh	[%g2], %g0
	.word	0xb5a18850	! t0_kref+0x2804:   	faddd	%f6, %f16, %f26
	.word	0x9485f690	! t0_kref+0x2808:   	addcc	%l7, -0x970, %o2
	.word	0x87802082	! t0_kref+0x280c:   	mov	0x82, %asi
	.word	0xe6200019	! t0_kref+0x2810:   	st	%l3, [%g0 + %i1]
	.word	0xee362006	! t0_kref+0x2814:   	sth	%l7, [%i0 + 6]
	.word	0x8da1085c	! t0_kref+0x2818:   	faddd	%f4, %f28, %f6
	.word	0x8ba00131	! t0_kref+0x281c:   	fabss	%f17, %f5
	.word	0xec580018	! t0_kref+0x2820:   	ldx	[%g0 + %i0], %l6
	.word	0x95a3884a	! t0_kref+0x2824:   	faddd	%f14, %f10, %f10
	.word	0x94454009	! t0_kref+0x2828:   	addc	%l5, %o1, %o2
	.word	0xafa018c8	! t0_kref+0x282c:   	fdtos	%f8, %f23
	.word	0x2e480002	! t0_kref+0x2830:   	bvs,a,pt	%icc, _kref+0x2838
	.word	0x1b2d73c8	! t0_kref+0x2834:   	sethi	%hi(0xb5cf2000), %o5
	.word	0xee28a033	! t0_kref+0x2838:   	stb	%l7, [%g2 + 0x33]
	.word	0xdec6101c	! t0_kref+0x283c:   	ldswa	[%i0 + %i4]0x80, %o7
	.word	0xd208a031	! t0_kref+0x2840:   	ldub	[%g2 + 0x31], %o1
	.word	0x812e8013	! t0_kref+0x2844:   	sll	%i2, %l3, %g0
	.word	0xa1b007a6	! t0_kref+0x2848:   	fpackfix	%f6, %f16
	.word	0x9073401a	! t0_kref+0x284c:   	udiv	%o5, %i2, %o0
	.word	0xf51fbf08	! t0_kref+0x2850:   	ldd	[%fp - 0xf8], %f26
	.word	0xf1be5a1b	! t0_kref+0x2854:   	stda	%f24, [%i1 + %i3]0xd0
	.word	0xf007bfe0	! t0_kref+0x2858:   	ld	[%fp - 0x20], %i0
	.word	0xd00e201a	! t0_kref+0x285c:   	ldub	[%i0 + 0x1a], %o0
	.word	0xec4e4000	! t0_kref+0x2860:   	ldsb	[%i1], %l6
	.word	0x80168012	! t0_kref+0x2864:   	or	%i2, %l2, %g0
	.word	0x21800007	! t0_kref+0x2868:   	fbn,a	_kref+0x2884
	.word	0xafa0052a	! t0_kref+0x286c:   	fsqrts	%f10, %f23
	.word	0x8074faaf	! t0_kref+0x2870:   	udiv	%l3, -0x551, %g0
	.word	0xda2e8019	! t0_kref+0x2874:   	stb	%o5, [%i2 + %i1]
	.word	0x2b800007	! t0_kref+0x2878:   	fbug,a	_kref+0x2894
	.word	0x94d58013	! t0_kref+0x287c:   	umulcc	%l6, %l3, %o2
	.word	0xa9a00550	! t0_kref+0x2880:   	fsqrtd	%f16, %f20
	.word	0x91a6c825	! t0_kref+0x2884:   	fadds	%f27, %f5, %f8
	call	SYM(t0_subr3)
	.word	0x96932280	! t0_kref+0x288c:   	orcc	%o4, 0x280, %o3
	.word	0xd03e6000	! t0_kref+0x2890:   	std	%o0, [%i1]
	.word	0xec364000	! t0_kref+0x2894:   	sth	%l6, [%i1]
	.word	0xda000018	! t0_kref+0x2898:   	ld	[%g0 + %i0], %o5
	.word	0x81854000	! t0_kref+0x289c:   	wr	%l5, %g0, %y
	.word	0x81850000	! t0_kref+0x28a0:   	wr	%l4, %g0, %y
	.word	0xd4ff1018	! t0_kref+0x28a4:   	swapa	[%i4 + %i0]0x80, %o2
	.word	0x968eb666	! t0_kref+0x28a8:   	andcc	%i2, -0x99a, %o3
	.word	0x9a958008	! t0_kref+0x28ac:   	orcc	%l6, %o0, %o5
	.word	0x93a0053a	! t0_kref+0x28b0:   	fsqrts	%f26, %f9
	.word	0x89b74db8	! t0_kref+0x28b4:   	fxors	%f29, %f24, %f4
	.word	0xd000a038	! t0_kref+0x28b8:   	ld	[%g2 + 0x38], %o0
	.word	0x2f480006	! t0_kref+0x28bc:   	fbu,a,pt	%fcc0, _kref+0x28d4
	.word	0x89a608d8	! t0_kref+0x28c0:   	fsubd	%f24, %f24, %f4
	.word	0xec9e101d	! t0_kref+0x28c4:   	ldda	[%i0 + %i5]0x80, %l6
	.word	0x8fa149b4	! t0_kref+0x28c8:   	fdivs	%f5, %f20, %f7
	.word	0xadb40918	! t0_kref+0x28cc:   	faligndata	%f16, %f24, %f22
	.word	0x9db60c9c	! t0_kref+0x28d0:   	fandnot2	%f24, %f28, %f14
	.word	0xd6070019	! t0_kref+0x28d4:   	ld	[%i4 + %i1], %o3
	.word	0x973a6006	! t0_kref+0x28d8:   	sra	%o1, 0x6, %o3
	.word	0x9425354d	! t0_kref+0x28dc:   	sub	%l4, -0xab3, %o2
	.word	0xac82f4a6	! t0_kref+0x28e0:   	addcc	%o3, -0xb5a, %l6
	.word	0xd01e7ff8	! t0_kref+0x28e4:   	ldd	[%i1 - 8], %o0
	.word	0x90acfc09	! t0_kref+0x28e8:   	andncc	%l3, -0x3f7, %o0
	.word	0xd850a01a	! t0_kref+0x28ec:   	ldsh	[%g2 + 0x1a], %o4
	.word	0xd620a038	! t0_kref+0x28f0:   	st	%o3, [%g2 + 0x38]
	.word	0x96848013	! t0_kref+0x28f4:   	addcc	%l2, %l3, %o3
	.word	0xa7a01895	! t0_kref+0x28f8:   	fitos	%f21, %f19
	.word	0xd62e3ff7	! t0_kref+0x28fc:   	stb	%o3, [%i0 - 9]
	.word	0xa5a01896	! t0_kref+0x2900:   	fitos	%f22, %f18
	.word	0xc9be5a1b	! t0_kref+0x2904:   	stda	%f4, [%i1 + %i3]0xd0
	.word	0x93b304d8	! t0_kref+0x2908:   	fcmpne32	%f12, %f24, %o1
	.word	0xf13e7fe0	! t0_kref+0x290c:   	std	%f24, [%i1 - 0x20]
	.word	0x8db10e80	! t0_kref+0x2910:   	fsrc1	%f4, %f6
	.word	0x8585c01a	! t0_kref+0x2914:   	wr	%l7, %i2, %ccr
	.word	0x9da0188a	! t0_kref+0x2918:   	fitos	%f10, %f14
	.word	0xecde1000	! t0_kref+0x291c:   	ldxa	[%i0]0x80, %l6
	.word	0xd4063ff4	! t0_kref+0x2920:   	ld	[%i0 - 0xc], %o2
	.word	0x37800005	! t0_kref+0x2924:   	fbge,a	_kref+0x2938
	.word	0xec362000	! t0_kref+0x2928:   	sth	%l6, [%i0]
	.word	0xd248a020	! t0_kref+0x292c:   	ldsb	[%g2 + 0x20], %o1
	.word	0x9a82c017	! t0_kref+0x2930:   	addcc	%o3, %l7, %o5
	.word	0xee4e8018	! t0_kref+0x2934:   	ldsb	[%i2 + %i0], %l7
	.word	0xae6029f3	! t0_kref+0x2938:   	subc	%g0, 0x9f3, %l7
	.word	0xb9b18e80	! t0_kref+0x293c:   	fsrc1	%f6, %f28
	.word	0x95b28173	! t0_kref+0x2940:   	edge32ln	%o2, %l3, %o2
	.word	0x93b5c0cb	! t0_kref+0x2944:   	edge16l	%l7, %o3, %o1
	.word	0x35480001	! t0_kref+0x2948:   	fbue,a,pt	%fcc0, _kref+0x294c
	.word	0x81320000	! t0_kref+0x294c:   	srl	%o0, %g0, %g0
	.word	0x89b707cc	! t0_kref+0x2950:   	pdist	%f28, %f12, %f4
	.word	0x2f480008	! t0_kref+0x2954:   	fbu,a,pt	%fcc0, _kref+0x2974
	.word	0xcd00a010	! t0_kref+0x2958:   	ld	[%g2 + 0x10], %f6
	.word	0xf3263fe0	! t0_kref+0x295c:   	st	%f25, [%i0 - 0x20]
	.word	0xec78a028	! t0_kref+0x2960:   	swap	[%g2 + 0x28], %l6
	.word	0xd850a01a	! t0_kref+0x2964:   	ldsh	[%g2 + 0x1a], %o4
	.word	0xe1be5a1a	! t0_kref+0x2968:   	stda	%f16, [%i1 + %i2]0xd0
	.word	0xd500a008	! t0_kref+0x296c:   	ld	[%g2 + 8], %f10
	.word	0x94d376ed	! t0_kref+0x2970:   	umulcc	%o5, -0x913, %o2
	.word	0xaf400000	! t0_kref+0x2974:   	mov	%y, %l7
	.word	0xe8780019	! t0_kref+0x2978:   	swap	[%g0 + %i1], %l4
	.word	0xee7e4000	! t0_kref+0x297c:   	swap	[%i1], %l7
	.word	0x170c6ddc	! t0_kref+0x2980:   	sethi	%hi(0x31b77000), %o3
	.word	0xafa01891	! t0_kref+0x2984:   	fitos	%f17, %f23
	.word	0xec68a028	! t0_kref+0x2988:   	ldstub	[%g2 + 0x28], %l6
	.word	0x99b1051c	! t0_kref+0x298c:   	fcmpgt16	%f4, %f28, %o4
	.word	0x80350016	! t0_kref+0x2990:   	orn	%l4, %l6, %g0
	.word	0x39800004	! t0_kref+0x2994:   	fbuge,a	_kref+0x29a4
	.word	0xd7063fe8	! t0_kref+0x2998:   	ld	[%i0 - 0x18], %f11
	.word	0x93b3cd2b	! t0_kref+0x299c:   	fandnot1s	%f15, %f11, %f9
	.word	0xd016c018	! t0_kref+0x29a0:   	lduh	[%i3 + %i0], %o0
	.word	0x9f2ea008	! t0_kref+0x29a4:   	sll	%i2, 0x8, %o7
	.word	0xda0e001a	! t0_kref+0x29a8:   	ldub	[%i0 + %i2], %o5
	.word	0xd6166016	! t0_kref+0x29ac:   	lduh	[%i1 + 0x16], %o3
	.word	0x972a6008	! t0_kref+0x29b0:   	sll	%o1, 0x8, %o3
	.word	0x89b586f6	! t0_kref+0x29b4:   	fmul8ulx16	%f22, %f22, %f4
	.word	0xd6567ff6	! t0_kref+0x29b8:   	ldsh	[%i1 - 0xa], %o3
	.word	0xd5270019	! t0_kref+0x29bc:   	st	%f10, [%i4 + %i1]
	.word	0x9abc8009	! t0_kref+0x29c0:   	xnorcc	%l2, %o1, %o5
	.word	0x91b70a58	! t0_kref+0x29c4:   	fpadd32	%f28, %f24, %f8
	.word	0xf1ee501a	! t0_kref+0x29c8:   	prefetcha	%i1 + %i2, 24
	.word	0x2b480004	! t0_kref+0x29cc:   	fbug,a,pt	%fcc0, _kref+0x29dc
	.word	0xa9a00032	! t0_kref+0x29d0:   	fmovs	%f18, %f20
	.word	0xb9a00525	! t0_kref+0x29d4:   	fsqrts	%f5, %f28
	.word	0x91a5cd24	! t0_kref+0x29d8:   	fsmuld	%f23, %f4, %f8
	.word	0xf4b61000	! t0_kref+0x29dc:   	stha	%i2, [%i0]0x80
	.word	0xc02e401a	! t0_kref+0x29e0:   	clrb	[%i1 + %i2]
	.word	0xd2e81018	! t0_kref+0x29e4:   	ldstuba	[%g0 + %i0]0x80, %o1
	.word	0x99a0103b	! t0_kref+0x29e8:   	fstox	%f27, %f12
	.word	0x35480001	! t0_kref+0x29ec:   	fbue,a,pt	%fcc0, _kref+0x29f0
	.word	0x99604009	! t0_kref+0x29f0:   	movne	%fcc0, %o1, %o4
	call	SYM(t0_subr2)
	.word	0x89a01888	! t0_kref+0x29f8:   	fitos	%f8, %f4
	.word	0x90658008	! t0_kref+0x29fc:   	subc	%l6, %o0, %o0
	.word	0x89b30c54	! t0_kref+0x2a00:   	fnor	%f12, %f20, %f4
	.word	0xd26e201f	! t0_kref+0x2a04:   	ldstub	[%i0 + 0x1f], %o1
	.word	0x9ba0053a	! t0_kref+0x2a08:   	fsqrts	%f26, %f13
	.word	0xafa0053c	! t0_kref+0x2a0c:   	fsqrts	%f28, %f23
	.word	0x97b007a8	! t0_kref+0x2a10:   	fpackfix	%f8, %f11
	.word	0x91a409d0	! t0_kref+0x2a14:   	fdivd	%f16, %f16, %f8
	.word	0x3b800004	! t0_kref+0x2a18:   	fble,a	_kref+0x2a28
	.word	0xa9b28f84	! t0_kref+0x2a1c:   	for	%f10, %f4, %f20
	.word	0xe968a047	! t0_kref+0x2a20:   	prefetch	%g2 + 0x47, 20
	.word	0x905a000a	! t0_kref+0x2a24:   	smul	%o0, %o2, %o0
	.word	0xec06201c	! t0_kref+0x2a28:   	ld	[%i0 + 0x1c], %l6
	.word	0x2d480007	! t0_kref+0x2a2c:   	fbg,a,pt	%fcc0, _kref+0x2a48
	.word	0xed266018	! t0_kref+0x2a30:   	st	%f22, [%i1 + 0x18]
	.word	0xafb68548	! t0_kref+0x2a34:   	fcmpeq16	%f26, %f8, %l7
	.word	0xc016401b	! t0_kref+0x2a38:   	lduh	[%i1 + %i3], %g0
	.word	0xcd380019	! t0_kref+0x2a3c:   	std	%f6, [%g0 + %i1]
	.word	0xf36e401a	! t0_kref+0x2a40:   	prefetch	%i1 + %i2, 25
	.word	0x8143c000	! t0_kref+0x2a44:   	stbar
	.word	0xe62e6006	! t0_kref+0x2a48:   	stb	%l3, [%i1 + 6]
	.word	0x81854000	! t0_kref+0x2a4c:   	wr	%l5, %g0, %y
	.word	0xcd00a018	! t0_kref+0x2a50:   	ld	[%g2 + 0x18], %f6
	.word	0x81ae8aa4	! t0_kref+0x2a54:   	fcmpes	%fcc0, %f26, %f4
	.word	0x932ca000	! t0_kref+0x2a58:   	sll	%l2, 0x0, %o1
	.word	0xa9a388d2	! t0_kref+0x2a5c:   	fsubd	%f14, %f18, %f20
	.word	0xe3000019	! t0_kref+0x2a60:   	ld	[%g0 + %i1], %f17
	.word	0xd2000019	! t0_kref+0x2a64:   	ld	[%g0 + %i1], %o1
	.word	0x3c800008	! t0_kref+0x2a68:   	bpos,a	_kref+0x2a88
	.word	0xe6ae9019	! t0_kref+0x2a6c:   	stba	%l3, [%i2 + %i1]0x80
	.word	0x3b800005	! t0_kref+0x2a70:   	fble,a	_kref+0x2a84
	.word	0xd640a030	! t0_kref+0x2a74:   	ldsw	[%g2 + 0x30], %o3
	.word	0xd300a010	! t0_kref+0x2a78:   	ld	[%g2 + 0x10], %f9
	.word	0x9fc00004	! t0_kref+0x2a7c:   	call	%g0 + %g4
	.word	0x98bac014	! t0_kref+0x2a80:   	xnorcc	%o3, %l4, %o4
	.word	0xec160000	! t0_kref+0x2a84:   	lduh	[%i0], %l6
	.word	0xa3a4082e	! t0_kref+0x2a88:   	fadds	%f16, %f14, %f17
	.word	0xcd1fbc68	! t0_kref+0x2a8c:   	ldd	[%fp - 0x398], %f6
	.word	0xf430a020	! t0_kref+0x2a90:   	sth	%i2, [%g2 + 0x20]
	.word	0xa1b68dd8	! t0_kref+0x2a94:   	fnand	%f26, %f24, %f16
	.word	0xe11e001d	! t0_kref+0x2a98:   	ldd	[%i0 + %i5], %f16
	.word	0xee360000	! t0_kref+0x2a9c:   	sth	%l7, [%i0]
	.word	0xef68a0c2	! t0_kref+0x2aa0:   	prefetch	%g2 + 0xc2, 23
	.word	0x86102011	! t0_kref+0x2aa4:   	mov	0x11, %g3
	.word	0x86a0e001	! t0_kref+0x2aa8:   	subcc	%g3, 1, %g3
	.word	0x22800013	! t0_kref+0x2aac:   	be,a	_kref+0x2af8
	.word	0xc008a020	! t0_kref+0x2ab0:   	ldub	[%g2 + 0x20], %g0
	call	SYM(t0_subr2)
	.word	0xf1a6101c	! t0_kref+0x2ab8:   	sta	%f24, [%i0 + %i4]0x80
	.word	0x80d4af6d	! t0_kref+0x2abc:   	umulcc	%l2, 0xf6d, %g0
	.word	0x96003ee0	! t0_kref+0x2ac0:   	add	%g0, -0x120, %o3
	.word	0x8054f0dc	! t0_kref+0x2ac4:   	umul	%l3, -0xf24, %g0
	.word	0x95a609c6	! t0_kref+0x2ac8:   	fdivd	%f24, %f6, %f10
	.word	0xf3263ff4	! t0_kref+0x2acc:   	st	%f25, [%i0 - 0xc]
	.word	0x2d480007	! t0_kref+0x2ad0:   	fbg,a,pt	%fcc0, _kref+0x2aec
	.word	0xeb68a100	! t0_kref+0x2ad4:   	prefetch	%g2 + 0x100, 21
	.word	0x25480001	! t0_kref+0x2ad8:   	fblg,a,pt	%fcc0, _kref+0x2adc
	.word	0x9e3c800d	! t0_kref+0x2adc:   	xnor	%l2, %o5, %o7
	.word	0xd850a01a	! t0_kref+0x2ae0:   	ldsh	[%g2 + 0x1a], %o4
	.word	0xb1b68a4e	! t0_kref+0x2ae4:   	fpadd32	%f26, %f14, %f24
	.word	0x81868000	! t0_kref+0x2ae8:   	wr	%i2, %g0, %y
	.word	0xd40e3ffc	! t0_kref+0x2aec:   	ldub	[%i0 - 4], %o2
	.word	0xda48a030	! t0_kref+0x2af0:   	ldsb	[%g2 + 0x30], %o5
	.word	0xd026401c	! t0_kref+0x2af4:   	st	%o0, [%i1 + %i4]
	.word	0xde50a030	! t0_kref+0x2af8:   	ldsh	[%g2 + 0x30], %o7
	.word	0xf11fbd98	! t0_kref+0x2afc:   	ldd	[%fp - 0x268], %f24
	.word	0xe8fe101c	! t0_kref+0x2b00:   	swapa	[%i0 + %i4]0x80, %l4
	.word	0xa3a3c92f	! t0_kref+0x2b04:   	fmuls	%f15, %f15, %f17
	.word	0x81ab8aca	! t0_kref+0x2b08:   	fcmped	%fcc0, %f14, %f10
	.word	0x8da00537	! t0_kref+0x2b0c:   	fsqrts	%f23, %f6
	.word	0x95354014	! t0_kref+0x2b10:   	srl	%l5, %l4, %o2
	.word	0xafa0052a	! t0_kref+0x2b14:   	fsqrts	%f10, %f23
	sethi	%hi(2f), %o7
	.word	0xe40be340	! t0_kref+0x2b1c:   	ldub	[%o7 + 0x340], %l2
	.word	0xa41ca00c	! t0_kref+0x2b20:   	xor	%l2, 0xc, %l2
	.word	0xe42be340	! t0_kref+0x2b24:   	stb	%l2, [%o7 + 0x340]
	.word	0x81dbe340	! t0_kref+0x2b28:   	flush	%o7 + 0x340
	.word	0xd01e7fe0	! t0_kref+0x2b2c:   	ldd	[%i1 - 0x20], %o0
	.word	0xa5a28846	! t0_kref+0x2b30:   	faddd	%f10, %f6, %f18
	.word	0xa9a0002f	! t0_kref+0x2b34:   	fmovs	%f15, %f20
	.word	0x9875b28a	! t0_kref+0x2b38:   	udiv	%l6, -0xd76, %o4
	.word	0xa9a1894a	! t0_kref+0x2b3c:   	fmuld	%f6, %f10, %f20
2:	.word	0xe82e8018	! t0_kref+0x2b40:   	stb	%l4, [%i2 + %i0]
	.word	0x39800007	! t0_kref+0x2b44:   	fbuge,a	_kref+0x2b60
	.word	0xaf400000	! t0_kref+0x2b48:   	mov	%y, %l7
	.word	0xacbdea43	! t0_kref+0x2b4c:   	xnorcc	%l7, 0xa43, %l6
	.word	0xd24e401a	! t0_kref+0x2b50:   	ldsb	[%i1 + %i2], %o1
	.word	0x9fb28200	! t0_kref+0x2b54:   	array8	%o2, %g0, %o7
	.word	0x130c466d	! t0_kref+0x2b58:   	sethi	%hi(0x3119b400), %o1
	.word	0x905a800d	! t0_kref+0x2b5c:   	smul	%o2, %o5, %o0
	.word	0x25800008	! t0_kref+0x2b60:   	fblg,a	_kref+0x2b80
	.word	0x8fb58da7	! t0_kref+0x2b64:   	fxors	%f22, %f7, %f7
	.word	0xe636c019	! t0_kref+0x2b68:   	sth	%l3, [%i3 + %i1]
	.word	0x21800007	! t0_kref+0x2b6c:   	fbn,a	_kref+0x2b88
	.word	0xc008a03a	! t0_kref+0x2b70:   	ldub	[%g2 + 0x3a], %g0
	.word	0xe66e201a	! t0_kref+0x2b74:   	ldstub	[%i0 + 0x1a], %l3
	.word	0xac40000d	! t0_kref+0x2b78:   	addc	%g0, %o5, %l6
	.word	0xde00a038	! t0_kref+0x2b7c:   	ld	[%g2 + 0x38], %o7
	.word	0x81ae0a5c	! t0_kref+0x2b80:   	fcmpd	%fcc0, %f24, %f28
	.word	0x96056341	! t0_kref+0x2b84:   	add	%l5, 0x341, %o3
	.word	0x905a3086	! t0_kref+0x2b88:   	smul	%o0, -0xf7a, %o0
	.word	0x8004ecf8	! t0_kref+0x2b8c:   	add	%l3, 0xcf8, %g0
	.word	0x9fb34013	! t0_kref+0x2b90:   	edge8	%o5, %l3, %o7
	.word	0x89b54caa	! t0_kref+0x2b94:   	fandnot2s	%f21, %f10, %f4
	.word	0x2d480007	! t0_kref+0x2b98:   	fbg,a,pt	%fcc0, _kref+0x2bb4
	.word	0xae52000c	! t0_kref+0x2b9c:   	umul	%o0, %o4, %l7
	.word	0xd11fbfd8	! t0_kref+0x2ba0:   	ldd	[%fp - 0x28], %f8
	.word	0x80c2a097	! t0_kref+0x2ba4:   	addccc	%o2, 0x97, %g0
	.word	0x9b3a000a	! t0_kref+0x2ba8:   	sra	%o0, %o2, %o5
	.word	0xa5b00f2a	! t0_kref+0x2bac:   	fsrc2s	%f10, %f18
	.word	0xa5b10d60	! t0_kref+0x2bb0:   	fnot1s	%f4, %f18
	.word	0x27480004	! t0_kref+0x2bb4:   	fbul,a,pt	%fcc0, _kref+0x2bc4
	.word	0xa5b00f08	! t0_kref+0x2bb8:   	fsrc2	%f8, %f18
	.word	0x36800005	! t0_kref+0x2bbc:   	bge,a	_kref+0x2bd0
	.word	0xaf36a00d	! t0_kref+0x2bc0:   	srl	%i2, 0xd, %l7
	.word	0xd640a018	! t0_kref+0x2bc4:   	ldsw	[%g2 + 0x18], %o3
	.word	0xa5a58846	! t0_kref+0x2bc8:   	faddd	%f22, %f6, %f18
	call	SYM(t0_subr3)
	.word	0x95a288d8	! t0_kref+0x2bd0:   	fsubd	%f10, %f24, %f10
	.word	0xee26401c	! t0_kref+0x2bd4:   	st	%l7, [%i1 + %i4]
	.word	0x27480003	! t0_kref+0x2bd8:   	fbul,a,pt	%fcc0, _kref+0x2be4
	.word	0xcd00a008	! t0_kref+0x2bdc:   	ld	[%g2 + 8], %f6
	.word	0x91a688d4	! t0_kref+0x2be0:   	fsubd	%f26, %f20, %f8
	.word	0xa5b20f9c	! t0_kref+0x2be4:   	for	%f8, %f28, %f18
	.word	0x9de3bfa0	! t0_kref+0x2be8:   	save	%sp, -0x60, %sp
	.word	0x91eec01c	! t0_kref+0x2bec:   	restore	%i3, %i4, %o0
	.word	0xea26001c	! t0_kref+0x2bf0:   	st	%l5, [%i0 + %i4]
	.word	0xec180019	! t0_kref+0x2bf4:   	ldd	[%g0 + %i1], %l6
	.word	0xacb230ec	! t0_kref+0x2bf8:   	orncc	%o0, -0xf14, %l6
	.word	0xec4e4000	! t0_kref+0x2bfc:   	ldsb	[%i1], %l6
	.word	0xc04e7fe2	! t0_kref+0x2c00:   	ldsb	[%i1 - 0x1e], %g0
	.word	0x9ad2f34a	! t0_kref+0x2c04:   	umulcc	%o3, -0xcb6, %o5
	.word	0xa9a609d4	! t0_kref+0x2c08:   	fdivd	%f24, %f20, %f20
	.word	0x81824000	! t0_kref+0x2c0c:   	wr	%o1, %g0, %y
	.word	0xf51fbf18	! t0_kref+0x2c10:   	ldd	[%fp - 0xe8], %f26
	.word	0xde50a018	! t0_kref+0x2c14:   	ldsh	[%g2 + 0x18], %o7
	.word	0xed1e401d	! t0_kref+0x2c18:   	ldd	[%i1 + %i5], %f22
	.word	0xa1a288c4	! t0_kref+0x2c1c:   	fsubd	%f10, %f4, %f16
	.word	0x9fc10000	! t0_kref+0x2c20:   	call	%g4
	.word	0xa1a4492d	! t0_kref+0x2c24:   	fmuls	%f17, %f13, %f16
	.word	0xe9be1a5d	! t0_kref+0x2c28:   	stda	%f20, [%i0 + %i5]0xd2
	.word	0xda2e4000	! t0_kref+0x2c2c:   	stb	%o5, [%i1]
	.word	0xac050013	! t0_kref+0x2c30:   	add	%l4, %l3, %l6
	.word	0xe6267ff0	! t0_kref+0x2c34:   	st	%l3, [%i1 - 0x10]
	.word	0xe11fbc38	! t0_kref+0x2c38:   	ldd	[%fp - 0x3c8], %f16
	.word	0xa7a00028	! t0_kref+0x2c3c:   	fmovs	%f8, %f19
	.word	0x94fa6494	! t0_kref+0x2c40:   	sdivcc	%o1, 0x494, %o2
	.word	0xad400000	! t0_kref+0x2c44:   	mov	%y, %l6
	.word	0xc568a007	! t0_kref+0x2c48:   	prefetch	%g2 + 7, 2
	.word	0x94724008	! t0_kref+0x2c4c:   	udiv	%o1, %o0, %o2
	.word	0xf506401c	! t0_kref+0x2c50:   	ld	[%i1 + %i4], %f26
	.word	0xadb14d3d	! t0_kref+0x2c54:   	fandnot1s	%f5, %f29, %f22
	.word	0x99b0077c	! t0_kref+0x2c58:   	fpack16	%f28, %f12
	.word	0xc050a012	! t0_kref+0x2c5c:   	ldsh	[%g2 + 0x12], %g0
	.word	0x23800005	! t0_kref+0x2c60:   	fbne,a	_kref+0x2c74
	.word	0xc768a043	! t0_kref+0x2c64:   	prefetch	%g2 + 0x43, 3
	.word	0xb1b68dec	! t0_kref+0x2c68:   	fnands	%f26, %f12, %f24
	.word	0xd450a018	! t0_kref+0x2c6c:   	ldsh	[%g2 + 0x18], %o2
	.word	0x80337b04	! t0_kref+0x2c70:   	orn	%o5, -0x4fc, %g0
	.word	0x9e5ae398	! t0_kref+0x2c74:   	smul	%o3, 0x398, %o7
	.word	0x90bdc000	! t0_kref+0x2c78:   	xnorcc	%l7, %g0, %o0
	.word	0xd91fbea0	! t0_kref+0x2c7c:   	ldd	[%fp - 0x160], %f12
	.word	0x8da509cc	! t0_kref+0x2c80:   	fdivd	%f20, %f12, %f6
	.word	0xaf3a0015	! t0_kref+0x2c84:   	sra	%o0, %l5, %l7
	.word	0x9da0052c	! t0_kref+0x2c88:   	fsqrts	%f12, %f14
	.word	0xf1be5808	! t0_kref+0x2c8c:   	stda	%f24, [%i1 + %o0]0xc0
	.word	0x9f400000	! t0_kref+0x2c90:   	mov	%y, %o7
	.word	0xde00a038	! t0_kref+0x2c94:   	ld	[%g2 + 0x38], %o7
	.word	0x86102006	! t0_kref+0x2c98:   	mov	0x6, %g3
	.word	0x86a0e001	! t0_kref+0x2c9c:   	subcc	%g3, 1, %g3
	.word	0x22800015	! t0_kref+0x2ca0:   	be,a	_kref+0x2cf4
	.word	0xe6263fe4	! t0_kref+0x2ca4:   	st	%l3, [%i0 - 0x1c]
	.word	0xec16c019	! t0_kref+0x2ca8:   	lduh	[%i3 + %i1], %l6
	.word	0x96d375c2	! t0_kref+0x2cac:   	umulcc	%o5, -0xa3e, %o3
	.word	0xed68a101	! t0_kref+0x2cb0:   	prefetch	%g2 + 0x101, 22
	.word	0x929b0013	! t0_kref+0x2cb4:   	xorcc	%o4, %l3, %o1
	.word	0x8db20715	! t0_kref+0x2cb8:   	fmuld8sux16	%f8, %f21, %f6
	.word	0xd06e2006	! t0_kref+0x2cbc:   	ldstub	[%i0 + 6], %o0
	.word	0xb7a01898	! t0_kref+0x2cc0:   	fitos	%f24, %f27
	.word	0xd51fbc98	! t0_kref+0x2cc4:   	ldd	[%fp - 0x368], %f10
	.word	0xf1bf5018	! t0_kref+0x2cc8:   	stda	%f24, [%i5 + %i0]0x80
	.word	0xee7e3ff0	! t0_kref+0x2ccc:   	swap	[%i0 - 0x10], %l7
	.word	0xda4e601f	! t0_kref+0x2cd0:   	ldsb	[%i1 + 0x1f], %o5
	.word	0x9ebaf21b	! t0_kref+0x2cd4:   	xnorcc	%o3, -0xde5, %o7
	.word	0x8da1482d	! t0_kref+0x2cd8:   	fadds	%f5, %f13, %f6
	.word	0x8d86b845	! t0_kref+0x2cdc:   	wr	%i2, 0xfffff845, %fprs
	.word	0xd800a018	! t0_kref+0x2ce0:   	ld	[%g2 + 0x18], %o4
	.word	0xfb063ff8	! t0_kref+0x2ce4:   	ld	[%i0 - 8], %f29
	.word	0x95b2816b	! t0_kref+0x2ce8:   	edge32ln	%o2, %o3, %o2
	.word	0x80734013	! t0_kref+0x2cec:   	udiv	%o5, %l3, %g0
	.word	0x234fffeb	! t0_kref+0x2cf0:   	fbne,a,pt	%fcc0, _kref+0x2c9c
	.word	0xf8382e20	! t0_kref+0x2cf4:   	std	%i4, [%g0 + 0xe20]
	.word	0x3b800006	! t0_kref+0x2cf8:   	fble,a	_kref+0x2d10
	.word	0x988e800b	! t0_kref+0x2cfc:   	andcc	%i2, %o3, %o4
	.word	0x9bb34177	! t0_kref+0x2d00:   	edge32ln	%o5, %l7, %o5
	.word	0xd010a020	! t0_kref+0x2d04:   	lduh	[%g2 + 0x20], %o0
	.word	0xd2780019	! t0_kref+0x2d08:   	swap	[%g0 + %i1], %o1
	.word	0xadb4c04a	! t0_kref+0x2d0c:   	edge8l	%l3, %o2, %l6
	.word	0xd0100018	! t0_kref+0x2d10:   	lduh	[%g0 + %i0], %o0
	.word	0x91183881	! t0_kref+0x2d14:   	tsubcctv	%g0, -0x77f, %o0
	.word	0x91b387cc	! t0_kref+0x2d18:   	pdist	%f14, %f12, %f8
	.word	0x8da6cd30	! t0_kref+0x2d1c:   	fsmuld	%f27, %f16, %f6
	.word	0xd840a008	! t0_kref+0x2d20:   	ldsw	[%g2 + 8], %o4
	.word	0x9fc00004	! t0_kref+0x2d24:   	call	%g0 + %g4
	.word	0xf500a038	! t0_kref+0x2d28:   	ld	[%g2 + 0x38], %f26
	.word	0x95703e3c	! t0_kref+0x2d2c:   	popc	-0x1c4, %o2
	.word	0xa5b68a14	! t0_kref+0x2d30:   	fpadd16	%f26, %f20, %f18
	.word	0x1316d61a	! t0_kref+0x2d34:   	sethi	%hi(0x5b586800), %o1
	.word	0x95a018c6	! t0_kref+0x2d38:   	fdtos	%f6, %f10
	.word	0xec1e3ff0	! t0_kref+0x2d3c:   	ldd	[%i0 - 0x10], %l6
	.word	0x81b1844a	! t0_kref+0x2d40:   	fcmpne16	%f6, %f10, %g0
	.word	0xf91fbef0	! t0_kref+0x2d44:   	ldd	[%fp - 0x110], %f28
	.word	0xc006001c	! t0_kref+0x2d48:   	ld	[%i0 + %i4], %g0
	.word	0x9b3dc00c	! t0_kref+0x2d4c:   	sra	%l7, %o4, %o5
	.word	0xa5a588c6	! t0_kref+0x2d50:   	fsubd	%f22, %f6, %f18
	.word	0x27480005	! t0_kref+0x2d54:   	fbul,a,pt	%fcc0, _kref+0x2d68
	.word	0x953a6006	! t0_kref+0x2d58:   	sra	%o1, 0x6, %o2
	.word	0xc900a020	! t0_kref+0x2d5c:   	ld	[%g2 + 0x20], %f4
	.word	0xb7a6483c	! t0_kref+0x2d60:   	fadds	%f25, %f28, %f27
	.word	0xbbb00768	! t0_kref+0x2d64:   	fpack16	%f8, %f29
	.word	0x80fcb987	! t0_kref+0x2d68:   	sdivcc	%l2, -0x679, %g0
	.word	0xfb00a010	! t0_kref+0x2d6c:   	ld	[%g2 + 0x10], %f29
	.word	0x92836a32	! t0_kref+0x2d70:   	addcc	%o5, 0xa32, %o1
	.word	0xe1266000	! t0_kref+0x2d74:   	st	%f16, [%i1]
	.word	0x933c800d	! t0_kref+0x2d78:   	sra	%l2, %o5, %o1
	.word	0xf9064000	! t0_kref+0x2d7c:   	ld	[%i1], %f28
	.word	0x965d3470	! t0_kref+0x2d80:   	smul	%l4, -0xb90, %o3
	.word	0xe500a028	! t0_kref+0x2d84:   	ld	[%g2 + 0x28], %f18
	.word	0xd53e3fe0	! t0_kref+0x2d88:   	std	%f10, [%i0 - 0x20]
	.word	0x20480001	! t0_kref+0x2d8c:   	bn,a,pt	%icc, _kref+0x2d90
	.word	0x812d2000	! t0_kref+0x2d90:   	sll	%l4, 0x0, %g0
	sethi	%hi(1f), %o7
	jmpl	%o7+%lo(1f), %g1
	.empty
	.word	0x99700014	! t0_kref+0x2d9c:   	popc	%l4, %o4
	.word	0x8d868000	! t0_kref+0x2da0:   	wr	%i2, %g0, %fprs
	.word	0xa9a00028	! t0_kref+0x2da4:   	fmovs	%f8, %f20
	.word	0x9bb30000	! t0_kref+0x2da8:   	edge8	%o4, %g0, %o5
1:	.word	0x98b34009	! t0_kref+0x2dac:   	orncc	%o5, %o1, %o4
	.word	0x99a609c4	! t0_kref+0x2db0:   	fdivd	%f24, %f4, %f12
	.word	0x93a0003d	! t0_kref+0x2db4:   	fmovs	%f29, %f9
	.word	0xd5063ffc	! t0_kref+0x2db8:   	ld	[%i0 - 4], %f10
	.word	0x9fc10000	! t0_kref+0x2dbc:   	call	%g4
	.word	0x9026800c	! t0_kref+0x2dc0:   	sub	%i2, %o4, %o0
	.word	0xd01e6000	! t0_kref+0x2dc4:   	ldd	[%i1], %o0
	.word	0x2a480002	! t0_kref+0x2dc8:   	bcs,a,pt	%icc, _kref+0x2dd0
	.word	0x97a1c8b3	! t0_kref+0x2dcc:   	fsubs	%f7, %f19, %f11
	.word	0x8da00138	! t0_kref+0x2dd0:   	fabss	%f24, %f6
	.word	0xaeb00014	! t0_kref+0x2dd4:   	orncc	%g0, %l4, %l7
	.word	0xd27e001c	! t0_kref+0x2dd8:   	swap	[%i0 + %i4], %o1
	.word	0xb5b68d14	! t0_kref+0x2ddc:   	fandnot1	%f26, %f20, %f26
	.word	0x92b5e62f	! t0_kref+0x2de0:   	orncc	%l7, 0x62f, %o1
	.word	0x9646801a	! t0_kref+0x2de4:   	addc	%i2, %i2, %o3
	.word	0x95b1cd60	! t0_kref+0x2de8:   	fnot1s	%f7, %f10
	.word	0x9a5a2ff2	! t0_kref+0x2dec:   	smul	%o0, 0xff2, %o5
	.word	0xd300a038	! t0_kref+0x2df0:   	ld	[%g2 + 0x38], %f9
	.word	0xd67f0018	! t0_kref+0x2df4:   	swap	[%i4 + %i0], %o3
	.word	0xec1e6010	! t0_kref+0x2df8:   	ldd	[%i1 + 0x10], %l6
	.word	0xe0780018	! t0_kref+0x2dfc:   	swap	[%g0 + %i0], %l0
	.word	0xda20a030	! t0_kref+0x2e00:   	st	%o5, [%g2 + 0x30]
	.word	0x9da8003a	! t0_kref+0x2e04:   	fmovsn	%fcc0, %f26, %f14
	.word	0x8143c000	! t0_kref+0x2e08:   	stbar
	.word	0xafb4c32d	! t0_kref+0x2e0c:   	bmask	%l3, %o5, %l7
	.word	0x31800007	! t0_kref+0x2e10:   	fba,a	_kref+0x2e2c
	.word	0x94fa001a	! t0_kref+0x2e14:   	sdivcc	%o0, %i2, %o2
	.word	0xc12e001c	! t0_kref+0x2e18:   	st	%fsr, [%i0 + %i4]
	.word	0x91b34200	! t0_kref+0x2e1c:   	array8	%o5, %g0, %o0
	.word	0x3a480004	! t0_kref+0x2e20:   	bcc,a,pt	%icc, _kref+0x2e30
	.word	0x812d4012	! t0_kref+0x2e24:   	sll	%l5, %l2, %g0
	call	SYM(t0_subr2)
	.word	0xec4e401a	! t0_kref+0x2e2c:   	ldsb	[%i1 + %i2], %l6
	.word	0xd04e2015	! t0_kref+0x2e30:   	ldsb	[%i0 + 0x15], %o0
	.word	0xd47e0000	! t0_kref+0x2e34:   	swap	[%i0], %o2
	.word	0xb5b50ac8	! t0_kref+0x2e38:   	fpsub32	%f20, %f8, %f26
	.word	0x2f0c9946	! t0_kref+0x2e3c:   	sethi	%hi(0x32651800), %l7
	.word	0x9ab527bf	! t0_kref+0x2e40:   	orncc	%l4, 0x7bf, %o5
	.word	0xa9a000aa	! t0_kref+0x2e44:   	fnegs	%f10, %f20
	.word	0xd03e6000	! t0_kref+0x2e48:   	std	%o0, [%i1]
	.word	0xde00a030	! t0_kref+0x2e4c:   	ld	[%g2 + 0x30], %o7
	.word	0xe2ff1018	! t0_kref+0x2e50:   	swapa	[%i4 + %i0]0x80, %l1
	.word	0xf7000019	! t0_kref+0x2e54:   	ld	[%g0 + %i1], %f27
	.word	0x91b4c054	! t0_kref+0x2e58:   	edge8l	%l3, %l4, %o0
	.word	0x9085bb42	! t0_kref+0x2e5c:   	addcc	%l6, -0x4be, %o0
	.word	0xed00a020	! t0_kref+0x2e60:   	ld	[%g2 + 0x20], %f22
	.word	0xd01e3fe0	! t0_kref+0x2e64:   	ldd	[%i0 - 0x20], %o0
	.word	0x92c5f077	! t0_kref+0x2e68:   	addccc	%l7, -0xf89, %o1
	.word	0xafa01896	! t0_kref+0x2e6c:   	fitos	%f22, %f23
	.word	0x94fb3094	! t0_kref+0x2e70:   	sdivcc	%o4, -0xf6c, %o2
	.word	0xd01e3ff8	! t0_kref+0x2e74:   	ldd	[%i0 - 8], %o0
	.word	0x95a688d0	! t0_kref+0x2e78:   	fsubd	%f26, %f16, %f10
	.word	0xe03e6010	! t0_kref+0x2e7c:   	std	%l0, [%i1 + 0x10]
	.word	0xd500a038	! t0_kref+0x2e80:   	ld	[%g2 + 0x38], %f10
	.word	0xb5b707d6	! t0_kref+0x2e84:   	pdist	%f28, %f22, %f26
	.word	0xee30a020	! t0_kref+0x2e88:   	sth	%l7, [%g2 + 0x20]
	.word	0x9f400000	! t0_kref+0x2e8c:   	mov	%y, %o7
	.word	0x9db18efb	! t0_kref+0x2e90:   	fornot2s	%f6, %f27, %f14
	.word	0xd2163fec	! t0_kref+0x2e94:   	lduh	[%i0 - 0x14], %o1
	.word	0x3d800003	! t0_kref+0x2e98:   	fbule,a	_kref+0x2ea4
	.word	0x81868000	! t0_kref+0x2e9c:   	wr	%i2, %g0, %y
	.word	0xa5a0191b	! t0_kref+0x2ea0:   	fitod	%f27, %f18
	.word	0xef00a008	! t0_kref+0x2ea4:   	ld	[%g2 + 8], %f23
	.word	0x9a5d2834	! t0_kref+0x2ea8:   	smul	%l4, 0x834, %o5
	.word	0xaed50013	! t0_kref+0x2eac:   	umulcc	%l4, %l3, %l7
	.word	0x2e480003	! t0_kref+0x2eb0:   	bvs,a,pt	%icc, _kref+0x2ebc
	.word	0xf320a008	! t0_kref+0x2eb4:   	st	%f25, [%g2 + 8]
	.word	0xb9a01899	! t0_kref+0x2eb8:   	fitos	%f25, %f28
	.word	0x93a000ae	! t0_kref+0x2ebc:   	fnegs	%f14, %f9
	.word	0x80b0388e	! t0_kref+0x2ec0:   	orncc	%g0, -0x772, %g0
	.word	0x9da40854	! t0_kref+0x2ec4:   	faddd	%f16, %f20, %f14
	.word	0x81858000	! t0_kref+0x2ec8:   	wr	%l6, %g0, %y
	.word	0x29800005	! t0_kref+0x2ecc:   	fbl,a	_kref+0x2ee0
	.word	0xfa10001b	! t0_kref+0x2ed0:   	lduh	[%g0 + %i3], %i5
	.word	0x92054014	! t0_kref+0x2ed4:   	add	%l5, %l4, %o1
	.word	0x21480006	! t0_kref+0x2ed8:   	fbn,a,pt	%fcc0, _kref+0x2ef0
	.word	0xef266010	! t0_kref+0x2edc:   	st	%f23, [%i1 + 0x10]
	.word	0xac883d77	! t0_kref+0x2ee0:   	andcc	%g0, -0x289, %l6
	.word	0x92fab0b4	! t0_kref+0x2ee4:   	sdivcc	%o2, -0xf4c, %o1
	.word	0xb9a01a2d	! t0_kref+0x2ee8:   	fstoi	%f13, %f28
	.word	0xd64e8018	! t0_kref+0x2eec:   	ldsb	[%i2 + %i0], %o3
	.word	0xac3cc00d	! t0_kref+0x2ef0:   	xnor	%l3, %o5, %l6
	.word	0xac85400c	! t0_kref+0x2ef4:   	addcc	%l5, %o4, %l6
	.word	0xa1b60a4e	! t0_kref+0x2ef8:   	fpadd32	%f24, %f14, %f16
	.word	0x9a23281a	! t0_kref+0x2efc:   	sub	%o4, 0x81a, %o5
	.word	0xafa24824	! t0_kref+0x2f00:   	fadds	%f9, %f4, %f23
	.word	0x9065bf36	! t0_kref+0x2f04:   	subc	%l6, -0xca, %o0
	.word	0xd44e200a	! t0_kref+0x2f08:   	ldsb	[%i0 + 0xa], %o2
	.word	0x91a00032	! t0_kref+0x2f0c:   	fmovs	%f18, %f8
	.word	0xbba3092b	! t0_kref+0x2f10:   	fmuls	%f12, %f11, %f29
	.word	0xe3e61012	! t0_kref+0x2f14:   	casa	[%i0]0x80, %l2, %l1
	.word	0x93a00527	! t0_kref+0x2f18:   	fsqrts	%f7, %f9
	.word	0x983c800b	! t0_kref+0x2f1c:   	xnor	%l2, %o3, %o4
	.word	0xd2fe101c	! t0_kref+0x2f20:   	swapa	[%i0 + %i4]0x80, %o1
	.word	0xe4ee1000	! t0_kref+0x2f24:   	ldstuba	[%i0]0x80, %l2
	.word	0x988d800a	! t0_kref+0x2f28:   	andcc	%l6, %o2, %o4
	.word	0xbba000b9	! t0_kref+0x2f2c:   	fnegs	%f25, %f29
	.word	0x8da00031	! t0_kref+0x2f30:   	fmovs	%f17, %f6
	.word	0xcb00a010	! t0_kref+0x2f34:   	ld	[%g2 + 0x10], %f5
	.word	0xd82e3ffa	! t0_kref+0x2f38:   	stb	%o4, [%i0 - 6]
	.word	0xad3ca00b	! t0_kref+0x2f3c:   	sra	%l2, 0xb, %l6
	.word	0xd600a010	! t0_kref+0x2f40:   	ld	[%g2 + 0x10], %o3
	.word	0xc12f0000	! t0_kref+0x2f44:   	st	%fsr, [%i4]
	.word	0x93a018d0	! t0_kref+0x2f48:   	fdtos	%f16, %f9
	.word	0x96d2800a	! t0_kref+0x2f4c:   	umulcc	%o2, %o2, %o3
	.word	0x925d001a	! t0_kref+0x2f50:   	smul	%l4, %i2, %o1
	.word	0xe968a008	! t0_kref+0x2f54:   	prefetch	%g2 + 8, 20
	.word	0x92c4e13b	! t0_kref+0x2f58:   	addccc	%l3, 0x13b, %o1
	.word	0x90c36ab3	! t0_kref+0x2f5c:   	addccc	%o5, 0xab3, %o0
	.word	0xe6f01018	! t0_kref+0x2f60:   	stxa	%l3, [%g0 + %i0]0x80
	.word	0xddbe501d	! t0_kref+0x2f64:   	stda	%f14, [%i1 + %i5]0x80
	.word	0x89a01a44	! t0_kref+0x2f68:   	fdtoi	%f4, %f4
	.word	0xaba00028	! t0_kref+0x2f6c:   	fmovs	%f8, %f21
	.word	0x9134a01a	! t0_kref+0x2f70:   	srl	%l2, 0x1a, %o0
	.word	0x9835800b	! t0_kref+0x2f74:   	orn	%l6, %o3, %o4
	.word	0xe93e7fe0	! t0_kref+0x2f78:   	std	%f20, [%i1 - 0x20]
	.word	0xb1b50e44	! t0_kref+0x2f7c:   	fxnor	%f20, %f4, %f24
	.word	0xd400a038	! t0_kref+0x2f80:   	ld	[%g2 + 0x38], %o2
	.word	0x97050014	! t0_kref+0x2f84:   	taddcc	%l4, %l4, %o3
	.word	0x37480006	! t0_kref+0x2f88:   	fbge,a,pt	%fcc0, _kref+0x2fa0
	.word	0xed1fbca8	! t0_kref+0x2f8c:   	ldd	[%fp - 0x358], %f22
	.word	0x95a00552	! t0_kref+0x2f90:   	fsqrtd	%f18, %f10
	.word	0xde50a000	! t0_kref+0x2f94:   	ldsh	[%g2], %o7
	.word	0xd8c65000	! t0_kref+0x2f98:   	ldswa	[%i1]0x80, %o4
	.word	0x9865800a	! t0_kref+0x2f9c:   	subc	%l6, %o2, %o4
	.word	0x20480004	! t0_kref+0x2fa0:   	bn,a,pt	%icc, _kref+0x2fb0
	.word	0xe5264000	! t0_kref+0x2fa4:   	st	%f18, [%i1]
	.word	0xf706001c	! t0_kref+0x2fa8:   	ld	[%i0 + %i4], %f27
	.word	0xadb10e5c	! t0_kref+0x2fac:   	fxnor	%f4, %f28, %f22
	.word	0xa5a4c835	! t0_kref+0x2fb0:   	fadds	%f19, %f21, %f18
	.word	0xe6ee5000	! t0_kref+0x2fb4:   	ldstuba	[%i1]0x80, %l3
	.word	0x99350009	! t0_kref+0x2fb8:   	srl	%l4, %o1, %o4
	.word	0x9ebb400a	! t0_kref+0x2fbc:   	xnorcc	%o5, %o2, %o7
	.word	0x9fb00116	! t0_kref+0x2fc0:   	edge32	%g0, %l6, %o7
	.word	0xd08e101a	! t0_kref+0x2fc4:   	lduba	[%i0 + %i2]0x80, %o0
	.word	0xd648a02b	! t0_kref+0x2fc8:   	ldsb	[%g2 + 0x2b], %o3
	.word	0xc0062018	! t0_kref+0x2fcc:   	ld	[%i0 + 0x18], %g0
	.word	0xd500a030	! t0_kref+0x2fd0:   	ld	[%g2 + 0x30], %f10
	.word	0xe91fbcf8	! t0_kref+0x2fd4:   	ldd	[%fp - 0x308], %f20
	.word	0xdadf5018	! t0_kref+0x2fd8:   	ldxa	[%i5 + %i0]0x80, %o5
	.word	0x80c5b918	! t0_kref+0x2fdc:   	addccc	%l6, -0x6e8, %g0
	.word	0x91400000	! t0_kref+0x2fe0:   	mov	%y, %o0
	.word	0xac22e530	! t0_kref+0x2fe4:   	sub	%o3, 0x530, %l6
	call	SYM(t0_subr2)
	.word	0xd22e7ffa	! t0_kref+0x2fec:   	stb	%o1, [%i1 - 6]
	.word	0x93a000af	! t0_kref+0x2ff0:   	fnegs	%f15, %f9
	.word	0x94e5800c	! t0_kref+0x2ff4:   	subccc	%l6, %o4, %o2
	.word	0xd82e7fe8	! t0_kref+0x2ff8:   	stb	%o4, [%i1 - 0x18]
	.word	0xe428a03a	! t0_kref+0x2ffc:   	stb	%l2, [%g2 + 0x3a]
	.word	0x92d2334b	! t0_kref+0x3000:   	umulcc	%o0, -0xcb5, %o1
	.word	0x28800004	! t0_kref+0x3004:   	bleu,a	_kref+0x3014
	.word	0xed1fbce8	! t0_kref+0x3008:   	ldd	[%fp - 0x318], %f22
	.word	0xea762000	! t0_kref+0x300c:   	stx	%l5, [%i0]
	.word	0xecd6501b	! t0_kref+0x3010:   	ldsha	[%i1 + %i3]0x80, %l6
	.word	0xd8267fe0	! t0_kref+0x3014:   	st	%o4, [%i1 - 0x20]
	.word	0xd0b01018	! t0_kref+0x3018:   	stha	%o0, [%g0 + %i0]0x80
	.word	0xa9a00539	! t0_kref+0x301c:   	fsqrts	%f25, %f20
	.word	0xef6e6008	! t0_kref+0x3020:   	prefetch	%i1 + 8, 23
	.word	0xd01e3fe8	! t0_kref+0x3024:   	ldd	[%i0 - 0x18], %o0
	.word	0x30480003	! t0_kref+0x3028:   	ba,a,pt	%icc, _kref+0x3034
	.word	0x1f054f8b	! t0_kref+0x302c:   	sethi	%hi(0x153e2c00), %o7
	.word	0x93a01a50	! t0_kref+0x3030:   	fdtoi	%f16, %f9
	.word	0x8ba000b7	! t0_kref+0x3034:   	fnegs	%f23, %f5
	.word	0xd008a023	! t0_kref+0x3038:   	ldub	[%g2 + 0x23], %o0
	.word	0x95b184c6	! t0_kref+0x303c:   	fcmpne32	%f6, %f6, %o2
	.word	0xc12f0000	! t0_kref+0x3040:   	st	%fsr, [%i4]
	.word	0x89a488bd	! t0_kref+0x3044:   	fsubs	%f18, %f29, %f4
	.word	0x36480007	! t0_kref+0x3048:   	bge,a,pt	%icc, _kref+0x3064
	.word	0xadb18f8a	! t0_kref+0x304c:   	for	%f6, %f10, %f22
	.word	0x8da50d27	! t0_kref+0x3050:   	fsmuld	%f20, %f7, %f6
	.word	0x80c5a6e8	! t0_kref+0x3054:   	addccc	%l6, 0x6e8, %g0
	.word	0xb9a108c8	! t0_kref+0x3058:   	fsubd	%f4, %f8, %f28
	.word	0x925ea3de	! t0_kref+0x305c:   	smul	%i2, 0x3de, %o1
	.word	0xae150000	! t0_kref+0x3060:   	or	%l4, %g0, %l7
	.word	0xb9b70d0c	! t0_kref+0x3064:   	fandnot1	%f28, %f12, %f28
	.word	0x95703739	! t0_kref+0x3068:   	popc	-0x8c7, %o2
	.word	0x81b20054	! t0_kref+0x306c:   	edge8l	%o0, %l4, %g0
	.word	0x3d480006	! t0_kref+0x3070:   	fbule,a,pt	%fcc0, _kref+0x3088
	.word	0xb9a688d0	! t0_kref+0x3074:   	fsubd	%f26, %f16, %f28
	call	SYM(t0_subr0)
	.word	0xd430a038	! t0_kref+0x307c:   	sth	%o2, [%g2 + 0x38]
	.word	0x95b20504	! t0_kref+0x3080:   	fcmpgt16	%f8, %f4, %o2
	.word	0xd2480019	! t0_kref+0x3084:   	ldsb	[%g0 + %i1], %o1
	.word	0x8143e054	! t0_kref+0x3088:   	membar	0x54
	.word	0x95b68177	! t0_kref+0x308c:   	edge32ln	%i2, %l7, %o2
	.word	0x95334014	! t0_kref+0x3090:   	srl	%o5, %l4, %o2
	.word	0xda50a008	! t0_kref+0x3094:   	ldsh	[%g2 + 8], %o5
	.word	0x91b28113	! t0_kref+0x3098:   	edge32	%o2, %l3, %o0
	.word	0xaf350008	! t0_kref+0x309c:   	srl	%l4, %o0, %l7
	.word	0x9646a629	! t0_kref+0x30a0:   	addc	%i2, 0x629, %o3
	.word	0xaf400000	! t0_kref+0x30a4:   	mov	%y, %l7
	.word	0xd43e0000	! t0_kref+0x30a8:   	std	%o2, [%i0]
	.word	0x31800002	! t0_kref+0x30ac:   	fba,a	_kref+0x30b4
	.word	0x0124be5c	! t0_kref+0x30b0:   	sethi	%hi(0x92f97000), %g0
	.word	0x19399996	! t0_kref+0x30b4:   	sethi	%hi(0xe6665800), %o4
	.word	0x2b480003	! t0_kref+0x30b8:   	fbug,a,pt	%fcc0, _kref+0x30c4
	.word	0xd840a020	! t0_kref+0x30bc:   	ldsw	[%g2 + 0x20], %o4
	.word	0x9f32801a	! t0_kref+0x30c0:   	srl	%o2, %i2, %o7
	.word	0x81820000	! t0_kref+0x30c4:   	wr	%o0, %g0, %y
	.word	0xef6e001c	! t0_kref+0x30c8:   	prefetch	%i0 + %i4, 23
	.word	0xc000a018	! t0_kref+0x30cc:   	ld	[%g2 + 0x18], %g0
	.word	0xa7a0189d	! t0_kref+0x30d0:   	fitos	%f29, %f19
	.word	0x9e8ea911	! t0_kref+0x30d4:   	andcc	%i2, 0x911, %o7
	.word	0xeb00a010	! t0_kref+0x30d8:   	ld	[%g2 + 0x10], %f21
	.word	0x94352eb4	! t0_kref+0x30dc:   	orn	%l4, 0xeb4, %o2
	.word	0x80bb218a	! t0_kref+0x30e0:   	xnorcc	%o4, 0x18a, %g0
	.word	0x80fce678	! t0_kref+0x30e4:   	sdivcc	%l3, 0x678, %g0
	.word	0xb5a109da	! t0_kref+0x30e8:   	fdivd	%f4, %f26, %f26
	.word	0x86102010	! t0_kref+0x30ec:   	mov	0x10, %g3
	.word	0x86a0e001	! t0_kref+0x30f0:   	subcc	%g3, 1, %g3
	.word	0x2280001e	! t0_kref+0x30f4:   	be,a	_kref+0x316c
	.word	0xd6060000	! t0_kref+0x30f8:   	ld	[%i0], %o3
	.word	0x97b2834d	! t0_kref+0x30fc:   	alignaddrl	%o2, %o5, %o3
	.word	0x9b320000	! t0_kref+0x3100:   	srl	%o0, %g0, %o5
	.word	0xe91fbee0	! t0_kref+0x3104:   	ldd	[%fp - 0x120], %f20
	.word	0xc9070018	! t0_kref+0x3108:   	ld	[%i4 + %i0], %f4
	.word	0xf4b81018	! t0_kref+0x310c:   	stda	%i2, [%g0 + %i0]0x80
	.word	0x89a389d6	! t0_kref+0x3110:   	fdivd	%f14, %f22, %f4
	.word	0x9685400d	! t0_kref+0x3114:   	addcc	%l5, %o5, %o3
	.word	0x9db4072f	! t0_kref+0x3118:   	fmuld8ulx16	%f16, %f15, %f14
	.word	0xd87e6010	! t0_kref+0x311c:   	swap	[%i1 + 0x10], %o4
	.word	0x3b480007	! t0_kref+0x3120:   	fble,a,pt	%fcc0, _kref+0x313c
	.word	0xc0070018	! t0_kref+0x3124:   	ld	[%i4 + %i0], %g0
	.word	0xd806401c	! t0_kref+0x3128:   	ld	[%i1 + %i4], %o4
	.word	0x9fb68200	! t0_kref+0x312c:   	array8	%i2, %g0, %o7
	.word	0x97a0188e	! t0_kref+0x3130:   	fitos	%f14, %f11
	.word	0xa3a0002a	! t0_kref+0x3134:   	fmovs	%f10, %f17
	.word	0x9da5c838	! t0_kref+0x3138:   	fadds	%f23, %f24, %f14
	.word	0xc12e401c	! t0_kref+0x313c:   	st	%fsr, [%i1 + %i4]
	.word	0x93400000	! t0_kref+0x3140:   	mov	%y, %o1
	.word	0x91a30d3b	! t0_kref+0x3144:   	fsmuld	%f12, %f27, %f8
	.word	0x98ba4015	! t0_kref+0x3148:   	xnorcc	%o1, %l5, %o4
	.word	0x80358000	! t0_kref+0x314c:   	orn	%l6, %g0, %g0
	.word	0xd9be501d	! t0_kref+0x3150:   	stda	%f12, [%i1 + %i5]0x80
	.word	0x968ea799	! t0_kref+0x3154:   	andcc	%i2, 0x799, %o3
	.word	0xd6e81018	! t0_kref+0x3158:   	ldstuba	[%g0 + %i0]0x80, %o3
	call	SYM(t0_subr1)
	.word	0xac74b5d1	! t0_kref+0x3160:   	udiv	%l2, -0xa2f, %l6
	.word	0xd636201c	! t0_kref+0x3164:   	sth	%o3, [%i0 + 0x1c]
	.word	0xd80e6019	! t0_kref+0x3168:   	ldub	[%i1 + 0x19], %o4
	.word	0x95a18852	! t0_kref+0x316c:   	faddd	%f6, %f18, %f10
	.word	0xc568a10c	! t0_kref+0x3170:   	prefetch	%g2 + 0x10c, 2
	.word	0xa7a309ac	! t0_kref+0x3174:   	fdivs	%f12, %f12, %f19
	.word	0xee680019	! t0_kref+0x3178:   	ldstub	[%g0 + %i1], %l7
	.word	0xde070018	! t0_kref+0x317c:   	ld	[%i4 + %i0], %o7
	.word	0x33800003	! t0_kref+0x3180:   	fbe,a	_kref+0x318c
	.word	0xad2ae008	! t0_kref+0x3184:   	sll	%o3, 0x8, %l6
	.word	0xd1be5800	! t0_kref+0x3188:   	stda	%f8, [%i1]0xc0
	.word	0xb1b50a50	! t0_kref+0x318c:   	fpadd32	%f20, %f16, %f24
	.word	0x80634017	! t0_kref+0x3190:   	subc	%o5, %l7, %g0
	.word	0xecbe101d	! t0_kref+0x3194:   	stda	%l6, [%i0 + %i5]0x80
	.word	0xa1a01911	! t0_kref+0x3198:   	fitod	%f17, %f16
	.word	0xc368a04f	! t0_kref+0x319c:   	prefetch	%g2 + 0x4f, 1
	.word	0xec3e3ff0	! t0_kref+0x31a0:   	std	%l6, [%i0 - 0x10]
	.word	0xd84e3feb	! t0_kref+0x31a4:   	ldsb	[%i0 - 0x15], %o4
	.word	0x9fc10000	! t0_kref+0x31a8:   	call	%g4
	.word	0x9835c01a	! t0_kref+0x31ac:   	orn	%l7, %i2, %o4
	.word	0x9fc00004	! t0_kref+0x31b0:   	call	%g0 + %g4
	.word	0x97a50832	! t0_kref+0x31b4:   	fadds	%f20, %f18, %f11
	.word	0x9494f826	! t0_kref+0x31b8:   	orcc	%l3, -0x7da, %o2
	.word	0x89b606ee	! t0_kref+0x31bc:   	fmul8ulx16	%f24, %f14, %f4
	.word	0x99a6c8a8	! t0_kref+0x31c0:   	fsubs	%f27, %f8, %f12
	.word	0xf300a000	! t0_kref+0x31c4:   	ld	[%g2], %f25
	.word	0x9e650015	! t0_kref+0x31c8:   	subc	%l4, %l5, %o7
	.word	0x25480003	! t0_kref+0x31cc:   	fblg,a,pt	%fcc0, _kref+0x31d8
	.word	0xaf1aa222	! t0_kref+0x31d0:   	tsubcctv	%o2, 0x222, %l7
	.word	0x9025a36d	! t0_kref+0x31d4:   	sub	%l6, 0x36d, %o0
	.word	0x25480001	! t0_kref+0x31d8:   	fblg,a,pt	%fcc0, _kref+0x31dc
	.word	0x97a00527	! t0_kref+0x31dc:   	fsqrts	%f7, %f11
	.word	0xd4ae1000	! t0_kref+0x31e0:   	stba	%o2, [%i0]0x80
	.word	0xec480018	! t0_kref+0x31e4:   	ldsb	[%g0 + %i0], %l6
	.word	0x91a00148	! t0_kref+0x31e8:   	fabsd	%f8, %f8
	.word	0xa5a00550	! t0_kref+0x31ec:   	fsqrtd	%f16, %f18
	.word	0xe6ee5000	! t0_kref+0x31f0:   	ldstuba	[%i1]0x80, %l3
	.word	0xa5a688da	! t0_kref+0x31f4:   	fsubd	%f26, %f26, %f18
	.word	0xa3a6483d	! t0_kref+0x31f8:   	fadds	%f25, %f29, %f17
	.word	0x9fc00004	! t0_kref+0x31fc:   	call	%g0 + %g4
	.word	0xae65c000	! t0_kref+0x3200:   	subc	%l7, %g0, %l7
	.word	0xcd9f5019	! t0_kref+0x3204:   	ldda	[%i5 + %i1]0x80, %f6
	.word	0xcb865000	! t0_kref+0x3208:   	lda	[%i1]0x80, %f5
	.word	0x81858000	! t0_kref+0x320c:   	wr	%l6, %g0, %y
	.word	0x25480004	! t0_kref+0x3210:   	fblg,a,pt	%fcc0, _kref+0x3220
	.word	0x001fffff	! t0_kref+0x3214:   	illtrap	0x1fffff
	.word	0xc008a002	! t0_kref+0x3218:   	ldub	[%g2 + 2], %g0
	.word	0x9ad24012	! t0_kref+0x321c:   	umulcc	%o1, %l2, %o5
	.word	0x9de3bfa0	! t0_kref+0x3220:   	save	%sp, -0x60, %sp
	.word	0x91ee001c	! t0_kref+0x3224:   	restore	%i0, %i4, %o0
	.word	0x81b240d4	! t0_kref+0x3228:   	edge16l	%o1, %l4, %g0
	.word	0xcd1e2000	! t0_kref+0x322c:   	ldd	[%i0], %f6
	.word	0xadb704ce	! t0_kref+0x3230:   	fcmpne32	%f28, %f14, %l6
	.word	0x35480008	! t0_kref+0x3234:   	fbue,a,pt	%fcc0, _kref+0x3254
	.word	0x9a028013	! t0_kref+0x3238:   	add	%o2, %l3, %o5
	.word	0xa1a0189d	! t0_kref+0x323c:   	fitos	%f29, %f16
	.word	0x99a409da	! t0_kref+0x3240:   	fdivd	%f16, %f26, %f12
	.word	0x95a6c838	! t0_kref+0x3244:   	fadds	%f27, %f24, %f10
	.word	0x81ae0ad2	! t0_kref+0x3248:   	fcmped	%fcc0, %f24, %f18
	.word	0xd048a03b	! t0_kref+0x324c:   	ldsb	[%g2 + 0x3b], %o0
	.word	0xe700a010	! t0_kref+0x3250:   	ld	[%g2 + 0x10], %f19
	.word	0x9875c00d	! t0_kref+0x3254:   	udiv	%l7, %o5, %o4
	.word	0xd2ae9018	! t0_kref+0x3258:   	stba	%o1, [%i2 + %i0]0x80
	.word	0xd01e2010	! t0_kref+0x325c:   	ldd	[%i0 + 0x10], %o0
	.word	0xb1b00fc0	! t0_kref+0x3260:   	fone	%f24
	.word	0xe51fbe00	! t0_kref+0x3264:   	ldd	[%fp - 0x200], %f18
	.word	0xa5a38925	! t0_kref+0x3268:   	fmuls	%f14, %f5, %f18
	.word	0xe6ee101a	! t0_kref+0x326c:   	ldstuba	[%i0 + %i2]0x80, %l3
	.word	0x81af0a2e	! t0_kref+0x3270:   	fcmps	%fcc0, %f28, %f14
	.word	0x93a01a28	! t0_kref+0x3274:   	fstoi	%f8, %f9
	.word	0x2d800005	! t0_kref+0x3278:   	fbg,a	_kref+0x328c
	.word	0x15150867	! t0_kref+0x327c:   	sethi	%hi(0x54219c00), %o2
	.word	0x9ee5c000	! t0_kref+0x3280:   	subccc	%l7, %g0, %o7
	.word	0x2a800006	! t0_kref+0x3284:   	bcs,a	_kref+0x329c
	.word	0xa1b186e8	! t0_kref+0x3288:   	fmul8ulx16	%f6, %f8, %f16
	.word	0x9a42c000	! t0_kref+0x328c:   	addc	%o3, %g0, %o5
	.word	0xb3a00537	! t0_kref+0x3290:   	fsqrts	%f23, %f25
	.word	0x9a25b100	! t0_kref+0x3294:   	sub	%l6, -0xf00, %o5
	.word	0xa3a508a6	! t0_kref+0x3298:   	fsubs	%f20, %f6, %f17
	.word	0x9da308ca	! t0_kref+0x329c:   	fsubd	%f12, %f10, %f14
	.word	0x39480005	! t0_kref+0x32a0:   	fbuge,a,pt	%fcc0, _kref+0x32b4
	.word	0xc048a033	! t0_kref+0x32a4:   	ldsb	[%g2 + 0x33], %g0
	.word	0xd5262008	! t0_kref+0x32a8:   	st	%f10, [%i0 + 8]
	.word	0xb9a509dc	! t0_kref+0x32ac:   	fdivd	%f20, %f28, %f28
	.word	0xabb00f39	! t0_kref+0x32b0:   	fsrc2s	%f25, %f21
	.word	0x3a480001	! t0_kref+0x32b4:   	bcc,a,pt	%icc, _kref+0x32b8
	.word	0x9276a84b	! t0_kref+0x32b8:   	udiv	%i2, 0x84b, %o1
	.word	0xada0052d	! t0_kref+0x32bc:   	fsqrts	%f13, %f22
	.word	0xd010a002	! t0_kref+0x32c0:   	lduh	[%g2 + 2], %o0
	.word	0x8185c000	! t0_kref+0x32c4:   	wr	%l7, %g0, %y
	.word	0x913b0016	! t0_kref+0x32c8:   	sra	%o4, %l6, %o0
	.word	0x99b20c9a	! t0_kref+0x32cc:   	fandnot2	%f8, %f26, %f12
	.word	0x9266800a	! t0_kref+0x32d0:   	subc	%i2, %o2, %o1
	.word	0x9a85bb36	! t0_kref+0x32d4:   	addcc	%l6, -0x4ca, %o5
	.word	0x93b50280	! t0_kref+0x32d8:   	array32	%l4, %g0, %o1
	.word	0xba102018	! t0_kref+0x32dc:   	mov	0x18, %i5
	.word	0xde10a02a	! t0_kref+0x32e0:   	lduh	[%g2 + 0x2a], %o7
	.word	0x8da5095a	! t0_kref+0x32e4:   	fmuld	%f20, %f26, %f6
	call	1f
	.empty
	.word	0xd810a03a	! t0_kref+0x32ec:   	lduh	[%g2 + 0x3a], %o4
1:	.word	0xb9b68ca9	! t0_kref+0x32f0:   	fandnot2s	%f26, %f9, %f28
	.word	0xc568a10d	! t0_kref+0x32f4:   	prefetch	%g2 + 0x10d, 2
	.word	0xd008a00b	! t0_kref+0x32f8:   	ldub	[%g2 + 0xb], %o0
	.word	0xd11fbc70	! t0_kref+0x32fc:   	ldd	[%fp - 0x390], %f8
	.word	0xf42e601b	! t0_kref+0x3300:   	stb	%i2, [%i1 + 0x1b]
	.word	0x9eb23f05	! t0_kref+0x3304:   	orncc	%o0, -0xfb, %o7
	.word	0x8056a5d4	! t0_kref+0x3308:   	umul	%i2, 0x5d4, %g0
	.word	0xc9bf5019	! t0_kref+0x330c:   	stda	%f4, [%i5 + %i1]0x80
	.word	0x9e8ca948	! t0_kref+0x3310:   	andcc	%l2, 0x948, %o7
	.word	0x81830000	! t0_kref+0x3314:   	wr	%o4, %g0, %y
	.word	0x9235000a	! t0_kref+0x3318:   	orn	%l4, %o2, %o1
	.word	0xd43f4019	! t0_kref+0x331c:   	std	%o2, [%i5 + %i1]
	.word	0xacacc009	! t0_kref+0x3320:   	andncc	%l3, %o1, %l6
	.word	0x99a00550	! t0_kref+0x3324:   	fsqrtd	%f16, %f12
	.word	0xda100019	! t0_kref+0x3328:   	lduh	[%g0 + %i1], %o5
	.word	0xda6e201d	! t0_kref+0x332c:   	ldstub	[%i0 + 0x1d], %o5
	.word	0x9ad52647	! t0_kref+0x3330:   	umulcc	%l4, 0x647, %o5
	.word	0xc04e8018	! t0_kref+0x3334:   	ldsb	[%i2 + %i0], %g0
	.word	0x89a01029	! t0_kref+0x3338:   	fstox	%f9, %f4
	.word	0x8143c000	! t0_kref+0x333c:   	stbar
	.word	0x80956697	! t0_kref+0x3340:   	orcc	%l5, 0x697, %g0
	.word	0x93702b13	! t0_kref+0x3344:   	popc	0xb13, %o1
	.word	0x9b3ea01f	! t0_kref+0x3348:   	sra	%i2, 0x1f, %o5
	.word	0xb5a0188e	! t0_kref+0x334c:   	fitos	%f14, %f26
	.word	0xd42e7ff8	! t0_kref+0x3350:   	stb	%o2, [%i1 - 8]
	.word	0x983b4015	! t0_kref+0x3354:   	xnor	%o5, %l5, %o4
	.word	0x9e95400a	! t0_kref+0x3358:   	orcc	%l5, %o2, %o7
	.word	0xb9b1ca74	! t0_kref+0x335c:   	fpadd32s	%f7, %f20, %f28
	.word	0xac36a8d7	! t0_kref+0x3360:   	orn	%i2, 0x8d7, %l6
	.word	0xe168a0cd	! t0_kref+0x3364:   	prefetch	%g2 + 0xcd, 16
	.word	0xdbe61015	! t0_kref+0x3368:   	casa	[%i0]0x80, %l5, %o5
	.word	0xb7a01896	! t0_kref+0x336c:   	fitos	%f22, %f27
	.word	0x93a0053d	! t0_kref+0x3370:   	fsqrts	%f29, %f9
	.word	0xaec50008	! t0_kref+0x3374:   	addccc	%l4, %o0, %l7
	.word	0x86102001	! t0_kref+0x3378:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x337c:   	bne,a	_kref+0x337c
	.word	0x86a0e001	! t0_kref+0x3380:   	subcc	%g3, 1, %g3
	.word	0x9a55801a	! t0_kref+0x3384:   	umul	%l6, %i2, %o5
	call	SYM(t0_subr0)
	.word	0x89b68e58	! t0_kref+0x338c:   	fxnor	%f26, %f24, %f4
	.word	0x9db18e75	! t0_kref+0x3390:   	fxnors	%f6, %f21, %f14
	.word	0x8143c000	! t0_kref+0x3394:   	stbar
	.word	0xa3b60d60	! t0_kref+0x3398:   	fnot1s	%f24, %f17
	.word	0xd01e3ff0	! t0_kref+0x339c:   	ldd	[%i0 - 0x10], %o0
	.word	0xe66e8018	! t0_kref+0x33a0:   	ldstub	[%i2 + %i0], %l3
	.word	0x8fa00029	! t0_kref+0x33a4:   	fmovs	%f9, %f7
	.word	0xe4ee501a	! t0_kref+0x33a8:   	ldstuba	[%i1 + %i2]0x80, %l2
	.word	0xdd00a030	! t0_kref+0x33ac:   	ld	[%g2 + 0x30], %f14
	.word	0x2e800007	! t0_kref+0x33b0:   	bvs,a	_kref+0x33cc
	.word	0xad2d201b	! t0_kref+0x33b4:   	sll	%l4, 0x1b, %l6
	.word	0xb5a0003c	! t0_kref+0x33b8:   	fmovs	%f28, %f26
	.word	0x9fc10000	! t0_kref+0x33bc:   	call	%g4
	.word	0xee4e6000	! t0_kref+0x33c0:   	ldsb	[%i1], %l7
	.word	0xd4163ffa	! t0_kref+0x33c4:   	lduh	[%i0 - 6], %o2
	.word	0x94228012	! t0_kref+0x33c8:   	sub	%o2, %l2, %o2
	.word	0xafab0035	! t0_kref+0x33cc:   	fmovsuge	%fcc0, %f21, %f23
	.word	0xcb200019	! t0_kref+0x33d0:   	st	%f5, [%g0 + %i1]
	.word	0x953ac017	! t0_kref+0x33d4:   	sra	%o3, %l7, %o2
	.word	0xd82e0000	! t0_kref+0x33d8:   	stb	%o4, [%i0]
	.word	0x9874c017	! t0_kref+0x33dc:   	udiv	%l3, %l7, %o4
	.word	0xda20a018	! t0_kref+0x33e0:   	st	%o5, [%g2 + 0x18]
	.word	0x3d480008	! t0_kref+0x33e4:   	fbule,a,pt	%fcc0, _kref+0x3404
	.word	0x902571b4	! t0_kref+0x33e8:   	sub	%l5, -0xe4c, %o0
	.word	0xc9be5813	! t0_kref+0x33ec:   	stda	%f4, [%i1 + %l3]0xc0
	.word	0x9034c009	! t0_kref+0x33f0:   	orn	%l3, %o1, %o0
	.word	0xe1380019	! t0_kref+0x33f4:   	std	%f16, [%g0 + %i1]
	.word	0xada488c6	! t0_kref+0x33f8:   	fsubd	%f18, %f6, %f22
	.word	0xd0180019	! t0_kref+0x33fc:   	ldd	[%g0 + %i1], %o0
	.word	0x98732cb6	! t0_kref+0x3400:   	udiv	%o4, 0xcb6, %o4
	.word	0x801576ba	! t0_kref+0x3404:   	or	%l5, -0x946, %g0
	.word	0x9fc10000	! t0_kref+0x3408:   	call	%g4
	.word	0x91b54000	! t0_kref+0x340c:   	edge8	%l5, %g0, %o0
	.word	0x9bb28448	! t0_kref+0x3410:   	fcmpne16	%f10, %f8, %o5
	.word	0xc00e8018	! t0_kref+0x3414:   	ldub	[%i2 + %i0], %g0
	.word	0xafa74938	! t0_kref+0x3418:   	fmuls	%f29, %f24, %f23
	.word	0xec40a020	! t0_kref+0x341c:   	ldsw	[%g2 + 0x20], %l6
	.word	0x31480002	! t0_kref+0x3420:   	fba,a,pt	%fcc0, _kref+0x3428
	.word	0xd726200c	! t0_kref+0x3424:   	st	%f11, [%i0 + 0xc]
	.word	0x805a6b35	! t0_kref+0x3428:   	smul	%o1, 0xb35, %g0
	.word	0xc00e6013	! t0_kref+0x342c:   	ldub	[%i1 + 0x13], %g0
	.word	0x9804c017	! t0_kref+0x3430:   	add	%l3, %l7, %o4
	.word	0x8143c000	! t0_kref+0x3434:   	stbar
	.word	0x9824f046	! t0_kref+0x3438:   	sub	%l3, -0xfba, %o4
	.word	0x9e8e8014	! t0_kref+0x343c:   	andcc	%i2, %l4, %o7
	.word	0x9a5ae274	! t0_kref+0x3440:   	smul	%o3, 0x274, %o5
	.word	0xd22e601c	! t0_kref+0x3444:   	stb	%o1, [%i1 + 0x1c]
	.word	0xe51fbc00	! t0_kref+0x3448:   	ldd	[%fp - 0x400], %f18
	.word	0x81ad4abc	! t0_kref+0x344c:   	fcmpes	%fcc0, %f21, %f28
	sethi	%hi(2f), %o7
	.word	0xe40be084	! t0_kref+0x3454:   	ldub	[%o7 + 0x84], %l2
	.word	0xa41ca00c	! t0_kref+0x3458:   	xor	%l2, 0xc, %l2
	.word	0xe42be084	! t0_kref+0x345c:   	stb	%l2, [%o7 + 0x84]
	.word	0x81dbe084	! t0_kref+0x3460:   	flush	%o7 + 0x84
	.word	0x8014c00c	! t0_kref+0x3464:   	or	%l3, %o4, %g0
	.word	0xec4e3ff4	! t0_kref+0x3468:   	ldsb	[%i0 - 0xc], %l6
	.word	0xc006001c	! t0_kref+0x346c:   	ld	[%i0 + %i4], %g0
	.word	0x8ba00037	! t0_kref+0x3470:   	fmovs	%f23, %f5
	.word	0xe9e65015	! t0_kref+0x3474:   	casa	[%i1]0x80, %l5, %l4
	.word	0xd19e1a1b	! t0_kref+0x3478:   	ldda	[%i0 + %i3]0xd0, %f8
	.word	0x9482800c	! t0_kref+0x347c:   	addcc	%o2, %o4, %o2
	.word	0x8fa00525	! t0_kref+0x3480:   	fsqrts	%f5, %f7
2:	.word	0xcdbf5018	! t0_kref+0x3484:   	stda	%f6, [%i5 + %i0]0x80
	.word	0x9e8af317	! t0_kref+0x3488:   	andcc	%o3, -0xce9, %o7
	.word	0xd016201c	! t0_kref+0x348c:   	lduh	[%i0 + 0x1c], %o0
	.word	0x91a00132	! t0_kref+0x3490:   	fabss	%f18, %f8
	.word	0xd840a030	! t0_kref+0x3494:   	ldsw	[%g2 + 0x30], %o4
	.word	0x39800002	! t0_kref+0x3498:   	fbuge,a	_kref+0x34a0
	.word	0x810da4d0	! t0_kref+0x349c:   	tsubcc	%l6, 0x4d0, %g0
	.word	0x932cc00b	! t0_kref+0x34a0:   	sll	%l3, %o3, %o1
	.word	0xda4e001a	! t0_kref+0x34a4:   	ldsb	[%i0 + %i2], %o5
	.word	0xf7263ffc	! t0_kref+0x34a8:   	st	%f27, [%i0 - 4]
	.word	0xf700a030	! t0_kref+0x34ac:   	ld	[%g2 + 0x30], %f27
	.word	0xd0780018	! t0_kref+0x34b0:   	swap	[%g0 + %i0], %o0
	.word	0xd4d61000	! t0_kref+0x34b4:   	ldsha	[%i0]0x80, %o2
	.word	0x39800005	! t0_kref+0x34b8:   	fbuge,a	_kref+0x34cc
	.word	0xadb48dd6	! t0_kref+0x34bc:   	fnand	%f18, %f22, %f22
	.word	0x2d2d6baf	! t0_kref+0x34c0:   	sethi	%hi(0xb5aebc00), %l6
	.word	0x9fc00004	! t0_kref+0x34c4:   	call	%g0 + %g4
	.word	0x973cc008	! t0_kref+0x34c8:   	sra	%l3, %o0, %o3
	.word	0x91a288c6	! t0_kref+0x34cc:   	fsubd	%f10, %f6, %f8
	call	SYM(t0_subr2)
	.word	0xd4400019	! t0_kref+0x34d4:   	ldsw	[%g0 + %i1], %o2
	.word	0xb7a18827	! t0_kref+0x34d8:   	fadds	%f6, %f7, %f27
	.word	0xada00034	! t0_kref+0x34dc:   	fmovs	%f20, %f22
	.word	0xe408675c	! t0_kref+0x34e0:   	ldub	[%g1 + 0x75c], %l2
	.word	0xa41ca00c	! t0_kref+0x34e4:   	xor	%l2, 0xc, %l2
	.word	0xe428675c	! t0_kref+0x34e8:   	stb	%l2, [%g1 + 0x75c]
	.word	0x81d8675c	! t0_kref+0x34ec:   	flush	%g1 + 0x75c
	.word	0x9e32a444	! t0_kref+0x34f0:   	orn	%o2, 0x444, %o7
2:	.word	0xe900a018	! t0_kref+0x34f4:   	ld	[%g2 + 0x18], %f20
	.word	0xd19eda19	! t0_kref+0x34f8:   	ldda	[%i3 + %i1]0xd0, %f8
	.word	0xa9a01050	! t0_kref+0x34fc:   	fdtox	%f16, %f20
	.word	0x81400000	! t0_kref+0x3500:   	mov	%y, %g0
	.word	0xef68a00c	! t0_kref+0x3504:   	prefetch	%g2 + 0xc, 23
	.word	0xa9a14833	! t0_kref+0x3508:   	fadds	%f5, %f19, %f20
	.word	0x89a0188d	! t0_kref+0x350c:   	fitos	%f13, %f4
	.word	0xe500a020	! t0_kref+0x3510:   	ld	[%g2 + 0x20], %f18
	.word	0x9de3bfa0	! t0_kref+0x3514:   	save	%sp, -0x60, %sp
	.word	0xadeea9ae	! t0_kref+0x3518:   	restore	%i2, 0x9ae, %l6
	.word	0xf420a038	! t0_kref+0x351c:   	st	%i2, [%g2 + 0x38]
	.word	0x94f68013	! t0_kref+0x3520:   	udivcc	%i2, %l3, %o2
	.word	0x150c4c7c	! t0_kref+0x3524:   	sethi	%hi(0x3131f000), %o2
	.word	0xe83e2010	! t0_kref+0x3528:   	std	%l4, [%i0 + 0x10]
	.word	0xbbb1ce6a	! t0_kref+0x352c:   	fxnors	%f7, %f10, %f29
	.word	0xec50a02a	! t0_kref+0x3530:   	ldsh	[%g2 + 0x2a], %l6
	.word	0x9da000b5	! t0_kref+0x3534:   	fnegs	%f21, %f14
	.word	0xb9b007a4	! t0_kref+0x3538:   	fpackfix	%f4, %f28
	.word	0x9efea248	! t0_kref+0x353c:   	sdivcc	%i2, 0x248, %o7
	.word	0xec9f5019	! t0_kref+0x3540:   	ldda	[%i5 + %i1]0x80, %l6
	.word	0xde10a020	! t0_kref+0x3544:   	lduh	[%g2 + 0x20], %o7
	.word	0x2d480008	! t0_kref+0x3548:   	fbg,a,pt	%fcc0, _kref+0x3568
	.word	0xdd1e401d	! t0_kref+0x354c:   	ldd	[%i1 + %i5], %f14
	.word	0x2b800008	! t0_kref+0x3550:   	fbug,a	_kref+0x3570
	.word	0xe07f0018	! t0_kref+0x3554:   	swap	[%i4 + %i0], %l0
	.word	0x9424c00b	! t0_kref+0x3558:   	sub	%l3, %o3, %o2
	.word	0xa9a108d6	! t0_kref+0x355c:   	fsubd	%f4, %f22, %f20
	call	SYM(t0_subr3)
	.word	0xbba01899	! t0_kref+0x3564:   	fitos	%f25, %f29
	.word	0x2d181f1c	! t0_kref+0x3568:   	sethi	%hi(0x607c7000), %l6
	.word	0x9da00031	! t0_kref+0x356c:   	fmovs	%f17, %f14
	.word	0xda28a01a	! t0_kref+0x3570:   	stb	%o5, [%g2 + 0x1a]
	.word	0xe4362010	! t0_kref+0x3574:   	sth	%l2, [%i0 + 0x10]
	.word	0xd208a000	! t0_kref+0x3578:   	ldub	[%g2], %o1
	.word	0x9f3d2005	! t0_kref+0x357c:   	sra	%l4, 0x5, %o7
	.word	0xd296501b	! t0_kref+0x3580:   	lduha	[%i1 + %i3]0x80, %o1
	.word	0x9fc00004	! t0_kref+0x3584:   	call	%g0 + %g4
	.word	0xe86e200c	! t0_kref+0x3588:   	ldstub	[%i0 + 0xc], %l4
	.word	0x23480005	! t0_kref+0x358c:   	fbne,a,pt	%fcc0, _kref+0x35a0
	.word	0x932a000d	! t0_kref+0x3590:   	sll	%o0, %o5, %o1
	.word	0xada000a6	! t0_kref+0x3594:   	fnegs	%f6, %f22
	.word	0x99b54140	! t0_kref+0x3598:   	edge32l	%l5, %g0, %o4
	.word	0x9ba74837	! t0_kref+0x359c:   	fadds	%f29, %f23, %f13
	.word	0x950dc000	! t0_kref+0x35a0:   	tsubcc	%l7, %g0, %o2
	.word	0x3c480003	! t0_kref+0x35a4:   	bpos,a,pt	%icc, _kref+0x35b0
	.word	0x98bb790c	! t0_kref+0x35a8:   	xnorcc	%o5, -0x6f4, %o4
	.word	0xea2e201f	! t0_kref+0x35ac:   	stb	%l5, [%i0 + 0x1f]
	.word	0xea30a00a	! t0_kref+0x35b0:   	sth	%l5, [%g2 + 0xa]
	.word	0x9de3bfa0	! t0_kref+0x35b4:   	save	%sp, -0x60, %sp
	.word	0x91e82a35	! t0_kref+0x35b8:   	restore	%g0, 0xa35, %o0
	.word	0x3e480006	! t0_kref+0x35bc:   	bvc,a,pt	%icc, _kref+0x35d4
	.word	0x8ba000af	! t0_kref+0x35c0:   	fnegs	%f15, %f5
	.word	0x99b18a69	! t0_kref+0x35c4:   	fpadd32s	%f6, %f9, %f12
	.word	0x9fc10000	! t0_kref+0x35c8:   	call	%g4
	.word	0xafa01898	! t0_kref+0x35cc:   	fitos	%f24, %f23
	.word	0x31800008	! t0_kref+0x35d0:   	fba,a	_kref+0x35f0
	.word	0x89b44734	! t0_kref+0x35d4:   	fmuld8ulx16	%f17, %f20, %f4
	.word	0xb1b007ae	! t0_kref+0x35d8:   	fpackfix	%f14, %f24
	.word	0xf7060000	! t0_kref+0x35dc:   	ld	[%i0], %f27
	.word	0xa5a00138	! t0_kref+0x35e0:   	fabss	%f24, %f18
	.word	0x9810000b	! t0_kref+0x35e4:   	mov	%o3, %o4
	.word	0x33480007	! t0_kref+0x35e8:   	fbe,a,pt	%fcc0, _kref+0x3604
	.word	0xc078a020	! t0_kref+0x35ec:   	swap	[%g2 + 0x20], %g0
	.word	0x81858000	! t0_kref+0x35f0:   	wr	%l6, %g0, %y
	.word	0xd6363ff4	! t0_kref+0x35f4:   	sth	%o3, [%i0 - 0xc]
	.word	0xfb871019	! t0_kref+0x35f8:   	lda	[%i4 + %i1]0x80, %f29
	.word	0xf91e7ff0	! t0_kref+0x35fc:   	ldd	[%i1 - 0x10], %f28
	.word	0xadb5851a	! t0_kref+0x3600:   	fcmpgt16	%f22, %f26, %l6
	.word	0x9422fae5	! t0_kref+0x3604:   	sub	%o3, -0x51b, %o2
	.word	0xb1b00cd0	! t0_kref+0x3608:   	fnot2	%f16, %f24
	.word	0x81b20514	! t0_kref+0x360c:   	fcmpgt16	%f8, %f20, %g0
	.word	0x9a14c01a	! t0_kref+0x3610:   	or	%l3, %i2, %o5
	.word	0xaf3e800a	! t0_kref+0x3614:   	sra	%i2, %o2, %l7
	.word	0x85800015	! t0_kref+0x3618:   	mov	%l5, %ccr
	.word	0x94b4bd7e	! t0_kref+0x361c:   	orncc	%l2, -0x282, %o2
	.word	0xc0d01019	! t0_kref+0x3620:   	ldsha	[%g0 + %i1]0x80, %g0
	.word	0x97408000	! t0_kref+0x3624:   	mov	%ccr, %o3
	.word	0xabb30e6b	! t0_kref+0x3628:   	fxnors	%f12, %f11, %f21
	.word	0xe9ee501d	! t0_kref+0x362c:   	prefetcha	%i1 + %i5, 20
	.word	0xb1b34aad	! t0_kref+0x3630:   	fpsub16s	%f13, %f13, %f24
	.word	0x99a00036	! t0_kref+0x3634:   	fmovs	%f22, %f12
	.word	0x31480001	! t0_kref+0x3638:   	fba,a,pt	%fcc0, _kref+0x363c
	.word	0xb5a108d2	! t0_kref+0x363c:   	fsubd	%f4, %f18, %f26
	.word	0xe5801019	! t0_kref+0x3640:   	lda	[%g0 + %i1]0x80, %f18
	.word	0xee00a028	! t0_kref+0x3644:   	ld	[%g2 + 0x28], %l7
	.word	0x001fffff	! t0_kref+0x3648:   	illtrap	0x1fffff
	.word	0xac0376ef	! t0_kref+0x364c:   	add	%o5, -0x911, %l6
	.word	0xace68009	! t0_kref+0x3650:   	subccc	%i2, %o1, %l6
	.word	0xadb28053	! t0_kref+0x3654:   	edge8l	%o2, %l3, %l6
	.word	0x94acbd26	! t0_kref+0x3658:   	andncc	%l2, -0x2da, %o2
	.word	0x81ab0ac4	! t0_kref+0x365c:   	fcmped	%fcc0, %f12, %f4
	.word	0x9fc10000	! t0_kref+0x3660:   	call	%g4
	.word	0x8fa00533	! t0_kref+0x3664:   	fsqrts	%f19, %f7
	.word	0xafa0052f	! t0_kref+0x3668:   	fsqrts	%f15, %f23
	.word	0x91400000	! t0_kref+0x366c:   	mov	%y, %o0
	.word	0xd11e3ff0	! t0_kref+0x3670:   	ldd	[%i0 - 0x10], %f8
	.word	0x95b4833a	! t0_kref+0x3674:   	bmask	%l2, %i2, %o2
	.word	0xea7e3ff8	! t0_kref+0x3678:   	swap	[%i0 - 8], %l5
	.word	0xed6e001c	! t0_kref+0x367c:   	prefetch	%i0 + %i4, 22
	.word	0x97b28036	! t0_kref+0x3680:   	edge8n	%o2, %l6, %o3
	.word	0xcf20a018	! t0_kref+0x3684:   	st	%f7, [%g2 + 0x18]
	.word	0xae33400a	! t0_kref+0x3688:   	orn	%o5, %o2, %l7
	.word	0x9de3bfa0	! t0_kref+0x368c:   	save	%sp, -0x60, %sp
	.word	0xba5e4018	! t0_kref+0x3690:   	smul	%i1, %i0, %i5
	.word	0x81eebb9f	! t0_kref+0x3694:   	restore	%i2, -0x461, %g0
	.word	0xb7a50929	! t0_kref+0x3698:   	fmuls	%f20, %f9, %f27
	.word	0x9fc00004	! t0_kref+0x369c:   	call	%g0 + %g4
	.word	0x99a0002d	! t0_kref+0x36a0:   	fmovs	%f13, %f12
	.word	0x9de3bfa0	! t0_kref+0x36a4:   	save	%sp, -0x60, %sp
	.word	0x9bef4019	! t0_kref+0x36a8:   	restore	%i5, %i1, %o5
	.word	0x9615c015	! t0_kref+0x36ac:   	or	%l7, %l5, %o3
	.word	0x9a223147	! t0_kref+0x36b0:   	sub	%o0, -0xeb9, %o5
	sethi	%hi(2f), %o7
	.word	0xe40be2e4	! t0_kref+0x36b8:   	ldub	[%o7 + 0x2e4], %l2
	.word	0xa41ca00c	! t0_kref+0x36bc:   	xor	%l2, 0xc, %l2
	.word	0xe42be2e4	! t0_kref+0x36c0:   	stb	%l2, [%o7 + 0x2e4]
	.word	0x81dbe2e4	! t0_kref+0x36c4:   	flush	%o7 + 0x2e4
	.word	0x3b480003	! t0_kref+0x36c8:   	fble,a,pt	%fcc0, _kref+0x36d4
	.word	0xee7f0018	! t0_kref+0x36cc:   	swap	[%i4 + %i0], %l7
	.word	0xc12e401c	! t0_kref+0x36d0:   	st	%fsr, [%i1 + %i4]
	.word	0xac1364c5	! t0_kref+0x36d4:   	or	%o5, 0x4c5, %l6
	.word	0xec56401b	! t0_kref+0x36d8:   	ldsh	[%i1 + %i3], %l6
	.word	0x98124014	! t0_kref+0x36dc:   	or	%o1, %l4, %o4
	.word	0xb5b58c86	! t0_kref+0x36e0:   	fandnot2	%f22, %f6, %f26
2:	.word	0xf1be5897	! t0_kref+0x36e4:   	stda	%f24, [%i1 + %l7]0xc4
	.word	0x8bb48e36	! t0_kref+0x36e8:   	fands	%f18, %f22, %f5
	.word	0x9afd0008	! t0_kref+0x36ec:   	sdivcc	%l4, %o0, %o5
	.word	0xb1b0076a	! t0_kref+0x36f0:   	fpack16	%f10, %f24
	.word	0x9863000c	! t0_kref+0x36f4:   	subc	%o4, %o4, %o4
	.word	0xe168a003	! t0_kref+0x36f8:   	prefetch	%g2 + 3, 16
	.word	0xc026201c	! t0_kref+0x36fc:   	clr	[%i0 + 0x1c]
	.word	0xd2366018	! t0_kref+0x3700:   	sth	%o1, [%i1 + 0x18]
	.word	0x010552e4	! t0_kref+0x3704:   	sethi	%hi(0x154b9000), %g0
	.word	0xa5a289d2	! t0_kref+0x3708:   	fdivd	%f10, %f18, %f18
	.word	0xe6f6101d	! t0_kref+0x370c:   	stxa	%l3, [%i0 + %i5]0x80
	.word	0x9140c000	! t0_kref+0x3710:   	mov	%asi, %o0
	.word	0xa5b70a0e	! t0_kref+0x3714:   	fpadd16	%f28, %f14, %f18
	.word	0xe42e0000	! t0_kref+0x3718:   	stb	%l2, [%i0]
	.word	0x89a00552	! t0_kref+0x371c:   	fsqrtd	%f18, %f4
	.word	0x38480004	! t0_kref+0x3720:   	bgu,a,pt	%icc, _kref+0x3730
	.word	0x949d0008	! t0_kref+0x3724:   	xorcc	%l4, %o0, %o2
	.word	0x989c8012	! t0_kref+0x3728:   	xorcc	%l2, %l2, %o4
	.word	0x33800001	! t0_kref+0x372c:   	fbe,a	_kref+0x3730
	.word	0x98b2c00d	! t0_kref+0x3730:   	orncc	%o3, %o5, %o4
	.word	0x9115bc72	! t0_kref+0x3734:   	taddcctv	%l6, -0x38e, %o0
	.word	0x81af0aca	! t0_kref+0x3738:   	fcmped	%fcc0, %f28, %f10
	.word	0xc768a102	! t0_kref+0x373c:   	prefetch	%g2 + 0x102, 3
	.word	0x93408000	! t0_kref+0x3740:   	mov	%ccr, %o1
	.word	0xee08a033	! t0_kref+0x3744:   	ldub	[%g2 + 0x33], %l7
	.word	0x81b2c116	! t0_kref+0x3748:   	edge32	%o3, %l6, %g0
	.word	0xda28a013	! t0_kref+0x374c:   	stb	%o5, [%g2 + 0x13]
	.word	0xbbb50e2a	! t0_kref+0x3750:   	fands	%f20, %f10, %f29
	.word	0xe4ee9018	! t0_kref+0x3754:   	ldstuba	[%i2 + %i0]0x80, %l2
	.word	0xea7e6018	! t0_kref+0x3758:   	swap	[%i1 + 0x18], %l5
	.word	0x8094c015	! t0_kref+0x375c:   	orcc	%l3, %l5, %g0
	.word	0x95b50280	! t0_kref+0x3760:   	array32	%l4, %g0, %o2
	.word	0xad3a000c	! t0_kref+0x3764:   	sra	%o0, %o4, %l6
	.word	0xada688ce	! t0_kref+0x3768:   	fsubd	%f26, %f14, %f22
	.word	0xb5b687cc	! t0_kref+0x376c:   	pdist	%f26, %f12, %f26
	.word	0xc0f75018	! t0_kref+0x3770:   	stxa	%g0, [%i5 + %i0]0x80
	.word	0xae54c009	! t0_kref+0x3774:   	umul	%l3, %o1, %l7
	.word	0xb1a288ca	! t0_kref+0x3778:   	fsubd	%f10, %f10, %f24
	.word	0xd420a038	! t0_kref+0x377c:   	st	%o2, [%g2 + 0x38]
	.word	0xda48a03a	! t0_kref+0x3780:   	ldsb	[%g2 + 0x3a], %o5
	.word	0xaf05fd98	! t0_kref+0x3784:   	taddcc	%l7, -0x268, %l7
	.word	0xa1a18836	! t0_kref+0x3788:   	fadds	%f6, %f22, %f16
	.word	0x98b50015	! t0_kref+0x378c:   	orncc	%l4, %l5, %o4
	.word	0x86102002	! t0_kref+0x3790:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x3794:   	bne,a	_kref+0x3794
	.word	0x86a0e001	! t0_kref+0x3798:   	subcc	%g3, 1, %g3
	.word	0x91b48e72	! t0_kref+0x379c:   	fxnors	%f18, %f18, %f8
	.word	0x9de3bfa0	! t0_kref+0x37a0:   	save	%sp, -0x60, %sp
	.word	0x9fe82698	! t0_kref+0x37a4:   	restore	%g0, 0x698, %o7
	.word	0x80e5b4e9	! t0_kref+0x37a8:   	subccc	%l6, -0xb17, %g0
	.word	0xd6780019	! t0_kref+0x37ac:   	swap	[%g0 + %i1], %o3
	.word	0x81ad4a34	! t0_kref+0x37b0:   	fcmps	%fcc0, %f21, %f20
	.word	0xada0055c	! t0_kref+0x37b4:   	fsqrtd	%f28, %f22
	.word	0xc12e401c	! t0_kref+0x37b8:   	st	%fsr, [%i1 + %i4]
	.word	0x39800004	! t0_kref+0x37bc:   	fbuge,a	_kref+0x37cc
	.word	0xa1a108d0	! t0_kref+0x37c0:   	fsubd	%f4, %f16, %f16
	.word	0x813cc016	! t0_kref+0x37c4:   	sra	%l3, %l6, %g0
	.word	0xdb267ff8	! t0_kref+0x37c8:   	st	%f13, [%i1 - 8]
	.word	0x9e727f4d	! t0_kref+0x37cc:   	udiv	%o1, -0xb3, %o7
	.word	0xac72c01a	! t0_kref+0x37d0:   	udiv	%o3, %i2, %l6
	.word	0xda26001c	! t0_kref+0x37d4:   	st	%o5, [%i0 + %i4]
	.word	0xa1b64638	! t0_kref+0x37d8:   	fmul8x16	%f25, %f24, %f16
	.word	0x99b484d8	! t0_kref+0x37dc:   	fcmpne32	%f18, %f24, %o4
	.word	0x33480002	! t0_kref+0x37e0:   	fbe,a,pt	%fcc0, _kref+0x37e8
	.word	0xed1fbe88	! t0_kref+0x37e4:   	ldd	[%fp - 0x178], %f22
	.word	0xe4086a7c	! t0_kref+0x37e8:   	ldub	[%g1 + 0xa7c], %l2
	.word	0xa41ca00c	! t0_kref+0x37ec:   	xor	%l2, 0xc, %l2
	.word	0xe4286a7c	! t0_kref+0x37f0:   	stb	%l2, [%g1 + 0xa7c]
	.word	0x81d86a7c	! t0_kref+0x37f4:   	flush	%g1 + 0xa7c
	.word	0x91b009bc	! t0_kref+0x37f8:   	fexpand	%f28, %f8
	.word	0xe820a000	! t0_kref+0x37fc:   	st	%l4, [%g2]
	.word	0x33800005	! t0_kref+0x3800:   	fbe,a	_kref+0x3814
	.word	0x1125d91a	! t0_kref+0x3804:   	sethi	%hi(0x97646800), %o0
	.word	0x90e2c012	! t0_kref+0x3808:   	subccc	%o3, %l2, %o0
	.word	0xee0e7fe0	! t0_kref+0x380c:   	ldub	[%i1 - 0x20], %l7
	.word	0xd6ee101a	! t0_kref+0x3810:   	ldstuba	[%i0 + %i2]0x80, %o3
2:	.word	0xb5a0052f	! t0_kref+0x3814:   	fsqrts	%f15, %f26
	.word	0xd4070019	! t0_kref+0x3818:   	ld	[%i4 + %i1], %o2
	.word	0x9726801a	! t0_kref+0x381c:   	mulscc	%i2, %i2, %o3
	.word	0x9fc00004	! t0_kref+0x3820:   	call	%g0 + %g4
	.word	0xafa01898	! t0_kref+0x3824:   	fitos	%f24, %f23
	.word	0x25800007	! t0_kref+0x3828:   	fblg,a	_kref+0x3844
	.word	0x8584e13d	! t0_kref+0x382c:   	wr	%l3, 0x13d, %ccr
	.word	0x95a00024	! t0_kref+0x3830:   	fmovs	%f4, %f10
	.word	0xa1a1083c	! t0_kref+0x3834:   	fadds	%f4, %f28, %f16
	.word	0xe920a028	! t0_kref+0x3838:   	st	%f20, [%g2 + 0x28]
	.word	0x31800005	! t0_kref+0x383c:   	fba,a	_kref+0x3850
	.word	0xaba000b5	! t0_kref+0x3840:   	fnegs	%f21, %f21
	.word	0x1b15bf70	! t0_kref+0x3844:   	sethi	%hi(0x56fdc000), %o5
	.word	0xadb0076e	! t0_kref+0x3848:   	fpack16	%f14, %f22
	.word	0x95b4800b	! t0_kref+0x384c:   	edge8	%l2, %o3, %o2
	.word	0xa1b60c84	! t0_kref+0x3850:   	fandnot2	%f24, %f4, %f16
	.word	0xda680019	! t0_kref+0x3854:   	ldstub	[%g0 + %i1], %o5
	.word	0xa5a189da	! t0_kref+0x3858:   	fdivd	%f6, %f26, %f18
	.word	0xaec2400a	! t0_kref+0x385c:   	addccc	%o1, %o2, %l7
	.word	0x90aa344f	! t0_kref+0x3860:   	andncc	%o0, -0xbb1, %o0
	.word	0xd64e8018	! t0_kref+0x3864:   	ldsb	[%i2 + %i0], %o3
	.word	0x988da0e0	! t0_kref+0x3868:   	andcc	%l6, 0xe0, %o4
	.word	0xf7260000	! t0_kref+0x386c:   	st	%f27, [%i0]
	.word	0x98b54017	! t0_kref+0x3870:   	orncc	%l5, %l7, %o4
	.word	0x9da4482f	! t0_kref+0x3874:   	fadds	%f17, %f15, %f14
	.word	0xb8103fe0	! t0_kref+0x3878:   	mov	0xffffffe0, %i4
	.word	0x86102001	! t0_kref+0x387c:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x3880:   	bne,a	_kref+0x3880
	.word	0x86a0e001	! t0_kref+0x3884:   	subcc	%g3, 1, %g3
	.word	0x81400000	! t0_kref+0x3888:   	mov	%y, %g0
	.word	0x86102002	! t0_kref+0x388c:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x3890:   	bne,a	_kref+0x3890
	.word	0x86a0e001	! t0_kref+0x3894:   	subcc	%g3, 1, %g3
	.word	0xa3a00528	! t0_kref+0x3898:   	fsqrts	%f8, %f17
	.word	0x8054c000	! t0_kref+0x389c:   	umul	%l3, %g0, %g0
	.word	0x8055e2a6	! t0_kref+0x38a0:   	umul	%l7, 0x2a6, %g0
	.word	0xd6ee101a	! t0_kref+0x38a4:   	ldstuba	[%i0 + %i2]0x80, %o3
	.word	0x2d480005	! t0_kref+0x38a8:   	fbg,a,pt	%fcc0, _kref+0x38bc
	.word	0x9654800c	! t0_kref+0x38ac:   	umul	%l2, %o4, %o3
	.word	0xa5b20d1c	! t0_kref+0x38b0:   	fandnot1	%f8, %f28, %f18
	.word	0x89b68d3c	! t0_kref+0x38b4:   	fandnot1s	%f26, %f28, %f4
	.word	0xd8267ffc	! t0_kref+0x38b8:   	st	%o4, [%i1 - 4]
	.word	0xe51fbef8	! t0_kref+0x38bc:   	ldd	[%fp - 0x108], %f18
	.word	0x9da0052e	! t0_kref+0x38c0:   	fsqrts	%f14, %f14
	.word	0xda066000	! t0_kref+0x38c4:   	ld	[%i1], %o5
	.word	0xe5e65014	! t0_kref+0x38c8:   	casa	[%i1]0x80, %l4, %l2
	.word	0x92382389	! t0_kref+0x38cc:   	xnor	%g0, 0x389, %o1
	.word	0xe8300018	! t0_kref+0x38d0:   	sth	%l4, [%g0 + %i0]
	.word	0xaba6882b	! t0_kref+0x38d4:   	fadds	%f26, %f11, %f21
	.word	0xd4de101d	! t0_kref+0x38d8:   	ldxa	[%i0 + %i5]0x80, %o2
	.word	0xf51fbc70	! t0_kref+0x38dc:   	ldd	[%fp - 0x390], %f26
	.word	0x81af0ab8	! t0_kref+0x38e0:   	fcmpes	%fcc0, %f28, %f24
	.word	0x2d480006	! t0_kref+0x38e4:   	fbg,a,pt	%fcc0, _kref+0x38fc
	.word	0x98bceb80	! t0_kref+0x38e8:   	xnorcc	%l3, 0xb80, %o4
	.word	0xac1366cb	! t0_kref+0x38ec:   	or	%o5, 0x6cb, %l6
	.word	0x9fc00004	! t0_kref+0x38f0:   	call	%g0 + %g4
	.word	0xea36401b	! t0_kref+0x38f4:   	sth	%l5, [%i1 + %i3]
	.word	0xf4263ff0	! t0_kref+0x38f8:   	st	%i2, [%i0 - 0x10]
	.word	0xada408ce	! t0_kref+0x38fc:   	fsubd	%f16, %f14, %f22
	.word	0x81ab0ada	! t0_kref+0x3900:   	fcmped	%fcc0, %f12, %f26
	.word	0xd47e3ff8	! t0_kref+0x3904:   	swap	[%i0 - 8], %o2
	.word	0x8052800a	! t0_kref+0x3908:   	umul	%o2, %o2, %g0
	.word	0xee367fe0	! t0_kref+0x390c:   	sth	%l7, [%i1 - 0x20]
	.word	0xc10f0005	! t0_kref+0x3910:   	ld	[%i4 + %g5], %fsr
	.word	0x9de3bfa0	! t0_kref+0x3914:   	save	%sp, -0x60, %sp
	.word	0x97ef401a	! t0_kref+0x3918:   	restore	%i5, %i2, %o3
	.word	0x8610200d	! t0_kref+0x391c:   	mov	0xd, %g3
	.word	0x86a0e001	! t0_kref+0x3920:   	subcc	%g3, 1, %g3
	.word	0x22800010	! t0_kref+0x3924:   	be,a	_kref+0x3964
	.word	0x905ea5e4	! t0_kref+0x3928:   	smul	%i2, 0x5e4, %o0
	.word	0xa7a24924	! t0_kref+0x392c:   	fmuls	%f9, %f4, %f19
	.word	0xda10a008	! t0_kref+0x3930:   	lduh	[%g2 + 8], %o5
	.word	0xf9ee501d	! t0_kref+0x3934:   	prefetcha	%i1 + %i5, 28
	.word	0x965a61e3	! t0_kref+0x3938:   	smul	%o1, 0x1e3, %o3
	.word	0xa1a289da	! t0_kref+0x393c:   	fdivd	%f10, %f26, %f16
	.word	0x23800005	! t0_kref+0x3940:   	fbne,a	_kref+0x3954
	.word	0xc0280018	! t0_kref+0x3944:   	clrb	[%g0 + %i0]
	.word	0xf11f4019	! t0_kref+0x3948:   	ldd	[%i5 + %i1], %f24
	.word	0xd726001c	! t0_kref+0x394c:   	st	%f11, [%i0 + %i4]
	.word	0x91400000	! t0_kref+0x3950:   	mov	%y, %o0
	.word	0x81daf131	! t0_kref+0x3954:   	flush	%o3 - 0xecf
	.word	0xd60e3fe8	! t0_kref+0x3958:   	ldub	[%i0 - 0x18], %o3
	.word	0x89a589c8	! t0_kref+0x395c:   	fdivd	%f22, %f8, %f4
	.word	0x2d2c48a6	! t0_kref+0x3960:   	sethi	%hi(0xb1229800), %l6
	.word	0x99b20e65	! t0_kref+0x3964:   	fxnors	%f8, %f5, %f12
	.word	0x98c57781	! t0_kref+0x3968:   	addccc	%l5, -0x87f, %o4
	.word	0xd600a030	! t0_kref+0x396c:   	ld	[%g2 + 0x30], %o3
	.word	0xa9a3c836	! t0_kref+0x3970:   	fadds	%f15, %f22, %f20
	.word	0x988d8017	! t0_kref+0x3974:   	andcc	%l6, %l7, %o4
	.word	0xb9a00024	! t0_kref+0x3978:   	fmovs	%f4, %f28
	.word	0x81580000	! t0_kref+0x397c:   	flushw
	.word	0x95a1084c	! t0_kref+0x3980:   	faddd	%f4, %f12, %f10
	.word	0x988af280	! t0_kref+0x3984:   	andcc	%o3, -0xd80, %o4
	.word	0x2b800001	! t0_kref+0x3988:   	fbug,a	_kref+0x398c
	.word	0x9b2ac017	! t0_kref+0x398c:   	sll	%o3, %l7, %o5
	.word	0x80b28017	! t0_kref+0x3990:   	orncc	%o2, %l7, %g0
	.word	0xc06e7fef	! t0_kref+0x3994:   	ldstub	[%i1 - 0x11], %g0
	.word	0x9338001a	! t0_kref+0x3998:   	sra	%g0, %i2, %o1
	.word	0x81830000	! t0_kref+0x399c:   	wr	%o4, %g0, %y
	.word	0x81ac0aab	! t0_kref+0x39a0:   	fcmpes	%fcc0, %f16, %f11
	.word	0xaea2fd91	! t0_kref+0x39a4:   	subcc	%o3, -0x26f, %l7
	.word	0xe900a010	! t0_kref+0x39a8:   	ld	[%g2 + 0x10], %f20
	.word	0xf1ee501b	! t0_kref+0x39ac:   	prefetcha	%i1 + %i3, 24
	.word	0x93a0189d	! t0_kref+0x39b0:   	fitos	%f29, %f9
	.word	0xb5a00539	! t0_kref+0x39b4:   	fsqrts	%f25, %f26
	.word	0xae5b6013	! t0_kref+0x39b8:   	smul	%o5, 0x13, %l7
	.word	0x9b2ce001	! t0_kref+0x39bc:   	sll	%l3, 0x1, %o5
	.word	0xe53e001d	! t0_kref+0x39c0:   	std	%f18, [%i0 + %i5]
	.word	0xac248008	! t0_kref+0x39c4:   	sub	%l2, %o0, %l6
	.word	0x8da00150	! t0_kref+0x39c8:   	fabsd	%f16, %f6
	.word	0xafa0002f	! t0_kref+0x39cc:   	fmovs	%f15, %f23
	.word	0xda10a03a	! t0_kref+0x39d0:   	lduh	[%g2 + 0x3a], %o5
	.word	0xd848a013	! t0_kref+0x39d4:   	ldsb	[%g2 + 0x13], %o4
	.word	0x9032801a	! t0_kref+0x39d8:   	orn	%o2, %i2, %o0
	.word	0x95a7095c	! t0_kref+0x39dc:   	fmuld	%f28, %f28, %f10
	.word	0xd60e0000	! t0_kref+0x39e0:   	ldub	[%i0], %o3
	.word	0xe168a103	! t0_kref+0x39e4:   	prefetch	%g2 + 0x103, 16
	.word	0x9e12c008	! t0_kref+0x39e8:   	or	%o3, %o0, %o7
	.word	0x9bb2006a	! t0_kref+0x39ec:   	edge8ln	%o0, %o2, %o5
	.word	0xd67e001c	! t0_kref+0x39f0:   	swap	[%i0 + %i4], %o3
	.word	0xd4861000	! t0_kref+0x39f4:   	lda	[%i0]0x80, %o2
	.word	0xeb68a100	! t0_kref+0x39f8:   	prefetch	%g2 + 0x100, 21
	.word	0x8da01058	! t0_kref+0x39fc:   	fdtox	%f24, %f6
	.word	0xec180018	! t0_kref+0x3a00:   	ldd	[%g0 + %i0], %l6
	.word	0x9da00526	! t0_kref+0x3a04:   	fsqrts	%f6, %f14
!	.word	0x2d83217b	! t0_kref+0x3a08:   	fbg,a	SYM(t0_subr1)
	   	fbg,a	SYM(t0_subr1)
	.word	0x9f414000	! t0_kref+0x3a0c:   	mov	%pc, %o7
	.word	0xd008a033	! t0_kref+0x3a10:   	ldub	[%g2 + 0x33], %o0
	.word	0x9de3bfa0	! t0_kref+0x3a14:   	save	%sp, -0x60, %sp
	.word	0x95eeb27d	! t0_kref+0x3a18:   	restore	%i2, -0xd83, %o2
	.word	0xda480019	! t0_kref+0x3a1c:   	ldsb	[%g0 + %i1], %o5
	.word	0xd0260000	! t0_kref+0x3a20:   	st	%o0, [%i0]
	.word	0x31800006	! t0_kref+0x3a24:   	fba,a	_kref+0x3a3c
	.word	0xd0262004	! t0_kref+0x3a28:   	st	%o0, [%i0 + 4]
	.word	0x23480005	! t0_kref+0x3a2c:   	fbne,a,pt	%fcc0, _kref+0x3a40
	.word	0x90c24009	! t0_kref+0x3a30:   	addccc	%o1, %o1, %o0
	.word	0x1907a4e9	! t0_kref+0x3a34:   	sethi	%hi(0x1e93a400), %o4
	.word	0x91b60f8c	! t0_kref+0x3a38:   	for	%f24, %f12, %f8
	.word	0xd626401c	! t0_kref+0x3a3c:   	st	%o3, [%i1 + %i4]
	.word	0x942a4016	! t0_kref+0x3a40:   	andn	%o1, %l6, %o2
	.word	0xd9066000	! t0_kref+0x3a44:   	ld	[%i1], %f12
	.word	0x8d86aa9b	! t0_kref+0x3a48:   	wr	%i2, 0xa9b, %fprs
	.word	0xe11fbf58	! t0_kref+0x3a4c:   	ldd	[%fp - 0xa8], %f16
	.word	0xa5a01906	! t0_kref+0x3a50:   	fitod	%f6, %f18
	.word	0x9883356e	! t0_kref+0x3a54:   	addcc	%o4, -0xa92, %o4
	.word	0xd408a019	! t0_kref+0x3a58:   	ldub	[%g2 + 0x19], %o2
	.word	0xb9a0190b	! t0_kref+0x3a5c:   	fitod	%f11, %f28
	.word	0x86102003	! t0_kref+0x3a60:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x3a64:   	bne,a	_kref+0x3a64
	.word	0x86a0e001	! t0_kref+0x3a68:   	subcc	%g3, 1, %g3
	call	SYM(t0_subr2)
	.word	0xda262000	! t0_kref+0x3a70:   	st	%o5, [%i0]
	.word	0xa1a01a34	! t0_kref+0x3a74:   	fstoi	%f20, %f16
	.word	0xde40a038	! t0_kref+0x3a78:   	ldsw	[%g2 + 0x38], %o7
	.word	0x21480008	! t0_kref+0x3a7c:   	fbn,a,pt	%fcc0, _kref+0x3a9c
	.word	0xcd3e0000	! t0_kref+0x3a80:   	std	%f6, [%i0]
	.word	0x26800002	! t0_kref+0x3a84:   	bl,a	_kref+0x3a8c
	.word	0xd2262000	! t0_kref+0x3a88:   	st	%o1, [%i0]
	.word	0xd600a020	! t0_kref+0x3a8c:   	ld	[%g2 + 0x20], %o3
	.word	0x27480001	! t0_kref+0x3a90:   	fbul,a,pt	%fcc0, _kref+0x3a94
	.word	0xd5380018	! t0_kref+0x3a94:   	std	%f10, [%g0 + %i0]
	.word	0x3d480004	! t0_kref+0x3a98:   	fbule,a,pt	%fcc0, _kref+0x3aa8
	.word	0xec4e7ff5	! t0_kref+0x3a9c:   	ldsb	[%i1 - 0xb], %l6
	.word	0xd878a010	! t0_kref+0x3aa0:   	swap	[%g2 + 0x10], %o4
	.word	0xf426001c	! t0_kref+0x3aa4:   	st	%i2, [%i0 + %i4]
	.word	0x96928017	! t0_kref+0x3aa8:   	orcc	%o2, %l7, %o3
	.word	0x9425400b	! t0_kref+0x3aac:   	sub	%l5, %o3, %o2
	.word	0x9842e922	! t0_kref+0x3ab0:   	addc	%o3, 0x922, %o4
	.word	0x933a6009	! t0_kref+0x3ab4:   	sra	%o1, 0x9, %o1
	.word	0xad400000	! t0_kref+0x3ab8:   	mov	%y, %l6
	.word	0xd4270018	! t0_kref+0x3abc:   	st	%o2, [%i4 + %i0]
	.word	0xb7a2492d	! t0_kref+0x3ac0:   	fmuls	%f9, %f13, %f27
	.word	0xe9be1896	! t0_kref+0x3ac4:   	stda	%f20, [%i0 + %l6]0xc4
	.word	0x1716dd24	! t0_kref+0x3ac8:   	sethi	%hi(0x5b749000), %o3
	.word	0x9de3bfa0	! t0_kref+0x3acc:   	save	%sp, -0x60, %sp
	.word	0xbad64019	! t0_kref+0x3ad0:   	umulcc	%i1, %i1, %i5
	.word	0x93ef4018	! t0_kref+0x3ad4:   	restore	%i5, %i0, %o1
	.word	0x928a0014	! t0_kref+0x3ad8:   	andcc	%o0, %l4, %o1
	.word	0xee063ffc	! t0_kref+0x3adc:   	ld	[%i0 - 4], %l7
	.word	0x98b5f333	! t0_kref+0x3ae0:   	orncc	%l7, -0xccd, %o4
	.word	0x92e24015	! t0_kref+0x3ae4:   	subccc	%o1, %l5, %o1
	.word	0xa5a000ab	! t0_kref+0x3ae8:   	fnegs	%f11, %f18
	.word	0x31800001	! t0_kref+0x3aec:   	fba,a	_kref+0x3af0
	.word	0x90157af3	! t0_kref+0x3af0:   	or	%l5, -0x50d, %o0
	.word	0xb6103fe4	! t0_kref+0x3af4:   	mov	0xffffffe4, %i3
	.word	0xc02e6013	! t0_kref+0x3af8:   	clrb	[%i1 + 0x13]
	.word	0xd1be5888	! t0_kref+0x3afc:   	stda	%f8, [%i1 + %o0]0xc4
	.word	0xda10a038	! t0_kref+0x3b00:   	lduh	[%g2 + 0x38], %o5
	.word	0x99400000	! t0_kref+0x3b04:   	mov	%y, %o4
	.word	0xec4e6010	! t0_kref+0x3b08:   	ldsb	[%i1 + 0x10], %l6
	.word	0xac24aa79	! t0_kref+0x3b0c:   	sub	%l2, 0xa79, %l6
	.word	0xb9b18756	! t0_kref+0x3b10:   	fpack32	%f6, %f22, %f28
	call	SYM(t0_subr2)
	.word	0xd42e8018	! t0_kref+0x3b18:   	stb	%o2, [%i2 + %i0]
	.word	0xec3e3fe8	! t0_kref+0x3b1c:   	std	%l6, [%i0 - 0x18]
	.word	0xef00a028	! t0_kref+0x3b20:   	ld	[%g2 + 0x28], %f23
	.word	0xadb00f37	! t0_kref+0x3b24:   	fsrc2s	%f23, %f22
	.word	0x9802ebc7	! t0_kref+0x3b28:   	add	%o3, 0xbc7, %o4
	.word	0x8610201a	! t0_kref+0x3b2c:   	mov	0x1a, %g3
	.word	0x86a0e001	! t0_kref+0x3b30:   	subcc	%g3, 1, %g3
	.word	0x22800005	! t0_kref+0x3b34:   	be,a	_kref+0x3b48
	.word	0xf5be101d	! t0_kref+0x3b38:   	stda	%f26, [%i0 + %i5]0x80
	.word	0x9484b971	! t0_kref+0x3b3c:   	addcc	%l2, -0x68f, %o2
	.word	0x96c30009	! t0_kref+0x3b40:   	addccc	%o4, %o1, %o3
	.word	0xdd066010	! t0_kref+0x3b44:   	ld	[%i1 + 0x10], %f14
	.word	0x96fdf3a9	! t0_kref+0x3b48:   	sdivcc	%l7, -0xc57, %o3
	.word	0x8ba1082e	! t0_kref+0x3b4c:   	fadds	%f4, %f14, %f5
	.word	0x9db287cc	! t0_kref+0x3b50:   	pdist	%f10, %f12, %f14
	.word	0xee0e001a	! t0_kref+0x3b54:   	ldub	[%i0 + %i2], %l7
	.word	0xd2364000	! t0_kref+0x3b58:   	sth	%o1, [%i1]
	.word	0x9a32fc65	! t0_kref+0x3b5c:   	orn	%o3, -0x39b, %o5
	.word	0x11117fe8	! t0_kref+0x3b60:   	sethi	%hi(0x45ffa000), %o0
	.word	0xe4267ff4	! t0_kref+0x3b64:   	st	%l2, [%i1 - 0xc]
	.word	0x80fd0014	! t0_kref+0x3b68:   	sdivcc	%l4, %l4, %g0
	.word	0x29800007	! t0_kref+0x3b6c:   	fbl,a	_kref+0x3b88
	.word	0xda36401b	! t0_kref+0x3b70:   	sth	%o5, [%i1 + %i3]
	.word	0xac05b630	! t0_kref+0x3b74:   	add	%l6, -0x9d0, %l6
	.word	0x93b2802d	! t0_kref+0x3b78:   	edge8n	%o2, %o5, %o1
	.word	0x2b800003	! t0_kref+0x3b7c:   	fbug,a	_kref+0x3b88
	.word	0xaf282000	! t0_kref+0x3b80:   	sll	%g0, 0x0, %l7
	.word	0x965d800b	! t0_kref+0x3b84:   	smul	%l6, %o3, %o3
	.word	0xae56a452	! t0_kref+0x3b88:   	umul	%i2, 0x452, %l7
	.word	0xa5a0053b	! t0_kref+0x3b8c:   	fsqrts	%f27, %f18
	.word	0xd1b81018	! t0_kref+0x3b90:   	stda	%f8, [%g0 + %i0]0x80
	.word	0xe03e401d	! t0_kref+0x3b94:   	std	%l0, [%i1 + %i5]
	.word	0xe62e2019	! t0_kref+0x3b98:   	stb	%l3, [%i0 + 0x19]
	.word	0x9de3bfa0	! t0_kref+0x3b9c:   	save	%sp, -0x60, %sp
	.word	0x97eee195	! t0_kref+0x3ba0:   	restore	%i3, 0x195, %o3
	.word	0xee7e6018	! t0_kref+0x3ba4:   	swap	[%i1 + 0x18], %l7
	.word	0xd01f4018	! t0_kref+0x3ba8:   	ldd	[%i5 + %i0], %o0
	.word	0xc040a010	! t0_kref+0x3bac:   	ldsw	[%g2 + 0x10], %g0
	.word	0xc040a000	! t0_kref+0x3bb0:   	ldsw	[%g2], %g0
	.word	0xe6364000	! t0_kref+0x3bb4:   	sth	%l3, [%i1]
	.word	0xadb2832b	! t0_kref+0x3bb8:   	bmask	%o2, %o3, %l6
	.word	0x96c4c013	! t0_kref+0x3bbc:   	addccc	%l3, %l3, %o3
	.word	0xec1e7ff0	! t0_kref+0x3bc0:   	ldd	[%i1 - 0x10], %l6
	.word	0xacc34016	! t0_kref+0x3bc4:   	addccc	%o5, %l6, %l6
	.word	0xd0100019	! t0_kref+0x3bc8:   	lduh	[%g0 + %i1], %o0
	.word	0x93b007ba	! t0_kref+0x3bcc:   	fpackfix	%f26, %f9
	.word	0x9fa01a4c	! t0_kref+0x3bd0:   	fdtoi	%f12, %f15
	.word	0x8012ea13	! t0_kref+0x3bd4:   	or	%o3, 0xa13, %g0
	.word	0xdb067fec	! t0_kref+0x3bd8:   	ld	[%i1 - 0x14], %f13
	.word	0xf300a020	! t0_kref+0x3bdc:   	ld	[%g2 + 0x20], %f25
	.word	0x99a0054e	! t0_kref+0x3be0:   	fsqrtd	%f14, %f12
	.word	0x99a0188f	! t0_kref+0x3be4:   	fitos	%f15, %f12
	.word	0x92b5e4aa	! t0_kref+0x3be8:   	orncc	%l7, 0x4aa, %o1
	.word	0xb5a00027	! t0_kref+0x3bec:   	fmovs	%f7, %f26
	.word	0xf520a000	! t0_kref+0x3bf0:   	st	%f26, [%g2]
	.word	0xb5a0055c	! t0_kref+0x3bf4:   	fsqrtd	%f28, %f26
	.word	0x2b800005	! t0_kref+0x3bf8:   	fbug,a	_kref+0x3c0c
	.word	0xec26001c	! t0_kref+0x3bfc:   	st	%l6, [%i0 + %i4]
	.word	0x2d480001	! t0_kref+0x3c00:   	fbg,a,pt	%fcc0, _kref+0x3c04
	.word	0xa9a01118	! t0_kref+0x3c04:   	fxtod	%f24, %f20
	.word	0x905cb2fc	! t0_kref+0x3c08:   	smul	%l2, -0xd04, %o0
	.word	0x8056800b	! t0_kref+0x3c0c:   	umul	%i2, %o3, %g0
	.word	0xec50a01a	! t0_kref+0x3c10:   	ldsh	[%g2 + 0x1a], %l6
	.word	0x9db24da5	! t0_kref+0x3c14:   	fxors	%f9, %f5, %f14
	sethi	%hi(2f), %o7
	.word	0xe40be044	! t0_kref+0x3c1c:   	ldub	[%o7 + 0x44], %l2
	.word	0xa41ca00c	! t0_kref+0x3c20:   	xor	%l2, 0xc, %l2
	.word	0xe42be044	! t0_kref+0x3c24:   	stb	%l2, [%o7 + 0x44]
	.word	0x81dbe044	! t0_kref+0x3c28:   	flush	%o7 + 0x44
	.word	0xd700a000	! t0_kref+0x3c2c:   	ld	[%g2], %f11
	.word	0x91a0054a	! t0_kref+0x3c30:   	fsqrtd	%f10, %f8
	.word	0xe4200019	! t0_kref+0x3c34:   	st	%l2, [%g0 + %i1]
	.word	0xd636c019	! t0_kref+0x3c38:   	sth	%o3, [%i3 + %i1]
	.word	0xd648a001	! t0_kref+0x3c3c:   	ldsb	[%g2 + 1], %o3
	.word	0x80ab401a	! t0_kref+0x3c40:   	andncc	%o5, %i2, %g0
2:	.word	0x91b1062e	! t0_kref+0x3c44:   	fmul8x16	%f4, %f14, %f8
	.word	0x23480001	! t0_kref+0x3c48:   	fbne,a,pt	%fcc0, _kref+0x3c4c
	.word	0x81b2c00b	! t0_kref+0x3c4c:   	edge8	%o3, %o3, %g0
	.word	0xd27f0018	! t0_kref+0x3c50:   	swap	[%i4 + %i0], %o1
	.word	0x91b58c90	! t0_kref+0x3c54:   	fandnot2	%f22, %f16, %f8
	.word	0x9824bef9	! t0_kref+0x3c58:   	sub	%l2, -0x107, %o4
	.word	0x3d800003	! t0_kref+0x3c5c:   	fbule,a	_kref+0x3c68
	.word	0x91b40ac6	! t0_kref+0x3c60:   	fpsub32	%f16, %f6, %f8
	.word	0x9a534015	! t0_kref+0x3c64:   	umul	%o5, %l5, %o5
	.word	0x9fc10000	! t0_kref+0x3c68:   	call	%g4
	.word	0xb3b40eec	! t0_kref+0x3c6c:   	fornot2s	%f16, %f12, %f25
	.word	0x86102001	! t0_kref+0x3c70:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x3c74:   	bne,a	_kref+0x3c74
	.word	0x86a0e001	! t0_kref+0x3c78:   	subcc	%g3, 1, %g3
	.word	0xe4086f04	! t0_kref+0x3c7c:   	ldub	[%g1 + 0xf04], %l2
	.word	0xa41ca00c	! t0_kref+0x3c80:   	xor	%l2, 0xc, %l2
	.word	0xe4286f04	! t0_kref+0x3c84:   	stb	%l2, [%g1 + 0xf04]
	.word	0x81d86f04	! t0_kref+0x3c88:   	flush	%g1 + 0xf04
	.word	0x8143c000	! t0_kref+0x3c8c:   	stbar
	.word	0x8584800a	! t0_kref+0x3c90:   	wr	%l2, %o2, %ccr
	.word	0x96c03f1f	! t0_kref+0x3c94:   	addccc	%g0, -0xe1, %o3
	.word	0x81ad8aca	! t0_kref+0x3c98:   	fcmped	%fcc0, %f22, %f10
2:	.word	0xe02e600a	! t0_kref+0x3c9c:   	stb	%l0, [%i1 + 0xa]
	.word	0xc9be5a5b	! t0_kref+0x3ca0:   	stda	%f4, [%i1 + %i3]0xd2
	call	SYM(t0_subr3)
	.word	0xed68a0cf	! t0_kref+0x3ca8:   	prefetch	%g2 + 0xcf, 22
	.word	0x813dc00c	! t0_kref+0x3cac:   	sra	%l7, %o4, %g0
	.word	0xb5a60836	! t0_kref+0x3cb0:   	fadds	%f24, %f22, %f26
	.word	0xa1b00c00	! t0_kref+0x3cb4:   	fzero	%f16
	.word	0x23800002	! t0_kref+0x3cb8:   	fbne,a	_kref+0x3cc0
	.word	0xf100a008	! t0_kref+0x3cbc:   	ld	[%g2 + 8], %f24
	.word	0xda100018	! t0_kref+0x3cc0:   	lduh	[%g0 + %i0], %o5
	.word	0x878020d2	! t0_kref+0x3cc4:   	mov	0xd2, %asi
	.word	0xd650a038	! t0_kref+0x3cc8:   	ldsh	[%g2 + 0x38], %o3
	.word	0xd08e501a	! t0_kref+0x3ccc:   	lduba	[%i1 + %i2]0x80, %o0
	.word	0xce10372a	! t0_kref+0x3cd0:   	lduh	[%g0 - 0x8d6], %g7
	.word	0x35480006	! t0_kref+0x3cd4:   	fbue,a,pt	%fcc0, _kref+0x3cec
	.word	0x8da48856	! t0_kref+0x3cd8:   	faddd	%f18, %f22, %f6
	.word	0xf700a030	! t0_kref+0x3cdc:   	ld	[%g2 + 0x30], %f27
	.word	0xaf05ef03	! t0_kref+0x3ce0:   	taddcc	%l7, 0xf03, %l7
	.word	0x31800008	! t0_kref+0x3ce4:   	fba,a	_kref+0x3d04
	.word	0x930e8013	! t0_kref+0x3ce8:   	tsubcc	%i2, %l3, %o1
	.word	0x9af53bd4	! t0_kref+0x3cec:   	udivcc	%l4, -0x42c, %o5
	.word	0x9a2322fe	! t0_kref+0x3cf0:   	sub	%o4, 0x2fe, %o5
	.word	0x90bd3a81	! t0_kref+0x3cf4:   	xnorcc	%l4, -0x57f, %o0
	.word	0x9f414000	! t0_kref+0x3cf8:   	mov	%pc, %o7
	.word	0x96fcaaaf	! t0_kref+0x3cfc:   	sdivcc	%l2, 0xaaf, %o3
	.word	0x968abe90	! t0_kref+0x3d00:   	andcc	%o2, -0x170, %o3
	.word	0x86102003	! t0_kref+0x3d04:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x3d08:   	bne,a	_kref+0x3d08
	.word	0x86a0e001	! t0_kref+0x3d0c:   	subcc	%g3, 1, %g3
	.word	0x192f0129	! t0_kref+0x3d10:   	sethi	%hi(0xbc04a400), %o4
	.word	0xc068384f	! t0_kref+0x3d14:   	ldstub	[%g0 - 0x7b1], %g0
	.word	0xae534014	! t0_kref+0x3d18:   	umul	%o5, %l4, %l7
	.word	0xac70000b	! t0_kref+0x3d1c:   	udiv	%g0, %o3, %l6
	.word	0x2b480008	! t0_kref+0x3d20:   	fbug,a,pt	%fcc0, _kref+0x3d40
	.word	0x95b30200	! t0_kref+0x3d24:   	array8	%o4, %g0, %o2
	.word	0xdf26001c	! t0_kref+0x3d28:   	st	%f15, [%i0 + %i4]
	.word	0x3b800007	! t0_kref+0x3d2c:   	fble,a	_kref+0x3d48
	.word	0xadb40f9c	! t0_kref+0x3d30:   	for	%f16, %f28, %f22
	.word	0x905cc009	! t0_kref+0x3d34:   	smul	%l3, %o1, %o0
	.word	0x9bb3044c	! t0_kref+0x3d38:   	fcmpne16	%f12, %f12, %o5
	.word	0xd600a008	! t0_kref+0x3d3c:   	ld	[%g2 + 8], %o3
	.word	0x9edd6569	! t0_kref+0x3d40:   	smulcc	%l5, 0x569, %o7
	.word	0xb3a3c926	! t0_kref+0x3d44:   	fmuls	%f15, %f6, %f25
	.word	0xa1a0191b	! t0_kref+0x3d48:   	fitod	%f27, %f16
	.word	0x89b20719	! t0_kref+0x3d4c:   	fmuld8sux16	%f8, %f25, %f4
	.word	0x94aac017	! t0_kref+0x3d50:   	andncc	%o3, %l7, %o2
	.word	0x99a00527	! t0_kref+0x3d54:   	fsqrts	%f7, %f12
	.word	0x95a608d0	! t0_kref+0x3d58:   	fsubd	%f24, %f16, %f10
	.word	0xaebb0008	! t0_kref+0x3d5c:   	xnorcc	%o4, %o0, %l7
	.word	0xb9a489d6	! t0_kref+0x3d60:   	fdivd	%f18, %f22, %f28
	.word	0x8da000ab	! t0_kref+0x3d64:   	fnegs	%f11, %f6
	.word	0x35800002	! t0_kref+0x3d68:   	fbue,a	_kref+0x3d70
	.word	0x94b27086	! t0_kref+0x3d6c:   	orncc	%o1, -0xf7a, %o2
	.word	0xf306200c	! t0_kref+0x3d70:   	ld	[%i0 + 0xc], %f25
	.word	0x33480005	! t0_kref+0x3d74:   	fbe,a,pt	%fcc0, _kref+0x3d88
	.word	0x89b40dec	! t0_kref+0x3d78:   	fnands	%f16, %f12, %f4
	.word	0xac75c015	! t0_kref+0x3d7c:   	udiv	%l7, %l5, %l6
	.word	0xd200a038	! t0_kref+0x3d80:   	ld	[%g2 + 0x38], %o1
	.word	0x9bb20056	! t0_kref+0x3d84:   	edge8l	%o0, %l6, %o5
	.word	0x97400000	! t0_kref+0x3d88:   	mov	%y, %o3
	.word	0x173baa92	! t0_kref+0x3d8c:   	sethi	%hi(0xeeaa4800), %o3
	.word	0x1937b1e7	! t0_kref+0x3d90:   	sethi	%hi(0xdec79c00), %o4
	.word	0x3f480005	! t0_kref+0x3d94:   	fbo,a,pt	%fcc0, _kref+0x3da8
	.word	0xee46600c	! t0_kref+0x3d98:   	ldsw	[%i1 + 0xc], %l7
	.word	0x90e53d35	! t0_kref+0x3d9c:   	subccc	%l4, -0x2cb, %o0
	.word	0xa9a0053b	! t0_kref+0x3da0:   	fsqrts	%f27, %f20
	.word	0x91b5408a	! t0_kref+0x3da4:   	edge16	%l5, %o2, %o0
	.word	0xd648a028	! t0_kref+0x3da8:   	ldsb	[%g2 + 0x28], %o3
	.word	0x37800001	! t0_kref+0x3dac:   	fbge,a	_kref+0x3db0
	.word	0xada308b5	! t0_kref+0x3db0:   	fsubs	%f12, %f21, %f22
	.word	0x98554015	! t0_kref+0x3db4:   	umul	%l5, %l5, %o4
	.word	0xa5b58e54	! t0_kref+0x3db8:   	fxnor	%f22, %f20, %f18
	.word	0xe9264000	! t0_kref+0x3dbc:   	st	%f20, [%i1]
	.word	0x3f800007	! t0_kref+0x3dc0:   	fbo,a	_kref+0x3ddc
	.word	0x9b2ce012	! t0_kref+0x3dc4:   	sll	%l3, 0x12, %o5
	.word	0xb5b38e16	! t0_kref+0x3dc8:   	fand	%f14, %f22, %f26
	.word	0x2f800006	! t0_kref+0x3dcc:   	fbu,a	_kref+0x3de4
	.word	0xd050a03a	! t0_kref+0x3dd0:   	ldsh	[%g2 + 0x3a], %o0
	.word	0xe5a01019	! t0_kref+0x3dd4:   	sta	%f18, [%g0 + %i1]0x80
	.word	0xa3a4883a	! t0_kref+0x3dd8:   	fadds	%f18, %f26, %f17
	.word	0xd000a010	! t0_kref+0x3ddc:   	ld	[%g2 + 0x10], %o0
	.word	0xc93f4019	! t0_kref+0x3de0:   	std	%f4, [%i5 + %i1]
	.word	0xaf400000	! t0_kref+0x3de4:   	mov	%y, %l7
	.word	0xadb304d4	! t0_kref+0x3de8:   	fcmpne32	%f12, %f20, %l6
	.word	0xde96501b	! t0_kref+0x3dec:   	lduha	[%i1 + %i3]0x80, %o7
	.word	0xd8871019	! t0_kref+0x3df0:   	lda	[%i4 + %i1]0x80, %o4
	.word	0xafb58ab6	! t0_kref+0x3df4:   	fpsub16s	%f22, %f22, %f23
	.word	0x9894e648	! t0_kref+0x3df8:   	orcc	%l3, 0x648, %o4
	sethi	%hi(2f), %o7
	.word	0xe40be220	! t0_kref+0x3e00:   	ldub	[%o7 + 0x220], %l2
	.word	0xa41ca00c	! t0_kref+0x3e04:   	xor	%l2, 0xc, %l2
	.word	0xe42be220	! t0_kref+0x3e08:   	stb	%l2, [%o7 + 0x220]
	.word	0x81dbe220	! t0_kref+0x3e0c:   	flush	%o7 + 0x220
	.word	0xd4ce105a	! t0_kref+0x3e10:   	ldsba	[%i0 + %i2]0x82, %o2
	.word	0xada0104c	! t0_kref+0x3e14:   	fdtox	%f12, %f22
	.word	0xb1b10d38	! t0_kref+0x3e18:   	fandnot1s	%f4, %f24, %f24
	.word	0x23480008	! t0_kref+0x3e1c:   	fbne,a,pt	%fcc0, _kref+0x3e3c
2:	.word	0x9e64be6e	! t0_kref+0x3e20:   	subc	%l2, -0x192, %o7
	.word	0x23480005	! t0_kref+0x3e24:   	fbne,a,pt	%fcc0, _kref+0x3e38
	.word	0x9da689c6	! t0_kref+0x3e28:   	fdivd	%f26, %f6, %f14
	.word	0x3d800001	! t0_kref+0x3e2c:   	fbule,a	_kref+0x3e30
	.word	0x9fb68280	! t0_kref+0x3e30:   	array32	%i2, %g0, %o7
	.word	0xb1b0077c	! t0_kref+0x3e34:   	fpack16	%f28, %f24
	.word	0xec4e6004	! t0_kref+0x3e38:   	ldsb	[%i1 + 4], %l6
	.word	0x25480006	! t0_kref+0x3e3c:   	fblg,a,pt	%fcc0, _kref+0x3e54
	.word	0xb5a1482a	! t0_kref+0x3e40:   	fadds	%f5, %f10, %f26
	.word	0x9fc10000	! t0_kref+0x3e44:   	call	%g4
	.word	0x81db261a	! t0_kref+0x3e48:   	flush	%o4 + 0x61a
	.word	0xaf400000	! t0_kref+0x3e4c:   	mov	%y, %l7
	.word	0xd01e001d	! t0_kref+0x3e50:   	ldd	[%i0 + %i5], %o0
	.word	0x95b60d16	! t0_kref+0x3e54:   	fandnot1	%f24, %f22, %f10
	.word	0xb9a0002e	! t0_kref+0x3e58:   	fmovs	%f14, %f28
	.word	0xa1a588b7	! t0_kref+0x3e5c:   	fsubs	%f22, %f23, %f16
	.word	0xd0367ff8	! t0_kref+0x3e60:   	sth	%o0, [%i1 - 8]
	.word	0x81ad8a4a	! t0_kref+0x3e64:   	fcmpd	%fcc0, %f22, %f10
	.word	0x982d8008	! t0_kref+0x3e68:   	andn	%l6, %o0, %o4
	.word	0x9da00528	! t0_kref+0x3e6c:   	fsqrts	%f8, %f14
	.word	0xf7ee101c	! t0_kref+0x3e70:   	prefetcha	%i0 + %i4, 27
	.word	0x89a608c4	! t0_kref+0x3e74:   	fsubd	%f24, %f4, %f4
	.word	0xa9a709cc	! t0_kref+0x3e78:   	fdivd	%f28, %f12, %f20
	.word	0xb9b00fc0	! t0_kref+0x3e7c:   	fone	%f28
	.word	0xc04e7ff7	! t0_kref+0x3e80:   	ldsb	[%i1 - 9], %g0
	.word	0xc1ee101a	! t0_kref+0x3e84:   	prefetcha	%i0 + %i2, 0
	.word	0xa3a00139	! t0_kref+0x3e88:   	fabss	%f25, %f17
	.word	0xb9a48835	! t0_kref+0x3e8c:   	fadds	%f18, %f21, %f28
	.word	0x93a6882c	! t0_kref+0x3e90:   	fadds	%f26, %f12, %f9
	.word	0x1b28b98f	! t0_kref+0x3e94:   	sethi	%hi(0xa2e63c00), %o5
	.word	0xc028a013	! t0_kref+0x3e98:   	clrb	[%g2 + 0x13]
	sethi	%hi(1f), %o7
	jmpl	%o7+%lo(1f), %g1
	.empty
	.word	0xaf380014	! t0_kref+0x3ea4:   	sra	%g0, %l4, %l7
	.word	0x2c480002	! t0_kref+0x3ea8:   	bneg,a,pt	%icc, _kref+0x3eb0
	.word	0x9bb5800c	! t0_kref+0x3eac:   	edge8	%l6, %o4, %o5
	.word	0xcd00a028	! t0_kref+0x3eb0:   	ld	[%g2 + 0x28], %f6
	.word	0xb9a0055a	! t0_kref+0x3eb4:   	fsqrtd	%f26, %f28
	.word	0xd9262008	! t0_kref+0x3eb8:   	st	%f12, [%i0 + 8]
	.word	0x80858009	! t0_kref+0x3ebc:   	addcc	%l6, %o1, %g0
1:	.word	0xa3a0002b	! t0_kref+0x3ec0:   	fmovs	%f11, %f17
	.word	0xac22400c	! t0_kref+0x3ec4:   	sub	%o1, %o4, %l6
	.word	0xe59e101d	! t0_kref+0x3ec8:   	ldda	[%i0 + %i5]0x80, %f18
	.word	0x992d800b	! t0_kref+0x3ecc:   	sll	%l6, %o3, %o4
	.word	0x21480003	! t0_kref+0x3ed0:   	fbn,a,pt	%fcc0, _kref+0x3edc
	.word	0x968c8009	! t0_kref+0x3ed4:   	andcc	%l2, %o1, %o3
	.word	0xd640a030	! t0_kref+0x3ed8:   	ldsw	[%g2 + 0x30], %o3
	.word	0x925d400d	! t0_kref+0x3edc:   	smul	%l5, %o5, %o1
	.word	0xac8d000d	! t0_kref+0x3ee0:   	andcc	%l4, %o5, %l6
	.word	0x80830017	! t0_kref+0x3ee4:   	addcc	%o4, %l7, %g0
	.word	0x92c02743	! t0_kref+0x3ee8:   	addccc	%g0, 0x743, %o1
	.word	0xafa000bc	! t0_kref+0x3eec:   	fnegs	%f28, %f23
	.word	0x9da38832	! t0_kref+0x3ef0:   	fadds	%f14, %f18, %f14
	.word	0xa5a4c92c	! t0_kref+0x3ef4:   	fmuls	%f19, %f12, %f18
	.word	0xd8be1000	! t0_kref+0x3ef8:   	stda	%o4, [%i0]0x80
	.word	0xaec37b6f	! t0_kref+0x3efc:   	addccc	%o5, -0x491, %l7
	.word	0x983b0000	! t0_kref+0x3f00:   	not	%o4
	.word	0xef00a010	! t0_kref+0x3f04:   	ld	[%g2 + 0x10], %f23
	.word	0xec40a018	! t0_kref+0x3f08:   	ldsw	[%g2 + 0x18], %l6
	.word	0xd0580019	! t0_kref+0x3f0c:   	ldx	[%g0 + %i1], %o0
	.word	0x8da28837	! t0_kref+0x3f10:   	fadds	%f10, %f23, %f6
	.word	0xaf35a014	! t0_kref+0x3f14:   	srl	%l6, 0x14, %l7
	.word	0x91b4051c	! t0_kref+0x3f18:   	fcmpgt16	%f16, %f28, %o0
	.word	0x9e82a4a8	! t0_kref+0x3f1c:   	addcc	%o2, 0x4a8, %o7
	.word	0x81aecaba	! t0_kref+0x3f20:   	fcmpes	%fcc0, %f27, %f26
	.word	0x2f39a6e1	! t0_kref+0x3f24:   	sethi	%hi(0xe69b8400), %l7
	.word	0xa3b00fe0	! t0_kref+0x3f28:   	fones	%f17
	.word	0x94126236	! t0_kref+0x3f2c:   	or	%o1, 0x236, %o2
	.word	0xd2de1000	! t0_kref+0x3f30:   	ldxa	[%i0]0x80, %o1
	.word	0xd80e0000	! t0_kref+0x3f34:   	ldub	[%i0], %o4
	.word	0x972d6001	! t0_kref+0x3f38:   	sll	%l5, 0x1, %o3
	.word	0x97a00030	! t0_kref+0x3f3c:   	fmovs	%f16, %f11
	.word	0xae88000b	! t0_kref+0x3f40:   	andcc	%g0, %o3, %l7
	.word	0x3f800003	! t0_kref+0x3f44:   	fbo,a	_kref+0x3f50
	.word	0x9ba0053a	! t0_kref+0x3f48:   	fsqrts	%f26, %f13
	.word	0xee16201e	! t0_kref+0x3f4c:   	lduh	[%i0 + 0x1e], %l7
	.word	0xada30848	! t0_kref+0x3f50:   	faddd	%f12, %f8, %f22
	.word	0x89a01891	! t0_kref+0x3f54:   	fitos	%f17, %f4
	.word	0xd850a028	! t0_kref+0x3f58:   	ldsh	[%g2 + 0x28], %o4
	.word	0xb1a5095a	! t0_kref+0x3f5c:   	fmuld	%f20, %f26, %f24
	.word	0xee270018	! t0_kref+0x3f60:   	st	%l7, [%i4 + %i0]
	.word	0x13285877	! t0_kref+0x3f64:   	sethi	%hi(0xa161dc00), %o1
	.word	0x9934c00a	! t0_kref+0x3f68:   	srl	%l3, %o2, %o4
	.word	0xd6780018	! t0_kref+0x3f6c:   	swap	[%g0 + %i0], %o3
	.word	0xd08e9019	! t0_kref+0x3f70:   	lduba	[%i2 + %i1]0x80, %o0
	.word	0x2a480002	! t0_kref+0x3f74:   	bcs,a,pt	%icc, _kref+0x3f7c
	.word	0xd6162000	! t0_kref+0x3f78:   	lduh	[%i0], %o3
	.word	0x81ac8ad6	! t0_kref+0x3f7c:   	fcmped	%fcc0, %f18, %f22
	call	SYM(t0_subr2)
	.word	0xf3063ffc	! t0_kref+0x3f84:   	ld	[%i0 - 4], %f25
	.word	0xa5b387ce	! t0_kref+0x3f88:   	pdist	%f14, %f14, %f18
	.word	0x9e55000d	! t0_kref+0x3f8c:   	umul	%l4, %o5, %o7
	.word	0xd220a008	! t0_kref+0x3f90:   	st	%o1, [%g2 + 8]
	.word	0x95400000	! t0_kref+0x3f94:   	mov	%y, %o2
	.word	0xac54b650	! t0_kref+0x3f98:   	umul	%l2, -0x9b0, %l6
	.word	0x27480004	! t0_kref+0x3f9c:   	fbul,a,pt	%fcc0, _kref+0x3fac
	.word	0x98b4c015	! t0_kref+0x3fa0:   	orncc	%l3, %l5, %o4
	.word	0x8bb6cd36	! t0_kref+0x3fa4:   	fandnot1s	%f27, %f22, %f5
	.word	0xb7a0189a	! t0_kref+0x3fa8:   	fitos	%f26, %f27
	.word	0x37800005	! t0_kref+0x3fac:   	fbge,a	_kref+0x3fc0
	.word	0xb5a1c83c	! t0_kref+0x3fb0:   	fadds	%f7, %f28, %f26
	.word	0x001fffff	! t0_kref+0x3fb4:   	illtrap	0x1fffff
	.word	0x132241fa	! t0_kref+0x3fb8:   	sethi	%hi(0x8907e800), %o1
	.word	0x91b1cdfa	! t0_kref+0x3fbc:   	fnands	%f7, %f26, %f8
	.word	0xdaf75018	! t0_kref+0x3fc0:   	stxa	%o5, [%i5 + %i0]0x80
	.word	0xb5b40998	! t0_kref+0x3fc4:   	bshuffle	%f16, %f24, %f26
	.word	0xa9a000a6	! t0_kref+0x3fc8:   	fnegs	%f6, %f20
	.word	0x95b4c109	! t0_kref+0x3fcc:   	edge32	%l3, %o1, %o2
	.word	0xd2de501d	! t0_kref+0x3fd0:   	ldxa	[%i1 + %i5]0x80, %o1
	.word	0xd84e7ffc	! t0_kref+0x3fd4:   	ldsb	[%i1 - 4], %o4
	.word	0xd01e3ff0	! t0_kref+0x3fd8:   	ldd	[%i0 - 0x10], %o0
	.word	0xb9a00550	! t0_kref+0x3fdc:   	fsqrtd	%f16, %f28
	.word	0xe100a030	! t0_kref+0x3fe0:   	ld	[%g2 + 0x30], %f16
	.word	0x31800007	! t0_kref+0x3fe4:   	fba,a	_kref+0x4000
	.word	0x89a00546	! t0_kref+0x3fe8:   	fsqrtd	%f6, %f4
	.word	0x89a18d3a	! t0_kref+0x3fec:   	fsmuld	%f6, %f26, %f4
	.word	0xe7266014	! t0_kref+0x3ff0:   	st	%f19, [%i1 + 0x14]
	.word	0xd2463ff0	! t0_kref+0x3ff4:   	ldsw	[%i0 - 0x10], %o1
	.word	0xd6a71018	! t0_kref+0x3ff8:   	sta	%o3, [%i4 + %i0]0x80
	.word	0xe93e6000	! t0_kref+0x3ffc:   	std	%f20, [%i1]
	call	SYM(t0_subr1)
	.word	0x961832a6	! t0_kref+0x4004:   	xor	%g0, -0xd5a, %o3
	.word	0x013b641e	! t0_kref+0x4008:   	sethi	%hi(0xed907800), %g0
	.word	0xb1a0052c	! t0_kref+0x400c:   	fsqrts	%f12, %f24
	.word	0xaef80000	! t0_kref+0x4010:   	sdivcc	%g0, %g0, %l7
	.word	0xd410a038	! t0_kref+0x4014:   	lduh	[%g2 + 0x38], %o2
	.word	0xdd1fbf90	! t0_kref+0x4018:   	ldd	[%fp - 0x70], %f14
	.word	0xac86ad22	! t0_kref+0x401c:   	addcc	%i2, 0xd22, %l6
	.word	0x9e8dc01a	! t0_kref+0x4020:   	andcc	%l7, %i2, %o7
	.word	0xde16200c	! t0_kref+0x4024:   	lduh	[%i0 + 0xc], %o7
	.word	0xf5ee101d	! t0_kref+0x4028:   	prefetcha	%i0 + %i5, 26
	.word	0x8ba01892	! t0_kref+0x402c:   	fitos	%f18, %f5
	.word	0x9603401a	! t0_kref+0x4030:   	add	%o5, %i2, %o3
	.word	0xd0100018	! t0_kref+0x4034:   	lduh	[%g0 + %i0], %o0
	.word	0x9ac2b880	! t0_kref+0x4038:   	addccc	%o2, -0x780, %o5
	.word	0x27480002	! t0_kref+0x403c:   	fbul,a,pt	%fcc0, _kref+0x4044
	.word	0x901d400a	! t0_kref+0x4040:   	xor	%l5, %o2, %o0
	.word	0x8db007b0	! t0_kref+0x4044:   	fpackfix	%f16, %f6
	.word	0x96c4a199	! t0_kref+0x4048:   	addccc	%l2, 0x199, %o3
	.word	0x92b5675f	! t0_kref+0x404c:   	orncc	%l5, 0x75f, %o1
	.word	0xde0e7fe6	! t0_kref+0x4050:   	ldub	[%i1 - 0x1a], %o7
	.word	0xb1a0055a	! t0_kref+0x4054:   	fsqrtd	%f26, %f24
	.word	0xcd262004	! t0_kref+0x4058:   	st	%f6, [%i0 + 4]
	.word	0x9da74d2e	! t0_kref+0x405c:   	fsmuld	%f29, %f14, %f14
	.word	0x38480007	! t0_kref+0x4060:   	bgu,a,pt	%icc, _kref+0x407c
	.word	0xd248a01b	! t0_kref+0x4064:   	ldsb	[%g2 + 0x1b], %o1
	call	SYM(t0_subr0)
	.word	0x9215b2ca	! t0_kref+0x406c:   	or	%l6, -0xd36, %o1
	.word	0x9fc00004	! t0_kref+0x4070:   	call	%g0 + %g4
	.word	0x97400000	! t0_kref+0x4074:   	mov	%y, %o3
	.word	0xadb4808b	! t0_kref+0x4078:   	edge16	%l2, %o3, %l6
	.word	0xec0e7ffd	! t0_kref+0x407c:   	ldub	[%i1 - 3], %l6
	.word	0x8143c000	! t0_kref+0x4080:   	stbar
	.word	0x96ad2845	! t0_kref+0x4084:   	andncc	%l4, 0x845, %o3
	.word	0x91a00033	! t0_kref+0x4088:   	fmovs	%f19, %f8
	.word	0x81ab8ab9	! t0_kref+0x408c:   	fcmpes	%fcc0, %f14, %f25
	.word	0xec2e2014	! t0_kref+0x4090:   	stb	%l6, [%i0 + 0x14]
	.word	0xa9b5899a	! t0_kref+0x4094:   	bshuffle	%f22, %f26, %f20
	.word	0x99a00548	! t0_kref+0x4098:   	fsqrtd	%f8, %f12
	.word	0x96334016	! t0_kref+0x409c:   	orn	%o5, %l6, %o3
	.word	0x91a20938	! t0_kref+0x40a0:   	fmuls	%f8, %f24, %f8
	.word	0xd04e0000	! t0_kref+0x40a4:   	ldsb	[%i0], %o0
	.word	0xacdb3cc5	! t0_kref+0x40a8:   	smulcc	%o4, -0x33b, %l6
	.word	0xec500018	! t0_kref+0x40ac:   	ldsh	[%g0 + %i0], %l6
	.word	0x9fb38514	! t0_kref+0x40b0:   	fcmpgt16	%f14, %f20, %o7
	.word	0x9a5d4009	! t0_kref+0x40b4:   	smul	%l5, %o1, %o5
	.word	0xd62e7ffd	! t0_kref+0x40b8:   	stb	%o3, [%i1 - 3]
	.word	0x86102013	! t0_kref+0x40bc:   	mov	0x13, %g3
	.word	0x86a0e001	! t0_kref+0x40c0:   	subcc	%g3, 1, %g3
	.word	0x22800013	! t0_kref+0x40c4:   	be,a	_kref+0x4110
	.word	0x1915188f	! t0_kref+0x40c8:   	sethi	%hi(0x54623c00), %o4
	.word	0xb7a0052c	! t0_kref+0x40cc:   	fsqrts	%f12, %f27
	.word	0x9fa28933	! t0_kref+0x40d0:   	fmuls	%f10, %f19, %f15
	.word	0x81ad8ad8	! t0_kref+0x40d4:   	fcmped	%fcc0, %f22, %f24
	.word	0xa5b18d16	! t0_kref+0x40d8:   	fandnot1	%f6, %f22, %f18
	.word	0x23bffff9	! t0_kref+0x40dc:   	fbne,a	_kref+0x40c0
	.word	0xa1a50d27	! t0_kref+0x40e0:   	fsmuld	%f20, %f7, %f16
	.word	0xac25400c	! t0_kref+0x40e4:   	sub	%l5, %o4, %l6
	.word	0xd848a01b	! t0_kref+0x40e8:   	ldsb	[%g2 + 0x1b], %o4
	.word	0x81ae8a56	! t0_kref+0x40ec:   	fcmpd	%fcc0, %f26, %f22
	.word	0xa786bb93	! t0_kref+0x40f0:   	wr	%i2, 0xfffffb93, %gsr
	.word	0xd806001c	! t0_kref+0x40f4:   	ld	[%i0 + %i4], %o4
	.word	0x8fa0189c	! t0_kref+0x40f8:   	fitos	%f28, %f7
	call	SYM(t0_subr2)
	.word	0x97400000	! t0_kref+0x4100:   	mov	%y, %o3
	.word	0x384fffef	! t0_kref+0x4104:   	bgu,a,pt	%icc, _kref+0x40c0
	.word	0x85827555	! t0_kref+0x4108:   	wr	%o1, 0xfffff555, %ccr
	.word	0x95a00544	! t0_kref+0x410c:   	fsqrtd	%f4, %f10
	.word	0x9db686ee	! t0_kref+0x4110:   	fmul8ulx16	%f26, %f14, %f14
	.word	0xeb00a018	! t0_kref+0x4114:   	ld	[%g2 + 0x18], %f21
	.word	0x25480007	! t0_kref+0x4118:   	fblg,a,pt	%fcc0, _kref+0x4134
	.word	0xaef03834	! t0_kref+0x411c:   	udivcc	%g0, -0x7cc, %l7
	.word	0x9a8d8016	! t0_kref+0x4120:   	andcc	%l6, %l6, %o5
	.word	0xb9a2884a	! t0_kref+0x4124:   	faddd	%f10, %f10, %f28
	.word	0x9340c000	! t0_kref+0x4128:   	mov	%asi, %o1
	.word	0xe5865000	! t0_kref+0x412c:   	lda	[%i1]0x80, %f18
	.word	0xe47e3ffc	! t0_kref+0x4130:   	swap	[%i0 - 4], %l2
	.word	0xd7f61014	! t0_kref+0x4134:   	casxa	[%i0]0x80, %l4, %o3
	.word	0xe62e8018	! t0_kref+0x4138:   	stb	%l3, [%i2 + %i0]
	.word	0xa5a00026	! t0_kref+0x413c:   	fmovs	%f6, %f18
	.word	0xd3264000	! t0_kref+0x4140:   	st	%f9, [%i1]
	.word	0xd04e3ff4	! t0_kref+0x4144:   	ldsb	[%i0 - 0xc], %o0
	.word	0x9a8ae4fe	! t0_kref+0x4148:   	andcc	%o3, 0x4fe, %o5
	.word	0xd4380018	! t0_kref+0x414c:   	std	%o2, [%g0 + %i0]
	.word	0xf43e001d	! t0_kref+0x4150:   	std	%i2, [%i0 + %i5]
	.word	0xe19e601a	! t0_kref+0x4154:   	ldda	[%i1 + 0x1a]%asi, %f16
	.word	0xaee5c00d	! t0_kref+0x4158:   	subccc	%l7, %o5, %l7
	.word	0xa1b30f7a	! t0_kref+0x415c:   	fornot1s	%f12, %f26, %f16
	.word	0x3d800006	! t0_kref+0x4160:   	fbule,a	_kref+0x4178
	.word	0x91b2471b	! t0_kref+0x4164:   	fmuld8sux16	%f9, %f27, %f8
	.word	0x92e00009	! t0_kref+0x4168:   	subccc	%g0, %o1, %o1
	.word	0xf428a03b	! t0_kref+0x416c:   	stb	%i2, [%g2 + 0x3b]
	.word	0x98834014	! t0_kref+0x4170:   	addcc	%o5, %l4, %o4
	.word	0x908532e4	! t0_kref+0x4174:   	addcc	%l4, -0xd1c, %o0
	.word	0xe826601c	! t0_kref+0x4178:   	st	%l4, [%i1 + 0x1c]
	.word	0x8d85f922	! t0_kref+0x417c:   	wr	%l7, 0xfffff922, %fprs
	.word	0xda4e7ff7	! t0_kref+0x4180:   	ldsb	[%i1 - 9], %o5
	.word	0x3d480006	! t0_kref+0x4184:   	fbule,a,pt	%fcc0, _kref+0x419c
	.word	0xaeb52524	! t0_kref+0x4188:   	orncc	%l4, 0x524, %l7
	.word	0xb5a2c824	! t0_kref+0x418c:   	fadds	%f11, %f4, %f26
	.word	0xa3a01891	! t0_kref+0x4190:   	fitos	%f17, %f17
	.word	0xacf24017	! t0_kref+0x4194:   	udivcc	%o1, %l7, %l6
	.word	0x9f3aa019	! t0_kref+0x4198:   	sra	%o2, 0x19, %o7
	.word	0x98ad8009	! t0_kref+0x419c:   	andncc	%l6, %o1, %o4
	.word	0xa5a3883d	! t0_kref+0x41a0:   	fadds	%f14, %f29, %f18
	.word	0xafa00532	! t0_kref+0x41a4:   	fsqrts	%f18, %f23
	.word	0xd040a020	! t0_kref+0x41a8:   	ldsw	[%g2 + 0x20], %o0
	.word	0xd42e0000	! t0_kref+0x41ac:   	stb	%o2, [%i0]
	.word	0xd1062018	! t0_kref+0x41b0:   	ld	[%i0 + 0x18], %f8
	.word	0x2d480006	! t0_kref+0x41b4:   	fbg,a,pt	%fcc0, _kref+0x41cc
	.word	0x81858000	! t0_kref+0x41b8:   	wr	%l6, %g0, %y
	.word	0xdd066018	! t0_kref+0x41bc:   	ld	[%i1 + 0x18], %f14
	.word	0x9ad326c3	! t0_kref+0x41c0:   	umulcc	%o4, 0x6c3, %o5
	.word	0x95b586f6	! t0_kref+0x41c4:   	fmul8ulx16	%f22, %f22, %f10
	.word	0xde00a000	! t0_kref+0x41c8:   	ld	[%g2], %o7
	.word	0xd8be1000	! t0_kref+0x41cc:   	stda	%o4, [%i0]0x80
	.word	0xf13e6018	! t0_kref+0x41d0:   	std	%f24, [%i1 + 0x18]
	.word	0x8bb48d27	! t0_kref+0x41d4:   	fandnot1s	%f18, %f7, %f5
	.word	0x9de3bfa0	! t0_kref+0x41d8:   	save	%sp, -0x60, %sp
	.word	0xba662da4	! t0_kref+0x41dc:   	subc	%i0, 0xda4, %i5
	.word	0x9beec01a	! t0_kref+0x41e0:   	restore	%i3, %i2, %o5
	.word	0xc9270018	! t0_kref+0x41e4:   	st	%f4, [%i4 + %i0]
	.word	0x9fb3cd60	! t0_kref+0x41e8:   	fnot1s	%f15, %f15
	.word	0xa5a208d2	! t0_kref+0x41ec:   	fsubd	%f8, %f18, %f18
	.word	0x9fc10000	! t0_kref+0x41f0:   	call	%g4
	.word	0x913c800b	! t0_kref+0x41f4:   	sra	%l2, %o3, %o0
	.word	0x25480007	! t0_kref+0x41f8:   	fblg,a,pt	%fcc0, _kref+0x4214
	.word	0x858224ed	! t0_kref+0x41fc:   	wr	%o0, 0x4ed, %ccr
	.word	0xe1be9a18	! t0_kref+0x4200:   	stda	%f16, [%i2 + %i0]0xd0
	.word	0xffee501b	! t0_kref+0x4204:   	prefetcha	%i1 + %i3, 31
	.word	0x8db00cd8	! t0_kref+0x4208:   	fnot2	%f24, %f6
	.word	0xef26401c	! t0_kref+0x420c:   	st	%f23, [%i1 + %i4]
	.word	0x8db00c00	! t0_kref+0x4210:   	fzero	%f6
	.word	0xecbe101d	! t0_kref+0x4214:   	stda	%l6, [%i0 + %i5]0x80
	.word	0xee50a000	! t0_kref+0x4218:   	ldsh	[%g2], %l7
	.word	0xe700a000	! t0_kref+0x421c:   	ld	[%g2], %f19
	.word	0xaf400000	! t0_kref+0x4220:   	mov	%y, %l7
	.word	0xa1b106a5	! t0_kref+0x4224:   	fmul8x16al	%f4, %f5, %f16
	.word	0xb1a00533	! t0_kref+0x4228:   	fsqrts	%f19, %f24
	call	SYM(t0_subr2)
	.word	0xec00a030	! t0_kref+0x4230:   	ld	[%g2 + 0x30], %l6
	.word	0x9ea827b3	! t0_kref+0x4234:   	andncc	%g0, 0x7b3, %o7
	.word	0xd900a018	! t0_kref+0x4238:   	ld	[%g2 + 0x18], %f12
	.word	0x3d480002	! t0_kref+0x423c:   	fbule,a,pt	%fcc0, _kref+0x4244
	.word	0x9f35a011	! t0_kref+0x4240:   	srl	%l6, 0x11, %o7
	.word	0x8582f0f2	! t0_kref+0x4244:   	wr	%o3, 0xfffff0f2, %ccr
	.word	0x9da509c6	! t0_kref+0x4248:   	fdivd	%f20, %f6, %f14
	.word	0xd64e401a	! t0_kref+0x424c:   	ldsb	[%i1 + %i2], %o3
	.word	0x81b4c028	! t0_kref+0x4250:   	edge8n	%l3, %o0, %g0
	.word	0xe100a000	! t0_kref+0x4254:   	ld	[%g2], %f16
	.word	0x2f800001	! t0_kref+0x4258:   	fbu,a	_kref+0x425c
	.word	0x9db38c88	! t0_kref+0x425c:   	fandnot2	%f14, %f8, %f14
	.word	0x9bb24169	! t0_kref+0x4260:   	edge32ln	%o1, %o1, %o5
	.word	0x9025c008	! t0_kref+0x4264:   	sub	%l7, %o0, %o0
	.word	0x91b28c90	! t0_kref+0x4268:   	fandnot2	%f10, %f16, %f8
	.word	0x9ac50016	! t0_kref+0x426c:   	addccc	%l4, %l6, %o5
	.word	0x81ab8a37	! t0_kref+0x4270:   	fcmps	%fcc0, %f14, %f23
	.word	0x81d80010	! t0_kref+0x4274:   	flush	%g0 + %l0
	.word	0x37800001	! t0_kref+0x4278:   	fbge,a	_kref+0x427c
	.word	0xf7871019	! t0_kref+0x427c:   	lda	[%i4 + %i1]0x80, %f27
	.word	0xd07f0018	! t0_kref+0x4280:   	swap	[%i4 + %i0], %o0
	.word	0xd006600c	! t0_kref+0x4284:   	ld	[%i1 + 0xc], %o0
	.word	0x99a1c9b8	! t0_kref+0x4288:   	fdivs	%f7, %f24, %f12
	.word	0xd236601c	! t0_kref+0x428c:   	sth	%o1, [%i1 + 0x1c]
	.word	0x9bb58280	! t0_kref+0x4290:   	array32	%l6, %g0, %o5
	.word	0xd926401c	! t0_kref+0x4294:   	st	%f12, [%i1 + %i4]
	.word	0x9a74c00a	! t0_kref+0x4298:   	udiv	%l3, %o2, %o5
	.word	0x81ab8ad2	! t0_kref+0x429c:   	fcmped	%fcc0, %f14, %f18
	.word	0x91b50d28	! t0_kref+0x42a0:   	fandnot1s	%f20, %f8, %f8
	.word	0x9275fdae	! t0_kref+0x42a4:   	udiv	%l7, -0x252, %o1
	.word	0xd01e2018	! t0_kref+0x42a8:   	ldd	[%i0 + 0x18], %o0
	.word	0x9a8528a1	! t0_kref+0x42ac:   	addcc	%l4, 0x8a1, %o5
	.word	0x98bd8016	! t0_kref+0x42b0:   	xnorcc	%l6, %l6, %o4
	.word	0xde96d018	! t0_kref+0x42b4:   	lduha	[%i3 + %i0]0x80, %o7
	.word	0xde40a020	! t0_kref+0x42b8:   	ldsw	[%g2 + 0x20], %o7
	.word	0xb1a00548	! t0_kref+0x42bc:   	fsqrtd	%f8, %f24
	.word	0xa1b68e80	! t0_kref+0x42c0:   	fsrc1	%f26, %f16
	.word	0x8da348a4	! t0_kref+0x42c4:   	fsubs	%f13, %f4, %f6
	.word	0x92958013	! t0_kref+0x42c8:   	orcc	%l6, %l3, %o1
	.word	0xf11e401d	! t0_kref+0x42cc:   	ldd	[%i1 + %i5], %f24
	.word	0xd650a022	! t0_kref+0x42d0:   	ldsh	[%g2 + 0x22], %o3
	.word	0x90503f35	! t0_kref+0x42d4:   	umul	%g0, -0xcb, %o0
	.word	0xea36c019	! t0_kref+0x42d8:   	sth	%l5, [%i3 + %i1]
	.word	0x2c800004	! t0_kref+0x42dc:   	bneg,a	_kref+0x42ec
	.word	0x9025b781	! t0_kref+0x42e0:   	sub	%l6, -0x87f, %o0
	.word	0x9233401a	! t0_kref+0x42e4:   	orn	%o5, %i2, %o1
	.word	0xaf35e011	! t0_kref+0x42e8:   	srl	%l7, 0x11, %l7
	.word	0xecd6d019	! t0_kref+0x42ec:   	ldsha	[%i3 + %i1]0x80, %l6
	.word	0xb1b1c706	! t0_kref+0x42f0:   	fmuld8sux16	%f7, %f6, %f24
	.word	0xee360000	! t0_kref+0x42f4:   	sth	%l7, [%i0]
	.word	0xf4a61000	! t0_kref+0x42f8:   	sta	%i2, [%i0]0x80
	.word	0xd01e4000	! t0_kref+0x42fc:   	ldd	[%i1], %o0
	.word	0x132033aa	! t0_kref+0x4300:   	sethi	%hi(0x80cea800), %o1
	.word	0xa5b38f88	! t0_kref+0x4304:   	for	%f14, %f8, %f18
	.word	0x9624800a	! t0_kref+0x4308:   	sub	%l2, %o2, %o3
	.word	0xc0000019	! t0_kref+0x430c:   	ld	[%g0 + %i1], %g0
	.word	0x86102001	! t0_kref+0x4310:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x4314:   	bne,a	_kref+0x4314
	.word	0x86a0e001	! t0_kref+0x4318:   	subcc	%g3, 1, %g3
	.word	0xd6270018	! t0_kref+0x431c:   	st	%o3, [%i4 + %i0]
	.word	0x97b20486	! t0_kref+0x4320:   	fcmple32	%f8, %f6, %o3
	.word	0x3f480007	! t0_kref+0x4324:   	fbo,a,pt	%fcc0, _kref+0x4340
	.word	0xec1e2010	! t0_kref+0x4328:   	ldd	[%i0 + 0x10], %l6
	.word	0xa9a0190f	! t0_kref+0x432c:   	fitod	%f15, %f20
	.word	0xd24e200c	! t0_kref+0x4330:   	ldsb	[%i0 + 0xc], %o1
	.word	0xa5b24ab0	! t0_kref+0x4334:   	fpsub16s	%f9, %f16, %f18
	.word	0xada000b0	! t0_kref+0x4338:   	fnegs	%f16, %f22
	.word	0x9e86ae29	! t0_kref+0x433c:   	addcc	%i2, 0xe29, %o7
	.word	0x9f02e855	! t0_kref+0x4340:   	taddcc	%o3, 0x855, %o7
	.word	0x112790f0	! t0_kref+0x4344:   	sethi	%hi(0x9e43c000), %o0
	.word	0xd0063ff0	! t0_kref+0x4348:   	ld	[%i0 - 0x10], %o0
	.word	0x23800008	! t0_kref+0x434c:   	fbne,a	_kref+0x436c
	.word	0x80526bbe	! t0_kref+0x4350:   	umul	%o1, 0xbbe, %g0
	.word	0xb1a018dc	! t0_kref+0x4354:   	fdtos	%f28, %f24
	.word	0xf4380018	! t0_kref+0x4358:   	std	%i2, [%g0 + %i0]
	.word	0xd64e3fec	! t0_kref+0x435c:   	ldsb	[%i0 - 0x14], %o3
	.word	0xd608a031	! t0_kref+0x4360:   	ldub	[%g2 + 0x31], %o3
	.word	0xc008a030	! t0_kref+0x4364:   	ldub	[%g2 + 0x30], %g0
	.word	0xb7a00529	! t0_kref+0x4368:   	fsqrts	%f9, %f27
	.word	0x9de3bfa0	! t0_kref+0x436c:   	save	%sp, -0x60, %sp
	.word	0x81ee001b	! t0_kref+0x4370:   	restore	%i0, %i3, %g0
	.word	0x8bb00fe0	! t0_kref+0x4374:   	fones	%f5
	.word	0xda08a013	! t0_kref+0x4378:   	ldub	[%g2 + 0x13], %o5
	.word	0x805db3fb	! t0_kref+0x437c:   	smul	%l6, -0xc05, %g0
	.word	0x89a4084a	! t0_kref+0x4380:   	faddd	%f16, %f10, %f4
	.word	0xada188d0	! t0_kref+0x4384:   	fsubd	%f6, %f16, %f22
	.word	0xb3a14924	! t0_kref+0x4388:   	fmuls	%f5, %f4, %f25
	call	SYM(t0_subr3)
	.word	0xa0e34013	! t0_kref+0x4390:   	subccc	%o5, %l3, %l0
	.word	0x9de3bfa0	! t0_kref+0x4394:   	save	%sp, -0x60, %sp
	.word	0xb8d6801c	! t0_kref+0x4398:   	umulcc	%i2, %i4, %i4
	.word	0x9bee001d	! t0_kref+0x439c:   	restore	%i0, %i5, %o5
	.word	0x94702f82	! t0_kref+0x43a0:   	udiv	%g0, 0xf82, %o2
	.word	0xc0163fee	! t0_kref+0x43a4:   	lduh	[%i0 - 0x12], %g0
	.word	0xa5a01a44	! t0_kref+0x43a8:   	fdtoi	%f4, %f18
	.word	0x9fa44926	! t0_kref+0x43ac:   	fmuls	%f17, %f6, %f15
	.word	0x91324014	! t0_kref+0x43b0:   	srl	%o1, %l4, %o0
	.word	0x31480003	! t0_kref+0x43b4:   	fba,a,pt	%fcc0, _kref+0x43c0
	.word	0xd0861000	! t0_kref+0x43b8:   	lda	[%i0]0x80, %o0
	.word	0xd09e101d	! t0_kref+0x43bc:   	ldda	[%i0 + %i5]0x80, %o0
	.word	0xeab6501b	! t0_kref+0x43c0:   	stha	%l5, [%i1 + %i3]0x80
	.word	0x81400000	! t0_kref+0x43c4:   	mov	%y, %g0
	.word	0xb1a74939	! t0_kref+0x43c8:   	fmuls	%f29, %f25, %f24
	.word	0xf207bfe0	! t0_kref+0x43cc:   	ld	[%fp - 0x20], %i1
	.word	0x81ad0a25	! t0_kref+0x43d0:   	fcmps	%fcc0, %f20, %f5
	.word	0xb7a1c8b2	! t0_kref+0x43d4:   	fsubs	%f7, %f18, %f27
	.word	0x8da309da	! t0_kref+0x43d8:   	fdivd	%f12, %f26, %f6
	.word	0x90228016	! t0_kref+0x43dc:   	sub	%o2, %l6, %o0
	.word	0xac053949	! t0_kref+0x43e0:   	add	%l4, -0x6b7, %l6
	.word	0x9ba00539	! t0_kref+0x43e4:   	fsqrts	%f25, %f13
	.word	0xee460000	! t0_kref+0x43e8:   	ldsw	[%i0], %l7
	.word	0xf91e3fe8	! t0_kref+0x43ec:   	ldd	[%i0 - 0x18], %f28
	.word	0xc00e001a	! t0_kref+0x43f0:   	ldub	[%i0 + %i2], %g0
	.word	0xfb200019	! t0_kref+0x43f4:   	st	%f29, [%g0 + %i1]
	.word	0xd01e6018	! t0_kref+0x43f8:   	ldd	[%i1 + 0x18], %o0
	.word	0x8184c000	! t0_kref+0x43fc:   	wr	%l3, %g0, %y
	.word	0xb3b24d25	! t0_kref+0x4400:   	fandnot1s	%f9, %f5, %f25
	.word	0x36800005	! t0_kref+0x4404:   	bge,a	_kref+0x4418
	.word	0xd648a039	! t0_kref+0x4408:   	ldsb	[%g2 + 0x39], %o3
	.word	0xd208a018	! t0_kref+0x440c:   	ldub	[%g2 + 0x18], %o1
	.word	0xdaa01018	! t0_kref+0x4410:   	sta	%o5, [%g0 + %i0]0x80
	.word	0x9ae00017	! t0_kref+0x4414:   	subccc	%g0, %l7, %o5
	.word	0x98553a94	! t0_kref+0x4418:   	umul	%l4, -0x56c, %o4
	.word	0xc0df5019	! t0_kref+0x441c:   	ldxa	[%i5 + %i1]0x80, %g0
	.word	0xd240a030	! t0_kref+0x4420:   	ldsw	[%g2 + 0x30], %o1
	.word	0xd448a033	! t0_kref+0x4424:   	ldsb	[%g2 + 0x33], %o2
	.word	0xf9b81019	! t0_kref+0x4428:   	stda	%f28, [%g0 + %i1]0x80
	.word	0x81854000	! t0_kref+0x442c:   	wr	%l5, %g0, %y
	.word	0xd4366010	! t0_kref+0x4430:   	sth	%o2, [%i1 + 0x10]
	.word	0x8045e10c	! t0_kref+0x4434:   	addc	%l7, 0x10c, %g0
	call	SYM(t0_subr3)
	.word	0xd4a01018	! t0_kref+0x443c:   	sta	%o2, [%g0 + %i0]0x80
	.word	0x802a001a	! t0_kref+0x4440:   	andn	%o0, %i2, %g0
	.word	0x89a00550	! t0_kref+0x4444:   	fsqrtd	%f16, %f4
	.word	0xb1a000ad	! t0_kref+0x4448:   	fnegs	%f13, %f24
	.word	0x9a8a2f69	! t0_kref+0x444c:   	andcc	%o0, 0xf69, %o5
	.word	0x9962e133	! t0_kref+0x4450:   	movge	%fcc0, 0x133, %o4
	.word	0xc078a028	! t0_kref+0x4454:   	swap	[%g2 + 0x28], %g0
	.word	0x9422e6ec	! t0_kref+0x4458:   	sub	%o3, 0x6ec, %o2
	call	SYM(t0_subr0)
	.word	0x80048016	! t0_kref+0x4460:   	add	%l2, %l6, %g0
	.word	0xf300a000	! t0_kref+0x4464:   	ld	[%g2], %f25
	.word	0x9015400c	! t0_kref+0x4468:   	or	%l5, %o4, %o0
	.word	0x90634012	! t0_kref+0x446c:   	subc	%o5, %l2, %o0
	.word	0x2f480008	! t0_kref+0x4470:   	fbu,a,pt	%fcc0, _kref+0x4490
	.word	0xd608a028	! t0_kref+0x4474:   	ldub	[%g2 + 0x28], %o3
	.word	0x9fc70000	! t0_kref+0x4478:   	call	%i4
	.word	0xb9a408c4	! t0_kref+0x447c:   	fsubd	%f16, %f4, %f28
	.word	0xae768016	! t0_kref+0x4480:   	udiv	%i2, %l6, %l7
	.word	0x97b1cd28	! t0_kref+0x4484:   	fandnot1s	%f7, %f8, %f11
	.word	0xee2e3ffd	! t0_kref+0x4488:   	stb	%l7, [%i0 - 3]
	.word	0xd6264000	! t0_kref+0x448c:   	st	%o3, [%i1]
	.word	0xe27f0018	! t0_kref+0x4490:   	swap	[%i4 + %i0], %l1
	.word	0xaee24015	! t0_kref+0x4494:   	subccc	%o1, %l5, %l7
	.word	0x9616800d	! t0_kref+0x4498:   	or	%i2, %o5, %o3
	.word	0xadb4c71d	! t0_kref+0x449c:   	fmuld8sux16	%f19, %f29, %f22
	.word	0x95a18832	! t0_kref+0x44a0:   	fadds	%f6, %f18, %f10
	.word	0xc000a020	! t0_kref+0x44a4:   	ld	[%g2 + 0x20], %g0
	.word	0x3f480007	! t0_kref+0x44a8:   	fbo,a,pt	%fcc0, _kref+0x44c4
	.word	0x901eb7ea	! t0_kref+0x44ac:   	xor	%i2, -0x816, %o0
	.word	0xa1a00548	! t0_kref+0x44b0:   	fsqrtd	%f8, %f16
	.word	0xee10a018	! t0_kref+0x44b4:   	lduh	[%g2 + 0x18], %l7
	.word	0xd0270019	! t0_kref+0x44b8:   	st	%o0, [%i4 + %i1]
	call	0x000005ac
	.word	0xd44e0000	! t0_kref+0x44c0:   	ldsb	[%i0], %o2
	.word	0x968e8009	! t0_kref+0x44c4:   	andcc	%i2, %o1, %o3
	.word	0x9a35aa56	! t0_kref+0x44c8:   	orn	%l6, 0xa56, %o5
	.word	0xde064000	! t0_kref+0x44cc:   	ld	[%i1], %o7
	.word	0xdec71019	! t0_kref+0x44d0:   	ldswa	[%i4 + %i1]0x80, %o7
	.word	0xee08a000	! t0_kref+0x44d4:   	ldub	[%g2], %l7
	.word	0xadb00f36	! t0_kref+0x44d8:   	fsrc2s	%f22, %f22
	.word	0x953a6000	! t0_kref+0x44dc:   	sra	%o1, 0x0, %o2
	.word	0x2d480004	! t0_kref+0x44e0:   	fbg,a,pt	%fcc0, _kref+0x44f0
	.word	0x9a5b000c	! t0_kref+0x44e4:   	smul	%o4, %o4, %o5
	.word	0x92768013	! t0_kref+0x44e8:   	udiv	%i2, %l3, %o1
	.word	0x23480001	! t0_kref+0x44ec:   	fbne,a,pt	%fcc0, _kref+0x44f0
	.word	0x93a0189b	! t0_kref+0x44f0:   	fitos	%f27, %f9
	.word	0x2e480002	! t0_kref+0x44f4:   	bvs,a,pt	%icc, _kref+0x44fc
	.word	0xd01e401d	! t0_kref+0x44f8:   	ldd	[%i1 + %i5], %o0
	.word	0xd306001c	! t0_kref+0x44fc:   	ld	[%i0 + %i4], %f9
	.word	0x29480001	! t0_kref+0x4500:   	fbl,a,pt	%fcc0, _kref+0x4504
	.word	0x173b08be	! t0_kref+0x4504:   	sethi	%hi(0xec22f800), %o3
	.word	0x2a480008	! t0_kref+0x4508:   	bcs,a,pt	%icc, _kref+0x4528
	.word	0x9292a7bd	! t0_kref+0x450c:   	orcc	%o2, 0x7bd, %o1
	.word	0x96c4a138	! t0_kref+0x4510:   	addccc	%l2, 0x138, %o3
	.word	0xc020a038	! t0_kref+0x4514:   	clr	[%g2 + 0x38]
	.word	0xaf408000	! t0_kref+0x4518:   	mov	%ccr, %l7
	.word	0x89a40d2c	! t0_kref+0x451c:   	fsmuld	%f16, %f12, %f4
	.word	0x9863400a	! t0_kref+0x4520:   	subc	%o5, %o2, %o4
	.word	0xe26e401a	! t0_kref+0x4524:   	ldstub	[%i1 + %i2], %l1
	.word	0xed3e7ff0	! t0_kref+0x4528:   	std	%f22, [%i1 - 0x10]
	.word	0xb5a0054e	! t0_kref+0x452c:   	fsqrtd	%f14, %f26
	.word	0xd01e0000	! t0_kref+0x4530:   	ldd	[%i0], %o0
	.word	0xd440a038	! t0_kref+0x4534:   	ldsw	[%g2 + 0x38], %o2
	.word	0x81ad0a25	! t0_kref+0x4538:   	fcmps	%fcc0, %f20, %f5
	.word	0xd4262008	! t0_kref+0x453c:   	st	%o2, [%i0 + 8]
	.word	0xd40e2012	! t0_kref+0x4540:   	ldub	[%i0 + 0x12], %o2
	.word	0x9da01a33	! t0_kref+0x4544:   	fstoi	%f19, %f14
	.word	0x93400000	! t0_kref+0x4548:   	mov	%y, %o1
	.word	0x22800002	! t0_kref+0x454c:   	be,a	_kref+0x4554
	.word	0xd8280019	! t0_kref+0x4550:   	stb	%o4, [%g0 + %i1]
	.word	0x971ab98b	! t0_kref+0x4554:   	tsubcctv	%o2, -0x675, %o3
	.word	0xd67e0000	! t0_kref+0x4558:   	swap	[%i0], %o3
	.word	0x96724016	! t0_kref+0x455c:   	udiv	%o1, %l6, %o3
	.word	0x112602ac	! t0_kref+0x4560:   	sethi	%hi(0x980ab000), %o0
	.word	0xa5a00535	! t0_kref+0x4564:   	fsqrts	%f21, %f18
	.word	0x3f800003	! t0_kref+0x4568:   	fbo,a	_kref+0x4574
	.word	0xfb00a018	! t0_kref+0x456c:   	ld	[%g2 + 0x18], %f29
	.word	0xe628a008	! t0_kref+0x4570:   	stb	%l3, [%g2 + 8]
	.word	0x93b680e9	! t0_kref+0x4574:   	edge16ln	%i2, %o1, %o1
	.word	0x9012c00b	! t0_kref+0x4578:   	or	%o3, %o3, %o0
	.word	0xadb5034c	! t0_kref+0x457c:   	alignaddrl	%l4, %o4, %l6
	.word	0xd0200018	! t0_kref+0x4580:   	st	%o0, [%g0 + %i0]
	.word	0x9de3bfa0	! t0_kref+0x4584:   	save	%sp, -0x60, %sp
	.word	0x81ee001c	! t0_kref+0x4588:   	restore	%i0, %i4, %g0
	.word	0x9afca266	! t0_kref+0x458c:   	sdivcc	%l2, 0x266, %o5
	.word	0xc91fbe78	! t0_kref+0x4590:   	ldd	[%fp - 0x188], %f4
	.word	0xe51fbdd0	! t0_kref+0x4594:   	ldd	[%fp - 0x230], %f18
	.word	0x33800002	! t0_kref+0x4598:   	fbe,a	_kref+0x45a0
	.word	0x90722127	! t0_kref+0x459c:   	udiv	%o0, 0x127, %o0
	.word	0xada0055c	! t0_kref+0x45a0:   	fsqrtd	%f28, %f22
	.word	0x92f828b8	! t0_kref+0x45a4:   	sdivcc	%g0, 0x8b8, %o1
	.word	0x9da00554	! t0_kref+0x45a8:   	fsqrtd	%f20, %f14
	.word	0x2a800006	! t0_kref+0x45ac:   	bcs,a	_kref+0x45c4
	.word	0x81152cd7	! t0_kref+0x45b0:   	taddcctv	%l4, 0xcd7, %g0
	.word	0xb9a688c8	! t0_kref+0x45b4:   	fsubd	%f26, %f8, %f28
	.word	0xd8d01019	! t0_kref+0x45b8:   	ldsha	[%g0 + %i1]0x80, %o4
	.word	0xda5029da	! t0_kref+0x45bc:   	ldsh	[%g0 + 0x9da], %o5
	.word	0xf420a018	! t0_kref+0x45c0:   	st	%i2, [%g2 + 0x18]
	.word	0x9812800a	! t0_kref+0x45c4:   	or	%o2, %o2, %o4
	call	SYM(t0_subr3)
	.word	0xc04e201e	! t0_kref+0x45cc:   	ldsb	[%i0 + 0x1e], %g0
	.word	0x933b400d	! t0_kref+0x45d0:   	sra	%o5, %o5, %o1
	.word	0xac0374de	! t0_kref+0x45d4:   	add	%o5, -0xb22, %l6
	.word	0xacab001a	! t0_kref+0x45d8:   	andncc	%o4, %i2, %l6
	.word	0x812d2005	! t0_kref+0x45dc:   	sll	%l4, 0x5, %g0
	.word	0x99a0014a	! t0_kref+0x45e0:   	fabsd	%f10, %f12
	.word	0xacb3610d	! t0_kref+0x45e4:   	orncc	%o5, 0x10d, %l6
	.word	0xaee3000a	! t0_kref+0x45e8:   	subccc	%o4, %o2, %l7
	.word	0x98702ae5	! t0_kref+0x45ec:   	udiv	%g0, 0xae5, %o4
	.word	0x89a0055a	! t0_kref+0x45f0:   	fsqrtd	%f26, %f4
	.word	0x3b800008	! t0_kref+0x45f4:   	fble,a	_kref+0x4614
	.word	0xda0e2010	! t0_kref+0x45f8:   	ldub	[%i0 + 0x10], %o5
	.word	0xc0366010	! t0_kref+0x45fc:   	clrh	[%i1 + 0x10]
	.word	0xaf33200d	! t0_kref+0x4600:   	srl	%o4, 0xd, %l7
	.word	0x8ba2483b	! t0_kref+0x4604:   	fadds	%f9, %f27, %f5
	.word	0x95702ae6	! t0_kref+0x4608:   	popc	0xae6, %o2
	.word	0xb7b007ae	! t0_kref+0x460c:   	fpackfix	%f14, %f27
	.word	0x8da0190b	! t0_kref+0x4610:   	fitod	%f11, %f6
	.word	0xd24e600f	! t0_kref+0x4614:   	ldsb	[%i1 + 0xf], %o1
	.word	0xe8366000	! t0_kref+0x4618:   	sth	%l4, [%i1]
	.word	0x95b18d60	! t0_kref+0x461c:   	fnot1s	%f6, %f10
	.word	0x9f0d4000	! t0_kref+0x4620:   	tsubcc	%l5, %g0, %o7
	.word	0xec48a031	! t0_kref+0x4624:   	ldsb	[%g2 + 0x31], %l6
	.word	0xe7ee501b	! t0_kref+0x4628:   	prefetcha	%i1 + %i3, 19
	.word	0x96d5400a	! t0_kref+0x462c:   	umulcc	%l5, %o2, %o3
	.word	0xb9a488c8	! t0_kref+0x4630:   	fsubd	%f18, %f8, %f28
	.word	0xa1a5095a	! t0_kref+0x4634:   	fmuld	%f20, %f26, %f16
	.word	0xd4df5018	! t0_kref+0x4638:   	ldxa	[%i5 + %i0]0x80, %o2
	.word	0xc568a00e	! t0_kref+0x463c:   	prefetch	%g2 + 0xe, 2
	.word	0xe900a030	! t0_kref+0x4640:   	ld	[%g2 + 0x30], %f20
	.word	0xec1e4000	! t0_kref+0x4644:   	ldd	[%i1], %l6
	.word	0x81580000	! t0_kref+0x4648:   	flushw
	.word	0xe6300019	! t0_kref+0x464c:   	sth	%l3, [%g0 + %i1]
	.word	0x9fc00004	! t0_kref+0x4650:   	call	%g0 + %g4
	.word	0xe0de5000	! t0_kref+0x4654:   	ldxa	[%i1]0x80, %l0
	.word	0xa5a1cd39	! t0_kref+0x4658:   	fsmuld	%f7, %f25, %f18
	.word	0x9fb500cd	! t0_kref+0x465c:   	edge16l	%l4, %o5, %o7
	.word	0x9de3bfa0	! t0_kref+0x4660:   	save	%sp, -0x60, %sp
	.word	0x800e3427	! t0_kref+0x4664:   	and	%i0, -0xbd9, %g0
	.word	0xafee3dee	! t0_kref+0x4668:   	restore	%i0, -0x212, %l7
	.word	0xa9a189a9	! t0_kref+0x466c:   	fdivs	%f6, %f9, %f20
	.word	0x86102021	! t0_kref+0x4670:   	mov	0x21, %g3
	.word	0x86a0e001	! t0_kref+0x4674:   	subcc	%g3, 1, %g3
	.word	0x22800002	! t0_kref+0x4678:   	be,a	_kref+0x4680
	.word	0xd400a028	! t0_kref+0x467c:   	ld	[%g2 + 0x28], %o2
	.word	0xf4bf5019	! t0_kref+0x4680:   	stda	%i2, [%i5 + %i1]0x80
	.word	0xdf070019	! t0_kref+0x4684:   	ld	[%i4 + %i1], %f15
	.word	0xdafe501c	! t0_kref+0x4688:   	swapa	[%i1 + %i4]0x80, %o5
	.word	0x8fa01a56	! t0_kref+0x468c:   	fdtoi	%f22, %f7
	.word	0x9140c000	! t0_kref+0x4690:   	mov	%asi, %o0
	.word	0x97b54100	! t0_kref+0x4694:   	edge32	%l5, %g0, %o3
	.word	0x99b58f94	! t0_kref+0x4698:   	for	%f22, %f20, %f12
	.word	0x94134015	! t0_kref+0x469c:   	or	%o5, %l5, %o2
	.word	0x8db40a58	! t0_kref+0x46a0:   	fpadd32	%f16, %f24, %f6
	.word	0xd410a028	! t0_kref+0x46a4:   	lduh	[%g2 + 0x28], %o2
	.word	0x9fb00fe0	! t0_kref+0x46a8:   	fones	%f15
	.word	0x9fc00004	! t0_kref+0x46ac:   	call	%g0 + %g4
	.word	0xc5ee500b	! t0_kref+0x46b0:   	prefetcha	%i1 + %o3, 2
	.word	0xb9b00f18	! t0_kref+0x46b4:   	fsrc2	%f24, %f28
	.word	0x8db146a7	! t0_kref+0x46b8:   	fmul8x16al	%f5, %f7, %f6
	.word	0x99a0192b	! t0_kref+0x46bc:   	fstod	%f11, %f12
	.word	0xf9be1894	! t0_kref+0x46c0:   	stda	%f28, [%i0 + %l4]0xc4
	.word	0x9b05c012	! t0_kref+0x46c4:   	taddcc	%l7, %l2, %o5
	.word	0xd45e7ff8	! t0_kref+0x46c8:   	ldx	[%i1 - 8], %o2
	.word	0xd8062000	! t0_kref+0x46cc:   	ld	[%i0], %o4
	.word	0x9a8a4015	! t0_kref+0x46d0:   	andcc	%o1, %l5, %o5
	.word	0x97a00531	! t0_kref+0x46d4:   	fsqrts	%f17, %f11
	.word	0x9fc10000	! t0_kref+0x46d8:   	call	%g4
	.word	0xe1be5848	! t0_kref+0x46dc:   	stda	%f16, [%i1 + %o0]0xc2
	.word	0x34480003	! t0_kref+0x46e0:   	bg,a,pt	%icc, _kref+0x46ec
	.word	0xd01e401d	! t0_kref+0x46e4:   	ldd	[%i1 + %i5], %o0
	.word	0xd2762008	! t0_kref+0x46e8:   	stx	%o1, [%i0 + 8]
	.word	0x8143e010	! t0_kref+0x46ec:   	membar	0x10
	.word	0xb7a01893	! t0_kref+0x46f0:   	fitos	%f19, %f27
	.word	0x001fffff	! t0_kref+0x46f4:   	illtrap	0x1fffff
	.word	0x3d480007	! t0_kref+0x46f8:   	fbule,a,pt	%fcc0, _kref+0x4714
	.word	0xe42e7fe1	! t0_kref+0x46fc:   	stb	%l2, [%i1 - 0x1f]
	.word	0xa3a1492c	! t0_kref+0x4700:   	fmuls	%f5, %f12, %f17
	.word	0xac8b000a	! t0_kref+0x4704:   	andcc	%o4, %o2, %l6
	.word	0x9bb5404c	! t0_kref+0x4708:   	edge8l	%l5, %o4, %o5
	call	SYM(t0_subr3)
	.word	0xe11fbed8	! t0_kref+0x4710:   	ldd	[%fp - 0x128], %f16
	.word	0x81a90a33	! t0_kref+0x4714:   	fcmps	%fcc0, %f4, %f19
	.word	0x95b58716	! t0_kref+0x4718:   	fmuld8sux16	%f22, %f22, %f10
	.word	0x35800006	! t0_kref+0x471c:   	fbue,a	_kref+0x4734
	.word	0xa5b28d60	! t0_kref+0x4720:   	fnot1s	%f10, %f18
	.word	0x9f3b2008	! t0_kref+0x4724:   	sra	%o4, 0x8, %o7
	.word	0x95b2059c	! t0_kref+0x4728:   	fcmpgt32	%f8, %f28, %o2
	.word	0x151a815f	! t0_kref+0x472c:   	sethi	%hi(0x6a057c00), %o2
	.word	0x9f400000	! t0_kref+0x4730:   	mov	%y, %o7
	.word	0x9de3bfa0	! t0_kref+0x4734:   	save	%sp, -0x60, %sp
	.word	0xadef0018	! t0_kref+0x4738:   	restore	%i4, %i0, %l6
	.word	0x803ca7bb	! t0_kref+0x473c:   	xnor	%l2, 0x7bb, %g0
	.word	0xeb68a04e	! t0_kref+0x4740:   	prefetch	%g2 + 0x4e, 21
	.word	0x9da54936	! t0_kref+0x4744:   	fmuls	%f21, %f22, %f14
	.word	0xe91fbc08	! t0_kref+0x4748:   	ldd	[%fp - 0x3f8], %f20
	.word	0x878020d2	! t0_kref+0x474c:   	mov	0xd2, %asi
	.word	0xe1200019	! t0_kref+0x4750:   	st	%f16, [%g0 + %i1]
	.word	0x30480004	! t0_kref+0x4754:   	ba,a,pt	%icc, _kref+0x4764
	.word	0xd09e101d	! t0_kref+0x4758:   	ldda	[%i0 + %i5]0x80, %o0
	.word	0x81a90a3c	! t0_kref+0x475c:   	fcmps	%fcc0, %f4, %f28
	.word	0xe628a03b	! t0_kref+0x4760:   	stb	%l3, [%g2 + 0x3b]
	.word	0x81b500ea	! t0_kref+0x4764:   	edge16ln	%l4, %o2, %g0
	.word	0x99b3855c	! t0_kref+0x4768:   	fcmpeq16	%f14, %f28, %o4
	.word	0x91b30054	! t0_kref+0x476c:   	edge8l	%o4, %l4, %o0
	.word	0xa5a288c8	! t0_kref+0x4770:   	fsubd	%f10, %f8, %f18
	.word	0x99b480d3	! t0_kref+0x4774:   	edge16l	%l2, %l3, %o4
	.word	0xd40e2019	! t0_kref+0x4778:   	ldub	[%i0 + 0x19], %o2
	.word	0xc07e3ff4	! t0_kref+0x477c:   	swap	[%i0 - 0xc], %g0
	.word	0x24480007	! t0_kref+0x4780:   	ble,a,pt	%icc, _kref+0x479c
	.word	0x925a3c40	! t0_kref+0x4784:   	smul	%o0, -0x3c0, %o1
	.word	0x91a00546	! t0_kref+0x4788:   	fsqrtd	%f6, %f8
	.word	0xd208a00a	! t0_kref+0x478c:   	ldub	[%g2 + 0xa], %o1
	.word	0x91b28f46	! t0_kref+0x4790:   	fornot1	%f10, %f6, %f8
	.word	0x9da000a7	! t0_kref+0x4794:   	fnegs	%f7, %f14
	.word	0x25480008	! t0_kref+0x4798:   	fblg,a,pt	%fcc0, _kref+0x47b8
	.word	0x932a2017	! t0_kref+0x479c:   	sll	%o0, 0x17, %o1
	.word	0x89a01895	! t0_kref+0x47a0:   	fitos	%f21, %f4
	.word	0x80534013	! t0_kref+0x47a4:   	umul	%o5, %l3, %g0
	call	SYM(t0_subr3)
	.word	0x9082801a	! t0_kref+0x47ac:   	addcc	%o2, %i2, %o0
	.word	0x95a000ae	! t0_kref+0x47b0:   	fnegs	%f14, %f10
	.word	0xc06e0000	! t0_kref+0x47b4:   	ldstub	[%i0], %g0
	.word	0x9a8a0014	! t0_kref+0x47b8:   	andcc	%o0, %l4, %o5
	.word	0x35480005	! t0_kref+0x47bc:   	fbue,a,pt	%fcc0, _kref+0x47d0
	.word	0xa5b20d18	! t0_kref+0x47c0:   	fandnot1	%f8, %f24, %f18
	.word	0xd4366004	! t0_kref+0x47c4:   	sth	%o2, [%i1 + 4]
	.word	0xe4f6501d	! t0_kref+0x47c8:   	stxa	%l2, [%i1 + %i5]0x80
	.word	0xac95fb41	! t0_kref+0x47cc:   	orcc	%l7, -0x4bf, %l6
	.word	0x9da188c6	! t0_kref+0x47d0:   	fsubd	%f6, %f6, %f14
	.word	0xe03e3fe0	! t0_kref+0x47d4:   	std	%l0, [%i0 - 0x20]
	.word	0x91a00552	! t0_kref+0x47d8:   	fsqrtd	%f18, %f8
	.word	0x9de3bfa0	! t0_kref+0x47dc:   	save	%sp, -0x60, %sp
	.word	0xb307357b	! t0_kref+0x47e0:   	taddcc	%i4, -0xa85, %i1
	.word	0x95ef0018	! t0_kref+0x47e4:   	restore	%i4, %i0, %o2
	.word	0x2b800001	! t0_kref+0x47e8:   	fbug,a	_kref+0x47ec
	.word	0x9133200a	! t0_kref+0x47ec:   	srl	%o4, 0xa, %o0
	.word	0x925b4017	! t0_kref+0x47f0:   	smul	%o5, %l7, %o1
	.word	0x80054014	! t0_kref+0x47f4:   	add	%l5, %l4, %g0
	.word	0xac25400d	! t0_kref+0x47f8:   	sub	%l5, %o5, %l6
	.word	0xa9a00556	! t0_kref+0x47fc:   	fsqrtd	%f22, %f20
	.word	0x86102001	! t0_kref+0x4800:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x4804:   	bne,a	_kref+0x4804
	.word	0x86a0e001	! t0_kref+0x4808:   	subcc	%g3, 1, %g3
	.word	0xde0e3ff4	! t0_kref+0x480c:   	ldub	[%i0 - 0xc], %o7
	call	SYM(t0_subr1)
	.word	0x8584ed6b	! t0_kref+0x4814:   	wr	%l3, 0xd6b, %ccr
	.word	0xd6a71018	! t0_kref+0x4818:   	sta	%o3, [%i4 + %i0]0x80
	.word	0x99a488bd	! t0_kref+0x481c:   	fsubs	%f18, %f29, %f12
	.word	0xf3ee101c	! t0_kref+0x4820:   	prefetcha	%i0 + %i4, 25
	.word	0xa7b50d60	! t0_kref+0x4824:   	fnot1s	%f20, %f19
	.word	0xda10a012	! t0_kref+0x4828:   	lduh	[%g2 + 0x12], %o5
	.word	0x81820000	! t0_kref+0x482c:   	wr	%o0, %g0, %y
	.word	0xe91e4000	! t0_kref+0x4830:   	ldd	[%i1], %f20
	.word	0x95a408d2	! t0_kref+0x4834:   	fsubd	%f16, %f18, %f10
	.word	0x96753238	! t0_kref+0x4838:   	udiv	%l4, -0xdc8, %o3
	.word	0xd7e61008	! t0_kref+0x483c:   	casa	[%i0]0x80, %o0, %o3
	.word	0xde00a028	! t0_kref+0x4840:   	ld	[%g2 + 0x28], %o7
	.word	0x98bdc00d	! t0_kref+0x4844:   	xnorcc	%l7, %o5, %o4
	.word	0x9a000000	! t0_kref+0x4848:   	add	%g0, %g0, %o5
	.word	0xe100a020	! t0_kref+0x484c:   	ld	[%g2 + 0x20], %f16
	.word	0xd84e401a	! t0_kref+0x4850:   	ldsb	[%i1 + %i2], %o4
	.word	0xa9b009bd	! t0_kref+0x4854:   	fexpand	%f29, %f20
	.word	0x35480002	! t0_kref+0x4858:   	fbue,a,pt	%fcc0, _kref+0x4860
	.word	0xd01e7fe8	! t0_kref+0x485c:   	ldd	[%i1 - 0x18], %o0
	.word	0xd60e401a	! t0_kref+0x4860:   	ldub	[%i1 + %i2], %o3
	.word	0x81aa8ac6	! t0_kref+0x4864:   	fcmped	%fcc0, %f10, %f6
	.word	0xd6564000	! t0_kref+0x4868:   	ldsh	[%i1], %o3
	.word	0xf1be1a5c	! t0_kref+0x486c:   	stda	%f24, [%i0 + %i4]0xd2
	.word	0x8db58a0a	! t0_kref+0x4870:   	fpadd16	%f22, %f10, %f6
	.word	0xd900a000	! t0_kref+0x4874:   	ld	[%g2], %f12
	.word	0x9a04ab88	! t0_kref+0x4878:   	add	%l2, 0xb88, %o5
	.word	0xa1a00544	! t0_kref+0x487c:   	fsqrtd	%f4, %f16
	.word	0xb5a0052f	! t0_kref+0x4880:   	fsqrts	%f15, %f26
	.word	0x21480007	! t0_kref+0x4884:   	fbn,a,pt	%fcc0, _kref+0x48a0
	.word	0xd51fbe20	! t0_kref+0x4888:   	ldd	[%fp - 0x1e0], %f10
	.word	0x93a0003c	! t0_kref+0x488c:   	fmovs	%f28, %f9
	.word	0xb9b30e44	! t0_kref+0x4890:   	fxnor	%f12, %f4, %f28
	.word	0xd80e8019	! t0_kref+0x4894:   	ldub	[%i2 + %i1], %o4
	.word	0x95b00f14	! t0_kref+0x4898:   	fsrc2	%f20, %f10
	.word	0x9db486f0	! t0_kref+0x489c:   	fmul8ulx16	%f18, %f16, %f14
	.word	0x2b480008	! t0_kref+0x48a0:   	fbug,a,pt	%fcc0, _kref+0x48c0
	.word	0x801a6c04	! t0_kref+0x48a4:   	xor	%o1, 0xc04, %g0
	.word	0xef20a020	! t0_kref+0x48a8:   	st	%f23, [%g2 + 0x20]
	call	SYM(t0_subr2)
	.word	0xae15671f	! t0_kref+0x48b0:   	or	%l5, 0x71f, %l7
	.word	0x91a68828	! t0_kref+0x48b4:   	fadds	%f26, %f8, %f8
	.word	0xa1a0055a	! t0_kref+0x48b8:   	fsqrtd	%f26, %f16
	.word	0x9732c009	! t0_kref+0x48bc:   	srl	%o3, %o1, %o3
	.word	0x33480008	! t0_kref+0x48c0:   	fbe,a,pt	%fcc0, _kref+0x48e0
	.word	0xb9b20dd2	! t0_kref+0x48c4:   	fnand	%f8, %f18, %f28
	.word	0xb1b18aca	! t0_kref+0x48c8:   	fpsub32	%f6, %f10, %f24
	.word	0x972dc01a	! t0_kref+0x48cc:   	sll	%l7, %i2, %o3
	.word	0xec1e4000	! t0_kref+0x48d0:   	ldd	[%i1], %l6
	.word	0x92fac014	! t0_kref+0x48d4:   	sdivcc	%o3, %l4, %o1
	.word	0x803ca4f7	! t0_kref+0x48d8:   	xnor	%l2, 0x4f7, %g0
	.word	0x91a5cd2b	! t0_kref+0x48dc:   	fsmuld	%f23, %f11, %f8
	.word	0xa1a509ca	! t0_kref+0x48e0:   	fdivd	%f20, %f10, %f16
	.word	0xc99e9a18	! t0_kref+0x48e4:   	ldda	[%i2 + %i0]0xd0, %f4
	.word	0xd050a01a	! t0_kref+0x48e8:   	ldsh	[%g2 + 0x1a], %o0
	.word	0xad336009	! t0_kref+0x48ec:   	srl	%o5, 0x9, %l6
	.word	0xaec3301a	! t0_kref+0x48f0:   	addccc	%o4, -0xfe6, %l7
	.word	0x29480007	! t0_kref+0x48f4:   	fbl,a,pt	%fcc0, _kref+0x4910
	.word	0xb4103fed	! t0_kref+0x48f8:   	mov	0xffffffed, %i2
	.word	0xe8b6d019	! t0_kref+0x48fc:   	stha	%l4, [%i3 + %i1]0x80
	.word	0x35480006	! t0_kref+0x4900:   	fbue,a,pt	%fcc0, _kref+0x4918
	.word	0xb3b007a6	! t0_kref+0x4904:   	fpackfix	%f6, %f25
	.word	0xa5a00126	! t0_kref+0x4908:   	fabss	%f6, %f18
	.word	0xda264000	! t0_kref+0x490c:   	st	%o5, [%i1]
	.word	0xc04e3fe3	! t0_kref+0x4910:   	ldsb	[%i0 - 0x1d], %g0
	.word	0xd2063fe4	! t0_kref+0x4914:   	ld	[%i0 - 0x1c], %o1
	.word	0x81af0a44	! t0_kref+0x4918:   	fcmpd	%fcc0, %f28, %f4
	.word	0xd01e7fe8	! t0_kref+0x491c:   	ldd	[%i1 - 0x18], %o0
	.word	0xacb6a2b6	! t0_kref+0x4920:   	orncc	%i2, 0x2b6, %l6
	.word	0x9335e010	! t0_kref+0x4924:   	srl	%l7, 0x10, %o1
	.word	0x9a82edb4	! t0_kref+0x4928:   	addcc	%o3, 0xdb4, %o5
	.word	0xc368a0c6	! t0_kref+0x492c:   	prefetch	%g2 + 0xc6, 1
	.word	0xa3a0003a	! t0_kref+0x4930:   	fmovs	%f26, %f17
	.word	0x91a588d2	! t0_kref+0x4934:   	fsubd	%f22, %f18, %f8
	.word	0xe8380019	! t0_kref+0x4938:   	std	%l4, [%g0 + %i1]
	.word	0xf1be5892	! t0_kref+0x493c:   	stda	%f24, [%i1 + %l2]0xc4
	.word	0xe4086adc	! t0_kref+0x4940:   	ldub	[%g1 + 0xadc], %l2
	.word	0xa41ca00c	! t0_kref+0x4944:   	xor	%l2, 0xc, %l2
	.word	0xe4286adc	! t0_kref+0x4948:   	stb	%l2, [%g1 + 0xadc]
	.word	0x81d86adc	! t0_kref+0x494c:   	flush	%g1 + 0xadc
	.word	0xee4e401a	! t0_kref+0x4950:   	ldsb	[%i1 + %i2], %l7
	.word	0x9db68c44	! t0_kref+0x4954:   	fnor	%f26, %f4, %f14
	.word	0x9bb40596	! t0_kref+0x4958:   	fcmpgt32	%f16, %f22, %o5
	.word	0xac1aead7	! t0_kref+0x495c:   	xor	%o3, 0xad7, %l6
	.word	0x2f480005	! t0_kref+0x4960:   	fbu,a,pt	%fcc0, _kref+0x4974
	.word	0x94c54000	! t0_kref+0x4964:   	addccc	%l5, %g0, %o2
	.word	0xda48a010	! t0_kref+0x4968:   	ldsb	[%g2 + 0x10], %o5
	.word	0x9a8b4013	! t0_kref+0x496c:   	andcc	%o5, %l3, %o5
	.word	0xc1e61000	! t0_kref+0x4970:   	casa	[%i0]0x80, %g0, %g0
	.word	0xac24800b	! t0_kref+0x4974:   	sub	%l2, %o3, %l6
	.word	0x9a102e80	! t0_kref+0x4978:   	mov	0xe80, %o5
2:	.word	0xada4482f	! t0_kref+0x497c:   	fadds	%f17, %f15, %f22
	.word	0xd040a038	! t0_kref+0x4980:   	ldsw	[%g2 + 0x38], %o0
	.word	0xc91fbec8	! t0_kref+0x4984:   	ldd	[%fp - 0x138], %f4
	.word	0x93b40ee7	! t0_kref+0x4988:   	fornot2s	%f16, %f7, %f9
	.word	0xa9a34d24	! t0_kref+0x498c:   	fsmuld	%f13, %f4, %f20
	.word	0x98d27ef1	! t0_kref+0x4990:   	umulcc	%o1, -0x10f, %o4
	.word	0xaba489b6	! t0_kref+0x4994:   	fdivs	%f18, %f22, %f21
	.word	0x2b800007	! t0_kref+0x4998:   	fbug,a	_kref+0x49b4
	.word	0xa1a0055a	! t0_kref+0x499c:   	fsqrtd	%f26, %f16
	.word	0x23800006	! t0_kref+0x49a0:   	fbne,a	_kref+0x49b8
	.word	0xde00a000	! t0_kref+0x49a4:   	ld	[%g2], %o7
	.word	0xa9b18e77	! t0_kref+0x49a8:   	fxnors	%f6, %f23, %f20
	.word	0x9333400c	! t0_kref+0x49ac:   	srl	%o5, %o4, %o1
	.word	0xe4264000	! t0_kref+0x49b0:   	st	%l2, [%i1]
	.word	0x9da3c92d	! t0_kref+0x49b4:   	fmuls	%f15, %f13, %f14
	.word	0x90bc8009	! t0_kref+0x49b8:   	xnorcc	%l2, %o1, %o0
	.word	0x92e4e927	! t0_kref+0x49bc:   	subccc	%l3, 0x927, %o1
	.word	0x95b20f88	! t0_kref+0x49c0:   	for	%f8, %f8, %f10
	.word	0x80b3401a	! t0_kref+0x49c4:   	orncc	%o5, %i2, %g0
	.word	0x90858015	! t0_kref+0x49c8:   	addcc	%l6, %l5, %o0
	.word	0x9fa4482f	! t0_kref+0x49cc:   	fadds	%f17, %f15, %f15
	.word	0xec48a013	! t0_kref+0x49d0:   	ldsb	[%g2 + 0x13], %l6
	.word	0xeb00a000	! t0_kref+0x49d4:   	ld	[%g2], %f21
	.word	0xadb4c328	! t0_kref+0x49d8:   	bmask	%l3, %o0, %l6
	.word	0xcd1fbf00	! t0_kref+0x49dc:   	ldd	[%fp - 0x100], %f6
	.word	0x9de3bfa0	! t0_kref+0x49e0:   	save	%sp, -0x60, %sp
	.word	0x99ef4018	! t0_kref+0x49e4:   	restore	%i5, %i0, %o4
	.word	0xdd26001c	! t0_kref+0x49e8:   	st	%f14, [%i0 + %i4]
	.word	0x8fa00536	! t0_kref+0x49ec:   	fsqrts	%f22, %f7
	.word	0x9de3bfa0	! t0_kref+0x49f0:   	save	%sp, -0x60, %sp
	.word	0x97eec01b	! t0_kref+0x49f4:   	restore	%i3, %i3, %o3
	.word	0x81b4c032	! t0_kref+0x49f8:   	edge8n	%l3, %l2, %g0
	.word	0x94fe8009	! t0_kref+0x49fc:   	sdivcc	%i2, %o1, %o2
	.word	0x151dea11	! t0_kref+0x4a00:   	sethi	%hi(0x77a84400), %o2
	.word	0x92b2e54c	! t0_kref+0x4a04:   	orncc	%o3, 0x54c, %o1
	.word	0x81834000	! t0_kref+0x4a08:   	wr	%o5, %g0, %y
	.word	0xa9a0052a	! t0_kref+0x4a0c:   	fsqrts	%f10, %f20
	.word	0x8143c000	! t0_kref+0x4a10:   	stbar
	call	SYM(t0_subr2)
	.word	0x2d2d0c14	! t0_kref+0x4a18:   	sethi	%hi(0xb4305000), %l6
	.word	0xee10a028	! t0_kref+0x4a1c:   	lduh	[%g2 + 0x28], %l7
	.word	0xec167fee	! t0_kref+0x4a20:   	lduh	[%i1 - 0x12], %l6
	.word	0xe856c000	! t0_kref+0x4a24:   	ldsh	[%i3], %l4
	.word	0x8143e040	! t0_kref+0x4a28:   	membar	0x40
	.word	0x9f400000	! t0_kref+0x4a2c:   	mov	%y, %o7
	.word	0xafb30334	! t0_kref+0x4a30:   	bmask	%o4, %l4, %l7
	.word	0x33480008	! t0_kref+0x4a34:   	fbe,a,pt	%fcc0, _kref+0x4a54
	.word	0x191fb364	! t0_kref+0x4a38:   	sethi	%hi(0x7ecd9000), %o4
	.word	0x9b3a2004	! t0_kref+0x4a3c:   	sra	%o0, 0x4, %o5
	.word	0xafa0002c	! t0_kref+0x4a40:   	fmovs	%f12, %f23
	.word	0x2b800005	! t0_kref+0x4a44:   	fbug,a	_kref+0x4a58
	.word	0xb1a209d6	! t0_kref+0x4a48:   	fdivd	%f8, %f22, %f24
	.word	0x9b3d0009	! t0_kref+0x4a4c:   	sra	%l4, %o1, %o5
	.word	0xe9a71018	! t0_kref+0x4a50:   	sta	%f20, [%i4 + %i0]0x80
	.word	0xd00e7fe6	! t0_kref+0x4a54:   	ldub	[%i1 - 0x1a], %o0
	.word	0xaba5883d	! t0_kref+0x4a58:   	fadds	%f22, %f29, %f21
	.word	0xd410a022	! t0_kref+0x4a5c:   	lduh	[%g2 + 0x22], %o2
	.word	0x37800005	! t0_kref+0x4a60:   	fbge,a	_kref+0x4a74
	.word	0x91b5058a	! t0_kref+0x4a64:   	fcmpgt32	%f20, %f10, %o0
	.word	0x93a0012a	! t0_kref+0x4a68:   	fabss	%f10, %f9
	.word	0x99a248a5	! t0_kref+0x4a6c:   	fsubs	%f9, %f5, %f12
	.word	0x9e550017	! t0_kref+0x4a70:   	umul	%l4, %l7, %o7
	.word	0xda26200c	! t0_kref+0x4a74:   	st	%o5, [%i0 + 0xc]
	.word	0xd44e6019	! t0_kref+0x4a78:   	ldsb	[%i1 + 0x19], %o2
	.word	0x9da548a8	! t0_kref+0x4a7c:   	fsubs	%f21, %f8, %f14
	.word	0xa5a01914	! t0_kref+0x4a80:   	fitod	%f20, %f18
	.word	0x001fffff	! t0_kref+0x4a84:   	illtrap	0x1fffff
	.word	0xadb2ce75	! t0_kref+0x4a88:   	fxnors	%f11, %f21, %f22
	.word	0x3b480002	! t0_kref+0x4a8c:   	fble,a,pt	%fcc0, _kref+0x4a94
	.word	0x89a01888	! t0_kref+0x4a90:   	fitos	%f8, %f4
	.word	0x9674c00a	! t0_kref+0x4a94:   	udiv	%l3, %o2, %o3
	.word	0xda10a028	! t0_kref+0x4a98:   	lduh	[%g2 + 0x28], %o5
	.word	0xb5b186d4	! t0_kref+0x4a9c:   	fmul8sux16	%f6, %f20, %f26
	.word	0xa9a0190a	! t0_kref+0x4aa0:   	fitod	%f10, %f20
	.word	0xe43e6000	! t0_kref+0x4aa4:   	std	%l2, [%i1]
	.word	0xe11fbde0	! t0_kref+0x4aa8:   	ldd	[%fp - 0x220], %f16
	.word	0x89a44833	! t0_kref+0x4aac:   	fadds	%f17, %f19, %f4
	.word	0x9a8ae82a	! t0_kref+0x4ab0:   	andcc	%o3, 0x82a, %o5
	.word	0xb5b00f0c	! t0_kref+0x4ab4:   	fsrc2	%f12, %f26
	.word	0x905a7b2b	! t0_kref+0x4ab8:   	smul	%o1, -0x4d5, %o0
	.word	0xae22ad2e	! t0_kref+0x4abc:   	sub	%o2, 0xd2e, %l7
	.word	0xdb00a038	! t0_kref+0x4ac0:   	ld	[%g2 + 0x38], %f13
	.word	0xe7ee501b	! t0_kref+0x4ac4:   	prefetcha	%i1 + %i3, 19
	.word	0x9da408da	! t0_kref+0x4ac8:   	fsubd	%f16, %f26, %f14
	.word	0x9415b14b	! t0_kref+0x4acc:   	or	%l6, -0xeb5, %o2
	.word	0x878020f0	! t0_kref+0x4ad0:   	mov	0xf0, %asi
	.word	0xb1a00550	! t0_kref+0x4ad4:   	fsqrtd	%f16, %f24
	.word	0xd050a022	! t0_kref+0x4ad8:   	ldsh	[%g2 + 0x22], %o0
	.word	0x91a00532	! t0_kref+0x4adc:   	fsqrts	%f18, %f8
	.word	0xedee501a	! t0_kref+0x4ae0:   	prefetcha	%i1 + %i2, 22
	.word	0xd9070018	! t0_kref+0x4ae4:   	ld	[%i4 + %i0], %f12
	.word	0x9a033831	! t0_kref+0x4ae8:   	add	%o4, -0x7cf, %o5
	.word	0xb1a0190d	! t0_kref+0x4aec:   	fitod	%f13, %f24
	.word	0xd2a6501c	! t0_kref+0x4af0:   	sta	%o1, [%i1 + %i4]0x80
	.word	0x972ca003	! t0_kref+0x4af4:   	sll	%l2, 0x3, %o3
	.word	0xc368a0cf	! t0_kref+0x4af8:   	prefetch	%g2 + 0xcf, 1
	.word	0x9db10f58	! t0_kref+0x4afc:   	fornot1	%f4, %f24, %f14
	.word	0x9e930012	! t0_kref+0x4b00:   	orcc	%o4, %l2, %o7
	.word	0x89a5c832	! t0_kref+0x4b04:   	fadds	%f23, %f18, %f4
         nop   !	call	0xfffff16c
	.word	0xac5dc008	! t0_kref+0x4b0c:   	smul	%l7, %o0, %l6
	.word	0x97a00533	! t0_kref+0x4b10:   	fsqrts	%f19, %f11
	.word	0x27800001	! t0_kref+0x4b14:   	fbul,a	_kref+0x4b18
	.word	0x9832400b	! t0_kref+0x4b18:   	orn	%o1, %o3, %o4
	.word	0xee50a002	! t0_kref+0x4b1c:   	ldsh	[%g2 + 2], %l7
	.word	0x98d271b5	! t0_kref+0x4b20:   	umulcc	%o1, -0xe4b, %o4
	.word	0x985cc014	! t0_kref+0x4b24:   	smul	%l3, %l4, %o4
	.word	0x27480005	! t0_kref+0x4b28:   	fbul,a,pt	%fcc0, _kref+0x4b3c
	.word	0x8da01899	! t0_kref+0x4b2c:   	fitos	%f25, %f6
	.word	0xdf00a018	! t0_kref+0x4b30:   	ld	[%g2 + 0x18], %f15
	.word	0x8143c000	! t0_kref+0x4b34:   	stbar
	.word	0x8da4c8a7	! t0_kref+0x4b38:   	fsubs	%f19, %f7, %f6
	.word	0xaead400a	! t0_kref+0x4b3c:   	andncc	%l5, %o2, %l7
	.word	0xe526401c	! t0_kref+0x4b40:   	st	%f18, [%i1 + %i4]
	.word	0x95a588da	! t0_kref+0x4b44:   	fsubd	%f22, %f26, %f10
	.word	0x9ec0000c	! t0_kref+0x4b48:   	addccc	%g0, %o4, %o7
	.word	0x9fa148b9	! t0_kref+0x4b4c:   	fsubs	%f5, %f25, %f15
	.word	0x33800008	! t0_kref+0x4b50:   	fbe,a	_kref+0x4b70
	.word	0x928b000a	! t0_kref+0x4b54:   	andcc	%o4, %o2, %o1
	.word	0x9db00cd0	! t0_kref+0x4b58:   	fnot2	%f16, %f14
	.word	0x9da0012e	! t0_kref+0x4b5c:   	fabss	%f14, %f14
	.word	0x91b28713	! t0_kref+0x4b60:   	fmuld8sux16	%f10, %f19, %f8
	.word	0x31800001	! t0_kref+0x4b64:   	fba,a	_kref+0x4b68
	.word	0x91b2c053	! t0_kref+0x4b68:   	edge8l	%o3, %l3, %o0
	.word	0x29480002	! t0_kref+0x4b6c:   	fbl,a,pt	%fcc0, _kref+0x4b74
	.word	0xf1be1a5b	! t0_kref+0x4b70:   	stda	%f24, [%i0 + %i3]0xd2
	.word	0xa3a00025	! t0_kref+0x4b74:   	fmovs	%f5, %f17
	.word	0xafb280b6	! t0_kref+0x4b78:   	edge16n	%o2, %l6, %l7
	.word	0xe07e0000	! t0_kref+0x4b7c:   	swap	[%i0], %l0
	.word	0xc398a040	! t0_kref+0x4b80:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0x9bb50077	! t0_kref+0x4b84:   	edge8ln	%l4, %l7, %o5
	.word	0xf500a018	! t0_kref+0x4b88:   	ld	[%g2 + 0x18], %f26
	.word	0x95a4894a	! t0_kref+0x4b8c:   	fmuld	%f18, %f10, %f10
	.word	0x91b48c8c	! t0_kref+0x4b90:   	fandnot2	%f18, %f12, %f8
	.word	0xdf00a018	! t0_kref+0x4b94:   	ld	[%g2 + 0x18], %f15
	.word	0xce282a73	! t0_kref+0x4b98:   	stb	%g7, [%g0 + 0xa73]
	.word	0x95a108dc	! t0_kref+0x4b9c:   	fsubd	%f4, %f28, %f10
	.word	0xc040a038	! t0_kref+0x4ba0:   	ldsw	[%g2 + 0x38], %g0
	.word	0x29800007	! t0_kref+0x4ba4:   	fbl,a	_kref+0x4bc0
	.word	0xd248a028	! t0_kref+0x4ba8:   	ldsb	[%g2 + 0x28], %o1
	.word	0x9f3ac00d	! t0_kref+0x4bac:   	sra	%o3, %o5, %o7
	.word	0xd06e7feb	! t0_kref+0x4bb0:   	ldstub	[%i1 - 0x15], %o0
	.word	0x36800001	! t0_kref+0x4bb4:   	bge,a	_kref+0x4bb8
	.word	0xae5d2e26	! t0_kref+0x4bb8:   	smul	%l4, 0xe26, %l7
	.word	0x90aa7120	! t0_kref+0x4bbc:   	andncc	%o1, -0xee0, %o0
	.word	0xa9b38744	! t0_kref+0x4bc0:   	fpack32	%f14, %f4, %f20
	.word	0x98556bf8	! t0_kref+0x4bc4:   	umul	%l5, 0xbf8, %o4
	.word	0x988ca0ce	! t0_kref+0x4bc8:   	andcc	%l2, 0xce, %o4
	.word	0xec1e7fe8	! t0_kref+0x4bcc:   	ldd	[%i1 - 0x18], %l6
	.word	0x3b800006	! t0_kref+0x4bd0:   	fble,a	_kref+0x4be8
	.word	0xa7a00137	! t0_kref+0x4bd4:   	fabss	%f23, %f19
	.word	0xb5a708ba	! t0_kref+0x4bd8:   	fsubs	%f28, %f26, %f26
	.word	0xc04e2001	! t0_kref+0x4bdc:   	ldsb	[%i0 + 1], %g0
	.word	0xc12e6010	! t0_kref+0x4be0:   	st	%fsr, [%i1 + 0x10]
	.word	0xa9b10ad0	! t0_kref+0x4be4:   	fpsub32	%f4, %f16, %f20
	.word	0xe900a010	! t0_kref+0x4be8:   	ld	[%g2 + 0x10], %f20
	.word	0xb3a000b0	! t0_kref+0x4bec:   	fnegs	%f16, %f25
	.word	0x91b60c48	! t0_kref+0x4bf0:   	fnor	%f24, %f8, %f8
	.word	0xacb0246c	! t0_kref+0x4bf4:   	orncc	%g0, 0x46c, %l6
	.word	0x9815321a	! t0_kref+0x4bf8:   	or	%l4, -0xde6, %o4
	.word	0xa9b009b8	! t0_kref+0x4bfc:   	fexpand	%f24, %f20
	.word	0xb5b30ed4	! t0_kref+0x4c00:   	fornot2	%f12, %f20, %f26
	.word	0xee68a038	! t0_kref+0x4c04:   	ldstub	[%g2 + 0x38], %l7
	.word	0x89a00558	! t0_kref+0x4c08:   	fsqrtd	%f24, %f4
	.word	0x96754016	! t0_kref+0x4c0c:   	udiv	%l5, %l6, %o3
	.word	0xadb60494	! t0_kref+0x4c10:   	fcmple32	%f24, %f20, %l6
	.word	0xf1ee101d	! t0_kref+0x4c14:   	prefetcha	%i0 + %i5, 24
	.word	0xe6263fe0	! t0_kref+0x4c18:   	st	%l3, [%i0 - 0x20]
	.word	0x81b68450	! t0_kref+0x4c1c:   	fcmpne16	%f26, %f16, %g0
	.word	0x8143c000	! t0_kref+0x4c20:   	stbar
	.word	0x81aa8a24	! t0_kref+0x4c24:   	fcmps	%fcc0, %f10, %f4
	.word	0x32800006	! t0_kref+0x4c28:   	bne,a	_kref+0x4c40
	.word	0x9f2d2014	! t0_kref+0x4c2c:   	sll	%l4, 0x14, %o7
	.word	0xaeb5eb52	! t0_kref+0x4c30:   	orncc	%l7, 0xb52, %l7
	.word	0xc768a005	! t0_kref+0x4c34:   	prefetch	%g2 + 5, 3
	.word	0xd01e001d	! t0_kref+0x4c38:   	ldd	[%i0 + %i5], %o0
	.word	0x92030014	! t0_kref+0x4c3c:   	add	%o4, %l4, %o1
	.word	0xee367ff2	! t0_kref+0x4c40:   	sth	%l7, [%i1 - 0xe]
	.word	0xc398a040	! t0_kref+0x4c44:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xa5b6cde4	! t0_kref+0x4c48:   	fnands	%f27, %f4, %f18
	.word	0x9e56800a	! t0_kref+0x4c4c:   	umul	%i2, %o2, %o7
	.word	0xa1a00544	! t0_kref+0x4c50:   	fsqrtd	%f4, %f16
	.word	0xd4d6d018	! t0_kref+0x4c54:   	ldsha	[%i3 + %i0]0x80, %o2
	.word	0x2d480002	! t0_kref+0x4c58:   	fbg,a,pt	%fcc0, _kref+0x4c60
	.word	0xa5a109dc	! t0_kref+0x4c5c:   	fdivd	%f4, %f28, %f18
	.word	0xd416c019	! t0_kref+0x4c60:   	lduh	[%i3 + %i1], %o2
	.word	0x39480001	! t0_kref+0x4c64:   	fbuge,a,pt	%fcc0, _kref+0x4c68
	.word	0x95a01915	! t0_kref+0x4c68:   	fitod	%f21, %f10
	.word	0x98b5ecf9	! t0_kref+0x4c6c:   	orncc	%l7, 0xcf9, %o4
	.word	0xe3ee501c	! t0_kref+0x4c70:   	prefetcha	%i1 + %i4, 17
	.word	0xe4086de8	! t0_kref+0x4c74:   	ldub	[%g1 + 0xde8], %l2
	.word	0xa41ca00c	! t0_kref+0x4c78:   	xor	%l2, 0xc, %l2
	.word	0xe4286de8	! t0_kref+0x4c7c:   	stb	%l2, [%g1 + 0xde8]
	.word	0x81d86de8	! t0_kref+0x4c80:   	flush	%g1 + 0xde8
	.word	0xc368a0ca	! t0_kref+0x4c84:   	prefetch	%g2 + 0xca, 1
2:	.word	0x9a72c009	! t0_kref+0x4c88:   	udiv	%o3, %o1, %o5
	.word	0x2f480002	! t0_kref+0x4c8c:   	fbu,a,pt	%fcc0, _kref+0x4c94
	.word	0x9da018d8	! t0_kref+0x4c90:   	fdtos	%f24, %f14
	.word	0xd010a008	! t0_kref+0x4c94:   	lduh	[%g2 + 8], %o0
	.word	0x9672c008	! t0_kref+0x4c98:   	udiv	%o3, %o0, %o3
	.word	0xc93e001d	! t0_kref+0x4c9c:   	std	%f4, [%i0 + %i5]
	.word	0x8da608c4	! t0_kref+0x4ca0:   	fsubd	%f24, %f4, %f6
	.word	0x9de3bfa0	! t0_kref+0x4ca4:   	save	%sp, -0x60, %sp
	.word	0x95ee3153	! t0_kref+0x4ca8:   	restore	%i0, -0xead, %o2
	.word	0xadb58dd4	! t0_kref+0x4cac:   	fnand	%f22, %f20, %f22
	.word	0xd9bf5018	! t0_kref+0x4cb0:   	stda	%f12, [%i5 + %i0]0x80
	.word	0x9ebd400a	! t0_kref+0x4cb4:   	xnorcc	%l5, %o2, %o7
	.word	0x9a5d3ca7	! t0_kref+0x4cb8:   	smul	%l4, -0x359, %o5
	.word	0x99b2058c	! t0_kref+0x4cbc:   	fcmpgt32	%f8, %f12, %o4
	.word	0x8d85b3b8	! t0_kref+0x4cc0:   	wr	%l6, 0xfffff3b8, %fprs
	.word	0x95b6858a	! t0_kref+0x4cc4:   	fcmpgt32	%f26, %f10, %o2
	.word	0xa9a4882b	! t0_kref+0x4cc8:   	fadds	%f18, %f11, %f20
	.word	0x2b800007	! t0_kref+0x4ccc:   	fbug,a	_kref+0x4ce8
	.word	0xa5b0076a	! t0_kref+0x4cd0:   	fpack16	%f10, %f18
	.word	0xb3a20837	! t0_kref+0x4cd4:   	fadds	%f8, %f23, %f25
	.word	0x23800001	! t0_kref+0x4cd8:   	fbne,a	_kref+0x4cdc
	.word	0x01124fd5	! t0_kref+0x4cdc:   	sethi	%hi(0x493f5400), %g0
	.word	0xb5a50d3d	! t0_kref+0x4ce0:   	fsmuld	%f20, %f29, %f26
	call	SYM(t0_subr2)
	.word	0xd840a028	! t0_kref+0x4ce8:   	ldsw	[%g2 + 0x28], %o4
	.word	0x9655f537	! t0_kref+0x4cec:   	umul	%l7, -0xac9, %o3
	.word	0xac5e8017	! t0_kref+0x4cf0:   	smul	%i2, %l7, %l6
	.word	0xde0e401a	! t0_kref+0x4cf4:   	ldub	[%i1 + %i2], %o7
	.word	0x80de8012	! t0_kref+0x4cf8:   	smulcc	%i2, %l2, %g0
	.word	0xef00a030	! t0_kref+0x4cfc:   	ld	[%g2 + 0x30], %f23
	.word	0xa9a70946	! t0_kref+0x4d00:   	fmuld	%f28, %f6, %f20
	call	1f
	.empty
	.word	0xec1e2018	! t0_kref+0x4d08:   	ldd	[%i0 + 0x18], %l6
	.word	0x35800007	! t0_kref+0x4d0c:   	fbue,a	_kref+0x4d28
	.word	0xa5a00526	! t0_kref+0x4d10:   	fsqrts	%f6, %f18
	.word	0x90622f9b	! t0_kref+0x4d14:   	subc	%o0, 0xf9b, %o0
1:	.word	0xe62e4000	! t0_kref+0x4d18:   	stb	%l3, [%i1]
	.word	0xa5a00539	! t0_kref+0x4d1c:   	fsqrts	%f25, %f18
	.word	0x93a0002c	! t0_kref+0x4d20:   	fmovs	%f12, %f9
	.word	0xc028a030	! t0_kref+0x4d24:   	clrb	[%g2 + 0x30]
	.word	0xe0ee501a	! t0_kref+0x4d28:   	ldstuba	[%i1 + %i2]0x80, %l0
	.word	0xa5a6c83d	! t0_kref+0x4d2c:   	fadds	%f27, %f29, %f18
	.word	0x86102003	! t0_kref+0x4d30:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x4d34:   	bne,a	_kref+0x4d34
	.word	0x86a0e001	! t0_kref+0x4d38:   	subcc	%g3, 1, %g3
	.word	0x993ca007	! t0_kref+0x4d3c:   	sra	%l2, 0x7, %o4
	.word	0x8d856640	! t0_kref+0x4d40:   	wr	%l5, 0x640, %fprs
	.word	0xd010a020	! t0_kref+0x4d44:   	lduh	[%g2 + 0x20], %o0
	.word	0x878020e0	! t0_kref+0x4d48:   	mov	0xe0, %asi
	.word	0x9b2d2001	! t0_kref+0x4d4c:   	sll	%l4, 0x1, %o5
	.word	0x952b2008	! t0_kref+0x4d50:   	sll	%o4, 0x8, %o2
	.word	0x9f352019	! t0_kref+0x4d54:   	srl	%l4, 0x19, %o7
	.word	0xae058015	! t0_kref+0x4d58:   	add	%l6, %l5, %l7
	.word	0xf11fbc00	! t0_kref+0x4d5c:   	ldd	[%fp - 0x400], %f24
	.word	0x92c561b5	! t0_kref+0x4d60:   	addccc	%l5, 0x1b5, %o1
	.word	0x95a60d3d	! t0_kref+0x4d64:   	fsmuld	%f24, %f29, %f10
	.word	0x31800008	! t0_kref+0x4d68:   	fba,a	_kref+0x4d88
	.word	0xd91fbdd0	! t0_kref+0x4d6c:   	ldd	[%fp - 0x230], %f12
	.word	0xc0d6d018	! t0_kref+0x4d70:   	ldsha	[%i3 + %i0]0x80, %g0
	.word	0xf500a030	! t0_kref+0x4d74:   	ld	[%g2 + 0x30], %f26
	.word	0xe3801019	! t0_kref+0x4d78:   	lda	[%g0 + %i1]0x80, %f17
	.word	0x9ba1482a	! t0_kref+0x4d7c:   	fadds	%f5, %f10, %f13
	.word	0x9e733c3a	! t0_kref+0x4d80:   	udiv	%o4, -0x3c6, %o7
	.word	0xb8102004	! t0_kref+0x4d84:   	mov	0x4, %i4
	.word	0xb3a7482f	! t0_kref+0x4d88:   	fadds	%f29, %f15, %f25
	.word	0xd0000018	! t0_kref+0x4d8c:   	ld	[%g0 + %i0], %o0
	.word	0xf43e6000	! t0_kref+0x4d90:   	std	%i2, [%i1]
	.word	0xadb30112	! t0_kref+0x4d94:   	edge32	%o4, %l2, %l6
	.word	0x96c52b94	! t0_kref+0x4d98:   	addccc	%l4, 0xb94, %o3
	.word	0xaf326016	! t0_kref+0x4d9c:   	srl	%o1, 0x16, %l7
	.word	0x9475eea4	! t0_kref+0x4da0:   	udiv	%l7, 0xea4, %o2
	.word	0xd700a030	! t0_kref+0x4da4:   	ld	[%g2 + 0x30], %f11
	.word	0x91a189d6	! t0_kref+0x4da8:   	fdivd	%f6, %f22, %f8
	.word	0x90d4c00d	! t0_kref+0x4dac:   	umulcc	%l3, %o5, %o0
	.word	0x9fb48d60	! t0_kref+0x4db0:   	fnot1s	%f18, %f15
	.word	0x9fb34029	! t0_kref+0x4db4:   	edge8n	%o5, %o1, %o7
	.word	0xb1a7084e	! t0_kref+0x4db8:   	faddd	%f28, %f14, %f24
	.word	0xb410201f	! t0_kref+0x4dbc:   	mov	0x1f, %i2
	.word	0xe100a028	! t0_kref+0x4dc0:   	ld	[%g2 + 0x28], %f16
	.word	0x89b68d60	! t0_kref+0x4dc4:   	fnot1s	%f26, %f4
	.word	0x9802000a	! t0_kref+0x4dc8:   	add	%o0, %o2, %o4
	.word	0xec4e401a	! t0_kref+0x4dcc:   	ldsb	[%i1 + %i2], %l6
	.word	0xa5a6cd30	! t0_kref+0x4dd0:   	fsmuld	%f27, %f16, %f18
	.word	0xac5a0009	! t0_kref+0x4dd4:   	smul	%o0, %o1, %l6
	.word	0x81aa0a5a	! t0_kref+0x4dd8:   	fcmpd	%fcc0, %f8, %f26
	.word	0xe820a020	! t0_kref+0x4ddc:   	st	%l4, [%g2 + 0x20]
	.word	0xb9a0055c	! t0_kref+0x4de0:   	fsqrtd	%f28, %f28
	.word	0x80b4ef52	! t0_kref+0x4de4:   	orncc	%l3, 0xf52, %g0
	.word	0xd6de1000	! t0_kref+0x4de8:   	ldxa	[%i0]0x80, %o3
	.word	0x81ae8a4e	! t0_kref+0x4dec:   	fcmpd	%fcc0, %f26, %f14
	.word	0xd91fbf30	! t0_kref+0x4df0:   	ldd	[%fp - 0xd0], %f12
	.word	0xf9be1a5d	! t0_kref+0x4df4:   	stda	%f28, [%i0 + %i5]0xd2
	call	SYM(t0_subr3)
	.word	0xa9a01907	! t0_kref+0x4dfc:   	fitod	%f7, %f20
	.word	0x31480007	! t0_kref+0x4e00:   	fba,a,pt	%fcc0, _kref+0x4e1c
	.word	0xf91fbe00	! t0_kref+0x4e04:   	ldd	[%fp - 0x200], %f28
	.word	0xde080019	! t0_kref+0x4e08:   	ldub	[%g0 + %i1], %o7
	.word	0xe43e3fe8	! t0_kref+0x4e0c:   	std	%l2, [%i0 - 0x18]
	.word	0x9fa01a5c	! t0_kref+0x4e10:   	fdtoi	%f28, %f15
	.word	0xc768a103	! t0_kref+0x4e14:   	prefetch	%g2 + 0x103, 3
	.word	0x8da00558	! t0_kref+0x4e18:   	fsqrtd	%f24, %f6
	.word	0x988dade9	! t0_kref+0x4e1c:   	andcc	%l6, 0xde9, %o4
	call	SYM(_kaos_done)
	.word	0x01000000	! t0_kref+0x4e24:   	nop
	KGLOBAL(t0_ktbl_end)
t0_ktbl_end:
t0_ktbl_page_end:

KTEXT_MODULE(t0_module_subr0, 0x14230000)
.seg "text"
t0_subr0_page_begin:
	.skip 8188
.global _t0_subr0; ENTRY(t0_subr0)
	.word	0xa6844012	! t0_subr0+0x0:   	addcc	%l1, %l2, %l3
	.word	0x81c3e008	! t0_subr0+0x4:   	retl
	.word	0xaa64c014	! t0_subr0+0x8:   	subc	%l3, %l4, %l5
t0_subr0_page_end:

KTEXT_MODULE(t0_module_subr1, 0x13da0000)
.seg "text"
t0_subr1_page_begin:
	.skip 8180
.global _t0_subr1; ENTRY(t0_subr1)
	.word	0x9de3bfa0	! t0_subr1+0x0:   	save	%sp, -0x60, %sp
	.word	0xb29eaa5a	! t0_subr1+0x4:   	xorcc	%i2, 0xa5a, %i1
	.word	0x81c7e008	! t0_subr1+0x8:   	ret
	.word	0xa7ee6001	! t0_subr1+0xc:   	restore	%i1, 1, %l3
t0_subr1_page_end:

KTEXT_MODULE(t0_module_subr2, 0x13d44000)
.seg "text"
t0_subr2_page_begin:
	.skip 8180
.global _t0_subr2; ENTRY(t0_subr2)
	.word	0x9de3bfa0	! t0_subr2+0x0:   	save	%sp, -0x60, %sp
	.word	0xb2066001	! t0_subr2+0x4:   	add	%i1, 1, %i1
	.word	0x81c7e008	! t0_subr2+0x8:   	ret
	.word	0xa3ee6001	! t0_subr2+0xc:   	restore	%i1, 1, %l1
t0_subr2_page_end:

KTEXT_MODULE(t0_module_subr3, 0x0460c000)
.seg "text"
t0_subr3_page_begin:
	.skip 8140
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
!  ldsb              1.24   1.35
!  ldub              0.82   0.93
!  ldsh              0.22   0.23
!  lduh              1.16   0.91
!  ld                0.69   0.81
!  ldd               0.89   1.12
!  swap              1.17   1.00
!  ldstub            0.28   0.33
!  stb               0.89   0.95
!  sth               1.14   1.08
!  st                1.28   1.25
!  std               0.81   0.77
!  add               1.03   1.00
!  addcc             1.04   0.79
!  addx              0.30   0.25
!  addxcc            0.80   0.93
!  taddcc            0.24   0.27
!  taddcctv          0.21   0.12
!  sub               1.00   1.25
!  subcc             0.04   0.02
!  subx              0.49   0.58
!  subxcc            0.73   0.60
!  tsubcc            0.13   0.17
!  tsubcctv          0.19   0.19
!  mulscc            0.21   0.12
!  and               0.03   0.00
!  andcc             1.16   1.16
!  andn              0.15   0.21
!  andncc            0.42   0.35
!  or                0.90   1.16
!  orcc              0.50   0.44
!  orn               0.54   0.56
!  orncc             1.24   1.22
!  xor               0.13   0.12
!  xorcc             0.09   0.12
!  xnor              0.34   0.31
!  xnorcc            0.54   0.62
!  sll               0.96   1.18
!  srl               0.91   0.83
!  sra               1.35   1.41
!  unimp             0.14   0.12
!  umul              0.78   0.89
!  smul              1.39   1.41
!  udiv              1.32   1.16
!  sdiv              0.06   0.00
!  umulcc            0.78   0.91
!  smulcc            0.18   0.12
!  udivcc            0.29   0.21
!  sdivcc            0.61   0.66
!  rdy               1.01   1.41
!  wry               0.56   0.64
!  bicc              0.75   0.56
!  sethi             1.37   1.49
!  jmpl              0.96   0.89
!  call              1.06   1.27
!  ticc              0.00   0.00
!  flush             0.22   0.19
!  save              1.16   0.83
!  restore           0.76   0.00
!  stbar             0.31   0.35
!  ldf               0.79   0.79
!  lddf              0.45   0.42
!  stf               1.26   1.20
!  stdf              0.42   0.58
!  fadds             1.30   1.81
!  fsubs             0.63   0.48
!  fmuls             0.79   0.73
!  fdivs             0.30   0.19
!  faddd             0.39   0.37
!  fsubd             1.21   1.25
!  fmuld             0.15   0.19
!  fdivd             0.75   0.85
!  faddq             0.00   0.00
!  fsubq             0.00   0.00
!  fmulq             0.00   0.00
!  fdivq             0.00   0.00
!  fsmuld            1.10   1.08
!  fdmulq            0.00   0.00
!  fitos             1.25   1.29
!  fitod             0.55   0.66
!  fitoq             0.00   0.00
!  fstoi             0.12   0.15
!  fstod             0.15   0.06
!  fstoq             0.00   0.00
!  fdtoi             0.28   0.31
!  fdtos             0.13   0.17
!  fdtoq             0.00   0.00
!  fqtoi             0.00   0.00
!  fqtos             0.00   0.00
!  fqtod             0.00   0.00
!  fmovs             1.17   1.31
!  fnegs             0.75   0.85
!  fabss             0.52   0.44
!  fsqrts            2.10   2.03
!  fsqrtd            1.37   1.66
!  fsqrtq            0.00   0.00
!  fcmps             0.52   0.56
!  fcmpd             0.35   0.19
!  fcmpq             0.00   0.00
!  fcmpes            0.18   0.23
!  fcmped            0.80   0.52
!  fcmpeq            0.00   0.00
!  fbfcc             3.60   3.09
!  ldfsr             0.04   0.00
!  stfsr             0.28   0.31
!  loop              1.04   0.68
!  offset            0.12   0.23
!  area              0.02   0.04
!  target            0.10   0.08
!  goto              0.21   0.12
!  sigsegv           0.26   0.27
!  sigbus            0.08   0.10
!  imodify           0.45   0.35
!  ldfsr_offset      0.02   0.00
!  fpattern          1.11   1.39
!  lbranch           0.02   0.02
!  shmld             5.36   6.21
!  shmst             0.88   1.02
!  shmpf             1.06   1.22
!  shmswap           0.17   0.27
!  shmblkld          0.99   0.46
!  shmblkst          1.33   0.73
!  shmblkchk         0.15   0.08
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
!  casa              0.27   0.31
!  rdasi             0.12   0.12
!  wrasi             0.19   0.19
!  bpcc              0.70   0.75
!  fbpfcc            3.28   3.20
!  fmovscc           0.04   0.04
!  fmovdcc           0.02   0.00
!  fmovqcc           0.00   0.00
!  movcc             0.12   0.12
!  flushw            0.16   0.10
!  membar            0.11   0.08
!  prefetch          0.09   0.19
!  rdpc              0.02   0.02
!  ldqf              0.00   0.00
!  stqf              0.00   0.00
!  ldfa              0.13   0.15
!  lddfa             0.06   0.12
!  ldqfa             0.00   0.00
!  ldsba             0.01   0.00
!  ldsha             0.27   0.27
!  lduba             0.22   0.15
!  lduha             0.18   0.08
!  lda               0.24   0.21
!  ldda              0.16   0.21
!  ldstuba           0.26   0.46
!  prefetcha         0.58   0.64
!  stfa              0.12   0.12
!  stdfa             0.25   0.27
!  stqfa             0.00   0.00
!  stba              0.11   0.12
!  stha              0.09   0.08
!  sta               0.24   0.17
!  stda              0.12   0.19
!  swapa             0.19   0.25
!  fmovd             0.01   0.00
!  fnegd             0.00   0.00
!  fabsd             0.12   0.10
!  fstox             0.10   0.08
!  fdtox             0.25   0.15
!  fxtos             0.08   0.02
!  fxtod             0.03   0.02
!  lds               0.20   0.19
!  ldsa              0.15   0.10
!  ldx               0.13   0.19
!  ldxa              0.23   0.31
!  nofault           0.06   0.08
!  rdgsr             0.01   0.00
!  wrgsr             0.06   0.06
!  fpadd16           0.20   0.19
!  fpadd16s          0.01   0.02
!  fpadd32           0.15   0.17
!  fpadd32s          0.04   0.10
!  fpsub16           0.11   0.10
!  fpsub16s          0.06   0.08
!  fpsub32           0.18   0.21
!  fpsub32s          0.10   0.06
!  fpack16           0.18   0.31
!  fpack32           0.15   0.12
!  fpackfix          0.10   0.27
!  fexpand           0.21   0.12
!  fpmerge           0.04   0.00
!  fmul8x16          0.09   0.08
!  fmul8x16au        0.01   0.00
!  fmul8x16al        0.06   0.08
!  fmul8sux16        0.02   0.02
!  fmul8ulx16        0.21   0.25
!  fmuld8sux16       0.26   0.25
!  fmuld8ulx16       0.23   0.15
!  alignaddr         0.08   0.06
!  alignaddrl        0.12   0.04
!  faligndata        0.02   0.04
!  fzero             0.06   0.06
!  fzeros            0.07   0.02
!  fone              0.24   0.23
!  fones             0.09   0.19
!  fsrc1             0.18   0.12
!  fsrc1s            0.02   0.00
!  fsrc2             0.19   0.17
!  fsrc2s            0.21   0.15
!  fnot1             0.00   0.00
!  fnot1s            0.25   0.35
!  fnot2             0.19   0.12
!  fnot2s            0.06   0.04
!  for               0.26   0.35
!  fors              0.00   0.00
!  fnor              0.21   0.10
!  fnors             0.08   0.04
!  fand              0.05   0.08
!  fands             0.14   0.21
!  fnand             0.21   0.17
!  fnands            0.15   0.17
!  fxor              0.01   0.00
!  fxors             0.06   0.10
!  fxnor             0.21   0.25
!  fxnors            0.17   0.17
!  fornot1           0.15   0.12
!  fornot1s          0.04   0.06
!  fornot2           0.03   0.02
!  fornot2s          0.09   0.08
!  fandnot1          0.21   0.25
!  fandnot1s         0.25   0.29
!  fandnot2          0.16   0.31
!  fandnot2s         0.04   0.10
!  fcmpgt16          0.13   0.19
!  fcmpgt32          0.12   0.17
!  fcmple16          0.06   0.02
!  fcmple32          0.09   0.10
!  fcmpne16          0.23   0.25
!  fcmpne32          0.24   0.19
!  fcmpeq16          0.24   0.12
!  fcmpeq32          0.01   0.04
!  edge8             0.24   0.23
!  edge8l            0.25   0.21
!  edge16            0.11   0.10
!  edge16l           0.11   0.21
!  edge32            0.16   0.17
!  edge32l           0.06   0.15
!  pdist             0.16   0.21
!  partial_st8       0.07   0.17
!  partial_st16      0.06   0.04
!  partial_st32      0.12   0.25
!  short_st8         0.18   0.25
!  short_st16        0.14   0.19
!  short_ld8         0.12   0.19
!  short_ld16        0.05   0.04
!  blkld             0.26   0.00
!  blkst             0.10   0.00
!  blkld_offset      0.22   0.00
!  blkst_offset      0.00   0.00
!  blk_check         0.17   0.10
!  casxa             0.03   0.02
!  rdccr             0.14   0.19
!  rdfprs            0.03   0.00
!  wrccr             0.19   0.23
!  popc              0.26   0.17
!  wrfprs            0.13   0.19
!  stx               0.14   0.10
!  stxa              0.25   0.21
!  cflush            0.00   0.00
!  array8            0.23   0.23
!  array16           0.00   0.00
!  array32           0.17   0.10
!  edge8n            0.16   0.23
!  edge8ln           0.16   0.10
!  edge16n           0.16   0.10
!  edge16ln          0.07   0.06
!  edge32n           0.06   0.02
!  edge32ln          0.18   0.12
!  bmask             0.24   0.35
!  bshuffle          0.13   0.08
!  siam              0.04   0.02
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
KDATA_MODULE(t0_module_offset_table, 0x22bf0000)
.seg "data"
t0_offset_table_start:
t0_offset_table_size:	.word	0x00000008
t0_offset_table:
	.word	0x00000000
	.word	0xfffffff0
	.word	0xfffffff8
	.word	0x00000008
	.word	0xffffffe0
	.word	0x00000018
	.word	0x00000010
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

KDATA_MODULE(t0_module_data_in_regs, 0x39c6a000)
.seg "data"
KGLOBAL(t0_data_in_regs)
t0_data_in_regs_start:
t0_data_in_regs:
	.word	0x9df2453e          ! %f0
	.word	0xd9671b20          ! %f1
	.word	0x131b6f7a          ! %f2
	.word	0x1d03803b          ! %f3
	.word	0x92d90ad2          ! %f4
	.word	0x16d97289          ! %f5
	.word	0xf4d7e207          ! %f6
	.word	0x1916d06d          ! %f7
	.word	0xc7008677          ! %f8
	.word	0x4d9ad12f          ! %f9
	.word	0xa30bb97b          ! %f10
	.word	0x3206b2c6          ! %f11
	.word	0x035b373c          ! %f12
	.word	0x7d0a9e17          ! %f13
	.word	0x980d3629          ! %f14
	.word	0x7d6619d5          ! %f15
	.word	0x6f924672          ! %f16
	.word	0xffff7722          ! %f17
	.word	0x4edcef3e          ! %f18
	.word	0xf80a0899          ! %f19
	.word	0x2769036d          ! %f20
	.word	0x9a04fb7d          ! %f21
	.word	0xa5493e28          ! %f22
	.word	0xd9ca2410          ! %f23
	.word	0x72f5d78c          ! %f24
	.word	0xfe87495e          ! %f25
	.word	0x76527c34          ! %f26
	.word	0x6cc04a0d          ! %f27
	.word	0x71a7f675          ! %f28
	.word	0x354c22ec          ! %f29
	.word	0xe1e2f679          ! %f30
	.word	0x69ea414e          ! %f31
	.word	0x79c14ea5          ! %f32
	.word	0x0124ee7e          ! %f33
	.word	0x3ab7bbf4          ! %f34
	.word	0xafadd6cd          ! %f35
	.word	0x62607e27          ! %f36
	.word	0xf4c40608          ! %f37
	.word	0x6185a9f4          ! %f38
	.word	0x7df0fc56          ! %f39
	.word	0x4daecfa3          ! %f40
	.word	0x915309d1          ! %f41
	.word	0x2f385ab8          ! %f42
	.word	0x747cbc59          ! %f43
	.word	0x7f82839a          ! %f44
	.word	0xfa0f2a69          ! %f45
	.word	0x1ddeda55          ! %f46
	.word	0xa47b1701          ! %f47
	.word	0x0b05e9ef          ! %f48
	.word	0x030b9dda          ! %f49
	.word	0x6ab445dd          ! %f50
	.word	0xba4d1c84          ! %f51
	.word	0x1bf80fa8          ! %f52
	.word	0xa689b41d          ! %f53
	.word	0xa1f0b8bd          ! %f54
	.word	0xcaf7d8bc          ! %f55
	.word	0xce2404f5          ! %f56
	.word	0xef593ecf          ! %f57
	.word	0xb8f12c67          ! %f58
	.word	0xad3be3f7          ! %f59
	.word	0xa3f7ff72          ! %f60
	.word	0xceab4024          ! %f61
	.word	0x430b2e30          ! %f62
	.word	0x1354ad0a          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x878       ! %g1 (code pointer)
	.word	t0_data_in_shm_area ! %g2 (shared area pointer)
	.word	0xf4641173          ! %g3 (loop index)
	.word	SYM(t0_subr3)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x8c740dfd          ! %o0
	.word	0xfe5cafdd          ! %o1
	.word	0x2b4962e2          ! %o2
	.word	0x458cc873          ! %o3
	.word	0x6eb34f07          ! %o4
	.word	0x5af5fef2          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0xfbf5dca9          ! %l0
	.word	0xfbec151b          ! %l1
	.word	0xc34b8f7a          ! %l2
	.word	0x4499d0ac          ! %l3
	.word	0x684ac8da          ! %l4
	.word	0x34d98ef3          ! %l5
	.word	0xdfad7415          ! %l6
	.word	0x5f0e1200          ! %l7
	.word	t0_data_in_area0    ! %i0 (area pointer)
	.word	t0_data_in_area0    ! %i1 (area pointer)
	.word	0xffffffe7          ! %i2 (byte offset)
	.word	0xffffffe0          ! %i3 (halfword offset)
	.word	0x00000018          ! %i4 (word offset)
	.word	0xffffffe0          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x22d23cb9          ! %y
	.word	0x00000008          ! %icc (nzvc)
	.word	0x00000a0b          ! %fsr
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

KDATA_MODULE(t0_module_data_in_stack, 0x1b6be000)
.seg "data"
KGLOBAL(t0_data_in_mtbl_size)
KGLOBAL(t0_data_in_mtbl)
KGLOBAL(t0_data_in_stack)
t0_data_in_stack_start:
	.word	0xf5fa5ee2
	.word	0xf204f8d6
	.word	0x59b65312
	.word	0x551abb21
	.word	0x047ba714
	.word	0x62211a3e
	.word	0x898bc332
	.word	0x399dd3f3
	.word	0x98c5c5f3
	.word	0xe93d1c54
	.word	0xd924564f
	.word	0x43104c7b
	.word	0x7f0b2802
	.word	0x2be2a87b
	.word	0xc21932cd
	.word	0x39660f5a
	.word	0x60c60bdb
	.word	0xc4f2d912
	.word	0xbc0588b3
	.word	0xf75219ef
	.word	0x73bee552
	.word	0x25a0c7c4
	.word	0xc384a36c
	.word	0x811a24c8
	.word	0x3e734edb
	.word	0xf2562d1e
	.word	0xc358d3cb
	.word	0xf417df54
	.word	0xcfb02d28
	.word	0x3e89e561
	.word	0x1588764f
	.word	0x5265b2de
	.word	0xff37e916
	.word	0x81b96e99
	.word	0x8b4e99a8
	.word	0x13a040b6
	.word	0x5777e3c9
	.word	0x6933b3ed
	.word	0x3c910979
	.word	0x6c850fb0
	.word	0xa2de8915
	.word	0x0674ba39
	.word	0x1265c15f
	.word	0xaeca1cd2
	.word	0xe495a41f
	.word	0x5db701d9
	.word	0x204e0c32
	.word	0x30114348
	.word	0xca7ada44
	.word	0x2d58b1c7
	.word	0x7d6dd38a
	.word	0x3d95af9b
	.word	0x8f6a7038
	.word	0x69ffdfe8
	.word	0x3e69e384
	.word	0xa160d222
	.word	0x5f8ebd72
	.word	0x6e4a8aa2
	.word	0x4a0026c6
	.word	0xb8b784b8
	.word	0xcea8f1c7
	.word	0x248c17b1
	.word	0x22191ebf
	.word	0x994757ae
	.word	0xe86e1155
	.word	0x76e36c3b
	.word	0x01421c33
	.word	0xfea73a03
	.word	0x0f5d4aa2
	.word	0x6311f221
	.word	0x3d73fbf6
	.word	0xe33df0d2
	.word	0xdd230b04
	.word	0x0d2d1e97
	.word	0x25026bf7
	.word	0xa1d4120b
	.word	0xcaee7542
	.word	0xcbc94df6
	.word	0x2dcbfc80
	.word	0x1f3e7665
	.word	0xb6551e7b
	.word	0x32d608d0
	.word	0x818381bb
	.word	0xd0e95693
	.word	0xaabb3546
	.word	0xb5510645
	.word	0xa86f8977
	.word	0xfcdb87b5
	.word	0x5df4771a
	.word	0x42767f94
	.word	0x4684e92c
	.word	0x7d4c8b11
	.word	0xdb3497f0
	.word	0xce6aa8f4
	.word	0xc98da83c
	.word	0xcc5f6502
	.word	0x1fac0026
	.word	0x99c163a4
	.word	0x4a5dca7b
	.word	0x7f3f6f30
	.word	0x4a9804a6
	.word	0x34067d41
	.word	0x432bbef1
	.word	0x71fb9a00
	.word	0x355bfd47
	.word	0x24ba1057
	.word	0xa23a76de
	.word	0x3a4fd14e
	.word	0x31aadd72
	.word	0x3159da39
	.word	0xf65f68fd
	.word	0x7e537859
	.word	0x921f3308
	.word	0xc7499a14
	.word	0x4acf050d
	.word	0x2fff30fe
	.word	0xef19af83
	.word	0xe2f9cd42
	.word	0xd53e5b8c
	.word	0x8eeb6229
	.word	0x9c9c9f5b
	.word	0x33cd5cdb
	.word	0xf510fdc5
	.word	0x01cc3188
	.word	0xf05cf3aa
	.word	0x5b341092
	.word	0x88365a0d
	.word	0x2046e480
	.word	0x1fa7c212
	.word	0x3678dabd
	.word	0x2aca1849
	.word	0x9f07dc64
	.word	0x1d455ede
	.word	0xb32051b5
	.word	0x35bf3ab2
	.word	0xaabfa1e4
	.word	0xd6717567
	.word	0xdea4ea5f
	.word	0xe71606dc
	.word	0xbe20b3c3
	.word	0xfd91c2b8
	.word	0xa923c80a
	.word	0xf798faf3
	.word	0x3a5f0ccc
	.word	0x9fcb5675
	.word	0x3866357c
	.word	0x6f1d5348
	.word	0x4c4d9506
	.word	0x9a307df8
	.word	0x0ae11b47
	.word	0xfd07e40b
	.word	0xb144f226
	.word	0x923fbdbc
	.word	0x7a050760
	.word	0xaf9f4b5a
	.word	0x31c26b44
	.word	0xee0e7cfe
	.word	0x2dce99f1
	.word	0x15c0bf7a
	.word	0x8b64d3d2
	.word	0xe10047a1
	.word	0xa2306b6d
	.word	0xa41cfd63
	.word	0xa3d8b1c9
	.word	0x9495ca51
	.word	0x26ecbfe5
	.word	0x65771b81
	.word	0x49a41324
t0_data_in_sp:
	.word	0xbfececeb
	.word	0x85069b9a
	.word	0x54b744b8
	.word	0x41d5c691
	.word	0x463daf1c
	.word	0x47570cd2
	.word	0x4c3f9fa9
	.word	0xa1a2eb66
	.word	t0_data_in_area0
	.word	t0_data_in_area0
	.word	0x00000001
	.word	0xffffffec
	.word	0x0000000c
	.word	0xfffffff0
	.word	t0_data_in_fp
	.word	0xa0a92abc
	.word	0x2438713c
	.word	0x2eba3c53
	.word	0x4558bdc6
	.word	0x586ff80a
	.word	0xdecdbcb1
	.word	0x59bbdf6f
	.word	0x933a4ff3
	.word	0xf972647b
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
	.word   	0x5129a7ca	! [%fp - 0xc]
	.word   	0xa7f8249e	! [%fp - 0x8]
	.word   	0x147f655a	! [%fp - 0x4]
.global t0_data_in_fp; t0_data_in_fp:
	.word	0x5529c39d
	.word	0x6e6bf592
	.word	0xc86d5385
	.word	0x132edc08
	.word	0xa7316c3a
	.word	0x430fd1a6
	.word	0x8e256c69
	.word	0x467b415c
	.word	0x9de1a6ed
	.word	0x19ac5d3c
	.word	0x0c93cae2
	.word	0x1cbed0a5
	.word	0x389271f8
	.word	0x78c28867
	.word	0xdc1dbfce
	.word	0x28e63809
	.word	0x85262e55
	.word	0x54b8bb98
	.word	0x3a3e5688
	.word	0xd8c847a8
	.word	0xb7e98a0a
	.word	0x44291568
	.word	0x8304b95a
	.word	0xf126ef00
t0_data_in_stacktop:
	.word	0
t0_data_in_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_in_area0, 0x1e872000)
.seg "data"
t0_data_in_area0_start:
.skip 6336
t0_data_in_area0_begin:
	.word	0x2bd73bc1	! t0_data_in_area0-0x20
	.word	0xbbaf4094	! t0_data_in_area0-0x1c
	.word	0x59afe92f	! t0_data_in_area0-0x18
	.word	0x30f82c92	! t0_data_in_area0-0x14
	.word	0x93236397	! t0_data_in_area0-0x10
	.word	0x0daf2647	! t0_data_in_area0-0xc
	.word	0x6321bc8d	! t0_data_in_area0-0x8
	.word	0xa65bd3c6	! t0_data_in_area0-0x4
.global t0_data_in_area0; t0_data_in_area0:
	.word	0x19dba533	! t0_data_in_area0+0x0
	.word	0x625e009f	! t0_data_in_area0+0x4
	.word	0x920e59c1	! t0_data_in_area0+0x8
	.word	0x868d4d0b	! t0_data_in_area0+0xc
	.word	0xe3a64f1b	! t0_data_in_area0+0x10
	.word	0x18eb9169	! t0_data_in_area0+0x14
	.word	0x016ca05b	! t0_data_in_area0+0x18
	.word	0xfd6eb442	! t0_data_in_area0+0x1c
t0_data_in_area0_end:
.skip 1792
t0_data_in_area0_stop:

KDATA_MODULE(t0_module_data_in_shm_area, 0x36b7c000)
.seg "data"
t0_data_in_shm_area_start:
t0_data_in_shm_area_begin:
.global t0_data_in_shm_area; t0_data_in_shm_area:
	.word	0x237c2342	! t0_data_in_shm_area+0x0 (t0)
	.word	0x15a329e9	! t0_data_in_shm_area+0x4 (t1)
	.word	0x0c41812f	! t0_data_in_shm_area+0x8 (t0)
	.word	0x67c1bc1f	! t0_data_in_shm_area+0xc (t1)
	.word	0x38ff35dc	! t0_data_in_shm_area+0x10 (t0)
	.word	0xb08d9b6d	! t0_data_in_shm_area+0x14 (t1)
	.word	0x4b3cf95c	! t0_data_in_shm_area+0x18 (t0)
	.word	0xa98897cd	! t0_data_in_shm_area+0x1c (t1)
	.word	0xe5dd94e4	! t0_data_in_shm_area+0x20 (t0)
	.word	0x4e01f584	! t0_data_in_shm_area+0x24 (t1)
	.word	0x58ab2a75	! t0_data_in_shm_area+0x28 (t0)
	.word	0x18bdb7e0	! t0_data_in_shm_area+0x2c (t1)
	.word	0x711529ad	! t0_data_in_shm_area+0x30 (t0)
	.word	0xc92476ae	! t0_data_in_shm_area+0x34 (t1)
	.word	0x6dd2e741	! t0_data_in_shm_area+0x38 (t0)
	.word	0xe9a76180	! t0_data_in_shm_area+0x3c (t1)
	.word	0x6cbd8f96	! t0_data_in_shm_area+0x40 (t0 bload)
	.word	0x4c18553e	! t0_data_in_shm_area+0x44
	.word	0x291c6453	! t0_data_in_shm_area+0x48
	.word	0x68db34f3	! t0_data_in_shm_area+0x4c
	.word	0xed691b98	! t0_data_in_shm_area+0x50
	.word	0xb4d1a6d5	! t0_data_in_shm_area+0x54
	.word	0xc78f55e1	! t0_data_in_shm_area+0x58
	.word	0x53b004f3	! t0_data_in_shm_area+0x5c
	.word	0x6d54736d	! t0_data_in_shm_area+0x60
	.word	0x629dc9c9	! t0_data_in_shm_area+0x64
	.word	0x546a97ad	! t0_data_in_shm_area+0x68
	.word	0x96a876e3	! t0_data_in_shm_area+0x6c
	.word	0x082b5ead	! t0_data_in_shm_area+0x70
	.word	0x40c29238	! t0_data_in_shm_area+0x74
	.word	0xf8ee7546	! t0_data_in_shm_area+0x78
	.word	0x0a7b2f6c	! t0_data_in_shm_area+0x7c
	.word	0xd10be619	! t0_data_in_shm_area+0x80 (t0 bstore)
	.word	0x543da250	! t0_data_in_shm_area+0x84
	.word	0x433b90a5	! t0_data_in_shm_area+0x88
	.word	0xf566fa61	! t0_data_in_shm_area+0x8c
	.word	0xcfafb4f0	! t0_data_in_shm_area+0x90
	.word	0x45445313	! t0_data_in_shm_area+0x94
	.word	0x299915a1	! t0_data_in_shm_area+0x98
	.word	0x8940eb24	! t0_data_in_shm_area+0x9c
	.word	0xf1b9bb80	! t0_data_in_shm_area+0xa0
	.word	0x15d2e559	! t0_data_in_shm_area+0xa4
	.word	0x132630a8	! t0_data_in_shm_area+0xa8
	.word	0x8d999f48	! t0_data_in_shm_area+0xac
	.word	0x9da2e6ff	! t0_data_in_shm_area+0xb0
	.word	0xad0f3f1b	! t0_data_in_shm_area+0xb4
	.word	0x599fbcac	! t0_data_in_shm_area+0xb8
	.word	0x30218777	! t0_data_in_shm_area+0xbc
	.word	0x81c2363d	! t0_data_in_shm_area+0xc0 (t1 bload)
	.word	0x7141413d	! t0_data_in_shm_area+0xc4
	.word	0xb51ee4b3	! t0_data_in_shm_area+0xc8
	.word	0x55a7d712	! t0_data_in_shm_area+0xcc
	.word	0x9fd864cf	! t0_data_in_shm_area+0xd0
	.word	0x3eac2bd0	! t0_data_in_shm_area+0xd4
	.word	0xaa972f3b	! t0_data_in_shm_area+0xd8
	.word	0x90ab3fad	! t0_data_in_shm_area+0xdc
	.word	0x9207c8f2	! t0_data_in_shm_area+0xe0
	.word	0x7447daf4	! t0_data_in_shm_area+0xe4
	.word	0x36e874d2	! t0_data_in_shm_area+0xe8
	.word	0xb3b4653f	! t0_data_in_shm_area+0xec
	.word	0x2c12c301	! t0_data_in_shm_area+0xf0
	.word	0x802ff499	! t0_data_in_shm_area+0xf4
	.word	0x29dd450a	! t0_data_in_shm_area+0xf8
	.word	0x57953570	! t0_data_in_shm_area+0xfc
	.word	0xdd738bdc	! t0_data_in_shm_area+0x100 (t1 bstore)
	.word	0x9192ed57	! t0_data_in_shm_area+0x104
	.word	0xf7753d0b	! t0_data_in_shm_area+0x108
	.word	0x8260fdd1	! t0_data_in_shm_area+0x10c
	.word	0x05068f0f	! t0_data_in_shm_area+0x110
	.word	0x9666c1c4	! t0_data_in_shm_area+0x114
	.word	0xcdc9684e	! t0_data_in_shm_area+0x118
	.word	0x5549b750	! t0_data_in_shm_area+0x11c
	.word	0xf0fdc333	! t0_data_in_shm_area+0x120
	.word	0x0b9f710a	! t0_data_in_shm_area+0x124
	.word	0x86cf69a5	! t0_data_in_shm_area+0x128
	.word	0x9b4214f4	! t0_data_in_shm_area+0x12c
	.word	0xd906a494	! t0_data_in_shm_area+0x130
	.word	0xe5ba0cb3	! t0_data_in_shm_area+0x134
	.word	0x0b37b07e	! t0_data_in_shm_area+0x138
	.word	0x982549c5	! t0_data_in_shm_area+0x13c
t0_data_in_shm_area_end:
t0_data_in_shm_area_stop:

KDATA_MODULE(t0_module_data_exp_regs, 0x2e498000)
.seg "data"
KGLOBAL(t0_data_exp_regs)
t0_data_exp_regs_start:
t0_data_exp_regs:
	.word	0x9df2453e          ! %f0
	.word	0xd9671b20          ! %f1
	.word	0x131b6f7a          ! %f2
	.word	0x1d03803b          ! %f3
	.word	0x92d90ad2          ! %f4
	.word	0x16d97289          ! %f5
	.word	0xf4d7e207          ! %f6
	.word	0x1916d06d          ! %f7
	.word	0xc7008677          ! %f8
	.word	0x4d9ad12f          ! %f9
	.word	0xa30bb97b          ! %f10
	.word	0x3206b2c6          ! %f11
	.word	0x035b373c          ! %f12
	.word	0x7d0a9e17          ! %f13
	.word	0x980d3629          ! %f14
	.word	0x7d6619d5          ! %f15
	.word	0x6f924672          ! %f16
	.word	0xffff7722          ! %f17
	.word	0x4edcef3e          ! %f18
	.word	0xf80a0899          ! %f19
	.word	0x2769036d          ! %f20
	.word	0x9a04fb7d          ! %f21
	.word	0xa5493e28          ! %f22
	.word	0xd9ca2410          ! %f23
	.word	0x72f5d78c          ! %f24
	.word	0xfe87495e          ! %f25
	.word	0x76527c34          ! %f26
	.word	0x6cc04a0d          ! %f27
	.word	0x71a7f675          ! %f28
	.word	0x354c22ec          ! %f29
	.word	0xe1e2f679          ! %f30
	.word	0x69ea414e          ! %f31
	.word	0x79c14ea5          ! %f32
	.word	0x0124ee7e          ! %f33
	.word	0x3ab7bbf4          ! %f34
	.word	0xafadd6cd          ! %f35
	.word	0x62607e27          ! %f36
	.word	0xf4c40608          ! %f37
	.word	0x6185a9f4          ! %f38
	.word	0x7df0fc56          ! %f39
	.word	0x4daecfa3          ! %f40
	.word	0x915309d1          ! %f41
	.word	0x2f385ab8          ! %f42
	.word	0x747cbc59          ! %f43
	.word	0x7f82839a          ! %f44
	.word	0xfa0f2a69          ! %f45
	.word	0x1ddeda55          ! %f46
	.word	0xa47b1701          ! %f47
	.word	0x0b05e9ef          ! %f48
	.word	0x030b9dda          ! %f49
	.word	0x6ab445dd          ! %f50
	.word	0xba4d1c84          ! %f51
	.word	0x1bf80fa8          ! %f52
	.word	0xa689b41d          ! %f53
	.word	0xa1f0b8bd          ! %f54
	.word	0xcaf7d8bc          ! %f55
	.word	0xce2404f5          ! %f56
	.word	0xef593ecf          ! %f57
	.word	0xb8f12c67          ! %f58
	.word	0xad3be3f7          ! %f59
	.word	0xa3f7ff72          ! %f60
	.word	0xceab4024          ! %f61
	.word	0x430b2e30          ! %f62
	.word	0x1354ad0a          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x878       ! %g1 (code pointer)
	.word	t0_data_exp_shm_area! %g2 (shared area pointer)
	.word	0xf4641173          ! %g3 (loop index)
	.word	SYM(t0_subr3)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x8c740dfd          ! %o0
	.word	0xfe5cafdd          ! %o1
	.word	0x2b4962e2          ! %o2
	.word	0x458cc873          ! %o3
	.word	0x6eb34f07          ! %o4
	.word	0x5af5fef2          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0xfbf5dca9          ! %l0
	.word	0xfbec151b          ! %l1
	.word	0xc34b8f7a          ! %l2
	.word	0x4499d0ac          ! %l3
	.word	0x684ac8da          ! %l4
	.word	0x34d98ef3          ! %l5
	.word	0xdfad7415          ! %l6
	.word	0x5f0e1200          ! %l7
	.word	t0_data_exp_area0   ! %i0 (area pointer)
	.word	t0_data_exp_area0   ! %i1 (area pointer)
	.word	0xffffffe7          ! %i2 (byte offset)
	.word	0xffffffe0          ! %i3 (halfword offset)
	.word	0x00000018          ! %i4 (word offset)
	.word	0xffffffe0          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x22d23cb9          ! %y
	.word	0x00000008          ! %icc (nzvc)
	.word	0x00000a0b          ! %fsr
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

KDATA_MODULE(t0_module_data_exp_stack, 0x1f71a000)
.seg "data"
KGLOBAL(t0_data_exp_mtbl_size)
KGLOBAL(t0_data_exp_mtbl)
KGLOBAL(t0_data_exp_stack)
t0_data_exp_stack_start:
	.word	0xf5fa5ee2
	.word	0xf204f8d6
	.word	0x59b65312
	.word	0x551abb21
	.word	0x047ba714
	.word	0x62211a3e
	.word	0x898bc332
	.word	0x399dd3f3
	.word	0x98c5c5f3
	.word	0xe93d1c54
	.word	0xd924564f
	.word	0x43104c7b
	.word	0x7f0b2802
	.word	0x2be2a87b
	.word	0xc21932cd
	.word	0x39660f5a
	.word	0x60c60bdb
	.word	0xc4f2d912
	.word	0xbc0588b3
	.word	0xf75219ef
	.word	0x73bee552
	.word	0x25a0c7c4
	.word	0xc384a36c
	.word	0x811a24c8
	.word	0x3e734edb
	.word	0xf2562d1e
	.word	0xc358d3cb
	.word	0xf417df54
	.word	0xcfb02d28
	.word	0x3e89e561
	.word	0x1588764f
	.word	0x5265b2de
	.word	0xff37e916
	.word	0x81b96e99
	.word	0x8b4e99a8
	.word	0x13a040b6
	.word	0x5777e3c9
	.word	0x6933b3ed
	.word	0x3c910979
	.word	0x6c850fb0
	.word	0xa2de8915
	.word	0x0674ba39
	.word	0x1265c15f
	.word	0xaeca1cd2
	.word	0xe495a41f
	.word	0x5db701d9
	.word	0x204e0c32
	.word	0x30114348
	.word	0xca7ada44
	.word	0x2d58b1c7
	.word	0x7d6dd38a
	.word	0x3d95af9b
	.word	0x8f6a7038
	.word	0x69ffdfe8
	.word	0x3e69e384
	.word	0xa160d222
	.word	0x5f8ebd72
	.word	0x6e4a8aa2
	.word	0x4a0026c6
	.word	0xb8b784b8
	.word	0xcea8f1c7
	.word	0x248c17b1
	.word	0x22191ebf
	.word	0x994757ae
	.word	0xe86e1155
	.word	0x76e36c3b
	.word	0x01421c33
	.word	0xfea73a03
	.word	0x0f5d4aa2
	.word	0x6311f221
	.word	0x3d73fbf6
	.word	0xe33df0d2
	.word	0xdd230b04
	.word	0x0d2d1e97
	.word	0x25026bf7
	.word	0xa1d4120b
	.word	0xcaee7542
	.word	0xcbc94df6
	.word	0x2dcbfc80
	.word	0x1f3e7665
	.word	0xb6551e7b
	.word	0x32d608d0
	.word	0x818381bb
	.word	0xd0e95693
	.word	0xaabb3546
	.word	0xb5510645
	.word	0xa86f8977
	.word	0xfcdb87b5
	.word	0x5df4771a
	.word	0x42767f94
	.word	0x4684e92c
	.word	0x7d4c8b11
	.word	0xdb3497f0
	.word	0xce6aa8f4
	.word	0xc98da83c
	.word	0xcc5f6502
	.word	0x1fac0026
	.word	0x99c163a4
	.word	0x4a5dca7b
	.word	0x7f3f6f30
	.word	0x4a9804a6
	.word	0x34067d41
	.word	0x432bbef1
	.word	0x71fb9a00
	.word	0x355bfd47
	.word	0x24ba1057
	.word	0xa23a76de
	.word	0x3a4fd14e
	.word	0x31aadd72
	.word	0x3159da39
	.word	0xf65f68fd
	.word	0x7e537859
	.word	0x921f3308
	.word	0xc7499a14
	.word	0x4acf050d
	.word	0x2fff30fe
	.word	0xef19af83
	.word	0xe2f9cd42
	.word	0xd53e5b8c
	.word	0x8eeb6229
	.word	0x9c9c9f5b
	.word	0x33cd5cdb
	.word	0xf510fdc5
	.word	0x01cc3188
	.word	0xf05cf3aa
	.word	0x5b341092
	.word	0x88365a0d
	.word	0x2046e480
	.word	0x1fa7c212
	.word	0x3678dabd
	.word	0x2aca1849
	.word	0x9f07dc64
	.word	0x1d455ede
	.word	0xb32051b5
	.word	0x35bf3ab2
	.word	0xaabfa1e4
	.word	0xd6717567
	.word	0xdea4ea5f
	.word	0xe71606dc
	.word	0xbe20b3c3
	.word	0xfd91c2b8
	.word	0xa923c80a
	.word	0xf798faf3
	.word	0x3a5f0ccc
	.word	0x9fcb5675
	.word	0x3866357c
	.word	0x6f1d5348
	.word	0x4c4d9506
	.word	0x9a307df8
	.word	0x0ae11b47
	.word	0xfd07e40b
	.word	0xb144f226
	.word	0x923fbdbc
	.word	0x7a050760
	.word	0xaf9f4b5a
	.word	0x31c26b44
	.word	0xee0e7cfe
	.word	0x2dce99f1
	.word	0x15c0bf7a
	.word	0x8b64d3d2
	.word	0xe10047a1
	.word	0xa2306b6d
	.word	0xa41cfd63
	.word	0xa3d8b1c9
	.word	0x9495ca51
	.word	0x26ecbfe5
	.word	0x65771b81
	.word	0x49a41324
t0_data_exp_sp:
	.word	0xbfececeb
	.word	0x85069b9a
	.word	0x54b744b8
	.word	0x41d5c691
	.word	0x463daf1c
	.word	0x47570cd2
	.word	0x4c3f9fa9
	.word	0xa1a2eb66
	.word	t0_data_exp_area0
	.word	t0_data_exp_area0
	.word	0x00000001
	.word	0xffffffec
	.word	0x0000000c
	.word	0xfffffff0
	.word	t0_data_exp_fp
	.word	0xa0a92abc
	.word	0x2438713c
	.word	0x2eba3c53
	.word	0x4558bdc6
	.word	0x586ff80a
	.word	0xdecdbcb1
	.word	0x59bbdf6f
	.word	0x933a4ff3
	.word	0xf972647b
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
	.word   	0x5129a7ca	! [%fp - 0xc]
	.word   	0xa7f8249e	! [%fp - 0x8]
	.word   	0x147f655a	! [%fp - 0x4]
t0_data_exp_fp:
	.word	0x5529c39d
	.word	0x6e6bf592
	.word	0xc86d5385
	.word	0x132edc08
	.word	0xa7316c3a
	.word	0x430fd1a6
	.word	0x8e256c69
	.word	0x467b415c
	.word	0x9de1a6ed
	.word	0x19ac5d3c
	.word	0x0c93cae2
	.word	0x1cbed0a5
	.word	0x389271f8
	.word	0x78c28867
	.word	0xdc1dbfce
	.word	0x28e63809
	.word	0x85262e55
	.word	0x54b8bb98
	.word	0x3a3e5688
	.word	0xd8c847a8
	.word	0xb7e98a0a
	.word	0x44291568
	.word	0x8304b95a
	.word	0xf126ef00
t0_data_exp_stacktop:
	.word	0
t0_data_exp_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_exp_area0, 0x0ccb6000)
.seg "data"
t0_data_exp_area0_start:
.skip 6336
t0_data_exp_area0_begin:
	.word	0x2bd73bc1	! t0_data_exp_area0-0x20
	.word	0xbbaf4094	! t0_data_exp_area0-0x1c
	.word	0x59afe92f	! t0_data_exp_area0-0x18
	.word	0x30f82c92	! t0_data_exp_area0-0x14
	.word	0x93236397	! t0_data_exp_area0-0x10
	.word	0x0daf2647	! t0_data_exp_area0-0xc
	.word	0x6321bc8d	! t0_data_exp_area0-0x8
	.word	0xa65bd3c6	! t0_data_exp_area0-0x4
.global t0_data_exp_area0; t0_data_exp_area0:
	.word	0x19dba533	! t0_data_exp_area0+0x0
	.word	0x625e009f	! t0_data_exp_area0+0x4
	.word	0x920e59c1	! t0_data_exp_area0+0x8
	.word	0x868d4d0b	! t0_data_exp_area0+0xc
	.word	0xe3a64f1b	! t0_data_exp_area0+0x10
	.word	0x18eb9169	! t0_data_exp_area0+0x14
	.word	0x016ca05b	! t0_data_exp_area0+0x18
	.word	0xfd6eb442	! t0_data_exp_area0+0x1c
t0_data_exp_area0_end:
.skip 1792
t0_data_exp_area0_stop:

KDATA_MODULE(t0_module_data_exp_shm_area, 0x03e76000)
.seg "data"
t0_data_exp_shm_area_start:
t0_data_exp_shm_area_begin:
.global t0_data_exp_shm_area; t0_data_exp_shm_area:
	.word	0x237c2342	! t0_data_exp_shm_area+0x0 (t0)
	.word	0x15a329e9	! t0_data_exp_shm_area+0x4 (t1)
	.word	0x0c41812f	! t0_data_exp_shm_area+0x8 (t0)
	.word	0x67c1bc1f	! t0_data_exp_shm_area+0xc (t1)
	.word	0x38ff35dc	! t0_data_exp_shm_area+0x10 (t0)
	.word	0xb08d9b6d	! t0_data_exp_shm_area+0x14 (t1)
	.word	0x4b3cf95c	! t0_data_exp_shm_area+0x18 (t0)
	.word	0xa98897cd	! t0_data_exp_shm_area+0x1c (t1)
	.word	0xe5dd94e4	! t0_data_exp_shm_area+0x20 (t0)
	.word	0x4e01f584	! t0_data_exp_shm_area+0x24 (t1)
	.word	0x58ab2a75	! t0_data_exp_shm_area+0x28 (t0)
	.word	0x18bdb7e0	! t0_data_exp_shm_area+0x2c (t1)
	.word	0x711529ad	! t0_data_exp_shm_area+0x30 (t0)
	.word	0xc92476ae	! t0_data_exp_shm_area+0x34 (t1)
	.word	0x6dd2e741	! t0_data_exp_shm_area+0x38 (t0)
	.word	0xe9a76180	! t0_data_exp_shm_area+0x3c (t1)
	.word	0x6cbd8f96	! t0_data_exp_shm_area+0x40 (t0 bload)
	.word	0x4c18553e	! t0_data_exp_shm_area+0x44
	.word	0x291c6453	! t0_data_exp_shm_area+0x48
	.word	0x68db34f3	! t0_data_exp_shm_area+0x4c
	.word	0xed691b98	! t0_data_exp_shm_area+0x50
	.word	0xb4d1a6d5	! t0_data_exp_shm_area+0x54
	.word	0xc78f55e1	! t0_data_exp_shm_area+0x58
	.word	0x53b004f3	! t0_data_exp_shm_area+0x5c
	.word	0x6d54736d	! t0_data_exp_shm_area+0x60
	.word	0x629dc9c9	! t0_data_exp_shm_area+0x64
	.word	0x546a97ad	! t0_data_exp_shm_area+0x68
	.word	0x96a876e3	! t0_data_exp_shm_area+0x6c
	.word	0x082b5ead	! t0_data_exp_shm_area+0x70
	.word	0x40c29238	! t0_data_exp_shm_area+0x74
	.word	0xf8ee7546	! t0_data_exp_shm_area+0x78
	.word	0x0a7b2f6c	! t0_data_exp_shm_area+0x7c
	.word	0xd10be619	! t0_data_exp_shm_area+0x80 (t0 bstore)
	.word	0x543da250	! t0_data_exp_shm_area+0x84
	.word	0x433b90a5	! t0_data_exp_shm_area+0x88
	.word	0xf566fa61	! t0_data_exp_shm_area+0x8c
	.word	0xcfafb4f0	! t0_data_exp_shm_area+0x90
	.word	0x45445313	! t0_data_exp_shm_area+0x94
	.word	0x299915a1	! t0_data_exp_shm_area+0x98
	.word	0x8940eb24	! t0_data_exp_shm_area+0x9c
	.word	0xf1b9bb80	! t0_data_exp_shm_area+0xa0
	.word	0x15d2e559	! t0_data_exp_shm_area+0xa4
	.word	0x132630a8	! t0_data_exp_shm_area+0xa8
	.word	0x8d999f48	! t0_data_exp_shm_area+0xac
	.word	0x9da2e6ff	! t0_data_exp_shm_area+0xb0
	.word	0xad0f3f1b	! t0_data_exp_shm_area+0xb4
	.word	0x599fbcac	! t0_data_exp_shm_area+0xb8
	.word	0x30218777	! t0_data_exp_shm_area+0xbc
	.word	0x81c2363d	! t0_data_exp_shm_area+0xc0 (t1 bload)
	.word	0x7141413d	! t0_data_exp_shm_area+0xc4
	.word	0xb51ee4b3	! t0_data_exp_shm_area+0xc8
	.word	0x55a7d712	! t0_data_exp_shm_area+0xcc
	.word	0x9fd864cf	! t0_data_exp_shm_area+0xd0
	.word	0x3eac2bd0	! t0_data_exp_shm_area+0xd4
	.word	0xaa972f3b	! t0_data_exp_shm_area+0xd8
	.word	0x90ab3fad	! t0_data_exp_shm_area+0xdc
	.word	0x9207c8f2	! t0_data_exp_shm_area+0xe0
	.word	0x7447daf4	! t0_data_exp_shm_area+0xe4
	.word	0x36e874d2	! t0_data_exp_shm_area+0xe8
	.word	0xb3b4653f	! t0_data_exp_shm_area+0xec
	.word	0x2c12c301	! t0_data_exp_shm_area+0xf0
	.word	0x802ff499	! t0_data_exp_shm_area+0xf4
	.word	0x29dd450a	! t0_data_exp_shm_area+0xf8
	.word	0x57953570	! t0_data_exp_shm_area+0xfc
	.word	0xdd738bdc	! t0_data_exp_shm_area+0x100 (t1 bstore)
	.word	0x9192ed57	! t0_data_exp_shm_area+0x104
	.word	0xf7753d0b	! t0_data_exp_shm_area+0x108
	.word	0x8260fdd1	! t0_data_exp_shm_area+0x10c
	.word	0x05068f0f	! t0_data_exp_shm_area+0x110
	.word	0x9666c1c4	! t0_data_exp_shm_area+0x114
	.word	0xcdc9684e	! t0_data_exp_shm_area+0x118
	.word	0x5549b750	! t0_data_exp_shm_area+0x11c
	.word	0xf0fdc333	! t0_data_exp_shm_area+0x120
	.word	0x0b9f710a	! t0_data_exp_shm_area+0x124
	.word	0x86cf69a5	! t0_data_exp_shm_area+0x128
	.word	0x9b4214f4	! t0_data_exp_shm_area+0x12c
	.word	0xd906a494	! t0_data_exp_shm_area+0x130
	.word	0xe5ba0cb3	! t0_data_exp_shm_area+0x134
	.word	0x0b37b07e	! t0_data_exp_shm_area+0x138
	.word	0x982549c5	! t0_data_exp_shm_area+0x13c
t0_data_exp_shm_area_end:
t0_data_exp_shm_area_stop:

!    kaos version   4.2
!    thread         1
!    icount         5000
!    targetid       NIAGARA:SIM
!    hostid         NIAGARA:5.8
!    areas          1
!    areasize       64
!    areaoffset     6336
!    ncache         0
!    emulate_ncache 1
!    pagesize       8192
!    invsize        0
!    codecount      5002
!    code           2c78e000
!    entry          2c78e000
!    fsr_exceptions 00000000
!    fsr_roundmode  00000004
!    fsr_mask       c0000fff
!    seed           d3d14663fab3
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

KTEXT_MODULE(t1_module_ktbl, 0x6c78e000)
.seg "text"
	KGLOBAL(t1_ktbl)
t1_ktbl_page_begin:
.global t1_kref; t1_kref:
	.skip 0
t1_ktbl:
	.word	0x89b38a94	! t1_kref+0x0:   	fpsub16	%f14, %f20, %f4
	.word	0xee6e601c	! t1_kref+0x4:   	ldstub	[%i1 + 0x1c], %l7
	.word	0xaba01a4a	! t1_kref+0x8:   	fdtoi	%f10, %f21
	.word	0x8db1874e	! t1_kref+0xc:   	fpack32	%f6, %f14, %f6
	.word	0x85b40a4e	! t1_kref+0x10:   	fpadd32	%f16, %f14, %f2
	.word	0xd20e401a	! t1_kref+0x14:   	ldub	[%i1 + %i2], %o1
	.word	0xa6636ad2	! t1_kref+0x18:   	subc	%o5, 0xad2, %l3
	.word	0x9db00c20	! t1_kref+0x1c:   	fzeros	%f14
	.word	0x92aeb629	! t1_kref+0x20:   	andncc	%i2, -0x9d7, %o1
	.word	0xe4087e08	! t1_kref+0x24:   	ldub	[%g1 - 0x1f8], %l2
	.word	0xa41ca00c	! t1_kref+0x28:   	xor	%l2, 0xc, %l2
	.word	0xe4287e08	! t1_kref+0x2c:   	stb	%l2, [%g1 - 0x1f8]
	.word	0x81d87e08	! t1_kref+0x30:   	flush	%g1 - 0x1f8
	.word	0x969cc017	! t1_kref+0x34:   	xorcc	%l3, %l7, %o3
	.word	0x9056a14e	! t1_kref+0x38:   	umul	%i2, 0x14e, %o0
2:	.word	0xae8a69d1	! t1_kref+0x3c:   	andcc	%o1, 0x9d1, %l7
	.word	0xd850a00e	! t1_kref+0x40:   	ldsh	[%g2 + 0xe], %o4
	.word	0x81ac0aa5	! t1_kref+0x44:   	fcmpes	%fcc0, %f16, %f5
	.word	0xed066018	! t1_kref+0x48:   	ld	[%i1 + 0x18], %f22
	.word	0xe60e2012	! t1_kref+0x4c:   	ldub	[%i0 + 0x12], %l3
	.word	0xa9a58821	! t1_kref+0x50:   	fadds	%f22, %f1, %f20
	.word	0x2b0cc873	! t1_kref+0x54:   	sethi	%hi(0x3321cc00), %l5
	.word	0x9de3bfa0	! t1_kref+0x58:   	save	%sp, -0x60, %sp
	.word	0x99ee001c	! t1_kref+0x5c:   	restore	%i0, %i4, %o4
	.word	0xac902ba2	! t1_kref+0x60:   	orcc	%g0, 0xba2, %l6
	.word	0x87b5caf3	! t1_kref+0x64:   	fpsub32s	%f23, %f19, %f3
	.word	0xe51fbc40	! t1_kref+0x68:   	ldd	[%fp - 0x3c0], %f18
	.word	0xae080000	! t1_kref+0x6c:   	and	%g0, %g0, %l7
	.word	0xe706600c	! t1_kref+0x70:   	ld	[%i1 + 0xc], %f19
	.word	0x91b30e54	! t1_kref+0x74:   	fxnor	%f12, %f20, %f8
	.word	0xe1be1889	! t1_kref+0x78:   	stda	%f16, [%i0 + %o1]0xc4
	sethi	%hi(2f), %o7
	.word	0xe40be0a8	! t1_kref+0x80:   	ldub	[%o7 + 0xa8], %l2
	.word	0xa41ca00c	! t1_kref+0x84:   	xor	%l2, 0xc, %l2
	.word	0xe42be0a8	! t1_kref+0x88:   	stb	%l2, [%o7 + 0xa8]
	.word	0x81dbe0a8	! t1_kref+0x8c:   	flush	%o7 + 0xa8
	.word	0xa732201f	! t1_kref+0x90:   	srl	%o0, 0x1f, %l3
	.word	0x9940c000	! t1_kref+0x94:   	mov	%asi, %o4
	.word	0x96fdf38a	! t1_kref+0x98:   	sdivcc	%l7, -0xc76, %o3
	.word	0x8ba01082	! t1_kref+0x9c:   	fxtos	%f2, %f5
	.word	0x9272f7b1	! t1_kref+0xa0:   	udiv	%o3, -0x84f, %o1
	.word	0xd0865000	! t1_kref+0xa4:   	lda	[%i1]0x80, %o0
2:	.word	0xa8724017	! t1_kref+0xa8:   	udiv	%o1, %l7, %l4
	.word	0xd48e9019	! t1_kref+0xac:   	lduba	[%i2 + %i1]0x80, %o2
	.word	0xe6c81019	! t1_kref+0xb0:   	ldsba	[%g0 + %i1]0x80, %l3
	.word	0x942a0017	! t1_kref+0xb4:   	andn	%o0, %l7, %o2
	.word	0xa6d5c015	! t1_kref+0xb8:   	umulcc	%l7, %l5, %l3
	.word	0xee0e401a	! t1_kref+0xbc:   	ldub	[%i1 + %i2], %l7
	.word	0xdf263fe0	! t1_kref+0xc0:   	st	%f15, [%i0 - 0x20]
	.word	0xdd1fbfc0	! t1_kref+0xc4:   	ldd	[%fp - 0x40], %f14
	.word	0x36800005	! t1_kref+0xc8:   	bge,a	_kref+0xdc
	.word	0xdd3e0000	! t1_kref+0xcc:   	std	%f14, [%i0]
	.word	0xe3b8a100	! t1_kref+0xd0:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0xeaee101a	! t1_kref+0xd4:   	ldstuba	[%i0 + %i2]0x80, %l5
	.word	0xac92c016	! t1_kref+0xd8:   	orcc	%o3, %l6, %l6
	.word	0x81820000	! t1_kref+0xdc:   	wr	%o0, %g0, %y
	.word	0x8fa01899	! t1_kref+0xe0:   	fitos	%f25, %f7
	.word	0xf420a01c	! t1_kref+0xe4:   	st	%i2, [%g2 + 0x1c]
	.word	0xae350015	! t1_kref+0xe8:   	orn	%l4, %l5, %l7
	.word	0xacb33fe5	! t1_kref+0xec:   	orncc	%o4, -0x1b, %l6
	.word	0xf320a024	! t1_kref+0xf0:   	st	%f25, [%g2 + 0x24]
	.word	0xaaab000b	! t1_kref+0xf4:   	andncc	%o4, %o3, %l5
	.word	0x8d85001a	! t1_kref+0xf8:   	wr	%l4, %i2, %fprs
	.word	0xeca71019	! t1_kref+0xfc:   	sta	%l6, [%i4 + %i1]0x80
	.word	0xe1be588b	! t1_kref+0x100:   	stda	%f16, [%i1 + %o3]0xc4
	.word	0x95a38842	! t1_kref+0x104:   	faddd	%f14, %f2, %f10
	.word	0xb3a2082f	! t1_kref+0x108:   	fadds	%f8, %f15, %f25
	.word	0x81aa0a4a	! t1_kref+0x10c:   	fcmpd	%fcc0, %f8, %f10
	.word	0x83a000a2	! t1_kref+0x110:   	fnegs	%f2, %f1
	.word	0xea567fe6	! t1_kref+0x114:   	ldsh	[%i1 - 0x1a], %l5
	.word	0xc1be5800	! t1_kref+0x118:   	stda	%f0, [%i1]0xc0
	.word	0x87a0c9b0	! t1_kref+0x11c:   	fdivs	%f3, %f16, %f3
	.word	0xada018ce	! t1_kref+0x120:   	fdtos	%f14, %f22
	.word	0xe9064000	! t1_kref+0x124:   	ld	[%i1], %f20
	.word	0x98a6fead	! t1_kref+0x128:   	subcc	%i3, -0x153, %o4
	.word	0x8da3095a	! t1_kref+0x12c:   	fmuld	%f12, %f26, %f6
	.word	0x8db08e80	! t1_kref+0x130:   	fsrc1	%f2, %f6
	.word	0x85a14d21	! t1_kref+0x134:   	fsmuld	%f5, %f1, %f2
	.word	0xd1be1880	! t1_kref+0x138:   	stda	%f8, [%i0]0xc4
	.word	0x9236b726	! t1_kref+0x13c:   	orn	%i2, -0x8da, %o1
	.word	0xa5a0190e	! t1_kref+0x140:   	fitod	%f14, %f18
	.word	0xac92226f	! t1_kref+0x144:   	orcc	%o0, 0x26f, %l6
	.word	0x85b287c6	! t1_kref+0x148:   	pdist	%f10, %f6, %f2
	.word	0xd8380018	! t1_kref+0x14c:   	std	%o4, [%g0 + %i0]
	.word	0x90db3e95	! t1_kref+0x150:   	smulcc	%o4, -0x16b, %o0
	.word	0xabb1858e	! t1_kref+0x154:   	fcmpgt32	%f6, %f14, %l5
	.word	0xb5b28e78	! t1_kref+0x158:   	fxnors	%f10, %f24, %f26
	.word	0xaba01a44	! t1_kref+0x15c:   	fdtoi	%f4, %f21
	.word	0x96a2a2cd	! t1_kref+0x160:   	subcc	%o2, 0x2cd, %o3
	.word	0xe906201c	! t1_kref+0x164:   	ld	[%i0 + 0x1c], %f20
	.word	0x943821d4	! t1_kref+0x168:   	xnor	%g0, 0x1d4, %o2
	.word	0xace6ac4e	! t1_kref+0x16c:   	subccc	%i2, 0xc4e, %l6
	.word	0xaedafecf	! t1_kref+0x170:   	smulcc	%o3, -0x131, %l7
	.word	0xad44c000	! t1_kref+0x174:   	mov	%gsr, %l6
	.word	0x92f5400a	! t1_kref+0x178:   	udivcc	%l5, %o2, %o1
	.word	0x9da409c2	! t1_kref+0x17c:   	fdivd	%f16, %f2, %f14
	.word	0x81a98a35	! t1_kref+0x180:   	fcmps	%fcc0, %f6, %f21
	.word	0xe3b8a100	! t1_kref+0x184:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0xaefa28ef	! t1_kref+0x188:   	sdivcc	%o0, 0x8ef, %l7
	.word	0x95a018c2	! t1_kref+0x18c:   	fdtos	%f2, %f10
	.word	0xa9aa804c	! t1_kref+0x190:   	fmovdue	%fcc0, %f12, %f20
	.word	0x97b48efa	! t1_kref+0x194:   	fornot2s	%f18, %f26, %f11
	.word	0xb3a109b0	! t1_kref+0x198:   	fdivs	%f4, %f16, %f25
	.word	0x9fa289a4	! t1_kref+0x19c:   	fdivs	%f10, %f4, %f15
	.word	0xada04933	! t1_kref+0x1a0:   	fmuls	%f1, %f19, %f22
	.word	0xd0861000	! t1_kref+0x1a4:   	lda	[%i0]0x80, %o0
	.word	0xae9dad1a	! t1_kref+0x1a8:   	xorcc	%l6, 0xd1a, %l7
	.word	0xe3b8a100	! t1_kref+0x1ac:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0x9650000c	! t1_kref+0x1b0:   	umul	%g0, %o4, %o3
	.word	0x3a480007	! t1_kref+0x1b4:   	bcc,a,pt	%icc, _kref+0x1d0
	.word	0x9730000a	! t1_kref+0x1b8:   	srl	%g0, %o2, %o3
	.word	0x8bb10e65	! t1_kref+0x1bc:   	fxnors	%f4, %f5, %f5
	.word	0x35800002	! t1_kref+0x1c0:   	fbue,a	_kref+0x1c8
	.word	0x8da608cc	! t1_kref+0x1c4:   	fsubd	%f24, %f12, %f6
	.word	0x91b007a0	! t1_kref+0x1c8:   	fpackfix	%f0, %f8
	.word	0x36480004	! t1_kref+0x1cc:   	bge,a,pt	%icc, _kref+0x1dc
	.word	0xec9e501d	! t1_kref+0x1d0:   	ldda	[%i1 + %i5]0x80, %l6
	.word	0x85b28732	! t1_kref+0x1d4:   	fmuld8ulx16	%f10, %f18, %f2
	.word	0x3c800003	! t1_kref+0x1d8:   	bpos,a	_kref+0x1e4
	.word	0xb1a01894	! t1_kref+0x1dc:   	fitos	%f20, %f24
	.word	0xda2e3fe5	! t1_kref+0x1e0:   	stb	%o5, [%i0 - 0x1b]
	.word	0xee2e8019	! t1_kref+0x1e4:   	stb	%l7, [%i2 + %i1]
	.word	0xa69dc00c	! t1_kref+0x1e8:   	xorcc	%l7, %o4, %l3
	.word	0xa9b007b2	! t1_kref+0x1ec:   	fpackfix	%f18, %f20
	.word	0x95b5c0ec	! t1_kref+0x1f0:   	edge16ln	%l7, %o4, %o2
	.word	0x9de3bfa0	! t1_kref+0x1f4:   	save	%sp, -0x60, %sp
	.word	0xadef64b8	! t1_kref+0x1f8:   	restore	%i5, 0x4b8, %l6
	.word	0x81ab4aba	! t1_kref+0x1fc:   	fcmpes	%fcc0, %f13, %f26
	.word	0xa1a5c826	! t1_kref+0x200:   	fadds	%f23, %f6, %f16
	.word	0xaa024013	! t1_kref+0x204:   	add	%o1, %l3, %l5
	.word	0x81828000	! t1_kref+0x208:   	wr	%o2, %g0, %y
	.word	0x86102003	! t1_kref+0x20c:   	mov	0x3, %g3
	.word	0x32800000	! t1_kref+0x210:   	bne,a	_kref+0x210
	.word	0x86a0e001	! t1_kref+0x214:   	subcc	%g3, 1, %g3
	.word	0xaf703fca	! t1_kref+0x218:   	popc	-0x36, %l7
	.word	0x95b34109	! t1_kref+0x21c:   	edge32	%o5, %o1, %o2
	.word	0x86102010	! t1_kref+0x220:   	mov	0x10, %g3
	.word	0x86a0e001	! t1_kref+0x224:   	subcc	%g3, 1, %g3
	.word	0x22800003	! t1_kref+0x228:   	be,a	_kref+0x234
	.word	0xab3b6000	! t1_kref+0x22c:   	sra	%o5, 0x0, %l5
	.word	0x39800003	! t1_kref+0x230:   	fbuge,a	_kref+0x23c
	.word	0xabb18d60	! t1_kref+0x234:   	fnot1s	%f6, %f21
	.word	0xc726401c	! t1_kref+0x238:   	st	%f3, [%i1 + %i4]
	.word	0xad408000	! t1_kref+0x23c:   	mov	%ccr, %l6
	.word	0x95b20033	! t1_kref+0x240:   	edge8n	%o0, %l3, %o2
	.word	0xa1a409d0	! t1_kref+0x244:   	fdivd	%f16, %f16, %f16
	.word	0xa3b20a3a	! t1_kref+0x248:   	fpadd16s	%f8, %f26, %f17
	.word	0xee28a015	! t1_kref+0x24c:   	stb	%l7, [%g2 + 0x15]
	.word	0x98db400c	! t1_kref+0x250:   	smulcc	%o5, %o4, %o4
	.word	0x22800005	! t1_kref+0x254:   	be,a	_kref+0x268
	.word	0x99a108c2	! t1_kref+0x258:   	fsubd	%f4, %f2, %f12
!	.word	0x3ab9f768	! t1_kref+0x25c:   	bcc,a	SYM(t1_subr2)
	   	bcc,a	SYM(t1_subr2)
	.word	0x9e006028	! t1_kref+0x260:   	add	%g1, 0x28, %o7
	.word	0x93a000b3	! t1_kref+0x264:   	fnegs	%f19, %f9
	.word	0x9862643b	! t1_kref+0x268:   	subc	%o1, 0x43b, %o4
	.word	0xece81018	! t1_kref+0x26c:   	ldstuba	[%g0 + %i0]0x80, %l6
	.word	0xe3b8a100	! t1_kref+0x270:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0xa6526aa4	! t1_kref+0x274:   	umul	%o1, 0xaa4, %l3
	.word	0xaeaa400c	! t1_kref+0x278:   	andncc	%o1, %o4, %l7
	.word	0xd43e4000	! t1_kref+0x27c:   	std	%o2, [%i1]
	.word	0x9fc00004	! t1_kref+0x280:   	call	%g0 + %g4
	.word	0x94ad7082	! t1_kref+0x284:   	andncc	%l5, -0xf7e, %o2
	.word	0x8da38948	! t1_kref+0x288:   	fmuld	%f14, %f8, %f6
	.word	0xacf53908	! t1_kref+0x28c:   	udivcc	%l4, -0x6f8, %l6
	.word	0x22800006	! t1_kref+0x290:   	be,a	_kref+0x2a8
	.word	0x987ac01a	! t1_kref+0x294:   	sdiv	%o3, %i2, %o4
	.word	0xc0680018	! t1_kref+0x298:   	ldstub	[%g0 + %i0], %g0
	.word	0x99b54136	! t1_kref+0x29c:   	edge32n	%l5, %l6, %o4
	.word	0x933de019	! t1_kref+0x2a0:   	sra	%l7, 0x19, %o1
	.word	0xd300a014	! t1_kref+0x2a4:   	ld	[%g2 + 0x14], %f9
	.word	0x81ad8a56	! t1_kref+0x2a8:   	fcmpd	%fcc0, %f22, %f22
	.word	0x91a089c0	! t1_kref+0x2ac:   	fdivd	%f2, %f0, %f8
	.word	0xeece501a	! t1_kref+0x2b0:   	ldsba	[%i1 + %i2]0x80, %l7
	.word	0xa1b28ece	! t1_kref+0x2b4:   	fornot2	%f10, %f14, %f16
	.word	0x85b00fc0	! t1_kref+0x2b8:   	fone	%f2
	.word	0xf636401b	! t1_kref+0x2bc:   	sth	%i3, [%i1 + %i3]
	.word	0x39800002	! t1_kref+0x2c0:   	fbuge,a	_kref+0x2c8
	.word	0x95b00f29	! t1_kref+0x2c4:   	fsrc2s	%f9, %f10
	.word	0xe9be5880	! t1_kref+0x2c8:   	stda	%f20, [%i1]0xc4
	.word	0xa8258000	! t1_kref+0x2cc:   	sub	%l6, %g0, %l4
	.word	0x9970000c	! t1_kref+0x2d0:   	popc	%o4, %o4
	.word	0x1305c004	! t1_kref+0x2d4:   	sethi	%hi(0x17001000), %o1
	.word	0xab408000	! t1_kref+0x2d8:   	mov	%ccr, %l5
	.word	0xa1a0190a	! t1_kref+0x2dc:   	fitod	%f10, %f16
	.word	0xd0264000	! t1_kref+0x2e0:   	st	%o0, [%i1]
	.word	0xb5a309a4	! t1_kref+0x2e4:   	fdivs	%f12, %f4, %f26
	.word	0x8184c000	! t1_kref+0x2e8:   	wr	%l3, %g0, %y
	.word	0x8db34ca4	! t1_kref+0x2ec:   	fandnot2s	%f13, %f4, %f6
	.word	0x93b205d6	! t1_kref+0x2f0:   	fcmpeq32	%f8, %f22, %o1
	.word	0x292a7bae	! t1_kref+0x2f4:   	sethi	%hi(0xa9eeb800), %l4
	.word	0xa804c013	! t1_kref+0x2f8:   	add	%l3, %l3, %l4
	.word	0x91b30ece	! t1_kref+0x2fc:   	fornot2	%f12, %f14, %f8
	.word	0x81ae0aa7	! t1_kref+0x300:   	fcmpes	%fcc0, %f24, %f7
	.word	0x93b44ae9	! t1_kref+0x304:   	fpsub32s	%f17, %f9, %f9
	.word	0x96db7b6f	! t1_kref+0x308:   	smulcc	%o5, -0x491, %o3
	.word	0x8ba2c9b1	! t1_kref+0x30c:   	fdivs	%f11, %f17, %f5
	.word	0x96c54013	! t1_kref+0x310:   	addccc	%l5, %l3, %o3
	.word	0x95b585c2	! t1_kref+0x314:   	fcmpeq32	%f22, %f2, %o2
	.word	0xc1be1809	! t1_kref+0x318:   	stda	%f0, [%i0 + %o1]0xc0
	.word	0xaa9d75dd	! t1_kref+0x31c:   	xorcc	%l5, -0xa23, %l5
	.word	0xa9326002	! t1_kref+0x320:   	srl	%o1, 0x2, %l4
	.word	0x93a10826	! t1_kref+0x324:   	fadds	%f4, %f6, %f9
	.word	0x3c800006	! t1_kref+0x328:   	bpos,a	_kref+0x340
	.word	0xa884c01a	! t1_kref+0x32c:   	addcc	%l3, %i2, %l4
	.word	0x81834000	! t1_kref+0x330:   	wr	%o5, %g0, %y
	.word	0x81a90a42	! t1_kref+0x334:   	fcmpd	%fcc0, %f4, %f2
	.word	0x81ab0ac2	! t1_kref+0x338:   	fcmped	%fcc0, %f12, %f2
	.word	0x9fa40923	! t1_kref+0x33c:   	fmuls	%f16, %f3, %f15
	.word	0xa8603c2c	! t1_kref+0x340:   	subc	%g0, -0x3d4, %l4
	.word	0xa9b40e18	! t1_kref+0x344:   	fand	%f16, %f24, %f20
	.word	0x95b507d0	! t1_kref+0x348:   	pdist	%f20, %f16, %f10
	.word	0x85a0052e	! t1_kref+0x34c:   	fsqrts	%f14, %f2
	.word	0xa6e36989	! t1_kref+0x350:   	subccc	%o5, 0x989, %l3
	.word	0x8143c000	! t1_kref+0x354:   	stbar
	.word	0xafa8c022	! t1_kref+0x358:   	fmovsul	%fcc0, %f2, %f23
	.word	0x9db00ccc	! t1_kref+0x35c:   	fnot2	%f12, %f14
	.word	0x81824000	! t1_kref+0x360:   	wr	%o1, %g0, %y
	.word	0x81da7d48	! t1_kref+0x364:   	flush	%o1 - 0x2b8
	.word	0x99a50948	! t1_kref+0x368:   	fmuld	%f20, %f8, %f12
	.word	0x95b240aa	! t1_kref+0x36c:   	edge16n	%o1, %o2, %o2
	sethi	%hi(2f), %o7
	.word	0xe40be384	! t1_kref+0x374:   	ldub	[%o7 + 0x384], %l2
	.word	0xa41ca00c	! t1_kref+0x378:   	xor	%l2, 0xc, %l2
	.word	0xe42be384	! t1_kref+0x37c:   	stb	%l2, [%o7 + 0x384]
	.word	0x81dbe384	! t1_kref+0x380:   	flush	%o7 + 0x384
2:	.word	0x98a338e0	! t1_kref+0x384:   	subcc	%o4, -0x720, %o4
	.word	0xa8c50014	! t1_kref+0x388:   	addccc	%l4, %l4, %l4
	.word	0xb1b48ada	! t1_kref+0x38c:   	fpsub32	%f18, %f26, %f24
	.word	0xa81cf5bd	! t1_kref+0x390:   	xor	%l3, -0xa43, %l4
	.word	0xc3067fe8	! t1_kref+0x394:   	ld	[%i1 - 0x18], %f1
	.word	0xec263fe4	! t1_kref+0x398:   	st	%l6, [%i0 - 0x1c]
	.word	0xa89eb5e4	! t1_kref+0x39c:   	xorcc	%i2, -0xa1c, %l4
	.word	0xa5b286d4	! t1_kref+0x3a0:   	fmul8sux16	%f10, %f20, %f18
	.word	0x98c20009	! t1_kref+0x3a4:   	addccc	%o0, %o1, %o4
	.word	0x953a4014	! t1_kref+0x3a8:   	sra	%o1, %l4, %o2
	.word	0x83a00534	! t1_kref+0x3ac:   	fsqrts	%f20, %f1
	.word	0xa8c36409	! t1_kref+0x3b0:   	addccc	%o5, 0x409, %l4
	.word	0x96fae054	! t1_kref+0x3b4:   	sdivcc	%o3, 0x54, %o3
	.word	0x89b30ec4	! t1_kref+0x3b8:   	fornot2	%f12, %f4, %f4
	.word	0xab418000	! t1_kref+0x3bc:   	mov	%fprs, %l5
	.word	0xa9418000	! t1_kref+0x3c0:   	mov	%fprs, %l4
	.word	0x81b3074a	! t1_kref+0x3c4:   	fpack32	%f12, %f10, %f0
	.word	0xc9380019	! t1_kref+0x3c8:   	std	%f4, [%g0 + %i1]
	.word	0xacfdabf7	! t1_kref+0x3cc:   	sdivcc	%l6, 0xbf7, %l6
	.word	0x9da01899	! t1_kref+0x3d0:   	fitos	%f25, %f14
	.word	0x21800002	! t1_kref+0x3d4:   	fbn,a	_kref+0x3dc
	.word	0x9082be46	! t1_kref+0x3d8:   	addcc	%o2, -0x1ba, %o0
	.word	0xadb50ec4	! t1_kref+0x3dc:   	fornot2	%f20, %f4, %f22
	.word	0x90fb3550	! t1_kref+0x3e0:   	sdivcc	%o4, -0xab0, %o0
	.word	0x91a2c9a1	! t1_kref+0x3e4:   	fdivs	%f11, %f1, %f8
	.word	0xd2366014	! t1_kref+0x3e8:   	sth	%o1, [%i1 + 0x14]
	.word	0xa8a03485	! t1_kref+0x3ec:   	subcc	%g0, -0xb7b, %l4
	.word	0x99b10f54	! t1_kref+0x3f0:   	fornot1	%f4, %f20, %f12
	.word	0xacd6c014	! t1_kref+0x3f4:   	umulcc	%i3, %l4, %l6
	.word	0xea0e7fff	! t1_kref+0x3f8:   	ldub	[%i1 - 1], %l5
	.word	0x9f414000	! t1_kref+0x3fc:   	mov	%pc, %o7
	.word	0x99b30707	! t1_kref+0x400:   	fmuld8sux16	%f12, %f7, %f12
	.word	0x97b500e9	! t1_kref+0x404:   	edge16ln	%l4, %o1, %o3
	.word	0x9244c00c	! t1_kref+0x408:   	addc	%l3, %o4, %o1
	.word	0xb1a000a4	! t1_kref+0x40c:   	fnegs	%f4, %f24
	.word	0xd6500019	! t1_kref+0x410:   	ldsh	[%g0 + %i1], %o3
	.word	0x85a01919	! t1_kref+0x414:   	fitod	%f25, %f2
	.word	0xa81cc009	! t1_kref+0x418:   	xor	%l3, %o1, %l4
	.word	0x972b600c	! t1_kref+0x41c:   	sll	%o5, 0xc, %o3
	.word	0xe4086220	! t1_kref+0x420:   	ldub	[%g1 + 0x220], %l2
	.word	0xa41ca00c	! t1_kref+0x424:   	xor	%l2, 0xc, %l2
	.word	0xe4286220	! t1_kref+0x428:   	stb	%l2, [%g1 + 0x220]
	.word	0x81d86220	! t1_kref+0x42c:   	flush	%g1 + 0x220
	.word	0xd256c018	! t1_kref+0x430:   	ldsh	[%i3 + %i0], %o1
	.word	0x3f800005	! t1_kref+0x434:   	fbo,a	_kref+0x448
	.word	0xd1180019	! t1_kref+0x438:   	ldd	[%g0 + %i1], %f8
	.word	0x32800005	! t1_kref+0x43c:   	bne,a	_kref+0x450
	.word	0x90420009	! t1_kref+0x440:   	addc	%o0, %o1, %o0
	.word	0xa6dd6f91	! t1_kref+0x444:   	smulcc	%l5, 0xf91, %l3
	.word	0xe91fbec0	! t1_kref+0x448:   	ldd	[%fp - 0x140], %f20
	.word	0x9fa01898	! t1_kref+0x44c:   	fitos	%f24, %f15
	.word	0xada60933	! t1_kref+0x450:   	fmuls	%f24, %f19, %f22
2:	.word	0x95b00cd0	! t1_kref+0x454:   	fnot2	%f16, %f10
	.word	0xc9263fe4	! t1_kref+0x458:   	st	%f4, [%i0 - 0x1c]
	.word	0xe856201c	! t1_kref+0x45c:   	ldsh	[%i0 + 0x1c], %l4
	.word	0x81ad8a46	! t1_kref+0x460:   	fcmpd	%fcc0, %f22, %f6
	.word	0x9da01909	! t1_kref+0x464:   	fitod	%f9, %f14
	.word	0xb1a5094a	! t1_kref+0x468:   	fmuld	%f20, %f10, %f24
	.word	0x9802000d	! t1_kref+0x46c:   	add	%o0, %o5, %o4
	.word	0xc12e001c	! t1_kref+0x470:   	st	%fsr, [%i0 + %i4]
	.word	0xc1bf1a58	! t1_kref+0x474:   	stda	%f0, [%i4 + %i0]0xd2
	.word	0xacf2f311	! t1_kref+0x478:   	udivcc	%o3, -0xcef, %l6
	.word	0xa5a0002a	! t1_kref+0x47c:   	fmovs	%f10, %f18
	.word	0x95b68a65	! t1_kref+0x480:   	fpadd32s	%f26, %f5, %f10
	.word	0xa67a000b	! t1_kref+0x484:   	sdiv	%o0, %o3, %l3
	.word	0x97b5c01b	! t1_kref+0x488:   	edge8	%l7, %i3, %o3
	.word	0xd4163fe4	! t1_kref+0x48c:   	lduh	[%i0 - 0x1c], %o2
	.word	0x2739eb1a	! t1_kref+0x490:   	sethi	%hi(0xe7ac6800), %l3
	.word	0x907e8008	! t1_kref+0x494:   	sdiv	%i2, %o0, %o0
	.word	0x92857969	! t1_kref+0x498:   	addcc	%l5, -0x697, %o1
	.word	0x2c800004	! t1_kref+0x49c:   	bneg,a	_kref+0x4ac
	.word	0xaa827a88	! t1_kref+0x4a0:   	addcc	%o1, -0x578, %l5
	.word	0xe3b8a100	! t1_kref+0x4a4:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0xea563fe8	! t1_kref+0x4a8:   	ldsh	[%i0 - 0x18], %l5
	.word	0x9db00fc0	! t1_kref+0x4ac:   	fone	%f14
	.word	0xc7064000	! t1_kref+0x4b0:   	ld	[%i1], %f3
	.word	0xb1a01905	! t1_kref+0x4b4:   	fitod	%f5, %f24
	.word	0xb5a0188e	! t1_kref+0x4b8:   	fitos	%f14, %f26
	.word	0xe650a02c	! t1_kref+0x4bc:   	ldsh	[%g2 + 0x2c], %l3
	.word	0x86102004	! t1_kref+0x4c0:   	mov	0x4, %g3
	.word	0x32800000	! t1_kref+0x4c4:   	bne,a	_kref+0x4c4
	.word	0x86a0e001	! t1_kref+0x4c8:   	subcc	%g3, 1, %g3
	.word	0xd446401c	! t1_kref+0x4cc:   	ldsw	[%i1 + %i4], %o2
	.word	0xf1be5888	! t1_kref+0x4d0:   	stda	%f24, [%i1 + %o0]0xc4
	.word	0x94aa7266	! t1_kref+0x4d4:   	andncc	%o1, -0xd9a, %o2
	.word	0x901b68da	! t1_kref+0x4d8:   	xor	%o5, 0x8da, %o0
	.word	0x96d5800b	! t1_kref+0x4dc:   	umulcc	%l6, %o3, %o3
	.word	0x36800002	! t1_kref+0x4e0:   	bge,a	_kref+0x4e8
	.word	0xaa468016	! t1_kref+0x4e4:   	addc	%i2, %l6, %l5
	.word	0x37800005	! t1_kref+0x4e8:   	fbge,a	_kref+0x4fc
	.word	0xd816c019	! t1_kref+0x4ec:   	lduh	[%i3 + %i1], %o4
	.word	0xaeba7af9	! t1_kref+0x4f0:   	xnorcc	%o1, -0x507, %l7
	.word	0xe2e81018	! t1_kref+0x4f4:   	ldstuba	[%g0 + %i0]0x80, %l1
	.word	0x95b00fc0	! t1_kref+0x4f8:   	fone	%f10
	.word	0xa8fec00b	! t1_kref+0x4fc:   	sdivcc	%i3, %o3, %l4
	.word	0xd420a024	! t1_kref+0x500:   	st	%o2, [%g2 + 0x24]
	.word	0xc9070018	! t1_kref+0x504:   	ld	[%i4 + %i0], %f4
	.word	0x921d6c41	! t1_kref+0x508:   	xor	%l5, 0xc41, %o1
	.word	0xafa01082	! t1_kref+0x50c:   	fxtos	%f2, %f23
	.word	0x99a01939	! t1_kref+0x510:   	fstod	%f25, %f12
	.word	0x90b4ef30	! t1_kref+0x514:   	orncc	%l3, 0xf30, %o0
	.word	0xb1a288cc	! t1_kref+0x518:   	fsubd	%f10, %f12, %f24
	.word	0x2f2f5340	! t1_kref+0x51c:   	sethi	%hi(0xbd4d0000), %l7
	.word	0xa8a57a10	! t1_kref+0x520:   	subcc	%l5, -0x5f0, %l4
	.word	0xee86101c	! t1_kref+0x524:   	lda	[%i0 + %i4]0x80, %l7
	.word	0xa6d6c00b	! t1_kref+0x528:   	umulcc	%i3, %o3, %l3
	.word	0xf5ee501b	! t1_kref+0x52c:   	prefetcha	%i1 + %i3, 26
	.word	0xaea2628d	! t1_kref+0x530:   	subcc	%o1, 0x28d, %l7
	.word	0x8da20842	! t1_kref+0x534:   	faddd	%f8, %f2, %f6
	.word	0x86102003	! t1_kref+0x538:   	mov	0x3, %g3
	.word	0x32800000	! t1_kref+0x53c:   	bne,a	_kref+0x53c
	.word	0x86a0e001	! t1_kref+0x540:   	subcc	%g3, 1, %g3
	.word	0xec7e401c	! t1_kref+0x544:   	swap	[%i1 + %i4], %l6
	.word	0x86102004	! t1_kref+0x548:   	mov	0x4, %g3
	.word	0x32800000	! t1_kref+0x54c:   	bne,a	_kref+0x54c
	.word	0x86a0e001	! t1_kref+0x550:   	subcc	%g3, 1, %g3
	.word	0xaed34000	! t1_kref+0x554:   	umulcc	%o5, %g0, %l7
	.word	0x96180013	! t1_kref+0x558:   	xor	%g0, %l3, %o3
	.word	0xe3b8a100	! t1_kref+0x55c:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0x9da01050	! t1_kref+0x560:   	fdtox	%f16, %f14
	.word	0x93b007b2	! t1_kref+0x564:   	fpackfix	%f18, %f9
	.word	0x3c480001	! t1_kref+0x568:   	bpos,a,pt	%icc, _kref+0x56c
	.word	0x89a00029	! t1_kref+0x56c:   	fmovs	%f9, %f4
	.word	0xe91fbdc0	! t1_kref+0x570:   	ldd	[%fp - 0x240], %f20
	.word	0x9536a013	! t1_kref+0x574:   	srl	%i2, 0x13, %o2
	.word	0xec7e6000	! t1_kref+0x578:   	swap	[%i1], %l6
	sethi	%hi(2f), %o7
	.word	0xe40be19c	! t1_kref+0x580:   	ldub	[%o7 + 0x19c], %l2
	.word	0xa41ca00c	! t1_kref+0x584:   	xor	%l2, 0xc, %l2
	.word	0xe42be19c	! t1_kref+0x588:   	stb	%l2, [%o7 + 0x19c]
	.word	0x81dbe19c	! t1_kref+0x58c:   	flush	%o7 + 0x19c
	.word	0x89a01a4e	! t1_kref+0x590:   	fdtoi	%f14, %f4
	.word	0x8fa00524	! t1_kref+0x594:   	fsqrts	%f4, %f7
	.word	0xef68a008	! t1_kref+0x598:   	prefetch	%g2 + 8, 23
2:	.word	0xafb1ca62	! t1_kref+0x59c:   	fpadd32s	%f7, %f2, %f23
	.word	0xa5a00025	! t1_kref+0x5a0:   	fmovs	%f5, %f18
	.word	0x22800008	! t1_kref+0x5a4:   	be,a	_kref+0x5c4
	.word	0x991d3795	! t1_kref+0x5a8:   	tsubcctv	%l4, -0x86b, %o4
	.word	0x94db78fc	! t1_kref+0x5ac:   	smulcc	%o5, -0x704, %o2
	.word	0x31480003	! t1_kref+0x5b0:   	fba,a,pt	%fcc0, _kref+0x5bc
	.word	0x95b586f4	! t1_kref+0x5b4:   	fmul8ulx16	%f22, %f20, %f10
	.word	0xd4470018	! t1_kref+0x5b8:   	ldsw	[%i4 + %i0], %o2
	.word	0xa61a7050	! t1_kref+0x5bc:   	xor	%o1, -0xfb0, %l3
	.word	0xaba018d4	! t1_kref+0x5c0:   	fdtos	%f20, %f21
	.word	0xa1a018ca	! t1_kref+0x5c4:   	fdtos	%f10, %f16
	.word	0xec763ff8	! t1_kref+0x5c8:   	stx	%l6, [%i0 - 8]
	.word	0xb3a01094	! t1_kref+0x5cc:   	fxtos	%f20, %f25
	.word	0x86102002	! t1_kref+0x5d0:   	mov	0x2, %g3
	.word	0x32800000	! t1_kref+0x5d4:   	bne,a	_kref+0x5d4
	.word	0x86a0e001	! t1_kref+0x5d8:   	subcc	%g3, 1, %g3
	.word	0x99b2872b	! t1_kref+0x5dc:   	fmuld8ulx16	%f10, %f11, %f12
	.word	0xa5a01110	! t1_kref+0x5e0:   	fxtod	%f16, %f18
	.word	0xec380018	! t1_kref+0x5e4:   	std	%l6, [%g0 + %i0]
	.word	0xab26e09d	! t1_kref+0x5e8:   	mulscc	%i3, 0x9d, %l5
	.word	0xc12e001c	! t1_kref+0x5ec:   	st	%fsr, [%i0 + %i4]
	.word	0x81a90a58	! t1_kref+0x5f0:   	fcmpd	%fcc0, %f4, %f24
	.word	0xa5a01892	! t1_kref+0x5f4:   	fitos	%f18, %f18
	.word	0x81ab0ad2	! t1_kref+0x5f8:   	fcmped	%fcc0, %f12, %f18
	.word	0x22480007	! t1_kref+0x5fc:   	be,a,pt	%icc, _kref+0x618
	.word	0xa7a000ad	! t1_kref+0x600:   	fnegs	%f13, %f19
	.word	0x89b00fc0	! t1_kref+0x604:   	fone	%f4
	.word	0xaaa6c01a	! t1_kref+0x608:   	subcc	%i3, %i2, %l5
	.word	0x90a6c000	! t1_kref+0x60c:   	subcc	%i3, %g0, %o0
	.word	0x81580000	! t1_kref+0x610:   	flushw
	.word	0x8db60dd4	! t1_kref+0x614:   	fnand	%f24, %f20, %f6
	.word	0x85a01914	! t1_kref+0x618:   	fitod	%f20, %f2
	.word	0x81ad4a29	! t1_kref+0x61c:   	fcmps	%fcc0, %f21, %f9
	sethi	%hi(2f), %o7
	.word	0xe40be25c	! t1_kref+0x624:   	ldub	[%o7 + 0x25c], %l2
	.word	0xa41ca00c	! t1_kref+0x628:   	xor	%l2, 0xc, %l2
	.word	0xe42be25c	! t1_kref+0x62c:   	stb	%l2, [%o7 + 0x25c]
	.word	0x81dbe25c	! t1_kref+0x630:   	flush	%o7 + 0x25c
	.word	0x85a409ce	! t1_kref+0x634:   	fdivd	%f16, %f14, %f2
	.word	0xaad6c009	! t1_kref+0x638:   	umulcc	%i3, %o1, %l5
	.word	0x961e800a	! t1_kref+0x63c:   	xor	%i2, %o2, %o3
	.word	0x2d480006	! t1_kref+0x640:   	fbg,a,pt	%fcc0, _kref+0x658
	.word	0x2d2b588f	! t1_kref+0x644:   	sethi	%hi(0xad623c00), %l6
	.word	0xafb68128	! t1_kref+0x648:   	edge32n	%i2, %o0, %l7
	.word	0xa67ebe0e	! t1_kref+0x64c:   	sdiv	%i2, -0x1f2, %l3
	.word	0xaac5a2d0	! t1_kref+0x650:   	addccc	%l6, 0x2d0, %l5
	.word	0xc51f4019	! t1_kref+0x654:   	ldd	[%i5 + %i1], %f2
	.word	0xb1b00a0a	! t1_kref+0x658:   	fpadd16	%f0, %f10, %f24
2:	.word	0x85b58d60	! t1_kref+0x65c:   	fnot1s	%f22, %f2
	.word	0x31800002	! t1_kref+0x660:   	fba,a	_kref+0x668
	.word	0xe60e8018	! t1_kref+0x664:   	ldub	[%i2 + %i0], %l3
	.word	0xa882a2be	! t1_kref+0x668:   	addcc	%o2, 0x2be, %l4
	.word	0x90aa4013	! t1_kref+0x66c:   	andncc	%o1, %l3, %o0
	.word	0xa5b00c20	! t1_kref+0x670:   	fzeros	%f18
	.word	0xa8b5001b	! t1_kref+0x674:   	orncc	%l4, %i3, %l4
	.word	0x92c568a0	! t1_kref+0x678:   	addccc	%l5, 0x8a0, %o1
	.word	0x97b484c4	! t1_kref+0x67c:   	fcmpne32	%f18, %f4, %o3
	.word	0xe408646c	! t1_kref+0x680:   	ldub	[%g1 + 0x46c], %l2
	.word	0xa41ca00c	! t1_kref+0x684:   	xor	%l2, 0xc, %l2
	.word	0xe428646c	! t1_kref+0x688:   	stb	%l2, [%g1 + 0x46c]
	.word	0x81d8646c	! t1_kref+0x68c:   	flush	%g1 + 0x46c
	.word	0xe828a01e	! t1_kref+0x690:   	stb	%l4, [%g2 + 0x1e]
	.word	0xc1beda58	! t1_kref+0x694:   	stda	%f0, [%i3 + %i0]0xd2
	.word	0xec48a00e	! t1_kref+0x698:   	ldsb	[%g2 + 0xe], %l6
	.word	0xa5b387d0	! t1_kref+0x69c:   	pdist	%f14, %f16, %f18
2:	.word	0xacb2000c	! t1_kref+0x6a0:   	orncc	%o0, %o4, %l6
	.word	0x93b00778	! t1_kref+0x6a4:   	fpack16	%f24, %f9
	.word	0x27480007	! t1_kref+0x6a8:   	fbul,a,pt	%fcc0, _kref+0x6c4
	.word	0x8fa209a2	! t1_kref+0x6ac:   	fdivs	%f8, %f2, %f7
	.word	0x83a00022	! t1_kref+0x6b0:   	fmovs	%f2, %f1
	.word	0xaabdc015	! t1_kref+0x6b4:   	xnorcc	%l7, %l5, %l5
	.word	0x9fa0c823	! t1_kref+0x6b8:   	fadds	%f3, %f3, %f15
	.word	0xa8fd6756	! t1_kref+0x6bc:   	sdivcc	%l5, 0x756, %l4
	.word	0xd03e2000	! t1_kref+0x6c0:   	std	%o0, [%i0]
	sethi	%hi(1f), %o7
	jmpl	%o7+%lo(1f), %g1
	.empty
	.word	0xe3b8a100	! t1_kref+0x6cc:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0x3a800001	! t1_kref+0x6d0:   	bcc,a	_kref+0x6d4
1:	.word	0x90956bc6	! t1_kref+0x6d4:   	orcc	%l5, 0xbc6, %o0
	.word	0xee7e0000	! t1_kref+0x6d8:   	swap	[%i0], %l7
	.word	0x8582800d	! t1_kref+0x6dc:   	wr	%o2, %o5, %ccr
	.word	0x90a26297	! t1_kref+0x6e0:   	subcc	%o1, 0x297, %o0
	.word	0x9ba4093a	! t1_kref+0x6e4:   	fmuls	%f16, %f26, %f13
	.word	0x81aa8a5a	! t1_kref+0x6e8:   	fcmpd	%fcc0, %f10, %f26
	.word	0xaea2c016	! t1_kref+0x6ec:   	subcc	%o3, %l6, %l7
	.word	0xae2a800d	! t1_kref+0x6f0:   	andn	%o2, %o5, %l7
	.word	0x93a01890	! t1_kref+0x6f4:   	fitos	%f16, %f9
	.word	0xaed36da7	! t1_kref+0x6f8:   	umulcc	%o5, 0xda7, %l7
	.word	0xb5a01a54	! t1_kref+0x6fc:   	fdtoi	%f20, %f26
	.word	0x98dd4015	! t1_kref+0x700:   	smulcc	%l5, %l5, %o4
	.word	0x81ddc004	! t1_kref+0x704:   	flush	%l7 + %g4
	.word	0x3e800001	! t1_kref+0x708:   	bvc,a	_kref+0x70c
	.word	0xa6b80008	! t1_kref+0x70c:   	xnorcc	%g0, %o0, %l3
	.word	0x23800005	! t1_kref+0x710:   	fbne,a	_kref+0x724
	.word	0xa1b009af	! t1_kref+0x714:   	fexpand	%f15, %f16
	.word	0xe13e0000	! t1_kref+0x718:   	std	%f16, [%i0]
	.word	0x33800002	! t1_kref+0x71c:   	fbe,a	_kref+0x724
	.word	0xe3b8a100	! t1_kref+0x720:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0x981d801b	! t1_kref+0x724:   	xor	%l6, %i3, %o4
	.word	0x9db60f90	! t1_kref+0x728:   	for	%f24, %f16, %f14
	.word	0xc568a007	! t1_kref+0x72c:   	prefetch	%g2 + 7, 2
	.word	0xee0e8018	! t1_kref+0x730:   	ldub	[%i2 + %i0], %l7
	.word	0xe81f4019	! t1_kref+0x734:   	ldd	[%i5 + %i1], %l4
	.word	0xcb067ffc	! t1_kref+0x738:   	ld	[%i1 - 4], %f5
	.word	0x87a01893	! t1_kref+0x73c:   	fitos	%f19, %f3
	.word	0x81ad0a50	! t1_kref+0x740:   	fcmpd	%fcc0, %f20, %f16
	.word	0x9ba01a52	! t1_kref+0x744:   	fdtoi	%f18, %f13
	.word	0x89a0102f	! t1_kref+0x748:   	fstox	%f15, %f4
	.word	0x94968013	! t1_kref+0x74c:   	orcc	%i2, %l3, %o2
	.word	0x94c34013	! t1_kref+0x750:   	addccc	%o5, %l3, %o2
	.word	0x81acca35	! t1_kref+0x754:   	fcmps	%fcc0, %f19, %f21
	.word	0xf620a004	! t1_kref+0x758:   	st	%i3, [%g2 + 4]
	.word	0x81a90a54	! t1_kref+0x75c:   	fcmpd	%fcc0, %f4, %f20
	.word	0xdd062008	! t1_kref+0x760:   	ld	[%i0 + 8], %f14
	.word	0x87b44e6e	! t1_kref+0x764:   	fxnors	%f17, %f14, %f3
	.word	0xa6a5a778	! t1_kref+0x768:   	subcc	%l6, 0x778, %l3
	.word	0xa8f50008	! t1_kref+0x76c:   	udivcc	%l4, %o0, %l4
	.word	0x8ba6482b	! t1_kref+0x770:   	fadds	%f25, %f11, %f5
	.word	0x93b00c20	! t1_kref+0x774:   	fzeros	%f9
	.word	0x81abca26	! t1_kref+0x778:   	fcmps	%fcc0, %f15, %f6
	.word	0xa6bb4017	! t1_kref+0x77c:   	xnorcc	%o5, %l7, %l3
	.word	0xc1be184a	! t1_kref+0x780:   	stda	%f0, [%i0 + %o2]0xc2
	.word	0x99b4c175	! t1_kref+0x784:   	edge32ln	%l3, %l5, %o4
	.word	0xa88dee91	! t1_kref+0x788:   	andcc	%l7, 0xe91, %l4
	.word	0x91418000	! t1_kref+0x78c:   	mov	%fprs, %o0
	.word	0xafa0188e	! t1_kref+0x790:   	fitos	%f14, %f23
	.word	0xa9b68ecc	! t1_kref+0x794:   	fornot2	%f26, %f12, %f20
	.word	0x947a401a	! t1_kref+0x798:   	sdiv	%o1, %i2, %o2
	.word	0xaf2de012	! t1_kref+0x79c:   	sll	%l7, 0x12, %l7
	.word	0x8da0002d	! t1_kref+0x7a0:   	fmovs	%f13, %f6
	.word	0x99b34cb3	! t1_kref+0x7a4:   	fandnot2s	%f13, %f19, %f12
	.word	0x89a01924	! t1_kref+0x7a8:   	fstod	%f4, %f4
	.word	0x86102016	! t1_kref+0x7ac:   	mov	0x16, %g3
	.word	0x86a0e001	! t1_kref+0x7b0:   	subcc	%g3, 1, %g3
	.word	0x22800014	! t1_kref+0x7b4:   	be,a	_kref+0x804
	.word	0xd1be1814	! t1_kref+0x7b8:   	stda	%f8, [%i0 + %l4]0xc0
	.word	0xf11fbe18	! t1_kref+0x7bc:   	ldd	[%fp - 0x1e8], %f24
	.word	0x92a6f11a	! t1_kref+0x7c0:   	subcc	%i3, -0xee6, %o1
	.word	0xafa0053a	! t1_kref+0x7c4:   	fsqrts	%f26, %f23
	.word	0x98fec016	! t1_kref+0x7c8:   	sdivcc	%i3, %l6, %o4
	.word	0xea20a014	! t1_kref+0x7cc:   	st	%l5, [%g2 + 0x14]
	.word	0x95b5414c	! t1_kref+0x7d0:   	edge32l	%l5, %o4, %o2
	.word	0xa5a00538	! t1_kref+0x7d4:   	fsqrts	%f24, %f18
	.word	0xacb5001b	! t1_kref+0x7d8:   	orncc	%l4, %i3, %l6
	.word	0xd926001c	! t1_kref+0x7dc:   	st	%f12, [%i0 + %i4]
	.word	0xec180018	! t1_kref+0x7e0:   	ldd	[%g0 + %i0], %l6
	.word	0xe62e4000	! t1_kref+0x7e4:   	stb	%l3, [%i1]
	.word	0xa1b00fc0	! t1_kref+0x7e8:   	fone	%f16
	.word	0x83b38db2	! t1_kref+0x7ec:   	fxors	%f14, %f18, %f1
	.word	0xd500001c	! t1_kref+0x7f0:   	ld	[%g0 + %i4], %f10
	.word	0x83a549ac	! t1_kref+0x7f4:   	fdivs	%f21, %f12, %f1
	.word	0x92aee8d2	! t1_kref+0x7f8:   	andncc	%i3, 0x8d2, %o1
	.word	0xafa00526	! t1_kref+0x7fc:   	fsqrts	%f6, %f23
	.word	0xa882c015	! t1_kref+0x800:   	addcc	%o3, %l5, %l4
	.word	0xd2901018	! t1_kref+0x804:   	lduha	[%g0 + %i0]0x80, %o1
	.word	0xb1b00cc4	! t1_kref+0x808:   	fnot2	%f4, %f24
	.word	0xd83e6000	! t1_kref+0x80c:   	std	%o4, [%i1]
	.word	0xa885400a	! t1_kref+0x810:   	addcc	%l5, %o2, %l4
	.word	0xac9d4000	! t1_kref+0x814:   	xorcc	%l5, %g0, %l6
	.word	0xed68a088	! t1_kref+0x818:   	prefetch	%g2 + 0x88, 22
	.word	0xb5b10f7a	! t1_kref+0x81c:   	fornot1s	%f4, %f26, %f26
	.word	0x30480001	! t1_kref+0x820:   	ba,a,pt	%icc, _kref+0x824
	.word	0x8d803e17	! t1_kref+0x824:   	mov	0xfffffe17, %fprs
	.word	0x81a90a38	! t1_kref+0x828:   	fcmps	%fcc0, %f4, %f24
	.word	0x98d2fb6f	! t1_kref+0x82c:   	umulcc	%o3, -0x491, %o4
	.word	0xe6567ff6	! t1_kref+0x830:   	ldsh	[%i1 - 0xa], %l3
	call	SYM(t1_subr2)
	.word	0x89aac058	! t1_kref+0x838:   	fmovdge	%fcc0, %f24, %f4
	.word	0xacdec009	! t1_kref+0x83c:   	smulcc	%i3, %o1, %l6
	.word	0x81a88a58	! t1_kref+0x840:   	fcmpd	%fcc0, %f2, %f24
	.word	0x99a38856	! t1_kref+0x844:   	faddd	%f14, %f22, %f12
	.word	0x9344c000	! t1_kref+0x848:   	mov	%gsr, %o1
	.word	0x8db30dc6	! t1_kref+0x84c:   	fnand	%f12, %f6, %f6
	.word	0x8143c000	! t1_kref+0x850:   	stbar
	.word	0x99b20486	! t1_kref+0x854:   	fcmple32	%f8, %f6, %o4
	.word	0x96a37e86	! t1_kref+0x858:   	subcc	%o5, -0x17a, %o3
	.word	0x81a80ac8	! t1_kref+0x85c:   	fcmped	%fcc0, %f0, %f8
	.word	0xe81e2010	! t1_kref+0x860:   	ldd	[%i0 + 0x10], %l4
	.word	0xb3a3492e	! t1_kref+0x864:   	fmuls	%f13, %f14, %f25
	.word	0xee166006	! t1_kref+0x868:   	lduh	[%i1 + 6], %l7
	.word	0xa8aebaf4	! t1_kref+0x86c:   	andncc	%i2, -0x50c, %l4
	.word	0x97a00034	! t1_kref+0x870:   	fmovs	%f20, %f11
	.word	0xe968a0c1	! t1_kref+0x874:   	prefetch	%g2 + 0xc1, 20
	.word	0x113dc055	! t1_kref+0x878:   	sethi	%hi(0xf7015400), %o0
	.word	0x26800003	! t1_kref+0x87c:   	bl,a	_kref+0x888
	.word	0xb5a58825	! t1_kref+0x880:   	fadds	%f22, %f5, %f26
	.word	0x81a88ab5	! t1_kref+0x884:   	fcmpes	%fcc0, %f2, %f21
	.word	0xa7408000	! t1_kref+0x888:   	mov	%ccr, %l3
	.word	0xa654e930	! t1_kref+0x88c:   	umul	%l3, 0x930, %l3
	.word	0x81a98ac8	! t1_kref+0x890:   	fcmped	%fcc0, %f6, %f8
	.word	0x81aa0a25	! t1_kref+0x894:   	fcmps	%fcc0, %f8, %f5
	.word	0x95b30129	! t1_kref+0x898:   	edge32n	%o4, %o1, %o2
	.word	0xa1b58a86	! t1_kref+0x89c:   	fpsub16	%f22, %f6, %f16
	.word	0x96a53e10	! t1_kref+0x8a0:   	subcc	%l4, -0x1f0, %o3
	.word	0x86102003	! t1_kref+0x8a4:   	mov	0x3, %g3
	.word	0x32800000	! t1_kref+0x8a8:   	bne,a	_kref+0x8a8
	.word	0x86a0e001	! t1_kref+0x8ac:   	subcc	%g3, 1, %g3
	.word	0x95a01919	! t1_kref+0x8b0:   	fitod	%f25, %f10
	.word	0xe3b8a100	! t1_kref+0x8b4:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0xf428a02f	! t1_kref+0x8b8:   	stb	%i2, [%g2 + 0x2f]
	.word	0xafa018d6	! t1_kref+0x8bc:   	fdtos	%f22, %f23
	.word	0xd9be1894	! t1_kref+0x8c0:   	stda	%f12, [%i0 + %l4]0xc4
	.word	0xc398a0c0	! t1_kref+0x8c4:   	ldda	[%g2 + 0xc0]%asi, %f32
	.word	0xa69ee1e6	! t1_kref+0x8c8:   	xorcc	%i3, 0x1e6, %l3
	.word	0xa9b00cd0	! t1_kref+0x8cc:   	fnot2	%f16, %f20
	.word	0x81ac0a25	! t1_kref+0x8d0:   	fcmps	%fcc0, %f16, %f5
	.word	0xea2e600b	! t1_kref+0x8d4:   	stb	%l5, [%i1 + 0xb]
	.word	0x85b00f10	! t1_kref+0x8d8:   	fsrc2	%f16, %f2
	.word	0xe81e6008	! t1_kref+0x8dc:   	ldd	[%i1 + 8], %l4
	.word	0xc0ee9019	! t1_kref+0x8e0:   	ldstuba	[%i2 + %i1]0x80, %g0
	.word	0xb1a20958	! t1_kref+0x8e4:   	fmuld	%f8, %f24, %f24
	.word	0xed000019	! t1_kref+0x8e8:   	ld	[%g0 + %i1], %f22
	.word	0xaa330008	! t1_kref+0x8ec:   	orn	%o4, %o0, %l5
	.word	0xd2d6501b	! t1_kref+0x8f0:   	ldsha	[%i1 + %i3]0x80, %o1
	.word	0xe3b8a100	! t1_kref+0x8f4:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0xd886101c	! t1_kref+0x8f8:   	lda	[%i0 + %i4]0x80, %o4
	.word	0xae92f891	! t1_kref+0x8fc:   	orcc	%o3, -0x76f, %l7
	.word	0xaa003336	! t1_kref+0x900:   	add	%g0, -0xcca, %l5
	.word	0xc568a0c2	! t1_kref+0x904:   	prefetch	%g2 + 0xc2, 2
	.word	0x96200000	! t1_kref+0x908:   	neg	%g0, %o3
	.word	0x8143c000	! t1_kref+0x90c:   	stbar
	.word	0x89a00537	! t1_kref+0x910:   	fsqrts	%f23, %f4
	.word	0x81a90aa8	! t1_kref+0x914:   	fcmpes	%fcc0, %f4, %f8
	.word	0x30800004	! t1_kref+0x918:   	ba,a	_kref+0x928
	.word	0xec28a03d	! t1_kref+0x91c:   	stb	%l6, [%g2 + 0x3d]
	.word	0x81a80a42	! t1_kref+0x920:   	fcmpd	%fcc0, %f0, %f2
	.word	0xa8102ccd	! t1_kref+0x924:   	mov	0xccd, %l4
	.word	0xa9a00037	! t1_kref+0x928:   	fmovs	%f23, %f20
	.word	0xe5070019	! t1_kref+0x92c:   	ld	[%i4 + %i1], %f18
	.word	0x81dd4015	! t1_kref+0x930:   	flush	%l5 + %l5
	.word	0x31800003	! t1_kref+0x934:   	fba,a	_kref+0x940
	.word	0xa866800a	! t1_kref+0x938:   	subc	%i2, %o2, %l4
	.word	0x8da000b5	! t1_kref+0x93c:   	fnegs	%f21, %f6
	.word	0x99a48d21	! t1_kref+0x940:   	fsmuld	%f18, %f1, %f12
	.word	0x93408000	! t1_kref+0x944:   	mov	%ccr, %o1
	.word	0x8fb007ae	! t1_kref+0x948:   	fpackfix	%f14, %f7
	.word	0x9485800b	! t1_kref+0x94c:   	addcc	%l6, %o3, %o2
	.word	0x89a01a52	! t1_kref+0x950:   	fdtoi	%f18, %f4
	.word	0xa5b58d0e	! t1_kref+0x954:   	fandnot1	%f22, %f14, %f18
	.word	0x9de3bfa0	! t1_kref+0x958:   	save	%sp, -0x60, %sp
	.word	0x808e401b	! t1_kref+0x95c:   	btst	%i3, %i1
	.word	0x99ef001d	! t1_kref+0x960:   	restore	%i4, %i5, %o4
	.word	0xa6802b60	! t1_kref+0x964:   	addcc	%g0, 0xb60, %l3
	.word	0xe8780018	! t1_kref+0x968:   	swap	[%g0 + %i0], %l4
	.word	0x89a01921	! t1_kref+0x96c:   	fstod	%f1, %f4
	.word	0xaa15202b	! t1_kref+0x970:   	or	%l4, 0x2b, %l5
	.word	0x2a480006	! t1_kref+0x974:   	bcs,a,pt	%icc, _kref+0x98c
	.word	0x81580000	! t1_kref+0x978:   	flushw
	.word	0xaef32920	! t1_kref+0x97c:   	udivcc	%o4, 0x920, %l7
	.word	0x9885801a	! t1_kref+0x980:   	addcc	%l6, %i2, %o4
	.word	0xc9be5889	! t1_kref+0x984:   	stda	%f4, [%i1 + %o1]0xc4
	.word	0xa664e104	! t1_kref+0x988:   	subc	%l3, 0x104, %l3
	.word	0x9805feb6	! t1_kref+0x98c:   	add	%l7, -0x14a, %o4
	.word	0xa9b307d0	! t1_kref+0x990:   	pdist	%f12, %f16, %f20
	.word	0x81ad8a52	! t1_kref+0x994:   	fcmpd	%fcc0, %f22, %f18
	.word	0x9034c00d	! t1_kref+0x998:   	orn	%l3, %o5, %o0
	.word	0x152dbe2b	! t1_kref+0x99c:   	sethi	%hi(0xb6f8ac00), %o2
	.word	0xea0e4000	! t1_kref+0x9a0:   	ldub	[%i1], %l5
	.word	0xaa303677	! t1_kref+0x9a4:   	orn	%g0, -0x989, %l5
	.word	0x9835b84c	! t1_kref+0x9a8:   	orn	%l6, -0x7b4, %o4
	.word	0x9255c008	! t1_kref+0x9ac:   	umul	%l7, %o0, %o1
	.word	0xee162012	! t1_kref+0x9b0:   	lduh	[%i0 + 0x12], %l7
	.word	0xa6ba001a	! t1_kref+0x9b4:   	xnorcc	%o0, %i2, %l3
	.word	0x9da0190c	! t1_kref+0x9b8:   	fitod	%f12, %f14
	.word	0xe8180019	! t1_kref+0x9bc:   	ldd	[%g0 + %i1], %l4
	.word	0x92f5bd7b	! t1_kref+0x9c0:   	udivcc	%l6, -0x285, %o1
	.word	0xa91b0000	! t1_kref+0x9c4:   	tsubcctv	%o4, %g0, %l4
	.word	0x2b800008	! t1_kref+0x9c8:   	fbug,a	_kref+0x9e8
	.word	0xd230a004	! t1_kref+0x9cc:   	sth	%o1, [%g2 + 4]
	.word	0x93a01899	! t1_kref+0x9d0:   	fitos	%f25, %f9
	.word	0x34800005	! t1_kref+0x9d4:   	bg,a	_kref+0x9e8
	.word	0xd0564000	! t1_kref+0x9d8:   	ldsh	[%i1], %o0
	.word	0xda7e3fe8	! t1_kref+0x9dc:   	swap	[%i0 - 0x18], %o5
	.word	0x31480005	! t1_kref+0x9e0:   	fba,a,pt	%fcc0, _kref+0x9f4
	.word	0xe8162010	! t1_kref+0x9e4:   	lduh	[%i0 + 0x10], %l4
	.word	0x81ac8aa8	! t1_kref+0x9e8:   	fcmpes	%fcc0, %f18, %f8
	.word	0x9805a5a5	! t1_kref+0x9ec:   	add	%l6, 0x5a5, %o4
	.word	0xb3a649a7	! t1_kref+0x9f0:   	fdivs	%f25, %f7, %f25
	.word	0xe1000018	! t1_kref+0x9f4:   	ld	[%g0 + %i0], %f16
	.word	0x9086fd6d	! t1_kref+0x9f8:   	addcc	%i3, -0x293, %o0
	.word	0xe4680018	! t1_kref+0x9fc:   	ldstub	[%g0 + %i0], %l2
	.word	0xe3b8a100	! t1_kref+0xa00:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0xec566002	! t1_kref+0xa04:   	ldsh	[%i1 + 2], %l6
	.word	0x9162a7f2	! t1_kref+0xa08:   	movue	%fcc0, -0xe, %o0
	.word	0x99b28f52	! t1_kref+0xa0c:   	fornot1	%f10, %f18, %f12
	.word	0x970ae077	! t1_kref+0xa10:   	tsubcc	%o3, 0x77, %o3
	.word	0xe1bf5a58	! t1_kref+0xa14:   	stda	%f16, [%i5 + %i0]0xd2
	.word	0xd62e001a	! t1_kref+0xa18:   	stb	%o3, [%i0 + %i2]
	.word	0x9452400a	! t1_kref+0xa1c:   	umul	%o1, %o2, %o2
	.word	0x2b22e883	! t1_kref+0xa20:   	sethi	%hi(0x8ba20c00), %l5
	.word	0xd028a007	! t1_kref+0xa24:   	stb	%o0, [%g2 + 7]
	.word	0x8db28ad2	! t1_kref+0xa28:   	fpsub32	%f10, %f18, %f6
	.word	0x9845f132	! t1_kref+0xa2c:   	addc	%l7, -0xece, %o4
	.word	0x28800002	! t1_kref+0xa30:   	bleu,a	_kref+0xa38
	.word	0xaa7eb1e3	! t1_kref+0xa34:   	sdiv	%i2, -0xe1d, %l5
	.word	0xaebd4014	! t1_kref+0xa38:   	xnorcc	%l5, %l4, %l7
	.word	0xc12e001c	! t1_kref+0xa3c:   	st	%fsr, [%i0 + %i4]
	.word	0xa6b4c017	! t1_kref+0xa40:   	orncc	%l3, %l7, %l3
	.word	0xa9a588d0	! t1_kref+0xa44:   	fsubd	%f22, %f16, %f20
	.word	0x8fa01896	! t1_kref+0xa48:   	fitos	%f22, %f7
	.word	0xb1a01a54	! t1_kref+0xa4c:   	fdtoi	%f20, %f24
	.word	0x8fb1cea0	! t1_kref+0xa50:   	fsrc1s	%f7, %f7
	.word	0x89a0108c	! t1_kref+0xa54:   	fxtos	%f12, %f4
	.word	0xacdafe38	! t1_kref+0xa58:   	smulcc	%o3, -0x1c8, %l6
	.word	0x9fa5c932	! t1_kref+0xa5c:   	fmuls	%f23, %f18, %f15
	.word	0xaab2b206	! t1_kref+0xa60:   	orncc	%o2, -0xdfa, %l5
	.word	0xada288d2	! t1_kref+0xa64:   	fsubd	%f10, %f18, %f22
	.word	0xab35600b	! t1_kref+0xa68:   	srl	%l5, 0xb, %l5
	.word	0x93b6c000	! t1_kref+0xa6c:   	edge8	%i3, %g0, %o1
	.word	0xae028000	! t1_kref+0xa70:   	add	%o2, %g0, %l7
	.word	0x9834f1e1	! t1_kref+0xa74:   	orn	%l3, -0xe1f, %o4
	.word	0x2f480007	! t1_kref+0xa78:   	fbu,a,pt	%fcc0, _kref+0xa94
	.word	0xe1f6501b	! t1_kref+0xa7c:   	casxa	[%i1]0x80, %i3, %l0
	.word	0x81a88a26	! t1_kref+0xa80:   	fcmps	%fcc0, %f2, %f6
	.word	0x94203267	! t1_kref+0xa84:   	sub	%g0, -0xd99, %o2
	.word	0xe03e3ff8	! t1_kref+0xa88:   	std	%l0, [%i0 - 8]
	.word	0xa9a00024	! t1_kref+0xa8c:   	fmovs	%f4, %f20
	.word	0xadb0844e	! t1_kref+0xa90:   	fcmpne16	%f2, %f14, %l6
	.word	0xe386101c	! t1_kref+0xa94:   	lda	[%i0 + %i4]0x80, %f17
	.word	0x86102004	! t1_kref+0xa98:   	mov	0x4, %g3
	.word	0x32800000	! t1_kref+0xa9c:   	bne,a	_kref+0xa9c
	.word	0x86a0e001	! t1_kref+0xaa0:   	subcc	%g3, 1, %g3
	.word	0xb5b50d84	! t1_kref+0xaa4:   	fxor	%f20, %f4, %f26
	.word	0x86102002	! t1_kref+0xaa8:   	mov	0x2, %g3
	.word	0x32800000	! t1_kref+0xaac:   	bne,a	_kref+0xaac
	.word	0x86a0e001	! t1_kref+0xab0:   	subcc	%g3, 1, %g3
	.word	0xe8871019	! t1_kref+0xab4:   	lda	[%i4 + %i1]0x80, %l4
	.word	0x969ebd5a	! t1_kref+0xab8:   	xorcc	%i2, -0x2a6, %o3
	.word	0xacf5a848	! t1_kref+0xabc:   	udivcc	%l6, 0x848, %l6
	.word	0x92c2e139	! t1_kref+0xac0:   	addccc	%o3, 0x139, %o1
	.word	0xe3b8a100	! t1_kref+0xac4:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0x97a01082	! t1_kref+0xac8:   	fxtos	%f2, %f11
	.word	0xec3e7fe0	! t1_kref+0xacc:   	std	%l6, [%i1 - 0x20]
	.word	0x9846c014	! t1_kref+0xad0:   	addc	%i3, %l4, %o4
	.word	0x81800000	! t1_kref+0xad4:   	mov	%g0, %y
	.word	0xb5a088d8	! t1_kref+0xad8:   	fsubd	%f2, %f24, %f26
	.word	0x9856ad11	! t1_kref+0xadc:   	umul	%i2, 0xd11, %o4
	.word	0x81ab0ada	! t1_kref+0xae0:   	fcmped	%fcc0, %f12, %f26
	.word	0x8143c000	! t1_kref+0xae4:   	stbar
	.word	0xe1262018	! t1_kref+0xae8:   	st	%f16, [%i0 + 0x18]
	.word	0x949df567	! t1_kref+0xaec:   	xorcc	%l7, -0xa99, %o2
	.word	0x9ba80034	! t1_kref+0xaf0:   	fmovsn	%fcc0, %f20, %f13
	.word	0xa9a18930	! t1_kref+0xaf4:   	fmuls	%f6, %f16, %f20
	.word	0xdda61000	! t1_kref+0xaf8:   	sta	%f14, [%i0]0x80
	.word	0xec380018	! t1_kref+0xafc:   	std	%l6, [%g0 + %i0]
	.word	0xad3a8016	! t1_kref+0xb00:   	sra	%o2, %l6, %l6
	.word	0x85b10c50	! t1_kref+0xb04:   	fnor	%f4, %f16, %f2
	.word	0xdb060000	! t1_kref+0xb08:   	ld	[%i0], %f13
	.word	0x97a0188f	! t1_kref+0xb0c:   	fitos	%f15, %f11
	.word	0xa9b2802d	! t1_kref+0xb10:   	edge8n	%o2, %o5, %l4
	.word	0x81ab4aa8	! t1_kref+0xb14:   	fcmpes	%fcc0, %f13, %f8
	.word	0xe3b8a100	! t1_kref+0xb18:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0xf51fbe08	! t1_kref+0xb1c:   	ldd	[%fp - 0x1f8], %f26
	.word	0x95a00523	! t1_kref+0xb20:   	fsqrts	%f3, %f10
	.word	0xab61e359	! t1_kref+0xb24:   	movu	%fcc0, 0x359, %l5
	.word	0x9fa000a1	! t1_kref+0xb28:   	fnegs	%f1, %f15
	.word	0xd51e2008	! t1_kref+0xb2c:   	ldd	[%i0 + 8], %f10
	.word	0xd93e4000	! t1_kref+0xb30:   	std	%f12, [%i1]
	.word	0xa8058015	! t1_kref+0xb34:   	add	%l6, %l5, %l4
	.word	0x8585ba4d	! t1_kref+0xb38:   	wr	%l6, 0xfffffa4d, %ccr
	.word	0xd00e8018	! t1_kref+0xb3c:   	ldub	[%i2 + %i0], %o0
	.word	0xada4c93a	! t1_kref+0xb40:   	fmuls	%f19, %f26, %f22
	.word	0x99a0014e	! t1_kref+0xb44:   	fabsd	%f14, %f12
	.word	0x97320008	! t1_kref+0xb48:   	srl	%o0, %o0, %o3
	.word	0xafa01898	! t1_kref+0xb4c:   	fitos	%f24, %f23
	.word	0xb3a01a48	! t1_kref+0xb50:   	fdtoi	%f8, %f25
	.word	0x2a800001	! t1_kref+0xb54:   	bcs,a	_kref+0xb58
	.word	0xd51fbdd8	! t1_kref+0xb58:   	ldd	[%fp - 0x228], %f10
	.word	0xadb5c108	! t1_kref+0xb5c:   	edge32	%l7, %o0, %l6
	.word	0x9da288af	! t1_kref+0xb60:   	fsubs	%f10, %f15, %f14
	.word	0xcd1f4019	! t1_kref+0xb64:   	ldd	[%i5 + %i1], %f6
	.word	0x99a01908	! t1_kref+0xb68:   	fitod	%f8, %f12
	.word	0xf51fbec8	! t1_kref+0xb6c:   	ldd	[%fp - 0x138], %f26
	.word	0x90fa290c	! t1_kref+0xb70:   	sdivcc	%o0, 0x90c, %o0
	.word	0xd0de501d	! t1_kref+0xb74:   	ldxa	[%i1 + %i5]0x80, %o0
	.word	0x36800003	! t1_kref+0xb78:   	bge,a	_kref+0xb84
	.word	0xaed6adda	! t1_kref+0xb7c:   	umulcc	%i2, 0xdda, %l7
	.word	0xaefd3ce5	! t1_kref+0xb80:   	sdivcc	%l4, -0x31b, %l7
	.word	0xe40864dc	! t1_kref+0xb84:   	ldub	[%g1 + 0x4dc], %l2
	.word	0xa41ca00c	! t1_kref+0xb88:   	xor	%l2, 0xc, %l2
	.word	0xe42864dc	! t1_kref+0xb8c:   	stb	%l2, [%g1 + 0x4dc]
	.word	0x81d864dc	! t1_kref+0xb90:   	flush	%g1 + 0x4dc
	.word	0xaac2801a	! t1_kref+0xb94:   	addccc	%o2, %i2, %l5
	.word	0xada01889	! t1_kref+0xb98:   	fitos	%f9, %f22
	.word	0xa69a6017	! t1_kref+0xb9c:   	xorcc	%o1, 0x17, %l3
	.word	0xe11fbc28	! t1_kref+0xba0:   	ldd	[%fp - 0x3d8], %f16
2:	.word	0xd820a00c	! t1_kref+0xba4:   	st	%o4, [%g2 + 0xc]
	.word	0x94a56d9b	! t1_kref+0xba8:   	subcc	%l5, 0xd9b, %o2
	.word	0xaef53a0f	! t1_kref+0xbac:   	udivcc	%l4, -0x5f1, %l7
	.word	0xe87e7ff8	! t1_kref+0xbb0:   	swap	[%i1 - 8], %l4
	.word	0xa9b1cf66	! t1_kref+0xbb4:   	fornot1s	%f7, %f6, %f20
	.word	0xa73aa012	! t1_kref+0xbb8:   	sra	%o2, 0x12, %l3
	.word	0x81ac0a2e	! t1_kref+0xbbc:   	fcmps	%fcc0, %f16, %f14
	.word	0xd8780018	! t1_kref+0xbc0:   	swap	[%g0 + %i0], %o4
	.word	0xe7ee501c	! t1_kref+0xbc4:   	prefetcha	%i1 + %i4, 19
	.word	0xaa65ef0e	! t1_kref+0xbc8:   	subc	%l7, 0xf0e, %l5
	.word	0xe47e401c	! t1_kref+0xbcc:   	swap	[%i1 + %i4], %l2
	.word	0x85a01a52	! t1_kref+0xbd0:   	fdtoi	%f18, %f2
	.word	0x98b5c00d	! t1_kref+0xbd4:   	orncc	%l7, %o5, %o4
	.word	0x81ad8aa4	! t1_kref+0xbd8:   	fcmpes	%fcc0, %f22, %f4
	.word	0x8db00fc0	! t1_kref+0xbdc:   	fone	%f6
	.word	0x94053286	! t1_kref+0xbe0:   	add	%l4, -0xd7a, %o2
	.word	0x3b800001	! t1_kref+0xbe4:   	fble,a	_kref+0xbe8
	.word	0x95b24240	! t1_kref+0xbe8:   	array16	%o1, %g0, %o2
	.word	0x96e2000d	! t1_kref+0xbec:   	subccc	%o0, %o5, %o3
	.word	0x9825c014	! t1_kref+0xbf0:   	sub	%l7, %l4, %o4
	.word	0x36480005	! t1_kref+0xbf4:   	bge,a,pt	%icc, _kref+0xc08
	.word	0xec380018	! t1_kref+0xbf8:   	std	%l6, [%g0 + %i0]
	.word	0x99a01a52	! t1_kref+0xbfc:   	fdtoi	%f18, %f12
	.word	0xee20a03c	! t1_kref+0xc00:   	st	%l7, [%g2 + 0x3c]
	.word	0xae1d6d3c	! t1_kref+0xc04:   	xor	%l5, 0xd3c, %l7
	.word	0xecc65000	! t1_kref+0xc08:   	ldswa	[%i1]0x80, %l6
	.word	0xec567ff2	! t1_kref+0xc0c:   	ldsh	[%i1 - 0xe], %l6
	.word	0xed1fbce8	! t1_kref+0xc10:   	ldd	[%fp - 0x318], %f22
	.word	0xa6ab60f6	! t1_kref+0xc14:   	andncc	%o5, 0xf6, %l3
	.word	0x92330009	! t1_kref+0xc18:   	orn	%o4, %o1, %o1
	.word	0x99b68149	! t1_kref+0xc1c:   	edge32l	%i2, %o1, %o4
	.word	0x2a800002	! t1_kref+0xc20:   	bcs,a	_kref+0xc28
	.word	0x93b28200	! t1_kref+0xc24:   	array8	%o2, %g0, %o1
	.word	0x95b58353	! t1_kref+0xc28:   	alignaddrl	%l6, %l3, %o2
	.word	0xcb067fe4	! t1_kref+0xc2c:   	ld	[%i1 - 0x1c], %f5
	.word	0xa3b00774	! t1_kref+0xc30:   	fpack16	%f20, %f17
	.word	0x93a0189a	! t1_kref+0xc34:   	fitos	%f26, %f9
	.word	0xe1266014	! t1_kref+0xc38:   	st	%f16, [%i1 + 0x14]
	.word	0xc12e401c	! t1_kref+0xc3c:   	st	%fsr, [%i1 + %i4]
	.word	0x81830000	! t1_kref+0xc40:   	wr	%o4, %g0, %y
	.word	0x37800001	! t1_kref+0xc44:   	fbge,a	_kref+0xc48
	.word	0x97a018ca	! t1_kref+0xc48:   	fdtos	%f10, %f11
	.word	0xa81d4013	! t1_kref+0xc4c:   	xor	%l5, %l3, %l4
	.word	0x81a508c6	! t1_kref+0xc50:   	fsubd	%f20, %f6, %f0
	.word	0x99a0002d	! t1_kref+0xc54:   	fmovs	%f13, %f12
	.word	0xd8164000	! t1_kref+0xc58:   	lduh	[%i1], %o4
	.word	0x9925a9c6	! t1_kref+0xc5c:   	mulscc	%l6, 0x9c6, %o4
	.word	0x91a489d8	! t1_kref+0xc60:   	fdivd	%f18, %f24, %f8
	.word	0xe3b8a100	! t1_kref+0xc64:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0xe3b8a100	! t1_kref+0xc68:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0x8143e038	! t1_kref+0xc6c:   	membar	0x38
	.word	0xe82e6017	! t1_kref+0xc70:   	stb	%l4, [%i1 + 0x17]
	.word	0x81ad8aa8	! t1_kref+0xc74:   	fcmpes	%fcc0, %f22, %f8
	.word	0xa8dd35c3	! t1_kref+0xc78:   	smulcc	%l4, -0xa3d, %l4
	.word	0x8fa00529	! t1_kref+0xc7c:   	fsqrts	%f9, %f7
	.word	0xd2801019	! t1_kref+0xc80:   	lda	[%g0 + %i1]0x80, %o1
	.word	0x8d837782	! t1_kref+0xc84:   	wr	%o5, 0xfffff782, %fprs
	.word	0x8da188ce	! t1_kref+0xc88:   	fsubd	%f6, %f14, %f6
	.word	0xa9a289ca	! t1_kref+0xc8c:   	fdivd	%f10, %f10, %f20
	.word	0xc51fbd20	! t1_kref+0xc90:   	ldd	[%fp - 0x2e0], %f2
	.word	0xaef56328	! t1_kref+0xc94:   	udivcc	%l5, 0x328, %l7
	.word	0x8610200c	! t1_kref+0xc98:   	mov	0xc, %g3
	.word	0x86a0e001	! t1_kref+0xc9c:   	subcc	%g3, 1, %g3
	.word	0x22800019	! t1_kref+0xca0:   	be,a	_kref+0xd04
	.word	0xaea8326f	! t1_kref+0xca4:   	andncc	%g0, -0xd91, %l7
	.word	0xac02b717	! t1_kref+0xca8:   	add	%o2, -0x8e9, %l6
	.word	0x9434c00a	! t1_kref+0xcac:   	orn	%l3, %o2, %o2
	.word	0xadb009a7	! t1_kref+0xcb0:   	fexpand	%f7, %f22
	.word	0xada01939	! t1_kref+0xcb4:   	fstod	%f25, %f22
	.word	0x3dbffff9	! t1_kref+0xcb8:   	fbule,a	_kref+0xc9c
	.word	0x81df6752	! t1_kref+0xcbc:   	flush	%i5 + 0x752
	.word	0x2b34e8ac	! t1_kref+0xcc0:   	sethi	%hi(0xd3a2b000), %l5
	.word	0xa5a509d0	! t1_kref+0xcc4:   	fdivd	%f20, %f16, %f18
	.word	0xa1b5874c	! t1_kref+0xcc8:   	fpack32	%f22, %f12, %f16
	.word	0xe6f61000	! t1_kref+0xccc:   	stxa	%l3, [%i0]0x80
	.word	0x81820000	! t1_kref+0xcd0:   	wr	%o0, %g0, %y
	.word	0x33480008	! t1_kref+0xcd4:   	fbe,a,pt	%fcc0, _kref+0xcf4
	.word	0xa6c5f707	! t1_kref+0xcd8:   	addccc	%l7, -0x8f9, %l3
	.word	0x81aa0a27	! t1_kref+0xcdc:   	fcmps	%fcc0, %f8, %f7
	.word	0xb5a389ba	! t1_kref+0xce0:   	fdivs	%f14, %f26, %f26
	.word	0xedee501d	! t1_kref+0xce4:   	prefetcha	%i1 + %i5, 22
	.word	0xa1a01919	! t1_kref+0xce8:   	fitod	%f25, %f16
	.word	0xc11fbc70	! t1_kref+0xcec:   	ldd	[%fp - 0x390], %f0
	.word	0xa782bab6	! t1_kref+0xcf0:   	wr	%o2, 0xfffffab6, %gsr
	.word	0x87b30e28	! t1_kref+0xcf4:   	fands	%f12, %f8, %f3
	.word	0xadb204d6	! t1_kref+0xcf8:   	fcmpne32	%f8, %f22, %l6
	.word	0x89a00523	! t1_kref+0xcfc:   	fsqrts	%f3, %f4
	.word	0x8d8537c5	! t1_kref+0xd00:   	wr	%l4, 0xfffff7c5, %fprs
	.word	0x9835801b	! t1_kref+0xd04:   	orn	%l6, %i3, %o4
	.word	0x36800007	! t1_kref+0xd08:   	bge,a	_kref+0xd24
	.word	0x97b5c200	! t1_kref+0xd0c:   	array8	%l7, %g0, %o3
	.word	0xf430a034	! t1_kref+0xd10:   	sth	%i2, [%g2 + 0x34]
	.word	0x81ad8a56	! t1_kref+0xd14:   	fcmpd	%fcc0, %f22, %f22
	.word	0x8143c000	! t1_kref+0xd18:   	stbar
	.word	0x99b00357	! t1_kref+0xd1c:   	alignaddrl	%g0, %l7, %o4
	.word	0xa7a01899	! t1_kref+0xd20:   	fitos	%f25, %f19
	.word	0xa875001a	! t1_kref+0xd24:   	udiv	%l4, %i2, %l4
	.word	0xa9a008d6	! t1_kref+0xd28:   	fsubd	%f0, %f22, %f20
	.word	0xabb505d8	! t1_kref+0xd2c:   	fcmpeq32	%f20, %f24, %l5
	.word	0x93b6c348	! t1_kref+0xd30:   	alignaddrl	%i3, %o0, %o1
	.word	0xa9a01887	! t1_kref+0xd34:   	fitos	%f7, %f20
	.word	0x20800007	! t1_kref+0xd38:   	bn,a	_kref+0xd54
	.word	0xa9a08956	! t1_kref+0xd3c:   	fmuld	%f2, %f22, %f20
	.word	0xaebd4016	! t1_kref+0xd40:   	xnorcc	%l5, %l6, %l7
	.word	0x81aa8a2a	! t1_kref+0xd44:   	fcmps	%fcc0, %f10, %f10
	.word	0xd420a034	! t1_kref+0xd48:   	st	%o2, [%g2 + 0x34]
	.word	0x81a9ca2b	! t1_kref+0xd4c:   	fcmps	%fcc0, %f7, %f11
	.word	0xa9a508da	! t1_kref+0xd50:   	fsubd	%f20, %f26, %f20
	.word	0xada508d4	! t1_kref+0xd54:   	fsubd	%f20, %f20, %f22
	.word	0x921cf57d	! t1_kref+0xd58:   	xor	%l3, -0xa83, %o1
	.word	0x3c800006	! t1_kref+0xd5c:   	bpos,a	_kref+0xd74
	.word	0xc1be5a5d	! t1_kref+0xd60:   	stda	%f0, [%i1 + %i5]0xd2
	.word	0x11286e73	! t1_kref+0xd64:   	sethi	%hi(0xa1b9cc00), %o0
	.word	0xaaddbe10	! t1_kref+0xd68:   	smulcc	%l6, -0x1f0, %l5
	.word	0x34800004	! t1_kref+0xd6c:   	bg,a	_kref+0xd7c
	.word	0x925aeea4	! t1_kref+0xd70:   	smul	%o3, 0xea4, %o1
	.word	0x93b2c13b	! t1_kref+0xd74:   	edge32n	%o3, %i3, %o1
	.word	0xc13e2008	! t1_kref+0xd78:   	std	%f0, [%i0 + 8]
	.word	0x23800007	! t1_kref+0xd7c:   	fbne,a	_kref+0xd98
	.word	0xad418000	! t1_kref+0xd80:   	mov	%fprs, %l6
	.word	0x929b0015	! t1_kref+0xd84:   	xorcc	%o4, %l5, %o1
	.word	0xec0e3fed	! t1_kref+0xd88:   	ldub	[%i0 - 0x13], %l6
	.word	0x900ec00c	! t1_kref+0xd8c:   	and	%i3, %o4, %o0
	.word	0xd91fbdf8	! t1_kref+0xd90:   	ldd	[%fp - 0x208], %f12
	.word	0x95b3874e	! t1_kref+0xd94:   	fpack32	%f14, %f14, %f10
	.word	0xaeb2e72a	! t1_kref+0xd98:   	orncc	%o3, 0x72a, %l7
	.word	0x8582773c	! t1_kref+0xd9c:   	wr	%o1, 0xfffff73c, %ccr
	.word	0xd6b6d019	! t1_kref+0xda0:   	stha	%o3, [%i3 + %i1]0x80
	.word	0xaab5698b	! t1_kref+0xda4:   	orncc	%l5, 0x98b, %l5
	.word	0x85b00f14	! t1_kref+0xda8:   	fsrc2	%f20, %f2
	.word	0xa80268c2	! t1_kref+0xdac:   	add	%o1, 0x8c2, %l4
	.word	0x81aaca35	! t1_kref+0xdb0:   	fcmps	%fcc0, %f11, %f21
	.word	0xa8a54014	! t1_kref+0xdb4:   	subcc	%l5, %l4, %l4
	.word	0xee2e6002	! t1_kref+0xdb8:   	stb	%l7, [%i1 + 2]
	.word	0xdae81019	! t1_kref+0xdbc:   	ldstuba	[%g0 + %i1]0x80, %o5
	.word	0xe3b8a100	! t1_kref+0xdc0:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0x8143c000	! t1_kref+0xdc4:   	stbar
	.word	0x89a5cd29	! t1_kref+0xdc8:   	fsmuld	%f23, %f9, %f4
	.word	0x90c260cf	! t1_kref+0xdcc:   	addccc	%o1, 0xcf, %o0
	.word	0xa723400d	! t1_kref+0xdd0:   	mulscc	%o5, %o5, %l3
	.word	0xee56c019	! t1_kref+0xdd4:   	ldsh	[%i3 + %i1], %l7
	.word	0x901d0015	! t1_kref+0xdd8:   	xor	%l4, %l5, %o0
	.word	0xe3b8a100	! t1_kref+0xddc:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0x39800002	! t1_kref+0xde0:   	fbuge,a	_kref+0xde8
	.word	0xa8a36a97	! t1_kref+0xde4:   	subcc	%o5, 0xa97, %l4
	.word	0xab35c00d	! t1_kref+0xde8:   	srl	%l7, %o5, %l5
	call	SYM(t1_subr0)
	.word	0xc9be181a	! t1_kref+0xdf0:   	stda	%f4, [%i0 + %i2]0xc0
	.word	0x97b50554	! t1_kref+0xdf4:   	fcmpeq16	%f20, %f20, %o3
	.word	0x99a08925	! t1_kref+0xdf8:   	fmuls	%f2, %f5, %f12
	.word	0x961d3c32	! t1_kref+0xdfc:   	xor	%l4, -0x3ce, %o3
	.word	0xc168a100	! t1_kref+0xe00:   	prefetch	%g2 + 0x100, 0
	.word	0x98c03a68	! t1_kref+0xe04:   	addccc	%g0, -0x598, %o4
	.word	0xae36c00d	! t1_kref+0xe08:   	orn	%i3, %o5, %l7
	.word	0x92aa757e	! t1_kref+0xe0c:   	andncc	%o1, -0xa82, %o1
	.word	0xb1b00c20	! t1_kref+0xe10:   	fzeros	%f24
	.word	0x909d800b	! t1_kref+0xe14:   	xorcc	%l6, %o3, %o0
	.word	0x9db64e77	! t1_kref+0xe18:   	fxnors	%f25, %f23, %f14
	.word	0x90626b78	! t1_kref+0xe1c:   	subc	%o1, 0xb78, %o0
	.word	0x89b50727	! t1_kref+0xe20:   	fmuld8ulx16	%f20, %f7, %f4
	.word	0x30800003	! t1_kref+0xe24:   	ba,a	_kref+0xe30
	.word	0x81b58965	! t1_kref+0xe28:   	fpmerge	%f22, %f5, %f0
	.word	0x987a6a3e	! t1_kref+0xe2c:   	sdiv	%o1, 0xa3e, %o4
	.word	0x933aa002	! t1_kref+0xe30:   	sra	%o2, 0x2, %o1
	.word	0x81aa8a21	! t1_kref+0xe34:   	fcmps	%fcc0, %f10, %f1
	.word	0xa9a01a58	! t1_kref+0xe38:   	fdtoi	%f24, %f20
	.word	0x3e480005	! t1_kref+0xe3c:   	bvc,a,pt	%icc, _kref+0xe50
	.word	0xa5b28731	! t1_kref+0xe40:   	fmuld8ulx16	%f10, %f17, %f18
	.word	0xe5ee101d	! t1_kref+0xe44:   	prefetcha	%i0 + %i5, 18
	.word	0xd126401c	! t1_kref+0xe48:   	st	%f8, [%i1 + %i4]
	.word	0xd02e200f	! t1_kref+0xe4c:   	stb	%o0, [%i0 + 0xf]
	.word	0x93b5431b	! t1_kref+0xe50:   	alignaddr	%l5, %i3, %o1
	.word	0x94d4c01b	! t1_kref+0xe54:   	umulcc	%l3, %i3, %o2
	.word	0xed267fe4	! t1_kref+0xe58:   	st	%f22, [%i1 - 0x1c]
	.word	0xa735a011	! t1_kref+0xe5c:   	srl	%l6, 0x11, %l3
	.word	0xc3a65000	! t1_kref+0xe60:   	sta	%f1, [%i1]0x80
	.word	0x38800004	! t1_kref+0xe64:   	bgu,a	_kref+0xe74
	.word	0x9da0111a	! t1_kref+0xe68:   	fxtod	%f26, %f14
	.word	0xa7b300d7	! t1_kref+0xe6c:   	edge16l	%o4, %l7, %l3
	.word	0xe100a02c	! t1_kref+0xe70:   	ld	[%g2 + 0x2c], %f16
	.word	0x9744c000	! t1_kref+0xe74:   	mov	%gsr, %o3
	.word	0xe278a004	! t1_kref+0xe78:   	swap	[%g2 + 4], %l1
	.word	0xec40a014	! t1_kref+0xe7c:   	ldsw	[%g2 + 0x14], %l6
!	.word	0x3cb9f45f	! t1_kref+0xe80:   	bpos,a	SYM(t1_subr2)
	   	bpos,a	SYM(t1_subr2)
	.word	0x9e0067b8	! t1_kref+0xe84:   	add	%g1, 0x7b8, %o7
	.word	0xada01904	! t1_kref+0xe88:   	fitod	%f4, %f22
	.word	0xac84c00a	! t1_kref+0xe8c:   	addcc	%l3, %o2, %l6
	.word	0x94a4c01b	! t1_kref+0xe90:   	subcc	%l3, %i3, %o2
	.word	0x909b4017	! t1_kref+0xe94:   	xorcc	%o5, %l7, %o0
	.word	0xe9be184c	! t1_kref+0xe98:   	stda	%f20, [%i0 + %o4]0xc2
	.word	0x81a90aa8	! t1_kref+0xe9c:   	fcmpes	%fcc0, %f4, %f8
	.word	0xb1a01905	! t1_kref+0xea0:   	fitod	%f5, %f24
	.word	0xd8871018	! t1_kref+0xea4:   	lda	[%i4 + %i0]0x80, %o4
	.word	0xada68d32	! t1_kref+0xea8:   	fsmuld	%f26, %f18, %f22
	.word	0xacfd8016	! t1_kref+0xeac:   	sdivcc	%l6, %l6, %l6
	.word	0xe26e2008	! t1_kref+0xeb0:   	ldstub	[%i0 + 8], %l1
	.word	0xaa66800b	! t1_kref+0xeb4:   	subc	%i2, %o3, %l5
	.word	0xee00a03c	! t1_kref+0xeb8:   	ld	[%g2 + 0x3c], %l7
	.word	0xe8d6101b	! t1_kref+0xebc:   	ldsha	[%i0 + %i3]0x80, %l4
	.word	0x9245400d	! t1_kref+0xec0:   	addc	%l5, %o5, %o1
	.word	0xed68a104	! t1_kref+0xec4:   	prefetch	%g2 + 0x104, 22
	.word	0x90c6c014	! t1_kref+0xec8:   	addccc	%i3, %l4, %o0
	.word	0x81a309ca	! t1_kref+0xecc:   	fdivd	%f12, %f10, %f0
	.word	0xd220a01c	! t1_kref+0xed0:   	st	%o1, [%g2 + 0x1c]
	.word	0x89a01891	! t1_kref+0xed4:   	fitos	%f17, %f4
	.word	0x81aa0ad8	! t1_kref+0xed8:   	fcmped	%fcc0, %f8, %f24
	.word	0x9e006818	! t1_kref+0xedc:   	add	%g1, 0x818, %o7
!	.word	0x3cb9f447	! t1_kref+0xee0:   	bpos,a	SYM(t1_subr2)
	   	bpos,a	SYM(t1_subr2)
	.word	0x9295c00b	! t1_kref+0xee4:   	orcc	%l7, %o3, %o1
	.word	0xd856401b	! t1_kref+0xee8:   	ldsh	[%i1 + %i3], %o4
	.word	0x96824017	! t1_kref+0xeec:   	addcc	%o1, %l7, %o3
	.word	0x9022401b	! t1_kref+0xef0:   	sub	%o1, %i3, %o0
	.word	0xe830a01c	! t1_kref+0xef4:   	sth	%l4, [%g2 + 0x1c]
	.word	0x2f36a939	! t1_kref+0xef8:   	sethi	%hi(0xdaa4e400), %l7
	.word	0x90c5801a	! t1_kref+0xefc:   	addccc	%l6, %i2, %o0
	.word	0x85b10c52	! t1_kref+0xf00:   	fnor	%f4, %f18, %f2
	.word	0x94deecb4	! t1_kref+0xf04:   	smulcc	%i3, 0xcb4, %o2
	.word	0x81a8ca37	! t1_kref+0xf08:   	fcmps	%fcc0, %f3, %f23
	.word	0x98d2e504	! t1_kref+0xf0c:   	umulcc	%o3, 0x504, %o4
	.word	0x2e800003	! t1_kref+0xf10:   	bvs,a	_kref+0xf1c
	.word	0x89b4898e	! t1_kref+0xf14:   	bshuffle	%f18, %f14, %f4
	.word	0xb1a00030	! t1_kref+0xf18:   	fmovs	%f16, %f24
	.word	0x93b48a79	! t1_kref+0xf1c:   	fpadd32s	%f18, %f25, %f9
	.word	0xed1e2000	! t1_kref+0xf20:   	ldd	[%i0], %f22
	.word	0xadb240a8	! t1_kref+0xf24:   	edge16n	%o1, %o0, %l6
	.word	0xf1070019	! t1_kref+0xf28:   	ld	[%i4 + %i1], %f24
	.word	0x9734e01f	! t1_kref+0xf2c:   	srl	%l3, 0x1f, %o3
	.word	0xea5f4019	! t1_kref+0xf30:   	ldx	[%i5 + %i1], %l5
	.word	0x89b246a8	! t1_kref+0xf34:   	fmul8x16al	%f9, %f8, %f4
	.word	0xd068a00d	! t1_kref+0xf38:   	ldstub	[%g2 + 0xd], %o0
	.word	0xec1f4018	! t1_kref+0xf3c:   	ldd	[%i5 + %i0], %l6
	.word	0xb1b00cc4	! t1_kref+0xf40:   	fnot2	%f4, %f24
	.word	0xa9a5094e	! t1_kref+0xf44:   	fmuld	%f20, %f14, %f20
	.word	0x25480001	! t1_kref+0xf48:   	fblg,a,pt	%fcc0, _kref+0xf4c
	.word	0xa1a01906	! t1_kref+0xf4c:   	fitod	%f6, %f16
	.word	0x94c5000d	! t1_kref+0xf50:   	addccc	%l4, %o5, %o2
	.word	0xec080018	! t1_kref+0xf54:   	ldub	[%g0 + %i0], %l6
	.word	0x21800008	! t1_kref+0xf58:   	fbn,a	_kref+0xf78
	.word	0xdf267ff0	! t1_kref+0xf5c:   	st	%f15, [%i1 - 0x10]
	.word	0x9fc10000	! t1_kref+0xf60:   	call	%g4
	.word	0x98a5000b	! t1_kref+0xf64:   	subcc	%l4, %o3, %o4
	.word	0x26480005	! t1_kref+0xf68:   	bl,a,pt	%icc, _kref+0xf7c
	.word	0x90ab3f91	! t1_kref+0xf6c:   	andncc	%o4, -0x6f, %o0
	.word	0x913b0013	! t1_kref+0xf70:   	sra	%o4, %l3, %o0
	.word	0xcf20a004	! t1_kref+0xf74:   	st	%f7, [%g2 + 4]
	.word	0xaa45000a	! t1_kref+0xf78:   	addc	%l4, %o2, %l5
	.word	0xe81e2010	! t1_kref+0xf7c:   	ldd	[%i0 + 0x10], %l4
	.word	0x9476b8e0	! t1_kref+0xf80:   	udiv	%i2, -0x720, %o2
	.word	0x28480001	! t1_kref+0xf84:   	bleu,a,pt	%icc, _kref+0xf88
	.word	0xaa82c016	! t1_kref+0xf88:   	addcc	%o3, %l6, %l5
	.word	0x9866f8e8	! t1_kref+0xf8c:   	subc	%i3, -0x718, %o4
	.word	0x81ad8a34	! t1_kref+0xf90:   	fcmps	%fcc0, %f22, %f20
	.word	0x3c480008	! t1_kref+0xf94:   	bpos,a,pt	%icc, _kref+0xfb4
	.word	0x9344c000	! t1_kref+0xf98:   	mov	%gsr, %o1
	.word	0x95a4c83a	! t1_kref+0xf9c:   	fadds	%f19, %f26, %f10
	.word	0x2a480002	! t1_kref+0xfa0:   	bcs,a,pt	%icc, _kref+0xfa8
	.word	0xc53e3ff0	! t1_kref+0xfa4:   	std	%f2, [%i0 - 0x10]
	.word	0x8db28a52	! t1_kref+0xfa8:   	fpadd32	%f10, %f18, %f6
	.word	0xadb00fe0	! t1_kref+0xfac:   	fones	%f22
	.word	0x92b5f632	! t1_kref+0xfb0:   	orncc	%l7, -0x9ce, %o1
	.word	0xa895401a	! t1_kref+0xfb4:   	orcc	%l5, %i2, %l4
	.word	0xec56c019	! t1_kref+0xfb8:   	ldsh	[%i3 + %i1], %l6
	.word	0xaa54fed4	! t1_kref+0xfbc:   	umul	%l3, -0x12c, %l5
	.word	0x9fc00004	! t1_kref+0xfc0:   	call	%g0 + %g4
	.word	0x89b007b4	! t1_kref+0xfc4:   	fpackfix	%f20, %f4
	.word	0xd500a02c	! t1_kref+0xfc8:   	ld	[%g2 + 0x2c], %f10
	.word	0xe408692c	! t1_kref+0xfcc:   	ldub	[%g1 + 0x92c], %l2
	.word	0xa41ca00c	! t1_kref+0xfd0:   	xor	%l2, 0xc, %l2
	.word	0xe428692c	! t1_kref+0xfd4:   	stb	%l2, [%g1 + 0x92c]
	.word	0x81d8692c	! t1_kref+0xfd8:   	flush	%g1 + 0x92c
	.word	0xc807bfe8	! t1_kref+0xfdc:   	ld	[%fp - 0x18], %g4
	.word	0x96aa4000	! t1_kref+0xfe0:   	andncc	%o1, %g0, %o3
	.word	0xa8b5a40c	! t1_kref+0xfe4:   	orncc	%l6, 0x40c, %l4
	.word	0x89a01924	! t1_kref+0xfe8:   	fstod	%f4, %f4
	.word	0x99a01a54	! t1_kref+0xfec:   	fdtoi	%f20, %f12
	.word	0x28800002	! t1_kref+0xff0:   	bleu,a	_kref+0xff8
2:	.word	0xa806c015	! t1_kref+0xff4:   	add	%i3, %l5, %l4
	.word	0x2c480004	! t1_kref+0xff8:   	bneg,a,pt	%icc, _kref+0x1008
	.word	0x89a01928	! t1_kref+0xffc:   	fstod	%f8, %f4
	.word	0x96e2400c	! t1_kref+0x1000:   	subccc	%o1, %o4, %o3
	.word	0xaaad6ea5	! t1_kref+0x1004:   	andncc	%l5, 0xea5, %l5
	.word	0x8db20752	! t1_kref+0x1008:   	fpack32	%f8, %f18, %f6
	.word	0xada018d0	! t1_kref+0x100c:   	fdtos	%f16, %f22
	.word	0x81a94a2c	! t1_kref+0x1010:   	fcmps	%fcc0, %f5, %f12
	.word	0x9f414000	! t1_kref+0x1014:   	mov	%pc, %o7
	.word	0x8da01a56	! t1_kref+0x1018:   	fdtoi	%f22, %f6
	.word	0xfbee101a	! t1_kref+0x101c:   	prefetcha	%i0 + %i2, 29
	.word	0x89b18ad6	! t1_kref+0x1020:   	fpsub32	%f6, %f22, %f4
	.word	0x98d4c01b	! t1_kref+0x1024:   	umulcc	%l3, %i3, %o4
	.word	0xed68a102	! t1_kref+0x1028:   	prefetch	%g2 + 0x102, 22
	.word	0x8db40c8e	! t1_kref+0x102c:   	fandnot2	%f16, %f14, %f6
	.word	0xed68a00b	! t1_kref+0x1030:   	prefetch	%g2 + 0xb, 22
	.word	0x86102019	! t1_kref+0x1034:   	mov	0x19, %g3
	.word	0x86a0e001	! t1_kref+0x1038:   	subcc	%g3, 1, %g3
	.word	0x2280001c	! t1_kref+0x103c:   	be,a	_kref+0x10ac
	.word	0x99b00c20	! t1_kref+0x1040:   	fzeros	%f12
	.word	0x85b40a7a	! t1_kref+0x1044:   	fpadd32s	%f16, %f26, %f2
	.word	0x90fec01a	! t1_kref+0x1048:   	sdivcc	%i3, %i2, %o0
	.word	0x91b68596	! t1_kref+0x104c:   	fcmpgt32	%f26, %f22, %o0
	.word	0x95b009ac	! t1_kref+0x1050:   	fexpand	%f12, %f10
	.word	0x324ffff9	! t1_kref+0x1054:   	bne,a,pt	%icc, _kref+0x1038
	.word	0xa6524008	! t1_kref+0x1058:   	umul	%o1, %o0, %l3
	.word	0xd410a036	! t1_kref+0x105c:   	lduh	[%g2 + 0x36], %o2
	.word	0x91a018ce	! t1_kref+0x1060:   	fdtos	%f14, %f8
	.word	0x97356001	! t1_kref+0x1064:   	srl	%l5, 0x1, %o3
	.word	0x9135800c	! t1_kref+0x1068:   	srl	%l6, %o4, %o0
	.word	0xa1a0190f	! t1_kref+0x106c:   	fitod	%f15, %f16
	.word	0xb8103fe4	! t1_kref+0x1070:   	mov	0xffffffe4, %i4
	.word	0x2bbffff1	! t1_kref+0x1074:   	fbug,a	_kref+0x1038
	.word	0xf3801018	! t1_kref+0x1078:   	lda	[%g0 + %i0]0x80, %f25
	.word	0xa6ddac02	! t1_kref+0x107c:   	smulcc	%l6, 0xc02, %l3
	.word	0xac228015	! t1_kref+0x1080:   	sub	%o2, %l5, %l6
	.word	0x9f414000	! t1_kref+0x1084:   	mov	%pc, %o7
	.word	0xa9a0002e	! t1_kref+0x1088:   	fmovs	%f14, %f20
	.word	0xa1a508c8	! t1_kref+0x108c:   	fsubd	%f20, %f8, %f16
	.word	0x93b4cea0	! t1_kref+0x1090:   	fsrc1s	%f19, %f9
	.word	0xd6162012	! t1_kref+0x1094:   	lduh	[%i0 + 0x12], %o3
	.word	0x1519ff1b	! t1_kref+0x1098:   	sethi	%hi(0x67fc6c00), %o2
	.word	0x95b2c348	! t1_kref+0x109c:   	alignaddrl	%o3, %o0, %o2
	.word	0xec00a03c	! t1_kref+0x10a0:   	ld	[%g2 + 0x3c], %l6
	.word	0xa9b50984	! t1_kref+0x10a4:   	bshuffle	%f20, %f4, %f20
	.word	0xb1a089b4	! t1_kref+0x10a8:   	fdivs	%f2, %f20, %f24
	.word	0x9335801a	! t1_kref+0x10ac:   	srl	%l6, %i2, %o1
	.word	0xec1e2008	! t1_kref+0x10b0:   	ldd	[%i0 + 8], %l6
	.word	0x9f414000	! t1_kref+0x10b4:   	mov	%pc, %o7
	.word	0x15348af9	! t1_kref+0x10b8:   	sethi	%hi(0xd22be400), %o2
	.word	0x91632082	! t1_kref+0x10bc:   	movuge	%fcc0, 0x82, %o0
	.word	0x34480005	! t1_kref+0x10c0:   	bg,a,pt	%icc, _kref+0x10d4
	.word	0xec562018	! t1_kref+0x10c4:   	ldsh	[%i0 + 0x18], %l6
	.word	0xe81e6008	! t1_kref+0x10c8:   	ldd	[%i1 + 8], %l4
	.word	0xa685670d	! t1_kref+0x10cc:   	addcc	%l5, 0x70d, %l3
	.word	0xa9b00c20	! t1_kref+0x10d0:   	fzeros	%f20
	.word	0xaab5c009	! t1_kref+0x10d4:   	orncc	%l7, %o1, %l5
	.word	0x9884c00b	! t1_kref+0x10d8:   	addcc	%l3, %o3, %o4
	.word	0x8d868008	! t1_kref+0x10dc:   	wr	%i2, %o0, %fprs
	.word	0xabb4c354	! t1_kref+0x10e0:   	alignaddrl	%l3, %l4, %l5
	.word	0xe1000018	! t1_kref+0x10e4:   	ld	[%g0 + %i0], %f16
	.word	0xdb200018	! t1_kref+0x10e8:   	st	%f13, [%g0 + %i0]
	.word	0x95b10e0e	! t1_kref+0x10ec:   	fand	%f4, %f14, %f10
	.word	0xc12e2000	! t1_kref+0x10f0:   	st	%fsr, [%i0]
	.word	0xa93ec009	! t1_kref+0x10f4:   	sra	%i3, %o1, %l4
	.word	0xda68a02e	! t1_kref+0x10f8:   	ldstub	[%g2 + 0x2e], %o5
	.word	0x93358008	! t1_kref+0x10fc:   	srl	%l6, %o0, %o1
	.word	0x91b58e80	! t1_kref+0x1100:   	fsrc1	%f22, %f8
	.word	0x94f53ebf	! t1_kref+0x1104:   	udivcc	%l4, -0x141, %o2
	.word	0x8586c00a	! t1_kref+0x1108:   	wr	%i3, %o2, %ccr
	.word	0x8584e415	! t1_kref+0x110c:   	wr	%l3, 0x415, %ccr
	.word	0xabb58240	! t1_kref+0x1110:   	array16	%l6, %g0, %l5
	.word	0xa895800c	! t1_kref+0x1114:   	orcc	%l6, %o4, %l4
	.word	0xe3b8a100	! t1_kref+0x1118:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0x81ac8a29	! t1_kref+0x111c:   	fcmps	%fcc0, %f18, %f9
	.word	0x86102001	! t1_kref+0x1120:   	mov	0x1, %g3
	.word	0x32800000	! t1_kref+0x1124:   	bne,a	_kref+0x1124
	.word	0x86a0e001	! t1_kref+0x1128:   	subcc	%g3, 1, %g3
	.word	0xa872c00c	! t1_kref+0x112c:   	udiv	%o3, %o4, %l4
	.word	0xb410200a	! t1_kref+0x1130:   	mov	0xa, %i2
	.word	0xe51fbe60	! t1_kref+0x1134:   	ldd	[%fp - 0x1a0], %f18
	.word	0x90c56878	! t1_kref+0x1138:   	addccc	%l5, 0x878, %o0
	.word	0xe4680019	! t1_kref+0x113c:   	ldstub	[%g0 + %i1], %l2
	.word	0xb1a28842	! t1_kref+0x1140:   	faddd	%f10, %f2, %f24
	.word	0x86102004	! t1_kref+0x1144:   	mov	0x4, %g3
	.word	0x32800000	! t1_kref+0x1148:   	bne,a	_kref+0x1148
	.word	0x86a0e001	! t1_kref+0x114c:   	subcc	%g3, 1, %g3
	.word	0x87b68cb3	! t1_kref+0x1150:   	fandnot2s	%f26, %f19, %f3
	.word	0xd51e2010	! t1_kref+0x1154:   	ldd	[%i0 + 0x10], %f10
	.word	0x2f800002	! t1_kref+0x1158:   	fbu,a	_kref+0x1160
	.word	0x9ba000b4	! t1_kref+0x115c:   	fnegs	%f20, %f13
	.word	0xe3b8a100	! t1_kref+0x1160:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0x87a4492e	! t1_kref+0x1164:   	fmuls	%f17, %f14, %f3
	.word	0xab34c015	! t1_kref+0x1168:   	srl	%l3, %l5, %l5
	.word	0xaa9826bf	! t1_kref+0x116c:   	xorcc	%g0, 0x6bf, %l5
	.word	0x8da0c9b0	! t1_kref+0x1170:   	fdivs	%f3, %f16, %f6
	.word	0x92a2c000	! t1_kref+0x1174:   	subcc	%o3, %g0, %o1
	.word	0xae23401a	! t1_kref+0x1178:   	sub	%o5, %i2, %l7
	.word	0x81aa0a42	! t1_kref+0x117c:   	fcmpd	%fcc0, %f8, %f2
	.word	0x9144c000	! t1_kref+0x1180:   	mov	%gsr, %o0
	.word	0xabb5c02c	! t1_kref+0x1184:   	edge8n	%l7, %o4, %l5
	.word	0xa5a2c9a5	! t1_kref+0x1188:   	fdivs	%f11, %f5, %f18
	.word	0x81b30c46	! t1_kref+0x118c:   	fnor	%f12, %f6, %f0
	.word	0x8db18ec4	! t1_kref+0x1190:   	fornot2	%f6, %f4, %f6
	.word	0xac34c008	! t1_kref+0x1194:   	orn	%l3, %o0, %l6
	.word	0x9826c00b	! t1_kref+0x1198:   	sub	%i3, %o3, %o4
	.word	0xa805e64a	! t1_kref+0x119c:   	add	%l7, 0x64a, %l4
	.word	0xe526401c	! t1_kref+0x11a0:   	st	%f18, [%i1 + %i4]
	.word	0xa8c02be3	! t1_kref+0x11a4:   	addccc	%g0, 0xbe3, %l4
	.word	0x3a800004	! t1_kref+0x11a8:   	bcc,a	_kref+0x11b8
	.word	0xb3a01892	! t1_kref+0x11ac:   	fitos	%f18, %f25
	.word	0xaeb2c00a	! t1_kref+0x11b0:   	orncc	%o3, %o2, %l7
	.word	0xb6102006	! t1_kref+0x11b4:   	mov	0x6, %i3
	.word	0x81ad8a58	! t1_kref+0x11b8:   	fcmpd	%fcc0, %f22, %f24
	.word	0x3b480002	! t1_kref+0x11bc:   	fble,a,pt	%fcc0, _kref+0x11c4
	.word	0xe83e3fe8	! t1_kref+0x11c0:   	std	%l4, [%i0 - 0x18]
	.word	0xc9ee501b	! t1_kref+0x11c4:   	prefetcha	%i1 + %i3, 4
	.word	0xcb270018	! t1_kref+0x11c8:   	st	%f5, [%i4 + %i0]
	.word	0x9db68f50	! t1_kref+0x11cc:   	fornot1	%f26, %f16, %f14
	.word	0xa9a589cc	! t1_kref+0x11d0:   	fdivd	%f22, %f12, %f20
	.word	0xa5a0482a	! t1_kref+0x11d4:   	fadds	%f1, %f10, %f18
	.word	0x9895e01d	! t1_kref+0x11d8:   	orcc	%l7, 0x1d, %o4
	.word	0x9366c015	! t1_kref+0x11dc:   	movge	%icc, %l5, %o1
	.word	0xac8b400b	! t1_kref+0x11e0:   	andcc	%o5, %o3, %l6
	.word	0x91b20169	! t1_kref+0x11e4:   	edge32ln	%o0, %o1, %o0
	.word	0xd706201c	! t1_kref+0x11e8:   	ld	[%i0 + 0x1c], %f11
	.word	0x81ab8a4c	! t1_kref+0x11ec:   	fcmpd	%fcc0, %f14, %f12
	.word	0xb3a01a4c	! t1_kref+0x11f0:   	fdtoi	%f12, %f25
	sethi	%hi(2f), %o7
	.word	0xe40be214	! t1_kref+0x11f8:   	ldub	[%o7 + 0x214], %l2
	.word	0xa41ca00c	! t1_kref+0x11fc:   	xor	%l2, 0xc, %l2
	.word	0xe42be214	! t1_kref+0x1200:   	stb	%l2, [%o7 + 0x214]
	.word	0x81dbe214	! t1_kref+0x1204:   	flush	%o7 + 0x214
	.word	0x933ec014	! t1_kref+0x1208:   	sra	%i3, %l4, %o1
	.word	0x9fa0002e	! t1_kref+0x120c:   	fmovs	%f14, %f15
	.word	0x81a01026	! t1_kref+0x1210:   	fstox	%f6, %f0
2:	.word	0xae33400a	! t1_kref+0x1214:   	orn	%o5, %o2, %l7
	.word	0xe19e5000	! t1_kref+0x1218:   	ldda	[%i1]0x80, %f16
	.word	0x93a209b2	! t1_kref+0x121c:   	fdivs	%f8, %f18, %f9
	.word	0xb5b009b6	! t1_kref+0x1220:   	fexpand	%f22, %f26
	.word	0xe43e7ff8	! t1_kref+0x1224:   	std	%l2, [%i1 - 8]
	.word	0x86102003	! t1_kref+0x1228:   	mov	0x3, %g3
	.word	0x32800000	! t1_kref+0x122c:   	bne,a	_kref+0x122c
	.word	0x86a0e001	! t1_kref+0x1230:   	subcc	%g3, 1, %g3
	.word	0x38480006	! t1_kref+0x1234:   	bgu,a,pt	%icc, _kref+0x124c
	.word	0xa7b24153	! t1_kref+0x1238:   	edge32l	%o1, %l3, %l3
	.word	0x95a01905	! t1_kref+0x123c:   	fitod	%f5, %f10
	.word	0xe3b8a100	! t1_kref+0x1240:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0xa62b20e9	! t1_kref+0x1244:   	andn	%o4, 0xe9, %l3
	.word	0x91a509c2	! t1_kref+0x1248:   	fdivd	%f20, %f2, %f8
	.word	0x95b40626	! t1_kref+0x124c:   	fmul8x16	%f16, %f6, %f10
	.word	0xae7e8014	! t1_kref+0x1250:   	sdiv	%i2, %l4, %l7
	.word	0x95b40e80	! t1_kref+0x1254:   	fsrc1	%f16, %f10
	.word	0xb1b14f79	! t1_kref+0x1258:   	fornot1s	%f5, %f25, %f24
	.word	0xd47e7fec	! t1_kref+0x125c:   	swap	[%i1 - 0x14], %o2
	.word	0xa8424000	! t1_kref+0x1260:   	addc	%o1, %g0, %l4
	.word	0x90b2b7cf	! t1_kref+0x1264:   	orncc	%o2, -0x831, %o0
	.word	0xa852f1e4	! t1_kref+0x1268:   	umul	%o3, -0xe1c, %l4
	.word	0x9f414000	! t1_kref+0x126c:   	mov	%pc, %o7
	.word	0xa852800d	! t1_kref+0x1270:   	umul	%o2, %o5, %l4
	.word	0xec6e601a	! t1_kref+0x1274:   	ldstub	[%i1 + 0x1a], %l6
	.word	0xcc382ff8	! t1_kref+0x1278:   	std	%g6, [%g0 + 0xff8]
	.word	0xec380019	! t1_kref+0x127c:   	std	%l6, [%g0 + %i1]
	.word	0x96f4ff28	! t1_kref+0x1280:   	udivcc	%l3, -0xd8, %o3
	.word	0xe60e3fe6	! t1_kref+0x1284:   	ldub	[%i0 - 0x1a], %l3
	.word	0x3e800001	! t1_kref+0x1288:   	bvc,a	_kref+0x128c
	.word	0xf43e4000	! t1_kref+0x128c:   	std	%i2, [%i1]
	.word	0x9db00fc0	! t1_kref+0x1290:   	fone	%f14
	.word	0x2c480007	! t1_kref+0x1294:   	bneg,a,pt	%icc, _kref+0x12b0
	.word	0xad3a800a	! t1_kref+0x1298:   	sra	%o2, %o2, %l6
	.word	0x9425c01b	! t1_kref+0x129c:   	sub	%l7, %i3, %o2
	.word	0xd820a014	! t1_kref+0x12a0:   	st	%o4, [%g2 + 0x14]
	.word	0xaad30008	! t1_kref+0x12a4:   	umulcc	%o4, %o0, %l5
	.word	0xaea50000	! t1_kref+0x12a8:   	subcc	%l4, %g0, %l7
	.word	0x2f800008	! t1_kref+0x12ac:   	fbu,a	_kref+0x12cc
	.word	0x91a409c8	! t1_kref+0x12b0:   	fdivd	%f16, %f8, %f8
	.word	0xf11fbf70	! t1_kref+0x12b4:   	ldd	[%fp - 0x90], %f24
	.word	0x91b10e80	! t1_kref+0x12b8:   	fsrc1	%f4, %f8
	.word	0xa8234016	! t1_kref+0x12bc:   	sub	%o5, %l6, %l4
	.word	0xb3b00fe0	! t1_kref+0x12c0:   	fones	%f25
	.word	0xec1e401d	! t1_kref+0x12c4:   	ldd	[%i1 + %i5], %l6
	.word	0x95a288d2	! t1_kref+0x12c8:   	fsubd	%f10, %f18, %f10
	.word	0x98a6f2fb	! t1_kref+0x12cc:   	subcc	%i3, -0xd05, %o4
	.word	0x993d6019	! t1_kref+0x12d0:   	sra	%l5, 0x19, %o4
	.word	0x98b5c008	! t1_kref+0x12d4:   	orncc	%l7, %o0, %o4
	.word	0xac7d4016	! t1_kref+0x12d8:   	sdiv	%l5, %l6, %l6
	.word	0xaa06800b	! t1_kref+0x12dc:   	add	%i2, %o3, %l5
	.word	0xafa01a56	! t1_kref+0x12e0:   	fdtoi	%f22, %f23
	.word	0xadb106d2	! t1_kref+0x12e4:   	fmul8sux16	%f4, %f18, %f22
	.word	0x8143e02d	! t1_kref+0x12e8:   	membar	0x2d
	.word	0x91418000	! t1_kref+0x12ec:   	mov	%fprs, %o0
	.word	0xe87e3fec	! t1_kref+0x12f0:   	swap	[%i0 - 0x14], %l4
	.word	0xc7063ff0	! t1_kref+0x12f4:   	ld	[%i0 - 0x10], %f3
	.word	0xa7b28348	! t1_kref+0x12f8:   	alignaddrl	%o2, %o0, %l3
	.word	0xa8f4c014	! t1_kref+0x12fc:   	udivcc	%l3, %l4, %l4
	.word	0xada349aa	! t1_kref+0x1300:   	fdivs	%f13, %f10, %f22
	.word	0x90aef0ca	! t1_kref+0x1304:   	andncc	%i3, -0xf36, %o0
	.word	0x92d0328f	! t1_kref+0x1308:   	umulcc	%g0, -0xd71, %o1
	.word	0x95a01917	! t1_kref+0x130c:   	fitod	%f23, %f10
	.word	0xee10a01e	! t1_kref+0x1310:   	lduh	[%g2 + 0x1e], %l7
	.word	0x2c480005	! t1_kref+0x1314:   	bneg,a,pt	%icc, _kref+0x1328
	.word	0x923dee47	! t1_kref+0x1318:   	xnor	%l7, 0xe47, %o1
	.word	0x95b2010a	! t1_kref+0x131c:   	edge32	%o0, %o2, %o2
	.word	0x85a01031	! t1_kref+0x1320:   	fstox	%f17, %f2
	.word	0xabb20404	! t1_kref+0x1324:   	fcmple16	%f8, %f4, %l5
	.word	0x9122aa78	! t1_kref+0x1328:   	mulscc	%o2, 0xa78, %o0
	.word	0xe9beda59	! t1_kref+0x132c:   	stda	%f20, [%i3 + %i1]0xd2
	.word	0xec0e200d	! t1_kref+0x1330:   	ldub	[%i0 + 0xd], %l6
	.word	0x91a109c2	! t1_kref+0x1334:   	fdivd	%f4, %f2, %f8
	.word	0x27800006	! t1_kref+0x1338:   	fbul,a	_kref+0x1350
	.word	0xae924009	! t1_kref+0x133c:   	orcc	%o1, %o1, %l7
	.word	0x28480005	! t1_kref+0x1340:   	bleu,a,pt	%icc, _kref+0x1354
	.word	0x8da5082c	! t1_kref+0x1344:   	fadds	%f20, %f12, %f6
	.word	0xafa01894	! t1_kref+0x1348:   	fitos	%f20, %f23
	.word	0x95b00fc0	! t1_kref+0x134c:   	fone	%f10
	.word	0xd248a026	! t1_kref+0x1350:   	ldsb	[%g2 + 0x26], %o1
	.word	0x81580000	! t1_kref+0x1354:   	flushw
	.word	0xa8c4efcf	! t1_kref+0x1358:   	addccc	%l3, 0xfcf, %l4
	.word	0x81aa8aa9	! t1_kref+0x135c:   	fcmpes	%fcc0, %f10, %f9
	.word	0x99a0c9ba	! t1_kref+0x1360:   	fdivs	%f3, %f26, %f12
	.word	0x98fec008	! t1_kref+0x1364:   	sdivcc	%i3, %o0, %o4
	.word	0xad418000	! t1_kref+0x1368:   	mov	%fprs, %l6
	.word	0xaa2a0014	! t1_kref+0x136c:   	andn	%o0, %l4, %l5
	.word	0x95a01930	! t1_kref+0x1370:   	fstod	%f16, %f10
	.word	0xead01018	! t1_kref+0x1374:   	ldsha	[%g0 + %i0]0x80, %l5
	.word	0xd226401c	! t1_kref+0x1378:   	st	%o1, [%i1 + %i4]
	.word	0x89b64d60	! t1_kref+0x137c:   	fnot1s	%f25, %f4
	.word	0xe3b8a100	! t1_kref+0x1380:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0x93a01a48	! t1_kref+0x1384:   	fdtoi	%f8, %f9
	.word	0xe3b8a100	! t1_kref+0x1388:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0xac76c00d	! t1_kref+0x138c:   	udiv	%i3, %o5, %l6
	.word	0xa9a0002e	! t1_kref+0x1390:   	fmovs	%f14, %f20
	.word	0x95a50846	! t1_kref+0x1394:   	faddd	%f20, %f6, %f10
	.word	0xf4be101d	! t1_kref+0x1398:   	stda	%i2, [%i0 + %i5]0x80
	.word	0xa1a14826	! t1_kref+0x139c:   	fadds	%f5, %f6, %f16
	.word	0xb1b00f39	! t1_kref+0x13a0:   	fsrc2s	%f25, %f24
	.word	0x91a50944	! t1_kref+0x13a4:   	fmuld	%f20, %f4, %f8
	.word	0xf6a6501c	! t1_kref+0x13a8:   	sta	%i3, [%i1 + %i4]0x80
	.word	0x35800003	! t1_kref+0x13ac:   	fbue,a	_kref+0x13b8
	.word	0x95a0002c	! t1_kref+0x13b0:   	fmovs	%f12, %f10
	.word	0xa3a018d8	! t1_kref+0x13b4:   	fdtos	%f24, %f17
	.word	0xd60e8019	! t1_kref+0x13b8:   	ldub	[%i2 + %i1], %o3
	.word	0xaf3ae00c	! t1_kref+0x13bc:   	sra	%o3, 0xc, %l7
	.word	0x97b504d8	! t1_kref+0x13c0:   	fcmpne32	%f20, %f24, %o3
	.word	0xdd264000	! t1_kref+0x13c4:   	st	%f14, [%i1]
	.word	0x93418000	! t1_kref+0x13c8:   	mov	%fprs, %o1
	.word	0x81ad0ad0	! t1_kref+0x13cc:   	fcmped	%fcc0, %f20, %f16
	.word	0xa6d4c016	! t1_kref+0x13d0:   	umulcc	%l3, %l6, %l3
	.word	0x2a800003	! t1_kref+0x13d4:   	bcs,a	_kref+0x13e0
	.word	0xc368a0cb	! t1_kref+0x13d8:   	prefetch	%g2 + 0xcb, 1
	.word	0xf628a006	! t1_kref+0x13dc:   	stb	%i3, [%g2 + 6]
	.word	0x2f800003	! t1_kref+0x13e0:   	fbu,a	_kref+0x13ec
	.word	0xaa180015	! t1_kref+0x13e4:   	xor	%g0, %l5, %l5
	.word	0xaec5000b	! t1_kref+0x13e8:   	addccc	%l4, %o3, %l7
	.word	0x81da680c	! t1_kref+0x13ec:   	flush	%o1 + 0x80c
	.word	0xaca57b49	! t1_kref+0x13f0:   	subcc	%l5, -0x4b7, %l6
	.word	0xa85db81c	! t1_kref+0x13f4:   	smul	%l6, -0x7e4, %l4
	.word	0x9bb4ca36	! t1_kref+0x13f8:   	fpadd16s	%f19, %f22, %f13
	.word	0x81ae0a54	! t1_kref+0x13fc:   	fcmpd	%fcc0, %f24, %f20
	.word	0x26480008	! t1_kref+0x1400:   	bl,a,pt	%icc, _kref+0x1420
	.word	0x94faef81	! t1_kref+0x1404:   	sdivcc	%o3, 0xf81, %o2
	.word	0x81aa8ab6	! t1_kref+0x1408:   	fcmpes	%fcc0, %f10, %f22
	.word	0xa7418000	! t1_kref+0x140c:   	mov	%fprs, %l3
	call	SYM(t1_subr1)
	.word	0xb1a01913	! t1_kref+0x1414:   	fitod	%f19, %f24
	.word	0x907267c1	! t1_kref+0x1418:   	udiv	%o1, 0x7c1, %o0
	.word	0xaba2c9ac	! t1_kref+0x141c:   	fdivs	%f11, %f12, %f21
	.word	0x8da30848	! t1_kref+0x1420:   	faddd	%f12, %f8, %f6
	.word	0x89b10c8a	! t1_kref+0x1424:   	fandnot2	%f4, %f10, %f4
	.word	0xd4780018	! t1_kref+0x1428:   	swap	[%g0 + %i0], %o2
	.word	0x31800007	! t1_kref+0x142c:   	fba,a	_kref+0x1448
	.word	0xa626fa46	! t1_kref+0x1430:   	sub	%i3, -0x5ba, %l3
	.word	0x81ae4a35	! t1_kref+0x1434:   	fcmps	%fcc0, %f25, %f21
	.word	0xaad6e89c	! t1_kref+0x1438:   	umulcc	%i3, 0x89c, %l5
	.word	0x9db28e12	! t1_kref+0x143c:   	fand	%f10, %f18, %f14
	.word	0x81a84a24	! t1_kref+0x1440:   	fcmps	%fcc0, %f1, %f4
	.word	0xdab61000	! t1_kref+0x1444:   	stha	%o5, [%i0]0x80
	.word	0xd6ce5000	! t1_kref+0x1448:   	ldsba	[%i1]0x80, %o3
	.word	0x8da109aa	! t1_kref+0x144c:   	fdivs	%f4, %f10, %f6
	.word	0xa9b10a8c	! t1_kref+0x1450:   	fpsub16	%f4, %f12, %f20
	.word	0x9144c000	! t1_kref+0x1454:   	mov	%gsr, %o0
	.word	0x90334016	! t1_kref+0x1458:   	orn	%o5, %l6, %o0
	.word	0x987d3f54	! t1_kref+0x145c:   	sdiv	%l4, -0xac, %o4
	call	1f
	.empty
	.word	0x9895a945	! t1_kref+0x1464:   	orcc	%l6, 0x945, %o4
	.word	0x9da288c8	! t1_kref+0x1468:   	fsubd	%f10, %f8, %f14
	.word	0xaa958000	! t1_kref+0x146c:   	orcc	%l6, %g0, %l5
	.word	0xe03e6000	! t1_kref+0x1470:   	std	%l0, [%i1]
	.word	0xa1b107d4	! t1_kref+0x1474:   	pdist	%f4, %f20, %f16
1:	.word	0xf428a02f	! t1_kref+0x1478:   	stb	%i2, [%g2 + 0x2f]
	.word	0x94fec00b	! t1_kref+0x147c:   	sdivcc	%i3, %o3, %o2
	.word	0x987a6c2d	! t1_kref+0x1480:   	sdiv	%o1, 0xc2d, %o4
	.word	0x8ba44825	! t1_kref+0x1484:   	fadds	%f17, %f5, %f5
	.word	0xd9be5a5d	! t1_kref+0x1488:   	stda	%f12, [%i1 + %i5]0xd2
	.word	0xae7a800c	! t1_kref+0x148c:   	sdiv	%o2, %o4, %l7
	.word	0x26800006	! t1_kref+0x1490:   	bl,a	_kref+0x14a8
	.word	0xa9b3862a	! t1_kref+0x1494:   	fmul8x16	%f14, %f10, %f20
	.word	0xec30a036	! t1_kref+0x1498:   	sth	%l6, [%g2 + 0x36]
	.word	0xb3a0188b	! t1_kref+0x149c:   	fitos	%f11, %f25
	.word	0x81ac8a5a	! t1_kref+0x14a0:   	fcmpd	%fcc0, %f18, %f26
	.word	0xb3b00774	! t1_kref+0x14a4:   	fpack16	%f20, %f25
	.word	0x9022c00c	! t1_kref+0x14a8:   	sub	%o3, %o4, %o0
	.word	0xeaae9019	! t1_kref+0x14ac:   	stba	%l5, [%i2 + %i1]0x80
	.word	0xb1a01021	! t1_kref+0x14b0:   	fstox	%f1, %f24
	.word	0x8143c000	! t1_kref+0x14b4:   	stbar
	.word	0xe11f4018	! t1_kref+0x14b8:   	ldd	[%i5 + %i0], %f16
	.word	0x99b10d40	! t1_kref+0x14bc:   	fnot1	%f4, %f12
	.word	0x130dc0c6	! t1_kref+0x14c0:   	sethi	%hi(0x37031800), %o1
	.word	0xe11fbe68	! t1_kref+0x14c4:   	ldd	[%fp - 0x198], %f16
	.word	0x929b400c	! t1_kref+0x14c8:   	xorcc	%o5, %o4, %o1
	.word	0xc168a040	! t1_kref+0x14cc:   	prefetch	%g2 + 0x40, 0
	.word	0x93b48544	! t1_kref+0x14d0:   	fcmpeq16	%f18, %f4, %o1
	.word	0x81abcaa5	! t1_kref+0x14d4:   	fcmpes	%fcc0, %f15, %f5
	.word	0xea50a034	! t1_kref+0x14d8:   	ldsh	[%g2 + 0x34], %l5
	.word	0xa664c00d	! t1_kref+0x14dc:   	subc	%l3, %o5, %l3
	.word	0xc9be589b	! t1_kref+0x14e0:   	stda	%f4, [%i1 + %i3]0xc4
	.word	0x83c06e30	! t1_kref+0x14e4:   	jmpl	%g1 + 0xe30, %g1
	.word	0xea08a026	! t1_kref+0x14e8:   	ldub	[%g2 + 0x26], %l5
	.word	0x23800008	! t1_kref+0x14ec:   	fbne,a	_kref+0x150c
	.word	0x96c24017	! t1_kref+0x14f0:   	addccc	%o1, %l7, %o3
	.word	0xec7f0019	! t1_kref+0x14f4:   	swap	[%i4 + %i1], %l6
	.word	0x9da01882	! t1_kref+0x14f8:   	fitos	%f2, %f14
	.word	0xa8b5a331	! t1_kref+0x14fc:   	orncc	%l6, 0x331, %l4
	.word	0xed68a100	! t1_kref+0x1500:   	prefetch	%g2 + 0x100, 22
	.word	0xeeee1000	! t1_kref+0x1504:   	ldstuba	[%i0]0x80, %l7
	.word	0xe67e2014	! t1_kref+0x1508:   	swap	[%i0 + 0x14], %l3
	.word	0x99a209d0	! t1_kref+0x150c:   	fdivd	%f8, %f16, %f12
	.word	0xaa7eaa11	! t1_kref+0x1510:   	sdiv	%i2, 0xa11, %l5
	.word	0x93408000	! t1_kref+0x1514:   	mov	%ccr, %o1
	.word	0xab2ce01a	! t1_kref+0x1518:   	sll	%l3, 0x1a, %l5
	.word	0x89a38d29	! t1_kref+0x151c:   	fsmuld	%f14, %f9, %f4
	.word	0xcd067fe4	! t1_kref+0x1520:   	ld	[%i1 - 0x1c], %f6
	.word	0x86102003	! t1_kref+0x1524:   	mov	0x3, %g3
	.word	0x32800000	! t1_kref+0x1528:   	bne,a	_kref+0x1528
	.word	0x86a0e001	! t1_kref+0x152c:   	subcc	%g3, 1, %g3
	.word	0xe27e3fe8	! t1_kref+0x1530:   	swap	[%i0 - 0x18], %l1
	.word	0xe9be181a	! t1_kref+0x1534:   	stda	%f20, [%i0 + %i2]0xc0
	.word	0xa1a000cc	! t1_kref+0x1538:   	fnegd	%f12, %f16
	.word	0xf1062004	! t1_kref+0x153c:   	ld	[%i0 + 4], %f24
	.word	0xc07e0000	! t1_kref+0x1540:   	swap	[%i0], %g0
	.word	0x9814e416	! t1_kref+0x1544:   	or	%l3, 0x416, %o4
	.word	0x92f00016	! t1_kref+0x1548:   	udivcc	%g0, %l6, %o1
	.word	0x81ae0acc	! t1_kref+0x154c:   	fcmped	%fcc0, %f24, %f12
	.word	0xa8b6e407	! t1_kref+0x1550:   	orncc	%i3, 0x407, %l4
	.word	0x81834000	! t1_kref+0x1554:   	wr	%o5, %g0, %y
	.word	0x981d7739	! t1_kref+0x1558:   	xor	%l5, -0x8c7, %o4
	.word	0x95b34113	! t1_kref+0x155c:   	edge32	%o5, %l3, %o2
	.word	0x962d3bee	! t1_kref+0x1560:   	andn	%l4, -0x412, %o3
	.word	0xcb26600c	! t1_kref+0x1564:   	st	%f5, [%i1 + 0xc]
	.word	0xb3b60ae4	! t1_kref+0x1568:   	fpsub32s	%f24, %f4, %f25
	.word	0xa73dc008	! t1_kref+0x156c:   	sra	%l7, %o0, %l3
	.word	0x93b68280	! t1_kref+0x1570:   	array32	%i2, %g0, %o1
	.word	0x81830000	! t1_kref+0x1574:   	wr	%o4, %g0, %y
	.word	0x90032a52	! t1_kref+0x1578:   	add	%o4, 0xa52, %o0
	.word	0x9da80044	! t1_kref+0x157c:   	fmovdn	%fcc0, %f4, %f14
	.word	0xae92308d	! t1_kref+0x1580:   	orcc	%o0, -0xf73, %l7
	.word	0xaba01a54	! t1_kref+0x1584:   	fdtoi	%f20, %f21
	.word	0x20480008	! t1_kref+0x1588:   	bn,a,pt	%icc, _kref+0x15a8
	.word	0x93b34120	! t1_kref+0x158c:   	edge32n	%o5, %g0, %o1
	.word	0xae2d63b5	! t1_kref+0x1590:   	andn	%l5, 0x3b5, %l7
	.word	0xa9b585ca	! t1_kref+0x1594:   	fcmpeq32	%f22, %f10, %l4
	.word	0xadb204c6	! t1_kref+0x1598:   	fcmpne32	%f8, %f6, %l6
	.word	0xec48a03f	! t1_kref+0x159c:   	ldsb	[%g2 + 0x3f], %l6
	.word	0x37800006	! t1_kref+0x15a0:   	fbge,a	_kref+0x15b8
	.word	0x920aef48	! t1_kref+0x15a4:   	and	%o3, 0xf48, %o1
	.word	0xec7e2004	! t1_kref+0x15a8:   	swap	[%i0 + 4], %l6
	.word	0xcd1fbcd0	! t1_kref+0x15ac:   	ldd	[%fp - 0x330], %f6
	.word	0xc12e601c	! t1_kref+0x15b0:   	st	%fsr, [%i1 + 0x1c]
	.word	0xeb871018	! t1_kref+0x15b4:   	lda	[%i4 + %i0]0x80, %f21
	.word	0xd016401b	! t1_kref+0x15b8:   	lduh	[%i1 + %i3], %o0
	.word	0x33480002	! t1_kref+0x15bc:   	fbe,a,pt	%fcc0, _kref+0x15c4
	.word	0xd630a036	! t1_kref+0x15c0:   	sth	%o3, [%g2 + 0x36]
	call	SYM(t1_subr3)
	.word	0x9285000b	! t1_kref+0x15c8:   	addcc	%l4, %o3, %o1
	.word	0xc768a00f	! t1_kref+0x15cc:   	prefetch	%g2 + 0xf, 3
	.word	0xa852c015	! t1_kref+0x15d0:   	umul	%o3, %l5, %l4
	.word	0xd9bf1a58	! t1_kref+0x15d4:   	stda	%f12, [%i4 + %i0]0xd2
	.word	0xf1064000	! t1_kref+0x15d8:   	ld	[%i1], %f24
	.word	0xa1a0188d	! t1_kref+0x15dc:   	fitos	%f13, %f16
	.word	0x8da00523	! t1_kref+0x15e0:   	fsqrts	%f3, %f6
	.word	0xa1b68d40	! t1_kref+0x15e4:   	fnot1	%f26, %f16
	.word	0xeb68a0c1	! t1_kref+0x15e8:   	prefetch	%g2 + 0xc1, 21
	.word	0x85a01025	! t1_kref+0x15ec:   	fstox	%f5, %f2
	.word	0x99b20156	! t1_kref+0x15f0:   	edge32l	%o0, %l6, %o4
	.word	0x948376ea	! t1_kref+0x15f4:   	addcc	%o5, -0x916, %o2
	.word	0x91a60940	! t1_kref+0x15f8:   	fmuld	%f24, %f0, %f8
	.word	0x86102002	! t1_kref+0x15fc:   	mov	0x2, %g3
	.word	0x32800000	! t1_kref+0x1600:   	bne,a	_kref+0x1600
	.word	0x86a0e001	! t1_kref+0x1604:   	subcc	%g3, 1, %g3
	.word	0x85a01a44	! t1_kref+0x1608:   	fdtoi	%f4, %f2
	.word	0xaeba7cd6	! t1_kref+0x160c:   	xnorcc	%o1, -0x32a, %l7
	.word	0xd40e2015	! t1_kref+0x1610:   	ldub	[%i0 + 0x15], %o2
	.word	0x99328008	! t1_kref+0x1614:   	srl	%o2, %o0, %o4
	.word	0x8da0002c	! t1_kref+0x1618:   	fmovs	%f12, %f6
	.word	0x23480001	! t1_kref+0x161c:   	fbne,a,pt	%fcc0, _kref+0x1620
	.word	0x97b54200	! t1_kref+0x1620:   	array8	%l5, %g0, %o3
	.word	0xd8f81019	! t1_kref+0x1624:   	swapa	[%g0 + %i1]0x80, %o4
	.word	0x9605bd0a	! t1_kref+0x1628:   	add	%l6, -0x2f6, %o3
	.word	0xd0080018	! t1_kref+0x162c:   	ldub	[%g0 + %i0], %o0
	.word	0xe856201e	! t1_kref+0x1630:   	ldsh	[%i0 + 0x1e], %l4
	.word	0xee7e401c	! t1_kref+0x1634:   	swap	[%i1 + %i4], %l7
	.word	0x81a88a48	! t1_kref+0x1638:   	fcmpd	%fcc0, %f2, %f8
	.word	0x9605c013	! t1_kref+0x163c:   	add	%l7, %l3, %o3
	.word	0x97b58157	! t1_kref+0x1640:   	edge32l	%l6, %l7, %o3
	.word	0x92bd3ca3	! t1_kref+0x1644:   	xnorcc	%l4, -0x35d, %o1
	.word	0x36480002	! t1_kref+0x1648:   	bge,a,pt	%icc, _kref+0x1650
	.word	0xa1a01a52	! t1_kref+0x164c:   	fdtoi	%f18, %f16
	.word	0xaafd800d	! t1_kref+0x1650:   	sdivcc	%l6, %o5, %l5
	.word	0xa9b6c354	! t1_kref+0x1654:   	alignaddrl	%i3, %l4, %l4
	.word	0xb1a589d2	! t1_kref+0x1658:   	fdivd	%f22, %f18, %f24
	.word	0x81a588ce	! t1_kref+0x165c:   	fsubd	%f22, %f14, %f0
	.word	0x92a6c013	! t1_kref+0x1660:   	subcc	%i3, %l3, %o1
	.word	0x81abcaa6	! t1_kref+0x1664:   	fcmpes	%fcc0, %f15, %f6
	.word	0xaf400000	! t1_kref+0x1668:   	mov	%y, %l7
	.word	0xe9be5a5b	! t1_kref+0x166c:   	stda	%f20, [%i1 + %i3]0xd2
	.word	0xea78a03c	! t1_kref+0x1670:   	swap	[%g2 + 0x3c], %l5
	.word	0xafb3016d	! t1_kref+0x1674:   	edge32ln	%o4, %o5, %l7
	.word	0x992de006	! t1_kref+0x1678:   	sll	%l7, 0x6, %o4
	.word	0x91b407c2	! t1_kref+0x167c:   	pdist	%f16, %f2, %f8
	.word	0xc568a00c	! t1_kref+0x1680:   	prefetch	%g2 + 0xc, 2
	.word	0xb5a408c2	! t1_kref+0x1684:   	fsubd	%f16, %f2, %f26
	.word	0xa875fc73	! t1_kref+0x1688:   	udiv	%l7, -0x38d, %l4
	.word	0xb3b50a2e	! t1_kref+0x168c:   	fpadd16s	%f20, %f14, %f25
	.word	0xf6263ff0	! t1_kref+0x1690:   	st	%i3, [%i0 - 0x10]
	.word	0x38800002	! t1_kref+0x1694:   	bgu,a	_kref+0x169c
	.word	0xea28a00f	! t1_kref+0x1698:   	stb	%l5, [%g2 + 0xf]
	.word	0xa8fa8015	! t1_kref+0x169c:   	sdivcc	%o2, %l5, %l4
	.word	0x99b38f44	! t1_kref+0x16a0:   	fornot1	%f14, %f4, %f12
	.word	0x963dc000	! t1_kref+0x16a4:   	not	%l7, %o3
	.word	0xa5ab8025	! t1_kref+0x16a8:   	fmovsule	%fcc0, %f5, %f18
	.word	0x96d5ee9b	! t1_kref+0x16ac:   	umulcc	%l7, 0xe9b, %o3
	.word	0xdb067ff4	! t1_kref+0x16b0:   	ld	[%i1 - 0xc], %f13
	.word	0xd51fbdd8	! t1_kref+0x16b4:   	ldd	[%fp - 0x228], %f10
	.word	0x992234b2	! t1_kref+0x16b8:   	mulscc	%o0, -0xb4e, %o4
	.word	0x9202b24f	! t1_kref+0x16bc:   	add	%o2, -0xdb1, %o1
	.word	0xe4086218	! t1_kref+0x16c0:   	ldub	[%g1 + 0x218], %l2
	.word	0xa41ca00c	! t1_kref+0x16c4:   	xor	%l2, 0xc, %l2
	.word	0xe4286218	! t1_kref+0x16c8:   	stb	%l2, [%g1 + 0x218]
	.word	0x81d86218	! t1_kref+0x16cc:   	flush	%g1 + 0x218
	.word	0x9625be70	! t1_kref+0x16d0:   	sub	%l6, -0x190, %o3
	.word	0x89a01a52	! t1_kref+0x16d4:   	fdtoi	%f18, %f4
	.word	0x993ea012	! t1_kref+0x16d8:   	sra	%i2, 0x12, %o4
	.word	0x92734016	! t1_kref+0x16dc:   	udiv	%o5, %l6, %o1
	.word	0xd7063fe0	! t1_kref+0x16e0:   	ld	[%i0 - 0x20], %f11
	.word	0x81ac0a32	! t1_kref+0x16e4:   	fcmps	%fcc0, %f16, %f18
	.word	0xacf0000a	! t1_kref+0x16e8:   	udivcc	%g0, %o2, %l6
	.word	0xafa64924	! t1_kref+0x16ec:   	fmuls	%f25, %f4, %f23
	.word	0xaa252ba3	! t1_kref+0x16f0:   	sub	%l4, 0xba3, %l5
	.word	0xd87e4000	! t1_kref+0x16f4:   	swap	[%i1], %o4
	.word	0x94ae8016	! t1_kref+0x16f8:   	andncc	%i2, %l6, %o2
2:	.word	0xae45f297	! t1_kref+0x16fc:   	addc	%l7, -0xd69, %l7
	.word	0x97b5c009	! t1_kref+0x1700:   	edge8	%l7, %o1, %o3
	.word	0xa1b5872a	! t1_kref+0x1704:   	fmuld8ulx16	%f22, %f10, %f16
	.word	0xaa72800a	! t1_kref+0x1708:   	udiv	%o2, %o2, %l5
	.word	0xc1be5a5b	! t1_kref+0x170c:   	stda	%f0, [%i1 + %i3]0xd2
	.word	0x24800006	! t1_kref+0x1710:   	ble,a	_kref+0x1728
	.word	0xa1b60ad8	! t1_kref+0x1714:   	fpsub32	%f24, %f24, %f16
	.word	0xa5b60ea0	! t1_kref+0x1718:   	fsrc1s	%f24, %f18
	.word	0x90756579	! t1_kref+0x171c:   	udiv	%l5, 0x579, %o0
	.word	0x24480007	! t1_kref+0x1720:   	ble,a,pt	%icc, _kref+0x173c
	.word	0x93a00033	! t1_kref+0x1724:   	fmovs	%f19, %f9
	.word	0x21800006	! t1_kref+0x1728:   	fbn,a	_kref+0x1740
	.word	0x9624c013	! t1_kref+0x172c:   	sub	%l3, %l3, %o3
	.word	0x99b30746	! t1_kref+0x1730:   	fpack32	%f12, %f6, %f12
	.word	0x91418000	! t1_kref+0x1734:   	mov	%fprs, %o0
	.word	0xe668a035	! t1_kref+0x1738:   	ldstub	[%g2 + 0x35], %l3
	.word	0x97b007ae	! t1_kref+0x173c:   	fpackfix	%f14, %f11
	.word	0x95a188d2	! t1_kref+0x1740:   	fsubd	%f6, %f18, %f10
	.word	0xe07f0019	! t1_kref+0x1744:   	swap	[%i4 + %i1], %l0
	.word	0x81580000	! t1_kref+0x1748:   	flushw
	.word	0x81ab0ac2	! t1_kref+0x174c:   	fcmped	%fcc0, %f12, %f2
	.word	0x9222b49c	! t1_kref+0x1750:   	sub	%o2, -0xb64, %o1
	.word	0xe27e4000	! t1_kref+0x1754:   	swap	[%i1], %l1
	.word	0xae84ea88	! t1_kref+0x1758:   	addcc	%l3, 0xa88, %l7
	.word	0xd67e600c	! t1_kref+0x175c:   	swap	[%i1 + 0xc], %o3
	.word	0xe13f4019	! t1_kref+0x1760:   	std	%f16, [%i5 + %i1]
	.word	0x97b2ca24	! t1_kref+0x1764:   	fpadd16s	%f11, %f4, %f11
	.word	0x97a10838	! t1_kref+0x1768:   	fadds	%f4, %f24, %f11
	.word	0xd668a036	! t1_kref+0x176c:   	ldstub	[%g2 + 0x36], %o3
	.word	0x9683000c	! t1_kref+0x1770:   	addcc	%o4, %o4, %o3
	.word	0xc7062008	! t1_kref+0x1774:   	ld	[%i0 + 8], %f3
	.word	0xae9a8009	! t1_kref+0x1778:   	xorcc	%o2, %o1, %l7
	.word	0x99b507c4	! t1_kref+0x177c:   	pdist	%f20, %f4, %f12
	.word	0xae1d0014	! t1_kref+0x1780:   	xor	%l4, %l4, %l7
	.word	0x92750009	! t1_kref+0x1784:   	udiv	%l4, %o1, %o1
	.word	0x9926c016	! t1_kref+0x1788:   	mulscc	%i3, %l6, %o4
	.word	0x96a54008	! t1_kref+0x178c:   	subcc	%l5, %o0, %o3
	.word	0xa686ab50	! t1_kref+0x1790:   	addcc	%i2, 0xb50, %l3
	.word	0xacf3001a	! t1_kref+0x1794:   	udivcc	%o4, %i2, %l6
	.word	0x85a00021	! t1_kref+0x1798:   	fmovs	%f1, %f2
	.word	0x941a31e8	! t1_kref+0x179c:   	xor	%o0, -0xe18, %o2
	.word	0xaabab1de	! t1_kref+0x17a0:   	xnorcc	%o2, -0xe22, %l5
	.word	0x98bd4014	! t1_kref+0x17a4:   	xnorcc	%l5, %l4, %o4
	.word	0xa8fd0014	! t1_kref+0x17a8:   	sdivcc	%l4, %l4, %l4
	.word	0xa8d82111	! t1_kref+0x17ac:   	smulcc	%g0, 0x111, %l4
	.word	0x9fa00039	! t1_kref+0x17b0:   	fmovs	%f25, %f15
	.word	0xa67b671a	! t1_kref+0x17b4:   	sdiv	%o5, 0x71a, %l3
	.word	0xa5b38c82	! t1_kref+0x17b8:   	fandnot2	%f14, %f2, %f18
	sethi	%hi(2f), %o7
	.word	0xe40be3f0	! t1_kref+0x17c0:   	ldub	[%o7 + 0x3f0], %l2
	.word	0xa41ca00c	! t1_kref+0x17c4:   	xor	%l2, 0xc, %l2
	.word	0xe42be3f0	! t1_kref+0x17c8:   	stb	%l2, [%o7 + 0x3f0]
	.word	0x81dbe3f0	! t1_kref+0x17cc:   	flush	%o7 + 0x3f0
	.word	0x85b58c4c	! t1_kref+0x17d0:   	fnor	%f22, %f12, %f2
	.word	0x953ce01a	! t1_kref+0x17d4:   	sra	%l3, 0x1a, %o2
	.word	0x9fc10000	! t1_kref+0x17d8:   	call	%g4
	.word	0xdd1e2010	! t1_kref+0x17dc:   	ldd	[%i0 + 0x10], %f14
	.word	0xa8fa3834	! t1_kref+0x17e0:   	sdivcc	%o0, -0x7cc, %l4
	.word	0xd4100018	! t1_kref+0x17e4:   	lduh	[%g0 + %i0], %o2
	.word	0x94937592	! t1_kref+0x17e8:   	orcc	%o5, -0xa6e, %o2
	.word	0xe968a08a	! t1_kref+0x17ec:   	prefetch	%g2 + 0x8a, 20
2:	.word	0x8da00538	! t1_kref+0x17f0:   	fsqrts	%f24, %f6
	.word	0xae05001a	! t1_kref+0x17f4:   	add	%l4, %i2, %l7
	.word	0x3c800008	! t1_kref+0x17f8:   	bpos,a	_kref+0x1818
	.word	0x99a009ce	! t1_kref+0x17fc:   	fdivd	%f0, %f14, %f12
	.word	0x91b10d96	! t1_kref+0x1800:   	fxor	%f4, %f22, %f8
	.word	0xb3a64939	! t1_kref+0x1804:   	fmuls	%f25, %f25, %f25
	.word	0xaaa37114	! t1_kref+0x1808:   	subcc	%o5, -0xeec, %l5
	.word	0x94182362	! t1_kref+0x180c:   	xor	%g0, 0x362, %o2
	.word	0xc3ee101b	! t1_kref+0x1810:   	prefetcha	%i0 + %i3, 1
	.word	0x28800003	! t1_kref+0x1814:   	bleu,a	_kref+0x1820
	.word	0xea0e0000	! t1_kref+0x1818:   	ldub	[%i0], %l5
	.word	0xaea5801a	! t1_kref+0x181c:   	subcc	%l6, %i2, %l7
	.word	0x81580000	! t1_kref+0x1820:   	flushw
	.word	0x9fa01a42	! t1_kref+0x1824:   	fdtoi	%f2, %f15
	.word	0xe3b8a100	! t1_kref+0x1828:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0x87a00033	! t1_kref+0x182c:   	fmovs	%f19, %f3
	.word	0x94d5800c	! t1_kref+0x1830:   	umulcc	%l6, %o4, %o2
	.word	0x29800003	! t1_kref+0x1834:   	fbl,a	_kref+0x1840
	.word	0x89a1c9a8	! t1_kref+0x1838:   	fdivs	%f7, %f8, %f4
	.word	0xaa0039f6	! t1_kref+0x183c:   	add	%g0, -0x60a, %l5
	.word	0x943b001a	! t1_kref+0x1840:   	xnor	%o4, %i2, %o2
	.word	0xaca6e21e	! t1_kref+0x1844:   	subcc	%i3, 0x21e, %l6
	.word	0x9285a336	! t1_kref+0x1848:   	addcc	%l6, 0x336, %o1
	.word	0xd078a00c	! t1_kref+0x184c:   	swap	[%g2 + 0xc], %o0
	.word	0x91aa004c	! t1_kref+0x1850:   	fmovda	%fcc0, %f12, %f8
	.word	0x9f414000	! t1_kref+0x1854:   	mov	%pc, %o7
	.word	0xd4965000	! t1_kref+0x1858:   	lduha	[%i1]0x80, %o2
	.word	0x99b009a4	! t1_kref+0x185c:   	fexpand	%f4, %f12
	.word	0xa6aefdf1	! t1_kref+0x1860:   	andncc	%i3, -0x20f, %l3
	.word	0xb1a509b3	! t1_kref+0x1864:   	fdivs	%f20, %f19, %f24
	.word	0xf42e7fed	! t1_kref+0x1868:   	stb	%i2, [%i1 - 0x13]
	.word	0xa8e22eb4	! t1_kref+0x186c:   	subccc	%o0, 0xeb4, %l4
	.word	0xb1a000d4	! t1_kref+0x1870:   	fnegd	%f20, %f24
	.word	0xe968a04e	! t1_kref+0x1874:   	prefetch	%g2 + 0x4e, 20
	.word	0x89a01888	! t1_kref+0x1878:   	fitos	%f8, %f4
	.word	0x1337b19e	! t1_kref+0x187c:   	sethi	%hi(0xdec67800), %o1
	.word	0xa1b08754	! t1_kref+0x1880:   	fpack32	%f2, %f20, %f16
	.word	0x929efae4	! t1_kref+0x1884:   	xorcc	%i3, -0x51c, %o1
	.word	0xa7b30240	! t1_kref+0x1888:   	array16	%o4, %g0, %l3
	.word	0xdaa6101c	! t1_kref+0x188c:   	sta	%o5, [%i0 + %i4]0x80
	.word	0x9422b52a	! t1_kref+0x1890:   	sub	%o2, -0xad6, %o2
	.word	0xac30000c	! t1_kref+0x1894:   	orn	%g0, %o4, %l6
	.word	0x91b2858e	! t1_kref+0x1898:   	fcmpgt32	%f10, %f14, %o0
	.word	0x26800004	! t1_kref+0x189c:   	bl,a	_kref+0x18ac
	.word	0xadb18ee1	! t1_kref+0x18a0:   	fornot2s	%f6, %f1, %f22
	.word	0xd5200018	! t1_kref+0x18a4:   	st	%f10, [%g0 + %i0]
	.word	0x983d8000	! t1_kref+0x18a8:   	not	%l6, %o4
	.word	0x9266801a	! t1_kref+0x18ac:   	subc	%i2, %i2, %o1
	.word	0xec3e4000	! t1_kref+0x18b0:   	std	%l6, [%i1]
	.word	0xec3e401d	! t1_kref+0x18b4:   	std	%l6, [%i1 + %i5]
	.word	0x95b18aee	! t1_kref+0x18b8:   	fpsub32s	%f6, %f14, %f10
	.word	0xe3b8a100	! t1_kref+0x18bc:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0x98954000	! t1_kref+0x18c0:   	orcc	%l5, %g0, %o4
	.word	0xa8fb4015	! t1_kref+0x18c4:   	sdivcc	%o5, %l5, %l4
	.word	0x95a00144	! t1_kref+0x18c8:   	fabsd	%f4, %f10
	.word	0x33480003	! t1_kref+0x18cc:   	fbe,a,pt	%fcc0, _kref+0x18d8
	.word	0x9770000a	! t1_kref+0x18d0:   	popc	%o2, %o3
	.word	0x85a489d4	! t1_kref+0x18d4:   	fdivd	%f18, %f20, %f2
	.word	0xa9418000	! t1_kref+0x18d8:   	mov	%fprs, %l4
	.word	0x81834000	! t1_kref+0x18dc:   	wr	%o5, %g0, %y
	.word	0xd83e2018	! t1_kref+0x18e0:   	std	%o4, [%i0 + 0x18]
	.word	0xc5180019	! t1_kref+0x18e4:   	ldd	[%g0 + %i1], %f2
	.word	0x89b00770	! t1_kref+0x18e8:   	fpack16	%f16, %f4
	.word	0xab05c013	! t1_kref+0x18ec:   	taddcc	%l7, %l3, %l5
	.word	0x8143e059	! t1_kref+0x18f0:   	membar	0x59
	.word	0xb1b10e0a	! t1_kref+0x18f4:   	fand	%f4, %f10, %f24
	.word	0x21800008	! t1_kref+0x18f8:   	fbn,a	_kref+0x1918
	.word	0x9da0190d	! t1_kref+0x18fc:   	fitod	%f13, %f14
	.word	0x81aa4a2a	! t1_kref+0x1900:   	fcmps	%fcc0, %f9, %f10
	.word	0xcb262004	! t1_kref+0x1904:   	st	%f5, [%i0 + 4]
	.word	0xa6968009	! t1_kref+0x1908:   	orcc	%i2, %o1, %l3
	.word	0x8db187cc	! t1_kref+0x190c:   	pdist	%f6, %f12, %f6
	.word	0x94fd400a	! t1_kref+0x1910:   	sdivcc	%l5, %o2, %o2
	.word	0x81a98a4a	! t1_kref+0x1914:   	fcmpd	%fcc0, %f6, %f10
	.word	0x36480007	! t1_kref+0x1918:   	bge,a,pt	%icc, _kref+0x1934
	.word	0xa8734013	! t1_kref+0x191c:   	udiv	%o5, %l3, %l4
	.word	0x8fb0cd3a	! t1_kref+0x1920:   	fandnot1s	%f3, %f26, %f7
	.word	0x98dec00b	! t1_kref+0x1924:   	smulcc	%i3, %o3, %o4
	.word	0xa7b005c4	! t1_kref+0x1928:   	fcmpeq32	%f0, %f4, %l3
	.word	0x9f414000	! t1_kref+0x192c:   	mov	%pc, %o7
	.word	0x81ad8a46	! t1_kref+0x1930:   	fcmpd	%fcc0, %f22, %f6
	.word	0x9533401b	! t1_kref+0x1934:   	srl	%o5, %i3, %o2
	.word	0xa682c000	! t1_kref+0x1938:   	addcc	%o3, %g0, %l3
	.word	0xa6a26fdb	! t1_kref+0x193c:   	subcc	%o1, 0xfdb, %l3
	.word	0xf4380019	! t1_kref+0x1940:   	std	%i2, [%g0 + %i1]
	.word	0xab40c000	! t1_kref+0x1944:   	mov	%asi, %l5
	.word	0x9fb00fe0	! t1_kref+0x1948:   	fones	%f15
	.word	0x26800006	! t1_kref+0x194c:   	bl,a	_kref+0x1964
	.word	0xa3a28932	! t1_kref+0x1950:   	fmuls	%f10, %f18, %f17
	.word	0x96b22b6d	! t1_kref+0x1954:   	orncc	%o0, 0xb6d, %o3
	.word	0x91b5c308	! t1_kref+0x1958:   	alignaddr	%l7, %o0, %o0
	.word	0xa5a01911	! t1_kref+0x195c:   	fitod	%f17, %f18
	.word	0xc9be1897	! t1_kref+0x1960:   	stda	%f4, [%i0 + %l7]0xc4
	.word	0x87a0188e	! t1_kref+0x1964:   	fitos	%f14, %f3
	.word	0x3a800004	! t1_kref+0x1968:   	bcc,a	_kref+0x1978
	.word	0x81580000	! t1_kref+0x196c:   	flushw
	.word	0xe46e0000	! t1_kref+0x1970:   	ldstub	[%i0], %l2
	.word	0xe80e8018	! t1_kref+0x1974:   	ldub	[%i2 + %i0], %l4
	.word	0x81580000	! t1_kref+0x1978:   	flushw
	.word	0x96d3001a	! t1_kref+0x197c:   	umulcc	%o4, %i2, %o3
	.word	0x9332600b	! t1_kref+0x1980:   	srl	%o1, 0xb, %o1
	.word	0xc1be588a	! t1_kref+0x1984:   	stda	%f0, [%i1 + %o2]0xc4
	.word	0x83a04821	! t1_kref+0x1988:   	fadds	%f1, %f1, %f1
	.word	0x86102009	! t1_kref+0x198c:   	mov	0x9, %g3
	.word	0x86a0e001	! t1_kref+0x1990:   	subcc	%g3, 1, %g3
	.word	0x22800011	! t1_kref+0x1994:   	be,a	_kref+0x19d8
	.word	0xf5262008	! t1_kref+0x1998:   	st	%f26, [%i0 + 8]
	.word	0x99b304ca	! t1_kref+0x199c:   	fcmpne32	%f12, %f10, %o4
	.word	0x92fd401b	! t1_kref+0x19a0:   	sdivcc	%l5, %i3, %o1
	.word	0x27800004	! t1_kref+0x19a4:   	fbul,a	_kref+0x19b4
	.word	0xc93e4000	! t1_kref+0x19a8:   	std	%f4, [%i1]
	.word	0x91b3c6aa	! t1_kref+0x19ac:   	fmul8x16al	%f15, %f10, %f8
	.word	0xb5a188ce	! t1_kref+0x19b0:   	fsubd	%f6, %f14, %f26
	.word	0x92a4fd3b	! t1_kref+0x19b4:   	subcc	%l3, -0x2c5, %o1
	.word	0xed1fbc10	! t1_kref+0x19b8:   	ldd	[%fp - 0x3f0], %f22
	.word	0x96328008	! t1_kref+0x19bc:   	orn	%o2, %o0, %o3
	.word	0x91a50842	! t1_kref+0x19c0:   	faddd	%f20, %f2, %f8
	.word	0x8fb00c20	! t1_kref+0x19c4:   	fzeros	%f7
	.word	0xa7a00129	! t1_kref+0x19c8:   	fabss	%f9, %f19
	.word	0x81a88ac8	! t1_kref+0x19cc:   	fcmped	%fcc0, %f2, %f8
	.word	0xc020a024	! t1_kref+0x19d0:   	clr	[%g2 + 0x24]
	.word	0xafa0052f	! t1_kref+0x19d4:   	fsqrts	%f15, %f23
	.word	0x2b1852b2	! t1_kref+0x19d8:   	sethi	%hi(0x614ac800), %l5
	.word	0xc9067fe0	! t1_kref+0x19dc:   	ld	[%i1 - 0x20], %f4
	.word	0x949a4016	! t1_kref+0x19e0:   	xorcc	%o1, %l6, %o2
	.word	0xa7a5c830	! t1_kref+0x19e4:   	fadds	%f23, %f16, %f19
	.word	0xaa328017	! t1_kref+0x19e8:   	orn	%o2, %l7, %l5
	call	1f
	.empty
	.word	0xec0e6001	! t1_kref+0x19f0:   	ldub	[%i1 + 1], %l6
	.word	0xda30a006	! t1_kref+0x19f4:   	sth	%o5, [%g2 + 6]
	.word	0x989b4013	! t1_kref+0x19f8:   	xorcc	%o5, %l3, %o4
	.word	0xa9b1044c	! t1_kref+0x19fc:   	fcmpne16	%f4, %f12, %l4
	.word	0xa61dc00a	! t1_kref+0x1a00:   	xor	%l7, %o2, %l3
	.word	0x969b3d3c	! t1_kref+0x1a04:   	xorcc	%o4, -0x2c4, %o3
1:	.word	0xa1a18d24	! t1_kref+0x1a08:   	fsmuld	%f6, %f4, %f16
	.word	0xd51fbf58	! t1_kref+0x1a0c:   	ldd	[%fp - 0xa8], %f10
	.word	0x2d20859b	! t1_kref+0x1a10:   	sethi	%hi(0x82166c00), %l6
	.word	0xacaa400b	! t1_kref+0x1a14:   	andncc	%o1, %o3, %l6
	.word	0xa83ac000	! t1_kref+0x1a18:   	not	%o3, %l4
	.word	0x81aa8aad	! t1_kref+0x1a1c:   	fcmpes	%fcc0, %f10, %f13
	.word	0x9db50e80	! t1_kref+0x1a20:   	fsrc1	%f20, %f14
	.word	0xa9b08548	! t1_kref+0x1a24:   	fcmpeq16	%f2, %f8, %l4
	.word	0xa8acc01a	! t1_kref+0x1a28:   	andncc	%l3, %i2, %l4
	.word	0x909af53b	! t1_kref+0x1a2c:   	xorcc	%o3, -0xac5, %o0
	.word	0x2d480006	! t1_kref+0x1a30:   	fbg,a,pt	%fcc0, _kref+0x1a48
	.word	0xdd3e6008	! t1_kref+0x1a34:   	std	%f14, [%i1 + 8]
	.word	0x24800002	! t1_kref+0x1a38:   	ble,a	_kref+0x1a40
	.word	0xaa9e8013	! t1_kref+0x1a3c:   	xorcc	%i2, %l3, %l5
	.word	0x85a4482d	! t1_kref+0x1a40:   	fadds	%f17, %f13, %f2
	.word	0x8143c000	! t1_kref+0x1a44:   	stbar
	.word	0x90c6801a	! t1_kref+0x1a48:   	addccc	%i2, %i2, %o0
	.word	0x81ad4aae	! t1_kref+0x1a4c:   	fcmpes	%fcc0, %f21, %f14
	.word	0xaf0b7c49	! t1_kref+0x1a50:   	tsubcc	%o5, -0x3b7, %l7
	.word	0xf51fbdc0	! t1_kref+0x1a54:   	ldd	[%fp - 0x240], %f26
	.word	0xd7e6101a	! t1_kref+0x1a58:   	casa	[%i0]0x80, %i2, %o3
	.word	0x9722e8e3	! t1_kref+0x1a5c:   	mulscc	%o3, 0x8e3, %o3
	.word	0x3c800007	! t1_kref+0x1a60:   	bpos,a	_kref+0x1a7c
	.word	0x91a649b7	! t1_kref+0x1a64:   	fdivs	%f25, %f23, %f8
	.word	0x95a209ce	! t1_kref+0x1a68:   	fdivd	%f8, %f14, %f10
	.word	0x85a01088	! t1_kref+0x1a6c:   	fxtos	%f8, %f2
	.word	0xada589c2	! t1_kref+0x1a70:   	fdivd	%f22, %f2, %f22
	.word	0x91358015	! t1_kref+0x1a74:   	srl	%l6, %l5, %o0
	.word	0x3a800008	! t1_kref+0x1a78:   	bcc,a	_kref+0x1a98
	.word	0xada34d37	! t1_kref+0x1a7c:   	fsmuld	%f13, %f23, %f22
	.word	0x2e800002	! t1_kref+0x1a80:   	bvs,a	_kref+0x1a88
	.word	0xdd1863a0	! t1_kref+0x1a84:   	ldd	[%g1 + 0x3a0], %f14
	.word	0x92aa36ab	! t1_kref+0x1a88:   	andncc	%o0, -0x955, %o1
	.word	0x8da0190d	! t1_kref+0x1a8c:   	fitod	%f13, %f6
	.word	0xe11fbce8	! t1_kref+0x1a90:   	ldd	[%fp - 0x318], %f16
	.word	0x98fea0bd	! t1_kref+0x1a94:   	sdivcc	%i2, 0xbd, %o4
	.word	0x90430000	! t1_kref+0x1a98:   	addc	%o4, %g0, %o0
	.word	0x29330be7	! t1_kref+0x1a9c:   	sethi	%hi(0xcc2f9c00), %l4
	.word	0x85b5073a	! t1_kref+0x1aa0:   	fmuld8ulx16	%f20, %f26, %f2
	.word	0xec16200a	! t1_kref+0x1aa4:   	lduh	[%i0 + 0xa], %l6
	.word	0xf207bfe0	! t1_kref+0x1aa8:   	ld	[%fp - 0x20], %i1
	.word	0x9422fd94	! t1_kref+0x1aac:   	sub	%o3, -0x26c, %o2
	.word	0xb3b5cea0	! t1_kref+0x1ab0:   	fsrc1s	%f23, %f25
	.word	0x95a549b0	! t1_kref+0x1ab4:   	fdivs	%f21, %f16, %f10
	.word	0x25800002	! t1_kref+0x1ab8:   	fblg,a	_kref+0x1ac0
	.word	0xda26401c	! t1_kref+0x1abc:   	st	%o5, [%i1 + %i4]
	.word	0x91a688c2	! t1_kref+0x1ac0:   	fsubd	%f26, %f2, %f8
	.word	0x8db40a56	! t1_kref+0x1ac4:   	fpadd32	%f16, %f22, %f6
	.word	0x97302005	! t1_kref+0x1ac8:   	srl	%g0, 0x5, %o3
	.word	0xda20a024	! t1_kref+0x1acc:   	st	%o5, [%g2 + 0x24]
	.word	0x85a6094e	! t1_kref+0x1ad0:   	fmuld	%f24, %f14, %f2
	.word	0xe600a004	! t1_kref+0x1ad4:   	ld	[%g2 + 4], %l3
	.word	0xd4fe101c	! t1_kref+0x1ad8:   	swapa	[%i0 + %i4]0x80, %o2
	.word	0xac24c01b	! t1_kref+0x1adc:   	sub	%l3, %i3, %l6
	.word	0xd220a00c	! t1_kref+0x1ae0:   	st	%o1, [%g2 + 0xc]
	.word	0xaeadbb47	! t1_kref+0x1ae4:   	andncc	%l6, -0x4b9, %l7
	.word	0xc168a04a	! t1_kref+0x1ae8:   	prefetch	%g2 + 0x4a, 0
	.word	0x98a37dbb	! t1_kref+0x1aec:   	subcc	%o5, -0x245, %o4
	.word	0x81ad4ab2	! t1_kref+0x1af0:   	fcmpes	%fcc0, %f21, %f18
	.word	0x94f27dd7	! t1_kref+0x1af4:   	udivcc	%o1, -0x229, %o2
	.word	0x81def140	! t1_kref+0x1af8:   	flush	%i3 - 0xec0
	.word	0xee563fec	! t1_kref+0x1afc:   	ldsh	[%i0 - 0x14], %l7
	.word	0x94053b86	! t1_kref+0x1b00:   	add	%l4, -0x47a, %o2
	.word	0xc51fbde0	! t1_kref+0x1b04:   	ldd	[%fp - 0x220], %f2
	.word	0xcb26600c	! t1_kref+0x1b08:   	st	%f5, [%i1 + 0xc]
	.word	0xa5b00c20	! t1_kref+0x1b0c:   	fzeros	%f18
	.word	0x81ad0a58	! t1_kref+0x1b10:   	fcmpd	%fcc0, %f20, %f24
	.word	0xf007bfe0	! t1_kref+0x1b14:   	ld	[%fp - 0x20], %i0
	.word	0x90ad2487	! t1_kref+0x1b18:   	andncc	%l4, 0x487, %o0
	.word	0xc0b01018	! t1_kref+0x1b1c:   	stha	%g0, [%g0 + %i0]0x80
	.word	0xb1b28ee5	! t1_kref+0x1b20:   	fornot2s	%f10, %f5, %f24
	.word	0xaa7da1eb	! t1_kref+0x1b24:   	sdiv	%l6, 0x1eb, %l5
	.word	0x97b4cea0	! t1_kref+0x1b28:   	fsrc1s	%f19, %f11
	.word	0x27800004	! t1_kref+0x1b2c:   	fbul,a	_kref+0x1b3c
	.word	0x81580000	! t1_kref+0x1b30:   	flushw
	.word	0xa785a5b9	! t1_kref+0x1b34:   	wr	%l6, 0x5b9, %gsr
	.word	0xadb5035b	! t1_kref+0x1b38:   	alignaddrl	%l4, %i3, %l6
	.word	0xd2080019	! t1_kref+0x1b3c:   	ldub	[%g0 + %i1], %o1
	.word	0xae02a482	! t1_kref+0x1b40:   	add	%o2, 0x482, %l7
	.word	0x9884c00b	! t1_kref+0x1b44:   	addcc	%l3, %o3, %o4
	.word	0xd4fe501c	! t1_kref+0x1b48:   	swapa	[%i1 + %i4]0x80, %o2
	.word	0xac0a4009	! t1_kref+0x1b4c:   	and	%o1, %o1, %l6
	.word	0xa5b68f58	! t1_kref+0x1b50:   	fornot1	%f26, %f24, %f18
	.word	0xaf2569cc	! t1_kref+0x1b54:   	mulscc	%l5, 0x9cc, %l7
	.word	0x95b60410	! t1_kref+0x1b58:   	fcmple16	%f24, %f16, %o2
	.word	0xadb00fe0	! t1_kref+0x1b5c:   	fones	%f22
	.word	0x92833e0c	! t1_kref+0x1b60:   	addcc	%o4, -0x1f4, %o1
	.word	0x902aa449	! t1_kref+0x1b64:   	andn	%o2, 0x449, %o0
	.word	0xa6da001b	! t1_kref+0x1b68:   	smulcc	%o0, %i3, %l3
	.word	0xabb58548	! t1_kref+0x1b6c:   	fcmpeq16	%f22, %f8, %l5
	.word	0xd256401b	! t1_kref+0x1b70:   	ldsh	[%i1 + %i3], %o1
	.word	0x98d3000a	! t1_kref+0x1b74:   	umulcc	%o4, %o2, %o4
	.word	0x2724f6e4	! t1_kref+0x1b78:   	sethi	%hi(0x93db9000), %l3
	.word	0x2b800004	! t1_kref+0x1b7c:   	fbug,a	_kref+0x1b8c
	.word	0xae1a000a	! t1_kref+0x1b80:   	xor	%o0, %o2, %l7
	.word	0x9fc00004	! t1_kref+0x1b84:   	call	%g0 + %g4
	.word	0xec3f4019	! t1_kref+0x1b88:   	std	%l6, [%i5 + %i1]
	.word	0x94fae186	! t1_kref+0x1b8c:   	sdivcc	%o3, 0x186, %o2
	.word	0x9622eade	! t1_kref+0x1b90:   	sub	%o3, 0xade, %o3
	.word	0x98dd4009	! t1_kref+0x1b94:   	smulcc	%l5, %o1, %o4
	.word	0xe906200c	! t1_kref+0x1b98:   	ld	[%i0 + 0xc], %f20
	.word	0x89a0188f	! t1_kref+0x1b9c:   	fitos	%f15, %f4
	.word	0x3e480008	! t1_kref+0x1ba0:   	bvc,a,pt	%icc, _kref+0x1bc0
	.word	0xe800a004	! t1_kref+0x1ba4:   	ld	[%g2 + 4], %l4
	.word	0xaa75bae3	! t1_kref+0x1ba8:   	udiv	%l6, -0x51d, %l5
	.word	0xa636c000	! t1_kref+0x1bac:   	orn	%i3, %g0, %l3
	.word	0xa1a0193a	! t1_kref+0x1bb0:   	fstod	%f26, %f16
	.word	0xd07e001c	! t1_kref+0x1bb4:   	swap	[%i0 + %i4], %o0
	.word	0xb3a000ae	! t1_kref+0x1bb8:   	fnegs	%f14, %f25
	.word	0xada30823	! t1_kref+0x1bbc:   	fadds	%f12, %f3, %f22
	.word	0x87b04af6	! t1_kref+0x1bc0:   	fpsub32s	%f1, %f22, %f3
	.word	0xe43f4018	! t1_kref+0x1bc4:   	std	%l2, [%i5 + %i0]
	.word	0x8184c000	! t1_kref+0x1bc8:   	wr	%l3, %g0, %y
	.word	0xac1ab625	! t1_kref+0x1bcc:   	xor	%o2, -0x9db, %l6
	.word	0x93b105cc	! t1_kref+0x1bd0:   	fcmpeq32	%f4, %f12, %o1
	.word	0xa6e5e75b	! t1_kref+0x1bd4:   	subccc	%l7, 0x75b, %l3
	.word	0xc398a0c0	! t1_kref+0x1bd8:   	ldda	[%g2 + 0xc0]%asi, %f32
	.word	0xabb5801a	! t1_kref+0x1bdc:   	edge8	%l6, %i2, %l5
	.word	0xd8901018	! t1_kref+0x1be0:   	lduha	[%g0 + %i0]0x80, %o4
	.word	0xae88001a	! t1_kref+0x1be4:   	andcc	%g0, %i2, %l7
	.word	0x9652bd0e	! t1_kref+0x1be8:   	umul	%o2, -0x2f2, %o3
	.word	0xe9be180d	! t1_kref+0x1bec:   	stda	%f20, [%i0 + %o5]0xc0
	.word	0xe3b8a100	! t1_kref+0x1bf0:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0x89a04d38	! t1_kref+0x1bf4:   	fsmuld	%f1, %f24, %f4
	.word	0x95a0104c	! t1_kref+0x1bf8:   	fdtox	%f12, %f10
	.word	0x90d8001b	! t1_kref+0x1bfc:   	smulcc	%g0, %i3, %o0
	.word	0xaf44c000	! t1_kref+0x1c00:   	mov	%gsr, %l7
	.word	0xe3b8a100	! t1_kref+0x1c04:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0xa6027d8e	! t1_kref+0x1c08:   	add	%o1, -0x272, %l3
	.word	0xa5a30927	! t1_kref+0x1c0c:   	fmuls	%f12, %f7, %f18
	.word	0xb3a00026	! t1_kref+0x1c10:   	fmovs	%f6, %f25
	.word	0x927ac00b	! t1_kref+0x1c14:   	sdiv	%o3, %o3, %o1
	.word	0xae1d0015	! t1_kref+0x1c18:   	xor	%l4, %l5, %l7
	.word	0xaafd636d	! t1_kref+0x1c1c:   	sdivcc	%l5, 0x36d, %l5
	.word	0x97b280f4	! t1_kref+0x1c20:   	edge16ln	%o2, %l4, %o3
	.word	0x81ad0a42	! t1_kref+0x1c24:   	fcmpd	%fcc0, %f20, %f2
	.word	0xd6d01018	! t1_kref+0x1c28:   	ldsha	[%g0 + %i0]0x80, %o3
	.word	0x20480002	! t1_kref+0x1c2c:   	bn,a,pt	%icc, _kref+0x1c34
	.word	0xaaadfd87	! t1_kref+0x1c30:   	andncc	%l7, -0x279, %l5
	.word	0x961d757c	! t1_kref+0x1c34:   	xor	%l5, -0xa84, %o3
	.word	0xaed5c000	! t1_kref+0x1c38:   	umulcc	%l7, %g0, %l7
	.word	0xada409cc	! t1_kref+0x1c3c:   	fdivd	%f16, %f12, %f22
	.word	0x81580000	! t1_kref+0x1c40:   	flushw
	.word	0x91a309ad	! t1_kref+0x1c44:   	fdivs	%f12, %f13, %f8
	.word	0x9da00528	! t1_kref+0x1c48:   	fsqrts	%f8, %f14
	.word	0xab44c000	! t1_kref+0x1c4c:   	mov	%gsr, %l5
	.word	0x92b23053	! t1_kref+0x1c50:   	orncc	%o0, -0xfad, %o1
	.word	0xc807bfe4	! t1_kref+0x1c54:   	ld	[%fp - 0x1c], %g4
	.word	0x9072686d	! t1_kref+0x1c58:   	udiv	%o1, 0x86d, %o0
	.word	0x28480003	! t1_kref+0x1c5c:   	bleu,a,pt	%icc, _kref+0x1c68
	.word	0xa87d4015	! t1_kref+0x1c60:   	sdiv	%l5, %l5, %l4
	.word	0xee0e401a	! t1_kref+0x1c64:   	ldub	[%i1 + %i2], %l7
	.word	0xc168a04e	! t1_kref+0x1c68:   	prefetch	%g2 + 0x4e, 0
	call	SYM(t1_subr0)
	.word	0xd6100018	! t1_kref+0x1c70:   	lduh	[%g0 + %i0], %o3
	.word	0xd9267fe0	! t1_kref+0x1c74:   	st	%f12, [%i1 - 0x20]
	.word	0xd416c018	! t1_kref+0x1c78:   	lduh	[%i3 + %i0], %o2
	.word	0x83b007b2	! t1_kref+0x1c7c:   	fpackfix	%f18, %f1
	.word	0x9fc00004	! t1_kref+0x1c80:   	call	%g0 + %g4
	.word	0x96da2335	! t1_kref+0x1c84:   	smulcc	%o0, 0x335, %o3
	.word	0x9252a20f	! t1_kref+0x1c88:   	umul	%o2, 0x20f, %o1
	.word	0xcb263fec	! t1_kref+0x1c8c:   	st	%f5, [%i0 - 0x14]
	.word	0xa9a01911	! t1_kref+0x1c90:   	fitod	%f17, %f20
	.word	0xd8270018	! t1_kref+0x1c94:   	st	%o4, [%i4 + %i0]
	.word	0x36800004	! t1_kref+0x1c98:   	bge,a	_kref+0x1ca8
	.word	0xe8563ff0	! t1_kref+0x1c9c:   	ldsh	[%i0 - 0x10], %l4
	.word	0xd616600a	! t1_kref+0x1ca0:   	lduh	[%i1 + 0xa], %o3
	.word	0xb3b00c20	! t1_kref+0x1ca4:   	fzeros	%f25
	.word	0xa72e800b	! t1_kref+0x1ca8:   	sll	%i2, %o3, %l3
	.word	0x94c6c00c	! t1_kref+0x1cac:   	addccc	%i3, %o4, %o2
	.word	0xe3b8a100	! t1_kref+0x1cb0:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0x1737ba97	! t1_kref+0x1cb4:   	sethi	%hi(0xdeea5c00), %o3
	.word	0x94856c6b	! t1_kref+0x1cb8:   	addcc	%l5, 0xc6b, %o2
	.word	0x9ba00526	! t1_kref+0x1cbc:   	fsqrts	%f6, %f13
	.word	0x9f414000	! t1_kref+0x1cc0:   	mov	%pc, %o7
	.word	0x3c800001	! t1_kref+0x1cc4:   	bpos,a	_kref+0x1cc8
	.word	0xa6b4c01a	! t1_kref+0x1cc8:   	orncc	%l3, %i2, %l3
	.word	0x81abca30	! t1_kref+0x1ccc:   	fcmps	%fcc0, %f15, %f16
	.word	0xaeb34013	! t1_kref+0x1cd0:   	orncc	%o5, %l3, %l7
	.word	0x9333600f	! t1_kref+0x1cd4:   	srl	%o5, 0xf, %o1
	.word	0x81aa0a2d	! t1_kref+0x1cd8:   	fcmps	%fcc0, %f8, %f13
	.word	0xa7a4c9a6	! t1_kref+0x1cdc:   	fdivs	%f19, %f6, %f19
	.word	0xa804e846	! t1_kref+0x1ce0:   	add	%l3, 0x846, %l4
	.word	0x95b18910	! t1_kref+0x1ce4:   	faligndata	%f6, %f16, %f10
	.word	0x91b2811b	! t1_kref+0x1ce8:   	edge32	%o2, %i3, %o0
	.word	0xa89ea37a	! t1_kref+0x1cec:   	xorcc	%i2, 0x37a, %l4
	.word	0x8fa01886	! t1_kref+0x1cf0:   	fitos	%f6, %f7
	.word	0xa722be3a	! t1_kref+0x1cf4:   	mulscc	%o2, -0x1c6, %l3
	.word	0xadb28408	! t1_kref+0x1cf8:   	fcmple16	%f10, %f8, %l6
	.word	0xa6fb3bbd	! t1_kref+0x1cfc:   	sdivcc	%o4, -0x443, %l3
	.word	0x95a589d4	! t1_kref+0x1d00:   	fdivd	%f22, %f20, %f10
	.word	0x38800003	! t1_kref+0x1d04:   	bgu,a	_kref+0x1d10
	.word	0xeaee101a	! t1_kref+0x1d08:   	ldstuba	[%i0 + %i2]0x80, %l5
	.word	0xdd981019	! t1_kref+0x1d0c:   	ldda	[%g0 + %i1]0x80, %f14
	.word	0xa7826f58	! t1_kref+0x1d10:   	wr	%o1, 0xf58, %gsr
	.word	0x91a01a58	! t1_kref+0x1d14:   	fdtoi	%f24, %f8
	.word	0x2f271a1e	! t1_kref+0x1d18:   	sethi	%hi(0x9c687800), %l7
	.word	0xf5a6501c	! t1_kref+0x1d1c:   	sta	%f26, [%i1 + %i4]0x80
	.word	0xe3b8a100	! t1_kref+0x1d20:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0xee10a03c	! t1_kref+0x1d24:   	lduh	[%g2 + 0x3c], %l7
	.word	0xd27e3ff8	! t1_kref+0x1d28:   	swap	[%i0 - 8], %o1
	.word	0x9bb08eea	! t1_kref+0x1d2c:   	fornot2s	%f2, %f10, %f13
	.word	0x8d826c67	! t1_kref+0x1d30:   	wr	%o1, 0xc67, %fprs
	.word	0xa723757a	! t1_kref+0x1d34:   	mulscc	%o5, -0xa86, %l3
	.word	0xa1b04a26	! t1_kref+0x1d38:   	fpadd16s	%f1, %f6, %f16
	.word	0x3d800004	! t1_kref+0x1d3c:   	fbule,a	_kref+0x1d4c
	.word	0xe91fbce8	! t1_kref+0x1d40:   	ldd	[%fp - 0x318], %f20
	.word	0xa9b2890c	! t1_kref+0x1d44:   	faligndata	%f10, %f12, %f20
	.word	0x81ad8a50	! t1_kref+0x1d48:   	fcmpd	%fcc0, %f22, %f16
	.word	0xae98000d	! t1_kref+0x1d4c:   	xorcc	%g0, %o5, %l7
	.word	0x81858000	! t1_kref+0x1d50:   	wr	%l6, %g0, %y
	.word	0x2a480007	! t1_kref+0x1d54:   	bcs,a,pt	%icc, _kref+0x1d70
	.word	0xc568a04d	! t1_kref+0x1d58:   	prefetch	%g2 + 0x4d, 2
	.word	0x93418000	! t1_kref+0x1d5c:   	mov	%fprs, %o1
	.word	0x95b009ab	! t1_kref+0x1d60:   	fexpand	%f11, %f10
	.word	0x28480004	! t1_kref+0x1d64:   	bleu,a,pt	%icc, _kref+0x1d74
	.word	0xa73b2004	! t1_kref+0x1d68:   	sra	%o4, 0x4, %l3
	.word	0x38800008	! t1_kref+0x1d6c:   	bgu,a	_kref+0x1d8c
	.word	0xc7264000	! t1_kref+0x1d70:   	st	%f3, [%i1]
	.word	0xa3a0188a	! t1_kref+0x1d74:   	fitos	%f10, %f17
	.word	0xd256001b	! t1_kref+0x1d78:   	ldsh	[%i0 + %i3], %o1
	.word	0xac3b3ef8	! t1_kref+0x1d7c:   	xnor	%o4, -0x108, %l6
	.word	0xa61ebbd8	! t1_kref+0x1d80:   	xor	%i2, -0x428, %l3
	.word	0xa82cc008	! t1_kref+0x1d84:   	andn	%l3, %o0, %l4
	.word	0x9fb10f70	! t1_kref+0x1d88:   	fornot1s	%f4, %f16, %f15
	.word	0xe40868c8	! t1_kref+0x1d8c:   	ldub	[%g1 + 0x8c8], %l2
	.word	0xa41ca00c	! t1_kref+0x1d90:   	xor	%l2, 0xc, %l2
	.word	0xe42868c8	! t1_kref+0x1d94:   	stb	%l2, [%g1 + 0x8c8]
	.word	0x81d868c8	! t1_kref+0x1d98:   	flush	%g1 + 0x8c8
	.word	0xc326201c	! t1_kref+0x1d9c:   	st	%f1, [%i0 + 0x1c]
	.word	0xa3a01881	! t1_kref+0x1da0:   	fitos	%f1, %f17
	.word	0xaaaae996	! t1_kref+0x1da4:   	andncc	%o3, 0x996, %l5
	.word	0xd636c018	! t1_kref+0x1da8:   	sth	%o3, [%i3 + %i0]
2:	.word	0xafb28240	! t1_kref+0x1dac:   	array16	%o2, %g0, %l7
	.word	0xa9a01914	! t1_kref+0x1db0:   	fitod	%f20, %f20
	.word	0x81ac8ad0	! t1_kref+0x1db4:   	fcmped	%fcc0, %f18, %f16
	.word	0x34480004	! t1_kref+0x1db8:   	bg,a,pt	%icc, _kref+0x1dc8
	.word	0x9026e4a7	! t1_kref+0x1dbc:   	sub	%i3, 0x4a7, %o0
	.word	0x27800008	! t1_kref+0x1dc0:   	fbul,a	_kref+0x1de0
	.word	0x94a23fab	! t1_kref+0x1dc4:   	subcc	%o0, -0x55, %o2
	.word	0x81580000	! t1_kref+0x1dc8:   	flushw
	.word	0xe896d018	! t1_kref+0x1dcc:   	lduha	[%i3 + %i0]0x80, %l4
	.word	0x90aac009	! t1_kref+0x1dd0:   	andncc	%o3, %o1, %o0
	.word	0xada01901	! t1_kref+0x1dd4:   	fitod	%f1, %f22
	.word	0xd03e2000	! t1_kref+0x1dd8:   	std	%o0, [%i0]
	.word	0x2f800003	! t1_kref+0x1ddc:   	fbu,a	_kref+0x1de8
	.word	0x89b50f46	! t1_kref+0x1de0:   	fornot1	%f20, %f6, %f4
	.word	0xecc71018	! t1_kref+0x1de4:   	ldswa	[%i4 + %i0]0x80, %l6
	.word	0x9da000c6	! t1_kref+0x1de8:   	fnegd	%f6, %f14
	.word	0xe5270019	! t1_kref+0x1dec:   	st	%f18, [%i4 + %i1]
	.word	0x92beeb3f	! t1_kref+0x1df0:   	xnorcc	%i3, 0xb3f, %o1
	.word	0xa5a018d2	! t1_kref+0x1df4:   	fdtos	%f18, %f18
	.word	0xd19e1000	! t1_kref+0x1df8:   	ldda	[%i0]0x80, %f8
	.word	0xcf20a014	! t1_kref+0x1dfc:   	st	%f7, [%g2 + 0x14]
	.word	0x94b02c8f	! t1_kref+0x1e00:   	orncc	%g0, 0xc8f, %o2
	.word	0x25800001	! t1_kref+0x1e04:   	fblg,a	_kref+0x1e08
	.word	0xd11fbe90	! t1_kref+0x1e08:   	ldd	[%fp - 0x170], %f8
	.word	0x86102004	! t1_kref+0x1e0c:   	mov	0x4, %g3
	.word	0x32800000	! t1_kref+0x1e10:   	bne,a	_kref+0x1e10
	.word	0x86a0e001	! t1_kref+0x1e14:   	subcc	%g3, 1, %g3
	.word	0xec56c019	! t1_kref+0x1e18:   	ldsh	[%i3 + %i1], %l6
	.word	0x98db0016	! t1_kref+0x1e1c:   	smulcc	%o4, %l6, %o4
	.word	0x96a6c00a	! t1_kref+0x1e20:   	subcc	%i3, %o2, %o3
	.word	0xe3b8a100	! t1_kref+0x1e24:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0x98c27f69	! t1_kref+0x1e28:   	addccc	%o1, -0x97, %o4
	.word	0xaeab781f	! t1_kref+0x1e2c:   	andncc	%o5, -0x7e1, %l7
	.word	0x98d6ff2d	! t1_kref+0x1e30:   	umulcc	%i3, -0xd3, %o4
	.word	0xe60e3fe3	! t1_kref+0x1e34:   	ldub	[%i0 - 0x1d], %l3
	.word	0xa9b48f42	! t1_kref+0x1e38:   	fornot1	%f18, %f2, %f20
	.word	0x9715ba84	! t1_kref+0x1e3c:   	taddcctv	%l6, -0x57c, %o3
	.word	0x81824000	! t1_kref+0x1e40:   	wr	%o1, %g0, %y
	.word	0x92c6f120	! t1_kref+0x1e44:   	addccc	%i3, -0xee0, %o1
	call	SYM(t1_subr2)
	.word	0xc91fbc88	! t1_kref+0x1e4c:   	ldd	[%fp - 0x378], %f4
	.word	0x9f414000	! t1_kref+0x1e50:   	mov	%pc, %o7
	.word	0xe1be585a	! t1_kref+0x1e54:   	stda	%f16, [%i1 + %i2]0xc2
	.word	0xf13e401d	! t1_kref+0x1e58:   	std	%f24, [%i1 + %i5]
	.word	0xe03e3fe0	! t1_kref+0x1e5c:   	std	%l0, [%i0 - 0x20]
	.word	0x81a98a3a	! t1_kref+0x1e60:   	fcmps	%fcc0, %f6, %f26
	.word	0xd0566014	! t1_kref+0x1e64:   	ldsh	[%i1 + 0x14], %o0
	.word	0x81a98a54	! t1_kref+0x1e68:   	fcmpd	%fcc0, %f6, %f20
	.word	0xcd1fbf70	! t1_kref+0x1e6c:   	ldd	[%fp - 0x90], %f6
	.word	0xb5a000ca	! t1_kref+0x1e70:   	fnegd	%f10, %f26
	.word	0x99b68156	! t1_kref+0x1e74:   	edge32l	%i2, %l6, %o4
	.word	0xee7e2000	! t1_kref+0x1e78:   	swap	[%i0], %l7
	.word	0xa88cc01b	! t1_kref+0x1e7c:   	andcc	%l3, %i3, %l4
	.word	0xe3b8a100	! t1_kref+0x1e80:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0x94c5c00b	! t1_kref+0x1e84:   	addccc	%l7, %o3, %o2
	.word	0x86102003	! t1_kref+0x1e88:   	mov	0x3, %g3
	.word	0x32800000	! t1_kref+0x1e8c:   	bne,a	_kref+0x1e8c
	.word	0x86a0e001	! t1_kref+0x1e90:   	subcc	%g3, 1, %g3
	.word	0x901ae5c8	! t1_kref+0x1e94:   	xor	%o3, 0x5c8, %o0
	.word	0x97b5413b	! t1_kref+0x1e98:   	edge32n	%l5, %i3, %o3
	.word	0x95b40a46	! t1_kref+0x1e9c:   	fpadd32	%f16, %f6, %f10
	.word	0xeb200018	! t1_kref+0x1ea0:   	st	%f21, [%g0 + %i0]
	.word	0x95b18c58	! t1_kref+0x1ea4:   	fnor	%f6, %f24, %f10
	.word	0x28480007	! t1_kref+0x1ea8:   	bleu,a,pt	%icc, _kref+0x1ec4
	.word	0x96e2c01b	! t1_kref+0x1eac:   	subccc	%o3, %i3, %o3
	.word	0xc0680018	! t1_kref+0x1eb0:   	ldstub	[%g0 + %i0], %g0
	.word	0xa5a01a50	! t1_kref+0x1eb4:   	fdtoi	%f16, %f18
	.word	0x20800001	! t1_kref+0x1eb8:   	bn,a	_kref+0x1ebc
	.word	0xe3262008	! t1_kref+0x1ebc:   	st	%f17, [%i0 + 8]
	.word	0xa5b00f0c	! t1_kref+0x1ec0:   	fsrc2	%f12, %f18
	.word	0xae3a6cdd	! t1_kref+0x1ec4:   	xnor	%o1, 0xcdd, %l7
	.word	0xae936656	! t1_kref+0x1ec8:   	orcc	%o5, 0x656, %l7
	.word	0x9922795d	! t1_kref+0x1ecc:   	mulscc	%o1, -0x6a3, %o4
	.word	0x99b58174	! t1_kref+0x1ed0:   	edge32ln	%l6, %l4, %o4
	.word	0xa1a449af	! t1_kref+0x1ed4:   	fdivs	%f17, %f15, %f16
	.word	0xf300a004	! t1_kref+0x1ed8:   	ld	[%g2 + 4], %f25
	.word	0x81ae4a39	! t1_kref+0x1edc:   	fcmps	%fcc0, %f25, %f25
	.word	0x95b00f0c	! t1_kref+0x1ee0:   	fsrc2	%f12, %f10
	.word	0x81acca2f	! t1_kref+0x1ee4:   	fcmps	%fcc0, %f19, %f15
	.word	0x3c800006	! t1_kref+0x1ee8:   	bpos,a	_kref+0x1f00
	.word	0xba102018	! t1_kref+0x1eec:   	mov	0x18, %i5
	.word	0xe920a02c	! t1_kref+0x1ef0:   	st	%f20, [%g2 + 0x2c]
	.word	0x973b6014	! t1_kref+0x1ef4:   	sra	%o5, 0x14, %o3
	.word	0x31800001	! t1_kref+0x1ef8:   	fba,a	_kref+0x1efc
	.word	0xe11e7ff8	! t1_kref+0x1efc:   	ldd	[%i1 - 8], %f16
	.word	0xa7b580f4	! t1_kref+0x1f00:   	edge16ln	%l6, %l4, %l3
	.word	0xe81e7fe0	! t1_kref+0x1f04:   	ldd	[%i1 - 0x20], %l4
	.word	0x93b5017a	! t1_kref+0x1f08:   	edge32ln	%l4, %i2, %o1
	.word	0xa782000a	! t1_kref+0x1f0c:   	wr	%o0, %o2, %gsr
	.word	0x9822b57d	! t1_kref+0x1f10:   	sub	%o2, -0xa83, %o4
	.word	0x85a01030	! t1_kref+0x1f14:   	fstox	%f16, %f2
	.word	0x8da00942	! t1_kref+0x1f18:   	fmuld	%f0, %f2, %f6
	.word	0x8d820013	! t1_kref+0x1f1c:   	wr	%o0, %l3, %fprs
	.word	0xa9a38946	! t1_kref+0x1f20:   	fmuld	%f14, %f6, %f20
	.word	0x81580000	! t1_kref+0x1f24:   	flushw
	.word	0xaea5401a	! t1_kref+0x1f28:   	subcc	%l5, %i2, %l7
	.word	0xaa9b7528	! t1_kref+0x1f2c:   	xorcc	%o5, -0xad8, %l5
	.word	0xac35000a	! t1_kref+0x1f30:   	orn	%l4, %o2, %l6
	.word	0x99b54e2e	! t1_kref+0x1f34:   	fands	%f21, %f14, %f12
	.word	0x89a109c8	! t1_kref+0x1f38:   	fdivd	%f4, %f8, %f4
	.word	0x28800002	! t1_kref+0x1f3c:   	bleu,a	_kref+0x1f44
	.word	0xb3a30834	! t1_kref+0x1f40:   	fadds	%f12, %f20, %f25
	.word	0xb5b08c86	! t1_kref+0x1f44:   	fandnot2	%f2, %f6, %f26
	.word	0xe83e2008	! t1_kref+0x1f48:   	std	%l4, [%i0 + 8]
	.word	0xaab2800a	! t1_kref+0x1f4c:   	orncc	%o2, %o2, %l5
	.word	0x26480008	! t1_kref+0x1f50:   	bl,a,pt	%icc, _kref+0x1f70
	.word	0x91b606ea	! t1_kref+0x1f54:   	fmul8ulx16	%f24, %f10, %f8
	.word	0xec1e3ff0	! t1_kref+0x1f58:   	ldd	[%i0 - 0x10], %l6
	.word	0x2f800002	! t1_kref+0x1f5c:   	fbu,a	_kref+0x1f64
	.word	0x96b2c015	! t1_kref+0x1f60:   	orncc	%o3, %l5, %o3
	.word	0x8fa01a42	! t1_kref+0x1f64:   	fdtoi	%f2, %f7
	.word	0x961b699e	! t1_kref+0x1f68:   	xor	%o5, 0x99e, %o3
	.word	0xe3060000	! t1_kref+0x1f6c:   	ld	[%i0], %f17
	.word	0x90daa21f	! t1_kref+0x1f70:   	smulcc	%o2, 0x21f, %o0
	.word	0xe43f4019	! t1_kref+0x1f74:   	std	%l2, [%i5 + %i1]
	.word	0x2e800007	! t1_kref+0x1f78:   	bvs,a	_kref+0x1f94
	.word	0xaf418000	! t1_kref+0x1f7c:   	mov	%fprs, %l7
	.word	0x932ac01b	! t1_kref+0x1f80:   	sll	%o3, %i3, %o1
	.word	0x2a480002	! t1_kref+0x1f84:   	bcs,a,pt	%icc, _kref+0x1f8c
	.word	0xa9a20940	! t1_kref+0x1f88:   	fmuld	%f8, %f0, %f20
	.word	0x26480004	! t1_kref+0x1f8c:   	bl,a,pt	%icc, _kref+0x1f9c
	.word	0xad44c000	! t1_kref+0x1f90:   	mov	%gsr, %l6
	.word	0x91a308d0	! t1_kref+0x1f94:   	fsubd	%f12, %f16, %f8
	.word	0xee766010	! t1_kref+0x1f98:   	stx	%l7, [%i1 + 0x10]
	.word	0x85b50a56	! t1_kref+0x1f9c:   	fpadd32	%f20, %f22, %f2
	.word	0x91a0192c	! t1_kref+0x1fa0:   	fstod	%f12, %f8
	.word	0xe168a083	! t1_kref+0x1fa4:   	prefetch	%g2 + 0x83, 16
	.word	0x25800005	! t1_kref+0x1fa8:   	fblg,a	_kref+0x1fbc
	.word	0x91a01899	! t1_kref+0x1fac:   	fitos	%f25, %f8
	.word	0x95b3434c	! t1_kref+0x1fb0:   	alignaddrl	%o5, %o4, %o2
	.word	0x943d20d5	! t1_kref+0x1fb4:   	xnor	%l4, 0xd5, %o2
	.word	0xea562014	! t1_kref+0x1fb8:   	ldsh	[%i0 + 0x14], %l5
	.word	0x95a8004c	! t1_kref+0x1fbc:   	fmovdn	%fcc0, %f12, %f10
	.word	0xa9b44e6c	! t1_kref+0x1fc0:   	fxnors	%f17, %f12, %f20
	.word	0xa1a000b2	! t1_kref+0x1fc4:   	fnegs	%f18, %f16
	.word	0x98c50009	! t1_kref+0x1fc8:   	addccc	%l4, %o1, %o4
	.word	0xae3dafde	! t1_kref+0x1fcc:   	xnor	%l6, 0xfde, %l7
	.word	0x92c34015	! t1_kref+0x1fd0:   	addccc	%o5, %l5, %o1
	.word	0xa1a00525	! t1_kref+0x1fd4:   	fsqrts	%f5, %f16
	.word	0x99b00764	! t1_kref+0x1fd8:   	fpack16	%f4, %f12
	.word	0x89b586ea	! t1_kref+0x1fdc:   	fmul8ulx16	%f22, %f10, %f4
	.word	0x90ad657b	! t1_kref+0x1fe0:   	andncc	%l5, 0x57b, %o0
	.word	0xe3b8a100	! t1_kref+0x1fe4:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0xd0780018	! t1_kref+0x1fe8:   	swap	[%g0 + %i0], %o0
	.word	0x39800005	! t1_kref+0x1fec:   	fbuge,a	_kref+0x2000
	.word	0xeef01019	! t1_kref+0x1ff0:   	stxa	%l7, [%g0 + %i1]0x80
	.word	0x969a2185	! t1_kref+0x1ff4:   	xorcc	%o0, 0x185, %o3
	.word	0xb1b007ac	! t1_kref+0x1ff8:   	fpackfix	%f12, %f24
	.word	0xec1e2018	! t1_kref+0x1ffc:   	ldd	[%i0 + 0x18], %l6
	.word	0xc1be5855	! t1_kref+0x2000:   	stda	%f0, [%i1 + %l5]0xc2
	.word	0x21800002	! t1_kref+0x2004:   	fbn,a	_kref+0x200c
	.word	0xb5b00fc0	! t1_kref+0x2008:   	fone	%f26
	.word	0xe99f5a59	! t1_kref+0x200c:   	ldda	[%i5 + %i1]0xd2, %f20
	.word	0xa7a000a6	! t1_kref+0x2010:   	fnegs	%f6, %f19
	.word	0x81a8ca2f	! t1_kref+0x2014:   	fcmps	%fcc0, %f3, %f15
	.word	0x90036947	! t1_kref+0x2018:   	add	%o5, 0x947, %o0
	.word	0xadb40a86	! t1_kref+0x201c:   	fpsub16	%f16, %f6, %f22
	.word	0x81ac0a40	! t1_kref+0x2020:   	fcmpd	%fcc0, %f16, %f0
	.word	0xaf3b400a	! t1_kref+0x2024:   	sra	%o5, %o2, %l7
	.word	0xa6068009	! t1_kref+0x2028:   	add	%i2, %o1, %l3
	.word	0xac4270ec	! t1_kref+0x202c:   	addc	%o1, -0xf14, %l6
	.word	0x98da8017	! t1_kref+0x2030:   	smulcc	%o2, %l7, %o4
	.word	0x21800008	! t1_kref+0x2034:   	fbn,a	_kref+0x2054
	.word	0xd13e6010	! t1_kref+0x2038:   	std	%f8, [%i1 + 0x10]
	.word	0xa655801b	! t1_kref+0x203c:   	umul	%l6, %i3, %l3
	.word	0xd430a024	! t1_kref+0x2040:   	sth	%o2, [%g2 + 0x24]
	.word	0xe07e3fe8	! t1_kref+0x2044:   	swap	[%i0 - 0x18], %l0
	.word	0xe07e401c	! t1_kref+0x2048:   	swap	[%i1 + %i4], %l0
	.word	0xd4162018	! t1_kref+0x204c:   	lduh	[%i0 + 0x18], %o2
	.word	0x967dc01a	! t1_kref+0x2050:   	sdiv	%l7, %i2, %o3
	.word	0x90380013	! t1_kref+0x2054:   	xnor	%g0, %l3, %o0
	.word	0x9062c000	! t1_kref+0x2058:   	subc	%o3, %g0, %o0
	.word	0x95a01885	! t1_kref+0x205c:   	fitos	%f5, %f10
	.word	0xaedd2214	! t1_kref+0x2060:   	smulcc	%l4, 0x214, %l7
	.word	0xeb000019	! t1_kref+0x2064:   	ld	[%g0 + %i1], %f21
	.word	0xd830a004	! t1_kref+0x2068:   	sth	%o4, [%g2 + 4]
	.word	0xe4086ba0	! t1_kref+0x206c:   	ldub	[%g1 + 0xba0], %l2
	.word	0xa41ca00c	! t1_kref+0x2070:   	xor	%l2, 0xc, %l2
	.word	0xe4286ba0	! t1_kref+0x2074:   	stb	%l2, [%g1 + 0xba0]
	.word	0x81d86ba0	! t1_kref+0x2078:   	flush	%g1 + 0xba0
	.word	0xb1a588c4	! t1_kref+0x207c:   	fsubd	%f22, %f4, %f24
	.word	0x85ab4058	! t1_kref+0x2080:   	fmovdle	%fcc0, %f24, %f2
2:	.word	0xa962671e	! t1_kref+0x2084:   	move	%fcc0, -0xe2, %l4
	.word	0xa6fd401b	! t1_kref+0x2088:   	sdivcc	%l5, %i3, %l3
	.word	0x9de3bfa0	! t1_kref+0x208c:   	save	%sp, -0x60, %sp
	.word	0xb046a19d	! t1_kref+0x2090:   	addc	%i2, 0x19d, %i0
	.word	0xa9ef2f74	! t1_kref+0x2094:   	restore	%i4, 0xf74, %l4
	.word	0x98c50000	! t1_kref+0x2098:   	addccc	%l4, %g0, %o4
	.word	0xae76c00a	! t1_kref+0x209c:   	udiv	%i3, %o2, %l7
	.word	0xf428a03e	! t1_kref+0x20a0:   	stb	%i2, [%g2 + 0x3e]
	.word	0xabb284c2	! t1_kref+0x20a4:   	fcmpne32	%f10, %f2, %l5
	.word	0xd628a01f	! t1_kref+0x20a8:   	stb	%o3, [%g2 + 0x1f]
	.word	0xa8a323a5	! t1_kref+0x20ac:   	subcc	%o4, 0x3a5, %l4
	.word	0x9733400a	! t1_kref+0x20b0:   	srl	%o5, %o2, %o3
	.word	0xd208a02e	! t1_kref+0x20b4:   	ldub	[%g2 + 0x2e], %o1
	.word	0xa81ac015	! t1_kref+0x20b8:   	xor	%o3, %l5, %l4
	.word	0x960031ca	! t1_kref+0x20bc:   	add	%g0, -0xe36, %o3
	.word	0xac26ed06	! t1_kref+0x20c0:   	sub	%i3, 0xd06, %l6
	.word	0xc1ee501a	! t1_kref+0x20c4:   	prefetcha	%i1 + %i2, 0
	.word	0xa8fa4008	! t1_kref+0x20c8:   	sdivcc	%o1, %o0, %l4
	.word	0x8db44672	! t1_kref+0x20cc:   	fmul8x16au	%f17, %f18, %f6
	.word	0xb1a00542	! t1_kref+0x20d0:   	fsqrtd	%f2, %f24
	.word	0xd4780019	! t1_kref+0x20d4:   	swap	[%g0 + %i1], %o2
	.word	0xc51fbd80	! t1_kref+0x20d8:   	ldd	[%fp - 0x280], %f2
	.word	0x98aefb77	! t1_kref+0x20dc:   	andncc	%i3, -0x489, %o4
	.word	0xa9b10a94	! t1_kref+0x20e0:   	fpsub16	%f4, %f20, %f20
	.word	0x94350014	! t1_kref+0x20e4:   	orn	%l4, %l4, %o2
	.word	0x9915c000	! t1_kref+0x20e8:   	taddcctv	%l7, %g0, %o4
	.word	0x81858000	! t1_kref+0x20ec:   	wr	%l6, %g0, %y
	.word	0x2d2b39f6	! t1_kref+0x20f0:   	sethi	%hi(0xace7d800), %l6
	.word	0x92b2c009	! t1_kref+0x20f4:   	orncc	%o3, %o1, %o1
	.word	0x98ad30b9	! t1_kref+0x20f8:   	andncc	%l4, -0xf47, %o4
	.word	0xe848a027	! t1_kref+0x20fc:   	ldsb	[%g2 + 0x27], %l4
	.word	0x92b6c000	! t1_kref+0x2100:   	orncc	%i3, %g0, %o1
	.word	0x9482f867	! t1_kref+0x2104:   	addcc	%o3, -0x799, %o2
	.word	0xa3a000b7	! t1_kref+0x2108:   	fnegs	%f23, %f17
	.word	0x9da049b2	! t1_kref+0x210c:   	fdivs	%f1, %f18, %f14
	.word	0x3e800002	! t1_kref+0x2110:   	bvc,a	_kref+0x2118
	.word	0xa1a018cc	! t1_kref+0x2114:   	fdtos	%f12, %f16
	.word	0xd8162004	! t1_kref+0x2118:   	lduh	[%i0 + 4], %o4
	.word	0xa7408000	! t1_kref+0x211c:   	mov	%ccr, %l3
	.word	0xd268a035	! t1_kref+0x2120:   	ldstub	[%g2 + 0x35], %o1
	.word	0x26800002	! t1_kref+0x2124:   	bl,a	_kref+0x212c
	.word	0x83b00fe0	! t1_kref+0x2128:   	fones	%f1
	.word	0xa3a38930	! t1_kref+0x212c:   	fmuls	%f14, %f16, %f17
	.word	0x97b1cd60	! t1_kref+0x2130:   	fnot1s	%f7, %f11
	.word	0x90c00014	! t1_kref+0x2134:   	addccc	%g0, %l4, %o0
	.word	0xa9a01905	! t1_kref+0x2138:   	fitod	%f5, %f20
	.word	0xa6334015	! t1_kref+0x213c:   	orn	%o5, %l5, %l3
	.word	0xe19f5019	! t1_kref+0x2140:   	ldda	[%i5 + %i1]0x80, %f16
	.word	0x90a82da3	! t1_kref+0x2144:   	andncc	%g0, 0xda3, %o0
	.word	0x9ba289a6	! t1_kref+0x2148:   	fdivs	%f10, %f6, %f13
	.word	0x930dc000	! t1_kref+0x214c:   	tsubcc	%l7, %g0, %o1
	.word	0x9082400a	! t1_kref+0x2150:   	addcc	%o1, %o2, %o0
	.word	0xf5981019	! t1_kref+0x2154:   	ldda	[%g0 + %i1]0x80, %f26
	.word	0xabb28ea0	! t1_kref+0x2158:   	fsrc1s	%f10, %f21
	.word	0x81ae4a37	! t1_kref+0x215c:   	fcmps	%fcc0, %f25, %f23
	.word	0x9635c00d	! t1_kref+0x2160:   	orn	%l7, %o5, %o3
	.word	0x81a408c2	! t1_kref+0x2164:   	fsubd	%f16, %f2, %f0
	.word	0x925028f7	! t1_kref+0x2168:   	umul	%g0, 0x8f7, %o1
	.word	0x9da00034	! t1_kref+0x216c:   	fmovs	%f20, %f14
	.word	0x92fdb08d	! t1_kref+0x2170:   	sdivcc	%l6, -0xf73, %o1
	.word	0xa940c000	! t1_kref+0x2174:   	mov	%asi, %l4
	.word	0xf207bfe0	! t1_kref+0x2178:   	ld	[%fp - 0x20], %i1
	.word	0xa5a0884a	! t1_kref+0x217c:   	faddd	%f2, %f10, %f18
	.word	0xc398a0c0	! t1_kref+0x2180:   	ldda	[%g2 + 0xc0]%asi, %f32
	.word	0x86102004	! t1_kref+0x2184:   	mov	0x4, %g3
	.word	0x32800000	! t1_kref+0x2188:   	bne,a	_kref+0x2188
	.word	0x86a0e001	! t1_kref+0x218c:   	subcc	%g3, 1, %g3
	.word	0x2b800001	! t1_kref+0x2190:   	fbug,a	_kref+0x2194
	.word	0x94fec00d	! t1_kref+0x2194:   	sdivcc	%i3, %o5, %o2
	.word	0x25480006	! t1_kref+0x2198:   	fblg,a,pt	%fcc0, _kref+0x21b0
	.word	0xc1e6100c	! t1_kref+0x219c:   	casa	[%i0]0x80, %o4, %g0
	call	SYM(t1_subr2)
	.word	0x99a00523	! t1_kref+0x21a4:   	fsqrts	%f3, %f12
	.word	0x92aaed40	! t1_kref+0x21a8:   	andncc	%o3, 0xd40, %o1
	.word	0xa1a34d32	! t1_kref+0x21ac:   	fsmuld	%f13, %f18, %f16
	.word	0x32480008	! t1_kref+0x21b0:   	bne,a,pt	%icc, _kref+0x21d0
	.word	0xa69df34c	! t1_kref+0x21b4:   	xorcc	%l7, -0xcb4, %l3
	.word	0x34800001	! t1_kref+0x21b8:   	bg,a	_kref+0x21bc
	.word	0xc807bfe4	! t1_kref+0x21bc:   	ld	[%fp - 0x1c], %g4
	.word	0x967568a1	! t1_kref+0x21c0:   	udiv	%l5, 0x8a1, %o3
	.word	0x1729561e	! t1_kref+0x21c4:   	sethi	%hi(0xa5587800), %o3
	.word	0xa9b38a58	! t1_kref+0x21c8:   	fpadd32	%f14, %f24, %f20
	.word	0xa9a608d8	! t1_kref+0x21cc:   	fsubd	%f24, %f24, %f20
	.word	0xd296101b	! t1_kref+0x21d0:   	lduha	[%i0 + %i3]0x80, %o1
	.word	0x3d800005	! t1_kref+0x21d4:   	fbule,a	_kref+0x21e8
	.word	0x81820000	! t1_kref+0x21d8:   	wr	%o0, %g0, %y
	.word	0xe46e6017	! t1_kref+0x21dc:   	ldstub	[%i1 + 0x17], %l2
	.word	0x81a9caac	! t1_kref+0x21e0:   	fcmpes	%fcc0, %f7, %f12
	.word	0xa6d6f96d	! t1_kref+0x21e4:   	umulcc	%i3, -0x693, %l3
	.word	0x25800005	! t1_kref+0x21e8:   	fblg,a	_kref+0x21fc
	.word	0xd2b6d018	! t1_kref+0x21ec:   	stha	%o1, [%i3 + %i0]0x80
	.word	0x21800004	! t1_kref+0x21f0:   	fbn,a	_kref+0x2200
	.word	0x90bda74d	! t1_kref+0x21f4:   	xnorcc	%l6, 0x74d, %o0
	.word	0xae63000d	! t1_kref+0x21f8:   	subc	%o4, %o5, %l7
	.word	0xd27e0000	! t1_kref+0x21fc:   	swap	[%i0], %o1
	.word	0xd876401d	! t1_kref+0x2200:   	stx	%o4, [%i1 + %i5]
	.word	0xacdee45b	! t1_kref+0x2204:   	smulcc	%i3, 0x45b, %l6
	.word	0x99b58cae	! t1_kref+0x2208:   	fandnot2s	%f22, %f14, %f12
	.word	0xa6a3400a	! t1_kref+0x220c:   	subcc	%o5, %o2, %l3
	.word	0xe81e7ff0	! t1_kref+0x2210:   	ldd	[%i1 - 0x10], %l4
	.word	0x3a480004	! t1_kref+0x2214:   	bcc,a,pt	%icc, _kref+0x2224
	.word	0xada38958	! t1_kref+0x2218:   	fmuld	%f14, %f24, %f22
	.word	0xaac58015	! t1_kref+0x221c:   	addccc	%l6, %l5, %l5
	.word	0xe83f4019	! t1_kref+0x2220:   	std	%l4, [%i5 + %i1]
	.word	0xd8df5018	! t1_kref+0x2224:   	ldxa	[%i5 + %i0]0x80, %o4
	.word	0x96fae4ad	! t1_kref+0x2228:   	sdivcc	%o3, 0x4ad, %o3
	.word	0x2a800003	! t1_kref+0x222c:   	bcs,a	_kref+0x2238
	.word	0xd07e6018	! t1_kref+0x2230:   	swap	[%i1 + 0x18], %o0
	.word	0xaa5a800c	! t1_kref+0x2234:   	smul	%o2, %o4, %l5
	.word	0x97408000	! t1_kref+0x2238:   	mov	%ccr, %o3
	.word	0x35800007	! t1_kref+0x223c:   	fbue,a	_kref+0x2258
	.word	0xd9be189b	! t1_kref+0x2240:   	stda	%f12, [%i0 + %i3]0xc4
	.word	0x98a5a89a	! t1_kref+0x2244:   	subcc	%l6, 0x89a, %o4
	.word	0x2a800002	! t1_kref+0x2248:   	bcs,a	_kref+0x2250
	.word	0x2d2cd536	! t1_kref+0x224c:   	sethi	%hi(0xb354d800), %l6
	.word	0xf207bfe0	! t1_kref+0x2250:   	ld	[%fp - 0x20], %i1
!	.word	0x3ab9ef6a	! t1_kref+0x2254:   	bcc,a	SYM(t1_subr2)
	   	bcc,a	SYM(t1_subr2)
	.word	0x9f414000	! t1_kref+0x2258:   	mov	%pc, %o7
	.word	0xadb20149	! t1_kref+0x225c:   	edge32l	%o0, %o1, %l6
	.word	0xae1a6b56	! t1_kref+0x2260:   	xor	%o1, 0xb56, %l7
	.word	0xafb2816d	! t1_kref+0x2264:   	edge32ln	%o2, %o5, %l7
	.word	0xaafcf821	! t1_kref+0x2268:   	sdivcc	%l3, -0x7df, %l5
	.word	0xab3ea00d	! t1_kref+0x226c:   	sra	%i2, 0xd, %l5
	.word	0xe8500019	! t1_kref+0x2270:   	ldsh	[%g0 + %i1], %l4
	.word	0x81df0013	! t1_kref+0x2274:   	flush	%i4 + %l3
	.word	0xb5b486b9	! t1_kref+0x2278:   	fmul8x16al	%f18, %f25, %f26
	.word	0x96b6bac9	! t1_kref+0x227c:   	orncc	%i2, -0x537, %o3
	.word	0xee4e8019	! t1_kref+0x2280:   	ldsb	[%i2 + %i1], %l7
	.word	0x96a53235	! t1_kref+0x2284:   	subcc	%l4, -0xdcb, %o3
	.word	0x93a20931	! t1_kref+0x2288:   	fmuls	%f8, %f17, %f9
	.word	0x95b08746	! t1_kref+0x228c:   	fpack32	%f2, %f6, %f10
	.word	0x81d8000c	! t1_kref+0x2290:   	flush	%g0 + %o4
	.word	0x2f800002	! t1_kref+0x2294:   	fbu,a	_kref+0x229c
	.word	0xf1be188b	! t1_kref+0x2298:   	stda	%f24, [%i0 + %o3]0xc4
	.word	0xb1a609ac	! t1_kref+0x229c:   	fdivs	%f24, %f12, %f24
	.word	0x81868000	! t1_kref+0x22a0:   	wr	%i2, %g0, %y
	.word	0xaead800a	! t1_kref+0x22a4:   	andncc	%l6, %o2, %l7
	.word	0xa9b30416	! t1_kref+0x22a8:   	fcmple16	%f12, %f22, %l4
	.word	0xe3b8a100	! t1_kref+0x22ac:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0x922a34ef	! t1_kref+0x22b0:   	andn	%o0, -0xb11, %o1
	.word	0x90fee724	! t1_kref+0x22b4:   	sdivcc	%i3, 0x724, %o0
	.word	0x927b0017	! t1_kref+0x22b8:   	sdiv	%o4, %l7, %o1
	.word	0x96c5800d	! t1_kref+0x22bc:   	addccc	%l6, %o5, %o3
	.word	0xeb070019	! t1_kref+0x22c0:   	ld	[%i4 + %i1], %f21
	.word	0x929ac00c	! t1_kref+0x22c4:   	xorcc	%o3, %o4, %o1
	.word	0x81ae0aaf	! t1_kref+0x22c8:   	fcmpes	%fcc0, %f24, %f15
	.word	0x9da01916	! t1_kref+0x22cc:   	fitod	%f22, %f14
	.word	0x90c5baf9	! t1_kref+0x22d0:   	addccc	%l6, -0x507, %o0
	.word	0x90654009	! t1_kref+0x22d4:   	subc	%l5, %o1, %o0
	.word	0xee56c019	! t1_kref+0x22d8:   	ldsh	[%i3 + %i1], %l7
	.word	0x8da000c8	! t1_kref+0x22dc:   	fnegd	%f8, %f6
	.word	0xa69b0017	! t1_kref+0x22e0:   	xorcc	%o4, %l7, %l3
	.word	0xf51fbc78	! t1_kref+0x22e4:   	ldd	[%fp - 0x388], %f26
	.word	0x91b08494	! t1_kref+0x22e8:   	fcmple32	%f2, %f20, %o0
	.word	0x131be14e	! t1_kref+0x22ec:   	sethi	%hi(0x6f853800), %o1
	.word	0xd096d040	! t1_kref+0x22f0:   	lduha	[%i3]0x82, %o0
	.word	0xae92001a	! t1_kref+0x22f4:   	orcc	%o0, %i2, %l7
	.word	0x9455e5dc	! t1_kref+0x22f8:   	umul	%l7, 0x5dc, %o2
	.word	0x93b00776	! t1_kref+0x22fc:   	fpack16	%f22, %f9
	.word	0xc768a04a	! t1_kref+0x2300:   	prefetch	%g2 + 0x4a, 3
	.word	0xb1b68e80	! t1_kref+0x2304:   	fsrc1	%f26, %f24
	.word	0x27800007	! t1_kref+0x2308:   	fbul,a	_kref+0x2324
	.word	0xd82e0000	! t1_kref+0x230c:   	stb	%o4, [%i0]
	.word	0xaaf530c8	! t1_kref+0x2310:   	udivcc	%l4, -0xf38, %l5
	.word	0xa89a001b	! t1_kref+0x2314:   	xorcc	%o0, %i3, %l4
	.word	0x8da289c8	! t1_kref+0x2318:   	fdivd	%f10, %f8, %f6
	.word	0x32480006	! t1_kref+0x231c:   	bne,a,pt	%icc, _kref+0x2334
	.word	0xd8871019	! t1_kref+0x2320:   	lda	[%i4 + %i1]0x80, %o4
	.word	0xc0200018	! t1_kref+0x2324:   	clr	[%g0 + %i0]
	.word	0xd03e7fe0	! t1_kref+0x2328:   	std	%o0, [%i1 - 0x20]
	.word	0xe67e6010	! t1_kref+0x232c:   	swap	[%i1 + 0x10], %l3
	.word	0x99a01917	! t1_kref+0x2330:   	fitod	%f23, %f12
	.word	0x94c26206	! t1_kref+0x2334:   	addccc	%o1, 0x206, %o2
	.word	0xc0f01019	! t1_kref+0x2338:   	stxa	%g0, [%g0 + %i1]0x80
	.word	0xacda8016	! t1_kref+0x233c:   	smulcc	%o2, %l6, %l6
	.word	0x130b5d3f	! t1_kref+0x2340:   	sethi	%hi(0x2d74fc00), %o1
	.word	0x95a08850	! t1_kref+0x2344:   	faddd	%f2, %f16, %f10
	.word	0xa9a3092c	! t1_kref+0x2348:   	fmuls	%f12, %f12, %f20
	.word	0x9970001a	! t1_kref+0x234c:   	popc	%i2, %o4
	.word	0xd60e401a	! t1_kref+0x2350:   	ldub	[%i1 + %i2], %o3
	.word	0x8da00028	! t1_kref+0x2354:   	fmovs	%f8, %f6
	.word	0x95a0188d	! t1_kref+0x2358:   	fitos	%f13, %f10
	.word	0x927efd15	! t1_kref+0x235c:   	sdiv	%i3, -0x2eb, %o1
	.word	0xd5be5000	! t1_kref+0x2360:   	stda	%f10, [%i1]0x80
	call	SYM(t1_subr2)
	.word	0x95b306cc	! t1_kref+0x2368:   	fmul8sux16	%f12, %f12, %f10
	.word	0x89a08952	! t1_kref+0x236c:   	fmuld	%f2, %f18, %f4
	.word	0x8fa01a34	! t1_kref+0x2370:   	fstoi	%f20, %f7
	.word	0x81ac8a50	! t1_kref+0x2374:   	fcmpd	%fcc0, %f18, %f16
	.word	0x30800006	! t1_kref+0x2378:   	ba,a	_kref+0x2390
	.word	0x87a00028	! t1_kref+0x237c:   	fmovs	%f8, %f3
	.word	0x89b30914	! t1_kref+0x2380:   	faligndata	%f12, %f20, %f4
	.word	0x81ae0aa5	! t1_kref+0x2384:   	fcmpes	%fcc0, %f24, %f5
	.word	0x81ab8a4e	! t1_kref+0x2388:   	fcmpd	%fcc0, %f14, %f14
	.word	0xc12e3fe4	! t1_kref+0x238c:   	st	%fsr, [%i0 - 0x1c]
	.word	0xc168a08d	! t1_kref+0x2390:   	prefetch	%g2 + 0x8d, 0
	.word	0xea2e0000	! t1_kref+0x2394:   	stb	%l5, [%i0]
	.word	0xa6268000	! t1_kref+0x2398:   	sub	%i2, %g0, %l3
	.word	0x99b28068	! t1_kref+0x239c:   	edge8ln	%o2, %o0, %o4
	.word	0x8bb50aea	! t1_kref+0x23a0:   	fpsub32s	%f20, %f10, %f5
	.word	0xa1a00954	! t1_kref+0x23a4:   	fmuld	%f0, %f20, %f16
	.word	0x8da01914	! t1_kref+0x23a8:   	fitod	%f20, %f6
	.word	0x941d24a2	! t1_kref+0x23ac:   	xor	%l4, 0x4a2, %o2
	.word	0x90924000	! t1_kref+0x23b0:   	orcc	%o1, %g0, %o0
	.word	0x8da01918	! t1_kref+0x23b4:   	fitod	%f24, %f6
	.word	0x94d5b530	! t1_kref+0x23b8:   	umulcc	%l6, -0xad0, %o2
	.word	0x3c800003	! t1_kref+0x23bc:   	bpos,a	_kref+0x23c8
	.word	0xb1a209cc	! t1_kref+0x23c0:   	fdivd	%f8, %f12, %f24
	.word	0x9db18a68	! t1_kref+0x23c4:   	fpadd32s	%f6, %f8, %f14
	.word	0xe82e3fee	! t1_kref+0x23c8:   	stb	%l4, [%i0 - 0x12]
	.word	0xdb263ff0	! t1_kref+0x23cc:   	st	%f13, [%i0 - 0x10]
	.word	0xa1a01909	! t1_kref+0x23d0:   	fitod	%f9, %f16
	.word	0x2f480002	! t1_kref+0x23d4:   	fbu,a,pt	%fcc0, _kref+0x23dc
	.word	0xb1a01886	! t1_kref+0x23d8:   	fitos	%f6, %f24
	.word	0x981b0014	! t1_kref+0x23dc:   	xor	%o4, %l4, %o4
	.word	0xb1a01a5a	! t1_kref+0x23e0:   	fdtoi	%f26, %f24
	.word	0xada209ac	! t1_kref+0x23e4:   	fdivs	%f8, %f12, %f22
	.word	0xcd062014	! t1_kref+0x23e8:   	ld	[%i0 + 0x14], %f6
	.word	0x81aa0aa6	! t1_kref+0x23ec:   	fcmpes	%fcc0, %f8, %f6
	.word	0xa605800c	! t1_kref+0x23f0:   	add	%l6, %o4, %l3
	.word	0x9522401b	! t1_kref+0x23f4:   	mulscc	%o1, %i3, %o2
	.word	0x93b2c137	! t1_kref+0x23f8:   	edge32n	%o3, %l7, %o1
	.word	0x1909c3fe	! t1_kref+0x23fc:   	sethi	%hi(0x270ff800), %o4
	.word	0x81aa8a4c	! t1_kref+0x2400:   	fcmpd	%fcc0, %f10, %f12
	.word	0x93400000	! t1_kref+0x2404:   	mov	%y, %o1
	.word	0xc51fbcf0	! t1_kref+0x2408:   	ldd	[%fp - 0x310], %f2
	.word	0xe8100019	! t1_kref+0x240c:   	lduh	[%g0 + %i1], %l4
	.word	0x8da28946	! t1_kref+0x2410:   	fmuld	%f10, %f6, %f6
	.word	0x30480002	! t1_kref+0x2414:   	ba,a,pt	%icc, _kref+0x241c
	.word	0xb5a01a4c	! t1_kref+0x2418:   	fdtoi	%f12, %f26
	.word	0x8143c000	! t1_kref+0x241c:   	stbar
	.word	0xead6501b	! t1_kref+0x2420:   	ldsha	[%i1 + %i3]0x80, %l5
	.word	0xeb20a004	! t1_kref+0x2424:   	st	%f21, [%g2 + 4]
	.word	0xabb58ea0	! t1_kref+0x2428:   	fsrc1s	%f22, %f21
	.word	0x9761237d	! t1_kref+0x242c:   	movl	%fcc0, 0x37d, %o3
	.word	0x9db48d33	! t1_kref+0x2430:   	fandnot1s	%f18, %f19, %f14
	.word	0x92853932	! t1_kref+0x2434:   	addcc	%l4, -0x6ce, %o1
	.word	0xaba0188d	! t1_kref+0x2438:   	fitos	%f13, %f21
	.word	0xa8b68000	! t1_kref+0x243c:   	orncc	%i2, %g0, %l4
	.word	0x8143c000	! t1_kref+0x2440:   	stbar
	.word	0x81ad4aa5	! t1_kref+0x2444:   	fcmpes	%fcc0, %f21, %f5
	.word	0xc768a005	! t1_kref+0x2448:   	prefetch	%g2 + 5, 3
	.word	0x972377cb	! t1_kref+0x244c:   	mulscc	%o5, -0x835, %o3
	.word	0x9da0190b	! t1_kref+0x2450:   	fitod	%f11, %f14
	.word	0x87b30a62	! t1_kref+0x2454:   	fpadd32s	%f12, %f2, %f3
	.word	0xae9ebd70	! t1_kref+0x2458:   	xorcc	%i2, -0x290, %l7
	.word	0x3c800004	! t1_kref+0x245c:   	bpos,a	_kref+0x246c
	.word	0xd840a014	! t1_kref+0x2460:   	ldsw	[%g2 + 0x14], %o4
	.word	0x81ad8ab1	! t1_kref+0x2464:   	fcmpes	%fcc0, %f22, %f17
	.word	0x92bce034	! t1_kref+0x2468:   	xnorcc	%l3, 0x34, %o1
	.word	0x8ba0108a	! t1_kref+0x246c:   	fxtos	%f10, %f5
	.word	0x2a800003	! t1_kref+0x2470:   	bcs,a	_kref+0x247c
	.word	0xa9a609d8	! t1_kref+0x2474:   	fdivd	%f24, %f24, %f20
	.word	0x90dd0017	! t1_kref+0x2478:   	smulcc	%l4, %l7, %o0
	.word	0x8185c000	! t1_kref+0x247c:   	wr	%l7, %g0, %y
	.word	0x8186c000	! t1_kref+0x2480:   	wr	%i3, %g0, %y
	.word	0xb3b00f35	! t1_kref+0x2484:   	fsrc2s	%f21, %f25
	.word	0xe43e4000	! t1_kref+0x2488:   	std	%l2, [%i1]
	.word	0x89b48ad4	! t1_kref+0x248c:   	fpsub32	%f18, %f20, %f4
	.word	0xe8ce501a	! t1_kref+0x2490:   	ldsba	[%i1 + %i2]0x80, %l4
	.word	0xaa3275ce	! t1_kref+0x2494:   	orn	%o1, -0xa32, %l5
	.word	0x81ac0a4e	! t1_kref+0x2498:   	fcmpd	%fcc0, %f16, %f14
	.word	0xa5b3c630	! t1_kref+0x249c:   	fmul8x16	%f15, %f16, %f18
	.word	0xa6c50009	! t1_kref+0x24a0:   	addccc	%l4, %o1, %l3
	.word	0x92a32f16	! t1_kref+0x24a4:   	subcc	%o4, 0xf16, %o1
	.word	0x111923e2	! t1_kref+0x24a8:   	sethi	%hi(0x648f8800), %o0
	.word	0x952ac009	! t1_kref+0x24ac:   	sll	%o3, %o1, %o2
	.word	0xc3067ff8	! t1_kref+0x24b0:   	ld	[%i1 - 8], %f1
	.word	0xe3b8a100	! t1_kref+0x24b4:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0x96d5000a	! t1_kref+0x24b8:   	umulcc	%l4, %o2, %o3
	.word	0xaef4f277	! t1_kref+0x24bc:   	udivcc	%l3, -0xd89, %l7
	.word	0xf4380018	! t1_kref+0x24c0:   	std	%i2, [%g0 + %i0]
	.word	0xa8fd78d4	! t1_kref+0x24c4:   	sdivcc	%l5, -0x72c, %l4
	.word	0xb5a509b8	! t1_kref+0x24c8:   	fdivs	%f20, %f24, %f26
	.word	0xae06c01b	! t1_kref+0x24cc:   	add	%i3, %i3, %l7
	.word	0x95418000	! t1_kref+0x24d0:   	mov	%fprs, %o2
	.word	0x92b28008	! t1_kref+0x24d4:   	orncc	%o2, %o0, %o1
	.word	0x81b009b4	! t1_kref+0x24d8:   	fexpand	%f20, %f0
	.word	0x81a8ca38	! t1_kref+0x24dc:   	fcmps	%fcc0, %f3, %f24
	.word	0xe9e65009	! t1_kref+0x24e0:   	casa	[%i1]0x80, %o1, %l4
	.word	0x97b58550	! t1_kref+0x24e4:   	fcmpeq16	%f22, %f16, %o3
	.word	0xd000a034	! t1_kref+0x24e8:   	ld	[%g2 + 0x34], %o0
	.word	0x9fc10000	! t1_kref+0x24ec:   	call	%g4
	.word	0x9605c016	! t1_kref+0x24f0:   	add	%l7, %l6, %o3
	.word	0x91b0016a	! t1_kref+0x24f4:   	edge32ln	%g0, %o2, %o0
	.word	0x37800003	! t1_kref+0x24f8:   	fbge,a	_kref+0x2504
	.word	0x91b5c636	! t1_kref+0x24fc:   	fmul8x16	%f23, %f22, %f8
	.word	0x27480008	! t1_kref+0x2500:   	fbul,a,pt	%fcc0, _kref+0x2520
	.word	0xa7b385c2	! t1_kref+0x2504:   	fcmpeq32	%f14, %f2, %l3
	.word	0x32800002	! t1_kref+0x2508:   	bne,a	_kref+0x2510
	.word	0xab2ee006	! t1_kref+0x250c:   	sll	%i3, 0x6, %l5
	.word	0x96657ddf	! t1_kref+0x2510:   	subc	%l5, -0x221, %o3
	.word	0xe83e0000	! t1_kref+0x2514:   	std	%l4, [%i0]
	.word	0xb3a00030	! t1_kref+0x2518:   	fmovs	%f16, %f25
	.word	0x8d830014	! t1_kref+0x251c:   	wr	%o4, %l4, %fprs
	sethi	%hi(1f), %o7
	jmpl	%o7+%lo(1f), %g1
	.empty
	.word	0x95a388d8	! t1_kref+0x2528:   	fsubd	%f14, %f24, %f10
	.word	0xb3b0cef6	! t1_kref+0x252c:   	fornot2s	%f3, %f22, %f25
	.word	0xa5a00556	! t1_kref+0x2530:   	fsqrtd	%f22, %f18
	.word	0xe5e65008	! t1_kref+0x2534:   	casa	[%i1]0x80, %o0, %l2
1:	.word	0x91a109c6	! t1_kref+0x2538:   	fdivd	%f4, %f6, %f8
	.word	0xafa01a54	! t1_kref+0x253c:   	fdtoi	%f20, %f23
	.word	0x3d800005	! t1_kref+0x2540:   	fbule,a	_kref+0x2554
	.word	0xd00e001a	! t1_kref+0x2544:   	ldub	[%i0 + %i2], %o0
	.word	0x9082400b	! t1_kref+0x2548:   	addcc	%o1, %o3, %o0
	.word	0xaefec017	! t1_kref+0x254c:   	sdivcc	%i3, %l7, %l7
	.word	0xd656401b	! t1_kref+0x2550:   	ldsh	[%i1 + %i3], %o3
	.word	0x96b2c000	! t1_kref+0x2554:   	orncc	%o3, %g0, %o3
	.word	0xa1a089c2	! t1_kref+0x2558:   	fdivd	%f2, %f2, %f16
	.word	0x93a609ac	! t1_kref+0x255c:   	fdivs	%f24, %f12, %f9
	.word	0xc11fbdd8	! t1_kref+0x2560:   	ldd	[%fp - 0x228], %f0
	.word	0x81b28ac4	! t1_kref+0x2564:   	fpsub32	%f10, %f4, %f0
	.word	0x81a88a52	! t1_kref+0x2568:   	fcmpd	%fcc0, %f2, %f18
	.word	0x8fa3c9a7	! t1_kref+0x256c:   	fdivs	%f15, %f7, %f7
	.word	0xa9a189c0	! t1_kref+0x2570:   	fdivd	%f6, %f0, %f20
	.word	0xab25c00a	! t1_kref+0x2574:   	mulscc	%l7, %o2, %l5
	.word	0xada50d2a	! t1_kref+0x2578:   	fsmuld	%f20, %f10, %f22
	.word	0x95b540b4	! t1_kref+0x257c:   	edge16n	%l5, %l4, %o2
	.word	0x96f6800c	! t1_kref+0x2580:   	udivcc	%i2, %o4, %o3
	.word	0xaefb729f	! t1_kref+0x2584:   	sdivcc	%o5, -0xd61, %l7
	.word	0x111895cf	! t1_kref+0x2588:   	sethi	%hi(0x62573c00), %o0
	.word	0x94b83214	! t1_kref+0x258c:   	xnorcc	%g0, -0xdec, %o2
	.word	0xee567fec	! t1_kref+0x2590:   	ldsh	[%i1 - 0x14], %l7
	.word	0x85a308d4	! t1_kref+0x2594:   	fsubd	%f12, %f20, %f2
	.word	0x22480004	! t1_kref+0x2598:   	be,a,pt	%icc, _kref+0x25a8
	.word	0xa1a00537	! t1_kref+0x259c:   	fsqrts	%f23, %f16
	.word	0x947a8013	! t1_kref+0x25a0:   	sdiv	%o2, %l3, %o2
	.word	0xac86e13d	! t1_kref+0x25a4:   	addcc	%i3, 0x13d, %l6
	.word	0x97332006	! t1_kref+0x25a8:   	srl	%o4, 0x6, %o3
	.word	0x95b00fe0	! t1_kref+0x25ac:   	fones	%f10
	.word	0x2d3c7836	! t1_kref+0x25b0:   	sethi	%hi(0xf1e0d800), %l6
	.word	0x90f5224b	! t1_kref+0x25b4:   	udivcc	%l4, 0x24b, %o0
	.word	0xef20a004	! t1_kref+0x25b8:   	st	%f23, [%g2 + 4]
	.word	0x98e30013	! t1_kref+0x25bc:   	subccc	%o4, %l3, %o4
	call	SYM(t1_subr3)
	.word	0xd646600c	! t1_kref+0x25c4:   	ldsw	[%i1 + 0xc], %o3
	.word	0x9da88048	! t1_kref+0x25c8:   	fmovdlg	%fcc0, %f8, %f14
	.word	0x32800006	! t1_kref+0x25cc:   	bne,a	_kref+0x25e4
	.word	0xe3e65013	! t1_kref+0x25d0:   	casa	[%i1]0x80, %l3, %l1
	.word	0x81ab8a29	! t1_kref+0x25d4:   	fcmps	%fcc0, %f14, %f9
	.word	0x95a288cc	! t1_kref+0x25d8:   	fsubd	%f10, %f12, %f10
	.word	0x923b3316	! t1_kref+0x25dc:   	xnor	%o4, -0xcea, %o1
	.word	0x9855c00c	! t1_kref+0x25e0:   	umul	%l7, %o4, %o4
	.word	0x81b587d6	! t1_kref+0x25e4:   	pdist	%f22, %f22, %f0
	.word	0xa3b4ca7a	! t1_kref+0x25e8:   	fpadd32s	%f19, %f26, %f17
	.word	0xe91fbd20	! t1_kref+0x25ec:   	ldd	[%fp - 0x2e0], %f20
	.word	0x99b30d90	! t1_kref+0x25f0:   	fxor	%f12, %f16, %f12
	.word	0x9db5cae3	! t1_kref+0x25f4:   	fpsub32s	%f23, %f3, %f14
	.word	0x22800001	! t1_kref+0x25f8:   	be,a	_kref+0x25fc
	.word	0xa1a0012d	! t1_kref+0x25fc:   	fabss	%f13, %f16
	.word	0x96032bf1	! t1_kref+0x2600:   	add	%o4, 0xbf1, %o3
	.word	0xaac5a7ae	! t1_kref+0x2604:   	addccc	%l6, 0x7ae, %l5
	.word	0xadb20f44	! t1_kref+0x2608:   	fornot1	%f8, %f4, %f22
	.word	0xaf35801a	! t1_kref+0x260c:   	srl	%l6, %i2, %l7
	.word	0x8143c000	! t1_kref+0x2610:   	stbar
	.word	0xd7070018	! t1_kref+0x2614:   	ld	[%i4 + %i0], %f11
	.word	0x81ac4aba	! t1_kref+0x2618:   	fcmpes	%fcc0, %f17, %f26
	.word	0xdd1fbe58	! t1_kref+0x261c:   	ldd	[%fp - 0x1a8], %f14
	.word	0xaac20017	! t1_kref+0x2620:   	addccc	%o0, %l7, %l5
	.word	0x81b1070d	! t1_kref+0x2624:   	fmuld8sux16	%f4, %f13, %f0
	.word	0x9052c013	! t1_kref+0x2628:   	umul	%o3, %l3, %o0
	.word	0xe6366006	! t1_kref+0x262c:   	sth	%l3, [%i1 + 6]
	.word	0xa9b10ecc	! t1_kref+0x2630:   	fornot2	%f4, %f12, %f20
	.word	0x81dd3c59	! t1_kref+0x2634:   	flush	%l4 - 0x3a7
	.word	0x81ac8a44	! t1_kref+0x2638:   	fcmpd	%fcc0, %f18, %f4
	.word	0x81ad8aa3	! t1_kref+0x263c:   	fcmpes	%fcc0, %f22, %f3
	.word	0x173bcd82	! t1_kref+0x2640:   	sethi	%hi(0xef360800), %o3
	.word	0x15007fae	! t1_kref+0x2644:   	sethi	%hi(0x1feb800), %o2
	.word	0xeb68a085	! t1_kref+0x2648:   	prefetch	%g2 + 0x85, 21
	.word	0xa7a0012e	! t1_kref+0x264c:   	fabss	%f14, %f19
	.word	0xb1b48e65	! t1_kref+0x2650:   	fxnors	%f18, %f5, %f24
	.word	0x81aa8ad8	! t1_kref+0x2654:   	fcmped	%fcc0, %f10, %f24
	.word	0x89b3096a	! t1_kref+0x2658:   	fpmerge	%f12, %f10, %f4
	.word	0xa5b48918	! t1_kref+0x265c:   	faligndata	%f18, %f24, %f18
	.word	0x95a01911	! t1_kref+0x2660:   	fitod	%f17, %f10
	.word	0x91a58931	! t1_kref+0x2664:   	fmuls	%f22, %f17, %f8
	.word	0xd3067fe4	! t1_kref+0x2668:   	ld	[%i1 - 0x1c], %f9
	.word	0xa69a31dd	! t1_kref+0x266c:   	xorcc	%o0, -0xe23, %l3
	.word	0x89b406c0	! t1_kref+0x2670:   	fmul8sux16	%f16, %f0, %f4
	.word	0xc7263fe0	! t1_kref+0x2674:   	st	%f3, [%i0 - 0x20]
	.word	0xd8380019	! t1_kref+0x2678:   	std	%o4, [%g0 + %i1]
	.word	0xaa324016	! t1_kref+0x267c:   	orn	%o1, %l6, %l5
	sethi	%hi(2f), %o7
	.word	0xe40be2a8	! t1_kref+0x2684:   	ldub	[%o7 + 0x2a8], %l2
	.word	0xa41ca00c	! t1_kref+0x2688:   	xor	%l2, 0xc, %l2
	.word	0xe42be2a8	! t1_kref+0x268c:   	stb	%l2, [%o7 + 0x2a8]
	.word	0x81dbe2a8	! t1_kref+0x2690:   	flush	%o7 + 0x2a8
	.word	0xb1b2cea0	! t1_kref+0x2694:   	fsrc1s	%f11, %f24
	.word	0xb3b04a39	! t1_kref+0x2698:   	fpadd16s	%f1, %f25, %f25
	.word	0xb1b287c0	! t1_kref+0x269c:   	pdist	%f10, %f0, %f24
	.word	0x96930017	! t1_kref+0x26a0:   	orcc	%o4, %l7, %o3
	.word	0xa9b506f0	! t1_kref+0x26a4:   	fmul8ulx16	%f20, %f16, %f20
2:	.word	0x9922000b	! t1_kref+0x26a8:   	mulscc	%o0, %o3, %o4
	.word	0xadb240b5	! t1_kref+0x26ac:   	edge16n	%o1, %l5, %l6
	.word	0x28480001	! t1_kref+0x26b0:   	bleu,a,pt	%icc, _kref+0x26b4
	.word	0x8ba01a42	! t1_kref+0x26b4:   	fdtoi	%f2, %f5
	.word	0xd07e6010	! t1_kref+0x26b8:   	swap	[%i1 + 0x10], %o0
	.word	0xa3b10ea0	! t1_kref+0x26bc:   	fsrc1s	%f4, %f17
	.word	0x81a01028	! t1_kref+0x26c0:   	fstox	%f8, %f0
	.word	0xae9dc009	! t1_kref+0x26c4:   	xorcc	%l7, %o1, %l7
	.word	0x8143c000	! t1_kref+0x26c8:   	stbar
	.word	0x3c480004	! t1_kref+0x26cc:   	bpos,a,pt	%icc, _kref+0x26dc
	.word	0xabb5c140	! t1_kref+0x26d0:   	edge32l	%l7, %g0, %l5
	.word	0xa3a01082	! t1_kref+0x26d4:   	fxtos	%f2, %f17
	.word	0xa9b685d2	! t1_kref+0x26d8:   	fcmpeq32	%f26, %f18, %l4
	.word	0xe4680019	! t1_kref+0x26dc:   	ldstub	[%g0 + %i1], %l2
	.word	0x8da509d8	! t1_kref+0x26e0:   	fdivd	%f20, %f24, %f6
	.word	0x81ad0ace	! t1_kref+0x26e4:   	fcmped	%fcc0, %f20, %f14
	.word	0x95a01922	! t1_kref+0x26e8:   	fstod	%f2, %f10
	.word	0x8186c000	! t1_kref+0x26ec:   	wr	%i3, %g0, %y
	.word	0xec80105c	! t1_kref+0x26f0:   	lda	[%g0 + %i4]0x82, %l6
	.word	0x81a0190e	! t1_kref+0x26f4:   	fitod	%f14, %f0
	.word	0x95a00537	! t1_kref+0x26f8:   	fsqrts	%f23, %f10
	.word	0xc3067ff8	! t1_kref+0x26fc:   	ld	[%i1 - 8], %f1
	.word	0x961a8009	! t1_kref+0x2700:   	xor	%o2, %o1, %o3
	.word	0xab26c014	! t1_kref+0x2704:   	mulscc	%i3, %l4, %l5
	.word	0xc0ee101a	! t1_kref+0x2708:   	ldstuba	[%i0 + %i2]0x80, %g0
	.word	0xd9be1857	! t1_kref+0x270c:   	stda	%f12, [%i0 + %l7]0xc2
	.word	0x22800004	! t1_kref+0x2710:   	be,a	_kref+0x2720
	.word	0x89b40c4a	! t1_kref+0x2714:   	fnor	%f16, %f10, %f4
	.word	0xa9b50592	! t1_kref+0x2718:   	fcmpgt32	%f20, %f18, %l4
	.word	0x90d2fe21	! t1_kref+0x271c:   	umulcc	%o3, -0x1df, %o0
	.word	0xe26e8018	! t1_kref+0x2720:   	ldstub	[%i2 + %i0], %l1
	.word	0x2e800001	! t1_kref+0x2724:   	bvs,a	_kref+0x2728
	.word	0xaba01881	! t1_kref+0x2728:   	fitos	%f1, %f21
	.word	0xf11fbef0	! t1_kref+0x272c:   	ldd	[%fp - 0x110], %f24
	.word	0xad0d6fcf	! t1_kref+0x2730:   	tsubcc	%l5, 0xfcf, %l6
	.word	0x81df4001	! t1_kref+0x2734:   	flush	%i5 + %g1
	.word	0x91a01a42	! t1_kref+0x2738:   	fdtoi	%f2, %f8
	.word	0xd27f0019	! t1_kref+0x273c:   	swap	[%i4 + %i1], %o1
	.word	0xa7b00772	! t1_kref+0x2740:   	fpack16	%f18, %f19
	.word	0x90f24015	! t1_kref+0x2744:   	udivcc	%o1, %l5, %o0
	.word	0xa8a2a4e9	! t1_kref+0x2748:   	subcc	%o2, 0x4e9, %l4
	.word	0xace3000b	! t1_kref+0x274c:   	subccc	%o4, %o3, %l6
	.word	0xaab36461	! t1_kref+0x2750:   	orncc	%o5, 0x461, %l5
	.word	0x9fc00004	! t1_kref+0x2754:   	call	%g0 + %g4
	.word	0x97b28157	! t1_kref+0x2758:   	edge32l	%o2, %l7, %o3
	.word	0x98f261db	! t1_kref+0x275c:   	udivcc	%o1, 0x1db, %o4
	.word	0xaad4f305	! t1_kref+0x2760:   	umulcc	%l3, -0xcfb, %l5
	.word	0xaf256e80	! t1_kref+0x2764:   	mulscc	%l5, 0xe80, %l7
	.word	0xaaf50015	! t1_kref+0x2768:   	udivcc	%l4, %l5, %l5
	.word	0x81ab0aab	! t1_kref+0x276c:   	fcmpes	%fcc0, %f12, %f11
	.word	0x8da01932	! t1_kref+0x2770:   	fstod	%f18, %f6
	.word	0xe3b8a100	! t1_kref+0x2774:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0x8da3084c	! t1_kref+0x2778:   	faddd	%f12, %f12, %f6
	.word	0xa9368017	! t1_kref+0x277c:   	srl	%i2, %l7, %l4
	.word	0x81ae8a37	! t1_kref+0x2780:   	fcmps	%fcc0, %f26, %f23
	.word	0xd2566018	! t1_kref+0x2784:   	ldsh	[%i1 + 0x18], %o1
	.word	0xc1be180a	! t1_kref+0x2788:   	stda	%f0, [%i0 + %o2]0xc0
	.word	0x8143c000	! t1_kref+0x278c:   	stbar
	.word	0xea2e3ffd	! t1_kref+0x2790:   	stb	%l5, [%i0 - 3]
	.word	0x91b2430c	! t1_kref+0x2794:   	alignaddr	%o1, %o4, %o0
	.word	0x9200260b	! t1_kref+0x2798:   	add	%g0, 0x60b, %o1
	.word	0xe59e101d	! t1_kref+0x279c:   	ldda	[%i0 + %i5]0x80, %f18
	.word	0xee8e501a	! t1_kref+0x27a0:   	lduba	[%i1 + %i2]0x80, %l7
	.word	0x962cf6a3	! t1_kref+0x27a4:   	andn	%l3, -0x95d, %o3
	.word	0xc320a02c	! t1_kref+0x27a8:   	st	%f1, [%g2 + 0x2c]
	.word	0xe3b8a100	! t1_kref+0x27ac:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0xa715c000	! t1_kref+0x27b0:   	taddcctv	%l7, %g0, %l3
	.word	0x96637d31	! t1_kref+0x27b4:   	subc	%o5, -0x2cf, %o3
	.word	0xa63cff34	! t1_kref+0x27b8:   	xnor	%l3, -0xcc, %l3
	.word	0x93b2c34c	! t1_kref+0x27bc:   	alignaddrl	%o3, %o4, %o1
	.word	0xb5a01a4e	! t1_kref+0x27c0:   	fdtoi	%f14, %f26
	.word	0x91a01a56	! t1_kref+0x27c4:   	fdtoi	%f22, %f8
	.word	0x81aa0ab6	! t1_kref+0x27c8:   	fcmpes	%fcc0, %f8, %f22
	.word	0xe8500019	! t1_kref+0x27cc:   	ldsh	[%g0 + %i1], %l4
	.word	0x90b00017	! t1_kref+0x27d0:   	orncc	%g0, %l7, %o0
	.word	0x89a38850	! t1_kref+0x27d4:   	faddd	%f14, %f16, %f4
	.word	0x292df44f	! t1_kref+0x27d8:   	sethi	%hi(0xb7d13c00), %l4
	.word	0xa7b58169	! t1_kref+0x27dc:   	edge32ln	%l6, %o1, %l3
	.word	0x953d8016	! t1_kref+0x27e0:   	sra	%l6, %l6, %o2
	.word	0x89a189c8	! t1_kref+0x27e4:   	fdivd	%f6, %f8, %f4
	.word	0x90dec009	! t1_kref+0x27e8:   	smulcc	%i3, %o1, %o0
	.word	0xf11fbcd0	! t1_kref+0x27ec:   	ldd	[%fp - 0x330], %f24
	.word	0x81ac0ad8	! t1_kref+0x27f0:   	fcmped	%fcc0, %f16, %f24
	sethi	%hi(2f), %o7
	.word	0xe40be00c	! t1_kref+0x27f8:   	ldub	[%o7 + 0xc], %l2
	.word	0xa41ca00c	! t1_kref+0x27fc:   	xor	%l2, 0xc, %l2
	.word	0xe42be00c	! t1_kref+0x2800:   	stb	%l2, [%o7 + 0xc]
	.word	0x81dbe00c	! t1_kref+0x2804:   	flush	%o7 + 0xc
	.word	0x89b48ac4	! t1_kref+0x2808:   	fpsub32	%f18, %f4, %f4
2:	.word	0xaa1a7e63	! t1_kref+0x280c:   	xor	%o1, -0x19d, %l5
	.word	0x87a018d6	! t1_kref+0x2810:   	fdtos	%f22, %f3
	.word	0xa9b305d2	! t1_kref+0x2814:   	fcmpeq32	%f12, %f18, %l4
	.word	0x8d8574a5	! t1_kref+0x2818:   	wr	%l5, 0xfffff4a5, %fprs
	.word	0xae532035	! t1_kref+0x281c:   	umul	%o4, 0x35, %l7
	.word	0xacb36fce	! t1_kref+0x2820:   	orncc	%o5, 0xfce, %l6
	.word	0x97408000	! t1_kref+0x2824:   	mov	%ccr, %o3
	.word	0xadb38d2f	! t1_kref+0x2828:   	fandnot1s	%f14, %f15, %f22
	.word	0x8da01914	! t1_kref+0x282c:   	fitod	%f20, %f6
	.word	0xec3e4000	! t1_kref+0x2830:   	std	%l6, [%i1]
	.word	0xa8358014	! t1_kref+0x2834:   	orn	%l6, %l4, %l4
	.word	0x38480005	! t1_kref+0x2838:   	bgu,a,pt	%icc, _kref+0x284c
	.word	0xebf65014	! t1_kref+0x283c:   	casxa	[%i1]0x80, %l4, %l5
	.word	0x3a800006	! t1_kref+0x2840:   	bcc,a	_kref+0x2858
	.word	0xea871018	! t1_kref+0x2844:   	lda	[%i4 + %i0]0x80, %l5
	.word	0xe8470019	! t1_kref+0x2848:   	ldsw	[%i4 + %i1], %l4
	.word	0xf62e0000	! t1_kref+0x284c:   	stb	%i3, [%i0]
	.word	0xd856c018	! t1_kref+0x2850:   	ldsh	[%i3 + %i0], %o4
	.word	0xaa42400d	! t1_kref+0x2854:   	addc	%o1, %o5, %l5
	.word	0xe67e201c	! t1_kref+0x2858:   	swap	[%i0 + 0x1c], %l3
	.word	0x8610200a	! t1_kref+0x285c:   	mov	0xa, %g3
	.word	0x86a0e001	! t1_kref+0x2860:   	subcc	%g3, 1, %g3
	.word	0x22800018	! t1_kref+0x2864:   	be,a	_kref+0x28c4
	.word	0x81d94000	! t1_kref+0x2868:   	flush	%g5
	.word	0x95a588c8	! t1_kref+0x286c:   	fsubd	%f22, %f8, %f10
	.word	0xa62d251f	! t1_kref+0x2870:   	andn	%l4, 0x51f, %l3
	.word	0x85b38dc4	! t1_kref+0x2874:   	fnand	%f14, %f4, %f2
	.word	0x858525dd	! t1_kref+0x2878:   	wr	%l4, 0x5dd, %ccr
	.word	0xad40c000	! t1_kref+0x287c:   	mov	%asi, %l6
	.word	0x933ea01f	! t1_kref+0x2880:   	sra	%i2, 0x1f, %o1
	.word	0xa81d2174	! t1_kref+0x2884:   	xor	%l4, 0x174, %l4
	.word	0xacda6e3e	! t1_kref+0x2888:   	smulcc	%o1, 0xe3e, %l6
	.word	0x9402ac6f	! t1_kref+0x288c:   	add	%o2, 0xc6f, %o2
	.word	0xae7a8017	! t1_kref+0x2890:   	sdiv	%o2, %l7, %l7
	.word	0xa5b4cea0	! t1_kref+0x2894:   	fsrc1s	%f19, %f18
	.word	0x95b00f2a	! t1_kref+0x2898:   	fsrc2s	%f10, %f10
	.word	0x81ad0ac2	! t1_kref+0x289c:   	fcmped	%fcc0, %f20, %f2
	.word	0x81a90aca	! t1_kref+0x28a0:   	fcmped	%fcc0, %f4, %f10
	.word	0x81ac0aa7	! t1_kref+0x28a4:   	fcmpes	%fcc0, %f16, %f7
	.word	0xee560000	! t1_kref+0x28a8:   	ldsh	[%i0], %l7
	call	SYM(t1_subr0)
	.word	0xada01918	! t1_kref+0x28b0:   	fitod	%f24, %f22
	.word	0x32480003	! t1_kref+0x28b4:   	bne,a,pt	%icc, _kref+0x28c0
	.word	0xa9b5c0ba	! t1_kref+0x28b8:   	edge16n	%l7, %i2, %l4
	.word	0xe500a00c	! t1_kref+0x28bc:   	ld	[%g2 + 0xc], %f18
	.word	0x8fa00023	! t1_kref+0x28c0:   	fmovs	%f3, %f7
	.word	0x86102003	! t1_kref+0x28c4:   	mov	0x3, %g3
	.word	0x32800000	! t1_kref+0x28c8:   	bne,a	_kref+0x28c8
	.word	0x86a0e001	! t1_kref+0x28cc:   	subcc	%g3, 1, %g3
	.word	0xeb00a014	! t1_kref+0x28d0:   	ld	[%g2 + 0x14], %f21
	.word	0xd51fbef0	! t1_kref+0x28d4:   	ldd	[%fp - 0x110], %f10
	.word	0xa5a00137	! t1_kref+0x28d8:   	fabss	%f23, %f18
	.word	0xa7b58240	! t1_kref+0x28dc:   	array16	%l6, %g0, %l3
	.word	0x86102013	! t1_kref+0x28e0:   	mov	0x13, %g3
	.word	0x86a0e001	! t1_kref+0x28e4:   	subcc	%g3, 1, %g3
	.word	0x2280000a	! t1_kref+0x28e8:   	be,a	_kref+0x2910
	.word	0xd9000019	! t1_kref+0x28ec:   	ld	[%g0 + %i1], %f12
	.word	0xae22000a	! t1_kref+0x28f0:   	sub	%o0, %o2, %l7
	.word	0x981d4016	! t1_kref+0x28f4:   	xor	%l5, %l6, %o4
	.word	0x9fa01a4c	! t1_kref+0x28f8:   	fdtoi	%f12, %f15
	.word	0xd47e7ffc	! t1_kref+0x28fc:   	swap	[%i1 - 4], %o2
	.word	0x951ea3d2	! t1_kref+0x2900:   	tsubcctv	%i2, 0x3d2, %o2
	.word	0x9032801b	! t1_kref+0x2904:   	orn	%o2, %i3, %o0
	.word	0xa9b58444	! t1_kref+0x2908:   	fcmpne16	%f22, %f4, %l4
	.word	0xa8828015	! t1_kref+0x290c:   	addcc	%o2, %l5, %l4
	.word	0xa846c00a	! t1_kref+0x2910:   	addc	%i3, %o2, %l4
	.word	0x81ac0ad4	! t1_kref+0x2914:   	fcmped	%fcc0, %f16, %f20
	.word	0xacfa620a	! t1_kref+0x2918:   	sdivcc	%o1, 0x20a, %l6
	.word	0xc5064000	! t1_kref+0x291c:   	ld	[%i1], %f2
	.word	0xafb6831a	! t1_kref+0x2920:   	alignaddr	%i2, %i2, %l7
	.word	0xa8ddc000	! t1_kref+0x2924:   	smulcc	%l7, %g0, %l4
	.word	0x81a84a22	! t1_kref+0x2928:   	fcmps	%fcc0, %f1, %f2
	.word	0xd068a01d	! t1_kref+0x292c:   	ldstub	[%g2 + 0x1d], %o0
	.word	0x97b540a8	! t1_kref+0x2930:   	edge16n	%l5, %o0, %o3
	.word	0xee30a03e	! t1_kref+0x2934:   	sth	%l7, [%g2 + 0x3e]
	.word	0x81ad4a2e	! t1_kref+0x2938:   	fcmps	%fcc0, %f21, %f14
	.word	0x81ad8a4e	! t1_kref+0x293c:   	fcmpd	%fcc0, %f22, %f14
	.word	0xaab5400c	! t1_kref+0x2940:   	orncc	%l5, %o4, %l5
	.word	0x9fc10000	! t1_kref+0x2944:   	call	%g4
	.word	0x9db10738	! t1_kref+0x2948:   	fmuld8ulx16	%f4, %f24, %f14
	.word	0xabb28a21	! t1_kref+0x294c:   	fpadd16s	%f10, %f1, %f21
	call	SYM(t1_subr0)
	.word	0x93b5c348	! t1_kref+0x2954:   	alignaddrl	%l7, %o0, %o1
	.word	0x81ad8a4a	! t1_kref+0x2958:   	fcmpd	%fcc0, %f22, %f10
	.word	0xe3b8a100	! t1_kref+0x295c:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0xa9b18986	! t1_kref+0x2960:   	bshuffle	%f6, %f6, %f20
	.word	0xae02c015	! t1_kref+0x2964:   	add	%o3, %l5, %l7
	.word	0x9da588ca	! t1_kref+0x2968:   	fsubd	%f22, %f10, %f14
	.word	0xd630a02e	! t1_kref+0x296c:   	sth	%o3, [%g2 + 0x2e]
	.word	0x91a308d0	! t1_kref+0x2970:   	fsubd	%f12, %f16, %f8
	.word	0x90533d05	! t1_kref+0x2974:   	umul	%o4, -0x2fb, %o0
	.word	0xa680000c	! t1_kref+0x2978:   	addcc	%g0, %o4, %l3
	.word	0xf386501c	! t1_kref+0x297c:   	lda	[%i1 + %i4]0x80, %f25
	.word	0xa9a01a50	! t1_kref+0x2980:   	fdtoi	%f16, %f20
	.word	0xdd06601c	! t1_kref+0x2984:   	ld	[%i1 + 0x1c], %f14
	.word	0x37800007	! t1_kref+0x2988:   	fbge,a	_kref+0x29a4
	.word	0x973b400c	! t1_kref+0x298c:   	sra	%o5, %o4, %o3
	.word	0x981b26ff	! t1_kref+0x2990:   	xor	%o4, 0x6ff, %o4
	.word	0xaab5c017	! t1_kref+0x2994:   	orncc	%l7, %l7, %l5
	.word	0x85b58f54	! t1_kref+0x2998:   	fornot1	%f22, %f20, %f2
	.word	0x3a480007	! t1_kref+0x299c:   	bcc,a,pt	%icc, _kref+0x29b8
	.word	0x969a4015	! t1_kref+0x29a0:   	xorcc	%o1, %l5, %o3
	.word	0xd0162014	! t1_kref+0x29a4:   	lduh	[%i0 + 0x14], %o0
	.word	0x9235c00c	! t1_kref+0x29a8:   	orn	%l7, %o4, %o1
	.word	0xd26e6013	! t1_kref+0x29ac:   	ldstub	[%i1 + 0x13], %o1
	.word	0xa3a0052e	! t1_kref+0x29b0:   	fsqrts	%f14, %f17
	.word	0xabb2854e	! t1_kref+0x29b4:   	fcmpeq16	%f10, %f14, %l5
	.word	0xecd6d018	! t1_kref+0x29b8:   	ldsha	[%i3 + %i0]0x80, %l6
	.word	0x81a88a4e	! t1_kref+0x29bc:   	fcmpd	%fcc0, %f2, %f14
	.word	0xaab570e9	! t1_kref+0x29c0:   	orncc	%l5, -0xf17, %l5
	.word	0xa1a309d0	! t1_kref+0x29c4:   	fdivd	%f12, %f16, %f16
	.word	0xabb60556	! t1_kref+0x29c8:   	fcmpeq16	%f24, %f22, %l5
	.word	0x8da10948	! t1_kref+0x29cc:   	fmuld	%f4, %f8, %f6
	.word	0x981ab43c	! t1_kref+0x29d0:   	xor	%o2, -0xbc4, %o4
	.word	0x91a018d0	! t1_kref+0x29d4:   	fdtos	%f16, %f8
	call	1f
	.empty
	.word	0xada01a4c	! t1_kref+0x29dc:   	fdtoi	%f12, %f22
	.word	0xd8e81018	! t1_kref+0x29e0:   	ldstuba	[%g0 + %i0]0x80, %o4
	.word	0xaafdc00d	! t1_kref+0x29e4:   	sdivcc	%l7, %o5, %l5
	.word	0xa8020008	! t1_kref+0x29e8:   	add	%o0, %o0, %l4
	.word	0x97b50542	! t1_kref+0x29ec:   	fcmpeq16	%f20, %f2, %o3
1:	.word	0xd810a00c	! t1_kref+0x29f0:   	lduh	[%g2 + 0xc], %o4
	.word	0x34800008	! t1_kref+0x29f4:   	bg,a	_kref+0x2a14
	.word	0x292d0fe2	! t1_kref+0x29f8:   	sethi	%hi(0xb43f8800), %l4
	.word	0xd03e0000	! t1_kref+0x29fc:   	std	%o0, [%i0]
	.word	0x94fd4009	! t1_kref+0x2a00:   	sdivcc	%l5, %o1, %o2
	.word	0x97b58349	! t1_kref+0x2a04:   	alignaddrl	%l6, %o1, %o3
	.word	0x2f480007	! t1_kref+0x2a08:   	fbu,a,pt	%fcc0, _kref+0x2a24
	.word	0xd656601e	! t1_kref+0x2a0c:   	ldsh	[%i1 + 0x1e], %o3
	.word	0xa1b18a86	! t1_kref+0x2a10:   	fpsub16	%f6, %f6, %f16
	.word	0xa882735f	! t1_kref+0x2a14:   	addcc	%o1, -0xca1, %l4
	.word	0x95b60f50	! t1_kref+0x2a18:   	fornot1	%f24, %f16, %f10
	.word	0x85b08e69	! t1_kref+0x2a1c:   	fxnors	%f2, %f9, %f2
	.word	0xe5ee101c	! t1_kref+0x2a20:   	prefetcha	%i0 + %i4, 18
	.word	0xd696d019	! t1_kref+0x2a24:   	lduha	[%i3 + %i1]0x80, %o3
	.word	0xa7b680ab	! t1_kref+0x2a28:   	edge16n	%i2, %o3, %l3
	.word	0xa93a600d	! t1_kref+0x2a2c:   	sra	%o1, 0xd, %l4
	.word	0x85820015	! t1_kref+0x2a30:   	wr	%o0, %l5, %ccr
	.word	0xe500a03c	! t1_kref+0x2a34:   	ld	[%g2 + 0x3c], %f18
	.word	0xaec6c00d	! t1_kref+0x2a38:   	addccc	%i3, %o5, %l7
	.word	0xe1bf5a59	! t1_kref+0x2a3c:   	stda	%f16, [%i5 + %i1]0xd2
	.word	0xa9a60856	! t1_kref+0x2a40:   	faddd	%f24, %f22, %f20
	sethi	%hi(2f), %o7
	.word	0xe40be27c	! t1_kref+0x2a48:   	ldub	[%o7 + 0x27c], %l2
	.word	0xa41ca00c	! t1_kref+0x2a4c:   	xor	%l2, 0xc, %l2
	.word	0xe42be27c	! t1_kref+0x2a50:   	stb	%l2, [%o7 + 0x27c]
	.word	0x81dbe27c	! t1_kref+0x2a54:   	flush	%o7 + 0x27c
	.word	0x8fa00530	! t1_kref+0x2a58:   	fsqrts	%f16, %f7
	.word	0xc76e6000	! t1_kref+0x2a5c:   	prefetch	%i1, 3
	.word	0xa1a018d2	! t1_kref+0x2a60:   	fdtos	%f18, %f16
	.word	0xd816c018	! t1_kref+0x2a64:   	lduh	[%i3 + %i0], %o4
	.word	0x2d2486a1	! t1_kref+0x2a68:   	sethi	%hi(0x921a8400), %l6
	.word	0xa694c015	! t1_kref+0x2a6c:   	orcc	%l3, %l5, %l3
	.word	0xc568a100	! t1_kref+0x2a70:   	prefetch	%g2 + 0x100, 2
	.word	0x92d4edc4	! t1_kref+0x2a74:   	umulcc	%l3, 0xdc4, %o1
	.word	0xa8332907	! t1_kref+0x2a78:   	orn	%o4, 0x907, %l4
2:	.word	0xa7b240bb	! t1_kref+0x2a7c:   	edge16n	%o1, %i3, %l3
	.word	0xaede8015	! t1_kref+0x2a80:   	smulcc	%i2, %l5, %l7
	.word	0xef68a040	! t1_kref+0x2a84:   	prefetch	%g2 + 0x40, 23
	.word	0xf9ee101a	! t1_kref+0x2a88:   	prefetcha	%i0 + %i2, 28
	.word	0x81ab0aa1	! t1_kref+0x2a8c:   	fcmpes	%fcc0, %f12, %f1
	.word	0xa7b6040c	! t1_kref+0x2a90:   	fcmple16	%f24, %f12, %l3
	.word	0xa8adb406	! t1_kref+0x2a94:   	andncc	%l6, -0xbfa, %l4
	.word	0xd8380019	! t1_kref+0x2a98:   	std	%o4, [%g0 + %i1]
	.word	0xa6153c72	! t1_kref+0x2a9c:   	or	%l4, -0x38e, %l3
	.word	0xec1f4019	! t1_kref+0x2aa0:   	ldd	[%i5 + %i1], %l6
	.word	0x972b0008	! t1_kref+0x2aa4:   	sll	%o4, %o0, %o3
	.word	0xd926001c	! t1_kref+0x2aa8:   	st	%f12, [%i0 + %i4]
	.word	0xa7b4c115	! t1_kref+0x2aac:   	edge32	%l3, %l5, %l3
	.word	0xae3e8017	! t1_kref+0x2ab0:   	xnor	%i2, %l7, %l7
	.word	0xab35601d	! t1_kref+0x2ab4:   	srl	%l5, 0x1d, %l5
	.word	0x34800007	! t1_kref+0x2ab8:   	bg,a	_kref+0x2ad4
	.word	0xa69aa10c	! t1_kref+0x2abc:   	xorcc	%o2, 0x10c, %l3
	.word	0xdf264000	! t1_kref+0x2ac0:   	st	%f15, [%i1]
	.word	0x92fa2b27	! t1_kref+0x2ac4:   	sdivcc	%o0, 0xb27, %o1
	.word	0x95b4858c	! t1_kref+0x2ac8:   	fcmpgt32	%f18, %f12, %o2
	.word	0xe8c71018	! t1_kref+0x2acc:   	ldswa	[%i4 + %i0]0x80, %l4
	.word	0xae658016	! t1_kref+0x2ad0:   	subc	%l6, %l6, %l7
	.word	0xae534014	! t1_kref+0x2ad4:   	umul	%o5, %l4, %l7
	.word	0x3e800008	! t1_kref+0x2ad8:   	bvc,a	_kref+0x2af8
	.word	0x13330dda	! t1_kref+0x2adc:   	sethi	%hi(0xcc376800), %o1
	.word	0xc1e6500d	! t1_kref+0x2ae0:   	casa	[%i1]0x80, %o5, %g0
	.word	0xc06e001a	! t1_kref+0x2ae4:   	ldstub	[%i0 + %i2], %g0
	.word	0x8fb08a3a	! t1_kref+0x2ae8:   	fpadd16s	%f2, %f26, %f7
	.word	0x908b4016	! t1_kref+0x2aec:   	andcc	%o5, %l6, %o0
	.word	0x2f480007	! t1_kref+0x2af0:   	fbu,a,pt	%fcc0, _kref+0x2b0c
	.word	0x96537170	! t1_kref+0x2af4:   	umul	%o5, -0xe90, %o3
	.word	0x3b800007	! t1_kref+0x2af8:   	fble,a	_kref+0x2b14
	.word	0xe81e6000	! t1_kref+0x2afc:   	ldd	[%i1], %l4
	.word	0x99a30944	! t1_kref+0x2b00:   	fmuld	%f12, %f4, %f12
	.word	0x2b1227a2	! t1_kref+0x2b04:   	sethi	%hi(0x489e8800), %l5
	.word	0xb1a408a1	! t1_kref+0x2b08:   	fsubs	%f16, %f1, %f24
	.word	0xab33600a	! t1_kref+0x2b0c:   	srl	%o5, 0xa, %l5
	.word	0xa3a01899	! t1_kref+0x2b10:   	fitos	%f25, %f17
	.word	0xea2e8019	! t1_kref+0x2b14:   	stb	%l5, [%i2 + %i1]
	.word	0x2a480008	! t1_kref+0x2b18:   	bcs,a,pt	%icc, _kref+0x2b38
	.word	0xaf2264c4	! t1_kref+0x2b1c:   	mulscc	%o1, 0x4c4, %l7
	.word	0x9262800c	! t1_kref+0x2b20:   	subc	%o2, %o4, %o1
	.word	0xec28a01f	! t1_kref+0x2b24:   	stb	%l6, [%g2 + 0x1f]
	.word	0xe9ee501d	! t1_kref+0x2b28:   	prefetcha	%i1 + %i5, 20
	.word	0x99408000	! t1_kref+0x2b2c:   	mov	%ccr, %o4
	.word	0xa662f001	! t1_kref+0x2b30:   	subc	%o3, -0xfff, %l3
	.word	0x99b00ac0	! t1_kref+0x2b34:   	fpsub32	%f0, %f0, %f12
	.word	0xd620a02c	! t1_kref+0x2b38:   	st	%o3, [%g2 + 0x2c]
	.word	0x22800007	! t1_kref+0x2b3c:   	be,a	_kref+0x2b58
	.word	0x93a0052f	! t1_kref+0x2b40:   	fsqrts	%f15, %f9
	.word	0x20800008	! t1_kref+0x2b44:   	bn,a	_kref+0x2b64
	.word	0xaead0017	! t1_kref+0x2b48:   	andncc	%l4, %l7, %l7
	.word	0x2928a2b5	! t1_kref+0x2b4c:   	sethi	%hi(0xa28ad400), %l4
	.word	0xa93d4017	! t1_kref+0x2b50:   	sra	%l5, %l7, %l4
	.word	0xa81afc65	! t1_kref+0x2b54:   	xor	%o3, -0x39b, %l4
	.word	0x9665c017	! t1_kref+0x2b58:   	subc	%l7, %l7, %o3
	.word	0xb3b34cba	! t1_kref+0x2b5c:   	fandnot2s	%f13, %f26, %f25
	.word	0x9415400a	! t1_kref+0x2b60:   	or	%l5, %o2, %o2
	.word	0x98326a16	! t1_kref+0x2b64:   	orn	%o1, 0xa16, %o4
	.word	0x85a30958	! t1_kref+0x2b68:   	fmuld	%f12, %f24, %f2
	.word	0xd67f0018	! t1_kref+0x2b6c:   	swap	[%i4 + %i0], %o3
	.word	0xe9be1848	! t1_kref+0x2b70:   	stda	%f20, [%i0 + %o0]0xc2
	.word	0xc3266014	! t1_kref+0x2b74:   	st	%f1, [%i1 + 0x14]
	.word	0xacf2a8b9	! t1_kref+0x2b78:   	udivcc	%o2, 0x8b9, %l6
	.word	0x81ac8ac6	! t1_kref+0x2b7c:   	fcmped	%fcc0, %f18, %f6
	.word	0x20800001	! t1_kref+0x2b80:   	bn,a	_kref+0x2b84
	.word	0x87a01890	! t1_kref+0x2b84:   	fitos	%f16, %f3
	.word	0xa7b20160	! t1_kref+0x2b88:   	edge32ln	%o0, %g0, %l3
	.word	0xa5a018c0	! t1_kref+0x2b8c:   	fdtos	%f0, %f18
	.word	0x8da4894a	! t1_kref+0x2b90:   	fmuld	%f18, %f10, %f6
	.word	0xafb38ea0	! t1_kref+0x2b94:   	fsrc1s	%f14, %f23
	.word	0xac1ec013	! t1_kref+0x2b98:   	xor	%i3, %l3, %l6
	.word	0x95b40a52	! t1_kref+0x2b9c:   	fpadd32	%f16, %f18, %f10
	.word	0xd20e8019	! t1_kref+0x2ba0:   	ldub	[%i2 + %i1], %o1
	.word	0x94d32ccc	! t1_kref+0x2ba4:   	umulcc	%o4, 0xccc, %o2
	.word	0xc02e7fe4	! t1_kref+0x2ba8:   	clrb	[%i1 - 0x1c]
	.word	0x35800003	! t1_kref+0x2bac:   	fbue,a	_kref+0x2bb8
	.word	0xe326001c	! t1_kref+0x2bb0:   	st	%f17, [%i0 + %i4]
	.word	0x99b405cc	! t1_kref+0x2bb4:   	fcmpeq32	%f16, %f12, %o4
	.word	0x99b60dcc	! t1_kref+0x2bb8:   	fnand	%f24, %f12, %f12
	.word	0x92024015	! t1_kref+0x2bbc:   	add	%o1, %l5, %o1
	.word	0xa9b00fc0	! t1_kref+0x2bc0:   	fone	%f20
	.word	0x91a0192a	! t1_kref+0x2bc4:   	fstod	%f10, %f8
	.word	0xd706001c	! t1_kref+0x2bc8:   	ld	[%i0 + %i4], %f11
	.word	0x91b08ad4	! t1_kref+0x2bcc:   	fpsub32	%f2, %f20, %f8
	.word	0xad2a2009	! t1_kref+0x2bd0:   	sll	%o0, 0x9, %l6
	.word	0xaf3a600f	! t1_kref+0x2bd4:   	sra	%o1, 0xf, %l7
	.word	0x95a18954	! t1_kref+0x2bd8:   	fmuld	%f6, %f20, %f10
	.word	0x90c54017	! t1_kref+0x2bdc:   	addccc	%l5, %l7, %o0
	.word	0xabb20588	! t1_kref+0x2be0:   	fcmpgt32	%f8, %f8, %l5
	.word	0x9fc00004	! t1_kref+0x2be4:   	call	%g0 + %g4
	.word	0x85a48858	! t1_kref+0x2be8:   	faddd	%f18, %f24, %f2
	.word	0xa5a00031	! t1_kref+0x2bec:   	fmovs	%f17, %f18
	.word	0x81b18c48	! t1_kref+0x2bf0:   	fnor	%f6, %f8, %f0
	.word	0xc807bff0	! t1_kref+0x2bf4:   	ld	[%fp - 0x10], %g4
	.word	0xaa983974	! t1_kref+0x2bf8:   	xorcc	%g0, -0x68c, %l5
	.word	0x9445c008	! t1_kref+0x2bfc:   	addc	%l7, %o0, %o2
	.word	0xe81e3ff8	! t1_kref+0x2c00:   	ldd	[%i0 - 8], %l4
	.word	0xe3b8a100	! t1_kref+0x2c04:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0x81acca32	! t1_kref+0x2c08:   	fcmps	%fcc0, %f19, %f18
	.word	0xc1be5808	! t1_kref+0x2c0c:   	stda	%f0, [%i1 + %o0]0xc0
	.word	0x86102018	! t1_kref+0x2c10:   	mov	0x18, %g3
	.word	0x86a0e001	! t1_kref+0x2c14:   	subcc	%g3, 1, %g3
	.word	0x2280000a	! t1_kref+0x2c18:   	be,a	_kref+0x2c40
	.word	0xdab61000	! t1_kref+0x2c1c:   	stha	%o5, [%i0]0x80
	.word	0x97b00fe0	! t1_kref+0x2c20:   	fones	%f11
	.word	0x81800000	! t1_kref+0x2c24:   	mov	%g0, %y
	.word	0x81824000	! t1_kref+0x2c28:   	wr	%o1, %g0, %y
	.word	0xd2400018	! t1_kref+0x2c2c:   	ldsw	[%g0 + %i0], %o1
	.word	0xee56200e	! t1_kref+0x2c30:   	ldsh	[%i0 + 0xe], %l7
	.word	0xe81e7ff0	! t1_kref+0x2c34:   	ldd	[%i1 - 0x10], %l4
	.word	0x8da24d23	! t1_kref+0x2c38:   	fsmuld	%f9, %f3, %f6
	.word	0xea2e0000	! t1_kref+0x2c3c:   	stb	%l5, [%i0]
	.word	0x988b2b6c	! t1_kref+0x2c40:   	andcc	%o4, 0xb6c, %o4
	.word	0xa89a2cef	! t1_kref+0x2c44:   	xorcc	%o0, 0xcef, %l4
	.word	0x86102003	! t1_kref+0x2c48:   	mov	0x3, %g3
	.word	0x32800000	! t1_kref+0x2c4c:   	bne,a	_kref+0x2c4c
	.word	0x86a0e001	! t1_kref+0x2c50:   	subcc	%g3, 1, %g3
	.word	0xa67b400a	! t1_kref+0x2c54:   	sdiv	%o5, %o2, %l3
	.word	0x81ac8aa2	! t1_kref+0x2c58:   	fcmpes	%fcc0, %f18, %f2
	.word	0x909d3a95	! t1_kref+0x2c5c:   	xorcc	%l4, -0x56b, %o0
	.word	0xaea4c00b	! t1_kref+0x2c60:   	subcc	%l3, %o3, %l7
	.word	0xe168a08e	! t1_kref+0x2c64:   	prefetch	%g2 + 0x8e, 16
	.word	0xad32a01f	! t1_kref+0x2c68:   	srl	%o2, 0x1f, %l6
	.word	0x33800001	! t1_kref+0x2c6c:   	fbe,a	_kref+0x2c70
	.word	0xa7b5c240	! t1_kref+0x2c70:   	array16	%l7, %g0, %l3
	.word	0xacc28013	! t1_kref+0x2c74:   	addccc	%o2, %l3, %l6
	.word	0x81ad0acc	! t1_kref+0x2c78:   	fcmped	%fcc0, %f20, %f12
	.word	0xad2b6003	! t1_kref+0x2c7c:   	sll	%o5, 0x3, %l6
	.word	0xaaa5c00c	! t1_kref+0x2c80:   	subcc	%l7, %o4, %l5
	.word	0x27800002	! t1_kref+0x2c84:   	fbul,a	_kref+0x2c8c
	.word	0xad3d2016	! t1_kref+0x2c88:   	sra	%l4, 0x16, %l6
	.word	0xea56401b	! t1_kref+0x2c8c:   	ldsh	[%i1 + %i3], %l5
	.word	0x85a08942	! t1_kref+0x2c90:   	fmuld	%f2, %f2, %f2
	.word	0xec0e401a	! t1_kref+0x2c94:   	ldub	[%i1 + %i2], %l6
	.word	0xa8aabf13	! t1_kref+0x2c98:   	andncc	%o2, -0xed, %l4
	.word	0x81828000	! t1_kref+0x2c9c:   	wr	%o2, %g0, %y
	.word	0xea0e201d	! t1_kref+0x2ca0:   	ldub	[%i0 + 0x1d], %l5
	.word	0x89b58ee9	! t1_kref+0x2ca4:   	fornot2s	%f22, %f9, %f4
	.word	0xacfeaf5f	! t1_kref+0x2ca8:   	sdivcc	%i2, 0xf5f, %l6
	.word	0x9da388da	! t1_kref+0x2cac:   	fsubd	%f14, %f26, %f14
	.word	0xa744c000	! t1_kref+0x2cb0:   	mov	%gsr, %l3
	.word	0xd408a01f	! t1_kref+0x2cb4:   	ldub	[%g2 + 0x1f], %o2
	.word	0x89b206c2	! t1_kref+0x2cb8:   	fmul8sux16	%f8, %f2, %f4
	.word	0x89b20e76	! t1_kref+0x2cbc:   	fxnors	%f8, %f22, %f4
	.word	0x8da01896	! t1_kref+0x2cc0:   	fitos	%f22, %f6
	.word	0xae05001b	! t1_kref+0x2cc4:   	add	%l4, %i3, %l7
	.word	0x87a01a58	! t1_kref+0x2cc8:   	fdtoi	%f24, %f3
	.word	0xd91e3ff0	! t1_kref+0x2ccc:   	ldd	[%i0 - 0x10], %f12
	.word	0x86102002	! t1_kref+0x2cd0:   	mov	0x2, %g3
	.word	0x32800000	! t1_kref+0x2cd4:   	bne,a	_kref+0x2cd4
	.word	0x86a0e001	! t1_kref+0x2cd8:   	subcc	%g3, 1, %g3
	.word	0xb5a000a7	! t1_kref+0x2cdc:   	fnegs	%f7, %f26
	.word	0xa8fb2491	! t1_kref+0x2ce0:   	sdivcc	%o4, 0x491, %l4
	.word	0x8da01a52	! t1_kref+0x2ce4:   	fdtoi	%f18, %f6
	.word	0xabb185ce	! t1_kref+0x2ce8:   	fcmpeq32	%f6, %f14, %l5
	.word	0x85b0076e	! t1_kref+0x2cec:   	fpack16	%f14, %f2
	.word	0x95b34037	! t1_kref+0x2cf0:   	edge8n	%o5, %l7, %o2
	.word	0x9fc10000	! t1_kref+0x2cf4:   	call	%g4
	.word	0xa9b24169	! t1_kref+0x2cf8:   	edge32ln	%o1, %o1, %l4
	.word	0xee7f0018	! t1_kref+0x2cfc:   	swap	[%i4 + %i0], %l7
	.word	0x23800001	! t1_kref+0x2d00:   	fbne,a	_kref+0x2d04
	.word	0x9033401b	! t1_kref+0x2d04:   	orn	%o5, %i3, %o0
	.word	0x953dc000	! t1_kref+0x2d08:   	sra	%l7, %g0, %o2
	.word	0x38800001	! t1_kref+0x2d0c:   	bgu,a	_kref+0x2d10
	.word	0xabb60592	! t1_kref+0x2d10:   	fcmpgt32	%f24, %f18, %l5
	.word	0x81ab0aa3	! t1_kref+0x2d14:   	fcmpes	%fcc0, %f12, %f3
	.word	0x8da00539	! t1_kref+0x2d18:   	fsqrts	%f25, %f6
	.word	0x93a01a50	! t1_kref+0x2d1c:   	fdtoi	%f16, %f9
	.word	0x97a0002d	! t1_kref+0x2d20:   	fmovs	%f13, %f11
	.word	0xf126401c	! t1_kref+0x2d24:   	st	%f24, [%i1 + %i4]
	.word	0xae06a5bd	! t1_kref+0x2d28:   	add	%i2, 0x5bd, %l7
	.word	0xaedd000a	! t1_kref+0x2d2c:   	smulcc	%l4, %o2, %l7
	.word	0xf42e8018	! t1_kref+0x2d30:   	stb	%i2, [%i2 + %i0]
	.word	0x2d800004	! t1_kref+0x2d34:   	fbg,a	_kref+0x2d44
	.word	0xd8262008	! t1_kref+0x2d38:   	st	%o4, [%i0 + 8]
	.word	0xac354017	! t1_kref+0x2d3c:   	orn	%l5, %l7, %l6
	.word	0x9ba48928	! t1_kref+0x2d40:   	fmuls	%f18, %f8, %f13
	.word	0xa5a01050	! t1_kref+0x2d44:   	fdtox	%f16, %f18
	.word	0xa740c000	! t1_kref+0x2d48:   	mov	%asi, %l3
	.word	0x2c800008	! t1_kref+0x2d4c:   	bneg,a	_kref+0x2d6c
	.word	0xac3dfc11	! t1_kref+0x2d50:   	xnor	%l7, -0x3ef, %l6
	.word	0xe83e3fe0	! t1_kref+0x2d54:   	std	%l4, [%i0 - 0x20]
	.word	0x81ab8a4a	! t1_kref+0x2d58:   	fcmpd	%fcc0, %f14, %f10
	.word	0x81868000	! t1_kref+0x2d5c:   	wr	%i2, %g0, %y
	.word	0xec1e6010	! t1_kref+0x2d60:   	ldd	[%i1 + 0x10], %l6
	.word	0x95a01023	! t1_kref+0x2d64:   	fstox	%f3, %f10
	.word	0x98b5f3ce	! t1_kref+0x2d68:   	orncc	%l7, -0xc32, %o4
	.word	0xe5ee101d	! t1_kref+0x2d6c:   	prefetcha	%i0 + %i5, 18
	.word	0x95b58e80	! t1_kref+0x2d70:   	fsrc1	%f22, %f10
	.word	0xd1beda59	! t1_kref+0x2d74:   	stda	%f8, [%i3 + %i1]0xd2
	.word	0x93b40d60	! t1_kref+0x2d78:   	fnot1s	%f16, %f9
	.word	0xb1a0002e	! t1_kref+0x2d7c:   	fmovs	%f14, %f24
	.word	0xec50a01e	! t1_kref+0x2d80:   	ldsh	[%g2 + 0x1e], %l6
	.word	0xa8d23bb6	! t1_kref+0x2d84:   	umulcc	%o0, -0x44a, %l4
	.word	0x85b48c4a	! t1_kref+0x2d88:   	fnor	%f18, %f10, %f2
	.word	0x3f800008	! t1_kref+0x2d8c:   	fbo,a	_kref+0x2dac
	.word	0x8fa01893	! t1_kref+0x2d90:   	fitos	%f19, %f7
	.word	0x90324013	! t1_kref+0x2d94:   	orn	%o1, %l3, %o0
	.word	0x29051c2b	! t1_kref+0x2d98:   	sethi	%hi(0x1470ac00), %l4
	.word	0x23480004	! t1_kref+0x2d9c:   	fbne,a,pt	%fcc0, _kref+0x2dac
	.word	0xafa01a50	! t1_kref+0x2da0:   	fdtoi	%f16, %f23
	.word	0xada2c922	! t1_kref+0x2da4:   	fmuls	%f11, %f2, %f22
	.word	0x96dde25d	! t1_kref+0x2da8:   	smulcc	%l7, 0x25d, %o3
	.word	0xe3b8a100	! t1_kref+0x2dac:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0x22800007	! t1_kref+0x2db0:   	be,a	_kref+0x2dcc
	.word	0x98a6b6e4	! t1_kref+0x2db4:   	subcc	%i2, -0x91c, %o4
	.word	0x91350013	! t1_kref+0x2db8:   	srl	%l4, %l3, %o0
	.word	0x98c24017	! t1_kref+0x2dbc:   	addccc	%o1, %l7, %o4
	.word	0xd03e7fe0	! t1_kref+0x2dc0:   	std	%o0, [%i1 - 0x20]
	.word	0xe5a71018	! t1_kref+0x2dc4:   	sta	%f18, [%i4 + %i0]0x80
	.word	0x32480008	! t1_kref+0x2dc8:   	bne,a,pt	%icc, _kref+0x2de8
	.word	0xef263ff4	! t1_kref+0x2dcc:   	st	%f23, [%i0 - 0xc]
	.word	0x948a400c	! t1_kref+0x2dd0:   	andcc	%o1, %o4, %o2
	.word	0xaa1cfe3a	! t1_kref+0x2dd4:   	xor	%l3, -0x1c6, %l5
	.word	0x37800007	! t1_kref+0x2dd8:   	fbge,a	_kref+0x2df4
	.word	0xadb08d92	! t1_kref+0x2ddc:   	fxor	%f2, %f18, %f22
	.word	0x8182c000	! t1_kref+0x2de0:   	wr	%o3, %g0, %y
	.word	0xb1a189ca	! t1_kref+0x2de4:   	fdivd	%f6, %f10, %f24
	.word	0xa69d3be4	! t1_kref+0x2de8:   	xorcc	%l4, -0x41c, %l3
	.word	0x913ec009	! t1_kref+0x2dec:   	sra	%i3, %o1, %o0
	.word	0x95b00cc8	! t1_kref+0x2df0:   	fnot2	%f8, %f10
	.word	0x86102002	! t1_kref+0x2df4:   	mov	0x2, %g3
	.word	0x32800000	! t1_kref+0x2df8:   	bne,a	_kref+0x2df8
	.word	0x86a0e001	! t1_kref+0x2dfc:   	subcc	%g3, 1, %g3
	.word	0x92f6801b	! t1_kref+0x2e00:   	udivcc	%i2, %i3, %o1
	.word	0xc91fbc80	! t1_kref+0x2e04:   	ldd	[%fp - 0x380], %f4
	.word	0x31800008	! t1_kref+0x2e08:   	fba,a	_kref+0x2e28
	.word	0x95a1cd21	! t1_kref+0x2e0c:   	fsmuld	%f7, %f1, %f10
	.word	0x992534cb	! t1_kref+0x2e10:   	mulscc	%l4, -0xb35, %o4
	.word	0x9465c00d	! t1_kref+0x2e14:   	subc	%l7, %o5, %o2
	.word	0xf4f6501d	! t1_kref+0x2e18:   	stxa	%i2, [%i1 + %i5]0x80
	.word	0xacfaa80a	! t1_kref+0x2e1c:   	sdivcc	%o2, 0x80a, %l6
	.word	0x97a489a5	! t1_kref+0x2e20:   	fdivs	%f18, %f5, %f11
	.word	0x98068016	! t1_kref+0x2e24:   	add	%i2, %l6, %o4
	.word	0xd6680019	! t1_kref+0x2e28:   	ldstub	[%g0 + %i1], %o3
	.word	0xe816c019	! t1_kref+0x2e2c:   	lduh	[%i3 + %i1], %l4
	.word	0x91153b49	! t1_kref+0x2e30:   	taddcctv	%l4, -0x4b7, %o0
	.word	0x89a60952	! t1_kref+0x2e34:   	fmuld	%f24, %f18, %f4
	.word	0x81ab0ab9	! t1_kref+0x2e38:   	fcmpes	%fcc0, %f12, %f25
	.word	0x92a5000d	! t1_kref+0x2e3c:   	subcc	%l4, %o5, %o1
	.word	0x949a8009	! t1_kref+0x2e40:   	xorcc	%o2, %o1, %o2
	.word	0xd0560000	! t1_kref+0x2e44:   	ldsh	[%i0], %o0
	.word	0xc9be5808	! t1_kref+0x2e48:   	stda	%f4, [%i1 + %o0]0xc0
	.word	0x81ae8a25	! t1_kref+0x2e4c:   	fcmps	%fcc0, %f26, %f5
	.word	0xe83e3fe8	! t1_kref+0x2e50:   	std	%l4, [%i0 - 0x18]
	.word	0xa9b08c48	! t1_kref+0x2e54:   	fnor	%f2, %f8, %f20
	.word	0xac62c016	! t1_kref+0x2e58:   	subc	%o3, %l6, %l6
	.word	0x2b800004	! t1_kref+0x2e5c:   	fbug,a	_kref+0x2e6c
	.word	0xa1b60e0c	! t1_kref+0x2e60:   	fand	%f24, %f12, %f16
	.word	0xe0f81019	! t1_kref+0x2e64:   	swapa	[%g0 + %i1]0x80, %l0
	.word	0xacadc01a	! t1_kref+0x2e68:   	andncc	%l7, %i2, %l6
	.word	0x81a88a58	! t1_kref+0x2e6c:   	fcmpd	%fcc0, %f2, %f24
	.word	0xee0e601d	! t1_kref+0x2e70:   	ldub	[%i1 + 0x1d], %l7
	.word	0x8610200a	! t1_kref+0x2e74:   	mov	0xa, %g3
	.word	0x86a0e001	! t1_kref+0x2e78:   	subcc	%g3, 1, %g3
	.word	0x22800016	! t1_kref+0x2e7c:   	be,a	_kref+0x2ed4
	.word	0xae637731	! t1_kref+0x2e80:   	subc	%o5, -0x8cf, %l7
	.word	0xd91fbd40	! t1_kref+0x2e84:   	ldd	[%fp - 0x2c0], %f12
	.word	0x3c800007	! t1_kref+0x2e88:   	bpos,a	_kref+0x2ea4
	.word	0xd2567fe0	! t1_kref+0x2e8c:   	ldsh	[%i1 - 0x20], %o1
	.word	0x8fa01a2c	! t1_kref+0x2e90:   	fstoi	%f12, %f7
	.word	0x81a0102e	! t1_kref+0x2e94:   	fstox	%f14, %f0
	.word	0x3cbffff8	! t1_kref+0x2e98:   	bpos,a	_kref+0x2e78
	.word	0xa81b7b16	! t1_kref+0x2e9c:   	xor	%o5, -0x4ea, %l4
	.word	0xe91fbc70	! t1_kref+0x2ea0:   	ldd	[%fp - 0x390], %f20
	.word	0x9ba00032	! t1_kref+0x2ea4:   	fmovs	%f18, %f13
	.word	0xa5a00032	! t1_kref+0x2ea8:   	fmovs	%f18, %f18
	.word	0xe3063ff8	! t1_kref+0x2eac:   	ld	[%i0 - 8], %f17
	.word	0xac7b6f73	! t1_kref+0x2eb0:   	sdiv	%o5, 0xf73, %l6
	.word	0xa5b18a4e	! t1_kref+0x2eb4:   	fpadd32	%f6, %f14, %f18
	.word	0xb5b306d0	! t1_kref+0x2eb8:   	fmul8sux16	%f12, %f16, %f26
	.word	0x9fa018d6	! t1_kref+0x2ebc:   	fdtos	%f22, %f15
	.word	0x91b28dc4	! t1_kref+0x2ec0:   	fnand	%f10, %f4, %f8
	.word	0x91a01a4c	! t1_kref+0x2ec4:   	fdtoi	%f12, %f8
	.word	0xd620a02c	! t1_kref+0x2ec8:   	st	%o3, [%g2 + 0x2c]
	.word	0xa7b0016a	! t1_kref+0x2ecc:   	edge32ln	%g0, %o2, %l3
	.word	0x90dac00d	! t1_kref+0x2ed0:   	smulcc	%o3, %o5, %o0
	.word	0x85b38a88	! t1_kref+0x2ed4:   	fpsub16	%f14, %f8, %f2
	.word	0x94f4fa78	! t1_kref+0x2ed8:   	udivcc	%l3, -0x588, %o2
	.word	0xadb20dce	! t1_kref+0x2edc:   	fnand	%f8, %f14, %f22
	.word	0x94d28013	! t1_kref+0x2ee0:   	umulcc	%o2, %l3, %o2
	.word	0x89a018c8	! t1_kref+0x2ee4:   	fdtos	%f8, %f4
	.word	0xd4560000	! t1_kref+0x2ee8:   	ldsh	[%i0], %o2
	.word	0x99a01a31	! t1_kref+0x2eec:   	fstoi	%f17, %f12
	.word	0x91a01082	! t1_kref+0x2ef0:   	fxtos	%f2, %f8
	.word	0xe3b8a100	! t1_kref+0x2ef4:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0x34480004	! t1_kref+0x2ef8:   	bg,a,pt	%icc, _kref+0x2f08
	.word	0xc51e4000	! t1_kref+0x2efc:   	ldd	[%i1], %f2
	.word	0x89a509b7	! t1_kref+0x2f00:   	fdivs	%f20, %f23, %f4
	.word	0x9da30848	! t1_kref+0x2f04:   	faddd	%f12, %f8, %f14
	.word	0x83a01a46	! t1_kref+0x2f08:   	fdtoi	%f6, %f1
	.word	0x8143e053	! t1_kref+0x2f0c:   	membar	0x53
	.word	0xecee9018	! t1_kref+0x2f10:   	ldstuba	[%i2 + %i0]0x80, %l6
	.word	0xeb070019	! t1_kref+0x2f14:   	ld	[%i4 + %i1], %f21
	.word	0x92d6e1c4	! t1_kref+0x2f18:   	umulcc	%i3, 0x1c4, %o1
	.word	0xd03f4018	! t1_kref+0x2f1c:   	std	%o0, [%i5 + %i0]
	.word	0xb1ab4056	! t1_kref+0x2f20:   	fmovdle	%fcc0, %f22, %f24
	.word	0x81ae0a54	! t1_kref+0x2f24:   	fcmpd	%fcc0, %f24, %f20
	.word	0x81ae4a26	! t1_kref+0x2f28:   	fcmps	%fcc0, %f25, %f6
	.word	0xac64ed2b	! t1_kref+0x2f2c:   	subc	%l3, 0xd2b, %l6
	.word	0xee00a004	! t1_kref+0x2f30:   	ld	[%g2 + 4], %l7
	.word	0xa6deb578	! t1_kref+0x2f34:   	smulcc	%i2, -0xa88, %l3
	.word	0x90e34013	! t1_kref+0x2f38:   	subccc	%o5, %l3, %o0
	.word	0x9233401b	! t1_kref+0x2f3c:   	orn	%o5, %i3, %o1
	.word	0x94054013	! t1_kref+0x2f40:   	add	%l5, %l3, %o2
	.word	0x93b50200	! t1_kref+0x2f44:   	array8	%l4, %g0, %o1
	.word	0x81ab0a52	! t1_kref+0x2f48:   	fcmpd	%fcc0, %f12, %f18
	.word	0x94da7ffe	! t1_kref+0x2f4c:   	smulcc	%o1, -0x2, %o2
	.word	0xb1b00ccc	! t1_kref+0x2f50:   	fnot2	%f12, %f24
	.word	0x9215001b	! t1_kref+0x2f54:   	or	%l4, %i3, %o1
	.word	0x97b28418	! t1_kref+0x2f58:   	fcmple16	%f10, %f24, %o3
	.word	0xf3062008	! t1_kref+0x2f5c:   	ld	[%i0 + 8], %f25
	.word	0x270a0895	! t1_kref+0x2f60:   	sethi	%hi(0x28225400), %l3
	.word	0xd51fbd38	! t1_kref+0x2f64:   	ldd	[%fp - 0x2c8], %f10
	.word	0x81ab4a39	! t1_kref+0x2f68:   	fcmps	%fcc0, %f13, %f25
	.word	0xa6f329e2	! t1_kref+0x2f6c:   	udivcc	%o4, 0x9e2, %l3
	.word	0x91b5c12b	! t1_kref+0x2f70:   	edge32n	%l7, %o3, %o0
	.word	0x81ab8aa4	! t1_kref+0x2f74:   	fcmpes	%fcc0, %f14, %f4
	.word	0x91408000	! t1_kref+0x2f78:   	mov	%ccr, %o0
	sethi	%hi(1f), %o7
	jmpl	%o7+%lo(1f), %g1
	.empty
	.word	0x97b305c2	! t1_kref+0x2f84:   	fcmpeq32	%f12, %f2, %o3
	.word	0x97b30200	! t1_kref+0x2f88:   	array8	%o4, %g0, %o3
1:	.word	0x9da01a44	! t1_kref+0x2f8c:   	fdtoi	%f4, %f14
	.word	0x9fc10000	! t1_kref+0x2f90:   	call	%g4
	.word	0xed067fe4	! t1_kref+0x2f94:   	ld	[%i1 - 0x1c], %f22
	call	1f
	.empty
	.word	0xa603400d	! t1_kref+0x2f9c:   	add	%o5, %o5, %l3
	.word	0xd9be588c	! t1_kref+0x2fa0:   	stda	%f12, [%i1 + %o4]0xc4
1:	.word	0xc9ee1000	! t1_kref+0x2fa4:   	prefetcha	%i0, 4
	call	SYM(t1_subr1)
	.word	0x9da58848	! t1_kref+0x2fac:   	faddd	%f22, %f8, %f14
	.word	0x9de3bfa0	! t1_kref+0x2fb0:   	save	%sp, -0x60, %sp
	.word	0xa7eec01c	! t1_kref+0x2fb4:   	restore	%i3, %i4, %l3
	.word	0xa3a549b3	! t1_kref+0x2fb8:   	fdivs	%f21, %f19, %f17
	.word	0x81ab0a31	! t1_kref+0x2fbc:   	fcmps	%fcc0, %f12, %f17
	.word	0x81824000	! t1_kref+0x2fc0:   	wr	%o1, %g0, %y
	call	SYM(t1_subr0)
	.word	0xec3e0000	! t1_kref+0x2fc8:   	std	%l6, [%i0]
	.word	0x28480005	! t1_kref+0x2fcc:   	bleu,a,pt	%icc, _kref+0x2fe0
	.word	0x93b00fe0	! t1_kref+0x2fd0:   	fones	%f9
	.word	0x19299ec3	! t1_kref+0x2fd4:   	sethi	%hi(0xa67b0c00), %o4
	.word	0xa70b7ad6	! t1_kref+0x2fd8:   	tsubcc	%o5, -0x52a, %l3
	.word	0xe9060000	! t1_kref+0x2fdc:   	ld	[%i0], %f20
	.word	0xa82ec015	! t1_kref+0x2fe0:   	andn	%i3, %l5, %l4
	.word	0xb1b606ca	! t1_kref+0x2fe4:   	fmul8sux16	%f24, %f10, %f24
	.word	0xd47e3ff4	! t1_kref+0x2fe8:   	swap	[%i0 - 0xc], %o2
	.word	0xac46ac10	! t1_kref+0x2fec:   	addc	%i2, 0xc10, %l6
	.word	0xe1be580d	! t1_kref+0x2ff0:   	stda	%f16, [%i1 + %o5]0xc0
	.word	0xaab37460	! t1_kref+0x2ff4:   	orncc	%o5, -0xba0, %l5
	.word	0xe1260000	! t1_kref+0x2ff8:   	st	%f16, [%i0]
	.word	0xa7a00539	! t1_kref+0x2ffc:   	fsqrts	%f25, %f19
	.word	0xacd57976	! t1_kref+0x3000:   	umulcc	%l5, -0x68a, %l6
	.word	0x8db08d60	! t1_kref+0x3004:   	fnot1s	%f2, %f6
	.word	0xd67e2018	! t1_kref+0x3008:   	swap	[%i0 + 0x18], %o3
	.word	0xadb540ba	! t1_kref+0x300c:   	edge16n	%l5, %i2, %l6
	.word	0x81aa4aa2	! t1_kref+0x3010:   	fcmpes	%fcc0, %f9, %f2
	.word	0x22480002	! t1_kref+0x3014:   	be,a,pt	%icc, _kref+0x301c
	.word	0x95b68f4a	! t1_kref+0x3018:   	fornot1	%f26, %f10, %f10
	.word	0xc1be180a	! t1_kref+0x301c:   	stda	%f0, [%i0 + %o2]0xc0
	.word	0x3d800007	! t1_kref+0x3020:   	fbule,a	_kref+0x303c
	.word	0x85b00fc0	! t1_kref+0x3024:   	fone	%f2
	.word	0xadb38a8c	! t1_kref+0x3028:   	fpsub16	%f14, %f12, %f22
	.word	0xe9e61016	! t1_kref+0x302c:   	casa	[%i0]0x80, %l6, %l4
	.word	0x93b40a2a	! t1_kref+0x3030:   	fpadd16s	%f16, %f10, %f9
	.word	0x99a01933	! t1_kref+0x3034:   	fstod	%f19, %f12
	.word	0xaf3dc00a	! t1_kref+0x3038:   	sra	%l7, %o2, %l7
	.word	0xadb48e80	! t1_kref+0x303c:   	fsrc1	%f18, %f22
	.word	0xad05400d	! t1_kref+0x3040:   	taddcc	%l5, %o5, %l6
	.word	0x37800001	! t1_kref+0x3044:   	fbge,a	_kref+0x3048
	.word	0xe91fbf18	! t1_kref+0x3048:   	ldd	[%fp - 0xe8], %f20
	.word	0xa7408000	! t1_kref+0x304c:   	mov	%ccr, %l3
	.word	0xea30a034	! t1_kref+0x3050:   	sth	%l5, [%g2 + 0x34]
	.word	0x81834000	! t1_kref+0x3054:   	wr	%o5, %g0, %y
	.word	0x85b40d60	! t1_kref+0x3058:   	fnot1s	%f16, %f2
	.word	0x86102002	! t1_kref+0x305c:   	mov	0x2, %g3
	.word	0x32800000	! t1_kref+0x3060:   	bne,a	_kref+0x3060
	.word	0x86a0e001	! t1_kref+0x3064:   	subcc	%g3, 1, %g3
	.word	0xb5a38827	! t1_kref+0x3068:   	fadds	%f14, %f7, %f26
	.word	0x913d6015	! t1_kref+0x306c:   	sra	%l5, 0x15, %o0
	.word	0xd87e6008	! t1_kref+0x3070:   	swap	[%i1 + 8], %o4
	.word	0x3d480002	! t1_kref+0x3074:   	fbule,a,pt	%fcc0, _kref+0x307c
	.word	0xc900a01c	! t1_kref+0x3078:   	ld	[%g2 + 0x1c], %f4
	.word	0x9bb44da6	! t1_kref+0x307c:   	fxors	%f17, %f6, %f13
	.word	0xadb386ce	! t1_kref+0x3080:   	fmul8sux16	%f14, %f14, %f22
	.word	0x89a508a6	! t1_kref+0x3084:   	fsubs	%f20, %f6, %f4
	.word	0x81834000	! t1_kref+0x3088:   	wr	%o5, %g0, %y
	.word	0x95b246ab	! t1_kref+0x308c:   	fmul8x16al	%f9, %f11, %f10
	.word	0xa9a018c4	! t1_kref+0x3090:   	fdtos	%f4, %f20
	.word	0x95a01022	! t1_kref+0x3094:   	fstox	%f2, %f10
	.word	0x96854000	! t1_kref+0x3098:   	addcc	%l5, %g0, %o3
	.word	0xece81019	! t1_kref+0x309c:   	ldstuba	[%g0 + %i1]0x80, %l6
	.word	0x9882e3a4	! t1_kref+0x30a0:   	addcc	%o3, 0x3a4, %o4
	.word	0xe07e4000	! t1_kref+0x30a4:   	swap	[%i1], %l0
	.word	0x91b28592	! t1_kref+0x30a8:   	fcmpgt32	%f10, %f18, %o0
	.word	0x9082c00b	! t1_kref+0x30ac:   	addcc	%o3, %o3, %o0
	.word	0x9260271c	! t1_kref+0x30b0:   	subc	%g0, 0x71c, %o1
	.word	0xee7f0019	! t1_kref+0x30b4:   	swap	[%i4 + %i1], %l7
	.word	0x81a84a28	! t1_kref+0x30b8:   	fcmps	%fcc0, %f1, %f8
	.word	0xac22e661	! t1_kref+0x30bc:   	sub	%o3, 0x661, %l6
	.word	0xadb38f8c	! t1_kref+0x30c0:   	for	%f14, %f12, %f22
	.word	0x8db286cc	! t1_kref+0x30c4:   	fmul8sux16	%f10, %f12, %f6
	.word	0x99b18f88	! t1_kref+0x30c8:   	for	%f6, %f8, %f12
	.word	0xeb68a0c5	! t1_kref+0x30cc:   	prefetch	%g2 + 0xc5, 21
	.word	0xacf6e902	! t1_kref+0x30d0:   	udivcc	%i3, 0x902, %l6
	.word	0xf500a03c	! t1_kref+0x30d4:   	ld	[%g2 + 0x3c], %f26
	.word	0x2b0bd986	! t1_kref+0x30d8:   	sethi	%hi(0x2f661800), %l5
	.word	0x2e480007	! t1_kref+0x30dc:   	bvs,a,pt	%icc, _kref+0x30f8
	.word	0xa6e6a0c4	! t1_kref+0x30e0:   	subccc	%i2, 0xc4, %l3
	.word	0xf428a03f	! t1_kref+0x30e4:   	stb	%i2, [%g2 + 0x3f]
	.word	0xd6763fe0	! t1_kref+0x30e8:   	stx	%o3, [%i0 - 0x20]
	.word	0xa3b48ca8	! t1_kref+0x30ec:   	fandnot2s	%f18, %f8, %f17
	.word	0xe67f0019	! t1_kref+0x30f0:   	swap	[%i4 + %i1], %l3
	.word	0xa87cf98a	! t1_kref+0x30f4:   	sdiv	%l3, -0x676, %l4
	.word	0x81ac8a58	! t1_kref+0x30f8:   	fcmpd	%fcc0, %f18, %f24
	.word	0x89a01a58	! t1_kref+0x30fc:   	fdtoi	%f24, %f4
	.word	0x8da608ce	! t1_kref+0x3100:   	fsubd	%f24, %f14, %f6
	.word	0x2b02c7c1	! t1_kref+0x3104:   	sethi	%hi(0xb1f0400), %l5
	.word	0x81a8ca27	! t1_kref+0x3108:   	fcmps	%fcc0, %f3, %f7
	.word	0x91b28200	! t1_kref+0x310c:   	array8	%o2, %g0, %o0
	.word	0xc526600c	! t1_kref+0x3110:   	st	%f2, [%i1 + 0xc]
	.word	0xe3b8a100	! t1_kref+0x3114:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0x9445a852	! t1_kref+0x3118:   	addc	%l6, 0x852, %o2
	.word	0xafb007a8	! t1_kref+0x311c:   	fpackfix	%f8, %f23
	.word	0xe3b8a100	! t1_kref+0x3120:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0x89a01917	! t1_kref+0x3124:   	fitod	%f23, %f4
	.word	0x91b50500	! t1_kref+0x3128:   	fcmpgt16	%f20, %f0, %o0
	.word	0x85b00fc0	! t1_kref+0x312c:   	fone	%f2
	.word	0xe9be188a	! t1_kref+0x3130:   	stda	%f20, [%i0 + %o2]0xc4
	.word	0xd0780019	! t1_kref+0x3134:   	swap	[%g0 + %i1], %o0
	.word	0xb3a64935	! t1_kref+0x3138:   	fmuls	%f25, %f21, %f25
	.word	0xb8103fe8	! t1_kref+0x313c:   	mov	0xffffffe8, %i4
	.word	0x21480008	! t1_kref+0x3140:   	fbn,a,pt	%fcc0, _kref+0x3160
	.word	0x85a48844	! t1_kref+0x3144:   	faddd	%f18, %f4, %f2
	.word	0xa73aa008	! t1_kref+0x3148:   	sra	%o2, 0x8, %l3
	.word	0xc368a083	! t1_kref+0x314c:   	prefetch	%g2 + 0x83, 1
	.word	0x81aa8ad0	! t1_kref+0x3150:   	fcmped	%fcc0, %f10, %f16
	.word	0xd0c81018	! t1_kref+0x3154:   	ldsba	[%g0 + %i0]0x80, %o0
	.word	0x95b68135	! t1_kref+0x3158:   	edge32n	%i2, %l5, %o2
	.word	0xe6563ff8	! t1_kref+0x315c:   	ldsh	[%i0 - 8], %l3
	.word	0x965b000d	! t1_kref+0x3160:   	smul	%o4, %o5, %o3
	.word	0xedee101a	! t1_kref+0x3164:   	prefetcha	%i0 + %i2, 22
	.word	0xa765001b	! t1_kref+0x3168:   	movleu	%icc, %i3, %l3
	.word	0xa7418000	! t1_kref+0x316c:   	mov	%fprs, %l3
	.word	0x9da00033	! t1_kref+0x3170:   	fmovs	%f19, %f14
	.word	0xf428a00f	! t1_kref+0x3174:   	stb	%i2, [%g2 + 0xf]
	.word	0xa6ad8016	! t1_kref+0x3178:   	andncc	%l6, %l6, %l3
	.word	0x90db218f	! t1_kref+0x317c:   	smulcc	%o4, 0x18f, %o0
	.word	0x91a30856	! t1_kref+0x3180:   	faddd	%f12, %f22, %f8
	.word	0x2b800005	! t1_kref+0x3184:   	fbug,a	_kref+0x3198
	.word	0xd0be101d	! t1_kref+0x3188:   	stda	%o0, [%i0 + %i5]0x80
	.word	0xa8d5c009	! t1_kref+0x318c:   	umulcc	%l7, %o1, %l4
	.word	0xf3066000	! t1_kref+0x3190:   	ld	[%i1], %f25
	.word	0x83b5cf74	! t1_kref+0x3194:   	fornot1s	%f23, %f20, %f1
	.word	0xd6462014	! t1_kref+0x3198:   	ldsw	[%i0 + 0x14], %o3
	.word	0xe81e2010	! t1_kref+0x319c:   	ldd	[%i0 + 0x10], %l4
	.word	0xcd1e0000	! t1_kref+0x31a0:   	ldd	[%i0], %f6
	.word	0x87a58935	! t1_kref+0x31a4:   	fmuls	%f22, %f21, %f3
	.word	0xa5b28f52	! t1_kref+0x31a8:   	fornot1	%f10, %f18, %f18
	.word	0x3c800002	! t1_kref+0x31ac:   	bpos,a	_kref+0x31b4
	.word	0xa8c5fce7	! t1_kref+0x31b0:   	addccc	%l7, -0x319, %l4
	.word	0xe6560000	! t1_kref+0x31b4:   	ldsh	[%i0], %l3
	.word	0xd4ce501a	! t1_kref+0x31b8:   	ldsba	[%i1 + %i2]0x80, %o2
	.word	0x86102001	! t1_kref+0x31bc:   	mov	0x1, %g3
	.word	0x32800000	! t1_kref+0x31c0:   	bne,a	_kref+0x31c0
	.word	0x86a0e001	! t1_kref+0x31c4:   	subcc	%g3, 1, %g3
	.word	0x91b20486	! t1_kref+0x31c8:   	fcmple32	%f8, %f6, %o0
	.word	0xac06f528	! t1_kref+0x31cc:   	add	%i3, -0xad8, %l6
	.word	0x81ab8a2d	! t1_kref+0x31d0:   	fcmps	%fcc0, %f14, %f13
	.word	0x85a00029	! t1_kref+0x31d4:   	fmovs	%f9, %f2
	.word	0xec2e4000	! t1_kref+0x31d8:   	stb	%l6, [%i1]
	.word	0x90a2e194	! t1_kref+0x31dc:   	subcc	%o3, 0x194, %o0
	.word	0x8fa01899	! t1_kref+0x31e0:   	fitos	%f25, %f7
	.word	0x83a01096	! t1_kref+0x31e4:   	fxtos	%f22, %f1
	.word	0x9864c01b	! t1_kref+0x31e8:   	subc	%l3, %i3, %o4
	.word	0xd91f4019	! t1_kref+0x31ec:   	ldd	[%i5 + %i1], %f12
	.word	0xb810200c	! t1_kref+0x31f0:   	mov	0xc, %i4
	.word	0xaa002df0	! t1_kref+0x31f4:   	add	%g0, 0xdf0, %l5
	.word	0xa69d60ca	! t1_kref+0x31f8:   	xorcc	%l5, 0xca, %l3
	.word	0xa9b40e61	! t1_kref+0x31fc:   	fxnors	%f16, %f1, %f20
	.word	0xadb284d0	! t1_kref+0x3200:   	fcmpne32	%f10, %f16, %l6
	sethi	%hi(2f), %o7
	.word	0xe40be248	! t1_kref+0x3208:   	ldub	[%o7 + 0x248], %l2
	.word	0xa41ca00c	! t1_kref+0x320c:   	xor	%l2, 0xc, %l2
	.word	0xe42be248	! t1_kref+0x3210:   	stb	%l2, [%o7 + 0x248]
	.word	0x81dbe248	! t1_kref+0x3214:   	flush	%o7 + 0x248
	.word	0x96bef549	! t1_kref+0x3218:   	xnorcc	%i3, -0xab7, %o3
	.word	0x95a000c4	! t1_kref+0x321c:   	fnegd	%f4, %f10
	.word	0xacf54017	! t1_kref+0x3220:   	udivcc	%l5, %l7, %l6
	.word	0xada509ce	! t1_kref+0x3224:   	fdivd	%f20, %f14, %f22
	.word	0xfbee501b	! t1_kref+0x3228:   	prefetcha	%i1 + %i3, 29
	.word	0xec2e001a	! t1_kref+0x322c:   	stb	%l6, [%i0 + %i2]
	.word	0x31480005	! t1_kref+0x3230:   	fba,a,pt	%fcc0, _kref+0x3244
	.word	0xa8633a66	! t1_kref+0x3234:   	subc	%o4, -0x59a, %l4
	.word	0x3b800006	! t1_kref+0x3238:   	fble,a	_kref+0x3250
	.word	0xb5b24d2b	! t1_kref+0x323c:   	fandnot1s	%f9, %f11, %f26
	.word	0xe968a0cb	! t1_kref+0x3240:   	prefetch	%g2 + 0xcb, 20
	.word	0xad3dc015	! t1_kref+0x3244:   	sra	%l7, %l5, %l6
2:	.word	0x96b6c01b	! t1_kref+0x3248:   	orncc	%i3, %i3, %o3
	.word	0x913b6000	! t1_kref+0x324c:   	sra	%o5, 0x0, %o0
	.word	0xe3b8a100	! t1_kref+0x3250:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0x2f800008	! t1_kref+0x3254:   	fbu,a	_kref+0x3274
	.word	0xd8563fec	! t1_kref+0x3258:   	ldsh	[%i0 - 0x14], %o4
	.word	0x8bb3ca6f	! t1_kref+0x325c:   	fpadd32s	%f15, %f15, %f5
	.word	0x32800007	! t1_kref+0x3260:   	bne,a	_kref+0x327c
	.word	0xb1b306f6	! t1_kref+0x3264:   	fmul8ulx16	%f12, %f22, %f24
	.word	0x8d85001a	! t1_kref+0x3268:   	wr	%l4, %i2, %fprs
	.word	0x95b50200	! t1_kref+0x326c:   	array8	%l4, %g0, %o2
	.word	0xb1a8c048	! t1_kref+0x3270:   	fmovdul	%fcc0, %f8, %f24
	.word	0x99a10850	! t1_kref+0x3274:   	faddd	%f4, %f16, %f12
	.word	0x81ac0a26	! t1_kref+0x3278:   	fcmps	%fcc0, %f16, %f6
	.word	0xed266014	! t1_kref+0x327c:   	st	%f22, [%i1 + 0x14]
	.word	0xee563fe0	! t1_kref+0x3280:   	ldsh	[%i0 - 0x20], %l7
	.word	0xd6b6d019	! t1_kref+0x3284:   	stha	%o3, [%i3 + %i1]0x80
	.word	0xaa1b400a	! t1_kref+0x3288:   	xor	%o5, %o2, %l5
	.word	0x9ba01a46	! t1_kref+0x328c:   	fdtoi	%f6, %f13
	.word	0xede65014	! t1_kref+0x3290:   	casa	[%i1]0x80, %l4, %l6
	.word	0x89a589b4	! t1_kref+0x3294:   	fdivs	%f22, %f20, %f4
	.word	0xadb00766	! t1_kref+0x3298:   	fpack16	%f6, %f22
	.word	0xa5a18854	! t1_kref+0x329c:   	faddd	%f6, %f20, %f18
	.word	0x98acc008	! t1_kref+0x32a0:   	andncc	%l3, %o0, %o4
	.word	0xe4086340	! t1_kref+0x32a4:   	ldub	[%g1 + 0x340], %l2
	.word	0xa41ca00c	! t1_kref+0x32a8:   	xor	%l2, 0xc, %l2
	.word	0xe4286340	! t1_kref+0x32ac:   	stb	%l2, [%g1 + 0x340]
	.word	0x81d86340	! t1_kref+0x32b0:   	flush	%g1 + 0x340
	.word	0xb1b18ed6	! t1_kref+0x32b4:   	fornot2	%f6, %f22, %f24
	.word	0x2c800004	! t1_kref+0x32b8:   	bneg,a	_kref+0x32c8
	.word	0x91b207c4	! t1_kref+0x32bc:   	pdist	%f8, %f4, %f8
2:	.word	0xec00a014	! t1_kref+0x32c0:   	ld	[%g2 + 0x14], %l6
	.word	0x99a0015a	! t1_kref+0x32c4:   	fabsd	%f26, %f12
	.word	0xada109cc	! t1_kref+0x32c8:   	fdivd	%f4, %f12, %f22
	.word	0xcb263fe8	! t1_kref+0x32cc:   	st	%f5, [%i0 - 0x18]
	.word	0x81b10f48	! t1_kref+0x32d0:   	fornot1	%f4, %f8, %f0
	.word	0x110894c1	! t1_kref+0x32d4:   	sethi	%hi(0x22530400), %o0
	.word	0x93b58355	! t1_kref+0x32d8:   	alignaddrl	%l6, %l5, %o1
	.word	0x81a88aca	! t1_kref+0x32dc:   	fcmped	%fcc0, %f2, %f10
	.word	0x9da00521	! t1_kref+0x32e0:   	fsqrts	%f1, %f14
	.word	0xa925800b	! t1_kref+0x32e4:   	mulscc	%l6, %o3, %l4
	.word	0xabb2831b	! t1_kref+0x32e8:   	alignaddr	%o2, %i3, %l5
	.word	0x85aa0058	! t1_kref+0x32ec:   	fmovda	%fcc0, %f24, %f2
	.word	0x81a88ad6	! t1_kref+0x32f0:   	fcmped	%fcc0, %f2, %f22
	.word	0xabb08502	! t1_kref+0x32f4:   	fcmpgt16	%f2, %f2, %l5
	.word	0xa6ad36b7	! t1_kref+0x32f8:   	andncc	%l4, -0x949, %l3
	.word	0x2b159b02	! t1_kref+0x32fc:   	sethi	%hi(0x566c0800), %l5
	.word	0xa1b00cca	! t1_kref+0x3300:   	fnot2	%f10, %f16
	.word	0xae8376af	! t1_kref+0x3304:   	addcc	%o5, -0x951, %l7
	.word	0x90030013	! t1_kref+0x3308:   	add	%o4, %l3, %o0
	.word	0x26480005	! t1_kref+0x330c:   	bl,a,pt	%icc, _kref+0x3320
	.word	0xc5063fe8	! t1_kref+0x3310:   	ld	[%i0 - 0x18], %f2
	.word	0xd53e3fe0	! t1_kref+0x3314:   	std	%f10, [%i0 - 0x20]
	.word	0xacaa8013	! t1_kref+0x3318:   	andncc	%o2, %l3, %l6
	.word	0xacd2c01b	! t1_kref+0x331c:   	umulcc	%o3, %i3, %l6
	.word	0x96fdc014	! t1_kref+0x3320:   	sdivcc	%l7, %l4, %o3
	.word	0x9fc10000	! t1_kref+0x3324:   	call	%g4
	.word	0xe3b8a100	! t1_kref+0x3328:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0xabb5c16a	! t1_kref+0x332c:   	edge32ln	%l7, %o2, %l5
	.word	0x92ddc008	! t1_kref+0x3330:   	smulcc	%l7, %o0, %o1
	.word	0x9885401a	! t1_kref+0x3334:   	addcc	%l5, %i2, %o4
	.word	0x81aa0a56	! t1_kref+0x3338:   	fcmpd	%fcc0, %f8, %f22
	.word	0xa7a00535	! t1_kref+0x333c:   	fsqrts	%f21, %f19
	.word	0xee564000	! t1_kref+0x3340:   	ldsh	[%i1], %l7
	.word	0x2b1c121d	! t1_kref+0x3344:   	sethi	%hi(0x70487400), %l5
	.word	0xd11fbc60	! t1_kref+0x3348:   	ldd	[%fp - 0x3a0], %f8
	.word	0xcf00a014	! t1_kref+0x334c:   	ld	[%g2 + 0x14], %f7
	.word	0x93a00135	! t1_kref+0x3350:   	fabss	%f21, %f9
	.word	0x904327ff	! t1_kref+0x3354:   	addc	%o4, 0x7ff, %o0
	.word	0xacc2000d	! t1_kref+0x3358:   	addccc	%o0, %o5, %l6
	.word	0xa7b50169	! t1_kref+0x335c:   	edge32ln	%l4, %o1, %l3
	.word	0xaa40000d	! t1_kref+0x3360:   	addc	%g0, %o5, %l5
	.word	0x8143c000	! t1_kref+0x3364:   	stbar
	.word	0xa7b00174	! t1_kref+0x3368:   	edge32ln	%g0, %l4, %l3
	.word	0xa8f00008	! t1_kref+0x336c:   	udivcc	%g0, %o0, %l4
	.word	0x23800006	! t1_kref+0x3370:   	fbne,a	_kref+0x3388
	.word	0xb5b00fc0	! t1_kref+0x3374:   	fone	%f26
	.word	0xa845e0e7	! t1_kref+0x3378:   	addc	%l7, 0xe7, %l4
	.word	0x96ad401a	! t1_kref+0x337c:   	andncc	%l5, %i2, %o3
	.word	0xa6c5c00a	! t1_kref+0x3380:   	addccc	%l7, %o2, %l3
	.word	0x8143c000	! t1_kref+0x3384:   	stbar
	sethi	%hi(2f), %o7
	.word	0xe40be3cc	! t1_kref+0x338c:   	ldub	[%o7 + 0x3cc], %l2
	.word	0xa41ca00c	! t1_kref+0x3390:   	xor	%l2, 0xc, %l2
	.word	0xe42be3cc	! t1_kref+0x3394:   	stb	%l2, [%o7 + 0x3cc]
	.word	0x81dbe3cc	! t1_kref+0x3398:   	flush	%o7 + 0x3cc
	.word	0xc51fbc38	! t1_kref+0x339c:   	ldd	[%fp - 0x3c8], %f2
	.word	0xe66e3fe5	! t1_kref+0x33a0:   	ldstub	[%i0 - 0x1b], %l3
	.word	0x3f480008	! t1_kref+0x33a4:   	fbo,a,pt	%fcc0, _kref+0x33c4
	.word	0xb3a01092	! t1_kref+0x33a8:   	fxtos	%f18, %f25
	.word	0xe3b8a100	! t1_kref+0x33ac:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0x36480003	! t1_kref+0x33b0:   	bge,a,pt	%icc, _kref+0x33bc
	.word	0x8143c000	! t1_kref+0x33b4:   	stbar
	.word	0x20480002	! t1_kref+0x33b8:   	bn,a,pt	%icc, _kref+0x33c0
	.word	0x99a01a54	! t1_kref+0x33bc:   	fdtoi	%f20, %f12
	.word	0x87b14ca3	! t1_kref+0x33c0:   	fandnot2s	%f5, %f3, %f3
	.word	0x91418000	! t1_kref+0x33c4:   	mov	%fprs, %o0
	.word	0x89b50d22	! t1_kref+0x33c8:   	fandnot1s	%f20, %f2, %f4
2:	.word	0xb5b206b8	! t1_kref+0x33cc:   	fmul8x16al	%f8, %f24, %f26
	.word	0xba102000	! t1_kref+0x33d0:   	mov	0x0, %i5
	.word	0x97156b5d	! t1_kref+0x33d4:   	taddcctv	%l5, 0xb5d, %o3
	.word	0x3a480001	! t1_kref+0x33d8:   	bcc,a,pt	%icc, _kref+0x33dc
	.word	0xd706401c	! t1_kref+0x33dc:   	ld	[%i1 + %i4], %f11
	.word	0x9de3bfa0	! t1_kref+0x33e0:   	save	%sp, -0x60, %sp
	.word	0xb88737ee	! t1_kref+0x33e4:   	addcc	%i4, -0x812, %i4
	.word	0x99ee7cae	! t1_kref+0x33e8:   	restore	%i1, -0x352, %o4
	.word	0x963b401b	! t1_kref+0x33ec:   	xnor	%o5, %i3, %o3
	.word	0xaad6e4d1	! t1_kref+0x33f0:   	umulcc	%i3, 0x4d1, %l5
	.word	0x98c4c000	! t1_kref+0x33f4:   	addccc	%l3, %g0, %o4
	.word	0x85a389ce	! t1_kref+0x33f8:   	fdivd	%f14, %f14, %f2
	.word	0xb3a00121	! t1_kref+0x33fc:   	fabss	%f1, %f25
	.word	0x81ae0acc	! t1_kref+0x3400:   	fcmped	%fcc0, %f24, %f12
	.word	0x95b2c977	! t1_kref+0x3404:   	fpmerge	%f11, %f23, %f10
	.word	0x2b480005	! t1_kref+0x3408:   	fbug,a,pt	%fcc0, _kref+0x341c
	.word	0xaf1039c6	! t1_kref+0x340c:   	taddcctv	%g0, -0x63a, %l7
	.word	0x99b20544	! t1_kref+0x3410:   	fcmpeq16	%f8, %f4, %o4
	.word	0x9fb0076e	! t1_kref+0x3414:   	fpack16	%f14, %f15
	.word	0x96f6fc1d	! t1_kref+0x3418:   	udivcc	%i3, -0x3e3, %o3
	.word	0x8db00fe0	! t1_kref+0x341c:   	fones	%f6
	.word	0xe87e0000	! t1_kref+0x3420:   	swap	[%i0], %l4
	.word	0x81aa8ac6	! t1_kref+0x3424:   	fcmped	%fcc0, %f10, %f6
	.word	0x24480008	! t1_kref+0x3428:   	ble,a,pt	%icc, _kref+0x3448
	.word	0xae92af45	! t1_kref+0x342c:   	orcc	%o2, 0xf45, %l7
	.word	0x9fc10000	! t1_kref+0x3430:   	call	%g4
	.word	0xe3b8a100	! t1_kref+0x3434:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0xa69cf877	! t1_kref+0x3438:   	xorcc	%l3, -0x789, %l3
	.word	0x85a28942	! t1_kref+0x343c:   	fmuld	%f10, %f2, %f2
	.word	0x81ab8acc	! t1_kref+0x3440:   	fcmped	%fcc0, %f14, %f12
	.word	0xa9a01a4c	! t1_kref+0x3444:   	fdtoi	%f12, %f20
	.word	0x99b34638	! t1_kref+0x3448:   	fmul8x16	%f13, %f24, %f12
	.word	0xee28a02d	! t1_kref+0x344c:   	stb	%l7, [%g2 + 0x2d]
	.word	0x98debeb5	! t1_kref+0x3450:   	smulcc	%i2, -0x14b, %o4
	.word	0x94ad2375	! t1_kref+0x3454:   	andncc	%l4, 0x375, %o2
	.word	0xec780018	! t1_kref+0x3458:   	swap	[%g0 + %i0], %l6
	.word	0x949ab893	! t1_kref+0x345c:   	xorcc	%o2, -0x76d, %o2
	.word	0x95b00fc0	! t1_kref+0x3460:   	fone	%f10
	.word	0xac9a001a	! t1_kref+0x3464:   	xorcc	%o0, %i2, %l6
	.word	0xc9ee500d	! t1_kref+0x3468:   	prefetcha	%i1 + %o5, 4
	.word	0xead65000	! t1_kref+0x346c:   	ldsha	[%i1]0x80, %l5
	.word	0xacdee8b7	! t1_kref+0x3470:   	smulcc	%i3, 0x8b7, %l6
	.word	0xea080019	! t1_kref+0x3474:   	ldub	[%g0 + %i1], %l5
	.word	0x9722a4cc	! t1_kref+0x3478:   	mulscc	%o2, 0x4cc, %o3
	.word	0x9804e9ce	! t1_kref+0x347c:   	add	%l3, 0x9ce, %o4
	.word	0xaa1a401b	! t1_kref+0x3480:   	xor	%o1, %i3, %l5
	.word	0x94520017	! t1_kref+0x3484:   	umul	%o0, %l7, %o2
	.word	0xd1267fe0	! t1_kref+0x3488:   	st	%f8, [%i1 - 0x20]
	.word	0x85b38eca	! t1_kref+0x348c:   	fornot2	%f14, %f10, %f2
	.word	0xa7a38921	! t1_kref+0x3490:   	fmuls	%f14, %f1, %f19
	.word	0xa6358013	! t1_kref+0x3494:   	orn	%l6, %l3, %l3
	.word	0x96fdc01a	! t1_kref+0x3498:   	sdivcc	%l7, %i2, %o3
	call	1f
	.empty
	.word	0x93400000	! t1_kref+0x34a0:   	mov	%y, %o1
	.word	0x81a88a56	! t1_kref+0x34a4:   	fcmpd	%fcc0, %f2, %f22
	.word	0x988ac00b	! t1_kref+0x34a8:   	andcc	%o3, %o3, %o4
1:	.word	0xe83e401d	! t1_kref+0x34ac:   	std	%l4, [%i1 + %i5]
	.word	0xae1a8000	! t1_kref+0x34b0:   	xor	%o2, %g0, %l7
	.word	0xe91fbc50	! t1_kref+0x34b4:   	ldd	[%fp - 0x3b0], %f20
	.word	0x98b6f631	! t1_kref+0x34b8:   	orncc	%i3, -0x9cf, %o4
	.word	0x31800008	! t1_kref+0x34bc:   	fba,a	_kref+0x34dc
	.word	0xc9be5849	! t1_kref+0x34c0:   	stda	%f4, [%i1 + %o1]0xc2
	.word	0xada689a4	! t1_kref+0x34c4:   	fdivs	%f26, %f4, %f22
	.word	0x81aa4ab0	! t1_kref+0x34c8:   	fcmpes	%fcc0, %f9, %f16
	.word	0x30800003	! t1_kref+0x34cc:   	ba,a	_kref+0x34d8
	.word	0xaeb4eb34	! t1_kref+0x34d0:   	orncc	%l3, 0xb34, %l7
	.word	0x8db28ad2	! t1_kref+0x34d4:   	fpsub32	%f10, %f18, %f6
	.word	0x9335e009	! t1_kref+0x34d8:   	srl	%l7, 0x9, %o1
	.word	0x9242b719	! t1_kref+0x34dc:   	addc	%o2, -0x8e7, %o1
	.word	0x94a221b5	! t1_kref+0x34e0:   	subcc	%o0, 0x1b5, %o2
	.word	0xf19e5000	! t1_kref+0x34e4:   	ldda	[%i1]0x80, %f24
	.word	0xc1be184d	! t1_kref+0x34e8:   	stda	%f0, [%i0 + %o5]0xc2
	.word	0x91408000	! t1_kref+0x34ec:   	mov	%ccr, %o0
	.word	0x3d480008	! t1_kref+0x34f0:   	fbule,a,pt	%fcc0, _kref+0x3510
	.word	0xabb4c173	! t1_kref+0x34f4:   	edge32ln	%l3, %l3, %l5
	.word	0x28480007	! t1_kref+0x34f8:   	bleu,a,pt	%icc, _kref+0x3514
	.word	0xa7a01882	! t1_kref+0x34fc:   	fitos	%f2, %f19
	.word	0x21800006	! t1_kref+0x3500:   	fbn,a	_kref+0x3518
	.word	0xae536ed2	! t1_kref+0x3504:   	umul	%o5, 0xed2, %l7
	.word	0xd830a01e	! t1_kref+0x3508:   	sth	%o4, [%g2 + 0x1e]
	.word	0xe91fbc98	! t1_kref+0x350c:   	ldd	[%fp - 0x368], %f20
	.word	0x99b3040e	! t1_kref+0x3510:   	fcmple16	%f12, %f14, %o4
	.word	0x81ac8a54	! t1_kref+0x3514:   	fcmpd	%fcc0, %f18, %f20
	.word	0xa65a6e4b	! t1_kref+0x3518:   	smul	%o1, 0xe4b, %l3
	.word	0xc9ee1009	! t1_kref+0x351c:   	prefetcha	%i0 + %o1, 4
	.word	0xaafa7634	! t1_kref+0x3520:   	sdivcc	%o1, -0x9cc, %l5
	.word	0xaf632711	! t1_kref+0x3524:   	movuge	%fcc0, -0xef, %l7
	.word	0x85b00f0e	! t1_kref+0x3528:   	fsrc2	%f14, %f2
	.word	0xaef30015	! t1_kref+0x352c:   	udivcc	%o4, %l5, %l7
	.word	0x94f03d20	! t1_kref+0x3530:   	udivcc	%g0, -0x2e0, %o2
	.word	0x9de3bfa0	! t1_kref+0x3534:   	save	%sp, -0x60, %sp
	.word	0xba2efe78	! t1_kref+0x3538:   	andn	%i3, -0x188, %i5
	.word	0xa9ee801d	! t1_kref+0x353c:   	restore	%i2, %i5, %l4
	.word	0x93a00529	! t1_kref+0x3540:   	fsqrts	%f9, %f9
	.word	0xe3b8a100	! t1_kref+0x3544:   	stda	%f48, [%g2 + 0x100]%asi
	.word	0x99b60ec6	! t1_kref+0x3548:   	fornot2	%f24, %f6, %f12
	.word	0xa7b58450	! t1_kref+0x354c:   	fcmpne16	%f22, %f16, %l3
	.word	0x8d852724	! t1_kref+0x3550:   	wr	%l4, 0x724, %fprs
	.word	0xada00038	! t1_kref+0x3554:   	fmovs	%f24, %f22
	.word	0x93b24356	! t1_kref+0x3558:   	alignaddrl	%o1, %l6, %o1
	.word	0x93b50157	! t1_kref+0x355c:   	edge32l	%l4, %l7, %o1
	.word	0xd320a01c	! t1_kref+0x3560:   	st	%f9, [%g2 + 0x1c]
	.word	0xe968a00c	! t1_kref+0x3564:   	prefetch	%g2 + 0xc, 20
	.word	0x9fc00004	! t1_kref+0x3568:   	call	%g0 + %g4
	.word	0xd03f4019	! t1_kref+0x356c:   	std	%o0, [%i5 + %i1]
	.word	0xd91fbe88	! t1_kref+0x3570:   	ldd	[%fp - 0x178], %f12
	.word	0xacda4016	! t1_kref+0x3574:   	smulcc	%o1, %l6, %l6
	.word	0x8143e040	! t1_kref+0x3578:   	membar	0x40
	.word	0x981d8000	! t1_kref+0x357c:   	xor	%l6, %g0, %o4
	.word	0xafa049b6	! t1_kref+0x3580:   	fdivs	%f1, %f22, %f23
	.word	0x8bb64af9	! t1_kref+0x3584:   	fpsub32s	%f25, %f25, %f5
	.word	0x81854000	! t1_kref+0x3588:   	wr	%l5, %g0, %y
	.word	0xaca6c017	! t1_kref+0x358c:   	subcc	%i3, %l7, %l6
	.word	0xd296d040	! t1_kref+0x3590:   	lduha	[%i3]0x82, %o1
	.word	0xaa080014	! t1_kref+0x3594:   	and	%g0, %l4, %l5
	.word	0xeb263ff0	! t1_kref+0x3598:   	st	%f21, [%i0 - 0x10]
	.word	0x30480005	! t1_kref+0x359c:   	ba,a,pt	%icc, _kref+0x35b0
	.word	0xc91fbfa0	! t1_kref+0x35a0:   	ldd	[%fp - 0x60], %f4
	.word	0x89a00032	! t1_kref+0x35a4:   	fmovs	%f18, %f4
	call	SYM(t1_subr2)
	.word	0xaaa37eb3	! t1_kref+0x35ac:   	subcc	%o5, -0x14d, %l5
	.word	0xa81a0013	! t1_kref+0x35b0:   	xor	%o0, %l3, %l4
	.word	0xe9270018	! t1_kref+0x35b4:   	st	%f20, [%i4 + %i0]
	.word	0xdd000019	! t1_kref+0x35b8:   	ld	[%g0 + %i1], %f14
	.word	0xac2afc7c	! t1_kref+0x35bc:   	andn	%o3, -0x384, %l6
	.word	0xe9066000	! t1_kref+0x35c0:   	ld	[%i1], %f20
	.word	0xd008a00f	! t1_kref+0x35c4:   	ldub	[%g2 + 0xf], %o0
	.word	0x967a7199	! t1_kref+0x35c8:   	sdiv	%o1, -0xe67, %o3
	.word	0xa7b184d8	! t1_kref+0x35cc:   	fcmpne32	%f6, %f24, %l3
	.word	0xaa7cf7a0	! t1_kref+0x35d0:   	sdiv	%l3, -0x860, %l5
	.word	0x85a38d3a	! t1_kref+0x35d4:   	fsmuld	%f14, %f26, %f2
	.word	0x81ac8a4c	! t1_kref+0x35d8:   	fcmpd	%fcc0, %f18, %f12
	.word	0x90023914	! t1_kref+0x35dc:   	add	%o0, -0x6ec, %o0
	.word	0xe67e401c	! t1_kref+0x35e0:   	swap	[%i1 + %i4], %l3
	.word	0xe8163fec	! t1_kref+0x35e4:   	lduh	[%i0 - 0x14], %l4
	.word	0xb1a01906	! t1_kref+0x35e8:   	fitod	%f6, %f24
	.word	0x34800007	! t1_kref+0x35ec:   	bg,a	_kref+0x3608
	.word	0xf1063ff4	! t1_kref+0x35f0:   	ld	[%i0 - 0xc], %f24
	.word	0x90dcc014	! t1_kref+0x35f4:   	smulcc	%l3, %l4, %o0
	.word	0xc9be589b	! t1_kref+0x35f8:   	stda	%f4, [%i1 + %i3]0xc4
	.word	0x98f57667	! t1_kref+0x35fc:   	udivcc	%l5, -0x999, %o4
	.word	0x98a6f9d9	! t1_kref+0x3600:   	subcc	%i3, -0x627, %o4
	.word	0xac9a28f9	! t1_kref+0x3604:   	xorcc	%o0, 0x8f9, %l6
	.word	0x96d56b01	! t1_kref+0x3608:   	umulcc	%l5, 0xb01, %o3
	.word	0xb3b10db7	! t1_kref+0x360c:   	fxors	%f4, %f23, %f25
	.word	0xa93da00d	! t1_kref+0x3610:   	sra	%l6, 0xd, %l4
	.word	0x85a2082d	! t1_kref+0x3614:   	fadds	%f8, %f13, %f2
	.word	0x81a80ac0	! t1_kref+0x3618:   	fcmped	%fcc0, %f0, %f0
	.word	0x81a8cab7	! t1_kref+0x361c:   	fcmpes	%fcc0, %f3, %f23
	.word	0x91a01a48	! t1_kref+0x3620:   	fdtoi	%f8, %f8
	.word	0xd2463ff4	! t1_kref+0x3624:   	ldsw	[%i0 - 0xc], %o1
	.word	0xf5ee501d	! t1_kref+0x3628:   	prefetcha	%i1 + %i5, 26
	.word	0x99b30149	! t1_kref+0x362c:   	edge32l	%o4, %o1, %o4
	.word	0x8610200e	! t1_kref+0x3630:   	mov	0xe, %g3
	.word	0x86a0e001	! t1_kref+0x3634:   	subcc	%g3, 1, %g3
	.word	0x22800012	! t1_kref+0x3638:   	be,a	_kref+0x3680
	.word	0xd1be1809	! t1_kref+0x363c:   	stda	%f8, [%i0 + %o1]0xc0
	.word	0xd8ce5000	! t1_kref+0x3640:   	ldsba	[%i1]0x80, %o4
	.word	0xfdee101d	! t1_kref+0x3644:   	prefetcha	%i0 + %i5, 30
	.word	0xa892b4ca	! t1_kref+0x3648:   	orcc	%o2, -0xb36, %l4
	.word	0x96ace06e	! t1_kref+0x364c:   	andncc	%l3, 0x6e, %o3
	.word	0x8fa00024	! t1_kref+0x3650:   	fmovs	%f4, %f7
	.word	0x37800002	! t1_kref+0x3654:   	fbge,a	_kref+0x365c
	.word	0xafb485c8	! t1_kref+0x3658:   	fcmpeq32	%f18, %f8, %l7
	.word	0x85a0192d	! t1_kref+0x365c:   	fstod	%f13, %f2
	.word	0xa6427535	! t1_kref+0x3660:   	addc	%o1, -0xacb, %l3
	.word	0xee7e3fe4	! t1_kref+0x3664:   	swap	[%i0 - 0x1c], %l7
	.word	0x81580000	! t1_kref+0x3668:   	flushw
	.word	0x95a01936	! t1_kref+0x366c:   	fstod	%f22, %f10
	.word	0x96058016	! t1_kref+0x3670:   	add	%l6, %l6, %o3
	.word	0xd40e8018	! t1_kref+0x3674:   	ldub	[%i2 + %i0], %o2
	.word	0xd896d019	! t1_kref+0x3678:   	lduha	[%i3 + %i1]0x80, %o4
	.word	0x92c68014	! t1_kref+0x367c:   	addccc	%i2, %l4, %o1
	.word	0x25800007	! t1_kref+0x3680:   	fblg,a	_kref+0x369c
	.word	0x93a01895	! t1_kref+0x3684:   	fitos	%f21, %f9
	.word	0xd2560000	! t1_kref+0x3688:   	ldsh	[%i0], %o1
	.word	0xdf070019	! t1_kref+0x368c:   	ld	[%i4 + %i1], %f15
	.word	0x81adca22	! t1_kref+0x3690:   	fcmps	%fcc0, %f23, %f2
	.word	0xa3a0c821	! t1_kref+0x3694:   	fadds	%f3, %f1, %f17
	.word	0x96a26fa1	! t1_kref+0x3698:   	subcc	%o1, 0xfa1, %o3
	.word	0x91b28594	! t1_kref+0x369c:   	fcmpgt32	%f10, %f20, %o0
	.word	0xadb54200	! t1_kref+0x36a0:   	array8	%l5, %g0, %l6
	.word	0xd4380019	! t1_kref+0x36a4:   	std	%o2, [%g0 + %i1]
	.word	0x973d4013	! t1_kref+0x36a8:   	sra	%l5, %l3, %o3
	.word	0x2c800003	! t1_kref+0x36ac:   	bneg,a	_kref+0x36b8
	.word	0x99b105d0	! t1_kref+0x36b0:   	fcmpeq32	%f4, %f16, %o4
	.word	0x9232800c	! t1_kref+0x36b4:   	orn	%o2, %o4, %o1
	.word	0xadb1874a	! t1_kref+0x36b8:   	fpack32	%f6, %f10, %f22
	.word	0x89a0190a	! t1_kref+0x36bc:   	fitod	%f10, %f4
	.word	0x32800008	! t1_kref+0x36c0:   	bne,a	_kref+0x36e0
	.word	0x95b10c56	! t1_kref+0x36c4:   	fnor	%f4, %f22, %f10
	.word	0xacf4f908	! t1_kref+0x36c8:   	udivcc	%l3, -0x6f8, %l6
	.word	0x927d2012	! t1_kref+0x36cc:   	sdiv	%l4, 0x12, %o1
	.word	0xa7b6040a	! t1_kref+0x36d0:   	fcmple16	%f24, %f10, %l3
	.word	0xd1064000	! t1_kref+0x36d4:   	ld	[%i1], %f8
	.word	0x81a90ab9	! t1_kref+0x36d8:   	fcmpes	%fcc0, %f4, %f25
	.word	0x89b10980	! t1_kref+0x36dc:   	bshuffle	%f4, %f0, %f4
	.word	0x98757b65	! t1_kref+0x36e0:   	udiv	%l5, -0x49b, %o4
	.word	0xd66e4000	! t1_kref+0x36e4:   	ldstub	[%i1], %o3
	.word	0xe83e7fe0	! t1_kref+0x36e8:   	std	%l4, [%i1 - 0x20]
	.word	0x9498000a	! t1_kref+0x36ec:   	xorcc	%g0, %o2, %o2
	.word	0x93b6800c	! t1_kref+0x36f0:   	edge8	%i2, %o4, %o1
	.word	0x81b107c4	! t1_kref+0x36f4:   	pdist	%f4, %f4, %f0
	.word	0xaeda801b	! t1_kref+0x36f8:   	smulcc	%o2, %i3, %l7
	.word	0xaa852348	! t1_kref+0x36fc:   	addcc	%l4, 0x348, %l5
	.word	0x3e800003	! t1_kref+0x3700:   	bvc,a	_kref+0x370c
	.word	0x1716c048	! t1_kref+0x3704:   	sethi	%hi(0x5b012000), %o3
	.word	0xa8fa8013	! t1_kref+0x3708:   	sdivcc	%o2, %l3, %l4
	.word	0x83a00535	! t1_kref+0x370c:   	fsqrts	%f21, %f1
	.word	0xee2e2018	! t1_kref+0x3710:   	stb	%l7, [%i0 + 0x18]
	.word	0xa5a01a58	! t1_kref+0x3714:   	fdtoi	%f24, %f18
	.word	0xb1a01a46	! t1_kref+0x3718:   	fdtoi	%f6, %f24
	.word	0x86102001	! t1_kref+0x371c:   	mov	0x1, %g3
	.word	0x32800000	! t1_kref+0x3720:   	bne,a	_kref+0x3720
	.word	0x86a0e001	! t1_kref+0x3724:   	subcc	%g3, 1, %g3
	.word	0x81a6094c	! t1_kref+0x3728:   	fmuld	%f24, %f12, %f0
	.word	0x85b1cf6a	! t1_kref+0x372c:   	fornot1s	%f7, %f10, %f2
	.word	0xa6dd2a1b	! t1_kref+0x3730:   	smulcc	%l4, 0xa1b, %l3
	.word	0xc9be1857	! t1_kref+0x3734:   	stda	%f4, [%i0 + %l7]0xc2
	.word	0x3e480008	! t1_kref+0x3738:   	bvc,a,pt	%icc, _kref+0x3758
	.word	0x89a388c2	! t1_kref+0x373c:   	fsubd	%f14, %f2, %f4
	.word	0xaad80015	! t1_kref+0x3740:   	smulcc	%g0, %l5, %l5
	.word	0x38480007	! t1_kref+0x3744:   	bgu,a,pt	%icc, _kref+0x3760
	.word	0xebee501a	! t1_kref+0x3748:   	prefetcha	%i1 + %i2, 21
	.word	0x36800003	! t1_kref+0x374c:   	bge,a	_kref+0x3758
	.word	0xa7b3415a	! t1_kref+0x3750:   	edge32l	%o5, %i2, %l3
	.word	0xb1a01022	! t1_kref+0x3754:   	fstox	%f2, %f24
	.word	0xa8ade210	! t1_kref+0x3758:   	andncc	%l7, 0x210, %l4
	.word	0xe60e0000	! t1_kref+0x375c:   	ldub	[%i0], %l3
	.word	0xd48e9040	! t1_kref+0x3760:   	lduba	[%i2]0x82, %o2
	.word	0x95a01897	! t1_kref+0x3764:   	fitos	%f23, %f10
	.word	0xa5b18d40	! t1_kref+0x3768:   	fnot1	%f6, %f18
	.word	0xa1b007b6	! t1_kref+0x376c:   	fpackfix	%f22, %f16
	.word	0x913d6014	! t1_kref+0x3770:   	sra	%l5, 0x14, %o0
	.word	0xa786801a	! t1_kref+0x3774:   	wr	%i2, %i2, %gsr
	.word	0x9fc00004	! t1_kref+0x3778:   	call	%g0 + %g4
	.word	0xa5a01894	! t1_kref+0x377c:   	fitos	%f20, %f18
	.word	0x9db28984	! t1_kref+0x3780:   	bshuffle	%f10, %f4, %f14
	.word	0xa5a1094c	! t1_kref+0x3784:   	fmuld	%f4, %f12, %f18
	.word	0x83b50a74	! t1_kref+0x3788:   	fpadd32s	%f20, %f20, %f1
	.word	0xc568a0c0	! t1_kref+0x378c:   	prefetch	%g2 + 0xc0, 2
	.word	0x93a0188a	! t1_kref+0x3790:   	fitos	%f10, %f9
	.word	0xe5be1000	! t1_kref+0x3794:   	stda	%f18, [%i0]0x80
	.word	0x96a58014	! t1_kref+0x3798:   	subcc	%l6, %l4, %o3
	.word	0xf4b81018	! t1_kref+0x379c:   	stda	%i2, [%g0 + %i0]0x80
	.word	0x90c58015	! t1_kref+0x37a0:   	addccc	%l6, %l5, %o0
	.word	0xaad0000a	! t1_kref+0x37a4:   	umulcc	%g0, %o2, %l5
	.word	0xb1a0054a	! t1_kref+0x37a8:   	fsqrtd	%f10, %f24
	.word	0x97a0012b	! t1_kref+0x37ac:   	fabss	%f11, %f11
	.word	0xa5b50c48	! t1_kref+0x37b0:   	fnor	%f20, %f8, %f18
	.word	0x8d836cf7	! t1_kref+0x37b4:   	wr	%o5, 0xcf7, %fprs
	.word	0xf1be5849	! t1_kref+0x37b8:   	stda	%f24, [%i1 + %o1]0xc2
	.word	0xa8258016	! t1_kref+0x37bc:   	sub	%l6, %l6, %l4
	.word	0x2f800007	! t1_kref+0x37c0:   	fbu,a	_kref+0x37dc
	.word	0xaab58015	! t1_kref+0x37c4:   	orncc	%l6, %l5, %l5
	.word	0xafb18444	! t1_kref+0x37c8:   	fcmpne16	%f6, %f4, %l7
	.word	0x9084c016	! t1_kref+0x37cc:   	addcc	%l3, %l6, %o0
	.word	0xa626a49b	! t1_kref+0x37d0:   	sub	%i2, 0x49b, %l3
	.word	0x96a6801a	! t1_kref+0x37d4:   	subcc	%i2, %i2, %o3
	.word	0xac922fd4	! t1_kref+0x37d8:   	orcc	%o0, 0xfd4, %l6
	.word	0xa3a01887	! t1_kref+0x37dc:   	fitos	%f7, %f17
	.word	0xa5b50f6c	! t1_kref+0x37e0:   	fornot1s	%f20, %f12, %f18
	.word	0xd60e201c	! t1_kref+0x37e4:   	ldub	[%i0 + 0x1c], %o3
	.word	0xafb6c0c8	! t1_kref+0x37e8:   	edge16l	%i3, %o0, %l7
	.word	0x9265000a	! t1_kref+0x37ec:   	subc	%l4, %o2, %o1
	.word	0x90d56e62	! t1_kref+0x37f0:   	umulcc	%l5, 0xe62, %o0
	.word	0xf3a61000	! t1_kref+0x37f4:   	sta	%f25, [%i0]0x80
	.word	0x8da68838	! t1_kref+0x37f8:   	fadds	%f26, %f24, %f6
	.word	0x85a01939	! t1_kref+0x37fc:   	fstod	%f25, %f2
	.word	0xe11f4018	! t1_kref+0x3800:   	ldd	[%i5 + %i0], %f16
	.word	0x9da01924	! t1_kref+0x3804:   	fstod	%f4, %f14
	.word	0x98dd8014	! t1_kref+0x3808:   	smulcc	%l6, %l4, %o4
	.word	0x95a0cd38	! t1_kref+0x380c:   	fsmuld	%f3, %f24, %f10
	.word	0xa7b2c0b3	! t1_kref+0x3810:   	edge16n	%o3, %l3, %l3
	.word	0x81820000	! t1_kref+0x3814:   	wr	%o0, %g0, %y
	.word	0xe43e401d	! t1_kref+0x3818:   	std	%l2, [%i1 + %i5]
	.word	0x90b5f308	! t1_kref+0x381c:   	orncc	%l7, -0xcf8, %o0
	.word	0xf51fbd10	! t1_kref+0x3820:   	ldd	[%fp - 0x2f0], %f26
	.word	0xe306001c	! t1_kref+0x3824:   	ld	[%i0 + %i4], %f17
	.word	0xee270019	! t1_kref+0x3828:   	st	%l7, [%i4 + %i1]
	.word	0x86102005	! t1_kref+0x382c:   	mov	0x5, %g3
	.word	0x86a0e001	! t1_kref+0x3830:   	subcc	%g3, 1, %g3
	.word	0x22800014	! t1_kref+0x3834:   	be,a	_kref+0x3884
	.word	0x9434c009	! t1_kref+0x3838:   	orn	%l3, %o1, %o2
	.word	0xf430a02e	! t1_kref+0x383c:   	sth	%i2, [%g2 + 0x2e]
	.word	0x81ad8a50	! t1_kref+0x3840:   	fcmpd	%fcc0, %f22, %f16
	.word	0xe6567ff2	! t1_kref+0x3844:   	ldsh	[%i1 - 0xe], %l3
	.word	0x35bffffa	! t1_kref+0x3848:   	fbue,a	_kref+0x3830
	.word	0x2f2f3c48	! t1_kref+0x384c:   	sethi	%hi(0xbcf12000), %l7
	.word	0xf6f6101d	! t1_kref+0x3850:   	stxa	%i3, [%i0 + %i5]0x80
	.word	0xe51fbd20	! t1_kref+0x3854:   	ldd	[%fp - 0x2e0], %f18
	.word	0xabb6c14c	! t1_kref+0x3858:   	edge32l	%i3, %o4, %l5
	.word	0xafa00023	! t1_kref+0x385c:   	fmovs	%f3, %f23
	.word	0xaec3400c	! t1_kref+0x3860:   	addccc	%o5, %o4, %l7
	.word	0xa7b48ea0	! t1_kref+0x3864:   	fsrc1s	%f18, %f19
	.word	0x933ce003	! t1_kref+0x3868:   	sra	%l3, 0x3, %o1
	.word	0xae830008	! t1_kref+0x386c:   	addcc	%o4, %o0, %l7
	.word	0x111669de	! t1_kref+0x3870:   	sethi	%hi(0x59a77800), %o0
	.word	0x83a000b3	! t1_kref+0x3874:   	fnegs	%f19, %f1
	.word	0xadb2000a	! t1_kref+0x3878:   	edge8	%o0, %o2, %l6
	.word	0x9db40e12	! t1_kref+0x387c:   	fand	%f16, %f18, %f14
	.word	0x81a94a30	! t1_kref+0x3880:   	fcmps	%fcc0, %f5, %f16
	.word	0x95418000	! t1_kref+0x3884:   	mov	%fprs, %o2
	.word	0x968ce20b	! t1_kref+0x3888:   	andcc	%l3, 0x20b, %o3
	.word	0xe8180019	! t1_kref+0x388c:   	ldd	[%g0 + %i1], %l4
	.word	0xafb38e32	! t1_kref+0x3890:   	fands	%f14, %f18, %f23
	.word	0xa3b38ea0	! t1_kref+0x3894:   	fsrc1s	%f14, %f17
	.word	0x89a000b0	! t1_kref+0x3898:   	fnegs	%f16, %f4
	call	SYM(t1_subr2)
	.word	0xc02e7ff6	! t1_kref+0x38a0:   	clrb	[%i1 - 0xa]
	.word	0x95b00fc0	! t1_kref+0x38a4:   	fone	%f10
	.word	0xa3a01886	! t1_kref+0x38a8:   	fitos	%f6, %f17
	.word	0x8583000d	! t1_kref+0x38ac:   	wr	%o4, %o5, %ccr
	.word	0x81854000	! t1_kref+0x38b0:   	wr	%l5, %g0, %y
	.word	0xa5a348ab	! t1_kref+0x38b4:   	fsubs	%f13, %f11, %f18
	.word	0x81aa0aaf	! t1_kref+0x38b8:   	fcmpes	%fcc0, %f8, %f15
	.word	0x96b5f04f	! t1_kref+0x38bc:   	orncc	%l7, -0xfb1, %o3
	.word	0xd0763fe0	! t1_kref+0x38c0:   	stx	%o0, [%i0 - 0x20]
	.word	0xead65000	! t1_kref+0x38c4:   	ldsha	[%i1]0x80, %l5
	.word	0x86102021	! t1_kref+0x38c8:   	mov	0x21, %g3
	.word	0x86a0e001	! t1_kref+0x38cc:   	subcc	%g3, 1, %g3
	.word	0x2280001d	! t1_kref+0x38d0:   	be,a	_kref+0x3944
	.word	0xb1a01892	! t1_kref+0x38d4:   	fitos	%f18, %f24
	.word	0x988ebb04	! t1_kref+0x38d8:   	andcc	%i2, -0x4fc, %o4
	.word	0x81abcaac	! t1_kref+0x38dc:   	fcmpes	%fcc0, %f15, %f12
	.word	0xa8c6c00b	! t1_kref+0x38e0:   	addccc	%i3, %o3, %l4
	.word	0x9db08dd0	! t1_kref+0x38e4:   	fnand	%f2, %f16, %f14
	.word	0xe3b8a0c0	! t1_kref+0x38e8:   	stda	%f48, [%g2 + 0xc0]%asi
	.word	0x9492aa8d	! t1_kref+0x38ec:   	orcc	%o2, 0xa8d, %o2
	.word	0x81accab1	! t1_kref+0x38f0:   	fcmpes	%fcc0, %f19, %f17
	.word	0xa635400d	! t1_kref+0x38f4:   	orn	%l5, %o5, %l3
	.word	0xd03e3fe0	! t1_kref+0x38f8:   	std	%o0, [%i0 - 0x20]
	.word	0xa9a389d0	! t1_kref+0x38fc:   	fdivd	%f14, %f16, %f20
	.word	0xc10866c6	! t1_kref+0x3900:   	ld	[%g1 + 0x6c6], %fsr
	.word	0x98b5c016	! t1_kref+0x3904:   	orncc	%l7, %l6, %o4
	.word	0xe06e3fed	! t1_kref+0x3908:   	ldstub	[%i0 - 0x13], %l0
	.word	0x81834000	! t1_kref+0x390c:   	wr	%o5, %g0, %y
	.word	0xadb30c40	! t1_kref+0x3910:   	fnor	%f12, %f0, %f22
	.word	0xc0a6501c	! t1_kref+0x3914:   	sta	%g0, [%i1 + %i4]0x80
	.word	0xc3263ff4	! t1_kref+0x3918:   	st	%f1, [%i0 - 0xc]
	.word	0x96328009	! t1_kref+0x391c:   	orn	%o2, %o1, %o3
	.word	0xe3b8a0c0	! t1_kref+0x3920:   	stda	%f48, [%g2 + 0xc0]%asi
	.word	0x9045e4eb	! t1_kref+0x3924:   	addc	%l7, 0x4eb, %o0
	.word	0x989a400c	! t1_kref+0x3928:   	xorcc	%o1, %o4, %o4
	.word	0x81ad8ace	! t1_kref+0x392c:   	fcmped	%fcc0, %f22, %f14
	.word	0x85a018d8	! t1_kref+0x3930:   	fdtos	%f24, %f2
	.word	0xb1b30737	! t1_kref+0x3934:   	fmuld8ulx16	%f12, %f23, %f24
	.word	0xe3b8a0c0	! t1_kref+0x3938:   	stda	%f48, [%g2 + 0xc0]%asi
	.word	0xaab3792c	! t1_kref+0x393c:   	orncc	%o5, -0x6d4, %l5
	.word	0xf1066000	! t1_kref+0x3940:   	ld	[%i1], %f24
	.word	0x9223400d	! t1_kref+0x3944:   	sub	%o5, %o5, %o1
	.word	0x9fa01884	! t1_kref+0x3948:   	fitos	%f4, %f15
	.word	0xd420a03c	! t1_kref+0x394c:   	st	%o2, [%g2 + 0x3c]
	.word	0xadb00f0e	! t1_kref+0x3950:   	fsrc2	%f14, %f22
	.word	0xb5b10a96	! t1_kref+0x3954:   	fpsub16	%f4, %f22, %f26
	.word	0xaf3a401b	! t1_kref+0x3958:   	sra	%o1, %i3, %l7
	.word	0xec3e7fe8	! t1_kref+0x395c:   	std	%l6, [%i1 - 0x18]
	.word	0x2b1aebe7	! t1_kref+0x3960:   	sethi	%hi(0x6baf9c00), %l5
	.word	0xe3b8a0c0	! t1_kref+0x3964:   	stda	%f48, [%g2 + 0xc0]%asi
	.word	0xe3b8a0c0	! t1_kref+0x3968:   	stda	%f48, [%g2 + 0xc0]%asi
	.word	0x8584c014	! t1_kref+0x396c:   	wr	%l3, %l4, %ccr
	.word	0x8d833485	! t1_kref+0x3970:   	wr	%o4, 0xfffff485, %fprs
	.word	0x2d1b917e	! t1_kref+0x3974:   	sethi	%hi(0x6e45f800), %l6
	.word	0x89a609c6	! t1_kref+0x3978:   	fdivd	%f24, %f6, %f4
	.word	0x921eaa98	! t1_kref+0x397c:   	xor	%i2, 0xa98, %o1
	.word	0xec30a02c	! t1_kref+0x3980:   	sth	%l6, [%g2 + 0x2c]
	.word	0xe3b8a0c0	! t1_kref+0x3984:   	stda	%f48, [%g2 + 0xc0]%asi
	.word	0x961dbeab	! t1_kref+0x3988:   	xor	%l6, -0x155, %o3
	.word	0x8da20d29	! t1_kref+0x398c:   	fsmuld	%f8, %f9, %f6
	.word	0x92f6a528	! t1_kref+0x3990:   	udivcc	%i2, 0x528, %o1
	.word	0xedee101c	! t1_kref+0x3994:   	prefetcha	%i0 + %i4, 22
	.word	0xa5a508d0	! t1_kref+0x3998:   	fsubd	%f20, %f16, %f18
	.word	0x86102002	! t1_kref+0x399c:   	mov	0x2, %g3
	.word	0x32800000	! t1_kref+0x39a0:   	bne,a	_kref+0x39a0
	.word	0x86a0e001	! t1_kref+0x39a4:   	subcc	%g3, 1, %g3
	sethi	%hi(2f), %o7
	.word	0xe40be1f0	! t1_kref+0x39ac:   	ldub	[%o7 + 0x1f0], %l2
	.word	0xa41ca00c	! t1_kref+0x39b0:   	xor	%l2, 0xc, %l2
	.word	0xe42be1f0	! t1_kref+0x39b4:   	stb	%l2, [%o7 + 0x1f0]
	.word	0x81dbe1f0	! t1_kref+0x39b8:   	flush	%o7 + 0x1f0
	.word	0x99b34af6	! t1_kref+0x39bc:   	fpsub32s	%f13, %f22, %f12
	.word	0xf628a017	! t1_kref+0x39c0:   	stb	%i3, [%g2 + 0x17]
	.word	0x31800001	! t1_kref+0x39c4:   	fba,a	_kref+0x39c8
	.word	0x92fd247a	! t1_kref+0x39c8:   	sdivcc	%l4, 0x47a, %o1
	.word	0xe856001b	! t1_kref+0x39cc:   	ldsh	[%i0 + %i3], %l4
	.word	0x8db40a54	! t1_kref+0x39d0:   	fpadd32	%f16, %f20, %f6
	.word	0xcd1fbf10	! t1_kref+0x39d4:   	ldd	[%fp - 0xf0], %f6
	.word	0x8143c000	! t1_kref+0x39d8:   	stbar
	.word	0x2f34387c	! t1_kref+0x39dc:   	sethi	%hi(0xd0e1f000), %l7
	.word	0xae1ac00c	! t1_kref+0x39e0:   	xor	%o3, %o4, %l7
	.word	0x94f6ecdd	! t1_kref+0x39e4:   	udivcc	%i3, 0xcdd, %o2
	.word	0x81aa8aa1	! t1_kref+0x39e8:   	fcmpes	%fcc0, %f10, %f1
	.word	0xacbab574	! t1_kref+0x39ec:   	xnorcc	%o2, -0xa8c, %l6
2:	.word	0xc9be581b	! t1_kref+0x39f0:   	stda	%f4, [%i1 + %i3]0xc0
	.word	0x86102006	! t1_kref+0x39f4:   	mov	0x6, %g3
	.word	0x86a0e001	! t1_kref+0x39f8:   	subcc	%g3, 1, %g3
	.word	0x22800020	! t1_kref+0x39fc:   	be,a	_kref+0x3a7c
	.word	0xa7a44833	! t1_kref+0x3a00:   	fadds	%f17, %f19, %f19
	.word	0xaedcc015	! t1_kref+0x3a04:   	smulcc	%l3, %l5, %l7
	.word	0x99a01086	! t1_kref+0x3a08:   	fxtos	%f6, %f12
	.word	0xa9258014	! t1_kref+0x3a0c:   	mulscc	%l6, %l4, %l4
	.word	0xec56c019	! t1_kref+0x3a10:   	ldsh	[%i3 + %i1], %l6
	.word	0x9da0190f	! t1_kref+0x3a14:   	fitod	%f15, %f14
	.word	0x8fa01890	! t1_kref+0x3a18:   	fitos	%f16, %f7
	.word	0xe93e4000	! t1_kref+0x3a1c:   	std	%f20, [%i1]
	.word	0x92f3000a	! t1_kref+0x3a20:   	udivcc	%o4, %o2, %o1
	.word	0x93418000	! t1_kref+0x3a24:   	mov	%fprs, %o1
	.word	0xae9d207b	! t1_kref+0x3a28:   	xorcc	%l4, 0x7b, %l7
	.word	0x8ba48932	! t1_kref+0x3a2c:   	fmuls	%f18, %f18, %f5
	.word	0xe3b8a0c0	! t1_kref+0x3a30:   	stda	%f48, [%g2 + 0xc0]%asi
	.word	0x90980009	! t1_kref+0x3a34:   	xorcc	%g0, %o1, %o0
	.word	0x3fbffff0	! t1_kref+0x3a38:   	fbo,a	_kref+0x39f8
	.word	0xafb6809b	! t1_kref+0x3a3c:   	edge16	%i2, %i3, %l7
	.word	0xadb48c94	! t1_kref+0x3a40:   	fandnot2	%f18, %f20, %f22
	.word	0xf11fbc98	! t1_kref+0x3a44:   	ldd	[%fp - 0x368], %f24
	.word	0x81aa4aab	! t1_kref+0x3a48:   	fcmpes	%fcc0, %f9, %f11
	.word	0xec7e7fe0	! t1_kref+0x3a4c:   	swap	[%i1 - 0x20], %l6
	.word	0x96ba801b	! t1_kref+0x3a50:   	xnorcc	%o2, %i3, %o3
	.word	0xe968a004	! t1_kref+0x3a54:   	prefetch	%g2 + 4, 20
	.word	0x90a28016	! t1_kref+0x3a58:   	subcc	%o2, %l6, %o0
	.word	0x81a98a38	! t1_kref+0x3a5c:   	fcmps	%fcc0, %f6, %f24
	.word	0xa9b38d94	! t1_kref+0x3a60:   	fxor	%f14, %f20, %f20
	.word	0xafb18540	! t1_kref+0x3a64:   	fcmpeq16	%f6, %f0, %l7
	.word	0x95b087d0	! t1_kref+0x3a68:   	pdist	%f2, %f16, %f10
	.word	0x2bbfffe3	! t1_kref+0x3a6c:   	fbug,a	_kref+0x39f8
	.word	0x96d8224e	! t1_kref+0x3a70:   	smulcc	%g0, 0x24e, %o3
	.word	0x961dc00a	! t1_kref+0x3a74:   	xor	%l7, %o2, %o3
	.word	0xabb48ae6	! t1_kref+0x3a78:   	fpsub32s	%f18, %f6, %f21
	.word	0xe83e3fe0	! t1_kref+0x3a7c:   	std	%l4, [%i0 - 0x20]
	.word	0x8143e037	! t1_kref+0x3a80:   	membar	0x37
	.word	0xa635c00a	! t1_kref+0x3a84:   	orn	%l7, %o2, %l3
	.word	0xe828a00f	! t1_kref+0x3a88:   	stb	%l4, [%g2 + 0xf]
	.word	0x98da0014	! t1_kref+0x3a8c:   	smulcc	%o0, %l4, %o4
	.word	0xed1fbd40	! t1_kref+0x3a90:   	ldd	[%fp - 0x2c0], %f22
	.word	0xa7b6c240	! t1_kref+0x3a94:   	array16	%i3, %g0, %l3
	.word	0x91418000	! t1_kref+0x3a98:   	mov	%fprs, %o0
	.word	0xdf06401c	! t1_kref+0x3a9c:   	ld	[%i1 + %i4], %f15
	.word	0x926575b6	! t1_kref+0x3aa0:   	subc	%l5, -0xa4a, %o1
	.word	0x26800006	! t1_kref+0x3aa4:   	bl,a	_kref+0x3abc
	.word	0xaf3ae01f	! t1_kref+0x3aa8:   	sra	%o3, 0x1f, %l7
	.word	0xc51fbf50	! t1_kref+0x3aac:   	ldd	[%fp - 0xb0], %f2
	.word	0xf120a00c	! t1_kref+0x3ab0:   	st	%f24, [%g2 + 0xc]
	.word	0xd7260000	! t1_kref+0x3ab4:   	st	%f11, [%i0]
	.word	0x90a2fd68	! t1_kref+0x3ab8:   	subcc	%o3, -0x298, %o0
	.word	0x81aa4a21	! t1_kref+0x3abc:   	fcmps	%fcc0, %f9, %f1
	.word	0x9db00c20	! t1_kref+0x3ac0:   	fzeros	%f14
	.word	0x95408000	! t1_kref+0x3ac4:   	mov	%ccr, %o2
	.word	0x38800008	! t1_kref+0x3ac8:   	bgu,a	_kref+0x3ae8
	.word	0xa6a2a6aa	! t1_kref+0x3acc:   	subcc	%o2, 0x6aa, %l3
	.word	0x81858000	! t1_kref+0x3ad0:   	wr	%l6, %g0, %y
	.word	0xadb30e80	! t1_kref+0x3ad4:   	fsrc1	%f12, %f22
	.word	0x3a480001	! t1_kref+0x3ad8:   	bcc,a,pt	%icc, _kref+0x3adc
	.word	0x2b19a2be	! t1_kref+0x3adc:   	sethi	%hi(0x668af800), %l5
	.word	0x34480001	! t1_kref+0x3ae0:   	bg,a,pt	%icc, _kref+0x3ae4
	.word	0x913dc013	! t1_kref+0x3ae4:   	sra	%l7, %l3, %o0
	.word	0xac836833	! t1_kref+0x3ae8:   	addcc	%o5, 0x833, %l6
	.word	0xb1a4c9ba	! t1_kref+0x3aec:   	fdivs	%f19, %f26, %f24
	.word	0x81580000	! t1_kref+0x3af0:   	flushw
	.word	0xd256c000	! t1_kref+0x3af4:   	ldsh	[%i3], %o1
	.word	0x8184c000	! t1_kref+0x3af8:   	wr	%l3, %g0, %y
	.word	0xd828a037	! t1_kref+0x3afc:   	stb	%o4, [%g2 + 0x37]
	.word	0xe678a004	! t1_kref+0x3b00:   	swap	[%g2 + 4], %l3
	.word	0xa834f338	! t1_kref+0x3b04:   	orn	%l3, -0xcc8, %l4
	.word	0xc07e0000	! t1_kref+0x3b08:   	swap	[%i0], %g0
	.word	0x36800007	! t1_kref+0x3b0c:   	bge,a	_kref+0x3b28
	.word	0xe3b8a0c0	! t1_kref+0x3b10:   	stda	%f48, [%g2 + 0xc0]%asi
	.word	0xec180018	! t1_kref+0x3b14:   	ldd	[%g0 + %i0], %l6
	.word	0x93b00095	! t1_kref+0x3b18:   	edge16	%g0, %l5, %o1
	.word	0x8143c000	! t1_kref+0x3b1c:   	stbar
	.word	0xecee5000	! t1_kref+0x3b20:   	ldstuba	[%i1]0x80, %l6
	.word	0x95b68c50	! t1_kref+0x3b24:   	fnor	%f26, %f16, %f10
	.word	0x9fa60925	! t1_kref+0x3b28:   	fmuls	%f24, %f5, %f15
	.word	0xa1b187ce	! t1_kref+0x3b2c:   	pdist	%f6, %f14, %f16
	.word	0xae7dc00d	! t1_kref+0x3b30:   	sdiv	%l7, %o5, %l7
	.word	0x96da400d	! t1_kref+0x3b34:   	smulcc	%o1, %o5, %o3
	.word	0x99b6c077	! t1_kref+0x3b38:   	edge8ln	%i3, %l7, %o4
	.word	0xe91e3ff0	! t1_kref+0x3b3c:   	ldd	[%i0 - 0x10], %f20
	.word	0xe43e7ff8	! t1_kref+0x3b40:   	std	%l2, [%i1 - 8]
	.word	0x24480006	! t1_kref+0x3b44:   	ble,a,pt	%icc, _kref+0x3b5c
	.word	0x81a409c6	! t1_kref+0x3b48:   	fdivd	%f16, %f6, %f0
	.word	0x99a0c924	! t1_kref+0x3b4c:   	fmuls	%f3, %f4, %f12
	.word	0xaa32000a	! t1_kref+0x3b50:   	orn	%o0, %o2, %l5
	.word	0xd85f4018	! t1_kref+0x3b54:   	ldx	[%i5 + %i0], %o4
	.word	0x98830016	! t1_kref+0x3b58:   	addcc	%o4, %l6, %o4
	.word	0x963b4015	! t1_kref+0x3b5c:   	xnor	%o5, %l5, %o3
	.word	0xd51e401d	! t1_kref+0x3b60:   	ldd	[%i1 + %i5], %f10
	.word	0xa9b48aca	! t1_kref+0x3b64:   	fpsub32	%f18, %f10, %f20
	.word	0xa3b00fe0	! t1_kref+0x3b68:   	fones	%f17
	.word	0xdf270018	! t1_kref+0x3b6c:   	st	%f15, [%i4 + %i0]
	.word	0x961b2223	! t1_kref+0x3b70:   	xor	%o4, 0x223, %o3
	.word	0x8db38756	! t1_kref+0x3b74:   	fpack32	%f14, %f22, %f6
	.word	0xea762000	! t1_kref+0x3b78:   	stx	%l5, [%i0]
	.word	0xac524016	! t1_kref+0x3b7c:   	umul	%o1, %l6, %l6
	.word	0x99b58128	! t1_kref+0x3b80:   	edge32n	%l6, %o0, %o4
	.word	0x23480002	! t1_kref+0x3b84:   	fbne,a,pt	%fcc0, _kref+0x3b8c
	.word	0x81da401b	! t1_kref+0x3b88:   	flush	%o1 + %i3
	.word	0x98a24014	! t1_kref+0x3b8c:   	subcc	%o1, %l4, %o4
	.word	0x981ec00a	! t1_kref+0x3b90:   	xor	%i3, %o2, %o4
	.word	0x83b00c20	! t1_kref+0x3b94:   	fzeros	%f1
	.word	0xac832839	! t1_kref+0x3b98:   	addcc	%o4, 0x839, %l6
	.word	0x921a2ec5	! t1_kref+0x3b9c:   	xor	%o0, 0xec5, %o1
	.word	0xe646401c	! t1_kref+0x3ba0:   	ldsw	[%i1 + %i4], %l3
	.word	0x92dee928	! t1_kref+0x3ba4:   	smulcc	%i3, 0x928, %o1
	.word	0xa7a01a46	! t1_kref+0x3ba8:   	fdtoi	%f6, %f19
	.word	0xd208a00f	! t1_kref+0x3bac:   	ldub	[%g2 + 0xf], %o1
	.word	0x89a01908	! t1_kref+0x3bb0:   	fitod	%f8, %f4
	.word	0x99b3014a	! t1_kref+0x3bb4:   	edge32l	%o4, %o2, %o4
	.word	0xee460000	! t1_kref+0x3bb8:   	ldsw	[%i0], %l7
	.word	0x8143c000	! t1_kref+0x3bbc:   	stbar
	.word	0x36480002	! t1_kref+0x3bc0:   	bge,a,pt	%icc, _kref+0x3bc8
	.word	0x99b14a33	! t1_kref+0x3bc4:   	fpadd16s	%f5, %f19, %f12
	.word	0xf306600c	! t1_kref+0x3bc8:   	ld	[%i1 + 0xc], %f25
	.word	0x85a18940	! t1_kref+0x3bcc:   	fmuld	%f6, %f0, %f2
	.word	0x81ab0ab4	! t1_kref+0x3bd0:   	fcmpes	%fcc0, %f12, %f20
	.word	0xe7270019	! t1_kref+0x3bd4:   	st	%f19, [%i4 + %i1]
	.word	0xe81e2000	! t1_kref+0x3bd8:   	ldd	[%i0], %l4
	.word	0x9de3bfa0	! t1_kref+0x3bdc:   	save	%sp, -0x60, %sp
	.word	0x8060001d	! t1_kref+0x3be0:   	subc	%g0, %i5, %g0
	.word	0xadee4000	! t1_kref+0x3be4:   	restore	%i1, %g0, %l6
	.word	0xa9332010	! t1_kref+0x3be8:   	srl	%o4, 0x10, %l4
	.word	0x81a8ca22	! t1_kref+0x3bec:   	fcmps	%fcc0, %f3, %f2
	.word	0x8da01917	! t1_kref+0x3bf0:   	fitod	%f23, %f6
	.word	0x2b1bdbdc	! t1_kref+0x3bf4:   	sethi	%hi(0x6f6f7000), %l5
	.word	0x96f5c00d	! t1_kref+0x3bf8:   	udivcc	%l7, %o5, %o3
	.word	0x85a48936	! t1_kref+0x3bfc:   	fmuls	%f18, %f22, %f2
	.word	0xec562000	! t1_kref+0x3c00:   	ldsh	[%i0], %l6
	.word	0xab0e8015	! t1_kref+0x3c04:   	tsubcc	%i2, %l5, %l5
	.word	0x2914e4da	! t1_kref+0x3c08:   	sethi	%hi(0x53936800), %l4
	.word	0xe81e0000	! t1_kref+0x3c0c:   	ldd	[%i0], %l4
	.word	0xe1be5855	! t1_kref+0x3c10:   	stda	%f16, [%i1 + %l5]0xc2
	.word	0xaa828014	! t1_kref+0x3c14:   	addcc	%o2, %l4, %l5
	.word	0xe03e2010	! t1_kref+0x3c18:   	std	%l0, [%i0 + 0x10]
	.word	0x81dcc01b	! t1_kref+0x3c1c:   	flush	%l3 + %i3
	.word	0xc51fbec8	! t1_kref+0x3c20:   	ldd	[%fp - 0x138], %f2
	.word	0xadb3416c	! t1_kref+0x3c24:   	edge32ln	%o5, %o4, %l6
	.word	0xd100a03c	! t1_kref+0x3c28:   	ld	[%g2 + 0x3c], %f8
	.word	0x99b0076a	! t1_kref+0x3c2c:   	fpack16	%f10, %f12
	.word	0xd428a027	! t1_kref+0x3c30:   	stb	%o2, [%g2 + 0x27]
	.word	0xe4086d00	! t1_kref+0x3c34:   	ldub	[%g1 + 0xd00], %l2
	.word	0xa41ca00c	! t1_kref+0x3c38:   	xor	%l2, 0xc, %l2
	.word	0xe4286d00	! t1_kref+0x3c3c:   	stb	%l2, [%g1 + 0xd00]
	.word	0x81d86d00	! t1_kref+0x3c40:   	flush	%g1 + 0xd00
	.word	0xc1be580d	! t1_kref+0x3c44:   	stda	%f0, [%i1 + %o5]0xc0
	.word	0xd67e0000	! t1_kref+0x3c48:   	swap	[%i0], %o3
	.word	0xa5a000d6	! t1_kref+0x3c4c:   	fnegd	%f22, %f18
	.word	0x8db68a90	! t1_kref+0x3c50:   	fpsub16	%f26, %f16, %f6
	.word	0x9fa0052a	! t1_kref+0x3c54:   	fsqrts	%f10, %f15
	.word	0xa5b586ae	! t1_kref+0x3c58:   	fmul8x16al	%f22, %f14, %f18
	.word	0xd830a03c	! t1_kref+0x3c5c:   	sth	%o4, [%g2 + 0x3c]
	.word	0xa1a01050	! t1_kref+0x3c60:   	fdtox	%f16, %f16
	.word	0x98aa400d	! t1_kref+0x3c64:   	andncc	%o1, %o5, %o4
	.word	0xa92a200f	! t1_kref+0x3c68:   	sll	%o0, 0xf, %l4
	.word	0xe3b8a0c0	! t1_kref+0x3c6c:   	stda	%f48, [%g2 + 0xc0]%asi
	.word	0x9732e016	! t1_kref+0x3c70:   	srl	%o3, 0x16, %o3
	.word	0xada01936	! t1_kref+0x3c74:   	fstod	%f22, %f22
	.word	0x97a4c9a4	! t1_kref+0x3c78:   	fdivs	%f19, %f4, %f11
	.word	0x983d6e1d	! t1_kref+0x3c7c:   	xnor	%l5, 0xe1d, %o4
2:	.word	0xea563ff6	! t1_kref+0x3c80:   	ldsh	[%i0 - 0xa], %l5
	.word	0x39800008	! t1_kref+0x3c84:   	fbuge,a	_kref+0x3ca4
	.word	0x81580000	! t1_kref+0x3c88:   	flushw
	.word	0xd640a004	! t1_kref+0x3c8c:   	ldsw	[%g2 + 4], %o3
	.word	0x3f800006	! t1_kref+0x3c90:   	fbo,a	_kref+0x3ca8
	.word	0x8ba000ab	! t1_kref+0x3c94:   	fnegs	%f11, %f5
	.word	0x948d6e99	! t1_kref+0x3c98:   	andcc	%l5, 0xe99, %o2
	.word	0xa67d6699	! t1_kref+0x3c9c:   	sdiv	%l5, 0x699, %l3
	.word	0xc398a100	! t1_kref+0x3ca0:   	ldda	[%g2 + 0x100]%asi, %f32
	.word	0x95abc048	! t1_kref+0x3ca4:   	fmovdo	%fcc0, %f8, %f10
	.word	0xc0760000	! t1_kref+0x3ca8:   	stx	%g0, [%i0]
	.word	0xacd24000	! t1_kref+0x3cac:   	umulcc	%o1, %g0, %l6
	.word	0xc520a014	! t1_kref+0x3cb0:   	st	%f2, [%g2 + 0x14]
	.word	0xf420a034	! t1_kref+0x3cb4:   	st	%i2, [%g2 + 0x34]
	.word	0x81ac0aba	! t1_kref+0x3cb8:   	fcmpes	%fcc0, %f16, %f26
	.word	0xa3a14929	! t1_kref+0x3cbc:   	fmuls	%f5, %f9, %f17
	.word	0x90836f2d	! t1_kref+0x3cc0:   	addcc	%o5, 0xf2d, %o0
	.word	0x94c5800b	! t1_kref+0x3cc4:   	addccc	%l6, %o3, %o2
	.word	0x89a01939	! t1_kref+0x3cc8:   	fstod	%f25, %f4
	.word	0x29800005	! t1_kref+0x3ccc:   	fbl,a	_kref+0x3ce0
	.word	0xe53e3ff8	! t1_kref+0x3cd0:   	std	%f18, [%i0 - 8]
	.word	0x91a2095a	! t1_kref+0x3cd4:   	fmuld	%f8, %f26, %f8
	.word	0x81a88ac0	! t1_kref+0x3cd8:   	fcmped	%fcc0, %f2, %f0
	.word	0xe3b8a0c0	! t1_kref+0x3cdc:   	stda	%f48, [%g2 + 0xc0]%asi
	.word	0x93a01a4a	! t1_kref+0x3ce0:   	fdtoi	%f10, %f9
	.word	0x85b18c4e	! t1_kref+0x3ce4:   	fnor	%f6, %f14, %f2
	.word	0x8143e02d	! t1_kref+0x3ce8:   	membar	0x2d
	.word	0x966231b8	! t1_kref+0x3cec:   	subc	%o0, -0xe48, %o3
	.word	0xe620a024	! t1_kref+0x3cf0:   	st	%l3, [%g2 + 0x24]
	.word	0xe60e3ffe	! t1_kref+0x3cf4:   	ldub	[%i0 - 2], %l3
	.word	0xac05731c	! t1_kref+0x3cf8:   	add	%l5, -0xce4, %l6
	.word	0x81a88ad2	! t1_kref+0x3cfc:   	fcmped	%fcc0, %f2, %f18
	.word	0xabb50200	! t1_kref+0x3d00:   	array8	%l4, %g0, %l5
	.word	0x930a6080	! t1_kref+0x3d04:   	tsubcc	%o1, 0x80, %o1
	.word	0x81834000	! t1_kref+0x3d08:   	wr	%o5, %g0, %y
	.word	0x89a01930	! t1_kref+0x3d0c:   	fstod	%f16, %f4
!	.word	0x3a49f8ba	! t1_kref+0x3d10:   	bcc,a,pt	%icc, SYM(t1_subr0)
	   	bcc,a,pt	%icc, SYM(t1_subr0)
	.word	0x9e006d90	! t1_kref+0x3d14:   	add	%g1, 0xd90, %o7
	.word	0xada01a30	! t1_kref+0x3d18:   	fstoi	%f16, %f22
	.word	0x3f800007	! t1_kref+0x3d1c:   	fbo,a	_kref+0x3d38
	.word	0xec9f5059	! t1_kref+0x3d20:   	ldda	[%i5 + %i1]0x82, %l6
	.word	0xa6fe801b	! t1_kref+0x3d24:   	sdivcc	%i2, %i3, %l3
	.word	0x973ac017	! t1_kref+0x3d28:   	sra	%o3, %l7, %o3
	.word	0x29800001	! t1_kref+0x3d2c:   	fbl,a	_kref+0x3d30
	.word	0x90f2c00b	! t1_kref+0x3d30:   	udivcc	%o3, %o3, %o0
	.word	0x25480005	! t1_kref+0x3d34:   	fblg,a,pt	%fcc0, _kref+0x3d48
	.word	0x9622e681	! t1_kref+0x3d38:   	sub	%o3, 0x681, %o3
	.word	0x9336e016	! t1_kref+0x3d3c:   	srl	%i3, 0x16, %o1
	.word	0xd62e601a	! t1_kref+0x3d40:   	stb	%o3, [%i1 + 0x1a]
	.word	0x2d800008	! t1_kref+0x3d44:   	fbg,a	_kref+0x3d64
	.word	0xd8d6d019	! t1_kref+0x3d48:   	ldsha	[%i3 + %i1]0x80, %o4
	.word	0xaab336bb	! t1_kref+0x3d4c:   	orncc	%o4, -0x945, %l5
	.word	0xa7a0188f	! t1_kref+0x3d50:   	fitos	%f15, %f19
	.word	0xa6054013	! t1_kref+0x3d54:   	add	%l5, %l3, %l3
	.word	0xafb40586	! t1_kref+0x3d58:   	fcmpgt32	%f16, %f6, %l7
	.word	0x3f800004	! t1_kref+0x3d5c:   	fbo,a	_kref+0x3d6c
	.word	0xad35e009	! t1_kref+0x3d60:   	srl	%l7, 0x9, %l6
	.word	0x81b00cd2	! t1_kref+0x3d64:   	fnot2	%f18, %f0
	.word	0x89a009c6	! t1_kref+0x3d68:   	fdivd	%f0, %f6, %f4
	.word	0x91b280d6	! t1_kref+0x3d6c:   	edge16l	%o2, %l6, %o0
	.word	0xaec5801a	! t1_kref+0x3d70:   	addccc	%l6, %i2, %l7
	.word	0xd83e4000	! t1_kref+0x3d74:   	std	%o4, [%i1]
	.word	0x85a01898	! t1_kref+0x3d78:   	fitos	%f24, %f2
	.word	0x91326012	! t1_kref+0x3d7c:   	srl	%o1, 0x12, %o0
	.word	0x94a325ac	! t1_kref+0x3d80:   	subcc	%o4, 0x5ac, %o2
	.word	0x9462be84	! t1_kref+0x3d84:   	subc	%o2, -0x17c, %o2
	.word	0x90beb104	! t1_kref+0x3d88:   	xnorcc	%i2, -0xefc, %o0
	.word	0xaabcf03b	! t1_kref+0x3d8c:   	xnorcc	%l3, -0xfc5, %l5
	.word	0x9ba209ae	! t1_kref+0x3d90:   	fdivs	%f8, %f14, %f13
	.word	0x922a7aa0	! t1_kref+0x3d94:   	andn	%o1, -0x560, %o1
	.word	0xd4080019	! t1_kref+0x3d98:   	ldub	[%g0 + %i1], %o2
	.word	0xe47f0018	! t1_kref+0x3d9c:   	swap	[%i4 + %i0], %l2
	.word	0x8143c000	! t1_kref+0x3da0:   	stbar
	.word	0xe11fbdf0	! t1_kref+0x3da4:   	ldd	[%fp - 0x210], %f16
	.word	0x987b6794	! t1_kref+0x3da8:   	sdiv	%o5, 0x794, %o4
	.word	0xe820a02c	! t1_kref+0x3dac:   	st	%l4, [%g2 + 0x2c]
	.word	0xabb20174	! t1_kref+0x3db0:   	edge32ln	%o0, %l4, %l5
	.word	0xec3e6010	! t1_kref+0x3db4:   	std	%l6, [%i1 + 0x10]
	.word	0x86102001	! t1_kref+0x3db8:   	mov	0x1, %g3
	.word	0x32800000	! t1_kref+0x3dbc:   	bne,a	_kref+0x3dbc
	.word	0x86a0e001	! t1_kref+0x3dc0:   	subcc	%g3, 1, %g3
	.word	0xa6de8008	! t1_kref+0x3dc4:   	smulcc	%i2, %o0, %l3
	.word	0xafb50000	! t1_kref+0x3dc8:   	edge8	%l4, %g0, %l7
	.word	0xae30000c	! t1_kref+0x3dcc:   	orn	%g0, %o4, %l7
	.word	0xdd266010	! t1_kref+0x3dd0:   	st	%f14, [%i1 + 0x10]
	.word	0xaa26c00d	! t1_kref+0x3dd4:   	sub	%i3, %o5, %l5
	.word	0x81aa8ad6	! t1_kref+0x3dd8:   	fcmped	%fcc0, %f10, %f22
	call	SYM(t1_subr3)
	.word	0xd00e3ff4	! t1_kref+0x3de0:   	ldub	[%i0 - 0xc], %o0
	.word	0xb5b187c4	! t1_kref+0x3de4:   	pdist	%f6, %f4, %f26
	.word	0xf43e3ff0	! t1_kref+0x3de8:   	std	%i2, [%i0 - 0x10]
	.word	0xb1a009ce	! t1_kref+0x3dec:   	fdivd	%f0, %f14, %f24
	.word	0x8da38834	! t1_kref+0x3df0:   	fadds	%f14, %f20, %f6
	.word	0xb5a18958	! t1_kref+0x3df4:   	fmuld	%f6, %f24, %f26
	.word	0xd60e2013	! t1_kref+0x3df8:   	ldub	[%i0 + 0x13], %o3
	.word	0x99a01a52	! t1_kref+0x3dfc:   	fdtoi	%f18, %f12
	.word	0xd2100019	! t1_kref+0x3e00:   	lduh	[%g0 + %i1], %o1
	.word	0xe830a014	! t1_kref+0x3e04:   	sth	%l4, [%g2 + 0x14]
	.word	0x81aa4a39	! t1_kref+0x3e08:   	fcmps	%fcc0, %f9, %f25
	.word	0x8610201c	! t1_kref+0x3e0c:   	mov	0x1c, %g3
	.word	0x86a0e001	! t1_kref+0x3e10:   	subcc	%g3, 1, %g3
	.word	0x22800007	! t1_kref+0x3e14:   	be,a	_kref+0x3e30
	.word	0xa1a349ae	! t1_kref+0x3e18:   	fdivs	%f13, %f14, %f16
	.word	0xae9dba10	! t1_kref+0x3e1c:   	xorcc	%l6, -0x5f0, %l7
	.word	0x9da01a40	! t1_kref+0x3e20:   	fdtoi	%f0, %f14
	.word	0xb1a48d2e	! t1_kref+0x3e24:   	fsmuld	%f18, %f14, %f24
	.word	0x87b24ae5	! t1_kref+0x3e28:   	fpsub32s	%f9, %f5, %f3
	.word	0xa6c0001b	! t1_kref+0x3e2c:   	addccc	%g0, %i3, %l3
	.word	0xada0004e	! t1_kref+0x3e30:   	fmovd	%f14, %f22
	.word	0x96a20000	! t1_kref+0x3e34:   	subcc	%o0, %g0, %o3
	.word	0x34480008	! t1_kref+0x3e38:   	bg,a,pt	%icc, _kref+0x3e58
	.word	0x8143c000	! t1_kref+0x3e3c:   	stbar
	.word	0x38800002	! t1_kref+0x3e40:   	bgu,a	_kref+0x3e48
	.word	0xe43e6008	! t1_kref+0x3e44:   	std	%l2, [%i1 + 8]
	.word	0xae7dea46	! t1_kref+0x3e48:   	sdiv	%l7, 0xa46, %l7
	.word	0x25800008	! t1_kref+0x3e4c:   	fblg,a	_kref+0x3e6c
	.word	0x9ba01a28	! t1_kref+0x3e50:   	fstoi	%f8, %f13
	.word	0x98fee6db	! t1_kref+0x3e54:   	sdivcc	%i3, 0x6db, %o4
	.word	0xecd01018	! t1_kref+0x3e58:   	ldsha	[%g0 + %i0]0x80, %l6
	.word	0xb1a01908	! t1_kref+0x3e5c:   	fitod	%f8, %f24
	.word	0x9112ff44	! t1_kref+0x3e60:   	taddcctv	%o3, -0xbc, %o0
	.word	0x9004c01a	! t1_kref+0x3e64:   	add	%l3, %i2, %o0
	.word	0xac3cc014	! t1_kref+0x3e68:   	xnor	%l3, %l4, %l6
	.word	0xac32b802	! t1_kref+0x3e6c:   	orn	%o2, -0x7fe, %l6
	.word	0x93a01890	! t1_kref+0x3e70:   	fitos	%f16, %f9
	.word	0xadb306f0	! t1_kref+0x3e74:   	fmul8ulx16	%f12, %f16, %f22
	.word	0xa5a01a54	! t1_kref+0x3e78:   	fdtoi	%f20, %f18
	.word	0x32480002	! t1_kref+0x3e7c:   	bne,a,pt	%icc, _kref+0x3e84
	.word	0xada01a44	! t1_kref+0x3e80:   	fdtoi	%f4, %f22
	.word	0xea20a02c	! t1_kref+0x3e84:   	st	%l5, [%g2 + 0x2c]
	.word	0xaef28015	! t1_kref+0x3e88:   	udivcc	%o2, %l5, %l7
	.word	0xd9be581a	! t1_kref+0x3e8c:   	stda	%f12, [%i1 + %i2]0xc0
	.word	0x81ad0a48	! t1_kref+0x3e90:   	fcmpd	%fcc0, %f20, %f8
	.word	0xabb24356	! t1_kref+0x3e94:   	alignaddrl	%o1, %l6, %l5
	.word	0xd27e7fec	! t1_kref+0x3e98:   	swap	[%i1 - 0x14], %o1
	.word	0x99a509d4	! t1_kref+0x3e9c:   	fdivd	%f20, %f20, %f12
	.word	0xea28a027	! t1_kref+0x3ea0:   	stb	%l5, [%g2 + 0x27]
	.word	0x86102002	! t1_kref+0x3ea4:   	mov	0x2, %g3
	.word	0x32800000	! t1_kref+0x3ea8:   	bne,a	_kref+0x3ea8
	.word	0x86a0e001	! t1_kref+0x3eac:   	subcc	%g3, 1, %g3
	.word	0x95a208c6	! t1_kref+0x3eb0:   	fsubd	%f8, %f6, %f10
	.word	0xaa2ac00a	! t1_kref+0x3eb4:   	andn	%o3, %o2, %l5
	.word	0x95358008	! t1_kref+0x3eb8:   	srl	%l6, %o0, %o2
	.word	0xac1b4000	! t1_kref+0x3ebc:   	xor	%o5, %g0, %l6
	.word	0xacae8017	! t1_kref+0x3ec0:   	andncc	%i2, %l7, %l6
	.word	0xdd3e7ff8	! t1_kref+0x3ec4:   	std	%f14, [%i1 - 8]
	.word	0x85a10842	! t1_kref+0x3ec8:   	faddd	%f4, %f2, %f2
	.word	0x95b58ac2	! t1_kref+0x3ecc:   	fpsub32	%f22, %f2, %f10
	.word	0x86102020	! t1_kref+0x3ed0:   	mov	0x20, %g3
	.word	0x86a0e001	! t1_kref+0x3ed4:   	subcc	%g3, 1, %g3
	.word	0x2280001e	! t1_kref+0x3ed8:   	be,a	_kref+0x3f50
	.word	0x9635801b	! t1_kref+0x3edc:   	orn	%l6, %i3, %o3
	.word	0x9636800a	! t1_kref+0x3ee0:   	orn	%i2, %o2, %o3
	.word	0x264ffffc	! t1_kref+0x3ee4:   	bl,a,pt	%icc, _kref+0x3ed4
	.word	0xadb6472d	! t1_kref+0x3ee8:   	fmuld8ulx16	%f25, %f13, %f22
	.word	0x81ab4a31	! t1_kref+0x3eec:   	fcmps	%fcc0, %f13, %f17
	.word	0xe968a04f	! t1_kref+0x3ef0:   	prefetch	%g2 + 0x4f, 20
	.word	0xa1a58840	! t1_kref+0x3ef4:   	faddd	%f22, %f0, %f16
	.word	0x9da01891	! t1_kref+0x3ef8:   	fitos	%f17, %f14
	.word	0xea774019	! t1_kref+0x3efc:   	stx	%l5, [%i5 + %i1]
	.word	0xaad530fc	! t1_kref+0x3f00:   	umulcc	%l4, -0xf04, %l5
	.word	0x28480001	! t1_kref+0x3f04:   	bleu,a,pt	%icc, _kref+0x3f08
	.word	0xec1e7ff0	! t1_kref+0x3f08:   	ldd	[%i1 - 0x10], %l6
	.word	0x91b20667	! t1_kref+0x3f0c:   	fmul8x16au	%f8, %f7, %f8
	.word	0x993aa014	! t1_kref+0x3f10:   	sra	%o2, 0x14, %o4
	.word	0xe6163fe4	! t1_kref+0x3f14:   	lduh	[%i0 - 0x1c], %l3
	.word	0xec28a03c	! t1_kref+0x3f18:   	stb	%l6, [%g2 + 0x3c]
	.word	0x9ba0002e	! t1_kref+0x3f1c:   	fmovs	%f14, %f13
	.word	0x99b285c2	! t1_kref+0x3f20:   	fcmpeq32	%f10, %f2, %o4
	.word	0xe6080019	! t1_kref+0x3f24:   	ldub	[%g0 + %i1], %l3
	.word	0xd3270019	! t1_kref+0x3f28:   	st	%f9, [%i4 + %i1]
	.word	0xb1a4c9b6	! t1_kref+0x3f2c:   	fdivs	%f19, %f22, %f24
	.word	0x9465f7e9	! t1_kref+0x3f30:   	subc	%l7, -0x817, %o2
	.word	0x85a30944	! t1_kref+0x3f34:   	fmuld	%f12, %f4, %f2
	.word	0x95b00f16	! t1_kref+0x3f38:   	fsrc2	%f22, %f10
	.word	0x89b107d0	! t1_kref+0x3f3c:   	pdist	%f4, %f16, %f4
	.word	0xb1b10e80	! t1_kref+0x3f40:   	fsrc1	%f4, %f24
	.word	0xa8a5e6e5	! t1_kref+0x3f44:   	subcc	%l7, 0x6e5, %l4
	.word	0xd2080019	! t1_kref+0x3f48:   	ldub	[%g0 + %i1], %o1
	.word	0x8fb40e62	! t1_kref+0x3f4c:   	fxnors	%f16, %f2, %f7
	.word	0xe3b8a0c0	! t1_kref+0x3f50:   	stda	%f48, [%g2 + 0xc0]%asi
	.word	0x92a2221b	! t1_kref+0x3f54:   	subcc	%o0, 0x21b, %o1
	.word	0x3a480006	! t1_kref+0x3f58:   	bcc,a,pt	%icc, _kref+0x3f70
	.word	0x91b2c739	! t1_kref+0x3f5c:   	fmuld8ulx16	%f11, %f25, %f8
	.word	0x8583400c	! t1_kref+0x3f60:   	wr	%o5, %o4, %ccr
	.word	0xd4263ffc	! t1_kref+0x3f64:   	st	%o2, [%i0 - 4]
	.word	0x9632f1e8	! t1_kref+0x3f68:   	orn	%o3, -0xe18, %o3
	.word	0xa6a32c80	! t1_kref+0x3f6c:   	subcc	%o4, 0xc80, %l3
	.word	0xd47f0019	! t1_kref+0x3f70:   	swap	[%i4 + %i1], %o2
	.word	0x9136e010	! t1_kref+0x3f74:   	srl	%i3, 0x10, %o0
	.word	0x9522b332	! t1_kref+0x3f78:   	mulscc	%o2, -0xcce, %o2
	.word	0xb5b307d2	! t1_kref+0x3f7c:   	pdist	%f12, %f18, %f26
	.word	0x38480005	! t1_kref+0x3f80:   	bgu,a,pt	%icc, _kref+0x3f94
	.word	0xee2e200a	! t1_kref+0x3f84:   	stb	%l7, [%i0 + 0xa]
	.word	0xb3a00022	! t1_kref+0x3f88:   	fmovs	%f2, %f25
	.word	0x9db00cee	! t1_kref+0x3f8c:   	fnot2s	%f14, %f14
	.word	0xe43e401d	! t1_kref+0x3f90:   	std	%l2, [%i1 + %i5]
	.word	0x98dd6636	! t1_kref+0x3f94:   	smulcc	%l5, 0x636, %o4
	.word	0x97b20055	! t1_kref+0x3f98:   	edge8l	%o0, %l5, %o3
	.word	0xa7b2c353	! t1_kref+0x3f9c:   	alignaddrl	%o3, %l3, %l3
	.word	0xaba00521	! t1_kref+0x3fa0:   	fsqrts	%f1, %f21
	.word	0x94037246	! t1_kref+0x3fa4:   	add	%o5, -0xdba, %o2
	.word	0xe500a024	! t1_kref+0x3fa8:   	ld	[%g2 + 0x24], %f18
	.word	0x25800007	! t1_kref+0x3fac:   	fblg,a	_kref+0x3fc8
	.word	0x90fa0014	! t1_kref+0x3fb0:   	sdivcc	%o0, %l4, %o0
	.word	0xb3b40a2e	! t1_kref+0x3fb4:   	fpadd16s	%f16, %f14, %f25
	.word	0x95b30cb6	! t1_kref+0x3fb8:   	fandnot2s	%f12, %f22, %f10
	.word	0x89a2895a	! t1_kref+0x3fbc:   	fmuld	%f10, %f26, %f4
	.word	0xac9d000a	! t1_kref+0x3fc0:   	xorcc	%l4, %o2, %l6
	.word	0xc3260000	! t1_kref+0x3fc4:   	st	%f1, [%i0]
	.word	0xafb40500	! t1_kref+0x3fc8:   	fcmpgt16	%f16, %f0, %l7
	.word	0xae43400a	! t1_kref+0x3fcc:   	addc	%o5, %o2, %l7
	.word	0x81830000	! t1_kref+0x3fd0:   	wr	%o4, %g0, %y
	.word	0xa8858009	! t1_kref+0x3fd4:   	addcc	%l6, %o1, %l4
	.word	0x81ad4a25	! t1_kref+0x3fd8:   	fcmps	%fcc0, %f21, %f5
	.word	0xada409ce	! t1_kref+0x3fdc:   	fdivd	%f16, %f14, %f22
	.word	0x81ad8a39	! t1_kref+0x3fe0:   	fcmps	%fcc0, %f22, %f25
	.word	0xaa1db0b9	! t1_kref+0x3fe4:   	xor	%l6, -0xf47, %l5
	.word	0xaf26c016	! t1_kref+0x3fe8:   	mulscc	%i3, %l6, %l7
	.word	0x91a80058	! t1_kref+0x3fec:   	fmovdn	%fcc0, %f24, %f8
	.word	0x93408000	! t1_kref+0x3ff0:   	mov	%ccr, %o1
	.word	0xa9b38d38	! t1_kref+0x3ff4:   	fandnot1s	%f14, %f24, %f20
	.word	0xf3ee501b	! t1_kref+0x3ff8:   	prefetcha	%i1 + %i3, 25
	.word	0xe86e7ff6	! t1_kref+0x3ffc:   	ldstub	[%i1 - 0xa], %l4
	.word	0x9635c01b	! t1_kref+0x4000:   	orn	%l7, %i3, %o3
	.word	0xa5a01084	! t1_kref+0x4004:   	fxtos	%f4, %f18
	.word	0xa6f5c00d	! t1_kref+0x4008:   	udivcc	%l7, %o5, %l3
	.word	0xaeb5738d	! t1_kref+0x400c:   	orncc	%l5, -0xc73, %l7
	.word	0xa734e011	! t1_kref+0x4010:   	srl	%l3, 0x11, %l3
	.word	0x31800002	! t1_kref+0x4014:   	fba,a	_kref+0x401c
	.word	0xd0264000	! t1_kref+0x4018:   	st	%o0, [%i1]
	.word	0x96fda6e3	! t1_kref+0x401c:   	sdivcc	%l6, 0x6e3, %o3
	.word	0x90650014	! t1_kref+0x4020:   	subc	%l4, %l4, %o0
	.word	0x35800002	! t1_kref+0x4024:   	fbue,a	_kref+0x402c
	.word	0xae36a4a3	! t1_kref+0x4028:   	orn	%i2, 0x4a3, %l7
	.word	0xec961000	! t1_kref+0x402c:   	lduha	[%i0]0x80, %l6
	.word	0xf420a03c	! t1_kref+0x4030:   	st	%i2, [%g2 + 0x3c]
	.word	0x34800008	! t1_kref+0x4034:   	bg,a	_kref+0x4054
	.word	0xeb68a0cd	! t1_kref+0x4038:   	prefetch	%g2 + 0xcd, 21
	.word	0xafb5c114	! t1_kref+0x403c:   	edge32	%l7, %l4, %l7
	.word	0xd278a00c	! t1_kref+0x4040:   	swap	[%g2 + 0xc], %o1
	.word	0xe19e101d	! t1_kref+0x4044:   	ldda	[%i0 + %i5]0x80, %f16
	.word	0xe1be5a5d	! t1_kref+0x4048:   	stda	%f16, [%i1 + %i5]0xd2
	.word	0x81ac0a5a	! t1_kref+0x404c:   	fcmpd	%fcc0, %f16, %f26
	.word	0xacacc00d	! t1_kref+0x4050:   	andncc	%l3, %o5, %l6
	.word	0xa8aab3ce	! t1_kref+0x4054:   	andncc	%o2, -0xc32, %l4
	.word	0xd4463fe4	! t1_kref+0x4058:   	ldsw	[%i0 - 0x1c], %o2
	.word	0x2c480006	! t1_kref+0x405c:   	bneg,a,pt	%icc, _kref+0x4074
	.word	0x81a109d8	! t1_kref+0x4060:   	fdivd	%f4, %f24, %f0
	.word	0x2d800007	! t1_kref+0x4064:   	fbg,a	_kref+0x4080
	.word	0xe6160000	! t1_kref+0x4068:   	lduh	[%i0], %l3
	.word	0x92a26fcc	! t1_kref+0x406c:   	subcc	%o1, 0xfcc, %o1
	.word	0x95a018ce	! t1_kref+0x4070:   	fdtos	%f14, %f10
	.word	0x89b00f18	! t1_kref+0x4074:   	fsrc2	%f24, %f4
	.word	0x38800001	! t1_kref+0x4078:   	bgu,a	_kref+0x407c
	.word	0xe868a03d	! t1_kref+0x407c:   	ldstub	[%g2 + 0x3d], %l4
	.word	0x99a60832	! t1_kref+0x4080:   	fadds	%f24, %f18, %f12
	.word	0x37800008	! t1_kref+0x4084:   	fbge,a	_kref+0x40a4
	.word	0xad0a2553	! t1_kref+0x4088:   	tsubcc	%o0, 0x553, %l6
	.word	0xaa96ba26	! t1_kref+0x408c:   	orcc	%i2, -0x5da, %l5
	.word	0x9ba20826	! t1_kref+0x4090:   	fadds	%f8, %f6, %f13
	.word	0xa652bf02	! t1_kref+0x4094:   	umul	%o2, -0xfe, %l3
	.word	0xda200019	! t1_kref+0x4098:   	st	%o5, [%g0 + %i1]
	.word	0xd9267fe0	! t1_kref+0x409c:   	st	%f12, [%i1 - 0x20]
	.word	0xea30a024	! t1_kref+0x40a0:   	sth	%l5, [%g2 + 0x24]
	.word	0x969d000d	! t1_kref+0x40a4:   	xorcc	%l4, %o5, %o3
	.word	0x95b285cc	! t1_kref+0x40a8:   	fcmpeq32	%f10, %f12, %o2
	.word	0x26480003	! t1_kref+0x40ac:   	bl,a,pt	%icc, _kref+0x40b8
	.word	0xba103ff8	! t1_kref+0x40b0:   	mov	0xfffffff8, %i5
	.word	0x27800002	! t1_kref+0x40b4:   	fbul,a	_kref+0x40bc
	.word	0xada0190e	! t1_kref+0x40b8:   	fitod	%f14, %f22
	.word	0xd67e401c	! t1_kref+0x40bc:   	swap	[%i1 + %i4], %o3
	.word	0x9682ad75	! t1_kref+0x40c0:   	addcc	%o2, 0xd75, %o3
	.word	0x9f414000	! t1_kref+0x40c4:   	mov	%pc, %o7
!	.word	0x358b27c5	! t1_kref+0x40c8:   	fbue,a	SYM(t1_subr3)
	   	fbue,a	SYM(t1_subr3)
	.word	0x9246a994	! t1_kref+0x40cc:   	addc	%i2, 0x994, %o1
	.word	0xadb5834d	! t1_kref+0x40d0:   	alignaddrl	%l6, %o5, %l6
	.word	0xc9bf1a59	! t1_kref+0x40d4:   	stda	%f4, [%i4 + %i1]0xd2
	.word	0xdaee101a	! t1_kref+0x40d8:   	ldstuba	[%i0 + %i2]0x80, %o5
	.word	0x91a01a58	! t1_kref+0x40dc:   	fdtoi	%f24, %f8
	.word	0xa5b38758	! t1_kref+0x40e0:   	fpack32	%f14, %f24, %f18
	.word	0xa9a588c2	! t1_kref+0x40e4:   	fsubd	%f22, %f2, %f20
	.word	0xc93f4018	! t1_kref+0x40e8:   	std	%f4, [%i5 + %i0]
	.word	0xeae81019	! t1_kref+0x40ec:   	ldstuba	[%g0 + %i1]0x80, %l5
	.word	0xee562014	! t1_kref+0x40f0:   	ldsh	[%i0 + 0x14], %l7
	.word	0xa8f6f1a1	! t1_kref+0x40f4:   	udivcc	%i3, -0xe5f, %l4
	.word	0xc5070018	! t1_kref+0x40f8:   	ld	[%i4 + %i0], %f2
	.word	0x9f414000	! t1_kref+0x40fc:   	mov	%pc, %o7
	.word	0x89a34939	! t1_kref+0x4100:   	fmuls	%f13, %f25, %f4
	.word	0x90b6e5dc	! t1_kref+0x4104:   	orncc	%i3, 0x5dc, %o0
	.word	0xd9063fe8	! t1_kref+0x4108:   	ld	[%i0 - 0x18], %f12
	.word	0xd11fbc80	! t1_kref+0x410c:   	ldd	[%fp - 0x380], %f8
	.word	0x91a109c6	! t1_kref+0x4110:   	fdivd	%f4, %f6, %f8
	.word	0x86102003	! t1_kref+0x4114:   	mov	0x3, %g3
	.word	0x32800000	! t1_kref+0x4118:   	bne,a	_kref+0x4118
	.word	0x86a0e001	! t1_kref+0x411c:   	subcc	%g3, 1, %g3
	.word	0xd9260000	! t1_kref+0x4120:   	st	%f12, [%i0]
	.word	0xe8563ff6	! t1_kref+0x4124:   	ldsh	[%i0 - 0xa], %l4
	.word	0xf1062000	! t1_kref+0x4128:   	ld	[%i0], %f24
	.word	0xab2e801a	! t1_kref+0x412c:   	sll	%i2, %i2, %l5
	.word	0xaaa6c013	! t1_kref+0x4130:   	subcc	%i3, %l3, %l5
	.word	0xa5b00c00	! t1_kref+0x4134:   	fzero	%f18
	.word	0x90b57289	! t1_kref+0x4138:   	orncc	%l5, -0xd77, %o0
	.word	0x9682400b	! t1_kref+0x413c:   	addcc	%o1, %o3, %o3
	.word	0xacfdb6d3	! t1_kref+0x4140:   	sdivcc	%l6, -0x92d, %l6
	.word	0x32800006	! t1_kref+0x4144:   	bne,a	_kref+0x415c
	.word	0xea28a024	! t1_kref+0x4148:   	stb	%l5, [%g2 + 0x24]
	.word	0xaea225b5	! t1_kref+0x414c:   	subcc	%o0, 0x5b5, %l7
	.word	0xd07e401c	! t1_kref+0x4150:   	swap	[%i1 + %i4], %o0
	.word	0xe7070019	! t1_kref+0x4154:   	ld	[%i4 + %i1], %f19
	.word	0xa8437138	! t1_kref+0x4158:   	addc	%o5, -0xec8, %l4
	.word	0xa6182dd6	! t1_kref+0x415c:   	xor	%g0, 0xdd6, %l3
	.word	0xee500018	! t1_kref+0x4160:   	ldsh	[%g0 + %i0], %l7
	.word	0xa6fd2e46	! t1_kref+0x4164:   	sdivcc	%l4, 0xe46, %l3
	.word	0x91b50e80	! t1_kref+0x4168:   	fsrc1	%f20, %f8
	.word	0xd0f6501d	! t1_kref+0x416c:   	stxa	%o0, [%i1 + %i5]0x80
	.word	0xc9bf1a59	! t1_kref+0x4170:   	stda	%f4, [%i4 + %i1]0xd2
	.word	0xa9b64f6f	! t1_kref+0x4174:   	fornot1s	%f25, %f15, %f20
	.word	0xa1a01885	! t1_kref+0x4178:   	fitos	%f5, %f16
	.word	0xb1a01938	! t1_kref+0x417c:   	fstod	%f24, %f24
	.word	0xd60e6009	! t1_kref+0x4180:   	ldub	[%i1 + 9], %o3
	.word	0xae983bd2	! t1_kref+0x4184:   	xorcc	%g0, -0x42e, %l7
	.word	0x92e50014	! t1_kref+0x4188:   	subccc	%l4, %l4, %o1
	.word	0xd6567fe8	! t1_kref+0x418c:   	ldsh	[%i1 - 0x18], %o3
	.word	0x99a189ae	! t1_kref+0x4190:   	fdivs	%f6, %f14, %f12
	.word	0xb1a01934	! t1_kref+0x4194:   	fstod	%f20, %f24
	.word	0x3f800002	! t1_kref+0x4198:   	fbo,a	_kref+0x41a0
	.word	0x981d2baf	! t1_kref+0x419c:   	xor	%l4, 0xbaf, %o4
	.word	0xa5aac058	! t1_kref+0x41a0:   	fmovdge	%fcc0, %f24, %f18
	.word	0xe03e7fe8	! t1_kref+0x41a4:   	std	%l0, [%i1 - 0x18]
	.word	0xa875800d	! t1_kref+0x41a8:   	udiv	%l6, %o5, %l4
	call	SYM(t1_subr0)
	.word	0xa1b58ac4	! t1_kref+0x41b0:   	fpsub32	%f22, %f4, %f16
	.word	0xac3a0016	! t1_kref+0x41b4:   	xnor	%o0, %l6, %l6
	.word	0x39800005	! t1_kref+0x41b8:   	fbuge,a	_kref+0x41cc
	.word	0xa73a400c	! t1_kref+0x41bc:   	sra	%o1, %o4, %l3
	.word	0x8da01021	! t1_kref+0x41c0:   	fstox	%f1, %f6
	.word	0x9722800d	! t1_kref+0x41c4:   	mulscc	%o2, %o5, %o3
	.word	0xe3b8a0c0	! t1_kref+0x41c8:   	stda	%f48, [%g2 + 0xc0]%asi
	.word	0x9da509ce	! t1_kref+0x41cc:   	fdivd	%f20, %f14, %f14
	.word	0x9fc10000	! t1_kref+0x41d0:   	call	%g4
	.word	0x98234008	! t1_kref+0x41d4:   	sub	%o5, %o0, %o4
	.word	0xa1a0190b	! t1_kref+0x41d8:   	fitod	%f11, %f16
	.word	0xc768a04c	! t1_kref+0x41dc:   	prefetch	%g2 + 0x4c, 3
	.word	0xb3b00f2d	! t1_kref+0x41e0:   	fsrc2s	%f13, %f25
	.word	0xe3b8a0c0	! t1_kref+0x41e4:   	stda	%f48, [%g2 + 0xc0]%asi
	.word	0x90858008	! t1_kref+0x41e8:   	addcc	%l6, %o0, %o0
	.word	0xe3267ffc	! t1_kref+0x41ec:   	st	%f17, [%i1 - 4]
	.word	0x81ab0a2f	! t1_kref+0x41f0:   	fcmps	%fcc0, %f12, %f15
	.word	0x81854000	! t1_kref+0x41f4:   	wr	%l5, %g0, %y
	.word	0x81ab8acc	! t1_kref+0x41f8:   	fcmped	%fcc0, %f14, %f12
	.word	0xa5a01927	! t1_kref+0x41fc:   	fstod	%f7, %f18
	.word	0x92f37c6f	! t1_kref+0x4200:   	udivcc	%o5, -0x391, %o1
	.word	0x81ae8acc	! t1_kref+0x4204:   	fcmped	%fcc0, %f26, %f12
	.word	0xcb060000	! t1_kref+0x4208:   	ld	[%i0], %f5
	.word	0x33800001	! t1_kref+0x420c:   	fbe,a	_kref+0x4210
	.word	0x9465c000	! t1_kref+0x4210:   	subc	%l7, %g0, %o2
	.word	0x89b14eec	! t1_kref+0x4214:   	fornot2s	%f5, %f12, %f4
	.word	0x8143c000	! t1_kref+0x4218:   	stbar
	.word	0xd3064000	! t1_kref+0x421c:   	ld	[%i1], %f9
	.word	0xada01909	! t1_kref+0x4220:   	fitod	%f9, %f22
	.word	0x96832f3a	! t1_kref+0x4224:   	addcc	%o4, 0xf3a, %o3
	.word	0x92628000	! t1_kref+0x4228:   	subc	%o2, %g0, %o1
	.word	0xa6ad730d	! t1_kref+0x422c:   	andncc	%l5, -0xcf3, %l3
	.word	0x81ab0a37	! t1_kref+0x4230:   	fcmps	%fcc0, %f12, %f23
	.word	0xf4b6501b	! t1_kref+0x4234:   	stha	%i2, [%i1 + %i3]0x80
	.word	0xadb2cdab	! t1_kref+0x4238:   	fxors	%f11, %f11, %f22
	.word	0x8da01a4c	! t1_kref+0x423c:   	fdtoi	%f12, %f6
	.word	0xe3b8a0c0	! t1_kref+0x4240:   	stda	%f48, [%g2 + 0xc0]%asi
	.word	0xa7b384ce	! t1_kref+0x4244:   	fcmpne32	%f14, %f14, %l3
	.word	0x81aa0a4c	! t1_kref+0x4248:   	fcmpd	%fcc0, %f8, %f12
	.word	0xa8ab0015	! t1_kref+0x424c:   	andncc	%o4, %l5, %l4
	.word	0x90c5400a	! t1_kref+0x4250:   	addccc	%l5, %o2, %o0
	.word	0x81aa8a2b	! t1_kref+0x4254:   	fcmps	%fcc0, %f10, %f11
	.word	0x99253470	! t1_kref+0x4258:   	mulscc	%l4, -0xb90, %o4
	.word	0x86102012	! t1_kref+0x425c:   	mov	0x12, %g3
	.word	0x86a0e001	! t1_kref+0x4260:   	subcc	%g3, 1, %g3
	.word	0x22800015	! t1_kref+0x4264:   	be,a	_kref+0x42b8
	.word	0xae3a801a	! t1_kref+0x4268:   	xnor	%o2, %i2, %l7
	.word	0x81ad0a37	! t1_kref+0x426c:   	fcmps	%fcc0, %f20, %f23
	.word	0x92f6c000	! t1_kref+0x4270:   	udivcc	%i3, %g0, %o1
	.word	0xafa0052d	! t1_kref+0x4274:   	fsqrts	%f13, %f23
	.word	0x20800008	! t1_kref+0x4278:   	bn,a	_kref+0x4298
	.word	0xaa9b4017	! t1_kref+0x427c:   	xorcc	%o5, %l7, %l5
	.word	0x94e6bee9	! t1_kref+0x4280:   	subccc	%i2, -0x117, %o2
	.word	0xd51e6010	! t1_kref+0x4284:   	ldd	[%i1 + 0x10], %f10
	.word	0xe6780019	! t1_kref+0x4288:   	swap	[%g0 + %i1], %l3
	.word	0x9246e375	! t1_kref+0x428c:   	addc	%i3, 0x375, %o1
	.word	0xe87e3fe0	! t1_kref+0x4290:   	swap	[%i0 - 0x20], %l4
	.word	0x953d001a	! t1_kref+0x4294:   	sra	%l4, %i2, %o2
	.word	0x85a000b6	! t1_kref+0x4298:   	fnegs	%f22, %f2
	.word	0xaa1a0015	! t1_kref+0x429c:   	xor	%o0, %l5, %l5
	.word	0x81a508d0	! t1_kref+0x42a0:   	fsubd	%f20, %f16, %f0
	.word	0xafb30482	! t1_kref+0x42a4:   	fcmple32	%f12, %f2, %l7
	.word	0x3abfffee	! t1_kref+0x42a8:   	bcc,a	_kref+0x4260
	.word	0xadb285d4	! t1_kref+0x42ac:   	fcmpeq32	%f10, %f20, %l6
	.word	0xc398a100	! t1_kref+0x42b0:   	ldda	[%g2 + 0x100]%asi, %f32
	.word	0xa7a0052b	! t1_kref+0x42b4:   	fsqrts	%f11, %f19
	.word	0x99b40986	! t1_kref+0x42b8:   	bshuffle	%f16, %f6, %f12
	.word	0xc398a100	! t1_kref+0x42bc:   	ldda	[%g2 + 0x100]%asi, %f32
	.word	0xb1b00cd4	! t1_kref+0x42c0:   	fnot2	%f20, %f24
	.word	0x2e800007	! t1_kref+0x42c4:   	bvs,a	_kref+0x42e0
	.word	0x96fd38ae	! t1_kref+0x42c8:   	sdivcc	%l4, -0x752, %o3
	.word	0x8db08758	! t1_kref+0x42cc:   	fpack32	%f2, %f24, %f6
	.word	0xb5a0190f	! t1_kref+0x42d0:   	fitod	%f15, %f26
	.word	0xab32a00f	! t1_kref+0x42d4:   	srl	%o2, 0xf, %l5
	.word	0x81ac4a31	! t1_kref+0x42d8:   	fcmps	%fcc0, %f17, %f17
	.word	0xda266008	! t1_kref+0x42dc:   	st	%o5, [%i1 + 8]
	.word	0xa1a609d8	! t1_kref+0x42e0:   	fdivd	%f24, %f24, %f16
	.word	0xa8b5793c	! t1_kref+0x42e4:   	orncc	%l5, -0x6c4, %l4
	.word	0x81858000	! t1_kref+0x42e8:   	wr	%l6, %g0, %y
	.word	0x28480005	! t1_kref+0x42ec:   	bleu,a,pt	%icc, _kref+0x4300
	.word	0xd9be1a5c	! t1_kref+0x42f0:   	stda	%f12, [%i0 + %i4]0xd2
	.word	0x93183ce1	! t1_kref+0x42f4:   	tsubcctv	%g0, -0x31f, %o1
	.word	0x26800002	! t1_kref+0x42f8:   	bl,a	_kref+0x4300
	.word	0x908d801a	! t1_kref+0x42fc:   	andcc	%l6, %i2, %o0
	.word	0xa9b24200	! t1_kref+0x4300:   	array8	%o1, %g0, %l4
	.word	0xe6080019	! t1_kref+0x4304:   	ldub	[%g0 + %i1], %l3
	.word	0x928d4014	! t1_kref+0x4308:   	andcc	%l5, %l4, %o1
	.word	0xeb68a081	! t1_kref+0x430c:   	prefetch	%g2 + 0x81, 21
	.word	0x912d201f	! t1_kref+0x4310:   	sll	%l4, 0x1f, %o0
	.word	0xd03e2000	! t1_kref+0x4314:   	std	%o0, [%i0]
	.word	0xd086505c	! t1_kref+0x4318:   	lda	[%i1 + %i4]0x82, %o0
	sethi	%hi(1f), %o7
	jmpl	%o7+%lo(1f), %g1
	.empty
	.word	0x81868000	! t1_kref+0x4324:   	wr	%i2, %g0, %y
	.word	0x85a109ae	! t1_kref+0x4328:   	fdivs	%f4, %f14, %f2
	.word	0xada209ac	! t1_kref+0x432c:   	fdivs	%f8, %f12, %f22
	.word	0x96ad3309	! t1_kref+0x4330:   	andncc	%l4, -0xcf7, %o3
	.word	0xacc56607	! t1_kref+0x4334:   	addccc	%l5, 0x607, %l6
	.word	0x35800003	! t1_kref+0x4338:   	fbue,a	_kref+0x4344
1:	.word	0xe9ee501d	! t1_kref+0x433c:   	prefetcha	%i1 + %i5, 20
	.word	0xe3b8a0c0	! t1_kref+0x4340:   	stda	%f48, [%g2 + 0xc0]%asi
	.word	0x81ad0a4c	! t1_kref+0x4344:   	fcmpd	%fcc0, %f20, %f12
	.word	0xa6b8272f	! t1_kref+0x4348:   	xnorcc	%g0, 0x72f, %l3
	.word	0xc1ee5016	! t1_kref+0x434c:   	prefetcha	%i1 + %l6, 0
	.word	0x91418000	! t1_kref+0x4350:   	mov	%fprs, %o0
	.word	0x90fde523	! t1_kref+0x4354:   	sdivcc	%l7, 0x523, %o0
	.word	0xf62e4000	! t1_kref+0x4358:   	stb	%i3, [%i1]
	.word	0x89a01894	! t1_kref+0x435c:   	fitos	%f20, %f4
	.word	0xe60e8018	! t1_kref+0x4360:   	ldub	[%i2 + %i0], %l3
	.word	0x81ac4a22	! t1_kref+0x4364:   	fcmps	%fcc0, %f17, %f2
	.word	0xa5b14ae1	! t1_kref+0x4368:   	fpsub32s	%f5, %f1, %f18
	.word	0xb1a01898	! t1_kref+0x436c:   	fitos	%f24, %f24
	.word	0xf1180018	! t1_kref+0x4370:   	ldd	[%g0 + %i0], %f24
	.word	0x94d4fc36	! t1_kref+0x4374:   	umulcc	%l3, -0x3ca, %o2
	.word	0x81ae8a58	! t1_kref+0x4378:   	fcmpd	%fcc0, %f26, %f24
	.word	0x96f37ce6	! t1_kref+0x437c:   	udivcc	%o5, -0x31a, %o3
	call	SYM(t1_subr0)
	.word	0xa5b3872e	! t1_kref+0x4384:   	fmuld8ulx16	%f14, %f14, %f18
	.word	0x96b2801a	! t1_kref+0x4388:   	orncc	%o2, %i2, %o3
	.word	0xe856c019	! t1_kref+0x438c:   	ldsh	[%i3 + %i1], %l4
	.word	0xe9262014	! t1_kref+0x4390:   	st	%f20, [%i0 + 0x14]
	.word	0x8fa018ce	! t1_kref+0x4394:   	fdtos	%f14, %f7
	.word	0x25800002	! t1_kref+0x4398:   	fblg,a	_kref+0x43a0
	.word	0x91a01906	! t1_kref+0x439c:   	fitod	%f6, %f8
	.word	0xa61de41b	! t1_kref+0x43a0:   	xor	%l7, 0x41b, %l3
	.word	0x941ead8d	! t1_kref+0x43a4:   	xor	%i2, 0xd8d, %o2
	.word	0x9076e251	! t1_kref+0x43a8:   	udiv	%i3, 0x251, %o0
	.word	0xf43e2008	! t1_kref+0x43ac:   	std	%i2, [%i0 + 8]
	.word	0xaa8db82f	! t1_kref+0x43b0:   	andcc	%l6, -0x7d1, %l5
	.word	0x81ac8a2e	! t1_kref+0x43b4:   	fcmps	%fcc0, %f18, %f14
	.word	0x9f414000	! t1_kref+0x43b8:   	mov	%pc, %o7
	.word	0xf3a01019	! t1_kref+0x43bc:   	sta	%f25, [%g0 + %i1]0x80
	.word	0x95b30480	! t1_kref+0x43c0:   	fcmple32	%f12, %f0, %o2
	.word	0x95b34d60	! t1_kref+0x43c4:   	fnot1s	%f13, %f10
	.word	0xa5a5cd2c	! t1_kref+0x43c8:   	fsmuld	%f23, %f12, %f18
	.word	0x32480007	! t1_kref+0x43cc:   	bne,a,pt	%icc, _kref+0x43e8
	.word	0xa732a003	! t1_kref+0x43d0:   	srl	%o2, 0x3, %l3
	.word	0xcd06600c	! t1_kref+0x43d4:   	ld	[%i1 + 0xc], %f6
	.word	0x913b2012	! t1_kref+0x43d8:   	sra	%o4, 0x12, %o0
	.word	0x98d6a764	! t1_kref+0x43dc:   	umulcc	%i2, 0x764, %o4
	.word	0x98fd7e1d	! t1_kref+0x43e0:   	sdivcc	%l5, -0x1e3, %o4
	.word	0x909a7e8e	! t1_kref+0x43e4:   	xorcc	%o1, -0x172, %o0
	.word	0xffee101b	! t1_kref+0x43e8:   	prefetcha	%i0 + %i3, 31
	.word	0xa6620016	! t1_kref+0x43ec:   	subc	%o0, %l6, %l3
	.word	0x3c800006	! t1_kref+0x43f0:   	bpos,a	_kref+0x4408
	.word	0x2b04c4c2	! t1_kref+0x43f4:   	sethi	%hi(0x13130800), %l5
	.word	0x9835c014	! t1_kref+0x43f8:   	orn	%l7, %l4, %o4
	.word	0x92d5e42a	! t1_kref+0x43fc:   	umulcc	%l7, 0x42a, %o1
	.word	0x909ac00c	! t1_kref+0x4400:   	xorcc	%o3, %o4, %o0
	.word	0x81a8caa6	! t1_kref+0x4404:   	fcmpes	%fcc0, %f3, %f6
	.word	0x90adfb4f	! t1_kref+0x4408:   	andncc	%l7, -0x4b1, %o0
	.word	0x98fcc00b	! t1_kref+0x440c:   	sdivcc	%l3, %o3, %o4
	.word	0x81868000	! t1_kref+0x4410:   	wr	%i2, %g0, %y
	.word	0xd1be5a5c	! t1_kref+0x4414:   	stda	%f8, [%i1 + %i4]0xd2
	.word	0xae830014	! t1_kref+0x4418:   	addcc	%o4, %l4, %l7
	.word	0x9483754e	! t1_kref+0x441c:   	addcc	%o5, -0xab2, %o2
	.word	0x81a90a56	! t1_kref+0x4420:   	fcmpd	%fcc0, %f4, %f22
	.word	0x90e32081	! t1_kref+0x4424:   	subccc	%o4, 0x81, %o0
	.word	0xa6fb6dee	! t1_kref+0x4428:   	sdivcc	%o5, 0xdee, %l3
	.word	0x85a01914	! t1_kref+0x442c:   	fitod	%f20, %f2
	.word	0x9da01a48	! t1_kref+0x4430:   	fdtoi	%f8, %f14
	.word	0xaa22f1ec	! t1_kref+0x4434:   	sub	%o3, -0xe14, %l5
	.word	0x99b240b6	! t1_kref+0x4438:   	edge16n	%o1, %l6, %o4
	.word	0xf5267ff8	! t1_kref+0x443c:   	st	%f26, [%i1 - 8]
	.word	0x81ac4a3a	! t1_kref+0x4440:   	fcmps	%fcc0, %f17, %f26
	.word	0x96c5c013	! t1_kref+0x4444:   	addccc	%l7, %l3, %o3
	.word	0x969d7b92	! t1_kref+0x4448:   	xorcc	%l5, -0x46e, %o3
	.word	0x9da209d4	! t1_kref+0x444c:   	fdivd	%f8, %f20, %f14
	.word	0x96dac00c	! t1_kref+0x4450:   	smulcc	%o3, %o4, %o3
	.word	0xd850a02c	! t1_kref+0x4454:   	ldsh	[%g2 + 0x2c], %o4
	.word	0xd51f4019	! t1_kref+0x4458:   	ldd	[%i5 + %i1], %f10
	.word	0x81ac8a54	! t1_kref+0x445c:   	fcmpd	%fcc0, %f18, %f20
	.word	0xb1b086f8	! t1_kref+0x4460:   	fmul8ulx16	%f2, %f24, %f24
	.word	0xe3b8a0c0	! t1_kref+0x4464:   	stda	%f48, [%g2 + 0xc0]%asi
	.word	0x9465f3f0	! t1_kref+0x4468:   	subc	%l7, -0xc10, %o2
	.word	0xf6266008	! t1_kref+0x446c:   	st	%i3, [%i1 + 8]
	.word	0xe3861000	! t1_kref+0x4470:   	lda	[%i0]0x80, %f17
	.word	0x26480001	! t1_kref+0x4474:   	bl,a,pt	%icc, _kref+0x4478
	.word	0xa5a088d6	! t1_kref+0x4478:   	fsubd	%f2, %f22, %f18
	.word	0x98052ba2	! t1_kref+0x447c:   	add	%l4, 0xba2, %o4
	.word	0xaca266cd	! t1_kref+0x4480:   	subcc	%o1, 0x6cd, %l6
	.word	0x24800002	! t1_kref+0x4484:   	ble,a	_kref+0x448c
	.word	0x89a80040	! t1_kref+0x4488:   	fmovdn	%fcc0, %f0, %f4
	.word	0x941a8008	! t1_kref+0x448c:   	xor	%o2, %o0, %o2
	.word	0xac9cc00c	! t1_kref+0x4490:   	xorcc	%l3, %o4, %l6
	.word	0xb4103fe5	! t1_kref+0x4494:   	mov	0xffffffe5, %i2
	.word	0xacdec00d	! t1_kref+0x4498:   	smulcc	%i3, %o5, %l6
	.word	0xea0e401a	! t1_kref+0x449c:   	ldub	[%i1 + %i2], %l5
	.word	0x961d2eb7	! t1_kref+0x44a0:   	xor	%l4, 0xeb7, %o3
	.word	0x8610200a	! t1_kref+0x44a4:   	mov	0xa, %g3
	.word	0x86a0e001	! t1_kref+0x44a8:   	subcc	%g3, 1, %g3
	.word	0x22800016	! t1_kref+0x44ac:   	be,a	_kref+0x4504
	.word	0xea466018	! t1_kref+0x44b0:   	ldsw	[%i1 + 0x18], %l5
	.word	0xec20a00c	! t1_kref+0x44b4:   	st	%l6, [%g2 + 0xc]
	.word	0xa1a00525	! t1_kref+0x44b8:   	fsqrts	%f5, %f16
	.word	0x26800002	! t1_kref+0x44bc:   	bl,a	_kref+0x44c4
	.word	0xa9b00d92	! t1_kref+0x44c0:   	fxor	%f0, %f18, %f20
	.word	0xe8b65000	! t1_kref+0x44c4:   	stha	%l4, [%i1]0x80
	.word	0x93b30136	! t1_kref+0x44c8:   	edge32n	%o4, %l6, %o1
	.word	0xb5a10923	! t1_kref+0x44cc:   	fmuls	%f4, %f3, %f26
	.word	0xa6b2bd1d	! t1_kref+0x44d0:   	orncc	%o2, -0x2e3, %l3
	.word	0xc700a014	! t1_kref+0x44d4:   	ld	[%g2 + 0x14], %f3
	.word	0x9fa509b2	! t1_kref+0x44d8:   	fdivs	%f20, %f18, %f15
	.word	0xe9be1853	! t1_kref+0x44dc:   	stda	%f20, [%i0 + %l3]0xc2
	.word	0xd2b01018	! t1_kref+0x44e0:   	stha	%o1, [%g0 + %i0]0x80
	.word	0xe1be1a5c	! t1_kref+0x44e4:   	stda	%f16, [%i0 + %i4]0xd2
	.word	0x94db0009	! t1_kref+0x44e8:   	smulcc	%o4, %o1, %o2
	.word	0x28480001	! t1_kref+0x44ec:   	bleu,a,pt	%icc, _kref+0x44f0
	.word	0x81854000	! t1_kref+0x44f0:   	wr	%l5, %g0, %y
	.word	0xaaa5b059	! t1_kref+0x44f4:   	subcc	%l6, -0xfa7, %l5
	.word	0xa1a1483a	! t1_kref+0x44f8:   	fadds	%f5, %f26, %f16
	.word	0x90600013	! t1_kref+0x44fc:   	subc	%g0, %l3, %o0
	.word	0xe9be1855	! t1_kref+0x4500:   	stda	%f20, [%i0 + %l5]0xc2
	.word	0xe168a044	! t1_kref+0x4504:   	prefetch	%g2 + 0x44, 16
	.word	0x8fa01895	! t1_kref+0x4508:   	fitos	%f21, %f7
	.word	0x90fa000d	! t1_kref+0x450c:   	sdivcc	%o0, %o5, %o0
	.word	0x2b800008	! t1_kref+0x4510:   	fbug,a	_kref+0x4530
	.word	0x8db1cae9	! t1_kref+0x4514:   	fpsub32s	%f7, %f9, %f6
	.word	0x97b34200	! t1_kref+0x4518:   	array8	%o5, %g0, %o3
	.word	0x94280008	! t1_kref+0x451c:   	andn	%g0, %o0, %o2
	.word	0xe5ee501b	! t1_kref+0x4520:   	prefetcha	%i1 + %i3, 18
	.word	0xc807bfe8	! t1_kref+0x4524:   	ld	[%fp - 0x18], %g4
	.word	0x8da388d6	! t1_kref+0x4528:   	fsubd	%f14, %f22, %f6
	.word	0x987af3fe	! t1_kref+0x452c:   	sdiv	%o3, -0xc02, %o4
	.word	0xab2ea016	! t1_kref+0x4530:   	sll	%i2, 0x16, %l5
	.word	0x85a38954	! t1_kref+0x4534:   	fmuld	%f14, %f20, %f2
	.word	0xe656401b	! t1_kref+0x4538:   	ldsh	[%i1 + %i3], %l3
	.word	0xada01909	! t1_kref+0x453c:   	fitod	%f9, %f22
	.word	0xec0e7fe1	! t1_kref+0x4540:   	ldub	[%i1 - 0x1f], %l6
	.word	0x9635e93d	! t1_kref+0x4544:   	orn	%l7, 0x93d, %o3
	.word	0x91a018ce	! t1_kref+0x4548:   	fdtos	%f14, %f8
	.word	0x97b000b5	! t1_kref+0x454c:   	edge16n	%g0, %l5, %o3
	.word	0x11076f51	! t1_kref+0x4550:   	sethi	%hi(0x1dbd4400), %o0
	.word	0xb5a008d8	! t1_kref+0x4554:   	fsubd	%f0, %f24, %f26
	.word	0x35800007	! t1_kref+0x4558:   	fbue,a	_kref+0x4574
	.word	0xe5270018	! t1_kref+0x455c:   	st	%f18, [%i4 + %i0]
	.word	0x95b4c975	! t1_kref+0x4560:   	fpmerge	%f19, %f21, %f10
	.word	0x81aa0a52	! t1_kref+0x4564:   	fcmpd	%fcc0, %f8, %f18
	.word	0xd428a005	! t1_kref+0x4568:   	stb	%o2, [%g2 + 5]
	.word	0xd726001c	! t1_kref+0x456c:   	st	%f11, [%i0 + %i4]
	.word	0x9db60acc	! t1_kref+0x4570:   	fpsub32	%f24, %f12, %f14
	.word	0x947dc00c	! t1_kref+0x4574:   	sdiv	%l7, %o4, %o2
	.word	0x982a2b10	! t1_kref+0x4578:   	andn	%o0, 0xb10, %o4
	.word	0xfa216550	! t1_kref+0x457c:   	st	%i5, [%g5 + 0x550]
	.word	0xaf2a4016	! t1_kref+0x4580:   	sll	%o1, %l6, %l7
	.word	0xe3b8a0c0	! t1_kref+0x4584:   	stda	%f48, [%g2 + 0xc0]%asi
	.word	0xd240a004	! t1_kref+0x4588:   	ldsw	[%g2 + 4], %o1
	.word	0xac5da992	! t1_kref+0x458c:   	smul	%l6, 0x992, %l6
	.word	0x3e800004	! t1_kref+0x4590:   	bvc,a	_kref+0x45a0
	.word	0x91a01a50	! t1_kref+0x4594:   	fdtoi	%f16, %f8
	.word	0x98a3709b	! t1_kref+0x4598:   	subcc	%o5, -0xf65, %o4
	.word	0x90fcc013	! t1_kref+0x459c:   	sdivcc	%l3, %l3, %o0
	.word	0xa1a3084e	! t1_kref+0x45a0:   	faddd	%f12, %f14, %f16
	.word	0x8db206c2	! t1_kref+0x45a4:   	fmul8sux16	%f8, %f2, %f6
	.word	0xea7e7fe4	! t1_kref+0x45a8:   	swap	[%i1 - 0x1c], %l5
	sethi	%hi(2f), %o7
	.word	0xe40be1cc	! t1_kref+0x45b0:   	ldub	[%o7 + 0x1cc], %l2
	.word	0xa41ca00c	! t1_kref+0x45b4:   	xor	%l2, 0xc, %l2
	.word	0xe42be1cc	! t1_kref+0x45b8:   	stb	%l2, [%o7 + 0x1cc]
	.word	0x81dbe1cc	! t1_kref+0x45bc:   	flush	%o7 + 0x1cc
	.word	0xac7b38f1	! t1_kref+0x45c0:   	sdiv	%o4, -0x70f, %l6
	.word	0xae6375e4	! t1_kref+0x45c4:   	subc	%o5, -0xa1c, %l7
	.word	0x91a68d2e	! t1_kref+0x45c8:   	fsmuld	%f26, %f14, %f8
2:	.word	0x85b28c8c	! t1_kref+0x45cc:   	fandnot2	%f10, %f12, %f2
	.word	0xe66e001a	! t1_kref+0x45d0:   	ldstub	[%i0 + %i2], %l3
	.word	0xe9a65000	! t1_kref+0x45d4:   	sta	%f20, [%i1]0x80
	.word	0x94254016	! t1_kref+0x45d8:   	sub	%l5, %l6, %o2
	.word	0xa783400a	! t1_kref+0x45dc:   	wr	%o5, %o2, %gsr
	.word	0x83c062d0	! t1_kref+0x45e0:   	jmpl	%g1 + 0x2d0, %g1
	.word	0xec28a017	! t1_kref+0x45e4:   	stb	%l6, [%g2 + 0x17]
	.word	0xaed6fe06	! t1_kref+0x45e8:   	umulcc	%i3, -0x1fa, %l7
	.word	0x89a000d6	! t1_kref+0x45ec:   	fnegd	%f22, %f4
	.word	0x98f20014	! t1_kref+0x45f0:   	udivcc	%o0, %l4, %o4
	.word	0x9da00023	! t1_kref+0x45f4:   	fmovs	%f3, %f14
	.word	0xa3a018da	! t1_kref+0x45f8:   	fdtos	%f26, %f17
	.word	0x87b00cf0	! t1_kref+0x45fc:   	fnot2s	%f16, %f3
	.word	0x9490001b	! t1_kref+0x4600:   	orcc	%g0, %i3, %o2
	.word	0xe3b8a0c0	! t1_kref+0x4604:   	stda	%f48, [%g2 + 0xc0]%asi
	.word	0xa5a108c0	! t1_kref+0x4608:   	fsubd	%f4, %f0, %f18
	.word	0x96c58017	! t1_kref+0x460c:   	addccc	%l6, %l7, %o3
	.word	0xc9200018	! t1_kref+0x4610:   	st	%f4, [%g0 + %i0]
	call	SYM(t1_subr1)
	.word	0x993b6017	! t1_kref+0x4618:   	sra	%o5, 0x17, %o4
	.word	0xa8fd800c	! t1_kref+0x461c:   	sdivcc	%l6, %o4, %l4
	.word	0xd028a03f	! t1_kref+0x4620:   	stb	%o0, [%g2 + 0x3f]
	.word	0xa8c54017	! t1_kref+0x4624:   	addccc	%l5, %l7, %l4
	.word	0x81ae4aa1	! t1_kref+0x4628:   	fcmpes	%fcc0, %f25, %f1
	.word	0x9832a695	! t1_kref+0x462c:   	orn	%o2, 0x695, %o4
	.word	0x98fb000d	! t1_kref+0x4630:   	sdivcc	%o4, %o5, %o4
	.word	0xf43e4000	! t1_kref+0x4634:   	std	%i2, [%i1]
	.word	0xd91e0000	! t1_kref+0x4638:   	ldd	[%i0], %f12
	.word	0xe650a01e	! t1_kref+0x463c:   	ldsh	[%g2 + 0x1e], %l3
	.word	0xec760000	! t1_kref+0x4640:   	stx	%l6, [%i0]
	.word	0x39800005	! t1_kref+0x4644:   	fbuge,a	_kref+0x4658
	.word	0xa5a10842	! t1_kref+0x4648:   	faddd	%f4, %f2, %f18
	.word	0x95b0c970	! t1_kref+0x464c:   	fpmerge	%f3, %f16, %f10
	.word	0xa1b10a0e	! t1_kref+0x4650:   	fpadd16	%f4, %f14, %f16
	.word	0xa6adb1aa	! t1_kref+0x4654:   	andncc	%l6, -0xe56, %l3
	.word	0x95b009ad	! t1_kref+0x4658:   	fexpand	%f13, %f10
	.word	0x34480007	! t1_kref+0x465c:   	bg,a,pt	%icc, _kref+0x4678
	.word	0x933d001a	! t1_kref+0x4660:   	sra	%l4, %i2, %o1
	.word	0xa7b2434c	! t1_kref+0x4664:   	alignaddrl	%o1, %o4, %l3
	.word	0x81a88aa6	! t1_kref+0x4668:   	fcmpes	%fcc0, %f2, %f6
	.word	0xa9a0189a	! t1_kref+0x466c:   	fitos	%f26, %f20
	.word	0xdb270018	! t1_kref+0x4670:   	st	%f13, [%i4 + %i0]
	.word	0x9db30a54	! t1_kref+0x4674:   	fpadd32	%f12, %f20, %f14
	.word	0x81a01932	! t1_kref+0x4678:   	fstod	%f18, %f0
	.word	0x81b487d2	! t1_kref+0x467c:   	pdist	%f18, %f18, %f0
	.word	0x8da40954	! t1_kref+0x4680:   	fmuld	%f16, %f20, %f6
	.word	0x110e6937	! t1_kref+0x4684:   	sethi	%hi(0x39a4dc00), %o0
	.word	0x92fd4008	! t1_kref+0x4688:   	sdivcc	%l5, %o0, %o1
	.word	0xa1a549ac	! t1_kref+0x468c:   	fdivs	%f21, %f12, %f16
	.word	0x81a90a54	! t1_kref+0x4690:   	fcmpd	%fcc0, %f4, %f20
	.word	0xa5b40e80	! t1_kref+0x4694:   	fsrc1	%f16, %f18
	.word	0xd9200018	! t1_kref+0x4698:   	st	%f12, [%g0 + %i0]
	.word	0xd0e81019	! t1_kref+0x469c:   	ldstuba	[%g0 + %i1]0x80, %o0
	.word	0x3d800005	! t1_kref+0x46a0:   	fbule,a	_kref+0x46b4
	.word	0xa6f5401b	! t1_kref+0x46a4:   	udivcc	%l5, %i3, %l3
	.word	0x81a000c6	! t1_kref+0x46a8:   	fnegd	%f6, %f0
	.word	0x81a84aaa	! t1_kref+0x46ac:   	fcmpes	%fcc0, %f1, %f10
	.word	0x91a0193a	! t1_kref+0x46b0:   	fstod	%f26, %f8
	.word	0x94b2c00a	! t1_kref+0x46b4:   	orncc	%o3, %o2, %o2
	.word	0x981d6b7f	! t1_kref+0x46b8:   	xor	%l5, 0xb7f, %o4
	.word	0xa7b3417a	! t1_kref+0x46bc:   	edge32ln	%o5, %i2, %l3
	.word	0xa1b00f14	! t1_kref+0x46c0:   	fsrc2	%f20, %f16
	.word	0xe3b8a0c0	! t1_kref+0x46c4:   	stda	%f48, [%g2 + 0xc0]%asi
	.word	0xac930008	! t1_kref+0x46c8:   	orcc	%o4, %o0, %l6
	.word	0xa1b40e08	! t1_kref+0x46cc:   	fand	%f16, %f8, %f16
	.word	0xd47e7fe8	! t1_kref+0x46d0:   	swap	[%i1 - 0x18], %o2
	.word	0x8fa01a44	! t1_kref+0x46d4:   	fdtoi	%f4, %f7
	.word	0xf43e7ff8	! t1_kref+0x46d8:   	std	%i2, [%i1 - 8]
	.word	0x81b00c00	! t1_kref+0x46dc:   	fzero	%f0
	.word	0x98b5800b	! t1_kref+0x46e0:   	orncc	%l6, %o3, %o4
	.word	0x89a00150	! t1_kref+0x46e4:   	fabsd	%f16, %f4
	.word	0xada489d6	! t1_kref+0x46e8:   	fdivd	%f18, %f22, %f22
	.word	0x36480001	! t1_kref+0x46ec:   	bge,a,pt	%icc, _kref+0x46f0
	.word	0x9425401a	! t1_kref+0x46f0:   	sub	%l5, %i2, %o2
	.word	0xc9be189b	! t1_kref+0x46f4:   	stda	%f4, [%i0 + %i3]0xc4
	.word	0x92daedbc	! t1_kref+0x46f8:   	smulcc	%o3, 0xdbc, %o1
	.word	0x91a01907	! t1_kref+0x46fc:   	fitod	%f7, %f8
	.word	0x85a60844	! t1_kref+0x4700:   	faddd	%f24, %f4, %f2
	.word	0xf6766000	! t1_kref+0x4704:   	stx	%i3, [%i1]
	.word	0x95b2015a	! t1_kref+0x4708:   	edge32l	%o0, %i2, %o2
	.word	0x95b50357	! t1_kref+0x470c:   	alignaddrl	%l4, %l7, %o2
	.word	0xf5ee101c	! t1_kref+0x4710:   	prefetcha	%i0 + %i4, 26
	.word	0xe3b8a0c0	! t1_kref+0x4714:   	stda	%f48, [%g2 + 0xc0]%asi
	.word	0x89a00539	! t1_kref+0x4718:   	fsqrts	%f25, %f4
	.word	0x81aa0a50	! t1_kref+0x471c:   	fcmpd	%fcc0, %f8, %f16
	.word	0x9fc10000	! t1_kref+0x4720:   	call	%g4
	.word	0x95b10d8a	! t1_kref+0x4724:   	fxor	%f4, %f10, %f10
	.word	0xb1a2884c	! t1_kref+0x4728:   	faddd	%f10, %f12, %f24
	.word	0x9da688c4	! t1_kref+0x472c:   	fsubd	%f26, %f4, %f14
	.word	0xa1b38fb1	! t1_kref+0x4730:   	fors	%f14, %f17, %f16
	.word	0xd1180019	! t1_kref+0x4734:   	ldd	[%g0 + %i1], %f8
	sethi	%hi(2f), %o7
	.word	0xe40be370	! t1_kref+0x473c:   	ldub	[%o7 + 0x370], %l2
	.word	0xa41ca00c	! t1_kref+0x4740:   	xor	%l2, 0xc, %l2
	.word	0xe42be370	! t1_kref+0x4744:   	stb	%l2, [%o7 + 0x370]
	.word	0x81dbe370	! t1_kref+0x4748:   	flush	%o7 + 0x370
	.word	0xd47e6014	! t1_kref+0x474c:   	swap	[%i1 + 0x14], %o2
	.word	0x953d4014	! t1_kref+0x4750:   	sra	%l5, %l4, %o2
	.word	0x98a00008	! t1_kref+0x4754:   	subcc	%g0, %o0, %o4
	.word	0x98bdc000	! t1_kref+0x4758:   	xnorcc	%l7, %g0, %o4
	.word	0xec3e6010	! t1_kref+0x475c:   	std	%l6, [%i1 + 0x10]
	.word	0x8ba0012b	! t1_kref+0x4760:   	fabss	%f11, %f5
	.word	0xa5b5c6b6	! t1_kref+0x4764:   	fmul8x16al	%f23, %f22, %f18
	.word	0xe3b8a0c0	! t1_kref+0x4768:   	stda	%f48, [%g2 + 0xc0]%asi
	.word	0x8db08f42	! t1_kref+0x476c:   	fornot1	%f2, %f2, %f6
2:	.word	0x9466f49b	! t1_kref+0x4770:   	subc	%i3, -0xb65, %o2
	.word	0x2e480006	! t1_kref+0x4774:   	bvs,a,pt	%icc, _kref+0x478c
	.word	0x15345105	! t1_kref+0x4778:   	sethi	%hi(0xd1441400), %o2
	.word	0x37480008	! t1_kref+0x477c:   	fbge,a,pt	%fcc0, _kref+0x479c
	.word	0xaaa5401a	! t1_kref+0x4780:   	subcc	%l5, %i2, %l5
	.word	0xb3a44823	! t1_kref+0x4784:   	fadds	%f17, %f3, %f25
	.word	0xa1ab8058	! t1_kref+0x4788:   	fmovdule	%fcc0, %f24, %f16
	.word	0x96d8000d	! t1_kref+0x478c:   	smulcc	%g0, %o5, %o3
	.word	0x941d3efe	! t1_kref+0x4790:   	xor	%l4, -0x102, %o2
	call	SYM(t1_subr1)
	.word	0x907a4000	! t1_kref+0x4798:   	sdiv	%o1, %g0, %o0
	.word	0xd47e0000	! t1_kref+0x479c:   	swap	[%i0], %o2
	.word	0x8143c000	! t1_kref+0x47a0:   	stbar
	.word	0x8ba0052e	! t1_kref+0x47a4:   	fsqrts	%f14, %f5
	.word	0xda30a016	! t1_kref+0x47a8:   	sth	%o5, [%g2 + 0x16]
	.word	0xaa0575b1	! t1_kref+0x47ac:   	add	%l5, -0xa4f, %l5
	.word	0x81580000	! t1_kref+0x47b0:   	flushw
	.word	0xe4380019	! t1_kref+0x47b4:   	std	%l2, [%g0 + %i1]
	.word	0x9bb68ca7	! t1_kref+0x47b8:   	fandnot2s	%f26, %f7, %f13
	.word	0xee56200a	! t1_kref+0x47bc:   	ldsh	[%i0 + 0xa], %l7
	.word	0xaba01881	! t1_kref+0x47c0:   	fitos	%f1, %f21
	.word	0x32800002	! t1_kref+0x47c4:   	bne,a	_kref+0x47cc
	.word	0xf6280019	! t1_kref+0x47c8:   	stb	%i3, [%g0 + %i1]
	.word	0xad418000	! t1_kref+0x47cc:   	mov	%fprs, %l6
	.word	0xadb087cc	! t1_kref+0x47d0:   	pdist	%f2, %f12, %f22
	.word	0x9fc10000	! t1_kref+0x47d4:   	call	%g4
	.word	0xd016001b	! t1_kref+0x47d8:   	lduh	[%i0 + %i3], %o0
	.word	0x91b18a4c	! t1_kref+0x47dc:   	fpadd32	%f6, %f12, %f8
	.word	0x2e800004	! t1_kref+0x47e0:   	bvs,a	_kref+0x47f0
	.word	0xa5b58d28	! t1_kref+0x47e4:   	fandnot1s	%f22, %f8, %f18
	.word	0x3e480001	! t1_kref+0x47e8:   	bvc,a,pt	%icc, _kref+0x47ec
	.word	0x89a000cc	! t1_kref+0x47ec:   	fnegd	%f12, %f4
	.word	0xf3a61000	! t1_kref+0x47f0:   	sta	%f25, [%i0]0x80
	.word	0xb1a60d34	! t1_kref+0x47f4:   	fsmuld	%f24, %f20, %f24
	.word	0xe1270018	! t1_kref+0x47f8:   	st	%f16, [%i4 + %i0]
	.word	0xaec6e927	! t1_kref+0x47fc:   	addccc	%i3, 0x927, %l7
	.word	0x8fa0012d	! t1_kref+0x4800:   	fabss	%f13, %f7
	.word	0x93b285da	! t1_kref+0x4804:   	fcmpeq32	%f10, %f26, %o1
	.word	0xa8030015	! t1_kref+0x4808:   	add	%o4, %l5, %l4
	.word	0x92ad4013	! t1_kref+0x480c:   	andncc	%l5, %l3, %o1
	.word	0x913aa005	! t1_kref+0x4810:   	sra	%o2, 0x5, %o0
	.word	0x961dc014	! t1_kref+0x4814:   	xor	%l7, %l4, %o3
	.word	0x94d5c009	! t1_kref+0x4818:   	umulcc	%l7, %o1, %o2
	.word	0xa6b5801a	! t1_kref+0x481c:   	orncc	%l6, %i2, %l3
	.word	0x949d8017	! t1_kref+0x4820:   	xorcc	%l6, %l7, %o2
	.word	0xaec6800a	! t1_kref+0x4824:   	addccc	%i2, %o2, %l7
	.word	0xa725215b	! t1_kref+0x4828:   	mulscc	%l4, 0x15b, %l3
	.word	0x86102003	! t1_kref+0x482c:   	mov	0x3, %g3
	.word	0x32800000	! t1_kref+0x4830:   	bne,a	_kref+0x4830
	.word	0x86a0e001	! t1_kref+0x4834:   	subcc	%g3, 1, %g3
	.word	0x97b54e21	! t1_kref+0x4838:   	fands	%f21, %f1, %f11
	.word	0x89b506e2	! t1_kref+0x483c:   	fmul8ulx16	%f20, %f2, %f4
	.word	0xa830000d	! t1_kref+0x4840:   	orn	%g0, %o5, %l4
	.word	0x86102002	! t1_kref+0x4844:   	mov	0x2, %g3
	.word	0x32800000	! t1_kref+0x4848:   	bne,a	_kref+0x4848
	.word	0x86a0e001	! t1_kref+0x484c:   	subcc	%g3, 1, %g3
	.word	0x95a00536	! t1_kref+0x4850:   	fsqrts	%f22, %f10
	.word	0x86102004	! t1_kref+0x4854:   	mov	0x4, %g3
	.word	0x32800000	! t1_kref+0x4858:   	bne,a	_kref+0x4858
	.word	0x86a0e001	! t1_kref+0x485c:   	subcc	%g3, 1, %g3
	sethi	%hi(2f), %o7
	.word	0xe40be0a4	! t1_kref+0x4864:   	ldub	[%o7 + 0xa4], %l2
	.word	0xa41ca00c	! t1_kref+0x4868:   	xor	%l2, 0xc, %l2
	.word	0xe42be0a4	! t1_kref+0x486c:   	stb	%l2, [%o7 + 0xa4]
	.word	0x81dbe0a4	! t1_kref+0x4870:   	flush	%o7 + 0xa4
	.word	0x27800006	! t1_kref+0x4874:   	fbul,a	_kref+0x488c
	.word	0x928b37d5	! t1_kref+0x4878:   	andcc	%o4, -0x82b, %o1
	.word	0xc0774019	! t1_kref+0x487c:   	stx	%g0, [%i5 + %i1]
	.word	0x93b08486	! t1_kref+0x4880:   	fcmple32	%f2, %f6, %o1
	.word	0xae900015	! t1_kref+0x4884:   	orcc	%g0, %l5, %l7
	.word	0x8da01934	! t1_kref+0x4888:   	fstod	%f20, %f6
	.word	0x81a80a54	! t1_kref+0x488c:   	fcmpd	%fcc0, %f0, %f20
	.word	0xef68a0cb	! t1_kref+0x4890:   	prefetch	%g2 + 0xcb, 23
	.word	0xada009c8	! t1_kref+0x4894:   	fdivd	%f0, %f8, %f22
	.word	0xa9650000	! t1_kref+0x4898:   	movleu	%icc, %g0, %l4
	.word	0x91a000ae	! t1_kref+0x489c:   	fnegs	%f14, %f8
	.word	0x81828000	! t1_kref+0x48a0:   	wr	%o2, %g0, %y
2:	.word	0xb5a409c0	! t1_kref+0x48a4:   	fdivd	%f16, %f0, %f26
	.word	0x21800002	! t1_kref+0x48a8:   	fbn,a	_kref+0x48b0
	.word	0x83a01a44	! t1_kref+0x48ac:   	fdtoi	%f4, %f1
	.word	0x9450338c	! t1_kref+0x48b0:   	umul	%g0, -0xc74, %o2
	.word	0xd51fbf00	! t1_kref+0x48b4:   	ldd	[%fp - 0x100], %f10
	.word	0xec1e6018	! t1_kref+0x48b8:   	ldd	[%i1 + 0x18], %l6
	.word	0x925b0008	! t1_kref+0x48bc:   	smul	%o4, %o0, %o1
	.word	0x95b340ac	! t1_kref+0x48c0:   	edge16n	%o5, %o4, %o2
	.word	0x98aeafa7	! t1_kref+0x48c4:   	andncc	%i2, 0xfa7, %o4
	.word	0x9db00f16	! t1_kref+0x48c8:   	fsrc2	%f22, %f14
	.word	0x969839c3	! t1_kref+0x48cc:   	xorcc	%g0, -0x63d, %o3
	.word	0x99a01887	! t1_kref+0x48d0:   	fitos	%f7, %f12
	.word	0xe43e6008	! t1_kref+0x48d4:   	std	%l2, [%i1 + 8]
	.word	0xc11e6010	! t1_kref+0x48d8:   	ldd	[%i1 + 0x10], %f0
	.word	0x95400000	! t1_kref+0x48dc:   	mov	%y, %o2
	.word	0xee50a00e	! t1_kref+0x48e0:   	ldsh	[%g2 + 0xe], %l7
	.word	0xd4162006	! t1_kref+0x48e4:   	lduh	[%i0 + 6], %o2
	.word	0xd278a00c	! t1_kref+0x48e8:   	swap	[%g2 + 0xc], %o1
	.word	0xf51fbc98	! t1_kref+0x48ec:   	ldd	[%fp - 0x368], %f26
	.word	0x90acc017	! t1_kref+0x48f0:   	andncc	%l3, %l7, %o0
	.word	0xe8567fe8	! t1_kref+0x48f4:   	ldsh	[%i1 - 0x18], %l4
	.word	0x9405b691	! t1_kref+0x48f8:   	add	%l6, -0x96f, %o2
	.word	0xe4086360	! t1_kref+0x48fc:   	ldub	[%g1 + 0x360], %l2
	.word	0xa41ca00c	! t1_kref+0x4900:   	xor	%l2, 0xc, %l2
	.word	0xe4286360	! t1_kref+0x4904:   	stb	%l2, [%g1 + 0x360]
	.word	0x81d86360	! t1_kref+0x4908:   	flush	%g1 + 0x360
	.word	0x961dc01b	! t1_kref+0x490c:   	xor	%l7, %i3, %o3
	.word	0xd830a00e	! t1_kref+0x4910:   	sth	%o4, [%g2 + 0xe]
	.word	0x913d800c	! t1_kref+0x4914:   	sra	%l6, %o4, %o0
	.word	0xd7a01018	! t1_kref+0x4918:   	sta	%f11, [%g0 + %i0]0x80
	.word	0xc168a08e	! t1_kref+0x491c:   	prefetch	%g2 + 0x8e, 0
	.word	0xcd1fbd68	! t1_kref+0x4920:   	ldd	[%fp - 0x298], %f6
	.word	0xafb204c2	! t1_kref+0x4924:   	fcmpne32	%f8, %f2, %l7
	.word	0xa93dc00b	! t1_kref+0x4928:   	sra	%l7, %o3, %l4
	.word	0xf5270019	! t1_kref+0x492c:   	st	%f26, [%i4 + %i1]
	.word	0x98f36d5b	! t1_kref+0x4930:   	udivcc	%o5, 0xd5b, %o4
	.word	0xac052b7a	! t1_kref+0x4934:   	add	%l4, 0xb7a, %l6
	.word	0x929a4016	! t1_kref+0x4938:   	xorcc	%o1, %l6, %o1
	.word	0xa8234009	! t1_kref+0x493c:   	sub	%o5, %o1, %l4
2:	.word	0xa8920008	! t1_kref+0x4940:   	orcc	%o0, %o0, %l4
	.word	0xec063fe0	! t1_kref+0x4944:   	ld	[%i0 - 0x20], %l6
	.word	0xd2780019	! t1_kref+0x4948:   	swap	[%g0 + %i1], %o1
	.word	0xadb38f4a	! t1_kref+0x494c:   	fornot1	%f14, %f10, %f22
	.word	0x961daa4a	! t1_kref+0x4950:   	xor	%l6, 0xa4a, %o3
	.word	0x39800007	! t1_kref+0x4954:   	fbuge,a	_kref+0x4970
	.word	0xae3ec01b	! t1_kref+0x4958:   	xnor	%i3, %i3, %l7
	.word	0x25800005	! t1_kref+0x495c:   	fblg,a	_kref+0x4970
	.word	0xaea5eed2	! t1_kref+0x4960:   	subcc	%l7, 0xed2, %l7
	.word	0x990ab8fb	! t1_kref+0x4964:   	tsubcc	%o2, -0x705, %o4
	.word	0xd850a01c	! t1_kref+0x4968:   	ldsh	[%g2 + 0x1c], %o4
	.word	0x95b10ca7	! t1_kref+0x496c:   	fandnot2s	%f4, %f7, %f10
	.word	0x96056996	! t1_kref+0x4970:   	add	%l5, 0x996, %o3
	.word	0xa6aa71be	! t1_kref+0x4974:   	andncc	%o1, -0xe42, %l3
	.word	0xeeee101a	! t1_kref+0x4978:   	ldstuba	[%i0 + %i2]0x80, %l7
	.word	0x90fd6e6b	! t1_kref+0x497c:   	sdivcc	%l5, 0xe6b, %o0
	.word	0xa8d68013	! t1_kref+0x4980:   	umulcc	%i2, %l3, %l4
	.word	0x81aa8ad2	! t1_kref+0x4984:   	fcmped	%fcc0, %f10, %f18
	.word	0xd1bf5a58	! t1_kref+0x4988:   	stda	%f8, [%i5 + %i0]0xd2
	.word	0xea50a00e	! t1_kref+0x498c:   	ldsh	[%g2 + 0xe], %l5
	.word	0xef06001c	! t1_kref+0x4990:   	ld	[%i0 + %i4], %f23
	.word	0xc13e3ff0	! t1_kref+0x4994:   	std	%f0, [%i0 - 0x10]
	.word	0xec563ff4	! t1_kref+0x4998:   	ldsh	[%i0 - 0xc], %l6
	.word	0xabb00ce3	! t1_kref+0x499c:   	fnot2s	%f3, %f21
	.word	0xae35801a	! t1_kref+0x49a0:   	orn	%l6, %i2, %l7
	.word	0xa5a01905	! t1_kref+0x49a4:   	fitod	%f5, %f18
	.word	0x93b500ba	! t1_kref+0x49a8:   	edge16n	%l4, %i2, %o1
	.word	0x9866800a	! t1_kref+0x49ac:   	subc	%i2, %o2, %o4
	.word	0x96537f36	! t1_kref+0x49b0:   	umul	%o5, -0xca, %o3
	.word	0x9da00529	! t1_kref+0x49b4:   	fsqrts	%f9, %f14
	.word	0xa665000c	! t1_kref+0x49b8:   	subc	%l4, %o4, %l3
	.word	0x96f34016	! t1_kref+0x49bc:   	udivcc	%o5, %l6, %o3
	.word	0xb1a58940	! t1_kref+0x49c0:   	fmuld	%f22, %f0, %f24
	.word	0x983325c4	! t1_kref+0x49c4:   	orn	%o4, 0x5c4, %o4
	.word	0xd91fbe38	! t1_kref+0x49c8:   	ldd	[%fp - 0x1c8], %f12
	.word	0x949cebca	! t1_kref+0x49cc:   	xorcc	%l3, 0xbca, %o2
	.word	0xa9a0cd39	! t1_kref+0x49d0:   	fsmuld	%f3, %f25, %f20
	.word	0x24800007	! t1_kref+0x49d4:   	ble,a	_kref+0x49f0
	.word	0x92ab4017	! t1_kref+0x49d8:   	andncc	%o5, %l7, %o1
	.word	0xada409d2	! t1_kref+0x49dc:   	fdivd	%f16, %f18, %f22
	.word	0x98832d72	! t1_kref+0x49e0:   	addcc	%o4, 0xd72, %o4
	.word	0xf306600c	! t1_kref+0x49e4:   	ld	[%i1 + 0xc], %f25
	.word	0x98c6c008	! t1_kref+0x49e8:   	addccc	%i3, %o0, %o4
	.word	0x9da00558	! t1_kref+0x49ec:   	fsqrtd	%f24, %f14
	.word	0xa83db172	! t1_kref+0x49f0:   	xnor	%l6, -0xe8e, %l4
	.word	0x85a009d8	! t1_kref+0x49f4:   	fdivd	%f0, %f24, %f2
	.word	0xd0563ff4	! t1_kref+0x49f8:   	ldsh	[%i0 - 0xc], %o0
	.word	0x9db2496e	! t1_kref+0x49fc:   	fpmerge	%f9, %f14, %f14
	.word	0xa93b401a	! t1_kref+0x4a00:   	sra	%o5, %i2, %l4
	.word	0x81ac0acc	! t1_kref+0x4a04:   	fcmped	%fcc0, %f16, %f12
	.word	0x81834000	! t1_kref+0x4a08:   	wr	%o5, %g0, %y
	.word	0xaafdfba4	! t1_kref+0x4a0c:   	sdivcc	%l7, -0x45c, %l5
	.word	0x948d7bac	! t1_kref+0x4a10:   	andcc	%l5, -0x454, %o2
	.word	0x95a1cd3a	! t1_kref+0x4a14:   	fsmuld	%f7, %f26, %f10
	.word	0x3e800001	! t1_kref+0x4a18:   	bvc,a	_kref+0x4a1c
	.word	0x85b146a8	! t1_kref+0x4a1c:   	fmul8x16al	%f5, %f8, %f2
	.word	0x87802080	! t1_kref+0x4a20:   	mov	0x80, %asi
	.word	0x89b286ad	! t1_kref+0x4a24:   	fmul8x16al	%f10, %f13, %f4
	.word	0xa6a4c01a	! t1_kref+0x4a28:   	subcc	%l3, %i2, %l3
	.word	0xe91fbec8	! t1_kref+0x4a2c:   	ldd	[%fp - 0x138], %f20
	.word	0xa786b181	! t1_kref+0x4a30:   	wr	%i2, 0xfffff181, %gsr
	.word	0x99b48488	! t1_kref+0x4a34:   	fcmple32	%f18, %f8, %o4
	.word	0xd0567ff6	! t1_kref+0x4a38:   	ldsh	[%i1 - 0xa], %o0
	.word	0x81accab8	! t1_kref+0x4a3c:   	fcmpes	%fcc0, %f19, %f24
	.word	0xe6566014	! t1_kref+0x4a40:   	ldsh	[%i1 + 0x14], %l3
	.word	0xadb28c44	! t1_kref+0x4a44:   	fnor	%f10, %f4, %f22
	.word	0xaba01890	! t1_kref+0x4a48:   	fitos	%f16, %f21
	.word	0x99b6c0b7	! t1_kref+0x4a4c:   	edge16n	%i3, %l7, %o4
	.word	0x9424f2e8	! t1_kref+0x4a50:   	sub	%l3, -0xd18, %o2
	.word	0x8185c000	! t1_kref+0x4a54:   	wr	%l7, %g0, %y
	.word	0xd91fbee8	! t1_kref+0x4a58:   	ldd	[%fp - 0x118], %f12
	.word	0x27800001	! t1_kref+0x4a5c:   	fbul,a	_kref+0x4a60
	.word	0x94002195	! t1_kref+0x4a60:   	add	%g0, 0x195, %o2
	.word	0x85b18a16	! t1_kref+0x4a64:   	fpadd16	%f6, %f22, %f2
	.word	0xd9be184c	! t1_kref+0x4a68:   	stda	%f12, [%i0 + %o4]0xc2
	.word	0x97223a14	! t1_kref+0x4a6c:   	mulscc	%o0, -0x5ec, %o3
	.word	0x95a01913	! t1_kref+0x4a70:   	fitod	%f19, %f10
	.word	0x2f33adc7	! t1_kref+0x4a74:   	sethi	%hi(0xceb71c00), %l7
	.word	0x91b5075a	! t1_kref+0x4a78:   	fpack32	%f20, %f26, %f8
	.word	0x81ab8a2d	! t1_kref+0x4a7c:   	fcmps	%fcc0, %f14, %f13
	.word	0x2a800008	! t1_kref+0x4a80:   	bcs,a	_kref+0x4aa0
	.word	0x90457784	! t1_kref+0x4a84:   	addc	%l5, -0x87c, %o0
	.word	0x8da0190f	! t1_kref+0x4a88:   	fitod	%f15, %f6
	.word	0xea560000	! t1_kref+0x4a8c:   	ldsh	[%i0], %l5
	.word	0x89a088ca	! t1_kref+0x4a90:   	fsubd	%f2, %f10, %f4
	call	SYM(t1_subr0)
	.word	0xd07e2000	! t1_kref+0x4a98:   	swap	[%i0], %o0
	.word	0x90b68009	! t1_kref+0x4a9c:   	orncc	%i2, %o1, %o0
	.word	0x909b6d5a	! t1_kref+0x4aa0:   	xorcc	%o5, 0xd5a, %o0
	.word	0x9da0192e	! t1_kref+0x4aa4:   	fstod	%f14, %f14
	.word	0x81ae8a30	! t1_kref+0x4aa8:   	fcmps	%fcc0, %f26, %f16
	.word	0x92380009	! t1_kref+0x4aac:   	xnor	%g0, %o1, %o1
	.word	0x8fa01894	! t1_kref+0x4ab0:   	fitos	%f20, %f7
	.word	0x8fa60930	! t1_kref+0x4ab4:   	fmuls	%f24, %f16, %f7
	.word	0x89b486ce	! t1_kref+0x4ab8:   	fmul8sux16	%f18, %f14, %f4
	.word	0xe03f4018	! t1_kref+0x4abc:   	std	%l0, [%i5 + %i0]
	.word	0xa6b2fc68	! t1_kref+0x4ac0:   	orncc	%o3, -0x398, %l3
	.word	0x8db04d34	! t1_kref+0x4ac4:   	fandnot1s	%f1, %f20, %f6
	.word	0xa8fac008	! t1_kref+0x4ac8:   	sdivcc	%o3, %o0, %l4
	.word	0xd91fbf30	! t1_kref+0x4acc:   	ldd	[%fp - 0xd0], %f12
	.word	0xaca5801b	! t1_kref+0x4ad0:   	subcc	%l6, %i3, %l6
	.word	0xf43e7ff0	! t1_kref+0x4ad4:   	std	%i2, [%i1 - 0x10]
	.word	0xd248a00c	! t1_kref+0x4ad8:   	ldsb	[%g2 + 0xc], %o1
	.word	0x9135e009	! t1_kref+0x4adc:   	srl	%l7, 0x9, %o0
	.word	0x99a088c4	! t1_kref+0x4ae0:   	fsubd	%f2, %f4, %f12
	.word	0x81a64d21	! t1_kref+0x4ae4:   	fsmuld	%f25, %f1, %f0
	.word	0x92d262c7	! t1_kref+0x4ae8:   	umulcc	%o1, 0x2c7, %o1
	.word	0xdd070018	! t1_kref+0x4aec:   	ld	[%i4 + %i0], %f14
	.word	0x91a408da	! t1_kref+0x4af0:   	fsubd	%f16, %f26, %f8
	.word	0x9286f078	! t1_kref+0x4af4:   	addcc	%i3, -0xf88, %o1
	.word	0xaa624016	! t1_kref+0x4af8:   	subc	%o1, %l6, %l5
	.word	0xd456c018	! t1_kref+0x4afc:   	ldsh	[%i3 + %i0], %o2
	.word	0x98a4eeb5	! t1_kref+0x4b00:   	subcc	%l3, 0xeb5, %o4
	.word	0xada0190a	! t1_kref+0x4b04:   	fitod	%f10, %f22
	.word	0x99a01909	! t1_kref+0x4b08:   	fitod	%f9, %f12
	.word	0xe43e4000	! t1_kref+0x4b0c:   	std	%l2, [%i1]
	.word	0x94b2800c	! t1_kref+0x4b10:   	orncc	%o2, %o4, %o2
	.word	0x81aa8a46	! t1_kref+0x4b14:   	fcmpd	%fcc0, %f10, %f6
	.word	0xe86e2015	! t1_kref+0x4b18:   	ldstub	[%i0 + 0x15], %l4
	.word	0xaba01889	! t1_kref+0x4b1c:   	fitos	%f9, %f21
	.word	0x89b08dd6	! t1_kref+0x4b20:   	fnand	%f2, %f22, %f4
	.word	0x940d800d	! t1_kref+0x4b24:   	and	%l6, %o5, %o2
	.word	0xa896800c	! t1_kref+0x4b28:   	orcc	%i2, %o4, %l4
	.word	0x9702aa6f	! t1_kref+0x4b2c:   	taddcc	%o2, 0xa6f, %o3
	.word	0xd090a034	! t1_kref+0x4b30:   	lduha	[%g2 + 0x34]%asi, %o0
	.word	0xc93e2018	! t1_kref+0x4b34:   	std	%f4, [%i0 + 0x18]
	.word	0x9da01935	! t1_kref+0x4b38:   	fstod	%f21, %f14
	.word	0x81ac4a2e	! t1_kref+0x4b3c:   	fcmps	%fcc0, %f17, %f14
	.word	0xd0ee3fff	! t1_kref+0x4b40:   	ldstuba	[%i0 - 1]%asi, %o0
	.word	0xb3a38836	! t1_kref+0x4b44:   	fadds	%f14, %f22, %f25
	.word	0xa8aa401b	! t1_kref+0x4b48:   	andncc	%o1, %i3, %l4
	.word	0x90d6e5b8	! t1_kref+0x4b4c:   	umulcc	%i3, 0x5b8, %o0
	.word	0xf580a01c	! t1_kref+0x4b50:   	lda	[%g2 + 0x1c]%asi, %f26
	.word	0xee080018	! t1_kref+0x4b54:   	ldub	[%g0 + %i0], %l7
	.word	0xd11e001d	! t1_kref+0x4b58:   	ldd	[%i0 + %i5], %f8
	.word	0x91b18e22	! t1_kref+0x4b5c:   	fands	%f6, %f2, %f8
	.word	0x86102005	! t1_kref+0x4b60:   	mov	0x5, %g3
	.word	0x86a0e001	! t1_kref+0x4b64:   	subcc	%g3, 1, %g3
	.word	0x22800019	! t1_kref+0x4b68:   	be,a	_kref+0x4bcc
	.word	0x97408000	! t1_kref+0x4b6c:   	mov	%ccr, %o3
	.word	0x99b1874a	! t1_kref+0x4b70:   	fpack32	%f6, %f10, %f12
	.word	0xa8f2800a	! t1_kref+0x4b74:   	udivcc	%o2, %o2, %l4
	.word	0xaa9d69d1	! t1_kref+0x4b78:   	xorcc	%l5, 0x9d1, %l5
	.word	0xaefd67e2	! t1_kref+0x4b7c:   	sdivcc	%l5, 0x7e2, %l7
	.word	0x9db54735	! t1_kref+0x4b80:   	fmuld8ulx16	%f21, %f21, %f14
	.word	0xa6354013	! t1_kref+0x4b84:   	orn	%l5, %l3, %l3
	.word	0xa782c00c	! t1_kref+0x4b88:   	wr	%o3, %o4, %gsr
	.word	0x81a288d0	! t1_kref+0x4b8c:   	fsubd	%f10, %f16, %f0
	.word	0xcb26201c	! t1_kref+0x4b90:   	st	%f5, [%i0 + 0x1c]
	.word	0xa785b8e5	! t1_kref+0x4b94:   	wr	%l6, 0xfffff8e5, %gsr
	.word	0x9325b8c8	! t1_kref+0x4b98:   	mulscc	%l6, -0x738, %o1
	.word	0x81a90aad	! t1_kref+0x4b9c:   	fcmpes	%fcc0, %f4, %f13
	.word	0x83a00029	! t1_kref+0x4ba0:   	fmovs	%f9, %f1
	.word	0x94aaf0b6	! t1_kref+0x4ba4:   	andncc	%o3, -0xf4a, %o2
	.word	0x81ac8a56	! t1_kref+0x4ba8:   	fcmpd	%fcc0, %f18, %f22
	.word	0x97b00fe0	! t1_kref+0x4bac:   	fones	%f11
	.word	0x81ab0ad0	! t1_kref+0x4bb0:   	fcmped	%fcc0, %f12, %f16
	.word	0xae06c00c	! t1_kref+0x4bb4:   	add	%i3, %o4, %l7
	.word	0x9715c016	! t1_kref+0x4bb8:   	taddcctv	%l7, %l6, %o3
	.word	0x25800002	! t1_kref+0x4bbc:   	fblg,a	_kref+0x4bc4
	.word	0x908d7b2f	! t1_kref+0x4bc0:   	andcc	%l5, -0x4d1, %o0
	.word	0xa9b08582	! t1_kref+0x4bc4:   	fcmpgt32	%f2, %f2, %l4
	.word	0x83a01a52	! t1_kref+0x4bc8:   	fdtoi	%f18, %f1
	.word	0x92b6b3f2	! t1_kref+0x4bcc:   	orncc	%i2, -0xc0e, %o1
	.word	0xa664c009	! t1_kref+0x4bd0:   	subc	%l3, %o1, %l3
	.word	0x2c480006	! t1_kref+0x4bd4:   	bneg,a,pt	%icc, _kref+0x4bec
	.word	0xdf263fe0	! t1_kref+0x4bd8:   	st	%f15, [%i0 - 0x20]
	.word	0xaa9d8013	! t1_kref+0x4bdc:   	xorcc	%l6, %l3, %l5
	.word	0x96f574a2	! t1_kref+0x4be0:   	udivcc	%l5, -0xb5e, %o3
	.word	0x85a01895	! t1_kref+0x4be4:   	fitos	%f21, %f2
	.word	0xf43e401d	! t1_kref+0x4be8:   	std	%i2, [%i1 + %i5]
	.word	0xc1ee1009	! t1_kref+0x4bec:   	prefetcha	%i0 + %o1, 0
	.word	0xa5b58ac4	! t1_kref+0x4bf0:   	fpsub32	%f22, %f4, %f18
	.word	0x2a800006	! t1_kref+0x4bf4:   	bcs,a	_kref+0x4c0c
	.word	0xa8e2accb	! t1_kref+0x4bf8:   	subccc	%o2, 0xccb, %l4
	.word	0x8db08ed6	! t1_kref+0x4bfc:   	fornot2	%f2, %f22, %f6
	.word	0x946276cf	! t1_kref+0x4c00:   	subc	%o1, -0x931, %o2
	.word	0xd91fbe50	! t1_kref+0x4c04:   	ldd	[%fp - 0x1b0], %f12
	.word	0x9032c014	! t1_kref+0x4c08:   	orn	%o3, %l4, %o0
	.word	0xb1a60958	! t1_kref+0x4c0c:   	fmuld	%f24, %f24, %f24
	.word	0xae1aa8ba	! t1_kref+0x4c10:   	xor	%o2, 0x8ba, %l7
	.word	0x9fb5cea0	! t1_kref+0x4c14:   	fsrc1s	%f23, %f15
	.word	0x3a800007	! t1_kref+0x4c18:   	bcc,a	_kref+0x4c34
	.word	0xb1a0108e	! t1_kref+0x4c1c:   	fxtos	%f14, %f24
	.word	0x913b4008	! t1_kref+0x4c20:   	sra	%o5, %o0, %o0
	.word	0xa7b00c20	! t1_kref+0x4c24:   	fzeros	%f19
	.word	0x8da68946	! t1_kref+0x4c28:   	fmuld	%f26, %f6, %f6
	.word	0x2e800006	! t1_kref+0x4c2c:   	bvs,a	_kref+0x4c44
	.word	0x131e0a37	! t1_kref+0x4c30:   	sethi	%hi(0x7828dc00), %o1
	.word	0xe8c6501c	! t1_kref+0x4c34:   	ldswa	[%i1 + %i4]0x80, %l4
	.word	0x2b09f446	! t1_kref+0x4c38:   	sethi	%hi(0x27d11800), %l5
	.word	0x8da449b9	! t1_kref+0x4c3c:   	fdivs	%f17, %f25, %f6
	.word	0xa7332001	! t1_kref+0x4c40:   	srl	%o4, 0x1, %l3
	.word	0xaefa8014	! t1_kref+0x4c44:   	sdivcc	%o2, %l4, %l7
	.word	0xae8eb423	! t1_kref+0x4c48:   	andcc	%i2, -0xbdd, %l7
	.word	0x8182c000	! t1_kref+0x4c4c:   	wr	%o3, %g0, %y
	.word	0xec564000	! t1_kref+0x4c50:   	ldsh	[%i1], %l6
	.word	0x24480003	! t1_kref+0x4c54:   	ble,a,pt	%icc, _kref+0x4c60
	.word	0xad2dc00a	! t1_kref+0x4c58:   	sll	%l7, %o2, %l6
	.word	0xa9a208c2	! t1_kref+0x4c5c:   	fsubd	%f8, %f2, %f20
	.word	0xc1e65008	! t1_kref+0x4c60:   	casa	[%i1]0x80, %o0, %g0
	.word	0xa6dd382a	! t1_kref+0x4c64:   	smulcc	%l4, -0x7d6, %l3
	.word	0xaad2c015	! t1_kref+0x4c68:   	umulcc	%o3, %l5, %l5
	.word	0x9263000b	! t1_kref+0x4c6c:   	subc	%o4, %o3, %o1
	.word	0xe81e4000	! t1_kref+0x4c70:   	ldd	[%i1], %l4
	.word	0xac156852	! t1_kref+0x4c74:   	or	%l5, 0x852, %l6
	.word	0x94aefef7	! t1_kref+0x4c78:   	andncc	%i3, -0x109, %o2
	.word	0x27800005	! t1_kref+0x4c7c:   	fbul,a	_kref+0x4c90
	.word	0xd286101c	! t1_kref+0x4c80:   	lda	[%i0 + %i4]0x80, %o1
	.word	0x99b38558	! t1_kref+0x4c84:   	fcmpeq16	%f14, %f24, %o4
	.word	0xabb540fb	! t1_kref+0x4c88:   	edge16ln	%l5, %i3, %l5
	.word	0x90f0001a	! t1_kref+0x4c8c:   	udivcc	%g0, %i2, %o0
	.word	0x9035000c	! t1_kref+0x4c90:   	orn	%l4, %o4, %o0
	.word	0x91b50e27	! t1_kref+0x4c94:   	fands	%f20, %f7, %f8
	.word	0x9225abd0	! t1_kref+0x4c98:   	sub	%l6, 0xbd0, %o1
	.word	0x9836c00a	! t1_kref+0x4c9c:   	orn	%i3, %o2, %o4
	sethi	%hi(2f), %o7
	.word	0xe40be0c8	! t1_kref+0x4ca4:   	ldub	[%o7 + 0xc8], %l2
	.word	0xa41ca00c	! t1_kref+0x4ca8:   	xor	%l2, 0xc, %l2
	.word	0xe42be0c8	! t1_kref+0x4cac:   	stb	%l2, [%o7 + 0xc8]
	.word	0x81dbe0c8	! t1_kref+0x4cb0:   	flush	%o7 + 0xc8
	.word	0x8db58a4e	! t1_kref+0x4cb4:   	fpadd32	%f22, %f14, %f6
	.word	0x99b24d60	! t1_kref+0x4cb8:   	fnot1s	%f9, %f12
	.word	0xa9a3c9a7	! t1_kref+0x4cbc:   	fdivs	%f15, %f7, %f20
	.word	0xa7b24e6e	! t1_kref+0x4cc0:   	fxnors	%f9, %f14, %f19
	.word	0xa3a01899	! t1_kref+0x4cc4:   	fitos	%f25, %f17
2:	.word	0x85a00527	! t1_kref+0x4cc8:   	fsqrts	%f7, %f2
	.word	0x92b36d39	! t1_kref+0x4ccc:   	orncc	%o5, 0xd39, %o1
	.word	0x81aa8a58	! t1_kref+0x4cd0:   	fcmpd	%fcc0, %f10, %f24
	.word	0xa9a30d28	! t1_kref+0x4cd4:   	fsmuld	%f12, %f8, %f20
	.word	0xd8270019	! t1_kref+0x4cd8:   	st	%o4, [%i4 + %i1]
	.word	0x81ad8aad	! t1_kref+0x4cdc:   	fcmpes	%fcc0, %f22, %f13
	.word	0xd03e001d	! t1_kref+0x4ce0:   	std	%o0, [%i0 + %i5]
	.word	0x91a00540	! t1_kref+0x4ce4:   	fsqrtd	%f0, %f8
	.word	0xafb6c14a	! t1_kref+0x4ce8:   	edge32l	%i3, %o2, %l7
	.word	0xa1b587d2	! t1_kref+0x4cec:   	pdist	%f22, %f18, %f16
	.word	0xb3a00525	! t1_kref+0x4cf0:   	fsqrts	%f5, %f25
	.word	0x3c800004	! t1_kref+0x4cf4:   	bpos,a	_kref+0x4d04
	.word	0xe8b0a014	! t1_kref+0x4cf8:   	stha	%l4, [%g2 + 0x14]%asi
	.word	0xd086101c	! t1_kref+0x4cfc:   	lda	[%i0 + %i4]0x80, %o0
	.word	0xec801018	! t1_kref+0x4d00:   	lda	[%g0 + %i0]0x80, %l6
	.word	0x8582347b	! t1_kref+0x4d04:   	wr	%o0, 0xfffff47b, %ccr
	.word	0x38800002	! t1_kref+0x4d08:   	bgu,a	_kref+0x4d10
	.word	0xb5a0191a	! t1_kref+0x4d0c:   	fitod	%f26, %f26
	.word	0xc12e6018	! t1_kref+0x4d10:   	st	%fsr, [%i1 + 0x18]
	.word	0x2e480007	! t1_kref+0x4d14:   	bvs,a,pt	%icc, _kref+0x4d30
	.word	0xb1a000b0	! t1_kref+0x4d18:   	fnegs	%f16, %f24
	.word	0xafa00534	! t1_kref+0x4d1c:   	fsqrts	%f20, %f23
	.word	0xd5066008	! t1_kref+0x4d20:   	ld	[%i1 + 8], %f10
	.word	0xa8ab6722	! t1_kref+0x4d24:   	andncc	%o5, 0x722, %l4
	.word	0xf580a03c	! t1_kref+0x4d28:   	lda	[%g2 + 0x3c]%asi, %f26
	.word	0xa652a263	! t1_kref+0x4d2c:   	umul	%o2, 0x263, %l3
	.word	0x85a24d21	! t1_kref+0x4d30:   	fsmuld	%f9, %f1, %f2
	.word	0xb5a308d0	! t1_kref+0x4d34:   	fsubd	%f12, %f16, %f26
	.word	0xad3d0000	! t1_kref+0x4d38:   	sra	%l4, %g0, %l6
	.word	0x86102004	! t1_kref+0x4d3c:   	mov	0x4, %g3
	.word	0x86a0e001	! t1_kref+0x4d40:   	subcc	%g3, 1, %g3
	.word	0x2280000c	! t1_kref+0x4d44:   	be,a	_kref+0x4d74
	.word	0x8fb007ae	! t1_kref+0x4d48:   	fpackfix	%f14, %f7
	.word	0xadb18d9a	! t1_kref+0x4d4c:   	fxor	%f6, %f26, %f22
	.word	0xd4b61000	! t1_kref+0x4d50:   	stha	%o2, [%i0]0x80
	.word	0xec40a00c	! t1_kref+0x4d54:   	ldsw	[%g2 + 0xc], %l6
	.word	0xe47e4000	! t1_kref+0x4d58:   	swap	[%i1], %l2
	.word	0xdaa0a034	! t1_kref+0x4d5c:   	sta	%o5, [%g2 + 0x34]%asi
	.word	0xb1a309c8	! t1_kref+0x4d60:   	fdivd	%f12, %f8, %f24
	.word	0xb5a209ba	! t1_kref+0x4d64:   	fdivs	%f8, %f26, %f26
	.word	0xadb300bb	! t1_kref+0x4d68:   	edge16n	%o4, %i3, %l6
	.word	0xaf22bade	! t1_kref+0x4d6c:   	mulscc	%o2, -0x522, %l7
	.word	0x2f800002	! t1_kref+0x4d70:   	fbu,a	_kref+0x4d78
	.word	0xd4563ffc	! t1_kref+0x4d74:   	ldsh	[%i0 - 4], %o2
	.word	0x81ad0a48	! t1_kref+0x4d78:   	fcmpd	%fcc0, %f20, %f8
	.word	0x81858000	! t1_kref+0x4d7c:   	wr	%l6, %g0, %y
	.word	0xf6a81018	! t1_kref+0x4d80:   	stba	%i3, [%g0 + %i0]0x80
	.word	0x85b44e2b	! t1_kref+0x4d84:   	fands	%f17, %f11, %f2
	.word	0xb1b10e0e	! t1_kref+0x4d88:   	fand	%f4, %f14, %f24
	.word	0x931cfd25	! t1_kref+0x4d8c:   	tsubcctv	%l3, -0x2db, %o1
	.word	0xf6b01018	! t1_kref+0x4d90:   	stha	%i3, [%g0 + %i0]0x80
	.word	0xb1a01a46	! t1_kref+0x4d94:   	fdtoi	%f6, %f24
	.word	0xac5db951	! t1_kref+0x4d98:   	smul	%l6, -0x6af, %l6
	.word	0x8db5c70d	! t1_kref+0x4d9c:   	fmuld8sux16	%f23, %f13, %f6
	.word	0x91ab8046	! t1_kref+0x4da0:   	fmovdule	%fcc0, %f6, %f8
	.word	0x24800002	! t1_kref+0x4da4:   	ble,a	_kref+0x4dac
	.word	0x953dc017	! t1_kref+0x4da8:   	sra	%l7, %l7, %o2
	.word	0xec1e401d	! t1_kref+0x4dac:   	ldd	[%i1 + %i5], %l6
	.word	0xe43f4018	! t1_kref+0x4db0:   	std	%l2, [%i5 + %i0]
	.word	0xab332003	! t1_kref+0x4db4:   	srl	%o4, 0x3, %l5
	.word	0xadb4855a	! t1_kref+0x4db8:   	fcmpeq16	%f18, %f26, %l6
	.word	0x95b084c0	! t1_kref+0x4dbc:   	fcmpne32	%f2, %f0, %o2
	.word	0xad65800d	! t1_kref+0x4dc0:   	movneg	%icc, %o5, %l6
	.word	0x83b50def	! t1_kref+0x4dc4:   	fnands	%f20, %f15, %f1
	.word	0x92dcf0a9	! t1_kref+0x4dc8:   	smulcc	%l3, -0xf57, %o1
	.word	0x150d3749	! t1_kref+0x4dcc:   	sethi	%hi(0x34dd2400), %o2
	.word	0xb1a01904	! t1_kref+0x4dd0:   	fitod	%f4, %f24
	.word	0x9fc00004	! t1_kref+0x4dd4:   	call	%g0 + %g4
	.word	0x9023000b	! t1_kref+0x4dd8:   	sub	%o4, %o3, %o0
	.word	0x29800003	! t1_kref+0x4ddc:   	fbl,a	_kref+0x4de8
	.word	0x90c4c00a	! t1_kref+0x4de0:   	addccc	%l3, %o2, %o0
	.word	0xe81e6000	! t1_kref+0x4de4:   	ldd	[%i1], %l4
	.word	0xa9b00a46	! t1_kref+0x4de8:   	fpadd32	%f0, %f6, %f20
	.word	0xe03e2010	! t1_kref+0x4dec:   	std	%l0, [%i0 + 0x10]
	.word	0x8186c000	! t1_kref+0x4df0:   	wr	%i3, %g0, %y
	.word	0xee566006	! t1_kref+0x4df4:   	ldsh	[%i1 + 6], %l7
	.word	0xa8824015	! t1_kref+0x4df8:   	addcc	%o1, %l5, %l4
	.word	0x39800008	! t1_kref+0x4dfc:   	fbuge,a	_kref+0x4e1c
	.word	0x99a109ce	! t1_kref+0x4e00:   	fdivd	%f4, %f14, %f12
	.word	0xf5262018	! t1_kref+0x4e04:   	st	%f26, [%i0 + 0x18]
	.word	0xac15239b	! t1_kref+0x4e08:   	or	%l4, 0x39b, %l6
	.word	0xd856401b	! t1_kref+0x4e0c:   	ldsh	[%i1 + %i3], %o4
	.word	0xb1b007a2	! t1_kref+0x4e10:   	fpackfix	%f2, %f24
	.word	0x9da01912	! t1_kref+0x4e14:   	fitod	%f18, %f14
	.word	0x98b26865	! t1_kref+0x4e18:   	orncc	%o1, 0x865, %o4
	.word	0x93a01a2c	! t1_kref+0x4e1c:   	fstoi	%f12, %f9
	call	SYM(_kaos_done)
	.word	0x01000000	! t1_kref+0x4e24:   	nop
	KGLOBAL(t1_ktbl_end)
t1_ktbl_end:
t1_ktbl_page_end:

KTEXT_MODULE(t1_module_subr0, 0x6c80e000)
.seg "text"
t1_subr0_page_begin:
	.skip 8184
.global _t1_subr0; ENTRY(t1_subr0)
	.word	0xa6844012	! t1_subr0+0x0:   	addcc	%l1, %l2, %l3
	.word	0x81c3e008	! t1_subr0+0x4:   	retl
	.word	0xaa64c014	! t1_subr0+0x8:   	subc	%l3, %l4, %l5
t1_subr0_page_end:

KTEXT_MODULE(t1_module_subr1, 0x6f86c000)
.seg "text"
t1_subr1_page_begin:
	.skip 8184
.global _t1_subr1; ENTRY(t1_subr1)
	.word	0x9de3bfa0	! t1_subr1+0x0:   	save	%sp, -0x60, %sp
	.word	0xb29eaa5a	! t1_subr1+0x4:   	xorcc	%i2, 0xa5a, %i1
	.word	0x81c7e008	! t1_subr1+0x8:   	ret
	.word	0xa7ee6001	! t1_subr1+0xc:   	restore	%i1, 1, %l3
t1_subr1_page_end:

KTEXT_MODULE(t1_module_subr2, 0x6c60a000)
.seg "text"
t1_subr2_page_begin:
	.skip 8188
.global _t1_subr2; ENTRY(t1_subr2)
	.word	0x9de3bfa0	! t1_subr2+0x0:   	save	%sp, -0x60, %sp
	.word	0xb2066001	! t1_subr2+0x4:   	add	%i1, 1, %i1
	.word	0x81c7e008	! t1_subr2+0x8:   	ret
	.word	0xa3ee6001	! t1_subr2+0xc:   	restore	%i1, 1, %l1
t1_subr2_page_end:

KTEXT_MODULE(t1_module_subr3, 0x6ca5a000)
.seg "text"
t1_subr3_page_begin:
	.skip 8156
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
!  Total operations: 4790  
!
!  Operation frequencies
!
!  name               exp    obs
!  ldsb              0.07   0.02
!  ldub              0.77   0.90
!  ldsh              1.14   1.34
!  lduh              0.41   0.52
!  ld                0.05   0.02
!  ldd               0.69   0.61
!  swap              1.44   1.36
!  ldstub            0.49   0.42
!  stb               0.73   0.54
!  sth               0.06   0.08
!  st                0.26   0.31
!  std               1.10   1.42
!  add               0.97   1.23
!  addcc             1.18   1.19
!  addx              0.44   0.56
!  addxcc            0.96   1.25
!  taddcc            0.12   0.06
!  taddcctv          0.20   0.17
!  sub               0.72   0.81
!  subcc             1.26   1.52
!  subx              0.90   0.96
!  subxcc            0.26   0.31
!  tsubcc            0.24   0.19
!  tsubcctv          0.09   0.10
!  mulscc            0.58   0.63
!  and               0.17   0.13
!  andcc             0.44   0.40
!  andn              0.36   0.35
!  andncc            1.16   1.29
!  or                0.14   0.17
!  orcc              0.53   0.67
!  orn               1.21   1.21
!  orncc             1.21   1.32
!  xor               1.34   1.40
!  xorcc             1.19   1.36
!  xnor              0.31   0.50
!  xnorcc            0.40   0.46
!  sll               0.28   0.35
!  srl               0.86   0.88
!  sra               0.90   1.15
!  unimp             0.01   0.00
!  umul              0.65   0.63
!  smul              0.33   0.17
!  udiv              0.62   0.42
!  sdiv              0.61   0.75
!  umulcc            0.84   1.04
!  smulcc            1.11   1.23
!  udivcc            0.98   1.11
!  sdivcc            1.29   1.44
!  rdy               0.06   0.08
!  wry               0.80   0.98
!  bicc              2.71   2.30
!  sethi             1.38   1.34
!  jmpl              0.50   0.42
!  call              0.57   0.44
!  ticc              0.00   0.00
!  flush             0.13   0.27
!  save              0.29   0.17
!  restore           0.05   0.00
!  stbar             0.58   0.48
!  ldf               1.25   1.38
!  lddf              0.42   0.50
!  stf               1.33   1.29
!  stdf              0.45   0.38
!  fadds             0.71   0.61
!  fsubs             0.15   0.08
!  fmuls             0.63   0.65
!  fdivs             0.92   1.06
!  faddd             0.60   0.52
!  fsubd             0.86   0.98
!  fmuld             0.61   0.77
!  fdivd             1.45   1.11
!  faddq             0.00   0.00
!  fsubq             0.00   0.00
!  fmulq             0.00   0.00
!  fdivq             0.00   0.00
!  fsmuld            0.44   0.50
!  fdmulq            0.00   0.00
!  fitos             1.17   1.38
!  fitod             1.28   1.19
!  fitoq             0.00   0.00
!  fstoi             0.29   0.13
!  fstod             0.66   0.58
!  fstoq             0.00   0.00
!  fdtoi             0.96   1.29
!  fdtos             0.45   0.48
!  fdtoq             0.00   0.00
!  fqtoi             0.00   0.00
!  fqtos             0.00   0.00
!  fqtod             0.00   0.00
!  fmovs             0.88   0.84
!  fnegs             0.36   0.38
!  fabss             0.14   0.19
!  fsqrts            0.71   0.84
!  fsqrtd            0.13   0.10
!  fsqrtq            0.00   0.00
!  fcmps             1.35   1.32
!  fcmpd             1.35   1.23
!  fcmpq             0.00   0.00
!  fcmpes            1.09   1.06
!  fcmped            0.68   0.73
!  fcmpeq            0.00   0.00
!  fbfcc             2.64   2.32
!  ldfsr             0.17   0.00
!  stfsr             0.12   0.17
!  loop              1.44   1.02
!  offset            0.17   0.19
!  area              0.09   0.08
!  target            0.16   0.10
!  goto              0.30   0.23
!  sigsegv           0.08   0.06
!  sigbus            0.02   0.06
!  imodify           0.84   0.56
!  ldfsr_offset      0.18   0.00
!  fpattern          1.37   1.34
!  lbranch           0.26   0.13
!  shmld             0.87   1.06
!  shmst             1.67   1.59
!  shmpf             0.73   0.86
!  shmswap           0.22   0.27
!  shmblkld          0.17   0.13
!  shmblkst          1.33   1.40
!  shmblkchk         0.09   0.02
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
!  casa              0.28   0.19
!  rdasi             0.14   0.10
!  wrasi             0.06   0.02
!  bpcc              2.07   1.71
!  fbpfcc            0.64   0.56
!  fmovscc           0.06   0.06
!  fmovdcc           0.21   0.33
!  fmovqcc           0.00   0.00
!  movcc             0.12   0.21
!  flushw            0.29   0.31
!  membar            0.13   0.13
!  prefetch          0.02   0.02
!  rdpc              0.24   0.23
!  ldqf              0.00   0.00
!  stqf              0.00   0.00
!  ldfa              0.19   0.10
!  lddfa             0.20   0.17
!  ldqfa             0.00   0.00
!  ldsba             0.11   0.15
!  ldsha             0.14   0.21
!  lduba             0.04   0.04
!  lduha             0.21   0.17
!  lda               0.29   0.25
!  ldda              0.03   0.02
!  ldstuba           0.26   0.35
!  prefetcha         0.74   0.58
!  stfa              0.14   0.19
!  stdfa             0.10   0.04
!  stqfa             0.00   0.00
!  stba              0.06   0.04
!  stha              0.28   0.23
!  sta               0.08   0.08
!  stda              0.07   0.06
!  swapa             0.14   0.08
!  fmovd             0.03   0.02
!  fnegd             0.19   0.21
!  fabsd             0.07   0.08
!  fstox             0.27   0.25
!  fdtox             0.19   0.08
!  fxtos             0.25   0.29
!  fxtod             0.09   0.04
!  lds               0.23   0.23
!  ldsa              0.11   0.08
!  ldx               0.02   0.04
!  ldxa              0.01   0.04
!  nofault           0.17   0.13
!  rdgsr             0.21   0.21
!  wrgsr             0.20   0.19
!  fpadd16           0.03   0.06
!  fpadd16s          0.29   0.23
!  fpadd32           0.28   0.27
!  fpadd32s          0.26   0.19
!  fpsub16           0.27   0.21
!  fpsub16s          0.05   0.00
!  fpsub32           0.25   0.31
!  fpsub32s          0.26   0.27
!  fpack16           0.23   0.23
!  fpack32           0.27   0.29
!  fpackfix          0.19   0.25
!  fexpand           0.12   0.17
!  fpmerge           0.06   0.13
!  fmul8x16          0.11   0.10
!  fmul8x16au        0.10   0.04
!  fmul8x16al        0.27   0.19
!  fmul8sux16        0.19   0.23
!  fmul8ulx16        0.16   0.17
!  fmuld8sux16       0.09   0.06
!  fmuld8ulx16       0.28   0.25
!  alignaddr         0.04   0.10
!  alignaddrl        0.27   0.40
!  faligndata        0.10   0.08
!  fzero             0.05   0.04
!  fzeros            0.27   0.25
!  fone              0.29   0.31
!  fones             0.28   0.23
!  fsrc1             0.21   0.25
!  fsrc1s            0.27   0.29
!  fsrc2             0.17   0.21
!  fsrc2s            0.17   0.10
!  fnot1             0.06   0.06
!  fnot1s            0.19   0.19
!  fnot2             0.22   0.21
!  fnot2s            0.09   0.06
!  for               0.08   0.06
!  fors              0.03   0.02
!  fnor              0.25   0.31
!  fnors             0.04   0.00
!  fand              0.28   0.17
!  fands             0.20   0.15
!  fnand             0.25   0.17
!  fnands            0.02   0.02
!  fxor              0.22   0.17
!  fxors             0.09   0.08
!  fxnor             0.03   0.02
!  fxnors            0.25   0.23
!  fornot1           0.28   0.31
!  fornot1s          0.13   0.17
!  fornot2           0.23   0.23
!  fornot2s          0.11   0.15
!  fandnot1          0.03   0.02
!  fandnot1s         0.16   0.17
!  fandnot2          0.07   0.13
!  fandnot2s         0.21   0.21
!  fcmpgt16          0.08   0.06
!  fcmpgt32          0.26   0.23
!  fcmple16          0.16   0.17
!  fcmple32          0.18   0.15
!  fcmpne16          0.28   0.10
!  fcmpne32          0.23   0.23
!  fcmpeq16          0.29   0.25
!  fcmpeq32          0.28   0.38
!  edge8             0.12   0.15
!  edge8l            0.13   0.02
!  edge16            0.08   0.04
!  edge16l           0.13   0.06
!  edge32            0.15   0.15
!  edge32l           0.19   0.33
!  pdist             0.28   0.42
!  partial_st8       0.27   0.31
!  partial_st16      0.23   0.29
!  partial_st32      0.25   0.33
!  short_st8         0.02   0.00
!  short_st16        0.29   0.38
!  short_ld8         0.01   0.00
!  short_ld16        0.01   0.02
!  blkld             0.14   0.00
!  blkst             0.18   0.00
!  blkld_offset      0.09   0.00
!  blkst_offset      0.16   0.00
!  blk_check         0.19   0.17
!  casxa             0.03   0.04
!  rdccr             0.26   0.31
!  rdfprs            0.26   0.42
!  wrccr             0.27   0.23
!  popc              0.08   0.08
!  wrfprs            0.24   0.27
!  stx               0.22   0.23
!  stxa              0.04   0.13
!  cflush            0.00   0.00
!  array8            0.17   0.23
!  array16           0.27   0.15
!  array32           0.02   0.02
!  edge8n            0.12   0.08
!  edge8ln           0.02   0.04
!  edge16n           0.21   0.33
!  edge16ln          0.16   0.10
!  edge32n           0.27   0.23
!  edge32ln          0.23   0.38
!  bmask             0.03   0.00
!  bshuffle          0.23   0.13
!  siam              0.03   0.00
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
KDATA_MODULE(t1_module_offset_table, 0x5e716000)
.seg "data"
t1_offset_table_start:
t1_offset_table_size:	.word	0x00000008
t1_offset_table:
	.word	0xffffffe8
	.word	0xfffffff0
	.word	0x00000008
	.word	0x00000010
	.word	0xfffffff8
	.word	0xffffffe0
	.word	0x00000000
	.word	0x00000018
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

KDATA_MODULE(t1_module_data_in_regs, 0x405ae000)
.seg "data"
KGLOBAL(t1_data_in_regs)
t1_data_in_regs_start:
t1_data_in_regs:
	.word	0xfcfe7772          ! %f0
	.word	0x1e527329          ! %f1
	.word	0x6e82008e          ! %f2
	.word	0xe7674aa6          ! %f3
	.word	0x0fc37187          ! %f4
	.word	0x0f4ffd8b          ! %f5
	.word	0x8b0476d6          ! %f6
	.word	0xa33771c1          ! %f7
	.word	0x9b31222a          ! %f8
	.word	0x7aef0b4b          ! %f9
	.word	0x97cccc35          ! %f10
	.word	0x32084e5e          ! %f11
	.word	0x12b86c29          ! %f12
	.word	0x8a8970f4          ! %f13
	.word	0x51a39bc7          ! %f14
	.word	0x0ee8df07          ! %f15
	.word	0xc11b8fed          ! %f16
	.word	0x9dfc8ccd          ! %f17
	.word	0xcdd0e104          ! %f18
	.word	0x095524a4          ! %f19
	.word	0x8256e3ca          ! %f20
	.word	0x4ecb3aa3          ! %f21
	.word	0x0142da35          ! %f22
	.word	0x1b28c5d9          ! %f23
	.word	0x32ec3d97          ! %f24
	.word	0x4084bfcb          ! %f25
	.word	0x001c1e24          ! %f26
	.word	0x398e04ad          ! %f27
	.word	0x0182e181          ! %f28
	.word	0x95dff366          ! %f29
	.word	0x5720d913          ! %f30
	.word	0x5633ea6b          ! %f31
	.word	0xcc970a1c          ! %f32
	.word	0x532a26e6          ! %f33
	.word	0x6b8664ee          ! %f34
	.word	0x1560cdcc          ! %f35
	.word	0x2e115dba          ! %f36
	.word	0x629d92d1          ! %f37
	.word	0x3627b0c3          ! %f38
	.word	0x8f249755          ! %f39
	.word	0xab4fe500          ! %f40
	.word	0xbe2b4bc5          ! %f41
	.word	0xd8542b71          ! %f42
	.word	0x084067fe          ! %f43
	.word	0x66af56b5          ! %f44
	.word	0x208103bb          ! %f45
	.word	0x4996259f          ! %f46
	.word	0x108f8614          ! %f47
	.word	0x713cccdd          ! %f48
	.word	0xbcd31b8f          ! %f49
	.word	0xc228def0          ! %f50
	.word	0x2b17b45f          ! %f51
	.word	0x95253706          ! %f52
	.word	0xce77c8bf          ! %f53
	.word	0x0ca5b274          ! %f54
	.word	0xbda55787          ! %f55
	.word	0xd4f91de1          ! %f56
	.word	0x4ee85372          ! %f57
	.word	0xc5f31661          ! %f58
	.word	0xd53a0db3          ! %f59
	.word	0x6e308c13          ! %f60
	.word	0x0689b0bc          ! %f61
	.word	0xebf76302          ! %f62
	.word	0x87da9c72          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t1_kref+0x234       ! %g1 (code pointer)
	.word	t1_data_in_shm_area ! %g2 (shared area pointer)
	.word	0x020ae83f          ! %g3 (loop index)
	.word	SYM(t1_subr1)       ! %g4 (jmpl target)
	.word	t1_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x3e7546f7          ! %o0
	.word	0xe446fb4d          ! %o1
	.word	0x31881c78          ! %o2
	.word	0xe359a56c          ! %o3
	.word	0x290def28          ! %o4
	.word	0x788c4d72          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x87c4304d          ! %l0
	.word	0x3aedfd20          ! %l1
	.word	0x4d3c94ee          ! %l2
	.word	0xbdb358de          ! %l3
	.word	0xc56e0c99          ! %l4
	.word	0xf8549b55          ! %l5
	.word	0x44d17e7d          ! %l6
	.word	0xb1586dfe          ! %l7
	.word	t1_data_in_area0    ! %i0 (area pointer)
	.word	t1_data_in_area0    ! %i1 (area pointer)
	.word	0xfffffff2          ! %i2 (byte offset)
	.word	0x0000001c          ! %i3 (halfword offset)
	.word	0x0000000c          ! %i4 (word offset)
	.word	0xfffffff8          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0xbd78020f          ! %y
	.word	0x00000007          ! %icc (nzvc)
	.word	0x8000067b          ! %fsr
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

KDATA_MODULE(t1_module_data_in_stack, 0x433ea000)
.seg "data"
KGLOBAL(t1_data_in_mtbl_size)
KGLOBAL(t1_data_in_mtbl)
KGLOBAL(t1_data_in_stack)
t1_data_in_stack_start:
	.word	0x718d52dc
	.word	0xd5686a54
	.word	0xcdbb4fed
	.word	0xbac8c99f
	.word	0xcd866cb7
	.word	0x963598e4
	.word	0x95165a8d
	.word	0x4b445f60
	.word	0x4e9456ac
	.word	0x3caa6b44
	.word	0xd75682f7
	.word	0xe5389eac
	.word	0x8b0ad870
	.word	0x83a04caf
	.word	0x409936e9
	.word	0x4fb05761
	.word	0xad24d4bd
	.word	0x35ceadf9
	.word	0x698c4298
	.word	0x3d56827e
	.word	0x387caa8a
	.word	0x1d5120ac
	.word	0x8d19b707
	.word	0x4506cbe6
	.word	0xb40cf57c
	.word	0x15d18074
	.word	0x05bb619b
	.word	0xd0367463
	.word	0x3b98619b
	.word	0x7fe0cebc
	.word	0xf2d5a8ef
	.word	0x907acfed
	.word	0xbe0e8648
	.word	0xdf8fa498
	.word	0x6c22e2e5
	.word	0x8602e42b
	.word	0x9d6efc6e
	.word	0x86015ee5
	.word	0xd83577fd
	.word	0x2a2deb39
	.word	0x8f0b23f8
	.word	0xc3c368ae
	.word	0x14a867e9
	.word	0xb3c0beab
	.word	0xc41a4c82
	.word	0xea6447d1
	.word	0xb7fb0360
	.word	0xb1d86ed1
	.word	0x419b3552
	.word	0xdd5c4fe1
	.word	0x778def32
	.word	0xf7d88a3c
	.word	0xceb91889
	.word	0xc7141f4e
	.word	0xa504c49c
	.word	0x5b77d981
	.word	0x6199b595
	.word	0xc4f34ac3
	.word	0x56b0e2dd
	.word	0x6ef6933c
	.word	0x86dd0ee9
	.word	0xb723dacf
	.word	0x8bdf4608
	.word	0xc8b54c57
	.word	0xef6ecef0
	.word	0x6c5d7fc6
	.word	0xf12c771c
	.word	0xaf14288b
	.word	0x55d4883e
	.word	0xd9d59fe9
	.word	0x9f9ee951
	.word	0x07f60f27
	.word	0xf7234508
	.word	0x119fa3c4
	.word	0xac7958b4
	.word	0x1ebbe810
	.word	0x4f7a19d6
	.word	0xf89b24d7
	.word	0xd4bbfdf5
	.word	0x5e482508
	.word	0xfd86af76
	.word	0xfec3e278
	.word	0x4764ab7f
	.word	0x2edb1b32
	.word	0x2f73f833
	.word	0x1b91a0f7
	.word	0x29eb27c9
	.word	0x359cf0d5
	.word	0xc4f28447
	.word	0x3a545703
	.word	0x1c7858eb
	.word	0xb5b22360
	.word	0x190d298d
	.word	0xea5b4d4b
	.word	0xc42c1574
	.word	0x8503e9ad
	.word	0xd273f27a
	.word	0x427c1468
	.word	0x52aeae7a
	.word	0x29b5f689
	.word	0x0512884e
	.word	0x517874f9
	.word	0x908886f1
	.word	0x4cd75f74
	.word	0xab668c86
	.word	0x6b10be0f
	.word	0x1c8b4c40
	.word	0xc374aba4
	.word	0x0c5d9594
	.word	0x068215cb
	.word	0x333da411
	.word	0x4d0d4f50
	.word	0xfac9c2d1
	.word	0x7d06b046
	.word	0x4ef36368
	.word	0x9dcf172a
	.word	0x28f71bb2
	.word	0xafe810b0
	.word	0x8949a2f7
	.word	0xf01e482c
	.word	0xacdb2e3a
	.word	0xc411b8bb
	.word	0xaa5f44af
	.word	0xc4197797
	.word	0x9afba0af
	.word	0xa714ea39
	.word	0xe697be9a
	.word	0x81345f38
	.word	0x96bfaa90
	.word	0xcd745f03
	.word	0x2a3f3ee7
	.word	0xbdf531ed
	.word	0xd9aba8c5
	.word	0x86191b1d
	.word	0x88447d46
	.word	0x28943467
	.word	0x6f454118
	.word	0xb93fbd17
	.word	0x8fadcd76
	.word	0x90f59e30
	.word	0xdc51c8e3
	.word	0xf43ff0b5
	.word	0x67b4471b
	.word	0xd57206ef
	.word	0xb507e30b
	.word	0x2585e7d2
	.word	0x25c916d4
	.word	0x6061e3ea
	.word	0x91e8892c
	.word	0x6f2ffd80
	.word	0xb8764c8d
	.word	0x30a4d9cd
	.word	0x9d82f415
	.word	0x6940e774
	.word	0x6f4dbb11
	.word	0xcba5e6a9
	.word	0x91aa1776
	.word	0x207919a1
	.word	0xe02dbce2
	.word	0xefe9a83e
	.word	0x4fd9a4d8
	.word	0x0af04022
	.word	0x064cf24c
	.word	0xec44427d
	.word	0x69f3c9cc
	.word	0x29b1f35c
	.word	0xa4fb4cb7
	.word	0x65a8aa47
t1_data_in_sp:
	.word	0x7d601d67
	.word	0x1d2f0a63
	.word	0x7817fb3d
	.word	0x5c5b587b
	.word	0x762770ed
	.word	0x33872f9d
	.word	0xa4210c7c
	.word	0xf56ea92f
	.word	t1_data_in_area0
	.word	t1_data_in_area0
	.word	0x00000016
	.word	0xfffffffc
	.word	0xfffffff8
	.word	0xfffffff8
	.word	t1_data_in_fp
	.word	0x765e1a70
	.word	0xdfda8ef3
	.word	0x298c6400
	.word	0x4f4e8a81
	.word	0x61f1beb5
	.word	0xdaa064f7
	.word	0x5c6bcb5e
	.word	0xbfb2e50b
	.word	0xe56ce78a
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
	.word   	0x58a35fb5	! [%fp - 0xc]
	.word   	0x828e0409	! [%fp - 0x8]
	.word   	0xc33982fa	! [%fp - 0x4]
.global t1_data_in_fp; t1_data_in_fp:
	.word	0x40fc7c4b
	.word	0x5039a691
	.word	0x428d1402
	.word	0x18b9ff8b
	.word	0x9f6a82bf
	.word	0x3365c9ad
	.word	0xbd7ca15e
	.word	0x4cd2501a
	.word	0x6c3c737c
	.word	0x5ec2887d
	.word	0x0626774c
	.word	0xf5dcfed8
	.word	0x4a37f089
	.word	0xe34bed9a
	.word	0x3a1bd756
	.word	0xd203dcba
	.word	0x5229c245
	.word	0xe27dd3d7
	.word	0x2cb41ae7
	.word	0xb8775eb4
	.word	0x89253e88
	.word	0x2b2d2892
	.word	0x5e95690c
	.word	0x5aa21a27
t1_data_in_stacktop:
	.word	0
t1_data_in_stack_end:
.skip 6300	! page align

KDATA_MODULE(t1_module_data_in_area0, 0x48c8a000)
.seg "data"
t1_data_in_area0_start:
.skip 6336
t1_data_in_area0_begin:
	.word	0xb8307e07	! t1_data_in_area0-0x20
	.word	0xb6027f4b	! t1_data_in_area0-0x1c
	.word	0x82ec847e	! t1_data_in_area0-0x18
	.word	0x83b31497	! t1_data_in_area0-0x14
	.word	0x4fb403fc	! t1_data_in_area0-0x10
	.word	0x8fd1ca7a	! t1_data_in_area0-0xc
	.word	0x5244f5e0	! t1_data_in_area0-0x8
	.word	0x0350daa0	! t1_data_in_area0-0x4
.global t1_data_in_area0; t1_data_in_area0:
	.word	0xfd4abc06	! t1_data_in_area0+0x0
	.word	0x47744d9c	! t1_data_in_area0+0x4
	.word	0xa2431644	! t1_data_in_area0+0x8
	.word	0x16f2922a	! t1_data_in_area0+0xc
	.word	0x6cf9724d	! t1_data_in_area0+0x10
	.word	0x01871c8e	! t1_data_in_area0+0x14
	.word	0x2d95bdf3	! t1_data_in_area0+0x18
	.word	0xc37b7bdb	! t1_data_in_area0+0x1c
t1_data_in_area0_end:
.skip 1792
t1_data_in_area0_stop:

KDATA_MODULE(t1_module_data_in_shm_area, 0x5ea50000)
.seg "data"
t1_data_in_shm_area_start:
t1_data_in_shm_area_begin:
.global t1_data_in_shm_area; t1_data_in_shm_area:
	.word	0x237c2342	! t1_data_in_shm_area+0x0 (t0)
	.word	0x15a329e9	! t1_data_in_shm_area+0x4 (t1)
	.word	0x0c41812f	! t1_data_in_shm_area+0x8 (t0)
	.word	0x67c1bc1f	! t1_data_in_shm_area+0xc (t1)
	.word	0x38ff35dc	! t1_data_in_shm_area+0x10 (t0)
	.word	0xb08d9b6d	! t1_data_in_shm_area+0x14 (t1)
	.word	0x4b3cf95c	! t1_data_in_shm_area+0x18 (t0)
	.word	0xa98897cd	! t1_data_in_shm_area+0x1c (t1)
	.word	0xe5dd94e4	! t1_data_in_shm_area+0x20 (t0)
	.word	0x4e01f584	! t1_data_in_shm_area+0x24 (t1)
	.word	0x58ab2a75	! t1_data_in_shm_area+0x28 (t0)
	.word	0x18bdb7e0	! t1_data_in_shm_area+0x2c (t1)
	.word	0x711529ad	! t1_data_in_shm_area+0x30 (t0)
	.word	0xc92476ae	! t1_data_in_shm_area+0x34 (t1)
	.word	0x6dd2e741	! t1_data_in_shm_area+0x38 (t0)
	.word	0xe9a76180	! t1_data_in_shm_area+0x3c (t1)
	.word	0x6cbd8f96	! t1_data_in_shm_area+0x40 (t0 bload)
	.word	0x4c18553e	! t1_data_in_shm_area+0x44
	.word	0x291c6453	! t1_data_in_shm_area+0x48
	.word	0x68db34f3	! t1_data_in_shm_area+0x4c
	.word	0xed691b98	! t1_data_in_shm_area+0x50
	.word	0xb4d1a6d5	! t1_data_in_shm_area+0x54
	.word	0xc78f55e1	! t1_data_in_shm_area+0x58
	.word	0x53b004f3	! t1_data_in_shm_area+0x5c
	.word	0x6d54736d	! t1_data_in_shm_area+0x60
	.word	0x629dc9c9	! t1_data_in_shm_area+0x64
	.word	0x546a97ad	! t1_data_in_shm_area+0x68
	.word	0x96a876e3	! t1_data_in_shm_area+0x6c
	.word	0x082b5ead	! t1_data_in_shm_area+0x70
	.word	0x40c29238	! t1_data_in_shm_area+0x74
	.word	0xf8ee7546	! t1_data_in_shm_area+0x78
	.word	0x0a7b2f6c	! t1_data_in_shm_area+0x7c
	.word	0xd10be619	! t1_data_in_shm_area+0x80 (t0 bstore)
	.word	0x543da250	! t1_data_in_shm_area+0x84
	.word	0x433b90a5	! t1_data_in_shm_area+0x88
	.word	0xf566fa61	! t1_data_in_shm_area+0x8c
	.word	0xcfafb4f0	! t1_data_in_shm_area+0x90
	.word	0x45445313	! t1_data_in_shm_area+0x94
	.word	0x299915a1	! t1_data_in_shm_area+0x98
	.word	0x8940eb24	! t1_data_in_shm_area+0x9c
	.word	0xf1b9bb80	! t1_data_in_shm_area+0xa0
	.word	0x15d2e559	! t1_data_in_shm_area+0xa4
	.word	0x132630a8	! t1_data_in_shm_area+0xa8
	.word	0x8d999f48	! t1_data_in_shm_area+0xac
	.word	0x9da2e6ff	! t1_data_in_shm_area+0xb0
	.word	0xad0f3f1b	! t1_data_in_shm_area+0xb4
	.word	0x599fbcac	! t1_data_in_shm_area+0xb8
	.word	0x30218777	! t1_data_in_shm_area+0xbc
	.word	0x81c2363d	! t1_data_in_shm_area+0xc0 (t1 bload)
	.word	0x7141413d	! t1_data_in_shm_area+0xc4
	.word	0xb51ee4b3	! t1_data_in_shm_area+0xc8
	.word	0x55a7d712	! t1_data_in_shm_area+0xcc
	.word	0x9fd864cf	! t1_data_in_shm_area+0xd0
	.word	0x3eac2bd0	! t1_data_in_shm_area+0xd4
	.word	0xaa972f3b	! t1_data_in_shm_area+0xd8
	.word	0x90ab3fad	! t1_data_in_shm_area+0xdc
	.word	0x9207c8f2	! t1_data_in_shm_area+0xe0
	.word	0x7447daf4	! t1_data_in_shm_area+0xe4
	.word	0x36e874d2	! t1_data_in_shm_area+0xe8
	.word	0xb3b4653f	! t1_data_in_shm_area+0xec
	.word	0x2c12c301	! t1_data_in_shm_area+0xf0
	.word	0x802ff499	! t1_data_in_shm_area+0xf4
	.word	0x29dd450a	! t1_data_in_shm_area+0xf8
	.word	0x57953570	! t1_data_in_shm_area+0xfc
	.word	0xdd738bdc	! t1_data_in_shm_area+0x100 (t1 bstore)
	.word	0x9192ed57	! t1_data_in_shm_area+0x104
	.word	0xf7753d0b	! t1_data_in_shm_area+0x108
	.word	0x8260fdd1	! t1_data_in_shm_area+0x10c
	.word	0x05068f0f	! t1_data_in_shm_area+0x110
	.word	0x9666c1c4	! t1_data_in_shm_area+0x114
	.word	0xcdc9684e	! t1_data_in_shm_area+0x118
	.word	0x5549b750	! t1_data_in_shm_area+0x11c
	.word	0xf0fdc333	! t1_data_in_shm_area+0x120
	.word	0x0b9f710a	! t1_data_in_shm_area+0x124
	.word	0x86cf69a5	! t1_data_in_shm_area+0x128
	.word	0x9b4214f4	! t1_data_in_shm_area+0x12c
	.word	0xd906a494	! t1_data_in_shm_area+0x130
	.word	0xe5ba0cb3	! t1_data_in_shm_area+0x134
	.word	0x0b37b07e	! t1_data_in_shm_area+0x138
	.word	0x982549c5	! t1_data_in_shm_area+0x13c
t1_data_in_shm_area_end:
t1_data_in_shm_area_stop:

KDATA_MODULE(t1_module_data_exp_regs, 0x44804000)
.seg "data"
KGLOBAL(t1_data_exp_regs)
t1_data_exp_regs_start:
t1_data_exp_regs:
	.word	0xfcfe7772          ! %f0
	.word	0x1e527329          ! %f1
	.word	0x6e82008e          ! %f2
	.word	0xe7674aa6          ! %f3
	.word	0x0fc37187          ! %f4
	.word	0x0f4ffd8b          ! %f5
	.word	0x8b0476d6          ! %f6
	.word	0xa33771c1          ! %f7
	.word	0x9b31222a          ! %f8
	.word	0x7aef0b4b          ! %f9
	.word	0x97cccc35          ! %f10
	.word	0x32084e5e          ! %f11
	.word	0x12b86c29          ! %f12
	.word	0x8a8970f4          ! %f13
	.word	0x51a39bc7          ! %f14
	.word	0x0ee8df07          ! %f15
	.word	0xc11b8fed          ! %f16
	.word	0x9dfc8ccd          ! %f17
	.word	0xcdd0e104          ! %f18
	.word	0x095524a4          ! %f19
	.word	0x8256e3ca          ! %f20
	.word	0x4ecb3aa3          ! %f21
	.word	0x0142da35          ! %f22
	.word	0x1b28c5d9          ! %f23
	.word	0x32ec3d97          ! %f24
	.word	0x4084bfcb          ! %f25
	.word	0x001c1e24          ! %f26
	.word	0x398e04ad          ! %f27
	.word	0x0182e181          ! %f28
	.word	0x95dff366          ! %f29
	.word	0x5720d913          ! %f30
	.word	0x5633ea6b          ! %f31
	.word	0xcc970a1c          ! %f32
	.word	0x532a26e6          ! %f33
	.word	0x6b8664ee          ! %f34
	.word	0x1560cdcc          ! %f35
	.word	0x2e115dba          ! %f36
	.word	0x629d92d1          ! %f37
	.word	0x3627b0c3          ! %f38
	.word	0x8f249755          ! %f39
	.word	0xab4fe500          ! %f40
	.word	0xbe2b4bc5          ! %f41
	.word	0xd8542b71          ! %f42
	.word	0x084067fe          ! %f43
	.word	0x66af56b5          ! %f44
	.word	0x208103bb          ! %f45
	.word	0x4996259f          ! %f46
	.word	0x108f8614          ! %f47
	.word	0x713cccdd          ! %f48
	.word	0xbcd31b8f          ! %f49
	.word	0xc228def0          ! %f50
	.word	0x2b17b45f          ! %f51
	.word	0x95253706          ! %f52
	.word	0xce77c8bf          ! %f53
	.word	0x0ca5b274          ! %f54
	.word	0xbda55787          ! %f55
	.word	0xd4f91de1          ! %f56
	.word	0x4ee85372          ! %f57
	.word	0xc5f31661          ! %f58
	.word	0xd53a0db3          ! %f59
	.word	0x6e308c13          ! %f60
	.word	0x0689b0bc          ! %f61
	.word	0xebf76302          ! %f62
	.word	0x87da9c72          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t1_kref+0x234       ! %g1 (code pointer)
	.word	t1_data_exp_shm_area! %g2 (shared area pointer)
	.word	0x020ae83f          ! %g3 (loop index)
	.word	SYM(t1_subr1)       ! %g4 (jmpl target)
	.word	t1_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x3e7546f7          ! %o0
	.word	0xe446fb4d          ! %o1
	.word	0x31881c78          ! %o2
	.word	0xe359a56c          ! %o3
	.word	0x290def28          ! %o4
	.word	0x788c4d72          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x87c4304d          ! %l0
	.word	0x3aedfd20          ! %l1
	.word	0x4d3c94ee          ! %l2
	.word	0xbdb358de          ! %l3
	.word	0xc56e0c99          ! %l4
	.word	0xf8549b55          ! %l5
	.word	0x44d17e7d          ! %l6
	.word	0xb1586dfe          ! %l7
	.word	t1_data_exp_area0   ! %i0 (area pointer)
	.word	t1_data_exp_area0   ! %i1 (area pointer)
	.word	0xfffffff2          ! %i2 (byte offset)
	.word	0x0000001c          ! %i3 (halfword offset)
	.word	0x0000000c          ! %i4 (word offset)
	.word	0xfffffff8          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0xbd78020f          ! %y
	.word	0x00000007          ! %icc (nzvc)
	.word	0x8000067b          ! %fsr
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

KDATA_MODULE(t1_module_data_exp_stack, 0x427a2000)
.seg "data"
KGLOBAL(t1_data_exp_mtbl_size)
KGLOBAL(t1_data_exp_mtbl)
KGLOBAL(t1_data_exp_stack)
t1_data_exp_stack_start:
	.word	0x718d52dc
	.word	0xd5686a54
	.word	0xcdbb4fed
	.word	0xbac8c99f
	.word	0xcd866cb7
	.word	0x963598e4
	.word	0x95165a8d
	.word	0x4b445f60
	.word	0x4e9456ac
	.word	0x3caa6b44
	.word	0xd75682f7
	.word	0xe5389eac
	.word	0x8b0ad870
	.word	0x83a04caf
	.word	0x409936e9
	.word	0x4fb05761
	.word	0xad24d4bd
	.word	0x35ceadf9
	.word	0x698c4298
	.word	0x3d56827e
	.word	0x387caa8a
	.word	0x1d5120ac
	.word	0x8d19b707
	.word	0x4506cbe6
	.word	0xb40cf57c
	.word	0x15d18074
	.word	0x05bb619b
	.word	0xd0367463
	.word	0x3b98619b
	.word	0x7fe0cebc
	.word	0xf2d5a8ef
	.word	0x907acfed
	.word	0xbe0e8648
	.word	0xdf8fa498
	.word	0x6c22e2e5
	.word	0x8602e42b
	.word	0x9d6efc6e
	.word	0x86015ee5
	.word	0xd83577fd
	.word	0x2a2deb39
	.word	0x8f0b23f8
	.word	0xc3c368ae
	.word	0x14a867e9
	.word	0xb3c0beab
	.word	0xc41a4c82
	.word	0xea6447d1
	.word	0xb7fb0360
	.word	0xb1d86ed1
	.word	0x419b3552
	.word	0xdd5c4fe1
	.word	0x778def32
	.word	0xf7d88a3c
	.word	0xceb91889
	.word	0xc7141f4e
	.word	0xa504c49c
	.word	0x5b77d981
	.word	0x6199b595
	.word	0xc4f34ac3
	.word	0x56b0e2dd
	.word	0x6ef6933c
	.word	0x86dd0ee9
	.word	0xb723dacf
	.word	0x8bdf4608
	.word	0xc8b54c57
	.word	0xef6ecef0
	.word	0x6c5d7fc6
	.word	0xf12c771c
	.word	0xaf14288b
	.word	0x55d4883e
	.word	0xd9d59fe9
	.word	0x9f9ee951
	.word	0x07f60f27
	.word	0xf7234508
	.word	0x119fa3c4
	.word	0xac7958b4
	.word	0x1ebbe810
	.word	0x4f7a19d6
	.word	0xf89b24d7
	.word	0xd4bbfdf5
	.word	0x5e482508
	.word	0xfd86af76
	.word	0xfec3e278
	.word	0x4764ab7f
	.word	0x2edb1b32
	.word	0x2f73f833
	.word	0x1b91a0f7
	.word	0x29eb27c9
	.word	0x359cf0d5
	.word	0xc4f28447
	.word	0x3a545703
	.word	0x1c7858eb
	.word	0xb5b22360
	.word	0x190d298d
	.word	0xea5b4d4b
	.word	0xc42c1574
	.word	0x8503e9ad
	.word	0xd273f27a
	.word	0x427c1468
	.word	0x52aeae7a
	.word	0x29b5f689
	.word	0x0512884e
	.word	0x517874f9
	.word	0x908886f1
	.word	0x4cd75f74
	.word	0xab668c86
	.word	0x6b10be0f
	.word	0x1c8b4c40
	.word	0xc374aba4
	.word	0x0c5d9594
	.word	0x068215cb
	.word	0x333da411
	.word	0x4d0d4f50
	.word	0xfac9c2d1
	.word	0x7d06b046
	.word	0x4ef36368
	.word	0x9dcf172a
	.word	0x28f71bb2
	.word	0xafe810b0
	.word	0x8949a2f7
	.word	0xf01e482c
	.word	0xacdb2e3a
	.word	0xc411b8bb
	.word	0xaa5f44af
	.word	0xc4197797
	.word	0x9afba0af
	.word	0xa714ea39
	.word	0xe697be9a
	.word	0x81345f38
	.word	0x96bfaa90
	.word	0xcd745f03
	.word	0x2a3f3ee7
	.word	0xbdf531ed
	.word	0xd9aba8c5
	.word	0x86191b1d
	.word	0x88447d46
	.word	0x28943467
	.word	0x6f454118
	.word	0xb93fbd17
	.word	0x8fadcd76
	.word	0x90f59e30
	.word	0xdc51c8e3
	.word	0xf43ff0b5
	.word	0x67b4471b
	.word	0xd57206ef
	.word	0xb507e30b
	.word	0x2585e7d2
	.word	0x25c916d4
	.word	0x6061e3ea
	.word	0x91e8892c
	.word	0x6f2ffd80
	.word	0xb8764c8d
	.word	0x30a4d9cd
	.word	0x9d82f415
	.word	0x6940e774
	.word	0x6f4dbb11
	.word	0xcba5e6a9
	.word	0x91aa1776
	.word	0x207919a1
	.word	0xe02dbce2
	.word	0xefe9a83e
	.word	0x4fd9a4d8
	.word	0x0af04022
	.word	0x064cf24c
	.word	0xec44427d
	.word	0x69f3c9cc
	.word	0x29b1f35c
	.word	0xa4fb4cb7
	.word	0x65a8aa47
t1_data_exp_sp:
	.word	0x7d601d67
	.word	0x1d2f0a63
	.word	0x7817fb3d
	.word	0x5c5b587b
	.word	0x762770ed
	.word	0x33872f9d
	.word	0xa4210c7c
	.word	0xf56ea92f
	.word	t1_data_exp_area0
	.word	t1_data_exp_area0
	.word	0x00000016
	.word	0xfffffffc
	.word	0xfffffff8
	.word	0xfffffff8
	.word	t1_data_exp_fp
	.word	0x765e1a70
	.word	0xdfda8ef3
	.word	0x298c6400
	.word	0x4f4e8a81
	.word	0x61f1beb5
	.word	0xdaa064f7
	.word	0x5c6bcb5e
	.word	0xbfb2e50b
	.word	0xe56ce78a
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
	.word   	0x58a35fb5	! [%fp - 0xc]
	.word   	0x828e0409	! [%fp - 0x8]
	.word   	0xc33982fa	! [%fp - 0x4]
t1_data_exp_fp:
	.word	0x40fc7c4b
	.word	0x5039a691
	.word	0x428d1402
	.word	0x18b9ff8b
	.word	0x9f6a82bf
	.word	0x3365c9ad
	.word	0xbd7ca15e
	.word	0x4cd2501a
	.word	0x6c3c737c
	.word	0x5ec2887d
	.word	0x0626774c
	.word	0xf5dcfed8
	.word	0x4a37f089
	.word	0xe34bed9a
	.word	0x3a1bd756
	.word	0xd203dcba
	.word	0x5229c245
	.word	0xe27dd3d7
	.word	0x2cb41ae7
	.word	0xb8775eb4
	.word	0x89253e88
	.word	0x2b2d2892
	.word	0x5e95690c
	.word	0x5aa21a27
t1_data_exp_stacktop:
	.word	0
t1_data_exp_stack_end:
.skip 6300	! page align

KDATA_MODULE(t1_module_data_exp_area0, 0x62504000)
.seg "data"
t1_data_exp_area0_start:
.skip 6336
t1_data_exp_area0_begin:
	.word	0xb8307e07	! t1_data_exp_area0-0x20
	.word	0xb6027f4b	! t1_data_exp_area0-0x1c
	.word	0x82ec847e	! t1_data_exp_area0-0x18
	.word	0x83b31497	! t1_data_exp_area0-0x14
	.word	0x4fb403fc	! t1_data_exp_area0-0x10
	.word	0x8fd1ca7a	! t1_data_exp_area0-0xc
	.word	0x5244f5e0	! t1_data_exp_area0-0x8
	.word	0x0350daa0	! t1_data_exp_area0-0x4
.global t1_data_exp_area0; t1_data_exp_area0:
	.word	0xfd4abc06	! t1_data_exp_area0+0x0
	.word	0x47744d9c	! t1_data_exp_area0+0x4
	.word	0xa2431644	! t1_data_exp_area0+0x8
	.word	0x16f2922a	! t1_data_exp_area0+0xc
	.word	0x6cf9724d	! t1_data_exp_area0+0x10
	.word	0x01871c8e	! t1_data_exp_area0+0x14
	.word	0x2d95bdf3	! t1_data_exp_area0+0x18
	.word	0xc37b7bdb	! t1_data_exp_area0+0x1c
t1_data_exp_area0_end:
.skip 1792
t1_data_exp_area0_stop:

KDATA_MODULE(t1_module_data_exp_shm_area, 0x7f4f2000)
.seg "data"
t1_data_exp_shm_area_start:
t1_data_exp_shm_area_begin:
.global t1_data_exp_shm_area; t1_data_exp_shm_area:
	.word	0x237c2342	! t1_data_exp_shm_area+0x0 (t0)
	.word	0x15a329e9	! t1_data_exp_shm_area+0x4 (t1)
	.word	0x0c41812f	! t1_data_exp_shm_area+0x8 (t0)
	.word	0x67c1bc1f	! t1_data_exp_shm_area+0xc (t1)
	.word	0x38ff35dc	! t1_data_exp_shm_area+0x10 (t0)
	.word	0xb08d9b6d	! t1_data_exp_shm_area+0x14 (t1)
	.word	0x4b3cf95c	! t1_data_exp_shm_area+0x18 (t0)
	.word	0xa98897cd	! t1_data_exp_shm_area+0x1c (t1)
	.word	0xe5dd94e4	! t1_data_exp_shm_area+0x20 (t0)
	.word	0x4e01f584	! t1_data_exp_shm_area+0x24 (t1)
	.word	0x58ab2a75	! t1_data_exp_shm_area+0x28 (t0)
	.word	0x18bdb7e0	! t1_data_exp_shm_area+0x2c (t1)
	.word	0x711529ad	! t1_data_exp_shm_area+0x30 (t0)
	.word	0xc92476ae	! t1_data_exp_shm_area+0x34 (t1)
	.word	0x6dd2e741	! t1_data_exp_shm_area+0x38 (t0)
	.word	0xe9a76180	! t1_data_exp_shm_area+0x3c (t1)
	.word	0x6cbd8f96	! t1_data_exp_shm_area+0x40 (t0 bload)
	.word	0x4c18553e	! t1_data_exp_shm_area+0x44
	.word	0x291c6453	! t1_data_exp_shm_area+0x48
	.word	0x68db34f3	! t1_data_exp_shm_area+0x4c
	.word	0xed691b98	! t1_data_exp_shm_area+0x50
	.word	0xb4d1a6d5	! t1_data_exp_shm_area+0x54
	.word	0xc78f55e1	! t1_data_exp_shm_area+0x58
	.word	0x53b004f3	! t1_data_exp_shm_area+0x5c
	.word	0x6d54736d	! t1_data_exp_shm_area+0x60
	.word	0x629dc9c9	! t1_data_exp_shm_area+0x64
	.word	0x546a97ad	! t1_data_exp_shm_area+0x68
	.word	0x96a876e3	! t1_data_exp_shm_area+0x6c
	.word	0x082b5ead	! t1_data_exp_shm_area+0x70
	.word	0x40c29238	! t1_data_exp_shm_area+0x74
	.word	0xf8ee7546	! t1_data_exp_shm_area+0x78
	.word	0x0a7b2f6c	! t1_data_exp_shm_area+0x7c
	.word	0xd10be619	! t1_data_exp_shm_area+0x80 (t0 bstore)
	.word	0x543da250	! t1_data_exp_shm_area+0x84
	.word	0x433b90a5	! t1_data_exp_shm_area+0x88
	.word	0xf566fa61	! t1_data_exp_shm_area+0x8c
	.word	0xcfafb4f0	! t1_data_exp_shm_area+0x90
	.word	0x45445313	! t1_data_exp_shm_area+0x94
	.word	0x299915a1	! t1_data_exp_shm_area+0x98
	.word	0x8940eb24	! t1_data_exp_shm_area+0x9c
	.word	0xf1b9bb80	! t1_data_exp_shm_area+0xa0
	.word	0x15d2e559	! t1_data_exp_shm_area+0xa4
	.word	0x132630a8	! t1_data_exp_shm_area+0xa8
	.word	0x8d999f48	! t1_data_exp_shm_area+0xac
	.word	0x9da2e6ff	! t1_data_exp_shm_area+0xb0
	.word	0xad0f3f1b	! t1_data_exp_shm_area+0xb4
	.word	0x599fbcac	! t1_data_exp_shm_area+0xb8
	.word	0x30218777	! t1_data_exp_shm_area+0xbc
	.word	0x81c2363d	! t1_data_exp_shm_area+0xc0 (t1 bload)
	.word	0x7141413d	! t1_data_exp_shm_area+0xc4
	.word	0xb51ee4b3	! t1_data_exp_shm_area+0xc8
	.word	0x55a7d712	! t1_data_exp_shm_area+0xcc
	.word	0x9fd864cf	! t1_data_exp_shm_area+0xd0
	.word	0x3eac2bd0	! t1_data_exp_shm_area+0xd4
	.word	0xaa972f3b	! t1_data_exp_shm_area+0xd8
	.word	0x90ab3fad	! t1_data_exp_shm_area+0xdc
	.word	0x9207c8f2	! t1_data_exp_shm_area+0xe0
	.word	0x7447daf4	! t1_data_exp_shm_area+0xe4
	.word	0x36e874d2	! t1_data_exp_shm_area+0xe8
	.word	0xb3b4653f	! t1_data_exp_shm_area+0xec
	.word	0x2c12c301	! t1_data_exp_shm_area+0xf0
	.word	0x802ff499	! t1_data_exp_shm_area+0xf4
	.word	0x29dd450a	! t1_data_exp_shm_area+0xf8
	.word	0x57953570	! t1_data_exp_shm_area+0xfc
	.word	0xdd738bdc	! t1_data_exp_shm_area+0x100 (t1 bstore)
	.word	0x9192ed57	! t1_data_exp_shm_area+0x104
	.word	0xf7753d0b	! t1_data_exp_shm_area+0x108
	.word	0x8260fdd1	! t1_data_exp_shm_area+0x10c
	.word	0x05068f0f	! t1_data_exp_shm_area+0x110
	.word	0x9666c1c4	! t1_data_exp_shm_area+0x114
	.word	0xcdc9684e	! t1_data_exp_shm_area+0x118
	.word	0x5549b750	! t1_data_exp_shm_area+0x11c
	.word	0xf0fdc333	! t1_data_exp_shm_area+0x120
	.word	0x0b9f710a	! t1_data_exp_shm_area+0x124
	.word	0x86cf69a5	! t1_data_exp_shm_area+0x128
	.word	0x9b4214f4	! t1_data_exp_shm_area+0x12c
	.word	0xd906a494	! t1_data_exp_shm_area+0x130
	.word	0xe5ba0cb3	! t1_data_exp_shm_area+0x134
	.word	0x0b37b07e	! t1_data_exp_shm_area+0x138
	.word	0x982549c5	! t1_data_exp_shm_area+0x13c
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



